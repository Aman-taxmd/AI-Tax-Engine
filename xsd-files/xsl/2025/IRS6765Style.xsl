<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<!-- CSS Styles for form 6765-->

  <xsl:template name="IRS6765Style">
		table {
            border-collapse: collapse;
            width: 187mm; /* Total width of 187mm */
            margin-bottom: 0; /* Remove margin at the bottom of each table */
        }
        th, td {
            padding: 4px;
            text-align: center; /* Center text in table headers and data cells */
            }
            
        .border1pxnoleftborder {
            border-top: 1px solid black;
            border-right: 1px solid black;
            border-bottom: 1px solid black;
            border-left: 0px solid black;
            }
            
        .border4sides {
            border-top: 1px solid black;
            border-right: 1px solid black;
            border-bottom: 1px solid black;
            border-left: 1px solid black;
            }
        
        .border1pxnorightborder {
            border-top: 1px solid black;
            border-right: 0px solid black;
            border-bottom: 1px solid black;
            border-left: 1px solid black;
            }
         
        th {
            background-color: #f2f2f2;
            vertical-align: middle; /* Vertically align content in table headers */
        }
        .bold-number {
            display: block; /* Make sure the bold numbers appear on their own line */
            font-weight: bold;
        }
        .normal-weight {
            font-weight: normal;
        }
        .table1, .table2 {
            width: 187mm;
        }
        .table3 {
			border-style:none;
		}
        .header {
            display: flex;
            justify-content: space-between;
            width: 187mm; /* Ensure header also has a width of 187mm */
        }
        .section-header-wrapper {
            width: 187mm; /* Ensure total width is 187mm */
            border-top: 1px solid black; /* Black border above the section header */
            border-bottom: 1px solid black; /* Black border below the section header */
            font-size: 10px; /* Same font size for both Section G and instruction text */
            word-wrap: break-word; /* Allow text to wrap when it exceeds 187mm */
        }
        .section-header {
            font-weight: bold;
        }
        .page-break {
            page-break-before: always; /* Ensure Table 2 starts on a new page */
        }
        .italic {
            font-style: italic;
        }
        .footer {
            padding-top: 0; /* Remove the top padding of the footer */
            width: 187mm;
            text-align: right; /* Float text to the right */
            margin-top: 0; /* Remove margin above the footer */
        }
        .footer .bold-6765 {
            font-weight: bold; /* Make 6765 bold */
        }
        /* Set 2px border for the bottom row of each table */
        .bottom-row td {
            border-bottom: 2px solid black;
        }
  

    
  </xsl:template>

</xsl:stylesheet>