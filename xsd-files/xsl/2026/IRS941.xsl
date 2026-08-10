<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE xsl:stylesheet [
	<!ENTITY nbsp "&#160;">
]>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fo="http://www.w3.org/1999/XSL/Format">
	<xsl:include href="PopulateTemplate.xsl"/>
	<xsl:include href="CommonPathRef.xsl"/>
	<xsl:include href="AddHeader.xsl"/>
	<xsl:include href="AddOnTable.xsl"/>
	<xsl:include href="IRS941Style.xsl"/>
	<xsl:output method="html" indent="yes"/>
	<xsl:strip-space elements="*"/>
	<!-- Defines the stage of the data, e.g. original or latest -->
	<xsl:param name="FormData" select="$RtnDoc/IRS941"/>
	<xsl:template match="/">
		<xsl:if test="$Language='ENGLISH'">
			<xsl:call-template name="IRS941SS"/>
		</xsl:if>
		<xsl:if test="$Language='SPANISH'">
			<xsl:call-template name="IRS941PR"/>
		</xsl:if>
	</xsl:template>
	<xsl:template name="IRS941SS">
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
				<meta name="Description" content="IRS Form 941"/>
				<xsl:call-template name="GlobalStylesForm"/>
				<script language="JavaScript" src="{$ScriptPath}/FormDisplay.js" type="text/javascript"/>
				<xsl:call-template name="InitJS"/>
				<style type="text/css">
<!--					<xsl:if test="not($Print) or $Print=''">-->
						<xsl:call-template name="IRS941Style"/>
						<xsl:call-template name="AddOnStyle"/>
