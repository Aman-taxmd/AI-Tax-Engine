<?xml version="1.0" encoding="UTF-8"?>
<!-- Last Modified by Emanesse Fleurancy on 11/05/2025 -->
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
	<xsl:include href="IRS1040NRStyle.xsl" />
	<xsl:output method="html" indent="yes" />
	<xsl:strip-space elements="*" />
	<xsl:param name="FormData" select="$RtnDoc/IRS1040NR" />
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
				<meta name="Description" content="IRS Form 1040NR" />
				<script language="JavaScript" src="{$ScriptPath}/FormDisplay.js" type="text/javascript" />
				<xsl:call-template name="InitJS" />
				<style type="text/css">
					<xsl:if test="not($Print) or $Print=''">
						<xsl:call-template name="IRS1040NRStyle" />
						<xsl:call-template name="AddOnStyle" />
					</xsl:if>
				</style>
				<xsl:call-template name="GlobalStylesForm" />
			</head>
			<body class="styBodyClass">
				<form id="Form1040NR">
					<xsl:if test="$FormData/AmendedReturnInd='X'"><span style="padding-right:10mm; color:red; font-size:10pt;font-weight:bold;"> AMENDED RETURN </span></xsl:if>
				    <xsl:if test="$FormData/SupersededReturnInd='X'"><span style="padding-right:10mm; color:red; font-size:10pt;font-weight:bold;"> SUPERSEDED</span></xsl:if>
				    <xsl:if test="$FormData/AddressChangeInd='X'"><span style="color:red; font-size:10pt;font-weight:bold;"> ADDRESS CHANGE </span></xsl:if>
					<xsl:call-template name="DocumentHeader" />
					<!-- Header -->		
					<div class="styStdDiv">
						<div class="styGenericDiv" style="width:34.8mm;height:42px;padding-top:4px;">
							<span style="margin-top:3.5mm;margin-left:-1mm;margin-right:-1mm;
								transform:rotate(270deg);float:left;">Form</span>
							<span class="styFormNumber" style="margin-top:1mm;">	1040-NR</span>
						</div>
						<div class="styGenericDiv" style="width:73mm;padding-right:.5mm;padding-top:6px;
							height:42px;">
							<span class="styAgency">Department of the Treasury&#8212;Internal Revenue
							Service</span>
							<br/>
							<span class="styMainTitle" style="font-family:Arial-Narrow;font-size:11pt">
								U.S. Nonresident Alien Income Tax Return</span>
						</div>
						<div class="styTYBox" style="width:17mm;border-right-width:1px;height:42px;
							padding-top:4px;">
							<span class="styTaxYear" style="font-size:21pt;">20<span class="styTYColor">25</span></span>
						</div>
						<div class="styOMB" style="width:27mm;height:42px;padding:25px .5mm 1mm .5mm;
							float:left;border-width:0px 1px 0px 0px;vertical-align:bottom;">OMB No. 1545-0074
						</div>
						<div class="styGenericDiv" style="width:34mm;height:42px;font-family:Arial-Narrow;
							font-size:6.5pt;padding:3px 0px 1mm 1mm;vertical-align:bottom;">
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$FormData"/>
							</xsl:call-template>
							<xsl:call-template name="LinkToLeftoverDataTableInline">
								<xsl:with-param name="Desc">Top Right Margin - Special Condition Description	</xsl:with-param>
								<xsl:with-param name="TargetNode" select="$FormData/SpecialConditionDesc"/>
							</xsl:call-template>
							<!--<xsl:call-template name="LinkToLeftoverDataTableInline">
								<xsl:with-param name="Desc">Top Right Margin - Primary Date Of Death</xsl:with-param>
								<xsl:with-param name="TargetNode" select="$FormData/PrimaryDeathDt"/>
							</xsl:call-template>
							<xsl:call-template name="LinkToLeftoverDataTableInline">
								<xsl:with-param name="Desc">Top Right Margin - Spouse Date Of Death</xsl:with-param>
								<xsl:with-param name="TargetNode" select="$FormData/SpouseDeathDt"/>
							</xsl:call-template>-->
							<xsl:call-template name="LinkToLeftoverDataTableInline">
								<xsl:with-param name="Desc">Top Right Margin - Special Processing Literal Code	</xsl:with-param>
								<xsl:with-param name="TargetNode" 
								select="$FormData/SpecialProcessingLiteralCd"/>
							</xsl:call-template>
							<xsl:call-template name="LinkToLeftoverDataTableInline">
								<xsl:with-param name="Desc">Top Right Margin - Combat Zone Code</xsl:with-param>
								<xsl:with-param name="TargetNode" select="$FormData/CombatZoneCd"/>
							</xsl:call-template>
							<xsl:call-template name="LinkToLeftoverDataTableInline">
								<xsl:with-param name="Desc">Top Right Margin - Combat Zone Date</xsl:with-param>
								<xsl:with-param name="TargetNode" 
								select="$FormData/CombatZoneCd/@combatZoneDt"/>
							</xsl:call-template>
							<xsl:call-template name="LinkToLeftoverDataTableInline">
								<xsl:with-param name="Desc">Top Right Margin - Special Processing Code Text</xsl:with-param>
								<xsl:with-param name="TargetNode" 
								select="$FormData/SpecialProcessingCodeTxt"/>
							</xsl:call-template>
							<xsl:call-template name="LinkToLeftoverCheckboxDataTableInline">
								<xsl:with-param name="Desc">Top Right Margin - Community Property Return Indicator</xsl:with-param>
								<xsl:with-param name="TargetNode" 
								select="$FormData/CommPropStateRtnInd"/>
							</xsl:call-template>
							<xsl:call-template name="LinkToLeftoverCheckboxDataTableInline">
								<xsl:with-param name="Desc">Top Right Margin - Signed by Power Of Attorney Checkbox</xsl:with-param>
								<xsl:with-param name="TargetNode" 
								select="$FormData/PowerOfAttorneySignedByInd"/>
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
								<xsl:with-param name="TargetNode" 
								select="$FormData/PersonalRepresentativeInd"/>
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
							</xsl:call-template><br/>
							&nbsp;IRS Use Only&#8212;Do not write or staple in this space.
						</div>
					</div>
					<!-- For the year section -->
					<div class="styStdDiv" style="height:6mm;  border-top:1px solid black; ">
						<div style="padding-top:1mm;">	
						For the year Jan. 1–Dec. 31, 2025, or other tax year beginning 
						<span style="width:25mm;padding-left:3px;text-align:center;">
							<xsl:call-template name="PopulateReturnHeaderTaxPeriodBeginDate"/>
						</span>
						, ending
						<span style="width:25mm;padding-left:3px;text-align:center;">
							<xsl:call-template name="PopulateReturnHeaderTaxPeriodEndDate"/>
						</span>.
						</div>
						<div style="height:100%; float:right; padding-top:1mm; padding-left:2mm; border-left: 1px solid black;">  
						See separate instructions.
						</div>
					</div>
					<!-- Begin Sub header -->
					<div class="styBB" style="width:187mm;">
            <div class="styIRS1040SSPRCleanDiv" style="width:52mm;height:5mm;">
              <div class="styIRS1040SSPRLNDesc" style="width:100%;height:100%;font-size:7pt;padding:0mm 0mm 0mm 1mm;">
                <input type="checkbox" aria-label="pursuant to 301.9100-2" class="styCkbox" style="margin:.5mm 0mm;">
                  <xsl:call-template name="PopulateCheckbox">
                    <xsl:with-param name="TargetNode" select="$FormData/FiledPursuantToSect30191002Ind"/>
                    <xsl:with-param name="BackupName">Form1040NRDataFiledPursuantToSect30191002Ind</xsl:with-param>
                  </xsl:call-template>
                </input>
                <span style="width:.25mm;"/>
                Filed pursuant to section 301.9100-2
              </div>
            </div>
            <div class="styIRS1040SSPRCleanDiv" style="width:60mm;height:5mm;">
              <div class="styIRS1040SSPRLNDesc" style="width:100%;height:100%;font-size:7pt;padding:0mm 0mm 0mm 1mm;">
                <input type="checkbox" aria-label="combat zone" class="styCkbox" style="margin:.5mm 0mm;">
                  <xsl:call-template name="PopulateCheckbox">
                    <xsl:with-param name="TargetNode" select="$FormData/CombatZoneInd"/>
                    <xsl:with-param name="BackupName">Form1040NRDataCombatZoneInd</xsl:with-param>
                  </xsl:call-template>
                </input>
                <span style="width:.25mm;"/>
                Combat Zone
                <xsl:call-template name="LinkToLeftoverDataTableInline">
                  <xsl:with-param name="Desc">Combat Zone Text</xsl:with-param>
                  <xsl:with-param name="TargetNode" 
                    select="$FormData/CombatZoneTxt"/>
                </xsl:call-template>
              </div>
            </div>
            <div class="styIRS1040SSPRCleanDiv" style="width:35mm;height:5mm;">
              <div class="styIRS1040SSPRLNDesc" style="width:50%;height:100%;font-size:7pt;padding:0mm 0mm 0mm 1mm;">
                <input type="checkbox" aria-label="deceased" class="styCkbox" style="margin:.5mm 0mm;">
                  <xsl:call-template name="PopulateCheckbox">
                    <xsl:with-param name="TargetNode" select="$FormData/DeceasedInd"/>
                    <xsl:with-param name="BackupName">Form1040NRDeceasedInd</xsl:with-param>
                  </xsl:call-template>
                </input>
                <span style="width:.25mm;"/>
                Deceased
              </div> 
              <div class="styIRS1040SSPRLNDesc" style="width:47%;height:100%;font-size:7pt;padding:1mm 0mm 0mm 1mm;">
                <xsl:if test="$FormData/PrimaryDeathDt != '' ">
                  <xsl:value-of select="$FormData/PrimaryDeathDt"/>
                </xsl:if>
              </div>
            </div>
            <div class="styIRS1040SSPRCleanDiv" style="width:35mm;height:5mm;">
              <div class="styIRS1040SSPRLNDesc" style="width:50%;height:100%;font-size:7pt;padding:1mm 0mm 0mm 1mm;">
              Spouse
              </div>
              <div class="styIRS1040SSPRLNDesc" style="width:47%;height:100%;font-size:7pt;padding:1mm 0mm 0mm 1mm;">
                <xsl:if test="$FormData/SpouseDeathDt != '' ">
                  <xsl:value-of select="$FormData/SpouseDeathDt"/>
                </xsl:if>
              </div>
            </div>
            <div class="styBB" style="width:187mm;"/>
            <div class="styIRS1040SSPRCleanDiv" style="width:33%;height:5mm;border-style:dotted;border-width:0px 1px 0px 0px;">
              <div class="styIRS1040SSPRLNDesc" style="width:24%;height:100%;font-size:7pt;padding:0mm 0mm 0mm 1mm;">
                <input type="checkbox" aria-label="other" class="styCkbox" style="margin:.5mm 0mm;">
                  <xsl:call-template name="PopulateCheckbox">
                    <xsl:with-param name="TargetNode" select="$FormData/DeceasedInd"/>
                    <xsl:with-param name="BackupName">Form1040NRDataDeceasedInd</xsl:with-param>
                  </xsl:call-template>
                </input>
                <span style="width:.25mm;"/>
                Other
              </div>
              <div class="styIRS1040SSPRLNDesc" style="text-align:center;width:74%;height:100%;font-size:7pt;padding:1mm 0mm 0mm 1mm;">
                <xsl:if test="$FormData/SpecialConditionTxt[1] != ''">
                  <xsl:call-template name="PopulateText">
                    <xsl:with-param name="TargetNode" select="$FormData/SpecialConditionTxt[1]"/>
                  </xsl:call-template>
                </xsl:if>
              </div>
            </div>
            <!-- padding div with boundary line -->
            <div class="styIRS1040SSPRCleanDiv" style="text-align:center;width:33%;height:5mm;font-size:7pt;padding:1mm 0mm 0mm 1mm;border-style:dotted;border-width:0px 1px 0px 0px;;">
              <xsl:if test="$FormData/SpecialConditionTxt[2] != ''">
                <span>
                  <xsl:call-template name="PopulateText">
                    <xsl:with-param name="TargetNode" select="$FormData/SpecialConditionTxt[2]"/>
                  </xsl:call-template>
                </span>
              </xsl:if>
            </div>
            <!-- padding div with boundary line -->
            <div class="styIRS1040SSPRCleanDiv" style="text-align:center;width:33%;height:5mm;font-size:7pt;padding:1mm 0mm 0mm 1mm;">
              <xsl:if test="$FormData/SpecialConditionTxt[3] != ''">
                <span>
                  <xsl:call-template name="PopulateText">
                    <xsl:with-param name="TargetNode" select="$FormData/SpecialConditionTxt[3]"/>
                  </xsl:call-template>
                </span>
              </xsl:if>
            </div>
          </div>  
					<!-- End Sub header -->
					<!-- Filer information section -->
					<div class="styStdDiv" style="border-top:1px solid black;">
						<div class="styIRS1040NRHeaderCell" style="width:78mm;height:12mm">
							Your first name and middle initial <br />
							<xsl:call-template name="PopulateReturnHeaderFiler">
								<xsl:with-param name="TargetNode">NameLine1Txt</xsl:with-param>
							</xsl:call-template>
							<span style="width:4px;"/>
							<xsl:call-template name="LinkToLeftoverDataTableInline">
								<xsl:with-param name="Desc">Header - Primary Name Control</xsl:with-param>
								<xsl:with-param name="TargetNode" 
									select="$RtnHdrData/Filer/PrimaryNameControlTxt"/>
							</xsl:call-template>
							<xsl:call-template name="LinkToLeftoverDataTableInline">
								<xsl:with-param name="Desc">Header - In Care Of Name</xsl:with-param>
								<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/InCareOfNm"/>
							</xsl:call-template>
						</div>
						<div class="styIRS1040NRHeaderCell" style="width:63mm;height:12mm">
							Last name <br /> &nbsp;
						</div>
						<div class="styIRS1040NRHeaderCell" style="width:46mm;height:12mm;
							border-right-width:0px;padding-left:1mm;">
							<strong>Your identifying number</strong><br />
								(see instructions)<br/>
							<xsl:call-template name="PopulateReturnHeaderFilerTIN">
								<xsl:with-param name="EINChanged" select="true()"/>
							</xsl:call-template>
						</div>
					</div>
					<div class="styStdDiv">
						<div class="styIRS1040NRHeaderCell" style="width:162mm;height:10.5mm;">
							<span style="font-family:Arial;">Home address (number and street).
								If you have a P.O. box, see instructions.</span> <br /> 
							<xsl:call-template name="PopulateReturnHeaderFiler">
								<xsl:with-param name="TargetNode">AddressLine1Txt</xsl:with-param>
							</xsl:call-template>
							<br/>
							<xsl:call-template name="PopulateReturnHeaderFiler">
								<xsl:with-param name="TargetNode">AddressLine2Txt</xsl:with-param>
							</xsl:call-template>
							&nbsp;
						</div>
						<div class="styIRS1040NRHeaderCell" style="width:25mm;border-right:0px;height:10.5mm;font-family:Arial;">Apt. no. <br /> &nbsp;</div>						
						<div class="styIRS1040NRHeaderCell"
							style="width:187mm;border-right:0px">
							<div class="styIRS1040NRHeaderCell" style="font-family:Arial;	width:125mm;padding-left:0px">City, town, or post office. If you have a foreign address,
								also complete spaces below.<br />
								<xsl:if test="$RtnHdrData/Filer/USAddress">
									<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" 
									select="$RtnHdrData/Filer/USAddress/CityNm">
									</xsl:with-param>
								</xsl:call-template>
								<!--<xsl:call-template name="PopulateReturnHeaderFiler">
										<xsl:with-param name="TargetNode">CityStateInfo</xsl:with-param>
									</xsl:call-template>-->
								</xsl:if>
								<xsl:if test="$RtnHdrData/Filer/ForeignAddress">
									<xsl:call-template name="PopulateReturnHeaderFiler">
										<xsl:with-param name="TargetNode">CityNm</xsl:with-param>
									</xsl:call-template>
								</xsl:if>
							</div>
							<div class="styIRS1040NRHeaderCell" style="font-family:Arial;width:25mm;">State
								<br/>
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" 
										select="$RtnHdrData/Filer/USAddress/StateAbbreviationCd">
									</xsl:with-param>
								</xsl:call-template>
							</div>
							<div class="styIRS1040NRHeaderCell" style="font-family:Arial;width:24mm;border-right-width:0px">ZIP code
								<br/>
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" 
										select="$RtnHdrData/Filer/USAddress/ZIPCd">
									</xsl:with-param>
								</xsl:call-template>
							</div>
						</div>
						<div class="styIRS1040NRHeaderCell" style="width:78mm;height:10.5mm;">
							<span style="font-family:Arial;">Foreign country name</span>
							<br /> 
							<xsl:call-template name="PopulateReturnHeaderFiler">
								<xsl:with-param name="TargetNode">CountryCd</xsl:with-param>
								<xsl:with-param name="MainForm" select="true()"/>
							</xsl:call-template>
							&nbsp;
						</div>
						<div class="styIRS1040NRHeaderCell" style="width:48mm;height:10.5mm;">
							<span style="font-family:Arial;">Foreign province/state/county</span> <br /> 
							<xsl:call-template name="PopulateReturnHeaderFiler">
								<xsl:with-param name="TargetNode">ProvinceOrStateNm</xsl:with-param>
							</xsl:call-template>
							&nbsp;
						</div>
						<div class="styIRS1040NRHeaderCell" style="width:60.06mm;height:10.5mm;
							font-family:Arial;border-right:0px">
							<span style="font-family:Arial;">Foreign postal code</span> <br /> 
							<xsl:call-template name="PopulateReturnHeaderFiler">
								<xsl:with-param name="TargetNode">ForeignPostalCd</xsl:with-param>
							</xsl:call-template>
							&nbsp;
						</div>
					</div>
					<!-- Filing status section -->
					<div class="styStdDiv" style="border-bottom:1px solid black;">
						<div class="styIRS1040NRHeaderCell" style="width:21mm;height:15mm;
							padding-top:.3mm;float:left;border-width:0px 1px 0px 0px;	font-size:7pt;">
							<span style="font-weight:bold;margin-top:1px;">Filing<br/> Status</span><br />
							<span style="padding-top:0.5mm;">Check only <br />one box.</span>
						</div>
						<div style="width:166mm;min-height:15mm;padding-top:1.0mm;
							padding-left:2mm;float:left;">
							<span style="display:inline;font-family:Arial;font-size:9pt">
								<xsl:call-template name="PopulateSpan">
									<xsl:with-param name="TargetNode" 
									select="$FormData/IndividualReturnFilingStatusCd"/>
								</xsl:call-template>
								<input type="checkbox" class="styCkboxNM" style="margin-right:1mm;
									margin-bottom:1.5mm;" aria-label="Individual Return Filing Status Cd Single">
									<xsl:call-template name="PopulateEnumeratedCheckbox">
										<xsl:with-param name="TargetNode" 
										select="$FormData/IndividualReturnFilingStatusCd"/>
										<xsl:with-param name="DisplayedCheckboxValue" select="1"/>
										<xsl:with-param name="BackupName">
										IRS1040NRIndividualReturnFilingStatusCd[1]</xsl:with-param>
									</xsl:call-template>
								</input>Single
								<span style="width:3mm;"/>
								<input type="checkbox" class="styCkboxNM" style="margin-right:1mm;"
									aria-label="Married Filing Separately">
									<xsl:call-template name="PopulateEnumeratedCheckbox">
										<xsl:with-param name="TargetNode"
										select="$FormData/IndividualReturnFilingStatusCd"/>
										<xsl:with-param name="DisplayedCheckboxValue" select="3"/>
										<xsl:with-param name="BackupName">
										IRS1040NRIndividualReturnFilingStatusCd[3]</xsl:with-param>
									</xsl:call-template>
								</input>Married filing separately (MFS)
								<span style="width:3mm;"/>
								<input type="checkbox" class="styCkboxNM" style="margin-right:1mm;"
									aria-label="Qualifying surviving spouse (QSS)">
									<xsl:call-template name="PopulateEnumeratedCheckbox">
										<xsl:with-param name="TargetNode" 
										select="$FormData/IndividualReturnFilingStatusCd"/>
										<xsl:with-param name="DisplayedCheckboxValue" select="5"/>
										<xsl:with-param name="BackupName">
										IRS1040NRIndividualReturnFilingStatusCd[5]</xsl:with-param>
									</xsl:call-template>
								</input>Qualifying surviving spouse (QSS)
								<span style="width:3mm;"/>
								<input type="checkbox" class="styCkboxNM" style="margin-right:1mm;"
									aria-label="Estate Ind">
									<xsl:call-template name="PopulateCheckbox">
										<xsl:with-param name="TargetNode" 
										select="$FormData/EstateOrTrustInd"/>
										<xsl:with-param name="BackupName">IRS1040NR/EstateOrTrustInd
										</xsl:with-param>
									</xsl:call-template>
								</input>Estate
								<span style="width:3mm;"/>
								<input type="checkbox" class="styCkboxNM" style="margin-right:1mm;"
									aria-label="Trust Ind">
									<!--<xsl:call-template name="PopulateEnumeratedCheckbox">
										<xsl:with-param name="TargetNode" 
										select="$FormData/IndividualReturnFilingStatusCd"/>
										<xsl:with-param name="DisplayedCheckboxValue" select="5"/>
										<xsl:with-param name="BackupName">
										IRS1040NRIndividualReturnFilingStatusCd[5]</xsl:with-param>
									</xsl:call-template>-->
								</input>Trust
									<span style="width:3mm"/>	
									<xsl:call-template name="LinkToLeftoverDataTableInline">
										<xsl:with-param name="Desc">Filing Status - Protective Return Ind</xsl:with-param>
										<xsl:with-param name="TargetNode" select="$FormData/ProtectiveReturnInd"/>
									</xsl:call-template>	
							</span>
							
							<!--<span style="width:0mm;"/>-->
							<span style="font-size:7pt">
								If you checked the QSS box, enter the child's name if the 
								<br/>qualifying person is a	child but not your dependent: 
								<span style="width:97mm;border-bottom:dotted 1px;padding-left:0mm;">
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
									<xsl:if test="$FormData/QualifyingHOHNm or $FormData/QualifyingHOHSSN">
										<span style="width:8px;"/></xsl:if>
									<xsl:if test="$FormData/QualifyingPersonName">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" 
												select="$FormData/QualifyingPersonName/PersonFirstNm"/>
										</xsl:call-template>
										<span style="width:4px;"/>
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" 
												select="$FormData/QualifyingPersonName/PersonLastNm"/>
										</xsl:call-template>
									</xsl:if>
									<xsl:call-template name="LinkToLeftoverDataTableInline">
										<xsl:with-param name="Desc">Filing Status - Qualifying Person SSN</xsl:with-param>
										<xsl:with-param name="TargetNode" 
											select="$FormData/QualifyingPersonSSN"/>
									</xsl:call-template>
								</span>
							</span>
						</div>
					</div>
					<!-- Digital Assets section -->
					<div class="styStdDiv">
					    <div style="width:21mm; height:8mm;padding-top:0.5mm;padding-left:1mm;float:left; border-right:1px solid black;border-bottom:1px solid black; ">
							<strong>Digital<br/>Assets</strong>
						</div>
						<div class="styIRS1040NRHeaderCell" style="width:166mm;height:8mm;border-right-width:0mm; float:left;">
						At any time during 2025, did you: (a) receive (as a reward, award, or payment for property or services); or (b) sell, exchange,<br/>or otherwise dispose of a digital asset (or a financial interest in a digital asset)? (See instructions.)
						<span class="sty1040NRDotLn" style="float:none;">....</span>
							<span style="font-family:Arial Narrow;font-size:8pt;padding-top:2px">
								<xsl:call-template name="PopulateSpan">
									<xsl:with-param name="TargetNode" select="$FormData/VirtualCurAcquiredDurTYInd"/>
								</xsl:call-template>
								<input type="checkbox" class="styCkboxNM" 
									style="margin-left:5mm;margin-top:0mm" aria-label="financial digital asset Yes">
									<xsl:call-template name="PopulateYesCheckbox">
									 <xsl:with-param name="TargetNode" 
										select="$FormData/VirtualCurAcquiredDurTYInd"/>
									 <xsl:with-param name="BackupName"
										select="IRS1040NRVirtualCurAcquiredDurTYInd"/>
									</xsl:call-template>
								</input>
								<span style="width:4px;"/>

									<b>Yes</b>
								
								<span style="width:10px;"/>
								<input type="checkbox" class="styCkboxNM"
									aria-label="financial digital asset No">
									<xsl:call-template name="PopulateNoCheckbox">
									 <xsl:with-param name="TargetNode" 
										select="$FormData/VirtualCurAcquiredDurTYInd"/>
									 <xsl:with-param name="BackupName"
										select="IRS1040NRVirtualCurAcquiredDurTYInd"/>
									</xsl:call-template>
								</input>
								<span style="width:4px;"/>
								<b>No</b>
							</span>
						</div>
					</div>
					
					<!-- Dependents area -->
					<div class="sty1040NRDepdContainer" style="display:block; overflow:visible; height:163.2px;">
						<div class="styGenericDiv" style="width:21mm;padding-top:1mm;
							font-family:Arial;font-size:9pt;border-bottom:0px solid black;border-right:1px solid black;height:inherit;">
							<div style="width:100%;padding-bottom:3mm;padding-left:1mm;">
								<strong>Dependents</strong><br />
								<span style="font-size:8pt;font-family:Arial Narrow">(see instructions):
									<br/><br/>If more than four dependents, see instructions and check here
						    		<span style="width:2px"/>
									<input type="checkbox" class="styCkboxNM" aria-label="more than four dependent">
										<xsl:call-template name="PopulateCheckbox">
											<xsl:with-param name="TargetNode" select="$FormData/MoreDependentsInd"/>
											<xsl:with-param name="BackupName">IRS1040NRMoreDependentsInd
											</xsl:with-param>
									   </xsl:call-template>
									</input>
								</span>
							</div>
						</div>
						<div class="sty1040NRDepdContainer2" style="width:166mm; overflow-y:auto" id="depdContainerId">
						  <!--<xsl:call-template name="SetInitialState"/>-->
						  <xsl:variable name="DependentCount" select="count($FormData/DependentDetail)" />
						  <table class="styTable" style="width:100%;display:table;border-width-top:1px;" cellspacing="0">
									<thead>
                    <tr>
                      <td class="styTableCellHeader" scope="colgroup" style="width:13%;border:solid black;border-width:0px 0px 1px 0px;"></td>
                      <th class="sty1040NRTableCellBoldBorder" scope="colgroup" style="width:21.5%;text-align:center;"><strong>Dependent 1</strong></th>
                      <th class="sty1040NRTableCellBoldBorder" scope="colgroup" style="width:21.5%;text-align:center;"><strong>Dependent 2</strong></th>
                      <th class="sty1040NRTableCellBoldBorder" scope="colgroup" style="width:21.5%;text-align:center;"><strong>Dependent 3</strong></th>
                      <th class="sty1040NRTableCellBoldBorder" scope="colgroup" style="width:21.5%;text-align:center;"><strong>Dependent 4</strong></th>
                    </tr>
									</thead>
									<tbody>
                    <xsl:choose>
                      <xsl:when test="$DependentCount = 0 or $DependentCount &gt; 4 or $Print = $Separated">
                        <tr>
                          <th class="styTableCell" style="text-align:left;border:solid black;border-width:0px 0px 1px 0px;" scope="row"><strong>(1)</strong><span style="padding-left:1mm;font-weight:normal;text-align:left;">First Name</span></th>
                          <td class="sty1040NRTableCellBoldBorder" style="text-align:center;">
                            <xsl:if test="$DependentCount &gt; 4 or $Print = $Separated">
                              <span>See Additional Data Table</span>
                            </xsl:if>
                          </td>
                          <td class="sty1040NRTableCellBoldBorder"></td>
                          <td class="sty1040NRTableCellBoldBorder"></td>
                          <td class="sty1040NRTableCellBoldBorder"></td>
                        </tr>
                        <tr>
                          <th class="styTableCell" style="text-align:left;border:solid black;border-width:0px 0px 1px 0px;" scope="row"><strong>(2)</strong><span style="padding-left:1mm;font-weight:normal;text-align:left;">Last Name</span></th>
                          <td class="sty1040NRTableCellBoldBorder"></td>
                          <td class="sty1040NRTableCellBoldBorder"></td>
                          <td class="sty1040NRTableCellBoldBorder"></td>
                          <td class="sty1040NRTableCellBoldBorder"></td>
                        </tr>
                        <tr>
                          <th class="styTableCell" style="text-align:left;border:solid black;border-width:0px 0px 1px 0px;" scope="row"><strong style="vertical-align:top;">(3)</strong><span style="padding-left:1mm;font-weight:normal;text-align:left">Identifying<br/>number</span></th>
                          <td class="sty1040NRTableCellBoldBorder"></td>
                          <td class="sty1040NRTableCellBoldBorder"></td>
                          <td class="sty1040NRTableCellBoldBorder"></td>
                          <td class="sty1040NRTableCellBoldBorder"></td>
                        </tr>
                        <tr>
                          <th class="styTableCell" style="text-align:left;border:solid black;border-width:0px 0px 1px 0px;" scope="row"><strong>(4)</strong><span style="padding-left:1mm;font-weight:normal;text-align:left;">Relationship</span></th>
                          <td class="sty1040NRTableCellBoldBorder"></td>
                          <td class="sty1040NRTableCellBoldBorder"></td>
                          <td class="sty1040NRTableCellBoldBorder"></td>
                          <td class="sty1040NRTableCellBoldBorder"></td>
                        </tr>
                         <tr>
                          <th class="styTableCell" style="text-align:left;border:solid black;border-width:0px 0px 1px 0px;" scope="row">
                          <strong style="vertical-align:top;">(5)</strong><span style="padding-left:1mm;font-weight:normal;text-align:left;">Check if<br/>lived with<br/> you more <br/>than half<br/> of 2025</span>
                          </th>
                          <td class="sty1040NRTableCellBoldBorder" style="text-align:center;">Yes<span style="width:2px;"/><input type="checkbox" aria-label="Live With Child 1 Over Half Year"/></td>
                          <td class="sty1040NRTableCellBoldBorder" style="text-align:center;">Yes<span style="width:2px;"/><input type="checkbox" aria-label="Live With Child 2 Over Half Year"/></td>
                          <td class="sty1040NRTableCellBoldBorder" style="text-align:center;">Yes<span style="width:2px;"/><input type="checkbox" aria-label="Live With Child 3 Over Half Year"/></td>
                          <td class="sty1040NRTableCellBoldBorder" style="text-align:center;">Yes<span style="width:2px;"/><input type="checkbox" aria-label="Live With Child 4 Over Half Year"/></td>
                        </tr>
                         <tr>
                          <th class="styTableCell" style="text-align:left;border:solid black;border-width:0px;" scope="row"><strong style="vertical-align:top;">(6)</strong><span style="padding-left:1mm;padding-bottom:5.5mm;font-weight:normal;text-align:left;vertical-align:top;">Credits</span></th>
                          <td class="sty1040NRTableCellBoldBorder" style="height:9mm;text-align:center;border-bottom-width:0px;">
                            <div style="width:49%;height:inherit;float:left;border-right:1px solid black;">
                              <div style="width:30%;height:100%;"><input type="checkbox" class="styCkbox" aria-label="Dependent 1 CTC Eligable"/></div>
                              <div style="width:65%;height:100%;padding-top:0.5mm;">Child tax credit</div>
                            </div>
                            <div style="width:51%;height:inherit;float:right;">
                              <div style="width:22%;height:100%;"><input type="checkbox" class="styCkbox" aria-label="Dependent 1 CFOD Eligable"/></div>
                              <div style="width:70%;height:100%;padding-top:0.5mm;">Credit for other dependents</div>
                            </div>
                          </td>
                          <td class="sty1040NRTableCellBoldBorder" style="height:9mm;text-align:center;border-bottom-width:0px;">
                            <div style="width:49%;height:inherit;float:left;border-right:1px solid black;">
                              <div style="width:30%;height:100%;"><input type="checkbox" class="styCkbox" aria-label="Dependent 2 CTC Eligable"/></div>
                              <div style="width:65%;height:100%;padding-top:0.5mm;">Child tax credit</div>
                            </div>
                            <div style="width:51%;height:inherit;float:right;">
                              <div style="width:22%;height:100%;"><input type="checkbox" class="styCkbox" aria-label="Dependent 2 CFOD Eligable"/></div>
                              <div style="width:70%;height:100%;padding-top:0.5mm;">Credit for other dependents</div>
                            </div>
                          </td>
                          <td class="sty1040NRTableCellBoldBorder" style="height:9mm;text-align:center;border-bottom-width:0px;">
                            <div style="width:49%;height:inherit;float:left;border-right:1px solid black;">
                              <div style="width:30%;height:100%;"><input type="checkbox" class="styCkbox" aria-label="Dependent 3 CTC Eligable"/></div>
                              <div style="width:65%;height:100%;padding-top:0.5mm;">Child tax credit</div>
                            </div>
                            <div style="width:51%;height:inherit;float:right;">
                              <div style="width:22%;height:100%;"><input type="checkbox" class="styCkbox" aria-label="Dependent 3 CFOD Eligable"/></div>
                              <div style="width:70%;height:100%;padding-top:0.5mm;">Credit for other dependents</div>
                            </div>
                          </td>
                          <td class="sty1040NRTableCellBoldBorder" style="height:9mm;text-align:center;border-bottom-width:0px;">
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
                      </xsl:when>
                      <xsl:when test="$DependentCount &lt;=4">
                        <!-- First Name row -->
                        <tr>
                          <th class="styTableCell" style="text-align:left;border:solid black;border-width:0px 0px 1px 0px;" scope="row"><strong>(1)</strong><span style="padding-left:1mm;font-weight:normal;text-align:left;">First Name</span></th>
                          <xsl:for-each select="$FormData/DependentDetail">
                            <td class="sty1040NRTableCellBoldBorder" style="border-right-width:0px;text-align:left;padding-left:4px;">
                              <xsl:value-of select="DependentFirstNm"/>
                            </td>
                          </xsl:for-each>
                          <xsl:if test="$DependentCount &lt; 4">
                            <xsl:choose>
                              <xsl:when test="$DependentCount = 3">
                                <td class="sty1040NRTableCellBoldBorder" style="border-right-width:0px;"></td>
                              </xsl:when>
                              <xsl:when test="$DependentCount = 2">
                                <td class="sty1040NRTableCellBoldBorder"></td>
                                <td class="sty1040NRTableCellBoldBorder" style="border-right-width:0px;"></td>
                              </xsl:when>
                              <xsl:when test="$DependentCount = 1">
                                <td class="sty1040NRTableCellBoldBorder"></td>
                                <td class="sty1040NRTableCellBoldBorder"></td>
                                <td class="sty1040NRTableCellBoldBorder" style="border-right-width:0px;"></td>
                              </xsl:when>
                            </xsl:choose>
                          </xsl:if>
                        </tr>
                        <!-- Last Name row -->
                        <tr>
                          <th class="styTableCell" style="text-align:left;border:solid black;border-width:0px 0px 1px 0px;" scope="row"><strong>(2)</strong><span style="padding-left:1mm;font-weight:normal;text-align:left;">Last Name</span></th>
                          <xsl:for-each select="$FormData/DependentDetail">
                            <td class="sty1040NRTableCellBoldBorder" style="border-right-width:0px;text-align:left;padding-left:4px;">
                              <xsl:value-of select="DependentLastNm"/>
                              <span style="padding-left:2mm"/>
                              <xsl:value-of select="DependentNameControlTxt"/>
                            </td>
                          </xsl:for-each>
                          <xsl:if test="$DependentCount &lt; 4">
                            <xsl:choose>
                              <xsl:when test="$DependentCount = 3">
                                <td class="sty1040NRTableCellBoldBorder" style="border-right-width:0px;"></td>
                              </xsl:when>
                              <xsl:when test="$DependentCount = 2">
                                <td class="sty1040NRTableCellBoldBorder"></td>
                                <td class="sty1040NRTableCellBoldBorder" style="border-right-width:0px;"></td>
                              </xsl:when>
                              <xsl:when test="$DependentCount = 1">
                                <td class="sty1040NRTableCellBoldBorder"></td>
                                <td class="sty1040NRTableCellBoldBorder"></td>
                                <td class="sty1040NRTableCellBoldBorder" style="border-right-width:0px;"></td>
                              </xsl:when>
                            </xsl:choose>
                          </xsl:if>
                        </tr>
                        <!-- SSN row -->
                        <tr>
                          <th class="styTableCell" style="text-align:left;border:solid black;border-width:0px 0px 1px 0px;" scope="row"><strong style="vertical-align:top;">(3)</strong><span style="padding-left:1mm;font-weight:normal;text-align:left;">Identifying<br/>number</span></th>
                          <xsl:for-each select="$FormData/DependentDetail">
                            <td class="sty1040NRTableCellBoldBorder" style="border-right-width:0px;text-align:left;padding-left:4px;">
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
                          <xsl:if test="$DependentCount &lt; 4">
                            <xsl:choose>
                              <xsl:when test="$DependentCount = 3">
                                <td class="sty1040NRTableCellBoldBorder" style="border-right-width:0px;"></td>
                              </xsl:when>
                              <xsl:when test="$DependentCount = 2">
                                <td class="sty1040NRTableCellBoldBorder"></td>
                                <td class="sty1040NRTableCellBoldBorder" style="border-right-width:0px;"></td>
                              </xsl:when>
                              <xsl:when test="$DependentCount = 1">
                                <td class="sty1040NRTableCellBoldBorder"></td>
                                <td class="sty1040NRTableCellBoldBorder"></td>
                                <td class="sty1040NRTableCellBoldBorder" style="border-right-width:0px;"></td>
                              </xsl:when>
                            </xsl:choose>
                          </xsl:if>
                        </tr>
                        <!-- Relationship block -->
                        <tr>
                          <th class="styTableCell" style="text-align:left;border:solid black;border-width:0px 0px 1px 0px;" scope="row"><strong>(4)</strong><span style="padding-left:1mm;font-weight:normal;text-align:left;">Relationship</span></th>
                          <xsl:for-each select="$FormData/DependentDetail">
                            <td class="sty1040NRTableCellBoldBorder" style="border-right-width:0px;text-align:left;padding-left:4px;">
                              <xsl:value-of select="DependentRelationshipCd"/>
                            </td>
                          </xsl:for-each>
                          <xsl:if test="$DependentCount &lt; 4">
                            <xsl:choose>
                              <xsl:when test="$DependentCount = 3">
                                <td class="sty1040NRTableCellBoldBorder" style="border-right-width:0px;"></td>
                              </xsl:when>
                              <xsl:when test="$DependentCount = 2">
                                <td class="sty1040NRTableCellBoldBorder"></td>
                                <td class="sty1040NRTableCellBoldBorder" style="border-right-width:0px;"></td>
                              </xsl:when>
                              <xsl:when test="$DependentCount = 1">
                                <td class="sty1040NRTableCellBoldBorder"></td>
                                <td class="sty1040NRTableCellBoldBorder"></td>
                                <td class="sty1040NRTableCellBoldBorder" style="border-right-width:0px;"></td>
                              </xsl:when>
                            </xsl:choose>
                          </xsl:if>
                        </tr>
                        <!-- Yes Live With Child -->
                        <tr>
                          <th class="styTableCell" style="text-align:left;border:solid black;border-width:0px 0px 1px 0px;" scope="row">
                            <strong style="vertical-align:top;">(5)</strong><span style="padding-left:1mm;font-weight:normal;text-align:left;">Check if<br/>lived with<br/> you more <br/>than half<br/> of 2025</span>
                          </th>
                          <xsl:for-each select="$FormData/DependentDetail">
                            <td class="sty1040NRTableCellBoldBorder" style="border-right-width:0px;text-align:center;">
                              Yes<span style="width:2px;"/>
                              <input type="checkbox" class="styCkbox">
                                <xsl:attribute name="aria-label">Live With Dependent <xsl:value-of select="position()"/> Over Half Year"</xsl:attribute>
                                <xsl:call-template name="PopulateCheckbox">
                                  <xsl:with-param name="TargetNode" select="YesLiveWithChildOverHalfYrInd"/>
                                  <xsl:with-param name="BackupName">
                                  IRS1040NRCTCInd</xsl:with-param>
                                </xsl:call-template>
                              </input>
                            </td>
                          </xsl:for-each>
                          <xsl:if test="$DependentCount &lt; 4">
                            <xsl:choose>
                              <xsl:when test="$DependentCount = 3">
                                <td class="sty1040NRTableCellBoldBorder" style="text-align:center;">Yes <span style="width:2px;"/><input type="checkbox" aria-label="Live With Child 4 Over Half Year"/></td>
                              </xsl:when>
                              <xsl:when test="$DependentCount = 2">
                                <td class="sty1040NRTableCellBoldBorder" style="text-align:center;">Yes <span style="width:2px;"/><input type="checkbox" aria-label="Live With Child 3 Over Half Year"/></td>
                                <td class="sty1040NRTableCellBoldBorder" style="text-align:center;">Yes <span style="width:2px;"/><input type="checkbox" aria-label="Live With Child 4 Over Half Year"/></td>
                              </xsl:when>
                              <xsl:when test="$DependentCount = 1">
                                <td class="sty1040NRTableCellBoldBorder" style="text-align:center;">Yes <span style="width:2px;"/><input type="checkbox" aria-label="Live With Child 2 Over Half Year"/></td>
                                <td class="sty1040NRTableCellBoldBorder" style="text-align:center;">Yes <span style="width:2px;"/><input type="checkbox" aria-label="Live With Child 3 Over Half Year"/></td>
                                <td class="sty1040NRTableCellBoldBorder" style="text-align:center;">Yes <span style="width:2px;"/><input type="checkbox" aria-label="Live With Child 4 Over Half Year"/></td>
                              </xsl:when>
                            </xsl:choose>
                          </xsl:if>
                        </tr>
                        <!-- Credits -->
                        <tr>
                          <th class="styTableCell" style="text-align:left;border:0px;" scope="row">
                            <strong style="vertical-align:top;">(6)</strong>
                            <span style="padding-left:1mm;padding-bottom:5.5mm;font-weight:normal;text-align:left;vertical-align:top;">Credits</span>
                          </th>
                          <xsl:for-each select="$FormData/DependentDetail">
                            <td class="sty1040NRTableCellBoldBorder" style="height:9mm;text-align:center;border-bottom-width:0px;">
                              <div style="width:49%;height:inherit;float:left;border-right:1px solid black;">
                                <div style="width:30%;height:100%;">
                                  <input type="checkbox" class="styCkbox">
                                    <xsl:attribute name="aria-label">Dependent <xsl:value-of select="position()"/> CTC Eligable"</xsl:attribute>
                                    <xsl:call-template name="PopulateCheckbox">
                                      <xsl:with-param name="TargetNode" 
                                      select="EligibleForChildTaxCreditInd"/>
                                      <xsl:with-param name="BackupName">
                                      IRS1040NRCTCInd</xsl:with-param>
                                    </xsl:call-template>
                                  </input>
                                </div>
                                <div style="width:65%;height:100%;padding-top:0.5mm;">Child tax credit</div>
                              </div>
                              <div style="width:51%;height:inherit;float:right;">
                                <div style="width:22%;height:100%;">
                                  <input type="checkbox" class="styCkbox" style="margin-right:1mm;">
                                    <xsl:attribute name="aria-label">Dependent <xsl:value-of select="position()"/> CFOD Eligable"</xsl:attribute>
                                    <xsl:call-template name="PopulateCheckbox">
                                      <xsl:with-param name="TargetNode"
                                      select="EligibleForODCInd"/>
                                      <xsl:with-param name="BackupName">
                                      IRS1040NRCFODInd</xsl:with-param>
                                    </xsl:call-template>
                                  </input>
                                </div>
                                <div style="width:70%;height:100%;padding-top:0.5mm;">Credit for other dependents</div>
                              </div>
                            </td>
                          </xsl:for-each>
                          <xsl:if test="$DependentCount &lt; 4">
                            <xsl:choose>
                              <xsl:when test="$DependentCount = 3">
                                <td class="sty1040NRTableCellBoldBorder" style="height:9mm;text-align:center;border-bottom-width:0px;">
                                    <div style="width:49%;height:inherit;float:left;border-right:1px solid black;">
                                      <div style="width:30%;height:100%;"><input type="checkbox" class="styCkbox" aria-label="Dependent 4 CTC Eligable"/></div>
                                      <div style="width:65%;height:100%;padding-top:0.5mm;">Child tax credit</div>
                                    </div>
                                    <div style="width:51%;height:inherit;float:right;">
                                    <div style="width:22%;height:100%;"><input type="checkbox" class="styCkbox" aria-label="Dependent 4 CFOD Eligable"/></div>
                                    <div style="width:70%;height:100%;padding-top:0.5mm;">Credit for other dependents</div>
                                  </div>
                                </td>
                              </xsl:when>
                              <xsl:when test="$DependentCount = 2">
                                <td class="sty1040NRTableCellBoldBorder" style="height:9mm;text-align:center;border-bottom-width:0px;">
                                    <div style="width:49%;height:inherit;float:left;border-right:1px solid black;">
                                      <div style="width:30%;height:100%;"><input type="checkbox" class="styCkbox" aria-label="Dependent 3 CTC Eligable"/></div>
                                      <div style="width:65%;height:100%;padding-top:0.5mm;">Child tax credit</div>
                                    </div>
                                    <div style="width:51%;height:inherit;float:right;">
                                      <div style="width:22%;height:100%;"><input type="checkbox" class="styCkbox" aria-label="Dependent 3 CFOD Eligable"/></div>
                                      <div style="width:70%;height:100%;padding-top:0.5mm;">Credit for other dependents</div>
                                    </div>
                                  </td>
                                  <td class="sty1040NRTableCellBoldBorder" style="height:9mm;text-align:center;border-bottom-width:0px;">
                                    <div style="width:49%;height:inherit;float:left;border-right:1px solid black;">
                                      <div style="width:30%;height:100%;"><input type="checkbox" class="styCkbox" aria-label="Dependent 4 CTC Eligable"/></div>
                                      <div style="width:65%;height:100%;padding-top:0.5mm;">Child tax credit</div>
                                    </div>
                                    <div style="width:51%;height:inherit;float:right;">
                                    <div style="width:22%;height:100%;"><input type="checkbox" class="styCkbox" aria-label="Dependent 4 CFOD Eligable"/></div>
                                    <div style="width:70%;height:100%;padding-top:0.5mm;">Credit for other dependents</div>
                                  </div>
                                </td>
                              </xsl:when>
                              <xsl:when test="$DependentCount = 1">
                                <td class="sty1040NRTableCellBoldBorder" style="height:9mm;text-align:center;border-bottom-width:0px;">
                                  <div style="width:49%;height:inherit;float:left;border-right:1px solid black;">
                                    <div style="width:30%;height:100%;"><input type="checkbox" class="styCkbox" aria-label="Dependent 2 CTC Eligable"/></div>
                                    <div style="width:65%;height:100%;padding-top:0.5mm;">Child tax credit</div>
                                  </div>
                                  <div style="width:51%;height:inherit;float:right;">
                                    <div style="width:22%;height:100%;"><input type="checkbox" class="styCkbox" aria-label="Dependent 2 CFOD Eligable"/></div>
                                    <div style="width:70%;height:100%;padding-top:0.5mm;">Credit for other dependents</div>
                                  </div>
                                  </td>
                                  <td class="sty1040NRTableCellBoldBorder" style="height:9mm;text-align:center;border-bottom-width:0px;">
                                    <div style="width:49%;height:inherit;float:left;border-right:1px solid black;">
                                      <div style="width:30%;height:100%;"><input type="checkbox" class="styCkbox" aria-label="Dependent 3 CTC Eligable"/></div>
                                      <div style="width:65%;height:100%;padding-top:0.5mm;">Child tax credit</div>
                                    </div>
                                    <div style="width:51%;height:inherit;float:right;">
                                      <div style="width:22%;height:100%;"><input type="checkbox" class="styCkbox" aria-label="Dependent 3 CFOD Eligable"/></div>
                                      <div style="width:70%;height:100%;padding-top:0.5mm;">Credit for other dependents</div>
                                    </div>
                                  </td>
                                  <td class="sty1040NRTableCellBoldBorder" style="height:9mm;text-align:center;border-bottom-width:0px;">
                                    <div style="width:49%;height:inherit;float:left;border-right:1px solid black;">
                                      <div style="width:30%;height:100%;"><input type="checkbox" class="styCkbox" aria-label="Dependent 4 CTC Eligable"/></div>
                                      <div style="width:65%;height:100%;padding-top:0.5mm;">Child tax credit</div>
                                    </div>
                                    <div style="width:51%;height:inherit;float:right;">
                                    <div style="width:22%;height:100%;"><input type="checkbox" class="styCkbox" aria-label="Dependent 4 CFOD Eligable"/></div>
                                    <div style="width:70%;height:100%;padding-top:0.5mm;">Credit for other dependents</div>
                                  </div>
                                </td>
                              </xsl:when>
                            </xsl:choose>
                          </xsl:if>
                        </tr>  
                      </xsl:when>
                    </xsl:choose>
									</tbody>
								</table>
						</div>
					</div>
						<!-- End Dependents table -->
					<div class="styStdDiv" style="border-top:1px solid black;overflow:visible;">
						<div class="styGenericDiv" style="width:21mm;padding-top:.5mm;height:110mm;">
							<div style="width:100%;padding-top:0mm;padding-left:1mm;font-family:Arial;font-size:10pt;padding-bottom:2mm">
								<strong>Income<br/>Effectively<br/>Connected<br/>With U.S.<br/>Trade or<br/>Business</strong><br/>
							</div>
							<div style="width:100%;padding-top:1mm;padding-left:1mm;font-family:Arial;font-size:8pt;padding-bottom:1mm">
								<strong>Attach<br/>Form(s) W-2,<br/>1042-S,<br/> SSA-1042-S,<br/>RRB-1042-S,<br/> and 8288-A <br/>here. Also<br/>attach<br/> Form(s)<br/>1099-R if<br/> tax was<br/>witheld.</strong>
							</div>
							<div style="width:100%;padding-top:1mm;padding-left:1mm;font-family:Arial;font-size:8pt;padding-bottom:3mm">
								If you did not<br/> get a Form<br/>W-2, see<br/>instructions.
							</div>
						</div>
						<!-- Line 1a -->
						<div class="sty1040NRLN">
							<div class="styLNLeftNumBoxSD" style="padding-left:1mm;">1a</div>
							<div class="sty1040NRDesc">
								Total amount from Form(s) W-2, box 1. (See instructions)
								<span class="sty1040NRDotLn">............</span>
							</div>
							<div class="sty1040NRRightNumBox">1a</div>
							<div class="sty1040NRAmountBox">
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
						<div class="sty1040NRLN">
							<div class="styLNLeftNumBoxSD">b</div>
							<div class="sty1040NRDesc">
								Household employee wages not reported on Form(s) W-2
								<span class="sty1040NRDotLn">............</span>
							</div>
							<div class="sty1040NRRightNumBox">1b</div>
							<div class="sty1040NRAmountBox">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/HouseholdEmployeeWagesAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<!-- Line 1c -->
						<div class="sty1040NRLN">
							<div class="styLNLeftNumBoxSD">c</div>
							<div class="sty1040NRDesc">
								Tip income not reported on line 1a (see instructions)
								<span class="sty1040NRDotLn">............</span>
							</div>
							<div class="sty1040NRRightNumBox">1c</div>
							<div class="sty1040NRAmountBox">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/TipIncomeAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<!-- Line 1d -->
						<div class="sty1040NRLN">
							<div class="styLNLeftNumBoxSD">d</div>
							<div class="sty1040NRDesc">
								Medicaid waiver payments not reported on Form(s) W-2 (see instructions)
								<span class="sty1040NRDotLn">......</span>
							</div>
							<div class="sty1040NRRightNumBox">1d</div>
							<div class="sty1040NRAmountBox">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/MedicaidWaiverPymtNotRptW2Amt"/>
								</xsl:call-template>
							</div>
						</div>
						<!-- Line 1e -->
						<div class="sty1040NRLN">
							<div class="styLNLeftNumBoxSD">e</div>
							<div class="sty1040NRDesc">
								Taxable dependent care benefits from Form 2441, line 26
								<span class="sty1040NRDotLn">............</span>
							</div>
							<div class="sty1040NRRightNumBox">1e</div>
							<div class="sty1040NRAmountBox">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/TaxableBenefitsAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<!-- Line 1f -->
						<div class="sty1040NRLN">
							<div class="styLNLeftNumBoxSD">f</div>
							<div class="sty1040NRDesc">
								Employer-provided adoption benefits from Form 8839, line 31
								<span class="sty1040NRDotLn">...........</span>
							</div>
							<div class="sty1040NRRightNumBox">1f</div>
							<div class="sty1040NRAmountBox">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/TaxableBenefitsForm8839Amt"/>
								</xsl:call-template>
							</div>
						</div>
						<!-- Line 1g -->
						<div class="sty1040NRLN">
							<div class="styLNLeftNumBoxSD">g</div>
							<div class="sty1040NRDesc">
								Wages from Form 8919, line 6
								<span class="sty1040NRDotLn">....................</span>
							</div>
							<div class="sty1040NRRightNumBox">1g</div>
							<div class="sty1040NRAmountBox">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/TotalWagesWithNoWithholdingAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<!-- Line 1h -->
						<div class="sty1040NRLN">
							<div class="styLNLeftNumBoxSD">h</div>
							<div class="sty1040NRDesc">
								Other earned income (see instructions). Enter type and amount:
								<xsl:call-template name="LinkToLeftoverDataTableInline">
									<xsl:with-param name="Desc">Line 1h - Other earned income</xsl:with-param>
									<xsl:with-param name="TargetNode" 
									select="$FormData/WagesNotShownGrp/OtherWagesNotShownTxt"/>
								</xsl:call-template>
								<xsl:call-template name="LinkToLeftoverDataTableInline">
										<xsl:with-param name="Desc">Line 1h - Other earned income</xsl:with-param>
										<xsl:with-param name="TargetNode" 
										select="$FormData/WagesNotShownGrp/OtherWagesNotShownTxt"/>
									</xsl:call-template>
								<span style="width:34mm;border-bottom:dotted 1px;">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" 
											select="$FormData/WagesNotShownGrp/OtherWagesNotShownTxt"/>
									</xsl:call-template>&nbsp;
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" 
											select="$FormData/WagesNotShownGrp/WagesNotShownAmt"/>
									</xsl:call-template>
								</span>
							</div>
							<div class="sty1040NRRightNumBox">1h</div>
							<div class="sty1040NRAmountBox">
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
						<div class="sty1040NRLN">
							<div class="styLNLeftNumBoxSD">i</div>
							<div class="sty1040NRDesc" style="width:86mm;padding-top:0.7mm;">
								Reserved for future use
								<span class="sty1040NRDotLn">.............</span>
							</div>
							<div class="sty1040NRRightNumBox">1i</div>
							<div class="sty1040NRAmountBox" style="background-color:lightgrey">
								<!--<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/NontxCombatPayElectionAmt"/>
								</xsl:call-template>-->
							</div>
							<div class="sty1040NRRightNumBoxNBB" style="background-color:lightgrey;">&nbsp;</div>
							<div class="sty1040NRAmountBoxNBB" style="background-color:lightgrey">&nbsp;</div>
						</div>
						<!-- Line 1j -->
						<div class="sty1040NRLN">
							<div class="styLNLeftNumBoxSD">j</div>
							<div class="sty1040NRDesc">
								Reserved for future use
								<span class="sty1040NRDotLn">......................</span>
							</div>
							<div class="sty1040NRRightNumBox">1j</div>
							<div class="sty1040NRAmountBox" style="background-color:lightgrey">
							</div>
						</div>
						<!-- Line 1k -->
						<div class="sty1040NRLN">
							<div class="styLNLeftNumBoxSD">k</div>
							<div class="sty1040NRDesc" style="width:86mm;padding-top:0.7mm;">
								Total income exempt by a treaty from Schedule OI (Form 1040-NR), item L, line 1(e)
								<span class="sty1040NRDotLn">................</span>
							</div>
							<div class="sty1040NRRightNumBox" style="height:7mm;padding-top:3.5mm">1k</div>
							<div class="sty1040NRAmountBox" style="height:7mm;padding-top:3.5mm">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/TreatyTaxExemptUSIncomeAmt"/>
								</xsl:call-template>
							</div>
							<div class="sty1040NRRightNumBoxNBB" style="background-color:lightgrey;height:7mm;">&nbsp;</div>
							<div class="sty1040NRAmountBoxNBB" style="height:7mm;">&nbsp;</div>
						</div>
						<!-- Line 1z -->
						<div class="sty1040NRLN">
							<div class="styLNLeftNumBoxSD">z</div>
							<div class="sty1040NRDesc">
								Add lines 1a through 1h
								<span class="sty1040NRDotLn">......................</span>
							</div>
							<div class="sty1040NRRightNumBox">1z</div>
							<div class="sty1040NRAmountBox">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/WagesSalariesAndTipsAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<!-- Line 2 -->
						<div class="sty1040NRLN">
							<div class="styLNLeftNumBoxSD" style="padding-left:1.7mm">2a</div>
							<div class="sty1040NRDesc" style="width:30.5mm;">Tax-exempt interest
								<span class="sty1040NRDotLn">.</span></div>
							<div class="sty1040NRRightNumBox">2a</div>
							<div class="sty1040NRAmountBox" style="border-right-width:1px;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" 
										select="$FormData/TaxExemptInterestAmt"/>
								</xsl:call-template>
							</div>
							<div class="styLNLeftLtrBox" style="width:7mm;">b</div>
							<div class="sty1040NRDesc" style="width:48.5mm;">
								Taxable interest 
								<span class="sty1040NRDotLn">......</span></div>
							<div class="sty1040NRRightNumBox">2b</div>
							<div class="sty1040NRAmountBox" style="width:29mm;">
								<span style="float:left;">
									<xsl:call-template name="SetFormLinkInline">
										<xsl:with-param name="TargetNode" 
											select="$FormData/TaxableInterestAmt"/>
									</xsl:call-template>
								</span>
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/TaxableInterestAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<!-- Line 3a -->
						<div class="sty1040NRLN">
							<div class="styLNLeftNumBoxSD" style="padding-left:1.7mm">3a</div>
							<div class="sty1040NRDesc" style="width:30.5mm;">
								Qualified dividends
							</div>
							<div class="sty1040NRRightNumBox">3a</div>
							<div class="sty1040NRAmountBox" style="border-right-width:1px;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" 
										select="$FormData/QualifiedDividendsAmt"/>
								</xsl:call-template>
							</div>
							<div class="styLNLeftLtrBox" style="width:7mm;">b</div>
							<div class="sty1040NRDesc" style="width:48.5mm;">
								Ordinary dividends
								<span class="sty1040NRDotLn">......</span>
							</div>
							<div class="sty1040NRRightNumBox">3b</div>
							<div class="sty1040NRAmountBox">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" 
										select="$FormData/OrdinaryDividendsAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<!-- Line 3c -->
            <div class="sty1040NRLN">
              <div class="styLNLeftLtrBox" style="width:8mm;">c</div>
              <div class="sty1040NRDesc">
                <span style="height:inherit;padding-right:1mm;">Check if your child's dividends are included in </span>
                <span style="height:inherit;font-weight:bold;padding-right:1mm;">1</span>
                <input type="checkbox" class="styCkboxNM" style="margin-right:6px;" aria-label="included on line 3a">
                  <xsl:call-template name="PopulateCheckbox">
                    <xsl:with-param name="TargetNode" 
                      select="$FormData/ChildDivIncldQualifiedDivInd"/>
                    <xsl:with-param name="BackupName">IRS1040NRChildDivIncldQualifiedDivInd
                    </xsl:with-param>
                  </xsl:call-template>
                </input>
                <span style="padding-right:2mm;">Line 3a</span>
                
                <span style="height:inherit;font-weight:bold;padding-right:1mm;">2</span>
                <input type="checkbox" class="styCkboxNM" style="margin-right:6px;" aria-label="included on 3b">
                  <xsl:call-template name="PopulateCheckbox">
                    <xsl:with-param name="TargetNode" 
                      select="$FormData/ChildDivIncldOrdinaryDivInd"/>
                    <xsl:with-param name="BackupName">IRS1040NRChildDivIncldOrdinaryDivInd
                    </xsl:with-param>
                  </xsl:call-template>
                </input>
                <span style="padding-right:1mm;">Line 3b</span>
              </div>
              <div class="sty1040NRRightNumBoxNBB" style="background-color:lightgrey;height:4mm;">&nbsp;</div>
							<div class="sty1040NRAmountBoxNBB" style="height:4mm;">&nbsp;</div>
            </div>
						<!-- Line 4 -->
						<div class="sty1040NRLN">
							<div class="styLNLeftNumBoxSD" style="padding-left:1.7mm">4a</div>
							<div class="sty1040NRDesc" style="width:30.5mm;">IRA distributions 
								<span class="sty1040NRDotLn">..</span></div>
							<div class="sty1040NRRightNumBox">4a</div>
							<div class="sty1040NRAmountBox" style="border-right-width:1px;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" 	select="$FormData/IRADistributionsAmt"/>
								</xsl:call-template>
							</div>
							<div class="styLNLeftLtrBox" style="width:7mm;">b</div>
							<div class="sty1040NRDesc" style="width:48.5mm;">
								Taxable amount
								<span class="sty1040NRDotLn">.....</span>
							</div>
							<div class="sty1040NRRightNumBox">4b</div>
							<div class="sty1040NRAmountBox">
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
						<div class="sty1040NRLN">
              <div class="styLNLeftLtrBox" style="width:8mm;">c</div>
              <div class="sty1040NRDesc">
                <span style="height:inherit;padding-right:1mm;">Check if (see instructions)</span>
                <span class="sty1040NRDotLn" style="float:none;">......</span>
                <span style="height:inherit;font-weight:bold;padding-right:1mm;">1</span>
                <input type="checkbox" class="styCkboxNM" style="margin-right:6px;" aria-label="IRA rollover">
                  <xsl:call-template name="PopulateCheckbox">
                    <xsl:with-param name="TargetNode" 
                      select="$FormData/IRADistributionRolloverInd"/>
                    <xsl:with-param name="BackupName">IRS1040NRIRADistributionRolloverInd
                    </xsl:with-param>
                  </xsl:call-template>
                </input>
                <span style="padding-right:1mm;">Rollover</span>
                
                <span style="height:inherit;font-weight:bold;padding-right:1mm;">2</span>
                <input type="checkbox" class="styCkboxNM" style="margin-right:6px;" aria-label="IRA QCD">
                  <xsl:call-template name="PopulateCheckbox">
                    <xsl:with-param name="TargetNode" 
                      select="$FormData/ChildDivIncldOrdinaryDivInd"/>
                    <xsl:with-param name="BackupName">IRS1040NRChildDivIncldOrdinaryDivInd
                    </xsl:with-param>
                  </xsl:call-template>
                </input>
                <span style="padding-right:1mm;">QCD</span>
                
                <span style="height:inherit;font-weight:bold;padding-right:1mm;">3</span>
                <input type="checkbox" class="styCkboxNM" style="margin-right:6px;" aria-label="IRA Other">
                  <xsl:call-template name="PopulateCheckbox">
                    <xsl:with-param name="TargetNode" 
                      select="$FormData/IRADistributionOtherInd"/>
                    <xsl:with-param name="BackupName">IRS1040NRIRADistributionOtherInd
                    </xsl:with-param>
                  </xsl:call-template>
                </input>
                <span style="border-bottom:1px solid black;">
				  <xsl:call-template name="LinkToLeftoverDataTableInline">
					<xsl:with-param name="Desc">Line 4c3 - Pensions Annuities Other Code</xsl:with-param>
					<xsl:with-param name="TargetNode" select="$FormData/OtherIRATypeCd"/>
				  </xsl:call-template>
				  <xsl:call-template name="LinkToLeftoverDataTableInline">
					<xsl:with-param name="Desc">Line 4c3 - Pensions Annuities Other Text</xsl:with-param>
					<xsl:with-param name="TargetNode" select="$FormData/OtherIRATypeTxt"/>
				  </xsl:call-template>
				</span>
                <span style="width:10mm;border-bottom:1px solid black;">
                  <xsl:choose>
                    <xsl:when test="$FormData/OtherIRATypeCd">
                      <xsl:call-template name="PopulateText">
                        <xsl:with-param name="TargetNode" select="$FormData/OtherIRATypeCd"></xsl:with-param>
                      </xsl:call-template>
                    </xsl:when>
                    <xsl:when test="$FormData/OtherIRATypeTxt">
                      <xsl:call-template name="LinkToLeftoverDataTableInline">
                        <xsl:with-param name="Desc">Other IRA Type Text</xsl:with-param>
                        <xsl:with-param name="TargetNode" select="$FormData/PensionsAnnuitiesOtherTypeTxt"/>
                      </xsl:call-template>
                    </xsl:when>
                  </xsl:choose>
                </span>
              </div>
              <div class="sty1040NRRightNumBoxNBB" style="background-color:lightgrey;height:4mm;">&nbsp;</div>
							<div class="sty1040NRAmountBoxNBB" style="height:4mm;">&nbsp;</div>
            </div>
						<!-- Line 5 -->
						<div class="sty1040NRLN">
							<div class="styLNLeftNumBoxSD" style="padding-left:1.7mm;">5a</div>
							<div class="sty1040NRDesc" style="width:30.5mm;">Pensions and annuities</div>
							<div class="sty1040NRRightNumBox">5a</div>
							<div class="sty1040NRAmountBox" style="border-right-width:1px;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" 
										select="$FormData/PensionsAnnuitiesAmt"/>
								</xsl:call-template>
							</div>
							<div class="styLNLeftLtrBox" style="width:7mm;">b</div>
							<div class="sty1040NRDesc" style="width:48.5mm;">
								Taxable amount
								<span class="sty1040NRDotLn">.....</span>
							</div>
							<div class="sty1040NRRightNumBox">5b</div>
							<div class="sty1040NRAmountBox">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/TotalTaxablePensionsAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<!-- Line 5c -->
						<div class="sty1040NRLN">
              <div class="styLNLeftLtrBox" style="width:8mm;">c</div>
              <div class="sty1040NRDesc">
                <span style="height:inherit;padding-right:1mm;">Check if (see instructions)</span>
                <span class="sty1040NRDotLn" style="float:none;">......</span>
                <span style="height:inherit;font-weight:bold;padding-right:1mm;">1</span>
                <input type="checkbox" class="styCkboxNM" style="margin-right:6px;" aria-label="Pension or Annuity Rollover">
                  <xsl:call-template name="PopulateCheckbox">
                    <xsl:with-param name="TargetNode" 
                      select="$FormData/PensionsAnnuitiesRolloverInd"/>
                    <xsl:with-param name="BackupName">IRS1040NRPensionsAnnuitiesRolloverInd
                    </xsl:with-param>
                  </xsl:call-template>
                </input>
                <span style="padding-right:1mm;">Rollover</span>
                
                <span style="height:inherit;font-weight:bold;padding-right:1mm;">2</span>
                <input type="checkbox" class="styCkboxNM" style="margin-right:6px;" aria-label="Pension or Annuity PSO">
                  <xsl:call-template name="PopulateCheckbox">
                    <xsl:with-param name="TargetNode" 
                      select="$FormData/PensionsAnnuitiesPSOInd"/>
                    <xsl:with-param name="BackupName">IRS1040NRPensionsAnnuitiesPSOInd
                    </xsl:with-param>
                  </xsl:call-template>
                </input>
                <span style="padding-right:1mm;">PSO</span>
                
                <span style="height:inherit;font-weight:bold;padding-right:1mm;">3</span>
                <input type="checkbox" class="styCkboxNM" style="margin-right:6px;" aria-label="Pension or Annuity Other">
                  <xsl:call-template name="PopulateCheckbox">
                    <xsl:with-param name="TargetNode" 
                      select="$FormData/PensionsAnnuitiesOtherInd"/>
                    <xsl:with-param name="BackupName">IRS1040NRPensionsAnnuitiesOtherInd
                    </xsl:with-param>
                  </xsl:call-template>
                </input>
                <span style="width:1mm;"/>
                <span style="width:10mm;border-bottom:1px solid black;">
                  <xsl:call-template name="LinkToLeftoverDataTableInline">
                    <xsl:with-param name="Desc">Line 5c - Pensions Annuities Other Code</xsl:with-param>
                    <xsl:with-param name="TargetNode" select="$FormData/PensionsAnnuitiesOtherTypeTxt"/>
                  </xsl:call-template>
                  <xsl:call-template name="LinkToLeftoverDataTableInline">
                    <xsl:with-param name="Desc">Line 5c - Pensions Annuities Other Text</xsl:with-param>
                    <xsl:with-param name="TargetNode" select="$FormData/PensionsAnnuitiesOtherTypeTxt"/>
                  </xsl:call-template>
                </span>
              </div>
              <div class="sty1040NRRightNumBoxNBB" style="background-color:lightgrey;height:4mm;">&nbsp;</div>
							<div class="sty1040NRAmountBoxNBB" style="height:4mm;">&nbsp;</div>
            </div>
						<!-- Line 6 -->
						<div class="sty1040NRLN">
							<div class="styLNLeftNumBoxSD" style="padding-left:1.7mm">6</div>
							<div class="sty1040NRDesc">Reserved for future use
								<span class="sty1040NRDotLn">.......................</span>
							</div>
							<div class="sty1040NRRightNumBox">6</div>
							<div class="sty1040NRAmountBox" style="background-color:lightgrey">
							</div>
						</div>
						<!-- Line 7a -->
						<div class="sty1040NRLN">
							<div class="styLNLeftNumBoxSD" style="padding-left:1.7mm">7a</div>
							<div class="sty1040NRDesc" style="font-size:6.5pt">
								Capital gain or (loss). Attach Schedule D if required
							</div>
							<div class="sty1040NRRightNumBox">7a</div>
							<div class="sty1040NRAmountBox">
								<span style="float:left;">
									<xsl:call-template name="SetFormLinkInline">
										<xsl:with-param name="TargetNode" 
											select="$FormData/CapitalGainLossAmt"/>
									</xsl:call-template>
								</span>
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" 
										select="$FormData/CapitalGainLossAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<!-- Line 7b -->
						<div class="sty1040NRLN">
              <div class="styLNLeftLtrBox" style="width:8mm;">b</div>
              <div class="sty1040NRDesc">
                <span style="height:inherit;padding-right:1mm;">Check if: </span>
                <input type="checkbox" class="styCkboxNM" style="margin-right:6px;" aria-label="Schedule D not required">
                  <xsl:call-template name="PopulateCheckbox">
                    <xsl:with-param name="TargetNode" 
                      select="$FormData/CapitalDistributionInd"/>
                    <xsl:with-param name="BackupName">IRS1040NRCapitalDistributionInd
                    </xsl:with-param>
                  </xsl:call-template>
                </input>
                <span style="padding-right:2mm;">Schedule D not required</span>
                
                <input type="checkbox" class="styCkboxNM" style="margin-right:6px;" aria-label="Child Capital Gain or Loss">
                  <xsl:call-template name="PopulateCheckbox">
                    <xsl:with-param name="TargetNode" 
                      select="$FormData/ChildCapitalGainOrLossIncldInd"/>
                    <xsl:with-param name="BackupName">IRS1040NRChildCapitalGainOrLossIncldInd
                    </xsl:with-param>
                  </xsl:call-template>
                </input>
                <span style="padding-right:2mm;">Includes child's capital gain or (loss)</span>
                <span style="width:20mm;border-bottom:1px solid black;">
                  <xsl:call-template name="LinkToLeftoverDataTableInline">
                    <xsl:with-param name="Desc">Line 7b - Form 8814 Amount</xsl:with-param>
                    <xsl:with-param name="TargetNode" select="$FormData/Form8814Amt"/>
                  </xsl:call-template>
                </span>
              </div>
              <div class="sty1040NRRightNumBoxNBB" style="background-color:lightgrey;height:4mm;">&nbsp;</div>
							<div class="sty1040NRAmountBoxNBB" style="height:4mm;">&nbsp;</div>
            </div>
						
						<!-- Line 8 -->
						<div class="sty1040NRLN">
							<div class="styLNLeftNumBoxSD" style="padding-left:1.7mm">8</div>
							<div class="sty1040NRDesc">Additional income from Schedule 1 (Form 1040), line 10
								<span class="sty1040NRDotLn">............</span>
							</div>
							<div class="sty1040NRRightNumBox">8</div>
							<div class="sty1040NRAmountBox">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" 
										select="$FormData/TotalAdditionalIncomeAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<!-- Line 9 -->
						<div class="sty1040NRLN">
							<div class="styLNLeftNumBoxSD"	style="padding-left:1.7mm;">9</div>
							<div class="sty1040NRDesc">Add lines 1z, 2b, 3b, 4b, 5b, 7a, and 8. This is your
								<strong>total effectively connected income</strong><span class="sty1040NRDotLn">..</span>
								<span style="width:5px"/>
							</div>
							<div class="sty1040NRRightNumBox">9</div>
							<div class="sty1040NRAmountBox">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/TotalECIAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<!-- Line 10 -->
						<div class="sty1040NRLN" style="height:7mm;">
							<div class="styLNLeftNumBoxSD"	style="padding-left:0mm;height:7.5mm;">10</div>
							<div class="sty1040NRDesc" style="height:7.5mm;">
								Adjustments to income from Schedule 1 (Form 1040), line 26. These are your <b>total adjustments to income</b>
								<span style="width:.5mm"/><span class="sty1040NRDotLn">......................</span>
							</div>
							<div class="sty1040NRRightNumBox" style="height:7.5mm;padding-top:3.5mm">10</div>
							<div class="sty1040NRAmountBox" style="height:7.5mm;padding-top:3.5mm">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" 
									select="$FormData/TotalAdjustmentsAmt"/> 
								</xsl:call-template>
							</div>
						</div>	
						<!-- Line 11a -->
						<div class="sty1040NRLN">
							<div class="styLNLeftNumBoxSD" style="padding-left:0mm;">11a</div>
							<div class="sty1040NRDesc">
								Subtract line 10 from line 9. This is your <strong>adjusted gross income</strong>
								<span class="sty1040NRDotLn">.........</span>
							</div>
							<div class="sty1040NRRightNumBox" style="border-bottom-width:0px;">11a</div>
							<div class="sty1040NRAmountBox" style="border-bottom-width:0px;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" 
									select="$FormData/AdjustedGrossIncomeAmt"/>
								</xsl:call-template>
							</div>
						</div>
						</div>
            	<!-- Form footer-->
            <div class="styStdDiv pageEnd" style="border-top:1px solid black;">
              <span style="font-weight:bold;font-family:Arial;">For Disclosure, Privacy Act, and
                Paperwork Reduction Act Notice, see separate instructions.</span>
              <span style="margin-left:17mm;font-size:6.5pt;">Cat. No. 11364D</span>
              <span style="float:right;font-size:6.5pt;">Form <strong>1040-NR</strong> (2025)
              </span>
            </div>
            <!-- Page 2 -->
            <div style="width:187mm;padding-top:.5mm;">
              <div style="float:right;">
                Version A, Cycle 2
              </div>
            </div>
            <div class="styStdDiv" style="border-bottom:1px solid black;">
              Form 1040-NR (2025)
              <div style="float:right;">Page <strong>2</strong></div>
            </div>
						
						<div class="styStdDiv" style="border-bottom:0px solid black;overflow:visible;">
							<div class="styGenericDiv" style="width:21mm;padding-top:1mm;padding-bottom:1mm;">
								<span style="padding-left:0mm;font-weight:bold;font-size:10pt;padding-bottom:1mm">Tax and</span>
								<span style="padding-left:0mm;font-weight:bold;font-size:10pt;padding-bottom:76mm;">Credits</span>	
							</div>
						<!-- Line 11b -->
						<div class="sty1040NRLN">
							<div class="styLNLeftNumBoxSD" style="padding-left:0mm;">11b</div>
							<div class="sty1040NRDesc">
								Amount from line 11a (adjusted gross income)
								<span class="sty1040NRDotLn" style="padding-right:0px;
									margin-right:8px;">...............</span>
							</div>
							<div class="sty1040NRRightNumBox">11b</div>
							<div class="sty1040NRAmountBox">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" 
									select="$FormData/AdjustedGrossIncomeAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<!-- Line 12 -->
						<div class="sty1040NRLN">
							<div class="styLNLeftNumBoxSD" style="border-left:2px solid white;
								padding-left:0mm;margin-left:-2px;margin-right:2px;">12</div>
							<div class="sty1040NRDesc" style="padding-top:0.7mm;height:7.5mm">
								<strong>Itemized deductions</strong> (from Schedule A (Form 1040-NR)) or, for certain residents of India, standard deduction (see instructions)
								<xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode"
									select="$FormData/WithholdingTxFrom1042SAmt"/>
								</xsl:call-template>
								<span style="width:.5mm"/><span class="sty1040NRDotLn">.................</span>
							</div>
							<div class="sty1040NRRightNumBox"
								style="height:7.5mm;padding-top:3.5mm">12</div>
							<div class="sty1040NRAmountBox" style="height:7.5mm;padding-top:3.5mm">
								<xsl:choose>
									<xsl:when test="$FormData/IndiaStandardDedTaxTreatyGrp">
										<span style="float:left;">
											<xsl:call-template name="LinkToLeftoverDataTableInline">
												<xsl:with-param name="TargetNode" 
						select="$FormData/IndiaStandardDedTaxTreatyGrp/IndiaStandardDedTaxTreatyCd"/>
												<xsl:with-param name="Desc">Line 12 - India Standard Deduction Tax Treaty Code</xsl:with-param>
											</xsl:call-template>
										</span>
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" 
						select="$FormData/IndiaStandardDedTaxTreatyGrp/IndiaStandardDedTaxTreatyAmt"/>
										</xsl:call-template>
									</xsl:when>
									<xsl:otherwise>
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" 
												select="$FormData/TotalItemizedDeductionsAmt"/>
										</xsl:call-template>
									</xsl:otherwise>
								</xsl:choose>
							</div>
						</div>
						<!-- Line 13a -->
						<div class="sty1040NRLN">	
							<div class="styLNLeftNumBoxSD"	style="padding-left:0mm;">13a</div>
							<div class="sty1040NRDesc" style="width:86mm;height:4mm;font-size:6.7pt">
								<span style="padding-top:.5mm;">Qualified business income deduction from Form 8995 or Form 8995-A
								</span>	
							</div>
							<div class="sty1040NRRightNumBox" 
								style="padding-left:1mm;height:4mm;">13a</div>
							<div class="sty1040NRAmountBox" style="height:4mm;padding-top:.5mm;">
								<span style="float:left">
									<xsl:call-template name="SetFormLinkInline">
										<xsl:with-param name="TargetNode"
									select="$FormData/QualifiedBusinessIncomeDedAmt"/>
									</xsl:call-template>
								</span>
								<span style="width:0mm"/>
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode"
									select="$FormData/QualifiedBusinessIncomeDedAmt"/>
								</xsl:call-template>
							</div>
							<div class="sty1040NRRightNumBoxNBB" style="background-color:lightgrey;
								height:4mm">&nbsp;</div>
							<div class="sty1040NRAmountBoxNBB" style="height:4mm">&nbsp;</div>
						</div>
						<!-- Line 13b -->
						<!-- NOT IN XML, INTENTIONALLY BLANK -->
						<div class="sty1040NRLN">	
							<div class="styLNLeftNumBoxSD" style="padding-left:3.5mm;">b</div>
							<div class="sty1040NRDesc" style="width:86mm;height:4mm;">
								<span style="padding-top:.3mm;">Exemptions for estates and trusts only (see instructions)
									<span style="width:1.7mm"/>
									<span class="sty1040NRDotLn">...</span>
								</span>	
							</div>
							<div class="sty1040NRRightNumBox" style="padding-left:1mm;height:4mm;">13b
							</div>
							<div class="sty1040NRAmountBox" style="height:4mm;padding-top:.5mm;">
							</div>
							<div class="sty1040NRRightNumBoxNBB" style="background-color:lightgrey;
								height:4mm">&nbsp;</div>
							<div class="sty1040NRAmountBoxNBB" style="height:4mm">&nbsp;</div>
						</div>
						<!-- Line 13c -->
						<div class="sty1040NRLN">	
							<div class="styLNLeftNumBoxSD" 
								style="padding-left:3.5mm;">c</div>
							<div class="sty1040NRDesc" style="width:86mm;height:4mm;">
								<span style="padding-top:0mm;">Additional deductions from Schedule 1-A, line 38
									<xsl:call-template name="SetFormLinkInline">
									  <xsl:with-param name="TargetNode"
										select="$FormData/TotalAdditionalDeductionsAmt"/>
									</xsl:call-template>
									<!--<span style="width:1.5mm"/>-->
									<span class="sty1040NRDotLn" 
										style="padding-right:0px;width:20mm;">.....</span>
								</span>	
							</div>
							<div class="sty1040NRRightNumBox" style="padding-left:1mm;height:4mm;">13c
							</div>
							<div class="sty1040NRAmountBox" style="height:4mm;padding-top:.5mm">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" 
									select="$FormData/TotalAdditionalDeductionsAmt"/>
								</xsl:call-template>
							</div>
							<div class="sty1040NRRightNumBoxNBB" style="background-color:lightgrey;
								height:4mm">&nbsp;</div>
							<div class="sty1040NRAmountBoxNBB" style="height:4mm">&nbsp;</div>
						</div>
						<!-- Line 14 -->
						<div class="sty1040NRLN">
							<div class="styLNLeftNumBoxSD" 
								style="padding-left:0mm;">14</div>
							<div class="sty1040NRDesc">
								Add lines 12 and 13c
								<span class="sty1040NRDotLn">.......................</span>
							</div>
							<div class="sty1040NRRightNumBox">14</div>
							<div class="sty1040NRAmountBox">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/TotalDeductionAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<!-- Line 15 -->
						<div class="sty1040NRLN">
							<div class="styLNLeftNumBox" style="padding-left:0mm;">15</div>
							<div class="sty1040NRDesc" style="padding-top:0mm">
								 Subtract line 14 from line 11b. If zero or less, enter -0-. This is your <strong>taxable income</strong>
								<xsl:call-template name="LinkToLeftoverDataTableInline">
									<xsl:with-param name="Desc">Line 15 - Schedule Q Code</xsl:with-param>
									<xsl:with-param name="TargetNode" select="$FormData/ScheduleQCd"/>
								</xsl:call-template>
								<span class="sty1040NRDotLn">..</span>
							</div>
							<div class="sty1040NRRightNumBox">15</div>
							<div class="sty1040NRAmountBox">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode"
									select="$FormData/TaxableIncomeAmt"/>
								</xsl:call-template>
							</div>
						</div>
	
						<!-- Line 16 -->
						<div class="sty1040NRLN">
							<div class="styLNLeftNumBox" style="padding-left:0mm;padding-top:1mm">16</div>
							<div class="sty1040NRDesc" style="font-size:6.5pt">
								<span style="font-weight:bold;font-family:Verdana;">Tax</span> (see instructions). Check if any from Form(s):
								<span style="font-weight:bold;font-family:Verdana;width:3mm;text-align:center;">1</span>
								<input type="checkbox" class="styCkboxNM"
									aria-label="8814 Indicator">
									<xsl:call-template name="PopulateCheckbox">
										<xsl:with-param name="TargetNode" select="$FormData/Form8814Ind"/>
										<xsl:with-param name="BackupName">F1040NRForm8814Ind
										</xsl:with-param>
									</xsl:call-template>
								</input> 8814
								
								<xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode" select="$FormData/Form8814Ind"/>
								</xsl:call-template>
								<xsl:call-template name="LinkToLeftoverDataTableInline">
									<xsl:with-param name="Desc">Line 16(1) - Child Interest and Dividend Tax Amount</xsl:with-param>
									<xsl:with-param name="TargetNode"
			select="$FormData/Form8814Ind/@childInterestAndDividendTaxAmt"/>
								</xsl:call-template>
								<span style="font-weight:bold;font-family:Verdana;padding-left:0.5mm;
									padding-right:0.5mm">2
								</span>
								<input type="checkbox" class="styCkboxNM" aria-label="4972 Indicator">
									<xsl:call-template name="PopulateCheckbox">
										<xsl:with-param name="TargetNode" select="$FormData/Form4972Ind"/>
										<xsl:with-param name="BackupName">F1040NRForm4972Ind
										</xsl:with-param>
									</xsl:call-template>
								</input> 4972
								<xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode" select="$FormData/Form4972Ind"/>
								</xsl:call-template>
								<span style="font-weight:bold;font-family:Verdana;padding-left:0.5mm;
									padding-right:0.5mm">3
								</span>
								<input type="checkbox" class="styCkboxNM" 
									style="margin-right:1mm;" aria-label="Other Tax Amounts">
									<xsl:call-template name="PopulateCheckbox">
										<xsl:with-param name="TargetNode"
											select="$FormData/OtherTaxAmtInd"/>
										<xsl:with-param name="BackupName">
											F1040NROtherTaxAmtInd</xsl:with-param>
									</xsl:call-template>
								</input>
								<span style="border-bottom:1px solid black;
									width:9mm">
									<xsl:call-template name="SetFormLinkInline">
										<xsl:with-param name="TargetNode" select="$FormData/OtherTaxAmtInd"/>
									</xsl:call-template>
									<xsl:if test="count($FormData/OtherTaxAmtGrp) &lt; 2">
										<xsl:call-template
											name="LinkToLeftoverDataTableInline">
											<xsl:with-param name="Desc">Line 16(3) - Other Tax Amount Code</xsl:with-param>
											<xsl:with-param name="TargetNode"
									 select="$FormData/OtherTaxAmtGrp/OtherTaxAmtCd"/>
										</xsl:call-template>
										<xsl:call-template
											name="LinkToLeftoverDataTableInline">
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
								<xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode"
										select="$FormData/TaxAmt"/>
								</xsl:call-template>
								<xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode"
									select="$FormData/CanadaIncomeTaxTreatyArtXXVCd"/>
								</xsl:call-template>
								<xsl:call-template
											name="LinkToLeftoverDataTableInline">
											<xsl:with-param name="Desc">Canada Income Tax Treaty Article XXV Code</xsl:with-param>
											<xsl:with-param name="TargetNode"
										select="$FormData/CanadaIncomeTaxTreatyArtXXVCd"/>
										</xsl:call-template>
								
							</div>
							<div class="sty1040NRRightNumBox">16</div>
							<div class="sty1040NRAmountBox">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" 
										select="$FormData/TaxAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<!-- Line 17 -->
						<div class="sty1040NRLN">
							<div class="styLNLeftNumBoxSD" style="padding-left:0mm;">17</div>
							<div class="sty1040NRDesc">
								Amount from Schedule 2 (Form 1040), line 3
								<span class="sty1040NRDotLn">................</span>
							</div>
							<div class="sty1040NRRightNumBox">17</div>
							<div class="sty1040NRAmountBox">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" 
									select="$FormData/AdditionalTaxAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<!-- Line 18 -->
						<div class="sty1040NRLN">
							<div class="styLNLeftNumBox" style="padding-left:0mm">18
							</div>
							<div class="sty1040NRDesc">
								Add lines 16 and 17
								<span class="sty1040NRDotLn">........................</span>
							</div>
							<div class="sty1040NRRightNumBox">18</div>
							<div class="sty1040NRAmountBox">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" 
									select="$FormData/TotalTaxBeforeCrAndOthTaxesAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<!-- Line 19 -->
						<div class="sty1040NRLN">
							<div class="styLNLeftNumBox" style="padding-left:0mm">19</div>
							<div class="sty1040NRDesc">
								Child tax credit or credit for other dependents from Schedule 8812 (Form 1040)
								<span class="sty1040NRDotLn" style="padding-right:1px;">.....</span>
							</div>
							<div class="sty1040NRRightNumBox">19</div>
							<div class="sty1040NRAmountBox">
								<span style="float:left;">
									<xsl:call-template name="SetFormLinkInline">
										<xsl:with-param name="TargetNode"
											select="$FormData/CTCODCAmt"/>
									</xsl:call-template>
								</span>
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" 
										select="$FormData/CTCODCAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<!-- Line 20 -->
						<div class="sty1040NRLN">
							<div class="styLNLeftNumBoxSD" style="padding-left:0mm;">20</div>
							<div class="sty1040NRDesc">
								Amount from Schedule 3 (Form 1040), line 8
								<span class="sty1040NRDotLn">................</span>
							</div>
							<div class="sty1040NRRightNumBox">20</div>
							<div class="sty1040NRAmountBox">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" 
									select="$FormData/TotalNonrefundableCreditsAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<!-- Line 21 -->
						<div class="sty1040NRLN">
							<div class="styLNLeftNumBox" style="padding-left:0mm">21</div>
							<div class="sty1040NRDesc">
								Add lines 19 and 20
								<span class="sty1040NRDotLn">........................</span>
							</div>
							<div class="sty1040NRRightNumBox">21</div>
							<div class="sty1040NRAmountBox">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" 
									select="$FormData/TotalCreditsAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<!-- Line 22 -->
						<div class="sty1040NRLN">
							<div class="styLNLeftNumBox" style="padding-left:0mm">22</div>
							<div class="sty1040NRDesc">
								Subtract line 21 from line 18. If zero or less, enter -0-
								<span class="sty1040NRDotLn">.............</span>
							</div>
							<div class="sty1040NRRightNumBox">22</div>
							<div class="sty1040NRAmountBox">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/TaxLessCreditsAmt"/>
								</xsl:call-template>
							</div>
							</div>
              <!-- Line 23a -->
              <div class="sty1040NRLN">
                <div class="styLNLeftNumBoxSD"	style="padding-left:0mm;">23a</div>
                <div class="sty1040NRDesc" style="width:86mm;height:4mm;">
                  Tax on income not effectively connected with a U.S. trade or 
                </div>
                <div class="sty1040NRRightNumBox" style="height:4mm;
                  border-bottom-width:0mm">
                </div>
                <div class="sty1040NRAmountBox" style="height:4mm;border-bottom-width:0mm">
                </div>
                <div class="sty1040NRRightNumBoxNBB" 
                  style="background-color:lightgrey;height:4mm">&nbsp;</div>
                <div class="sty1040NRAmountBoxNBB" style="height:4mm">&nbsp;</div>
              </div>	
              <div class="sty1040NRLN">	
                <div class="styLNLeftNumBoxSD"	style="padding-left:2.8mm;"></div>
                <div class="sty1040NRDesc" style="width:86mm;height:4mm;">
                  <span style="padding-top:0mm;">business from Schedule NEC (Form 1040-NR), line 15<span style="width:3.5mm"/>
                    <span class="sty1040NRDotLn">...</span>
                  </span>	
                </div>
                <div class="sty1040NRRightNumBox" style="padding-left:1mm;height:4mm;">23a
                </div>
                <div class="sty1040NRAmountBox" style="height:4mm;padding-top:.5mm">
                    <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" 
                      select="$FormData/IncomeNotUSBusinessTaxAmt"/>
                  </xsl:call-template>
                </div>
                <div class="sty1040NRRightNumBoxNBB" style="background-color:lightgrey;
                  height:4mm">&nbsp;</div>
                <div class="sty1040NRAmountBoxNBB" style="height:4mm">&nbsp;</div>
              </div>
              <!-- Line 23b -->
              <div class="sty1040NRLN">
                <div class="styLNLeftNumBoxSD"	style="padding-left:3.5mm;">b</div>
                <div class="sty1040NRDesc" style="width:86mm;height:4mm;">
                  Other taxes, including self-employment tax, from Schedule 2 (Form  
                </div>
                <div class="sty1040NRRightNumBox" style="height:4mm;
                  border-bottom-width:0mm">
                </div>
                <div class="sty1040NRAmountBox" style="height:4mm;border-bottom-width:0mm">
                </div>
                <div class="sty1040NRRightNumBoxNBB" 
                  style="background-color:lightgrey;height:4mm">&nbsp;</div>
                <div class="sty1040NRAmountBoxNBB" style="height:4mm">&nbsp;</div>
              </div>	
              <div class="sty1040NRLN">	
                <div class="styLNLeftNumBoxSD"	style="padding-left:2.8mm;"></div>
                <div class="sty1040NRDesc" style="width:86mm;height:4mm;">
                  <span style="padding-top:0mm;">1040), line 21<span style="width:3.5mm"/>
                    <span class="sty1040NRDotLn">................</span>
                  </span>	
                </div>
                <div class="sty1040NRRightNumBox" style="padding-left:1mm;height:4mm;">23b
                </div>
                <div class="sty1040NRAmountBox" style="height:4mm;padding-top:.5mm">
                    <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" 
                      select="$FormData/TotalOtherTaxesAmt"/>
                  </xsl:call-template>
                </div>
                <div class="sty1040NRRightNumBoxNBB" style="background-color:lightgrey;
                  height:4mm">&nbsp;</div>
                <div class="sty1040NRAmountBoxNBB" style="height:4mm">&nbsp;</div>
              </div>
              <!-- Line 23c -->
              <div class="sty1040NRLN">	
                <div class="styLNLeftNumBoxSD" style="padding-left:3.5mm;">c</div>
                <div class="sty1040NRDesc" style="width:86mm;height:4mm;">
                  <span style="padding-top:0mm;">Transportation tax (see instructions)
                    <xsl:call-template name="SetFormLinkInline">
                      <xsl:with-param name="TargetNode"
                        select="$FormData/TotalUSSourceGrossTransIncmAmt"/>
                    </xsl:call-template>
                    <xsl:call-template name="SetFormLinkInline">
                      <xsl:with-param name="TargetNode"
                        select="$FormData/TotalUSSourceGrossTransIncmAmt"/>
                    </xsl:call-template>
                    <span style="width:0mm"/>
                    <span class="sty1040NRDotLn">........</span>
                  </span>	
                </div>
                <div class="sty1040NRRightNumBox" style="padding-left:1mm;height:4mm;">23c
                </div>
                <div class="sty1040NRAmountBox" style="height:4mm;padding-top:.5mm">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode"
                    select="$FormData/TotalUSSourceGrossTransIncmAmt"/>
                  </xsl:call-template>
                </div>
                <div class="sty1040NRRightNumBoxNBB" style="background-color:lightgrey;
                  height:4mm">&nbsp;</div>
                <div class="sty1040NRAmountBoxNBB" style="height:4mm">&nbsp;</div>
              </div>
              <!-- Line 23d -->
              <div class="sty1040NRLN">	
                <div class="styLNLeftNumBoxSD" style="padding-left:3.5mm;">d</div>
                <div class="sty1040NRDesc" style="height:4mm;">
                  <span style="padding-top:0mm;">Add lines 23a through 23c 
                    <span style="width:1.5mm"/>
                    <span class="sty1040NRDotLn"	style="padding-right:0px;
                      width:28mm;">......................	</span>
                  </span>	
                </div>
                <div class="sty1040NRRightNumBox" style="padding-left:1mm;height:4mm;">23d
                </div>
                <div class="sty1040NRAmountBox" style="height:4mm;padding-top:.5mm">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" 
                    select="$FormData/TotalNECTransOtherTaxAmt"/>
                  </xsl:call-template>
                </div>
              </div>
              <!-- Line 24 -->
              <div class="sty1040NRLN">
                <div class="styLNLeftNumBox" style="padding-left:0mm">24</div>
                <div class="sty1040NRDesc">
                  Add lines 22 and 23d. This is your <strong>total tax </strong> 

                  <xsl:call-template name="LinkToLeftoverDataTableInline">
                    <xsl:with-param name="Desc">Line 24 – Expatriation Code</xsl:with-param>
                    <xsl:with-param name="TargetNode" 	
                    select="$FormData/ExpatriationCd"/>
                  </xsl:call-template>
                  <span class="sty1040NRDotLn" style="padding-right:0px;margin-right:8px;">................</span>
                </div>
                <div class="sty1040NRRightNumBox" style="border-bottom:0mm">24</div>
                <div class="sty1040NRAmountBox" style="border-bottom:0mm">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$FormData/TotalTaxAmt"/>
                  </xsl:call-template>
                </div>
              </div>
              <div class="styStdDiv" style="border-top:1px solid black;overflow:visible;border-bottom:1px solid black">
                <div class="styGenericDiv" style="width:21mm;padding-top:0mm;padding-bottom:1mm;">
                  <span style="padding-left:.5mm;font-weight:bold;font-size:9.5pt;padding-bottom:49.3mm;">Payments and Refundable Credits</span>
                </div>
            </div>
						<!-- Line 25 -->
						<div class="sty1040NRLN">
							<div class="styLNLeftNumBoxSD"	style="padding-left:0mm;">25</div>
							<div class="sty1040NRDesc" style="width:86mm;height:4mm;">
								Federal income tax withheld from: 
							</div>
							<div class="sty1040NRRightNumBox" style="height:4mm;
								border-bottom-width:0mm">
							</div>
							<div class="sty1040NRAmountBox" style="height:4mm;border-bottom-width:0mm">
							</div>
							<div class="sty1040NRRightNumBoxNBB" 
								style="background-color:lightgrey;height:4mm">&nbsp;</div>
							<div class="sty1040NRAmountBoxNBB" style="height:4mm">&nbsp;</div>
						</div>
            <!-- Line 25a -->
						<div class="sty1040NRLN">
							<div class="styLNLeftNumBoxSD"	style="padding-left:3.5mm;">a</div>
							<div class="sty1040NRDesc" style="width:86mm;height:4mm;">Form(s) W-2
								<xsl:call-template name="SetFormLinkInline">
										<xsl:with-param name="TargetNode"
											select="$FormData/FormW2WithheldTaxAmt"/>
									</xsl:call-template>
									<span style="width:.5mm"/>
								<span class="sty1040NRDotLn">................</span>
							</div>
							<div class="sty1040NRRightNumBox" style="padding-left:1mm;height:4mm;">25a
							</div>
							<div class="sty1040NRAmountBox" style="height:4mm;padding-top:.5mm">
									<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" 
										select="$FormData/FormW2WithheldTaxAmt"/>
								</xsl:call-template>
							</div>
							<div class="sty1040NRRightNumBoxNBB" style="background-color:lightgrey;
								height:4mm">&nbsp;</div>
							<div class="sty1040NRAmountBoxNBB" style="height:4mm">&nbsp;</div>
						</div>
            <!-- Line 25b -->
						<div class="sty1040NRLN">	
							<div class="styLNLeftNumBoxSD"	style="padding-left:3.5mm;">b</div>
							<div class="sty1040NRDesc" style="width:86mm;height:4mm;">
								<span style="padding-top:0mm;">Form(s) 1099<span style="width:1.5mm"/>
									<xsl:call-template name="SetFormLinkInline">
										<xsl:with-param name="TargetNode"
											select="$FormData/Form1099WithheldTaxAmt"/>
									</xsl:call-template>
									<span style="width:.5mm"/>
									<span class="sty1040NRDotLn">...............</span>
								</span>	
							</div>
							<div class="sty1040NRRightNumBox" style="padding-left:1mm;height:4mm;">25b
							</div>
							<div class="sty1040NRAmountBox" style="height:4mm;padding-top:.5mm">
									<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" 
										select="$FormData/Form1099WithheldTaxAmt"/>
								</xsl:call-template>
							</div>
							<div class="sty1040NRRightNumBoxNBB" style="background-color:lightgrey;
								height:4mm">&nbsp;</div>
							<div class="sty1040NRAmountBoxNBB" style="height:4mm">&nbsp;</div>
						</div>
            <!-- Line 25c -->
						<div class="sty1040NRLN">	
							<div class="styLNLeftNumBoxSD" style="padding-left:3.5mm;">c</div>
							<div class="sty1040NRDesc" style="width:86mm;height:4mm;">
								<span style="padding-top:0mm;">Other forms (see instructions)
									<xsl:call-template name="SetFormLinkInline">
										<xsl:with-param name="TargetNode"
											select="$FormData/TaxWithheldOtherAmt"/>
									</xsl:call-template>
									<span style="width:.5mm"/>
									<span class="sty1040NRDotLn">..........</span>
								</span>	
							</div>
							<div class="sty1040NRRightNumBox" style="padding-left:1mm;height:4mm;">25c
							</div>
							<div class="sty1040NRAmountBox" style="height:4mm;padding-top:.5mm">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode"
									select="$FormData/TaxWithheldOtherAmt"/>
								</xsl:call-template>
							</div>
							<div class="sty1040NRRightNumBoxNBB" style="background-color:lightgrey;
								height:4mm">&nbsp;</div>
							<div class="sty1040NRAmountBoxNBB" style="height:4mm">&nbsp;</div>
						</div>
            <!-- Line 25d -->
						<div class="sty1040NRLN">	
							<div class="styLNLeftNumBoxSD" style="padding-left:3.5mm;">d</div>
							<div class="sty1040NRDesc" style="height:4mm;">
								<span style="padding-top:0mm;">Add lines 25a through 25c
									<span style="width:2.5mm"/>
									<span class="sty1040NRDotLn"	style="padding-right:0px;
										width:28mm;">......................</span>
								</span>	
							</div>
							<div class="sty1040NRRightNumBox" style="padding-left:1mm;height:4mm;">25d
							</div>
							<div class="sty1040NRAmountBox" style="height:4mm;padding-top:.5mm">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" 
									select="$FormData/WithholdingTaxAmt"/>
								</xsl:call-template>
							</div>
						</div>
            <!-- Line 25e -->
						<div class="sty1040NRLN">	
							<div class="styLNLeftNumBoxSD" style="padding-left:3.5mm;">e</div>
							<div class="sty1040NRDesc" style="height:4mm;">
								<span style="padding-top:0mm;">Form(s) 8805 
									<xsl:call-template name="SetFormLinkInline">
										<xsl:with-param name="TargetNode"
											select="$FormData/WithholdingTxFrom8805Amt"/>
									</xsl:call-template>
									<span style="width:2.5mm"/>
									<span class="sty1040NRDotLn"	style="padding-right:0px;
										width:28mm;">.........................</span>
								</span>	
							</div>
							<div class="sty1040NRRightNumBox" style="padding-left:1mm;height:4mm;">25e
							</div>
							<div class="sty1040NRAmountBox" style="height:4mm;padding-top:.5mm">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" 
									select="$FormData/WithholdingTxFrom8805Amt"/>
								</xsl:call-template>
							</div>
						</div>
            <!-- Line 25f -->
						<div class="sty1040NRLN">	
							<div class="styLNLeftNumBoxSD" style="padding-left:3.5mm;">f</div>
							<div class="sty1040NRDesc" style="height:4mm;">
								<span style="padding-top:0mm;">Form(s) 8288-A
									<xsl:call-template name="SetFormLinkInline">
										<xsl:with-param name="TargetNode"
											select="$FormData/WithholdingTxFrom8288AAmt"/>
									</xsl:call-template>
									<span style="width:3.5mm"/>
									<span class="sty1040NRDotLn"	style="padding-right:0px;
										width:28mm;">........................</span>
								</span>	
							</div>
							<div class="sty1040NRRightNumBox" style="padding-left:1mm;height:4mm;">25f
							</div>
							<div class="sty1040NRAmountBox" style="height:4mm;padding-top:.5mm">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" 
									select="$FormData/WithholdingTxFrom8288AAmt"/>
								</xsl:call-template>
							</div>
						</div>
            <!-- Line 25g -->
						<div class="sty1040NRLN">	
							<div class="styLNLeftNumBoxSD" style="padding-left:3.5mm;">g</div>
							<div class="sty1040NRDesc" style="height:4mm;">
								<span style="padding-top:0mm;">Forms(s) 1042-S 
									<xsl:call-template name="SetFormLinkInline">
										<xsl:with-param name="TargetNode"
											select="$FormData/WithholdingTxFrom1042SAmt"/>
									</xsl:call-template>
									<span style="width:2mm"/>
									<span class="sty1040NRDotLn"	style="padding-right:0px;
										width:28mm;">........................</span>
								</span>	
							</div>
							<div class="sty1040NRRightNumBox" style="padding-left:1mm;height:4mm;">25g
							</div>
							<div class="sty1040NRAmountBox" style="height:4mm;padding-top:.5mm">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" 
									select="$FormData/WithholdingTxFrom1042SAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<!-- Line 26 -->
						<div class="sty1040NRLN">
							<div class="styLNLeftNumBoxSD" style="padding-left:0mm">26</div>
							<div class="sty1040NRDesc">
								2025 estimated tax payments and amount applied from 2024 return
								<xsl:call-template name="LinkToLeftoverDataTableInline">
									<xsl:with-param name="Desc">Line 26 - Divorced Spouse SSN</xsl:with-param>
									<xsl:with-param name="TargetNode" 
									select="$FormData/EstimatedTaxPaymentsAmt/@divorcedSpouseSSN"/>
								</xsl:call-template>
								<xsl:call-template name="LinkToLeftoverDataTableInline">
										<xsl:with-param name="Desc">Line 26 - Divorced Literal Cd</xsl:with-param>
										<xsl:with-param name="TargetNode" 
										select="$FormData/EstimatedTaxPaymentsAmt/@divorcedLiteralCd"/>
									</xsl:call-template>
									<span style="width:2px"/>	
									<xsl:call-template name="SetFormLinkInline">
										<xsl:with-param name="TargetNode"
											select="$FormData/EstimatedTaxPaymentsAmt"/>
									</xsl:call-template>
									<span style="width:2.1mm"/>
									<span class="sty1040NRDotLn">......</span>
							</div>
							<div class="sty1040NRRightNumBox">26</div>
							<div class="sty1040NRAmountBox">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" 
									select="$FormData/EstimatedTaxPaymentsAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<!-- Line 27 -->
						<!-- NOT IN XML. INTENTIONALLY BLANK -->
						<div class="sty1040NRLN">
							<div class="styLNLeftNumBoxSD" style="border-top:0px solid black;
								border-bottom:0px solid black;border-left:2px solid white;margin-left:-2px;
								margin-right:2px;padding-left:0mm;">27</div>
							<div class="sty1040NRDesc" style="width:86mm;padding-top:0.7mm;">
								Reserved for future use 
								<span class="sty1040NRDotLn" style="padding-right:1px;">..............</span>
							</div>
							<div class="sty1040NRRightNumBox">27</div>
							<div class="sty1040NRAmountBox" style="background-color:lightgrey;">
							</div>
							<div class="sty1040NRRightNumBoxNBB" style="background-color:lightgrey;">&nbsp;
							</div>
							<div class="sty1040NRAmountBoxNBB">&nbsp;</div>
						</div>
						<!-- Line 28 -->
						<div class="sty1040NRLN" style="height:7mm;">
							<div class="styLNLeftNumBoxSD" style="padding-left:0mm;height:inherit;">28</div>
							<div class="sty1040NRDesc" style="width:86mm;height:inherit;">
								Additional child tax credit (ACTC) from Schedule 8812 (Form 1040) if you do not want to claim the ACTC, check here
								<span class="sty1040NRDotLn" style="padding-left:12px;float:none;">...</span>
								<div style="height:2.5mm">
                  <input type="checkbox" class="styCkboxNM" style="margin-right:6px;" aria-label="Do not claim ACTC">
                    <xsl:call-template name="PopulateCheckbox">
                      <xsl:with-param name="TargetNode" 
                        select="$FormData/DoNotClaimACTCInd"/>
                      <xsl:with-param name="BackupName">IRS1040NRDoNotClaimACTCInd
                      </xsl:with-param>
                    </xsl:call-template>
                  </input>
                </div>
              </div>
              
							<div class="sty1040NRRightNumBox" style="padding-top:4mm;height:inherit;">28</div>
							<div class="sty1040NRAmountBox" style="padding-top:4mm;height:inherit;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" 
									select="$FormData/AdditionalChildTaxCreditAmt"/>
								</xsl:call-template>
							</div>
							<div class="sty1040NRRightNumBoxNBB" style="background-color:lightgrey;height:inherit;">
								&nbsp;</div>
							<div class="sty1040NRAmountBoxNBB" style="height:inherit;">&nbsp;</div>
						</div>
						<!-- Line 29 -->
						<div class="sty1040NRLN">
							<div class="styLNLeftNumBoxSD" style="padding-left:0mm;">29</div>
							<div class="sty1040NRDesc" style="width:86mm;">
								Credit for amount paid with Form 1040-C
								<span class="sty1040NRDotLn" style="padding-right:1px;">........</span>
							</div>
							<div class="sty1040NRRightNumBox">29</div>
							<div class="sty1040NRAmountBox">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" 
									select="$FormData/PaidWithForm1040CAmt"/>
								</xsl:call-template>
							</div>
							<div class="sty1040NRRightNumBoxNBB" style="background-color:lightgrey;">
								&nbsp;</div>
							<div class="sty1040NRAmountBoxNBB">&nbsp;</div>
						</div>
						<!-- Line 30 -->
						<!-- NOT IN XML. INTENTIOANLLY BLANK -->
						<div class="sty1040NRLN">
							<div class="styLNLeftNumBoxSD" style="padding-left:0mm;">30</div>
							<div class="sty1040NRDesc" style="width:86mm;">
								Refundable adoption credit from Form 8839, line 13
								<!--<span>-->
									<xsl:call-template name="SetFormLinkInline">
										<xsl:with-param name="TargetNode"
										select="$FormData/RefundableAdoptionCreditAmt"/>
									</xsl:call-template>
								<!--</span>-->
								<span class="sty1040NRDotLn" style="padding-right:1px;">....</span>
							</div>
							<div class="sty1040NRRightNumBox">30</div>
							<div class="sty1040NRAmountBox">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" 
										select="$FormData/RefundableAdoptionCreditAmt"/>
								</xsl:call-template>
							</div>
							<div class="sty1040NRRightNumBoxNBB" style="background-color:lightgrey;">
								&nbsp;</div>
							<div class="sty1040NRAmountBoxNBB">&nbsp;</div>
						</div>
						<!-- Line 31 -->
						<div class="sty1040NRLN">
							<div class="styLNLeftNumBoxSD" style="padding-left:0mm;">31</div>
							<div class="sty1040NRDesc" style="width:86mm;">
								Amount from Schedule 3 (Form 1040), line 15
								<span class="sty1040NRDotLn" style="padding-right:1px;">.......</span>
							</div>
							<div class="sty1040NRRightNumBox">31</div>
							<div class="sty1040NRAmountBox">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" 
										select="$FormData/TotalOtherPaymentsRfdblCrAmt"/>
								</xsl:call-template>
							</div>
							<div class="sty1040NRRightNumBoxNBB" style="background-color:lightgrey;">
								&nbsp;</div>
							<div class="sty1040NRAmountBoxNBB">&nbsp;</div>
						</div>
						<!-- Line 32 -->
						<div class="sty1040NRLN">
							<div class="styLNLeftNumBox" style="padding-left:0mm;">32</div>
							<div class="sty1040NRDesc">
								Add lines 28, 29, 30, and 31. These are your <strong>total other payments and refundable credits </strong> 
								<span class="sty1040NRDotLn" style="margin-right:6px;letter-spacing:normal;">.</span>
							</div>
							<div class="sty1040NRRightNumBox">32</div>
							<div class="sty1040NRAmountBox">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" 
									select="$FormData/RefundableCreditsAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<!-- Line 33 -->
						<div class="sty1040NRLN">
							<div class="styLNLeftNumBoxSD" style="padding-left:0mm;
								border-top:0px solid black;border-bottom:0px solid black;
								border-left:2px solid white;margin-left:-2px;margin-right:2px;">33</div>
							<div class="sty1040NRDesc">
								Add lines 25d, 25e, 25f, 25g, 26, and 32. These are your <strong>total payments </strong> 
								<span class="sty1040NRDotLn" style="padding-right:0px;margin-right:8px;">
								    ......
								</span>
							</div>
							<div class="sty1040NRRightNumBoxNBB">33</div>
							<div class="sty1040NRAmountBoxNBB">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/TotalPaymentsAmt"/>
								</xsl:call-template>
							</div>
						</div>
					</div>
					<!-- Refund -->
				<div class="styStdDiv" style="border-top:1px solid black;overflow:visible;">	
					<div class="styGenericDiv" style="width:21mm;height:28mm;">
						<span style="font-weight:bold;font-size:10pt;">Refund</span>
						<br /><br />
						<span style="font-family:Arial;">
							Direct deposit? See instructions.
						</span>
					</div>
					<!-- Line 34 -->
					<div class="sty1040NRLN">
						<div class="styLNLeftNumBox" style="padding-left:0mm">34</div>
						<div class="sty1040NRDesc">
							If line 33 is more than line 24, subtract line 24 from line 33. This is the amount you
							<strong>overpaid </strong> 
						</div>
						<div class="sty1040NRRightNumBox">34</div>
						<div class="sty1040NRAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/OverpaidAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 35a -->
					<div class="sty1040NRLN">
						<div class="styLNLeftNumBox" style="padding-left:0mm">35a</div>
						<div class="sty1040NRDesc">
							Amount of line 34 you want <strong>refunded to you. </strong> If Form 8888 is
							attached, check here
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$FormData/Form8888Ind"/>
							</xsl:call-template>
							<span style="float:right;">
								<span class="sty1040NRDotLn" style="float:none;margin-right:7px;
									letter-spacing:2mm;">.</span>
								<span style="width:2px"/> 
								<input type="checkbox" class="styCkboxNM" style="margin-right:6px;" aria-label="Form 8888 attached">
									<xsl:call-template name="PopulateCheckbox">
										<xsl:with-param name="TargetNode" select="$FormData/Form8888Ind"/>
										<xsl:with-param name="BackupName">IRS1040NRForm8888Ind</xsl:with-param>
									</xsl:call-template>
								</input>
							</span>
						</div>
						<div class="sty1040NRRightNumBox">35a</div>
						<div class="sty1040NRAmountBox">
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
					<!-- Line 35b, 35d -->
					<div class="sty1040NRLN">
						<div class="styLNLeftNumBox">
							b
						</div>
						<div class="sty1040NRDesc">
							<span style="width:25mm;float:left;clear:none;padding-top:0mm">
							   Routing number
							</span>
							<span class="styLNCtrNumBox" style="width:34mm;border-top-width:1px;
								padding-top:0mm;padding-bottom:0mm;font-weight:normal">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$FormData/RoutingTransitNum"/>
								</xsl:call-template>
							</span>
							<span style="width:27px;"/>
							<span style="width:4px;"/>
							<!-- Line 35c -->
							<span class="styBoldText">c</span> Type:
							<span style="width:4px;"/>
							<span><xsl:call-template name="PopulateSpan">
								<xsl:with-param name="TargetNode" select="$FormData/BankAccountTypeCd"/>
							</xsl:call-template>
							<!-- Checkbox  1=checking, 2 = savings -->
							<input type="checkbox" class="styCkboxNM" aria-label="Checking">
								<xsl:call-template name="PopulateEnumeratedCheckbox">
									<xsl:with-param name="TargetNode" select="$FormData/BankAccountTypeCd"/>
									<xsl:with-param name="DisplayedCheckboxValue" select="'1'"/>
									<xsl:with-param name="BackupName">IRS1040NRBankAccountTypeCd[1]</xsl:with-param>
								</xsl:call-template>
							</input>Checking
							
							<input type="checkbox" class="styCkboxNM" style="margin-left:5mm;" aria-label="Savings">
								<xsl:call-template name="PopulateEnumeratedCheckbox">
									<xsl:with-param name="TargetNode" select="$FormData/BankAccountTypeCd"/>
									<xsl:with-param name="DisplayedCheckboxValue" select="'2'"/>
									<xsl:with-param name="BackupName">IRS1040NRBankAccountTypeCd[2]</xsl:with-param>
								</xsl:call-template>
							</input>
							Savings
							</span>
							
						</div>
						<div class="sty1040NRRightNumBoxNBB" style="background-color:lightgrey;">
							&nbsp;</div>
						<div class="sty1040NRAmountBoxNBB" style="background-color:lightgrey">&nbsp;</div>
					</div>
					<!-- Line 35d -->
					<div class="sty1040NRLN">
						<div class="styLNLeftNumBox">
							d
						</div>
						<div class="sty1040NRDesc" style="height:4.4mm;">
							<span style="width:25mm;float:left;clear:none;padding-top:0mm">
							   Account number
							</span>
							<span class="styLNCtrNumBox" style="width:84mm;border-top-width:1px;
								padding-top:0mm;padding-bottom:0mm;font-weight:normal">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$FormData/DepositorAccountNum"/>
								</xsl:call-template>
							</span>
						</div>
						<div class="sty1040NRRightNumBoxNBB" style="height:4.4mm;
							background-color:lightgrey;">&nbsp;</div>
						<div class="sty1040NRAmountBoxNBB" style="height:4.4mm;background-color:lightgrey;">
							&nbsp;</div>
					</div>
					<!-- Line 35e -->
					<div class="sty1040NRLN">
						<div class="styLNLeftNumBox">
							e
						</div>
						<xsl:choose>
						    <xsl:when test="not($FormData/SeparateMailingAddress) or 
								$FormData/SeparateMailingAddress='' or 
								$FormData/SeparateMailingAddress/USAddress='' or
								$FormData/SeparateMailingAddress/USAddress/AddressLine1Txt=''"> 
								<div class="sty1040NRDesc" style="height:auto;">
									<span style="width:123mm;float:left;clear:none;padding-top:0mm;">
									   If you want your refund check mailed to an address outside the United states
									   not shown on page<br/>
									   1, enter it here. <span style="width:101mm;border-bottom:dotted 1px;
									   padding-left:0mm;"></span>
									</span>
							  	</div>
								<div class="sty1040NRRightNumBoxNBB" style="height:7.4mm;
									background-color:lightgrey;">&nbsp;</div>
								<div class="sty1040NRAmountBoxNBB" style="height:7.4mm;
									background-color:lightgrey;">&nbsp;</div>
							</xsl:when>
							<xsl:otherwise>
								<xsl:if test="not($FormData/SeparateMailingAddress)='' or 
								    not($FormData/SeparateMailingAddress/USAddress)=''">
								    <div class="sty1040NRDesc" style="height:auto;"> 
										<span style="width:125mm;float:left;clear:none;padding-top:0mm;">
											If you want your refund check mailed to an address outside the United
											states not shown on page<br/>
											<span style="width:123mm;border-bottom:dotted 1px;padding-left:0mm;">
												1, enter it here. 
												<xsl:choose>
													<xsl:when test="$FormData/SeparateMailingAddress/USAddress">
														<span style="width:4px"/>
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" 
								select="$FormData/SeparateMailingAddress/USAddress/AddressLine1Txt"/>
														</xsl:call-template>
														<span style="width:5px"/>
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" 
								select="$FormData/SeparateMailingAddress/USAddress/AddressLine2Txt"/>
														</xsl:call-template>
														<span style="width:5px"/>
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" 
								select="$FormData/SeparateMailingAddress/USAddress/CityNm"/>
														</xsl:call-template>
														<span style="width:5px"/>
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" 
								select="$FormData/SeparateMailingAddress/USAddress/StateAbbreviationCd"/>
														</xsl:call-template>
														<span style="width:5px"/>
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" 
								select="$FormData/SeparateMailingAddress/USAddress/ZIPCd"/>
														</xsl:call-template>
													</xsl:when>
													<xsl:otherwise>
														<span style="width:4px"/>
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" 
								select="$FormData/SeparateMailingAddress/ForeignAddress/AddressLine1Txt"/>
														</xsl:call-template>
														<span style="width:5px"/>
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" 
								select="$FormData/SeparateMailingAddress/ForeignAddress/AddressLine2Txt"/>
														</xsl:call-template>
														<span style="width:5px"/>
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" 
								select="$FormData/SeparateMailingAddress/ForeignAddress/CityNm"/>
														</xsl:call-template>
														<span style="width:5px"/>
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" 
								select="$FormData/SeparateMailingAddress/ForeignAddress/ProvinceOrStateNm"/>
														</xsl:call-template>
														<span style="width:5px"/>
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" 
								select="$FormData/SeparateMailingAddress/ForeignAddress/CountryCd"/>
														</xsl:call-template>
														<span style="width:5px"/>
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" 
								select="$FormData/SeparateMailingAddress/ForeignAddress/ForeignPostalCd"/>
														</xsl:call-template>
													</xsl:otherwise>
												</xsl:choose>
											</span>
										</span>
									</div>
									<div class="sty1040NRRightNumBoxNBB" style="height:10.4mm;
										background-color:lightgrey;">&nbsp;</div>
									<div class="sty1040NRAmountBoxNBB" style="height:10.4mm;
										background-color:lightgrey;">&nbsp;</div>
								</xsl:if>
							</xsl:otherwise>
						</xsl:choose>
					</div>
					<!-- Line 36 -->
					<div class="sty1040NRLN">
						<div class="styLNLeftNumBox" style="padding-left:0mm;">36</div>
						<div class="sty1040NRDesc" style="width:86mm;">
							<span style="display:inline;font-family:Arial;">Amount of line 34 you want
								<strong>applied to your 2026 estimated tax </strong></span>
							<span class="sty1040NRDotLn" style="padding-right:0px;
								margin-right:8px;">..
							</span>
						</div>
						<div class="sty1040NRRightNumBoxNBB">36</div>
						<div class="sty1040NRAmountBoxNBB">
							<span style="float:left;">
								<xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode" select="$FormData/AppliedToEsTaxAmt"/>
								</xsl:call-template>
							</span>
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/AppliedToEsTaxAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty1040NRRightNumBoxNBB" style="background-color:lightgrey;">&nbsp;
						</div>
						<div class="sty1040NRAmountBoxNBB" style="background-color:lightgrey;">&nbsp;</div>
					</div>
				</div>
					<!-- You Owe -->
					<div style="display:block;width:187mm;border-top:1px solid black;">
						<div class="styGenericDiv" style="width:21mm;height:8mm;">
							<span style="font-weight:bold;font-size:9pt;">Amount <br />You Owe</span>
						</div>
						<!-- Line 37 -->
						<div class="sty1040NRLN">
							<div class="styLNLeftNumBox" style="padding-left:0mm;">37</div>
							<div class="sty1040NRDesc">
								Subtract line 33 from line 24. This is the<strong> amount you owe. </strong><br/>For details on how to pay, go to <span style="font-style:italic;">www.irs.gov/Payments</span> or see instructions
								<xsl:if test="count($FormData/InterestPenaltyTypeAndAmt) &lt; 2">
									<xsl:call-template name="LinkToLeftoverDataTableInline">
										<xsl:with-param name="Desc">Line 37 - Interest Penalty Decription</xsl:with-param>
										<xsl:with-param name="TargetNode" select="$FormData/InterestPenaltyTypeAndAmt/Desc"/>
									</xsl:call-template>
									<xsl:call-template name="LinkToLeftoverDataTableInline">
										<xsl:with-param name="Desc">Line 37 - Interest Penalty Amount</xsl:with-param>
										<xsl:with-param name="TargetNode" select="$FormData/InterestPenaltyTypeAndAmt/Amt"/>
									</xsl:call-template>
								</xsl:if>
								<xsl:if test="count($FormData/InterestPenaltyTypeAndAmt) &gt;= 2">
									<xsl:call-template name="LinkToLeftoverDataTableInline">
										<xsl:with-param name="Desc">Line 37 - Interest Penalty Type And Amt</xsl:with-param>
										<xsl:with-param name="TargetNode" select="$FormData/InterestPenaltyTypeAndAmt"/>
									</xsl:call-template>
								</xsl:if>
								<span class="sty1040NRDotLn" style="padding-right:0px;
								    margin-right:8px;">....</span>
							</div>
							<div class="sty1040NRRightNumBox" style="height:7mm;padding-top:3mm">37</div>
							<div class="sty1040NRAmountBox" style="height:7mm;padding-top:3mm">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/OwedAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<!-- Line 38 -->
						<div class="sty1040NRLN">
							<div class="styLNLeftNumBox" style="padding-left:0mm;">38</div>
							<div class="sty1040NRDesc" style="width:86mm;">
								Estimated tax penalty. (see instructions)
								<span class="sty1040NRDotLn" style="padding-right:0px;margin-right:8px;">
									.......
								</span>
							</div>
							<div class="sty1040NRRightNumBoxNBB">38</div>
							<div class="sty1040NRAmountBoxNBB">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/EsPenaltyAmt"/>
								</xsl:call-template>
							</div>
							<div class="sty1040NRRightNumBoxNBB" style="background-color:lightgrey;">&nbsp;
							</div>
							<div class="sty1040NRAmountBoxNBB" style="background-color:lightgrey;">&nbsp;
							</div>
						</div>
					</div>
					<!-- Third Party -->
					<div style="display:block;width:187mm;border-top:1px solid black;">
						<div class="styGenericDiv" style="width:21mm;height:12mm;border-right:1px solid black;padding-top:1mm">
							<span style="font-weight:bold;font-size:8pt;">Third Party Designee</span>
							<br />
						</div>
						<div style="width:166mm;height:5mm;">
							<span>
                <span style="width:5px"/>Do you want to allow another person to discuss this return with the IRS? See instructions
								<span style="padding-left:7mm;">
									<input type="checkbox" class="styCkboxNM" style="margin-right:2px;vertical-align:middle;" 
										aria-label="Discuss with third party Yes">
										<xsl:call-template name="PopulateYesCheckbox">
											<xsl:with-param name="TargetNode"
											 select="$FormData/ThirdPartyDesigneeInd"/>
											<xsl:with-param name="BackupName">F1040NRThirdPartyDesigneeInd</xsl:with-param>
										</xsl:call-template>
									</input><b>Yes. </b>
									<span> Complete below.</span>
									<span style="width:10px"/>
									<input type="checkbox" class="styCkboxNM" style="margin-right:2px;vertical-align:middle;"
										aria-label="Discuss with third party No">
										<xsl:call-template name="PopulateNoCheckbox">
											<xsl:with-param name="TargetNode"
											 select="$FormData/ThirdPartyDesigneeInd"/>
										<xsl:with-param name="BackupName">F1040NRThirdPartyDesigneeInd</xsl:with-param>
										</xsl:call-template>
									</input><b>No</b>
								</span>	
							</span>
						</div>	
						<div style="width:166mm;height:7mm;">
							<span style="width:16mm;">
								<span style="width:5px"/>Designee's <br /><span style="width:5px"/> name 
							</span>
							<span style="width:54mm;">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$FormData/ThirdPartyDesigneeNm"/>
								</xsl:call-template>
							</span>
							<span style="width:11mm;">
								Phone <br /> no. 
							</span>
							<span>
							<xsl:choose>
								<xsl:when test="$FormData/ThirdPartyDesigneePhoneNum = ''">
									<xsl:call-template name="PopulatePhoneNumber">
										<xsl:with-param name="TargetNode"  select="$FormData/ThirdPartyDesigneePhoneNum"/>
									</xsl:call-template>
								</xsl:when>
								<xsl:otherwise>
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode"  select="$FormData/ThirdPartyDesigneeFrgnPhoneNum"/>
									</xsl:call-template>
								</xsl:otherwise>
							</xsl:choose>	
							</span>
							<span style="float:right;">
								Personal identification <br /> number (PIN) 
								<span>
                  <xsl:call-template name="PopulatePin">
                    <xsl:with-param name="TargetNode" select="$FormData/ThirdPartyDesigneePIN"/>
                  </xsl:call-template>
								</span>
							</span>
						</div>
					</div>
					<!-- Sign Here -->
					<div style="display:block;width:187mm;border-top:1px solid black;">
						<div class="styGenericDiv" style="width:21mm;height:24mm;border-right:1px solid black;">
							<span style="height:inherit;font-weight:bold;font-size:12pt;align-content:center;">Sign<br /> Here</span>
						</div>
						<div style="float:left;clear:none;width:163mm;height:17mm;padding-left:1.5mm;">
							<div style="width:163mm;font-size:6.5pt;font-family:Arial;float:left;clear:none;">
								Under penalties of perjury, I declare that I have examined this return and
								accompanying schedules and statements, and to the best of my knowledge and belief,
								they are true, correct, and complete. Declaration of preparer (other than taxpayer) is 
								based on all information of which preparer has any knowledge.
							</div>
							<div style="width:163mm;float:left;clear:none;"/>
							<div class="styBB" style="width:163mm;float:left;clear:none;border-bottom:0mm">
								<div style="width:70mm;float:left;clear:none;padding-top:2mm">
									<div class="styFNBox" style="width:70mm;float:left;clear:none;">
									  Your signature
									</div>
									<div class="styFNBox" style="height:7mm;width:70mm;padding-top:1.5mm;
										float:left;clear:none;">
										<xsl:call-template name="PopulatePin">
											<xsl:with-param name="TargetNode"
											 select="$RtnHdrData/PrimarySignaturePIN"/>
										</xsl:call-template>
									</div>
								</div>
								<div class="styFNBox" style="width:18mm;float:left;clear:none;padding-top:2mm">
									<div style="width:16mm;padding-left:2mm;float:left;clear:none;">
										  Date
									</div>
									<div style="height:7mm;width:18mm;padding-top:1.5mm;text-align:center;
										float:left;clear:none;font-size:7pt;">
										<xsl:call-template name="PopulateMonthDayYear">
											<xsl:with-param name="TargetNode" 
											select="$RtnHdrData/PrimarySignatureDt"/>
										</xsl:call-template>
									</div>
								</div>
								<div class="styFNBox" style="width:36mm;float:left;clear:none;padding-top:2mm">
									<div style="width:36.8mm;padding-left:2mm;float:left;clear:none;">
									   Your occupation
									</div>
									<div style="height:7mm;width:36mm;padding-top:1.5mm;padding-left:2mm;
										float:left;clear:none;font-family:Arial;">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" 
											select="$FormData/PrimaryOccupationTxt"/>
										</xsl:call-template>
									</div>
								</div>
								<div style="width:35mm;float:left;clear:none;padding-top:2mm">
									<div class="styGenericDiv" style="height:11mm;width:38.5mm;border-left-width:0px;
										font-size:7pt;">
										<span style="width:100%;padding-left:4px;font-family:Arial-Narrow;">If the IRS
											sent you an Identity Protection PIN, enter it here 
										</span><br/>
										<span style="width:40%;padding-left:4px;font-family:Arial-Narrow;float:left;">
											(see inst.)<span style="width:4px"/>
										</span>
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
							</div>
							<div style="width:166mm;float:left;clear:none;border-top:1px solid black;
								height:7mm;padding-top:0mm;">
								<div style="width:73.6mm;float:left;font-size:7pt;padding-top:.2mm;padding-left:2mm">
									Phone no. 
									<span style="width:4px;"/>
									<xsl:if test="$RtnHdrData/Filer/PhoneNum">
										<xsl:call-template name="PopulatePhoneNumber">
											<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/PhoneNum"/>
										</xsl:call-template>
									</xsl:if>
									<xsl:if test="$RtnHdrData/Filer/ForeignPhoneNum">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" 
											select="$RtnHdrData/Filer/ForeignPhoneNum"/>
										</xsl:call-template>
									</xsl:if>
								</div>
								<div style="width:88.5mm;float:left;padding-left:2mm;font-size:7pt;
									border-left:1px solid black;height:7mm;">
									Email address 
									<span style="width:4px;"/> 
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" 
						select="$RtnHdrData/AdditionalFilerInformation/AtSubmissionFilingGrp/EmailAddressTxt"/>
									</xsl:call-template>
								</div>
							</div>
						<!--</div>-->
					</div>
					<!-- Paid preparer -->
					<div style="width:187mm;font-size:7pt;float:none;clear:both;
						border-top:1px solid black;">
						<div style="width:21mm;padding-top:4mm;float:left;clear:none;border-right:1px solid black;height:24.3mm;">
							<span class="styMainTitle" style="font-size:12pt;">
								Paid
								Preparer
								Use Only
							</span>
						</div>
						<div style="width:166mm;float:left;clear:none;display:block;">
							<div style="width:166mm;float:left;clear:none;border-style:solid;border-color:black;
								border-width:0px 0px 1px 0px;">
								<div class="styFNBox" style="height:9.8mm;width:52mm;padding-top:0mm;
									border-right:1 solid black;padding-left:5px">
									<span style="display:inline;font-size:7pt;">
										Preparer's name</span><br/>
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode"
										 select="$RtnHdrData/PaidPreparerInformationGrp/PreparerPersonNm"/>
									</xsl:call-template>
								</div>
								<div class="styFNBox" style="height:9.8mm;width:41mm;padding-top:0mm;
									border-right:1 solid black;padding-left:1mm;font-size:7pt;">
									Preparer's signature
								</div>
								<div class="styFNBox" style="height:9.8mm;width:22mm;padding-top:0mm;
									padding-left:1mm;border-right:1 solid black;">
									<span style="font-size:7pt;">Date</span>
									<br />
									<xsl:call-template name="PopulateReturnHeaderPaidPreparerInformation">
										<xsl:with-param name="TargetNode">DateSigned</xsl:with-param>
									</xsl:call-template>
								</div>
								<div class="styFNBox" style="height:9.8mm;width:20mm;padding-left:1mm;">
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
								<div class="styLNDesc" style="height:9.8mm;width:29mm;padding-top:.5mm;
									padding-bottom:0mm;padding-left:1mm;font-family:Arial;">
									<span style="font-size:7pt;">Check if:</span><br/>

										<input class="styCkbox" type="checkbox" aria-label="Self Employed Ind">
											<xsl:call-template name="PopulateCheckbox">
												<xsl:with-param name="TargetNode"
												 select="$RtnHdrData/PaidPreparerInformationGrp/SelfEmployedInd"/>
												<xsl:with-param name="BackupName">$RtnHdrDataPaidPreparerInformationSelfEmployed</xsl:with-param>
											</xsl:call-template>
										</input>
										<span style="width:4px;"/>Self-employed
									
								</div>
							</div>
							<div style="width:164mm;height:auto;float:left;clear:none;border-style:solid;
								border-color:black;border-width:0px 0px 0px 0px;">
								<div class="styFNBox" style="height:7.5mm;width:124mm;
									border-right:1px solid black;padding-left:8px;">
									<span style="padding-top:.5mm;padding-right:.5mm">
										Firm's name 
										<span style="width:1mm"/>
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" 
			select="$RtnHdrData/PaidPreparerInformationGrp/PreparerFirmName/BusinessNameLine1Txt"/>
										</xsl:call-template>
										<span style="width:2px"/>
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" 
			select="$RtnHdrData/PaidPreparerInformationGrp/PreparerFirmName/BusinessNameLine2Txt"/>
										</xsl:call-template>
									</span>
								</div>
								<div class="styFNBox" style="height:7.5mm;width:40mm;padding-left:1mm;
									padding-top:.5mm;border-right:0px solid black;word-break:break-all;"> Phone no. 
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" 
								select="$RtnHdrData/PaidPreparerInformationGrp/PhoneNum"/>
									</xsl:call-template>
								</div>
							</div>
							<div style="width:164mm;border-top:1px solid black;
								border-right-width:0px;float:left;clear:none;height:auto;">
								<div class="styFNBox" style="width:124mm;min-height:6.5mm;
									border-right:1px solid black;padding-left:8px;">
									<span style="padding-right:.5mm;padding-top:.5mm;">
										Firm's address 
										<span style="width:1mm"/>
										<xsl:if test="$RtnHdrData/PaidPreparerInformationGrp/PreparerUSAddress">
											<xsl:call-template name="PopulateReturnHeaderPaidPreparerInformation">
												<xsl:with-param name="TargetNode">AddressLine1Txt</xsl:with-param>
											</xsl:call-template>
											<span style="width:4px"/>
											<xsl:call-template name="PopulateReturnHeaderPaidPreparerInformation">
												<xsl:with-param name="TargetNode">AddressLine2Txt</xsl:with-param>
											</xsl:call-template>
											<span style="width:4px"/>
											<xsl:call-template name="PopulateReturnHeaderPaidPreparerInformation">
												<xsl:with-param name="TargetNode">CityNm</xsl:with-param>
											</xsl:call-template>
											<span style="width:4px;"/>
											<xsl:call-template name="PopulateReturnHeaderPaidPreparerInformation">
												<xsl:with-param name="TargetNode">StateAbbreviationCd</xsl:with-param>
											</xsl:call-template>
											<span style="width:4px;"/>
											<xsl:call-template name="PopulateReturnHeaderPaidPreparerInformation">
												<xsl:with-param name="TargetNode">ZIPCd</xsl:with-param>
											</xsl:call-template>
										</xsl:if>
										<xsl:if test="$RtnHdrData/PaidPreparerInformationGrp/PreparerForeignAddress">
                      <xsl:call-template name="PopulateReturnHeaderPaidPreparerInformation">
												<xsl:with-param name="TargetNode">AddressLine1Txt</xsl:with-param>
											</xsl:call-template>
											<span style="width:4px"/>
											<xsl:call-template name="PopulateReturnHeaderPaidPreparerInformation">
												<xsl:with-param name="TargetNode">AddressLine2Txt</xsl:with-param>
											</xsl:call-template>
											<span style="width:4px"/>
											<xsl:call-template name="PopulateReturnHeaderPaidPreparerInformation">
												<xsl:with-param name="TargetNode">CityNm</xsl:with-param>
											</xsl:call-template>
											<span style="width:4px;"/>
											<xsl:call-template name="PopulateReturnHeaderPaidPreparerInformation">
												<xsl:with-param name="TargetNode">ProvinceOrStateNm</xsl:with-param>
											</xsl:call-template>
											<span style="width:4px;"/>
											<xsl:call-template name="PopulateReturnHeaderPaidPreparerInformation">
												<xsl:with-param name="TargetNode">ForeignPostalCd</xsl:with-param>
											</xsl:call-template>
											<span style="width:4px;"/>
											<xsl:call-template name="PopulateReturnHeaderPaidPreparerInformation">
												<xsl:with-param name="TargetNode">CountryCd</xsl:with-param>
											</xsl:call-template>
										</xsl:if>
									</span>
								</div>
								<div class="styFNBox" style="width:40mm;border-right-width:0px;">
								<div class="styGenericDiv" style="padding-right:.5mm;padding-left:0.5mm;
									padding-top:.5mm">Firm's EIN 
								</div>
								<div class="styGenericDiv" style="padding-right:.5mm;padding-left:0.5mm;
									padding-top:.5mm">
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
				<div class="styStdDiv pageEnd" style="border-top:2px solid black;">
					Go to <span style="font-style:italic">www.irs.gov/Form1040NR </span> for instructions and
					the latest information.
					<span style="float:right;font-size:6.5pt;">Form <strong>1040-NR</strong> (2025)</span>
				</div>
				<!-- Additional Data title bar and button -->
				<div class="styLeftOverTitleLine" id="LeftoverData">
					<div class="styLeftOverTitle">
						Additional Data        
					</div>
					<div class="styLeftOverButtonContainer">
						<input class="styLeftoverTableBtn" type="button" TabIndex="-1" value="Return to Form"
							onclick="javascript:returnToWriteInImage();"/>
					</div>
				</div>
				<!-- Additional Data table -->
				<table class="styLeftOverTbl">
					<xsl:call-template name="PopulateCommonLeftover">
						<xsl:with-param name="TargetNode" select="$FormData"/>
					</xsl:call-template>
					<!-- Special Condition Desc separate repeating -->
					<xsl:if test="count($FormData/SpecialConditionDesc) &lt; 2">
						<xsl:call-template name="PopulateLeftoverRow">
							<xsl:with-param name="Desc">Top Right Margin - Special Condition Description</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$FormData/SpecialConditionDesc"/>
						</xsl:call-template>
					</xsl:if>
					<!--<xsl:call-template name="PopulateLeftoverRow">
						<xsl:with-param name="Desc">Top Right Margin - Primary Date Of Death</xsl:with-param>
						<xsl:with-param name="TargetNode" select="$FormData/PrimaryDeathDt"/>
					</xsl:call-template>
					<xsl:call-template name="PopulateLeftoverRow">
						<xsl:with-param name="Desc">Top Right Margin - Spouse Date Of Death</xsl:with-param>
						<xsl:with-param name="TargetNode" select="$FormData/SpouseDeathDt"/>
					</xsl:call-template>-->
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
            <xsl:with-param name="Desc">Combat Zone Text</xsl:with-param>
            <xsl:with-param name="TargetNode" 
              select="$FormData/CombatZoneTxt"/>
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
						<xsl:with-param name="Desc">Filing Status - Protective Return Ind</xsl:with-param>
						<xsl:with-param name="TargetNode" select="$FormData/ProtectiveReturnInd"/>
					</xsl:call-template>
					<xsl:call-template name="PopulateLeftoverRow">
						<xsl:with-param name="Desc">Header - Primary Name Control</xsl:with-param>
						<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/PrimaryNameControlTxt"/>
					</xsl:call-template>
					<xsl:call-template name="PopulateLeftoverRow">
						<xsl:with-param name="Desc">Header - In Care Of Name</xsl:with-param>
						<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/InCareOfNm"/>
					</xsl:call-template>
					<xsl:call-template name="PopulateLeftoverRow">
						<xsl:with-param name="Desc">Standard Deduction - Exempt Spouse Name</xsl:with-param>
						<xsl:with-param name="TargetNode" select="$FormData/ExemptSpouseNm"/>
					</xsl:call-template>
					<xsl:call-template name="PopulateLeftoverRow">
						<xsl:with-param name="Desc">Standard Deduction - Exempt Spouse Name Control</xsl:with-param>
						<xsl:with-param name="TargetNode" select="$FormData/ExemptSpouseNameControlTxt"/>
					</xsl:call-template>
          <xsl:for-each select="$FormData/DependentDetail">
            <xsl:call-template name="PopulateLeftoverRow">
              <xsl:with-param name="Desc">Dependent <xsl:number value="position()" format="1"/> Name Control</xsl:with-param>
              <xsl:with-param name="TargetNode" select="DependentNameControlTxt"/>
            </xsl:call-template>
          </xsl:for-each>
					<xsl:call-template name="PopulateLeftoverRow">
						<xsl:with-param name="Desc">Total Exemption Primary and Spouse Cnt</xsl:with-param>
						<xsl:with-param name="TargetNode" select="$FormData/TotalExemptPrimaryAndSpouseCnt"/>
					</xsl:call-template>
					<xsl:call-template name="PopulateLeftoverRow">
						<xsl:with-param name="Desc">Child Who Lived With You Cnt</xsl:with-param>
						<xsl:with-param name="TargetNode" select="$FormData/ChldWhoLivedWithYouCnt"/>
					</xsl:call-template>
					<xsl:call-template name="PopulateLeftoverRow">
						<xsl:with-param name="Desc">Other Dependents Listed Cnt</xsl:with-param>
						<xsl:with-param name="TargetNode" select="$FormData/OtherDependentsListedCnt"/>
					</xsl:call-template>
					<xsl:call-template name="PopulateLeftoverRow">
						<xsl:with-param name="Desc">Total Exemptions Cnt</xsl:with-param>
						<xsl:with-param name="TargetNode" select="$FormData/TotalExemptionsCnt"/>
					</xsl:call-template>
					
					<!-- WagesNotShownGrp separate repeating -->
					<xsl:if test="count($FormData/WagesNotShownGrp) &lt; 2">
						<xsl:call-template name="PopulateLeftoverRow">
							<xsl:with-param name="Desc">Line 1h - Wages Literal Code</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$FormData/WagesNotShownGrp/WagesLiteralCd"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRow">
							<xsl:with-param name="Desc">Line 1h - Other Wages Not Shown Text</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$FormData/WagesNotShownGrp/OtherWagesNotShownTxt"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRowAmount">
							<xsl:with-param name="Desc">Line 1h - Wages Not Shown Amt</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$FormData/WagesNotShownGrp/WagesNotShownAmt"/>
						</xsl:call-template>
					</xsl:if>
					<xsl:if test="$FormData/OtherIRATypeTxt">
            <xsl:call-template name="PopulateLeftoverRowAmount">
              <xsl:with-param name="Desc">Line 4c - Other IRA Type Text</xsl:with-param>
              <xsl:with-param name="TargetNode" select="$FormData/OtherIRATypeTxt"/>
            </xsl:call-template>
          </xsl:if>
          <xsl:if test="$FormData/PensionsAnnuitiesOtherTypeTxt">
            <xsl:call-template name="PopulateLeftoverRowAmount">
              <xsl:with-param name="Desc">Line 5c - Pensions Annuities Other Text</xsl:with-param>
              <xsl:with-param name="TargetNode" select="$FormData/PensionsAnnuitiesOtherTypeTxt"/>
            </xsl:call-template>
          </xsl:if>
					<xsl:call-template name="PopulateLeftoverRow">
            <xsl:with-param name="Desc">Line 7b - Form 8814 Amount</xsl:with-param>
            <xsl:with-param name="TargetNode" select="$FormData/Form8814Amt"/>
          </xsl:call-template>
					<xsl:call-template name="PopulateLeftoverRow">
						<xsl:with-param name="Desc">Line 11 - Excluded Sect 933 Puerto Rico Income Code</xsl:with-param>
						<xsl:with-param name="TargetNode" select="$FormData/ExcldSect933PuertoRicoIncmAmt/@excldSect933PuertoRicoIncmCd"/>
					</xsl:call-template>
					<xsl:call-template name="PopulateLeftoverRowAmount">
						<xsl:with-param name="Desc">Line 11 - Excluded Sect 933 Puerto Rico Income Amount</xsl:with-param>
						<xsl:with-param name="TargetNode" 
						select="$FormData/ExcldSect933PuertoRicoIncmAmt"/>
					</xsl:call-template>
					<xsl:call-template name="PopulateLeftoverRow">
						<xsl:with-param name="Desc">Line 12 - Modified Standard Deduction Ind</xsl:with-param>
						<xsl:with-param name="TargetNode" select="$FormData/TotalItemizedOrStandardDedAmt/@modifiedStandardDeductionInd"/>
					</xsl:call-template>
					<xsl:call-template name="PopulateLeftoverRow">
						<xsl:with-param name="Desc">Line 12 - India Standard Deduction Tax Treaty Code</xsl:with-param>
						<xsl:with-param name="TargetNode" 
							select="$FormData/IndiaStandardDedTaxTreatyGrp/IndiaStandardDedTaxTreatyCd"/>
					</xsl:call-template>
					<xsl:call-template name="PopulateLeftoverRowAmount">
						<xsl:with-param name="Desc">Line 12 - India Standard Deduction Tax Treaty Amount</xsl:with-param>
						<xsl:with-param name="TargetNode"
							select="$FormData/TaxableIncomeAmt/IndiaStandardDedTaxTreatyAmt"/>
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
					<xsl:call-template name="PopulateLeftoverRow">
						<xsl:with-param name="Desc">Line 16 - Canada Income Tax Treaty Article XXV Code</xsl:with-param>
						<xsl:with-param name="TargetNode" select="$FormData/CanadaIncomeTaxTreatyArtXXVCd"/>
					</xsl:call-template>
					<xsl:call-template name="PopulateLeftoverRowAmount">
						<xsl:with-param name="Desc">Line 16(1) - Child Interest and Dividend Tax Amount</xsl:with-param>
						<xsl:with-param name="TargetNode" select="$FormData/Form8814Ind/@childInterestAndDividendTaxAmt"/>
					</xsl:call-template>
					<!-- OtherTaxAmtGrp separate repeating -->
					<xsl:if test="count($FormData/OtherTaxAmtGrp) &lt; 2">
						<xsl:call-template name="PopulateLeftoverRow">
							<xsl:with-param name="Desc">Line 16(3) - Other Tax Amount Code</xsl:with-param>
							<xsl:with-param name="TargetNode" 
								select="$FormData/OtherTaxAmtGrp/OtherTaxAmtCd"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRowAmount">
							<xsl:with-param name="Desc">Line 16(3) - Other Tax Amount</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$FormData/OtherTaxAmtGrp/OtherTaxAmt"/>
						</xsl:call-template>
					</xsl:if>
					<xsl:call-template name="PopulateLeftoverRow">
						<xsl:with-param name="Desc">Line 24 – Expatriation Code</xsl:with-param>
						<xsl:with-param name="TargetNode" select="$FormData/ExpatriationCd"/>
					</xsl:call-template>
					<xsl:if test="$FormData/EstimatedTaxPaymentsAmt/@divorcedSpouseSSN">
						<tr>
							<td class="styLeftOverTableRowDesc" style="width:100mm;" scope="row">Line 26 - Divorced Spouse SSN:</td>
							<td class="styLeftOverTableRowAmount" style="width:87mm;">
								<xsl:call-template name="PopulateSSN">
									<xsl:with-param name="TargetNode" select="$FormData/EstimatedTaxPaymentsAmt/@divorcedSpouseSSN"/>
								</xsl:call-template>
							</td>                          
						</tr>
					</xsl:if>
					<xsl:call-template name="PopulateLeftoverRow">
						<xsl:with-param name="Desc">Line 26 - Divorced Literal Cd</xsl:with-param>
						<xsl:with-param name="TargetNode" select="$FormData/EstimatedTaxPaymentsAmt/@divorcedLiteralCd"/>
					</xsl:call-template>
					<xsl:call-template name="PopulateLeftoverRow">
						<xsl:with-param name="Desc">Line 32 - Form 8689 Code</xsl:with-param>
						<xsl:with-param name="TargetNode" select="$FormData/TotalPaymentsAmt/@form8689Cd"/>
					</xsl:call-template>
					<xsl:call-template name="PopulateLeftoverRowAmount">
						<xsl:with-param name="Desc">Line 32 - Form 8689 Amount</xsl:with-param>
						<xsl:with-param name="TargetNode" select="$FormData/TotalPaymentsAmt/@form8689Amt"/>
					</xsl:call-template>
					<!-- Interest Penalty Type And Amount separate repeating -->
					<xsl:if test="count($FormData/InterestPenaltyTypeAndAmt) &lt; 5">
						<xsl:call-template name="PopulateLeftoverRow">
							<xsl:with-param name="Desc">Line 37 - Interest Penalty Description</xsl:with-param>
							<xsl:with-param name="TargetNode" 
								select="$FormData/InterestPenaltyTypeAndAmt/Desc"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRowAmount">
							<xsl:with-param name="Desc">Line 37 - Interest Penalty Amount</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$FormData/InterestPenaltyTypeAndAmt/Amt"/>
						</xsl:call-template>
					</xsl:if>
				</table>
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
					<span class="styRepeatingDataTitle">Form 1040NR - Dependents (see instructions):</span>
					<table class="styDepTbl" cellspacing="0" style="font-size:7pt;">
						<thead class="styTableThead">
							<tr class="styDepTblHdr">
                <th class="styDepTblCell" scope="col" style="width:67.4mm;text-align:left;padding-left:1mm;padding-top:0mm;">
                  &nbsp;
								</th>
								<th class="styDepTblCell" scope="col" style="width:45mm;text-align:left;padding-left:1mm;">
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
										<b>(5) </b> Check if lived with you more than half of 2025
                  </span>
								</th>
								<th class="styDepTblCell" scope="col" style="width:28.6mm;font-weight:normal;">
                  <span style="font-weight:normal;">
										<b>(6)</b><span style="width:.5mm"/>
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
                    Yes<span style="width:2px;"/>
										<input type="Checkbox" class="styCkboxNM">
											<xsl:call-template name="PopulateCheckbox">
												<xsl:with-param name="TargetNode" select="YesLiveWithChildOverHalfYrInd"/>
												<xsl:with-param name="BackupName">IRS1040NRDependentInformation<xsl:number value="position()"/>YesLiveWithChildOverHalfYrInd</xsl:with-param>
											</xsl:call-template>
											<xsl:attribute name="aria-label">Live With Child <xsl:number value="position()"/> Over Half Year</xsl:attribute>
										</input>
									</td>
									<td class="styTableCellCtrInherit">
                    <input type="Checkbox" class="styCkbox">
											<xsl:call-template name="PopulateCheckbox">
												<xsl:with-param name="TargetNode" select="EligibleForODCInd"/>
												<xsl:with-param name="BackupName">IRS1040NRDependentInformation<xsl:number value="position()"/>EligibleForODCInd</xsl:with-param>
											</xsl:call-template>
											<xsl:attribute name="aria-label">Dependent <xsl:number value="position()"/> Eligible for ODC Indicator</xsl:attribute>
										</input>
										<br/>
										Child tax credit
										<div style="width:100%;border-bottom:1px solid black;padding-bottom:0.5mm;"/>
										<input type="Checkbox" class="styCkbox" style="margin-left:1mm;border-left:1px solid black;">
											<xsl:call-template name="PopulateCheckbox">
												<xsl:with-param name="TargetNode" select="EligibleForODCInd"/>
												<xsl:with-param name="BackupName">IRS1040NRDependentInformation<xsl:number value="position()"/>EligibleForODCInd</xsl:with-param>
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
				
				<!-- Wages Not Shown Group -->
				<xsl:if test="count($FormData/WagesNotShownGrp) &gt; 0">
					<br/>
					<br/>
					<span class="styRepeatingDataTitle">Line 1h - Wages Not Shown Group</span>
					<table class="styDepTbl" cellspacing="0" style="font-size:7pt;width:120mm;">
						<thead class="styTableThead">
							<tr class="styDepTblHdr">
								<th class="styDepTblCell" scope="col" style="width:32mm;">
									Wages Literal Code
								</th>
								<th class="styDepTblCell" scope="col" style="width:32mm;">
									Other Wages Not Shown Text
								</th>
								<th class="styDepTblCell" scope="col" style="width:32mm;">
									Wages Not Shown Amount
								</th>
							</tr>
						</thead>
						<tbody>
							<xsl:for-each select="$FormData/WagesNotShownGrp">
								<tr style="border-color:black;height:6mm;">
									<xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
									<td class="styTableCellTextInherit">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="WagesLiteralCd"/>
										</xsl:call-template>
									</td>
									<td class="styTableCellTextInherit">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="OtherWagesNotShownTxt"/>
										</xsl:call-template>
									</td>
									<td class="styTableCellAmtInherit">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="WagesNotShownAmt"/>
										</xsl:call-template>
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
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="OtherTaxAmtCd"/>
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
				<xsl:if test="count($FormData/InterestPenaltyTypeAndAmt) &gt; 1">
					<br/>
					<br/>
					<span class="styRepeatingDataTitle">Line 37 - Interest Penalty Type And Amount</span>
					<table class="styDepTbl" cellspacing="0" style="font-size:7pt;width:120mm;">
						<thead class="styTableThead">
							<tr class="styDepTblHdr">
								<th class="styDepTblCell" scope="col" style="width:32mm;">
									Description
								</th>
								<th class="styDepTblCell" scope="col" style="width:32mm;">
									Amount
								</th>
							</tr>
						</thead>
						<tbody>
							<xsl:for-each select="$FormData/InterestPenaltyTypeAndAmt">
								<tr style="border-color:black;height:6mm;">
									<xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
									<td class="styTableCellTextInherit">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="Desc"/>
										</xsl:call-template>
									</td>
									<td class="styTableCellAmtInherit">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="Amt"/>
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
