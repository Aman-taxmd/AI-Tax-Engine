"""Phase 7: Calc Rule synthesis — LLM Calc Rule Agent (see docs/adr/0008).

Previously this phase (and Phase 6's field->field dependency detection in
build/consolidation/dependency_graph.py) was pure regex: a small verb-keyword
list decided formula type, and "line N" mentions became hard dependency
edges regardless of context. That had no way to distinguish a real
composition ("add line 9") from an exclusion ("do NOT include line 9"),
silently dropped operands whose line number didn't exactly match a `Section`
(e.g. worksheet-only lines), and defaulted to a bare "sum" guess whenever no
known verb matched.

This phase now calls `llm_client.synthesize_calc_rule()` once per canonical
field, scoped to that field's exact IRS quote (untruncated) plus the REAL
list of every other canonical field already known for this form — the
LLM can only choose operands that actually exist, and is explicitly
instructed to recognize exclusion language and to refuse to guess a formula
it isn't confident about (see the stub's docstring for the no-credentials
behavior). It is also the sole writer of field->field `dependency_edges`
now; `dependency_graph.py` only writes field->concept edges.

Every rule is written with status="candidate" — nothing here is production
until Phase 8's evaluation checks pass. Re-running this for a form is
idempotent: existing calc rules / field->field dependency edges / pending
calc_rule review items for the form are cleared first, since the agent is
now the sole source of truth for "how is this line calculated".
"""
from __future__ import annotations

import structlog
from sqlalchemy import select

from build.graph.llm_client import synthesize_calc_rule
from db.models import (
    CalcRule,
    CanonicalField,
    DependencyEdge,
    Document,
    HumanReviewItem,
    KnowledgePacket,
    RuleStatusTransition,
    Section,
)
from db.session import get_session
from runtime.chain import form_field_condition

log = structlog.get_logger(__name__)

# Forms where calc rules are deterministic (engine or hand bridges) — skip LLM synthesis.
CALC_RULE_SKIP_FORMS = frozenset({"4562", "1040se", "w2"})


def _form_document_ids(session, form: str) -> list[str]:
    return list(session.execute(select(Document.id).where(Document.form_number == form)).scalars().all())


def _line_section(session, form: str, line_number: str, doc_ids: list[str]) -> Section | None:
    if not doc_ids:
        return None
    return session.execute(
        select(Section).where(Section.irs_line_ref == line_number, Section.document_id.in_(doc_ids))
    ).scalars().first()


def _clear_existing(session, form: str, field_names: list[str], tax_year: int) -> None:
    """Idempotent regeneration: the calc rule agent is the sole authority for
    a form's field->field edges and calc rules, so a re-run must not leave
    stale rows (old operands, old candidate rules, or review items pointing
    at a rule id that's about to be deleted) behind."""
    old_rules = session.execute(
        select(CalcRule).where(form_field_condition(CalcRule.rule_id, form), CalcRule.tax_year == tax_year)
    ).scalars().all()
    old_rule_ids = [r.id for r in old_rules]
    if old_rule_ids:
        pending_items = session.execute(
            select(HumanReviewItem).where(
                HumanReviewItem.related_type == "calc_rule",
                HumanReviewItem.related_id.in_(old_rule_ids),
                HumanReviewItem.status == "pending",
            )
        ).scalars().all()
        for item in pending_items:
            session.delete(item)
        # A rule that went through Phase 8's bounded repair loop (see
        # grounding_check.py) has RuleStatusTransition audit rows
        # FK-referencing it -- must be deleted before the rule itself, or
        # this raises rule_status_transitions_rule_id_fkey.
        old_transitions = session.execute(
            select(RuleStatusTransition).where(RuleStatusTransition.rule_id.in_(old_rule_ids))
        ).scalars().all()
        for transition in old_transitions:
            session.delete(transition)
        # No ORM `relationship()` links CalcRule <-> RuleStatusTransition
        # (see db/models.py), so SQLAlchemy's unit-of-work can't infer the
        # delete ordering on its own -- force the transition deletes to hit
        # the DB before the rule deletes are even queued.
        session.flush()
        for rule in old_rules:
            session.delete(rule)

    old_edges = session.execute(
        select(DependencyEdge).where(
            DependencyEdge.field_a.in_(field_names), DependencyEdge.depends_on_type == "field"
        )
    ).scalars().all()
    for edge in old_edges:
        session.delete(edge)
    session.flush()


