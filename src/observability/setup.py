import os

from opentelemetry import metrics as otel_metrics
from opentelemetry import trace
from opentelemetry.exporter.otlp.proto.http.metric_exporter import OTLPMetricExporter
from opentelemetry.exporter.otlp.proto.http.trace_exporter import OTLPSpanExporter
from opentelemetry.instrumentation.logging import LoggingInstrumentor
from opentelemetry.sdk.metrics import MeterProvider
from opentelemetry.sdk.metrics.export import PeriodicExportingMetricReader
from opentelemetry.sdk.resources import Resource
from opentelemetry.sdk.trace import TracerProvider
from opentelemetry.sdk.trace.export import BatchSpanProcessor


def setup_observability(enable_metrics: bool = False) -> None:
    service_name = os.environ["OTEL_SERVICE_NAME"]
    environment = os.environ["OTEL_ENVIRONMENT"]
    service_version = os.environ["OTEL_SERVICE_VERSION"]

    resource = Resource.create({
        "service.name": service_name,
        "deployment.environment": environment,
        "service.version": service_version,
    })

    tracer_provider = TracerProvider(resource=resource)
    tracer_provider.add_span_processor(BatchSpanProcessor(OTLPSpanExporter()))
    trace.set_tracer_provider(tracer_provider)

    LoggingInstrumentor().instrument(set_logging_format=False)

    if enable_metrics:
        meter_provider = MeterProvider(
            resource=resource,
            metric_readers=[PeriodicExportingMetricReader(OTLPMetricExporter())],
        )
        otel_metrics.set_meter_provider(meter_provider)
