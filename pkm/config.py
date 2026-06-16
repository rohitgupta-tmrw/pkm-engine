from pydantic_settings import BaseSettings, SettingsConfigDict


class Settings(BaseSettings):
    model_config = SettingsConfigDict(env_file=".env", env_file_encoding="utf-8")

    anthropic_api_key: str = ""
    turso_url: str = ""
    turso_token: str = ""
    cf_account_id: str = ""
    cf_api_token: str = ""
    db_path: str = "pkm.db"
    vault_path: str = ""  # Path to pkm-vault root; passed to vault writer; set via VAULT_PATH env or CLI flag


settings = Settings()