<!--					</xsl:if>-->
				</style>
			</head>
			<xsl:variable name="Date">
				<xsl:call-template name="PopulateText">
					<xsl:with-param name="TargetNode" select="$RtnHdrData/QuarterEndingDt"/>
				</xsl:call-template>
			</xsl:variable>
			<!-- 5/11/2021: Choice inserted to split Q1 and Q2-Q4 -->
			<!--<xsl:choose>
				<xsl:when test="substring($Date, 6, 2) = '03'">		-->
					<body class="styBodyClass" style="width:187mm">
						<form name="IRS941">
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
									<xsl:with-param name="TargetNode" select="$RtnDoc/GeneralDependencySmall"/>
								</xsl:call-template>
								<xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode" select="$RtnDoc/FinalPayrollInfoStatement"/>
								</xsl:call-template>
								<xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode" select="$RtnDoc/TransferOfBusinessStatement"/>
								</xsl:call-template>
								<xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode" select="$RtnDoc/IRS941ScheduleR"/>
								</xsl:call-template>
								<xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode" select="$RtnDoc/IRS941ScheduleD"/>
								</xsl:call-template>
								<br/>
								<div class="styFNBox" style="width:43mm;height:10mm;border:0px;">
									Form
									<span class="styFormNumber" style="font-size:15pt;">  
									941 for 2026:
									</span>
									<div class="styFST" style="height:4mm;">
										<span class="styAgency" style="font-weight:normal">(Rev. March 2026)</span>
									</div>
								</div>
					<div class="styFTBox" style="width:100mm;text-align:left;height:10mm;">
						<div class="styMainTitle" style="font-size:12pt;padding-top:1mm;">
							Employer's QUARTERLY Federal Tax Return
						</div>
						<div class="styFST" style="height:4mm;">
							<span class="styAgency" style="font-weight:normal">Department of the Treasury — Internal Revenue Service</span>
						</div>
					</div>
				   <div class="styTYBox" style="width:43.7mm;height:10mm;border:0px;">
					  <div style="font-size:12pt;font-family:Courier New;font-weight:bold;text-align:right;padding-left:28mm;">950126</div>
					  <div class="styOMB" style="font-size:7pt;text-align:right;border:0px;padding-top:1mm;">OMB No. 1545-0029</div>
				   </div>
						<div class="styBB" style="width:128mm;height:66mm;float:left;border:black solid 1px;padding-top:2mm;padding-left:2mm;padding-right:2mm;">
							<div style="width:124mm;padding-top:0mm;">
								<span style="float:left;padding-top:2mm;"><b>Employer identification number</b> (EIN)</span>
								<span class="styLNCtrNumBox" style="width:72mm;border-top-width:1px;padding-top:1mm;float:right;height:6mm;">
									<xsl:call-template name="PopulateReturnHeaderFiler">
										<xsl:with-param name="TargetNode">EIN</xsl:with-param>
										<xsl:with-param name="EINChanged">true</xsl:with-param>
									</xsl:call-template>
								</span>
							</div>
							<!-- 5/13/2015 Adjusted Filer name and Trade name height from 8mm to auto (font 6pt)  --> 
							<div style="width:124mm;height:16mm;padding-bottom:2mm;padding-top:2mm;">
								<span style="float:left;padding-top:4mm;"><b>Name</b><i> (not your trade name)</i></span>
								<span class="styLNCtrNumBox" style="width:86mm;border-top-width:1px;padding-left:1mm;float:right;text-align:left;height:auto;font-size:6pt;">
									<xsl:call-template name="PopulateReturnHeaderFiler">
										<xsl:with-param name="TargetNode">BusinessNameLine1Txt</xsl:with-param>
									</xsl:call-template><br/>
									<xsl:call-template name="PopulateReturnHeaderFiler">
										<xsl:with-param name="TargetNode">BusinessNameLine2Txt</xsl:with-param>
									</xsl:call-template>
								</span>
							</div>
							<div style="width:124mm;height:10mm;padding-bottom:2mm;">
								<span style="float:left;padding-top:4mm;"><b>Trade name</b><i> (if any)</i></span>
								<span class="styLNCtrNumBox" style="width:96mm;border-top-width:1px;padding-left:1mm;text-align:left;float:right;height:auto;font-size:6pt;">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/TradeName/BusinessNameLine1Txt"/>
									</xsl:call-template><br/>
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/TradeName/BusinessNameLine2Txt"/>
									</xsl:call-template>
								</span>
							</div>
							<div style="width:124mm;padding-bottom:0mm;">
								<span style="width:14mm;height:15mm;float:left;padding-top:2mm;font-weight:bold;">Address</span>
								<span class="styLNCtrNumBox" style="width:110mm;height:7mm;float:right;border-top-width:1px;padding-top:.5mm;padding-left:1mm;text-align:left;">
									<xsl:call-template name="PopulateReturnHeaderFiler">
										<xsl:with-param name="TargetNode">AddressLine1Txt</xsl:with-param>
									</xsl:call-template>&nbsp;
									<xsl:call-template name="PopulateReturnHeaderFiler">
										<xsl:with-param name="TargetNode">AddressLine2Txt</xsl:with-param>
									</xsl:call-template>
								</span>
								<span style="width:108mm;font-size:6pt;padding-left:3mm;">
									Number<span style="width:16mm"/>Street<span style="width:50mm;"/>Suite or room number
								</span>
								<span class="styLNCtrNumBox" style="width:66mm;border-top-width:1px;padding-top:.5mm;height:7mm;text-align:left;padding-left:1mm;">
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
								<span style="width:124mm;font-size:6pt;padding-left:15mm;">
									<span style="width:66mm;">City</span>
									<span style="width:13mm;text-align:center;">State</span>
									<span style="width:24mm;text-align:center;">ZIP code</span>
								</span>
								<span style="width:124mm;padding-left:14mm;">
								<span class="styLNCtrNumBox" style="width:52mm;height:6.5mm;border-top-width:1px;padding-top:1mm;text-align:left;padding-left:1mm;word-wrap:break-word;">
									<xsl:call-template name="PopulateReturnHeaderFiler">
										<xsl:with-param name="TargetNode">CountryCd</xsl:with-param>
									</xsl:call-template>
								</span>
								<span class="styLNCtrNumBox" style="width:2.5mm;float:left;border:none"/>
								<span class="styLNCtrNumBox" style="width:29mm;border-top-width:1px;padding-top:1mm;height:6.5mm;word-wrap:break-word;">
									<xsl:call-template name="PopulateReturnHeaderFiler">
										<xsl:with-param name="TargetNode">ProvinceOrStateNm</xsl:with-param>
									</xsl:call-template>
								</span>
								<span class="styLNCtrNumBox" style="width:2.5mm;float:left;border:none"/>
								<span class="styLNCtrNumBox" style="width:24mm;border-top-width:1px;height:6.5mm;word-wrap:break-word;">
									<xsl:call-template name="PopulateReturnHeaderFiler">
										<xsl:with-param name="TargetNode">ForeignPostalCd</xsl:with-param>
									</xsl:call-template>
								</span>
								</span>
								<span style="width:124mm;font-size:6pt;padding-left:14mm;">
									<span style="width:53mm;padding-left:1mm;">Foreign country name</span>
									<span style="width:29mm;text-align:center;">Foreign province/county</span>
									<span style="width:28mm;text-align:center;padding-left:3mm;">Foreign postal code</span>
								</span>
							</div>
						</div>
						<div style="width:56mm;float:right;padding-right:2mm;">
							<div class="styBB" style="width:54mm;height:40mm;border-left-width:1px;border-right-width:1px;border-top-width:1px;padding-left:2mm;padding-top:2mm;">
								<div class="styPartName" style="width:49mm;height:9mm;text-align:left;padding-left:1mm;padding-top:0.4mm;padding-bottom:0.4mm;font-family:Arial Narrow;font-size:10pt;">Report for this Quarter of 2026<br/><span style="font-size:7pt;">(Check one.)</span></div>
								<!--<xsl:variable name="Date">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$RtnHdrData/QuarterEndingDt"/>
									</xsl:call-template>
								</xsl:variable>-->
								<div style="width:49mm;float:none;clear:both;">
									<div style="width:49mm;float:none;clear:both;">
										<div style="width:49mm;padding-top:1.6mm;float:none;clear:both;">
											<xsl:call-template name="PopulateSpan">
												<xsl:with-param name="TargetNode" select="$RtnHdrData/QuarterEndingDt"/>
											</xsl:call-template>
											<input type="checkbox" aria-label="FirstQuarter" class="styCkbox">
												<xsl:call-template name="PopulateEnumeratedCheckbox">
													<xsl:with-param name="TargetNode" select="$RtnHdrData/QuarterEndingDt"/>
													<xsl:with-param name="DisplayedCheckboxValue" select="concat(substring($Date, 1, 5), '03')"/>
													<xsl:with-param name="BackupName">IRS941QuarterEndingDt[1]</xsl:with-param>
												</xsl:call-template>
											</input>
											<label>
												<xsl:call-template name="PopulateLabel">
													<xsl:with-param name="TargetNode" select="$RtnHdrData/QuarterEndingDt"/>
													<xsl:with-param name="DisplayedCheckboxValue" select="concat(substring($Date, 1, 5), '03')"/>
													<xsl:with-param name="BackupName">IRS941QuarterEndingDt[1]</xsl:with-param>
												</xsl:call-template>
												<b>1:</b> January, February, March 
											</label>
										</div>
										<div style="width:49mm;">
											<div style="float:left;clear:none;padding-top:2.6mm;">
												<xsl:call-template name="PopulateSpan">
													<xsl:with-param name="TargetNode" select="$RtnHdrData/QuarterEndingDt"/>
												</xsl:call-template>
												<input type="checkbox" aria-label="SecondQuarter" class="styCkbox">
													<xsl:call-template name="PopulateEnumeratedCheckbox">
														<xsl:with-param name="TargetNode" select="$RtnHdrData/QuarterEndingDt"/>
														<xsl:with-param name="DisplayedCheckboxValue" select="concat(substring($Date, 1, 5), '06')"/>
														<xsl:with-param name="BackupName">IRS941QuarterEndingDt[2]</xsl:with-param>
													</xsl:call-template>
												</input>
												<label>
													<xsl:call-template name="PopulateLabel">
														<xsl:with-param name="TargetNode" select="$RtnHdrData/QuarterEndingDt"/>
														<xsl:with-param name="DisplayedCheckboxValue" select="concat(substring($Date, 1, 5), '06')"/>
														<xsl:with-param name="BackupName">IRS941QuarterEndingDt[2]</xsl:with-param>
													</xsl:call-template>
													<b>2:</b> April, May, June
												</label>
											</div>
										</div>
										<div style="width:49mm;">
											<div style="float:left;clear:none;padding-top:2.6mm;">
												<xsl:call-template name="PopulateSpan">
													<xsl:with-param name="TargetNode" select="$RtnHdrData/QuarterEndingDt"/>
												</xsl:call-template>	
												<input type="checkbox" aria-label="ThirdQuarter" class="styCkbox">
													<xsl:call-template name="PopulateEnumeratedCheckbox">
														<xsl:with-param name="TargetNode" select="$RtnHdrData/QuarterEndingDt"/>
														<xsl:with-param name="DisplayedCheckboxValue" select="concat(substring($Date, 1, 5), '09')"/>
														<xsl:with-param name="BackupName">IRS941QuarterEndingDt[3]</xsl:with-param>
													</xsl:call-template>
												</input>
												<label>
													<xsl:call-template name="PopulateLabel">
														<xsl:with-param name="TargetNode" select="$RtnHdrData/QuarterEndingDt"/>
														<xsl:with-param name="DisplayedCheckboxValue" select="concat(substring($Date, 1, 5), '09')"/>
														<xsl:with-param name="BackupName">IRS941QuarterEndingDt[3]</xsl:with-param>
													</xsl:call-template>
													<b>3:</b> July, August, September
												</label>
											</div>
										</div>
										<div style="width:49mm;">
											<div style="float:left;clear:none;padding-top:2.6mm;padding-bottom:1.6mm;">
												<xsl:call-template name="PopulateSpan">
													<xsl:with-param name="TargetNode" select="$RtnHdrData/QuarterEndingDt"/>
												</xsl:call-template>
												<input type="checkbox" aria-label="FourthQuarter" class="styCkbox">
													<xsl:call-template name="PopulateEnumeratedCheckbox">
														<xsl:with-param name="TargetNode" select="$RtnHdrData/QuarterEndingDt"/>
														<xsl:with-param name="DisplayedCheckboxValue" select="concat(substring($Date, 1, 5), '12')"/>
														<xsl:with-param name="BackupName">IRS941QuarterEndingDt[4]</xsl:with-param>
													</xsl:call-template>
												</input>
												<label>
													<xsl:call-template name="PopulateLabel">
														<xsl:with-param name="TargetNode" select="$RtnHdrData/QuarterEndingDt"/>
														<xsl:with-param name="DisplayedCheckboxValue" select="concat(substring($Date, 1, 5), '12')"/>
														<xsl:with-param name="BackupName">IRS941QuarterEndingDt[4]</xsl:with-param>
													</xsl:call-template>
													<b>4:</b> October, November, December
												</label>
											</div>
										</div>
									</div>
								</div>
							</div>
							<div class="styBB" style="width:54mm;height:auto;border-width:1px;padding-left:1mm;padding-top:1mm;padding-bottom:1mm;margin-top:0.75mm;">
								<div class="styPartName" style="width:51mm;height:auto;text-align:left;padding-left:1mm;padding-top:0.4mm;padding-bottom:0.4mm;font-family:Arial;font-size:8pt;">
									Aggregate Return Filers Only
								</div>
								<div style="width:52mm;float:none;clear:both;padding-top:0.5mm;">
									<span style="font-size:8pt;">Type of filer (check one):</span>
									<div style="width:55mm;padding-top:0.5mm;float:none;clear:both;">
										<input type="checkbox" aria-label="Section 3504 Agent" class="styCkbox">
											<xsl:call-template name="PopulateCheckbox">
												<xsl:with-param name="TargetNode" select="$FormData/Section3504AgentInd"/>
												<xsl:with-param name="BackupName">IRS941XSection3504AgentInd</xsl:with-param>
											</xsl:call-template>
										</input>
										Section 3504 Agent
									</div>
									<div style="width:52mm;">
										<div style="float:left;clear:none;padding-top:0.5mm;">
											<input type="checkbox" aria-label="Certified Professional Employer Organization (CPEO)" class="styCkbox">
												<xsl:call-template name="PopulateCheckbox">
													<xsl:with-param name="TargetNode" select="$FormData/CPEOInd"/>
													<xsl:with-param name="BackupName">IRS941XCPEOInd</xsl:with-param>
												</xsl:call-template>
											</input>
											Certified Professional Employer <br/><span style="padding-left:5.7mm">Organization (CPEO)</span>
										</div>
									</div>
									<div style="width:52mm;">
										<div style="float:left;clear:none;padding-top:0.5mm;">
											<input type="checkbox" aria-label="Other Third Party" class="styCkbox">
												<xsl:call-template name="PopulateCheckbox">
													<xsl:with-param name="TargetNode" select="$FormData/OtherThirdPartyInd"/>
													<xsl:with-param name="BackupName">IRS941XOtherThirdPartyInd</xsl:with-param>
												</xsl:call-template>
											</input>
											Other Third Party
										</div>
									</div>
								</div>
							</div>
						</div>				
						<div class="styLNDesc" style="width:128mm;">
							Read the separate instructions before you complete Form 941. Type or print within the boxes.
						</div>		
					</div>								
				<div class="styBB" style="width:187mm;border-top-width:1px;">
					<div class="styPartName" style="width:13mm;text-align:center;height:4mm;padding-top:0mm;">Part 1:</div>
					<div class="styPartDesc" style="width:173.9mm;text-align:left;height:auto;padding-top:0mm;padding-left:2mm;">Answer these questions for this quarter. Employers in American Samoa, Guam, the Commonwealth of the Northern Mariana Islands, the U.S. Virgin Islands, and Puerto Rico must skip lines 2 and 3, unless you have employees who are subject to U.S. income tax withholding.</div>
				</div>				
				<div style="width:187mm;padding-left:0mm;padding-top:2mm;padding-bottom:0px;">
					<!--Line 1-->
					<div style="width:187mm;height:8mm;">
						<span style="float:left;">
							<div class="styLNLeftNumBoxSD" style="width:8mm;">1</div>
							<div class="styLNDesc" style="width:136mm;padding-left:1mm;font-weight:bold;">
								Number of employees who received wages, tips, or other compensation for the pay period<br/>
								including: <i>Mar. 12</i> (Quarter 1), <i>June 12</i> (Quarter 2), <i>Sept. 12</i> (Quarter 3), or <i>Dec. 12</i> (Quarter 4)
								<!--Dotted Line-->
								<!--<span class="styDotLn" style="float:right;padding-right:1mm;">.</span>-->
							</div>
						</span>
						<span style="float:right;padding-top:2mm;">
							<div class="styIRS941RightNumBox">1</div>
							<div class="styLNCtrNumBox" style="width:37mm;border-top-width:1px;height:5mm;text-align:right;padding-right:1mm;">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$FormData/EmployeeCnt"/>
								</xsl:call-template>
							</div>
						</span>
					</div>				
					<!--Line 2-->
					<div style="width:187mm;height:6mm;">
						<span style="float:left;">
							<div class="styLNLeftNumBoxSD" style="width:8mm;">2</div>
							<div class="styLNDesc" style="width:136mm;padding-left:1mm;font-weight:bold;">
								<span style="float:left;">Wages, tips, and other compensation </span>
								<!--Dotted Line-->
							<span class="styDotLn" style="float:right;padding-right:1mm;">....................</span>
							</div>
						</span>
						<span style="float:right">
							<div class="styIRS941RightNumBox">2</div>
							<div class="styLNCtrNumBox" style="width:37mm;border-top-width:1px;height:5mm;text-align:right;padding-right:1mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/WagesAmt"/>
								</xsl:call-template>
							</div>
						</span>
					</div>					
					<!--Line 3-->
					<div style="width:187mm;height:6mm;">
						<span style="float:left;">
							<div class="styLNLeftNumBoxSD" style="width:8mm;">3</div>
							<div class="styLNDesc" style="width:136mm;padding-left:1mm;font-weight:bold;">
								<span style="float:left;">Federal income tax withheld from wages, tips, and other compensation </span>
								<!--Dotted Line-->
							<span class="styDotLn" style="float:right;padding-right:1mm;">........</span>
							</div>
						</span>
						<span style="float:right;">
							<div class="styIRS941RightNumBox">3</div>
							<div class="styLNCtrNumBox" style="width:37mm;border-top-width:1px;height:5mm;text-align:right;padding-right:1mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/FederalIncomeTaxWithheldAmt"/>
								</xsl:call-template>
							</div>
						</span>
					</div>
					<!--Line 4-->
					<div style="width:187mm;height:6mm;">
						<div class="styLNLeftNumBoxSD" style="width:8mm;">4</div>
						<div class="styLNDesc" style="width:130mm;padding-left:1mm;font-weight:bold;">
							If no wages, tips, and other compensation are subject to social security or Medicare tax
						</div>
						<!--4/28/2020 AM: Field number off by a hairline and cannot be aligned as it will cause it to wrap if width is max and unable to change the font size-->
						<span style="float:right;">
							<!--<div class="styIRS941RightNumBox">4</div>-->
							<input type="checkbox" aria-label="WagesNotSubjectToSocialSecurityOrMedicareTax" class="styCkbox">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$FormData/WagesNotSubjToSSMedcrTaxInd"/>
									<xsl:with-param name="BackupName">941WagesNotSubjToSSMedcrTaxInd</xsl:with-param>
								</xsl:call-template>
							</input>
							<label>
								<xsl:call-template name="PopulateLabel">
									<xsl:with-param name="TargetNode" select="$FormData/WagesNotSubjToSSMedcrTaxInd"/>
									<xsl:with-param name="BackupName">941WagesNotSubjToSSMedcrTaxInd</xsl:with-param>
								</xsl:call-template>
								<b><span style="width:1mm;"/>Check and go to line 6.</b><br/>
							</label>
						</span>
					</div>
					<!--Line 5 Header-->
					<div style="width:187mm">
						<span style="width:60mm;"/>
						<span style="width:36mm;font-weight:bold;text-align:center;">Column 1</span>
						<span style="width:14mm;"/>
						<span style="width:36mm;font-weight:bold;text-align:center;">Column 2</span>
					</div>			
					<!--Line 5-->
					<div style="width:187mm;height:6mm;">
						<div class="styLNLeftNumBoxSD" style="width:8mm;padding-top:1mm;">5a</div>
						<div class="styLNDesc" style="width:52mm;padding-left:1mm;padding-top:1mm;font-weight:bold;">
							<span style="float:left;">Taxable social security wages </span>
							<!--Dotted Line-->
							<span class="styDotLn" style="float:right;padding-right:1mm;">.</span>
						</div>
						<div class="styLNCtrNumBox" style="width:36mm;border-top-width:1px;height:5mm;text-align:right;padding-right:1mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/SocialSecurityWageAndTaxGrp/SocialSecurityTaxCashWagesAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNDesc" style="width:14mm;text-align:center;padding-top:1mm;">
							x 0.124 =
						</div>
						<div class="styLNCtrNumBox" style="width:36mm;border-top-width:1px;height:5mm;text-align:right;padding-right:1mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/SocialSecurityWageAndTaxGrp/SocialSecurityTaxAmt"/>
							</xsl:call-template>
						</div>
						<!--<div class="styBB" style="width:38mm;height:34mm;float:right;border-left-width:1px;border-right-width:1px;border-top-width:1px;padding-left:1mm;padding-top:1mm;font-size:6.5pt"> *Include taxable qualified sick and family leave wages paid in 2023 for leave taken after March 31, 2021, and before October 1, 2021, on line 5a. Use lines 5a(i) and 5a(ii) <b>only</b> for taxable qualified sick and family leave wages paid in 2023 for leave taken after March 31, 2020, and before April 1, 2021.
						</div>-->	
					</div>
					<!--Line 5a(i)-->
					<!--<div style="width:187mm;height:7mm;">
						<div class="styLNLeftNumBoxSD" style="width:8mm;">5a</div>
						<div class="styLNDesc" style="width:52mm;padding-left:1mm;font-weight:bold;">
							<span style="float:left;">(i) Qualified sick leave wages </span>
							--><!--Dotted Line--><!--
							<span class="styDotLn" style="float:right;padding-right:1mm;">..</span>
						</div>
						<div class="styLNCtrNumBox" style="width:36mm;border-top-width:1px;height:6mm;text-align:right;padding-top:1mm;padding-right:1mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/SSWageTaxQlfySickLeaveGrp/SocialSecurityQlfyPdSLWageAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNDesc" style="width:14mm;text-align:center;padding-top:2mm;">
							x 0.062 =
						</div>
						<div class="styLNCtrNumBox" style="width:36mm;border-top-width:1px;height:6mm;text-align:right;padding-top:1mm;padding-right:1mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/SSWageTaxQlfySickLeaveGrp/SocialSecurityQlfyPdSLTaxAmt"/>
							</xsl:call-template>
						</div>
					</div>-->
					<!--Line 5a(ii)-->
					<!--<div style="width:187mm;height:7mm;">
						<div class="styLNLeftNumBoxSD" style="width:8mm;">5a</div>
						<div class="styLNDesc" style="width:52mm;padding-left:1mm;font-weight:bold;">
							<span style="float:left;">(ii) Qualified family leave wages </span>
							--><!--Dotted Line--><!--
							<span class="styDotLn" style="float:right;padding-right:1mm;">.</span>
						</div>
						<div class="styLNCtrNumBox" style="width:36mm;border-top-width:1px;height:6mm;text-align:right;padding-top:1mm;padding-right:1mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/SSWageTaxQlfyFamilyLeaveGrp/SocialSecurityQlfyPdFMLWageAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNDesc" style="width:14mm;text-align:center;padding-top:2mm;">
							x 0.062 =
						</div>
						<div class="styLNCtrNumBox" style="width:36mm;border-top-width:1px;height:6mm;text-align:right;padding-top:1mm;padding-right:1mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/SSWageTaxQlfyFamilyLeaveGrp/SocialSecurityQlfyPdFMLTaxAmt"/>
							</xsl:call-template>
						</div>
					</div>-->
					<!--Line 5b-->
					<div style="width:187mm;height:6mm;">
						<div class="styLNLeftNumBoxSD" style="width:8mm;padding-top:1mm;">5b</div>
						<div class="styLNDesc" style="width:52mm;padding-left:1mm;padding-top:1mm;font-weight:bold;">
							<span style="float:left;">Taxable social security tips </span>
							<!--Dotted Line-->
							<span class="styDotLn" style="float:right;padding-right:1mm;">..</span>
						</div>
						<div class="styLNCtrNumBox" style="width:36mm;border-top-width:1px;height:5mm;text-align:right;padding-right:1mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/SocialSecurityTipsAndTaxGrp/TaxableSocSecTipsAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNDesc" style="width:14mm;text-align:center;padding-top:1mm;">
							x 0.124 =
						</div>
						<div class="styLNCtrNumBox" style="width:36mm;border-top-width:1px;height:5mm;text-align:right;padding-right:1mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/SocialSecurityTipsAndTaxGrp/TaxOnSocialSecurityTipsAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!--Line 5c-->
					<div style="width:187mm;height:6mm;">
						<div class="styLNLeftNumBoxSD" style="width:8mm;padding-top:1mm;">5c</div>
						<div class="styLNDesc" style="width:52mm;padding-left:1mm;padding-top:1mm;font-weight:bold;">
							<span style="float:left;">Taxable Medicare wages &amp; tips </span>
							<!--Dotted Line-->
							<span class="styDotLn" style="float:right;padding-right:1mm;">.</span>
						</div>
						<div class="styLNCtrNumBox" style="width:36mm;border-top-width:1px;height:5mm;text-align:right;padding-right:1mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/MedicareWageTipsAndTaxGrp/TaxableMedicareWagesTipsAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNDesc" style="width:14mm;text-align:center;padding-top:1mm;">
							x 0.029 =
						</div>
						<div class="styLNCtrNumBox" style="width:36mm;border-top-width:1px;height:5mm;text-align:right;padding-right:1mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/MedicareWageTipsAndTaxGrp/TaxOnMedicareWagesTipsAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!--Line 5d-->
					<div style="width:187mm;height:6mm;">
						<div class="styLNLeftNumBoxSD" style="width:8mm;padding-top:1mm;">5d</div>
						<div class="styLNDesc" style="width:52mm;padding-left:1mm;padding-top:1mm;font-weight:bold;">
							Taxable wages &amp; tips subject to<br/>Additional Medicare Tax withholding
						</div>
						<div style="float:left;padding-top:2mm;">
							<div class="styLNCtrNumBox" style="width:36mm;border-top-width:1px;height:5mm;text-align:right;padding-right:1mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/AddnlMedicareWageTipsAndTaxGrp/TxblWageTipsSubjAddnlMedcrAmt"/>
								</xsl:call-template>
							</div>
							<div class="styLNDesc" style="width:14mm;text-align:center;padding-top:1mm;">
								x 0.009 =
							</div>
							<div class="styLNCtrNumBox" style="width:36mm;border-top-width:1px;height:5mm;text-align:right;padding-right:1mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/AddnlMedicareWageTipsAndTaxGrp/TaxOnWageTipsSubjAddnlMedcrAmt"/>
								</xsl:call-template>
							</div>
						</div>
					</div>
					<!--Line 5e-->
					<div style="width:187mm;height:auto;padding-top:3mm;">
						<span style="float:left;">
							<div class="styLNLeftNumBoxSD" style="width:8mm;padding-top:1mm;">5e</div>
							<div class="styLNDesc" style="width:136mm;padding-left:1mm;padding-top:1mm;">
								<span style="float:left;"><b>Total social security and Medicare taxes.</b> Add Column 2 from lines 5a, 5b, 5c, and 5d </span>
								<!--Dotted Line-->
							<span class="styDotLn" style="float:right;padding-right:1mm;">.....</span>
							</div>
						</span>
						<span style="float:right;">
							<div class="styIRS941RightNumBox">5e</div>
							<div class="styLNCtrNumBox" style="width:37mm;border-top-width:1px;height:5mm;text-align:right;padding-right:1mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/TotalSSMdcrTaxAmt"/>
								</xsl:call-template>
							</div>
						</span>
					</div>
					<!--Line 5f-->
					<div style="width:187mm;height:6mm;">
						<span style="float:left;">
							<div class="styLNLeftNumBoxSD" style="width:8mm;padding-top:1mm;">5f</div>
							<div class="styLNDesc" style="width:136mm;padding-left:1mm;padding-top:1mm;">
								<span style="float:left;"><b>Section 3121(q) Notice and Demand—Tax due on unreported tips</b> (see instructions) </span>
								<!--Dotted Line-->
							<span class="styDotLn" style="float:right;padding-right:1mm;">.....</span>
							</div>
						</span>
						<span style="float:right;">
							<div class="styIRS941RightNumBox">5f</div>
							<div class="styLNCtrNumBox" style="width:37mm;border-top-width:1px;height:5mm;text-align:right;padding-right:1mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/TaxOnUnreportedTips3121qAmt"/>
								</xsl:call-template>
							</div>
						</span>
					</div>
					<!--Line 6-->
					<div style="width:187mm;height:6mm;">
						<span style="float:left;">
							<div class="styLNLeftNumBoxSD" style="width:8mm;padding-top:1mm;">6</div>
							<div class="styLNDesc" style="width:136mm;padding-left:1mm;padding-top:1mm;">
								<span style="float:left;"><b>Total taxes before adjustments</b>. Add lines 3, 5e, and 5f </span>
								<!--Dotted Line-->
							<span class="styDotLn" style="float:right;padding-right:1mm;">..............</span>
							</div>
						</span>
						<span style="float:right;">
							<div class="styIRS941RightNumBox">6</div>
							<div class="styLNCtrNumBox" style="width:37mm;border-top-width:1px;height:5mm;text-align:right;padding-right:1mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/TotalTaxBeforeAdjustmentAmt"/>
								</xsl:call-template>
							</div>
						</span>
					</div>
					<!--Line 7-->
					<div style="width:187mm;height:6mm;">
						<span style="float:left;">
							<div class="styLNLeftNumBoxSD" style="width:8mm;padding-top:1mm;">7</div>
							<div class="styLNDesc" style="width:136mm;padding-left:1mm;padding-top:1mm;font-weight:bold;">
								<span style="float:left;">Current quarter's adjustment for fractions of cents </span>
								<!--Dotted Line-->
							<span class="styDotLn" style="float:right;padding-right:1mm;">...............</span>
							</div>
						</span>
						<span style="float:right;">
							<div class="styIRS941RightNumBox">7</div>
							<div class="styLNCtrNumBox" style="width:37mm;border-top-width:1px;height:5mm;text-align:right;padding-right:1mm;">
								<!-- 7/9/2015 AM: Per KISAM IM02060648, choose statement added to properly display negative numbers and cents only.-->
								<xsl:choose>
									<xsl:when test="starts-with($FormData/CurrentQtrFractionsCentsAmt,'-') or starts-with($FormData/CurrentQtrFractionsCentsAmt,'.')">
										<span style="color:darkblue;">
											<xsl:call-template name="PlaceCommas">
												<xsl:with-param name="MaxSize" select="15"/>
												<xsl:with-param name="MaxSizeWithSign" select="16"/>
												<xsl:with-param name="TargetNode" select="$FormData/CurrentQtrFractionsCentsAmt"/>
											</xsl:call-template>
										</span>
									</xsl:when>
									<xsl:otherwise>
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/CurrentQtrFractionsCentsAmt"/>
										</xsl:call-template>
									</xsl:otherwise>
								</xsl:choose>
							</div>
						</span>
					</div>
					<!--Line 8-->
					<div style="width:187mm;height:6mm;">
						<span style="float:left;">
							<div class="styLNLeftNumBoxSD" style="width:8mm;padding-top:1mm;">8</div>
							<div class="styLNDesc" style="width:136mm;padding-left:1mm;padding-top:1mm;font-weight:bold;">
								<span style="float:left;">Current quarter's adjustment for sick pay </span>
								<!--Dotted Line-->
							<span class="styDotLn" style="float:right;padding-right:1mm;">..................</span>
							</div>
						</span>
						<span style="float:right;">
							<div class="styIRS941RightNumBox">8</div>
							<div class="styLNCtrNumBox" style="width:37mm;border-top-width:1px;height:5mm;text-align:right;padding-right:1mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/CurrentQuarterSickPaymentAmt"/>
								</xsl:call-template>
							</div>
						</span>
					</div>
					<!--Line 9-->
					<div style="width:187mm;height:6mm;">
						<span style="float:left;">
							<div class="styLNLeftNumBoxSD" style="width:8mm;padding-top:1mm;">9</div>
							<div class="styLNDesc" style="width:136mm;padding-left:1mm;padding-top:1mm;font-weight:bold;">
								<span style="float:left;">Current quarter's adjustments for tips and group-term life insurance </span>
								<!--Dotted Line-->
							<span class="styDotLn" style="float:right;padding-right:1mm;">.........</span>
							</div>
						</span>
						<span style="float:right;">
							<div class="styIRS941RightNumBox">9</div>
							<div class="styLNCtrNumBox" style="width:37mm;border-top-width:1px;height:5mm;text-align:right;padding-right:1mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/CurrQtrTipGrpTermLifeInsAdjAmt"/>
								</xsl:call-template>
							</div>
						</span>
					</div>
					<!--Line 10-->
					<div style="width:187mm;height:6mm;">
						<span style="float:left;">
							<div class="styLNLeftNumBox" style="width:8mm;padding-top:1mm;">10</div>
							<div class="styLNDesc" style="width:136mm;padding-left:1mm;padding-top:1mm;">
								<span style="float:left;"><b>Total taxes after adjustments.</b> Combine lines 6 through 9 </span>
								<!--Dotted Line-->
								<span class="styDotLn" style="float:right;padding-right:1mm;">..............</span>
							</div>
						</span>
						<span style="float:right;">
							<div class="styIRS941RightNumBox">10</div>
							<div class="styLNCtrNumBox" style="width:37mm;border-top-width:1px;height:5mm;text-align:right;padding-right:1mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/TotalTaxAfterAdjustmentAmt"/>
								</xsl:call-template>
							</div>
						</span>
					</div>					
					<!-- 8/25/2016 Line 11 will be moved and named as Line 13. Adding two new lines (Line 11 and 12) and numbering will redone -->
					<!-- 4/28/2020 New lines 11a and going forward due COVID-19 legislation -->
					<!-- DOUBLE CHECK PUSHPIN -->
					<!--Line 11-->
					<div style="width:187mm;height:6mm;">
						<span style="float:left;">
							<div class="styLNLeftNumBox" style="width:8mm;padding-top:1mm;">11</div>
							<div class="styLNDesc" style="width:136mm;padding-left:1mm;padding-top:1mm;">
								<span style="float:left;"><b>Qualified small business payroll tax credit for increasing research activities.</b> Attach Form 8974 </span>
								<xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode" select="$FormData/PayrollTaxCreditAmt"/>
								</xsl:call-template>								
							</div>
						</span>
						<span style="float:right;">
							<div class="styIRS941RightNumBox">11 </div>
							<div class="styLNCtrNumBox" style="width:37mm;border-top-width:1px;height:5mm;text-align:right;padding-right:1mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/PayrollTaxCreditAmt"/>
								</xsl:call-template>
							</div>
						</span>
					</div>
					<!--Line 11b-->
					<!--<div style="width:187mm;height:6mm;">
						<span style="float:left;">
							<div class="styLNLeftNumBox" style="width:8mm;padding-top:1mm;">11b</div>
							<div class="styLNDesc" style="width:136mm;padding-left:1mm;padding-top:1mm;font-weight:bold">
								<span style="float:left;">Nonrefundable portion of credit for qualified sick and family leave wages from Worksheet 1 </span>
								--><!--Dotted Line--><!--
								<span class="styDotLn" style="float:right;padding-right:1mm;">.</span>
							</div>							
						</span>
						<span style="float:right;">
							<div class="styIRS941RightNumBox">11b </div>
							<div class="styLNCtrNumBox" style="width:37mm;border-top-width:1px;height:5mm;text-align:right;padding-right:1mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/NrfdblCrQlfySLFMLWagesAmt"/>
								</xsl:call-template>
							</div>
						</span>
					</div>-->
					<!--Line 11c-->
					<!--<div style="width:187mm;height:6mm;">
						<span style="float:left;">
							<div class="styLNLeftNumBox" style="width:8mm;padding-top:1mm;">11c</div>
							<div class="styLNDesc" style="width:136mm;padding-left:1mm;padding-top:1mm;font-weight:bold;font-size:6.5pt">
								<span style="float:left;">Reserved for future use</span>
								--><!--<span style="float:left;">Nonrefundable portion of employee retention credit from Worksheet 1 </span>--><!--
								--><!--Dotted Line--><!--
								<span class="styDotLn" style="float:right;padding-right:1mm;">.........................</span>
							</div>							
						</span>
						<span style="float:right;">
							<div class="styIRS941RightNumBox">11c </div>
							<div class="styLNCtrNumBox" style="width:37mm;border-top-width:1px;height:5mm;text-align:right;padding-right:1mm;background-color:lightgrey">
								--><!--<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/NrfdblEmplRtntnCrCOVIDAmt"/>
								</xsl:call-template>--><!--
							</div>
						</span>
					</div>-->
				<!--Line 11d-->
				<!--<div style="width:187mm;height:8mm;padding-top:1mm">
					<span style="float:left;">
						<div class="styLNLeftNumBox" style="width:8mm;padding-top:1mm;">11d</div>
						<div class="styLNDesc" style="width:136mm;padding-left:1mm;padding-top:1mm;font-weight:bold">
						Nonrefundable portion of credit for qualified sick and family leave wages for leave taken after 
								<span style="float:left;">March 31, 2021, and before October 1, 2021</span>
							--><!--<span style="float:left;"><b>Total nonrefundable credits.</b> Add lines 11a, 11b, and 11c </span>--><!--
							--><!--Dotted Line--><!--
							<span class="styDotLn" style="float:right;padding-right:1mm;">..........</span>
						</div>							
					</span>
					<span style="float:right;padding-top:2mm">
						<div class="styIRS941RightNumBox">11d </div>
						<div class="styLNCtrNumBox" style="width:37mm;border-top-width:1px;height:5mm;text-align:right;padding-right:1mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/NrfdblCrQlfySLFMLWagesAftrAmt"/>
							</xsl:call-template>
						</div>
					</span>
				</div>-->
				<!--Line 11e-->
				<!--<div style="width:187mm;height:8mm;padding-top:1mm">
					<span style="float:left;">
						<div class="styLNLeftNumBox" style="width:8mm;padding-top:1mm;">11e</div>
						<div class="styLNDesc" style="width:136mm;padding-left:1mm;padding-top:1mm;font-weight:bold;">
							Nonrefundable portion of COBRA premium assistance credit (see instructions for applicable  
								<span style="float:left;">quarters)</span>
							--><!--Dotted Line--><!--
							<span class="styDotLn" style="float:right;padding-right:1mm;">.............................</span>
						</div>							
					</span>
					<span style="float:right;padding-top:2mm">
						<div class="styIRS941RightNumBox">11e </div>
						<div class="styLNCtrNumBox" style="width:37mm;border-top-width:1px;height:5mm;text-align:right;padding-right:1mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/NrfdblCOBRAPremiumSubsidyAmt"/>
							</xsl:call-template>
						</div>
					</span>
				</div>-->
				<!--Line 11f-->
				<!--<div style="width:187mm;height:6mm;padding-top:1mm">
					<span style="float:left;">
						<div class="styLNLeftNumBox" style="width:8mm;padding-top:1mm;">11f</div>
						<div class="styLNDesc" style="width:96mm;padding-left:1mm;padding-top:1mm;font-weight:bold;">
							<span style="float:left;">Number of individuals provided COBRA premium assistance</span>
							--><!--Dotted Line--><!--
							--><!--<span class="styDotLn" style="float:right;padding-right:1mm;">...........</span>--><!--
						</div>							
					</span>
					<span style="float:left;">
						--><!--<div class="styIRS941RightNumBox">11f </div>--><!--
						<div class="styLNCtrNumBox" style="width:37mm;border-top-width:1px;height:5mm;text-align:right;padding-right:1mm;">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/COBRAPremiumSubsidyRcpntCnt"/>
							</xsl:call-template>
						</div>
					</span>
				</div>-->
				<!--Line 11g-->
				<!--<div style="width:187mm;height:6mm;padding-top:1mm">
					<span style="float:left;">
						<div class="styLNLeftNumBox" style="width:8mm;padding-top:1mm;">11g</div>
						<div class="styLNDesc" style="width:136mm;padding-left:1mm;padding-top:1mm;font-weight:bold;">
							<span style="float:left;"><b>Total nonrefundable credits.</b> Add lines 11a, 11b, 11d, and 11e </span>
							--><!--Dotted Line--><!--
							<span class="styDotLn" style="float:right;padding-right:1mm;">.........</span>
						</div>							
					</span>
					<span style="float:right;">
						<div class="styIRS941RightNumBox">11g </div>
						<div class="styLNCtrNumBox" style="width:37mm;border-top-width:1px;height:5mm;text-align:right;padding-right:1mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TotalNonrefundableCreditsAmt"/>
							</xsl:call-template>
						</div>
					</span>
				</div>-->
				<!--Line 12-->
				<div style="width:187mm;height:6mm;padding-top:1mm">
					<span style="float:left;">
						<div class="styLNLeftNumBox" style="width:8mm;padding-top:1mm;">12</div>
						<div class="styLNDesc" style="width:136mm;padding-left:1mm;padding-top:1mm;">
							<span style="float:left;"><b>Total taxes after adjustments and nonrefundable credits.</b> Subtract line 11 from line 10 </span>
							<!--Dotted Line-->
							<span class="styDotLn" style="float:right;padding-right:1mm;">....</span>
						</div>
					</span>
					<span style="float:right;">
						<div class="styIRS941RightNumBox">12</div>
						<div class="styLNCtrNumBox" style="width:37mm;border-top-width:1px;height:5mm;text-align:right;padding-right:1mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TotalTaxAmt"/>
							</xsl:call-template>
						</div>
					</span>
				</div>
				<!--Line 13-->
				<div style="width:187mm;height:6mm;">
					<span style="float:left;">
						<div class="styLNLeftNumBox" style="width:8mm;">13</div>
						<div class="styLNDesc" style="width:136mm;padding-left:1mm;font-weight:bold;">
							Total deposits for this quarter, including overpayment applied from a prior quarter and 
							overpayments applied from Form 941-X, 941-X (PR), or 944-X filed in the current quarter
							<!--Dotted Line-->
							<span class="styDotLn" style="float:right;padding-right:1mm;">..</span>
						</div>
					</span>
					<span style="float:right;padding-top:2mm;">
						<div class="styIRS941RightNumBox">13</div>
						<div class="styLNCtrNumBox" style="width:37mm;border-top-width:1px;text-align:right;padding-right:1mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TotalTaxDepositAmt"/>
							</xsl:call-template>
						</div>
					</span>
				</div>
				<!--Line 13b-->
				<!--<div style="width:187mm;height:6mm;padding-top:2mm">
					<span style="float:left;">
						<div class="styLNLeftNumBox" style="width:8mm;padding-top:1mm;">13b</div>
						<div class="styLNDesc" style="width:136mm;padding-left:1mm;padding-top:1mm;font-weight:bold">
							<span style="float:left;">Reserved for future use </span>
							--><!--<span style="float:left;">Deferred amount of the employer share of social security tax  </span>--><!--
							--><!--Dotted Line--><!--
							<span class="styDotLn" style="float:right;padding-right:1mm;">........................</span>
						</div>							
					</span>
					<span style="float:right;">
						<div class="styIRS941RightNumBox">13b </div>
						<div class="styLNCtrNumBox" style="width:37mm;border-top-width:1px;height:5mm;text-align:right;padding-right:1mm;background-color:lightgrey">
							--><!--<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/DeferredPaymentEmplrShrSSTAmt"/>
							</xsl:call-template>--><!--
						</div>
					</span>
				</div>-->
				<!--Line 13c-->
				<!--<div style="width:187mm;height:8mm;padding-top:2mm">
					<span style="float:left;">
						<div class="styLNLeftNumBox" style="width:8mm;padding-top:1mm;">13c</div>
						<div class="styLNDesc" style="width:136mm;padding-left:1mm;padding-top:1mm;font-weight:bold">
							Refundable portion of credit for qualified sick and family leave wages for leave taken 
							<span style="float:left;">before April 1, 2021</span>
							--><!--Dotted Line--><!--
							<span class="styDotLn" style="float:right;padding-right:1mm;">.........................</span>
						</div>							
					</span>
					<span style="float:right;padding-top:1mm">
						<div class="styIRS941RightNumBox">13c </div>
						<div class="styLNCtrNumBox" style="width:37mm;border-top-width:1px;height:5mm;text-align:right;padding-right:1mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/RfdblCrQlfySLFMLWagesAmt"/>
							</xsl:call-template>
						</div>
					</span>
				</div>-->
				<!--Line 13d-->
				<!--<div style="width:187mm;height:6mm;padding-top:2mm">
					<span style="float:left;">
						<div class="styLNLeftNumBox" style="width:8mm;padding-top:1mm;">13d</div>
						<div class="styLNDesc" style="width:136mm;padding-left:1mm;padding-top:1mm;font-weight:bold">
							<span style="float:left;">Reserved for future use </span>
							--><!--<span style="float:left;">Refundable portion of employee retention credit from Worksheet 1 </span>--><!--
							--><!--Dotted Line--><!--
							<span class="styDotLn" style="float:right;padding-right:1mm;">........................</span>
						</div>							
					</span>
					<span style="float:right;">
						<div class="styIRS941RightNumBox">13d </div>
						<div class="styLNCtrNumBox" style="width:37mm;border-top-width:1px;height:5mm;text-align:right;padding-right:1mm;background-color:lightgrey">
							--><!--<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/RfdblEmplRtntnCrCOVIDAmt"/>
							</xsl:call-template>--><!--
						</div>
					</span>
				</div>-->
				<!--Line 13e-->
				<!--<div style="width:187mm;height:8mm;padding-top:1mm">
					<span style="float:left;">
						<div class="styLNLeftNumBox" style="width:8mm;padding-top:1mm;">13e</div>
						<div class="styLNDesc" style="width:136mm;padding-left:1mm;padding-top:1mm;font-weight:bold">
							Refundable portion of credit for qualified sick and family leave wages for leave taken after
							<span style="float:left;">March 31, 2021, and before October 1, 2021</span>
							--><!--<span style="float:left;"><b>Total deposits and refundable credits.</b> Add lines 13a, 13c, and 13d </span>--><!--
							--><!--Dotted Line--><!--
							<span class="styDotLn" style="float:right;padding-right:1mm;">.................</span>
						</div>							
					</span>
					<span style="float:right;padding-top:2mm">
						<div class="styIRS941RightNumBox">13e </div>
						<div class="styLNCtrNumBox" style="width:37mm;border-top-width:1px;height:5mm;text-align:right;padding-right:1mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/RfdblCrQlfySLFMLWagesAftrAmt"/>
							</xsl:call-template>
						</div>
					</span>
				</div>-->
				<!--Line 13f-->
				<!--<div style="width:187mm;height:8mm;padding-top:1mm">
					<span style="float:left;">
						<div class="styLNLeftNumBox" style="width:8mm;padding-top:1mm;">13f</div>
						<div class="styLNDesc" style="width:136mm;padding-left:1mm;padding-top:1mm;font-weight:bold">
							Refundable portion of COBRA premium assistance credit (see instructions for applicable  
							<span style="float:left;">quarters)</span>
							--><!--<span style="float:left;">Total advances received from filing Form(s) 7200 for the quarter </span>--><!--
							--><!--Dotted Line--><!--
							<span class="styDotLn" style="float:right;padding-right:1mm;">.............................</span>
						</div>							
					</span>
					<span style="float:right;padding-top:2mm">
						<div class="styIRS941RightNumBox">13f </div>
						<div class="styLNCtrNumBox" style="width:37mm;border-top-width:1px;height:5mm;text-align:right;padding-right:1mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/RfdblCOBRAPremiumSubsidyAmt"/>
							</xsl:call-template>
						</div>
					</span>
				</div>-->
				<!--Line 13g-->
				<!--<div style="width:187mm;height:6mm;padding-top:2mm">
					<span style="float:left;">
						<div class="styLNLeftNumBox" style="width:8mm;padding-top:1mm;">13g</div>
						<div class="styLNDesc" style="width:136mm;padding-left:1mm;padding-top:1mm;">
							<span style="float:left;"><b>Total deposits and refundable credits.</b> Add lines 13a, 13c, 13e and 13f </span>
							--><!--Dotted Line--><!--
							<span class="styDotLn" style="float:right;padding-right:1mm;">.........</span>
						</div>							
					</span>
					<span style="float:right;">
						<div class="styIRS941RightNumBox">13g </div>
						<div class="styLNCtrNumBox" style="width:37mm;border-top-width:1px;height:5mm;text-align:right;padding-right:1mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TotalPaymentRefundableCrAmt"/>
							</xsl:call-template>
						</div>
					</span>
				</div>-->
				<!--5/11/2021 Lines 13e and 13f are new lines 13h and 13i -->
				<!--Line 13h-->
				<!--<div style="width:187mm;height:6mm;padding-top:2mm">
					<span style="float:left;">
						<div class="styLNLeftNumBox" style="width:8mm;padding-top:1mm;">13h</div>
						<div class="styLNDesc" style="width:136mm;padding-left:1mm;padding-top:1mm;font-weight:bold">
							<span style="float:left;">Reserved for future use </span>
							--><!--<span style="float:left;">Total advances received from filing Form(s) 7200 for the quarter </span>--><!--
							--><!--Dotted Line--><!--
							<span class="styDotLn" style="float:right;padding-right:1mm;">........................</span>
						</div>							
					</span>
					<span style="float:right;">
						<div class="styIRS941RightNumBox">13h</div>
						<div class="styLNCtrNumBox" style="width:37mm;border-top-width:1px;height:5mm;text-align:right;padding-right:1mm;background-color:lightgrey">
							--><!--<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TotAdvncPymtEmplrCrReqQtrAmt"/>
							</xsl:call-template>--><!--
						</div>
					</span>
				</div>-->
				<!--Line 13i-->
				<!--<div style="width:187mm;height:6mm;padding-top:2mm">
					<span style="float:left;">
						<div class="styLNLeftNumBox" style="width:8mm;padding-top:1mm;">13i</div>
						<div class="styLNDesc" style="width:136mm;padding-left:1mm;padding-top:1mm;font-weight:bold">
							<span style="float:left;">Reserved for future use </span>
							--><!--<span style="float:left;"><b>Total deposits and refundable credits less advances.</b> Subtract line 13h from line 13g </span>--><!--
							--><!--Dotted Line--><!--
							<span class="styDotLn" style="float:right;padding-right:1mm;">........................</span>
						</div>							
					</span>
					<span style="float:right;">
						<div class="styIRS941RightNumBox">13i</div>
						<div class="styLNCtrNumBox" style="width:37mm;border-top-width:1px;height:5mm;text-align:right;padding-right:1mm;background-color:lightgrey">
							--><!--<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/NetTotalPaymentRefundableCrAmt"/>
							</xsl:call-template>--><!--
						</div>
					</span>
				</div>-->
					<!--Line 14-->
					<div style="width:187mm;height:6mm;padding-top:1mm;">
						<span style="float:left;">
							<div class="styLNLeftNumBox" style="width:8mm;padding-top:2mm;">14</div>
							<div class="styLNDesc" style="width:136mm;padding-left:1mm;padding-top:2mm;">
								<span style="float:left;"><b>Balance due.</b> If line 12 is more than line 13, enter the difference and see instructions </span>
								<!--Dotted Line-->
								<span class="styDotLn" style="float:right;padding-right:1mm;">......</span>
							</div>
						</span>
						<span style="float:right;padding-top:1mm;">
							<div class="styIRS941RightNumBox">14</div>
							<div class="styLNCtrNumBox" style="width:37mm;border-top-width:1px;height:5mm;text-align:right;padding-right:1mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/BalanceDueAmt"/>
								</xsl:call-template>
							</div>
						</span>
					</div>
					<!-- 4/21/2016 AM: Changed font of Line 13 to 6.5pt to accomodate max number of digits in amount field and adjusted the width. -->
					<!--Line 15a, 15b-->
					<div style="width:187mm;height:6mm;padding-top:1mm;">
						<div class="styLNLeftNumBox" style="width:8mm;padding-top:2mm;">15a</div>
						<div class="styLNDesc" style="width:80mm;padding-left:1mm;padding-top:2mm;padding-right:1mm;font-size:6.5pt;">
							<b>Overpayment.</b> If line 13 is more than line 12, enter the difference
						</div>
						<div class="styLNCtrNumBox" style="width:32mm;padding-top:.5mm;border-top-width:1px;height:5mm;text-align:right;padding-right:1mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/OverpaymentGrp/OverpaidAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNDesc" style="width:19mm;text-align:center;padding-top:2mm;font-size:6.5pt;margin-left:1mm;">
							<b>15b</b> Check one: 
						</div>
						<div style="width:26mm;padding-top:1mm;float:left;">
							<xsl:call-template name="PopulateSpan">
								<xsl:with-param name="TargetNode" select="$FormData/OverpaymentGrp/ApplyOverpaymentNextReturnInd"/>
							</xsl:call-template>
							<input type="checkbox" aria-label="ApplyToNextReturn" class="styCkbox">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$FormData/OverpaymentGrp/ApplyOverpaymentNextReturnInd"/>
									<xsl:with-param name="BackupName">941ApplyOverpaymentNextReturnInd</xsl:with-param>
								</xsl:call-template>
							</input>
							<label>
								<xsl:call-template name="PopulateLabel">
									<xsl:with-param name="TargetNode" select="$FormData/OverpaymentGrp/ApplyOverpaymentNextReturnInd"/>
									<xsl:with-param name="BackupName">941ApplyOverpaymentNextReturnInd</xsl:with-param>
								</xsl:call-template>
								<span style="font-size:5.5pt;">Apply to next return.</span>
							</label>
						</div>	
						<div style="width:21mm;padding-top:1mm;float:left;">	
							<xsl:call-template name="PopulateSpan">
								<xsl:with-param name="TargetNode" select="$FormData/OverpaymentGrp/RefundOverpaymentInd"/>
							</xsl:call-template>
							<input type="checkbox" aria-label="SendARefund" class="styCkbox">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$FormData/OverpaymentGrp/RefundOverpaymentInd"/>
									<xsl:with-param name="BackupName">941RefundOverpaymentInd</xsl:with-param>
								</xsl:call-template>
							</input>
							<label>
								<xsl:call-template name="PopulateLabel">
									<xsl:with-param name="TargetNode" select="$FormData/OverpaymentGrp/RefundOverpaymentInd"/>
									<xsl:with-param name="BackupName">941RefundOverpaymentInd</xsl:with-param>
								</xsl:call-template>
								<span style="font-size:5.5pt;">Send a refund.</span>
							</label>
						</div>
					</div>
					<!--Line 15c, 15d-->
					<div class="styStdDiv">
						<div class="styLNLeftNumBox" style="height:4.5mm;padding-left:1mm;">15c</div>
						<div class="styLNDesc" style="height:4mm;">
							<span style="width:25mm;float:left;clear:none;padding-left:1mm;">
							   Routing number
							</span>
							<span class="styLNCtrNumBox" style="width:34mm;border-top-width:1px;padding-top:0mm;padding-bottom:0mm;font-weight:normal">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$FormData/DirectDepositGrp/RoutingTransitNum"/>
								</xsl:call-template>
							</span>
							<span style="width:100px;"/>
							<span class="styBoldText">15d</span>
							<span style="width:8px;"/>Type:
							<span style="width:8px;"/>
							<input type="checkbox" class="styCkboxNM" aria-label="Checking Account">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$FormData/DirectDepositGrp/CheckingAccountInd"/>
									<xsl:with-param name="BackupName">IRS1041CheckingAccountInd</xsl:with-param>
								</xsl:call-template>
							</input>
							<label>
								<xsl:call-template name="PopulateLabel">
									<xsl:with-param name="TargetNode" select="$FormData/DirectDepositGrp/CheckingAccountInd"/>
									<xsl:with-param name="BackupName">IRS1041CheckingAccountInd</xsl:with-param>
								</xsl:call-template>
								Checking
							</label>
								<input type="checkbox" class="styCkboxNM" aria-label="Savings Account" style="margin-left:4mm;">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$FormData/DirectDepositGrp/SavingsAccountInd"/>
									<xsl:with-param name="BackupName">IRS1041SavingsAccountInd</xsl:with-param>
								</xsl:call-template>
							</input>
							<label>
								<xsl:call-template name="PopulateLabel">
									<xsl:with-param name="TargetNode" select="$FormData/DirectDepositGrp/SavingsAccountInd"/>
									<xsl:with-param name="BackupName">IRS1041SavingsAccountInd</xsl:with-param>
								</xsl:call-template>
								Savings
							</label>
						</div>					
					</div>							
					<!-- Line 15e -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBox" style="height:4.5mm;padding-left:1mm;">15e</div>
						<div class="styLNDesc" style="height:4.5mm;">
							<span style="width:25mm;float:left;clear:none;padding-left:1mm">
							   Account number
							</span>
							<span class="styLNCtrNumBox" style="width:84mm;border-top-width:1px;padding-top:0mm;padding-bottom:0mm;font-weight:normal">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$FormData/DirectDepositGrp/DepositorAccountNum"/>
								</xsl:call-template>
							</span>
						</div>	
					</div>
					<!-- Bullet Message -->
					<div class="styBB" style="width:187mm;height:5mm;border-bottom-width:2px">
						<span style="float:left;">
							<div class="styLNDesc" style="width:130mm;padding-left:5mm;font-weight:bold;padding-top:1mm;">
								You MUST complete both pages of Form 941 and SIGN it.
							</div>
						</span>
					</div>						
				</div>
				<!-- Page boundary -->
				<div class="pageEnd" style="width:187mm;border-top-width:1px;">
					<span style="float:left;clear:none;font-weight:bold;font-size:6pt;padding-top:0.2mm;">For Privacy Act and Paperwork Reduction Act Notice, see separate instructions.</span>
					<span style="float:left;clear:none;margin-left:5mm;font-size:6.5pt"><a style="text-decoration:none;color:black;" href="http://www.irs.gov/Form941" title="Link to IRS.gov"><i>www.irs.gov/Form941</i></a></span>
					<span style="float:left;clear:none;margin-left:5mm;font-size:6.5pt">Cat. No. 17001Z</span>
					<span style="float:right;clear:none;font-size:6.5pt">Form <span class="styBoldText" style="font-size:7.5pt;">941</span> (Rev. 3-2026)</span>
				</div>
				<p style="page-break-before: always"/>
				<!--Ends page 1-->
				<!--Begin Page 2-->
				<div style="width:187mm;">
					<div style="width:187mm;font-size:12pt;font-family:Courier New;font-weight:bold;text-align:right;">950224</div>
					<!--Name Shown on return-->
					<div class="styBB" style="width:187mm;font-size:7pt;border-top-width:2px;">
						<div class="styFNBox" style="width:126mm; height:9mm;">
							<b>Name</b><i> (not your trade name)</i><br/>
							<xsl:call-template name="PopulateReturnHeaderFiler">
								<xsl:with-param name="TargetNode">BusinessNameLine1Txt</xsl:with-param> 
							</xsl:call-template><br/>
							<xsl:call-template name="PopulateReturnHeaderFiler">
								<xsl:with-param name="TargetNode">BusinessNameLine2Txt</xsl:with-param> 
							</xsl:call-template>
							<div style="line-height:100%; font-family:verdana;font-size:7pt"/>
						</div>
						<span style="padding-left:.5mm">
							<b>Employer identification number (EIN)</b><br/>
							<div style="padding-top:2.5mm;padding-left:.5mm;">
								<xsl:call-template name="PopulateReturnHeaderFiler">
									<xsl:with-param name="TargetNode">EIN</xsl:with-param>
								</xsl:call-template>
							</div>
						</span>
					</div>
				</div>
				<!--Part 1 (continued)-->
				<!--<div class="styBB" style="width:187mm;border-top-width:1px;">
					<div class="styPartName" style="width:13mm;text-align:center;height:4mm;padding-top:0mm;">Part 1:</div>
					<div class="styPartDesc" style="width:173.9mm;text-align:left;height:4mm;padding-top:0mm;padding-left:2mm;font-weight:normal"><b>Answer these questions for this quarter.</b> (continued)</div>
				</div>-->	
					<!--Part 2-->
					<div class="styBB" style="width:187mm;border-top-width:1px;">			
						<div class="styPartName" style="width:13mm;text-align:center;height:4mm;padding-top:0mm;">Part 2:</div>
						<div class="styPartDesc" style="width:173.9mm;text-align:left;height:4mm;padding-top:0mm;padding-left:2mm;">Tell us about your deposit schedule and tax liability for this quarter.</div>
					</div>
					<div class="styLNDesc" style="width:187mm;height:6mm;font-weight:bold;padding-left:2mm;">
						If you're unsure about whether you're a monthly schedule depositor or a semiweekly schedule depositor, see section 11 of Pub. 15.
					</div>
					<!--Line 16-->
					<div style="width:187mm;padding-bottom:3mm;padding-top:1mm;">
						<div class="styLNLeftNumBox" style="width:6mm;">16</div>
						<div class="styLNDesc" style="width:17mm;padding-left:1mm;height:20mm">
							<b>Check one:</b>
						</div>
						<span style="vertical-align:top;">
							<xsl:call-template name="PopulateSpan">
								<xsl:with-param name="TargetNode" select="$FormData/TotalTaxLessThanLimitAmtInd"/>
							</xsl:call-template>
							<input type="checkbox" aria-label="TotalTaxLessThanLimit" class="styCkbox">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$FormData/TotalTaxLessThanLimitAmtInd"/>
									<xsl:with-param name="BackupName">941TotalTaxLessThanLimitAmtInd</xsl:with-param>
								</xsl:call-template>
							</input>
						</span>
						<label>
							<xsl:call-template name="PopulateLabel">
								<xsl:with-param name="TargetNode" select="$FormData/TotalTaxLessThanLimitAmtInd"/>
								<xsl:with-param name="BackupName">941TotalTaxLessThanLimitAmtInd</xsl:with-param>
							</xsl:call-template>
							<span style="width:158mm;padding-top:.5mm;"><b>Line 12 on this return is less than $2,500 or line 
							12 on the return for the prior quarter was less than $2,500, and you didn't incur a $100,000 next-day deposit 
							obligation during the current quarter.</b> If line 12 for the prior quarter was less than $2,500 but line 12 on 
							this return is $100,000 or more, you must provide a record of your federal tax liability. If you are a monthly 
							schedule depositor, complete the deposit schedule below; if you are a semiweekly schedule depositor, attach 
							Schedule B (Form 941). Go to Part 3.
							</span>
						</label>
						<br/><br/>
						<span>
							<xsl:call-template name="PopulateSpan">
								<xsl:with-param name="TargetNode" select="$FormData/MonthlyScheduleDepositorGrp/MonthlyScheduleDepositorInd"/>
							</xsl:call-template>
							<input type="checkbox" aria-label="MonthlyScheduleDepositor" class="styCkbox">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$FormData/MonthlyScheduleDepositorGrp/MonthlyScheduleDepositorInd"/>
									<xsl:with-param name="BackupName">941MonthlyScheduleDepositorInd</xsl:with-param>
								</xsl:call-template>
							</input>
							<label >
								<xsl:call-template name="PopulateLabel">
									<xsl:with-param name="TargetNode" select="$FormData/MonthlyScheduleDepositorGrp/MonthlyScheduleDepositorInd"/>
									<xsl:with-param name="BackupName">941MonthlyScheduleDepositorInd</xsl:with-param>
								</xsl:call-template>
								<span style="width:158mm;vertical-align:top;padding-top:.5mm;">
									<b>You were a monthly schedule depositor for the entire quarter.</b> Enter your 
									tax liability for each month and total liability for the quarter, then go to Part 3.
								</span>
							</label>
						</span>
					</div>
					<div style="width:187mm;height:7mm;">
						<div class="styLNDesc" style="font-weight:bold;width:66mm;padding-top:1mm;padding-left:32mm;text-align:right;padding-right:4mm;">
							<div style="float:left;text-align:left;">Tax liability:</div>Month 1
						</div>
						<div class="styLNCtrNumBox" style="width:37mm;border-top-width:1px;height:5mm;text-align:right;padding-right:1mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/MonthlyScheduleDepositorGrp/TaxLiabilityMonth1Amt"/>
							</xsl:call-template>
						</div>
					</div>
					<div style="width:187mm;height:7mm;">
						<div class="styLNDesc" style="font-weight:bold;width:66mm;padding-right:4mm;padding-left:32mm;padding-top:1mm;text-align:right;">
						Month 2
					</div>
					<div class="styLNCtrNumBox" style="width:37mm;border-top-width:1px;height:5mm;text-align:right;padding-right:1mm;">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/MonthlyScheduleDepositorGrp/TaxLiabilityMonth2Amt"/>
						</xsl:call-template>
					</div>
				</div>
				<div style="width:187mm;height:7mm;">
					<div class="styLNDesc" style="font-weight:bold;width:66mm;padding-right:4mm;padding-left:32mm;padding-top:1mm;text-align:right;">
					Month 3
					</div>
					<div class="styLNCtrNumBox" style="width:37mm;border-top-width:1px;height:5mm;text-align:right;padding-right:1mm;">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/MonthlyScheduleDepositorGrp/TaxLiabilityMonth3Amt"/>
						</xsl:call-template>
					</div>
				</div>
				<div style="width:187mm;height:6mm;">
					<div class="styLNDesc" style="font-weight:bold;width:66mm;padding-top:1mm;text-align:right;padding-right:4mm;">
						Total liability for quarter
					</div>
					<div class="styLNCtrNumBox" style="width:37mm;border-top-width:1px;height:5mm;text-align:right;padding-right:1mm;">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/MonthlyScheduleDepositorGrp/TotalQuarterTaxLiabilityAmt"/>
						</xsl:call-template>
					</div>
					<div class="styLNDesc" style="font-weight:bold;width:40mm;padding-left:2mm;padding-top:1mm;">
						Total must equal line 12.
					</div>
				</div>		
				<div style="width:187mm;padding-left:24mm; padding-bottom:3mm;">
					<span>
						<xsl:call-template name="PopulateSpan">
							<xsl:with-param name="TargetNode" select="$FormData/SemiweeklyScheduleDepositorInd"/>
						</xsl:call-template>
						<input type="checkbox" aria-label="SemiweeklyScheduleDepositor" class="styCkbox">
							<xsl:call-template name="PopulateCheckbox">
								<xsl:with-param name="TargetNode" select="$FormData/SemiweeklyScheduleDepositorInd"/>
								<xsl:with-param name="BackupName">941SemiweeklyScheduleDepositorInd</xsl:with-param>
							</xsl:call-template>
						</input>
						<label >
							<xsl:call-template name="PopulateLabel">
								<xsl:with-param name="TargetNode" select="$FormData/SemiweeklyScheduleDepositorInd"/>
								<xsl:with-param name="BackupName">941SemiweeklyScheduleDepositorInd</xsl:with-param>
							</xsl:call-template>
							<span style="width:155mm;vertical-align:top;">
								<b>You were a semiweekly schedule depositor for any part of this quarter.</b> 
								Complete Schedule B (Form 941), Report of Tax Liability for Semiweekly Schedule Depositors, attach 
								it to Form 941. Go to Part 3.
							</span>
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$FormData/SemiweeklyScheduleDepositorInd"/>
							</xsl:call-template>
						</label>
					</span>
				</div>
				<!--Begin Page 3-->
				<!--<div style="width:187mm;">
					<div style="width:187mm;font-size:12pt;font-family:Courier New;font-weight:bold;text-align:right;">950322</div>
					--><!--Name Shown on return--><!--
					<div class="styBB" style="width:187mm;font-size:7pt;border-top-width:2px;">
						<div class="styFNBox" style="width:126mm; height:9mm;">
							<b>Name</b><i> (not your trade name)</i><br/>
							<xsl:call-template name="PopulateReturnHeaderFiler">
								<xsl:with-param name="TargetNode">BusinessNameLine1Txt</xsl:with-param> 
							</xsl:call-template><br/>
							<xsl:call-template name="PopulateReturnHeaderFiler">
								<xsl:with-param name="TargetNode">BusinessNameLine2Txt</xsl:with-param> 
							</xsl:call-template>
							<div style="line-height:100%; font-family:verdana;font-size:7pt"/>
						</div>
						<span style="padding-left:.5mm">
							<b>Employer identification number (EIN)</b><br/>
							<div style="padding-top:2.5mm;padding-left:.5mm;">
								<xsl:call-template name="PopulateReturnHeaderFiler">
									<xsl:with-param name="TargetNode">EIN</xsl:with-param>
								</xsl:call-template>
							</div>
						</span>
					</div>
				</div>-->			
				<!--Part 3-->
				<div class="styBB" style="width:187mm;border-top-width:1px;">	
					<div class="styPartName" style="width:13mm;text-align:center;height:5mm;padding-top:1mm;">Part 3:</div>
					<div class="styPartDesc" style="width:173.9mm;text-align:left;height:5mm;padding-top:1mm;padding-left:2mm;">Tell us about your business. If a question does NOT apply to your business, leave it blank.</div>
				</div>
				<!--Line 17-->
				<div style="width:187mm;padding-bottom:2mm;padding-top:2mm;">
					<div class="styLNLeftNumBox" style="width:8mm;">17</div>
					<div class="styLNDesc" style="width:149mm;padding-left:1mm;font-weight:bold;">
						If your business has closed or you stopped paying wages
						<!--Dotted Line-->
						<span class="styDotLn" style="float:right;padding-right:1mm;">...............</span>
					</div>
					<div class="styLNDesc" style="width:30mm;padding-left:1mm;">
					<xsl:call-template name="PopulateSpan">
						<xsl:with-param name="TargetNode" select="$FormData/BusinessClosedGrp/FutureFilingNotRequiredInd"/>
					</xsl:call-template>
					<input type="checkbox" aria-label="FutureFilingNotRequired" class="styCkbox">
						<xsl:call-template name="PopulateCheckbox">
							<xsl:with-param name="TargetNode" select="$FormData/BusinessClosedGrp/FutureFilingNotRequiredInd"/>
							<xsl:with-param name="BackupName">941FutureFilingNotRequiredInd</xsl:with-param>
						</xsl:call-template>
					</input>
					<label>
						<xsl:call-template name="PopulateLabel">
							<xsl:with-param name="TargetNode" select="$FormData/BusinessClosedGrp/FutureFilingNotRequiredInd"/>
							<xsl:with-param name="BackupName">941FutureFilingNotRequiredInd</xsl:with-param>
						</xsl:call-template>
						<span style="width:1mm;"/>Check here, and<br/><br/>
					</label>
					</div>
					<div class="styLNDesc" style="width:56mm;padding-left:9mm;padding-top:1mm;">
						enter the final date you paid wages
					</div>
					<div class="styLNCtrNumBox" style="width:31mm;border-top-width:1px;height:5mm;">
						<xsl:call-template name="PopulateMonthDayYear">
							<xsl:with-param name="TargetNode" select="$FormData/BusinessClosedGrp/FinalWagesPaidDt"/>
						</xsl:call-template>
					</div>
					<div style="padding-top:1mm;padding-left:1mm">; also attach a statement to your return. See instructions.</div>
				</div>
				<!--Line 18-->
				<div style="width:187mm;height:6mm;">
					<div class="styLNLeftNumBox" style="width:8mm;">18</div>
					<div class="styLNDesc" style="width:149mm;padding-left:1mm;font-weight:bold;">
						If you are a seasonal employer and you don't have to file a return for every quarter of the year
						<!--Dotted Line-->
						<span class="styDotLn" style="float:right;padding-right:1mm;">...</span>
					</div>
					<div class="styLNDesc" style="width:30mm;padding-left:1mm;">
					<xsl:call-template name="PopulateSpan">
						<xsl:with-param name="TargetNode" select="$FormData/SeasonalEmployerInd"/>
					</xsl:call-template>
					<input type="checkbox" aria-label="SeasonalEmployer" class="styCkbox">
						<xsl:call-template name="PopulateCheckbox">
							<xsl:with-param name="TargetNode" select="$FormData/SeasonalEmployerInd"/>
							<xsl:with-param name="BackupName">941SeasonalEmployerInd</xsl:with-param>
						</xsl:call-template>
					</input>
					<label>
						<xsl:call-template name="PopulateLabel">
							<xsl:with-param name="TargetNode" select="$FormData/SeasonalEmployerInd"/>
							<xsl:with-param name="BackupName">941SeasonalEmployerInd</xsl:with-param>
						</xsl:call-template>
						<span style="width:1mm;"/>Check here.<br/>
					</label>
					</div>	
				</div>
				<!--Line 19-->
				<!--<div style="width:187mm;height:8mm;padding-top:1mm">
					<span style="float:left;">
						<div class="styLNLeftNumBox" style="width:8mm;padding-top:1mm;">19</div>
						<div class="styLNDesc" style="width:136mm;padding-left:1mm;padding-top:1mm;font-weight:bold">
							Qualified health plan expenses allocable to qualified sick leave wages for leave taken before 
							<span style="float:left;">April 1, 2021</span>
							--><!--Dotted Line--><!--
							<span class="styDotLn" style="float:right;padding-right:1mm;">...........................</span>
						</div>							
					</span>
					<span style="float:right;padding-top:2mm">
						<div class="styIRS941RightNumBox">19 </div>
						<div class="styLNCtrNumBox" style="width:37mm;border-top-width:1px;height:5mm;text-align:right;padding-right:1mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/QHPExpnssSSQlfyPdSLWageAmt"/>
							</xsl:call-template>
						</div>
					</span>
				</div>-->
				<!--Line 20-->
				<!--<div style="width:187mm;height:8mm;padding-top:1mm">
					<span style="float:left;">
						<div class="styLNLeftNumBox" style="width:8mm;padding-top:1mm;">20</div>
						<div class="styLNDesc" style="width:136mm;padding-left:1mm;padding-top:1mm;font-weight:bold">
							Qualified health plan expenses allocable to qualified family leave wages for leave taken before 
							<span style="float:left;">April 1, 2021</span>
							--><!--Dotted Line--><!--
							<span class="styDotLn" style="float:right;padding-right:1mm;">...........................</span>
						</div>							
					</span>
					<span style="float:right;padding-top:2mm">
						<div class="styIRS941RightNumBox">20</div>
						<div class="styLNCtrNumBox" style="width:37mm;border-top-width:1px;height:5mm;text-align:right;padding-right:1mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/QHPExpnssSSQlfyPdFMLWageAmt"/>
							</xsl:call-template>
						</div>
					</span>
				</div>-->
				<!--Line 21-->
				<!--<div style="width:187mm;height:6mm;padding-top:2mm">
					<span style="float:left;">
						<div class="styLNLeftNumBox" style="width:8mm;padding-top:1mm;">21</div>
						<div class="styLNDesc" style="width:136mm;padding-left:1mm;padding-top:1mm;font-weight:bold">
							<span style="float:left;">Reserved for future use </span>
							--><!--<span style="float:left;">Qualified wages for the employee retention credit</span>--><!--
							--><!--Dotted Line--><!--
							<span class="styDotLn" style="float:right;padding-right:1mm;">........................</span>
						</div>							
					</span>
					<span style="float:right;">
						<div class="styIRS941RightNumBox">21</div>
						<div class="styLNCtrNumBox" style="width:37mm;border-top-width:1px;height:5mm;text-align:right;padding-right:1mm;background-color:lightgrey">
							--><!--<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/QlfyWgsPdRtnEmplCOVIDAmt"/>
							</xsl:call-template>--><!--
						</div>
					</span>
				</div>-->
				<!--Line 22-->
				<!--<div style="width:187mm;height:6mm;padding-top:2mm">
					<span style="float:left;">
						<div class="styLNLeftNumBox" style="width:8mm;padding-top:1mm;">22</div>
						<div class="styLNDesc" style="width:136mm;padding-left:1mm;padding-top:1mm;font-weight:bold">
							<span style="float:left;">Reserved for future use </span>
							--><!--<span style="float:left;">Qualified health plan expenses for the employee retention credit</span>--><!--
							--><!--Dotted Line--><!--
							<span class="styDotLn" style="float:right;padding-right:1mm;">........................</span>
						</div>							
					</span>
					<span style="float:right;">
						<div class="styIRS941RightNumBox">22</div>
						<div class="styLNCtrNumBox" style="width:37mm;border-top-width:1px;height:5mm;text-align:right;padding-right:1mm;background-color:lightgrey">
							--><!--<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/QHPExpnssWgsPdRtnEmplCOVIDAmt"/>
							</xsl:call-template>--><!--
						</div>
					</span>
				</div>-->
				<!--Line 23-->
				<!--<div style="width:187mm;height:6mm;padding-top:2mm">
					<span style="float:left;">
						<div class="styLNLeftNumBox" style="width:8mm;padding-top:1mm;">23</div>
						<div class="styLNDesc" style="width:136mm;padding-left:1mm;padding-top:1mm;font-weight:bold">
							<span style="float:left;"> Qualified sick leave wages for leave taken after March 31, 2021, and before October 1, 2021</span>
							--><!--Dotted Line--><!--
							<span class="styDotLn" style="float:right;padding-right:1mm;">.</span>
						</div>							
					</span>
					<span style="float:right;">
						<div class="styIRS941RightNumBox">23</div>
						<div class="styLNCtrNumBox" style="width:37mm;border-top-width:1px;height:5mm;text-align:right;padding-right:1mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/QlfySLWgsAftrAmt"/>
							</xsl:call-template>
						</div>
					</span>
				</div>-->
				<!--Line 24-->
				<!--<div style="width:187mm;height:8mm;padding-top:2mm">
					<span style="float:left;">
						<div class="styLNLeftNumBox" style="width:8mm;padding-top:2mm;">24</div>
						<div class="styLNDesc" style="width:136mm;padding-left:1mm;padding-top:2mm;font-weight:bold">
							<span style="float:left;">Qualified health plan expenses allocable to qualified sick leave wages reported on line 23</span>
							--><!--Dotted Line--><!--
							<span class="styDotLn" style="float:right;padding-right:1mm;">..</span>
						</div>							
					</span>
					<span style="float:right;padding-top:2mm">
						<div class="styIRS941RightNumBox">24</div>
						<div class="styLNCtrNumBox" style="width:37mm;border-top-width:1px;height:5mm;text-align:right;padding-right:1mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/QHPExpnssQlfySLWgsAftrAmt"/>
							</xsl:call-template>
						</div>
					</span>
				</div>-->				
				<!--Line 25-->
				<!--<div style="width:187mm;height:10mm;padding-top:1mm">
					<span style="float:left;">
						<div class="styLNLeftNumBox" style="width:8mm;padding-top:2mm;">25</div>
						<div class="styLNDesc" style="width:136mm;padding-left:1mm;padding-top:2mm;font-weight:bold">
							Amounts under certain collectively bargained agreements allocable to qualified sick leave wages 
							<span style="float:left;">reported on line 23</span>
							--><!--Dotted Line--><!--
							<span class="styDotLn" style="float:right;padding-right:1mm;">.........................</span>
						</div>							
					</span>
					<span style="float:right;padding-top:3mm;">
						<div class="styIRS941RightNumBox">25</div>
						<div class="styLNCtrNumBox" style="width:37mm;border-top-width:1px;height:5mm;text-align:right;padding-right:1mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CrtnBrgnAgrmtQlfySLWgsAftrAmt"/>
							</xsl:call-template>
						</div>
					</span>
				</div>-->
				<!--5/11/2021 New lines 26-28 added -->
				<!--Line 26-->
				<!--<div style="width:187mm;height:6mm;padding-top:1mm">
					<span style="float:left;">
						<div class="styLNLeftNumBox" style="width:8mm;padding-top:2mm;">26</div>
						<div class="styLNDesc" style="width:136mm;padding-left:1mm;padding-top:2mm;font-weight:bold">
							<span style="float:left;">Qualified family leave wages for leave taken after March 31, 2021, and before October 1, 2021</span>
							--><!--Dotted Line--><!--
							--><!--<span class="styDotLn" style="float:right;padding-right:1mm;">...</span>--><!--
						</div>							
					</span>
					<span style="float:right;padding-top:1mm;">
						<div class="styIRS941RightNumBox">26</div>
						<div class="styLNCtrNumBox" style="width:37mm;border-top-width:1px;height:5mm;text-align:right;padding-right:1mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/QlfyFMLWgsAftrAmt"/>
							</xsl:call-template>
						</div>
					</span>
				</div>-->
				<!--Line 27-->
				<!--<div style="width:187mm;height:6mm;padding-top:1mm">
					<span style="float:left;">
						<div class="styLNLeftNumBox" style="width:8mm;padding-top:2mm;">27</div>
						<div class="styLNDesc" style="width:136mm;padding-left:1mm;padding-top:2mm;font-weight:bold">
							<span style="float:left;">Qualified health plan expenses allocable to qualified family leave wages reported on line 26</span>
							--><!--Dotted Line--><!--
							<span class="styDotLn" style="float:right;padding-right:1mm;">.</span>
						</div>							
					</span>
					<span style="float:right;padding-top:1mm;">
						<div class="styIRS941RightNumBox">27</div>
						<div class="styLNCtrNumBox" style="width:37mm;border-top-width:1px;height:5mm;text-align:right;padding-right:1mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/QHPExpnssQlfyFMLWgsAftrAmt"/>
							</xsl:call-template>
						</div>
					</span>
				</div>-->
				<!--Line 28-->
				<!--<div style="width:187mm;height:10mm;padding-top:1mm">
					<span style="float:left;">
						<div class="styLNLeftNumBox" style="width:8mm;padding-top:2mm;">28</div>
						<div class="styLNDesc" style="width:136mm;padding-left:1mm;padding-top:2mm;font-weight:bold">
							Amounts under certain collectively bargained agreements allocable to qualified family leave 
							<span style="float:left;">wages reported on line 26</span>
							--><!--Dotted Line--><!--
							<span class="styDotLn" style="float:right;padding-right:1mm;">........................</span>
						</div>							
					</span>
					<span style="float:right;padding-top:3mm;">
						<div class="styIRS941RightNumBox">28</div>
						<div class="styLNCtrNumBox" style="width:37mm;border-top-width:1px;height:5mm;text-align:right;padding-right:1mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CrtnBrgnAgrmtQlfyFMLWgsAftrAmt"/>
							</xsl:call-template>
						</div>
					</span>
				</div>-->
				<!--Part 4-->
				<div class="styBB" style="width:187mm;border-top-width:1px;">
					<div class="styPartName" style="width:13mm;text-align:center;height:6mm;padding-top:1mm;">Part 4:</div>
					<div class="styPartDesc" style="width:173.9mm;text-align:left;height:6mm;padding-top:1mm;padding-left:2mm;">May 
					we speak with your third-party designee?</div>
					</div>
					<div class="styLNDesc" style="width:187mm;height:auto;padding-left:9mm;padding-bottom:2mm;">
						<b>Do you want to allow an employee, a paid tax preparer, or another person to discuss this return with the IRS?</b> 
						See the instructions for details.
					</div>
					<div style="width:187mm;float:none;clear:both;padding-bottom:2mm;">
						<div style="width:19mm;float:left;padding-top:1mm;padding-left:8mm;">
							<span>
								<xsl:call-template name="PopulateSpan">
									<xsl:with-param name="TargetNode" select="$RtnHdrData/DiscussWithThirdPartyYesGrp/DiscussWithThirdPartyYesInd"/>
								</xsl:call-template>
								<input type="checkbox" aria-label="DiscussWithThirdPartyYes" class="styCkbox">
									<xsl:call-template name="PopulateYesCheckbox">
										<xsl:with-param name="TargetNode" select="$RtnHdrData/DiscussWithThirdPartyYesGrp/DiscussWithThirdPartyYesInd"/>
										<xsl:with-param name="BackupName">941DiscussWithThirdPartyYesInd</xsl:with-param>
									</xsl:call-template>
								</input>
							</span>
							<label>
								<xsl:call-template name="PopulateLabelYes">
									<xsl:with-param name="TargetNode" select="$RtnHdrData/DiscussWithThirdPartyYesGrp/DiscussWithThirdPartyYesInd"/>
									<xsl:with-param name="BackupName">941DiscussWithThirdPartyYesInd</xsl:with-param>
								</xsl:call-template>
								<span style="vertical-align:top;padding-top:1mm;">Yes.</span>
							</label>
							<br/><br/><br/><br/>
							<span>
							<xsl:call-template name="PopulateSpan">
								<xsl:with-param name="TargetNode" select="$RtnHdrData/DiscussWithThirdPartyNoInd"/>
							</xsl:call-template>
							<input type="checkbox" aria-label="DiscussWithThirdPartyNo" class="styCkbox">
								<xsl:call-template name="PopulateNoCheckbox">
									<xsl:with-param name="TargetNode" select="$RtnHdrData/DiscussWithThirdPartyNoInd"/>
									<xsl:with-param name="BackupName">941DiscussWithThirdPartyNoInd</xsl:with-param>
								</xsl:call-template>
							</input>
						</span>
						<label>
							<xsl:call-template name="PopulateLabelNo">
								<xsl:with-param name="TargetNode" select="$RtnHdrData/DiscussWithThirdPartyNoInd"/>
								<xsl:with-param name="BackupName">941DiscussWithThirdPartyNoInd</xsl:with-param>
							</xsl:call-template>
							No.
						</label>
					</div>
					<div style="width:167mm;height:7.5mm;padding-left:2mm;">
						<div class="styLNDesc" style="width:50mm;height:7.5mm;float:left;padding-top:2mm;">Designee's name and phone number </div>
						<div class="styLNCtrNumBox" style="width:60mm;height:7.5mm;border-top-width:1px;padding-top:2mm;float:left;text-align:left;padding-left:1mm;">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$RtnHdrData/DiscussWithThirdPartyYesGrp/ThirdPartyDesigneeNm"/>
							</xsl:call-template>
						</div>
						<span class="styLNCtrNumBox" style="width:10mm;border:none"/>
						<div class="styLNCtrNumBox" style="width:38mm;border-top-width:1px;height:7.5mm;padding-top:1mm;word-wrap:break-word;">
							<xsl:if test="$RtnHdrData/DiscussWithThirdPartyYesGrp/ThirdPartyDesigneePhoneNum">
								<xsl:call-template name="PopulatePhoneNumber">
									<xsl:with-param name="TargetNode" select="$RtnHdrData/DiscussWithThirdPartyYesGrp/ThirdPartyDesigneePhoneNum"/>
								</xsl:call-template>
							</xsl:if>
							<xsl:if test="$RtnHdrData/DiscussWithThirdPartyYesGrp/ThirdPartyDesigneeFrgnPhoneNum">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$RtnHdrData/DiscussWithThirdPartyYesGrp/ThirdPartyDesigneeFrgnPhoneNum"/>
								</xsl:call-template>
							</xsl:if>
						</div>
					</div>
					<div style="width:167mm;height:6mm;padding-top:2mm;padding-left:2mm;">
						<div class="styLNDesc" style="width:112.6mm;padding-top:1.5mm;">
						Select a 5-digit personal identification number (PIN) to use when talking to the IRS.
						</div>
						<div style="float:left;">
							<div class="styLNCtrNumBox" style="width:38mm;border-top-width:1px;height:6mm;float:left;">
								<xsl:call-template name="PopulatePin">
									<xsl:with-param name="TargetNode" select="$RtnHdrData/DiscussWithThirdPartyYesGrp/ThirdPartyDesigneePIN"/>
								</xsl:call-template>
							</div>
						</div>
					</div>
				</div>
				<!--Part 5-->
				<div class="styBB" style="width:187mm;border-top-width:1px;">
					<div class="styPartName" style="width:13mm;text-align:center;height:6mm;padding-top:1mm;">Part 5:</div>
					<div class="styPartDesc" style="width:173.9mm;text-align:left;height:6mm;padding-top:1mm;padding-left:2mm;">Sign here. You MUST complete both pages of Form 941 and SIGN it.</div>
				</div>
				<div class="styLNDesc" style="width:187mm;height:8mm;padding-left:2mm;font-size:6pt;">
				Under penalties of perjury, I declare that I have examined this return, including accompanying schedules and 
				statements, and to the best of my knowledge and belief, it is true, correct, and complete. Declaration of preparer (other 
				than taxpayer) is based on all information of which preparer has any knowledge.
				</div>
				<div style="width:187mm;float:none;clear:both;">
					<div style="width:22mm;height:15mm;padding-top:3mm;padding-left:2mm;font-weight:bold;font-size:8.5pt;float:left;">
						Sign your name here
					</div>
					<div class="styLNCtrNumBox" style="width:85mm;border-top-width:1px;height:15mm;float:left;word-wrap:break-word;text-align:left;padding-left:1mm;padding-right:1mm;">
						<xsl:if test="$RtnHdrData/ReportingAgentPINGrp/PIN">
							<xsl:call-template name="PopulatePin">
								<xsl:with-param name="TargetNode" select="$RtnHdrData/ReportingAgentPINGrp/PIN"/>
							</xsl:call-template>
						</xsl:if>
						<xsl:if test="$RtnHdrData/PractitionerPINGrp/TaxpayerPIN">
							<xsl:call-template name="PopulatePin">
								<xsl:with-param name="TargetNode" select="$RtnHdrData/PractitionerPINGrp/TaxpayerPIN"/>
							</xsl:call-template>
						</xsl:if>
					</div>
					<div style="width:80mm;height:10mm;float:left;padding-left:4mm;padding-top:0mm;">
						<div style="height:10mm;">
							<div style="width:17mm;float:left;">Print your name here</div>
							<div style="height:5mm;padding-top:1mm;float:right;padding-right:2mm;">
								<div class="styLNCtrNumBox" style="width:57mm;border-top-width:1px;height:8mm;text-align:left;padding-left:1mm;">
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
						</div>
						<div style="height:7mm;">
							<div style="width:17mm;float:left;">Print your title here</div>
							<div style="padding-top:1mm;float:right;padding-right:2mm;">
								<div class="styLNCtrNumBox" style="width:57mm;border-top-width:1px;height:7mm;text-align:left;padding-left:1mm;">
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
									<xsl:if test="$RtnHdrData/ReportingAgentPINGrp/RAPINEnteredByCd">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$RtnHdrData/ReportingAgentPINGrp/RAPINEnteredByCd"/>
										</xsl:call-template>
									</xsl:if>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="styBB" style="width:187mm;padding-bottom:2mm;padding-top:4mm;">
					<div class="styLNDesc" style="width:22mm;text-align:right;padding-right:3mm;padding-top:1.5mm;">
						Date
					</div>
					<div class="styLNCtrNumBox" style="width:40mm;border-top-width:1px;height:5mm;">
						<xsl:if test="$RtnHdrData/SignatureDocumentGrp/SignatureDt">
							<xsl:call-template name="PopulateMonthDayYear">
								<xsl:with-param name="TargetNode" select="$RtnHdrData/SignatureDocumentGrp/SignatureDt"/>
							</xsl:call-template>
						</xsl:if>
						<xsl:if test="$RtnHdrData/PractitionerPINGrp/TaxpayerSignatureDt">
							<xsl:call-template name="PopulateMonthDayYear">
								<xsl:with-param name="TargetNode" select="$RtnHdrData/PractitionerPINGrp/TaxpayerSignatureDt"/>
							</xsl:call-template>
						</xsl:if>
					</div>
					<div class="styLNDesc" style="width:84.5mm;text-align:right;padding-right:3mm;padding-top:2.5mm;">
						Best daytime phone
					</div>
					<div class="styLNCtrNumBox" style="width:38.4mm;border-top-width:1px;height:7mm;word-wrap:break-word;">
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
					<div class="styLNDesc" style="width:127mm;font-size:9pt;font-weight:bold;float:left;padding-left:5mm;">
						Paid Preparer Use Only
					</div>
					<div class="styLNDesc" style="width:54mm;float:left;">
						Check if you're self-employed
						<span style="width:2px;"/>
						<span class="styBoldText">
							<span style="width:10px"/>.
							<span style="width:10px"/>.
							<span style="width:10px"/>.
						</span>
					</div>
					<div class="styLNDesc" style="width:5mm;float:right;">
						<xsl:call-template name="PopulateSpan">
							<xsl:with-param name="TargetNode" select="$RtnHdrData/PaidPreparerInformationGrp/SelfEmployedInd"/>
						</xsl:call-template>
						<input type="checkbox" aria-label="SelfEmployed" class="styCkbox">
							<xsl:call-template name="PopulateCheckbox">
								<xsl:with-param name="TargetNode" select="$RtnHdrData/PaidPreparerInformationGrp/SelfEmployedInd"/>
								<xsl:with-param name="BackupName">941SelfEmployedInd</xsl:with-param>
							</xsl:call-template>
						</input>
						<label>
							<xsl:call-template name="PopulateLabel">
								<xsl:with-param name="TargetNode" select="$RtnHdrData/PaidPreparerInformationGrp/SelfEmployedInd"/>
								<xsl:with-param name="BackupName">941SelfEmployedInd</xsl:with-param>
							</xsl:call-template>
						</label>
					</div>			
				</div>
				<div style="width:187mm;padding-bottom:2mm;">
					<div class="styLNDesc" style="width:32mm;padding-left:2mm;padding-right:1mm;">Preparer's name </div>
					<div class="styLNCtrNumBox" style="width:94mm;border-top-width:1px;height:5mm;text-align:left;padding-left:1mm;">
						<xsl:call-template name="PopulateText">
							<xsl:with-param name="TargetNode" select="$RtnHdrData/PaidPreparerInformationGrp/PreparerPersonNm"/>
						</xsl:call-template>
					</div>
					<div class="styLNDesc" style="width:23mm;padding-left:7mm;">PTIN </div>
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
					<div class="styLNCtrNumBox" style="width:94mm;border-top-width:1px;height:5mm;word-wrap:break-word;text-align:left;padding-right:1mm;padding-left:1mm;">
				</div>
				<div class="styLNDesc" style="width:23mm;padding-left:7mm;">Date </div>
				<div class="styLNCtrNumBox" style="width:38mm;border-top-width:1px;height:5mm;">
					<xsl:call-template name="PopulateMonthDayYear">
						<xsl:with-param name="TargetNode" select="$RtnHdrData/PaidPreparerInformationGrp/SignatureDt"/>
					</xsl:call-template>
				</div>
			</div>
			<!-- 5/13/2015 Adjusted Firm name height from 5mm to auto --> 
			<div style="width:187mm;padding-bottom:2mm;">
				<div class="styLNDesc" style="width:32mm;padding-left:2mm;padding-right:1mm;padding-top:0mm;padding-bottom:0mm;">
					Firm's name (or yours if self-employed)
				</div>
				<div class="styLNCtrNumBox" style="width:94mm;border-top-width:1px;height:auto;text-align:left;padding-left:1mm;">
					<xsl:call-template name="PopulateText">
						<xsl:with-param name="TargetNode" select="$RtnHdrData/PaidPreparerInformationGrp/PreparerFirmName/BusinessNameLine1Txt"/>
					</xsl:call-template><br/>
					<xsl:call-template name="PopulateText">
						<xsl:with-param name="TargetNode" select="$RtnHdrData/PaidPreparerInformationGrp/PreparerFirmName/BusinessNameLine2Txt"/>
					</xsl:call-template>
				</div>
				<div class="styLNDesc" style="width:23mm;padding-left:7mm;">EIN </div>
				<div class="styLNCtrNumBox" style="width:38mm;border-top-width:1px;height:5mm;">
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
						</xsl:call-template><br/>
						<xsl:call-template name="PopulateText">
							<xsl:with-param name="TargetNode" select="$RtnHdrData/PaidPreparerInformationGrp/PreparerUSAddress/AddressLine2Txt"/>
						</xsl:call-template>
					</xsl:if>
					<xsl:if test="$RtnHdrData/PaidPreparerInformationGrp/PreparerForeignAddress">
						<xsl:call-template name="PopulateText">
							<xsl:with-param name="TargetNode" select="$RtnHdrData/PaidPreparerInformationGrp/PreparerForeignAddress/AddressLine1Txt"/>
						</xsl:call-template><br/>
						<xsl:call-template name="PopulateText">
							<xsl:with-param name="TargetNode" select="$RtnHdrData/PaidPreparerInformationGrp/PreparerForeignAddress/AddressLine2Txt"/>
						</xsl:call-template>
					</xsl:if>
				</div>
				<div class="styLNDesc" style="width:23mm;padding-left:7mm;">Phone </div>
				<div class="styLNCtrNumBox" style="width:38mm;border-top-width:1px;height:7mm;word-wrap:break-word;">
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
			<div class="styBB" style="width:187mm;padding-bottom:2mm;border-bottom:0px">
				<xsl:choose>
					<xsl:when test="$RtnHdrData/PaidPreparerInformationGrp/PreparerForeignAddress">
						<div class="styLNDesc" style="width:32mm;padding-left:2mm;padding-right:1mm;">City </div>
						<div class="styLNCtrNumBox" style="width:44mm;border-top-width:1px;height:7mm;text-align:left;padding-left:1mm;word-wrap:break-word;">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$RtnHdrData/PaidPreparerInformationGrp/PreparerForeignAddress/CityNm"/>
							</xsl:call-template>
						</div>
						<div class="styLNDesc" style="width:13mm;text-align:center;">Prov./St. </div>
						<div class="styLNCtrNumBox" style="width:16mm;border-top-width:1px;height:7mm;word-wrap:break-word;">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$RtnHdrData/PaidPreparerInformationGrp/PreparerForeignAddress/ProvinceOrStateNm"/>
							</xsl:call-template>
						</div>
						<div class="styLNDesc" style="width:11mm;text-align:center;">Country </div>
						<div class="styLNCtrNumBox" style="width:10mm;border-top-width:1px;height:5mm;word-wrap:break-word;">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$RtnHdrData/PaidPreparerInformationGrp/PreparerForeignAddress/CountryCd"/>
							</xsl:call-template>
						</div>
						<div class="styLNDesc" style="width:23mm;padding-left:7mm;">Postal Code </div>
						<div style="float:right;padding-right:1mm;">
							<div class="styLNCtrNumBox" style="width:37mm;border-top-width:1px;height:5mm;word-wrap:break-word;">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$RtnHdrData/PaidPreparerInformationGrp/PreparerForeignAddress/ForeignPostalCd"/>
								</xsl:call-template>
							</div>
						</div>
					</xsl:when>
					<xsl:otherwise>
						<div class="styLNDesc" style="width:32mm;padding-left:2mm;padding-right:1mm;">City </div>
						<div class="styLNCtrNumBox" style="width:65mm;border-top-width:1px;height:auto;text-align:left;padding-left:1mm;">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$RtnHdrData/PaidPreparerInformationGrp/PreparerUSAddress/CityNm"/>
							</xsl:call-template>					
						</div>
						<div class="styLNDesc" style="width:19mm;padding-left:10mm;">State </div>
						<div class="styLNCtrNumBox" style="width:10mm;border-top-width:1px;height:5mm;">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$RtnHdrData/PaidPreparerInformationGrp/PreparerUSAddress/StateAbbreviationCd"/>
							</xsl:call-template>
						</div>
						<div class="styLNDesc" style="width:23mm;padding-left:7mm;">ZIP code </div>
						<div class="styLNCtrNumBox" style="width:38mm;border-top-width:1px;height:5mm;">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$RtnHdrData/PaidPreparerInformationGrp/PreparerUSAddress/ZIPCd"/>
							</xsl:call-template>
						</div>
				</xsl:otherwise>
			</xsl:choose>
		</div>				
		<!--Page Footer-->
		<!--03/12/24: updated bullet message -->
		<!-- Bullet Message -->
		<div class="styBB" style="width:187mm;height:6mm;border-bottom-width:2px;">
			<div class="styLNDesc" style="width:130mm;padding-left:5mm;font-weight:bold;padding-top:2mm;">
				<!--You MUST complete both pages of Form 941 and SIGN it.-->
			</div>
		</div>		
		<div class="pageEnd" style="width:187mm;">
			<span style="float:left;clear:none;">Page <span class="styBoldText" style="font-size:8pt;">2</span></span>
			<span style="float:right;clear:none;">Form <span class="styBoldText" style="font-size:8pt;">941</span> (Rev. 3-2026)</span>
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
	<xsl:template name="IRS941PR">
			<xsl:text disable-output-escaping="yes">&lt;!DOCTYPE html&gt;</xsl:text>
		<html lang="ES">
			<head>
				<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
				<title>
					<xsl:call-template name="FormTitle">
						<xsl:with-param name="RootElement" select="local-name($FormData)"/>
					</xsl:call-template>
				</title>
				<!--  No Browser Caching  -->
				<meta http-equiv="Pragma" content="no-cache"/>
				<meta http-equiv="Cache-Control" content="no-cache"/>
				<meta http-equiv="Expires" content="0"/>
				<!-- No Proxy Caching -->
				<meta http-equiv="Cache-Control" content="private"/>
				<!-- Define Character Set  -->
				<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1"/>
				<meta name="Description" content="IRS Form 941PR"/>
				<script language="JavaScript" src="{$ScriptPath}/FormDisplay.js" type="text/javascript"/>
				<xsl:call-template name="InitJS"/>
				<style type="text/css">
					<xsl:if test="not($Print) or $Print=''">
						<xsl:call-template name="IRS941Style"/>
						<xsl:call-template name="AddOnStyle"/>
					</xsl:if>
				</style>
				<xsl:call-template name="GlobalStylesForm"/>
			</head>
			<xsl:variable name="Date">
				<xsl:call-template name="PopulateText">
					<xsl:with-param name="TargetNode" select="$RtnHdrData/QuarterEndingDt"/>
				</xsl:call-template>
			</xsl:variable>
			<!-- 1/21/2022 Choice inserted -->
			<!--<xsl:choose>
				<xsl:when test="substring($Date, 6, 2) = '03'">-->
					<body class="styBodyClass" style="width:187mm;">
						<form name="IRS941PR" style="font-family:arial;">
							<!--  Begin Header section 1 -->
							<div class="styGenericDiv" style="width:187mm;">
								<xsl:call-template name="DocumentHeader"/>
							</div>
							<div class="styBB" style="width:187mm;border-bottom-width:0px;">
								<xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode" select="$FormData"/>
								</xsl:call-template>
								<xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode" select="$RtnDoc/BinaryAttachment"/>
								</xsl:call-template>
								<xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode" select="$RtnDoc/GeneralDependencySmall"/>
								</xsl:call-template>
								<xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode" select="$RtnDoc/FinalPayrollInfoStatement"/>
								</xsl:call-template>
								<xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode" select="$RtnDoc/TransferOfBusinessStatement"/>
								</xsl:call-template>
								<xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode" select="$RtnDoc/IRS941ScheduleR"/>
								</xsl:call-template>
								<xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode" select="$RtnDoc/IRS941ScheduleD"/>
								</xsl:call-template>
								<div class="styFNBox" style="width:187mm;height:10mm;border:0px;float:none;clear:both;">
									Formulario 
									<span class="styFormNumber" style="font-size:15pt;">
										<!--<xsl:if test="/AppData/Parameters/SubmissionType='941SS'">941-SS</xsl:if>
										<xsl:if test="/AppData/Parameters/SubmissionType='941PR'">941-PR</xsl:if>-->
										941 para 2026: <span class="styMainTitle" style="font-size:10pt;">Declaración del Impuesto Federal TRIMESTRAL del Empleador</span>
									</span>
									<div style="width:187mm;padding-bottom:0mm;float:none;clear:both;">
										<span class="styAgency" style="float:left;padding-bottom:0mm;">(Rev. marzo de 2026)<span style="width:30mm;"/>
										Department of the Treasury — Internal Revenue Service</span>
										<span class="styOMB" style="width:34mm;font-size:7pt;text-align:right;border:0px;float:right;padding-bottom:0mm;">OMB No. 1545-0029</span>
									</div>
								</div>
							</div>
							<!-- 5/19/2015 Adjusted height of Filer Name and Trade name from 8mm to auto  -->
							<div style="width:187mm;float:none;clear:both;">
								<div class="styBB" style="width:122mm;height:auto;float:left;border:black solid 1px;padding-top:1mm;padding-left:2mm;padding-right:2mm;">
									<div style="width:118mm;padding-top:0mm;">
										<span style="float:left;padding-right:5mm;">
											<b>Número de identificación del <br/> empleador <i>(EIN)</i></b>
										</span>
										<span class="styLNCtrNumBox" style="width:72mm;border-top-width:1px;padding-top:2mm;float:right;height:6mm;">
											<xsl:call-template name="PopulateReturnHeaderFiler">
												<xsl:with-param name="TargetNode">EIN</xsl:with-param>
												<xsl:with-param name="EINChanged">true</xsl:with-param>
											</xsl:call-template>
										</span>
									</div>
							<div style="width:118mm;padding-bottom:1mm;padding-top:1mm;">
								<span style="float:left;padding-top:4mm;">
									<b>Nombre</b> (el nombre legal del negocio, no el <br/> nombre comercial)</span>
								<span class="styLNCtrNumBox" style="width:69mm;height:auto;border-top-width:1px;float:right;text-align:left;padding-left:1mm;">
									<xsl:call-template name="PopulateReturnHeaderFiler">
										<xsl:with-param name="TargetNode">BusinessNameLine1Txt</xsl:with-param>
									</xsl:call-template>
									<br/>
									<xsl:call-template name="PopulateReturnHeaderFiler">
										<xsl:with-param name="TargetNode">BusinessNameLine2Txt</xsl:with-param>
									</xsl:call-template>
								</span>
							</div>
							<div style="width:118mm;padding-bottom:1mm;">
								<span style="float:left;padding-top:4mm;">
									<b>Nombre comercial</b> (si alguno)</span>
								<span class="styLNCtrNumBox" style="width:82mm;height:auto;border-top-width:1px;float:right;text-align:left;padding-left:1mm;">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/TradeName/BusinessNameLine1Txt"/>
									</xsl:call-template>
									<br/>
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/TradeName/BusinessNameLine2Txt"/>
									</xsl:call-template>
								</span>
							</div>
							<div style="width:118mm;padding-bottom:0mm;">
								<span style="width:12mm;float:left;padding-top:4mm;font-weight:bold;">Dirección</span>
								<span style="width:104mm;float:right;">
									<span class="styLNCtrNumBox" style="width:104mm;border-top-width:1px;height:8mm;text-align:left;padding-left:1mm;">
										<xsl:call-template name="PopulateReturnHeaderFiler">
											<xsl:with-param name="TargetNode">AddressLine1Txt</xsl:with-param>
										</xsl:call-template>
										<br/>
										<xsl:call-template name="PopulateReturnHeaderFiler">
											<xsl:with-param name="TargetNode">AddressLine2Txt</xsl:with-param>
										</xsl:call-template>
									</span>
									<span style="width:104mm;font-size:6pt;padding-left:1mm;">
									Número<span style="width:20mm"/>Calle<span style="width:36mm;"/>Número de oficina o de habitación
								</span>
									<span class="styLNCtrNumBox" style="width:66mm;border-top-width:1px;padding-top:.5mm;height:6.5mm;text-align:left;padding-left:1mm;">
										<xsl:call-template name="PopulateReturnHeaderFiler">
											<xsl:with-param name="TargetNode">CityNm</xsl:with-param>
										</xsl:call-template>
									</span>
									<span class="styLNCtrNumBox" style="width:1.5mm;float:left;border:none"/>
									<span class="styLNCtrNumBox" style="width:13mm;border-top-width:1px;padding-top:2mm;height:6.5mm;">
										<xsl:call-template name="PopulateReturnHeaderFiler">
											<xsl:with-param name="TargetNode">StateAbbreviationCd</xsl:with-param>
										</xsl:call-template>
									</span>
									<span class="styLNCtrNumBox" style="width:1.5mm;float:left;border:none"/>
									<span class="styLNCtrNumBox" style="width:22mm;border-top-width:1px;padding-top:2mm;height:6.5mm;">
										<xsl:call-template name="PopulateReturnHeaderFiler">
											<xsl:with-param name="TargetNode">ZIPCd</xsl:with-param>
										</xsl:call-template>
									</span>
									<span style="width:105mm;font-size:6pt;padding-left:1mm;">
									Ciudad<span style="width:61mm"/>Estado<span style="width:9mm;"/>Código postal <i>(ZIP)</i>
									</span>
									<span class="styLNCtrNumBox" style="width:33.8mm;border-top-width:1px;padding-top:2mm;height:6mm;text-align:left;padding-left:1mm;">
										<xsl:call-template name="PopulateReturnHeaderFiler">
											<xsl:with-param name="TargetNode">CountryCd</xsl:with-param>
										</xsl:call-template>
									</span>
									<span class="styLNCtrNumBox" style="width:1.5mm;float:left;border:none"/>
									<span class="styLNCtrNumBox" style="width:34mm;border-top-width:1px;padding-top:2mm;height:6mm;">
										<xsl:call-template name="PopulateReturnHeaderFiler">
											<xsl:with-param name="TargetNode">ProvinceOrStateNm</xsl:with-param>
										</xsl:call-template>
									</span>
									<span class="styLNCtrNumBox" style="width:1.5mm;float:left;border:none"/>
									<span class="styLNCtrNumBox" style="width:33mm;border-top-width:1px;padding-top:2mm;height:6mm;">
										<xsl:call-template name="PopulateReturnHeaderFiler">
											<xsl:with-param name="TargetNode">ForeignPostalCd</xsl:with-param>
										</xsl:call-template>
									</span>
									<span style="width:105mm;font-size:6pt;">
										<span style="width:33mm;padding-left:1mm;">Nombre del país extranjero</span>
										<span style="width:36mm;text-align:center;">Provincia extranjera/condado</span>
										<span style="width:33mm;text-align:center;">Código postal extranjero</span>
									</span>
								</span>
							</div>
						</div>
						<div style="float:right;padding-right:2mm;">
							<div class="styBB" style="width:60mm;height:46mm;border-left-width:1px;border-right-width:1px;border-top-width:1px;padding-left:2mm;padding-top:2mm;">
								<div class="styPartName" style="width:55mm;height:8mm;text-align:left;padding-left:1mm;padding-top:1mm;padding-bottom:1mm;">Informe para este trimestre de 2026.<br/>
									<span style="font-size:7pt;">(Marque uno).</span>
								</div>
								<!--<xsl:variable name="Date">
									<xsl:value-of select="$RtnHdrData/QuarterEndingDt"/>
								</xsl:variable>-->
								<div style="width:55mm;float:none;clear:both;font-size:8pt;">
									<div style="width:55mm;float:none;clear:both;">
										<div style="width:55mm;padding-top:0.8mm;float:none;clear:both;">
											<xsl:call-template name="PopulateSpan">
												<xsl:with-param name="TargetNode" select="$RtnHdrData/QuarterEndingDt"/>
											</xsl:call-template>
											<input type="checkbox" aria-label="PrimerTrimestre" class="styCkbox">
												<xsl:call-template name="PopulateEnumeratedCheckbox">
													<xsl:with-param name="TargetNode" select="$RtnHdrData/QuarterEndingDt"/>
													<xsl:with-param name="DisplayedCheckboxValue" select="concat(substring($Date, 1, 5), '03')"/>
													<xsl:with-param name="BackupName">IRS941PRQuarterEndingDt[1]</xsl:with-param>
												</xsl:call-template>
											</input>
											<label>
												<xsl:call-template name="PopulateLabel">
													<xsl:with-param name="TargetNode" select="$RtnHdrData/QuarterEndingDt"/>
													<xsl:with-param name="DisplayedCheckboxValue" select="concat(substring($Date, 1, 5), '03')"/>
													<xsl:with-param name="BackupName">IRS941PRQuarterEndingDt[1]</xsl:with-param>
												</xsl:call-template>
												<span style="width:1mm;"/>
												<b>1:</b> enero, febrero, marzo
											</label>
										</div>
										<div style="width:55mm;">
											<div style="float:left;clear:none;padding-top:2mm;">
												<xsl:call-template name="PopulateSpan">
													<xsl:with-param name="TargetNode" select="$RtnHdrData/QuarterEndingDt"/>
												</xsl:call-template>
												<input type="checkbox" aria-label="SegundoTrimestre" class="styCkbox">
													<xsl:call-template name="PopulateEnumeratedCheckbox">
														<xsl:with-param name="TargetNode" select="$RtnHdrData/QuarterEndingDt"/>
														<xsl:with-param name="DisplayedCheckboxValue" select="concat(substring($Date, 1, 5), '06')"/>
														<xsl:with-param name="BackupName">IRS941PRQuarterEndingDt[2]</xsl:with-param>
													</xsl:call-template>
												</input>
												<label>
													<xsl:call-template name="PopulateLabel">
														<xsl:with-param name="TargetNode" select="$RtnHdrData/QuarterEndingDt"/>
														<xsl:with-param name="DisplayedCheckboxValue" select="concat(substring($Date, 1, 5), '06')"/>
														<xsl:with-param name="BackupName">IRS941PRQuarterEndingDt[2]</xsl:with-param>
													</xsl:call-template>
													<span style="width:1mm;"/>
													<b>2:</b> abril, mayo, junio
												</label>
											</div>
										</div>
										<div style="width:55mm;">
											<div style="float:left;clear:none;padding-top:2mm;">
												<xsl:call-template name="PopulateSpan">
													<xsl:with-param name="TargetNode" select="$RtnHdrData/QuarterEndingDt"/>
												</xsl:call-template>
												<input type="checkbox" aria-label="TercerTrimestre" class="styCkbox">
													<xsl:call-template name="PopulateEnumeratedCheckbox">
														<xsl:with-param name="TargetNode" select="$RtnHdrData/QuarterEndingDt"/>
														<xsl:with-param name="DisplayedCheckboxValue" select="concat(substring($Date, 1, 5), '09')"/>
														<xsl:with-param name="BackupName">IRS941PRQuarterEndingDt[3]</xsl:with-param>
													</xsl:call-template>
												</input>
												<label>
													<xsl:call-template name="PopulateLabel">
														<xsl:with-param name="TargetNode" select="$RtnHdrData/QuarterEndingDt"/>
														<xsl:with-param name="DisplayedCheckboxValue" select="concat(substring($Date, 1, 5), '09')"/>
														<xsl:with-param name="BackupName">IRS941PRQuarterEndingDt[3]</xsl:with-param>
													</xsl:call-template>
													<span style="width:1mm;"/>
													<b>3:</b> julio, agosto, septiembre
												</label>
											</div>
										</div>
										<div style="width:55mm;">
											<div style="float:left;clear:none;padding-top:2mm;">
												<xsl:call-template name="PopulateSpan">
													<xsl:with-param name="TargetNode" select="$RtnHdrData/QuarterEndingDt"/>
												</xsl:call-template>
												<input type="checkbox" aria-label="CuartoTrimestre" class="styCkbox">
													<xsl:call-template name="PopulateEnumeratedCheckbox">
														<xsl:with-param name="TargetNode" select="$RtnHdrData/QuarterEndingDt"/>
														<xsl:with-param name="DisplayedCheckboxValue" select="concat(substring($Date, 1, 5), '12')"/>
														<xsl:with-param name="BackupName">IRS941PRQuarterEndingDt[4]</xsl:with-param>
													</xsl:call-template>
												</input>
												<label>
													<xsl:call-template name="PopulateLabel">
														<xsl:with-param name="TargetNode" select="$RtnHdrData/QuarterEndingDt"/>
														<xsl:with-param name="DisplayedCheckboxValue" select="concat(substring($Date, 1, 5), '12')"/>
														<xsl:with-param name="BackupName">IRS941PRQuarterEndingDt[4]</xsl:with-param>
													</xsl:call-template>
													<span style="width:1mm;"/>
													<b>4:</b> octubre, noviembre, diciembre
												</label>
											</div>
										</div>
									</div>
								</div>
								<div style="width:53mm;padding-bottom:0mm;float:none;clear:both;font-size:7pt;">
									<br/>Acceda a <a style="text-decoration:none;color:black;" href="http://www.irs.gov/form941" title="Link to IRS.gov">
										<i>www.irs.gov/Form941SP</i> para obtener las instrucciones y la información más reciente.</a>
								</div>
							</div>
						</div>
					</div>
					<div style="width:187mm;float:left;clear:both;">
						<div class="styLNDesc" style="width:187mm;font-size:8pt;padding-bottom:0mm;padding-top:0mm;float:none;clear:both;">
					Lea las instrucciones por separado antes de completar el Formulario 941. Escriba a máquina o en letra de molde dentro de las casillas.
				</div>
						<div class="styBB" style="width:187mm;border-top-width:1px;float:none;clear:both;">
							<div class="styPartName" style="width:13mm;text-align:center;height:4mm;font-size:9pt;">Parte 1:</div>
							<div class="styPartDesc" style="width:173.9mm;text-align:left;height:auto;padding-left:2mm;font-size:9pt;">Conteste estas preguntas para este trimestre. Los empleadores en la Samoa Estadounidense, Guam, la Mancomunidad de las Islas Marianas del Norte, las Islas Vírgenes Estadounidenses y Puerto Rico pueden omitir las líneas 2 y 3, a menos que sus empleados estén sujetos a la retención del impuesto sobre los ingresos de los Estados Unidos.</div>
						</div>
						<!--Line 1-->
						<div style="width:187mm;padding-bottom:0mm;float:none;clear:both;height:10mm;">
							<div class="styLNLeftNumBoxSD" style="width:8mm;">1</div>
							<div class="styLNDesc" style="width:122mm;padding-left:1mm;font-weight:bold;">
								Número de empleados que recibieron salarios, propinas u otras remuneraciones durante el período de pago que incluye: <i>el 12 de marzo</i> (1er trimestre), <i>el 12 de junio</i> (2do trimestre), <i>el 12 de septiembre</i> (3er   
								<span style="float:left;">trimestre) <i>o el 12 de diciembre</i> (4to trimestre) </span>
								<!--Dotted Line-->
								<span class="styDotLn" style="float:right;padding-right:1mm;">................</span>
							</div>
							<span style="float:right;padding-top:4mm;">
								<div class="styIRS941RightNumBox" style="padding-top:1.5mm;">1</div>
								<div class="styLNCtrNumBox" style="width:46mm;border-top-width:1px;height:6mm;padding-top:1mm;text-align:right;padding-right:1mm;">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$FormData/EmployeeCnt"/>
									</xsl:call-template>
								</div>
							</span>
						</div>
						<!--Line 2-->
						<div style="width:187mm;padding-bottom:0mm;float:none;clear:both;height:6mm;">
							<span style="float:left;">
								<div class="styLNLeftNumBoxSD" style="width:8mm;">2</div>
								<div class="styLNDesc" style="width:122mm;padding-left:1mm;font-weight:bold;">
									<span style="float:left;">Salarios, propinas y otras remuneraciones</span>
									<!--Dotted Line-->
								<span class="styDotLn" style="float:right;padding-right:1mm;">.................</span>
								</div>
							</span>
							<span style="float:right;padding-top:.5mm;">
								<div class="styIRS941RightNumBox">2</div>
								<div class="styLNCtrNumBox" style="width:46mm;border-top-width:1px;height:5mm;text-align:right;padding-right:1mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/WagesAmt"/>
									</xsl:call-template>
								</div>
							</span>
						</div>					
						<!--Line 3-->
