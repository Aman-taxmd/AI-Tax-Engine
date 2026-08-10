<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE xsl:stylesheet [
	<!ENTITY nbsp "&#160;"> 
	<!ENTITY mdash "&#8212;"> 
]>
<!-- Last Modified by Iskilu Lawal on 3/26/2025 drop 1 UWR # 999210 -->
<!-- Last Modified by Fahd Saleem on 5/05/2025 drop 1 UWR # 992775 -->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:include href="PopulateTemplate.xsl"/>
	<xsl:include href="AddHeader.xsl"/>
	<xsl:include href="CommonPathRef.xsl"/>
	<xsl:include href="AddOnTable.xsl"/>
	<xsl:include href="IRS8985Style.xsl"/>
	<xsl:output method="html" indent="yes"/>
	<xsl:strip-space elements="*"/>
	<xsl:param name="FormData" select="$RtnDoc/IRS8985"/>
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
				<meta name="Description" content="IRS Form 8985"/>
				<script language="JavaScript" src="{$ScriptPath}/FormDisplay.js" type="text/javascript"/>
				<xsl:call-template name="InitJS"/>
				<style type="text/css">
					<!--<xsl:if test="not($Print) or $Print=''">-->
					<xsl:call-template name="AddOnStyle"/>
					<xsl:call-template name="IRS8985Style"/>
					<!--</xsl:if>-->
				</style>
				<xsl:call-template name="GlobalStylesForm"/>
			</head>
			<body class="styBodyClass">
				<form id="Form8985">
					<xsl:call-template name="DocumentHeader"/>
					<!-- Page 1 -->
					<!-- Header -->
					<div class="styStdDiv">
						<div class="styFNBox" style="width:31mm;height:21mm;border-right-width:2px;">
							Form <span class="styFN" style="font-size:16pt;">8985</span>
							<div style="padding-top:1.8mm;font-size:7pt;">(December 2024)</div>
							<br/>
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$FormData"/>
							</xsl:call-template>
							<br/>
							<div class="styAgency" style="padding-top:.mm;">Department of the Treasury
								<br/>Internal Revenue Service
							</div>
						</div>
						<div class="styFTBox" style="width:127mm;height:21mm;">
							<span class="styFMT" style="font-size:11pt;">Pass-Through Statement &mdash; Transmittal/Partnership<br/>	Adjustment Tracking Report</span>
							<br/>
							<span style="font-size:10pt;">
								(Required Under Sections 6226 and 6227)
							</span>
							<br/>
							<span style="padding-top:2mm;">
								Go to
								<span style="font-style:italic;">www.irs.gov/Form8985</span>
								for instructions and the latest information.
							</span>
						</div>
						<div class="styOMB" style="width:28mm;height:21mm;border-left-width:2px;padding-top: 9mm;border-bottom-width: 0px;text-align:center;">  
							OMB No. 1545-0123
						</div>
					</div>
					<div class="styStdDiv" style="border-top:2px solid black;">
						<div style="float:left;width:67mm;min-height:6mm;border-right:.5px solid black;">
							<span style="font-size:8pt">Check if this form is: </span>
							<br/>
							<input type="Checkbox" class="styCkboxNM" alt="Original">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$FormData/OriginalFilingInd"/>
									<xsl:with-param name="BackupName">IRS8985OriginalFilingInd</xsl:with-param>
								</xsl:call-template>
							</input>
							<span style="width:3px;"/>
							<span>1. Original</span>
							<span style="width:8px;"/>
							<input type="Checkbox" class="styCkboxNM" alt="Corrected">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$FormData/CorrectedFilingInd"/>
									<xsl:with-param name="BackupName">IRS8985CorrectedFilingInd</xsl:with-param>
								</xsl:call-template>
							</input>
							<span style="width:3px;"/>
							<span>2. Corrected</span>
							<span style="width:8px;"/>
							<input type="Checkbox" disabled="disabled" alt="Reserved">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="/.."/>
									<xsl:with-param name="BackupName">IRS8985ReservedDisabledCheckbox</xsl:with-param>
								</xsl:call-template>
							</input>
							3. Reserved
						</div>
						<div style="float:left;width:42mm;min-height:8.5mm;padding-top:0.5mm;padding-left:0.5mm;border-right:.5px solid black;font-size:8pt">
							Incoming Tracking Number <br/>
							<span class="sty8985AmountSpan" style="text-align:center;">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$FormData/AARIncomingTrackingNum"/>
								</xsl:call-template>
							</span>
						</div>
						<div style="float:left;width:42mm;min-height:8.5mm;padding-top:0.5mm;padding-left:0.5mm;border-right:.5px solid black;font-size:8pt">
							Outgoing Tracking Number <br/>
							<span class="sty8985AmountSpan" style="text-align:center;">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$FormData/AAROutgoingTrackingNum"/>
								</xsl:call-template>
							</span>
						</div>
						<div style="float:left;width:35mm;min-height:6mm;padding-top:0.5mm;padding-left:0.5mm;font-size:8pt">
							Audit Control Number <br/>
						</div>
					</div>
					<!-- ************************** PART I START ************************** -->
					<!-- Part I - Information About Entity Submitting This Form -->
					<div class="styStdDiv" style="border-top:1px solid black; border-bottom:1px solid black;">
						<div class="styPartName" style="font-size:10pt;padding-bottom:4.5mm;font-family:arial;text-align:center;padding-top:.5mm">Part I</div>
						<div class="styPartDesc" style="font-size:10pt;padding-bottom:4.5mm;padding-top:.3mm">
							Information About Entity Submitting This Form
						</div>
					</div>
					<div class="styGenericDiv">
						<!-- Part I - A -->
						<div class="sty8985LeftCell" style="border-right:.5px solid black;padding-bottom: 2mm;">
							<div class="styLNLeftLtrBox" style="padding-left:0;font-weight:normal;width:5mm;font-size:9pt;">A</div>
							<div class="styLNDesc" style="width:87mm;font-size:7.85pt;">
								Check the box to indicate which entity is submitting this form. 
							</div>
							<span style="width:98mm;">
								<input type="Checkbox" class="styCkboxNM" alt="AuditedPBBAInd">
									<xsl:call-template name="PopulateCheckbox">
										<xsl:with-param name="TargetNode" select="/.."/>
										<xsl:with-param name="BackupName">IRS8985AuditedPBBAInd</xsl:with-param>
									</xsl:call-template>								
								</input>
								1. Audited BBA partnership <br/>
								<input type="Checkbox" class="styCkboxNM" alt="PassThroughPartnerInd">
									<xsl:call-template name="PopulateCheckbox">
										<xsl:with-param name="TargetNode" select="/.."/>
										<xsl:with-param name="BackupName">IRS8985PassThroughPartnerInd</xsl:with-param>
									</xsl:call-template>	
								</input>
								2. Pass-through partner (direct or indirect) of an audited BBA partnership<br/>
								<input type="Checkbox" class="styCkboxNM" alt="BBAAARInd">
									<xsl:call-template name="PopulateCheckbox">
										<xsl:with-param name="TargetNode" select="$FormData/BBAAARInd"/>
										<xsl:with-param name="BackupName">IRS8985BBAARInd</xsl:with-param>
									</xsl:call-template>
								</input>
								3. BBA partnership that filed an administrative adjustment request(AAR)<br/>
								<input type="Checkbox" class="styCkboxNM" alt="PassThroughPartnerAARInd">
									<xsl:call-template name="PopulateCheckbox">
										<xsl:with-param name="TargetNode" select="$FormData/PassThroughPartnerAARInd"/>
										<xsl:with-param name="BackupName">IRS8985PassThroughPartnerAARInd</xsl:with-param>
									</xsl:call-template>
								</input>
								<span style="font-family:Arial;margin-left:1mm;"> 4. Pass-through partner (direct or indirect) of a BBA partnership that filed an AAR</span>
								<br/>
							</span>
						</div>
						<!-- Part I - B -->
						<div class="sty8985RightCell" style="padding-bottom: 1mm;">
							<div class="styLNLeftLtrBox" style="padding-left:1mm;width:5mm;font-weight:normal;font-size:9pt">B</div>
							<div class="styLNDesc" style="width:82mm;font-size:7.85pt;">
								Type of return filed by the entity that submitted this form:
							</div>
							<span style="padding-left:5mm;">
								<input type="Checkbox" class="styCkboxNM" alt="Form1065Ind">
									<xsl:call-template name="PopulateCheckbox">
										<xsl:with-param name="TargetNode" select="$FormData/Form1065Ind"/>
										<xsl:with-param name="BackupName">IRS8985Form1065Ind</xsl:with-param>
									</xsl:call-template>
								</input>
								1. Form 1065
								<span style="width:15px;"/>
								<input type="Checkbox" class="styCkboxNM" alt="Form1120SInd">
									<xsl:call-template name="PopulateCheckbox">
										<xsl:with-param name="TargetNode" select="$FormData/Form1120SInd"/>
										<xsl:with-param name="BackupName">IRS8985Form1120SInd</xsl:with-param>
									</xsl:call-template>
								</input>
								2. Form 1120-S
								<span style="width:15px;"/>
								<input type="Checkbox" class="styCkboxNM" alt="Form1041Ind">
									<xsl:call-template name="PopulateCheckbox">
										<xsl:with-param name="TargetNode" select="$FormData/Form1041Ind"/>
										<xsl:with-param name="BackupName">IRS8985Form1041Ind</xsl:with-param>
									</xsl:call-template>
								</input>
								3. Form 1041
								<br/>
								<input type="Checkbox" class="styCkboxNM" alt="Other">
									<xsl:call-template name="PopulateCheckbox">
										<xsl:with-param name="TargetNode" select="$FormData/OtherReturnGrp/OtherReturnInd"/>
										<xsl:with-param name="BackupName">IRS8985OtherReturnInd</xsl:with-param>
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
						<!-- Part I - C -->
						<div class="sty8985RightCell" style="padding-bottom: 3.7mm;height:8.2mm;">
							<div class="styLNLeftLtrBox" style="padding-left:1mm;width:5mm;font-weight:normal;font-size:9pt">C</div>
							<div class="styLNDesc" style="width:82mm;font-size:7.85pt;">
								Number of Forms 8986 submitted with this Form 8985
							</div>
							<span class="sty8985AmountSpan" style="width:82mm;">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$FormData/Total8986SubmittedWith8985Cnt"/>
								</xsl:call-template>
							</span>
						</div>
						<!-- Part I - D -->
						<div class="sty8985LeftCell" style="height:8.5mm;border-right:.5px solid black;">
							<div class="styLNLeftLtrBox" style="padding-left:0;font-weight:normal;width:5mm;font-size:9pt;">D</div>
							<div class="styLNDesc" style="width:87mm;font-size:7.85pt;">
								Check if this form is the summary of all Forms 8985 for this 
								<br/>outgoing tracking number 
								<span style="padding-left:3mm;padding-top:0mm;">
									<input type="Checkbox" class="styCkboxNM" alt="SummaryForm8985Ind">
										<xsl:call-template name="PopulateCheckbox">
											<xsl:with-param name="TargetNode" select="/.."/>
											<xsl:with-param name="BackupName">IRS8985SummaryForm8985Ind</xsl:with-param>
										</xsl:call-template>									
									</input>
								</span>
							</div>
						</div>
						<!-- Part I - E -->
						<div class="sty8985RightCell" style="padding-bottom: 0.6mm;height:8.5mm;">
							<div class="styLNLeftLtrBox" style="padding-left:1mm;width:5mm;font-weight:normal;font-size:9pt">E</div>
							<div class="styLNDesc" style="width:80mm;font-size:7.85pt;">
                                This Form 8985 is number _________ of _________ for this outgoing tracking number.
							</div>
						</div>
					</div>
					<!-- Part I - End -->
					<!-- ************************** PART II START ************************** -->
					<!-- Part II - Information About the Audited Partnership or Partnership That Filed an Administrative Adjustment Request -->
					<div class="styStdDiv" style="border-bottom:1px solid black;">
						<div class="styPartName" style="font-size:10pt;padding-bottom:4.5mm;font-family:arial;
