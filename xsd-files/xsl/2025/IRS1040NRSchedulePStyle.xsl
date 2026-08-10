<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:template name="IRS1040NRSchedulePStyle">
  .styIRS1040NRSchPTableCellHeader {   
		height:15mm;
        border-style:solid;
        border-color:black;
        border-width:0px 1px 1px 0px;
        vertical-align:middle;
        clear:none;
        text-align:center;
  }
    
   .styIRS1040NRSchPTableCellHeaderSmall { 
        height:4mm;
        border-style:solid;
        border-color:black;
        border-width:0px 0px 0px 1px;
        clear:none;
        text-align:center;
    }
    
  .sty1040NRSchPDotLn {
    letter-spacing:3.1mm;
    font-weight:bold;
    float:right;
    padding-right:2px;
  }

   .sty1040NRSchPDesc {
    width:127mm;height:4mm;
	padding-top:.5mm;
	padding-bottom:.5mm;
	float:left; clear: none;
  }
  
  .sty1040NRSchPAmtBox {
	width:30mm;
	padding:0.5mm;
	text-align:right;
	border-style: solid; border-color: black;
	border-top-width: 0px; border-bottom-width: 1px; border-left-width: 1px; border-right-width: 0px;
	float:left; clear: none;
  }

</xsl:template>

</xsl:stylesheet>