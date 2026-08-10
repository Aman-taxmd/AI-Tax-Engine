"""Golden-case seeding + runner for the runtime engine (db/models.py's
`GoldenCase` table) -- end-to-end numeric assertions against
`runtime.engine.compute()`, independent of (and complementary to) Phase 8's
per-rule LLM grounding checks. A grounding check asks "does this ONE rule's
formula match its cited IRS quote?"; a golden case asks "does the WHOLE
chain, wired together, produce the exact right final numbers for a realistic
taxpayer scenario?" -- the check the plan's "CI-ready verification command"
requirement is aimed at for Lines 16-24 specifically (the Tax Table/Worksheet
lookup + its safety gate).

Each case's `inputs` is `{"answers": {...}, "profile_answers": {...},
"tax_year": 2025}`; any closure field that has no calc rule (a genuine
taxpayer-entered "pure input" line, e.g. every not-yet-modeled Schedule 1/
1040 adjustment this pilot leaves at $0) and isn't explicitly given in
`answers` is auto-defaulted (0.0 for amount fields, [] for multi-instance) so
a case only has to list what it actually cares about -- see
`_autofill_pure_inputs`. `expected_outputs` is `{field_name: expected_value}`
plus an optional `field_name.tier` key to also assert
`ComputedValue.verification["tier"]`.

Idempotent: `seed_golden_cases()` deletes and rewrites every case this module
owns (matched by `scenario` name) before inserting.
"""
from __future__ import annotations

from sqlalchemy import select

from db.models import CalcRule, CanonicalField, GoldenCase, IntakeQuestion
from db.session import get_session
from runtime.chain import ancestor_closure
from runtime.condition_rules import CONDITION_FIELDS, DERIVED_FROM_PROFILE
from runtime.engine import STATUS_OK, compute

