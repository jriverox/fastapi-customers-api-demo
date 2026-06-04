# Informe de Auditoría de Observabilidad

**Servicio:** fastapi-customers-api-poc  
**Scope:** `src/**/*.py` (10 archivos)  
**Fecha:** 2026-06-04  
**Auditor:** obs-audit (Simetrik)

---

## 1. Resumen ejecutivo

### Conteo por severidad

| Severidad | Cantidad |
|-----------|----------|
| CRÍTICO   | 14       |
| ALTO      | 6        |
| MEDIO     | 4        |
| BAJO      | 0        |
| **Total hallazgos** | **24** |

### Conteo por pilar

| Pilar    | CRÍTICO | ALTO | MEDIO | BAJO | Total |
|----------|---------|------|-------|------|-------|
| Setup    | 8       | 2    | 2     | 0    | 12    |
| Logging  | 3       | 2    | 1     | 0    | 6     |
| Métricas | 2       | 0    | 0     | 0    | 2     |
| Tracing  | 1       | 2    | 1     | 0    | 4     |

### Estado general

El servicio **no tiene observabilidad operativa**. El módulo `src/observability/setup.py` fue eliminado pero `src/observability/__init__.py` aún lo importa (import roto). `main.py` no invoca `setup_observability()` ni `FastAPIInstrumentor`. Las rutas de negocio no emiten logs estructurados ni enriquecen spans. Las dependencias OTel están declaradas en `pyproject.toml` pero no conectadas al runtime.

**Ítems 🔴 evaluados:** 52 · **Pass:** 8 · **Fail:** 44 (incluye ítems de validación runtime inferidos como fail por ausencia de wiring)

---

## 2. Hallazgos detallados

### CRÍTICO

---

#### H-01 · Setup · 0.1

- **Archivo:Línea:** `src/main.py:1-29`
- **Regla incumplida:** 0.1 — `setup_observability()` debe invocarse en el entrypoint antes de cualquier lógica de negocio
- **Severidad:** CRÍTICO

**Código actual:**

```python
import asyncio
import uvicorn
from contextlib import asynccontextmanager
from fastapi import FastAPI
from .settings import settings
# ... imports de database, models, routes ...
app = FastAPI(...)
```

**Ejemplo correcto:**

```python
from observability.setup import setup_observability
from opentelemetry.instrumentation.fastapi import FastAPIInstrumentor

setup_observability()
app = FastAPI(...)
FastAPIInstrumentor.instrument_app(app)
```

---

#### H-02 · Setup · 0.1 (módulo roto)

- **Archivo:Línea:** `src/observability/__init__.py:1`
- **Regla incumplida:** 0.1 — módulo de setup inexistente
- **Severidad:** CRÍTICO

**Código actual:**

```python
from .setup import setup_observability
```

**Ejemplo correcto:** Restaurar `src/observability/setup.py` con la implementación canónica de `.cursor/rules/setup.mdc` (clase `StructuredJSONFormatter` + función `setup_observability`).

---

#### H-03 · Setup · 0.2

- **Archivo:Línea:** `src/main.py:21-29`
- **Regla incumplida:** 0.2 — auto-instrumentación después de setup y antes/después de crear app según patrón FastAPI
- **Severidad:** CRÍTICO

**Código actual:**

```python
app = FastAPI(
    title="Customers API",
    ...
)
app.include_router(healthcheck.router, ...)
```

**Ejemplo correcto:**

```python
setup_observability()
app = FastAPI(...)
FastAPIInstrumentor.instrument_app(app)
```

---

#### H-04 · Setup · 0.13

- **Archivo:Línea:** `src/main.py:1-46`
- **Regla incumplida:** 0.13 — servicio debe arrancar sin errores de observabilidad
- **Severidad:** CRÍTICO

**Código actual:** Sin inicialización OTel; `src/observability/setup.py` ausente provoca `ModuleNotFoundError` si se intenta importar.

**Ejemplo correcto:** Completar setup (H-01, H-02) y verificar startup en staging sin excepciones de OTel.

---

#### H-05 · Setup · 0.14

- **Archivo:Línea:** `src/main.py:1-46`
- **Regla incumplida:** 0.14 — logs JSON visibles en Datadog con `service.name` correcto
- **Severidad:** CRÍTICO

