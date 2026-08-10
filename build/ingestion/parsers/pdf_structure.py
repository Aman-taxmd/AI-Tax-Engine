"""Structural parser for IRS instructions/publication HTML pages (Phase 2).

Named `pdf_structure.py` per the plan, but Form 8889's instructions and
Publication 969 are both published as native HTML (irs.gov/instructions/*,
irs.gov/publications/*) with real heading/anchor structure — which is a
*better* structural-parsing source than a PDF outline, so no PDF-to-text step
is used for this pilot. (If a future form only ships as PDF, a PDF-specific
extractor can be added here without changing the Section contract.)

Deterministic, no LLM. Empirically (see the two real documents this pilot
downloads), IRS instructions/publications share one DOM convention:

  * All substantive content lives inside a single `<div class="book">`
    container — navigation, menus, and footer chrome live outside it and are
    excluded automatically just by scoping to this container.
  * Heading levels are NOT strictly nested (an `<h3>` "Note."/"Worksheet"
    aside frequently follows an `<h4>` "Line N" heading as a sub-part, which
    would break a naive level-stack parent algorithm). Empirically, `<h3>`
    always functions as a child of the nearest preceding `<h4>` within the
    same `<h2>`/`<h1>` (or of that `<h2>`/`<h1>` itself if no `<h4>` has
    started yet). That heuristic is what `_infer_parent` implements below.
  * "Line N" / "Lines N and M" appear verbatim at the start of `<h4>`
    headings in the Specific Instructions part — this is where
    `irs_line_ref` is extracted from.
"""
from __future__ import annotations

import hashlib
import re
from dataclasses import dataclass

from bs4 import BeautifulSoup
from bs4.element import Tag

_HEADING_TAGS = ("h1", "h2", "h3", "h4")

_LINE_MULTI_RE = re.compile(r"^Lines?\s+(\w+)\s+(?:and|,)\s+(\w+)\b", re.IGNORECASE)
_LINE_SINGLE_RE = re.compile(r"^Line\s+(\w+)\b", re.IGNORECASE)
_PART_HEADING_RE = re.compile(r"^Part\s+[IVX]+\b", re.IGNORECASE)


@dataclass
class ParsedSection:
    heading: str
    anchor_id: str | None
    level: int
    irs_line_ref: str | None
    parent_index: int | None  # index into the returned list, or None for root
    order_index: int
    text: str
    content_hash: str


def extract_line_ref(heading_text: str) -> str | None:
    m = _LINE_MULTI_RE.match(heading_text.strip())
    if m:
        return f"{m.group(1)},{m.group(2)}"
    m = _LINE_SINGLE_RE.match(heading_text.strip())
    if m:
        return m.group(1)
    return None


def _text_until_next_heading(start: Tag) -> str:
    parts: list[str] = []
    node = start.find_next_sibling()
    while node is not None:
        if isinstance(node, Tag) and node.name in _HEADING_TAGS:
            break
        if isinstance(node, Tag):
            text = node.get_text(" ", strip=True)
            if text:
                parts.append(text)
        node = node.find_next_sibling()
    return "\n".join(parts)


def parse_book_html(html: str) -> list[ParsedSection]:
    """Parse one IRS instructions/publication HTML page into flat Section
    records with parent linkage. `parent_index` refers to positions within
    the returned list (caller maps these to real Section ids after insert)."""
    soup = BeautifulSoup(html, "lxml")
    book = soup.select_one("div.book")
    if book is None:
        raise ValueError("Expected a <div class='book'> container — unrecognized page layout")

    headings = [h for h in book.find_all(_HEADING_TAGS)]

    sections: list[ParsedSection] = []
    # last_h1/last_h2: most recent chapter/section-heading index (resets deeper trackers).
    # last_h4: most recent h4 of ANY kind — h3 asides (Note./Worksheet/Tip) nest under this.
    # current_line_h4: most recent h4 that started a new "Line N" or "Part N" heading —
    #   non-Line h4 sub-topics (e.g. "Step 1.", "Employer Contributions") nest under this,
    #   rather than becoming new top-level siblings of the Line heading they elaborate on.
    last_h1: int | None = None
    last_h2: int | None = None
    last_h4: int | None = None
    current_line_h4: int | None = None

    for order_index, h in enumerate(headings):
        level = int(h.name[1])
        heading_text = h.get_text(" ", strip=True)
        anchor_id = h.get("id")
        is_part_heading = bool(_PART_HEADING_RE.match(heading_text))
        line_ref = extract_line_ref(heading_text) if level == 4 else None
        enclosing = last_h2 if last_h2 is not None else last_h1

        if level == 1:
            parent_index = None
        elif level == 2:
            parent_index = last_h1
        elif level == 4:
            if line_ref is not None or is_part_heading:
                parent_index = enclosing
            else:
                parent_index = current_line_h4 if current_line_h4 is not None else enclosing
        else:  # level == 3: asides always nest under the nearest h4 (or enclosing h2/h1)
            parent_index = last_h4 if last_h4 is not None else enclosing

        text = _text_until_next_heading(h)
        content_hash = hashlib.sha256(f"{heading_text}\n{text}".encode()).hexdigest()

        sections.append(
            ParsedSection(
                heading=heading_text,
                anchor_id=anchor_id,
                level=level,
                irs_line_ref=line_ref,
                parent_index=parent_index,
                order_index=order_index,
                text=text,
                content_hash=content_hash,
            )
        )
        idx = len(sections) - 1

        if level == 1:
            last_h1, last_h2, last_h4, current_line_h4 = idx, None, None, None
        elif level == 2:
            last_h2, last_h4, current_line_h4 = idx, None, None
        elif level == 4:
            last_h4 = idx
            if line_ref is not None or is_part_heading:
                current_line_h4 = idx if not is_part_heading else None

    return sections
