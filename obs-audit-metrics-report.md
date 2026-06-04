# Auditoría de métricas — `src/routes/customer.py`

**Fecha:** 2026-06-04  
**Scope:** `src/routes/customer.py`  
**Autoridad:** `.cursor/rules/metrics.mdc`, `.cursor/rules/metrics-catalog.mdc`  
**Checklist:** `.claude/observability/checklist-metrics.md`  
**Servicio:** `demos-customers-api` (`OTEL_SERVICE_NAME` en `.env.example`)

---

## Resumen ejecutivo

El archivo **no define métricas custom** (`get_meter`, `create_counter`, `create_histogram`, `create_up_down_counter`, `create_observable_gauge`). Solo emite **logs estructurados** para operaciones CRUD y auditoría.

Las Golden Signals HTTP (`http.server.*`) y métricas DB (`db.operation.*`) dependen de la auto-instrumentación configurada en `src/main.py` y `src/observability/setup.py`, fuera del scope de este archivo.

**Métricas custom encontradas:** 0  
**Estimación de cardinalidad:** N/A (sin instrumentos)

### Prerequisito setup — ítem 0.5

| Ítem | Estado | Notas |
|------|--------|-------|
| 0.5 `setup_observability(enable_metrics=True)` | **N/A** | Solo aplica si el archivo emite métricas custom. `customer.py` no las emite. `src/main.py:14` invoca `setup_observability()` sin `enable_metrics=True` — relevante para export OTLP de métricas a nivel servicio, no para este archivo. |

---

## Inventario de instrumentos en scope

| Archivo | Instrumentos OTel | Namespace |
|---------|-------------------|-----------|
| `src/routes/customer.py` | Ninguno | — |

---

## Checklist completo (evaluación por ítem)

| # | Ítem | Clasif. | Resultado | Evidencia |
|---|------|---------|-----------|-----------|
| 3.1 | Métrica responde "¿cuántos?" / "¿qué tan rápido?" | 🔴 | **PASS (N/A)** | Sin métricas custom en el archivo |
| 3.2 | Sin alta cardinalidad en atributos de métricas | 🔴 | **PASS (N/A)** | Sin instrumentos |
| 3.3 | Eventos de auditoría → logs, no métricas | 🟡 | **PASS** | `audit_event` en L122-131, L185-194 usa `logger.info`, no Counter |
| 3.4 | Naming `{namespace}.{entidad}.{accion}[.total]` | 🔴 | **PASS (N/A)** | Sin nombres de métricas |
| 3.5 | Delimitador punto, lowercase, unidad en metadata | 🔴 | **PASS (N/A)** | Sin instrumentos |
| 3.6 | Counters terminan en `.total` | 🔴 | **PASS (N/A)** | Sin `create_counter` |
| 3.7 | Atributos `dot.notation`, `status` canónico | 🔴 | **PASS (N/A)** | Sin atributos de métricas |
| 3.8 | Cardinalidad < 1.000 series por métrica | 🔴 | **PASS (N/A)** | Sin métricas custom |
| 3.9 | Sin atributos prohibidos en labels | 🔴 | **PASS (N/A)** | Sin labels; logs usan `customer_id` (correcto en logs, no en métricas) |
| 3.10 | `http.route` parametrizada en atributos HTTP | 🟡 | **PASS (N/A)** | Sin atributos HTTP en métricas |
| 3.11 | `get_meter("<namespace>")` por módulo | 🔴 | **PASS (N/A)** | Sin métricas custom — no requiere meter en este módulo |
| 3.12 | Tipo de instrumento correcto | 🔴 | **PASS (N/A)** | Sin instrumentos |
| 3.13 | UpDownCounter: mismos atributos en +1/-1 | 🔴 | **PASS (N/A)** | Sin UpDownCounter |
| 3.14 | Histogramas: ≤12 buckets logarítmicos | 🔴 | **PASS (N/A)** | Sin histogramas |
| 3.15 | Unidades UCUM correctas | 🔴 | **PASS (N/A)** | Sin unidades |
| 3.16 | No duplicar `http.server.*` manualmente | 🔴 | **PASS** | No se crean métricas HTTP manuales |
| 3.17 | Golden Signals cubiertas (auto-inst. o custom) | 🔴 | **PASS** | Responsabilidad de `FastAPIInstrumentor` en `main.py`; este archivo no bloquea ni duplica |
| 3.18 | Métrica custom con dashboard/alerta/SLO | 🔴 | **PASS (N/A)** | Sin métricas custom |
| 3.19 | Cardinalidad 1k–5k con aprobación CO | 🟡 | **PASS (N/A)** | — |
| 3.20 | Métricas sin consumidor → eliminar | 🟡 | **PASS (N/A)** | — |
| 3.21 | Consultar catálogo antes de crear | 🔴 | **PASS (N/A)** | No se propone métrica nueva |
| 3.22 | Gate de propiedad en PR | 🔴 | **PASS (N/A)** | — |
| 3.23 | Cardinalidad documentada en PR | 🔴 | **PASS (N/A)** | — |
| 3.24 | PR actualiza catálogo corporativo | 🔴 | **PASS (N/A)** | — |
| 3.25 | Métricas visibles en Metrics Explorer ~60s | 🔴 | **PASS (N/A)** | Validación runtime a nivel servicio; fuera de scope de este archivo |
| 3.26 | Tags `service.name` y `deployment.environment` | 🔴 | **PASS (N/A)** | Validación runtime; `Resource` en `setup.py` |
| 3.27 | Atributos filtrables en dashboards | 🟡 | **PASS (N/A)** | Sin métricas custom con `workspace.id` |

