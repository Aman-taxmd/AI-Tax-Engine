"""Phase 8: LLM-as-judge grounding check, with a bounded automated repair
loop (see docs/adr/0008).

This is the third, independent LLM call site in the pipeline (after
extraction and the calc rule agent). Where the calc rule agent reads raw IRS
text and decides a formula, this reads the *already-synthesized* rule
(formula + operands) back against the exact quote it cites and judges
whether the rule is actually faithful to that quote — a genuinely different
model call, made at a different phase, on different inputs, so the calc
rule agent's own mistakes aren't just rubber-stamped by re-asking the same
question the same way (see build/graph/llm_client.py's judge_grounding()
docstring for why this has to be structurally separate).

Originally a failed judgment went straight to a human. That treated the
judge — which has the same access to the authoritative IRS quote a human
reviewer would — as strictly less capable than a human at fixing what it
just found wrong, which isn't true for the common case: the quote is fine,
the *formula construction* was wrong (wrong operation, an excluded line
summed anyway, a missing operand). For that case, and for the rarer case
where the *extraction* itself was incomplete, this now retries automatically
— bounded to MAX_REPAIR_ATTEMPTS so a genuinely unresolvable rule still
lands on a human's desk instead of looping forever:

  1. Judge the candidate rule (`judge_grounding`). Always recorded as one
     `EvaluationRun` row per attempt, regardless of outcome, for full
     auditability of the repair history.
  2. Pass (confidence >= threshold) -> promote candidate -> validated.
  3. Fail, attempts remain, and a real (non-stub) LLM classified a
     `likely_cause`:
     - "formula_construction": re-call `synthesize_calc_rule(feedback=...)`
       on the SAME quote and overwrite the rule's formula/operands in
       place — a `RuleStatusTransition` audit row is logged for the repair
       even though status doesn't change (still `candidate`).
     - "extraction_incomplete": re-extract via `extract_with_feedback`,
       persisting a brand-new, immutable `EvidenceBundle` + `KnowledgePacket`
       (the original packet's `superseded_by` links forward to it — the
       original is NEVER edited, per ADR 0002/0003), then re-run the calc
       rule agent against the refreshed quote.
     Either way, loop back to step 1 with the updated rule.
  4. Attempts exhausted (or `likely_cause == "unclear"`, or the repair
     itself couldn't produce a usable result) -> the existing
     `HumanReviewItem` path, unchanged — a human is always the eventual
     backstop; the loop never runs unbounded and never promotes a rule to
     `validated` on its own say-so without a passing judgment.

The stub judge (no LLM credentials) always reports `likely_cause="unclear"`
and never triggers a repair attempt — retrying a stub calc-rule
agent/extractor with a stub judge's feedback can't fix anything, so that
case goes straight to human review exactly as before.
"""
from __future__ import annotations

import hashlib
import re
from datetime import datetime, timezone

import structlog
from sqlalchemy import select

from build.graph.llm_client import (
    PROMPT_VERSION,
    STUB_MODEL_VERSION,
    CalcRuleDecision,
    GroundingJudgment,
    extract_with_feedback,
    judge_grounding,
    synthesize_calc_rule,
)
from db.models import (
    CalcRule,
    CanonicalField,
    DependencyEdge,
    Document,
    EvaluationRun,
    EvidenceBundle,
    HumanReviewItem,
    KnowledgePacket,
    RuleStatusTransition,
)
from db.session import get_session
from runtime.chain import form_field_condition, form_for_field_name

log = structlog.get_logger(__name__)

GROUNDED_CONFIDENCE_THRESHOLD = 0.75
MAX_REPAIR_ATTEMPTS = 3

_RULE_ID_FORM_RE = re.compile(r"^form_(.+?)_line_")


def _rules_for_scope(session, form: str, tax_year: int) -> list[CalcRule]:
    if form == "all":
        return list(
            session.query(CalcRule).filter(CalcRule.status == "candidate", CalcRule.tax_year == tax_year).all()
        )
    return list(
        session.execute(
            select(CalcRule).where(
                form_field_condition(CalcRule.rule_id, form),
                CalcRule.status == "candidate",
                CalcRule.tax_year == tax_year,
            )
        ).scalars().all()
    )


def _form_from_rule_id(rule_id: str) -> str:
    m = _RULE_ID_FORM_RE.match(rule_id)
    if m:
        return m.group(1)
    return form_for_field_name(rule_id) or rule_id


def _candidate_operands(session, form: str, exclude_field_name: str, tax_year: int) -> list[dict]:
    fields = session.execute(
        select(CanonicalField).where(
            form_field_condition(CanonicalField.field_name, form), CanonicalField.tax_year == tax_year
        )
    ).scalars().all()
    return [
        {"field_name": f.field_name, "line": f.source_form_line, "description": f.description}
        for f in fields
        if f.field_name != exclude_field_name
    ]


