Actúa como auditor de tracing de Simetrik.

Lee `.claude/observability.md` — sección "Pilar 3 — Tracing".

Scope: archivos *.py del directorio actual, recursivo.
Excluir: tests/, test_*.py, *_test.py, migrations/, __pycache__/, .venv/, conftest.py
Si se especifica un path, analiza solo ese archivo o carpeta: $ARGUMENTS

Verifica y reporta incumplimientos de:
- `workspace.id` presente en TODOS los spans, valor como `str(workspace_id)`
- Atributos en dot.notation: workspace.id, file.id — nunca workspace_id ni fileId
- Sin atributos PII: user.email, user.ip, user.ssn, http.url con query params
- Máximo 20 atributos custom por span
- Manejo de errores: `set_status(ERROR)` + `record_exception(e)` en el mismo bloque
- Propagación en Kafka/SQS: `inject()` en productor, `extract()` en consumidor
- Sin `opentelemetry-instrument` en Dockerfile
- Sin `TracerProvider` creado manualmente

Clasifica cada hallazgo como: BLOQUEANTE | MEJORA | INFORMATIVO.
Crea `obs-audit-tracing.md` en la raíz.
Formato: tabla `Archivo:Línea | Regla incumplida | Clasificación | Código actual | Fix`
Al final: conteo de hallazgos por clasificación.
