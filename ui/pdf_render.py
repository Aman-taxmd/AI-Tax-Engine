"""Fills and renders the ACTUAL fillable IRS PDF with computed values, for
the "realistic form view" on ui/pages/2_Answer_Questions.py — see
docs/adr/0008. This is presentation-only: it reads already-computed values
(runtime/engine.py's output) and PdfFieldMapping rows (a build-time LLM
artifact — build/synthesis/pdf_field_mapper.py); it never computes anything
itself and never writes to the database.

Uses PyMuPDF (fitz) to set each mapped AcroForm widget's value and render
each page to a PNG for inline display, plus returns the filled PDF's raw
bytes for a "Download filled PDF" button.
"""
from __future__ import annotations

from dataclasses import dataclass

RENDER_DPI = 150


@dataclass
class RenderedPdf:
    page_images: list[bytes]  # one PNG per page, in page order
    pdf_bytes: bytes
    mapped_count: int
    total_in_scope: int


def _format_value(value) -> str:
    if value is None:
        return ""
    if isinstance(value, bool):
        return "X" if value else ""
    if isinstance(value, (int, float)):
        return f"{value:,.2f}"
    return str(value)


def render_filled_pdf(
    pdf_path: str,
    field_mappings: dict[str, list["object"]],
    computed_values: dict[str, "object"],
    only_pages: set[int] | None = None,
) -> RenderedPdf | None:
    """`field_mappings`: canonical_field_name -> list of PdfFieldMapping (from
    ui.data_access.get_pdf_field_mappings; usually 1 entry, but a
    checkbox-choice group like Form 8889 Line 1 or Form 1040's filing-status
    boxes has one entry per widget in the group). `computed_values`:
    canonical_field_name -> runtime.engine.ComputedValue (from
    ui.data_access.compute_return) -- or, for a multi-instance form like
    Form W-2 (see render_filled_w2_pdf below), a hand-built dict of
    lightweight per-instance ComputedValue-like objects, since there is no
    single "the" taxpayer answer for a genuinely repeating form.

    `only_pages`: if given, both widget-filling and page-image rendering are
    restricted to these 0-indexed page numbers -- e.g. Form W-2's real
    fw2.pdf bundles 6 copies (A, 1, B, C, 2, D) on 11 pages, of which only
    Copy B (page index 3) is the one "To Be Filed With Employee's FEDERAL
    Tax Return" and therefore the only one worth showing/filling here (see
    build/consolidation/w2_pdf_bridge.py).

    Returns None if the PDF can't be opened (e.g. not yet discovered) or has
    no field mappings at all — callers should fall back to the existing
    line-by-line view in that case, never error the whole page out."""
    import fitz  # PyMuPDF — imported lazily so pages that don't render a PDF never need it

    if not field_mappings:
        return None
    try:
        doc = fitz.open(pdf_path)
    except Exception:
        return None

    mapped_count = 0
    try:
        # IMPORTANT: `page` objects must stay referenced for as long as their
        # widgets are used. `for page in doc: ...` reassigns `page` each
        # iteration, so once the loop moves past a page, that Page wrapper
        # can be garbage-collected and every Widget captured from it becomes
        # invalid ("Annot is not bound to a page") on the next `.update()` --
        # this silently dropped every field except those on whichever page
        # happened to still be referenced afterwards. Keeping `pages` alive
        # for the whole function call fixes it.
        all_pages = list(doc)
        pages = [p for p in all_pages if only_pages is None or p.number in only_pages]

        widgets_by_code: dict[str, tuple[int, "fitz.Widget"]] = {}
        for page in pages:
            for widget in page.widgets() or []:
                widgets_by_code[widget.field_name] = (page.number, widget)

        for field_name, mappings in field_mappings.items():
            cv = computed_values.get(field_name)
            if cv is None or cv.value is None:
                continue
            field_mapped = False
            for mapping in mappings:
                entry = widgets_by_code.get(mapping.pdf_field_code)
                if entry is None:
                    continue  # a stale/hand-typed mapping that doesn't match this PDF's actual fields
                page_number, widget = entry
                try:
                    # Decided per-widget from the PDF's own real AcroForm field
                    # type -- NOT from row count or "is checkbox_match_value
                    # set" -- because one canonical field can have multiple
                    # mapping rows for two structurally different reasons that
                    # must be filled differently: (a) a genuine mutually-
                    # exclusive checkbox choice (e.g. Form 8889 Line 1's self-
                    # only/family boxes, Form 1040's 5 filing-status boxes) --
                    # real CheckBox widgets, one checked per group -- vs. (b) a
                    # plain amount that the real IRS PDF simply prints TWICE
                    # (e.g. Form 1040 Line 11a's AGI redisplayed as "Line 11b"
                    # on page 2 -- both are ordinary Text widgets that should
                    # each just get the same formatted dollar string, not a
                    # boolean). Trusting the widget's own field_type_string
                    # handles both correctly without needing to know which
                    # case a given field is from the mapping rows alone.
                    if widget.field_type_string == "CheckBox":
                        widget.field_value = str(cv.value) == mapping.checkbox_match_value
                    else:
                        widget.field_value = _format_value(cv.value)
                    widget.update()
                    field_mapped = True
                except Exception:
                    continue  # never let one bad widget value break the whole render
            if field_mapped:
                mapped_count += 1  # once per canonical field, not per widget, to match total_in_scope's units

        page_images = []
        for page in pages:
            pixmap = page.get_pixmap(dpi=RENDER_DPI)
            page_images.append(pixmap.tobytes("png"))

        pdf_bytes = doc.tobytes()
    finally:
        doc.close()

    return RenderedPdf(
        page_images=page_images,
        pdf_bytes=pdf_bytes,
        mapped_count=mapped_count,
        total_in_scope=len(field_mappings),
    )


