"""Phase 6 (extension): explicit cross-form dependency bridges.

The automatic pattern detectors (Phase 3) and dependency-graph builder
(Phase 6, see dependency_graph.py) only resolve references WITHIN a single
ingested document's own sections (see
build/ingestion/pattern_detector/common.py's `resolve_heading_in_document`).
A reference like "Schedule 1 (Form 1040), line 13" found inside Form 8889's
instructions therefore stays `resolution_method='unresolved'` even after
Schedule 1's own canonical fields exist elsewhere in the database — resolving
it requires knowing WHICH form's "line 13" is meant (Form 8889, Schedule 1,
and Form 1040 each have their own unrelated "line 13"), which is
form-disambiguation context the generic same-document resolver doesn't have
(see the identical ambiguity called out in
canonical_field_writer._part_for_line's docstring).

Rather than guess, this module closes the specific, small, highest-value set
of bridges needed to complete the HSA pilot chain end to end, by hand, each
one grounded in a verbatim quote already pulled from a real, versioned IRS
document already in the store — never invented, exactly like every other
rule in this system:

    Form 8889, line 13 (HSA deduction)
        --carryover-->  Schedule 1 (Form 1040), line 13
    Schedule 1, line 26 (sum of lines 11-23 and 25 -> total adjustments)
        --carryover-->  Form 1040, line 10

A generalized N-form reference resolver (disambiguating "line 13" by which
form/schedule context a citation actually points to) is future work, tracked
alongside the same limitation in canonical_field_writer.py.
"""
from __future__ import annotations

import structlog
from sqlalchemy import select

from db.models import CalcRule, CanonicalField, CitationEdge, DependencyEdge, Document, Section
from db.session import get_session

log = structlog.get_logger(__name__)

# Schedule 1's own instruction: "Add lines 11 through 23 and 25. These are
# your adjustments to income." (verbatim, extracted directly from our stored
# copy of f1040s1.pdf — see docs/adr for why forms themselves, not just
# instructions, are catalogued as versioned source documents).
SCHEDULE1_LINE26_OPERANDS = [
    "11", "12", "13", "14", "15", "16", "17", "18", "19a", "20", "21", "22", "23", "25",
]


def _field(session, field_name: str, tax_year: int) -> CanonicalField | None:
    return session.execute(
        select(CanonicalField).where(
            CanonicalField.field_name == field_name, CanonicalField.tax_year == tax_year
        )
    ).scalars().first()


def _add_dependency(session, existing: set, field_a: str, depends_on_ref: str) -> bool:
    key = (field_a, "field", depends_on_ref)
    if key in existing:
        return False
    existing.add(key)
    session.add(DependencyEdge(field_a=field_a, depends_on_type="field", depends_on_ref=depends_on_ref))
    return True


def _upsert_calc_rule(session, *, rule_id: str, canonical_field_id: str, formula: dict, operands: list[dict],
                       irs_reference: dict, carryover_target: str | None, confidence_breakdown: dict,
                       tax_year: int) -> bool:
    existing_rule = session.execute(
        select(CalcRule).where(CalcRule.rule_id == rule_id, CalcRule.tax_year == tax_year)
    ).scalars().first()
    if existing_rule is not None:
        return False
    session.add(
        CalcRule(
            rule_id=rule_id,
            status="candidate",
            canonical_field_id=canonical_field_id,
            formula=formula,
            operands=operands,
            carryover_target=carryover_target,
            irs_reference=irs_reference,
            confidence_breakdown=confidence_breakdown,
            tax_year=tax_year,
        )
    )
    return True


