"""AI Tax Engine — Streamlit app entry point.

Run with: `streamlit run ui/app.py` (from the repository root).

This file is intentionally a thin landing page — the real functionality
lives in `ui/pages/`:
  1. Build Control    — trigger/inspect the build pipeline per form.
  2. Answer Questions  — the taxpayer Q&A + 3-form live view + AI review.
  3. Human Review Queue — resolve pending extraction / grounding-check items.

See ui/data_access.py for the shared DB/pipeline helpers all three use.
"""
from __future__ import annotations

import streamlit as st

from ui import data_access as da

st.set_page_config(page_title="AI Tax Engine — HSA Pilot", page_icon="\U0001F4C4", layout="wide")
da.render_tax_year_selector()

st.title("AI Tax Engine — HSA Pilot")
st.caption("Form 8889 \u2192 Schedule 1 (Form 1040) \u2192 Form 1040, Line 10")

st.markdown(
    """
An IRS-guideline-grounded tax calculation engine, built as a **compiler**
(build time: turn IRS documents into versioned, evidence-backed canonical
fields and calc rules) plus a **deterministic runtime** (execute those rules
against a taxpayer's answers — no LLM, no document reads, fully
reproducible). Everything a value depends on is traceable back to an exact
IRS quote.

Use the sidebar to navigate:

- **Build Control** — trigger and inspect each phase of the build pipeline
  (discover \u2192 parse \u2192 extract \u2192 ... \u2192 evaluate \u2192 export) per form.
- **Answer Questions** — answer the taxpayer questions this pilot has
  identified, see the 3-form view populate live, and run an on-demand AI
  review of the result.
- **Human Review Queue** — resolve the extraction items and Phase 8
  grounding-check flags that are waiting on a human decision.

### How this stays accurate
- Every calc rule is tagged **candidate**, **validated**, or **production**
  — a `candidate` rule is only ever run and *shown with that badge*, never
  silently presented as trustworthy.
- A rule that's wrong (e.g. a Phase 8 grounding-check failure) shows up as a
  clearly flagged, traceable issue — in the form view, in the AI review, and
  in the Human Review Queue — never as a silently-incorrect number.
- The on-demand "Review my return" AI check is **advisory only** — see
  `docs/adr/0007-runtime-review-is-advisory-only.md` — it can flag a
  problem, but it never changes a computed number.
"""
)

with st.expander("Architecture at a glance", expanded=False):
    st.markdown(
        """
```
IRS documents --build/--> canonical_fields + calc_rules + intake_questions (Postgres)
                                     |
                    runtime/engine.py (deterministic, no LLM)
                                     |
                    Answer Questions page (this app) <-- taxpayer answers
                                     |
                    "Review my return" --(on-demand, advisory)--> LLM
```
        """
    )
