"""Hand-verified PDF mapping ground truth for promotion after map-pdf-fields.

These codes were confirmed via PyMuPDF against catalogued IRS PDF revisions.
Used by scripts/promote_pdf_mappings_from_hand_bridge.py — not runtime authority
once promoted mappings exist in PdfFieldMapping with human_review status.
"""
from __future__ import annotations

# form_number -> list of (canonical_field_name, pdf_field_code, page_number)
GROUND_TRUTH_MAPPINGS: dict[str, list[tuple[str, str, int]]] = {
    "4562": [
        ("cost_seg_projection.form_4562.special_allowance_amount", "topmostSubform[0].Page1[0].f1_22[0]", 0),
        ("cost_seg_projection.form_4562.macrs_5_year_amount", "topmostSubform[0].Page1[0].SectionBTable[0].Line19b[0].f1_37[0]", 0),
        ("cost_seg_projection.form_4562.macrs_7_year_amount", "topmostSubform[0].Page1[0].SectionBTable[0].Line19c[0].f1_43[0]", 0),
        ("cost_seg_projection.form_4562.macrs_15_year_amount", "topmostSubform[0].Page1[0].SectionBTable[0].Line19e[0].f1_55[0]", 0),
        ("cost_seg_projection.form_4562.residential_real_property_amount", "topmostSubform[0].Page1[0].SectionBTable[0].Line19i_1[0].f1_79[0]", 0),
        ("cost_seg_projection.form_4562.nonresidential_real_property_amount", "topmostSubform[0].Page1[0].SectionBTable[0].Line19j_1[0].f1_91[0]", 0),
        ("cost_seg_projection.form_4562.total_depreciation_amount", "topmostSubform[0].Page2[0].f2_2[0]", 1),
    ],
    "1040se": [
        ("cost_seg_projection.schedule_e.depreciation_expense_a", "topmostSubform[0].Page1[0].Table_Expenses[0].Line18[0].f1_61[0]", 0),
        ("cost_seg_projection.schedule_e.depreciation_expense_b", "topmostSubform[0].Page1[0].Table_Expenses[0].Line18[0].f1_62[0]", 0),
        ("cost_seg_projection.schedule_e.depreciation_expense_c", "topmostSubform[0].Page1[0].Table_Expenses[0].Line18[0].f1_63[0]", 0),
    ],
    "w2": [
        ("intake_w2_employer_name", "topmostSubform[0].CopyB[0].Col_Left[0].f2_03[0]", 3),
        ("intake_w2_box1_wages", "topmostSubform[0].CopyB[0].Col_Right[0].Box1_ReadOrder[0].f2_09[0]", 3),
        ("intake_w2_box2_fed_withholding", "topmostSubform[0].CopyB[0].Col_Right[0].f2_10[0]", 3),
        ("intake_w2_box3_ss_wages", "topmostSubform[0].CopyB[0].Col_Right[0].Box3_ReadOrder[0].f2_11[0]", 3),
        ("intake_w2_box5_medicare_wages", "topmostSubform[0].CopyB[0].Col_Right[0].Box5_ReadOrder[0].f2_13[0]", 3),
        ("intake_w2_box12_code_w_label", "topmostSubform[0].CopyB[0].Col_Right[0].Box12_ReadOrder[0].f2_20[0]", 3),
        ("intake_w2_box12w_hsa_employer_contrib", "topmostSubform[0].CopyB[0].Col_Right[0].Box12_ReadOrder[0].f2_21[0]", 3),
    ],
}
