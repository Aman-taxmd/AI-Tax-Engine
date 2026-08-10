<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE xsl:stylesheet [
	<!ENTITY nbsp "&#160;"> 
	<!ENTITY mdash "&#8212;"> 
]>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fo="http://www.w3.org/1999/XSL/Format" version="1.0">
	<xsl:include href="PopulateTemplate.xsl"/>
	<xsl:include href="AddHeader.xsl"/>
	<xsl:include href="CommonPathRef.xsl"/>
	<xsl:include href="AddOnTable.xsl"/>
	<xsl:include href="IRS1045Style.xsl"/>
	<xsl:include href="ScheduleK2K3Common.xsl"/>
	<xsl:output method="html" indent="yes"/>
	<xsl:strip-space elements="*"/>
	<xsl:param name="FormData" select="$RtnDoc/IRS1045"/>
	<xsl:template match="/">
		<xsl:text disable-output-escaping="yes">&lt;!DOCTYPE html&gt;</xsl:text>
		<html>
			<head>
				<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
				<title>
					<xsl:call-template name="FormTitle">
						<xsl:with-param name="RootElement" select="local-name($FormData)"/>
					</xsl:call-template>
				</title>
				<!-- No Browser Caching   -->
				<meta http-equiv="Pragma" content="no-cache"/>
				<meta http-equiv="Cache-Control" content="no-cache"/>
				<meta http-equiv="Expires" content="0"/>
				<!-- No Proxy Caching -->
				<meta http-equiv="Cache-Control" content="private"/>
				<!-- Define Character Set -->
				<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1"/>
				<meta name="Description" content="IRS Form 1045"/>
				<!-- javascript include -->
				<script language="JavaScript" src="{$ScriptPath}/FormDisplay.js" type="text/javascript"/>
				<xsl:call-template name="InitJS"/>
				<style type="text/css">
					<xsl:if test="not($Print) or $Print=''">
						<xsl:call-template name="IRS1045Style"/>
						<xsl:call-template name="AddOnStyle"/>
					</xsl:if>
				</style>
				<xsl:call-template name="GlobalStylesForm"/>
			</head>
			<body class="styBodyClass" style="width:187mm;">
				<form id="Form1045">
					<xsl:call-template name="DocumentHeader"/>
					<!-- BEGIN FORM HEADER -->
					<div class="styStdDiv">
						<div class="styFNBox" style="width:30mm;height:18mm;">
						Form <span class="styFormNumber">1045</span><br/>
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$FormData"/>
							</xsl:call-template>
							<br/>
							<span class="styAgency">Department of the Treasury</span>
							<span class="styAgency">Internal Revenue Service</span>
						</div>
						<div class="styFTBox" style="width:124mm;height:18mm;padding-top:2mm;">
							<span class="styMainTitle">Application for Tentative Refund</span>
							<div class="styFST" style="padding-top:1mm;">
							For individuals, estates, and trusts.<br/>
							File application on or after the date you file your annual income tax return. <br/>
							Go to <span style="font-style:italic;">www.irs.gov/Form1045</span> for instructions and the latest information.
						</div>
						</div>
						<div class="styTYBox" style="width:32mm;height:18mm;padding-top:0mm;">
							<div class="styOMB" style="height:auto;">OMB No. 1545-0098</div>
							<div class="styTY" style="">20<span class="styTYColor">25</span>
							</div>
						</div>
						<!-- Filer's info -->
						<div class="styStdDiv" style="border-top:2px solid black;">
							<div class="styNameBox" style="width:138mm;font-size:7pt;border-bottom:1px solid black;height:10mm;padding-left:.5mm;">
						Name(s) shown on return
						<xsl:call-template name="LinkToLeftoverDataTableInline">
									<xsl:with-param name="Desc">Header - In Care Of Name </xsl:with-param>
									<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/InCareOfNm"/>
								</xsl:call-template>
								<xsl:call-template name="LinkToLeftoverDataTableInline">
									<xsl:with-param name="Desc">Header - Business Name Control </xsl:with-param>
									<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/BusinessNameControlTxt"/>
								</xsl:call-template>
								<xsl:call-template name="LinkToLeftoverDataTableInline">
									<xsl:with-param name="Desc">Header - Primary Name Control </xsl:with-param>
									<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/PrimaryNameControlTxt"/>
								</xsl:call-template>
								<xsl:call-template name="LinkToLeftoverDataTableInline">
									<xsl:with-param name="Desc">Header - Spouse Name Control </xsl:with-param>
									<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/SpouseNameControlTxt"/>
								</xsl:call-template>
								<br/>
								<xsl:if test="$RtnHdrData/Filer/NameLine1Txt">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/NameLine1Txt"/>
									</xsl:call-template>
								</xsl:if>
								<xsl:if test="$RtnHdrData/ReturnTypeCd = '1045EST'">
									<xsl:choose>
										<xsl:when test="$RtnHdrData/Filer/EstateOrTrustName">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/EstateOrTrustName/BusinessNameLine1Txt"/>
											</xsl:call-template>
											<br/>
											<xsl:if test="$RtnHdrData/Filer/EstateOrTrustName/BusinessNameLine2Txt">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/EstateOrTrustName/BusinessNameLine2Txt"/>
												</xsl:call-template>
											</xsl:if>
										</xsl:when>
										<xsl:otherwise>
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/NationalMortgageAssocCd"/>
											</xsl:call-template>
										</xsl:otherwise>
									</xsl:choose>
									<xsl:choose>
										<xsl:when test="$RtnHdrData/Filer/FiduciaryPersonName">
											<xsl:call-template name="LinkToLeftoverDataTableInline">
												<xsl:with-param name="Desc">Header - Fiduciary Person First Name </xsl:with-param>
												<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/FiduciaryPersonName/PersonFirstNm"/>
											</xsl:call-template>
											<xsl:call-template name="LinkToLeftoverDataTableInline">
												<xsl:with-param name="Desc">Header - Fiduciary Person Last Name </xsl:with-param>
												<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/FiduciaryPersonName/PersonLastNm"/>
											</xsl:call-template>
											<xsl:call-template name="LinkToLeftoverDataTableInline">
												<xsl:with-param name="Desc">Header - Fiduciary Person SSN </xsl:with-param>
												<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/FiduciaryPersonSSN"/>
											</xsl:call-template>
										</xsl:when>
										<xsl:otherwise>
											<xsl:call-template name="LinkToLeftoverDataTableInline">
												<xsl:with-param name="Desc">Header - Fiduciary Business Name </xsl:with-param>
												<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/FiduciaryBusinessNm"/>
											</xsl:call-template>
											<xsl:call-template name="LinkToLeftoverDataTableInline">
												<xsl:with-param name="Desc">Header - Fiduciary Business EIN </xsl:with-param>
												<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/FiduciaryBusinessEIN"/>
											</xsl:call-template>
										</xsl:otherwise>
									</xsl:choose>
									<xsl:call-template name="LinkToLeftoverDataTableInline">
										<xsl:with-param name="Desc">Header - Fiduciary Title </xsl:with-param>
										<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/FiduciaryTitleTxt"/>
									</xsl:call-template>
								</xsl:if>
								<xsl:if test="$RtnHdrData/Filer/PoolNumberTxt">
									<xsl:call-template name="LinkToLeftoverDataTableInline">
										<xsl:with-param name="Desc">Header - Pool Number </xsl:with-param>
										<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/PoolNumberTxt"/>
									</xsl:call-template>
								</xsl:if>
							</div>
							<div class="styEINBox" style="width:49mm;height:10mm;padding-left:1mm;text-align:left;font-size:7pt;border-bottom:1px solid black;">
								<span style="font-weight:bold;font-family:Arial Narrow;">Social security or employer identification number</span>
								<br/>
								<span style="font-weight:normal;">
									<xsl:call-template name="PopulateReturnHeaderFiler">
										<xsl:with-param name="TargetNode">PrimarySSN</xsl:with-param>
									</xsl:call-template>
									<xsl:if test="$RtnHdrData/ReturnTypeCd = '1045EST'">
										<xsl:call-template name="PopulateReturnHeaderFiler">
											<xsl:with-param name="TargetNode">EIN</xsl:with-param>
										</xsl:call-template>
									</xsl:if>
								</span>
							</div>
							<div class="styNameBox" style="width:138mm;height:10mm;font-size:7pt;border-bottom:1px solid black;padding-left:.5mm;">
							Address (number and street). If a P.O. box, see instructions.<br/>
								<xsl:if test="$RtnHdrData/Filer/USAddress">
									<xsl:call-template name="PopulateReturnHeaderFiler">
										<xsl:with-param name="TargetNode">AddressLine1Txt</xsl:with-param>
										<xsl:with-param name="BackupName">$RtnHdrDataFilerUSAddressLine1</xsl:with-param>
									</xsl:call-template>
									<br/>
									<xsl:call-template name="PopulateReturnHeaderFiler">
										<xsl:with-param name="TargetNode">AddressLine2Txt</xsl:with-param>
										<xsl:with-param name="BackupName">$RtnHdrDataFilerUSAddressLine2</xsl:with-param>
									</xsl:call-template>
								</xsl:if>
								<xsl:if test="$RtnHdrData/Filer/ForeignAddress">
									<xsl:call-template name="PopulateReturnHeaderFiler">
										<xsl:with-param name="TargetNode">AddressLine1Txt</xsl:with-param>
										<xsl:with-param name="BackupName">$RtnHdrDataFilerForeignAddressLine1</xsl:with-param>
									</xsl:call-template>
									<br/>
									<xsl:call-template name="PopulateReturnHeaderFiler">
										<xsl:with-param name="TargetNode">AddressLine2Txt</xsl:with-param>
										<xsl:with-param name="BackupName">$RtnHdrDataFilerForeignAddressLine2</xsl:with-param>
									</xsl:call-template>
								</xsl:if>
							</div>
							<div class="styEINBox" style="width:49mm;height:10mm;padding-left:1mm;text-align:left;font-size:7pt;border-bottom:1px solid black;">
								<span style="font-weight:bold;font-family:Arial;">Spouse's social security number (SSN)</span>
								<br/>
								<span style="font-weight:normal;">
									<xsl:call-template name="PopulateReturnHeaderFiler">
										<xsl:with-param name="TargetNode">SpouseSSN</xsl:with-param>
										<xsl:with-param name="EINChanged" select="true()"/>
									</xsl:call-template>
								</span>
							</div>
							<div class="styNameBox" style="width:88mm;height:7mm;font-size:7pt;border-bottom:1px solid black;padding-left:.5mm;">
								City, town, or post office
								<br/>
								<xsl:call-template name="PopulateReturnHeaderFiler">
									<xsl:with-param name="TargetNode">CityNm</xsl:with-param>
								</xsl:call-template>
							</div>
							<div class="styNameBox" style="width:25mm;height:7mm;font-size:7pt;border-bottom:1px solid black;padding-left:.5mm;">
								State
								<br/>
								<xsl:call-template name="PopulateReturnHeaderFiler">
									<xsl:with-param name="TargetNode">StateAbbreviationCd</xsl:with-param>
								</xsl:call-template>
							</div>
							<div class="styNameBox" style="width:25mm;height:7mm;font-size:7pt;border-bottom:1px solid black;padding-left:.5mm;">
								ZIP code
								<br/>
								<xsl:call-template name="PopulateReturnHeaderFiler">
									<xsl:with-param name="TargetNode">ZIPCd</xsl:with-param>
								</xsl:call-template>
							</div>
							<div class="styEINBox" style="height:7mm;border-bottom:1px solid black;width:49mm;padding-left:1mm;text-align:left;font-size:7pt;font-weight:normal;word-break:break-all;">
							Daytime phone number
							<br/>
								<xsl:choose>
									<xsl:when test="$RtnHdrData/Filer/ForeignPhoneNum">
										<xsl:call-template name="PopulateReturnHeaderFiler">
											<xsl:with-param name="TargetNode">ForeignPhoneNum</xsl:with-param>
										</xsl:call-template>
									</xsl:when>
									<xsl:otherwise>
										<xsl:call-template name="PopulateReturnHeaderFiler">
											<xsl:with-param name="TargetNode">PhoneNum</xsl:with-param>
										</xsl:call-template>
									</xsl:otherwise>
								</xsl:choose>
							</div>
							<div class="styNameBox" style="width:187mm;height:4mm;font-size:7pt;padding-left:.5mm;border-bottom:1px solid black;border-right:0;">
								Complete spaces below for foreign address. (See instructions.)
							</div>
							<div class="styNameBox" style="width:88mm;height:7mm;font-size:7pt;padding-left:.5mm;">
						Foreign country name <br/>
								<xsl:call-template name="PopulateReturnHeaderFiler">
									<xsl:with-param name="TargetNode">CountryCd</xsl:with-param>
									<xsl:with-param name="MainForm" select="true()"/>
								</xsl:call-template>
							</div>
							<div class="styNameBox" style="width:50mm;height:7mm;font-size:7pt;padding-left:0.5mm;">
						Foreign province/state/county<br/>
								<xsl:call-template name="PopulateReturnHeaderFiler">
									<xsl:with-param name="TargetNode">ProvinceOrStateNm</xsl:with-param>
								</xsl:call-template>
							</div>
							<div class="styEINBox" style="width:49mm;height:7mm;padding-left:1mm;text-align:left;font-size:7pt;font-weight:normal;word-break:break-all;">
						Foreign postal code
						<br/>
								<xsl:call-template name="PopulateReturnHeaderFiler">
									<xsl:with-param name="TargetNode">ForeignPostalCd</xsl:with-param>
								</xsl:call-template>
							</div>
						</div>
						<!-- Line 1 -->
						<div class="styStdDiv" style="border-top:1px solid black;">
							<div class="styLNLeftNumBoxSD">1</div>
							<div class="styLNDesc" style="width:25mm;height:7mm;border-right:1px solid black;">This application is<br/>filed to carry back:</div>
							<div class="styLNLeftNumBoxSD">a</div>
							<div class="styLNDesc" style="width:50mm;height:7mm;border-right:1px solid black;">
							Net operating loss (NOL) (Form 172)<br/>$
								<span style="float:right;margin-right:2mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/NetOperatingLossAmt"/>
									</xsl:call-template>
								</span>
							</div>
							<div class="styLNLeftNumBoxSD">b</div>
							<div class="styLNDesc" style="width:40mm;height:7mm;border-right:1px solid black;">
							Unused general business credit<br/>$
								<span style="float:right;margin-right:2mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/UnusedGeneralBusinessCrAmt"/>
									</xsl:call-template>
								</span>
							</div>
							<div class="styLNLeftNumBoxSD">c</div>
							<div class="styLNDesc" style="width:40mm;height:7mm;">
							Net section 1256 contracts loss<br/>$
								<span style="float:right;margin-right:2mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/Section1256CarriedBackAmt"/>
									</xsl:call-template>
								</span>
							</div>
						</div>
						<!-- Line 2ab -->
						<div class="styStdDiv" style="border-top:1px solid black;">
							<div class="styLNLeftNumBoxSD">2a</div>
							<div class="styLNDesc" style="width:120mm;height:7mm;border-right:1px solid black;">
							For the calendar year 2024, or other tax year<br/>beginning
							<span style="width:30mm;text-align:center;">
									<xsl:call-template name="PopulateMonthDayYear">
										<xsl:with-param name="TargetNode" select="$RtnHdrData/TaxPeriodBeginDt"/>
									</xsl:call-template>
								</span>
							, and ending
							<span style="width:30mm;text-align:center;">
									<xsl:call-template name="PopulateMonthDayYear">
										<xsl:with-param name="TargetNode" select="$RtnHdrData/TaxPeriodEndDt"/>
									</xsl:call-template>
								</span>
							</div>
							<div class="styLNLeftNumBoxSD">b</div>
							<div class="styLNDesc" style="width:51mm;height:7mm;">
							Date tax return was filed<br/>
								<span style="width:51mm;text-align:center;">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$FormData/ReturnFiledDt"/>
									</xsl:call-template>
								</span>
							</div>
						</div>
						<!-- Line 2c -->
						<div class="styStdDiv" style="border-top:1px solid black;">
							<div class="styLNLeftNumBoxSD">2c</div>
							<div class="styLNDesc" style="width:175mm;height:auto;">
								If you are resubmitting Form 1045 in response to IRS correspondence, attach a copy of the correspondence and check the box
								<span class="sty1045DotLn">....</span>
							</div>
							<input type="checkbox" class="styCkboxNM" style="margin-top:0.5mm;" aria-label="Resubmit Form Ind">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$FormData/ResubmitFormInd"/>
									<xsl:with-param name="BackupName">ResubmitFormInd</xsl:with-param>
								</xsl:call-template>
							</input>
						</div>
						<!-- Line 3 -->
						<div class="styStdDiv" style="border-top:1px solid black;height:5mm;">
							<div class="styLNLeftNumBoxSD">3</div>
							<div class="styLNDesc" style="width:179mm;">
							If this application is for an unused credit created by another carryback, enter year of first carryback:
							<span class="sty1045DashedLine" style="text-align:center;">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$FormData/FirstCarrybackYr"/>
									</xsl:call-template>
								</span>
							</div>
						</div>
						<!-- Line 4 -->
						<div class="styStdDiv" style="height:8mm;">
							<div class="styLNLeftNumBoxSD">4</div>
							<div class="styLNDesc" style="width:179mm;">
							If you filed a joint return (or separate return) for some, but not all, of the tax years involved in figuring the carryback, list the years