<!--						<div style="width:187mm;padding-bottom:0mm;float:none;clear:both;">
							<div class="styLNLeftNumBoxSD" style="width:8mm;">3</div>
							<div class="styLNDesc" style="width:179mm;background-color:gray;"/>
						</div>
-->						<div style="width:187mm;height:6mm;">
							<span style="float:left;">
								<div class="styLNLeftNumBoxSD" style="width:8mm;">3</div>
								<div class="styLNDesc" style="width:122mm;padding-left:1mm;font-weight:bold;">
									<span style="float:left;">Impuesto federal sobre el ingreso retenido de salarios, propinas y otras remuneraciones</span>
									<!--Dotted Line-->
								<span class="styDotLn" style="float:right;padding-right:1mm;">...</span>
								</div>
							</span>
							<span style="float:right;">
								<div class="styIRS941RightNumBox">3</div>
								<div class="styLNCtrNumBox" style="width:46mm;border-top-width:1px;height:5mm;text-align:right;padding-right:1mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/FederalIncomeTaxWithheldAmt"/>
									</xsl:call-template>
								</div>
							</span>
						</div>
						<!--Line 4-->
						<div style="width:187mm;padding-bottom:0mm;float:none;clear:both;">
							<div class="styLNLeftNumBoxSD" style="width:8mm;">4</div>
							<div class="styLNDesc" style="width:122mm;padding-left:1mm;font-weight:bold;">
							Si no hay salarios, propinas ni otras remuneraciones sujetos a los impuestos del Seguro
							<span style="float:left;">Social y del <i>Medicare</i>
								</span>
								<!--Dotted Line-->
								<span class="styDotLn" style="float:right;padding-right:1mm;">.......................</span>
							</div>
							<div style="padding-top:2mm;float:left;padding-left:6mm;">
								<input type="checkbox" aria-label="LosSalariosNoEstánSujetosAlSeguroSocialYAlMedicare" class="styCkbox">
									<xsl:call-template name="PopulateCheckbox">
										<xsl:with-param name="TargetNode" select="$FormData/WagesNotSubjToSSMedcrTaxInd"/>
										<xsl:with-param name="BackupName">941PRWagesNotSubjToSSMedcrTaxInd</xsl:with-param>
									</xsl:call-template>
								</input>
								<label>
									<xsl:call-template name="PopulateLabel">
										<xsl:with-param name="TargetNode" select="$FormData/WagesNotSubjToSSMedcrTaxInd"/>
										<xsl:with-param name="BackupName">941PRWagesNotSubjToSSMedcrTaxInd</xsl:with-param>
									</xsl:call-template>
									<span style="width:1mm;"/><b>Marque aquí y pase a la línea 6.</b>
								</label>
							</div>
						</div>
						<!--Line 5 Header-->
						<div style="width:187mm;float:none;clear:both;">
							<span style="width:57mm;"/>
							<span style="width:35mm;font-weight:bold;text-align:center;">Columna 1</span>
							<span style="width:14mm;"/>
							<span style="width:35mm;font-weight:bold;text-align:center;">Columna 2</span>
						</div>
						<div style="width:187mm;float:none;">
							<!--Line 5a-->
							<div style="width:149mm;">
								<div class="styLNLeftNumBoxSD" style="width:8mm;padding-top:0mm;">5a</div>
								<div class="styLNDesc" style="width:49mm;padding-left:1mm;padding-top:0mm;font-weight:bold;">
								Salarios sujetos al impuesto del<br/> Seguro Social
							</div>
								<div style="padding-top:1.2mm;float:left;">
									<div class="styLNCtrNumBox" style="width:35mm;border-top-width:1px;height:6mm;padding-top:1mm;text-align:right;padding-right:1mm;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/SocialSecurityWageAndTaxGrp/SocialSecurityTaxCashWagesAmt"/>
										</xsl:call-template>
									</div>
									<div class="styLNDesc" style="width:14mm;text-align:center;padding-top:2.5mm;">
									x 0.124 =
								</div>
									<div class="styLNCtrNumBox" style="width:35mm;border-top-width:1px;height:6mm;padding-top:1mm;text-align:right;padding-right:1mm;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/SocialSecurityWageAndTaxGrp/SocialSecurityTaxAmt"/>
										</xsl:call-template>
									</div>
								</div>								
							</div>
