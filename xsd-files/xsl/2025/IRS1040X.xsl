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
	<xsl:include href="IRS1040XStyle.xsl"/>
	<xsl:output method="html" indent="yes"/>
	<xsl:strip-space elements="*"/>
	<xsl:param name="FormData" select="$RtnDoc/IRS1040X"/>
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
				<meta name="Description" content="IRS Form 1040-X"/>
				<script language="JavaScript" src="{$ScriptPath}/FormDisplay.js" type="text/javascript"/>
				<xsl:call-template name="InitJS"/>
				<style type="text/css">
					<xsl:if test="not($Print) or $Print=''">
						<xsl:call-template name="AddOnStyle"/>
						<xsl:call-template name="IRS1040XStyle"/>
					</xsl:if>
				</style>
				<xsl:call-template name="GlobalStylesForm"/>
			</head>
			<body class="styBodyClass">
				<form id="Form1040X">
					<xsl:call-template name="DocumentHeader"/>
					<!-- Page 1 -->
					<!-- Header -->
					<div class="styStdDiv">
						<div class="styFNBox" style="width:30mm;height:16mm;">
							<span class="" style="margin-top:3.5mm;margin-left:-1mm;margin-right:-1mm;
							 transform:rotate(270deg);float:left;">Form</span>
							<span class="styFormNumber" style="margin-top:1mm;margin-bottom:2mm">1040-X</span>
							<span class="styAgency">
								(Rev. December 2025)
							</span>
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$FormData"/>
							</xsl:call-template>
						</div>
						<div class="styFTBox" style="width:122mm;height:16mm;padding-top:0.5mm;">
							Department of the Treasury&mdash;Internal Revenue Service
							<span class="styFMT" style="font-size:12pt;padding: 2mm 0 2mm 0;">
							 Amended U.S. Individual Income Tax Return</span>
							<br/>
							
							<span style="font-weight:bold;">
								Go to
								<a style="text-decoration:none;color:black;" href="http://www.irs.gov/Form1040X" title="http://www.irs.gov/Form1040X">
												<i>www.irs.gov/Form1040X</i>
											</a>
								for instructions and the latest information.
							</span>
						</div>
						<div class="styTYBox" style="width:30mm;height:16mm;padding-top:0.5mm;">
							<div style="min-height:4.5mm;">
								<xsl:for-each select="$FormData/ReasonForFilingAmendedReturnCd">
									<xsl:call-template name="LinkToLeftoverDataTableInline">
										<xsl:with-param name="Desc">Top Right Margin - Reason for Filing Amended Return Code</xsl:with-param>
										<xsl:with-param name="TargetNode" select="."/>
									</xsl:call-template>
								</xsl:for-each>
								<xsl:call-template name="LinkToLeftoverDataTableInline">
									<xsl:with-param name="Desc">Top Right Margin - Primary Filer Death Date</xsl:with-param>
									<xsl:with-param name="TargetNode" select="$FormData/PrimaryDeathDt"/>
								</xsl:call-template>
								<xsl:call-template name="LinkToLeftoverDataTableInline">
									<xsl:with-param name="Desc">Top Right Margin - Spouse Death Date</xsl:with-param>
									<xsl:with-param name="TargetNode" select="$FormData/SpouseDeathDt"/>
								</xsl:call-template>
								<xsl:call-template name="LinkToLeftoverCheckboxDataTableInline">
									<xsl:with-param name="Desc">Top Right Margin - Power of Attorney Signed By Indicator</xsl:with-param>
									<xsl:with-param name="TargetNode" select="$FormData/PowerOfAttorneySignedByInd"/>
								</xsl:call-template>
								<xsl:call-template name="LinkToLeftoverDataTableInline">
									<xsl:with-param name="Desc">Top Right Margin - Power of Attorney Name</xsl:with-param>
									<xsl:with-param name="TargetNode" select="$FormData/PowerOfAttorneyNm"/>
								</xsl:call-template>
								<xsl:call-template name="LinkToLeftoverCheckboxDataTableInline">
									<xsl:with-param name="Desc">Top Right Margin - Surviving Spouse Indicator</xsl:with-param>
									<xsl:with-param name="TargetNode" select="$FormData/SurvivingSpouseInd"/>
								</xsl:call-template>
								<xsl:call-template name="LinkToLeftoverCheckboxDataTableInline">
									<xsl:with-param name="Desc">Top Right Margin - Personal Representative Indicator</xsl:with-param>
									<xsl:with-param name="TargetNode" select="$FormData/PersonalRepresentativeInd"/>
								</xsl:call-template>
								<xsl:call-template name="LinkToLeftoverDataTableInline">
									<xsl:with-param name="Desc">Top Right Margin - Non Paid Preparer Code</xsl:with-param>
									<xsl:with-param name="TargetNode" select="$FormData/NonPaidPreparerCd"/>
								</xsl:call-template>
								<xsl:call-template name="LinkToLeftoverDataTableInline">
									<xsl:with-param name="Desc">Top Right Margin - TAS Case Type Code</xsl:with-param>
									<xsl:with-param name="TargetNode" select="$FormData/TASCaseTypeCd"/>
								</xsl:call-template>
							</div>
							<div class="styOMB" style="height:auto;font-size:7pt;border:none;">OMB No. 1545-0074</div>
						</div>
					</div>
					<!-- Bullet Points using UL tag -->
					<div class="styStdDiv" style="border-top:1px solid black;padding-top:2px;">
						<div style="height:8mm;width:20mm;font-size:8pt;">
							<b>You must:</b>
						</div>
						<div style="height:8mm;width:auto;font-size:8pt;">
							<ul style="margin:0;padding-left:2mm;">
								<li>Attach a completed Form 1040, 1040-SR, or 1040-NR, with your changes, for the return year entered below; and</li>
								<li>Attach any supporting documents and new or changed forms and schedules.</li>
							</ul>
						</div>
					</div>
					<!-- Bullet Points using gif files -->
					<!--					<div class="styStdDiv" style="border-top:1px solid black;padding-top:2px;">
						<div style="height:8mm;width:20mm;font-size:8pt;float:left;"><b>You must:</b></div>
						<div style="height:4mm;width:auto;font-size:8pt;float:left;">
							<span style="width:auto;">
								<img src="{$ImagePath}/1040_Bullet_Round.gif" aria-label="Bullet Point"/>
								Attach a completed Form 1040, 1040-SR, or 1040-NR, with your changes, for the return year entered below; and
							</span>
						</div>
						<div style="height:4mm;width:auto;font-size:8pt;float:left;">
							<span style="width:auto;">
								<img src="{$ImagePath}/1040_Bullet_Round.gif" aria-label="Bullet Point"/>
								Attach any supporting documents and new or changed forms and schedules.
							</span>
						</div>
					</div>-->
					<!-- Tax Period -->
					<div class="styStdDiv" style="border-bottom:1px solid black;border-top:1px solid black;padding-top:2px;">
						<span style="font-weight:bold;font-size:8pt;">This return is for calendar year (enter year)
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/AmendedReturnForCalendarYrCd"/>
							</xsl:call-template>
						</span>
						<span style="width:4px"/>
						<span style="font-size:8pt;"><strong>or</strong> fiscal year (enter month and year ended): </span>
					</div>
					<!-- Filer information section -->
					<div class="styStdDiv">
						<div class="styIRS1040XHeaderCell" style="width:78mm;">
							Your first name and middle initial <br/>
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
						<div class="styIRS1040XHeaderCell" style="width:63mm;">
							Last name <br/> &nbsp;
						</div>
						<div class="styIRS1040XHeaderCell" style="width:46mm;border-right-width:0px;">
							<strong style="font-family:Arial;">Your social security number</strong>
							<br/>
							<xsl:call-template name="PopulateReturnHeaderFilerTIN">
								<xsl:with-param name="EINChanged" select="true()"/>
							</xsl:call-template>
						</div>
					</div>
					<div class="styStdDiv">
						<div class="styIRS1040XHeaderCell" style="width:78mm;">
							If joint return, spouse's first name and middle initial <br/> 
							<xsl:call-template name="LinkToLeftoverDataTableInline">
								<xsl:with-param name="Desc">Header - Spouse Name Control</xsl:with-param>
								<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/SpouseNameControlTxt"/>
							</xsl:call-template>
							&nbsp;
						</div>
						<div class="styIRS1040XHeaderCell" style="width:63mm;">
							Last name <br/> &nbsp;
						</div>
						<div class="styIRS1040XHeaderCell" style="width:46mm;border-right-width:0px;">
							<strong style="font-family:Arial;">Spouse's social security number</strong>
							<br/>
							<xsl:call-template name="PopulateReturnHeaderFiler">
								<xsl:with-param name="TargetNode">SpouseSSN</xsl:with-param>
								<xsl:with-param name="EINChanged" select="true()"/>
							</xsl:call-template>
						</div>
					</div>
					<div class="styStdDiv">
						<div class="styIRS1040XHeaderCell" style="width:129mm;height:10.5mm;">
							<span style="font-family:Arial;">Home address (number and street). If you have a P.O. box, see instructions.</span> <br/> 
							<xsl:call-template name="PopulateReturnHeaderFiler">
								<xsl:with-param name="TargetNode">AddressLine1Txt</xsl:with-param>
							</xsl:call-template>
							<br/>
							<xsl:call-template name="PopulateReturnHeaderFiler">
								<xsl:with-param name="TargetNode">AddressLine2Txt</xsl:with-param>
							</xsl:call-template>
							&nbsp;
						</div>
						<div class="styIRS1040XHeaderCell" style="width:12.06mm;height:10.5mm;font-family:Arial;">
							Apt. no. <br/> &nbsp;
						</div>
						<div class="styIRS1040XHeaderCell" style="width:45.9mm;height:28.5mm;border-right-width:0px;float:right;">
							<strong>Presidential Election Campaign</strong>
							<br/>
							<span style="font-size:7.5pt;">Check here if you, or your spouse if filing jointly, didn't previously want $3 to go to this fund, but now do. Checking a box below will not change your tax or refund.<br/>
								<input type="checkbox" class="styCkboxNM" style="margin:2mm 0mm 0mm 17mm;" aria-label="PECF Primary Ind You">
									<xsl:call-template name="PopulateCheckbox">
										<xsl:with-param name="TargetNode" select="$FormData/ChangeInElectToContriToPECFInd"/>
										<xsl:with-param name="BackupName" select="IRS1040ChangeInElectToContriToPECFInd"/>
									</xsl:call-template>
									<b>You</b>
								</input>
								<span style="width:4px;"/>
								<!--label>
									<xsl:call-template name="PopulateLabel">
										<xsl:with-param name="TargetNode" select="$FormData/ChangeInElectToContriToPECFInd"/>
										<xsl:with-param name="BackupName" select="IRS1040ChangeInElectToContriToPECFInd"/>
									</xsl:call-template>
									<b>You</b>
								</label-->
								<span style="width:10px;"/>
								<input type="checkbox" class="styCkboxNM" aria-label="PECF Spouse Ind Spouse">
									<xsl:call-template name="PopulateCheckbox">
										<xsl:with-param name="TargetNode" select="$FormData/ChangeInSpouseContriToPECFInd"/>
										<xsl:with-param name="BackupName" select="IRS1040ChangeInSpouseContriToPECFInd"/>
									</xsl:call-template>
									<b>Spouse</b>
								</input>
								<span style="width:4px;"/>
								<!--label>
									<xsl:call-template name="PopulateLabel">
										<xsl:with-param name="TargetNode" select="$FormData/PECFSpouseInd"/>
										<xsl:with-param name="BackupName" select="IRS1040PECFSpouseInd"/>
									</xsl:call-template>
									<b>Spouse</b>
								</label-->
							</span>
						</div>
						<div class="styIRS1040XHeaderCell" style="width:101mm;">
							<span style="font-family:Arial;">City, town, or post office. If you have a
							   foreign address, also complete spaces below.</span>
							<br/>
							<xsl:if test="$RtnHdrData/Filer/USAddress">
								<xsl:call-template name="PopulateReturnHeaderFiler">
									<xsl:with-param name="TargetNode">CityNm</xsl:with-param>
								</xsl:call-template>
							</xsl:if>
							<xsl:if test="$RtnHdrData/Filer/ForeignAddress">
								<xsl:call-template name="PopulateReturnHeaderFiler">
									<xsl:with-param name="TargetNode">CityNm</xsl:with-param>
								</xsl:call-template>
							</xsl:if>
						</div>
						<div class="styIRS1040XHeaderCell" style="width:20mm;">
							<span style="font-family:Arial;">State
							</span>
							<br/>
							<xsl:if test="$RtnHdrData/Filer/USAddress">
								<xsl:call-template name="PopulateReturnHeaderFiler">
									<xsl:with-param name="TargetNode">StateAbbreviationCd</xsl:with-param>
								</xsl:call-template>
							</xsl:if>
						</div>
						<div class="styIRS1040XHeaderCell" style="width:20.06mm;">
							<span style="font-family:Arial;">ZIP code
							</span>
							<br/>
							<xsl:if test="$RtnHdrData/Filer/USAddress">
								<xsl:call-template name="PopulateReturnHeaderFiler">
									<xsl:with-param name="TargetNode">ZIPCd</xsl:with-param>
								</xsl:call-template>
							</xsl:if>
						</div>
						<div class="styIRS1040XHeaderCell" style="width:60mm;height:10.5mm;">
							<span style="font-family:Arial;">Foreign country name</span> <br/> 
							<xsl:call-template name="PopulateReturnHeaderFiler">
								<xsl:with-param name="TargetNode">CountryCd</xsl:with-param>
								<xsl:with-param name="MainForm" select="true()"/>
							</xsl:call-template>
							&nbsp;
						</div>
						<div class="styIRS1040XHeaderCell" style="width:41mm;height:10.5mm;">
							<span style="font-family:Arial;">Foreign province/state/county</span> <br/> 
							<xsl:call-template name="PopulateReturnHeaderFiler">
								<xsl:with-param name="TargetNode">ProvinceOrStateNm</xsl:with-param>
							</xsl:call-template>
							&nbsp;
						</div>
						<div class="styIRS1040XHeaderCell" style="width:40.06mm;height:10.5mm;font-family:Arial;">
							<span style="font-family:Arial;">Foreign postal code</span> <br/> 
							<xsl:call-template name="PopulateReturnHeaderFiler">
								<xsl:with-param name="TargetNode">ForeignPostalCd</xsl:with-param>
							</xsl:call-template>
							&nbsp;
						</div>
					</div>
					<!-- Changes section -->
					<div class="styStdDiv">
						<div class="styGenericDiv" style="width:187mm;height:8mm;padding-right:5mm;padding-top:2px;">
							<strong>Amended return filing status. </strong> You <strong>must</strong> 
							 check one box even if you are not changing your filing status. 
							<strong>Caution: </strong> In general, you can't change your filing status from a
							 married filing jointly to married filing separately after the return due date.
						</div>
					</div>
					<div class="styStdDiv" style="padding-top:2px;padding-bottom:4px;">
						<input type="checkbox" class="styCkboxNM" style="margin-right:4px;">
							<xsl:call-template name="PopulateEnumeratedCheckbox">
								<xsl:with-param name="TargetNode" select="$FormData/IndividualReturnFilingStatusCd"/>
								<xsl:with-param name="DisplayedCheckboxValue" select="1"/>
								<xsl:with-param name="BackupName">F1040XIndividualReturnFilingStatusCd[1]</xsl:with-param>
							</xsl:call-template>Single
						</input>
						<!--label>
							<xsl:call-template name="PopulateLabel">
								<xsl:with-param name="TargetNode" select="$FormData/IndividualReturnFilingStatusCd"/>
								<xsl:with-param name="DisplayedCheckboxValue" select="1"/>
								<xsl:with-param name="BackupName">F1040XIndividualReturnFilingStatusCd[1]</xsl:with-param>
							</xsl:call-template>Single
						</label-->
						<input type="checkbox" class="styCkboxNM" style="margin-left:15px;margin-right:4px;">
							<xsl:call-template name="PopulateEnumeratedCheckbox">
								<xsl:with-param name="TargetNode" select="$FormData/IndividualReturnFilingStatusCd"/>
								<xsl:with-param name="DisplayedCheckboxValue" select="2"/>
								<xsl:with-param name="BackupName">F1040XIndividualReturnFilingStatusCd[2]</xsl:with-param>
							</xsl:call-template>Married filing jointly
						</input>
						<!--label>
							<xsl:call-template name="PopulateLabel">
								<xsl:with-param name="TargetNode" select="$FormData/IndividualReturnFilingStatusCd"/>
								<xsl:with-param name="DisplayedCheckboxValue" select="2"/>
								<xsl:with-param name="BackupName">F1040XIndividualReturnFilingStatusCd[2]</xsl:with-param>
							</xsl:call-template>Married filing jointly
						</label-->
						<input type="checkbox" class="styCkboxNM" style="margin-left:15px;margin-right:4px;">
							<xsl:call-template name="PopulateEnumeratedCheckbox">
								<xsl:with-param name="TargetNode" select="$FormData/IndividualReturnFilingStatusCd"/>
								<xsl:with-param name="DisplayedCheckboxValue" select="3"/>
								<xsl:with-param name="BackupName">F1040XIndividualReturnFilingStatusCd[3]</xsl:with-param>
							</xsl:call-template>Married filing separately (MFS)
						</input>
						<!--label>
							<xsl:call-template name="PopulateLabel">
								<xsl:with-param name="TargetNode" select="$FormData/IndividualReturnFilingStatusCd"/>
								<xsl:with-param name="DisplayedCheckboxValue" select="3"/>
								<xsl:with-param name="BackupName">F1040XIndividualReturnFilingStatusCd[3]</xsl:with-param>
							</xsl:call-template>Married filing separately (MFS)
						</label-->
						<input type="checkbox" class="styCkboxNM" style="margin-left:15px;margin-right:4px;">
							<xsl:call-template name="PopulateEnumeratedCheckbox">
								<xsl:with-param name="TargetNode" select="$FormData/IndividualReturnFilingStatusCd"/>
								<xsl:with-param name="DisplayedCheckboxValue" select="4"/>
								<xsl:with-param name="BackupName">F1040XIndividualReturnFilingStatusCd[4]</xsl:with-param>
							</xsl:call-template>Head of household (HOH)
						</input>
						<!--label>
							<xsl:call-template name="PopulateLabel">
								<xsl:with-param name="TargetNode" select="$FormData/IndividualReturnFilingStatusCd"/>
								<xsl:with-param name="DisplayedCheckboxValue" select="4"/>
								<xsl:with-param name="BackupName">F1040XIndividualReturnFilingStatusCd[5]</xsl:with-param>
							</xsl:call-template>Head of household (HOH)
						</label-->
						<input type="checkbox" class="styCkboxNM" style="margin-left:12px;margin-right:4px;">
							<xsl:call-template name="PopulateEnumeratedCheckbox">
								<xsl:with-param name="TargetNode" select="$FormData/IndividualReturnFilingStatusCd"/>
								<xsl:with-param name="DisplayedCheckboxValue" select="5"/>
								<xsl:with-param name="BackupName">F1040XIndividualReturnFilingStatusCd[5]</xsl:with-param>
							</xsl:call-template>Qualifying surviving spouse (QSS)
						</input>
						<!--label>
							<xsl:call-template name="PopulateLabel">
								<xsl:with-param name="TargetNode" select="$FormData/IndividualReturnFilingStatusCd"/>
								<xsl:with-param name="DisplayedCheckboxValue" select="5"/>
								<xsl:with-param name="BackupName">F1040XIndividualReturnFilingStatusCd[4]</xsl:with-param>
							</xsl:call-template>Qualifying surviving spouse (QSS)</label-->
					</div>
					<div class="styStdDiv" style="padding-bottom:2px;">
						If you checked the MFS box, enter the name of your spouse unless you are amending a Form 1040-NR. If you checked the HOH or QSS box,
						enter the child's name if the qualifying person is a child but not your dependent: <span style="width:4px"/> 
						<xsl:call-template name="PopulateText">
							<xsl:with-param name="TargetNode" select="$FormData/SpouseNm"/>
						</xsl:call-template>
						<xsl:if test="$FormData/SpouseNm">
							<span style="width:8px;"/>
						</xsl:if>
						<xsl:call-template name="PopulateText">
							<xsl:with-param name="TargetNode" select="$FormData/NRALiteralCd"/>
						</xsl:call-template>
						<xsl:if test="$FormData/NRALiteralCd">
							<span style="width:8px;"/>
						</xsl:if>
						<xsl:call-template name="PopulateText">
							<xsl:with-param name="TargetNode" select="$FormData/QualifyingHOHNm"/>
						</xsl:call-template>
						<xsl:call-template name="LinkToLeftoverDataTableInline">
							<xsl:with-param name="Desc">Filing Status - Qualifying HOH SSN</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$FormData/QualifyingHOHSSN"/>
						</xsl:call-template>
						<xsl:if test="$FormData/QualifyingHOHNm or $FormData/QualifyingHOHSSN">
							<span style="width:8px;"/>
						</xsl:if>
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
					</div>
					<!-- Column Headers -->
					<div class="styStdDiv" style="border-top:1px solid black;">
						<div class="sty1040XDesc" style="width:90mm;padding-top:1mm;">
							<span style="text-align:left;">Enter on lines 1 through 23 columns 
							A through C the amounts for the return year entered above.<br/>
							You must complete Part II on page 2 and explain any changes.
							</span>
						</div>
						<div class="sty1040XRightNumBox" style="height:14mm;border-left-width:0px;
						 border-bottom-width:0px;">&nbsp;</div>
						<div class="sty1040XAmtBox" style="height:14mm;padding-top:0.5mm;text-align:center;
						 border-bottom-width:0px;"><strong>A. Original amount</strong> <br/>
						 reported or as previously adjusted (see instructions)
						</div>
						<div class="sty1040XAmtBox" style="height:14mm;padding-top:0.5mm;text-align:center;
						 border-bottom-width:0px;">
							<strong>B. Net change &mdash;</strong> <br/>
							amount of increase <br/> or (decrease) &mdash; <br/> explain in Part II
						</div>
						<div class="sty1040XAmtBox" style="height:14mm;padding-top:3.5mm;text-align:center;
						 font-weight:bold;border-bottom-width:0px;">C. Correct <br/>amount</div>
					</div>
					<div class="styStdDiv" style="border-top:1px solid black;">
						<div class="sty1040XDesc" style="width:90mm;font-weight:bold;font-size:8pt;height:4.5mm;">
						 Income and Deductions</div>
						<div class="sty1040XRightNumBoxNBB" style="height:4.5mm" TabIndex="-1"></div>
						<div class="sty1040XAmtBox" style="height:4.5mm;border-bottom-width:0px;" TabIndex="-1"></div>
						<div class="sty1040XAmtBox" style="height:4.5mm;border-bottom-width:0px;" TabIndex="-1"></div>
						<div class="sty1040XAmtBox" style="height:4.5mm;border-bottom-width:0px;" TabIndex="-1"></div>
					</div>
					<!-- Line 1 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD">1</div>
						<div class="sty1040XDesc" style="height:7.5mm;padding-bottom:0px;">
							Adjusted gross income. If a net operating loss (NOL) carryback <br/> is included, check here  
							<span style="float:right;">
								
								<span class="sty1040XDotLn" style="float:left;padding-right:0px;">............</span>
								<input type="checkbox" style="margin: 0px 6px 0px 0px;" aria-label="NOL Carryback" class="styCkbox">
									<xsl:call-template name="PopulateCheckbox">
										<xsl:with-param name="TargetNode" select="$FormData/NetOperatingLossCarrybackInd"/>
										<xsl:with-param name="BackupName">IRS1040XNetOperatingLossCarrybackInd</xsl:with-param>
									</xsl:call-template>
								</input>
							</span>
						</div>
						<div class="sty1040XRightNumBox" style="height:7.5mm;padding-top:1.25mm;"><br/>1</div>
						<div class="sty1040XAmtBox" style="height:7.5mm;padding-top:1.25mm;">
							<br/>
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/OriginalRptOrAsPrevAdjGrp/AdjustedGrossIncomeAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty1040XAmtBox" style="height:7.5mm;padding-top:1.25mm;">
							<br/>
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/NetChangeOrigRptOrPrevAdjGrp/AdjustedGrossIncomeAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty1040XAmtBox" style="height:7.5mm;padding-top:1.25mm;">
							<br/>
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CorrectNumberOrAmountGrp/AdjustedGrossIncomeAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 2 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD">2</div>
						<div class="sty1040XDesc">
							Itemized deductions or standard deduction
							<span class="sty1040XDotLn">......</span>
						</div>
						<div class="sty1040XRightNumBox">2</div>
						<div class="sty1040XAmtBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/OriginalRptOrAsPrevAdjGrp/TotalItemizedOrStandardDedAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty1040XAmtBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/NetChangeOrigRptOrPrevAdjGrp/TotalItemizedOrStandardDedAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty1040XAmtBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CorrectNumberOrAmountGrp/TotalItemizedOrStandardDedAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 3 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD">3</div>
						<div class="sty1040XDesc">
							Subtract line 2 from line 1
							<span class="sty1040XDotLn">...........</span>
						</div>
						<div class="sty1040XRightNumBox">3</div>
						<div class="sty1040XAmtBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/OriginalRptOrAsPrevAdjGrp/AGILessDeductionsAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty1040XAmtBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/NetChangeOrigRptOrPrevAdjGrp/AGILessDeductionsAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty1040XAmtBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CorrectNumberOrAmountGrp/AGILessDeductionsAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 4a -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD">4a</div>
						<div class="sty1040XDesc" style="height:4mm;font-family:Arial;padding-top:1mm">
							Qualified business income deduction
							<span class="sty1040XDotLn" style="font-family:Verdana;">..........</span>
						</div>
						<div class="sty1040XRightNumBox" style="">4a</div>
						<div class="sty1040XAmtBox" style="">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/OriginalRptOrAsPrevAdjGrp/QualifiedBusinessIncomeDedAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty1040XAmtBox" style="">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/NetChangeOrigRptOrPrevAdjGrp/QualifiedBusinessIncomeDedAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty1040XAmtBox" style="">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CorrectNumberOrAmountGrp/QualifiedBusinessIncomeDedAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 4b -->
					<div class="styStdDiv" style="height:7mm;">
						<div class="styLNLeftNumBoxSD" style="padding-left:4.2mm;">b</div>
						<div class="sty1040XDesc" style="font-family:Arial;padding-top:.5mm;">
							Deductions for tips, overtime, car loan interest, and seniors from Schedule 1-A (Form 1040). Attach your Schedule 1-A 
							<span class="sty1040XDotLn" style="font-family:Verdana;">........</span>
						</div>
						<div class="sty1040XRightNumBox" style="height:7mm;"><br/>4b</div>
						<div class="sty1040XAmtBox" style="height:7mm;">
							<br/>
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/OriginalRptOrAsPrevAdjGrp/TotalAdditionalDeductionsAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty1040XAmtBox" style="height:7mm;">
							<br/>
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/NetChangeOrigRptOrPrevAdjGrp/TotalAdditionalDeductionsAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty1040XAmtBox" style="height:7mm;">
							<br/>
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CorrectNumberOrAmountGrp/TotalAdditionalDeductionsAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 5 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD">5</div>
						<div class="sty1040XDesc" style="height:7mm;">
							Taxable income. Subtract the total of lines 4a and 4b from line 3. If the result for column C is zero or less, enter -0- in column C
							<!--<span class="sty1040XDotLn">...</span>-->
						</div>
						<div class="sty1040XRightNumBoxNBB" style="height:7mm;"><br/>5</div>
						<div class="sty1040XAmtBoxNBB" style="height:7mm;">
							<br/>
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/OriginalRptOrAsPrevAdjGrp/TaxableIncomeAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty1040XAmtBoxNBB" style="height:7mm;">
							<br/>
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/NetChangeOrigRptOrPrevAdjGrp/TaxableIncomeAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty1040XAmtBoxNBB" style="height:7mm;">
							<br/>
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CorrectNumberOrAmountGrp/TaxableIncomeAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<div class="styStdDiv" style="border-top:1px solid black;">
						<div class="sty1040XDesc" style="width:90mm;font-weight:bold;font-size:8pt;height:4.5mm;">Tax Liability</div>
						<div class="sty1040XRightNumBoxNBB" style="height:4.5mm" TabIndex="-1"></div>
						<div class="sty1040XAmtBox" style="height:4.5mm;border-bottom-width:0px;" TabIndex="-1"></div>
						<div class="sty1040XAmtBox" style="height:4.5mm;border-bottom-width:0px;" TabIndex="-1"></div>
						<div class="sty1040XAmtBox" style="height:4.5mm;border-bottom-width:0px;" TabIndex="-1"></div>
					</div>
					<!-- Line 6 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD">6</div>
						<div class="sty1040XDesc" style="height:7.7mm;">
							Tax. Enter method(s) used to figure tax (see instructions): <br/> 
							<span style="border-bottom:1px dotted black;width:97%;">
								<xsl:for-each select="$FormData/MethodUsedToFigureTaxCd | $FormData/MethodUsedToFigureTaxTxt">
									<xsl:choose>
										<xsl:when test="local-name(.) = 'MethodUsedToFigureTaxCd'">
											<xsl:call-template name="LinkToLeftoverDataTableInline">
												<xsl:with-param name="Desc">Line 6 - Method Used To Figure Tax Code</xsl:with-param>
												<xsl:with-param name="TargetNode" select="."/>
											</xsl:call-template>
										</xsl:when>
										<xsl:otherwise>
											<xsl:call-template name="LinkToLeftoverDataTableInline">
												<xsl:with-param name="Desc">Line 6 - Method Used To Figure Tax Text</xsl:with-param>
												<xsl:with-param name="TargetNode" select="."/>
											</xsl:call-template>
										</xsl:otherwise>
									</xsl:choose>
								</xsl:for-each>
							</span>
						</div>
						<div class="sty1040XRightNumBox" style="height:7.7mm;padding-top:1.25mm;"><br/>6</div>
						<div class="sty1040XAmtBox" style="height:7.7mm;padding-top:1.25mm;">
							<br/>
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/OriginalRptOrAsPrevAdjGrp/TaxAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty1040XAmtBox" style="height:7.7mm;padding-top:1.25mm;">
							<br/>
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/NetChangeOrigRptOrPrevAdjGrp/TaxAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty1040XAmtBox" style="height:7.7mm;padding-top:1.25mm;">
							<br/>
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CorrectNumberOrAmountGrp/TaxAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 7 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD">7</div>
						<div class="sty1040XDesc" style="height:8mm;">
							Nonrefundable credits. If a general business credit carryback<br/>is included, check here
							<span style="float:right;">
								<span class="sty1040XDotLn" style="float:none;margin-right:-4px;padding: 0px 0px 0px 2px;">............</span>
								<span style="width:4px"/>
								<input type="checkbox" style="margin: 0px 6px 0px 0px;" aria-label="business credit carryback" class="styCkbox">
									<xsl:call-template name="PopulateCheckbox">
										<xsl:with-param name="TargetNode" select="$FormData/GeneralBusinessCrCarrybackInd"/>
										<xsl:with-param name="BackupName">IRS1040XGeneralBusinessCrCarrybackInd</xsl:with-param>
									</xsl:call-template>
								</input>
							</span>
						</div>
						<div class="sty1040XRightNumBox" style="height:8mm;padding-top:1.5mm;"><br/>7</div>
						<div class="sty1040XAmtBox" style="height:8mm;padding-top:1.5mm;">
							<br/>
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/OriginalRptOrAsPrevAdjGrp/TotalNonrefundableCreditsAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty1040XAmtBox" style="height:8mm;padding-top:1.5mm;">
							<br/>
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/NetChangeOrigRptOrPrevAdjGrp/TotalNonrefundableCreditsAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty1040XAmtBox" style="height:8mm;padding-top:1.5mm;">
							<br/>
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CorrectNumberOrAmountGrp/TotalNonrefundableCreditsAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 8 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD">8</div>
						<div class="sty1040XDesc">
							Subtract line 7 from line 6. If the result is zero or less, enter -0-
							
						</div>
						<div class="sty1040XRightNumBox">8</div>
						<div class="sty1040XAmtBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/OriginalRptOrAsPrevAdjGrp/TaxLessCreditsAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty1040XAmtBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/NetChangeOrigRptOrPrevAdjGrp/TaxLessCreditsAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty1040XAmtBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CorrectNumberOrAmountGrp/TaxLessCreditsAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 9 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD">9</div>
						<div class="sty1040XDesc" style="height:4mm;">
							Reserved for future use
							<span class="sty1040XDotLn">............</span>
						</div>
						<div class="sty1040XRightNumBox" style="height:4mm;">9</div>
						<div class="sty1040XAmtBox" style="height:4mm;background-color:lightgrey">
							<!--<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/OriginalRptOrAsPrevAdjGrp/HealthCareRspnsPenaltyAmt" />
							</xsl:call-template>-->
						</div>
						<div class="sty1040XAmtBox" style="height:4mm;background-color:lightgrey">
							<!--<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/NetChangeOrigRptOrPrevAdjGrp/HealthCareRspnsPenaltyAmt" />
							</xsl:call-template>-->
						</div>
						<div class="sty1040XAmtBox" style="height:4mm;background-color:lightgrey">
							<!--<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CorrectNumberOrAmountGrp/HealthCareRspnsPenaltyAmt" />
							</xsl:call-template>-->
						</div>
					</div>
					<!-- Line 10 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBox">10</div>
						<div class="sty1040XDesc">
							Other taxes
							<span class="sty1040XDotLn">................</span>
						</div>
						<div class="sty1040XRightNumBox">10</div>
						<div class="sty1040XAmtBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/OriginalRptOrAsPrevAdjGrp/OtherTaxesAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty1040XAmtBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/NetChangeOrigRptOrPrevAdjGrp/OtherTaxesAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty1040XAmtBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CorrectNumberOrAmountGrp/OtherTaxesAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 11 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBox">11</div>
						<div class="sty1040XDesc">
							Total tax. Add lines 8 and 10
							<span class="sty1040XDotLn">..........</span>
						</div>
						<div class="sty1040XRightNumBoxNBB">11</div>
						<div class="sty1040XAmtBoxNBB">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/OriginalRptOrAsPrevAdjGrp/TotalTaxAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty1040XAmtBoxNBB">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/NetChangeOrigRptOrPrevAdjGrp/TotalTaxAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty1040XAmtBoxNBB">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CorrectNumberOrAmountGrp/TotalTaxAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<div class="styStdDiv" style="border-top:1px solid black;">
						<div class="sty1040XDesc" style="width:90mm;font-weight:bold;font-size:8pt;height:4.5mm;">Payments</div>
						<div class="sty1040XRightNumBoxNBB" style="height:4.5mm" TabIndex="-1"></div>
						<div class="sty1040XAmtBox" style="height:4.5mm;border-bottom-width:0px;" TabIndex="-1"></div>
						<div class="sty1040XAmtBox" style="height:4.5mm;border-bottom-width:0px;" TabIndex="-1"></div>
						<div class="sty1040XAmtBox" style="height:4.5mm;border-bottom-width:0px;" TabIndex="-1"></div>
					</div>
					<!-- Line 12 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBox">12</div>
						<div class="sty1040XDesc" style="height:7mm;">
							Federal income tax withheld and excess social security and <br/> 
							tier 1 RRTA tax withheld (<strong>If changing, </strong> see instructions.)
							<span class="sty1040XDotLn">..</span>
						</div>
						<div class="sty1040XRightNumBox" style="height:7mm;"><br/>12</div>
						<div class="sty1040XAmtBox" style="height:7mm;">
							<br/>
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/OriginalRptOrAsPrevAdjGrp/FedIncmExSocSecRRTAWthldTxAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty1040XAmtBox" style="height:7mm;">
							<br/>
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/NetChangeOrigRptOrPrevAdjGrp/FedIncmExSocSecRRTAWthldTxAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty1040XAmtBox" style="height:7mm;">
							<br/>
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CorrectNumberOrAmountGrp/FedIncmExSocSecRRTAWthldTxAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 13 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBox">13</div>
						<div class="sty1040XDesc" style="font-family:Arial;">
							Estimated tax payments, including amount applied from prior year's return
						</div>
						<div class="sty1040XRightNumBox">13</div>
						<div class="sty1040XAmtBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/OriginalRptOrAsPrevAdjGrp/EstimatedTaxPaymentsAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty1040XAmtBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/NetChangeOrigRptOrPrevAdjGrp/EstimatedTaxPaymentsAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty1040XAmtBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CorrectNumberOrAmountGrp/EstimatedTaxPaymentsAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 14 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBox">14</div>
						<div class="sty1040XDesc">
							Earned Income Credit (EIC)
							<span class="sty1040XDotLn">...........</span>
						</div>
						<div class="sty1040XRightNumBox">14</div>
						<div class="sty1040XAmtBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/OriginalRptOrAsPrevAdjGrp/EarnedIncomeCreditAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty1040XAmtBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/NetChangeOrigRptOrPrevAdjGrp/EarnedIncomeCreditAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty1040XAmtBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CorrectNumberOrAmountGrp/EarnedIncomeCreditAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 15 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBox">15</div>
						<div class="sty1040XDesc" style="height:8mm;">
							Refundable credits from: 
							<input type="checkbox" class="styCkboxNM" aria-label="Schedule 8812" style="margin-left:4px;margin-right:4px;">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$FormData/Schedule8812Ind"/>
									<xsl:with-param name="BackupName">IRS1040XSchedule8812Ind</xsl:with-param>
								</xsl:call-template>
							</input>
							<label>
								<xsl:call-template name="PopulateLabel">
									<xsl:with-param name="TargetNode" select="$FormData/Schedule8812Ind"/>
									<xsl:with-param name="BackupName">IRS1040XSchedule8812Ind</xsl:with-param>
								</xsl:call-template>Schedule 8812</label>
							<span style="width:1.5mm;"/>
							Form(s) 
							<input type="checkbox" class="styCkboxNM" aria-label="Form 2439" style="margin-left:4px;margin-right:4px;">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$FormData/Form2439Ind"/>
									<xsl:with-param name="BackupName">IRS1040XForm2439Ind</xsl:with-param>
								</xsl:call-template>
							</input>
							<label>
								<xsl:call-template name="PopulateLabel">
									<xsl:with-param name="TargetNode" select="$FormData/Form2439Ind"/>
									<xsl:with-param name="BackupName">IRS1040XForm2439Ind</xsl:with-param>
								</xsl:call-template>2439</label>
							<br/>
							<input type="checkbox" class="styCkboxNM" aria-label="Form 4136" style="margin-right:4px;">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$FormData/Form4136Ind"/>
									<xsl:with-param name="BackupName">IRS1040XForm4136Ind</xsl:with-param>
								</xsl:call-template>
							</input>
							<label>
								<xsl:call-template name="PopulateLabel">
									<xsl:with-param name="TargetNode" select="$FormData/Form4136Ind"/>
									<xsl:with-param name="BackupName">IRS1040XForm4136Ind</xsl:with-param>
								</xsl:call-template>4136</label>
							<input type="checkbox" class="styCkboxNM" aria-label="Form 8863" style="margin-left:8px;margin-right:4px;">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$FormData/Form8863Ind"/>
									<xsl:with-param name="BackupName">IRS1040XForm8863Ind</xsl:with-param>
								</xsl:call-template>
							</input>
							<label>
								<xsl:call-template name="PopulateLabel">
									<xsl:with-param name="TargetNode" select="$FormData/Form8863Ind"/>
									<xsl:with-param name="BackupName">IRS1040XForm8863Ind</xsl:with-param>
								</xsl:call-template>8863</label>
							<input type="checkbox" class="styCkboxNM" aria-label="Form 8885" style="margin-left:8px;margin-right:4px;">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$FormData/Form8885Ind"/>
									<xsl:with-param name="BackupName">IRS1040XForm8885Ind</xsl:with-param>
								</xsl:call-template>
							</input>
							<label>
								<xsl:call-template name="PopulateLabel">
									<xsl:with-param name="TargetNode" select="$FormData/Form8885Ind"/>
									<xsl:with-param name="BackupName">IRS1040XForm8885Ind</xsl:with-param>
								</xsl:call-template>8885</label>
							<input type="checkbox" class="styCkboxNM" aria-label="Form 8962" style="margin-left:8px;margin-right:4px;">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$FormData/Form8962Ind"/>
									<xsl:with-param name="BackupName">IRS1040XForm8962Ind</xsl:with-param>
								</xsl:call-template>
							</input>
							<label>
								<xsl:call-template name="PopulateLabel">
									<xsl:with-param name="TargetNode" select="$FormData/Form8962Ind"/>
									<xsl:with-param name="BackupName">IRS1040XForm8962Ind</xsl:with-param>
								</xsl:call-template>8962</label> 
							or 
							<input type="checkbox" class="styCkboxNM" aria-label="Other" style="margin-left:4px;margin-right:4px;">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$FormData/OtherInd"/>
									<xsl:with-param name="BackupName">IRS1040XOtherInd</xsl:with-param>
								</xsl:call-template>
							</input>
							<label>
								<xsl:call-template name="PopulateLabel">
									<xsl:with-param name="TargetNode" select="$FormData/OtherInd"/>
									<xsl:with-param name="BackupName">IRS1040XOtherInd</xsl:with-param>
								</xsl:call-template>other</label> 
							(specify): 
							<span style="width:4mm;border-bottom:1px dotted black;">
								<xsl:call-template name="LinkToLeftoverDataTableInline">
									<xsl:with-param name="TargetNode" select="$FormData/OtherInd/@otherRefundableCrTxt"/>
									<xsl:with-param name="Desc">Line 15 - Other Refundable Credit Text</xsl:with-param>
								</xsl:call-template>
							</span>
						</div>
						<div class="sty1040XRightNumBox" style="height:8mm;padding-top:1.5mm;"><br/>15</div>
						<div class="sty1040XAmtBox" style="height:8mm;padding-top:1.5mm;">
							<br/>
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/OriginalRptOrAsPrevAdjGrp/RefundableCreditsAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty1040XAmtBox" style="height:8mm;padding-top:1.5mm;">
							<br/>
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/NetChangeOrigRptOrPrevAdjGrp/RefundableCreditsAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty1040XAmtBox" style="height:8mm;padding-top:1.5mm;">
							<br/>
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CorrectNumberOrAmountGrp/RefundableCreditsAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 16 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBox">16</div>
						<div class="sty1040XLongDesc" style="height:7mm;">
							Total amount paid with request for extension of time to file, tax paid with original return, and additional <br/> 
							tax paid after return was filed
							<span class="sty1040XDotLn">.........................</span>
						</div>
						<div class="sty1040XRightNumBox" style="height:7mm;"><br/>16</div>
						<div class="sty1040XAmtBox" style="height:7mm;">
							<br/>
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TotalTxPdWithReturnOrExtnsAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 17 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBox">17</div>
						<div class="sty1040XLongDesc">
							Total payments. Add lines 12 through 15, column C, and line 16
							<xsl:call-template name="LinkToLeftoverDataTableInline">
								<xsl:with-param name="Desc">Line 17 - US Virgin Islands Code</xsl:with-param>
								<xsl:with-param name="TargetNode" select="$FormData/TotalPaymentsAmt/@uSVirginIslandCd"/>
							</xsl:call-template>
							<xsl:call-template name="LinkToLeftoverDataTableInline">
								<xsl:with-param name="Desc">Line 17 - US Virgin Islands Amount</xsl:with-param>
								<xsl:with-param name="TargetNode" select="$FormData/TotalPaymentsAmt/@uSVirginIslandAmt"/>
							</xsl:call-template>
							<span class="sty1040XDotLn">.............</span>
						</div>
						<div class="sty1040XRightNumBoxNBB">17</div>
						<div class="sty1040XAmtBoxNBB">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TotalPaymentsAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<div class="styStdDiv" style="border-top:1px solid black;">
						<div class="sty1040XLongDesc" style="width:150mm;font-weight:bold;font-size:8pt;height:4.5mm;">Refund or Amount You Owe</div>
						<div class="sty1040XRightNumBoxNBB" style="height:4.5mm" TabIndex="-1"></div>
						<div class="sty1040XAmtBox" style="height:4.5mm;border-bottom-width:0px;" TabIndex="-1"></div>
					</div>
					<!-- Line 18 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBox">18</div>
						<div class="sty1040XLongDesc">
							Overpayment, if any, as shown on original return or as previously adjusted by the IRS
							<span class="sty1040XDotLn">........</span>
						</div>
						<div class="sty1040XRightNumBox">18</div>
						<div class="sty1040XAmtBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/OverpaidAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 19 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBox">19</div>
						<div class="sty1040XLongDesc">
							Subtract line 18 from line 17. (If less than zero, see instructions.)
							<span class="sty1040XDotLn">..............</span>
						</div>
						<div class="sty1040XRightNumBox">19</div>
						<div class="sty1040XAmtBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TotPaymentsLessOverpaymentAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 20 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBox">20</div>
						<div class="sty1040XLongDesc">
							<strong>Amount you owe. </strong> If line 11, column C, is more than line 19, enter the difference
							<span class="sty1040XDotLn">.........</span>
						</div>
						<div class="sty1040XRightNumBox">20</div>
						<div class="sty1040XAmtBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/OwedAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 21 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBox">21</div>
						<div class="sty1040XLongDesc">
							If line 11, column C, is less than line 19, enter the difference. This is the amount <strong>overpaid </strong> on this return
							<span class="sty1040XDotLn">..</span>
						</div>
						<div class="sty1040XRightNumBox">21</div>
						<div class="sty1040XAmtBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/NetOverpaymentAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 22 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBox">22</div>
						<div class="sty1040XLongDesc">
							Amount of line 21 you want <strong>refunded to you</strong>
							<span class="sty1040XDotLn">....................</span>
						</div>
						<div class="sty1040XRightNumBox">22</div>
						<div class="sty1040XAmtBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/RefundAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 23 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBox">23</div>
						<div class="sty1040XDesc" style="width:105mm;font-family:Arial;">
							Amount of line 21 you want 
							<span style="display:inline;font-weight:bold;font-family:Verdana;">
								applied to your (enter year): 
								<span style="width:12mm;text-align:center;">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$FormData/ElectOvpmtAppliedToEsTaxYr"/>
									</xsl:call-template>
								</span>
								estimated tax
							</span>
						</div>
						<div class="sty1040XRightNumBoxNBB" style="">23</div>
						<div class="sty1040XAmtBoxNBB" style="">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/AppliedToEsTaxAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty1040XRightNumBoxNBB" style="background-color:lightgrey;"></div>
						<div class="sty1040XAmtBoxNBB" style="background-color:lightgrey;border-left-width:0px;"></div>
					</div>
					<div class="styStdDiv" style="text-align:right;font-weight:bold;border-top:1px solid black;">
						Complete and sign this form on page 2.
					</div>
					<div class="styStdDiv pageEnd" style="border-top:2px solid black;">
						<span style="font-weight:bold;font-family:Arial;">For Paperwork Reduction Act Notice, 
						 see separate instructions.</span>
						<span style="margin-left:20mm;">Cat. No. 11360L</span>
						<span style="float:right;">Form <span style="font-weight:bold;font-size:larger;">1040-X</span> (Rev. 12-2025)</span>
					</div>
					<div class="styStdDiv">
						Form 1040-X (Rev. 12-2025)
						<span style="float:right;">Page <span style="font-weight:bold;font-size:8pt;">2</span></span>
					</div>
					<!-- Part 1 -->
					<div class="styStdDiv" style="border-top:2px solid black;">
						<div class="styPartName">Part I</div>
						<div class="styPartDesc">Dependents</div>
					</div>
					<!-- Column Headers -->
					<div class="styStdDiv" style="border-top:1px solid black;">
						<div class="sty1040XDesc" style="height:16.5mm;padding-left:0mm;font-size:6.7pt;width:90mm;">
						 Complete this part to change any information relating to your dependents.<br/>
						 This would include a change in the number of dependents. <br/>
						 Enter the information for the return year entered at the top of page 1.
						</div>
						<div class="sty1040XRightNumBox" style="height:16.5mm;border-left-width:0px;
						 border-bottom-width:0px;"></div>
						<div class="sty1040XAmtBox" style="height:16.5mm;padding-top:1.5mm;text-align:center;
						 border-bottom-width:0px;">
							<strong>A. Original number <br/> of dependents<br/></strong> 
							reported or as previously adjusted
						</div>
						<div class="sty1040XAmtBox" style="height:16.5mm;padding-top:1.5mm;text-align:center;
						 border-bottom-width:0px;">
							<strong>B. Net change -</strong><br/> amount of increase <br/> or (decrease)
						</div>
						<div class="sty1040XAmtBox" style="height:16.5mm;padding-top:1.5mm;text-align:center;
						 font-weight:bold;border-bottom-width:0px;">
							C. Correct <br/> number 
						</div>
					</div>
					<!-- Line 24 -->
					<div class="styStdDiv" style="border-top:1px solid black;">
						<div class="styLNLeftNumBox">24</div>
						<div class="sty1040XDesc" style="height:4.5mm;">
							Reserved for future use
							<span class="sty1040XDotLn">............</span>
						</div>
						<div class="sty1040XRightNumBox" style="height:4.5mm;">24</div>
						<div class="sty1040XAmtBox" style="height:4.5mm;background-color:lightgrey">
							<!--<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/OriginalRptOrAsPrevAdjGrp/TotalExemptPrimaryAndSpouseCnt" />
							</xsl:call-template>-->
						</div>
						<div class="sty1040XAmtBox" style="height:4.5mm;background-color:lightgrey">
							<!--<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/NetChangeOrigRptOrPrevAdjGrp/TotalExemptPrimaryAndSpouseCnt" />
							</xsl:call-template>-->
						</div>
						<div class="sty1040XAmtBox" style="height:4.5mm;background-color:lightgrey">
							<!--<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CorrectNumberOrAmountGrp/TotalExemptPrimaryAndSpouseCnt" />
							</xsl:call-template>-->
						</div>
					</div>
					<!-- Line 25 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBox" style="height:7mm;">25</div>
						<div class="sty1040XDesc" style="height:7mm;">
							Your dependent children who lived with you more than half of<br/> the year
							<span class="sty1040XDotLn">.................</span>
						</div>
						<div class="sty1040XRightNumBox" style="height:7mm;"><br/>25</div>
						<div class="sty1040XAmtBox" style="height:7mm;">
							<br/>
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/OriginalRptOrAsPrevAdjGrp/ChldWhoLivedWithYouCnt"/>
							</xsl:call-template>
						</div>
						<div class="sty1040XAmtBox" style="height:7mm;">
							<br/>
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/NetChangeOrigRptOrPrevAdjGrp/ChldWhoLivedWithYouCnt"/>
							</xsl:call-template>
						</div>
						<div class="sty1040XAmtBox" style="height:7mm;">
							<br/>
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CorrectNumberOrAmountGrp/ChldWhoLivedWithYouCnt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 26 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBox">26</div>
						<div class="sty1040XDesc">
							Reserved for future use
							<span class="sty1040XDotLn">............</span>
						</div>
						<div class="sty1040XRightNumBox" style="height:4.2mm;padding-top:0.7mm;">26</div>
						<div class="sty1040XAmtBox" style="height:4mm;background-color:lightgrey">	</div>
						<div class="sty1040XAmtBox" style="height:4mm;background-color:lightgrey"/>
						<div class="sty1040XAmtBox" style="height:4mm;background-color:lightgrey"/>
					</div>
					<!-- Line 27 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBox">27</div>
						<div class="sty1040XDesc">
							Other dependents
							<span class="sty1040XDotLn">..............</span>
						</div>
						<div class="sty1040XRightNumBox">27</div>
						<div class="sty1040XAmtBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/OriginalRptOrAsPrevAdjGrp/OtherDependentsListedCnt"/>
							</xsl:call-template>
						</div>
						<div class="sty1040XAmtBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/NetChangeOrigRptOrPrevAdjGrp/OtherDependentsListedCnt"/>
							</xsl:call-template>
						</div>
						<div class="sty1040XAmtBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CorrectNumberOrAmountGrp/OtherDependentsListedCnt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 28 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBox">28</div>
						<div class="sty1040XDesc" style="height:4mm;">
							Reserved for future use 
							<span class="sty1040XDotLn">............</span>
						</div>
						<div class="sty1040XRightNumBox" style="height:4mm;">28</div>
						<div class="sty1040XAmtBox" style="height:4mm;background-color:lightgrey">	</div>
						<div class="sty1040XAmtBox" style="height:4mm;background-color:lightgrey"/>
						<div class="sty1040XAmtBox" style="height:4mm;background-color:lightgrey"/>
					</div>
					<!-- Line 29 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBox">29</div>
						<div class="sty1040XDesc" style="height:4mm;">
							Reserved for future use 
							<span class="sty1040XDotLn">............</span>
						</div>
						<div class="sty1040XRightNumBox" style="height:4mm;">29</div>
						<div class="sty1040XAmtBox" style="height:4mm;background-color:lightgrey">
							<!--<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/OriginalRptOrAsPrevAdjGrp/CalculatedExemptionAmt" />
							</xsl:call-template>-->
						</div>
						<div class="sty1040XAmtBox" style="height:4mm;background-color:lightgrey">
							<!--<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/NetChangeOrigRptOrPrevAdjGrp/CalculatedExemptionAmt" />
							</xsl:call-template>-->
						</div>
						<div class="sty1040XAmtBox" style="height:4mm;background-color:lightgrey">
							<!--<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CorrectNumberOrAmountGrp/CalculatedExemptionAmt" />
							</xsl:call-template>-->
						</div>
					</div>
					<!-- Line 30 -->
					<div class="styStdDiv" style="min-height:4.7mm;height:auto;">
						<div class="styLNLeftNumBox">30</div>
						<div class="sty1040XDesc" style="width:178mm;min-height:4.7mm;height:auto;">
							List <strong>ALL</strong> dependents (children and others) claimed on this amended return. 
							
							<span style="float:right;">
								<!-- Dependents table -->
								<xsl:if test="(count($FormData/DependentDetail) &gt; 4) and (not($Print) or $Print='')">
									<div class="styStdDiv" style="text-align:right;">
										<xsl:call-template name="SetDynamicTableToggleButton">
											<xsl:with-param name="TargetNode" select="$FormData/DependentDetail"/>
											<xsl:with-param name="containerHeight" select="4"/>
											<xsl:with-param name="headerHeight" select="2"/>
											<xsl:with-param name="containerID" select=" 'depdContainerId' "/>
										</xsl:call-template>
									</div>
								</xsl:if>
							</span>
						</div>
					</div>
					<!--NEW Dependents table-->
					<div class="sty1040DepdContainer" style="display:block;overflow:visible;border-top-width: 1.5px;">
						<div class="styGenericDiv" style="width:20mm;padding-top:1mm;
							font-family:Arial;font-size:7pt;border-bottom:0px solid black;">
							<div style="width:100%;padding-bottom:3mm;padding-left:1mm;">
								<strong>Dependents</strong><br/>
								(see instructions)<br/><br/>
								<div style="font-size:7.5pt;font-family:Arial Narrow">
									<span>If more<br/>than four <br/>dependents,<br/>see instructions<br/>and check<br/>here
									<span class="sty1040XDotLn">..</span></span>
									<label>
										<xsl:call-template name="PopulateLabel">
											<xsl:with-param name="TargetNode" select="$FormData/MoreDependentsInd"/>
											<xsl:with-param name="BackupName">IRS1040NRMoreDependentsInd
										    </xsl:with-param>
										</xsl:call-template>
									</label>
									<!--<span style="width:2px"/>-->
									<input type="checkbox" class="styCkboxNM" style="" aria-label="more than four dependents">
										<xsl:call-template name="PopulateCheckbox">
											<xsl:with-param name="TargetNode" select="$FormData/MoreDependentsInd"/>
											<xsl:with-param name="BackupName">IRS1040NRMoreDependentsInd
											</xsl:with-param>
										</xsl:call-template>
									</input>
								</div>
							</div>
						</div>
						<!--div class="styBB" style="width:187mm;border-width:0px"-->
						<!-- (Table) ///////////////////////////////////////////////-->
						<div class="sty1040DepdContainer2" style="width:167mm;margin-left:0mm;height:auto;">
							<div id="DependentDetailDiv" class="styTableContainerNBB" style="width:100%;border-top-width:0px;">
								<xsl:variable name="DependentDetailCount" select="count($FormData/DependentDetail)"/>
								<table class="styTable" style="width:100%;display:table;border-width-top:1px;" cellspacing="0">
									<thead>
										<tr>
											<td class="styIRS1040TableCell" scope="colgroup" style="width:12%;" aria-hidden="true">
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
												</xsl:call-template>
											</td>
											<th class="styIRS1040TableCell" scope="colgroup" style="width:22%;text-align:center;border-left:1px solid black;">
												<strong>Dependent 1</strong>
											</th>
											<th class="styIRS1040TableCell" scope="colgroup" style="width:22%;text-align:center;border-left:1px solid black;">
												<strong>Dependent 2</strong>
											</th>
											<th class="styIRS1040TableCell" scope="colgroup" style="width:22%;text-align:center;border-left:1px solid black;">
												<strong>Dependent 3</strong>
											</th>
											<xsl:choose>
												<xsl:when test="$DependentDetailCount = 4">
													<th class="styIRS1040TableCell" scope="colgroup" style="width:22%;text-align:center;border-right-width:1px;border-left:1px solid black;">
													<strong>Dependent 4</strong>
													</th>
												</xsl:when>
												<xsl:otherwise>
													<th class="styIRS1040TableCell" scope="colgroup" style="width:22%;text-align:center;border-right-width:0px;border-left:1px solid black;">
													<strong>Dependent 4</strong>
													</th>
												</xsl:otherwise>
											</xsl:choose>
										</tr>
									</thead>
									<tbody>
										<xsl:choose>
											<xsl:when test="$DependentDetailCount = 0 or $DependentDetailCount &gt; 4 or $Print = $Separated">
												<tr>
													<th class="styIRS1040TableCell" style="text-align:left;" scope="row">
														<strong>(1)</strong>
														<span style="padding-left:1mm;font-weight:normal;text-align:left;">First Name</span>
													</th>
													<td class="styIRS1040TableCell" style="text-align:center;border-left:1px solid black;">
														<xsl:if test="$DependentDetailCount &gt; 4 or $Print = $Separated">
															<span>See Additional Data Table</span>
														</xsl:if>
													</td>
													<td class="styIRS1040TableCell" style="border-left:1px solid black;"/>
													<td class="styIRS1040TableCell" style="border-left:1px solid black;"/>
													<td class="styIRS1040TableCell" style="border-right-width:0px;border-left:1px solid black;"/>
												</tr>
												<tr>
													<th class="styIRS1040TableCell" style="text-align:left;" scope="row">
														<strong>(2)</strong>
														<span style="padding-left:1mm;font-weight:normal;text-align:left;">Last Name</span>
													</th>
													<td class="styIRS1040TableCell" style="border-left:1px solid black;"/>
													<td class="styIRS1040TableCell" style="border-left:1px solid black;"/>
													<td class="styIRS1040TableCell" style="border-left:1px solid black;"/>
													<td class="styIRS1040TableCell" style="border-right-width:0px;border-left:1px solid black;"/>
												</tr>
												<tr>
													<th class="styIRS1040TableCell" style="text-align:left;" scope="row">
														<strong>(3)</strong>
														<span style="padding-left:1mm;font-weight:normal;text-align:left;">SSN</span>
													</th>
													<td class="styIRS1040TableCell" style="border-left:1px solid black;"/>
													<td class="styIRS1040TableCell" style="border-left:1px solid black;"/>
													<td class="styIRS1040TableCell" style="border-left:1px solid black;"/>
													<td class="styIRS1040TableCell" style="border-right-width:0px;border-left:1px solid black;"/>
												</tr>
												<tr>
													<th class="styIRS1040TableCell" style="text-align:left;" scope="row">
														<strong>(4)</strong>
														<span style="padding-left:1mm;font-weight:normal;text-align:left;">Relationship</span>
													</th>
													<td class="styIRS1040TableCell" style="border-left:1px solid black;"/>
													<td class="styIRS1040TableCell" style="border-left:1px solid black;"/>
													<td class="styIRS1040TableCell" style="border-left:1px solid black;"/>
													<td class="styIRS1040TableCell" style="border-right-width:0px;border-left:1px solid black;"/>
												</tr>
												<tr>
													<th class="styIRS1040TableCell" style="text-align:left;" scope="row">
														<strong style="vertical-align:top;">(5)</strong>
														<span style="padding-left:1mm;font-weight:normal;text-align:left;font-size:7px;">Check if lived<br/>with you more<br/>than half of<br/>return year<br/>entered at<br/>top of page 1</span>
													</th>
													<td class="styIRS1040TableCell" style="padding-left:3mm;border-left:1px solid black;">
												<strong>(a)</strong>
												<input type="checkbox" aria-label="Live With Dependent 1 Over Half Year"/>Yes<br/>
												<strong>(b)</strong>
												<input type="checkbox" aria-label="And in the U.S."/>And in the U.S.
											  </td>
													<td class="styIRS1040TableCell" style="padding-left:3mm;border-left:1px solid black;">
												<strong>(a)</strong>
												<input type="checkbox" aria-label="Live With Dependent 2 Over Half Year"/>Yes<br/>
												<strong>(b)</strong>
												<input type="checkbox" aria-label="And in the U.S."/>And in the U.S.
											  </td>
													<td class="styIRS1040TableCell" style="padding-left:3mm;border-left:1px solid black;">
											  <strong>(a)</strong>
												<input type="checkbox" aria-label="Live With Dependent 3 Over Half Year"/>Yes<br/>
												<strong>(b)</strong>
												<input type="checkbox" aria-label="And in the U.S."/>And in the U.S.
											  </td>
													<td class="styIRS1040TableCell" style="padding-left:3mm;;border-right-width:0px;border-left:1px solid black;">
											  <strong>(a)</strong>
												<input type="checkbox" aria-label="Live With Dependent 4 Over Half Year"/>Yes<br/>
												<strong>(b)</strong>
												<input type="checkbox" aria-label="And in the U.S."/>And in the U.S.
											  </td>
												</tr>
												<tr>
													<th class="styIRS1040TableCell" style="text-align:left;vertical-align:top;" scope="row">
														<strong>(6)</strong>
														<span style="padding-left:1mm;font-weight:normal;text-align:left;">Check if</span>
													</th>
													<td class="styIRS1040TableCell" style="height:9mm;border-left:1px solid black;">
														<div style="width:49%;height:inherit;float:left;border-right:1px solid black;">
															<div style="width:30%;height:100%;vertical-align:top;">
																<input type="checkbox" class="styCkbox" aria-label="Dependent 1 is a Full-time student"/>
															</div>
															<div style="width:65%;height:100%;padding-top:0.5mm;">Full-time student</div>
														</div>
														<div style="width:51%;height:inherit;float:right;">
															<div style="width:22%;height:100%;">
																<input type="checkbox" class="styCkbox" aria-label="Dependent 1 is Permanently and totally disabled"/>
															</div>
															<div style="width:70%;height:100%;padding-top:0.5mm;">Permanently and totally disabled</div>
														</div>
													</td>
													<td class="styIRS1040TableCell" style="height:9mm;border-left:1px solid black;">
														<div style="width:49%;height:inherit;float:left;border-right:1px solid black;">
															<div style="width:30%;height:100%;vertical-align:top;">
																<input type="checkbox" class="styCkbox" aria-label="Dependent 2 is a Full-time student"/>
															</div>
															<div style="width:65%;height:100%;padding-top:0.5mm;">Full-time student</div>
														</div>
														<div style="width:51%;height:inherit;float:right;">
															<div style="width:22%;height:100%;">
																<input type="checkbox" class="styCkbox" aria-label="Dependent 2 is Permanently and totally disabled"/>
															</div>
															<div style="width:70%;height:100%;padding-top:0.5mm;">Permanently and totally disabled</div>
														</div>
													</td>
													<td class="styIRS1040TableCell" style="height:9mm;border-left:1px solid black;">
														<div style="width:49%;height:inherit;float:left;border-right:1px solid black;">
															<div style="width:30%;height:100%;vertical-align:top;">
																<input type="checkbox" class="styCkbox" aria-label="Dependent 3 is a Full-time student"/>
															</div>
															<div style="width:65%;height:100%;padding-top:0.5mm;">Full-time student</div>
														</div>
														<div style="width:51%;height:inherit;float:right;">
															<div style="width:22%;height:100%;">
																<input type="checkbox" class="styCkbox" aria-label="Dependent 3 is Permanently and totally disabled"/>
															</div>
															<div style="width:70%;height:100%;padding-top:0.5mm;">Permanently and totally disabled</div>
														</div>
													</td>
													<td class="styIRS1040TableCell" style="height:9mm;border-right:0px;border-left:1px solid black;">
														<div style="width:49%;height:inherit;float:left;border-right:1px solid black;">
															<div style="width:30%;height:100%;vertical-align:top;">
																<input type="checkbox" class="styCkbox" aria-label="Dependent 4 is a Full-time student"/>
															</div>
															<div style="width:65%;height:100%;padding-top:0.5mm;">Full-time student</div>
														</div>
														<div style="width:51%;height:inherit;float:right;">
															<div style="width:22%;height:100%;">
																<input type="checkbox" class="styCkbox" aria-label="Dependent 4 is Permanently and totally disabled"/>
															</div>
															<div style="width:70%;height:100%;padding-top:0.5mm;">Permanently and totally disabled</div>
														</div>
													</td>
												</tr>
												<tr>
													<th class="styIRS1040TableCell" style="text-align:left;vertical-align:top;" scope="row">
														<strong>(7)</strong>
														<span style="padding-left:1mm;font-weight:normal;text-align:left;">Credits</span>
													</th>
													<td class="styIRS1040TableCell" style="height:9mm;text-align:left;border-left:1px solid black;">
														<div style="width:49%;height:inherit;float:left;border-right:1px solid black;">
															<div style="width:30%;height:100%;">
																<input type="checkbox" class="styCkbox" aria-label="Dependent 1 Child Tax Credit Eligible"/>
															</div>
															<div style="width:65%;height:100%;padding-top:0.5mm;">Child tax credit</div>
														</div>
														<div style="width:51%;height:inherit;float:right;">
															<div style="width:22%;height:100%;">
																<input type="checkbox" class="styCkbox" aria-label="Dependent 1 Credit For Other Dependents Eligible"/>
															</div>
															<div style="width:70%;height:100%;padding-top:0.5mm;">Credit for other dependents</div>
														</div>
													</td>
													<td class="styIRS1040TableCell" style="height:9mm;border-left:1px solid black;">
														<div style="width:49%;height:inherit;float:left;border-right:1px solid black;">
															<div style="width:30%;height:100%;">
																<input type="checkbox" class="styCkbox" aria-label="Dependent 2 Child Tax Credit Eligible"/>
															</div>
															<div style="width:65%;height:100%;padding-top:0.5mm;">Child tax credit</div>
														</div>
														<div style="width:51%;height:inherit;float:right;">
															<div style="width:22%;height:100%;">
																<input type="checkbox" class="styCkbox" aria-label="Dependent 2 Credit For Other Dependents Eligible"/>
															</div>
															<div style="width:70%;height:100%;padding-top:0.5mm;">Credit for other dependents</div>
														</div>
													</td>
													<td class="styIRS1040TableCell" style="height:9mm;border-left:1px solid black;">
														<div style="width:49%;height:inherit;float:left;border-right:1px solid black;">
															<div style="width:30%;height:100%;">
																<input type="checkbox" class="styCkbox" aria-label="Dependent 3 Child Tax Credit Eligible"/>
															</div>
															<div style="width:65%;height:100%;padding-top:0.5mm;">Child tax credit</div>
														</div>
														<div style="width:51%;height:inherit;float:right;">
															<div style="width:22%;height:100%;">
																<input type="checkbox" class="styCkbox" aria-label="Dependent 3 Credit For Other Dependents Eligible"/>
															</div>
															<div style="width:70%;height:100%;padding-top:0.5mm;">Credit for other dependents</div>
														</div>
													</td>
													<td class="styIRS1040TableCell" style="height:9mm;border-right:0px;border-left:1px solid black;">
														<div style="width:49%;height:inherit;float:left;border-right:1px solid black;">
															<div style="width:30%;height:100%;">
																<input type="checkbox" class="styCkbox" aria-label="Dependent 4 Child Tax Credit Eligible"/>
															</div>
															<div style="width:65%;height:100%;padding-top:0.5mm;">Child tax credit</div>
														</div>
														<div style="width:51%;height:inherit;float:right;">
															<div style="width:22%;height:100%;">
																<input type="checkbox" class="styCkbox" aria-label="Dependent 4 Credit For Other Dependents Eligible"/>
															</div>
															<div style="width:70%;height:100%;padding-top:0.5mm;">Credit for other dependents</div>
														</div>
													</td>
												</tr>
											</xsl:when>
											<xsl:when test="$DependentDetailCount &lt;=4">
												<!-- First Name row -->
												<tr>
													<th class="styIRS1040TableCell" style="text-align:left;" scope="row">
														<strong>(1)</strong>
														<span style="padding-left:1mm;font-weight:normal;text-align:left;">First Name</span>
													</th>
													<xsl:for-each select="$FormData/DependentDetail">
														<td class="styIRS1040TableCell" style="text-align:center;border-left:1px solid black;">
															<xsl:value-of select="DependentFirstNm"/>
														</td>
													</xsl:for-each>
													<xsl:if test="$DependentDetailCount &lt; 4">
														<xsl:choose>
															<xsl:when test="$DependentDetailCount = 3">
																<td class="styIRS1040TableCell" style="border-right-width:0px;border-left:1px solid black"/>
															</xsl:when>
															<xsl:when test="$DependentDetailCount = 2">
																<td class="styIRS1040TableCell" style="border-left:1px solid black;"/>
																<td class="styIRS1040TableCell" style="border-right-width:0px;border-left:1px solid black"/>
															</xsl:when>
															<xsl:when test="$DependentDetailCount = 1">
																<td class="styIRS1040TableCell" style="border-left:1px solid black;"/>
																<td class="styIRS1040TableCell" style="border-left:1px solid black;"/>
																<td class="styIRS1040TableCell" style="border-right-width:0px;border-left:1px solid black"/>
															</xsl:when>
														</xsl:choose>
													</xsl:if>
												</tr>
												<!-- Last Name row -->
												<tr>
													<th class="styIRS1040TableCell" style="text-align:left;" scope="row">
														<strong>(2)</strong>
														<span style="padding-left:1mm;font-weight:normal;text-align:left;">Last Name</span>
													</th>
													<xsl:for-each select="$FormData/DependentDetail">
														<td class="styIRS1040TableCell" style="text-align:center;border-left:1px solid black">
															<xsl:value-of select="DependentLastNm"/>
															<span style="padding-left:2mm"/>
															<xsl:value-of select="DependentNameControlTxt"/>
															<span style="float:right;">
																<xsl:call-template name="LinkToLeftoverDataTableInline">
																	<xsl:with-param name="Desc">Dependent <xsl:number value="position()"/> Name Control</xsl:with-param>
																	<xsl:with-param name="TargetNode" select="DependentNameControlTxt"/>
																</xsl:call-template>
															</span>
														</td>
													</xsl:for-each>
													<xsl:if test="$DependentDetailCount &lt; 4">
														<xsl:choose>
															<xsl:when test="$DependentDetailCount = 3">
																<td class="styIRS1040TableCell" style="border-right-width:0px;border-left:1px solid black"/>
															</xsl:when>
															<xsl:when test="$DependentDetailCount = 2">
																<td class="styIRS1040TableCell" style="border-left:1px solid black;"/>
																<td class="styIRS1040TableCell" style="border-right-width:0px;border-left:1px solid black"/>
															</xsl:when>
															<xsl:when test="$DependentDetailCount = 1">
																<td class="styIRS1040TableCell" style="border-left:1px solid black;"/>
																<td class="styIRS1040TableCell" style="border-left:1px solid black;"/>
																<td class="styIRS1040TableCell" style="border-right-width:0px;border-left:1px solid black"/>
															</xsl:when>
														</xsl:choose>
													</xsl:if>
												</tr>
												<!-- SSN row -->
												<tr>
													<th class="styIRS1040TableCell" style="text-align:left;" scope="row">
														<strong>(3)</strong>
														<span style="padding-left:1mm;font-weight:normal;text-align:left;">SSN</span>
													</th>
													<xsl:for-each select="$FormData/DependentDetail">
														<td class="styIRS1040TableCell" style="text-align:center;border-left:1px solid black;">
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
																<td class="styIRS1040TableCell" style="border-right-width:0px;border-left:1px solid black"/>
															</xsl:when>
															<xsl:when test="$DependentDetailCount = 2">
																<td class="styIRS1040TableCell" style="border-left:1px solid black"/>
																<td class="styIRS1040TableCell" style="border-right-width:0px;border-left:1px solid black"/>
															</xsl:when>
															<xsl:when test="$DependentDetailCount = 1">
																<td class="styIRS1040TableCell" style="border-left:1px solid black"/>
																<td class="styIRS1040TableCell" style="border-left:1px solid black"/>
																<td class="styIRS1040TableCell" style="border-right-width:0px;border-left:1px solid black"/>
															</xsl:when>
														</xsl:choose>
													</xsl:if>
												</tr>
												<!-- Relationship block -->
												<tr>
													<th class="styIRS1040TableCell" style="text-align:left;" scope="row">
														<strong>(4)</strong>
														<span style="padding-left:1mm;font-weight:normal;text-align:left;">Relationship</span>
													</th>
													<xsl:for-each select="$FormData/DependentDetail">
														<td class="styIRS1040TableCell" style="text-align:center;border-left:1px solid black">
															<xsl:value-of select="DependentRelationshipCd"/>
														</td>
													</xsl:for-each>
													<xsl:if test="$DependentDetailCount &lt; 4">
														<xsl:choose>
															<xsl:when test="$DependentDetailCount = 3">
																<td class="styIRS1040TableCell" style="border-right-width:0px;border-left:1px solid black"/>
															</xsl:when>
															<xsl:when test="$DependentDetailCount = 2">
																<td class="styIRS1040TableCell" style="border-left:1px solid black"/>
																<td class="styIRS1040TableCell" style="border-right-width:0px;border-left:1px solid black"/>
															</xsl:when>
															<xsl:when test="$DependentDetailCount = 1">
																<td class="styIRS1040TableCell" style="border-left:1px solid black"/>
																<td class="styIRS1040TableCell" style="border-left:1px solid black"/>
																<td class="styIRS1040TableCell" style="border-right-width:0px;border-left:1px solid black"/>
															</xsl:when>
														</xsl:choose>
													</xsl:if>
												</tr>
												<!-- Check if lived with you more than half of 2025 block -->
												<tr>
													<th class="styIRS1040TableCell" style="text-align:left;" scope="row">
														<strong style="vertical-align:top;">(5)</strong>
														<span style="padding-left:1mm;font-weight:normal;text-align:left;font-size:7px;">Check if lived<br/>with you more<br/>than half of<br/>return year<br/>entered at<br/>top of page 1</span>
													</th>
													<xsl:for-each select="$FormData/DependentDetail">
														<td class="styIRS1040TableCell" style="text-align:center;border-left:1px solid black;">
															<span style="width:2mm;"/>
															<!-- 1 Yes checkbox -->
															<span style="float:left;padding-left:3mm;">
																<strong>(a)</strong>
																<input type="checkbox" class="styCkbox">
														<xsl:attribute name="aria-label">Live With Dependent <xsl:value-of select="position()"/> Over Half Year"</xsl:attribute>
														<xsl:call-template name="PopulateCheckbox">
																		<xsl:with-param name="TargetNode" select="YesLiveWithChildOverHalfYrInd"/>
																		<xsl:with-param name="BackupName">IRS1040CTCInd</xsl:with-param>
																	</xsl:call-template>
														Yes
													  </input>
															</span>
															<br/>
															<!-- 2 And in the US checkbox -->
															<span style="float:left;padding-left:3mm;">
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
																<td class="styIRS1040TableCell" style="border-right-width:0px;border-left:1px solid black;padding-left:3mm">
													<strong>(a)</strong>
													<input type="checkbox" aria-label="Live With Dependent 4 Over Half Year"/>Yes<br/>
													<strong>(b)</strong>
													<input type="checkbox" aria-label="And in the U.S."/>And in the U.S.</td>
															</xsl:when>
															<xsl:when test="$DependentDetailCount = 2">
																<td class="styIRS1040TableCell" style="padding-left:3mm;border-left:1px solid black">
													<strong>(a)</strong>
													<input type="checkbox" aria-label="Live With Dependent 3 Over Half Year"/>Yes<br/>
													<strong>(b)</strong>
													<input type="checkbox" aria-label="And in the U.S."/>And in the U.S.</td>
																<td class="styIRS1040TableCell" style="border-right-width:0px;padding-left:3mm;border-left:1px solid black">
													<strong>(a)</strong>
													<input type="checkbox" aria-label="Live With Dependent 4 Over Half Year"/>Yes<br/>
													<strong>(b)</strong>
													<input type="checkbox" aria-label="And in the U.S."/>And in the U.S.</td>
															</xsl:when>
															<xsl:when test="$DependentDetailCount = 1">
																<td class="styIRS1040TableCell" style="padding-left:3mm;border-left:1px solid black">
													<strong>(a)</strong>
													<input type="checkbox" aria-label="Live With Dependent 2 Over Half Year"/>Yes<br/>
													<strong>(b)</strong>
													<input type="checkbox" aria-label="And in the U.S."/>And in the U.S.</td>
																<td class="styIRS1040TableCell" style="padding-left:3mm;border-left:1px solid black">
													<strong>(a)</strong>
													<input type="checkbox" aria-label="Live With Dependent 4 Over Half Year"/>Yes<br/>
													<strong>(b)</strong>
													<input type="checkbox" aria-label="And in the U.S."/>And in the U.S.</td>
																<td class="styIRS1040TableCell" style="border-right-width:0px;padding-left:3mm;border-left:1px solid black">
													<strong>(a)</strong>
													<input type="checkbox" aria-label="Live With Dependent 4 Over Half Year"/>Yes<br/>
													<strong>(b)</strong>
													<input type="checkbox" aria-label="And in the U.S."/>And in the U.S.</td>
															</xsl:when>
														</xsl:choose>
													</xsl:if>
												</tr>
												<!-- Check if lived with you more than half of 2025 block -->
												<tr>
													<th class="styIRS1040TableCell" style="text-align:left;vertical-align:top;" scope="row">
														<strong>(6)</strong>
														<span style="padding-left:1mm;font-weight:normal;text-align:middle;">Check if</span>
													</th>
													<xsl:for-each select="$FormData/DependentDetail">
														<td class="styIRS1040TableCell" style="text-align:left;height:9mm;border-left:1px solid black;padding: 0px 1px 0px 1px;">
															<!--<span class="">-->
																<div class="styIRS1040liTableCell" style="float:left;width:49.8%;height:100%;">
																	<!-- Full-time student checkbox -->
																	<span style="float:left;">
																		<div style="width:30%;height:100%;vertical-align:top;">
																			<input type="checkbox" class="styCkbox">
																				<xsl:attribute name="aria-label">Dependent <xsl:value-of select="position()"/> is a Full-time student"</xsl:attribute>
																				<xsl:call-template name="PopulateCheckbox">
																					<xsl:with-param name="TargetNode" select="ChildIsAStudentUnder24Ind"/>
																					<xsl:with-param name="BackupName">IRS1040ChildIsAStudentUnder24Ind</xsl:with-param>
																				</xsl:call-template>
																			</input>
																		</div>
																		<div style="width:65%;height:100%;padding-top:0.5mm;text-align:left;">Full-time student</div>
																	</span>
																</div>
																<div class="styIRS1040liTableCell" style="float:left;width:50%;border-left:1px solid;height:100%;">
																	<!-- Permanently and totally disabled checkbox -->
																	<span style="float:left;font-size:7px;height:100%">
																		<div style="width:30%;height:100%;vertical-align:top;">
																			<input type="checkbox" class="styCkbox">
																				<xsl:attribute name="aria-label">Dependent <xsl:value-of select="position()"/> is Permanently and totally disabled"</xsl:attribute>
																				<xsl:call-template name="PopulateCheckbox">
																					<xsl:with-param name="TargetNode" select="ChildPermanentlyDisabledInd"/>
																					<xsl:with-param name="BackupName">IRS1040ChildPermanentlyDisabledInd</xsl:with-param>
																				</xsl:call-template>
																			</input>
																		</div>
																		<div style="width:65%;height:100%;padding-top:0.5mm;text-align:left;">Permanently and totally disabled</div>
																	</span>
																</div>
															<!--</span>-->
														</td>
													</xsl:for-each>
													<xsl:if test="$DependentDetailCount &lt; 4">
														<xsl:choose>
															<xsl:when test="$DependentDetailCount = 3">
																<td class="styIRS1040TableCell" style="text-align:center;height:9mm;border-left:1px solid black;border-right: 0px;padding: 0px 1px 0px 1px;">
																	<div class="styIRS1040li2TableCell" style="float:left;width:49.8%;height:100%;border-right:1px solid black;">
																		<span style="float:left;">
																			<div style="width:30%;height:100%;vertical-align:top;">
																				<input type="checkbox" aria-label="Dependent 4 is a Full-time student"/>
																			</div>
																			<div style="width:65%;height:100%;padding-top:0.5mm;text-align:left;">
													Full-time student
													</div>
																		</span>
																	</div>
																	<div class="styIRS1040li2TableCell" style="float:right;width:50%;height:100%;border-left:1px;">
																		<span style="float:right;font-size:7px">
																			<div style="width:30%;height:100%;vertical-align:top;">
																				<input type="checkbox" aria-label="Dependent 4 is Permanently and totally disabled"/>
																			</div>
																			<div style="width:65%;height:100%;padding-top:0.5mm;text-align:left;">Permanently and totally disabled</div>
																		</span>
																	</div>
																</td>
															</xsl:when>
															<xsl:when test="$DependentDetailCount = 2">
																<td class="styIRS1040TableCell" style="text-align:center;height:9mm;border-left:1px solid black;padding: 0px 1px 0px 1px;">
																	<div class="styIRS1040li2TableCell" style="float:left;width:49.8%;height:100%;border-right:1px solid black;">
																		<span style="float:left;">
																			<div style="width:30%;height:100%;vertical-align:top;">
																				<input type="checkbox" aria-label="Dependent 3 is a Full-time student"/>
																			</div>
																			<div style="width:65%;height:100%;padding-top:0.5mm;text-align:left;">
													Full-time student
													</div>
																		</span>
																	</div>
																	<div class="styIRS1040li2TableCell" style="float:right;width:49.8%;height:i100%;">
																		<span style="float:right;font-size:7px">
																			<div style="width:30%;height:100%;vertical-align:top;">
																				<input type="checkbox" aria-label="Dependent 3 is Permanently and totally disabled"/>
																			</div>
																			<div style="width:65%;height:100%;padding-top:0.5mm;text-align:left;">Permanently and totally disabled</div>
																		</span>
																	</div>
																</td>
																<td class="styIRS1040TableCell" style="text-align:center;height:9mm;border-left:1px solid black;border-right:0px;padding: 0px 1px 0px 1px;">
																	<div class="styIRS1040li2TableCell" style="float:left;width:49.8%;height:100%;border-right:1px solid black;">
																		<span style="float:left;">
																			<div style="width:30%;height:100%;vertical-align:top;">
																				<input type="checkbox" aria-label="Dependent 4 is a Full-time student"/>
																			</div>
																			<div style="width:65%;height:100%;padding-top:0.5mm;text-align:left;">Full-time student</div>
																		</span>
																	</div>
																	<div class="styIRS1040li2TableCell" style="float:right;width:50%;height:100%;">
																		<span style="float:right;font-size:7px">
																			<div style="width:30%;height:100%;vertical-align:top;">
																				<input type="checkbox" aria-label="Dependent 4 is Permanently and totally disabled"/>
																			</div>
																			<div style="width:65%;height:100%;padding-top:0.5mm;text-align:left;">Permanently and totally disabled</div>
																		</span>
																	</div>
																</td>
															</xsl:when>
															<xsl:when test="$DependentDetailCount = 1">
																<td class="styIRS1040TableCell" style="text-align:center;height:9mm;border-left:1px solid black;padding: 0px 1px 0px 1px;">
																	<div class="styIRS1040li2TableCell" style="float:left;width:49.8%;height:100%;border-right:1px solid black;">
																		<span style="float:left;">
																			<div style="width:30%;height:100%;vertical-align:top;">
																				<input type="checkbox" aria-label="Dependent 2 is a Full-time student"/>
																			</div>
																			<div style="width:65%;height:100%;padding-top:0.5mm;text-align:left;">Full-time student</div>
																		</span>
																	</div>
																	<div class="styIRS1040li2TableCell" style="float:right;width:50%;height:100%;">
																		<span style="float:right;font-size:7px">
																			<div style="width:30%;height:100%;vertical-align:top;">
																				<input type="checkbox" aria-label="Dependent 2 is Permanently and totally disabled"/>
																			</div>
																			<div style="width:65%;height:100%;padding-top:0.5mm;text-align:left;">Permanently and totally disabled</div>
																		</span>
																	</div>
																</td>
																<td class="styIRS1040TableCell" style="text-align:center;height:9mm;border-left:1px solid black;padding: 0px 1px 0px 1px;">
																	<div class="styIRS1040li2TableCell" style="float:left;width:49.8%;height:100%;border-right:1px solid black;">
																		<span style="float:left;">
																			<div style="width:30%;height:100%;vertical-align:top;">
																				<input type="checkbox" aria-label="Dependent 3 is a Full-time student"/>
																			</div>
																			<div style="width:65%;height:100%;padding-top:0.5mm;text-align:left;">Full-time student</div>
																		</span>
																	</div>
																	<div class="styIRS1040li2TableCell" style="float:right;width:50%;height:100%;">
																		<span style="float:right;font-size:7px">
																			<div style="width:30%;height:100%;vertical-align:top;">
																				<input type="checkbox" aria-label="Dependent 3 is Permanently and totally disabled"/>
																			</div>
																			<div style="width:65%;height:100%;padding-top:0.5mm;text-align:left;">Permanently and totally disabled</div>
																		</span>
																	</div>
																</td>
																<td class="styIRS1040TableCell" style="text-align:center;height:9mm;border-left:1px solid black;border-right:0px;padding: 0px 1px 0px 1px;">
																	<div class="styIRS1040li2TableCell" style="float:left;width:49.8%;height:100%;border-right:1px solid black;">
																		<span style="float:left;">
																			<div style="width:30%;height:100%;vertical-align:top;">
																				<input type="checkbox" aria-label="Dependent 4 is a Full-time student"/>
																			</div>
																			<div style="width:65%;height:100%;padding-top:0.5mm;text-align:left;">Full-time student</div>
																		</span>
																	</div>
																	<div class="styIRS1040li2TableCell" style="float:right;width:50%;height:100%;">
																		<span style="float:right;font-size:7px">
																			<div style="width:30%;height:100%;vertical-align:top;">
																				<input type="checkbox" aria-label="Dependent 4 is Permanently and totally disabled"/>
																			</div>
																			<div style="width:65%;height:100%;padding-top:0.5mm;text-align:left;">Permanently and totally disabled</div>
																		</span>
																	</div>
																</td>
															</xsl:when>
														</xsl:choose>
													</xsl:if>
												</tr>
												<!-- Credit block -->
												<tr>
													<th class="styIRS1040TableCell" style="text-align:left;vertical-align:top;" scope="row">
														<strong>(7)</strong>
														<span style="padding-left:1mm;font-weight:normal;text-align:middle;">Credits</span>
													</th>
													<xsl:for-each select="$FormData/DependentDetail">
														<td class="styIRS1040TableCell" style="text-align:center;border-left:1px solid black;padding: 0px 1px 0px 0px;">
															<!--<span class="">-->
																<div class="styIRS1040liTableCell" style="float:left;width:49.8%;height:auto;height:100%;">
																	<!-- Child Tax Credit checkbox -->
																	<span style="float:left;">
																		<div style="width:30%;height:100%;vertical-align:top;">
																			<input type="checkbox" class="styCkbox">
																				<xsl:attribute name="aria-label">Dependent <xsl:value-of select="position()"/> Child Tax Credit Eligible"</xsl:attribute>
																				<xsl:call-template name="PopulateCheckbox">
																					<xsl:with-param name="TargetNode" select="EligibleForChildTaxCreditInd"/>
																					<xsl:with-param name="BackupName">IRS1040EligibleForChildTaxCreditInd</xsl:with-param>
																				</xsl:call-template>
																			</input>
																		</div>
																		<div style="width:65%;height:100%;padding-top:0.5mm;text-align:left;">Child Tax Credit</div>
																	</span>
																</div>
																<div class="styIRS1040liTableCell" style="float:right;width:50%;border-left:1px solid;height:100%;">
																	<!-- Eligible For Other Dependents Credit checkbox -->
																	<span style="float:left;font-size:7px;">
																		<div style="width:30%;height:100%;vertical-align:top;">
																			<input type="checkbox" class="styCkbox">
																				<xsl:attribute name="aria-label">Dependent <xsl:value-of select="position()"/> is Eligible For Other Dependents Credit"</xsl:attribute>
																				<xsl:call-template name="PopulateCheckbox">
																					<xsl:with-param name="TargetNode" select="EligibleForODCInd"/>
																					<xsl:with-param name="BackupName">IRS1040EligibleForODCInd</xsl:with-param>
																				</xsl:call-template>
																			</input>
																		</div>
																		<div style="width:65%;height:100%;padding-top:0.5mm;text-align:left;">Credit for other dependents</div>
																	</span>
																</div>
															<!--</span>-->
														</td>
													</xsl:for-each>
													<xsl:if test="$DependentDetailCount &lt; 4">
														<xsl:choose>
															<xsl:when test="$DependentDetailCount = 3">
																<td class="styIRS1040TableCell" style="text-align:center;height:7mm;border-left:1px solid black;border-right:0px;padding: 0px 1px 0px 0px;">
																	<div class="styIRS1040li2TableCell" style="float:left;width:49.8%;height:100%;">
																		<span style="float:left;font-size:7px;">
																			<div style="width:30%;height:100%;vertical-align:top;">
																				<input type="checkbox" aria-label="Dependent 4 is Child Tax Credit Eligible"/>
																			</div>
																			<div style="width:65%;height:100%;padding-top:0.5mm;text-align:left;">Child Tax Credit</div>
																		</span>
																	</div>
																	<div class="styIRS1040li2TableCell" style="float:right;width:50%;height:100%;border-left:1px solid;">
																		<span style="float:right;font-size:7px;">
																			<div style="width:30%;height:100%;vertical-align:top;">
																				<input type="checkbox" aria-label="Dependent 4 is Eligible For Other Dependents Credit"/>
																			</div>
																			<div style="width:65%;height:100%;padding-top:0.5mm;text-align:left;">Credit for other dependents</div>
																		</span>
																	</div>
																</td>
															</xsl:when>
															<xsl:when test="$DependentDetailCount = 2">
																<td class="styIRS1040TableCell" style="text-align:center;height:7mm;border-left:1px solid black;padding: 0px 1px 0px 1px;">
																	<div class="styIRS1040li2TableCell" style="float:left;width:49.8%;height:100%;border-right:1px solid black;">
																		<span style="float:left;">
																			<div style="width:30%;height:100%;vertical-align:top;">
																				<input type="checkbox" aria-label="Dependent 3 is Child Tax Credit Eligible"/>
																			</div>
																			<div style="width:65%;height:100%;padding-top:0.5mm;text-align:left;">Child Tax Credit</div>
																		</span>
																	</div>
																	<div class="styIRS1040li2TableCell" style="float:right;width:49.8%;height:100%;">
																		<span style="float:right;font-size:7px;">
																			<div style="width:30%;height:100%;vertical-align:top;">
																				<input type="checkbox" aria-label="Dependent 3 is Eligible For Other Dependents Credit"/>
																			</div>
																			<div style="width:65%;height:100%;padding-top:0.5mm;text-align:left;">Credit for other dependents</div>
																		</span>
																	</div>
																</td>
																<td class="styIRS1040TableCell" style="text-align:center;height:7mm;border-left:1px solid black;border-right:0px;padding: 0px 1px 0px 1px;">
																	<div class="styIRS1040li2TableCell" style="float:left;width:49.8%;height:100%;border-right:1px solid black;">
																		<span style="float:left;">
																			<div style="width:30%;height:100%;vertical-align:top;">
																				<input type="checkbox" aria-label="Dependent 4 is Child Tax Credit Eligible"/>
																			</div>
																			<div style="width:65%;height:100%;padding-top:0.5mm;text-align:left;">Child Tax Credit</div>
																		</span>
																	</div>
																	<div class="styIRS1040li2TableCell" style="float:right;width:49.8%;height:100%;">
																		<span style="float:right;font-size:7px;">
																			<div style="width:30%;height:100%;vertical-align:top;">
																				<input type="checkbox" aria-label="Dependent 4 is Eligible For Other Dependents Credit"/>
																			</div>
																			<div style="width:65%;height:100%;padding-top:0.5mm;text-align:left;">Credit for other dependents</div>
																		</span>
																	</div>
																</td>
															</xsl:when>
															<xsl:when test="$DependentDetailCount = 1">
																<td class="styIRS1040TableCell" style="text-align:center;height:9mm;border-left:1px solid black;padding: 0px 1px 0px 1px;">
																	<div class="styIRS1040li2TableCell" style="float:left;width:49.8%;height:100%;border-right:1px solid black;">
																		<span style="float:left;">
																			<div style="width:30%;height:100%;vertical-align:top;">
																				<input type="checkbox" aria-label="Dependent 2 is Child Tax Credit Eligible"/>
																			</div>
																			<div style="width:65%;height:100%;padding-top:0.5mm;text-align:left;">Child Tax Credit</div>
																		</span>
																	</div>
																	<div class="styIRS1040li2TableCell" style="float:right;width:49.8%;height:100%;">
																		<span style="float:right;font-size:7px;">
																			<div style="width:30%;height:100%;vertical-align:top;">
																				<input type="checkbox" aria-label="Dependent 2 is Eligible For Other Dependents Credit"/>
																			</div>
																			<div style="width:65%;height:100%;padding-top:0.5mm;text-align:left;">Credit for other dependents</div>
																		</span>
																	</div>
																</td>
																<td class="styIRS1040TableCell" style="text-align:center;height:9mm;border-left:1px solid black;padding: 0px 1px 0px 1px;">
																	<div class="styIRS1040li2TableCell" style="float:left;width:49.8%;height:100%;border-right:1px solid black;">
																		<span style="float:left;">
																			<div style="width:30%;height:100%;vertical-align:top;">
																				<input type="checkbox" aria-label="Dependent 3 is Child Tax Credit Eligible"/>
																			</div>
																			<div style="width:65%;height:100%;padding-top:0.5mm;text-align:left;">Child Tax Credit</div>
																		</span>
																	</div>
																	<div class="styIRS1040li2TableCell" style="float:right;width:49.8%;height:100%;">
																		<span style="float:right;font-size:7px;">
																			<div style="width:30%;height:100%;vertical-align:top;">
																				<input type="checkbox" aria-label="Dependent 3 is Eligible For Other Dependents Credit"/>
																			</div>
																			<div style="width:65%;height:100%;padding-top:0.5mm;text-align:left;">Credit for other dependents</div>
																		</span>
																	</div>
																</td>
																<td class="styIRS1040TableCell" style="border-right-width:0px;text-align:center;height:9mm;border-left:1px solid black;padding: 0px 1px 0px 1px;">
																	<div class="styIRS1040li2TableCell" style="float:left;width:49.8%;height:100%;border-right:1px solid black;">
																		<span style="float:left;">
																			<div style="width:30%;height:100%;vertical-align:top;">
																				<input type="checkbox" aria-label="Dependent 4 is Child Tax Credit Eligible"/>
																			</div>
																			<div style="width:65%;height:100%;padding-top:0.5mm;text-align:left;">Child Tax Credit</div>
																		</span>
																	</div>
																	<div class="styIRS1040li2TableCell" style="float:right;width:49.8%;height:100%;">
																		<span style="float:right;font-size:7px;">
																			<div style="width:30%;height:100%;vertical-align:top;">
																				<input type="checkbox" aria-label="Dependent 4 is Eligible For Other Dependents Credit"/>
																			</div>
																			<div style="width:65%;height:100%;padding-top:0.5mm;text-align:left;">Credit for other dependents</div>
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
													<th class="styIRS1040TableCell" style="text-align:left;" scope="row">
														<strong>(1)</strong>
														<span style="padding-left:1mm;font-weight:normal;text-align:left;">First Name</span>
													</th>
													<td class="styIRS1040TableCell">
														<span style="padding-left:2mm;">See Additional Data Table</span>
													</td>
													<td class="styIRS1040TableCell" style="border-left:1px solid black;"/>
													<td class="styIRS1040TableCell" style="border-left:1px solid black;"/>
													<td class="styIRS1040TableCell" style="border-right-width:0px;"/>
												</tr>
												<tr>
													<th class="styIRS1040TableCell" style="text-align:left;" scope="row">
														<strong>(2)</strong>
														<span style="padding-left:1mm;font-weight:normal;text-align:left;">Last Name</span>
													</th>
													<td class="styIRS1040TableCell" style="border-left:1px solid black;"/>
													<td class="styIRS1040TableCell" style="border-left:1px solid black;"/>
													<td class="styIRS1040TableCell" style="border-left:1px solid black;"/>
													<td class="styIRS1040TableCell" style="border-right-width:0px;"/>
												</tr>
												<tr>
													<th class="styIRS1040TableCell" style="text-align:left;" scope="row">
														<strong>(3)</strong>
														<span style="padding-left:1mm;font-weight:normal;text-align:left;">SSN</span>
													</th>
													<td class="styIRS1040TableCell" style="border-left:1px solid black;"/>
													<td class="styIRS1040TableCell" style="border-left:1px solid black;"/>
													<td class="styIRS1040TableCell" style="border-left:1px solid black;"/>
													<td class="styIRS1040TableCell" style="border-right-width:0px;"/>
												</tr>
												<tr>
													<th class="styIRS1040TableCell" style="text-align:left;" scope="row">
														<strong>(4)</strong>
														<span style="padding-left:1mm;font-weight:normal;text-align:left;">Relationship</span>
													</th>
													<td class="styIRS1040TableCell" style="border-left:1px solid black;"/>
													<td class="styIRS1040TableCell" style="border-left:1px solid black;"/>
													<td class="styIRS1040TableCell" style="border-left:1px solid black;"/>
													<td class="styIRS1040TableCell" style="border-right-width:0px;"/>
												</tr>
												<tr>
													<th class="styIRS1040TableCell" style="text-align:left;" scope="row">
														<strong>(5)</strong>
														<span style="padding-left:1mm;font-weight:normal;text-align:left;font-size:7px;">Check if lived<br/>with you more<br/>than half of<br/>return year<br/>entered at<br/>top of page 1</span>
													</th>
													<td class="styIRS1040TableCell" style="border-left:1px solid black;"/>
													<td class="styIRS1040TableCell" style="border-left:1px solid black;"/>
													<td class="styIRS1040TableCell" style="border-left:1px solid black;"/>
													<td class="styIRS1040TableCell" style="border-right-width:0px;"/>
												</tr>
												<tr>
													<th class="styIRS1040TableCell" style="text-align:left;vertical-align:top;" scope="row">
														<strong>(6)</strong>
														<span style="padding-left:1mm;font-weight:normal;text-align:left;">Check if</span>
													</th>
													<td class="styIRS1040TableCell" style="border-left:1px solid black;"/>
													<td class="styIRS1040TableCell" style="border-left:1px solid black;"/>
													<td class="styIRS1040TableCell" style="border-left:1px solid black;"/>
													<td class="styIRS1040TableCell" style="border-right-width:0px;border-left:1px solid black;"/>
												</tr>
												<tr>
													<th class="styIRS1040TableCell" style="text-align:left;vertical-align:top;" scope="row">
														<strong>(7)</strong>
														<span style="padding-left:1mm;font-weight:normal;text-align:left;">Credits</span>
													</th>
													<td class="styIRS1040TableCell" style="border-left:1px solid black;"/>
													<td class="styIRS1040TableCell" style="border-left:1px solid black;"/>
													<td class="styIRS1040TableCell" style="border-left:1px solid black;"/>
													<td class="styIRS1040TableCell" style="border-right-width:0px;border-left:1px solid black;"/>
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
										</xsl:call-template>Check if your filing status is MFS or HOH and you lived apart from your spouse for the last 6 months of return year entered at top of page 1, or you are legally separated according to your state law under a written separation agreement or a decree of separate maintenance and you did not live in the same household as your spouse at the end of return year entered at top of page 1. 
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
							<xsl:with-param name="headerHeight" select="2"/>
							<xsl:with-param name="containerID" select=" 'depdContainerId' "/>
						</xsl:call-template>
					</xsl:if>
					<!-- Part 2 -->
					<div class="styStdDiv" style="border-top:1px solid black;border-bottom:1px solid black;">
						<div class="styPartName">Part II</div>
						<div class="styPartDesc" style="width:180mm">
							Explanation of Changes. 
							<span style="font-weight:normal;">In the space provided below, tell us why you are filing Form 1040-X. You must complete Part ii.</span>
						</div>
					</div>
					<div class="styStdDiv" style="">
						<div class="styLNLeftNumBox"></div>
						<!--<div class="sty1040XDesc" style="width:179mm;">
							<span style="width:4px"/>Attach any supporting documents and new or changed forms and schedules
						</div>-->
					</div>
					<div class="styStdDiv" style="min-height:34mm;">
						<xsl:call-template name="PopulateText">
							<xsl:with-param name="TargetNode" select="$FormData/ReasonForFilingAmdReturnTxt"/>
						</xsl:call-template>
					</div>
					<!--					-->
					<!-- Part 3 -->
					<!--
					<div class="styStdDiv" style="border-top:2px solid black;">
						<div class="styPartName">Part III</div>
						<div class="styPartDesc" style="height:7mm">Direct Deposit. Complete only if you want the refund on line 22, if any, directly deposited into your<br/> bank account</div>
					</div>
					-->
					<!-- Line 31 -->
					<!--
					<div class="styStdDiv" style="border-top:1px solid black;">
						<div class="styLNLeftNumBox">31</div>
						<div class="sty1040XDesc" style="height:4.5mm;">
							-->
					<!--Routing number-->
					<!--
							<span style="width:25mm;float:left;clear:none;padding-top:0mm">
							   Routing number
							</span>
							<span class="styLNCtrNumBox" style="width:34mm;border-top-width:1px;padding-top:0mm;padding-bottom:0mm;font-weight:normal;">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$FormData/RoutingTransitNum"/>
								</xsl:call-template>
							</span>
						</div>
						<div class="sty1040XRightNumBox" style="height:4.5mm;border-bottom-width: 0px; border-left-width: 0px; padding-left:30mm; padding-right:5mm;padding-top:.9mm">32</div>
						<span style="width:4px;"/>
							Type:
							<span style="width:4px;"/>
							<span style="padding-top:.5mm">
							-->
					<!-- Checkbox  1=checking, 2 = savings -->
					<!--
							<input type="checkbox" class="styCkboxNM">
								<xsl:call-template name="PopulateEnumeratedCheckbox">
									<xsl:with-param name="TargetNode" select="$FormData/BankAccountTypeCd"/>
									<xsl:with-param name="DisplayedCheckboxValue" select="'1'"/>
									<xsl:with-param name="BackupName">IRS1040BankAccountTypeCd[1]</xsl:with-param>
								</xsl:call-template>Checking
							</input>
							-->
					<!--label>
								<xsl:call-template name="PopulateLabel">
									<xsl:with-param name="TargetNode" select="$FormData/BankAccountTypeCd"/>
									<xsl:with-param name="DisplayedCheckboxValue" select="1"/>
									<xsl:with-param name="BackupName">IRS1040BankAccountTypeCd[1]</xsl:with-param>
								</xsl:call-template>
								Checking
							</label-->
					<!--
							<input type="checkbox" class="styCkboxNM" style="margin-left:5mm;">
								<xsl:call-template name="PopulateEnumeratedCheckbox">
									<xsl:with-param name="TargetNode" select="$FormData/BankAccountTypeCd"/>
									<xsl:with-param name="DisplayedCheckboxValue" select="'2'"/>
									<xsl:with-param name="BackupName">IRS1040BankAccountTypeCd[2]</xsl:with-param>
								</xsl:call-template>Savings
							</input>
							-->
					<!--label>
								<xsl:call-template name="PopulateLabel">
									<xsl:with-param name="TargetNode" select="$FormData/BankAccountTypeCd"/>
									<xsl:with-param name="DisplayedCheckboxValue" select="'2'"/>
									<xsl:with-param name="BackupName">IRS1040BankAccountTypeCd[2]</xsl:with-param>
								</xsl:call-template>
								Savings
							</label-->
					<!--
							</span>
						
					</div>
					-->
					<!-- Line 33 -->
					<!--
					<div class="styStdDiv">
						<div class="styLNLeftNumBox">33</div>
						-->
					<!--<div class="sty1040XDesc">
							Account number
						</div>-->
					<!--
						<div class="sty1040XDesc" style="height:5.4mm;width:156mm;padding-bottom:.5mm;">
							<span style="width:25mm;float:left;clear:none;padding-top:0mm;">
							   Account number
							</span>
							<span class="styLNCtrNumBox" style="width:84mm;border-top-width:1px;padding-top:0mm;padding-bottom:2mm;font-weight:normal">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$FormData/DepositorAccountNum"/>
								</xsl:call-template>
							</span>
						</div>
					</div>-->
					<!-- Signature block -->
					<div style="display:block;width:187mm;border-top:1px solid black;padding-top:2mm">
						<div class="styGenericDiv" style="width:20mm;height:28mm;">
							<!--<span style="font-weight:bold;font-size:10pt;">Third Party Designee</span>-->
							<span style="font-weight:bold;font-size:10pt;">Sign<br/>Here</span>
						</div>
						<div style="padding-top:9.5mm;padding-left:8px;padding-right:0px;float:left;clear:none;width:4mm;margin-left:-2px;margin-right:2px;">
						</div>
						<div style="float:left;clear:none;width:163mm;">
							<div class="" style="width:163mm;float:left;clear:none;">
								<span style="font-size:10pt;font-family:Arial;font-weight:bold">
								Remember to keep a copy of this form for your records.</span>
								<br/>
								<span style="font-size:6pt;font-family:Arial;">
								Under penalties of perjury, I declare that I have filed an original return, and that I have examined this amended return, 
								including accompanying schedules and statements, and to the best of my knowledge and belief, 
								this amended return is true, correct, and complete. 
								Declaration of preparer (other than taxpayer) is based on all information 
								about which the preparer has any knowledge.
								</span>
							</div>
							<div style="width:163mm;float:left;clear:none;height:2mm;"/>
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
									<span style="display:inline;font-size:7pt;">Preparer's name</span>
									<br/>
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
									<br/>
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
									<span style="font-size:7pt;">Check if:</span>
									<br/>
									<input class="styCkbox" type="checkbox" aria-label="Self Employed Ind">
									<xsl:call-template name="PopulateCheckbox">
											<xsl:with-param name="TargetNode" select="$RtnHdrData/PaidPreparerInformationGrp/SelfEmployedInd"/>
											<xsl:with-param name="BackupName">$RtnHdrDataPaidPreparerInformationSelfEmployed</xsl:with-param>
										</xsl:call-template>Self-employed
								</input>
									<!--label>
									<xsl:call-template name="PopulateLabel">
										<xsl:with-param name="TargetNode" select="$RtnHdrData/PaidPreparerInformationGrp/SelfEmployedInd"/>
										<xsl:with-param name="BackupName">$RtnHdrDataPaidPreparerInformationSelfEmployed</xsl:with-param>
									</xsl:call-template>
									<span style="width:4px;"/>Self-employed
								</label-->
								</div>
							</div>
							<div style="width:164mm;height:9.5mm;float:left;clear:none;border-style:solid;
						border-color:black;border-width:0px 0px 0px 0px;">
								<div class="styFNBox" style="height:9.5mm;width:124mm;border-right:1px solid black;">
									<span class="styGenericDiv" style="">Firm's name 
							<span style="width:2.2mm;"/>
								<span style="width:4px;"/>
							</span>
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
								<div class="styFNBox" style="width:124mm;min-height:12mm;border-right:1px solid black;">
									<div class="styGenericDiv" style="padding-right:.5mm;">Firm's address 
							</div>
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
					<!-- End of Paid Preparer Use Only -->
					<div class="styStdDiv pageEnd" style="border-top:2px solid black;">		For forms and publications, visit <a style="text-decoration:none;color:black;" href="http://www.irs.gov/Forms" title="http://www.irs.gov/Forms">
												<i>www.irs.gov/Forms</i>
											</a>.
				<span style="float:right;">Form <span style="font-weight:bold;font-size:larger;">1040-X</span> (Rev. 12-2025)</span>
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
							<xsl:with-param name="DescWidth" select="100"/>
						</xsl:call-template>
						<xsl:for-each select="$FormData/ReasonForFilingAmendedReturnCd">
							<xsl:call-template name="PopulateLeftoverRow">
								<xsl:with-param name="Desc">Top Right Margin - Reason for Filing Amended Return Code</xsl:with-param>
								<xsl:with-param name="TargetNode" select="."/>
							</xsl:call-template>
						</xsl:for-each>
						<xsl:call-template name="PopulateLeftoverRow">
							<xsl:with-param name="Desc">Top Right Margin - Primary Filer Death Date</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$FormData/PrimaryDeathDt"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRow">
							<xsl:with-param name="Desc">Top Right Margin - Spouse Death Date</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$FormData/SpouseDeathDt"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRowCheckbox">
							<xsl:with-param name="Desc">Top Right Margin - Power of Attorney Signed By Indicator</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$FormData/PowerOfAttorneySignedByInd"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRow">
							<xsl:with-param name="Desc">Top Right Margin - Power of Attorney Name</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$FormData/PowerOfAttorneyNm"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRowCheckbox">
							<xsl:with-param name="Desc">Top Right Margin - Surviving Spouse Indicator</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$FormData/SurvivingSpouseInd"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRowCheckbox">
							<xsl:with-param name="Desc">Top Right Margin - Personal Representative Indicator</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$FormData/PersonalRepresentativeInd"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRow">
							<xsl:with-param name="Desc">Top Right Margin - Non Paid Preparer Code</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$FormData/NonPaidPreparerCd"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRow">
							<xsl:with-param name="Desc">Top Right Margin - TAS Case Type Code</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$FormData/TASCaseTypeCd"/>
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
							<xsl:with-param name="Desc">Header - Spouse Name Control</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/SpouseNameControlTxt"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRow">
							<xsl:with-param name="Desc">Filing Status - Qualifying HOH SSN</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$FormData/QualifyingHOHSSN"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRow">
							<xsl:with-param name="Desc">Filing Status - Qualifying Person SSN</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$FormData/QualifyingPersonSSN"/>
						</xsl:call-template>
						<xsl:for-each select="$FormData/MethodUsedToFigureTaxCd | $FormData/MethodUsedToFigureTaxTxt">
							<xsl:choose>
								<xsl:when test="local-name(.) = 'MethodUsedToFigureTaxCd'">
									<xsl:call-template name="PopulateLeftoverRow">
										<xsl:with-param name="Desc">Line 6 - Method Used To Figure Tax Code</xsl:with-param>
										<xsl:with-param name="TargetNode" select="."/>
									</xsl:call-template>
								</xsl:when>
								<xsl:otherwise>
									<xsl:call-template name="PopulateLeftoverRow">
										<xsl:with-param name="Desc">Line 6 - Method Used To Figure Tax Text</xsl:with-param>
										<xsl:with-param name="TargetNode" select="."/>
									</xsl:call-template>
								</xsl:otherwise>
							</xsl:choose>
						</xsl:for-each>
						<xsl:call-template name="PopulateLeftoverRow">
							<xsl:with-param name="TargetNode" select="$FormData/OtherInd/@otherRefundableCrTxt"/>
							<xsl:with-param name="Desc">Line 15 - Other Refundable Credit Text</xsl:with-param>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRow">
							<xsl:with-param name="Desc">Line 17 - US Virgin Islands Code</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$FormData/TotalPaymentsAmt/@uSVirginIslandCd"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRowAmount">
							<xsl:with-param name="Desc">Line 17 - US Virgin Islands Amount</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$FormData/TotalPaymentsAmt/@uSVirginIslandAmt"/>
						</xsl:call-template>
						<xsl:for-each select="$FormData/DependentDetail">
							<xsl:call-template name="PopulateLeftoverRow">
								<xsl:with-param name="Desc">Dependent <xsl:number value="position()"/> Name Control</xsl:with-param>
								<xsl:with-param name="TargetNode" select="DependentNameControlTxt"/>
							</xsl:call-template>
						</xsl:for-each>
					</table>
					<!-- Begin Separated Repeating data table for DependentInformations -->
					<xsl:if test="($Print = $Separated) or (count($FormData/DependentDetail) &gt; 4)">
						<br/>
						<br/>
						<span class="styRepeatingDataTitle">Form 1040X - Dependents </span>
						<table class="styDepTbl" cellspacing="0" style="font-size:7pt;">
							<thead class="styTableThead">
								<tr class="styDepTblHdr">
									<th class="styDepTblCell" rowspan="2" scope="col" style="width:63.4mm;text-align:left;padding-left:1mm;padding-top:0mm;">
										<span style="font-size:7pt;">Dependents <span style="font-weight:normal">(see instructions):</span>
										<br/>
										<span style="font-weight:normal;padding-top:15px">
											<span style="width:1mm"/>(1) First name<br/>
											<span style="width:1mm"/>(2) Last name
										</span>
									</span>
									</th>
									<th class="styDepTblCell" rowspan="2" scope="col" style="min-width:28mm;width:31.2mm;border-right-width:1px;vertical-align:top;">
										<span style="font-weight:normal">
										<b>(3)</b><span style="width:.5mm"/>
										Social security number
									</span>
									</th>
									<th class="styDepTblCell" rowspan="2" scope="col" style="width:30.6mm;border-right-width:1px;vertical-align:top;">
										<span style="font-weight:normal;">
										<b>(4)</b><span style="width:.5mm"/>
									   Relationship to you
									</span>
									</th>
									<th class="styDepTblCell" colspan="2" scope="colgroup" style="width:61.6mm;border-right-width:0px;vertical-align:top;">
										<span style="font-weight:normal">
									   (5) Check if lived with you more than half of return year entered at top of page 1
								   </span>
									</th>
									<th class="styDepTblCell" colspan="2" scope="colgroup" style="width:61.6mm;border-right-width:0px;vertical-align:top;">
										<span style="font-weight:normal">
									   (6) Check if
								   </span>
									</th>
									<th class="styDepTblCell" colspan="2" scope="colgroup" style="width:61.6mm;border-right-width:0px;vertical-align:top;">
										<span style="font-weight:normal">
									   (7) Credits
								   </span>
									</th>
								</tr>
								<tr class="styDepTblHdr">
									<th class="styDepTblCell" scope="col" style="width:28.6mm;font-weight:normal;">
										(a) Yes
									</th>
									<th class="styDepTblCell" scope="col" style="width:33mm;font-weight:normal;border-right-width:0px;">
										(b) And in the U.S.
									</th>
									<th class="styDepTblCell" scope="col" style="width:28.6mm;font-weight:normal;">
										Full-time student
									</th>
									<th class="styDepTblCell" scope="col" style="width:33mm;font-weight:normal;border-right-width:0px;">
										Permanently and totally disabled
									</th>
									<th class="styDepTblCell" scope="col" style="width:28.6mm;font-weight:normal;">
										Child tax credit
									</th>
									<th class="styDepTblCell" scope="col" style="width:33mm;font-weight:normal;border-right-width:0px;">
										Credit for other dependents
									</th>
								</tr>
							</thead>
							<tbody>
								<xsl:for-each select="$FormData/DependentDetail">
									<tr style="border-color:black;height:6mm;">
										<xsl:attribute name="class">
											<xsl:choose>
												<xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when>
												<xsl:otherwise>styDepTblRow2</xsl:otherwise>
											</xsl:choose>
										</xsl:attribute>
										<!-- Dependent First and Last name-->
										<td class="styTableCellTextInherit">
											<span style="width:29mm;text-align:left;float:left;clear:none;">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="DependentFirstNm"/>
												</xsl:call-template>
											</span>
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
										<!-- Either Died or SSN-->
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
										<!--Dependent relationship-->
										<td class="styTableCellTextInherit">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="DependentRelationshipCd"/>
											</xsl:call-template>
										</td>
										<!-- live with child over half year -->
										<td class="styTableCellCtrInherit">
											<input type="checkbox" class="styCkbox">
												<xsl:attribute name="aria-label">Live With Dependent <xsl:value-of select="position()"/> Over Half Year"</xsl:attribute>
												<xsl:call-template name="PopulateCheckbox">
													<xsl:with-param name="TargetNode" select="YesLiveWithChildOverHalfYrInd"/>
													<xsl:with-param name="BackupName">IRS1040CTCInd</xsl:with-param>
												</xsl:call-template>
											</input>
										</td>
										<!-- lived in US over half year -->
										<td class="styTableCellCtrInherit">
											<input type="checkbox" class="styCkbox">
												<xsl:attribute name="aria-label">Dependent <xsl:value-of select="position()"/> Lived in the U.S."</xsl:attribute>
												<xsl:call-template name="PopulateCheckbox">
													<xsl:with-param name="TargetNode" select="YesLiveWithChldUSOvrHalfYrInd"/>
													<xsl:with-param name="BackupName">IRS1040CTCInd</xsl:with-param>
												</xsl:call-template>
											</input>
										</td>
										<!-- full-time student-->
										<td class="styTableCellCtrInherit">
											<input type="checkbox" class="styCkbox">
												<xsl:attribute name="aria-label">Dependent <xsl:value-of select="position()"/> is a Full time student"</xsl:attribute>
												<xsl:call-template name="PopulateCheckbox">
													<xsl:with-param name="TargetNode" select="ChildIsAStudentUnder24Ind"/>
													<xsl:with-param name="BackupName">IRS1040ChildIsAStudentUnder24Ind</xsl:with-param>
												</xsl:call-template>
											</input>
										</td>
										<!-- Permanently and totally disabled -->
										<td class="styTableCellCtrInherit">
											<input type="checkbox" class="styCkbox">
												<xsl:attribute name="aria-label">Dependent <xsl:value-of select="position()"/> is Permanently and totally disabled"</xsl:attribute>
												<xsl:call-template name="PopulateCheckbox">
													<xsl:with-param name="TargetNode" select="ChildPermanentlyDisabledInd"/>
													<xsl:with-param name="BackupName">IRS1040ChildPermanentlyDisabledInd</xsl:with-param>
												</xsl:call-template>
											</input>
										</td>
										<!--Eligible for Child Tax Credit -->
										<td class="styTableCellCtrInherit">
											<input type="Checkbox" class="styCkboxNM">
												<xsl:call-template name="PopulateCheckbox">
													<xsl:with-param name="TargetNode" select="EligibleForChildTaxCreditInd"/>
													<xsl:with-param name="BackupName">IRS1040DependentInformation<xsl:number value="position()"/>EligibleForChildTaxCreditInd</xsl:with-param>
												</xsl:call-template>
												<xsl:attribute name="aria-label">Dependent <xsl:number value="position()"/> Eligible for Child Tax Credit</xsl:attribute>
											</input>
										</td>
										<!-- Eligible for Other Dependent Tax Credit -->
										<td class="styTableCellCtrInherit">
											<input type="Checkbox" class="styCkboxNM">
												<xsl:call-template name="PopulateCheckbox">
													<xsl:with-param name="TargetNode" select="EligibleForODCInd"/>
													<xsl:with-param name="BackupName">IRS1040DependentInformation<xsl:number value="position()"/>EligibleForODCInd</xsl:with-param>
												</xsl:call-template>
												<xsl:attribute name="aria-label">Dependent <xsl:number value="position()"/> Eligible for Other Dependent Credit</xsl:attribute>
											</input>
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