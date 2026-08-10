<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE xsl:stylesheet [
  <!ENTITY nbsp "&#160;">
  <!ENTITY mdash "&#8212;">
]>

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:include href="PopulateTemplate.xsl" />
	<xsl:include href="AddHeader.xsl" />
	<xsl:include href="CommonPathRef.xsl" />
	<xsl:include href="AddOnTable.xsl" />
	<xsl:include href="IRS1118ScheduleLStyle.xsl" />
	<xsl:output method="html" indent="yes" />
	<xsl:strip-space elements="*" />
	<xsl:param name="FormData" select="$RtnDoc/IRS1118ScheduleL" />
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
				<meta name="Description" content="IRS Schedule L Form 1118" />
				<script language="JavaScript" src="{$ScriptPath}/FormDisplay.js" type="text/javascript" />
				<xsl:call-template name="InitJS" />
				<style type="text/css">
					<xsl:if test="not($Print) or $Print=''">
						<xsl:call-template name="IRS1118ScheduleLStyle" />
						<xsl:call-template name="AddOnStyle" />
					</xsl:if>
				</style>
				<xsl:call-template name="GlobalStylesForm" />
			</head>
			<body class="styBodyClass">
				<form id="Form1118ScheduleL">
					<xsl:call-template name="DocumentHeaderLandscape" />
					<!-- Page 1 -->
					<!-- Header -->
					<div class="styStdDivLS">
						<div class="styFNBox" style="width:35mm;height:18mm;">
							<span class="styFN" style="font-size:9pt;">SCHEDULE L<br />(Form 1118)</span> 
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
								Attach to Form 1118.
							</span>
							<br />
							<span style="font-weight:bold;">
								Go to
								<span style="font-style:italic">www.irs.gov/Form1118</span>
								for instructions and the latest information.
							</span>
						</div>
						<div class="styTYBox" style="width:33mm;height:18mm;">
							<div class="styOMB" style="font-size:6pt;border:none;padding-top:8mm;">OMB No. 1545-0123</div>
						</div>
					</div>
					<!-- Filer information section -->
					<div class="styStdDivLS" style="border-top:1px solid black;border-bottom:1px solid black;">
						<div class="styNameBox" style="width:209.2mm;height:9.0mm;">
							Name of corporation <br />
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/CorporationName/BusinessNameLine1Txt"/>
							</xsl:call-template>
							<br />
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/CorporationName/BusinessNameLine2Txt"/>
							</xsl:call-template>
						</div>
						<div class="styEINBox" style="width:46mm;height:9.0mm;padding-left:1mm;font-weight:normal;">
							<strong>Employer identification number</strong>
							<span style="width:100%;text-align:center;">
								<xsl:call-template name="PopulateEIN">
									<xsl:with-param name="TargetNode" select="$FormData/CorporationEIN"/>
								</xsl:call-template>
							</span>
						</div>
					</div>
					<div class="styStdDivLS">
						<div class="styLNDesc" style="width:100%">
							Use a separate Schedule L (Form 1118) for each category of income (see instructions).
						</div>
					</div>
					<!-- Line a -->
					<div class="styStdDivLS">
						<div class="styLNLeftLtrBox">a</div>
						<div class="styLNDesc" style="width:215mm;">
							Separate category (enter code &mdash; see instructions)
							<span class="sty1118SLDotLn">.....................................</span>
						</div>
						<div class="styLNAmountBox" style="border-left-width:0px;text-align:center;">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/SeparateCategoryCd"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line b -->
					<div class="styStdDivLS">
						<div class="styLNLeftLtrBox">b</div>
						<div class="styLNDesc" style="width:215mm;">
							If code 901j is entered on line a, enter the country code for the sanctioned country (see instructions)
							<span class="sty1118SLDotLn">.....................</span>
						</div>
						<div class="styLNAmountBox" style="border-left-width:0px;text-align:center;">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/SanctionedCountryCd"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line c -->
					<div class="styStdDivLS">
						<div class="styLNLeftLtrBox">c</div>
						<div class="styLNDesc" style="width:215mm;">
							If one of the RBT codes is entered on line a, enter the country code for the treaty country (see instructions)
							<span class="sty1118SLDotLn">...................</span>
						</div>
						<div class="styLNAmountBox" style="border-left-width:0px;text-align:center;">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/TreatyCountryCd"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line d -->
					<div class="styStdDivLS">
						<div class="styLNLeftLtrBox">d</div>
						<div class="styLNDesc" style="width:215mm;height:auto;">
							Check this box if election made under Regulations section 1.905-5(e) to account for foreign tax redeterminations with respect to 
							pre-2018 tax years in <br /> foreign corporation’s last pooling year (see instructions)
							<span class="sty1118SLDotLn">...................................</span>
						</div>
						<div class="styLNAmountBox" style="border-width:0px;text-align:left;height:auto;padding-top:3mm;">
							<input type="checkbox" class="styCkboxNM" style="" aria-label="Section 1.905 - 5 e Election Ind">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$FormData/Section19055eElectionInd"/>
									<xsl:with-param name="BackupName">F1118sL/Section19055eElectionInd</xsl:with-param>
								</xsl:call-template>
							</input>
						</div>
					</div>

					<!-- Part 1 -->
					<div class="styStdDivLS" style="width:256mm;margin-top:1px;border-top:1px solid black;border-bottom:1px solid black;">
						<div class="styPartName" style="">Part I</div>
						<div class="styPartDesc" style="">
							Increase in Amount of Foreign Taxes Accrued <span style="font-weight:normal;">(see instructions)</span>
						</div>
					</div>
					<div class="styStdDivLS">
						<div class="styLNDesc" style="width:100%">
							Enter redetermined amounts by payor entity for each separate relation back year (starting with the most recent) followed by a subtotal for each relation back year (see instructions).
						</div>
					</div>
					<xsl:variable name="sep1" select="($Print = $Separated) and ((count($FormData/IncrAmtFrgnTaxesAccruedGrp) &gt; 2) or (count($FormData/IncrAmtFrgnTaxesAccruedGrp/PayorEntityRelationBackYearGrp) &gt; 6))"/>
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
									<th class="styTableCellHeader" scope="col" style="width:70mm;font-weight:normal;">
										<strong>2a. </strong> Name of Payor Entity
									</th>
									<th class="styTableCellHeader" scope="col" style="width:70mm;font-weight:normal;">
										<strong>2b. </strong> EIN or Reference ID Number <br /> of Payor
									</th>
									<th class="styTableCellHeader" scope="col" style="width:70mm;font-weight:normal;border-right-width:0px;">
										<strong>2c. </strong> Name of Owner of Payor Entity, if applicable <br /> (see instructions)
									</th>
								</tr>
							</thead>
							<tbody>
								<xsl:if test="not($sep1)">
									<xsl:for-each select="$FormData/IncrAmtFrgnTaxesAccruedGrp">
										<xsl:variable name="pos" select="position()"/>
										<tr>
											<td class="styTableCellCtrInherit" style="font-weight:bold;">
												<xsl:attribute name="rowspan">
													<xsl:choose>
														<xsl:when test="PayorEntityRelationBackYearGrp[4]"><xsl:value-of select="count(PayorEntityRelationBackYearGrp)"/></xsl:when>
														<xsl:otherwise>3</xsl:otherwise>
													</xsl:choose>
												</xsl:attribute>
												<xsl:number value="$pos" format="A"/>
											</td>
											<td class="styTableCellCtrInherit" style="">
												<xsl:attribute name="rowspan">
													<xsl:choose>
														<xsl:when test="PayorEntityRelationBackYearGrp[4]"><xsl:value-of select="count(PayorEntityRelationBackYearGrp)"/></xsl:when>
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
													<xsl:with-param name="TargetNode" select="PayorEntityRelationBackYearGrp[1]/PayorName/BusinessNameLine1Txt"/>
												</xsl:call-template>
												<xsl:if test="PayorEntityRelationBackYearGrp[1]/PayorName/BusinessNameLine2Txt">
													<br />
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="PayorEntityRelationBackYearGrp[1]/PayorName/BusinessNameLine2Txt"/>
													</xsl:call-template>
												</xsl:if>
											</td>
											<td class="styTableCellCtrInherit" style="word-break:break-all;">
												<xsl:choose>
													<xsl:when test="PayorEntityRelationBackYearGrp[1]/ForeignEntityIdentificationGrp">
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="PayorEntityRelationBackYearGrp[1]/ForeignEntityIdentificationGrp/ForeignEntityReferenceIdNum"/>
														</xsl:call-template>
													</xsl:when>
													<xsl:otherwise>
														<xsl:call-template name="PopulateEIN">
															<xsl:with-param name="TargetNode" select="PayorEntityRelationBackYearGrp[1]/PayorEIN"/>
														</xsl:call-template>
													</xsl:otherwise>
												</xsl:choose>
											</td>
											<td class="styTableCellTextInherit" style="border-right-width:0px;">
												<xsl:choose>
													<xsl:when test="PayorEntityRelationBackYearGrp[1]/BusinessOwnerName">
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="PayorEntityRelationBackYearGrp[1]/BusinessOwnerName/BusinessNameLine1Txt"/>
														</xsl:call-template>
														<xsl:if test="PayorEntityRelationBackYearGrp[1]/BusinessOwnerName/BusinessNameLine2Txt">
															<br />
															<xsl:call-template name="PopulateText">
																<xsl:with-param name="TargetNode" select="PayorEntityRelationBackYearGrp[1]/BusinessOwnerName/BusinessNameLine2Txt"/>
															</xsl:call-template>
														</xsl:if>
													</xsl:when>
													<xsl:otherwise>
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="PayorEntityRelationBackYearGrp[1]/OwnerNm"/>
														</xsl:call-template>
													</xsl:otherwise>
												</xsl:choose>
											</td>
										</tr>
										<xsl:for-each select="PayorEntityRelationBackYearGrp[position() &gt; 1]">
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
												<td class="styTableCellTextInherit" style="border-right-width:0px;">
													<xsl:choose>
														<xsl:when test="BusinessOwnerName">
															<xsl:call-template name="PopulateText">
																<xsl:with-param name="TargetNode" select="BusinessOwnerName/BusinessNameLine1Txt"/>
															</xsl:call-template>
															<xsl:if test="BusinessOwnerName/BusinessNameLine2Txt">
																<br />
																<xsl:call-template name="PopulateText">
																	<xsl:with-param name="TargetNode" select="BusinessOwnerName/BusinessNameLine2Txt"/>
																</xsl:call-template>
															</xsl:if>
														</xsl:when>
														<xsl:otherwise>
															<xsl:call-template name="PopulateText">
																<xsl:with-param name="TargetNode" select="OwnerNm"/>
															</xsl:call-template>
														</xsl:otherwise>
													</xsl:choose>
												</td>
											</tr>
										</xsl:for-each>
										<xsl:if test="count(PayorEntityRelationBackYearGrp) &lt; 2">
											<tr>
												<td class="styTableCellCtrInherit" style="font-weight:bold;">(2)</td>
												<td class="styTableCellTextInherit" style="">&nbsp;</td>
												<td class="styTableCellCtrInherit" style="word-break:break-all;">&nbsp;</td>
												<td class="styTableCellCtrInherit" style="border-right-width:0px;">&nbsp;</td>
											</tr>
										</xsl:if>
										<xsl:if test="count(PayorEntityRelationBackYearGrp) &lt; 3">
											<tr>
												<td class="styTableCellCtrInherit" style="font-weight:bold;">(3)</td>
												<td class="styTableCellTextInherit" style="">&nbsp;</td>
												<td class="styTableCellCtrInherit" style="word-break:break-all;">&nbsp;</td>
												<td class="styTableCellCtrInherit" style="border-right-width:0px;">&nbsp;</td>
											</tr>
										</xsl:if>
									</xsl:for-each>
								</xsl:if>
								<xsl:if test="$sep1 or count($FormData/IncrAmtFrgnTaxesAccruedGrp) &lt; 1">
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
										<td class="styTableCellCtrInherit" style="border-right-width:0px;">&nbsp;</td>
									</tr>
									<tr>
										<td class="styTableCellCtrInherit" style="font-weight:bold;">(2)</td>
										<td class="styTableCellTextInherit" style="">&nbsp;</td>
										<td class="styTableCellCtrInherit" style="">&nbsp;</td>
										<td class="styTableCellCtrInherit" style="border-right-width:0px;">&nbsp;</td>
									</tr>
									<tr>
										<td class="styTableCellCtrInherit" style="font-weight:bold;">(3)</td>
										<td class="styTableCellTextInherit" style="">&nbsp;</td>
										<td class="styTableCellCtrInherit" style="">&nbsp;</td>
										<td class="styTableCellCtrInherit" style="border-right-width:0px;">&nbsp;</td>
									</tr>
								</xsl:if>
								<xsl:if test="$sep1 or count($FormData/IncrAmtFrgnTaxesAccruedGrp) &lt; 2">
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
										<td class="styTableCellCtrInherit" style="border-right-width:0px;">&nbsp;</td>
									</tr>
									<tr>
										<td class="styTableCellCtrInherit" style="font-weight:bold;">(2)</td>
										<td class="styTableCellTextInherit" style="">&nbsp;</td>
										<td class="styTableCellCtrInherit" style="">&nbsp;</td>
										<td class="styTableCellCtrInherit" style="border-right-width:0px;">&nbsp;</td>
									</tr>
									<tr>
										<td class="styTableCellCtrInherit" style="font-weight:bold;">(3)</td>
										<td class="styTableCellTextInherit" style="">&nbsp;</td>
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
									<th class="styTableCellHeader" scope="col" style="width:100mm;font-weight:normal;padding:2mm 0mm;">
										<strong>2d. </strong> EIN or Reference ID Number of Owner
									</th>
									<th class="styTableCellHeader" scope="col" style="width:25mm;font-weight:normal;">
										<strong>3. </strong> Country or <br /> U.S. Possession <br /> to Which Tax <br /> Is Paid <br />
										(enter code &mdash; <br /> see instructions)
									</th>
									<th class="styTableCellHeader" scope="col" style="width:25mm;font-weight:normal;padding:2mm 0mm;">
										<strong>4. </strong> Date <br /> Additional <br /> Foreign Tax <br /> Was Paid <br /> (MM/DD/YYYY)
									</th>
									<th class="styTableCellHeader" scope="col" style="width:25mm;font-weight:normal;padding:2mm 0mm;">
										<strong>5. </strong> Foreign <br /> Tax Year <br /> to Which <br /> Tax Relates <br /> (MM/DD/YYYY)
									</th>
									<th class="styTableCellHeader" scope="col" style="width:31mm;font-weight:normal;padding:2mm 0mm;">
										<strong>6. </strong> Payor's Income <br /> Subject to Tax in the <br /> Foreign Jurisdiction <br /> (see instructions)
									</th>
									<th class="styTableCellHeader" scope="col" style="width:31mm;font-weight:normal;padding:2mm 0mm;border-right-width:0px;">
										<strong>7. </strong> Additional Tax <br /> Accrued in <br /> Local Currency <br /> in Which the <br /> Tax Is Payable
									</th>
								</tr>
							</thead>
							<tbody>
								<xsl:if test="not($sep1)">
									<xsl:for-each select="$FormData/IncrAmtFrgnTaxesAccruedGrp">
										<xsl:variable name="pos" select="position()"/>
										<tr>
											<td class="styTableCellCtrInherit" style="font-weight:bold;">
												<xsl:attribute name="rowspan">
													<xsl:choose>
														<xsl:when test="PayorEntityRelationBackYearGrp[4]"><xsl:value-of select="count(PayorEntityRelationBackYearGrp)"/></xsl:when>
														<xsl:otherwise>3</xsl:otherwise>
													</xsl:choose>
												</xsl:attribute>
												<xsl:number value="$pos" format="A"/>
											</td>
											<td class="styTableCellCtrInherit" style="font-weight:bold;">(1)</td>
											<td class="styTableCellCtrInherit" style="word-break:break-all;">
												<xsl:choose>
													<xsl:when test="PayorEntityRelationBackYearGrp[1]/OwnerFrgnEntIdentificationGrp">
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="PayorEntityRelationBackYearGrp[1]/OwnerFrgnEntIdentificationGrp/ForeignEntityReferenceIdNum"/>
														</xsl:call-template>
													</xsl:when>
													<xsl:otherwise>
														<xsl:call-template name="PopulateEIN">
															<xsl:with-param name="TargetNode" select="PayorEntityRelationBackYearGrp[1]/OwnerEIN"/>
														</xsl:call-template>
													</xsl:otherwise>
												</xsl:choose>
											</td>
											<td class="styTableCellCtrInherit" style="">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="PayorEntityRelationBackYearGrp[1]/ForeignCountryOrUSPossessionCd"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellCtrInherit" style="">
												<xsl:call-template name="PopulateMonthDayYear">
													<xsl:with-param name="TargetNode" select="PayorEntityRelationBackYearGrp[1]/AdditionalForeignTaxPaidDt"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellCtrInherit" style="">
												<xsl:call-template name="PopulateMonthDayYear">
													<xsl:with-param name="TargetNode" select="PayorEntityRelationBackYearGrp[1]/ForeignTaxYearEndDt"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellAmtInherit" style="">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="PayorEntityRelationBackYearGrp[1]/ForeignTaxableIncomeAmt"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellAmtInherit" style="border-right-width:0px;">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="PayorEntityRelationBackYearGrp[1]/AddnlTaxForeignCurrencyAmt"/>
													<xsl:with-param name="MaxSize" select="17"/>
												</xsl:call-template>
											</td>
										</tr>
										<xsl:for-each select="PayorEntityRelationBackYearGrp[position() &gt; 1]">
											<tr>
												<td class="styTableCellCtrInherit" style="font-weight:bold;">
													(<xsl:value-of select="position() + 1"/>)
												</td>
												<td class="styTableCellCtrInherit" style="word-break:break-all;">
													<xsl:choose>
														<xsl:when test="OwnerFrgnEntIdentificationGrp">
															<xsl:call-template name="PopulateText">
																<xsl:with-param name="TargetNode" select="OwnerFrgnEntIdentificationGrp/ForeignEntityReferenceIdNum"/>
															</xsl:call-template>
														</xsl:when>
														<xsl:otherwise>
															<xsl:call-template name="PopulateEIN">
																<xsl:with-param name="TargetNode" select="OwnerEIN"/>
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
												<td class="styTableCellCtrInherit" style="">
													<xsl:call-template name="PopulateMonthDayYear">
														<xsl:with-param name="TargetNode" select="ForeignTaxYearEndDt"/>
													</xsl:call-template>
												</td>
												<td class="styTableCellAmtInherit" style="">
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="ForeignTaxableIncomeAmt"/>
													</xsl:call-template>
												</td>
												<td class="styTableCellAmtInherit" style="border-right-width:0px;">
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="AddnlTaxForeignCurrencyAmt"/>
														<xsl:with-param name="MaxSize" select="17"/>
													</xsl:call-template>
												</td>
											</tr>
										</xsl:for-each>
										<xsl:if test="count(PayorEntityRelationBackYearGrp) &lt; 2">
											<tr>
												<td class="styTableCellCtrInherit" style="font-weight:bold;">(2)</td>
												<td class="styTableCellCtrInherit" style="">&nbsp;</td>
												<td class="styTableCellCtrInherit" style="">&nbsp;</td>
												<td class="styTableCellCtrInherit" style="">&nbsp;</td>
												<td class="styTableCellCtrInherit" style="">&nbsp;</td>
												<td class="styTableCellAmtInherit" style="">&nbsp;</td>
												<td class="styTableCellAmtInherit" style="border-right-width:0px;">&nbsp;</td>
											</tr>
										</xsl:if>
										<xsl:if test="count(PayorEntityRelationBackYearGrp) &lt; 3">
											<tr>
												<td class="styTableCellCtrInherit" style="font-weight:bold;">(3)</td>
												<td class="styTableCellCtrInherit" style="">&nbsp;</td>
												<td class="styTableCellCtrInherit" style="">&nbsp;</td>
												<td class="styTableCellCtrInherit" style="">&nbsp;</td>
												<td class="styTableCellCtrInherit" style="">&nbsp;</td>
												<td class="styTableCellAmtInherit" style="">&nbsp;</td>
												<td class="styTableCellAmtInherit" style="border-right-width:0px;">&nbsp;</td>
											</tr>
										</xsl:if>
									</xsl:for-each>
								</xsl:if>
								<xsl:if test="$sep1 or count($FormData/IncrAmtFrgnTaxesAccruedGrp) &lt; 1">
									<tr>
										<td class="styTableCellCtrInherit" rowspan="3" style="font-weight:bold;">
											A
										</td>
										<td class="styTableCellCtrInherit" style="font-weight:bold;">(1)</td>
										<td class="styTableCellCtrInherit" style="">&nbsp;</td>
										<td class="styTableCellCtrInherit" style="">&nbsp;</td>
										<td class="styTableCellCtrInherit" style="">&nbsp;</td>
										<td class="styTableCellCtrInherit" style="">&nbsp;</td>
										<td class="styTableCellAmtInherit" style="">&nbsp;</td>
										<td class="styTableCellAmtInherit" style="border-right-width:0px;">&nbsp;</td>
									</tr>
									<tr>
										<td class="styTableCellCtrInherit" style="font-weight:bold;">(2)</td>
										<td class="styTableCellCtrInherit" style="">&nbsp;</td>
										<td class="styTableCellCtrInherit" style="">&nbsp;</td>
										<td class="styTableCellCtrInherit" style="">&nbsp;</td>
										<td class="styTableCellCtrInherit" style="">&nbsp;</td>
										<td class="styTableCellAmtInherit" style="">&nbsp;</td>
										<td class="styTableCellAmtInherit" style="border-right-width:0px;">&nbsp;</td>
									</tr>
									<tr>
										<td class="styTableCellCtrInherit" style="font-weight:bold;">(3)</td>
										<td class="styTableCellCtrInherit" style="">&nbsp;</td>
										<td class="styTableCellCtrInherit" style="">&nbsp;</td>
										<td class="styTableCellCtrInherit" style="">&nbsp;</td>
										<td class="styTableCellCtrInherit" style="">&nbsp;</td>
										<td class="styTableCellAmtInherit" style="">&nbsp;</td>
										<td class="styTableCellAmtInherit" style="border-right-width:0px;">&nbsp;</td>
									</tr>
								</xsl:if>
								<xsl:if test="$sep1 or count($FormData/IncrAmtFrgnTaxesAccruedGrp) &lt; 2">
									<tr>
										<td class="styTableCellCtrInherit" rowspan="3" style="font-weight:bold;">
											B
										</td>
										<td class="styTableCellCtrInherit" style="font-weight:bold;">(1)</td>
										<td class="styTableCellCtrInherit" style="">&nbsp;</td>
										<td class="styTableCellCtrInherit" style="">&nbsp;</td>
										<td class="styTableCellCtrInherit" style="">&nbsp;</td>
										<td class="styTableCellCtrInherit" style="">&nbsp;</td>
										<td class="styTableCellAmtInherit" style="">&nbsp;</td>
										<td class="styTableCellAmtInherit" style="border-right-width:0px;">&nbsp;</td>
									</tr>
									<tr>
										<td class="styTableCellCtrInherit" style="font-weight:bold;">(2)</td>
										<td class="styTableCellCtrInherit" style="">&nbsp;</td>
										<td class="styTableCellCtrInherit" style="">&nbsp;</td>
										<td class="styTableCellCtrInherit" style="">&nbsp;</td>
										<td class="styTableCellCtrInherit" style="">&nbsp;</td>
										<td class="styTableCellAmtInherit" style="">&nbsp;</td>
										<td class="styTableCellAmtInherit" style="border-right-width:0px;">&nbsp;</td>
									</tr>
									<tr>
										<td class="styTableCellCtrInherit" style="font-weight:bold;">(3)</td>
										<td class="styTableCellCtrInherit" style="">&nbsp;</td>
										<td class="styTableCellCtrInherit" style="">&nbsp;</td>
										<td class="styTableCellCtrInherit" style="">&nbsp;</td>
										<td class="styTableCellCtrInherit" style="">&nbsp;</td>
										<td class="styTableCellAmtInherit" style="">&nbsp;</td>
										<td class="styTableCellAmtInherit" style="border-right-width:0px;">&nbsp;</td>
									</tr>
								</xsl:if>
							</tbody>
						</table>
					</div>
					<div class="styTableContainerLandscapeNBB" id="Page1Table3">
						<xsl:call-template name="SetInitialState"/>
						<table class="styTable" style="border-collapse:collapse;font-size:7pt;">
							<thead class="styTableThead">
								<tr style="border-top:1px solid black;vertical-align:top;">
									<th class="styTableCellHeader" scope="col" style="width:8mm;font-weight:normal;background-color:lightgrey;">&nbsp;</th>
									<th class="styTableCellHeader" scope="col" style="width:11mm;font-weight:normal;background-color:lightgrey;">&nbsp;</th>
									<th class="styTableCellHeader" scope="col" style="width:30mm;font-weight:normal;padding:2px 0mm;">
										<strong>8. </strong> Additional Tax Accrued in Functional Currency of Taxpayer’s QBU or Foreign Corporation
									</th>
									<th class="styTableCellHeader" scope="col" style="width:40mm;font-weight:normal;padding:2px 0mm;">
										<strong>9. </strong> Conversion Rate <br /> of Local Currency <br /> to U.S. Dollars
									</th>
									<th class="styTableCellHeader" scope="col" style="width:27mm;font-weight:normal;padding:2px 0mm;">
										<strong>10. </strong> Additional Tax <br /> Accrued in <br /> U.S. Dollars <br /> (divide column 7 <br /> by column 9)
									</th>
									<th class="styTableCellHeader" scope="col" style="width:27mm;font-weight:normal;padding:2px 0mm;">
										<strong>11. </strong> U.S. Dollar Tax <br /> of Payor Entity per <br /> Original/Amended Return
									</th>
									<th class="styTableCellHeader" scope="col" style="width:27mm;font-weight:normal;padding:2px 0mm;">
										<strong>12. </strong> Revised Tax Accrued <br /> (add column 10 <br /> and column 11)
									</th>
									<th class="styTableCellHeader" scope="col" style="width:60mm;font-weight:normal;padding:2px 0mm;">
										<strong>13. </strong> Reference ID Number <br /> for Contested Tax, <br /> if Applicable <br /> (see instructions)
									</th>
									<th class="styTableCellHeader" scope="col" style="width:26mm;font-weight:normal;padding:2px 0mm;border-right-width:0px;">
										<strong>14. </strong> Check Box if <br /> Change Caused <br /> to High Tax Exception/Exclusion <br /> (see instructions)
									</th>
								</tr>
							</thead>
							<tbody>
								<xsl:if test="not($sep1)">
									<xsl:for-each select="$FormData/IncrAmtFrgnTaxesAccruedGrp">
										<xsl:variable name="pos" select="position()"/>
										<tr>
											<td class="styTableCellCtrInherit" style="font-weight:bold;">
												<xsl:attribute name="rowspan">
													<xsl:choose>
														<xsl:when test="PayorEntityRelationBackYearGrp[4]"><xsl:value-of select="count(PayorEntityRelationBackYearGrp)"/></xsl:when>
														<xsl:otherwise>3</xsl:otherwise>
													</xsl:choose>
												</xsl:attribute>
												<xsl:number value="$pos" format="A"/>
											</td>
											<td class="styTableCellCtrInherit" style="font-weight:bold;">(1)</td>
											<td class="styTableCellAmtInherit" style="">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="PayorEntityRelationBackYearGrp[1]/AddnlTaxFunctionalCurrencyAmt"/>
													<xsl:with-param name="MaxSize" select="17"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellAmtInherit" style="word-break:break-all;">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="PayorEntityRelationBackYearGrp[1]/ConversionRt"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellAmtInherit" style="">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="PayorEntityRelationBackYearGrp[1]/AddnlTaxUSDollarsAmt"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellAmtInherit" style="">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="PayorEntityRelationBackYearGrp[1]/TaxOriginalAmdRetAmt"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellAmtInherit" style="">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="PayorEntityRelationBackYearGrp[1]/RevisedTaxAccruedAmt"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellCtrInherit" style="word-break:break-all;">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="PayorEntityRelationBackYearGrp[1]/ContestedTaxForeignEntityIdGrp/ForeignEntityReferenceIdNum"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellCtrInherit" style="border-right-width:0px;">
												<input type="checkbox" class="styCkboxNM" style="">
													<xsl:attribute name="aria-label">Row <xsl:number value="$pos" format="A"/> subrow 1, High Tax Exception Exclusion</xsl:attribute>
													<xsl:call-template name="PopulateCheckbox">
														<xsl:with-param name="TargetNode" select="PayorEntityRelationBackYearGrp[1]/HighTaxExceptionExclusionInd"/>
														<xsl:with-param name="BackupName">F1118sL-p1-<xsl:value-of select="$pos"/>-1-HighTaxExceptionExclusionInd</xsl:with-param>
													</xsl:call-template>
												</input>
											</td>
										</tr>
										<xsl:for-each select="PayorEntityRelationBackYearGrp[position() &gt; 1]">
											<tr>
												<td class="styTableCellCtrInherit" style="font-weight:bold;">
													(<xsl:value-of select="position() + 1"/>)
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
												<td class="styTableCellCtrInherit" style="word-break:break-all;">
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="ContestedTaxForeignEntityIdGrp/ForeignEntityReferenceIdNum"/>
													</xsl:call-template>
												</td>
												<td class="styTableCellCtrInherit" style="border-right-width:0px;">
													<input type="checkbox" class="styCkboxNM" style="">
														<xsl:attribute name="aria-label">Row <xsl:number value="$pos" format="A"/> subrow <xsl:value-of select="position() + 1"/>, High Tax Exception Exclusion</xsl:attribute>
														<xsl:call-template name="PopulateCheckbox">
															<xsl:with-param name="TargetNode" select="HighTaxExceptionExclusionInd"/>
															<xsl:with-param name="BackupName">F1118sL-p1-<xsl:value-of select="$pos"/>-<xsl:value-of select="position() + 1"/>-HighTaxExceptionExclusionInd</xsl:with-param>
														</xsl:call-template>
													</input>
												</td>
											</tr>
										</xsl:for-each>
										<xsl:if test="count(PayorEntityRelationBackYearGrp) &lt; 2">
											<tr>
												<td class="styTableCellCtrInherit" style="font-weight:bold;">(2)</td>
												<td class="styTableCellAmtInherit" style="">&nbsp;</td>
												<td class="styTableCellAmtInherit" style="">&nbsp;</td>
												<td class="styTableCellAmtInherit" style="">&nbsp;</td>
												<td class="styTableCellAmtInherit" style="">&nbsp;</td>
												<td class="styTableCellAmtInherit" style="">&nbsp;</td>
												<td class="styTableCellAmtInherit" style="">&nbsp;</td>
												<td class="styTableCellCtrInherit" style="border-right-width:0px;">
													<input type="checkbox" class="styCkboxNM" style="">
														<xsl:attribute name="aria-label">Row <xsl:number value="$pos" format="A"/> subrow 2, High Tax Exception Exclusion</xsl:attribute>
														<xsl:call-template name="PopulateCheckbox">
															<xsl:with-param name="TargetNode" select="/.."/>
															<xsl:with-param name="BackupName">F1118sL-p1-<xsl:value-of select="$pos"/>-2-HighTaxExceptionExclusionInd</xsl:with-param>
														</xsl:call-template>
													</input>
												</td>
											</tr>
										</xsl:if>
										<xsl:if test="count(PayorEntityRelationBackYearGrp) &lt; 3">
											<tr>
												<td class="styTableCellCtrInherit" style="font-weight:bold;">(3)</td>
												<td class="styTableCellAmtInherit" style="">&nbsp;</td>
												<td class="styTableCellAmtInherit" style="">&nbsp;</td>
												<td class="styTableCellAmtInherit" style="">&nbsp;</td>
												<td class="styTableCellAmtInherit" style="">&nbsp;</td>
												<td class="styTableCellAmtInherit" style="">&nbsp;</td>
												<td class="styTableCellAmtInherit" style="">&nbsp;</td>
												<td class="styTableCellCtrInherit" style="border-right-width:0px;">
													<input type="checkbox" class="styCkboxNM" style="">
														<xsl:attribute name="aria-label">Row <xsl:number value="$pos" format="A"/> subrow 3, High Tax Exception Exclusion</xsl:attribute>
														<xsl:call-template name="PopulateCheckbox">
															<xsl:with-param name="TargetNode" select="/.."/>
															<xsl:with-param name="BackupName">F1118sL-p1-<xsl:value-of select="$pos"/>-3-HighTaxExceptionExclusionInd</xsl:with-param>
														</xsl:call-template>
													</input>
												</td>
											</tr>
										</xsl:if>
										<tr style="vertical-align:bottom;">
											<td colspan="4" class="styTableCellTextInherit" style="font-family:Arial Narrow;">
												<strong>Subtotal by Relation Back Year of Taxpayer</strong>
												(add amounts in columns 10, 11, and 12) 
												<span class="sty1118SLDotLn" style="font-family:Verdana;">.</span>
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
											<td class="styTableCellCtrInherit" style="background-color:lightgrey;">&nbsp;</td>
											<td class="styTableCellCtrInherit" style="background-color:lightgrey;border-right-width:0px;">&nbsp;</td>
										</tr>
									</xsl:for-each>
								</xsl:if>
								<xsl:if test="$sep1 or count($FormData/IncrAmtFrgnTaxesAccruedGrp) &lt; 1">
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
										<td class="styTableCellCtrInherit" style="border-right-width:0px;">
											<input type="checkbox" class="styCkboxNM" style="">
												<xsl:attribute name="aria-label">Row A subrow 1, High Tax Exception Exclusion</xsl:attribute>
												<xsl:call-template name="PopulateCheckbox">
													<xsl:with-param name="TargetNode" select="/.."/>
													<xsl:with-param name="BackupName">F1118sL-p1-1-1-HighTaxExceptionExclusionInd</xsl:with-param>
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
										<td class="styTableCellCtrInherit" style="border-right-width:0px;">
											<input type="checkbox" class="styCkboxNM" style="">
												<xsl:attribute name="aria-label">Row A subrow 2, High Tax Exception Exclusion</xsl:attribute>
												<xsl:call-template name="PopulateCheckbox">
													<xsl:with-param name="TargetNode" select="/.."/>
													<xsl:with-param name="BackupName">F1118sL-p1-1-2-HighTaxExceptionExclusionInd</xsl:with-param>
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
										<td class="styTableCellCtrInherit" style="border-right-width:0px;">
											<input type="checkbox" class="styCkboxNM" style="">
												<xsl:attribute name="aria-label">Row A subrow 3, High Tax Exception Exclusion</xsl:attribute>
												<xsl:call-template name="PopulateCheckbox">
													<xsl:with-param name="TargetNode" select="/.."/>
													<xsl:with-param name="BackupName">F1118sL-p1-1-3-HighTaxExceptionExclusionInd</xsl:with-param>
												</xsl:call-template>
											</input>
										</td>
									</tr>
									<tr style="vertical-align:bottom;">
										<td colspan="4" class="styTableCellTextInherit" style="font-family:Arial Narrow;">
											<strong>Subtotal by Relation Back Year of Taxpayer</strong>
											(add amounts in columns 10, 11, and 12) 
											<span class="sty1118SLDotLn" style="font-family:Verdana;">.</span>
										</td>
										<td class="styTableCellAmtInherit" style="">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$FormData/IncrAmtFrgnTaxesAccruedGrp[1]/TotalAddnlTaxUSDollarsAmt"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellAmtInherit" style="">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$FormData/IncrAmtFrgnTaxesAccruedGrp[1]/TotalTaxOriginalAmdRetAmt"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellAmtInherit" style="">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$FormData/IncrAmtFrgnTaxesAccruedGrp[1]/TotalRevisedTaxAccruedAmt"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellCtrInherit" style="background-color:lightgrey;">&nbsp;</td>
										<td class="styTableCellCtrInherit" style="background-color:lightgrey;border-right-width:0px;">&nbsp;</td>
									</tr>
								</xsl:if>
								<xsl:if test="$sep1 or count($FormData/IncrAmtFrgnTaxesAccruedGrp) &lt; 2">
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
										<td class="styTableCellCtrInherit" style="border-right-width:0px;">
											<input type="checkbox" class="styCkboxNM" style="">
												<xsl:attribute name="aria-label">Row B subrow 1, High Tax Exception Exclusion</xsl:attribute>
												<xsl:call-template name="PopulateCheckbox">
													<xsl:with-param name="TargetNode" select="/.."/>
													<xsl:with-param name="BackupName">F1118sL-p1-2-1-HighTaxExceptionExclusionInd</xsl:with-param>
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
										<td class="styTableCellCtrInherit" style="border-right-width:0px;">
											<input type="checkbox" class="styCkboxNM" style="">
												<xsl:attribute name="aria-label">Row B subrow 2, High Tax Exception Exclusion</xsl:attribute>
												<xsl:call-template name="PopulateCheckbox">
													<xsl:with-param name="TargetNode" select="/.."/>
													<xsl:with-param name="BackupName">F1118sL-p1-2-2-HighTaxExceptionExclusionInd</xsl:with-param>
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
										<td class="styTableCellCtrInherit" style="border-right-width:0px;">
											<input type="checkbox" class="styCkboxNM" style="">
												<xsl:attribute name="aria-label">Row B subrow 3, High Tax Exception Exclusion</xsl:attribute>
												<xsl:call-template name="PopulateCheckbox">
													<xsl:with-param name="TargetNode" select="/.."/>
													<xsl:with-param name="BackupName">F1118sL-p1-2-3-HighTaxExceptionExclusionInd</xsl:with-param>
												</xsl:call-template>
											</input>
										</td>
									</tr>
									<tr style="vertical-align:bottom;">
										<td colspan="4" class="styTableCellTextInherit" style="font-family:Arial Narrow;">
											<strong>Subtotal by Relation Back Year of Taxpayer</strong>
											(add amounts in columns 10, 11, and 12) 
											<span class="sty1118SLDotLn" style="font-family:Verdana;">.</span>
										</td>
										<td class="styTableCellAmtInherit" style="">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$FormData/IncrAmtFrgnTaxesAccruedGrp[2]/TotalAddnlTaxUSDollarsAmt"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellAmtInherit" style="">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$FormData/IncrAmtFrgnTaxesAccruedGrp[2]/TotalTaxOriginalAmdRetAmt"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellAmtInherit" style="">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$FormData/IncrAmtFrgnTaxesAccruedGrp[2]/TotalRevisedTaxAccruedAmt"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellCtrInherit" style="background-color:lightgrey;">&nbsp;</td>
										<td class="styTableCellCtrInherit" style="background-color:lightgrey;border-right-width:0px;">&nbsp;</td>
									</tr>
								</xsl:if>
							</tbody>
						</table>
					</div>
					<div class="styStdDivLS">
						<div class="styLNDesc" style="width:100%;height:auto;">
							<strong>*Important: </strong> See <span style="font-style:italic;">Computer-Generated Schedule L </span> in the separate instructions for Schedule L (Form 1118).
						</div>
					</div>
					<div class="styStdDivLS pageEnd" style="border-top:2px solid black;font-weight:bold;">
						For Paperwork Reduction Act Notice, see the Instructions for Form 1118.
						<span style="margin-left:50mm;font-weight:normal;">Cat. No. 75132H</span>
						<span style="float:right;">Schedule L (Form 1118) (Rev. 12-2025)</span>
					</div>
					<!-- Page 2 -->
					<div class="styStdDivLS">
						Schedule L (Form 1118) (Rev. 12-2025)
						<span style="float:right;">Page <span style="font-weight:bold;font-size:8pt;">2</span></span>
					</div>
					<!-- Filer information section -->
					<div class="styStdDivLS" style="border-top:1px solid black;">
						<div class="styNameBox" style="width:209.2mm;height:auto;">
							Name of corporation <br />
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/CorporationName/BusinessNameLine1Txt"/>
							</xsl:call-template>
							<xsl:if test="$FormData/CorporationName/BusinessNameLine2Txt">
								<br />
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$FormData/CorporationName/BusinessNameLine2Txt"/>
								</xsl:call-template>
							</xsl:if>
						</div>
						<div class="styEINBox" style="width:46mm;height:auto;padding-left:1mm;font-weight:normal;">
							<strong>Employer identification number</strong>
							<span style="width:100%;text-align:center;">
								<xsl:call-template name="PopulateEIN">
									<xsl:with-param name="TargetNode" select="$FormData/CorporationEIN"/>
								</xsl:call-template>
							</span>
						</div>
					</div>
					<!-- Part 2 -->
					<div class="styStdDivLS" style="width:256mm;border-top:1px solid black;border-bottom:1px solid black;">
						<div class="styPartName" style="">Part II</div>
						<div class="styPartDesc" style="">
							Decrease in Amount of Foreign Taxes Paid or Accrued <span style="font-weight:normal;">(see instructions)</span>
						</div>
					</div>
					<div class="styStdDivLS">
						<div class="styLNDesc" style="width:100%">
							Enter redetermined amounts by payor entity for each separate relation back year (starting with the most recent) followed by a subtotal for each relation back year (see instructions).
						</div>
					</div>
					<xsl:variable name="sep2" select="($Print = $Separated) and ((count($FormData/DecrAmtFrgnTaxesPdAccruedGrp) &gt; 2) or (count($FormData/DecrAmtFrgnTaxesPdAccruedGrp/DecrPayorEntRelationBackYrGrp) &gt; 6))"/>
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
									<th class="styTableCellHeader" scope="col" style="width:70mm;font-weight:normal;">
										<strong>2a. </strong> Name of Payor Entity
									</th>
									<th class="styTableCellHeader" scope="col" style="width:70mm;font-weight:normal;">
										<strong>2b. </strong> EIN or Reference ID Number <br /> of Payor
									</th>
									<th class="styTableCellHeader" scope="col" style="width:70mm;font-weight:normal;border-right-width:0px;">
										<strong>2c. </strong> Name of Owner of Payor Entity, if applicable <br /> (see instructions)
									</th>
								</tr>
							</thead>
							<tbody>
								<xsl:if test="not($sep2)">
									<xsl:for-each select="$FormData/DecrAmtFrgnTaxesPdAccruedGrp">
										<xsl:variable name="pos" select="position()"/>
										<tr>
											<td class="styTableCellCtrInherit" style="font-weight:bold;">
												<xsl:attribute name="rowspan">
													<xsl:choose>
														<xsl:when test="DecrPayorEntRelationBackYrGrp[4]"><xsl:value-of select="count(DecrPayorEntRelationBackYrGrp)"/></xsl:when>
														<xsl:otherwise>3</xsl:otherwise>
													</xsl:choose>
												</xsl:attribute>
												<xsl:number value="$pos" format="A"/>
											</td>
											<td class="styTableCellCtrInherit" style="">
												<xsl:attribute name="rowspan">
													<xsl:choose>
														<xsl:when test="DecrPayorEntRelationBackYrGrp[4]"><xsl:value-of select="count(DecrPayorEntRelationBackYrGrp)"/></xsl:when>
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
													<xsl:with-param name="TargetNode" select="DecrPayorEntRelationBackYrGrp[1]/PayorName/BusinessNameLine1Txt"/>
												</xsl:call-template>
												<xsl:if test="DecrPayorEntRelationBackYrGrp[1]/PayorName/BusinessNameLine2Txt">
													<br />
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="DecrPayorEntRelationBackYrGrp[1]/PayorName/BusinessNameLine2Txt"/>
													</xsl:call-template>
												</xsl:if>
											</td>
											<td class="styTableCellCtrInherit" style="word-break:break-all;">
												<xsl:choose>
													<xsl:when test="DecrPayorEntRelationBackYrGrp[1]/ForeignEntityIdentificationGrp">
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="DecrPayorEntRelationBackYrGrp[1]/ForeignEntityIdentificationGrp/ForeignEntityReferenceIdNum"/>
														</xsl:call-template>
													</xsl:when>
													<xsl:otherwise>
														<xsl:call-template name="PopulateEIN">
															<xsl:with-param name="TargetNode" select="DecrPayorEntRelationBackYrGrp[1]/PayorEIN"/>
														</xsl:call-template>
													</xsl:otherwise>
												</xsl:choose>
											</td>
											<td class="styTableCellTextInherit" style="border-right-width:0px;">
												<xsl:choose>
													<xsl:when test="DecrPayorEntRelationBackYrGrp[1]/BusinessOwnerName">
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="DecrPayorEntRelationBackYrGrp[1]/BusinessOwnerName/BusinessNameLine1Txt"/>
														</xsl:call-template>
														<xsl:if test="DecrPayorEntRelationBackYrGrp[1]/BusinessOwnerName/BusinessNameLine2Txt">
															<br />
															<xsl:call-template name="PopulateText">
																<xsl:with-param name="TargetNode" select="DecrPayorEntRelationBackYrGrp[1]/BusinessOwnerName/BusinessNameLine2Txt"/>
															</xsl:call-template>
														</xsl:if>
													</xsl:when>
													<xsl:otherwise>
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="DecrPayorEntRelationBackYrGrp[1]/OwnerNm"/>
														</xsl:call-template>
													</xsl:otherwise>
												</xsl:choose>
											</td>
										</tr>
										<xsl:for-each select="DecrPayorEntRelationBackYrGrp[position() &gt; 1]">
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
												<td class="styTableCellTextInherit" style="border-right-width:0px;">
													<xsl:choose>
														<xsl:when test="BusinessOwnerName">
															<xsl:call-template name="PopulateText">
																<xsl:with-param name="TargetNode" select="BusinessOwnerName/BusinessNameLine1Txt"/>
															</xsl:call-template>
															<xsl:if test="BusinessOwnerName/BusinessNameLine2Txt">
																<br />
																<xsl:call-template name="PopulateText">
																	<xsl:with-param name="TargetNode" select="BusinessOwnerName/BusinessNameLine2Txt"/>
																</xsl:call-template>
															</xsl:if>
														</xsl:when>
														<xsl:otherwise>
															<xsl:call-template name="PopulateText">
																<xsl:with-param name="TargetNode" select="OwnerNm"/>
															</xsl:call-template>
														</xsl:otherwise>
													</xsl:choose>
												</td>
											</tr>
										</xsl:for-each>
										<xsl:if test="count(DecrPayorEntRelationBackYrGrp) &lt; 2">
											<tr>
												<td class="styTableCellCtrInherit" style="font-weight:bold;">(2)</td>
												<td class="styTableCellTextInherit" style="">&nbsp;</td>
												<td class="styTableCellCtrInherit" style="word-break:break-all;">&nbsp;</td>
												<td class="styTableCellCtrInherit" style="border-right-width:0px;">&nbsp;</td>
											</tr>
										</xsl:if>
										<xsl:if test="count(DecrPayorEntRelationBackYrGrp) &lt; 3">
											<tr>
												<td class="styTableCellCtrInherit" style="font-weight:bold;">(3)</td>
												<td class="styTableCellTextInherit" style="">&nbsp;</td>
												<td class="styTableCellCtrInherit" style="word-break:break-all;">&nbsp;</td>
												<td class="styTableCellCtrInherit" style="border-right-width:0px;">&nbsp;</td>
											</tr>
										</xsl:if>
									</xsl:for-each>
								</xsl:if>
								<xsl:if test="$sep1 or count($FormData/DecrAmtFrgnTaxesPdAccruedGrp) &lt; 1">
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
										<td class="styTableCellCtrInherit" style="border-right-width:0px;">&nbsp;</td>
									</tr>
									<tr>
										<td class="styTableCellCtrInherit" style="font-weight:bold;">(2)</td>
										<td class="styTableCellTextInherit" style="">&nbsp;</td>
										<td class="styTableCellCtrInherit" style="">&nbsp;</td>
										<td class="styTableCellCtrInherit" style="border-right-width:0px;">&nbsp;</td>
									</tr>
									<tr>
										<td class="styTableCellCtrInherit" style="font-weight:bold;">(3)</td>
										<td class="styTableCellTextInherit" style="">&nbsp;</td>
										<td class="styTableCellCtrInherit" style="">&nbsp;</td>
										<td class="styTableCellCtrInherit" style="border-right-width:0px;">&nbsp;</td>
									</tr>
								</xsl:if>
								<xsl:if test="$sep1 or count($FormData/DecrAmtFrgnTaxesPdAccruedGrp) &lt; 2">
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
										<td class="styTableCellCtrInherit" style="border-right-width:0px;">&nbsp;</td>
									</tr>
									<tr>
										<td class="styTableCellCtrInherit" style="font-weight:bold;">(2)</td>
										<td class="styTableCellTextInherit" style="">&nbsp;</td>
										<td class="styTableCellCtrInherit" style="">&nbsp;</td>
										<td class="styTableCellCtrInherit" style="border-right-width:0px;">&nbsp;</td>
									</tr>
									<tr>
										<td class="styTableCellCtrInherit" style="font-weight:bold;">(3)</td>
										<td class="styTableCellTextInherit" style="">&nbsp;</td>
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
								<tr style="border-top:1px solid black;">
									<th class="styTableCellHeader" scope="col" style="width:8mm;font-weight:normal;background-color:lightgrey;">&nbsp;</th>
									<th class="styTableCellHeader" scope="col" style="width:11mm;font-weight:normal;background-color:lightgrey;">&nbsp;</th>
									<th class="styTableCellHeader" scope="col" style="width:100mm;font-weight:normal;padding:2mm 0mm;">
										<strong>2d. </strong> EIN or Reference ID Number of Owner
									</th>
									<th class="styTableCellHeader" scope="col" style="width:25mm;font-weight:normal;">
										<strong>3. </strong> Country or <br /> U.S. Possession <br /> From Which Tax <br /> Was Refunded or Deemed Refunded <br />
										(enter code &mdash; <br /> see instructions)
									</th>
									<th class="styTableCellHeader" scope="col" style="width:25mm;font-weight:normal;padding:2mm 0.5mm;">
										<strong>4. </strong> Date Foreign <br /> Tax Was Refunded or Deemed Refunded <br /> (MM/DD/YYYY)
									</th>
									<th class="styTableCellHeader" scope="col" style="width:25mm;font-weight:normal;padding:2mm 0.5mm;">
										<strong>5. </strong> Foreign Tax <br /> Year to Which <br /> Tax Relates <br /> (MM/DD/YYYY)
									</th>
									<th class="styTableCellHeader" scope="col" style="width:31mm;font-weight:normal;padding:2mm 0.5mm;">
										<strong>6. </strong> Payor Entity's <br /> Income Subject <br /> to Tax in the <br /> Foreign Jurisdiction <br /> (see instructions)
									</th>
									<th class="styTableCellHeader" scope="col" style="width:31mm;font-weight:normal;padding:2mm 0mm;border-right-width:0px;">
										<strong>7. </strong> Tax Refunded or <br /> Deemed Refunded <br /> in Local Currency <br /> in Which the <br /> Tax Is Payable
									</th>
								</tr>
							</thead>
							<tbody>
								<xsl:if test="not($sep1)">
									<xsl:for-each select="$FormData/DecrAmtFrgnTaxesPdAccruedGrp">
										<xsl:variable name="pos" select="position()"/>
										<tr>
											<td class="styTableCellCtrInherit" style="font-weight:bold;">
												<xsl:attribute name="rowspan">
													<xsl:choose>
														<xsl:when test="DecrPayorEntRelationBackYrGrp[4]"><xsl:value-of select="count(DecrPayorEntRelationBackYrGrp)"/></xsl:when>
														<xsl:otherwise>3</xsl:otherwise>
													</xsl:choose>
												</xsl:attribute>
												<xsl:number value="$pos" format="A"/>
											</td>
											<td class="styTableCellCtrInherit" style="font-weight:bold;">(1)</td>
											<td class="styTableCellCtrInherit" style="word-break:break-all;">
												<xsl:choose>
													<xsl:when test="DecrPayorEntRelationBackYrGrp[1]/OwnerFrgnEntIdentificationGrp">
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="DecrPayorEntRelationBackYrGrp[1]/OwnerFrgnEntIdentificationGrp/ForeignEntityReferenceIdNum"/>
														</xsl:call-template>
													</xsl:when>
													<xsl:otherwise>
														<xsl:call-template name="PopulateEIN">
															<xsl:with-param name="TargetNode" select="DecrPayorEntRelationBackYrGrp[1]/OwnerEIN"/>
														</xsl:call-template>
													</xsl:otherwise>
												</xsl:choose>
											</td>
											<td class="styTableCellCtrInherit" style="">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="DecrPayorEntRelationBackYrGrp[1]/ForeignCountryOrUSPossessionCd"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellCtrInherit" style="">
												<xsl:call-template name="PopulateMonthDayYear">
													<xsl:with-param name="TargetNode" select="DecrPayorEntRelationBackYrGrp[1]/ForeignTaxRefundedDt"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellCtrInherit" style="">
												<xsl:call-template name="PopulateMonthDayYear">
													<xsl:with-param name="TargetNode" select="DecrPayorEntRelationBackYrGrp[1]/ForeignTaxYearEndDt"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellAmtInherit" style="">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="DecrPayorEntRelationBackYrGrp[1]/ForeignTaxableIncomeAmt"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellAmtInherit" style="border-right-width:0px;">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="DecrPayorEntRelationBackYrGrp[1]/TxRefundedInForeignCurrencyAmt"/>
													<xsl:with-param name="MaxSize" select="17"/>
												</xsl:call-template>
											</td>
										</tr>
										<xsl:for-each select="DecrPayorEntRelationBackYrGrp[position() &gt; 1]">
											<tr>
												<td class="styTableCellCtrInherit" style="font-weight:bold;">
													(<xsl:value-of select="position() + 1"/>)
												</td>
												<td class="styTableCellCtrInherit" style="word-break:break-all;">
													<xsl:choose>
														<xsl:when test="OwnerFrgnEntIdentificationGrp">
															<xsl:call-template name="PopulateText">
																<xsl:with-param name="TargetNode" select="OwnerFrgnEntIdentificationGrp/ForeignEntityReferenceIdNum"/>
															</xsl:call-template>
														</xsl:when>
														<xsl:otherwise>
															<xsl:call-template name="PopulateEIN">
																<xsl:with-param name="TargetNode" select="OwnerEIN"/>
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
												<td class="styTableCellCtrInherit" style="">
													<xsl:call-template name="PopulateMonthDayYear">
														<xsl:with-param name="TargetNode" select="ForeignTaxYearEndDt"/>
													</xsl:call-template>
												</td>
												<td class="styTableCellAmtInherit" style="">
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="ForeignTaxableIncomeAmt"/>
													</xsl:call-template>
												</td>
												<td class="styTableCellAmtInherit" style="border-right-width:0px;">
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="TxRefundedInForeignCurrencyAmt"/>
														<xsl:with-param name="MaxSize" select="17"/>
													</xsl:call-template>
												</td>
											</tr>
										</xsl:for-each>
										<xsl:if test="count(DecrPayorEntRelationBackYrGrp) &lt; 2">
											<tr>
												<td class="styTableCellCtrInherit" style="font-weight:bold;">(2)</td>
												<td class="styTableCellCtrInherit" style="">&nbsp;</td>
												<td class="styTableCellCtrInherit" style="">&nbsp;</td>
												<td class="styTableCellCtrInherit" style="">&nbsp;</td>
												<td class="styTableCellCtrInherit" style="">&nbsp;</td>
												<td class="styTableCellAmtInherit" style="">&nbsp;</td>
												<td class="styTableCellAmtInherit" style="border-right-width:0px;">&nbsp;</td>
											</tr>
										</xsl:if>
										<xsl:if test="count(DecrPayorEntRelationBackYrGrp) &lt; 3">
											<tr>
												<td class="styTableCellCtrInherit" style="font-weight:bold;">(3)</td>
												<td class="styTableCellCtrInherit" style="">&nbsp;</td>
												<td class="styTableCellCtrInherit" style="">&nbsp;</td>
												<td class="styTableCellCtrInherit" style="">&nbsp;</td>
												<td class="styTableCellCtrInherit" style="">&nbsp;</td>
												<td class="styTableCellAmtInherit" style="">&nbsp;</td>
												<td class="styTableCellAmtInherit" style="border-right-width:0px;">&nbsp;</td>
											</tr>
										</xsl:if>
									</xsl:for-each>
								</xsl:if>
								<xsl:if test="$sep1 or count($FormData/DecrAmtFrgnTaxesPdAccruedGrp) &lt; 1">
									<tr>
										<td class="styTableCellCtrInherit" rowspan="3" style="font-weight:bold;">
											A
										</td>
										<td class="styTableCellCtrInherit" style="font-weight:bold;">(1)</td>
										<td class="styTableCellCtrInherit" style="">&nbsp;</td>
										<td class="styTableCellCtrInherit" style="">&nbsp;</td>
										<td class="styTableCellCtrInherit" style="">&nbsp;</td>
										<td class="styTableCellCtrInherit" style="">&nbsp;</td>
										<td class="styTableCellAmtInherit" style="">&nbsp;</td>
										<td class="styTableCellAmtInherit" style="border-right-width:0px;">&nbsp;</td>
									</tr>
									<tr>
										<td class="styTableCellCtrInherit" style="font-weight:bold;">(2)</td>
										<td class="styTableCellCtrInherit" style="">&nbsp;</td>
										<td class="styTableCellCtrInherit" style="">&nbsp;</td>
										<td class="styTableCellCtrInherit" style="">&nbsp;</td>
										<td class="styTableCellCtrInherit" style="">&nbsp;</td>
										<td class="styTableCellAmtInherit" style="">&nbsp;</td>
										<td class="styTableCellAmtInherit" style="border-right-width:0px;">&nbsp;</td>
									</tr>
									<tr>
										<td class="styTableCellCtrInherit" style="font-weight:bold;">(3)</td>
										<td class="styTableCellCtrInherit" style="">&nbsp;</td>
										<td class="styTableCellCtrInherit" style="">&nbsp;</td>
										<td class="styTableCellCtrInherit" style="">&nbsp;</td>
										<td class="styTableCellCtrInherit" style="">&nbsp;</td>
										<td class="styTableCellAmtInherit" style="">&nbsp;</td>
										<td class="styTableCellAmtInherit" style="border-right-width:0px;">&nbsp;</td>
									</tr>
								</xsl:if>
								<xsl:if test="$sep1 or count($FormData/DecrAmtFrgnTaxesPdAccruedGrp) &lt; 2">
									<tr>
										<td class="styTableCellCtrInherit" rowspan="3" style="font-weight:bold;">
											B
										</td>
										<td class="styTableCellCtrInherit" style="font-weight:bold;">(1)</td>
										<td class="styTableCellCtrInherit" style="">&nbsp;</td>
										<td class="styTableCellCtrInherit" style="">&nbsp;</td>
										<td class="styTableCellCtrInherit" style="">&nbsp;</td>
										<td class="styTableCellCtrInherit" style="">&nbsp;</td>
										<td class="styTableCellAmtInherit" style="">&nbsp;</td>
										<td class="styTableCellAmtInherit" style="border-right-width:0px;">&nbsp;</td>
									</tr>
									<tr>
										<td class="styTableCellCtrInherit" style="font-weight:bold;">(2)</td>
										<td class="styTableCellCtrInherit" style="">&nbsp;</td>
										<td class="styTableCellCtrInherit" style="">&nbsp;</td>
										<td class="styTableCellCtrInherit" style="">&nbsp;</td>
										<td class="styTableCellCtrInherit" style="">&nbsp;</td>
										<td class="styTableCellAmtInherit" style="">&nbsp;</td>
										<td class="styTableCellAmtInherit" style="border-right-width:0px;">&nbsp;</td>
									</tr>
									<tr>
										<td class="styTableCellCtrInherit" style="font-weight:bold;">(3)</td>
										<td class="styTableCellCtrInherit" style="">&nbsp;</td>
										<td class="styTableCellCtrInherit" style="">&nbsp;</td>
										<td class="styTableCellCtrInherit" style="">&nbsp;</td>
										<td class="styTableCellCtrInherit" style="">&nbsp;</td>
										<td class="styTableCellAmtInherit" style="">&nbsp;</td>
										<td class="styTableCellAmtInherit" style="border-right-width:0px;">&nbsp;</td>
									</tr>
								</xsl:if>
							</tbody>
						</table>
					</div>
					<div class="styTableContainerLandscapeNBB" id="Page2Table3">
						<xsl:call-template name="SetInitialState"/>
						<table class="styTable" style="border-collapse:collapse;font-size:7pt;">
							<thead class="styTableThead">
								<tr style="border-top:1px solid black;">
									<th class="styTableCellHeader" scope="col" style="width:8mm;font-weight:normal;background-color:lightgrey;">&nbsp;</th>
									<th class="styTableCellHeader" scope="col" style="width:11mm;font-weight:normal;background-color:lightgrey;">&nbsp;</th>
									<th class="styTableCellHeader" scope="col" style="width:35mm;font-weight:normal;padding:2mm 0mm;">
										<strong>8. </strong> Refunded Amount <br /> in Functional Currency <br /> of Taxpayer's QBU <br /> or Foreign Corporation
									</th>
									<th class="styTableCellHeader" scope="col" style="width:42mm;font-weight:normal;padding:2mm 0mm;">
										<strong>9. </strong> Conversion Rate <br /> of Local Currency <br /> to U.S. Dollars
									</th>
									<th class="styTableCellHeader" scope="col" style="width:32mm;font-weight:normal;padding:2mm 0mm;">
										<strong>10. </strong> Refunded Amount <br /> in U.S. Dollars <br /> (divide column 7 <br /> by column 9)
									</th>
									<th class="styTableCellHeader" scope="col" style="width:32mm;font-weight:normal;padding:2mm 0mm;">
										<strong>11. </strong> U.S. Dollar Tax <br /> of Payor Entity per <br /> Original/Amended Return
									</th>
									<th class="styTableCellHeader" scope="col" style="width:32mm;font-weight:normal;padding:2mm 0mm;">
										<strong>12. </strong> Revised Tax <br /> Paid or Accrued <br /> (subtract column 10 <br /> from column 11)
									</th>
									<th class="styTableCellHeader" scope="col" style="width:32mm;font-weight:normal;padding:2mm 0mm;">
										<strong>13. </strong> Check Box if <br /> Section 905(c)(2) <br /> Two Year Rule Applies <br /> (see instructions)
									</th>
									<th class="styTableCellHeader" scope="col" style="width:32mm;font-weight:normal;padding:2mm 0mm;border-right-width:0px;">
										<strong>14. </strong> Check Box if <br /> Change Caused <br /> to High Tax Exception/Exclusion <br /> (see instructions)
									</th>
								</tr>
							</thead>
							<tbody>
								<xsl:if test="not($sep2)">
									<xsl:for-each select="$FormData/DecrAmtFrgnTaxesPdAccruedGrp">
										<xsl:variable name="pos" select="position()"/>
										<tr>
											<td class="styTableCellCtrInherit" style="font-weight:bold;">
												<xsl:attribute name="rowspan">
													<xsl:choose>
														<xsl:when test="DecrPayorEntRelationBackYrGrp[4]"><xsl:value-of select="count(DecrPayorEntRelationBackYrGrp)"/></xsl:when>
														<xsl:otherwise>3</xsl:otherwise>
													</xsl:choose>
												</xsl:attribute>
												<xsl:number value="$pos" format="A"/>
											</td>
											<td class="styTableCellCtrInherit" style="font-weight:bold;">(1)</td>
											<td class="styTableCellAmtInherit" style="">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="DecrPayorEntRelationBackYrGrp[1]/TxRefdInFunctionalCurrencyAmt"/>
													<xsl:with-param name="MaxSize" select="17"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellAmtInherit" style="word-break:break-all;">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="DecrPayorEntRelationBackYrGrp[1]/ConversionRt"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellAmtInherit" style="">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="DecrPayorEntRelationBackYrGrp[1]/RefundInUSDollarsAmt"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellAmtInherit" style="">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="DecrPayorEntRelationBackYrGrp[1]/TaxOriginalAmdRetAmt"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellAmtInherit" style="">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="DecrPayorEntRelationBackYrGrp[1]/RevisedTaxPaidAccruedAmt"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellCtrInherit" style="">
												<input type="checkbox" class="styCkboxNM" style="">
													<xsl:attribute name="aria-label">Row <xsl:number value="$pos" format="A"/> subrow 1, Section 905 c 2 Two Year Rule</xsl:attribute>
													<xsl:call-template name="PopulateCheckbox">
														<xsl:with-param name="TargetNode" select="DecrPayorEntRelationBackYrGrp[1]/Section905c2TwoYrRuleInd"/>
														<xsl:with-param name="BackupName">F1118sL-p2-<xsl:value-of select="$pos"/>-1-Section905c2TwoYrRuleInd</xsl:with-param>
													</xsl:call-template>
												</input>
											</td>
											<td class="styTableCellCtrInherit" style="border-right-width:0px;">
												<input type="checkbox" class="styCkboxNM" style="">
													<xsl:attribute name="aria-label">Row <xsl:number value="$pos" format="A"/> subrow 1, High Tax Exception Exclusion</xsl:attribute>
													<xsl:call-template name="PopulateCheckbox">
														<xsl:with-param name="TargetNode" select="DecrPayorEntRelationBackYrGrp[1]/HighTaxExceptionExclusionInd"/>
														<xsl:with-param name="BackupName">F1118sL-p2-<xsl:value-of select="$pos"/>-1-HighTaxExceptionExclusionInd</xsl:with-param>
													</xsl:call-template>
												</input>
											</td>
										</tr>
										<xsl:for-each select="DecrPayorEntRelationBackYrGrp[position() &gt; 1]">
											<tr>
												<td class="styTableCellCtrInherit" style="font-weight:bold;">
													(<xsl:value-of select="position() + 1"/>)
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
												<td class="styTableCellCtrInherit" style="">
													<input type="checkbox" class="styCkboxNM" style="">
														<xsl:attribute name="aria-label">Row <xsl:number value="$pos" format="A"/> subrow <xsl:value-of select="position() + 1"/>, Section 905 c 2 Two Year Rule</xsl:attribute>
														<xsl:call-template name="PopulateCheckbox">
															<xsl:with-param name="TargetNode" select="Section905c2TwoYrRuleInd"/>
															<xsl:with-param name="BackupName">F1118sL-p2-<xsl:value-of select="$pos"/>-<xsl:value-of select="position() + 1"/>-Section905c2TwoYrRuleInd</xsl:with-param>
														</xsl:call-template>
													</input>
												</td>
												<td class="styTableCellCtrInherit" style="border-right-width:0px;">
													<input type="checkbox" class="styCkboxNM" style="">
														<xsl:attribute name="aria-label">Row <xsl:number value="$pos" format="A"/> subrow <xsl:value-of select="position() + 1"/>, High Tax Exception Exclusion</xsl:attribute>
														<xsl:call-template name="PopulateCheckbox">
															<xsl:with-param name="TargetNode" select="HighTaxExceptionExclusionInd"/>
															<xsl:with-param name="BackupName">F1118sL-p2-<xsl:value-of select="$pos"/>-<xsl:value-of select="position() + 1"/>-HighTaxExceptionExclusionInd</xsl:with-param>
														</xsl:call-template>
													</input>
												</td>
											</tr>
										</xsl:for-each>
										<xsl:if test="count(DecrPayorEntRelationBackYrGrp) &lt; 2">
											<tr>
												<td class="styTableCellCtrInherit" style="font-weight:bold;">(2)</td>
												<td class="styTableCellAmtInherit" style="">&nbsp;</td>
												<td class="styTableCellAmtInherit" style="">&nbsp;</td>
												<td class="styTableCellAmtInherit" style="">&nbsp;</td>
												<td class="styTableCellAmtInherit" style="">&nbsp;</td>
												<td class="styTableCellAmtInherit" style="">&nbsp;</td>
												<td class="styTableCellCtrInherit" style="">
													<input type="checkbox" class="styCkboxNM" style="">
														<xsl:attribute name="aria-label">Row <xsl:number value="$pos" format="A"/> subrow 2, Section 905 c 2 Two Year Rule</xsl:attribute>
														<xsl:call-template name="PopulateCheckbox">
															<xsl:with-param name="TargetNode" select="/.."/>
															<xsl:with-param name="BackupName">F1118sL-p2-<xsl:value-of select="$pos"/>-2-Section905c2TwoYrRuleInd</xsl:with-param>
														</xsl:call-template>
													</input>
												</td>
												<td class="styTableCellCtrInherit" style="border-right-width:0px;">
													<input type="checkbox" class="styCkboxNM" style="">
														<xsl:attribute name="aria-label">Row <xsl:number value="$pos" format="A"/> subrow 2, High Tax Exception Exclusion</xsl:attribute>
														<xsl:call-template name="PopulateCheckbox">
															<xsl:with-param name="TargetNode" select="/.."/>
															<xsl:with-param name="BackupName">F1118sL-p2-<xsl:value-of select="$pos"/>-2-HighTaxExceptionExclusionInd</xsl:with-param>
														</xsl:call-template>
													</input>
												</td>
											</tr>
										</xsl:if>
										<xsl:if test="count(DecrPayorEntRelationBackYrGrp) &lt; 3">
											<tr>
												<td class="styTableCellCtrInherit" style="font-weight:bold;">(3)</td>
												<td class="styTableCellAmtInherit" style="">&nbsp;</td>
												<td class="styTableCellAmtInherit" style="">&nbsp;</td>
												<td class="styTableCellAmtInherit" style="">&nbsp;</td>
												<td class="styTableCellAmtInherit" style="">&nbsp;</td>
												<td class="styTableCellAmtInherit" style="">&nbsp;</td>
												<td class="styTableCellCtrInherit" style="">
													<input type="checkbox" class="styCkboxNM" style="">
														<xsl:attribute name="aria-label">Row <xsl:number value="$pos" format="A"/> subrow 3, Section 905 c 2 Two Year Rule</xsl:attribute>
														<xsl:call-template name="PopulateCheckbox">
															<xsl:with-param name="TargetNode" select="/.."/>
															<xsl:with-param name="BackupName">F1118sL-p2-<xsl:value-of select="$pos"/>-3-Section905c2TwoYrRuleInd</xsl:with-param>
														</xsl:call-template>
													</input>
												</td>
												<td class="styTableCellCtrInherit" style="border-right-width:0px;">
													<input type="checkbox" class="styCkboxNM" style="">
														<xsl:attribute name="aria-label">Row <xsl:number value="$pos" format="A"/> subrow 3, High Tax Exception Exclusion</xsl:attribute>
														<xsl:call-template name="PopulateCheckbox">
															<xsl:with-param name="TargetNode" select="/.."/>
															<xsl:with-param name="BackupName">F1118sL-p2-<xsl:value-of select="$pos"/>-3-HighTaxExceptionExclusionInd</xsl:with-param>
														</xsl:call-template>
													</input>
												</td>
											</tr>
										</xsl:if>
										<tr style="vertical-align:bottom;">
											<td colspan="4" class="styTableCellTextInherit" style="">
												<strong>Subtotal by Relation Back Year of Taxpayer</strong><br />
												(add amounts in columns 10, 11, and 12) 
												<span class="sty1118SLDotLn">........</span>
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
											<td class="styTableCellCtrInherit" style="background-color:lightgrey;">&nbsp;</td>
											<td class="styTableCellCtrInherit" style="background-color:lightgrey;border-right-width:0px;">&nbsp;</td>
										</tr>
									</xsl:for-each>
								</xsl:if>
								<xsl:if test="$sep2 or count($FormData/DecrAmtFrgnTaxesPdAccruedGrp) &lt; 1">
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
										<td class="styTableCellCtrInherit" style="">
											<input type="checkbox" class="styCkboxNM" style="">
												<xsl:attribute name="aria-label">Row A subrow 1, Section 905 c 2 Two Year Rule</xsl:attribute>
												<xsl:call-template name="PopulateCheckbox">
													<xsl:with-param name="TargetNode" select="/.."/>
													<xsl:with-param name="BackupName">F1118sL-p2-A-1-Section905c2TwoYrRuleInd</xsl:with-param>
												</xsl:call-template>
											</input>
										</td>
										<td class="styTableCellCtrInherit" style="border-right-width:0px;">
											<input type="checkbox" class="styCkboxNM" style="">
												<xsl:attribute name="aria-label">Row A subrow 1, High Tax Exception Exclusion</xsl:attribute>
												<xsl:call-template name="PopulateCheckbox">
													<xsl:with-param name="TargetNode" select="/.."/>
													<xsl:with-param name="BackupName">F1118sL-p2-A-1-HighTaxExceptionExclusionInd</xsl:with-param>
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
										<td class="styTableCellCtrInherit" style="">
											<input type="checkbox" class="styCkboxNM" style="">
												<xsl:attribute name="aria-label">Row A subrow 2, Section 905 c 2 Two Year Rule</xsl:attribute>
												<xsl:call-template name="PopulateCheckbox">
													<xsl:with-param name="TargetNode" select="/.."/>
													<xsl:with-param name="BackupName">F1118sL-p2-A-2-Section905c2TwoYrRuleInd</xsl:with-param>
												</xsl:call-template>
											</input>
										</td>
										<td class="styTableCellCtrInherit" style="border-right-width:0px;">
											<input type="checkbox" class="styCkboxNM" style="">
												<xsl:attribute name="aria-label">Row A subrow 2, High Tax Exception Exclusion</xsl:attribute>
												<xsl:call-template name="PopulateCheckbox">
													<xsl:with-param name="TargetNode" select="/.."/>
													<xsl:with-param name="BackupName">F1118sL-p2-A-2-HighTaxExceptionExclusionInd</xsl:with-param>
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
										<td class="styTableCellCtrInherit" style="">
											<input type="checkbox" class="styCkboxNM" style="">
												<xsl:attribute name="aria-label">Row A subrow 3, Section 905 c 2 Two Year Rule</xsl:attribute>
												<xsl:call-template name="PopulateCheckbox">
													<xsl:with-param name="TargetNode" select="/.."/>
													<xsl:with-param name="BackupName">F1118sL-p2-A-3-Section905c2TwoYrRuleInd</xsl:with-param>
												</xsl:call-template>
											</input>
										</td>
										<td class="styTableCellCtrInherit" style="border-right-width:0px;">
											<input type="checkbox" class="styCkboxNM" style="">
												<xsl:attribute name="aria-label">Row A subrow 3, High Tax Exception Exclusion</xsl:attribute>
												<xsl:call-template name="PopulateCheckbox">
													<xsl:with-param name="TargetNode" select="/.."/>
													<xsl:with-param name="BackupName">F1118sL-p2-A-3-HighTaxExceptionExclusionInd</xsl:with-param>
												</xsl:call-template>
											</input>
										</td>
									</tr>
									<tr style="vertical-align:bottom;">
										<td colspan="4" class="styTableCellTextInherit" style="">
											<strong>Subtotal by Relation Back Year of Taxpayer</strong><br />
											(add amounts in columns 10, 11, and 12) 
											<span class="sty1118SLDotLn">........</span>
										</td>
										<td class="styTableCellAmtInherit" style="">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$FormData/DecrAmtFrgnTaxesPdAccruedGrp[1]/TotalRefundInUSDollarsAmt"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellAmtInherit" style="">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$FormData/DecrAmtFrgnTaxesPdAccruedGrp[1]/TotalTaxOriginalAmdRetAmt"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellAmtInherit" style="">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$FormData/DecrAmtFrgnTaxesPdAccruedGrp[1]/TotalRevisedTaxPaidAccruedAmt"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellCtrInherit" style="background-color:lightgrey;">&nbsp;</td>
										<td class="styTableCellCtrInherit" style="background-color:lightgrey;border-right-width:0px;">&nbsp;</td>
									</tr>
								</xsl:if>
								<xsl:if test="$sep2 or count($FormData/DecrAmtFrgnTaxesPdAccruedGrp) &lt; 2">
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
										<td class="styTableCellCtrInherit" style="">
											<input type="checkbox" class="styCkboxNM" style="">
												<xsl:attribute name="aria-label">Row B subrow 1, Section 905 c 2 Two Year Rule</xsl:attribute>
												<xsl:call-template name="PopulateCheckbox">
													<xsl:with-param name="TargetNode" select="/.."/>
													<xsl:with-param name="BackupName">F1118sL-p2-B-1-Section905c2TwoYrRuleInd</xsl:with-param>
												</xsl:call-template>
											</input>
										</td>
										<td class="styTableCellCtrInherit" style="border-right-width:0px;">
											<input type="checkbox" class="styCkboxNM" style="">
												<xsl:attribute name="aria-label">Row B subrow 1, High Tax Exception Exclusion</xsl:attribute>
												<xsl:call-template name="PopulateCheckbox">
													<xsl:with-param name="TargetNode" select="/.."/>
													<xsl:with-param name="BackupName">F1118sL-p2-B-1-HighTaxExceptionExclusionInd</xsl:with-param>
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
										<td class="styTableCellCtrInherit" style="">
											<input type="checkbox" class="styCkboxNM" style="">
												<xsl:attribute name="aria-label">Row B subrow 2, Section 905 c 2 Two Year Rule</xsl:attribute>
												<xsl:call-template name="PopulateCheckbox">
													<xsl:with-param name="TargetNode" select="/.."/>
													<xsl:with-param name="BackupName">F1118sL-p2-B-2-Section905c2TwoYrRuleInd</xsl:with-param>
												</xsl:call-template>
											</input>
										</td>
										<td class="styTableCellCtrInherit" style="border-right-width:0px;">
											<input type="checkbox" class="styCkboxNM" style="">
												<xsl:attribute name="aria-label">Row B subrow 2, High Tax Exception Exclusion</xsl:attribute>
												<xsl:call-template name="PopulateCheckbox">
													<xsl:with-param name="TargetNode" select="/.."/>
													<xsl:with-param name="BackupName">F1118sL-p2-B-2-HighTaxExceptionExclusionInd</xsl:with-param>
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
										<td class="styTableCellCtrInherit" style="">
											<input type="checkbox" class="styCkboxNM" style="">
												<xsl:attribute name="aria-label">Row B subrow 3, Section 905 c 2 Two Year Rule</xsl:attribute>
												<xsl:call-template name="PopulateCheckbox">
													<xsl:with-param name="TargetNode" select="/.."/>
													<xsl:with-param name="BackupName">F1118sL-p2-B-3-Section905c2TwoYrRuleInd</xsl:with-param>
												</xsl:call-template>
											</input>
										</td>
										<td class="styTableCellCtrInherit" style="border-right-width:0px;">
											<input type="checkbox" class="styCkboxNM" style="">
												<xsl:attribute name="aria-label">Row B subrow 3, High Tax Exception Exclusion</xsl:attribute>
												<xsl:call-template name="PopulateCheckbox">
													<xsl:with-param name="TargetNode" select="/.."/>
													<xsl:with-param name="BackupName">F1118sL-p2-B-3-HighTaxExceptionExclusionInd</xsl:with-param>
												</xsl:call-template>
											</input>
										</td>
									</tr>
									<tr style="vertical-align:bottom;">
										<td colspan="4" class="styTableCellTextInherit" style="">
											<strong>Subtotal by Relation Back Year of Taxpayer</strong><br />
											(add amounts in columns 10, 11, and 12) 
											<span class="sty1118SLDotLn">........</span>
										</td>
										<td class="styTableCellAmtInherit" style="">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$FormData/DecrAmtFrgnTaxesPdAccruedGrp[2]/TotalRefundInUSDollarsAmt"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellAmtInherit" style="">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$FormData/DecrAmtFrgnTaxesPdAccruedGrp[2]/TotalTaxOriginalAmdRetAmt"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellAmtInherit" style="">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$FormData/DecrAmtFrgnTaxesPdAccruedGrp[2]/TotalRevisedTaxPaidAccruedAmt"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellCtrInherit" style="background-color:lightgrey;">&nbsp;</td>
										<td class="styTableCellCtrInherit" style="background-color:lightgrey;border-right-width:0px;">&nbsp;</td>
									</tr>
								</xsl:if>
							</tbody>
						</table>
					</div>
					<div class="styStdDivLS">
						<div class="styLNDesc" style="width:100%;height:auto;">
							<strong>*Important: </strong> See <span style="font-style:italic;">Computer-Generated Schedule L </span> in the separate instructions for Schedule L (Form 1118).
						</div>
					</div>
					<div class="styStdDivLS pageEnd" style="border-top:1px solid black;font-weight:bold;">
						<span style="float:right;">Schedule L (Form 1118) (Rev. 12-2025)</span>
					</div>
					<!-- Page 3 -->
					<div class="styStdDivLS">
						Schedule L (Form 1118) (Rev. 12-2025)
						<span style="float:right;">Page <span style="font-weight:bold;font-size:8pt;">3</span></span>
					</div>
					<!-- Filer information section -->
					<div class="styStdDivLS" style="border-top:1px solid black;">
						<div class="styNameBox" style="width:209.2mm;height:auto;">
							Name of corporation <br />
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/CorporationName/BusinessNameLine1Txt"/>
							</xsl:call-template>
							<xsl:if test="$FormData/CorporationName/BusinessNameLine2Txt">
								<br />
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$FormData/CorporationName/BusinessNameLine2Txt"/>
								</xsl:call-template>
							</xsl:if>
						</div>
						<div class="styEINBox" style="width:46mm;height:auto;padding-left:1mm;font-weight:normal;">
							<strong>Employer identification number</strong>
							<span style="width:100%;text-align:center;">
								<xsl:call-template name="PopulateEIN">
									<xsl:with-param name="TargetNode" select="$FormData/CorporationEIN"/>
								</xsl:call-template>
							</span>
						</div>
					</div>
					<!-- Part 3 -->
					<div class="styStdDivLS" style="width:256mm;border-top:1px solid black;border-bottom:1px solid black;">
						<div class="styPartName" style="">Part III</div>
						<div class="styPartDesc" style="width:200mm;">
							Change in Inclusions; Change in Foreign Taxes Paid, Accrued, or Deemed Paid; and Change in Foreign Tax Credits Claimed
						</div>
					</div>
					<div class="styStdDivLS">
						<div class="styLNDesc" style="width:100%;height:auto;">
							Enter the information below for the change in inclusions, change to the amount of foreign taxes paid, accrued, or deemed paid, and change in foreign tax credits claimed for each 
							relation back year. This information is reported on an overall taxpayer basis and not on a per payor entity basis.
						</div>
					</div>
					<xsl:variable name="sep3" select="($Print = $Separated) and (count($FormData/ChgInclsnTxsPdAccrDmdCrClmGrp) &gt; 2)"/>
					<div class="styTableContainerLandscapeNBB" id="Part3Table1">
						<xsl:call-template name="SetInitialState"/>
						<table class="styTable" style="border-collapse:collapse;font-size:7pt;">
							<thead class="styTableThead">
								<tr style="border-top:1px solid black;">
									<th class="styTableCellHeader" scope="col" style="width:84mm;font-weight:normal;padding:0.5mm;">
										<strong>1. </strong> Relation Back Year <br /> (MM/DD/YYYY)
									</th>
									<th class="styTableCellHeader" scope="col" style="width:42mm;font-weight:normal;padding:0.5mm;">
										<strong>2. </strong> Redetermined <br /> Direct Section 901 <br /> and/or 903 Taxes <br /> Paid or Accrued
									</th>
									<th class="styTableCellHeader" scope="col" style="width:42mm;font-weight:normal;padding:0.5mm;">
										<strong>3. </strong> Direct Section 901 <br /> and/or 903 Taxes <br /> Paid or Accrued <br /> per Original/Amended Return
									</th>
									<th class="styTableCellHeader" scope="col" style="width:42mm;font-weight:normal;padding:0.5mm;">
										<strong>4. </strong> Redetermined <br /> Section 951(a)(1) Inclusion
									</th>
									<th class="styTableCellHeader" scope="col" style="width:42mm;font-weight:normal;padding:0.5mm;border-right-width:0px;">
										<strong>5. </strong> Section 951(a)(1) Inclusion <br /> per Original/Amended Return
									</th>
								</tr>
							</thead>
							<tbody>
								<xsl:if test="not($sep3)">
									<xsl:for-each select="$FormData/ChgInclsnTxsPdAccrDmdCrClmGrp">
										<tr>
											<td class="styTableCellCtrInherit" style="">
												<xsl:call-template name="PopulateMonthDayYear">
													<xsl:with-param name="TargetNode" select="USTaxYearEndDt"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellAmtInherit" style="">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="RedetermSect901Or903TaxesAmt"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellAmtInherit" style="">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="DirectSect901Or903PerReturnAmt"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellAmtInherit" style="">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="RedetermSect951a1InclsnAmt"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellAmtInherit" style="border-right-width:0px;">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="Sect951a1InclsnPerReturnAmt"/>
												</xsl:call-template>
											</td>
										</tr>
									</xsl:for-each>
								</xsl:if>
								<xsl:if test="$sep3 or count($FormData/ChgInclsnTxsPdAccrDmdCrClmGrp) &lt; 1">
									<tr>
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
								<xsl:if test="$sep3 or count($FormData/ChgInclsnTxsPdAccrDmdCrClmGrp) &lt; 2">
									<tr>
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
					<div class="styTableContainerLandscapeNBB" id="Part3Table2">
						<xsl:call-template name="SetInitialState"/>
						<table class="styTable" style="border-collapse:collapse;font-size:7pt;">
							<thead class="styTableThead">
								<tr style="border-top:1px solid black;">
									<th class="styTableCellHeader" scope="col" style="width:42mm;font-weight:normal;padding:2mm 0.5mm;">
										<strong>6. </strong> Redetermined Taxes <br /> Deemed Paid <br /> Under Section 960(a)
									</th>
									<th class="styTableCellHeader" scope="col" style="width:42mm;font-weight:normal;padding:2mm 0.5mm;">
										<strong>7. </strong> Section 960(a) <br /> Deemed Paid Taxes <br /> per Original/Amended Return
									</th>
									<th class="styTableCellHeader" scope="col" style="width:42mm;font-weight:normal;padding:2mm 0.5mm;">
										<strong>8. </strong> Redetermined <br /> Section 951A Inclusion
									</th>
									<th class="styTableCellHeader" scope="col" style="width:42mm;font-weight:normal;padding:2mm 0.5mm;">
										<strong>9. </strong> Section 951A Inclusion <br /> per Original/Amended Return
									</th>
									<th class="styTableCellHeader" scope="col" style="width:42mm;font-weight:normal;padding:2mm 0.5mm;">
										<strong>10. </strong> Redetermined Taxes <br /> Deemed Paid <br /> Under Section 960(d)
									</th>
									<th class="styTableCellHeader" scope="col" style="width:42mm;font-weight:normal;padding:2mm 0.5mm;border-right-width:0px;">
										<strong>11. </strong> Section 960(d) <br /> Deemed Paid Taxes <br /> per Original/Amended Return
									</th>
								</tr>
							</thead>
							<tbody>
								<xsl:if test="not($sep3)">
									<xsl:for-each select="$FormData/ChgInclsnTxsPdAccrDmdCrClmGrp">
										<tr>
											<td class="styTableCellAmtInherit" style="">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="RedetermDmdPdSect960aTxsAmt"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellAmtInherit" style="">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="Sect960aDmdPdTxsPerReturnAmt"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellAmtInherit" style="">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="RedetermSect951AInclsnAmt"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellAmtInherit" style="">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="Sect951AInclsnPerReturnAmt"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellAmtInherit" style="">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="RedetermDmdPdSect960dTxsAmt"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellAmtInherit" style="border-right-width:0px;">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="Sect960dDmdPdTxsPerReturnAmt"/>
												</xsl:call-template>
											</td>
										</tr>
									</xsl:for-each>
								</xsl:if>
								<xsl:if test="$sep3 or count($FormData/ChgInclsnTxsPdAccrDmdCrClmGrp) &lt; 1">
									<tr>
										<td class="styTableCellAmtInherit" style="">&nbsp;</td>
										<td class="styTableCellAmtInherit" style="">&nbsp;</td>
										<td class="styTableCellAmtInherit" style="">&nbsp;</td>
										<td class="styTableCellAmtInherit" style="">&nbsp;</td>
										<td class="styTableCellAmtInherit" style="">&nbsp;</td>
										<td class="styTableCellAmtInherit" style="border-right-width:0px;">&nbsp;</td>
									</tr>
								</xsl:if>
								<xsl:if test="$sep3 or count($FormData/ChgInclsnTxsPdAccrDmdCrClmGrp) &lt; 2">
									<tr>
										<td class="styTableCellAmtInherit" style="">&nbsp;</td>
										<td class="styTableCellAmtInherit" style="">&nbsp;</td>
										<td class="styTableCellAmtInherit" style="">&nbsp;</td>
										<td class="styTableCellAmtInherit" style="">&nbsp;</td>
										<td class="styTableCellAmtInherit" style="">&nbsp;</td>
										<td class="styTableCellAmtInherit" style="border-right-width:0px;">&nbsp;</td>
									</tr>
								</xsl:if>
							</tbody>
						</table>
					</div>
					<div class="styTableContainerLandscapeNBB" id="Part3Table3">
						<xsl:call-template name="SetInitialState"/>
						<table class="styTable" style="border-collapse:collapse;font-size:7pt;">
							<thead class="styTableThead">
								<tr style="border-top:1px solid black;">
									<th class="styTableCellHeader" scope="col" style="width:42mm;font-weight:normal;padding:2mm 0.5mm;">
										<strong>12. </strong> Redetermined Taxes <br /> Deemed Paid <br /> Under Section 960(b)(1)
									</th>
									<th class="styTableCellHeader" scope="col" style="width:42mm;font-weight:normal;padding:2mm 0.5mm;">
										<strong>13. </strong> Section 960(b)(1) <br /> Deemed Paid Taxes <br /> per Original/Amended Return
									</th>
									<th class="styTableCellHeader" scope="col" style="width:42mm;font-weight:normal;padding:2mm 0.5mm;">
										<strong>14. </strong> Redetermined Taxes <br /> Deemed Paid <br /> Under Section 902
									</th>
									<th class="styTableCellHeader" scope="col" style="width:42mm;font-weight:normal;padding:2mm 0.5mm;">
										<strong>15. </strong> Section 902 <br /> Deemed Paid Taxes <br /> per Original/Amended Return
									</th>
									<th class="styTableCellHeader" scope="col" style="width:42mm;font-weight:normal;padding:2mm 0.5mm;">
										<strong>16. </strong> Amount of FTC Claimed <br /> per Original/Amended Return
									</th>
									<th class="styTableCellHeader" scope="col" style="width:42mm;font-weight:normal;padding:2mm 0.5mm;border-right-width:0px;">
										<strong>17. </strong> Amount of FTC Claimed <br /> After Redetermination
									</th>
								</tr>
							</thead>
							<tbody>
								<xsl:if test="not($sep3)">
									<xsl:for-each select="$FormData/ChgInclsnTxsPdAccrDmdCrClmGrp">
										<tr>
											<td class="styTableCellAmtInherit" style="">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="RedetermDmdPdSect960b1TxsAmt"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellAmtInherit" style="">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="Sect960b1DmdPdTxsPerReturnAmt"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellAmtInherit" style="">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="RedetermDmdPdSect902TxsAmt"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellAmtInherit" style="">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="Sect902DmdPdTxsPerReturnAmt"/>
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
								<xsl:if test="$sep3 or count($FormData/ChgInclsnTxsPdAccrDmdCrClmGrp) &lt; 1">
									<tr>
										<td class="styTableCellAmtInherit" style="">&nbsp;</td>
										<td class="styTableCellAmtInherit" style="">&nbsp;</td>
										<td class="styTableCellAmtInherit" style="">&nbsp;</td>
										<td class="styTableCellAmtInherit" style="">&nbsp;</td>
										<td class="styTableCellAmtInherit" style="">&nbsp;</td>
										<td class="styTableCellAmtInherit" style="border-right-width:0px;">&nbsp;</td>
									</tr>
								</xsl:if>
								<xsl:if test="$sep3 or count($FormData/ChgInclsnTxsPdAccrDmdCrClmGrp) &lt; 2">
									<tr>
										<td class="styTableCellAmtInherit" style="">&nbsp;</td>
										<td class="styTableCellAmtInherit" style="">&nbsp;</td>
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
					<div class="styStdDivLS" style="width:256mm;border-top:1px solid black;border-bottom:1px solid black;">
						<div class="styPartName" style="">Part IV</div>
						<div class="styPartDesc" style="">
							Change in U.S. Tax Liability
						</div>
					</div>
					<div class="styStdDivLS">
						<div class="styLNDesc" style="width:100%;height:auto;">
							Enter the below information for the change in U.S. tax liability for each relation back year and other affected year. This information is reported on an overall taxpayer basis and not on a per payor entity basis.
						</div>
					</div>
					<xsl:variable name="sep4" select="($Print = $Separated) and (count($FormData/ChgUSTxLiabilityGrp) &gt; 2)"/>
					<div class="styTableContainerLandscapeNBB" id="Part4Table">
						<xsl:call-template name="SetInitialState"/>
						<table class="styTable" style="border-collapse:collapse;font-size:7pt;">
							<thead class="styTableThead">
								<tr style="border-top:1px solid black;vertical-align:top;">
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
											<td class="styTableCellAmtInherit" style="border-right-width:0px;">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="DifferenceBetweenTotalsAmt"/>
												</xsl:call-template>
											</td>
										</tr>
									</xsl:for-each>
								</xsl:if>
								<xsl:if test="$sep4 or count($FormData/ChgUSTxLiabilityGrp) &lt; 1">
									<tr>
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
										<td class="styTableCellAmtInherit" style="border-right-width:0px;">&nbsp;</td>
									</tr>
								</xsl:if>
								<xsl:if test="$sep4 or count($FormData/ChgUSTxLiabilityGrp) &lt; 2">
									<tr>
										<td class="styTableCellCtrInherit" style="">&nbsp;</td>
										<td class="styTableCellAmtInherit" style="">&nbsp;</td>
										<td class="styTableCellAmtInherit" style="">&nbsp;</td>
										<td class="styTableCellAmtInherit" style="border-right-width:0px;">&nbsp;</td>
									</tr>
								</xsl:if>
							</tbody>
						</table>
					</div>
					<div class="styStdDivLS">
						<div class="styLNDesc" style="width:100%;height:auto;">
							<strong>*Important: </strong> See <span style="font-style:italic;">Computer-Generated Schedule L </span> in the separate instructions for Schedule L (Form 1118).
						</div>
					</div>
					<div class="styStdDivLS pageEnd" style="border-top:1px solid black;font-weight:bold;">
						<span style="float:right;">Schedule L (Form 1118) (Rev. 12-2025)</span>
					</div>
					<!-- Page 4 -->
					<div class="styStdDivLS">
						Schedule L (Form 1118) (Rev. 12-2025)
						<span style="float:right;">Page <span style="font-weight:bold;font-size:8pt;">4</span></span>
					</div>
					<!-- Filer information section -->
					<div class="styStdDivLS" style="border-top:1px solid black;">
						<div class="styNameBox" style="width:209.2mm;height:auto;">
							Name of corporation <br />
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/CorporationName/BusinessNameLine1Txt"/>
							</xsl:call-template>
							<xsl:if test="$FormData/CorporationName/BusinessNameLine2Txt">
								<br />
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$FormData/CorporationName/BusinessNameLine2Txt"/>
								</xsl:call-template>
							</xsl:if>
						</div>
						<div class="styEINBox" style="width:46mm;height:auto;padding-left:1mm;font-weight:normal;">
							<strong>Employer identification number</strong>
							<span style="width:100%;text-align:center;">
								<xsl:call-template name="PopulateEIN">
									<xsl:with-param name="TargetNode" select="$FormData/CorporationEIN"/>
								</xsl:call-template>
							</span>
						</div>
					</div>
					<!-- Part 5 -->
					<div class="styStdDivLS" style="width:256mm;border-top:1px solid black;border-bottom:1px solid black;">
						<div class="styPartName" style="">Part V</div>
						<div class="styPartDesc" style="">
							Annual Reporting for Contested Taxes
						</div>
					</div>
					<div class="styStdDivLS">
						<div class="styLNDesc" style="width:100%;height:auto;">
							Beginning with tax year 2023, taxpayers will enter the information below for each contested foreign tax liability for which the taxpayer has previously made an election under Regulations section 1.905-1(d)(4) to claim a provisional foreign tax credit.
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
										<strong>1. </strong> Relation <br /> Back Year <br /> (MM/DD/YYYY)
									</th>
									<th class="styTableCellHeader" scope="col" style="width:110mm;font-weight:normal;padding:2mm 0mm;">
										<strong>2. </strong> Name of Payor Entity <br /> (see instructions)
									</th>
									<th class="styTableCellHeader" scope="col" style="width:84mm;font-weight:normal;padding:2mm 0mm;">
										<strong>3. </strong> Reference ID Number for the Contested Tax
									</th>
									<th class="styTableCellHeader" scope="col" style="width:25mm;font-weight:normal;padding:0.5mm 0mm;border-right-width:0px;">
										<strong>4. </strong> Country or U.S. Possession to Which Tax Was Paid (enter code)
									</th>
								</tr>
							</thead>
							<tbody>
								<xsl:if test="not(sep5)">
									<xsl:for-each select="$FormData/AnnualRptgContestedTaxesGrp">
										<tr>
											<td class="styTableCellCtrInherit" style="font-weight:bold;">
												(<xsl:number value="position()" format="i"/>)
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
											(i)
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
											(ii)
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
											(iii)
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
											(iv)
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
											(v)
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
									<th class="styTableCellHeader" scope="col" style="width:62mm;font-weight:normal;padding:2mm 0mm;">
										<strong>5. </strong> Amount of Contested Tax <br /> Provisionally Claimed as Credit
									</th>
									<th class="styTableCellHeader" scope="col" style="width:36mm;font-weight:normal;padding:2mm 0mm;">
										<strong>6. </strong> Contest <br /> Ongoing
									</th>
									<th class="styTableCellHeader" scope="col" style="width:36mm;font-weight:normal;padding:2mm 0mm;">
										<strong>7. </strong> Contest <br /> Resolved
									</th>
									<th class="styTableCellHeader" scope="col" style="width:36mm;font-weight:normal;padding:2mm 0mm;">
										<strong>8. </strong> Date Contest <br /> Resolved <br /> (MM/DD/YYYY)
									</th>
									<th class="styTableCellHeader" scope="col" style="width:36mm;font-weight:normal;padding:2mm 0mm;">
										<strong>9. </strong> Tax Refunded, if any <br/>(see instructions)
									</th>
									<th class="styTableCellHeader" scope="col" style="width:38mm;font-weight:normal;padding:2mm 0mm;border-right-width:0px;">
										<strong>10. </strong> Additional Tax Paid, <br/>if any <br/>(see instructions)
									</th>
								</tr>
							</thead>
							<tbody>
								<xsl:if test="not($sep5)">
									<xsl:for-each select="$FormData/AnnualRptgContestedTaxesGrp">
										<tr>
											<td class="styTableCellCtrInherit" style="font-weight:bold;">
												(<xsl:number value="position()" format="i"/>)
											</td>
											<td class="styTableCellAmtInherit" style="">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="ContestedTaxPrvsnClmdCrAmt"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellCtrInherit" style="">
												<input type="checkbox" class="styCkboxNM" style="">
													<xsl:attribute name="aria-label">Row <xsl:value-of select="position()"/> Contest Ongoing</xsl:attribute>
													<xsl:call-template name="PopulateCheckbox">
														<xsl:with-param name="TargetNode" select="ContestOngoingInd"/>
														<xsl:with-param name="BackupName">F1118sL/ContestOngoingInd<xsl:value-of select="position()"/></xsl:with-param>
													</xsl:call-template>
												</input>
											</td>
											<td class="styTableCellCtrInherit" style="">
												<input type="checkbox" class="styCkboxNM" style="">
													<xsl:attribute name="aria-label">Row <xsl:value-of select="position()"/> Contest Resolved</xsl:attribute>
													<xsl:call-template name="PopulateCheckbox">
														<xsl:with-param name="TargetNode" select="ContestResolvedInd"/>
														<xsl:with-param name="BackupName">F1118sL/ContestResolvedInd<xsl:value-of select="position()"/></xsl:with-param>
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
													<xsl:with-param name="TargetNode" select="RefundAmt"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellAmtInherit" style="border-right-width:0px;">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="AdditionalTaxPaidAmt"/>
												</xsl:call-template>
											</td>
										</tr>
									</xsl:for-each>
								</xsl:if>
								<xsl:if test="$sep5 or count($FormData/AnnualRptgContestedTaxesGrp) &lt; 1">
									<tr>
										<td class="styTableCellCtrInherit" style="font-weight:bold;">
											(i)
										</td>
										<td class="styTableCellCtrInherit" style="">&nbsp;</td>
										<td class="styTableCellCtrInherit" style="">
											<input type="checkbox" class="styCkboxNM" style="" aria-label="Row 1 Contest Ongoing">
												<xsl:call-template name="PopulateCheckbox">
													<xsl:with-param name="TargetNode" select="/.."/>
													<xsl:with-param name="BackupName">F1118sL/ContestOngoingInd1</xsl:with-param>
												</xsl:call-template>
											</input>
										</td>
										<td class="styTableCellCtrInherit" style="">
											<input type="checkbox" class="styCkboxNM" style="" aria-label="Row 1 Contest Resolved">
												<xsl:call-template name="PopulateCheckbox">
													<xsl:with-param name="TargetNode" select="/.."/>
													<xsl:with-param name="BackupName">F1118sL/ContestResolvedInd1</xsl:with-param>
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
											(ii)
										</td>
										<td class="styTableCellCtrInherit" style="">&nbsp;</td>
										<td class="styTableCellCtrInherit" style="">
											<input type="checkbox" class="styCkboxNM" style="" aria-label="Row 2 Contest Ongoing">
												<xsl:call-template name="PopulateCheckbox">
													<xsl:with-param name="TargetNode" select="/.."/>
													<xsl:with-param name="BackupName">F1118sL/ContestOngoingInd2</xsl:with-param>
												</xsl:call-template>
											</input>
										</td>
										<td class="styTableCellCtrInherit" style="">
											<input type="checkbox" class="styCkboxNM" style="" aria-label="Row 2 Contest Resolved">
												<xsl:call-template name="PopulateCheckbox">
													<xsl:with-param name="TargetNode" select="/.."/>
													<xsl:with-param name="BackupName">F1118sL/ContestResolvedInd2</xsl:with-param>
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
											(iii)
										</td>
										<td class="styTableCellCtrInherit" style="">&nbsp;</td>
										<td class="styTableCellCtrInherit" style="">
											<input type="checkbox" class="styCkboxNM" style="" aria-label="Row 3 Contest Ongoing">
												<xsl:call-template name="PopulateCheckbox">
													<xsl:with-param name="TargetNode" select="/.."/>
													<xsl:with-param name="BackupName">F1118sL/ContestOngoingInd3</xsl:with-param>
												</xsl:call-template>
											</input>
										</td>
										<td class="styTableCellCtrInherit" style="">
											<input type="checkbox" class="styCkboxNM" style="" aria-label="Row 3 Contest Resolved">
												<xsl:call-template name="PopulateCheckbox">
													<xsl:with-param name="TargetNode" select="/.."/>
													<xsl:with-param name="BackupName">F1118sL/ContestResolvedInd3</xsl:with-param>
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
											(iv)
										</td>
										<td class="styTableCellCtrInherit" style="">&nbsp;</td>
										<td class="styTableCellCtrInherit" style="">
											<input type="checkbox" class="styCkboxNM" style="" aria-label="Row 4 Contest Ongoing">
												<xsl:call-template name="PopulateCheckbox">
													<xsl:with-param name="TargetNode" select="/.."/>
													<xsl:with-param name="BackupName">F1118sL/ContestOngoingInd4</xsl:with-param>
												</xsl:call-template>
											</input>
										</td>
										<td class="styTableCellCtrInherit" style="">
											<input type="checkbox" class="styCkboxNM" style="" aria-label="Row 4 Contest Resolved">
												<xsl:call-template name="PopulateCheckbox">
													<xsl:with-param name="TargetNode" select="/.."/>
													<xsl:with-param name="BackupName">F1118sL/ContestResolvedInd4</xsl:with-param>
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
											(v)
										</td>
										<td class="styTableCellCtrInherit" style="">&nbsp;</td>
										<td class="styTableCellCtrInherit" style="">
											<input type="checkbox" class="styCkboxNM" style="" aria-label="Row 5 Contest Ongoing">
												<xsl:call-template name="PopulateCheckbox">
													<xsl:with-param name="TargetNode" select="/.."/>
													<xsl:with-param name="BackupName">F1118sL/ContestOngoingInd5</xsl:with-param>
												</xsl:call-template>
											</input>
										</td>
										<td class="styTableCellCtrInherit" style="">
											<input type="checkbox" class="styCkboxNM" style="" aria-label="Row 5 Contest Resolved">
												<xsl:call-template name="PopulateCheckbox">
													<xsl:with-param name="TargetNode" select="/.."/>
													<xsl:with-param name="BackupName">F1118sL/ContestResolvedInd5</xsl:with-param>
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
					<div class="styStdDivLS">
						<div class="styLNDesc" style="width:100%;height:auto;">
							<strong>*Important: </strong> See <span style="font-style:italic;">Computer-Generated Schedule L </span> in the separate instructions for Schedule L (Form 1118).
						</div>
					</div>
					<div class="styStdDivLS pageEnd" style="border-top:2px solid black;font-weight:bold;">
						<span style="float:right;">Schedule L (Form 1118) (Rev. 12-2025)</span>
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
										<strong>2b. </strong> EIN or Reference ID Number <br /> of Payor
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
								<xsl:for-each select="$FormData/IncrAmtFrgnTaxesAccruedGrp">
									<xsl:variable name="pos" select="position()"/>
									<tr>
										<xsl:attribute name="class">
											<xsl:choose>
												<xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when>
												<xsl:otherwise>styDepTblRow2</xsl:otherwise>
											</xsl:choose>
										</xsl:attribute>
										<td class="styTableCellCtrInherit" style="font-weight:bold;">
											<xsl:attribute name="rowspan"><xsl:value-of select="count(PayorEntityRelationBackYearGrp)"/></xsl:attribute>
											<xsl:number value="$pos" format="A"/>
										</td>
										<td class="styTableCellCtrInherit" style="">
											<xsl:attribute name="rowspan"><xsl:value-of select="count(PayorEntityRelationBackYearGrp)"/></xsl:attribute>
											<span style="width:22mm;height:3.5mm;border-bottom:1px solid black;">
												<xsl:call-template name="PopulateMonthDayYear">
													<xsl:with-param name="TargetNode" select="USTaxYearEndDt"/>
												</xsl:call-template>
											</span>
										</td>
										<td class="styTableCellCtrInherit" style="font-weight:bold;">(1)</td>
										<td class="styTableCellTextInherit" style="">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="PayorEntityRelationBackYearGrp[1]/PayorName/BusinessNameLine1Txt"/>
											</xsl:call-template>
											<xsl:if test="PayorEntityRelationBackYearGrp[1]/PayorName/BusinessNameLine2Txt">
												<br />
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="PayorEntityRelationBackYearGrp[1]/PayorName/BusinessNameLine2Txt"/>
												</xsl:call-template>
											</xsl:if>
										</td>
										<td class="styTableCellCtrInherit" style="word-break:break-all;">
											<xsl:choose>
												<xsl:when test="PayorEntityRelationBackYearGrp[1]/ForeignEntityIdentificationGrp">
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="PayorEntityRelationBackYearGrp[1]/ForeignEntityIdentificationGrp/ForeignEntityReferenceIdNum"/>
													</xsl:call-template>
												</xsl:when>
												<xsl:otherwise>
													<xsl:call-template name="PopulateEIN">
														<xsl:with-param name="TargetNode" select="PayorEntityRelationBackYearGrp[1]/PayorEIN"/>
													</xsl:call-template>
												</xsl:otherwise>
											</xsl:choose>
										</td>
										<td class="styTableCellCtrInherit" style="">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="PayorEntityRelationBackYearGrp[1]/ForeignCountryOrUSPossessionCd"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellCtrInherit" style="">
											<xsl:call-template name="PopulateMonthDayYear">
												<xsl:with-param name="TargetNode" select="PayorEntityRelationBackYearGrp[1]/AdditionalForeignTaxPaidDt"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellCtrInherit" style="border-right-width:0px;">
											<xsl:call-template name="PopulateMonthDayYear">
												<xsl:with-param name="TargetNode" select="PayorEntityRelationBackYearGrp[1]/ForeignTaxYearEndDt"/>
											</xsl:call-template>
										</td>
									</tr>
									<xsl:for-each select="PayorEntityRelationBackYearGrp[position() &gt; 1]">
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
									<th class="styDepTblCell" scope="col" style="width:100mm;font-weight:normal;padding:2mm 0mm;">
										<strong>2d. </strong> EIN or Reference ID Number of Owner
									</th>
									<th class="styDepTblCell" scope="col" style="width:25mm;font-weight:normal;">
										<strong>3. </strong> Country or <br /> U.S. Possession <br /> to Which Tax <br /> Is Paid <br />
										(enter code &mdash; <br /> see instructions)
									</th>
									<th class="styDepTblCell" scope="col" style="width:25mm;font-weight:normal;padding:2mm 0mm;">
										<strong>4. </strong> Date <br /> Additional <br /> Foreign Tax <br /> Was Paid <br /> (MM/DD/YYYY)
									</th>
									<th class="styDepTblCell" scope="col" style="width:25mm;font-weight:normal;padding:2mm 0mm;">
										<strong>5. </strong> Foreign <br /> Tax Year <br /> to Which <br /> Tax Relates <br /> (MM/DD/YYYY)
									</th>
									<th class="styDepTblCell" scope="col" style="width:31mm;font-weight:normal;padding:2mm 0mm;">
										<strong>6. </strong> Payor's Income <br /> Subject to Tax in the <br /> Foreign Jurisdiction <br /> (see instructions)
									</th>
									<th class="styDepTblCell" scope="col" style="width:31mm;font-weight:normal;padding:2mm 0mm;border-right-width:0px;">
										<strong>7. </strong> Additional Tax <br /> Accrued in <br /> Local Currency <br /> in Which the <br /> Tax Is Payable
									</th>
								</tr>
							</thead>
							<tbody>
								<xsl:for-each select="$FormData/IncrAmtFrgnTaxesAccruedGrp">
									<xsl:variable name="pos" select="position()"/>
									<tr>
										<xsl:attribute name="class">
											<xsl:choose>
												<xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when>
												<xsl:otherwise>styDepTblRow2</xsl:otherwise>
											</xsl:choose>
										</xsl:attribute>
										<td class="styTableCellCtrInherit" style="font-weight:bold;">
											<xsl:attribute name="rowspan"><xsl:value-of select="count(PayorEntityRelationBackYearGrp)"/></xsl:attribute>
											<xsl:number value="$pos" format="A"/>
										</td>
										<td class="styTableCellCtrInherit" style="font-weight:bold;">(1)</td>
										<td class="styTableCellCtrInherit" style="word-break:break-all;">
											<xsl:choose>
												<xsl:when test="PayorEntityRelationBackYearGrp[1]/OwnerFrgnEntIdentificationGrp">
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="PayorEntityRelationBackYearGrp[1]/OwnerFrgnEntIdentificationGrp/ForeignEntityReferenceIdNum"/>
													</xsl:call-template>
												</xsl:when>
												<xsl:otherwise>
													<xsl:call-template name="PopulateEIN">
														<xsl:with-param name="TargetNode" select="PayorEntityRelationBackYearGrp[1]/OwnerEIN"/>
													</xsl:call-template>
												</xsl:otherwise>
											</xsl:choose>
										</td>
										<td class="styTableCellCtrInherit" style="">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="PayorEntityRelationBackYearGrp[1]/ForeignCountryOrUSPossessionCd"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellCtrInherit" style="">
											<xsl:call-template name="PopulateMonthDayYear">
												<xsl:with-param name="TargetNode" select="PayorEntityRelationBackYearGrp[1]/AdditionalForeignTaxPaidDt"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellCtrInherit" style="">
											<xsl:call-template name="PopulateMonthDayYear">
												<xsl:with-param name="TargetNode" select="PayorEntityRelationBackYearGrp[1]/ForeignTaxYearEndDt"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellAmtInherit" style="">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="PayorEntityRelationBackYearGrp[1]/ForeignTaxableIncomeAmt"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellAmtInherit" style="border-right-width:0px;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="PayorEntityRelationBackYearGrp[1]/AddnlTaxForeignCurrencyAmt"/>
												<xsl:with-param name="MaxSize" select="17"/>
											</xsl:call-template>
										</td>
									</tr>
									<xsl:for-each select="PayorEntityRelationBackYearGrp[position() &gt; 1]">
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
											<td class="styTableCellCtrInherit" style="word-break:break-all;">
												<xsl:choose>
													<xsl:when test="OwnerFrgnEntIdentificationGrp">
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="OwnerFrgnEntIdentificationGrp/ForeignEntityReferenceIdNum"/>
														</xsl:call-template>
													</xsl:when>
													<xsl:otherwise>
														<xsl:call-template name="PopulateEIN">
															<xsl:with-param name="TargetNode" select="OwnerEIN"/>
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
											<td class="styTableCellCtrInherit" style="">
												<xsl:call-template name="PopulateMonthDayYear">
													<xsl:with-param name="TargetNode" select="ForeignTaxYearEndDt"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellAmtInherit" style="">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="ForeignTaxableIncomeAmt"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellAmtInherit" style="border-right-width:0px;">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="AddnlTaxForeignCurrencyAmt"/>
													<xsl:with-param name="MaxSize" select="17"/>
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
									<th class="styDepTblCell" scope="col" style="width:30mm;font-weight:normal;padding:2px 0mm;">
										<strong>8. </strong> Additional Tax Accrued in Functional Currency of Taxpayer’s QBU or Foreign Corporation
									</th>
									<th class="styDepTblCell" scope="col" style="width:40mm;font-weight:normal;padding:2px 0mm;">
										<strong>9. </strong> Conversion Rate <br /> of Local Currency <br /> to U.S. Dollars
									</th>
									<th class="styDepTblCell" scope="col" style="width:27mm;font-weight:normal;padding:2px 0mm;">
										<strong>10. </strong> Additional Tax <br /> Accrued in <br /> U.S. Dollars <br /> (divide column 7 <br /> by column 9)
									</th>
									<th class="styDepTblCell" scope="col" style="width:27mm;font-weight:normal;padding:2px 0mm;">
										<strong>11. </strong> U.S. Dollar <br /> Tax of Payor <br /> Reported on <br /> Original/Amended Return
									</th>
									<th class="styDepTblCell" scope="col" style="width:27mm;font-weight:normal;padding:2px 0mm;">
										<strong>12. </strong> Revised Tax Accrued <br /> (add column 10 <br /> and column 11)
									</th>
									<th class="styDepTblCell" scope="col" style="width:60mm;font-weight:normal;padding:2px 0mm;">
										<strong>13. </strong> Reference ID Number <br /> for Contested Tax, <br /> if Applicable <br /> (see instructions)
									</th>
									<th class="styDepTblCell" scope="col" style="width:26mm;font-weight:normal;padding:2px 0mm;border-right-width:0px;">
										<strong>14. </strong> Check Box if <br /> Section 905(c)(2) <br /> Two Year Rule Applies <br /> (see instructions)
									</th>
								</tr>
							</thead>
							<tbody>
								<xsl:for-each select="$FormData/IncrAmtFrgnTaxesAccruedGrp">
									<xsl:variable name="pos" select="position()"/>
									<tr>
										<xsl:attribute name="class">
											<xsl:choose>
												<xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when>
												<xsl:otherwise>styDepTblRow2</xsl:otherwise>
											</xsl:choose>
										</xsl:attribute>
										<td class="styTableCellCtrInherit" style="font-weight:bold;">
											<xsl:attribute name="rowspan"><xsl:value-of select="count(PayorEntityRelationBackYearGrp)"/></xsl:attribute>
											<xsl:number value="$pos" format="A"/>
										</td>
										<td class="styTableCellCtrInherit" style="font-weight:bold;">(1)</td>
										<td class="styTableCellAmtInherit" style="">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="PayorEntityRelationBackYearGrp[1]/AddnlTaxFunctionalCurrencyAmt"/>
												<xsl:with-param name="MaxSize" select="17"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellAmtInherit" style="word-break:break-all;">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="PayorEntityRelationBackYearGrp[1]/ConversionRt"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellAmtInherit" style="">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="PayorEntityRelationBackYearGrp[1]/AddnlTaxUSDollarsAmt"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellAmtInherit" style="">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="PayorEntityRelationBackYearGrp[1]/TaxOriginalAmdRetAmt"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellAmtInherit" style="">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="PayorEntityRelationBackYearGrp[1]/RevisedTaxAccruedAmt"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellCtrInherit" style="word-break:break-all;">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="PayorEntityRelationBackYearGrp[1]/ContestedTaxForeignEntityIdGrp/ForeignEntityReferenceIdNum"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellCtrInherit" style="">
											<input type="checkbox" class="styCkboxNM" style="">
												<xsl:attribute name="aria-label">Row <xsl:number value="$pos" format="A"/> subrow 1, High Tax Exception Exclusion</xsl:attribute>
												<xsl:call-template name="PopulateCheckbox">
													<xsl:with-param name="TargetNode" select="PayorEntityRelationBackYearGrp[1]/HighTaxExceptionExclusionInd"/>
													<xsl:with-param name="BackupName">F1118sL-p1-<xsl:value-of select="$pos"/>-1-HighTaxExceptionExclusionInd</xsl:with-param>
												</xsl:call-template>
											</input>
										</td>
									</tr>
									<xsl:for-each select="PayorEntityRelationBackYearGrp[position() &gt; 1]">
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
											<td class="styTableCellCtrInherit" style="word-break:break-all;">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="ContestedTaxForeignEntityIdGrp/ForeignEntityReferenceIdNum"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellCtrInherit" style="border-right-width:0px;">
												<input type="checkbox" class="styCkboxNM" style="">
													<xsl:attribute name="aria-label">Row <xsl:number value="$pos" format="A"/> subrow <xsl:value-of select="position()"/>, High Tax Exception Exclusion</xsl:attribute>
													<xsl:call-template name="PopulateCheckbox">
														<xsl:with-param name="TargetNode" select="HighTaxExceptionExclusionInd"/>
														<xsl:with-param name="BackupName">F1118sL-p1-<xsl:value-of select="$pos"/>-<xsl:value-of select="position()"/>-HighTaxExceptionExclusionInd</xsl:with-param>
													</xsl:call-template>
												</input>
											</td>
										</tr>
									</xsl:for-each>
									<tr class="styDepTblRow1" style="vertical-align:bottom;">
										<td colspan="4" class="styTableCellTextInherit" style="font-family:Arial Narrow;">
											<strong>Subtotal by Relation Back Year of Taxpayer</strong>
											(add amounts in columns 10, 11, and 12) 
											<span class="sty1118SLDotLn" style="font-family:Verdana;">.</span>
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
										<td class="styTableCellCtrInherit" style="background-color:lightgrey;">&nbsp;</td>
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
									<th class="styDepTblCell" scope="col" style="width:70mm;font-weight:normal;">
										<strong>2a. </strong> Name of Payor Entity
									</th>
									<th class="styDepTblCell" scope="col" style="width:70mm;font-weight:normal;">
										<strong>2b. </strong> EIN or Reference ID Number <br /> of Payor
									</th>
									<th class="styDepTblCell" scope="col" style="width:70mm;font-weight:normal;border-right-width:0px;">
										<strong>2c. </strong> Name of Owner of Payor Entity, if applicable <br /> (see instructions)
									</th>
								</tr>
							</thead>
							<tbody>
								<xsl:for-each select="$FormData/DecrAmtFrgnTaxesPdAccruedGrp">
									<xsl:variable name="pos" select="position()"/>
									<tr>
										<xsl:attribute name="class">
											<xsl:choose>
												<xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when>
												<xsl:otherwise>styDepTblRow2</xsl:otherwise>
											</xsl:choose>
										</xsl:attribute>
										<td class="styTableCellCtrInherit" style="font-weight:bold;">
											<xsl:attribute name="rowspan"><xsl:value-of select="count(DecrPayorEntRelationBackYrGrp)"/></xsl:attribute>
											<xsl:number value="$pos" format="A"/>
										</td>
										<td class="styTableCellCtrInherit" style="">
											<xsl:attribute name="rowspan"><xsl:value-of select="count(DecrPayorEntRelationBackYrGrp)"/></xsl:attribute>
											<span style="width:22mm;height:3.5mm;border-bottom:1px solid black;">
												<xsl:call-template name="PopulateMonthDayYear">
													<xsl:with-param name="TargetNode" select="USTaxYearEndDt"/>
												</xsl:call-template>
											</span>
										</td>
										<td class="styTableCellCtrInherit" style="font-weight:bold;">(1)</td>
										<td class="styTableCellTextInherit" style="">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="DecrPayorEntRelationBackYrGrp[1]/PayorName/BusinessNameLine1Txt"/>
											</xsl:call-template>
											<xsl:if test="DecrPayorEntRelationBackYrGrp[1]/PayorName/BusinessNameLine2Txt">
												<br />
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="DecrPayorEntRelationBackYrGrp[1]/PayorName/BusinessNameLine2Txt"/>
												</xsl:call-template>
											</xsl:if>
										</td>
										<td class="styTableCellCtrInherit" style="word-break:break-all;">
											<xsl:choose>
												<xsl:when test="DecrPayorEntRelationBackYrGrp[1]/ForeignEntityIdentificationGrp">
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="DecrPayorEntRelationBackYrGrp[1]/ForeignEntityIdentificationGrp/ForeignEntityReferenceIdNum"/>
													</xsl:call-template>
												</xsl:when>
												<xsl:otherwise>
													<xsl:call-template name="PopulateEIN">
														<xsl:with-param name="TargetNode" select="DecrPayorEntRelationBackYrGrp[1]/PayorEIN"/>
													</xsl:call-template>
												</xsl:otherwise>
											</xsl:choose>
										</td>
										<td class="styTableCellTextInherit" style="border-right-width:0px;">
											<xsl:choose>
												<xsl:when test="DecrPayorEntRelationBackYrGrp[1]/BusinessOwnerName">
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="DecrPayorEntRelationBackYrGrp[1]/BusinessOwnerName/BusinessNameLine1Txt"/>
													</xsl:call-template>
													<xsl:if test="DecrPayorEntRelationBackYrGrp[1]/BusinessOwnerName/BusinessNameLine2Txt">
														<br />
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="DecrPayorEntRelationBackYrGrp[1]/BusinessOwnerName/BusinessNameLine2Txt"/>
														</xsl:call-template>
													</xsl:if>
												</xsl:when>
												<xsl:otherwise>
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="DecrPayorEntRelationBackYrGrp[1]/OwnerNm"/>
													</xsl:call-template>
												</xsl:otherwise>
											</xsl:choose>
										</td>
									</tr>
									<xsl:for-each select="DecrPayorEntRelationBackYrGrp[position() &gt; 1]">
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
											<td class="styTableCellTextInherit" style="border-right-width:0px;">
												<xsl:choose>
													<xsl:when test="BusinessOwnerName">
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="BusinessOwnerName/BusinessNameLine1Txt"/>
														</xsl:call-template>
														<xsl:if test="BusinessOwnerName/BusinessNameLine2Txt">
															<br />
															<xsl:call-template name="PopulateText">
																<xsl:with-param name="TargetNode" select="BusinessOwnerName/BusinessNameLine2Txt"/>
															</xsl:call-template>
														</xsl:if>
													</xsl:when>
													<xsl:otherwise>
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="OwnerNm"/>
														</xsl:call-template>
													</xsl:otherwise>
												</xsl:choose>
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
									<th class="styDepTblCell" scope="col" style="width:100mm;font-weight:normal;padding:2mm 0mm;">
										<strong>2d. </strong> EIN or Reference ID Number of Owner
									</th>
									<th class="styDepTblCell" scope="col" style="width:25mm;font-weight:normal;">
										<strong>3. </strong> Country or <br /> U.S. Possession <br /> to Which Tax <br /> Is Paid <br />
										(enter code &mdash; <br /> see instructions)
									</th>
									<th class="styDepTblCell" scope="col" style="width:25mm;font-weight:normal;padding:2mm 0mm;">
										<strong>4. </strong> Date <br /> Additional <br /> Foreign Tax <br /> Was Paid <br /> (MM/DD/YYYY)
									</th>
									<th class="styDepTblCell" scope="col" style="width:25mm;font-weight:normal;padding:2mm 0mm;">
										<strong>5. </strong> Foreign <br /> Tax Year <br /> to Which <br /> Tax Relates <br /> (MM/DD/YYYY)
									</th>
									<th class="styDepTblCell" scope="col" style="width:31mm;font-weight:normal;padding:2mm 0mm;">
										<strong>6. </strong> Payor's Income <br /> Subject to Tax in the <br /> Foreign Jurisdiction <br /> (see instructions)
									</th>
									<th class="styDepTblCell" scope="col" style="width:31mm;font-weight:normal;padding:2mm 0mm;">
										<strong>7. </strong> Additional Tax <br /> Accrued in <br /> Local Currency <br /> in Which the <br /> Tax Is Payable
									</th>
								</tr>
							</thead>
							<tbody>
								<xsl:for-each select="$FormData/DecrAmtFrgnTaxesPdAccruedGrp">
									<xsl:variable name="pos" select="position()"/>
									<tr>
										<xsl:attribute name="class">
											<xsl:choose>
												<xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when>
												<xsl:otherwise>styDepTblRow2</xsl:otherwise>
											</xsl:choose>
										</xsl:attribute>
										<td class="styTableCellCtrInherit" style="font-weight:bold;">
											<xsl:attribute name="rowspan"><xsl:value-of select="count(DecrPayorEntRelationBackYrGrp)"/></xsl:attribute>
											<xsl:number value="$pos" format="A"/>
										</td>
										<td class="styTableCellCtrInherit" style="font-weight:bold;">(1)</td>
										<td class="styTableCellCtrInherit" style="word-break:break-all;">
											<xsl:choose>
												<xsl:when test="DecrPayorEntRelationBackYrGrp[1]/OwnerFrgnEntIdentificationGrp">
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="DecrPayorEntRelationBackYrGrp[1]/OwnerFrgnEntIdentificationGrp/ForeignEntityReferenceIdNum"/>
													</xsl:call-template>
												</xsl:when>
												<xsl:otherwise>
													<xsl:call-template name="PopulateEIN">
														<xsl:with-param name="TargetNode" select="DecrPayorEntRelationBackYrGrp[1]/OwnerEIN"/>
													</xsl:call-template>
												</xsl:otherwise>
											</xsl:choose>
										</td>
										<td class="styTableCellCtrInherit" style="">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="DecrPayorEntRelationBackYrGrp[1]/ForeignCountryOrUSPossessionCd"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellCtrInherit" style="">
											<xsl:call-template name="PopulateMonthDayYear">
												<xsl:with-param name="TargetNode" select="DecrPayorEntRelationBackYrGrp[1]/ForeignTaxRefundedDt"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellCtrInherit" style="">
											<xsl:call-template name="PopulateMonthDayYear">
												<xsl:with-param name="TargetNode" select="DecrPayorEntRelationBackYrGrp[1]/ForeignTaxYearEndDt"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellAmtInherit" style="">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="DecrPayorEntRelationBackYrGrp[1]/ForeignTaxableIncomeAmt"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellAmtInherit" style="border-right-width:0px;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="DecrPayorEntRelationBackYrGrp[1]/TxRefundedInForeignCurrencyAmt"/>
												<xsl:with-param name="MaxSize" select="17"/>
											</xsl:call-template>
										</td>
									</tr>
									<xsl:for-each select="DecrPayorEntRelationBackYrGrp[position() &gt; 1]">
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
											<td class="styTableCellCtrInherit" style="word-break:break-all;">
												<xsl:choose>
													<xsl:when test="OwnerFrgnEntIdentificationGrp">
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="OwnerFrgnEntIdentificationGrp/ForeignEntityReferenceIdNum"/>
														</xsl:call-template>
													</xsl:when>
													<xsl:otherwise>
														<xsl:call-template name="PopulateEIN">
															<xsl:with-param name="TargetNode" select="OwnerEIN"/>
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
											<td class="styTableCellCtrInherit" style="">
												<xsl:call-template name="PopulateMonthDayYear">
													<xsl:with-param name="TargetNode" select="ForeignTaxYearEndDt"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellAmtInherit" style="">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="ForeignTaxableIncomeAmt"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellAmtInherit" style="border-right-width:0px;">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="TxRefundedInForeignCurrencyAmt"/>
													<xsl:with-param name="MaxSize" select="17"/>
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
									<th class="styDepTblCell" scope="col" style="width:35mm;font-weight:normal;padding:2mm 0mm;">
										<strong>8. </strong> Refunded Amount <br /> in Functional Currency <br /> of Taxpayer's QBU <br /> or Foreign Corporation
									</th>
									<th class="styDepTblCell" scope="col" style="width:42mm;font-weight:normal;padding:2mm 0mm;">
										<strong>9. </strong> Conversion Rate <br /> of Local Currency <br /> to U.S. Dollars
									</th>
									<th class="styDepTblCell" scope="col" style="width:32mm;font-weight:normal;padding:2mm 0mm;">
										<strong>10. </strong> Refunded Amount <br /> in U.S. Dollars <br /> (divide column 7 <br /> by column 9)
									</th>
									<th class="styDepTblCell" scope="col" style="width:32mm;font-weight:normal;padding:2mm 0mm;">
										<strong>11. </strong> U.S. Dollar Tax <br /> of Payor Entity per <br /> Original/Amended Return
									</th>
									<th class="styDepTblCell" scope="col" style="width:32mm;font-weight:normal;padding:2mm 0mm;">
										<strong>12. </strong> Revised Tax <br /> Paid or Accrued <br /> (subtract column 10 <br /> from column 11)
									</th>
									<th class="styDepTblCell" scope="col" style="width:32mm;font-weight:normal;padding:2mm 0mm;">
										<strong>13. </strong> Check Box if <br /> Section 905(c)(2) <br /> Two Year Rule Applies <br /> (see instructions)
									</th>
									<th class="styDepTblCell" scope="col" style="width:32mm;font-weight:normal;padding:2mm 0mm;border-right-width:0px;">
										<strong>14. </strong> Check Box if <br /> Change Caused <br /> to High Tax Exception/Exclusion <br /> (see instructions)
									</th>
								</tr>
							</thead>
							<tbody>
								<xsl:for-each select="$FormData/DecrAmtFrgnTaxesPdAccruedGrp">
									<xsl:variable name="pos" select="position()"/>
									<tr>
										<xsl:attribute name="class">
											<xsl:choose>
												<xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when>
												<xsl:otherwise>styDepTblRow2</xsl:otherwise>
											</xsl:choose>
										</xsl:attribute>
										<td class="styTableCellCtrInherit" style="font-weight:bold;">
											<xsl:attribute name="rowspan"><xsl:value-of select="count(DecrPayorEntRelationBackYrGrp)"/></xsl:attribute>
											<xsl:number value="$pos" format="A"/>
										</td>
										<td class="styTableCellCtrInherit" style="font-weight:bold;">(1)</td>
										<td class="styTableCellAmtInherit" style="">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="DecrPayorEntRelationBackYrGrp[1]/TxRefdInFunctionalCurrencyAmt"/>
												<xsl:with-param name="MaxSize" select="17"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellAmtInherit" style="word-break:break-all;">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="DecrPayorEntRelationBackYrGrp[1]/ConversionRt"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellAmtInherit" style="">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="DecrPayorEntRelationBackYrGrp[1]/RefundInUSDollarsAmt"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellAmtInherit" style="">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="DecrPayorEntRelationBackYrGrp[1]/TaxOriginalAmdRetAmt"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellAmtInherit" style="">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="DecrPayorEntRelationBackYrGrp[1]/RevisedTaxPaidAccruedAmt"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellCtrInherit" style="">
											<input type="checkbox" class="styCkboxNM" style="">
												<xsl:attribute name="aria-label">Row <xsl:number value="$pos" format="A"/> subrow 1, Section 905 c 2 Two Year Rule</xsl:attribute>
												<xsl:call-template name="PopulateCheckbox">
													<xsl:with-param name="TargetNode" select="DecrPayorEntRelationBackYrGrp[1]/Section905c2TwoYrRuleInd"/>
													<xsl:with-param name="BackupName">F1118sL-p2-<xsl:value-of select="$pos"/>-1-Section905c2TwoYrRuleInd</xsl:with-param>
												</xsl:call-template>
											</input>
										</td>
										<td class="styTableCellCtrInherit" style="border-right-width:0px;">
											<input type="checkbox" class="styCkboxNM" style="">
												<xsl:attribute name="aria-label">Row <xsl:number value="$pos" format="A"/> subrow 1, High Tax Exception Exclusion</xsl:attribute>
												<xsl:call-template name="PopulateCheckbox">
													<xsl:with-param name="TargetNode" select="DecrPayorEntRelationBackYrGrp[1]/HighTaxExceptionExclusionInd"/>
													<xsl:with-param name="BackupName">F1118sL-p2-<xsl:value-of select="$pos"/>-1-HighTaxExceptionExclusionInd</xsl:with-param>
												</xsl:call-template>
											</input>
										</td>
									</tr>
									<xsl:for-each select="DecrPayorEntRelationBackYrGrp[position() &gt; 1]">
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
											<td class="styTableCellCtrInherit" style="">
												<input type="checkbox" class="styCkboxNM" style="">
													<xsl:attribute name="aria-label">Row <xsl:number value="$pos" format="A"/> subrow <xsl:value-of select="position() + 1"/>, Section 905 c 2 Two Year Rule</xsl:attribute>
													<xsl:call-template name="PopulateCheckbox">
														<xsl:with-param name="TargetNode" select="Section905c2TwoYrRuleInd"/>
														<xsl:with-param name="BackupName">F1118sL-p2-<xsl:value-of select="$pos"/>-<xsl:value-of select="position() + 1"/>-Section905c2TwoYrRuleInd</xsl:with-param>
													</xsl:call-template>
												</input>
											</td>
											<td class="styTableCellCtrInherit" style="border-right-width:0px;">
												<input type="checkbox" class="styCkboxNM" style="">
													<xsl:attribute name="aria-label">Row <xsl:number value="$pos" format="A"/> subrow <xsl:value-of select="position() + 1"/>, High Tax Exception Exclusion</xsl:attribute>
													<xsl:call-template name="PopulateCheckbox">
														<xsl:with-param name="TargetNode" select="HighTaxExceptionExclusionInd"/>
														<xsl:with-param name="BackupName">F1118sL-p2-<xsl:value-of select="$pos"/>-<xsl:value-of select="position() + 1"/>-HighTaxExceptionExclusionInd</xsl:with-param>
													</xsl:call-template>
												</input>
											</td>
										</tr>
									</xsl:for-each>
									<tr class="styDepTblRow1" style="vertical-align:bottom;">
										<td colspan="4" class="styTableCellTextInherit" style="">
											<strong>Subtotal by Relation Back Year of Taxpayer</strong><br />
											(add amounts in columns 10, 11, and 12) 
											<span class="sty1118SLDotLn">........</span>
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
										<td class="styTableCellCtrInherit" style="background-color:lightgrey;">&nbsp;</td>
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
						<span class="styRepeatingDataTitle" style="width:255mm;">Part III - Change in Inclusions; Change in Foreign Taxes Paid, Accrued, or Deemed Paid; and Change in Foreign Tax Credits Claimed  </span>
						<table class="styDepTblLandscape" style="font-size:7pt">
							<thead class="styTableHead">
								<tr class="styDepTblHdr">
									<th class="styDepTblCell" scope="col" style="width:84mm;font-weight:normal;padding:0.5mm;">
										<strong>1. </strong> Relation Back Year <br /> (MM/DD/YYYY)
									</th>
									<th class="styDepTblCell" scope="col" style="width:42mm;font-weight:normal;padding:0.5mm;">
										<strong>2. </strong> Redetermined <br /> Direct Section 901 <br /> and/or 903 Taxes <br /> Paid or Accrued
									</th>
									<th class="styDepTblCell" scope="col" style="width:42mm;font-weight:normal;padding:0.5mm;">
										<strong>3. </strong> Direct Section 901 <br /> and/or 903 Taxes <br /> Paid or Accrued <br /> per Original/Amended Return
									</th>
									<th class="styDepTblCell" scope="col" style="width:42mm;font-weight:normal;padding:0.5mm;">
										<strong>4. </strong> Redetermined <br /> Section 951(a)(1) Inclusion
									</th>
									<th class="styDepTblCell" scope="col" style="width:42mm;font-weight:normal;padding:0.5mm;">
										<strong>5. </strong> Section 951(a)(1) Inclusion <br /> per Original/Amended Return
									</th>
								</tr>
							</thead>
							<tbody>
								<xsl:for-each select="$FormData/ChgInclsnTxsPdAccrDmdCrClmGrp">
									<tr>
										<xsl:attribute name="class">
											<xsl:choose>
												<xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when>
												<xsl:otherwise>styDepTblRow2</xsl:otherwise>
											</xsl:choose>
										</xsl:attribute>
										<td class="styTableCellCtrInherit" style="">
											<xsl:call-template name="PopulateMonthDayYear">
												<xsl:with-param name="TargetNode" select="USTaxYearEndDt"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellAmtInherit" style="">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="RedetermSect901Or903TaxesAmt"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellAmtInherit" style="">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="DirectSect901Or903PerReturnAmt"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellAmtInherit" style="">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="RedetermSect951a1InclsnAmt"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellAmtInherit" style="border-right-width:0px;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="Sect951a1InclsnPerReturnAmt"/>
											</xsl:call-template>
										</td>
									</tr>
								</xsl:for-each>
							</tbody>
						</table>
						<table class="styDepTblLandscape" style="font-size:7pt">
							<thead class="styTableHead">
								<tr class="styDepTblHdr">
									<th class="styDepTblCell" scope="col" style="width:42mm;font-weight:normal;padding:2mm 0.5mm;">
										<strong>6. </strong> Redetermined Taxes <br /> Deemed Paid <br /> Under Section 960(a)
									</th>
									<th class="styDepTblCell" scope="col" style="width:42mm;font-weight:normal;padding:2mm 0.5mm;">
										<strong>7. </strong> Section 960(a) <br /> Deemed Paid Taxes <br /> per Original/Amended Return
									</th>
									<th class="styDepTblCell" scope="col" style="width:42mm;font-weight:normal;padding:2mm 0.5mm;">
										<strong>8. </strong> Redetermined <br /> Section 951A Inclusion
									</th>
									<th class="styDepTblCell" scope="col" style="width:42mm;font-weight:normal;padding:2mm 0.5mm;">
										<strong>9. </strong> Section 951A Inclusion <br /> per Original/Amended Return
									</th>
									<th class="styDepTblCell" scope="col" style="width:42mm;font-weight:normal;padding:2mm 0.5mm;">
										<strong>10. </strong> Redetermined Taxes <br /> Deemed Paid <br /> Under Section 960(d)
									</th>
									<th class="styDepTblCell" scope="col" style="width:42mm;font-weight:normal;padding:2mm 0.5mm;">
										<strong>11. </strong> Section 960(d) <br /> Deemed Paid Taxes <br /> per Original/Amended Return
									</th>
								</tr>
							</thead>
							<tbody>
								<xsl:for-each select="$FormData/ChgInclsnTxsPdAccrDmdCrClmGrp">
									<tr>
										<xsl:attribute name="class">
											<xsl:choose>
												<xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when>
												<xsl:otherwise>styDepTblRow2</xsl:otherwise>
											</xsl:choose>
										</xsl:attribute>
										<td class="styTableCellAmtInherit" style="">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="RedetermDmdPdSect960aTxsAmt"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellAmtInherit" style="">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="Sect960aDmdPdTxsPerReturnAmt"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellAmtInherit" style="">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="RedetermSect951AInclsnAmt"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellAmtInherit" style="">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="Sect951AInclsnPerReturnAmt"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellAmtInherit" style="">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="RedetermDmdPdSect960dTxsAmt"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellAmtInherit" style="">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="Sect960dDmdPdTxsPerReturnAmt"/>
											</xsl:call-template>
										</td>
									</tr>
								</xsl:for-each>
							</tbody>
						</table>
						<table class="styDepTblLandscape" style="font-size:7pt">
							<thead class="styTableHead">
								<tr class="styDepTblHdr">
									<th class="styDepTblCell" scope="col" style="width:42mm;font-weight:normal;padding:2mm 0.5mm;">
										<strong>12. </strong> Redetermined Taxes <br /> Deemed Paid <br /> Under Section 960(b)(1)
									</th>
									<th class="styDepTblCell" scope="col" style="width:42mm;font-weight:normal;padding:2mm 0.5mm;">
										<strong>13. </strong> Section 960(b)(1) <br /> Deemed Paid Taxes <br /> per Original/Amended Return
									</th>
									<th class="styDepTblCell" scope="col" style="width:42mm;font-weight:normal;padding:2mm 0.5mm;">
										<strong>14. </strong> Redetermined Taxes <br /> Deemed Paid <br /> Under Section 902
									</th>
									<th class="styDepTblCell" scope="col" style="width:42mm;font-weight:normal;padding:2mm 0.5mm;">
										<strong>15. </strong> Section 902 <br /> Deemed Paid Taxes <br /> per Original/Amended Return
									</th>
									<th class="styDepTblCell" scope="col" style="width:42mm;font-weight:normal;padding:2mm 0.5mm;">
										<strong>16. </strong> Amount of FTC Claimed <br /> per Original/Amended Return
									</th>
									<th class="styDepTblCell" scope="col" style="width:42mm;font-weight:normal;padding:2mm 0.5mm;">
										<strong>17. </strong> Amount of FTC Claimed <br /> After Redetermination
									</th>
								</tr>
							</thead>
							<tbody>
								<xsl:for-each select="$FormData/ChgInclsnTxsPdAccrDmdCrClmGrp">
									<tr>
										<xsl:attribute name="class">
											<xsl:choose>
												<xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when>
												<xsl:otherwise>styDepTblRow2</xsl:otherwise>
											</xsl:choose>
										</xsl:attribute>
										<td class="styTableCellAmtInherit" style="">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="RedetermDmdPdSect960b1TxsAmt"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellAmtInherit" style="">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="Sect960b1DmdPdTxsPerReturnAmt"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellAmtInherit" style="">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="RedetermDmdPdSect902TxsAmt"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellAmtInherit" style="">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="Sect902DmdPdTxsPerReturnAmt"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellAmtInherit" style="">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="FTCClmPerReturnAmt"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellAmtInherit" style="">
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
										<strong>2. </strong> Name of Payor Entity <br /> (see instructions)
									</th>
									<th class="styDepTblCell" scope="col" style="width:84mm;font-weight:normal;padding:2mm 0mm;">
										<strong>3. </strong> Reference ID Number for the Contested Tax
									</th>
									<th class="styDepTblCell" scope="col" style="width:25mm;font-weight:normal;padding:2mm 0mm;">
										<strong>4. </strong> Country or U.S. Possession to Which Tax Was Paid (enter code)
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
											(<xsl:number value="position()" format="i"/>)
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
									<th class="styDepTblCell" scope="col" style="width:62mm;font-weight:normal;padding:2mm 0mm;">
										<strong>5. </strong> Amount of Contested Tax <br /> Provisionally Claimed as Credit
									</th>
									<th class="styDepTblCell" scope="col" style="width:36mm;font-weight:normal;padding:2mm 0mm;">
										<strong>6. </strong> Contest <br /> Ongoing
									</th>
									<th class="styDepTblCell" scope="col" style="width:36mm;font-weight:normal;padding:2mm 0mm;">
										<strong>7. </strong> Contest <br /> Resolved
									</th>
									<th class="styDepTblCell" scope="col" style="width:36mm;font-weight:normal;padding:2mm 0mm;">
										<strong>8. </strong> Date Contest <br /> Resolved <br /> (MM/DD/YYYY)
									</th>
									<th class="styDepTblCell" scope="col" style="width:36mm;font-weight:normal;padding:2mm 0mm;">
										<strong>9. </strong> Tax Refunded, if any <br/>(see instructions)
									</th>
									
									<th class="styDepTblCell" scope="col" style="width:38mm;font-weight:normal;padding:2mm 0mm;">
										<strong>10. </strong> Additional Tax Paid,<br/>if any<br/>(see instructions)
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
												<xsl:attribute name="aria-label">Row <xsl:value-of select="position()"/> Contest Ongoing</xsl:attribute>
												<xsl:call-template name="PopulateCheckbox">
													<xsl:with-param name="TargetNode" select="ContestOngoingInd"/>
													<xsl:with-param name="BackupName">F1118sL/ContestOngoingInd<xsl:value-of select="position()"/></xsl:with-param>
												</xsl:call-template>
											</input>
										</td>
										<td class="styTableCellCtrInherit" style="">
											<input type="checkbox" class="styCkboxNM" style="">
												<xsl:attribute name="aria-label">Row <xsl:value-of select="position()"/> Contest Resolved</xsl:attribute>
												<xsl:call-template name="PopulateCheckbox">
													<xsl:with-param name="TargetNode" select="ContestResolvedInd"/>
													<xsl:with-param name="BackupName">F1118sL/ContestResolvedInd<xsl:value-of select="position()"/></xsl:with-param>
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
												<xsl:with-param name="TargetNode" select="RefundAmt"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellAmtInherit" style="">
											<xsl:call-template name="PopulateAmount">
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
