<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE xsl:stylesheet [
	<!ENTITY nbsp "&#160;"> 
	<!ENTITY mdash "&#8212;"> 
]>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:include href="PopulateTemplate.xsl"/>
	<xsl:include href="AddHeader.xsl"/>
	<xsl:include href="CommonPathRef.xsl"/>
	<xsl:include href="AddOnTable.xsl"/>
	<xsl:include href="IRS8986Style.xsl"/>
	<xsl:output method="html" indent="yes"/>
	<xsl:strip-space elements="*"/>
	<xsl:param name="FormData" select="$RtnDoc/IRS8986"/>
	<xsl:template match="/">
		<xsl:text disable-output-escaping="yes">&lt;!DOCTYPE html&gt;</xsl:text>
		<html lang="EN-US">
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
				<meta name="Description" content="IRS Form 8986"/>
				<script language="JavaScript" src="{$ScriptPath}/FormDisplay.js" type="text/javascript"/>
				<xsl:call-template name="InitJS"/>
				<style type="text/css">
					<!--<xsl:if test="not($Print) or $Print=''">-->
					<xsl:call-template name="AddOnStyle"/>
					<xsl:call-template name="IRS8986Style"/>
					<!--</xsl:if>-->
				</style>
				<xsl:call-template name="GlobalStylesForm"/>
			</head>
			<body class="styBodyClass">
				<form id="Form8986">
					<xsl:call-template name="DocumentHeader"/>
					<!-- Page 1 -->
					<!-- Header -->
					<div class="styStdDiv">
						<!-- 31+127+28=186-->
						<div class="styFNBox" style="width:31mm;height:21mm;border-right-width:2px;">
							Form <span class="styFN" style="font-size:16pt;">8986</span>
							<div style="padding-top:2mm;font-size:7pt;">(December 2024)</div>
							<br/>
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$FormData"/>
							</xsl:call-template>
							<br/>
							<div class="styAgency">Department of the Treasury
								<br/>Internal Revenue Service
							</div>
						</div>
						<div class="styFTBox" style="width:127mm;height:21mm;">
							<span class="styFMT" style="font-size:11pt;">Partner's Share of Adjustment(s)
<br/>to Partnership-Related Item(s)</span>
							<br/>
							<span style="font-size:10pt;">
								(Required Under Sections 6226 and 6227)
							</span>
							<br/>
							<span style="padding-top:2mm;">
								Go to
								<span style="font-style:italic;">www.irs.gov/Form8986</span>
								for instructions and the latest information.
							</span>
						</div>
						<div class="styOMB" style="width:28mm;height:21mm;border-left-width:2px;padding-top:9mm;border-bottom-width:0px;text-align:center;">  
							OMB No. 1545-0123
						</div>
					</div>
					<div class="styStdDiv" style="border-top:2px solid black;">
						<div style="float:left;width:67mm;min-height:6mm;border-right:.5px solid black;">
							<span style="font-size:8pt">Check if this form is: </span>
							<br/>
							<input type="Checkbox" class="styCkboxNM" alt="Original Filing Indicator">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$FormData/OriginalFilingInd"/>
									<xsl:with-param name="BackupName">IRS8986OriginalFilingInd</xsl:with-param>
								</xsl:call-template>
							</input>
							<span style="width:3px;"/>
							1. Original
							<span style="width:8px;"/>
							<input type="Checkbox" class="styCkboxNM" alt="Corrected Filing Indicator">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$FormData/CorrectedFilingInd"/>
									<xsl:with-param name="BackupName">IRS8986CorrectedFilingInd</xsl:with-param>
								</xsl:call-template>
							</input>
							<span style="width:3px;"/>
							2. Corrected
							<span style="width:8px;"/>
							<input type="Checkbox" disabled="disabled" alt="Reserved Filing Indicator">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="/"/>
									<xsl:with-param name="BackupName">IRS8986ReservedDisabledCheckbox</xsl:with-param>
								</xsl:call-template>
							</input>
							3. Reserved
						</div>
						<div style="float:left;width:63mm;min-height:8.5mm;padding-top:0.5mm;padding-left:1mm;border-right:.5px solid black;font-size:8pt">
							Tracking Number <br/>
							<span class="sty8986AmountSpan" style="width:63mm;text-align:center;">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$FormData/AARTrackingNum"/>
								</xsl:call-template>
							</span>
						</div>
						<div style="float:left;width:56mm;min-height:6mm;padding-top:0.5mm;padding-left:1mm;font-size:8pt">
							Audit Control Number (if applicable) <br/>
						</div>
					</div>
					<!-- ************************** PART I START ************************** -->
					<!-- Part I - Information About Entity Submitting This Form -->
					<div class="styStdDiv" style="border-top:1px solid black; border-bottom:1px solid black;">
						<div class="styPartName" style="font-size:10pt;padding-bottom:4.5mm;font-family:arial;