text-align:center;padding-top:.5mm">Part II</div>
						<div class="styPartDesc" style="font-size:9pt;padding-bottom:4.5mm;padding-top:.3mm;font-family:arial;">
							Information About the Audited Partnership or Partnership That Filed an Administrative Adjustment Request
						</div>
					</div>
					<div class="styGenericDiv">
						<!-- Part II - A -->
						<div class="sty8985LeftCell" style="width:119mm;border-right-width: 0px;">
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
										<!-- No country code for US Address -->
										&nbsp;
									</div>
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
									<div class="styNameAddr" style="font-size:7pt;height:6mm;width:50mm;border-right:.5px solid black;border-bottom-width: 0px;">
										4. State or province
										<br/>
										<xsl:call-template name="PopulateReturnHeaderFiler">
											<xsl:with-param name="TargetNode">ProvinceOrStateNm</xsl:with-param>
										</xsl:call-template>
									</div>
									<div class="styNameAddr" style="font-size:6pt;height:6mm;width:25mm;border-right:.5px solid black;border-bottom-width: 0px;">
										5. Country code
										<br/>
										<xsl:call-template name="PopulateReturnHeaderFiler">
											<xsl:with-param name="TargetNode">CountryCd</xsl:with-param>
										</xsl:call-template>
									</div>
									<div class="styNameAddr" style="font-size:7pt;height:6mm;width:40mm;border-right-width: 0.5px;border-bottom-width: 0px;">
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
						<div class="sty8985RightCell" style="width:68mm;height:14mm;padding-bottom: 2mm;border-bottom:.5px solid black;">
							<div class="styLNLeftLtrBox" style="width:15mm;height:14mm;padding-left:1mm;font-weight:normal;width:5mm;font-size:9pt;">C</div>
							<div class="styNameAddr" style="font-size:7pt;height:14mm;width:63mm;padding-top:1mm;border-right-width: 0px;border-bottom-width: 0px;">
								Partnership's tax identification number (TIN)
								<span class="sty8985AmountSpan" style="width:63mm;text-align:center;">
									<xsl:call-template name="PopulateReturnHeaderFiler">
										<xsl:with-param name="EINChanged">true</xsl:with-param>
										<xsl:with-param name="TargetNode">EIN</xsl:with-param>
									</xsl:call-template>
								</span>
							</div>
						</div>
						<!-- Part II - D -->
						<div class="sty8985RightCell" style="width:68mm;height:14mm;padding-bottom: 2mm;border-bottom:.5px solid black;">
							<div class="styLNLeftLtrBox" style="width:15mm;height:14mm;padding-left:1mm;font-weight:normal;width:5mm;font-size:9pt;">D</div>
							<div class="styNameAddr" style="font-size:7pt;height:14mm;width:63mm;padding-top:1mm;border-right-width: 0px;border-bottom-width: 0px;">
								Review year of the partnership is for tax year ended (MM/DD/YYYY)
								<span class="sty8985AmountSpan" style="width:63mm;text-align:center;">
									<xsl:call-template name="PopulateMonthDayYear">
										<xsl:with-param name="TargetNode" select="$FormData/PrtshpReviewTaxYrEndDt"/>
									</xsl:call-template>
								</span>
							</div>
						</div>
						<!-- Part II - B -->
						<div class="sty8985LeftCell" style="width:119mm;border-right-width: 0px;">
							<div class="styLNLeftLtrBox" style="height:43mm;width:4mm;padding-left:0;font-weight:normal;font-size:9pt;">B</div>
							<div class="styNameAddr" style="height:11mm;font-size:7pt;width:115mm;padding-top:1mm;border-right-width: 0.5px;padding-bottom:1mm;">
								If the partnership representative (PR) is an individual, enter information about the PR. Otherwise, enter information about the designated individual (DI).
								<span>
									Check appropriate box. 
									<span style="width:15px;"/>
									<input type="Checkbox" class="styCkboxNM" alt="IndividualPartnershipRepInd">
										<xsl:call-template name="PopulateCheckbox">
											<xsl:with-param name="TargetNode" select="$FormData/IndividualPartnershipRepInd"/>
											<xsl:with-param name="BackupName">IRS8985IndividualPartnershipRepInd</xsl:with-param>
										</xsl:call-template>
									</input>
									PR
									<span style="width:15px;"/>
									<input type="Checkbox" class="styCkboxNM" alt="DesignatedIndividualInd">
										<xsl:call-template name="PopulateCheckbox">
											<xsl:with-param name="TargetNode" select="$FormData/DesignatedIndividualInd"/>
											<xsl:with-param name="BackupName">IRS8985DesignatedIndividualInd</xsl:with-param>
										</xsl:call-template>
									</input>
									DI
								</span>
							</div>
							<!-- Part II - B -->
							<div class="styNameAddr" style="font-size:7pt;height:8mm;width:57.5mm;border-right:.5px solid black;">
								1. First name<br/>
								<span class="sty8985AmountSpan" style="width:57.5mm;text-align:left;float:left;">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$FormData/PersonFullName/PersonFirstNm"/>
									</xsl:call-template>
								</span>
							</div>
							<div class="styNameAddr" style="font-size:7pt;height:8mm;width:57.5mm;border-right-width: 0.5px;">
								2. Last name<br/>
								<span class="sty8985AmountSpan" style="width:57.5mm;text-align:left;float:left;">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$FormData/PersonFullName/PersonLastNm"/>
									</xsl:call-template>
								</span>
							</div>
							<div class="styNameAddr" style="font-size:7pt;height:10mm;width:75mm;border-right:.5px solid black;">
								3. Street address
								<span class="sty8985AmountSpan" style="width:75mm;text-align:left;float:left;">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$FormData/PartnershipUSAddress/AddressLine1Txt"/>
									</xsl:call-template>
								</span>
								<span class="sty8985AmountSpan" style="width:75mm;text-align:left;float:left;">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$FormData/PartnershipUSAddress/AddressLine2Txt"/>
									</xsl:call-template>
								</span>
							</div>
							<div class="styNameAddr" style="font-size:7pt;height:10mm;width:40mm;border-right-width: 0.5px;">
								4. City or town
								<span class="sty8985AmountSpan" style="width:75mm;text-align:left;float:left;">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$FormData/PartnershipUSAddress/CityNm"/>
									</xsl:call-template>
								</span>
							</div>
							<div class="styNameAddr" style="font-size:7pt;height:7mm;width:75mm;border-right:.5px solid black;">
								5. State
								<span class="sty8985AmountSpan" style="width:75mm;text-align:left;float:left;">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$FormData/PartnershipUSAddress/StateAbbreviationCd"/>
									</xsl:call-template>
								</span>
							</div>
							<div class="styNameAddr" style="font-size:7pt;height:7mm;width:40mm;border-right-width: 0.5px;">
								6. ZIP code
								<span class="sty8985AmountSpan" style="width:75mm;text-align:left;float:left;">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$FormData/PartnershipUSAddress/ZIPCd"/>
									</xsl:call-template>
								</span>
							</div>
							<div class="styNameAddr" style="font-size:7pt;height:7mm;width:115mm;border-right:.5px solid black;border-bottom-width: 0px;">
								7. Area code and phone number<br/>
								<span class="sty8985AmountSpan" style="width:115mm;text-align:left;float:left;">
									<xsl:call-template name="PopulatePhoneNumber">
										<xsl:with-param name="TargetNode" select="$FormData/PrtshpPhoneNum"/>
									</xsl:call-template>
								</span>
							</div>
						</div>
						<!-- Part II - E  -->
						<div class="sty8985RightCell" style="width:68mm;height:11mm;padding-bottom: 2mm;border-bottom:.5px solid black;">
							<div class="styLNLeftLtrBox" style="width:15mm;height:11mm;padding-left:1mm;font-weight:normal;width:5mm;font-size:9pt;">E</div>
							<div class="styEINDateAssets" style="font-size:7pt;height:11mm;width:63mm;padding-top:1mm;border-right-width: 0px;border-bottom-width: 0px;">
								Adjustment year of the partnership is for tax year ended (MM/DD/YYYY)<br/>
								<span class="sty8985AmountSpan" style="width:63mm;text-align:center;">
									<xsl:call-template name="PopulateMonthDayYear">
										<xsl:with-param name="TargetNode" select="$FormData/PrtshpAdjustmentTxYrEndDt"/>
									</xsl:call-template>
								</span>
							</div>
						</div>
						<!-- Part II - F -->
						<div class="sty8985RightCell" style="width:68mm;height:13mm;padding-bottom: 2mm;border-bottom:.5px solid black;">
							<div class="styLNLeftLtrBox" style="width:15mm;height:12mm;padding-left:1mm;font-weight:normal;width:5mm;font-size:9pt;">F</div>
							<div class="styEINDateAssets" style="font-size:7pt;height:12mm;width:63mm;padding-top:1mm;border-right-width: 0px;border-bottom-width: 0px;">
								Extended due date of the partnership's adjustment year return (MM/DD/YYYY)<br/>
								<span class="sty8985AmountSpan" style="width:63mm;text-align:center;">
									<xsl:call-template name="PopulateMonthDayYear">
										<xsl:with-param name="TargetNode" select="$FormData/PrtshpAdjYrExtendedDueDt"/>
									</xsl:call-template>
								</span>
							</div>
						</div>
						<!-- Part II - G -->
						<div class="sty8985RightCell" style="width:68mm;height:15mm;padding-bottom: 2mm;border-bottom:.5px solid black;">
							<div class="styLNLeftLtrBox" style="width:15mm;height:15mm;padding-left:1mm;font-weight:normal;width:5mm;font-size:9pt;">G</div>
							<div class="styEINDateAssets" style="font-size:7pt;height:15mm;width:63mm;padding-top:1mm;border-right-width: 0px;border-bottom-width: 0px;">
								Date the partnership furnished the Form 8986 statements to its partners (MM/DD/YYYY)<br/>
								<span class="sty8985AmountSpan" style="width:63mm;text-align:center;">
									<xsl:call-template name="PopulateMonthDayYear">
										<xsl:with-param name="TargetNode" select="$FormData/Form8986StmtFurnishedDt"/>
									</xsl:call-template>
								</span>
							</div>
						</div>
						<div class="sty8985RightCell" style="width:68mm;background-color:gray;height:4mm;padding-bottom:2mm;border-bottom:.5px solid black;"/>
					</div>
					<!-- Part II - End -->
					<!-- ************************** PART III START ************************** -->
					<!-- Part III - Information About the Pass-Through Partner (Only fill out this section if this statement is being submitted by a pass-through partner.) -->
					<div class="styStdDiv" style="width:187mm;height:8mm;border-bottom:1px solid black;">
						<div class="styPartName" style="height:5mm;font-size:10pt;font-family:arial;
