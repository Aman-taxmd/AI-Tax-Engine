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
from sqlalchemy import create_engine, text
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


def _apply_schema_patches() -> None:
    """Apply idempotent ALTERs that create_all() cannot perform on existing DBs."""
    engine = get_engine()
    if not engine.url.drivername.startswith("postgresql"):
        return

    desired_intake_input_types = (
        "input_type in ('currency','integer','boolean','choice','date',"
        "'currency_multi_instance','activities')"
    )
    with engine.begin() as conn:
        row = conn.execute(
            text(
                "SELECT pg_get_constraintdef(oid) FROM pg_constraint "
                "WHERE conname = 'ck_intake_questions_input_type'"
            )
        ).first()
        if row is not None and "activities" not in row[0]:
            conn.execute(text("ALTER TABLE intake_questions DROP CONSTRAINT ck_intake_questions_input_type"))
            conn.execute(
                text(
                    "ALTER TABLE intake_questions ADD CONSTRAINT ck_intake_questions_input_type "
                    f"CHECK ({desired_intake_input_types})"
                )
            )

        for col, col_type in (
            ("form_revision", "VARCHAR(64)"),
            ("pdf_content_hash", "VARCHAR(64)"),
        ):
            exists = conn.execute(
                text(
                    "SELECT 1 FROM information_schema.columns "
                    "WHERE table_name = 'pdf_field_mappings' AND column_name = :col"
                ),
                {"col": col},
            ).first()
            if not exists:
                conn.execute(text(f"ALTER TABLE pdf_field_mappings ADD COLUMN {col} {col_type}"))
        conn.execute(
            text(
                "CREATE INDEX IF NOT EXISTS idx_pdf_field_mappings_content_hash "
                "ON pdf_field_mappings (pdf_content_hash)"
            )
        )

        col_exists = conn.execute(
            text(
                "SELECT 1 FROM information_schema.columns "
                "WHERE table_name = 'cost_seg_field_templates' "
                "AND column_name = 'synthesized_canonical_field_id'"
            )
        ).first()
        if not col_exists:
            conn.execute(
                text(
                    "ALTER TABLE cost_seg_field_templates "
                    "ADD COLUMN synthesized_canonical_field_id VARCHAR(36) "
                    "REFERENCES canonical_fields(id)"
                )
            )

        dtype_row = conn.execute(
            text(
                "SELECT character_maximum_length FROM information_schema.columns "
                "WHERE table_name = 'canonical_fields' AND column_name = 'data_type'"
            )
        ).first()
        if dtype_row is not None and dtype_row[0] is not None and int(dtype_row[0]) < 128:
            conn.execute(text("ALTER TABLE canonical_fields ALTER COLUMN data_type TYPE VARCHAR(128)"))


def init_db() -> None:
    """Create all tables if they do not exist. Idempotent."""
    Base.metadata.create_all(get_engine())
    _apply_schema_patches()