text-align:center;padding-top:.5mm">Part I</div>
						<div class="styPartDesc" style="font-size:10pt;padding-bottom:4.5mm;padding-top:.3mm">
							Information About Entity Submitting This Form
						</div>
					</div>
					<div class="styGenericDiv">
						<!-- Part I - A -->
						<div class="sty8986LeftCell" style="border-right:.5px solid black;padding-bottom:1mm;">
							<div class="styLNLeftLtrBox" style="padding-left:0;font-weight:normal;width:5mm;font-size:9pt;">A</div>
							<div class="styLNDesc" style="width:87mm;font-size:7.85pt;">
								Check the box to indicate which entity is submitting this form. 
							</div>
							<span style="width:98mm;padding-top:1mm;">
								<input type="Checkbox" class="styCkboxNM" alt="Audited PBBA Indicator">
									<xsl:call-template name="PopulateCheckbox">
										<xsl:with-param name="TargetNode" select="/.."/>
										<xsl:with-param name="BackupName">IRS8986AuditedPBBAInd</xsl:with-param>
									</xsl:call-template>
								</input>
								1. Audited BBA partnership <br/>
								<input type="Checkbox" class="styCkboxNM" alt="Pass-Through Partner Indicator">
									<xsl:call-template name="PopulateCheckbox">
										<xsl:with-param name="TargetNode" select="/.."/>
										<xsl:with-param name="BackupName">IRS8986PassThroughPartnerInd</xsl:with-param>
									</xsl:call-template>
								</input>
								2. Pass-through partner (direct or indirect) of an audited BBA partnership<br/>
								<input type="Checkbox" class="styCkboxNM" alt="BBA AAR Indicator">
									<xsl:call-template name="PopulateCheckbox">
										<xsl:with-param name="TargetNode" select="$FormData/BBAAARInd"/>
										<xsl:with-param name="BackupName">IRS8986BBAARInd</xsl:with-param>
									</xsl:call-template>
								</input>
								3. BBA partnership that filed an administrative adjustment request (AAR)<br/>
								<input type="Checkbox" class="styCkboxNM" alt="Pass Through Partner AAR Indicator">
									<xsl:call-template name="PopulateCheckbox">
										<xsl:with-param name="TargetNode" select="$FormData/PassThroughPartnerAARInd"/>
										<xsl:with-param name="BackupName">IRS8986PassThroughPartnerAARInd</xsl:with-param>
									</xsl:call-template>
								</input>
								<span style="font-family:Arial;margin-left:1mm;"> 4. Pass-through partner (direct or indirect) of a BBA partnership that filed an AAR</span>
								<br/>
							</span>
						</div>
						<!-- Part I - B -->
						<div class="sty8986RightCell" style="padding-bottom: 1mm;height:20.3mm;">
							<div class="styLNLeftLtrBox" style="padding-left:1mm;width:5mm;font-weight:normal;font-size:9pt">B</div>
							<div class="styLNDesc" style="width:82mm;font-size:7.85pt;">
								Type of return filed by the entity that submitted this form:
							</div>
							<br/>
							<br/>
							<span style="padding-left:5mm;padding-top:1.5mm;">
								<input type="Checkbox" class="styCkboxNM" alt="Form 1065 Indicator">
									<xsl:call-template name="PopulateCheckbox">
										<xsl:with-param name="TargetNode" select="$FormData/Form1065Ind"/>
										<xsl:with-param name="BackupName">IRS8986Form1065Ind</xsl:with-param>
									</xsl:call-template>
								</input>
								1. Form 1065
								<span style="width:15px;"/>
								<input type="Checkbox" class="styCkboxNM" alt="Form 1120S Indicator">
									<xsl:call-template name="PopulateCheckbox">
										<xsl:with-param name="TargetNode" select="$FormData/Form1120SInd"/>
										<xsl:with-param name="BackupName">IRS8986Form1120SInd</xsl:with-param>
									</xsl:call-template>
								</input>
								2. Form 1120-S
								<span style="width:15px;"/>
								<input type="Checkbox" class="styCkboxNM" alt="Form 1041 Indicator">
									<xsl:call-template name="PopulateCheckbox">
										<xsl:with-param name="TargetNode" select="$FormData/Form1041Ind"/>
										<xsl:with-param name="BackupName">IRS8986Form1041Ind</xsl:with-param>
									</xsl:call-template>
								</input>
								3. Form 1041
								<br/>
								<input type="Checkbox" class="styCkboxNM" alt="Other Form Checkbox">
									<xsl:call-template name="PopulateCheckbox">
										<xsl:with-param name="TargetNode" select="$FormData/OtherReturnGrp/OtherReturnInd"/>
										<xsl:with-param name="BackupName">IRS8986OtherReturnInd</xsl:with-param>
									</xsl:call-template>
								</input>
								4. Other (enter form number) 
								<span style="width:41mm;border-bottom:1px solid black;text-align:center;">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$FormData/OtherReturnGrp/TaxFormNum"/>
									</xsl:call-template>
								</span>
							</span>
						</div>
					</div>
					<!-- Part I - End -->
					<!-- ************************** PART II START ************************** -->
					<!-- Part II - Information About the Audited Partnership or Partnership That Filed an Administrative Adjustment Request -->
					<div class="styStdDiv" style="border-bottom:1px solid black;">
						<div class="styPartName" style="font-size:10pt;padding-bottom:4.5mm;font-family:arial;text-align:center;padding-top:.5mm">Part II</div>
						<div class="styPartDesc" style="font-size:9pt;padding-bottom:4.5mm;padding-top:.3mm;font-family:arial;">
							Information About the Audited Partnership or Partnership That Filed an Administrative Adjustment Request
						</div>
					</div>
					<div class="styGenericDiv">
						<!-- Part II - A -->
						<div class="sty8986LeftCell" style="width:119mm;border-right-width: 0px;">
							<div class="styLNLeftLtrBox" style="width:4mm;height:24mm;padding-left:0;font-weight:normal;font-size:9pt;">A</div>
							<div class="styNameAddr" style="font-size:7pt;height:10.5mm;width:115mm;padding-top:1mm;border-right-width: 0.5px;">
								1. Partnership's name<br/>
								<xsl:call-template name="PopulateReturnHeaderFiler">
									<xsl:with-param name="TargetNode">BusinessNameLine1Txt</xsl:with-param>
								</xsl:call-template>
								<br/>
								<xsl:call-template name="PopulateReturnHeaderFiler">
									<xsl:with-param name="TargetNode">BusinessNameLine2Txt</xsl:with-param>
								</xsl:call-template>
								<br/>
							</div>
							<xsl:choose>
								<xsl:when test="$RtnHdrData/Filer/USAddress">
									<div class="styNameAddr" style="font-size:7pt;height:10.5mm;width:75mm;border-right:.5px solid black;">
										2. Street address<br/>
										<xsl:call-template name="PopulateReturnHeaderFiler">
											<xsl:with-param name="TargetNode">AddressLine1Txt</xsl:with-param>
										</xsl:call-template>
										<br/>
										<xsl:call-template name="PopulateReturnHeaderFiler">
											<xsl:with-param name="TargetNode">AddressLine2Txt</xsl:with-param>
										</xsl:call-template>
									</div>
									<div class="styNameAddr" style="font-size:7pt;height:10.5mm;width:40mm;border-right-width: 0.5px;">
										3. City or town
										<br/>
										<xsl:call-template name="PopulateReturnHeaderFiler">
											<xsl:with-param name="TargetNode">CityNm</xsl:with-param>
										</xsl:call-template>
									</div>
									<div class="styNameAddr" style="font-size:7pt;height:7mm;width:50mm;border-right:.5px solid black;border-bottom-width: 0px;">
										4. State or province
										<br/>
										<xsl:call-template name="PopulateReturnHeaderFiler">
											<xsl:with-param name="TargetNode">StateAbbreviationCd</xsl:with-param>
										</xsl:call-template>
									</div>
									<div class="styNameAddr" style="font-size:7pt;height:7mm;width:25mm;border-right:.5px solid black;border-bottom-width: 0px;">
										5. Country code
										<br/>
										&nbsp;</div>
									<div class="styNameAddr" style="font-size:7pt;height:7mm;width:40mm;border-right-width: 0.5px;border-bottom-width: 0px;">
										6. Zip or foreign postal code
										<br/>
										<xsl:call-template name="PopulateReturnHeaderFiler">
											<xsl:with-param name="TargetNode">ZIPCd</xsl:with-param>
										</xsl:call-template>
									</div>
								</xsl:when>
								<xsl:otherwise>
									<div class="styNameAddr" style="font-size:7pt;height:10.5mm;width:75mm;border-right:.5px solid black;">
										2. Street address<br/>
										<xsl:call-template name="PopulateReturnHeaderFiler">
											<xsl:with-param name="TargetNode">AddressLine1Txt</xsl:with-param>
										</xsl:call-template>
										<br/>
										<xsl:call-template name="PopulateReturnHeaderFiler">
											<xsl:with-param name="TargetNode">AddressLine2Txt</xsl:with-param>
										</xsl:call-template>
									</div>
									<div class="styNameAddr" style="font-size:7pt;height:10.5mm;width:40mm;border-right-width: 0.5px;">
										3. City or town
										<br/>
										<xsl:call-template name="PopulateReturnHeaderFiler">
											<xsl:with-param name="TargetNode">CityNm</xsl:with-param>
										</xsl:call-template>
									</div>
									<div class="styNameAddr" style="font-size:7pt;height:7mm;width:50mm;border-right:.5px solid black;border-bottom-width: 0px;">
										4. State or province
										<br/>
										<xsl:call-template name="PopulateReturnHeaderFiler">
											<xsl:with-param name="TargetNode">ProvinceOrStateNm</xsl:with-param>
										</xsl:call-template>
									</div>
									<div class="styNameAddr" style="font-size:7pt;height:7mm;width:25mm;border-right:.5px solid black;border-bottom-width: 0px;">
										5. Country code
										<br/>
										<xsl:call-template name="PopulateReturnHeaderFiler">
											<xsl:with-param name="TargetNode">CountryCd</xsl:with-param>
										</xsl:call-template>
									</div>
									<div class="styNameAddr" style="font-size:7pt;height:7mm;width:40mm;border-right-width: 0.5px;border-bottom-width: 0px;">
										6. Zip or foreign postal code
										<br/>
										<xsl:call-template name="PopulateReturnHeaderFiler">
											<xsl:with-param name="TargetNode">ForeignPostalCd</xsl:with-param>
										</xsl:call-template>
									</div>
								</xsl:otherwise>
							</xsl:choose>
						</div>
						<!-- Part II - C  -->
						<div class="sty8986RightCell" style="width:68mm;height:14mm;padding-bottom: 2mm;border-bottom:.5px solid black;">
							<div class="styLNLeftLtrBox" style="width:15mm;height:14mm;padding-left:1mm;font-weight:normal;width:5mm;font-size:9pt;">C</div>
							<div class="styNameAddr" style="font-size:7pt;height:14mm;width:63mm;padding-top:1mm;border-right-width: 0px;border-bottom-width: 0px;">
								Partnership's tax identification number (TIN)
								<span class="sty8986AmountSpan" style="width:63mm;text-align:center;">
									<xsl:call-template name="PopulateReturnHeaderFiler">
										<xsl:with-param name="EINChanged">true</xsl:with-param>
										<xsl:with-param name="TargetNode">EIN</xsl:with-param>
									</xsl:call-template>
								</span>
							</div>
						</div>
						<!-- Part II - D -->
						<div class="sty8986RightCell" style="width:68mm;height:14mm;padding-bottom: 2mm;border-bottom:.5px solid black;">
							<div class="styLNLeftLtrBox" style="width:15mm;height:14mm;padding-left:1mm;font-weight:normal;width:5mm;font-size:9pt;">D</div>
							<div class="styNameAddr" style="font-size:7pt;height:14mm;width:63mm;padding-top:1mm;border-right-width: 0px;border-bottom-width: 0px;">
								Review year of the partnership is for tax year ended (MM/DD/YYYY)
								<span class="sty8986AmountSpan" style="width:63mm;text-align:center;">
									<xsl:call-template name="PopulateMonthDayYear">
										<xsl:with-param name="TargetNode" select="$FormData/PrtshpReviewTaxYrEndDt"/>
									</xsl:call-template>
								</span>
							</div>
						</div>
						<!-- Part II - B -->
						<div class="sty8986LeftCell" style="width:119mm;border-right-width: 0px;">
							<div class="styLNLeftLtrBox" style="height:42.5mm;width:4mm;padding-left:0;font-weight:normal;font-size:9pt;">B</div>
							<div class="styNameAddr" style="height:11mm;font-size:7pt;width:115mm;padding-top:1mm;border-right-width: 0.5px;padding-bottom:1mm;">
								If the partnership representative (PR) is an individual, enter information about the PR. Otherwise, enter information about the designated individual (DI).
								<span>
									Check appropriate box. 
									<span style="width:15px;"/>
									<input type="Checkbox" class="styCkboxNM" alt="Individual Partnership Representative Indicator">
										<xsl:call-template name="PopulateCheckbox">
											<xsl:with-param name="TargetNode" select="$FormData/IndividualPartnershipRepInd"/>
											<xsl:with-param name="BackupName">IRS8986PR</xsl:with-param>
										</xsl:call-template>
									</input>
									PR
									<span style="width:15px;"/>
									<input type="Checkbox" class="styCkboxNM" alt="Designated Individual Indicator">
										<xsl:call-template name="PopulateCheckbox">
											<xsl:with-param name="TargetNode" select="$FormData/DesignatedIndividualInd"/>
											<xsl:with-param name="BackupName">IRS8986DI</xsl:with-param>
										</xsl:call-template>
									</input>
									DI
								</span>
							</div>
							<!-- Part II - B 1-7 -->
							<div class="styNameAddr" style="font-size:7pt;height:7.5mm;width:57.5mm;border-right:.5px solid black;">
								1. First name<br/>
								<span class="sty8986AmountSpan" style="width:57.5mm;text-align:left;float:left;">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$FormData/PersonFullName/PersonFirstNm"/>
									</xsl:call-template>
								</span>
							</div>
							<div class="styNameAddr" style="font-size:7pt;height:7.5mm;width:57.5mm;border-right-width: 0.5px;">
								2. Last name<br/>
								<span class="sty8986AmountSpan" style="width:57.5mm;text-align:left;float:left;">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$FormData/PersonFullName/PersonLastNm"/>
									</xsl:call-template>
								</span>
							</div>
							<div class="styNameAddr" style="font-size:7pt;height:10mm;width:75mm;border-right:.5px solid black;">
								3. Street address
								<span class="sty8986AmountSpan" style="width:75mm;text-align:left;float:left;">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$FormData/PartnershipUSAddress/AddressLine1Txt"/>
									</xsl:call-template>
								</span>
								<span class="sty8986AmountSpan" style="width:75mm;text-align:left;float:left;">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$FormData/PartnershipUSAddress/AddressLine2Txt"/>
									</xsl:call-template>
								</span>
							</div>
							<div class="styNameAddr" style="font-size:7pt;height:10mm;width:40mm;border-right-width: 0.5px;">
								4. City or town
								<span class="sty8986AmountSpan" style="width:75mm;text-align:left;float:left;">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$FormData/PartnershipUSAddress/CityNm"/>
									</xsl:call-template>
								</span>
							</div>
							<div class="styNameAddr" style="font-size:7pt;height:7mm;width:75mm;border-right:.5px solid black;">
								5. State
								<span class="sty8986AmountSpan" style="width:75mm;text-align:left;float:left;">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$FormData/PartnershipUSAddress/StateAbbreviationCd"/>
									</xsl:call-template>
								</span>
							</div>
							<div class="styNameAddr" style="font-size:7pt;height:7mm;width:40mm;border-right-width: 0.5px;">
								6. ZIP code
								<span class="sty8986AmountSpan" style="width:75mm;text-align:left;float:left;">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$FormData/PartnershipUSAddress/ZIPCd"/>
									</xsl:call-template>
								</span>
							</div>
							<div class="styNameAddr" style="font-size:7pt;height:7mm;width:115mm;border-right:.5px solid black;border-bottom-width: 0px;">
								7. Area code and phone number<br/>
								<span class="sty8986AmountSpan" style="width:115mm;">
									<xsl:call-template name="PopulatePhoneNumber">
										<xsl:with-param name="TargetNode" select="$FormData/PrtshpPhoneNum"/>
									</xsl:call-template>
								</span>
							</div>
						</div>
						<!-- Part II - E  -->
						<div class="sty8986RightCell" style="width:68mm;height:11mm;padding-bottom: 2mm;border-bottom:.5px solid black;">
							<div class="styLNLeftLtrBox" style="width:15mm;height:11mm;padding-left:1mm;font-weight:normal;width:5mm;font-size:9pt;">E</div>
							<div class="styEINDateAssets" style="font-size:7pt;height:11mm;width:63mm;padding-top:1mm;border-right-width: 0px;border-bottom-width: 0px;">
								Adjustment year of the partnership is for tax year ended (MM/DD/YYYY)<br/>
								<span class="sty8986AmountSpan" style="width:63mm;text-align:center;">
									<xsl:call-template name="PopulateMonthDayYear">
										<xsl:with-param name="TargetNode" select="$FormData/PrtshpAdjustmentTxYrEndDt"/>
									</xsl:call-template>
								</span>
							</div>
						</div>
						<!-- Part II - F -->
						<div class="sty8986RightCell" style="width:68mm;height:13mm;padding-bottom: 2mm;border-bottom:.5px solid black;">
							<div class="styLNLeftLtrBox" style="width:15mm;height:12mm;padding-left:1mm;font-weight:normal;width:5mm;font-size:9pt;">F</div>
							<div class="styEINDateAssets" style="font-size:7pt;height:12mm;width:63mm;padding-top:1mm;border-right-width: 0px;border-bottom-width: 0px;">
								Extended due date of the partnership's adjustment year return (MM/DD/YYYY)<br/>
								<span class="sty8986AmountSpan" style="width:63mm;text-align:center;">
									<xsl:call-template name="PopulateMonthDayYear">
										<xsl:with-param name="TargetNode" select="$FormData/PrtshpAdjYrExtendedDueDt"/>
									</xsl:call-template>
								</span>
							</div>
						</div>
						<!-- Part II - G -->
						<div class="sty8986RightCell" style="width:68mm;height:15mm;padding-bottom: 2mm;border-bottom:.5px solid black;">
							<div class="styLNLeftLtrBox" style="width:15mm;height:15mm;padding-left:1mm;font-weight:normal;width:5mm;font-size:9pt;">G</div>
							<div class="styEINDateAssets" style="font-size:7pt;height:15mm;width:63mm;padding-top:1mm;border-right-width: 0px;border-bottom-width: 0px;">
								Date the partnership furnished the Form 8986 statements to its partners (MM/DD/YYYY)<br/>
								<span class="sty8986AmountSpan" style="width:63mm;text-align:center;">
									<xsl:call-template name="PopulateMonthDayYear">
										<xsl:with-param name="TargetNode" select="$FormData/Form8986StmtFurnishedDt"/>
									</xsl:call-template>
								</span>
							</div>
						</div>
						<div class="sty8986RightCell" style="width:68mm;background-color:gray;height:3.75mm;padding-bottom:2mm;border-bottom:.5px solid black;"/>
					</div>
					<!-- Part II - End -->
					<!-- Part III - Information About the Pass-Through Partner (Only fill out this section if this statement is being submitted by a pass-through partner.) -->
					<div class="styStdDiv" style="width:187mm;height:8mm;border-bottom:1px solid black;">
						<div class="styPartName" style="height:5mm;font-size:10pt;font-family:arial;
