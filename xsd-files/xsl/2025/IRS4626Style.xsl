<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fo="http://www.w3.org/1999/XSL/Format">
<xsl:template name="IRS4626Style">

.IRS4626_DotSpacing { /* dot line spacing */
  letter-spacing:2mm;
}
.IRS4626_LineContainer {
  clear:both;
  width:187mm;
}

.sty4626DotLn {
  letter-spacing:3.1mm;
  font-weight:bold;
  float:right;
  padding-right:2px;
}

.sty4626AmtBox {
  width:27mm;height:4.2mm;
  padding-top:.5mm;
  padding-bottom:.5mm;
  padding-right:.5mm;
  text-align:right;
  border-style: solid; border-color: black;
  border-top-width: 0px; border-bottom-width: 1px; border-left-width: 1px; border-right-width: 0px;
  float:left; clear: none;
}

.sty4626AmtBoxNBB {
  width:27mm;height:4.2mm;
  padding-top:.5mm;
  padding-bottom:.5mm;
  padding-right:.5mm;
  text-align:right;
  border-style: solid; border-color: black;
  border-top-width: 0px; border-bottom-width: 0px; border-left-width: 1px; border-right-width: 0px;
  float:left; clear: none;
}

.sty4626ShortDesc {
  width:90mm;height:auto;
  padding-top:.5mm;
  padding-bottom:.5mm;
  float:left; clear: none;
}

.sty4626LongDesc {
  width:144mm;height:auto;
  padding-top:.5mm;
  padding-bottom:.5mm;
  float:left; clear: none;
}

.sty4626RightNumBox{ 
  width:7mm;height:4.2mm;
  padding-top:.5mm;
  padding-bottom:.5mm;
  font-weight:bold;
  text-align:center;
  vertical-align:bottom;
  border-style: solid; border-color: black;
  border-top-width: 0px; border-bottom-width: 1px; border-left-width: 1px; border-right-width: 0px;
  float:left; clear: none;
}

</xsl:template>
</xsl:stylesheet>
