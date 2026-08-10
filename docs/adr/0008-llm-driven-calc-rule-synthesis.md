# ADR 0008: LLM-driven calc rule synthesis, bounded Phase 8 repair loop, and LLM-assisted PDF field mapping

## Status
Accepted

## Context
Phase 6 (dependency graph) and Phase 7 (calc rule synthesis) were originally
pure regex/pattern-matching, not an LLM call: a small verb-keyword list
(`_CARRYOVER_VERB` in `build/ingestion/pattern_detector/carryover_refs.py`)
decided whether one line's text referenced another, and `calc_rule_writer.py`
turned that into a formula type by matching a handful of verb phrases. Running
Phase 8's LLM-as-judge grounding check against Form 8889's real instructions
surfaced 7 rules the judge flagged as wrong, and tracing them found four
concrete root causes, all in the deterministic layer:

| bug | mechanism | example |
|---|---|---|
| No negation detection | `_CARRYOVER_VERB` matches `"include"` inside `"do not include..."` identically to a real inclusion | `line_2` wrongly summed `line_9`/`line_10`, which the quote explicitly excludes |
| Silent resolution failure | `resolve_line_ref_in_document` requires an exact `Section.irs_line_ref` string match; a failed match silently dropped the edge instead of surfacing it | `line_13`'s `min` formula was missing `line_12`, a worksheet line with no matching `Section` |
| Hard 500-char quote truncation | `irs_reference["quote"] = core_text[:500]` | `line_19`'s quote was cut off mid-sentence, so Phase 8 couldn't fully verify it |
| Unsafe default | `_classify_formula` returned `("sum", 0.3)` whenever no verb matched, instead of refusing to guess | a "reports a subset of" line got a meaningless single-operand `sum` |

This confirmed the pipeline was failing silently in a specific, fixable way
— not that Phase 8's judgments were wrong. It also raised two further
questions this ADR addresses:
1. If a rule's *quote* is fine but its *formula* is wrong, why should a human
   be the only party allowed to fix it, when an LLM with the same quote and
   the same real candidate-operand list could very plausibly get it right?
2. Once the actual IRS PDF forms are catalogued, taxpayers reviewing their
   return should see the real, familiar IRS form — not just a line-item
   list — with their computed values placed in the right boxes.

## Decision

### 1. Calc rule agent replaces the regex layer
`build/graph/llm_client.py::synthesize_calc_rule()` is a fourth, independent
LLM call site (after extraction, the grounding judge, and the return
review). `build/synthesis/calc_rule_writer.py` calls it once per canonical
field, passing:
- The field's exact, **untruncated** IRS quote (fixes the truncation bug
  directly).
- The full, **real** list of every other canonical field on the same form
  (`field_name`, `line`, `description`) — the LLM can only choose operands
  from this list, never invent one, and any hallucinated name is silently
  dropped by the writer as a defensive backstop.

The agent must first decide pure-input vs. computed, is explicitly instructed
to recognize exclusion/negation language ("do not include...") as *not* an
operand reference, and must refuse to default to `"sum"` when unsure (report
low confidence instead). It is also now the **sole writer** of field→field
`dependency_edges` — `build/consolidation/dependency_graph.py` only writes
field→concept edges now, removing the second, independently-fallible
detection pass entirely. Canonical field generation itself
(`canonical_field_writer.py`) is untouched — it's XSD-grounded, not
regex/verb-based, and had no observed bugs.

### 2. Bounded Phase 8 repair loop
`GroundingJudgment` gained a `likely_cause` field
(`"formula_construction" | "extraction_incomplete" | "unclear"`,
`grounding_judge_v2`). `build/evaluation/grounding_check.py`'s
`run_grounding_check()` now loops (bounded to `MAX_REPAIR_ATTEMPTS = 3`) per
rule instead of failing straight to human review:
1. Judge the rule (unchanged mechanism; every attempt still gets its own
   `EvaluationRun` row for full audit history).