text-align:center;padding-top:.5mm">Part III</div>
						<div class="styPartDesc" style="font-size:9pt;padding-top:.3mm;font-family:arial;font-weight:normal;">
						<b>	Information About the Pass-Through Partner</b> (Only fill out this section if this statement is being submitted by<br/> a pass-through partner.)
						</div>
					</div>
					<div class="styGenericDiv" style="width:187mm;">
						<!-- Part III - A -->
						<div class="sty8986LeftCell" style="height:27.25mm;width:119mm;border-right-width: 0px;">
							<div class="styLNLeftLtrBox" style="width:4mm;height:27mm;padding-left:0;font-weight:normal;font-size:9pt;">A</div>
							<div class="styNameAddr" style="font-size:7pt;height:11mm;width:115mm;border-right-width: 0.5px;padding-top:1mm;">
								1. Pass-through entity's name<br/>
								<span class="sty8986AmountSpan" style="width:115mm;float:left;text-align:left;">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$FormData/PassThruPartnerInfoGrp/PassThroughEntityName/BusinessNameLine1Txt"/>
									</xsl:call-template>
								</span>
								<span class="sty8986AmountSpan" style="width:115mm;float:left;text-align:left;">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$FormData/PassThruPartnerInfoGrp/PassThroughEntityName/BusinessNameLine2Txt"/>
									</xsl:call-template>
								</span>
							</div>
							<xsl:choose>
								<xsl:when test="$FormData/PassThruPartnerInfoGrp/USAddress">
									<div class="styNameAddr" style="font-size:7pt;height:9.5mm;width:75mm;border-right:.5px solid black;">
										2. Street address<br/>
										<span class="sty8986AmountSpan" style="width:75mm;float:left;text-align:left;">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="$FormData/PassThruPartnerInfoGrp/USAddress/AddressLine1Txt"/>
											</xsl:call-template>
										</span>
										<span class="sty8986AmountSpan" style="width:75mm;float:left;text-align:left;">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="$FormData/PassThruPartnerInfoGrp/USAddress/AddressLine2Txt"/>
											</xsl:call-template>
										</span>
									</div>
									<div class="styNameAddr" style="font-size:7pt;height:9.5mm;width:40mm;border-right-width: 0.5px;">
										3. City or town<br/>
										<span class="sty8986AmountSpan" style="width:40mm;float:left;text-align:left;">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="$FormData/PassThruPartnerInfoGrp/USAddress/CityNm"/>
											</xsl:call-template>
										</span>
									</div>
									<div class="styNameAddr" style="font-size:7pt;height:6.5mm;width:50mm;border-right:.5px solid black;border-bottom-width: 0px;">
										4. State or province<br/>
										<span class="sty8986AmountSpan" style="width:75mm;float:left;text-align:left;">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="$FormData/PassThruPartnerInfoGrp/USAddress/StateAbbreviationCd"/>
											</xsl:call-template>
										</span>
									</div>
									<div class="styNameAddr" style="font-size:7pt;height:6.5mm;width:25mm;border-right:.5px solid black;border-bottom-width: 0px;">
										5. Country code<br/>
										&nbsp;</div>
									<div class="styNameAddr" style="font-size:7pt;height:6.5mm;width:40mm;border-right-width: 0.5px;border-bottom-width: 0px;">
										6. Zip or foreign postal code<br/>
										<span class="sty8986AmountSpan" style="width:75mm;float:left;text-align:left;">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="$FormData/PassThruPartnerInfoGrp/USAddress/ZIPCd"/>
											</xsl:call-template>
										</span>
									</div>
								</xsl:when>
								<xsl:otherwise>
									<div class="styNameAddr" style="font-size:7pt;height:9.5mm;width:75mm;border-right:.5px solid black;">
										2. Street address<br/>
										<span class="sty8986AmountSpan" style="width:75mm;float:left;text-align:left;">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="$FormData/PassThruPartnerInfoGrp/ForeignAddress/AddressLine1Txt"/>
											</xsl:call-template>
										</span>
										<span class="sty8986AmountSpan" style="width:75mm;float:left;text-align:left;">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="$FormData/PassThruPartnerInfoGrp/ForeignAddress/AddressLine2Txt"/>
											</xsl:call-template>
										</span>
									</div>
									<div class="styNameAddr" style="font-size:7pt;height:9.5mm;width:40mm;border-right-width: 0.5px;">
										3. City or town<br/>
										<span class="sty8986AmountSpan" style="width:40mm;float:left;text-align:left;">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="$FormData/PassThruPartnerInfoGrp/ForeignAddress/CityNm"/>
											</xsl:call-template>
										</span>
									</div>
									<div class="styNameAddr" style="font-size:7pt;height:6.5mm;width:50mm;border-right:.5px solid black;border-bottom-width: 0px;">
										4. State or province<br/>
										<span class="sty8986AmountSpan" style="width:75mm;float:left;text-align:left;">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="$FormData/PassThruPartnerInfoGrp/ForeignAddress/ProvinceOrStateNm"/>
											</xsl:call-template>
										</span>
									</div>
									<div class="styNameAddr" style="font-size:7pt;height:6.5mm;width:25mm;border-right:.5px solid black;border-bottom-width: 0px;">
										5. Country code<br/>
										<span class="sty8986AmountSpan" style="width:75mm;float:left;text-align:left;">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="$FormData/PassThruPartnerInfoGrp/ForeignAddress/CountryCd"/>
											</xsl:call-template>
										</span>
									</div>
									<div class="styNameAddr" style="font-size:7pt;height:6.5mm;width:40mm;border-right-width: 0.5px;border-bottom-width: 0px;">
										6. Zip or foreign postal code<br/>
										<span class="sty8986AmountSpan" style="width:75mm;float:left;text-align:left;">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="$FormData/PassThruPartnerInfoGrp/ForeignAddress/ForeignPostalCd"/>
											</xsl:call-template>
										</span>
									</div>
								</xsl:otherwise>
							</xsl:choose>
						</div>
						<!-- Part III - B  -->
						<div class="sty8986RightCell" style="width:68mm;height:14.75mm;padding-bottom: 2mm;border-bottom:.5px solid black;">
							<div class="styLNLeftLtrBox" style="width:15mm;height:14.75mm;padding-left:1mm;font-weight:normal;width:5mm;font-size:9pt;">B</div>
							<div class="styEINDateAssets" style="font-size:7pt;height:14.75mm;width:63mm;padding-top:1mm;border-right-width: 0px;border-bottom-width: 0px;">
								Pass-through partner's tax identification number (TIN)<br/>
								<span class="sty8986AmountSpan" style="width:63mm;text-align:center;">
									<xsl:call-template name="PopulateEIN">
										<xsl:with-param name="TargetNode" select="$FormData/PassThruPartnerInfoGrp/EIN"/>
									</xsl:call-template>
								</span>
							</div>
						</div>
						<!-- Part III - C -->
						<div class="sty8986RightCell" style="width:68mm;height:12.5mm;padding-bottom: 2mm;border-bottom:.5px solid black;">
							<div class="styLNLeftLtrBox" style="width:15mm;height:12.5mm;padding-left:1mm;font-weight:normal;width:5mm;font-size:9pt;">C</div>
							<div class="styEINDateAssets" style="font-size:7pt;height:12.5mm;width:63mm;padding-top:1mm;border-right-width: 0px;border-bottom-width: 0px;">
								Pass-through partner's tax year end to which the adjustments relate (MM/DD/YYYY)<br/>
								<span class="sty8986AmountSpan" style="width:63mm;text-align:center;">
									<xsl:call-template name="PopulateMonthDayYear">
										<xsl:with-param name="TargetNode" select="$FormData/PassThruPartnerInfoGrp/TYEndMonthDayYearDt"/>
									</xsl:call-template>
								</span>
							</div>
						</div>
						<!-- Part III - D -->
						<div class="sty8986LeftCell" style="width:96mm;height:20mm;border-right-width: 0px;">
							<div class="styLNLeftLtrBox" style="height:20mm;width:4mm;padding-left:0;font-weight:normal;font-size:9pt;">D</div>
							<div class="styNameAddr" style="height:20mm;font-size:7pt;width:92mm;padding-top:1mm;border-right-width: 0.5px;padding-bottom:1mm;border-bottom-width: 0px;">
								Name of the entity that issued the statement to the pass-through partner (if different from the partnership in Part II)<br/>
								<span class="sty8986AmountSpan" style="width:92mm;float:left;text-align:left;">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$FormData/PassThruPartnerInfoGrp/PassThroughEntityBusName/BusinessNameLine1Txt"/>
									</xsl:call-template>
								</span>
								<span class="sty8986AmountSpan" style="width:92mm;float:left;text-align:left;">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$FormData/PassThruPartnerInfoGrp/PassThroughEntityBusName/BusinessNameLine2Txt"/>
									</xsl:call-template>
								</span>
							</div>
						</div>
						<!-- Part III - E  -->
						<div class="sty8986RightCell" style="width:91mm;height:20mm;padding-bottom: 2mm;border-bottom:.5px solid black;">
							<div class="styLNLeftLtrBox" style="width:15mm;height:20mm;padding-left:1mm;font-weight:normal;width:5mm;font-size:9pt;">E</div>
							<div class="styEINDateAssets" style="font-size:7pt;height:20mm;width:80mm;padding-top:1mm;border-right-width: 0px;border-bottom-width: 0px;">
								TIN of the entity that issued the statement to the pass-through partner (if different from the partnership in Part II)<br/>
								<span class="sty8986AmountSpan" style="width:80mm;float:left;text-align:center;">
									<xsl:call-template name="PopulateEIN">
										<xsl:with-param name="TargetNode" select="$FormData/PassThruPartnerInfoGrp/PassThroughEntityEIN"/>
									</xsl:call-template>
								</span>
							</div>
						</div>
					</div>
					<!-- Part III - End -->
					<!-- ************************** PART IV START ************************** -->
					<!-- Part IV - Information About the Partner Receiving This Statement -->
					<div class="styStdDiv" style="border-bottom:1px solid black;">
						<div class="styPartName" style="height:5mm;font-size:10pt;padding-bottom:4.5mm;font-family:arial;text-align:center;padding-top:.5mm">Part IV</div>
						<div class="styPartDesc" style="font-size:10pt;padding-bottom:4.5mm;padding-top:.3mm;">
							Information About the Partner Receiving This Statement
						</div>
					</div>
					<div class="styGenericDiv" style="width:187mm;">
						<!-- Part IV - A -->
						<div class="sty8986LeftCell" style="height:35mm;width:119mm;border-right-width: 0px;">
							<div class="styLNLeftLtrBox" style="width:4mm;height:35mm;padding-left:0;font-weight:normal;font-size:9pt;">A</div>
							<div class="styNameAddr" style="font-size:7pt;height:11mm;width:115mm;border-right-width: 0.5px;padding-top:1mm;">
								1. Partner's name, if an entity<br/>
								<span class="sty8986AmountSpan" style="width:115mm;float:left;text-align:left;">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$FormData/PartnerName/BusinessNameLine1Txt"/>
									</xsl:call-template>
								</span>
								<span class="sty8986AmountSpan" style="width:115mm;float:left;text-align:left;">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$FormData/PartnerName/BusinessNameLine2Txt"/>
									</xsl:call-template>
								</span>
							</div>
							<div class="styNameAddr" style="font-size:7pt;height:7mm;width:57.5mm;border-right-width: 0.5px;">
								2. Partner's first name, if an individual<br/>
								<span class="sty8986AmountSpan" style="width:57.7mm;float:left;text-align:left;">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$FormData/PartnerPersonName/PersonFirstNm"/>
									</xsl:call-template>
								</span>
							</div>
							<div class="styNameAddr" style="font-size:7pt;height:7mm;width:57.5mm;border-right-width: 0.5px;">
								3. Partner's last name, if an individual<br/>
								<span class="sty8986AmountSpan" style="width:57.5mm;float:left;text-align:left;">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$FormData/PartnerPersonName/PersonLastNm"/>
									</xsl:call-template>
								</span>
							</div>
							<xsl:choose>
								<xsl:when test="$FormData/PartnerUSAddress">
									<div class="styNameAddr" style="font-size:7pt;height:10mm;width:75mm;border-right:.5px solid black;">
										4. Street address<br/>
										<span class="sty8986AmountSpan" style="width:75mm;float:left;text-align:left;">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="$FormData/PartnerUSAddress/AddressLine1Txt"/>
											</xsl:call-template>
										</span>
										<span class="sty8986AmountSpan" style="width:75mm;float:left;text-align:left;">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="$FormData/PartnerUSAddress/AddressLine2Txt"/>
											</xsl:call-template>
										</span>
									</div>
									<div class="styNameAddr" style="font-size:7pt;height:10mm;width:40mm;border-right-width: 0.5px;">
										5. City or town<br/>
										<span class="sty8986AmountSpan" style="width:40mm;float:left;text-align:left;">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="$FormData/PartnerUSAddress/CityNm"/>
											</xsl:call-template>
										</span>
									</div>
									<div class="styNameAddr" style="font-size:7pt;height:7mm;width:50mm;border-right:.5px solid black;border-bottom-width: 0px;">
										6. State or province<br/>
										<span class="sty8986AmountSpan" style="width:75mm;float:left;text-align:left;">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="$FormData/PartnerUSAddress/StateAbbreviationCd"/>
											</xsl:call-template>
										</span>
									</div>
									<div class="styNameAddr" style="font-size:7pt;height:7mm;width:25mm;border-right:.5px solid black;border-bottom-width: 0px;">
										7. Country code<br/>
										&nbsp;</div>
									<div class="styNameAddr" style="font-size:7pt;height:7mm;width:40mm;border-right-width: 0.5px;border-bottom-width: 0px;">
										8. Zip or foreign postal code<br/>
										<span class="sty8986AmountSpan" style="width:75mm;float:left;text-align:left;">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="$FormData/PartnerUSAddress/ZIPCd"/>
											</xsl:call-template>
										</span>
									</div>
								</xsl:when>
								<xsl:otherwise>
									<div class="styNameAddr" style="font-size:7pt;height:10mm;width:75mm;border-right:.5px solid black;">
										2. Street address<br/>
										<span class="sty8986AmountSpan" style="width:75mm;float:left;text-align:left;">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="$FormData/PartnerForeignAddress/AddressLine1Txt"/>
											</xsl:call-template>
										</span>
										<span class="sty8986AmountSpan" style="width:75mm;float:left;text-align:left;">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="$FormData/PartnerForeignAddress/AddressLine2Txt"/>
											</xsl:call-template>
										</span>
									</div>
									<div class="styNameAddr" style="font-size:7pt;height:10mm;width:40mm;border-right-width: 0.5px;">
										3. City or town<br/>
										<span class="sty8986AmountSpan" style="width:40mm;float:left;text-align:left;">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="$FormData/PartnerForeignAddress/CityNm"/>
											</xsl:call-template>
										</span>
									</div>
									<div class="styNameAddr" style="font-size:7pt;height:7mm;width:50mm;border-right:.5px solid black;border-bottom-width: 0px;">
										4. State or province<br/>
										<span class="sty8986AmountSpan" style="width:75mm;float:left;text-align:left;">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="$FormData/PartnerForeignAddress/ProvinceOrStateNm"/>
											</xsl:call-template>
										</span>
									</div>
									<div class="styNameAddr" style="font-size:7pt;height:7mm;width:25mm;border-right:.5px solid black;border-bottom-width: 0px;">
										5. Country code<br/>
										<span class="sty8986AmountSpan" style="width:75mm;float:left;text-align:left;">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="$FormData/PartnerForeignAddress/CountryCd"/>
											</xsl:call-template>
										</span>
									</div>
									<div class="styNameAddr" style="font-size:7pt;height:7mm;width:40mm;border-right-width: 0.5px;border-bottom-width: 0px;">
										6. Zip or foreign postal code<br/>
										<span class="sty8986AmountSpan" style="width:75mm;float:left;text-align:left;">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="$FormData/PartnerForeignAddress/ForeignPostalCd"/>
											</xsl:call-template>
										</span>
									</div>
								</xsl:otherwise>
							</xsl:choose>
						</div>
						<!-- Part IV - B  -->
						<div class="sty8986RightCell" style="width:68mm;height:11mm;padding-bottom: 2mm;border-bottom:.5px solid black;">
							<div class="styLNLeftLtrBox" style="width:15mm;height:11mm;padding-left:1mm;font-weight:normal;width:5mm;font-size:9pt;">B</div>
							<div class="styEINDateAssets" style="font-size:7pt;height:11mm;width:63mm;padding-top:1mm;border-right-width: 0px;border-bottom-width: 0px;">
								Partner's tax identification number (TIN)<br/>
								<span class="sty8986AmountSpan" style="width:63mm;">
									<xsl:choose>
										<xsl:when test="$FormData/PartnerEIN">
											<xsl:call-template name="PopulateEIN">
												<xsl:with-param name="TargetNode" select="$FormData/PartnerEIN"/>
											</xsl:call-template>
										</xsl:when>
										<xsl:otherwise>
											<xsl:call-template name="PopulateSSN">
												<xsl:with-param name="TargetNode" select="$FormData/PartnerSSN"/>
											</xsl:call-template>
										</xsl:otherwise>
									</xsl:choose>
								</span>
							</div>
						</div>
						<!-- Part IV - C -->
						<div class="sty8986RightCell" style="width:68mm;height:24mm;padding-bottom: 2mm;border-bottom:.5px solid black;">
							<div class="styLNLeftLtrBox" style="width:15mm;height:24mm;padding-left:1mm;font-weight:normal;width:5mm;font-size:9pt;">C</div>
							<div class="styEINDateAssets" style="font-size:7pt;height:24mm;width:63mm;padding-top:1mm;border-right-width: 0px;border-bottom-width: 0px;">
								Check if:<br/>
								<span style="padding-top:2mm;">
									<input type="Checkbox" class="styCkboxNM" alt="General Partner Or LLC Member Manager Indicator">
										<xsl:call-template name="PopulateCheckbox">
											<xsl:with-param name="TargetNode" select="$FormData/GeneralPartnerOrLLCMemMgrInd"/>
											<xsl:with-param name="BackupName">IRS8986GeneralPartnerOrLLCMemMgrInd</xsl:with-param>
										</xsl:call-template>
									</input>
									1. General partner or LLC member manager<br/>
									<input type="Checkbox" class="styCkboxNM" alt="Limited Partner Or Other LLC Member Indicator">
										<xsl:call-template name="PopulateCheckbox">
											<xsl:with-param name="TargetNode" select="$FormData/LimitedPartnerOrOtherLLCMemInd"/>
											<xsl:with-param name="BackupName">IRS8986LimitedPartnerOrOtherLLCMemInd</xsl:with-param>
										</xsl:call-template>
									</input>
									2. Limited partner or other LLC member<br/>
									<input type="Checkbox" class="styCkboxNM" alt="Domestic Partner Indicator">
										<xsl:call-template name="PopulateCheckbox">
											<xsl:with-param name="TargetNode" select="$FormData/DomesticPartnerInd"/>
											<xsl:with-param name="BackupName">IRS8986DomesticPartnerInd</xsl:with-param>
										</xsl:call-template>
									</input>
									3. Domestic partner<br/>
									<input type="Checkbox" class="styCkboxNM" alt="Foreign Partner Indicator">
										<xsl:call-template name="PopulateCheckbox">
											<xsl:with-param name="TargetNode" select="$FormData/ForeignPartnerInd"/>
											<xsl:with-param name="BackupName">IRS8986ForeignPartnerInd</xsl:with-param>
										</xsl:call-template>
									</input>
									4. Foreign partner
								</span>
							</div>
						</div>
						<!-- Part IV - D -->
						<div class="sty8986LeftCell" style="width:187mm;height:18.5mm;border-right-width: 0px;">
							<div class="styLNLeftLtrBox" style="width:5mm;padding-left:0;font-weight:normal;font-size:9pt;height:18.5mm;">D</div>
							<div class="styLNDesc" style="font-size:7pt;width:181mm;padding-bottom:1mm;border-bottom-width:0px;height:18.5mm;padding-top:.5mm;">
								What type of entity is this partner?<br/>
								<input type="Checkbox" class="styCkboxNM" alt="Individual Entity Indicator">
									<xsl:call-template name="PopulateCheckbox">
										<xsl:with-param name="TargetNode" select="$FormData/IndividualEntityInd"/>
										<xsl:with-param name="BackupName">IRS8986IndividualEntityInd</xsl:with-param>
									</xsl:call-template>
								</input>
								1. Individual
								<span style="width:3mm;"/>
								<input type="Checkbox" class="styCkboxNM" alt="S Corporation Entity Indicator">
									<xsl:call-template name="PopulateCheckbox">
										<xsl:with-param name="TargetNode" select="$FormData/SCorporationEntityInd"/>
										<xsl:with-param name="BackupName">IRS8986SCorporationEntityInd</xsl:with-param>
									</xsl:call-template>
								</input>
								2. S Corporation
								<span style="width:3mm;"/>
								<input type="Checkbox" class="styCkboxNM" alt="Corporation Entity Indicator">
									<xsl:call-template name="PopulateCheckbox">
										<xsl:with-param name="TargetNode" select="$FormData/CorporationEntityInd"/>
										<xsl:with-param name="BackupName">IRS8986CorporationEntityInd</xsl:with-param>
									</xsl:call-template>
								</input>
								3. Corporation
								<span style="width:3mm;"/>
								<input type="Checkbox" class="styCkboxNM" alt="Partnership Entity Indicator">
									<xsl:call-template name="PopulateCheckbox">
										<xsl:with-param name="TargetNode" select="$FormData/PartnershipEntityInd"/>
										<xsl:with-param name="BackupName">IRS8986PartnershipEntityInd</xsl:with-param>
									</xsl:call-template>
								</input>
								4. Partnership
								<span style="width:3mm;"/>
								<input type="Checkbox" class="styCkboxNM" alt="Other Entity Type Indicator">
									<xsl:call-template name="PopulateCheckbox">
										<xsl:with-param name="TargetNode" select="$FormData/OtherEntityTypeGrp/OtherEntityTypeInd"/>
										<xsl:with-param name="BackupName">IRS8986OtherEntityTypeInd</xsl:with-param>
									</xsl:call-template>
								</input>
								5. Other
								<span style="width:60mm;border-bottom:1px solid black;text-align:left;">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$FormData/OtherEntityTypeGrp/OtherEntityTypeNm"/>
									</xsl:call-template>
								</span>
								<br/>
								
								<span style="padding-top:2mm;">								
									If this partner is a retirement plan (IRA, SEP, Keogh, etc.) or other tax-exempt entity, check here<span class="sty8986DotLn">..........</span>
								</span>
								<span>
									<input type="Checkbox" class="styCkboxNM" alt="Retire Plan Or Other TE Entity Indicator">
										<xsl:call-template name="PopulateCheckbox">
											<xsl:with-param name="TargetNode" select="$FormData/RetirePlanOrOtherTEEntityInd"/>
											<xsl:with-param name="BackupName">IRS8986RetirePlanOrOtherTEEntityInd</xsl:with-param>
										</xsl:call-template>
									</input>
								</span>
							</div>
						</div>
						<!-- Part IV - E -->
						<div class="sty8986LeftCell" style="width:187mm;border-right-width: 0px; ">
							<div class="styLNLeftLtrBox" style="height:16.25mm;width:4mm;padding-left:0;font-weight:normal;font-size:9pt;">E</div>
							<div class="styLNDesc" style="height:16.25mm;font-size:7pt;width:70mm;padding-top:1mm;padding-bottom:1mm;border-bottom-width: 0px;">
								Partner’s share of profit, loss, and capital:
								<br/>
								<div class="sty8986DescBox" style="width:70mm;">
									Profit
									<span class="sty8986DotLn" style="width:60mm;">...............</span>
								</div>
								<div class="sty8986DescBox" style="width:70mm;">
									Loss
									<span class="sty8986DotLn" style="width:60mm;">...............</span>
								</div>
								<div class="sty8986DescBox" style="width:70mm;">
									Capital
									<span class="sty8986DotLn" style="width:60mm;">...............</span>
								</div>
							</div>
							<!-- BEGIN PART IV - E TABLE -->
							<div style="width:113mm;">
								<table class="styTable" style="border-collapse:collapse;font-size:6pt;">
									<thead class="styTableThead">
										<tr style="height:5mm;">
											<th class="styTableCellHeader" scope="col" style="width:37.6mm;font-weight:normal;border-left-width:.1mm;">As Reported</th>
											<th class="styTableCellHeader" scope="col" style="width:37.6mm;font-weight:normal;border-left-width:.1mm;">Change</th>
											<th class="styTableCellHeader" scope="col" style="width:37.6mm;font-weight:normal;border-right-width:0px;border-left-width:.1mm;">Corrected</th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<td class="styTableCellTextInherit" style="border-left-width:.1mm;">
												<xsl:call-template name="PopulatePercent">
													<xsl:with-param name="TargetNode" select="$FormData/ProfitAsReportedRt"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellTextInherit">
												<xsl:call-template name="PopulatePercent">
													<xsl:with-param name="TargetNode" select="$FormData/ProfitChangeRt"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellTextInherit" style="border-right-width:0px;">
												<xsl:call-template name="PopulatePercent">
													<xsl:with-param name="TargetNode" select="$FormData/ProfitCorrectedRt"/>
												</xsl:call-template>
											</td>
										</tr>
										<tr>
											<td class="styTableCellTextInherit" style="border-left-width:.1mm;">
												<xsl:call-template name="PopulatePercent">
													<xsl:with-param name="TargetNode" select="$FormData/LossAsReportedRt"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellTextInherit">
												<xsl:call-template name="PopulatePercent">
													<xsl:with-param name="TargetNode" select="$FormData/LossChangeRt"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellTextInherit" style="border-right-width:0px;">
												<xsl:call-template name="PopulatePercent">
													<xsl:with-param name="TargetNode" select="$FormData/LossCorrectedRt"/>
												</xsl:call-template>
											</td>
										</tr>
										<tr>
											<td class="styTableCellTextInherit" style="border-left-width:.1mm;">
												<xsl:call-template name="PopulatePercent">
													<xsl:with-param name="TargetNode" select="$FormData/CapitalAsReportedRt"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellTextInherit">
												<xsl:call-template name="PopulatePercent">
													<xsl:with-param name="TargetNode" select="$FormData/CapitalChangeRt"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellTextInherit" style="border-right-width:0px;">
												<xsl:call-template name="PopulatePercent">
													<xsl:with-param name="TargetNode" select="$FormData/CapitalCorrectedRt"/>
												</xsl:call-template>
											</td>
										</tr>
									</tbody>
								</table>
								<!-- END PART IV - E TABLE -->
							</div>
						</div>
						<div class="pageEnd" style="width:187mm;">
							<span class="styBoldText" style="width:100mm;">For Privacy Act and Paperwork Reduction Act Notice, see instructions. </span>
							<span style="width:35mm; text-align:center;">Cat. No. 37810K</span>
							<div style="clear:none;width:50mm;text-align:right;">
								Form <span style="font-size:9pt;"><b>8986</b>
								</span> (12-2024)<br/>
							</div>
						</div>
						<!-- End of Page 1-->
						<!-- Begin of page 2 -->
						<div class="styStdDiv" style="width:185mm;">
							Form 8986 (12-2024)
							<span style="float:right;">Page <span style="font-weight:bold;font-size:8pt;">2</span></span>
						</div>
						<!-- ************************** PART IV CONT. ************************** -->
						<!-- Part IV - Information About the Partner Receiving This Statement cont. -->
						<div class="styStdDiv" style="width:187mm;height:5.6mm;border-bottom:1px solid black;border-top: 1px solid black;">
							<div class="styPartName" style="height:5mm;font-size:10pt;font-family:arial;
