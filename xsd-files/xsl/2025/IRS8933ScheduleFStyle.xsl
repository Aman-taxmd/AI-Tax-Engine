<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

  <xsl:template name="IRS8933ScheduleFStyle">

  .sty8933SchFDotLn {
    letter-spacing:3.1mm;
    font-weight:bold;
    float:right;
    padding-left:1px;
  }
  
  .sty8933SchFDesc{
		width:150mm;
		font-size:8;
		border-style: solid; border-color: black;
		border-right-width: 1px;border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px;
		height:8mm;
		padding-top:.5mm;
		padding-bottom:.5mm;
		float:left; clear: none;
	}
	.sty8933SchFtableCellHeader { 
        height:12mm;
        font-weight:normal;
        border-style:solid;
        border-color:black;
        border-width:0px 1px 1px 0px;
        vertical-align:top;
        clear:none;
        text-align:center;
    }
  
  </xsl:template>

</xsl:stylesheet>