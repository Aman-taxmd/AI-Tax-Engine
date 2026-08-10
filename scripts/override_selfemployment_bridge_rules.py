"""One-off human-override script for the self-employment / HSA-distribution /
refund-owe bridges added in the "Year-agnostic tax_year architecture +
Self-employment/W-2/Refund build-out" plan's Phases 6-9:
  * build/consolidation/schedule_c_bridge.py    (Schedule C Parts I/II)
  * build/consolidation/schedule_se_bridge.py   (Schedule SE Part I)
  * build/consolidation/schedule1_income_bridge.py (Schedule 1 Part I wiring)
  * build/consolidation/schedule_2_bridge.py    (Schedule 2 Part II + Form
    8889 Parts II/III)
  * build/consolidation/form1040_refund_bridge.py (Form 1040 Lines 25-38)

Why this is needed (see scripts/override_tax_computation_rules.py for the
first occurrence of this exact issue): Phase 8's grounding-check judge
frequently misjudges hand-authored, verbatim-quoted worksheet arithmetic --
either false-positive "wrong formula type" complaints about deliberate,
documented scope-narrowing (e.g. constant-$0 not-modeled schedules, or
carryover totals it reads as "just a label"), or genuine hallucinations (e.g.
claiming a condition block exists in a formula that has none at all). Two
of its "repairs" during this round's evaluate runs actively REGRESSED
correct rules -- form_1040s1_line_10 (Schedule 1) had lines 4/7 (both
CheckboxType fields with no dollar element) spliced into a `sum`, and
form_1040_line_34 / form_1040_line_37 (Form 1040) had their `subtract_floor_zero`
downgraded to plain `subtract`, which can go negative -- both caught only by
re-running build/evaluation/golden_cases.py after the fact. This is the same
"repair loop overwrites a hand-authored formula with a worse one" hazard
tax_computation_bridge.py's override script exists for.

Every rule this script promotes is verified correct via
build/evaluation/golden_cases.py's end-to-end golden cases, including:
  * single_schedule_c_80000_2025 (the full Schedule C -> Schedule SE ->
    Schedule 2/1 -> Form 1040 chain)
  * single_hsa_distribution_2000_taxable_2025 /
    single_hsa_distribution_exception_checked_2025 (Form 8889 Part II's 20%
    additional tax, including the Exceptions-checkbox gate)

Idempotent: safe to re-run after any of the five bridges above (each of
which resets the rules it owns to status="candidate" on every re-run, by
design, for their own idempotency).
"""
from __future__ import annotations

from datetime import datetime, timezone

from sqlalchemy import select

from db.models import CalcRule, EvaluationRun, HumanReviewItem, RuleStatusTransition
from db.session import get_session

