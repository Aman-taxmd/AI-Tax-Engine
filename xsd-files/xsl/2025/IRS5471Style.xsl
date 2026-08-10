<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<!-- CSS Styles for form 5471 -->

<xsl:template name="IRS5471Style">

  .styIRS5471Img {
    border-style: solid;
    border-color: black;
    border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px;  border-right-width: 1px;
    float: left; clear: none;
  }

  .styIRS5471TableContainer {   /* Scrollable Table Container */
    width: 187mm; height: 21mm;
    float: none; clear:none;
    overflow-y: auto;
  }
  .avoid {
    page-break-inside: avoid !important;
    margin: 4px 4px 4px 4px;  /* to keep the page break from cutting too close to the text in the div */
  }  
  
  .styIRS5471TableLastCol {   /* Last Table Column */
    width: 15px;
    color: white;
    text-align: right;
    border-style: solid;
    border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 0px;
    display: none;
  }
  
  .styIRS5471YesNoBox{ /* Box for storing Yes/No Values */
      width:6mm;height:4.5mm;
      text-align:center;
      font-weight:normal;
      border-style: solid; border-color: black;
      border-top-width: 0px; border-bottom-width: 1px; border-left-width: 1px; border-right-width: 0px;
      float:left; 
      clear: none;      
    }
    .styIRS5471LFNoBox{ /* Left Box for storing No Values */
      width:6mm;height:4.5mm;
      text-align:center;
      font-weight:normal;
      border-style: solid; border-color: black;
      border-top-width: 0px; border-bottom-width: 1px; border-left-width: 1px; border-right-width: 1px;
      float:left; 
      clear: none;      
    }  
   	.styIRS5471YesNoBoxShadingCell {   /* Shading with a left border */
		width:6mm;
		height:4.5mm;
		background-color:lightgrey;
		border-style: solid; border-color: black;
		border-top-width: 0px; border-bottom-width: 1px; border-left-width: 1px; border-right-width: 0px;
		float: left; 
		clear: none;
	}
	.styIRS5471LFNoBoxShading {   /* Left Box for Shading with a left border and a right border*/
		width:6mm;
		height:4.5mm;
		background-color:lightgrey;
		border-style: solid; border-color: black;
		border-top-width: 0px; border-bottom-width: 1px; border-left-width: 1px; border-right-width: 1px;
		float: left; 
		clear: none;
	}  
    .styIRS547FYesNoBoxRB{ /* Box for storing Yes/No Values with a right border */
      width:5.9mm;height:3.5mm;
      text-align:center;
      font-weight:normal;
      border-style: solid; border-color: black;
      border-top-width: 0px; border-bottom-width: 1px; border-left-width: 1px; border-right-width: 0px;
      float:left; clear: none;
    }
    .styIRS5471LNYesNoBox{ /* Box for storing Yes/No Values */
      width:6mm;height:4.5mm;
      padding-top:.5mm;
      padding-bottom:.5mm;
      text-align:center;
      font-weight:normal;
      border-style: solid; border-color: black;
      border-top-width: 0px; border-bottom-width: 1px; border-left-width: 1px; border-right-width: 0px;
      float:left; clear: none;
    }
    .styIRS5471LNYesNoBoxRB{ /* Box for storing Yes/No Values with a right border */
      width:6mm;height:4.5mm;
      padding-top:.5mm;
      padding-bottom:.5mm;
      text-align:center;
      font-weight:normal;
      border-style: solid; border-color: black;
      border-top-width: 0px; border-bottom-width: 1px; border-left-width: 1px; border-right-width: 1px;
      float:left; clear: none;
    }
</xsl:template>

</xsl:stylesheet>