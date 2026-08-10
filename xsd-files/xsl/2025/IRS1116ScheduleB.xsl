<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE xsl:stylesheet [
  <!ENTITY nbsp "&#160;">
]>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:include href="PopulateTemplate.xsl" />
	<xsl:include href="AddHeader.xsl" />
	<xsl:include href="CommonPathRef.xsl" />
	<xsl:include href="AddOnTable.xsl" />
	<xsl:include href="IRS1116ScheduleBStyle.xsl" />
	<xsl:output method="html" indent="yes" />
	<xsl:strip-space elements="*" />
	<xsl:param name="FormData" select="$RtnDoc/IRS1116ScheduleB" />
	<xsl:template match="/">
		<xsl:text disable-output-escaping="yes">&lt;!DOCTYPE html&gt;</xsl:text>
		<html lang="EN-US">
			<head>
				<meta http-equiv="X-UA-Compatible" content="IE=edge" />
				<META http-equiv="Content-Type" content="text/html"/>
				<title>
					<xsl:call-template name="FormTitle">
						<xsl:with-param name="RootElement" select="local-name($FormData)" />
					</xsl:call-template>
				</title>
				<!-- No Browser Caching -->
				<meta http-equiv="Pragma" content="no-cache" />
				<meta http-equiv="Cache-Control" content="no-cache" />
				<meta http-equiv="Expires" content="0" />
				<!-- No Proxy Caching -->
				<meta http-equiv="Cache-Control" content="private" />
				<!-- Define Character Set -->
				<meta http-equiv="Content-Type" content="text/html; charset=ISO-1116ScheduleB-1" />
				<meta name="Description" content="IRS Form 1116 Schedule B" />
				<script language="JavaScript" src="{$ScriptPath}/FormDisplay.js" type="text/javascript" />
				<xsl:call-template name="InitJS" />
				<style type="text/css">
					<xsl:if test="not($Print) or $Print=''">
						<xsl:call-template name="IRS1116ScheduleBStyle" />
						<xsl:call-template name="AddOnStyle" />
					</xsl:if>
				</style>
				<xsl:call-template name="GlobalStylesForm" />
			</head>
			<body class="styBodyClass" style="width:256mm;">
				<form id="Form1116ScheduleB">
					<xsl:call-template name="DocumentHeaderLandscape" />
					<!-- Page 1 -->
					<!-- Header -->
					<div class="styTBB" style="width:256mm;height:23mm;">
						<div class="styFNBox" style="width:30mm;height:23mm;">
							<div style="height:auto;">
								<span class="styFMT" style="font-size:9pt;">SCHEDULE B</span> 
								<span class="styFMT" style="font-size:8pt;">(Form 1116)</span>
							</div>
							<br />
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$FormData" />
							</xsl:call-template>
							<br />
							<span class="styAgency">
								(December 2022) 
							</span>
							<br />
							<br />
							<span class="styAgency">
								Department of the Treasury <br />
								Internal Revenue Service
							</span>
							<br />
						</div>
						<div class="styFTBox" style="width:178mm;height:23mm;">
							<span class="styFMT" style="font-size:11pt;padding-top:2mm;padding-bottom:1mm;">
								Foreign Tax Carryover Reconciliation Schedule
							</span>
							<br />
							For calendar year
							<span style="width:10mm">
								<xsl:call-template name="PopulateReturnHeaderTaxYear"/>
							</span>
							, or tax year beginning
							<span style="width:20mm">
									<xsl:call-template name="PopulateReturnHeaderTaxPeriodBeginDate"/>
							</span>
							, and ending 
							<span style="width:20mm;">
									<xsl:call-template name="PopulateReturnHeaderTaxPeriodEndDate"/>
							</span>.
							<br />
							<span style="font-weight:bold;"> 
								See separate instructions.
							</span>
							<br />
							<span style="font-weight:bold;">
								Attach to Form 1116.
							</span>
							<br/>
							<span style="font-weight:bold;"> 
								Go to <i>www.irs.gov/Form1116</i> for instructions and the latest information.
							</span>
						</div>
						<div class="styTYBox" style="width:35mm;height:23mm;">
							<div class="styOMB" style="padding-top:8mm;height:auto;font-size:6pt;border-bottom-width:0px;">OMB No. 1545-0121</div>
						</div>
					</div>
					<!-- Filer information section -->
					<div class="styStdDiv" style="border-bottom:1px solid black;width:256mm;">
						<div class="styNameBox" style="width:208.5mm;height:8mm;">
							Name<br />
							<xsl:call-template name="PopulateReturnHeaderFiler">
								<xsl:with-param name="TargetNode">BusinessNameLine1Txt</xsl:with-param>
							</xsl:call-template><br/>
							<xsl:call-template name="PopulateReturnHeaderFiler">
								<xsl:with-param name="TargetNode">BusinessNameLine2Txt</xsl:with-param>
							</xsl:call-template>
						</div>
						<div class="styEINBox" style="width:35mm;padding-left:0.5mm;font-weight:normal;">
							Identifying number as shown<br />
							on page 1 of your tax return
							<xsl:call-template name="PopulateReturnHeaderFilerTIN"/>
						</div>
					</div>
					<!-- Top Section -->
					<div class="styIRS1116SchBLineItem" style="border-style: solid; border-color:rgb(0, 0, 0);width:256mm;height:6mm;padding-top:2px;clear:left;border-bottom:0px;float:left;">
						Use a separate Schedule B (Form 1116) for each applicable category of income listed below. See instructions. Check only one box on each schedule. <br />
						Check the box for the same separate category code as that shown on the Form 1116 to which this Schedule B is attached.
					</div>
					<!-- 1st line of checkboxes -->
					<div class="styIRS1116SchBLineItem" style="width:256mm;height:5mm;clear:left;float:left;">
						<!-- (a) Reserved for future use -->
						<div class="styIRS1116SchBLNDesc" style="padding-left: 2mm; width: 55mm; height: 5mm;">
							<xsl:call-template name="CreateDisabledCheckbox">
								<xsl:with-param name="SpaceBefore">2px</xsl:with-param>
								<xsl:with-param name="Number">a &nbsp;</xsl:with-param>
								<xsl:with-param name="Desc">Reserved for future use</xsl:with-param>
								<xsl:with-param name="TargetNode" select="/.."/>
								<xsl:with-param name="BackupName">Reserved for future use</xsl:with-param>
							</xsl:call-template>
						</div>
						<!-- (c) Passive category foreign income checkbox -->
						<div class="styIRS1116SchBLNDesc" style="padding:0px;padding-left:5mm;width:55mm;height:5mm;">
							<xsl:call-template name="CreateTopSectionCheckbox">
								<xsl:with-param name="Number">c &nbsp;</xsl:with-param>
								<xsl:with-param name="Desc">Passive category income</xsl:with-param>
								<xsl:with-param name="TargetNode" select="$FormData/ForeignIncPassiveCategoryInd"/>
								<xsl:with-param name="BackupName">Form1116SchBDataForeignIncPassiveCategoryInd</xsl:with-param>
							</xsl:call-template>
						</div>
						<!-- (e) Foreign income section 901j checkbox -->
						<div class="styIRS1116SchBLNDesc" style="padding:0px;width:60mm;height:5mm;">
							<xsl:call-template name="CreateTopSectionCheckbox">
								<xsl:with-param name="Number">e &nbsp;</xsl:with-param>
								<xsl:with-param name="Desc">Section 901(j) income</xsl:with-param>
								<xsl:with-param name="TargetNode" select="$FormData/ForeignIncSection901jInd"/>
								<xsl:with-param name="BackupName">Form1116SchBDataForeignIncSection901jInd</xsl:with-param>
							</xsl:call-template>
						</div>
						<!-- (g) Foreign income lump-sum distributions checkbox -->
						<div class="styIRS1116SchBLNDesc" style="padding:0px;width:55mm;height:5mm;">
							<xsl:call-template name="CreateTopSectionCheckbox">
								<xsl:with-param name="Number">g &nbsp;</xsl:with-param>
								<xsl:with-param name="Desc">Lump-sum distributions</xsl:with-param>
								<xsl:with-param name="TargetNode" select="$FormData/ForeignIncLumpSumDistribInd"/>
								<xsl:with-param name="BackupName">Form1116SchBDataForeignIncLumpSumDistribInd</xsl:with-param>
							</xsl:call-template>
						</div>
					</div>	
					<!-- 2nd line of checkboxes -->
					<div class="styIRS1116SchBLineItem" style="border-style:solid;border-color:rgb(0, 0, 0);width:256mm;height:6mm;clear:left;float:left;">
						<!-- (b) Foreign branch category income checkbox -->
						<div class="styIRS1116SchBLNDesc" style="padding-left:2mm;width:54.5mm;height:5mm;">
							<xsl:call-template name="CreateTopSectionCheckbox">
								<xsl:with-param name="SpaceBefore">2px</xsl:with-param>
								<xsl:with-param name="Number">b &nbsp;</xsl:with-param>
								<xsl:with-param name="Desc">Foreign branch category income</xsl:with-param>
								<xsl:with-param name="TargetNode" select="$FormData/ForeignBranchIncomeInd"/>
								<xsl:with-param name="BackupName">Form1116SchBDataForeignBranchIncomeInd</xsl:with-param>
							</xsl:call-template>
						</div>
						<!-- (d) Foreign income general category checkbox -->
						<div class="styIRS1116SchBLNDesc" style="padding:0px;padding-left:5mm;width:55.5mm;height:5mm;">
							<xsl:call-template name="CreateTopSectionCheckbox">
								<xsl:with-param name="SpaceBefore">2px</xsl:with-param>
								<xsl:with-param name="Number">d &nbsp;</xsl:with-param>
								<xsl:with-param name="Desc">General category income</xsl:with-param>
								<xsl:with-param name="TargetNode" select="$FormData/ForeignIncGeneralCategoryInd"/>
								<xsl:with-param name="BackupName">Form1116SchBDataForeignIncGeneralCategoryInd</xsl:with-param>
							</xsl:call-template>
						</div>
						<!-- (f) Foreign income re-sourced by treaty checkbox -->
						<div class="styIRS1116SchBLNDesc" style="padding:0px;width:60mm;height:5mm;">
							<xsl:call-template name="CreateTopSectionCheckbox">
								<xsl:with-param name="SpaceBefore">2px</xsl:with-param>
								<xsl:with-param name="Number">f &nbsp;</xsl:with-param>
								<xsl:with-param name="Desc">Certain income re-sourced by treaty</xsl:with-param>
								<xsl:with-param name="TargetNode" select="$FormData/ForeignIncResourcedTreatyInd"/>
								<xsl:with-param name="BackupName">Form1116SchBDataForeignIncResourcedTreatyInd</xsl:with-param>
							</xsl:call-template>
						</div>						
					</div>
					<br />
					<div style="width:256mm;">						
						<div style="height:auto;width:256mm;float:left;padding-left:2.5mm;padding-top:1mm">
							<strong>h</strong>&nbsp;&nbsp; If box e is checked, enter the country code for the sanctioned country. See instructions
							<div>
								<span class="sty1116SchBDotLn">&nbsp;.....................</span>
							</div>
							<div style="float:right">&nbsp;
								<span style="border-color:black;border-style:solid;border-right-width:0px;
									border-left-width:0px;border-top-width:0px;border-bottom-width:1px;width:48mm"> 
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$FormData/SanctionedCountryCd"/>
								</xsl:call-template>
								</span>
							 </div>
						</div>	
					</div>
					<div style="width:256mm;border-bottom:1px solid black;">						
						<div style="height:auto;width:256mm;float:left;padding-left:2.5mm;padding-top:1mm;padding-bottom:2mm;">
							<strong>i</strong>&nbsp;&nbsp;&nbsp; If box f is checked, enter the country code for the treaty country. See instructions
							<div>
								<span class="sty1116SchBDotLn">&nbsp;......................</span>
							</div>
							<div style="float:right">&nbsp;
								<span style="border-color:black;border-style:solid;border-right-width:0px;
									border-left-width:0px;border-top-width:0px;border-bottom-width:1px;width:48mm"> 
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$FormData/TreatyCountryCd"/>
								</xsl:call-template>
								</span>
							</div>
						</div>	
					</div>
					<!-- Table 1 Page 1-->
					<xsl:variable name="separateP1" select="($Print = $Separated) and (count($FormData/OtherFrgnTaxAdjustmentsGrp) &gt; 5)"/>
					<div class="styTableContainerLandscape" style="width:256mm;" id="Table1">
						<table class="styTable" cellspacing="0">
							<thead class="styTableThead">
								<tr style="border-bottom-width:1px;border-style:solid;border-color:black;">
									<th class="styIRS1116SchBTableCellLtr" 
										style="width:45mm;height:12mm;font-size:3.5mm;font-weight:normal;"
										colspan="3" rowspan="1">
										Foreign Tax Carryover Reconciliation 
									</th>
									<th class="styIRS1116SchBTableCellHeaderSmall"
										style="width:25mm;height:11mm;" scope="col">
										<div style="text-align:center;width:2mm;font-weight:bold;">
											(i) 
										</div><br/>
										<div style="width:20mm;text-align:center;font-weight:normal">
											10th Preceding Tax Year
										</div>
									</th>
									<th class="styIRS1116SchBTableCellHeaderSmall"
									 style="width:25mm;height:11mm;" scope="col">
										<div style="text-align:center;width:2mm;font-weight:bold;padding-right:4mm;">
											(ii) 
										</div><br/>
										<div style="width:15mm;text-align:center;font-weight:normal">
											9th Preceding Tax Year
										</div>
									</th>
									<th class="styIRS1116SchBTableCellHeaderSmall" 
										style="width:25mm;height:11mm;" scope="col">
										<div style="text-align:center;width:2mm;font-weight:bold;padding-right:4mm;">
											(iii) 
										</div><br/>
										<div style="width:15mm;text-align:center;font-weight:normal">
											8th Preceding Tax Year
										</div>
									</th>
									<th class="styIRS1116SchBTableCellHeaderSmall" style="width:25mm;height:11mm;"
										scope="col">
										<div style="text-align:center;width:2mm;font-weight:bold;padding-right:4mm;">
											(iv) 
										</div><br/>
										<div style="width:15mm;text-align:center;font-weight:normal">
											7th Preceding Tax Year
										</div>
									</th>
									<th class="styIRS1116SchBTableCellHeaderSmall" 
										style="width:25mm;height:11mm;" scope="col">
										<div style="text-align:center;width:2mm;font-weight:bold;padding-right:4mm;">
											(v) 
										</div><br/>
										<div style="width:15mm;text-align:center;font-weight:normal">
											6th Preceding Tax Year
										</div>
									</th>
									<th class="styIRS1116SchBTableCellHeaderSmall" 
										style="width:25mm;height:11mm;" scope="col">
										<div style="text-align:center;width:2mm;font-weight:bold;padding-right:4mm;">
											(vi) 
										</div><br/>
										<div style="width:15mm;text-align:center;font-weight:normal">
											5th Preceding Tax Year
										</div>
									</th>
									<th class="styIRS1116SchBTableCellHeaderSmall" 
										style="width:25mm;height:11mm;border-right-width:0px;" scope="col">
										<div style="text-align:center;width:2mm;font-weight:bold;padding-right:4mm;">
											(vii) 
										</div><br />
										<div style="width:20mm;text-align:center;font-weight:normal">
											Subtotal <br /> (add columns (i) through (vi))
										</div>
									</th>
								</tr>
							</thead>
							<tfoot/>
							<tbody>
								<!-- Page 1 Line 1, column 1-8-->
								<tr style="height:6mm;">
									<td class="styIRS1116SchBTableCellLtr" colspan="3">
										<span style="width:53mm;border-bottom-width:1px">
											<span style="width:4mm;font-weight:bold;vertical-align:top;">1</span>
											<span style="width:43mm;font-weight:normal;padding-left:2mm;">
												Foreign tax carryover from the prior
												tax year (enter amounts from the
												appropriate columns of line 8 of the 
												prior year Schedule B (see instructions))	
											</span>
										</span>
									</td>
									<td class="styTableCellSmall" style="vertical-align:bottom;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" 
											select="$FormData/ForeignTxCyovPrTYGrp/TenthPrecedingTYAmt"/>
										</xsl:call-template>
										<span style="width:1px;"/>
									</td>
									<td class="styTableCellSmall" style="vertical-align:bottom;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" 
											select="$FormData/ForeignTxCyovPrTYGrp/NinthPrecedingTYAmt"/>
										</xsl:call-template>
										<span style="width:1px;"/>
									</td>
									<td class="styTableCellSmall" style="vertical-align:bottom;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode"
											select="$FormData/ForeignTxCyovPrTYGrp/EighthPrecedingTYAmt"/>
										</xsl:call-template>
										<span style="width:1px;"/>
									</td>
									<td class="styTableCellSmall" style="vertical-align:bottom;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" 
											select="$FormData/ForeignTxCyovPrTYGrp/SeventhPrecedingTYAmt"/>
										</xsl:call-template>
										<span style="width:1px;"/>
									</td>
									<td class="styTableCellSmall" style="vertical-align:bottom;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" 
											select="$FormData/ForeignTxCyovPrTYGrp/SixthPrecedingTYAmt"/>
										</xsl:call-template>
										<span style="width:1px;"/>
									</td>
									<td class="styTableCellSmall" style="vertical-align:bottom;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" 
											select="$FormData/ForeignTxCyovPrTYGrp/FifthPrecedingTYAmt"/>
										</xsl:call-template>
										<span style="width:1px;"/>
									</td>
									<td class="styTableCellSmall" style="border-right-width:0px;vertical-align:bottom;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" 
											select="$FormData/ForeignTxCyovPrTYGrp/SubtotalAmt"/>
										</xsl:call-template>
										<span style="width:1px;"/>
									</td>
								</tr>
								<!-- Page 1 Line 2, column 1-8 -->
								<tr style="height:6mm;border-bottom-width:1px;border-style:solid;border-color:black;">
									<td class="styIRS1116SchBTableCellLtr" colspan="3" style="border-bottom-width:1px;">
										<span style="width:53mm;">
											<span style="width:4mm;font-weight:bold;vertical-align:top;">2</span>
											<span style="width:43mm;font-weight:normal;padding-left:2mm;">
												Adjustments to line 1 (enter description—see instructions): 
											</span>
										</span>
									</td>
									<td class="styShadingCell" style="border-left-width:0px;border-style:solid;border-color:black;
										border-bottom-width:0px;border-right-width:1px;float:none;border-bottom-width:1px">
										<span style="width:1px;"/>
									</td>
									<td class="styShadingCell" style="border-left-width:0px;border-style:solid;border-color:black;
										border-bottom-width:0px;border-right-width:1px;float:none;border-bottom-width:1px">
										<span style="width:1px;"/>
									</td>
									<td class="styShadingCell" style="border-left-width:0px;border-style:solid;border-color:black;  
										border-bottom-width:0px;border-right-width:1px;float:none;border-bottom-width:1px">
										<span style="width:1px;"/>
									</td>
									<td class="styShadingCell" style="border-left-width:0px;border-style:solid;border-color:black;
										border-bottom-width:0px;border-right-width:1px;float:none;border-bottom-width:1px">
										<span style="width:1px;"/>
									</td>
									<td class="styShadingCell" style="border-left-width:0px;border-style:solid; border-color:black;
										border-bottom-width:0px;border-right-width:1px;float:none;border-bottom-width:1px">
										<span style="width:1px;"/>
									</td>
									<td class="styShadingCell" style="border-left-width:0px;border-style:solid;border-color:black;
										border-bottom-width:0px;border-right-width:1px;float:none;border-bottom-width:1px">
										<span style="width:1px;"/>
									</td>
									<td class="styShadingCell" style="border-left-width:0px;border-style:solid;border-color:black;
										border-bottom-width:0px;border-right-width:0px;float:none;border-bottom-width:1px">
										<span style="width:1px;"/>
									</td>
								</tr>
								<!-- Page 1 line 2a, column 1-8  -->
								<tr style="height:5mm;border-bottom-width:1px;border-style:solid;border-color:black;">
									<td class="styIRS1116SchBTableCellLtr" colspan="3">
										<span style="width:53mm;">
											<span class="styLNLeftNumBox" style="width:4mm;font-weight:bold;padding-left:2mm;
												padding-bottom:0mm;vertical-align:top;">a
											</span>
											<span style="width:45mm;font-weight:normal;padding-top:.5mm;padding-left:2mm;">
												Carryback adjustment (see instructions) 
											</span>
										</span>
									</td>
									<td class="styShadingCell" style="border-left-width:0px;border-style:solid; 
										border-color:black;border-bottom-width:1px;border-right-width:1px;float:none;">
										<span style="width:1px;"/>
									</td>
									<td class="styShadingCell" style="border-left-width:0px;border-style:solid;
										border-color:black;border-bottom-width:1px;border-right-width:1px;float:none;">
										<span style="width:1px;"/>
									</td>
									<td class="styShadingCell" style="border-left-width:0px;border-style:solid;  
										border-color:black;border-bottom-width:1px;border-right-width:1px;float:none;">
										<span style="width:1px;"/>
									</td>
									<td class="styShadingCell" style="border-left-width:0px;border-style:solid; 
										border-color:black;border-bottom-width:1px;border-right-width:1px;float:none;">
										<span style="width:1px;"/>
									</td>
									<td class="styShadingCell" style="border-left-width:0px;border-style:solid; 
										border-color:black;border-bottom-width:1px;border-right-width:1px;float:none;">
										<span style="width:1px;"/>
									</td>
									<td class="styShadingCell" style="border-left-width:0px;border-style:solid; 
										border-color:black;border-bottom-width:1px;border-right-width:1px;float:none;">
										<span style="width:1px;"/>
									</td>
									<td class="styShadingCell" style="border-left-width:0px;border-style:solid; 
										border-color:black;border-bottom-width:1px;border-right-width:0px;float:none;">
										<span style="width:1px;"/>
									</td>
								</tr>
								<!-- Page 1 Line 2b, column 1-8 -->
								<tr style="height:6mm;border-bottom-width:1px;border-style:solid;border-color:black;">
									<td class="styIRS1116SchBTableCellLtr" colspan="3">
										<span style="width:53mm;">
											<span class="styLNLeftNumBox" style="width:4mm;font-weight:bold;
												padding-left:2mm;padding-bottom:0mm;vertical-align:top;">b
											</span>
											<span style="width:43mm;font-weight:normal;padding-top:.5mm;padding-left:2mm;">
												Adjustments for section 905(c) redeterminations (see instructions) 
											</span>
										</span>
									</td>
									<td class="styTableCellSmall" style="vertical-align:bottom;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" 
											select="$FormData/Sect905cRedeterminationsAdjGrp/TenthPrecedingTYAmt"/>
										</xsl:call-template>
										<span style="width:1px;"/>
									</td>
									<td class="styTableCellSmall" style="vertical-align:bottom;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" 
											select="$FormData/Sect905cRedeterminationsAdjGrp/NinthPrecedingTYAmt"/>
										</xsl:call-template>
										<span style="width:1px;"/>
									</td>
									<td class="styTableCellSmall" style="vertical-align:bottom;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode"
											 select="$FormData/Sect905cRedeterminationsAdjGrp/EighthPrecedingTYAmt"/>
										</xsl:call-template>
										<span style="width:1px;"/>
									</td>
									<td class="styTableCellSmall" style="vertical-align:bottom;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" 
											select="$FormData/Sect905cRedeterminationsAdjGrp/SeventhPrecedingTYAmt"/>
										</xsl:call-template>
										<span style="width:1px;"/>
									</td>
									<td class="styTableCellSmall" style="vertical-align:bottom;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode"
											select="$FormData/Sect905cRedeterminationsAdjGrp/SixthPrecedingTYAmt"/>
										</xsl:call-template>
										<span style="width:1px;"/>
									</td>
									<td class="styTableCellSmall" style="vertical-align:bottom;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" 
											select="$FormData/Sect905cRedeterminationsAdjGrp/FifthPrecedingTYAmt"/>
										</xsl:call-template>
										<span style="width:1px;"/>
									</td>
									<td class="styTableCellSmall" style="border-right-width:0px;vertical-align:bottom;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" 
											select="$FormData/Sect905cRedeterminationsAdjGrp/SubtotalAmt"/>
										</xsl:call-template>
										<span style="width:1px;"/>
									</td>
								</tr>
								<!-- Page 1 Line 2c-2g, column 1-8 -->
								<xsl:if test="not($separateP1)">
									<xsl:for-each select="$FormData/OtherFrgnTaxAdjustmentsGrp">
										<xsl:if test="($Print != $Separated) or (count($FormData/OtherFrgnTaxAdjustmentsGrp) &lt; 5)">
											<tr style="border-bottom-width:1px;border-style:solid;border-color:black;">
												<td class="styIRS1116SchBTableCellLtr" colspan="3">
													<span style="width:53mm;">
														<span style="width:4mm;font-weight:bold;padding-bottom:0mm;
															padding-left:2mm;vertical-align:top;"> 
															<xsl:number format="a" value="position() +2"></xsl:number>
														</span>&nbsp;&nbsp;
														<span style="width:43mm;font-weight:normal;">
															<xsl:call-template name="PopulateText">
																<xsl:with-param name="TargetNode" select="OtherAdjustmentsTxt"/>
															</xsl:call-template>
														</span>
													</span>
												</td>
												<td class="styTableCellSmall" style="vertical-align:bottom;padding-top:2mm">
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="OtherFrgnTaxAdjPrecedingTYGrp/TenthPrecedingTYAmt"/>
													</xsl:call-template>
													<span style="width:1px;"/>	
												</td>
												<td class="styTableCellSmall" style="vertical-align:bottom">
													<br/>
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="OtherFrgnTaxAdjPrecedingTYGrp/NinthPrecedingTYAmt"/>
													</xsl:call-template>
													<span style="width:1px;"/>	
												</td>
												<td class="styTableCellSmall" style="vertical-align:bottom;">
													<br/>
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="OtherFrgnTaxAdjPrecedingTYGrp/EighthPrecedingTYAmt"/>
													</xsl:call-template>
													<span style="width:1px;"/>
												</td>
												<td class="styTableCellSmall" style="vertical-align:bottom;">
													<br/>
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="OtherFrgnTaxAdjPrecedingTYGrp/SeventhPrecedingTYAmt"/>
													</xsl:call-template>
													<span style="width:1px;"/>
												</td>
												<td class="styTableCellSmall" style="vertical-align:bottom;">
													<br/>
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="OtherFrgnTaxAdjPrecedingTYGrp/SixthPrecedingTYAmt"/>
													</xsl:call-template>
													<span style="width:1px;"/>
												</td>
												<td class="styTableCellSmall" style="vertical-align:bottom;">
													<br/>
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="OtherFrgnTaxAdjPrecedingTYGrp/FifthPrecedingTYAmt"/>
													</xsl:call-template>
													<span style="width:1px;"/>
												</td>
												<td class="styTableCellSmall" style="border-right-width:0px;vertical-align:bottom;">
													<br/>
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="OtherFrgnTaxAdjPrecedingTYGrp/SubtotalAmt"/>
													</xsl:call-template>
													<span style="width:1px;"/>
												</td>
											</tr>
										</xsl:if>
									</xsl:for-each>	
								</xsl:if>
								<xsl:if test="$separateP1  or (count($FormData/OtherFrgnTaxAdjustmentsGrp) &lt; 5)">
									<xsl:call-template name="FillTable7Cols">
										<xsl:with-param name="LineNumber" select="1 + count($FormData/OtherFrgnTaxAdjustmentsGrp)"/>
										<xsl:with-param name="SepMessage" select="$separateP1"/>
										<xsl:with-param name="MaxLine" select="5"/>
									</xsl:call-template>
								</xsl:if>
								<!-- Page 1 Line 3, column 1-8 -->
								<tr style="height:6mm;border-bottom-width:1px;border-style:solid;border-color:black;">
									<td class="styIRS1116SchBTableCellLtr" colspan="3">
										<span style="width:53mm;">
											<span style="width:4mm;font-weight:bold;vertical-align:top;">3</span>
											<span style="width:43mm;font-weight:normal;padding-left:2mm;">
												Adjusted foreign tax carryover from prior tax year (combine lines 1 and 2)
											</span>
										</span>
									</td>
									<td class="styTableCellSmall" style="vertical-align:bottom;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" 
											select="$FormData/AdjForeignTxCyovPrTYGrp/TenthPrecedingTYAmt"/>
										</xsl:call-template>
										<span style="width:1px;"/>
									</td>
									<td class="styTableCellSmall" style="vertical-align:bottom;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" 
											select="$FormData/AdjForeignTxCyovPrTYGrp/NinthPrecedingTYAmt"/>
										</xsl:call-template>
										<span style="width:1px;"/>
									</td>
									<td class="styTableCellSmall" style="vertical-align:bottom;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" 
											select="$FormData/AdjForeignTxCyovPrTYGrp/EighthPrecedingTYAmt"/>
										</xsl:call-template>
										<span style="width:1px;"/>
									</td>
									<td class="styTableCellSmall" style="vertical-align:bottom;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode"
											 select="$FormData/AdjForeignTxCyovPrTYGrp/SeventhPrecedingTYAmt"/>
										</xsl:call-template>
										<span style="width:1px;"/>
									</td>							
									<td class="styTableCellSmall" style="vertical-align:bottom;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" 
											select="$FormData/AdjForeignTxCyovPrTYGrp/SixthPrecedingTYAmt"/>
										</xsl:call-template>
										<span style="width:1px;"/>
									</td>
									<td class="styTableCellSmall" style="vertical-align:bottom;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" 
											select="$FormData/AdjForeignTxCyovPrTYGrp/FifthPrecedingTYAmt"/>
										</xsl:call-template>
										<span style="width:1px;"/>
									</td>
									<td class="styTableCellSmall" style="border-right-width:0px;vertical-align:bottom;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" 
											select="$FormData/AdjForeignTxCyovPrTYGrp/SubtotalAmt"/>
										</xsl:call-template>
										<span style="width:1px;"/>
									</td>
								</tr>
								<!-- Page 1 Line 4, column 1-8 -->
								<tr style="height:6mm;border-bottom-width:1px;border-style:solid;border-color:black;">
									<td class="styIRS1116SchBTableCellLtr" colspan="3">
										<span style="width:53mm;">
											<span style="width:4mm;font-weight:bold;vertical-align:top;">4</span>
											<span style="width:43mm;font-weight:normal;padding-left:2mm;">
												Foreign tax carryover used in current tax year (enter as a negative number)
											</span>
										</span>
									</td>
									<td class="styTableCellSmall" style="vertical-align:bottom;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" 
											select="$FormData/ForeignTxCyovUsedCurrTYGrp/TenthPrecedingTYAmt"/>
										</xsl:call-template>
										<span style="width:1px;"/>
									</td>
									<td class="styTableCellSmall" style="vertical-align:bottom;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" 
											select="$FormData/ForeignTxCyovUsedCurrTYGrp/NinthPrecedingTYAmt"/>
										</xsl:call-template>
										<span style="width:1px;"/>
									</td>
									<td class="styTableCellSmall" style="vertical-align:bottom;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" 
											select="$FormData/ForeignTxCyovUsedCurrTYGrp/EighthPrecedingTYAmt"/>
										</xsl:call-template>
										<span style="width:1px;"/>
									</td>
									<td class="styTableCellSmall" style="vertical-align:bottom;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode"
											 select="$FormData/ForeignTxCyovUsedCurrTYGrp/SeventhPrecedingTYAmt"/>
										</xsl:call-template>
										<span style="width:1px;"/>
									</td>
									<td class="styTableCellSmall" style="vertical-align:bottom;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" 
											select="$FormData/ForeignTxCyovUsedCurrTYGrp/SixthPrecedingTYAmt"/>
										</xsl:call-template>
										<span style="width:1px;"/>
									</td>
									<td class="styTableCellSmall" style="vertical-align:bottom;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" 
											select="$FormData/ForeignTxCyovUsedCurrTYGrp/FifthPrecedingTYAmt"/>
										</xsl:call-template>
										<span style="width:1px;"/>
									</td>
									<td class="styTableCellSmall" style="border-right-width:0px;vertical-align:bottom;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" 
											select="$FormData/ForeignTxCyovUsedCurrTYGrp/SubtotalAmt"/>
										</xsl:call-template>
										<span style="width:1px;"/>
									</td>
								</tr>
								<!-- Page 1 Line 5, column 1-8 -->
								<tr style="height:6mm;border-bottom-width:1px;border-style:solid;border-color:black;">
									<td class="styIRS1116SchBTableCellLtr" colspan="3">
										<span style="width:53mm;">
											<span style="width:4mm;font-weight:bold;vertical-align:top;">5</span>
											<span style="width:45mm;font-weight:normal;padding-left:2mm;">
												Foreign tax carryover expired unused in current tax year 
												(enter as a negative number)
											</span>
										</span>
									</td>
									<td class="styTableCellSmall" style="vertical-align:bottom;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode"
											 select="$FormData/ForeignTxCyovExprUnsdCurrTYGrp/TenthPrecedingTYAmt"/>
										</xsl:call-template>
										<span style="width:1px;"/>
									</td>
									<td class="styShadingCell" style="border-left-width:0px;border-style:solid;
										border-color:black;border-bottom-width:1px;border-right-width:1px;float:none;">
										<span style="width:1px;"/>
									</td>
									<td class="styShadingCell" style="border-left-width:0px;border-style:solid;
										border-color:black;border-bottom-width:1px;border-right-width:1px;float:none;">
										<span style="width:1px;"/>
									</td>
									<td class="styShadingCell" style="border-left-width:0px;border-style:solid;
										border-color:black;border-bottom-width:1px;border-right-width:1px;float:none;">
										<span style="width:1px;"/>
									</td>
									<td class="styShadingCell" style="border-left-width:0px;border-style:solid;
										border-color:black;border-bottom-width:1px;border-right-width:1px;float:none;">
										<span style="width:1px;"/>
									</td>
									<td class="styShadingCell" style="border-left-width:0px;border-style:solid;
									    border-color:black;border-bottom-width:1px;border-right-width:1px;float:none;">
										<span style="width:1px;"/>
									</td>
									<td class="styTableCellSmall" style="border-right-width:0px;vertical-align:bottom;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" 
											select="$FormData/ForeignTxCyovExprUnsdCurrTYGrp/SubtotalAmt"/>
										</xsl:call-template>
										<span style="width:1px;"/>
									</td>
								</tr>
								<!-- Page 1 Line 6, column 1-8  -->
								<tr style="height:6mm;border-bottom-width:1px;border-style:solid;border-color:black;">
									<td class="styIRS1116SchBTableCellLtr" colspan="3">
										<span style="width:53mm;">
											<span style="width:4mm;font-weight:bold;vertical-align:top;">6</span>
											<span style="width:43mm;font-weight:normal;padding-left:2mm;">
												Foreign tax carryover generated in current tax year 
											</span>
										</span>
									</td>
									<td class="styShadingCell" style="border-left-width:0px;border-style:solid;  
										border-color:black;border-bottom-width:1px;border-right-width:1px;float:none;">
										<span style="width:1px;"/>
									</td>
									<td class="styShadingCell" style="border-left-width:0px;border-style:solid; 
										border-color:black;border-bottom-width:1px;border-right-width:1px;float:none;">
										<span style="width:1px;"/>
									</td>
									<td class="styShadingCell" style="border-left-width:0px;border-style:solid;
										border-color:black;border-bottom-width:1px;border-right-width:1px;float:none;">
										<span style="width:1px;"/>
									</td>
									<td class="styShadingCell" style="border-left-width:0px;border-style:solid;  
										border-color:black;border-bottom-width:1px;border-right-width:1px;float:none;">
										<span style="width:1px;"/>
									</td>
									<td class="styShadingCell" style="border-left-width:0px;border-style:solid;  
										border-color:black;border-bottom-width:1px;border-right-width:1px;float:none;">
										<span style="width:1px;"/>
									</td>
									<td class="styShadingCell" style="border-left-width:0px;border-style:solid;  
										border-color:black;border-bottom-width:1px;border-right-width:1px;float:none;">
										<span style="width:1px;"/>
									</td>
									<td class="styShadingCell" style="border-left-width:0px;border-style:solid; 
										border-color:black;border-bottom-width:1px;border-right-width:0px;float:none;">
										<span style="width:1px;"/>
									</td>
								</tr>
								<!-- Page 1 Line 7, column 1-8    -->
								<tr style="height:6mm;border-bottom-width:1px;border-style:solid;border-color:black;">
									<td class="styIRS1116SchBTableCellLtr" colspan="3">
										<span style="width:53mm;">
											<span style="width:4mm;font-weight:bold;vertical-align:top;">7</span>
											<span style="width:43mm;font-weight:normal;padding-left:2mm;">Actual or estimated amount of 
												line 6 to be carried back to prior tax year (enter as a negative number)
											</span>
										</span>
									</td>
									<td class="styShadingCell" style="border-left-width:0px;border-style:solid;
										border-color:black;border-bottom-width:1px;border-right-width:1px;float:none;">
										<span style="width:1px;"/>
									</td>
									<td class="styShadingCell" style="border-left-width:0px;border-style:solid;
										border-color:black; border-bottom-width:1px;border-right-width:1px;float:none;">
										<span style="width:1px;"/>
									</td>
									<td class="styShadingCell" style="border-left-width:0px;border-style:solid;
										border-color:black; border-bottom-width:1px;border-right-width:1px;float:none;">
										<span style="width:1px;"/>
									</td>
									<td class="styShadingCell" style="border-left-width:0px;border-style:solid;
										border-color:black; border-bottom-width:1px;border-right-width:1px;float:none;">
										<span style="width:1px;"/>
									</td>
									<td class="styShadingCell" style="border-left-width:0px;border-style:solid; 
										border-color:black; border-bottom-width:1px;border-right-width:1px;float:none;">
										<span style="width:1px;"/>
									</td>
									<td class="styShadingCell" style="border-left-width:0px;border-style:solid;
										border-color:black; border-bottom-width:1px;border-right-width:1px;float:none;">
										<span style="width:1px;"/>
									</td>
									<td class="styShadingCell" style="border-left-width:0px;border-style:solid; 
										border-color:black; border-bottom-width:1px;border-right-width:0px;float:none;">
										<span style="width:1px;"/>
									</td>
								</tr>
								<!-- Page 1 Line 8, column 1-8-->
								<tr style="height:6mm;border-bottom-width:1px;border-style:solid;border-color:black;">
									<td class="styIRS1116SchBTableCellLtr" colspan="3">
										<span style="width:53mm;">
											<span style="width:4mm;font-weight:bold;vertical-align:top;">8</span>
											<span style="width:43mm;font-weight:normal;padding-left:2mm;">
												Foreign tax carryover to the following tax year.  Combine lines 3 through 7.
											</span>
										</span>
									</td>
									<td class="styTableCellSmall" style="text-align:center;padding-top:4mm;">
										<b>-0-</b>
									</td>
									<td class="styTableCellSmall" style="padding-top:4mm;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" 
											select="$FormData/ForeignTxCyovFollowingTYGrp/NinthPrecedingTYAmt"/>
										</xsl:call-template>
										<span style="width:1px;"/>
									</td>
									<td class="styTableCellSmall" style="padding-top:4mm;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" 
											select="$FormData/ForeignTxCyovFollowingTYGrp/EighthPrecedingTYAmt"/>
										</xsl:call-template>
										<span style="width:1px;"/>
									</td>
									<td class="styTableCellSmall" style="padding-top:4mm;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" 
											select="$FormData/ForeignTxCyovFollowingTYGrp/SeventhPrecedingTYAmt"/>
										</xsl:call-template>
										<span style="width:1px;"/>
									</td>
									<td class="styTableCellSmall" style="padding-top:4mm;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" 
											select="$FormData/ForeignTxCyovFollowingTYGrp/SixthPrecedingTYAmt"/>
										</xsl:call-template>
									<span style="width:1px;"/>
									</td>
									<td class="styTableCellSmall" style="padding-top:4mm;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" 
											select="$FormData/ForeignTxCyovFollowingTYGrp/FifthPrecedingTYAmt"/>
										</xsl:call-template>
										<span style="width:1px;"/>
									</td>
									<td class="styTableCellSmall" style="border-right-width:0px;padding-top:4mm;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" 
											select="$FormData/ForeignTxCyovFollowingTYGrp/SubtotalAmt"/>
										</xsl:call-template>
										<span style="width:1px;"/>
									</td>
								</tr>
							</tbody>
						</table>
					</div>
					<!-- Page 1 Form footer-->
					<div class="styStdDiv pageEnd" style="width:256mm">
						<div style="float:left;clear:none;">
							<span class="styBoldText">
							For Paperwork Reduction Act Notice, see the separate instructions.</span>
						</div>
						<div style="float:right">
							Cat. No. 75186F
							<span style="width:140px"/>
							<b>  Schedule B (Form 1116) (12-2022)  </b>
						</div>
					</div>
					<!-- Page 2 -->
					<!-- Form Header -->
					<div style="width:256mm;float:none">
						<div style="float:left;clear:none">Schedule B (Form 1116) (12-2022) </div>
						<div style="float:right">
							Page <span class="styBoldText" style="font-size:8pt">2</span>
						</div>
					</div>						
					<!-- Table 2 Page 2 -->
					<xsl:variable name="separateP2" select="($Print = $Separated) and (count($FormData/OtherFrgnTaxAdjustmentsGrp) &gt; 5)"/>
					<div class="styTableContainerLandscape" style="width:256mm;border-top:1px solid black;" id="Table2" >	
						<table class="styTable" cellspacing="0">
							<thead class="styTableThead">
								<tr style="border-bottom-width:1px;border-style: solid; border-color: black;">
									<th class="styIRS1116SchBTableCellLtr" style="width:45mm;height:12mm;font-size:3.5mm;
										font-weight:normal;" colspan="3" rowspan="1">
										Foreign Tax Carryover Reconciliation <i>(continued) </i>
									</th>
									<th class="styIRS1116SchBTableCellHeaderSmall" style="width:25mm" scope="col">
										<div style="text-align:center;width:10mm;font-weight:bold;">
											(viii)
										</div>
										<div style="width:28mm;text-align:center;font-weight:normal">
											Subtotal from page 1 (enter the amounts from column (vii) on page 1)
										</div>
									</th>
									<th class="styIRS1116SchBTableCellHeaderSmall" style="width:25mm;" scope="col">
										<div style="text-align:center;width:2mm;font-weight:bold;padding-right:4mm;">
											(ix)
										</div>
										<br/>
										<div style="width:15mm;text-align:center;font-weight:normal">
											4th Preceding Tax Year
										</div>
									</th>
									<th class="styIRS1116SchBTableCellHeaderSmall" style="width:25mm;height:11mm;" scope="col">
										<div style="text-align:center;width:2mm;font-weight:bold;padding-right:4mm;">
											(x)
										</div>
										<br/>
										<div style="width:15mm;text-align:center;font-weight:normal">
											3rd Preceding Tax Year
										</div>
									</th>
									<th class="styIRS1116SchBTableCellHeaderSmall" style="width:25mm;height:11mm;" scope="col">
										<div style="text-align:center;width:2mm;font-weight:bold;padding-right:4mm;">
											(xi)
										</div>
										<br/>
										<div style="width:18mm;text-align:center;font-weight:normal">
											2nd Preceding Tax Year
										</div>
									</th>
									<th class="styIRS1116SchBTableCellHeaderSmall" style="width:25mm;height:11mm;" scope="col">
										<div style="text-align:center;width:2mm;font-weight:bold;padding-right:4mm;">
											(xii)
										</div>
										<br/>
										<div style="width:15mm;text-align:center;font-weight:normal">
											1st Preceding Tax Year
										</div>
									</th>
									<th class="styIRS1116SchBTableCellHeaderSmall" style="width:15mm;height:11mm;" scope="col">
										<div style="text-align:center;width:2mm;font-weight:bold;padding-right:4mm;">
											(xiii)
										</div>
										<br/>
										<div style="width:10mm;text-align:center;font-weight:normal;height:4mm;">
											Current Tax Year
										</div>
									</th>
									<th class="styIRS1116SchBTableCellHeaderSmall" style="width:25mm;height:11mm;border-right-width:0px;" scope="col">
										<div style="text-align:center;width:2mm;font-weight:bold;padding-right:4mm;">
											(xiv)
										</div>
										<br/>
										<div style="width:20mm;text-align:center;font-weight:normal">
											Totals (add columns (viii) through (xiii))
										</div>
									</th>
								</tr>
							</thead>
							<tfoot/>
							<tbody>
								<!-- Page 2, line 1 column 1-8-->
								<tr style="height:6mm;border-bottom-width:1px;border-style:solid;border-color:black">
									<td class="styIRS1116SchBTableCellLtr" colspan="3">
										<span style="width:53mm;">
											<span style="width:4mm;font-weight:bold;vertical-align:top;">1</span>
											<span style="width:43mm;font-weight:normal;padding-left:2mm;">
												Foreign tax carryover from the prior
												tax year (enter amounts from the
												appropriate columns of line 8 of the prior year Schedule B (see instructions)) 
											</span>
										</span>
									</td>
									<td class="styTableCellSmall" style="vertical-align:bottom;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" 
											select="$FormData/ForeignTxCyovPrTYGrp/SubtotalAmt"/>
										</xsl:call-template>
										<span style="width:1px;"/>
									</td>
									<td class="styTableCellSmall" style="vertical-align:bottom;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" 
											select="$FormData/ForeignTxCyovPrTYGrp/FourthPrecedingTYAmt"/>
										</xsl:call-template>
										<span style="width:1px;"/>
									</td>
									<td class="styTableCellSmall" style="vertical-align:bottom;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" 
											select="$FormData/ForeignTxCyovPrTYGrp/ThirdPrecedingTYAmt"/>
										</xsl:call-template>
										<span style="width:1px;"/>
									</td>
									<td class="styTableCellSmall" style="vertical-align:bottom;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode"
											 select="$FormData/ForeignTxCyovPrTYGrp/SecondPrecedingTYAmt"/>
										</xsl:call-template>
										<span style="width:1px;"/>
									</td>
									<td class="styTableCellSmall" style="vertical-align:bottom;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode"
											 select="$FormData/ForeignTxCyovPrTYGrp/FirstPrecedingTYAmt"/>
										</xsl:call-template>
										<span style="width:1px;"/>
									</td>
									<td class="styShadingCell" style="border-left-width:0px;border-bottom-width:1px;
										border-right-width:1px;float:none;">
										<span style="width:1px;"/>
									</td>
									<td class="styTableCellSmall" style="border-right-width:0px;vertical-align:bottom;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" 
											select="$FormData/ForeignTxCyovPrTYGrp/TotalAmt"/>
										</xsl:call-template>
										<span style="width:1px;"/>
									</td>
								</tr>
								<!-- Page 2, line 2 column 1-8 -->
								<tr style="height:6mm;border-style:solid;border-color:black;">
									<td class="styIRS1116SchBTableCellLtr" colspan="3" style="border-bottom-width:1px;border-right-width:1px;">
										<span style="width:53mm;">
											<span style="width:4mm;font-weight:bold;vertical-align:top">2</span>
											<span style="width:43mm;font-weight:normal;border-bottom-width:1px;padding-left:2mm;">
												Adjustments to line 1 (enter description—see instructions): 
											</span>
										</span>
									</td>
									<td class="styShadingCell" style="border-left-width:0px;border-style:solid;border-color:black;
										border-bottom-width:0px;border-right-width:1px;float:none;border-bottom-width:1px">
										<span style="width:1px;"/>
									</td>
									<td class="styShadingCell" style="border-left-width:0px;border-style:solid;border-color:black;
										border-bottom-width:0px;border-right-width:1px;float:none;border-bottom-width:1px">
										<span style="width:1px;"/>
									</td>
									<td class="styShadingCell" style="border-left-width:0px;border-style:solid;border-color:black;
										border-bottom-width:0px;border-right-width:1px;float:none;border-bottom-width:1px">
										<span style="width:1px;"/>
									</td>
									<td class="styShadingCell" style="border-left-width:0px;border-style:solid;border-color:black;
										border-bottom-width:0px;border-right-width:1px;float:none;border-bottom-width:1px">
										<span style="width:1px;"/>
									</td>
									<td class="styShadingCell" style="border-right-width:1px;border-left-width:0px;float:none;
										border-bottom-width:1px">
										<span style="width:1px;"/>
									</td>
									<td class="styShadingCell" style="border-right-width:1px;border-left-width:0px;float:none;
										border-bottom-width:1px">
										<span style="width:1px;"/>
									</td>
									<td class="styShadingCell" style="border-right-width:0px;border-left-width:0px;float:none;
										border-bottom-width:1px">
										<span style="width:1px;"/>
									</td>
								</tr>						
								<!-- Page 2, Line 2a column 1-8 -->
								<tr style="height:5mm; border-bottom-width:1px;border-style:solid;border-color:black;">
									<td class="styIRS1116SchBTableCellLtr" colspan="3">
										<span style="width:53mm;">
											<span class="styLNLeftNumBox" style="width:4mm;font-weight:bold;padding-left:2mm;
												padding-bottom:0mm;vertical-align:top;">a
											</span>
											<span style="width:45mm;font-weight:normal;padding-top:.5mm;padding-left:2mm;">
												Carryback adjustment (see instructions) 
											</span>
										</span>
									</td>
									<td class="styShadingCell" style="border-left-width:0px;border-style:solid; 
										border-color:black;border-bottom-width:1px;border-right-width:1px;float:none;">
										<span style="width:1px;"/>
									</td>
									<td class="styShadingCell" style="border-left-width:0px;border-style:solid;
										border-color:black;border-bottom-width:1px;border-right-width:1px;float:none;">
										<span style="width:1px;"/>
									</td>
									<td class="styShadingCell" style="border-left-width:0px;border-style:solid;
										border-color:black;border-bottom-width:1px;border-right-width:1px;float:none;">
										<span style="width:1px;"/>
									</td>
									<td class="styShadingCell" style="border-left-width:0px;border-style:solid;
										border-color:black;border-bottom-width:1px;border-right-width:1px;float:none;">
										<span style="width:1px;"/>
									</td>
									<td class="styTableCell" style="border-bottom-width:1px;vertical-align:bottom;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode"
											 select="$FormData/CarrybackAdjustmentGrp/FirstPrecedingTYAmt"/>
										</xsl:call-template>
										<span style="width:1px;"/>
									</td>
									<td class="styShadingCell" style="border-left-width:0px;border-style:solid;  
										border-color: black;border-bottom-width:1px;border-right-width:1px;float:none;">
										<span style="width:1px;"/>
									</td>
									<td class="styTableCellSmall" style="border-right-width:0px;vertical-align:bottom;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" 
											select="$FormData/CarrybackAdjustmentGrp/TotalAmt"/>
										</xsl:call-template>
										<span style="width:1px;"/>
									</td>
								</tr>
								<!-- Page 2, line 2b column 1-8  -->
								<tr style="height:6mm;border-bottom-width:1px;border-style: solid;border-color:black;">
									<td class="styIRS1116SchBTableCellLtr" colspan="3">
										<span style="width:53mm;">
											<span class="styLNLeftNumBox" style="width:4mm;font-weight:bold;padding-left:2mm;
												padding-bottom:0mm;">b
											</span>
											<span style="width:43mm;font-weight:normal;padding-top:.5mm;padding-left:2mm;">
												Adjustments for section 905(c) redeterminations (see instructions) 
											</span>
										</span>
									</td>
									<td class="styTableCellSmall" style="border-bottom-width:1px;vertical-align:bottom;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" 
											select="$FormData/Sect905cRedeterminationsAdjGrp/SubtotalAmt"/>
										</xsl:call-template>
										<span style="width:1px;"/>
									</td>
									<td class="styTableCellSmall" style="border-bottom-width:1px;vertical-align:bottom;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode"
											 select="$FormData/Sect905cRedeterminationsAdjGrp/FourthPrecedingTYAmt"/>
										</xsl:call-template>
										<span style="width:1px;"/>
									</td>
									<td class="styTableCellSmall" style="border-bottom-width:1px;vertical-align:bottom;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" 
											select="$FormData/Sect905cRedeterminationsAdjGrp/ThirdPrecedingTYAmt"/>
										</xsl:call-template>
										<span style="width:1px;"/>
									</td>
									<td class="styTableCellSmall" style="border-bottom-width:1px;vertical-align:bottom;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode"
											 select="$FormData/Sect905cRedeterminationsAdjGrp/SecondPrecedingTYAmt"/>
										</xsl:call-template>
										<span style="width:1px;"/>
									</td>
									<td class="styTableCellSmall" style="border-bottom-width:1px;vertical-align:bottom;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" 
											select="$FormData/Sect905cRedeterminationsAdjGrp/FirstPrecedingTYAmt"/>
										</xsl:call-template>
										<span style="width:1px;"/>
									</td>
									<td class="styShadingCell" style="border-left-width:0px;border-style:solid;  
										border-color: black;border-bottom-width:1px;border-right-width:1px;float:none;">
										<span style="width:1px;"/>
									</td>
									<td class="styTableCellSmall" style="border-right-width:0px;vertical-align:bottom;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode"
											 select="$FormData/Sect905cRedeterminationsAdjGrp/TotalAmt"/>
										</xsl:call-template>
										<span style="width:1px;"/>
									</td>
								</tr>
								<!-- Page 2, line 2c-2g column 1-8 -->
								<xsl:if test="not($separateP2)">
									<xsl:for-each select="$FormData/OtherFrgnTaxAdjustmentsGrp">
										<xsl:if test="($Print != $Separated) or (count($FormData/OtherFrgnTaxAdjustmentsGrp) &lt;=5)">
											<tr style="border-bottom-width:1px;border-style:solid;border-color:black;">
												<td class="styIRS1116SchBTableCellLtr" colspan="3">
													<span style="width:53mm;">
														<span style="width:4mm;font-weight:bold;padding-bottom:0mm;
															padding-left:2mm;vertical-align:top;"> 
															<xsl:number format="a" value="position() +2"></xsl:number>
														 </span>&nbsp;&nbsp;
														<span style="width:43mm;font-weight:normal;">
															<xsl:call-template name="PopulateText">
																<xsl:with-param name="TargetNode" select="OtherAdjustmentsTxt"/>
															</xsl:call-template>
														</span>
													</span>
												</td>
												<td class="styTableCellSmall" style="vertical-align:bottom;padding-top:2mm">
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="OtherFrgnTaxAdjPrecedingTYGrp/SubtotalAmt"/>
													</xsl:call-template>
													<span style="width:1px;"/>	
												</td>
												<td class="styTableCellSmall" style="vertical-align:bottom">
													<br/>
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="OtherFrgnTaxAdjPrecedingTYGrp/FourthPrecedingTYAmt"/>
													</xsl:call-template>
													<span style="width:1px;"/>	
												</td>
												<td class="styTableCellSmall" style="vertical-align:bottom;">
													<br/>
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="OtherFrgnTaxAdjPrecedingTYGrp/ThirdPrecedingTYAmt"/>
													</xsl:call-template>
													<span style="width:1px;"/>
												</td>
												<td class="styTableCellSmall" style="vertical-align:bottom;">
													<br/>
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="OtherFrgnTaxAdjPrecedingTYGrp/SecondPrecedingTYAmt"/>
													</xsl:call-template>
													<span style="width:1px;"/>
												</td>
												<td class="styTableCellSmall" style="vertical-align:bottom;">
													<br/>
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="OtherFrgnTaxAdjPrecedingTYGrp/FirstPrecedingTYAmt"/>
													</xsl:call-template>
													<span style="width:1px;"/>
												</td>
												<td class="styShadingCell" style="border-left-width:0px;border-style: solid; border-color: black;
													border-bottom-width:0px;border-right-width:1px;float:none;border-bottom-width:1px">
													<span style="width:1px;"/>
												</td>
												<td class="styTableCellSmall" style="vertical-align:bottom;border-right-width:0px;">
													<br/>
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="OtherFrgnTaxAdjPrecedingTYGrp/TotalAmt"/>
													</xsl:call-template>
													<span style="width:1px;"/>
												</td>
											</tr>
										</xsl:if>
									</xsl:for-each>	
								</xsl:if>
									<xsl:if test="$separateP2  or (count($FormData/OtherFrgnTaxAdjustmentsGrp) &lt; 5)">
									<xsl:call-template name="FillTable7Cols">
										<xsl:with-param name="LineNumber" select="1 + count($FormData/OtherFrgnTaxAdjustmentsGrp)"/>
										<xsl:with-param name="SepMessage" select="$separateP2"/>
										<xsl:with-param name="MaxLine" select="5"/>
								   </xsl:call-template>
								</xsl:if>
								<!-- Page 2, line 3 column 1-8 -->
								<tr style="height:6mm;border-bottom-width:1px; border-style:solid;border-color:black;">
									<td class="styIRS1116SchBTableCellLtr" colspan="3">
										<span style="width:53mm;">
											<span style="width:4mm;font-weight:bold;vertical-align:top;">3</span>
											<span style="width:46.5mm;font-weight:normal;padding-left:2mm;">
												Adjusted foreign tax carryover from prior tax year (combine lines 1 and 2).  
												Include the column (xiv) total on the current year Form 1116, 
												Part III, line 10. 
											</span>
										</span>
									</td>
									<td class="styTableCellSmall" style="vertical-align:bottom;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" 
											select="$FormData/AdjForeignTxCyovPrTYGrp/SubtotalAmt"/>
										</xsl:call-template>
										<span style="width:1px;"/>
									</td>
									<td class="styTableCellSmall" style="vertical-align:bottom;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" 
											select="$FormData/AdjForeignTxCyovPrTYGrp/FourthPrecedingTYAmt"/>
										</xsl:call-template>
										<span style="width:1px;"/>
									</td>
									<td class="styTableCellSmall" style="vertical-align:bottom;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode"
											 select="$FormData/AdjForeignTxCyovPrTYGrp/ThirdPrecedingTYAmt"/>
										</xsl:call-template>
										<span style="width:1px;"/>
									</td>
									<td class="styTableCellSmall" style="vertical-align:bottom;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" 
											select="$FormData/AdjForeignTxCyovPrTYGrp/SecondPrecedingTYAmt"/>
										</xsl:call-template>
										<span style="width:1px;"/>
									</td>
									<td class="styTableCellSmall" style="vertical-align:bottom;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" 
											select="$FormData/AdjForeignTxCyovPrTYGrp/FirstPrecedingTYAmt"/>
										</xsl:call-template>
										<span style="width:1px;"/>
									</td>
									<td class="styShadingCell" style="border-left-width:0px;border-style:solid;
										border-color: black; border-bottom-width:1px;border-right-width:1px;float:none;">
										<span style="width:1px;"/>
									</td>
									<td class="styTableCellSmall" style="width:25mm;border-right-width:0px;vertical-align:bottom;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" 
											select="$FormData/AdjForeignTxCyovPrTYGrp/TotalAmt"/>
										</xsl:call-template>
										<span style="width:1px;"/>
									</td>
								</tr>
								<!-- Page 2 line 4 column 1-8-->
								<tr style="height:6mm;border-bottom-width:1px;border-style:solid;border-color:black;">
									<td class="styIRS1116SchBTableCellLtr" colspan="3">
										<span style="width:53mm;">
											<span style="width:4mm;font-weight:bold;vertical-align:top;">4</span>
											<span style="width:43mm;font-weight:normal;padding-left:2mm;">
												Foreign tax carryover used in current tax year (enter as a negative number)
											</span>
										</span>
									</td>
									<td class="styTableCellSmall" style="vertical-align:bottom;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" 
											select="$FormData/ForeignTxCyovUsedCurrTYGrp/SubtotalAmt"/>
										</xsl:call-template>
										<span style="width:1px;"/>
									</td>
									<td class="styTableCellSmall" style="vertical-align:bottom;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" 
											select="$FormData/ForeignTxCyovUsedCurrTYGrp/FourthPrecedingTYAmt"/>
										</xsl:call-template>
										<span style="width:1px;"/>
									</td>
									<td class="styTableCellSmall" style="vertical-align:bottom;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" 
											select="$FormData/ForeignTxCyovUsedCurrTYGrp/ThirdPrecedingTYAmt"/>
										</xsl:call-template>
										<span style="width:1px;"/>
									</td>
									<td class="styTableCellSmall" style="vertical-align:bottom;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" 
											select="$FormData/ForeignTxCyovUsedCurrTYGrp/SecondPrecedingTYAmt"/>
										</xsl:call-template>
										<span style="width:1px;"/>
									</td>
									<td class="styTableCellSmall" style="vertical-align:bottom;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" 
											select="$FormData/ForeignTxCyovUsedCurrTYGrp/FirstPrecedingTYAmt"/>
										</xsl:call-template>
										<span style="width:1px;"/>
									</td>
									<td class="styShadingCell" style="border-left-width:0px;border-style:solid; 
										border-color:black;border-bottom-width:1px;border-right-width:1px;float:none;">
										<span style="width:1px;"/>
									</td>
									<td class="styTableCellSmall" style="width:25mm;border-right-width:0px;vertical-align:bottom;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" 
											select="$FormData/ForeignTxCyovUsedCurrTYGrp/TotalAmt"/>
										</xsl:call-template>
										<span style="width:1px;"/>
									</td>
								</tr>
								<!-- Page 2 line 5 column 1-8 -->
								<tr style="height:6mm;border-bottom-width:1px; border-style:solid;border-color:black;">
									<td class="styIRS1116SchBTableCellLtr" colspan="3">
										<span style="width:53mm;">
										<span style="width:4mm;font-weight:bold;vertical-align:top;">5</span>
											<span style="width:45mm;font-weight:normal;padding-left:2mm;">Foreign tax carryover expired 
												unused in current tax year (enter as a negative number)
											</span>
										</span>
									</td>
									<td class="styTableCellSmall" style="vertical-align:bottom;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode"
											 select="$FormData/ForeignTxCyovExprUnsdCurrTYGrp/SubtotalAmt"/>
										</xsl:call-template>
										<span style="width:1px;"/>
									</td>
									<td class="styShadingCell" style="border-left-width:0px;border-style:solid; 
										border-color: black; border-bottom-width:1px;border-right-width:1px;float:none;">
										<span style="width:1px;"/>
									</td>
									<td class="styShadingCell" style="border-left-width:0px;border-style:solid; 
										border-color: black; border-bottom-width:1px;border-right-width:1px;float:none;">
										<span style="width:1px;"/>
									</td>
									<td class="styShadingCell" style="border-left-width:0px;border-style:solid; 
										border-color: black; border-bottom-width:1px;border-right-width:1px;float:none;">
										<span style="width:1px;"/>
									</td>
									<td class="styShadingCell" style="border-left-width:0px;border-style:solid;
										border-color: black; border-bottom-width:1px;border-right-width:1px;float:none;">
										<span style="width:1px;"/>
									</td>
									<td class="styShadingCell" style="border-left-width:0px;border-style:solid; 
										border-color: black; border-bottom-width:1px;border-right-width:1px;float:none;">
										<span style="width:1px;"/>
									</td>
									<td class="styTableCellSmall" style="border-right-width:0px;vertical-align:bottom;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" 
											select="$FormData/ForeignTxCyovExprUnsdCurrTYGrp/TotalAmt"/>
										</xsl:call-template>
										<span style="width:1px;"/>
									</td>
								</tr>
								<!-- Page 2, line 6 column 1-8 -->
								<tr style="height:6mm;border-bottom-width:1px;border-style:solid;border-color:black;">
									<td class="styIRS1116SchBTableCellLtr" colspan="3">
										<span style="width:53mm;">
											<span style="width:4mm;font-weight:bold;vertical-align:top;;">6</span>
											<span style="width:43mm;font-weight:normal;padding-left:2mm;">
												Foreign tax carryover generated in current tax year 
											</span>
										</span>
									</td>
									<td class="styShadingCell" style="border-left-width:0px;border-style:solid; 
										border-color: black; border-bottom-width:1px;border-right-width:1px;float:none;">
										<span style="width:1px;"/>
									</td>
									<td class="styShadingCell" style="border-left-width:0px;border-style:solid;
										border-color: black; border-bottom-width:1px;border-right-width:1px;float:none;">
										<span style="width:1px;"/>
									</td>
									<td class="styShadingCell" style="border-left-width:0px;border-style:solid; 
										border-color: black;  border-bottom-width:1px;border-right-width:1px;float:none;">
										<span style="width:1px;"/>
									</td>
									<td class="styShadingCell" style="border-left-width:0px;border-style:solid;
										border-color: black; border-bottom-width:1px;border-right-width:1px;float:none;">
										<span style="width:1px;"/>
									</td>
									<td class="styShadingCell" style="border-left-width:0px;border-style:solid; 
										border-color: black;  border-bottom-width:1px;border-right-width:1px;float:none;">
										<span style="width:1px;"/>
									</td>
									<td class="styTableCellSmall" style="vertical-align:bottom;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode"
											 select="$FormData/ForeignTxCyovGenCurrTYGrp/CurrentTaxYearAmt"/>
										</xsl:call-template>
										<span style="width:1px;"/>
									</td>
									<td class="styTableCellSmall" style="border-right-width:0px;vertical-align:bottom;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode"
											 select="$FormData/ForeignTxCyovGenCurrTYGrp/TotalAmt"/>
										</xsl:call-template>
										<span style="width:1px;"/>
									</td>
								</tr>
								<!-- Page 2 line 7 column 1-8 -->
								<tr style="height:6mm;border-bottom-width:1px;border-style:solid;border-color:black;">
									<td class="styIRS1116SchBTableCellLtr" colspan="3">
										<span style="width:53mm;">
											<span style="width:4mm;font-weight:bold;vertical-align:top;">7</span>
											<span style="width:43mm;font-weight:normal;padding-left:2mm;">
												Actual or estimated amount of line 6 to be carried back to prior tax year 
												(enter as a negative number)
											</span>
										</span>
									</td>
									<td class="styShadingCell" style="border-left-width:0px;border-style:solid;
										border-color: black; border-bottom-width:1px;border-right-width:1px;float:none;">
										<span style="width:1px;"/>
									</td>
									<td class="styShadingCell" style="border-left-width:0px;border-style:solid; 
										border-color: black; border-bottom-width:1px;border-right-width:1px;float:none;">
										<span style="width:1px;"/>
									</td>
									<td class="styShadingCell" style="border-left-width:0px;border-style:solid;
										border-color: black; border-bottom-width:1px;border-right-width:1px;float:none;">
										<span style="width:1px;"/>
									</td>
									<td class="styShadingCell" style="border-left-width:0px;border-style:solid; 
										border-color: black; border-bottom-width:1px;border-right-width:1px;float:none;">
										<span style="width:1px;"/>
									</td>
									<td class="styShadingCell" style="border-left-width:0px;border-style:solid; 
										border-color: black; border-bottom-width:1px;border-right-width:1px;float:none;">
										<span style="width:1px;"/>
									</td>
									<td class="styTableCellSmall" style="vertical-align:bottom;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" 
											select="$FormData/ActlTentAmtCarriedBackPrTYGrp/CurrentTaxYearAmt"/>
										</xsl:call-template>
										<span style="width:1px;"/>
									</td>
									<td class="styTableCellSmall" style="border-right-width:0px;vertical-align:bottom;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode"
											 select="$FormData/ActlTentAmtCarriedBackPrTYGrp/TotalAmt"/>
										</xsl:call-template>
										<span style="width:1px;"/>
									</td>
								</tr>
								<!-- Page 2 line 8 column 1-8 -->
								<tr style="height:6mm;border-bottom-width:1px;border-style:solid;border-color:black;">
									<td class="styIRS1116SchBTableCellLtr" colspan="3">
										<span style="width:53mm;">
											<span style="width:4mm;font-weight:bold;vertical-align:top;">8</span>
											<span style="width:43mm;font-weight:normal;padding-left:2mm;">Foreign tax carryover to the 
												following tax year. Combine lines 3 through 7.
											</span>
										</span>
									</td>
									<td class="styTableCellSmall" style="vertical-align:bottom;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" 
											select="$FormData/ForeignTxCyovFollowingTYGrp/SubtotalAmt"/>
										</xsl:call-template>
										<span style="width:1px;"/>
									</td>
									<td class="styTableCellSmall" style="vertical-align:bottom;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" 
											select="$FormData/ForeignTxCyovFollowingTYGrp/FourthPrecedingTYAmt"/>
										</xsl:call-template>
										<span style="width:1px;"/>
									</td>
									<td class="styTableCellSmall" style="vertical-align:bottom;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode"
											 select="$FormData/ForeignTxCyovFollowingTYGrp/ThirdPrecedingTYAmt"/>
										</xsl:call-template>
										<span style="width:1px;"/>
									</td>
									<td class="styTableCellSmall" style="vertical-align:bottom;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode"
											 select="$FormData/ForeignTxCyovFollowingTYGrp/SecondPrecedingTYAmt"/>
										</xsl:call-template>
										<span style="width:1px;"/>
									</td>
									<td class="styTableCellSmall" style="vertical-align:bottom;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" 
											select="$FormData/ForeignTxCyovFollowingTYGrp/FirstPrecedingTYAmt"/>
										</xsl:call-template>
										<span style="width:1px;"/>
									</td>
									<td class="styTableCellSmall" style="vertical-align:bottom;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" 
											select="$FormData/ForeignTxCyovFollowingTYGrp/CurrentTaxYearAmt"/>
										</xsl:call-template>
										<span style="width:1px;"/>
									</td>
									<td class="styTableCellSmall" style="border-right-width:0px;vertical-align:bottom;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode"
											 select="$FormData/ForeignTxCyovFollowingTYGrp/TotalAmt"/>
										</xsl:call-template>
										<span style="width:1px;"/>
									</td>
								</tr>
							</tbody>
						</table>
					</div>
					<!-- Page 1 Form footer-->
					<div class="styStdDiv pageEnd" style="width:256mm">
						<div style="float:left;clear:none;">
							<span class="styBoldText"></span>
						</div>
						<div style="float:right">						
							<span style="width:140px"/>
							<b>  Schedule B (Form 1116) (12-2022) </b>
						</div>
					</div>		
					<!-- Additonal Data Title Bar and Button -->
					<div class="styLeftOverTitleLineLandscape" id="LeftoverData">
						<div class="styLeftOverTitle">Additional Data </div> 
						<div class="styLeftOverButtonContainerLandscape">
							<input class="styLeftoverTableBtn" type="button" value="Return to Form"
							 onclick="javascript:returnToWriteInImage();"/>
						</div>
					</div>
					<!-- Additional Data Table -->
					<table class="styLeftOverTblLandscape">
						<xsl:call-template name="PopulateCommonLeftoverLandscape">
							<xsl:with-param name="TargetNode" select="$FormData"/>
							<xsl:with-param name="DescWidth" select="100"/>
						</xsl:call-template>
					</table>	
					<!-- Page 1 separated table -->
					<xsl:if test="$separateP1">
						<br/>
						<br/>
						<span class="styRepeatingDataTitle"> </span>
						<table class="styDepTbl" cellspacing="0" style="font-size:7pt;">
							<thead class="styTableThead">
								<tr class="styDepTblHdr">
									<th class="styIRS1116SchBTableCellLtr" 
										style="width:45mm;height:12mm;font-size:3.5mm;font-weight:normal;"
										 colspan="3" rowspan="1">
											Foreign Tax Carryover Reconciliation 
									</th>
									<th class="styDepTblCell" scope="col" rowspan="2" style="width:52mm;font-weight:normal;">
										<strong>(i)</strong> <br /> 10th Preceding <br /> Tax Year
									</th>
									<th class="styDepTblCell" scope="col" rowspan="2" style="width:25mm;font-weight:normal;">
										<strong>(ii)</strong> <br /> 9th Preceding <br /> Tax Year 
									</th>
									<th class="styDepTblCell" scope="col" rowspan="2" style="width:30mm;font-weight:normal;">
										<strong>(iii)</strong> <br /> 8th Preceding <br /> Tax Year 
									</th>
									<th class="styDepTblCell" scope="col"	rowspan="2" style="width:22mm;font-weight:normal;">
										<strong>(iv)</strong> <br /> 7th Preceding <br /> Tax Year 
									</th>
									<th class="styDepTblCell" scope="col" rowspan="2" style="width:23mm;font-weight:normal;">
										<strong>(v)</strong> <br /> 6th Preceding <br /> Tax Year 
									</th>
									<th class="styDepTblCell" scope="col" rowspan="2" style="width:25mm;font-weight:normal;">
										<strong>(vi)</strong> <br /> 5th Preceding <br /> Tax Year
									</th>
									<th class="styDepTblCell" scope="col" rowspan="2" style="width:30mm;font-weight:normal;">
										<strong>(vii)</strong> <br /> Subtotal <br /> (add columns (i) <br /> through (vi)) 
									</th>
								</tr>
							</thead>
							<tbody>
								<xsl:for-each select="$FormData/OtherFrgnTaxAdjustmentsGrp">
									<tr style="height:7.5mm;vertical-align:bottom;">
										<xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
										<td class="styIRS1116SchBTableCellLtr" colspan="3">
											<span style="width:53mm;">
												<span style="width:4mm;font-weight:bold;padding-bottom:0mm;
													padding-left:2mm;vertical-align:top;"> 
													<xsl:number format="a" value="position() +2"></xsl:number>
												</span>
												<span style="width:43mm;font-weight:normal;">
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="OtherAdjustmentsTxt"/>
													</xsl:call-template>
												</span>
											</span>
										</td>
										<td class="styTableCellAmtInherit">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="OtherFrgnTaxAdjPrecedingTYGrp/TenthPrecedingTYAmt"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellAmtInherit">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="OtherFrgnTaxAdjPrecedingTYGrp/NinthPrecedingTYAmt"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellAmtInherit">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="OtherFrgnTaxAdjPrecedingTYGrp/EighthPrecedingTYAmt"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellAmtInherit">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="OtherFrgnTaxAdjPrecedingTYGrp/SeventhPrecedingTYAmt"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellAmtInherit">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="OtherFrgnTaxAdjPrecedingTYGrp/SixthPrecedingTYAmt"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellAmtInherit">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="OtherFrgnTaxAdjPrecedingTYGrp/FifthPrecedingTYAmt"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellAmtInherit">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="OtherFrgnTaxAdjPrecedingTYGrp/SubtotalAmt"/>
											</xsl:call-template>
										</td>	
									</tr>
								</xsl:for-each>
							</tbody>
						</table>
					</xsl:if>
					<!-- Page 2 separated table -->
					<xsl:if test="$separateP2">
						<br/>
						<br/>
						<span class="styRepeatingDataTitle"> </span>
						<table class="styDepTbl" cellspacing="0" style="font-size:7pt;">
							<thead class="styTableThead">
								<tr class="styDepTblHdr">
									<th class="styIRS1116SchBTableCellLtr"
										 style="width:45mm;height:12mm;font-size:3.5mm;font-weight:normal;"
										  colspan="3" rowspan="1">
											Foreign Tax Carryover Reconciliation <i>(continued)</i>
									</th>
									<th class="styDepTblCell" scope="col" rowspan="2" style="width:28mm;font-weight:normal;">
										<strong>(viii)</strong> <br /> Subtotal from page 1 <br />(enter the amounts from <br />
										column (vii) on page 1)
									</th>
									<th class="styDepTblCell" scope="col" rowspan="2" style="width:25mm;font-weight:normal;">
										<strong>(ix)</strong> <br /> 4th Preceding <br /> Tax Year 
									</th>
									<th class="styDepTblCell" scope="col" rowspan="2" style="width:30mm;font-weight:normal;">
										<strong>(x)</strong> <br /> 3rd Preceding <br /> Tax Year 
									</th>
									<th class="styDepTblCell" scope="col"	rowspan="2" style="width:22mm;font-weight:normal;">
										<strong>(xi)</strong> <br /> 2nd Preceding <br /> Tax Year 
									</th>
									<th class="styDepTblCell" scope="col" rowspan="2" style="width:23mm;font-weight:normal;">
										<strong>(xii)</strong> <br /> 1th Preceding <br /> Tax Year 
									</th>
									<th class="styDepTblCell" scope="col" rowspan="2" style="width:30mm;font-weight:normal;">
										<strong>(xiv)</strong> <br /> Totals <br /> (add columns (viii) <br /> through (xiii))
									</th>
								</tr>
							</thead>
							<tbody>
								<xsl:for-each select="$FormData/OtherFrgnTaxAdjustmentsGrp">
									<tr style="height:7.5mm;vertical-align:bottom;">
										<xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
										<td class="styIRS1116SchBTableCellLtr" colspan="3">
											<span style="width:53mm;">
												<span style="width:4mm;font-weight:bold;padding-bottom:0mm;
													padding-left:2mm;vertical-align:top;"> 
													<xsl:number format="a" value="position() +2"></xsl:number>
												 </span>
												 <span style="width:43mm;font-weight:normal;">
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="OtherAdjustmentsTxt"/>
													</xsl:call-template>
												</span>		
											</span>
										</td>
										<td class="styTableCellAmtInherit">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="OtherFrgnTaxAdjPrecedingTYGrp/SubtotalAmt"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellAmtInherit">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="OtherFrgnTaxAdjPrecedingTYGrp/FourthPrecedingTYAmt"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellAmtInherit">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="OtherFrgnTaxAdjPrecedingTYGrp/ThirdPrecedingTYAmt"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellAmtInherit">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="OtherFrgnTaxAdjPrecedingTYGrp/SecondPrecedingTYAmt"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellAmtInherit">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="OtherFrgnTaxAdjPrecedingTYGrp/FirstPrecedingTYAmt"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellAmtInherit">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="OtherFrgnTaxAdjPrecedingTYGrp/TotalAmt"/>
											</xsl:call-template>
										</td>	
									</tr>
								</xsl:for-each>
							</tbody>
						</table>
					</xsl:if>
				</form>
			</body>
		</html>
	</xsl:template>
	
	<!-- CreateTopSectionCheckbox -->
	<xsl:template name="CreateTopSectionCheckbox">
		<xsl:param name="SpaceBefore">0.25mm</xsl:param>
		<xsl:param name="SpaceBetween">0.25mm</xsl:param>
		<xsl:param name="SpaceAfter">0.25mm</xsl:param>
		<xsl:param name="Number"/>
		<xsl:param name="Desc"/>
		<xsl:param name="TargetNode"/>
		<xsl:param name="BackupName"/>
		<div class="styIRS1116SchBLNDesc" style="width:auto;height:100%;padding-left:0px;">
			<span>
				<xsl:attribute name="style">
					width:<xsl:value-of select="$SpaceBefore"/>;
				</xsl:attribute>
			</span>
			<b>
				<xsl:value-of select="$Number"/>
			</b>
			<span>
				<xsl:attribute name="style">
					width:<xsl:value-of select="$SpaceBetween"/>;
				</xsl:attribute>
			</span>
			<input type="checkbox" class="styCkbox">
				<xsl:call-template name="PopulateCheckbox">
					<xsl:with-param name="TargetNode" select="$TargetNode"/>
					<xsl:with-param name="BackupName" select="$BackupName"/>
				</xsl:call-template>
			</input>
			<label>
				<xsl:call-template name="PopulateLabel">
					<xsl:with-param name="TargetNode" select="$TargetNode"/>
					<xsl:with-param name="BackupName" select="$BackupName"/>
				</xsl:call-template>
				<span>
					<xsl:attribute name="style">
						width:<xsl:value-of select="$SpaceBetween"/>;
					</xsl:attribute>
				</span>
				<xsl:value-of select="$Desc"/>
				<span>
					<xsl:attribute name="style">
						width:<xsl:value-of select="$SpaceAfter"/>;
				    </xsl:attribute>
				</span>
			</label>
		</div>
	</xsl:template>	
	
	<!-- CreateDisabledCheckbox -->
	<xsl:template name="CreateDisabledCheckbox">
		<xsl:param name="SpaceBefore">0.25mm</xsl:param>
		<xsl:param name="SpaceBetween">0.25mm</xsl:param>
		<xsl:param name="SpaceAfter">0.25mm</xsl:param>
		<xsl:param name="Number"/>
		<xsl:param name="Desc"/>
		<xsl:param name="TargetNode"/>
		<xsl:param name="BackupName"/>
		<div class="styIRS1116SchBLNDesc" style="width:auto;height:100%;padding-left:0px;">
			<span>
				<xsl:attribute name="style">
				    width:<xsl:value-of select="$SpaceBefore"/>;
			    </xsl:attribute>
			</span>
			<b>
				<xsl:value-of select="$Number"/>
			</b>
			<span>
				<xsl:attribute name="style">
					width:<xsl:value-of select="$SpaceBetween"/>;
				</xsl:attribute>
			</span>
			<input type="checkbox" class="styCkbox" disabled="disabled">
				<xsl:call-template name="PopulateCheckbox">
					<xsl:with-param name="TargetNode" select="$TargetNode"/>
					<xsl:with-param name="BackupName" select="$BackupName"/>
				</xsl:call-template>
			</input>
			<label>
				<xsl:call-template name="PopulateLabel">
					<xsl:with-param name="TargetNode" select="$TargetNode"/>
					<xsl:with-param name="BackupName" select="$BackupName"/>
				</xsl:call-template>
				<span>
					<xsl:attribute name="style">
						width:<xsl:value-of select="$SpaceBetween"/>;
				    </xsl:attribute>
				</span>
				<xsl:value-of select="$Desc"/>
				<span>
					<xsl:attribute name="style">
						width:<xsl:value-of select="$SpaceAfter"/>;
					</xsl:attribute>
				</span>
			</label>
		</div>
	</xsl:template>	
	<!-- FillTable7Cols -->
	<xsl:template name="FillTable7Cols">
       <xsl:param name="LineNumber"/>
       <xsl:param name="SepMessage" select="false()"/>
       <xsl:param name="MaxLine" select="7"/>
       <xsl:param name="RowID" select="true()"/>
       <tr style="height:6mm;border-bottom-width:1px;border-style:solid;border-color:black;">
             <td class="styIRS1116SchBTableCellLtr" style="width:4mm;font-weight:bold;padding-bottom:0mm;
					padding-left:2mm;vertical-align:top;" colspan="3">
                   <xsl:choose>
					   <xsl:when test="not($RowID)">&nbsp;</xsl:when>
					   <xsl:when test="$SepMessage">c</xsl:when>
					   <xsl:otherwise>
						   <xsl:number value="$LineNumber + 2" format="a"/>
					   </xsl:otherwise>
                    </xsl:choose>
             </td>
             <td class="styTableCellAmtInherit">
                    <xsl:if test="$SepMessage">See additional data</xsl:if>
                    &nbsp;
             </td>
             <td class="styTableCellAmtInherit">&nbsp;</td>
             <td class="styTableCellAmtInherit">&nbsp;</td>
             <td class="styTableCellAmtInherit">&nbsp;</td>
             <td class="styTableCellAmtInherit">&nbsp;</td>
             <td class="styTableCellAmtInherit">&nbsp;</td>
             <td class="styTableCellAmtInherit" style="border-right-width:0px;">&nbsp;</td>
       </tr>
       <xsl:choose>
             <xsl:when test="$SepMessage">
                    <xsl:call-template name="FillTable7Cols">
                           <xsl:with-param name="LineNumber" select="2"/>
                           <xsl:with-param name="SepMessage" select="false()"/>
                           <xsl:with-param name="MaxLine" select="$MaxLine"/>
                           <xsl:with-param name="RowID" select="$RowID"/>
                    </xsl:call-template>
             </xsl:when>
             <xsl:when test="$LineNumber &lt; $MaxLine">
                    <xsl:call-template name="FillTable7Cols">
                           <xsl:with-param name="LineNumber" select="$LineNumber + 1"/>
                           <xsl:with-param name="MaxLine" select="$MaxLine"/>
                           <xsl:with-param name="RowID" select="$RowID"/>
                    </xsl:call-template>
             </xsl:when>
             <xsl:otherwise/>
       </xsl:choose>
	</xsl:template>
</xsl:stylesheet>
