"""Human Review Queue — replaces `python -m build.cli resolve-review` /
`resolve-calc-rule-review` / `resolve-pdf-field-mapping-review` with a UI.
Three independent item kinds share this queue (see db/models.py's
HumanReviewItem.detail docstring):

- `extraction_thread` (Phase 5): a paused LangGraph thread. Supports
  accept / correct / retry_with_feedback (a real LLM re-invocation — see
  build/graph/llm_client.py's extract_with_feedback).
- `calc_rule` (Phase 8): a grounding-check flag on a calc-rule-agent rule
  that the bounded automated repair loop (see grounding_check.py) either
  couldn't classify a fixable cause for, or exhausted its attempts on.
  Supports accept / manual_correct.
- `pdf_field_mapping`: a low-confidence or entirely-unmapped canonical
  field -> real PDF field code proposal from the PDF field mapper. Supports
  accept / manual_map.
"""
from __future__ import annotations

import json

import streamlit as st

from ui import data_access as da

st.set_page_config(page_title="Human Review Queue — AI Tax Engine", page_icon="🗂️", layout="wide")
da.render_tax_year_selector()
st.title("🗂️ Human Review Queue")
st.caption(
    "Every item Phase 5 (extraction) or Phase 8 (grounding check) paused for a human look. "
    "Replaces the `resolve-review` / `resolve-calc-rule-review` CLI commands entirely."
)

if "reviewer_name" not in st.session_state:
    st.session_state["reviewer_name"] = ""
st.session_state["reviewer_name"] = st.text_input(
    "Reviewer name (recorded on every resolution)",
    value=st.session_state["reviewer_name"],
    placeholder="e.g. jane.doe",
)
reviewer = st.session_state["reviewer_name"].strip() or "unknown_reviewer"

extraction_items = da.get_pending_review_items("extraction_thread")
calc_rule_items = da.get_pending_review_items("calc_rule")
pdf_mapping_items = da.get_pending_review_items("pdf_field_mapping")

tab_extraction, tab_calc_rule, tab_pdf_mapping, tab_resolved = st.tabs(
    [
        f"📝 Extraction reviews ({len(extraction_items)})",
        f"🧮 Calc rule reviews ({len(calc_rule_items)})",
        f"🖨️ PDF field mapping ({len(pdf_mapping_items)})",
        "✅ Recently resolved",
    ]
)


def _item_label(item, primary: str) -> str:
    short_reason = (item.reason or "").strip()
    if len(short_reason) > 70:
        short_reason = short_reason[:67] + "..."
    return f"{primary} — {short_reason}" if short_reason else primary


# ---------------------------------------------------------------------------
# Extraction reviews (Phase 5)
# ---------------------------------------------------------------------------
with tab_extraction:
    if not extraction_items:
        st.info("No pending extraction reviews. Nice.")
    else:
        options = {item.id: item for item in extraction_items}
        selected_id = st.selectbox(
            "Pending extraction thread",
            options=list(options.keys()),
            format_func=lambda iid: _item_label(options[iid], options[iid].related_id),
            key="extraction_select",
        )
        item = options[selected_id]
        detail = item.detail or {}

        left, right = st.columns([3, 2])
        with left:
            st.subheader(f"Line {detail.get('irs_line', '?')}")
            if detail.get("source_url"):
                st.caption(f"[Source document]({detail['source_url']})")
            if detail.get("quote"):
                st.markdown("**Raw IRS text (source section):**")
                st.info(detail["quote"])

            draft = detail.get("draft_packet") or {}
            st.markdown("**Current draft packet:**")
            st.write(draft.get("core_text", "(no core_text)"))
            if draft.get("exceptions"):
                st.markdown("**Exceptions:**")
                for exc in draft["exceptions"]:
                    st.write(f"- {exc}")
            if draft.get("confidence"):
                st.caption(f"Confidence breakdown: {draft['confidence']}")

            if detail.get("consistency_issues"):
                st.markdown("**Why this paused (structural check issues):**")
                for issue in detail["consistency_issues"]:
                    st.warning(issue)

        with right:
            st.markdown("### Resolve")

            if st.button("✅ Accept as-is", key="accept_extraction", type="primary"):
                try:
                    da.resolve_extraction_item(item.related_id, "accept", reviewer)
                    st.success("Accepted.")
                    st.rerun()
                except Exception as e:  # noqa: BLE001
                    st.error(f"Failed to resolve: {e}")

            with st.expander("✏️ Correct by hand"):
                core_text = st.text_area(
                    "Corrected core_text", value=draft.get("core_text", ""), key="correct_core_text"
                )
                exceptions_raw = st.text_area(
                    "Exceptions (one per line)",
                    value="\n".join(draft.get("exceptions", [])),
                    key="correct_exceptions",
                )
                if st.button("Submit correction", key="submit_correct"):
                    exceptions = [line.strip() for line in exceptions_raw.splitlines() if line.strip()]
                    try:
                        da.resolve_extraction_item(
                            item.related_id, "correct", reviewer, core_text=core_text, exceptions=exceptions
                        )
                        st.success("Correction saved.")
                        st.rerun()
                    except Exception as e:  # noqa: BLE001
                        st.error(f"Failed to resolve: {e}")

            with st.expander("🔁 Retry with feedback (re-invokes the LLM)"):
                st.caption(
                    "Your note is injected directly into the extraction prompt and a fresh draft is produced "
                    "(build/graph/llm_client.py's extract_with_feedback). It may pause here again for another look."
                )
                feedback = st.text_area(
                    "Feedback for the LLM", key="retry_feedback", placeholder="e.g. Don't include the IRA rollover exception here — that's Line 11, not Line 9."
                )
                if st.button("Retry extraction with this feedback", key="submit_retry"):
                    if not feedback.strip():
                        st.warning("Enter some feedback first.")
                    else:
                        with st.spinner("Re-running extraction with your feedback..."):
                            try:
                                da.resolve_extraction_item(
                                    item.related_id, "retry_with_feedback", reviewer, feedback=feedback
                                )
                                st.success("Retried — check back here (it may have paused again with a new draft).")
                                st.rerun()
                            except Exception as e:  # noqa: BLE001
                                st.error(f"Failed to resolve: {e}")

