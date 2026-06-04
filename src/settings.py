from pydantic_settings import BaseSettings, SettingsConfigDict


class Settings(BaseSettings):
    model_config = SettingsConfigDict(env_file=".env", case_sensitive=True)

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


settings = Settings() 