<!--							<div class="styBB" style="width:38mm;height:25mm;float:right;font-size:6pt;border-left-width:1px;border-right-width:1px;border-top-width:1px;padding-left:1mm;padding-right:1mm;padding-top:1mm"> *Include taxable qualified sick and family leave wages paid in 2023 for leave taken after March 31, 2021, and before October 1, 2021, on line 5a. Use lines 5a(i) and 5a(ii) <b>only</b> for taxable qualified sick and family leave wages paid in 2023 for leave taken after March 31, 2020, and before April 1, 2021.
							</div>-->
							<!--Line 5a(i)-->
<!--							<div style="width:149mm;">
								<div class="styLNLeftNumBoxSD" style="width:8mm;padding-top:0mm;">5a</div>
								<div class="styLNDesc" style="width:49mm;padding-left:1mm;padding-top:0mm;font-weight:bold;">
								(i) Salarios de licencia por enfermedad calificados*
							</div>
								<div style="padding-top:1.2mm;float:left;">
									<div class="styLNCtrNumBox" style="width:35mm;border-top-width:1px;height:6mm;padding-top:1mm;text-align:right;padding-right:1mm;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/SSWageTaxQlfySickLeaveGrp/SocialSecurityQlfyPdSLWageAmt"/>
										</xsl:call-template>
									</div>
									<div class="styLNDesc" style="width:14mm;text-align:center;padding-top:2.5mm;">
									x 0.062 =
								</div>
									<div class="styLNCtrNumBox" style="width:35mm;border-top-width:1px;height:6mm;padding-top:1mm;text-align:right;padding-right:1mm;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/SSWageTaxQlfySickLeaveGrp/SocialSecurityQlfyPdSLTaxAmt"/>
										</xsl:call-template>
									</div>
								</div>
							</div>
