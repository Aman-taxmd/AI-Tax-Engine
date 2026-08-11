"""Build Control — trigger and inspect the build pipeline per form."""
from __future__ import annotations

import streamlit as st

from ui import data_access as da

st.set_page_config(page_title="Build Control — AI Tax Engine", page_icon="\U0001F6E0\uFE0F", layout="wide")
tax_year = da.render_tax_year_selector()
st.title("\U0001F6E0\uFE0F Build Control")
st.caption(
    "Trigger and inspect each phase of the build pipeline. Forms w2, 4562, and 1040se use the "
    "IRS-grounded hybrid pipeline (ADR 0012): synthesize for catalog, engine/bridges for amounts."
)
st.caption(f"Operating on tax year **{tax_year}** (change via the sidebar).")

all_forms = da.PILOT_FORMS + da.ADDITIONAL_STATUS_FORMS

st.markdown("### Status at a glance")
status_cols = st.columns(len(all_forms))
for col, form in zip(status_cols, all_forms):
    status = da.get_form_status(form, tax_year)
    with col:
        st.markdown(f"**{da.form_display(form)}**")
        st.metric("Documents", status["documents"])
        st.metric("Canonical fields", status["canonical_fields"])
        rule_counts = status["calc_rule_status_counts"]
        rule_summary = ", ".join(f"{k}={v}" for k, v in sorted(rule_counts.items())) or "none yet"
        st.metric("Calc rules", status["calc_rules"], help=f"by status: {rule_summary}")
        eval_counts = status["evaluation_result_counts"]
        eval_summary = ", ".join(f"{k}={v}" for k, v in sorted(eval_counts.items())) or "not evaluated yet"
        st.caption(f"Grounding checks: {eval_summary}")
        if status["pending_calc_rule_reviews"]:
            st.warning(f"{status['pending_calc_rule_reviews']} rule(s) awaiting human review")
        st.metric("Questions generated", status["questions"])
        st.metric("PDF field mappings", status["pdf_field_mappings"])
        if status["pending_pdf_mapping_reviews"]:
            st.warning(f"{status['pending_pdf_mapping_reviews']} PDF field mapping(s) awaiting human review")
        st.caption("Exported to output/" if status["exported"] else "Not exported yet")

st.divider()
st.markdown("### Run a phase")

form_choice = st.selectbox("Form", all_forms, format_func=da.form_display, key="build_control_form")

if "phase_output" not in st.session_state:
    st.session_state["phase_output"] = {}

per_form_phases = [(k, label) for k, label, needs_form in da.PHASES if needs_form]
global_phases = [(k, label) for k, label, needs_form in da.PHASES if not needs_form]

cols = st.columns(3)
for idx, (phase_key, label) in enumerate(per_form_phases):
    col = cols[idx % 3]
    with col:
        if st.button(label, key=f"run_{phase_key}_{form_choice}", use_container_width=True):
            with st.spinner(f"Running `{phase_key} --form {form_choice} --tax-year {tax_year}`..."):
                result = da.run_phase(phase_key, form_choice, tax_year)
            st.session_state["phase_output"][f"{phase_key}:{form_choice}"] = result

st.markdown("##### Cross-form (global, no `--form`)")
for phase_key, label in global_phases:
    if st.button(label, key=f"run_{phase_key}_global", use_container_width=False):
        with st.spinner(f"Running `{phase_key} --tax-year {tax_year}`..."):
            result = da.run_phase(phase_key, None, tax_year)
        st.session_state["phase_output"][f"{phase_key}:global"] = result

st.markdown("##### Run the whole sequence")
if st.button(f"\u25B6 Run full pilot for {da.form_display(form_choice)}", type="primary"):
    with st.spinner(f"Running `run-pilot --form {form_choice} --tax-year {tax_year}`..."):
        result = da.run_phase("run-pilot", form_choice, tax_year)
    st.session_state["phase_output"][f"run-pilot:{form_choice}"] = result

if form_choice in ("4562", "1040se"):
    st.caption("For cost seg forms, prefer **Cost Seg IRS Pipeline** global phase (uses `--canonical-only`).")

if st.session_state["phase_output"]:
    st.divider()
    st.markdown("### Recent output")
    for key in reversed(list(st.session_state["phase_output"].keys())):
        result = st.session_state["phase_output"][key]
        ok = result.returncode == 0
        with st.expander(f"{'\u2705' if ok else '\u274C'} {key} (exit code {result.returncode})", expanded=not ok):
            if result.stdout:
                st.code(result.stdout, language="text")
            if result.stderr:
                st.caption("stderr / logs:")
                st.code(result.stderr, language="text")
    if st.button("Clear output log"):
        st.session_state["phase_output"] = {}
        st.rerun()
