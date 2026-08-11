"""The runtime calculation engine — the actual "return calculator".

Pure, deterministic, LLM-free (ADR 0005 / its pilot amendment — see
docs/adr/0005-build-runtime-separation.md). Reads only `canonical_fields`,
`calc_rules`, and the hand-authored functions in `runtime/condition_rules.py`
(never `build/`, never a document, never an LLM). Every value comes back
with a full explainability trace (`ComputedValue`) rather than just a
number, per the plan's "full trace output" requirement.

Scope (see the plan's locked-in decisions):
  * Single taxpayer, single instance — no spouse / multi-Form-8889 handling.
    `sum_instances_then_carryover` degenerates to a plain carryover here.
    The one deliberate exception is W-2 wages, which the taxpayer can have
    genuinely more than one of even filing single — see the `sum_instances`
    formula type (distinct from `sum_instances_then_carryover` above) and
    build/consolidation/w2_bridge.py.
  * Only the ancestor closure of `runtime.chain.PILOT_TERMINAL_FIELDS` is
    computed (the modeled HSA chain) — see runtime/chain.py.
  * `candidate` rules are executed exactly like `validated`/`production`
    ones — nothing here silently "fixes" or skips a bad rule. Every
    `ComputedValue` carries `rule_status` and the rule's latest Phase 8
    grounding result (if any) so the UI can badge it honestly. A rule that
    is wrong (see e.g. Form 8889 Line 2/9's known Phase 8 "fail" results)
    surfaces as a `blocked`/`error` status with an explanation, or as a
    silently-wrong-looking number with a visible "fail" badge next to it —
    never as an unlabeled number. Fixing bad candidate rules is what the
    human review queue (ui/pages/3_Human_Review_Queue.py) is for.
"""
from __future__ import annotations

import math
from dataclasses import dataclass, field
from typing import Any

from sqlalchemy import select
from sqlalchemy.orm import Session

from db.models import CalcRule, CanonicalField, EvaluationRun
from db.session import get_session
from runtime.chain import ancestor_closure
from runtime.condition_rules import CONDITION_FIELDS, DERIVED_FROM_PROFILE
from runtime.tax_lookup import TIER_PROVISIONAL, resolve_line_16

STATUS_OK = "ok"
STATUS_MISSING_INPUT = "missing_input"
STATUS_BLOCKED = "blocked"
STATUS_ERROR = "error"
STATUS_UNSUPPORTED = "unsupported"  # engine ran fine, but this scenario is outside this pilot's supported tax scope (see runtime/tax_lookup.py's Line 16 safety gate)

DEFAULT_TAX_YEAR = 2025


@dataclass
class ComputedValue:
    field_name: str
    value: Any
    status: str  # ok | missing_input | blocked | error | unsupported
    source: str  # answer | calc_rule | condition | derived_from_profile
    rule_id: str | None = None
    rule_status: str | None = None  # candidate | validated | production | superseded
    formula: dict | None = None
    irs_reference: dict | None = None
    upstream_field_names: list[str] = field(default_factory=list)
    explanation: str | None = None
    grounding: dict | None = None  # latest Phase 8 EvaluationRun {result, detail}, if any
    # {"tier": "verified"|"provisional"|"unsupported", "assumptions": [...],
    # "unverified_conditions": [...]} when this value (or an upstream value
    # it was computed from) carries a trust caveat beyond the ok/blocked/error
    # `status` above -- e.g. Form 1040 Line 16's Tax Table/Worksheet lookup,
    # which this pilot can only ever mark "provisional" today (see
    # runtime/tax_lookup.py). None means "not applicable" (most fields),
    # not "verified" -- only fields that actually went through a
    # verification-tiered computation (or depend on one) ever set this.
    verification: dict | None = None


