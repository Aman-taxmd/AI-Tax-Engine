# ADR 0006: LangGraph is scoped to the extraction stage only

## Status
Accepted

## Context
LangGraph is well suited to branching, retries, and human-in-the-loop
interrupts, but it is easy to let an agent framework "leak" into stages that
are actually deterministic and better expressed as plain functions.

## Decision
LangGraph is used only in `build/graph/` for the Knowledge Extraction
workflow (line scoping, extraction, cross-reference resolution, structural
consistency check, human review interrupt/resume). Discovery, download,
structural parsing, pattern detection, concept/dependency graph
construction, synthesis, and evaluation are all plain Python functions
invoked from a CLI — no agent framework involved.

## Rationale
- Discovery/parsing/pattern-detection are deterministic; wrapping them in
  graph nodes adds indirection with no behavioral benefit.
- Confines the one genuinely agentic part of the system (extraction, where
  branching/retry/human-interrupt are real requirements) to a single,
  reviewable module instead of letting "everything become an agent."

## Consequences
Code review should reject new LangGraph nodes proposed for stages that don't
need branching, retries, or human interrupts — those belong in `build/`'s
plain-function modules instead.
