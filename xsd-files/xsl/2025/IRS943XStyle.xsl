<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fo="http://www.w3.org/1999/XSL/Format">
<xsl:template name="IRS943XStyle">
	
	.sty943XHeaderBox{ /* Column header text */
		width:27mm;height:auto;
		margin-left:1mm; margin-right:1mm; margin-top:1px;
		font-size:6pt; font-weight:bold; font-style:italic;
		text-align:left;
		float:left; clear: none;
	}
	
	.sty943XAmountBox{ /* Box for storing line item amounts. */
		width:27mm;height:5.0mm;
		margin-left:1mm; margin-right:1mm; margin-top:1mm;
		font-size:6pt;
		padding:.5mm;padding-top:0.8mm;
		text-align:right;
		border-style: solid; border-color: black; border-width:1px;
		float:left; clear: none;
	}
	
	.sty943XDesc{
		width:40mm;height:auto;
		font-family:Arial;
		padding-top:.5mm;
		padding-bottom:.5mm;
		float:left; clear: none;
	}
	
	.sty943XSmallDesc{
		width:15mm;height:auto;
		font-family:Arial;
		margin-left:1mm;margin-right:1mm;
		padding-top:.5mm;
		padding-bottom:.5mm;
		float:left; clear: none;
	}
	
	.sty943XDotLn {
		letter-spacing:3.1mm;
		font-weight:bold;
		float:right;
		padding-right:2px;
	}

</xsl:template>
</xsl:stylesheet>