# scenario -> (inputs, expected_outputs)
_GOLDEN_CASES: dict[str, tuple[dict, dict]] = {
    "single_w2_65k_hsa_3k_2025": (
        {
            "answers": {
                "intake_w2_box1_wages": [65000.0],
                "intake_w2_box12w_hsa_employer_contrib": [500.0],
                "adjustments.hsa_contribution_amount": 3000.0,  # Form 8889 line 2
            },
            "profile_answers": {
                "profile_age": 30,
                "profile_hdhp_coverage_type": "self_only",
                "profile_filing_status": "single",
            },
            "tax_year": 2025,
        },
        {
            "form_1040_line_1z": 65000.0,
            "form_1040_line_9": 65000.0,
            "form_1040_line_11a": 62000.0,
            "form_1040_line_12e": 15750.0,
            "form_1040_line_15": 46250.0,
            "form_1040_line_16": 5315.0,
            "form_1040_line_16.tier": "provisional",
            "form_1040_line_18": 5315.0,
            "form_1040_line_21": 0.0,
            "form_1040_line_22": 5315.0,
            "form_1040_line_24": 5315.0,
        },
    ),
    # Boundary case: taxable income landing exactly on the $100,000
    # Tax-Table/Tax-Computation-Worksheet seam (Single, no HSA/Schedule 1
    # activity) -- W-2 wages of $115,750 minus the $15,750 standard
    # deduction = exactly $100,000 taxable income, which must resolve via
    # the WORKSHEET (>= $100,000 uses the worksheet, not the table -- see
    # runtime/tax_lookup.py's TAX_TABLE_CEILING).
    "single_taxable_income_100000_boundary_2025": (
        {
            "answers": {"intake_w2_box1_wages": [115750.0]},
            "profile_answers": {
                "profile_age": 40,
                "profile_hdhp_coverage_type": "self_only",
                "profile_filing_status": "single",
            },
            "tax_year": 2025,
        },
        {
            "form_1040_line_15": 100000.0,
            "form_1040_line_16": 16914.0,
            "form_1040_line_16.tier": "provisional",
            "form_1040_line_24": 16914.0,
        },
    ),
    # Self-employment chain end to end: Schedule C -> Schedule SE ->
    # Schedule 1 (business income AND half-SE-tax deduction) -> Schedule 2
    # -> Form 1040, all the way through the refund/owe lines -- see
    # schedule_c_bridge.py / schedule_se_bridge.py / schedule1_income_bridge.py
    # / schedule_2_bridge.py / form1040_refund_bridge.py. Single filer,
    # $80,000 Schedule C gross receipts, no expenses, no W-2, well under the
    # $176,100 2025 SS wage base (so line 10's "smaller of line 6 or line 9"
    # picks line 6, not the wage-base ceiling -- see a future case for that
    # boundary).
    "single_schedule_c_80000_2025": (
        {
            "answers": {"form_1040sc_line_1": 80000.0},
            "profile_answers": {
                "profile_age": 40,
                "profile_hdhp_coverage_type": "self_only",
                "profile_filing_status": "single",
            },
            "tax_year": 2025,
        },
        {
            "form_1040sc_line_31": 80000.0,
            "form_1040sse_line_4a": 73880.0,
            "form_1040sse_line_12": 11303.64,
            "form_1040sse_line_13": 5651.82,
            "form_1040s1_line_10": 80000.0,
            "form_1040s1_line_26": 5651.82,
            "form_1040_line_9": 80000.0,
            "form_1040_line_11a": 74348.18,
            "form_1040_line_15": 58598.18,
            "form_1040_line_23": 11303.64,
            "form_1040_line_24": 19104.64,
            "form_1040_line_34": 0.0,
            "form_1040_line_37": 19104.64,
        },
    ),
    # Form 8889 Part II non-qualified HSA distribution -> the 20% additional
    # tax -> Schedule 2 line 17c -> Form 1040 line 23 -- see
    # schedule_2_bridge.py. $3,000 distributed, $1,000 spent on qualified
    # medical expenses -> $2,000 taxable distribution -> $400 additional tax
    # (no Exceptions box checked).
    "single_hsa_distribution_2000_taxable_2025": (
        {
            "answers": {
                "income.total_hsa_distribution_amount": 3000.0,  # Form 8889 line 14a
                "deductions.unreimbursed_qualified_medical_dental_expenses_amount": 1000.0,  # line 15
                "income.is_hsa_distribution_additional_tax_exception": False,  # line 17a
            },
            "profile_answers": {
                "profile_age": 40,
                "profile_hdhp_coverage_type": "self_only",
                "profile_filing_status": "single",
            },
            "tax_year": 2025,
        },
        {
            "income.taxable_hsa_distribution_amount": 2000.0,  # line 16
            "taxes.hsa_distribution_additional_percent_tax_amount": 400.0,  # line 17b
            "form_1040s2_line_17c": 400.0,
            "form_1040s2_line_21": 400.0,
            "form_1040_line_23": 400.0,
        },
    ),
    # Same scenario, but the taxpayer checks line 17a's Exceptions box --
    # the additional 20% tax must gate to exactly $0 (runtime/engine.py's
    # `multiply_unless_flag`), not just a smaller number.
    "single_hsa_distribution_exception_checked_2025": (
        {
            "answers": {
                "income.total_hsa_distribution_amount": 3000.0,  # Form 8889 line 14a
                "deductions.unreimbursed_qualified_medical_dental_expenses_amount": 1000.0,  # line 15
                "income.is_hsa_distribution_additional_tax_exception": True,  # line 17a
            },
            "profile_answers": {
                "profile_age": 40,
                "profile_hdhp_coverage_type": "self_only",
                "profile_filing_status": "single",
            },
            "tax_year": 2025,
        },
        {
            "income.taxable_hsa_distribution_amount": 2000.0,  # line 16
            "taxes.hsa_distribution_additional_percent_tax_amount": 0.0,  # line 17b
            "form_1040s2_line_17c": 0.0,
            "form_1040_line_23": 0.0,
        },
    ),
}


def _pure_input_fields(session, tax_year: int) -> set[str]:
    closure = ancestor_closure(session)
    fields = session.execute(
        select(CanonicalField).where(CanonicalField.field_name.in_(closure), CanonicalField.tax_year == tax_year)
    ).scalars().all()
    fields_by_id = {f.id: f for f in fields}
    rules = session.execute(
        select(CalcRule).where(
            CalcRule.canonical_field_id.in_(list(fields_by_id)),
            CalcRule.status != "superseded",
            CalcRule.tax_year == tax_year,
        )
    ).scalars().all()
    has_rule = {fields_by_id[r.canonical_field_id].field_name for r in rules if r.canonical_field_id in fields_by_id}
    return closure - has_rule - set(CONDITION_FIELDS) - set(DERIVED_FROM_PROFILE)


