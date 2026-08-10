<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fo="http://www.w3.org/1999/XSL/Format">
<xsl:template name="IRS1120REITStyle">

.sty1120REITDotLn {
  letter-spacing:3.1mm;
  font-weight:bold;
  float:right;
  padding-right:2px;
}

.sty1120REITSLAmt {
  width:27mm;min-height:4mm;
  padding-top:.5mm;
  padding-bottom:.5mm;
  padding-right:.5mm;
  text-align:right;
  border-style: solid; border-color: black;
  border-top-width: 0px; border-bottom-width: 1px; border-left-width: 1px; border-right-width: 0px;
  float:left; clear: none;
}

.sty1120REITSMField {
  width:27mm;
  margin-right:1mm;
  text-align:right;
  border-bottom:1px dashed black;
  float:right;clear:none;
}

.sty1120REITShortDesc { 
  width:71mm;min-height:4mm;
  padding-top:.5mm;
  padding-bottom:.5mm;
  float:left; clear: none;
}

.sty1120REITSchMDesc { 
  width:57.8mm;min-height:4mm;
  padding-top:.5mm;
  padding-bottom:.5mm;
  float:left; clear: none;
}

.sty1120REIT-bg {
  background-color:lightgrey;
}

.sty1120REIT-nbb {
  border-bottom-width:0px;
}

</xsl:template>
</xsl:stylesheet>