**Código actual:** No hay `StructuredJSONFormatter` ni handler JSON configurado.

**Ejemplo correcto:** El handler raíz configurado por `setup_observability()` con salida JSON incluyendo `service.name` y `service.environment`.

---

#### H-06 · Setup · 0.15

- **Archivo:Línea:** `src/main.py:1-46`
- **Regla incumplida:** 0.15 — traces visibles en Datadog APM
- **Severidad:** CRÍTICO

**Código actual:** Sin `TracerProvider`, exportador OTLP ni `FastAPIInstrumentor`.

**Ejemplo correcto:**

```python
setup_observability()
FastAPIInstrumentor.instrument_app(app)
```

---

#### H-07 · Setup · 0.16

- **Archivo:Línea:** `src/main.py:1-46`
- **Regla incumplida:** 0.16 — correlación log ↔ trace vía `trace_id`
- **Severidad:** CRÍTICO

**Código actual:** Sin tracing activo; logs no incluirían `trace_id`/`span_id`.

**Ejemplo correcto:** Formatter JSON que lee `trace.get_current_span().get_span_context()` (implementado en `setup.py` canónico).

---

#### H-08 · Logging · 1.17

- **Archivo:Línea:** `src/main.py:1-46`
- **Regla incumplida:** 1.17 — output JSON con `level`, `message`, `service.name`, `service.environment`
- **Severidad:** CRÍTICO

**Código actual:** Logging por defecto de Python (texto plano) o sin handler configurado.

**Ejemplo correcto:** `StructuredJSONFormatter` del SDK con campos:

```json
{
  "level": "INFO",
  "message": "health_check_completed",
  "service": {"name": "...", "environment": "..."}
}
```

---

#### H-09 · Logging · 1.20

- **Archivo:Línea:** `src/routes/customer.py:18-79`
- **Regla incumplida:** 1.20 — `trace_id` presente en logs dentro de request HTTP
- **Severidad:** CRÍTICO

**Código actual:** Endpoints sin logs; sin span activo por falta de instrumentación.

**Ejemplo correcto:** Emitir logs dentro del request HTTP instrumentado para que el formatter inyecte `trace_id` automáticamente.

---

#### H-10 · Métricas · 3.17

- **Archivo:Línea:** `src/main.py:1-46`
- **Regla incumplida:** 3.17 — Golden Signals (latency, traffic, errors, saturation) vía auto-instrumentación
- **Severidad:** CRÍTICO

**Código actual:** Sin `FastAPIInstrumentor`; métricas `http.server.*` no se generan.

**Ejemplo correcto:** `FastAPIInstrumentor.instrument_app(app)` tras `setup_observability(enable_metrics=True)` si se requieren métricas custom además de las auto-instrumentadas.

---

#### H-11 · Métricas · 3.25

- **Archivo:Línea:** `src/main.py:1-46`
- **Regla incumplida:** 3.25 — métricas visibles en Metrics Explorer ~60 s post-deploy
- **Severidad:** CRÍTICO

**Código actual:** Sin `MeterProvider` ni exportador de métricas configurado.

**Ejemplo correcto:** `setup_observability(enable_metrics=True)` con `PeriodicExportingMetricReader`.

---

#### H-12 · Métricas · 3.26

- **Archivo:Línea:** `src/main.py:1-46`
- **Regla incumplida:** 3.26 — tags `service.name` y `deployment.environment` en métricas
- **Severidad:** CRÍTICO

**Código actual:** Resource OTel no configurado.

**Ejemplo correcto:**

```python
resource = Resource.create({
    "service.name": service_name,
    "deployment.environment": environment,
})
```

---

#### H-13 · Tracing · 2.1

- **Archivo:Línea:** `src/main.py:1-46`
- **Regla incumplida:** 2.1 — FastAPI instrumentado con paquete OTel correspondiente
- **Severidad:** CRÍTICO

**Código actual:** Sin import ni uso de `FastAPIInstrumentor` (a pesar de estar en `pyproject.toml`).

**Ejemplo correcto:**

