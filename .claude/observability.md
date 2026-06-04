# Estándares de Observabilidad — Simetrik

> Stack: Python 3.11+ · OpenTelemetry SDK (raw) · Datadog (APM + Logs + Metrics)

Este archivo se instala como `.claude/observability.md` en cada repo de servicio. Contiene las reglas completas de los tres pilares para auditoría e implementación.

---

## Setup compartido (obligatorio antes de cualquier lógica de negocio)

```python
# observability/setup.py — copiar completo desde docs/02-setup.md

# FastAPI — main.py
from observability.setup import setup_observability
from opentelemetry.instrumentation.fastapi import FastAPIInstrumentor
from fastapi import FastAPI

setup_observability()              # enable_metrics=True si el servicio emite métricas custom
FastAPIInstrumentor.instrument()   # DESPUÉS de setup, ANTES de app = FastAPI()
app = FastAPI()

# Django — apps.py
from observability.setup import setup_observability
from opentelemetry.instrumentation.django import DjangoInstrumentor
setup_observability()
DjangoInstrumentor().instrument()

# Worker
from observability.setup import setup_observability
setup_observability()   # sin enable_metrics salvo que emita métricas custom

# En cada módulo
import logging
from opentelemetry import trace

logger = logging.getLogger(__name__)   # sin wrappers locales, sin basicConfig()
tracer = trace.get_tracer(__name__)
```

**Variables obligatorias** (`KeyError` al arranque si faltan):

| Variable | Formato | Ejemplo |
|----------|---------|---------|
| `OTEL_SERVICE_NAME` | `{project}-{service}` — lowercase, guiones | `lz-landing-zone-engine` |
| `OTEL_ENVIRONMENT` | `production` \| `staging` \| `development` | `production` |
| `OTEL_SERVICE_VERSION` | semver | `1.34.1` |

**Prohibiciones:** nunca `logging.basicConfig()`, nunca `opentelemetry-instrument` en Dockerfile, nunca `TracerProvider` manual.

---

## Pilar 1 — Logging

### Reglas binarias

| Regla | Correcto ✅ | Incorrecto ❌ |
|-------|------------|--------------|
| Logger por módulo | `logging.getLogger(__name__)` | Wrappers locales, logger global |
| Mensaje | `"connection_sync_started"` (snake_case) | `f"Sync started for {workspace_id}"` |
| Contexto | `extra={"workspace_id": str(ws_id)}` | Variable embebida en el mensaje |
| Errores | `logger.error("op_failed", extra={...}, exc_info=True)` | Sin `exc_info=True` |
| Campos reservados | `extra={"user_name": "x"}` | `extra={"name": "x"}` |
| Retries individuales | `retry_counter.add(1, {...})` (métrica) | `logger.warning("Failed attempt 1/5")` |
| Hot path | Log de resumen al final del loop | `logger.info(...)` dentro del loop |
| workspace_id | Siempre en operaciones tenant-específicas | Omitirlo en ops de negocio |

**Campos prohibidos en `extra={}`:** `name`, `message`, `msg`, `levelname`, `filename`, `module`, `funcName`

### Niveles de severidad

| Nivel | Cuándo |
|-------|--------|
| `DEBUG` | Estado interno — deshabilitado en producción |
| `INFO` | Inicio/fin de operaciones de negocio, cambios de estado |
| `WARNING` | Anomalías recuperables: retry exitoso, fallback activado |
| `ERROR` | Operación falló — siempre `exc_info=True` |
| `CRITICAL` | Compromete la estabilidad del sistema |

### Contexto mínimo en `extra`

| Tipo de operación | Campos |
|-------------------|--------|
| Datos de un cliente | `workspace_id` |
| Archivo de un cliente | `workspace_id`, `file_id`, `file_type` |
| ERP de un cliente | `workspace_id`, `entry_id`, `model_id` |
| HTTP saliente | `workspace_id`, `target_service`, `operation_key` |
| Job / task asíncrono | `workspace_id`, `job_id`, `task_type` |
| Job de infraestructura global | `job_name`, `job_type` (sin workspace_id) |

### Implementación completa — FastAPI con middleware

