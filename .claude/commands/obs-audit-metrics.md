Actúa como auditor de métricas de Simetrik.

Lee `.claude/observability.md` — secciones "Pilar 2 — Métricas" y catálogo canónico.

Scope: archivos *.py del directorio actual, recursivo.
Excluir: tests/, test_*.py, *_test.py, migrations/, __pycache__/, .venv/, conftest.py
Si se especifica un path, analiza solo ese archivo o carpeta: $ARGUMENTS

Verifica y reporta incumplimientos de:
- Naming: `{namespace}.{entidad}.{accion}[.total]` en dot.notation
- Unidades UCUM: s, By, {request}, {error}, {file}, 1 — nunca ms, KB, %, count
- Tipo de instrumento: Counter / UpDownCounter / Histogram / ObservableGauge
- Cardinalidad: sin user.id, request.id, trace.id, ip.address, exception.message
- UpDownCounter: mismos atributos en add(+1) y add(-1)
- Histogramas: buckets logarítmicos, máximo 12
- Sin duplicar métricas auto-instrumentadas (http.server.*, db.*)
- `MeterProvider` inicializado con exportación OTLP
- Métricas del catálogo: usar nombre canónico exacto

Incluye estimación de cardinalidad por cada métrica nueva encontrada.
Crea `obs-audit-metrics.md` en la raíz.
Formato: tabla `Archivo:Línea | Regla incumplida | Severidad | Código actual | Fix`
Al final: conteo de hallazgos por severidad.