def _as_number(value: Any, field_name: str) -> float:
    if isinstance(value, bool):
        raise TypeError(f"operand {field_name!r} is a boolean ({value!r}), not a number")
    if isinstance(value, (int, float)):
        return float(value)
    if isinstance(value, str):
        try:
            return float(value)
        except ValueError:
            raise TypeError(f"operand {field_name!r} has non-numeric value {value!r}") from None
    raise TypeError(f"operand {field_name!r} has unsupported type {type(value).__name__} (value={value!r})")


def _eval_formula(formula: dict, operand_values: dict[str, Any]) -> float:
    ftype = formula.get("type")
    names = formula.get("operand_names", [])

    if ftype == "sum_instances":
        # W-2 multi-instance wages (build/consolidation/w2_bridge.py): the
        # single named operand holds a *list* of per-instance amounts (one
        # per "+ Add W-2" row in the UI), not a scalar -- see
        # runtime/chain.py / ui/pages/2_Answer_Questions.py for how
        # `answers["intake_w2_box1_wages"]` becomes a list in the first
        # place. Every other formula type below expects a scalar per
        # operand, so this is handled before the generic `_as_number` pass.
        if len(names) != 1:
            raise ValueError("sum_instances requires exactly 1 operand (the multi-instance field)")
        raw = operand_values[names[0]]
        if not isinstance(raw, list):
            raise TypeError(f"operand {names[0]!r} for sum_instances must be a list, got {type(raw).__name__}")
        return sum(_as_number(v, names[0]) for v in raw)

    if ftype == "multiply_unless_flag":
        # e.g. Form 8889 line 17b: "Additional 20% tax ... Enter 20% of the
        # distributions included on line 16 that are subject to the
        # additional 20% tax" -- if the taxpayer checked line 17a (an
        # Exceptions-to-the-Additional-20%-Tax box), the tax is $0
        # regardless of the amount on line 16. `flag_operand` names the
        # boolean/checkbox field gating the calculation; every name in
        # `operand_names` is multiplied together with `constant` (exactly
        # like the generic "multiply" type below) unless the flag is
        # truthy, in which case the result is 0.0 without even evaluating
        # the other operands as numbers (a checkbox has no numeric value).
        flag_name = formula.get("flag_operand")
        if flag_name is None:
            raise ValueError("multiply_unless_flag requires a 'flag_operand'")
        if bool(operand_values.get(flag_name)):
            return 0.0
        flag_values = [_as_number(operand_values[n], n) for n in names if n != flag_name]
        constant = formula.get("constant")
        if constant is not None:
            flag_values = flag_values + [float(constant)]
        result = 1.0
        for v in flag_values:
            result *= v
        return result

    values = [_as_number(operand_values[n], n) for n in names]
    constant = formula.get("constant")

    if ftype == "multiply_floor_zero":
        # max(0, operand) * constant -- e.g. Schedule SE line 4a: "If line 3
        # is more than zero, multiply line 3 by 92.35% (0.9235). Otherwise,
        # enter amount from line 3" (a Schedule C loss simply passes through
        # unmultiplied). For this pilot's purposes the taxpayer-facing
        # outcome is identical either way: a loss must still result in $0
        # self-employment tax by line 4c's "if less than $400, stop; you
        # don't owe self-employment tax" instruction, and
        # max(0, loss) * 92.35% = 0 reaches that same $0 result without a
        # dedicated conditional/branch formula type.
        if len(values) != 1 or constant is None:
            raise ValueError("multiply_floor_zero requires exactly 1 operand and a 'constant' multiplier")
        return max(0.0, values[0]) * float(constant)

    if ftype == "min_multiply":
        # min(operands) * constant -- e.g. Schedule SE line 10: "Multiply
        # the smaller of line 6 or line 9 by 12.4% (0.124)". Distinguished
        # from the generic `constant`-append convenience below (which would
        # incorrectly include the rate itself as a candidate for the min()).
        if not values or constant is None:
            raise ValueError("min_multiply requires at least 1 operand and a 'constant' multiplier")
        return min(values) * float(constant)

    if ftype == "subtract_floor_zero":
        # Same arithmetic as "subtract", floored at 0 -- IRS worksheets very
        # commonly say "...If zero or less, enter -0-." after a subtraction
        # (e.g. Schedule 1-A lines 10/13/33/35 -- see
        # build/consolidation/schedule_1a_bridge.py). Plain "subtract" can't
        # express this floor (see hsa_worksheet_bridge.py's module docstring
        # for the pre-existing limitation this was added to fix, for new
        # rules going forward). If a `constant` is given, it is always the
        # *minuend* (the fixed starting amount other lines are subtracted
        # from, e.g. Schedule 1-A line 35's "$6,000"); otherwise the first
        # operand plays that role, exactly like plain "subtract".
        if constant is not None:
            base = float(constant)
            subtrahends = values
        else:
            if not values:
                raise ValueError("subtract_floor_zero requires at least 1 operand or a constant")
            base = values[0]
            subtrahends = values[1:]
        return max(0.0, base - sum(subtrahends))

    if ftype == "floor_divide":
        # Exactly the "divide by $X, round DOWN to the next whole number"
        # step IRS phaseout worksheets use (e.g. Schedule 1-A line 11: divide
        # by $1,000, decrease to the next lower whole number). The divisor
        # is always the `constant` (never itself a per-taxpayer field).
        if len(values) != 1 or constant is None:
            raise ValueError("floor_divide requires exactly 1 operand (dividend) and a 'constant' divisor")
        divisor = float(constant)
        if divisor == 0:
            raise ZeroDivisionError("division by zero")
        return float(math.floor(values[0] / divisor))

    if constant is not None:
        # Generic convenience for every formula type below: an optional
        # fixed number (never itself a taxpayer answer or another canonical
        # field) folded in alongside the real operands -- e.g. "multiply by
        # $100" (Schedule 1-A line 12) or "smaller of line 6 or $25,000"
        # (line 7, via "min"). Order doesn't matter for any of these types.
        values = values + [float(constant)]

    if ftype == "sum":
        return sum(values)
    if ftype == "subtract":
        if not values:
            raise ValueError("subtract requires at least 1 operand")
        return values[0] - sum(values[1:])
    if ftype == "multiply":
        result = 1.0
        for v in values:
            result *= v
        return result
    if ftype == "divide":
        if len(values) < 2:
            raise ValueError("divide requires at least 2 operands")
        result = values[0]
        for v in values[1:]:
            if v == 0:
                raise ZeroDivisionError("division by zero")
            result = result / v
        return result
    if ftype in ("min", "max"):
        if not values:
            raise ValueError(f"{ftype} requires at least 1 operand")
        return min(values) if ftype == "min" else max(values)
    if ftype in ("carryover", "sum_instances_then_carryover"):
        # Single-instance scope (see module docstring): both degenerate to a
        # plain sum, which is a passthrough when (as here) there is exactly
        # one operand.
        return sum(values)
    raise ValueError(f"unknown formula type: {ftype!r}")