def run_cross_form_bridge(tax_year: int = 2025) -> None:
    with get_session() as session:
        existing_deps = {
            (e.field_a, e.depends_on_type, e.depends_on_ref) for e in session.query(DependencyEdge).all()
        }
        rules_created = 0
        deps_created = 0

        # ------------------------------------------------------------------
        # Bridge 1: Form 8889, line 13  -->  Schedule 1, line 13
        # ------------------------------------------------------------------
        f8889_line13 = _field(session, "adjustments.health_savings_account_deduction_amount", tax_year)
        sched1_line13 = _field(session, "form_1040s1_line_13", tax_year)
        edge_8889_to_sched1 = session.execute(
            select(CitationEdge).where(CitationEdge.raw_phrase.ilike("%Combine the amounts on line 13%"))
        ).scalars().first()

        if f8889_line13 is None or sched1_line13 is None or edge_8889_to_sched1 is None:
            log.warning(
                "cross_form_bridge.bridge1_missing_inputs",
                have_8889_line13=f8889_line13 is not None,
                have_sched1_line13=sched1_line13 is not None,
                have_citation=edge_8889_to_sched1 is not None,
            )
        else:
            from_section = session.get(Section, edge_8889_to_sched1.from_section_id)
            if _add_dependency(
                session, existing_deps, "form_1040s1_line_13", "adjustments.health_savings_account_deduction_amount"
            ):
                deps_created += 1
            if _upsert_calc_rule(
                session,
                rule_id="form_1040s1_line_13",
                canonical_field_id=sched1_line13.id,
                formula={
                    "type": "sum_instances_then_carryover",
                    "operand_names": ["adjustments.health_savings_account_deduction_amount"],
                    "note": (
                        "Sum adjustments.health_savings_account_deduction_amount (Form 8889 line 13, "
                        "renamed to TaxCore's dot-notation -- see docs/adr/0010) across every Form 8889 "
                        "instance (one per HSA-owning spouse — see cardinality_ref on Form 8889), then "
                        "carry the total to this line."
                    ),
                },
                operands=[{
                    "name": "adjustments.health_savings_account_deduction_amount",
                    "source": "canonical_field:adjustments.health_savings_account_deduction_amount",
                    "description": f8889_line13.description,
                }],
                irs_reference={
                    "document_id": from_section.document_id if from_section else None,
                    "section_anchor": from_section.anchor_id if from_section else None,
                    "quote": edge_8889_to_sched1.raw_phrase,
                },
                carryover_target=None,
                confidence_breakdown={
                    "extraction_confidence": 1.0,  # verbatim quote, not LLM-paraphrased
                    "reference_resolution_confidence": 1.0,  # hand-resolved cross-form bridge (see module docstring)
                    "formula_confidence": 0.9,
                },
                tax_year=tax_year,
            ):
                rules_created += 1

        # ------------------------------------------------------------------
        # Bridge 2 (internal to Schedule 1): line 26 = sum(11-23, 25)
        # ------------------------------------------------------------------
        sched1_line26 = _field(session, "form_1040s1_line_26", tax_year)
        sched1_pdf = session.execute(
            select(Document).where(Document.source_url.like("%f1040s1.pdf%"))
        ).scalars().first()

        if sched1_line26 is None:
            log.warning("cross_form_bridge.bridge2_missing_line26")
        else:
            operand_fields = []
            missing_operands = []
            for line in SCHEDULE1_LINE26_OPERANDS:
                op_field = _field(session, f"form_1040s1_line_{line}", tax_year)
                if op_field is None:
                    missing_operands.append(line)
                    continue
                operand_fields.append(op_field)
                if _add_dependency(session, existing_deps, "form_1040s1_line_26", op_field.field_name):
                    deps_created += 1
            if missing_operands:
                log.warning("cross_form_bridge.bridge2_missing_operand_fields", missing=missing_operands)

            if _upsert_calc_rule(
                session,
                rule_id="form_1040s1_line_26",
                canonical_field_id=sched1_line26.id,
                formula={"type": "sum", "operand_names": [f.field_name for f in operand_fields]},
                operands=[
                    {"name": f.field_name, "source": f"canonical_field:{f.field_name}", "description": f.description}
                    for f in operand_fields
                ],
                irs_reference={
                    "document_id": sched1_pdf.id if sched1_pdf else None,
                    "section_anchor": None,
                    "quote": (
                        "Add lines 11 through 23 and 25. These are your adjustments to income. "
                        "Enter here and on Form 1040, 1040-SR, or 1040-NR, line 10."
                    ),
                },
                carryover_target="Form 1040, line 10",
                confidence_breakdown={
                    "extraction_confidence": 1.0,
                    "reference_resolution_confidence": 1.0,
                    "formula_confidence": 0.95,
                },
                tax_year=tax_year,
            ):
                rules_created += 1

        # ------------------------------------------------------------------
        # Bridge 3: Schedule 1, line 26  -->  Form 1040, line 10
        # ------------------------------------------------------------------
        f1040_line10 = _field(session, "form_1040_line_10", tax_year)
        line10_doc = session.execute(
            select(Document).where(Document.form_number == "1040", Document.doc_type == "instructions")
        ).scalars().first()
        line10_section = None
        if line10_doc is not None:
            line10_section = session.execute(
                select(Section).where(Section.document_id == line10_doc.id, Section.irs_line_ref == "10")
            ).scalars().first()

        if f1040_line10 is None or sched1_line26 is None or line10_section is None:
            log.warning(
                "cross_form_bridge.bridge3_missing_inputs",
                have_1040_line10=f1040_line10 is not None,
                have_sched1_line26=sched1_line26 is not None,
                have_1040_line10_section=line10_section is not None,
            )
        else:
            if _add_dependency(session, existing_deps, "form_1040_line_10", "form_1040s1_line_26"):
                deps_created += 1
            if _upsert_calc_rule(
                session,
                rule_id="form_1040_line_10",
                canonical_field_id=f1040_line10.id,
                formula={"type": "carryover", "operand_names": ["form_1040s1_line_26"]},
                operands=[{
                    "name": "form_1040s1_line_26",
                    "source": "canonical_field:form_1040s1_line_26",
                    "description": sched1_line26.description,
                }],
                irs_reference={
                    "document_id": line10_section.document_id,
                    "section_anchor": line10_section.anchor_id,
                    "quote": line10_section.text,
                },
                carryover_target=None,
                confidence_breakdown={
                    "extraction_confidence": 1.0,
                    "reference_resolution_confidence": 1.0,
                    "formula_confidence": 0.95,
                },
                tax_year=tax_year,
            ):
                rules_created += 1

        session.commit()

    print(f"cross-form bridge complete: {rules_created} calc rules, {deps_created} dependency edges")