```python
from opentelemetry.instrumentation.fastapi import FastAPIInstrumentor
FastAPIInstrumentor.instrument_app(app)
```

---

#### H-14 · Tracing · 2.16

- **Archivo:Línea:** `src/routes/healthcheck.py:9-11`
- **Regla incumplida:** 2.16 — logs dentro de span activo incluyen `trace_id` y `span_id`
- **Severidad:** CRÍTICO

**Código actual:**

```python
@router.get("/health")
async def health_check():
    return {"status": "healthy"}
```

**Ejemplo correcto:**

```python
@router.get("/health")
async def health_check():
    logger.info("health_check_completed", extra={"version": "1.0.0", "environment": settings.OTEL_ENVIRONMENT})
    return {"status": "healthy"}
```

(Requiere H-03 + H-13 para que `trace_id` se inyecte automáticamente.)

---

### ALTO

---

#### H-15 · Setup · 0.10

- **Archivo:Línea:** `src/settings.py:24`
- **Regla incumplida:** 0.10 — `OTEL_COLLECTOR_ENDPOINT` apunta al collector correcto
- **Severidad:** ALTO

**Código actual:**

```python
OTEL_EXPORTER_OTLP_ENDPOINT: str = "http://localhost:4318"
```

**Ejemplo correcto:**

```python
# En settings y setup canónico:
OTEL_COLLECTOR_ENDPOINT  # default http://localhost:4317 (gRPC)
otlp_endpoint = os.environ.get("OTEL_COLLECTOR_ENDPOINT", "http://localhost:4317")
```

Nota: nombre de variable y puerto difieren del estándar (`4317` gRPC vs `4318` HTTP).

---

#### H-16 · Setup · 0.6 / 0.7

- **Archivo:Línea:** `src/settings.py:21-22`
- **Regla incumplida:** 0.6 — formato `{project}-{service}` · 0.7 — solo lowercase y guiones, mínimo 2 segmentos
- **Severidad:** ALTO

**Código actual:**

```python
OTEL_SERVICE_NAME: str
OTEL_ENVIRONMENT: str
```

**Ejemplo correcto:**

```python
OTEL_SERVICE_NAME: str  # ej. "demos-customers-api"
# Validación en Settings:
@field_validator("OTEL_SERVICE_NAME")
def validate_service_name(cls, v: str) -> str:
    if not re.fullmatch(r"[a-z0-9]+(-[a-z0-9]+)+", v):
        raise ValueError("Formato requerido: {project}-{service}")
    return v
```

---

#### H-17 · Logging · 1.1

- **Archivo:Línea:** `src/routes/customer.py:1-79`, `src/repositories/customer_repository.py:1-57`
- **Regla incumplida:** 1.1 — cada módulo obtiene logger con `logging.getLogger(__name__)`
- **Severidad:** ALTO

**Código actual:** Sin declaración de `logger` en módulos de rutas y repositorio.

**Ejemplo correcto:**

```python
import logging
logger = logging.getLogger(__name__)
```

---

#### H-18 · Logging · 1.6

- **Archivo:Línea:** `src/routes/customer.py:38-58`, `src/routes/customer.py:61-79`
- **Regla incumplida:** 1.6 — `workspace_id` en `extra` en operaciones tenant-específicas (acciones sobre datos de cliente)
- **Severidad:** ALTO

**Código actual:**

```python
@router.post("/", response_model=CustomerResponse, status_code=201)
async def create_customer(customer: CustomerCreate, repository: ...):
    new_id = await repository.get_next_id()
    # ... sin logging ...
    return await repository.create_customer(new_customer)
```

**Ejemplo correcto:**

```python
logger.info("customer_create_started", extra={
    "workspace_id": str(workspace_id),
    "customer_id": new_id,
})
# ...
logger.info("customer_create_completed", extra={
    "workspace_id": str(workspace_id),
    "customer_id": new_customer.id,
})
```

---

#### H-19 · Logging · 1.18

- **Archivo:Línea:** `src/main.py:1-46`
- **Regla incumplida:** 1.18 — filtrar logs por `@service.environment:staging`
- **Severidad:** ALTO

**Código actual:** Sin formatter JSON; campo `service.environment` no se emite.

