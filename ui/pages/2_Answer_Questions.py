"""Answer Questions — the taxpayer Q&A + 3-form live view + on-demand AI review.

Session persistence is ephemeral by design (st.session_state only) — no
taxpayer answer or computed value is written to the database. Only the
outcome of the on-demand "Review my return" check gets logged (to
runtime_review_findings), for audit/quality-improvement purposes, and even
that never includes the taxpayer's raw answers.
"""
from __future__ import annotations

import re

import streamlit as st

from build.graph import llm_client
from ui import data_access as da
from ui.cost_seg_ui import render_activities_input, render_cost_seg_results
from ui.pdf_render import render_filled_pdf, render_filled_w2_pdf

st.set_page_config(page_title="Answer Questions — AI Tax Engine", page_icon="\U0001F4DD", layout="wide")
tax_year = da.render_tax_year_selector()
st.title("\U0001F4DD Answer Questions")
st.caption(
    "Session is browser-only (nothing is saved server-side except the on-demand AI review's findings, "
    "never your answers). Refreshing the page resets everything."
)
st.caption(f"Calculating for tax year **{tax_year}** (change via the sidebar).")

if "answers" not in st.session_state:
    st.session_state["answers"] = {}
if "profile_answers" not in st.session_state:
    st.session_state["profile_answers"] = {}

questions = da.get_chain_questions(tax_year)

def _line_sort_key(line_ref: str | None) -> tuple:
    if not line_ref:
        return (float("inf"), "")
    m = re.match(r"^(\d+)", line_ref)
    return (int(m.group(1)) if m else float("inf"), line_ref)


STATUS_COLORS = {"ok": "green", "missing_input": "gray", "blocked": "orange", "error": "red", "unsupported": "red"}
RULE_STATUS_COLORS = {"candidate": "orange", "validated": "blue", "production": "green", "superseded": "gray"}
GROUNDING_COLORS = {"pass": "green", "warn": "orange", "fail": "red"}
TIER_COLORS = {"verified": "green", "provisional": "orange", "unsupported": "red"}


def _form_has_unverified_values(computed: dict, form: str) -> bool:
    """True if ANY field this form's PDF view renders carries a
    provisional/unsupported verification tier -- gates the "Pilot estimate"
    banner per the approved Line 16 product-display rule ("do not place a
    provisional number into an apparently completed tax return without any
    visible qualification")."""
    prefix = f"form_{form}_"
    return any(
        name.startswith(prefix) and cv.verification and cv.verification.get("tier") in ("provisional", "unsupported")
        for name, cv in computed.items()
    )


# Per-row keys -> the canonical field each fans out into (see
# build/consolidation/w2_bridge.py's module docstring for why Box 2/3/5/12-W
# share this one widget/question rather than each getting their own).
_W2_ROW_DEFAULTS = {"employer": "", "box1": 0.0, "box2": 0.0, "box3": 0.0, "box5": 0.0, "box12w": 0.0}
_W2_ROW_FIELD_NAMES = {
    "box1": "intake_w2_box1_wages",
    "box2": "intake_w2_box2_fed_withholding",
    "box3": "intake_w2_box3_ss_wages",
    "box5": "intake_w2_box5_medicare_wages",
    "box12w": "intake_w2_box12w_hsa_employer_contrib",
}


