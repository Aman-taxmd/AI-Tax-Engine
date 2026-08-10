# ADR 0002: Everything is immutable and versioned

## Status
Accepted

## Context
Tax rules must remain reproducible: a return filed under a given tax year's
rules must be re-derivable exactly, even after the rules are later updated.

## Decision
No row in `documents`, `knowledge_packets`, `canonical_fields`, or
`calc_rules` is ever updated in place once created. Changes always create a
new row with an incremented `version`, and the previous row is linked via
`superseded_by`. Status changes on `calc_rules` are logged permanently in
`rule_status_transitions` rather than overwriting a status column silently.

## Rationale
- Enables exact reproduction of any past calculation without re-running any
  extraction or asking an LLM again (see ADR 0003).
- Makes "what changed and why" a queryable fact instead of lost history.
- Matches how the source data itself behaves — IRS documents are versioned
  by revision date, and treating our derived artifacts as append-only mirrors
  that discipline all the way through the pipeline.

## Consequences
Storage grows monotonically (old versions are never deleted). This is an
accepted and intentional cost of auditability for tax software.