def _latest_evaluation(session: Session, rule_id: str) -> dict | None:
    run = session.execute(
        select(EvaluationRun)
        .where(EvaluationRun.target_type == "calc_rule", EvaluationRun.target_id == rule_id)
        .order_by(EvaluationRun.run_at.desc())
    ).scalars().first()
    if run is None:
        return None
    return {"result": run.result, "detail": run.detail, "run_at": run.run_at.isoformat()}


def compute(
    answers: dict[str, Any], profile_answers: dict[str, Any], tax_year: int = DEFAULT_TAX_YEAR
) -> dict[str, ComputedValue]:
    """Computes every field in the pilot's modeled HSA chain.

    `answers`: taxpayer answers keyed by canonical `field_name` (from the
    auto-derived form-line questions in the Question Registry).
    `profile_answers`: taxpayer answers keyed by `question_key` (from the
    hand-authored profile questions, e.g. `profile_age`).
    `tax_year`: which year's tax tables/brackets/constants apply -- narrowly
    threaded through to the one formula type that actually needs it
    (`federal_income_tax`, see runtime/tax_lookup.py) rather than a full
    CalculationContext refactor (deferred; see the Lines 16-24 plan).
    """
    with get_session() as session:
        closure = ancestor_closure(session)
        fields = session.execute(
            select(CanonicalField).where(
                CanonicalField.field_name.in_(closure), CanonicalField.tax_year == tax_year
            )
        ).scalars().all()
        fields_by_name = {f.field_name: f for f in fields}

        all_rules = session.execute(
            select(CalcRule).where(
                CalcRule.canonical_field_id.in_([f.id for f in fields]),
                CalcRule.status != "superseded",
                CalcRule.tax_year == tax_year,
            )
        ).scalars().all()
        rules_by_field_id: dict[str, CalcRule] = {}
        for r in all_rules:
            existing = rules_by_field_id.get(r.canonical_field_id)
            if existing is None or r.version > existing.version:
                rules_by_field_id[r.canonical_field_id] = r
        rules_by_field_name = {
            f.field_name: rules_by_field_id[f.id] for f in fields if f.id in rules_by_field_id
        }

        evaluations_by_rule_id = {
            rule.id: _latest_evaluation(session, rule.id) for rule in rules_by_field_name.values()
        }

        from runtime.cost_seg import merge_cost_seg_into_answers

        merged_answers = merge_cost_seg_into_answers(answers, profile_answers, tax_year)
        return _run_dag(
            closure,
            fields_by_name,
            rules_by_field_name,
            evaluations_by_rule_id,
            merged_answers,
            profile_answers,
            tax_year,
        )