text-align:center;padding-top:.5mm">Part III</div>
						<div class="styPartDesc" style="font-size:9pt;padding-top:.3mm;font-family:arial;font-weight: normal;">
							Information <strong> About the Pass-Through Partner</strong> (Only fill out this section if this statement is being submitted by<br/> a pass-through partner.)
						</div>
					</div>
					<div class="styGenericDiv" style="width:187mm;">
						<!-- Part III - A -->
						<div class="sty8985LeftCell" style="height:27mm;width:119mm;border-right-width: 0px;">
							<div class="styLNLeftLtrBox" style="width:4mm;height:27mm;padding-left:0;font-weight:normal;font-size:9pt;">A</div>
							<div class="styNameAddr" style="font-size:7pt;height:11mm;width:115mm;border-right-width: 0.5px;padding-top:1mm;">
								1. Pass-through entity's name<br/>
								<span class="sty8985AmountSpan" style="width:115mm;float:left;text-align:left;">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$FormData/PassThruPartnerInfoGrp/PassThroughEntityName/BusinessNameLine1Txt"/>
									</xsl:call-template>
								</span>
								<span class="sty8985AmountSpan" style="width:115mm;float:left;text-align:left;">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$FormData/PassThruPartnerInfoGrp/PassThroughEntityName/BusinessNameLine2Txt"/>
									</xsl:call-template>
								</span>
							</div>
							<xsl:choose>
								<xsl:when test="$FormData/PassThruPartnerInfoGrp/USAddress">
									<div class="styNameAddr" style="font-size:7pt;height:10mm;width:75mm;border-right:.5px solid black;">
										2. Street address<br/>
										<span class="sty8985AmountSpan" style="width:75mm;float:left;text-align:left;">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="$FormData/PassThruPartnerInfoGrp/USAddress/AddressLine1Txt"/>
											</xsl:call-template>
										</span>
										<span class="sty8985AmountSpan" style="width:75mm;float:left;text-align:left;">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="$FormData/PassThruPartnerInfoGrp/USAddress/AddressLine2Txt"/>
											</xsl:call-template>
										</span>
									</div>
									<div class="styNameAddr" style="font-size:7pt;height:10mm;width:40mm;border-right-width: 0.5px;">
										3. City or town<br/>
										<span class="sty8985AmountSpan" style="width:40mm;float:left;text-align:left;">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="$FormData/PassThruPartnerInfoGrp/USAddress/CityNm"/>
											</xsl:call-template>
										</span>
									</div>
									<div class="styNameAddr" style="font-size:7pt;height:6mm;width:50mm;border-right:.5px solid black;border-bottom-width: 0px;">
										4. State or province<br/>
										<span class="sty8985AmountSpan" style="width:75mm;float:left;text-align:left;">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="$FormData/PassThruPartnerInfoGrp/USAddress/StateAbbreviationCd"/>
											</xsl:call-template>
										</span>
									</div>
									<div class="styNameAddr" style="font-size:7pt;height:6mm;width:25mm;border-right:.5px solid black;border-bottom-width: 0px;">
										5. Country code<br/>
										<!-- No country code for US Address -->
										&nbsp;
									</div>
									<div class="styNameAddr" style="font-size:7pt;height:6mm;width:40mm;border-right-width: 0.5px;border-bottom-width: 0px;">
										6. Zip or foreign postal code<br/>
										<span class="sty8985AmountSpan" style="width:75mm;float:left;text-align:left;">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="$FormData/PassThruPartnerInfoGrp/USAddress/ZIPCd"/>
											</xsl:call-template>
										</span>
									</div>
								</xsl:when>
								<xsl:otherwise>
									<div class="styNameAddr" style="font-size:7pt;height:10mm;width:75mm;border-right:.5px solid black;">
										2. Street address<br/>
										<span class="sty8985AmountSpan" style="width:75mm;float:left;text-align:left;">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="$FormData/PassThruPartnerInfoGrp/ForeignAddress/AddressLine1Txt"/>
											</xsl:call-template>
										</span>
										<span class="sty8985AmountSpan" style="width:75mm;float:left;text-align:left;">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="$FormData/PassThruPartnerInfoGrp/ForeignAddress/AddressLine2Txt"/>
											</xsl:call-template>
										</span>
									</div>
									<div class="styNameAddr" style="font-size:7pt;height:10mm;width:40mm;border-right-width: 0.5px;">
										3. City or town<br/>
										<span class="sty8985AmountSpan" style="width:40mm;float:left;text-align:left;">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="$FormData/PassThruPartnerInfoGrp/ForeignAddress/CityNm"/>
											</xsl:call-template>
										</span>
									</div>
									<div class="styNameAddr" style="font-size:7pt;height:6mm;width:50mm;border-right:.5px solid black;border-bottom-width: 0px;">
										4. State or province<br/>
										<span class="sty8985AmountSpan" style="width:75mm;float:left;text-align:left;">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="$FormData/PassThruPartnerInfoGrp/ForeignAddress/ProvinceOrStateNm"/>
											</xsl:call-template>
										</span>
									</div>
									<div class="styNameAddr" style="font-size:7pt;height:6mm;width:25mm;border-right:.5px solid black;border-bottom-width: 0px;">
										5. Country code<br/>
										<span class="sty8985AmountSpan" style="width:75mm;float:left;text-align:left;">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="$FormData/PassThruPartnerInfoGrp/ForeignAddress/CountryCd"/>
											</xsl:call-template>
										</span>
									</div>
									<div class="styNameAddr" style="font-size:7pt;height:6mm;width:40mm;border-right-width: 0.5px;border-bottom-width: 0px;">
										6. Zip or foreign postal code<br/>
										<span class="sty8985AmountSpan" style="width:75mm;float:left;text-align:left;">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="$FormData/PassThruPartnerInfoGrp/ForeignAddress/ForeignPostalCd"/>
											</xsl:call-template>
										</span>
									</div>
								</xsl:otherwise>
							</xsl:choose>
						</div>
						<!-- Part III - B  -->
						<div class="sty8985RightCell" style="width:68mm;height:14.75mm;padding-bottom: 2mm;border-bottom:.5px solid black;">
							<div class="styLNLeftLtrBox" style="width:15mm;height:13.75mm;padding-left:1mm;font-weight:normal;width:5mm;font-size:9pt;">B</div>
							<div class="styEINDateAssets" style="font-size:7pt;height:13.75mm;width:63mm;padding-top:1mm;border-right-width: 0px;border-bottom-width: 0px;">
								Pass-through partner's tax identification number (TIN)<br/>
								<span class="sty8985AmountSpan" style="width:63mm;text-align:center;">
									<xsl:call-template name="PopulateEIN">
										<xsl:with-param name="TargetNode" select="$FormData/PassThruPartnerInfoGrp/EIN"/>
									</xsl:call-template>
								</span>
							</div>
						</div>
						<!-- Part III - C -->
						<div class="sty8985RightCell" style="width:68mm;height:12.25mm;padding-bottom: 2mm;border-bottom:.5px solid black;">
							<div class="styLNLeftLtrBox" style="width:15mm;height:12.25mm;padding-left:1mm;font-weight:normal;width:5mm;font-size:9pt;">C</div>
							<div class="styEINDateAssets" style="font-size:7pt;height:12.25mm;width:63mm;padding-top:1mm;border-right-width: 0px;border-bottom-width: 0px;">
								Pass-through partner's tax year end to which the adjustments relate (MM/DD/YYYY)<br/>
								<span class="sty8985AmountSpan" style="width:63mm;text-align:center;">
									<xsl:call-template name="PopulateMonthDayYear">
										<xsl:with-param name="TargetNode" select="$FormData/PassThruPartnerInfoGrp/TYEndMonthDayYearDt"/>
									</xsl:call-template>
								</span>
							</div>
						</div>
						<!-- Part III - D -->
						<div class="sty8985LeftCell" style="width:96mm;height:19mm;border-right-width: 0px;">
							<div class="styLNLeftLtrBox" style="height:19mm;width:4mm;padding-left:0;font-weight:normal;font-size:9pt;">D</div>
							<div class="styNameAddr" style="height:19mm;font-size:7pt;width:92mm;padding-top:1mm;border-right-width: 0.5px;padding-bottom:1mm;border-bottom-width: 0px;">
								Name of the entity that issued the statement to the pass-through partner (if different from the partnership in Part II)<br/>
								<span class="sty8985AmountSpan" style="width:92mm;float:left;text-align:left;">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$FormData/PassThruPartnerInfoGrp/PassThroughEntityBusName/BusinessNameLine1Txt"/>
									</xsl:call-template>
								</span>
								<span class="sty8985AmountSpan" style="width:92mm;float:left;text-align:left;">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$FormData/PassThruPartnerInfoGrp/PassThroughEntityBusName/BusinessNameLine2Txt"/>
									</xsl:call-template>
								</span>
							</div>
						</div>
						<!-- Part III - E  -->
						<div class="sty8985RightCell" style="width:91mm;height:19mm;padding-bottom: 2mm;border-bottom:.5px solid black;">
							<div class="styLNLeftLtrBox" style="width:15mm;height:19mm;padding-left:1mm;font-weight:normal;width:5mm;font-size:9pt;">E</div>
							<div class="styEINDateAssets" style="font-size:7pt;height:19mm;width:80mm;padding-top:1mm;border-right-width: 0px;border-bottom-width: 0px;">
								TIN of the entity that issued the statement to the pass-through partner (if different from the partnership in Part II)<br/>
								<span class="sty8985AmountSpan" style="width:80mm;float:left;text-align:center;">
									<xsl:call-template name="PopulateEIN">
										<xsl:with-param name="TargetNode" select="$FormData/PassThruPartnerInfoGrp/PassThroughEntityEIN"/>
									</xsl:call-template>
								</span>
							</div>
						</div>
						<!-- Part III - F -->
						<div class="sty8985LeftCell" style="width:187mm;border-right-width: 0px;">
							<div class="styLNLeftLtrBox" style="height:35.5mm;width:4mm;padding-left:0;font-weight:normal;font-size:9pt;">F</div>
							<div class="styLNDesc" style="height:35.5mm;font-size:7pt;width:182mm;padding-top:1mm;padding-bottom:1mm;border-bottom-width: 0px;">
								Check if the pass-through partner is:
								<br/>
								<input type="Checkbox" class="styCkboxNM" alt="PassThroughPartnerPaymentInd">
									<xsl:call-template name="PopulateCheckbox">
										<xsl:with-param name="TargetNode" select="$FormData/PassThroughPrtnrPaymentGrp/PassThroughPartnerPymtIndGrp/PassThroughPartnerPaymentInd"/>
										<xsl:with-param name="BackupName">IRS8985PassThroughPartnerPaymentInd</xsl:with-param>
									</xsl:call-template>
								</input>
								1. Making a payment at the pass-through partner level
								<br/>
								<input type="Checkbox" class="styCkboxNM" alt="PassThroughPartner8986Ind">
									<xsl:call-template name="PopulateCheckbox">
										<xsl:with-param name="TargetNode" select="$FormData/PassThroughPrtnrPaymentGrp/PassThroughPartner8986Ind"/>
										<xsl:with-param name="BackupName">IRS8985PassThroughPartner8986Ind</xsl:with-param>
									</xsl:call-template>
								</input>
								2. Issuing Forms 8986 to its partners
								<br/>
								<div class="styLNDesc" style="height:13mm;width:100mm;">
									<br/>
									<br/>
									If making a payment, use Part V to show how the payment was figured, and enter the additional tax, penalties, and interest
									<span class="sty8985DotLn" style="float:none;">.........</span>
								</div>
								<!-- BEGIN PART III-F TABLE -->
								<div style="height:13mm;width:82mm;">
									<table class="styTable" style="border-collapse:collapse;font-size:7pt;">
										<thead class="styTableThead">
											<tr>
												<th class="styTableCellHeader" scope="col" style="width:27mm;font-weight:normal;border-top-width:.1mm;border-left-width:.1mm;height:5mm;">Additional tax</th>
												<th class="styTableCellHeader" scope="col" style="width:27mm;font-weight:normal;border-top-width:.1mm;border-left-width:.1mm;">Penalties</th>
												<th class="styTableCellHeader" scope="col" style="width:27mm;font-weight:normal;border-right-width:0px;border-top-width:.1mm;border-left-width:.1mm;">Interest</th>
											</tr>
										</thead>
										<tbody>
											<tr>
												<td class="styTableCellCtrInherit" style="height:7mm;border-left-width:.1mm;">
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="$FormData/PassThroughPrtnrPaymentGrp/PassThroughPartnerPymtIndGrp/AdditionalTaxAmt"/>
													</xsl:call-template>
												</td>
												<td class="styTableCellCtrInherit">
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="$FormData/PassThroughPrtnrPaymentGrp/PassThroughPartnerPymtIndGrp/PenaltyAmt"/>
													</xsl:call-template>
												</td>
												<td class="styTableCellCtrInherit" style="border-right-width:0px;">
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="$FormData/PassThroughPrtnrPaymentGrp/PassThroughPartnerPymtIndGrp/InterestAmt"/>
													</xsl:call-template>
												</td>
											</tr>
										</tbody>
									</table>
								</div>
								<!-- END PART III-F TABLE -->
								<div class="styLNDesc" style="height:15mm;font-size:7pt;width:187mm;border-bottom-width: 0px;">
									Check if:
									<br/>
									<input type="Checkbox" class="styCkboxNM" alt="ElectronicPaymentInd">
										<xsl:call-template name="PopulateCheckbox">
											<xsl:with-param name="TargetNode" select="$FormData/ElectronicPaymentIndGrp/ElectronicPaymentInd"/>
											<xsl:with-param name="BackupName">IRS8985ElectronicPaymentInd</xsl:with-param>
										</xsl:call-template>
									</input>
									3. An electronic payment was made to the IRS. Enter the electronic confirmation number here: 
									<span style="width:56mm;border-bottom:1px dashed black;text-align:center;">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$FormData/ElectronicPaymentIndGrp/EFTPSPaymentConfirmationNum"/>
										</xsl:call-template>
									</span>.
									<br/>
									<input type="Checkbox" class="styCkboxNM" alt="CheckOrMoneyOrderPaymentInd">
										<xsl:call-template name="PopulateCheckbox">
											<xsl:with-param name="TargetNode" select="$FormData/CheckOrMoneyOrderPymtIndGrp/CheckOrMoneyOrderPaymentInd"/>
											<xsl:with-param name="BackupName">IRS8985CheckOrMoneyOrderPaymentInd</xsl:with-param>
										</xsl:call-template>
									</input>
									4. Paying by check or money order. Enter the check number here: 
									<span style="width:49mm;border-bottom:1px dashed black;text-align:center;">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$FormData/CheckOrMoneyOrderPymtIndGrp/CheckNum"/>
										</xsl:call-template>
									</span>. See instructions for Form 8985-V.
								</div>
							</div>
						</div>
						<!-- Part III - Under penalties of perjury -->
						<div class="sty8985LeftCell" style="width:187mm;border-right-width: 0px;">
							<div class="styLNDesc" style="height:6mm;font-size:7pt;width:187mm;border-bottom:0.1mm solid black;padding-top:.25mm;padding-bottom:.25mm;">
								Under penalties of perjury, I declare that I have examined this return and accompanying documents and, to the best of my knowledge and belief, they
