<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fo="http://www.w3.org/1999/XSL/Format">
<xsl:template name="IRS4547Style">

.sty4547DotLn {
  letter-spacing:3.1mm;
  font-weight:bold;
  font-family:Verdana;
  float:right;
  padding-right:2px;
}

.sty4547LongDesc {
  width:149mm;height:auto;
  padding-top:.5mm;
  padding-bottom:.5mm;
  float:left; clear: none;
}

.sty4547ShortDesc {
  width:53mm;height:auto;
  font-family:Arial;
  padding-top:.5mm;
  padding-bottom:.5mm;
  float:left; clear: none;
}

.sty4547TxtBox {
  width:63mm;min-height:4mm;
  font-family:Arial;
  padding-top:.5mm;
  padding-bottom:.5mm;
  padding-left: 2px;
  text-align:left;
  border-style: solid; border-color: black;
  border-top-width: 0px; border-bottom-width: 1px; border-left-width: 1px; border-right-width: 0px;
  float:none; clear: none;
}
.sty4547TxtCtrBox {
  width:63mm;min-height:4mm;
  font-family:Arial;
  padding-top:.5mm;
  padding-bottom:.5mm;
  padding-left: 2px;
  text-align:center;
  border-style: solid; border-color: black;
  border-top-width: 0px; border-bottom-width: 1px; border-left-width: 1px; border-right-width: 0px;
  float:none; clear: none;
}
.sty4547AmtBoxEx {
  width:44.75mm;min-height:4.2mm;
  padding-top:.5mm;
  padding-bottom:1px;
  padding-right: 2px;
  text-align:right;
  border-style: solid; border-color: black;
  border-top-width: 0px; border-bottom-width: 1px; border-left-width: 1px; border-right-width: 0px;
  float:left; clear: none;
}
.sty4547TextBoxEx {
  width:44.75mm;min-height:4.2mm;
  padding-top:.5mm;
  padding-bottom:1px;
  padding-left: 2px;
  text-align:left;
  border-style: solid; border-color: black;
  border-top-width: 0px; border-bottom-width: 1px; border-left-width: 1px; border-right-width: 0px;
  float:left; clear: none;
}
.sty4547TextCenterBoxEx {
  width:44.75mm;min-height:4.2mm;
  padding-top:.5mm;
  padding-bottom:1px;
  text-align:center;
  border-style: solid; border-color: black;
  border-top-width: 0px; border-bottom-width: 1px; border-left-width: 1px; border-right-width: 0px;
  float:left; clear: none;
}
</xsl:template>
</xsl:stylesheet>