-->							<!--Line 5a(ii)-->
<!--							<div style="width:149mm;">
								<div class="styLNLeftNumBoxSD" style="width:8mm;padding-top:0mm;">5a</div>
								<div class="styLNDesc" style="width:49mm;padding-left:1mm;padding-top:0mm;font-weight:bold;">
								(ii) Salarios de licencia familiar calificados*
							</div>
								<div style="padding-top:1.2mm;float:left;">
									<div class="styLNCtrNumBox" style="width:35mm;border-top-width:1px;height:6mm;padding-top:1mm;text-align:right;padding-right:1mm;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/SSWageTaxQlfyFamilyLeaveGrp/SocialSecurityQlfyPdFMLWageAmt"/>
										</xsl:call-template>
									</div>
									<div class="styLNDesc" style="width:14mm;text-align:center;padding-top:2.5mm;">
									x 0.062 =
								</div>
									<div class="styLNCtrNumBox" style="width:35mm;border-top-width:1px;height:6mm;padding-top:1mm;text-align:right;padding-right:1mm;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/SSWageTaxQlfyFamilyLeaveGrp/SocialSecurityQlfyPdFMLTaxAmt"/>
										</xsl:call-template>
									</div>
								</div>
							</div>
-->							<!--Line 5b-->
							<div style="width:149mm;">
								<div class="styLNLeftNumBoxSD" style="width:8mm;padding-top:0mm;">5b</div>
								<div class="styLNDesc" style="width:49mm;padding-top:0mm;padding-left:1mm;font-weight:bold;">
								Propinas sujetas al impuesto del<br/>Seguro Social
							</div>
								<div style="padding-top:1mm;float:left;">
									<div class="styLNCtrNumBox" style="width:35mm;border-top-width:1px;height:6mm;padding-top:1mm;text-align:right;padding-right:1mm;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/SocialSecurityTipsAndTaxGrp/TaxableSocSecTipsAmt"/>
										</xsl:call-template>
									</div>
									<div class="styLNDesc" style="width:14mm;text-align:center;padding-top:2.5mm;">
									x 0.124 =
								</div>
									<div class="styLNCtrNumBox" style="width:35mm;border-top-width:1px;height:6mm;padding-top:1mm;text-align:right;padding-right:1mm;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/SocialSecurityTipsAndTaxGrp/TaxOnSocialSecurityTipsAmt"/>
										</xsl:call-template>
									</div>
								</div>
							</div>
							<!--Line 5c-->
							<div style="width:187mm;">
								<div class="styLNLeftNumBoxSD" style="width:8mm;padding-top:0mm;">5c</div>
								<div class="styLNDesc" style="width:49mm;padding-top:0mm;padding-left:1mm;font-weight:bold;">
								Salarios y propinas sujetos al<br/>impuesto del <i>Medicare</i>
								</div>
								<div style="padding-top:1mm;float:left;">
									<div class="styLNCtrNumBox" style="width:35mm;border-top-width:1px;height:6mm;padding-top:1mm;text-align:right;padding-right:1mm;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/MedicareWageTipsAndTaxGrp/TaxableMedicareWagesTipsAmt"/>
										</xsl:call-template>
									</div>
									<div class="styLNDesc" style="width:14mm;text-align:center;padding-top:2.5mm;">
									x 0.029 =
								</div>
									<div class="styLNCtrNumBox" style="width:35mm;border-top-width:1px;height:6mm;padding-top:1mm;text-align:right;padding-right:1mm;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/MedicareWageTipsAndTaxGrp/TaxOnMedicareWagesTipsAmt"/>
										</xsl:call-template>
									</div>
								</div>
							</div>
							<!--Line 5d-->
							<div style="width:187mm;padding-bottom:0mm;">
								<div class="styLNLeftNumBoxSD" style="width:8mm;padding-top:0mm;">5d</div>
								<div class="styLNDesc" style="width:49mm;padding-top:0mm;padding-left:1mm;font-weight:bold;">
								Salarios y propinas sujetos a la<br/>retención del Impuesto<br/>Adicional del <i>Medicare</i>
								</div>
								<div style="padding-top:1.5mm;float:left;">
									<div class="styLNCtrNumBox" style="width:35mm;border-top-width:1px;height:6mm;padding-top:1mm;text-align:right;padding-right:1mm;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/AddnlMedicareWageTipsAndTaxGrp/TxblWageTipsSubjAddnlMedcrAmt"/>
										</xsl:call-template>
									</div>
									<div class="styLNDesc" style="width:14mm;text-align:center;padding-top:2.5mm;">
									x 0.009 =
								</div>
									<div class="styLNCtrNumBox" style="width:35mm;border-top-width:1px;height:6mm;padding-top:1mm;text-align:right;padding-right:1mm;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/AddnlMedicareWageTipsAndTaxGrp/TaxOnWageTipsSubjAddnlMedcrAmt"/>
										</xsl:call-template>
									</div>
								</div>
							</div>
						</div>
						<!--Line 5e-->
						<div style="width:187mm;padding-bottom:0mm;float:none;clear:both;">
							<span style="float:left;">
								<div class="styLNLeftNumBoxSD" style="width:8mm;padding-top:2mm;">5e</div>
								<div class="styLNDesc" style="width:123mm;padding-left:1mm;padding-top:2mm;">
									<b>Total de impuestos del Seguro Social y del Medicare.</b> Sume la Columna 2 de las líneas <b>5a, 5b, 5c</b> y <b>5d</b>
									<!--Dotted Line-->
									<!--<span class="styDotLn" style="float:right;padding-right:1mm;">...........................</span>-->
								</div>
							</span>
							<span style="float:right;padding-top:1.5mm;">
								<div class="styIRS941RightNumBox" style="width:10mm;">5e</div>
								<div class="styLNCtrNumBox" style="width:46mm;border-top-width:1px;height:6mm;padding-top:1mm;text-align:right;padding-right:1mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/TotalSSMdcrTaxAmt"/>
									</xsl:call-template>
								</div>
							</span>
						</div>
						<!--Line 5f-->
						<div style="width:187mm;padding-bottom:0mm;float:none;clear:both;">
							<span style="float:left;">
								<div class="styLNLeftNumBoxSD" style="width:8mm;padding-top:1mm;">5f</div>
								<div class="styLNDesc" style="width:123mm;padding-left:1mm;padding-top:1mm;">
									<b>Notificación y solicitud de pago conforme a la sección 3121(q): Impuesto adeudado</b>
									<span style="float:left;">
										<b>por propinas no declaradas</b> (vea las instrucciones) </span>
									<!--Dotted Line-->
									<span class="styDotLn" style="float:right;padding-right:1mm;">...............</span>
								</div>
							</span>
							<span style="float:right;padding-top:1.2mm;">
								<div class="styIRS941RightNumBox" style="width:10mm;">5f</div>
								<div class="styLNCtrNumBox" style="width:46mm;border-top-width:1px;height:6mm;padding-top:1mm;text-align:right;padding-right:1mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/TaxOnUnreportedTips3121qAmt"/>
									</xsl:call-template>
								</div>
							</span>
						</div>
						<!--Line 6-->
						<div style="width:187mm;float:none;clear:both;">
							<span style="float:left;">
								<div class="styLNLeftNumBoxSD" style="width:8mm;padding-top:2.5mm;">6</div>
								<div class="styLNDesc" style="width:123mm;padding-left:1mm;padding-top:2.5mm;">
									<span style="float:left;">
										<b>Total de impuestos antes de los ajustes.</b> Sume las líneas <b>3, 5e</b> y <b>5f</b>
									</span>
									<!--Dotted Line-->
									<span class="styDotLn" style="float:right;padding-right:1mm;">...........</span>
								</div>
							</span>
							<span style="float:right;">
								<div class="styIRS941RightNumBox" style="width:10mm;">6</div>
								<div class="styLNCtrNumBox" style="width:46mm;border-top-width:1px;height:6mm;padding-top:1mm;text-align:right;padding-right:1mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/TotalTaxBeforeAdjustmentAmt"/>
									</xsl:call-template>
								</div>
							</span>
						</div>
						<!--Line 7-->
						<div style="width:187mm;float:none;clear:both;">
							<span style="float:left;">
								<div class="styLNLeftNumBoxSD" style="width:8mm;padding-top:2.5mm;">7</div>
								<div class="styLNDesc" style="width:123mm;padding-left:1mm;padding-top:2.5mm;font-weight:bold;">
									<span style="float:left;">Ajustes por fracciones de centavos del trimestre actual </span>
									<!--Dotted Line-->
									<span class="styDotLn" style="float:right;padding-right:1mm;">.............</span>
								</div>
							</span>
							<span style="float:right;">
								<div class="styIRS941RightNumBox" style="width:10mm;">7</div>
								<div class="styLNCtrNumBox" style="width:46mm;border-top-width:1px;height:6mm;padding-top:1mm;text-align:right;padding-right:1mm;">
									<!-- 7/9/2015 AM: Per KISAM IM02060648, choose statement added to properly display negative numbers and cents only.-->
									<xsl:choose>
										<xsl:when test="starts-with($FormData/CurrentQtrFractionsCentsAmt,'-') or starts-with($FormData/CurrentQtrFractionsCentsAmt,'.')">
											<span style="color:darkblue;">
												<xsl:call-template name="PlaceCommas">
													 <xsl:with-param name="MaxSize" select="15"/>
													<xsl:with-param name="MaxSizeWithSign" select="16"/>
													<xsl:with-param name="TargetNode" select="$FormData/CurrentQtrFractionsCentsAmt"/>
												</xsl:call-template>
											</span>
										</xsl:when>
										<xsl:otherwise>
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$FormData/CurrentQtrFractionsCentsAmt"/>
											</xsl:call-template>
										</xsl:otherwise>
									</xsl:choose>
								</div>
							</span>
						</div>
						<!--Line 8-->
						<div style="width:187mm;float:none;clear:both;">
							<span style="float:left;">
								<div class="styLNLeftNumBoxSD" style="width:8mm;padding-top:2.5mm;">8</div>
								<div class="styLNDesc" style="width:123mm;padding-left:1mm;padding-top:2.5mm;font-weight:bold;">
									<span style="float:left;">Ajustes por compensación por enfermedad del trimestre actual </span>
									<!--Dotted Line-->
									<span class="styDotLn" style="float:right;padding-right:1mm;">...........</span>
								</div>
							</span>
							<span style="float:right;">
								<div class="styIRS941RightNumBox" style="width:10mm;">8</div>
								<div class="styLNCtrNumBox" style="width:46mm;border-top-width:1px;height:6mm;padding-top:1mm;text-align:right;padding-right:1mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/CurrentQuarterSickPaymentAmt"/>
									</xsl:call-template>
								</div>
							</span>
						</div>
						<!--Line 9-->
						<div style="width:187mm;clear:both;">
							<span style="float:left;">
								<div class="styLNLeftNumBoxSD" style="width:8mm;padding-top:2mm;">9</div>
								<div class="styLNDesc" style="width:123mm;padding-left:1mm;padding-top:2mm;font-weight:bold;">
									<span style="float:left;">Ajustes por propinas y por seguro temporal de vida colectivo a término del trimestre actual </span>
									<!--<span style="float:left;"> actual </span>-->
									<!--Dotted Line-->
									<span class="styDotLn" style="float:right;padding-right:1mm;">..</span>
								</div>
							</span>
							<span style="float:right;padding-top:0.2mm;">
								<div class="styIRS941RightNumBox" style="width:10mm;">9</div>
								<div class="styLNCtrNumBox" style="width:46mm;border-top-width:1px;height:6mm;padding-top:1mm;text-align:right;padding-right:1mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/CurrQtrTipGrpTermLifeInsAdjAmt"/>
									</xsl:call-template>
								</div>
							</span>
						</div>
						<!--Line 10-->
						<div style="width:187mm;float:none;clear:both;">
							<span style="float:left;">
								<div class="styLNLeftNumBox" style="width:8mm;padding-top:2mm;">10</div>
								<div class="styLNDesc" style="width:123mm;padding-left:1mm;padding-top:2mm;">
									<b>Total de impuestos después de los ajustes.</b> Combine las líneas <b>6</b> a <b>9</b>
									<!--Dotted Line-->
									<span class="styDotLn" style="float:right;padding-right:1mm;">.........</span>
								</div>
							</span>
							<span style="float:right;">
								<div class="styIRS941RightNumBox" style="width:9mm;padding-right:1mm;">10</div>
								<div class="styLNCtrNumBox" style="width:46mm;border-top-width:1px;height:6mm;padding-top:1mm;text-align:right;padding-right:1mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/TotalTaxAfterAdjustmentAmt"/>
									</xsl:call-template>
								</div>
							</span>
						</div>
						<!-- 8/31/2016 Line 11 will be moved and named as Line 13. Adding two new lines (Line 11 and 12) and numbering will redone -->
						<!--Line 11a-->
						<div style="width:187mm;float:none;clear:both;">
							<span style="float:left;">
								<div class="styLNLeftNumBox" style="width:8mm;">11</div>
								<div class="styLNDesc" style="width:123mm;padding-left:1mm;">
									<b>Crédito tributario sobre la nómina de pequeños negocios calificados por aumentar</b>
									<span style="float:left;">
										<b>las actividades investigativas.</b> Adjunte el Formulario 8974 
									<xsl:call-template name="SetFormLinkInline">
											<xsl:with-param name="TargetNode" select="$FormData/PayrollTaxCreditAmt"/>
										</xsl:call-template>
									</span>
									<!--Dotted Line-->
									<span class="styDotLn" style="float:right;padding-right:1mm;">...........</span>
								</div>
							</span>
							<span style="float:right;padding-top:0.2mm;">
								<div class="styIRS941RightNumBox" style="width:10mm;">11</div>
								<div class="styLNCtrNumBox" style="width:46mm;border-top-width:1px;height:6mm;padding-top:1mm;text-align:right;padding-right:1mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/PayrollTaxCreditAmt"/>
									</xsl:call-template>
								</div>
							</span>
						</div>
						<!--Line 12-->
						<div style="width:187mm;clear:both;">
							<span style="float:left;">
								<div class="styLNLeftNumBox" style="width:8mm;padding-top:1mm;">12</div>
								<div class="styLNDesc" style="width:123mm;padding-left:1mm;padding-top:1mm;">									
									<b>Total de impuestos después de considerar los ajustes y créditos no reembolsables.</b> Reste la línea  
									<span style="float:left;"><b>11d</b> de la línea <b>10</b></span>
									<!--Dotted Line-->
									<span class="styDotLn" style="float:right;padding-right:1mm;">.........................</span>
								</div>
							</span>
							<span style="float:right;padding-top:1mm;">
								<div class="styIRS941RightNumBox" style="width:10mm;">12</div>
								<div class="styLNCtrNumBox" style="width:46mm;border-top-width:1px;height:6mm;padding-top:1mm;text-align:right;padding-right:1mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/TotalTaxAmt"/>
									</xsl:call-template>
								</div>
							</span>
						</div>
						<!-- 12/16/2016 corrected verbiage for line 13 -->
						<!--Line 13-->
						<div style="width:187mm;height:10mm;float:none;clear:both;">
							<span style="float:left;">
								<div class="styLNLeftNumBox" style="width:8mm;padding-top:1mm">13</div>
								<div class="styLNDesc" style="width:123mm;padding-left:1mm;font-weight:bold;padding-top:1mm">
								Total de depósitos para este trimestre, incluyendo toda cantidad pagada en exceso
								aplicada de un trimestre anterior, y toda cantidad pagada en exceso aplicada del
								Formulario 941-X, 941-X (PR) o 944-X 
								<span style="float:left;">presentado en el trimestre actual </span>
									<!--Dotted Line-->
									<span class="styDotLn" style="float:right;padding-right:1mm;">....................</span>
								</div>
							</span>
							<span style="float:right;padding-top:3mm;">
								<div class="styIRS941RightNumBox" style="width:10mm;">13</div>
								<div class="styLNCtrNumBox" style="width:46mm;border-top-width:1px;height:6mm;padding-top:1mm;text-align:right;padding-right:1mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/TotalTaxDepositAmt"/>
									</xsl:call-template>
								</div>
							</span>
						</div>
						<!--Line 13b-->