def _run_dag(
    closure: set[str],
    fields_by_name: dict[str, CanonicalField],
    rules_by_field_name: dict[str, CalcRule],
    evaluations_by_rule_id: dict[str, dict | None],
    answers: dict[str, Any],
    profile_answers: dict[str, Any],
    tax_year: int,
) -> dict[str, ComputedValue]:
    upstream_of: dict[str, list[str]] = {}
    for name in closure:
        rule = rules_by_field_name.get(name)
        if rule is not None and name not in CONDITION_FIELDS:
            upstream_of[name] = [op for op in rule.formula.get("operand_names", []) if op in closure]
        else:
            upstream_of[name] = []

    in_degree = {name: len(upstream_of[name]) for name in closure}
    downstream_of: dict[str, list[str]] = {name: [] for name in closure}
    for name, ups in upstream_of.items():
        for u in ups:
            downstream_of[u].append(name)

    computed: dict[str, ComputedValue] = {}
    queue = [name for name in closure if in_degree[name] == 0]

    while queue:
        name = queue.pop()
        computed[name] = _evaluate_field(
            name, fields_by_name, rules_by_field_name, evaluations_by_rule_id, answers, profile_answers, computed, tax_year
        )
        for downstream in downstream_of[name]:
            in_degree[downstream] -= 1
            if in_degree[downstream] == 0:
                queue.append(downstream)

    for name in closure:
        if name in computed:
            continue
        rule = rules_by_field_name.get(name)
        unresolved = [op for op in upstream_of[name] if op not in computed or computed[op].status != STATUS_OK]
        computed[name] = ComputedValue(
            field_name=name,
            value=None,
            status=STATUS_BLOCKED,
            source="calc_rule" if rule else "unresolved",
            rule_id=rule.rule_id if rule else None,
            rule_status=rule.status if rule else None,
            formula=rule.formula if rule else None,
            upstream_field_names=upstream_of[name],
            explanation=(
                f"Could not be computed: depends on {unresolved}, which could not be resolved — "
                "this indicates a circular reference among candidate calc rules (see each field's "
                "own status/grounding for the likely culprit)."
            ),
            grounding=evaluations_by_rule_id.get(rule.id) if rule else None,
        )

    return computed


