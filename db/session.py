"""Engine/session factory.

Resolution order for the database connection (highest priority first):
  1. ``DATABASE_URL`` env var — full SQLAlchemy URL, used as-is.
  2. ``DB_NAME``/``DB_USER``/``DB_PASSWORD``/``DB_HOST``/``DB_PORT`` env vars
     (same convention as TaxMD-TaxCore's .env) — assembled into a Postgres URL.
  3. A local SQLite file under ``var/`` — last-resort fallback so the pilot is
     still runnable with zero configuration.

db/schema.sql documents the authoritative production DDL (constraints, enums,
etc.) for a DBA provisioning a fresh Postgres instance by hand; day-to-day the
pipeline provisions tables itself via ``init_db()`` (SQLAlchemy metadata) so
the ORM models in db/models.py stay the single source of truth that's
actually exercised against both SQLite (dev) and Postgres (prod-like).
"""
from __future__ import annotations

import os
from pathlib import Path

from dotenv import load_dotenv
from sqlalchemy import create_engine
from sqlalchemy.orm import Session, sessionmaker

from db.models import Base

REPO_ROOT = Path(__file__).resolve().parent.parent
DEFAULT_SQLITE_PATH = REPO_ROOT / "var" / "ai_tax_engine.db"

load_dotenv(REPO_ROOT / ".env")


def get_database_url() -> str:
    url = os.environ.get("DATABASE_URL")
    if url:
        return url

    db_name = os.environ.get("DB_NAME")
    db_user = os.environ.get("DB_USER")
    if db_name and db_user:
        db_password = os.environ.get("DB_PASSWORD", "")
        db_host = os.environ.get("DB_HOST", "localhost")
        db_port = os.environ.get("DB_PORT", "5432")
        return f"postgresql+psycopg2://{db_user}:{db_password}@{db_host}:{db_port}/{db_name}"

    DEFAULT_SQLITE_PATH.parent.mkdir(parents=True, exist_ok=True)
    return f"sqlite:///{DEFAULT_SQLITE_PATH}"


_engine = None
_SessionLocal = None


def get_engine():
    global _engine
    if _engine is None:
        url = get_database_url()
        connect_args = {"check_same_thread": False} if url.startswith("sqlite") else {}
        _engine = create_engine(url, connect_args=connect_args)
    return _engine


def get_session() -> Session:
    global _SessionLocal
    if _SessionLocal is None:
        _SessionLocal = sessionmaker(bind=get_engine(), expire_on_commit=False)
    return _SessionLocal()


def init_db() -> None:
    """Create all tables if they do not exist. Idempotent."""
    Base.metadata.create_all(get_engine())