<!--						<div style="width:187mm;clear:both;">
							<span style="float:left;">
								<div class="styLNLeftNumBox" style="width:8mm;padding-top:2mm">13b</div>
								<div class="styLNDesc" style="width:123mm;padding-left:1mm;padding-top:2mm">
									<span style="float:left;">
										<b>Cantidad diferida de la parte del patrono de la impuesto del Seguro Social</b></span>
									--><!--Dotted Line--><!--
									<span class="styDotLn" style="float:right;padding-right:1mm;">.......</span>
								</div>
							</span>
							<span style="float:right;">
								<div class="styIRS941RightNumBox" style="width:10mm;">13b</div>
								<div class="styLNCtrNumBox" style="width:46mm;border-top-width:1px;height:6mm;padding-top:1mm;text-align:right;padding-right:1mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/DeferredPaymentEmplrShrSSTAmt"/>
									</xsl:call-template>
								</div>
							</span>
						</div>-->
						<!--Line 13c-->
<!--						<div style="width:187mm;clear:both;">
							<span style="float:left;">
								<div class="styLNLeftNumBox" style="width:8mm;padding-top:1mm">13c</div>
								<div class="styLNDesc" style="width:123mm;padding-left:1mm;padding-top:1mm;font-weight:bold">
									Porción reembolsable del crédito por los salarios de licencia por enfermedad y familiar calificados 
									<span style="float:left;">por la licencia tomada antes del 1 de abril de 2021 </span>
									--><!--Dotted Line--><!--
									<span class="styDotLn" style="float:right;padding-right:1mm;">...............</span>
								</div>
							</span>
							<span style="float:right;">
								<div class="styIRS941RightNumBox" style="width:10mm;">13c</div>
								<div class="styLNCtrNumBox" style="width:46mm;border-top-width:1px;height:6mm;padding-top:1mm;text-align:right;padding-right:1mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/RfdblCrQlfySLFMLWagesAmt"/>
									</xsl:call-template>
								</div>
							</span>
						</div>-->
						<!--Line 13d-->
