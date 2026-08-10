# ADR 0007: On-demand LLM return review is advisory-only

## Status
Accepted

## Context
ADR 0005 draws a hard line: the runtime calculation engine is 100%
deterministic, LLM-free, and reproducible. The Streamlit app, however, adds a
"Review my return" button that gives the taxpayer/reviewer an LLM's
plain-language second opinion on the *computed* return before it's the human
reviewer's problem — e.g. "a $9,500 family HSA contribution exceeds the
$8,550 statutory limit for family coverage" or "the answer to 'HDHP coverage
type' doesn't look like it was used consistently with the age-55 catch-up
answer." This is a real LLM call sitting immediately downstream of the
runtime engine, so it needs an explicit, bounded exception to ADR 0005 rather
than a silent violation.

## Decision
`build/graph/llm_client.py::review_return()` is a third, independent LLM call
site (distinct from extraction and the Phase 8 grounding judge) with these
hard constraints:

1. **Advisory only.** It receives already-computed values as *input* and
   returns `findings` (severity, plain-language message, technical note,
   related rule id). It never writes back into `computed_values` and the
   runtime engine never calls it — only the UI layer does, on explicit user
   action ("Review my return" button).
2. **Narrow context.** The prompt includes only the ~15 fields in the active
   HSA chain (8889 → Schedule 1 → 1040), each with its IRS quote and current
   Phase 8 grounding status — never the full corpus, matching the same
   narrow-context principle used for extraction.
3. **Logged for audit, not for calculation.** Each run is persisted to
   `runtime_review_findings` (model/prompt version, the computed snapshot
   reviewed, and the findings) purely for audit and future quality analysis.
   The taxpayer's raw answers are never persisted anywhere (session is
   ephemeral by design) — only this review outcome.
4. **Clearly labeled in the UI.** Findings render in a visually distinct
   "AI review (advisory)" panel, separate from the deterministic form view,
   and are never used to alter a displayed number.

## Rationale
Taxpayers and reviewers benefit from a second, independent check that
reasons in plain language about plausibility (not just grounding-to-text,
which Phase 8 already covers) — but this must not become an undocumented
back door that quietly reintroduces LLM nondeterminism into the number a
taxpayer files with. Scoping it to "advisory, logged, clearly labeled, never
mutates state" keeps the ADR 0005 guarantee intact for the actual calculation
while still delivering the feature.

## Consequences
- `runtime/` itself still has zero LLM dependency; `review_return()` lives in
  `build/graph/llm_client.py` (already the module for all other LLM calls)
  and is invoked from `ui/`, not from `runtime/engine.py`.
- If this review layer is ever promoted to something that *blocks* filing or
  *changes* a number, that would need its own new ADR — this one only covers
  the advisory, on-demand case described above.
