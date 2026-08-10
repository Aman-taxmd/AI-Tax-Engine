"""One-time migration: add the `tax_year` column (+ updated uniqueness
constraints) to the four tables that were implicitly single-year --
canonical_fields, calc_rules, intake_questions, pdf_field_mappings -- and
create the new tax_constants table. See docs/adr/0009-tax-year-scoping.md
and the "Year-agnostic tax_year architecture" plan, Phase 1.

`db/session.py::init_db()` (SQLAlchemy `Base.metadata.create_all()`) only
CREATEs tables that don't exist yet -- it never ALTERs an existing table's
columns/constraints. Since this project's actual database already has
canonical_fields/calc_rules/intake_questions/pdf_field_mappings rows from
earlier build runs, adding `tax_year` to db/models.py alone does nothing to
the live schema; this script performs the actual ALTER TABLE migration.

Idempotent: every step is guarded (`IF NOT EXISTS` / existence checks before
DROP) so re-running is safe. Targets Postgres (the project's actual runtime
database, confirmed via db.session.get_database_url()) -- uses
information_schema/pg_constraint introspection rather than assuming
constraint names are pre-known, other than the ones already verified to
exist (see this script's inline comments).

Run: python -m scripts.migrate_tax_year_columns
"""
from __future__ import annotations

from sqlalchemy import text

from db.session import get_engine, init_db

DEFAULT_TAX_YEAR = 2025

_ADD_COLUMN_TABLES = ["canonical_fields", "calc_rules", "intake_questions", "pdf_field_mappings"]


def _column_exists(conn, table: str, column: str) -> bool:
    row = conn.execute(
        text(
            "SELECT 1 FROM information_schema.columns "
            "WHERE table_name = :table AND column_name = :column"
        ),
        {"table": table, "column": column},
    ).first()
    return row is not None


def _constraint_exists(conn, constraint_name: str) -> bool:
    row = conn.execute(
        text("SELECT 1 FROM pg_constraint WHERE conname = :name"),
        {"name": constraint_name},
    ).first()
    return row is not None


def run_migration() -> None:
    engine = get_engine()
    if not engine.url.drivername.startswith("postgresql"):
        raise RuntimeError(
            f"This migration targets Postgres only (got driver '{engine.url.drivername}'). "
            "See this script's module docstring."
        )

    with engine.begin() as conn:
        # 1. Add tax_year column (NOT NULL DEFAULT 2025 backfills existing
        # rows in the same statement -- Postgres 11+ does this without a
        # full table rewrite for a constant default).
        for table in _ADD_COLUMN_TABLES:
            if _column_exists(conn, table, "tax_year"):
                print(f"[skip] {table}.tax_year already exists")
                continue
            conn.execute(
                text(f"ALTER TABLE {table} ADD COLUMN tax_year INTEGER NOT NULL DEFAULT {DEFAULT_TAX_YEAR}")
            )
            print(f"[done] {table}.tax_year added, backfilled to {DEFAULT_TAX_YEAR}")

        # 2. canonical_fields: uq_canonical_fields_name_version ->
        # (field_name, version, tax_year)
        if _constraint_exists(conn, "uq_canonical_fields_name_version"):
            conn.execute(text("ALTER TABLE canonical_fields DROP CONSTRAINT uq_canonical_fields_name_version"))
            conn.execute(
                text(
                    "ALTER TABLE canonical_fields ADD CONSTRAINT uq_canonical_fields_name_version "
                    "UNIQUE (field_name, version, tax_year)"
                )
            )
            print("[done] canonical_fields unique constraint now includes tax_year")
        else:
            print("[skip] uq_canonical_fields_name_version not found (already migrated?)")

        # 3. calc_rules: uq_calc_rules_id_version -> (rule_id, version, tax_year)
        if _constraint_exists(conn, "uq_calc_rules_id_version"):
            conn.execute(text("ALTER TABLE calc_rules DROP CONSTRAINT uq_calc_rules_id_version"))
            conn.execute(
                text(
                    "ALTER TABLE calc_rules ADD CONSTRAINT uq_calc_rules_id_version "
                    "UNIQUE (rule_id, version, tax_year)"
                )
            )
            print("[done] calc_rules unique constraint now includes tax_year")
        else:
            print("[skip] uq_calc_rules_id_version not found (already migrated?)")

        # 4. intake_questions: plain UNIQUE(question_key) ->
        # UNIQUE(question_key, tax_year). The plain-unique constraint was
        # auto-named by Postgres (SQLAlchemy's `unique=True` column kwarg,
        # not an explicit UniqueConstraint) -- confirmed via pg_constraint
        # introspection to be `intake_questions_question_key_key`.
        if _constraint_exists(conn, "intake_questions_question_key_key"):
            conn.execute(
                text("ALTER TABLE intake_questions DROP CONSTRAINT intake_questions_question_key_key")
            )
            print("[done] dropped old plain-unique constraint on intake_questions.question_key")
        else:
            print("[skip] intake_questions_question_key_key not found (already migrated?)")
        if not _constraint_exists(conn, "uq_intake_questions_key_year"):
            conn.execute(
                text(
                    "ALTER TABLE intake_questions ADD CONSTRAINT uq_intake_questions_key_year "
                    "UNIQUE (question_key, tax_year)"
                )
            )
            print("[done] intake_questions now unique on (question_key, tax_year)")
        else:
            print("[skip] uq_intake_questions_key_year already exists")

        # 5. pdf_field_mappings: tax_year is a denormalized filter-only
        # column (uniqueness already correctly scoped via the
        # canonical_field_id FK once canonical_fields rows are year-tagged)
        # -- just add a supporting index.
        conn.execute(text("CREATE INDEX IF NOT EXISTS idx_pdf_field_mappings_year ON pdf_field_mappings (tax_year)"))
        print("[done] pdf_field_mappings.tax_year index ensured")

    # 6. Create the new tax_constants table (create_all only creates
    # missing tables, so this is safe to call unconditionally).
    init_db()
    print("[done] tax_constants table ensured via init_db()")

    print("\nMigration complete.")


if __name__ == "__main__":
    run_migration()
