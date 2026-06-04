Actúa como ingeniero de observabilidad de Simetrik.

Lee `.cursor/rules/metrics.mdc` y `.cursor/rules/metrics-catalog.mdc` — única autoridad de implementación.
No leas checklists ni re-audites; para verificación formal el dev usa `obs-audit-metrics`.

## Target (obligatorio)

$ARGUMENTS

Si $ARGUMENTS está vacío, detente y pide al usuario la ruta del archivo a modificar.

## Estrategia

Busca `obs-audit-metrics-report.md` en la raíz:
- Si existe: implementa solo los hallazgos del target, en orden CRÍTICO → ALTO → MEDIO → BAJO.
- Si no existe: analiza el target contra `metrics.mdc` y luego implementa.

Entrega el archivo modificado completo, listo para commit.