**Ejemplo correcto:** `StructuredJSONFormatter` con `"service": {"name": ..., "environment": environment}`.

---

#### H-20 · Tracing · 2.5

- **Archivo:Línea:** `src/routes/customer.py:18-79`
- **Regla incumplida:** 2.5 — spans enriquecidos con `workspace.id` en operaciones tenant-específicas
- **Severidad:** ALTO

**Código actual:** Sin `span.set_attribute(...)` en handlers.

**Ejemplo correcto:**

```python
from opentelemetry import trace

span = trace.get_current_span()
span.set_attribute("workspace.id", str(workspace_id))
span.set_attribute("customer.id", str(customer_id))
```

---

#### H-21 · Tracing · 2.22

- **Archivo:Línea:** `src/routes/customer.py:18-79`
- **Regla incumplida:** 2.22 — facet `@workspace.id` filtrable en APM
- **Severidad:** ALTO

**Código actual:** Atributo `workspace.id` ausente en todos los spans de negocio.

**Ejemplo correcto:** Ver H-20.

---

### MEDIO

---

#### H-22 · Setup · 0.8

- **Archivo:Línea:** `src/settings.py:22`
- **Regla incumplida:** 0.8 — `OTEL_ENVIRONMENT` con valor canónico (`production` | `staging` | `development`)
- **Severidad:** MEDIO

**Código actual:**

```python
OTEL_ENVIRONMENT: str
```

**Ejemplo correcto:**

```python
from typing import Literal
OTEL_ENVIRONMENT: Literal["production", "staging", "development"]
```

---

#### H-23 · Setup · 0.9

- **Archivo:Línea:** `src/settings.py:29-35`
- **Regla incumplida:** 0.9 — `OTEL_SERVICE_VERSION` debe fallar al arranque si falta (patrón canónico usa `os.environ["OTEL_SERVICE_VERSION"]` directo)
- **Severidad:** MEDIO

**Código actual:** Variable requerida vía Pydantic (correcto), pero se propaga a `os.environ` sin incluir `OTEL_COLLECTOR_ENDPOINT` canónico.

**Ejemplo correcto:** Alinear variables con setup canónico y propagar todas las obligatorias:

```python
os.environ["OTEL_SERVICE_NAME"] = settings.OTEL_SERVICE_NAME
os.environ["OTEL_ENVIRONMENT"] = settings.OTEL_ENVIRONMENT
os.environ["OTEL_SERVICE_VERSION"] = settings.OTEL_SERVICE_VERSION
os.environ.setdefault("OTEL_COLLECTOR_ENDPOINT", settings.OTEL_COLLECTOR_ENDPOINT)
```

---

#### H-24 · Logging · 1.8

- **Archivo:Línea:** `src/routes/customer.py:76-77`
- **Regla incumplida:** 1.8 — errores operacionales deben loguearse con nivel ERROR
- **Severidad:** MEDIO

**Código actual:**

```python
if not updated_customer:
    raise HTTPException(status_code=500, detail="Failed to update customer")
```

**Ejemplo correcto:**

```python
logger.error("customer_update_failed", extra={
    "workspace_id": str(workspace_id),
    "customer_id": customer_id,
}, exc_info=True)
raise HTTPException(status_code=500, detail="Failed to update customer")
```

---

#### H-25 · Tracing · 2.23

- **Archivo:Línea:** `src/main.py:1-46`
- **Regla incumplida:** 2.23 — Resource con `service.name` y `deployment.environment` en span raíz
- **Severidad:** MEDIO

**Código actual:** Sin `TracerProvider` ni `Resource.create(...)`.

**Ejemplo correcto:** Configuración en `setup_observability()` según `.cursor/rules/setup.mdc`.

---

### Ítems 🔴 en PASS (sin hallazgo)

| Ítem | Motivo |
|------|--------|
| 0.3 | No hay `logging.basicConfig()` en el repo |
| 0.4 | Dockerfile no usa `opentelemetry-instrument` CLI |
| 0.9 | `OTEL_SERVICE_VERSION` es campo obligatorio en Settings (fail-fast vía Pydantic) |
| 1.9 | No hay llamadas a `logger.error` / `logger.critical` sin `exc_info=True` |
| 1.11 | No hay lógica de retry en el servicio |
| 1.13 | No hay uso de `extra={}` con campos reservados |
| 1.14 | No se loguea PII en `extra` (no hay logs de negocio) |
| 3.1–3.16 | No hay métricas custom; sin violaciones de naming/cardinalidad |