and specify whether joint (J) or separate (S) return for each (see instructions):
							<span class="sty1045DashedLine" style="width:84mm;float:none;">
									<xsl:call-template name="SetFormLinkInline">
										<xsl:with-param name="TargetNode" select="$FormData"/>
									</xsl:call-template>
									<span style="margin-right:1mm;"/>
									<xsl:choose>
										<xsl:when test="count($FormData/CarrybackTaxYrFilingStatusGrp) &gt; 5">
											<xsl:call-template name="LinkToLeftoverDataTableInline">
												<xsl:with-param name="TargetNode" select="."/>
												<xsl:with-param name="Desc">Line 4 - Tax year and Return</xsl:with-param>
											</xsl:call-template>
										</xsl:when>
										<xsl:otherwise>
											<xsl:for-each select="$FormData/CarrybackTaxYrFilingStatusGrp">
												<xsl:call-template name="PopulateYear">
													<xsl:with-param name="TargetNode" select="TaxYr"/>
												</xsl:call-template> &#8212; 
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="IndividualReturnFilingStatusCd"/>
												</xsl:call-template>
												<xsl:if test="position() != last()">,<span style="width:3px;"/>
												</xsl:if>
											</xsl:for-each>
										</xsl:otherwise>
									</xsl:choose>
								</span>
							</div>
						</div>
						<!-- Line 5 -->
						<div class="styStdDiv" style="min-height:6mm;">
							<div class="styLNLeftNumBoxSD">5</div>
							<div class="styLNDesc" style="width:70mm;">
							If SSN for carryback year is different from above, enter
						</div>
							<div class="styLNLeftNumBoxSD">a</div>
							<div class="styLNDesc" style="width:39mm;">
							SSN:
							<span class="sty1045DashedLine" style="width:30mm;float:none;text-align:center;">
									<xsl:choose>
										<xsl:when test="count($FormData/OtherCarrybackSSNTaxYearGrp) &gt; 1">
											<xsl:call-template name="LinkToLeftoverDataTableInline">
												<xsl:with-param name="TargetNode" select="."/>
												<xsl:with-param name="Desc">Line 5 - SSN</xsl:with-param>
											</xsl:call-template>
										</xsl:when>
										<xsl:otherwise>
											<xsl:call-template name="PopulateSSN">
												<xsl:with-param name="TargetNode" select="$FormData/OtherCarrybackSSNTaxYearGrp/SSN"/>
											</xsl:call-template>
										</xsl:otherwise>
									</xsl:choose>
								</span>
							</div>
							<span style="width:7mm;float:left;margin-left:3mm;padding-top:.5mm;">and</span>
							<div class="styLNLeftNumBoxSD">b</div>
							<div class="styLNDesc" style="width:44mm;">
							Year(s):
							<span class="sty1045DashedLine" style="width:32mm;float:none;text-align:center;">
									<xsl:choose>
										<xsl:when test="count($FormData/OtherCarrybackSSNTaxYearGrp) &gt; 1">
											<xsl:call-template name="LinkToLeftoverDataTableInline">
												<xsl:with-param name="TargetNode" select="."/>
												<xsl:with-param name="Desc">Line 5 - Year</xsl:with-param>
											</xsl:call-template>
										</xsl:when>
										<xsl:otherwise>
											<xsl:call-template name="PopulateYear">
												<xsl:with-param name="TargetNode" select="$FormData/OtherCarrybackSSNTaxYearGrp/TaxYr"/>
											</xsl:call-template>
										</xsl:otherwise>
									</xsl:choose>
								</span>
							</div>
						</div>
						<!-- Line 6 -->
						<div class="styStdDiv">
							<div class="styLNLeftNumBoxSD">6</div>
							<div class="styLNDesc" style="height:auto;width:179mm;">
							If you changed your accounting period, give date permission to change was granted: 
							<span class="sty1045DashedLine" style="width:72mm;text-align:center;">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$FormData/AccountingPeriodChangeGrntDt"/>
									</xsl:call-template>
								</span>
							</div>
						</div>
						<!-- Line 7 -->
						<div class="styStdDiv">
							<div class="styLNLeftNumBoxSD">7</div>
							<div class="styLNDesc" style="height:auto;width:154mm;padding-right:3.5mm;">
							Have you filed a petition in Tax Court for the year(s) to which the carryback is to be applied? 
							<span class="sty1045DotLn">........</span>
							</div>
							<div class="styGenericDiv" style="width:24mm;font-weight:bold;">
								<xsl:call-template name="PopulateSpan">
									<xsl:with-param name="TargetNode" select="$FormData/CourtPetitionFiledInd"/>
								</xsl:call-template>
								<input type="checkbox" class="styCkboxNM" style="margin-right:4px;" aria-label="F1045 Court Petition Filed Yes">
									<xsl:call-template name="PopulateYesCheckbox">
										<xsl:with-param name="TargetNode" select="$FormData/CourtPetitionFiledInd"/>
										<xsl:with-param name="BackupName">F1045CourtPetitionFiledInd</xsl:with-param>
									</xsl:call-template>
								</input>
								<strong>Yes</strong>
								<input type="checkbox" class="styCkboxNM" style="margin-left:5mm;margin-right:4px;" aria-label="F1045 Court Petition Filed No">
									<xsl:call-template name="PopulateNoCheckbox">
										<xsl:with-param name="TargetNode" select="$FormData/CourtPetitionFiledInd"/>
										<xsl:with-param name="BackupName">F1045Ind</xsl:with-param>
									</xsl:call-template>
								</input>
								<strong>No</strong>
							</div>
						</div>
						<!-- Line 8 -->
						<div class="styStdDiv">
							<div class="styLNLeftNumBoxSD">8</div>
							<div class="styLNDesc" style="height:auto;width:154mm;padding-right:3.5mm;">
							Is any part of the decrease in tax due to a loss or credit resulting from a reportable transaction required to be disclosed on Form 8886, Reportable Transaction Disclosure Statement? 
							<span class="sty1045DotLn">..................</span>
							</div>
							<div class="styGenericDiv" style="width:24mm;font-weight:bold;padding-top:3mm;">
								<xsl:call-template name="PopulateSpan">
									<xsl:with-param name="TargetNode" select="$FormData/TaxDecrDueForm8886DisclInd"/>
								</xsl:call-template>
								<input type="checkbox" class="styCkboxNM" style="margin-right:4px;" aria-label="F1045 Tax Decr Due 8886 Yes">
									<xsl:call-template name="PopulateYesCheckbox">
										<xsl:with-param name="TargetNode" select="$FormData/TaxDecrDueForm8886DisclInd"/>
										<xsl:with-param name="BackupName">F1045TaxDecrDueForm8886DisclInd</xsl:with-param>
									</xsl:call-template>
								</input>
								<strong>Yes</strong>
								<input type="checkbox" class="styCkboxNM" style="margin-left:5mm;margin-right:4px;" aria-label="F1045 Tax Decr Due 8886 No">
									<xsl:call-template name="PopulateNoCheckbox">
										<xsl:with-param name="TargetNode" select="$FormData/TaxDecrDueForm8886DisclInd"/>
										<xsl:with-param name="BackupName">F1045TaxDecrDueForm8886DisclInd</xsl:with-param>
									</xsl:call-template>
								</input>
								<strong>No</strong>
							</div>
						</div>
						<!-- Line 9 -->
						<div class="styStdDiv">
							<div class="styLNLeftNumBoxSD">9</div>
							<div class="styLNDesc" style="height:auto;width:154mm;padding-right:3.5mm;">
							If you are carrying back an NOL or a net section 1256 contracts loss, did this cause the release of foreign tax credits or the release of other credits due to the release of the foreign tax credit (see instructions)?
							<span class="sty1045DotLn">.........</span>
							</div>
							<div class="styGenericDiv" style="width:24mm;font-weight:bold;padding-top:3mm;">
								<xsl:call-template name="PopulateSpan">
									<xsl:with-param name="TargetNode" select="$FormData/ForeignTaxCrReleaseInd"/>
								</xsl:call-template>
								<input type="checkbox" class="styCkboxNM" style="margin-right:4px;" aria-label="F1045 Foreign Tax Cr Release Yes">
									<xsl:call-template name="PopulateYesCheckbox">
										<xsl:with-param name="TargetNode" select="$FormData/ForeignTaxCrReleaseInd"/>
										<xsl:with-param name="BackupName">F1045ForeignTaxCrReleaseInd</xsl:with-param>
									</xsl:call-template>
								</input>
								<strong>Yes</strong>
								<input type="checkbox" class="styCkboxNM" style="margin-left:5mm;margin-right:4px;" aria-label="F1045 Foreign Tax Cr Release No">
									<xsl:call-template name="PopulateNoCheckbox">
										<xsl:with-param name="TargetNode" select="$FormData/ForeignTaxCrReleaseInd"/>
										<xsl:with-param name="BackupName">F1045ForeignTaxCrReleaseInd</xsl:with-param>
									</xsl:call-template>
								</input>
								<strong>No</strong>
							</div>
						</div>
						<!-- head line -->
						<!-- 1st table -->
						<xsl:if test="count($FormData/CarrybackDecreaseTaxCmptGrp) &gt;= 1">
							<div class="styStdDiv" style="border-top:2px solid black;">
								<div class="sty1045Desc" style="width:73mm;height:21mm;padding-top:1.5mm;border-bottom:1px solid black;text-align:center;">
										<span style="font-size:12.5px;">
										<strong>Computation of Decrease in Tax</strong>
									</span>
										<br/>
						(see instructions)
						<span style="padding-top:9mm;">
											<strong>Note:</strong> If <strong>1a</strong> and <strong>1c</strong> are blank, skip lines 10 through 15.
						</span>
									</div>
								<div class="sty1045ColHeader">
										<span class="sty1045OrdinalNum">
										<xsl:call-template name="PopulateMonthDayYear">
											<xsl:with-param name="TargetNode" select="$FormData/CarrybackDecreaseTaxCmptGrp[1]/PrecedingYearNum"/>
										</xsl:call-template>
									</span>
						preceding tax year ended: 
						<span class="sty1045PrecYrEnd">
										<xsl:call-template name="PopulateMonthDayYear">
											<xsl:with-param name="TargetNode" select="$FormData/CarrybackDecreaseTaxCmptGrp[1]/TaxPeriodEndDt"/>
										</xsl:call-template>
									</span>
									</div>
								<div class="sty1045ColHeader">
										<span class="sty1045OrdinalNum">
										<xsl:call-template name="PopulateMonthDayYear">
											<xsl:with-param name="TargetNode" select="$FormData/CarrybackDecreaseTaxCmptGrp[2]/PrecedingYearNum"/>
										</xsl:call-template>
									</span>
						preceding tax year ended: 
						<span class="sty1045PrecYrEnd">
										<xsl:call-template name="PopulateMonthDayYear">
											<xsl:with-param name="TargetNode" select="$FormData/CarrybackDecreaseTaxCmptGrp[2]/TaxPeriodEndDt"/>
										</xsl:call-template>
									</span>
									</div>
								<div class="sty1045ColHeaderBelow">
						Before<br/>carryback
					</div>
								<div class="sty1045ColHeaderBelow">
						After<br/>carryback
					</div>
								<div class="sty1045ColHeaderBelow">
						Before<br/>carryback
					</div>
								<div class="sty1045ColHeaderBelow">
						After<br/>carryback
					</div>
							</div>
							<!-- Line 10 -->
							<div class="styStdDiv">
								<div class="styLNLeftNumBox">10</div>
								<div class="sty1045Desc">
						NOL deduction after carryback (see instructions)
						<span class="sty1045DotLn"/>
									</div>
								<div class="sty1045AmtBox" style="background-color:lightgrey;">&nbsp;</div>
								<div class="sty1045AmtBox" style="">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/CarrybackDecreaseTaxCmptGrp[1]/AfterCarrybackGrp/NOLDeductionCarrybackAmt"/>
									</xsl:call-template>
								</div>
								<div class="sty1045AmtBox" style="background-color:lightgrey;">&nbsp;</div>
								<div class="sty1045AmtBox" style="">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/CarrybackDecreaseTaxCmptGrp[2]/AfterCarrybackGrp/NOLDeductionCarrybackAmt"/>
									</xsl:call-template>
								</div>
							</div>
							<!-- Line 11 -->
							<div class="styStdDiv">
								<div class="styLNLeftNumBox">11</div>
								<div class="sty1045Desc">
						Adjusted gross income
						<span class="sty1045DotLn">.........</span>
									</div>
								<div class="sty1045AmtBox">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/CarrybackDecreaseTaxCmptGrp[1]/BeforeCarrybackGrp/CommonCarrybackGrp/AdjustedGrossIncomeAmt"/>
									</xsl:call-template>
								</div>
								<div class="sty1045AmtBox">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/CarrybackDecreaseTaxCmptGrp[1]/AfterCarrybackGrp/CommonCarrybackGrp/AdjustedGrossIncomeAmt"/>
									</xsl:call-template>
								</div>
								<div class="sty1045AmtBox">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/CarrybackDecreaseTaxCmptGrp[2]/BeforeCarrybackGrp/CommonCarrybackGrp/AdjustedGrossIncomeAmt"/>
									</xsl:call-template>
								</div>
								<div class="sty1045AmtBox">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/CarrybackDecreaseTaxCmptGrp[2]/AfterCarrybackGrp/CommonCarrybackGrp/AdjustedGrossIncomeAmt"/>
									</xsl:call-template>
								</div>
							</div>
							<!-- Line 12 -->
							<div class="styStdDiv">
								<div class="styLNLeftNumBox">12</div>
								<div class="sty1045Desc">
							Deductions (see instructions)
							<span class="sty1045DotLn">.......</span>
									</div>
								<div class="sty1045AmtBox" style="border-bottom-width:2px">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/CarrybackDecreaseTaxCmptGrp[1]/BeforeCarrybackGrp/CommonCarrybackGrp/TotalDeductionsAmt"/>
									</xsl:call-template>
								</div>
								<div class="sty1045AmtBox" style="border-bottom-width:2px">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/CarrybackDecreaseTaxCmptGrp[1]/AfterCarrybackGrp/CommonCarrybackGrp/TotalDeductionsAmt"/>
									</xsl:call-template>
								</div>
								<div class="sty1045AmtBox" style="border-bottom-width:2px">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/CarrybackDecreaseTaxCmptGrp[2]/BeforeCarrybackGrp/CommonCarrybackGrp/TotalDeductionsAmt"/>
									</xsl:call-template>
								</div>
								<div class="sty1045AmtBox" style="border-bottom-width:2px">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/CarrybackDecreaseTaxCmptGrp[2]/AfterCarrybackGrp/CommonCarrybackGrp/TotalDeductionsAmt"/>
									</xsl:call-template>
								</div>
							</div>
							<!-- Line 13 -->
							<div class="styStdDiv">
								<div class="styLNLeftNumBox">13</div>
								<div class="sty1045Desc">
						Subtract line 12 from line 11
						<span class="sty1045DotLn">.......</span>
									</div>
								<div class="sty1045AmtBox">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/CarrybackDecreaseTaxCmptGrp[1]/BeforeCarrybackGrp/CommonCarrybackGrp/AGILessDeductionsAmt"/>
									</xsl:call-template>
								</div>
								<div class="sty1045AmtBox">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/CarrybackDecreaseTaxCmptGrp[1]/AfterCarrybackGrp/CommonCarrybackGrp/AGILessDeductionsAmt"/>
									</xsl:call-template>
								</div>
								<div class="sty1045AmtBox">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/CarrybackDecreaseTaxCmptGrp[2]/BeforeCarrybackGrp/CommonCarrybackGrp/AGILessDeductionsAmt"/>
									</xsl:call-template>
								</div>
								<div class="sty1045AmtBox">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/CarrybackDecreaseTaxCmptGrp[2]/AfterCarrybackGrp/CommonCarrybackGrp/AGILessDeductionsAmt"/>
									</xsl:call-template>
								</div>
							</div>
							<!-- Line 14 -->
							<div class="styStdDiv">
								<div class="styLNLeftNumBox">14</div>
								<div class="sty1045Desc">
						Exemptions (see instructions)
						<span class="sty1045DotLn">......</span>
									</div>
								<div class="sty1045AmtBox" style="border-bottom-width:2px">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/CarrybackDecreaseTaxCmptGrp[1]/BeforeCarrybackGrp/CommonCarrybackGrp/ExemptionsAmt"/>
									</xsl:call-template>
								</div>
								<div class="sty1045AmtBox" style="border-bottom-width:2px">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/CarrybackDecreaseTaxCmptGrp[1]/AfterCarrybackGrp/CommonCarrybackGrp/ExemptionsAmt"/>
									</xsl:call-template>
								</div>
								<div class="sty1045AmtBox" style="border-bottom-width:2px">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/CarrybackDecreaseTaxCmptGrp[2]/BeforeCarrybackGrp/CommonCarrybackGrp/ExemptionsAmt"/>
									</xsl:call-template>
								</div>
								<div class="sty1045AmtBox" style="border-bottom-width:2px">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/CarrybackDecreaseTaxCmptGrp[2]/AfterCarrybackGrp/CommonCarrybackGrp/ExemptionsAmt"/>
									</xsl:call-template>
								</div>
							</div>
							<!-- Line 15 -->
							<div class="styStdDiv">
								<div class="styLNLeftNumBox">15</div>
								<div class="sty1045Desc">
						Taxable income. Line 13 minus line 14
						<span class="sty1045DotLn">....</span>
									</div>
								<div class="sty1045AmtBox">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/CarrybackDecreaseTaxCmptGrp[1]/BeforeCarrybackGrp/CommonCarrybackGrp/TaxableIncomeAmt"/>
									</xsl:call-template>
								</div>
								<div class="sty1045AmtBox">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/CarrybackDecreaseTaxCmptGrp[1]/AfterCarrybackGrp/CommonCarrybackGrp/TaxableIncomeAmt"/>
									</xsl:call-template>
								</div>
								<div class="sty1045AmtBox">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/CarrybackDecreaseTaxCmptGrp[2]/BeforeCarrybackGrp/CommonCarrybackGrp/TaxableIncomeAmt"/>
									</xsl:call-template>
								</div>
								<div class="sty1045AmtBox">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/CarrybackDecreaseTaxCmptGrp[2]/AfterCarrybackGrp/CommonCarrybackGrp/TaxableIncomeAmt"/>
									</xsl:call-template>
								</div>
							</div>
							<!-- Line 16 -->
							<div class="styStdDiv">
								<div class="styLNLeftNumBox">16</div>
								<div class="sty1045Desc">
						Income tax. See instructions and attach an explanation
						<span class="sty1045DotLn">............</span>
									</div>
								<div class="sty1045AmtBox" style="height:7mm;padding-top:3mm;">
									<xsl:call-template name="SetFormLinkInline">
										<xsl:with-param name="TargetNode" select="$FormData"/>
									</xsl:call-template>
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/CarrybackDecreaseTaxCmptGrp[1]/BeforeCarrybackGrp/CommonCarrybackGrp/TaxAmt"/>
									</xsl:call-template>
								</div>
								<div class="sty1045AmtBox" style="height:7mm;padding-top:3mm;">
									<xsl:call-template name="SetFormLinkInline">
										<xsl:with-param name="TargetNode" select="$FormData"/>
									</xsl:call-template>
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/CarrybackDecreaseTaxCmptGrp[1]/AfterCarrybackGrp/CommonCarrybackGrp/TaxAmt"/>
									</xsl:call-template>
								</div>
								<div class="sty1045AmtBox" style="height:7mm;padding-top:3mm;">
									<xsl:call-template name="SetFormLinkInline">
										<xsl:with-param name="TargetNode" select="$FormData"/>
									</xsl:call-template>
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/CarrybackDecreaseTaxCmptGrp[2]/BeforeCarrybackGrp/CommonCarrybackGrp/TaxAmt"/>
									</xsl:call-template>
								</div>
								<div class="sty1045AmtBox" style="height:7mm;padding-top:3mm;">
									<xsl:call-template name="SetFormLinkInline">
										<xsl:with-param name="TargetNode" select="$FormData"/>
									</xsl:call-template>
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/CarrybackDecreaseTaxCmptGrp[2]/AfterCarrybackGrp/CommonCarrybackGrp/TaxAmt"/>
									</xsl:call-template>
								</div>
							</div>
							<!-- Line 17 -->
							<div class="styStdDiv">
								<div class="styLNLeftNumBox">17</div>
								<div class="sty1045Desc">
						Excess advance payment(s) for premium tax credit (see instructions)
						<span class="sty1045DotLn">..........</span>
									</div>
								<div class="sty1045AmtBox" style="height:7mm;padding-top:3mm;">
									<xsl:call-template name="SetFormLinkInline">
										<xsl:with-param name="TargetNode" select="$FormData"/>
									</xsl:call-template>
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/CarrybackDecreaseTaxCmptGrp[1]/BeforeCarrybackGrp/CommonCarrybackGrp/PremiumTaxCreditTaxLiabAmt"/>
									</xsl:call-template>
								</div>
								<div class="sty1045AmtBox" style="height:7mm;padding-top:3mm;">
									<xsl:call-template name="SetFormLinkInline">
										<xsl:with-param name="TargetNode" select="$FormData"/>
									</xsl:call-template>
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/CarrybackDecreaseTaxCmptGrp[1]/AfterCarrybackGrp/CommonCarrybackGrp/PremiumTaxCreditTaxLiabAmt"/>
									</xsl:call-template>
								</div>
								<div class="sty1045AmtBox" style="height:7mm;padding-top:3mm;">
									<xsl:call-template name="SetFormLinkInline">
										<xsl:with-param name="TargetNode" select="$FormData"/>
									</xsl:call-template>
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/CarrybackDecreaseTaxCmptGrp[2]/BeforeCarrybackGrp/CommonCarrybackGrp/PremiumTaxCreditTaxLiabAmt"/>
									</xsl:call-template>
								</div>
								<div class="sty1045AmtBox" style="height:7mm;padding-top:3mm;">
									<xsl:call-template name="SetFormLinkInline">
										<xsl:with-param name="TargetNode" select="$FormData"/>
									</xsl:call-template>
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/CarrybackDecreaseTaxCmptGrp[2]/AfterCarrybackGrp/CommonCarrybackGrp/PremiumTaxCreditTaxLiabAmt"/>
									</xsl:call-template>
								</div>
							</div>
							<!-- Line 18 -->
							<div class="styStdDiv">
								<div class="styLNLeftNumBox">18</div>
								<div class="sty1045Desc">
						Alternative minimum tax
						<span class="sty1045DotLn">.......</span>
									</div>
								<div class="sty1045AmtBox" style="border-bottom-width:2px">
									<xsl:call-template name="SetFormLinkInline">
										<xsl:with-param name="TargetNode" select="$FormData"/>
									</xsl:call-template>
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/CarrybackDecreaseTaxCmptGrp[1]/BeforeCarrybackGrp/CommonCarrybackGrp/AlternativeMinimumTaxAmt"/>
									</xsl:call-template>
								</div>
								<div class="sty1045AmtBox" style="border-bottom-width:2px">
									<xsl:call-template name="SetFormLinkInline">
										<xsl:with-param name="TargetNode" select="$FormData"/>
									</xsl:call-template>
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/CarrybackDecreaseTaxCmptGrp[1]/AfterCarrybackGrp/CommonCarrybackGrp/AlternativeMinimumTaxAmt"/>
									</xsl:call-template>
								</div>
								<div class="sty1045AmtBox" style="border-bottom-width:2px">
									<xsl:call-template name="SetFormLinkInline">
										<xsl:with-param name="TargetNode" select="$FormData"/>
									</xsl:call-template>
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/CarrybackDecreaseTaxCmptGrp[2]/BeforeCarrybackGrp/CommonCarrybackGrp/AlternativeMinimumTaxAmt"/>
									</xsl:call-template>
								</div>
								<div class="sty1045AmtBox" style="border-bottom-width:2px">
									<xsl:call-template name="SetFormLinkInline">
										<xsl:with-param name="TargetNode" select="$FormData"/>
									</xsl:call-template>
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/CarrybackDecreaseTaxCmptGrp[2]/AfterCarrybackGrp/CommonCarrybackGrp/AlternativeMinimumTaxAmt"/>
									</xsl:call-template>
								</div>
							</div>
							<!-- Line 19 -->
							<div class="styStdDiv">
								<div class="styLNLeftNumBox">19</div>
								<div class="sty1045Desc">
						Add lines 16 through 18
						<span class="sty1045DotLn">........</span>
									</div>
								<div class="sty1045AmtBox">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/CarrybackDecreaseTaxCmptGrp[1]/BeforeCarrybackGrp/CommonCarrybackGrp/SumTaxesAmt"/>
									</xsl:call-template>
								</div>
								<div class="sty1045AmtBox">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/CarrybackDecreaseTaxCmptGrp[1]/AfterCarrybackGrp/CommonCarrybackGrp/SumTaxesAmt"/>
									</xsl:call-template>
								</div>
								<div class="sty1045AmtBox">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/CarrybackDecreaseTaxCmptGrp[2]/BeforeCarrybackGrp/CommonCarrybackGrp/SumTaxesAmt"/>
									</xsl:call-template>
								</div>
								<div class="sty1045AmtBox">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/CarrybackDecreaseTaxCmptGrp[2]/AfterCarrybackGrp/CommonCarrybackGrp/SumTaxesAmt"/>
									</xsl:call-template>
								</div>
							</div>
						</xsl:if>
						<xsl:if test="count($FormData/CarrybackDecreaseTaxCmptGrp) &lt; 1">
							<div class="styStdDiv" style="border-top:2px solid black;">
								<div class="sty1045Desc" style="width:73mm;height:21mm;padding-top:1.5mm;border-bottom:1px solid black;text-align:center;">
									<span style="font-size:12.5px;">
										<strong>Computation of Decrease in Tax</strong>
									</span>
									<br/>
						(see instructions)
						<span style="padding-top:9mm;">
										<strong>Note:</strong> If <strong>1a</strong> and <strong>1c</strong> are blank, skip lines 10 through 15.
						</span>
								</div>
								<div class="sty1045ColHeaderEmpty">
									<span class="sty1045OrdinalNum">&nbsp;</span>
						preceding tax year ended: 
						<span class="sty1045PrecYrEnd">&nbsp;</span>
								</div>
								<div class="sty1045ColHeaderEmpty">
									<span class="sty1045OrdinalNum">&nbsp;</span>
						preceding tax year ended: 
						<span class="sty1045PrecYrEnd">&nbsp;</span>
								</div>
								<div class="sty1045ColHeaderEmpty">
									<span class="sty1045OrdinalNum">&nbsp;</span>
							preceding tax year ended: 
							<span class="sty1045PrecYrEnd">&nbsp;</span>
								</div>
								<div class="sty1045ColHeaderBelowEmpty">
						Before<br/>carryback
					</div>
								<div class="sty1045ColHeaderBelowEmpty">
						After<br/>carryback
					</div>
								<div class="sty1045ColHeaderBelowEmpty">
						Before<br/>carryback
					</div>
								<div class="sty1045ColHeaderBelowEmpty">
						After<br/>carryback
					</div>
								<div class="sty1045ColHeaderBelowEmpty">
						Before<br/>carryback
					</div>
								<div class="sty1045ColHeaderBelowEmpty">
						After<br/>carryback
					</div>
							</div>
							<!-- Line 10 -->
							<div class="styStdDiv">
								<div class="styLNLeftNumBox">10</div>
								<div class="sty1045Desc">
						NOL deduction after carryback (see instructions)
						<span class="sty1045DotLn"/>
								</div>
								<div class="sty1045AmtBoxEmpty" style="background-color:lightgrey;">&nbsp;</div>
								<div class="sty1045AmtBoxEmpty">&nbsp;</div>
								<div class="sty1045AmtBoxEmpty" style="background-color:lightgrey;">&nbsp;</div>
								<div class="sty1045AmtBoxEmpty">&nbsp;</div>
								<div class="sty1045AmtBoxEmpty" style="background-color:lightgrey;">&nbsp;</div>
								<div class="sty1045AmtBoxEmpty">&nbsp;</div>
							</div>
							<!-- Line 11 -->
							<div class="styStdDiv">
								<div class="styLNLeftNumBox">11</div>
								<div class="sty1045Desc">
						Adjusted gross income
						<span class="sty1045DotLn">.........</span>
								</div>
								<div class="sty1045AmtBoxEmpty">&nbsp;</div>
								<div class="sty1045AmtBoxEmpty">&nbsp;</div>
								<div class="sty1045AmtBoxEmpty">&nbsp;</div>
								<div class="sty1045AmtBoxEmpty">&nbsp;</div>
								<div class="sty1045AmtBoxEmpty">&nbsp;</div>
								<div class="sty1045AmtBoxEmpty">&nbsp;</div>
							</div>
							<!-- Line 12 -->
							<div class="styStdDiv">
								<div class="styLNLeftNumBox">12</div>
								<div class="sty1045Desc">
							Deductions (see instructions)
							<span class="sty1045DotLn">.......</span>
								</div>
								<div class="sty1045AmtBoxEmpty" style="border-bottom-width:2px">&nbsp;</div>
								<div class="sty1045AmtBoxEmpty" style="border-bottom-width:2px">&nbsp;</div>
								<div class="sty1045AmtBoxEmpty" style="border-bottom-width:2px">&nbsp;</div>
								<div class="sty1045AmtBoxEmpty" style="border-bottom-width:2px">&nbsp;</div>
								<div class="sty1045AmtBoxEmpty" style="border-bottom-width:2px">&nbsp;</div>
								<div class="sty1045AmtBoxEmpty" style="border-bottom-width:2px">&nbsp;</div>
							</div>
							<!-- Line 13 -->
							<div class="styStdDiv">
								<div class="styLNLeftNumBox">13</div>
								<div class="sty1045Desc">
						Subtract line 12 from line 11
						<span class="sty1045DotLn">.......</span>
								</div>
								<div class="sty1045AmtBoxEmpty">&nbsp;</div>
								<div class="sty1045AmtBoxEmpty">&nbsp;</div>
								<div class="sty1045AmtBoxEmpty">&nbsp;</div>
								<div class="sty1045AmtBoxEmpty">&nbsp;</div>
								<div class="sty1045AmtBoxEmpty">&nbsp;</div>
								<div class="sty1045AmtBoxEmpty">&nbsp;</div>
							</div>
							<!-- Line 14 -->
							<div class="styStdDiv">
								<div class="styLNLeftNumBox">14</div>
								<div class="sty1045Desc">
						Exemptions (see instructions)
						<span class="sty1045DotLn">......</span>
								</div>
								<div class="sty1045AmtBoxEmpty" style="border-bottom-width:2px">&nbsp;</div>
								<div class="sty1045AmtBoxEmpty" style="border-bottom-width:2px">&nbsp;</div>
								<div class="sty1045AmtBoxEmpty" style="border-bottom-width:2px">&nbsp;</div>
								<div class="sty1045AmtBoxEmpty" style="border-bottom-width:2px">&nbsp;</div>
								<div class="sty1045AmtBoxEmpty" style="border-bottom-width:2px">&nbsp;</div>
								<div class="sty1045AmtBoxEmpty" style="border-bottom-width:2px">&nbsp;</div>
							</div>
							<!-- Line 15 -->
							<div class="styStdDiv">
								<div class="styLNLeftNumBox">15</div>
								<div class="sty1045Desc">
						Taxable income. Line 13 minus line 14
						<span class="sty1045DotLn">....</span>
								</div>
								<div class="sty1045AmtBoxEmpty">&nbsp;</div>
								<div class="sty1045AmtBoxEmpty">&nbsp;</div>
								<div class="sty1045AmtBoxEmpty">&nbsp;</div>
								<div class="sty1045AmtBoxEmpty">&nbsp;</div>
								<div class="sty1045AmtBoxEmpty">&nbsp;</div>
								<div class="sty1045AmtBoxEmpty">&nbsp;</div>
							</div>
							<!-- Line 16 -->
							<div class="styStdDiv">
								<div class="styLNLeftNumBox">16</div>
								<div class="sty1045Desc">
						Income tax. See instructions and attach an explanation
						<span class="sty1045DotLn">............</span>
								</div>
								<div class="sty1045AmtBoxEmpty" style="height:7mm;">&nbsp;</div>
								<div class="sty1045AmtBoxEmpty" style="height:7mm;">&nbsp;</div>
								<div class="sty1045AmtBoxEmpty" style="height:7mm;">&nbsp;</div>
								<div class="sty1045AmtBoxEmpty" style="height:7mm;">&nbsp;</div>
								<div class="sty1045AmtBoxEmpty" style="height:7mm;">&nbsp;</div>
								<div class="sty1045AmtBoxEmpty" style="height:7mm;">&nbsp;</div>
							</div>
							<!-- Line 17 -->
							<div class="styStdDiv">
								<div class="styLNLeftNumBox">17</div>
								<div class="sty1045Desc">
						Excess advance payment(s) for premium tax credit and/or child tax credit (see instructions)
						<span class="sty1045DotLn">...</span>
								</div>
								<div class="sty1045AmtBoxEmpty" style="height:7mm;">&nbsp;</div>
								<div class="sty1045AmtBoxEmpty" style="height:7mm;">&nbsp;</div>
								<div class="sty1045AmtBoxEmpty" style="height:7mm;">&nbsp;</div>
								<div class="sty1045AmtBoxEmpty" style="height:7mm;">&nbsp;</div>
								<div class="sty1045AmtBoxEmpty" style="height:7mm;">&nbsp;</div>
								<div class="sty1045AmtBoxEmpty" style="height:7mm;">&nbsp;</div>
							</div>
							<!-- Line 18 -->
							<div class="styStdDiv">
								<div class="styLNLeftNumBox">18</div>
								<div class="sty1045Desc">
						Alternative minimum tax
						<span class="sty1045DotLn">........</span>
								</div>
								<div class="sty1045AmtBoxEmpty" style="border-bottom-width:2px">&nbsp;</div>
								<div class="sty1045AmtBoxEmpty" style="border-bottom-width:2px">&nbsp;</div>
								<div class="sty1045AmtBoxEmpty" style="border-bottom-width:2px">&nbsp;</div>
								<div class="sty1045AmtBoxEmpty" style="border-bottom-width:2px">&nbsp;</div>
								<div class="sty1045AmtBoxEmpty" style="border-bottom-width:2px">&nbsp;</div>
								<div class="sty1045AmtBoxEmpty" style="border-bottom-width:2px">&nbsp;</div>
							</div>
							<!-- Line 19 -->
							<div class="styStdDiv">
								<div class="styLNLeftNumBox">19</div>
								<div class="sty1045Desc">
						Add lines 16 through 18
						<span class="sty1045DotLn">........</span>
								</div>
								<div class="sty1045AmtBoxEmpty">&nbsp;</div>
								<div class="sty1045AmtBoxEmpty">&nbsp;</div>
								<div class="sty1045AmtBoxEmpty">&nbsp;</div>
								<div class="sty1045AmtBoxEmpty">&nbsp;</div>
								<div class="sty1045AmtBoxEmpty">&nbsp;</div>
								<div class="sty1045AmtBoxEmpty">&nbsp;</div>
							</div>
						</xsl:if>
						<div class="styStdDiv pageEnd" style="border-top:1px solid black;">
							<span style="font-weight:bold;font-family:Arial;">For Disclosure, Privacy Act, and Paperwork Reduction Act Notice, see separate instructions.</span>
							<span style="margin-left:14mm;">Cat. No. 10670A</span>
							<span style="float:right;">Form <strong>1045</strong> (2025)</span>
						</div>
						<!-- Page 2 -->
						<div class="styStdDiv">
						Form 1045 (2025)
						<span style="float:right;">Page <span style="font-weight:bold;font-size:8pt;">2</span>
							</span>
						</div>
						<!-- Next page -->
						<!-- head line -->
						<!-- 2nd table -->
						<xsl:if test="count($FormData/CarrybackDecreaseTaxCmptGrp) &gt;= 1">
							<div class="styStdDiv" style="border-top:2px solid black;">
								<div class="sty1045Desc" style="width:73mm;height:21mm;padding-top:1.5mm;border-bottom:1px solid black;text-align:center;">
										<span style="font-size:12.5px;">
										<strong>Computation of Decrease in Tax</strong>
									</span>
										<br/>
						<i>(continued)</i>
						<span style="padding-bottom:12mm;">
										<br/>
									</span>
									</div>
								<div class="sty1045ColHeader">
										<span class="sty1045OrdinalNum">
										<xsl:call-template name="PopulateMonthDayYear">
											<xsl:with-param name="TargetNode" select="$FormData/CarrybackDecreaseTaxCmptGrp[1]/PrecedingYearNum"/>
										</xsl:call-template>
									</span>
						preceding tax year ended: 
						<span class="sty1045PrecYrEnd">
										<xsl:call-template name="PopulateMonthDayYear">
											<xsl:with-param name="TargetNode" select="$FormData/CarrybackDecreaseTaxCmptGrp[1]/TaxPeriodEndDt"/>
										</xsl:call-template>
									</span>
									</div>
								<div class="sty1045ColHeader">
										<span class="sty1045OrdinalNum">
										<xsl:call-template name="PopulateMonthDayYear">
											<xsl:with-param name="TargetNode" select="$FormData/CarrybackDecreaseTaxCmptGrp[2]/PrecedingYearNum"/>
										</xsl:call-template>
									</span>
						preceding tax year ended: 
						<span class="sty1045PrecYrEnd">
										<xsl:call-template name="PopulateMonthDayYear">
											<xsl:with-param name="TargetNode" select="$FormData/CarrybackDecreaseTaxCmptGrp[2]/TaxPeriodEndDt"/>
										</xsl:call-template>
									</span>
									</div>
								<div class="sty1045ColHeaderBelow">
						Before<br/>carryback
					</div>
								<div class="sty1045ColHeaderBelow">
						After<br/>carryback
					</div>
								<div class="sty1045ColHeaderBelow">
						Before<br/>carryback
					</div>
								<div class="sty1045ColHeaderBelow">
						After<br/>carryback
					</div>
							</div>
							<!-- Line 20 -->
							<div class="styStdDiv">
								<div class="styLNLeftNumBox">20</div>
								<div class="sty1045Desc">
						General business credit (see instructions)
						<span class="sty1045DotLn">...</span>
									</div>
								<div class="sty1045AmtBox">
									<xsl:call-template name="SetFormLinkInline">
										<xsl:with-param name="TargetNode" select="$FormData"/>
									</xsl:call-template>
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/CarrybackDecreaseTaxCmptGrp[1]/BeforeCarrybackGrp/CommonCarrybackGrp/GeneralBusinessCreditAmt"/>
									</xsl:call-template>
								</div>
								<div class="sty1045AmtBox">
									<xsl:call-template name="SetFormLinkInline">
										<xsl:with-param name="TargetNode" select="$FormData"/>
									</xsl:call-template>
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/CarrybackDecreaseTaxCmptGrp[1]/AfterCarrybackGrp/CommonCarrybackGrp/GeneralBusinessCreditAmt"/>
									</xsl:call-template>
								</div>
								<div class="sty1045AmtBox">
									<xsl:call-template name="SetFormLinkInline">
										<xsl:with-param name="TargetNode" select="$FormData"/>
									</xsl:call-template>
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/CarrybackDecreaseTaxCmptGrp[2]/BeforeCarrybackGrp/CommonCarrybackGrp/GeneralBusinessCreditAmt"/>
									</xsl:call-template>
								</div>
								<div class="sty1045AmtBox">
									<xsl:call-template name="SetFormLinkInline">
										<xsl:with-param name="TargetNode" select="$FormData"/>
									</xsl:call-template>
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/CarrybackDecreaseTaxCmptGrp[2]/AfterCarrybackGrp/CommonCarrybackGrp/GeneralBusinessCreditAmt"/>
									</xsl:call-template>
								</div>
							</div>
							<!-- Line 21 -->
							<div class="styStdDiv">
								<div class="styLNLeftNumBox">21</div>
								<div class="sty1045Desc">
						Net premium tax credit and child tax credit (see instructions)
						<span class="sty1045DotLn">............</span>
									</div>
								<div class="sty1045AmtBox" style="height:7mm;padding-top:3mm;">
									<xsl:call-template name="SetFormLinkInline">
										<xsl:with-param name="TargetNode" select="$FormData"/>
									</xsl:call-template>
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/CarrybackDecreaseTaxCmptGrp[1]/BeforeCarrybackGrp/CommonCarrybackGrp/NetPTCAndCTCAmt"/>
									</xsl:call-template>
								</div>
								<div class="sty1045AmtBox" style="height:7mm;padding-top:3mm;">
									<xsl:call-template name="SetFormLinkInline">
										<xsl:with-param name="TargetNode" select="$FormData"/>
									</xsl:call-template>
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/CarrybackDecreaseTaxCmptGrp[1]/AfterCarrybackGrp/CommonCarrybackGrp/NetPTCAndCTCAmt"/>
									</xsl:call-template>
								</div>
								<div class="sty1045AmtBox" style="height:7mm;padding-top:3mm;">
									<xsl:call-template name="SetFormLinkInline">
										<xsl:with-param name="TargetNode" select="$FormData"/>
									</xsl:call-template>
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/CarrybackDecreaseTaxCmptGrp[2]/BeforeCarrybackGrp/CommonCarrybackGrp/NetPTCAndCTCAmt"/>
									</xsl:call-template>
								</div>
								<div class="sty1045AmtBox" style="height:7mm;padding-top:3mm;">
									<xsl:call-template name="SetFormLinkInline">
										<xsl:with-param name="TargetNode" select="$FormData"/>
									</xsl:call-template>
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/CarrybackDecreaseTaxCmptGrp[2]/AfterCarrybackGrp/CommonCarrybackGrp/NetPTCAndCTCAmt"/>
									</xsl:call-template>
								</div>
							</div>
							<!-- Line 22 -->
							<div class="styStdDiv">
								<div class="styLNLeftNumBox">22</div>
								<div class="sty1045Desc">
						Other credits. Identify
						<span class="sty1045DotLn">.........</span>
									</div>
								<div class="sty1045AmtBox" style="border-bottom-width:2px">
									<xsl:call-template name="SetFormLinkInline">
										<xsl:with-param name="TargetNode" select="$FormData"/>
									</xsl:call-template>
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/CarrybackDecreaseTaxCmptGrp[1]/BeforeCarrybackGrp/CommonCarrybackGrp/OtherCreditsAmt"/>
									</xsl:call-template>
								</div>
								<div class="sty1045AmtBox" style="border-bottom-width:2px">
									<xsl:call-template name="SetFormLinkInline">
										<xsl:with-param name="TargetNode" select="$FormData"/>
									</xsl:call-template>
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/CarrybackDecreaseTaxCmptGrp[1]/AfterCarrybackGrp/CommonCarrybackGrp/OtherCreditsAmt"/>
									</xsl:call-template>
								</div>
								<div class="sty1045AmtBox" style="border-bottom-width:2px">
									<xsl:call-template name="SetFormLinkInline">
										<xsl:with-param name="TargetNode" select="$FormData"/>
									</xsl:call-template>
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/CarrybackDecreaseTaxCmptGrp[2]/BeforeCarrybackGrp/CommonCarrybackGrp/OtherCreditsAmt"/>
									</xsl:call-template>
								</div>
								<div class="sty1045AmtBox" style="border-bottom-width:2px">
									<xsl:call-template name="SetFormLinkInline">
										<xsl:with-param name="TargetNode" select="$FormData"/>
									</xsl:call-template>
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/CarrybackDecreaseTaxCmptGrp[2]/AfterCarrybackGrp/CommonCarrybackGrp/OtherCreditsAmt"/>
									</xsl:call-template>
								</div>
							</div>
							<!-- Line 23 -->
							<div class="styStdDiv">
								<div class="styLNLeftNumBox">23</div>
								<div class="sty1045Desc">
						Total credits. Add lines 20 through 22
						<span class="sty1045DotLn">....</span>
									</div>
								<div class="sty1045AmtBox" style="border-bottom-width:2px">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/CarrybackDecreaseTaxCmptGrp[1]/BeforeCarrybackGrp/CommonCarrybackGrp/TotalCreditsAmt"/>
									</xsl:call-template>
								</div>
								<div class="sty1045AmtBox" style="border-bottom-width:2px">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/CarrybackDecreaseTaxCmptGrp[1]/AfterCarrybackGrp/CommonCarrybackGrp/TotalCreditsAmt"/>
									</xsl:call-template>
								</div>
								<div class="sty1045AmtBox" style="border-bottom-width:2px">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/CarrybackDecreaseTaxCmptGrp[2]/BeforeCarrybackGrp/CommonCarrybackGrp/TotalCreditsAmt"/>
									</xsl:call-template>
								</div>
								<div class="sty1045AmtBox" style="border-bottom-width:2px">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/CarrybackDecreaseTaxCmptGrp[2]/AfterCarrybackGrp/CommonCarrybackGrp/TotalCreditsAmt"/>
									</xsl:call-template>
								</div>
							</div>
							<!-- Line 24 -->
							<div class="styStdDiv">
								<div class="styLNLeftNumBox">24</div>
								<div class="sty1045Desc">
						Subtract line 23 from line 19
						<span class="sty1045DotLn">.......</span>
									</div>
								<div class="sty1045AmtBox">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/CarrybackDecreaseTaxCmptGrp[1]/BeforeCarrybackGrp/CommonCarrybackGrp/SumTaxesLessTotalCreditsAmt"/>
									</xsl:call-template>
								</div>
								<div class="sty1045AmtBox">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/CarrybackDecreaseTaxCmptGrp[1]/AfterCarrybackGrp/CommonCarrybackGrp/SumTaxesLessTotalCreditsAmt"/>
									</xsl:call-template>
								</div>
								<div class="sty1045AmtBox">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/CarrybackDecreaseTaxCmptGrp[2]/BeforeCarrybackGrp/CommonCarrybackGrp/SumTaxesLessTotalCreditsAmt"/>
									</xsl:call-template>
								</div>
								<div class="sty1045AmtBox">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/CarrybackDecreaseTaxCmptGrp[2]/AfterCarrybackGrp/CommonCarrybackGrp/SumTaxesLessTotalCreditsAmt"/>
									</xsl:call-template>
								</div>
							</div>
							<!-- Line 25 -->
							<div class="styStdDiv">
								<div class="styLNLeftNumBox">25</div>
								<div class="sty1045Desc">
						Self-employment tax (see instructions)
						<span class="sty1045DotLn">...</span>
									</div>
								<div class="sty1045AmtBox">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/CarrybackDecreaseTaxCmptGrp[1]/BeforeCarrybackGrp/CommonCarrybackGrp/SelfEmploymentTaxAmt"/>
									</xsl:call-template>
								</div>
								<div class="sty1045AmtBox">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/CarrybackDecreaseTaxCmptGrp[1]/AfterCarrybackGrp/CommonCarrybackGrp/SelfEmploymentTaxAmt"/>
									</xsl:call-template>
								</div>
								<div class="sty1045AmtBox">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/CarrybackDecreaseTaxCmptGrp[2]/BeforeCarrybackGrp/CommonCarrybackGrp/SelfEmploymentTaxAmt"/>
									</xsl:call-template>
								</div>
								<div class="sty1045AmtBox">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/CarrybackDecreaseTaxCmptGrp[2]/AfterCarrybackGrp/CommonCarrybackGrp/SelfEmploymentTaxAmt"/>
									</xsl:call-template>
								</div>
							</div>
							<!-- Line 26 -->
							<div class="styStdDiv">
								<div class="styLNLeftNumBox">26</div>
								<div class="sty1045Desc">
						Additional Medicare Tax (see instructions)
						<span class="sty1045DotLn">...</span>
									</div>
								<div class="sty1045AmtBox">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/CarrybackDecreaseTaxCmptGrp[1]/BeforeCarrybackGrp/CommonCarrybackGrp/AdditionalMedicareTaxAmt"/>
									</xsl:call-template>
								</div>
								<div class="sty1045AmtBox">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/CarrybackDecreaseTaxCmptGrp[1]/AfterCarrybackGrp/CommonCarrybackGrp/AdditionalMedicareTaxAmt"/>
									</xsl:call-template>
								</div>
								<div class="sty1045AmtBox">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/CarrybackDecreaseTaxCmptGrp[2]/BeforeCarrybackGrp/CommonCarrybackGrp/AdditionalMedicareTaxAmt"/>
									</xsl:call-template>
								</div>
								<div class="sty1045AmtBox">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/CarrybackDecreaseTaxCmptGrp[2]/AfterCarrybackGrp/CommonCarrybackGrp/AdditionalMedicareTaxAmt"/>
									</xsl:call-template>
								</div>
							</div>
							<!-- Line 27 -->
							<div class="styStdDiv">
								<div class="styLNLeftNumBox">27</div>
								<div class="sty1045Desc">
						Net Investment Income Tax (see instructions)
						<span class="sty1045DotLn">.</span>
									</div>
								<div class="sty1045AmtBox">
									<xsl:call-template name="SetFormLinkInline">
										<xsl:with-param name="TargetNode" select="$FormData"/>
									</xsl:call-template>
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/CarrybackDecreaseTaxCmptGrp[1]/BeforeCarrybackGrp/CommonCarrybackGrp/NetInvestmentIncomeTaxAmt"/>
									</xsl:call-template>
								</div>
								<div class="sty1045AmtBox">
									<xsl:call-template name="SetFormLinkInline">
										<xsl:with-param name="TargetNode" select="$FormData"/>
									</xsl:call-template>
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/CarrybackDecreaseTaxCmptGrp[1]/AfterCarrybackGrp/CommonCarrybackGrp/NetInvestmentIncomeTaxAmt"/>
									</xsl:call-template>
								</div>
								<div class="sty1045AmtBox">
									<xsl:call-template name="SetFormLinkInline">
										<xsl:with-param name="TargetNode" select="$FormData"/>
									</xsl:call-template>
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/CarrybackDecreaseTaxCmptGrp[2]/BeforeCarrybackGrp/CommonCarrybackGrp/NetInvestmentIncomeTaxAmt"/>
									</xsl:call-template>
								</div>
								<div class="sty1045AmtBox">
									<xsl:call-template name="SetFormLinkInline">
										<xsl:with-param name="TargetNode" select="$FormData"/>
									</xsl:call-template>
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/CarrybackDecreaseTaxCmptGrp[2]/AfterCarrybackGrp/CommonCarrybackGrp/NetInvestmentIncomeTaxAmt"/>
									</xsl:call-template>
								</div>
							</div>
							<!-- Line 28 -->
							<div class="styStdDiv">
								<div class="styLNLeftNumBox">28</div>
								<div class="sty1045Desc">
						Reserved for future use
						<span class="sty1045DotLn">........</span>
									</div>
								<div class="sty1045AmtBox" style="background-color:lightgrey;">&nbsp;</div>
								<div class="sty1045AmtBox" style="background-color:lightgrey;">&nbsp;</div>
								<div class="sty1045AmtBox" style="background-color:lightgrey;">&nbsp;</div>
								<div class="sty1045AmtBox" style="background-color:lightgrey;">&nbsp;</div>
							</div>
							<!-- Line 29 -->
							<div class="styStdDiv">
								<div class="styLNLeftNumBox">29</div>
								<div class="sty1045Desc">
						Other taxes
						<span class="sty1045DotLn">............</span>
									</div>
								<div class="sty1045AmtBox" style="border-bottom-width: 2px">
									<xsl:call-template name="SetFormLinkInline">
										<xsl:with-param name="TargetNode" select="$FormData"/>
									</xsl:call-template>
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/CarrybackDecreaseTaxCmptGrp[1]/BeforeCarrybackGrp/CommonCarrybackGrp/OtherTaxesAmt"/>
									</xsl:call-template>
								</div>
								<div class="sty1045AmtBox" style="border-bottom-width: 2px">
									<xsl:call-template name="SetFormLinkInline">
										<xsl:with-param name="TargetNode" select="$FormData"/>
									</xsl:call-template>
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/CarrybackDecreaseTaxCmptGrp[1]/AfterCarrybackGrp/CommonCarrybackGrp/OtherTaxesAmt"/>
									</xsl:call-template>
								</div>
								<div class="sty1045AmtBox" style="border-bottom-width: 2px">
									<xsl:call-template name="SetFormLinkInline">
										<xsl:with-param name="TargetNode" select="$FormData"/>
									</xsl:call-template>
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/CarrybackDecreaseTaxCmptGrp[2]/BeforeCarrybackGrp/CommonCarrybackGrp/OtherTaxesAmt"/>
									</xsl:call-template>
								</div>
								<div class="sty1045AmtBox" style="border-bottom-width: 2px">
									<xsl:call-template name="SetFormLinkInline">
										<xsl:with-param name="TargetNode" select="$FormData"/>
									</xsl:call-template>
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/CarrybackDecreaseTaxCmptGrp[2]/AfterCarrybackGrp/CommonCarrybackGrp/OtherTaxesAmt"/>
									</xsl:call-template>
								</div>
							</div>
							<!-- Line 30 -->
							<div class="styStdDiv">
								<div class="styLNLeftNumBox">30</div>
								<div class="sty1045Desc">
						Total tax. Add lines 24 through 29
						<span class="sty1045DotLn">.....</span>
									</div>
								<div class="sty1045AmtBox">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/CarrybackDecreaseTaxCmptGrp[1]/BeforeCarrybackGrp/CommonCarrybackGrp/TotalTaxAmt"/>
									</xsl:call-template>
								</div>
								<div class="sty1045AmtBox">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/CarrybackDecreaseTaxCmptGrp[1]/AfterCarrybackGrp/CommonCarrybackGrp/TotalTaxAmt"/>
									</xsl:call-template>
								</div>
								<div class="sty1045AmtBox">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/CarrybackDecreaseTaxCmptGrp[2]/BeforeCarrybackGrp/CommonCarrybackGrp/TotalTaxAmt"/>
									</xsl:call-template>
								</div>
								<div class="sty1045AmtBox">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/CarrybackDecreaseTaxCmptGrp[2]/AfterCarrybackGrp/CommonCarrybackGrp/TotalTaxAmt"/>
									</xsl:call-template>
								</div>
							</div>
							<!-- Line 31 -->
							<div class="styStdDiv" style="">
								<div class="styLNLeftNumBox">31</div>
								<div class="sty1045Desc" style="">
						Enter the amount from the "After carryback" column on line 30 for each year
						<span class="sty1045DotLn">......</span>
									</div>
								<div class="sty1045AmtBox" style="height:7mm;padding-top:3mm; border-bottom-width:2px;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/CarrybackDecreaseTaxCmptGrp[1]/BeforeCarrybackGrp/CommonCarrybackGrp/TotalTaxAmt"/>
									</xsl:call-template>
								</div>
								<div class="sty1045AmtBox" style="background-color:lightgrey;height:7mm; border-bottom-width:2px;">&nbsp;</div>
								<div class="sty1045AmtBox" style="height:7mm;padding-top:3mm; border-bottom-width:2px;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/CarrybackDecreaseTaxCmptGrp[2]/BeforeCarrybackGrp/CommonCarrybackGrp/TotalTaxAmt"/>
									</xsl:call-template>
								</div>
								<div class="sty1045AmtBox" style="background-color:lightgrey;height:7mm; border-bottom-width:2px;">&nbsp;</div>
							</div>
							<!-- Line 32 -->
							<div class="styStdDiv" style="border-bottom-width:1px solid black;">
								<div class="styLNLeftNumBox">32</div>
								<div class="sty1045Desc" style="">
						Decrease in tax. Line 30 minus line 31
						<span class="sty1045DotLn">....</span>
									</div>
								<div class="sty1045AmtBox">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/CarrybackDecreaseTaxCmptGrp[1]/BeforeCarrybackGrp/TaxDecreaseAmt"/>
									</xsl:call-template>
								</div>
								<div class="sty1045AmtBox" style="background-color:lightgrey;">&nbsp;</div>
								<div class="sty1045AmtBox">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/CarrybackDecreaseTaxCmptGrp[2]/BeforeCarrybackGrp/TaxDecreaseAmt"/>
									</xsl:call-template>
								</div>
								<div class="sty1045AmtBox" style="background-color:lightgrey;">&nbsp;</div>
							</div>
						</xsl:if>
						<xsl:if test="count($FormData/CarrybackDecreaseTaxCmptGrp) &lt; 1">
							<div class="styStdDiv" style="border-top:2px solid black;">
								<div class="sty1045Desc" style="width:73mm;height:21mm;padding-top:1.5mm;border-bottom:1px solid black;text-align:center;">
									<span style="font-size:12.5px;">
										<strong>Computation of Decrease in Tax</strong>
									</span>
									<br/>
						(continued)
						<span style="padding-bottom:12mm;">
										<br/>
									</span>
								</div>
								<div class="sty1045ColHeaderEmpty">
									<span class="sty1045OrdinalNum">&nbsp;</span>
						preceding tax year ended: 
						<span class="sty1045PrecYrEnd">&nbsp;</span>
								</div>
								<div class="sty1045ColHeaderEmpty">
									<span class="sty1045OrdinalNum">&nbsp;</span>
						preceding tax year ended: 
						<span class="sty1045PrecYrEnd">&nbsp;</span>
								</div>
								<div class="sty1045ColHeaderEmpty">
									<span class="sty1045OrdinalNum">&nbsp;</span>
							preceding tax year ended: 
							<span class="sty1045PrecYrEnd">&nbsp;</span>
								</div>
								<div class="sty1045ColHeaderBelowEmpty">
						Before<br/>carryback
					</div>
								<div class="sty1045ColHeaderBelowEmpty">
						After<br/>carryback
					</div>
								<div class="sty1045ColHeaderBelowEmpty">
						Before<br/>carryback
					</div>
								<div class="sty1045ColHeaderBelowEmpty">
						After<br/>carryback
					</div>
								<div class="sty1045ColHeaderBelowEmpty">
						Before<br/>carryback
					</div>
								<div class="sty1045ColHeaderBelowEmpty">
						After<br/>carryback
					</div>
							</div>
							<!-- Line 20 -->
							<div class="styStdDiv" style="">
								<div class="styLNLeftNumBox">20</div>
								<div class="sty1045Desc">
						General business credit (see instructions)
						<span class="sty1045DotLn">...</span>
								</div>
								<div class="sty1045AmtBoxEmpty">&nbsp;</div>
								<div class="sty1045AmtBoxEmpty">&nbsp;</div>
								<div class="sty1045AmtBoxEmpty">&nbsp;</div>
								<div class="sty1045AmtBoxEmpty">&nbsp;</div>
								<div class="sty1045AmtBoxEmpty">&nbsp;</div>
								<div class="sty1045AmtBoxEmpty">&nbsp;</div>
							</div>
							<!-- Line 21 -->
							<div class="styStdDiv" style="">
								<div class="styLNLeftNumBox">21</div>
								<div class="sty1045Desc" style="">
						Net premium tax credit and child tax credit (see instructions)
						<span class="sty1045DotLn">............</span>
								</div>
								<div class="sty1045AmtBoxEmpty" style="height:7mm;">&nbsp;</div>
								<div class="sty1045AmtBoxEmpty" style="height:7mm;">&nbsp;</div>
								<div class="sty1045AmtBoxEmpty" style="height:7mm;">&nbsp;</div>
								<div class="sty1045AmtBoxEmpty" style="height:7mm;">&nbsp;</div>
								<div class="sty1045AmtBoxEmpty" style="height:7mm;">&nbsp;</div>
								<div class="sty1045AmtBoxEmpty" style="height:7mm;">&nbsp;</div>
							</div>
							<!-- Line 22 -->
							<div class="styStdDiv" style="">
								<div class="styLNLeftNumBox">22</div>
								<div class="sty1045Desc" style="">
							Other credits. Identify
						<span class="sty1045DotLn">.........</span>
								</div>
								<div class="sty1045AmtBoxEmpty" style="border-bottom-width:2px">&nbsp;</div>
								<div class="sty1045AmtBoxEmpty" style="border-bottom-width:2px">&nbsp;</div>
								<div class="sty1045AmtBoxEmpty" style="border-bottom-width:2px">&nbsp;</div>
								<div class="sty1045AmtBoxEmpty" style="border-bottom-width:2px">&nbsp;</div>
								<div class="sty1045AmtBoxEmpty" style="border-bottom-width:2px">&nbsp;</div>
								<div class="sty1045AmtBoxEmpty" style="border-bottom-width:2px">&nbsp;</div>
							</div>
							<!-- Line 23 -->
							<div class="styStdDiv" style="">
								<div class="styLNLeftNumBox">23</div>
								<div class="sty1045Desc" style="">
						Total credits. Add lines 20 through 22
						<span class="sty1045DotLn">....</span>
								</div>
								<div class="sty1045AmtBoxEmpty" style="border-bottom-width:2px">&nbsp;</div>
								<div class="sty1045AmtBoxEmpty" style="border-bottom-width:2px">&nbsp;</div>
								<div class="sty1045AmtBoxEmpty" style="border-bottom-width:2px">&nbsp;</div>
								<div class="sty1045AmtBoxEmpty" style="border-bottom-width:2px">&nbsp;</div>
								<div class="sty1045AmtBoxEmpty" style="border-bottom-width:2px">&nbsp;</div>
								<div class="sty1045AmtBoxEmpty" style="border-bottom-width:2px">&nbsp;</div>
							</div>
							<!-- Line 24 -->
							<div class="styStdDiv" style="">
								<div class="styLNLeftNumBox">24</div>
								<div class="sty1045Desc" style="">
						Subtract line 23 from line 19
						<span class="sty1045DotLn">.......</span>
								</div>
								<div class="sty1045AmtBoxEmpty">&nbsp;</div>
								<div class="sty1045AmtBoxEmpty">&nbsp;</div>
								<div class="sty1045AmtBoxEmpty">&nbsp;</div>
								<div class="sty1045AmtBoxEmpty">&nbsp;</div>
								<div class="sty1045AmtBoxEmpty">&nbsp;</div>
								<div class="sty1045AmtBoxEmpty">&nbsp;</div>
							</div>
							<!-- Line 25 -->
							<div class="styStdDiv" style="">
								<div class="styLNLeftNumBox">25</div>
								<div class="sty1045Desc" style="">
						Self-employment tax (see instructions)
						<span class="sty1045DotLn">...</span>
								</div>
								<div class="sty1045AmtBoxEmpty">&nbsp;</div>
								<div class="sty1045AmtBoxEmpty">&nbsp;</div>
								<div class="sty1045AmtBoxEmpty">&nbsp;</div>
								<div class="sty1045AmtBoxEmpty">&nbsp;</div>
								<div class="sty1045AmtBoxEmpty">&nbsp;</div>
								<div class="sty1045AmtBoxEmpty">&nbsp;</div>
							</div>
							<!-- Line 26 -->
							<div class="styStdDiv" style="">
								<div class="styLNLeftNumBox">26</div>
								<div class="sty1045Desc" style="">
						Additional Medicare Tax (see instructions)
						<span class="sty1045DotLn">...</span>
								</div>
								<div class="sty1045AmtBoxEmpty">&nbsp;</div>
								<div class="sty1045AmtBoxEmpty">&nbsp;</div>
								<div class="sty1045AmtBoxEmpty">&nbsp;</div>
								<div class="sty1045AmtBoxEmpty">&nbsp;</div>
								<div class="sty1045AmtBoxEmpty">&nbsp;</div>
								<div class="sty1045AmtBoxEmpty">&nbsp;</div>
							</div>
							<!-- Line 27 -->
							<div class="styStdDiv" style="">
								<div class="styLNLeftNumBox">27</div>
								<div class="sty1045Desc" style="">
						Net Investment Income Tax (see instructions)
						<span class="sty1045DotLn">.</span>
								</div>
								<div class="sty1045AmtBoxEmpty">&nbsp;</div>
								<div class="sty1045AmtBoxEmpty">&nbsp;</div>
								<div class="sty1045AmtBoxEmpty">&nbsp;</div>
								<div class="sty1045AmtBoxEmpty">&nbsp;</div>
								<div class="sty1045AmtBoxEmpty">&nbsp;</div>
								<div class="sty1045AmtBoxEmpty">&nbsp;</div>
							</div>
							<!-- Line 28 -->
							<div class="styStdDiv" style="">
								<div class="styLNLeftNumBox">28</div>
								<div class="sty1045Desc" style="">
						Reserved for future use
						<span class="sty1045DotLn">........</span>
								</div>
								<div class="sty1045AmtBoxEmpty" style="background-color:lightgrey;">&nbsp;</div>
								<div class="sty1045AmtBoxEmpty" style="background-color:lightgrey;">&nbsp;</div>
								<div class="sty1045AmtBoxEmpty" style="background-color:lightgrey;">&nbsp;</div>
								<div class="sty1045AmtBoxEmpty" style="background-color:lightgrey;">&nbsp;</div>
								<div class="sty1045AmtBoxEmpty" style="background-color:lightgrey;">&nbsp;</div>
								<div class="sty1045AmtBoxEmpty" style="background-color:lightgrey;">&nbsp;</div>
							</div>
							<!-- Line 29 -->
							<div class="styStdDiv" style="">
								<div class="styLNLeftNumBox">29</div>
								<div class="sty1045Desc" style="">
						Other taxes
						<span class="sty1045DotLn">............</span>
								</div>
								<div class="sty1045AmtBoxEmpty" style="border-bottom-width:2px;">&nbsp;</div>
								<div class="sty1045AmtBoxEmpty" style="border-bottom-width:2px;">&nbsp;</div>
								<div class="sty1045AmtBoxEmpty" style="border-bottom-width:2px;">&nbsp;</div>
								<div class="sty1045AmtBoxEmpty" style="border-bottom-width:2px;">&nbsp;</div>
								<div class="sty1045AmtBoxEmpty" style="border-bottom-width:2px;">&nbsp;</div>
								<div class="sty1045AmtBoxEmpty" style="border-bottom-width:2px;">&nbsp;</div>
							</div>
							<!-- Line 30 -->
							<div class="styStdDiv" style="">
								<div class="styLNLeftNumBox">30</div>
								<div class="sty1045Desc" style="">
						Total tax. Add lines 24 through 29
						<span class="sty1045DotLn">.....</span>
								</div>
								<div class="sty1045AmtBoxEmpty">&nbsp;</div>
								<div class="sty1045AmtBoxEmpty">&nbsp;</div>
								<div class="sty1045AmtBoxEmpty">&nbsp;</div>
								<div class="sty1045AmtBoxEmpty">&nbsp;</div>
								<div class="sty1045AmtBoxEmpty">&nbsp;</div>
								<div class="sty1045AmtBoxEmpty">&nbsp;</div>
							</div>
							<!-- Line 31 -->
							<div class="styStdDiv" style="">
								<div class="styLNLeftNumBox">31</div>
								<div class="sty1045Desc" style="">
						Enter the amount from the "After carryback" column on line 30 for each year
						<span class="sty1045DotLn">......</span>
								</div>
								<div class="sty1045AmtBoxEmpty" style="height:7mm;border-bottom-width:2px;">&nbsp;</div>
								<div class="sty1045AmtBoxEmpty" style="background-color:lightgrey;height:7mm;border-bottom-width:2px;">&nbsp;</div>
								<div class="sty1045AmtBoxEmpty" style="height:7mm;border-bottom-width:2px;">&nbsp;</div>
								<div class="sty1045AmtBoxEmpty" style="background-color:lightgrey;height:7mm;border-bottom-width:2px;">&nbsp;</div>
								<div class="sty1045AmtBoxEmpty" style="height:7mm;border-bottom-width:2px;">&nbsp;</div>
								<div class="sty1045AmtBoxEmpty" style="background-color:lightgrey;height:7mm;border-bottom-width:2px;">&nbsp;</div>
							</div>
							<!-- Line 32 -->
							<div class="styStdDiv" style="border-bottom-width:1px solid black;">
								<div class="styLNLeftNumBox">32</div>
								<div class="sty1045Desc" style="">
						Decrease in tax. Line 30 minus line 31
						<span class="sty1045DotLn">....</span>
								</div>
								<div class="sty1045AmtBoxEmpty">&nbsp;</div>
								<div class="sty1045AmtBoxEmpty" style="background-color:lightgrey;">&nbsp;</div>
								<div class="sty1045AmtBoxEmpty">&nbsp;</div>
								<div class="sty1045AmtBoxEmpty" style="background-color:lightgrey;">&nbsp;</div>
								<div class="sty1045AmtBoxEmpty">&nbsp;</div>
								<div class="sty1045AmtBoxEmpty" style="background-color:lightgrey;">&nbsp;</div>
							</div>
						</xsl:if>
						<!-- Line 33 -->
						<div class="styStdDiv" style="border-top:1px solid black;">
							<div class="styLNLeftNumBox">33</div>
							<div class="styLNDesc">
							Overpayment of tax due to a claim of right adjustment under section 1341(b)(1) (attach computation)
								<xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode" select="$FormData"/>
								</xsl:call-template>
							</div>
							<div class="styLNRightNumBox" style="border-bottom-width:0px;height:4mm;width:8mm;border-bottom:1px solid black;">33</div>
							<div class="sty1045AmtBox" style="border-bottom-width:0px;height:4mm;width:33mm;border-bottom:1px solid black;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/OvpmtTxClaimOfRightAdjAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<!-- Line 34 -->
						<div class="styStdDiv" style="border-bottom:1px solid black;">
							<div style="width:145mm;height:15mm;">
								<div class="styLNLeftNumBox">34</div>
								<div class="styLNDesc" style="width:130mm;">
									Complete direct deposit information for any refund from line(s) 32 and/or 33. (See instructions.)
								</div>
								<div style="padding-top:1mm;">
									<div class="styLNLeftNumBoxSD" style="padding-left:4.2mm;">a</div>
									<div class="sty1045LongDesc" style="width:24mm;">
										Routing number
									</div>
									<div class="styGenericDiv" style="height:auto;width:50mm;border:1px solid;text-align:center;">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$FormData/DirectDepositGrp/RoutingTransitNum"/>
										</xsl:call-template>
									</div>
									<div class="styLNLeftLtrBox" style="margin-left:5mm;">b</div>
									<div class="sty1045LongDesc" style="width:7mm;">
										Type:
									</div>
									<div class="styGenericDiv" style="text-align:right;height:auto;width:20mm;text-align:center;">
										<input type="Checkbox" class="styCkboxNM" aria-label="Checking">
											<xsl:call-template name="PopulateCheckbox">
												<xsl:with-param name="TargetNode" select="$FormData/DirectDepositGrp/CheckingAccountInd"/>
												<xsl:with-param name="BackupName">IRS1139CheckingAccountInd</xsl:with-param>
											</xsl:call-template>
										</input>
										Checking
									</div>
									<div class="styGenericDiv" style="text-align:right;height:auto;width:20mm;text-align:center;">
										<input type="Checkbox" class="styCkboxNM" aria-label="Savings">
											<xsl:call-template name="PopulateCheckbox">
												<xsl:with-param name="TargetNode" select="$FormData/DirectDepositGrp/SavingsAccountInd"/>
												<xsl:with-param name="BackupName">IRS1139SavingsAccountInd</xsl:with-param>
											</xsl:call-template>
										</input>
										Savings
									</div>
								</div>
								<div style="padding-top:1mm;">
									<div class="styLNLeftNumBoxSD" style="padding-left:4.2mm;">c</div>
									<div class="sty1045LongDesc" style="width:24mm;">
										Account number
									</div>
									<div style="width:112mm;float:left;">
										<div class="styGenericDiv" style="height:auto;width:85mm;border:1px solid;text-align:center;">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="$FormData/DirectDepositGrp/DepositorAccountNum"/>
											</xsl:call-template>
										</div>
									</div>
								</div>
							</div>
							<div class="sty1045AmtBox" style="width:41mm;height:15mm;background-color:lightgrey;float:right;border-bottom-width:0;">
								&nbsp;
							</div>
						</div>
						<!-- BEGIN Signature Section -->
						<div class="styStdDiv" style="border-bottom:1px solid black;">
							<!-- Implementing the signature section in table -->
							<div style="width:18mm;height:32mm;border-right:1px solid black;float:left;">
								<span class="styMainTitle" style="font-size:12pt;padding-top:3mm;padding-bottom:3mm;">
								Sign Here							
							</span>
							Keep a copy of this application for your records.
						</div>
							<div style="width:169mm;float:left;clear:none;">
								<div class="styLNDesc" style="width:169mm;height:8mm;padding-left:1mm">
								Under penalties of perjury, I declare that I have examined this application and accompanying schedules and statements, and, to the best of my knowledge
