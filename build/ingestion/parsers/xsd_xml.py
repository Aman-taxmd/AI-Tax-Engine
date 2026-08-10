"""XSD + XSLT parsing (Phase 2), no LLM.

XSD parsing is adapted from TaxMD-Schema-Automation-New's
`src/parsers/xsd_parser.py` (see plan repo reference manifest): walk
<xsd:element> nodes and read the IRS-namespaced <Description>/<LineNumber>
annotation children directly — MeF schemas already carry this metadata, no
inference needed.

XSLT parsing extracts which XSD elements are actually rendered on the form
and in what order/line grouping, by locating the "line item" container divs.
IRS XSLT stylesheets name these classes `sty<FORM><Suffix>`, e.g. for 8889:
`styIRS8889LineItem` / `styIRS8889LNLeftNumBox` / `styIRS8889LNDesc`. Rather
than hardcoding the form id into class names (as the reference parser's
multi-pattern table did), this version matches by *class-name suffix*
(LineItem / LNLeftNumBox / LNDesc / LNAmountBox), which is robust across any
form's stylesheet without a lookup table.
"""
from __future__ import annotations

import hashlib
import re
from dataclasses import dataclass, field
from pathlib import Path

from lxml import etree

XS_NS = "http://www.w3.org/2001/XMLSchema"
XSL_NS = "http://www.w3.org/1999/XSL/Transform"
IRS_NS = "http://www.irs.gov/efile"

_POPULATE_TEMPLATES = {
    "PopulateAmount": "USAmountType",
    "PopulateText": "StringType",
    "PopulateCheckbox": "BooleanType",
    "PopulateDate": "DateType",
    "PopulateSSN": "SSNType",
    "PopulateEIN": "EINType",
}


@dataclass(frozen=True)
class XsdElement:
    xsd_element: str
    xsd_type: str
    xsd_path: str
    documentation: str
    line_number: str
    min_occurs: int
    max_occurs: str

    @property
    def supports_multiple_instances(self) -> bool:
        return self.max_occurs == "unbounded" or (
            self.max_occurs.isdigit() and int(self.max_occurs) > 1
        )


@dataclass
class XsdFormInventory:
    xsd_file: str
    xsd_form: str
    sha256: str
    elements: list[XsdElement] = field(default_factory=list)


def parse_xsd_file(path: Path) -> XsdFormInventory:
    raw = path.read_bytes()
    sha256 = hashlib.sha256(raw).hexdigest()
    root = etree.fromstring(raw)
    xsd_form = path.stem

    inventory = XsdFormInventory(xsd_file=path.name, xsd_form=xsd_form, sha256=sha256)
    seen: set[str] = set()
    for el in root.iter(f"{{{XS_NS}}}element"):
        name = el.get("name")
        if not name or name in seen:
            continue
        seen.add(name)
        inventory.elements.append(
            XsdElement(
                xsd_element=name,
                xsd_type=el.get("type") or _resolve_inline_type(el),
                xsd_path=_compute_xpath(el),
                documentation=_extract_doc_child(el, "Description"),
                line_number=_extract_doc_child(el, "LineNumber"),
                min_occurs=int(el.get("minOccurs", "1")),
                max_occurs=el.get("maxOccurs", "1"),
            )
        )
    return inventory


def _resolve_inline_type(el: etree._Element) -> str:
    if el.find(f"{{{XS_NS}}}complexType") is not None:
        return "ComplexType"
    simple = el.find(f"{{{XS_NS}}}simpleType")
    if simple is not None:
        restriction = simple.find(f"{{{XS_NS}}}restriction")
        if restriction is not None:
            return restriction.get("base", "xsd:string")
    return "xsd:string"


_LINE_PREFIX_RE = re.compile(r"^line\s+", re.IGNORECASE)


def _extract_doc_child(el: etree._Element, child_name: str) -> str:
    ann = el.find(f"{{{XS_NS}}}annotation")
    if ann is None:
        return ""
    for doc in ann.findall(f"{{{XS_NS}}}documentation"):
        node = doc.find(f"{{{IRS_NS}}}{child_name}")
        if node is not None and node.text:
            text = node.text.strip()
            if child_name == "LineNumber":
                # Confirmed inconsistent across real IRS MeF schemas: e.g.
                # IRS1040ScheduleSE.xsd's <LineNumber> values are literally
                # "Line 1a", "Line 13", etc., while IRS1040.xsd/IRS8889.xsd/
                # IRS1040ScheduleC.xsd use the bare number/letter ("1a", "13").
                # Strip the redundant "Line " prefix so canonical field names
                # stay in the one `form_{form}_line_{N}` convention used
                # everywhere else, and so this matches Section.irs_line_ref
                # (itself derived from bare "Line N." instruction headings by
                # structural_parser.py) for knowledge-packet lookup.
                text = _LINE_PREFIX_RE.sub("", text)
            return text
    return ""


def _compute_xpath(el: etree._Element) -> str:
    parts: list[str] = []
    cur: etree._Element | None = el
    while cur is not None:
        if cur.tag == f"{{{XS_NS}}}element" and cur.get("name"):
            parts.append(str(cur.get("name")))
        cur = cur.getparent()
    parts.reverse()
    return "/".join(parts)


# ---------------------------------------------------------------------------
# XSLT: which elements are actually rendered, and in what line grouping
# ---------------------------------------------------------------------------


@dataclass(frozen=True)
class RenderedLine:
    line_number: str
    label: str
    target_xpaths: list[str]


def parse_xsl_file(path: Path) -> list[RenderedLine]:
    root = etree.parse(str(path)).getroot()
    lines: list[RenderedLine] = []
    for container in root.iter():
        css = container.get("class") or ""
        if not re.search(r"LineItem\b", css):
            continue
        line_num = ""
        label_parts: list[str] = []
        xpaths: list[str] = []
        for node in container.iter():
            node_css = node.get("class") or ""
            if node_css.endswith("LNLeftNumBox") and not line_num:
                line_num = "".join(node.itertext()).strip()
            elif node_css.endswith("LNDesc"):
                text = (node.text or "").strip()
                if text and text not in label_parts:
                    label_parts.append(text)
            if node.tag == f"{{{XSL_NS}}}call-template" and node.get("name") in _POPULATE_TEMPLATES:
                target = _target_node_param(node)
                if target:
                    xpaths.append(_normalize_target(target))
        if line_num or xpaths:
            lines.append(
                RenderedLine(
                    line_number=line_num,
                    label=" ".join(label_parts),
                    target_xpaths=list(dict.fromkeys(xpaths)),
                )
            )
    return lines


def _target_node_param(call_template: etree._Element) -> str:
    for child in call_template:
        if child.tag == f"{{{XSL_NS}}}with-param" and child.get("name") == "TargetNode":
            return child.get("select") or (child.text or "")
    return ""


def _normalize_target(select: str) -> str:
    select = select.strip().lstrip("$")
    return select.split("/")[-1]
