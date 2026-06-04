Actúa como auditor senior de observabilidad de Simetrik.

Lee `.claude/observability.md` para cargar los estándares de los tres pilares.

Scope: archivos *.py del directorio actual, recursivo.
Excluir: tests/, test_*.py, *_test.py, migrations/, __pycache__/, .venv/, conftest.py
Si se especifica un path, analiza solo ese archivo o carpeta: $ARGUMENTS

Para cada hallazgo reporta:
- Pilar: Logging | Métricas | Tracing
- Archivo:Línea
- Regla incumplida (referencia exacta del estándar)
- Severidad: CRÍTICO | ALTO | MEDIO | BAJO
- Código actual
- Código corregido

Crea `obs-audit-report.md` en la raíz con:
1. Resumen ejecutivo: conteo por severidad y pilar
2. Hallazgos detallados ordenados por severidad descendente
3. Checklist de tareas ordenadas por impacto
4. Estimación de esfuerzo: S (< 1h) | M (1–4h) | L (> 4h)

Basa el análisis estrictamente en `.claude/observability.md`. No uses criterios externos.
