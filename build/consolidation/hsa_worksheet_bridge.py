"""Phase 6 (extension): Form 8889's own internal worksheet chain (lines 4-12),
hand-authored — see docs/adr/0009.

Investigation finding: Form 8889 lines 4, 5, 8, 11, and 12 have NO dedicated
"Line N" heading in the IRS instructions document (build/ingestion/discovery.py's
structural parser only found sections for lines 1, 2, 3, 6, 7, 9, 10, 13, 14a,
14b, 15, 17a/17b, 18, 19 -- see Section.irs_line_ref). That's not a parsing bug:
the *instructions* genuinely don't repeat these lines' logic in prose, because
these particular lines are pure arithmetic on other lines within the same
form, and the FORM ITSELF (not the instructions) is where that arithmetic is
spelled out, printed directly next to each line:

    4  Enter the amount you and your employer contributed to your Archer
       MSAs for 2025 from Form 8853, lines 1 and 2. ...
    5  Subtract line 4 from line 3. If zero or less, enter -0-.
    6  Enter the amount from line 5. But if you and your spouse each have
       separate HSAs and had family coverage under an HDHP at any time
       during 2025, see the instructions for the amount to enter.
    8  Add lines 6 and 7.
    9  Employer contributions made to your HSAs for 2025.
   10  Qualified HSA funding distributions.
   11  Add lines 9 and 10.
   12  Subtract line 11 from line 8. If zero or less, enter -0-.

(verbatim, extracted directly from our stored copy of f8889.pdf via
PyMuPDF -- the same "forms themselves are versioned source documents, not
just their instructions" pattern already used by cross_form_bridge.py.)

Without this bridge, Line 12 (this pilot's actual Line 13 HSA-deduction
operand) had no calc rule at all -- the general LLM calc-rule agent
(build/graph/llm_client.synthesize_calc_rule) correctly refused to invent a
formula for a field with no cited IRS text behind it (packets_by_line.get()
returned None -- see calc_rule_writer.py's `skipped_no_packet` counter), so
Line 12 silently fell back to being *asked* as a raw taxpayer input. That in
turn meant lines 3/4/9/10/etc. never entered `runtime.chain.ancestor_closure`
(nothing depended on them), so they were never asked, never computed, and
never appeared on the "realistic PDF form view" even though the real f8889.pdf
has printed boxes for every one of them.

Scope simplifications (both explicitly cited below, not silent):
  * Line 7 (the married-taxpayer catch-up allocation) is out of this single-
    taxpayer pilot's scope -- see runtime/condition_rules.py, which already
    folds the $1,000 age-55 catch-up directly into Line 3 instead. This
    module originally wired Line 8 as `sum(line_6)` only (line_7 implicitly
    0) to dodge double-counting that catch-up, but Phase 8's judge correctly
    flagged that as incomplete against the literal "Add lines 6 and 7" quote
    and its automated repair loop fixed it to `sum(line_6, line_7)` -- which
    is fine: Line 7 is now its own real (pilot-scoped) question, and for a
    single/unmarried filer the correct answer is always $0 (the real IRS
    instruction is explicitly married-taxpayer-only), so no double-counting
    actually occurs as long as it's answered accurately.
  * Lines 5 and 12's "if zero or less, enter -0-" floor isn't expressible in
    the current formula schema (subtract/sum/min/max have no floor
    operator) -- same simplification already accepted elsewhere (e.g. the
    LLM-synthesized form_8889_line_18 rule). For this pilot's realistic test
    scenarios (Archer MSA / employer contributions are 0 for most filers),
    it doesn't change the answer; a genuinely negative intermediate value
    would need a real schema extension (tracked as a limitation, not
    silently worked around; the LLM-synthesized `deductions.hdhp_coverage_
    fail_partial_year_amount` rule -- Line 18 -- has the same simplification).
  * Line 6's real exception ("spouses with separate HSAs... family
    coverage") is single-taxpayer-scope N/A by construction (same reasoning
    as runtime/condition_rules.py) -- this bridge's rule is the *default*
    case sentence only ("Enter the amount from line 5").

This REPLACES the general LLM calc-rule agent's existing candidate rule for
Line 6 (which, before this bridge existed, only ever saw the instructions
document's exception paragraph -- never this default sentence, since it
lives on the form, not the instructions -- and so could only ever propose
the complex spousal-allocation formula, which Phase 8 correctly kept
rejecting even after repair attempts. See the module docstring's "why
doesn't the judge's feedback fix it" answer in docs/adr/0009: the agent
wasn't wrong given what it was shown; it was never shown the sentence that
actually answers line 6 for a single filer).

Idempotent: re-running deletes and rewrites every rule/edge/pending review
item this module owns first.

CAUTION (same operational fragility as cross_form_bridge.py): re-running
`synthesize --form 8889` after this bridge will delete these hand-authored
rules along with every other Form 8889 rule (see runtime/chain.py's
`form_field_condition`/`FORM_FIELD_NAME_OVERRIDES` for how Form 8889's rules
are now looked up by explicit name list, not a `form_8889_line_%` prefix) and
NOT recreate them (there's still no KnowledgePacket for lines 4/5/8/11/12) --
re-run this bridge afterward if that happens.
"""
from __future__ import annotations

