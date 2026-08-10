"""Form 1040 Line 16 ("Tax") resolution -- the one line in this pilot's
chain that isn't a plain formula over other canonical fields, but a
year-and-filing-status-keyed lookup against the IRS Tax Table / Tax
Computation Worksheet data build/ingestion/tax_table_extractor.py loaded
into Postgres (`tax_datasets` + `tax_table_rows` / `tax_computation_brackets`).

Also encodes the Line 16 safety gate the user approved: this pilot has no
way to detect several real Line-16-affecting conditions (qualified
dividends/capital gains, foreign earned income, the kiddie tax, lump-sum
distributions, ...) because none of those forms/lines are modeled yet. Per
the approved decision table, that means every result this pilot computes is
`tier="provisional"` (never silently presented as a fully verified final tax
liability) rather than either (a) refusing to compute at all, or (b) acting
as if those conditions were verified absent. The one condition this pilot
CAN detect today -- capital gain on Line 7a -- is wired in defensively for
when Line 7a/Schedule D are modeled later; since Line 7a isn't collected yet
`detected_capital_gain` is always `None` today, so `tier="unsupported"`
never actually fires yet, but the mechanism is in place.

Pure, deterministic, LLM-free (ADR 0005) -- runtime/engine.py is the only
caller.
"""
from __future__ import annotations

from dataclasses import dataclass, field

from sqlalchemy import select

from db.models import TaxComputationBracket, TaxDataset, TaxTableRow
from db.session import get_session

TIER_VERIFIED = "verified"
TIER_PROVISIONAL = "provisional"
TIER_UNSUPPORTED = "unsupported"

METHOD_TAX_TABLE = "tax_table"
METHOD_TAX_COMPUTATION_WORKSHEET = "tax_computation_worksheet"
METHOD_UNSUPPORTED = "qualified_dividends_capital_gain_worksheet"

TAX_TABLE_CEILING = 100000.0

# Special Line 16 computations this pilot does not model at all (no Schedule
# D, Form 2555, Form 8615, Form 8814, Form 4972, or Line 3a/qualified
# dividends canonical fields exist yet) -- listed explicitly, rather than
# left as an unstated assumption, per the approved Line 16 design.
UNVERIFIED_CONDITIONS = [
    "form_1040_line_3a (qualified dividends)",
    "schedule_d (capital gains)",
    "form_2555 (foreign earned income)",
    "form_8615 (kiddie tax)",
    "form_8814 (child's income election)",
    "form_4972 (lump-sum distributions)",
]

_PROVISIONAL_ASSUMPTIONS = [
    "No qualified dividends are included.",
    "No special capital-gain tax worksheet applies.",
    "No foreign earned income tax worksheet applies.",
    "No kiddie tax or other special Line 16 computation applies.",
]

_LINE_16_CITATION = {
    "form": "1040",
    "line": "16",
    "quote": (
        "Tax (see instructions). Check if any from Form(s): 1 8814 2 4972 3"
    ),
    "source": "2025 Form 1040, Line 16 / 2025 Instructions for Form 1040 (i1040gi), Tax Table and Tax Computation Worksheet",
}


@dataclass
class Line16Result:
    ok: bool  # False means "unsupported": no numeric value, engine surfaces STATUS_UNSUPPORTED
    value: float | None
    method: str
    tier: str  # verified | provisional | unsupported
    assumptions: list[str] = field(default_factory=list)
    unverified_conditions: list[str] = field(default_factory=list)
    blocking_reason: str | None = None
    explanation: str = ""
    citation: dict = field(default_factory=dict)


def _active_dataset(session, tax_year: int, dataset_type: str) -> TaxDataset:
    dataset = session.execute(
        select(TaxDataset).where(
            TaxDataset.tax_year == tax_year,
            TaxDataset.dataset_type == dataset_type,
            TaxDataset.is_active.is_(True),
        )
    ).scalars().first()
    if dataset is None:
        raise LookupError(
            f"no active {dataset_type!r} dataset for tax_year={tax_year} -- "
            f"run `python -m build.cli extract-tax-table --tax-year {tax_year}` first"
        )
    return dataset