# ---------------------------------------------------------------------------
# Calc rule reviews (Phase 8)
# ---------------------------------------------------------------------------
with tab_calc_rule:
    if not calc_rule_items:
        st.info("No pending calc rule reviews. Nice.")
    else:
        options = {item.id: item for item in calc_rule_items}
        selected_id = st.selectbox(
            "Pending calc rule flag",
            options=list(options.keys()),
            format_func=lambda iid: _item_label(options[iid], (options[iid].detail or {}).get("rule_id", options[iid].related_id)),
            key="calc_rule_select",
        )
        item = options[selected_id]
        detail = item.detail or {}

        left, right = st.columns([3, 2])
        with left:
            st.subheader(detail.get("rule_id", "(unknown rule)"))
            grounding_result = detail.get("grounding_result")
            color = {"pass": "green", "warn": "orange", "fail": "red"}.get(grounding_result, "gray")
            if grounding_result:
                st.badge(f"Phase 8 grounding: {grounding_result}", color=color)
            if detail.get("grounding_confidence") is not None:
                st.caption(f"Judge confidence: {detail['grounding_confidence']:.2f}")
            if detail.get("repair_attempts_exhausted"):
                cause = detail.get("likely_cause", "unclear")
                st.caption(
                    f"🔁 The Phase 8 repair loop already tried {detail['repair_attempts_exhausted']} automated "
                    f"fix attempt(s) (last classified cause: `{cause}`) before this landed here — the agent "
                    "could not converge on a passing formula on its own, so it needs a human now."
                )
            if detail.get("grounding_issues"):
                st.markdown("**Issues the LLM judge raised:**")
                for issue in detail["grounding_issues"]:
                    st.warning(issue)

            ref = detail.get("irs_reference") or {}
            if ref.get("quote"):
                st.markdown("**Cited IRS quote:**")
                st.info(ref["quote"])
            if detail.get("source_url"):
                st.caption(f"[Source document]({detail['source_url']})")

            st.markdown("**Current formula:**")
            st.code(json.dumps(detail.get("formula"), indent=2), language="json")
            st.markdown("**Operands:**")
            st.code(json.dumps(detail.get("operands"), indent=2), language="json")
            if detail.get("carryover_target"):
                st.caption(f"Carryover target: `{detail['carryover_target']}`")

        with right:
            st.markdown("### Resolve")

            if st.button("✅ Accept despite flag", key="accept_calc_rule", type="primary"):
                try:
                    da.resolve_calc_rule_item(item.id, "accept", reviewer)
                    st.success("Accepted — rule promoted to validated.")
                    st.rerun()
                except Exception as e:  # noqa: BLE001
                    st.error(f"Failed to resolve: {e}")

            with st.expander("✏️ Manually correct formula/operands"):
                st.caption("Edit as JSON. Leave a field unchanged if you don't need to touch it.")
                formula_raw = st.text_area(
                    "formula (JSON)",
                    value=json.dumps(detail.get("formula"), indent=2),
                    key="correct_formula",
                    height=150,
                )
                operands_raw = st.text_area(
                    "operands (JSON)",
                    value=json.dumps(detail.get("operands"), indent=2),
                    key="correct_operands",
                    height=100,
                )
                carryover_raw = st.text_input(
                    "carryover_target",
                    value=detail.get("carryover_target") or "",
                    key="correct_carryover",
                )
                if st.button("Submit manual correction", key="submit_manual_correct"):
                    try:
                        correction = {
                            "formula": json.loads(formula_raw),
                            "operands": json.loads(operands_raw),
                            "carryover_target": carryover_raw or None,
                        }
                    except json.JSONDecodeError as e:
                        st.error(f"Invalid JSON: {e}")
                    else:
                        try:
                            da.resolve_calc_rule_item(item.id, "manual_correct", reviewer, correction=correction)
                            st.success("Correction saved — rule promoted to validated.")
                            st.rerun()
                        except Exception as e:  # noqa: BLE001
                            st.error(f"Failed to resolve: {e}")

