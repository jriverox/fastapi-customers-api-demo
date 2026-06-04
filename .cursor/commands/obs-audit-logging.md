Actúa como auditor de logging de Simetrik.

Lee `.cursor/rules/logging.mdc`. Los criterios de auditoría están embebidos en ese rule.
Prerequisito de setup: verificar ítems 0.1–0.4 del setup embebidos en `.cursor/rules/setup.mdc`.

Scope: archivos *.py del directorio actual, recursivo.
Excluir: tests/, test_*.py, *_test.py, migrations/, __pycache__/, .venv/, conftest.py
Si se especifica un path: $ARGUMENTS

Evalúa cada ítem del checklist de logging (🔴 obligatorio, 🟡 recomendado).
Mapeo de severidad: 🔴 → CRÍTICO/ALTO · 🟡 → MEDIO · ⚪ → BAJO

Crea `obs-audit-logging-report.md` en la raíz.
Formato: tabla `Archivo:Línea | Ítem checklist | Regla incumplida | Severidad | Código actual | Fix`
Al final: conteo de hallazgos por severidad.