<!--						<div style="width:187mm;clear:both;">
							<span style="float:left;">
								<div class="styLNLeftNumBox" style="width:8mm;padding-top:2mm">13d</div>
								<div class="styLNDesc" style="width:123mm;padding-left:1mm;padding-top:2mm;font-weight:bold">
									<span style="float:left;">Reserved for future use</span>
									--><!--<span style="float:left;"><b>Porción reembolsable del crédito de retención de empleados</b></span>--><!--
									--><!--Dotted Line--><!--
									<span class="styDotLn" style="float:right;padding-right:1mm;">........................</span>
								</div>
							</span>
							<span style="float:right;">
								<div class="styIRS941RightNumBox" style="width:10mm;">13d</div>
								<div class="styLNCtrNumBox" style="width:46mm;border-top-width:1px;height:6mm;padding-top:1mm;text-align:right;padding-right:1mm;background-color:lightgrey">
									--><!--<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/RfdblEmplRtntnCrCOVIDAmt"/>
									</xsl:call-template>--><!--
								</div>
							</span>
						</div>-->
						<!--Line 13e-->
<!--						<div style="width:187mm;clear:both;">
							<span style="float:left;">
								<div class="styLNLeftNumBox" style="width:8mm;">13e</div>
								<div class="styLNDesc" style="width:123mm;padding-left:1mm;">
									<b>Porción reembolsable del crédito por los salarios de licencia por enfermedad y familiar calificados</b>
									<span style="float:left;"><b>por la licencia tomada después del 31 de marzo de 2021 </b></span>
									--><!--Dotted Line--><!--
									<span class="styDotLn" style="float:right;padding-right:1mm;">.............</span>
								</div>
							</span>
							<span style="float:right;">
								<div class="styIRS941RightNumBox" style="width:10mm;">13e</div>
								<div class="styLNCtrNumBox" style="width:46mm;border-top-width:1px;height:6mm;padding-top:1mm;text-align:right;padding-right:1mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/RfdblCrQlfySLFMLWagesAftrAmt"/>
									</xsl:call-template>
								</div>
							</span>
						</div>-->
						<!--Line 13f-->
<!--						<div style="width:187mm;clear:both;">
							<span style="float:left;">
								<div class="styLNLeftNumBox" style="width:8mm;">13f</div>
								<div class="styLNDesc" style="width:123mm;padding-left:1mm;">
									<b>Porción reembolsable del crédito de asistencia para las primas de COBRA (vea las instrucciones</b>
									<span style="float:left;"><b> para los trimestres aplicables)</b></span>
									--><!--Dotted Line--><!--
									<span class="styDotLn" style="float:right;padding-right:1mm;">.....................</span>
								</div>
							</span>
							<span style="float:right;">
								<div class="styIRS941RightNumBox" style="width:10mm;">13f</div>
								<div class="styLNCtrNumBox" style="width:46mm;border-top-width:1px;height:6mm;padding-top:1mm;text-align:right;padding-right:1mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/RfdblCOBRAPremiumSubsidyAmt"/>
									</xsl:call-template>
								</div>
							</span>
						</div>-->
						<!--Line 13g-->
<!--						<div style="width:187mm;clear:both;">
							<span style="float:left;">
								<div class="styLNLeftNumBox" style="width:8mm;padding-top:2mm">13g</div>
								<div class="styLNDesc" style="width:123mm;padding-left:1mm;padding-top:2mm">
									<span style="float:left;"><b>Total de depósitos y créditos reembolsables.</b> Sume las líneas <b>13a, 13c, 13e</b> y <b>13f</b></span>
									--><!--Dotted Line--><!--
									<span class="styDotLn" style="float:right;padding-right:1mm;">.....</span>
								</div>
							</span>
							<span style="float:right;">
								<div class="styIRS941RightNumBox" style="width:10mm;">13g</div>
								<div class="styLNCtrNumBox" style="width:46mm;border-top-width:1px;height:6mm;padding-top:1mm;text-align:right;padding-right:1mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/TotalPaymentRefundableCrAmt"/>
									</xsl:call-template>
								</div>
							</span>
						</div>-->
						<!--Line 13h-->
<!--						<div style="width:187mm;clear:both;">
							<span style="float:left;">
								<div class="styLNLeftNumBox" style="width:8mm;padding-top:2mm">13h</div>
								<div class="styLNDesc" style="width:123mm;padding-left:1mm;padding-top:2mm;font-weight:bold">
									<span style="float:left;">Reserved for future use</span>
									--><!--<span style="float:left;"><b>Total de anticipos recibidos por la radicación del (de los) Formulario(s) 7200(SP) para el trimestre</b></span>--><!--
									--><!--Dotted Line--><!--
									<span class="styDotLn" style="float:right;padding-right:1mm;">.......................</span>
								</div>
							</span>
							<span style="float:right;">
								<div class="styIRS941RightNumBox" style="width:10mm;">13h</div>
								<div class="styLNCtrNumBox" style="width:46mm;border-top-width:1px;height:6mm;padding-top:1mm;text-align:right;padding-right:1mm;background-color:lightgrey">
									--><!--<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/TotAdvncPymtEmplrCrReqQtrAmt"/>
									</xsl:call-template>--><!--
								</div>
							</span>
						</div>-->
						<!--Line 13i-->
<!--						<div style="width:187mm;clear:both;">
							<span style="float:left;">
								<div class="styLNLeftNumBox" style="width:8mm;padding-top:2mm">13i</div>
								<div class="styLNDesc" style="width:123mm;padding-left:1mm;padding-top:2mm;font-weight:bold">
									<span style="float:left;">Reserved for future use</span>
									--><!--<span style="float:left;"><b>Total de depósitos y créditos reembolsables menos anticipos.</b> Reste la línea <b>13h</b> de la línea <b>13g</b></span>--><!--
									--><!--Dotted Line--><!--
									<span class="styDotLn" style="float:right;padding-right:1mm;">.......................</span>
								</div>
							</span>
							<span style="float:right;">
								<div class="styIRS941RightNumBox" style="width:10mm;">13i</div>
								<div class="styLNCtrNumBox" style="width:46mm;border-top-width:1px;height:6mm;padding-top:1mm;text-align:right;padding-right:1mm;background-color:lightgrey">
									--><!--<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/NetTotalPaymentRefundableCrAmt"/>
									</xsl:call-template>--><!--
								</div>
							</span>
						</div>-->
						<!--Line 14-->
						<div style="width:187mm;clear:both;">
							<span style="float:left;">
								<div class="styLNLeftNumBox" style="width:8mm;padding-top:2mm">14</div>
								<div class="styLNDesc" style="width:123mm;padding-left:1mm;padding-top:2mm">
									<span style="float:left;">
										<b>Saldo adeudado.</b> Si la línea <b>12</b> es mayor que la línea <b>13</b>, anote la diferencia y vea las instrucciones </span>
									<!--Dotted Line-->
									<span class="styDotLn" style="float:right;padding-right:1mm;">..</span>
								</div>
							</span>
							<span style="float:right;">
								<div class="styIRS941RightNumBox" style="width:10mm;">14</div>
								<div class="styLNCtrNumBox" style="width:46mm;border-top-width:1px;height:6mm;padding-top:1mm;text-align:right;padding-right:1mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/BalanceDueAmt"/>
									</xsl:call-template>
								</div>
							</span>
						</div>
					<!--Line 15-->
					<div style="width:187mm;height:8mm;padding-top:1mm;">
						<div class="styLNLeftNumBox" style="width:8mm;padding-top:1mm;">15</div>
						<div class="styLNDesc" style="width:68mm;padding-left:1mm;padding-right:1mm;">
							<b>Pago en exceso.</b> Si la línea <b>13</b> es mayor que la línea<br/>
							<b>12</b>, anote la diferencia
							<!--Dotted Line-->
							<span class="styDotLn" style="float:right;padding-right:1mm;">.........</span>
						</div>
						<div style="padding-top:0.5mm;float:left">
							<div class="styLNCtrNumBox" style="width:32mm;padding-top:1mm;border-top-width:1px;height:5mm;text-align:right;padding-right:1mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/OverpaymentGrp/OverpaidAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<div class="styLNDesc" style="width:16mm;text-align:right;">
							Marque uno:
						</div>
						<div style="width:33mm;float:left;padding-bottom:2mm;">
							<xsl:call-template name="PopulateSpan">
								<xsl:with-param name="TargetNode" select="$FormData/OverpaymentGrp/ApplyOverpaymentNextReturnInd"/>
							</xsl:call-template>
<div style="height:5mm;">
							<input type="checkbox" aria-label="ApplyToNextReturn" class="styCkbox">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$FormData/OverpaymentGrp/ApplyOverpaymentNextReturnInd"/>
									<xsl:with-param name="BackupName">941ApplyOverpaymentNextReturnInd</xsl:with-param>
								</xsl:call-template>
							</input>
</div>
<div style="height:5mm;">
							<label>
								<xsl:call-template name="PopulateLabel">
									<xsl:with-param name="TargetNode" select="$FormData/OverpaymentGrp/ApplyOverpaymentNextReturnInd"/>
									<xsl:with-param name="BackupName">941ApplyOverpaymentNextReturnInd</xsl:with-param>
								</xsl:call-template>
								<span>Aplíquese a la<br/>próxima declaración.</span>
							</label>
</div>
						</div>	
						<div style="width:30mm;float:left;padding-bottom:3mm;">	
							<xsl:call-template name="PopulateSpan">
								<xsl:with-param name="TargetNode" select="$FormData/OverpaymentGrp/RefundOverpaymentInd"/>
							</xsl:call-template>
							<input type="checkbox" aria-label="SendARefund" class="styCkbox">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$FormData/OverpaymentGrp/RefundOverpaymentInd"/>
									<xsl:with-param name="BackupName">941RefundOverpaymentInd</xsl:with-param>
								</xsl:call-template>
							</input>
							<label>
								<xsl:call-template name="PopulateLabel">
									<xsl:with-param name="TargetNode" select="$FormData/OverpaymentGrp/RefundOverpaymentInd"/>
									<xsl:with-param name="BackupName">941RefundOverpaymentInd</xsl:with-param>
								</xsl:call-template>
								<span>Envíe un reembolso.</span>
							</label>
						</div>
					</div>			
					<!-- Bullet message -->
					<div style="width:187mm;padding-top:1mm;padding-bottom:0mm;float:none;clear:both;">
						<span style="float:left;padding-bottom:0mm;">
							<div class="styLNLeftNumBox" style="width:8mm;padding-bottom:0mm;"/>
							<div class="styLNDesc" style="width:130mm;padding-left:1mm;padding-bottom:0mm;">
							<!--12/16/2022-->
								<b> TIENE que completar ambas páginas del Formulario 941 y FIRMARLO.</b>
							</div>
						</span>
					</div>
						<!-- Page boundary -->
						<div class="styBB" style="width:187mm;border-top-width:1px;float:none;"/>
						<div class="pageEnd" style="width:187mm;float:none;clear:both;">
							<span style="float:left;clear:none;font-weight:bold;width:117mm;padding-top:0mm;">Para el Aviso sobre la Ley de Confidencialidad de Información y la Ley de Reducción de Trámites, vea el dorso del Comprobante de Pago.</span>
							<span style="float:left;clear:none;margin-left:5mm;padding-top:0.5mm;">Cat. No. 93474O</span>
							<span style="float:right;clear:none;">Form <span class="styBoldText" style="font-size:9pt;">
									941 (sp)
								</span> (Rev. 3-2026)</span>
						</div>
						<p style="page-break-before: always"/>
						<!--Begin Page 2-->
						<div style="width:187mm;float:none;clear:both;">
							<!--Name Shown on return-->
							<div class="styBB" style="width:187mm;font-size:7pt;border-top-width:2px;float:none;clear:both;">
								<div class="styFNBox" style="width:126mm; height:8.5mm;">
									<b>Nombre</b> (el nombre legal del negocio, no el nombre comercial)<br/>
									<xsl:call-template name="PopulateReturnHeaderFiler">
										<xsl:with-param name="TargetNode">BusinessNameLine1Txt</xsl:with-param>
									</xsl:call-template>
									<br/>
									<xsl:call-template name="PopulateReturnHeaderFiler">
										<xsl:with-param name="TargetNode">BusinessNameLine2Txt</xsl:with-param>
									</xsl:call-template>
									<div style="line-height:100%; font-family:verdana;font-size:7pt"/>
								</div>
								<span style="padding-left:.5mm">
									<b>Número de identificación del empleador <i>(EIN)</i>
									</b>
								</span>
								<br/>
								<div style="text-align:center;padding-top:2mm;padding-left:.5mm">
									<xsl:call-template name="PopulateReturnHeaderFiler">
										<xsl:with-param name="TargetNode">EIN</xsl:with-param>
									</xsl:call-template>
								</div>
							</div>
						</div>
						<!--Part 2-->
						<div class="styBB" style="width:187mm;float:none;clear:both;border-top-width:1px">
							<div class="styPartName" style="width:13mm;text-align:center;height:6mm;padding-top:1mm;font-size:9pt;">Parte 2:</div>
							<div class="styPartDesc" style="width:173.9mm;text-align:left;height:6mm;padding-top:1mm;padding-left:2mm;font-size:9pt;">Infórmenos sobre su itinerario de depósitos y obligación tributaria para este trimestre.</div>
						</div>
						<div style="width:187;float:none;clear:both;">
							<div class="styLNDesc" style="width:187mm;font-weight:bold;padding-left:2mm;font-size:8pt;">
				Si no está seguro de si es depositante de itinerario mensual o de itinerario bisemanal, vea el apartado 11 de la Publicación 15.
			</div>
							<!--Line 16-->
							<div style="width:187mm;padding-bottom:1mm;padding-top:1.4mm;mm;font-size:8pt;float:none;clear:both;">
								<div class="styLNLeftNumBox" style="width:8mm;">16</div>
								<div class="styLNDesc" style="width:20mm;padding-left:1mm;height:25mm">
									<b>Marque uno:</b>
								</div>
								<span>
									<xsl:call-template name="PopulateSpan">
										<xsl:with-param name="TargetNode" select="$FormData/TotalTaxLessThanLimitAmtInd"/>
									</xsl:call-template>
									<input type="checkbox" aria-label="TotalImpuestosMenosCantidadLímite" class="styCkbox">
										<xsl:call-template name="PopulateCheckbox">
											<xsl:with-param name="TargetNode" select="$FormData/TotalTaxLessThanLimitAmtInd"/>
											<xsl:with-param name="BackupName">941PRTotalTaxLessThanLimitAmtInd</xsl:with-param>
										</xsl:call-template>
									</input>
									<label style="padding-left:3mm;width:154.5mm;vertical-align:top;">
										<xsl:call-template name="PopulateLabel">
											<xsl:with-param name="TargetNode" select="$FormData/TotalTaxLessThanLimitAmtInd"/>
											<xsl:with-param name="BackupName">941PRTotalTaxLessThanLimitAmtInd</xsl:with-param>
										</xsl:call-template>
										<span style="width:150mm;padding-top:1mm;font-size:7pt;">
										<b>La línea 12 de esta declaración es menos de $2,500 o la línea 12 	de la declaración del trimestre 
										anterior era menos de $2,500 y usted no tuvo una obligación de depositar $100,000 el próximo día 
										durante el trimestre actual.</b> Si la línea <b>12</b> del trimestre anterior era menos de $2,500 
										pero la línea <b>12</b> de la declaración actual es $100,000 o más, usted tiene que proveer un 
										registro de su obligación tributaria. Si es depositante de itinerario mensual, complete el 
										itinerario de depósitos a continuación; si es depositante de itinerario bisemanal, adjunte el 
										Anexo B (Formulario 941). Pase a la Parte 3.</span>
									</label>
								</span>
								<br/>
								<br/>
								<span>
									<xsl:call-template name="PopulateSpan">
										<xsl:with-param name="TargetNode" select="$FormData/MonthlyScheduleDepositorGrp/MonthlyScheduleDepositorInd"/>
									</xsl:call-template>
									<input type="checkbox" aria-label="DepositanteMensualHorario" class="styCkbox">
										<xsl:call-template name="PopulateCheckbox">
											<xsl:with-param name="TargetNode" select="$FormData/MonthlyScheduleDepositorGrp/MonthlyScheduleDepositorInd"/>
											<xsl:with-param name="BackupName">941PRMonthlyScheduleDepositorInd</xsl:with-param>
										</xsl:call-template>
									</input>
									<label style="padding-left:3mm;width:155mm;vertical-align:top;">
										<xsl:call-template name="PopulateLabel">
											<xsl:with-param name="TargetNode" select="$FormData/MonthlyScheduleDepositorGrp/MonthlyScheduleDepositorInd"/>
											<xsl:with-param name="BackupName">941PRMonthlyScheduleDepositorInd</xsl:with-param>
										</xsl:call-template>
										<span style="width:150mm;padding-top:1mm;font-size:7pt;">
										<b>Era depositante de itinerario mensual para todo el trimestre.</b> Anote la obligación 
										tributaria para cada mes y la obligación tributaria para el trimestre, luego, pase a la 
										Parte 3.</span>
									</label>
								</span>
							</div>
							<div style="width:187mm;height:7mm;float:none;clear:both;">
								<div class="styLNDesc" style="font-weight:bold;width:83mm;padding-top:3mm;text-align:right;padding-right:4mm;padding-left:35mm;">
									<div style="float:left;text-align:left;">Obligación tributaria:</div>Mes 1
				</div>
								<div class="styLNCtrNumBox" style="width:46mm;border-top-width:1px;height:6mm;padding-top:1mm;text-align:right;padding-right:1mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/MonthlyScheduleDepositorGrp/TaxLiabilityMonth1Amt"/>
									</xsl:call-template>
								</div>
							</div>
							<div style="width:187mm;height:7mm;float:none;clear:both;">
								<div class="styLNDesc" style="font-weight:bold;width:83mm;padding-right:4mm;padding-top:3mm;text-align:right;">
					Mes 2
				</div>
								<div class="styLNCtrNumBox" style="width:46mm;border-top-width:1px;height:6mm;padding-top:1mm;text-align:right;padding-right:1mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/MonthlyScheduleDepositorGrp/TaxLiabilityMonth2Amt"/>
									</xsl:call-template>
								</div>
							</div>
							<div style="width:187mm;height:7mm;float:none;clear:both;">
								<div class="styLNDesc" style="font-weight:bold;width:83mm;padding-right:4mm;padding-top:3mm;text-align:right;">
					Mes 3
				</div>
								<div class="styLNCtrNumBox" style="width:46mm;border-top-width:1px;height:6mm;padding-top:1mm;text-align:right;padding-right:1mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/MonthlyScheduleDepositorGrp/TaxLiabilityMonth3Amt"/>
									</xsl:call-template>
								</div>
							</div>
							<div style="width:187mm;height:7mm;padding-bottom:3mm;float:none;clear:both;">
								<div class="styLNDesc" style="font-weight:bold;width:83mm;padding-top:3mm;padding-right:4mm;text-align:right;">
					Obligación total para el trimestre
				</div>
								<div class="styLNCtrNumBox" style="width:46mm;border-top-width:1px;height:6mm;padding-top:1mm;text-align:right;padding-right:1mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/MonthlyScheduleDepositorGrp/TotalQuarterTaxLiabilityAmt"/>
									</xsl:call-template>
								</div>
								<div class="styLNDesc" style="font-weight:bold;width:50mm;padding-left:2mm;padding-top:3mm;">
					El total tiene que ser igual a la línea 12.
				</div>
							</div>
							<div style="width:187mm;padding-left:29mm;float:none;clear:both;">
								<span>
									<xsl:call-template name="PopulateSpan">
										<xsl:with-param name="TargetNode" select="$FormData/SemiweeklyScheduleDepositorInd"/>
									</xsl:call-template>
									<input type="checkbox" aria-label="DepositanteBisemanalHorario" class="styCkbox">
										<xsl:call-template name="PopulateCheckbox">
											<xsl:with-param name="TargetNode" select="$FormData/SemiweeklyScheduleDepositorInd"/>
											<xsl:with-param name="BackupName">941PRSemiweeklyScheduleDepositorInd</xsl:with-param>
										</xsl:call-template>
									</input>
									<label style="padding-left:3mm;width:155mm;vertical-align:top;">
										<xsl:call-template name="PopulateLabel">
											<xsl:with-param name="TargetNode" select="$FormData/SemiweeklyScheduleDepositorInd"/>
											<xsl:with-param name="BackupName">941PRSemiweeklyScheduleDepositorInd</xsl:with-param>
										</xsl:call-template>
										<span style="width:148mm;padding-top:1mm;">
										<b>Era depositante de itinerario bisemanal durante cualquier parte de este trimestre.</b> Complete 
										el Anexo B (Formulario 941), Registro de la Obligación Tributaria para los Depositantes de 
										Itinerario Bisemanal, y adjúntelo del Formulario 941. Pase a la Parte 3.</span>
										<xsl:call-template name="SetFormLinkInline">
											<xsl:with-param name="TargetNode" select="$FormData/SemiweeklyScheduleDepositorInd"/>
										</xsl:call-template>
									</label>
								</span>
							</div>
						</div>

						<!-- Page boundary -->
<!--						<div class="pageEnd" style="width:187mm;float:none;clear:both;">
							<span style="float:left;clear:none;">Página <span class="styBoldText" style="font-size:9pt;">2</span></span>
							<span style="float:right;clear:none;padding-top:0.4mm;">Formulario <span class="styBoldText" style="font-size:9pt;">
									<xsl:if test="/AppData/Parameters/SubmissionType='941SS'">941-SS</xsl:if>
									<xsl:if test="/AppData/Parameters/SubmissionType='941PR'">941-PR</xsl:if>
								</span> (Rev. 3-2025)</span>
						</div>
						<p style="page-break-before: always"/>-->
						<!--Begin Page 2-->
<!--						<div style="width:187mm;float:none;clear:both;">
-->							<!--Name Shown on return-->
<!--							<div class="styBB" style="width:187mm;font-size:7pt;border-top-width:2px;float:none;clear:both;">
								<div class="styFNBox" style="width:126mm; height:8.5mm;">
									<b>Nombre</b> (el nombre legal del negocio, no el nombre comercial)<br/>
									<xsl:call-template name="PopulateReturnHeaderFiler">
										<xsl:with-param name="TargetNode">BusinessNameLine1Txt</xsl:with-param>
									</xsl:call-template>
									<br/>
									<xsl:call-template name="PopulateReturnHeaderFiler">
										<xsl:with-param name="TargetNode">BusinessNameLine2Txt</xsl:with-param>
									</xsl:call-template>
									<div style="line-height:100%; font-family:verdana;font-size:7pt"/>
								</div>
								<span style="padding-left:.5mm">
									<b>Número de identificación patronal <i>(EIN)</i>
									</b>
								</span>
								<br/>
								<div style="text-align:center;padding-top:2mm;padding-left:.5mm">
									<xsl:call-template name="PopulateReturnHeaderFiler">
										<xsl:with-param name="TargetNode">EIN</xsl:with-param>
									</xsl:call-template>
								</div>
							</div>
						</div>
