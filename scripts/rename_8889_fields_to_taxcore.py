"""One-off migration: renames Form 8889's 24 canonical fields from this
project's `form_8889_line_N` convention onto TaxCore's dot-notation domain
paths (`adjustments.hsa_contribution_amount`, etc.) -- see
docs/adr/0010-taxcore-field-naming.md for the full rationale and the
field-by-field mapping table this script encodes.

This is the pilot form for a broader "migrate our canonical field names to
TaxCore's own naming, in our own database, not just at export time" effort
(the user's explicit direction: rename now so there's no future translator
debt, rather than maintaining two parallel names forever).

What this script does, in order (all in one transaction):
  1. Deletes the ~14 existing CalcRule rows (+ their HumanReviewItem /
     RuleStatusTransition dependents) whose rule_id is one of the OLD
     `form_8889_line_N` names that has a calc rule -- so the hand-authored
     bridges that own them can recreate them fresh under the NEW names when
     re-run afterward (this script does NOT itself write any new CalcRule
     row; see the printed next-steps at the end).
  2. Deletes field->field DependencyEdge rows referencing an OLD name (as
     either endpoint) -- same reasoning, the bridges recreate these too.
  3. Renames field->concept DependencyEdge rows' `field_a` in place (nothing
     downstream recreates these -- they come from the general LLM
     concept-tagging pass in build/consolidation/dependency_graph.py, not a
     hand-authored bridge, so deleting them would be a silent, permanent
     loss of that grounding metadata).
  4. Deletes the 8 stale pure-input IntakeQuestion rows (lines 2, 4, 7, 10,
     14a, 14b, 15, 17a) -- `question_registry.py`'s auto-question builder
     recreates these fresh with the new question_key when re-run. The 2
     profile questions (age, coverage type) are NOT touched here -- their
     `question_key` never changes, so re-running `generate-questions` for
     ANY form naturally upserts their `maps_to_canonical_field` /
     `maps_to_condition` in place via `question_registry.py`'s `_upsert()`.
  5. Renames the CanonicalField.field_name column itself for all 24 pairs
     (same row / same id -- so every PdfFieldMapping FK, already keyed by
     canonical_field_id rather than by name, survives this untouched).

Idempotent: safe to re-run (steps that find nothing left to rename/delete
are no-ops).

REQUIRED next steps after running this script (see docs/adr/0010 and the
printed reminder below) -- none of these are run automatically, because
each is independently useful to re-run on its own later:
  python -m build.cli w2-bridge --tax-year 2025
  python -m build.cli hsa-worksheet-bridge --tax-year 2025
  python -m build.cli checkbox-field-bridge --tax-year 2025
  python -m build.cli cross-form-bridge --tax-year 2025
  python -m build.cli schedule-2-bridge --tax-year 2025
  python scripts/override_selfemployment_bridge_rules.py
  python -m build.cli generate-questions --form 8889 --tax-year 2025
  python -m build.cli export --form 8889 --tax-year 2025
  python -m build.cli export-form-mapping --form 8889 --tax-year 2025
  python -m build.cli seed-golden-cases
  python -m build.cli run-golden-cases
"""
from __future__ import annotations

from sqlalchemy import select

from db.models import CalcRule, CanonicalField, DependencyEdge, HumanReviewItem, IntakeQuestion, RuleStatusTransition
from db.session import get_session
from runtime.chain import FORM_FIELD_NAME_OVERRIDES

TAX_YEAR = 2025

# OLD `form_8889_line_N` name -> NEW TaxCore dot-notation name. The NEW side
# must exactly match runtime.chain.FORM_FIELD_NAME_OVERRIDES["8889"].
_RENAME_MAP: dict[str, str] = {
    "form_8889_line_1": "deductions.hdhp_coverage_type",
    "form_8889_line_2": "adjustments.hsa_contribution_amount",
    "form_8889_line_3": "adjustments.hsa_limited_annual_deductible_amount",
    "form_8889_line_4": "adjustments.total_archer_msa_contribution_amount",
    "form_8889_line_5": "adjustments.hsa_limited_deductible_allowed_amount",
    "form_8889_line_6": "adjustments.hsa_family_deductible_amount",
    "form_8889_line_7": "adjustments.hsa_additional_contribution_amount",
    "form_8889_line_8": "adjustments.hsa_limited_gross_contribution_amount",
    "form_8889_line_9": "adjustments.hsa_employer_contribution_amount",
    "form_8889_line_10": "adjustments.hsa_qualified_funding_distribution_amount",
    "form_8889_line_11": "adjustments.total_hsa_contribution_amount",
    "form_8889_line_12": "adjustments.hsa_limited_contribution_amount",
    "form_8889_line_13": "adjustments.health_savings_account_deduction_amount",
    "form_8889_line_14a": "income.total_hsa_distribution_amount",
    "form_8889_line_14b": "adjustments.hsa_distribution_rollover_amount",
    "form_8889_line_14c": "income.hsa_net_distribution_amount",
    "form_8889_line_15": "deductions.unreimbursed_qualified_medical_dental_expenses_amount",
    "form_8889_line_16": "income.taxable_hsa_distribution_amount",
    "form_8889_line_17a": "income.is_hsa_distribution_additional_tax_exception",
    "form_8889_line_17b": "taxes.hsa_distribution_additional_percent_tax_amount",
    "form_8889_line_18": "deductions.hdhp_coverage_fail_partial_year_amount",
    "form_8889_line_19": "adjustments.hdhp_coverage_fail_fund_distribution_amount",
    "form_8889_line_20": "income.hdhp_coverage_income_amount",
    "form_8889_line_21": "taxes.hdhp_coverage_additional_tax_amount",
}

