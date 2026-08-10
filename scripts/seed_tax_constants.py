"""Seeds db/models.py's `TaxConstants` table with the 2025 flat-dollar/rate
IRS constants -- the database-backed replacement for the `_2025`-suffixed
Python dict constants previously hardcoded in runtime/tax_constants.py and
runtime/condition_rules.py (see docs/adr/0009-tax-year-scoping.md).

Every figure below is grounded verbatim in an already-fetched, versioned IRS
document -- see the inline citation next to each one. This is a straight
migration of values already verified correct in this codebase (NOT copied
from TaxMD-TaxCore's own tax_constants_2025.json, which was found to be
stale -- see the "Year-agnostic tax_year architecture" plan's Context
section), plus 3 new self-employment constants this round's Schedule
C/SE/mileage build-out needs.

Idempotent: re-running replaces the existing row for the year (upsert on the
`tax_year` primary key), never leaves two rows for the same year.

Run: python -m scripts.seed_tax_constants
"""
from __future__ import annotations

from sqlalchemy import select

from db.models import TaxConstants
from db.session import get_session

TAX_YEAR = 2025

# Structure: nested dict keyed by stable, year-agnostic names. The year never
# appears inside a key -- only in which year's row this whole blob is stored
# under. All monetary amounts are plain float DOLLARS (never cents).
CONSTANTS_2025: dict = {
    # "For 2025, the standard deduction amount has been increased for all
    # filers. The amounts are: $15,750-Single or Married filing separately.
    # $31,500-Married filing jointly or Qualifying surviving spouse.
    # $23,625-Head of household." -- 2025 Instructions for Form 1040
    # (i1040gi), What's New.
    "standard_deduction": {
        "single": 15750.0,
        "married_filing_separately": 15750.0,
        "married_filing_jointly": 31500.0,
        "qualifying_surviving_spouse": 31500.0,
        "head_of_household": 23625.0,
    },
    # Form 8889 instructions, Part I-HSA Contributions and Deductions: "If
    # you have self-only coverage, your maximum contribution is $4,300. If
    # you have family coverage, your maximum contribution is $8,550." /
    # "Note. If you are age 55 or older at the end of your tax year, you can
    # make an additional contribution of $1,000."
    "hsa": {
        "self_only_limit": 4300.0,
        "family_limit": 8550.0,
        "age_55_catchup_amount": 1000.0,
        "age_55_catchup_threshold": 55,
    },
    # Schedule 1-A, Part II line 9 (form-printed worksheet text): "Enter
    # $150,000 ($300,000 if married filing jointly)". Line 7: "You can't
    # deduct more than $25,000 of those tips."
    "tips_deduction": {
        "magi_threshold": {"married_filing_jointly": 300000.0, "_default": 150000.0},
        "cap": 25000.0,
    },
    # Schedule 1-A, Part V line 32 (form-printed worksheet text): "Enter
    # $75,000 ($150,000 if married filing jointly)". Line 35: "Subtract line
    # 34 from $6,000" (single-filer figure; this pilot models no spouse --
    # see build/consolidation/schedule_1a_bridge.py). "Born before January
    # 2, 1961" -> age 65 by the end of the tax year (line 36a).
    "senior_deduction": {
        "magi_threshold": {"married_filing_jointly": 150000.0, "_default": 75000.0},
        "base_amount": 6000.0,
        "age_threshold": 65,
    },
    # Schedule SE regular method (Part I): net earnings factor 92.35% (IRC
    # Sec. 1402(a) - Schedule SE Part I line 4a, unchanged for decades),
    # combined SE tax rate 15.3% = 12.4% OASDI + 2.9% Medicare (Schedule SE
    # lines 10/11), half-SE-tax deduction factor 0.5 (line 13). "For 2025,
    # the maximum amount of self-employment income subject to social
    # security tax is $176,100." -- 2025 Instructions for Schedule SE
    # (i1040sse), General Instructions. Additional Medicare Tax thresholds:
    # "A 0.9% Additional Medicare Tax may apply to you if the total amount
    # on line 6 of all your Schedules SE exceeds one of the following
    # threshold amounts ... Married filing jointly-$250,000. Married filing
    # separately-$125,000. Single, Head of household, or Qualifying
    # surviving spouse-$200,000." -- same document.
    "self_employment": {
        "net_earnings_factor": 0.9235,
        "se_tax_rate": 0.153,
        "oasdi_rate": 0.124,
        "medicare_rate": 0.029,
        "deductible_se_tax_factor": 0.5,
        "oasdi_wage_base": 176100.0,
        "additional_medicare_tax_rate": 0.009,
        "additional_medicare_tax_threshold": {
            "married_filing_jointly": 250000.0,
            "married_filing_separately": 125000.0,
            "_default": 200000.0,
        },
    },
    # "For 2025, the standard mileage rate for the cost of operating your
    # car for business use is 70 cents per mile." / "Multiply the number of
    # business miles driven by 0.70." -- 2025 Instructions for Schedule C
    # (i1040sc), Line 9 / What's New.
    "mileage": {
        "standard_mileage_rate": 0.70,
    },
}

IRS_SOURCE_CITATION = (
    "2025 Instructions for Form 1040 (i1040gi) What's New [standard_deduction]; "
    "2025 Instructions for Form 8889, Part I [hsa]; "
    "2025 Form 1040 Schedule 1-A Parts II/V, form-printed worksheet text [tips_deduction, senior_deduction]; "
    "2025 Instructions for Schedule SE (i1040sse), General Instructions + Schedule SE Part I printed lines "
    "[self_employment]; "
    "2025 Instructions for Schedule C (i1040sc), What's New + Line 9 [mileage]."
)


def seed_tax_constants(tax_year: int = TAX_YEAR, constants: dict | None = None) -> None:
    constants = constants if constants is not None else CONSTANTS_2025
    with get_session() as session:
        existing = session.execute(
            select(TaxConstants).where(TaxConstants.tax_year == tax_year)
        ).scalars().first()
        if existing is not None:
            session.delete(existing)
            session.flush()

        session.add(
            TaxConstants(
                tax_year=tax_year,
                constants=constants,
                effective_date=f"{tax_year}-01-01",
                irs_source_citation=IRS_SOURCE_CITATION,
            )
        )
        session.commit()
    print(f"tax_constants seeded for tax_year={tax_year} ({len(constants)} top-level keys)")


if __name__ == "__main__":
    seed_tax_constants()