```python
import logging
import time
from fastapi import FastAPI, Request
from fastapi.responses import JSONResponse
from opentelemetry import trace

logger = logging.getLogger(__name__)
tracer = trace.get_tracer(__name__)

@app.middleware("http")
async def logging_middleware(request: Request, call_next):
    start = time.time()
    workspace_id = request.headers.get("X-Workspace-ID", "unknown")
    try:
        response = await call_next(request)
        elapsed = time.time() - start
        if response.status_code >= 500:
            logger.error("http_request_error", extra={
                "workspace_id": workspace_id,
                "http.method": request.method,
                "http.route": request.url.path,
                "http.status_code": response.status_code,
                "duration_ms": round(elapsed * 1000),
            }, exc_info=True)
        elif response.status_code >= 400:
            logger.warning("http_request_client_error", extra={
                "workspace_id": workspace_id,
                "http.method": request.method,
                "http.route": request.url.path,
                "http.status_code": response.status_code,
            })
        return response
    except Exception:
        logger.error("http_request_unhandled_error", extra={
            "workspace_id": workspace_id,
            "http.method": request.method,
        }, exc_info=True)
        return JSONResponse(status_code=500, content={"detail": "Internal server error"})

@app.post("/api/v1/connections/{connection_id}/sync")
async def sync_connection(connection_id: str, workspace_id: str):
    logger.info("connection_sync_started", extra={
        "workspace_id": workspace_id,
        "connection_id": connection_id,
    })
    try:
        result = await _do_sync(connection_id, workspace_id)
        logger.info("connection_sync_completed", extra={
            "workspace_id": workspace_id,
            "connection_id": connection_id,
            "records_synced": result.count,
        })
        return result
    except Exception:
        logger.error("connection_sync_failed", extra={
            "workspace_id": workspace_id,
            "connection_id": connection_id,
        }, exc_info=True)
        raise
```

### Implementación completa — Worker / Celery

```python
import logging
from celery import Task
from opentelemetry import trace

logger = logging.getLogger(__name__)
tracer = trace.get_tracer(__name__)


class ObservableTask(Task):
    def __call__(self, *args, **kwargs):
        task_name = self.name.split(".")[-1]
        with tracer.start_as_current_span(f"task.{task_name}"):
            return super().__call__(*args, **kwargs)


@app.task(base=ObservableTask, bind=True)
def process_files_task(self, workspace_id: str, file_ids: list):
    logger.info("task_started", extra={
        "workspace_id": workspace_id,
        "task_id": self.request.id,
        "file_count": len(file_ids),
    })
    processed, failed = 0, 0
    for file_id in file_ids:
        try:
            _process_file(file_id, workspace_id)
            processed += 1
        except Exception:
            failed += 1
            logger.error("file_processing_failed", extra={
                "workspace_id": workspace_id,
                "task_id": self.request.id,
                "file_id": file_id,
            }, exc_info=True)
    logger.info("task_completed", extra={
        "workspace_id": workspace_id,
        "task_id": self.request.id,
        "processed": processed,
        "failed": failed,
    })
```

### Seguridad — NUNCA en logs

Passwords, API keys, tokens, JWTs, emails completos, IPs de usuario, SSN/CURP, tarjetas completas, payloads de request.

| Dato | Técnica | Resultado |
|------|---------|-----------|
| Email | Hash SHA-256 | `user_email_hash: "sha256:a1b2..."` |
| Tarjeta | BIN + últimos 4 | `"411111****1111"` |
| Token | Primeros 8 chars | `"sk_live_ab12..."` |

---

## Pilar 2 — Métricas

### Criterio

```
¿CUÁNTOS o qué tan RÁPIDO?   → Métrica
¿QUIÉN o POR QUÉ?            → Log
¿DÓNDE en el flujo?          → Trace
```

### Tipos de instrumento

| Instrumento | Cuándo usar |
|-------------|-------------|
| `Counter` | Eventos que solo incrementan |
| `UpDownCounter` | Recursos que se adquieren y liberan |
| `Histogram` | Distribución de valores (latencia, tamaños) |
| `ObservableGauge` | Valor instantáneo por polling |

### Naming — `{namespace}.{entidad}.{accion}[.total]`

| Regla | Correcto ✅ | Incorrecto ❌ |
|-------|------------|--------------|
| Delimitador | `lz.files.processed.total` | `lz_files_processed_total` |
| Lowercase | `http.server.request.duration` | `HTTP.Server.Duration` |
| Unidad en metadata | `name="duration", unit="s"` | `name="duration_seconds"` |
| Sufijo counters | `.total` | `.count` |

