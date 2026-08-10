"""Database-backed lookup for flat-dollar/rate IRS constants, keyed by
`tax_year` -- the year-agnostic replacement for the `_2025`-suffixed Python
dict constants previously hardcoded directly in runtime/tax_constants.py and
runtime/condition_rules.py (see docs/adr/0009-tax-year-scoping.md).

Mirrors the DB-backed lookup pattern already proven for the Tax Table
(runtime/tax_lookup.py): one `TaxConstants` row per year (db/models.py), a
single JSON blob (`constants`), read via a dotted path (e.g.
"standard_deduction.single", "self_employment.oasdi_wage_base"). Values
resolve to whatever is stored at that path -- a scalar (float/int) for a
single figure, or a nested dict for tables the caller further indexes by its
own key (e.g. filing status) -- so callers keep exactly the same
`.get(filing_status, default)` pattern they used against the old module-level
dicts.

Pure, deterministic, LLM-free (ADR 0005) -- consulted only by
runtime/condition_rules.py, never directly by runtime/engine.py or a
calc_rule formula.
"""
from __future__ import annotations

from typing import Any

from sqlalchemy import select

from db.models import TaxConstants
from db.session import get_session


class TaxConstantNotFoundError(LookupError):
    pass


def get_tax_constants_blob(tax_year: int) -> dict[str, Any]:
    """Returns the full `constants` JSON blob for `tax_year`.

    Raises:
        TaxConstantNotFoundError: if no `TaxConstants` row exists for the year.
    """
    with get_session() as session:
        row = session.execute(
            select(TaxConstants).where(TaxConstants.tax_year == tax_year)
        ).scalars().first()
    if row is None:
        raise TaxConstantNotFoundError(
            f"No tax_constants row for tax_year={tax_year} -- run scripts/seed_tax_constants.py "
            "for this year first."
        )
    return row.constants


def get_tax_constant(tax_year: int, path: str) -> Any:
    """Resolves a dotted `path` (e.g. "standard_deduction.single") against
    `tax_year`'s constants blob.

    Raises:
        TaxConstantNotFoundError: if no row exists for the year, or the path
            doesn't resolve to anything.
    """
    blob = get_tax_constants_blob(tax_year)
    node: Any = blob
    parts = path.split(".")
    for i, part in enumerate(parts):
        if not isinstance(node, dict) or part not in node:
            raise TaxConstantNotFoundError(
                f"tax_constants[{tax_year}] has no value at path {'.'.join(parts[:i + 1])!r} "
                f"(full path requested: {path!r})"
            )
        node = node[part]
    return node