text-align:center;padding-top:.5mm">Part IV</div>
							<div class="styPartDesc" style="font-size:9pt;font-family:arial;padding-top:.5mm;">
								Information About the Partner Receiving This Statement (cont.)
							</div>
						</div>
						<!-- Part IV - F -->
						<div class="sty8986LeftCell" style="width:187mm;border-right-width:0px;border-bottom:0px;">
							<div class="styLNLeftLtrBox" style="height:20mm;width:4mm;padding-left:0;font-weight:normal;font-size:9pt;">F</div>
							<div class="styLNDesc" style="height:20mm;font-size:7pt;width:70mm;padding-top:1mm;padding-bottom:1mm;border-bottom-width: 0px;">
								Partner's share of liabilities at year end:
								<br/>
								<div class="sty8986DescBox" style="width:70mm;">
									Nonrecourse
									<span class="sty8986DotLn">.............</span>
								</div>
								<div class="sty8986DescBox" style="width:70mm;">
									Qualified nonrecourse financing
									<span class="sty8986DotLn">.......</span>
								</div>
								<div class="sty8986DescBox" style="width:70mm;">
									Recourse
									<span class="sty8986DotLn">.............</span>
								</div>
							</div>
							<!-- BEGIN PART IV - F TABLE -->
							<div style="width:113mm;">
								<table class="styTable" style="border-collapse:collapse;font-size:7pt;">
									<thead class="styTableThead">
										<tr style="height:5mm;">
											<th class="styTableCellHeader" scope="col" style="width:37.6mm;font-weight:normal;border-left-width:.1mm;">As Reported</th>
											<th class="styTableCellHeader" scope="col" style="width:37.6mm;font-weight:normal;border-left-width:.1mm;">Change</th>
											<th class="styTableCellHeader" scope="col" style="width:37.6mm;font-weight:normal;border-right-width:0px;border-left-width:.1mm;">Corrected</th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<td class="styTableCellCtrInherit" style="border-left-width:.1mm;">
											<span style="padding-left:1mm;">$</span>
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="$FormData/NonrecourseAsReportedAmt"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellCtrInherit">
											<span style="padding-left:1mm;">$</span>
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="$FormData/NonrecourseChangeAmt"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellCtrInherit" style="border-right-width:0px;">
											<span style="padding-left:1mm;">$</span>
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="$FormData/NonrecourseCorrectedAmt"/>
												</xsl:call-template>
											</td>
										</tr>
										<tr>
											<td class="styTableCellCtrInherit" style="border-left-width:.1mm;">
											<span style="padding-left:1mm;">$</span>
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="$FormData/QlfyNonRcrsFncAsReportedAmt"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellCtrInherit">
											<span style="padding-left:1mm;">$</span>
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="$FormData/QlfyNonrecourseFncChangeAmt"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellCtrInherit" style="border-right-width:0px;">
											<span style="padding-left:1mm;">$</span>
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="$FormData/QlfyNonrecourseFncCorrectedAmt"/>
												</xsl:call-template>
											</td>
										</tr>
										<tr>
				
											<td class="styTableCellCtrInherit" style="border-left-width:.1mm;">
											<span style="padding-left:1mm;">$</span>
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="$FormData/RecourseAsReportedAmt"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellCtrInherit">
											<span style="padding-left:1mm;">$</span>
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="$FormData/RecourseChangeAmt"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellCtrInherit" style="border-right-width:0px;">
											<span style="padding-left:1mm;">$</span>
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="$FormData/RecourseCorrectedAmt"/>
												</xsl:call-template>
											</td>
										</tr>
										<tr style="height:5mm;">
											<td colspan="3" style="background-color:gray;height:"/>
										</tr>
									</tbody>
								</table>
							</div>
						</div>
						<!--Part IV - G -->
						<div class="sty8986LeftCell" style="width:187mm;border-right-width: 0px;">
							<div class="styLNLeftLtrBox" style="height:28mm;width:4mm;padding-left:0;font-weight:normal;font-size:9pt;">G</div>
							<div class="styLNDesc" style="height:28mm;font-size:7pt;width:70mm;padding-top:1mm;padding-bottom:1mm;border-bottom-width: 0px;">
									Partner's capital account analysis:
									<br/>
									<div class="sty8986DescBox" style="width:70mm;">
										Beginning account balance
										<span class="sty8986DotLn">........</span>
									</div>
									<div class="sty8986DescBox" style="width:70mm;">
										Capital contributed during the year
										<span class="sty8986DotLn">......</span>
									</div>
									<div class="sty8986DescBox" style="width:70mm;">
										Current year increase (decrease)
										<span class="sty8986DotLn">......</span>
									</div>
									<div class="sty8986DescBox" style="width:70mm;">
										Withdrawals and distributions
										<span class="sty8986DotLn">.......</span>
									</div>
									<div class="sty8986DescBox" style="width:70mm;">
										Section 736 payments received
										<span class="sty8986DotLn">.......</span>
									</div>
									<div class="sty8986DescBox" style="width:70mm;">
										Ending account balance
										<span class="sty8986DotLn">.........</span>
									</div>
								</div>
								<!-- BEGIN PART IV - G TABLE -->
								<div style="width:113mm;">
									<table class="styTable" style="border-collapse:collapse;font-size:7pt;border-bottom:0px;">
										<thead class="styTableThead">
											<tr style="height:5mm;">
												<th class="styTableCellHeader" scope="col" style="width:37.6mm;font-weight:normal;border-left-width:.1mm;">As Reported</th>
												<th class="styTableCellHeader" scope="col" style="width:37.6mm;font-weight:normal;border-left-width:.1mm;">Change</th>
												<th class="styTableCellHeader" scope="col" style="width:37.6mm;font-weight:normal;border-right-width:0px;border-left-width:.1mm;">Corrected</th>
											</tr>
										</thead>
										<tbody>
											<tr>
												<td class="styTableCellCtrInherit" style="border-left-width:.1mm;">
												<span style="padding-left:1mm;">$</span>
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="$FormData/BegngAcctBalanceAsReportedAmt"/>
													</xsl:call-template>
												</td>
												<td class="styTableCellCtrInherit">
												<span style="padding-left:1mm;">$</span>
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="$FormData/BegngAcctBalanceChangeAmt"/>
													</xsl:call-template>
												</td>
												<td class="styTableCellCtrInherit" style="border-right-width:0px;">
												<span style="padding-left:1mm;">$</span>
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="$FormData/BegngAcctBalanceCorrectedAmt"/>
													</xsl:call-template>
												</td>
											</tr>
											<tr>
												<td class="styTableCellCtrInherit" style="border-left-width:.1mm;">
												<span style="padding-left:1mm;">$</span>
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="$FormData/CapContributedAsReportedAmt"/>
													</xsl:call-template>
												</td>
												<td class="styTableCellCtrInherit">
												<span style="padding-left:1mm;">$</span>
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="$FormData/CapContributedChangeAmt"/>
													</xsl:call-template>
												</td>
												<td class="styTableCellCtrInherit" style="border-right-width:0px;">
												<span style="padding-left:1mm;">$</span>
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="$FormData/CapContributedCorrectedAmt"/>
													</xsl:call-template>
												</td>
											</tr>
											<tr>
												<td class="styTableCellCtrInherit" style="border-left-width:.1mm;">
												<span style="padding-left:1mm;">$</span>
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="$FormData/CYIncrDecrAsReportedAmt"/>
													</xsl:call-template>
												</td>
												<td class="styTableCellCtrInherit">
												<span style="padding-left:1mm;">$</span>
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="$FormData/CYIncrDecrChangeAmt"/>
													</xsl:call-template>
												</td>
												<td class="styTableCellCtrInherit" style="border-right-width:0px;">
												<span style="padding-left:1mm;">$</span>
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="$FormData/CYIncrDecrCorrectedAmt"/>
													</xsl:call-template>
												</td>
											</tr>
											<tr>
												<td class="styTableCellCtrInherit" style="border-left-width:.1mm;">
												<span style="padding-left:1mm;">$</span>
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="$FormData/WithdrawalsDistriAsReportedAmt"/>
													</xsl:call-template>
												</td>
												<td class="styTableCellCtrInherit">
												<span style="padding-left:1mm;">$</span>
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="$FormData/WithdrawalsDistriChangeAmt"/>
													</xsl:call-template>
												</td>
												<td class="styTableCellCtrInherit" style="border-right-width:0px;"><span style="padding-left:1mm;">$</span>
												
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="$FormData/WithdrawalsDistriCorrectedAmt"/>
													</xsl:call-template>
												</td>
											</tr>
											<tr>
												<td class="styTableCellCtrInherit" style="border-left-width:.1mm;">
												<span style="padding-left:1mm;">$</span>
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="$FormData/Sect736PymtRcvdAsReportedAmt"/>
													</xsl:call-template>
												</td>
												<td class="styTableCellCtrInherit">
												<span style="padding-left:1mm;">$</span>
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="$FormData/Sect736PaymentsRcvdChangeAmt"/>
													</xsl:call-template>
												</td>
												<td class="styTableCellCtrInherit" style="border-right-width:0px;">
												<span style="padding-left:1mm;">$</span>
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="$FormData/Sect736PymtRcvdCorrectedAmt"/>
													</xsl:call-template>
												</td>
											</tr>
											<tr>
												<td class="styTableCellCtrInherit" style="border-left-width:.1mm;">
												<span style="padding-left:1mm;">$</span>
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="$FormData/EndingBalanceAsReportedAmt"/>
													</xsl:call-template>
												</td>
												<td class="styTableCellCtrInherit">
												<span style="padding-left:1mm;">$</span>
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="$FormData/EndingBalanceChangeAmt"/>
													</xsl:call-template>
												</td>
												<td class="styTableCellCtrInherit" style="border-right-width:0px;">
												<span style="padding-left:1mm;">$</span>
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="$FormData/EndingBalanceCorrectedAmt"/>
													</xsl:call-template>
												</td>
											</tr>
										</tbody>
									</table>
								</div>
							<!-- END PART IV - G TABLE-->
						</div>
					</div>
					<!-- ************************** PART V START ************************** -->
					<!-- Part V - Partner's Total Reviewed Year Income, Gain, Loss, Deduction, Credits, and Other Items (Fill in applicable items and use Part VI to explain any changes.) -->
					<div class="styStdDiv" style="width:187mm;height:9mm;border-bottom:1px solid black;border-top:2px solid black;">
						<div class="styPartName" style="height:5mm;font-size:10pt;font-family:arial;
