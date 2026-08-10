"""Defines the currently-wired calculation chain's scope for this pilot.

The build pipeline has ingested far more Form 1040 / Schedule 1 canonical
fields (name, address, SSN, direct-deposit routing/account numbers, filing
status checkboxes, ...) than are actually wired into a calc rule connecting
them to the HSA deduction chain. Rather than ask the taxpayer about, or try
to compute, every one of those unrelated fields, both the Question Registry
(build/synthesis/question_registry.py) and the runtime engine
(runtime/engine.py) scope themselves to the **ancestor closure** of the one
field this pilot actually models end to end: Form 1040, Line 10 (the
destination of the HSA deduction -- see
build/consolidation/cross_form_bridge.py). Extending the pilot to a new
terminal field (e.g. once AGI/taxable income are wired up) means adding it
to `PILOT_TERMINAL_FIELDS` below -- nothing else in this module is
form-specific.
"""
from __future__ import annotations

from sqlalchemy import select

from db.models import DependencyEdge

# form_1040_line_10 was the original (HSA-only) pilot's sole terminal.
# form_1040_line_15 (Taxable Income) now also terminates the chain -- it
# transitively pulls in everything upstream (line_1z wages, line_9 total
# income, line_11a AGI, line_12e standard deduction, line_13b Schedule 1-A,
# line_14 total deductions) via runtime/chain.py's ancestor_closure, so
# line_10 doesn't strictly need to stay listed separately, but is kept for
# clarity/backward-compatible UI grouping (see
# build/consolidation/form1040_income_bridge.py / schedule_1a_bridge.py /
# w2_bridge.py for the calc rules that now connect the two).
# form_1040_line_24 (Total Tax) extends the chain through the Tax and
# Credits section (lines 16-24) -- see build/consolidation/
# tax_computation_bridge.py. line_15 is still listed too (rather than
# relying purely on line_24's ancestor closure) for the same
# backward-compatible-grouping reason as line_10 above.
# form_1040_line_35a (Refund) and form_1040_line_37 (Amount You Owe) are
# both listed explicitly -- unlike every other addition to this list, they
# are NOT upstream of an existing terminal; they are DOWNSTREAM of
# form_1040_line_24 (the Payments/Refund/Amount-You-Owe section reads
# Total Tax as an input, see build/consolidation/form1040_refund_bridge.py),
# so ancestor_closure() would never reach them without being told to start
# there. This also transitively pulls in the whole self-employment chain
# (form_1040sc_line_*, form_1040sse_line_*, form_1040s2_line_*,
# form_1040s1_line_3/9/10 -- see schedule_c_bridge.py / schedule_se_bridge.py
# / schedule_2_bridge.py / schedule1_income_bridge.py) via
# form_1040_line_23's carryover from Schedule 2, line 21.
PILOT_TERMINAL_FIELDS = [
    "form_1040_line_10", "form_1040_line_15", "form_1040_line_24",
    "form_1040_line_35a", "form_1040_line_37",
]

# Fields that are NOT real dependency-graph ancestors of anything (nothing
# depends on them, they depend on nothing) but that the actual IRS PDFs
# still print as checkboxes the taxpayer should see reflect their answer --
# e.g. Form 8889 Line 1's self-only/family coverage checkbox sits right next
# to Line 3's contribution limit, and Form 1040's filing-status checkboxes
# sit at the top of the same page as Line 10. Both are already collected via
# a profile question and shadowed via DERIVED_FROM_PROFILE (see
# runtime/condition_rules.py) -- they just need to be part of the closure so
# the runtime engine actually produces a ComputedValue for them, which is
# what the "realistic form view" (ui/pdf_render.py) checks against each
# widget's `checkbox_match_value` (db/models.py's PdfFieldMapping). Kept as
# its own list (not folded into PILOT_TERMINAL_FIELDS) because these are
# display-only and never participate in a calc-rule formula.
DISPLAY_ONLY_FIELDS = ["deductions.hdhp_coverage_type", "form_1040_filing_status"]