import structlog
from sqlalchemy import select

from db.models import CalcRule, CanonicalField, DependencyEdge, Document, HumanReviewItem, RuleStatusTransition
from db.session import get_session
from runtime.chain import form_field_condition

log = structlog.get_logger(__name__)

# rule_id -> (formula, quote, formula_confidence, note)
_RULES: list[tuple[str, dict, str, float, str | None]] = [
    (
        "adjustments.hsa_limited_deductible_allowed_amount",  # Line 5
        {
            "type": "subtract",
            "operand_names": [
                "adjustments.hsa_limited_annual_deductible_amount",  # Line 3
                "adjustments.total_archer_msa_contribution_amount",  # Line 4
            ],
        },
        "Subtract line 4 from line 3. If zero or less, enter -0-.",
        0.9,
        "Floor-at-zero not expressible in the current formula schema -- see module docstring.",
    ),
    (
        "adjustments.hsa_family_deductible_amount",  # Line 6
        {"type": "carryover", "operand_names": ["adjustments.hsa_limited_deductible_allowed_amount"]},  # Line 5
        "Enter the amount from line 5. But if you and your spouse each have separate HSAs and had "
        "family coverage under an HDHP at any time during 2025, see the instructions for the amount "
        "to enter.",
        0.9,
        "Default-case sentence only; the spousal-separate-HSA exception is single-taxpayer-pilot-scope "
        "N/A (same reasoning as runtime/condition_rules.py's module docstring).",
    ),
    (
        "adjustments.hsa_limited_gross_contribution_amount",  # Line 8
        {
            "type": "sum",
            "operand_names": [
                "adjustments.hsa_family_deductible_amount",  # Line 6
                "adjustments.hsa_additional_contribution_amount",  # Line 7
            ],
        },
        "Add lines 6 and 7.",
        0.9,
        "Line 7 is the married-taxpayer catch-up allocation (user input; $0 for unmarried). "
        "Single-filer age-55 catch-up is folded into Line 3 via condition_rules — do not "
        "also enter it on Line 7 or it double-counts.",
    ),
    (
        "adjustments.total_hsa_contribution_amount",  # Line 11
        {
            "type": "sum",
            "operand_names": [
                "adjustments.hsa_employer_contribution_amount",  # Line 9
                "adjustments.hsa_qualified_funding_distribution_amount",  # Line 10
            ],
        },
        "Add lines 9 and 10.",
        0.95,
        None,
    ),
    (
        "adjustments.hsa_limited_contribution_amount",  # Line 12
        {
            "type": "subtract",
            "operand_names": [
                "adjustments.hsa_limited_gross_contribution_amount",  # Line 8
                "adjustments.total_hsa_contribution_amount",  # Line 11
            ],
        },
        "Subtract line 11 from line 8. If zero or less, enter -0-.",
        0.9,
        "Floor-at-zero not expressible in the current formula schema -- see module docstring.",
    ),
    (
        # Line 13 -- the actual above-the-line HSA deduction. Was LLM-synthesized
        # under the old form_8889_line_13 name (validated, formula_type=min) and
        # deleted by scripts/rename_8889_fields_to_taxcore.py, but never recreated
        # under the new name because this bridge previously stopped at line 12.
        # Without it, Schedule 1 line 13 / Form 1040 AGI silently get $0 HSA
        # deduction (confirmed by golden case single_w2_65k_hsa_3k_2025 failing
        # with AGI=65000 instead of 62000). Verbatim from i8889 Line 13.
        "adjustments.health_savings_account_deduction_amount",  # Line 13
        {
            "type": "min",
            "operand_names": [
                "adjustments.hsa_contribution_amount",  # Line 2
                "adjustments.hsa_limited_contribution_amount",  # Line 12
            ],
        },
        "Enter the smaller of line 2 or line 12. Also include this amount on "
        "Schedule 1 (Form 1040), line 13.",
        0.95,
        None,
    ),
]


