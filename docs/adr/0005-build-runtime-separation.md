# ADR 0005: Build-time / runtime separation

## Status
Accepted

## Context
The pipeline that turns IRS documents into rules (LLM calls, PDF/HTML
parsing) must never be a dependency of the system that actually calculates a
taxpayer's return.

## Decision
The repository is split into `build/` (ingestion, extraction, synthesis,
validation — everything in this pilot) and `runtime/` (the calculation
engine and explainability trace). `runtime/` code never imports from
`build/`; the only shared dependency is `db/` (the data-access layer), and
`runtime/` only ever reads rows where `calc_rules.status = 'production'`.

Physical repository separation (two git repos) is deferred until there is an
operational reason to split (different deployment cadence, different team
ownership) — see the "don't build it until reality forces it" principle
applied to Change Detection as well. Splitting now, with only one pilot form
built, would add repo/CI overhead with no corresponding benefit yet.

## Rationale
- Guarantees the runtime engine is fast, deterministic, and auditable — no
  LLM latency or nondeterminism can leak into a live calculation.
- A logical boundary enforced by import rules is verifiable today (e.g. via
  a lint rule or CI check) without paying for infrastructure separation
  before it's needed.

## Consequences
A CI check should eventually assert `runtime/` has no import of `build.*`.
Revisit physical repo split once `runtime/` has real deployment needs
distinct from `build/`.

## Amendment (HSA Streamlit pilot)
The original decision above says `runtime/` "only ever reads rows where
`calc_rules.status = 'production'`" — taken literally, that would make the
runtime engine show nothing today, since no rule has passed the numeric and
baseline-diff checks (Phase 8) that would promote it there; those checks
aren't built yet (see `build/evaluation/run_all.py`). Until they exist,
`runtime/engine.py` reads `candidate` and `validated` rules too, but always
returns each value's rule `status` alongside the number so nothing is ever
presented as more trustworthy than it is — the *badge* enforces the same
"don't trust unreviewed output" principle this ADR exists for, while the
pipeline itself matures. This still respects the letter of the ADR everywhere
else: no LLM calls, no document/PDF reads, no nondeterminism at runtime.
See `docs/adr/0007-runtime-review-is-advisory-only.md` for the one
deliberate, clearly-scoped exception where an LLM *is* invoked adjacent to
runtime (on-demand, advisory-only, never affecting a computed number).