def _find_copy_b_page(pdf_path: str) -> int | None:
    """Locates fw2.pdf's "Copy B—To Be Filed With Employee's FEDERAL Tax
    Return" page by its own printed text rather than a hardcoded page index
    -- the real fw2.pdf bundles 6 copies (A, 1, B, C, 2, D) across 11 pages,
    and which page number Copy B happens to land on is an IRS layout detail
    that could shift in a future year's revision (see
    build/consolidation/w2_pdf_bridge.py's module docstring).

    Matches the copy's own descriptor line ("Copy B\u2014To Be Filed..."),
    NOT a bare "Copy B" substring -- Copy A's own page separately mentions
    "Copy B" in passing ("...for distribution to your employees...Copy
    B...") while explaining the whole 6-copy bundle, which a bare substring
    match would incorrectly match first."""
    import fitz

    try:
        doc = fitz.open(pdf_path)
    except Exception:
        return None
    try:
        for page in doc:
            if "Copy B" in page.get_text() and "To Be Filed" in page.get_text():
                return page.number
    finally:
        doc.close()
    return None


def render_filled_w2_pdf(
    pdf_path: str, field_mappings: dict[str, list["object"]], w2_row: dict[str, "object"]
) -> RenderedPdf | None:
    """Renders ONE taxpayer-entered W-2 row (a dict of canonical_field_name
    -> plain value, e.g. {"intake_w2_box1_wages": 65000.0, ...} -- see
    ui/pages/2_Answer_Questions.py's "+ Add W-2" widget) onto fw2.pdf's real
    Copy B page only. Form W-2 is this pilot's one genuinely multi-instance
    form (a taxpayer can have more than one employer) so there is no single
    "the" computed return to render the way the other 3 forms' single-
    instance `render_filled_pdf` calls do -- callers loop this once per row
    instead, one filled Copy B per employer.

    Builds lightweight local objects (not runtime.engine.ComputedValue --
    this is pure UI-layer presentation of raw taxpayer input, never anything
    that went through the runtime engine/DAG) that only need a `.value`
    attribute, which is all `render_filled_pdf` actually reads."""
    from dataclasses import dataclass as _dataclass

    @_dataclass
    class _RowValue:
        value: object

    copy_b_page = _find_copy_b_page(pdf_path)
    if copy_b_page is None:
        return None

    computed_values = {name: _RowValue(value=value) for name, value in w2_row.items()}
    return render_filled_pdf(pdf_path, field_mappings, computed_values, only_pages={copy_b_page})
