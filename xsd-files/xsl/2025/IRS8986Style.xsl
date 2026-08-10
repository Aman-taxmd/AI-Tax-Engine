<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:template name="IRS8986Style">
	.sty8986LeftCell { /* Filer Info cell */
		width:98.7mm;
		border-style:solid;
		border-color:black;
		border-width:0px 0px .5px 0px;
		height:auto;
		float:left; clear:none;
		border-right:.5px solid black;
	}
	.sty8986RightCell { 
		width:88.3mm;
		border-style:solid;
		border-color:black;
		border-width:0px 0px .5px 0px;
		height:12mm;
		float:left;clear:none;
    }
	.sty8986DotLn {
		letter-spacing:3.1mm;
		font-weight:bold;
		float:right;
		padding-right:2px;
	}
	.sty8986TextLCell {
		width:55%;
		border-style:solid;
		border-right-width: 0.5px;
		border-width-bottom:0px;
	}
	.sty8986TextRCell {
		width:30mm;height:20mm;
		padding-top:.5mm;
		padding-bottom:.5mm;
		font-weight:bold;
		text-align:center;
		vertical-align:bottom;
		border-style: solid; border-color: black;
		border-top-width: 0px; border-bottom-width: 1px; border-left-width: 1px; border-right-width: 0px;
		float:left; clear: none;
	}
	.sty8986AmountSpan {
		text-align:right;
		width:42mm;
		padding-right:1mm;
		float:right;clear:none;
	}
	.sty8986DescBox {
		width:90mm;height:4mm;
		padding-top:0.5mm;
		padding-bottom:0.5mm;
		padding-right:0.5mm;
		padding-left:0.5mm;
		text-align:left;
		float:left;clear:none;
	}
	</xsl:template>
</xsl:stylesheet>
