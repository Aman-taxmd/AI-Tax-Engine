"""One-time repair for three canonical fields that were built before
`canonical_field_writer.py`'s line-number collision fix (see that module's
`_resolve_line_number_collisions` docstring for the full story).

Confirmed by grepping the real IRS XSDs (IRS1040ScheduleC.xsd,
IRS1040Schedule1.xsd): each of these three printed line numbers is used by
MORE THAN ONE MeF element. The old "first element in file order silently
wins the field_name" logic picked the wrong one in every case:

  * Schedule C line 1 ("Gross receipts or sales") -- the checkbox
    StatutoryEmployeeFromW2Ind (an unrelated W-2 attachment indicator) won
    the name `form_1040sc_line_1`; the actual dollar element
    (TotalGrossReceiptsAmt) was silently never created at all. Confirmed
    live impact: the taxpayer-facing question for this field rendered as
    "Does this apply to you: Statutory Employee..." instead of a dollar
    amount, even though schedule_c_bridge.py's arithmetic already correctly
    assumed `form_1040sc_line_1` WAS the gross receipts figure.

  * Schedule 1 line 4 ("Other gains or (losses)") and line 7 ("Unemployment
    compensation") -- both wrongly resolved to a CheckboxType attachment
    indicator (Form4797Ind / RepaidOverpaymentInd respectively), and
    schedule1_income_bridge.py's original docstring incorrectly concluded
    "there is no separate dollar element for this line's actual figure" --
    the real elements (OtherGainLossAmt / UnemploymentCompAmt) exist in the
    XSD and were simply never surfaced.

This script, run once against the already-built ty2025 database:
  1. Corrects the three existing (wrong) canonical fields in place so their
     field_name keeps working as every existing calc rule / bridge already
     assumes, but their data_type/source_xsd_element/description now
     describe the real dollar amount.
  2. Creates new canonical fields for every element that was silently
     dropped (the checkboxes, and Schedule 1 line 7's secondary
     RepaymentAmt), under a disambiguated suffix, so nothing the IRS's own
     schema transmits is silently lost -- even though these particular ones
     stay out of the pilot's calculation scope for now.

Idempotent: safe to re-run (checks each field's current state before
touching it).
"""
from __future__ import annotations

from sqlalchemy import select

from db.models import CanonicalField
from db.session import get_session

TAX_YEAR = 2025


def _get_or_none(session, field_name: str) -> CanonicalField | None:
    return session.execute(
        select(CanonicalField).where(CanonicalField.field_name == field_name, CanonicalField.tax_year == TAX_YEAR)
    ).scalars().first()


def run(tax_year: int = TAX_YEAR) -> None:
    with get_session() as session:
        # --- Schedule C line 1: correct to the dollar amount ---
        line1 = _get_or_none(session, "form_1040sc_line_1")
        if line1 is not None and line1.source_xsd_element == "StatutoryEmployeeFromW2Ind":
            print("Correcting form_1040sc_line_1: checkbox -> TotalGrossReceiptsAmt (dollar)")
            line1.data_type = "USAmountType"
            line1.source_xsd_element = "TotalGrossReceiptsAmt"
            line1.description = "Total gross receipts — Gross receipts or sales."
            section = line1.section
            if _get_or_none(session, "form_1040sc_line_1_statutory_employee_from_w2_ind") is None:
                session.add(CanonicalField(
                    field_name="form_1040sc_line_1_statutory_employee_from_w2_ind",
                    section=section,
                    data_type="CheckboxType",
                    cardinality="single",
                    instance_dimension=None,
                    source_xsd_element="StatutoryEmployeeFromW2Ind",
                    source_form_line="1",
                    description="Statutory Employee From W2 — informational attachment indicator, out of "
                    "pilot scope (not asked as a question, not wired into any calc rule).",
                    tax_year=tax_year,
                ))
                print("Created form_1040sc_line_1_statutory_employee_from_w2_ind (out of scope, informational)")
        else:
            print("form_1040sc_line_1 already correct, skipping")

        # --- Schedule 1 line 4: correct to the dollar amount ---
        line4 = _get_or_none(session, "form_1040s1_line_4")
        if line4 is not None and line4.source_xsd_element == "Form4797Ind":
            print("Correcting form_1040s1_line_4: checkbox -> OtherGainLossAmt (dollar)")
            line4.data_type = "ComplexType"
            line4.source_xsd_element = "OtherGainLossAmt"
            line4.description = "Other Gains Or Losses Amount — Other gains or (losses) from Form 4797."
            section = line4.section
            for name, el, desc in [
                ("form_1040s1_line_4_form4797_ind", "Form4797Ind", "Form 4797 Indicator"),
                ("form_1040s1_line_4_form4684_ind", "Form4684Ind", "Form 4684 Indicator"),
            ]:
                if _get_or_none(session, name) is None:
                    session.add(CanonicalField(
                        field_name=name, section=section, data_type="CheckboxType", cardinality="single",
                        instance_dimension=None, source_xsd_element=el, source_form_line="4",
                        description=f"{desc} — informational attachment indicator, out of pilot scope.",
                        tax_year=tax_year,
                    ))
                    print(f"Created {name} (out of scope, informational)")
        else:
            print("form_1040s1_line_4 already correct, skipping")

        # --- Schedule 1 line 7: correct to the dollar amount ---
        line7 = _get_or_none(session, "form_1040s1_line_7")
        if line7 is not None and line7.source_xsd_element == "RepaidOverpaymentInd":
            print("Correcting form_1040s1_line_7: checkbox -> UnemploymentCompAmt (dollar)")
            line7.data_type = "USAmountNNType"
            line7.source_xsd_element = "UnemploymentCompAmt"
            line7.description = "Unemployment Compensation Amount — Unemployment compensation."
            section = line7.section
            new_fields = [
                ("form_1040s1_line_7_repaid_overpayment_ind", "RepaidOverpaymentInd", "CheckboxType",
                 "Repaid overpayment Indicator — informational attachment indicator, out of pilot scope."),
                ("form_1040s1_line_7_repayment_amt", "RepaymentAmt", "USAmountType",
                 "Repayment Amount — the sub-figure for unemployment compensation repaid in a prior year; "
                 "deferred, not modeled (edge case; see Schedule 1 instructions, Line 7). Not the same as "
                 "the main line 7 figure."),
            ]
            for name, el, dtype, desc in new_fields:
                if _get_or_none(session, name) is None:
                    session.add(CanonicalField(
                        field_name=name, section=section, data_type=dtype, cardinality="single",
                        instance_dimension=None, source_xsd_element=el, source_form_line="7",
                        description=desc, tax_year=tax_year,
                    ))
                    print(f"Created {name} (out of scope, informational/deferred)")
        else:
            print("form_1040s1_line_7 already correct, skipping")

        session.commit()

    print("fix_line_collision_fields complete")


if __name__ == "__main__":
    run()
