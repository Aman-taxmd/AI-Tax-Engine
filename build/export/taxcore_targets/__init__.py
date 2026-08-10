"""Per-form TaxCore import target trees.

Each form that has been renamed onto TaxCore domain paths gets a FormSpec
describing the two-tree model (canonical_data vs calculation_results),
promotion mappings, metadata overrides, and import retirement notes.

Add a new module + register it in SPECS when the next form is ready —
do not invent parallel export shapes per form.
"""
from __future__ import annotations

from build.export.taxcore_targets.form_8889 import SPEC_8889
from build.export.taxcore_targets.form_1040 import SPEC_1040
from build.export.taxcore_targets.form_1040s1 import SPEC_1040S1
from build.export.taxcore_targets.form_1040s1a import SPEC_1040S1A
from build.export.taxcore_targets.form_1040s2 import SPEC_1040S2
from build.export.taxcore_targets.form_1040sc import SPEC_1040SC
from build.export.taxcore_targets.form_1040sse import SPEC_1040SSE
from build.export.taxcore_targets.form_w2 import SPEC_W2
from build.export.taxcore_targets.spec import FormSpec

SPECS: dict[str, FormSpec] = {
    SPEC_8889.form: SPEC_8889,
    SPEC_1040.form: SPEC_1040,
    SPEC_1040S1.form: SPEC_1040S1,
    SPEC_1040S1A.form: SPEC_1040S1A,
    SPEC_1040S2.form: SPEC_1040S2,
    SPEC_1040SC.form: SPEC_1040SC,
    SPEC_1040SSE.form: SPEC_1040SSE,
    SPEC_W2.form: SPEC_W2,
}


def get_form_spec(form: str) -> FormSpec | None:
    return SPECS.get(form)