def lookup_federal_income_tax(taxable_income: float, filing_status: str, tax_year: int) -> tuple[float, str]:
    """Returns (amount, method). Raises LookupError if no matching dataset
    row exists (missing dataset, or an income/filing_status combination
    genuinely outside every bracket -- both real, actionable data problems,
    never silently defaulted)."""
    with get_session() as session:
        if taxable_income < TAX_TABLE_CEILING:
            dataset = _active_dataset(session, tax_year, "tax_table")
            row = session.execute(
                select(TaxTableRow).where(
                    TaxTableRow.dataset_id == dataset.id,
                    TaxTableRow.filing_status == filing_status,
                    TaxTableRow.at_least <= taxable_income,
                    TaxTableRow.less_than > taxable_income,
                )
            ).scalars().first()
            if row is None:
                raise LookupError(
                    f"no Tax Table row covers income={taxable_income} filing_status={filing_status!r} "
                    f"tax_year={tax_year}"
                )
            return row.tax_amount, METHOD_TAX_TABLE

        dataset = _active_dataset(session, tax_year, "tax_computation_brackets")
        bracket = session.execute(
            select(TaxComputationBracket).where(
                TaxComputationBracket.dataset_id == dataset.id,
                TaxComputationBracket.filing_status == filing_status,
                TaxComputationBracket.income_at_least <= taxable_income,
            ).order_by(TaxComputationBracket.bracket_order.desc())
        ).scalars().first()
        if bracket is None or (
            bracket.income_less_than is not None and taxable_income >= bracket.income_less_than
        ):
            raise LookupError(
                f"no Tax Computation Worksheet bracket covers income={taxable_income} "
                f"filing_status={filing_status!r} tax_year={tax_year}"
            )
        amount = round(taxable_income * bracket.rate - bracket.subtract_amount)
        return float(amount), METHOD_TAX_COMPUTATION_WORKSHEET


def resolve_line_16(
    taxable_income: float,
    filing_status: str,
    tax_year: int,
    detected_capital_gain: float | None = None,
) -> Line16Result:
    """`detected_capital_gain`: Form 1040 Line 7a's computed value, when this
    pilot models it -- always None today (Line 7a isn't collected), which is
    exactly what keeps every result `tier="provisional"` for now rather than
    `"unsupported"` or `"verified"`."""
    if detected_capital_gain is not None and detected_capital_gain > 0:
        return Line16Result(
            ok=False,
            value=None,
            method=METHOD_UNSUPPORTED,
            tier=TIER_UNSUPPORTED,
            unverified_conditions=UNVERIFIED_CONDITIONS,
            blocking_reason=(
                "A positive capital gain was reported (Form 1040 Line 7a). The required Qualified "
                "Dividends and Capital Gain Tax Worksheet is not supported by this pilot."
            ),
            explanation="Line 16 cannot be computed: a detected special-tax trigger is outside this pilot's supported scope.",
            citation=_LINE_16_CITATION,
        )

    amount, method = lookup_federal_income_tax(taxable_income, filing_status, tax_year)
    return Line16Result(
        ok=True,
        value=amount,
        method=method,
        tier=TIER_PROVISIONAL,
        assumptions=list(_PROVISIONAL_ASSUMPTIONS),
        unverified_conditions=UNVERIFIED_CONDITIONS,
        blocking_reason=None,
        explanation=(
            f"Estimated regular income tax: ${amount:,.0f} (via the {tax_year} "
            f"{'Tax Table' if method == METHOD_TAX_TABLE else 'Tax Computation Worksheet'}). "
            "This is a provisional estimate -- see 'assumptions'/'unverified_conditions'."
        ),
        citation=_LINE_16_CITATION,
    )
