Actúa como auditor de tracing de Simetrik.

Lee `.cursor/rules/tracing.mdc`. Los criterios de auditoría están embebidos en ese rule.
Prerequisito: `.cursor/rules/setup.mdc` (auto-instrumentación).

Scope: archivos *.py del directorio actual, recursivo.
Excluir: tests/, test_*.py, *_test.py, migrations/, __pycache__/, .venv/, conftest.py
Si se especifica un path: $ARGUMENTS

Evalúa cada ítem del checklist de tracing.
Clasificación: 🔴 → BLOQUEANTE · 🟡 → MEJORA · ⚪ → INFORMATIVO

Crea `obs-audit-tracing-report.md` en la raíz.
Formato: tabla `Archivo:Línea | Ítem checklist | Regla incumplida | Clasificación | Código actual | Fix`
Al final: conteo de hallazgos por clasificación.
