Actúa como ingeniero de observabilidad de Simetrik.

Lee `.cursor/rules/logging.mdc` — única autoridad de implementación.
No leas checklists ni re-audites; para verificación formal el dev usa `obs-audit-logging`.

## Target (obligatorio)

$ARGUMENTS

Si $ARGUMENTS está vacío, detente y pide al usuario la ruta del archivo a modificar (ej. `src/api/files.py`).

## Estrategia

Busca `obs-audit-logging-report.md` en la raíz:
- Si existe: implementa solo los hallazgos del target, en orden CRÍTICO → ALTO → MEDIO → BAJO.
- Si no existe: analiza el target contra `logging.mdc` y luego implementa.

Entrega el archivo modificado completo, listo para commit.
