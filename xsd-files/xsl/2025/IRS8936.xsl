<?xml version="1.0"?>
<!DOCTYPE xsl:stylesheet [<!ENTITY nbsp "&#160;">]>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
<xsl:include href="PopulateTemplate.xsl"/>
<xsl:include href="CommonPathRef.xsl"/>
<xsl:include href="AddHeader.xsl"/>
<xsl:include href="AddOnTable.xsl"/>
<xsl:include href="IRS8936Style.xsl"/>
<xsl:output method="html" indent="yes" encoding="iso-8859-1"/>
<xsl:strip-space elements="*"/>
<xsl:param name="FormData" select="$RtnDoc/IRS8936"/>
<xsl:template match="/">
<xsl:text disable-output-escaping="yes">&lt;!DOCTYPE html&gt;</xsl:text>
		<html>
<head>
				<meta http-equiv="X-UA-Compatible" content="IE=edge"/>  
  <title><xsl:call-template name="FormTitle"><xsl:with-param name="RootElement" select="local-name($FormData)"/></xsl:call-template></title>
  <!--  No Browser Caching  -->
  <meta http-equiv="Pragma" content="no-cache"/>
  <meta http-equiv="Cache-Control" content="no-cache"/>
  <meta http-equiv="Expires" content="0"/>
  <!-- No Proxy Caching-->
  <meta http-equiv="Cache-Control" content="private"/>  
  <meta name="Description" content="Form IRS 8936"/>
  <meta name="GENERATOR" content="IBM WebSphere Studio"/>
   <xsl:call-template name="GlobalStylesForm"/>
  <script language="JavaScript" src="{$ScriptPath}/FormDisplay.js" type="text/javascript"/>
  <xsl:call-template name="InitJS"/>  
  <style type="text/css">
  <!--************************************************************************
     Notes: Part I, line 1 thru 5, Part II, 6 and 7, and Part 3, line 11
                is an unbound repeatable columns.
     ************************************************************************** -->
		<xsl:if test="not($Print) or $Print=''">
		  <xsl:call-template name="IRS8936Style"/>
		  <xsl:call-template name="AddOnStyle"/>  
		</xsl:if>
  </style>      
 </head>
      <body class="styBodyClass" style="width:187mm">
  <form name="Form8936">    
    <xsl:call-template name="DocumentHeader"/>  
 <!--Title of Form -->    
  <div class="styBB" style="width:187mm;height: 22mm">
	<div class="styFNBox" style="width:30mm;height:22mm;border-right-width:1px;">
		<div style="font-size: 8pt;height:16mm">      
		  Form <span class="styFormNumber">8936</span> <br />
			<xsl:call-template name="SetFormLinkInline">
				<xsl:with-param name="TargetNode" select="$FormData"/>
			</xsl:call-template>		  
		    <br /> 
			<br /> 
		<div class="styAgency" style="font-weight:normal;height:7mm;">
		  Department of the Treasury<br/>Internal Revenue Service
		</div>
	</div>
  </div>
	<div class="styFTBox" style="width:127mm;height:22mm;">
      <div class="styMainTitle" style="height: 8mm">Clean Vehicle Credits</div>
      <div class="styFST" style="font-size:7pt;margin-left:3mm;font-weight:bold;">
        <div style="margin-left: 1.5mm;">
			<br/><br/>
            Attach to your tax return.<br/>
            <span style="padding-top:1px;margin-left: 1mm;">
             Go to <i><a href="http://www.irs.gov/Form8936"><i>www.irs.gov/Form8936</i></a></i> for instructions and the latest information.</span>
             </div>
    </div>
  </div>
      <!-- OMB etc; set OMB width to 6 pt since 7pt will increase width to over 187mm-->  
		<div class="styTYBox" style="width:30mm;height:22mm;">
			<div class="styOMB" style="height:auto;">OMB No. 1545-2137</div>
			<div class="styTY" style="height:11mm;">20<span class="styTYColor">25</span>
		</div>
        <div class="stySequence" style="height:11mm;">
          Attachment
			<div>
			  Sequence No. <span class="styBoldText" style="font-size:8pt;">69</span>
			</div>
		</div>
      </div>
  </div>
  <!--  End title of Form  -->
   <!--  Name and Employer identification number  -->
  <div class="styBB" style="width:187mm">
    <div class="styNameBox" style="width:141mm;font-size:7pt;">
      Name(s) shown on return<br/>
  		 <xsl:choose>
			  <!-- Name from 1120/990/1065 Return Header -->
			  <xsl:when test="$RtnHdrData/Filer/BusinessName/BusinessNameLine1Txt">
				<xsl:call-template name="PopulateText">
				  <xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/BusinessName/BusinessNameLine1Txt"/>
				</xsl:call-template>
				<br/>
				<xsl:call-template name="PopulateText">
				  <xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/BusinessName/BusinessNameLine2Txt"/>
				</xsl:call-template>
			  </xsl:when>
			  <!-- Name from 1040 Return Header -->
			  <xsl:when test="$RtnHdrData/Filer/PrimaryNameControlTxt">
				<br/>
				<xsl:call-template name="PopulateText">
				  <xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/NameLine1Txt"/>
				</xsl:call-template>
			  </xsl:when>
			  <!-- Name from 1041 Return Header -->
			  <xsl:when test="$RtnHdrData/Filer/EstateOrTrustName/BusinessNameLine1Txt">
				<xsl:call-template name="PopulateText">
				  <xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/EstateOrTrustName/BusinessNameLine1Txt"/>
				</xsl:call-template>
				<br/>
				<xsl:call-template name="PopulateText">
				  <xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/EstateOrTrustName/BusinessNameLine2Txt"/>
				</xsl:call-template>
				</xsl:when>
				<xsl:when test="$RtnHdrData/Filer/NationalMortgageAssocCd">
				  <xsl:call-template name="PopulateText">
					<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/NationalMortgageAssocCd"/>
				</xsl:call-template>
				<br/>
			  </xsl:when>
		</xsl:choose>
    </div>
    <div class="styEINBox" style="width:46mm;padding-left:2mm; font-size:7pt;">
	<div class="BoldText" style="width:46mm;height:3mm;">Identifying number</div>
		<div style="text-align:left;font-weight:normal; ">
		  <br/>
			<xsl:choose>
				<xsl:when test="$RtnHdrData/Filer/EIN">
					<xsl:call-template name="PopulateReturnHeaderFiler">
						<xsl:with-param name="TargetNode">EIN</xsl:with-param>
					</xsl:call-template>
				</xsl:when>
				<xsl:otherwise>
					<xsl:call-template name="PopulateReturnHeaderFiler">
						<xsl:with-param name="TargetNode">PrimarySSN</xsl:with-param>
					</xsl:call-template>
				</xsl:otherwise>
			</xsl:choose>
		</div>    
    </div>
  </div>  
  <!--  End Name and Employer indentification number  -->
   <!--  Note Line -->
  <div class="styTBB" style="width: 187mm;">
	<b>Notes:</b>
		<span style="width:3mm;"/>&#8226; Complete a separate Schedule A (Form 8936) for each clean vehicle placed in service during the tax year.<br/>
		<span style="width:12mm;"/>&#8226; Individuals who transferred the credit to the dealer at the time of sale must file this form and Schedule A (Form 8936).
  </div>
  <!--  End Note Line -->
	<!--  Part I header -->
	<div class="styBB" style="width:187mm;">
		<div class="styPartName" style="height:4mm;">Part I</div>
		<div class="styPartDesc">Modified Adjusted Gross Income (MAGI) Amount</div>
	</div>
	<!-- Part 1 Line 1a -->
	<div class="styStdDiv" style="height:7mm;font-size:6.9pt;">
		<div class="styLNLeftNumBoxSD">1a</div>
		<div class="styLNDesc" style="width:99mm;">
			Enter the amount from line 11a of your 2025 Form 1040, 1040-SR, or 1040-NR.
			<span style="float:left;">Estates and trusts, Form 1041, see instructions</span>
			<span class="sty8936DotLn">.........</span>
		</div>
		<div class="styLNRightNumBox" style="height:7mm;padding-top:3.5mm;">1a</div>
		<div class="styLNAmountBox" style="height:7mm;padding-top:3.5mm;padding-right:0.5mm;">
			<xsl:call-template name="PopulateAmount">
				<xsl:with-param name="TargetNode" select="$FormData/CurrentYrMAGIAmountGrp/AdjustedGrossIncomeAmt"/>
			</xsl:call-template>
		</div>
		<div class="styLNRightNumBoxNBB" style="height:7mm;background-color:lightgrey;">&nbsp;</div>
		<div class="styLNAmountBoxNBB" style="height:7mm;">&nbsp;</div>
	</div>
	<!-- Part 1 Line 1b -->
	<div class="styStdDiv">
		<div class="styLNLeftNumBoxSD" style="padding-left:4.2mm;">b</div>
		<div class="styLNDesc" style="width:99mm;">
			Enter any income from Puerto Rico you excluded
			<span class="sty8936DotLn">.........</span>
		</div>
		<div class="styLNRightNumBox">1b</div>
		<div class="styLNAmountBox" style="padding-right:0.5mm;">
			<xsl:call-template name="PopulateAmount">
				<xsl:with-param name="TargetNode" select="$FormData/CurrentYrMAGIAmountGrp/ExcldSect933PuertoRicoIncmAmt"/>
			</xsl:call-template>
		</div>
		<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;">&nbsp;</div>
		<div class="styLNAmountBoxNBB">&nbsp;</div>
	</div>
	<!-- Part 1 Line 1c -->
	<div class="styStdDiv">
		<div class="styLNLeftNumBoxSD" style="padding-left:4.2mm;">c</div>
		<div class="styLNDesc" style="width:99mm;">
			Enter any amount from Form 2555, line 45
			<span class="sty8936DotLn">...........</span>
		</div>
		<div class="styLNRightNumBox">1c</div>
		<div class="styLNAmountBox" style="padding-right:0.5mm;">
			<xsl:call-template name="PopulateAmount">
				<xsl:with-param name="TargetNode" select="$FormData/CurrentYrMAGIAmountGrp/TotalIncomeExclusionAmt"/>
			</xsl:call-template>
		</div>
		<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;">&nbsp;</div>
		<div class="styLNAmountBoxNBB">&nbsp;</div>
	</div>
	<!-- Part 1 Line 1d -->
	<div class="styStdDiv">
		<div class="styLNLeftNumBoxSD" style="padding-left:4.2mm;">d</div>
		<div class="styLNDesc" style="width:99mm;">
			Enter any amount from Form 2555, line 50
			<span class="sty8936DotLn">...........</span>
		</div>
		<div class="styLNRightNumBox">1d</div>
		<div class="styLNAmountBox" style="padding-right:0.5mm;">
			<xsl:call-template name="PopulateAmount">
				<xsl:with-param name="TargetNode" select="$FormData/CurrentYrMAGIAmountGrp/HousingDeductionAmt"/>
			</xsl:call-template>
		</div>
		<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;">&nbsp;</div>
		<div class="styLNAmountBoxNBB">&nbsp;</div>
	</div>
	<!-- Part 1 Line 1e -->
	<div class="styStdDiv">
		<div class="styLNLeftNumBoxSD" style="padding-left:4.2mm;">e</div>
		<div class="styLNDesc" style="width:99mm;">
			Enter any amount from Form 4563, line 15
			<span class="sty8936DotLn">...........</span>
		</div>
		<div class="styLNRightNumBox">1e</div>
		<div class="styLNAmountBox" style="padding-right:0.5mm;">
			<xsl:call-template name="PopulateAmount">
				<xsl:with-param name="TargetNode" select="$FormData/CurrentYrMAGIAmountGrp/GrossIncomeExclusionAmt"/>
			</xsl:call-template>
		</div>
		<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;">&nbsp;</div>
		<div class="styLNAmountBoxNBB">&nbsp;</div>
	</div>
	<!-- Part 1 Line 2 -->
	<div class="styStdDiv">
		<div class="styLNLeftNumBoxSD">2</div>
		<div class="styLNDesc" style="width:139mm;">
			Add lines 1a through 1e
			<span class="sty8936DotLn">...........................</span>
		</div>
		<div class="styLNRightNumBox">2</div>
		<div class="styLNAmountBox" style="padding-right:0.5mm;">
			<xsl:call-template name="PopulateAmount">
				<xsl:with-param name="TargetNode" select="$FormData/CurrentYrMAGIAmountGrp/NetIncomeAmt"/>
			</xsl:call-template>
		</div>
	</div>
	<!-- Part 1 Line 3a -->
	<div class="styStdDiv" style="height:7mm;">
		<div class="styLNLeftNumBoxSD" >3a</div>
		<div class="styLNDesc" style="width:99mm;">
			Enter the amount from line 11 of your 2024 Form 1040, 1040-SR, or 1040-NR.
			<span style="float:left;">Estates and trusts, Form 1041, see instructions</span>
			<span class="sty8936DotLn">.........</span>
		</div>
		<div class="styLNRightNumBox" style="height:7mm;padding-top:3.5mm;">3a</div>
		<div class="styLNAmountBox" style="height:7mm;padding-top:3.5mm;padding-right:0.5mm;">
			<xsl:call-template name="PopulateAmount">
				<xsl:with-param name="TargetNode" select="$FormData/PriorYrMAGIAmountGrp/AdjustedGrossIncomeAmt"/>
			</xsl:call-template>
		</div>
		<div class="styLNRightNumBoxNBB" style="height:7mm;background-color:lightgrey;">&nbsp;</div>
		<div class="styLNAmountBoxNBB" style="height:7mm;">&nbsp;</div>
	</div>
	<!-- Part 1 Line 3b -->
	<div class="styStdDiv">
		<div class="styLNLeftNumBoxSD" style="padding-left:4.2mm;">b</div>
		<div class="styLNDesc" style="width:99mm;">
			Enter any income from Puerto Rico you excluded
			<span class="sty8936DotLn">.........</span>
		</div>
		<div class="styLNRightNumBox">3b</div>
		<div class="styLNAmountBox" style="padding-right:0.5mm;">
			<xsl:call-template name="PopulateAmount">
				<xsl:with-param name="TargetNode" select="$FormData/PriorYrMAGIAmountGrp/ExcldSect933PuertoRicoIncmAmt"/>
			</xsl:call-template>
		</div>
		<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;">&nbsp;</div>
		<div class="styLNAmountBoxNBB">&nbsp;</div>
	</div>
	<!-- Part 1 Line 3c -->
	<div class="styStdDiv">
		<div class="styLNLeftNumBoxSD" style="padding-left:4.2mm;">c</div>
		<div class="styLNDesc" style="width:99mm;">
			Enter any amount from Form 2555, line 45
			<span class="sty8936DotLn">...........</span>
		</div>
		<div class="styLNRightNumBox">3c</div>
		<div class="styLNAmountBox" style="padding-right:0.5mm;">
			<xsl:call-template name="PopulateAmount">
				<xsl:with-param name="TargetNode" select="$FormData/PriorYrMAGIAmountGrp/TotalIncomeExclusionAmt"/>
			</xsl:call-template>
		</div>
		<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;">&nbsp;</div>
		<div class="styLNAmountBoxNBB">&nbsp;</div>
	</div>
	<!-- Part 1 Line 3d -->
	<div class="styStdDiv">
		<div class="styLNLeftNumBoxSD" style="padding-left:4.2mm;">d</div>
		<div class="styLNDesc" style="width:99mm;">
			Enter any amount from Form 2555, line 50
			<span class="sty8936DotLn">...........</span>
		</div>
		<div class="styLNRightNumBox">3d</div>
		<div class="styLNAmountBox" style="padding-right:0.5mm;">
			<xsl:call-template name="PopulateAmount">
				<xsl:with-param name="TargetNode" select="$FormData/PriorYrMAGIAmountGrp/HousingDeductionAmt"/>
			</xsl:call-template>
		</div>
		<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;">&nbsp;</div>
		<div class="styLNAmountBoxNBB">&nbsp;</div>
	</div>
	<!-- Part 1 Line 3e -->
	<div class="styStdDiv">
		<div class="styLNLeftNumBoxSD" style="padding-left:4.2mm;">e</div>
		<div class="styLNDesc" style="width:99mm;">
			Enter any amount from Form 4563, line 15
			<span class="sty8936DotLn">...........</span>
		</div>
		<div class="styLNRightNumBox">3e</div>
		<div class="styLNAmountBox" style="padding-right:0.5mm;">
			<xsl:call-template name="PopulateAmount">
				<xsl:with-param name="TargetNode" select="$FormData/PriorYrMAGIAmountGrp/GrossIncomeExclusionAmt"/>
			</xsl:call-template>
		</div>
		<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;">&nbsp;</div>
		<div class="styLNAmountBoxNBB">&nbsp;</div>
	</div>
	<!-- Part 1 Line 4 -->
	<div class="styStdDiv">
		<div class="styLNLeftNumBoxSD">4</div>
		<div class="styLNDesc" style="width:139mm;">
			Add lines 3a through 3e
			<span class="sty8936DotLn">...........................</span>
		</div>
		<div class="styLNRightNumBox">4</div>
		<div class="styLNAmountBox" style="padding-right:0.5mm;">
			<xsl:call-template name="PopulateAmount">
				<xsl:with-param name="TargetNode" select="$FormData/PriorYrMAGIAmountGrp/NetIncomeAmt"/>
			</xsl:call-template>
		</div>
	</div>
	<!-- Part 1 Line 5 -->
	<div class="styStdDiv">
		<div class="styLNLeftNumBoxSD">5</div>
		<div class="styLNDesc" style="width:139mm;">
			Enter your 2024 filing status (S, MFS, etc., see chart below)
			<span class="sty8936DotLn">...............</span>
		</div>
		<div class="styLNRightNumBox">5</div>
		<div class="styLNAmountBox" style="padding-right:0.5mm;">
			<xsl:call-template name="PopulateText">
				<xsl:with-param name="TargetNode" select="$FormData/PYIndivReturnFilingStatusCd"/>
			</xsl:call-template>
		</div>
	</div>
	<!-- Part 1 Filing Status Table -->
	<div class="styStdDiv" style="height:7mm;">
		<div class="styLNLeftNumBoxSD"></div>
		<div class="styLNDesc" style="width:139mm;">
			Individuals, estates, or trusts exceeding the following MAGI limits for both 2024 and 2025 can’t claim the applicable credit.
		</div>
		<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;height:7mm;">&nbsp;</div>
		<div class="styLNAmountBoxNBB" style="height:7mm;">&nbsp;</div>		
	</div>	
	<div class="styTBB" style="width:187mm;height:auto;">
		<span style="width:147mm;float:left;">
	<table class="styTable" style="border-collapse:collapse;font-size:7pt;width:139mm;">
		<thead class="styTableThead">
			<tr>
				<th class="styTableCellHeader" scope="col" style="width:8mm;border-right:0;border-bottom:0;">&nbsp;</th>	
				<th class="styTableCellHeader" scope="col" style="width:67mm;border-right:1;border-bottom:1;border-top:1px solid black;">
					Filing Status
				</th>
				<th class="styTableCellHeader" scope="col" style="width:35mm;border-right:1;border-bottom:1;border-top:1px solid black;">
					Part II/III Limits
				</th>
				<th class="styTableCellHeader" scope="col" style="width:35mm;border-right:0;border-bottom:1;border-top:1px solid black;">
					Part IV Limits
				</th>
			</tr>
		</thead>
		<tbody>
			<tr style="vertical-align:bottom;">
				<td class="styTableCellCtrInherit" style="border-right:0;border-bottom:0;">&nbsp;</td>
				<td class="styTableCellCtrInherit" style="border-right:1;border-bottom:1;text-align:left;">
					Single (S)
				</td>
				<td class="styTableCellCtrInherit" style="border-right:1;border-bottom:1;">
					$150,000
				</td>
				<td class="styTableCellCtrInherit" style="border-right:0;border-bottom:1;">
					$75,000
				</td>
			</tr>
			<tr style="vertical-align:bottom;">
				<td class="styTableCellCtrInherit" style="border-right:0;border-bottom:0;">&nbsp;</td>
				<td class="styTableCellCtrInherit" style="border-right:1;border-bottom:1;text-align:left;">
					Married filing separately (MFS)
				</td>
				<td class="styTableCellCtrInherit" style="border-right:1;border-bottom:1;">
					$150,000
				</td>
				<td class="styTableCellCtrInherit" style="border-right:0;border-bottom:1;">
					$75,000
				</td>
			</tr>
			<tr style="vertical-align:bottom;">
				<td class="styTableCellCtrInherit" style="border-right:0;border-bottom:0;">&nbsp;</td>
				<td class="styTableCellCtrInherit" style="border-right:1;border-bottom:1;text-align:left;">
					Head of household (HOH)
				</td>
				<td class="styTableCellCtrInherit" style="border-right:1;border-bottom:1;">
					$225,000
				</td>
				<td class="styTableCellCtrInherit" style="border-right:0;border-bottom:1;">
					$112,500
				</td>
			</tr>
			<tr style="vertical-align:bottom;">
				<td class="styTableCellCtrInherit" style="border-right:0;border-bottom:0;">&nbsp;</td>
				<td class="styTableCellCtrInherit" style="border-right:1;border-bottom:1;text-align:left;">
					Married filing jointly (MFJ)
				</td>
				<td class="styTableCellCtrInherit" style="border-right:1;border-bottom:1;">
					$300,000
				</td>
				<td class="styTableCellCtrInherit" style="border-right:0;border-bottom:1;">
					$150,000
				</td>
			</tr>
			<tr style="vertical-align:bottom;">
				<td class="styTableCellCtrInherit" style="border-right:0;border-bottom:0;">&nbsp;</td>
				<td class="styTableCellCtrInherit" style="border-right:1;border-bottom:1;text-align:left;">
					Qualifying surviving spouse (QSS)
				</td>
				<td class="styTableCellCtrInherit" style="border-right:1;border-bottom:1;">
					$300,000
				</td>
				<td class="styTableCellCtrInherit" style="border-right:0;border-bottom:1;">
					$150,000
				</td>
			</tr>
			<tr style="vertical-align:bottom;">
				<td class="styTableCellCtrInherit" style="border-right:0;border-bottom:0;">&nbsp;</td>
				<td class="styTableCellCtrInherit" style="border-right:1;border-bottom:0;text-align:left;">
					Estates and trusts
				</td>
				<td class="styTableCellCtrInherit" style="border-right:1;border-bottom:0;">
					$150,000
				</td>
				<td class="styTableCellCtrInherit" style="border-right:0;border-bottom:0;">
					N/A
				</td>
			</tr>
		</tbody>
	</table>
	</span>
		<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;height:26mm;">&nbsp;</div>
		<div class="styLNAmountBoxNBB" style="height:26mm;">&nbsp;</div>	
	</div>
	<!--  End Part I -->
	<!--  Part II header -->
	<div class="styBB" style="width:187mm;">
		<div class="styPartName" style="height:4mm;">Part II</div>
		<div class="styPartDesc">Credit for Business/Investment Use Part of New Clean Vehicles</div>
	</div>
    <!--<div class="styBB" style="width:187mm;">  
	    <div style="float:left;padding-left:17mm;">
			<span class="styBoldText">Note:</span>		              
               Individuals can't claim a credit on line 6 if Part I, line 5, is more than $150,000 ($300,000 if married filing jointly or a
		</div>
	    <div style="float:left;padding-left:17mm;"> 
               qualifying surviving spouse; $225,000 if head of household).            
        </div>
	</div>-->
	<!-- Part 2 Line 6 -->  
	<div class="styStdDiv">  
		<div class="styLNLeftNumBoxSD">6</div>
		<div class="styLNDesc" style="width:139mm;">
			Enter the total credit amount figured in Part II of Schedule(s) A (Form 8936)
			<span class="sty8936DotLn">..........</span>
		</div>
		<div class="styLNRightNumBox">6</div>
		<div class="styLNAmountBox" style="padding-right:0.5mm;">
			<xsl:call-template name="PopulateAmount">
				<xsl:with-param name="TargetNode" select="$FormData/BusinessInvestmentUseAmt"/>
			</xsl:call-template>
		</div>          
	</div>
	<!-- Part 2 Line 7 -->
	<div class="styStdDiv">   
		<div class="styLNLeftNumBoxSD">7</div>
		<div class="styLNDesc" style="width:139mm;">
			New clean vehicle credit from partnerships and S corporations (see instructions)  
			<span class="sty8936DotLn">.........</span>    
		</div>    
		<div class="styLNRightNumBox">7</div>
		<div class="styLNAmountBox" style="padding-right:0.5mm;">
			<xsl:call-template name="PopulateAmount">
				<xsl:with-param name="TargetNode" select="$FormData/NewCleanVehCrPrtshpSCorpAmt"/>
			</xsl:call-template>
		</div>          
	</div>  
	<!-- Part 2 Line 8 -->
	<div class="styTBB" style="width:187mm;height:7mm;">
		<div class="styLNLeftNumBoxSD">8</div>
		<div class="styLNDesc" style="width:139mm;">
		  <b>Business/investment use part of credit. </b>Add lines 6 and 7. Partnerships and S corporations, stop here<span style="float:left;"> and report this amount on Schedule K. All others, report this amount on Form 3800, Part III, line 1y</span>       
			<span class="sty8936DotLn">...</span>    
		</div>    
		<div class="styLNRightNumBox" style="border-bottom-width:0;height:7mm;padding-top:3.5mm;">8</div>
		<div class="styLNAmountBox" style="border-bottom-width:0;padding-right:0.5mm;height:7mm;padding-top:3.5mm;">
			<xsl:call-template name="PopulateAmount">
				<xsl:with-param name="TargetNode" select="$FormData/BusinessInvstUsePartOfCrAmt"/>
			</xsl:call-template>
		</div>          
	</div>  
	<!--  End Part II -->
	<!--  Part III header -->
	<div class="styBB" style="width:187mm;">
		<div class="styPartName" style="height:4mm;">Part III</div>
		<div class="styPartDesc">Credit for Personal Use Part of New Clean Vehicles</div>
	</div>
    <!--<div class="styBB" style="width:187mm;">  
	    <div style="float:left;padding-left:17mm;">
			<span class="styBoldText">Note:</span>		              
               You can't claim the Part III credit if Part I, line 5, is more than $150,000 ($300,000 if married filing jointly or a 
		</div>
	    <div style="float:left;padding-left:17mm;"> 
           qualifying surviving spouse; $225,000 if head of household).            
        </div>
	</div>-->
	<!-- Part 3 Line 9 -->  
	<div class="styStdDiv">  
		<div class="styLNLeftNumBoxSD">9</div>
		<div class="styLNDesc" style="width:139mm;">
			Enter the total credit amount figured in Part III of Schedule(s) A (Form 8936)
			<span class="sty8936DotLn">..........</span>
		</div>
		<div class="styLNRightNumBox">9</div>
		<div class="styLNAmountBox" style="padding-right:0.5mm;">
			<xsl:call-template name="PopulateAmount">
				<xsl:with-param name="TargetNode" select="$FormData/CrPrsnlUsePartNewCleanVehGrp/PrsnlUseNewCleanVehicleCrAmt"/>
			</xsl:call-template>
		</div>          
	</div>
	<!-- Part 3 Line 10 -->
	<div class="styStdDiv">   
		<div class="styLNLeftNumBoxSD">10</div>
		<div class="styLNDesc" style="width:139mm;">
			Enter the amount from Form 1040, 1040-SR, or 1040-NR, line 18  
			<span class="sty8936DotLn">..............</span>    
		</div>    
		<div class="styLNRightNumBox">10</div>
		<div class="styLNAmountBox" style="padding-right:0.5mm;">
			<xsl:call-template name="PopulateAmount">
				<xsl:with-param name="TargetNode" select="$FormData/CrPrsnlUsePartNewCleanVehGrp/TotalTaxBeforeCrAndOthTaxesAmt"/>
			</xsl:call-template>
		</div>          
	</div>  
	<!-- Part 3 Line 11 -->
	<div class="styStdDiv">   
		<div class="styLNLeftNumBoxSD">11</div>
		<div class="styLNDesc" style="width:139mm;">
			Personal credits from Form 1040, 1040-SR, or 1040-NR (see instructions)  
			<span class="sty8936DotLn">...........</span>    
		</div>    
		<div class="styLNRightNumBox">11</div>
		<div class="styLNAmountBox" style="padding-right:0.5mm;">
			<xsl:call-template name="PopulateAmount">
				<xsl:with-param name="TargetNode" select="$FormData/CrPrsnlUsePartNewCleanVehGrp/PersonalTaxCreditsAmt"/>
			</xsl:call-template>
		</div>          
	</div>
 	<!-- Part 3 Line 12 -->
	<div class="styStdDiv" style="height:7mm;">   
		<div class="styLNLeftNumBoxSD">12</div>
		<div class="styLNDesc" style="width:139mm;">
			Subtract line 11 from line 10. If zero or less, enter -0- and stop here. You can't claim
