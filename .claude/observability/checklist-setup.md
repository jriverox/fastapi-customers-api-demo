# Checklist — Setup Compartido

> Usado por: `obs-setup`, `obs-audit`
> **Leyenda:** 🔴 Obligatorio · 🟡 Recomendado · ⚪ Solo si aplica

Aplica a los tres pilares. Completar antes del primer deploy a staging.

---

## Antes del primer deploy

| # | Ítem | Clasificación | Cómo verificar |
|---|------|---------------|----------------|
| 0.1 | `setup_observability()` se invoca en el entrypoint (`main.py`, `apps.py` o `worker.py`) **antes** de cualquier lógica de negocio | 🔴 | La llamada aparece antes de imports de rutas, tasks o handlers |
| 0.2 | Auto-instrumentación del framework se ejecuta **después** de `setup_observability()` y **antes** de crear la app (FastAPI/Django) | 🔴 | Orden en código: `setup_observability()` → `FastAPIInstrumentor.instrument()` → `app = FastAPI()` |
| 0.3 | No se usa `logging.basicConfig()` — el SDK configura el handler raíz | 🔴 | Grep en el repo: sin `basicConfig(` |
| 0.4 | No se usa `opentelemetry-instrument` en el Dockerfile ni en el CMD de arranque | 🔴 | Revisar Dockerfile y scripts de startup |
| 0.5 | Si el servicio emite métricas custom: `setup_observability(enable_metrics=True)` | ⚪ | Solo servicios con Counter/Histogram propios |

## Variables de entorno

| # | Ítem | Clasificación | Cómo verificar |
|---|------|---------------|----------------|
| 0.6 | `OTEL_SERVICE_NAME` definido con formato `{project}-{service}` (ej. `lz-landing-zone-engine`) | 🔴 | Helm values, Doppler o `.env` del servicio |
| 0.7 | `OTEL_SERVICE_NAME` usa solo lowercase y guiones — sin región, sin underscores, mínimo 2 segmentos | 🔴 | Validar el valor contra la regla |
| 0.8 | `OTEL_ENVIRONMENT` definido con valor canónico: `production`, `staging` o `development` | 🔴 | Variables del deployment por ambiente |
| 0.9 | `OTEL_SERVICE_VERSION` definido — si falta, el servicio falla con `KeyError` al arrancar | 🔴 | Variables del deployment |
| 0.10 | `OTEL_COLLECTOR_ENDPOINT` apunta al collector correcto en staging/producción | 🔴 | En local puede omitirse (default `localhost:4317`); en cluster debe estar explícito |
| 0.11 | `LOG_LEVEL` configurado por ambiente (`INFO` en prod, `DEBUG` solo si se justifica) | 🟡 | Variables del deployment |
| 0.12 | `DEPLOYMENT_REGION` configurado si el servicio opera en múltiples regiones | ⚪ | Aparece como `service.region` en logs JSON |

## Validación en staging

| # | Ítem | Clasificación | Cómo verificar |
|---|------|---------------|----------------|
| 0.13 | El servicio arranca sin errores de observabilidad en los logs de startup | 🔴 | Logs del pod/container tras deploy |
| 0.14 | Logs JSON visibles en Datadog Logs Explorer con `service.name` correcto | 🔴 | `@service.name:<tu-servicio>` en Logs Explorer |
| 0.15 | Traces visibles en Datadog APM con el mismo `service.name` | 🔴 | APM → Services → buscar el servicio |
| 0.16 | Logs y traces correlacionados vía `trace_id` en un request HTTP de prueba | 🔴 | Abrir un log → clic en trace_id → debe abrir el span en APM |

---

Ver implementación completa en `.claude/observability/setup.md`.