def _apply_formula_decision(session, rule: CalcRule, decision: CalcRuleDecision, valid_field_names: set[str]) -> bool:
    """Overwrites `rule`'s formula/operands/carryover_target and its
    field->field dependency edges from a fresh calc-rule-agent decision.
    Returns False (leaving `rule` untouched) if the decision can't produce a
    valid computed rule — the repair loop treats that as "still broken",
    never as a silent conversion to pure-input mid-repair."""
    if decision.is_pure_input:
        return False
    valid_operands = [op for op in decision.operand_field_names if op in valid_field_names and op != rule.rule_id]
    if not valid_operands:
        return False

    old_edges = session.execute(
        select(DependencyEdge).where(DependencyEdge.field_a == rule.rule_id, DependencyEdge.depends_on_type == "field")
    ).scalars().all()
    for edge in old_edges:
        session.delete(edge)

    conditions = [
        {
            "field": rule.rule_id,
            "operator": "==",
            "value": "exception_condition_met",
            "trigger_quote": c.get("trigger_quote", ""),
            "reason_if_true": c.get("reason_if_true", ""),
            "reason_if_false": c.get("reason_if_false", ""),
        }
        for c in decision.conditions
    ]
    formula = {"type": decision.formula_type or "sum", "operand_names": valid_operands}
    if conditions:
        formula["conditions"] = conditions

    operand_fields = {
        f.field_name: f
        for f in session.execute(
            select(CanonicalField).where(
                CanonicalField.field_name.in_(valid_operands), CanonicalField.tax_year == rule.tax_year
            )
        ).scalars().all()
    }
    rule.formula = formula
    rule.operands = [
        {"name": op, "source": f"canonical_field:{op}", "description": operand_fields[op].description}
        for op in valid_operands
        if op in operand_fields
    ]
    rule.carryover_target = decision.carryover_target
    rule.confidence_breakdown = {
        **(rule.confidence_breakdown or {}),
        "formula_confidence": decision.confidence,
        "calc_rule_agent_model_version": decision.model_version,
        "calc_rule_agent_reasoning": decision.reasoning,
    }
    for op in valid_operands:
        session.add(DependencyEdge(field_a=rule.rule_id, depends_on_type="field", depends_on_ref=op))
    session.flush()
    return True


def _repair_extraction(session, packet: KnowledgePacket, issues: list[str]) -> KnowledgePacket | None:
    """extraction_incomplete repair: re-extracts with the judge's issues as
    feedback, persisting a NEW immutable EvidenceBundle + KnowledgePacket
    (the original is never edited — ADR 0002/0003) and linking the old
    packet forward via `superseded_by`. Returns the new packet, or None if
    there's no original evidence bundle to rebuild scoped_context from
    (defensive — shouldn't happen for an LLM-extracted packet)."""
    old_bundle = session.get(EvidenceBundle, packet.evidence_bundle_id)
    if old_bundle is None or not old_bundle.exact_quotes:
        return None
    scoped_context = old_bundle.exact_quotes[0]
    feedback = "; ".join(issues) or "Phase 8 judge found this extraction incomplete or ambiguous."

    result = extract_with_feedback(scoped_context, packet.irs_line, feedback)

    confidence = {
        "extraction_confidence": result.extraction_confidence,
        "reference_resolution_confidence": (packet.confidence_breakdown or {}).get(
            "reference_resolution_confidence", 1.0
        ),
        "formula_confidence": 0.0,
    }
    content_hash = hashlib.sha256(
        (scoped_context + result.model_version + PROMPT_VERSION + feedback).encode()
    ).hexdigest()
    new_bundle = EvidenceBundle(
        source_type="llm_extraction",
        document_version_id=old_bundle.document_version_id,
        section_ids=old_bundle.section_ids,
        exact_quotes=[scoped_context],
        prompt_version=PROMPT_VERSION,
        model_version=result.model_version,
        temperature=0.0,
        extraction_timestamp=datetime.now(timezone.utc),
        reviewer="phase8_repair_loop",
        raw_llm_response=result.raw_response,
        confidence_breakdown=confidence,
        content_hash=content_hash,
    )
    session.add(new_bundle)
    session.flush()

    new_packet = KnowledgePacket(
        version=packet.version + 1,
        evidence_bundle_id=new_bundle.id,
        form_number=packet.form_number,
        irs_line=packet.irs_line,
        core_text=result.core_text,
        exceptions=result.exceptions,
        status="needs_review" if result.needs_more_context else "draft",
        confidence_breakdown=confidence,
    )
    session.add(new_packet)
    session.flush()
    packet.superseded_by = new_packet.id
    return new_packet


