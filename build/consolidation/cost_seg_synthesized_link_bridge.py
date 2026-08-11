"""Link cost seg field templates to IRS-grounded synthesized canonical fields."""
from __future__ import annotations

from sqlalchemy import select

from build.consolidation.cost_seg_field_templates import SYNTHESIZED_XSD_LINKS, all_templates
from db.models import CanonicalField, CostSegFieldTemplate
from db.session import get_session


def _find_synthesized_field(
    session,
    form_number: str,
    xsd_element: str,
    tax_year: int,
) -> CanonicalField | None:
    return session.execute(
        select(CanonicalField).where(
            CanonicalField.source_xsd_element == xsd_element,
            CanonicalField.tax_year == tax_year,
            CanonicalField.field_name.like(f"form_{form_number}_line_%"),
        )
    ).scalars().first()


def run_cost_seg_synthesized_link_bridge(tax_year: int = 2025) -> None:
    """Attach synthesized canonical field FKs to cost seg templates by XSD element."""
    linked = 0
    skipped = 0
    with get_session() as session:
        for tpl in all_templates():
            if not tpl.source_xsd_element:
                continue
            link = SYNTHESIZED_XSD_LINKS.get(tpl.source_xsd_element)
            if link is None:
                skipped += 1
                continue
            form_number, _line = link
            synthesized = _find_synthesized_field(session, form_number, tpl.source_xsd_element, tax_year)
            if synthesized is None:
                skipped += 1
                continue
            row = session.execute(
                select(CostSegFieldTemplate).where(
                    CostSegFieldTemplate.template_id == tpl.template_id,
                    CostSegFieldTemplate.tax_year == tax_year,
                )
            ).scalars().first()
            if row is None:
                skipped += 1
                continue
            row.synthesized_canonical_field_id = synthesized.id
            if synthesized.description and synthesized.description not in row.description:
                row.description = f"{row.description} — IRS catalog: {synthesized.description[:120]}"
            linked += 1
        session.commit()
    print(
        f"cost_seg_synthesized_link_bridge: {linked} template(s) linked, {skipped} skipped "
        f"(tax_year={tax_year})"
    )
