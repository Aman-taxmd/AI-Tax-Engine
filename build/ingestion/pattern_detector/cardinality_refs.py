"""cardinality_ref detection (Phase 3), no LLM.

Finds sentences that signal a field or form can occur more than once per
taxpayer — e.g. multiple HSAs, a separate Form 8889 per spouse. These
findings feed the `cardinality` / `instance_dimension` columns on
`canonical_fields` in Phase 7 (the plan's "detect cardinality directly from
IRS instructions" requirement) instead of guessing multi-instance shape from
the XSD alone (the XSD only says an *element* can repeat; it doesn't say
*why* — e.g. "one 8889 per spouse" vs "one row per HSA account").
"""
from __future__ import annotations

import re

from sqlalchemy.orm import Session

from build.ingestion.pattern_detector.common import DetectedEdge
from db.models import Section

_SENTENCE_SPLIT = re.compile(r"(?<=[.!?])\s+")

_CARDINALITY_PATTERNS = [
    (re.compile(r"\ball\s+(?:your\s+|of\s+your\s+)?HSAs\b", re.IGNORECASE), "hsa_account"),
    (re.compile(r"\bseparate\s+HSAs?\b", re.IGNORECASE), "hsa_account"),
    (re.compile(r"\beach\s+HSA\b", re.IGNORECASE), "hsa_account"),
    (re.compile(r"\bspouses?\s+who\s+have\s+separate\s+HSAs\b", re.IGNORECASE), "hsa_account"),
    (re.compile(r"\bseparate\s+Form\s+8889\b", re.IGNORECASE), "taxpayer_spouse"),
    (re.compile(r"\bfor\s+each\s+spouse\b", re.IGNORECASE), "taxpayer_spouse"),
    # NOTE: a broad "you (or your spouse...)" pattern used to live here. It
    # was removed — that phrasing is ubiquitous throughout IRS instructions
    # for describing joint-filing ELIGIBILITY ("you or your spouse received
    # a distribution...") and says nothing about the FORM or FIELD repeating
    # once per spouse (real per-spouse cardinality signals say "separate
    # Form ___" or "for each spouse", both already covered above). Matching
    # it unconditionally caused every field on Form 1040 (a single return,
    # never filed "once per spouse") to be mistagged multi_instance, purely
    # because i1040gi's instructions happen to use that phrase constantly
    # for unrelated eligibility conditions.
]


def detect(session: Session, section: Section) -> list[DetectedEdge]:
    if not section.text:
        return []
    edges: list[DetectedEdge] = []
    for sentence in _SENTENCE_SPLIT.split(section.text):
        for pattern, instance_dimension in _CARDINALITY_PATTERNS:
            m = pattern.search(sentence)
            if not m:
                continue
            edges.append(
                DetectedEdge(
                    edge_type="cardinality_ref",
                    raw_phrase=sentence.strip(),
                    to_document_hint=instance_dimension,
                    to_section_id=None,
                    resolution_method="regex",
                    confidence=0.7,
                )
            )
    return edges
