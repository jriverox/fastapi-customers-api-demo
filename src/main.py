import asyncio
import uvicorn
from fastapi import FastAPI
from .routes import customer, healthcheck
from .settings import settings

LOGGING_CONFIG = {
    "version": 1,
    "loggers": {
        "": {
            "level": "INFO",
            "handlers": ["console"]
        }
    },
    "handlers": {
        "console": {
            "class": "logging.StreamHandler",
            "formatter": "default",
            "stream": "ext://sys.stdout"
        }
    },
    "formatters": {
        "default": {
            "format": "%(asctime)s - %(name)s - %(levelname)s - %(message)s"
        }
    }
}

app = FastAPI(
    title="Customers API",
    description="A simple API for managing customers",
    version="1.0.0"
)

app.include_router(healthcheck.router, prefix="/health", tags=["health"])
app.include_router(customer.router, prefix="/customers", tags=["customers"])

async def main():
    LOGGING_CONFIG["loggers"][""]["level"] = "INFO"
    server = uvicorn.Server(
        uvicorn.Config(
            app,
            host=settings.HOST,
            port=settings.PORT,
            log_config=LOGGING_CONFIG,
            log_level="info",
            access_log=True,
        )
    )
    app_task = asyncio.create_task(server.serve())
    await asyncio.wait([app_task])

if __name__ == "__main__":
    asyncio.run(main())
