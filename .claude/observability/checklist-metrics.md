# Checklist — Métricas

> Usado por: `obs-audit-metrics`
> **Leyenda:** 🔴 Obligatorio · 🟡 Recomendado · ⚪ Solo si aplica
> Prerequisito de setup: verificar ítem 0.5 del `.claude/observability/checklist-setup.md` si hay métricas custom.

---

## Decisión métrica vs log vs trace

| # | Ítem | Clasificación | Cómo verificar |
|---|------|---------------|----------------|
| 3.1 | La métrica responde "¿cuántos?" o "¿qué tan rápido?" — no "¿quién?" ni "¿por qué?" | 🔴 | Revisar el propósito de cada métrica custom |
| 3.2 | No se usa métrica para datos de alta cardinalidad (`user.id`, `request.id`, `exception.message`) | 🔴 | Revisar atributos de cada instrumento |
| 3.3 | Eventos únicos o de auditoría van a logs, no a métricas | 🟡 | Sin Counter para eventos que ocurren 1 vez |

## Naming y cardinalidad

| # | Ítem | Clasificación | Cómo verificar |
|---|------|---------------|----------------|
| 3.4 | Nombre sigue `{namespace}.{entidad}.{accion}[.total]` (ej. `lz.files.processed.total`) | 🔴 | Revisar nombres en código |
| 3.5 | Delimitador punto, lowercase, unidad en metadata (`unit="s"`) no en el nombre | 🔴 | No usar `_`, `ms` en nombre ni `duration_seconds` |
| 3.6 | Counters terminan en `.total` — no `.count` | 🔴 | Grep de `create_counter` |
| 3.7 | Atributos usan `dot.notation` y valores canónicos de `status`: `success`, `failure`, `timeout` | 🔴 | No usar `ok`, `error`, `failed` |
| 3.8 | Cardinalidad total estimada < 1.000 series por métrica | 🔴 | Calcular: producto de valores únicos por atributo |
| 3.9 | Sin atributos prohibidos: `user.id`, `email`, `url` completa, `file.name`, `exception.message` | 🔴 | Code review de labels |
| 3.10 | `http.route` siempre parametrizada (`/api/v1/entries/{id}`) — nunca con IDs reales | 🟡 | Revisar rutas en atributos HTTP |

## Instrumentación

| # | Ítem | Clasificación | Cómo verificar |
|---|------|---------------|----------------|
| 3.11 | Meter obtenido con `otel_metrics.get_meter("<namespace>")` — namespace del servicio (`lz`, `erp`, `ur`) | 🔴 | Una sola instancia por módulo/servicio |
| 3.12 | Tipo de instrumento correcto: Counter / UpDownCounter / Histogram / ObservableGauge | 🔴 | Tabla de decisión en `.claude/observability/metrics.md` §1 |
| 3.13 | UpDownCounter: mismos atributos en `add(1)` y `add(-1)` — usar dict separado, nunca el mismo objeto mutado | 🔴 | Patrón acquire/release con dict fijo en `finally` |
| 3.14 | Histogramas: máximo 12 buckets, distribución logarítmica, incluye threshold del SLO | 🔴 | Revisar `boundaries` en código |
| 3.15 | Unidades UCUM: `s` para duración, `By` para bytes, `{request}` para requests | 🔴 | No usar `ms`, `kb`, `%` ni unidades sin aprobación |
| 3.16 | No se duplica métrica ya generada por auto-instrumentación (`http.server.*`) | 🔴 | Consultar `.claude/observability/metrics-catalog.md` antes de crear |
| 3.17 | Las 4 Golden Signals cubiertas (latency, traffic, errors, saturation) — vía auto-inst. o custom | 🔴 | Verificar en Metrics Explorer tras deploy |

## Costos y presupuesto

| # | Ítem | Clasificación | Cómo verificar |
|---|------|---------------|----------------|
| 3.18 | Cada métrica custom tiene dashboard, alerta o SLO asociado identificado | 🔴 | Gate de propiedad respondido |
| 3.19 | Cardinalidad 1.000–5.000 series → aprobación de Cloud Observability antes de merge | 🟡 | Documentar cálculo en el PR |
| 3.20 | Métricas sin consumidor identificadas para eliminación en próxima auditoría | 🟡 | Inventario en el catálogo del servicio |

## Catálogo corporativo (solo al proponer métrica nueva)

| # | Ítem | Clasificación | Cómo verificar |
|---|------|---------------|----------------|
| 3.21 | Consultado `.claude/observability/metrics-catalog.md` — no existe métrica equivalente | 🔴 | Buscar en catálogo antes de crear |
| 3.22 | Gate de propiedad respondido por escrito en el PR: decisión operativa, consumidor, dashboard/alerta | 🔴 | Tres respuestas documentadas en el PR |
| 3.23 | Cálculo de cardinalidad documentado en el PR con costo estimado | 🔴 | Plantilla en `.claude/observability/metrics-catalog.md` §5 |
| 3.24 | PR actualiza `.claude/observability/metrics-catalog.md` y `.cursor/rules/metrics-catalog.mdc` | 🔴 | Archivos incluidos en el diff del PR |

## Validación en Datadog

| # | Ítem | Clasificación | Cómo verificar |
|---|------|---------------|----------------|
| 3.25 | Métricas visibles en Metrics Explorer ~60 s después del deploy | 🔴 | Buscar por nombre `{namespace}.*` |
| 3.26 | Tags `service.name` y `deployment.environment` presentes | 🔴 | Panel de tags de la métrica |
| 3.27 | Atributos filtrables en dashboards (`workspace.id`, `status`, `exception.type`) | 🟡 | Crear query de prueba en Metrics Explorer |

## Anti-patrones frecuentes

| ❌ No hacer | ✅ Hacer en su lugar |
|-------------|---------------------|
| `counter.add(1, {"user.id": user_id})` | `user.id` en logs; en métricas solo `workspace.id` |
| `create_counter("lz.files.duration_seconds")` | `create_counter("lz.files.duration", unit="s")` |
| `create_counter("lz.files.processed.count")` | `create_counter("lz.files.processed.total")` |
| `add(1, attrs)` / `add(-1, {})` en UpDownCounter | Mismos atributos en incremento y decremento |
| Crear `http.server.request.duration` manualmente | Usar la de auto-instrumentación OTel |
| `boundaries = [100, 200, ..., 3000]` lineales | Máx. 12 buckets logarítmicos |
| `"status": "ok"` o `"status": True` | `"status": "success"` / `"failure"` / `"timeout"` |
| Métrica "por si acaso" sin dashboard ni alerta | Solo crear si hay consumidor identificado |

---

Ver reglas completas en `.claude/observability/metrics.md`.