def _render_multi_instance_input(q, store: dict) -> None:
    """The "+ Add W-2" widget: a dynamic list of per-employer rows backed by
    st.session_state, one row per Form W-2 the taxpayer received (this
    pilot's one deliberate multi-instance exception -- see
    runtime/engine.py's `sum_instances` / build/consolidation/w2_bridge.py).
    Each row captures Box 1 (wages), Box 2 (federal withholding), Box 3
    (Social Security wages), Box 5 (Medicare wages, display-only for now),
    and Box 12 Code W (HSA employer contribution) -- fanning out into FIVE
    parallel `answers[...]` lists (one per box) plus two presentation-only
    lists (employer name, the literal "W" code label) that only feed the
    "realistic form view" (ui/pdf_render.py), never the runtime engine. The
    employer name is otherwise just so the taxpayer can tell rows apart."""
    rows_key = f"w2_rows_{q.question_key}"
    if rows_key not in st.session_state:
        st.session_state[rows_key] = [dict(_W2_ROW_DEFAULTS)]

    st.write(q.prompt_text)
    rows = st.session_state[rows_key]
    for i, row in enumerate(rows):
        header_cols = st.columns([5, 1])
        with header_cols[0]:
            row["employer"] = st.text_input(
                f"Employer name (W-2 #{i + 1})", value=row["employer"], key=f"{q.question_key}_employer_{i}",
                placeholder="e.g. Acme Corp",
            )
        with header_cols[1]:
            st.write("")  # vertical spacer so the remove button aligns with the text input
            if len(rows) > 1 and st.button("\u2716 Remove", key=f"{q.question_key}_remove_{i}"):
                rows.pop(i)
                st.rerun()
        box_cols = st.columns(4)
        with box_cols[0]:
            row["box1"] = st.number_input(
                "Box 1: Wages", min_value=0.0, step=50.0, format="%.2f", value=row["box1"],
                key=f"{q.question_key}_box1_{i}",
            )
        with box_cols[1]:
            row["box2"] = st.number_input(
                "Box 2: Federal tax withheld", min_value=0.0, step=50.0, format="%.2f", value=row["box2"],
                key=f"{q.question_key}_box2_{i}",
            )
        with box_cols[2]:
            row["box3"] = st.number_input(
                "Box 3: Social security wages", min_value=0.0, step=50.0, format="%.2f", value=row["box3"],
                key=f"{q.question_key}_box3_{i}",
                help="Feeds Schedule SE, Line 8a if you also have self-employment income (so Social Security tax isn't double-charged past the wage-base cap).",
            )
        with box_cols[3]:
            row["box12w"] = st.number_input(
                "Box 12, Code W: Employer HSA contribution", min_value=0.0, step=50.0, format="%.2f",
                value=row["box12w"], key=f"{q.question_key}_box12w_{i}",
                help="Replaces the old manual \u201cForm 8889, Line 9\u201d question \u2014 this is its real source per the W-2 instructions.",
            )
        with st.expander(f"Box 5 (Medicare wages) \u2014 W-2 #{i + 1}, optional, display only"):
            row["box5"] = st.number_input(
                "Box 5: Medicare wages and tips", min_value=0.0, step=50.0, format="%.2f", value=row["box5"],
                key=f"{q.question_key}_box5_{i}",
                help="Captured for the realistic form view only \u2014 not yet used in any calculation (only matters once Additional Medicare Tax is modeled).",
            )
        st.divider()
    if st.button("\u2795 Add another W-2", key=f"{q.question_key}_add"):
        rows.append(dict(_W2_ROW_DEFAULTS))
        st.rerun()

    store[q.question_key] = [row["box1"] for row in rows]
    for box_key, field_name in _W2_ROW_FIELD_NAMES.items():
        if box_key == "box1":
            continue  # already written into store[q.question_key] above
        store[field_name] = [row[box_key] for row in rows]
    store["intake_w2_employer_name"] = [row["employer"] for row in rows]
    store["intake_w2_box12_code_w_label"] = ["W" if row["box12w"] else "" for row in rows]


