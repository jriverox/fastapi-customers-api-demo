# Reporte de Auditoría de Observabilidad

**Proyecto:** fastapi-customers-api-poc  
**Fecha:** 2026-06-04  
**Auditor:** obs-audit (Simetrik Observability Standards)  
**Estándar base:** `.claude/observability.md`

---

## 1. Resumen Ejecutivo

| Severidad | Cantidad |
|-----------|----------|
| CRÍTICO   | 4        |
| ALTO      | 5        |
| MEDIO     | 1        |
| BAJO      | 3        |
| **TOTAL** | **13**   |

| Pilar     | Hallazgos |
|-----------|-----------|
| Setup OTel (base de los 3 pilares) | 2 |
| Logging   | 6         |
| Métricas  | 1         |
| Tracing   | 4         |

**Estado general:** El servicio carece por completo de observabilidad. No existe setup de OpenTelemetry, no hay logging estructurado, no hay trazas ni métricas. Cualquier incidente en producción sería imposible de diagnosticar.

---

## 2. Hallazgos Detallados (ordenados por severidad)

---

### CRÍTICO-1 — Setup OTel completamente ausente
**Pilar:** Setup compartido (base de Logging + Tracing + Métricas)  
**Archivo:Línea:** `src/main.py:44`  
**Regla incumplida:** Setup compartido obligatorio — `setup_observability()` debe ejecutarse ANTES de `app = FastAPI()`, seguido de `FastAPIInstrumentor.instrument()`

**Código actual:**
```python
app = FastAPI(
    title="Customers API",
    ...
    lifespan=lifespan,
)
```

**Código corregido:**
```python
from observability.setup import setup_observability
from opentelemetry.instrumentation.fastapi import FastAPIInstrumentor

setup_observability()              # ANTES de FastAPI()
FastAPIInstrumentor.instrument()   # DESPUÉS de setup, ANTES de app

app = FastAPI(
    title="Customers API",
    ...
    lifespan=lifespan,
)
```

---

### CRÍTICO-2 — Variables OTel obligatorias no definidas
**Pilar:** Setup compartido  
**Archivo:Línea:** `src/settings.py:4`  
**Regla incumplida:** Variables obligatorias — `OTEL_SERVICE_NAME`, `OTEL_ENVIRONMENT`, `OTEL_SERVICE_VERSION` deben existir; `KeyError` al arranque si faltan.

**Código actual:**
```python
class Settings(BaseSettings):
    HOST: str = "127.0.0.1"
    PORT: int = 8000
    DATABASE_URL: str
    APP_NAME: str = "Customers API"
    DEBUG: bool = False
    API_V1_STR: str = "/api/v1"
    # ← sin variables OTel
```

**Código corregido:**
```python
class Settings(BaseSettings):
    HOST: str = "127.0.0.1"
    PORT: int = 8000
    DATABASE_URL: str
    APP_NAME: str = "Customers API"
    DEBUG: bool = False
    API_V1_STR: str = "/api/v1"
    # OTel — obligatorias, sin default (KeyError si faltan)
    OTEL_SERVICE_NAME: str       # e.g. "demo-customers-api"
    OTEL_ENVIRONMENT: str        # "production" | "staging" | "development"
    OTEL_SERVICE_VERSION: str    # e.g. "1.0.0"
```

Y en `.env` / variables de entorno del contenedor:
```
OTEL_SERVICE_NAME=demo-customers-api
OTEL_ENVIRONMENT=development
OTEL_SERVICE_VERSION=1.0.0
```

---

### CRÍTICO-3 — Sin logger ni tracer en routes/customer.py
**Pilar:** Logging + Tracing  
**Archivo:Línea:** `src/routes/customer.py:1`  
**Regla incumplida:** "En cada módulo: `logger = logging.getLogger(__name__)` / `tracer = trace.get_tracer(__name__)`"

**Código actual:**
```python
from fastapi import APIRouter, Depends, HTTPException
from sqlalchemy.ext.asyncio import AsyncSession
# ← sin logger ni tracer
```

**Código corregido:**
```python
import logging
from fastapi import APIRouter, Depends, HTTPException
from opentelemetry import trace
from sqlalchemy.ext.asyncio import AsyncSession

logger = logging.getLogger(__name__)
tracer = trace.get_tracer(__name__)
```

