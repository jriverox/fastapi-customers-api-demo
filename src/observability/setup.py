# observability/setup.py
import json
import logging
import os
from datetime import datetime, timezone

from opentelemetry import metrics as otel_metrics, trace
from opentelemetry.exporter.otlp.proto.grpc.metric_exporter import OTLPMetricExporter
from opentelemetry.exporter.otlp.proto.grpc.trace_exporter import OTLPSpanExporter
from opentelemetry.sdk.metrics import MeterProvider
from opentelemetry.sdk.metrics.export import PeriodicExportingMetricReader
from opentelemetry.sdk.resources import Resource
from opentelemetry.sdk.trace import TracerProvider
from opentelemetry.sdk.trace.export import BatchSpanProcessor


class StructuredJSONFormatter(logging.Formatter):
    def __init__(self, service_name: str, environment: str) -> None:
        super().__init__()
        self._service_meta = {
            "name": service_name,
            "environment": environment,
            "region": os.environ.get("DEPLOYMENT_REGION", "us"),
        }

    def format(self, record: logging.LogRecord) -> str:
        ctx = trace.get_current_span().get_span_context()
        valid = ctx is not None and ctx.is_valid
        entry: dict = {
            "timestamp": datetime.now(timezone.utc).isoformat(timespec="microseconds").replace("+00:00", "Z"),
            "level": record.levelname,
            "logger": record.name,
            "message": record.getMessage(),
            "service": self._service_meta,
            "simetrik": {
                "observability": {"library": {"name": "opentelemetry-sdk", "language": "python"}}
            },
            "trace_id": format(ctx.trace_id, "032x") if valid else "",
            "span_id": format(ctx.span_id, "016x") if valid else "",
        }
        if record.exc_info and record.exc_info[0] is not None:
            import traceback as tb
            tb_frames = tb.format_tb(record.exc_info[2])[-50:] if record.exc_info[2] else []
            entry["exception"] = {
                "type": record.exc_info[0].__name__,
                "message": str(record.exc_info[1])[:1000],
                "traceback": "".join(tb_frames),
            }
        _std = logging.LogRecord(None, None, "", 0, "", [], None).__dict__
        extra = {
            k: v for k, v in record.__dict__.items()
            if k not in _std and k not in ("exc_info", "exc_text", "stack_info", "message", "msg", "args")
        }
        if extra:
            entry["extra"] = extra
        return json.dumps(entry, default=str)


def setup_observability(enable_metrics: bool = False) -> None:
    if trace.get_tracer_provider().__class__.__name__ != "ProxyTracerProvider":
        raise RuntimeError(
            "OpenTelemetry ya fue configurado. "
            "Verificar que setup_observability() se llama solo una vez al arranque "
            "y que opentelemetry-instrument CLI no está activo."
        )

    service_name = os.environ["OTEL_SERVICE_NAME"]
    environment = os.environ["OTEL_ENVIRONMENT"]
    otlp_endpoint = os.environ.get("OTEL_COLLECTOR_ENDPOINT", "http://localhost:4317")
    service_version = os.environ["OTEL_SERVICE_VERSION"]
    log_level = getattr(logging, os.environ.get("LOG_LEVEL", "INFO").upper(), logging.INFO)

    resource = Resource.create({
        "service.name": service_name,
        "service.version": service_version,
        "deployment.environment": environment,
        "env": environment,
    })

    tracer_provider = TracerProvider(resource=resource)
    tracer_provider.add_span_processor(
        BatchSpanProcessor(OTLPSpanExporter(endpoint=otlp_endpoint))
    )
    trace.set_tracer_provider(tracer_provider)

    root = logging.getLogger()
    root.setLevel(log_level)
    for h in root.handlers[:]:
        root.removeHandler(h)
    handler = logging.StreamHandler()
    handler.setFormatter(StructuredJSONFormatter(service_name=service_name, environment=environment))
    root.addHandler(handler)

    if enable_metrics:
        metric_reader = PeriodicExportingMetricReader(
            OTLPMetricExporter(endpoint=otlp_endpoint),
            export_interval_millis=60_000,
        )
        otel_metrics.set_meter_provider(MeterProvider(resource=resource, metric_readers=[metric_reader]))
