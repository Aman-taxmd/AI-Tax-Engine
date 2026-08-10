<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

  <xsl:template name="IRS8911ScheduleAStyle">

  .sty8911ScheduleADotLn {
    letter-spacing:3.1mm;
    font-weight:bold;
    float:right;
    padding-right:2px;
  }
  
  .sty8911ScheduleARightField{
    border-bottom:1px solid black;
    vertical-align:top;
  }
  
  .sty8911ScheduleARightBox{ /* Right box for 7mm lines */
	  width: 50mm;
	  margin-top:0.5mm;
	  margin-bottom:0.5mm;
    border: 1px solid black;
    text-align: center;
  }
  
  </xsl:template>

</xsl:stylesheet>