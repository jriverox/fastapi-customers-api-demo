# Catálogo de Métricas Simetrik

**Versión:** 1.0 | **Estado:** En Revisión — Incompleto
**Propietario:** Cloud Observability + Tech Leads por servicio

> Inventario oficial de métricas custom. Consultar antes de crear una métrica nueva.
> El estándar de diseño está en `.claude/observability/metrics.md`.
>
> ⚠️ **TODO — Catálogo incompleto:** Solo contiene los servicios del borrador inicial. Cada equipo debe validar y expandir su sección con las métricas actuales reales.

---

## 1. Métricas Cross-Service

Generadas automáticamente por la auto-instrumentación OTel. **No crear manualmente.**

### HTTP Layer (`http.*`)

| Métrica | Tipo | Unidad | Atributos | SLO |
|---|---|---|---|---|
| `http.server.request.duration` | Histogram | `s` | `http.method`, `http.route`, `http.status_code`, `service.name` | Latency p99 < 500ms |
| `http.server.request.total` | Counter | `{request}` | `http.method`, `http.route`, `http.status_code`, `service.name` | Availability 99.9% |
| `http.server.errors.total` | Counter | `{error}` | `http.method`, `http.route`, `http.status_code`, `exception.type`, `service.name` | Error rate < 0.1% |
| `http.server.active_requests` | UpDownCounter | `{request}` | `http.method`, `service.name` | — |

### DB Layer (`db.*`)

| Métrica | Tipo | Unidad | Atributos |
|---|---|---|---|
| `db.operation.duration` | Histogram | `s` | `db.system`, `db.operation`, `service.name` |
| `db.errors.total` | Counter | `{error}` | `db.system`, `db.operation`, `exception.type`, `service.name` |

---

## 2. lz — landing-zone-engine

**Namespace:** `lz` | **Servicio:** `lz-landing-zone-engine`

### Métricas obligatorias

| Métrica | Tipo | Unidad | Atributos | Alimenta SLO |
|---|---|---|---|---|
| `lz.files.processed.total` | Counter | `{file}` | `workspace.id`, `file.type`, `status` | Correctness 99.5% |
| `lz.file.processing.duration` | Histogram | `s` | `workspace.id`, `file.type` | Latency p99 |
| `lz.executions.active` | UpDownCounter | `{execution}` | `workspace.id` | Saturation |
| `lz.connection.errors.total` | Counter | `{error}` | `workspace.id`, `exception.type`, `connection.type` | Error rate |
| `lz.validation.errors.total` | Counter | `{error}` | `workspace.id`, `exception.type` | Correctness |

### Cardinalidad por atributo

| Atributo | Cardinalidad estimada | Valores |
|---|---|---|
| `workspace.id` | Media (< 500) | IDs de workspace |
| `file.type` | Baja (5-10) | `csv`, `xlsx`, `json`, `xml`, `txt` |
| `status` | Baja (2-5) | `success`, `failure`, `timeout` |
| `exception.type` | Media (5-30) | `timeout`, `validation_error`, `parse_error`, `auth_error` |
| `connection.type` | Baja (5-10) | `sftp`, `api`, `s3`, `email` |

### SLOs

| SLO | SLI | Métrica | Target |
|---|---|---|---|
| File Processing Availability | Archivos procesados exitosos / Total | `lz.files.processed.total` | 99.5% (28d) |
| File Processing Latency | p99 de duración | `lz.file.processing.duration` | p99 < 300s |

---

## 3. erp — erp-backend

**Namespace:** `erp` | **Servicio:** `erp-erp-backend`

> ⚠️ Validar con el team de ERP. Propuesta inicial basada en borrador original.

### Métricas obligatorias

| Métrica | Tipo | Unidad | Atributos | Alimenta SLO |
|---|---|---|---|---|
| `erp.entries.processed.total` | Counter | `{entry}` | `workspace.id`, `entry.type`, `status` | Correctness 99.5% |
| `erp.model.validation.duration` | Histogram | `s` | `workspace.id`, `model.id` | Latency |
| `erp.integration.calls.total` | Counter | `{call}` | `workspace.id`, `integration.name`, `status` | Availability |
| `erp.entries.retry.total` | Counter | `{retry}` | `workspace.id`, `exception.type` | Salud del sistema |
| `erp.actions.total` | Counter | `{action}` | `workspace.id`, `action.type`, `status` | — |

> ⚠️ `model.id` en `erp.model.validation.duration` puede tener cardinalidad alta. Evaluar usar `model.type` en su lugar.

### SLOs

| SLO | SLI | Métrica | Target |
|---|---|---|---|
| Entry Processing Correctness | Entradas exitosas / Total | `erp.entries.processed.total` | 99.5% (28d) |
| Integration Availability | Llamadas exitosas / Total | `erp.integration.calls.total` | 99.9% (28d) |

---

## 4. ur — web-backend

**Namespace:** `ur` | **Servicio:** `ur-web-backend`

> ⚠️ Validar con el team de UR. Propuesta inicial basada en borrador original.

### Métricas obligatorias

| Métrica | Tipo | Unidad | Atributos | Alimenta SLO |
|---|---|---|---|---|
| `ur.reconciliation.duration` | Histogram | `s` | `workspace.id` | Latency |
| `ur.records.reconciled.total` | Counter | `{record}` | `workspace.id`, `status` | Correctness |
| `ur.executions.total` | Counter | `{execution}` | `workspace.id`, `status` | Availability |
| `ur.unreconciled.count` | ObservableGauge | `{record}` | `workspace.id` | Saturation |
| `ur.source.sync.duration` | Histogram | `s` | `workspace.id`, `source.name` | Latency por fuente |

### SLOs

| SLO | SLI | Métrica | Target |
|---|---|---|---|
| Reconciliation Availability | Ejecuciones exitosas / Total | `ur.executions.total` | 99.9% (28d) |
| Reconciliation Correctness | Records exitosos / Total | `ur.records.reconciled.total` | 99.5% (28d) |

---

## 5. Plantilla para nuevo servicio

Copiar, completar y hacer PR. Cloud Observability debe revisar la cardinalidad antes de merge.

```markdown
## {N}. {namespace} — {nombre-del-servicio}

**Namespace:** `{namespace}` | **Servicio:** `{service.name}`

### Gate de propiedad — responder antes del PR

1. **¿Qué decisión operativa toma alguien con esta métrica?**
2. **¿Quién es el consumidor? (SRE, Producto, Engineering)**
3. **¿En qué dashboard o alerta aparecerá?**

Si no puedes responder las tres, la métrica no debe crearse todavía.

### Cálculo de cardinalidad

{nombre.metrica}:
  {atributo_1}: {N valores}
  {atributo_2}: {M valores}
  Cardinalidad = N × M = {total} series
  Tipo: Counter/Histogram
  Costo estimado = {total} × {multiplicador} = {custom_metrics} custom metrics
  ¿Supera 1,000 series? → {Sí/No} → {acción}

### Checklist antes de merge

- [ ] Gate de propiedad respondido
- [ ] Cardinalidad calculada — ninguna métrica supera 1,000 series sin aprobación de SRE
- [ ] Sin atributos prohibidos (`user.id`, `email`, `url` completa, `exception.message`)
- [ ] Unidades UCUM correctas
- [ ] Dashboard o alerta asociada identificada
- [ ] Al menos una métrica alimenta un SLI/SLO
- [ ] No duplica métrica existente en catálogo o auto-instrumentación
- [ ] Revisado por Cloud Observability
```