def run_grounding_check(form: str, tax_year: int = 2025) -> None:
    with get_session() as session:
        rules = _rules_for_scope(session, form, tax_year)
        if not rules:
            print(f"grounding check: no candidate calc rules found for form={form}")
            return

        passed = warned = failed = repaired_to_pass = 0
        for rule in rules:
            rule_form = _form_from_rule_id(rule.rule_id)
            valid_field_names = {
                f.field_name
                for f in session.execute(
                    select(CanonicalField).where(
                        form_field_condition(CanonicalField.field_name, rule_form),
                        CanonicalField.tax_year == rule.tax_year,
                    )
                ).scalars().all()
            }

            attempt = 0
            result: str | None = None
            judgment: GroundingJudgment | None = None
            while True:
                quote = (rule.irs_reference or {}).get("quote", "")
                if not quote:
                    log.warning("grounding_check.no_quote", rule_id=rule.rule_id)
                    break

                judgment = judge_grounding(quote=quote, formula=rule.formula, operands=rule.operands)

                if judgment.model_version == STUB_MODEL_VERSION:
                    result = "warn"
                elif judgment.grounded and judgment.confidence >= GROUNDED_CONFIDENCE_THRESHOLD:
                    result = "pass"
                else:
                    result = "fail"

                session.add(
                    EvaluationRun(
                        run_type="grounding_check",
                        target_type="calc_rule",
                        target_id=rule.id,
                        result=result,
                        detail={
                            "rule_id": rule.rule_id,
                            "grounded": judgment.grounded,
                            "confidence": judgment.confidence,
                            "issues": judgment.issues,
                            "likely_cause": judgment.likely_cause,
                            "model_version": judgment.model_version,
                            "repair_attempt": attempt,
                        },
                    )
                )
                rule.confidence_breakdown = {**(rule.confidence_breakdown or {}), "grounding_score": judgment.confidence}

                if result == "pass":
                    break

                can_repair = (
                    judgment.model_version != STUB_MODEL_VERSION
                    and attempt < MAX_REPAIR_ATTEMPTS
                    and judgment.likely_cause in ("formula_construction", "extraction_incomplete")
                )
                if not can_repair:
                    break

                attempt += 1
                canonical_field = session.get(CanonicalField, rule.canonical_field_id)
                line_number = canonical_field.source_form_line if canonical_field else ""
                applied = False

                if judgment.likely_cause == "formula_construction":
                    decision = synthesize_calc_rule(
                        field_name=rule.rule_id,
                        line_number=line_number,
                        quote=quote,
                        candidate_operands=_candidate_operands(session, rule_form, rule.rule_id, rule.tax_year),
                        feedback="; ".join(judgment.issues),
                    )
                    applied = _apply_formula_decision(session, rule, decision, valid_field_names)
                    session.add(RuleStatusTransition(
                        rule_id=rule.id, from_status=rule.status, to_status=rule.status,
                        changed_by=f"llm_repair_loop:{decision.model_version}",
                        reason=(
                            f"Phase 8 repair attempt {attempt}/{MAX_REPAIR_ATTEMPTS} (formula_construction): "
                            f"{'reformulated' if applied else 'agent could not produce a valid formula'}; "
                            f"issues={judgment.issues}"
                        ),
                    ))
                else:  # extraction_incomplete
                    packet = session.get(KnowledgePacket, rule.source_knowledge_packet_id) if rule.source_knowledge_packet_id else None
                    new_packet = _repair_extraction(session, packet, judgment.issues) if packet else None
                    if new_packet is not None:
                        rule.source_knowledge_packet_id = new_packet.id
                        rule.irs_reference = {**(rule.irs_reference or {}), "quote": new_packet.core_text}
                        decision = synthesize_calc_rule(
                            field_name=rule.rule_id,
                            line_number=line_number,
                            quote=new_packet.core_text,
                            candidate_operands=_candidate_operands(session, rule_form, rule.rule_id, rule.tax_year),
                        )
                        applied = _apply_formula_decision(session, rule, decision, valid_field_names)
                    session.add(RuleStatusTransition(
                        rule_id=rule.id, from_status=rule.status, to_status=rule.status,
                        changed_by=f"llm_repair_loop:{'reextracted' if new_packet else 'no_source_packet'}",
                        reason=(
                            f"Phase 8 repair attempt {attempt}/{MAX_REPAIR_ATTEMPTS} (extraction_incomplete): "
                            f"{'re-extracted and reformulated' if applied else 'repair could not produce a usable result'}; "
                            f"issues={judgment.issues}"
                        ),
                    ))

                if not applied:
                    break
                session.flush()
                # loop back to step 1: re-judge the repaired rule

            if judgment is None:
                continue  # no quote at all — nothing to record or repair

            if result == "pass":
                passed += 1
                if attempt > 0:
                    repaired_to_pass += 1
                session.add(
                    RuleStatusTransition(
                        rule_id=rule.id,
                        from_status=rule.status,
                        to_status="validated",
                        changed_by=f"llm_judge:{judgment.model_version}",
                        reason=(
                            f"Phase 8 grounding check passed (confidence={judgment.confidence:.2f})"
                            + (f" after {attempt} repair attempt(s)" if attempt else "")
                        ),
                    )
                )
                rule.status = "validated"
            else:
                if result == "fail":
                    failed += 1
                    reason = "; ".join(judgment.issues) or "LLM judge found the rule ungrounded"
                else:
                    warned += 1
                    reason = "; ".join(judgment.issues) or "LLM judge could not confirm grounding"
                doc = None
                doc_id = (rule.irs_reference or {}).get("document_id")
                if doc_id:
                    doc = session.get(Document, doc_id)
                detail = {
                    "rule_id": rule.rule_id,
                    "formula": rule.formula,
                    "operands": rule.operands,
                    "carryover_target": rule.carryover_target,
                    "irs_reference": rule.irs_reference,
                    "source_url": doc.source_url if doc else None,
                    "grounding_result": result,
                    "grounding_confidence": judgment.confidence,
                    "grounding_issues": judgment.issues,
                    "likely_cause": judgment.likely_cause,
                    "repair_attempts_exhausted": attempt,
                }
                # Re-running the grounding check for a rule that's already
                # awaiting review refreshes the existing pending item's
                # detail instead of piling up duplicates for the same rule.
                existing_item = session.execute(
                    select(HumanReviewItem).where(
                        HumanReviewItem.related_type == "calc_rule",
                        HumanReviewItem.related_id == rule.id,
                        HumanReviewItem.status == "pending",
                    )
                ).scalars().first()
                if existing_item is not None:
                    existing_item.reason = f"[grounding_check:{result}] rule={rule.rule_id}: {reason}"
                    existing_item.detail = detail
                else:
                    session.add(
                        HumanReviewItem(
                            related_type="calc_rule",
                            related_id=rule.id,
                            reason=f"[grounding_check:{result}] rule={rule.rule_id}: {reason}",
                            status="pending",
                            detail=detail,
                        )
                    )

        session.commit()

    print(
        f"grounding check complete (form={form}): {passed} passed -> validated "
        f"({repaired_to_pass} via the repair loop), {failed} failed -> human review, "
        f"{warned} warned -> human review"
    )


