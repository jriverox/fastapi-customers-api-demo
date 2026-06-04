# Métricas — Estándar Simetrik

> **Prerequisito:** `.claude/observability/setup.md` con `setup_observability(enable_metrics=True)`.
> **Catálogo:** `.claude/observability/metrics-catalog.md` — consultar antes de crear una métrica nueva.
> **Verificación:** ver `.claude/observability/checklist-metrics.md` (usar con `obs-audit-metrics`, no con `obs-apply-metrics`).

---

## Regla mnemotécnica

```
¿CUÁNTOS o qué tan RÁPIDO?  →  Métrica
¿QUIÉN o POR QUÉ?           →  Log
¿DÓNDE en el flujo?         →  Trace
```

Las métricas **no son visibles en tiempo real** — el primer dato llega hasta 60s después del arranque.

---

## 1. Tipos de instrumento

| Instrumento | Cuándo usar | Ejemplo |
|-------------|------------|---------|
| **Counter** | Conteo de eventos que solo incrementan | Requests, errores, archivos procesados |
| **UpDownCounter** | Recursos que se adquieren y liberan | Conexiones activas, jobs en ejecución |
| **Histogram** | Distribución de valores | Duración de requests, tamaño de archivos |
| **ObservableGauge** | Valor instantáneo por polling (asíncrono) | CPU%, memoria%, profundidad de queue |

**Matriz de decisión:**

```
¿Es un conteo de eventos?
  → ¿Puede decrementar?  → Sí → UpDownCounter
                         → No → Counter
¿Es una distribución de valores?  → Histogram
¿Es un valor de estado actual?    → ObservableGauge
```

---

## 2. Naming convention

**Formato:** `{namespace}.{entidad}.{accion}[.total]`

| Namespace | Servicio |
|-----------|---------|
| `lz` | landing-zone-engine |
| `erp` | erp-backend |
| `ur` | web-backend |
| `http` | Cross-service (HTTP layer) |
| `db` | Cross-service (base de datos) |
| `messaging` | Cross-service (queues) |

| Regla | ✅ Correcto | ❌ Incorrecto |
|-------|------------|--------------|
| Delimitador punto | `lz.files.processed.total` | `lz_files_processed_total` |
| Lowercase | `http.server.request.duration` | `HTTP.Server.Request.Duration` |
| Unidad en metadata | `name="duration", unit="s"` | `name="duration_seconds"` |
| Counters con `.total` | `lz.files.processed.total` | `lz.files.processed.count` |

**Unidades UCUM:**

| Tipo | Usar | Prohibido |
|------|------|----------|
| Duración | `s` | `ms`, `milliseconds` |
| Tamaño | `By` | `kb`, `MB` |
| Requests HTTP | `{request}` | `{req}`, `requests` |
| Errores | `{error}` | `{err}`, `{failure}` |
| Archivos | `{file}` | `{doc}`, `{item}` |
| Registros | `{record}` | `{row}` |
| Mensajes | `{message}` | `{msg}`, `{event}` |
| Ratio | `1` | `%`, `percent` |
| Ejecuciones / Jobs | `{execution}` | `{job}`, `{run}` |
| Entradas ERP | `{entry}` | `{item}`, `{row}` |
| Llamadas API externas | `{call}` | `{invoke}` |
| Reintentos | `{retry}` | `{attempt}` |
| Acciones de usuario | `{action}` | `{op}`, `{operation}` |

---

## 3. Cardinalidad — la regla más importante

```
Cardinalidad = |valores_attr_1| × |valores_attr_2| × ...
Costo Datadog = Cardinalidad × Multiplicador

Multiplicadores:
  Counter / UpDownCounter / ObservableGauge  →  × 1
  Histogram                                  →  × 5-8
```

**Umbrales:**

| Cardinalidad | Acción |
|-------------|--------|
| < 1,000 series | ✅ Proceder |
| 1,000 – 5,000 | ⚠️ Validar con Cloud Observability |
| > 5,000 | 🔴 Rediseñar antes de merge |

**Atributos permitidos:**

| Atributo | Cardinalidad |
|----------|-------------|
| `deployment.environment` | Baja (3-5) |
| `http.method` | Baja (5-7) |
| `http.status_code` | Baja-Media (5-20) |
| `http.route` | Media (10-50) — **parametrizada** |
| `workspace.id` | Media (< 500) |
| `exception.type` | Media (5-30) |
| `status` | Baja (2-5): `success`, `failure`, `timeout` |
| `file.type` | Baja (5-10) |

**Atributos prohibidos:**

| Prohibido | Por qué | Alternativa |
|-----------|---------|-------------|
| `user.id` | 100K+ series | Logs/traces |
| `request.id`, `trace.id` | Cada request = serie nueva | Logs/traces |
| `email` | Cardinalidad ilimitada + PII | Nunca en métricas |
| `url` (completa) | Query params hacen cada URL única | `http.route` parametrizada |
| `file.name` | Ilimitado | `file.type` |
| `exception.message` | Texto libre | `exception.type` categorizado |

---

## 4. Golden Signals (HTTP)

La auto-instrumentación OTel genera estas métricas automáticamente. **Verificar antes de crearlas manualmente.**

| Signal | Métrica | Tipo | Unidad |
|--------|---------|------|--------|
| Latency | `http.server.request.duration` | Histogram | `s` |
| Traffic | `http.server.request.total` | Counter | `{request}` |
| Errors | `http.server.errors.total` | Counter | `{error}` |
| Saturation | `http.server.active_requests` | UpDownCounter | `{request}` |

