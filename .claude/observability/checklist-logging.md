# Checklist — Logging

> Usado por: `obs-audit-logging`
> **Leyenda:** 🔴 Obligatorio · 🟡 Recomendado · ⚪ Solo si aplica
> Prerequisito: revisar también setup compartido (ítems 0.1–0.4) con `.claude/observability/checklist-setup.md`.

---

## Setup y configuración

| # | Ítem | Clasificación | Cómo verificar |
|---|------|---------------|----------------|
| 1.1 | Cada módulo obtiene el logger con `logging.getLogger(__name__)` — sin wrappers locales | 🔴 | Grep: no hay clases/factory propias de logging |
| 1.2 | FastAPI: middleware de logging captura inicio/fin/errores del request (no log en cada endpoint) | 🟡 | Revisar `.claude/observability/logging.md` §6 — Middleware HTTP |
| 1.3 | Workers/Celery: se crea un span activo antes de loguear para tener `trace_id` | ⚪ | Logs del worker muestran `trace_id` no vacío |

## Por cada log emitido

| # | Ítem | Clasificación | Cómo verificar |
|---|------|---------------|----------------|
| 1.4 | El `message` es un evento discreto en `snake_case` (ej. `file_processing_started`) | 🔴 | No hay f-strings ni variables embebidas en el mensaje |
| 1.5 | El contexto de negocio va en `extra={}`, no en el mensaje | 🔴 | Datos como `workspace_id` están en `extra`, no en el texto |
| 1.6 | `workspace_id` presente en `extra` en toda operación tenant-específica | 🔴 | Revisar handlers principales y jobs de negocio |
| 1.7 | Contexto mínimo por tipo de operación cumplido (archivo, ERP, HTTP saliente, job) | 🟡 | Tabla en `.claude/observability/logging.md` §3 |
| 1.8 | Nivel de severidad correcto según la matriz de decisión | 🔴 | ERROR solo si la operación falló; WARNING solo si hubo anomalía recuperable |
| 1.9 | Todo `logger.error(...)` y `logger.critical(...)` incluye `exc_info=True` | 🔴 | Grep de `logger.error` sin `exc_info=True` |
| 1.10 | Reintentos fallidos individuales **no** se loguean — se cuentan con métrica | 🟡 | Política de ruido cero en retries |
| 1.11 | Fallo definitivo tras max retries → `logger.error(..., exc_info=True)` | 🔴 | Revisar lógica de retry del servicio |
| 1.12 | Hot paths (loops, middleware): máximo 1 log informativo por 1.000 ejecuciones | 🟡 | No hay `logger.info` dentro de loops por elemento |
| 1.13 | Sin campos reservados en `extra`: `name`, `message`, `msg`, `levelname`, `filename`, `module`, `funcName` | 🔴 | Code review de todos los `extra={}` |

## Seguridad y datos sensibles

| # | Ítem | Clasificación | Cómo verificar |
|---|------|---------------|----------------|
| 1.14 | Sin PII en logs: emails completos, IPs de usuario, SSN, tarjetas, tokens, JWTs | 🔴 | Buscar campos sensibles en `extra` |
| 1.15 | Datos sensibles enmascarados o hasheados cuando son necesarios (email → hash, tarjeta → BIN+****) | 🔴 | Tabla de técnicas en `.claude/observability/logging.md` §5 |
| 1.16 | Logs de auditoría usan `audit: True` en `extra` para retención extendida | ⚪ | Solo acciones privilegiadas de usuario |

## Validación en Datadog

| # | Ítem | Clasificación | Cómo verificar |
|---|------|---------------|----------------|
| 1.17 | Output JSON con campos `level`, `message`, `service.name`, `service.environment` | 🔴 | Logs Explorer → expandir un log |
| 1.18 | Filtrar por ambiente con `@service.environment:staging` (no `deployment.environment` en logs) | 🔴 | Query en Logs Explorer |
| 1.19 | Campo `exception{}` presente en logs ERROR con `type`, `message` y `traceback` | 🔴 | Provocar un error controlado en staging |
| 1.20 | `trace_id` presente en logs emitidos dentro de un request HTTP | 🔴 | Correlación log ↔ trace en Datadog |

## Anti-patrones frecuentes

| ❌ No hacer | ✅ Hacer en su lugar |
|-------------|---------------------|
| `logger.info(f"Processing workspace {id}")` | `logger.info("processing_started", extra={"workspace_id": str(id)})` |
| `logger.error(f"Error: {e}")` sin stack trace | `logger.error("op_failed", extra={...}, exc_info=True)` |
| `logger.info("sync_completed")` sin tenant | Incluir siempre `workspace_id` en `extra` en operaciones tenant-específicas |
| `logger.warning("Failed attempt 1/5")` en cada retry | Intento fallido → métrica; fallo final → `logger.error` |
| Contar logs en Datadog para obtener rates | Usar Counter/Histogram OTel |
| `extra={"name": "service_a"}` | `extra={"service_name": "service_a"}` — evitar campos reservados |

---

Ver reglas completas en `.claude/observability/logging.md`.