def run_calc_rule_synthesis(form: str, tax_year: int = 2025) -> None:
    if form in CALC_RULE_SKIP_FORMS:
        print(
            f"calc rule synthesis: skipped for form={form} "
            f"(deterministic engine/bridge — use synthesize --canonical-only or w2-bridge)"
        )
        return
    with get_session() as session:
        doc_ids = _form_document_ids(session, form)

        fields = session.execute(
            select(CanonicalField).where(
                form_field_condition(CanonicalField.field_name, form), CanonicalField.tax_year == tax_year
            )
        ).scalars().all()
        if not fields:
            print(f"calc rule synthesis: no canonical fields found for form={form}")
            return
        field_names = [f.field_name for f in fields]
        fields_by_name = {f.field_name: f for f in fields}

        _clear_existing(session, form, field_names, tax_year)

        packets = session.execute(
            select(KnowledgePacket).where(KnowledgePacket.form_number == form)
        ).scalars().all()
        packets_by_line = {p.irs_line: p for p in packets}

        pure_input = 0
        computed = 0
        skipped_no_packet = 0

        for field in fields:
            packet = packets_by_line.get(field.source_form_line)
            if packet is None:
                skipped_no_packet += 1
                log.warning("calc_rule_agent.no_packet", field=field.field_name)
                continue

            candidate_operands = [
                {"field_name": other.field_name, "line": other.source_form_line, "description": other.description}
                for other in fields
                if other.field_name != field.field_name
            ]

            decision = synthesize_calc_rule(
                field_name=field.field_name,
                line_number=field.source_form_line,
                quote=packet.core_text,
                candidate_operands=candidate_operands,
            )

            if decision.is_pure_input or not decision.operand_field_names:
                pure_input += 1
                continue

            # The agent is constrained to the candidate list in its prompt,
            # but never trust an LLM's output as if it were validated input —
            # silently drop any operand name that doesn't actually exist
            # rather than writing a dangling dependency edge.
            valid_operands = [op for op in decision.operand_field_names if op in fields_by_name and op != field.field_name]
            if not valid_operands:
                pure_input += 1
                log.warning("calc_rule_agent.no_valid_operands", field=field.field_name, raw=decision.operand_field_names)
                continue

            line_section = _line_section(session, form, field.source_form_line, doc_ids)
            conditions = [
                {
                    "field": field.field_name,
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

            operands = [
                {
                    "name": op,
                    "source": f"canonical_field:{op}",
                    "description": fields_by_name[op].description,
                }
                for op in valid_operands
            ]

            irs_reference = {
                "document_id": line_section.document_id if line_section else None,
                "section_anchor": line_section.anchor_id if line_section else None,
                "quote": packet.core_text,  # untruncated — fixes the old 500-char slice bug
            }

            confidence_breakdown = {
                **(packet.confidence_breakdown or {}),
                "formula_confidence": decision.confidence,
                "calc_rule_agent_model_version": decision.model_version,
                "calc_rule_agent_reasoning": decision.reasoning,
            }

            rule = CalcRule(
                rule_id=field.field_name,
                status="candidate",
                canonical_field_id=field.id,
                formula=formula,
                operands=operands,
                carryover_target=decision.carryover_target,
                irs_reference=irs_reference,
                source_knowledge_packet_id=packet.id,
                confidence_breakdown=confidence_breakdown,
                tax_year=tax_year,
            )
            session.add(rule)

            for op in valid_operands:
                session.add(DependencyEdge(field_a=field.field_name, depends_on_type="field", depends_on_ref=op))

            computed += 1

        session.commit()

    print(
        f"calc rule synthesis complete (form={form}): {computed} computed rules, "
        f"{pure_input} pure-input fields, {skipped_no_packet} skipped (no knowledge packet)"
    )