the personal use part of the credit 
			<span class="sty8936DotLn">...............................</span>    
		</div>    
		<div class="styLNRightNumBox" style="height:7mm;padding-top:3.5mm;">12</div>
		<div class="styLNAmountBox" style="height:7mm;padding-right:0.5mm;padding-top:3.5mm;">
			<xsl:call-template name="PopulateAmount">
				<xsl:with-param name="TargetNode" select="$FormData/CrPrsnlUsePartNewCleanVehGrp/AdjustedPersonalTaxCreditsAmt"/>
			</xsl:call-template>
		</div>          
	</div>
  	<!-- Part 3 Line 13 -->
	<div class="styTBB" style="width:187mm;height:7mm;">  
		<div class="styLNLeftNumBoxSD">13</div>
		<div class="styLNDesc" style="width:139mm;">
			<b>Personal use part of credit. </b>Enter the <b>smaller</b> of line 9 or line 12 here and on
Schedule 3 (Form 1040), <span style="float:left;">line 6f. If line 12 is smaller than line 9, see instructions</span> 
			<span class="sty8936DotLn">.................</span>    
		</div>    
		<div class="styLNRightNumBox" style="height:7mm;padding-top:3.5mm;border-bottom-width:0;">13</div>
		<div class="styLNAmountBox" style="height:7mm;padding-right:0.5mm;padding-top:3.5mm;border-bottom-width:0;">
			<xsl:call-template name="PopulateAmount">
				<xsl:with-param name="TargetNode" select="$FormData/CrPrsnlUsePartNewCleanVehGrp/CleanVehPrsnlUsePartCrAmt"/>
			</xsl:call-template>
		</div>          
	</div>
 	<!--  End Part III -->
	<!--  Part IV header -->
	<div class="styBB" style="width:187mm;">
		<div class="styPartName" style="height:4mm;">Part IV</div>
		<div class="styPartDesc">Credit for Previously Owned Clean Vehicles</div>
	</div>
    <!--<div class="styBB" style="width:187mm;">  
	    <div style="float:left;padding-left:17mm;">
			<span class="styBoldText">Note:</span>		              
               You can’t claim the Part IV credit if Part I, line 5, is more than $75,000 ($150,000 if married filing jointly or a
		</div>
	    <div style="float:left;padding-left:17mm;"> 
           qualifying surviving spouse; $112,500 if head of household).            
        </div>
	</div>-->
 	<!-- Part 4 Line 14 -->  
	<div class="styStdDiv">  
		<div class="styLNLeftNumBoxSD">14</div>
		<div class="styLNDesc" style="width:139mm;">
			Enter the total credit amount figured in Part IV of Schedule(s) A (Form 8936)
			<span class="sty8936DotLn">..........</span>
		</div>
		<div class="styLNRightNumBox">14</div>
		<div class="styLNAmountBox" style="padding-right:0.5mm;">
			<xsl:call-template name="PopulateAmount">
				<xsl:with-param name="TargetNode" select="$FormData/CrPreviouslyOwnedCleanVehGrp/PrevOwnedCleanVehCreditAmt"/>
			</xsl:call-template>
		</div>          
	</div>
	<!-- Part 4 Line 15 -->
	<div class="styStdDiv">   
		<div class="styLNLeftNumBoxSD">15</div>
		<div class="styLNDesc" style="width:139mm;">
			Enter the amount from Form 1040, 1040-SR, or 1040-NR, line 18  
			<span class="sty8936DotLn">..............</span>    
		</div>    
		<div class="styLNRightNumBox">15</div>
		<div class="styLNAmountBox" style="padding-right:0.5mm;">
			<xsl:call-template name="PopulateAmount">
				<xsl:with-param name="TargetNode" select="$FormData/CrPreviouslyOwnedCleanVehGrp/TotalTaxBeforeCrAndOthTaxesAmt"/>
			</xsl:call-template>
		</div>          
	</div>  
	<!-- Part 4 Line 16 -->
	<div class="styStdDiv">   
		<div class="styLNLeftNumBoxSD">16</div>
		<div class="styLNDesc" style="width:139mm;">
			Personal credits from Form 1040, 1040-SR, or 1040-NR (see instructions)  
			<span class="sty8936DotLn">...........</span>    
		</div>    
		<div class="styLNRightNumBox">16</div>
		<div class="styLNAmountBox" style="padding-right:0.5mm;">
			<xsl:call-template name="PopulateAmount">
				<xsl:with-param name="TargetNode" select="$FormData/CrPreviouslyOwnedCleanVehGrp/PersonalTaxCreditsAmt"/>
			</xsl:call-template>
		</div>          
	</div>
 	<!-- Part 4 Line 17 -->
	<div class="styStdDiv">   
		<div class="styLNLeftNumBoxSD">17</div>
		<div class="styLNDesc" style="width:139mm;">
			Subtract line 16 from line 15. If zero or less, enter -0- and stop here. You can’t claim the Part IV credit 
			<span class="sty8936DotLn">..</span>    
		</div>    
		<div class="styLNRightNumBox" >17</div>
		<div class="styLNAmountBox" style="padding-right:0.5mm;">
			<xsl:call-template name="PopulateAmount">
				<xsl:with-param name="TargetNode" select="$FormData/CrPreviouslyOwnedCleanVehGrp/AdjustedPersonalTaxCreditsAmt"/>
			</xsl:call-template>
		</div>          
	</div>
  	<!-- Part 4 Line 18 -->
	<div class="styTBB" style="width:187mm;height:7mm;">  
		<div class="styLNLeftNumBoxSD">18</div>
		<div class="styLNDesc" style="width:139mm;">
			Enter the <b>smaller</b> of line 14 or line 17 here and on Schedule 3 (Form 1040), line 6m. If line 17 is smaller