def resolve_calc_rule_review(
    item_id: str, action: str, reviewer: str, correction: dict | None = None
) -> None:
    """Resolves a `calc_rule` HumanReviewItem — the backstop for a rule the
    automated Phase 8 repair loop (see run_grounding_check above) either
    couldn't classify a fixable cause for, or exhausted MAX_REPAIR_ATTEMPTS
    on. Supports:
      * "accept": a human looked at the flagged issues and judges the rule
        correct anyway; promotes it to `validated` (a human override of the
        automated judgment).
      * "manual_correct": replaces the rule's formula/operands/
        carryover_target by hand and promotes it to `validated` — the same
        "hand-authored, grounded, cite everything" pattern used throughout
        this pilot (see cross_form_bridge.py), just triggered from the
        review queue UI instead of a one-off script.
    """
    with get_session() as session:
        item = session.get(HumanReviewItem, item_id)
        if item is None or item.related_type != "calc_rule":
            raise ValueError(f"no pending calc_rule review item with id={item_id!r}")
        rule = session.get(CalcRule, item.related_id)
        if rule is None:
            raise ValueError(f"calc rule {item.related_id!r} referenced by review item {item_id!r} not found")

        if action == "accept":
            reason = f"Human review: accepted despite Phase 8 flag (reviewer={reviewer})"
        elif action == "manual_correct":
            if not correction:
                raise ValueError("manual_correct requires a `correction` dict with formula/operands")
            rule.formula = correction.get("formula", rule.formula)
            rule.operands = correction.get("operands", rule.operands)
            rule.carryover_target = correction.get("carryover_target", rule.carryover_target)
            reason = f"Human review: manually corrected (reviewer={reviewer})"
        else:
            raise ValueError(f"unsupported action for a calc_rule review item: {action!r}")

        session.add(
            RuleStatusTransition(
                rule_id=rule.id, from_status=rule.status, to_status="validated",
                changed_by=f"human:{reviewer}", reason=reason,
            )
        )
        rule.status = "validated"

        item.status = "resolved"
        item.resolution_notes = reason
        item.resolved_at = datetime.now(timezone.utc)
        session.commit()

    print(f"calc_rule review item {item_id[:8]} resolved ({action}) -> rule {rule.rule_id} status=validated")
