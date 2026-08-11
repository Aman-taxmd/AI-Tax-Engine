"""Register cost segregation field templates and golden instance canonical rows."""
from __future__ import annotations

import structlog
from sqlalchemy import delete, select

from build.consolidation.cost_seg_field_templates import (
    all_templates,
    instance_field_name,
)
from db.models import CalcRule, CanonicalField, CostSegFieldTemplate, DependencyEdge
from db.session import get_session

log = structlog.get_logger(__name__)

_GOLDEN_ACTIVITY_IDS = ("activity_001", "activity_002")


def _seed_templates(session, tax_year: int) -> int:
    count = 0
    for tpl in all_templates():
        existing = session.execute(
            select(CostSegFieldTemplate).where(
                CostSegFieldTemplate.template_id == tpl.template_id,
                CostSegFieldTemplate.tax_year == tax_year,
            )
        ).scalars().first()
        if existing:
            existing.instance_group = tpl.instance_group
            existing.relative_field = tpl.relative_field
            existing.source_form_number = tpl.source_form_number
            existing.source_form_line = tpl.source_form_line
            existing.section = tpl.section
            existing.data_type = tpl.data_type
            existing.source_xsd_element = tpl.source_xsd_element
            existing.description = tpl.description
            existing.projection = tpl.projection
            existing.calc_rule_type = tpl.calc_rule_type
            existing.calc_rule_operand_relative = tpl.calc_rule_operand_relative
        else:
            session.add(
                CostSegFieldTemplate(
                    template_id=tpl.template_id,
                    instance_group=tpl.instance_group,
                    relative_field=tpl.relative_field,
                    source_form_number=tpl.source_form_number,
                    source_form_line=tpl.source_form_line,
                    section=tpl.section,
                    data_type=tpl.data_type,
                    source_xsd_element=tpl.source_xsd_element,
                    description=tpl.description,
                    projection=tpl.projection,
                    calc_rule_type=tpl.calc_rule_type,
                    calc_rule_operand_relative=tpl.calc_rule_operand_relative,
                    tax_year=tax_year,
                )
            )
            count += 1
    session.flush()
    return count


def _ensure_instance_field(
    session, name: str, tpl, tax_year: int, activity_id: str
) -> CanonicalField:
    existing = session.execute(
        select(CanonicalField).where(
            CanonicalField.field_name == name, CanonicalField.tax_year == tax_year
        )
    ).scalars().first()
    desc = f"[{activity_id}] {tpl.description}"
    if existing:
        existing.description = desc
        existing.data_type = tpl.data_type
        existing.section = tpl.section
        existing.source_form_line = tpl.source_form_line
        existing.source_xsd_element = tpl.source_xsd_element
        existing.instance_dimension = tpl.instance_group
        return existing
    field = CanonicalField(
        field_name=name,
        section=tpl.section,
        description=desc,
        data_type=tpl.data_type,
        tax_year=tax_year,
        cardinality="single",
        instance_dimension=tpl.instance_group,
        source_form_line=tpl.source_form_line,
        source_xsd_element=tpl.source_xsd_element,
    )
    session.add(field)
    session.flush()
    return field


def _ensure_summary_field(session, tpl, tax_year: int) -> CanonicalField:
    name = tpl.relative_field
    existing = session.execute(
        select(CanonicalField).where(
            CanonicalField.field_name == name, CanonicalField.tax_year == tax_year
        )
    ).scalars().first()
    if existing:
        existing.description = tpl.description
        existing.data_type = tpl.data_type
        existing.section = tpl.section
        return existing
    field = CanonicalField(
        field_name=name,
        section=tpl.section,
        description=tpl.description,
        data_type=tpl.data_type,
        tax_year=tax_year,
        cardinality="single",
    )
    session.add(field)
    session.flush()
    return field


def _write_carryover_rule(
    session,
    rule_id: str,
    output_field: str,
    operand: str,
    quote: str,
    tax_year: int,
) -> None:
    out_f = session.execute(
        select(CanonicalField).where(
            CanonicalField.field_name == output_field, CanonicalField.tax_year == tax_year
        )
    ).scalars().first()
    if out_f is None:
        return
    session.execute(delete(CalcRule).where(CalcRule.rule_id == rule_id))
    rule = CalcRule(
        rule_id=rule_id,
        canonical_field_id=out_f.id,
        formula={"type": "carryover", "operand_names": [operand]},
        irs_reference={"quote": quote, "form": "4562", "source": "cost_seg_bridge"},
        status="validated",
        tax_year=tax_year,
        version=1,
    )
    session.add(rule)
    session.execute(
        delete(DependencyEdge).where(
            DependencyEdge.field_a == output_field,
            DependencyEdge.depends_on_ref == operand,
        )
    )
    session.add(
        DependencyEdge(
            field_a=output_field,
            depends_on_type="field",
            depends_on_ref=operand,
        )
    )


def run_cost_seg_bridge(tax_year: int = 2025) -> None:
    templates = all_templates()
    per_activity = [t for t in templates if t.instance_group]
    summary = [t for t in templates if not t.instance_group]

    with get_session() as session:
        created_templates = _seed_templates(session, tax_year)

        for tpl in summary:
            _ensure_summary_field(session, tpl, tax_year)

        for aid in _GOLDEN_ACTIVITY_IDS:
            for tpl in per_activity:
                fname = instance_field_name(aid, tpl.relative_field)
                _ensure_instance_field(session, fname, tpl, tax_year, aid)

            dep_total = instance_field_name(aid, "depreciation.total_amount")
            f4562_total = instance_field_name(aid, "form_4562.total_depreciation_amount")
            sch_e = instance_field_name(aid, "schedule_e.depreciation_expense")
            _write_carryover_rule(
                session,
                f"calc_cost_seg_projection_form_4562_total_{aid}",
                f4562_total,
                dep_total,
                "Form 4562 Part IV total equals activity depreciation when supported.",
                tax_year,
            )
            _write_carryover_rule(
                session,
                f"calc_cost_seg_projection_schedule_e_depreciation_{aid}",
                sch_e,
                dep_total,
                "Schedule E Line 18 depreciation equals authoritative engine total.",
                tax_year,
            )

        session.commit()
        print(
            f"cost_seg_bridge: {len(templates)} templates ({created_templates} new), "
            f"{len(_GOLDEN_ACTIVITY_IDS)} golden activity instances for tax_year={tax_year}"
        )