def _propagate_verification(operand_names: list[str], computed: dict[str, ComputedValue]) -> dict | None:
    """A calc_rule result inherits `tier="provisional"` from any operand that
    is itself provisional (e.g. Line 18/22/24 from Line 16) -- so a
    provisional Line 16 never quietly becomes an unqualified-looking Line 24.
    Operands whose status is STATUS_UNSUPPORTED never reach here at all
    (they already made this field STATUS_BLOCKED via the upstream check in
    `_evaluate_field`, before any formula runs) -- unsupported blocks
    downstream entirely rather than tainting it, per the approved design."""
    assumptions: list[str] = []
    unverified_conditions: list[str] = []
    any_provisional = False
    for op in operand_names:
        v = computed[op].verification
        if v and v.get("tier") == TIER_PROVISIONAL:
            any_provisional = True
            for a in v.get("assumptions", []):
                if a not in assumptions:
                    assumptions.append(a)
            for u in v.get("unverified_conditions", []):
                if u not in unverified_conditions:
                    unverified_conditions.append(u)
    if not any_provisional:
        return None
    return {"tier": TIER_PROVISIONAL, "assumptions": assumptions, "unverified_conditions": unverified_conditions}


def _evaluate_federal_income_tax(
    name: str,
    rule: CalcRule,
    operand_names: list[str],
    operand_values: dict[str, Any],
    computed: dict[str, ComputedValue],
    tax_year: int,
    grounding: dict | None,
) -> ComputedValue:
    filing_status = operand_values.get("form_1040_filing_status")
    income_field = next((n for n in operand_names if n != "form_1040_filing_status"), None)
    try:
        taxable_income = _as_number(operand_values.get(income_field), income_field or "taxable_income")
    except TypeError as exc:
        return ComputedValue(
            field_name=name, value=None, status=STATUS_ERROR, source="calc_rule",
            rule_id=rule.rule_id, rule_status=rule.status, formula=rule.formula,
            irs_reference=rule.irs_reference, upstream_field_names=operand_names,
            explanation=f"Formula evaluation failed: {exc}", grounding=grounding,
        )

    # Forward-compatible: Line 7a (capital gain) isn't modeled/collected by
    # this pilot yet, so this is always None today, which is exactly why
    # resolve_line_16 always returns tier="provisional" rather than
    # "unsupported" or "verified" for now -- see runtime/tax_lookup.py.
    detected_capital_gain = None
    line_7a = computed.get("form_1040_line_7a")
    if line_7a is not None and line_7a.status == STATUS_OK and isinstance(line_7a.value, (int, float)):
        detected_capital_gain = float(line_7a.value)

    try:
        result = resolve_line_16(taxable_income, filing_status, tax_year, detected_capital_gain)
    except LookupError as exc:
        return ComputedValue(
            field_name=name, value=None, status=STATUS_ERROR, source="calc_rule",
            rule_id=rule.rule_id, rule_status=rule.status, formula=rule.formula,
            irs_reference=rule.irs_reference, upstream_field_names=operand_names,
            explanation=f"Tax lookup failed: {exc}", grounding=grounding,
        )

    verification = {
        "tier": result.tier, "assumptions": result.assumptions, "unverified_conditions": result.unverified_conditions,
    }
    if not result.ok:
        return ComputedValue(
            field_name=name, value=None, status=STATUS_UNSUPPORTED, source="calc_rule",
            rule_id=rule.rule_id, rule_status=rule.status, formula=rule.formula,
            irs_reference=result.citation, upstream_field_names=operand_names,
            explanation=result.blocking_reason, grounding=grounding, verification=verification,
        )
    return ComputedValue(
        field_name=name, value=result.value, status=STATUS_OK, source="calc_rule",
        rule_id=rule.rule_id, rule_status=rule.status, formula=rule.formula,
        irs_reference=result.citation, upstream_field_names=operand_names,
        explanation=result.explanation, grounding=grounding, verification=verification,
    )