text-align:center;padding-top:.5mm">Part V</div>
						<div class="styPartDesc" style="font-size:9pt;padding-top:.3mm;font-family:arial;bor-style:solid;font-weight:normal;">
						<b>	Partner's Total Reviewed Year Income, Gain, Loss, Deduction, Credits, and Other Items</b> (Fill in applicable items and use Part VI to explain any changes.)
						</div>
					</div>
					<!-- Part V - Table 1 - Begin -->
					<xsl:variable name="shouldSeparatePart5" select="($Print = $Separated) and (count($FormData/PartnerReviewedYearIncomeGrp) &gt; 14)"/>
					<div class="styStdDiv" id="Part5Table">
						<xsl:call-template name="SetInitialState"/>
						<table style="display:table;border-collapse:collapse;">
							<thead class="styTableThead">
								<tr>
									<th scope="col" class="styTableCellHeader" style="width:30mm;" rowspan="1" colspan="4">
										Schedule K-1/K-3 </th>
									<th class="styTableCellHeader" scope="col" rowspan="3" style="width:15mm;font-weight:normal;">
										<strong>(e)</strong>
										<br/> Check if<br/> statement<br/>in Part VI.<br/> See Inst.
									</th>
									<th class="styTableCellHeader" scope="col" rowspan="3" style="width:28mm;font-weight:normal;">
										<strong>(f)</strong>
										<br/> Approved modifications (if applicable)<br/> 
									</th>
									<th class="styTableCellHeader" scope="col" rowspan="2" style="width:28mm;font-weight:normal;">
										<strong>(g)</strong>
										<br/>Reviewed year adjustments net of<br/>approved modifications
									</th>
									<th class="styTableCellHeader" scope="col" rowspan="2" style="width:28mm;font-weight:normal;border-right-width:0px;">
										<strong>(h)</strong>
										<br/>As corrected (column(d) combined with column(g)) <br/>
									</th>
								</tr>
								<tr>
									<th class="styTableCellHeader" style="width:10mm;font-weight:normal;">
										<strong>(a)</strong>
										<br/> Line <br/> number
									</th>
									<th class="styTableCellHeader" style="width:40mm;font-weight:normal;">
										<strong>(b)</strong>
										<br/> Line title 
									</th>
									<th class="styTableCellHeader" style="width:10mm;font-weight:normal;">
										<strong>(c)</strong>
										<br/> Code* 
									</th>
									<th class="styTableCellHeader" style="width:28mm;font-weight:normal;">
										<strong>(d)</strong>
										<br/> As reported 
									</th>
								</tr>
							</thead>
							<tbody style="font-size:6pt;">
								<xsl:if test="not($shouldSeparatePart5)">
									<xsl:for-each select="$FormData/PartnerReviewedYearIncomeGrp">
										<tr style="vertical-align:bottom;border-style:1px solid blue;">
											<td class="styTableCellCtrInherit">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="IncomeLineNum"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellTextInherit">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="IncomeLineTitleTxt"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellCtrInherit">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="IncomeCd"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellAmtInherit">
											<span style="padding-left:1mm;">$</span>
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="IncomeAsReportedAmt"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellCtrInherit">
												<input class="styCkbox" type="checkbox">
													<xsl:attribute name="alt">Row <xsl:value-of select="AlphaRowId"/> Income Stmt Attached Ind</xsl:attribute>
													<xsl:call-template name="PopulateCheckbox">
														<xsl:with-param name="TargetNode" select="IncomeStmtAttachedInd"/>
														<xsl:with-param name="BackupName">
														IRS8986IncomeStmtAttachedInd<xsl:value-of select="position()"/>
														</xsl:with-param>
													</xsl:call-template>
												</input>
											</td>
											<td class="styTableCellAmtInherit">
											<span style="padding-left:1mm;">$</span>
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="IncomeApprovedModifAmt"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellAmtInherit">
											<span style="padding-left:1mm;">$</span>
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="IncomeReviewedYrAdjAmt"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellAmtInherit" style="border-right-width:0px;">
											<span style="padding-left:1mm;">$</span>
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="AsCorrectedAmt"/>
												</xsl:call-template>
											</td>
										</tr>
									</xsl:for-each>
								</xsl:if>
								<xsl:if test="$shouldSeparatePart5 or count($FormData/PartnerReviewedYearIncomeGrp) &lt; 14">
									<xsl:call-template name="FillTable8Cols">
										<xsl:with-param name="LineNumber" select="1 + count($FormData/PartnerReviewedYearIncomeGrp)"/>
										<xsl:with-param name="SepMessage" select="$shouldSeparatePart5"/>
									</xsl:call-template>
								</xsl:if>
							</tbody>
						</table>
					</div>
					<xsl:if test="not($shouldSeparatePart5)">
						<xsl:call-template name="SetInitialDynamicTableHeight">
							<xsl:with-param name="TargetNode" select="$FormData/PartnerReviewedYearIncomeGrp"/>
							<xsl:with-param name="containerID" select=" 'Part5Table' "/>
							<xsl:with-param name="headerHeight" select="2"/>
							<xsl:with-param name="containerHeight" select="14"/>
						</xsl:call-template>
					</xsl:if>
					<div class="styStdDiv" style="width:187mm;">
						<div class="sty8986LeftCell" style="height:10mm;font-size:7pt;width:103.1mm;padding-top:1mm;padding-bottom:1mm;border-bottom-width:2px;">
							See instructions
							<span style="float:right;font-size:9pt;padding-right:2mm;">Totals: </span>
						</div>
						<div class="sty8986LeftCell" style="height:10mm;font-size:7pt;width:28mm;padding-top:5mm;padding-bottom:1mm;border-bottom-width:2px;float:left;text-align:right;padding-right:1.5mm;">
						<span style="padding-left:1mm;">$</span>
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TotPartnerIncomeApprvModifAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty8986LeftCell" style="height:10mm;font-size:7pt;width:28mm;padding-top:5mm;padding-bottom:1mm;padding-left:1mm;border-bottom-width:2px;text-align:right;padding-right:1.5mm;">
						<span style="padding-left:1mm;">$</span>
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TotPartnerIncmReviewedYrAdjAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty8986LeftCell" style="height:10mm;font-size:7pt;width:27.9mm;padding-top:5mm;padding-bottom:1mm;border-right-width:0px;padding-left:1mm;border-bottom-width:2px;text-align:right;padding-right:1.5mm;">
						<span style="padding-left:1mm;">$</span>
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TotPartnerAsCorrectedAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Part V - Table 1 - End -->
					<!-- Applicable Penalties -->
					<!-- Part V - Table 2 - Begin -->
					<xsl:variable name="shouldSeparatePart5Table2" select="($Print = $Separated) and (count($FormData/ApplicablePenaltiesGrp) &gt; 5)"/>
					<div class="styStdDiv" id="Part5Table2">
						<xsl:call-template name="SetInitialState"/>
						<table class="styTable" style="border-collapse:collapse;font-size:7pt;">
							<thead class="styTableThead">
								<tr>
									<th class="styTableCellHeader" scope="colgroup" colspan="8" style="height:7mm;width:auto;border-right-width:0px;font-size:9pt;">Applicable Penalties</th>
								</tr>
								<tr>
									<th class="styTableCellHeader" scope="col" style="width:14mm;font-weight:normal;">
										Penalty
									</th>
									<th class="styTableCellHeader" scope="col" style="width:34mm;font-weight:normal;">
										(a)<br/>Internal Revenue<br/>Code section
									</th>
									<th class="styTableCellHeader" scope="col" style="width:52mm;font-weight:normal;">
										(b)<br/>Penalty description
									</th>
									<th class="styTableCellHeader" scope="col" style="width:30mm;font-weight:normal;">
										(c)<br/>Penalty rate
									</th>
									<th class="styTableCellHeader" scope="col" style="width:28mm;font-weight:normal;">
										(d)<br/>Applicable line numbers above
									</th>
									<th class="styTableCellHeader" scope="col" style="width:29mm;font-weight:normal;border-right-width:0px;">
										(e)<br/>Total applicable adjustments 
									</th>
								</tr>
							</thead>
							<tbody style="font-size:6pt;">
								<xsl:if test="not($shouldSeparatePart5Table2)">
									<xsl:for-each select="$FormData/ApplicablePenaltiesGrp">
										<tr style="height:8mm;vertical-align:bottom;">
											<td class="styTableCell" style="width:14.5mm;font-weight:bold;text-align:center;">
												<xsl:number format="1" value="position()"/>
											</td>
											<td class="styTableCellTextInherit" style="width:42mm;text-align:left;padding-left:2mm;">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="IRCSectionTxt"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellTextInherit">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="PenaltyDesc"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellAmtInherit">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="PenaltyRt"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellTextInherit">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="ApplicableIncomeLineNum"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellAmtInherit" style="border-right-width:0px;">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="TotalApplicableAdjustmentsAmt"/>
												</xsl:call-template>
											</td>
										</tr>
									</xsl:for-each>
								</xsl:if>
								<xsl:if test="$shouldSeparatePart5Table2 or count($FormData/ApplicablePenaltiesGrp) &lt; 5">
									<xsl:call-template name="fillTable6Cols">
										<xsl:with-param name="LineNumber" select="1 + count($FormData/ApplicablePenaltiesGrp)"/>
										<xsl:with-param name="SepMessage" select="$shouldSeparatePart5Table2"/>
									</xsl:call-template>
								</xsl:if>
							</tbody>
						</table>
					</div>
					<xsl:if test="not($shouldSeparatePart5Table2)">
						<xsl:call-template name="SetInitialDynamicTableHeight">
							<xsl:with-param name="TargetNode" select="$FormData/ApplicablePenaltiesGrp"/>
							<xsl:with-param name="containerID" select=" 'Part5Table2' "/>
							<xsl:with-param name="headerHeight" select="2"/>
							<xsl:with-param name="containerHeight" select="5"/>
						</xsl:call-template>
					</xsl:if>
					<!-- Part V - Table 2 - End -->
					<!-- End of Part V -->
										<div class="pageEnd" style="width:187mm;border-top:1px solid black;">
						<div style="float:right;clear:none;">
							<span style="width:50mm;text-align:right;"> Form <span style="font-size:9pt;">
									<b>8986</b>
								</span> (12-2024)</span>
						</div>
					</div>
					<!-- End of page 2 -->
					<!-- Begin of page 3 -->
					<div class="styStdDiv">
						Form 8986 (12-2024)
						<span style="float:right;">Page <span style="font-weight:bold;font-size:8pt;">3</span>
						</span>
					</div>
					<!-- ************************** PART VI START ************************** -->
					<!-- Part VI - Statements. Enter the Part V line number and code before each statement. Show any computation in detail. See instructions. If more space is needed, continue statements on additional pages. -->
					<div class="styStdDiv" style="width:187mm;height:9mm;border-bottom:1px solid black;border-top:2px solid black;">
						<div class="styPartName" style="height:5mm;font-size:10pt;font-family:arial;