---

## 3. Checklist de tareas (ordenadas por impacto)

### Fase 1 — Bloqueantes (desbloquean los 4 pilares)

- [ ] **T-01** Restaurar `src/observability/setup.py` con implementación canónica de `.cursor/rules/setup.mdc`
- [ ] **T-02** Invocar `setup_observability()` en `src/main.py` antes de crear la app y registrar routers
- [ ] **T-03** Agregar `FastAPIInstrumentor.instrument_app(app)` después de crear `FastAPI()`
- [ ] **T-04** Instrumentar SQLAlchemy (`SQLAlchemyInstrumentor().instrument(engine=engine)`) en lifespan o post-setup
- [ ] **T-05** Alinear variables OTel en `settings.py`: usar `OTEL_COLLECTOR_ENDPOINT` (default `:4317`) y validar formato de `OTEL_SERVICE_NAME` / `OTEL_ENVIRONMENT`

### Fase 2 — Logging estructurado

- [ ] **T-06** Declarar `logger = logging.getLogger(__name__)` en `customer.py`, `customer_repository.py` y demás módulos con lógica
- [ ] **T-07** Agregar middleware HTTP de logging para 4xx/5xx (patrón en `.cursor/rules/logging.mdc`)
- [ ] **T-08** Emitir eventos `snake_case` con `extra={}` en operaciones CRUD de clientes (`customer_create_started`, etc.)
- [ ] **T-09** Incluir `workspace_id` en `extra` (extraer de header `X-Workspace-ID` o parámetro de tenant)
- [ ] **T-10** Loguear fallos 500 con `logger.error(..., exc_info=True)` antes de `HTTPException`

### Fase 3 — Tracing de negocio

- [ ] **T-11** Declarar `tracer = trace.get_tracer(__name__)` en módulos con lógica de negocio
- [ ] **T-12** Enriquecer spans HTTP con `workspace.id`, `customer.id` usando `dot.notation` y `str()`
- [ ] **T-13** En handlers con excepciones: `set_status(ERROR)`, `record_exception(e)`, `exception.type`
- [ ] **T-14** Validar en staging: `@deployment.environment`, `@workspace.id`, `status:error`

### Fase 4 — Métricas y validación Datadog

- [ ] **T-15** Habilitar `setup_observability(enable_metrics=True)` si se requieren métricas custom
- [ ] **T-16** Verificar Golden Signals auto-instrumentadas (`http.server.*`) en Metrics Explorer
- [ ] **T-17** Smoke test post-deploy: logs JSON, traces APM, correlación `trace_id`, métricas con tags `service.name` / `deployment.environment`

### Fase 5 — Deuda técnica del POC

- [ ] **T-18** Evaluar si el catálogo de métricas requiere entradas para `demos-customers-api` antes de crear métricas custom (ítems 3.18, 3.21–3.24)
- [ ] **T-19** Migrar exportador OTLP: `pyproject.toml` usa `opentelemetry-exporter-otlp-proto-http`; el setup canónico usa gRPC (`opentelemetry-exporter-otlp`) — alinear stack

---

## Archivos auditados

| Archivo | Observaciones |
|---------|---------------|
| `src/main.py` | Sin setup OTel ni instrumentación |
| `src/settings.py` | Variables OTel parciales; naming no canónico |
| `src/observability/__init__.py` | Import roto a `setup.py` eliminado |
| `src/routes/customer.py` | Sin logger, tracer ni span enrichment |
| `src/routes/healthcheck.py` | Logger declarado pero sin uso |
| `src/repositories/customer_repository.py` | Sin observabilidad |
| `src/database.py` | Sin instrumentación SQLAlchemy |
| `src/schemas/customer.py` | Sin observabilidad (esperado) |
| `src/models/customer.py` | Sin observabilidad (esperado) |
| `src/scripts/generate_customers.py` | Script offline; fuera de scope operativo |