def run_hsa_worksheet_bridge(tax_year: int = 2025) -> None:
    with get_session() as session:
        pdf_doc = session.execute(
            select(Document).where(Document.form_number == "8889", Document.doc_type == "form")
        ).scalars().first()
        if pdf_doc is None:
            print("hsa worksheet bridge: no catalogued f8889.pdf 'form' document -- run discover --form 8889 first")
            return

        fields_by_name = {
            f.field_name: f
            for f in session.execute(
                select(CanonicalField).where(
                    form_field_condition(CanonicalField.field_name, "8889"), CanonicalField.tax_year == tax_year
                )
            ).scalars().all()
        }

        rule_ids = [r[0] for r in _RULES]
        old_rules = session.execute(
            select(CalcRule).where(CalcRule.rule_id.in_(rule_ids), CalcRule.tax_year == tax_year)
        ).scalars().all()
        old_rule_ids = [r.id for r in old_rules]
        if old_rule_ids:
            for item in session.execute(
                select(HumanReviewItem).where(
                    HumanReviewItem.related_type == "calc_rule",
                    HumanReviewItem.related_id.in_(old_rule_ids),
                    HumanReviewItem.status == "pending",
                )
            ).scalars().all():
                session.delete(item)
            # A rule that went through Phase 8's repair loop (see
            # grounding_check.py) has RuleStatusTransition audit rows
            # FK-referencing it -- deleting the rule without these first
            # violates rule_status_transitions_rule_id_fkey.
            for transition in session.execute(
                select(RuleStatusTransition).where(RuleStatusTransition.rule_id.in_(old_rule_ids))
            ).scalars().all():
                session.delete(transition)
            # No ORM `relationship()` links CalcRule <-> RuleStatusTransition
            # (see db/models.py), so SQLAlchemy's unit-of-work can't infer the
            # delete ordering on its own -- force the transition deletes to
            # hit the DB before the rule deletes are even queued.
            session.flush()
            for r in old_rules:
                session.delete(r)
        for edge in session.execute(
            select(DependencyEdge).where(
                DependencyEdge.field_a.in_(rule_ids), DependencyEdge.depends_on_type == "field"
            )
        ).scalars().all():
            session.delete(edge)
        session.flush()

        created = 0
        skipped = 0
        for rule_id, formula, quote, formula_confidence, note in _RULES:
            field = fields_by_name.get(rule_id)
            operand_names = formula["operand_names"]
            operand_fields = [fields_by_name.get(op) for op in operand_names]
            if field is None or any(op is None for op in operand_fields):
                log.warning("hsa_worksheet_bridge.missing_field", rule_id=rule_id)
                skipped += 1
                continue

            session.add(
                CalcRule(
                    rule_id=rule_id,
                    status="candidate",
                    canonical_field_id=field.id,
                    formula=formula,
                    operands=[
                        {"name": op.field_name, "source": f"canonical_field:{op.field_name}", "description": op.description}
                        for op in operand_fields
                    ],
                    carryover_target=None,
                    irs_reference={
                        "document_id": pdf_doc.id,
                        "section_anchor": None,
                        "quote": quote,
                    },
                    confidence_breakdown={
                        "extraction_confidence": 1.0,  # verbatim text off the form itself, not LLM-paraphrased
                        "reference_resolution_confidence": 1.0,  # hand-resolved bridge -- see module docstring
                        "formula_confidence": formula_confidence,
                        "note": note or "Hand-authored from the form's own printed worksheet text.",
                    },
                    tax_year=tax_year,
                )
            )
            for op in operand_names:
                session.add(DependencyEdge(field_a=rule_id, depends_on_type="field", depends_on_ref=op))
            created += 1

        session.commit()

    print(f"hsa worksheet bridge complete: {created} calc rules created, {skipped} skipped (missing field)")