and belief, they are true, correct, and complete.<br/>
								</div>
								<div class="styLNDesc" style="height:12mm;width:128mm;border-right:1px solid black;border-bottom:1px solid black;padding-left:1mm;">
								Your signature<br/>
									<span>
										<xsl:call-template name="PopulatePin">
											<xsl:with-param name="TargetNode" select="$RtnHdrData/PrimarySignaturePIN"/>
											<xsl:with-param name="BackupName">RtnHdrDataPrimarySignature</xsl:with-param>
										</xsl:call-template>
										<xsl:call-template name="LinkToLeftoverDataTableInline">
											<xsl:with-param name="Desc">Signature - Identity Protection PIN </xsl:with-param>
											<xsl:with-param name="TargetNode" select="$RtnHdrData/IdentityProtectionPIN"/>
										</xsl:call-template>
									</span>
									<xsl:choose>
										<xsl:when test="$RtnHdrData/SignatureOptionCd">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="$RtnHdrData/SignatureOptionCd"/>
												<xsl:with-param name="BackupName">$RtnHdrDataSignatureOptionCd</xsl:with-param>
											</xsl:call-template>
										</xsl:when>
										<xsl:otherwise>
											<xsl:call-template name="LinkToLeftoverDataTableInline">
												<xsl:with-param name="Desc">Signature - Fiduciary PIN </xsl:with-param>
												<xsl:with-param name="TargetNode" select="$RtnHdrData/PractitionerPINGrp/FiduciaryPIN"/>
											</xsl:call-template>
											<xsl:call-template name="LinkToLeftoverDataTableInline">
												<xsl:with-param name="Desc">Signature - PIN Entered </xsl:with-param>
												<xsl:with-param name="TargetNode" select="$RtnHdrData/PractitionerPINGrp/PINEnteredByCd"/>
											</xsl:call-template>
											<xsl:call-template name="LinkToLeftoverDataTableInline">
												<xsl:with-param name="Desc">Signature - OFFICER REPRESENTING FIDUCIARY </xsl:with-param>
												<xsl:with-param name="TargetNode" select="$RtnHdrData/PractitionerPINGrp/FiduciaryRepOfficerNm"/>
											</xsl:call-template>
										</xsl:otherwise>
									</xsl:choose>
								</div>
								<div class="styLNDesc" style="height:12mm;width:40mm;padding-left:1mm;border-bottom:1px solid black;">Date<br/>
									<span>
										<xsl:call-template name="PopulateMonthDayYear">
											<xsl:with-param name="TargetNode" select="$RtnHdrData/PrimarySignatureDt"/>
											<xsl:with-param name="BackupName">RtnHdrDataPrimarySignatureDate</xsl:with-param>
										</xsl:call-template>
										<xsl:if test="$RtnHdrData/PractitionerPINGrp/FiduciarySignatureDt">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="$RtnHdrData/PractitionerPINGrp/FiduciarySignatureDt"/>
												<xsl:with-param name="BackupName">$RtnHdrFiduciarySignatureDt</xsl:with-param>
											</xsl:call-template>
										</xsl:if>
									</span>
								</div>
								<div style="width:169mm;float:left;clear:none;">
									<div class="styLNDesc" style="height:12mm;width:128mm;border-right:1px solid black;padding-left:1mm;">
									Spouse's signature. If Form 1045 is filed jointly, <strong>both</strong> must sign.<br/>
										<span>
											<xsl:call-template name="PopulatePin">
												<xsl:with-param name="TargetNode" select="$RtnHdrData/SpouseSignaturePIN"/>
												<xsl:with-param name="BackupName">RtnHdrDataSpouseSignature</xsl:with-param>
											</xsl:call-template>
											<xsl:call-template name="LinkToLeftoverDataTableInline">
												<xsl:with-param name="Desc">Signature - Spouse Protection PIN </xsl:with-param>
												<xsl:with-param name="TargetNode" select="$RtnHdrData/SpouseIdentityProtectionPIN"/>
											</xsl:call-template>
										</span>
									</div>
									<div class="styLNDesc" style="height:12mm;width:40mm;padding-left:1mm;">Date<br/>
										<span>
											<xsl:call-template name="PopulateMonthDayYear">
												<xsl:with-param name="TargetNode" select="$RtnHdrData/SpouseSignatureDt"/>
												<xsl:with-param name="BackupName">RtnHdrDataSpouseSignatureDate</xsl:with-param>
											</xsl:call-template>
										</span>
									</div>
								</div>
							</div>
						</div>
						<!-- End Signature Section -->
						<!-- BEGIN PREPARER SIGNATURE SECTION   -->
						<!-- paid preparer -->
						<div class="styStdDiv">
							<div style="width:18mm;padding-top:5mm;float:left;clear:none;">
								<span class="styMainTitle" style="font-size:11pt;">
								Paid Preparer Use Only
							</span>
							</div>
							<div style="width:169mm;float:left;clear:none;boorder-left:1px solid black;">
								<div class="styLNDesc" style="height:9mm;width:48mm;padding-top:0mm;border-right:1px solid black;border-left:1px solid black;padding-left:1mm">
									Preparer's name<br/>
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$RtnHdrData/PaidPreparerInformationGrp/PreparerPersonNm"/>
										<xsl:with-param name="BackupName">$RtnHdrDataPreparerPersonGrpPreparerPersonName</xsl:with-param>
									</xsl:call-template>
								</div>
								<div class="styLNDesc" style="height:9mm;width:49mm;padding-top:0mm;border-right:1px solid black;padding-left:1mm;">
									Preparer's signature
									</div>
								<div class="styLNDesc" style="height:9mm;width:17mm;border-right:1px solid black;padding-top:0mm;padding-left:1mm">Date <br/>
									<xsl:call-template name="PopulateReturnHeaderPaidPreparerInformation">
										<xsl:with-param name="TargetNode">DateSigned</xsl:with-param>
										<xsl:with-param name="BackupName">$RtnHdrDataPreparerPersonGrpPreparationDt</xsl:with-param>
									</xsl:call-template>
								</div>
								<div class="styLNDesc" style="height:9mm;width:20mm;border-right:1px solid black;padding-top:.5mm;padding-bottom:0mm;padding-left:1mm;">
									<label>
										<xsl:call-template name="PopulateLabel">
											<xsl:with-param name="TargetNode" select="$RtnHdrData/PaidPreparerInformationGrp/SelfEmployedInd"/>
											<xsl:with-param name="BackupName">$RtnHdrDataPreparerPersonGrpSelfEmployedInd</xsl:with-param>
										</xsl:call-template>
											Check 
											<input class="styCkboxNM" type="checkbox" style="width:4mm;">
											<xsl:call-template name="PopulateCheckbox">
												<xsl:with-param name="TargetNode" select="$RtnHdrData/PaidPreparerInformationGrp/SelfEmployedInd"/>
												<xsl:with-param name="BackupName">$RtnHdrDataPreparerPersonGrpSelfEmployedInd</xsl:with-param>
											</xsl:call-template>
										</input>
										<span style="width:6px;"/>if<br/>self-employed
										</label>
								</div>
								<div class="styLNDesc" style="height:8mm;width:30mm;padding-top:0mm;padding-left:1mm;">PTIN<br/>
									<xsl:choose>
										<xsl:when test="$RtnHdrData/PaidPreparerInformationGrp/PreparerSSN">
											<xsl:call-template name="PopulateReturnHeaderPaidPreparerInformation">
												<xsl:with-param name="TargetNode">PreparerSSN</xsl:with-param>
												<xsl:with-param name="BackupName">$RtnHdrDataPreparerPersonGrpSSN</xsl:with-param>
											</xsl:call-template>
										</xsl:when>
										<xsl:when test="$RtnHdrData/PaidPreparerInformationGrp/PTIN">
											<xsl:call-template name="PopulateReturnHeaderPaidPreparerInformation">
												<xsl:with-param name="TargetNode">PTIN</xsl:with-param>
												<xsl:with-param name="BackupName">$RtnHdrDataPreparerPersonGrpPTIN</xsl:with-param>
											</xsl:call-template>
										</xsl:when>
										<xsl:otherwise>
											<xsl:call-template name="PopulateReturnHeaderPaidPreparerInformation">
												<xsl:with-param name="TargetNode">STIN</xsl:with-param>
												<xsl:with-param name="BackupName">$RtnHdrDataPreparerPersonGrpSTIN</xsl:with-param>
											</xsl:call-template>
										</xsl:otherwise>
									</xsl:choose>
								</div>
							</div>
							<div style="width:169mm;float:left;clear:none;border-top: 1px solid black;border-bottom: 1px solid black;">
								<div class="styLNDesc" style="height:7mm;width:126.5mm;border-right:1px solid black;border-left:1px solid black;padding-left:1mm;">
									<span class="styGenericDiv">Firm's name<span style="width:3mm;"/>
									</span>
									<div style="padding-right:.5mm;">
										<xsl:call-template name="PopulateReturnHeaderPaidPreparerInformation">
											<xsl:with-param name="TargetNode">BusinessNameLine1Txt</xsl:with-param>
											<xsl:with-param name="BackupName">$RtnHdrDataPreparerPersonGrpFirmGrpPreparerFirmNameBusinessName1</xsl:with-param>
										</xsl:call-template>
										<br/>
										<xsl:call-template name="PopulateReturnHeaderPaidPreparerInformation">
											<xsl:with-param name="TargetNode">BusinessNameLine2Txt</xsl:with-param>
											<xsl:with-param name="BackupName">$RtnHdrDataPreparerPersonGrpFirmGrpPreparerFirmNameBusinessName2</xsl:with-param>
										</xsl:call-template>
									</div>
								</div>
								<div class="styLNDesc" style="height:6mm;width:34mm;padding-left:1mm;">
								Firm's EIN<br/>
									<xsl:if test="$RtnHdrData/PaidPreparerInformationGrp/PreparerFirmEIN">
										<xsl:call-template name="PopulateReturnHeaderPaidPreparerInformation">
											<xsl:with-param name="TargetNode">PreparerFirmIDNumber</xsl:with-param>
											<xsl:with-param name="BackupName">$RtnHdrDataPreparerPersonGrpFirmGrpPreparerFirmEIN</xsl:with-param>
										</xsl:call-template>
									</xsl:if>
									<xsl:if test="$RtnHdrData/PaidPreparerInformationGrp/MissingEINReasonCd">
										<xsl:call-template name="PopulateReturnHeaderPaidPreparerInformation">
											<xsl:with-param name="TargetNode">MissingEINReason</xsl:with-param>
											<xsl:with-param name="BackupName">$RtnHdrDataPreparerPersonGrpFirmGrpMissingEINReason</xsl:with-param>
										</xsl:call-template>
									</xsl:if>
								</div>
							</div>
							<div style="width:164mm;float:left;clear:none;">
								<div class="styLNDesc" style="width:126.5mm;border-right:1px solid black;border-left:1px solid black;padding-left:1mm;height:10mm;">
									<span class="styGenericDiv">Firm's address<span style="width:3mm;"/>
									</span>
									<div style="padding-right:.5mm;">
										<xsl:call-template name="PopulateReturnHeaderPaidPreparerInformation">
											<xsl:with-param name="TargetNode">AddressLine1Txt</xsl:with-param>
											<xsl:with-param name="BackupName">$RtnHdrDataPreparerPersonGrpFirmGrpAddressLine1</xsl:with-param>
										</xsl:call-template>
										<br/>
										<xsl:call-template name="PopulateReturnHeaderPaidPreparerInformation">
											<xsl:with-param name="TargetNode">AddressLine2Txt</xsl:with-param>
											<xsl:with-param name="BackupName">$RtnHdrDataPreparerPersonGrpFirmGrpAddressLine2</xsl:with-param>
										</xsl:call-template>
										<br/>
										<xsl:if test="$RtnHdrData/PaidPreparerInformationGrp/PreparerUSAddress">
											<xsl:call-template name="PopulateReturnHeaderPaidPreparerInformation">
												<xsl:with-param name="TargetNode">CityNm</xsl:with-param>
												<xsl:with-param name="BackupName">$RtnHdrDataPreparerPersonGrpFirmGrpUSAddressCity</xsl:with-param>
											</xsl:call-template>,
													<span style="width:2px;"/>
											<xsl:call-template name="PopulateReturnHeaderPaidPreparerInformation">
												<xsl:with-param name="TargetNode">StateAbbreviationCd</xsl:with-param>
												<xsl:with-param name="BackupName">$RtnHdrDataPreparerPersonGrpFirmGrpUSAddressState</xsl:with-param>
											</xsl:call-template>,
													<span style="width:2px;"/>
											<xsl:call-template name="PopulateReturnHeaderPaidPreparerInformation">
												<xsl:with-param name="TargetNode">ZIPCd</xsl:with-param>
												<xsl:with-param name="BackupName">$RtnHdrDataPreparerPersonGrpFirmGrpUSAddressZip</xsl:with-param>
											</xsl:call-template>
										</xsl:if>
										<xsl:if test="$RtnHdrData/PaidPreparerInformationGrp/PreparerForeignAddress">
											<xsl:call-template name="PopulateReturnHeaderPaidPreparerInformation">
												<xsl:with-param name="TargetNode">CityNm</xsl:with-param>
												<xsl:with-param name="BackupName">$RtnHdrDataPreparerPersonGrpFirmGrpForeignAddressCity</xsl:with-param>
											</xsl:call-template>,
													<span style="width:2px;"/>
											<xsl:call-template name="PopulateReturnHeaderPaidPreparerInformation">
												<xsl:with-param name="TargetNode">ProvinceOrStateNm</xsl:with-param>
												<xsl:with-param name="BackupName">$RtnHdrDataPreparerPersonGrpFirmGrpForeignProvinceOrStateNm</xsl:with-param>
											</xsl:call-template>,
													<span style="width:2px;"/>
											<xsl:call-template name="PopulateReturnHeaderPaidPreparerInformation">
												<xsl:with-param name="TargetNode">ForeignPostalCd</xsl:with-param>
												<xsl:with-param name="BackupName">$RtnHdrDataPreparerPersonGrpFirmGrpForeignPostalCd</xsl:with-param>
											</xsl:call-template>,
													<span style="width:2px;"/>
											<xsl:call-template name="PopulateReturnHeaderPaidPreparerInformation">
												<xsl:with-param name="TargetNode">CountryCd</xsl:with-param>
												<xsl:with-param name="BackupName">$RtnHdrDataPreparerPersonGrpFirmGrpForeignCountry</xsl:with-param>
											</xsl:call-template>
										</xsl:if>
									</div>
								</div>
								<div class="styLNDesc" style="width:34mm;padding-left:1mm;">Phone no. 
									<xsl:call-template name="LinkToLeftoverDataTableInline">
										<xsl:with-param name="Desc">Bottom - Email Address </xsl:with-param>
										<xsl:with-param name="TargetNode" select="$RtnHdrData/PaidPreparerInformationGrp/EmailAddressTxt"/>
									</xsl:call-template>
									<br/>
									<xsl:call-template name="PopulateReturnHeaderPaidPreparerInformation">
										<xsl:with-param name="TargetNode">Phone</xsl:with-param>
										<xsl:with-param name="BackupName">$RtnHdrDataPreparerPersonGrpPhoneNum</xsl:with-param>
									</xsl:call-template>
									<xsl:call-template name="PopulateReturnHeaderPaidPreparerInformation">
										<xsl:with-param name="TargetNode">ForeignPhone</xsl:with-param>
										<xsl:with-param name="BackupName">$RtnHdrDataPreparerPersonGrpForeignPhoneNum</xsl:with-param>
									</xsl:call-template>
								</div>
							</div>
						</div>
						<!-- END PREPARER SIGNATURE SECTION -->
						<div class="styStdDiv pageEnd" style="border-top:2px solid black;">
							<span style="float:right;">Form <strong>1045</strong> (2025)</span>
						</div>
						<!-- Begin additional table for Computation of Decrease in Tax when there are more than 2 instances -->
						<xsl:if test="count($FormData/CarrybackDecreaseTaxCmptGrp) &gt; 2">
							<div class="styStdDiv" style="border-top:2px solid black;">
								<span class="styPartDesc" style="width:164mm;height:auto;font-weight:normal;">
									<strong>Computation of Decrease in Tax <i>(continued)</i></strong>
								</span>
							</div>
						</xsl:if>
						<!-- Computation of Decrease in Tax Table begin -->
						<xsl:for-each select="$FormData/CarrybackDecreaseTaxCmptGrp[position() &gt; 2]">
							<xsl:variable name="pos" select="position()"/>
							<xsl:if test="$pos mod 3 = 1">
								<div class="styStdDiv" style="border-top:1px solid black;">
									<div class="sty1045Desc" style="width:16mm;height:16mm;padding-top:1.5mm;border-bottom:1px solid black;text-align:center;">
										&nbsp;
									</div>
									<div class="sty1045ColHeader">
										<span class="sty1045OrdinalNum">
											<xsl:call-template name="PopulateMonthDayYear">
												<xsl:with-param name="TargetNode" select="$FormData/CarrybackDecreaseTaxCmptGrp[$pos + 2]/PrecedingYearNum"/>
											</xsl:call-template>
										</span>
						preceding tax year ended: 
						<span class="sty1045PrecYrEnd">
											<xsl:call-template name="PopulateMonthDayYear">
												<xsl:with-param name="TargetNode" select="$FormData/CarrybackDecreaseTaxCmptGrp[$pos + 2]/TaxPeriodEndDt"/>
											</xsl:call-template>
										</span>
									</div>
									<div class="sty1045ColHeader">
										<span class="sty1045OrdinalNum">
											<xsl:call-template name="PopulateMonthDayYear">
												<xsl:with-param name="TargetNode" select="$FormData/CarrybackDecreaseTaxCmptGrp[$pos + 3]/PrecedingYearNum"/>
											</xsl:call-template>
										</span>
						preceding tax year ended: 
						<span class="sty1045PrecYrEnd">
											<xsl:call-template name="PopulateMonthDayYear">
												<xsl:with-param name="TargetNode" select="$FormData/CarrybackDecreaseTaxCmptGrp[$pos + 3]/TaxPeriodEndDt"/>
											</xsl:call-template>
										</span>
									</div>
									<div class="sty1045ColHeader">
										<span class="sty1045OrdinalNum">
											<xsl:call-template name="PopulateMonthDayYear">
												<xsl:with-param name="TargetNode" select="$FormData/CarrybackDecreaseTaxCmptGrp[$pos + 4]/PrecedingYearNum"/>
											</xsl:call-template>
										</span>
						preceding tax year ended: 
						<span class="sty1045PrecYrEnd">
											<xsl:call-template name="PopulateMonthDayYear">
												<xsl:with-param name="TargetNode" select="$FormData/CarrybackDecreaseTaxCmptGrp[$pos + 4]/TaxPeriodEndDt"/>
											</xsl:call-template>
										</span>
									</div>
									<div class="sty1045ColHeaderBelow" style="height:5mm;">
						Before carryback
					</div>
									<div class="sty1045ColHeaderBelow" style="height:5mm;">
						After carryback
					</div>
									<div class="sty1045ColHeaderBelow" style="height:5mm;">
						Before carryback
					</div>
									<div class="sty1045ColHeaderBelow" style="height:5mm;">
						After carryback
					</div>
									<div class="sty1045ColHeaderBelow" style="height:5mm;">
						Before carryback
					</div>
									<div class="sty1045ColHeaderBelow" style="height:5mm;">
						After carryback
					</div>
								</div>
								<!-- Line 10 -->
								<div class="styStdDiv">
									<div class="styLNLeftNumBox" style="width:16mm;">10</div>
									<div class="sty1045AmtBox" style="background-color:lightgrey;">&nbsp;</div>
									<div class="sty1045AmtBox" style="">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/CarrybackDecreaseTaxCmptGrp[$pos + 2]/AfterCarrybackGrp/NOLDeductionCarrybackAmt"/>
										</xsl:call-template>
									</div>
									<div class="sty1045AmtBox" style="background-color:lightgrey;">&nbsp;</div>
									<div class="sty1045AmtBox" style="">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/CarrybackDecreaseTaxCmptGrp[$pos + 3]/AfterCarrybackGrp/NOLDeductionCarrybackAmt"/>
										</xsl:call-template>
									</div>
									<div class="sty1045AmtBox" style="background-color:lightgrey;">&nbsp;</div>
									<div class="sty1045AmtBox" style="">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/CarrybackDecreaseTaxCmptGrp[$pos + 4]/AfterCarrybackGrp/NOLDeductionCarrybackAmt"/>
										</xsl:call-template>
									</div>
								</div>
								<!-- Line 11 -->
								<div class="styStdDiv">
									<div class="styLNLeftNumBox" style="width:16mm;">11</div>
									<div class="sty1045AmtBox">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/CarrybackDecreaseTaxCmptGrp[$pos + 2]/BeforeCarrybackGrp/CommonCarrybackGrp/AdjustedGrossIncomeAmt"/>
										</xsl:call-template>
									</div>
									<div class="sty1045AmtBox">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/CarrybackDecreaseTaxCmptGrp[$pos + 2]/AfterCarrybackGrp/CommonCarrybackGrp/AdjustedGrossIncomeAmt"/>
										</xsl:call-template>
									</div>
									<div class="sty1045AmtBox">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/CarrybackDecreaseTaxCmptGrp[$pos + 3]/BeforeCarrybackGrp/CommonCarrybackGrp/AdjustedGrossIncomeAmt"/>
										</xsl:call-template>
									</div>
									<div class="sty1045AmtBox">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/CarrybackDecreaseTaxCmptGrp[$pos + 3]/AfterCarrybackGrp/CommonCarrybackGrp/AdjustedGrossIncomeAmt"/>
										</xsl:call-template>
									</div>
									<div class="sty1045AmtBox">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/CarrybackDecreaseTaxCmptGrp[$pos + 4]/BeforeCarrybackGrp/CommonCarrybackGrp/AdjustedGrossIncomeAmt"/>
										</xsl:call-template>
									</div>
									<div class="sty1045AmtBox">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/CarrybackDecreaseTaxCmptGrp[$pos + 4]/AfterCarrybackGrp/CommonCarrybackGrp/AdjustedGrossIncomeAmt"/>
										</xsl:call-template>
									</div>
								</div>
								<!-- Line 12 -->
								<div class="styStdDiv">
									<div class="styLNLeftNumBox" style="width:16mm;">12</div>
									<div class="sty1045AmtBox" style="border-bottom-width:2px">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/CarrybackDecreaseTaxCmptGrp[$pos + 2]/BeforeCarrybackGrp/CommonCarrybackGrp/TotalDeductionsAmt"/>
										</xsl:call-template>
									</div>
									<div class="sty1045AmtBox" style="border-bottom-width:2px">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/CarrybackDecreaseTaxCmptGrp[$pos + 2]/AfterCarrybackGrp/CommonCarrybackGrp/TotalDeductionsAmt"/>
										</xsl:call-template>
									</div>
									<div class="sty1045AmtBox" style="border-bottom-width:2px">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/CarrybackDecreaseTaxCmptGrp[$pos + 3]/BeforeCarrybackGrp/CommonCarrybackGrp/TotalDeductionsAmt"/>
										</xsl:call-template>
									</div>
									<div class="sty1045AmtBox" style="border-bottom-width:2px">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/CarrybackDecreaseTaxCmptGrp[$pos + 3]/AfterCarrybackGrp/CommonCarrybackGrp/TotalDeductionsAmt"/>
										</xsl:call-template>
									</div>
									<div class="sty1045AmtBox" style="border-bottom-width:2px">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/CarrybackDecreaseTaxCmptGrp[$pos + 4]/BeforeCarrybackGrp/CommonCarrybackGrp/TotalDeductionsAmt"/>
										</xsl:call-template>
									</div>
									<div class="sty1045AmtBox" style="border-bottom-width:2px">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/CarrybackDecreaseTaxCmptGrp[$pos + 4]/AfterCarrybackGrp/CommonCarrybackGrp/TotalDeductionsAmt"/>
										</xsl:call-template>
									</div>
								</div>
								<!-- Line 13 -->
								<div class="styStdDiv">
									<div class="styLNLeftNumBox" style="width:16mm;">13</div>
									<div class="sty1045AmtBox">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/CarrybackDecreaseTaxCmptGrp[$pos + 2]/BeforeCarrybackGrp/CommonCarrybackGrp/AGILessDeductionsAmt"/>
										</xsl:call-template>
									</div>
									<div class="sty1045AmtBox">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/CarrybackDecreaseTaxCmptGrp[$pos + 2]/AfterCarrybackGrp/CommonCarrybackGrp/AGILessDeductionsAmt"/>
										</xsl:call-template>
									</div>
									<div class="sty1045AmtBox">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/CarrybackDecreaseTaxCmptGrp[$pos + 3]/BeforeCarrybackGrp/CommonCarrybackGrp/AGILessDeductionsAmt"/>
										</xsl:call-template>
									</div>
									<div class="sty1045AmtBox">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/CarrybackDecreaseTaxCmptGrp[$pos + 3]/AfterCarrybackGrp/CommonCarrybackGrp/AGILessDeductionsAmt"/>
										</xsl:call-template>
									</div>
									<div class="sty1045AmtBox">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/CarrybackDecreaseTaxCmptGrp[$pos + 4]/BeforeCarrybackGrp/CommonCarrybackGrp/AGILessDeductionsAmt"/>
										</xsl:call-template>
									</div>
									<div class="sty1045AmtBox">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/CarrybackDecreaseTaxCmptGrp[$pos + 4]/AfterCarrybackGrp/CommonCarrybackGrp/AGILessDeductionsAmt"/>
										</xsl:call-template>
									</div>
								</div>
								<!-- Line 14 -->
								<div class="styStdDiv">
									<div class="styLNLeftNumBox" style="width:16mm;">14</div>
									<div class="sty1045AmtBox" style="border-bottom-width:2px">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/CarrybackDecreaseTaxCmptGrp[$pos + 2]/BeforeCarrybackGrp/CommonCarrybackGrp/ExemptionsAmt"/>
										</xsl:call-template>
									</div>
									<div class="sty1045AmtBox" style="border-bottom-width:2px">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/CarrybackDecreaseTaxCmptGrp[$pos + 2]/AfterCarrybackGrp/CommonCarrybackGrp/ExemptionsAmt"/>
										</xsl:call-template>
									</div>
									<div class="sty1045AmtBox" style="border-bottom-width:2px">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/CarrybackDecreaseTaxCmptGrp[$pos + 3]/BeforeCarrybackGrp/CommonCarrybackGrp/ExemptionsAmt"/>
										</xsl:call-template>
									</div>
									<div class="sty1045AmtBox" style="border-bottom-width:2px">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/CarrybackDecreaseTaxCmptGrp[$pos + 3]/AfterCarrybackGrp/CommonCarrybackGrp/ExemptionsAmt"/>
										</xsl:call-template>
									</div>
									<div class="sty1045AmtBox" style="border-bottom-width:2px">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/CarrybackDecreaseTaxCmptGrp[$pos + 4]/BeforeCarrybackGrp/CommonCarrybackGrp/ExemptionsAmt"/>
										</xsl:call-template>
									</div>
									<div class="sty1045AmtBox" style="border-bottom-width:2px">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/CarrybackDecreaseTaxCmptGrp[$pos + 4]/AfterCarrybackGrp/CommonCarrybackGrp/ExemptionsAmt"/>
										</xsl:call-template>
									</div>
								</div>
								<!-- Line 15 -->
								<div class="styStdDiv">
									<div class="styLNLeftNumBox" style="width:16mm;">15</div>
									<div class="sty1045AmtBox">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/CarrybackDecreaseTaxCmptGrp[$pos + 2]/BeforeCarrybackGrp/CommonCarrybackGrp/TaxableIncomeAmt"/>
										</xsl:call-template>
									</div>
									<div class="sty1045AmtBox">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/CarrybackDecreaseTaxCmptGrp[$pos + 2]/AfterCarrybackGrp/CommonCarrybackGrp/TaxableIncomeAmt"/>
										</xsl:call-template>
									</div>
									<div class="sty1045AmtBox">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/CarrybackDecreaseTaxCmptGrp[$pos + 3]/BeforeCarrybackGrp/CommonCarrybackGrp/TaxableIncomeAmt"/>
										</xsl:call-template>
									</div>
									<div class="sty1045AmtBox">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/CarrybackDecreaseTaxCmptGrp[$pos + 3]/AfterCarrybackGrp/CommonCarrybackGrp/TaxableIncomeAmt"/>
										</xsl:call-template>
									</div>
									<div class="sty1045AmtBox">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/CarrybackDecreaseTaxCmptGrp[$pos + 4]/BeforeCarrybackGrp/CommonCarrybackGrp/TaxableIncomeAmt"/>
										</xsl:call-template>
									</div>
									<div class="sty1045AmtBox">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/CarrybackDecreaseTaxCmptGrp[$pos + 4]/AfterCarrybackGrp/CommonCarrybackGrp/TaxableIncomeAmt"/>
										</xsl:call-template>
									</div>
								</div>
								<!-- Line 16 -->
								<div class="styStdDiv">
									<div class="styLNLeftNumBox" style="width:16mm;">16</div>
									<div class="sty1045AmtBox">
										<xsl:call-template name="SetFormLinkInline">
											<xsl:with-param name="TargetNode" select="$FormData"/>
										</xsl:call-template>
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/CarrybackDecreaseTaxCmptGrp[$pos + 2]/BeforeCarrybackGrp/CommonCarrybackGrp/TaxAmt"/>
										</xsl:call-template>
									</div>
									<div class="sty1045AmtBox">
										<xsl:call-template name="SetFormLinkInline">
											<xsl:with-param name="TargetNode" select="$FormData"/>
										</xsl:call-template>
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/CarrybackDecreaseTaxCmptGrp[$pos + 2]/AfterCarrybackGrp/CommonCarrybackGrp/TaxAmt"/>
										</xsl:call-template>
									</div>
									<div class="sty1045AmtBox">
										<xsl:call-template name="SetFormLinkInline">
											<xsl:with-param name="TargetNode" select="$FormData"/>
										</xsl:call-template>
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/CarrybackDecreaseTaxCmptGrp[$pos + 3]/BeforeCarrybackGrp/CommonCarrybackGrp/TaxAmt"/>
										</xsl:call-template>
									</div>
									<div class="sty1045AmtBox">
										<xsl:call-template name="SetFormLinkInline">
											<xsl:with-param name="TargetNode" select="$FormData"/>
										</xsl:call-template>
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/CarrybackDecreaseTaxCmptGrp[$pos + 3]/AfterCarrybackGrp/CommonCarrybackGrp/TaxAmt"/>
										</xsl:call-template>
									</div>
									<div class="sty1045AmtBox">
										<xsl:call-template name="SetFormLinkInline">
											<xsl:with-param name="TargetNode" select="$FormData"/>
										</xsl:call-template>
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/CarrybackDecreaseTaxCmptGrp[$pos + 4]/BeforeCarrybackGrp/CommonCarrybackGrp/TaxAmt"/>
										</xsl:call-template>
									</div>
									<div class="sty1045AmtBox">
										<xsl:call-template name="SetFormLinkInline">
											<xsl:with-param name="TargetNode" select="$FormData"/>
										</xsl:call-template>
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/CarrybackDecreaseTaxCmptGrp[$pos + 4]/AfterCarrybackGrp/CommonCarrybackGrp/TaxAmt"/>
										</xsl:call-template>
									</div>
								</div>
								<!-- Line 17 -->
								<div class="styStdDiv">
									<div class="styLNLeftNumBox" style="width:16mm;">17</div>
									<div class="sty1045AmtBox">
										<xsl:call-template name="SetFormLinkInline">
											<xsl:with-param name="TargetNode" select="$FormData"/>
										</xsl:call-template>
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/CarrybackDecreaseTaxCmptGrp[$pos + 2]/BeforeCarrybackGrp/CommonCarrybackGrp/PremiumTaxCreditTaxLiabAmt"/>
										</xsl:call-template>
									</div>
									<div class="sty1045AmtBox">
										<xsl:call-template name="SetFormLinkInline">
											<xsl:with-param name="TargetNode" select="$FormData"/>
										</xsl:call-template>
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/CarrybackDecreaseTaxCmptGrp[$pos + 2]/AfterCarrybackGrp/CommonCarrybackGrp/PremiumTaxCreditTaxLiabAmt"/>
										</xsl:call-template>
									</div>
									<div class="sty1045AmtBox">
										<xsl:call-template name="SetFormLinkInline">
											<xsl:with-param name="TargetNode" select="$FormData"/>
										</xsl:call-template>
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/CarrybackDecreaseTaxCmptGrp[$pos + 3]/BeforeCarrybackGrp/CommonCarrybackGrp/PremiumTaxCreditTaxLiabAmt"/>
										</xsl:call-template>
									</div>
									<div class="sty1045AmtBox">
										<xsl:call-template name="SetFormLinkInline">
											<xsl:with-param name="TargetNode" select="$FormData"/>
										</xsl:call-template>
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/CarrybackDecreaseTaxCmptGrp[$pos + 3]/AfterCarrybackGrp/CommonCarrybackGrp/PremiumTaxCreditTaxLiabAmt"/>
										</xsl:call-template>
									</div>
									<div class="sty1045AmtBox">
										<xsl:call-template name="SetFormLinkInline">
											<xsl:with-param name="TargetNode" select="$FormData"/>
										</xsl:call-template>
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/CarrybackDecreaseTaxCmptGrp[$pos + 4]/BeforeCarrybackGrp/CommonCarrybackGrp/PremiumTaxCreditTaxLiabAmt"/>
										</xsl:call-template>
									</div>
									<div class="sty1045AmtBox">
										<xsl:call-template name="SetFormLinkInline">
											<xsl:with-param name="TargetNode" select="$FormData"/>
										</xsl:call-template>
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/CarrybackDecreaseTaxCmptGrp[$pos + 4]/AfterCarrybackGrp/CommonCarrybackGrp/PremiumTaxCreditTaxLiabAmt"/>
										</xsl:call-template>
									</div>
								</div>
								<!-- Line 18 -->
								<div class="styStdDiv">
									<div class="styLNLeftNumBox" style="width:16mm;">18</div>
									<div class="sty1045AmtBox" style="border-bottom-width:2px">
										<xsl:call-template name="SetFormLinkInline">
											<xsl:with-param name="TargetNode" select="$FormData"/>
										</xsl:call-template>
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/CarrybackDecreaseTaxCmptGrp[$pos + 2]/BeforeCarrybackGrp/CommonCarrybackGrp/AlternativeMinimumTaxAmt"/>
										</xsl:call-template>
									</div>
									<div class="sty1045AmtBox" style="border-bottom-width:2px">
										<xsl:call-template name="SetFormLinkInline">
											<xsl:with-param name="TargetNode" select="$FormData"/>
										</xsl:call-template>
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/CarrybackDecreaseTaxCmptGrp[$pos + 2]/AfterCarrybackGrp/CommonCarrybackGrp/AlternativeMinimumTaxAmt"/>
										</xsl:call-template>
									</div>
									<div class="sty1045AmtBox" style="border-bottom-width:2px">
										<xsl:call-template name="SetFormLinkInline">
											<xsl:with-param name="TargetNode" select="$FormData"/>
										</xsl:call-template>
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/CarrybackDecreaseTaxCmptGrp[$pos + 3]/BeforeCarrybackGrp/CommonCarrybackGrp/AlternativeMinimumTaxAmt"/>
										</xsl:call-template>
									</div>
									<div class="sty1045AmtBox" style="border-bottom-width:2px">
										<xsl:call-template name="SetFormLinkInline">
											<xsl:with-param name="TargetNode" select="$FormData"/>
										</xsl:call-template>
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/CarrybackDecreaseTaxCmptGrp[$pos + 3]/AfterCarrybackGrp/CommonCarrybackGrp/AlternativeMinimumTaxAmt"/>
										</xsl:call-template>
									</div>
									<div class="sty1045AmtBox" style="border-bottom-width:2px">
										<xsl:call-template name="SetFormLinkInline">
											<xsl:with-param name="TargetNode" select="$FormData"/>
										</xsl:call-template>
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/CarrybackDecreaseTaxCmptGrp[$pos + 4]/BeforeCarrybackGrp/CommonCarrybackGrp/AlternativeMinimumTaxAmt"/>
										</xsl:call-template>
									</div>
									<div class="sty1045AmtBox" style="border-bottom-width:2px">
										<xsl:call-template name="SetFormLinkInline">
											<xsl:with-param name="TargetNode" select="$FormData"/>
										</xsl:call-template>
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/CarrybackDecreaseTaxCmptGrp[$pos + 4]/AfterCarrybackGrp/CommonCarrybackGrp/AlternativeMinimumTaxAmt"/>
										</xsl:call-template>
									</div>
								</div>
								<!-- Line 19 -->
								<div class="styStdDiv">
									<div class="styLNLeftNumBox" style="width:16mm;">19</div>
									<div class="sty1045AmtBox">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/CarrybackDecreaseTaxCmptGrp[$pos + 2]/BeforeCarrybackGrp/CommonCarrybackGrp/SumTaxesAmt"/>
										</xsl:call-template>
									</div>
									<div class="sty1045AmtBox">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/CarrybackDecreaseTaxCmptGrp[$pos + 2]/AfterCarrybackGrp/CommonCarrybackGrp/SumTaxesAmt"/>
										</xsl:call-template>
									</div>
									<div class="sty1045AmtBox">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/CarrybackDecreaseTaxCmptGrp[$pos + 3]/BeforeCarrybackGrp/CommonCarrybackGrp/SumTaxesAmt"/>
										</xsl:call-template>
									</div>
									<div class="sty1045AmtBox">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/CarrybackDecreaseTaxCmptGrp[$pos + 3]/AfterCarrybackGrp/CommonCarrybackGrp/SumTaxesAmt"/>
										</xsl:call-template>
									</div>
									<div class="sty1045AmtBox">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/CarrybackDecreaseTaxCmptGrp[$pos + 4]/BeforeCarrybackGrp/CommonCarrybackGrp/SumTaxesAmt"/>
										</xsl:call-template>
									</div>
									<div class="sty1045AmtBox">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/CarrybackDecreaseTaxCmptGrp[$pos + 4]/AfterCarrybackGrp/CommonCarrybackGrp/SumTaxesAmt"/>
										</xsl:call-template>
									</div>
								</div>
								<!-- Line 20 -->
								<div class="styStdDiv">
									<div class="styLNLeftNumBox" style="width:16mm;">20</div>
									<div class="sty1045AmtBox">
										<xsl:call-template name="SetFormLinkInline">
											<xsl:with-param name="TargetNode" select="$FormData"/>
										</xsl:call-template>
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/CarrybackDecreaseTaxCmptGrp[$pos+2]/BeforeCarrybackGrp/CommonCarrybackGrp/GeneralBusinessCreditAmt"/>
										</xsl:call-template>
									</div>
									<div class="sty1045AmtBox">
										<xsl:call-template name="SetFormLinkInline">
											<xsl:with-param name="TargetNode" select="$FormData"/>
										</xsl:call-template>
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/CarrybackDecreaseTaxCmptGrp[$pos+2]/AfterCarrybackGrp/CommonCarrybackGrp/GeneralBusinessCreditAmt"/>
										</xsl:call-template>
									</div>
									<div class="sty1045AmtBox">
										<xsl:call-template name="SetFormLinkInline">
											<xsl:with-param name="TargetNode" select="$FormData"/>
										</xsl:call-template>
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/CarrybackDecreaseTaxCmptGrp[$pos+3]/BeforeCarrybackGrp/CommonCarrybackGrp/GeneralBusinessCreditAmt"/>
										</xsl:call-template>
									</div>
									<div class="sty1045AmtBox">
										<xsl:call-template name="SetFormLinkInline">
											<xsl:with-param name="TargetNode" select="$FormData"/>
										</xsl:call-template>
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/CarrybackDecreaseTaxCmptGrp[$pos+3]/AfterCarrybackGrp/CommonCarrybackGrp/GeneralBusinessCreditAmt"/>
										</xsl:call-template>
									</div>
									<div class="sty1045AmtBox">
										<xsl:call-template name="SetFormLinkInline">
											<xsl:with-param name="TargetNode" select="$FormData"/>
										</xsl:call-template>
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/CarrybackDecreaseTaxCmptGrp[$pos+4]/BeforeCarrybackGrp/CommonCarrybackGrp/GeneralBusinessCreditAmt"/>
										</xsl:call-template>
									</div>
									<div class="sty1045AmtBox">
										<xsl:call-template name="SetFormLinkInline">
											<xsl:with-param name="TargetNode" select="$FormData"/>
										</xsl:call-template>
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/CarrybackDecreaseTaxCmptGrp[$pos+4]/AfterCarrybackGrp/CommonCarrybackGrp/GeneralBusinessCreditAmt"/>
										</xsl:call-template>
									</div>
								</div>
								<!-- Line 21 -->
								<div class="styStdDiv">
									<div class="styLNLeftNumBox" style="width:16mm;">21</div>
									<div class="sty1045AmtBox">
										<xsl:call-template name="SetFormLinkInline">
											<xsl:with-param name="TargetNode" select="$FormData"/>
										</xsl:call-template>
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/CarrybackDecreaseTaxCmptGrp[$pos+2]/BeforeCarrybackGrp/CommonCarrybackGrp/NetPTCAndCTCAmt"/>
										</xsl:call-template>
									</div>
									<div class="sty1045AmtBox">
										<xsl:call-template name="SetFormLinkInline">
											<xsl:with-param name="TargetNode" select="$FormData"/>
										</xsl:call-template>
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/CarrybackDecreaseTaxCmptGrp[$pos+2]/AfterCarrybackGrp/CommonCarrybackGrp/NetPTCAndCTCAmt"/>
										</xsl:call-template>
									</div>
									<div class="sty1045AmtBox">
										<xsl:call-template name="SetFormLinkInline">
											<xsl:with-param name="TargetNode" select="$FormData"/>
										</xsl:call-template>
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/CarrybackDecreaseTaxCmptGrp[$pos+3]/BeforeCarrybackGrp/CommonCarrybackGrp/NetPTCAndCTCAmt"/>
										</xsl:call-template>
									</div>
									<div class="sty1045AmtBox">
										<xsl:call-template name="SetFormLinkInline">
											<xsl:with-param name="TargetNode" select="$FormData"/>
										</xsl:call-template>
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/CarrybackDecreaseTaxCmptGrp[$pos+3]/AfterCarrybackGrp/CommonCarrybackGrp/NetPTCAndCTCAmt"/>
										</xsl:call-template>
									</div>
									<div class="sty1045AmtBox">
										<xsl:call-template name="SetFormLinkInline">
											<xsl:with-param name="TargetNode" select="$FormData"/>
										</xsl:call-template>
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/CarrybackDecreaseTaxCmptGrp[$pos+4]/BeforeCarrybackGrp/CommonCarrybackGrp/NetPTCAndCTCAmt"/>
										</xsl:call-template>
									</div>
									<div class="sty1045AmtBox">
										<xsl:call-template name="SetFormLinkInline">
											<xsl:with-param name="TargetNode" select="$FormData"/>
										</xsl:call-template>
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/CarrybackDecreaseTaxCmptGrp[$pos+4]/AfterCarrybackGrp/CommonCarrybackGrp/NetPTCAndCTCAmt"/>
										</xsl:call-template>
									</div>
								</div>
								<!-- Line 22 -->
								<div class="styStdDiv">
									<div class="styLNLeftNumBox" style="width:16mm;">22</div>
									<div class="sty1045AmtBox" style="border-bottom-width:2px">
										<xsl:call-template name="SetFormLinkInline">
											<xsl:with-param name="TargetNode" select="$FormData"/>
										</xsl:call-template>
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/CarrybackDecreaseTaxCmptGrp[$pos+2]/BeforeCarrybackGrp/CommonCarrybackGrp/OtherCreditsAmt"/>
										</xsl:call-template>
									</div>
									<div class="sty1045AmtBox" style="border-bottom-width:2px">
										<xsl:call-template name="SetFormLinkInline">
											<xsl:with-param name="TargetNode" select="$FormData"/>
										</xsl:call-template>
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/CarrybackDecreaseTaxCmptGrp[$pos+2]/AfterCarrybackGrp/CommonCarrybackGrp/OtherCreditsAmt"/>
										</xsl:call-template>
									</div>
									<div class="sty1045AmtBox" style="border-bottom-width:2px">
										<xsl:call-template name="SetFormLinkInline">
											<xsl:with-param name="TargetNode" select="$FormData"/>
										</xsl:call-template>
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/CarrybackDecreaseTaxCmptGrp[$pos+3]/BeforeCarrybackGrp/CommonCarrybackGrp/OtherCreditsAmt"/>
										</xsl:call-template>
									</div>
									<div class="sty1045AmtBox" style="border-bottom-width:2px">
										<xsl:call-template name="SetFormLinkInline">
											<xsl:with-param name="TargetNode" select="$FormData"/>
										</xsl:call-template>
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/CarrybackDecreaseTaxCmptGrp[$pos+3]/AfterCarrybackGrp/CommonCarrybackGrp/OtherCreditsAmt"/>
										</xsl:call-template>
									</div>
									<div class="sty1045AmtBox" style="border-bottom-width:2px">
										<xsl:call-template name="SetFormLinkInline">
											<xsl:with-param name="TargetNode" select="$FormData"/>
										</xsl:call-template>
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/CarrybackDecreaseTaxCmptGrp[$pos+4]/BeforeCarrybackGrp/CommonCarrybackGrp/OtherCreditsAmt"/>
										</xsl:call-template>
									</div>
									<div class="sty1045AmtBox" style="border-bottom-width:2px">
										<xsl:call-template name="SetFormLinkInline">
											<xsl:with-param name="TargetNode" select="$FormData"/>
										</xsl:call-template>
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/CarrybackDecreaseTaxCmptGrp[$pos+4]/AfterCarrybackGrp/CommonCarrybackGrp/OtherCreditsAmt"/>
										</xsl:call-template>
									</div>
								</div>
								<!-- Line 23 -->
								<div class="styStdDiv">
									<div class="styLNLeftNumBox" style="width:16mm;">23</div>
									<div class="sty1045AmtBox" style="border-bottom-width:2px">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/CarrybackDecreaseTaxCmptGrp[$pos+2]/BeforeCarrybackGrp/CommonCarrybackGrp/TotalCreditsAmt"/>
										</xsl:call-template>
									</div>
									<div class="sty1045AmtBox" style="border-bottom-width:2px">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/CarrybackDecreaseTaxCmptGrp[$pos+2]/AfterCarrybackGrp/CommonCarrybackGrp/TotalCreditsAmt"/>
										</xsl:call-template>
									</div>
									<div class="sty1045AmtBox" style="border-bottom-width:2px">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/CarrybackDecreaseTaxCmptGrp[$pos+3]/BeforeCarrybackGrp/CommonCarrybackGrp/TotalCreditsAmt"/>
										</xsl:call-template>
									</div>
									<div class="sty1045AmtBox" style="border-bottom-width:2px">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/CarrybackDecreaseTaxCmptGrp[$pos+3]/AfterCarrybackGrp/CommonCarrybackGrp/TotalCreditsAmt"/>
										</xsl:call-template>
									</div>
									<div class="sty1045AmtBox" style="border-bottom-width:2px">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/CarrybackDecreaseTaxCmptGrp[$pos+4]/BeforeCarrybackGrp/CommonCarrybackGrp/TotalCreditsAmt"/>
										</xsl:call-template>
									</div>
									<div class="sty1045AmtBox" style="border-bottom-width:2px">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/CarrybackDecreaseTaxCmptGrp[$pos+4]/AfterCarrybackGrp/CommonCarrybackGrp/TotalCreditsAmt"/>
										</xsl:call-template>
									</div>
								</div>
								<!-- Line 24 -->
								<div class="styStdDiv">
									<div class="styLNLeftNumBox" style="width:16mm;">24</div>
									<div class="sty1045AmtBox">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/CarrybackDecreaseTaxCmptGrp[$pos+2]/BeforeCarrybackGrp/CommonCarrybackGrp/SumTaxesLessTotalCreditsAmt"/>
										</xsl:call-template>
									</div>
									<div class="sty1045AmtBox">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/CarrybackDecreaseTaxCmptGrp[$pos+2]/AfterCarrybackGrp/CommonCarrybackGrp/SumTaxesLessTotalCreditsAmt"/>
										</xsl:call-template>
									</div>
									<div class="sty1045AmtBox">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/CarrybackDecreaseTaxCmptGrp[$pos+3]/BeforeCarrybackGrp/CommonCarrybackGrp/SumTaxesLessTotalCreditsAmt"/>
										</xsl:call-template>
									</div>
									<div class="sty1045AmtBox">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/CarrybackDecreaseTaxCmptGrp[$pos+3]/AfterCarrybackGrp/CommonCarrybackGrp/SumTaxesLessTotalCreditsAmt"/>
										</xsl:call-template>
									</div>
									<div class="sty1045AmtBox">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/CarrybackDecreaseTaxCmptGrp[$pos+4]/BeforeCarrybackGrp/CommonCarrybackGrp/SumTaxesLessTotalCreditsAmt"/>
										</xsl:call-template>
									</div>
									<div class="sty1045AmtBox">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/CarrybackDecreaseTaxCmptGrp[$pos+4]/AfterCarrybackGrp/CommonCarrybackGrp/SumTaxesLessTotalCreditsAmt"/>
										</xsl:call-template>
									</div>
								</div>
								<!-- Line 25 -->
								<div class="styStdDiv">
									<div class="styLNLeftNumBox" style="width:16mm;">25</div>
									<div class="sty1045AmtBox">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/CarrybackDecreaseTaxCmptGrp[$pos+2]/BeforeCarrybackGrp/CommonCarrybackGrp/SelfEmploymentTaxAmt"/>
										</xsl:call-template>
									</div>
									<div class="sty1045AmtBox">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/CarrybackDecreaseTaxCmptGrp[$pos+2]/AfterCarrybackGrp/CommonCarrybackGrp/SelfEmploymentTaxAmt"/>
										</xsl:call-template>
									</div>
									<div class="sty1045AmtBox">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/CarrybackDecreaseTaxCmptGrp[$pos+3]/BeforeCarrybackGrp/CommonCarrybackGrp/SelfEmploymentTaxAmt"/>
										</xsl:call-template>
									</div>
									<div class="sty1045AmtBox">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/CarrybackDecreaseTaxCmptGrp[$pos+3]/AfterCarrybackGrp/CommonCarrybackGrp/SelfEmploymentTaxAmt"/>
										</xsl:call-template>
									</div>
									<div class="sty1045AmtBox">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/CarrybackDecreaseTaxCmptGrp[$pos+4]/BeforeCarrybackGrp/CommonCarrybackGrp/SelfEmploymentTaxAmt"/>
										</xsl:call-template>
									</div>
									<div class="sty1045AmtBox">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/CarrybackDecreaseTaxCmptGrp[$pos+4]/AfterCarrybackGrp/CommonCarrybackGrp/SelfEmploymentTaxAmt"/>
										</xsl:call-template>
									</div>
								</div>
								<!-- Line 26 -->
								<div class="styStdDiv">
									<div class="styLNLeftNumBox" style="width:16mm;">26</div>
									<div class="sty1045AmtBox">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/CarrybackDecreaseTaxCmptGrp[$pos+2]/BeforeCarrybackGrp/CommonCarrybackGrp/AdditionalMedicareTaxAmt"/>
										</xsl:call-template>
									</div>
									<div class="sty1045AmtBox">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/CarrybackDecreaseTaxCmptGrp[$pos+2]/AfterCarrybackGrp/CommonCarrybackGrp/AdditionalMedicareTaxAmt"/>
										</xsl:call-template>
									</div>
									<div class="sty1045AmtBox">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/CarrybackDecreaseTaxCmptGrp[$pos+3]/BeforeCarrybackGrp/CommonCarrybackGrp/AdditionalMedicareTaxAmt"/>
										</xsl:call-template>
									</div>
									<div class="sty1045AmtBox">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/CarrybackDecreaseTaxCmptGrp[$pos+3]/AfterCarrybackGrp/CommonCarrybackGrp/AdditionalMedicareTaxAmt"/>
										</xsl:call-template>
									</div>
									<div class="sty1045AmtBox">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/CarrybackDecreaseTaxCmptGrp[$pos+4]/BeforeCarrybackGrp/CommonCarrybackGrp/AdditionalMedicareTaxAmt"/>
										</xsl:call-template>
									</div>
									<div class="sty1045AmtBox">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/CarrybackDecreaseTaxCmptGrp[$pos+4]/AfterCarrybackGrp/CommonCarrybackGrp/AdditionalMedicareTaxAmt"/>
										</xsl:call-template>
									</div>
								</div>
								<!-- Line 27 -->
								<div class="styStdDiv">
									<div class="styLNLeftNumBox" style="width:16mm;">27</div>
									<div class="sty1045AmtBox">
										<xsl:call-template name="SetFormLinkInline">
											<xsl:with-param name="TargetNode" select="$FormData"/>
										</xsl:call-template>
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/CarrybackDecreaseTaxCmptGrp[$pos+2]/BeforeCarrybackGrp/CommonCarrybackGrp/NetInvestmentIncomeTaxAmt"/>
										</xsl:call-template>
									</div>
									<div class="sty1045AmtBox">
										<xsl:call-template name="SetFormLinkInline">
											<xsl:with-param name="TargetNode" select="$FormData"/>
										</xsl:call-template>
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/CarrybackDecreaseTaxCmptGrp[$pos+2]/AfterCarrybackGrp/CommonCarrybackGrp/NetInvestmentIncomeTaxAmt"/>
										</xsl:call-template>
									</div>
									<div class="sty1045AmtBox">
										<xsl:call-template name="SetFormLinkInline">
											<xsl:with-param name="TargetNode" select="$FormData"/>
										</xsl:call-template>
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/CarrybackDecreaseTaxCmptGrp[$pos+3]/BeforeCarrybackGrp/CommonCarrybackGrp/NetInvestmentIncomeTaxAmt"/>
										</xsl:call-template>
									</div>
									<div class="sty1045AmtBox">
										<xsl:call-template name="SetFormLinkInline">
											<xsl:with-param name="TargetNode" select="$FormData"/>
										</xsl:call-template>
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/CarrybackDecreaseTaxCmptGrp[$pos+3]/AfterCarrybackGrp/CommonCarrybackGrp/NetInvestmentIncomeTaxAmt"/>
										</xsl:call-template>
									</div>
									<div class="sty1045AmtBox">
										<xsl:call-template name="SetFormLinkInline">
											<xsl:with-param name="TargetNode" select="$FormData"/>
										</xsl:call-template>
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/CarrybackDecreaseTaxCmptGrp[$pos+4]/BeforeCarrybackGrp/CommonCarrybackGrp/NetInvestmentIncomeTaxAmt"/>
										</xsl:call-template>
									</div>
									<div class="sty1045AmtBox">
										<xsl:call-template name="SetFormLinkInline">
											<xsl:with-param name="TargetNode" select="$FormData"/>
										</xsl:call-template>
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/CarrybackDecreaseTaxCmptGrp[$pos+4]/AfterCarrybackGrp/CommonCarrybackGrp/NetInvestmentIncomeTaxAmt"/>
										</xsl:call-template>
									</div>
								</div>
								<!-- Line 28 -->
								<div class="styStdDiv">
									<div class="styLNLeftNumBox" style="width:16mm;">28</div>
									<div class="sty1045AmtBox" style="background-color:lightgrey;">&nbsp;</div>
									<div class="sty1045AmtBox" style="background-color:lightgrey;">&nbsp;</div>
									<div class="sty1045AmtBox" style="background-color:lightgrey;">&nbsp;</div>
									<div class="sty1045AmtBox" style="background-color:lightgrey;">&nbsp;</div>
									<div class="sty1045AmtBox" style="background-color:lightgrey;">&nbsp;</div>
									<div class="sty1045AmtBox" style="background-color:lightgrey;">&nbsp;</div>
								</div>
								<!-- Line 29 -->
								<div class="styStdDiv">
									<div class="styLNLeftNumBox" style="width:16mm;">29</div>
									<div class="sty1045AmtBox" style="border-bottom-width: 2px">
										<xsl:call-template name="SetFormLinkInline">
											<xsl:with-param name="TargetNode" select="$FormData"/>
										</xsl:call-template>
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/CarrybackDecreaseTaxCmptGrp[$pos+2]/BeforeCarrybackGrp/CommonCarrybackGrp/OtherTaxesAmt"/>
										</xsl:call-template>
									</div>
									<div class="sty1045AmtBox" style="border-bottom-width: 2px">
										<xsl:call-template name="SetFormLinkInline">
											<xsl:with-param name="TargetNode" select="$FormData"/>
										</xsl:call-template>
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/CarrybackDecreaseTaxCmptGrp[$pos+2]/AfterCarrybackGrp/CommonCarrybackGrp/OtherTaxesAmt"/>
										</xsl:call-template>
									</div>
									<div class="sty1045AmtBox" style="border-bottom-width: 2px">
										<xsl:call-template name="SetFormLinkInline">
											<xsl:with-param name="TargetNode" select="$FormData"/>
										</xsl:call-template>	
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/CarrybackDecreaseTaxCmptGrp[$pos+3]/BeforeCarrybackGrp/CommonCarrybackGrp/OtherTaxesAmt"/>
										</xsl:call-template>
									</div>
									<div class="sty1045AmtBox" style="border-bottom-width: 2px">
										<xsl:call-template name="SetFormLinkInline">
											<xsl:with-param name="TargetNode" select="$FormData"/>
										</xsl:call-template>
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/CarrybackDecreaseTaxCmptGrp[$pos+3]/AfterCarrybackGrp/CommonCarrybackGrp/OtherTaxesAmt"/>
										</xsl:call-template>
									</div>
									<div class="sty1045AmtBox" style="border-bottom-width: 2px">
										<xsl:call-template name="SetFormLinkInline">
											<xsl:with-param name="TargetNode" select="$FormData"/>
										</xsl:call-template>
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/CarrybackDecreaseTaxCmptGrp[$pos+4]/BeforeCarrybackGrp/CommonCarrybackGrp/OtherTaxesAmt"/>
										</xsl:call-template>
									</div>
									<div class="sty1045AmtBox" style="border-bottom-width: 2px">
										<xsl:call-template name="SetFormLinkInline">
											<xsl:with-param name="TargetNode" select="$FormData"/>
										</xsl:call-template>
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/CarrybackDecreaseTaxCmptGrp[$pos+4]/AfterCarrybackGrp/CommonCarrybackGrp/OtherTaxesAmt"/>
										</xsl:call-template>
									</div>
								</div>
								<!-- Line 30 -->
								<div class="styStdDiv">
									<div class="styLNLeftNumBox" style="width:16mm;">30</div>
									<div class="sty1045AmtBox">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/CarrybackDecreaseTaxCmptGrp[$pos+2]/BeforeCarrybackGrp/CommonCarrybackGrp/TotalTaxAmt"/>
										</xsl:call-template>
									</div>
									<div class="sty1045AmtBox">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/CarrybackDecreaseTaxCmptGrp[$pos+2]/AfterCarrybackGrp/CommonCarrybackGrp/TotalTaxAmt"/>
										</xsl:call-template>
									</div>
									<div class="sty1045AmtBox">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/CarrybackDecreaseTaxCmptGrp[$pos+3]/BeforeCarrybackGrp/CommonCarrybackGrp/TotalTaxAmt"/>
										</xsl:call-template>
									</div>
									<div class="sty1045AmtBox">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/CarrybackDecreaseTaxCmptGrp[$pos+3]/AfterCarrybackGrp/CommonCarrybackGrp/TotalTaxAmt"/>
										</xsl:call-template>
									</div>
									<div class="sty1045AmtBox">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/CarrybackDecreaseTaxCmptGrp[$pos+4]/BeforeCarrybackGrp/CommonCarrybackGrp/TotalTaxAmt"/>
										</xsl:call-template>
									</div>
									<div class="sty1045AmtBox">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/CarrybackDecreaseTaxCmptGrp[$pos+4]/AfterCarrybackGrp/CommonCarrybackGrp/TotalTaxAmt"/>
										</xsl:call-template>
									</div>
								</div>
								<!-- Line 31 -->
								<div class="styStdDiv">
									<div class="styLNLeftNumBox" style="width:16mm;">31</div>
									<div class="sty1045AmtBox" style="height:7mm;padding-top:3mm; border-bottom-width:2px;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/CarrybackDecreaseTaxCmptGrp[$pos+2]/BeforeCarrybackGrp/CommonCarrybackGrp/TotalTaxAmt"/>
										</xsl:call-template>
									</div>
									<div class="sty1045AmtBox" style="background-color:lightgrey;height:7mm; border-bottom-width:2px;">&nbsp;</div>
									<div class="sty1045AmtBox" style="height:7mm;padding-top:3mm; border-bottom-width:2px;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/CarrybackDecreaseTaxCmptGrp[$pos+3]/BeforeCarrybackGrp/CommonCarrybackGrp/TotalTaxAmt"/>
										</xsl:call-template>
									</div>
									<div class="sty1045AmtBox" style="background-color:lightgrey;height:7mm; border-bottom-width:2px;">&nbsp;</div>
									<div class="sty1045AmtBox" style="height:7mm;padding-top:3mm; border-bottom-width:2px;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/CarrybackDecreaseTaxCmptGrp[$pos+4]/BeforeCarrybackGrp/CommonCarrybackGrp/TotalTaxAmt"/>
										</xsl:call-template>
									</div>
									<div class="sty1045AmtBox" style="background-color:lightgrey;height:7mm; border-bottom-width:2px;">&nbsp;</div>
								</div>
								<!-- Line 32 -->
								<div class="styStdDiv">
									<div class="styLNLeftNumBox" style="width:16mm;">32</div>
									<div class="sty1045AmtBox">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/CarrybackDecreaseTaxCmptGrp[$pos+2]/BeforeCarrybackGrp/TaxDecreaseAmt"/>
										</xsl:call-template>
									</div>
									<div class="sty1045AmtBox" style="background-color:lightgrey;">&nbsp;</div>
									<div class="sty1045AmtBox">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/CarrybackDecreaseTaxCmptGrp[$pos+3]/BeforeCarrybackGrp/TaxDecreaseAmt"/>
										</xsl:call-template>
									</div>
									<div class="sty1045AmtBox" style="background-color:lightgrey;">&nbsp;</div>
									<div class="sty1045AmtBox">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/CarrybackDecreaseTaxCmptGrp[$pos+4]/BeforeCarrybackGrp/TaxDecreaseAmt"/>
										</xsl:call-template>
									</div>
									<div class="sty1045AmtBox" style="background-color:lightgrey;">&nbsp;</div>
								</div>
							</xsl:if>
						</xsl:for-each>
						<div class="styStdDiv pageEnd">&nbsp;</div>
						<!-- Additional Data title bar and button -->
						<div class="styLeftOverTitleLine" id="LeftoverData">
							<div class="styLeftOverTitle">
							Additional Data        
						</div>
							<div class="styLeftOverButtonContainer">
								<input class="styLeftoverTableBtn" type="button" TabIndex="-1" value="Return to Form" onclick="javascript:returnToWriteInImage();"/>
							</div>
						</div>
						<!-- Additional Data table -->
						<table class="styLeftOverTbl">
							<xsl:call-template name="PopulateCommonLeftover">
								<xsl:with-param name="TargetNode" select="$FormData"/>
								<xsl:with-param name="DescWidth" select="100"/>
							</xsl:call-template>
							<xsl:call-template name="PopulateLeftoverRow">
								<xsl:with-param name="Desc">Header - Pool Number </xsl:with-param>
								<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/PoolNumberTxt"/>
								<xsl:with-param name="DescWidth" select="100"/>
							</xsl:call-template>
							<xsl:call-template name="PopulateLeftoverRow">
								<xsl:with-param name="Desc">Header - In Care Of Name </xsl:with-param>
								<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/InCareOfNm"/>
								<xsl:with-param name="DescWidth"/>
							</xsl:call-template>
							<xsl:call-template name="PopulateLeftoverRow">
								<xsl:with-param name="Desc">Header - Business Name Control </xsl:with-param>
								<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/BusinessNameControlTxt"/>
								<xsl:with-param name="DescWidth"/>
							</xsl:call-template>
							<xsl:call-template name="PopulateLeftoverRow">
								<xsl:with-param name="Desc">Header - Primary Name Control </xsl:with-param>
								<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/PrimaryNameControlTxt"/>
								<xsl:with-param name="DescWidth"/>
							</xsl:call-template>
							<xsl:call-template name="PopulateLeftoverRow">
								<xsl:with-param name="Desc">Header - Spouse Name Control </xsl:with-param>
								<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/SpouseNameControlTxt"/>
								<xsl:with-param name="DescWidth"/>
							</xsl:call-template>
							<xsl:choose>
								<xsl:when test="$RtnHdrData/Filer/FiduciaryPersonName">
									<xsl:call-template name="PopulateLeftoverRow">
										<xsl:with-param name="Desc">Header - Fiduciary Person Name </xsl:with-param>
										<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/FiduciaryPersonName/PersonFirstNm"/>
										<xsl:with-param name="DescWidth"/>
									</xsl:call-template>
									<xsl:call-template name="PopulateLeftoverRow">
										<xsl:with-param name="Desc">Header - Fiduciary Person Name </xsl:with-param>
										<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/FiduciaryPersonName/PersonLastNm"/>
										<xsl:with-param name="DescWidth"/>
									</xsl:call-template>
									<xsl:call-template name="PopulateLeftoverRow">
										<xsl:with-param name="Desc">Header - Fiduciary Person SSN </xsl:with-param>
										<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/FiduciaryPersonSSN"/>
										<xsl:with-param name="DescWidth"/>
									</xsl:call-template>
								</xsl:when>
								<xsl:otherwise>
									<xsl:call-template name="PopulateLeftoverRow">
										<xsl:with-param name="Desc">Header - Fiduciary Business Name </xsl:with-param>
										<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/FiduciaryBusinessNm"/>
										<xsl:with-param name="DescWidth"/>
									</xsl:call-template>
									<xsl:call-template name="PopulateLeftoverRow">
										<xsl:with-param name="Desc">Header - Fiduciary Business EIN </xsl:with-param>
										<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/FiduciaryBusinessEIN"/>
										<xsl:with-param name="DescWidth"/>
									</xsl:call-template>
								</xsl:otherwise>
							</xsl:choose>
							<xsl:call-template name="PopulateLeftoverRow">
								<xsl:with-param name="Desc">Header - Fiduciary Title </xsl:with-param>
								<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/FiduciaryTitleTxt"/>
								<xsl:with-param name="DescWidth"/>
							</xsl:call-template>
							<xsl:call-template name="PopulateLeftoverRow">
								<xsl:with-param name="Desc">Signature - Fiduciary PIN </xsl:with-param>
								<xsl:with-param name="TargetNode" select="$RtnHdrData/PractitionerPINGrp/FiduciaryPIN"/>
								<xsl:with-param name="DescWidth" select="100"/>
							</xsl:call-template>
							<xsl:call-template name="PopulateLeftoverRow">
								<xsl:with-param name="Desc">Signature - PIN Entered </xsl:with-param>
								<xsl:with-param name="TargetNode" select="$RtnHdrData/PractitionerPINGrp/PINEnteredByCd"/>
								<xsl:with-param name="DescWidth" select="100"/>
							</xsl:call-template>
							<xsl:call-template name="PopulateLeftoverRow">
								<xsl:with-param name="Desc">Signature - OFFICER REPRESENTING FIDUCIARY </xsl:with-param>
								<xsl:with-param name="TargetNode" select="$RtnHdrData/PractitionerPINGrp/FiduciaryRepOfficerNm"/>
								<xsl:with-param name="DescWidth" select="100"/>
							</xsl:call-template>
							<xsl:call-template name="PopulateLeftoverRow">
								<xsl:with-param name="Desc">Signature - Identity Protection PIN </xsl:with-param>
								<xsl:with-param name="TargetNode" select="$RtnHdrData/IdentityProtectionPIN"/>
								<xsl:with-param name="DescWidth"/>
							</xsl:call-template>
							<xsl:call-template name="PopulateLeftoverRow">
								<xsl:with-param name="Desc">Signature - Spouse Protection PIN </xsl:with-param>
								<xsl:with-param name="TargetNode" select="$RtnHdrData/SpouseIdentityProtectionPIN"/>
								<xsl:with-param name="DescWidth"/>
							</xsl:call-template>
							<xsl:call-template name="PopulateLeftoverRow">
								<xsl:with-param name="Desc">Bottom - Email Address </xsl:with-param>
								<xsl:with-param name="TargetNode" select="$RtnHdrData/PaidPreparerInformationGrp/EmailAddressTxt"/>
								<xsl:with-param name="DescWidth"/>
							</xsl:call-template>
						</table>
					</div>
					<!-- Line 4 - Separated table -->
					<xsl:if test="count($FormData/CarrybackTaxYrFilingStatusGrp) &gt; 5">
						<br/>
						<br/>
						<span class="styRepeatingDataTitle">Line 4</span>
						<br/>
						<table class="styDepTbl" cellspacing="0" style="font-size:7pt;">
							<thead class="styTableThead">
								<tr class="styDepTblHdr">
									<th class="styDepTblCell" style="width:37mm;height:6mm;font-weight:normal;">
                                        Tax Year<br/>
									</th>
									<th class="styDepTblCell" style="width:150mm;font-weight:normal;border-right-width:0px;">
                                        Individual Return Filing Status Code<br/>
									</th>
								</tr>
							</thead>
							<tbody>
								<xsl:for-each select="$FormData/CarrybackTaxYrFilingStatusGrp">
									<tr>
										<xsl:attribute name="class">
											<xsl:choose>
												<xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when>
												<xsl:otherwise>styDepTblRow2</xsl:otherwise>
											</xsl:choose>
										</xsl:attribute>
										<td class="styTableCellTextInherit" style="">
											<xsl:call-template name="PopulateYear">
												<xsl:with-param name="TargetNode" select="TaxYr"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellTextInherit" style="border-right-width:0px;">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="IndividualReturnFilingStatusCd"/>
											</xsl:call-template>
										</td>
									</tr>
								</xsl:for-each>
							</tbody>
						</table>
					</xsl:if>
					<!-- Line 5 - Separated table -->
					<xsl:if test="count($FormData/OtherCarrybackSSNTaxYearGrp) &gt; 1">
						<br/>
						<br/>
						<span class="styRepeatingDataTitle">Line 5</span>
						<br/>
						<table class="styDepTbl" cellspacing="0" style="font-size:7pt;">
							<thead class="styTableThead">
								<tr class="styDepTblHdr">
									<th class="styDepTblCell" style="width:37mm;height:6mm;font-weight:normal;">
                                        SSN<br/>
									</th>
									<th class="styDepTblCell" style="width:150mm;font-weight:normal;border-right-width:0px;">
                                        Year<br/>
									</th>
								</tr>
							</thead>
							<tbody>
								<xsl:for-each select="$FormData/OtherCarrybackSSNTaxYearGrp">
									<tr>
										<xsl:attribute name="class">
											<xsl:choose>
												<xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when>
												<xsl:otherwise>styDepTblRow2</xsl:otherwise>
											</xsl:choose>
										</xsl:attribute>
										<td class="styTableCellTextInherit" style="">
											<xsl:call-template name="PopulateSSN">
												<xsl:with-param name="TargetNode" select="SSN"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellTextInherit" style="border-right-width:0px;">
											<xsl:call-template name="PopulateYear">
												<xsl:with-param name="TargetNode" select="TaxYr"/>
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
</xsl:stylesheet>