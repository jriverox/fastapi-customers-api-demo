Actúa como ingeniero de observabilidad de Simetrik.

Lee `.cursor/rules/tracing.mdc` — única autoridad de implementación.
No leas checklists ni re-audites; para verificación formal el dev usa `obs-audit-tracing`.

## Target (obligatorio)

$ARGUMENTS

Si $ARGUMENTS está vacío, detente y pide al usuario la ruta del archivo a modificar.

## Estrategia

Busca `obs-audit-tracing-report.md` en la raíz:
- Si existe: implementa solo los hallazgos del target, en orden BLOQUEANTE → MEJORA → INFORMATIVO.
- Si no existe: analiza el target contra `tracing.mdc` y luego implementa.

Entrega el archivo modificado completo, listo para commit.
