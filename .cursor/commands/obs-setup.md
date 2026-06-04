Actúa como ingeniero de observabilidad de Simetrik.

Lee `.cursor/rules/setup.mdc` y los criterios de setup allí definidos.

## Tareas (en orden)

1. Crear `observability/setup.py` con el snippet **tal cual** (imports, `StructuredJSONFormatter`, `setup_observability`).
2. Cablear el entrypoint del servicio (`main.py`, `apps.py` o `worker.py`):
   - `setup_observability()` antes de cualquier lógica de negocio
   - Instrumentor del framework después de setup y antes de crear la app (FastAPI/Django)
   - `enable_metrics=True` si el servicio emite métricas custom
3. Verificar variables de entorno obligatorias (`OTEL_SERVICE_NAME`, `OTEL_ENVIRONMENT`, `OTEL_SERVICE_VERSION`) en Helm/Doppler/`.env.example` si existen en el repo.
4. Confirmar ausencia de `logging.basicConfig()` y de `opentelemetry-instrument` en Dockerfile/CMD.

Scope: archivos *.py del directorio actual, recursivo.
Excluir: tests/, test_*.py, *_test.py, migrations/, __pycache__/, .venv/, conftest.py
Si se especifica un path: $ARGUMENTS

Entrega cada archivo creado o modificado completo, listo para commit.
Reporta qué ítems del checklist de setup quedaron cumplidos o pendientes.
