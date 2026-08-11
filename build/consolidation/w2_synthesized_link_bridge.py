"""Ground W-2 intake fields in synthesized IRS XSD catalog (ADR 0012)."""
from __future__ import annotations

from sqlalchemy import select

from db.models import CanonicalField
from db.session import get_session

# XSD element -> stable intake field name (preserves UI/export API)
_W2_XSD_TO_INTAKE: dict[str, str] = {
    "WagesAmt": "intake_w2_box1_wages",
    "WithholdingAmt": "intake_w2_box2_fed_withholding",
    "SocialSecurityWagesAmt": "intake_w2_box3_ss_wages",
    "MedicareWagesAndTipsAmt": "intake_w2_box5_medicare_wages",
    "EmployerName": "intake_w2_employer_name",
}

# Presentation-only fields without direct XSD line mapping
_PRESENTATION_INTAKE: list[tuple[str, str, str]] = [
    (
        "intake_w2_box12w_hsa_employer_contrib",
        "EmployersUseAmt",
        "W-2 Box 12 Code W employer HSA contributions (intake list).",
    ),
    (
        "intake_w2_box12_code_w_label",
        "EmployersUseCd",
        "W-2 Box 12a code letter 'W' for HSA employer contributions (presentation).",
    ),
]


def run_w2_synthesized_link_bridge(tax_year: int = 2025) -> None:
    """Update intake_w2_* fields with metadata from synthesized form_w2_line_* catalog."""
    linked = 0
    with get_session() as session:
        synthesized_by_xsd = {
            f.source_xsd_element: f
            for f in session.execute(
                select(CanonicalField).where(
                    CanonicalField.tax_year == tax_year,
                    CanonicalField.field_name.like("form_w2_line_%"),
                    CanonicalField.source_xsd_element.isnot(None),
                )
            ).scalars().all()
            if f.source_xsd_element
        }

        for xsd_element, intake_name in _W2_XSD_TO_INTAKE.items():
            synthesized = synthesized_by_xsd.get(xsd_element)
            intake = session.execute(
                select(CanonicalField).where(
                    CanonicalField.field_name == intake_name,
                    CanonicalField.tax_year == tax_year,
                )
            ).scalars().first()
            if intake is None:
                dtype = synthesized.data_type if synthesized is not None else "USAmountType"
                desc = synthesized.description if synthesized is not None else intake_name
                line = synthesized.source_form_line if synthesized is not None else None
                intake = CanonicalField(
                    field_name=intake_name,
                    section="Income",
                    data_type=dtype,
                    cardinality="multi_instance",
                    instance_dimension="w2",
                    source_xsd_element=xsd_element,
                    source_form_line=line,
                    description=desc,
                    tax_year=tax_year,
                )
                session.add(intake)
                linked += 1
            else:
                intake.source_xsd_element = xsd_element
                intake.cardinality = "multi_instance"
                intake.instance_dimension = "w2"
                if synthesized is not None:
                    intake.source_form_line = synthesized.source_form_line
                    intake.description = synthesized.description
                    intake.data_type = synthesized.data_type
                linked += 1

        for intake_name, xsd_element, fallback_desc in _PRESENTATION_INTAKE:
            synthesized = synthesized_by_xsd.get(xsd_element)
            intake = session.execute(
                select(CanonicalField).where(
                    CanonicalField.field_name == intake_name,
                    CanonicalField.tax_year == tax_year,
                )
            ).scalars().first()
            if intake is None:
                intake = CanonicalField(
                    field_name=intake_name,
                    section="Income",
                    data_type="TextType" if "label" in intake_name else "USAmountType",
                    cardinality="multi_instance",
                    instance_dimension="w2",
                    source_xsd_element=xsd_element,
                    source_form_line=synthesized.source_form_line if synthesized else "12a",
                    description=synthesized.description if synthesized else fallback_desc,
                    tax_year=tax_year,
                )
                session.add(intake)
            else:
                intake.source_xsd_element = xsd_element
                intake.cardinality = "multi_instance"
                intake.instance_dimension = "w2"
                if synthesized is not None:
                    intake.description = synthesized.description
            linked += 1

        session.commit()
    print(f"w2_synthesized_link_bridge: {linked} intake field(s) grounded for tax_year={tax_year}")
