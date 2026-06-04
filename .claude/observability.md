# Estándares de Observabilidad — Simetrik

> Stack: Python 3.11+ · OpenTelemetry SDK (raw) · Datadog (APM + Logs + Metrics)

## Archivos de referencia

| Archivo | Cuándo leerlo |
|---|---|
| `.claude/observability/setup.md` | Setup inicial, env vars, entrypoint |
| `.claude/observability/logging.md` | Implementar logging (`obs-apply-logging`) o contexto de audit |
| `.claude/observability/metrics.md` | Implementar métricas (`obs-apply-metrics`) o contexto de audit |
| `.claude/observability/metrics-catalog.md` | Buscar métrica existente antes de crear una nueva |
| `.claude/observability/tracing.md` | Implementar tracing (`obs-apply-tracing`) o contexto de audit |
| `.claude/observability/checklist-setup.md` | Auditar setup (`obs-setup`, `obs-audit`) — no usar en `obs-apply*` |
| `.claude/observability/checklist-logging.md` | Auditar logging (`obs-audit-logging`) — no usar en `obs-apply-logging` |
| `.claude/observability/checklist-metrics.md` | Auditar métricas (`obs-audit-metrics`) — no usar en `obs-apply-metrics` |
| `.claude/observability/checklist-tracing.md` | Auditar tracing (`obs-audit-tracing`) — no usar en `obs-apply-tracing` |

## Orden de implementación

1. Setup → 2. Logging → 3. Tracing → 4. Métricas

## Commands disponibles

| Command | Acción |
|---|---|
| `/obs-setup` | Crear setup + cablear entrypoint |
| `/obs-audit` | Auditar 3 pilares + setup |
| `/obs-audit-logging` | Auditar solo logging |
| `/obs-audit-metrics` | Auditar solo métricas |
| `/obs-audit-tracing` | Auditar solo tracing |
| `/obs-apply-logging` | Implementar logging en un archivo |
| `/obs-apply-metrics` | Implementar métricas en un archivo |
| `/obs-apply-tracing` | Implementar tracing en un archivo |

## Regla mnemotécnica

```
¿CUÁNTOS o qué tan RÁPIDO? → Métrica
¿QUIÉN o POR QUÉ?          → Log
¿DÓNDE en el flujo?        → Trace
```