<span style="float:left;">than line 14, see instructions</span> 
			<span class="sty8936DotLn">.........................</span>    
		</div>    
		<div class="styLNRightNumBox" style="height:7mm;padding-top:3.5mm;border-bottom-width:0;">18</div>
		<div class="styLNAmountBox" style="height:7mm;padding-right:0.5mm;padding-top:3.5mm;border-bottom-width:0;">
			<xsl:call-template name="PopulateAmount">
				<xsl:with-param name="TargetNode" select="$FormData/CrPreviouslyOwnedCleanVehGrp/MaxPrevOwnedCleanVehCrAmt"/>
			</xsl:call-template>
		</div>          
	</div>
 	<!--  End Part IV -->
 	<!--  Part V header -->
	<div class="styBB" style="width: 187mm;">
		<div class="styPartName" style="height:4mm;">Part V</div>
		<div class="styPartDesc">Credit for Qualified Commercial Clean Vehicles</div>
	</div>
	<!-- Part 5 Line 19 -->
	<div class="styStdDiv">   
		<div class="styLNLeftNumBoxSD">19</div>
		<div class="styLNDesc" style="width:139mm;">
			Enter the total credit amount figured in Part V of Schedule(s) A (Form 8936)  
			<span class="sty8936DotLn">..........</span>    
		</div>    
		<div class="styLNRightNumBox">19</div>
		<div class="styLNAmountBox" style="padding-right:0.5mm;">
			<xsl:call-template name="PopulateAmount">
				<xsl:with-param name="TargetNode" select="$FormData/QlfyCmrclCleanVehicleCrAmt"/>
			</xsl:call-template>
		</div>          
	</div>
 	<!-- Part 5 Line 20 -->
	<div class="styStdDiv">   
		<div class="styLNLeftNumBoxSD">20</div>
		<div class="styLNDesc" style="width:139mm;">
			Qualified commercial clean vehicle credit from partnerships and S corporations (see instructions)
			<span class="sty8936DotLn">....</span>    
		</div>    
		<div class="styLNRightNumBox" >20</div>
		<div class="styLNAmountBox" style="padding-right:0.5mm;">
			<xsl:call-template name="PopulateAmount">
				<xsl:with-param name="TargetNode" select="$FormData/CmrclCleanVehCrPrtshpSCorpAmt"/>
			</xsl:call-template>
		</div>          
	</div>
  	<!-- Part 5 Line 21 -->
	<div class="styTBB" style="width:187mm;height:7mm;">  
		<div class="styLNLeftNumBoxSD">21</div>
		<div class="styLNDesc" style="width:139mm;">
			Add lines 19 and 20. Partnerships and S corporations, stop here and report this amount on Schedule
			<span style="float:left;">K. All others, report this amount on Form 3800, Part III, line 1aa</span> 
			<span class="sty8936DotLn">..............</span>    
		</div>    
		<div class="styLNRightNumBox" style="height:7mm;padding-top:3.5mm;border-bottom-width:0;">21</div>
		<div class="styLNAmountBox" style="height:7mm;padding-right:0.5mm;padding-top:3.5mm;border-bottom-width:0;">
			<xsl:call-template name="PopulateAmount">
				<xsl:with-param name="TargetNode" select="$FormData/TotalQlfyCmrclCleanVehCrAmt"/>
			</xsl:call-template>
		</div>          
	</div>
 	<!--  End Part V -->
   	<div style="width:187mm;border-top-width:1px;clear:all;">
		<span class="styBoldText">For Paperwork Reduction Act Notice, see separate instructions. </span>
		<span style="width:79px;"/>                      
          Cat. No. 37751E
        <span style="width:117px;"/>  
          Form <span class="styBoldText">8936</span> (2025)
    </div>
        <p style="page-break-before:always"/>
	<!-- END Page Break and Footer-->
	<!-- BEGIN Left Over Table -->  
	<!-- Additonal Data Title Bar and Button -->
    <div class="styLeftOverTitleLine" id="LeftoverData">
        <div class="styLeftOverTitle">
            Additional Data        
        </div>
        <div class="styLeftOverButtonContainer">
            <input class="styLeftoverTableBtn" TabIndex="1" type="button" value="Return to Form" onclick="javascript:returnToWriteInImage();"/>
        </div>      
    </div>
    <!-- Additional Data Table -->
    <table class="styLeftOverTbl">
        <xsl:call-template name="PopulateCommonLeftover">
            <xsl:with-param name="TargetNode" select="$FormData"/>
            <xsl:with-param name="DescWidth" select="100"/>
        </xsl:call-template>          
    </table>
    <!-- END Left Over Table -->     
    </form>  
</body>
</html>
</xsl:template>    
</xsl:stylesheet>