def _render_question_input(q) -> None:
    is_profile = q.question_key.startswith("profile_") or q.question_key.startswith("taxpayer_")
    store = st.session_state["profile_answers"] if is_profile else st.session_state["answers"]
    key = f"widget_{q.question_key}"

    if q.input_type == "activities":
        render_activities_input(store)
        return

    if q.input_type == "currency_multi_instance":
        _render_multi_instance_input(q, store)
        with st.expander("Why am I being asked this?"):
            st.write(q.justification)
            ref = q.irs_reference or {}
            if ref.get("quote"):
                source = ref.get("source") or f"Form {ref.get('form')}, Line {ref.get('line')}"
                st.caption(f"IRS source: {source}")
                st.info(f"\u201c{ref['quote']}\u201d")
        return

    if q.input_type == "currency":
        value = st.number_input(q.prompt_text, min_value=0.0, step=50.0, format="%.2f", key=key)
    elif q.input_type == "integer":
        value = st.number_input(q.prompt_text, min_value=0, max_value=120, step=1, value=None, key=key, placeholder="Enter a number")
    elif q.input_type == "boolean":
        value = st.checkbox(q.prompt_text, key=key)
    elif q.input_type == "choice":
        value = st.selectbox(q.prompt_text, options=q.choices or [], index=None, placeholder="Select...", key=key)
    elif q.input_type == "date":
        value = st.date_input(q.prompt_text, value=None, key=key)
    else:
        value = st.text_input(q.prompt_text, key=key)

    store[q.question_key] = value

    with st.expander("Why am I being asked this?"):
        st.write(q.justification)
        ref = q.irs_reference or {}
        if ref.get("quote"):
            source = ref.get("source") or f"Form {ref.get('form')}, Line {ref.get('line')}"
            st.caption(f"IRS source: {source}")
            st.info(f"\u201c{ref['quote']}\u201d")


with st.sidebar:
    st.header("Taxpayer Questions")
    st.caption("Profile questions first, then the questions this pilot's Question Registry derived from the forms themselves.")
    profile_qs = [q for q in questions if q.question_key.startswith("profile_")]
    form_qs = [q for q in questions if not q.question_key.startswith("profile_")]

    # The HSA chain itself only ever asks 2 form-line questions (Form 8889,
    # lines 2 and 12 -- everything else on that form is either a profile
    # question or computed). Schedule C is now a first-class modeled chain
    # (Schedule C -> Schedule SE -> Schedule 2 -> Form 1040), not a minor
    # adjustment, so it gets its own labeled section like W-2/HSA rather
    # than being buried in the generic bucket below. Schedule 1's Line 26
    # ("Total Adjustments") is a real IRS sum of ~13 unrelated deduction
    # lines (educator expenses, moving expenses, etc.), and Form 1040/
    # Schedule 1-A similarly pull in several unrelated income/deduction
    # lines once wages+AGI+taxable-income are in scope -- so the Question
    # Registry's ancestor-closure correctly asks all of them, but showing
    # every one up front buries the handful that actually matter for this
    # pilot's story. They're not deleted (each still drives real math,
    # defaults to $0 either way), just tucked into a collapsed,
    # clearly-labeled group.
    w2_qs = [q for q in form_qs if q.input_type == "currency_multi_instance"]
    cost_seg_qs = [q for q in form_qs if q.input_type == "activities" or q.question_key.startswith("taxpayer_")]
    hsa_qs = [q for q in form_qs if q.form_number == "8889"]
    schedc_qs = [q for q in form_qs if q.form_number == "1040sc"]
    other_qs = [
        q for q in form_qs
        if q not in w2_qs and q not in hsa_qs and q not in schedc_qs and q not in cost_seg_qs
    ]

    st.subheader("About you")
    for q in profile_qs:
        _render_question_input(q)

    st.subheader("Cost segregation / depreciation")
    activity_qs = [q for q in cost_seg_qs if q.input_type == "activities"]
    reps_qs = [q for q in cost_seg_qs if q.question_key.startswith("taxpayer_")]
    for q in activity_qs:
        _render_question_input(q)
    for q in reps_qs:
        _render_question_input(q)

    st.subheader("W-2 income")
    for q in w2_qs:
        _render_question_input(q)

    st.subheader("HSA activity")
    if hsa_qs:
        st.markdown(f"**{da.form_display('8889')}**")
        for q in hsa_qs:
            _render_question_input(q)

    if schedc_qs:
        st.subheader("Self-employment income (Schedule C)")
        st.caption(
            "Leave at $0 if you have no self-employment income — flows through Schedule SE and Schedule 2 "
            "to Form 1040."
        )
        with st.expander(f"{da.form_display('1040sc')} ({len(schedc_qs)} lines)", expanded=False):
            for q in schedc_qs:
                _render_question_input(q)

    if other_qs:
        with st.expander(
            f"Other income & adjustments ({len(other_qs)} — optional, default $0)",
            expanded=False,
        ):
            st.caption(
                "Form 1040, Schedule 1, and Schedule 1-A each genuinely sum several unrelated income/"
                "deduction lines (other wages, dividends, educator expenses, tips, ...) on their way to "
                "Taxable Income -- leave these at $0 unless they apply to you."
            )
            for q in other_qs:
                _render_question_input(q)

