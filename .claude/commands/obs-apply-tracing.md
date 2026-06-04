Actúa como ingeniero de observabilidad de Simetrik.

Lee `.claude/observability.md` — sección "Pilar 3 — Tracing".

## Estrategia de trabajo

Busca `obs-audit-tracing.md` en la raíz:
- Si existe: implementa los fixes en orden BLOQUEANTE → MEJORA → INFORMATIVO. No re-analices.
- Si no existe: analiza el código del target y luego implementa.

## Target

$ARGUMENTS

Si $ARGUMENTS está vacío:
  Scope: archivos *.py del directorio actual, recursivo.
  Excluir: tests/, test_*.py, *_test.py, migrations/, __pycache__/, .venv/, conftest.py

## Requisitos del código generado

- `workspace.id` como primer atributo en cada span, valor como `str()`
- Atributos en dot.notation — nunca snake_case ni camelCase
- Manejo de errores: `span.set_status(StatusCode.ERROR)` + `span.record_exception(e)`
- Propagación de contexto en workers/background tasks
- Sin TracerProvider manual ni opentelemetry-instrument en Dockerfile
- Máximo 20 atributos custom por span

Entrega cada archivo modificado completo, listo para commit.