are true, correct, and complete.
							</div>
							<!-- Jurat Signature Line -->
							<div class="sty8985LeftCell" style="height:5mm;font-size:7pt;width:118mm;padding-top:0mm;padding-bottom:0mm;">
								Signature of individual partnership representative or designated individual <em>(see instructions)</em>
							</div>
							<div class="sty8985LeftCell" style="height:5mm;font-size:7pt;width:32mm;padding-left:1mm;padding-bottom:0mm;">
								Date
							</div>
							<div class="sty8985LeftCell" style="height:5mm;font-size:7pt;width:37mm;border-right-width:0px;padding-left:1mm;padding-bottom:0mm;">
								Telephone number
							</div>
							<div class="sty8985RightCell" style="height:5mm;font-size:7pt;width:50mm;padding-bottom:0mm;border-right-width:1px;">
							
								Title
							</div>
							<div class="sty8985LeftCell" style="height:5mm;font-size:7pt;width:50mm;padding-bottom:0mm;padding-left:1mm">
							
								Name of the person signing the form
							</div>
							
							<div class="sty8985LeftCell" style="height:5mm;font-size:7pt;width:80mm;border-right-width:0px;padding-left:1mm;padding-bottom:0mm;">
								Name of entity partnership representative <em>(if applicable)</em>
							</div>
						</div>
					</div>
					<!-- Part III - End -->
					<div class="pageEnd" style="width:187mm;">
						<span class="styBoldText" style="width:100mm;">For Privacy Act and Paperwork Reduction Act Notice, see instructions.</span>
						<span style="width:37mm; text-align:center;">Cat. No. 37809J</span>
						<div style="float:right;clear:none;">
							<span style="width:50mm;text-align:right;">Form <span style="font-size:9pt;">
								<b>8985</b>
							</span> (12-2024)</span>
						</div>
					</div>
					<!-- End of page 1 -->
					<!-- Begin of page 2 -->
					<div class="styStdDiv">
						Form 8985 (12-2024)
						<span style="float:right;">Page <span style="font-weight:bold;font-size:8pt;">2</span>
						</span>
					</div>
					<!-- ************************** PART IV START ************************** -->
					<!-- Part IV - Partners' Total Reviewed Year Income, Gain, Loss, Deduction, Credits, and Other Items (Fill in applicable items and use Part V to explain any changes.) -->
					<div class="styStdDiv" style="width:187mm;height:9mm;border-bottom:1px solid black;border-top:2px solid black;">
						<div class="styPartName" style="height:5mm;font-size:10pt;font-family:arial;
