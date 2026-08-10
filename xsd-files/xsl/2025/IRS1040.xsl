<?xml version="1.0" encoding="UTF-8"?>
<!-- Form 1040 - TY25 - Last Modified by Yee Chen on 11/18/2025 -->
<!DOCTYPE xsl:stylesheet [
  <!ENTITY nbsp "&#160;">
  <!ENTITY ndash "&#8211;">
  <!ENTITY mdash "&#8212;">
]>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:include href="PopulateTemplate.xsl" />
	<xsl:include href="AddHeader.xsl" />
	<xsl:include href="CommonPathRef.xsl" />
	<xsl:include href="AddOnTable.xsl" />
	<xsl:include href="IRS1040Style.xsl" />
	<xsl:include href="IRS1040SR.xsl" />
	<xsl:include href="IRS1040SRStyle.xsl" />
	<xsl:output method="html" indent="yes" />
	<xsl:strip-space elements="*" />
	<xsl:param name="FormData" select="$RtnDoc/IRS1040" />
	<xsl:param name="FormDataSch8812" select="$RtnDoc/IRS1040Schedule8812" />
	<xsl:template match="/">
		<xsl:choose>
			<xsl:when test="$FormData/Form1040SRInd!=''">
				<xsl:call-template name="DisplayIRS1040SR"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:call-template name="DisplayIRS1040"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template name="DisplayIRS1040">
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
						<xsl:call-template name="IRS1040Style" />
						<xsl:call-template name="AddOnStyle" />
					</xsl:if>
				</style>
				<xsl:call-template name="GlobalStylesForm" />
			</head>
			<body class="styBodyClass">
				<form id="Form1040">
				    <xsl:if test="$FormData/AmendedReturnInd='X'"><span style="padding-right:10mm; color:red; font-size:8pt;font-weight:bold;"> AMENDED RETURN </span></xsl:if>
				    <xsl:if test="$FormData/SupersededReturnInd='X'"><span style="padding-right:10mm; color:red; font-size:8pt;font-weight:bold;"> SUPERSEDED</span></xsl:if>
				    <xsl:if test="$FormData/AddressChangeInd='X'"><span style="color:red; font-size:8pt;font-weight:bold;"> ADDRESS CHANGE </span></xsl:if>
					<xsl:call-template name="DocumentHeader" />
					<!-- Header -->		
					<div class="styStdDiv" style="height:12mm; border-bottom:2px solid black;">
					    <div class="styGenericDiv" style="width:22.8mm;height:11mm;padding-top:4px;">
							<span class="" style="margin-top:3.5mm;margin-left:-1mm;margin-right:-1mm;;transform:rotate(270deg);float:left;">Form</span>
							<span class="styFormNumber" style="margin-top:1mm;">1040</span>
						</div>
						<div class="styGenericDiv" style="width:65mm;padding-right:1mm;padding-top:6px;height:11mm;">
							<span class="styAgency">Department of the Treasury - Internal Revenue Service</span>
							
							<span class="styMainTitle" style="font-family:Arial-Narrow;font-size:12pt">U.S. Individual Income Tax Return</span>
						</div>
						<div class="styTYBox" style="width:18mm;border-right-width:1px;height:11mm;padding-top:4px;">
							<span class="styTaxYear">20<span class="styTYColor">25</span></span>
						</div>
						<div class="styOMB" style="width:28mm;height:11mm;padding:1mm 1mm 1mm 1mm;float:left;
						  border-width:0px 1px 0px 0px;vertical-align:top;">
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$FormData/BackupWhSchedulesK1Statement"/>
							</xsl:call-template>
							<xsl:call-template name="LinkToLeftoverDataTableInline">
								<xsl:with-param name="Desc">Top Right Margin - Special Processing Literal Code</xsl:with-param>
								<xsl:with-param name="TargetNode" select="$FormData/SpecialProcessingLiteralCd"/>
							</xsl:call-template>							
							<br/>
						  	OMB No. 1545-0074
						</div>
						<div class="styGenericDiv" style="width:50mm;height:11mm;font-family:Arial-Narrow;font-size:6.5pt;padding:5px 0px 1mm 1mm;vertical-align:bottom;">
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
							&nbsp;<br/>
							IRS Use Only - Do not write or staple in this space.
						</div>
					</div>
					<!-- For the year section -->
					<div class="styStdDiv" style="height:6mm;  border-bottom:1px solid black; ">
						<div style="padding-top:1mm;">	
						For the year Jan. 1 – Dec. 31, 2025, or other tax year beginning 
						<span style="width:25mm;padding-left:3px;text-align:center;">
							<xsl:call-template name="PopulateReturnHeaderTaxPeriodBeginDate"/>
						</span>
						, ending
						<span style="width:25mm;padding-left:3px;text-align:center;">
							<xsl:call-template name="PopulateReturnHeaderTaxPeriodEndDate"/>
						</span>
						</div>
						<div style="height:100%; float:right; padding-top:1mm; padding-left:2mm; border-left: 1px solid black;">  
						See separate instructions.
						</div>
					</div>	
					<!-- Filed pursuant to section 301.9100-2 -->
					<div class="styStdDiv" style="height:6mm;  border-bottom:1px solid black; ">
						<span style="display:inline;">
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
							<span style="width:1mm;"/>		
						</span>
						<!-- Combat Zone section -->
						<span style="display:inline;">
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
							<span style="width:45mm;font-size:8.5px;">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$FormData/CombatZoneDtl/CombatZoneLiteralCd"/>
									</xsl:call-template>
									<span style="width:1mm;"/>
									<xsl:call-template name="PopulateMonthDayYear">
										<xsl:with-param name="TargetNode" select="$FormData/CombatZoneDtl/CombatZoneCd/@combatZoneDt"/>
									</xsl:call-template>
							</span>
							<span style="width:0.5mm;"/>	
						</span>
							<!-- Primary Deceased checkbox -->
						<span style="display:inline;">
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
							<span style="width:0.5mm;"/>	
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
						<span style="width:0.5mm;"/>
							<!-- Spouse Deceased box -->
							<span style="display:inline;">
							Spouse
							<span style="width:0.5mm;"/>	
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
						<span style="display:inline;">
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
							<span style="width:36mm;">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/SpecialConditionTxt[1]"/>
							</xsl:call-template>
							</span>
							<span style="width:28mm;"/>	
							<span style="border-left:1px dashed black;width:36mm;">
							<span style="width:1mm;"/>
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/SpecialConditionTxt[2]"/>
							</xsl:call-template>
							</span>
							<span style="width:25mm;"/>
							<span style="border-left:1px dashed black;width:38mm;">
							<span style="width:1mm;"/>
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/SpecialConditionTxt[3]"/>
							</xsl:call-template>
							</span>
						</span>
					</div>
					<!-- Filer information section -->
					<div class="styStdDiv">
						<div class="styIRS1040HeaderCell" style="width:78mm;">
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
						<div class="styIRS1040HeaderCell" style="width:63mm;">
							Last name <br /> &nbsp;
						</div>
						<div class="styIRS1040HeaderCell" style="width:46mm;border-right-width:0px;padding-left:1px;">
							<strong>Your social security number</strong><br />
							<xsl:call-template name="PopulateReturnHeaderFilerTIN">
								<xsl:with-param name="EINChanged" select="true()"/>
							</xsl:call-template>
						</div>
					</div>
					<div class="styStdDiv">
						<div class="styIRS1040HeaderCell" style="width:78mm;">
							If joint return, spouse's first name and middle initial <br /> 
							<xsl:call-template name="LinkToLeftoverDataTableInline">
								<xsl:with-param name="Desc">Header - Spouse Name Control</xsl:with-param>
								<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/SpouseNameControlTxt"/>
							</xsl:call-template>
							&nbsp;
						</div>
						<div class="styIRS1040HeaderCell" style="width:63mm;">
							Last name <br /> &nbsp;
						</div>
						<div class="styIRS1040HeaderCell" style="width:46mm;border-right-width:0px;padding-left:1px;">
							<strong>Spouse's social security number</strong><br />
							<xsl:call-template name="PopulateReturnHeaderFiler">
								<xsl:with-param name="TargetNode">SpouseSSN</xsl:with-param>
								<xsl:with-param name="EINChanged" select="true()"/>
							</xsl:call-template>
						</div>
					</div>
					<div class="styStdDiv">
						<div class="styIRS1040HeaderCell" style="width:129mm;height:10.5mm;">
							<span style="font-family:Arial;">Home address (number and street). If you have a P.O. box, see instructions.</span> <br /> 
							<xsl:call-template name="PopulateReturnHeaderFiler">
								<xsl:with-param name="TargetNode">AddressLine1Txt</xsl:with-param>
							</xsl:call-template>
							<br/>
							<xsl:call-template name="PopulateReturnHeaderFiler">
								<xsl:with-param name="TargetNode">AddressLine2Txt</xsl:with-param>
							</xsl:call-template>
							&nbsp;
						</div>
						<div class="styIRS1040HeaderCell" style="width:12.06mm;height:10.5mm;font-family:Arial;">
							Apt. no. <br /> &nbsp;
						</div>
						<div class="styIRS1040HeaderCell" style="width:45.9mm;height:10.5mm;border-right-width:0px;float:right;">
							<span style="font-size:5.8pt;">Check here if your main home, and your spouse’s if filing a joint return, was in the U.S. for more than half of 2025.
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
						<div class="styIRS1040HeaderCell" style="width:101mm;height:8.5mm;">
							<span style="font-family:Arial;">City, town, or post office. If you have a
							   foreign address, also complete spaces below.</span><br />
							<xsl:if test="$RtnHdrData/Filer/USAddress/CityNm">
								<xsl:call-template name="PopulateReturnHeaderFiler">
									<xsl:with-param name="TargetNode">CityNm</xsl:with-param>
								</xsl:call-template>
							</xsl:if>
							<xsl:if test="$RtnHdrData/Filer/ForeignAddress/CityNm">
								<xsl:call-template name="PopulateReturnHeaderFiler">
									<xsl:with-param name="TargetNode">CityNm</xsl:with-param>
								</xsl:call-template>
							</xsl:if>
						</div>
						<div class="styIRS1040HeaderCell" style="width:20mm;height:8.5mm;">
							<span style="font-family:Arial;">State
							</span><br />
							<xsl:if test="$RtnHdrData/Filer/USAddress/StateAbbreviationCd">
								<xsl:call-template name="PopulateReturnHeaderFiler">
									<xsl:with-param name="TargetNode">StateAbbreviationCd</xsl:with-param>
								</xsl:call-template>
							</xsl:if>
						</div>
						<div class="styIRS1040HeaderCell" style="width:20.06mm;height:8.5mm;">
							<span style="font-family:Arial;">ZIP code
							</span><br />
							<xsl:if test="$RtnHdrData/Filer/USAddress/ZIPCd">
								<xsl:call-template name="PopulateReturnHeaderFiler">
									<xsl:with-param name="TargetNode">ZIPCd</xsl:with-param>
								</xsl:call-template>
							</xsl:if>
						</div>
						<div class="styIRS1040HeaderCell" style="width:45.9mm;height:17mm;border-right-width:0px;float:right;font-size:7.5px;">
							<strong>Presidential Election Campaign</strong><br />
							<span style="font-size:6pt;">Check here if you, or your spouse if filing jointly, want $3 to go to this fund. Checking a box below will not change your tax or refund.<br/>
								<input type="checkbox" class="styCkboxNM" style="" aria-label="PECF Primary Ind You">
									<xsl:call-template name="PopulateCheckbox">
										<xsl:with-param name="TargetNode" select="$FormData/PECFPrimaryInd"/>
										<xsl:with-param name="BackupName" select="IRS1040PECFPrimaryInd"/>
									</xsl:call-template>
								</input>
								<span style="width:4px;"/>
								<label><span style="front-size:4pt;">
									<xsl:call-template name="PopulateLabel">
										<xsl:with-param name="TargetNode" select="$FormData/PECFPrimaryInd"/>
										<xsl:with-param name="BackupName" select="IRS1040PECFPrimaryInd"/>
									</xsl:call-template>
									<b>You</b></span>
								</label>
								<span style="width:10px;"/>
								<input type="checkbox" class="styCkboxNM" aria-label="PECF Spouse Ind Spouse">
									<xsl:call-template name="PopulateCheckbox">
										<xsl:with-param name="TargetNode" select="$FormData/PECFSpouseInd"/>
										<xsl:with-param name="BackupName" select="IRS1040PECFSpousend"/>
									</xsl:call-template>
								</input>
								<span style="width:4px;"/>
								<label><span style="front-size:4pt;">
									<xsl:call-template name="PopulateLabel">
										<xsl:with-param name="TargetNode" select="$FormData/PECFSpouseInd"/>
										<xsl:with-param name="BackupName" select="IRS1040PECFSpouseInd"/>
									</xsl:call-template>
									<b>Spouse</b></span>
								</label>
							</span>
						</div>
						<div class="styIRS1040HeaderCell" style="width:60mm;height:8.5mm;">
							<span style="font-family:Arial;">Foreign country name</span> <br /> 
							<xsl:call-template name="PopulateReturnHeaderFiler">
								<xsl:with-param name="TargetNode">CountryCd</xsl:with-param>
								<xsl:with-param name="MainForm" select="true()"/>
							</xsl:call-template>
							&nbsp;
						</div>
						<div class="styIRS1040HeaderCell" style="width:41mm;height:8.5mm;">
							<span style="font-family:Arial;">Foreign province/state/county</span> <br /> 
							<xsl:call-template name="PopulateReturnHeaderFiler">
								<xsl:with-param name="TargetNode">ProvinceOrStateNm</xsl:with-param>
							</xsl:call-template>
							&nbsp;
						</div>
						<div class="styIRS1040HeaderCell" style="width:40.06mm;height:8.5mm;font-family:Arial;">
							<span style="font-family:Arial;">Foreign postal code</span> <br /> 
							<xsl:call-template name="PopulateReturnHeaderFiler">
								<xsl:with-param name="TargetNode">ForeignPostalCd</xsl:with-param>
							</xsl:call-template>
							&nbsp;
						</div>
					</div>
					<!-- Filing status section -->
					<div class="styStdDiv" style="border-bottom:1px solid black;">
						<div style="width:25mm;height:5mm;padding-top:1mm;float:left;">
							<span style="font-weight:bold;margin-top:2px;font-size:8pt">Filing Status</span><br />
							<span style="padding-top:0.5mm;font-size:8pt">Check only <br />one box.</span>
						</div>
						<div style="width:81mm;min-height:4mm;padding-top:1.0mm;float:left;">
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
								<span style="width:17mm;"/>
								
									<!-- 3 Married filing separately (MFS) checkbox-->
								<span style="padding-left:0mm;width:70mm;">
								<input type="checkbox" class="styCkboxNM" aria-label="Married filing separately (MFS)" style="margin-right:1mm;">
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
									</xsl:call-template>Married filing separately (MFS). Enter spouse’s SSN above <br/>
									<span style="padding-left:4mm;">
									and full name here:
									</span></label>
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
						<div style="width:81mm;min-height:4mm;padding-top:1.0mm;float:left;">
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
							<div style="width:162mm;padding-left:25mm;">
							<br/>
							<span style="margin-top:-3mm;">
							<input type="checkbox" class="styCkboxNM" aria-label="treating nonresident alien or dual status">
									<xsl:call-template name="PopulateCheckbox">
										<xsl:with-param name="TargetNode" select="$FormData/NRASpouseTreatedAsResidentGrp/NRASpouseTreatedAsResidentInd"/>
										<xsl:with-param name="BackupName" select="NRASpouseTreatedAsResidentInd"/>
									</xsl:call-template>
							</input>
							If treating a nonresident alien or dual-status alien spouse as a U.S. resident for the entire tax year, check the box and enter their name (see instructions and attach statement if required): 
							<xsl:call-template name="PopulateText">
							<xsl:with-param name="TargetNode" select="$FormData/NRASpouseTreatedAsResidentGrp/SpouseNm">
							</xsl:with-param>
							</xsl:call-template>
							</span>
					</div>
				</div>
					<!-- Digital Assets-->
					<div style="width:187mm;height:9mm;border-bottom:1px solid black">				
					<div style="width:20mm;height:9mm;padding-top:1.25mm;float:left;">
							<strong>Digital<br/>Assets</strong>
					</div>
					<div class="styIRS1040HeaderCell" style="height:9mm;width:167mm;font-size:7pt;padding-top:1.1mm;
						 padding-left:0mm;border-width:0;">
							At any time during 2025, did you: (a) receive (as a reward, award, or payment for property or services); or (b) sell,
							exchange,<br/>or otherwise dispose of a digital asset (or a financial interest in a digital asset)? (See instructions.)
							<span class="sty1040DotLn" style="float:none;">....</span>						 
							<span style="float:right;">
							<span style="font-size:7.5pt;">
								<!-- ++++++++++++++ Yes Checkbox +++++++++++++ -->
									<xsl:call-template name="PopulateSpan">
										<xsl:with-param name="TargetNode" select="$FormData/VirtualCurAcquiredDurTYInd"/>
									</xsl:call-template>
									<input type="checkbox" aria-label="digital asset Yes" class="styCkbox">
										<xsl:call-template name="PopulateYesCheckbox">
											<xsl:with-param name="TargetNode" select="$FormData/VirtualCurAcquiredDurTYInd"/>
											<xsl:with-param name="BackupName">IRS1040VirtualCurAcquiredDurTYInd</xsl:with-param>
										</xsl:call-template>
									</input>
								</span>
								<span style="width:1mm;"/>
								<label>
									<xsl:call-template name="PopulateLabelYes">
										<xsl:with-param name="TargetNode" select="$FormData/VirtualCurAcquiredDurTYInd"/>
										<xsl:with-param name="BackupName">IRS1040VirtualCurAcquiredDurTYInd</xsl:with-param>
									</xsl:call-template>
									<span class="styBoldText">Yes</span>
								</label>
								<!-- ++++++++++++++ No Checkbox +++++++++++++ -->
								<span style="width:3mm;"/>
								<span>
									<xsl:call-template name="PopulateSpan">
										<xsl:with-param name="TargetNode" select="$FormData/VirtualCurAcquiredDurTYInd"/>
									</xsl:call-template>
									<input type="checkbox" aria-label="digital asset No" class="styCkbox">
										<xsl:call-template name="PopulateNoCheckbox">
											<xsl:with-param name="TargetNode" select="$FormData/VirtualCurAcquiredDurTYInd"/>
											<xsl:with-param name="BackupName">IRS1040VirtualCurAcquiredDurTYInd</xsl:with-param>
										</xsl:call-template>
									</input>
								</span>
								<span style="width:1mm;"/>
								<label>
									<xsl:call-template name="PopulateLabelNo">
										<xsl:with-param name="TargetNode" select="$FormData/VirtualCurAcquiredDurTYInd"/>
										<xsl:with-param name="BackupName">IRS1040VirtualCurAcquiredDurTYInd</xsl:with-param>
									</xsl:call-template>
									<span class="styBoldText">No</span>
								</label>	
								</span> 					
						</div>
					</div>											
					<!-- Dependents area -->
					<div class="sty1040DepdContainer" style="display:block;overflow:visible;border-top-width: 1.5px;">
						<div class="styGenericDiv" style="width:20mm;padding-top:1mm;
							font-family:Arial;font-size:7pt;border-bottom:0px solid black;">
							<div style="width:100%;padding-bottom:3mm;padding-left:1mm;">
								<strong>Dependents</strong><br />
								(see instructions)<br/>
								<span style="font-size:7.5pt;font-family:Arial Narrow">
									If more<br/>than four <br/>dependents,<br/>see instructions<br/>and check<br/>here
						  			<label>
										<xsl:call-template name="PopulateLabel">
											<xsl:with-param name="TargetNode" select="$FormData/MoreDependentsInd"/>
											<xsl:with-param name="BackupName">IRS1040NRMoreDependentsInd
										    </xsl:with-param>
										</xsl:call-template>
									</label>
						    		<span style="width:2px"/>
									<input type="checkbox" class="styCkboxNM" style="" aria-label="more than four dependents">
										<xsl:call-template name="PopulateCheckbox">
											<xsl:with-param name="TargetNode" select="$FormData/MoreDependentsInd"/>
											<xsl:with-param name="BackupName">IRS1040NRMoreDependentsInd
											</xsl:with-param>
									   </xsl:call-template>
									</input>
								</span>
							</div>
						</div>
						<!-- (Dependent Table) ///////////////////////////////////////////////-->
						<div class="sty1040DepdContainer2" style="width:167mm;margin-left:0mm;height:auto;">
							<div id="DependentDetailDiv" class="styTableContainerNBB" style="width:100%;border-top-width:0px;">
								<!--<xsl:call-template name="SetInitialState"/>-->
								<xsl:variable name="DependentDetailCount" select="count($FormData/DependentDetail)" />
								<table class="styTable" style="width:100%;display:table;border-width-top:1px;" cellspacing="0">
									<thead>
										<tr>
										  <td class="styIRS1040TableCell" scope="colgroup" style="width:12%;">
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
										  <th class="styIRS1040TableCell" scope="colgroup" style="width:22%;text-align:center;"><strong>Dependent 1</strong></th>
										  <th class="styIRS1040TableCell" scope="colgroup" style="width:22%;text-align:center;"><strong>Dependent 2</strong></th>
										  <th class="styIRS1040TableCell" scope="colgroup" style="width:22%;text-align:center;"><strong>Dependent 3</strong></th>
										  <th class="styIRS1040TableCell" scope="colgroup" style="width:22%;text-align:center;border-right-width:0px;"><strong>Dependent 4</strong></th>
										</tr>
									</thead>
									<tbody>
										<xsl:choose>
										  <xsl:when test="$DependentDetailCount = 0 or $DependentDetailCount &gt; 4 or $Print = $Separated">
											<tr>
											  <th class="styIRS1040TableCell" style="text-align:left;" scope="row"><strong>(1)</strong><span style="padding-left:1mm;font-weight:normal;text-align:left;">First Name</span></th>
											  <td class="styIRS1040TableCell" style="text-align:center;">
												<xsl:if test="$DependentDetailCount &gt; 4 or $Print = $Separated">
												  <span>See Additional Data Table</span>
												</xsl:if>
											  </td>
											  <td class="styIRS1040TableCell"></td>
											  <td class="styIRS1040TableCell"></td>
											  <td class="styIRS1040TableCell" style="border-right-width:0px;"></td>
											</tr>
											<tr>
											  <th class="styIRS1040TableCell" style="text-align:left;" scope="row"><strong>(2)</strong><span style="padding-left:1mm;font-weight:normal;text-align:left;">Last Name</span></th>
											  <td class="styIRS1040TableCell"></td>
											  <td class="styIRS1040TableCell"></td>
											  <td class="styIRS1040TableCell"></td>
											  <td class="styIRS1040TableCell" style="border-right-width:0px;"></td>
											</tr>
											<tr>
											  <th class="styIRS1040TableCell" style="text-align:left;" scope="row"><strong>(3)</strong><span style="padding-left:1mm;font-weight:normal;text-align:left;">SSN</span></th>
											  <td class="styIRS1040TableCell"></td>
											  <td class="styIRS1040TableCell"></td>
											  <td class="styIRS1040TableCell"></td>
											  <td class="styIRS1040TableCell" style="border-right-width:0px;"></td>
											</tr>
											<tr>
											  <th class="styIRS1040TableCell" style="text-align:left;" scope="row"><strong>(4)</strong><span style="padding-left:1mm;font-weight:normal;text-align:left;">Relationship</span></th>
											  <td class="styIRS1040TableCell"></td>
											  <td class="styIRS1040TableCell"></td>
											  <td class="styIRS1040TableCell"></td>
											  <td class="styIRS1040TableCell" style="border-right-width:0px;"></td>
											</tr>
											<tr>
											  <th class="styIRS1040TableCell" style="text-align:left;" scope="row">
											  <strong style="vertical-align:top;">(5)</strong>
											  <span style="padding-left:1mm;font-weight:normal;font-size:7.5px;">Check if lived<br/> with you more<br/></span>
											  <span style="padding-left:1mm;font-weight:normal;font-size:7.5px;">than half of 2025</span>
											  </th>
											  <td class="styIRS1040TableCell" style="text-align:center;">
												<strong>(a)</strong>
												<input type="checkbox" aria-label="Live With Dependent 1 Over Half Year yes"/>Yes<br/>
												<strong>(b)</strong>
												<input type="checkbox" aria-label="Dependent 1 in the U.S."/>And in the U.S.
											  </td>
											  <td class="styIRS1040TableCell" style="text-align:center;">
												<strong>(a)</strong>
												<input type="checkbox" aria-label="Live With Dependent 2 Over Half Year yes"/>Yes<br/>
												<strong>(b)</strong>
												<input type="checkbox" aria-label="Dependent 2 in the U.S."/>And in the U.S.
											  </td>
											  <td class="styIRS1040TableCell" style="text-align:center;">
											  <strong>(a)</strong>
												<input type="checkbox" aria-label="Live With Dependent 3 Over Half Year yes"/>Yes<br/>
												<strong>(b)</strong>
												<input type="checkbox" aria-label="Dependent 3 in the U.S."/>And in the U.S.
											  </td>
											  <td class="styIRS1040TableCell" style="text-align:center;border-right-width:0px;">
											  <strong>(a)</strong>
												<input type="checkbox" aria-label="Live With Dependent 4 Over Half Year yes"/>Yes<br/>
												<strong>(b)</strong>
												<input type="checkbox" aria-label="Dependent 4 in the U.S."/>And in the U.S.
											  </td>
											</tr>
											<tr>
											  <th class="styIRS1040TableCell" style="text-align:left;" scope="row">
											  <strong>(6)</strong><span style="padding-left:1mm;font-weight:normal;text-align:left;">Check if</span></th>
											 <td class="styIRS1040TableCell" style="height:9mm;text-align:center;border-bottom-width:1px;">
											 <div style="width:49%;height:inherit;float:left;border-right:1px solid black;border-bottom-width:1px;">
												  <div style="width:30%;height:100%;"><input type="checkbox" class="styCkbox" aria-label="Dependent 1 is a Full-time student"/></div>
												  <div style="width:65%;height:100%;padding-top:0.5mm;">Full-time student</div>
											 </div>
											 <div style="width:51%;height:inherit;float:right;">
												  <div style="width:22%;height:100%;"><input type="checkbox" class="styCkbox" aria-label="Dependent 1 is Permanently and totally disabled"/></div>
												  <div style="width:70%;height:100%;padding-top:0.5mm;">Permanently and totally disabled</div>
											  </div>
											 </td>
											 <td class="styIRS1040TableCell" style="height:9mm;text-align:center;border-bottom-width:1px;">
												<div style="width:49%;height:inherit;float:left;border-right:1px solid black;">
												  <div style="width:30%;height:100%;"><input type="checkbox" class="styCkbox" aria-label="Dependent 2 is a Full-time student"/></div>
												  <div style="width:65%;height:100%;padding-top:0.5mm;">Full-time student</div>
												</div>
												<div style="width:51%;height:inherit;float:right;">
												  <div style="width:22%;height:100%;"><input type="checkbox" class="styCkbox" aria-label="Dependent 2 is Permanently and totally disabled"/></div>
												  <div style="width:70%;height:100%;padding-top:0.5mm;">Permanently and totally disabled</div>
												</div>
											  </td>
											  <td class="styIRS1040TableCell" style="height:9mm;text-align:center;border-bottom-width:1px;">
												<div style="width:49%;height:inherit;float:left;border-right:1px solid black;">
												  <div style="width:30%;height:100%;"><input type="checkbox" class="styCkbox" aria-label="Dependent 3 is a Full-time student"/></div>
												  <div style="width:65%;height:100%;padding-top:0.5mm;">Full-time student</div>
												</div>
												<div style="width:51%;height:inherit;float:right;">
												  <div style="width:22%;height:100%;"><input type="checkbox" class="styCkbox" aria-label="Dependent 3 is Permanently and totally disabled"/></div>
												  <div style="width:70%;height:100%;padding-top:0.5mm;">Permanently and totally disabled</div>
												</div>
											  </td>
											  <td class="styIRS1040TableCell" style="height:9mm;text-align:center;border-bottom-width:1px;border-right-width:0px;">
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
											  <th class="styIRS1040TableCell" style="text-align:left;" scope="row">
											  <strong>(7)</strong><span style="padding-left:1mm;font-weight:normal;text-align:left;">Credits</span></th>
											  <td class="styIRS1040TableCell" style="height:9mm;text-align:center;border-bottom-width:0px;">
											   <div style="width:49%;height:inherit;float:left;border-right:1px solid black;border-bottom-width:1px;">
												  <div style="width:30%;height:100%;"><input type="checkbox" class="styCkbox" aria-label="Dependent 1 CTC Eligable"/></div>
												  <div style="width:65%;height:100%;padding-top:0.5mm;">Child tax credit</div>
												</div>
												<div style="width:51%;height:inherit;float:right;">
												  <div style="width:22%;height:100%;"><input type="checkbox" class="styCkbox" aria-label="Dependent 1 CFOD Eligable"/></div>
												  <div style="width:70%;height:100%;padding-top:0.5mm;">Credit for other dependents</div>
												</div>
											  </td>
											  <td class="styIRS1040TableCell" style="height:9mm;text-align:center;border-bottom-width:0px;">
												<div style="width:49%;height:inherit;float:left;border-right:1px solid black;">
												  <div style="width:30%;height:100%;"><input type="checkbox" class="styCkbox" aria-label="Dependent 2 CTC Eligable"/></div>
												  <div style="width:65%;height:100%;padding-top:0.5mm;">Child tax credit</div>
												</div>
												<div style="width:51%;height:inherit;float:right;">
												  <div style="width:22%;height:100%;"><input type="checkbox" class="styCkbox" aria-label="Dependent 2 CFOD Eligable"/></div>
												  <div style="width:70%;height:100%;padding-top:0.5mm;">Credit for other dependents</div>
												</div>
											  </td>
											  <td class="styIRS1040TableCell" style="height:9mm;text-align:center;border-bottom-width:0px;">
												<div style="width:49%;height:inherit;float:left;border-right:1px solid black;">
												  <div style="width:30%;height:100%;"><input type="checkbox" class="styCkbox" aria-label="Dependent 3 CTC Eligable"/></div>
												  <div style="width:65%;height:100%;padding-top:0.5mm;">Child tax credit</div>
												</div>
												<div style="width:51%;height:inherit;float:right;">
												  <div style="width:22%;height:100%;"><input type="checkbox" class="styCkbox" aria-label="Dependent 3 CFOD Eligable"/></div>
												  <div style="width:70%;height:100%;padding-top:0.5mm;">Credit for other dependents</div>
												</div>
											  </td>
											  <td class="styIRS1040TableCell" style="height:9mm;text-align:center;border-bottom-width:0px;border-right-width:0px;">
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
											  <th class="styIRS1040TableCell" style="text-align:left;" scope="row">
											  <strong>(1)</strong><span style="padding-left:1mm;font-weight:normal;text-align:left;">First Name</span></th>
											  <xsl:for-each select="$FormData/DependentDetail">
												<td class="styIRS1040TableCell" style="text-align:center;">
												  <xsl:if test="position() = last() and $DependentDetailCount = 4">
													<xsl:attribute name="style">text-align:center;border-right-width:0px;</xsl:attribute>
												  </xsl:if>
												  <xsl:value-of select="DependentFirstNm"/>
												</td>
											  </xsl:for-each>
											  <xsl:if test="$DependentDetailCount &lt; 4">
												<xsl:choose>
												  <xsl:when test="$DependentDetailCount = 3">
													<td class="styIRS1040TableCell" style="border-right-width:0px;"></td>
												  </xsl:when>
												  <xsl:when test="$DependentDetailCount = 2">
													<td class="styIRS1040TableCell"></td>
													<td class="styIRS1040TableCell" style="border-right-width:0px;"></td>
												  </xsl:when>
												  <xsl:when test="$DependentDetailCount = 1">
													<td class="styIRS1040TableCell"></td>
													<td class="styIRS1040TableCell"></td>
													<td class="styIRS1040TableCell" style="border-right-width:0px;"></td>
												  </xsl:when>
												</xsl:choose>
											  </xsl:if>
											</tr>
											<!-- Last Name row -->
											<tr>
											  <th class="styIRS1040TableCell" style="text-align:left;" scope="row">
											  <strong>(2)</strong><span style="padding-left:1mm;font-weight:normal;text-align:left;">Last Name</span></th>
											  <xsl:for-each select="$FormData/DependentDetail">
												<td class="styIRS1040TableCell" style="text-align:center;">
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
													<td class="styIRS1040TableCell" style="border-right-width:0px;"></td>
												  </xsl:when>
												  <xsl:when test="$DependentDetailCount = 2">
													<td class="styIRS1040TableCell"></td>
													<td class="styIRS1040TableCell" style="border-right-width:0px;"></td>
												  </xsl:when>
												  <xsl:when test="$DependentDetailCount = 1">
													<td class="styIRS1040TableCell"></td>
													<td class="styIRS1040TableCell"></td>
													<td class="styIRS1040TableCell" style="border-right-width:0px;"></td>
												  </xsl:when>
												</xsl:choose>
											  </xsl:if>
											</tr>
											<!-- SSN row -->
											<tr>
											  <th class="styIRS1040TableCell" style="text-align:left;" scope="row">
											  <strong>(3)</strong><span style="padding-left:1mm;font-weight:normal;text-align:left;">SSN</span></th>
											  <xsl:for-each select="$FormData/DependentDetail">
												<td class="styIRS1040TableCell" style="text-align:center;">
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
													<td class="styIRS1040TableCell" style="border-right-width:0px;"></td>
												  </xsl:when>
												  <xsl:when test="$DependentDetailCount = 2">
													<td class="styIRS1040TableCell"></td>
													<td class="styIRS1040TableCell" style="border-right-width:0px;"></td>
												  </xsl:when>
												  <xsl:when test="$DependentDetailCount = 1">
													<td class="styIRS1040TableCell"></td>
													<td class="styIRS1040TableCell"></td>
													<td class="styIRS1040TableCell" style="border-right-width:0px;"></td>
												  </xsl:when>
												</xsl:choose>
											  </xsl:if>
											</tr>
											<!-- Relationship block -->
											<tr>
											  <th class="styIRS1040TableCell" style="text-align:left;" scope="row">
											  <strong>(4)</strong><span style="padding-left:1mm;font-weight:normal;text-align:left;">Relationship</span></th>
											  <xsl:for-each select="$FormData/DependentDetail">
												<td class="styIRS1040TableCell" style="text-align:center;">
												  <xsl:if test="position() = last() and $DependentDetailCount = 4">
													<xsl:attribute name="style">text-align:center;border-right-width:0px;</xsl:attribute>
												  </xsl:if>
												  <xsl:value-of select="DependentRelationshipCd"/>
												</td>
											  </xsl:for-each>
											  <xsl:if test="$DependentDetailCount &lt; 4">
												<xsl:choose>
												  <xsl:when test="$DependentDetailCount = 3">
													<td class="styIRS1040TableCell" style="border-right-width:0px;"></td>
												  </xsl:when>
												  <xsl:when test="$DependentDetailCount = 2">
													<td class="styIRS1040TableCell"></td>
													<td class="styIRS1040TableCell" style="border-right-width:0px;"></td>
												  </xsl:when>
												  <xsl:when test="$DependentDetailCount = 1">
													<td class="styIRS1040TableCell"></td>
													<td class="styIRS1040TableCell"></td>
													<td class="styIRS1040TableCell" style="border-right-width:0px;"></td>
												  </xsl:when>
												</xsl:choose>
											  </xsl:if>
											</tr> 
										 <!-- Check if lived with you more than half of 2025 block -->
											<tr>
											  <th class="styIRS1040TableCell" style="text-align:left;" scope="row">
											  <strong style="vertical-align:top;">(5)</strong>
											  <span style="padding-left:1mm;font-weight:normal;font-size:7.5px;">Check if lived<br/> with you more  <br/></span>
											  <span style="padding-left:1mm;font-weight:normal;font-size:7.5px;">than half of 2025</span>
											  </th>
											  <xsl:for-each select="$FormData/DependentDetail">
												<td class="styIRS1040TableCell" style="text-align:center;">
												  <xsl:if test="position() = last() and $DependentDetailCount = 4">
													<xsl:attribute name="style">text-align:center;border-right-width:0px;</xsl:attribute>
												  </xsl:if>
												  <!--xsl:value-of select="DependentRelationshipCd"/-->
												  <span style="width:2mm;"/>
												  <!-- 1 Over half year Yes checkbox -->
												  <span style="float:left;">
												  <strong>(a)</strong>
													 <input type="checkbox" class="styCkbox">
														<xsl:attribute name="aria-label">Live With Dependent <xsl:value-of select="position()"/> Over Half Year yes"</xsl:attribute>
														<xsl:call-template name="PopulateCheckbox">
														  <xsl:with-param name="TargetNode" select="YesLiveWithChildOverHalfYrInd"/>
														  <xsl:with-param name="BackupName">IRS1040CTCInd</xsl:with-param>
														</xsl:call-template>
														Yes
													  </input>
													  </span>	
													<br/>
													<!-- 2 And in the US checkbox -->
													<span style="float:left;">
												  <strong>(b)</strong>
												   <input type="checkbox" class="styCkbox">
														<xsl:attribute name="aria-label">Dependent <xsl:value-of select="position()"/> Lived in the US"</xsl:attribute>
														<xsl:call-template name="PopulateCheckbox">
														  <xsl:with-param name="TargetNode" select="YesLiveWithChldUSOvrHalfYrInd"/>
														  <xsl:with-param name="BackupName">IRS1040CTCInd</xsl:with-param>
														</xsl:call-template>
														And in the U.S.
													  </input>
													  </span>																								
												</td>
											  </xsl:for-each>
											  <xsl:if test="$DependentDetailCount &lt; 4">
												<xsl:choose>
												  <xsl:when test="$DependentDetailCount = 3">
													<td class="styIRS1040TableCell" style="border-right-width:0px;">
													<strong>(a)</strong>
													<input type="checkbox" aria-label="Live With Dependent 4 Over Half Year yes"/>Yes<br/>
													<strong>(b)</strong>
													<input type="checkbox" aria-label="Dependent 4 in the U.S."/>And in the U.S.</td>
												  </xsl:when>
												  <xsl:when test="$DependentDetailCount = 2">
													<td class="styIRS1040TableCell">
													<strong>(a)</strong>
													<input type="checkbox" aria-label="Live With Dependent 3 Over Half Year yes"/>Yes<br/>
													<strong>(b)</strong>
													<input type="checkbox" aria-label="Dependent 3 in the U.S."/>And in the U.S.</td>
													<td class="styIRS1040TableCell" style="border-right-width:0px;">
													<strong>(a)</strong>
													<input type="checkbox" aria-label="Live With Dependent 4 Over Half Year yes"/>Yes<br/>
													<strong>(b)</strong>
													<input type="checkbox" aria-label="Dependent 4 in the U.S."/>And in the U.S.</td>
												  </xsl:when>
												  <xsl:when test="$DependentDetailCount = 1">
													<td class="styIRS1040TableCell">
													<strong>(a)</strong>
													<input type="checkbox" aria-label="Live With Dependent 2 Over Half Year yes"/>Yes<br/>
													<strong>(b)</strong>
													<input type="checkbox" aria-label="Dependent 2 in the U.S."/>And in the U.S.</td>
													<td class="styIRS1040TableCell">
													<strong>(a)</strong>
													<input type="checkbox" aria-label="Live With Dependent 3 Over Half Year yes"/>Yes<br/>
													<strong>(b)</strong>
													<input type="checkbox" aria-label="Dependent 3 in the U.S."/>And in the U.S.</td>
													<td class="styIRS1040TableCell" style="border-right-width:0px;">
													<strong>(a)</strong>
													<input type="checkbox" aria-label="Live With Dependent 4 Over Half Year yes"/>Yes<br/>
													<strong>(b)</strong>
													<input type="checkbox" aria-label="Dependent 4 in the U.S."/>And in the U.S.</td>
												  </xsl:when>
												</xsl:choose>
											  </xsl:if>
											</tr> 
										 <!-- Check if lived with you more than half of 2025 block -->
											<tr>
											  <th class="styIRS1040TableCell" style="text-align:left;" scope="row">
											  <strong>(6)</strong><span style="padding-left:1mm;font-weight:normal;text-align:middle;">Check if</span></th>
											  <xsl:for-each select="$FormData/DependentDetail">
												<td class="styIRS1040TableCell" style="text-align:center;height:9mm;">
												  <xsl:if test="position() = last() and $DependentDetailCount = 4">
													<xsl:attribute name="style">text-align:center;border-right-width:0px;</xsl:attribute>
												  </xsl:if>
												  <!--xsl:value-of select="DependentRelationshipCd"/-->
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
													<td class="styIRS1040TableCell" style="text-align:center;height:9mm;border-right-width:0px;">
													<div class="styIRS1040li2TableCell" style="float:left;width:49.8%;height:inherit;border-right:1px;border-right:1px solid black;">
													<span style="float:left;font-size:7px;">
													<input type="checkbox" aria-label="Dependent 4 is a Full-time student"/>Full-time student
													</span>
													</div>
													<div class="styIRS1040li2TableCell"   style="float:right;width:50%;height:inherit;border-left:1px;">
													<span style="float:right;font-size:7px;">
													<input type="checkbox" aria-label="Dependent 4 is Permanently and totally disabled"/>Permanently and totally disabled
													</span>
													</div>
													</td>
												  </xsl:when>
												  <xsl:when test="$DependentDetailCount = 2">
													<td class="styIRS1040TableCell" style="text-align:center;height:9mm;">
													<div class="styIRS1040li2TableCell" style="float:left;width:49.8%;height:inherit;border-right:1px solid black;">
													<span style="float:left;font-size:7px;">
													<input type="checkbox" aria-label="Dependent 3 is a Full-time student"/>Full-time student
													</span>
													</div>
													<div class="styIRS1040li2TableCell" style="float:right;width:49.8%;height:inherit;">
													<span style="float:right;font-size:7px;">
													<input type="checkbox" aria-label="Dependent 3 is Permanently and totally disabled"/>Permanently and totally disabled																
													</span>
													</div>
													</td>
													<td class="styIRS1040TableCell" style="text-align:center;height:9mm;border-right-width:0px;">
													<div class="styIRS1040li2TableCell" style="float:left;width:49.8%;height:inherit;border-right:1px solid black;">
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
												  <xsl:when test="$DependentDetailCount = 1">
													<td class="styIRS1040TableCell" style="text-align:center;height:9mm;">
													<div class="styIRS1040li2TableCell" style="float:left;width:49.8%;height:inherit;border-right:1px;border-right:1px solid black;">
													<span style="float:left;font-size:7px;">
													<input type="checkbox" aria-label="Dependent 2 is a Full-time student"/>Full-time student
													</span>
													</div>
													<div class="styIRS1040li2TableCell" style="float:right;width:49.8%;height:inherit;">
													<span style="float:right;font-size:7px;">
													<input type="checkbox" aria-label="Dependent 2 is Permanently and totally disabled"/>Permanently and totally disabled
													</span>
													</div>
													</td>
													<td class="styIRS1040TableCell" style="text-align:center;height:9mm;">
													<div class="styIRS1040li2TableCell" style="float:left;width:49.8%;height:inherit;border-right:1px;border-right:1px solid black;">
													<span style="float:left;font-size:7px;">
													<input type="checkbox" aria-label="Dependent 3 is a Full-time student"/>Full-time student
													</span>
													</div>
													<div class="styIRS1040li2TableCell" style="float:right;width:49.8%;height:inherit;">
													<span style="float:right;font-size:7px;">
													<input type="checkbox" aria-label="Dependent 3 is Permanently and totally disabled"/>Permanently and totally disabled
													</span>
													</div>
													</td>
													<td class="styIRS1040TableCell" style="text-align:center;height:9mm;border-right-width:0px;">
													<div class="styIRS1040li2TableCell" style="float:left;width:49.8%;height:inherit;border-right:1px;border-right:1px solid black;">
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
											  <th class="styIRS1040TableCell" style="text-align:left;" scope="row">
											  <strong>(7)</strong><span style="padding-left:1mm;font-weight:normal;text-align:middle;">Credits</span></th>
											  <xsl:for-each select="$FormData/DependentDetail">
												<td class="styIRS1040TableCell" style="text-align:center;">
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
													<td class="styIRS1040TableCell" style="text-align:center;height:7mm;border-right-width:0px;">
													<div class="styIRS1040li2TableCell" style="float:left;width:49.8%;height:inherit;border-right:1px solid black;">
													<span style="float:left;font-size:7px;">
													<input type="checkbox" aria-label="Dependent 4 is Child Tax Credit Eligable"/>Child Tax Credit
													</span>
													</div>
													<div class="styIRS1040li2TableCell"   style="float:right;width:50%;height:inherit;">
													<span style="float:right;font-size:7px;">
													<input type="checkbox" aria-label="Dependent 4 is Eligible For Other Dependents Credit"/>Credit for other dependents
													</span>
													</div>
													</td>
												  </xsl:when>
												  <xsl:when test="$DependentDetailCount = 2">
													<td class="styIRS1040TableCell" style="text-align:center;height:7mm;">
													<div class="styIRS1040li2TableCell" style="float:left;width:49.8%;height:inherit;border-right:1px solid black;">
													<span style="float:left;font-size:7px;">
													<input type="checkbox" aria-label="Dependent 3 is Child Tax Credit Eligable"/>Child Tax Credit
													</span>
													</div>
													<div class="styIRS1040li2TableCell" style="float:right;width:49.8%;height:inherit;">
													<span style="float:right;font-size:7px;">
													<input type="checkbox" aria-label="Dependent 3 is Eligible For Other Dependents Credit"/>Credit for other dependents																
													</span>
													</div>
													</td>
													<td class="styIRS1040TableCell" style="text-align:center;height:7mm;border-right-width:0px;">
													<div class="styIRS1040li2TableCell" style="float:left;width:49.8%;height:inherit;border-right:1px solid black;">
													<span style="float:left;font-size:7px;">
													<input type="checkbox" aria-label="Dependent 4 is Child Tax Credit Eligable"/>Child Tax Credit
													</span>
													</div>
													<div class="styIRS1040li2TableCell" style="float:right;width:49.8%;height:inherit;">
													<span style="float:right;font-size:7px;">
													<input type="checkbox" aria-label="Dependent 4 is Eligible For Other Dependents Credit"/>Credit for other dependents
													</span>
													</div>
													</td>
												  </xsl:when>
												  <xsl:when test="$DependentDetailCount = 1">
													<td class="styIRS1040TableCell" style="text-align:center;height:7mm;">
													<div class="styIRS1040li2TableCell" style="float:left;width:49.8%;height:inherit;border-right:1px solid black;">
													<span style="float:left;font-size:7px;">
													<input type="checkbox" aria-label="Dependent 2 is Child Tax Credit Eligable"/>Child Tax Credit
													</span>
													</div>
													<div class="styIRS1040li2TableCell" style="float:right;width:49.8%;height:inherit;">
													<span style="float:right;font-size:7px;">
													<input type="checkbox" aria-label="Dependent 2 is Eligible For Other Dependents Credit"/>Credit for other dependents
													</span>
													</div>
													</td>
													<td class="styIRS1040TableCell" style="text-align:center;height:7mm;">
													<div class="styIRS1040li2TableCell" style="float:left;width:49.8%;height:inherit;border-right:1px solid black;">
													<span style="float:left;font-size:7px;">
													<input type="checkbox" aria-label="Dependent 3 is Child Tax Credit Eligable"/>Child Tax Credit
													</span>
													</div>
													<div class="styIRS1040li2TableCell" style="float:right;width:49.8%;height:inherit;">
													<span style="float:right;font-size:7px;">
													<input type="checkbox" aria-label="Dependent 3 is Eligible For Other Dependents Credit"/>Credit for other dependents
													</span>
													</div>
													</td>
													<td class="styIRS1040TableCell" style="text-align:center;height:7mm;border-right-width:0px;">
													<div class="styIRS1040li2TableCell" style="float:left;width:49.8%;height:inherit;border-right:1px solid black">
													<span style="float:left;font-size:7px;">
													<input type="checkbox" aria-label="Dependent 4 is Child Tax Credit Eligable"/>Child Tax Credit
													</span>
													</div>
													<div class="styIRS1040li2TableCell" style="float:right;width:49.8%;height:inherit;">
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
											  <th class="styIRS1040TableCell" style="text-align:left;" scope="row"><strong>(1)</strong>
											  <span style="padding-left:1mm;font-weight:normal;text-align:left;">First Name</span></th>
											  <td class="styIRS1040TableCell">
												<span style="padding-left:2mm;">See Additional Data Table</span>
											  </td>
											  <td class="styIRS1040TableCell"></td>
											  <td class="styIRS1040TableCell"></td>
											  <td class="styIRS1040TableCell" style="border-right-width:0px;"></td>
											</tr>
											<tr>
											  <th class="styIRS1040TableCell" style="text-align:left;" scope="row"><strong>(2)</strong>
											  <span style="padding-left:1mm;font-weight:normal;text-align:left;">Last Name</span></th>
											  <td class="styIRS1040TableCell"></td>
											  <td class="styIRS1040TableCell"></td>
											  <td class="styIRS1040TableCell"></td>
											  <td class="styIRS1040TableCell" style="border-right-width:0px;"></td>
											</tr>
											<tr>
											  <th class="styIRS1040TableCell" style="text-align:left;" scope="row"><strong>(3)</strong>
											  <span style="padding-left:1mm;font-weight:normal;text-align:left;">SSN</span></th>
											  <td class="styIRS1040TableCell"></td>
											  <td class="styIRS1040TableCell"></td>
											  <td class="styIRS1040TableCell"></td>
											  <td class="styIRS1040TableCell" style="border-right-width:0px;"></td>
											</tr>
											<tr>
											  <th class="styIRS1040TableCell" style="text-align:left;" scope="row"><strong>(4)</strong>
											  <span style="padding-left:1mm;font-weight:normal;text-align:left;">Relationship</span></th>
											  <td class="styIRS1040TableCell"></td>
											  <td class="styIRS1040TableCell"></td>
											  <td class="styIRS1040TableCell"></td>
											  <td class="styIRS1040TableCell" style="border-right-width:0px;"></td>
											</tr>
											<tr>
											  <th class="styIRS1040TableCell" style="text-align:left;" scope="row">
											  <strong style="vertical-align:top;">(5)</strong>
											  <span style="padding-left:1mm;font-weight:normal;font-size:7.5px;">Check if lived<br/> with you more  <br/></span>
											  <span style="padding-left:1mm;font-weight:normal;font-size:7.5px;">than half of 2025</span>
											  </th>
											  <td class="styIRS1040TableCell"></td>
											  <td class="styIRS1040TableCell"></td>
											  <td class="styIRS1040TableCell"></td>
											  <td class="styIRS1040TableCell" style="border-right-width:0px;"></td>
											</tr>
											<tr>
											  <th class="styIRS1040TableCell" style="text-align:left;" scope="row"><strong>(6)</strong>
											  <span style="padding-left:1mm;font-weight:normal;text-align:left;">Check if</span></th>
											  <td class="styIRS1040TableCell"></td>
											  <td class="styIRS1040TableCell"></td>
											  <td class="styIRS1040TableCell"></td>
											  <td class="styIRS1040TableCell" style="border-right-width:0px;"></td>
											</tr>
											<tr>
											  <th class="styIRS1040TableCell" style="text-align:left;" scope="row"><strong>(7)</strong>
											  <span style="padding-left:1mm;font-weight:normal;text-align:left;">Credits</span></th>
											  <td class="styIRS1040TableCell"></td>
											  <td class="styIRS1040TableCell"></td>
											  <td class="styIRS1040TableCell"></td>
											  <td class="styIRS1040TableCell" style="border-right-width:0px;"></td>
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
					<xsl:if test="(count($FormData/DependentDetail) &gt;= 4) and ($Print != $Separated)">
						<xsl:call-template name="SetInitialDynamicTableHeight">
							<xsl:with-param name="TargetNode" select="$FormData/DependentDetail"/>
							<xsl:with-param name="containerHeight" select="4"/>
							<xsl:with-param name="headerHeight" select="3"/>
							<xsl:with-param name="containerID" select=" 'depdContainerId' "/>
						</xsl:call-template>
					</xsl:if>
						<!-- End Dependents table -->
						<div class="styStdDiv" style="border-bottom:2px solid black;overflow:visible;border-top-width: 1.5px;"/>
						<!-- Block 1a-4 -->
						<div style="height:57mm; display:block; page-break-before:avoid; page-break-inside:avoid;border-top-width: 1.5px;">			
						<div class="styGenericDiv" style="width:20mm;padding-top:0mm;height:83mm;">
							<span style="padding-left:1.5mm;font-weight:bold;font-size:10pt;padding-bottom:1mm">Income</span>
							<div style="width:100%;padding-left:1.5mm;">
							<span style="float:left;width:19.5mm;font-weight:bold;font-size:8pt;font-family:Arial Narrow;">Attach Form(s)</span>
							</div>
							<div style="width:100%;padding-left:1.5mm;">
								<span style="float:left;width:18.5mm;font-weight:bold;font-size:8pt;font-family:Arial Narrow">W-2 here. Also </span>
							</div>
							<div style="width:100%;padding-left:1.5mm;">
								<span style="float:left;width:18.5mm;font-weight:bold;font-size:8pt;font-family:Arial Narrow">attach Forms</span>
							</div>
							<div style="width:100%;padding-left:1.5mm;">
								<span style="float:left;width:18.5mm;font-weight:bold;font-size:8pt;font-family:Arial Narrow"> W-2G and</span>
							</div>
							<div style="width:100%;padding-left:1.5mm;">
								<span style="float:left;width:18.5mm;font-weight:bold;font-size:8pt;font-family:Arial Narrow"> 1099-R if tax</span>
							</div>
							<div style="width:100%;padding-left:1.5mm;">
								<span style="float:left;width:18.5mm;font-weight:bold;font-size:8pt;font-family:Arial Narrow"> was withheld.</span>
							</div>
							<div style="width:100%;padding-left:1.5mm;padding-top:.5mm">
								<span style="float:left;width:18.5mm;font-size:8pt;font-family:Arial Narrow">If you did not</span>
							</div>
							<div style="width:100%;padding-left:1.5mm;">
								<span style="float:left;width:18.5mm;font-size:8pt;font-family:Arial Narrow">get a Form W-2,</span> 
							</div>	
							<div style="width:100%;padding-left:1.5mm;">
								<span style="float:left;width:18.5mm;font-size:8pt;font-family:Arial Narrow">see instructions.</span>
							</div>					
							<div style="height:4.8mm;">
							</div>
							<div style="width:100%;border:1px solid black;border-bottom:none;border-right:none;border-radius:8px 8px 0px 0px;padding-left:1mm;">
								<span style="float:left;width:16.5mm;padding-left:2mm;">Attach</span>
							</div>
							<div style="width:100%;border-left:1px solid black;border-right:none;padding-left:3mm;">
								<span style="float:left;width:16.5mm;">Sch. B if</span>
							</div>
							<div style="width:100%;border:1px solid black;border-top:none;border-right:none;border-radius:0px 0px 8px 8px;padding-left:3mm;">
								<span style="float:left;width:16.5mm;">required.</span>
							</div>					
							</div>
						<!-- Line 1a -->
						<div class="sty1040LN">
							<div class="styLNLeftNumBoxSD" style="padding-left:1mm;margin-left:-2px;margin-right:2px;">1a</div>
							<div class="sty1040Desc">
								Total amount from Form(s) W-2, box 1 (see instructions)
								<xsl:call-template name="LinkToLeftoverDataTableInline">
									<xsl:with-param name="Desc">Line 1a - Fringe Benefits Code</xsl:with-param>
									<xsl:with-param name="TargetNode" select="$FormData/WagesAmt/@fringeBenefitsCd"/>
								</xsl:call-template>
								<span class="sty1040DotLn">..........</span>
							</div>
							<div class="sty1040RightNumBox">1a</div>
							<div class="sty1040AmountBox">
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
						<div class="sty1040LN">
							<div class="styLNLeftNumBoxSD" style="padding-left:1mm;margin-left:5px;margin-right:-4px;">b</div>
							<div class="sty1040Desc" style="width:122.7mm;">
								Household employee wages not reported on Form(s) W-2
								<span class="sty1040DotLn">............</span>
							</div>
							<div class="sty1040RightNumBox">1b</div>
							<div class="sty1040AmountBox">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/HouseholdEmployeeWagesAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<!-- Line 1c -->
						<div class="sty1040LN">
							<div class="styLNLeftNumBoxSD" style="padding-left:1mm;margin-left:5px;margin-right:-4px;">c</div>
							<div class="sty1040Desc" style="width:122.7mm;">
								Tip income not reported on line 1a (see instructions)
								<span class="sty1040DotLn">............</span>
							</div>
							<div class="sty1040RightNumBox">1c</div>
							<div class="sty1040AmountBox">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/TipIncomeAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<!-- Line 1d -->
						<div class="sty1040LN">
							<div class="styLNLeftNumBoxSD" style="padding-left:1mm;margin-left:5px;margin-right:-4px;">d</div>
							<div class="sty1040Desc" style="width:122.7mm;">
								Medicaid waiver payments not reported on Form(s) W-2 (see instructions)
								<span class="sty1040DotLn">.......</span>
							</div>
							<div class="sty1040RightNumBox">1d</div>
							<div class="sty1040AmountBox">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/MedicaidWaiverPymtNotRptW2Amt"/>
								</xsl:call-template>
							</div>
						</div>
						<!-- Line 1e -->
						<div class="sty1040LN">
							<div class="styLNLeftNumBoxSD" style="padding-left:1mm;margin-left:5px;margin-right:-4px;">e</div>
							<div class="sty1040Desc" style="width:122.7mm;">
								Taxable dependent care benefits from Form 2441, line 26
								<span class="sty1040DotLn">............</span>
							</div>
							<div class="sty1040RightNumBox">1e</div>
							<div class="sty1040AmountBox">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/TaxableBenefitsAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<!-- Line 1f -->
						<div class="sty1040LN">
							<div class="styLNLeftNumBoxSD" style="padding-left:1mm;margin-left:5px;margin-right:-4px;">f</div>
							<div class="sty1040Desc" style="width:122.7mm;">
								Employer-provided adoption benefits from Form 8839, line 31
								<span class="sty1040DotLn">...........</span>
							</div>
							<div class="sty1040RightNumBox">1f</div>
							<div class="sty1040AmountBox">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/TaxableBenefitsForm8839Amt"/>
								</xsl:call-template>
							</div>
						</div>
						<!-- Line 1g -->
						<div class="sty1040LN">
							<div class="styLNLeftNumBoxSD" style="padding-left:1mm;margin-left:5px;margin-right:-4px;">g</div>
							<div class="sty1040Desc" style="width:122.7mm;">
								Wages from Form 8919, line 6
								<span class="sty1040DotLn">.....................</span>
							</div>
							<div class="sty1040RightNumBox">1g</div>
							<div class="sty1040AmountBox">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/TotalWagesWithNoWithholdingAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<!-- Line 1h -->
						<div class="sty1040LN">
							<div class="styLNLeftNumBoxSD" style="padding-left:1mm;margin-left:5px;margin-right:-4px;">h</div>
							<div class="sty1040Desc" style="width:122.7mm;">
								Other earned income (see instructions)
								<xsl:call-template name="LinkToLeftoverDataTableInline">
									<xsl:with-param name="Desc">Line 1h - Wages Not Shown Lit Only Code</xsl:with-param>
									<xsl:with-param name="TargetNode" select="$FormData/OtherEarnedIncomeAmt/@wagesNotShownLitOnlyCd"/>
								</xsl:call-template>
								Enter type and amount
								<span style="width:35mm;border-bottom:1px solid black;">
								<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$FormData/OtherEarnedIncomeAmt/@wagesNotShownLitOnlyCd"/>
										</xsl:call-template>
								</span>
								
							</div>
							<div class="sty1040RightNumBox">1h</div>
							<div class="sty1040AmountBox">
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
						<div class="sty1040LN">
							<div class="styLNLeftNumBoxSD" style="padding-left:1mm;margin-left:5px;margin-right:-4px;">i</div>
							<div class="sty1040Desc" style="width:86.7mm;padding-top:0.7mm;">
								Nontaxable combat pay election (see instructions)
								<span class="sty1040DotLn">.....</span>
							</div>
							<div class="sty1040RightNumBox">1i</div>
							<div class="sty1040AmountBox">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/NontxCombatPayElectionAmt"/>
								</xsl:call-template>
							</div>
							<div class="sty1040RightNumBoxNBB" style="background-color:lightgrey;">&nbsp;</div>
							<div class="sty1040AmountBoxNBB" style="">&nbsp;</div>
						</div>
						<!-- Line 1z -->
						<div class="sty1040LN">
							<div class="styLNLeftNumBoxSD" style="padding-left:1mm;margin-left:5px;margin-right:-4px;">z</div>
							<div class="sty1040Desc" style="width:122.7mm;">
								Add lines 1a through 1h.
								<span class="sty1040DotLn">......................</span>
							</div>
							<div class="sty1040RightNumBox">1z</div>
							<div class="sty1040AmountBox">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/WagesSalariesAndTipsAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<!-- Line 2 -->
						<div class="sty1040LN">
							<div class="styLNLeftNumBoxSD" style="border-top:1px solid black;border-left:2px solid white;padding-left:1mm;margin-left:-2px;margin-right:2px;">2a</div>
							<div class="sty1040Desc" style="width:31mm;">Tax-exempt interest <span class="sty1040DotLn">.</span></div>
							<div class="sty1040RightNumBox">2a</div>
							<div class="sty1040AmountBox" style="border-right-width:1px;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/TaxExemptInterestAmt"/>
								</xsl:call-template>
							</div>
							<div class="styLNLeftLtrBox" style="width:7mm;">b</div>
							<div class="sty1040Desc" style="width:49mm;">Taxable interest<span class="sty1040DotLn">......</span></div>
							<div class="sty1040RightNumBox">2b</div>
							<div class="sty1040AmountBox" style="width:29mm;">
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
						<div class="sty1040LN">
							<div class="styLNLeftNumBoxSD" style="border-bottom:1px solid black;border-left:2px solid white;margin-left:-2px;margin-right:2px;padding-left:1mm">3a</div>
							<div class="sty1040Desc" style="width:31mm;">
								Qualified dividends
								<xsl:call-template name="LinkToLeftoverDataTableInline">
									<xsl:with-param name="Desc">Line 3a -  Qualified Dividends Form 8814 Code</xsl:with-param>
									<xsl:with-param name="TargetNode" select="$FormData/QualifiedF8814Cd"/>
								</xsl:call-template>
							</div>
							<div class="sty1040RightNumBox">3a</div>
							<div class="sty1040AmountBox" style="border-right-width:1px;">
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
							<div class="styLNLeftLtrBox" style="width:7mm;">b</div>
							<div class="sty1040Desc" style="width:49mm;">
								Ordinary dividends
								<span style="width:3px"/>
								<xsl:call-template name="LinkToLeftoverDataTableInline">
									<xsl:with-param name="Desc">Line 3b - Ordinary Dividends Form 8814 Code</xsl:with-param>
									<xsl:with-param name="TargetNode" select="$FormData/OrdinaryF8814Cd"/>
								</xsl:call-template>
								<xsl:call-template name="LinkToLeftoverDataTableInline">
									<xsl:with-param name="Desc">Line 3b - Ordinary Dividends Form 8814 Amount</xsl:with-param>
									<xsl:with-param name="TargetNode" select="$FormData/OrdinaryF8814Amt"/>
								</xsl:call-template>
								<span class="sty1040DotLn">....</span>
							</div>
							<div class="sty1040RightNumBox">3b</div>
							<div class="sty1040AmountBox">
								<span style="float:left;">
									<xsl:call-template name="SetFormLinkInline">
										<xsl:with-param name="TargetNode" select="$FormData/OrdinaryDividendsAmt"/>
									</xsl:call-template>
								</span>
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/OrdinaryDividendsAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<!-- Line 3c -->
							<div class="sty1040LN">
								<div class="styLNLeftNumBoxSD" style="padding-left:1mm;margin-left:5px;margin-right:-4px;padding-top:2mm;">c</div>
								<div class="sty1040Desc" style="width:122.7mm;font-family:Arial Narrow;">
									<span style="font-family:Verdana;">Check if your child’s dividends are included in</span> 
									<span style="width:2mm;height:4mm;"/>
									<!-- 3c (1) -->
									<span style="font-weight:bold;font-family:Verdana;width:3mm;text-align:center;">1</span>
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
									<span style="width:6mm;height:3mm;"/>
									<span style="font-weight:bold;font-family:Verdana;width:3.5mm;text-align:center;">2</span>
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
									<div class="sty1040RightNumBoxNBB" style="background-color:lightgrey;">&nbsp;</div>
									<div class="sty1040AmountBoxNBB" style="">&nbsp;</div>
									</div>
						<!-- Line 4 -->
						<div class="sty1040LN">
							<div class="styLNLeftNumBoxSD" style="padding-left:1mm;padding-top:2mm;height:5mm;">4a</div>
							<div class="sty1040Desc" style="width:31mm;padding-top:2mm;height:5mm;">IRA distributions <span class="sty1040DotLn">..</span></div>
							<div class="sty1040RightNumBox" style="padding-top:2mm;height:5mm;">4a</div>
							<div class="sty1040AmountBox2" style="padding-top:2mm;border-right-width:1px;height:5mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/IRADistributionsAmt"/>
								</xsl:call-template>
							</div>
							<div class="styLNLeftLtrBox" style="width:7mm;padding-top:2mm;height:5mm;">b</div>
							<div class="sty1040Desc" style="width:49mm;padding-top:2mm;height:5mm;">
								Taxable amount
								<xsl:call-template name="LinkToLeftoverDataTableInline">
									<xsl:with-param name="Desc">Line 4b - IRA Distributions Literal Code</xsl:with-param>
									<xsl:with-param name="TargetNode" select="$FormData/IRADistributionsLiteralCd"/>
								</xsl:call-template>
								<span class="sty1040DotLn">......</span>
							</div>
							<div class="sty1040RightNumBox" style="padding-top:2mm;height:5mm;">4b</div>
							<div class="sty1040AmountBox2" style="padding-top:2mm;height:5mm;">
								<span style="float:left;padding-top:2mm;">
									<xsl:call-template name="SetFormLinkInline">
										<xsl:with-param name="TargetNode" select="$FormData/TaxableIRAAmt"/>
									</xsl:call-template>
								</span>
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/TaxableIRAAmt"/>
								</xsl:call-template>
							</div>
						</div>		
					</div>	
					<!-- Line 4c -->
						<div class="sty1040LN">
								<div class="styLNLeftNumBoxSD" style="padding-left:1mm;margin-left:5px;margin-right:-4px;padding-top:1.7mm;">c</div>
								<div class="sty1040Desc" style="width:122.7mm;font-family:Arial Narrow;">
									<span style="font-family:Verdana;">Check if (see instructions)
									<span style="width:1mm;"/>
									<span class="sty1040DotLn">......</span>
									</span> 
							<!-- 4c (1) -->
									<span style="font-weight:bold;font-family:Verdana;width:3mm;text-align:center;">1</span>
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
									<span style="width:1mm;height:4mm;"/>
									<span style="font-weight:bold;font-family:Verdana;width:3.5mm;text-align:center;">2</span>
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
									<span style="width:1mm;height:4mm;"/>
									<span style="font-weight:bold;font-family:Verdana;width:3.5mm;text-align:center;">3</span>

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
									<div class="sty1040RightNumBoxNBB" style="background-color:lightgrey;">&nbsp;</div>
									<div class="sty1040AmountBoxNBB" style="">&nbsp;</div>
									</div>
						<!-- Line 5a -->
						<div class="sty1040LN">
							<div class="styLNLeftNumBoxSD" style="padding-left:1mm;height:5mm;padding-top:1.5mm;">5a</div>
							<div class="sty1040Desc" style="width:31mm;height:5mm;padding-top:1.5mm;">Pensions and annuities</div>
							<div class="sty1040RightNumBox" style="height:5mm;padding-top:1.5mm;">5a</div>
							<div class="sty1040AmountBox" style="border-right-width:1px;height:5mm;padding-top:1.5mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/PensionsAnnuitiesAmt"/>
								</xsl:call-template>
							</div>
							<div class="styLNLeftLtrBox" style="width:7mm;height:5mm;padding-top:1.5mm;">b</div>
							<div class="sty1040Desc" style="width:49mm;height:5mm;padding-top:1.5mm;">
								Taxable amount
								<xsl:call-template name="LinkToLeftoverDataTableInline">
									<xsl:with-param name="Desc">Line 5b - Pensions and Annuities Literal Code</xsl:with-param>
									<xsl:with-param name="TargetNode" select="$FormData/TotalTaxablePensionsAmt/@pensionsAnnuitiesLiteralCd"/>
								</xsl:call-template>
								<xsl:call-template name="LinkToLeftoverDataTableInline">
									<xsl:with-param name="Desc">Line 5b - Foreign Employer Pension Code</xsl:with-param>
									<xsl:with-param name="TargetNode" select="$FormData/ForeignEmployerPensionCd"/>
								</xsl:call-template>
								<xsl:call-template name="LinkToLeftoverDataTableInline">
									<xsl:with-param name="Desc">Line 5b - Taxable Foreign Pensions Total Amount</xsl:with-param>
									<xsl:with-param name="TargetNode" select="$FormData/TaxableForeignPensionsTotalAmt"/>
								</xsl:call-template>
								<span class="sty1040DotLn">.....</span>
							</div>
							<div class="sty1040RightNumBox" style="height:5mm;padding-top:1.5mm;">5b</div>
							<div class="sty1040AmountBox" style="height:5mm;padding-top:1.5mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/TotalTaxablePensionsAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<!-- Line 5c -->
						<div class="sty1040LN">
								<div class="styLNLeftNumBoxSD" style="padding-left:1mm;margin-left:5px;margin-right:-4px;padding-top:1.7mm;">c</div>
								<div class="sty1040Desc" style="width:122.7mm;font-family:Arial Narrow;">
									<span style="font-family:Verdana;">Check if (see instructions)
									<span style="width:1mm;"/>
									<span class="sty1040DotLn">......</span>
									</span> 
							<!-- 5c (1) -->
									<span style="font-weight:bold;font-family:Verdana;width:3mm;text-align:center;">1</span>
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
									<span style="width:5mm;height:4mm;"/>
									<span style="font-weight:bold;font-family:Verdana;width:3.5mm;text-align:center;">2</span>

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
									<span style="width:1mm;height:4mm;"/>
									<span style="font-weight:bold;font-family:Verdana;width:3.5mm;text-align:center;">3</span>

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
									<div class="sty1040RightNumBoxNBB" style="background-color:lightgrey;">&nbsp;</div>
									<div class="sty1040AmountBoxNBB" style="">&nbsp;</div>
									</div>
									<!-- Line 6 -->
						<div class="sty1040LN">
							<div class="styLNLeftNumBoxSD" style="padding-left:1mm;height:5mm;padding-top:1.5mm;">6a</div>
							<div class="sty1040Desc" style="width:31mm;height:5mm;padding-top:1.5mm;">
								Social security benefits
							</div>
							<div class="sty1040RightNumBox" style="height:5mm;padding-top:1.5mm;">6a</div>
							<div class="sty1040AmountBox" style="border-right-width:1px;height:5mm;padding-top:1.5mm;">
								<span style="float:left;">
									<xsl:call-template name="LinkToLeftoverDataTableInline">
									<xsl:with-param name="Desc">Line 6a - Social Security Benefits Code</xsl:with-param>
									<xsl:with-param name="TargetNode" select="$FormData/SocSecBnftAmt/@socSecBnftCd"/>
								</xsl:call-template>
								</span>
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/SocSecBnftAmt"/>
								</xsl:call-template>
							</div>
							<div class="styLNLeftLtrBox" style="width:7mm;height:5mm;padding-top:1.5mm;">b</div>
							<div class="sty1040Desc" style="width:49mm;height:5mm;padding-top:1.5mm;">Taxable amount <span class="sty1040DotLn">......</span></div>
							<div class="sty1040RightNumBox" style="height:5mm;padding-top:1.5mm;">6b</div>
							<div class="sty1040AmountBox" style="height:5mm;padding-top:1.5mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/TaxableSocSecAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<!-- Line 6c -->
						<div class="sty1040LN">
							<div class="styLNLeftNumBoxSD" style="padding-left:1mm;margin-left:5px;margin-right:-4px;">c</div>
							<div class="sty1040Desc" style="width:122.7mm;">
								If you elect to use the lump-sum election method, check here (see instructions) 
								<span style="float:right;">
									<span class="sty1040DotLn" style="float:none;margin-right:-11px;">....</span>
									<span style="width:4px;"/>
									<span style="width:4px;"/> 
									<input type="checkbox" class="styCkboxNM" style="margin-right:6px;" aria-label="lump sum election method">
										<xsl:call-template name="PopulateCheckbox">
											<xsl:with-param name="TargetNode" select="$FormData/LumpSumElectionMethodInd"/>
											<xsl:with-param name="BackupName">IRS1040LumpSumElectionMethodInd</xsl:with-param>
										</xsl:call-template>
									</input>
								</span>
							</div>
							<div class="sty1040RightNumBoxNBB" style="background-color:lightgrey;">&nbsp;</div>
							<div class="sty1040AmountBoxNBB" style="">&nbsp;</div>
						</div>
						<!-- Line 6d -->
						<div class="sty1040LN" style="float:right;">
							<div class="styLNLeftNumBoxSD" style="padding-left:1mm;margin-left:5px;margin-right:-4px;">d</div>
							<div class="sty1040Desc" style="width:122.7mm;height:4mm;font-size:8px;">
								If you are married filing separately and lived apart from your spouse the entire year (see inst.), check here 
								<span style="float:right;">
									<input type="checkbox" class="styCkboxNM" style="margin-right:6px;" aria-label="married filing separately and lived apart from spouse">
										<xsl:call-template name="PopulateCheckbox">
											<xsl:with-param name="TargetNode" select="$FormData/MFSLiveApartEntireYrInd"/>
											<xsl:with-param name="BackupName">IRS1040MFSLiveApartEntireYrInd</xsl:with-param>
										</xsl:call-template>
									</input>
								</span>
							</div>
							<div class="sty1040RightNumBoxNBB" style="background-color:lightgrey;height:4mm;">&nbsp;</div>
							<div class="sty1040AmountBoxNBB" style="height:4mm;">&nbsp;</div>
						</div>
						<!-- Line 7a -->
						<div class="sty1040LN" style="float:right;">
							<div class="styLNLeftNumBoxSD" style="padding-left:1mm">7a</div>
							<div class="sty1040Desc">
								Capital gain or (loss). Attach Schedule D if required 
								<xsl:call-template name="LinkToLeftoverDataTableInline">
									<xsl:with-param name="Desc">Line 7 - Form 8814 Code</xsl:with-param>
									<xsl:with-param name="TargetNode" select="$FormData/Form8814Cd"/>
								</xsl:call-template>
								<xsl:call-template name="LinkToLeftoverDataTableInline">
									<xsl:with-param name="Desc">Line 7 - Form 8814 Amount</xsl:with-param>
									<xsl:with-param name="TargetNode" select="$FormData/Form8814Amt"/>
								</xsl:call-template>
								<span style="float:right;">
									<span class="sty1040DotLn" style="float:none;margin-right:-11px;">.............</span>
								</span>
							</div>
							<div class="sty1040RightNumBox">7a</div>
							<div class="sty1040AmountBox">
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
						<!-- Block 7b - 11a -->
						<div style="display:block; page-break-inside:avoid ">
						<div class="styGenericDiv" style="width:20mm;padding-top:0mm;height:20.5mm;"></div>
						<!-- Line 7b -->
						<div class="sty1040LN">
								<div class="styLNLeftNumBoxSD" style="padding-left:1.5mm;margin-left:5px;margin-right:-4px;padding-top:1.7mm;">b</div>
								<div class="sty1040Desc" style="width:122.7mm;font-family:Arial Narrow;">
									<span style="font-family:Verdana;">Check if
									<span style="width:1mm;"/>
									</span> 
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
									<!-- 7b - Includes child’s capital gain or (loss) -->
									<span style="width:3mm;height:4mm;"/>
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
									</div>
									<div class="sty1040RightNumBoxNBB" style="background-color:lightgrey;">&nbsp;</div>
									<div class="sty1040AmountBoxNBB" style="">&nbsp;</div>
									</div>
						<!-- Line 8 -->
						<div class="sty1040LN">
							<div class="styLNLeftNumBoxSD" style="padding-left:1mm">8</div>
							<div class="sty1040Desc">
								Additional income from Schedule 1, line 10
								<span class="sty1040DotLn">................</span>
							</div>
							<div class="sty1040RightNumBox">8</div>
							<div class="sty1040AmountBox">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/TotalAdditionalIncomeAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<!-- Line 9 -->
						<div class="sty1040LN">
							<div class="styLNLeftNumBoxSD" style="padding-left:1mm;">9</div>
							<div class="sty1040Desc">
								Add lines 1z, 2b, 3b, 4b, 5b, 6b, 7a, and 8. This is your <strong>total income</strong>
								<span style="float:right">
									<span class="sty1040DotLn" style="float:none;margin-right:-7px;">........</span>
									<span style="width:8px;"/>
								</span>
							</div>
							<div class="sty1040RightNumBox">9</div>
							<div class="sty1040AmountBox">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/TotalIncomeAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<!-- Line 10 -->
						<div class="sty1040LN">
							<div class="styLNLeftNumBoxSD" style="padding-left:1mm;">10 &nbsp;</div>
							<div class="sty1040Desc">
								Adjustments to income from Schedule 1, line 26 
							<span style="float:right">
									<span class="sty1040DotLn" style="float:none;margin-right:-7px;">...............</span>
									<span style="width:8px;"/>
								</span>
							</div>
							<div class="sty1040RightNumBox">10</div>
							<div class="sty1040AmountBox">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/TotalAdjustmentsAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<!-- Line 11a -->
						<div class="sty1040LN">
							<div class="styLNLeftNumBoxSD" style="padding-left:1mm;padding-top:.3mm">11a</div>
							<div class="sty1040Desc" style="padding-top:0mm">
								Subtract line 10 from line 9. This is your <strong>adjusted gross income</strong>
								<span style="width:4px"/>
								<xsl:call-template name="LinkToLeftoverDataTableInline">
									<xsl:with-param name="Desc">Line 11 - Excluded Section 933 Puerto Rico Income Code</xsl:with-param>
									<xsl:with-param name="TargetNode" select="$FormData/ExcldSect933PuertoRicoIncmAmt/@excldSect933PuertoRicoIncmCd"/>
								</xsl:call-template>
								<xsl:call-template name="LinkToLeftoverDataTableInline">
									<xsl:with-param name="Desc">Line 11 - Excluded Section 933 Puerto Rico Income Amount</xsl:with-param>
									<xsl:with-param name="TargetNode" select="$FormData/ExcldSect933PuertoRicoIncmAmt"/>
								</xsl:call-template>
								<span style="float:right">
									<span class="sty1040DotLn" style="float:none;margin-right:-7px;">.......</span>
									<span style="width:8px;"/>
								</span>
							</div>
							<div class="sty1040RightNumBox" style="border-bottom-width: 0px;">11a</div>
							<div class="sty1040AmountBox" style="border-bottom-width: 0px;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/AdjustedGrossIncomeAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<!-- End of Block 7b - 11a -->
						<!-- End -->
						<!-- Form footer-->
						<div class="styStdDiv pageEnd" style="border-top:1px solid black;padding-top:.5mm">
							<span style="font-weight:bold;font-family:Arial;">For Disclosure, Privacy Act, and Paperwork Reduction Act Notice, see separate instructions.</span>
							<span style="margin-left:13mm;font-size:6.5pt;">Cat. No. 11320B</span>
							<span style="float:right;font-size:6.5pt;">Form <strong>1040</strong> (2025)</span>
						</div>
						<!-- Page 2 -->
						<div class="styStdDiv" style="border-bottom:1px solid black;">
							Form 1040 (2025)
							<div style="float:right;">Page <strong>2</strong></div>
						</div>
						<div class="styStdDiv" style="border-bottom:0px solid black;overflow:visible;">
							<div class="styGenericDiv" style="width:20mm;padding-top:1mm;padding-bottom:1mm;">
								<span style="padding-left:0mm;font-weight:bold;font-size:10pt;padding-bottom:1mm">Tax and</span>
								<span style="padding-left:0mm;font-weight:bold;font-size:10pt;padding-bottom:5mm;">Credits</span>								
					
							</div>
							<!-- Line 11b -->
						<div class="sty1040LN">
							<div class="styLNLeftNumBoxSD" style="padding-left:1mm;padding-top:.3mm">11b</div>
							<div class="sty1040Desc" style="padding-top:0mm">
								Amount from line 11a (adjusted gross income)
								<span style="width:4px"/>
								
								<span style="float:right">
									<span class="sty1040DotLn" style="float:none;margin-right:-7px;">...............</span>
									<span style="width:8px;"/>
								</span>
							</div>
							<div class="sty1040RightNumBox">11b</div>
							<div class="sty1040AmountBox">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/AdjustedGrossIncomeAmt"/>
								</xsl:call-template>
							</div>
						</div>
							<!-- Line 12a -->
						<div class="sty1040LN">
						<div class="styLNLeftNumBoxSD" style="padding-left:0mm;padding-top:1mm;margin-left:5px;margin-right:-4px;">12a</div>
							<div class="sty1040Desc" style="width:122.7mm;">
									<span style="font-family:Verdana;">Someone can claim
									<span style="width:4.5mm;"/>
									</span> 
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
									<span style="width:6mm;height:1mm;"/>
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
									<span style="width:4px"/>
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
									</div>
									<div class="sty1040RightNumBoxNBB" style="background-color:lightgrey;">&nbsp;</div>
									<div class="sty1040AmountBoxNBB" style="">&nbsp;</div>
									</div>
								<!-- Line 12b -->
						<div class="sty1040LN">
								<div class="styLNLeftNumBoxSD" style="padding-left:3.3mm;margin-left:5px;margin-right:-4px;">b</div>
							<div class="sty1040Desc" style="width:122.7mm;">
									<span style="width:1mm;"/>
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
									<span style="width:12mm;height:1mm;"/>
									<span style="font-size:11px;"><strong>c</strong></span>
									<span style="width:2mm;height:1mm;"/>
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
									</div>
									<div class="sty1040RightNumBoxNBB" style="background-color:lightgrey;">&nbsp;</div>
									<div class="sty1040AmountBoxNBB" style="">&nbsp;</div>
									</div>	
						<!-- Line 12d (2)-->
						<div class="sty1040LN">
								<div class="styLNLeftNumBoxSD" style="padding-left:3.3mm;margin-left:5px;margin-right:-4px;">d</div>
							<div class="sty1040Desc" style="width:122.7mm;">
									<span style="width:1mm;"/>
							<!-- 12d - Spouse itemizes on a separate return -->
							<strong>You:</strong>
							<span style="width:6mm;"/>
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
									<!-- 12c - Your spouse as a dependent -->
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
										
									</div>
									<div class="sty1040RightNumBoxNBB" style="background-color:lightgrey;height:5mm;">&nbsp;</div>
									<div class="sty1040AmountBoxNBB" style="height:5mm;">&nbsp;</div>
									</div>	
								
							</div> 		
							<!-- End of Block 5-12d -->
							<div class="styStdDiv" style="border-bottom:0px solid black;overflow:visible;">
						<div class="styGenericDiv" style="width:20mm;padding-top:1mm;padding-bottom:1mm;">
						<!-- Left Col. Block Line 12e - 24-->
							<div class="styGenericDiv" style="width:20mm;padding-bottom:5mm;height:57mm;">
							<div style="width:100%;border:1px solid black;border-bottom:none;border-radius:8px 8px 0px 0px;padding-top:1mm;padding-left:1mm;font-family:Arial;">
								<strong>Standard Deduction for &ndash;</strong><br/>
								<span style="width:1.9mm;float:left;"><img src="{$ImagePath}/1040_Bullet_Round.gif" alt="Round Bullet"/></span>
								<span style="float:left;width:16.5mm;">Single or Married filing separately, $15,750</span>
							</div>
							<div style="width:100%;border-left:1px solid black;border-right:1px solid black;padding-left:1mm;font-family:Arial;">
								<span style="width:1.9mm;height:5mm;float:left;">
									<img src="{$ImagePath}/1040_Bullet_Round.gif" alt="Round Bullet"/></span>
								<span style="float:left;width:16.5mm;">Married filing jointly or Qualifying surviving spouse, $31,500</span>
							</div>
							<div style="width:100%;border-left:1px solid black;border-right:1px solid black;padding-left:1mm;font-family:Arial;">
								<span style="width:1.9mm;height:5mm;float:left;"><img src="{$ImagePath}/1040_Bullet_Round.gif" alt="Round Bullet"/></span>
								<span style="float:left;width:16.5mm;">Head of household, $23,625</span>
							</div>
							<div style="width:100%;border:1px solid black;border-top:none;border-radius:0px 0px 8px 8px;padding-left:1mm;font-family:Arial;">
								<span style="width:1.9mm;height:5mm;float:left;"><img src="{$ImagePath}/1040_Bullet_Round.gif" alt="Round Bullet"/></span>
								<span style="float:left;width:16.5mm;font-size:8.5px;">If you checked a box on line 12a, 12b, 12c, or 12d, see inst.</span>
							</div>
						</div>
							</div>
									<!-- Line 12d (2) -->
						<div class="sty1040LN">
								<div class="styLNLeftNumBoxSD" style="padding-left:3.3mm;margin-left:5px;margin-right:-4px;"></div>
							<div class="sty1040Desc" style="width:122.7mm;">
									<span style="width:1mm;"/>
							<!-- 12d - Spouse itemizes on a separate return -->
							<strong>Spouse:</strong>
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
									<!-- 12c - Your spouse as a dependent -->
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
									</div>
									<div class="sty1040RightNumBoxNBB" style="background-color:lightgrey;">&nbsp;</div>
									<div class="sty1040AmountBoxNBB" style="">&nbsp;</div>
									</div>		
							<!-- Line 12e -->
						<div class="sty1040LN">
							<div class="styLNLeftNumBoxSD" style="border-top:1px solid black;border-bottom:1px solid black;border-left:2px solid white;padding-left:4.5mm;margin-left:-2px;margin-right:2px;padding-top:0px">e</div>
							<div class="sty1040Desc" style="padding-top:0.7mm;">
								<strong>Standard deduction or itemized deductions </strong> (from Schedule A) 
								<span class="sty1040DotLn">.........</span>
							</div>
							<div class="sty1040RightNumBox">12e</div>
							<div class="sty1040AmountBox">
							<span style="float:left;padding-left:0.5mm;">
								<xsl:call-template name="LinkToLeftoverDataTableInline">
									<xsl:with-param name="Desc">Line 12 - Modified Standard Deduction Ind</xsl:with-param>
									<xsl:with-param name="TargetNode" select="$FormData/TotalItemizedOrStandardDedAmt/@modifiedStandardDeductionInd"/>
								</xsl:call-template>
							</span>
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/TotalItemizedOrStandardDedAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<!-- Line 13a -->
						<div class="sty1040LN">
							<div class="styLNLeftNumBoxSD" style="padding-left:1mm;">13a</div>
							<div class="sty1040Desc" style="width:123mm;">
								Qualified business income deduction from Form 8995 or Form 8995-A
								<span class="sty1040DotLn">........</span>
							</div>
							<div class="sty1040RightNumBox">13a</div>
							<div class="sty1040AmountBox">
								<span style="float:left;padding-left:0.5mm;">
									<xsl:call-template name="SetFormLinkInline">
										<xsl:with-param name="TargetNode" select="$FormData/QualifiedBusinessIncomeDedAmt"/>
									</xsl:call-template>
								</span>
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/QualifiedBusinessIncomeDedAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<!-- Line 13b -->
						<div class="sty1040LN">
							<div class="styLNLeftNumBoxSD" style="padding-left:3.3mm;margin-left:5px;margin-right:-4px;">b</div>
							<div class="sty1040Desc" style="width:122.7mm;">
								Additional deductions from Schedule 1-A, line 38
								<span class="sty1040DotLn">...............</span>
							</div>
							<div class="sty1040RightNumBox">13b</div>
							<div class="sty1040AmountBox">
							<span style="float:left;padding-left:0.5mm;">
									<xsl:call-template name="SetFormLinkInline">
										<xsl:with-param name="TargetNode" select="$FormData/TotalAdditionalDeductionsAmt"/>
									</xsl:call-template>
								</span>
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/TotalAdditionalDeductionsAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<!-- Line 14 -->
						<div class="sty1040LN">
							<div class="styLNLeftNumBoxSD" style="padding-left:1mm;">14</div>
							<div class="sty1040Desc">
								Add lines 12e, 13a, and 13b
								<span class="sty1040DotLn">.....................</span>
							</div>
							<div class="sty1040RightNumBox">14</div>
							<div class="sty1040AmountBox">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/TotalDeductionsAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<!-- Line 15 -->
						<div class="sty1040LN">
							<div class="styLNLeftNumBox" style="padding-left:1mm;">15</div>
							<div class="sty1040Desc">
								Subtract line 14 from line 11b. If zero or less, enter -0-. This is your <b>taxable income</b>
								<xsl:call-template name="LinkToLeftoverDataTableInline">
									<xsl:with-param name="Desc">Line 15 - Capital Construction Fund Code</xsl:with-param>
									<xsl:with-param name="TargetNode" select="$FormData/TaxableIncomeAmt/@capitalConstructionFundCd"/>
								</xsl:call-template>
								<xsl:call-template name="LinkToLeftoverDataTableInline">
									<xsl:with-param name="Desc">Line 15 - Capital Construction Fund Amount</xsl:with-param>
									<xsl:with-param name="TargetNode" select="$FormData/TaxableIncomeAmt/@capitalConstructionFundAmt"/>
								</xsl:call-template>
								<xsl:call-template name="LinkToLeftoverDataTableInline">
									<xsl:with-param name="Desc">Line 15 - Schedule Q Code</xsl:with-param>
									<xsl:with-param name="TargetNode" select="$FormData/ScheduleQCd"/>
								</xsl:call-template>
								<span class="sty1040DotLn">.</span>
							</div>
							<div class="sty1040RightNumBox">15</div>
							<div class="sty1040AmountBox">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/TaxableIncomeAmt"/>
								</xsl:call-template>
							</div>
						</div>					
							<!-- Line 16 -->
							<div class="sty1040LN">
								<div class="styLNLeftNumBox" style="padding-left:1mm;padding-top:1mm" >16</div>
								<div class="sty1040Desc" style="width:123mm;font-family:Arial;">
									<span style="font-weight:bold;font-family:Verdana;">Tax </span> (see instructions). Check if any from Form(s): 
									<span style="font-weight:bold;font-family:Verdana;width:3mm;text-align:center;">1</span>
									
									<!-- 16(1) -->
									<input type="checkbox" class="styCkboxNM" aria-label="Form 8814 check box checked" style="">
										<xsl:call-template name="PopulateCheckbox">
											<xsl:with-param name="TargetNode" select="$FormData/Form8814Ind"/>
											<xsl:with-param name="BackupName">F1040Form8814Ind</xsl:with-param>
										</xsl:call-template>
									</input>
									<label style="padding-left:1mm;font-family:Arial;">
										<xsl:call-template name="PopulateLabel">
											<xsl:with-param name="TargetNode" select="$FormData/Form8814Ind"/>
											<xsl:with-param name="BackupName">F1040Form8814Ind</xsl:with-param>
										</xsl:call-template>8814</label>
										<xsl:call-template name="SetFormLinkInline">
											<xsl:with-param name="TargetNode" select="$FormData/Form8814Ind"/>
										</xsl:call-template>
										<xsl:call-template name="LinkToLeftoverDataTableInline">
											<xsl:with-param name="Desc">Line 16(1) - Child Interest and Dividend Tax Amount</xsl:with-param>
											<xsl:with-param name="TargetNode" select="$FormData/Form8814Ind/@childInterestAndDividendTaxAmt"/>
										</xsl:call-template>
									<!-- 16(2) -->
									<span style="width:1mm;height:3mm;"/>
									<span style="font-weight:bold;font-family:Verdana;width:3.5mm;text-align:center;">2</span>
									<input type="checkbox" class="styCkboxNM" aria-label="Form 4972 check box checked" style="">
										<xsl:call-template name="PopulateCheckbox">
											<xsl:with-param name="TargetNode" select="$FormData/Form4972Ind"/>
											<xsl:with-param name="BackupName">F1040Form4972Ind</xsl:with-param>
										</xsl:call-template>
									</input>
									<label style="padding-left:1mm;font-family:Arial;">
										<xsl:call-template name="PopulateLabel">
											<xsl:with-param name="TargetNode" select="$FormData/Form4972Ind"/>
											<xsl:with-param name="BackupName">F1040Form4972Ind</xsl:with-param>
										</xsl:call-template>4972</label>
										<xsl:call-template name="SetFormLinkInline">
											<xsl:with-param name="TargetNode" select="$FormData/Form4972Ind"/>
										</xsl:call-template>	
									<!-- 16(3) -->	
									<span style="width:1mm;height:3mm;"/>
									<span style="font-weight:bold;font-family:Verdana;width:3.5mm;text-align:center;">3</span>

									<input type="checkbox" class="styCkboxNM" style="margin-right:1mm;" aria-label="Other Tax Amounts check box checked">
										<xsl:call-template name="PopulateCheckbox">
											<xsl:with-param name="TargetNode" select="$FormData/OtherTaxAmtInd"/>
											<xsl:with-param name="BackupName">F1040OtherTaxAmtInd</xsl:with-param>
										</xsl:call-template>
									</input>
									<span style="width:18mm;border-bottom:1px solid black;">
										<xsl:call-template name="SetFormLinkInline">
											<xsl:with-param name="TargetNode" select="$FormData/OtherTaxAmtInd"/>
										</xsl:call-template>
										<xsl:if test="count($FormData/OtherTaxAmtGrp) &lt; 2">
											<xsl:call-template name="LinkToLeftoverDataTableInline">
												<xsl:with-param name="Desc">Line 16(3) - Other Tax Amount Code</xsl:with-param>
												<xsl:with-param name="TargetNode" select="$FormData/OtherTaxAmtGrp/OtherTaxAmtCd"/>
											</xsl:call-template>
											<xsl:call-template name="LinkToLeftoverDataTableInline">
												<xsl:with-param name="Desc">Line 16(3) - Other Tax Amount</xsl:with-param>
												<xsl:with-param name="TargetNode" select="$FormData/OtherTaxAmtGrp/OtherTaxAmt"/>
											</xsl:call-template>
										</xsl:if>
										<xsl:if test="count($FormData/OtherTaxAmtGrp) &gt;= 2">
											<xsl:call-template name="LinkToLeftoverDataTableInline">
												<xsl:with-param name="Desc">Line 16(3) - Other Tax Groups</xsl:with-param>
												<xsl:with-param name="TargetNode" select="$FormData/OtherTaxAmtGrp"/>
											</xsl:call-template>
										</xsl:if>
									</span>
										</div>
										<div class="sty1040RightNumBox">16</div>
										<div class="sty1040AmountBox">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$FormData/TaxAmt"/>
											</xsl:call-template>
										</div>
									</div>
							<!-- Line 17 -->
							<div class="sty1040LN">
										<div class="styLNLeftNumBoxSD" style="padding-left:1mm;">17</div>
											<div class="sty1040Desc">
												Amount from Schedule 2, line 3
												<span style="float:right">
													<span class="sty1040DotLn" style="float:none;margin-right:-8px;">....................</span>
													<span style="width:8px;"/>
												</span>
											</div>
											<div class="sty1040RightNumBox">17</div>
											<div class="sty1040AmountBox">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="$FormData/AdditionalTaxAmt"/>
												</xsl:call-template>
											</div>
										</div>
										<!-- Line 18 -->
										<div class="sty1040LN">
											<div class="styLNLeftNumBox" style="padding-left:1mm">18</div>
											<div class="sty1040Desc">
												Add lines 16 and 17
												<span class="sty1040DotLn">........................</span>
											</div>
											<div class="sty1040RightNumBox">18</div>
											<div class="sty1040AmountBox">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="$FormData/TotalTaxBeforeCrAndOthTaxesAmt"/>
												</xsl:call-template>
											</div>
										</div>
										<!-- Line 19 -->
										<div class="sty1040LN">
											<div class="styLNLeftNumBox" style="padding-left:1mm">19</div>
											<div class="sty1040Desc" style="width:123mm;">
												Child tax credit or credit for other dependents from Schedule 8812
												<span class="sty1040DotLn" style="padding-right:1.7px;">.........</span>
											</div>
											<div class="sty1040RightNumBox">19</div>
											<div class="sty1040AmountBox">
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
										<div class="sty1040LN">
											<div class="styLNLeftNumBoxSD" style="padding-left:1mm;">20</div>
											<div class="sty1040Desc">
												Amount from Schedule 3, line 8
												<span style="float:right">
													<span class="sty1040DotLn" style="float:none;margin-right:-8px;">....................</span>
													<span style="width:8px;"/>
												</span>
											</div>
											<div class="sty1040RightNumBox">20</div>
											<div class="sty1040AmountBox">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="$FormData/TotalNonrefundableCreditsAmt"/>
												</xsl:call-template>
											</div>
										</div>
										<!-- Line 21 -->
										<div class="sty1040LN">
											<div class="styLNLeftNumBox" style="padding-left:1mm">21</div>
											<div class="sty1040Desc">
												Add lines 19 and 20
												<span class="sty1040DotLn">........................</span>
											</div>
											<div class="sty1040RightNumBox">21</div>
											<div class="sty1040AmountBox">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="$FormData/TotalCreditsAmt"/>
												</xsl:call-template>
											</div>
										</div>
										<!-- Line 22 -->
										<div class="sty1040LN">
											<div class="styLNLeftNumBox" style="padding-left:1mm">22</div>
											<div class="sty1040Desc">
												Subtract line 21 from line 18. If zero or less, enter -0-
												<span class="sty1040DotLn">.............</span>
											</div>
											<div class="sty1040RightNumBox">22</div>
											<div class="sty1040AmountBox">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="$FormData/TaxLessCreditsAmt"/>
												</xsl:call-template>
											</div>
										</div>
										<!-- Line 23 -->
										<div class="sty1040LN">
											<div class="styLNLeftNumBox" style="padding-left:1mm">23</div>
											<div class="sty1040Desc">
												Other taxes, including self-employment tax, from Schedule 2, line 21
												<span class="sty1040DotLn">.........</span>
											</div>
											<div class="sty1040RightNumBox">23</div>
											<div class="sty1040AmountBox">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="$FormData/TotalOtherTaxesAmt"/>
												</xsl:call-template>
											</div>
										</div>
										<!-- Line 24 -->
										<div class="sty1040LN">
											<div class="styLNLeftNumBox" style="padding-left:1mm">24</div>
											<div class="sty1040Desc">
												Add lines 22 and 23. This is your <strong>total tax </strong> 
												<xsl:call-template name="LinkToLeftoverDataTableInline">
													<xsl:with-param name="Desc">Line 24 - Deferred Tax 1 Total Tax Deferred Amount</xsl:with-param>
													<xsl:with-param name="TargetNode" select="$FormData/Form8854DeferredTaxGrp[1]/TotalTaxDeferredAmt"/>
												</xsl:call-template>
												<xsl:call-template name="LinkToLeftoverDataTableInline">
													<xsl:with-param name="Desc">Line 24 - Deferred Tax 1 Expatriation Code</xsl:with-param>
													<xsl:with-param name="TargetNode" select="$FormData/Form8854DeferredTaxGrp[1]/ExpatriationCd"/>
												</xsl:call-template>
												<xsl:call-template name="LinkToLeftoverDataTableInline">
													<xsl:with-param name="Desc">Line 24 - Deferred Tax 2 Total Tax Deferred Amount</xsl:with-param>
													<xsl:with-param name="TargetNode" select="$FormData/Form8854DeferredTaxGrp[2]/TotalTaxDeferredAmt"/>
												</xsl:call-template>
												<xsl:call-template name="LinkToLeftoverDataTableInline">
													<xsl:with-param name="Desc">Line 24 - Deferred Tax 2 Expatriation Code</xsl:with-param>
													<xsl:with-param name="TargetNode" select="$FormData/Form8854DeferredTaxGrp[2]/ExpatriationCd"/>
												</xsl:call-template>
												<span style="float:right">
													<span class="sty1040DotLn" style="float:none;margin-right:-8px;">...............</span>
													<span style="width:8px;"/>
												</span>
											</div>
											<div class="sty1040RightNumBox" style="border-bottom-width: 0px">24</div>
											<div class="sty1040AmountBox" style="border-bottom-width: 0px">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="$FormData/TotalTaxAmt"/>
												</xsl:call-template>
											</div>
										</div>
									</div>	
					<!-- block end Line 24 -->
				   <div class="styStdDiv" style="border-top:1px solid black;overflow:visible;">
						<div class="styGenericDiv" style="width:20mm;padding-top:0mm;padding-bottom:1mm;">
							<span style="padding-left:.5mm;font-weight:bold;font-size:9.5pt;padding-bottom:12mm;">Payments<br/>and Refundable Credits</span>
							<div style="width:100%;border:1px solid black;border-radius:8px;padding-top:2mm;padding-left:1mm;font-family:Arial;">
								<span style="width:1.9mm;height:5mm;float:left;"></span>
								<span style="float:left;width:16.5mm;">If you have a qualifying child, you may need to attach Sch. EIC.</span>
								<br />
								<span style="width:1.5mm;height:2mm;float:left;"></span>
								<span style="float:left;width:16.5mm;"></span>
							</div>
							<div style="height:20mm;"></div>		
						</div>
						<!-- Line 25 -->
						<div class="sty1040LN">
							<div class="styLNLeftNumBox" style="padding-left:1mm;padding-top:1mm;">25</div>
							<div class="sty1040Desc" style="padding-top:1mm;">
								Federal income tax withheld from: 
							</div>
							<div class="sty1040RightNumBoxNBB" style="background-color:lightgrey;">&nbsp;</div>
							<div class="sty1040AmountBoxNBB" style="">&nbsp;</div>
						</div>
						<!-- Line 25a -->
						<div class="sty1040LN">
							<div class="styLNLeftNumBoxSD" style="padding-left:4mm;">a</div>
							<div class="sty1040Desc" style="width:87mm;">
								Form(s) W-2
								<span class="sty1040DotLn" style="padding-right:1px;">.................</span>
							</div>
							<div class="sty1040RightNumBox">25a</div>
							<div class="sty1040AmountBox">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/FormW2WithheldTaxAmt"/>
								</xsl:call-template>
							</div>
							<div class="sty1040RightNumBoxNBB" style="background-color:lightgrey;">&nbsp;</div>
							<div class="sty1040AmountBoxNBB" style="">&nbsp;</div>
						</div>			
						<!-- Line 25b -->
						<div class="sty1040LN">
							<div class="styLNLeftNumBoxSD" style="padding-left:4mm;padding-top:.75mm;">b</div>
							<div class="sty1040Desc" style="width:87mm;">
								Form(s) 1099
								<span style="width:.2mm"/>																	
								<span>
									<xsl:call-template name="SetFormLinkInline">
										<xsl:with-param name="TargetNode" select="$FormData/Form1099WithheldTaxAmt"/>
									</xsl:call-template>
								</span>								
								<span class="sty1040DotLn" style="padding-right:1px;">................</span>
							</div>
							<div class="sty1040RightNumBox">25b</div>
							<div class="sty1040AmountBox">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/Form1099WithheldTaxAmt"/>
								</xsl:call-template>
							</div>
							<div class="sty1040RightNumBoxNBB" style="background-color:lightgrey;">&nbsp;</div>
							<div class="sty1040AmountBoxNBB" style="">&nbsp;</div>
						</div>
						<!-- Line 25c -->
						<div class="sty1040LN">
							<div class="styLNLeftNumBoxSD" style="padding-left:4mm;padding-top:.75mm;">c</div>
							<div class="sty1040Desc" style="width:87mm;">
								Other forms (see instructions)
								<span style="width:.2mm;"/>
								<span>
									<xsl:call-template name="SetFormLinkInline">
										<xsl:with-param name="TargetNode" select="$FormData/TaxWithheldOtherAmt"/>
									</xsl:call-template>
								</span>								
								<span class="sty1040DotLn" style="padding-right:1px;">...........</span>
							</div>
							<div class="sty1040RightNumBox">25c</div>
							<div class="sty1040AmountBox">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/TaxWithheldOtherAmt"/>
								</xsl:call-template>
							</div>
							<div class="sty1040RightNumBoxNBB" style="background-color:lightgrey;">&nbsp;</div>
							<div class="sty1040AmountBoxNBB" style="">&nbsp;</div>
						</div>																		
						<!-- Line 25d -->
						<div class="sty1040LN">
							<div class="styLNLeftNumBox" style="padding-left:4mm">d</div>
							<div class="sty1040Desc">
								Add lines 25a through 25c
								<span class="sty1040DotLn">......................</span>
							</div>
							<div class="sty1040RightNumBox">25d</div>
							<div class="sty1040AmountBox">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/WithholdingTaxAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<!-- Line 26 -->
						<div class="sty1040LN">
							<div class="styLNLeftNumBox" style="padding-left:1mm">26</div>
							<div class="sty1040Desc">
								2025 estimated tax payments and amount applied from 2024 return
									<span class="sty1040DotLn">.........</span>
							</div>
							<div class="sty1040RightNumBox">26</div>
							<div class="sty1040AmountBox">
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
						<!-- Line 26 - 1 -->
						<div class="sty1040LN">
							<div class="styLNLeftNumBox" style="padding-left:1mm:height:6mm;"></div>
							<div class="sty1040Desc" style="height:6mm;padding-top:0mm;">
								If you made estimated tax payments with your former spouse in 2025, <br/>
								enter their SSN (see instructions):
								<span style="width:1mm;height:4mm;"/>
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
							<div class="sty1040RightNumBoxNBB" style="background-color:lightgrey;height:6mm">&nbsp;</div>
							<div class="sty1040AmountBoxNBB" style="height:6mm">&nbsp;</div>
						</div>
						<!-- Line 27a -->
						<div class="sty1040LN">
							<div class="styLNLeftNumBoxSD" style="border-top:1px solid black;
								border-bottom:1px solid black;border-left:2px solid white;margin-left:-2px;
								margin-right:2px;padding-left:.9mm;padding-top:.8mm;height:4.7mm">27a</div>
							<div class="sty1040Desc" style="width:87mm;padding-top:1.7mm;height:4.7mm">
								Earned income credit (EIC) 
								<xsl:call-template name="LinkToLeftoverDataTableInline">
									<xsl:with-param name="Desc">Line 27a - Earned Income Credit Eligibility Literal Code</xsl:with-param>
									<xsl:with-param name="TargetNode" select="$FormData/EICEligibilityLiteralCd"/>
								</xsl:call-template>
								<span class="sty1040DotLn" style="padding-right:1px;">...........</span>
							</div>
							<div class="sty1040RightNumBox" style="height:4.7mm;padding-top:1mm;">27a</div>
							<div class="sty1040AmountBox" style="height:4.7mm;padding-top:1mm;">
								<span style="float:left;">
									<xsl:call-template name="SetFormLinkInline">
										<xsl:with-param name="TargetNode" 
											select="$FormData/EarnedIncomeCreditAmt"/>
									</xsl:call-template>
								</span>
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/EarnedIncomeCreditAmt"/>
								</xsl:call-template>
							</div>
							<div class="sty1040RightNumBoxNBB" style="background-color:lightgrey;height:4.7mm">&nbsp;</div>
							<div class="sty1040AmountBoxNBB" style="height:4.7mm">&nbsp;</div>
						</div>
						<!-- Line 27b -->
						<div class="sty1040LN">
							<div class="styLNLeftNumBox" style="padding-left:4mm">b</div>
							<div class="sty1040Desc">
								Clergy filing Schedule SE (see instructions)
								<span style="float:right;">
								<span class="sty1040DotLn" style="float:none;margin-right:-11px;">................</span>
									<input type="checkbox" class="styCkbox" style="margin-right:6px;" aria-label="Clergy Indicator">
										<xsl:call-template name="PopulateCheckbox">
											<xsl:with-param name="TargetNode" select="$FormData/ClergyMemberInd"/>
											<xsl:with-param name="BackupName">IRS1040ClergyMemberInd</xsl:with-param>
										</xsl:call-template>
									</input>
								</span>
							</div>
							<div class="sty1040RightNumBoxNBB" style="background-color:lightgrey;height:4.7mm">&nbsp;</div>
							<div class="sty1040AmountBoxNBB" style="height:4.7mm">&nbsp;</div>
						</div>
						<!-- Line 27c -->
						<div class="sty1040LN">
							<div class="styLNLeftNumBox" style="padding-left:4mm">c</div>
							<div class="sty1040Desc">
								If you do not want to claim the EIC, check here
								<span style="float:right;">
								<span class="sty1040DotLn" style="float:none;margin-right:-11px;">...............</span>
									<input type="checkbox" class="styCkbox" style="margin-right:6px;" aria-label="Do Not Want To Claim EIC Indicator">
										<xsl:call-template name="PopulateCheckbox">
											<xsl:with-param name="TargetNode" select="$FormData/DoNotClaimEICInd"/>
											<xsl:with-param name="BackupName">IRS1040DoNotClaimEICInd</xsl:with-param>
										</xsl:call-template>
									</input>
								</span>
							</div>
							<div class="sty1040RightNumBoxNBB" style="background-color:lightgrey;height:4.7mm">&nbsp;</div>
							<div class="sty1040AmountBoxNBB" style="height:4.7mm">&nbsp;</div>
						</div>
						<!-- Line 28 -->
						<div class="sty1040LN">
							<div class="styLNLeftNumBoxSD" style="padding-left:1mm;height:8mm;">28</div>
							<div class="sty1040Desc" style="width:87mm;height:8mm;">
								Additional child tax credit (ACTC) from Schedule 8812. If you do not want to claim the ACTC, check here
								<xsl:call-template name="LinkToLeftoverDataTableInline">
									<xsl:with-param name="Desc">Line 28 - Additional Child Tax Credit Opt Out Indicator</xsl:with-param>
									<xsl:with-param name="TargetNode" select="$FormData/DoNotClaimACTCInd"/>
								</xsl:call-template>
								<span style="float:right;">
								<span class="sty1040DotLn" style="float:none;margin-right:-11px;">........</span>
									<input type="checkbox" class="styCkbox" style="margin-right:6px;" aria-label="Additional Child Tax Credit Opt Out Indicator">
										<xsl:call-template name="PopulateCheckbox">
											<xsl:with-param name="TargetNode" select="$FormData/DoNotClaimACTCInd"/>
											<xsl:with-param name="BackupName">IRS1040DoNotClaimACTCInd</xsl:with-param>
										</xsl:call-template>
									</input>
								</span>
							</div>
							<div class="sty1040RightNumBox" style="height:8mm;padding-top:4.5mm">28</div>
							<div class="sty1040AmountBox" style="height:8mm;padding-top:4.5mm">
								<span style="float:left;">
									<xsl:call-template name="SetFormLinkInline">
										<xsl:with-param name="TargetNode" select="$FormData/AdditionalChildTaxCreditAmt"/>
									</xsl:call-template>
								</span>
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/AdditionalChildTaxCreditAmt"/>
								</xsl:call-template>
							</div>
							<div class="sty1040RightNumBoxNBB" style="background-color:lightgrey;height:8mm;">&nbsp;</div>
							<div class="sty1040AmountBoxNBB" style="height:8mm;">&nbsp;</div>
						</div>
						<!-- Line 29 -->
						<div class="sty1040LN">
							<div class="styLNLeftNumBoxSD" style="padding-left:1mm;">29</div>
							<div class="sty1040Desc" style="width:87mm;">
								American opportunity credit from Form 8863, line 8
								<span class="sty1040DotLn" style="padding-right:1px;">.....</span>
							</div>
							<div class="sty1040RightNumBox">29</div>
							<div class="sty1040AmountBox">
								<span style="float:left;">
									<xsl:call-template name="SetFormLinkInline">
										<xsl:with-param name="TargetNode" select="$FormData/RefundableAmerOppCreditAmt"/>
									</xsl:call-template>
								</span>
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/RefundableAmerOppCreditAmt"/>
								</xsl:call-template>
							</div>
							<div class="sty1040RightNumBoxNBB" style="background-color:lightgrey;">&nbsp;</div>
							<div class="sty1040AmountBoxNBB" style="">&nbsp;</div>
						</div>
						<!-- Line 30 -->
						<div class="sty1040LN">
							<div class="styLNLeftNumBoxSD" style="padding-left:1mm;">30</div>
							<div class="sty1040Desc" style="width:87mm;">
								Refundable adoption credit from Form 8839, line 13
								<span class="sty1040DotLn" style="padding-right:1px;">.....</span>
							</div>
							<div class="sty1040RightNumBox">30</div>
							<div class="sty1040AmountBox">
							<span style="float:left;">
									<xsl:call-template name="SetFormLinkInline">
										<xsl:with-param name="TargetNode" select="$FormData/RefundableAdoptionCreditAmt"/>
									</xsl:call-template>
								</span>
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/RefundableAdoptionCreditAmt"/>
								</xsl:call-template>
							</div>
							<div class="sty1040RightNumBoxNBB" style="background-color:lightgrey;">&nbsp;</div>
							<div class="sty1040AmountBoxNBB" style="">&nbsp;</div>
						</div>						
						<!-- Line 31 -->
						<div class="sty1040LN">
							<div class="styLNLeftNumBoxSD" style="padding-left:1mm;">31</div>
							<div class="sty1040Desc" style="width:87mm;">
								Amount from Schedule 3, line 15
								<span class="sty1040DotLn" style="padding-right:1px;">...........</span>
							</div>
							<div class="sty1040RightNumBox">31</div>
							<div class="sty1040AmountBox">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/TotalOtherPaymentsRfdblCrAmt"/>
								</xsl:call-template>
							</div>
							<div class="sty1040RightNumBoxNBB" style="background-color:lightgrey;">&nbsp;</div>
							<div class="sty1040AmountBoxNBB" style="">&nbsp;</div>
						</div>
						<!-- Line 32 -->
						<div class="sty1040LN">
							<div class="styLNLeftNumBox" style="padding-left:1mm;height:6mm;">32</div>
							<div class="sty1040Desc" style="height:6mm">
								Add lines 27a, 28, 29, 30, and 31. These are your <strong>total other payments and refundable credits </strong>
								<span style="float:right">
									<span class="sty1040DotLn" style="padding-right:1px;">............................</span>
								</span> 
							</div>
							<div class="sty1040RightNumBox" style="height:6mm;padding-top:2.5mm">32</div>
							<div class="sty1040AmountBox" style="height:6mm;padding-top:2.5mm">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/RefundableCreditsAmt"/>
								</xsl:call-template>
							</div>
						</div>
				</div>						
					<!-- Line 33 -->
					<div class="styStdDiv" style="overflow:visible;">
					<div class="styGenericDiv" style="width:20mm;padding-top:0mm;padding-bottom:1mm;">
							<span style="padding-left:.5mm;font-weight:bold;font-size:9.5pt;padding-bottom:0mm;"></span>
							<div style=""></div>		
						</div>
									<div class="styGenericDiv" style="width:20mm;"></div>
										<div class="sty1040LN">
											<div class="styLNLeftNumBox" style="padding-left:1mm">33</div>
											<div class="sty1040Desc" style="padding-top:.3mm">
												Add lines 25d, 26, and 32. These are your <strong>total payments </strong> 
												<xsl:call-template name="LinkToLeftoverDataTableInline">
													<xsl:with-param name="Desc">Line 33 - Form 8689 Code</xsl:with-param>
													<xsl:with-param name="TargetNode" select="$FormData/TotalPaymentsAmt/@form8689Cd"/>
												</xsl:call-template>
												<xsl:call-template name="LinkToLeftoverDataTableInline">
													<xsl:with-param name="Desc">Line 33 - Form 8689 Amount</xsl:with-param>
													<xsl:with-param name="TargetNode" select="$FormData/TotalPaymentsAmt/@form8689Amt"/>
												</xsl:call-template>
												<span style="float:right">
													<span class="sty1040DotLn" style="float:none;margin-right:-9px;">............</span>
													<span style="width:8px;"/>
												</span>
											</div>
											<div class="sty1040RightNumBoxNBB">33</div>
											<div class="sty1040AmountBoxNBB">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="$FormData/TotalPaymentsAmt"/>
												</xsl:call-template>
											</div>
										</div>
						</div>						
				   </div>			   
				   <!-- end -->
					<!-- Refund -->
					<div class="styStdDiv" style="border-top:1px solid black;overflow:visible;">
						<div class="styGenericDiv" style="width:20mm;padding-top:0mm;padding-bottom:1mm;">
							<span style="padding-left:.5mm;font-weight:bold;font-size:9.5pt;padding-bottom:3mm;">Refund</span>
							<div style="width:100%;padding-top:2mm;padding-left:.5mm;font-family:Arial;">
								<span style="float:left;width:18.5mm;">Direct deposit?<br />See instructions.</span>
							</div>
							<div style="height:1.5mm;"></div>		
						</div>
						<!-- Line 34 -->
						<div class="sty1040LN">
							<div class="styLNLeftNumBox" style="padding-left:1mm">34</div>
							<div class="sty1040Desc">
								If line 33 is more than line 24, subtract line 24 from line 33. This is the amount you <strong>overpaid </strong> 
							</div>
							<div class="sty1040RightNumBox">34</div>
							<div class="sty1040AmountBox">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/OverpaidAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<!-- Line 35a -->
						<div class="sty1040LN">
							<div class="styLNLeftNumBox" style="padding:.75mm 0mm .5mm 1mm;">35a</div>
							<div class="sty1040Desc">
								Amount of line 34 you want <strong>refunded to you. </strong> If Form 8888 is attached, check here
								<xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode" select="$FormData/Form8888Ind"/>
								</xsl:call-template>
								<span style="float:right;">
									<span class="sty1040DotLn" style="float:none;margin-right:-11px;">.</span>
									<span style="width:8px;"/>
									<input type="checkbox" class="styCkboxNM" style="margin-right:6px;" aria-label="form 8888 attached">
										<xsl:call-template name="PopulateCheckbox">
											<xsl:with-param name="TargetNode" select="$FormData/Form8888Ind"/>
											<xsl:with-param name="BackupName">IRS1040Form8888Ind</xsl:with-param>
										</xsl:call-template>
									</input>
								</span>
							</div>
							<div class="sty1040RightNumBox">35a</div>
								<div class="sty1040AmountBox">
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
							<div class="sty1040LN">
								<div class="styLNLeftNumBox">
									<span style="width:14px;"/>b</div>
									<div class="sty1040Desc">
										<span style="width:25mm;float:left;clear:none;padding-top:0mm">
										   Routing number
										</span>
										<span class="styLNCtrNumBox" style="width:34mm;border-top-width:1px;padding-top:0mm;padding-bottom:0mm;font-weight:normal">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="$FormData/RoutingTransitNum"/>
											</xsl:call-template>
										</span>
										<span style="width:27px;"/>
										<span style="width:4px;"/>
										<span class="styBoldText">c</span> Type:
										<span style="width:4px;"/>
										<!-- Checkbox  1=checking, 2 = savings -->
										<input type="checkbox" class="styCkboxNM">
											<xsl:call-template name="PopulateEnumeratedCheckbox">
												<xsl:with-param name="TargetNode" select="$FormData/BankAccountTypeCd"/>
												<xsl:with-param name="DisplayedCheckboxValue" select="'1'"/>
												<xsl:with-param name="BackupName">IRS1040BankAccountTypeCd[1]</xsl:with-param>
											</xsl:call-template>
										</input>
									<label>
										<xsl:call-template name="PopulateLabel">
											<xsl:with-param name="TargetNode" select="$FormData/BankAccountTypeCd"/>
											<xsl:with-param name="DisplayedCheckboxValue" select="1"/>
											<xsl:with-param name="BackupName">IRS1040BankAccountTypeCd[1]</xsl:with-param>
										</xsl:call-template>
										Checking
									</label>
									<input type="checkbox" class="styCkboxNM" style="margin-left:5mm;">
										<xsl:call-template name="PopulateEnumeratedCheckbox">
											<xsl:with-param name="TargetNode" select="$FormData/BankAccountTypeCd"/>
											<xsl:with-param name="DisplayedCheckboxValue" select="'2'"/>
											<xsl:with-param name="BackupName">IRS1040BankAccountTypeCd[2]</xsl:with-param>
										</xsl:call-template>
									</input>
								<label>
									<xsl:call-template name="PopulateLabel">
										<xsl:with-param name="TargetNode" select="$FormData/BankAccountTypeCd"/>
										<xsl:with-param name="DisplayedCheckboxValue" select="'2'"/>
										<xsl:with-param name="BackupName">IRS1040BankAccountTypeCd[2]</xsl:with-param>
									</xsl:call-template>
									Savings
								</label>
							</div>
							<div class="sty1040RightNumBoxNBB" style="background-color:lightgrey;">&nbsp;</div>
							<div class="sty1040AmountBoxNBB">&nbsp;</div>
						</div>
						<!-- Line 35d -->
						<div class="sty1040LN">
							<div class="styLNLeftNumBox">
								<span style="width:14px;"/>d</div>
								<div class="sty1040Desc" style="height:4.4mm;">
									<span style="width:25mm;float:left;clear:none;padding-top:0mm">
									   Account number
									</span>
									<span class="styLNCtrNumBox" style="width:84mm;border-top-width:1px;padding-top:0mm;padding-bottom:0mm;font-weight:normal">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$FormData/DepositorAccountNum"/>
										</xsl:call-template>
									</span>
								</div>
								<div class="sty1040RightNumBoxNBB" style="height:4.4mm;background-color:lightgrey;">&nbsp;</div>
								<div class="sty1040AmountBoxNBB" style="height:4.4mm;">&nbsp;</div>
							</div>
							<!-- Line 36 -->
							<div class="sty1040LN">
								<div class="styLNLeftNumBox">36</div>
								<div class="sty1040Desc" style="width:87mm;">
									<span style="display:inline;font-family:Arial;">Amount of line 34 you want <strong>applied to your 2026 estimated tax </strong></span>
									<span style="float:right">
										<span class="sty1040DotLn" style="float:none;margin-right:-11px;">...</span>
										<span style="width:8px;"/>
									</span>
								</div>
								<div class="sty1040RightNumBoxNBB">36</div>
								<div class="sty1040AmountBoxNBB">
									<span style="float:left;">
										<xsl:call-template name="SetFormLinkInline">
											<xsl:with-param name="TargetNode" select="$FormData/AppliedToEsTaxAmt"/>
										</xsl:call-template>
									</span>
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/AppliedToEsTaxAmt"/>
									</xsl:call-template>
								</div>
								<div class="sty1040RightNumBoxNBB" style="background-color:lightgrey;">&nbsp;</div>
								<div class="sty1040AmountBoxNBB" style="">&nbsp;</div>
							</div>
					   </div>
					<!-- You Owe -->
					<div class="styStdDiv" style="border-top:1px solid black;overflow:visible;">
						<div class="styGenericDiv" style="width:20mm;padding-top:0mm;padding-bottom:1mm;">
							<span style="padding-left:.5mm;font-weight:bold;font-size:9.5pt;padding-bottom:0mm;">Amount<br/>You Owe</span>
							<div style="height:10mm;"></div>		
						</div>
						<!-- Line 37 -->
						<div class="sty1040LN" style="">
							<div class="styLNLeftNumBox" style="height:7mm">37</div>
							<div class="sty1040Desc" style="height:7mm">
								Subtract line 33 from line 24. This is the <strong>amount you owe.</strong><br/>For details on how to pay, go to <span style="font-style:italic;">www.irs.gov/Payments</span> or see instructions
								<span style="float:right">
									<span class="sty1040DotLn" style="float:none;margin-right:-11px;">.......</span>
									<span style="width:8px;"/>
								</span><br/>
							</div>
							<div class="sty1040RightNumBox" style="height:7mm;padding-top:3.5mm">37</div>
							<div class="sty1040AmountBox" style="height:7mm;padding-top:3.5mm">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/OwedAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<!-- Line 38 -->
						<div class="sty1040LN" style="height:4.5mm;">
							<div class="styLNLeftNumBox" style="margin-top:0mm;">38</div>
							<div class="sty1040Desc" style="width:87mm;margin-top:0mm;">
								Estimated tax penalty (see instructions)
								<span style="float:right">
									<span class="sty1040DotLn" style="float:none;margin-right:-11px;">........</span>
									<span style="width:8px;"/>
								</span>
							</div>
							<div class="sty1040RightNumBoxNBB" style="height:4.5mm;margin-top:0mm;">38</div>
							<div class="sty1040AmountBoxNBB" style="height:4.5mm;margin-top:0mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/EsPenaltyAmt"/>
								</xsl:call-template>
							</div>
							<div class="sty1040RightNumBoxNBB" style="height:4.5mm;background-color:lightgrey;">&nbsp;</div>
							<div class="sty1040AmountBoxNBB" style="height:4.5mm;background-color:lightgrey;">&nbsp;</div>
						</div>
					</div>
					<!-- Third Party -->
					<div style="display:block;width:187mm;border-top:1px solid black;">
						<div class="styGenericDiv" style="width:20mm;height:14mm;">
							<span style="font-weight:bold;font-size:8pt;">Third Party Designee</span>
							<br />
						</div>
						<div style="width:167mm;height:7mm;">
							<span style="width:105mm;padding-left:4mm">Do you want to allow another person to discuss this return with the IRS? See <br/>instructions
								<span style="float:right">
									<span class="sty1040DotLn" style="float:none;margin-right:-4px;">....................</span>
									<span style="width:8px;"/>
								</span>
							</span>					  
							<div style="width:62mm;">
								<input type="checkbox" class="styCkbox" style="margin-right:2px;" 
									aria-label="discuss with third party Yes">
									<xsl:call-template name="PopulateYesCheckbox">
										<xsl:with-param name="TargetNode" select="$FormData/ThirdPartyDesigneeInd"/>
										<xsl:with-param name="BackupName">F1040ThirdPartyDesigneeInd</xsl:with-param>
									</xsl:call-template>
								</input>
								<label style="font-weight:bold;">
									<xsl:call-template name="PopulateLabelYes">
										<xsl:with-param name="TargetNode" select="$FormData/ThirdPartyDesigneeInd"/>
										<xsl:with-param name="BackupName">F1040ThirdPartyDesigneeInd</xsl:with-param>
									</xsl:call-template>Yes. </label> <span> Complete below.</span>
							  <span style="width:3mm;"/>									
								<input type="checkbox" class="styCkbox" style="margin-right:2px;"
									aria-label="discuss with third party No">
									<xsl:call-template name="PopulateNoCheckbox">
										<xsl:with-param name="TargetNode" select="$FormData/ThirdPartyDesigneeInd"/>
										<xsl:with-param name="BackupName">F1040ThirdPartyDesigneeInd</xsl:with-param>
									</xsl:call-template>
								</input>
								<label style="font-weight:bold;">
									<xsl:call-template name="PopulateLabelNo">
										<xsl:with-param name="TargetNode" select="$FormData/ThirdPartyDesigneeInd"/>
										<xsl:with-param name="BackupName">F1040ThirdPartyDesigneeInd</xsl:with-param>
									</xsl:call-template>No</label>
							</div>
						</div>
						<div style="width:167mm;height:7mm;">
							<span style="padding-left:4mm;width:70mm;">
								Designee's <br /> name 
								<span style="width:8px;"/>
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$FormData/ThirdPartyDesigneeNm"/>
								</xsl:call-template>
							</span>
							<span style="width:11mm;">
								Phone <br /> no. 
									<span style="width:8px;"/>
							</span>
							<span style="width:26mm;">
								<xsl:call-template name="PopulatePhoneNumber">
									<xsl:with-param name="TargetNode" select="$FormData/ThirdPartyDesigneePhoneNum"/>
								</xsl:call-template>
							</span>
							<span style="width:30mm;">
								Personal identification <br /> number (PIN) 
									<span style="width:8px;"/>
							</span>
							<span style="width:20mm;">
								<xsl:call-template name="PopulatePin">
									<xsl:with-param name="TargetNode" select="$FormData/ThirdPartyDesigneePIN"/>
								</xsl:call-template>
							</span>
						</div>
					</div>
					<!-- Signature block -->
					<div style="display:block;width:187mm;border-top:1px solid black; padding-top:2mm">
						<div class="styGenericDiv" style="width:20mm;height:28mm;">
							<!--<span style="font-weight:bold;font-size:10pt;">Third Party Designee</span>-->
							<span style="font-weight:bold;font-size:10pt;">Sign Here</span>
							<br /><br /><br />
							Joint return? See instructions. Keep a copy for your records.
						</div>
						<div style="padding-top:9.5mm;padding-left:8px;padding-right:0px;float:left;clear:none;width:4mm;margin-left:-2px;margin-right:2px;">
						</div>
						<div style="float:left;clear:none;width:163mm;">
							<div class="" style="width:163mm;font-size:6pt;font-family:Arial;float:left;clear:none;">
								Under penalties of perjury, I declare that I have examined this return and accompanying schedules and statements, and to 
								the best of my knowledge and belief, they are true, correct, and complete. Declaration of preparer (other than taxpayer) is 
								based on all information of which preparer has any knowledge.
							</div>
							<div style="width:163mm;float:left;clear:none;"/>
							<div class="styBB" style="width:163mm;float:left;clear:none;">
								<div style="width:70mm;float:left;clear:none;">
									<div class="styFNBox" style="width:70mm;float:left;clear:none;">
									  Your signature
									</div>
									<div class="styFNBox" style="height:8mm;width:70mm;padding-top:1.5mm;float:left;clear:none;">
										<xsl:call-template name="PopulatePin">
											<xsl:with-param name="TargetNode" select="$RtnHdrData/PrimarySignaturePIN"/>
										</xsl:call-template>
									</div>
								</div>
								<div class="styFNBox" style="width:18mm;float:left;clear:none;">
									<div style="width:16mm;padding-left:2mm;float:left;clear:none;">
										  Date
									</div>
									<div style="height:8mm;width:18mm;padding-top:1.5mm;text-align:center;float:left;clear:none;font-size:7pt;">
										<xsl:call-template name="PopulateMonthDayYear">
											<xsl:with-param name="TargetNode" select="$RtnHdrData/PrimarySignatureDt"/>
										</xsl:call-template>
									</div>
								</div>
								<div class="styFNBox" style="width:36mm;float:left;clear:none;">
									<div style="width:36.8mm;padding-left:2mm;float:left;clear:none;">
									   Your occupation
									</div>
									<div style="height:8mm;width:36mm;padding-top:1.5mm;padding-left:2mm;float:left;clear:none;font-family:Arial;">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$FormData/PrimaryOccupationTxt"/>
										</xsl:call-template>
									</div>
								</div>
								<div class="" style="width:35mm;float:left;clear:none;">
									<div class="styGenericDiv" style="height:11mm;width:38.5mm;border-left-width:0px;font-size:7pt;">
										<span style="width:100%;padding-left:4px;font-family:Arial-Narrow;">
											If the IRS sent you an Identity Protection PIN, enter it here </span>
										<br/>
										<span style="width:40%;padding-left:4px;font-family:Arial-Narrow;float:left;">
											(see inst.)
											<span style="width:8px;"/>
										</span>
										<span style="width:60%;padding-top:0px;padding-right:5mm;float:right;text-align:center;padding-top:0.8mm">
											<div class="styLNCtrNumBox" style="height:3mm;width:23mm;border-top-width:1px;font-weight:normal">
												<xsl:call-template name="PopulatePin">
													<xsl:with-param name="TargetNode" select="$RtnHdrData/IdentityProtectionPIN"/>
												</xsl:call-template>
											</div>
										</span>
									</div>
								</div>
							</div>
							<div class="" style="width:163mm;float:left;clear:none;">
								<div style="width:70mm;float:left;clear:none;">
									<div class="styFNBox" style="width:70mm;float:left;clear:none;font-family:Arial;">
									   Spouse's signature. If a joint return, <span class="styBoldText"> both</span> must sign.
									</div>
									<div class="styFNBox" style="height:9mm;width:70mm;padding-top:1.5mm;float:left;
									    clear:none;">
										<xsl:call-template name="PopulatePin">
											<xsl:with-param name="TargetNode" select="$RtnHdrData/SpouseSignaturePIN"/>
										</xsl:call-template>
									</div>
								</div>
								<div class="styFNBox" style="width:18mm;height:12mm;float:left;clear:none;">
									<div style="width:16mm;padding-left:2mm;float:left;clear:none;">
									  Date
									</div>
									<div style="height:8mm;width:18mm;padding-top:1.5mm;text-align:center;float:left;
									    clear:none;font-size:7pt;">
										<xsl:call-template name="PopulateMonthDayYear">
											<xsl:with-param name="TargetNode" select="$RtnHdrData/SpouseSignatureDt"/>
										</xsl:call-template>
									</div>
								</div>
								<div class="styFNBox" style="width:36mm;height:12mm;float:left;clear:none;">
									<div style="width:36.8mm;padding-left:2mm;float:left;clear:none;">
									   Spouse's occupation
									</div>
									<div style="height:8mm;width:36mm;padding-top:1.5mm;padding-left:2mm;float:left;
										clear:none;font-family:Arial;">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$FormData/SpouseOccupationTxt"/>
										</xsl:call-template>
									</div>
								</div>
								<div class="styGenericDiv" style="height:11mm;width:38.5mm;border-left-width:0px;
									font-size:7pt;">
									<span style="width:100%;padding-left:4px;font-family:Arial-Narrow;">
										If the IRS sent your spouse an Identity Protection PIN, enter it here </span>
									<br/>
									<span style="width:40%;padding-left:4px;font-family:Arial-Narrow;float:left;">
										(see inst.)
										<span style="width:8px;"/>
									</span>
									<span style="width:60%;padding-top:0px;padding-right:5mm;float:right;text-align:center;
										padding-top:0.8mm">
										<div class="styLNCtrNumBox" style="height:3mm;width:23mm;border-top-width:1px;
											font-weight:normal">
											<xsl:call-template name="PopulatePin">
												<xsl:with-param name="TargetNode" select="$RtnHdrData/SpouseIdentityProtectionPIN"/>
											</xsl:call-template>
										</div>
									</span>
								</div>
							</div>
							<div class="" style="width:163mm;float:left;clear:none;border-top:1px solid black;">
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
											border-left:1px solid black;">
									Email address 
									<span style="width:4px;"/> 
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$RtnHdrData/AdditionalFilerInformation/AtSubmissionFilingGrp/EmailAddressTxt"/>
									</xsl:call-template>
								</div>
							</div>
						</div>
					</div>
					<!-- Paid Preparer Use Only -->
					<div class="" style="width:187mm;font-size:7pt;float:none;clear:both;height:auto;
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
							<span style="display:inline;font-size:7pt;">Preparer's name</span><br/>
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$RtnHdrData/PaidPreparerInformationGrp/PreparerPersonNm"/>
							</xsl:call-template>
						</div>
						<div class="styFNBox" style="height:8mm;width:41mm;padding-top:0mm;
							border-right:1 solid black;padding-left:1mm;font-size:7pt;">
							Preparer's signature
						</div>
						<div class="styFNBox" style="height:8mm;width:22mm;padding-top:0mm;padding-left:1mm;
							border-right:1 solid black;">
							<span style="font-size:7pt;">Date</span>
							<br />
							<xsl:call-template name="PopulateReturnHeaderPaidPreparerInformation">
								<xsl:with-param name="TargetNode">DateSigned</xsl:with-param>
							</xsl:call-template>
						</div>
						<div class="styFNBox" style="height:8mm;width:20mm;padding-left:1mm;">
							<span style="font-size:7pt;">PTIN</span>
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
						<div class="styLNDesc" style="height:8mm;width:29mm;padding-top:.5mm;padding-bottom:0mm;
							padding-left:1mm;font-family:Arial;">
							<span style="font-size:7pt;">Check if:</span><br/>
								<input class="styCkbox" type="checkbox" alt="Self Employed Ind">
									<xsl:call-template name="PopulateCheckbox">
										<xsl:with-param name="TargetNode" select="$RtnHdrData/PaidPreparerInformationGrp/SelfEmployedInd"/>
										<xsl:with-param name="BackupName">$RtnHdrDataPaidPreparerInformationSelfEmployed</xsl:with-param>
									</xsl:call-template>
								</input>
								<label>
									<xsl:call-template name="PopulateLabel">
										<xsl:with-param name="TargetNode" select="$RtnHdrData/PaidPreparerInformationGrp/SelfEmployedInd"/>
										<xsl:with-param name="BackupName">$RtnHdrDataPaidPreparerInformationSelfEmployed</xsl:with-param>
									</xsl:call-template>
									<span style="width:4px;"/>Self-employed
								</label>
						</div>
					</div>
					<div style="width:164mm;height:9.5mm;float:left;clear:none;border-style:solid;
						border-color:black;border-width:0px 0px 0px 0px;">
						<div class="styFNBox" style="height:9.5mm;width:124mm;border-right:1px solid black;">
							<span class="styGenericDiv" style="">Firm's name 
							<span style="width:2.2mm;"/>
								<span style="width:4px;"/>
							</span>
							<br/>
							<div class="styGenericDiv" style="padding-right:.5mm;">
								<xsl:call-template name="PopulateReturnHeaderPaidPreparerInformation">
									<xsl:with-param name="TargetNode">BusinessNameLine1Txt</xsl:with-param>
								</xsl:call-template>
								<br/>
								<xsl:call-template name="PopulateReturnHeaderPaidPreparerInformation">
									<xsl:with-param name="TargetNode">BusinessNameLine2Txt</xsl:with-param>
								</xsl:call-template>
							</div>
						</div>
						<div class="styFNBox" style="height:9.5mm;width:40mm;padding-left:1mm;
							border-right:0px solid black;word-break:break-all;"> Phone no. 
							<br/>
 							<xsl:call-template name="PopulateReturnHeaderPaidPreparerInformation">
								<xsl:with-param name="TargetNode">Phone</xsl:with-param>
							</xsl:call-template>
							<xsl:call-template name="PopulateReturnHeaderPaidPreparerInformation">
								<xsl:with-param name="TargetNode">ForeignPhone</xsl:with-param>
							</xsl:call-template>
						</div>
					</div>
					<div class="" style="width:164mm;border-top:1px solid black;;border-right-width:0px;float:left;
						clear:none;">
						<div class="styFNBox" style="width:124mm;min-height:14mm;border-right:1px solid black;">
							<div class="styGenericDiv" style="padding-right:.5mm;">Firm's address 
							</div>
							<br/>
							<div class="styGenericDiv" style="padding-right:.5mm;">
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
							</div>
						</div>
						<div class="styFNBox" style="width:40mm;border-right-width:0px;">
							<div class="styGenericDiv" style="padding-right:.5mm;padding-left:0.5mm;">Firm's EIN 
							</div>
							<br/>
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
					<div class="styStdDiv pageEnd" style="border-top:1px solid black;padding-top:.5mm">
						Go to <span style="font-style:italic">www.irs.gov/Form1040 </span> for instructions and the latest information.
						<span style="float:right;font-size:6.5pt;">Form <strong>1040</strong> (2025)</span>
					</div>
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
							<xsl:with-param name="TargetNode" select="$FormData/CombatZoneCd/@combatZoneDt"/>
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
							<xsl:with-param name="TargetNode" select="$FormData/PowerOfAttorneySignedByInd"/>
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
							<xsl:with-param name="Desc">Filing Status - Non-Resident Alien Literal Code</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$FormData/NRALiteralCd"/>
						</xsl:call-template>
						<xsl:if test="$FormData/QualifyingHOHSSN">
							<tr>
								<td class="styLeftOverTableRowDesc" style="width:100mm;" scope="row">Filing Status - Qualifying HOH SSN:</td>
								<td class="styLeftOverTableRowAmount" style="width:87mm;">
									<xsl:call-template name="PopulateSSN">
										<xsl:with-param name="TargetNode" select="$FormData/QualifyingHOHSSN"/>
									</xsl:call-template>
								</td>                          
							</tr>
						</xsl:if>
						<xsl:if test="$FormData/QualifyingPersonSSN">
							<tr>
								<td class="styLeftOverTableRowDesc" style="width:100mm;" scope="row">Filing Status - Qualifying Person SSN:</td>
								<td class="styLeftOverTableRowAmount" style="width:87mm;">
									<xsl:call-template name="PopulateSSN">
										<xsl:with-param name="TargetNode" select="$FormData/QualifyingPersonSSN"/>
									</xsl:call-template>
								</td>                          
							</tr>
						</xsl:if>
						<xsl:call-template name="PopulateLeftoverRow">
							<xsl:with-param name="Desc">Header - Primary Name Control</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/PrimaryNameControlTxt"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRow">
							<xsl:with-param name="Desc">Header - In Care Of Name</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/InCareOfNm"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRow">
							<xsl:with-param name="Desc">Header - Spouse Name Control</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/SpouseNameControlTxt"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRow">
							<xsl:with-param name="Desc">Standard Deduction - Exempt Spouse Name</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$FormData/ExemptSpouseNm"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRow">
							<xsl:with-param name="Desc">Standard Deduction - Exempt Spouse Name Control</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$FormData/ExemptSpouseNameControlTxt"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRow">
							<xsl:with-param name="Desc">Standard Deduction - Total Exempt Primary And Spouse Cnt</xsl:with-param>
							<xsl:with-param name="TargetNode" 
								select="$FormData/TotalExemptPrimaryAndSpouseCnt"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRow">
							<xsl:with-param name="Desc">Age/Blindness - Total Boxes Checked Count</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$FormData/TotalBoxesCheckedCnt"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRow">
							<xsl:with-param name="Desc">Dependents - Children Who Lived With You Count</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$FormData/ChldWhoLivedWithYouCnt"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRow">
							<xsl:with-param name="Desc">Dependents - Other Dependents Listed Count</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$FormData/OtherDependentsListedCnt"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRow">
							<xsl:with-param name="Desc">Dependents - Total Exemptions Count</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$FormData/TotalExemptionsCnt"/>
						</xsl:call-template>
						<!-- <xsl:if test="($Print != $Separated) or (count($FormData/DependentDetail) &lt;= 4)"> --> 
						<!--this condition removed by request in defect #1253085 -->
							<xsl:for-each select="$FormData/DependentDetail">
								<xsl:call-template name="PopulateLeftoverRow">
									<xsl:with-param name="Desc">Dependent <xsl:number value="position()" format="1"/> Name Control</xsl:with-param>
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
							<xsl:with-param name="TargetNode" select="$FormData/OtherEarnedIncomeAmt/@wagesNotShownLitOnlyCd"/>
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
							<xsl:with-param name="Desc">Line 4(3) - Other IRA Code</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$FormData/OtherIRATypeCd"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRow">
							<xsl:with-param name="Desc">Line 4(3) - Other IRA Text</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$FormData/OtherIRATypeTxt"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRow">
							<xsl:with-param name="Desc">Line 5b - Foreign Employer Pension Cd</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$FormData/ForeignEmployerPensionCd"/>
						</xsl:call-template>	
						<xsl:call-template name="PopulateLeftoverRowAmount">
							<xsl:with-param name="Desc">Line 5b - Taxable Foreign Pensions Total Amount</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$FormData/TaxableForeignPensionsTotalAmt"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRow">
							<xsl:with-param name="Desc">Line 5b - Pensions Annuities Literal Cd</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$FormData/TotalTaxablePensionsAmt/@pensionsAnnuitiesLiteralCd"/>
						</xsl:call-template>	
						<xsl:call-template name="PopulateLeftoverRow">
							<xsl:with-param name="Desc">Line 5(3) - Other Pension Code</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$FormData/PensionsAnnuitiesOtherTypeCd"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRow">
							<xsl:with-param name="Desc">Line 5(3) - Other Pension Text</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$FormData/PensionsAnnuitiesOtherTypeTxt"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRow">
							<xsl:with-param name="Desc">Line 6a - Social Security Benefits Code</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$FormData/SocSecBnftAmt/@socSecBnftCd"/>
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
							<xsl:with-param name="TargetNode" select="$FormData/ExcldSect933PuertoRicoIncmAmt/@excldSect933PuertoRicoIncmCd"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRowAmount">
							<xsl:with-param name="Desc">Line 11 - Excluded Sect 933 Puerto Rico Income Amount</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$FormData/ExcldSect933PuertoRicoIncmAmt"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRow">
							<xsl:with-param name="Desc">Line 12 - Modified Standard Deduction Ind</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$FormData/TotalItemizedOrStandardDedAmt/@modifiedStandardDeductionInd"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRow">
							<xsl:with-param name="Desc">Line 15 - Capital Construction Fund Code</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$FormData/TaxableIncomeAmt/@capitalConstructionFundCd"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRowAmount">
							<xsl:with-param name="Desc">Line 15 - Capital Construction Fund Amount</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$FormData/TaxableIncomeAmt/@capitalConstructionFundAmt"/>
						</xsl:call-template>	
						<xsl:call-template name="PopulateLeftoverRow">
							<xsl:with-param name="Desc">Line 15 - Schedule Q Code</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$FormData/ScheduleQCd"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRowAmount">
							<xsl:with-param name="Desc">Line 16(1) - Child Interest and Dividend Tax Amount</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$FormData/Form8814Ind/@childInterestAndDividendTaxAmt"/>
						</xsl:call-template>
						<!-- OtherTaxAmtGrp separate repeating -->
						<xsl:if test="count($FormData/OtherTaxAmtGrp) &lt; 2">
										<xsl:choose>
										<xsl:when test="$FormData/OtherTaxAmtGrp/OtherTaxAmtCd != ''">											
							<xsl:call-template name="PopulateLeftoverRow">
								<xsl:with-param name="Desc">Line 16(3) - Other Tax Amount Code</xsl:with-param>
								<xsl:with-param name="TargetNode" select="$FormData/OtherTaxAmtGrp/OtherTaxAmtCd"/>
							</xsl:call-template>
										</xsl:when>
										<xsl:otherwise>
							<xsl:call-template name="PopulateLeftoverRow">
								<xsl:with-param name="Desc">Line 16(3) - Other Tax Amount Code</xsl:with-param>
								<xsl:with-param name="TargetNode" select="$FormData/OtherTaxAmtGrp/OtherTaxTxt"/>
							</xsl:call-template>
										</xsl:otherwise>
										</xsl:choose>							

							<xsl:call-template name="PopulateLeftoverRowAmount">
								<xsl:with-param name="Desc">Line 16(3) - Other Tax Amount</xsl:with-param>
								<xsl:with-param name="TargetNode" select="$FormData/OtherTaxAmtGrp/OtherTaxAmt"/>
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
										<xsl:with-param name="TargetNode" 
										select="$FormData/EstimatedTaxPaymentsAmt/@divorcedSpouseSSN"/>
									</xsl:call-template>
								</td>                          
							</tr>
						</xsl:if>
						<xsl:call-template name="PopulateLeftoverRow">
							<xsl:with-param name="Desc">Line 26 - Divorced Literal Cd</xsl:with-param>
							<xsl:with-param name="TargetNode" 
								select="$FormData/EstimatedTaxPaymentsAmt/@divorcedLiteralCd"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRow">
							<xsl:with-param name="Desc">Line 27a - Earned Income Credit Eligibility Literal Code</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$FormData/EICEligibilityLiteralCd"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRow">
							<xsl:with-param name="Desc">Line 28 - Additional Child Tax Credit Opt Out Indicator</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$FormData/@pensionsAnnuitiesLiteralCd"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRow">
							<xsl:with-param name="Desc">Line 33 - Form 8689 Code</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$FormData/TotalPaymentsAmt/@form8689Cd"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRowAmount">
							<xsl:with-param name="Desc">Line 33 - Form 8689 Amount</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$FormData/TotalPaymentsAmt/@form8689Amt"/>
						</xsl:call-template>
					</table>
					<!-- Special Condition Descriptions -->
					<xsl:if test="count($FormData/SpecialConditionDesc) &gt; 1">
						<span class="styRepeatingDataTitle" style="padding-top:5mm;">Top Right Margin - Special Condition Description</span>
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
													<span class="styBoldText" style="float:right;text-align:right;padding-right:2mm;">
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
						<span class="styRepeatingDataTitle" style="padding-top:5mm;">Top Right Margin - Refund Product Code</span>
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
													<span class="styBoldText" style="float:right;text-align:right;padding-right:2mm;">
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
					<span class="styRepeatingDataTitle">Form 1040 - Dependents (see instructions):</span>
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
												<xsl:with-param name="BackupName">IRS1040DependentInformation<xsl:number value="position()"/>YesLiveWithChildOverHalfYrInd</xsl:with-param>
											</xsl:call-template>
											<xsl:attribute name="aria-label">Live With Child <xsl:number value="position()"/> Over Half Year Yes</xsl:attribute>
											Yes
										</input>
										<br/>
										<div style="width:100%;border-bottom:1px solid black;padding-bottom:0.5mm;"/>
										 <input type="checkbox" class="styCkbox">
														<xsl:attribute name="aria-label">Child <xsl:value-of select="position()"/> Lived in the US"</xsl:attribute>
														<xsl:call-template name="PopulateCheckbox">
														  <xsl:with-param name="TargetNode" select="YesLiveWithChldUSOvrHalfYrInd"/>
														  <xsl:with-param name="BackupName">IRS1040CTCInd</xsl:with-param>
														</xsl:call-template>
														And in the U.S.
										</input>
									</td>
									<td class="styTableCellCtrInherit">
										<input type="Checkbox" class="styCkbox">
											<xsl:call-template name="PopulateCheckbox">
												<xsl:with-param name="TargetNode" select="ChildIsAStudentUnder24Ind"/>
												<xsl:with-param name="BackupName">IRS1040DependentInformation<xsl:number value="position()"/>ChildIsAStudentUnder24Ind</xsl:with-param>
											</xsl:call-template>
											<xsl:attribute name="aria-label">Dependent <xsl:number value="position()"/> is a student under 24 Indicator</xsl:attribute>
										</input>
										<br/>
										Full-time student
										<div style="width:100%;border-bottom:1px solid black;padding-bottom:0.5mm;"/>
										<input type="Checkbox" class="styCkbox" style="margin-left:1mm;border-left:1px solid black;">
											<xsl:call-template name="PopulateCheckbox">
												<xsl:with-param name="TargetNode" select="ChildPermanentlyDisabledInd"/>
												<xsl:with-param name="BackupName">IRS1040DependentInformation<xsl:number value="position()"/>ChildPermanentlyDisabledInd</xsl:with-param>
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
												<xsl:with-param name="BackupName">IRS1040DependentInformation<xsl:number value="position()"/>EligibleForODCInd</xsl:with-param>
											</xsl:call-template>
											<xsl:attribute name="aria-label">Dependent <xsl:number value="position()"/> Eligible for ODC Indicator</xsl:attribute>
										</input>
										<br/>
										Child tax credit
										<div style="width:100%;border-bottom:1px solid black;padding-bottom:0.5mm;"/>
										<input type="Checkbox" class="styCkbox" style="margin-left:1mm;border-left:1px solid black;">
											<xsl:call-template name="PopulateCheckbox">
												<xsl:with-param name="TargetNode" select="EligibleForODCInd"/>
												<xsl:with-param name="BackupName">IRS1040DependentInformation<xsl:number value="position()"/>EligibleForODCInd</xsl:with-param>
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
						<span class="styRepeatingDataTitle" style="padding-top:5mm;">Line 4b - IRA Distributions Literal Code</span>
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
													<span class="styBoldText" style="float:right;text-align:right;padding-right:2mm;">
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
										Other Tax Amount
									</th>
								</tr>
							</thead>
							<tbody>
								<xsl:for-each select="$FormData/OtherTaxAmtGrp">
									<tr style="border-color:black;height:6mm;">
										<xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
										<td class="styTableCellTextInherit">
										<xsl:choose>
										<xsl:when test="OtherTaxAmtCd">											
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="OtherTaxAmtCd"/>
											</xsl:call-template>
										</xsl:when>
										<xsl:otherwise>
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="OtherTaxTxt"/>
											</xsl:call-template>
										</xsl:otherwise>
										</xsl:choose>	
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