st.markdown("### Model & prompt versions in use")
with st.expander("Show exactly which models/prompts produced this pipeline's rules", expanded=False):
    st.markdown(
        f"""
- **Extraction** (Phase 4 — drafts a rule from raw IRS text): prompt `{llm_client.PROMPT_VERSION}`, model `{llm_client.BEDROCK_MODEL_ID}` (falls back to `{llm_client.STUB_MODEL_VERSION}` without credentials)
- **Grounding judge** (Phase 8 — audits a rule against its cited quote): prompt `{llm_client.JUDGE_PROMPT_VERSION}`
- **Return review** (on-demand, advisory only — see docs/adr/0007): prompt `{llm_client.REVIEW_PROMPT_VERSION}`

Every computed line below shows its own rule's status (candidate/validated/production) and, when available, its
Phase 8 grounding result — open a line's "Show trace" to see the exact formula, upstream fields, and IRS quote used.
"""
    )

answers = dict(st.session_state["answers"])
profile_answers = dict(st.session_state["profile_answers"])
computed = da.compute_return(answers, profile_answers, tax_year)
fields_by_name = da.get_chain_canonical_fields(tax_year)

render_cost_seg_results(answers, computed, tax_year, profile_answers)

st.markdown("### Your return, line by line")
_core_forms = [f for f in da.PILOT_FORMS if f not in da.COST_SEG_FORMS]
tabs = st.tabs([da.form_display(f) for f in _core_forms])

