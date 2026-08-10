<?xml version="1.0" encoding="UTF-8"?>
<!-- Form 1040SR - TY25 - Last Modified by Yee Chen on 11/3/2025 -->
<!DOCTYPE xsl:stylesheet [
  <!ENTITY nbsp "&#160;">
  <!ENTITY ndash "&#8211;">
  <!ENTITY mdash "&#8212;">
]>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
<!--<xsl:include href="PopulateTemplate.xsl" />
	<xsl:include href="AddHeader.xsl" />
	<xsl:include href="CommonPathRef.xsl" />
	<xsl:include href="AddOnTable.xsl" />
	<xsl:include href="IRS1040SRStyle.xsl" />
	<xsl:output method="html" indent="yes" />
	<xsl:strip-space elements="*" />
	<xsl:param name="FormData" select="$RtnDoc/IRS1040" />
	<xsl:template match="/">-->
	<!-- For local testing, swap comments above for the line below -->
	<xsl:template name="DisplayIRS1040SR">
		<xsl:param name="FormData" select="$RtnDoc/IRS1040" />
		<!--<xsl:param name="FormDataSch8812" select="$RtnDoc/IRS1040Schedule8812" />-->
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
				<meta name="Description" content="IRS Form 1040" />
				<script language="JavaScript" src="{$ScriptPath}/FormDisplay.js" type="text/javascript" />
				<xsl:call-template name="InitJS" />
				<style type="text/css">
					<xsl:if test="not($Print) or $Print=''">
						<xsl:call-template name="IRS1040SRStyle" />
						<xsl:call-template name="AddOnStyle" />
					</xsl:if>
				</style>
				<xsl:call-template name="GlobalStylesForm" />
			</head>
			<body class="styBodyClass">
				<form id="Form1040SR" style="font-size:10pt;font-family:Arial;">
					
					<xsl:if test="$FormData/AmendedReturnInd='X'"><span style="padding-right:10mm; color:red; font-size:10pt;font-weight:bold;"> AMENDED RETURN </span></xsl:if>
					<xsl:if test="$FormData/SupersededReturnInd='X'"><span style="padding-right:10mm; color:red; font-size:10pt;font-weight:bold;"> SUPERSEDED</span></xsl:if>
				    <xsl:if test="$FormData/AddressChangeInd='X'"><span style="color:red; font-size:10pt;font-weight:bold;"> ADDRESS CHANGE </span></xsl:if>

					<xsl:call-template name="DocumentHeader" />
					
					<!-- ************* Header ************** -->		
					<div class="styStdDiv" style="height:11mm; border-bottom: 2px solid black">
						<div class="styGenericDiv" style="width:31.8mm;height:100%;padding-top:2px;">
							<span class="" style="margin-top:3mm;margin-left:-1mm;margin-right:-1mm;
								transform:rotate(270deg);float:left;font-family:Verdana;font-size:7pt;">Form</span>
							<span class="styFormNumber" style="margin-top:.5mm;font-family:Arial Narrow;">
								1040-SR</span>
						</div>
						<div class="styGenericDiv" style="width:56mm;padding-right:1mm;padding-top:1px;height:100%;">
							<span class="styAgency">Department of the Treasury&#8212;Internal Revenue
								Service</span>
							<span class="styMainTitle" style="font-family:Arial-Narrow;font-size:10pt">
							U.S. Income Tax Return for Seniors</span>
						</div>
						<div class="styTYBox" style="width:18mm;border-right-width:1px;height:100%;
							padding-top:2px;">
							<span class="styTaxYear">20<span class="styTYColor">25</span></span>
						</div>
						<div class="styOMB" style="width:28mm;height:100%;padding:17px 1mm 1mm 1mm;
							float:left;border-width:0px 1px 0px 0px;vertical-align:bottom;font-family:Verdana;
							font-size:7pt;">	OMB No. 1545-0074
						</div>
						<div class="styGenericDiv" style="width:52.5mm;height:100%;font-family:Arial-Narrow;
							font-size:6.5pt;padding:7px 0px 1mm 1mm;vertical-align:bottom;">
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$FormData"/>
							</xsl:call-template>
							<xsl:call-template name="LinkToLeftoverDataTableInline">
								<xsl:with-param name="Desc">Top Right Margin - Special Condition Description</xsl:with-param>
								<xsl:with-param name="TargetNode" select="$FormData/SpecialConditionDesc"/>
							</xsl:call-template>
							<xsl:call-template name="LinkToLeftoverDataTableInline">
								<xsl:with-param name="Desc">Top Right Margin - Special Processing Literal Code</xsl:with-param>
								<xsl:with-param name="TargetNode" select="$FormData/SpecialProcessingLiteralCd"/>
							</xsl:call-template>
							<xsl:call-template name="LinkToLeftoverDataTableInline">
								<xsl:with-param name="Desc">Top Right Margin - Combat Zone Code</xsl:with-param>
								<xsl:with-param name="TargetNode" select="$FormData/CombatZoneCd"/>
							</xsl:call-template>
							<xsl:call-template name="LinkToLeftoverDataTableInline">
								<xsl:with-param name="Desc">Top Right Margin - Combat Zone Date</xsl:with-param>
								<xsl:with-param name="TargetNode" select="$FormData/CombatZoneCd/@combatZoneDt"/>
							</xsl:call-template>
							<xsl:call-template name="LinkToLeftoverDataTableInline">
								<xsl:with-param name="Desc">Top Right Margin - Special Processing Code Text</xsl:with-param>
								<xsl:with-param name="TargetNode" select="$FormData/SpecialProcessingCodeTxt"/>
							</xsl:call-template>
							<xsl:call-template name="LinkToLeftoverCheckboxDataTableInline">
								<xsl:with-param name="Desc">Top Right Margin - Community Property Return Indicator</xsl:with-param>
								<xsl:with-param name="TargetNode" select="$FormData/CommPropStateRtnInd"/>
							</xsl:call-template>
							<xsl:call-template name="LinkToLeftoverCheckboxDataTableInline">
								<xsl:with-param name="Desc">Top Right Margin - Signed by Power Of Attorney Checkbox</xsl:with-param>
								<xsl:with-param name="TargetNode" select="$FormData/PowerOfAttorneySignedByInd"/>
							</xsl:call-template>
							<xsl:call-template name="LinkToLeftoverDataTableInline">
								<xsl:with-param name="Desc">Top Right Margin - Power Of Attorney Name</xsl:with-param>
								<xsl:with-param name="TargetNode" select="$FormData/PowerOfAttorneyNm"/>
							</xsl:call-template>
							<xsl:call-template name="LinkToLeftoverCheckboxDataTableInline">
								<xsl:with-param name="Desc">Top Right Margin - Surviving Spouse Indicator</xsl:with-param>
								<xsl:with-param name="TargetNode" select="$FormData/SurvivingSpouseInd"/>
							</xsl:call-template>
							<xsl:call-template name="LinkToLeftoverCheckboxDataTableInline">
								<xsl:with-param name="Desc">Top Right Margin - Personal Representative</xsl:with-param>
								<xsl:with-param name="TargetNode" select="$FormData/PersonalRepresentativeInd"/>
							</xsl:call-template>
							<xsl:call-template name="LinkToLeftoverDataTableInline">
								<xsl:with-param name="Desc">Top Right Margin - Non Paid Preparer Code</xsl:with-param>
								<xsl:with-param name="TargetNode" select="$FormData/NonPaidPreparerCd"/>
							</xsl:call-template>
							<xsl:call-template name="LinkToLeftoverDataTableInline">
								<xsl:with-param name="Desc">Top Right Margin - Refund Product Code</xsl:with-param>
								<xsl:with-param name="TargetNode" select="$FormData/RefundProductCd"/>
							</xsl:call-template>
							<xsl:call-template name="LinkToLeftoverDataTableInline">
								<xsl:with-param name="Desc">Top Right Margin - Refund Product Code Text</xsl:with-param>
								<xsl:with-param name="TargetNode" select="$FormData/RefundProductCodeTxt"/>
							</xsl:call-template>
							<xsl:call-template name="LinkToLeftoverDataTableInline">
								<xsl:with-param name="Desc">Top Right Margin - Filed Pursuant To Section 30191002 Code</xsl:with-param>
								<xsl:with-param name="TargetNode" 
									select="$FormData/FiledPursuantToSect30191002Cd"/>
							</xsl:call-template>
							<br/>
							IRS Use Only - Do not write or staple in this space.
						</div>
					</div>
					<!-- For the year section -->
					<div class="styStdDiv" style="height:6mm; border-bottom:1px solid black; font-family: verdana, arial, sans-serif; font-size:7pt">
						<div style="padding-top:1mm;">	
						For the year Jan. 1 – Dec. 31, 2025, or other tax year beginning 
						<span style="width:23mm;padding-left:3px;text-align:center;">
							<xsl:call-template name="PopulateReturnHeaderTaxPeriodBeginDate"/>
						</span>
						, ending
						<span style="width:23mm;padding-left:3px;text-align:center;">
							<xsl:call-template name="PopulateReturnHeaderTaxPeriodEndDate"/>
						</span>
						</div>
						<div style="height:100%; float:right; padding-top:1mm; padding-left:2mm; border-left: 1px solid black;">  
						See separate instructions.
						</div>
					</div>
					<!-- Filed pursuant to section 301.9100-2 -->
					<div class="styStdDiv" style="height:6mm;  border-bottom:1px solid black; ">
						<span style="display:inline;font-size:10px;">
							<xsl:call-template name="PopulateSpan">
								<xsl:with-param name="TargetNode" select="$FormData/FiledPursuantToSect30191002Ind"/>
							</xsl:call-template>
							<input type="checkbox" aria-label="filed pursuant to section 301.9100-2" class="styCkbox">
							<xsl:call-template name="PopulateCheckbox">
								<xsl:with-param name="TargetNode" select="$FormData/FiledPursuantToSect30191002Ind"/>
								<xsl:with-param name="BackupName">IRS1040FiledPursuantToSect30191002Ind</xsl:with-param>
							</xsl:call-template>
							</input>
							<label>
								<xsl:call-template name="PopulateLabel">
									<xsl:with-param name="TargetNode" select="$FormData/IndividualReturnFilingStatusCd"/>
									<xsl:with-param name="BackupName">IRS1040FiledPursuantToSect30191002Ind</xsl:with-param>
								</xsl:call-template>
							Filed pursuant to section 301.9100-2
							</label>
						</span>
						<!-- Combat Zone section -->
						<span style="display:inline;font-size:10px;">
							<xsl:call-template name="PopulateSpan">
								<xsl:with-param name="TargetNode" select="$FormData/CombatZoneDtl/CombatZoneInd"/>
							</xsl:call-template>
							<input type="checkbox" aria-label="Combat Zone" class="styCkbox">
							<xsl:call-template name="PopulateCheckbox">
								<xsl:with-param name="TargetNode" select="$FormData/CombatZoneDtl/CombatZoneInd"/>
								<xsl:with-param name="BackupName">IRS1040CombatZoneIndicator</xsl:with-param>
							</xsl:call-template>
							</input>
							<label>
								<xsl:call-template name="PopulateLabel">
									<xsl:with-param name="TargetNode" select="$FormData/CombatZoneDtl/CombatZoneInd"/>
									<xsl:with-param name="BackupName">IRS1040CombatZoneIndicator</xsl:with-param>
								</xsl:call-template>
							Combat Zone
							</label>
							
							<span style="width:45mm;font-size:9px;">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$FormData/CombatZoneDtl/CombatZoneLiteralCd"/>
									</xsl:call-template>
									<span style="width:1mm;"/>
									<xsl:call-template name="PopulateMonthDayYear">
										<xsl:with-param name="TargetNode" select="$FormData/CombatZoneDtl/CombatZoneCd/@combatZoneDt"/>
									</xsl:call-template>
							</span>
						</span>
							<!-- Primary Deceased checkbox -->
						<span style="display:inline;font-size:10px;">
							<xsl:call-template name="PopulateSpan">
								<xsl:with-param name="TargetNode" select="$FormData/DeceasedInd"/>
							</xsl:call-template>
							<input type="checkbox" aria-label="Deceased" class="styCkbox">
							<xsl:call-template name="PopulateCheckbox">
								<xsl:with-param name="TargetNode" select="$FormData/DeceasedInd"/>
								<xsl:with-param name="BackupName">IRS1040DeceasedInd</xsl:with-param>
							</xsl:call-template>
							</input>
							<label>
								<xsl:call-template name="PopulateLabel">
									<xsl:with-param name="TargetNode" select="$FormData/DeceasedInd"/>
									<xsl:with-param name="BackupName">IRS1040DeceasedInd</xsl:with-param>
								</xsl:call-template>
							Deceased
							</label>	
							<span style="width:1mm;"/>	
							<xsl:choose>
							  <xsl:when test="normalize-space($FormData/PrimaryDeathDt)">
								<xsl:call-template name="PopulateMonthDayYear">
								  <xsl:with-param name="TargetNode" select="$FormData/PrimaryDeathDt"/>
								</xsl:call-template>
							  </xsl:when>
							  <xsl:otherwise>
							  <span style="color:#888;">MM/DD/YYYY</span>
							  </xsl:otherwise>
							</xsl:choose>
						</span>
						<span style="width:1mm;"/>
							<!-- Spouse Deceased box -->
							<span style="display:inline;font-size:10px;">
							Spouse
							<span style="width:1mm;"/>	
							<xsl:choose>
							  <xsl:when test="normalize-space($FormData/SpouseDeathDt)">
								<xsl:call-template name="PopulateMonthDayYear">
								  <xsl:with-param name="TargetNode" select="$FormData/SpouseDeathDt"/>
								</xsl:call-template>
							  </xsl:when>
							  <xsl:otherwise>
							  <span style="color:#888;">MM/DD/YYYY</span>
							  </xsl:otherwise>
							</xsl:choose>
						</span>	
					</div>	
					<!-- Other section-->
					<div class="styStdDiv" style="height:6mm;  border-bottom:2px solid black; ">
						<span style="display:inline;font-size:10px;">
						<xsl:call-template name="PopulateSpan">
								<xsl:with-param name="TargetNode" select="$FormData/FiledPursuantToSect30191002Ind"/>
							</xsl:call-template>
							<input type="checkbox" aria-label="Other" class="styCkbox">
							<xsl:call-template name="PopulateCheckbox">
								<xsl:with-param name="TargetNode" select="$FormData/FiledPursuantToSect30191002Ind"/>
								<xsl:with-param name="BackupName">IRS1040FiledPursuantToSect30191002Ind</xsl:with-param>
							</xsl:call-template>
							</input>
							<label>
								<xsl:call-template name="PopulateLabel">
									<xsl:with-param name="TargetNode" select="$FormData/IndividualReturnFilingStatusCd"/>
									<xsl:with-param name="BackupName">IRS1040FiledPursuantToSect30191002Ind</xsl:with-param>
								</xsl:call-template>
							Other
							</label>
							<span style="width:2mm;"/>	
							<span style="width:25mm;">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/SpecialConditionTxt[1]"/>
							</xsl:call-template>
							</span>
							<span style="width:30mm;"/>	
							<span style="border-left:1px dashed black;">
							<span style="width:1mm;"/>
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/SpecialConditionTxt[2]"/>
							</xsl:call-template>
							</span>
							<span style="width:55mm;"/>
							<span style="border-left:1px dashed black;">
							<span style="width:1mm;"/>
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/SpecialConditionTxt[3]"/>
							</xsl:call-template>
							</span>
						</span>
					</div>
					<!-- Filer information section -->
					<div class="styStdDiv">
						<div class="styIRS1040SRHeaderCell" style="width:78mm;">
							Your first name and middle initial <br />
							<xsl:call-template name="PopulateReturnHeaderFiler">
								<xsl:with-param name="TargetNode">BusinessNameLine1Txt</xsl:with-param>
							</xsl:call-template>
							<span style="width:4px;"/>
							<xsl:call-template name="LinkToLeftoverDataTableInline">
								<xsl:with-param name="Desc">Header - Primary Name Control</xsl:with-param>
								<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/PrimaryNameControlTxt"/>
							</xsl:call-template>
							<xsl:call-template name="LinkToLeftoverDataTableInline">
								<xsl:with-param name="Desc">Header - In Care Of Name</xsl:with-param>
								<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/InCareOfNm"/>
							</xsl:call-template>
						</div>
						<div class="styIRS1040SRHeaderCell" style="width:63mm;">
							Last name <br /> &nbsp;
						</div>
						<div class="styIRS1040SRHeaderCell" style="width:46mm;border-right-width:0px;">
							<strong>Your social security number</strong><br />
							<xsl:call-template name="PopulateReturnHeaderFilerTIN">
								<xsl:with-param name="EINChanged" select="true()"/>
							</xsl:call-template>
						</div>
					</div>
					<div class="styStdDiv">
						<div class="styIRS1040SRHeaderCell" style="width:78mm;">
							If joint return, spouse's first name and middle initial <br /> 
							<xsl:call-template name="LinkToLeftoverDataTableInline">
								<xsl:with-param name="Desc">Header - Spouse Name Control</xsl:with-param>
								<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/SpouseNameControlTxt"/>
							</xsl:call-template>
							&nbsp;
						</div>
						<div class="styIRS1040SRHeaderCell" style="width:63mm;">
							Last name <br /> &nbsp;
						</div>
						<div class="styIRS1040SRHeaderCell" style="width:46mm;border-right-width:0px;">
							<strong>Spouse's social security number</strong><br />
							<xsl:call-template name="PopulateReturnHeaderFiler">
								<xsl:with-param name="TargetNode">SpouseSSN</xsl:with-param>
								<xsl:with-param name="EINChanged" select="true()"/>
							</xsl:call-template>
						</div>
					</div>
					<div class="styStdDiv">
						<div class="styIRS1040SRHeaderCell" style="width:129mm;height:12.5mm;">
							<span style="font-family:Arial;">Home address (number and street). If you have a P.O.
								box, see instructions.</span> <br /> 
							<xsl:call-template name="PopulateReturnHeaderFiler">
								<xsl:with-param name="TargetNode">AddressLine1Txt</xsl:with-param>
							</xsl:call-template>
							<br/>
							<xsl:call-template name="PopulateReturnHeaderFiler">
								<xsl:with-param name="TargetNode">AddressLine2Txt</xsl:with-param>
							</xsl:call-template>
							&nbsp;
						</div>
						<div class="styIRS1040SRHeaderCell" style="width:12mm;height:12.5mm;
							font-family:Arial;">Apt. no. <br /> &nbsp;
						</div>
						<div class="styIRS1040SRHeaderCell" style="width:45.9mm;height:14.5mm;border-right-width:0px;float:right;">
							<span style="font-size:10px;">Check here if your main home, and your spouse’s if filing a joint return, was in the U.S. for more than half of 2025.
								<input type="checkbox" class="styCkbox" style=""
									aria-label="You and your spouse in the U.S. for more than half of 2025">
									<xsl:call-template name="PopulateCheckbox">
										<xsl:with-param name="TargetNode" select="$FormData/PECFPrimaryInd"/>
										<xsl:with-param name="BackupName" select="IRS1040PECFPrimaryInd"/>
									</xsl:call-template>
								</input>
								<label>
									<xsl:call-template name="PopulateLabel">
										<xsl:with-param name="TargetNode" select="$FormData/PECFPrimaryInd"/>
										<xsl:with-param name="BackupName" select="IRS1040PECFPrimaryInd"/>
									</xsl:call-template>
								</label>
							</span>
						</div>
						<div class="styIRS1040SRHeaderCell" style="width:101mm;height:9mm;">
							<span style="font-family:Arial;font-size:10px;">City, town, or post office. If
								you have a foreign address, also complete spaces below.
							</span><br />
							<xsl:if test="$RtnHdrData/Filer/USAddress">
								<xsl:call-template name="PopulateReturnHeaderFiler">
									<xsl:with-param name="TargetNode">CityNm</xsl:with-param>
								</xsl:call-template>
							</xsl:if>
							<span style="width:1mm;"/>
							<xsl:if test="$RtnHdrData/Filer/ForeignAddress">
								<xsl:call-template name="PopulateReturnHeaderFiler">
									<xsl:with-param name="TargetNode">CityNm</xsl:with-param>
								</xsl:call-template>
							</xsl:if>
						</div>
						<div class="styIRS1040SRHeaderCell" style="width:20mm;height:9mm;">
							<span style="font-family:Arial Narrow;">State
							</span><br />
							<xsl:if test="$RtnHdrData/Filer/USAddress">
								<xsl:call-template name="PopulateReturnHeaderFiler">
									<xsl:with-param name="TargetNode">StateAbbreviationCd</xsl:with-param>
								</xsl:call-template>
							</xsl:if>
						</div>
						<div class="styIRS1040SRHeaderCell" style="width:20mm;height:9mm;">
							<span style="font-family:Arial Narrow;">ZIP code
							</span><br />
							<xsl:if test="$RtnHdrData/Filer/USAddress">
								<xsl:call-template name="PopulateReturnHeaderFiler">
									<xsl:with-param name="TargetNode">ZIPCd</xsl:with-param>
								</xsl:call-template>
							</xsl:if>
						</div>
						<div class="styIRS1040SRHeaderCell" style="width:45.9mm;height:17.5mm;
							border-right-width:0px;float:right;padding-top:1mm;">
							<strong>Presidential Election Campaign</strong><br />
							<span style="font-size:7pt;">Check here if you, or your spouse if
								filing jointly, want $3 to go to this fund. Checking a box below will not
								change your tax or refund. 
								<input type="checkbox" class="styCkboxNM" aria-label="PECF Primary You" style="">
									<xsl:call-template name="PopulateCheckbox">
										<xsl:with-param name="TargetNode" select="$FormData/PECFPrimaryInd"/>
										<xsl:with-param name="BackupName" select="IRS1040PECFPrimaryInd"/>
									</xsl:call-template>
								</input>
								<span style="width:4px;"/>
								<label>
									<xsl:call-template name="PopulateLabel">
										<xsl:with-param name="TargetNode" select="$FormData/PECFPrimaryInd"/>
										<xsl:with-param name="BackupName" select="IRS1040PECFPrimaryInd"/>
									</xsl:call-template>
									<b>You</b>
								</label>
								<span style="width:4px;"/>
								<input type="checkbox" class="styCkboxNM" aria-label="PECF Spouse"  >
									<xsl:call-template name="PopulateCheckbox">
										<xsl:with-param name="TargetNode" select="$FormData/PECFSpouseInd"/>
										<xsl:with-param name="BackupName" select="IRS1040PECFSpousend"/>
									</xsl:call-template>
								</input>
								<span style="width:4px;"/>
								<label>
									<xsl:call-template name="PopulateLabel">
										<xsl:with-param name="TargetNode" select="$FormData/PECFSpouseInd"/>
										<xsl:with-param name="BackupName" select="IRS1040PECFSpouseInd"/>
									</xsl:call-template>
									<b>Spouse</b>
								</label>
							</span>
						</div>
						<div class="styIRS1040SRHeaderCell" style="width:65mm;height:10.5mm;">
							<span style="font-family:Arial;">Foreign country name</span> <br /> 
							<xsl:call-template name="PopulateReturnHeaderFiler">
								<xsl:with-param name="TargetNode">CountryCd</xsl:with-param>
								<xsl:with-param name="MainForm" select="true()"/>
							</xsl:call-template>
							&nbsp;
						</div>
						<div class="styIRS1040SRHeaderCell" style="width:49mm;height:10.5mm;">
							<span style="font-family:Arial;">Foreign province/state/county</span> <br /> 
							<xsl:call-template name="PopulateReturnHeaderFiler">
								<xsl:with-param name="TargetNode">ProvinceOrStateNm</xsl:with-param>
							</xsl:call-template>
							&nbsp;
						</div>
						<div class="styIRS1040SRHeaderCell" style="width:27mm;height:10.5mm;
							font-family:Arial;">
							<span style="font-family:Arial;">Foreign postal code</span> <br /> 
							<xsl:call-template name="PopulateReturnHeaderFiler">
								<xsl:with-param name="TargetNode">ForeignPostalCd</xsl:with-param>
							</xsl:call-template>
							&nbsp;
						</div>
					</div>
					<!-- Filing status section -->
					<div class="styStdDiv" style="border-bottom:1px solid black;">
						<div style="width:20mm;height:16mm;padding-top:0.5mm;float:left;">
							<strong>Filing Status</strong><br />
							<span style="padding-top:1mm;font-size:7pt;">Check only <br />one box.</span>
						</div>
						<div style="width:83.5mm;min-height:4mm;padding-top:1.0mm;float:left;">
							<span style="display:inline;font-family:Arial;">
								<xsl:call-template name="PopulateSpan">
									<xsl:with-param name="TargetNode" select="$FormData/IndividualReturnFilingStatusCd"/>
								</xsl:call-template>
								<!-- 1 Single checkbox -->
								<input type="checkbox" class="styCkboxNM" aria-label="Single" style="margin-right:1mm;margin-bottom:0mm;">
									<xsl:call-template name="PopulateEnumeratedCheckbox">
										<xsl:with-param name="TargetNode" select="$FormData/IndividualReturnFilingStatusCd"/>
										<xsl:with-param name="DisplayedCheckboxValue" select="1"/>
										<xsl:with-param name="BackupName">IRS1040IndividualReturnFilingStatusCd[1]</xsl:with-param>
									</xsl:call-template>
								</input>
								<label>
									<xsl:call-template name="PopulateLabel">
										<xsl:with-param name="TargetNode" select="$FormData/IndividualReturnFilingStatusCd"/>
										<xsl:with-param name="DisplayedCheckboxValue" select="1"/>
										<xsl:with-param name="BackupName">IRS1040IndividualReturnFilingStatusCd[1]</xsl:with-param>
									</xsl:call-template>Single</label>
								<br/>
								<!-- 2 Married filing jointly (even if only one had income) checkbox -->
								<input type="checkbox" class="styCkboxNM" aria-label="Married filing jointly" style="margin-right:1mm;">
									<xsl:call-template name="PopulateEnumeratedCheckbox">
										<xsl:with-param name="TargetNode" select="$FormData/IndividualReturnFilingStatusCd"/>
										<xsl:with-param name="DisplayedCheckboxValue" select="2"/>
										<xsl:with-param name="BackupName">IRS1040IndividualReturnFilingStatusCd[2]</xsl:with-param>
									</xsl:call-template>
								</input>
								<label>
									<xsl:call-template name="PopulateLabel">
										<xsl:with-param name="TargetNode" select="$FormData/IndividualReturnFilingStatusCd"/>
										<xsl:with-param name="DisplayedCheckboxValue" select="2"/>
										<xsl:with-param name="BackupName">IRS1040IndividualReturnFilingStatusCd[2]</xsl:with-param>
									</xsl:call-template>Married filing jointly (even if only one had income) </label>
								<span style="width:0mm;"/>
									<!-- 3 Married filing separately (MFS) checkbox-->
								<span style="padding-left:0mm;width:70mm;">
								<input type="checkbox" class="styCkboxNM" aria-label="Married filing separately" style="margin-right:1mm;">
									<xsl:call-template name="PopulateEnumeratedCheckbox">
										<xsl:with-param name="TargetNode" select="$FormData/IndividualReturnFilingStatusCd"/>
										<xsl:with-param name="DisplayedCheckboxValue" select="3"/>
										<xsl:with-param name="BackupName">IRS1040IndividualReturnFilingStatusCd[3]</xsl:with-param>
									</xsl:call-template>
								</input>
								<label>
									<xsl:call-template name="PopulateLabel">
										<xsl:with-param name="TargetNode" select="$FormData/IndividualReturnFilingStatusCd"/>
										<xsl:with-param name="DisplayedCheckboxValue" select="3"/>
										<xsl:with-param name="BackupName">IRS1040IndividualReturnFilingStatusCd[3]</xsl:with-param>
									</xsl:call-template>Married filing separately (MFS). Enter 
									<span style="padding-left:4mm;">
									spouse’s SSN above and full name here:
									</span>
									</label>
									<span style="padding-left:4mm;">
									<span style="width:65mm;border-bottom:1px dashed black;">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$FormData/SpouseNm"/>
									</xsl:call-template>
									<xsl:if test="$FormData/SpouseNm"><span style="width:8px;"/></xsl:if>
									<span style="width:2mm;"/>
									<xsl:call-template name="PopulateReturnHeaderFiler">
										<xsl:with-param name="TargetNode">SpouseSSN</xsl:with-param>
										<xsl:with-param name="EINChanged" select="true()"/>
									</xsl:call-template>
									</span>
									</span>
							</span>
							</span>
							</div>
								<div style="width:83.5mm;min-height:4mm;padding-top:1.0mm;float:left;">
								<!-- 4 HOH checkbox -->
								<input type="checkbox" class="styCkboxNM" aria-label="Head of Household (HOH)" style="margin-right:1mm;">
									<xsl:call-template name="PopulateEnumeratedCheckbox">
										<xsl:with-param name="TargetNode" select="$FormData/IndividualReturnFilingStatusCd"/>
										<xsl:with-param name="DisplayedCheckboxValue" select="4"/>
										<xsl:with-param name="BackupName">IRS1040IndividualReturnFilingStatusCd[4]</xsl:with-param>
									</xsl:call-template>
								</input>
								<label>
									<xsl:call-template name="PopulateLabel">
										<xsl:with-param name="TargetNode" select="$FormData/IndividualReturnFilingStatusCd"/>
										<xsl:with-param name="DisplayedCheckboxValue" select="4"/>
										<xsl:with-param name="BackupName">IRS1040IndividualReturnFilingStatusCd[4]</xsl:with-param>
									</xsl:call-template>Head of Household (HOH)</label>
								<br/>
								
								<!-- 5 Qualifying surviving spouse (QSS) checkbox -->
								<input type="checkbox" class="styCkboxNM" aria-label="Qualifying surviving spouse (QSS)" style="margin-right:1mm;">
									<xsl:call-template name="PopulateEnumeratedCheckbox">
										<xsl:with-param name="TargetNode" select="$FormData/IndividualReturnFilingStatusCd"/>
										<xsl:with-param name="DisplayedCheckboxValue" select="5"/>
										<xsl:with-param name="BackupName">IRS1040IndividualReturnFilingStatusCd[5]</xsl:with-param>
									</xsl:call-template>
								</input>
								<label>
									<xsl:call-template name="PopulateLabel">
										<xsl:with-param name="TargetNode" select="$FormData/IndividualReturnFilingStatusCd"/>
										<xsl:with-param name="DisplayedCheckboxValue" select="5"/>
										<xsl:with-param name="BackupName">IRS1040IndividualReturnFilingStatusCd[5]</xsl:with-param>
									</xsl:call-template>Qualifying surviving spouse (QSS)<br/>
									<span style="padding-left:4.5mm;">If you checked the HOH or QSS box, enter the child's name if the qualifying person is a child but not your dependent:
									</span>
									<br/>
							<span style="width:4.5mm;"/>
							<span style="width:70mm;border-bottom:1px dashed black;">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/SpouseNm"/>
							</xsl:call-template>
							<xsl:if test="$FormData/SpouseNm"><span style="width:8px;"/></xsl:if>
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/NRALiteralCd"/>
							</xsl:call-template>
							<xsl:if test="$FormData/NRALiteralCd"><span style="width:8px;"/></xsl:if>
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/QualifyingHOHNm"/>
							</xsl:call-template>
							<xsl:call-template name="LinkToLeftoverDataTableInline">
								<xsl:with-param name="Desc">Filing Status - Qualifying HOH SSN</xsl:with-param>
								<xsl:with-param name="TargetNode" select="$FormData/QualifyingHOHSSN"/>
							</xsl:call-template>
							<xsl:if test="$FormData/QualifyingHOHNm or $FormData/QualifyingHOHSSN"><span style="width:8px;"/></xsl:if>
							<xsl:if test="$FormData/QualifyingPersonName">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$FormData/QualifyingPersonName/PersonFirstNm"/>
								</xsl:call-template>
								<span style="width:4px;"/>
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$FormData/QualifyingPersonName/PersonLastNm"/>
								</xsl:call-template>
							</xsl:if>
							<xsl:call-template name="LinkToLeftoverDataTableInline">
								<xsl:with-param name="Desc">Filing Status - Qualifying Person SSN</xsl:with-param>
								<xsl:with-param name="TargetNode" select="$FormData/QualifyingPersonSSN"/>
							</xsl:call-template>
							</span>
							</label>
							</div>
							<!-- Nonresident alien spouse treated as resident -->
							<div style="width:167mm;padding-left:22mm;">
							
							<input type="checkbox" class="styCkboxNM" aria-label="treating nonresident alien or dual status">
									<xsl:call-template name="PopulateCheckbox">
										<xsl:with-param name="TargetNode" select="$FormData/NRASpouseTreatedAsResidentGrp/NRASpouseTreatedAsResidentInd"/>
										<xsl:with-param name="BackupName" select="NRASpouseTreatedAsResidentInd"/>
									</xsl:call-template>
							</input>
							If treating a nonresident alien or dual-status alien spouse as a U.S. resident for the entire tax year, 
							check the box and enter their name (see instructions and attach statement if required): 
							<xsl:call-template name="PopulateText">
							<xsl:with-param name="TargetNode" select="$FormData/NRASpouseTreatedAsResidentGrp/SpouseNm">
							</xsl:with-param>
							</xsl:call-template>							
							</div>
						</div>
					<!--/div-->
					<!-- Digital Assets -->
					<div style="width:187mm;height:10mm;border-bottom:1px solid black">	
					<div style="width:20mm; height:10mm;padding-top:1.25mm;float:left;">
						<strong>Digital<br/>Assets</strong>
					</div>
					<div class="styIRS1040HeaderCell" style="height:10mm;width:167mm;font-size:8pt;padding-top:1.25mm;
						 padding-left:0mm;border-width:0;">
							At any time during 2025, did you: (a) receive (as a reward, award, or payment for property or services); or (b) sell,
							exchange, or otherwise dispose of a digital asset (or a financial interest in a digital asset)? (See instructions.)						 
							<span class="sty1040SRDotLn" style="float:none;">.....</span>						 
							<span style="float:right;">							
							<span style="font-size:7.5pt;">
							<span>
							<xsl:call-template name="PopulateSpan">
								<xsl:with-param name="TargetNode" select="$FormData/VirtualCurAcquiredDurTYInd"/>
							</xsl:call-template>
								<input type="checkbox" class="styCkbox" aria-label="digital asset Yes">
									<xsl:call-template name="PopulateYesCheckbox">
									 <xsl:with-param name="TargetNode" select="$FormData/VirtualCurAcquiredDurTYInd"/>
									 <xsl:with-param name="BackupName" select="IRS1040VirtualCurAcquiredDurTYInd"/>
									</xsl:call-template>
								</input>
							</span>
								<span style="width:2px;"/>
								<label>
									<xsl:call-template name="PopulateLabelYes">
									 <xsl:with-param name="TargetNode" select="$FormData/VirtualCurAcquiredDurTYInd"/>
									 <xsl:with-param name="BackupName" select="IRS1040VirtualCurAcquiredDurTYInd"/>
									</xsl:call-template>
									<b>Yes</b>
								</label>
								<span style="width:10px;"/>
							<span>
							<xsl:call-template name="PopulateSpan">
								<xsl:with-param name="TargetNode" select="$FormData/VirtualCurAcquiredDurTYInd"/>
							</xsl:call-template>
								<input type="checkbox" class="styCkbox" aria-label="digital asset No">
									<xsl:call-template name="PopulateNoCheckbox">
									 <xsl:with-param name="TargetNode" select="$FormData/VirtualCurAcquiredDurTYInd"/>
									 <xsl:with-param name="BackupName" select="IRS1040VirtualCurAcquiredDurTYInd"/>
									</xsl:call-template>
								</input>
							</span>
								<span style="width:4px;"/>
								<label>
									<xsl:call-template name="PopulateLabelNo">
									 <xsl:with-param name="TargetNode" select="$FormData/VirtualCurAcquiredDurTYInd"/>
									 <xsl:with-param name="BackupName" select="IRS1040VirtualCurAcquiredDurTYInd"/>
									</xsl:call-template>
									<b>No</b>
								</label>
								</span>
								</span>
						</div>
					</div>					
					<!-- Dependents area -->
					<div class="sty1040SRDepdContainer" style="display:block; overflow:visible;width:187mm;height:50mm;">
					<div class="styGenericDiv" style="width:20mm;padding-top:1mm;
							font-family:Arial;font-size:9pt;border-bottom:0px solid black;height:12mm">
							<div style="width:100%;padding-bottom:3mm;padding-left:1mm;">
								<strong>Dependents</strong><br />
								<span style="font-size:8pt;font-family:Arial Narrow">(see instructions)
									<br/><br/>If more than four dependents, see instructions and check here
						  			<label>
										<xsl:call-template name="PopulateLabel">
											<xsl:with-param name="TargetNode" select="$FormData/MoreDependentsInd"/>
											<xsl:with-param name="BackupName">IRS1040SRMoreDependentsInd
										    </xsl:with-param>
										</xsl:call-template>
						    		</label>
						    		<span style="width:2px"/>
									<input type="checkbox" class="styCkboxNM" style="" aria-label="more than four dependents">
										<xsl:call-template name="PopulateCheckbox">
											<xsl:with-param name="TargetNode" select="$FormData/MoreDependentsInd"/>
											<xsl:with-param name="BackupName">IRS1040SRMoreDependentsInd
											</xsl:with-param>
									   </xsl:call-template>
									</input>
								</span>
							</div>
						</div>
						<!-- (Dependent Table) ///////////////////////////////////////////////-->
						<div class="sty1040SRDepdContainer2" style="width:167mm;margin-left:0mm;height:67mm;">
							<div id="DependentDetailDiv" class="styTableContainerNBB" style="width:100%;border-top-width:0px;">
								<!--<xsl:call-template name="SetInitialState"/>-->
								<xsl:variable name="DependentDetailCount" select="count($FormData/DependentDetail)" />
								<table class="styTable" style="width:100%;display:table;border-width-top:1px;" cellspacing="0">
									<thead>
										<tr>
										  <td class="styIRS1040SRTableCell" scope="colgroup" style="width:12%;">
										  <xsl:call-template name="LinkToLeftoverDataTableInline">
											<xsl:with-param name="Desc">Dependents - Children Who Lived You Count</xsl:with-param>
												<xsl:with-param name="TargetNode" select="$FormData/ChldWhoLivedWithYouCnt"/>
																		</xsl:call-template>
																		<xsl:call-template name="LinkToLeftoverDataTableInline">
											<xsl:with-param name="Desc">Dependents - Other Dependents Listed Count</xsl:with-param>
												<xsl:with-param name="TargetNode" select="$FormData/OtherDependentsListedCnt"/>
																		</xsl:call-template>
																		<xsl:call-template name="LinkToLeftoverDataTableInline">
											<xsl:with-param name="Desc">Dependents - Total Exemptions Count</xsl:with-param>
												<xsl:with-param name="TargetNode" select="$FormData/TotalExemptionsCnt"/>
												</xsl:call-template></td>
										  <th class="styIRS1040SRTableCell" scope="colgroup" style="width:22%;text-align:center;"><strong>Dependent 1</strong></th>
										  <th class="styIRS1040SRTableCell" scope="colgroup" style="width:22%;text-align:center;"><strong>Dependent 2</strong></th>
										  <th class="styIRS1040SRTableCell" scope="colgroup" style="width:22%;text-align:center;"><strong>Dependent 3</strong></th>
										  <th class="styIRS1040SRTableCell" scope="colgroup" style="width:22%;text-align:center;border-right-width:0px;"><strong>Dependent 4</strong></th>
										</tr>
									</thead>
									<tbody>
										<xsl:choose>
										   <xsl:when test="$DependentDetailCount = 0 or $DependentDetailCount &gt; 4 or $Print = $Separated">
											<tr>
											  <th class="styIRS1040SRTableCell" style="text-align:left;" scope="row"><strong>(1)</strong><span style="padding-left:1mm;font-weight:normal;text-align:left;">First Name</span></th>
											   <td class="styIRS1040SRTableCell" style="text-align:center;">
												<xsl:if test="$DependentDetailCount &gt; 4 or $Print = $Separated">
												  <span>See Additional Data Table</span>
												</xsl:if>
											  </td>
											  <td class="styIRS1040SRTableCell"></td>
											  <td class="styIRS1040SRTableCell"></td>
											  <td class="styIRS1040SRTableCell" style="border-right-width:0px;"></td>
											</tr>
											<tr>
											  <th class="styIRS1040SRTableCell" style="text-align:left;" scope="row"><strong>(2)</strong><span style="padding-left:1mm;font-weight:normal;text-align:left;">Last Name</span></th>
											  <td class="styIRS1040SRTableCell"></td>
											  <td class="styIRS1040SRTableCell"></td>
											  <td class="styIRS1040SRTableCell"></td>
											  <td class="styIRS1040SRTableCell" style="border-right-width:0px;"></td>
											</tr>
											<tr>
											  <th class="styIRS1040SRTableCell" style="text-align:left;" scope="row"><strong>(3)</strong><span style="padding-left:1mm;font-weight:normal;text-align:left;">SSN</span></th>
											  <td class="styIRS1040SRTableCell"></td>
											  <td class="styIRS1040SRTableCell"></td>
											  <td class="styIRS1040SRTableCell"></td>
											  <td class="styIRS1040SRTableCell" style="border-right-width:0px;"></td>
											</tr>
											<tr>
											  <th class="styIRS1040SRTableCell" style="text-align:left;" scope="row"><strong>(4)</strong><span style="padding-left:1mm;font-weight:normal;text-align:left;">Relationship</span></th>
											  <td class="styIRS1040SRTableCell"></td>
											  <td class="styIRS1040SRTableCell"></td>
											  <td class="styIRS1040SRTableCell"></td>
											  <td class="styIRS1040SRTableCell" style="border-right-width:0px;"></td>
											</tr>
											<tr>
											  <th class="styIRS1040SRTableCell" style="text-align:left;" scope="row"><strong style="vertical-align:top;">(5)</strong><span style="padding-left:1mm;font-weight:normal;text-align:left;font-size:7px;">Check if lived <br/> you more than <br/>half of 2025</span></th>
											  <td class="styIRS1040SRTableCell" style="text-align:center;">
												<strong>(a)</strong>
												<input type="checkbox" aria-label="Live With Dependent 1 Over Half Year Yes"/>Yes<br/>
												<strong>(b)</strong>
												<input type="checkbox" aria-label="Dependent 1 in the U.S."/>And in the U.S.
											  </td>
											  <td class="styIRS1040SRTableCell" style="text-align:center;">
												<strong>(a)</strong>
												<input type="checkbox" aria-label="Live With Dependent 2 Over Half Year Yes"/>Yes<br/>
												<strong>(b)</strong>
												<input type="checkbox" aria-label="Dependent 2 in the U.S."/>And in the U.S.
											  </td>
											  <td class="styIRS1040SRTableCell" style="text-align:center;">
											  <strong>(a)</strong>
												<input type="checkbox" aria-label="Live With Dependent 3 Over Half Year Yes"/>Yes<br/>
												<strong>(b)</strong>
												<input type="checkbox" aria-label="Dependent 3 in the U.S."/>And in the U.S.
											  </td>
											  <td class="styIRS1040SRTableCell" style="text-align:center;border-right-width:0px;">
											  <strong>(a)</strong>
												<input type="checkbox" aria-label="Live With Dependent 4 Over Half Year Yes"/>Yes<br/>
												<strong>(b)</strong>
												<input type="checkbox" aria-label="Dependent 4 in the U.S."/>And in the U.S.
											  </td>
											</tr>
											<tr>
											    <th class="styIRS1040SRTableCell" style="text-align:left;" scope="row"><strong>(6)</strong><span style="padding-left:1mm;font-weight:normal;text-align:left;">Check if</span></th>
											 <td class="styIRS1040SRTableCell" style="height:9mm;text-align:center;border-bottom-width:1px;">
											 <div style="width:49%;height:inherit;float:left;border-right:1px solid black;border-bottom-width:1px;">
												  <div style="width:30%;height:100%;"><input type="checkbox" class="styCkbox" aria-label="Dependent 1 is a Full-time student"/></div>
												  <div style="width:65%;height:100%;padding-top:0.5mm;">Full-time student</div>
											 </div>
											 <div style="width:51%;height:inherit;float:right;">
												  <div style="width:22%;height:100%;"><input type="checkbox" class="styCkbox" aria-label="Dependent 1 is Permanently and totally disabled"/></div>
												  <div style="width:70%;height:100%;padding-top:0.5mm;">Permanently and totally disabled</div>
											  </div>
											 </td>
											 <td class="styIRS1040SRTableCell" style="height:9mm;text-align:center;border-bottom-width:1px;">
												<div style="width:49%;height:inherit;float:left;border-right:1px solid black;">
												  <div style="width:30%;height:100%;"><input type="checkbox" class="styCkbox" aria-label="Dependent 2 is a Full-time student"/></div>
												  <div style="width:65%;height:100%;padding-top:0.5mm;">Full-time student</div>
												</div>
												<div style="width:51%;height:inherit;float:right;">
												  <div style="width:22%;height:100%;"><input type="checkbox" class="styCkbox" aria-label="Dependent 2 is Permanently and totally disabled"/></div>
												  <div style="width:70%;height:100%;padding-top:0.5mm;">Permanently and totally disabled</div>
												</div>
											  </td>
											  <td class="styIRS1040SRTableCell" style="height:9mm;text-align:center;border-bottom-width:1px;">
												<div style="width:49%;height:inherit;float:left;border-right:1px solid black;">
												  <div style="width:30%;height:100%;"><input type="checkbox" class="styCkbox" aria-label="Dependent 3 is a Full-time student"/></div>
												  <div style="width:65%;height:100%;padding-top:0.5mm;">Full-time student</div>
												</div>
												<div style="width:51%;height:inherit;float:right;">
												  <div style="width:22%;height:100%;"><input type="checkbox" class="styCkbox" aria-label="Dependent 3 is Permanently and totally disabled"/></div>
												  <div style="width:70%;height:100%;padding-top:0.5mm;">Permanently and totally disabled</div>
												</div>
											  </td>
											  <td class="styIRS1040SRTableCell" style="height:9mm;text-align:center;border-bottom-width:1px;border-right-width:0px;">
												<div style="width:49%;height:inherit;float:left;border-right:1px solid black;">
												  <div style="width:30%;height:100%;"><input type="checkbox" class="styCkbox" aria-label="Dependent 4 is a Full-time student"/></div>
												  <div style="width:65%;height:100%;padding-top:0.5mm;">Full-time student</div>
												</div>
												<div style="width:51%;height:inherit;float:right;">
												  <div style="width:22%;height:100%;"><input type="checkbox" class="styCkbox" aria-label="Dependent 4 is Permanently and totally disabled"/></div>
												  <div style="width:70%;height:100%;padding-top:0.5mm;">Permanently and totally disabled</div>
												</div>
												</td>
											</tr>
											<tr>
											  <th class="styIRS1040SRTableCell" style="text-align:left;" scope="row"><strong>(7)</strong><span style="padding-left:1mm;font-weight:normal;text-align:left;">Credits</span></th>
											  <td class="styIRS1040SRTableCell" style="height:9mm;text-align:center;">
											   <div style="width:49%;height:inherit;float:left;border-right:1px solid black;border-bottom-width:1px;">
												  <div style="width:30%;height:100%;"><input type="checkbox" class="styCkbox" aria-label="Dependent 1 CTC Eligable"/></div>
												  <div style="width:65%;height:100%;padding-top:0.5mm;">Child tax credit</div>
												</div>
												<div style="width:51%;height:inherit;float:right;">
												  <div style="width:22%;height:100%;"><input type="checkbox" class="styCkbox" aria-label="Dependent 1 CFOD Eligable"/></div>
												  <div style="width:70%;height:100%;padding-top:0.5mm;">Credit for other dependents</div>
												</div>
											  </td>
											  <td class="styIRS1040SRTableCell" style="height:9mm;text-align:center;">
												<div style="width:49%;height:inherit;float:left;border-right:1px solid black;">
												  <div style="width:30%;height:100%;"><input type="checkbox" class="styCkbox" aria-label="Dependent 2 CTC Eligable"/></div>
												  <div style="width:65%;height:100%;padding-top:0.5mm;">Child tax credit</div>
												</div>
												<div style="width:51%;height:inherit;float:right;">
												  <div style="width:22%;height:100%;"><input type="checkbox" class="styCkbox" aria-label="Dependent 2 CFOD Eligable"/></div>
												  <div style="width:70%;height:100%;padding-top:0.5mm;">Credit for other dependents</div>
												</div>
											  </td>
											  <td class="styIRS1040SRTableCell" style="height:9mm;text-align:center;">
												<div style="width:49%;height:inherit;float:left;border-right:1px solid black;">
												  <div style="width:30%;height:100%;"><input type="checkbox" class="styCkbox" aria-label="Dependent 3 CTC Eligable"/></div>
												  <div style="width:65%;height:100%;padding-top:0.5mm;">Child tax credit</div>
												</div>
												<div style="width:51%;height:inherit;float:right;">
												  <div style="width:22%;height:100%;"><input type="checkbox" class="styCkbox" aria-label="Dependent 3 CFOD Eligable"/></div>
												  <div style="width:70%;height:100%;padding-top:0.5mm;">Credit for other dependents</div>
												</div>
											  </td>
											  <td class="styIRS1040SRTableCell" style="height:9mm;text-align:center;border-right-width:0px;">
												<div style="width:49%;height:inherit;float:left;border-right:1px solid black;">
												  <div style="width:30%;height:100%;"><input type="checkbox" class="styCkbox" aria-label="Dependent 4 CTC Eligable"/></div>
												  <div style="width:65%;height:100%;padding-top:0.5mm;">Child tax credit</div>
												</div>
												<div style="width:51%;height:inherit;float:right;">
												  <div style="width:22%;height:100%;"><input type="checkbox" class="styCkbox" aria-label="Dependent 4 CFOD Eligable"/></div>
												  <div style="width:70%;height:100%;padding-top:0.5mm;">Credit for other dependents</div>
												</div>
												</td>
											</tr>											
											<!--<xsl:call-template name="QualifyingChildrenTableRows_1040SS">
											  <xsl:with-param name="Empty">true</xsl:with-param>
											</xsl:call-template>-->
										  </xsl:when>
										  <xsl:when test="$DependentDetailCount &lt;=4">
											<!-- First Name row -->
											<tr>
											  <th class="styIRS1040SRTableCell" style="text-align:left;" scope="row"><strong>(1)</strong><span style="padding-left:1mm;font-weight:normal;text-align:left;">First Name</span>
											  </th>
											  <xsl:for-each select="$FormData/DependentDetail">
												<td class="styIRS1040SRTableCell" style="text-align:center;">
												  <xsl:if test="position() = last() and $DependentDetailCount = 4">
													<xsl:attribute name="style">text-align:center;border-right-width:0px;</xsl:attribute>
												  </xsl:if>
												  <xsl:value-of select="DependentFirstNm"/>
												</td>
											  </xsl:for-each>
											  <xsl:if test="$DependentDetailCount &lt; 4">
												<xsl:choose>
												  <xsl:when test="$DependentDetailCount = 3">
													<td class="styIRS1040SRTableCell" style="border-right-width:0px;"></td>
												  </xsl:when>
												  <xsl:when test="$DependentDetailCount = 2">
													<td class="styIRS1040SRTableCell" ></td>
													<td class="styIRS1040SRTableCell" style="border-right-width:0px;"></td>
												  </xsl:when>
												  <xsl:when test="$DependentDetailCount = 1">
													<td class="styIRS1040SRTableCell" ></td>
													<td class="styIRS1040SRTableCell" ></td>
													<td class="styIRS1040SRTableCell" style="border-right-width:0px;"></td>
												  </xsl:when>
												</xsl:choose>
											  </xsl:if>
											</tr>
											<!-- Last Name row -->
											<tr>
											  <th class="styIRS1040SRTableCell" style="text-align:left;" scope="row"><strong>(2)</strong><span style="padding-left:1mm;font-weight:normal;text-align:left;">Last Name</span></th>
											  <xsl:for-each select="$FormData/DependentDetail">
												<td class="styIRS1040SRTableCell" style="text-align:center;">
													 <xsl:if test="position() = last() and $DependentDetailCount = 4">
													<xsl:attribute name="style">text-align:center;border-right-width:0px;</xsl:attribute>
												  </xsl:if>
												  <xsl:value-of select="DependentLastNm"/>
												  <span style="padding-left:2mm"/>
												  <xsl:value-of select="DependentNameControlTxt"/>
												  <span style="float:right;">
													  <xsl:call-template name="LinkToLeftoverDataTableInline">
														<xsl:with-param name="Desc">Dependent <xsl:number value="position()"/> Name Control</xsl:with-param>
														<xsl:with-param name="TargetNode" select="DependentNameControlTxt"/>
													</xsl:call-template></span>
												</td>
											  </xsl:for-each>
											  <xsl:if test="$DependentDetailCount &lt; 4">
												<xsl:choose>
												  <xsl:when test="$DependentDetailCount = 3">
													<td class="styIRS1040SRTableCell" style="border-right-width:0px;"></td>
												  </xsl:when>
												  <xsl:when test="$DependentDetailCount = 2">
													<td class="styIRS1040SRTableCell" ></td>
													<td class="styIRS1040SRTableCell" style="border-right-width:0px;"></td>
												  </xsl:when>
												  <xsl:when test="$DependentDetailCount = 1">
													<td class="styIRS1040SRTableCell" ></td>
													<td class="styIRS1040SRTableCell" ></td>
													<td class="styIRS1040SRTableCell" style="border-right-width:0px;"></td>
												  </xsl:when>
												</xsl:choose>
											  </xsl:if>
											</tr>
											<!-- SSN row -->
											<tr>
											  <th class="styIRS1040SRTableCell" style="text-align:left;" scope="row"><strong>(3)</strong><span style="padding-left:1mm;font-weight:normal;text-align:left;">SSN</span></th>
											  <xsl:for-each select="$FormData/DependentDetail">
												<td class="styIRS1040SRTableCell" style="text-align:center;">
												  <xsl:if test="position() = last() and $DependentDetailCount = 4">
													<xsl:attribute name="style">text-align:center;border-right-width:0px;</xsl:attribute>
												  </xsl:if>
												  <xsl:choose>
													<xsl:when test="(DependentSSN or DependentSSN != '')">
													  <xsl:call-template name="PopulateSSN">
														<xsl:with-param name="TargetNode" select="DependentSSN"/>
													  </xsl:call-template>
													</xsl:when>
													<xsl:otherwise>
													  <xsl:value-of select="DiedLiteralCd"/>
													</xsl:otherwise>
												  </xsl:choose>
												</td>
											  </xsl:for-each>
											  <xsl:if test="$DependentDetailCount &lt; 4">
												<xsl:choose>
												  <xsl:when test="$DependentDetailCount = 3">
													<td class="styIRS1040SRTableCell" style="border-right-width:0px;"></td>
												  </xsl:when>
												  <xsl:when test="$DependentDetailCount = 2">
													<td class="styIRS1040SRTableCell"></td>
													<td class="styIRS1040SRTableCell" style="border-right-width:0px;"></td>
												  </xsl:when>
												  <xsl:when test="$DependentDetailCount = 1">
													<td class="styIRS1040SRTableCell"></td>
													<td class="styIRS1040SRTableCell"></td>
													<td class="styIRS1040SRTableCell" style="border-right-width:0px;"></td>
												  </xsl:when>
												</xsl:choose>
											  </xsl:if>
											</tr>
											<!-- Relationship block -->
											<tr>
											  <th class="styIRS1040SRTableCell" style="text-align:left;" scope="row"><strong>(4)</strong><span style="padding-left:1mm;font-weight:normal;text-align:left;">Relationship</span></th>
											  <xsl:for-each select="$FormData/DependentDetail">
												<td class="styIRS1040SRTableCell" style="text-align:center;">
												   <xsl:if test="position() = last() and $DependentDetailCount = 4">
													<xsl:attribute name="style">text-align:center;border-right-width:0px;</xsl:attribute>
												  </xsl:if>
												  <xsl:value-of select="DependentRelationshipCd"/>
												</td>
											  </xsl:for-each>
											  <xsl:if test="$DependentDetailCount &lt; 4">
												<xsl:choose>
												  <xsl:when test="$DependentDetailCount = 3">
													<td class="styIRS1040SRTableCell" style="border-right-width:0px;"></td>
												  </xsl:when>
												  <xsl:when test="$DependentDetailCount = 2">
													<td class="styIRS1040SRTableCell"></td>
													<td class="styIRS1040SRTableCell" style="border-right-width:0px;"></td>
												  </xsl:when>
												  <xsl:when test="$DependentDetailCount = 1">
													<td class="styIRS1040SRTableCell"></td>
													<td class="styIRS1040SRTableCell"></td>
													<td class="styIRS1040SRTableCell" style="border-right-width:0px;"></td>
												  </xsl:when>
												</xsl:choose>
											  </xsl:if>
											</tr> 
										 <!-- Check if lived with you more than half of 2025 block -->
											<tr>
											  <th class="styIRS1040SRTableCell" style="text-align:left;" scope="row"><strong>(5)</strong><span style="padding-left:0mm;font-weight:normal;text-align:left;font-size:7.5px;">Check if lived</span><br/><span style="font-weight:normal;text-align:left;font-size:7.5px;">with you more than half of 2025</span></th>
											  <xsl:for-each select="$FormData/DependentDetail">
												<td class="styIRS1040SRTableCell" style="text-align:center;">
												  <xsl:if test="position() = last() and $DependentDetailCount = 4">
													<xsl:attribute name="style">text-align:center;border-right-width:0px;</xsl:attribute>
												  </xsl:if>
												  <span style="width:2mm;"/>
												  <!-- 1 Yes checkbox -->
												  <span style="float:left;">
												  <strong>(a)</strong>
													 <input type="checkbox" class="styCkbox">
														<xsl:attribute name="aria-label">Live With Dependent <xsl:value-of select="position()"/> Over Half Year yes"</xsl:attribute>
														<xsl:call-template name="PopulateCheckbox">
														  <xsl:with-param name="TargetNode" select="YesLiveWithChildOverHalfYrInd"/>
														  <xsl:with-param name="BackupName">IRS1040SRYesLiveWithChildOverHalfYrInd</xsl:with-param>
														</xsl:call-template>
														Yes
													  </input>
													  </span>	
													<br/>
													<!-- 2 And in the US checkbox -->
													<span style="float:left;padding-right:10mm;">
												  <strong>(b)</strong>
												   <input type="checkbox" class="styCkbox">
														<xsl:attribute name="aria-label">Dependent <xsl:value-of select="position()"/> Lived in the US"</xsl:attribute>
														<xsl:call-template name="PopulateCheckbox">
														  <xsl:with-param name="TargetNode" select="YesLiveWithChldUSOvrHalfYrInd"/>
														  <xsl:with-param name="BackupName">IRS1040SRCTCInd</xsl:with-param>
														</xsl:call-template>
														And in the U.S.
													  </input>
													  </span>																								
												</td>
											  </xsl:for-each>
											  <xsl:if test="$DependentDetailCount &lt; 4">
												<xsl:choose>
												  <xsl:when test="$DependentDetailCount = 3">
													<td class="styIRS1040SRTableCell" style="border-right-width:0px;">
													<strong>(a)</strong>
													<input type="checkbox" aria-label="Live With Dependent 4 Over Half Year yes"/>Yes<br/>
													<strong>(b)</strong>
													<input type="checkbox" aria-label="Dependent 4 in the U.S."/>And in the U.S.</td>
												  </xsl:when>
												  <xsl:when test="$DependentDetailCount = 2">
													<td class="styIRS1040SRTableCell">
													<strong>(a)</strong>
													<input type="checkbox" aria-label="Live With Dependent 3 Over Half Year yes"/>Yes<br/>
													<strong>(b)</strong>
													<input type="checkbox" aria-label="Dependent 3 in the U.S."/>And in the U.S.</td>
													<td class="styIRS1040SRTableCell" style="border-right-width:0px;">
													<strong>(a)</strong>
													<input type="checkbox" aria-label="Live With Dependent 4 Over Half Year yes"/>Yes<br/>
													<strong>(b)</strong>
													<input type="checkbox" aria-label="Dependent 4 in the U.S."/>And in the U.S.</td>
												  </xsl:when>
												  <xsl:when test="$DependentDetailCount = 1">
													<td class="styIRS1040SRTableCell">
													<strong>(a)</strong>
													<input type="checkbox" aria-label="Live With Dependent 2 Over Half Year yes"/>Yes<br/>
													<strong>(b)</strong>
													<input type="checkbox" aria-label="Dependent 2 in the U.S."/>And in the U.S.</td>
													<td class="styIRS1040SRTableCell">
													<strong>(a)</strong>
													<input type="checkbox" aria-label="Live With Dependent 3 Over Half Year yes"/>Yes<br/>
													<strong>(b)</strong>
													<input type="checkbox" aria-label="Dependent 3 in the U.S."/>And in the U.S.</td>
													<td class="styIRS1040SRTableCell" style="border-right-width:0px;">
													<strong>(a)</strong>
													<input type="checkbox" aria-label="Live With Dependent 4 Over Half Year yes"/>Yes<br/>
													<strong>(b)</strong>
													<input type="checkbox" aria-label="Dependent 4 in the U.S."/>And in the U.S.</td>
												  </xsl:when>
												</xsl:choose>
											  </xsl:if>
											</tr> 
										 <!-- Check if full time student & disabled -->
											<tr>
											  <th class="styIRS1040SRTableCell" style="text-align:left;" scope="row">
											  <strong>(6)</strong>
											  <span style="padding-left:1mm;font-weight:normal;text-align:middle;">Check if</span></th>
											    <xsl:for-each select="$FormData/DependentDetail">
													<td class="styIRS1040SRTableCell" style="text-align:center;height=9mm;">
													<xsl:if test="position() = last() and $DependentDetailCount = 4">
													<xsl:attribute name="style">text-align:center;border-right-width:0px;</xsl:attribute>
												  </xsl:if>
														<span class="">
													<div class="styIRS1040liTableCell" style="float:left;width:49.8%;height:auto;height:9mm;">
													<!-- Full time student checkbox -->
													<span style="float:left;font-size:7px;">
													 <input type="checkbox" class="styCkbox">
														<xsl:attribute name="aria-label">Dependent <xsl:value-of select="position()"/> is a Full-time student"</xsl:attribute>
														<xsl:call-template name="PopulateCheckbox">
														  <xsl:with-param name="TargetNode" select="ChildIsAStudentUnder24Ind"/>
														  <xsl:with-param name="BackupName">IRS1040ChildIsAStudentUnder24Ind</xsl:with-param>
														</xsl:call-template>
														Full-time student
													  </input>													
													</span>
													</div>
													<div class="styIRS1040liTableCell"   style="float:right;width:50%;border-left:1px solid;height:9mm;">
													<!-- Permanently asnd totally disabled checkbox -->
													<span style="float:left;font-size:7px;">
													<input type="checkbox" class="styCkbox">
														<xsl:attribute name="aria-label">Dependent <xsl:value-of select="position()"/> is Permanently and totally disabled"</xsl:attribute>
														<xsl:call-template name="PopulateCheckbox">
														  <xsl:with-param name="TargetNode" select="ChildPermanentlyDisabledInd"/>
														  <xsl:with-param name="BackupName">IRS1040ChildPermanentlyDisabledInd</xsl:with-param>
														</xsl:call-template>
														Permanently <br/>and totally <br/>disabled
													  </input>	
													 </span>
													</div>
													</span>
													</td>
												  </xsl:for-each>
											<xsl:if test="$DependentDetailCount &lt; 4">
												<xsl:choose>
												  <xsl:when test="$DependentDetailCount = 3">
													<td class="styIRS1040SRTableCell" style="text-align:center;height:9mm;border-right-width:0px;">
													<div class="styIRS1040SRli2TableCell" style="float:left;width:49.8%;height:inherit;border-right:1px solid black;">
													<span style="float:left;font-size:7px;">
													<input type="checkbox" aria-label="Dependent 4 is a Full-time student"/>Full-time student
													</span>
													</div>
													<div class="styIRS1040SRli2TableCell"   style="float:right;width:50%;height:inherit;">
													<span style="float:right;font-size:7px;">
													<input type="checkbox" aria-label="Dependent 4 is Permanently and totally disabled"/>Permanently and totally disabled
													</span>
													</div>
													</td>
												  </xsl:when>
												  <xsl:when test="$DependentDetailCount = 2">
													<td class="styIRS1040SRTableCell" style="text-align:center;height:9mm;">
													<div class="styIRS1040SRli2TableCell" style="float:left;width:49.8%;height:inherit;border-right:1px solid black;">
													<span style="float:left;font-size:7px;">
													<input type="checkbox" aria-label="Dependent 3 is a Full-time student"/>Full-time student
													</span>
													</div>
													<div class="styIRS1040SRli2TableCell" style="float:right;width:49.8%;height:inherit;">
													<span style="float:right;font-size:7px;">
													<input type="checkbox" aria-label="Dependent 3 is Permanently and totally disabled"/>Permanently and totally disabled																
													</span>
													</div>
													</td>
													<td class="styIRS1040SRTableCell" style="text-align:center;height:9mm;border-right-width:0px;">
													<div class="styIRS1040SRli2TableCell" style="float:left;width:49.8%;height:inherit;border-right:1px solid black;">
													<span style="float:left;font-size:7px;">
													<input type="checkbox" aria-label="Dependent 4 is a Full-time student"/>Full-time student
													</span>
													</div>
													<div class="styIRS1040SRli2TableCell" style="float:right;width:49.8%;height:inherit;">
													<span style="float:right;font-size:7px;">
													<input type="checkbox" aria-label="Dependent 4 is Permanently and totally disabled"/>Permanently and totally disabled
													</span>
													</div>
													</td>
												  </xsl:when>
												  <xsl:when test="$DependentDetailCount = 1">
													<td class="styIRS1040SRTableCell" style="text-align:center;height:9mm;">
													<div class="styIRS1040SRli2TableCell" style="float:left;width:49.8%;height:inherit;border-right:1px solid black;">
													<span style="float:left;font-size:7px;">
													<input type="checkbox" aria-label="Dependent 2 is a Full-time student"/>Full-time student
													</span>
													</div>
													<div class="styIRS1040SRli2TableCell" style="float:right;width:49.8%;height:inherit;">
													<span style="float:right;font-size:7px;">
													<input type="checkbox" aria-label="Dependent 2 is Permanently and totally disabled"/>Permanently and totally disabled
													</span>
													</div>
													</td>
													<td class="styIRS1040SRTableCell" style="text-align:center;height:9mm;">
													<div class="styIRS1040SRli2TableCell" style="float:left;width:49.8%;height:inherit;border-right:1px solid black;">
													<span style="float:left;font-size:7px;">
													<input type="checkbox" aria-label="Dependent 3 is a Full-time student"/>Full-time student
													</span>
													</div>
													<div class="styIRS1040SRli2TableCell" style="float:right;width:49.8%;height:inherit;">
													<span style="float:right;font-size:7px;">
													<input type="checkbox" aria-label="Dependent 3 is Permanently and totally disabled"/>Permanently and totally disabled
													</span>
													</div>
													</td>
													<td class="styIRS1040SRTableCell" style="border-right-width:0px;text-align:center;height:9mm;">
													<div class="styIRS1040SRli2TableCell" style="float:left;width:49.8%;height:inherit;border-right:1px solid black;">
													<span style="float:left;font-size:7px;">
													<input type="checkbox" aria-label="Dependent 4 is a Full-time student"/>Full-time student
													</span>
													</div>
													<div class="styIRS1040li2TableCell" style="float:right;width:49.8%;height:inherit;">
													<span style="float:right;font-size:7px;">
													<input type="checkbox" aria-label="Dependent 4 is Permanently and totally disabled"/>Permanently and totally disabled
													</span>
													</div>
													</td>
												  </xsl:when>
												</xsl:choose>
											  </xsl:if>
											</tr> 	
											 <!-- Credit block -->
											<tr>
											  <th class="styIRS1040SRTableCell" style="text-align:left;" scope="row"><strong>(7)</strong><span style="padding-left:1mm;font-weight:normal;text-align:middle;">Credits</span></th>
											  <xsl:for-each select="$FormData/DependentDetail">
												<td class="styIRS1040SRTableCell" style="text-align:center;">
												  <xsl:if test="position() = last() and $DependentDetailCount = 4">
													<xsl:attribute name="style">text-align:center;border-right-width:0px;</xsl:attribute>
												  </xsl:if>
												  <!--xsl:value-of select="DependentRelationshipCd"/-->
												   <span class="">
												  <div class="styIRS1040liTableCell" style="float:left;width:49.8%;height:auto;height:7mm;">
													<!-- Child Tax Credit checkbox -->
													<span style="float:left;font-size:7px;">
													 <input type="checkbox" class="styCkbox">
														<xsl:attribute name="aria-label">Dependent <xsl:value-of select="position()"/> Child Tax Credit Eligable"</xsl:attribute>
														<xsl:call-template name="PopulateCheckbox">
														  <xsl:with-param name="TargetNode" select="EligibleForChildTaxCreditInd"/>
														  <xsl:with-param name="BackupName">IRS1040EligibleForChildTaxCreditInd</xsl:with-param>
														</xsl:call-template>
														Child Tax Credit
													  </input>													
													</span>
													</div>
													<div class="styIRS1040liTableCell"   style="float:right;width:50%;border-left:1px solid;height:7mm;">
													<!-- Eligible For Other Dependents Credit checkbox -->
													<span style="float:left;font-size:7px;">
													<input type="checkbox" class="styCkbox">
														<xsl:attribute name="aria-label">Dependent <xsl:value-of select="position()"/> is Eligible For Other Dependents Credit"</xsl:attribute>
														<xsl:call-template name="PopulateCheckbox">
														  <xsl:with-param name="TargetNode" select="EligibleForODCInd"/>
														  <xsl:with-param name="BackupName">IRS1040EligibleForODCInd</xsl:with-param>
														</xsl:call-template>
														Credit for other dependents
													  </input>	
													 </span>
													</div>
													</span>
												</td>
											  </xsl:for-each>
											  <xsl:if test="$DependentDetailCount &lt; 4">
												<xsl:choose>
												  <xsl:when test="$DependentDetailCount = 3">
													<td class="styIRS1040SRTableCell" style="text-align:center;height:7mm;border-right-width:0px;">
													<div class="styIRS1040SRli2TableCell" style="float:left;width:49.8%;height:inherit;border-right:1px solid black;">
													<span style="float:left;font-size:7px;">
													<input type="checkbox" aria-label="Dependent 4 is Child Tax Credit Eligable"/>Child Tax Credit
													</span>
													</div>
													<div class="styIRS1040SRli2TableCell"   style="float:right;width:50%;height:inherit;">
													<span style="float:right;font-size:7px;">
													<input type="checkbox" aria-label="Dependent 4 is Eligible For Other Dependents Credit"/>Credit for other dependents
													</span>
													</div>
													</td>
												  </xsl:when>
												  <xsl:when test="$DependentDetailCount = 2">
													<td class="styIRS1040SRTableCell" style="text-align:center;height:7mm;">
													<div class="styIRS1040SRli2TableCell" style="float:left;width:49.8%;height:inherit;border-right:1px solid black;">
													<span style="float:left;font-size:7px;">
													<input type="checkbox" aria-label="Dependent 3 is Child Tax Credit Eligable"/>Child Tax Credit
													</span>
													</div>
													<div class="styIRS1040SRli2TableCell" style="float:right;width:49.8%;height:inherit;">
													<span style="float:right;font-size:7px;">
													<input type="checkbox" aria-label="Dependent 3 is Eligible For Other Dependents Credit"/>Credit for other dependents																
													</span>
													</div>
													</td>
													<td class="styIRS1040SRTableCell" style="text-align:center;height:7mm;border-right-width:0px;">
													<div class="styIRS1040SRli2TableCell" style="float:left;width:49.8%;height:inherit;border-right:1px solid black;">
													<span style="float:left;font-size:7px;">
													<input type="checkbox" aria-label="Dependent 4 is Child Tax Credit Eligable"/>Child Tax Credit
													</span>
													</div>
													<div class="styIRS1040SRli2TableCell" style="float:right;width:49.8%;height:inherit;">
													<span style="float:right;font-size:7px;">
													<input type="checkbox" aria-label="Dependent 4 is Eligible For Other Dependents Credit"/>Credit for other dependents
													</span>
													</div>
													</td>
												  </xsl:when>
												  <xsl:when test="$DependentDetailCount = 1">
													<td class="styIRS1040SRTableCell" style="text-align:center;height:7mm;">
													<div class="styIRS1040SRli2TableCell" style="float:left;width:49.8%;height:inherit;border-right:1px solid black;">
													<span style="float:left;font-size:7px;">
													<input type="checkbox" aria-label="Dependent 2 is Child Tax Credit Eligable"/>Child Tax Credit
													</span>
													</div>
													<div class="styIRS1040SRli2TableCell" style="float:right;width:49.8%;height:inherit;">
													<span style="float:right;font-size:7px;">
													<input type="checkbox" aria-label="Dependent 2 is Eligible For Other Dependents Credit"/>Credit for other dependents
													</span>
													</div>
													</td>
													<td class="styIRS1040SRTableCell" style="text-align:center;height:7mm;">
													<div class="styIRS1040SRli2TableCell" style="float:left;width:49.8%;height:inherit;border-right:1px solid black;">
													<span style="float:left;font-size:7px;">
													<input type="checkbox" aria-label="Dependent 3 is Child Tax Credit Eligable"/>Child Tax Credit
													</span>
													</div>
													<div class="styIRS1040SRli2TableCell" style="float:right;width:49.8%;height:inherit;">
													<span style="float:right;font-size:7px;">
													<input type="checkbox" aria-label="Dependent 3 is Eligible For Other Dependents Credit"/>Credit for other dependents
													</span>
													</div>
													</td>
													<td class="styIRS1040SRTableCell" style="border-right-width:0px;text-align:center;height:7mm;">
													<div class="styIRS1040SRli2TableCell" style="float:left;width:49.8%;height:inherit;border-right:1px solid black;">
													<span style="float:left;font-size:7px;">
													<input type="checkbox" aria-label="Dependent 4 is Child Tax Credit Eligable"/>Child Tax Credit
													</span>
													</div>
													<div class="styIRS1040SRli2TableCell" style="float:right;width:49.8%;height:inherit;">
													<span style="float:right;font-size:7px;">
													<input type="checkbox" aria-label="Dependent 4 is Eligible For Other Dependents Credit"/>Credit for other dependents
													</span>
													</div>
													</td>
												  </xsl:when>
												</xsl:choose>
											  </xsl:if>
											</tr> 	
									</xsl:when>
									 <!-- Additional Data Table Section -->
										  <xsl:when test="$DependentDetailCount &gt; 4 or $Print = $Separated">
											<tr>
											  <th class="styIRS1040SRTableCell" style="text-align:left;" scope="row"><strong>(1)</strong><span style="padding-left:1mm;font-weight:normal;text-align:left;">First Name</span></th>
											  <td class="styIRS1040SRTableCell">
												<span style="padding-left:2mm;">See Additional Data Table</span>
											  </td>
											  <td class="styIRS1040SRTableCell"></td>
											  <td class="styIRS1040SRTableCell"></td>
											  <td class="styIRS1040SRTableCell" style="border-right-width:0px;"></td>
											</tr>
											<tr>
											  <th class="styIRS1040SRTableCell" style="text-align:left;" scope="row"><strong>(2)</strong><span style="padding-left:1mm;font-weight:normal;text-align:left;">Last Name</span></th>
											  <td class="styIRS1040SRTableCell"></td>
											  <td class="styIRS1040SRTableCell"></td>
											  <td class="styIRS1040SRTableCell"></td>
											  <td class="styIRS1040SRTableCell" style="border-right-width:0px;"></td>
											</tr>
											<tr>
											  <th class="styIRS1040SRTableCell" style="text-align:left;" scope="row"><strong>(3)</strong><span style="padding-left:1mm;font-weight:normal;text-align:left;">SSN</span></th>
											  <td class="styIRS1040SRTableCell"></td>
											  <td class="styIRS1040SRTableCell"></td>
											  <td class="styIRS1040SRTableCell"></td>
											  <td class="styIRS1040SRTableCell" style="border-right-width:0px;"></td>
											</tr>
											<tr>
											  <th class="styIRS1040SRTableCell" style="text-align:left;" scope="row"><strong>(4)</strong><span style="padding-left:1mm;font-weight:normal;text-align:left;">Relationship</span></th>
											  <td class="styIRS1040SRTableCell"></td>
											  <td class="styIRS1040SRTableCell"></td>
											  <td class="styIRS1040SRTableCell"></td>
											  <td class="styIRS1040SRTableCell" style="border-right-width:0px;"></td>
											</tr>
																						<tr>
											  <th class="styIRS1040SRTableCell" style="text-align:left;" scope="row"><strong>(5)</strong><span style="padding-left:1mm;font-weight:normal;text-align:left;">Check if lived with you more than half of 2025</span></th>
											  <td class="styIRS1040SRTableCell"></td>
											  <td class="styIRS1040SRTableCell"></td>
											  <td class="styIRS1040SRTableCell"></td>
											  <td class="styIRS1040SRTableCell" style="border-right-width:0px;"></td>
											</tr>
											<tr>
											  <th class="styIRS1040SRTableCell" style="text-align:left;" scope="row"><strong>(6)</strong><span style="padding-left:1mm;font-weight:normal;text-align:left;">Check if</span></th>
											  <td class="styIRS1040SRTableCell"></td>
											  <td class="styIRS1040SRTableCell"></td>
											  <td class="styIRS1040SRTableCell"></td>
											  <td class="styIRS1040SRTableCell" style="border-right-width:0px;"></td>
											</tr>
											<tr>
											  <th class="styIRS1040SRTableCell" style="text-align:left;" scope="row"><strong>(7)</strong><span style="padding-left:1mm;font-weight:normal;text-align:left;">Credits</span></th>
											  <td class="styIRS1040SRTableCell"></td>
											  <td class="styIRS1040SRTableCell"></td>
											  <td class="styIRS1040SRTableCell"></td>
											  <td class="styIRS1040SRTableCell" style="border-right-width:0px;"></td>
											</tr>	
										  </xsl:when>
										</xsl:choose>
									</tbody>
								</table>

							<div class="sty1040DepdContainer2" style="width:167mm;margin-left:0mm;height:auto;border-color:black;border-top-width: 1.5px;">
								<input type="checkbox" class="styCkbox" style="margin-right:1mm;margin-bottom:1mm;" aria-label="Separated Spouse and Separate Return Yes">
									<xsl:call-template name="PopulateCheckbox">
										<xsl:with-param name="TargetNode" select="$FormData/SepdSpsFilingSepRetMeetsRqrInd"/>
										<xsl:with-param name="BackupName">IRS1040SepdSpsFilingSepRetMeetsRqrInd</xsl:with-param>
									</xsl:call-template>
								</input>
								<label>
									<xsl:call-template name="PopulateLabel">
										<xsl:with-param name="TargetNode" select="$FormData/SepdSpsFilingSepRetMeetsRqrInd"/>
										<xsl:with-param name="BackupName">IRS1040SepdSpsFilingSepRetMeetsRqrInd</xsl:with-param>
									</xsl:call-template>Check if your filing status is MFS or HOH and you lived apart from your spouse for the last 6 months of 2025, or you are legally separated according to your state law under a written separation agreement or a decree of separate maintenance and you did not live in the same household as your spouse at the end of 2025. 
								</label>
							</div>
							</div>
						</div>
					</div>
					<!-- Set Initial Height of Above Table -->
					<!--<xsl:if test="(count($FormData/DependentDetail) &gt;= 4) and ($Print != $Separated)">
						<xsl:call-template name="SetInitialDynamicTableHeight">
							<xsl:with-param name="TargetNode" select="$FormData/DependentDetail"/>
							<xsl:with-param name="containerHeight" select="4"/>
							<xsl:with-param name="headerHeight" select="3"/>
							<xsl:with-param name="containerID" select=" 'depdContainerId' "/>
						</xsl:call-template>
					</xsl:if>-->
					<!-- End Dependents table -->
					<!-- Block 1a to 1z -->
					<div class="styStdDiv" style="border-bottom:1px solid black;overflow:visible;"/>
					<div class="styGenericDiv" style="width:20mm;padding-top:0mm;height:62mm;">
						<span style="padding-left:1.5mm;font-weight:bold;font-size:14pt;padding-bottom:1mm;padding-top:1.5mm">Income</span>
						<div style="width:100%;padding-left:1.5mm;">
							<span style="float:left;width:19.5mm;font-weight:bold;font-size:8pt;font-family:Arial Narrow;">Attach Form(s)<br/>W-2 here. Also<br/>attach Forms<br/>
							W-2G and<br/>1099-R if tax<br/>was withheld.
							</span>
						</div>
						<div style="width:100%;padding-left:1.5mm;padding-top:.5mm">
							<span style="float:left;width:18.5mm;font-size:8pt;font-family:Arial Narrow;padding-bottom:13mm">If you did not <br/>get a Form<br/>W-2, see<br/>instructions.
							</span>
						</div>					
						<div style="height:1mm;"></div>						
					</div> 
					<!-- End of Block 1a to 1z -->
						<!-- Line 1a -->
						<div class="sty1040SRLN" style="min-height:4.6mm;">
							<div class="styLNLeftNumBoxSD" style="padding-left:1mm;padding-top:1.5mm;margin-left:-2px;margin-right:2px;height:5.6mm;">1a</div>
							<div class="sty1040SRDesc" style="height:5.6mm;">
								Total amount from Form(s) W-2, box 1 (see instructions)
								<xsl:call-template name="LinkToLeftoverDataTableInline">
									<xsl:with-param name="Desc">Line 1a - Fringe Benefits Code</xsl:with-param>
									<xsl:with-param name="TargetNode" select="$FormData/WagesAmt/@fringeBenefitsCd"/>
								</xsl:call-template>
								<span class="sty1040SRDotLn">.....</span>
							</div>
							<div class="sty1040SRRightNumBox" style="height:5.6mm;">1a</div>
							<div class="sty1040SRAmountBox" style="height:5.6mm;">
								<span style="float:left;">
									<xsl:call-template name="SetFormLinkInline">
										<xsl:with-param name="TargetNode" select="$FormData/WagesAmt"/>
									</xsl:call-template>
								</span>
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/WagesAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<!-- Line 1b -->
						<div class="sty1040SRLN" style="min-height:4.6mm;">
							<div class="styLNLeftNumBoxSD" style="padding-left:1mm;padding-top:1.5mm;margin-left:5px;margin-right:-4px;height:5.6mm;">b</div>
							<div class="sty1040SRDesc" style="width:122.7mm;height:5.6mm;">
								Household employee wages not reported on Form(s) W-2
								<span class="sty1040SRDotLn">.......</span>
							</div>
							<div class="sty1040SRRightNumBox" style="height:5.6mm;">1b</div>
							<div class="sty1040SRAmountBox" style="height:5.6mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/HouseholdEmployeeWagesAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<!-- Line 1c -->
						<div class="sty1040SRLN" style="min-height:4.6mm;">
							<div class="styLNLeftNumBoxSD" style="padding-left:1mm;padding-top:1.5mm;margin-left:5px;margin-right:-4px;height:5.6mm;">c</div>
							<div class="sty1040SRDesc" style="width:122.7mm;height:5.6mm;">
								Tip income not reported on line 1a (see instructions)
								<span class="sty1040SRDotLn">........</span>
							</div>
							<div class="sty1040SRRightNumBox" style="height:5.6mm;">1c</div>
							<div class="sty1040SRAmountBox" style="height:5.6mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/TipIncomeAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<!-- Line 1d -->
						<div class="sty1040SRLN" style="min-height:4.6mm;">
							<div class="styLNLeftNumBoxSD" style="padding-left:1mm;padding-top:1.5mm;margin-left:5px;margin-right:-4px;height:5.6mm;">d</div>
							<div class="sty1040SRDesc" style="width:122.7mm;height:5.6mm;">
								Medicaid waiver payments not reported on Form(s) W-2 (see instructions)
								<span class="sty1040SRDotLn">.</span>
							</div>
							<div class="sty1040SRRightNumBox" style="height:5.6mm;">1d</div>
							<div class="sty1040SRAmountBox" style="height:5.6mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/MedicaidWaiverPymtNotRptW2Amt"/>
								</xsl:call-template>
							</div>
						</div>
						<!-- Line 1e -->
						<div class="sty1040SRLN" style="min-height:4.6mm;">
							<div class="styLNLeftNumBoxSD" style="padding-top:1.5mm;padding-left:1mm;margin-left:5px;margin-right:-4px; height:5.6mm;">e</div>
							<div class="sty1040SRDesc" style="width:122.7mm;height:5.6mm;">
								Taxable dependent care benefits from Form 2441, line 26
								<span class="sty1040SRDotLn">.......</span>
							</div>
							<div class="sty1040SRRightNumBox" style="height:5.6mm;">1e</div>
							<div class="sty1040SRAmountBox" style="height:5.6mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/TaxableBenefitsAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<!-- Line 1f -->
						<div class="sty1040SRLN" style="min-height:4.6mm;">
							<div class="styLNLeftNumBoxSD" style="padding-top:1.5mm;padding-left:1mm;margin-left:5px;margin-right:-4px;height:5.6mm;">f</div>
							<div class="sty1040SRDesc" style="width:122.7mm;height:5.6mm;">
								Employer-provided adoption benefits from Form 8839, line 31
								<span class="sty1040SRDotLn">......</span>
							</div>
							<div class="sty1040SRRightNumBox" style="height:5.6mm;">1f</div>
							<div class="sty1040SRAmountBox" style="height:5.6mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/TaxableBenefitsForm8839Amt"/>
								</xsl:call-template>
							</div>
						</div>
						<!-- Line 1g -->
						<div class="sty1040SRLN" style="min-height:4.6mm;">
							<div class="styLNLeftNumBoxSD" style="padding-top:1.5mm;padding-left:1mm;margin-left:5px;margin-right:-4px;height:5.6mm;">g</div>
							<div class="sty1040SRDesc" style="width:122.7mm;height:5.6mm;">
								Wages from Form 8919, line 6
								<span class="sty1040SRDotLn">.................</span>
							</div>
							<div class="sty1040SRRightNumBox" style="height:5.6mm;">1g</div>
							<div class="sty1040SRAmountBox" style="height:5.6mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/TotalWagesWithNoWithholdingAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<!-- Line 1h -->
						<div class="sty1040SRLN" style="min-height:4.6mm;">
							<div class="styLNLeftNumBoxSD" style="padding-top:1.5mm;padding-left:1mm;margin-left:5px;margin-right:-4px;height:5.6mm;">h</div>
							<div class="sty1040SRDesc" style="width:122.7mm;height:5.6mm;">
								Other earned income (see instructions). 
								<xsl:call-template name="LinkToLeftoverDataTableInline">
									<xsl:with-param name="Desc">Line 1h - Wages Not Shown Lit Only Code</xsl:with-param>
									<xsl:with-param name="TargetNode" select="$FormData/OtherEarnedIncomeAmt/@wagesNotShownLitOnlyCd"/>
								</xsl:call-template>
								Enter type and amount:
							</div>
							<div class="sty1040SRRightNumBox" style="height:5.6mm;border-bottom-width:0px;"></div>
							<div class="sty1040SRAmountBox" style="height:5.6mm;border-bottom-width:0px;">
							</div>
						</div>
						<!-- Line 1h make line to fill out -->
						<div class="sty1040SRLN" style="min-height:4.6mm;">
							<div class="styLNLeftNumBoxSD" style="padding-top:1.5mm;padding-left:1mm;margin-left:5px;margin-right:-4px;height:5.6mm;"></div>
							<div class="sty1040SRDesc" style="width:122.7mm;height:5.6mm;">
								<span style="width:122mm;border-bottom:1px solid black;">
								<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$FormData/OtherEarnedIncomeAmt/@wagesNotShownLitOnlyCd"/>
										</xsl:call-template>
								</span>
							</div>
							<div class="sty1040SRRightNumBox" style="height:5.6mm;">1h</div>
							<div class="sty1040SRAmountBox" style="height:5.6mm;">
								<span style="float:left;">
									<xsl:call-template name="SetFormLinkInline">
										<xsl:with-param name="TargetNode" select="$FormData/OtherEarnedIncomeAmt"/>
									</xsl:call-template>
								</span>
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/OtherEarnedIncomeAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<!-- Line 1i -->
						<div class="sty1040SRLN" style="min-height:4.6mm;">
							<div class="styLNLeftNumBoxSD" style="padding-top:1.5mm;padding-left:1mm;margin-left:5px;margin-right:-4px;height:5.6mm;">i</div>
							<div class="sty1040SRDesc" style="width:86.7mm;padding-bottom:0mm;height:5.6mm;">
								Nontaxable combat pay election (see instructions)
								<span class="sty1040SRDotLn" style="padding-left:8.6px;padding-right:0px">.</span>
							</div>
							<div class="sty1040SRRightNumBox" style="height:5.6mm;">1i</div>
							<div class="sty1040SRAmountBox" style="height:5.6mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/NontxCombatPayElectionAmt"/>
								</xsl:call-template>
							</div>
							<div class="sty1040SRRightNumBoxNBB" style="background-color:lightgrey;"></div>
							<div class="sty1040SRAmountBoxNBB"></div>
						</div>
						<!-- Line 1z -->
						<div class="sty1040SRLN" style="min-height:4.6mm;float:right;">
							<div class="styLNLeftNumBoxSD" style="padding-top:1.5mm;padding-left:1mm;margin-left:5px;margin-right:-4px;height:5.6mm;">z</div>
							<div class="sty1040SRDesc" style="width:122.7mm;height:5.6mm;">
								Add lines 1a through 1h
								<span class="sty1040SRDotLn">...................</span>
							</div>
							<div class="sty1040SRRightNumBox" style="height:5.6mm;border-bottom-width:0px;">1z</div>
							<div class="sty1040SRAmountBox" style="height:5.6mm;border-bottom-width:0px;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/WagesSalariesAndTipsAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<!-- End -->
						
						<!-- Form footer-->
						<div class="styStdDiv pageEnd" style="border-top:1px solid black;">
							<span style="font-weight:bold;font-family:Arial;font-size:7.5pt;">For Disclosure,
								Privacy Act, and Paperwork Reduction Act Notice, see separate instructions.</span>
							<span style="margin-left:13mm;font-size:7pt;">Cat. No. 71930F</span>
							<span style="float:right;font-size:7pt;">Form <strong style="font-size:10pt;">
								1040-SR</strong> (2025)</span>
						</div>
						<!-- Page 2 -->
						<div class="styStdDiv" style="border-bottom:1px solid black;font-size:7pt;
							font-family:Verdana;">Form 1040-SR (2025)
							<div style="float:right;">Page <strong>2</strong></div>
						</div>
						<div class="styGenericDiv" style="width:20mm;padding-top:0.5mm;height:110mm;">
							<div style="width:100%;border:1px solid black;border-bottom:none;border-right:none;border-radius:10px 10px 0px 0px;padding-left:1mm;padding-top:0mm;">
							<span style="float:left;width:16.5mm;padding-left:2mm;font-size:9pt;font-family:Arial ;">Attach</span>
						</div>
						<div style="width:100%;border-left:1px solid black;border-right:none;padding-left:3mm;">
							<span style="float:left;width:16.5mm;font-size:9pt;font-family:Arial ;">Sch. B</span>
						</div>
						<div style="width:100%;border:1px solid black;border-top:none;border-right:none;border-radius:0px 0px 8px 19px;padding-left:3mm;padding-bottom:0mm">
							<span style="float:left;width:16.5mm;font-size:9pt;font-family:Arial ;">if required.</span>
						</div>		
						</div>
						<!-- Line 2 -->
						<div class="sty1040SRLN" style="min-height:4.6mm;">
							<div class="sty1040SRLeftNumBoxSD" style="border-top:1px solid black;padding-top:1.3mm;border-left:2px solid white;margin-left:-2px;margin-right:2px;margin-top:1mm;height:5.6mm;">2a</div>
							<div class="sty1040SRDesc" style="width:40mm;height:7.6mm;padding-top:3mm;">Tax-exempt interest
								<span class="sty1040SRDotLn">.</span></div>
							<div class="sty1040SRRightNumBox" style="height:7.6mm;padding-top:3mm;">2a</div>
							<div class="sty1040SRAmountBox" style="border-right-width:1px;height:7.6mm;padding-top:3mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/TaxExemptInterestAmt"/>
								</xsl:call-template>
							</div>
							<div class="styLNLeftLtrBox" style="width:7mm;height:7.6mm;padding-top:3mm;">b
							</div>
							<div class="sty1040SRDesc" style="width:40mm;height:7.6mm;padding-top:3mm;">Taxable interest
								<span class="sty1040SRDotLn">...</span></div>
							<div class="sty1040SRRightNumBox" style="height:7.6mm;padding-top:3mm;">2b</div>
							<div class="sty1040SRAmountBox" style="width:29mm;height:7.6mm;padding-top:3mm;">
								<span style="float:left;">
									<xsl:call-template name="SetFormLinkInline">
										<xsl:with-param name="TargetNode" select="$FormData/TaxableInterestAmt"/>
									</xsl:call-template>
								</span>
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/TaxableInterestAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<!-- Line 3 -->
						<div class="sty1040SRLN" style="min-height:4.6mm;">
							<div class="sty1040SRLeftNumBoxSD" style="padding-top:1.5mm;border-bottom:1px solid black;border-left:2px solid white;margin-left:-2px;margin-right:2px;height:5.6mm;">3a</div>
							<div class="sty1040SRDesc" style="width:40mm;height:5.6mm;">
								Qualified dividends
								<xsl:call-template name="LinkToLeftoverDataTableInline">
									<xsl:with-param name="Desc">Line 3a -  Qualified Dividends Form 8814 Code</xsl:with-param>
									<xsl:with-param name="TargetNode" select="$FormData/QualifiedF8814Cd"/>
								</xsl:call-template>
								<span class="sty1040SRDotLn">.</span>
							</div>
							<div class="sty1040SRRightNumBox" style="height:5.6mm;">3a</div>
							<div class="sty1040SRAmountBox" style="border-right-width:1px;height:5.6mm;">
								<span style="float:left;">
									<xsl:call-template name="LinkToLeftoverDataTableInline">
										<xsl:with-param name="Desc">Line 3a - Qualified Dividends Form 8814 Amount</xsl:with-param>
										<xsl:with-param name="TargetNode" select="$FormData/QualifiedF8814Amt"/>
									</xsl:call-template>
								</span>
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/QualifiedDividendsAmt"/>
								</xsl:call-template>
							</div>
							<div class="styLNLeftLtrBox" style="width:7mm;padding-top:1.5mm; height:5.6mm;">b
							</div>
							<div class="sty1040SRDesc" style="width:40mm;height:5.6mm;">
								Ordinary dividends
								<xsl:call-template name="LinkToLeftoverDataTableInline">
									<xsl:with-param name="Desc">Line 3b - Ordinary Dividends Form 8814 Code</xsl:with-param>
									<xsl:with-param name="TargetNode" select="$FormData/OrdinaryF8814Cd"/>
								</xsl:call-template>
								<xsl:call-template name="LinkToLeftoverDataTableInline">
									<xsl:with-param name="Desc">Line 3b - Ordinary Dividends Form 8814 Amount</xsl:with-param>
									<xsl:with-param name="TargetNode" select="$FormData/OrdinaryF8814Amt"/>
								</xsl:call-template>
							</div>
							<div class="sty1040SRRightNumBox" style="height:5.6mm;">3b</div>
							<div class="sty1040SRAmountBox" style="height:5.6mm;">
								<span style="float:left;">
									<xsl:call-template name="SetFormLinkInline">
										<xsl:with-param name="TargetNode" 
											select="$FormData/OrdinaryDividendsAmt"/>
									</xsl:call-template>
								</span>
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/OrdinaryDividendsAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<!-- Line 3c -->
						<div class="sty1040SRLN" style="min-height:4.6mm;">
							<div class="sty1040SRLeftNumBoxSD" style="padding-top:1.5mm;padding-left:4.4mm;padding-top:1.7mm;height:5.6mm;">c</div>
							<div class="sty1040SRDesc" style="height:5.6mm;">
								Check if your child's dividends are included in:
							</div>
							<div class="sty1040SRRightNumBoxNBB" style="background-color:lightgrey;height:5.6mm;">&nbsp;</div>
							<div class="sty1040SRAmountBoxNBB" style="height:5.6mm;">&nbsp;</div>
						</div>
						<!-- Line 3c check box -->
						<div class="sty1040SRLN" style="min-height:4.6mm;">
							<div class="sty1040SRLeftNumBoxSD" style="padding-top:1.5mm;padding-left:4.4mm;padding-top:1.7mm;height:5.6mm;"></div>
							<div class="sty1040SRDesc" style="height:5.6mm;">
								<!-- 3c (1) -->
									<span style="font-weight:bold;font-family:Verdana;width:3mm;text-align:center;">1</span>
									<span style="width:3mm;height:3mm;"/>
									<input type="checkbox" class="styCkboxNM" aria-label="Line 3a" style="">
										<xsl:call-template name="PopulateCheckbox">
											<xsl:with-param name="TargetNode" select="$FormData/ChildDivIncldQualifiedDivInd"/>
											<xsl:with-param name="BackupName">F1040ChildDivIncldQualifiedDivInd</xsl:with-param>
										</xsl:call-template>
									</input>
									<label style="padding-left:1mm;font-family:Arial;">
										<xsl:call-template name="PopulateLabel">
											<xsl:with-param name="TargetNode" select="$FormData/ChildDivIncldQualifiedDivInd"/>
											<xsl:with-param name="BackupName">F1040ChildDivIncldQualifiedDivInd</xsl:with-param>
										</xsl:call-template>Line 3a</label>
									<!-- 3c (2) -->
									<span style="width:25mm;height:3mm;"/>
									<span style="font-weight:bold;font-family:Verdana;width:3.5mm;text-align:center;">2</span>
									<span style="width:3mm;height:3mm;"/>
									<input type="checkbox" class="styCkboxNM" aria-label="Line 3b" style="">
										<xsl:call-template name="PopulateCheckbox">
											<xsl:with-param name="TargetNode" select="$FormData/ChildDivIncldOrdinaryDivInd"/>
											<xsl:with-param name="BackupName">F1040ChildDivIncldOrdinaryDivInd</xsl:with-param>
										</xsl:call-template>
									</input>
									<label style="padding-left:1mm;font-family:Arial;">
										<xsl:call-template name="PopulateLabel">
											<xsl:with-param name="TargetNode" select="$FormData/ChildDivIncldOrdinaryDivInd"/>
											<xsl:with-param name="BackupName">F1040ChildDivIncldOrdinaryDivInd</xsl:with-param>
										</xsl:call-template>Line 3b</label>
							</div>
							<div class="sty1040SRRightNumBoxNBB" style="background-color:lightgrey;height:5.6mm;">&nbsp;</div>
							<div class="sty1040SRAmountBoxNBB" style="height:5.6mm;">&nbsp;</div>
						</div>
						<!-- Line 4 -->
						<div class="sty1040SRLN" style="min-height:5.6mm;">
							<div class="sty1040SRLeftNumBoxSD" style="height:5.6mm;">4a</div>
							<div class="sty1040SRDesc" style="width:40mm;height:5.6mm;">IRA distributions
								<span class="sty1040SRDotLn">...</span></div>
							<div class="sty1040SRRightNumBox" style="height:5.6mm;">4a</div>
							<div class="sty1040SRAmountBox" style="border-right-width:1px;height:5.6mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/IRADistributionsAmt"/>
								</xsl:call-template>
							</div>
							<div class="styLNLeftLtrBox" style="width:7mm;padding-top:1.5mm;height:5.6mm;">b
							</div>
							<div class="sty1040SRDesc" style="width:40mm;height:5.6mm;">
								Taxable amount
								<xsl:call-template name="LinkToLeftoverDataTableInline">
									<xsl:with-param name="Desc">Line 4b - IRA Distributions Literal Code</xsl:with-param>
									<xsl:with-param name="TargetNode" select="$FormData/IRADistributionsLiteralCd"/>
								</xsl:call-template>
								<span class="sty1040SRDotLn">..</span>
							</div>
							<div class="sty1040SRRightNumBox" style="height:5.6mm;">4b</div>
							<div class="sty1040SRAmountBox" style="height:5.6mm;">
								<span style="float:left;">
									<xsl:call-template name="SetFormLinkInline">
										<xsl:with-param name="TargetNode" select="$FormData/TaxableIRAAmt"/>
									</xsl:call-template>
								</span>
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/TaxableIRAAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<!-- Line 4c -->
						<div class="sty1040SRLN" style="min-height:4.6mm;">
							<div class="sty1040SRLeftNumBoxSD" style="padding-top:1.5mm;padding-left:4.4mm;padding-top:1.7mm;height:5.6mm;">c</div>
							<div class="sty1040SRDesc" style="height:5.6mm;">
								Check if (see instructions):
							</div>
							<div class="sty1040SRRightNumBoxNBB" style="background-color:lightgrey;height:5.6mm;">&nbsp;</div>
							<div class="sty1040SRAmountBoxNBB" style="height:5.6mm;">&nbsp;</div>
						</div>
						<!-- Line 4c check box -->
						<div class="sty1040SRLN" style="min-height:4.6mm;">
							<div class="sty1040SRLeftNumBoxSD" style="padding-top:1.5mm;padding-left:4.4mm;padding-top:1.7mm;height:5.6mm;"></div>
							<div class="sty1040SRDesc" style="height:5.6mm;">
								<!-- 4c (1) -->
									<span style="font-weight:bold;font-family:Verdana;width:3mm;text-align:center;">1</span>
									<span style="width:2mm;"/>
									<input type="checkbox" class="styCkboxNM" aria-label="Rollover Yes" style="">
										<xsl:call-template name="PopulateCheckbox">
											<xsl:with-param name="TargetNode" select="$FormData/IRADistributionRolloverInd"/>
											<xsl:with-param name="BackupName">F1040IRADistributionRolloverInd</xsl:with-param>
										</xsl:call-template>
									</input>
									<label style="padding-left:1mm;font-family:Arial;">
										<xsl:call-template name="PopulateLabel">
											<xsl:with-param name="TargetNode" select="$FormData/IRADistributionRolloverInd"/>
											<xsl:with-param name="BackupName">F1040IRADistributionRolloverInd</xsl:with-param>
										</xsl:call-template>Rollover
									</label>
									<xsl:call-template name="SetFormLinkInline">
										<xsl:with-param name="TargetNode" select="$FormData/IRADistributionRolloverInd"/>
									</xsl:call-template>
									<!-- 4c (2) -->
									<span style="width:20mm;height:4mm;"/>
									<span style="font-weight:bold;font-family:Verdana;width:3.5mm;text-align:center;">2</span>
									<span style="width:2mm;"/>
									<input type="checkbox" class="styCkboxNM" aria-label="QCD Yes" style="">
										<xsl:call-template name="PopulateCheckbox">
											<xsl:with-param name="TargetNode" select="$FormData/IRADistributionQCDInd"/>
											<xsl:with-param name="BackupName">F1040IRADistributionQCDInd</xsl:with-param>
										</xsl:call-template>
									</input>
									<label style="padding-left:1mm;font-family:Arial;">
										<xsl:call-template name="PopulateLabel">
											<xsl:with-param name="TargetNode" select="$FormData/IRADistributionQCDInd"/>
											<xsl:with-param name="BackupName">F1040IRADistributionQCDInd</xsl:with-param>
										</xsl:call-template>QCD
									</label>
									<!-- 4(3) -->	
									<span style="width:15mm;height:4mm;"/>
									<span style="font-weight:bold;font-family:Verdana;width:3.5mm;text-align:center;">3</span>
									<span style="width:2mm;"/>
									<input type="checkbox" class="styCkboxNM" style="margin-right:1mm;" aria-label="Other IRA distribution Amounts Yes">
										<xsl:call-template name="PopulateCheckbox">
											<xsl:with-param name="TargetNode" select="$FormData/IRADistributionOtherInd"/>
											<xsl:with-param name="BackupName">F1040IRADistributionOtherInd</xsl:with-param>
										</xsl:call-template>
									</input>
									<span style="width:20mm;border-bottom:1px solid black;">
											<xsl:call-template name="LinkToLeftoverDataTableInline">
												<xsl:with-param name="Desc">Line 4(3) - Other IRA Code</xsl:with-param>
												<xsl:with-param name="TargetNode" select="$FormData/OtherIRATypeCd"/>
											</xsl:call-template>
											<xsl:call-template name="LinkToLeftoverDataTableInline">
												<xsl:with-param name="Desc">Line 4(3) - Other IRA Text</xsl:with-param>
												<xsl:with-param name="TargetNode" select="$FormData/OtherIRATypeTxt"/>
											</xsl:call-template>
									</span>	
							</div>
							<div class="sty1040SRRightNumBoxNBB" style="background-color:lightgrey;height:5.6mm;">&nbsp;</div>
							<div class="sty1040SRAmountBoxNBB" style="height:5.6mm;">&nbsp;</div>
						</div>
						<!--Line 5a-->
						<div class="sty1040SRLN" style="min-height:4.6mm;">
							<div class="sty1040SRLeftNumBoxSD" style="height:5.6mm;">5a</div>
							<div class="sty1040SRDesc" style="width:40mm; height:5.6mm;">Pensions and annuities</div>
							<div class="sty1040SRRightNumBox" style="height:5.6mm;">5a</div>
							<div class="sty1040SRAmountBox" style="border-right-width:1px;height:5.6mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/PensionsAnnuitiesAmt"/>
								</xsl:call-template>
							</div>
							<div class="styLNLeftLtrBox" style="width:7mm;padding-top:1.5mm;height:5.6mm;">b
							</div>
							<div class="sty1040SRDesc" style="width:40mm;height:5.6mm;">
								Taxable amount
								<xsl:call-template name="LinkToLeftoverDataTableInline">
									<xsl:with-param name="Desc">Line 5a - Pensions and Annuities Literal Code</xsl:with-param>
									<xsl:with-param name="TargetNode"
										select="$FormData/TotalTaxablePensionsAmt/@pensionsAnnuitiesLiteralCd"/>
								</xsl:call-template>
								<xsl:call-template name="LinkToLeftoverDataTableInline">
									<xsl:with-param name="Desc">Line 5a - Foreign Employer Pension Code</xsl:with-param>
									<xsl:with-param name="TargetNode" 
										select="$FormData/ForeignEmployerPensionCd"/>
								</xsl:call-template>
								<xsl:call-template name="LinkToLeftoverDataTableInline">
									<xsl:with-param name="Desc">Line 5b - Taxable Foreign Pensions Total Amount</xsl:with-param>
									<xsl:with-param name="TargetNode" 
										select="$FormData/TaxableForeignPensionsTotalAmt"/>
								</xsl:call-template>
							</div>
							<div class="sty1040SRRightNumBox" style="height:5.6mm;">5b</div>
							<div class="sty1040SRAmountBox" style="height:5.6mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode"
										select="$FormData/TotalTaxablePensionsAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<!-- Line 5c -->
						<div class="sty1040SRLN" style="min-height:4.6mm;">
							<div class="sty1040SRLeftNumBoxSD" style="padding-top:1.5mm;padding-left:4.4mm;padding-top:1.7mm;height:5.6mm;">c</div>
							<div class="sty1040SRDesc" style="height:5.6mm;">
								Check if (see instructions):
							</div>
							<div class="sty1040SRRightNumBoxNBB" style="background-color:lightgrey;height:5.6mm;">&nbsp;</div>
							<div class="sty1040SRAmountBoxNBB" style="height:5.6mm;">&nbsp;</div>
						</div>
						<!-- Line 5c check box -->
						<div class="sty1040SRLN" style="min-height:4.6mm;">
							<div class="sty1040SRLeftNumBoxSD" style="padding-top:1.5mm;padding-left:4.4mm;padding-top:1.7mm;height:5.6mm;"></div>
							<div class="sty1040SRDesc" style="height:5.6mm;">
								<!-- 5c (1) -->
									<span style="font-weight:bold;font-family:Verdana;width:3mm;text-align:center;">1</span>
									<span style="width:2mm;"/>
									<input type="checkbox" class="styCkboxNM" aria-label="Rollover Yes" style="">
										<xsl:call-template name="PopulateCheckbox">
											<xsl:with-param name="TargetNode" select="$FormData/PensionsAnnuitiesRolloverInd"/>
											<xsl:with-param name="BackupName">F1040PensionsAnnuitiesRolloverInd</xsl:with-param>
										</xsl:call-template>
									</input>
									<label style="padding-left:1mm;font-family:Arial;">
										<xsl:call-template name="PopulateLabel">
											<xsl:with-param name="TargetNode" select="$FormData/PensionsAnnuitiesRolloverInd"/>
											<xsl:with-param name="BackupName">F1040PensionsAnnuitiesRolloverInd</xsl:with-param>
										</xsl:call-template>Rollover</label>
									<!-- 5c (2) -->
									<span style="width:24mm;height:4mm;"/>
									<span style="font-weight:bold;font-family:Verdana;width:3.5mm;text-align:center;">2</span>
									<span style="width:2mm;"/>
									<input type="checkbox" class="styCkboxNM" aria-label="PSO Yes" style="">
										<xsl:call-template name="PopulateCheckbox">
											<xsl:with-param name="TargetNode" select="$FormData/PensionsAnnuitiesPSOInd"/>
											<xsl:with-param name="BackupName">F1040PensionsAnnuitiesPSOInd</xsl:with-param>
										</xsl:call-template>
									</input>
									<label style="padding-left:1mm;font-family:Arial;">
										<xsl:call-template name="PopulateLabel">
											<xsl:with-param name="TargetNode" select="$FormData/PensionsAnnuitiesPSOInd"/>
											<xsl:with-param name="BackupName">F1040PensionsAnnuitiesPSOInd</xsl:with-param>
										</xsl:call-template>PSO</label>
									<!-- 5(3) -->	
									<span style="width:17mm;height:4mm;"/>
									<span style="font-weight:bold;font-family:Verdana;width:3.5mm;text-align:center;">3</span>
									<span style="width:2mm;"/>
									<input type="checkbox" class="styCkboxNM" style="margin-right:1mm;" aria-label="Other Pensions and annuities Yes">
										<xsl:call-template name="PopulateCheckbox">
											<xsl:with-param name="TargetNode" select="$FormData/PensionsAnnuitiesOtherInd"/>
											<xsl:with-param name="BackupName">F1040PensionsAnnuitiesOtherInd</xsl:with-param>
										</xsl:call-template>
									</input>
									<span style="width:21mm;border-bottom:1px solid black;">
											<xsl:call-template name="LinkToLeftoverDataTableInline">
												<xsl:with-param name="Desc">Line 5(3) - Other Pension Code</xsl:with-param>
												<xsl:with-param name="TargetNode" select="$FormData/PensionsAnnuitiesOtherTypeCd"/>
											</xsl:call-template>
											<xsl:call-template name="LinkToLeftoverDataTableInline">
												<xsl:with-param name="Desc">Line 5(3) - Other Pension Text</xsl:with-param>
												<xsl:with-param name="TargetNode" select="$FormData/PensionsAnnuitiesOtherTypeTxt"/>
											</xsl:call-template>
									</span>	
							</div>
							<div class="sty1040SRRightNumBoxNBB" style="background-color:lightgrey;height:5.6mm;">&nbsp;</div>
							<div class="sty1040SRAmountBoxNBB" style="height:5.6mm;">&nbsp;</div>
						</div>
						<!-- Line 6 -->
						<div class="sty1040SRLN" style="min-height:4.6mm;">
							<div class="sty1040SRLeftNumBoxSD" style="height:5.6mm;">6a</div>
							<div class="sty1040SRDesc" style="width:40mm;height:5.6mm;">
								Social security benefits
							</div>
							<div class="sty1040SRRightNumBox" style="height:5.6mm;">6a</div>
							<div class="sty1040SRAmountBox" style="border-right-width:1px;height:5.6mm;">
								<span style="float:left;">
									<xsl:call-template name="LinkToLeftoverDataTableInline">
									<xsl:with-param name="Desc">Line 6a - Social Security Benefits Code</xsl:with-param>
									<xsl:with-param name="TargetNode" 
										select="$FormData/SocSecBnftAmt/@socSecBnftCd"/>
								</xsl:call-template>
								</span>
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/SocSecBnftAmt"/>
								</xsl:call-template>
							</div>
							<div class="styLNLeftLtrBox" style="width:7mm;padding-top:1.5mm;height:5.6mm;">b
							</div>
							<div class="sty1040SRDesc" style="width:40mm;height:5.6mm;">Taxable amount
								<span class="sty1040SRDotLn">...</span></div>
							<div class="sty1040SRRightNumBox" style="height:5.6mm;">6b</div>
							<div class="sty1040SRAmountBox" style="height:5.6mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/TaxableSocSecAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<!-- Line 6c -->
						<div class="sty1040SRLN" style="min-height:4.6mm;">
							<div class="styLNLeftNumBoxSD" style="padding-left:4.4mm;padding-top:1.7mm;height:5.6mm;">c</div>
							<div class="sty1040SRDesc" style="width:123mm;font-size:10.5pt;font-family:Arial Narrow;height:5.6mm;">
								If you elect to use the lump-sum election method, check here (see instructions) 
								<span style="float:right;">
									<span class="sty1040SRDotLn" style="float:none;margin-right:-11px;">..</span>
									<span style="width:4px;"/>
									<input type="checkbox" class="styCkboxNM" aria-label="lump sum election method" style="margin-right:11px;"
										alt="Lump Sum Election Method">
										<xsl:call-template name="PopulateCheckbox">
											<xsl:with-param name="TargetNode" select="$FormData/LumpSumElectionMethodInd"/>
											<xsl:with-param name="BackupName">IRS1040SRLumpSumElectionMethodInd</xsl:with-param>
										</xsl:call-template>
									</input>
								</span>
							</div>
							<div class="sty1040SRRightNumBoxNBB" style="background-color:lightgrey;height:5.6mm;">&nbsp;</div>
							<div class="sty1040SRAmountBoxNBB" style="height:5.6mm;">&nbsp;</div>
						</div>
						<!-- Line 6d -->
						<div class="sty1040SRLN" style="min-height:4.6mm;">
							<div class="styLNLeftNumBoxSD" style="padding-left:4.4mm;padding-top:1.7mm;height:8.6mm;">d</div>
							<div class="sty1040SRDesc" style="width:123mm;font-size:10.5pt;font-family:Arial;height:8.6mm;">
								If you are married filing separately and lived apart from your spouse the entire year (see inst.), check here 
								<span style="float:right;">
									<span class="sty1040SRDotLn" style="float:none;margin-right:-11px;">...............</span>
									<span style="width:4px;"/>
									<input type="checkbox" class="styCkboxNM" style="margin-right:6px;" aria-label="married filing separately and lived apart from spouse">
										<xsl:call-template name="PopulateCheckbox">
											<xsl:with-param name="TargetNode" select="$FormData/MFSLiveApartEntireYrInd"/>
											<xsl:with-param name="BackupName">IRS1040MFSLiveApartEntireYrInd</xsl:with-param>
										</xsl:call-template>
									</input>
								</span>
							</div>
							<div class="sty1040SRRightNumBoxNBB" style="background-color:lightgrey;height:8.6mm;">&nbsp;</div>
							<div class="sty1040SRAmountBoxNBB" style="height:8.6mm;">&nbsp;</div>
						</div>
						<!-- Line 7a -->
						<div class="sty1040SRLN" style="min-height:4.6mm;">
							<div class="sty1040SRLeftNumBoxSD" style="height:5.6mm;">7a</div>
							<div class="sty1040SRDesc" style="font-size:10.5pt;font-family:Arial;height:5.6mm;">
								<span style="width:120mm;">Capital gain or (loss). Attach Schedule D if required 
									<xsl:call-template name="LinkToLeftoverDataTableInline">
										<xsl:with-param name="Desc">Line 7 - Form 8814 Code</xsl:with-param>
										<xsl:with-param name="TargetNode" select="$FormData/Form8814Cd"/>
									</xsl:call-template>
									<xsl:call-template name="LinkToLeftoverDataTableInline">
										<xsl:with-param name="Desc">Line 7 - Form 8814 Amount</xsl:with-param>
										<xsl:with-param name="TargetNode" select="$FormData/Form8814Amt"/>
									</xsl:call-template>
									<span class="sty1040SRDotLn" style="float:right;">.......</span>
								</span>
							</div>
							<div class="sty1040SRRightNumBox" style="height:5.6mm;">7a</div>
							<div class="sty1040SRAmountBox" style="height:5.6mm;">
								<span style="float:left;">
									<xsl:call-template name="SetFormLinkInline">
										<xsl:with-param name="TargetNode" select="$FormData/CapitalGainLossAmt"/>
									</xsl:call-template>
								</span>
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/CapitalGainLossAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<!-- Line 7b -->
						<div class="sty1040SRLN" style="min-height:4.6mm;">
							<div class="sty1040SRLeftNumBoxSD" style="padding-left:4.4mm;height:9.6mm;">b</div>
							<div class="sty1040SRDesc" style="font-size:10.5pt;font-family:Arial;height:9.6mm;">
								<span style="width:120mm;">Check if: 
									<span style="width:2mm;"/>
							<!-- 7b - Sch D not required -->
								<input type="checkbox" class="styCkboxNM" aria-label="Schedule D not required" style="">
									<xsl:call-template name="PopulateCheckbox">
										<xsl:with-param name="TargetNode" select="$FormData/CapitalDistributionInd"/>
										<xsl:with-param name="BackupName">F1040CapitalDistributionInd</xsl:with-param>
									</xsl:call-template>
								</input>
								<label style="padding-left:1mm;font-family:Arial;">
									<xsl:call-template name="PopulateLabel">
										<xsl:with-param name="TargetNode" select="$FormData/CapitalDistributionInd"/>
										<xsl:with-param name="BackupName">F1040CapitalDistributionInd</xsl:with-param>
									</xsl:call-template>Schedule D not required</label>
									<br/>
								<!-- 7b - Includes child’s capital gain or (loss) -->
								<span style="width:17.5mm;"/>
								<input type="checkbox" class="styCkboxNM" aria-label="Includes child’s capital gain or (loss)" style="">
									<xsl:call-template name="PopulateCheckbox">
										<xsl:with-param name="TargetNode" select="$FormData/ChildCapitalGainOrLossIncldInd"/>
										<xsl:with-param name="BackupName">F1040ChildCapitalGainOrLossIncldInd</xsl:with-param>
									</xsl:call-template>
								</input>
								<label style="padding-left:1mm;font-family:Arial;">
									<xsl:call-template name="PopulateLabel">
										<xsl:with-param name="TargetNode" select="$FormData/ChildCapitalGainOrLossIncldInd"/>
										<xsl:with-param name="BackupName">F1040ChildCapitalGainOrLossIncldInd</xsl:with-param>
									</xsl:call-template>Includes child’s capital gain or (loss)</label>
								<!-- 7b- text -->	
								<span style="width:1mm;height:4mm;"/>
								<span style="width:30mm;border-bottom:1px solid black;text-align:right;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/Form8814Amt"/>
										</xsl:call-template>
								</span>	
								</span>
							</div>		
									<div class="sty1040SRRightNumBoxNBB" style="background-color:lightgrey;height:9.6mm;">&nbsp;</div>
									<div class="sty1040SRAmountBoxNBB" style="height:9.6mm;">&nbsp;</div>
						</div>
						<!-- Line 8 -->
						<div class="sty1040SRLN" style="min-height:4.6mm;">
							<div class="sty1040SRLeftNumBoxSD" style="height:5.6mm;">8</div>
							<div class="sty1040SRDesc" style="height:5.6mm;">Additional income from Schedule 1, line 10
								<span class="sty1040SRDotLn">.............</span></div>
							<div class="sty1040SRRightNumBox" style="height:5.6mm;">8</div>
							<div class="sty1040SRAmountBox" style="height:5.6mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" 
										select="$FormData/TotalAdditionalIncomeAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<!-- Line 9 -->
						<div class="sty1040SRLN" style="min-height:4.6mm;">
							<div class="sty1040SRLeftNumBoxSD" style="height:5.6mm;">9</div>
							<div class="sty1040SRDesc" style="height:5.6mm;">
								Add lines 1z, 2b, 3b, 4b, 5b, 6b, 7a, and 8. This is your <strong>total income</strong>
								<span style="float:right">
									<span class="sty1040SRDotLn" style="float:none;margin-right:-2px;">...</span>
								</span> 
							</div>
							<div class="sty1040SRRightNumBox" style="height:5.6mm;">9</div>
							<div class="sty1040SRAmountBox" style="height:5.6mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/TotalIncomeAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<!-- Line 10 -->
						<div class="sty1040SRLN" style="min-height:4.6mm;">
							<div class="sty1040SRLeftNumBoxSD" style="padding-left:.5mm;height:5.6mm;">10</div>
							<div class="sty1040SRDesc" style="height:5.6mm;">
								Adjustments to income from Schedule 1, line 26
								<span style="float:right">
									<span class="sty1040SRDotLn" style="float:none;margin-right:-2px;">...........</span>
								</span> 
							</div>
							<div class="sty1040SRRightNumBox" style="height:5.6mm;">10</div>
							<div class="sty1040SRAmountBox" style="height:5.6mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" 
										select="$FormData/TotalAdjustmentsAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<!-- Line 11a -->
						<div class="sty1040SRLN" style="min-height:4.6mm;">
							<div class="sty1040SRLeftNumBoxSD" style="padding-left:.5mm; height:5.6mm;">11a</div>
							<div class="sty1040SRDesc" style="height:5.6mm;">
								Subtract line 10 from line 9. This is your <strong>adjusted gross income</strong>
								<xsl:call-template name="LinkToLeftoverDataTableInline">
									<xsl:with-param name="Desc">Line 11 - Excluded Section 933 Puerto Rico Income Code</xsl:with-param>
									<xsl:with-param name="TargetNode" 
					select="$FormData/ExcldSect933PuertoRicoIncmAmt/@excldSect933PuertoRicoIncmCd"/>
								</xsl:call-template>
								<xsl:call-template name="LinkToLeftoverDataTableInline">
									<xsl:with-param name="Desc">Line 11 - Excluded Section 933 Puerto Rico Income Amount</xsl:with-param>
									<xsl:with-param name="TargetNode" 
										select="$FormData/ExcldSect933PuertoRicoIncmAmt"/>
								</xsl:call-template>
								<span style="float:right">
									<span class="sty1040SRDotLn" style="float:none;margin-right:-2px;">..</span>
								</span> 
							</div>
							<div class="sty1040SRRightNumBox" style="height:5.6mm;border-bottom-width:0px;">11a</div>
							<div class="sty1040SRAmountBox" style="height:5.6mm;border-bottom-width:0px;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" 
										select="$FormData/AdjustedGrossIncomeAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<!-- End of block 2a - 11a -->
						<!-- Begin of Block 11a - 11d -->
						<div class="styStdDiv" style="border-top:1px solid black;border-bottom:0px solid black;overflow:visible;">
							<div class="styGenericDiv" style="width:20mm;padding-top:1mm;padding-bottom:1mm;height:25mm;">
								<span style="padding-left:0mm;font-weight:bold;font-size:11pt;padding-bottom:1mm">Tax and</span>
								<span style="padding-left:0mm;font-weight:bold;font-size:11pt;padding-bottom:46mm;">Credits</span>	
							</div>
						<!-- Line 11b -->
						<div class="sty1040SRLN" style="min-height:4.6mm;">
							<div class="sty1040SRLeftNumBoxSD" style="padding-left:4.5mm; height:5.6mm;">b</div>
							<div class="sty1040SRDesc" style="height:5.6mm;">
								Amount from line 11a (adjusted gross income) 
								<span style="float:right">
									<span class="sty1040SRDotLn" style="float:none;margin-right:-2px;">...........</span>
								</span> 
							</div>
							<div class="sty1040SRRightNumBox" style="height:5.6mm;">11b</div>
							<div class="sty1040SRAmountBox" style="height:5.6mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/AdjustedGrossIncomeAmt"/>
								</xsl:call-template>
							</div>
						</div>
							<!-- Line 12a -->
						<div class="sty1040SRLN" style="min-height:4.6mm;">
							<div class="sty1040SRLeftNumBoxSD" style="padding-left:.5mm;height:5.6mm;">12a</div>
							<div class="sty1040SRDesc" style="font-size:8.5pt;font-family:Arial;height:5.6mm;">
								<span style="width:120mm;">Someone can claim
									<span style="width:0.5mm;"/>
							<!-- 12a - You as a dependent -->
									<input type="checkbox" class="styCkbox" aria-label="You as a dependent" style="">
										<xsl:call-template name="PopulateCheckbox">
											<xsl:with-param name="TargetNode" select="$FormData/PrimaryClaimAsDependentInd"/>
											<xsl:with-param name="BackupName">F1040PrimaryClaimAsDependentInd</xsl:with-param>
										</xsl:call-template>
									</input>
									<label style="padding-left:1mm;font-family:Arial;">
										<xsl:call-template name="PopulateLabel">
											<xsl:with-param name="TargetNode" select="$FormData/PrimaryClaimAsDependentInd"/>
											<xsl:with-param name="BackupName">F1040PrimaryClaimAsDependentInd</xsl:with-param>
										</xsl:call-template>You as a dependent</label>
									<!-- 12b - Your spouse as a dependent -->
									<span style="width:3.5mm;height:1mm;"/>
									<input type="checkbox" class="styCkbox" aria-label="Your spouse as a dependent" style="">
										<xsl:call-template name="PopulateCheckbox">
											<xsl:with-param name="TargetNode" select="$FormData/SpouseClaimAsDependentInd"/>
											<xsl:with-param name="BackupName">F1040SpouseClaimAsDependentInd</xsl:with-param>
										</xsl:call-template>
									</input>
									<label style="padding-left:1mm;font-family:Arial;">
										<xsl:call-template name="PopulateLabel">
											<xsl:with-param name="TargetNode" select="$FormData/SpouseClaimAsDependentInd"/>
											<xsl:with-param name="BackupName">F1040SpouseClaimAsDependentInd</xsl:with-param>
										</xsl:call-template>Your spouse as a dependent</label>
									<span style="width:1px"/>
									<xsl:call-template name="LinkToLeftoverDataTableInline">
										<xsl:with-param name="Desc">Standard Deduction - Exempt Spouse Name</xsl:with-param>
										<xsl:with-param name="TargetNode" select="$FormData/ExemptSpouseNm"/>
									</xsl:call-template>
									<xsl:call-template name="LinkToLeftoverDataTableInline">
										<xsl:with-param name="Desc">Standard Deduction - Exempt Spouse Name Control</xsl:with-param>
										<xsl:with-param name="TargetNode" select="$FormData/ExemptSpouseNameControlTxt"/>
									</xsl:call-template>
									<xsl:call-template name="LinkToLeftoverDataTableInline">
										<xsl:with-param name="Desc">Standard Deduction - Total Exempt Primary And Spouse Cnt</xsl:with-param>
										<xsl:with-param name="TargetNode" 
											select="$FormData/TotalExemptPrimaryAndSpouseCnt"/>
									</xsl:call-template>
								</span>
								</div>
									<div class="sty1040SRRightNumBoxNBB" style="background-color:lightgrey;height:5.6mm;">&nbsp;</div>
									<div class="sty1040SRAmountBoxNBB" style="height:5.6mm;">&nbsp;</div>
						</div>
							<!-- Line 12b -->
						<div class="sty1040SRLN" style="min-height:4.6mm;">
							<div class="sty1040SRLeftNumBoxSD" style="padding-left:4.5mm;height:5.6mm;">b</div>
							<div class="sty1040SRDesc" style="font-size:8.5pt;font-family:Arial;height:5.6mm;">
								<span style="width:120mm;">
									<span style="width:0.5mm;"/>
								<!-- 12b - Spouse itemizes on a separate return -->
									<input type="checkbox" class="styCkbox" aria-label="Spouse Must Itemize" style="">
										<xsl:call-template name="PopulateCheckbox">
											<xsl:with-param name="TargetNode" select="$FormData/MustItemizeInd"/>
											<xsl:with-param name="BackupName">F1040MustItemizeInd</xsl:with-param>
										</xsl:call-template>
									</input>
									<label style="padding-left:1mm;font-family:Arial;">
										<xsl:call-template name="PopulateLabel">
											<xsl:with-param name="TargetNode" select="$FormData/MustItemizeInd"/>
											<xsl:with-param name="BackupName">F1040MustItemizeInd</xsl:with-param>
										</xsl:call-template>Spouse itemizes on a separate return</label>
								<!-- 12c - Your spouse as a dependent -->
									<span style="width:5mm;height:1mm;"/>
									<span style="font-size:12px;"><strong>c</strong></span>
									<span style="width:1mm;height:1mm;"/>
									<input type="checkbox" class="styCkbox" aria-label="Dual Status Alien" style="">
										<xsl:call-template name="PopulateCheckbox">
											<xsl:with-param name="TargetNode" select="$FormData/DualStatusAlienInd"/>
											<xsl:with-param name="BackupName">F1040DualStatusAlienInd</xsl:with-param>
										</xsl:call-template>
									</input>
									<label style="padding-left:1mm;font-family:Arial;">
										<xsl:call-template name="PopulateLabel">
											<xsl:with-param name="TargetNode" select="$FormData/DualStatusAlienInd"/>
											<xsl:with-param name="BackupName">F1040DualStatusAlienInd</xsl:with-param>
										</xsl:call-template>You were a dual-status alien</label>
								</span>
								</div>
									<div class="sty1040SRRightNumBoxNBB" style="background-color:lightgrey;height:5.6mm;">&nbsp;</div>
									<div class="sty1040SRAmountBoxNBB" style="height:5.6mm;">&nbsp;</div>
						</div>
							<!-- Line 12d You -->
						<div class="sty1040SRLN" style="min-height:4.6mm;">
							<div class="sty1040SRLeftNumBoxSD" style="padding-left:4.5mm;height:5.6mm;">d</div>
							<div class="sty1040SRDesc" style="font-size:8.5pt;font-family:Arial;height:5.6mm;">
								<span style="width:120mm;"><strong>You:</strong>
									<span style="width:7mm;"/>
								<input type="checkbox" class="styCkbox" aria-label="Primary 65 Or Older" style="">
										<xsl:call-template name="PopulateCheckbox">
											<xsl:with-param name="TargetNode" select="$FormData/Primary65OrOlderInd"/>
											<xsl:with-param name="BackupName">F1040Primary65OrOlderInd</xsl:with-param>
										</xsl:call-template>
									</input>
									<label style="padding-left:1mm;font-family:Arial;">
										<xsl:call-template name="PopulateLabel">
											<xsl:with-param name="TargetNode" select="$FormData/Primary65OrOlderInd"/>
											<xsl:with-param name="BackupName">F1040Primary65OrOlderInd</xsl:with-param>
										</xsl:call-template>Were born before January 2, 1961</label>
									<!-- 12d - you blind -->
									<span style="width:9.5mm;height:1mm;"/>
									<input type="checkbox" class="styCkbox" aria-label="Primary Blind" style="">
										<xsl:call-template name="PopulateCheckbox">
											<xsl:with-param name="TargetNode" select="$FormData/PrimaryBlindInd"/>
											<xsl:with-param name="BackupName">F1040PrimaryBlindInd</xsl:with-param>
										</xsl:call-template>
									</input>
									<label style="padding-left:1mm;font-family:Arial;">
										<xsl:call-template name="PopulateLabel">
											<xsl:with-param name="TargetNode" select="$FormData/PrimaryBlindInd"/>
											<xsl:with-param name="BackupName">F1040PrimaryBlindInd</xsl:with-param>
										</xsl:call-template>Are Blind</label>
								</span>
								</div>
									<div class="sty1040SRRightNumBoxNBB" style="background-color:lightgrey;height:5.6mm;">&nbsp;</div>
									<div class="sty1040SRAmountBoxNBB" style="height:5.6mm;">&nbsp;</div>
						</div>
								<!-- Line 12d Spouse -->
						<div class="sty1040SRLN" style="min-height:4.6mm;">
							<div class="sty1040SRLeftNumBoxSD" style="padding-left:4.5mm;height:5.6mm;"></div>
							<div class="sty1040SRDesc" style="font-size:8.5pt;font-family:Arial;height:5.6mm;">
								<span style="width:120mm;"><strong>Spouse:</strong>
									<span style="width:0.5mm;"/>
							<span style="width:1.5mm;"/>
									<input type="checkbox" class="styCkbox" aria-label="Spouse 65 Or Older" style="">
										<xsl:call-template name="PopulateCheckbox">
											<xsl:with-param name="TargetNode" select="$FormData/Spouse65OrOlderInd"/>
											<xsl:with-param name="BackupName">F1040Spouse65OrOlderInd</xsl:with-param>
										</xsl:call-template>
									</input>
									<label style="padding-left:1mm;font-family:Arial;">
										<xsl:call-template name="PopulateLabel">
											<xsl:with-param name="TargetNode" select="$FormData/Spouse65OrOlderInd"/>
											<xsl:with-param name="BackupName">F1040Spouse65OrOlderInd</xsl:with-param>
										</xsl:call-template>Was born before January 2, 1961</label>
									<!-- 12c - Your spouse Blind -->
									<span style="width:10.5mm;height:1mm;"/>
									<input type="checkbox" class="styCkbox" aria-label="Spouse Blind" style="">
										<xsl:call-template name="PopulateCheckbox">
											<xsl:with-param name="TargetNode" select="$FormData/SpouseBlindInd"/>
											<xsl:with-param name="BackupName">F1040SpouseBlindInd</xsl:with-param>
										</xsl:call-template>
									</input>
									<label style="padding-left:1mm;font-family:Arial;">
										<xsl:call-template name="PopulateLabel">
											<xsl:with-param name="TargetNode" select="$FormData/SpouseBlindInd"/>
											<xsl:with-param name="BackupName">F1040SpouseBlindInd</xsl:with-param>
										</xsl:call-template>Is Blind</label>
									<span style="width:1mm;height:1mm;"/>
										<xsl:call-template name="LinkToLeftoverDataTableInline">
											<xsl:with-param name="Desc">Age/Blindness - Total Boxes Checked Count</xsl:with-param>
											<xsl:with-param name="TargetNode" select="$FormData/TotalBoxesCheckedCnt"/>
										</xsl:call-template>
								</span>
								</div>
									<div class="sty1040SRRightNumBoxNBB" style="background-color:lightgrey;height:5.6mm;">&nbsp;</div>
									<div class="sty1040SRAmountBoxNBB" style="height:5.6mm;">&nbsp;</div>
						</div>
						<!-- Standard Deduction Left Col. -->
						<div class="styGenericDiv" style="width:20mm;padding-top:-5mm;height:87mm;">	
							<div style="width:100%;border:1px solid black;border-radius:8px; border-right:1px solid black;padding-top:1mm;padding-left:1mm;font-family:Arial;font-size:10.5pt;font-weight:bold;">
								Standard Deduction<br/>
								<span style="float:left;width:16.5mm;font-size:7.5pt;font-family:Arial Narrow;font-weight:normal;padding-bottom:1mm;">
									See <span style="font-style:italic;">Standard<br/></span>
									<span style="font-style:italic;"> Deduction Chart</span><br/> on the last page of this form.
								</span>
							</div>
						</div>
						<!-- Line 12e -->
						<div class="sty1040SRLN">
							<div class="styLNLeftNumBoxSD" style="border-top:1px solid black;
								border-bottom:1px solid black;border-left:2px solid  white;
								padding-left:4.5mm;margin-left:-2px;margin-right:2px;margin-top:8px;height:5.2mm;">e</div>
							<div class="sty1040SRDesc" style="padding-top:3mm;height:5.2mm;">
								<strong>Standard deduction or itemized deductions </strong> (from Schedule A) 
								<span class="sty1040SRDotLn">....</span>
							</div>
							<div class="sty1040SRRightNumBox" style="padding-top:2.5mm;height:7.5mm;">12e</div>
							<div class="sty1040SRAmountBox" style="padding-top:2.5mm;height:7.5mm;">
							<span style="float:left;padding-left:0.5mm;">
								<xsl:call-template name="LinkToLeftoverDataTableInline">
									<xsl:with-param name="Desc">Line 12a - Modified Standard Deduction Ind</xsl:with-param>
									<xsl:with-param name="TargetNode" select="$FormData/TotalItemizedOrStandardDedAmt/@modifiedStandardDeductionInd"/>
								</xsl:call-template>
							</span>
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/TotalItemizedOrStandardDedAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<!-- Line 13a -->
						<div class="sty1040SRLN">
							<div class="sty1040SRLeftNumBox" style="padding-left:1.5mm;margin-left:-2px;margin-right:2px;">13a</div>
							<div class="sty1040SRDesc">
								Qualified business income deduction from Form 8995 or Form 8995-A
								<span style="float:right">
									<span class="sty1040SRDotLn" 
									 style="float:none;margin-right:-2px;">..</span>
									<span style="width:8px;"/>
								</span>
							</div>
							<div class="sty1040SRRightNumBox">13a</div>
							<div class="sty1040SRAmountBox">
								<span style="float:left;">
									<xsl:call-template name="SetFormLinkInline">
										<xsl:with-param name="TargetNode" 
											select="$FormData/QualifiedBusinessIncomeDedAmt"/>
									</xsl:call-template>
								</span>
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode"
										select="$FormData/QualifiedBusinessIncomeDedAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<!-- Line 13b -->
						<div class="sty1040SRLN">
							<div class="sty1040SRLeftNumBox" style="padding-left:5.3mm;margin-left:-2px;margin-right:2px;">b</div>
							<div class="sty1040SRDesc">
								Additional deductions from Schedule 1-A, line 38
								<span style="float:right">
									<span class="sty1040SRDotLn" 
									 style="float:none;margin-right:-2px;">..........</span>
									<span style="width:8px;"/>
								</span>
							</div>
							<div class="sty1040SRRightNumBox">13b</div>
							<div class="sty1040SRAmountBox">
								<span style="float:left;">
									<xsl:call-template name="SetFormLinkInline">
										<xsl:with-param name="TargetNode" 
											select="$FormData/TotalAdditionalDeductionsAmt"/>
									</xsl:call-template>
								</span>
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode"
										select="$FormData/TotalAdditionalDeductionsAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<!-- Line 14 -->
						<div class="sty1040SRLN">
							<div class="sty1040SRLeftNumBox" style="padding-left:1.5mm;margin-left:-2px;margin-right:2px;">14</div>
							<div class="sty1040SRDesc">
								Add lines 12e, 13a, and 13b
								<span style="float:right">
									<span class="sty1040SRDotLn" 
									 style="float:none;margin-right:-2px;">..................</span>
									<span style="width:8px;"/>
								</span>
							</div>
							<div class="sty1040SRRightNumBox">14</div>
							<div class="sty1040SRAmountBox">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/TotalDeductionsAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<!-- Line 15 -->
						<div class="sty1040SRLN">
							<div class="sty1040SRLeftNumBox" style="padding-left:1.5mm;margin-left:-2px;margin-right:2px;">15</div>
							<div class="sty1040SRDesc" style="font-size:10.5pt;font-family:Arial Narrow">
								 Subtract line 14 from line 11b. If zero or less, enter -0-. This is your <strong>taxable income. </strong>
								<xsl:call-template name="LinkToLeftoverDataTableInline">
									<xsl:with-param name="Desc">Line 15 - Capital Construction Fund Code</xsl:with-param>
									<xsl:with-param name="TargetNode" 
									select="$FormData/TaxableIncomeAmt/@capitalConstructionFundCd"/>
								</xsl:call-template>
								<xsl:call-template name="LinkToLeftoverDataTableInline">
									<xsl:with-param name="Desc">Line 15 - Capital Construction Fund Amount</xsl:with-param>
									<xsl:with-param name="TargetNode" select="$FormData/TaxableIncomeAmt/@capitalConstructionFundAmt"/>
								</xsl:call-template>
							</div>
							<div class="sty1040SRRightNumBoxNBB" style="border-bottom:1px solid black;">15</div>
							<div class="sty1040SRAmountBoxNBB" style="border-bottom:1px solid black;">
								<span style="float:left;">
									<xsl:call-template name="LinkToLeftoverDataTableInline">
										<xsl:with-param name="Desc">Line 15 - Schedule Q Code</xsl:with-param>
										<xsl:with-param name="TargetNode" select="$FormData/ScheduleQCd"/>
									</xsl:call-template>
								</span>
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/TaxableIncomeAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<!-- Line 16 -->
						<div class="sty1040SRLN">
							<div class="sty1040SRLeftNumBox">16</div>
							<div class="sty1040SRDesc">
								<span style="font-weight:bold;">Tax </span> (see instructions). Check if any from: 
								<xsl:call-template name="LinkToLeftoverDataTableInline">
									<xsl:with-param name="Desc">Line 16(1) - Child Interest and Dividend Tax Amount</xsl:with-param>
									<xsl:with-param name="TargetNode" 
										select="$FormData/Form8814Ind/@childInterestAndDividendTaxAmt"/>
								</xsl:call-template>
							</div>
							<div class="sty1040SRRightNumBoxNBB" style="background-color:lightgrey;">&nbsp;
							</div>
							<div class="sty1040SRAmountBoxNBB" style="text-align:left;">&nbsp;</div>
						</div>
						<div class="sty1040SRLN">
							<div class="sty1040SRLeftNumBox">&nbsp;</div>
							<div class="sty1040SRDesc" style="">
								<span style="font-weight:bold;width:5mm;text-align:center;">1</span>
								<input type="checkbox" class="styCkboxNM" style="" alt="Form 8814 Ind">
									<xsl:call-template name="PopulateCheckbox">
										<xsl:with-param name="TargetNode" select="$FormData/Form8814Ind"/>
										<xsl:with-param name="BackupName">F1040SRForm8814Ind</xsl:with-param>
									</xsl:call-template>
								</input>
								<label style="padding-left:1mm;">
									<xsl:call-template name="PopulateLabel">
										<xsl:with-param name="TargetNode" select="$FormData/Form8814Ind"/>
										<xsl:with-param name="BackupName">F1040SRForm8814Ind</xsl:with-param>
									</xsl:call-template> Form(s) 8814</label>
								<xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode" select="$FormData/Form8814Ind"/>
								</xsl:call-template>
								<span style="width:3mm;height:3mm;"/>
								<span style="font-weight:bold;width:5mm;text-align:center;">2</span>
								<input type="checkbox" class="styCkboxNM" style="" alt="Form 4972 Ind">
									<xsl:call-template name="PopulateCheckbox">
										<xsl:with-param name="TargetNode" select="$FormData/Form4972Ind"/>
										<xsl:with-param name="BackupName">F1040SRForm4972Ind</xsl:with-param>
									</xsl:call-template>
								</input>
								<label style="padding-left:2mm;">
									<xsl:call-template name="PopulateLabel">
										<xsl:with-param name="TargetNode" select="$FormData/Form4972Ind"/>
										<xsl:with-param name="BackupName">F1040Form4972Ind</xsl:with-param>
									</xsl:call-template> Form(s) 4972</label>
									<xsl:call-template name="SetFormLinkInline">
										<xsl:with-param name="TargetNode" select="$FormData/Form4972Ind"/>
									</xsl:call-template>
								<span style="width:3mm;height:3mm;"/>
								<span style="font-weight:bold;width:5mm;text-align:center;">3</span>
								<input type="checkbox" class="styCkboxNM" style="margin-right:1mm;" 
									alt="Other Tax Amounts">
									<xsl:call-template name="PopulateCheckbox">
										<xsl:with-param name="TargetNode" select="$FormData/OtherTaxAmtInd"/>
										<xsl:with-param name="BackupName">F1040SROtherTaxAmtInd</xsl:with-param>
									</xsl:call-template>
								</input>
								<span style="width:20mm;border-bottom:1px solid black;">
									<xsl:call-template name="SetFormLinkInline">
										<xsl:with-param name="TargetNode" select="$FormData/OtherTaxAmtInd"/>
									</xsl:call-template>
									<xsl:if test="count($FormData/OtherTaxAmtGrp) &lt; 2">
										<xsl:call-template name="LinkToLeftoverDataTableInline">
											<xsl:with-param name="Desc">Line 16(3) - Other Tax Amount Code</xsl:with-param>
											<xsl:with-param name="TargetNode"
												select="$FormData/OtherTaxAmtGrp/OtherTaxAmtCd"/>
										</xsl:call-template>
										<xsl:call-template name="LinkToLeftoverDataTableInline">
											<xsl:with-param name="Desc">Line 16(3) - Other Tax Text</xsl:with-param>
											<xsl:with-param name="TargetNode"
												select="$FormData/OtherTaxAmtGrp/OtherTaxTxt"/>
										</xsl:call-template>
										<xsl:call-template name="LinkToLeftoverDataTableInline">
											<xsl:with-param name="Desc">Line 16(3) - Other Tax Amount</xsl:with-param>
											<xsl:with-param name="TargetNode"
												select="$FormData/OtherTaxAmtGrp/OtherTaxAmt"/>
										</xsl:call-template>
									</xsl:if>
									<xsl:if test="count($FormData/OtherTaxAmtGrp) &gt;= 2">
										<xsl:call-template name="LinkToLeftoverDataTableInline">
											<xsl:with-param name="Desc">Line 16(3) - Other Tax Groups</xsl:with-param>
											<xsl:with-param name="TargetNode" 
												select="$FormData/OtherTaxAmtGrp"/>
										</xsl:call-template>
									</xsl:if>
								</span>
								<span class="sty1040SRDotLn" style="">....</span>
							</div>
							<div class="sty1040SRRightNumBox">16</div>
							<div class="sty1040SRAmountBox">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/TaxAmt"/>
								</xsl:call-template>
							</div>
						</div>		
						<!-- Line 17 -->
						<div class="sty1040SRLN">
							<div class="sty1040SRLeftNumBoxSD" style="padding-left:1mm;">17</div>
							<div class="sty1040SRDesc">
								Amount from Schedule 2, line 3
								<span class="sty1040SRDotLn" style="">................</span>
							</div>
							<div class="sty1040SRRightNumBox">17</div>
							<div class="sty1040SRAmountBox">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" 
										select="$FormData/AdditionalTaxAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<!-- Line 18 -->
						<div class="sty1040SRLN">
							<div class="sty1040SRLeftNumBoxSD" style="padding-left:1mm;">18</div>
							<div class="sty1040SRDesc">
								Add lines 16 and 17
								<span class="sty1040SRDotLn" style="">.....................</span>
							</div>
							<div class="sty1040SRRightNumBox">18</div>
							<div class="sty1040SRAmountBox">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" 
										select="$FormData/TotalTaxBeforeCrAndOthTaxesAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<!-- Line 19 -->
						<div class="sty1040SRLN">
							<div class="styLNLeftNumBox" style="padding-left:1mm;padding-top:1.5mm">19</div>
							<div class="sty1040SRDesc" style="width:123mm;">
								Child tax credit or credit for other dependents from Schedule 8812
								<span class="sty1040SRDotLn" style="padding-right:1.7px;">....</span>
							</div>
							<div class="sty1040SRRightNumBox">19</div>
							<div class="sty1040SRAmountBox">
								<span style="float:left;">
									<xsl:call-template name="SetFormLinkInline">
										<xsl:with-param name="TargetNode" select="$FormData/CTCODCAmt"/>
									</xsl:call-template>
								</span>
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/CTCODCAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<!-- Line 20 -->
						<div class="sty1040SRLN">
							<div class="sty1040SRLeftNumBox">20</div>
							<div class="sty1040SRDesc" style="">
								Amount from Schedule 3, line 8
								<span class="sty1040SRDotLn">.................</span>
							</div>
							<div class="sty1040SRRightNumBox">20</div>
							<div class="sty1040SRAmountBox">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode"
										select="$FormData/TotalNonrefundableCreditsAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<!-- Line 21 -->
						<div class="sty1040SRLN">
							<div class="sty1040SRLeftNumBox">21</div>
							<div class="sty1040SRDesc" style="">
								Add lines 19 and 20
								<span class="sty1040SRDotLn">.....................</span>
							</div>
							<div class="sty1040SRRightNumBox">21</div>
							<div class="sty1040SRAmountBox">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode"
										select="$FormData/TotalCreditsAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<!-- Line 22 -->
						<div class="sty1040SRLN">
							<div class="sty1040SRLeftNumBox">22</div>
							<div class="sty1040SRDesc">
								Subtract line 21 from line 18. If zero or less, enter -0-
								<span class="sty1040SRDotLn">........</span>
							</div>
							<div class="sty1040SRRightNumBox">22</div>
							<div class="sty1040SRAmountBox">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/TaxLessCreditsAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<!-- Line 23 -->
						<div class="sty1040SRLN">
							<div class="sty1040SRLeftNumBox">23</div>
							<div class="sty1040SRDesc">
								Other taxes, including self-employment tax, from Schedule 2, line 21
									<span class="sty1040SRDotLn">...</span>
							</div>
							<div class="sty1040SRRightNumBox">23</div>
							<div class="sty1040SRAmountBox">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/TotalOtherTaxesAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<!-- Line 24 -->
						<div class="sty1040SRLN">
							<div class="sty1040SRLeftNumBox">24</div>
							<div class="sty1040SRDesc">
								Add lines 22 and 23. This is your <strong>total tax </strong> 
								<xsl:call-template name="LinkToLeftoverDataTableInline">
									<xsl:with-param name="Desc">Line 24 - Deferred Tax 1 Total Tax Deferred Amount</xsl:with-param>
									<xsl:with-param name="TargetNode" 
									select="$FormData/Form8854DeferredTaxGrp[1]/TotalTaxDeferredAmt"/>
								</xsl:call-template>
								<xsl:call-template name="LinkToLeftoverDataTableInline">
									<xsl:with-param name="Desc">Line 24 - Deferred Tax 1 Expatriation Code</xsl:with-param>
									<xsl:with-param name="TargetNode" 
									select="$FormData/Form8854DeferredTaxGrp[1]/ExpatriationCd"/>
								</xsl:call-template>
								<xsl:call-template name="LinkToLeftoverDataTableInline">
									<xsl:with-param name="Desc">Line 24 - Deferred Tax 2 Total Tax Deferred Amount</xsl:with-param>
									<xsl:with-param name="TargetNode" 
									select="$FormData/Form8854DeferredTaxGrp[2]/TotalTaxDeferredAmt"/>
								</xsl:call-template>
								<xsl:call-template name="LinkToLeftoverDataTableInline">
									<xsl:with-param name="Desc">Line 24 - Deferred Tax 2 Expatriation Code</xsl:with-param>
									<xsl:with-param name="TargetNode"
									 select="$FormData/Form8854DeferredTaxGrp[2]/ExpatriationCd"/>
								</xsl:call-template>
								<span style="float:right">
									<span class="sty1040SRDotLn" style="float:none;margin-right:-8px;">..........</span>
									<span style="width:8px;"/>
								</span>
							</div>
							<div class="sty1040SRRightNumBox" style="border-bottom:0mm">24</div>
							<div class="sty1040SRAmountBox" style="border-bottom:0mm">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/TotalTaxAmt"/>
								</xsl:call-template>
							</div>
						</div>
					</div>
					<!-- End -->
					<!-- Form footer-->
					<div class="styStdDiv pageEnd" style="border-top:1px solid black;font-size:7.5pt">
						Go to <span style="display:inline;font-style:italic;">www.irs.gov/Form1040SR</span>
						for instructions and the latest information.
						<span style="float:right;">Form <strong style="font-size:10pt;">
							1040-SR</strong> (2025)</span>
					</div>
					<!-- Page 3 -->
					<div class="styStdDiv" style="border-bottom:1px solid black;font-size:7pt;
						font-family:Verdana;">Form 1040-SR (2025)
						<div style="float:right;">Page <strong>3</strong></div>
					</div>
					<div class="styStdDiv" style="border-top:1px solid black;overflow:visible;">
						<div class="styGenericDiv" style="width:20mm;padding-top:0mm;padding-bottom:1mm;">
							<span style="padding-left:.5mm;font-weight:bold;font-size:11pt;padding-bottom:22mm;padding-top:1.5mm">Payments and Refundable Credits</span>
							<div style="width:100%;border:1px solid black;border-radius:8px;padding-top:2mm;padding-left:0mm;font-family:Arial;">
								<span style="width:1.9mm;height:5mm;float:left;"></span>
								<span style="float:left;width:16.5mm;font-size:7.5pt;font-family:Arial Narrow;">If you have a<br/>qualifying child, you may need to<br/>attach Sch. EIC.</span>
								<br />
								<span style="width:1.5mm;height:2mm;float:left;"></span>
								<span style="float:left;width:16.5mm;"></span>
							</div>
							<div style="height:46mm;"></div>		
						</div>
						<!-- Line 25 -->
						<div class="sty1040SRLN">
							<div class="sty1040SRLeftNumBoxSD"	style="padding-left:1mm;">25</div>
							<div class="sty1040SRDesc" style="width:87mm;">
								Federal income tax withheld from:
							</div>
							<div class="sty1040SRRightNumBox" style="border-bottom-width:0mm;
								border-left-width:0mm">
							</div>
							<div class="sty1040SRAmountBox" style="border-bottom-width:0mm;
								border-left-width:0mm">
							</div>
							<div class="sty1040SRRightNumBoxNBB" 
								style="background-color:lightgrey;">&nbsp;</div>
							<div class="sty1040SRAmountBoxNBB" style="">&nbsp;</div>
						</div>	
						<div class="sty1040SRLN">	
							<div class="sty1040SRLeftNumBoxSD"	style="padding-left:4.8mm;">a</div>
							<div class="sty1040SRDesc" style="width:87mm;">
								<span style="padding-top:0mm;">Form(s) W-2 
									<span style="width:2mm"/><span class="sty1040SRDotLn">...............</span>
								</span>	
							</div>
							<div class="sty1040SRRightNumBox" style="text-align:center;">25a</div>
							<div class="sty1040SRAmountBox" style="padding-top:2mm">
									<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" 
										select="$FormData/FormW2WithheldTaxAmt"/>
								</xsl:call-template>
							</div>
							<div class="sty1040SRRightNumBoxNBB" style="background-color:lightgrey;">
								&nbsp;</div>
							<div class="sty1040SRAmountBoxNBB" style="">&nbsp;</div>
						</div>
						<div class="sty1040SRLN">	
							<div class="sty1040SRLeftNumBoxSD"	style="padding-left:4.8mm;">b</div>
							<div class="sty1040SRDesc" style="width:87mm;">
								<span style="padding-top:0mm;">Form(s) 1099
									<span style="width:.5mm"/><span class="sty1040SRDotLn">...............</span>
								</span>	
							</div>
							<div class="sty1040SRRightNumBox" style="text-align:center;">25b</div>
							<div class="sty1040SRAmountBox" style="padding-top:2mm;">
								<span style="float:left;">
									<xsl:call-template name="SetFormLinkInline">
										<xsl:with-param name="TargetNode" 
											select="$FormData/Form1099WithheldTaxAmt"/>
									</xsl:call-template>
								</span>
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" 
										select="$FormData/Form1099WithheldTaxAmt"/>
								</xsl:call-template>
							</div>
							<div class="sty1040SRRightNumBoxNBB" 
								style="background-color:lightgrey;">&nbsp;</div>
							<div class="sty1040SRAmountBoxNBB" style="">&nbsp;</div>
						</div>
						<div class="sty1040SRLN">	
							<div class="sty1040SRLeftNumBoxSD"	style="padding-left:4.8mm;">c</div>
							<div class="sty1040SRDesc" style="width:87mm;">
								<span style="padding-top:0mm;">Other forms (see instructions)
									<span style="width:.5mm"/><span class="sty1040SRDotLn">.........</span>
								</span>	
							</div>
							<div class="sty1040SRRightNumBox" style="text-align:center;">25c</div>
							<div class="sty1040SRAmountBox" style="padding-top:2mm;">
								<span style="float:left;">
									<xsl:call-template name="SetFormLinkInline">
										<xsl:with-param name="TargetNode" 
											select="$FormData/TaxWithheldOtherAmt"/>
									</xsl:call-template>
								</span>
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" 
										select="$FormData/TaxWithheldOtherAmt"/>
								</xsl:call-template>
							</div>
							<div class="sty1040SRRightNumBoxNBB" 
								style="background-color:lightgrey;">&nbsp;</div>
							<div class="sty1040SRAmountBoxNBB" style="">&nbsp;</div>
						</div>
						<div class="sty1040SRLN">
							<div class="sty1040SRLeftNumBoxSD" style="padding-left:4.8mm">d</div>
							<div class="sty1040SRDesc">
								Add lines 25a through 25c 
								<span class="sty1040SRDotLn" style="">...................</span>
							</div>
							<div class="sty1040SRRightNumBox">25d</div>
							<div class="sty1040SRAmountBox">
								<span style="float:left;">
									<xsl:call-template name="SetFormLinkInline">
										<xsl:with-param name="TargetNode" 
											select="$FormData/WithholdingTaxAmt"/>
									</xsl:call-template>
								</span>
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" 
										select="$FormData/WithholdingTaxAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<!-- Line 26 -->
						<div class="sty1040SRLN">
							<div class="sty1040SRLeftNumBox">26</div>
							<div class="sty1040SRDesc">
								2025 estimated tax payments and amount applied from 2024 return
								<xsl:call-template name="LinkToLeftoverDataTableInline">
									<xsl:with-param name="Desc">Line 26 - Divorced Spouse SSN</xsl:with-param>
									<xsl:with-param name="TargetNode" 
										select="$FormData/EstimatedTaxPaymentsAmt/@divorcedSpouseSSN"/>
								</xsl:call-template>
								<xsl:call-template name="LinkToLeftoverDataTableInline">
									<xsl:with-param name="Desc">Line 26 - Divorced Literal Code</xsl:with-param>
									<xsl:with-param name="TargetNode" 
										select="$FormData/EstimatedTaxPaymentsAmt/@divorcedLiteralCd"/>
								</xsl:call-template>
								<span class="sty1040SRDotLn">..</span>
							</div>
							<div class="sty1040SRRightNumBox">26</div>
							<div class="sty1040SRAmountBox">
								<span style="float:left;">
									<xsl:call-template name="SetFormLinkInline">
										<xsl:with-param name="TargetNode"
											select="$FormData/EstimatedTaxPaymentsAmt"/>
									</xsl:call-template>
								</span>
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode"
										select="$FormData/EstimatedTaxPaymentsAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<!-- Line 26 SSN -->
						<div class="sty1040SRLN">
							<div class="sty1040SRLeftNumBox" style="height:8.6mm;"></div>
							<div class="sty1040SRDesc" style="height:8.6mm;">
								If you made estimated tax payments with your former spouse in 2025, <br/>
								enter their SSN (see instructions):
								<span style="width:1mm;height:3.6mm;"/>
									<span style="width:30mm;border-bottom:1px solid black;text-align:right;">
											<xsl:call-template name="LinkToLeftoverDataTableInline">
									<xsl:with-param name="Desc">Line 26 - Divorced Spouse SSN</xsl:with-param>
									<xsl:with-param name="TargetNode" select="$FormData/EstimatedTaxPaymentsAmt/@divorcedSpouseSSN"/>
								</xsl:call-template>
								<xsl:call-template name="LinkToLeftoverDataTableInline">
										<xsl:with-param name="Desc">Line 26 - Divorced Literal Cd</xsl:with-param>
										<xsl:with-param name="TargetNode" select="$FormData/EstimatedTaxPaymentsAmt/@divorcedLiteralCd"/>
									</xsl:call-template>	
									</span>	
							</div>
							<div class="sty1040SRRightNumBoxNBB" style="background-color:lightgrey;height:8.6mm;">&nbsp;</div>
							<div class="sty1040SRAmountBoxNBB" style="height:8.6mm;">&nbsp;</div>
						</div>
						<!-- Line 27a -->
						<div class="sty1040SRLN">
							<div class="sty1040SRLeftNumBoxSD" style="border-top:1px solid black;
								border-bottom:1px solid black;border-left:3px solid white;
								margin-left:-2px;margin-right:2px;padding-left:1mm;
								padding-top:1mm">27a</div>
							<div class="sty1040SRDesc" style="width:87mm;padding-top:1.7mm;">
								Earned income credit (EIC) 
								<xsl:call-template name="LinkToLeftoverDataTableInline">
									<xsl:with-param name="Desc">Line 27 - Earned Income Credit Eligibility Literal Code</xsl:with-param>
									<xsl:with-param name="TargetNode" 
										select="$FormData/EICEligibilityLiteralCd"/>
								</xsl:call-template>
								<span class="sty1040SRDotLn">........</span>
							</div>
							<div class="sty1040SRRightNumBox">27a</div>
							<div class="sty1040SRAmountBox">
								<span style="float:left;">
									<xsl:call-template name="SetFormLinkInline">
										<xsl:with-param name="TargetNode" 
											select="$FormData/EarnedIncomeCreditAmt"/>
									</xsl:call-template>
								</span>
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" 
										select="$FormData/EarnedIncomeCreditAmt"/>
								</xsl:call-template>
							</div>
							<div class="sty1040SRRightNumBoxNBB" style="background-color:lightgrey;">&nbsp;</div>
							<div class="sty1040SRAmountBoxNBB" style="">&nbsp;</div>
						</div>
						<!-- Line 27b -->
						<div class="sty1040SRLN" style="min-height:4.6mm;">
							<div class="styLNLeftNumBoxSD" style="padding-left:4.4mm;padding-top:1.7mm;">b</div>
							<div class="sty1040SRDesc" style="width:123mm;font-size:10.5pt;font-family:Arial;">
								Clergy filing Schedule SE (see instructions) 
								<span style="float:right;">
									<span class="sty1040SRDotLn" style="float:none;margin-right:-11px;">...........</span>
									<span style="width:4px;"/>
									<input type="checkbox" class="styCkbox" style="margin-right:6px;" aria-label="Clergy Indicator">
										<xsl:call-template name="PopulateCheckbox">
											<xsl:with-param name="TargetNode" select="$FormData/ClergyMemberInd"/>
											<xsl:with-param name="BackupName">IRS1040ClergyMemberInd</xsl:with-param>
										</xsl:call-template>
									</input>
								</span>
							</div>
							<div class="sty1040SRRightNumBoxNBB" style="background-color:lightgrey;">&nbsp;</div>
							<div class="sty1040SRAmountBoxNBB" style="">&nbsp;</div>
						</div>
						<!-- Line 27c -->
						<div class="sty1040SRLN" style="min-height:4.6mm;">
							<div class="styLNLeftNumBoxSD" style="padding-left:4.4mm;padding-top:1.7mm;">c</div>
							<div class="sty1040SRDesc" style="width:123mm;font-size:10.5pt;font-family:Arial;">
								If you do not want to claim the EIC, check here
								<span style="float:right;">
									<span class="sty1040SRDotLn" style="float:none;margin-right:-11px;">.........</span>
									<span style="width:4px;"/>
									<input type="checkbox" class="styCkbox" style="margin-right:6px;" aria-label="Do Not Want To Claim EIC Indicator">
										<xsl:call-template name="PopulateCheckbox">
											<xsl:with-param name="TargetNode" select="$FormData/DoNotClaimEICInd"/>
											<xsl:with-param name="BackupName">IRS1040DoNotClaimEICInd</xsl:with-param>
										</xsl:call-template>
									</input>
								</span>
							</div>
							<div class="sty1040SRRightNumBoxNBB" style="background-color:lightgrey;">&nbsp;</div>
							<div class="sty1040SRAmountBoxNBB" style="">&nbsp;</div>
						</div>
						<!-- Line 28 -->
						<div class="sty1040SRLN" style="min-height:4.5mm">
							<div class="sty1040SRLeftNumBoxSD" style="padding-left:1mm;height:8.5mm;">28</div>
							<div class="sty1040SRDesc" style="width:87mm;height:8.5mm;">
								Additional child tax credit (ACTC) from Schedule 8812. If you do not want to claim the ACTC, check here
								<xsl:call-template name="LinkToLeftoverDataTableInline">
									<xsl:with-param name="Desc">Line 28 - Additional Child Tax Credit Opt Out Indicator</xsl:with-param>
									<xsl:with-param name="TargetNode" select="$FormData/DoNotClaimACTCInd"/>
								</xsl:call-template>
								<span style="float:right;">
									<input type="checkbox" class="styCkbox" style="margin-right:6px;" aria-label="Additional Child Tax Credit Opt Out Indicator">
										<xsl:call-template name="PopulateCheckbox">
											<xsl:with-param name="TargetNode" select="$FormData/DoNotClaimACTCInd"/>
											<xsl:with-param name="BackupName">IRS1040DoNotClaimACTCInd</xsl:with-param>
										</xsl:call-template>
									</input>
								</span>
							</div>
							<div class="sty1040SRRightNumBox" style="height:8.5mm;padding-top:4.5mm">28</div>
							<div class="sty1040SRAmountBox" style="height:8.5mm;padding-top:4.5mm">
								<span style="float:left;">
									<xsl:call-template name="SetFormLinkInline">
										<xsl:with-param name="TargetNode"
											select="$FormData/AdditionalChildTaxCreditAmt"/>
									</xsl:call-template>
								</span>
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" 
										select="$FormData/AdditionalChildTaxCreditAmt"/>
								</xsl:call-template>
							</div>
							<div class="sty1040SRRightNumBoxNBB" style="height:8.5mm;background-color:lightgrey;">&nbsp;
							</div>
							<div class="sty1040SRAmountBoxNBB" style="height:8.5mm;">&nbsp;</div>
						</div>
						<!-- Line 29 -->
						<div class="sty1040SRLN">
							<div class="sty1040SRLeftNumBoxSD" style="padding-left:1mm;">29</div>
							<div class="sty1040SRDesc" style="width:87mm;">
								American opportunity credit from Form 8863, line 8
								<span class="sty1040SRDotLn">.</span>
							</div>
							<div class="sty1040SRRightNumBox">29</div>
							<div class="sty1040SRAmountBox">
								<span style="float:left;">
									<xsl:call-template name="SetFormLinkInline">
										<xsl:with-param name="TargetNode" 
										select="$FormData/RefundableAmerOppCreditAmt"/>
									</xsl:call-template>
								</span>
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" 
									select="$FormData/RefundableAmerOppCreditAmt"/>
								</xsl:call-template>
							</div>
							<div class="sty1040SRRightNumBoxNBB" style="background-color:lightgrey;">&nbsp;
							</div>
							<div class="sty1040SRAmountBoxNBB" style="">&nbsp;</div>
						</div>
						<!-- Line 30 -->
						<div class="sty1040SRLN">
							<div class="sty1040SRLeftNumBoxSD" style="padding-left:1mm;">30</div>
							<div class="sty1040SRDesc" style="width:87mm;">
								Refundable adoption credit from Form 8839, line 13
								<span class="sty1040SRDotLn">.</span>
							</div>
							<div class="sty1040SRRightNumBox">30</div>
							<div class="sty1040SRAmountBox">
							<span style="float:left;">
									<xsl:call-template name="SetFormLinkInline">
										<xsl:with-param name="TargetNode" select="$FormData/RefundableAdoptionCreditAmt"/>
									</xsl:call-template>
								</span>
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/RefundableAdoptionCreditAmt"/>
								</xsl:call-template>
							</div>
							<div class="sty1040SRRightNumBoxNBB" style="background-color:lightgrey;">&nbsp;
							</div>
							<div class="sty1040SRAmountBoxNBB" style="">&nbsp;</div>
						</div>
						<!-- Line 31 -->
						<div class="sty1040SRLN">
							<div class="sty1040SRLeftNumBoxSD" style="padding-left:1mm;">31</div>
							<div class="sty1040SRDesc" style="width:87mm;">
								Amount from Schedule 3, line 15
								<span class="sty1040SRDotLn">.......</span>
							</div>
							<div class="sty1040SRRightNumBox">31</div>
							<div class="sty1040SRAmountBox">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode"
										select="$FormData/TotalOtherPaymentsRfdblCrAmt"/>
								</xsl:call-template>
							</div>
							<div class="sty1040SRRightNumBoxNBB" style="background-color:lightgrey;">&nbsp;
							</div>
							<div class="sty1040SRAmountBoxNBB" style="">&nbsp;</div>
						</div>
						<!-- Line 32 -->
						<div class="sty1040SRLN" style="min-height:9.5mm">
							<div class="sty1040SRLeftNumBox" style="padding-left:1mm;height:9.5mm">32</div>
							<div class="sty1040SRDesc" style="height:4.5mm">
								Add lines 27a, 28, 29, 30, and 31. These are your <strong>total other payments and refundable credits </strong>
								<span class="sty1040SRDotLn">.......</span>
							</div>
							<div class="sty1040SRRightNumBox" style="height:9.5mm;padding-top:5.5mm">32</div>
							<div class="sty1040SRAmountBox" style="height:9.5mm;padding-top:5.5mm">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/RefundableCreditsAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<!-- Line 33 -->
						<div class="sty1040SRLN">
							<div class="sty1040SRLeftNumBoxSD" style="border-top:0px solid black;border-bottom:0px solid black;border-left:2px solid white;margin-left:-2px;
							margin-right:2px;padding-left:1mm;">33</div>
							<div class="sty1040SRDesc">
								Add lines 25d, 26, and 32. These are your <strong>total payments </strong> 
								<xsl:call-template name="LinkToLeftoverDataTableInline">
									<xsl:with-param name="Desc">Line 33 - Form 8689 Code</xsl:with-param>
									<xsl:with-param name="TargetNode" 
										select="$FormData/TotalPaymentsAmt/@form8689Cd"/>
								</xsl:call-template>
								<xsl:call-template name="LinkToLeftoverDataTableInline">
									<xsl:with-param name="Desc">Line 33 - Form 8689 Amount</xsl:with-param>
									<xsl:with-param name="TargetNode" 
										select="$FormData/TotalPaymentsAmt/@form8689Amt"/>
								</xsl:call-template>
								<span style="float:right">
									<span class="sty1040SRDotLn" style="float:none;margin-right:-2px;">
										.......</span>
								</span> 
							</div>
							<div class="sty1040SRRightNumBox" style="border-bottom-width: 0px">33</div>
							<div class="sty1040SRAmountBox" style="border-bottom-width: 0px">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/TotalPaymentsAmt"/>
								</xsl:call-template>
							</div>
						</div>
					</div>
					<div class="styStdDiv" style="border-top:1px solid black;overflow:visible;">
					<!-- Refund -->
					<div class="styGenericDiv" style="width:20mm;height:25mm;">
						<span style="font-weight:bold;font-size:12pt;padding-top:1mm">Refund</span>
						<br /><br/>
						<span style="font-family:Arial;font-size:7.5pt;">
							Direct deposit?<br/>See instructions.
						</span>
					</div>
					<!-- Line 34-->
					<div class="sty1040SRLN" style="min-height:4.5mm">
						<div class="sty1040SRLeftNumBox" style="padding-left:1mm;height:4.5mm;padding-top:.5mm">34</div>
						<div class="sty1040SRDesc" style="font-family:Arial Narrow;height:4.5mm;padding-top:.5mm">
							If line 33 is more than line 24, subtract line 24 from line 33. This is the amount you <strong>overpaid </strong>
						</div>
						<div class="sty1040SRRightNumBox" style="height:4.5mm;padding-top:.5mm">34</div>
						<div class="sty1040SRAmountBox" style="height:4.5mm;padding-top:.5mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/OverpaidAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 35a -->
					<div class="sty1040SRLN" style="min-height:4.5mm">
						<div class="sty1040SRLeftNumBox" style="padding-left:1mm;height:4.5mm;padding-top:.5mm">35a</div>
						<div class="sty1040SRDesc" style="height:4.5mm;padding-top:.5mm;font-family:Arial Narrow">
							Amount of line 34 you want <strong>refunded to you. </strong> If Form 8888 is attached, check here 
							<span style="float:right;">
								<span style="width:.2mm"/>
								<xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode" select="$FormData/Form8888Ind"/>
								</xsl:call-template>
								<span style="width:1.5mm"/>
								<span style="float:right;margin-right:5px">
									<span style="width:4px"/>
									<input type="checkbox" class="styCkboxNM" aria-label="form 8888 attached" style="margin-right:6px;" 
										alt="Form 8888 attached">
										<xsl:call-template name="PopulateCheckbox">
											<xsl:with-param name="TargetNode" select="$FormData/Form8888Ind"/>
											<xsl:with-param name="BackupName">IRS1040Form8888Ind</xsl:with-param>
										</xsl:call-template>
									</input>
								</span>
							</span>
						</div>
						<div class="sty1040SRRightNumBox" style="height:4.5mm;padding-top:.5mm">35a</div>
						<div class="sty1040SRAmountBox" style="height:4.5mm;padding-top:.5mm" >
							<span style="float:left;">
								<xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode" select="$FormData/RefundAmt"/>
								</xsl:call-template>
							</span>
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/RefundAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 35b, 35c -->
					<div class="sty1040SRLN">
						<div class="sty1040SRLeftNumBox">									
							<span style="width:4mm"/>b</div>
						<div class="sty1040SRDesc">
							<span style="width:25mm;float:left;clear:none;padding-top:0mm;
								font-family:Arial Narrow;">Routing number	</span>
							<span class="styLNCtrNumBox" style="width:34mm;border-top-width:1px;
								padding-top:0mm;padding-bottom:0mm;font-weight:normal">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$FormData/RoutingTransitNum"/>
								</xsl:call-template>
							</span>
							<span style="width:14px;"/>
							<span style="width:.5mm"/><span class="styBoldText">c</span> Type:
							<span style="width:4px;"/>									
							<!-- Checkbox 1 = checking -->
							<span>
							<xsl:call-template name="PopulateSpan">
								<xsl:with-param name="TargetNode" select="$FormData/BankAccountTypeCd"/>
							</xsl:call-template>
							<input type="checkbox" class="styCkboxNM">
								<xsl:call-template name="PopulateEnumeratedCheckbox">
									<xsl:with-param name="TargetNode" select="$FormData/BankAccountTypeCd"/>
									<xsl:with-param name="DisplayedCheckboxValue" select="'1'"/>
									<xsl:with-param name="BackupName">IRS1040BankAccountTypeCd[1]</xsl:with-param>
								</xsl:call-template>
							</input>
							</span>
							<label>
								<xsl:call-template name="PopulateLabel">
									<xsl:with-param name="TargetNode" select="$FormData/BankAccountTypeCd"/>
									<xsl:with-param name="DisplayedCheckboxValue" select="1"/>
									<xsl:with-param name="BackupName">IRS1040BankAccountTypeCd[1]</xsl:with-param>
								</xsl:call-template>
										Checking
							</label>
							<!-- Checkbox 2 = savings -->
							<span>
							<xsl:call-template name="PopulateSpan">
								<xsl:with-param name="TargetNode" select="$FormData/BankAccountTypeCd"/>
							</xsl:call-template>
							<input type="checkbox" class="styCkboxNM" style="margin-left:5mm;">
								<xsl:call-template name="PopulateEnumeratedCheckbox">
									<xsl:with-param name="TargetNode" select="$FormData/BankAccountTypeCd"/>
									<xsl:with-param name="DisplayedCheckboxValue" select="'2'"/>
									<xsl:with-param name="BackupName">IRS1040BankAccountTypeCd[2]</xsl:with-param>
									</xsl:call-template>
							</input>
							</span>
							<label>
								<xsl:call-template name="PopulateLabel">
									<xsl:with-param name="TargetNode" select="$FormData/BankAccountTypeCd"/>
									<xsl:with-param name="DisplayedCheckboxValue" select="'2'"/>
									<xsl:with-param name="BackupName">IRS1040BankAccountTypeCd[2]</xsl:with-param>
								</xsl:call-template>
									Savings
							</label>
						</div>
						<div class="sty1040SRRightNumBoxNBB" style="background-color:lightgrey;">&nbsp;
						</div>
						<div class="sty1040SRAmountBoxNBB">&nbsp;</div>
					</div>
					<!-- Line 35d -->
					<div class="sty1040SRLN">
						<div class="sty1040SRLeftNumBox"><span style="width:1mm"/>
							<span style="width:3mm"/>d</div>
						<div class="sty1040SRDesc">
							<span style="width:25mm;float:left;clear:none;padding-top:0mm;
								font-family:Arial Narrow;">Account number	</span>
							<span class="styLNCtrNumBox" style="width:84mm;border-top-width:1px;
								padding-top:0mm;padding-bottom:0mm;font-weight:normal">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$FormData/DepositorAccountNum"/>
								</xsl:call-template>
							</span>
						</div>
						<div class="sty1040SRRightNumBoxNBB" style="background-color:lightgrey;">&nbsp;
						</div>
						<div class="sty1040SRAmountBoxNBB">&nbsp;</div>
					</div>
					<!-- Line 36 -->
					<div class="sty1040SRLN" style="min-height:4.5mm">
						<div class="sty1040SRLeftNumBox" style="height:4.5mm;padding-top:.5mm">36</div>
						<div class="sty1040SRDesc" style="width:87mm;height:4.5mm;padding-top:.5mm;font-family:Arial Narrow">
							Amount of line 34 you want<strong> applied to your 2026 estimated tax</strong>
						</div>
						<div class="sty1040SRRightNumBoxNBB" style="height:4.5mm;padding-top:.5mm">36
						</div>
						<div class="sty1040SRAmountBoxNBB" style="height:4.5mm;padding-top:.5mm">
							<span style="float:left;">
								<xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode" select="$FormData/AppliedToEsTaxAmt"/>
								</xsl:call-template>
							</span>
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/AppliedToEsTaxAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty1040SRRightNumBoxNBB" style="background-color:lightgrey;
							height:4.5mm;padding-top:.5mm">&nbsp;</div>
						<div class="sty1040SRAmountBoxNBB" style="height:4.5mm;padding-top:.5mm">&nbsp;
						</div>
					</div>
					</div>
					<!-- You Owe -->
					<div style="display:block;width:187mm;border-top:1px solid black;">
						<div class="styGenericDiv" style="width:20mm;height:13mm;">
							<span style="font-weight:bold;font-size:12pt;">Amount <br />You Owe</span>
						</div>
						<!-- Line 37 -->
						<div class="sty1040SRLN" style="">
							<div class="styLNLeftNumBox" style="height:8mm;">37</div>
							<div class="sty1040SRDesc" style="height:8mm;padding-top:.5mm">
								Subtract line 33 from line 24. This is the <strong>amount you owe.</strong><br/>For details on how to pay, go to <span style="font-style:italic;">www.irs.gov/Payments</span> or see instructions
								
							</div>
							<div class="sty1040SRRightNumBox" style="height:8mm;padding-top:3.5mm">37</div>
							<div class="sty1040SRAmountBox" style="height:8mm;padding-top:3.5mm">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/OwedAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<!-- Line 38 -->
						<div class="sty1040SRLN">
							<div class="sty1040SRLeftNumBox">38</div>
							<div class="sty1040SRDesc" style="width:87mm;">
								Estimated tax penalty (see instructions)
								<span style="float:right">
									<span class="sty1040SRDotLn" style="float:none;margin-right:-2px;">
										.....</span>
								</span> 
							</div>
							<div class="sty1040SRRightNumBoxNBB" style="padding-top:2mm">38</div>
							<div class="sty1040SRAmountBoxNBB" style="padding-top:2.5mm">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/EsPenaltyAmt"/>
								</xsl:call-template>
							</div>
							<div class="sty1040SRRightNumBoxNBB" style="background-color:lightgrey;">&nbsp;
							</div>
							<div class="sty1040SRAmountBoxNBB" style="background-color:lightgrey;">&nbsp;
							</div>
						</div>
					</div>
					<!-- Third Party -->
					<div style="display:block;width:187mm;border-top:1px solid black;font-size:7pt;
						font-family:Verdana;">
						<div class="styGenericDiv" style="width:20mm;height:14mm;">
							<span style="font-weight:bold;font-size:8pt;">Third Party Designee</span>
						</div>
						<div style="width:167mm;height:7mm;">
							<span style="font-size:8pt">Do you want to allow another person to discuss this return with the IRS? See<br/> instructions
								<span class="sty1040SRDotLn" style="float:none;margin-right:2px;">
									.................
								</span> 
								<span style="width:60mm;float:right;">
								<!-- Yes box -->
								<span>
								<xsl:call-template name="PopulateSpan">
										<xsl:with-param name="TargetNode" select="$FormData/ThirdPartyDesigneeInd"/>
									</xsl:call-template>
								<input type="checkbox" class="styCkbox" style="margin-right:2px;" 
									aria-label="discuss with third party Yes check box not checked">
									<xsl:call-template name="PopulateYesCheckbox">
										<xsl:with-param name="TargetNode" select="$FormData/ThirdPartyDesigneeInd"/>
										<xsl:with-param name="BackupName">F1040ThirdPartyDesigneeInd</xsl:with-param>
									</xsl:call-template>
								</input>
								</span>
								<label style="font-weight:bold;">
									<xsl:call-template name="PopulateLabelYes">
										<xsl:with-param name="TargetNode" select="$FormData/ThirdPartyDesigneeInd"/>
										<xsl:with-param name="BackupName">F1040ThirdPartyDesigneeInd</xsl:with-param>
									</xsl:call-template>
									Yes. 
									</label> 
									<span> Complete below.</span>
							  <span style="width:3mm;"/>		
							  <!-- No box -->
							  <span>
								<xsl:call-template name="PopulateSpan">
										<xsl:with-param name="TargetNode" select="$FormData/ThirdPartyDesigneeInd"/>
									</xsl:call-template>						
								<input type="checkbox" class="styCkbox" style="margin-right:2px;"
									aria-label="discuss with third party No check box checked">
									<xsl:call-template name="PopulateNoCheckbox">
										<xsl:with-param name="TargetNode" select="$FormData/ThirdPartyDesigneeInd"/>
										<xsl:with-param name="BackupName">F1040ThirdPartyDesigneeInd</xsl:with-param>
									</xsl:call-template>
								</input>
								</span>
								<label style="font-weight:bold;">
									<xsl:call-template name="PopulateLabelNo">
										<xsl:with-param name="TargetNode" select="$FormData/ThirdPartyDesigneeInd"/>
										<xsl:with-param name="BackupName">F1040ThirdPartyDesigneeInd</xsl:with-param>
									</xsl:call-template>
									No
									</label>
								</span>
							</span>
						</div>
						<div style="width:167mm;height:8mm;padding-top:1.3mm">
							<span style="width:16mm;">
								Designee's <br /> name 
							</span>
							<span style="width:54mm;">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$FormData/ThirdPartyDesigneeNm"/>
								</xsl:call-template>
							</span>
							<span style="width:11mm;">
								Phone <br /> no. 
							</span>
							<span style="width:26mm;">
								<xsl:call-template name="PopulatePhoneNumber">
									<xsl:with-param name="TargetNode" 
										select="$FormData/ThirdPartyDesigneePhoneNum"/>
								</xsl:call-template>
							</span>
							<span style="width:30mm;">
								Personal identification <br /> number (PIN)<span style="width:8mm"/>
							</span>
							<span style="width:20mm;">
								<xsl:call-template name="PopulatePin">
									<xsl:with-param name="TargetNode" select="$FormData/ThirdPartyDesigneePIN"/>
								</xsl:call-template>
							</span>
						</div>
					</div>
					<!-- Sign Here -->
					<div style="display:block;width:187mm;border-top:1px solid black;font-size:8pt;
						font-family:Verdana;">
						<div class="styGenericDiv" style="width:20mm;height:28mm;font-size:7pt;">
							<span style="font-weight:bold;font-size:12pt;">Sign Here</span>
							<br /><br /><br />
							<span style="font-family:Arial Narrow">Joint return? <br/>See instructions.<br/> Keep a copy for <br/>your records.</span>
						</div>
						<div style="padding-top:14.7mm;padding-left:8px;padding-right:0px;float:left;clear:none;
							width:4mm;margin-left:-2px;margin-right:2px;">
						</div>
						<div style="float:left;clear:none;width:163mm;">
							<div class="" style="width:163mm;font-size:8pt;font-family:Arial;float:left;clear:none;">
								Under penalties of perjury, I declare that I have examined this return and
								accompanying schedules and statements, and to the best of my knowledge and belief,
								they are true, correct, and complete. Declaration of preparer (other than taxpayer) is 
								based on all information of which preparer has any knowledge.
							</div>
							<div style="width:163mm;float:left;clear:none;"/>
							<div class="styBB" style="width:163mm;float:left;clear:none;">
								<div style="width:70mm;float:left;clear:none;">
									<div class="styFNBox" style="width:70mm;float:left;clear:none;">
									  Your signature
									</div>
									<div class="styFNBox" style="height:8mm;width:70mm;padding-top:1.5mm;float:left;
										clear:none;">
										<xsl:call-template name="PopulatePin">
											<xsl:with-param name="TargetNode"
												select="$RtnHdrData/PrimarySignaturePIN"/>
										</xsl:call-template>
									</div>
								</div>
								<div class="styFNBox" style="width:18mm;float:left;clear:none;">
									<div style="width:16mm;padding-left:2mm;float:left;clear:none;">
										  Date
									</div>
									<div style="height:8mm;width:18mm;padding-top:1.5mm;text-align:center;float:left;
										clear:none;font-size:7pt;">
										<xsl:call-template name="PopulateMonthDayYear">
											<xsl:with-param name="TargetNode"
												select="$RtnHdrData/PrimarySignatureDt"/>
										</xsl:call-template>
									</div>
								</div>
								<div class="styFNBox" style="width:36mm;float:left;clear:none;">
									<div style="width:36.8mm;padding-left:2mm;float:left;clear:none;">
									   Your occupation
									</div>
									<div style="height:8mm;width:36mm;padding-top:0.5mm;padding-left:2mm;float:left;
										clear:none;font-family:Arial;">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode"
												select="$FormData/PrimaryOccupationTxt"/>
										</xsl:call-template>
									</div>
								</div>
								<div class="" style="width:35mm;float:left;clear:none;">
									<div class="styGenericDiv" style="height:11mm;width:38.5mm;border-left-width:0px;
										font-size:7pt;">
										<span style="width:100%;padding-left:4px;font-family:Arial-Narrow;">If the IRS
											sent you an Identity Protection PIN, enter it here </span><br/>
										<span style="width:40%;padding-left:4px;font-family:Arial-Narrow;float:left;">
											 (see inst.)</span>
										<span style="width:60%;padding-top:0px;padding-right:5mm;float:right;
											text-align:center;padding-top:0.8mm">
											<div class="styLNCtrNumBox" style="height:3mm;width:23mm;
												border-top-width:1px;font-weight:normal">
												<xsl:call-template name="PopulatePin">
													<xsl:with-param name="TargetNode" 
													select="$RtnHdrData/IdentityProtectionPIN"/>
												</xsl:call-template>
											</div>
										</span>
									</div>
								</div>
							</div>
							<div class="" style="width:163mm;float:left;clear:none;height:10.5mm;">
								<div style="width:70mm;float:left;clear:none;">
									<div class="styFNBox" style="width:70mm;float:left;clear:none;font-family:Arial;">
									   Spouse's signature. If a joint return, <span class="styBoldText"> both </span>
									   must sign.	</div>
									<div class="styFNBox" style="height:9mm;width:70mm;padding-top:1.5mm;
										float:left;clear:none;">
										<xsl:call-template name="PopulatePin">
											<xsl:with-param name="TargetNode"
												select="$RtnHdrData/SpouseSignaturePIN"/>
										</xsl:call-template>
									</div>
								</div>
								<div class="styFNBox" style="width:18mm;height:10.5mm;float:left;clear:none;">
									<div style="width:16mm;padding-left:2mm;float:left;clear:none;">
									  Date</div>
									<div style="height:8mm;width:18mm;padding-top:1.5mm;text-align:center;float:left;
										clear:none;font-size:7pt;">
										<xsl:call-template name="PopulateMonthDayYear">
											<xsl:with-param name="TargetNode" 
												select="$RtnHdrData/SpouseSignatureDt"/>
										</xsl:call-template>
									</div>
								</div>
								<div class="styFNBox" style="width:36mm;height:10.5mm;float:left;clear:none;">
									<div style="width:36.8mm;padding-left:2mm;float:left;clear:none;">
									   Spouse's occupation
									</div>
									<div style="height:10.5mm;width:36mm;padding-top:0.5mm;padding-left:2mm;float:left;
										clear:none;font-family:Arial;">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode"
												select="$FormData/SpouseOccupationTxt"/>
										</xsl:call-template>
									</div>
								</div>
								<div class="styGenericDiv" style="height:10.5mm;width:38.5mm;border-left-width:0px;
									font-size:7pt;">
									<span style="width:100%;padding-left:4px;font-family:Arial-Narrow;">If the IRS sent
										your spouse an Identity Protection PIN, enter it here </span><br/>
									<span style="width:40%;padding-left:4px;font-family:Arial-Narrow;float:left;">
										(see inst.)	</span>
									<span style="width:60%;padding-top:0px;padding-right:5mm;float:right;
										text-align:center;padding-top:0.8mm">
										<div class="styLNCtrNumBox" style="height:3mm;width:23mm;
											border-top-width:1px;font-weight:normal">
											<xsl:call-template name="PopulatePin">
												<xsl:with-param name="TargetNode"
													select="$RtnHdrData/SpouseIdentityProtectionPIN"/>
											</xsl:call-template>
										</div>
									</span>
								</div>
							</div>
							<div class="" style="width:163mm;float:left;clear:none;border-top:1px solid black">
								<div style="width:69.6mm;float:left;font-size:7pt;">
									Phone no. 
									<span style="width:4px;"/>
									<xsl:if test="$RtnHdrData/Filer/PhoneNum">
										<xsl:call-template name="PopulatePhoneNumber">
											<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/PhoneNum"/>
										</xsl:call-template>
									</xsl:if>
									<xsl:if test="$RtnHdrData/Filer/ForeignPhoneNum">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/ForeignPhoneNum"/>
										</xsl:call-template>
									</xsl:if>  
								</div>
								<div style="width:92.5mm;float:left;padding-left:2mm;font-size:7pt;
									border-left:1px solid black">Email address<span style="width:4px;"/> 
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" 
						select="$RtnHdrData/AdditionalFilerInformation/AtSubmissionFilingGrp/EmailAddressTxt"/>
									</xsl:call-template>
								</div>
							</div>
						</div>
					</div>
					<!-- paid preparer -->
					<div class="" style="width:187mm;font-size:7pt;float:none;clear:both;
						border-top:1px solid black;">
						<div style="width:22.75mm;padding-top:2mm;float:left;clear:none;">
							<span class="styMainTitle" style="font-size:11pt;">
								Paid
								Preparer
								Use Only
							</span>
						</div>
						<div style="width:164mm;float:left;clear:none;display:block;">
							<div style="width:164mm;float:left;clear:none;border-style:solid;border-color:black;
								border-width:0px 0px 1px 0px;">
								<div class="styFNBox" style="height:8mm;width:52mm;padding-top:0mm;
									border-right:1 solid black;">
									<span style="display:inline;font-size:8pt;">Preparer's name</span><br/>
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode"
											select="$RtnHdrData/PaidPreparerInformationGrp/PreparerPersonNm"/>
									</xsl:call-template>
								</div>
								<div class="styFNBox" style="height:8mm;width:41mm;padding-top:0mm;
									border-right:1 solid black;padding-left:1mm;font-size:8pt;">
									Preparer's signature</div>
								<div class="styFNBox" style="height:8mm;width:22mm;padding-top:0mm;
									padding-left:1mm;border-right:1 solid black;">
									<span style="font-size:8pt;">Date</span><br/>
									<xsl:call-template name="PopulateReturnHeaderPaidPreparerInformation">
										<xsl:with-param name="TargetNode">DateSigned</xsl:with-param>
									</xsl:call-template>
								</div>
								<div class="styFNBox" style="height:8mm;width:20mm;padding-left:1mm;">
									<span style="font-size:8pt;">PTIN</span>
									<br/>
									<xsl:if test="$RtnHdrData/PaidPreparerInformationGrp/PreparerSSN">
										<xsl:call-template name="PopulateReturnHeaderPaidPreparerInformation">
											<xsl:with-param name="TargetNode">PreparerSSN</xsl:with-param>
										</xsl:call-template>
									</xsl:if>
									<xsl:if test="$RtnHdrData/PaidPreparerInformationGrp/PTIN">
										<xsl:call-template name="PopulateReturnHeaderPaidPreparerInformation">
											<xsl:with-param name="TargetNode">PTIN</xsl:with-param>
										</xsl:call-template>
									</xsl:if>
									<xsl:if test="$RtnHdrData/PaidPreparerInformationGrp/STIN">
										<xsl:call-template name="PopulateReturnHeaderPaidPreparerInformation">
											<xsl:with-param name="TargetNode">STIN</xsl:with-param>
										</xsl:call-template>
									</xsl:if>
								</div>
								<div class="styLNDesc" style="height:8mm;width:29mm;padding-top:0mm;
									padding-bottom:0mm;padding-left:1mm;">
							  		<label>
										<xsl:call-template name="PopulateLabel">
											<xsl:with-param name="TargetNode"
												select="$RtnHdrData/PaidPreparerInformationGrp/SelfEmployedInd"/>
											<xsl:with-param name="BackupName">$RtnHdrDataPaidPreparerInformationSelfEmployed</xsl:with-param>
										</xsl:call-template>
										<span style="font-size:8pt;">Check if:</span><br/>
											<input class="styCkbox" type="checkbox">
												<xsl:call-template name="PopulateCheckbox">
													<xsl:with-param name="TargetNode" 
														select="$RtnHdrData/PaidPreparerInformationGrp/SelfEmployedInd"/>
													<xsl:with-param name="BackupName">$RtnHdrDataPaidPreparerInformationSelfEmployed</xsl:with-param>
												</xsl:call-template>
											</input>
										<span style="width:4px;"/>Self-employed
									</label>
								</div>
							</div>
							<div style="width:164mm;height:7.5mm;float:left;clear:none;border-style:solid;
								border-color:black;border-width:0px 0px 0px 0px;">
								<div class="styFNBox" style="height:7.5mm;width:120mm;border-right:1 solid black;
									padding-top:1.5mm">
									<span class="styGenericDiv" style="">Firm's name 
										<span style="width:2.2mm;"/>
										<xsl:call-template name="PopulateReturnHeaderPaidPreparerInformation">
											<xsl:with-param name="TargetNode">BusinessNameLine1Txt</xsl:with-param>
										</xsl:call-template>,<span style="width:2px"/>
										<xsl:call-template name="PopulateReturnHeaderPaidPreparerInformation">
											<xsl:with-param name="TargetNode">BusinessNameLine2Txt</xsl:with-param>
										</xsl:call-template>
									</span>
								</div>
								<div class="styFNBox" style="height:7.5mm;width:44mm;padding-left:1mm;
									border-right:0 solid black;padding-top:1.5mm"> Phone no. 
									<xsl:call-template name="PopulateReturnHeaderPaidPreparerInformation">
										<xsl:with-param name="TargetNode">Phone</xsl:with-param>
									</xsl:call-template>
									<xsl:call-template name="PopulateReturnHeaderPaidPreparerInformation">
										<xsl:with-param name="TargetNode">ForeignPhone</xsl:with-param>
									</xsl:call-template>
								</div>
							</div>
							<div class="" style="width:164mm;border-top:1px solid black;
								border-right-width:0px;float:left;clear:none;height:auto">
								<div class="styFNBox" style="width:120mm;min-height:6.5mm;
									border-right:1px solid black;padding-top:1.5mm">
									<span class="styGenericDiv" style="padding-right:.5mm;">Firm's address
									<br/> 
										<xsl:call-template name="PopulateReturnHeaderPaidPreparerInformation">
											<xsl:with-param name="TargetNode">AddressLine1Txt</xsl:with-param>
										</xsl:call-template>
									<br/>
										<xsl:call-template name="PopulateReturnHeaderPaidPreparerInformation">
											<xsl:with-param name="TargetNode">AddressLine2Txt</xsl:with-param>
										</xsl:call-template>
									<br/>
									<xsl:if test="$RtnHdrData/PaidPreparerInformationGrp/PreparerUSAddress">
											<xsl:call-template name="PopulateReturnHeaderPaidPreparerInformation">
											<xsl:with-param name="TargetNode">CityNm</xsl:with-param>
										</xsl:call-template>,
										<span style="width:2px;"/>
											<xsl:call-template name="PopulateReturnHeaderPaidPreparerInformation">
											<xsl:with-param name="TargetNode">StateAbbreviationCd</xsl:with-param>
										</xsl:call-template>,
										<span style="width:2px;"/>
										<xsl:call-template name="PopulateReturnHeaderPaidPreparerInformation">
											<xsl:with-param name="TargetNode">ZIPCd</xsl:with-param>
										</xsl:call-template>
									</xsl:if>
									<xsl:if test="$RtnHdrData/PaidPreparerInformationGrp/PreparerForeignAddress">
										<xsl:call-template name="PopulateReturnHeaderPaidPreparerInformation">
											<xsl:with-param name="TargetNode">CityNm</xsl:with-param>
										</xsl:call-template>,
										<span style="width:2px;"/>
										<xsl:call-template name="PopulateReturnHeaderPaidPreparerInformation">
											<xsl:with-param name="TargetNode">ProvinceOrStateNm</xsl:with-param>
										</xsl:call-template>,
										<span style="width:2px;"/>
										<xsl:call-template name="PopulateReturnHeaderPaidPreparerInformation">
											<xsl:with-param name="TargetNode">ForeignPostalCd</xsl:with-param>
										</xsl:call-template>,
										<span style="width:2px;"/>
										<xsl:call-template name="PopulateReturnHeaderPaidPreparerInformation">
											<xsl:with-param name="TargetNode">CountryCd</xsl:with-param>
									</xsl:call-template>
								</xsl:if>
									</span>
								</div>
								<div class="styFNBox" style="width:44mm;height:5mm;border-right-width:0px;
									padding-top:1.5mm">
									<div class="styGenericDiv" style="padding-right:.5mm;padding-left:0.5mm;">
										Firm's EIN 
									</div>
									<div class="styGenericDiv" style="padding-right:.5mm;padding-left:0.5mm;">
										<xsl:if test="$RtnHdrData/PaidPreparerInformationGrp/PreparerFirmEIN">
											<xsl:call-template name="PopulateReturnHeaderPaidPreparerInformation">
												<xsl:with-param name="TargetNode">PreparerFirmIDNumber</xsl:with-param>
											</xsl:call-template>
										</xsl:if>
										<xsl:if test="$RtnHdrData/PaidPreparerInformationGrp/MissingEINReason">
											<xsl:call-template name="PopulateReturnHeaderPaidPreparerInformation">
												<xsl:with-param name="TargetNode">MissingEINReason</xsl:with-param>
											</xsl:call-template>
										</xsl:if>
									</div>
								</div>
							</div>
						</div>
					</div>
					<!-- Form footer-->
					<div class="styStdDiv pageEnd" style="border-top:1px solid black;font-size:7.5pt;
						padding-top:.5mm">
						Go to <span style="display:inline;font-style:italic;">www.irs.gov/Form1040SR</span>
						for instructions and the latest information.
						<span style="float:right;">Form <strong style="font-size:10pt;">1040-SR</strong>
							(2025)</span>
					</div>
					<!-- Page 4 -->
					<div class="styStdDiv" style="border-bottom:1px solid black;font-size:7pt;
						font-family:Verdana;">Form 1040-SR (2025)
						<div style="float:right;">Page <strong>4</strong></div>
					</div>
					<!-- Standard Deduction Chart -->
					<div class="styStdDiv" style="font-size:0pt;"/>
					<div class="styStdIBDiv" style="width:187mm;">
						<div class="sty1040Desc" style="width:185mm;border-top:0px solid black;float:none;
							height:12mm;">
							<strong style="font-size:12pt;">Standard Deduction Chart*</strong><br />
							<span style="padding-top:2mm;padding-left:2mm;">
								Add the number of boxes checked on line 12d on page 2
								<span style="float:right;">
									<span class="sty1040SRDotLn" style="float:none;padding-left:1mm">....................</span>
									<span style="width:6mm;text-align:center;border-bottom:1px solid black;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode"
												select="$FormData/TotalBoxesCheckedCnt"/>
										</xsl:call-template>
									</span>
								</span>
							</span>
						</div>
						<div style="width:183mm;border-top:1px solid black;font-weight:bold;font-size:10pt;
							padding-left:2mm;">
							<div style="width:59mm;padding-top:1mm;float:left;">
								<br/><br/>IF your filing <br /> status is. . .
							</div>
							<div style="width:54mm;padding-top:1mm;padding-left:10mm;">
								<br/><br/>AND the number of <br /> boxes checked is. . .
							</div>
							<div style="width:60mm;padding-top:1mm;padding-left:15mm;
								border-right:0px;">
								<br/><br/>THEN your standard <br /><span style="width:4mm"/> deduction is. . .
							</div>
						</div>
						<div style="width:183mm;border-top:1px solid black;font-size:10pt;">
							<div style="width:59mm;padding-top:4mm;padding-left:2mm;float:left;">
								Single
							</div>
							<div style="width:54mm;padding-top:1mm;float:left;text-align:center;">
								1 <br/><br /> 2
							</div>
							<div style="width:60mm;padding-top:1mm;float:left;text-align:center;
								border-right:0px solid black;padding-bottom:0.5mm;">
								$17,750 <br /><br/> <span style="width:2mm;"/>19,750
							</div>
						</div>
						<div style="width:183mm;border-top:1px solid black;font-size:10pt;">
							<div style="width:59mm;padding-top:6mm;padding-left:2mm;float:left;">
								<br/>Married <br /> filing jointly 
							</div>
							<div style="width:54mm;padding-top:1mm;float:left;text-align:center;">
								1 <br/><br /> 2 <br/><br /> 3 <br/><br /> 4
							</div>
							<div style="width:60mm;padding-top:1mm;float:left;text-align:center;
								border-right:0px solid black;padding-bottom:0.5mm">
								$33,100 <br/><br /> <span style="width:2mm;"/>34,700 <br/><br /> <span style="width:2mm;"/>36,300 <br/><br /> <span style="width:2mm;"/>37,900 
							</div>
						</div>
						<div style="width:183mm;border-top:1px solid black;font-size:10pt;">
							<div style="width:59mm;padding-top:2.5mm;padding-left:2mm;float:left;">
								Qualifying <br /> surviving spouse
							</div>
							<div style="width:54mm;padding-top:1mm;float:left;text-align:center;">
								1 <br/><br /> 2 
							</div>
							<div style="width:60mm;padding-top:1mm;float:left;text-align:center;
								border-right:0px solid black;padding-bottom:0.5mm">
								$33,100 <br/><br /> <span style="width:2mm;"/>34,700 
							</div>
						</div>
						<div style="width:183mm;border-top:1px solid black;font-size:10pt;">
							<div style="width:59mm;padding-top:2.5mm;padding-left:2mm;float:left;">
								Head of <br /> household
							</div>
							<div style="width:54mm;padding-top:1mm;float:left;text-align:center;">
								1 <br/><br /> 2
							</div>
							<div style="width:60mm;padding-top:1mm;float:left;text-align:center;">
								$25,625 <br/><br /> <span style="width:2mm;"/>27,625
							</div>
						</div>
						<div style="width:183mm;border-top:1px solid black;font-size:10pt;">
							<div style="width:59mm;padding-top:6mm;padding-left:2mm;float:left;">
								<br/>Married filing <br /> separately**
							</div>
							<div style="width:54mm;padding-top:1mm;float:left;text-align:center;">
								1 <br /><br/> 2 <br /><br/> 3 <br /><br/> 4
							</div>
							<div style="width:60mm;padding-top:1mm;float:left;text-align:center;">
								$17,350 <br/><br /> <span style="width:2mm;"/>18,950 <br/><br /> <span style="width:2mm;"/>20,550 <br/><br /> <span style="width:2mm;"/>22,150
							</div>
						</div>
					</div>
					<div style="width:187mm;border-top:1px solid black;border-bottom:0px solid black;
						font-size:10pt;padding-top:.5mm;padding-bottom:.5mm">
						*Don't use this chart if someone can claim you (or your spouse if filing jointly) as a
						dependent, your spouse itemizes on a separate return, or you were a dual-status alien.
						Instead, see instructions.<br/>
						**You can check the boxes for your spouse if your filing status is married filing separately
						and your spouse had no<br/> income, isn't filing a return, and can't be claimed as a 
						dependent on another person's return.
					</div>
					<!-- Form footer-->
					<div class="styStdDiv pageEnd" style="border-top:.5px solid black;font-size:7.5pt;
						padding-top:.5mm">
						Go to <span style="display:inline;font-style:italic;">www.irs.gov/Form1040SR</span>
						for instructions and the latest information.
						<span style="float:right;">Form <strong style="font-size:10pt;">1040-SR</strong>
							(2025)</span>
					</div>
					<!-- Additional Data title bar and button -->
					<div class="styLeftOverTitleLine" id="LeftoverData">
						<div class="styLeftOverTitle">
							Additional Data        
						</div>
						<div class="styLeftOverButtonContainer">
							<input class="styLeftoverTableBtn" type="button" TabIndex="-1" 
								value="Return to Form" onclick="javascript:returnToWriteInImage();"/>
						</div>
					</div>
					<!-- Additional Data table -->
					<table class="styLeftOverTbl">
						<xsl:call-template name="PopulateCommonLeftover">
							<xsl:with-param name="TargetNode" select="$FormData"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRow">
							<xsl:with-param name="Desc">Top Right Margin - Special Processing Literal Code</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$FormData/SpecialProcessingLiteralCd"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRow">
							<xsl:with-param name="Desc">Top Right Margin - Combat Zone Code</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$FormData/CombatZoneCd"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRow">
							<xsl:with-param name="Desc">Top Right Margin - Combat Zone Date</xsl:with-param>
							<xsl:with-param name="TargetNode" 
								select="$FormData/CombatZoneCd/@combatZoneDt"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRow">
							<xsl:with-param name="Desc">Top Right Margin - Special Processing Code Text</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$FormData/SpecialProcessingCodeTxt"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRowCheckbox">
							<xsl:with-param name="Desc">Top Right Margin - Community Property Return Indicator</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$FormData/CommPropStateRtnInd"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRowCheckbox">
							<xsl:with-param name="Desc">Top Right Margin - Signed by Power Of Attorney Checkbox</xsl:with-param>
							<xsl:with-param name="TargetNode"
								select="$FormData/PowerOfAttorneySignedByInd"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRow">
							<xsl:with-param name="Desc">Top Right Margin - Power Of Attorney Name</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$FormData/PowerOfAttorneyNm"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRowCheckbox">
							<xsl:with-param name="Desc">Top Right Margin - Surviving Spouse Indicator</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$FormData/SurvivingSpouseInd"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRowCheckbox">
							<xsl:with-param name="Desc">Top Right Margin - Personal Representative</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$FormData/PersonalRepresentativeInd"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRow">
							<xsl:with-param name="Desc">Top Right Margin - Non Paid Preparer Code</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$FormData/NonPaidPreparerCd"/>
						</xsl:call-template>
						<xsl:if test="count($FormData/RefundProductCd) &lt; 2">
							<xsl:call-template name="PopulateLeftoverRow">
								<xsl:with-param name="Desc">Top Right Margin - Refund Product Code</xsl:with-param>
								<xsl:with-param name="TargetNode" select="$FormData/RefundProductCd"/>
							</xsl:call-template>
						</xsl:if>
						<xsl:call-template name="PopulateLeftoverRow">
							<xsl:with-param name="Desc">Top Right Margin - Refund Product Code Text</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$FormData/RefundProductCodeTxt"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRow">
							<xsl:with-param name="Desc">Top Right Margin - Filed Pursuant To Sect 30191002 Code</xsl:with-param>
							<xsl:with-param name="TargetNode" 
								select="$FormData/FiledPursuantToSect30191002Cd"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRow">
							<xsl:with-param name="Desc">Filing Status - Spouse's Name</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$FormData/SpouseNm"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRow">
							<xsl:with-param name="Desc">Filing Status - Non-Resident Alien Literal Code</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$FormData/NRALiteralCd"/>
						</xsl:call-template>
						<xsl:if test="$FormData/QualifyingHOHSSN">
							<tr>
								<td class="styLeftOverTableRowDesc" style="width:100mm;"
									scope="row">Filing Status - Qualifying HOH SSN:</td>
								<td class="styLeftOverTableRowAmount" style="width:87mm;">
									<xsl:call-template name="PopulateSSN">
										<xsl:with-param name="TargetNode" select="$FormData/QualifyingHOHSSN"/>
									</xsl:call-template>
								</td>                          
							</tr>
						</xsl:if>
						<xsl:if test="$FormData/QualifyingPersonSSN">
							<tr>
								<td class="styLeftOverTableRowDesc" style="width:100mm;" 
									scope="row">Filing Status - Qualifying Person SSN:</td>
								<td class="styLeftOverTableRowAmount" style="width:87mm;">
									<xsl:call-template name="PopulateSSN">
										<xsl:with-param name="TargetNode" select="$FormData/QualifyingPersonSSN"/>
									</xsl:call-template>
								</td>                          
							</tr>
						</xsl:if>
						<xsl:call-template name="PopulateLeftoverRow">
							<xsl:with-param name="Desc">Header - Primary Name Control</xsl:with-param>
							<xsl:with-param name="TargetNode" 
								select="$RtnHdrData/Filer/PrimaryNameControlTxt"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRow">
							<xsl:with-param name="Desc">Header - In Care Of Name</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/InCareOfNm"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRow">
							<xsl:with-param name="Desc">Header - Spouse Name Control</xsl:with-param>
							<xsl:with-param name="TargetNode" 
								select="$RtnHdrData/Filer/SpouseNameControlTxt"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRow">
							<xsl:with-param name="Desc">Standard Deduction - Exempt Spouse Name</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$FormData/ExemptSpouseNm"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRow">
							<xsl:with-param name="Desc">Standard Deduction - Exempt Spouse Name Control</xsl:with-param>
							<xsl:with-param name="TargetNode"
								select="$FormData/ExemptSpouseNameControlTxt"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRow">
							<xsl:with-param name="Desc">Standard Deduction - Total Exempt Primary and Spouse Count</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$FormData/TotalExemptPrimaryAndSpouseCnt"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRow">
							<xsl:with-param name="Desc">Standard Deduction - Total Exemptions Count</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$FormData/TotalExemptionsCnt"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRow">
							<xsl:with-param name="Desc">Dependents - Child Who Lived With You Count</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$FormData/ChldWhoLivedWithYouCnt"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRow">
							<xsl:with-param name="Desc">Dependents - Other Dependents Listed Count</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$FormData/OtherDependentsListedCnt"/>
						</xsl:call-template>
						<!-- <xsl:if test="($Print != $Separated) or (count($FormData/DependentDetail) &lt;= 4)"> --> 
						<!--this condition removed by request in defect #1253085 -->
							<xsl:for-each select="$FormData/DependentDetail">
								<xsl:call-template name="PopulateLeftoverRow">
									<xsl:with-param name="Desc">Dependent <xsl:number value="position()"
										format="1"/> Name Control</xsl:with-param>
									<xsl:with-param name="TargetNode" select="DependentNameControlTxt"/>
								</xsl:call-template>
							</xsl:for-each>
						<!--</xsl:if>-->
						<xsl:call-template name="PopulateLeftoverRow">
							<xsl:with-param name="Desc">Line 1a - Fringe Benefits Code</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$FormData/WagesAmt/@fringeBenefitsCd"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRow">
							<xsl:with-param name="Desc">Line 1h - Wages Not Shown Lit Only Code</xsl:with-param>
							<xsl:with-param name="TargetNode" 
								select="$FormData/OtherEarnedIncomeAmt/@wagesNotShownLitOnlyCd"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRow">
							<xsl:with-param name="Desc">Line 3a - Qualified Form 8814 Code</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$FormData/QualifiedF8814Cd"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRowAmount">
							<xsl:with-param name="TargetNode" select="$FormData/QualifiedF8814Amt"/>
							<xsl:with-param name="Desc">Line 3a - Qualified Form 8814 Amount</xsl:with-param>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRow">
							<xsl:with-param name="Desc">Line 3b - Ordinary Form 8814 Code</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$FormData/OrdinaryF8814Cd"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRowAmount">
							<xsl:with-param name="Desc">Line 3b - Ordinary Form 8814 Amount</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$FormData/OrdinaryF8814Amt"/>
						</xsl:call-template>
						<xsl:if test="count($FormData/IRADistributionsLiteralCd) &lt; 2">
							<xsl:call-template name="PopulateLeftoverRow">
								<xsl:with-param name="Desc">Line 4b - IRA Distributions Literal Code</xsl:with-param>
								<xsl:with-param name="TargetNode" select="$FormData/IRADistributionsLiteralCd"/>
							</xsl:call-template>	
						</xsl:if>
						<xsl:call-template name="PopulateLeftoverRow">
							<xsl:with-param name="Desc">Line 5b - Foreign Employer Pension Cd</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$FormData/ForeignEmployerPensionCd"/>
						</xsl:call-template>	
						<xsl:call-template name="PopulateLeftoverRowAmount">
							<xsl:with-param name="Desc">Line 5b - Taxable Foreign Pensions Total Amount</xsl:with-param>
							<xsl:with-param name="TargetNode" 
								select="$FormData/TaxableForeignPensionsTotalAmt"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRow">
							<xsl:with-param name="Desc">Line 5b - Pensions Annuities Literal Cd</xsl:with-param>
							<xsl:with-param name="TargetNode" 
								select="$FormData/TotalTaxablePensionsAmt/@pensionsAnnuitiesLiteralCd"/>
						</xsl:call-template>	
						<xsl:call-template name="PopulateLeftoverRow">
							<xsl:with-param name="Desc">Line 6a - Social Security Benefits Code</xsl:with-param>
							<xsl:with-param name="TargetNode" 
								select="$FormData/SocSecBnftAmt/@socSecBnftCd"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRow">
							<xsl:with-param name="Desc">Line 7 - Form 8814 Code</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$FormData/Form8814Cd"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRowAmount">
							<xsl:with-param name="Desc">Line 7 - Form 8814 Amount</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$FormData/Form8814Amt"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRow">
							<xsl:with-param name="Desc">Line 11 - Excluded Sect 933 Puerto Rico Income Code</xsl:with-param>
							<xsl:with-param name="TargetNode"
					select="$FormData/ExcldSect933PuertoRicoIncmAmt/@excldSect933PuertoRicoIncmCd"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRowAmount">
							<xsl:with-param name="Desc">Line 11 - Excluded Sect 933 Puerto Rico Income Amount</xsl:with-param>
							<xsl:with-param name="TargetNode" 
								select="$FormData/ExcldSect933PuertoRicoIncmAmt"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRow">
							<xsl:with-param name="Desc">Line 12 - Modified Standard Deduction Ind</xsl:with-param>
							<xsl:with-param name="TargetNode"
						 select="$FormData/TotalItemizedOrStandardDedAmt/@modifiedStandardDeductionInd"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRow">
							<xsl:with-param name="Desc">Line 15 - Capital Construction Fund Code</xsl:with-param>
							<xsl:with-param name="TargetNode"
								select="$FormData/TaxableIncomeAmt/@capitalConstructionFundCd"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRowAmount">
							<xsl:with-param name="Desc">Line 15 - Capital Construction Fund Amount</xsl:with-param>
							<xsl:with-param name="TargetNode"
								select="$FormData/TaxableIncomeAmt/@capitalConstructionFundAmt"/>
						</xsl:call-template>	
						<xsl:call-template name="PopulateLeftoverRow">
							<xsl:with-param name="Desc">Line 15 - Schedule Q Code</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$FormData/ScheduleQCd"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRowAmount">
							<xsl:with-param name="Desc">Line 16(1) - Child Interest and Dividend Tax Amount</xsl:with-param>
							<xsl:with-param name="TargetNode" 
								select="$FormData/Form8814Ind/@childInterestAndDividendTaxAmt"/>
						</xsl:call-template>
						<!-- OtherTaxAmtGrp separate repeating -->
						<xsl:if test="count($FormData/OtherTaxAmtGrp) &lt; 2">
							<xsl:call-template name="PopulateLeftoverRow">
								<xsl:with-param name="Desc">Line 16(3) - Other Tax Amount Code</xsl:with-param>
								<xsl:with-param name="TargetNode" 
									select="$FormData/OtherTaxAmtGrp/OtherTaxAmtCd"/>
							</xsl:call-template>
							<xsl:call-template name="PopulateLeftoverRow">
								<xsl:with-param name="Desc">Line 16(3) - Other Tax Text</xsl:with-param>
								<xsl:with-param name="TargetNode" 
									select="$FormData/OtherTaxAmtGrp/OtherTaxTxt"/>
							</xsl:call-template>
							<xsl:call-template name="PopulateLeftoverRowAmount">
								<xsl:with-param name="Desc">Line 16(3) - Other Tax Amount</xsl:with-param>
								<xsl:with-param name="TargetNode"
									select="$FormData/OtherTaxAmtGrp/OtherTaxAmt"/>
							</xsl:call-template>
						</xsl:if>
						<xsl:call-template name="PopulateLeftoverRowAmount">
							<xsl:with-param name="Desc">Line 24 - Deferred Tax 1 Total Tax Deferred Amount</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$FormData/Form8854DeferredTaxGrp[1]/TotalTaxDeferredAmt"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRow">
							<xsl:with-param name="Desc">Line 24 - Deferred Tax 1 Expatriation Code</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$FormData/Form8854DeferredTaxGrp[1]/ExpatriationCd"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRowAmount">
							<xsl:with-param name="Desc">Line 24 - Deferred Tax 2 Total Tax Deferred Amount</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$FormData/Form8854DeferredTaxGrp[2]/TotalTaxDeferredAmt"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRow">
							<xsl:with-param name="Desc">Line 24 - Deferred Tax 2 Expatriation Code</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$FormData/Form8854DeferredTaxGrp[2]/ExpatriationCd"/>
						</xsl:call-template>
						<xsl:if test="$FormData/EstimatedTaxPaymentsAmt/@divorcedSpouseSSN">
							<tr>
								<td class="styLeftOverTableRowDesc" style="width:100mm;" 
									scope="row">Line 26 - Divorced Spouse SSN:</td>
									
								<td class="styLeftOverTableRowAmount" style="width:87mm;">
									<xsl:call-template name="PopulateSSN">
										<xsl:with-param name="TargetNode" select="$FormData/EstimatedTaxPaymentsAmt/@divorcedSpouseSSN"/>
									</xsl:call-template>
								</td>                          
							</tr>
						</xsl:if>
						<xsl:call-template name="PopulateLeftoverRow">
							<xsl:with-param name="Desc">Line 26 - Divorced Literal Code</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$FormData/EstimatedTaxPaymentsAmt/@divorcedLiteralCd"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRow">
							<xsl:with-param name="Desc">Line 27 - Earned Income Credit Eligibility Literal Code</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$FormData/EICEligibilityLiteralCd"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRow">
							<xsl:with-param name="Desc">Line 28 - Additional Child Prior Year Earned Income Code</xsl:with-param>
							<xsl:with-param name="TargetNode" 
							select="$FormData/PYEarnedIncmAdditonalChldTxGrp/PriorYearEarnedIncomeCd"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRowAmount">
							<xsl:with-param name="Desc">Line 28 - Additional Child Prior Year Earned Income Amount</xsl:with-param>
							<xsl:with-param name="TargetNode" 
							select="$FormData/PYEarnedIncmAdditonalChldTxGrp/PriorYearEarnedIncomeAmt"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRow">
							<xsl:with-param name="Desc">Line 33 - Form 8689 Code</xsl:with-param>
							<xsl:with-param name="TargetNode" 
								select="$FormData/TotalPaymentsAmt/@form8689Cd"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRowAmount">
							<xsl:with-param name="Desc">Line 33 - Form 8689 Amount</xsl:with-param>
							<xsl:with-param name="TargetNode" 
								select="$FormData/TotalPaymentsAmt/@form8689Amt"/>
						</xsl:call-template>
					</table>
					<!-- Special Condition Descriptions -->
					<xsl:if test="count($FormData/SpecialConditionDesc) &gt; 1">
						<span class="styRepeatingDataTitle" style="padding-top:5mm;">
							Top Right Margin - Special Condition Description</span>
						<table class="styDepTbl" cellspacing="0" style="font-size:7pt;">
							<thead class="styTableThead">
								<tr class="styDepTblHdr">
									<th class="styDepTblCell" scope="col" rowspan="1" style="width:91.5mm;">
									  Special Condition Description
								   </th>
								</tr>
							</thead>
							<tbody>
								<xsl:for-each select="$FormData/SpecialConditionDesc">
									<tr style="border-color:black;height:6mm;">
										<xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
										<td class="styTableCellText" style="width:91.5mm;">
											<div style="width:6.5mm;" class="styGenericDiv">
												<div style="width:6mm;font-weight:bold;float:right;clear:none;">
													<span class="styBoldText" style="float:right;text-align:right;
														padding-right:2mm;">
														<xsl:value-of select="position()"/>
													</span>
												</div>
											</div>
											<div style="width:80mm;float:none;clear:none;">
												<xsl:variable name="pos" select="position()"/>
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="."/>
												</xsl:call-template>
											</div>
										</td>
									</tr>
								</xsl:for-each>
							</tbody>
						</table>
					</xsl:if>
					<!-- Refund Product Codes -->
					<xsl:if test="count($FormData/RefundProductCd) &gt; 1">
						<span class="styRepeatingDataTitle" style="padding-top:5mm;">
							Top Right Margin - Refund Product Code</span>
						<table class="styDepTbl" cellspacing="0" style="font-size:7pt;">
							<thead class="styTableThead">
								<tr class="styDepTblHdr">
									<th class="styDepTblCell" scope="col" rowspan="1" style="width:91.5mm;">
									  Refund Product Code
								   </th>
								</tr>
							</thead>
							<tbody>
								<xsl:for-each select="$FormData/RefundProductCd">
									<tr style="border-color:black;height:6mm;">
										<xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
										<td class="styTableCellText" style="width:91.5mm;">
											<div style="width:6.5mm;" class="styGenericDiv">
												<div style="width:6mm;font-weight:bold;float:right;clear:none;">
													<span class="styBoldText" style="float:right;text-align:right;
														padding-right:2mm;">
														<xsl:value-of select="position()"/>
													</span>
												</div>
											</div>
											<div style="width:80mm;float:none;clear:none;">
												<xsl:variable name="pos" select="position()"/>
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="."/>
												</xsl:call-template>
											</div>
										</td>
									</tr>
								</xsl:for-each>
							</tbody>
						</table>
					</xsl:if>
						<!-- Begin Separated Repeating data table for DependentInformations -->
					<xsl:if test="($Print = $Separated) or (count($FormData/DependentDetail) &gt; 4)">
					<br />
					<br />
					<span class="styRepeatingDataTitle">Form 1040SR - Dependents (see instructions):</span>
					<table class="styDepTbl" cellspacing="0" style="font-size:7pt;">
						<thead class="styTableThead">
							<tr class="styDepTblHdr">
                <th class="styDepTblCell" scope="col" style="width:67.4mm;text-align:left;padding-left:1mm;padding-top:0mm;">
                  &nbsp;
								</th>
								<th class="styDepTblCell" scope="col" style="width:25mm;text-align:left;padding-left:1mm;">
										<b>(1)</b><span style="width:.5mm"/>
										First name 
								</th>
								<th class="styDepTblCell" scope="col" style="min-width:24mm;width:27.2mm;border-right-width:1px;vertical-align:top;">
									<span style="font-weight:normal">
										<b>(2)</b><span style="width:.5mm"/>
										Last name
									</span>														
								</th>
								<th class="styDepTblCell" scope="col" style="min-width:24mm;width:27.2mm;border-right-width:1px;vertical-align:top;">
									<span style="font-weight:normal">
										<b>(3)</b><span style="width:.5mm"/>
										Identifying number
									</span>														
								</th>
								<th class="styDepTblCell" scope="col" style="width:30.6mm;border-right-width:1px;vertical-align:top;">
									<span style="font-weight:normal;">
										<b>(4)</b><span style="width:.5mm"/>
									   Relationship
									</span>
								</th>
								<th class="styDepTblCell" scope="colgroup" style="width:61.6mm;border-right-width:0px;vertical-align:top;">
									<span style="font-weight:normal">
										<b>(5)</b> Check if lived with you more than half of 2025
									</span>
								</th>
								<th class="styDepTblCell" scope="col" style="width:25mm;font-weight:normal;">
									  <span style="font-weight:normal;">
										<b>(6)</b><span style="width:.5mm"/>
										Check if
									  </span>
								</th>
								<th class="styDepTblCell" scope="col" style="width:28.6mm;font-weight:normal;">
									  <span style="font-weight:normal;">
										<b>(7)</b><span style="width:.5mm"/>
										Credits
									  </span>
								</th>
							</tr>
						</thead>
						<tbody>
							<xsl:for-each select="$FormData/DependentDetail">
								<tr style="border-color:black;height:6mm;">
									<xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
                  <td class="styTableCellTextInherit">
                    <span style="text-align:right;float:left;font-weight:bold;" class="styGenericDiv">Dependent <xsl:number value="position()" format="1"/></span>
                  </td>
									<td class="styTableCellTextInherit">
										<span style="width:29mm;text-align:left;float:left;clear:none;">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="DependentFirstNm"/>
											</xsl:call-template>
										</span>
									</td>
									<td class="styTableCellTextInherit">
                    <span style="width:29mm;text-align:left;">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="DependentLastNm"/>
											</xsl:call-template>
											<span style="float:right;">
												<xsl:call-template name="LinkToLeftoverDataTableInline">
													<xsl:with-param name="Desc">Dependent <xsl:number value="position()"/> Name Control</xsl:with-param>
													<xsl:with-param name="TargetNode" select="DependentNameControlTxt"/>
												</xsl:call-template>
											</span>
										</span>
									</td>
									<td class="styTableCellCtrInherit">
										<xsl:choose>
											<xsl:when test="DiedLiteralCd">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="DiedLiteralCd"/>
												</xsl:call-template>
											</xsl:when>
											<xsl:otherwise>
												<xsl:call-template name="PopulateSSN">
													<xsl:with-param name="TargetNode" select="DependentSSN"/>
												</xsl:call-template>
											</xsl:otherwise>
										</xsl:choose>
									</td>
									<td class="styTableCellTextInherit">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="DependentRelationshipCd"/>
										</xsl:call-template>
									</td>
									<td class="styTableCellCtrInherit">
										 
										<input type="Checkbox" class="styCkboxNM">
											<xsl:call-template name="PopulateCheckbox">
												<xsl:with-param name="TargetNode" select="YesLiveWithChildOverHalfYrInd"/>
												<xsl:with-param name="BackupName">IRS1040SRDependentInformation<xsl:number value="position()"/>YesLiveWithChildOverHalfYrInd</xsl:with-param>
											</xsl:call-template>
											<xsl:attribute name="aria-label">Live With Dependent <xsl:number value="position()"/> Over Half Year Yes</xsl:attribute>
											Yes
										</input>
										<br/>
										<div style="width:100%;border-bottom:1px solid black;padding-bottom:0.5mm;"/>
										 <input type="checkbox" class="styCkbox">
														<xsl:attribute name="aria-label">Dependent <xsl:value-of select="position()"/> Lived in the US"</xsl:attribute>
														<xsl:call-template name="PopulateCheckbox">
														  <xsl:with-param name="TargetNode" select="YesLiveWithChldUSOvrHalfYrInd"/>
														  <xsl:with-param name="BackupName">IRS1040SRCTCInd</xsl:with-param>
														</xsl:call-template>
														And in the U.S.
										</input>
									</td>
									<td class="styTableCellCtrInherit">
										<input type="Checkbox" class="styCkbox">
											<xsl:call-template name="PopulateCheckbox">
												<xsl:with-param name="TargetNode" select="ChildIsAStudentUnder24Ind"/>
												<xsl:with-param name="BackupName">IRS1040SRDependentInformation<xsl:number value="position()"/>ChildIsAStudentUnder24Ind</xsl:with-param>
											</xsl:call-template>
											<xsl:attribute name="aria-label">Dependent <xsl:number value="position()"/> is a student under 24 Indicator</xsl:attribute>
										</input>
										<br/>
										Full-time student
										<div style="width:100%;border-bottom:1px solid black;padding-bottom:0.5mm;"/>
										<input type="Checkbox" class="styCkbox" style="margin-left:1mm;border-left:1px solid black;">
											<xsl:call-template name="PopulateCheckbox">
												<xsl:with-param name="TargetNode" select="ChildPermanentlyDisabledInd"/>
												<xsl:with-param name="BackupName">IRS1040SRDependentInformation<xsl:number value="position()"/>ChildPermanentlyDisabledInd</xsl:with-param>
											</xsl:call-template>
											<xsl:attribute name="aria-label">Dependent <xsl:number value="position()"/> is permanently disabled indicator</xsl:attribute>
										</input>
										<br/>
										Permanently and totally disabled
									</td>
									<td class="styTableCellCtrInherit">
										<input type="Checkbox" class="styCkbox">
											<xsl:call-template name="PopulateCheckbox">
												<xsl:with-param name="TargetNode" select="EligibleForODCInd"/>
												<xsl:with-param name="BackupName">IRS1040SRDependentInformation<xsl:number value="position()"/>EligibleForODCInd</xsl:with-param>
											</xsl:call-template>
											<xsl:attribute name="aria-label">Dependent <xsl:number value="position()"/> Eligible for ODC Indicator</xsl:attribute>
										</input>
										<br/>
										Child tax credit
										<div style="width:100%;border-bottom:1px solid black;padding-bottom:0.5mm;"/>
										<input type="Checkbox" class="styCkbox" style="margin-left:1mm;border-left:1px solid black;">
											<xsl:call-template name="PopulateCheckbox">
												<xsl:with-param name="TargetNode" select="EligibleForODCInd"/>
												<xsl:with-param name="BackupName">IRS1040SRDependentInformation<xsl:number value="position()"/>EligibleForODCInd</xsl:with-param>
											</xsl:call-template>
											<xsl:attribute name="aria-label">Dependent <xsl:number value="position()"/> Eligible for ODC Indicator</xsl:attribute>
										</input>
										<br/>
										Credit for other dependents
									</td>
								</tr>
							</xsl:for-each>
						</tbody>
					</table>
				</xsl:if>
					<!-- IRA Distributions Literal Codes -->
					<xsl:if test="count($FormData/IRADistributionsLiteralCd) &gt; 1">
						<span class="styRepeatingDataTitle" style="padding-top:5mm;">Line 4b - IRA Distributions
							Literal Code</span>
						<table class="styDepTbl" cellspacing="0" style="font-size:7pt;">
							<thead class="styTableThead">
								<tr class="styDepTblHdr">
									<th class="styDepTblCell" scope="col" rowspan="1" style="width:91.5mm;">
									  IRA Distributions Literal code
								   </th>
								</tr>
							</thead>
							<tbody>
								<xsl:for-each select="$FormData/IRADistributionsLiteralCd">
									<tr style="border-color:black;height:6mm;">
										<xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
										<td class="styTableCellText" style="width:91.5mm;">
											<div style="width:6.5mm;" class="styGenericDiv">
												<div style="width:6mm;font-weight:bold;float:right;clear:none;">
													<span class="styBoldText" style="float:right;text-align:right;
														padding-right:2mm;">
														<xsl:value-of select="position()"/>
													</span>
												</div>
											</div>
											<div style="width:80mm;float:none;clear:none;">
												<xsl:variable name="pos" select="position()"/>
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="."/>
												</xsl:call-template>
											</div>
										</td>
									</tr>
								</xsl:for-each>
							</tbody>
						</table>
					</xsl:if>
					<xsl:if test="count($FormData/OtherTaxAmtGrp) &gt; 1">
						<br/>
						<br/>
						<span class="styRepeatingDataTitle">Line 16(3) - Other Tax Groups</span>
						<table class="styDepTbl" cellspacing="0" style="font-size:7pt;width:120mm;">
							<thead class="styTableThead">
								<tr class="styDepTblHdr">
									<th class="styDepTblCell" scope="col" style="width:32mm;">
										Other Tax Amount Code
									</th>
									<th class="styDepTblCell" scope="col" style="width:32mm;">
										Other Tax Text
									</th>
									<th class="styDepTblCell" scope="col" style="width:32mm;">
										Other Tax Amount
									</th>
								</tr>
							</thead>
							<tbody>
								<xsl:for-each select="$FormData/OtherTaxAmtGrp">
									<tr style="border-color:black;height:6mm;">
										<xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
										<td class="styTableCellTextInherit">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="OtherTaxAmtCd"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellTextInherit">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="OtherTaxTxt"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellAmtInherit">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="OtherTaxAmt"/>
											</xsl:call-template>
										</td>
									</tr>
								</xsl:for-each>
							</tbody>
						</table>
					</xsl:if>
					<br />
				</form>
			</body>
		</html>
	</xsl:template>	
</xsl:stylesheet>
