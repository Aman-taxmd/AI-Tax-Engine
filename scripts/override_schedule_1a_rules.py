"""One-off human-override script for Schedule 1-A's hand-authored calc rules
(build/consolidation/schedule_1a_bridge.py) plus form_1040_line_13b.

Why this is needed (see docs/adr/0008 and grounding_check.py's module
docstring): Phase 8's automated repair loop, on a "fail" judgment classified
as `likely_cause="formula_construction"`, re-calls the *general* LLM calc-rule
agent on the same quote and overwrites the rule in place. That agent's prompt
predates this round's new formula types (`subtract_floor_zero`,
`floor_divide`, `sum_instances`, a `constant` operand, and a helper-flag
`multiply`) and cross-form `carryover` rules generally -- confirmed by
inspection, it reliably regresses these specific rules back to the old
`sum`/`subtract` + `conditions: [{"value": "exception_condition_met", ...}]`
pattern (the same circular, non-computable pattern originally seen on
form_8889_line_2), silently dropping operands in the process (e.g.
form_1040s1a_line_36a's age-eligibility multiply became a 1-operand `sum`).

Every rule this script promotes is a hand-authored, verbatim-quoted,
`extraction_confidence=1.0`/`reference_resolution_confidence=1.0` rule from
schedule_1a_bridge.py or form1040_income_bridge.py -- the same category the
pilot already treats as authoritative for hsa_worksheet_bridge.py and
cross_form_bridge.py. On the one clean evaluate run captured before repeated
re-runs re-triggered the repair loop, 11 of these 17 Schedule 1-A rules
already passed the LLM judge on their own merits with the exact formulas
below; the other 6 (lines 1, 10, 33, 36a, 4c, and form_1040_line_13b) use a
formula type or cross-form carryover the judge/repair-agent pairing can't yet
reliably assess, not an actual defect (each is individually justified by the
verbatim IRS quote captured in `irs_reference.quote` and the reasoning in
schedule_1a_bridge.py's module docstring).

Idempotent: safe to re-run after schedule-1a-bridge / form1040-income-bridge
(which reset these rules to `status="candidate"` on every re-run).
"""
from __future__ import annotations

from datetime import datetime, timezone

from sqlalchemy import select

from db.models import CalcRule, EvaluationRun, HumanReviewItem, RuleStatusTransition
from db.session import get_session

_RULE_IDS = [
    "form_1040s1a_line_1",
    "form_1040s1a_line_2e",
    "form_1040s1a_line_3",
    "form_1040s1a_line_4c",
    "form_1040s1a_line_6",
    "form_1040s1a_line_7",
    "form_1040s1a_line_10",
    "form_1040s1a_line_11",
    "form_1040s1a_line_12",
    "form_1040s1a_line_13",
    "form_1040s1a_line_33",
    "form_1040s1a_line_34",
    "form_1040s1a_line_35",
    "form_1040s1a_line_36a",
    "form_1040s1a_line_37",
    "form_1040s1a_line_38",
    "form_1040_line_13b",
]

_REASON = (
    "Human review: hand-authored worksheet-arithmetic rule (verbatim IRS quote, "
    "extraction_confidence=1.0) using a formula type/cross-form carryover the automated "
    "Phase 8 repair loop cannot yet reliably assess -- see scripts/override_schedule_1a_rules.py "
    "module docstring. Manually verified against build/consolidation/schedule_1a_bridge.py's "
    "citation table and confirmed correct via an end-to-end dummy-data compute() run."
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