for tab, form in zip(tabs, _core_forms):
    with tab:
        all_fields = sorted(
            da.get_all_canonical_fields_for_form(form, tax_year), key=lambda f: _line_sort_key(f.source_form_line)
        )
        for field in all_fields:
            cv = computed.get(field.field_name)
            left, right = st.columns([3, 2])
            with left:
                st.markdown(f"**Line {field.source_form_line}** — {field.description.split(chr(0x2014))[0].strip()}")
            with right:
                if cv is None:
                    st.caption("Not modeled in this pilot yet")
                    continue
                value_str = f"${cv.value:,.2f}" if isinstance(cv.value, (int, float)) else (str(cv.value) if cv.value is not None else "\u2014")
                tier = (cv.verification or {}).get("tier") if cv.verification else None
                badge_cols = st.columns([2, 2, 2, 2])
                with badge_cols[0]:
                    st.badge(value_str, color="blue" if cv.status == "ok" else "gray")
                with badge_cols[1]:
                    st.badge(cv.status, color=STATUS_COLORS.get(cv.status, "gray"))
                with badge_cols[2]:
                    if cv.rule_status:
                        st.badge(cv.rule_status, color=RULE_STATUS_COLORS.get(cv.rule_status, "gray"))
                    elif cv.source == "answer":
                        st.badge("taxpayer input", color="gray")
                    elif cv.source == "condition":
                        st.badge("hand-authored", color="violet")
                with badge_cols[3]:
                    if tier and tier != "verified":
                        st.badge(f"{tier} estimate", color=TIER_COLORS.get(tier, "gray"))

            if cv is not None:
                grounding_result = (cv.grounding or {}).get("result") if cv.grounding else None
                with st.expander(
                    f"Show trace{f' — grounding: {grounding_result}' if grounding_result else ''}",
                    expanded=(cv.status in ("blocked", "error", "unsupported")),
                ):
                    st.write(f"**Source:** `{cv.source}`" + (f" (rule `{cv.rule_id}`)" if cv.rule_id else ""))
                    if cv.explanation:
                        st.write(cv.explanation)
                    if cv.formula:
                        st.code(cv.formula, language="python")
                    if cv.upstream_field_names:
                        st.caption(f"Depends on: {', '.join(cv.upstream_field_names)}")
                    if cv.irs_reference and cv.irs_reference.get("quote"):
                        st.info(f"\u201c{cv.irs_reference['quote']}\u201d")
                    if cv.verification:
                        tier = cv.verification.get("tier")
                        st.badge(f"verification: {tier}", color=TIER_COLORS.get(tier, "gray"))
                        assumptions = cv.verification.get("assumptions") or []
                        if assumptions:
                            st.caption("This estimate assumes:")
                            for a in assumptions:
                                st.caption(f"\u2022 {a}")
                        unverified = cv.verification.get("unverified_conditions") or []
                        if unverified:
                            st.caption("Not yet verified by this pilot (assumed absent for a provisional estimate):")
                            for u in unverified:
                                st.caption(f"\u2022 {u}")
                    if grounding_result:
                        color = GROUNDING_COLORS.get(grounding_result, "gray")
                        st.badge(f"Phase 8 grounding: {grounding_result}", color=color)
                        issues = (cv.grounding or {}).get("detail", {}).get("issues", [])
                        for issue in issues:
                            st.warning(issue)
            st.divider()

        with st.expander("\U0001F5A8\uFE0F Realistic form view (the actual IRS PDF, filled live)", expanded=False):
            pdf_path = da.get_form_pdf_path(form)
            if pdf_path is None:
                st.caption(
                    "This form's PDF hasn't been discovered/catalogued yet — run the 'Discover' phase for "
                    "this form on the Build Control page (needs `form` in its catalog's include_doc_types)."
                )
            else:
                field_mappings = da.get_pdf_field_mappings(form, tax_year)
                if not field_mappings:
                    st.caption(
                        "No PDF field mappings yet — run the 'PDF Field Mapping' phase for this form on the "
                        "Build Control page."
                    )
                else:
                    rendered = render_filled_pdf(pdf_path, field_mappings, computed)
                    if rendered is None:
                        st.caption("Could not render this form's PDF.")
                    else:
                        if _form_has_unverified_values(computed, form):
                            # Approved Line 16 product-display rule: never let
                            # a provisional/unsupported number sit on an
                            # apparently-completed PDF without a visible
                            # qualification -- see runtime/tax_lookup.py.
                            st.warning(
                                "\u26A0\uFE0F **Pilot estimate — incomplete return.** This form includes at least "
                                "one provisional or unsupported value (see the badges above) that this pilot "
                                "cannot yet fully verify. Do not file this as a completed return."
                            )
                        st.caption(
                            f"{rendered.mapped_count}/{rendered.total_in_scope} in-scope fields placed on the "
                            "real PDF (unmapped/empty fields are blank, same as an unanswered question above)."
                        )
                        for i, page_png in enumerate(rendered.page_images):
                            st.image(page_png, caption=f"{da.form_display(form)} — page {i + 1}", width="stretch")
                        st.download_button(
                            "\u2B07\uFE0F Download filled PDF",
                            data=rendered.pdf_bytes,
                            file_name=f"{form}_filled.pdf",
                            mime="application/pdf",
                            key=f"download_pdf_{form}",
                        )

st.markdown("### Your W-2(s)")
st.caption(
    "Form W-2 is this pilot's one genuinely multi-instance form (see build/consolidation/w2_bridge.py) -- "
    "each employer you entered above gets its own realistic Copy B view here, rather than a single shared "
    "tab like the 4 forms above."
)
w2_wages = answers.get("intake_w2_box1_wages") or []
if not w2_wages:
    st.caption("No W-2s entered yet -- use \u201c+ Add another W-2\u201d in the sidebar's \u201cW-2 income\u201d section.")
