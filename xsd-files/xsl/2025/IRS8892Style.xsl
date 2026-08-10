<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fo="http://www.w3.org/1999/XSL/Format">
<xsl:template name="IRS8892Style">

.sty8892DotLn {
  letter-spacing:3.1mm;
  font-weight:bold;
  padding-left:2px;
  padding-right:2px;
}

.sty8892HeaderNum {
  font-weight:bold;
  width:6mm; height:10mm; float:left;
  padding-left:2.5mm;
}

.sty8892LongDesc {
  width:162mm;height:auto;
  padding-top:.5mm;
  padding-bottom:.5mm;
  float:left; clear: none;
}

.sty8892TablePad {
  padding-left:2.5mm;
}

</xsl:template>
</xsl:stylesheet>
