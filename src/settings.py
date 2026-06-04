import os

from pydantic_settings import BaseSettings, SettingsConfigDict


class Settings(BaseSettings):
    model_config = SettingsConfigDict(
        env_file=".env",
        case_sensitive=True,
        extra="ignore",
    )

    HOST: str = "127.0.0.1"
    PORT: int = 8000
    DATABASE_URL: str
    APP_NAME: str = "Customers API"
    DEBUG: bool = False
    API_V1_STR: str = "/api/v1"

    # OTel — obligatorias, sin default (ValidationError al arranque si faltan)
    OTEL_SERVICE_NAME: str
    OTEL_ENVIRONMENT: str
    OTEL_SERVICE_VERSION: str
    OTEL_EXPORTER_OTLP_ENDPOINT: str = "http://localhost:4318"


settings = Settings()

for _otel_var in (
    "OTEL_SERVICE_NAME",
    "OTEL_ENVIRONMENT",
    "OTEL_SERVICE_VERSION",
    "OTEL_EXPORTER_OTLP_ENDPOINT",
):
    os.environ[_otel_var] = getattr(settings, _otel_var) 