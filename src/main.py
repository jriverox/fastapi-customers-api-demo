import asyncio
import logging
import time

import uvicorn
from contextlib import asynccontextmanager
from fastapi import FastAPI, Request
from fastapi.responses import JSONResponse
from opentelemetry.instrumentation.fastapi import FastAPIInstrumentor

from .observability.setup import setup_observability
from .settings import settings

setup_observability()

from .database import Base, engine  # noqa: E402
from .models.customer import Customer  # noqa: E402, F401
from .routes import customer, healthcheck  # noqa: E402

logger = logging.getLogger(__name__)


@asynccontextmanager
async def lifespan(app: FastAPI):
    logger.info(
        "app_startup_started",
        extra={
            "version": settings.OTEL_SERVICE_VERSION,
            "environment": settings.OTEL_ENVIRONMENT,
        },
    )
    async with engine.begin() as conn:
        await conn.run_sync(Base.metadata.create_all)
    logger.info(
        "app_startup_completed",
        extra={
            "version": settings.OTEL_SERVICE_VERSION,
            "environment": settings.OTEL_ENVIRONMENT,
        },
    )
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
    workspace_id = request.headers.get("X-Workspace-ID", "unknown")
    try:
        response = await call_next(request)
        if response.status_code >= 400:
            level = "error" if response.status_code >= 500 else "warning"
            getattr(logger, level)(
                "http_request_failed",
                extra={
                    "workspace_id": workspace_id,
                    "http.method": request.method,
                    "http.route": request.url.path,
                    "http.status_code": response.status_code,
                    "duration_ms": round((time.time() - start) * 1000),
                },
            )
        return response
    except Exception:
        logger.error(
            "http_request_error",
            extra={
                "workspace_id": workspace_id,
                "http.method": request.method,
                "http.route": request.url.path,
            },
            exc_info=True,
        )
        return JSONResponse(status_code=500, content={"detail": "Internal server error"})


FastAPIInstrumentor.instrument_app(app)

app.include_router(healthcheck.router, prefix="/health", tags=["health"])
app.include_router(customer.router, prefix="/customers", tags=["customers"])


async def main():
    server = uvicorn.Server(
        uvicorn.Config(
            app,
            host=settings.HOST,
            port=settings.PORT,
        )
    )
    app_task = asyncio.create_task(server.serve())
    await asyncio.wait([app_task])


if __name__ == "__main__":
    asyncio.run(main())
