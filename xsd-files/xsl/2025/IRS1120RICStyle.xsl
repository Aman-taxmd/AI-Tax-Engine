<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<!-- CSS Styles for form 1120  -->

<xsl:template name="IRS1120RICStyle">

	.sty1120RICDotLn {
		letter-spacing:3.1mm;
		font-weight:bold;
		float:right;
		padding-right:2px;
	}
	.sty1120RICTitleBox{ 
		width:27mm;height:7.5mm;
		padding-top:.5mm;
		text-align:center;
		border-style: solid; border-color: black;
		border-top-width: 0px; border-bottom-width: 1px; border-left-width: 1px; border-right-width: 0px;
		float:left; clear: none;
	}
	.styIRS1120RICYesNoBox{ 
		width:6mm;height:4mm;
		padding-top:.5mm;
		padding-bottom:.5mm;
		text-align:center;
		font-weight:bold;
		border-style: solid; border-color: black;
		border-top-width: 0px; border-bottom-width: 1px; border-left-width: 1px; border-right-width: 0px;
		float:left; clear: none;
    }
    .styIRS1120RICSmallShadingBox{ 
        width:6mm;height:4mm;
        padding-top:.5mm;
        padding-bottom:.5mm;
        text-align:center;
        font-weight:bold;
        border-style: solid; border-color: black;
        border-top-width: 0px; border-bottom-width: 0px; border-left-width: 1px; border-right-width: 0px;
        float:right; clear: none;
        background-color:lightgrey;
    }
    .styIRS1120RICLNAmountBox{ 
		width:27mm;height:4mm;
		padding-top:.5mm;
		padding-bottom:.5mm;
		text-align:right;
		border-style: solid; border-color: black;
		border-top-width: 0px; border-bottom-width: 1px; border-left-width: 1px; border-right-width: 0px;
		float:left; clear: none;
	}
    .styIRS1120VTImageBox{ 
      width:5mm;
      border-style: solid; border-color: black;
      border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px;
      float:left;clear:none;
    }
    
</xsl:template>

</xsl:stylesheet>