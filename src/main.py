import asyncio
import logging
import time

import uvicorn
from contextlib import asynccontextmanager
from fastapi import FastAPI, Request
from fastapi.responses import JSONResponse
from opentelemetry.instrumentation.fastapi import FastAPIInstrumentor
from opentelemetry.instrumentation.sqlalchemy import SQLAlchemyInstrumentor

from .settings import settings
from .observability import setup_observability

# OTel setup must run before importing any module that creates meters/tracers
# at module scope, and before app = FastAPI()
setup_observability(enable_metrics=True)
FastAPIInstrumentor.instrument()

from .database import Base, engine  # noqa: E402
from .models.customer import Customer  # noqa: E402, F401
from .routes import customer, healthcheck  # noqa: E402

SQLAlchemyInstrumentor().instrument()

logger = logging.getLogger(__name__)

LOGGING_CONFIG = {
    "version": 1,
    "loggers": {
        "": {
            "level": "DEBUG" if settings.DEBUG else "INFO",
            "handlers": ["console"],
        }
    },
    "handlers": {
        "console": {
            "class": "logging.StreamHandler",
            "formatter": "default",
            "stream": "ext://sys.stdout",
        }
    },
    "formatters": {
        "default": {
            "format": "%(asctime)s - %(name)s - %(levelname)s - %(message)s",
        }
    },
}


@asynccontextmanager
async def lifespan(app: FastAPI):
    async with engine.begin() as conn:
        await conn.run_sync(Base.metadata.create_all)
    yield


app = FastAPI(
    title="Customers API",
    description="A simple API for managing customers",
    version="1.0.0",
    lifespan=lifespan,
)


@app.middleware("http")
async def logging_middleware(request: Request, call_next):
    start = time.time()
    try:
        response = await call_next(request)
        elapsed = time.time() - start
        if response.status_code >= 500:
            logger.error("http_request_error", extra={
                "http.method": request.method,
                "http.route": request.url.path,
                "http.status_code": response.status_code,
                "duration_ms": round(elapsed * 1000),
            }, exc_info=True)
        elif response.status_code >= 400:
            logger.warning("http_request_client_error", extra={
                "http.method": request.method,
                "http.route": request.url.path,
                "http.status_code": response.status_code,
            })
        return response
    except Exception:
        logger.error("http_request_unhandled_error", extra={
            "http.method": request.method,
            "http.route": request.url.path,
        }, exc_info=True)
        return JSONResponse(status_code=500, content={"detail": "Internal server error"})


app.include_router(healthcheck.router, prefix="/health", tags=["health"])
app.include_router(customer.router, prefix="/customers", tags=["customers"])


async def main():
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