**Namespaces:** `lz`, `erp`, `ur`, `http`, `db`, `messaging`

### Unidades UCUM — lista cerrada

| Tipo | Usar | Prohibido |
|------|------|----------|
| Duración | `s` | `ms`, `milliseconds` |
| Tamaño | `By` | `kb`, `MB` |
| Requests | `{request}` | `{req}`, `requests` |
| Errores | `{error}` | `{err}`, `errors` |
| Archivos | `{file}` | `{doc}`, `files` |
| Registros | `{record}` | `{row}` |
| Mensajes | `{message}` | `{msg}`, `{event}` |
| Ratio | `1` | `%`, `percent` |
| Ejecuciones | `{execution}` | `{job}`, `{run}` |
| Entradas ERP | `{entry}` | `{item}` |
| Llamadas API | `{call}` | `{invoke}` |
| Reintentos | `{retry}` | `{attempt}` |
| Acciones usuario | `{action}` | `{op}` |

### Cardinalidad

```
Cardinalidad = |valores_attr_1| × |valores_attr_2| × ...
Costo = Cardinalidad × Multiplicador (Histogram ×5-8, resto ×1)
```

| Cardinalidad | Acción |
|-------------|--------|
| < 1,000 series | Proceder |
| 1,000 – 5,000 | Validar con Cloud Observability |
| > 5,000 | Rediseñar antes de merge |

**Atributos permitidos:** `workspace.id` (< 500), `status` (`success`/`failure`/`timeout`), `exception.type` (5-30), `file.type` (5-10), `http.method` (5-7), `http.route` (parametrizada)

**Atributos prohibidos:** `user.id`, `request.id`, `trace.id`, `email`, `url` (completa), `file.name`, `exception.message`

### Golden Signals (auto-instrumentación — NO crear manualmente)

| Signal | Métrica | Tipo | Unidad |
|--------|---------|------|--------|
| Latency | `http.server.request.duration` | Histogram | `s` |
| Traffic | `http.server.request.total` | Counter | `{request}` |
| Errors | `http.server.errors.total` | Counter | `{error}` |
| Saturation | `http.server.active_requests` | UpDownCounter | `{request}` |

### Implementación completa

```python
import time
import logging
from opentelemetry import metrics as otel_metrics

logger = logging.getLogger(__name__)
meter = otel_metrics.get_meter("lz")

files_processed = meter.create_counter(
    name="lz.files.processed.total",
    description="Total de archivos procesados",
    unit="{file}",
)
processing_duration = meter.create_histogram(
    name="lz.file.processing.duration",
    description="Duración del procesamiento de archivos",
    unit="s",
)
active_executions = meter.create_up_down_counter(
    name="lz.executions.active",
    description="Ejecuciones activas en este momento",
    unit="{execution}",
)


def process_file(workspace_id: str, file_type: str, file_id: str) -> dict:
    base_attrs = {"workspace.id": workspace_id, "file.type": file_type}
    active_executions.add(1, {"workspace.id": workspace_id})
    start = time.monotonic()
    try:
        result = _do_process(file_id)
        files_processed.add(1, {**base_attrs, "status": "success"})
        return result
    except Exception as e:
        files_processed.add(1, {**base_attrs, "status": "failure", "exception.type": type(e).__name__})
        raise
    finally:
        processing_duration.record(time.monotonic() - start, base_attrs)
        active_executions.add(-1, {"workspace.id": workspace_id})   # mismos attrs que add(+1)
```

### Catálogo canónico — métricas existentes

**lz — landing-zone-engine**

| Métrica | Tipo | Unidad | Atributos |
|---------|------|--------|-----------|
| `lz.files.processed.total` | Counter | `{file}` | `workspace.id`, `file.type`, `status` |
| `lz.file.processing.duration` | Histogram | `s` | `workspace.id`, `file.type` |
| `lz.executions.active` | UpDownCounter | `{execution}` | `workspace.id` |
| `lz.connection.errors.total` | Counter | `{error}` | `workspace.id`, `exception.type`, `connection.type` |
| `lz.validation.errors.total` | Counter | `{error}` | `workspace.id`, `exception.type` |

**erp — erp-backend**

