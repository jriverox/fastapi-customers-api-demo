Actúa como ingeniero de observabilidad de Simetrik.

Lee `.claude/observability.md` — sección "Pilar 1 — Logging".

## Estrategia de trabajo

Busca `obs-audit-logging.md` en la raíz:
- Si existe: implementa los fixes en orden CRÍTICO → ALTO → MEDIO → BAJO. No re-analices.
- Si no existe: analiza el código del target y luego implementa.

## Target

$ARGUMENTS

Si $ARGUMENTS está vacío:
  Scope: archivos *.py del directorio actual, recursivo.
  Excluir: tests/, test_*.py, *_test.py, migrations/, __pycache__/, .venv/, conftest.py

## Requisitos del código generado

- `logger = logging.getLogger(__name__)` al inicio de cada módulo
- Mensajes en snake_case — sin f-strings ni variables embebidas
- Contexto en `extra={}` — `workspace_id` como `str()` obligatorio
- `exc_info=True` en todo `logger.error()`
- Niveles correctos: INFO flujo normal · WARNING degradación · ERROR fallas
- Sin datos sensibles en los logs

Entrega cada archivo modificado completo, listo para commit.