# ---------------------------------------------------------------------------
# PDF field mapping reviews
# ---------------------------------------------------------------------------
with tab_pdf_mapping:
    if not pdf_mapping_items:
        st.info("No pending PDF field mapping reviews. Nice.")
    else:
        options = {item.id: item for item in pdf_mapping_items}
        selected_id = st.selectbox(
            "Pending PDF field mapping flag",
            options=list(options.keys()),
            format_func=lambda iid: _item_label(options[iid], (options[iid].detail or {}).get("field_name", options[iid].related_id)),
            key="pdf_mapping_select",
        )
        item = options[selected_id]
        detail = item.detail or {}

        left, right = st.columns([3, 2])
        with left:
            st.subheader(f"{detail.get('field_name', '(unknown field)')} (line {detail.get('line', '?')})")
            proposed = detail.get("proposed_pdf_field_code")
            if proposed:
                st.badge(f"Proposed: {proposed}", color="orange")
                if detail.get("confidence") is not None:
                    st.caption(f"Agent confidence: {detail['confidence']:.2f}")
            else:
                st.badge("No confident match found", color="red")
            if detail.get("page_number") is not None:
                st.caption(f"PDF page: {detail['page_number']}")
            if detail.get("reasoning"):
                st.markdown("**Agent reasoning:**")
                st.info(detail["reasoning"])

        with right:
            st.markdown("### Resolve")

            if proposed and st.button("✅ Accept proposed mapping", key="accept_pdf_mapping", type="primary"):
                try:
                    da.resolve_pdf_field_mapping_item(item.id, "accept", reviewer)
                    st.success("Accepted.")
                    st.rerun()
                except Exception as e:  # noqa: BLE001
                    st.error(f"Failed to resolve: {e}")

            with st.expander("✏️ Manually map to a PDF field code"):
                manual_code = st.text_input(
                    "PDF field code (e.g. topmostSubform[0].Page1[0].f1_2[0])",
                    key="manual_pdf_field_code",
                )
                if st.button("Submit manual mapping", key="submit_manual_map"):
                    if not manual_code.strip():
                        st.warning("Enter a PDF field code first.")
                    else:
                        try:
                            da.resolve_pdf_field_mapping_item(item.id, "manual_map", reviewer, pdf_field_code=manual_code.strip())
                            st.success("Mapping saved.")
                            st.rerun()
                        except Exception as e:  # noqa: BLE001
                            st.error(f"Failed to resolve: {e}")

# ---------------------------------------------------------------------------
# Recently resolved
# ---------------------------------------------------------------------------
with tab_resolved:
    resolved = da.get_resolved_review_items(limit=20)
    if not resolved:
        st.info("Nothing resolved yet.")
    else:
        for item in resolved:
            label = (
                (item.detail or {}).get("rule_id")
                or (item.detail or {}).get("field_name")
                or (item.detail or {}).get("irs_line")
                or item.related_id
            )
            with st.expander(f"[{item.related_type}] {label} — resolved {item.resolved_at:%Y-%m-%d %H:%M}"):
                st.caption(f"Reason it was flagged: {item.reason}")
                st.write(f"**Resolution:** {item.resolution_notes}")
