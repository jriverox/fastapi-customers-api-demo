# Logging — Estándar Simetrik

> **Prerequisito:** `.claude/observability/setup.md` debe completarse antes de implementar logging.
> **Verificación:** ver `.claude/observability/checklist-logging.md` (usar con `obs-audit-logging`, no con `obs-apply-logging`).

---

## Regla mnemotécnica

```
¿QUIÉN o POR QUÉ?  →  Log
¿CUÁNTOS?          →  Métrica
¿DÓNDE en el flujo? →  Trace
```

---

## 1. Niveles de severidad

| Nivel | Cuándo usar | Producción |
|-------|-------------|------------|
| **DEBUG** | Valores de variables, estado interno | Deshabilitado (solo en incidentes con aprobación) |
| **INFO** | Inicio/fin de operaciones, cambios de estado | Habilitado |
| **WARNING** | Anomalías recuperables: retries exitosos, fallbacks | Habilitado |
| **ERROR** | Fallos que impiden completar la operación — siempre con `exc_info=True` | Habilitado + alertas |
| **CRITICAL** | Compromete la estabilidad del sistema | Habilitado + alertas + PagerDuty |

**Matriz de decisión:**

```
¿El sistema puede continuar operando?   → No  → CRITICAL
¿La operación pudo completarse?         → No  → ERROR
¿Hubo algo anómalo o inesperado?        → Sí  → WARNING
¿Es información de debugging técnico?   → Sí  → DEBUG
Caso contrario                          →      INFO
```

---

## 2. Schema del log

### Naming de campos

| Contexto | Convención |
|----------|------------|
| Campos raíz | `snake_case` — `timestamp`, `level`, `message` |
| Campos negocio en `extra{}` | `snake_case` — `workspace_id`, `operation_key` |
| Campos HTTP/OTel en `extra{}` | `dot.notation` — `http.method`, `http.route` |

### Campos obligatorios (inyectados automáticamente por el SDK)

| Campo | Descripción |
|-------|-------------|
| `timestamp` | ISO 8601 UTC con microsegundos |
| `level` | `DEBUG`, `INFO`, `WARNING`, `ERROR`, `CRITICAL` |
| `logger` | Nombre del módulo vía `logging.getLogger(__name__)` |
| `message` | Evento discreto en `snake_case`, max 500 chars |
| `service.name` | `{project}-{service}` — vía `OTEL_SERVICE_NAME` |
| `service.environment` | `production`, `staging`, `development` |
| `trace_id` | 32 hex — vacío fuera de span activo (comportamiento normal) |
| `span_id` | 16 hex — vacío fuera de span activo |

### Campos de `exception{}` — obligatorios cuando `level >= ERROR`

| Key | Límite |
|-----|--------|
| `type` | Nombre de la clase de excepción |
| `message` | Max 1,000 chars |
| `traceback` | Max 50 frames |

### Campos reservados — NO usar en `extra={}`

`name`, `message`, `msg`, `levelname`, `filename`, `module`, `funcName`

### Schema de referencia

```jsonc
{
  "timestamp": "2026-02-04T10:30:00.123456Z",
  "level": "ERROR",
  "logger": "app.service.handler",
  "message": "landing_zone_request_failed",     // snake_case, max 500 chars
  "service": {
    "name": "lz-landing-zone-engine",
    "environment": "production",
    "region": "us"
  },
  "trace_id": "abc123def456789012345678901234ab",
  "span_id": "1234567890abcdef",
  "exception": {                         // obligatorio cuando level >= ERROR
    "type": "ConnectionTimeout",
    "message": "External service did not respond within 30000ms",
    "traceback": "ConnectionTimeout: ...\n  at ..."
  },
  "extra": {
    "workspace_id": "ws_12345",          // incluir siempre en operaciones multi-tenant
    "connection_id": "conn_xyz789",
    "operation_key": "sync_data"
  }
}
```

> **¿Por qué no hay `http{}`, `db{}` ni `messaging{}`?** Ese contexto ya vive en el span asociado. Duplicarlo incrementa costo de indexación. Navegar al span desde el `trace_id`.

---

## 3. Contexto de negocio — cuándo incluir `workspace_id`

`workspace_id` es **obligatorio** en operaciones tenant-específicas.