---

### CRÍTICO-4 — Sin logger ni tracer en repositories/customer_repository.py
**Pilar:** Logging + Tracing  
**Archivo:Línea:** `src/repositories/customer_repository.py:1`  
**Regla incumplida:** "En cada módulo: `logger = logging.getLogger(__name__)` / `tracer = trace.get_tracer(__name__)`"

**Código actual:**
```python
from typing import List, Optional
from sqlalchemy import cast, func, select
# ← sin logger ni tracer
```

**Código corregido:**
```python
import logging
from typing import List, Optional
from opentelemetry import trace
from sqlalchemy import cast, func, select

logger = logging.getLogger(__name__)
tracer = trace.get_tracer(__name__)
```

---

### ALTO-1 — Sin middleware HTTP de logging
**Pilar:** Logging  
**Archivo:Línea:** `src/main.py:44`  
**Regla incumplida:** Pilar 1 — Implementación completa FastAPI con middleware: `http_request_error` (5xx) y `http_request_client_error` (4xx) con campos `http.method`, `http.route`, `http.status_code`, `duration_ms`.

**Código actual:**
```python
app = FastAPI(...)
# ← sin middleware de logging
```

**Código corregido:**
```python
import time
from fastapi.responses import JSONResponse

@app.middleware("http")
async def logging_middleware(request: Request, call_next):
    start = time.time()
    try:
        response = await call_next(request)
        elapsed = time.time() - start
        if response.status_code >= 500:
            logger.error("http_request_error", extra={
                "http.method": request.method,
                "http.route": request.url.path,
                "http.status_code": response.status_code,
                "duration_ms": round(elapsed * 1000),
            }, exc_info=True)
        elif response.status_code >= 400:
            logger.warning("http_request_client_error", extra={
                "http.method": request.method,
                "http.route": request.url.path,
                "http.status_code": response.status_code,
            })
        return response
    except Exception:
        logger.error("http_request_unhandled_error", extra={
            "http.method": request.method,
        }, exc_info=True)
        return JSONResponse(status_code=500, content={"detail": "Internal server error"})
```

---

### ALTO-2 — Sin logging de operaciones de negocio en route handlers
**Pilar:** Logging  
**Archivo:Línea:** `src/routes/customer.py:19, 28, 38, 63`  
**Regla incumplida:** Pilar 1 — nivel INFO para inicio/fin de operaciones de negocio, cambios de estado.

**Código actual:**
```python
@router.post("/", response_model=CustomerResponse, status_code=201)
async def create_customer(customer: CustomerCreate, repository: ...):
    new_id = await repository.get_next_id()
    new_customer = Customer(...)
    return await repository.create_customer(new_customer)
    # ← sin logs de inicio ni fin
```

**Código corregido:**
```python
@router.post("/", response_model=CustomerResponse, status_code=201)
async def create_customer(customer: CustomerCreate, repository: ...):
    logger.info("customer_create_started", extra={"customer_document": customer.document_id})
    new_id = await repository.get_next_id()
    new_customer = Customer(...)
    result = await repository.create_customer(new_customer)
    logger.info("customer_create_completed", extra={"customer_id": result.id})
    return result
```

Aplicar el mismo patrón a `get_customers`, `get_customer`, `update_customer`.

---

### ALTO-3 — Sin logging de operaciones en repository
**Pilar:** Logging  
**Archivo:Línea:** `src/repositories/customer_repository.py:28, 34`  
**Regla incumplida:** Pilar 1 — INFO al inicio/fin de operaciones, ERROR con `exc_info=True` al fallar.

**Código actual:**
```python
async def create_customer(self, customer: Customer) -> Customer:
    self.db.add(customer)
    await self.db.commit()
    await self.db.refresh(customer)
    return customer
    # ← sin logs ni manejo de errores observables
```

**Código corregido:**
```python
async def create_customer(self, customer: Customer) -> Customer:
    logger.info("db_customer_create_started", extra={"customer_id": customer.id})
    try:
        self.db.add(customer)
        await self.db.commit()
        await self.db.refresh(customer)
        logger.info("db_customer_create_completed", extra={"customer_id": customer.id})
        return customer
    except Exception:
        logger.error("db_customer_create_failed", extra={"customer_id": customer.id}, exc_info=True)
        raise
```

