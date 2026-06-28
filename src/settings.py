from pydantic_settings import BaseSettings

class Settings(BaseSettings):
    HOST: str = "0.0.0.0"
    PORT: int = 8001
    APP_NAME: str = "Customers API"
    DEBUG: bool = False
    API_V1_STR: str = "/api/v1"
    
    class Config:
        case_sensitive = True

settings = Settings() 