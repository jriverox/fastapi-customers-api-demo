# Setup de Observabilidad — Simetrik

> Stack: Python 3.11+ · OpenTelemetry SDK (raw) · Datadog (APM + Logs + Metrics)
> Prerequisito obligatorio para logging, tracing y métricas. Leer esto primero.

---

## 1. Paquetes requeridos

Los tres paquetes base son obligatorios:

```
opentelemetry-sdk
opentelemetry-exporter-otlp
opentelemetry-instrumentation-<framework>
```

| Framework / Librería | Paquete de instrumentación |
|----------------------|---------------------------|
| FastAPI | `opentelemetry-instrumentation-fastapi` |
| Django | `opentelemetry-instrumentation-django` |
| httpx (async HTTP) | `opentelemetry-instrumentation-httpx` |
| requests (sync HTTP) | `opentelemetry-instrumentation-requests` |
| psycopg2 / SQLAlchemy | `opentelemetry-instrumentation-psycopg2` / `opentelemetry-instrumentation-sqlalchemy` |
| botocore (AWS) | `opentelemetry-instrumentation-botocore` |

---

## 2. `observability/setup.py` — copiar tal cual

```python
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
    """JSON formatter con inyección automática de trace_id/span_id y schema Simetrik."""

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
    """
    Inicializa TracerProvider, StructuredJSONFormatter y opcionalmente MeterProvider.
    Llamar UNA SOLA VEZ al arranque del servicio, antes de cualquier lógica de negocio.
    """
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

    parts = service_name.split("-", 1)
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
        # Métricas NO son visibles en tiempo real — el primer dato llega hasta 60s desde el inicio
        metric_reader = PeriodicExportingMetricReader(
            OTLPMetricExporter(endpoint=otlp_endpoint),
            export_interval_millis=60_000,
        )
        otel_metrics.set_meter_provider(MeterProvider(resource=resource, metric_readers=[metric_reader]))
```

---

## 3. Invocación en el entrypoint

**FastAPI:**

```python
# main.py — SIEMPRE primero, antes de cualquier import de rutas o handlers
from observability.setup import setup_observability
from opentelemetry.instrumentation.fastapi import FastAPIInstrumentor
from fastapi import FastAPI

setup_observability()                     # enable_metrics=True si el servicio emite métricas custom
app = FastAPI()
FastAPIInstrumentor.instrument_app(app)   # necesario para spans automáticos por request HTTP
```

**Django:**

```python
# apps.py (AppConfig.ready) o manage.py — antes de cargar las apps
from observability.setup import setup_observability
from opentelemetry.instrumentation.django import DjangoInstrumentor

setup_observability()
DjangoInstrumentor().instrument()
```

**Worker / tarea sin framework HTTP:**

```python
# main.py o entrypoint del worker
from observability.setup import setup_observability

setup_observability()
# Sin instrumentor de framework — los spans se crean manualmente.
```

**Obtener logger y tracer en cada módulo:**

```python
import logging
from opentelemetry import trace

logger = logging.getLogger(__name__)   # sin wrappers locales, sin basicConfig()
tracer = trace.get_tracer(__name__)
```

---

## 4. Variables de entorno

Las tres primeras son **obligatorias** — el servicio falla con `KeyError` si faltan.

| Variable | Oblig. | Default | Ejemplo |
|----------|--------|---------|---------|
| `OTEL_SERVICE_NAME` | Sí | — | `lz-landing-zone-engine` |
| `OTEL_ENVIRONMENT` | Sí | — | `production` |
| `OTEL_SERVICE_VERSION` | Sí | — | `1.34.1` |
| `OTEL_COLLECTOR_ENDPOINT` | No | `http://localhost:4317` | `http://otel-collector:4317` |
| `LOG_LEVEL` | No | `INFO` | `DEBUG` |
| `DEPLOYMENT_REGION` | No | `us` | `eu` |

**Formato de `OTEL_SERVICE_NAME`:** `{project-slug}-{service-name}` — solo lowercase y guiones, sin región.

| Servicio | Valor |
|----------|-------|
| landing-zone-engine | `lz-landing-zone-engine` |
| erp-backend | `erp-erp-backend` |
| web-backend | `ur-web-backend` |

---

## 5. Auto-instrumentación disponible

| Librería | Captura automáticamente |
|----------|------------------------|
| FastAPI / Django | Requests entrantes, rutas, status codes |
| httpx / requests | Llamadas HTTP salientes + propagación W3C |
| psycopg2 / SQLAlchemy | Queries PostgreSQL |
| botocore | Llamadas AWS (S3, SQS, Lambda) |

> **Kafka y SQS** no tienen auto-instrumentación — usar `inject`/`extract` manual. Ver `.claude/observability/tracing.md` §5–6.

---

## 6. Anti-patrones de setup

| ❌ Evitar | ✅ Hacer |
|----------|---------|
| `logging.basicConfig(...)` en el código | Nunca llamar — el SDK configura el handler raíz |
| `opentelemetry-instrument` en Dockerfile/CMD | Eliminar — usar solo inicialización en código |
| `setup_observability()` después de crear la app | Llamar antes de cualquier lógica de negocio |
| Llamar `setup_observability()` más de una vez | Lanza `RuntimeError` si ya fue configurado |
| Instrumentor del framework antes del setup | Orden: `setup_observability()` → Instrumentor → crear app |
