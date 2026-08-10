<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fo="http://www.w3.org/1999/XSL/Format">
<xsl:template name="IRS1120HStyle">

.sty1120HDotLn {
  letter-spacing:3.1mm;
  font-weight:bold;
  float:right;
  padding-right:2px;
}

.styIRS1120VTImageBox{ /* Vertical image holder box */
  width:5mm;
  border-style: solid; border-color: black;
  border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px;
  float:left;clear:none;
}

/* Images styles for headers*/
.adjust-width {
	width: 35px;
}

#tax-payment {
	width: 15px;
}
</xsl:template>
</xsl:stylesheet>