---

## 5. Patrón éxito/fallo

Usar `status` para diferenciar outcomes — permite calcular tasa y volumen con una sola query.

```python
# Valores canónicos: "success" | "failure" | "timeout"
counter.add(1, {"workspace.id": workspace_id, "entry.type": "journal", "status": "success"})
counter.add(1, {"workspace.id": workspace_id, "entry.type": "journal", "status": "failure", "exception.type": "validation_error"})
```

---

## 6. Patrones copy-paste

### Worker / Job Processor

```python
import time
from opentelemetry import metrics as otel_metrics

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

def process_file(workspace_id: str, file_type: str, file_id: str):
    base_attrs = {"workspace.id": workspace_id, "file.type": file_type}
    active_executions.add(1, {"workspace.id": workspace_id})
    start = time.monotonic()
    try:
        _do_process(file_id)
        files_processed.add(1, {**base_attrs, "status": "success"})
    except Exception as e:
        files_processed.add(1, {**base_attrs, "status": "failure", "exception.type": type(e).__name__})
        raise
    finally:
        processing_duration.record(time.monotonic() - start, base_attrs)
        active_executions.add(-1, {"workspace.id": workspace_id})
```

### Operación con Retry

```python
meter = otel_metrics.get_meter("lz")

retry_counter = meter.create_counter(
    name="lz.connection.retries.total",
    description="Total de reintentos de conexión",
    unit="{retry}",
)
connection_errors = meter.create_counter(
    name="lz.connection.errors.total",
    description="Total de errores de conexión definitivos",
    unit="{error}",
)

def connect_with_retry(workspace_id: str, connection_type: str, max_retries: int = 3):
    base_attrs = {"workspace.id": workspace_id, "connection.type": connection_type}
    for attempt in range(1, max_retries + 1):
        try:
            return _do_connect()
        except Exception as e:
            if attempt < max_retries:
                retry_counter.add(1, {**base_attrs, "exception.type": type(e).__name__})
            else:
                connection_errors.add(1, {**base_attrs, "exception.type": type(e).__name__, "status": "failure"})
                raise
```

### Queue / Messaging

```python
meter = otel_metrics.get_meter("messaging")

messages_published = meter.create_counter(
    name="messaging.messages.published.total",
    description="Total de mensajes publicados",
    unit="{message}",
)

# ObservableGauge para profundidad de queue — asíncrono, no bloquea el flujo
def get_queue_depth(observer):
    observer.observe(
        message_queue.get_pending_count(),
        {"queue.name": "lz-events", "deployment.environment": "production"},
    )

queue_depth = meter.create_observable_gauge(
    name="messaging.queue.depth",
    callbacks=[get_queue_depth],
    description="Profundidad actual de la queue",
    unit="{message}",
)
```

### UpDownCounter con lifecycle (regla crítica de atributos idénticos)

```python
meter = otel_metrics.get_meter("erp")

active_connections = meter.create_up_down_counter(
    name="erp.connections.active",
    description="Conexiones activas en este momento",
    unit="{connection}",
)

class ConnectionManager:
    def acquire(self, workspace_id: str, connection_type: str):
        conn = _create_connection()
        active_connections.add(1, {"workspace.id": workspace_id, "connection.type": connection_type})
        return conn

    def release(self, workspace_id: str, connection_type: str):
        _close_connection()
        active_connections.add(-1, {"workspace.id": workspace_id, "connection.type": connection_type})
```

> Los atributos en `add(+1)` y `add(-1)` deben ser **exactamente iguales** — si difieren, el counter se desbalancea y nunca vuelve a cero.

### SLO con error budget

```python
meter = otel_metrics.get_meter("ur")

# SLI = status:success / total — SLO = 99.9% en 28 días rolling
executions = meter.create_counter(
    name="ur.executions.total",
    description="Total de ejecuciones de reconciliación",
    unit="{execution}",
)

def run_reconciliation(workspace_id: str, source_name: str):
    try:
        _do_reconciliation()
        executions.add(1, {"workspace.id": workspace_id, "source.name": source_name, "status": "success"})
    except Exception as e:
        executions.add(1, {"workspace.id": workspace_id, "source.name": source_name, "status": "failure", "exception.type": type(e).__name__})
        raise

# Query SLI en Datadog:
#   sum(ur.executions.total{status:success}) / sum(ur.executions.total)
```

---

## 7. Anti-patrones

| ❌ Evitar | ✅ Hacer |
|----------|---------|
| `user.id` como label | Solo en logs/traces — nunca en métricas |
| `name="duration_seconds"` | `name="duration", unit="s"` |
| `create_counter("lz.files.processed.count")` | `create_counter("lz.files.processed.total")` |
| Tres counters para lo mismo | Usar nombre canónico del catálogo |
| Métrica sin dashboard ni alerta | Solo crear si hay consumidor identificado |
| Histograma con 30+ buckets | Máximo 12, distribución logarítmica |
| `add(1, attrs)` / `add(-1, {})` en UpDownCounter | Mismos atributos en ambos |
| `"status": "ok"` | `"success"` / `"failure"` / `"timeout"` |
| Crear `http.server.*` manualmente | Verificar qué genera la auto-instrumentación |
