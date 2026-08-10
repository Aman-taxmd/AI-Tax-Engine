"""Hand-authored structured conditions for the HSA pilot's known
age/coverage-type-dependent adjustments.

Per the plan's "Structured conditions: hand-authored, not a generic DSL"
decision, the 2-3 known adjustments on Form 8889 are encoded here as small,
explicitly-cited Python functions -- the same "hand-specified, always
IRS-grounded, never invented" pattern used by
build/consolidation/cross_form_bridge.py for cross-form dependencies. This is
NOT a generic condition-extraction pipeline; every threshold below is copied
verbatim from the 2025 Form 8889 instructions already on file (see the
`quote` on each citation).

Every function below is called with `tax_year` (threaded from
runtime/engine.py's `compute()`) and reads its numeric thresholds from the
database-backed `runtime/tax_constants_lookup.py` (db/models.py's
`TaxConstants` table, seeded by scripts/seed_tax_constants.py) rather than a
module-level Python dict -- see docs/adr/0009-tax-year-scoping.md. Only the
*structure* of each adjustment (which threshold applies to which coverage
type/filing status, how the catch-up/phaseout math works) is hand-authored
Python; the *figures* are year-scoped data.

Scope: single taxpayer, single Form 8889 instance (no spouse / no
per-spouse allocation worksheets) -- see the plan's "Single-instance scope"
decision. `runtime/engine.py` is the only consumer of this module; it is
plain, LLM-free, deterministic Python (ADR 0005-compliant).
"""
from __future__ import annotations

from dataclasses import dataclass
from typing import Any, Callable

from runtime.tax_constants_lookup import get_tax_constant

_COVERAGE_LIMIT_CITATION = {
    "form": "8889",
    "line": "3",
    "quote": (
        "If you have self-only coverage, your maximum contribution is "
        "$4,300. If you have family coverage, your maximum contribution "
        "is $8,550."
    ),
    "source": "2025 Instructions for Form 8889, Figuring Your HSA Deduction",
}

_AGE_55_CATCHUP_CITATION = {
    "form": "8889",
    "line": "3",
    "quote": (
        "Note. If you are age 55 or older at the end of your tax year, "
        "you can make an additional contribution of $1,000."
    ),
    "source": "2025 Instructions for Form 8889, Part I\u2014HSA Contributions and Deductions",
}


@dataclass
class ConditionResult:
    """The outcome of evaluating one structured condition.

    `applied` distinguishes "the rule fired and changed the value" (e.g. the
    catch-up was added) from "the rule was evaluated but did not apply" (e.g.
    taxpayer is under 55) -- both are legitimate, non-error outcomes that the
    runtime trace should be able to tell apart.
    """

    value: float
    applied: bool
    explanation: str
    citation: dict[str, Any]


def coverage_type_base_limit(coverage_type: str, tax_year: int) -> ConditionResult:
    """Form 8889 Line 3 statutory base limit before any age-55 catch-up.

    `coverage_type` is the raw value of the `profile_hdhp_coverage_type`
    profile question: "self_only" or "family".
    """
    if coverage_type == "family":
        limit = get_tax_constant(tax_year, "hsa.family_limit")
        return ConditionResult(
            value=limit,
            applied=True,
            explanation=f"Family HDHP coverage for the full year -> ${limit:,.0f} base limit.",
            citation=_COVERAGE_LIMIT_CITATION,
        )
    if coverage_type == "self_only":
        limit = get_tax_constant(tax_year, "hsa.self_only_limit")
        return ConditionResult(
            value=limit,
            applied=True,
            explanation=f"Self-only HDHP coverage for the full year -> ${limit:,.0f} base limit.",
            citation=_COVERAGE_LIMIT_CITATION,
        )
    raise ValueError(f"unknown coverage_type: {coverage_type!r} (expected 'self_only' or 'family')")


def apply_age_55_catchup(base_limit: float, age: int, tax_year: int) -> ConditionResult:
    """Adds the age-55-catch-up amount to `base_limit` if `age` is at or past
    the catch-up threshold.

    Single-instance scope: this pilot always applies the full catch-up
    amount rather than the real per-month proration / married-allocation
    rules in the "Line 3 Limitation Chart and Worksheet" (out of scope --
    see module docstring).
    """
    threshold = get_tax_constant(tax_year, "hsa.age_55_catchup_threshold")
    if age >= threshold:
        catchup = get_tax_constant(tax_year, "hsa.age_55_catchup_amount")
        return ConditionResult(
            value=base_limit + catchup,
            applied=True,
            explanation=f"Age {age} >= {threshold} -> +${catchup:,.0f} catch-up contribution added to the base limit.",
            citation=_AGE_55_CATCHUP_CITATION,
        )
    return ConditionResult(
        value=base_limit,
        applied=False,
        explanation=f"Age {age} < {threshold} -> no catch-up contribution.",
        citation=_AGE_55_CATCHUP_CITATION,
    )


