<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:template name="IRS4255Style">

    .styIRS4255TableCellSmallRB{ /* Table cell with  no top Bottom  borders */
      width: 25mm;
      color: black;
      text-align: right;
      border-style: solid;
      border-top-width: 0px; border-bottom-width: 1px; border-left-width: 1px; border-right-width: 1px;
    }
    .styIRS4255TableCellSmallTB{ /* Table cell with only Top side borders */
      color: black;
      border-style: solid;
      border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px;
    }
    .styIRS4255TableCellSmallBB{ /* Table cell with only Bottom side borders */
      color: black;
      border-style: solid;
      border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 0px;
    }
    .styIRS4255TableContainerNBB {   /* Scrollable Table Container with no bottom border*/
    	border-style: solid; border-color: black;
    	border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px;
    	width: 187mm; height:4.5mm;
    	float:none;clear:both;
    	overflow-y: none;
    }

	.styIRS4255TableICellHeader {   /* Table Cell Header */
		width:25mm;
		font-size:7pt;
		font-weight:normal;
		color: black;
		text-align: center;
		vertical-align:middle;
		border-style: solid;
		border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 1px;
	}

	.styIRS4255Table1Cell {   /* Table Cell */
		width:25mm;
		color: black;
		text-align: right;
		vertical-align:bottom;
		border-style: solid;
		border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 1px;
	}
	
	.styIRS4255PartIVTableCellHeader {   /* Table Cell Header */
		width:24mm;
		font-size:7pt;
		font-weight:normal;
		color: black;
		text-align: center;
		vertical-align:middle;
		border-style: solid;
		border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px;
	}
	
	.styIRS4255PartIVTableCell {   /* Table Cell */
		width:24mm;
		color: black;
		text-align: right;
		vertical-align:bottom;
		border-style: solid;
		border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px;
	}	
	.styIRS4255PartVTableCellHeader {   /* Table Cell Header */
		width:26mm;
		font-size:7pt;
		font-weight:normal;
		color: black;
		text-align: center;
		vertical-align:middle;
		border-style: solid;
		border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 1px;
	}
	
	.styIRS4255PartVTableCell {   /* Table Cell */
		width:26mm;
		color: black;
		text-align: left;
		vertical-align:top;
		border-style: solid;
		border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 1px;
	}

	.styIRS4255PartVTableAmountCell {   /* Table Cell */
		width:26mm;
		color: black;
		text-align: right;
		vertical-align:bottom;
		border-style: solid;
		border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 1px;
	}
	
		.styIRS4255PartVITableCellHeader {   /* Table Cell Header */
		width:24mm;
		font-size:7pt;
		font-weight:normal;
		color: black;
		text-align: center;
		vertical-align:middle;
		border-style: solid;
		border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px;
	}
	
	.styIRS4255PartVITableCell {   /* Table Cell */
		width:24mm;
		color: black;
		text-align: right;
		vertical-align:bottom;
		border-style: solid;
		border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px;
	}	
	



<!-- ////////// BEGIN TABLE STYLE CODE (Added 241009 Greg Young. Changes written by James Garced ////////// -->     
body {
   font-family: Arial, sans-serif;
   font-size:9.5px;
}


.border-none {
  border-collapse: collapse;
  border: none;
  font-size:9.5px;
}

.border-none th {
  border: 1px solid black;
}

.border-none tr th:first-child {
  border-left: none;
} 

.border-none tr th:last-child {
  border-right: none;
} 
    
.border-none td {
  border: 1px solid black;
}

.no-right-border td:first-child {
  border-right: none;
}

.no-left-border td {
  border-left-width: 0px;
}

.border-none tr td:first-child {
  border-right: none;
}

.border-none tr:first-child td {
  border-top: 1px solid black;
}

.border-none tr:last-child td {
  border-bottom: 1px solid black;
}

.border-none tr td:first-child {
  border-left: none;
}

.border-none tr td:last-child {
  border-right: none;
}
.center-text {
  text-align: center;
  vertical-align: top;
  width: 0px;
        }
.grayed-out {
  background-color: #f0f0f0;
 }
<!-- //////////////////////////////////////////// END TABLE STYLE CODE //////////////////////////////////////////////////// -->
    
    </xsl:template>
</xsl:stylesheet>