| Tipo de operación | `workspace_id` | Contexto mínimo en `extra` |
|-------------------|:--------------:|---------------------------|
| Acción sobre datos de un cliente | ✅ | `workspace_id` |
| Operación sobre archivo de un cliente | ✅ | `workspace_id`, `file_id`, `file_type` |
| Operación ERP de un cliente | ✅ | `workspace_id`, `entry_id`, `model_id` |
| Llamada HTTP saliente en contexto de cliente | ✅ | `workspace_id`, `target_service`, `operation_key` |
| Job / task asíncrono de un cliente | ✅ | `workspace_id`, `job_id`, `task_type` |
| Job de infraestructura / plataforma global | ❌ | `job_name`, `job_type` |
| Health check, startup, shutdown | ❌ | `version`, `environment` |
| Migración cross-tenant | ❌ | `migration_id`, `target_table` |

---

## 4. Retries — política de ruido cero

| Evento | Señal correcta |
|--------|----------------|
| Intento fallido individual | Métrica `retry_counter.add(1, {...})` — sin log |
| Retry exitoso tras N intentos | `logger.info("operation_succeeded_after_retry", extra={"total_attempts": N, ...})` |
| Fallo definitivo tras max retries | `logger.error("operation_failed_after_max_retries", extra={...}, exc_info=True)` |

---

## 5. Seguridad y datos sensibles

**Nunca loguear:** passwords, API keys, tokens, JWTs, emails completos, IPs de usuario, SSN/CURP, números de tarjeta, payloads completos.

| Dato | Técnica | Qué loguear |
|------|---------|-------------|
| Tarjeta de crédito | Truncamiento | `411111****1111` |
| Email | Hash SHA-256 | `user_email_hash: "sha256:a1b2c3..."` |
| Token / API key | Truncamiento | `"sk_live_ab12..."` (primeros 8 + `...`) |

```python
import hashlib

# ✅ Email hasheado
email_hash = hashlib.sha256(email.encode()).hexdigest()[:16]
logger.info("user_login", extra={"user_email_hash": email_hash})

# ✅ Request — solo metadatos, nunca el body
extra = {
    "http.method": "POST",
    "http.route": "/api/v1/users",
    "content_length": 1234,
    "fields_present": ["name", "email"],  # solo nombres, nunca valores
}
```

---

## 6. Patrones copy-paste

### Middleware HTTP (FastAPI)

```python
import logging
import time
from fastapi import Request
from fastapi.responses import JSONResponse

logger = logging.getLogger(__name__)

@app.middleware("http")
async def logging_middleware(request: Request, call_next):
    start = time.time()
    workspace_id = request.headers.get("X-Workspace-ID", "unknown")

    try:
        response = await call_next(request)
        elapsed = time.time() - start

        if response.status_code >= 400:
            level = "error" if response.status_code >= 500 else "warning"
            getattr(logger, level)(
                "http_request_failed",
                extra={
                    "workspace_id": workspace_id,
                    "http.method": request.method,
                    "http.route": request.url.path,
                    "http.status_code": response.status_code,
                    "duration_ms": round(elapsed * 1000),
                }
            )
        return response

    except Exception as e:
        logger.error(
            "http_request_error",
            extra={
                "workspace_id": workspace_id,
                "http.method": request.method,
                "http.route": request.url.path,
                "duration_ms": round(elapsed * 1000),
            },
            exc_info=True,
        )
        return JSONResponse(status_code=500, content={"detail": "Internal server error"})
```

### Worker / Celery Task

```python
import logging
from celery import Task
from opentelemetry import trace

logger = logging.getLogger(__name__)
tracer = trace.get_tracer(__name__)


class ObservableTask(Task):
    """Base task con logging y tracing integrados. Heredar en lugar de Task."""

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
        except Exception as e:
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
        "success_rate": round(processed / len(file_ids) * 100, 1) if file_ids else 0,
    })
```

### Llamada HTTP saliente

