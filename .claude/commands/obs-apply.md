Actúa como ingeniero de observabilidad de Simetrik.

Lee `.claude/observability.md` para cargar los estándares de los tres pilares.

## Estrategia de trabajo

Busca `obs-audit-report.md` en la raíz:
- Si existe: implementa los fixes en orden CRÍTICO → ALTO → MEDIO → BAJO. No re-analices.
- Si no existe: analiza el código del target y luego implementa.

## Target

$ARGUMENTS

Si $ARGUMENTS está vacío:
  Scope: archivos *.py del directorio actual, recursivo.
  Excluir: tests/, test_*.py, *_test.py, migrations/, __pycache__/, .venv/, conftest.py

## Orden de implementación

1. Logging — sección "Pilar 1 — Logging" de .claude/observability.md
2. Métricas — sección "Pilar 2 — Métricas"
3. Tracing  — sección "Pilar 3 — Tracing"

## Requisitos del código generado

- Todos los imports incluidos — ninguno implícito
- Happy path + manejo de errores en el mismo bloque
- Sin print(), TODO, ... ni placeholders
- Listo para commit

Al terminar: lista de archivos modificados y resumen de cambios por archivo.
