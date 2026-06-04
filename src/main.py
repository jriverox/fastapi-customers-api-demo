import asyncio

import uvicorn
from contextlib import asynccontextmanager
from fastapi import FastAPI

from .settings import settings

from .database import Base, engine  # noqa: E402
from .models.customer import Customer  # noqa: E402, F401
from .routes import customer, healthcheck  # noqa: E402


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
