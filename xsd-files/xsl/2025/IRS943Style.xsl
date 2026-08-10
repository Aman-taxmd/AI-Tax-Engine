<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
 
  <xsl:template name="IRS943Style">
  
  .styIRS943MonthlyGrp{
	  width:62mm;
	  height:29mm;
	  float:left;
	}
	
  .styIRS943MonthNm{
	  width:31mm;
	  height:4mm;
	  float:left;	  
	}
	
	<!--Added "padding-right:.5mm" - DRB 10/2015-->
	.styIRS943MonthAmt{
	  width:31mm;
	  height:4mm;
	  border-left:1px solid black;
	  border-right: 1px solid black;
	  border-bottom: 1px solid black;
	  float:left;
	  text-align:right;
	  padding-top:.5mm;
	  padding-right:.5mm;
	  font-size:6pt;
	}
	
	.styIRS943MonthlyBGrp{
	  width:62mm;
	  height:29mm;
	  float:left;
	}
	
	.styIRS943MonthBNm{
	  width:31mm;
	  height:4mm;
	  float:left;
	}
	
	<!--Added "padding-right:.5mm" - DRB 10/2015-->
	.styIRS943MonthBAmt{
	  width:31mm;
	  height:4mm;
	  border-left:1px solid black;
	  border-right: 1px solid black;  
	  border-bottom: 1px solid black;
	  float:left;
	  text-align:right;
	  padding-top:.5mm;
	  padding-right:.5mm;
	  font-size:6pt;
	}
	
	<!--Added "padding-right:.5mm" - DRB 10/2015-->
	.styIRS943MonthCAmt{
	  width:31mm;
	  height:4mm;
	  border-left:1px solid black;
	  border-right: 0px solid black;  
	  border-bottom: 1px solid black;
	  float:left;
	  text-align:right;
	  padding-top:.5mm;
	  padding-right:.5mm;
	  font-size:6pt;	 
	}
	
	.styIRS943MonthLetter{
		width:4mm;
		height:4mm;
		float:left;
		font-weight:bold;
		padding-left:1mm;
	}
	
	.styIRS943Month{
		float:left;
		height:4mm;
		width:27mm;
	}
	
	.styIRS943MonthBLetter{
		width:4mm;
		height:4mm;
		float:left;
		font-weight:bold;
		padding-left:1mm;
	}
	
	.styIRS943Bullet{
		float:left;
		padding-right:1mm;
		font-weight:bold;
		}

  .styIRS943RightNumBox{ /* Right number box */
			width:6mm;height:6mm;
			padding-top:1mm;
			font-weight:bold;
			text-align:center;
			vertical-align:bottom;
			float:left; clear: none;
		}

	.styIRS943LNAmountBox{ /* Box for storing line item amounts. */
		width:32mm;height:5mm;
		padding-top:.5mm;
		padding-bottom:.5mm;
		padding-right:.5mm;
		text-align:right;
		background-color:white;
		border-style: solid; border-color: black;
		border-top-width: 1px; border-bottom-width: 1px; border-left-width: 1px; border-right-width: 1px;
		float:left; clear: none;
	}


</xsl:template>
</xsl:stylesheet>
