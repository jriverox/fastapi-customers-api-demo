Actúa como auditor de logging de Simetrik.

Lee `.claude/observability.md` — sección "Pilar 1 — Logging".

Scope: archivos *.py del directorio actual, recursivo.
Excluir: tests/, test_*.py, *_test.py, migrations/, __pycache__/, .venv/, conftest.py
Si se especifica un path, analiza solo ese archivo o carpeta: $ARGUMENTS

Verifica y reporta incumplimientos de:
- `logging.getLogger(__name__)` — sin logger global ni custom handlers
- Mensajes en snake_case sin f-strings ni variables embebidas
- Contexto en `extra={}` — `workspace_id` obligatorio como `str()`
- Nivel de severidad correcto (DEBUG / INFO / WARNING / ERROR / CRITICAL)
- `exc_info=True` en todo `logger.error()`
- Campos prohibidos en `extra`: name, message, msg, levelname
- Datos sensibles filtrados: passwords, emails completos, IPs, tokens
- SDK OTel inicializado antes de lógica de negocio

Crea `obs-audit-logging.md` en la raíz.
Formato: tabla `Archivo:Línea | Regla incumplida | Severidad | Código actual | Fix`
Al final: conteo de hallazgos por severidad.