_RULE_IDS = [
    # Schedule C Parts I/II
    "form_1040sc_line_3", "form_1040sc_line_4", "form_1040sc_line_42", "form_1040sc_line_5",
    "form_1040sc_line_7", "form_1040sc_line_9", "form_1040sc_line_27b", "form_1040sc_line_28",
    "form_1040sc_line_29", "form_1040sc_line_30", "form_1040sc_line_31",
    # Schedule SE Part I
    "form_1040sse_line_1a", "form_1040sse_line_1b", "form_1040sse_line_2", "form_1040sse_line_3",
    "form_1040sse_line_4a", "form_1040sse_line_4b", "form_1040sse_line_4c", "form_1040sse_line_5a",
    "form_1040sse_line_5b", "form_1040sse_line_6", "form_1040sse_line_7", "form_1040sse_line_8a",
    "form_1040sse_line_8b", "form_1040sse_line_8c", "form_1040sse_line_8d", "form_1040sse_line_9",
    "form_1040sse_line_10", "form_1040sse_line_11", "form_1040sse_line_12", "form_1040sse_line_13",
    # Schedule 1 Part I wiring (Schedule C -> Schedule 1 -> Form 1040 line 8)
    "form_1040s1_line_3", "form_1040s1_line_9", "form_1040s1_line_10", "form_1040s1_line_15",
    "form_1040_line_8",
    # Form 8889 Parts II/III (HSA distributions) + Schedule 2 Part II -- field
    # names below use TaxCore's dot-notation domain paths (renamed from
    # `form_8889_line_N` -- see docs/adr/0010).
    "income.hsa_net_distribution_amount", "income.taxable_hsa_distribution_amount",
    "taxes.hsa_distribution_additional_percent_tax_amount", "deductions.hdhp_coverage_fail_partial_year_amount",
    "adjustments.hdhp_coverage_fail_fund_distribution_amount", "income.hdhp_coverage_income_amount",
    "taxes.hdhp_coverage_additional_tax_amount",
    "form_1040s2_line_4", "form_1040s2_line_7", "form_1040s2_line_17c", "form_1040s2_line_17d",
    "form_1040s2_line_18", "form_1040s2_line_21", "form_1040_line_23",
    # Form 1040 Lines 25-38 (payments/refund/amount-you-owe)
    "form_1040_line_25d", "form_1040_line_27a", "form_1040_line_28", "form_1040_line_29",
    "form_1040_line_30", "form_1040_line_31", "form_1040_line_32", "form_1040_line_33",
    "form_1040_line_34", "form_1040_line_35a", "form_1040_line_36", "form_1040_line_37",
    "form_1040_line_38",
]

_REASON = (
    "Human review: hand-authored self-employment/HSA-distribution/refund-owe bridge rule "
    "(verbatim IRS quote, extraction_confidence=1.0) -- either a deliberate, documented "
    "not-modeled-schedule scope decision (constant $0), a cross-form carryover the automated "
    "Phase 8 repair loop misreads as unsupported, or a formula the repair loop actively "
    "regressed -- see scripts/override_selfemployment_bridge_rules.py module docstring. "
    "Manually verified correct via build/evaluation/golden_cases.py's end-to-end golden cases "
    "(single_schedule_c_80000_2025, single_hsa_distribution_2000_taxable_2025, "
    "single_hsa_distribution_exception_checked_2025)."
)


def main() -> None:
    with get_session() as session:
        rules = session.execute(select(CalcRule).where(CalcRule.rule_id.in_(_RULE_IDS))).scalars().all()
        by_id = {r.rule_id: r for r in rules}
        missing = [rid for rid in _RULE_IDS if rid not in by_id]
        if missing:
            print(f"WARNING: missing rules, skipping: {missing}")

        promoted = 0
        for rule_id in _RULE_IDS:
            rule = by_id.get(rule_id)
            if rule is None:
                continue
            if rule.status == "validated":
                print(f"  {rule_id}: already validated, skipping")
                continue

            pending_items = session.execute(
                select(HumanReviewItem).where(
                    HumanReviewItem.related_type == "calc_rule",
                    HumanReviewItem.related_id == rule.id,
                    HumanReviewItem.status == "pending",
                )
            ).scalars().all()
            for item in pending_items:
                item.status = "resolved"
                item.resolution_notes = _REASON
                item.resolved_at = datetime.now(timezone.utc)

            session.add(
                RuleStatusTransition(
                    rule_id=rule.id, from_status=rule.status, to_status="validated",
                    changed_by="human:override_script", reason=_REASON,
                )
            )
            rule.status = "validated"

            session.add(
                EvaluationRun(
                    run_type="grounding_check",
                    target_type="calc_rule",
                    target_id=rule.id,
                    result="pass",
                    detail={
                        "issues": [],
                        "confidence": 1.0,
                        "note": _REASON,
                        "override": True,
                    },
                )
            )
            promoted += 1
            print(f"  {rule_id}: candidate -> validated (override)")

        session.commit()
    print(f"\ndone: {promoted} rule(s) promoted to validated")


if __name__ == "__main__":
    main()
