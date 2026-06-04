# Tracing — Estándar Simetrik

> **Prerequisito:** `.claude/observability/setup.md` — auto-instrumentación, `get_tracer`, orden de arranque.
> **Verificación:** ver `.claude/observability/checklist-tracing.md` (usar con `obs-audit-tracing`, no con `obs-apply-tracing`).

---

## Regla mnemotécnica

```
¿DÓNDE en el flujo distribuido?  →  Trace
¿QUIÉN o POR QUÉ?               →  Log
¿CUÁNTOS o qué tan RÁPIDO?      →  Métrica
```

---

## 1. Reglas de atributos

| Regla | ✅ Correcto | ❌ Incorrecto |
|-------|------------|--------------|
| `dot.notation` siempre | `workspace.id`, `file.type` | `workspace_id`, `fileType` |
| Valores siempre `str()` | `str(workspace_id)` | `workspace_id` (int/UUID) |
| Sin PII | `user.id` (opaco) | `user.email`, `user.ip` |
| Máximo 20 atributos custom | — | 30+ atributos en un span |
| Sin payloads completos | `request.content_length` | `request.body` |

**Campos siempre prohibidos:** `name`, `message`, `user.email`, `user.ip`, `http.url` con query params.

---

## 2. Manejo de errores — los tres pasos son obligatorios

Sin `set_status(ERROR)` el span aparece como exitoso en APM aunque haya fallado.

```python
except Exception as e:
    span.set_attribute("status", "failure")
    span.set_attribute("exception.type", type(e).__name__)
    span.set_status(StatusCode.ERROR, str(e))
    span.record_exception(e)
    raise
```

---

## 3. Patrones copy-paste

### Enriquecer el span del request HTTP

Los spans HTTP se crean automáticamente. Solo agregar contexto de negocio.

**FastAPI:**

```python
from opentelemetry import trace

@app.post("/api/v1/connections/{connection_id}/sync")
async def sync_connection(connection_id: str, workspace_id: str, operation_key: str):
    span = trace.get_current_span()
    span.set_attribute("workspace.id", str(workspace_id))
    span.set_attribute("connection.id", str(connection_id))
    span.set_attribute("operation.key", operation_key)

    result = await _do_sync(connection_id, workspace_id)

    span.set_attribute("sync.records_processed", str(result.count))
    span.set_attribute("status", "success")
    return result
```

**Django:**

```python
from opentelemetry import trace

class EntryProcessView(View):
    def post(self, request, workspace_id: str):
        span = trace.get_current_span()
        span.set_attribute("workspace.id", str(workspace_id))
        span.set_attribute("user.id", str(request.user.id))
        span.set_attribute("action.type", "entry_process")

        try:
            result = process_entries(workspace_id, request.data)
            span.set_attribute("entries.processed", str(result.count))
            span.set_attribute("status", "success")
            return JsonResponse(result.to_dict())
        except ValidationError as e:
            span.set_attribute("status", "failure")
            span.set_attribute("exception.type", "ValidationError")
            span.set_status(trace.StatusCode.ERROR, str(e))
            span.record_exception(e)
            logger.error("entry_validation_failed", extra={"workspace_id": workspace_id}, exc_info=True)
            return JsonResponse({"error": str(e)}, status=400)
```

> Si `trace.get_current_span()` retorna `NonRecordingSpan`, el SDK no fue inicializado correctamente o la auto-instrumentación no está activa.

### Span manual para sub-operación de negocio

```python
from opentelemetry import trace
from opentelemetry.trace import StatusCode

tracer = trace.get_tracer(__name__)

async def process_reconciliation(workspace_id: str, source_name: str):
    with tracer.start_as_current_span("reconciliation.process") as span:
        span.set_attribute("workspace.id", str(workspace_id))
        span.set_attribute("source.name", source_name)

        try:
            records = await _fetch_records(workspace_id, source_name)
            span.set_attribute("records.fetched", str(len(records)))

            result = await _reconcile(records, workspace_id)
            span.set_attribute("records.reconciled", str(result.reconciled))
            span.set_attribute("status", "success")
            return result

        except Exception as e:
            span.set_attribute("status", "failure")
            span.set_attribute("exception.type", type(e).__name__)
            span.set_status(StatusCode.ERROR, str(e))
            span.record_exception(e)
            raise
```