def _autofill_pure_inputs(session, answers: dict, tax_year: int) -> dict:
    pure_input_names = _pure_input_fields(session, tax_year)
    # NOT CanonicalField.cardinality -- several fields carry
    # cardinality='multi_instance' purely as an XSD artifact (a repeating
    # element group this single-taxpayer pilot never actually asks about as
    # a list -- see runtime/engine.py's "single-instance scope" docstring)
    # but are asked/answered as an ordinary scalar everywhere else (Question
    # Registry, ui/pages/2_Answer_Questions.py). The ACTUAL shape a field is
    # answered in is whatever asks/consumes it as a list: either its own
    # `currency_multi_instance` IntakeQuestion (today: just
    # intake_w2_box1_wages, the one field with its own dedicated question),
    # OR being the sole operand of a `sum_instances` calc rule (the W-2 Box
    # 2/3/5/12-W fields, which share the same "+ Add W-2" UI widget as Box 1
    # but have no IntakeQuestion of their own -- see
    # build/consolidation/w2_bridge.py's module docstring).
    multi_instance_field_names = {
        q.maps_to_canonical_field
        for q in session.execute(
            select(IntakeQuestion).where(
                IntakeQuestion.maps_to_canonical_field.in_(pure_input_names),
                IntakeQuestion.input_type == "currency_multi_instance",
                IntakeQuestion.tax_year == tax_year,
            )
        ).scalars().all()
    }
    for rule in session.execute(
        select(CalcRule).where(CalcRule.tax_year == tax_year)
    ).scalars().all():
        formula = rule.formula or {}
        if formula.get("type") == "sum_instances":
            multi_instance_field_names.update(formula.get("operand_names", []))
    filled = dict(answers)
    for name in pure_input_names:
        if name in filled:
            continue
        filled[name] = [] if name in multi_instance_field_names else 0.0
    return filled


def seed_golden_cases() -> None:
    with get_session() as session:
        scenarios = list(_GOLDEN_CASES)
        for old in session.execute(select(GoldenCase).where(GoldenCase.scenario.in_(scenarios))).scalars().all():
            session.delete(old)
        session.flush()

        for scenario, (inputs, expected_outputs) in _GOLDEN_CASES.items():
            session.add(
                GoldenCase(
                    form_number="1040",
                    scenario=scenario,
                    inputs=inputs,
                    expected_outputs=expected_outputs,
                    source="hand_authored",
                )
            )
        session.commit()

    print(f"golden cases seeded: {len(_GOLDEN_CASES)} scenario(s)")


def run_golden_cases() -> bool:
    """Runs every seeded GoldenCase through runtime.engine.compute() and
    checks each expected_outputs entry. Prints a pass/fail line per case (and
    per mismatched field) and returns True only if every case fully passed --
    see `python -m build.cli run-golden-cases`."""
    with get_session() as session:
        cases = session.execute(select(GoldenCase)).scalars().all()
        if not cases:
            print("no golden cases seeded -- run `python -m build.cli seed-golden-cases` first")
            return False

        all_passed = True
        for case in cases:
            profile_answers = case.inputs.get("profile_answers", {})
            tax_year = case.inputs.get("tax_year", 2025)
            answers = _autofill_pure_inputs(session, case.inputs.get("answers", {}), tax_year)

            computed = compute(answers, profile_answers, tax_year)

            case_ok = True
            failures = []
            for key, expected in case.expected_outputs.items():
                if key.endswith(".tier"):
                    field_name = key[: -len(".tier")]
                    cv = computed.get(field_name)
                    actual = (cv.verification or {}).get("tier") if cv else None
                else:
                    cv = computed.get(key)
                    if cv is None:
                        failures.append(f"{key}: not in closure/computed at all")
                        case_ok = False
                        continue
                    if cv.status != STATUS_OK:
                        failures.append(f"{key}: status={cv.status!r} (expected a resolved value {expected!r}) -- {cv.explanation}")
                        case_ok = False
                        continue
                    actual = cv.value
                if isinstance(expected, (int, float)) and isinstance(actual, (int, float)):
                    matches = abs(float(actual) - float(expected)) < 0.01
                else:
                    matches = actual == expected
                if not matches:
                    failures.append(f"{key}: expected {expected!r}, got {actual!r}")
                    case_ok = False

            status_label = "PASS" if case_ok else "FAIL"
            print(f"[{status_label}] {case.scenario}")
            for f in failures:
                print(f"         - {f}")
            all_passed = all_passed and case_ok

    print(f"golden cases: {'ALL PASSED' if all_passed else 'FAILURES DETECTED'} ({len(cases)} case(s))")
    return all_passed