# Forms whose canonical field names were migrated off the `form_{form}_line_N`
# convention onto TaxCore's dot-notation domain paths (see
# docs/adr/0010-taxcore-field-naming.md) have no shared name PREFIX at all
# anymore, so the `field_name.like(f"form_{form}_line_%")` lookup every
# build-time module uses to answer "which canonical fields belong to form X"
# can no longer work for them. This is the renamed-form analogue of
# build/export/json_export.py's `_FIELD_NAME_PATTERN_OVERRIDES` (which solved
# the same problem for `intake_w2_*`) -- an explicit name list instead of a
# prefix pattern. Every call site that used to inline
# `field_name.like(f"form_{form}_line_%")` should use `form_field_names()` /
# `form_field_condition()` below instead, so a future form rename only means
# adding one entry here rather than re-auditing every query in the codebase.
FORM_FIELD_NAME_OVERRIDES: dict[str, list[str]] = {
    "8889": [
        "deductions.hdhp_coverage_type",
        "adjustments.hsa_contribution_amount",
        "adjustments.hsa_limited_annual_deductible_amount",
        "adjustments.total_archer_msa_contribution_amount",
        "adjustments.hsa_limited_deductible_allowed_amount",
        "adjustments.hsa_family_deductible_amount",
        "adjustments.hsa_additional_contribution_amount",
        "adjustments.hsa_limited_gross_contribution_amount",
        "adjustments.hsa_employer_contribution_amount",
        "adjustments.hsa_qualified_funding_distribution_amount",
        "adjustments.total_hsa_contribution_amount",
        "adjustments.hsa_limited_contribution_amount",
        "adjustments.health_savings_account_deduction_amount",
        "income.total_hsa_distribution_amount",
        "adjustments.hsa_distribution_rollover_amount",
        "income.hsa_net_distribution_amount",
        "deductions.unreimbursed_qualified_medical_dental_expenses_amount",
        "income.taxable_hsa_distribution_amount",
        "income.is_hsa_distribution_additional_tax_exception",
        "taxes.hsa_distribution_additional_percent_tax_amount",
        "deductions.hdhp_coverage_fail_partial_year_amount",
        "adjustments.hdhp_coverage_fail_fund_distribution_amount",
        "income.hdhp_coverage_income_amount",
        "taxes.hdhp_coverage_additional_tax_amount",
    ],
}


def form_field_names(form: str) -> list[str] | None:
    """The explicit name-list override for `form`, or None if it still uses
    the default `form_{form}_line_N` prefix convention."""
    return FORM_FIELD_NAME_OVERRIDES.get(form)


def form_field_condition(column, form: str):
    """SQLAlchemy filter condition selecting every canonical field (or calc
    rule, via `CalcRule.rule_id`, which is always kept equal to the field
    name it computes) belonging to `form`. Use this instead of inlining
    `column.like(f"form_{form}_line_%")` everywhere -- see
    FORM_FIELD_NAME_OVERRIDES above."""
    names = FORM_FIELD_NAME_OVERRIDES.get(form)
    if names is not None:
        return column.in_(names)
    return column.like(f"form_{form}_line_%")


_FIELD_NAME_TO_FORM: dict[str, str] = {
    name: form for form, names in FORM_FIELD_NAME_OVERRIDES.items() for name in names
}


def form_for_field_name(field_name: str) -> str | None:
    """The IRS form number `field_name` belongs to, for fields that no
    longer carry it as a name prefix (see FORM_FIELD_NAME_OVERRIDES). Callers
    that derive a form token from `form_{form}_line_N` via regex (e.g.
    build/synthesis/question_registry.py's `_form_token`) should fall back to
    this for any field_name that doesn't match that pattern."""
    return _FIELD_NAME_TO_FORM.get(field_name)


def ancestor_closure(session, terminal_fields: list[str] | None = None) -> set[str]:
    """All canonical field names that (transitively) feed into
    `terminal_fields` via dependency_edges, plus the terminal fields
    themselves and `DISPLAY_ONLY_FIELDS`. Cycle-safe (a field already in the
    closure is never re-queued) -- see runtime/engine.py for how an actual
    cycle *within* this closure (a real, if rare, candidate-rule defect) is
    handled during evaluation."""
    terminal_fields = terminal_fields or PILOT_TERMINAL_FIELDS
    edges = session.execute(select(DependencyEdge).where(DependencyEdge.depends_on_type == "field")).scalars().all()
    parents_of: dict[str, list[str]] = {}
    for e in edges:
        parents_of.setdefault(e.field_a, []).append(e.depends_on_ref)

    closure = set(terminal_fields) | set(DISPLAY_ONLY_FIELDS)
    frontier = list(terminal_fields)
    while frontier:
        current = frontier.pop()
        for parent in parents_of.get(current, []):
            if parent not in closure:
                closure.add(parent)
                frontier.append(parent)
    return closure
