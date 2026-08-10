<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<!-- CSS Styles for form 8933 -->

<xsl:template name="IRS8933Style">
  .styIRS8933LongLNDesc{ /* Line item description */
    width:170mm;height:4mm;
    padding-top:.5mm;
    padding-bottom:.5mm;
    float:left; clear: none;
  }
  .styIRS8933MedLNDesc{ /* Line item description */
    width:139mm;height:4mm;
    padding-top:.5mm;
    padding-bottom:.5mm;
    float:left; clear: none;
  }
  .styIRS8933ShortLNDesc{ /* Line item description */
    width:107mm;height:4mm;
    padding-top:.5mm;
    padding-bottom:.5mm;
    float:left; clear: none;
  }
  .styIRS8933ShortestLNDesc{ /* Line item description */
    width:99mm;height:4mm;
    padding-top:.5mm;
    padding-bottom:.5mm;
    float:left; clear: none;
  }
   .styIRS8933Multiple{ /* MULTIPLICATION */
    width:15mm;height:4mm;
    padding-top:.5mm;
    padding-bottom:.5mm;
    float:left; clear: none;
  }
  
  .styIRS8933FLeftNumBox{ /* digit item number to the left of the page */
	width:5mm;height:4mm;
	padding-top:.5mm;
	padding-bottom:.5mm;
	font-weight:bold;
	float:left; clear:none;
	padding-left:1mm;
      border-style: solid; border-color: black;	
      border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px;	
    }
    .styIRS8933FNumBox{ /* digit item number to the left of the page on computation */
	width:4mm;height:4mm;
	padding-top:.5mm;
	padding-bottom:.5mm;
	font-weight:bold;
	float:left; clear:none;
	padding-left:1mm;
      border-style: solid; border-color: black;	
      border-top-width: 0px; border-bottom-width: 1px; border-left-width: 1px; border-right-width: 1px;	
    }
    .styIRS8933FItemDesc{ /* Line item description on computation */
	width:108mm;
	padding-left:2mm;
	padding-top:.5mm;
	padding-bottom:.5mm;
	
	float:left; clear: none;
      border-style: solid; border-color: black;
      border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px;
    }
    
    .styIRS8933FColumnBox{/*Column Box for storing data/amount on computation*/
	width:30mm;
      padding-top:.1mm;
      padding-bottom:.1mm;
      text-align:right;
      font-weight:normal;
      border-style: solid; border-color: black;
      border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 0px;
      float:left; clear: none;
}
 .styIRS8933FItemDesc{ /* Line item description on computation */
	width:81mm;
	padding-left:2mm;
	padding-top:.5mm;
	padding-bottom:.5mm;
	float:left; clear: none;
      border-style: solid; border-color: black;
      border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px;
    }
     .styIRS8933FRGColumnBox{/*Right Column Box for storing data/amount on computation */
	width:33mm;
      padding-top:.1mm;
      padding-bottom:.1mm;
      text-align:right;
      font-weight:normal;
      border-style: solid; border-color: black;
      border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px;
      float:left; clear: none;
}
  .styIRS8933FYesNoBox{ /* Box for storing Yes/No Values */
      width:10mm;height:4.5mm;
      text-align:center;
      font-weight:normal;
      border-style: solid; border-color: black;
      border-top-width: 0px; border-bottom-width: 1px; border-left-width: 1px; border-right-width: 0px;
      float:left; clear: none;      
    }
    .styIRS8933FLFNoBox{ /* Left Box for storing No Values */
      width:10mm;height:4.5mm;
      text-align:center;
      font-weight:normal;
      border-style: solid; border-color: black;
      border-top-width: 0px; border-bottom-width: 1px; border-left-width: 1px; border-right-width: 1px;
      float:left; clear: none;      
    }  
       
</xsl:template>

</xsl:stylesheet>