def line3_contribution_limit(profile_answers: dict[str, Any], tax_year: int) -> ConditionResult:
    """Form 8889 Line 3 = coverage-type base limit + age-55 catch-up.

    `profile_answers` is keyed by `question_key` from profile_questions.yaml
    (i.e. `profile_hdhp_coverage_type`, `profile_age`).
    """
    coverage_type = profile_answers.get("profile_hdhp_coverage_type")
    age = profile_answers.get("profile_age")
    if coverage_type is None or age is None:
        raise ValueError(
            "line3_contribution_limit requires 'profile_hdhp_coverage_type' and 'profile_age' answers"
        )
    base = coverage_type_base_limit(coverage_type, tax_year)
    final = apply_age_55_catchup(base.value, int(age), tax_year)
    return ConditionResult(
        value=final.value,
        applied=True,
        explanation=f"{base.explanation} {final.explanation}",
        citation={"coverage_base": base.citation, "age_55_catchup": final.citation},
    )


_STANDARD_DEDUCTION_CITATION = {
    "form": "1040",
    "line": "12e",
    "quote": (
        "For 2025, the standard deduction amount has been increased for all filers. The "
        "amounts are: $15,750\u2013Single or Married filing separately. $31,500\u2013Married "
        "filing jointly or Qualifying surviving spouse. $23,625\u2013Head of household."
    ),
    "source": "2025 Instructions for Form 1040 (i1040gi), What's New",
}

_TIPS_THRESHOLD_CITATION = {
    "form": "1040s1a",
    "line": "9",
    "quote": "Enter $150,000 ($300,000 if married filing jointly)",
    "source": "2025 Form 1040 Schedule 1-A, Part II, line 9 (form-printed worksheet text)",
}

_SENIOR_THRESHOLD_CITATION = {
    "form": "1040s1a",
    "line": "32",
    "quote": "Enter $75,000 ($150,000 if married filing jointly)",
    "source": "2025 Form 1040 Schedule 1-A, Part V, line 32 (form-printed worksheet text)",
}

_SENIOR_ELIGIBILITY_CITATION = {
    "form": "1040s1a",
    "line": "36a",
    "quote": (
        "If you have a valid social security number (see instructions) and were born before "
        "January 2, 1961, enter the amount from line 35"
    ),
    "source": "2025 Form 1040 Schedule 1-A, Part V, line 36a (form-printed worksheet text)",
}


def _filing_status_or_raise(profile_answers: dict[str, Any], caller: str) -> str:
    filing_status = profile_answers.get("profile_filing_status")
    if filing_status is None:
        raise ValueError(f"{caller} requires the 'profile_filing_status' answer")
    return filing_status


def standard_deduction(profile_answers: dict[str, Any], tax_year: int) -> ConditionResult:
    """Form 1040 Line 12e (Standard Deduction) -- see
    runtime/tax_constants_lookup.py's "standard_deduction" constants path for
    the grounded figures. 'married_filing_separately' pilot-simplification:
    this pilot doesn't model the "spouse itemizes" reduction-to-zero rule
    (Form 1040 Line 12b), so MFS always gets the full figure here."""
    filing_status = _filing_status_or_raise(profile_answers, "standard_deduction")
    table = get_tax_constant(tax_year, "standard_deduction")
    value = table.get(filing_status)
    if value is None:
        raise ValueError(f"no {tax_year} standard deduction figure for filing status {filing_status!r}")
    return ConditionResult(
        value=value,
        applied=True,
        explanation=f"{tax_year} standard deduction for filing status '{filing_status}': ${value:,.0f}.",
        citation=_STANDARD_DEDUCTION_CITATION,
    )


def tips_magi_threshold(profile_answers: dict[str, Any], tax_year: int) -> ConditionResult:
    """Schedule 1-A Line 9 -- the MAGI phaseout threshold Line 10 subtracts
    from Line 8 (a passthrough of Line 3/MAGI)."""
    filing_status = _filing_status_or_raise(profile_answers, "tips_magi_threshold")
    table = get_tax_constant(tax_year, "tips_deduction.magi_threshold")
    value = table.get(filing_status, table["_default"])
    return ConditionResult(
        value=value,
        applied=True,
        explanation=f"{tax_year} tips-deduction MAGI threshold for filing status '{filing_status}': ${value:,.0f}.",
        citation=_TIPS_THRESHOLD_CITATION,
    )


