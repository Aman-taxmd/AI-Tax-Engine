<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

  <xsl:template name="IRS7217Style">

  .sty7217DotLn {
    letter-spacing:3.1mm;
    font-weight:bold;
    float:right;
    padding-right:2px;
  }
 
  .sty7217ShadingBox{ 
	width:17mm;
	background-color:lightgrey;
	height:5mm;
	padding-top:.5mm;
	padding-bottom:.5mm;
	text-align:right;
	border-style: solid; border-color: black;
	border-top-width: 0px; border-bottom-width: 1px; border-left-width: 1px; border-right-width: 0px;
	float:left; clear: none;
  } 
  
  .styIRS7217TableCellHeader { 
        height:20mm;
        padding-top:12px;
        border-style:solid;
        border-color:black;
        border-width:0px 1px 1px 0px;
        vertical-align:top;
        clear:none;
        text-align:center;
        font-weight:normal;
    }
    
    .styIRS7217LNLeftNumBoxSD{ /* Single digit item number to the left of the page */
			width:8mm;height:4mm;
			padding-top:4mm;
			padding-bottom:.5mm;
			font-weight:bold;
			float:left; clear:none;
			padding-left:2.5mm;
	}
	
	.sty7217AmountLine {
		text-align: right;
		float:right;
		width:29mm;
		border-style:solid;
		border-color:black;
		border-width:0px 0px 1px 0px;
	}
	
  </xsl:template>

</xsl:stylesheet>