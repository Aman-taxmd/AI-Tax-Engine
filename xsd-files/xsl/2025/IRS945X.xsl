<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE xsl:stylesheet [
	<!ENTITY nbsp "&#160;"> 
	<!ENTITY bull "&#8226;">
]>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fo="http://www.w3.org/1999/XSL/Format">
	<xsl:include href="PopulateTemplate.xsl"/>
	<xsl:include href="CommonPathRef.xsl"/>
	<xsl:include href="AddHeader.xsl"/>
	<xsl:include href="AddOnTable.xsl"/>
	<xsl:include href="IRS945XStyle.xsl"/>
	<xsl:output method="html" indent="yes"/>
	<xsl:strip-space elements="*"/>
	<!-- Defines the stage of the data, e.g. original or latest -->
	<xsl:param name="FormData" select="$RtnDoc/IRS945X"/>
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
				<!-- No Browser Caching -->
				<meta http-equiv="Pragma" content="no-cache"/>
				<meta http-equiv="Cache-Control" content="no-cache"/>
				<meta http-equiv="Expires" content="0"/>
				<!-- No Proxy Caching -->
				<meta http-equiv="Cache-Control" content="private"/>
				<!-- Define Character Set -->
				<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1"/>
				<meta name="Description" content="IRS Form 945X"/>
				<xsl:call-template name="GlobalStylesForm"/>
				<script language="JavaScript" src="{$ScriptPath}/FormDisplay.js" type="text/javascript"/>
				<xsl:call-template name="InitJS"/>
				<style type="text/css">
					<xsl:if test="not($Print) or $Print=''">
						<xsl:call-template name="IRS945XStyle"/>
						<xsl:call-template name="AddOnStyle"/>
					</xsl:if>
				</style>
			</head>
			<xsl:variable name="Date">
				<xsl:call-template name="PopulateText">
					<xsl:with-param name="TargetNode" select="$RtnHdrData/QuarterEndingDt"/>
				</xsl:call-template>
			</xsl:variable>
			<body class="styBodyClass" style="width:187mm">
				<form name="IRS945X">
					<xsl:call-template name="DocumentHeader"/>
					<!-- BEGIN FORM HEADER -->
					<div class="styBB" style="width:187mm;border-bottom-width:0px;">
						<xsl:call-template name="SetFormLinkInline">
							<xsl:with-param name="TargetNode" select="$FormData"/>
						</xsl:call-template>
						<xsl:call-template name="SetFormLinkInline">
							<xsl:with-param name="TargetNode" select="$RtnDoc/BinaryAttachment"/>
						</xsl:call-template>
						<xsl:call-template name="SetFormLinkInline">
							<xsl:with-param name="TargetNode" select="$RtnDoc/FinalPayrollInformationStatement"/>
						</xsl:call-template>
						<xsl:call-template name="SetFormLinkInline">
							<xsl:with-param name="TargetNode" select="$RtnDoc/GeneralDependencySmall"/>
						</xsl:call-template>
						<xsl:call-template name="SetFormLinkInline">
							<xsl:with-param name="TargetNode" select="$RtnDoc/IRS945A"/>
						</xsl:call-template>
						<xsl:call-template name="SetFormLinkInline">
							<xsl:with-param name="TargetNode" select="$RtnDoc/IRSPayment2"/>
						</xsl:call-template>
						<xsl:call-template name="SetFormLinkInline">
							<xsl:with-param name="TargetNode" select="$RtnDoc/TransferOfBusinessStatement"/>
						</xsl:call-template>
						<br/>
						<div class="styFNBox" style="width:25mm;height:11mm;border:0px;">
							Form <span class="styFormNumber" style="font-size:15pt;">945-X:</span>
							<div class="styFST" style="height:5mm;">
								<span class="styAgency" style="font-weight:normal;font-size:8pt;">(Rev. February 2025)</span>
							</div>
						</div>
						<div class="styFTBox" style="width:162mm;text-align:left;height:11mm;">
							<div class="styMainTitle" style="font-size:12pt;padding-top:1mm;">
								Adjusted Annual Return of Withheld Federal Income Tax or Claim for Refund
							</div>
							<div class="styFST" style="height:5mm;width:162mm;">
								<span class="styAgency" style="font-weight:normal;font-size:8pt;padding-left:25mm;">Department of the Treasury - Internal Revenue Service</span>
								<span style="font-size:7.5pt;padding-left:53mm;font-weight:normal;">OMB No. 1545-0029</span>
							</div>
						</div>
					</div>
					<div class="styIRS945XInfoBox" style="display:block;height:auto;">
						<div style="width:124mm;padding-top:0.5mm;">
							<span style="float:left;padding-top:2mm;">
								<b>Employer identification number (EIN)</b>
							</span>
							<span class="styLNCtrNumBox" style="width:71mm;border-top-width:1px;padding-top:1mm;float:right;height:6mm;">
								<xsl:call-template name="PopulateReturnHeaderFiler">
									<xsl:with-param name="TargetNode">EIN</xsl:with-param>
									<xsl:with-param name="EINChanged">true</xsl:with-param>
								</xsl:call-template>
							</span>
						</div>
						<div style="width:124mm;min-height:13mm;padding-bottom:2mm;padding-top:2mm;">
							<span style="float:left;padding-top:4mm;">
								<b>Name</b>
								<i> (not your trade name)</i>
							</span>
							<span class="styLNCtrNumBox" style="width:86mm;border-top-width:1px;padding-left:1mm;float:right;text-align:left;height:auto;">
								<xsl:call-template name="PopulateReturnHeaderFiler">
									<xsl:with-param name="TargetNode">BusinessNameLine1Txt</xsl:with-param>
								</xsl:call-template>
								<br/>
								<xsl:call-template name="PopulateReturnHeaderFiler">
									<xsl:with-param name="TargetNode">BusinessNameLine2Txt</xsl:with-param>
								</xsl:call-template>
							</span>
						</div>
						<div style="width:124mm;min-height:9mm;padding-bottom:2mm;">
							<span style="float:left;padding-top:4mm;">
								<b>Trade name</b>
								<i> (if any)</i>
							</span>
							<span class="styLNCtrNumBox" style="width:96mm;border-top-width:1px;padding-left:1mm;text-align:left;float:right;height:auto;">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/TradeName/BusinessNameLine1Txt"/>
								</xsl:call-template>
								<br/>
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/TradeName/BusinessNameLine2Txt"/>
								</xsl:call-template>
							</span>
						</div>
						<div style="width:124mm;padding-bottom:0mm;">
							<xsl:choose>
								<xsl:when test="$RtnHdrData/Filer/USAddress">
									<span style="width:14mm;height:15mm;float:left;padding-top:2mm;font-weight:bold;">Address</span>
									<span class="styLNCtrNumBox" style="width:110mm;height:auto;float:right;border-top-width:1px;padding-top:.5mm;padding-left:1mm;text-align:left;">
										<xsl:call-template name="PopulateReturnHeaderFiler">
											<xsl:with-param name="TargetNode">AddressLine1Txt</xsl:with-param>
										</xsl:call-template>
										<br/>
										<xsl:call-template name="PopulateReturnHeaderFiler">
											<xsl:with-param name="TargetNode">AddressLine2Txt</xsl:with-param>
										</xsl:call-template>
									</span>
									<span style="width:108mm;padding-left:1mm;padding-top:1mm;padding-bottom:1mm;">
											Number<span style="width:16mm"/>Street<span style="width:43mm;"/>Suite or room number
										</span>
									<span class="styLNCtrNumBox" style="width:66mm;border-top-width:1px;padding-top:.5mm;height:auto;text-align:left;padding-left:1mm;">
										<xsl:call-template name="PopulateReturnHeaderFiler">
											<xsl:with-param name="TargetNode">CityNm</xsl:with-param>
										</xsl:call-template>
									</span>
									<span class="styLNCtrNumBox" style="width:2.5mm;float:left;border:none"/>
									<span class="styLNCtrNumBox" style="width:13mm;border-top-width:1px;padding-top:1mm;height:6mm;">
										<xsl:call-template name="PopulateReturnHeaderFiler">
											<xsl:with-param name="TargetNode">StateAbbreviationCd</xsl:with-param>
										</xsl:call-template>
									</span>
									<span class="styLNCtrNumBox" style="width:2.5mm;float:left;border:none"/>
									<span class="styLNCtrNumBox" style="width:26mm;border-top-width:1px;padding-top:1mm;height:6mm;">
										<xsl:call-template name="PopulateReturnHeaderFiler">
											<xsl:with-param name="TargetNode">ZIPCd</xsl:with-param>
										</xsl:call-template>
									</span>
									<span style="width:124mm;padding-left:15mm;padding-top:1mm;padding-bottom:1mm;">
										<span style="width:66mm;">City</span>
										<span style="width:13mm;text-align:center;padding-left:2mm;">State</span>
										<span style="width:24mm;text-align:center;padding-left:2mm;">ZIP code</span>
									</span>
									<span style="width:124mm;padding-left:14mm;">
										<span class="styLNCtrNumBox" style="width:49mm;height:6.5mm;border-top-width:1px;padding-top:1mm;text-align:left;padding-left:1mm;word-wrap:break-word;"/>
										<span class="styLNCtrNumBox" style="width:2.5mm;float:left;border:none"/>
										<span class="styLNCtrNumBox" style="width:30mm;border-top-width:1px;padding-top:1mm;height:6.5mm;word-wrap:break-word;"/>
										<span class="styLNCtrNumBox" style="width:2.5mm;float:left;border:none"/>
										<span class="styLNCtrNumBox" style="width:26mm;border-top-width:1px;height:6.5mm;word-wrap:break-word;"/>
									</span>
								</xsl:when>
								<xsl:otherwise>
									<span style="width:14mm;height:15mm;float:left;padding-top:2mm;font-weight:bold;">Address</span>
									<span class="styLNCtrNumBox" style="width:110mm;height:auto;float:right;border-top-width:1px;padding-top:.5mm;padding-left:1mm;text-align:left;">
										<xsl:call-template name="PopulateReturnHeaderFiler">
											<xsl:with-param name="TargetNode">AddressLine1Txt</xsl:with-param>
										</xsl:call-template>
										<br/>
										<xsl:call-template name="PopulateReturnHeaderFiler">
											<xsl:with-param name="TargetNode">AddressLine2Txt</xsl:with-param>
										</xsl:call-template>
									</span>
									<span style="width:108mm;padding-left:1mm;padding-top:1mm;padding-bottom:1mm;">
											Number<span style="width:16mm"/>Street<span style="width:43mm;"/>Suite or room number
										</span>
									<span class="styLNCtrNumBox" style="width:66mm;border-top-width:1px;padding-top:.5mm;height:6mm;text-align:left;padding-left:1mm;">
										<xsl:call-template name="PopulateReturnHeaderFiler">
											<xsl:with-param name="TargetNode">CityNm</xsl:with-param>
										</xsl:call-template>
									</span>
									<span class="styLNCtrNumBox" style="width:2.5mm;float:left;border:none"/>
									<span class="styLNCtrNumBox" style="width:13mm;border-top-width:1px;padding-top:1mm;height:6mm;">
										<xsl:call-template name="PopulateReturnHeaderFiler">
											<xsl:with-param name="TargetNode">StateAbbreviationCd</xsl:with-param>
										</xsl:call-template>
									</span>
									<span class="styLNCtrNumBox" style="width:2.5mm;float:left;border:none"/>
									<span class="styLNCtrNumBox" style="width:26mm;border-top-width:1px;padding-top:1mm;height:6mm;"/>
									<span style="width:124mm;padding-left:15mm;padding-top:1mm;padding-bottom:1mm;">
										<span style="width:66mm;">City</span>
										<span style="width:13mm;text-align:center;padding-left:2mm;">State</span>
										<span style="width:24mm;text-align:center;padding-left:2mm;">ZIP code</span>
									</span>
									<span style="width:124mm;padding-left:14mm;">
										<span class="styLNCtrNumBox" style="width:49mm;height:6.5mm;border-top-width:1px;padding-top:1mm;text-align:left;padding-left:1mm;word-wrap:break-word;">
											<xsl:call-template name="PopulateReturnHeaderFiler">
												<xsl:with-param name="TargetNode">CountryCd</xsl:with-param>
											</xsl:call-template>
										</span>
										<span class="styLNCtrNumBox" style="width:2.5mm;float:left;border:none"/>
										<span class="styLNCtrNumBox" style="width:30mm;border-top-width:1px;padding-top:1mm;height:6.5mm;word-wrap:break-word;">
											<xsl:call-template name="PopulateReturnHeaderFiler">
												<xsl:with-param name="TargetNode">ProvinceOrStateNm</xsl:with-param>
											</xsl:call-template>
										</span>
										<span class="styLNCtrNumBox" style="width:2.5mm;float:left;border:none"/>
										<span class="styLNCtrNumBox" style="width:26mm;border-top-width:1px;height:6.5mm;word-wrap:break-word;">
											<xsl:call-template name="PopulateReturnHeaderFiler">
												<xsl:with-param name="TargetNode">ForeignPostalCd</xsl:with-param>
											</xsl:call-template>
										</span>
									</span>
								</xsl:otherwise>
							</xsl:choose>
							<span style="width:124mm;padding-left:14mm;padding-top:1mm;padding-bottom:1mm;">
								<span style="width:51mm;padding-left:1mm;">Foreign country name</span>
								<span style="width:31mm;text-align:center;">Foreign province/county</span>
								<span style="width:27mm;text-align:center;float:right;">Foreign postal code</span>
							</span>
						</div>
					</div>
					<div style="width:56mm;float:right;padding-right:2mm;height:69mm;">
						<div class="styBB" style="width:55mm;height:27mm;border-left-width:1px;border-right-width:1px;border-top-width:1px;padding-left:1mm;padding-top:2mm;margin-bottom:5mm;">
							<div class="styPartName" style="width:52.5mm;height:5mm;padding-left:0.5mm;padding-top:0.5mm;padding-bottom:0.4mm;font-size:8pt;text-align:left">Return You're Correcting ...<br/>
							</div>
							<div style="width:52mm;padding-top:1mm;padding-bottom:1mm;float:none;clear:both;margin-top:1mm;">
								<b>Enter the calendar year of the return you're correcting:</b>
							</div>
							<span class="styLNCtrNumBox" style="width:20mm;border-top-width:1px;height:5mm;margin-top:1mm;">
								<xsl:call-template name="PopulateYear">
									<xsl:with-param name="TargetNode" select="$FormData/CorrectingReturnCalendarYrCd"/>
								</xsl:call-template>
							</span>
							<span style="padding-left:2mm;padding-top:1mm;">(YYYY)</span>
						</div>
						<br/>
						<br/>
						<br/>
						<div class="styBB" style="width:55mm;height:23mm;border-left-width:1px;border-right-width:1px;border-top-width:1px;padding-left:1mm;padding-top:2mm;">
							<div class="styPartName" style="width:52.5mm;height:5mm;padding-left:0.5mm;padding-top:0.5mm;padding-bottom:2mm;font-size:7pt;text-align:left">Enter the date you discovered errors:<br/>
							</div>
							<div class="styLNCtrNumBox" style="width:24mm;border-top-width:1px;height:5mm;margin-top:2mm;text-align:center;">
								<xsl:call-template name="PopulateMonthDayYear">
									<xsl:with-param name="TargetNode" select="$FormData/ErrorsDiscoveredDt"/>
								</xsl:call-template>
							</div>
							<div style="width:50mm;padding-top:1mm;padding-bottom:1mm;padding-left:1mm;float:none;clear:both;">
									(MM / DD / YYYY)
								</div>
						</div>
					</div>
					<div class="styLNDesc" style="width:187mm;height:10mm;">
					Read the separate instructions before you complete this form. Use this form to correct administrative errors made on Form 945, Annual Return of Withheld Federal Income Tax. Use a separate Form 945-X for each year that needs correction. Type or print within the boxes. You MUST complete both pages. Don't attach this form to Form 945.
					</div>
					<!-- Part 1 - Process Type -->
					<div class="styBB" style="width:187mm;border-top-width:1px;">
						<div class="styPartName" style="width:13mm;text-align:center;height:4mm;padding-top:0mm;">Part 1:</div>
						<div class="styPartDesc" style="width:173.9mm;text-align:left;height:4mm;padding-top:0.1mm;padding-left:2mm;">Select ONLY one process.</div>
					</div>
					<div style="width:187mm;padding-left:0mm;padding-top:2mm;padding-bottom:0px;">
						<!--Line 1-->
						<div style="width:187mm;">
							<span style="float:left;padding-left:2mm;">
								<input type="Checkbox" class="styCkboxNM" aria-label="Adj Ret Wthld Fed Incm Tx Ind">
									<xsl:call-template name="PopulateCheckbox">
										<xsl:with-param name="TargetNode" select="$FormData/AdjRetWthldFedIncmTxInd"/>
										<xsl:with-param name="BackupName">AdjustedReturnWithheldFedIncomeTaxInd</xsl:with-param>
									</xsl:call-template>
								</input>
							</span>
							<span>
								<div class="styLNLeftNumBoxSD" style="width:8mm;">1.</div>
								<div class="styLNDesc" style="padding-left:1mm;height:auto;width:174mm;">
									<b>Adjusted return of withheld federal income tax.</b> Check this box if you underreported amounts. Also check this box if you overreported amounts and you would like to use the adjustment process to correct the errors. You must check this box if you're correcting both underreported and overreported amounts on this form. The amount shown on line 5, if less than zero, may only be applied as a credit to your Form 945 for the tax period in which you're filing this form.
								</div>
							</span>
						</div>
						<!--Line 2-->
						<div style="width:187mm;height:8mm;">
							<span style="float:left;padding-left:2mm;">
								<input type="Checkbox" class="styCkboxNM" aria-label="Claim">
									<xsl:call-template name="PopulateCheckbox">
										<xsl:with-param name="TargetNode" select="$FormData/ClaimInd"/>
										<xsl:with-param name="BackupName">ClaimInd</xsl:with-param>
									</xsl:call-template>
								</input>
							</span>
							<span>
								<div class="styLNLeftNumBoxSD" style="width:8mm;">2.</div>
								<div class="styLNDesc" style="padding-left:1mm;height:auto;width:174mm;">
									<b>Claim.</b> Check this box if you overreported amounts only and you would like to use the claim process to ask for a refund or abatement of the amount shown on line 5. Don't check this box if you're correcting ANY underreported amounts on this form.
								</div>
							</span>
						</div>
					</div>
					<!-- Part 2 - Corrections Column 1 -->
					<div class="styBB" style="width:187mm;border-top-width:1px;">
						<div class="styPartName" style="width:13mm;text-align:center;height:4mm;padding-top:0mm;">Part 2:</div>
						<div class="styPartDesc" style="width:173.9mm;text-align:left;height:4mm;padding-top:0.1mm;padding-left:2mm;">Enter the corrections for the calendar year you're correcting. If any line doesn't apply, leave it blank.</div>
					</div>
					<div>
						<!--Line 5 Header-->
						<div style="width:187mm;padding-top:2mm;">
							<span style="width:60mm;"/>
							<span style="width:34mm;text-align:center;font-style:italic;">Column 1</span>
							<span style="width:10mm;"/>
							<span style="width:35mm;text-align:center;font-style:italic;">Column 2</span>
							<span style="width:10mm;"/>
							<span style="width:35mm;text-align:center;font-style:italic;">Column 3</span>
						</div>
						<div style="width:187mm;padding-top:2mm;">
							<span style="width:60mm;"/>
							<span style="width:34mm;text-align:center;font-weight:bold;font-style:italic;">Total corrected amount (for ALL payees)</span>
							<span style="width:10mm;text-align:center;">-</span>
							<span style="width:35mm;text-align:center;font-weight:bold;font-style:italic;">Amount originally reported or as previously corrected (for ALL payees)</span>
							<span style="width:10mm;text-align:center;">=</span>
							<span style="width:35mm;text-align:center;font-weight:bold;font-style:italic;">Difference (If this amount is a negative number, use a minus sign.)</span>
						</div>
						<!--Line 3-->
						<div style="width:187mm;padding-top:3mm;padding-left:5mm;">
							<div class="styLNLeftNumBoxSD" style="width:8mm;">3.</div>
							<div class="styLNDesc" style="width:47mm;padding-left:1mm;">
								<b>Federal income tax withheld</b>
								<br/> (Form 945, line 1)
								<!--Dotted Line-->
								<!--<span class="styDotLn" style="float:right;padding-right:1mm;">.....</span>-->
							</div>
							<div class="styLNCtrNumBox" style="width:34mm;border-top-width:1px;height:6mm;text-align:right;padding-right:1mm;padding-top:1mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/TotalCorrectedAmount945XGrp/FederalIncomeTaxWithheldAmt"/>
								</xsl:call-template>
							</div>
							<div class="styLNDesc" style="width:10mm;text-align:center;padding-top:1mm;">-</div>
							<div class="styLNCtrNumBox" style="width:35mm;border-top-width:1px;height:6mm;text-align:right;padding-right:1mm;padding-top:1mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/OriginallyRptOrPrevCorr945XGrp/FederalIncomeTaxWithheldAmt"/>
								</xsl:call-template>
							</div>
							<div class="styLNDesc" style="width:10mm;text-align:center;padding-top:1mm;">=</div>
							<div class="styLNCtrNumBox" style="width:35mm;border-top-width:1px;height:6mm;text-align:right;padding-top:1mm;padding-right:1mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/CorrRptDifference945XGrp/FederalIncomeTaxWithheldAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<!--Line 4-->
						<div style="width:187mm;padding-top:3mm;padding-left:5mm;">
							<div class="styLNLeftNumBoxSD" style="width:8mm;">4.</div>
							<div class="styLNDesc" style="width:47mm;padding-left:1mm;">
								<b>Backup withholding</b>
								<br/> (Form 945, line 2)
								<!--Dotted Line-->
								<!--<span class="styDotLn" style="float:right;padding-right:1mm;">.....</span>-->
							</div>
							<div class="styLNCtrNumBox" style="width:34mm;border-top-width:1px;height:6mm;text-align:right;padding-top:1mm;padding-right:1mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/TotalCorrectedAmount945XGrp/BackupWithholdingAmt"/>
								</xsl:call-template>
							</div>
							<div class="styLNDesc" style="width:10mm;text-align:center;padding-top:2mm;">-</div>
							<div class="styLNCtrNumBox" style="width:35mm;border-top-width:1px;height:6mm;text-align:right;padding-top:1mm;padding-right:1mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/OriginallyRptOrPrevCorr945XGrp/BackupWithholdingAmt"/>
								</xsl:call-template>
							</div>
							<div class="styLNDesc" style="width:10mm;text-align:center;padding-top:1mm;">=</div>
							<div class="styLNCtrNumBox" style="width:35mm;border-top-width:1px;height:6mm;text-align:right;padding-top:1mm;padding-right:1mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/CorrRptDifference945XGrp/BackupWithholdingAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<!--Line 5-->
						<div style="width:187mm;height:auto;padding-top:3mm;padding-left:5mm;padding-bottom:1mm;">
							<div class="styLNLeftNumBoxSD" style="width:8mm;padding-top:2mm;">5.</div>
							<div class="styLNDesc" style="width:136mm;padding-left:1mm;padding-top:2mm;">
								<b>Total.</b> Combine the amounts on lines 3 and 4 of Column 3
								<!--Dotted Line-->
								<span class="styDotLn" style="float:right;">...............</span>
							</div>
							<div class="styLNCtrNumBox" style="width:35mm;border-top-width:1px;height:6mm;text-align:right;padding-top:1mm;padding-right:1mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/CorrRptDifference945XGrp/TotalAmt"/>
								</xsl:call-template>
							</div>
							<span style="padding-left:9mm;padding-top:1mm;">
								<b>If line 5 is less than zero:</b>
								<br/>
								<br/>
								&bull; If you checked line 1, this is the amount you want applied as a credit to your Form 945 for the tax period in which you're filing this<br/>
								<span style="padding-left:2mm;"> form.</span>
								<br/>
								<br/>
								&bull; If you checked line 2, this is the amount you want refunded or abated.<br/>
								<br/>
								<b>If line 5 is more than zero, this is the amount you owe.</b> Pay this amount when you file this return. For information on how to pay, see <i>Amount you owe</i> in the instructions for line 5.
							</span>
						</div>
					</div>
					<!-- Page boundary -->
					<div class="pageEnd" style="width:187mm;border-top-width:1px;">
						<span style="float:left;clear:none;font-weight:bold;padding-top:0.5mm;">For Paperwork Reduction Act Notice, see the separate instructions.</span>
						<span style="float:left;clear:none;margin-left:3mm;font-style:italic;padding-top:0.5mm;">www.irs.gov/Form945X</span>
						<span style="float:left;clear:none;margin-left:3mm;padding-top:0.5mm;">Cat. No. 20336X</span>
						<span style="float:right;clear:none;">Form <span class="styBoldText" style="font-size:8pt;">945-X</span> (Rev. 2-2025)</span>
					</div>
					<p style="page-break-before: always"/>
					<!--Begin Page 2-->
					<!--Name Shown on return-->
					<div class="styBB" style="width:187mm;font-size:7pt;border-top-width:2px;height:auto;">
						<div class="styFNBox" style="width:103mm;">
							<b>Name</b>
							<i> (not your trade name)</i>
							<br/>
							<xsl:call-template name="PopulateReturnHeaderFiler">
								<xsl:with-param name="TargetNode">BusinessNameLine1Txt</xsl:with-param>
							</xsl:call-template>
							<br/>
							<xsl:call-template name="PopulateReturnHeaderFiler">
								<xsl:with-param name="TargetNode">BusinessNameLine2Txt</xsl:with-param>
							</xsl:call-template>
						</div>
						<span class="styFNBox" style="padding-left:.5mm;width:54mm;">
							<b>Employer identification number (EIN)</b>
							<br/>
							<br/>
							<div style="padding-left:.5mm;width:54mm;text-align:center;">
								<xsl:call-template name="PopulateReturnHeaderFiler">
									<xsl:with-param name="TargetNode">EIN</xsl:with-param>
									<xsl:with-param name="EINChanged">true</xsl:with-param>
								</xsl:call-template>
							</div>
						</span>
						<span class="styFNBox" style="padding-left:.5mm;width:30mm;border-right-width:0;">
							<b>Correcting Calendar Year</b> (YYYY)
							<br/>
							<div style="padding-left:.5mm;">
								<xsl:call-template name="PopulateReturnHeaderFiler">
									<xsl:with-param name="TargetNode">Year</xsl:with-param>
								</xsl:call-template>
							</div>
						</span>
					</div>
					<!--Part 3 - Explain your corrections for the calendar year you are correcting. -->
					<div class="styBB" style="width:187mm;border-top-width:1px;">
						<div class="styPartName" style="width:13mm;text-align:center;height:4mm;padding-top:0mm;">Part 3:</div>
						<div class="styPartDesc" style="width:173.9mm;text-align:left;height:4mm;padding-top:0mm;padding-left:2mm;font-weight:normal">
							<b>Explain your corrections for the calendar year you're correcting.</b>
						</div>
					</div>
					<div class="styStdDiv">
						<!--Line 6-->
						<div style="width:187mm;padding-top:0.5mm;">
							<span style="float:left;padding-left:2mm;">
								<input type="Checkbox" class="styCkboxNM" aria-label="Underreported and Overreported Indicator">
									<xsl:call-template name="PopulateCheckbox">
										<xsl:with-param name="TargetNode" select="$FormData/CorrUndrptOverreportedAmtInd"/>
										<xsl:with-param name="BackupName">UnderreportedOverreportedIndicator</xsl:with-param>
									</xsl:call-template>
								</input>
							</span>
							<span>
								<div class="styLNLeftNumBoxSD" style="width:8mm;">6.</div>
								<div class="styLNDesc" style="padding-left:1mm;height:auto;width:174mm;">
									<b>Check here if any corrections you entered on a line include both underreported and overreported amounts.</b>
									<br/> Explain both your underreported and overreported amounts on line 7.
									</div>
							</span>
						</div>
					</div>
					<!--Line 7-->
					<div class="styStdDiv">
						<div class="styLNLeftNumBox" style="width:5mm;">&nbsp;</div>
						<div class="styLNLeftNumBoxSD" style="width:8mm;">7.</div>
						<div class="styLNDesc" style="width:169mm;height:auto;">
							<strong>You must give us a detailed explanation of how you determined your corrections. </strong> 
							See the instructions.
						</div>
					</div>
					<div class="styStdDiv" style="margin-bottom:2mm;">
						<div class="" style="width:173mm;margin-left:7mm;border:1px solid black;min-height:100mm;padding:1mm;line-height:1.3;display:block;">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/CorrectionsExplanationTxt"/>
							</xsl:call-template>
						</div>
					</div>
					<!--Part 4 - Signature -->
					<div class="styBB" style="width:187mm;border-top-width:1px;">
						<div class="styPartName" style="width:13mm;text-align:center;height:4mm;padding-top:0mm;">Part 4:</div>
						<div class="styPartDesc" style="width:173.9mm;text-align:left;height:4mm;padding-top:0mm;padding-left:2mm;">Sign here. You must complete both pages of this form and sign it.</div>
					</div>
					<div class="styLNDesc" style="width:187mm;height:10mm;padding-left:2mm;">
						Under penalties of perjury, I declare that I have filed an original Form 945 and that I have examined this adjusted return or claim, including accompanying schedules and statements, and to the best of my knowledge and belief, it is true, correct, and complete. Declaration of preparer (other than taxpayer) is based on all information of which preparer has any knowledge.
					</div>
					<div style="width:187mm;float:none;clear:both;padding-top:2mm;">
						<div style="width:13mm;float:left;padding-bottom:0px;height:10mm;">
						</div>
						<div style="width:22mm;font-weight:bold;font-size:10pt;float:left;padding-top:3mm;">Sign your name here </div>
						<div class="styLNCtrNumBox" style="width:74mm;height:17mm;border-top-width:1px;float:left;word-wrap:break-word;padding-top:1mm;text-align:left;padding-left:1mm;padding-right:1mm;"/>
						<div style="width:78mm;float:left;font-size:8pt;padding-left:3mm;padding-top:0mm;padding-right:2mm;">
							<div style="width:18mm;height:8mm;float:left;padding-top:0mm;">Print your name here</div>
							<div style="height:9mm;float:right;">
								<div class="styLNCtrNumBox" style="width:50mm;border-top-width:1px;height:8mm;float:right;text-align:left;padding-left:1mm;">
									<xsl:if test="$RtnHdrData/SignatureDocumentGrp/PersonNm">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$RtnHdrData/SignatureDocumentGrp/PersonNm"/>
										</xsl:call-template>
									</xsl:if>
									<xsl:if test="$RtnHdrData/PractitionerPINGrp/TaxpayerNm">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$RtnHdrData/PractitionerPINGrp/TaxpayerNm"/>
										</xsl:call-template>
									</xsl:if>
								</div>
							</div>
							<div style="width:15mm;float:left;padding-top:1mm;">Print your title here</div>
							<div style="float:right;">
								<div class="styLNCtrNumBox" style="width:50mm;border-top-width:1px;height:8mm;padding-top:1mm;padding-left:1mm;float:right;text-align:left;">
									<xsl:if test="$RtnHdrData/SignatureDocumentGrp/PartnershipAuthorizationCd">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$RtnHdrData/SignatureDocumentGrp/PartnershipAuthorizationCd"/>
										</xsl:call-template>
									</xsl:if>
									<xsl:if test="$RtnHdrData/SignatureDocumentGrp/CorporationAuthorizationCd">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$RtnHdrData/SignatureDocumentGrp/CorporationAuthorizationCd"/>
										</xsl:call-template>
									</xsl:if>
									<xsl:if test="$RtnHdrData/SignatureDocumentGrp/ExemptOrgAuthorizationCd">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$RtnHdrData/SignatureDocumentGrp/ExemptOrgAuthorizationCd"/>
										</xsl:call-template>
									</xsl:if>
									<xsl:if test="$RtnHdrData/SignatureDocumentGrp/EstateAuthorizationCd">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$RtnHdrData/SignatureDocumentGrp/EstateAuthorizationCd"/>
										</xsl:call-template>
									</xsl:if>
									<xsl:if test="$RtnHdrData/SignatureDocumentGrp/IndividualAuthorizationCd">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$RtnHdrData/SignatureDocumentGrp/IndividualAuthorizationCd"/>
										</xsl:call-template>
									</xsl:if>
									<xsl:if test="$RtnHdrData/PractitionerPINGrp/Title">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$RtnHdrData/PractitionerPINGrp/Title"/>
										</xsl:call-template>
									</xsl:if>
								</div>
							</div>
						</div>
					</div>
					<div class="styBB" style="width:187mm;padding-bottom:2mm;padding-top:3mm;">
						<div class="styLNDesc" style="height:5mm;width:35mm;text-align:right;padding-right:3mm;">
							Date
						</div>
						<div class="styLNCtrNumBox" style="width:40mm;border-top-width:1px;height:7mm;">
							<xsl:if test="$RtnHdrData/SignatureDocumentGrp/SignatureDt">
								<xsl:call-template name="PopulateMonth">
									<xsl:with-param name="TargetNode" select="$RtnHdrData/SignatureDocumentGrp/SignatureDt"/>
								</xsl:call-template>/<xsl:call-template name="PopulateDay">
									<xsl:with-param name="TargetNode" select="$RtnHdrData/SignatureDocumentGrp/SignatureDt"/>
								</xsl:call-template>/<xsl:call-template name="PopulateYear">
									<xsl:with-param name="TargetNode" select="$RtnHdrData/SignatureDocumentGrp/SignatureDt"/>
								</xsl:call-template>
							</xsl:if>
							<xsl:if test="$RtnHdrData/PractitionerPINGrp/TaxpayerSignatureDt">
								<xsl:call-template name="PopulateMonth">
									<xsl:with-param name="TargetNode" select="$RtnHdrData/PractitionerPINGrp/TaxpayerSignatureDt"/>
								</xsl:call-template>/<xsl:call-template name="PopulateDay">
									<xsl:with-param name="TargetNode" select="$RtnHdrData/PractitionerPINGrp/TaxpayerSignatureDt"/>
								</xsl:call-template>/<xsl:call-template name="PopulateYear">
									<xsl:with-param name="TargetNode" select="$RtnHdrData/PractitionerPINGrp/TaxpayerSignatureDt"/>
								</xsl:call-template>
							</xsl:if>
						</div>
						<div class="styLNDesc" style="width:67mm;padding-left:37mm;">
							Best daytime phone
						</div>
						<div class="styLNCtrNumBox" style="width:43mm;border-top-width:1px;height:7mm;word-wrap:break-word;">
							<xsl:if test="$RtnHdrData/SignatureDocumentGrp/DaytimePhoneNum">
								<xsl:call-template name="PopulatePhoneNumber">
									<xsl:with-param name="TargetNode" select="$RtnHdrData/SignatureDocumentGrp/DaytimePhoneNum"/>
								</xsl:call-template>
							</xsl:if>
							<xsl:if test="$RtnHdrData/SignatureDocumentGrp/DaytimeForeignPhoneNum">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$RtnHdrData/SignatureDocumentGrp/DaytimeForeignPhoneNum"/>
								</xsl:call-template>
							</xsl:if>
						</div>
					</div>
					<div style="width:187mm;padding-bottom:2mm;">
						<div class="styLNDesc" style="width:48mm;font-size:10pt;font-weight:bold;float:left;padding-left:2mm;height:6mm;">
							Paid Preparer Use Only
						</div>
						<div class="styLNDesc" style="height:7mm;width:75mm;float:right;padding-top:2mm;">
							<span style="padding-top:1mm;">Check if you're self-employed</span>
							<div style="width:5mm;float:right;">
								<input type="checkbox" aria-label="SelfEmployed" class="styCkbox">
									<xsl:call-template name="PopulateCheckbox">
										<xsl:with-param name="TargetNode" select="$RtnHdrData/PaidPreparerInformationGrp/SelfEmployedInd"/>
										<xsl:with-param name="BackupName">945XSelfEmployedInd</xsl:with-param>
									</xsl:call-template>
								</input>
							</div>
							<span class="styDotLn" style="float:right;padding-top:1mm;">.......</span>
						</div>
					</div>
					<div style="width:187mm;padding-bottom:2mm;">
						<div class="styLNDesc" style="width:32mm;padding-left:2mm;padding-right:1mm;">Preparer's name </div>
						<div class="styLNCtrNumBox" style="width:94mm;border-top-width:1px;height:5mm;text-align:left;padding-left:1mm;">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$RtnHdrData/PaidPreparerInformationGrp/PreparerPersonNm"/>
							</xsl:call-template>
						</div>
						<div class="styLNDesc" style="width:21mm;padding-left:7mm;">PTIN </div>
						<div class="styLNCtrNumBox" style="width:38mm;border-top-width:1px;height:5mm;">
							<xsl:choose>
								<xsl:when test="$RtnHdrData/PaidPreparerInformationGrp/PTIN">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$RtnHdrData/PaidPreparerInformationGrp/PTIN"/>
									</xsl:call-template>
								</xsl:when>
								<xsl:otherwise>
									<xsl:call-template name="PopulateSSN">
										<xsl:with-param name="TargetNode" select="$RtnHdrData/PaidPreparerInformationGrp/PreparerSSN"/>
									</xsl:call-template>
								</xsl:otherwise>
							</xsl:choose>
						</div>
					</div>
					<div style="width:187mm;padding-bottom:2mm;">
						<div class="styLNDesc" style="width:32mm;padding-left:2mm;padding-right:1mm;">Preparer's signature </div>
						<div class="styLNCtrNumBox" style="width:94mm;border-top-width:1px;height:5mm;word-wrap:break-word;text-align:left;padding-right:1mm;padding-left:1mm;"/>
						<div class="styLNDesc" style="width:21mm;padding-left:7mm;">Date </div>
						<div class="styLNCtrNumBox" style="width:30mm;border-top-width:1px;height:5mm;">
							<xsl:call-template name="PopulateMonth">
								<xsl:with-param name="TargetNode" select="$RtnHdrData/PaidPreparerInformationGrp/SignatureDt"/>
							</xsl:call-template>/<xsl:call-template name="PopulateDay">
								<xsl:with-param name="TargetNode" select="$RtnHdrData/PaidPreparerInformationGrp/SignatureDt"/>
							</xsl:call-template>/<xsl:call-template name="PopulateYear">
								<xsl:with-param name="TargetNode" select="$RtnHdrData/PaidPreparerInformationGrp/SignatureDt"/>
							</xsl:call-template>
						</div>
					</div>
					<div style="width:187mm;padding-bottom:2mm;">
						<div class="styLNDesc" style="width:32mm;padding-left:2mm;padding-right:1mm;padding-top:0mm;padding-bottom:0mm;">
							Firm's name (or yours if self-employed)
						</div>
						<div class="styLNCtrNumBox" style="width:94mm;border-top-width:1px;height:auto;text-align:left;padding-left:1mm;">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$RtnHdrData/PaidPreparerInformationGrp/PreparerFirmName/BusinessNameLine1Txt"/>
							</xsl:call-template>
							<br/>
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$RtnHdrData/PaidPreparerInformationGrp/PreparerFirmName/BusinessNameLine2Txt"/>
							</xsl:call-template>
						</div>
						<div class="styLNDesc" style="width:21mm;padding-left:7mm;">EIN </div>
						<div class="styLNCtrNumBox" style="width:38mm;border-top-width:1px;height:8mm;">
							<xsl:if test="$RtnHdrData/PaidPreparerInformationGrp/PreparerFirmEIN">
								<xsl:call-template name="PopulateEIN">
									<xsl:with-param name="TargetNode" select="$RtnHdrData/PaidPreparerInformationGrp/PreparerFirmEIN"/>
								</xsl:call-template>
							</xsl:if>
							<xsl:if test="$RtnHdrData/PaidPreparerInformationGrp/MissingEINReasonCd">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$RtnHdrData/PaidPreparerInformationGrp/MissingEINReasonCd"/>
								</xsl:call-template>
							</xsl:if>
						</div>
					</div>
					<div style="width:187mm;padding-bottom:2mm;">
						<div class="styLNDesc" style="width:32mm;padding-left:2mm;padding-right:1mm;">Address </div>
						<div class="styLNCtrNumBox" style="width:94mm;border-top-width:1px;height:auto;text-align:left;padding-left:1mm;">
							<xsl:if test="$RtnHdrData/PaidPreparerInformationGrp/PreparerUSAddress">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$RtnHdrData/PaidPreparerInformationGrp/PreparerUSAddress/AddressLine1Txt"/>
								</xsl:call-template>
								<br/>
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$RtnHdrData/PaidPreparerInformationGrp/PreparerUSAddress/AddressLine2Txt"/>
								</xsl:call-template>
							</xsl:if>
							<xsl:if test="$RtnHdrData/PaidPreparerInformationGrp/PreparerForeignAddress">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$RtnHdrData/PaidPreparerInformationGrp/PreparerForeignAddress/AddressLine1Txt"/>
								</xsl:call-template>
								<br/><br/>
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$RtnHdrData/PaidPreparerInformationGrp/PreparerForeignAddress/AddressLine2Txt"/>
								</xsl:call-template>
							</xsl:if>
						</div>
						<div class="styLNDesc" style="width:21mm;padding-left:7mm;">Phone </div>
						<div class="styLNCtrNumBox" style="width:38mm;border-top-width:1px;height:8mm;word-wrap:break-word;">
							<xsl:if test="$RtnHdrData/PaidPreparerInformationGrp/PhoneNum">
								<xsl:call-template name="PopulatePhoneNumber">
									<xsl:with-param name="TargetNode" select="$RtnHdrData/PaidPreparerInformationGrp/PhoneNum"/>
								</xsl:call-template>
							</xsl:if>
							<xsl:if test="$RtnHdrData/PaidPreparerInformationGrp/ForeignPhoneNum">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$RtnHdrData/PaidPreparerInformationGrp/ForeignPhoneNum"/>
								</xsl:call-template>
							</xsl:if>
						</div>
					</div>
					<div class="styBB" style="width:187mm;padding-bottom:2mm;border-bottom-width:2px;">
						<xsl:choose>
							<xsl:when test="$RtnHdrData/PaidPreparerInformationGrp/PreparerForeignAddress">
								<div class="styLNDesc" style="width:32mm;padding-left:2mm;padding-right:1mm;padding-top:1mm;">City </div>
								<div class="styLNCtrNumBox" style="width:44mm;border-top-width:1px;height:7mm;text-align:left;padding-left:1mm;word-wrap:break-word;">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$RtnHdrData/PaidPreparerInformationGrp/PreparerForeignAddress/CityNm"/>
									</xsl:call-template>
								</div>
								<div class="styLNDesc" style="width:13mm;text-align:center;padding-top:1mm;">Prov./St. </div>
								<div class="styLNCtrNumBox" style="width:16mm;border-top-width:1px;height:7mm;word-wrap:break-word;">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$RtnHdrData/PaidPreparerInformationGrp/PreparerForeignAddress/ProvinceOrStateNm"/>
									</xsl:call-template>
								</div>
								<div class="styLNDesc" style="width:11mm;text-align:center;padding-top:1mm;">Country </div>
								<div class="styLNCtrNumBox" style="width:10mm;border-top-width:1px;height:7mm;word-wrap:break-word;">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$RtnHdrData/PaidPreparerInformationGrp/PreparerForeignAddress/CountryCd"/>
									</xsl:call-template>
								</div>
								<div class="styLNDesc" style="width:23mm;padding-left:7mm;padding-top:1mm;">Postal Code </div>
								<div style="float:right;padding-right:2mm;">
									<div class="styLNCtrNumBox" style="width:36mm;border-top-width:1px;height:7mm;word-wrap:break-word;">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$RtnHdrData/PaidPreparerInformationGrp/PreparerForeignAddress/ForeignPostalCd"/>
										</xsl:call-template>
									</div>
								</div>
							</xsl:when>
							<xsl:otherwise>
								<div class="styLNDesc" style="width:32mm;padding-left:2mm;padding-right:1mm;">City </div>
								<div class="styLNCtrNumBox" style="width:65mm;border-top-width:1px;height:5mm;text-align:left;padding-left:1mm;">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$RtnHdrData/PaidPreparerInformationGrp/PreparerUSAddress/CityNm"/>
									</xsl:call-template>
								</div>
								<div class="styLNDesc" style="width:15mm;padding-left:5mm;">State </div>
								<div class="styLNCtrNumBox" style="width:14mm;border-top-width:1px;height:5mm;">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$RtnHdrData/PaidPreparerInformationGrp/PreparerUSAddress/StateAbbreviationCd"/>
									</xsl:call-template>
								</div>
								<div class="styLNDesc" style="width:21mm;padding-left:7mm;">ZIP code </div>
								<div class="styLNCtrNumBox" style="width:38mm;border-top-width:1px;height:5mm;">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$RtnHdrData/PaidPreparerInformationGrp/PreparerUSAddress/ZIPCd"/>
									</xsl:call-template>
								</div>
							</xsl:otherwise>
						</xsl:choose>
					</div>
					<!--Page Footer-->
					<div class="pageEnd styStdDiv" style="width:187mm;">
						<span style="float:left;clear:none;">Page <span class="styBoldText" style="font-size:8pt;">2</span>
						</span>
						<span style="float:right;clear:none;">Form <span class="styBoldText" style="font-size:8pt;">945-X</span> (Rev. 2-2025)</span>
					</div>
					<!--END Page Footer-->
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
				</form>
			</body>
		</html>
	</xsl:template>
</xsl:stylesheet>