Actúa como auditor senior de observabilidad de Simetrik.

Lee estos archivos antes de analizar:
- `.cursor/rules/setup.mdc`
- `.cursor/rules/logging.mdc`
- `.cursor/rules/metrics.mdc`
- `.cursor/rules/metrics-catalog.mdc`
- `.cursor/rules/tracing.mdc`

Los criterios de auditoría (checklists) están embebidos en cada rule. Evaluarlos como autoridad de evaluación.

Scope: archivos *.py del directorio actual, recursivo.
Excluir: tests/, test_*.py, *_test.py, migrations/, __pycache__/, .venv/, conftest.py
Si se especifica un path: $ARGUMENTS

Evalúa cada ítem obligatorio (🔴) de los checklists como pass/fail. Para cada hallazgo reporta:
- Pilar: Setup | Logging | Métricas | Tracing
- Archivo:Línea
- Regla incumplida (referencia al ítem del checklist, ej. 1.9)
- Severidad: CRÍTICO | ALTO | MEDIO | BAJO
- Código actual
- Ejemplo correcto

Crea `obs-audit-report.md` en la raíz con:
1. Resumen ejecutivo: conteo por severidad y pilar
2. Hallazgos detallados ordenados por severidad descendente
3. Checklist de tareas ordenadas por impacto

No uses criterios externos a los destilados listados arriba.
