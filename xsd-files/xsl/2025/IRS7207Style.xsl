<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:template name="IRS7207Style">
	.sty7207EmptyLonLatBox {
		border: 1px solid black;
		width:5mm;
		height:5mm;
	}
	
	.sty7207DotLn {
		letter-spacing:3.1mm;
		font-weight:bold;
		float:right;
		padding-right:2px;
	}
  
  .sty7207LNRightDescBox{ /* Box for storing line item amounts. */
		width:32mm;
		height:15mm;
		padding-top:.5mm;
		padding-bottom:.5mm;
		padding-right:2mm;
		padding-left:2mm;
		height:17mm;
		text-align:center;
		border-style: solid; 
		border-color: black;
		border-top-width: 0px; border-bottom-width: 0px; border-left-width: 1px; border-right-width: 0px;
		float:right; clear: none;
	}

	</xsl:template>
</xsl:stylesheet>