---

### ALTO-4 — Sin atributos de span en route handlers
**Pilar:** Tracing  
**Archivo:Línea:** `src/routes/customer.py:19, 28, 38, 63`  
**Regla incumplida:** Pilar 3 — `workspace.id` obligatorio como primer atributo en todo span de negocio; marcado de `status` y `exception.type` al fallar.

**Código actual:**
```python
@router.get("/{customer_id}", response_model=CustomerResponse)
async def get_customer(customer_id: str, repository: ...):
    customer = await repository.get_customer_by_id(customer_id)
    if not customer:
        raise HTTPException(status_code=404, detail="Customer not found")
    return customer
    # ← sin atributos de span
```

**Código corregido:**
```python
from opentelemetry import trace
from opentelemetry.trace import StatusCode

@router.get("/{customer_id}", response_model=CustomerResponse)
async def get_customer(customer_id: str, repository: ...):
    span = trace.get_current_span()
    span.set_attribute("customer.id", str(customer_id))
    try:
        customer = await repository.get_customer_by_id(customer_id)
        if not customer:
            span.set_attribute("status", "not_found")
            raise HTTPException(status_code=404, detail="Customer not found")
        span.set_attribute("status", "success")
        return customer
    except HTTPException:
        raise
    except Exception as e:
        span.set_attribute("status", "failure")
        span.set_attribute("exception.type", type(e).__name__)
        span.set_status(StatusCode.ERROR, str(e))
        span.record_exception(e)
        raise
```

---

### ALTO-5 — Error 500 sin log ni marcado de span
**Pilar:** Logging + Tracing  
**Archivo:Línea:** `src/routes/customer.py:79`  
**Regla incumplida:** Pilar 1 — `logger.error(..., exc_info=True)` al fallar. Pilar 3 — tres pasos obligatorios: `set_status(StatusCode.ERROR)`, `record_exception(e)`, `set_attribute("exception.type", ...)`.

**Código actual:**
```python
updated_customer = await repository.update_customer(customer_id, existing_customer)
if not updated_customer:
    raise HTTPException(status_code=500, detail="Failed to update customer")
    # ← sin log de error, sin exc_info, sin span marking
```

**Código corregido:**
```python
updated_customer = await repository.update_customer(customer_id, existing_customer)
if not updated_customer:
    span = trace.get_current_span()
    span.set_attribute("status", "failure")
    span.set_attribute("exception.type", "UpdateFailed")
    span.set_status(StatusCode.ERROR, "customer_update_returned_none")
    logger.error("customer_update_failed", extra={"customer_id": customer_id})
    raise HTTPException(status_code=500, detail="Failed to update customer")
```

---

### MEDIO-1 — Sin métricas de negocio
**Pilar:** Métricas  
**Archivo:Línea:** Ausencia total en el proyecto  
**Regla incumplida:** Pilar 2 — criterio "¿CUÁNTOS?" → Métrica. Las operaciones CRUD son candidatas directas a contadores e histogramas.

**Código actual:**  
No existe ningún uso de `opentelemetry.metrics`.

**Código corregido (ejemplo):**
```python
from opentelemetry import metrics as otel_metrics
import time

meter = otel_metrics.get_meter("customers")

customers_operations = meter.create_counter(
    name="customers.operations.total",
    description="Total de operaciones sobre clientes",
    unit="{operation}",
)
operation_duration = meter.create_histogram(
    name="customers.operation.duration",
    description="Duración de operaciones sobre clientes",
    unit="s",
)

# Uso en route handler:
start = time.monotonic()
# ... lógica ...
customers_operations.add(1, {"operation": "create", "status": "success"})
operation_duration.record(time.monotonic() - start, {"operation": "create"})
```

---

### BAJO-1 — `echo=True` en engine de base de datos
**Pilar:** Logging  
**Archivo:Línea:** `src/database.py:8`  
**Regla incumplida:** Pilar 1 — Hot path: no loguear en exceso dentro de operaciones de bajo nivel. `echo=True` imprime cada statement SQL en producción, generando ruido que dificulta el filtrado de logs reales de negocio.