```python
import logging
import httpx

logger = logging.getLogger(__name__)


async def call_landing_zone_api(workspace_id: str, connection_id: str, operation_key: str, payload: dict) -> dict:
    logger.info("external_service_call_started", extra={
        "workspace_id": workspace_id,
        "connection_id": connection_id,
        "operation_key": operation_key,
        "target_service": "landing-zone-engine",
    })

    try:
        async with httpx.AsyncClient() as client:
            response = await client.post(
                f"https://lz-api/connections/{connection_id}/sync",
                json=payload,
                timeout=30.0,
            )
            response.raise_for_status()

        logger.info("external_service_call_completed", extra={
            "workspace_id": workspace_id,
            "connection_id": connection_id,
            "operation_key": operation_key,
            "target_service": "landing-zone-engine",
            "http.status_code": response.status_code,
        })
        return response.json()

    except httpx.TimeoutException:
        logger.error("external_service_timeout", extra={
            "workspace_id": workspace_id,
            "connection_id": connection_id,
            "target_service": "landing-zone-engine",
            "timeout_ms": 30000,
        }, exc_info=True)
        raise

    except httpx.HTTPStatusError as e:
        logger.error("external_service_error", extra={
            "workspace_id": workspace_id,
            "connection_id": connection_id,
            "target_service": "landing-zone-engine",
            "http.status_code": e.response.status_code,
        }, exc_info=True)
        raise
```

### Operación de base de datos

```python
import logging

logger = logging.getLogger(__name__)


async def create_entry(workspace_id: str, entry_type: str, model_id: str, data: dict):
    try:
        entry = await db.execute("INSERT INTO entries ...", {...})
        logger.info("entry_created", extra={
            "workspace_id": workspace_id,
            "entry_id": str(entry.id),
            "entry_type": entry_type,
            "model_id": model_id,
            # No incluir `data` — puede contener PII
        })
        return entry
    except Exception as e:
        logger.error("entry_creation_failed", extra={
            "workspace_id": workspace_id,
            "entry_type": entry_type,
            "model_id": model_id,
        }, exc_info=True)
        raise
```

### Integración externa (ERP, Webhook)

`correlation_id` se usa **solo** para integraciones con sistemas externos que no hablan OTel.

```python
async def sync_erp_integration(workspace_id: str, integration_name: str, external_reference_id: str) -> dict:
    logger.info("erp_integration_sync_started", extra={
        "workspace_id": workspace_id,
        "integration_name": integration_name,
        "correlation_id": external_reference_id,
    })
    # ... lógica ...
```

### Auditoría — acciones de usuario privilegiado

```python
def log_audit_event(workspace_id, user_id, action, resource_type, resource_id, outcome, metadata=None):
    logger.info("audit_event", extra={
        "workspace_id": workspace_id,
        "user_id": user_id,
        "action": action,
        "resource_type": resource_type,
        "resource_id": resource_id,
        "outcome": outcome,          # "success" | "failure" | "denied"
        "audit": True,               # flag para retención 7 años
        **(metadata or {}),
    })
```

### AWS Batch — exit codes estructurados

```python
import sys
from enum import IntEnum

class ExitCode(IntEnum):
    SUCCESS = 0
    FAILED_FILES = 120
    FAILED_NETWORK = 130
    FAILED_MEMORY = 140
    FAILED_TIMEOUT = 150
    FAILED_CONFIG = 180
    FAILED = 200

class ExitCodeManager:
    def __init__(self, workspace_id: str, job_name: str):
        self.workspace_id = workspace_id
        self.job_name = job_name

    def exit_with_code(self, exit_code: int, error_type: str, description: str = ""):
        is_failure = exit_code != ExitCode.SUCCESS
        getattr(logger, "error" if is_failure else "info")(
            "batch_job_exit",
            extra={
                "workspace_id": self.workspace_id,
                "job_name": self.job_name,
                "exit_code": exit_code,
                "error_type": error_type,
                "MONITORING_EXIT_CODE": exit_code,
                "MONITORING_ERROR_TYPE": error_type,
            },
        )
        sys.exit(exit_code)
```

---

## 7. Anti-patrones

| ❌ Evitar | ✅ Hacer |
|----------|---------|
| `logger.info(f"Processing workspace {id}")` | `logger.info("processing_started", extra={"workspace_id": str(id)})` |
| `logger.error("Error occurred")` sin `exc_info=True` | `logger.error("op_failed", extra={...}, exc_info=True)` |
| `logger.warning("Failed attempt 1/5")` en cada retry | Métrica para intentos — log solo en fallo definitivo |
| `extra={"name": "test"}` | `extra={"user_name": "test"}` — evitar campos reservados |
| `logger.info("sync_completed")` sin `workspace_id` | Incluir `workspace_id` en toda operación tenant-específica |
| Contar logs en Datadog para obtener rates | Usar métricas OTel |