else:
    w2_pdf_path = da.get_form_pdf_path("w2")
    w2_field_mappings = da.get_pdf_field_mappings("w2", tax_year)
    if w2_pdf_path is None:
        st.caption(
            "Form W-2's PDF hasn't been discovered/catalogued yet — run `discover --form w2` on the Build "
            "Control page."
        )
    elif not w2_field_mappings:
        st.caption(
            "No Form W-2 PDF field mappings yet — run the `w2-pdf-bridge` phase (see build/cli.py)."
        )
    else:
        w2_employers = answers.get("intake_w2_employer_name") or []
        w2_box2 = answers.get("intake_w2_box2_fed_withholding") or []
        w2_box3 = answers.get("intake_w2_box3_ss_wages") or []
        w2_box5 = answers.get("intake_w2_box5_medicare_wages") or []
        w2_box12w = answers.get("intake_w2_box12w_hsa_employer_contrib") or []
        w2_code_w = answers.get("intake_w2_box12_code_w_label") or []
        w2_tabs = st.tabs([
            f"W-2 #{i + 1}" + (f" \u2014 {w2_employers[i]}" if i < len(w2_employers) and w2_employers[i] else "")
            for i in range(len(w2_wages))
        ])
        for i, w2_tab in enumerate(w2_tabs):
            with w2_tab:
                row = {
                    "intake_w2_employer_name": w2_employers[i] if i < len(w2_employers) else "",
                    "intake_w2_box1_wages": w2_wages[i],
                    "intake_w2_box2_fed_withholding": w2_box2[i] if i < len(w2_box2) else 0.0,
                    "intake_w2_box3_ss_wages": w2_box3[i] if i < len(w2_box3) else 0.0,
                    "intake_w2_box5_medicare_wages": w2_box5[i] if i < len(w2_box5) else 0.0,
                    "intake_w2_box12w_hsa_employer_contrib": w2_box12w[i] if i < len(w2_box12w) else 0.0,
                    "intake_w2_box12_code_w_label": w2_code_w[i] if i < len(w2_code_w) else "",
                }
                rendered = render_filled_w2_pdf(w2_pdf_path, w2_field_mappings, row)
                if rendered is None:
                    st.caption("Could not render this W-2's Copy B page.")
                else:
                    st.caption(
                        f"{rendered.mapped_count}/{rendered.total_in_scope} in-scope boxes placed on the real "
                        "Copy B page (Box 4/6/7/8/9-11/13-20 are outside this pilot's modeled scope and left blank)."
                    )
                    for page_png in rendered.page_images:
                        st.image(page_png, caption=f"Form W-2, Copy B \u2014 {row['intake_w2_employer_name'] or f'W-2 #{i + 1}'}", width="stretch")
                    st.download_button(
                        "\u2B07\uFE0F Download filled W-2",
                        data=rendered.pdf_bytes,
                        file_name=f"w2_{i + 1}_filled.pdf",
                        mime="application/pdf",
                        key=f"download_pdf_w2_{i}",
                    )

st.markdown("### On-demand AI review (advisory only)")
st.caption(
    "This is NOT part of the deterministic calculation above — it's a separate, clearly-labeled LLM check "
    "that can flag something implausible, but it can never change a computed number. See docs/adr/0007."
)

if st.button("\U0001F50D Review my return", type="primary"):
    with st.spinner("Running the AI review..."):
        result = da.run_return_review(computed, fields_by_name)
    st.session_state["last_review"] = result

if "last_review" in st.session_state:
    result = st.session_state["last_review"]
    st.caption(f"Model: `{result.model_version}` \u00b7 Prompt version: `{result.prompt_version}`")
    severity_icon = {"info": "\u2139\uFE0F", "warning": "\u26A0\uFE0F", "error": "\U0001F6A8"}
    for finding in result.findings:
        icon = severity_icon.get(finding.severity, "\u2139\uFE0F")
        st.markdown(f"{icon} **{finding.plain_language}**")
        if finding.technical_note:
            st.caption(f"For reviewers: {finding.technical_note}")