**Código actual:**
```python
engine = create_async_engine(DATABASE_URL, echo=True)
```

**Código corregido:**
```python
engine = create_async_engine(DATABASE_URL, echo=settings.DEBUG)
```

---

### BAJO-2 — Sin logger en src/main.py (módulo raíz)
**Pilar:** Logging  
**Archivo:Línea:** `src/main.py:1`  
**Regla incumplida:** "En cada módulo: `logger = logging.getLogger(__name__)`" — el módulo `main.py` carece de logger propio.

**Código actual:**
```python
import asyncio
import uvicorn
# ← sin logger
```

**Código corregido:**
```python
import asyncio
import logging
import uvicorn

logger = logging.getLogger(__name__)
```

---

### BAJO-3 — Sin logger en routes/healthcheck.py
**Pilar:** Logging  
**Archivo:Línea:** `src/routes/healthcheck.py:1`  
**Regla incumplida:** "En cada módulo: `logger = logging.getLogger(__name__)`"

**Código actual:**
```python
from fastapi import APIRouter
router = APIRouter()
# ← sin logger
```

**Código corregido:**
```python
import logging
from fastapi import APIRouter

logger = logging.getLogger(__name__)
router = APIRouter()
```

---

## 3. Checklist de Tareas (ordenadas por impacto)

### Fase 1 — Fundamentos OTel (bloqueante para todo lo demás)
- [ ] Crear `src/observability/setup.py` con `setup_observability()` siguiendo `docs/02-setup.md`
- [ ] Agregar `OTEL_SERVICE_NAME`, `OTEL_ENVIRONMENT`, `OTEL_SERVICE_VERSION` a `Settings` (sin default — KeyError al arranque)
- [ ] Agregar las tres variables al `.env` y a la configuración del contenedor/docker-compose
- [ ] En `src/main.py`: importar y llamar `setup_observability()` + `FastAPIInstrumentor.instrument()` ANTES de `app = FastAPI()`

### Fase 2 — Logging estructurado
- [ ] Agregar `logger = logging.getLogger(__name__)` en `main.py`, `routes/customer.py`, `routes/healthcheck.py`, `repositories/customer_repository.py`
- [ ] Implementar middleware HTTP de logging en `main.py` (5xx → `error`, 4xx → `warning`)
- [ ] Agregar logs `INFO` de inicio/fin en los 4 route handlers de `routes/customer.py`
- [ ] Agregar logs `INFO`/`ERROR` en `create_customer` y `update_customer` de `customer_repository.py`
- [ ] Reemplazar `echo=True` por `echo=settings.DEBUG` en `database.py`

### Fase 3 — Tracing
- [ ] Agregar `tracer = trace.get_tracer(__name__)` en `routes/customer.py` y `repositories/customer_repository.py`
- [ ] Decorar los 4 route handlers con `span.set_attribute("customer.id", ...)` y `span.set_attribute("status", ...)`
- [ ] Implementar los 3 pasos de error en spans: `set_status(StatusCode.ERROR)`, `record_exception(e)`, `set_attribute("exception.type", ...)`
- [ ] Cubrir el `raise HTTPException(500)` en `update_customer` con log de error + span marking

### Fase 4 — Métricas
- [ ] Crear `meter = otel_metrics.get_meter("customers")` en un módulo compartido de observabilidad
- [ ] Definir `customers.operations.total` (Counter, `{operation}`) con atributos `operation`, `status`
- [ ] Definir `customers.operation.duration` (Histogram, `s`) con atributo `operation`
- [ ] Instrumentar los 4 route handlers con `add()` y `record()`

---

## 4. Estimación de Esfuerzo

| Fase | Descripción | Esfuerzo |
|------|-------------|----------|
| Fase 1 — Fundamentos OTel | Crear `setup.py`, variables de entorno, wiring en `main.py` | **M** (1–4h) |
| Fase 2 — Logging estructurado | Logger en módulos, middleware, logs INFO/ERROR en handlers y repo | **M** (2–4h) |
| Fase 3 — Tracing | Atributos de span, manejo de errores en APM, 4 handlers + repo | **M** (2–3h) |
| Fase 4 — Métricas | Meter, 2 instrumentos, instrumentación en handlers | **S** (< 1h) |
| **Total** | | **L** (6–12h) |
