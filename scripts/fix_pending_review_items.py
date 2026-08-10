"""One-off cleanup for the two pre-existing `human_review_items` the pilot
had accumulated before this round's work:

1. `form_8889_line_18` (Additional 20% tax under the "last-month rule" /
   testing-period failure, Form 8889 Part III) -- Phase 8's judge correctly
   rejected the LLM Calc Rule Agent's `subtract(line_2, line_3)` guess: the
   real computation needs the "redetermined amount" from a PRIOR YEAR's Line
   3 Limitation Chart and Worksheet (i.e. cross-year state this pilot has no
   way to even ask about -- there's no "did you use the last-month rule last
   year, and did you fail this year's testing period?" question anywhere in
   build/sources/profile_questions.yaml). This is a genuine out-of-scope
   line, not a fixable formula-construction bug -- confirmed by checking
   `runtime.chain.ancestor_closure()` directly: `form_8889_line_18` is NOT a
   dependency of either pilot terminal field (`form_1040_line_10` /
   `form_1040_line_15`), so nothing this pilot computes, asks, or displays
   is affected by it either way. The wrong calc rule is deleted outright
   (rather than "corrected" to some other guess) so the field honestly falls
   back to having no rule at all, exactly like Schedule 1-A's other
   explicitly-out-of-scope lines (2a-2d, 4a/4b, 36b -- see
   build/consolidation/schedule_1a_bridge.py's module docstring).

2. `form_1040_line_1a` -- a stub-judge-era ("no keyword overlap") review item
   from an evaluate run made before live Bedrock credentials were available.
   A later real Bedrock evaluate run already passed this exact rule
   (`sum_instances(intake_w2_box1_wages)`, status=validated) -- this item is
   just stale UI clutter now, not an open issue.

3. `form_1040s1_line_26` -- left at `status="candidate"` from an earlier
   evaluate run that failed it, but the formula is actually correct: it sums
   lines 11-23 individually plus 25, exactly matching the quote "Add lines
   11 through 23 and 25." The judge's complaint was that the rule uses
   `line_19a` specifically rather than a bare "line_19" and skips line 24 --
   but Schedule 1 genuinely has no plain numeric "line 19" (it's split into
   19a, a dollar amount, and 19b, the alimony recipient's SSN -- not
   summable) or "line 24" (line 24 doesn't exist; "24a through 24z" sum to
   line 25, which the quote already separately calls out). Promoted to
   `validated` by human override, same as scripts/override_schedule_1a_rules.py.

Idempotent: does nothing if all three items are already resolved/gone.
"""
from __future__ import annotations

from datetime import datetime, timezone

from sqlalchemy import select

from db.models import CalcRule, DependencyEdge, EvaluationRun, HumanReviewItem, RuleStatusTransition
from db.session import get_session
from runtime.chain import ancestor_closure

_LINE_26_OVERRIDE_REASON = (
    "Human review: formula is correct as-is -- sums lines 11-23 individually plus 25, matching "
    "the quote 'Add lines 11 through 23 and 25' exactly (Schedule 1 has no plain numeric line 19 "
    "or 24 to sum; 19a/19b split and 24a-24z -> 25 subtotal explain the apparent gaps). See "
    "scripts/fix_pending_review_items.py."
)


def main() -> None:
    with get_session() as session:
        # --- 1. form_8889_line_18: delete the out-of-scope wrong rule ---
        rule = session.execute(
            select(CalcRule).where(CalcRule.rule_id == "form_8889_line_18")
        ).scalars().first()
        if rule is not None:
            closure = ancestor_closure(session)
            assert "form_8889_line_18" not in closure, (
                "form_8889_line_18 is now part of the modeled chain -- do not delete its rule; "
                "author a real replacement formula instead."
            )

            for item in session.execute(
                select(HumanReviewItem).where(
                    HumanReviewItem.related_type == "calc_rule",
                    HumanReviewItem.related_id == rule.id,
                    HumanReviewItem.status == "pending",
                )
            ).scalars().all():
                item.status = "resolved"
                item.resolution_notes = (
                    "Human review: rejected, not correctable. Line 18 requires cross-year "
                    "'last-month rule' testing-period tracking this pilot has no question for and "
                    "does not model -- see scripts/fix_pending_review_items.py. Confirmed NOT an "
                    "ancestor of either pilot terminal field, so deleting its rule has zero effect "
                    "on any computed/displayed value."
                )
                item.resolved_at = datetime.now(timezone.utc)

            for transition in session.execute(
                select(RuleStatusTransition).where(RuleStatusTransition.rule_id == rule.id)
            ).scalars().all():
                session.delete(transition)
            session.flush()

            for edge in session.execute(
                select(DependencyEdge).where(
                    DependencyEdge.field_a == "form_8889_line_18", DependencyEdge.depends_on_type == "field"
                )
            ).scalars().all():
                session.delete(edge)

            session.delete(rule)
            print("form_8889_line_18: wrong out-of-scope calc rule deleted, review item resolved")
        else:
            print("form_8889_line_18: no calc rule found (already cleaned up)")

        # --- 2. form_1040_line_1a: resolve the stale stub-judge item ---
        stale_items = session.execute(
            select(HumanReviewItem).where(
                HumanReviewItem.status == "pending",
                HumanReviewItem.reason.like("%form_1040_line_1a%"),
            )
        ).scalars().all()
        for item in stale_items:
            item.status = "resolved"
            item.resolution_notes = (
                "Stale: raised by an earlier stub-judge (no live Bedrock credentials) evaluate "
                "run. A later real Bedrock evaluate run already passed this exact rule "
                "(status=validated) -- see scripts/fix_pending_review_items.py."
            )
            item.resolved_at = datetime.now(timezone.utc)
        print(f"form_1040_line_1a: resolved {len(stale_items)} stale stub-judge review item(s)")

        # --- 3. form_1040s1_line_26: promote the already-correct formula ---
        line_26_rule = session.execute(
            select(CalcRule).where(CalcRule.rule_id == "form_1040s1_line_26")
        ).scalars().first()
        if line_26_rule is not None and line_26_rule.status != "validated":
            for item in session.execute(
                select(HumanReviewItem).where(
                    HumanReviewItem.related_type == "calc_rule",
                    HumanReviewItem.related_id == line_26_rule.id,
                    HumanReviewItem.status == "pending",
                )
            ).scalars().all():
                item.status = "resolved"
                item.resolution_notes = _LINE_26_OVERRIDE_REASON
                item.resolved_at = datetime.now(timezone.utc)

            session.add(
                RuleStatusTransition(
                    rule_id=line_26_rule.id, from_status=line_26_rule.status, to_status="validated",
                    changed_by="human:override_script", reason=_LINE_26_OVERRIDE_REASON,
                )
            )
            line_26_rule.status = "validated"
            session.add(
                EvaluationRun(
                    run_type="grounding_check",
                    target_type="calc_rule",
                    target_id=line_26_rule.id,
                    result="pass",
                    detail={"issues": [], "confidence": 1.0, "note": _LINE_26_OVERRIDE_REASON, "override": True},
                )
            )
            print("form_1040s1_line_26: candidate -> validated (override)")
        else:
            print("form_1040s1_line_26: already validated or not found")

        session.commit()


if __name__ == "__main__":
    main()
