# ADR 0003: Evidence Bundles as a first-class, immutable object

## Status
Accepted

## Context
A rule's `irs_reference` citation alone is not enough to answer "why does
this rule exist" months later — it doesn't capture which prompt, which
model, or which reviewer produced the interpretation.

## Decision
Every knowledge packet is linked to an `evidence_bundles` row capturing:
`source_type` (llm_extraction / human_review / deterministic_parse), the
exact document version and section ids used, the exact quoted text, the
prompt version, model version, temperature, extraction timestamp, reviewer
(if human), the raw LLM response, and a confidence breakdown. Evidence
bundles are immutable; a re-extraction creates a new bundle, never edits an
old one.

## Rationale
- Full reproducibility without re-invoking an LLM (ADR — see also 0002).
- Human review decisions are evidence too, and are tagged as such
  (`source_type=human_review`) so the highest-trust corrections are
  distinguishable from the model's first pass.
- Prompts and models are treated like code: versioned and attributable.

## Consequences
Every extraction step must construct and persist a bundle before producing a
knowledge packet — there is no path to a packet that skips evidence capture.
