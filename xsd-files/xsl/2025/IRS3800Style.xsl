<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:template name="IRS3800Style">

    .styIRS3800ScheduleName{ /* Used for the Schedule A TitleName*/
      height:4mm;width:23mm;  
      font-size:8pt;
      font-weight:bold;
      text-align:center;
      float:left;clear:none;
    }

	.styIRS3800PartIIITableCellHeader {   /* Table Cell Header */
		width:24mm;
		font-size:7pt;
		font-weight:normal;
		color: black;
		text-align: center;
		vertical-align:middle;
		border-style: solid;
		border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 1px;
	}

	.styIRS3800PartIIITableCell {   /* Table Cell */
		width:24mm;
		color: black;
		text-align: right;
		vertical-align:bottom;
		border-style: solid;
		border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 1px;
	}
	
	.styIRS3800PartIVTableCellHeader {   /* Table Cell Header */
		width:24mm;
		font-size:7pt;
		font-weight:normal;
		color: black;
		text-align: center;
		vertical-align:middle;
		border-style: solid;
		border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px;
	}
	
	.styIRS3800PartIVTableCell {   /* Table Cell */
		width:24mm;
		color: black;
		text-align: right;
		vertical-align:bottom;
		border-style: solid;
		border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px;
	}	
	.styIRS3800PartVTableCellHeader {   /* Table Cell Header */
		width:26mm;
		font-size:7pt;
		font-weight:normal;
		color: black;
		text-align: center;
		vertical-align:top;
		border-style: solid;
		border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 1px;
	}
	
	.styIRS3800PartVTableCell {   /* Table Cell */
		width:26mm;
		color: black;
		text-align: left;
		vertical-align:top;
		border-style: solid;
		border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 1px;
	}

	.styIRS3800PartVTableAmountCell {   /* Table Cell */
		width:26mm;
		color: black;
		text-align: right;
		vertical-align:bottom;
		border-style: solid;
		border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 1px;
	}
	
		.styIRS3800PartVITableCellHeader {   /* Table Cell Header */
		width:24mm;
		font-size:7pt;
		font-weight:normal;
		color: black;
		text-align: center;
		vertical-align:middle;
		border-style: solid;
		border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px;
	}
	
	.styIRS3800PartVITableCell {   /* Table Cell */
		width:24mm;
		color: black;
		text-align: right;
		vertical-align:bottom;
		border-style: solid;
		border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px;
	}	
	
	/* New ids added to adjust style for UWR 980569*/
	
	#styIRS3800new {
		height: 7.5mm; 
		padding-top: 14px;
	}
	
	#styIRS3800II {
		height: 6mm; 
		padding-top: 6px;
	}
	
	
	#PartVISRDTable {
		width: 256mm;
	
	}
	
	.styDepTblCell {
		padding-left: 1px !important;
	}
	
  </xsl:template>
</xsl:stylesheet>