| Métrica | Tipo | Unidad | Atributos |
|---------|------|--------|-----------|
| `erp.entries.processed.total` | Counter | `{entry}` | `workspace.id`, `entry.type`, `status` |
| `erp.model.validation.duration` | Histogram | `s` | `workspace.id`, `model.id` |
| `erp.integration.calls.total` | Counter | `{call}` | `workspace.id`, `integration.name`, `status` |
| `erp.entries.retry.total` | Counter | `{retry}` | `workspace.id`, `exception.type` |
| `erp.actions.total` | Counter | `{action}` | `workspace.id`, `action.type`, `status` |

**ur — web-backend**

| Métrica | Tipo | Unidad | Atributos |
|---------|------|--------|-----------|
| `ur.reconciliation.duration` | Histogram | `s` | `workspace.id` |
| `ur.records.reconciled.total` | Counter | `{record}` | `workspace.id`, `status` |
| `ur.executions.total` | Counter | `{execution}` | `workspace.id`, `status` |
| `ur.unreconciled.count` | ObservableGauge | `{record}` | `workspace.id` |
| `ur.source.sync.duration` | Histogram | `s` | `workspace.id`, `source.name` |

---

## Pilar 3 — Tracing

### Reglas binarias

| Regla | Correcto ✅ | Incorrecto ❌ |
|-------|------------|--------------|
| Notación atributos | `workspace.id`, `erp.model.id` | `workspace_id`, `erpModelId` |
| Tipo de valor | `str(workspace_id)` | `workspace_id` (int o UUID) |
| `workspace.id` obligatorio | Primer atributo en todo span de negocio | Span sin `workspace.id` |
| PII | `user.id` (ID opaco) | `user.email`, `user.ip` |
| Máx. atributos | ≤ 20 custom por span | 30+ atributos |
| Error — marcado | `span.set_status(StatusCode.ERROR, str(e))` | Sin `set_status` al fallar |
| Error — stack trace | `span.record_exception(e)` | Solo log sin APM |
| Worker sin span | `tracer.start_as_current_span(f"job.{job_type}")` | Logs sin `trace_id` |
| Kafka/SQS productor | `inject(carrier)` antes de publicar | Sin `traceparent_headers` |
| Kafka/SQS consumidor | `ctx = extract(carrier)` al recibir | Sin extracción |

**Manejo de errores — los tres pasos son obligatorios:**
```python
except Exception as e:
    span.set_attribute("status", "failure")
    span.set_attribute("exception.type", type(e).__name__)
    span.set_status(StatusCode.ERROR, str(e))   # sin esto: span exitoso en APM
    span.record_exception(e)
    raise
```

### Auto-instrumentación

| Librería | Captura |
|----------|---------|
| FastAPI / Django | Requests entrantes |
| httpx / requests | HTTP saliente + propagación W3C |
| psycopg2 / SQLAlchemy | Queries PostgreSQL |
| botocore | AWS (S3, SQS, Lambda) |

**Kafka y SQS NO tienen auto-instrumentación** — usar `inject`/`extract` manual.

### Implementación completa — FastAPI

```python
import logging
from opentelemetry import trace
from opentelemetry.trace import StatusCode

logger = logging.getLogger(__name__)
tracer = trace.get_tracer(__name__)

@app.post("/api/v1/connections/{connection_id}/sync")
async def sync_connection(connection_id: str, workspace_id: str, operation_key: str):
    span = trace.get_current_span()
    span.set_attribute("workspace.id", str(workspace_id))       # obligatorio — primer atributo
    span.set_attribute("connection.id", str(connection_id))
    span.set_attribute("operation.key", operation_key)

    logger.info("connection_sync_started", extra={
        "workspace_id": str(workspace_id),
        "connection_id": str(connection_id),
    })

    try:
        result = await _do_sync(connection_id, workspace_id)
        span.set_attribute("sync.records_processed", str(result.count))
        span.set_attribute("status", "success")
        return result
    except Exception as e:
        span.set_attribute("status", "failure")
        span.set_attribute("exception.type", type(e).__name__)
        span.set_status(StatusCode.ERROR, str(e))
        span.record_exception(e)
        logger.error("connection_sync_failed", extra={
            "workspace_id": str(workspace_id),
            "connection_id": str(connection_id),
        }, exc_info=True)
        raise
```

### Implementación completa — Worker