-->						<!--Part 3-->
						<div class="styBB" style="width:187mm;border-top-width:1px;float:none;clear:both;">
							<div class="styPartName" style="width:13mm;text-align:center;height:6mm;padding-top:1mm;font-size:9pt;">Parte 3:</div>
							<div class="styPartDesc" style="width:173.9mm;text-align:left;height:6mm;padding-top:1mm;padding-left:2mm;font-size:9pt;">Infórmenos sobre su negocio. Si cualquiera de las preguntas NO corresponde a su negocio, déjela en blanco.</div>
						</div>
						<div style="width:187mm;float:none;clear:both;">
							<!--Line 17-->
							<div style="width:187mm;padding-bottom:1mm;padding-top:1mm;float:none;clear:both;">
								<div class="styLNLeftNumBox" style="width:8mm;">17</div>
								<div class="styLNDesc" style="width:147mm;padding-left:1mm;font-weight:bold;">
									<span style="float:left;">Si su negocio ha dejado de operar o si usted ha dejado de pagar salarios </span>
									<!--Dotted Line-->
									<span class="styDotLn" style="float:right;padding-right:1mm;">...............</span>
								</div>
								<input type="checkbox" aria-label="NegociosCerradosOParadaSalarioPago" class="styCkbox">
									<xsl:call-template name="PopulateCheckbox">
										<xsl:with-param name="TargetNode" select="$FormData/BusinessClosedGrp/FutureFilingNotRequiredInd"/>
										<xsl:with-param name="BackupName">941PRFutureFilingNotRequiredInd</xsl:with-param>
									</xsl:call-template>
								</input>
								<label>
									<xsl:call-template name="PopulateLabel">
										<xsl:with-param name="TargetNode" select="$FormData/BusinessClosedGrp/FutureFilingNotRequiredInd"/>
										<xsl:with-param name="BackupName">941PRFutureFilingNotRequiredInd</xsl:with-param>
									</xsl:call-template>
									<span style="width:1mm;"/>Marque aquí y<br/>
								</label>
								<div class="styLNDesc" style="width:60mm;padding-left:9mm;padding-top:2mm;">
					anote la última fecha en la que pagó salarios
				</div>
								<div class="styLNCtrNumBox" style="width:25mm;border-top-width:1px;height:6mm;padding-top:1mm;">
									<xsl:call-template name="PopulateMonthDayYear">
										<xsl:with-param name="TargetNode" select="$FormData/BusinessClosedGrp/FinalWagesPaidDt"/>
									</xsl:call-template>
								</div>
								<div style="padding-top:2mm;">; también adjunte una nota aclaratoria a su declaración. Vea las instrucciones.</div>
							</div>
							<!--Line 18-->
							<div style="width:187mm;float:none;clear:both;">
								<div class="styLNLeftNumBox" style="width:8mm;">18</div>
								<div class="styLNDesc" style="width:147mm;padding-left:1mm;font-weight:bold;">
									<span style="float:left;">Si es empleador estacional y no tiene que presentar declaraciones para cada trimestre del año </span>
									<!--Dotted Line-->
									<span class="styDotLn" style="float:right;padding-right:1mm;">.......</span>
								</div>
								<input type="checkbox" aria-label="EmpleadorDeTemporada" class="styCkbox">
									<xsl:call-template name="PopulateCheckbox">
										<xsl:with-param name="TargetNode" select="$FormData/SeasonalEmployerInd"/>
										<xsl:with-param name="BackupName">941PRSeasonalEmployerInd</xsl:with-param>
									</xsl:call-template>
								</input>
								<label>
									<xsl:call-template name="PopulateLabel">
										<xsl:with-param name="TargetNode" select="$FormData/SeasonalEmployerInd"/>
										<xsl:with-param name="BackupName">941PRSeasonalEmployerInd</xsl:with-param>
									</xsl:call-template>
									<span style="width:1mm;"/>Marque aquí.<br/>
								</label>
							</div>
						</div>						
						<!--Part 4-->
						<div class="styBB" style="width:187mm;border-top-width:1px;float:none;clear:both;">
							<div class="styPartName" style="width:13mm;text-align:center;height:6mm;padding-top:1mm;font-size:9pt;">Parte 4:</div>
							<div class="styPartDesc" style="width:173.9mm;text-align:left;height:6mm;padding-top:1mm;padding-left:2mm;font-size:9pt;">¿Podemos comunicarnos con su tercero autorizado?</div>
						</div>
						<div style="width:187mm;font-size:8pt;float:none;clear:both;">
							<div class="styLNDesc" style="width:187mm;height:8mm;padding-left:9mm;padding-top:2mm;">
								<b>¿Desea permitir que un empleado, preparador remunerado u otra persona hable sobre esta declaración con el <i>
				IRS?</i>
								</b> Vea las instrucciones para más detalles.
			</div>
							<div style="width:187mm;float:none;clear:both;padding-bottom:1.6mm;">
								<div style="width:25mm;float:left;padding-left:10mm">
									<span>
										<xsl:call-template name="PopulateSpan">
											<xsl:with-param name="TargetNode" select="$RtnHdrData/DiscussWithThirdPartyYesGrp/DiscussWithThirdPartyYesInd"/>
										</xsl:call-template>
										<input type="checkbox" aria-label="DiscutirConTercerosSí" class="styCkbox">
											<xsl:call-template name="PopulateYesCheckbox">
												<xsl:with-param name="TargetNode" select="$RtnHdrData/DiscussWithThirdPartyYesGrp/DiscussWithThirdPartyYesInd"/>
												<xsl:with-param name="BackupName">941PRDiscussWithThirdPartyYesInd</xsl:with-param>
											</xsl:call-template>
										</input>
									</span>
									<label>
										<xsl:call-template name="PopulateLabelYes">
											<xsl:with-param name="TargetNode" select="$RtnHdrData/DiscussWithThirdPartyYesGrp/DiscussWithThirdPartyYesInd"/>
											<xsl:with-param name="BackupName">941PRDiscussWithThirdPartyYesInd</xsl:with-param>
										</xsl:call-template>
						Sí.
					</label>
									<br/>
									<br/>
									<br/>
									<br/>
									<br/>
									<span>
										<xsl:call-template name="PopulateSpan">
											<xsl:with-param name="TargetNode" select="$RtnHdrData/DiscussWithThirdPartyNoInd"/>
										</xsl:call-template>
										<input type="checkbox" aria-label="DiscutirConTercerosNo" class="styCkbox">
											<xsl:call-template name="PopulateNoCheckbox">
												<xsl:with-param name="TargetNode" select="$RtnHdrData/DiscussWithThirdPartyNoInd"/>
												<xsl:with-param name="BackupName">941PRDiscussWithThirdPartyNoInd</xsl:with-param>
											</xsl:call-template>
										</input>
									</span>
									<label>
										<xsl:call-template name="PopulateLabelNo">
											<xsl:with-param name="TargetNode" select="$RtnHdrData/DiscussWithThirdPartyNoInd"/>
											<xsl:with-param name="BackupName">941PRDiscussWithThirdPartyNoInd</xsl:with-param>
										</xsl:call-template>
						No.
					</label>
								</div>
								<div style="width:161mm;float:right;">
									<div style="width:161mm;height:6mm;">
										<div class="styLNDesc" style="width:25mm;float:left;padding-top:1.5mm;">
							Nombre y núm. de teléfono del tercero designado
						</div>
										<div style="padding-top:3mm;float:left;">
											<div class="styLNCtrNumBox" style="width:79mm;border-top-width:1px;height:6mm;float:left;padding-top:1mm;text-align:left;padding-left:1mm;">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="$RtnHdrData/DiscussWithThirdPartyYesGrp/ThirdPartyDesigneeNm"/>
												</xsl:call-template>
											</div>
											<span class="styLNCtrNumBox" style="width:5mm;border:none"/>
											<div class="styLNCtrNumBox" style="width:52mm;border-top-width:1px;height:6mm;padding-top:1mm;float:right;word-wrap:break-word;">
												<xsl:if test="$RtnHdrData/DiscussWithThirdPartyYesGrp/ThirdPartyDesigneePhoneNum">
													<xsl:call-template name="PopulatePhoneNumber">
														<xsl:with-param name="TargetNode" select="$RtnHdrData/DiscussWithThirdPartyYesGrp/ThirdPartyDesigneePhoneNum"/>
													</xsl:call-template>
												</xsl:if>
												<xsl:if test="$RtnHdrData/DiscussWithThirdPartyYesGrp/ThirdPartyDesigneeFrgnPhoneNum">
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="$RtnHdrData/DiscussWithThirdPartyYesGrp/ThirdPartyDesigneeFrgnPhoneNum"/>
													</xsl:call-template>
												</xsl:if>
											</div>
										</div>
									</div>
									<div style="width:161mm;height:6mm;padding-top:5mm;">
										<div class="styLNDesc" style="width:131mm;padding-top:2mm;">
							Seleccione un número de identificación personal <i>(PIN)</i> de 5 dígitos que usará del hablar con el <i>IRS</i>.
						</div>
										<div style="float:right;">
											<div class="styLNCtrNumBox" style="width:30mm;float:left;border-top-width:1px;height:6mm;padding-top:1mm;">
												<xsl:call-template name="PopulatePin">
													<xsl:with-param name="TargetNode" select="$RtnHdrData/DiscussWithThirdPartyYesGrp/ThirdPartyDesigneePIN"/>
												</xsl:call-template>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
						<!--Part 5-->
						<div class="styBB" style="width:187mm;border-top-width:1px;float:none;clear:both;">
							<div class="styPartName" style="width:13mm;text-align:center;height:6mm;padding-top:1mm;font-size:9pt;">Parte 5:</div>
							<div class="styPartDesc" style="width:173.9mm;text-align:left;height:6mm;padding-top:1mm;padding-left:2mm;font-size:9pt;">Firme aquí. TIENE que completar ambas páginas del Formulario 941 y luego FIRMARLO.</div>
						</div>
						<div style="width:187mm;font-size:8pt;">
							<div class="styLNDesc" style="width:187mm;height:10mm;padding-top:2mm;font-family:Arial Narrow;">
								Bajo pena de perjurio, declaro que he examinado esta declaración, incluyendo los anexos e informes adjuntos, y que, a 
								mi leal saber y entender, es verídica, correcta y completa. La declaración del preparador (que no sea el 
								contribuyente) se basa en toda información de la cual el preparador tenga conocimiento.
							</div>
							<div style="width:187mm;float:none;clear:both;">
								<div style="width:26mm;height:17mm;padding-top:1mm;font-weight:bold;font-size:10pt;float:left;padding-left:8mm;">
					Firme su nombre aquí
				</div>
								<div class="styLNCtrNumBox" style="width:71mm;border-top-width:1px;height:17mm;float:left;word-wrap:break-word;padding-top:1mm;text-align:left;padding-left:1mm;">
									<xsl:if test="$RtnHdrData/ReportingAgentPINGrp/PIN">
										<xsl:call-template name="PopulatePin">
											<xsl:with-param name="TargetNode" select="$RtnHdrData/ReportingAgentPINGrp/PIN"/>
										</xsl:call-template>
									</xsl:if>
									<xsl:if test="$RtnHdrData/PractitionerPINGrp/TaxpayerPIN">
										<xsl:call-template name="PopulatePin">
											<xsl:with-param name="TargetNode" select="$RtnHdrData/PractitionerPINGrp/TaxpayerPIN"/>
										</xsl:call-template>
										<br/>
									</xsl:if>
									<xsl:if test="$RtnHdrData/PractitionerPINGrp/PINEnteredByCd">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$RtnHdrData/PractitionerPINGrp/PINEnteredByCd"/>
										</xsl:call-template>
										<br/>
									</xsl:if>
									<xsl:if test="$RtnHdrData/PractitionerPINGrp/EFIN">
										<xsl:call-template name="PopulatePin">
											<xsl:with-param name="TargetNode" select="$RtnHdrData/PractitionerPINGrp/EFIN"/>
										</xsl:call-template>
										<br/>
									</xsl:if>
									<xsl:if test="$RtnHdrData/PractitionerPINGrp/PracitionerPIN">
										<xsl:call-template name="PopulatePin">
											<xsl:with-param name="TargetNode" select="$RtnHdrData/PractitionerPINGrp/PractitionerPIN"/>
										</xsl:call-template>
										<br/>
									</xsl:if>
									<xsl:if test="$RtnHdrData/PractitionerPINGrp/JuratDisclosureCd">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$RtnHdrData/PractitionerPINGrp/JuratDisclosureCd"/>
										</xsl:call-template>
									</xsl:if>
								</div>
								<div style="width:90mm;height:auto;float:left;padding-left:8mm;">
									<div style="width:28mm;height:9mm;float:left;">Escriba su nombre en letra de molde aquí</div>
									<div style="width:52mm;height:9mm;padding-top:4px;padding-left:1mm;">
										<div class="styLNCtrNumBox" style="width:53mm;border-top-width:1px;height:8mm;padding-top:1mm;text-align:left;padding-left:1mm;">
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
											<br/>
											<xsl:if test="$RtnHdrData/ReportingAgentPINGrp/RAPINEnteredByCd">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="$RtnHdrData/ReportingAgentPINGrp/RAPINEnteredByCd"/>
												</xsl:call-template>
											</xsl:if>
										</div>
									</div>
									<div style="width:28mm;height:8mm;float:left;">Escriba su cargo en letra de molde aquí</div>
									<div style="height:8mm;padding-top:4px;padding-bottom:0mm;float:right;">
										<div class="styLNCtrNumBox" style="width:53mm;border-top-width:1px;height:auto;padding-top:1mm;text-align:left;padding-left:1mm;">
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
											<xsl:if test="$RtnHdrData/ReportingAgentPINGrp/JuratDisclosureCd">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="$RtnHdrData/ReportingAgentPINGrp/JuratDisclosureCd"/>
												</xsl:call-template>
											</xsl:if>
										</div>
									</div>
								</div>
							</div>
							<div class="styBB" style="width:187mm;padding-bottom:1mm;padding-top:4mm;float:none;clear:both;">
								<div class="styLNDesc" style="width:31.5mm;text-align:right;padding-right:3mm;padding-top:4mm;">
					Fecha
				</div>
								<div style="padding-top:4px;float:left;">
									<div class="styLNCtrNumBox" style="width:26mm;border-top-width:1px;height:6mm;padding-top:1mm;">
										<xsl:if test="$RtnHdrData/SignatureDocumentGrp/SignatureDt">
											<xsl:call-template name="PopulateMonthDayYear">
												<xsl:with-param name="TargetNode" select="$RtnHdrData/SignatureDocumentGrp/SignatureDt"/>
											</xsl:call-template>
										</xsl:if>
										<xsl:if test="$RtnHdrData/PractitionerPINGrp/TaxpayerSignatureDt">
											<xsl:call-template name="PopulateMonthDayYear">
												<xsl:with-param name="TargetNode" select="$RtnHdrData/PractitionerPINGrp/TaxpayerSignatureDt"/>
											</xsl:call-template>
										</xsl:if>
									</div>
								</div>
								<div class="styLNDesc" style="width:87mm;padding-left:47mm;padding-right:2mm;padding-top:2mm">
					Mejor núm. de teléfono donde llamarlo durante el día
				</div>
								<div style="padding-top:2mm;float:right;">
									<div class="styLNCtrNumBox" style="width:42.5mm;border-top-width:1px;height:8mm;padding-top:1mm;word-wrap:break-word;">
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
							</div>
						</div>
						<div style="width:187mm;padding-bottom:3mm;float:none;clear:both;">
							<div class="styLNDesc" style="width:85mm;font-size:9pt;font-weight:bold;float:left;padding-left:1mm;padding-left:8mm;">
					Para Uso Exclusivo del Preparador Remunerado
				</div>
							<div class="styLNDesc" style="width:82mm;float:right;font-size:9pt;">
								<span style="padding-left:8mm;float:left;">Marque si usted trabaja por cuenta propia </span>
								<!--Dotted Line-->
								<span class="styDotLn" style="float:left;padding-left:2mm;">..</span>
								<input type="checkbox" aria-label="Autónomos" class="styCkbox">
									<xsl:call-template name="PopulateCheckbox">
										<xsl:with-param name="TargetNode" select="$RtnHdrData/PaidPreparerInformationGrp/SelfEmployedInd"/>
										<xsl:with-param name="BackupName">941PRSelfEmployedInd</xsl:with-param>
									</xsl:call-template>
								</input>
								<label>
									<xsl:call-template name="PopulateLabel">
										<xsl:with-param name="TargetNode" select="$RtnHdrData/PaidPreparerInformationGrp/SelfEmployedInd"/>
										<xsl:with-param name="BackupName">941PRSelfEmployedInd</xsl:with-param>
									</xsl:call-template>
								</label>
							</div>
						</div>
						<div style="width:187mm;padding-bottom:3mm;float:none;clear:both;">
							<div class="styLNDesc" style="width:22mm;padding-left:2mm;padding-right:7mm;font-size:7pt;">
					Nombre del preparador
				</div>
							<div class="styLNCtrNumBox" style="width:102mm;border-top-width:1px;height:6mm;padding-top:1mm;text-align:left;padding-left:1mm;">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$RtnHdrData/PaidPreparerInformationGrp/PreparerPersonNm"/>
								</xsl:call-template>
							</div>
							<div class="styLNDesc" style="width:17mm;padding-left:3mm;padding-top:2mm;">
								<i>PTIN</i>
							</div>
							<div class="styLNCtrNumBox" style="width:44.8mm;border-top-width:1px;height:6mm;padding-top:1mm;float:right;">
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
						<div style="width:187mm;float:none;clear:both;">
							<div class="styLNDesc" style="width:22mm;padding-left:2mm;padding-right:9mm;font-size:7pt;">
					Firma del preparador
				</div>
							<div class="styLNCtrNumBox" style="width:102mm;border-top-width:1px;height:6mm;word-wrap:break-word;padding-top:1mm;text-align:left;padding-right:1mm;padding-left:1mm;">
				</div>
							<div class="styLNDesc" style="width:17mm;padding-left:3mm;padding-top:2mm;">
					Fecha
				</div>
							<div class="styLNCtrNumBox" style="width:44.8mm;border-top-width:1px;height:6mm;padding-top:1mm;float:right;">
								<xsl:call-template name="PopulateMonthDayYear">
									<xsl:with-param name="TargetNode" select="$RtnHdrData/PaidPreparerInformationGrp/SignatureDt"/>
								</xsl:call-template>
							</div>
						</div>
						<div style="width:187mm;padding-bottom:2mm;float:none;clear:both;">
							<div class="styLNDesc" style="width:22mm;padding-left:2mm;padding-right:2.5mm;padding-top:4mm;font-size:6.5pt;">
					Nombre de la empresa (o el suyo, si trabaja por cuenta propia)
				</div>
							<div style="padding-top:12px;float:left;">
								<div class="styLNCtrNumBox" style="width:102mm;border-top-width:1px;height:auto;text-align:left;padding-left:1mm;">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$RtnHdrData/PaidPreparerInformationGrp/PreparerFirmName/BusinessNameLine1Txt"/>
									</xsl:call-template>
									<br/>
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$RtnHdrData/PaidPreparerInformationGrp/PreparerFirmName/BusinessNameLine2Txt"/>
									</xsl:call-template>
								</div>
							</div>
							<div class="styLNDesc" style="width:17mm;padding-left:3mm;padding-top:5mm">
								<i>EIN</i>
							</div>
							<div style="padding-top:12px;float:right;">
								<div class="styLNCtrNumBox" style="width:44.8mm;border-top-width:1px;height:6mm;padding-top:1mm;">
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
						</div>
						<div style="width:187mm;padding-bottom:2mm;float:none;clear:both;">
							<div class="styLNDesc" style="width:22mm;padding-left:2mm;padding-right:1mm;padding-top:8mm;font-size:7pt;">
					Dirección
				</div>
							<div style="padding-top:15px;float:left;">
								<div class="styLNCtrNumBox" style="width:102mm;border-top-width:1px;height:8mm;text-align:left;padding-left:1mm;">
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
										<br/>
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$RtnHdrData/PaidPreparerInformationGrp/PreparerForeignAddress/AddressLine2Txt"/>
										</xsl:call-template>
									</xsl:if>
								</div>
							</div>
							<div class="styLNDesc" style="width:17mm;padding-left:3mm;padding-top:4mm;padding-right:2mm;">
					Núm. de teléfono
				</div>
							<div style="padding-top:15px;float:right;">
								<div class="styLNCtrNumBox" style="width:44.8mm;border-top-width:1px;height:7mm;padding-top:1mm;word-wrap:break-word;">
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
						</div>
						<div class="styBB" style="width:187mm;border-bottom-width:2px;padding-bottom:0.6mm;float:none;clear:both;">
							<div class="styLNDesc" style="width:22mm;padding-left:2mm;padding-right:1mm;padding-top:4mm;font-size:7pt;">
					Ciudad
				</div>
							<xsl:choose>
								<xsl:when test="$RtnHdrData/PaidPreparerInformationGrp/PreparerForeignAddress">
									<div style="padding-top:5px;float:left;">
										<div class="styLNCtrNumBox" style="width:49.8mm;border-top-width:1px;height:7mm;padding-top:1mm;text-align:left;padding-left:1mm;word-wrap:break-word;">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="$RtnHdrData/PaidPreparerInformationGrp/PreparerForeignAddress/CityNm"/>
											</xsl:call-template>
										</div>
									</div>
									<div class="styLNDesc" style="width:10mm;padding-top:4mm;font-size:7pt;text-align:center;">
							Estado
						</div>
									<div style="padding-top:5px;float:left;">
										<div class="styLNCtrNumBox" style="width:25mm;border-top-width:1px;height:7mm;padding-top:1mm;word-wrap:break-word;">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="$RtnHdrData/PaidPreparerInformationGrp/PreparerForeignAddress/ProvinceOrStateNm"/>
											</xsl:call-template>
										</div>
									</div>
									<div class="styLNDesc" style="width:10mm;padding-top:4mm;font-size:7pt;text-align:center;">
							País
						</div>
									<div style="padding-top:5px;float:left;">
										<div class="styLNCtrNumBox" style="width:8mm;border-top-width:1px;height:7mm;padding-top:1mm;word-wrap:break-word;">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="$RtnHdrData/PaidPreparerInformationGrp/PreparerForeignAddress/CountryCd"/>
											</xsl:call-template>
										</div>
									</div>
									<div class="styLNDesc" style="width:17mm;padding-top:2mm;padding-left:3mm;padding-right:0mm;">
							Código<br/>postal <i>(ZIP)</i>
									</div>
									<div style="padding-top:5px;float:right;">
										<div class="styLNCtrNumBox" style="width:44.8mm;border-top-width:1px;height:7mm;padding-top:1mm;word-wrap:break-word;">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="$RtnHdrData/PaidPreparerInformationGrp/PreparerForeignAddress/ForeignPostalCd"/>
											</xsl:call-template>
										</div>
									</div>
								</xsl:when>
								<xsl:otherwise>
									<div style="padding-top:5px;float:left;">
										<div class="styLNCtrNumBox" style="width:65mm;border-top-width:1px;height:7mm;padding-top:1mm;text-align:left;padding-left:1mm;">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="$RtnHdrData/PaidPreparerInformationGrp/PreparerUSAddress/CityNm"/>
											</xsl:call-template>
										</div>
									</div>
									<div class="styLNDesc" style="width:15mm;padding-left:5mm;padding-top:4mm;font-size:7pt;">
							Estado
						</div>
									<div style="padding-top:5px;float:left;">
										<div class="styLNCtrNumBox" style="width:10mm;border-top-width:1px;height:6mm;padding-top:1mm;">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="$RtnHdrData/PaidPreparerInformationGrp/PreparerUSAddress/StateAbbreviationCd"/>
											</xsl:call-template>
										</div>
									</div>
									<div class="styLNDesc" style="width:29mm;padding-left:15mm;padding-right:0mm;">
							Código<br/>postal <i>(ZIP)</i>
									</div>
									<div style="padding-top:5px;float:right;">
										<div class="styLNCtrNumBox" style="width:44.8mm;border-top-width:1px;height:6mm;padding-top:1mm;">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="$RtnHdrData/PaidPreparerInformationGrp/PreparerUSAddress/ZIPCd"/>
											</xsl:call-template>
										</div>
									</div>
								</xsl:otherwise>
							</xsl:choose>
						</div>
					</div>
					<!--Page Footer-->
					<div class="pageEnd" style="width:187mm;">
						<span style="float:left;clear:none;">Página <span class="styBoldText" style="font-size:9pt;">2</span>
						</span>
						<span style="float:right;clear:none;">Form <span class="styBoldText" style="font-size:9pt;">
							941 (sp)
								<!--<xsl:if test="/AppData/Parameters/SubmissionType='941SS'">941-SS</xsl:if>
								<xsl:if test="/AppData/Parameters/SubmissionType='941PR'">941-PR</xsl:if>-->
						</span> 
						(Rev. 3-2025)</span>
					</div>
					<!-- BEGIN Left Over Table -->
					<p style="page-break-after:always"/>
					<!-- Additonal Data Title Bar and Button -->
					<div class="styLeftOverTitleLine" id="LeftoverData">
						<div class="styLeftOverTitle" style="float:left;">
				Additional Data        
			</div>
						<div class="styLeftOverButtonContainer" style="float:right;">
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