text-align:center;padding-top:.5mm">Part VI</div>
						<div class="styPartDesc" style="font-size:9pt;padding-top:.3mm;font-family:arial;bor-style:solid;font-weight:normal;">
						<b>	Statements. </b>Enter the Part V line number and code before each statement. Show any computation in detail. See instructions. If more space is needed, continue statements on additional pages.
						</div>
					</div>
					<!-- Part VI - Begin -->
					<xsl:variable name="shouldSeparatePart6" select="($Print = $Separated) and (count($FormData/StatementsGrp) &gt; 1)"/>
					<div class="styStdDiv" id="Part6Table">
						<xsl:call-template name="SetInitialState"/>
						<table class="styTable" style="border-collapse:collapse;font-size:7pt;">
							<thead class="styTableThead">
								<tr>
									<th class="styTableCellHeader" style="width:37mm;height:10mm;font-weight:normal;">
										(a)<br/> Line no./code<br/>
									</th>
									<th class="styTableCellHeader" style="width:150mm;font-weight:normal;border-right-width:0px;">
										(b)<br/> Statement<br/>
									</th>
								</tr>
							</thead>
							<tbody style="font-size:6pt;">
								<xsl:if test="not($shouldSeparatePart6)">
									<xsl:for-each select="$FormData/StatementsGrp">
										<tr>
											<td class="styTableCellTextInherit" style="border-bottom:1px dashed black;border-right-width:1px;">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="LineNum"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellTextInherit" style="border-right-width:0px;">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="ExplanationTxt"/>
												</xsl:call-template>
											</td>
										</tr>
									</xsl:for-each>
								</xsl:if>
								<xsl:if test="$shouldSeparatePart6 or count($FormData/StatementsGrp) &lt; 1">
									<xsl:call-template name="fillTable2Cols">
										<xsl:with-param name="LineNumber" select="1 + count($FormData/StatementsGrp)"/>
										<xsl:with-param name="SepMessage" select="$shouldSeparatePart6"/>
									</xsl:call-template>
								</xsl:if>
							</tbody>
						</table>
					</div>
					<!-- Part VI - End -->
					<div class="pageEnd" style="width:187mm;border-top:1px solid black;margin-bottom:0mm;">
						<div style="float:right;clear:none;">
							<span style="width:50mm;text-align:right;"> Form <span style="font-size:9pt;">
									<b>8986</b>
								</span> (12-2024)</span>
						</div>
					</div>
					<!-- End of page 3 -->
					<!-- Additional Data title bar and button -->
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
					<!-- Part 5 Separated Table 1 -->
					<xsl:if test="$shouldSeparatePart5">
						<br/>
						<br/>
						<span class="styRepeatingDataTitle">Part V - Table 1 - Partners' Total Reviewed Year Income, Gain, Loss, Deduction, Credits, and Other Items (Fill in applicable items anduse Part V to explain any changes.)</span>
						<br/>
						<table class="styDepTbl" cellspacing="0" style="font-size:7pt;">
							<thead class="styTableThead">
								<tr class="styDepTblHdr">
									<th scope="col" class="styDepTblCell" style="width:30mm;" rowspan="1" colspan="4">
                                        Schedule K-1 
                                    </th>
									<th class="styDepTblCell" scope="col" rowspan="3" style="width:15mm;font-weight:normal;">
										<strong>(e)</strong>
										<br/> Check if<br/>statement<br/>in Part VI.<br/> See Inst.
                                    </th>
									<th class="styDepTblCell" scope="col" rowspan="3" style="width:28mm;font-weight:normal;">
										<strong>(f)</strong>
										<br/> Reviewed year<br/>adjustments as<br/> finally determined
                                    </th>
									<th class="styDepTblCell" scope="col" rowspan="2" style="width:28mm;font-weight:normal;">
										<strong>(g)</strong>
										<br/>Approved<br/>modifications
                                    </th>
									<th class="styDepTblCell" scope="col" rowspan="2" style="width:28mm;font-weight:normal;border-right-width:0px;">
										<strong>(h)</strong>
										<br/>Net (columns (f) <br/>minus column (g))
                                    </th>
								</tr>
								<tr class="styDepTblHdr">
									<th class="styDepTblCell" style="width:10mm;font-weight:normal;">
										<strong>(a)</strong>
										<br/> Line <br/> number  
                                    </th>
									<th class="styDepTblCell" style="width:40mm;font-weight:normal;">
										<strong>(b)</strong>
										<br/> Line title 
                                    </th>
									<th class="styDepTblCell" style="width:10mm;font-weight:normal;">
										<strong>(c)</strong>
										<br/> Code* 
                                    </th>
									<th class="styDepTblCell" style="width:28mm;font-weight:normal;">
										<strong>(d)</strong>
										<br/> As reported 
                                    </th>
								</tr>
							</thead>
							<tbody>
								<xsl:for-each select="$FormData/PartnerReviewedYearIncomeGrp">
									<tr style="height:7mm;vertical-align:bottom;">
										<xsl:attribute name="class">
											<xsl:choose>
												<xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when>
												<xsl:otherwise>styDepTblRow2</xsl:otherwise>
											</xsl:choose>
										</xsl:attribute>
										<td class="styTableCellCtrInherit">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="IncomeLineNum"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellTextInherit">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="IncomeLineTitleTxt"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellTextInherit">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="IncomeCd"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellAmtInherit">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="IncomeAsReportedAmt"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellCtrInherit">
											<input class="styCkbox" type="checkbox">
												<xsl:attribute name="alt">Row <xsl:value-of select="AlphaRowId"/> Income Stmt Attached Ind</xsl:attribute>
												<xsl:call-template name="PopulateCheckbox">
													<xsl:with-param name="TargetNode" select="IncomeStmtAttachedInd"/>
													<xsl:with-param name="BackupName">IRS8986IncomeStmtAttachedInd<xsl:value-of select="position()"/>
													</xsl:with-param>
												</xsl:call-template>
											</input>
										</td>
										<td class="styTableCellAmtInherit">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="IncomeReviewedYrAdjAmt"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellAmtInherit">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="IncomeApprovedModifAmt"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellAmtInherit" style="border-right-width:0px;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="IncomeRvwYrAdjNetModifAmt"/>
											</xsl:call-template>
										</td>
									</tr>
								</xsl:for-each>
							</tbody>
						</table>
					</xsl:if>
					<!-- Part 5 Separated Table 2 -->
					<xsl:if test="$shouldSeparatePart5Table2">
						<br/>
						<br/>
						<span class="styRepeatingDataTitle">Part V - Table 2 - Applicable Penalties</span>
						<br/>
						<table class="styDepTbl" cellspacing="0" style="font-size:7pt;">
							<thead class="styTableThead">
								<tr class="styDepTblHdr">
									<th class="styDepTblCell" scope="colgroup" colspan="8" style="height:7mm;width:auto;border-right-width:0px;font-size:9pt;">Applicable Penalties</th>
								</tr>
								<tr class="styDepTblHdr">
									<th class="styDepTblCell" scope="col" style="width:15mm;font-weight:normal;">
                                        Penalty
                                    </th>
									<th class="styDepTblCell" scope="col" style="width:30mm;font-weight:normal;">
                                        (a)<br/>Internal Revenue<br/>Code section
                                    </th>
									<th class="styDepTblCell" scope="col" style="width:52mm;font-weight:normal;">
										(b)<br/>Penalty description
                                    </th>
									<th class="styDepTblCell" scope="col" style="width:31mm;font-weight:normal;">
                                        (c)<br/>Penalty rate
                                    </th>
									<th class="styDepTblCell" scope="col" style="width:29mm;font-weight:normal;">
                                        (d)<br/>Applicable line numbers above
                                    </th>
									<th class="styDepTblCell" scope="col" style="width:30mm;font-weight:normal;border-right-width:0px;">
                                        (e)<br/>Total applicable adjustments 
                                    </th>
								</tr>
							</thead>
							<tbody>
								<xsl:for-each select="$FormData/ApplicablePenaltiesGrp">
									<tr style="height:8mm;vertical-align:bottom;">
										<xsl:attribute name="class">
											<xsl:choose>
												<xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when>
												<xsl:otherwise>styDepTblRow2</xsl:otherwise>
											</xsl:choose>
										</xsl:attribute>
										<td class="styTableCell" style="width:14.5mm;font-weight:bold;text-align:center;">
											<xsl:number format="1" value="position()"/>
										</td>
										<td class="styTableCellTextInherit" style="width:42mm;text-align:left;padding-left:2mm;">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="IRCSectionTxt"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellTextInherit">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="PenaltyDesc"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellTextInherit">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="PenaltyRt"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellTextInherit">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="ApplicableIncomeLineNum"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellAmtInherit" style="border-right-width:0px;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="TotalApplicableAdjustmentsAmt"/>
											</xsl:call-template>
										</td>
									</tr>
								</xsl:for-each>
							</tbody>
						</table>
					</xsl:if>
					<!-- Part 6 Separated Table -->
					<xsl:if test="$shouldSeparatePart6">
						<br/>
						<br/>
						<span class="styRepeatingDataTitle">Part VI - Statements</span>
						<br/>
						<table class="styDepTbl" cellspacing="0" style="font-size:7pt;">
							<thead class="styTableThead">
								<tr class="styDepTblHdr">
									<th class="styDepTblCell" style="width:37mm;height:10mm;font-weight:normal;">
                                        (a)<br/> Line no./code<br/>
									</th>
									<th class="styDepTblCell" style="width:150mm;font-weight:normal;border-right-width:0px;">
                                        (b)<br/> Statement<br/>
									</th>
								</tr>
							</thead>
							<tbody>
								<xsl:for-each select="$FormData/StatementsGrp">
									<tr>
										<xsl:attribute name="class">
											<xsl:choose>
												<xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when>
												<xsl:otherwise>styDepTblRow2</xsl:otherwise>
											</xsl:choose>
										</xsl:attribute>
										<td class="styTableCellTextInherit" style="border-bottom:1px dashed black;border-right-width:1px;">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="LineNum"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellTextInherit" style="border-right-width:0px;">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="ExplanationTxt"/>
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
	<xsl:template name="FillTable8Cols">
		<xsl:param name="LineNumber"/>
		<xsl:param name="SepMessage" select="false()"/>
		<xsl:param name="MaxLine" select="14"/>
		<tr style="height:7mm;vertical-align:bottom;">
			<td class="styTableCellCtrInherit">
				<xsl:choose>
					<xsl:when test="$SepMessage">
					See Additional <br/> Data Table
				</xsl:when>
					<xsl:otherwise>&nbsp;</xsl:otherwise>
				</xsl:choose>
			</td>
			<td class="styTableCellCtrInherit">&nbsp;</td>
			<td class="styTableCellTextInherit">&nbsp;</td>
			<td class="styTableCellCtrInherit">&nbsp;</td>
			<td class="styTableCellCtrInherit">
				<input class="styCkbox" type="checkbox" alt="IRS8986 Empty Income Stmt Attached Indicator">
					<xsl:call-template name="PopulateCheckbox">
						<xsl:with-param name="TargetNode" select="/.."/>
						<xsl:with-param name="BackupName">
							<xsl:value-of select="$LineNumber"/>
						</xsl:with-param>
					</xsl:call-template>
				</input>
			</td>
			<td class="styTableCellAmtInherit">&nbsp;</td>
			<td class="styTableCellAmtInherit">&nbsp;</td>
			<td class="styTableCellAmtInherit" style="border-right-width:0px;">&nbsp;</td>
		</tr>
		<xsl:choose>
			<xsl:when test="$SepMessage">
				<xsl:call-template name="FillTable8Cols">
					<xsl:with-param name="LineNumber" select="2"/>
					<xsl:with-param name="SepMessage" select="false()"/>
				</xsl:call-template>
			</xsl:when>
			<xsl:when test="$LineNumber &lt; $MaxLine">
				<xsl:call-template name="FillTable8Cols">
					<xsl:with-param name="LineNumber" select="$LineNumber + 1"/>
					<xsl:with-param name="MaxLine" select="$MaxLine"/>
				</xsl:call-template>
			</xsl:when>
			<xsl:otherwise/>
		</xsl:choose>
	</xsl:template>
	<xsl:template name="fillTable6Cols">
		<xsl:param name="LineNumber"/>
		<xsl:param name="SepMessage" select="false()"/>
		<xsl:param name="MaxLine" select="5"/>
		<tr style="height:7mm;vertical-align:bottom;">
			<td class="styTableCellCtrInherit" style="font-weight:bold;">
				<xsl:choose>
					<xsl:when test="$SepMessage">
                    See Additional <br/> Data Table
				</xsl:when>
					<xsl:otherwise>
						<xsl:number format="1" value="$LineNumber"/>
					</xsl:otherwise>
				</xsl:choose>
			</td>
			<td class="styTableCellCtrInherit">&nbsp;</td>
			<td class="styTableCellTextInherit">&nbsp;</td>
			<td class="styTableCellTextInherit">&nbsp;</td>
			<td class="styTableCellTextInherit">&nbsp;</td>
			<td class="styTableCellAmtInherit" style="border-right-width:0px;">&nbsp;</td>
		</tr>
		<xsl:choose>
			<xsl:when test="$SepMessage">
				<xsl:call-template name="fillTable6Cols">
					<xsl:with-param name="LineNumber" select="2"/>
					<xsl:with-param name="SepMessage" select="false()"/>
				</xsl:call-template>
			</xsl:when>
			<xsl:when test="$LineNumber &lt; $MaxLine">
				<xsl:call-template name="fillTable6Cols">
					<xsl:with-param name="LineNumber" select="$LineNumber + 1"/>
					<xsl:with-param name="MaxLine" select="$MaxLine"/>
				</xsl:call-template>
			</xsl:when>
			<xsl:otherwise/>
		</xsl:choose>
	</xsl:template>
	<xsl:template name="fillTable2Cols">
		<xsl:param name="LineNumber"/>
		<xsl:param name="SepMessage" select="false()"/>
		<xsl:param name="MaxLine" select="1"/>
		<tr style="height:7mm;vertical-align:bottom;">
			<td class="styTableCellCtrInherit">
				<xsl:choose>
					<xsl:when test="$SepMessage">
                    See Additional <br/> Data Table
				</xsl:when>
					<xsl:otherwise>&nbsp;</xsl:otherwise>
				</xsl:choose>
			</td>
			<td class="styTableCellAmtInherit" style="border-right-width:0px;">&nbsp;</td>
		</tr>
		<xsl:choose>
			<xsl:when test="$SepMessage">
				<xsl:call-template name="fillTable2Cols">
					<xsl:with-param name="LineNumber" select="2"/>
					<xsl:with-param name="SepMessage" select="false()"/>
				</xsl:call-template>
			</xsl:when>
			<xsl:when test="$LineNumber &lt; $MaxLine">
				<xsl:call-template name="fillTable2Cols">
					<xsl:with-param name="LineNumber" select="$LineNumber + 1"/>
					<xsl:with-param name="MaxLine" select="$MaxLine"/>
				</xsl:call-template>
			</xsl:when>
			<xsl:otherwise/>
		</xsl:choose>
	</xsl:template>
</xsl:stylesheet>