```python
from opentelemetry import trace
from opentelemetry.trace import StatusCode

tracer = trace.get_tracer(__name__)

def run_scheduled_job(workspace_id: str, job_type: str):
    with tracer.start_as_current_span(f"job.{job_type}") as span:
        span.set_attribute("workspace.id", str(workspace_id))
        span.set_attribute("job.type", job_type)
        span.set_attribute("job.trigger", "scheduled")
        try:
            result = _execute_job(workspace_id, job_type)
            span.set_attribute("job.records_processed", str(result.count))
            span.set_attribute("status", "success")
        except Exception as e:
            span.set_attribute("status", "failure")
            span.set_attribute("exception.type", type(e).__name__)
            span.set_status(StatusCode.ERROR, str(e))
            span.record_exception(e)
            raise
```

### Implementación completa — Kafka Productor

```python
from opentelemetry import trace
from opentelemetry.propagate import inject
from opentelemetry.trace import StatusCode

tracer = trace.get_tracer(__name__)

def publish_event(workspace_id: str, event_type: str, payload: dict):
    with tracer.start_as_current_span("kafka.produce") as span:
        span.set_attribute("workspace.id", str(workspace_id))
        span.set_attribute("messaging.system", "kafka")
        span.set_attribute("event.type", event_type)
        carrier: dict = {}
        inject(carrier)
        message = {
            "workspace_id": workspace_id,
            "event_type": event_type,
            "payload": payload,
            "traceparent_headers": carrier,
        }
        try:
            _kafka_producer.send(topic="lz-events", value=message)
            span.set_attribute("status", "success")
        except Exception as e:
            span.set_attribute("status", "failure")
            span.set_attribute("exception.type", type(e).__name__)
            span.set_status(StatusCode.ERROR, str(e))
            span.record_exception(e)
            raise
```

### Implementación completa — SQS/Kafka Consumidor

```python
from opentelemetry import trace
from opentelemetry.propagate import extract
from opentelemetry.trace import StatusCode

tracer = trace.get_tracer(__name__)

def consume_message(message: dict):
    carrier = message.get("traceparent_headers", {})
    ctx = extract(carrier) if carrier else None
    with tracer.start_as_current_span("queue.message.consume", context=ctx) as span:
        workspace_id = message.get("workspace_id", "unknown")
        span.set_attribute("workspace.id", str(workspace_id))
        span.set_attribute("messaging.system", "sqs")
        span.set_attribute("event.type", message.get("event_type", "unknown"))
        try:
            _process_payload(message["payload"], workspace_id)
            span.set_attribute("status", "success")
        except Exception as e:
            span.set_attribute("status", "failure")
            span.set_attribute("exception.type", type(e).__name__)
            span.set_status(StatusCode.ERROR, str(e))
            span.record_exception(e)
            raise
```

### Queries Datadog

```
# APM — usa deployment.environment
service:lz-landing-zone-engine @deployment.environment:production status:error
@workspace.id:ws_12345

# Logs Explorer — usa service.environment
service:ur-web-backend @service.environment:production
@extra.workspace_id:ws_12345
```

---

## dot.notation — resumen rápido

| Contexto | Convención | Ejemplo |
|----------|------------|---------|
| Mensaje de log | `snake_case` | `"connection_sync_started"` |
| Campos en `extra={}` (negocio) | `snake_case` | `workspace_id`, `file_id` |
| Campos en `extra={}` (HTTP/OTel) | `dot.notation` | `http.method`, `http.route` |
| Atributos de span | `dot.notation` | `workspace.id`, `exception.type` |
| Nombres de métricas | `dot.notation` | `lz.files.processed.total` |
| Atributos de métrica | `dot.notation` | `workspace.id`, `file.type` |
| Valores de atributos OTel | Siempre `str()` | `str(workspace_id)` |

---

## Matriz de decisión — señal correcta por situación

| Situación | Log | Trace | Métrica |
|-----------|:---:|:-----:|:-------:|
| Debugging con contexto de negocio | ✅ | ✅ | |
| Auditoría de acción de usuario | ✅ | | |
| Error rate, p99, throughput | | | ✅ |
| Latencia entre microservicios | | ✅ | |
| Correlacionar eventos entre servicios | ✅ | ✅ | |
| Contar reintentos sin ruido | | | ✅ |
| Saber quién hizo algo | ✅ | ✅ | |
| Profundidad de queue | | | ✅ |
| Evento único | ✅ | | |