text-align:center;padding-top:.5mm">Part IV</div>
						<div class="styPartDesc" style="font-size:8pt;padding-top:.3mm;font-weight:normal">
						<strong>	Partners' Total Reviewed Year Income, Gain, Loss, Deduction, Credits, and Other Items </strong> (Fill in applicable items and use Part V to explain any changes.)
						</div>
					</div>
					<!-- Part IV - Table 1 - Begin -->
					<xsl:variable name="shouldSeparatePart4" select="($Print = $Separated) and (count($FormData/PartnerReviewedYearIncomeGrp) &gt; 21)"/>
					<div class="styStdDiv" id="Part4Table">
						<xsl:call-template name="SetInitialState"/>
						<table style="display:table;border-collapse:collapse;">
							<thead class="styTableThead">
								<tr>
									<th scope="col" class="styTableCellHeader" style="width:30mm;" rowspan="1" colspan="4">
										Schedule K-1/K-3 </th>
									<th class="styTableCellHeader" scope="col" rowspan="3" style="width:15mm;font-weight:normal;">
										<strong>(e)</strong>
										<br/> Check if<br/> 
											statement<br/>in Part V.<br/> See Inst.
										</th>
									<th class="styTableCellHeader" scope="col" rowspan="3" style="width:28mm;font-weight:normal;">
										<strong>(f)</strong>
										<br/> Approved<br/>
											modifications<br/> (if applicable)
										</th>
									<th class="styTableCellHeader" scope="col" rowspan="2" style="width:28mm;font-weight:normal;">
										<strong>(g)</strong>
										<br/>Reviewed year adjustments <br/>net of approved modifications
										</th>
									<th class="styTableCellHeader" scope="col" rowspan="2" style="width:28mm;font-weight:normal;border-right-width:0px;">
										<strong>(h)</strong>
										<br/>As corrected (column (d) combined with column (g))<br/>
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
								<xsl:if test="not($shouldSeparatePart4)">
									<xsl:for-each select="$FormData/PartnerReviewedYearIncomeGrp">
										<tr style="height:7mm;vertical-align:bottom;">
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
														IRS8985IncomeStmtAttachedInd<xsl:value-of select="position()"/>
														</xsl:with-param>
													</xsl:call-template>
												</input>
											</td>
											<td class="styTableCellAmtInherit">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="IncomeApprovedModifAmt"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellAmtInherit">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="IncomeReviewedYrAdjAmt"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellAmtInherit" style="border-right-width:0px;">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="AsCorrectedAmt"/>
												</xsl:call-template>
											</td>
										</tr>
									</xsl:for-each>
								</xsl:if>
								<xsl:if test="$shouldSeparatePart4 or count($FormData/PartnerReviewedYearIncomeGrp) &lt; 21">
									<xsl:call-template name="FillTable8Cols">
										<xsl:with-param name="LineNumber" select="1 + count($FormData/PartnerReviewedYearIncomeGrp)"/>
										<xsl:with-param name="SepMessage" select="$shouldSeparatePart4"/>
									</xsl:call-template>
								</xsl:if>
							</tbody>
						</table>
					</div>
					<xsl:if test="not($shouldSeparatePart4)">
						<xsl:call-template name="SetInitialDynamicTableHeight">
							<xsl:with-param name="TargetNode" select="$FormData/PartnerReviewedYearIncomeGrp"/>
							<xsl:with-param name="containerID" select=" 'Part4Table' "/>
							<xsl:with-param name="headerHeight" select="2"/>
							<xsl:with-param name="containerHeight" select="21"/>
						</xsl:call-template>
					</xsl:if>
					<div class="styStdDiv" style="width:187mm;">
						<div class="sty8985LeftCell" style="height:6mm;font-size:7pt;width:103.1mm;padding-top:1mm;padding-bottom:1mm;border-bottom-width:2px;">
							*See instructions.
							<span style="float:right;font-size:9pt;padding-right:2mm;">Totals: </span>
						</div>
						<div class="sty8985LeftCell" style="height:6mm;font-size:7pt;width:28mm;padding-top:1mm;padding-bottom:1mm;border-bottom-width:2px;float:left;text-align:right;padding-right:1.5mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TotPartnerIncomeApprvModifAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty8985LeftCell" style="height:6mm;font-size:7pt;width:28mm;padding-top:1mm;padding-bottom:1mm;padding-left:1mm;border-bottom-width:2px;text-align:right;padding-right:1.5mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TotPartnerIncmReviewedYrAdjAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty8985LeftCell" style="height:6mm;font-size:7pt;width:27.75mm;padding-top:1mm;padding-bottom:1mm;padding-left:1mm;border-bottom-width:2px;text-align:right;padding-right:1.5mm;border-right-width:0px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TotPartnerAsCorrectedAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Part IV - Table 1 - End -->
					<!-- Applicable Penalties -->
					<!-- Part IV - Table 2 - Begin -->
					<xsl:variable name="shouldSeparatePart4Table2" select="($Print = $Separated) and (count($FormData/ApplicablePenaltiesGrp) &gt; 5)"/>
					<div class="styStdDiv" id="Part4Table2">
						<xsl:call-template name="SetInitialState"/>
						<table class="styTable" style="border-collapse:collapse;font-size:7pt;">
							<thead class="styTableThead">
								<tr>
									<th class="styTableCellHeader" scope="colgroup" colspan="8" style="height:6mm;width:auto;border-right-width:0px;font-size:9pt;">Applicable Penalties</th>
								</tr>
								<tr>
									<th class="styTableCellHeader" scope="col" style="width:15mm;font-weight:normal;">
										Penalty
									</th>
									<th class="styTableCellHeader" scope="col" style="width:30mm;font-weight:normal;">
										(a)<br/>Internal Revenue<br/>Code section
									</th>
									<th class="styTableCellHeader" scope="col" style="width:52mm;font-weight:normal;">
										(b)<br/>Penalty description
									</th>
									<th class="styTableCellHeader" scope="col" style="width:30mm;font-weight:normal;">
										(c)<br/>Penalty rate
									</th>
									<th class="styTableCellHeader" scope="col" style="width:30mm;font-weight:normal;">
										(d)<br/>Applicable line numbers above
									</th>
									<th class="styTableCellHeader" scope="col" style="width:30mm;font-weight:normal;border-right-width:0px;">
										(e)<br/>Total applicable adjustments 
									</th>
								</tr>
							</thead>
							<tbody style="font-size:6pt;">
								<xsl:if test="not($shouldSeparatePart4Table2)">
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
											<td class="styTableCellTextInherit"  style="border-right-width:1px;text-align:right">
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
								<xsl:if test="$shouldSeparatePart4Table2 or count($FormData/ApplicablePenaltiesGrp) &lt; 5">
									<xsl:call-template name="fillTable6Cols">
										<xsl:with-param name="LineNumber" select="1 + count($FormData/ApplicablePenaltiesGrp)"/>
										<xsl:with-param name="SepMessage" select="$shouldSeparatePart4Table2"/>
									</xsl:call-template>
								</xsl:if>
							</tbody>
						</table>
					</div>
					<xsl:if test="not($shouldSeparatePart4Table2)">
						<xsl:call-template name="SetInitialDynamicTableHeight">
							<xsl:with-param name="TargetNode" select="$FormData/ApplicablePenaltiesGrp"/>
							<xsl:with-param name="containerID" select=" 'Part4Table2' "/>
							<xsl:with-param name="headerHeight" select="2"/>
							<xsl:with-param name="containerHeight" select="5"/>
						</xsl:call-template>
					</xsl:if>
					<!-- Part IV - Table 2 - End -->
					<!--</div>-->
					<!-- End of Part IV -->
					<div class="pageEnd" style="width:187mm;border-top:1px solid black;">
						<div style="float:right;clear:none;">
							<span style="width:50mm;text-align:right;"> Form <span style="font-size:9pt;">
								<b>8985</b>
							</span> (12-2024)</span>
						</div>
					</div>
					<!-- End of page 2 -->
					<!-- Begin of page 3 -->
					<div class="styStdDiv">
						Form 8985 (12-2024)
						<span style="float:right;">Page <span style="font-weight:bold;font-size:8pt;">3</span></span>
					</div>
					<!-- ************************** PART V START ************************** -->
					<!-- Part V - Statements. Enter the Part IV line number and code before each statement. Show any computation in detail. See instructions. If more space is needed, continue statements on additional pages. Also use this Part V for