**Ítems evaluados:** 27 · **Pass:** 27 · **Fail:** 0

---

## Hallazgos (incumplimientos)

| Archivo:Línea | Ítem checklist | Regla incumplida | Severidad | Código actual | Fix |
|---------------|----------------|------------------|-----------|---------------|-----|
| — | — | — | — | Sin hallazgos en `src/routes/customer.py` | — |

---

## Notas operativas (no son hallazgos)

### Split log vs métrica — correcto en este archivo

| Señal | Implementación actual | Señal correcta |
|-------|----------------------|----------------|
| Volumen HTTP (traffic/errors/latency) | Auto-inst. `http.server.*` vía `main.py` | Métrica |
| Auditoría create/update | `audit_event` con `audit: True` | Log |
| 404 `customer_not_found` | `logger.warning` | Log (el middleware en `main.py` también emite `http_request_failed` para 4xx) |
| Fallo persistencia update | `logger.error` + `exc_info=True` | Log |

### Si en el futuro se requieren métricas de negocio CRUD

Antes de instrumentar este archivo:

1. Responder gate de propiedad (3.22): decisión operativa, consumidor, dashboard/alerta.
2. Buscar en catálogo — no existe namespace `demos` ni `customers` hoy; requeriría entrada nueva.
3. Métrica candidata (ejemplo, **no implementar sin aprobación**):

   ```
   demos.customers.actions.total
   Tipo: Counter | Unidad: {action}
   Atributos: workspace.id, action.type (list|get|create|update), status (success|failure)
   Cardinalidad estimada: ~500 workspaces × 4 actions × 2 status = ~4.000 series
   ```

   Cardinalidad ~4.000 → requiere aprobación Cloud Observability (3.19) antes de merge.

4. Habilitar `setup_observability(enable_metrics=True)` en `main.py` (ítem 0.5).
5. **No** duplicar `http.server.request.duration` ni `http.server.request.total` (3.16).

---

## Conteo de hallazgos por severidad

| Severidad | Cantidad |
|-----------|----------|
| CRÍTICO | 0 |
| ALTO | 0 |
| MEDIO | 0 |
| BAJO | 0 |
| **Total** | **0** |

---

## Verificación sugerida post-deploy (servicio, no archivo)

1. Confirmar `http.server.request.total` y `http.server.request.duration` en Metrics Explorer (~60s tras deploy).
2. Si se agregan métricas custom en este módulo: buscar `demos.customers.*` y validar tags `service.name`, `deployment.environment`.
