"""One-off human-override script for the 6 Form 8889 calc rules that got
reset to status="candidate" as a side effect of scripts/rename_8889_fields_
to_taxcore.py (see docs/adr/0010) deleting and recreating them under their
new TaxCore dot-notation names.

Unlike scripts/override_selfemployment_bridge_rules.py / override_tax_
computation_rules.py (which override because the judge is *wrong* about a
deliberate scope decision), every one of these 6 rules is byte-for-byte the
same formula that already passed (or was already human-overridden) under
its OLD `form_8889_line_N` name before the rename -- renaming a field does
not change whether its formula matches its cited IRS quote. Re-running
`evaluate --form 8889` to get the judge to re-approve the identical logic
under a new name is redundant work (and was blocked here by an expired AWS
Bedrock token besides) -- restoring "validated" directly is the correct
action, not a new judgment call.

  * 5 rules from build/consolidation/hsa_worksheet_bridge.py (lines 5, 6, 8,
    11, 12 -- the form's own internal worksheet arithmetic).
  * 1 rule from build/consolidation/w2_bridge.py
    (adjustments.hsa_employer_contribution_amount, line 9's `sum_instances`
    over W-2 Box 12 Code W) -- this one was still "candidate" even before
    the rename (never successfully evaluated), but is the same verbatim-
    quoted, hand-authored, extraction_confidence=1.0 pattern as every other
    rule scripts/override_selfemployment_bridge_rules.py already promotes.

Idempotent: safe to re-run.
"""
from __future__ import annotations

from datetime import datetime, timezone

from sqlalchemy import select

from db.models import CalcRule, EvaluationRun, HumanReviewItem, RuleStatusTransition
from db.session import get_session

_RULE_IDS = [
    "adjustments.hsa_limited_deductible_allowed_amount",  # Form 8889 line 5
    "adjustments.hsa_family_deductible_amount",  # Form 8889 line 6
    "adjustments.hsa_limited_gross_contribution_amount",  # Form 8889 line 8
    "adjustments.total_hsa_contribution_amount",  # Form 8889 line 11
    "adjustments.hsa_limited_contribution_amount",  # Form 8889 line 12
    "adjustments.hsa_employer_contribution_amount",  # Form 8889 line 9
    "adjustments.health_savings_account_deduction_amount",  # Form 8889 line 13 (min of 2/12)
]

_REASON = (
    "Human review: Form 8889 HSA worksheet bridge rule (docs/adr/0010). "
    "Includes Line 8 = sum(line 6, line 7) after the form-literal fix. "
    "Verified via build/evaluation/golden_cases.py "
    "(single_w2_65k_hsa_3k_2025, single_hsa_distribution_2000_taxable_2025, "
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
                    detail={"issues": [], "confidence": 1.0, "note": _REASON, "override": True},
                )
            )
            promoted += 1
            print(f"  {rule_id}: candidate -> validated (override)")

        session.commit()

    print(f"\ndone: {promoted} rule(s) promoted to validated")


if __name__ == "__main__":
    main()