the computation required in Part III, Item F (Enter “Part III F” in column (a) and the computation in column (b)). -->
					<div class="styStdDiv" style="width:187mm;height:15mm;border-bottom:1px solid black;border-top:2px solid black;">
						<div class="styPartName" style="height:5mm;font-size:10pt;font-family:arial;
text-align:center;padding-top:.5mm">Part V</div>
						<div class="styPartDesc" style="font-size:9pt;padding-top:.3mm;font-family:arial;bor-style:solid;font-weight: normal;">
						<strong>	Statements.</strong> Enter the Part IV line number and code before each statement. Show any computation in detail. See instructions. If more space is needed, continue statements on additional pages. Also use this Part V for
the computation required in Part III, Item F (Enter “Part III F” in column (a) and the computation in column (b)).
						</div>
					</div>
					<!-- Part V - Table 1 - Begin -->
					<xsl:variable name="shouldSeparatePart5" select="($Print = $Separated) and (count($FormData/StatementsGrp) &gt; 1)"/>
					<div class="styStdDiv" id="Part5Table">
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
								<xsl:if test="not($shouldSeparatePart5)">
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
								<xsl:if test="$shouldSeparatePart5 or count($FormData/StatementsGrp) &lt; 1">
									<xsl:call-template name="fillTable2Cols">
										<xsl:with-param name="LineNumber" select="1 + count($FormData/StatementsGrp)"/>
										<xsl:with-param name="SepMessage" select="$shouldSeparatePart5"/>
									</xsl:call-template>
								</xsl:if>
							</tbody>
						</table>
					</div>
					<!-- Part V - Table 1 - End -->
					<div class="pageEnd" style="width:187mm;border-top:1px solid black;margin-bottom:0mm;">
						<div style="float:right;clear:none;">
							<span style="width:50mm;text-align:right;"> Form <span style="font-size:9pt;">
								<b>8985</b>
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
					<!-- Part 4 Separated Table 1 -->
					<xsl:if test="$shouldSeparatePart4">
						<br/>
						<br/>
						<span class="styRepeatingDataTitle">Part IV - Table 1 - Partners' Total Reviewed Year Income, Gain, Loss, Deduction, Credits, and Other Items (Fill in applicable items anduse Part V to explain any changes.)</span><br />
						<table class="styDepTbl" cellspacing="0" style="font-size:7pt;">
							<thead class="styTableThead">
								<tr class="styDepTblHdr">
									<th scope="col" class="styDepTblCell" style="width:30mm;" rowspan="1" colspan="4">
                                        Schedule K-1 
                                    </th>
									<th class="styDepTblCell" scope="col" rowspan="3" style="width:15mm;font-weight:normal;">
										<strong>(e)</strong>
										<br/> Check if<br/>statement<br/>in Part V.<br/> See Inst.
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
                                        <strong>(a)</strong><br/> Line <br/> number  
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
											<td class="styTableCellCtrInherit">
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
														<xsl:with-param name="BackupName">
														IRS8985IncomeStmtAttachedInd<xsl:value-of select="position()"/>
														</xsl:with-param>
													</xsl:call-template>
												</input>
											</td>
											<td class="styTableCellAmtInherit">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="IncomeApprovedModifAmt"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellAmtInherit">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="IncomeReviewedYrAdjAmt"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellAmtInherit" style="border-right-width:0px;">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="AsCorrectedAmt"/>
												</xsl:call-template>
											</td>
										</tr>
								</xsl:for-each>
							</tbody>
						</table>
					</xsl:if>
					<!-- Part 4 Separated Table 2 -->
					<xsl:if test="$shouldSeparatePart4Table2">
						<br/>
						<br/>
						<span class="styRepeatingDataTitle">Part IV - Table 2 - Applicable Penalties</span><br />
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
							</tbody>
						</table>
					</xsl:if>
					<!-- Part 5 Separated Table -->
					<xsl:if test="$shouldSeparatePart5">
						<br/>
						<br/>
						<span class="styRepeatingDataTitle">Part V - Statements</span><br />
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
		<xsl:param name="MaxLine" select="21"/>
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
				<input class="styCkbox" type="checkbox" alt="Empty Income Stmt Attached Ind">
					<xsl:call-template name="PopulateCheckbox">
						<xsl:with-param name="TargetNode" select="/.."/>
						<xsl:with-param name="BackupName"><xsl:value-of select="$LineNumber"/></xsl:with-param>
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
					<xsl:otherwise><xsl:number format="1" value="$LineNumber"/></xsl:otherwise>
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