2. Pass → promote `candidate` → `validated` (unchanged).
3. Fail, attempts remain, real (non-stub) judgment:
   - `formula_construction` → re-call `synthesize_calc_rule(feedback=...)`
     on the **same** quote, overwrite the rule's formula/operands in place.
   - `extraction_incomplete` → re-extract via `extract_with_feedback`,
     persisting a **new, immutable** `EvidenceBundle` + `KnowledgePacket`
     (the original is linked forward via `superseded_by`, never edited —
     ADR 0002/0003), then re-run the calc rule agent against the refreshed
     quote.
   - Either path loops back to step 1 with the updated rule.
4. Attempts exhausted, `likely_cause == "unclear"`, or a repair attempt
   couldn't produce a usable result → existing `HumanReviewItem` path,
   unchanged. A human is always the eventual backstop; the loop can never
   run unbounded and never self-promotes to `validated` without an actual
   passing judgment.

The stub judge (no LLM credentials) always reports `likely_cause="unclear"`
and never triggers a repair attempt, since retrying a stub calc-rule
agent/extractor with stub feedback cannot fix anything.

### 3. LLM-assisted PDF field mapping
IRS fillable PDFs use auto-generated AcroForm field codes (e.g.
`topmostSubform[0].Page1[0].f1_2[0]`) with no embedded description text
(confirmed empirically with PyMuPDF — no `/TU` tooltip text on any widget),
so there is no mechanical way to know which code is which line. A new,
fifth LLM call site, `map_pdf_fields()`, proposes a mapping from each PDF
field's page number and on-page position (`rect`) cross-referenced against
each canonical field's line/description — one call per form, scoped to only
the pilot's in-scope fields (`runtime/chain.py`'s `ancestor_closure`), never
the full ~229-field PDF. Every proposal carries a confidence; anything below
`CONFIDENCE_THRESHOLD = 0.7`, or a field the agent omitted entirely, is
routed to a `pdf_field_mapping` `HumanReviewItem` rather than trusted
silently. Results are stored in a new `pdf_field_mappings` table.

Turn-wise, not one mega-call: canonical field synthesis, calc rule
synthesis, and PDF field mapping remain three separate CLI phases and three
separate LLM calls, never combined into a single prompt — this keeps each
call's context narrow and each phase independently re-runnable/debuggable.

### 4. Realistic PDF form view
`ui/pdf_render.py::render_filled_pdf()` opens the real IRS PDF (PyMuPDF),
sets each mapped widget's value from the runtime engine's already-computed
values, and renders each page to a PNG for inline display in
`ui/pages/2_Answer_Questions.py`, alongside (not replacing) the existing
line-by-line trace/badge view — plus a "Download filled PDF" button. This is
presentation-only: it never computes anything, and unmapped/low-confidence
fields simply render blank, exactly like an unanswered question in the
existing view.

## Rationale
A rule shouldn't be treated as un-fixable just because the entity that wrote
it is a model rather than a human — an LLM re-reading the *same* quote with
the *same* real operand list, told specifically what a different LLM (the
judge) found wrong, is a legitimate, bounded repair mechanism, not a
rubber-stamp. Bounding it to 3 attempts and always falling through to a
human keeps the "AI → Validator → Human if needed → Production" chain from
the original plan intact rather than short-circuiting it. Constraining every
new agent call to a real, provided candidate list (operands, or PDF field
codes) is what keeps this safe against hallucination — the model can say "I
don't know" (low confidence / omission), but it can never invent a fact.

## Consequences
- Phase 6/7 have no regex-based field→field detection left; a rule's formula
  and its dependency edges are now decided by the same LLM call, eliminating
  a source of inconsistency between the two.
- Re-running `synthesize --form X` or `evaluate --form X` is idempotent:
  existing calc rules / field→field edges / pending calc_rule review items
  for the form are cleared before regeneration, since the agent is the sole
  authority for "how is this line calculated."
- The stub (no-credentials) fallback for `synthesize_calc_rule()` always
  returns confidence 0.0 and no formula (never guesses), which is stricter
  than the old regex stub — every field routes to human review without
  credentials, which is honest given there's no reliable way to infer
  composition vs. exclusion from text without an LLM.
- The realistic PDF view's accuracy is bounded by the PDF field mapper's
  correctness — this is why low-confidence/unmapped fields go to human
  review instead of silently mis-filling a box on a real tax form.
