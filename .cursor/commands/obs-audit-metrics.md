Actúa como auditor de métricas de Simetrik.

Lee `.cursor/rules/metrics.mdc` y `.cursor/rules/metrics-catalog.mdc`. Los criterios de auditoría están embebidos en esos rules.
Prerequisito de setup: verificar ítem 0.5 (enable_metrics) en `.cursor/rules/setup.mdc` si hay métricas custom.

Scope: archivos *.py del directorio actual, recursivo.
Excluir: tests/, test_*.py, *_test.py, migrations/, __pycache__/, .venv/, conftest.py
Si se especifica un path: $ARGUMENTS

Evalúa cada ítem del checklist de métricas. Incluye estimación de cardinalidad por métrica custom encontrada.

Crea `obs-audit-metrics-report.md` en la raíz.
Formato: tabla `Archivo:Línea | Ítem checklist | Regla incumplida | Severidad | Código actual | Fix`
Al final: conteo de hallazgos por severidad.