def _evaluate_field(
    name: str,
    fields_by_name: dict[str, CanonicalField],
    rules_by_field_name: dict[str, CalcRule],
    evaluations_by_rule_id: dict[str, dict | None],
    answers: dict[str, Any],
    profile_answers: dict[str, Any],
    computed: dict[str, ComputedValue],
    tax_year: int,
) -> ComputedValue:
    if name in CONDITION_FIELDS:
        try:
            result = CONDITION_FIELDS[name](profile_answers, tax_year)
        except ValueError as exc:
            return ComputedValue(
                field_name=name, value=None, status=STATUS_MISSING_INPUT, source="condition",
                explanation=str(exc),
            )
        return ComputedValue(
            field_name=name, value=result.value, status=STATUS_OK, source="condition",
            irs_reference=result.citation, explanation=result.explanation,
        )

    if name in DERIVED_FROM_PROFILE:
        value = DERIVED_FROM_PROFILE[name](profile_answers)
        status = STATUS_OK if value is not None else STATUS_MISSING_INPUT
        return ComputedValue(
            field_name=name, value=value, status=status, source="derived_from_profile",
            explanation="Derived from a profile question answer rather than asked separately.",
        )

    rule = rules_by_field_name.get(name)
    if rule is None:
        field_meta = fields_by_name.get(name)
        value = answers.get(name)
        if name in answers:
            return ComputedValue(
                field_name=name,
                value=value,
                status=STATUS_OK,
                source="answer",
                explanation="Provided by taxpayer intake or cost segregation engine.",
                irs_reference={"description": field_meta.description} if field_meta else None,
            )
        status = STATUS_OK if value is not None else STATUS_MISSING_INPUT
        return ComputedValue(
            field_name=name, value=value, status=status, source="answer",
            explanation=None if value is not None else f"Waiting for the taxpayer's answer to {name}.",
            irs_reference={"description": field_meta.description} if field_meta else None,
        )

    operand_names = rule.formula.get("operand_names", [])
    blocked_upstream = [
        op for op in operand_names if op not in computed or computed[op].status != STATUS_OK
    ]
    grounding = evaluations_by_rule_id.get(rule.id)
    if blocked_upstream:
        return ComputedValue(
            field_name=name, value=None, status=STATUS_BLOCKED, source="calc_rule",
            rule_id=rule.rule_id, rule_status=rule.status, formula=rule.formula,
            irs_reference=rule.irs_reference, upstream_field_names=operand_names,
            explanation=f"Waiting on upstream field(s) that are not yet resolved: {blocked_upstream}.",
            grounding=grounding,
        )

    operand_values = {op: computed[op].value for op in operand_names}

    if rule.formula.get("type") in ("carryover", "sum_instances_then_carryover"):
        if any(operand_values.get(op) is None for op in operand_names):
            return ComputedValue(
                field_name=name,
                value=None,
                status=STATUS_OK,
                source="calc_rule",
                rule_id=rule.rule_id,
                rule_status=rule.status,
                formula=rule.formula,
                irs_reference=rule.irs_reference,
                upstream_field_names=operand_names,
                explanation="Projection not applicable — upstream amount is null (blocked/unsupported activity).",
                grounding=grounding,
            )

    if rule.formula.get("type") == "federal_income_tax":
        return _evaluate_federal_income_tax(name, rule, operand_names, operand_values, computed, tax_year, grounding)

    try:
        value = _eval_formula(rule.formula, operand_values)
    except (TypeError, ValueError, ZeroDivisionError) as exc:
        return ComputedValue(
            field_name=name, value=None, status=STATUS_ERROR, source="calc_rule",
            rule_id=rule.rule_id, rule_status=rule.status, formula=rule.formula,
            irs_reference=rule.irs_reference, upstream_field_names=operand_names,
            explanation=f"Formula evaluation failed: {exc}",
            grounding=grounding,
        )

    return ComputedValue(
        field_name=name, value=value, status=STATUS_OK, source="calc_rule",
        rule_id=rule.rule_id, rule_status=rule.status, formula=rule.formula,
        irs_reference=rule.irs_reference, upstream_field_names=operand_names,
        explanation=f"Computed via {rule.formula.get('type')}({', '.join(operand_names)}).",
        grounding=grounding,
        verification=_propagate_verification(operand_names, computed),
    )