def senior_deduction_magi_threshold(profile_answers: dict[str, Any], tax_year: int) -> ConditionResult:
    """Schedule 1-A Line 32 -- the MAGI phaseout threshold Line 33 subtracts
    from Line 31 (a passthrough of Line 3/MAGI)."""
    filing_status = _filing_status_or_raise(profile_answers, "senior_deduction_magi_threshold")
    table = get_tax_constant(tax_year, "senior_deduction.magi_threshold")
    value = table.get(filing_status, table["_default"])
    return ConditionResult(
        value=value,
        applied=True,
        explanation=f"{tax_year} enhanced-senior-deduction MAGI threshold for filing status '{filing_status}': ${value:,.0f}.",
        citation=_SENIOR_THRESHOLD_CITATION,
    )


def senior_deduction_eligibility_flag(profile_answers: dict[str, Any], tax_year: int) -> ConditionResult:
    """Hand-authored gate feeding `form_1040s1a_line_36a` (not itself a real
    IRS line -- see build/consolidation/schedule_1a_bridge.py's
    `form_1040s1a_senior_eligible_flag` canonical field). Line 36a's real
    logic ("if you have a valid SSN ... and were born before January 2,
    1961, enter the amount from line 35") depends on a computed upstream
    field (line 35), which CONDITION_FIELDS functions can't read (they only
    ever receive `profile_answers` -- see runtime/engine.py). Expressing it
    as `multiply(line_35, this_flag)` in schedule_1a_bridge.py's calc rule
    sidesteps that with the engine's existing formula schema, no engine
    change needed. Single-taxpayer pilot scope: a valid SSN is assumed true
    (see runtime/condition_rules.py's module docstring for the same
    "single-taxpayer, no spouse" scoping used elsewhere); only the age test
    is actually evaluated."""
    age = profile_answers.get("profile_age")
    if age is None:
        raise ValueError("senior_deduction_eligibility_flag requires the 'profile_age' answer")
    threshold = get_tax_constant(tax_year, "senior_deduction.age_threshold")
    eligible = int(age) >= threshold
    return ConditionResult(
        value=1.0 if eligible else 0.0,
        applied=eligible,
        explanation=(
            f"Age {age} >= {threshold} -> eligible for the enhanced senior deduction."
            if eligible
            else f"Age {age} < {threshold} -> not eligible for the enhanced senior deduction."
        ),
        citation=_SENIOR_ELIGIBILITY_CITATION,
    )


def _derive_line1_from_coverage_type(profile_answers: dict[str, Any]) -> str | None:
    """Form 8889 Line 1's coverage-type checkbox, shadowed by the
    `profile_hdhp_coverage_type` question (see profile_questions.yaml's
    `shadows_canonical_field`) instead of asking twice."""
    return profile_answers.get("profile_hdhp_coverage_type")


def _derive_filing_status(profile_answers: dict[str, Any]) -> str | None:
    """Form 1040's filing-status checkbox group, shadowed by the
    `profile_filing_status` question (see profile_questions.yaml's
    `shadows_canonical_field`) instead of asking twice. `form_1040_filing_status`
    is a hand-authored canonical field (see build/consolidation/
    checkbox_field_bridge.py) -- the XSD/PDF walk that produces the rest of
    Form 1040's canonical fields never captured this one because, unlike
    every numbered line, the 5 filing-status boxes aren't associated with
    any single printed line number."""
    return profile_answers.get("profile_filing_status")


# Canonical field name -> function(profile_answers) -> ConditionResult.
# Consulted by runtime/engine.py for fields whose value is a hand-authored
# structured condition rather than a calc_rules formula or a raw taxpayer
# input. See the plan's "Structured conditions" decision.
CONDITION_FIELDS: dict[str, Callable[[dict[str, Any], int], ConditionResult]] = {
    "adjustments.hsa_limited_annual_deductible_amount": line3_contribution_limit,
    "form_1040_line_12e": standard_deduction,
    "form_1040s1a_line_9": tips_magi_threshold,
    "form_1040s1a_line_32": senior_deduction_magi_threshold,
    "form_1040s1a_senior_eligible_flag": senior_deduction_eligibility_flag,
}

# Canonical field name -> function(profile_answers) -> raw value. For fields
# that a profile question already shadows (see profile_questions.yaml), so
# the engine can seed that field's "input" value from the profile answer
# instead of prompting the taxpayer a second time.
DERIVED_FROM_PROFILE: dict[str, Callable[[dict[str, Any]], Any]] = {
    "deductions.hdhp_coverage_type": _derive_line1_from_coverage_type,
    "form_1040_filing_status": _derive_filing_status,
}
