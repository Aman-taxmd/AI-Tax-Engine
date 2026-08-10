<?xml version="1.0" encoding="UTF-8"?>
<!-- Form 1116SchC - TY25 - Last Modified by Deevena Gurrapu on 1/15/2025 -->
<!DOCTYPE xsl:stylesheet [
  <!ENTITY nbsp "&#160;">
  <!ENTITY mdash "&#8212;">
]>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:include href="PopulateTemplate.xsl" />
	<xsl:include href="AddHeader.xsl" />
	<xsl:include href="CommonPathRef.xsl" />
	<xsl:include href="AddOnTable.xsl" />
	<xsl:include href="IRS1116ScheduleCStyle.xsl" />
	<xsl:output method="html" indent="yes" />
	<xsl:strip-space elements="*" />
	<xsl:param name="FormData" select="$RtnDoc/IRS1116ScheduleC" />
	<xsl:template match="/">
		<xsl:text disable-output-escaping="yes">&lt;!DOCTYPE html&gt;</xsl:text>
		<html lang="EN-US">
			<head>
				<meta http-equiv="X-UA-Compatible" content="IE=edge" />
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
				<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
				<meta name="Description" content="IRS Schedule C Form 1116" />
				<script language="JavaScript" src="{$ScriptPath}/FormDisplay.js" type="text/javascript" />
				<xsl:call-template name="InitJS" />
				<style type="text/css">
					<xsl:if test="not($Print) or $Print=''">
						<xsl:call-template name="IRS1116ScheduleCStyle" />
						<xsl:call-template name="AddOnStyle" />
					</xsl:if>
				</style>
				<xsl:call-template name="GlobalStylesForm" />
			</head>
			<body class="styBodyClass">
				<form id="Form1116ScheduleC">
					<xsl:call-template name="DocumentHeaderLandscape" />
					<!-- Page 1 -->
					<!-- Header -->
					<div class="styStdDivLS">
						<div class="styFNBox" style="width:35mm;height:18mm;">
							<span class="styFN" style="font-size:9pt;">SCHEDULE C<br />(Form 1116)</span> 
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$FormData" />
							</xsl:call-template>
							<br />
							(Rev. December 2025)<br />
							<span class="styAgency" style="padding-top:1mm;">
								Department of the Treasury
								<br />
								Internal Revenue Service
							</span>
						</div>
						<div class="styFTBox" style="width:186mm;height:18mm;">
							<span class="styFMT" style="font-size:11pt;padding-top:0.5mm;">
								Foreign Tax Redeterminations
							</span>
							<br />
							<div style="text-align:center;margin-top:1mm;margin-bottom:1mm;">For calendar year 
								<span style="width:10mm;border-bottom:1px solid black;">
									<xsl:call-template name="PopulateReturnHeaderTaxYear"/>
								</span>,
								or other tax year beginning 
								<span style="width:20mm;border-bottom:1px solid black;">
									<xsl:call-template name="PopulateReturnHeaderTaxPeriodBeginDate"/>
								</span>, 
								and ending 
								<span style="width:20mm;border-bottom:1px solid black;">
									<xsl:call-template name="PopulateReturnHeaderTaxPeriodEndDate"/>
								</span>
							</div>
							<br />
							<span style="font-weight:bold;">
								See separate instructions.
							</span>
							<br />
							<span style="font-weight:bold;">
								Go to
								<span style="font-style:italic">www.irs.gov/Form1116</span>
								for instructions and the latest information.
							</span>
						</div>
						<div class="styTYBox" style="width:33mm;height:18mm;">
							<div class="styOMB" style="font-size:6pt;border:none;padding-top:8mm;">OMB No. 1545-0121</div>
						</div>
					</div>
					<!-- Filer information section -->
					<div class="styStdDivLS" style="border-top:1px solid black;border-bottom:1px solid black;">
						<div class="styNameBox" style="width:209.2mm;height:9.0mm;">
							Name <br />
							<xsl:call-template name="PopulateReturnHeaderFiler">
								<xsl:with-param name="TargetNode">BusinessNameLine1Txt</xsl:with-param>
							</xsl:call-template>
							<br />
							<xsl:call-template name="PopulateReturnHeaderFiler">
								<xsl:with-param name="TargetNode">BusinessNameLine2Txt</xsl:with-param>
							</xsl:call-template>
						</div>
						<div class="styEINBox" style="width:46mm;height:9.0mm;padding-left:1mm;font-weight:normal;">
							Identifying number as shown <br /> on page 1 of your tax return <br />
							<span style="width:100%;text-align:center;">
								<xsl:call-template name="PopulateReturnHeaderFilerTIN"/>
							</span>
						</div>
					</div>
					<div class="styStdDivLS">
						<div class="styLNDesc" style="width:100%">
							Use a separate Schedule C (Form 1116) for each applicable category of income listed below. See instructions. Check only one box on each schedule.
						</div>
						<div class="styGenericDiv" style="width:63mm;">
							<div class="styLNLeftLtrBox">a</div>
							<input type="checkbox" class="styCkboxNM" style="float:left;margin-right:3px;" alt="Section 951A category income">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$FormData/ForeignIncmSection951AInd"/>
									<xsl:with-param name="BackupName">F1116SchC/ForeignIncmSection951AInd</xsl:with-param>
								</xsl:call-template>
							</input>
							<div class="styLNDesc" style="width:50mm;">Section 951A category income</div>
							<br />
							<div class="styLNLeftLtrBox">b</div>
							<input type="checkbox" class="styCkboxNM" style="float:left;margin-right:3px;" alt="Foreign branch category income">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$FormData/ForeignBranchIncomeInd"/>
									<xsl:with-param name="BackupName">F1116SchC/ForeignBranchIncomeInd</xsl:with-param>
								</xsl:call-template>
							</input>
							<div class="styLNDesc" style="width:50mm;">Foreign branch category income</div>
						</div>
						<div class="styGenericDiv" style="width:63mm;">
							<div class="styLNLeftLtrBox" style="padding-left:4.2mm;">c</div>
							<input type="checkbox" class="styCkboxNM" style="float:left;margin-right:3px;" alt="Passive category income">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$FormData/ForeignIncPassiveCategoryInd"/>
									<xsl:with-param name="BackupName">F1116SchC/ForeignIncPassiveCategoryInd</xsl:with-param>
								</xsl:call-template>
							</input>
							<div class="styLNDesc" style="width:50mm;">Passive category income</div>
							<br />
							<div class="styLNLeftLtrBox">d</div>
							<input type="checkbox" class="styCkboxNM" style="float:left;margin-right:3px;" alt="General category income">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$FormData/ForeignIncGeneralCategoryInd"/>
									<xsl:with-param name="BackupName">F1116SchC/ForeignIncGeneralCategoryInd</xsl:with-param>
								</xsl:call-template>
							</input>
							<div class="styLNDesc" style="width:50mm;">General category income</div>
						</div>
						<div class="styGenericDiv" style="width:63mm;">
							<div class="styLNLeftLtrBox">e</div>
							<input type="checkbox" class="styCkboxNM" style="float:left;margin-right:3px;" alt="Section 901 j income">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$FormData/ForeignIncSection901jInd"/>
									<xsl:with-param name="BackupName">F1116SchC/ForeignIncSection901jInd</xsl:with-param>
								</xsl:call-template>
							</input>
							<div class="styLNDesc" style="width:50mm;">Section 901(j) income</div>
							<br />
							<div class="styLNLeftLtrBox">f</div>
							<input type="checkbox" class="styCkboxNM" style="float:left;margin-right:3px;" alt="Certain income re-sourced by treaty">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$FormData/ForeignIncResourcedTreatyInd"/>
									<xsl:with-param name="BackupName">F1116SchC/ForeignIncResourcedTreatyInd</xsl:with-param>
								</xsl:call-template>
							</input>
							<div class="styLNDesc" style="width:50mm;">Certain income re-sourced by treaty</div>
						</div>
						<div class="styGenericDiv" style="width:63mm;">
							<div class="styLNLeftLtrBox">g</div>
							<input type="checkbox" class="styCkboxNM" style="float:left;margin-right:3px;" alt="Lump-sum distribution">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$FormData/ForeignIncLumpSumDistribInd"/>
									<xsl:with-param name="BackupName">F1116SchC/ForeignIncLumpSumDistribInd</xsl:with-param>
								</xsl:call-template>
							</input>
							<div class="styLNDesc" style="width:50mm;">Lump-sum distributions</div>
						</div>
					</div>
					<!-- Line h -->
					<div class="styStdDivLS">
						<div class="styLNLeftLtrBox">h</div>
						<div class="styLNDesc" style="width:215mm;">
							If box e is checked, enter the country code for the sanctioned country. See instructions
							<span class="sty1116SCDotLn">..........................</span>
						</div>
						<div class="styLNAmountBox" style="border-left-width:0px;text-align:center;">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/SanctionedCountryCd"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line i -->
					<div class="styStdDivLS">
						<div class="styLNLeftLtrBox">i</div>
						<div class="styLNDesc" style="width:215mm;">
							If box f is checked, enter the country code for the treaty country. See instructions
							<span class="sty1116SCDotLn">...........................</span>
						</div>
						<div class="styLNAmountBox" style="border-left-width:0px;text-align:center;">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/TreatyCountryCd"/>
							</xsl:call-template>
						</div>
					</div>

					<!-- Part 1 -->
					<div class="styStdDivLS" style="width:256mm;margin-top:1mm;border-top:1px solid black;border-bottom:1px solid black;">
						<div class="styPartName" style="height:auto;padding-top:1mm;padding-bottom:1mm;">Part I</div>
						<div class="styPartDesc" style="height:auto;padding-top:1mm;padding-bottom:1mm;">
							Increase in Amount of Foreign Taxes Accrued <span style="font-weight:normal;">(see instructions)</span>
						</div>
					</div>
					<div class="styStdDivLS">
						<div class="styLNDesc" style="width:100%">
							Enter redetermined amounts by payor for each separate relation back year (starting with the most recent) followed by a subtotal for each relation back year.
						</div>
					</div>
					<xsl:variable name="sep1" select="($Print = $Separated) and ((count($FormData/IncrAmtFrgnTaxesAccruedDtl) &gt; 2) or (count($FormData/IncrAmtFrgnTaxesAccruedDtl/PayorRelationBackYearGrp) &gt; 6))"/>
					<div class="styTableContainerLandscapeNBB" id="Page1Table1">
						<xsl:call-template name="SetInitialState"/>
						<table class="styTable" style="border-collapse:collapse;font-size:7pt;">
							<thead class="styTableThead">
								<tr style="border-top:1px solid black;">
									<th class="styTableCellHeader" scope="col" style="width:8mm;font-weight:normal;background-color:lightgrey;">&nbsp;</th>
									<th class="styTableCellHeader" scope="col" style="width:27mm;font-weight:normal;">
										<strong>1. </strong> U.S. Tax Year <br /> of Taxpayer to <br /> Which Tax Relates <br />
										(relation back year) <br /> (MM/DD/YYYY)
									</th>
									<th class="styTableCellHeader" scope="col" style="width:11mm;font-weight:normal;background-color:lightgrey;">&nbsp;</th>
									<th class="styTableCellHeader" scope="col" style="width:68mm;font-weight:normal;">
										<strong>2a. </strong> Name of Payor <br /> (see instructions)
									</th>
									<th class="styTableCellHeader" scope="col" style="width:77mm;font-weight:normal;">
										<strong>2b. </strong> EIN or Reference ID Number <br /> of Payor <br /> (see instructions)
									</th>
									<th class="styTableCellHeader" scope="col" style="width:23mm;font-weight:normal;">
										<strong>3. </strong> Country or <br /> U.S. Possession <br /> to Which Tax <br /> Is Paid <br />
										(enter code &mdash; <br /> (see instructions)
									</th>
									<th class="styTableCellHeader" scope="col" style="width:21mm;font-weight:normal;">
										<strong>4. </strong> Date <br /> Additional <br /> Foreign Tax <br /> Was Paid <br /> (MM/DD/YYYY)
									</th>
									<th class="styTableCellHeader" scope="col" style="width:21mm;font-weight:normal;border-right-width:0px;">
										<strong>5. </strong> Foreign <br /> Tax Year <br /> to Which <br /> Tax Relates <br /> (MM/DD/YYYY)
									</th>
								</tr>
							</thead>
							<tbody>
								<xsl:if test="not($sep1)">
									<xsl:for-each select="$FormData/IncrAmtFrgnTaxesAccruedDtl">
										<xsl:variable name="pos" select="position()"/>
										<tr>
											<td class="styTableCellCtrInherit" style="font-weight:bold;">
												<xsl:attribute name="rowspan">
													<xsl:choose>
														<xsl:when test="PayorRelationBackYearGrp[4]"><xsl:value-of select="count(PayorRelationBackYearGrp)"/></xsl:when>
														<xsl:otherwise>3</xsl:otherwise>
													</xsl:choose>
												</xsl:attribute>
												<xsl:number value="$pos" format="A"/>
											</td>
											<td class="styTableCellCtrInherit" style="">
												<xsl:attribute name="rowspan">
													<xsl:choose>
														<xsl:when test="PayorRelationBackYearGrp[4]"><xsl:value-of select="count(PayorRelationBackYearGrp)"/></xsl:when>
														<xsl:otherwise>3</xsl:otherwise>
													</xsl:choose>
												</xsl:attribute>
												<span style="width:22mm;height:3.5mm;border-bottom:1px solid black;">
													<xsl:call-template name="PopulateMonthDayYear">
														<xsl:with-param name="TargetNode" select="USTaxYearEndDt"/>
													</xsl:call-template>
												</span>
											</td>
											<td class="styTableCellCtrInherit" style="font-weight:bold;">(1)</td>
											<td class="styTableCellTextInherit" style="">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="PayorRelationBackYearGrp[1]/PayorName/BusinessNameLine1Txt"/>
												</xsl:call-template>
												<xsl:if test="PayorRelationBackYearGrp[1]/PayorName/BusinessNameLine2Txt">
													<br />
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="PayorRelationBackYearGrp[1]/PayorName/BusinessNameLine2Txt"/>
													</xsl:call-template>
												</xsl:if>
											</td>
											<td class="styTableCellCtrInherit" style="word-break:break-all;">
												<xsl:choose>
													<xsl:when test="PayorRelationBackYearGrp[1]/ForeignEntityIdentificationGrp">
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="PayorRelationBackYearGrp[1]/ForeignEntityIdentificationGrp/ForeignEntityReferenceIdNum"/>
														</xsl:call-template>
													</xsl:when>
													<xsl:otherwise>
														<xsl:call-template name="PopulateEIN">
															<xsl:with-param name="TargetNode" select="PayorRelationBackYearGrp[1]/PayorEIN"/>
														</xsl:call-template>
													</xsl:otherwise>
												</xsl:choose>
											</td>
											<td class="styTableCellCtrInherit" style="">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="PayorRelationBackYearGrp[1]/ForeignCountryOrUSPossessionCd"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellCtrInherit" style="">
												<xsl:call-template name="PopulateMonthDayYear">
													<xsl:with-param name="TargetNode" select="PayorRelationBackYearGrp[1]/AdditionalForeignTaxPaidDt"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellCtrInherit" style="border-right-width:0px;">
												<xsl:call-template name="PopulateMonthDayYear">
													<xsl:with-param name="TargetNode" select="PayorRelationBackYearGrp[1]/ForeignTaxYearEndDt"/>
												</xsl:call-template>
											</td>
										</tr>
										<xsl:for-each select="PayorRelationBackYearGrp[position() &gt; 1]">
											<tr>
												<td class="styTableCellCtrInherit" style="font-weight:bold;">
													(<xsl:value-of select="position() + 1"/>)
												</td>
												<td class="styTableCellTextInherit" style="">
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="PayorName/BusinessNameLine1Txt"/>
													</xsl:call-template>
													<xsl:if test="PayorName/BusinessNameLine2Txt">
														<br />
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="PayorName/BusinessNameLine2Txt"/>
														</xsl:call-template>
													</xsl:if>
												</td>
												<td class="styTableCellCtrInherit" style="word-break:break-all;">
													<xsl:choose>
														<xsl:when test="ForeignEntityIdentificationGrp">
															<xsl:call-template name="PopulateText">
																<xsl:with-param name="TargetNode" select="ForeignEntityIdentificationGrp/ForeignEntityReferenceIdNum"/>
															</xsl:call-template>
														</xsl:when>
														<xsl:otherwise>
															<xsl:call-template name="PopulateEIN">
																<xsl:with-param name="TargetNode" select="PayorEIN"/>
															</xsl:call-template>
														</xsl:otherwise>
													</xsl:choose>
												</td>
												<td class="styTableCellCtrInherit" style="">
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="ForeignCountryOrUSPossessionCd"/>
													</xsl:call-template>
												</td>
												<td class="styTableCellCtrInherit" style="">
													<xsl:call-template name="PopulateMonthDayYear">
														<xsl:with-param name="TargetNode" select="AdditionalForeignTaxPaidDt"/>
													</xsl:call-template>
												</td>
												<td class="styTableCellCtrInherit" style="border-right-width:0px;">
													<xsl:call-template name="PopulateMonthDayYear">
														<xsl:with-param name="TargetNode" select="ForeignTaxYearEndDt"/>
													</xsl:call-template>
												</td>
											</tr>
										</xsl:for-each>
										<xsl:if test="count(PayorRelationBackYearGrp) &lt; 2">
											<tr>
												<td class="styTableCellCtrInherit" style="font-weight:bold;">(2)</td>
												<td class="styTableCellTextInherit" style="">&nbsp;</td>
												<td class="styTableCellCtrInherit" style="word-break:break-all;">&nbsp;</td>
												<td class="styTableCellCtrInherit" style="">&nbsp;</td>
												<td class="styTableCellCtrInherit" style="">&nbsp;</td>
												<td class="styTableCellCtrInherit" style="border-right-width:0px;">&nbsp;</td>
											</tr>
										</xsl:if>
										<xsl:if test="count(PayorRelationBackYearGrp) &lt; 3">
											<tr>
												<td class="styTableCellCtrInherit" style="font-weight:bold;">(3)</td>
												<td class="styTableCellTextInherit" style="">&nbsp;</td>
												<td class="styTableCellCtrInherit" style="word-break:break-all;">&nbsp;</td>
												<td class="styTableCellCtrInherit" style="">&nbsp;</td>
												<td class="styTableCellCtrInherit" style="">&nbsp;</td>
												<td class="styTableCellCtrInherit" style="border-right-width:0px;">&nbsp;</td>
											</tr>
										</xsl:if>
									</xsl:for-each>
								</xsl:if>
								<xsl:if test="$sep1 or count($FormData/IncrAmtFrgnTaxesAccruedDtl) &lt; 1">
									<tr>
										<td class="styTableCellCtrInherit" rowspan="3" style="font-weight:bold;">
											A
										</td>
										<td class="styTableCellCtrInherit" rowspan="3" style="">
											<span style="width:22mm;height:3.5mm;border-bottom:1px solid black;">
												<xsl:choose>
													<xsl:when test="$sep1">
														See Add'l Data
													</xsl:when>
													<xsl:otherwise>&nbsp;</xsl:otherwise>
												</xsl:choose>
											</span>
										</td>
										<td class="styTableCellCtrInherit" style="font-weight:bold;">(1)</td>
										<td class="styTableCellTextInherit" style="">&nbsp;</td>
										<td class="styTableCellCtrInherit" style="">&nbsp;</td>
										<td class="styTableCellCtrInherit" style="">&nbsp;</td>
										<td class="styTableCellCtrInherit" style="">&nbsp;</td>
										<td class="styTableCellCtrInherit" style="border-right-width:0px;">&nbsp;</td>
									</tr>
									<tr>
										<td class="styTableCellCtrInherit" style="font-weight:bold;">(2)</td>
										<td class="styTableCellTextInherit" style="">&nbsp;</td>
										<td class="styTableCellCtrInherit" style="">&nbsp;</td>
										<td class="styTableCellCtrInherit" style="">&nbsp;</td>
										<td class="styTableCellCtrInherit" style="">&nbsp;</td>
										<td class="styTableCellCtrInherit" style="border-right-width:0px;">&nbsp;</td>
									</tr>
									<tr>
										<td class="styTableCellCtrInherit" style="font-weight:bold;">(3)</td>
										<td class="styTableCellTextInherit" style="">&nbsp;</td>
										<td class="styTableCellCtrInherit" style="">&nbsp;</td>
										<td class="styTableCellCtrInherit" style="">&nbsp;</td>
										<td class="styTableCellCtrInherit" style="">&nbsp;</td>
										<td class="styTableCellCtrInherit" style="border-right-width:0px;">&nbsp;</td>
									</tr>
								</xsl:if>
								<xsl:if test="$sep1 or count($FormData/IncrAmtFrgnTaxesAccruedDtl) &lt; 2">
									<tr>
										<td class="styTableCellCtrInherit" rowspan="3" style="font-weight:bold;">
											B
										</td>
										<td class="styTableCellCtrInherit" rowspan="3" style="">
											<span style="width:22mm;height:3.5mm;border-bottom:1px solid black;">&nbsp;</span>
										</td>
										<td class="styTableCellCtrInherit" style="font-weight:bold;">(1)</td>
										<td class="styTableCellTextInherit" style="">&nbsp;</td>
										<td class="styTableCellCtrInherit" style="">&nbsp;</td>
										<td class="styTableCellCtrInherit" style="">&nbsp;</td>
										<td class="styTableCellCtrInherit" style="">&nbsp;</td>
										<td class="styTableCellCtrInherit" style="border-right-width:0px;">&nbsp;</td>
									</tr>
									<tr>
										<td class="styTableCellCtrInherit" style="font-weight:bold;">(2)</td>
										<td class="styTableCellTextInherit" style="">&nbsp;</td>
										<td class="styTableCellCtrInherit" style="">&nbsp;</td>
										<td class="styTableCellCtrInherit" style="">&nbsp;</td>
										<td class="styTableCellCtrInherit" style="">&nbsp;</td>
										<td class="styTableCellCtrInherit" style="border-right-width:0px;">&nbsp;</td>
									</tr>
									<tr>
										<td class="styTableCellCtrInherit" style="font-weight:bold;">(3)</td>
										<td class="styTableCellTextInherit" style="">&nbsp;</td>
										<td class="styTableCellCtrInherit" style="">&nbsp;</td>
										<td class="styTableCellCtrInherit" style="">&nbsp;</td>
										<td class="styTableCellCtrInherit" style="">&nbsp;</td>
										<td class="styTableCellCtrInherit" style="border-right-width:0px;">&nbsp;</td>
									</tr>
								</xsl:if>
							</tbody>
						</table>
					</div>
					<div class="styTableContainerLandscapeNBB" id="Page1Table2">
						<xsl:call-template name="SetInitialState"/>
						<table class="styTable" style="border-collapse:collapse;font-size:7pt;">
							<thead class="styTableThead">
								<tr style="border-top:1px solid black;vertical-align:top;">
									<th class="styTableCellHeader" scope="col" style="width:8mm;font-weight:normal;background-color:lightgrey;">&nbsp;</th>
									<th class="styTableCellHeader" scope="col" style="width:11mm;font-weight:normal;background-color:lightgrey;">&nbsp;</th>
									<th class="styTableCellHeader" scope="col" style="width:26mm;font-weight:normal;padding:2mm 0mm;">
										<strong>6. </strong> Payor's Income <br /> Subject to Tax in the <br /> Foreign Jurisdiction <br /> (see instructions)
									</th>
									<th class="styTableCellHeader" scope="col" style="width:29mm;font-weight:normal;padding:2mm 0mm;">
										<strong>7. </strong> Additional Tax <br /> Accrued in <br /> Local Currency <br /> in Which the <br /> Tax Is Payable
									</th>
									<th class="styTableCellHeader" scope="col" style="width:29mm;font-weight:normal;padding:2mm 0mm;">
										<strong>8. </strong> Additional Tax <br /> Accrued in <br /> Functional Currency <br /> of Payor
									</th>
									<th class="styTableCellHeader" scope="col" style="width:37mm;font-weight:normal;padding:2mm 0mm;">
										<strong>9. </strong> Conversion Rate <br /> of Local Currency <br /> to U.S. Dollars
									</th>
									<th class="styTableCellHeader" scope="col" style="width:26mm;font-weight:normal;padding:2mm 0mm;">
										<strong>10. </strong> Additional Tax <br /> Accrued in <br /> U.S. Dollars <br /> (divide column 7 <br /> by column 9)
									</th>
									<th class="styTableCellHeader" scope="col" style="width:26mm;font-weight:normal;padding:2mm 0mm;">
										<strong>11. </strong> U.S. Dollar <br /> Tax of Payor <br /> Reported on <br /> Original/Amended Return
									</th>
									<th class="styTableCellHeader" scope="col" style="width:26mm;font-weight:normal;padding:2mm 0mm;">
										<strong>12. </strong> Revised Tax Accrued <br /> (add column 10 <br /> and column 11)
									</th>
									<th class="styTableCellHeader" scope="col" style="width:38mm;font-weight:normal;padding:2mm 0mm;border-right-width:0px;">
										<strong>13. </strong> Reference ID Number <br /> for Contested Tax, <br /> if Applicable <br /> (see instructions)
									</th>
								</tr>
							</thead>
							<tbody>
								<xsl:if test="not($sep1)">
									<xsl:for-each select="$FormData/IncrAmtFrgnTaxesAccruedDtl">
										<xsl:variable name="pos" select="position()"/>
										<tr>
											<td class="styTableCellCtrInherit" style="font-weight:bold;">
												<xsl:attribute name="rowspan">
													<xsl:choose>
														<xsl:when test="PayorRelationBackYearGrp[4]"><xsl:value-of select="count(PayorRelationBackYearGrp)"/></xsl:when>
														<xsl:otherwise>3</xsl:otherwise>
													</xsl:choose>
												</xsl:attribute>
												<xsl:number value="$pos" format="A"/>
											</td>
											<td class="styTableCellCtrInherit" style="font-weight:bold;">(1)</td>
											<td class="styTableCellAmtInherit" style="">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="PayorRelationBackYearGrp[1]/ForeignTaxableIncomeAmt"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellAmtInherit" style="">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="PayorRelationBackYearGrp[1]/AddnlTaxForeignCurrencyAmt"/>
													<xsl:with-param name="MaxSize" select="17"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellAmtInherit" style="">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="PayorRelationBackYearGrp[1]/AddnlTaxFunctionalCurrencyAmt"/>
													<xsl:with-param name="MaxSize" select="17"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellAmtInherit" style="word-break:break-all;">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="PayorRelationBackYearGrp[1]/ConversionRt"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellAmtInherit" style="">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="PayorRelationBackYearGrp[1]/AddnlTaxUSDollarsAmt"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellAmtInherit" style="">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="PayorRelationBackYearGrp[1]/TaxOriginalAmdRetAmt"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellAmtInherit" style="">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="PayorRelationBackYearGrp[1]/RevisedTaxAccruedAmt"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellCtrInherit" style="word-break:break-all;border-right-width:0px;">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="PayorRelationBackYearGrp[1]/ContestedTaxForeignEntityIdGrp/ForeignEntityReferenceIdNum"/>
												</xsl:call-template>
											</td>
										</tr>
										<xsl:for-each select="PayorRelationBackYearGrp[position() &gt; 1]">
											<tr>
												<td class="styTableCellCtrInherit" style="font-weight:bold;">
													(<xsl:value-of select="position() + 1"/>)
												</td>
												<td class="styTableCellAmtInherit" style="">
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="ForeignTaxableIncomeAmt"/>
													</xsl:call-template>
												</td>
												<td class="styTableCellAmtInherit" style="">
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="AddnlTaxForeignCurrencyAmt"/>
														<xsl:with-param name="MaxSize" select="17"/>
													</xsl:call-template>
												</td>
												<td class="styTableCellAmtInherit" style="">
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="AddnlTaxFunctionalCurrencyAmt"/>
														<xsl:with-param name="MaxSize" select="17"/>
													</xsl:call-template>
												</td>
												<td class="styTableCellAmtInherit" style="word-break:break-all;">
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="ConversionRt"/>
													</xsl:call-template>
												</td>
												<td class="styTableCellAmtInherit" style="">
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="AddnlTaxUSDollarsAmt"/>
													</xsl:call-template>
												</td>
												<td class="styTableCellAmtInherit" style="">
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="TaxOriginalAmdRetAmt"/>
													</xsl:call-template>
												</td>
												<td class="styTableCellAmtInherit" style="">
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="RevisedTaxAccruedAmt"/>
													</xsl:call-template>
												</td>
												<td class="styTableCellCtrInherit" style="word-break:break-all;border-right-width:0px;">
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="ContestedTaxForeignEntityIdGrp/ForeignEntityReferenceIdNum"/>
													</xsl:call-template>
												</td>
											</tr>
										</xsl:for-each>
										<xsl:if test="count(PayorRelationBackYearGrp) &lt; 2">
											<tr>
												<td class="styTableCellCtrInherit" style="font-weight:bold;">(2)</td>
												<td class="styTableCellAmtInherit" style="">&nbsp;</td>
												<td class="styTableCellAmtInherit" style="">&nbsp;</td>
												<td class="styTableCellAmtInherit" style="">&nbsp;</td>
												<td class="styTableCellAmtInherit" style="">&nbsp;</td>
												<td class="styTableCellAmtInherit" style="">&nbsp;</td>
												<td class="styTableCellAmtInherit" style="">&nbsp;</td>
												<td class="styTableCellAmtInherit" style="">&nbsp;</td>
												<td class="styTableCellCtrInherit" style="word-break:break-all;border-right-width:0px;">&nbsp;</td>
											</tr>
										</xsl:if>
										<xsl:if test="count(PayorRelationBackYearGrp) &lt; 3">
											<tr>
												<td class="styTableCellCtrInherit" style="font-weight:bold;">(3)</td>
												<td class="styTableCellAmtInherit" style="">&nbsp;</td>
												<td class="styTableCellAmtInherit" style="">&nbsp;</td>
												<td class="styTableCellAmtInherit" style="">&nbsp;</td>
												<td class="styTableCellAmtInherit" style="">&nbsp;</td>
												<td class="styTableCellAmtInherit" style="">&nbsp;</td>
												<td class="styTableCellAmtInherit" style="">&nbsp;</td>
												<td class="styTableCellAmtInherit" style="">&nbsp;</td>
												<td class="styTableCellCtrInherit" style="word-break:break-all;border-right-width:0px;">&nbsp;</td>
											</tr>
										</xsl:if>
										<tr style="vertical-align:bottom;">
											<td colspan="6" class="styTableCellTextInherit" style="">
												<strong>Subtotal by Relation Back Year of Taxpayer</strong><br />
												(add amounts in columns 10, 11, and 12) 
												<span class="sty1116SCDotLn">.....................</span>
											</td>
											<td class="styTableCellAmtInherit" style="">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="TotalAddnlTaxUSDollarsAmt"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellAmtInherit" style="">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="TotalTaxOriginalAmdRetAmt"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellAmtInherit" style="">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="TotalRevisedTaxAccruedAmt"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellCtrInherit" style="background-color:lightgrey;border-right-width:0px;">&nbsp;</td>
										</tr>
									</xsl:for-each>
								</xsl:if>
								<xsl:if test="$sep1 or count($FormData/IncrAmtFrgnTaxesAccruedDtl) &lt; 1">
									<tr>
										<td class="styTableCellCtrInherit" rowspan="3" style="font-weight:bold;">
											A
										</td>
										<td class="styTableCellCtrInherit" style="font-weight:bold;">(1)</td>
											<td class="styTableCellAmtInherit" style="">&nbsp;</td>
											<td class="styTableCellAmtInherit" style="">&nbsp;</td>
											<td class="styTableCellAmtInherit" style="">&nbsp;</td>
											<td class="styTableCellAmtInherit" style="">&nbsp;</td>
											<td class="styTableCellAmtInherit" style="">&nbsp;</td>
											<td class="styTableCellAmtInherit" style="">&nbsp;</td>
											<td class="styTableCellAmtInherit" style="">&nbsp;</td>
											<td class="styTableCellCtrInherit" style="word-break:break-all;border-right-width:0px;">&nbsp;</td>
									</tr>
									<tr>
										<td class="styTableCellCtrInherit" style="font-weight:bold;">(2)</td>
										<td class="styTableCellAmtInherit" style="">&nbsp;</td>
										<td class="styTableCellAmtInherit" style="">&nbsp;</td>
										<td class="styTableCellAmtInherit" style="">&nbsp;</td>
										<td class="styTableCellAmtInherit" style="">&nbsp;</td>
										<td class="styTableCellAmtInherit" style="">&nbsp;</td>
										<td class="styTableCellAmtInherit" style="">&nbsp;</td>
										<td class="styTableCellAmtInherit" style="">&nbsp;</td>
										<td class="styTableCellCtrInherit" style="word-break:break-all;border-right-width:0px;">&nbsp;</td>
									</tr>
									<tr>
										<td class="styTableCellCtrInherit" style="font-weight:bold;">(3)</td>
										<td class="styTableCellAmtInherit" style="">&nbsp;</td>
										<td class="styTableCellAmtInherit" style="">&nbsp;</td>
										<td class="styTableCellAmtInherit" style="">&nbsp;</td>
										<td class="styTableCellAmtInherit" style="">&nbsp;</td>
										<td class="styTableCellAmtInherit" style="">&nbsp;</td>
										<td class="styTableCellAmtInherit" style="">&nbsp;</td>
										<td class="styTableCellAmtInherit" style="">&nbsp;</td>
										<td class="styTableCellCtrInherit" style="word-break:break-all;border-right-width:0px;">&nbsp;</td>
									</tr>
									<tr style="vertical-align:bottom;">
										<td colspan="6" class="styTableCellTextInherit" style="">
											<strong>Subtotal by Relation Back Year of Taxpayer</strong><br />
											(add amounts in columns 10, 11, and 12) 
											<span class="sty1116SCDotLn">.....................</span>
										</td>
										<td class="styTableCellAmtInherit" style="">&nbsp;</td>
										<td class="styTableCellAmtInherit" style="">&nbsp;</td>
										<td class="styTableCellAmtInherit" style="">&nbsp;</td>
										<td class="styTableCellCtrInherit" style="background-color:lightgrey;border-right-width:0px;">&nbsp;</td>
									</tr>
								</xsl:if>
								<xsl:if test="$sep1 or count($FormData/IncrAmtFrgnTaxesAccruedDtl) &lt; 2">
									<tr>
										<td class="styTableCellCtrInherit" rowspan="3" style="font-weight:bold;">
											B
										</td>
										<td class="styTableCellCtrInherit" style="font-weight:bold;">(1)</td>
											<td class="styTableCellAmtInherit" style="">&nbsp;</td>
											<td class="styTableCellAmtInherit" style="">&nbsp;</td>
											<td class="styTableCellAmtInherit" style="">&nbsp;</td>
											<td class="styTableCellAmtInherit" style="">&nbsp;</td>
											<td class="styTableCellAmtInherit" style="">&nbsp;</td>
											<td class="styTableCellAmtInherit" style="">&nbsp;</td>
											<td class="styTableCellAmtInherit" style="">&nbsp;</td>
											<td class="styTableCellCtrInherit" style="word-break:break-all;border-right-width:0px;">&nbsp;</td>
									</tr>
									<tr>
										<td class="styTableCellCtrInherit" style="font-weight:bold;">(2)</td>
										<td class="styTableCellAmtInherit" style="">&nbsp;</td>
										<td class="styTableCellAmtInherit" style="">&nbsp;</td>
										<td class="styTableCellAmtInherit" style="">&nbsp;</td>
										<td class="styTableCellAmtInherit" style="">&nbsp;</td>
										<td class="styTableCellAmtInherit" style="">&nbsp;</td>
										<td class="styTableCellAmtInherit" style="">&nbsp;</td>
										<td class="styTableCellAmtInherit" style="">&nbsp;</td>
										<td class="styTableCellCtrInherit" style="word-break:break-all;border-right-width:0px;">&nbsp;</td>
									</tr>
									<tr>
										<td class="styTableCellCtrInherit" style="font-weight:bold;">(3)</td>
										<td class="styTableCellAmtInherit" style="">&nbsp;</td>
										<td class="styTableCellAmtInherit" style="">&nbsp;</td>
										<td class="styTableCellAmtInherit" style="">&nbsp;</td>
										<td class="styTableCellAmtInherit" style="">&nbsp;</td>
										<td class="styTableCellAmtInherit" style="">&nbsp;</td>
										<td class="styTableCellAmtInherit" style="">&nbsp;</td>
										<td class="styTableCellAmtInherit" style="">&nbsp;</td>
										<td class="styTableCellCtrInherit" style="word-break:break-all;border-right-width:0px;">&nbsp;</td>
									</tr>
									<tr style="vertical-align:bottom;">
										<td colspan="6" class="styTableCellTextInherit" style="">
											<strong>Subtotal by Relation Back Year of Taxpayer</strong><br />
											(add amounts in columns 10, 11, and 12) 
											<span class="sty1116SCDotLn">.....................</span>
										</td>
										<td class="styTableCellAmtInherit" style="">&nbsp;</td>
										<td class="styTableCellAmtInherit" style="">&nbsp;</td>
										<td class="styTableCellAmtInherit" style="">&nbsp;</td>
										<td class="styTableCellCtrInherit" style="background-color:lightgrey;border-right-width:0px;">&nbsp;</td>
									</tr>
								</xsl:if>
							</tbody>
						</table>
					</div>
					<div class="styStdDivLS pageEnd" style="border-top:2px solid black;font-weight:bold;">
						For Privacy Act and Paperwork Reduction Act Notice, see the separate instructions. 
						<span style="margin-left:50mm;font-weight:normal;">Cat. No. 75187Q</span>
						<span style="float:right;">Schedule C (Form 1116) (Rev. 12-2025)</span>
					</div>
					<!-- Page 2 -->
					<div class="styStdDivLS">
						Schedule C (Form 1116) (Rev. 12-2025)
						<span style="float:right;">Page <span style="font-weight:bold;font-size:8pt;">2</span></span>
					</div>
					<!-- Part 2 -->
					<div class="styStdDivLS" style="width:256mm;margin-top:1mm;border-top:1px solid black;border-bottom:1px solid black;">
						<div class="styPartName" style="height:auto;padding-top:1mm;padding-bottom:1mm;">Part II</div>
						<div class="styPartDesc" style="height:auto;padding-top:1mm;padding-bottom:1mm;">
							Decrease in Amount of Foreign Taxes Paid or Accrued <span style="font-weight:normal;">(see instructions)</span>
						</div>
					</div>
					<div class="styStdDivLS">
						<div class="styLNDesc" style="width:100%">
							Enter redetermined amounts by payor for each separate relation back year (starting with the most recent) followed by a subtotal for each relation back year.
						</div>
					</div>
					<xsl:variable name="sep2" select="($Print = $Separated) and ((count($FormData/DecrAmtFrgnTaxesPdAccruedDtl) &gt; 2) or (count($FormData/DecrAmtFrgnTaxesPdAccruedDtl/DecrPayorRelationBackYrGrp) &gt; 6))"/>
					<div class="styTableContainerLandscapeNBB" id="Page2Table1">
						<xsl:call-template name="SetInitialState"/>
						<table class="styTable" style="border-collapse:collapse;font-size:7pt;">
							<thead class="styTableThead">
								<tr style="border-top:1px solid black;">
									<th class="styTableCellHeader" scope="col" style="width:8mm;font-weight:normal;background-color:lightgrey;">&nbsp;</th>
									<th class="styTableCellHeader" scope="col" style="width:27mm;font-weight:normal;">
										<strong>1. </strong> U.S. Tax Year <br /> of Taxpayer to <br /> Which Tax Relates <br />
										(relation back year) <br /> (MM/DD/YYYY)
									</th>
									<th class="styTableCellHeader" scope="col" style="width:11mm;font-weight:normal;background-color:lightgrey;">&nbsp;</th>
									<th class="styTableCellHeader" scope="col" style="width:68mm;font-weight:normal;">
										<strong>2a. </strong> Name of Payor <br /> (see instructions)
									</th>
									<th class="styTableCellHeader" scope="col" style="width:77mm;font-weight:normal;">
										<strong>2b. </strong> EIN or Reference ID Number <br /> of Payor <br /> (see instructions)
									</th>
									<th class="styTableCellHeader" scope="col" style="width:23mm;font-weight:normal;">
										<strong>3. </strong> Country or <br /> U.S. Possession <br /> From Which Tax <br /> Was Refunded <br /> or Deemed Refunded  <br />
										(enter code &mdash; <br /> see instructions)
									</th>
									<th class="styTableCellHeader" scope="col" style="width:23mm;font-weight:normal;">
										<strong>4. </strong> Date <br /> Foreign Tax <br /> Was Refunded <br /> or Deemed Refunded <br /> (MM/DD/YYYY) <br /> (see instructions)
									</th>
									<th class="styTableCellHeader" scope="col" style="width:21mm;font-weight:normal;border-right-width:0px;">
										<strong>5. </strong> Foreign <br /> Tax Year <br /> to Which <br /> Tax Relates <br /> (MM/DD/YYYY)
									</th>
								</tr>
							</thead>
							<tbody>
								<xsl:if test="not($sep2)">
									<xsl:for-each select="$FormData/DecrAmtFrgnTaxesPdAccruedDtl">
										<xsl:variable name="pos" select="position()"/>
										<tr>
											<td class="styTableCellCtrInherit" style="font-weight:bold;">
												<xsl:attribute name="rowspan">
													<xsl:choose>
														<xsl:when test="DecrPayorRelationBackYrGrp[4]"><xsl:value-of select="count(DecrPayorRelationBackYrGrp)"/></xsl:when>
														<xsl:otherwise>3</xsl:otherwise>
													</xsl:choose>
												</xsl:attribute>
												<xsl:number value="$pos" format="A"/>
											</td>
											<td class="styTableCellCtrInherit" style="">
												<xsl:attribute name="rowspan">
													<xsl:choose>
														<xsl:when test="DecrPayorRelationBackYrGrp[4]"><xsl:value-of select="count(DecrPayorRelationBackYrGrp)"/></xsl:when>
														<xsl:otherwise>3</xsl:otherwise>
													</xsl:choose>
												</xsl:attribute>
												<span style="width:22mm;height:3.5mm;border-bottom:1px solid black;">
													<xsl:call-template name="PopulateMonthDayYear">
														<xsl:with-param name="TargetNode" select="USTaxYearEndDt"/>
													</xsl:call-template>
												</span>
											</td>
											<td class="styTableCellCtrInherit" style="font-weight:bold;">(1)</td>
											<td class="styTableCellTextInherit" style="">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="DecrPayorRelationBackYrGrp[1]/PayorName/BusinessNameLine1Txt"/>
												</xsl:call-template>
												<xsl:if test="DecrPayorRelationBackYrGrp[1]/PayorName/BusinessNameLine2Txt">
													<br />
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="DecrPayorRelationBackYrGrp[1]/PayorName/BusinessNameLine2Txt"/>
													</xsl:call-template>
												</xsl:if>
											</td>
											<td class="styTableCellCtrInherit" style="word-break:break-all;">
												<xsl:choose>
													<xsl:when test="DecrPayorRelationBackYrGrp[1]/ForeignEntityIdentificationGrp">
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="DecrPayorRelationBackYrGrp[1]/ForeignEntityIdentificationGrp/ForeignEntityReferenceIdNum"/>
														</xsl:call-template>
													</xsl:when>
													<xsl:otherwise>
														<xsl:call-template name="PopulateEIN">
															<xsl:with-param name="TargetNode" select="DecrPayorRelationBackYrGrp[1]/PayorEIN"/>
														</xsl:call-template>
													</xsl:otherwise>
												</xsl:choose>
											</td>
											<td class="styTableCellCtrInherit" style="">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="DecrPayorRelationBackYrGrp[1]/ForeignCountryOrUSPossessionCd"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellCtrInherit" style="">
												<xsl:call-template name="PopulateMonthDayYear">
													<xsl:with-param name="TargetNode" select="DecrPayorRelationBackYrGrp[1]/ForeignTaxRefundedDt"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellCtrInherit" style="border-right-width:0px;">
												<xsl:call-template name="PopulateMonthDayYear">
													<xsl:with-param name="TargetNode" select="DecrPayorRelationBackYrGrp[1]/ForeignTaxYearEndDt"/>
												</xsl:call-template>
											</td>
										</tr>
										<xsl:for-each select="DecrPayorRelationBackYrGrp[position() &gt; 1]">
											<tr>
												<td class="styTableCellCtrInherit" style="font-weight:bold;">
													(<xsl:value-of select="position() + 1"/>)
												</td>
												<td class="styTableCellTextInherit" style="">
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="PayorName/BusinessNameLine1Txt"/>
													</xsl:call-template>
													<xsl:if test="PayorName/BusinessNameLine2Txt">
														<br />
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="PayorName/BusinessNameLine2Txt"/>
														</xsl:call-template>
													</xsl:if>
												</td>
												<td class="styTableCellCtrInherit" style="word-break:break-all;">
													<xsl:choose>
														<xsl:when test="ForeignEntityIdentificationGrp">
															<xsl:call-template name="PopulateText">
																<xsl:with-param name="TargetNode" select="ForeignEntityIdentificationGrp/ForeignEntityReferenceIdNum"/>
															</xsl:call-template>
														</xsl:when>
														<xsl:otherwise>
															<xsl:call-template name="PopulateEIN">
																<xsl:with-param name="TargetNode" select="PayorEIN"/>
															</xsl:call-template>
														</xsl:otherwise>
													</xsl:choose>
												</td>
												<td class="styTableCellCtrInherit" style="">
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="ForeignCountryOrUSPossessionCd"/>
													</xsl:call-template>
												</td>
												<td class="styTableCellCtrInherit" style="">
													<xsl:call-template name="PopulateMonthDayYear">
														<xsl:with-param name="TargetNode" select="ForeignTaxRefundedDt"/>
													</xsl:call-template>
												</td>
												<td class="styTableCellCtrInherit" style="border-right-width:0px;">
													<xsl:call-template name="PopulateMonthDayYear">
														<xsl:with-param name="TargetNode" select="ForeignTaxYearEndDt"/>
													</xsl:call-template>
												</td>
											</tr>
										</xsl:for-each>
										<xsl:if test="count(DecrPayorRelationBackYrGrp) &lt; 2">
											<tr>
												<td class="styTableCellCtrInherit" style="font-weight:bold;">(2)</td>
												<td class="styTableCellTextInherit" style="">&nbsp;</td>
												<td class="styTableCellCtrInherit" style="word-break:break-all;">&nbsp;</td>
												<td class="styTableCellCtrInherit" style="">&nbsp;</td>
												<td class="styTableCellCtrInherit" style="">&nbsp;</td>
												<td class="styTableCellCtrInherit" style="border-right-width:0px;">&nbsp;</td>
											</tr>
										</xsl:if>
										<xsl:if test="count(DecrPayorRelationBackYrGrp) &lt; 3">
											<tr>
												<td class="styTableCellCtrInherit" style="font-weight:bold;">(3)</td>
												<td class="styTableCellTextInherit" style="">&nbsp;</td>
												<td class="styTableCellCtrInherit" style="word-break:break-all;">&nbsp;</td>
												<td class="styTableCellCtrInherit" style="">&nbsp;</td>
												<td class="styTableCellCtrInherit" style="">&nbsp;</td>
												<td class="styTableCellCtrInherit" style="border-right-width:0px;">&nbsp;</td>
											</tr>
										</xsl:if>
									</xsl:for-each>
								</xsl:if>
								<xsl:if test="$sep2 or count($FormData/DecrAmtFrgnTaxesPdAccruedDtl) &lt; 1">
									<tr>
										<td class="styTableCellCtrInherit" rowspan="3" style="font-weight:bold;">
											A
										</td>
										<td class="styTableCellCtrInherit" rowspan="3" style="">
											<span style="width:22mm;height:3.5mm;border-bottom:1px solid black;">
												<xsl:choose>
													<xsl:when test="$sep2">
														See Add'l Data
													</xsl:when>
													<xsl:otherwise>&nbsp;</xsl:otherwise>
												</xsl:choose>
											</span>
										</td>
										<td class="styTableCellCtrInherit" style="font-weight:bold;">(1)</td>
										<td class="styTableCellTextInherit" style="">&nbsp;</td>
										<td class="styTableCellCtrInherit" style="">&nbsp;</td>
										<td class="styTableCellCtrInherit" style="">&nbsp;</td>
										<td class="styTableCellCtrInherit" style="">&nbsp;</td>
										<td class="styTableCellCtrInherit" style="border-right-width:0px;">&nbsp;</td>
									</tr>
									<tr>
										<td class="styTableCellCtrInherit" style="font-weight:bold;">(2)</td>
										<td class="styTableCellTextInherit" style="">&nbsp;</td>
										<td class="styTableCellCtrInherit" style="">&nbsp;</td>
										<td class="styTableCellCtrInherit" style="">&nbsp;</td>
										<td class="styTableCellCtrInherit" style="">&nbsp;</td>
										<td class="styTableCellCtrInherit" style="border-right-width:0px;">&nbsp;</td>
									</tr>
									<tr>
										<td class="styTableCellCtrInherit" style="font-weight:bold;">(3)</td>
										<td class="styTableCellTextInherit" style="">&nbsp;</td>
										<td class="styTableCellCtrInherit" style="">&nbsp;</td>
										<td class="styTableCellCtrInherit" style="">&nbsp;</td>
										<td class="styTableCellCtrInherit" style="">&nbsp;</td>
										<td class="styTableCellCtrInherit" style="border-right-width:0px;">&nbsp;</td>
									</tr>
								</xsl:if>
								<xsl:if test="$sep2 or count($FormData/DecrAmtFrgnTaxesPdAccruedDtl) &lt; 2">
									<tr>
										<td class="styTableCellCtrInherit" rowspan="3" style="font-weight:bold;">
											B
										</td>
										<td class="styTableCellCtrInherit" rowspan="3" style="">
											<span style="width:22mm;height:3.5mm;border-bottom:1px solid black;">&nbsp;</span>
										</td>
										<td class="styTableCellCtrInherit" style="font-weight:bold;">(1)</td>
										<td class="styTableCellTextInherit" style="">&nbsp;</td>
										<td class="styTableCellCtrInherit" style="">&nbsp;</td>
										<td class="styTableCellCtrInherit" style="">&nbsp;</td>
										<td class="styTableCellCtrInherit" style="">&nbsp;</td>
										<td class="styTableCellCtrInherit" style="border-right-width:0px;">&nbsp;</td>
									</tr>
									<tr>
										<td class="styTableCellCtrInherit" style="font-weight:bold;">(2)</td>
										<td class="styTableCellTextInherit" style="">&nbsp;</td>
										<td class="styTableCellCtrInherit" style="">&nbsp;</td>
										<td class="styTableCellCtrInherit" style="">&nbsp;</td>
										<td class="styTableCellCtrInherit" style="">&nbsp;</td>
										<td class="styTableCellCtrInherit" style="border-right-width:0px;">&nbsp;</td>
									</tr>
									<tr>
										<td class="styTableCellCtrInherit" style="font-weight:bold;">(3)</td>
										<td class="styTableCellTextInherit" style="">&nbsp;</td>
										<td class="styTableCellCtrInherit" style="">&nbsp;</td>
										<td class="styTableCellCtrInherit" style="">&nbsp;</td>
										<td class="styTableCellCtrInherit" style="">&nbsp;</td>
										<td class="styTableCellCtrInherit" style="border-right-width:0px;">&nbsp;</td>
									</tr>
								</xsl:if>
							</tbody>
						</table>
					</div>
					<div class="styTableContainerLandscapeNBB" id="Page2Table2">
						<xsl:call-template name="SetInitialState"/>
						<table class="styTable" style="border-collapse:collapse;font-size:7pt;">
							<thead class="styTableThead">
								<tr style="border-top:1px solid black;vertical-align:top;">
									<th class="styTableCellHeader" scope="col" style="width:8mm;font-weight:normal;background-color:lightgrey;">&nbsp;</th>
									<th class="styTableCellHeader" scope="col" style="width:11mm;font-weight:normal;background-color:lightgrey;">&nbsp;</th>
									<th class="styTableCellHeader" scope="col" style="width:30mm;font-weight:normal;padding:2mm 0mm;">
										<strong>6. </strong> Payor's Income <br /> Subject to Tax in the <br /> Foreign Jurisdiction <br /> (see instructions)
									</th>
									<th class="styTableCellHeader" scope="col" style="width:33mm;font-weight:normal;padding:2mm 0mm;">
										<strong>7. </strong> Tax Refunded <br /> Or Deemed Refunded <br /> in Local Currency in <br /> Which the Tax Is Payable
									</th>
									<th class="styTableCellHeader" scope="col" style="width:30mm;font-weight:normal;padding:2mm 0mm;">
										<strong>8. </strong> Refunded Amount <br /> in Functional Currency <br /> of Payor
									</th>
									<th class="styTableCellHeader" scope="col" style="width:38mm;font-weight:normal;padding:2mm 0mm;">
										<strong>9. </strong> Conversion Rate <br /> of Local Currency <br /> to U.S. Dollars
									</th>
									<th class="styTableCellHeader" scope="col" style="width:30mm;font-weight:normal;padding:2mm 0mm;">
										<strong>10. </strong> Refunded Amount <br /> in U.S. Dollars <br /> (divide column 7 <br /> by column 9)
									</th>
									<th class="styTableCellHeader" scope="col" style="width:27mm;font-weight:normal;padding:2mm 0mm;">
										<strong>11. </strong> U.S. Dollar <br /> Tax of Payor <br /> Reported on <br /> Original/Amended Return
									</th>
									<th class="styTableCellHeader" scope="col" style="width:27mm;font-weight:normal;padding:2mm 0mm;">
										<strong>12. </strong> Revised Tax Accrued <br /> (add column 10 <br /> and column 11)
									</th>
									<th class="styTableCellHeader" scope="col" style="width:31mm;font-weight:normal;padding:2mm 0mm;border-right-width:0px;">
										<strong>13. </strong> Check Box if <br /> Section 905(c)(2) <br /> Two Year Rule Applies <br /> (see instructions)
									</th>
								</tr>
							</thead>
							<tbody>
								<xsl:if test="not($sep2)">
									<xsl:for-each select="$FormData/DecrAmtFrgnTaxesPdAccruedDtl">
										<xsl:variable name="pos" select="position()"/>
										<tr>
											<td class="styTableCellCtrInherit" style="font-weight:bold;">
												<xsl:attribute name="rowspan">
													<xsl:choose>
														<xsl:when test="DecrPayorRelationBackYrGrp[4]"><xsl:value-of select="count(DecrPayorRelationBackYrGrp)"/></xsl:when>
														<xsl:otherwise>3</xsl:otherwise>
													</xsl:choose>
												</xsl:attribute>
												<xsl:number value="$pos" format="A"/>
											</td>
											<td class="styTableCellCtrInherit" style="font-weight:bold;">(1)</td>
											<td class="styTableCellAmtInherit" style="">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="DecrPayorRelationBackYrGrp[1]/ForeignTaxableIncomeAmt"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellAmtInherit" style="">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="DecrPayorRelationBackYrGrp[1]/TxRefundedInForeignCurrencyAmt"/>
													<xsl:with-param name="MaxSize" select="17"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellAmtInherit" style="">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="DecrPayorRelationBackYrGrp[1]/TxRefdInFunctionalCurrencyAmt"/>
													<xsl:with-param name="MaxSize" select="17"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellAmtInherit" style="word-break:break-all;">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="DecrPayorRelationBackYrGrp[1]/ConversionRt"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellAmtInherit" style="">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="DecrPayorRelationBackYrGrp[1]/RefundInUSDollarsAmt"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellAmtInherit" style="">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="DecrPayorRelationBackYrGrp[1]/TaxOriginalAmdRetAmt"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellAmtInherit" style="">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="DecrPayorRelationBackYrGrp[1]/RevisedTaxPaidAccruedAmt"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellCtrInherit" style="border-right-width:0px;">
												<input type="checkbox" class="styCkboxNM" aria-label="two year rule row A1">
													<xsl:attribute name="alt">Row <xsl:number value="$pos" format="A"/> subrow 1, Section 905 c 2 Two Year Rule</xsl:attribute>
													<xsl:call-template name="PopulateCheckbox">
														<xsl:with-param name="TargetNode" select="DecrPayorRelationBackYrGrp[1]/Section905c2TwoYrRuleInd"/>
														<xsl:with-param name="BackupName">F1116sC-p2-<xsl:value-of select="$pos"/>-1-Section905c2TwoYrRuleInd</xsl:with-param>
													</xsl:call-template>
												</input>
											</td>
										</tr>
										<xsl:for-each select="DecrPayorRelationBackYrGrp[position() &gt; 1]">
											<tr>
												<td class="styTableCellCtrInherit" style="font-weight:bold;">
													(<xsl:value-of select="position() + 1"/>)
												</td>
												<td class="styTableCellAmtInherit" style="">
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="ForeignTaxableIncomeAmt"/>
													</xsl:call-template>
												</td>
												<td class="styTableCellAmtInherit" style="">
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="TxRefundedInForeignCurrencyAmt"/>
														<xsl:with-param name="MaxSize" select="17"/>
													</xsl:call-template>
												</td>
												<td class="styTableCellAmtInherit" style="">
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="TxRefdInFunctionalCurrencyAmt"/>
														<xsl:with-param name="MaxSize" select="17"/>
													</xsl:call-template>
												</td>
												<td class="styTableCellAmtInherit" style="word-break:break-all;">
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="ConversionRt"/>
													</xsl:call-template>
												</td>
												<td class="styTableCellAmtInherit" style="">
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="RefundInUSDollarsAmt"/>
													</xsl:call-template>
												</td>
												<td class="styTableCellAmtInherit" style="">
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="TaxOriginalAmdRetAmt"/>
													</xsl:call-template>
												</td>
												<td class="styTableCellAmtInherit" style="">
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="RevisedTaxPaidAccruedAmt"/>
													</xsl:call-template>
												</td>
												<td class="styTableCellCtrInherit" style="border-right-width:0px;">
													<input type="checkbox" class="styCkboxNM" aria-label="two year rule row A2">
													<xsl:attribute name="alt">Row <xsl:number value="$pos" format="A"/> subrow <xsl:value-of select="position() + 1"/>, Section 905 c 2 Two Year Rule</xsl:attribute>
													<xsl:call-template name="PopulateCheckbox">
														<xsl:with-param name="TargetNode" select="Section905c2TwoYrRuleInd"/>
														<xsl:with-param name="BackupName">F1116sC-p2-<xsl:value-of select="$pos"/>-<xsl:value-of select="position() + 1"/>-Section905c2TwoYrRuleInd</xsl:with-param>
													</xsl:call-template>
												</input>
												</td>
											</tr>
										</xsl:for-each>
										<xsl:if test="count(DecrPayorRelationBackYrGrp) &lt; 2">
											<tr>
												<td class="styTableCellCtrInherit" style="font-weight:bold;">(2)</td>
												<td class="styTableCellAmtInherit" style="">&nbsp;</td>
												<td class="styTableCellAmtInherit" style="">&nbsp;</td>
												<td class="styTableCellAmtInherit" style="">&nbsp;</td>
												<td class="styTableCellAmtInherit" style="">&nbsp;</td>
												<td class="styTableCellAmtInherit" style="">&nbsp;</td>
												<td class="styTableCellAmtInherit" style="">&nbsp;</td>
												<td class="styTableCellAmtInherit" style="">&nbsp;</td>
												<td class="styTableCellCtrInherit" style="border-right-width:0px;">
													<input type="checkbox" class="styCkboxNM" aria-label="two year rule row A2">
														<xsl:attribute name="alt">Row <xsl:number value="$pos" format="A"/> subrow 2, Section 905 c 2 Two Year Rule</xsl:attribute>
														<xsl:call-template name="PopulateCheckbox">
															<xsl:with-param name="TargetNode" select="/.."/>
															<xsl:with-param name="BackupName">F1116sC-p2-<xsl:value-of select="$pos"/>-2-Section905c2TwoYrRuleInd</xsl:with-param>
														</xsl:call-template>
													</input>
												</td>
											</tr>
										</xsl:if>
										<xsl:if test="count(DecrPayorRelationBackYrGrp) &lt; 3">
											<tr>
												<td class="styTableCellCtrInherit" style="font-weight:bold;">(3)</td>
												<td class="styTableCellAmtInherit" style="">&nbsp;</td>
												<td class="styTableCellAmtInherit" style="">&nbsp;</td>
												<td class="styTableCellAmtInherit" style="">&nbsp;</td>
												<td class="styTableCellAmtInherit" style="">&nbsp;</td>
												<td class="styTableCellAmtInherit" style="">&nbsp;</td>
												<td class="styTableCellAmtInherit" style="">&nbsp;</td>
												<td class="styTableCellAmtInherit" style="">&nbsp;</td>
												<td class="styTableCellCtrInherit" style="border-right-width:0px;">
													<input type="checkbox" class="styCkboxNM" aria-label="two year rule row A3">
														<xsl:attribute name="alt">Row <xsl:number value="$pos" format="A"/> subrow 3, Section 905 c 2 Two Year Rule</xsl:attribute>
														<xsl:call-template name="PopulateCheckbox">
															<xsl:with-param name="TargetNode" select="/.."/>
															<xsl:with-param name="BackupName">F1116sC-p2-<xsl:value-of select="$pos"/>-3-Section905c2TwoYrRuleInd</xsl:with-param>
														</xsl:call-template>
													</input>
												</td>
											</tr>
										</xsl:if>
										<tr style="vertical-align:bottom;">
											<td colspan="6" class="styTableCellTextInherit" style="">
												<strong>Subtotal by Relation Back Year of Taxpayer</strong><br />
												(add amounts in columns 10, 11, and 12) 
												<span class="sty1116SCDotLn">.....................</span>
											</td>
											<td class="styTableCellAmtInherit" style="">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="TotalRefundInUSDollarsAmt"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellAmtInherit" style="">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="TotalTaxOriginalAmdRetAmt"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellAmtInherit" style="">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="TotalRevisedTaxPaidAccruedAmt"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellCtrInherit" style="background-color:lightgrey;border-right-width:0px;">&nbsp;</td>
										</tr>
									</xsl:for-each>
								</xsl:if>
								<xsl:if test="$sep2 or count($FormData/DecrAmtFrgnTaxesPdAccruedDtl) &lt; 1">
									<tr>
										<td class="styTableCellCtrInherit" rowspan="3" style="font-weight:bold;">
											A
										</td>
										<td class="styTableCellCtrInherit" style="font-weight:bold;">(1)</td>
										<td class="styTableCellAmtInherit" style="">&nbsp;</td>
										<td class="styTableCellAmtInherit" style="">&nbsp;</td>
										<td class="styTableCellAmtInherit" style="">&nbsp;</td>
										<td class="styTableCellAmtInherit" style="">&nbsp;</td>
										<td class="styTableCellAmtInherit" style="">&nbsp;</td>
										<td class="styTableCellAmtInherit" style="">&nbsp;</td>
										<td class="styTableCellAmtInherit" style="">&nbsp;</td>
										<td class="styTableCellCtrInherit" style="border-right-width:0px;">
											<input type="checkbox" class="styCkboxNM" aria-label="two year rule row A1">
												<xsl:attribute name="alt">Row A subrow 1, Section 905 c 2 Two Year Rule</xsl:attribute>
												<xsl:call-template name="PopulateCheckbox">
													<xsl:with-param name="TargetNode" select="/.."/>
													<xsl:with-param name="BackupName">F1116sC-p2-A-1-Section905c2TwoYrRuleInd</xsl:with-param>
												</xsl:call-template>
											</input>
										</td>
									</tr>
									<tr>
										<td class="styTableCellCtrInherit" style="font-weight:bold;">(2)</td>
										<td class="styTableCellAmtInherit" style="">&nbsp;</td>
										<td class="styTableCellAmtInherit" style="">&nbsp;</td>
										<td class="styTableCellAmtInherit" style="">&nbsp;</td>
										<td class="styTableCellAmtInherit" style="">&nbsp;</td>
										<td class="styTableCellAmtInherit" style="">&nbsp;</td>
										<td class="styTableCellAmtInherit" style="">&nbsp;</td>
										<td class="styTableCellAmtInherit" style="">&nbsp;</td>
										<td class="styTableCellCtrInherit" style="border-right-width:0px;">
											<input type="checkbox" class="styCkboxNM" aria-label="two year rule row A2">
												<xsl:attribute name="alt">Row A subrow 2, Section 905 c 2 Two Year Rule</xsl:attribute>
												<xsl:call-template name="PopulateCheckbox">
													<xsl:with-param name="TargetNode" select="/.."/>
													<xsl:with-param name="BackupName">F1116sC-p2-A-2-Section905c2TwoYrRuleInd</xsl:with-param>
												</xsl:call-template>
											</input>
										</td>
									</tr>
									<tr>
										<td class="styTableCellCtrInherit" style="font-weight:bold;">(3)</td>
										<td class="styTableCellAmtInherit" style="">&nbsp;</td>
										<td class="styTableCellAmtInherit" style="">&nbsp;</td>
										<td class="styTableCellAmtInherit" style="">&nbsp;</td>
										<td class="styTableCellAmtInherit" style="">&nbsp;</td>
										<td class="styTableCellAmtInherit" style="">&nbsp;</td>
										<td class="styTableCellAmtInherit" style="">&nbsp;</td>
										<td class="styTableCellAmtInherit" style="">&nbsp;</td>
										<td class="styTableCellCtrInherit" style="border-right-width:0px;">
											<input type="checkbox" class="styCkboxNM" aria-label="two year rule row A3">
												<xsl:attribute name="alt">Row A subrow 3, Section 905 c 2 Two Year Rule</xsl:attribute>
												<xsl:call-template name="PopulateCheckbox">
													<xsl:with-param name="TargetNode" select="/.."/>
													<xsl:with-param name="BackupName">F1116sC-p2-A-3-Section905c2TwoYrRuleInd</xsl:with-param>
												</xsl:call-template>
											</input>
										</td>
									</tr>
									<tr style="vertical-align:bottom;">
										<td colspan="6" class="styTableCellTextInherit" style="">
											<strong>Subtotal by Relation Back Year of Taxpayer</strong><br />
											(add amounts in columns 10, 11, and 12) 
											<span class="sty1116SCDotLn">.....................</span>
										</td>
										<td class="styTableCellAmtInherit" style="">&nbsp;</td>
										<td class="styTableCellAmtInherit" style="">&nbsp;</td>
										<td class="styTableCellAmtInherit" style="">&nbsp;</td>
										<td class="styTableCellCtrInherit" style="background-color:lightgrey;border-right-width:0px;">&nbsp;</td>
									</tr>
								</xsl:if>
								<xsl:if test="$sep2 or count($FormData/DecrAmtFrgnTaxesPdAccruedDtl) &lt; 2">
									<tr>
										<td class="styTableCellCtrInherit" rowspan="3" style="font-weight:bold;">
											B
										</td>
										<td class="styTableCellCtrInherit" style="font-weight:bold;">(1)</td>
										<td class="styTableCellAmtInherit" style="">&nbsp;</td>
										<td class="styTableCellAmtInherit" style="">&nbsp;</td>
										<td class="styTableCellAmtInherit" style="">&nbsp;</td>
										<td class="styTableCellAmtInherit" style="">&nbsp;</td>
										<td class="styTableCellAmtInherit" style="">&nbsp;</td>
										<td class="styTableCellAmtInherit" style="">&nbsp;</td>
										<td class="styTableCellAmtInherit" style="">&nbsp;</td>
										<td class="styTableCellCtrInherit" style="border-right-width:0px;">
											<input type="checkbox" class="styCkboxNM" aria-label="two year rule row B1">
												<xsl:attribute name="alt">Row B subrow 1, Section 905 c 2 Two Year Rule</xsl:attribute>
												<xsl:call-template name="PopulateCheckbox">
													<xsl:with-param name="TargetNode" select="/.."/>
													<xsl:with-param name="BackupName">F1116sC-p2-B-1-Section905c2TwoYrRuleInd</xsl:with-param>
												</xsl:call-template>
											</input>
										</td>
									</tr>
									<tr>
										<td class="styTableCellCtrInherit" style="font-weight:bold;">(2)</td>
										<td class="styTableCellAmtInherit" style="">&nbsp;</td>
										<td class="styTableCellAmtInherit" style="">&nbsp;</td>
										<td class="styTableCellAmtInherit" style="">&nbsp;</td>
										<td class="styTableCellAmtInherit" style="">&nbsp;</td>
										<td class="styTableCellAmtInherit" style="">&nbsp;</td>
										<td class="styTableCellAmtInherit" style="">&nbsp;</td>
										<td class="styTableCellAmtInherit" style="">&nbsp;</td>
										<td class="styTableCellCtrInherit" style="border-right-width:0px;">
											<input type="checkbox" class="styCkboxNM" aria-label="two year rule row B2">
												<xsl:attribute name="alt">Row B subrow 2, Section 905 c 2 Two Year Rule</xsl:attribute>
												<xsl:call-template name="PopulateCheckbox">
													<xsl:with-param name="TargetNode" select="/.."/>
													<xsl:with-param name="BackupName">F1116sC-p2-B-2-Section905c2TwoYrRuleInd</xsl:with-param>
												</xsl:call-template>
											</input>
										</td>
									</tr>
									<tr>
										<td class="styTableCellCtrInherit" style="font-weight:bold;">(3)</td>
										<td class="styTableCellAmtInherit" style="">&nbsp;</td>
										<td class="styTableCellAmtInherit" style="">&nbsp;</td>
										<td class="styTableCellAmtInherit" style="">&nbsp;</td>
										<td class="styTableCellAmtInherit" style="">&nbsp;</td>
										<td class="styTableCellAmtInherit" style="">&nbsp;</td>
										<td class="styTableCellAmtInherit" style="">&nbsp;</td>
										<td class="styTableCellAmtInherit" style="">&nbsp;</td>
										<td class="styTableCellCtrInherit" style="border-right-width:0px;">
											<input type="checkbox" class="styCkboxNM" aria-label="two year rule row B3">
												<xsl:attribute name="alt">Row B subrow 3, Section 905 c 2 Two Year Rule</xsl:attribute>
												<xsl:call-template name="PopulateCheckbox">
													<xsl:with-param name="TargetNode" select="/.."/>
													<xsl:with-param name="BackupName">F1116sC-p2-B-3-Section905c2TwoYrRuleInd</xsl:with-param>
												</xsl:call-template>
											</input>
										</td>
									</tr>
									<tr style="vertical-align:bottom;">
										<td colspan="6" class="styTableCellTextInherit" style="">
											<strong>Subtotal by Relation Back Year of Taxpayer</strong><br />
											(add amounts in columns 10, 11, and 12) 
											<span class="sty1116SCDotLn">.....................</span>
										</td>
										<td class="styTableCellAmtInherit" style="">&nbsp;</td>
										<td class="styTableCellAmtInherit" style="">&nbsp;</td>
										<td class="styTableCellAmtInherit" style="">&nbsp;</td>
										<td class="styTableCellCtrInherit" style="background-color:lightgrey;border-right-width:0px;">&nbsp;</td>
									</tr>
								</xsl:if>
							</tbody>
						</table>
					</div>
					<!-- Part 3 -->
					<div class="styStdDivLS" style="width:256mm;margin-top:1mm;border-top:1px solid black;border-bottom:1px solid black;">
						<div class="styPartName" style="height:auto;padding-top:1mm;padding-bottom:1mm;">Part III</div>
						<div class="styPartDesc" style="height:auto;padding-top:1mm;padding-bottom:1mm;">
							Change in Foreign Taxes Paid or Accrued 
						</div>
					</div>
					<div class="styStdDivLS">
						<div class="styLNDesc" style="width:100%;height:auto;">
							Enter the information below for the change to the total amount of foreign taxes paid or accrued and the foreign tax credits (FTCs) claimed for each relation back year.
						</div>
					</div>
					<xsl:variable name="sep3" select="($Print = $Separated) and (count($FormData/ChangeFrgnTxsPdAccruedGrp) &gt; 2)"/>
					<div class="styTableContainerLandscapeNBB" id="Part3Table">
						<xsl:call-template name="SetInitialState"/>
						<table class="styTable" style="border-collapse:collapse;font-size:7pt;">
							<thead class="styTableThead">
								<tr style="border-top:1px solid black;vertical-align:top;">
									<th class="styTableCellHeader" scope="col" style="width:8mm;font-weight:normal;background-color:lightgrey;">&nbsp;</th>
									<th class="styTableCellHeader" scope="col" style="width:51mm;font-weight:normal;padding:2mm 0mm;">
										<strong>1. </strong> Relation Back Year <br /> (MM/DD/YYYY)
									</th>
									<th class="styTableCellHeader" scope="col" style="width:49mm;font-weight:normal;padding:2mm 0mm;">
										<strong>2. </strong> Redetermined Foreign Taxes <br /> Paid or Accrued
									</th>
									<th class="styTableCellHeader" scope="col" style="width:49mm;font-weight:normal;padding:2mm 0mm;">
										<strong>3. </strong> Foreign Taxes Paid or Accrued <br /> per Original/Amended Return
									</th>
									<th class="styTableCellHeader" scope="col" style="width:49mm;font-weight:normal;padding:2mm 0mm;">
										<strong>4. </strong> Amount of FTC Claimed <br /> per Original/Amended Return
									</th>
									<th class="styTableCellHeader" scope="col" style="width:49mm;font-weight:normal;padding:2mm 0mm;border-right-width:0px;">
										<strong>5. </strong> Amount of FTC Claimed <br /> After Redetermination
									</th>
								</tr>
							</thead>
							<tbody>
								<xsl:if test="not($sep3)">
									<xsl:for-each select="$FormData/ChangeFrgnTxsPdAccruedGrp">
										<tr>
											<td class="styTableCellCtrInherit" style="font-weight:bold;">
												<xsl:number value="position()" format="A"/>
											</td>
											<td class="styTableCellCtrInherit" style="">
												<xsl:call-template name="PopulateMonthDayYear">
													<xsl:with-param name="TargetNode" select="USTaxYearEndDt"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellAmtInherit" style="">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="RedetermFrgnTxsPdAccruedAmt"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellAmtInherit" style="">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="FrgnTxsPdAccruedPerReturnAmt"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellAmtInherit" style="">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="FTCClmPerReturnAmt"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellAmtInherit" style="border-right-width:0px;">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="FTCClmRedetermAmt"/>
												</xsl:call-template>
											</td>
										</tr>
									</xsl:for-each>
								</xsl:if>
								<xsl:if test="$sep3 or count($FormData/ChangeFrgnTxsPdAccruedGrp) &lt; 1">
									<tr>
										<td class="styTableCellCtrInherit" style="font-weight:bold;">
											A
										</td>
										<td class="styTableCellCtrInherit" style="">
											<xsl:choose>
												<xsl:when test="$sep3">
													See Additional Data Table
												</xsl:when>
												<xsl:otherwise>&nbsp;</xsl:otherwise>
											</xsl:choose>
										</td>
										<td class="styTableCellAmtInherit" style="">&nbsp;</td>
										<td class="styTableCellAmtInherit" style="">&nbsp;</td>
										<td class="styTableCellAmtInherit" style="">&nbsp;</td>
										<td class="styTableCellAmtInherit" style="border-right-width:0px;">&nbsp;</td>
									</tr>
								</xsl:if>
								<xsl:if test="$sep3 or count($FormData/ChangeFrgnTxsPdAccruedGrp) &lt; 2">
									<tr>
										<td class="styTableCellCtrInherit" style="font-weight:bold;">
											B
										</td>
										<td class="styTableCellCtrInherit" style="">&nbsp;</td>
										<td class="styTableCellAmtInherit" style="">&nbsp;</td>
										<td class="styTableCellAmtInherit" style="">&nbsp;</td>
										<td class="styTableCellAmtInherit" style="">&nbsp;</td>
										<td class="styTableCellAmtInherit" style="border-right-width:0px;">&nbsp;</td>
									</tr>
								</xsl:if>
							</tbody>
						</table>
					</div>
					<!-- Part 4 -->
					<div class="styStdDivLS" style="width:256mm;margin-top:1mm;border-top:1px solid black;border-bottom:1px solid black;">
						<div class="styPartName" style="height:auto;padding-top:1mm;padding-bottom:1mm;">Part IV</div>
						<div class="styPartDesc" style="height:auto;padding-top:1mm;padding-bottom:1mm;">
							Change in U.S. Tax Liability
						</div>
					</div>
					<div class="styStdDivLS">
						<div class="styLNDesc" style="width:100%;height:auto;">
							Enter the information below for the change in U.S. tax liability for each relation back year and other affected year (see instructions).
						</div>
					</div>
					<xsl:variable name="sep4" select="($Print = $Separated) and (count($FormData/ChgUSTxLiabilityGrp) &gt; 2)"/>
					<div class="styTableContainerLandscapeNBB" id="Part4Table">
						<xsl:call-template name="SetInitialState"/>
						<table class="styTable" style="border-collapse:collapse;font-size:7pt;">
							<thead class="styTableThead">
								<tr style="border-top:1px solid black;vertical-align:top;">
									<th class="styTableCellHeader" scope="col" style="width:8mm;font-weight:normal;background-color:lightgrey;">&nbsp;</th>
									<th class="styTableCellHeader" scope="col" style="width:100mm;font-weight:normal;padding:2mm 0mm;">
										<strong>1. </strong> Relation Back Year or Affected Tax Year <br /> (MM/DD/YYYY)
									</th>
									<th class="styTableCellHeader" scope="col" style="width:49mm;font-weight:normal;padding:2mm 0mm;">
										<strong>2. </strong> Total Redetermined <br /> U.S. Tax Liability
									</th>
									<th class="styTableCellHeader" scope="col" style="width:49mm;font-weight:normal;padding:2mm 0mm;">
										<strong>3. </strong> Total U.S. Tax Liability <br /> per Original/Amended Return
									</th>
									<th class="styTableCellHeader" scope="col" style="width:49mm;font-weight:normal;padding:2mm 0mm;border-right-width:0px;">
										<strong>4. </strong> Difference <br /> (subtract column 3 from column 2)
									</th>
								</tr>
							</thead>
							<tbody>
								<xsl:if test="not($sep4)">
									<xsl:for-each select="$FormData/ChgUSTxLiabilityGrp">
										<tr>
											<td class="styTableCellCtrInherit" style="font-weight:bold;">
												<xsl:number value="position()" format="A"/>
											</td>
											<td class="styTableCellCtrInherit" style="">
												<xsl:call-template name="PopulateMonthDayYear">
													<xsl:with-param name="TargetNode" select="RlnBackYrOrAffectedTaxYrEndDt"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellAmtInherit" style="">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="TotRedetermUSTaxLiabilityAmt"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellAmtInherit" style="">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="TotUSTaxLiabilityPerReturnAmt"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellAmtInherit" style="border-right-width:0px">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="DifferenceBetweenTotalsAmt"/>
												</xsl:call-template>
											</td>
										</tr>
									</xsl:for-each>
								</xsl:if>
								<xsl:if test="$sep4 or count($FormData/ChgUSTxLiabilityGrp) &lt; 1">
									<tr>
										<td class="styTableCellCtrInherit" style="font-weight:bold;">
											A
										</td>
										<td class="styTableCellCtrInherit" style="">
											<xsl:choose>
												<xsl:when test="$sep4">
													See Additional Data Table
												</xsl:when>
												<xsl:otherwise>&nbsp;</xsl:otherwise>
											</xsl:choose>
										</td>
										<td class="styTableCellAmtInherit" style="">&nbsp;</td>
										<td class="styTableCellAmtInherit" style="">&nbsp;</td>
										<!--<td class="styTableCellAmtInherit" style="">&nbsp;</td>-->
										<td class="styTableCellAmtInherit" style="border-right-width:0px;">&nbsp;</td>
									</tr>
								</xsl:if>
								<xsl:if test="$sep4 or count($FormData/ChgUSTxLiabilityGrp) &lt; 2">
									<tr>
										<td class="styTableCellCtrInherit" style="font-weight:bold;">
											B
										</td>
										<td class="styTableCellCtrInherit" style="">&nbsp;</td>
										<td class="styTableCellAmtInherit" style="">&nbsp;</td>
										<td class="styTableCellAmtInherit" style="">&nbsp;</td>
										<!--<td class="styTableCellAmtInherit" style="">&nbsp;</td>-->
										<td class="styTableCellAmtInherit" style="border-right-width:0px;">&nbsp;</td>
									</tr>
								</xsl:if>
							</tbody>
						</table>
					</div>
					<div class="styStdDivLS pageEnd" style="border-top:1px solid black;font-weight:bold;">
						<span style="float:right;">Schedule C (Form 1116) (Rev. 12-2025)</span>
					</div>
					<!-- Page 3 -->
					<div class="styStdDivLS">
						Schedule C (Form 1116) (Rev. 12-2025)
						<span style="float:right;">Page <span style="font-weight:bold;font-size:8pt;">3</span></span>
					</div>
					<!-- Part 5 -->
					<div class="styStdDivLS" style="width:256mm;margin-top:1mm;border-top:1px solid black;border-bottom:1px solid black;">
						<div class="styPartName" style="height:auto;padding-top:1mm;padding-bottom:1mm;">Part V</div>
						<div class="styPartDesc" style="height:auto;padding-top:1mm;padding-bottom:1mm;">
							Annual Reporting for Contested Taxes
						</div>
					</div>
					<div class="styStdDivLS">
						<div class="styLNDesc" style="width:100%;height:auto;">
							Beginning with tax year 2023, taxpayers will enter the information below for each contested foreign tax liability for which the taxpayer has 
							previously made an election under Regulations section 1.905-1(d)(4) to claim a provisional foreign tax credit.
						</div>
					</div>
					<xsl:variable name="sep5" select="($Print = $Separated) and (count($FormData/AnnualRptgContestedTaxesGrp) &gt; 5)"/>
					<div class="styTableContainerLandscapeNBB" id="Part5Table1">
						<xsl:call-template name="SetInitialState"/>
						<table class="styTable" style="border-collapse:collapse;font-size:7pt;">
							<thead class="styTableThead">
								<tr style="border-top:1px solid black;vertical-align:top;">
									<th class="styTableCellHeader" scope="col" style="width:12mm;font-weight:normal;background-color:lightgrey;">&nbsp;</th>
									<th class="styTableCellHeader" scope="col" style="width:25mm;font-weight:normal;padding:2mm 0mm;">
										<strong>1. </strong> Relation Back Year <br /> (MM/DD/YYYY)
									</th>
									<th class="styTableCellHeader" scope="col" style="width:110mm;font-weight:normal;padding:2mm 0mm;">
										<strong>2. </strong> Name of Payor <br /> (see instructions)
									</th>
									<th class="styTableCellHeader" scope="col" style="width:84mm;font-weight:normal;padding:2mm 0mm;">
										<strong>3. </strong> Reference ID Number for the Contested Tax
									</th>
									<th class="styTableCellHeader" scope="col" style="width:25mm;font-weight:normal;padding:2mm 0mm;border-right-width:0px;">
										<strong>4. </strong> Country or U.S. Possession to Which Tax Was Paid (enter code - see instructions)
									</th>
								</tr>
							</thead>
							<tbody>
								<xsl:if test="not(sep5)">
									<xsl:for-each select="$FormData/AnnualRptgContestedTaxesGrp">
										<tr>
											<td class="styTableCellCtrInherit" style="font-weight:bold;">
												(<xsl:number value="position()" format="1"/>)
											</td>
											<td class="styTableCellCtrInherit" style="">
												<xsl:call-template name="PopulateMonthDayYear">
													<xsl:with-param name="TargetNode" select="USTaxYearEndDt"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellTextInherit" style="">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="PayorName/BusinessNameLine1Txt"/>
												</xsl:call-template>
												<xsl:if test="PayorName/BusinessNameLine2Txt">
													<br />
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="PayorName/BusinessNameLine2Txt"/>
													</xsl:call-template>
												</xsl:if>
											</td>
											<td class="styTableCellCtrInherit" style="word-break:break-all;">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="ContestedTaxForeignEntityIdGrp/ForeignEntityReferenceIdNum"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellCtrInherit" style="border-right-width:0px;">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="ForeignCountryOrUSPossessionCd"/>
												</xsl:call-template>
											</td>
										</tr>
									</xsl:for-each>
								</xsl:if>
								<xsl:if test="$sep5 or count($FormData/AnnualRptgContestedTaxesGrp) &lt; 1">
									<tr>
										<td class="styTableCellCtrInherit" style="font-weight:bold;">
											(1)
										</td>
										<td class="styTableCellCtrInherit" style="">
											<xsl:choose>
												<xsl:when test="$sep5">
													See Add'l Data
												</xsl:when>
												<xsl:otherwise>&nbsp;</xsl:otherwise>
											</xsl:choose>
										</td>
										<td class="styTableCellAmtInherit" style="">&nbsp;</td>
										<td class="styTableCellAmtInherit" style="">&nbsp;</td>
										<td class="styTableCellAmtInherit" style="border-right-width:0px;">&nbsp;</td>
									</tr>
								</xsl:if>
								<xsl:if test="$sep5 or count($FormData/AnnualRptgContestedTaxesGrp) &lt; 2">
									<tr>
										<td class="styTableCellCtrInherit" style="font-weight:bold;">
											(2)
										</td>
										<td class="styTableCellCtrInherit" style="">&nbsp;</td>
										<td class="styTableCellAmtInherit" style="">&nbsp;</td>
										<td class="styTableCellAmtInherit" style="">&nbsp;</td>
										<td class="styTableCellAmtInherit" style="border-right-width:0px;">&nbsp;</td>
									</tr>
								</xsl:if>
								<xsl:if test="$sep5 or count($FormData/AnnualRptgContestedTaxesGrp) &lt; 3">
									<tr>
										<td class="styTableCellCtrInherit" style="font-weight:bold;">
											(3)
										</td>
										<td class="styTableCellCtrInherit" style="">&nbsp;</td>
										<td class="styTableCellAmtInherit" style="">&nbsp;</td>
										<td class="styTableCellAmtInherit" style="">&nbsp;</td>
										<td class="styTableCellAmtInherit" style="border-right-width:0px;">&nbsp;</td>
									</tr>
								</xsl:if>
								<xsl:if test="$sep5 or count($FormData/AnnualRptgContestedTaxesGrp) &lt; 4">
									<tr>
										<td class="styTableCellCtrInherit" style="font-weight:bold;">
											(4)
										</td>
										<td class="styTableCellCtrInherit" style="">&nbsp;</td>
										<td class="styTableCellAmtInherit" style="">&nbsp;</td>
										<td class="styTableCellAmtInherit" style="">&nbsp;</td>
										<td class="styTableCellAmtInherit" style="border-right-width:0px;">&nbsp;</td>
									</tr>
								</xsl:if>
								<xsl:if test="$sep5 or count($FormData/AnnualRptgContestedTaxesGrp) &lt; 5">
									<tr>
										<td class="styTableCellCtrInherit" style="font-weight:bold;">
											(5)
										</td>
										<td class="styTableCellCtrInherit" style="">&nbsp;</td>
										<td class="styTableCellAmtInherit" style="">&nbsp;</td>
										<td class="styTableCellAmtInherit" style="">&nbsp;</td>
										<td class="styTableCellAmtInherit" style="border-right-width:0px;">&nbsp;</td>
									</tr>
								</xsl:if>
							</tbody>
						</table>
					</div>
					<div class="styTableContainerLandscapeNBB" id="Part5Table2">
						<xsl:call-template name="SetInitialState"/>
						<table class="styTable" style="border-collapse:collapse;font-size:7pt;">
							<thead class="styTableThead">
								<tr style="border-top:1px solid black;vertical-align:top;">
									<th class="styTableCellHeader" scope="col" style="width:12mm;font-weight:normal;background-color:lightgrey;">&nbsp;</th>
									<th class="styTableCellHeader" scope="col" style="width:44mm;font-weight:normal;padding:2mm 0mm;">
										<strong>5. </strong> Amount of Contested Tax <br /> Provisionally Claimed as Credit
									</th>
									<th class="styTableCellHeader" scope="col" style="width:40mm;font-weight:normal;padding:2mm 0mm;">
										<strong>6. </strong> Contest <br /> Ongoing
									</th>
									<th class="styTableCellHeader" scope="col" style="width:40mm;font-weight:normal;padding:2mm 0mm;">
										<strong>7. </strong> Contest <br /> Resolved
									</th>
									<th class="styTableCellHeader" scope="col" style="width:40mm;font-weight:normal;padding:2mm 0mm;">
										<strong>8. </strong> Date Contest <br /> Resolved <br /> (MM/DD/YYYY)
									</th>
									<th class="styTableCellHeader" scope="col" style="width:40mm;font-weight:normal;padding:2mm 0mm;">
										<strong>9. </strong> Tax Refunded, <br /> if Any <br /> (see instructions)
									</th>
									<th class="styTableCellHeader" scope="col" style="width:40mm;font-weight:normal;padding:2mm 0mm;border-right-width:0px;">
										<strong>10. </strong> Additional <br /> Tax Paid, if Any <br /> (see instructions)
									</th>
								</tr>
							</thead>
							<tbody>
								<xsl:if test="not($sep5)">
									<xsl:for-each select="$FormData/AnnualRptgContestedTaxesGrp">
										<tr>
											<td class="styTableCellCtrInherit" style="font-weight:bold;">
												(<xsl:number value="position()" format="1"/>)
											</td>
											<td class="styTableCellAmtInherit" style="">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="ContestedTaxPrvsnClmdCrAmt"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellCtrInherit" style="">
												<input type="checkbox" class="styCkboxNM" style="">
													<xsl:attribute name="alt">Row <xsl:value-of select="position()"/> Contest Ongoing</xsl:attribute>
													<xsl:call-template name="PopulateCheckbox">
														<xsl:with-param name="TargetNode" select="ContestOngoingInd"/>
														<xsl:with-param name="BackupName">F1116sC/ContestOngoingInd<xsl:value-of select="position()"/></xsl:with-param>
													</xsl:call-template>
												</input>
											</td>
											<td class="styTableCellCtrInherit" style="">
												<input type="checkbox" class="styCkboxNM" style="">
													<xsl:attribute name="alt">Row <xsl:value-of select="position()"/> Contest Resolved</xsl:attribute>
													<xsl:call-template name="PopulateCheckbox">
														<xsl:with-param name="TargetNode" select="ContestResolvedInd"/>
														<xsl:with-param name="BackupName">F1116sC/ContestResolvedInd<xsl:value-of select="position()"/></xsl:with-param>
													</xsl:call-template>
												</input>
											</td>
											<td class="styTableCellCtrInherit" style="">
												<xsl:call-template name="PopulateMonthDayYear">
													<xsl:with-param name="TargetNode" select="ContestResolvedDt"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellAmtInherit" style="border-right-width:0px;">
												<xsl:call-template name="PopulateAmount">
													<!-- Using TaxRefundedAmt per UWR 1012195 -->
													<xsl:with-param name="TargetNode" select="TaxRefundedAmt"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellAmtInherit" style="border-right-width:0px;">
												<xsl:call-template name="PopulateAmount">
													<!-- Using AdditionalTaxPaidAmt per UWR 1012195 -->
													<xsl:with-param name="TargetNode" select="AdditionalTaxPaidAmt"/>
												</xsl:call-template>
											</td>
										</tr>
									</xsl:for-each>
								</xsl:if>
								<xsl:if test="$sep5 or count($FormData/AnnualRptgContestedTaxesGrp) &lt; 1">
									<tr>
										<td class="styTableCellCtrInherit" style="font-weight:bold;">
											(1)
										</td>
										<td class="styTableCellCtrInherit" style="">&nbsp;</td>
										<td class="styTableCellCtrInherit" style="">
											<input type="checkbox" class="styCkboxNM" aria-label="Row 1 Contest Ongoing">
												<xsl:call-template name="PopulateCheckbox">
													<xsl:with-param name="TargetNode" select="/.."/>
													<xsl:with-param name="BackupName">F1116sC/ContestOngoingInd1</xsl:with-param>
												</xsl:call-template>
											</input>
										</td>
										<td class="styTableCellCtrInherit" style="">
											<input type="checkbox" class="styCkboxNM" aria-label="Row 1 Contest Resolved">
												<xsl:call-template name="PopulateCheckbox">
													<xsl:with-param name="TargetNode" select="/.."/>
													<xsl:with-param name="BackupName">F1116sC/ContestResolvedInd1</xsl:with-param>
												</xsl:call-template>
											</input>
										</td>
										<td class="styTableCellAmtInherit" style="">&nbsp;</td>
										<td class="styTableCellAmtInherit" style="">&nbsp;</td> 
										<td class="styTableCellAmtInherit" style="border-right-width:0px;">&nbsp;</td>
									</tr>
								</xsl:if>
								<xsl:if test="$sep5 or count($FormData/AnnualRptgContestedTaxesGrp) &lt; 2">
									<tr>
										<td class="styTableCellCtrInherit" style="font-weight:bold;">
											(2)
										</td>
										<td class="styTableCellCtrInherit" style="">&nbsp;</td>
										<td class="styTableCellCtrInherit" style="">
											<input type="checkbox" class="styCkboxNM" aria-label="Row 2 Contest Ongoing">
												<xsl:call-template name="PopulateCheckbox">
													<xsl:with-param name="TargetNode" select="/.."/>
													<xsl:with-param name="BackupName">F1116sC/ContestOngoingInd2</xsl:with-param>
												</xsl:call-template>
											</input>
										</td>
										<td class="styTableCellCtrInherit" style="">
											<input type="checkbox" class="styCkboxNM" aria-label="Row 2 Contest Resolved">
												<xsl:call-template name="PopulateCheckbox">
													<xsl:with-param name="TargetNode" select="/.."/>
													<xsl:with-param name="BackupName">F1116sC/ContestResolvedInd2</xsl:with-param>
												</xsl:call-template>
											</input>
										</td>
										<td class="styTableCellAmtInherit" style="">&nbsp;</td>
										<td class="styTableCellAmtInherit" style="">&nbsp;</td> 
										<td class="styTableCellAmtInherit" style="border-right-width:0px;">&nbsp;</td>
									</tr>
								</xsl:if>
								<xsl:if test="$sep5 or count($FormData/AnnualRptgContestedTaxesGrp) &lt; 3">
									<tr>
										<td class="styTableCellCtrInherit" style="font-weight:bold;">
											(3)
										</td>
										<td class="styTableCellCtrInherit" style="">&nbsp;</td>
										<td class="styTableCellCtrInherit" style="">
											<input type="checkbox" class="styCkboxNM" aria-label="Row 3 Contest Ongoing">
												<xsl:call-template name="PopulateCheckbox">
													<xsl:with-param name="TargetNode" select="/.."/>
													<xsl:with-param name="BackupName">F1116sC/ContestOngoingInd3</xsl:with-param>
												</xsl:call-template>
											</input>
										</td>
										<td class="styTableCellCtrInherit" style="">
											<input type="checkbox" class="styCkboxNM" aria-label="Row 3 Contest Resolved">
												<xsl:call-template name="PopulateCheckbox">
													<xsl:with-param name="TargetNode" select="/.."/>
													<xsl:with-param name="BackupName">F1116sC/ContestResolvedInd3</xsl:with-param>
												</xsl:call-template>
											</input>
										</td>
										<td class="styTableCellAmtInherit" style="">&nbsp;</td>
										<td class="styTableCellAmtInherit" style="">&nbsp;</td> 
										<td class="styTableCellAmtInherit" style="border-right-width:0px;">&nbsp;</td>
									</tr>
								</xsl:if>
								<xsl:if test="$sep5 or count($FormData/AnnualRptgContestedTaxesGrp) &lt; 4">
									<tr>
										<td class="styTableCellCtrInherit" style="font-weight:bold;">
											(4)
										</td>
										<td class="styTableCellCtrInherit" style="">&nbsp;</td>
										<td class="styTableCellCtrInherit" style="">
											<input type="checkbox" class="styCkboxNM" aria-label="Row 4 Contest Ongoing">
												<xsl:call-template name="PopulateCheckbox">
													<xsl:with-param name="TargetNode" select="/.."/>
													<xsl:with-param name="BackupName">F1116sC/ContestOngoingInd4</xsl:with-param>
												</xsl:call-template>
											</input>
										</td>
										<td class="styTableCellCtrInherit" style="">
											<input type="checkbox" class="styCkboxNM" aria-label="Row 4 Contest Resolved">
												<xsl:call-template name="PopulateCheckbox">
													<xsl:with-param name="TargetNode" select="/.."/>
													<xsl:with-param name="BackupName">F1116sC/ContestResolvedInd4</xsl:with-param>
												</xsl:call-template>
											</input>
										</td>
										<td class="styTableCellAmtInherit" style="">&nbsp;</td>
										<td class="styTableCellAmtInherit" style="">&nbsp;</td> 
										<td class="styTableCellAmtInherit" style="border-right-width:0px;">&nbsp;</td>
									</tr>
								</xsl:if>
								<xsl:if test="$sep5 or count($FormData/AnnualRptgContestedTaxesGrp) &lt; 5">
									<tr>
										<td class="styTableCellCtrInherit" style="font-weight:bold;">
											(5)
										</td>
										<td class="styTableCellCtrInherit" style="">&nbsp;</td>
										<td class="styTableCellCtrInherit" style="">
											<input type="checkbox" class="styCkboxNM" aria-label="Row 5 Contest Ongoing">
												<xsl:call-template name="PopulateCheckbox">
													<xsl:with-param name="TargetNode" select="/.."/>
													<xsl:with-param name="BackupName">F1116sC/ContestOngoingInd5</xsl:with-param>
												</xsl:call-template>
											</input>
										</td>
										<td class="styTableCellCtrInherit" style="">
											<input type="checkbox" class="styCkboxNM" aria-label="Row 5 Contest Resolved">
												<xsl:call-template name="PopulateCheckbox">
													<xsl:with-param name="TargetNode" select="/.."/>
													<xsl:with-param name="BackupName">F1116sC/ContestResolvedInd5</xsl:with-param>
												</xsl:call-template>
											</input>
										</td>
										<td class="styTableCellAmtInherit" style="">&nbsp;</td>
										<td class="styTableCellAmtInherit" style="">&nbsp;</td> 
										<td class="styTableCellAmtInherit" style="border-right-width:0px;">&nbsp;</td>
									</tr>
								</xsl:if>
							</tbody>
						</table>
					</div>
					<div class="styStdDivLS pageEnd" style="border-top:2px solid black;font-weight:bold;">
						<span style="float:right;">Schedule C (Form 1116) (Rev. 12-2025)</span>
					</div>
					<!-- Additonal Data Title Bar and Button -->
					<div class="styLeftOverTitleLine" id="LeftoverData">
						<div class="styLeftOverTitle">
						   Additional Data        
						</div>
						<div class="styLeftOverButtonContainer">
							<input class="styLeftoverTableBtn" type="button" TabIndex="-1" value="Return to Form" onclick="javascript:returnToWriteInImage();"/>
						</div>
					</div>
					<!-- Additional Data Table -->
					<table class="styLeftOverTbl">
						<xsl:call-template name="PopulateCommonLeftover">
							<xsl:with-param name="TargetNode" select="$FormData"/>
							<xsl:with-param name="DescWidth" select="100"/>
						</xsl:call-template>
					</table>
					<!-- Part 1 separated table -->
					<xsl:if test="$sep1">
						<br/>
						<br/>
						<span class="styRepeatingDataTitle">Part I - Increase in Amount of Foreign Taxes Accrued</span>
						<table class="styDepTblLandscape" style="font-size:7pt">
							<thead class="styTableHead">
								<tr class="styDepTblHdr">
									<th class="styDepTblCell" scope="col" style="width:8mm;font-weight:normal;">&nbsp;</th>
									<th class="styDepTblCell" scope="col" style="width:27mm;font-weight:normal;">
										<strong>1. </strong> U.S. Tax Year <br /> of Taxpayer to <br /> Which Tax Relates <br />
										(relation back year) <br /> (MM/DD/YYYY)
									</th>
									<th class="styDepTblCell" scope="col" style="width:11mm;font-weight:normal;">&nbsp;</th>
									<th class="styDepTblCell" scope="col" style="width:68mm;font-weight:normal;">
										<strong>2a. </strong> Name of Payor <br /> (see instructions)
									</th>
									<th class="styDepTblCell" scope="col" style="width:77mm;font-weight:normal;">
										<strong>2b. </strong> EIN or Reference ID Number <br /> of Payor <br /> (see instructions)
									</th>
									<th class="styDepTblCell" scope="col" style="width:23mm;font-weight:normal;">
										<strong>3. </strong> Country or <br /> U.S. Possession <br /> to Which Tax <br /> Is Paid <br />
										(enter code &mdash; <br /> see instructions)
									</th>
									<th class="styDepTblCell" scope="col" style="width:21mm;font-weight:normal;">
										<strong>4. </strong> Date <br /> Additional <br /> Foreign Tax <br /> Was Paid <br /> (MM/DD/YYYY)
									</th>
									<th class="styDepTblCell" scope="col" style="width:21mm;font-weight:normal;">
										<strong>5. </strong> Foreign <br /> Tax Year <br /> to Which <br /> Tax Relates <br /> (MM/DD/YYYY)
									</th>
								</tr>
							</thead>
							<tbody>
								<xsl:for-each select="$FormData/IncrAmtFrgnTaxesAccruedDtl">
									<xsl:variable name="pos" select="position()"/>
									<tr>
										<xsl:attribute name="class">
											<xsl:choose>
												<xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when>
												<xsl:otherwise>styDepTblRow2</xsl:otherwise>
											</xsl:choose>
										</xsl:attribute>
										<td class="styTableCellCtrInherit" style="font-weight:bold;">
											<xsl:attribute name="rowspan"><xsl:value-of select="count(PayorRelationBackYearGrp)"/></xsl:attribute>
											<xsl:number value="$pos" format="A"/>
										</td>
										<td class="styTableCellCtrInherit" style="">
											<xsl:attribute name="rowspan"><xsl:value-of select="count(PayorRelationBackYearGrp)"/></xsl:attribute>
											<span style="width:22mm;height:3.5mm;border-bottom:1px solid black;">
												<xsl:call-template name="PopulateMonthDayYear">
													<xsl:with-param name="TargetNode" select="USTaxYearEndDt"/>
												</xsl:call-template>
											</span>
										</td>
										<td class="styTableCellCtrInherit" style="font-weight:bold;">(1)</td>
										<td class="styTableCellTextInherit" style="">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="PayorRelationBackYearGrp[1]/PayorName/BusinessNameLine1Txt"/>
											</xsl:call-template>
											<xsl:if test="PayorRelationBackYearGrp[1]/PayorName/BusinessNameLine2Txt">
												<br />
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="PayorRelationBackYearGrp[1]/PayorName/BusinessNameLine2Txt"/>
												</xsl:call-template>
											</xsl:if>
										</td>
										<td class="styTableCellCtrInherit" style="word-break:break-all;">
											<xsl:choose>
												<xsl:when test="PayorRelationBackYearGrp[1]/ForeignEntityIdentificationGrp">
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="PayorRelationBackYearGrp[1]/ForeignEntityIdentificationGrp/ForeignEntityReferenceIdNum"/>
													</xsl:call-template>
												</xsl:when>
												<xsl:otherwise>
													<xsl:call-template name="PopulateEIN">
														<xsl:with-param name="TargetNode" select="PayorRelationBackYearGrp[1]/PayorEIN"/>
													</xsl:call-template>
												</xsl:otherwise>
											</xsl:choose>
										</td>
										<td class="styTableCellCtrInherit" style="">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="PayorRelationBackYearGrp[1]/ForeignCountryOrUSPossessionCd"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellCtrInherit" style="">
											<xsl:call-template name="PopulateMonthDayYear">
												<xsl:with-param name="TargetNode" select="PayorRelationBackYearGrp[1]/AdditionalForeignTaxPaidDt"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellCtrInherit" style="border-right-width:0px;">
											<xsl:call-template name="PopulateMonthDayYear">
												<xsl:with-param name="TargetNode" select="PayorRelationBackYearGrp[1]/ForeignTaxYearEndDt"/>
											</xsl:call-template>
										</td>
									</tr>
									<xsl:for-each select="PayorRelationBackYearGrp[position() &gt; 1]">
										<tr>
											<xsl:attribute name="class">
												<xsl:choose>
													<xsl:when test="(position() + $pos) mod 2 = 1">styDepTblRow1</xsl:when>
													<xsl:otherwise>styDepTblRow2</xsl:otherwise>
												</xsl:choose>
											</xsl:attribute>
											<td class="styTableCellCtrInherit" style="font-weight:bold;">
												(<xsl:value-of select="position() + 1"/>)
											</td>
											<td class="styTableCellTextInherit" style="">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="PayorName/BusinessNameLine1Txt"/>
												</xsl:call-template>
												<xsl:if test="PayorName/BusinessNameLine2Txt">
													<br />
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="PayorName/BusinessNameLine2Txt"/>
													</xsl:call-template>
												</xsl:if>
											</td>
											<td class="styTableCellCtrInherit" style="word-break:break-all;">
												<xsl:choose>
													<xsl:when test="ForeignEntityIdentificationGrp">
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="ForeignEntityIdentificationGrp/ForeignEntityReferenceIdNum"/>
														</xsl:call-template>
													</xsl:when>
													<xsl:otherwise>
														<xsl:call-template name="PopulateEIN">
															<xsl:with-param name="TargetNode" select="PayorEIN"/>
														</xsl:call-template>
													</xsl:otherwise>
												</xsl:choose>
											</td>
											<td class="styTableCellCtrInherit" style="">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="ForeignCountryOrUSPossessionCd"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellCtrInherit" style="">
												<xsl:call-template name="PopulateMonthDayYear">
													<xsl:with-param name="TargetNode" select="AdditionalForeignTaxPaidDt"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellCtrInherit" style="border-right-width:0px;">
												<xsl:call-template name="PopulateMonthDayYear">
													<xsl:with-param name="TargetNode" select="ForeignTaxYearEndDt"/>
												</xsl:call-template>
											</td>
										</tr>
									</xsl:for-each>
								</xsl:for-each>
							</tbody>
						</table>
						<table class="styDepTblLandscape" style="font-size:7pt">
							<thead class="styTableHead">
								<tr class="styDepTblHdr">
									<th class="styDepTblCell" scope="col" style="width:8mm;font-weight:normal;">&nbsp;</th>
									<th class="styDepTblCell" scope="col" style="width:11mm;font-weight:normal;">&nbsp;</th>
									<th class="styDepTblCell" scope="col" style="width:26mm;font-weight:normal;padding:2mm 0mm;">
										<strong>6. </strong> Payor's Income <br /> Subject to Tax in the <br /> Foreign Jurisdiction <br /> (see instructions)
									</th>
									<th class="styDepTblCell" scope="col" style="width:29mm;font-weight:normal;padding:2mm 0mm;">
										<strong>7. </strong> Additional Tax <br /> Accrued in <br /> Local Currency <br /> in Which the <br /> Tax Is Payable
									</th>
									<th class="styDepTblCell" scope="col" style="width:29mm;font-weight:normal;padding:2mm 0mm;">
										<strong>8. </strong> Additional Tax <br /> Accrued in <br /> Functional Currency <br /> of Payor
									</th>
									<th class="styDepTblCell" scope="col" style="width:37mm;font-weight:normal;padding:2mm 0mm;">
										<strong>9. </strong> Conversion Rate <br /> of Local Currency <br /> to U.S. Dollars
									</th>
									<th class="styDepTblCell" scope="col" style="width:26mm;font-weight:normal;padding:2mm 0mm;">
										<strong>10. </strong> Additional Tax <br /> Accrued in <br /> U.S. Dollars <br /> (divide column 7 <br /> by column 9)
									</th>
									<th class="styDepTblCell" scope="col" style="width:26mm;font-weight:normal;padding:2mm 0mm;">
										<strong>11. </strong> U.S. Dollar <br /> Tax of Payor <br /> Reported on <br /> Original/Amended Return
									</th>
									<th class="styDepTblCell" scope="col" style="width:26mm;font-weight:normal;padding:2mm 0mm;">
										<strong>12. </strong> Revised Tax Accrued <br /> (add column 10 <br /> and column 11)
									</th>
									<th class="styDepTblCell" scope="col" style="width:38mm;font-weight:normal;padding:2mm 0mm;border-right-width:0px;">
										<strong>13. </strong> Reference ID Number <br /> for Contested Tax, <br /> if Applicable <br /> (see instructions)
									</th>
								</tr>
							</thead>
							<tbody>
								<xsl:for-each select="$FormData/IncrAmtFrgnTaxesAccruedDtl">
									<xsl:variable name="pos" select="position()"/>
									<tr>
										<xsl:attribute name="class">
											<xsl:choose>
												<xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when>
												<xsl:otherwise>styDepTblRow2</xsl:otherwise>
											</xsl:choose>
										</xsl:attribute>
										<td class="styTableCellCtrInherit" style="font-weight:bold;">
											<xsl:attribute name="rowspan"><xsl:value-of select="count(PayorRelationBackYearGrp)"/></xsl:attribute>
											<xsl:number value="$pos" format="A"/>
										</td>
										<td class="styTableCellCtrInherit" style="font-weight:bold;">(1)</td>
										<td class="styTableCellAmtInherit" style="">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="PayorRelationBackYearGrp[1]/ForeignTaxableIncomeAmt"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellAmtInherit" style="">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="PayorRelationBackYearGrp[1]/AddnlTaxForeignCurrencyAmt"/>
												<xsl:with-param name="MaxSize" select="17"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellAmtInherit" style="">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="PayorRelationBackYearGrp[1]/AddnlTaxFunctionalCurrencyAmt"/>
												<xsl:with-param name="MaxSize" select="17"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellAmtInherit" style="word-break:break-all;">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="PayorRelationBackYearGrp[1]/ConversionRt"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellAmtInherit" style="">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="PayorRelationBackYearGrp[1]/AddnlTaxUSDollarsAmt"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellAmtInherit" style="">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="PayorRelationBackYearGrp[1]/TaxOriginalAmdRetAmt"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellAmtInherit" style="">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="PayorRelationBackYearGrp[1]/RevisedTaxAccruedAmt"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellCtrInherit" style="word-break:break-all;border-right-width:0px;">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="PayorRelationBackYearGrp[1]/ContestedTaxForeignEntityIdGrp/ForeignEntityReferenceIdNum"/>
											</xsl:call-template>
										</td>
									</tr>
									<xsl:for-each select="PayorRelationBackYearGrp[position() &gt; 1]">
										<tr>
											<xsl:attribute name="class">
												<xsl:choose>
													<xsl:when test="(position() + $pos) mod 2 = 1">styDepTblRow1</xsl:when>
													<xsl:otherwise>styDepTblRow2</xsl:otherwise>
												</xsl:choose>
											</xsl:attribute>
											<td class="styTableCellCtrInherit" style="font-weight:bold;">
												(<xsl:value-of select="position() + 1"/>)
											</td>
											<td class="styTableCellAmtInherit" style="">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="ForeignTaxableIncomeAmt"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellAmtInherit" style="">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="AddnlTaxForeignCurrencyAmt"/>
													<xsl:with-param name="MaxSize" select="17"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellAmtInherit" style="">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="AddnlTaxFunctionalCurrencyAmt"/>
													<xsl:with-param name="MaxSize" select="17"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellAmtInherit" style="word-break:break-all;">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="ConversionRt"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellAmtInherit" style="">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="AddnlTaxUSDollarsAmt"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellAmtInherit" style="">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="TaxOriginalAmdRetAmt"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellAmtInherit" style="">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="RevisedTaxAccruedAmt"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellCtrInherit" style="word-break:break-all;border-right-width:0px;">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="ContestedTaxForeignEntityIdGrp/ForeignEntityReferenceIdNum"/>
												</xsl:call-template>
											</td>
										</tr>
									</xsl:for-each>
									<tr class="styDepTblRow1" style="vertical-align:bottom;">
										<td colspan="6" class="styTableCellTextInherit" style="">
											<strong>Subtotal by Relation Back Year of Taxpayer</strong><br />
											(add amounts in columns 10, 11, and 12) 
											<span class="sty1116SCDotLn">.....................</span>
										</td>
										<td class="styTableCellAmtInherit" style="">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="TotalAddnlTaxUSDollarsAmt"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellAmtInherit" style="">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="TotalTaxOriginalAmdRetAmt"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellAmtInherit" style="">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="TotalRevisedTaxAccruedAmt"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellCtrInherit" style="background-color:lightgrey;border-right-width:0px;">&nbsp;</td>
									</tr>
								</xsl:for-each>
							</tbody>
						</table>
					</xsl:if>
					<!-- Part 2 separated table -->
					<xsl:if test="$sep2">
						<br/>
						<br/>
						<span class="styRepeatingDataTitle">Part II - Decrease in Amount of Foreign Taxes Paid or Accrued</span>
						<table class="styDepTblLandscape" style="font-size:7pt">
							<thead class="styTableHead">
								<tr class="styDepTblHdr">
									<th class="styDepTblCell" scope="col" style="width:8mm;font-weight:normal;">&nbsp;</th>
									<th class="styDepTblCell" scope="col" style="width:27mm;font-weight:normal;">
										<strong>1. </strong> U.S. Tax Year <br /> of Taxpayer to <br /> Which Tax Relates <br />
										(relation back year) <br /> (MM/DD/YYYY)
									</th>
									<th class="styDepTblCell" scope="col" style="width:11mm;font-weight:normal;">&nbsp;</th>
									<th class="styDepTblCell" scope="col" style="width:68mm;font-weight:normal;">
										<strong>2a. </strong> Name of Payor <br /> (see instructions)
									</th>
									<th class="styDepTblCell" scope="col" style="width:77mm;font-weight:normal;">
										<strong>2b. </strong> EIN or Reference ID Number <br /> of Payor <br /> (see instructions)
									</th>
									<th class="styDepTblCell" scope="col" style="width:23mm;font-weight:normal;">
										<strong>3. </strong> Country or <br /> U.S. Possession <br /> From Which Tax <br /> Was Refunded <br /> or Deemed Refunded  <br />
										(enter code &mdash; <br /> see instructions)
									</th>
									<th class="styDepTblCell" scope="col" style="width:21mm;font-weight:normal;">
										<strong>4. </strong> Date <br /> Foreign Tax <br /> Was Refunded <br /> or Deemed Refunded <br /> (MM/DD/YYYY)
									</th>
									<th class="styDepTblCell" scope="col" style="width:21mm;font-weight:normal;">
										<strong>5. </strong> Foreign <br /> Tax Year <br /> to Which <br /> Tax Relates <br /> (MM/DD/YYYY)
									</th>
								</tr>
							</thead>
							<tbody>
								<xsl:for-each select="$FormData/DecrAmtFrgnTaxesPdAccruedDtl">
									<xsl:variable name="pos" select="position()"/>
									<tr>
										<xsl:attribute name="class">
											<xsl:choose>
												<xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when>
												<xsl:otherwise>styDepTblRow2</xsl:otherwise>
											</xsl:choose>
										</xsl:attribute>
										<td class="styTableCellCtrInherit" style="font-weight:bold;">
											<xsl:attribute name="rowspan"><xsl:value-of select="count(DecrPayorRelationBackYrGrp)"/></xsl:attribute>
											<xsl:number value="$pos" format="A"/>
										</td>
										<td class="styTableCellCtrInherit" style="">
											<xsl:attribute name="rowspan"><xsl:value-of select="count(DecrPayorRelationBackYrGrp)"/></xsl:attribute>
											<span style="width:22mm;height:3.5mm;border-bottom:1px solid black;">
												<xsl:call-template name="PopulateMonthDayYear">
													<xsl:with-param name="TargetNode" select="USTaxYearEndDt"/>
												</xsl:call-template>
											</span>
										</td>
										<td class="styTableCellCtrInherit" style="font-weight:bold;">(1)</td>
										<td class="styTableCellTextInherit" style="">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="DecrPayorRelationBackYrGrp[1]/PayorName/BusinessNameLine1Txt"/>
											</xsl:call-template>
											<xsl:if test="DecrPayorRelationBackYrGrp[1]/PayorName/BusinessNameLine2Txt">
												<br />
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="DecrPayorRelationBackYrGrp[1]/PayorName/BusinessNameLine2Txt"/>
												</xsl:call-template>
											</xsl:if>
										</td>
										<td class="styTableCellCtrInherit" style="word-break:break-all;">
											<xsl:choose>
												<xsl:when test="DecrPayorRelationBackYrGrp[1]/ForeignEntityIdentificationGrp">
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="DecrPayorRelationBackYrGrp[1]/ForeignEntityIdentificationGrp/ForeignEntityReferenceIdNum"/>
													</xsl:call-template>
												</xsl:when>
												<xsl:otherwise>
													<xsl:call-template name="PopulateEIN">
														<xsl:with-param name="TargetNode" select="DecrPayorRelationBackYrGrp[1]/PayorEIN"/>
													</xsl:call-template>
												</xsl:otherwise>
											</xsl:choose>
										</td>
										<td class="styTableCellCtrInherit" style="">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="DecrPayorRelationBackYrGrp[1]/ForeignCountryOrUSPossessionCd"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellCtrInherit" style="">
											<xsl:call-template name="PopulateMonthDayYear">
												<xsl:with-param name="TargetNode" select="DecrPayorRelationBackYrGrp[1]/ForeignTaxRefundedDt"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellCtrInherit" style="border-right-width:0px;">
											<xsl:call-template name="PopulateMonthDayYear">
												<xsl:with-param name="TargetNode" select="DecrPayorRelationBackYrGrp[1]/ForeignTaxYearEndDt"/>
											</xsl:call-template>
										</td>
									</tr>
									<xsl:for-each select="DecrPayorRelationBackYrGrp[position() &gt; 1]">
										<tr>
											<xsl:attribute name="class">
												<xsl:choose>
													<xsl:when test="(position() + $pos) mod 2 = 1">styDepTblRow1</xsl:when>
													<xsl:otherwise>styDepTblRow2</xsl:otherwise>
												</xsl:choose>
											</xsl:attribute>
											<td class="styTableCellCtrInherit" style="font-weight:bold;">
												(<xsl:value-of select="position() + 1"/>)
											</td>
											<td class="styTableCellTextInherit" style="">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="PayorName/BusinessNameLine1Txt"/>
												</xsl:call-template>
												<xsl:if test="PayorName/BusinessNameLine2Txt">
													<br />
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="PayorName/BusinessNameLine2Txt"/>
													</xsl:call-template>
												</xsl:if>
											</td>
											<td class="styTableCellCtrInherit" style="word-break:break-all;">
												<xsl:choose>
													<xsl:when test="ForeignEntityIdentificationGrp">
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="ForeignEntityIdentificationGrp/ForeignEntityReferenceIdNum"/>
														</xsl:call-template>
													</xsl:when>
													<xsl:otherwise>
														<xsl:call-template name="PopulateEIN">
															<xsl:with-param name="TargetNode" select="PayorEIN"/>
														</xsl:call-template>
													</xsl:otherwise>
												</xsl:choose>
											</td>
											<td class="styTableCellCtrInherit" style="">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="ForeignCountryOrUSPossessionCd"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellCtrInherit" style="">
												<xsl:call-template name="PopulateMonthDayYear">
													<xsl:with-param name="TargetNode" select="ForeignTaxRefundedDt"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellCtrInherit" style="border-right-width:0px;">
												<xsl:call-template name="PopulateMonthDayYear">
													<xsl:with-param name="TargetNode" select="ForeignTaxYearEndDt"/>
												</xsl:call-template>
											</td>
										</tr>
									</xsl:for-each>
								</xsl:for-each>
							</tbody>
						</table>
						<table class="styDepTblLandscape" style="font-size:7pt">
							<thead class="styTableHead">
								<tr class="styDepTblHdr">
									<th class="styDepTblCell" scope="col" style="width:8mm;font-weight:normal;">&nbsp;</th>
									<th class="styDepTblCell" scope="col" style="width:11mm;font-weight:normal;">&nbsp;</th>
									<th class="styDepTblCell" scope="col" style="width:26mm;font-weight:normal;padding:2mm 0mm;">
										<strong>6. </strong> Payor's Income <br /> Subject to Tax in the <br /> Foreign Jurisdiction <br /> (see instructions)
									</th>
									<th class="styDepTblCell" scope="col" style="width:29mm;font-weight:normal;padding:2mm 0mm;">
										<strong>7. </strong> Additional Tax <br /> Accrued in <br /> Local Currency <br /> in Which the <br /> Tax Is Payable
									</th>
									<th class="styDepTblCell" scope="col" style="width:29mm;font-weight:normal;padding:2mm 0mm;">
										<strong>8. </strong> Additional Tax <br /> Accrued in <br /> Functional Currency <br /> of Payor
									</th>
									<th class="styDepTblCell" scope="col" style="width:37mm;font-weight:normal;padding:2mm 0mm;">
										<strong>9. </strong> Conversion Rate <br /> of Local Currency <br /> to U.S. Dollars
									</th>
									<th class="styDepTblCell" scope="col" style="width:26mm;font-weight:normal;padding:2mm 0mm;">
										<strong>10. </strong> Additional Tax <br /> Accrued in <br /> U.S. Dollars <br /> (divide column 7 <br /> by column 9)
									</th>
									<th class="styDepTblCell" scope="col" style="width:26mm;font-weight:normal;padding:2mm 0mm;">
										<strong>11. </strong> U.S. Dollar <br /> Tax of Payor <br /> Reported on <br /> Original/Amended Return
									</th>
									<th class="styDepTblCell" scope="col" style="width:26mm;font-weight:normal;padding:2mm 0mm;">
										<strong>12. </strong> Revised Tax Accrued <br /> (add column 10 <br /> and column 11)
									</th>
									<th class="styDepTblCell" scope="col" style="width:38mm;font-weight:normal;padding:2mm 0mm;">
										<strong>13. </strong> Reference ID Number <br /> for Contested Tax, <br /> if Applicable <br /> (see instructions)
									</th>
								</tr>
							</thead>
							<tbody>
								<xsl:for-each select="$FormData/DecrAmtFrgnTaxesPdAccruedDtl">
									<xsl:variable name="pos" select="position()"/>
									<tr>
										<xsl:attribute name="class">
											<xsl:choose>
												<xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when>
												<xsl:otherwise>styDepTblRow2</xsl:otherwise>
											</xsl:choose>
										</xsl:attribute>
										<td class="styTableCellCtrInherit" style="font-weight:bold;">
											<xsl:attribute name="rowspan"><xsl:value-of select="count(DecrPayorRelationBackYrGrp)"/></xsl:attribute>
											<xsl:number value="$pos" format="A"/>
										</td>
										<td class="styTableCellCtrInherit" style="font-weight:bold;">(1)</td>
										<td class="styTableCellAmtInherit" style="">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="DecrPayorRelationBackYrGrp[1]/ForeignTaxableIncomeAmt"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellAmtInherit" style="">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="DecrPayorRelationBackYrGrp[1]/TxRefundedInForeignCurrencyAmt"/>
												<xsl:with-param name="MaxSize" select="17"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellAmtInherit" style="">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="DecrPayorRelationBackYrGrp[1]/TxRefdInFunctionalCurrencyAmt"/>
												<xsl:with-param name="MaxSize" select="17"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellAmtInherit" style="word-break:break-all;">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="DecrPayorRelationBackYrGrp[1]/ConversionRt"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellAmtInherit" style="">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="DecrPayorRelationBackYrGrp[1]/RefundInUSDollarsAmt"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellAmtInherit" style="">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="DecrPayorRelationBackYrGrp[1]/TaxOriginalAmdRetAmt"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellAmtInherit" style="">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="DecrPayorRelationBackYrGrp[1]/RevisedTaxPaidAccruedAmt"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellCtrInherit" style="border-right-width:0px;">
											<input type="checkbox" class="styCkboxNM" aria-label="two year rule row A1">
												<xsl:attribute name="alt">Row <xsl:number value="$pos" format="A"/> subrow 1, Section 905 c 2 Two Year Rule</xsl:attribute>
												<xsl:call-template name="PopulateCheckbox">
													<xsl:with-param name="TargetNode" select="Section905c2TwoYrRuleInd"/>
													<xsl:with-param name="BackupName">F1116sC-p2-<xsl:value-of select="$pos"/>-1-Section905c2TwoYrRuleInd</xsl:with-param>
												</xsl:call-template>
											</input>
										</td>
									</tr>
									<xsl:for-each select="DecrPayorRelationBackYrGrp[position() &gt; 1]">
										<tr>
											<xsl:attribute name="class">
												<xsl:choose>
													<xsl:when test="(position() + $pos) mod 2 = 1">styDepTblRow1</xsl:when>
													<xsl:otherwise>styDepTblRow2</xsl:otherwise>
												</xsl:choose>
											</xsl:attribute>
											<td class="styTableCellCtrInherit" style="font-weight:bold;">
												(<xsl:value-of select="position() + 1"/>)
											</td>
											<td class="styTableCellAmtInherit" style="">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="ForeignTaxableIncomeAmt"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellAmtInherit" style="">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="TxRefundedInForeignCurrencyAmt"/>
													<xsl:with-param name="MaxSize" select="17"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellAmtInherit" style="">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="TxRefdInFunctionalCurrencyAmt"/>
													<xsl:with-param name="MaxSize" select="17"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellAmtInherit" style="word-break:break-all;">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="ConversionRt"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellAmtInherit" style="">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="RefundInUSDollarsAmt"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellAmtInherit" style="">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="TaxOriginalAmdRetAmt"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellAmtInherit" style="">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="RevisedTaxPaidAccruedAmt"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellCtrInherit" style="border-right-width:0px;">
												<input type="checkbox" class="styCkboxNM" aria-label="two year rule row A2">
													<xsl:attribute name="alt">Row <xsl:number value="$pos" format="A"/> subrow <xsl:value-of select="position() + 1"/>, Section 905 c 2 Two Year Rule</xsl:attribute>
													<xsl:call-template name="PopulateCheckbox">
														<xsl:with-param name="TargetNode" select="Section905c2TwoYrRuleInd"/>
														<xsl:with-param name="BackupName">F1116sC-p2-<xsl:value-of select="$pos"/>-<xsl:value-of select="position() + 1"/>-Section905c2TwoYrRuleInd</xsl:with-param>
													</xsl:call-template>
												</input>
											</td>
										</tr>
									</xsl:for-each>
									<tr class="styDepTblRow1" style="vertical-align:bottom;">
										<td colspan="6" class="styTableCellTextInherit" style="">
											<strong>Subtotal by Relation Back Year of Taxpayer</strong><br />
											(add amounts in columns 10, 11, and 12) 
											<span class="sty1116SCDotLn">.....................</span>
										</td>
										<td class="styTableCellAmtInherit" style="">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="TotalRefundInUSDollarsAmt"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellAmtInherit" style="">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="TotalTaxOriginalAmdRetAmt"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellAmtInherit" style="">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="TotalRevisedTaxPaidAccruedAmt"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellCtrInherit" style="background-color:lightgrey;border-right-width:0px;">&nbsp;</td>
									</tr>
								</xsl:for-each>
							</tbody>
						</table>
					</xsl:if>
					<!-- Part 3 separated table -->
					<xsl:if test="$sep3">
						<br/>
						<br/>
						<span class="styRepeatingDataTitle">Part III - Change in Foreign Taxes Paid or Accrued </span>
						<table class="styDepTblLandscape" style="font-size:7pt">
							<thead class="styTableHead">
								<tr class="styDepTblHdr">
									<th class="styDepTblCell" scope="col" style="width:8mm;font-weight:normal;">&nbsp;</th>
									<th class="styDepTblCell" scope="col" style="width:51mm;font-weight:normal;padding:2mm 0mm;">
										<strong>1. </strong> Relation Back Year <br /> (MM/DD/YYYY)
									</th>
									<th class="styDepTblCell" scope="col" style="width:49mm;font-weight:normal;padding:2mm 0mm;">
										<strong>2. </strong> Redetermined Foreign Taxes <br /> Paid or Accrued
									</th>
									<th class="styDepTblCell" scope="col" style="width:49mm;font-weight:normal;padding:2mm 0mm;">
										<strong>3. </strong> Foreign Taxes Paid or Accrued <br /> per Original/Amended Return
									</th>
									<th class="styDepTblCell" scope="col" style="width:49mm;font-weight:normal;padding:2mm 0mm;">
										<strong>4. </strong> Amount of FTC Claimed <br /> per Original/Amended Return
									</th>
									<th class="styDepTblCell" scope="col" style="width:49mm;font-weight:normal;padding:2mm 0mm;">
										<strong>5. </strong> Amount of FTC Claimed <br /> After Redetermination
									</th>
								</tr>
							</thead>
							<tbody>
								<xsl:for-each select="$FormData/ChangeFrgnTxsPdAccruedGrp">
									<tr>
										<xsl:attribute name="class">
											<xsl:choose>
												<xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when>
												<xsl:otherwise>styDepTblRow2</xsl:otherwise>
											</xsl:choose>
										</xsl:attribute>
										<td class="styTableCellCtrInherit" style="font-weight:bold;">
											<xsl:number value="position()" format="A"/>
										</td>
										<td class="styTableCellCtrInherit" style="">
											<xsl:call-template name="PopulateMonthDayYear">
												<xsl:with-param name="TargetNode" select="USTaxYearEndDt"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellAmtInherit" style="">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="RedetermFrgnTxsPdAccruedAmt"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellAmtInherit" style="">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="FrgnTxsPdAccruedPerReturnAmt"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellAmtInherit" style="">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="FTCClmPerReturnAmt"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellAmtInherit" style="border-right-width:0px;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="FTCClmRedetermAmt"/>
											</xsl:call-template>
										</td>
									</tr>
								</xsl:for-each>
							</tbody>
						</table>
					</xsl:if>
					<!-- Part 4 separated table -->
					<xsl:if test="$sep4">
						<br/>
						<br/>
						<span class="styRepeatingDataTitle">Part IV - Change in U.S. Tax Liability </span>
						<table class="styDepTblLandscape" style="font-size:7pt">
							<thead class="styTableHead">
								<tr class="styDepTblHdr">
									<th class="styDepTblCell" scope="col" style="width:8mm;font-weight:normal;">&nbsp;</th>
									<th class="styDepTblCell" scope="col" style="width:100mm;font-weight:normal;padding:2mm 0mm;">
										<strong>1. </strong> Relation Back Year or Affected Tax Year <br /> (MM/DD/YYYY)
									</th>
									<th class="styDepTblCell" scope="col" style="width:49mm;font-weight:normal;padding:2mm 0mm;">
										<strong>2. </strong> Total Redetermined <br /> U.S. Tax Liability
									</th>
									<th class="styDepTblCell" scope="col" style="width:49mm;font-weight:normal;padding:2mm 0mm;">
										<strong>3. </strong> Total U.S. Tax Liability <br /> per Original/Amended Return
									</th>
									<th class="styDepTblCell" scope="col" style="width:49mm;font-weight:normal;padding:2mm 0mm;">
										<strong>4. </strong> Difference <br /> (subtract column 3 from column 2)
									</th>
								</tr>
							</thead>
							<tbody>
								<xsl:for-each select="$FormData/ChgUSTxLiabilityGrp">
									<tr>
										<xsl:attribute name="class">
											<xsl:choose>
												<xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when>
												<xsl:otherwise>styDepTblRow2</xsl:otherwise>
											</xsl:choose>
										</xsl:attribute>
										<td class="styTableCellCtrInherit" style="font-weight:bold;">
											<xsl:number value="position()" format="A"/>
										</td>
										<td class="styTableCellCtrInherit" style="">
											<xsl:call-template name="PopulateMonthDayYear">
												<xsl:with-param name="TargetNode" select="RlnBackYrOrAffectedTaxYrEndDt"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellAmtInherit" style="">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="TotRedetermUSTaxLiabilityAmt"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellAmtInherit" style="">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="TotUSTaxLiabilityPerReturnAmt"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellAmtInherit" style="">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="DifferenceBetweenTotalsAmt"/>
											</xsl:call-template>
										</td>
									</tr>
								</xsl:for-each>
							</tbody>
						</table>
					</xsl:if>
					<!-- Part 5 separated table -->
					<xsl:if test="$sep5">
						<br/>
						<br/>
						<span class="styRepeatingDataTitle">Part V - Annual Reporting for Contested Taxes</span>
						<table class="styDepTblLandscape" style="font-size:7pt">
							<thead class="styTableHead">
								<tr class="styDepTblHdr">
									<th class="styDepTblCell" scope="col" style="width:12mm;font-weight:normal;">&nbsp;</th>
									<th class="styDepTblCell" scope="col" style="width:25mm;font-weight:normal;padding:2mm 0mm;">
										<strong>1. </strong> Relation Back Year <br /> (MM/DD/YYYY)
									</th>
									<th class="styDepTblCell" scope="col" style="width:110mm;font-weight:normal;padding:2mm 0mm;">
										<strong>2. </strong> Name of Payor <br /> (see instructions)
									</th>
									<th class="styDepTblCell" scope="col" style="width:84mm;font-weight:normal;padding:2mm 0mm;">
										<strong>3. </strong> Reference ID Number for the Contested Tax
									</th>
									<th class="styDepTblCell" scope="col" style="width:25mm;font-weight:normal;padding:2mm 0mm;">
										<strong>4. </strong> Country or U.S. Possession to Which Tax Was Paid (enter code - see instructions)
									</th>
								</tr>
							</thead>
							<tbody>
								<xsl:for-each select="$FormData/AnnualRptgContestedTaxesGrp">
									<tr>
										<xsl:attribute name="class">
											<xsl:choose>
												<xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when>
												<xsl:otherwise>styDepTblRow2</xsl:otherwise>
											</xsl:choose>
										</xsl:attribute>
										<td class="styTableCellCtrInherit" style="font-weight:bold;">
											(<xsl:number value="position()" format="1"/>)
										</td>
										<td class="styTableCellCtrInherit" style="">
											<xsl:call-template name="PopulateMonthDayYear">
												<xsl:with-param name="TargetNode" select="USTaxYearEndDt"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellTextInherit" style="">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="PayorName/BusinessNameLine1Txt"/>
											</xsl:call-template>
											<xsl:if test="PayorName/BusinessNameLine2Txt">
												<br />
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="PayorName/BusinessNameLine2Txt"/>
												</xsl:call-template>
											</xsl:if>
										</td>
										<td class="styTableCellCtrInherit" style="word-break:break-all;">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="ContestedTaxForeignEntityIdGrp/ForeignEntityReferenceIdNum"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellCtrInherit" style="">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="ForeignCountryOrUSPossessionCd"/>
											</xsl:call-template>
										</td>
									</tr>
								</xsl:for-each>
							</tbody>
						</table>
						<table class="styDepTblLandscape" style="font-size:7pt">
							<thead class="styTableHead">
								<tr class="styDepTblHdr">
									<th class="styDepTblCell" scope="col" style="width:12mm;font-weight:normal;">&nbsp;</th>
									<th class="styDepTblCell" scope="col" style="width:44mm;font-weight:normal;padding:2mm 0mm;">
										<strong>5. </strong> Amount of Contested Tax <br /> Provisionally Claimed as Credit
									</th>
									<th class="styDepTblCell" scope="col" style="width:40mm;font-weight:normal;padding:2mm 0mm;">
										<strong>6. </strong> Contest <br /> Ongoing
									</th>
									<th class="styDepTblCell" scope="col" style="width:40mm;font-weight:normal;padding:2mm 0mm;">
										<strong>7. </strong> Contest <br /> Resolved
									</th>
									<th class="styDepTblCell" scope="col" style="width:40mm;font-weight:normal;padding:2mm 0mm;">
										<strong>8. </strong> Date Contest <br /> Resolved <br /> (MM/DD/YYYY)
									</th>
									<th class="styDepTblCell" scope="col" style="width:40mm;font-weight:normal;padding:2mm 0mm;">
										<strong>9. </strong> Tax Refunded, <br /> if Any <br /> (see instructions)
									</th>
									<th class="styDepTblCell" scope="col" style="width:40mm;font-weight:normal;padding:2mm 0mm;">
										<strong>10. </strong> Additional <br /> Tax Paid, if Any <br /> (see instructions)
									</th>
								</tr>
							</thead>
							<tbody>
								<xsl:for-each select="$FormData/AnnualRptgContestedTaxesGrp">
									<tr>
										<xsl:attribute name="class">
											<xsl:choose>
												<xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when>
												<xsl:otherwise>styDepTblRow2</xsl:otherwise>
											</xsl:choose>
										</xsl:attribute>
										<td class="styTableCellCtrInherit" style="font-weight:bold;">
											(<xsl:number value="position()" format="1"/>)
										</td>
										<td class="styTableCellAmtInherit" style="">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="ContestedTaxPrvsnClmdCrAmt"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellCtrInherit" style="">
											<input type="checkbox" class="styCkboxNM" style="">
												<xsl:attribute name="alt">Row <xsl:value-of select="position()"/> Contest Ongoing</xsl:attribute>
												<xsl:call-template name="PopulateCheckbox">
													<xsl:with-param name="TargetNode" select="ContestOngoingInd"/>
													<xsl:with-param name="BackupName">F1116sC/ContestOngoingInd<xsl:value-of select="position()"/></xsl:with-param>
												</xsl:call-template>
											</input>
										</td>
										<td class="styTableCellCtrInherit" style="">
											<input type="checkbox" class="styCkboxNM" style="">
												<xsl:attribute name="alt">Row <xsl:value-of select="position()"/> Contest Resolved</xsl:attribute>
												<xsl:call-template name="PopulateCheckbox">
													<xsl:with-param name="TargetNode" select="ContestResolvedInd"/>
													<xsl:with-param name="BackupName">F1116sC/ContestResolvedInd<xsl:value-of select="position()"/></xsl:with-param>
												</xsl:call-template>
											</input>
										</td>
										<td class="styTableCellCtrInherit" style="">
											<xsl:call-template name="PopulateMonthDayYear">
												<xsl:with-param name="TargetNode" select="ContestResolvedDt"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellAmtInherit" style="">
											<xsl:call-template name="PopulateAmount">
												<!-- Using TaxRefundedAmt per UWR 1012195 -->
												<xsl:with-param name="TargetNode" select="TaxRefundedAmt"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellAmtInherit" style="">
											<xsl:call-template name="PopulateAmount">
												<!-- Using AdditionalTaxPaidAmt per UWR 1012195 -->
												<xsl:with-param name="TargetNode" select="AdditionalTaxPaidAmt"/> 
											</xsl:call-template>
										</td>
									</tr>
								</xsl:for-each>
							</tbody>
						</table>
					</xsl:if>
					<br/>
				</form>
			</body>
		</html>
	</xsl:template>
</xsl:stylesheet>
