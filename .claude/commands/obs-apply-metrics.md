Actúa como ingeniero de observabilidad de Simetrik.

Lee `.claude/observability.md` — secciones "Pilar 2 — Métricas" y catálogo canónico.

## Estrategia de trabajo

Busca `obs-audit-metrics.md` en la raíz:
- Si existe: implementa los fixes en orden CRÍTICO → ALTO → MEDIO → BAJO. No re-analices.
- Si no existe: analiza el código del target y luego implementa.

## Target

$ARGUMENTS

Si $ARGUMENTS está vacío:
  Scope: archivos *.py del directorio actual, recursivo.
  Excluir: tests/, test_*.py, *_test.py, migrations/, __pycache__/, .venv/, conftest.py

## Requisitos del código generado

- Naming: `{namespace}.{entidad}.{accion}[.total]` en dot.notation
- Unidades UCUM: s, By, {request}, {error}, 1
- Tipo de instrumento adecuado al caso de uso
- Sin atributos de alta cardinalidad: user.id, request.id, trace.id
- Métricas del catálogo: usar nombre canónico exacto

Entrega cada archivo modificado completo, listo para commit.
