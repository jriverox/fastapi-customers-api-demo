# Checklist — Tracing

> Usado por: `obs-audit-tracing`
> **Leyenda:** 🔴 Obligatorio · 🟡 Recomendado · ⚪ Solo si aplica
> Prerequisito: `.claude/observability/setup.md` (auto-instrumentación).

---

## Auto-instrumentación

| # | Ítem | Clasificación | Cómo verificar |
|---|------|---------------|----------------|
| 2.1 | FastAPI/Django instrumentados con el paquete OTel correspondiente | 🔴 | Import de `FastAPIInstrumentor` o `DjangoInstrumentor` en entrypoint |
| 2.2 | HTTP saliente instrumentado (`httpx` o `requests`) para propagación W3C automática | 🟡 | Dependencias en `requirements.txt` / `pyproject.toml` |
| 2.3 | DB instrumentado (`psycopg2` o `SQLAlchemy`) si el servicio accede a PostgreSQL | 🟡 | Spans de DB visibles en APM sin código manual |
| 2.4 | No se duplica instrumentación que ya provee el SDK (HTTP, DB) con spans manuales redundantes | 🟡 | Revisar spans custom vs auto-instrumentados |

## Spans custom y atributos de negocio

| # | Ítem | Clasificación | Cómo verificar |
|---|------|---------------|----------------|
| 2.5 | Todo span enriquecido con `workspace.id` en operaciones tenant-específicas | 🔴 | APM → abrir un trace → verificar atributo `workspace.id` |
| 2.6 | Atributos custom usan `dot.notation` (`workspace.id`, `connection.id`) | 🔴 | No usar `workspace_id` ni camelCase |
| 2.7 | Valores de atributos siempre como `string` — usar `str()` explícitamente en IDs y valores de negocio | 🔴 | Code review de `set_attribute` — `str(workspace_id)`, `str(connection_id)` |
| 2.8 | Máximo 20 atributos custom por span | 🟡 | Contar atributos en spans de operaciones complejas |
| 2.9 | Sin PII en atributos: no `user.email`, `user.ip`, payloads completos | 🔴 | Grep de campos sensibles en `set_attribute` |
| 2.10 | Atributo `status` con valor canónico: `success`, `failure` o `timeout` | 🟡 | Revisar handlers con lógica de éxito/fallo |
| 2.11 | Operaciones de negocio sin auto-instrumentación usan span manual (`start_as_current_span`) | ⚪ | Jobs, reconciliaciones, procesamiento batch |
| 2.12 | Workers crean span raíz (`job.{tipo}`) o continúan trace del mensaje (`extract`) | ⚪ | Traces de workers visibles en APM |

## Manejo de errores en spans

| # | Ítem | Clasificación | Cómo verificar |
|---|------|---------------|----------------|
| 2.13 | En fallo: `span.set_status(StatusCode.ERROR, str(e))` | 🔴 | Span de error aparece como failed en APM |
| 2.14 | En fallo: `span.record_exception(e)` además del log con `exc_info=True` | 🔴 | Stack trace visible en el span en APM |
| 2.15 | Atributo `exception.type` con nombre de la excepción en spans fallidos | 🟡 | Facet `@exception.type` en APM |

## Correlación log ↔ trace

| # | Ítem | Clasificación | Cómo verificar |
|---|------|---------------|----------------|
| 2.16 | Logs emitidos dentro de un span activo incluyen `trace_id` y `span_id` automáticamente | 🔴 | Log dentro de request HTTP → campos no vacíos |
| 2.17 | `trace_id` vacío en background tasks sin span es comportamiento válido — crear span si se necesita correlación | 🟡 | Documentado en el servicio si aplica |

## Mensajería / HTTP saliente (⚪)

| # | Ítem | Clasificación | Cómo verificar |
|---|------|---------------|----------------|
| 2.18 | Kafka/SQS productor: `inject(carrier)` antes de publicar el mensaje | ⚪ | Trace continúa en el consumidor downstream |
| 2.19 | Kafka/SQS consumidor: `extract(carrier)` al recibir el mensaje | ⚪ | Span hijo del productor en APM |
| 2.20 | Headers de trace propagados en el payload como `traceparent_headers` | ⚪ | Inspeccionar mensaje en staging |

## Validación en Datadog

| # | Ítem | Clasificación | Cómo verificar |
|---|------|---------------|----------------|
| 2.21 | Traces filtrables por `@deployment.environment:staging` | 🔴 | APM Trace Explorer |
| 2.22 | Facet `@workspace.id` permite filtrar por tenant | 🔴 | Query: `@workspace.id:ws_<id>` |
| 2.23 | Atributos del Resource presentes: `service.name`, `deployment.environment` | 🔴 | Panel de atributos del span raíz |
| 2.24 | Spans con error visibles con `status:error` en Trace Explorer | 🔴 | Provocar error controlado → filtrar `status:error` |

## Anti-patrones frecuentes

| ❌ No hacer | ✅ Hacer en su lugar |
|-------------|---------------------|
| `span.set_attribute("workspace_id", id)` | `span.set_attribute("workspace.id", str(id))` |
| `span.set_attribute("workspace.id", 12345)` (int) | `span.set_attribute("workspace.id", str(12345))` |
| `span.set_attribute("user.email", email)` | Omitir — PII prohibida en spans |
| Solo `record_exception(e)` sin `set_status(ERROR)` | Ambos: el span debe marcarse como fallido en APM |
| Publicar en Kafka/SQS sin `inject(carrier)` | Propagar contexto para visibilidad end-to-end |

---

Ver reglas completas en `.claude/observability/tracing.md`.