> Nombre del span en `dot.notation`: `reconciliation.process`, `file.validate`, `erp.entry.sync`.

### Worker / Background Task

Los workers no tienen span activo por defecto — sin un span manual, `trace_id` estará vacío en todos los logs.

**Tarea independiente (sin trace padre):**

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

### Propagación HTTP saliente

`httpx` y `requests` propagan el trace automáticamente via headers W3C cuando el paquete OTel está instalado. Solo enriquecer con contexto de negocio.

```python
import httpx
from opentelemetry import trace

async def call_service(workspace_id: str, connection_id: str, payload: dict):
    span = trace.get_current_span()
    span.set_attribute("workspace.id", str(workspace_id))
    span.set_attribute("target.service", "landing-zone-engine")

    async with httpx.AsyncClient() as client:
        # El header traceparent se inyecta automáticamente
        response = await client.post(
            f"https://lz-api/connections/{connection_id}/sync",
            json=payload,
            timeout=30.0,
        )
    response.raise_for_status()
    span.set_attribute("http.response.status_code", str(response.status_code))
    return response.json()
```

### Kafka — Productor

Kafka no tiene auto-instrumentación OTel en Python. Inyectar contexto manualmente.

```python
from opentelemetry import trace
from opentelemetry.propagate import inject
from opentelemetry.trace import StatusCode

tracer = trace.get_tracer(__name__)

def publish_event(workspace_id: str, event_type: str, payload: dict):
    with tracer.start_as_current_span("kafka.produce") as span:
        span.set_attribute("workspace.id", str(workspace_id))
        span.set_attribute("messaging.system", "kafka")
        span.set_attribute("messaging.operation", "publish")
        span.set_attribute("event.type", event_type)

        carrier: dict = {}
        inject(carrier)  # inyectar trace context en el carrier

        message = {
            "workspace_id": workspace_id,
            "event_type": event_type,
            "payload": payload,
            "traceparent_headers": carrier,  # el consumidor usará extract() sobre este campo
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

> El campo `traceparent_headers` debe incluirse siempre. Sin él, el flujo end-to-end se rompe en Datadog APM.

### SQS / Kafka — Consumidor

```python
from opentelemetry import trace
from opentelemetry.propagate import extract
from opentelemetry.trace import StatusCode

tracer = trace.get_tracer(__name__)

def consume_message(message: dict):
    carrier = message.get("traceparent_headers", {})
    ctx = extract(carrier) if carrier else None
    # ctx=None → nuevo span raíz; ctx=contexto → span hijo del productor

    with tracer.start_as_current_span("queue.message.consume", context=ctx) as span:
        workspace_id = message.get("workspace_id", "unknown")
        span.set_attribute("workspace.id", str(workspace_id))
        span.set_attribute("messaging.system", "sqs")  # o "kafka"
        span.set_attribute("messaging.operation", "receive")
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

---

## 4. Anti-patrones

| ❌ No hacer | ✅ Hacer en su lugar |
|-------------|---------------------|
| `span.set_attribute("workspace_id", id)` | `span.set_attribute("workspace.id", str(id))` |
| `span.set_attribute("workspace.id", 12345)` (int) | `span.set_attribute("workspace.id", str(12345))` |
| `span.set_attribute("user.email", email)` | Omitir — PII prohibida en spans |
| Solo `record_exception(e)` sin `set_status(ERROR)` | Ambos: el span debe marcarse como fallido en APM |
| Publicar en Kafka/SQS sin `inject(carrier)` | Propagar contexto para visibilidad end-to-end |
| Span con `status: success` sin `workspace.id` en operación de cliente | Agregar `workspace.id` en todo span de negocio tenant-específico |