assert set(_RENAME_MAP.values()) == set(FORM_FIELD_NAME_OVERRIDES["8889"]), (
    "rename map's NEW names drifted out of sync with runtime.chain.FORM_FIELD_NAME_OVERRIDES['8889']"
)

# Rules that DO exist under an OLD name (checked live against the DB before
# writing this script -- see the conversation's exhaustive DB scan). Rules
# that carry over an old 8889 name as an OPERAND but are not THEMSELVES an
# 8889 rule (form_1040s1_line_13, form_1040s2_line_17c, form_1040s2_line_17d)
# are NOT in this list -- they're owned by cross_form_bridge.py /
# schedule_2_bridge.py, which UPSERT in place by their own (unchanged)
# rule_id, so re-running those bridges corrects the operand reference
# without needing this rule deleted first.
_OLD_RULE_IDS_TO_DELETE = [
    "form_8889_line_5", "form_8889_line_6", "form_8889_line_8", "form_8889_line_9",
    "form_8889_line_11", "form_8889_line_12", "form_8889_line_13", "form_8889_line_14c",
    "form_8889_line_16", "form_8889_line_17b", "form_8889_line_18", "form_8889_line_19",
    "form_8889_line_20", "form_8889_line_21",
]

# The 8 pure-input auto-questions (no calc rule) that question_registry.py
# generates one-per-field for. The 2 profile questions are handled by
# upsert-in-place on the next generate-questions run instead (see docstring).
_STALE_QUESTION_KEYS = [
    "form_8889_line_2", "form_8889_line_4", "form_8889_line_7", "form_8889_line_10",
    "form_8889_line_14a", "form_8889_line_14b", "form_8889_line_15", "form_8889_line_17a",
]


def run_rename() -> None:
    with get_session() as session:
        old_names = set(_RENAME_MAP)

        # --- 1. Delete existing CalcRule rows under an OLD 8889 rule_id ---
        old_rules = session.execute(
            select(CalcRule).where(CalcRule.rule_id.in_(_OLD_RULE_IDS_TO_DELETE), CalcRule.tax_year == TAX_YEAR)
        ).scalars().all()
        old_rule_ids = [r.id for r in old_rules]
        deleted_rules = len(old_rules)
        if old_rule_ids:
            for item in session.execute(
                select(HumanReviewItem).where(
                    HumanReviewItem.related_type == "calc_rule", HumanReviewItem.related_id.in_(old_rule_ids)
                )
            ).scalars().all():
                session.delete(item)
            for transition in session.execute(
                select(RuleStatusTransition).where(RuleStatusTransition.rule_id.in_(old_rule_ids))
            ).scalars().all():
                session.delete(transition)
            session.flush()
            for r in old_rules:
                session.delete(r)
            session.flush()

        # --- 2/3. DependencyEdge: delete field->field, rename field->concept ---
        deleted_field_edges = 0
        renamed_concept_edges = 0
        for edge in session.execute(select(DependencyEdge)).scalars().all():
            is_old_field_a = edge.field_a in old_names
            is_old_field_dep = edge.depends_on_type == "field" and edge.depends_on_ref in old_names
            if edge.depends_on_type == "field" and (is_old_field_a or is_old_field_dep):
                session.delete(edge)
                deleted_field_edges += 1
            elif edge.depends_on_type == "concept" and is_old_field_a:
                edge.field_a = _RENAME_MAP[edge.field_a]
                renamed_concept_edges += 1
        session.flush()

        # --- 4. Delete stale pure-input IntakeQuestion rows ---
        deleted_questions = 0
        for q in session.execute(
            select(IntakeQuestion).where(
                IntakeQuestion.question_key.in_(_STALE_QUESTION_KEYS), IntakeQuestion.tax_year == TAX_YEAR
            )
        ).scalars().all():
            session.delete(q)
            deleted_questions += 1
        session.flush()

        # --- 5. Rename CanonicalField.field_name (same row/id preserved) ---
        renamed_fields = 0
        for old_name, new_name in _RENAME_MAP.items():
            field = session.execute(
                select(CanonicalField).where(CanonicalField.field_name == old_name, CanonicalField.tax_year == TAX_YEAR)
            ).scalars().first()
            if field is None:
                print(f"rename_8889_fields: {old_name!r} not found (already renamed?) -- skipping")
                continue
            field.field_name = new_name
            renamed_fields += 1

        session.commit()

    print(
        f"rename_8889_fields complete: {renamed_fields}/24 canonical fields renamed, "
        f"{deleted_rules} stale calc rules deleted, {deleted_field_edges} stale field-dependency "
        f"edges deleted, {renamed_concept_edges} concept edges renamed in place, "
        f"{deleted_questions} stale pure-input questions deleted."
    )
    print(
        "Next: re-run the bridges that recreate what was just deleted -- see this script's "
        "module docstring for the exact command list (w2-bridge, hsa-worksheet-bridge, "
        "checkbox-field-bridge, cross-form-bridge, schedule-2-bridge, then the override script, "
        "generate-questions, export, export-form-mapping, and the golden cases)."
    )


if __name__ == "__main__":
    run_rename()
