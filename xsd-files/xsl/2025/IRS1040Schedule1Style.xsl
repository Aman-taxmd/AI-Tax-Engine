<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

  <xsl:template name="IRS1040Schedule1Style">
  
  .sty1040Sch1DotLn {
    letter-spacing:3.1mm;
    font-weight:bold;
    float:right;
    padding-right:2px;
  }
  
    .styStdDivNoScroll { /* generic line-width div. No Scrollbars appear if an element is overflowing. */
	width:187mm;
	display:block;
	float:none;clear:both;
	overflow:hidden;
}
  
  .sty1040Sch1AmountBox{ /* Box for storing line item amounts. */
    position: absolute;
    white-space: nowrap;
    overflow: hidden;
    overflow-x: hidden;
    overflow-y: hidden;
	width:32mm;height:4mm;
	padding-top:.5mm;
	padding-bottom:.5mm;
	text-align:right;
	border-style: solid; border-color: black;
	border-top-width: 0px; border-bottom-width: 1px; border-left-width: 1px; border-right-width: 0px;
	float:left; clear: none;
	}
	
	.sty1040Sch1LNRightNumBoxNBB{ /* Right number box with no bottom border*/
	position: absolute;
	white-space: nowrap;
    overflow: hidden;
    overflow-x: hidden;
    overflow-y: hidden;
	width:8mm;height:4mm;
	padding-top:.5mm;
	padding-bottom:.5mm;
	font-weight:bold;
	text-align:center;
	vertical-align:bottom;
	border-style: solid; border-color: black;
	border-top-width: 0px; border-bottom-width: 0px; border-left-width: 1px; border-right-width: 0px;
	float:left; clear: none;
	}
	
	.sty1040Sch1LNAmountBoxNBB{ /* Amount Box with no bottom border */
	position: absolute;
	white-space: nowrap;
    overflow: hidden;
    overflow-x: hidden;
    overflow-y: hidden;
	width:32mm;height:4mm;
	padding-top:.5mm;
	padding-bottom:.5mm;
	text-align:right;
	border-style: solid; border-color: black;
	border-top-width: 0px; border-bottom-width: 0px; border-left-width: 1px; border-right-width: 0px;
	float:left; clear: none;
	}
	
	.sty1040Sch1LNRightNumBox{ /* Right number box */
	width:8mm;height:4mm;
	padding-top:.5mm;
	padding-bottom:.5mm;
	font-weight:bold;
	text-align:center;
	vertical-align:bottom;
	border-style: solid; border-color: black;
	border-top-width: 0px; border-bottom-width: 0px; border-left-width: 1px; border-right-width: 0px;
	float:left; clear: none;
	}
 
  </xsl:template>

</xsl:stylesheet>