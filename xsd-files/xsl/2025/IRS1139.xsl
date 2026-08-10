<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE xsl:stylesheet [
	<!ENTITY nbsp "&#160;"> 
	<!ENTITY mdash "&#8212;"> 
	<!ENTITY bull "&#8226;">
]>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fo="http://www.w3.org/1999/XSL/Format" version="1.0">
	<xsl:include href="PopulateTemplate.xsl"/>
	<xsl:include href="AddHeader.xsl"/>
	<xsl:include href="CommonPathRef.xsl"/>
	<xsl:include href="AddOnTable.xsl"/>
	<xsl:include href="IRS1139Style.xsl"/>
	<xsl:output method="html" indent="yes"/>
	<xsl:strip-space elements="*"/>
	<xsl:param name="FormData" select="$RtnDoc/IRS1139"/>
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
				<meta name="Description" content="IRS Form 1139"/>
				<!-- javascript include -->
				<script language="JavaScript" src="{$ScriptPath}/FormDisplay.js" type="text/javascript"/>
				<xsl:call-template name="InitJS"/>
				<style type="text/css">
					<xsl:if test="not($Print) or $Print=''">
						<xsl:call-template name="IRS1139Style"/>
						<xsl:call-template name="AddOnStyle"/>
					</xsl:if>
				</style>
				<xsl:call-template name="GlobalStylesForm"/>
			</head>
			<body class="styBodyClass" style="width:187mm;">
				<xsl:call-template name="DocumentHeader"/>
				<!-- BEGIN FORM HEADER -->
				<div class="styStdDiv">
					<div class="styFNBox" style="width:30mm;height:18mm;">
						Form <span class="styFormNumber">1139</span>
						<xsl:call-template name="SetFormLinkInline">
							<xsl:with-param name="TargetNode" select="$FormData"/>
						</xsl:call-template>
						<br/>
						(Rev. December 2025)
						<br/>
						<span class="styAgency">Department of the Treasury</span>
						<span class="styAgency">Internal Revenue Service</span>
					</div>
					<div class="styFTBox" style="width:126mm;height:18mm;padding-top:0.5mm;">
						<span class="styMainTitle" style="font-size:13pt;">Corporation Application for Tentative Refund</span>
						<div class="styFST" style="padding-top:1mm;">
							Go to <span style="font-style:italic;">www.irs.gov/Form1139</span> for instructions and the latest information.
						</div>
						<div class="styFST">Do not file with the corporation's income tax return&mdash;file separately.</div>
						<div class="styFST">Keep a copy of this application for your records.</div>
					</div>
					<div class="styTYBox" style="width:30mm;height:18mm;">
						<div class="styOMB" style="height:5mm;border-bottom:none;margin-top:7mm;">OMB No. 1545-0123</div>
					</div>
				</div>
				<div class="styStdDiv" style="border-top:1px solid black;">
					<div class="styNameBox" style="width:138mm;font-size:7pt;">
						Name <br/>
						<xsl:call-template name="PopulateReturnHeaderFiler">
							<xsl:with-param name="TargetNode">BusinessNameLine1Txt</xsl:with-param>
						</xsl:call-template>
						<xsl:call-template name="LinkToLeftoverDataTableInline">
							<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/InCareOfNm"/>
							<xsl:with-param name="Desc">Part I, Line 1 - In Care Of Name</xsl:with-param>
						</xsl:call-template>
						<xsl:if test="$RtnHdrData/Filer//BusinessNameLine2Txt">
							<br/>
							<xsl:call-template name="PopulateReturnHeaderFiler">
								<xsl:with-param name="TargetNode">BusinessNameLine1Txt</xsl:with-param>
							</xsl:call-template>
						</xsl:if>
					</div>
					<div class="styEINBox" style="width:49mm;padding-left:1mm;text-align:left;font-size:7pt;">
						<span style="font-weight:bold;font-family:Arial;">Employer identification number</span>
						<br/>
						<span style="font-weight:normal;">
							<xsl:call-template name="PopulateReturnHeaderFilerTIN">
								<xsl:with-param name="EINChanged" select="true()"/>
							</xsl:call-template>
						</span>
					</div>
				</div>
				<div class="styStdDiv" style="border-top:1px solid black;">
					<div class="styNameBox" style="width:100mm;font-size:7pt;">
						Number and street. If a P.O. box, see instructions. <br/>
						<xsl:call-template name="PopulateReturnHeaderFiler">
							<xsl:with-param name="TargetNode">AddressLine1Txt</xsl:with-param>
						</xsl:call-template>
						<xsl:if test="$RtnHdrData/Filer//AddressLine2Txt">
							<br/>
							<xsl:call-template name="PopulateReturnHeaderFiler">
								<xsl:with-param name="TargetNode">AddressLine2Txt</xsl:with-param>
							</xsl:call-template>
						</xsl:if>
					</div>
					<div class="styNameBox" style="width:38mm;font-size:7pt;padding-left:1mm;">
						Room or suite no. <br/><br/><br/>
					</div>
					<div class="styEINBox" style="width:49mm;padding-left:1mm;text-align:left;font-size:7pt;font-weight:normal;">
						<span style="font-family:Arial;">Date of incorporation</span>
						<br/>
						<xsl:call-template name="PopulateMonthDayYear">
							<xsl:with-param name="TargetNode" select="$FormData/IncorporationDt"/>
						</xsl:call-template>
					</div>
				</div>
				<xsl:choose>
					<xsl:when test="$RtnHdrData//USAddress">
						<div class="styStdDiv" style="border-top:1px solid black;">
							<div class="styNameBox" style="width:34.5mm;font-size:7pt;">
								<span style="font-family:Arial;">City or town</span> <br/>
								<xsl:call-template name="PopulateReturnHeaderFiler">
									<xsl:with-param name="TargetNode">CityNm</xsl:with-param>
								</xsl:call-template>
								&nbsp;
							</div>
							<div class="styNameBox" style="width:34.5mm;font-size:7pt;padding-left:1mm;">
								<span style="font-family:Arial;">State or province</span> <br/>
								<xsl:call-template name="PopulateReturnHeaderFiler">
									<xsl:with-param name="TargetNode">StateAbbreviationCd</xsl:with-param>
								</xsl:call-template>
								&nbsp;
							</div>
							<div class="styNameBox" style="width:34.5mm;font-size:7pt;padding-left:1mm;">
								<span style="font-family:Arial;">Country</span> <br/>
								&nbsp;
							</div>
							<div class="styNameBox" style="width:34.5mm;font-size:7pt;padding-left:1mm;">
								<span style="font-family:Arial;">ZIP or foreign postal code</span> <br/>
								<xsl:call-template name="PopulateReturnHeaderFiler">
									<xsl:with-param name="TargetNode">ZIPCd</xsl:with-param>
								</xsl:call-template>
								&nbsp;
							</div>
							<div class="styEINBox" style="width:49mm;padding-left:1mm;text-align:left;font-size:7pt;font-weight:normal;word-break:break-all;">
								Daytime phone number<br/>
								<xsl:call-template name="PopulateReturnHeaderFiler">
									<xsl:with-param name="TargetNode">Phone</xsl:with-param>
								</xsl:call-template>
							</div>
						</div>
					</xsl:when>
					<xsl:otherwise>
						<div class="styStdDiv" style="border-top:1px solid black;">
							<div class="styNameBox" style="width:34.5mm;font-size:7pt;">
								<span style="font-family:Arial;">City or town</span> <br/>
								<xsl:call-template name="PopulateReturnHeaderFiler">
									<xsl:with-param name="TargetNode">CityNm</xsl:with-param>
								</xsl:call-template>
								&nbsp;
							</div>
							<div class="styNameBox" style="width:34.5mm;font-size:7pt;padding-left:1mm;">
								<span style="font-family:Arial;">State or Province</span> <br/>
								<xsl:call-template name="PopulateReturnHeaderFiler">
									<xsl:with-param name="TargetNode">ProvinceOrStateNm</xsl:with-param>
								</xsl:call-template>
								&nbsp;
							</div>
							<div class="styNameBox" style="width:34.5mm;font-size:7pt;padding-left:1mm;">
								<span style="font-family:Arial;">Country</span> <br/>
								<xsl:call-template name="PopulateReturnHeaderFiler">
									<xsl:with-param name="TargetNode">CountryCd</xsl:with-param>
								</xsl:call-template>
								&nbsp;
							</div>
							<div class="styNameBox" style="width:34.5mm;font-size:7pt;padding-left:1mm;">
								<span style="font-family:Arial;">ZIP or foreign postal code</span> <br/>
								<xsl:call-template name="PopulateReturnHeaderFiler">
									<xsl:with-param name="TargetNode">ForeignPostalCd</xsl:with-param>
								</xsl:call-template>
								&nbsp;
							</div>
							<div class="styEINBox" style="width:49mm;padding-left:1mm;text-align:left;font-size:7pt;font-weight:normal;word-break:break-all;">
								Daytime phone number<br/>
								<xsl:call-template name="PopulateReturnHeaderFiler">
									<xsl:with-param name="TargetNode">ForeignPhoneNum</xsl:with-param>
								</xsl:call-template>
							</div>
						</div>
					</xsl:otherwise>
				</xsl:choose>
				<!-- Line 1 -->
				<div class="styStdDiv" style="border-top:1px solid black;">
					<div class="styLNLeftNumBoxSD">1</div>
					<div class="styLNDesc">Reason(s) for filing. See instructions &mdash; attach computation.</div>
				</div>
				<div class="styStdDiv">
					<div class="styLNLeftNumBoxSD" style="padding-left:4.2mm;">a</div>
					<div class="sty1139LongDesc"> 
						Net operating loss (NOL)
						<span class="sty1139DotLn">.............................</span>
					</div>
					<div class="styGenericDiv" style="height:auto;width:29.8mm;border-bottom:1px dashed black;text-align:right;">
						<span style="float:left;">$</span>
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/NetOperatingLossAmt"/>
						</xsl:call-template>
					</div>	
				</div>
				<div class="styStdDiv">
					<div class="styLNLeftNumBoxSD" style="padding-left:4.2mm;">b</div>
					<div class="sty1139LongDesc"> 
						Net capital loss
						<span class="sty1139DotLn">................................</span>
					</div>
					<div class="styGenericDiv" style="height:auto;width:29.8mm;border-bottom:1px dashed black;text-align:right;">
						<span style="float:left;">$</span>
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/NetCapitalLossAmt"/>
						</xsl:call-template>
					</div>	
				</div>
				<div class="styStdDiv">
					<div class="styLNLeftNumBoxSD" style="padding-left:4.2mm;">c</div>
					<div class="sty1139LongDesc"> 
						Unused general business credit
						<span class="sty1139DotLn">...........................</span>
					</div>
					<div class="styGenericDiv" style="height:auto;width:29.8mm;border-bottom:1px dashed black;text-align:right;">
						<span style="float:left;">$</span>
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/UnusedGeneralBusinessCrAmt"/>
						</xsl:call-template>
					</div>	
				</div>
				<div class="styStdDiv">
					<div class="styLNLeftNumBoxSD" style="padding-left:4.2mm;">d</div>
					<div class="sty1139LongDesc"> 
						Other
						<span class="sty1139DotLn">...................................</span>
					</div>
					<div class="styGenericDiv" style="height:auto;width:29.8mm;border-bottom:1px dashed black;text-align:right;">
						<span style="float:left;">$</span>
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/OtherAmt"/>
						</xsl:call-template>
					</div>
				</div>
				<!-- Line 2 -->
				<div class="styStdDiv">
					<div class="styLNLeftNumBoxSD">2</div>
					<div class="styLNDesc">Return for year of loss, unused credit, or overpayment under section 1341(b)(1).</div>
				</div>
				<div class="styStdDiv">
					<div class="styLNLeftNumBoxSD" style="padding-left:4.2mm;">a</div>
					<div class="sty1139LongDesc"> 
						Tax year ended
						<span class="sty1139DotLn">................................</span>
					</div>
					<div class="styGenericDiv" style="height:auto;width:29.8mm;border-bottom:1px dashed black;text-align:center;">
						<xsl:call-template name="PopulateReturnHeaderTaxPeriodEndDate"/>
					</div>	
				</div>
				<div class="styStdDiv">
					<div class="styLNLeftNumBoxSD" style="padding-left:4.2mm;">b</div>
					<div class="sty1139LongDesc"> 
						Date tax return filed
						<span class="sty1139DotLn">..............................</span>
					</div>
					<div class="styGenericDiv" style="height:auto;width:29.8mm;border-bottom:1px dashed black;text-align:center;">
						<xsl:call-template name="PopulateMonthDayYear">
							<xsl:with-param name="TargetNode" select="$FormData/ReturnFiledDt"/>
						</xsl:call-template>
					</div>	
				</div>
				<div class="styStdDiv">
					<div class="styLNLeftNumBoxSD" style="padding-left:4.2mm;">c</div>
					<div class="sty1139LongDesc"> 
						Service center where filed
						<span class="sty1139DotLn">............................</span>
					</div>
					<div class="styGenericDiv" style="height:auto;width:29.8mm;border-bottom:1px dashed black;text-align:center;">
						<xsl:call-template name="PopulateText">
							<xsl:with-param name="TargetNode" select="$FormData/ServiceCenterWhereFiledCd"/>
						</xsl:call-template>
					</div>	
				</div>
				<div class="styStdDiv">
					<div class="styLNLeftNumBoxSD" style="padding-left:4.2mm;">d</div>
					<div class="sty1139LongDesc" style="width:175mm;"> 
						If resubmitting Form 1139 in response to IRS correspondence, check this box. Attach a copy of the correspondence
						<span class="sty1139DotLn">.......</span>
					</div>
					<div class="styGenericDiv" style="text-align:right;">
						<input type="Checkbox" class="styCkboxNM" aria-label="Resubmitted Form">
							<xsl:call-template name="PopulateCheckbox">
								<xsl:with-param name="TargetNode" select="$FormData/ResubmitFormInd"/>
								<xsl:with-param name="BackupName">IRS1139ResubmitFormInd</xsl:with-param>
							</xsl:call-template>
						</input>
					</div>
				</div>
				<!-- Line 3 -->
				<div class="styStdDiv">
					<div class="styLNLeftNumBoxSD">3</div>
					<div class="sty1139LongDesc">
						If this application is for an unused credit created by another carryback, enter ending date for the tax year of the first carryback
						<span class="sty1139DotLn">.................................</span>
					</div>
					<div class="styGenericDiv" style="height:auto;width:29.8mm;border-bottom:1px dashed black;text-align:center;margin-top:3mm;">
						<xsl:call-template name="PopulateYear">
							<xsl:with-param name="TargetNode" select="$FormData/FirstCarrybackYr"/>
						</xsl:call-template>
					</div>
				</div>
				<!-- Line 4 -->
				<div class="styStdDiv">
					<div class="styLNLeftNumBoxSD">4</div>
					<div class="sty1139LongDesc" style="">
						Did a loss result in the release of a foreign tax credit, or is the corporation carrying back a general
business credit that was released because of the release of a foreign tax credit? See instructions. If
"Yes," the corporation must file an amended return to carry back the released credits
						<span class="sty1139DotLn">....................</span>
					</div>
					<div class="styGenericDiv" style="height:auto;width:29.8mm;text-align:center;font-weight:bold;margin-top:6.5mm;">
						<xsl:call-template name="PopulateSpan">
							<xsl:with-param name="TargetNode" select="$FormData/ForeignTaxCrReleaseInd"/>
						</xsl:call-template>
						<input type="checkbox" class="styCkboxNM" style="" aria-label="Foreign Tax Credit Release Yes">
							<xsl:call-template name="PopulateYesCheckbox">
								<xsl:with-param name="TargetNode" select="$FormData/ForeignTaxCrReleaseInd"/>
								<xsl:with-param name="BackupName">IRS1139/ForeignTaxCrReleaseInd</xsl:with-param>
							</xsl:call-template>
						</input>
						Yes 
						<input type="checkbox" class="styCkboxNM" style="margin-left:5mm;" aria-label="Foreign Tax Credit Release No">
							<xsl:call-template name="PopulateNoCheckbox">
								<xsl:with-param name="TargetNode" select="$FormData/ForeignTaxCrReleaseInd"/>
								<xsl:with-param name="BackupName">IRS1139/ForeignTaxCrReleaseInd</xsl:with-param>
							</xsl:call-template>
						</input>
						No
					</div>
				</div>
				<!-- Line 5a -->
				<div class="styStdDiv" style="">
					<div class="styLNLeftNumBoxSD">5a</div>
					<div class="sty1139LongDesc">
						Was a consolidated return filed for any carryback year or did the corporation join a consolidated group? See instructions
						<span class="sty1139DotLn" style="font-family:Verdana;">................................</span>
					</div>
					<div class="styGenericDiv" style="height:auto;width:29.8mm;text-align:center;font-weight:bold;margin-top:3mm;">
						<xsl:call-template name="PopulateSpan">
							<xsl:with-param name="TargetNode" select="$FormData/CnsldtRetFldOrJoinCnsldtGrpInd"/>
						</xsl:call-template>
						<input type="checkbox" class="styCkboxNM" style="" aria-label="Consolidated Return Filed Carryback Or Joined Consolidated Group Yes">
							<xsl:call-template name="PopulateYesCheckbox">
								<xsl:with-param name="TargetNode" select="$FormData/CnsldtRetFldOrJoinCnsldtGrpInd"/>
								<xsl:with-param name="BackupName">IRS1139/CnsldtRetFldOrJoinCnsldtGrpInd</xsl:with-param>
							</xsl:call-template>
						</input>
						Yes 
						<input type="checkbox" class="styCkboxNM" style="margin-left:5mm;" aria-label="Consolidated Return Filed Carryback Or Joined Consolidated Group No">
							<xsl:call-template name="PopulateNoCheckbox">
								<xsl:with-param name="TargetNode" select="$FormData/CnsldtRetFldOrJoinCnsldtGrpInd"/>
								<xsl:with-param name="BackupName">IRS1139/CnsldtRetFldOrJoinCnsldtGrpInd</xsl:with-param>
							</xsl:call-template>
						</input>
						No
					</div>
				</div>
				<!-- Line 5b -->
				<div class="styStdDiv">
					<div class="styLNLeftNumBoxSD" style="padding-left:4.2mm;">b</div>
					<div class="sty1139LongDesc" style="width:170mm;">
						If "Yes," enter the tax year ending date and the name of the common parent and its EIN, if different from above. See instructions.
					</div>
				</div>
				<div class="styStdDiv">
					<div class="styLNLeftNumBoxSD">&nbsp;</div>
					<div class="sty1139LongDesc" style="width:178mm;border-bottom:1px dashed black;text-align:center;">
						<span style="float:left;">
							<xsl:call-template name="PopulateMonthDayYear">
								<xsl:with-param name="TargetNode" select="$FormData/CommonParentInformationGrp/TaxYearEndDt"/>
							</xsl:call-template>
						</span>
						<xsl:call-template name="PopulateText">
							<xsl:with-param name="TargetNode" select="$FormData/CommonParentInformationGrp/CommonParentName/BusinessNameLine1Txt"/>
						</xsl:call-template>
						<xsl:if test="$FormData/CommonParentInformationGrp/CommonParentName/BusinessNameLine2Txt">
							<br/>
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/CommonParentInformationGrp/CommonParentName/BusinessNameLine2Txt"/>
							</xsl:call-template>
						</xsl:if>
						<span style="float:right;">
							<xsl:call-template name="PopulateEIN">
								<xsl:with-param name="TargetNode" select="$FormData/CommonParentInformationGrp/CommonParentEIN"/>
							</xsl:call-template>
						</span>
					</div>
				</div>
				<!-- Line 6a -->
				<div class="styStdDiv" style="padding-top:1mm;">
					<div class="styLNLeftNumBoxSD">6a</div>
					<div class="sty1139LongDesc">
						If Form 1138 has been filed, was an extension of time granted for filing the return for the tax year of the NOL?
						<span class="sty1139DotLn">..</span>
					</div>
					<div class="styGenericDiv" style="height:auto;width:29.8mm;text-align:center;font-weight:bold;padding-top:0.5mm;">
						<xsl:call-template name="PopulateSpan">
							<xsl:with-param name="TargetNode" select="$FormData/FormFiledExtnsGrantedInd"/>
						</xsl:call-template>
						<input type="checkbox" class="styCkboxNM" style="" aria-label="Form Filed Extension Granted Yes">
							<xsl:call-template name="PopulateYesCheckbox">
								<xsl:with-param name="TargetNode" select="$FormData/FormFiledExtnsGrantedInd"/>
								<xsl:with-param name="BackupName">IRS1139/FormFiledExtnsGrantedInd</xsl:with-param>
							</xsl:call-template>
						</input>
						Yes 
						<input type="checkbox" class="styCkboxNM" style="margin-left:5mm;" aria-label="Form Filed Extension Granted No">
							<xsl:call-template name="PopulateNoCheckbox">
								<xsl:with-param name="TargetNode" select="$FormData/FormFiledExtnsGrantedInd"/>
								<xsl:with-param name="BackupName">IRS1139/FormFiledExtnsGrantedInd</xsl:with-param>
							</xsl:call-template>
						</input>
						No
					</div>
				</div>
				<!-- Line 6b -->
				<div class="styStdDiv">
					<div class="styLNLeftNumBoxSD" style="padding-left:4.2mm;">b</div>
					<div class="sty1139LongDesc" style="">
						If "Yes," enter the date to which extension was granted
						<span class="sty1139DotLn">...................</span>
					</div>
					<div class="styGenericDiv" style="height:auto;width:29.8mm;border-bottom:1px dashed black;text-align:center;">
						<xsl:call-template name="PopulateMonthDayYear">
							<xsl:with-param name="TargetNode" select="$FormData/ExtnsGrantedDt"/>
						</xsl:call-template>
					</div>
				</div>
				<!-- Line 6c -->
				<div class="styStdDiv">
					<div class="styLNLeftNumBoxSD" style="padding-left:4.2mm;">c</div>
					<div class="sty1139LongDesc">
						Enter the date Form 1138 was filed
						<span class="sty1139DotLn">..........................</span>
					</div>
					<div class="styGenericDiv" style="height:auto;width:29.8mm;border-bottom:1px dashed black;text-align:center;">
						<xsl:call-template name="PopulateMonthDayYear">
							<xsl:with-param name="TargetNode" select="$FormData/Form1138FiledDt"/>
						</xsl:call-template>
					</div>
				</div>
				<!-- Line 6d -->
				<div class="styStdDiv">
					<div class="styLNLeftNumBoxSD" style="padding-left:4.2mm;">d</div>
					<div class="sty1139LongDesc">
						Unpaid tax for which Form 1138 is in effect
						<span class="sty1139DotLn">.......................</span>
					</div>
					<div class="styGenericDiv" style="height:auto;width:29.8mm;border-bottom:1px dashed black;text-align:right;">
						<span style="float:left;">$</span>
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/UnpaidTaxAmt"/>
						</xsl:call-template>
					</div>
				</div>
				<!-- Line 7 -->
				<div class="styStdDiv">
					<div class="styLNLeftNumBoxSD">7</div>
					<div class="sty1139LongDesc">
						If the corporation changed its accounting period, enter the date permission to change was granted
						<span class="sty1139DotLn">......</span>
					</div>
					<div class="styGenericDiv" style="height:auto;width:29.8mm;border-bottom:1px dashed black;text-align:center;">
						<xsl:call-template name="PopulateMonthDayYear">
							<xsl:with-param name="TargetNode" select="$FormData/AccountingPeriodChangeGrntDt"/>
						</xsl:call-template>
					</div>
				</div>
				<!-- Line 8 -->
				<div class="styStdDiv">
					<div class="styLNLeftNumBoxSD">8</div>
					<div class="sty1139LongDesc">
						If this is an application for a dissolved corporation, enter date of dissolution
						<span class="sty1139DotLn">.............</span>
					</div>
					<div class="styGenericDiv" style="height:auto;width:29.8mm;border-bottom:1px dashed black;text-align:center;">
						<xsl:call-template name="PopulateMonthDayYear">
							<xsl:with-param name="TargetNode" select="$FormData/DissolutionDt"/>
						</xsl:call-template>
					</div>
				</div>
				<!-- Line 9 -->
				<div class="styStdDiv">
					<div class="styLNLeftNumBoxSD">9</div>
					<div class="sty1139LongDesc">
						Has the corporation filed a petition in Tax Court for the year or years to which the carryback is to be applied?
						<span class="sty1139DotLn">..</span>
					</div>
					<div class="styGenericDiv" style="height:auto;width:29.8mm;text-align:center;font-weight:bold;padding-top:0.5mm;">
						<xsl:call-template name="PopulateSpan">
							<xsl:with-param name="TargetNode" select="$FormData/CourtPetitionFiledInd"/>
						</xsl:call-template>
						<input type="checkbox" class="styCkboxNM" style="" aria-label="Court Petition Filed Yes">
							<xsl:call-template name="PopulateYesCheckbox">
								<xsl:with-param name="TargetNode" select="$FormData/CourtPetitionFiledInd"/>
								<xsl:with-param name="BackupName">IRS1139/CourtPetitionFiledInd</xsl:with-param>
							</xsl:call-template>
						</input>
						Yes 
						<input type="checkbox" class="styCkboxNM" style="margin-left:5mm;" aria-label="Court Petition Filed No">
							<xsl:call-template name="PopulateNoCheckbox">
								<xsl:with-param name="TargetNode" select="$FormData/CourtPetitionFiledInd"/>
								<xsl:with-param name="BackupName">IRS1139/CourtPetitionFiledInd</xsl:with-param>
							</xsl:call-template>
						</input>
						No
					</div>
				</div>
				<!-- Line 10 -->
				<div class="styStdDiv">
					<div class="styLNLeftNumBox">10</div>
					<div class="sty1139LongDesc" style="">
						Is any part of the decrease in tax due to a loss or credit resulting from a reportable transaction required to be disclosed? 
						If "Yes," attach Form 8886
						<xsl:call-template name="SetFormLinkInline">
							<xsl:with-param name="TargetNode" select="$FormData/TaxDecrDueForm8886DisclInd"/>
						</xsl:call-template>
						<span class="sty1139DotLn">.......................</span>
					</div>
					<div class="styGenericDiv" style="height:auto;width:29.8mm;text-align:center;font-weight:bold;margin-top:3mm;">
						<xsl:call-template name="PopulateSpan">
							<xsl:with-param name="TargetNode" select="$FormData/TaxDecrDueForm8886DisclInd"/>
						</xsl:call-template>
						<input type="checkbox" class="styCkboxNM" style="" aria-label="Tax Decrease Due To Transasction required to be disclosed Yes">
							<xsl:call-template name="PopulateYesCheckbox">
								<xsl:with-param name="TargetNode" select="$FormData/TaxDecrDueForm8886DisclInd"/>
								<xsl:with-param name="BackupName">IRS1139/TaxDecrDueForm8886DisclInd</xsl:with-param>
							</xsl:call-template>
						</input>
						Yes 
						<input type="checkbox" class="styCkboxNM" style="margin-left:5mm;" aria-label="Tax Decrease Due To Transasction required to be disclosed No">
							<xsl:call-template name="PopulateNoCheckbox">
								<xsl:with-param name="TargetNode" select="$FormData/TaxDecrDueForm8886DisclInd"/>
								<xsl:with-param name="BackupName">IRS1139/TaxDecrDueForm8886DisclInd</xsl:with-param>
							</xsl:call-template>
						</input>
						No
					</div>
				</div>
				<div class="pageEnd" style="width:187mm;border-top:1px solid black;">
					<span class="styBoldText">For Paperwork Reduction Act Notice, see separate instructions. </span>
					<span style="width:19mm;"/>Cat. No. 11170F                      
					<span style="float:right;">
						Form <span class="styBoldText" style="font-size:8pt;">1139</span> (Rev. 12-2025)
					</span>
				</div>
				<div class="styStdDiv">
					Form 1139 (Rev. 12-2025)
					<span style="float:right;">
						Page <span style="font-weight:bold;font-size:9pt;">2</span>
					</span>
				</div>
				<!-- Repeating section -->
				<div class="styStdDiv" style="text-align:center;border-top:1px solid black;border-bottom:1px solid black;">
					<div class="styLNDesc" style="width:187mm;height:auto;border-bottom:1px solid black;">
						<strong>Computation of Decrease in Tax</strong><br/> See instructions.<br/>
					</div>
					<div class="styLNDesc" style="width:60.8mm;height:auto;margin-top:3mm;">
						<span style="display:inline;font-family:Arial;">
							<strong>Note: </strong> If only filing for an unused general business credit (line 1c), skip lines 11 through 15.
						</span>
					</div>
					<div class="styGenericDiv" style="width:42mm;border-left:1px solid black;">
						<div class="styGenericDiv" style="width:100%;height:auto;padding:0.5mm;border-bottom:1px solid black;">
							<span style="width:18mm;border-bottom:1px dashed black;margin-right:1mm;">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$FormData/CorpCarrybackDecreaseTxCmptGrp[1]/PrecedingYearNum"/>
								</xsl:call-template>
							</span>
							<strong>preceding <br/> tax year ended</strong>
							<span style="width:17mm;border-bottom:1px dashed black;margin-left:1mm;">
								<xsl:call-template name="PopulateMonthDayYear">
									<xsl:with-param name="TargetNode" select="$FormData/CorpCarrybackDecreaseTxCmptGrp[1]/TaxPeriodEndDt"/>
								</xsl:call-template>
							</span>
						</div>
						<div class="styGenericDiv" style="width:50%;height:auto;padding:0.5mm;"><strong>(a) </strong> Before carryback</div>
						<div class="styGenericDiv" style="width:50%;height:auto;padding:0.5mm;border-left:1px solid black;"><strong>(b) </strong> After carryback</div>
					</div>
					<div class="styGenericDiv" style="width:42mm;border-left:1px solid black;">
						<div class="styGenericDiv" style="width:100%;height:auto;padding:0.5mm;border-bottom:1px solid black;">
							<span style="width:18mm;border-bottom:1px dashed black;margin-right:1mm;">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$FormData/CorpCarrybackDecreaseTxCmptGrp[2]/PrecedingYearNum"/>
								</xsl:call-template>
							</span>
							<strong>preceding <br/> tax year ended</strong>
							<span style="width:17mm;border-bottom:1px dashed black;margin-left:1mm;">
								<xsl:call-template name="PopulateMonthDayYear">
									<xsl:with-param name="TargetNode" select="$FormData/CorpCarrybackDecreaseTxCmptGrp[2]/TaxPeriodEndDt"/>
								</xsl:call-template>
							</span>
						</div>
						<div class="styGenericDiv" style="width:50%;height:auto;padding:0.5mm;"><strong>(c) </strong> Before carryback</div>
						<div class="styGenericDiv" style="width:50%;height:auto;padding:0.5mm;border-left:1px solid black;"><strong>(d) </strong> After carryback</div>
					</div>
					<div class="styGenericDiv" style="width:42mm;border-left:1px solid black;">
						<div class="styGenericDiv" style="width:100%;height:auto;padding:0.5mm;border-bottom:1px solid black;">
							<span style="width:18mm;border-bottom:1px dashed black;margin-right:1mm;">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$FormData/CorpCarrybackDecreaseTxCmptGrp[3]/PrecedingYearNum"/>
								</xsl:call-template>
							</span>
							<strong>preceding <br/> tax year ended</strong>
							<span style="width:17mm;border-bottom:1px dashed black;margin-left:1mm;">
								<xsl:call-template name="PopulateMonthDayYear">
									<xsl:with-param name="TargetNode" select="$FormData/CorpCarrybackDecreaseTxCmptGrp[3]/TaxPeriodEndDt"/>
								</xsl:call-template>
							</span>
						</div>
						<div class="styGenericDiv" style="width:50%;height:auto;padding:0.5mm;"><strong>(e) </strong> Before carryback</div>
						<div class="styGenericDiv" style="width:50%;height:auto;padding:0.5mm;border-left:1px solid black;"><strong>(f) </strong> After carryback</div>
					</div>
				</div>
				<div class="styStdDiv">
					<table style="width:100%;font-size:7pt;border-collapse:collapse;" role="presentation">
						<tbody>
							<!-- Line 11 -->
							<tr style="vertical-align:bottom;">
								<td class="styLNLeftNumBox" style="float:none;">11</td>
								<td class="sty1139ShortDesc" style="float:none;">
									Taxable income from tax return
									<span class="sty1139DotLn">....</span>
								</td>
								<td class="sty1139AmtBox" style="float:none;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/CorpCarrybackDecreaseTxCmptGrp[1]/CorpBeforeCarrybackGrp/TaxableIncomePerReturnAmt"/>
									</xsl:call-template>
								</td>
								<td class="sty1139AmtBox" style="float:none;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/CorpCarrybackDecreaseTxCmptGrp[1]/CorpAfterCarrybackGrp/TaxableIncomePerReturnAmt"/>
									</xsl:call-template>
								</td>
								<td class="sty1139AmtBox" style="float:none;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/CorpCarrybackDecreaseTxCmptGrp[2]/CorpBeforeCarrybackGrp/TaxableIncomePerReturnAmt"/>
									</xsl:call-template>
								</td>
								<td class="sty1139AmtBox" style="float:none;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/CorpCarrybackDecreaseTxCmptGrp[2]/CorpAfterCarrybackGrp/TaxableIncomePerReturnAmt"/>
									</xsl:call-template>
								</td>
								<td class="sty1139AmtBox" style="float:none;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/CorpCarrybackDecreaseTxCmptGrp[3]/CorpBeforeCarrybackGrp/TaxableIncomePerReturnAmt"/>
									</xsl:call-template>
								</td>
								<td class="sty1139AmtBox" style="float:none;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/CorpCarrybackDecreaseTxCmptGrp[3]/CorpAfterCarrybackGrp/TaxableIncomePerReturnAmt"/>
									</xsl:call-template>
								</td>
							</tr>
							<!-- Line 12 -->
							<tr style="vertical-align:bottom;">
								<td class="styLNLeftNumBox" style="float:none;">12</td>
								<td class="sty1139ShortDesc" style="float:none;border-top:1px solid black;">
									<strong>Capital loss carryback</strong>  (see instructions)
									<span class="sty1139DotLn">.</span>
								</td>
								<td class="sty1139AmtBox" style="float:none;background-color:lightgrey;">
									<xsl:call-template name="SetFormLinkInline">
										<xsl:with-param name="TargetNode" select="$FormData/CorpCarrybackDecreaseTxCmptGrp[1]/CorpAfterCarrybackGrp/CapLossCybkAmt"/>
									</xsl:call-template>
								</td>
								<td class="sty1139AmtBox" style="float:none;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/CorpCarrybackDecreaseTxCmptGrp[1]/CorpAfterCarrybackGrp/CapLossCybkAmt"/>
									</xsl:call-template>
								</td>
								<td class="sty1139AmtBox" style="float:none;background-color:lightgrey;">
									<xsl:call-template name="SetFormLinkInline">
										<xsl:with-param name="TargetNode" select="$FormData/CorpCarrybackDecreaseTxCmptGrp[1]/CorpAfterCarrybackGrp/CapLossCybkAmt"/>
									</xsl:call-template>
								</td>
								<td class="sty1139AmtBox" style="float:none;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/CorpCarrybackDecreaseTxCmptGrp[2]/CorpAfterCarrybackGrp/CapLossCybkAmt"/>
									</xsl:call-template>
								</td>
								<td class="sty1139AmtBox" style="float:none;background-color:lightgrey;">
									<xsl:call-template name="SetFormLinkInline">
										<xsl:with-param name="TargetNode" select="$FormData/CorpCarrybackDecreaseTxCmptGrp[1]/CorpAfterCarrybackGrp/CapLossCybkAmt"/>
									</xsl:call-template>
								</td>
								<td class="sty1139AmtBox" style="float:none;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/CorpCarrybackDecreaseTxCmptGrp[3]/CorpAfterCarrybackGrp/CapLossCybkAmt"/>
									</xsl:call-template>
								</td>
							</tr>
							<!-- Line 13 -->
							<tr style="vertical-align:bottom;">
								<td class="styLNLeftNumBox" style="float:none;">13</td>
								<td class="sty1139ShortDesc" style="float:none;border-top:1px solid black;">
									Subtract line 12 from line 11
									<span class="sty1139DotLn">....</span>
								</td>
								<td class="sty1139AmtBox" style="float:none;background-color:lightgrey;">&nbsp;</td>
								<td class="sty1139AmtBox" style="float:none;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/CorpCarrybackDecreaseTxCmptGrp[1]/CorpAfterCarrybackGrp/TaxableIncmLessCapLossCybkAmt"/>
									</xsl:call-template>
								</td>
								<td class="sty1139AmtBox" style="float:none;background-color:lightgrey;">&nbsp;</td>
								<td class="sty1139AmtBox" style="float:none;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/CorpCarrybackDecreaseTxCmptGrp[2]/CorpAfterCarrybackGrp/TaxableIncmLessCapLossCybkAmt"/>
									</xsl:call-template>
								</td>
								<td class="sty1139AmtBox" style="float:none;background-color:lightgrey;">&nbsp;</td>
								<td class="sty1139AmtBox" style="float:none;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/CorpCarrybackDecreaseTxCmptGrp[3]/CorpAfterCarrybackGrp/TaxableIncmLessCapLossCybkAmt"/>
									</xsl:call-template>
								</td>
							</tr>
							<!-- Line 14 -->
							<tr style="vertical-align:bottom;">
								<td class="styLNLeftNumBox" style="float:none;">14</td>
								<td class="sty1139ShortDesc" style="float:none;border-top:1px solid black;">
									<strong>NOL deduction </strong> (see instructions)
									<span class="sty1139DotLn">...</span>
								</td>
								<td class="sty1139AmtBox" style="float:none;background-color:lightgrey;">&nbsp;</td>
								<td class="sty1139AmtBox" style="float:none;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/CorpCarrybackDecreaseTxCmptGrp[1]/CorpAfterCarrybackGrp/NetOperatingLossDeductionAmt"/>
									</xsl:call-template>
								</td>
								<td class="sty1139AmtBox" style="float:none;background-color:lightgrey;">&nbsp;</td>
								<td class="sty1139AmtBox" style="float:none;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/CorpCarrybackDecreaseTxCmptGrp[2]/CorpAfterCarrybackGrp/NetOperatingLossDeductionAmt"/>
									</xsl:call-template>
								</td>
								<td class="sty1139AmtBox" style="float:none;background-color:lightgrey;">&nbsp;</td>
								<td class="sty1139AmtBox" style="float:none;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/CorpCarrybackDecreaseTxCmptGrp[3]/CorpAfterCarrybackGrp/NetOperatingLossDeductionAmt"/>
									</xsl:call-template>
								</td>
							</tr>
							<!-- Line 15 -->
							<tr style="vertical-align:bottom;">
								<td class="styLNLeftNumBox" style="float:none;">15</td>
								<td class="sty1139ShortDesc" style="float:none;border-top:1px solid black;">
									Taxable income. Subtract line 14 from line 13
								</td>
								<td class="sty1139AmtBox" style="float:none;background-color:lightgrey;">&nbsp;</td>
								<td class="sty1139AmtBox" style="float:none;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/CorpCarrybackDecreaseTxCmptGrp[1]/CorpAfterCarrybackGrp/TaxableIncomeAmt"/>
									</xsl:call-template>
								</td>
								<td class="sty1139AmtBox" style="float:none;background-color:lightgrey;">&nbsp;</td>
								<td class="sty1139AmtBox" style="float:none;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/CorpCarrybackDecreaseTxCmptGrp[2]/CorpAfterCarrybackGrp/TaxableIncomeAmt"/>
									</xsl:call-template>
								</td>
								<td class="sty1139AmtBox" style="float:none;background-color:lightgrey;">&nbsp;</td>
								<td class="sty1139AmtBox" style="float:none;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/CorpCarrybackDecreaseTxCmptGrp[3]/CorpAfterCarrybackGrp/TaxableIncomeAmt"/>
									</xsl:call-template>
								</td>
							</tr>
							<!-- Line 16 -->
							<tr style="vertical-align:bottom;">
								<td class="styLNLeftNumBox" style="float:none;">16</td>
								<td class="sty1139ShortDesc" style="float:none;border-top:1px solid black;">
									<strong>Income tax</strong>
									<span class="sty1139DotLn">.........</span>
								</td>
								<td class="sty1139AmtBox" style="float:none;">
									<span style="float:left;">
										<xsl:call-template name="SetFormLinkInline">
											<xsl:with-param name="TargetNode" select="$FormData/CorpCarrybackDecreaseTxCmptGrp[1]/CorpBeforeCarrybackGrp/CorpCommonCarrybackGrp/IncomeTaxAmt"/>
										</xsl:call-template>
									</span>
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/CorpCarrybackDecreaseTxCmptGrp[1]/CorpBeforeCarrybackGrp/CorpCommonCarrybackGrp/IncomeTaxAmt"/>
									</xsl:call-template>
								</td>
								<td class="sty1139AmtBox" style="float:none;">
									<span style="float:left;">
										<xsl:call-template name="SetFormLinkInline">
											<xsl:with-param name="TargetNode" select="$FormData/CorpCarrybackDecreaseTxCmptGrp[1]/CorpAfterCarrybackGrp/CorpCommonCarrybackGrp/IncomeTaxAmt"/>
										</xsl:call-template>
									</span>
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/CorpCarrybackDecreaseTxCmptGrp[1]/CorpAfterCarrybackGrp/CorpCommonCarrybackGrp/IncomeTaxAmt"/>
									</xsl:call-template>
								</td>
								<td class="sty1139AmtBox" style="float:none;">
									<span style="float:left;">
										<xsl:call-template name="SetFormLinkInline">
											<xsl:with-param name="TargetNode" select="$FormData/CorpCarrybackDecreaseTxCmptGrp[2]/CorpBeforeCarrybackGrp/CorpCommonCarrybackGrp/IncomeTaxAmt"/>
										</xsl:call-template>
									</span>
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/CorpCarrybackDecreaseTxCmptGrp[2]/CorpBeforeCarrybackGrp/CorpCommonCarrybackGrp/IncomeTaxAmt"/>
									</xsl:call-template>
								</td>
								<td class="sty1139AmtBox" style="float:none;">
									<span style="float:left;">
										<xsl:call-template name="SetFormLinkInline">
											<xsl:with-param name="TargetNode" select="$FormData/CorpCarrybackDecreaseTxCmptGrp[2]/CorpAfterCarrybackGrp/CorpCommonCarrybackGrp/IncomeTaxAmt"/>
										</xsl:call-template>
									</span>
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/CorpCarrybackDecreaseTxCmptGrp[2]/CorpAfterCarrybackGrp/CorpCommonCarrybackGrp/IncomeTaxAmt"/>
									</xsl:call-template>
								</td>
								<td class="sty1139AmtBox" style="float:none;">
									<span style="float:left;">
										<xsl:call-template name="SetFormLinkInline">
											<xsl:with-param name="TargetNode" select="$FormData/CorpCarrybackDecreaseTxCmptGrp[3]/CorpBeforeCarrybackGrp/CorpCommonCarrybackGrp/IncomeTaxAmt"/>
										</xsl:call-template>
									</span>
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/CorpCarrybackDecreaseTxCmptGrp[3]/CorpBeforeCarrybackGrp/CorpCommonCarrybackGrp/IncomeTaxAmt"/>
									</xsl:call-template>
								</td>
								<td class="sty1139AmtBox" style="float:none;">
									<span style="float:left;">
										<xsl:call-template name="SetFormLinkInline">
											<xsl:with-param name="TargetNode" select="$FormData/CorpCarrybackDecreaseTxCmptGrp[3]/CorpAfterCarrybackGrp/CorpCommonCarrybackGrp/IncomeTaxAmt"/>
										</xsl:call-template>
									</span>
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/CorpCarrybackDecreaseTxCmptGrp[3]/CorpAfterCarrybackGrp/CorpCommonCarrybackGrp/IncomeTaxAmt"/>
									</xsl:call-template>
								</td>
							</tr>
							<!-- Line 17 -->
							<tr style="vertical-align:bottom;">
								<td class="styLNLeftNumBox" style="float:none;">17</td>
								<td class="sty1139ShortDesc" style="float:none;border-top:1px solid black;">
									Alternative minimum tax
									<span class="sty1139DotLn">.....</span>
								</td>
								<td class="sty1139AmtBox" style="float:none;">
									<span style="float:left;">
										<xsl:call-template name="SetFormLinkInline">
											<xsl:with-param name="TargetNode" select="$FormData/CorpCarrybackDecreaseTxCmptGrp[1]/CorpBeforeCarrybackGrp/CorpCommonCarrybackGrp/AlternativeMinimumTaxAmt"/>
										</xsl:call-template>
									</span>
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/CorpCarrybackDecreaseTxCmptGrp[1]/CorpBeforeCarrybackGrp/CorpCommonCarrybackGrp/AlternativeMinimumTaxAmt"/>
									</xsl:call-template>
								</td>
								<td class="sty1139AmtBox" style="float:none;">
									<span style="float:left;">
										<xsl:call-template name="SetFormLinkInline">
											<xsl:with-param name="TargetNode" select="$FormData/CorpCarrybackDecreaseTxCmptGrp[1]/CorpAfterCarrybackGrp/CorpCommonCarrybackGrp/AlternativeMinimumTaxAmt"/>
										</xsl:call-template>
									</span>
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/CorpCarrybackDecreaseTxCmptGrp[1]/CorpAfterCarrybackGrp/CorpCommonCarrybackGrp/AlternativeMinimumTaxAmt"/>
									</xsl:call-template>
								</td>
								<td class="sty1139AmtBox" style="float:none;">
									<span style="float:left;">
										<xsl:call-template name="SetFormLinkInline">
											<xsl:with-param name="TargetNode" select="$FormData/CorpCarrybackDecreaseTxCmptGrp[2]/CorpBeforeCarrybackGrp/CorpCommonCarrybackGrp/AlternativeMinimumTaxAmt"/>
										</xsl:call-template>
									</span>
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/CorpCarrybackDecreaseTxCmptGrp[2]/CorpBeforeCarrybackGrp/CorpCommonCarrybackGrp/AlternativeMinimumTaxAmt"/>
									</xsl:call-template>
								</td>
								<td class="sty1139AmtBox" style="float:none;">
									<span style="float:left;">
										<xsl:call-template name="SetFormLinkInline">
											<xsl:with-param name="TargetNode" select="$FormData/CorpCarrybackDecreaseTxCmptGrp[2]/CorpAfterCarrybackGrp/CorpCommonCarrybackGrp/AlternativeMinimumTaxAmt"/>
										</xsl:call-template>
									</span>
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/CorpCarrybackDecreaseTxCmptGrp[2]/CorpAfterCarrybackGrp/CorpCommonCarrybackGrp/AlternativeMinimumTaxAmt"/>
									</xsl:call-template>
								</td>
								<td class="sty1139AmtBox" style="float:none;">
									<span style="float:left;">
										<xsl:call-template name="SetFormLinkInline">
											<xsl:with-param name="TargetNode" select="$FormData/CorpCarrybackDecreaseTxCmptGrp[3]/CorpBeforeCarrybackGrp/CorpCommonCarrybackGrp/AlternativeMinimumTaxAmt"/>
										</xsl:call-template>
									</span>
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/CorpCarrybackDecreaseTxCmptGrp[3]/CorpBeforeCarrybackGrp/CorpCommonCarrybackGrp/AlternativeMinimumTaxAmt"/>
									</xsl:call-template>
								</td>
								<td class="sty1139AmtBox" style="float:none;">
									<span style="float:left;">
										<xsl:call-template name="SetFormLinkInline">
											<xsl:with-param name="TargetNode" select="$FormData/CorpCarrybackDecreaseTxCmptGrp[3]/CorpAfterCarrybackGrp/CorpCommonCarrybackGrp/AlternativeMinimumTaxAmt"/>
										</xsl:call-template>
									</span>
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/CorpCarrybackDecreaseTxCmptGrp[3]/CorpAfterCarrybackGrp/CorpCommonCarrybackGrp/AlternativeMinimumTaxAmt"/>
									</xsl:call-template>
								</td>
							</tr>
							<!-- Line 18 -->
							<tr style="vertical-align:bottom;">
								<td class="styLNLeftNumBox" style="float:none;">18</td>
								<td class="sty1139ShortDesc" style="float:none;border-top:1px solid black;">
									Base erosion minimum tax (attach Form 8991)
									<!--<span class="sty1139DotLn">.........</span>-->
								</td>
								<td class="sty1139AmtBox" style="float:none;">
									<span style="float:left;">
										<xsl:call-template name="SetFormLinkInline">
											<xsl:with-param name="TargetNode" select="$FormData/CorpCarrybackDecreaseTxCmptGrp[1]/CorpBeforeCarrybackGrp/CorpCommonCarrybackGrp/BaseErosionMinimumTaxAmt"/>
										</xsl:call-template>
									</span>
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/CorpCarrybackDecreaseTxCmptGrp[1]/CorpBeforeCarrybackGrp/CorpCommonCarrybackGrp/BaseErosionMinimumTaxAmt"/>
									</xsl:call-template>
								</td>
								<td class="sty1139AmtBox" style="float:none;">
									<span style="float:left;">
										<xsl:call-template name="SetFormLinkInline">
											<xsl:with-param name="TargetNode" select="$FormData/CorpCarrybackDecreaseTxCmptGrp[1]/CorpAfterCarrybackGrp/CorpCommonCarrybackGrp/BaseErosionMinimumTaxAmt"/>
										</xsl:call-template>
									</span>
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/CorpCarrybackDecreaseTxCmptGrp[1]/CorpAfterCarrybackGrp/CorpCommonCarrybackGrp/BaseErosionMinimumTaxAmt"/>
									</xsl:call-template>
								</td>
								<td class="sty1139AmtBox" style="float:none;">
									<span style="float:left;">
										<xsl:call-template name="SetFormLinkInline">
											<xsl:with-param name="TargetNode" select="$FormData/CorpCarrybackDecreaseTxCmptGrp[2]/CorpBeforeCarrybackGrp/CorpCommonCarrybackGrp/BaseErosionMinimumTaxAmt"/>
										</xsl:call-template>
									</span>
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/CorpCarrybackDecreaseTxCmptGrp[2]/CorpBeforeCarrybackGrp/CorpCommonCarrybackGrp/BaseErosionMinimumTaxAmt"/>
									</xsl:call-template>
								</td>
								<td class="sty1139AmtBox" style="float:none;">
									<span style="float:left;">
										<xsl:call-template name="SetFormLinkInline">
											<xsl:with-param name="TargetNode" select="$FormData/CorpCarrybackDecreaseTxCmptGrp[2]/CorpAfterCarrybackGrp/CorpCommonCarrybackGrp/BaseErosionMinimumTaxAmt"/>
										</xsl:call-template>
									</span>
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/CorpCarrybackDecreaseTxCmptGrp[2]/CorpAfterCarrybackGrp/CorpCommonCarrybackGrp/BaseErosionMinimumTaxAmt"/>
									</xsl:call-template>
								</td>
								<td class="sty1139AmtBox" style="float:none;">
									<span style="float:left;">
										<xsl:call-template name="SetFormLinkInline">
											<xsl:with-param name="TargetNode" select="$FormData/CorpCarrybackDecreaseTxCmptGrp[3]/CorpBeforeCarrybackGrp/CorpCommonCarrybackGrp/BaseErosionMinimumTaxAmt"/>
										</xsl:call-template>
									</span>
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/CorpCarrybackDecreaseTxCmptGrp[3]/CorpBeforeCarrybackGrp/CorpCommonCarrybackGrp/BaseErosionMinimumTaxAmt"/>
									</xsl:call-template>
								</td>
								<td class="sty1139AmtBox" style="float:none;">
									<span style="float:left;">
										<xsl:call-template name="SetFormLinkInline">
											<xsl:with-param name="TargetNode" select="$FormData/CorpCarrybackDecreaseTxCmptGrp[3]/CorpAfterCarrybackGrp/CorpCommonCarrybackGrp/BaseErosionMinimumTaxAmt"/>
										</xsl:call-template>
									</span>
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/CorpCarrybackDecreaseTxCmptGrp[3]/CorpAfterCarrybackGrp/CorpCommonCarrybackGrp/BaseErosionMinimumTaxAmt"/>
									</xsl:call-template>
								</td>
							</tr>
							<!-- Line 19 -->
							<tr style="vertical-align:bottom;">
								<td class="styLNLeftNumBox" style="float:none;">19</td>
								<td class="sty1139ShortDesc" style="float:none;border-top:1px solid black;">
									Add lines 16 through 18
									<span class="sty1139DotLn">......</span>
								</td>
								<td class="sty1139AmtBox" style="float:none;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/CorpCarrybackDecreaseTxCmptGrp[1]/CorpBeforeCarrybackGrp/CorpCommonCarrybackGrp/SumTaxesAmt"/>
									</xsl:call-template>
								</td>
								<td class="sty1139AmtBox" style="float:none;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/CorpCarrybackDecreaseTxCmptGrp[1]/CorpAfterCarrybackGrp/CorpCommonCarrybackGrp/SumTaxesAmt"/>
									</xsl:call-template>
								</td>
								<td class="sty1139AmtBox" style="float:none;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/CorpCarrybackDecreaseTxCmptGrp[2]/CorpBeforeCarrybackGrp/CorpCommonCarrybackGrp/SumTaxesAmt"/>
									</xsl:call-template>
								</td>
								<td class="sty1139AmtBox" style="float:none;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/CorpCarrybackDecreaseTxCmptGrp[2]/CorpAfterCarrybackGrp/CorpCommonCarrybackGrp/SumTaxesAmt"/>
									</xsl:call-template>
								</td>
								<td class="sty1139AmtBox" style="float:none;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/CorpCarrybackDecreaseTxCmptGrp[3]/CorpBeforeCarrybackGrp/CorpCommonCarrybackGrp/SumTaxesAmt"/>
									</xsl:call-template>
								</td>
								<td class="sty1139AmtBox" style="float:none;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/CorpCarrybackDecreaseTxCmptGrp[3]/CorpAfterCarrybackGrp/CorpCommonCarrybackGrp/SumTaxesAmt"/>
									</xsl:call-template>
								</td>
							</tr>
							<!-- Line 20 -->
							<tr style="vertical-align:bottom;">
								<td class="styLNLeftNumBox" style="float:none;">20</td>
								<td class="sty1139ShortDesc" style="float:none;border-top:1px solid black;">
									General business credit (see instructions)
									<span class="sty1139DotLn">.</span>
								</td>
								<td class="sty1139AmtBox" style="float:none;">
									<span style="float:left;">
										<xsl:call-template name="SetFormLinkInline">
											<xsl:with-param name="TargetNode" select="$FormData/CorpCarrybackDecreaseTxCmptGrp[1]/CorpBeforeCarrybackGrp/CorpCommonCarrybackGrp/GeneralBusinessCreditAmt"/>
										</xsl:call-template>
									</span>
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/CorpCarrybackDecreaseTxCmptGrp[1]/CorpBeforeCarrybackGrp/CorpCommonCarrybackGrp/GeneralBusinessCreditAmt"/>
									</xsl:call-template>
								</td>
								<td class="sty1139AmtBox" style="float:none;">
									<span style="float:left;">
										<xsl:call-template name="SetFormLinkInline">
											<xsl:with-param name="TargetNode" select="$FormData/CorpCarrybackDecreaseTxCmptGrp[1]/CorpAfterCarrybackGrp/CorpCommonCarrybackGrp/GeneralBusinessCreditAmt"/>
										</xsl:call-template>
									</span>
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/CorpCarrybackDecreaseTxCmptGrp[1]/CorpAfterCarrybackGrp/CorpCommonCarrybackGrp/GeneralBusinessCreditAmt"/>
									</xsl:call-template>
								</td>
								<td class="sty1139AmtBox" style="float:none;">
									<span style="float:left;">
										<xsl:call-template name="SetFormLinkInline">
											<xsl:with-param name="TargetNode" select="$FormData/CorpCarrybackDecreaseTxCmptGrp[2]/CorpBeforeCarrybackGrp/CorpCommonCarrybackGrp/GeneralBusinessCreditAmt"/>
										</xsl:call-template>
									</span>
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/CorpCarrybackDecreaseTxCmptGrp[2]/CorpBeforeCarrybackGrp/CorpCommonCarrybackGrp/GeneralBusinessCreditAmt"/>
									</xsl:call-template>
								</td>
								<td class="sty1139AmtBox" style="float:none;">
									<span style="float:left;">
										<xsl:call-template name="SetFormLinkInline">
											<xsl:with-param name="TargetNode" select="$FormData/CorpCarrybackDecreaseTxCmptGrp[2]/CorpAfterCarrybackGrp/CorpCommonCarrybackGrp/GeneralBusinessCreditAmt"/>
										</xsl:call-template>
									</span>
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/CorpCarrybackDecreaseTxCmptGrp[2]/CorpAfterCarrybackGrp/CorpCommonCarrybackGrp/GeneralBusinessCreditAmt"/>
									</xsl:call-template>
								</td>
								<td class="sty1139AmtBox" style="float:none;">
									<span style="float:left;">
										<xsl:call-template name="SetFormLinkInline">
											<xsl:with-param name="TargetNode" select="$FormData/CorpCarrybackDecreaseTxCmptGrp[3]/CorpBeforeCarrybackGrp/CorpCommonCarrybackGrp/GeneralBusinessCreditAmt"/>
										</xsl:call-template>
									</span>
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/CorpCarrybackDecreaseTxCmptGrp[3]/CorpBeforeCarrybackGrp/CorpCommonCarrybackGrp/GeneralBusinessCreditAmt"/>
									</xsl:call-template>
								</td>
								<td class="sty1139AmtBox" style="float:none;">
									<span style="float:left;">
										<xsl:call-template name="SetFormLinkInline">
											<xsl:with-param name="TargetNode" select="$FormData/CorpCarrybackDecreaseTxCmptGrp[3]/CorpAfterCarrybackGrp/CorpCommonCarrybackGrp/GeneralBusinessCreditAmt"/>
										</xsl:call-template>
									</span>
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/CorpCarrybackDecreaseTxCmptGrp[3]/CorpAfterCarrybackGrp/CorpCommonCarrybackGrp/GeneralBusinessCreditAmt"/>
									</xsl:call-template>
								</td>
							</tr>
							<!-- Line 21 -->
							<tr style="vertical-align:bottom;">
								<td class="styLNLeftNumBox" style="float:none;">21</td>
								<td class="sty1139ShortDesc" style="float:none;border-top:1px solid black;">
									Other credits (see instructions)
									<span class="sty1139DotLn">....</span>
								</td>
								<td class="sty1139AmtBox" style="float:none;">
									<span style="float:left;">
										<xsl:call-template name="SetFormLinkInline">
											<xsl:with-param name="TargetNode" select="$FormData/CorpCarrybackDecreaseTxCmptGrp[1]/CorpBeforeCarrybackGrp/CorpCommonCarrybackGrp/OtherCreditsAmt"/>
										</xsl:call-template>
									</span>
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/CorpCarrybackDecreaseTxCmptGrp[1]/CorpBeforeCarrybackGrp/CorpCommonCarrybackGrp/OtherCreditsAmt"/>
									</xsl:call-template>
								</td>
								<td class="sty1139AmtBox" style="float:none;">
									<span style="float:left;">
										<xsl:call-template name="SetFormLinkInline">
											<xsl:with-param name="TargetNode" select="$FormData/CorpCarrybackDecreaseTxCmptGrp[1]/CorpAfterCarrybackGrp/CorpCommonCarrybackGrp/OtherCreditsAmt"/>
										</xsl:call-template>
									</span>
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/CorpCarrybackDecreaseTxCmptGrp[1]/CorpAfterCarrybackGrp/CorpCommonCarrybackGrp/OtherCreditsAmt"/>
									</xsl:call-template>
								</td>
								<td class="sty1139AmtBox" style="float:none;">
									<span style="float:left;">
										<xsl:call-template name="SetFormLinkInline">
											<xsl:with-param name="TargetNode" select="$FormData/CorpCarrybackDecreaseTxCmptGrp[2]/CorpBeforeCarrybackGrp/CorpCommonCarrybackGrp/OtherCreditsAmt"/>
										</xsl:call-template>
									</span>
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/CorpCarrybackDecreaseTxCmptGrp[2]/CorpBeforeCarrybackGrp/CorpCommonCarrybackGrp/OtherCreditsAmt"/>
									</xsl:call-template>
								</td>
								<td class="sty1139AmtBox" style="float:none;">
									<span style="float:left;">
										<xsl:call-template name="SetFormLinkInline">
											<xsl:with-param name="TargetNode" select="$FormData/CorpCarrybackDecreaseTxCmptGrp[2]/CorpAfterCarrybackGrp/CorpCommonCarrybackGrp/OtherCreditsAmt"/>
										</xsl:call-template>
									</span>
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/CorpCarrybackDecreaseTxCmptGrp[2]/CorpAfterCarrybackGrp/CorpCommonCarrybackGrp/OtherCreditsAmt"/>
									</xsl:call-template>
								</td>
								<td class="sty1139AmtBox" style="float:none;">
									<span style="float:left;">
										<xsl:call-template name="SetFormLinkInline">
											<xsl:with-param name="TargetNode" select="$FormData/CorpCarrybackDecreaseTxCmptGrp[3]/CorpBeforeCarrybackGrp/CorpCommonCarrybackGrp/OtherCreditsAmt"/>
										</xsl:call-template>
									</span>
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/CorpCarrybackDecreaseTxCmptGrp[3]/CorpBeforeCarrybackGrp/CorpCommonCarrybackGrp/OtherCreditsAmt"/>
									</xsl:call-template>
								</td>
								<td class="sty1139AmtBox" style="float:none;">
									<span style="float:left;">
										<xsl:call-template name="SetFormLinkInline">
											<xsl:with-param name="TargetNode" select="$FormData/CorpCarrybackDecreaseTxCmptGrp[3]/CorpAfterCarrybackGrp/CorpCommonCarrybackGrp/OtherCreditsAmt"/>
										</xsl:call-template>
									</span>
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/CorpCarrybackDecreaseTxCmptGrp[3]/CorpAfterCarrybackGrp/CorpCommonCarrybackGrp/OtherCreditsAmt"/>
									</xsl:call-template>
								</td>
							</tr>
							<!-- Line 22 -->
							<tr style="vertical-align:bottom;">
								<td class="styLNLeftNumBox" style="float:none;">22</td>
								<td class="sty1139ShortDesc" style="float:none;border-top:1px solid black;">
									Total credits. Add lines 20 and 21
									<span class="sty1139DotLn">...</span>
								</td>
								<td class="sty1139AmtBox" style="float:none;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/CorpCarrybackDecreaseTxCmptGrp[1]/CorpBeforeCarrybackGrp/CorpCommonCarrybackGrp/TotalCreditsAmt"/>
									</xsl:call-template>
								</td>
								<td class="sty1139AmtBox" style="float:none;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/CorpCarrybackDecreaseTxCmptGrp[1]/CorpAfterCarrybackGrp/CorpCommonCarrybackGrp/TotalCreditsAmt"/>
									</xsl:call-template>
								</td>
								<td class="sty1139AmtBox" style="float:none;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/CorpCarrybackDecreaseTxCmptGrp[2]/CorpBeforeCarrybackGrp/CorpCommonCarrybackGrp/TotalCreditsAmt"/>
									</xsl:call-template>
								</td>
								<td class="sty1139AmtBox" style="float:none;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/CorpCarrybackDecreaseTxCmptGrp[2]/CorpAfterCarrybackGrp/CorpCommonCarrybackGrp/TotalCreditsAmt"/>
									</xsl:call-template>
								</td>
								<td class="sty1139AmtBox" style="float:none;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/CorpCarrybackDecreaseTxCmptGrp[3]/CorpBeforeCarrybackGrp/CorpCommonCarrybackGrp/TotalCreditsAmt"/>
									</xsl:call-template>
								</td>
								<td class="sty1139AmtBox" style="float:none;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/CorpCarrybackDecreaseTxCmptGrp[3]/CorpAfterCarrybackGrp/CorpCommonCarrybackGrp/TotalCreditsAmt"/>
									</xsl:call-template>
								</td>
							</tr>
							<!-- Line 23 -->
							<tr style="vertical-align:bottom;">
								<td class="styLNLeftNumBox" style="float:none;">23</td>
								<td class="sty1139ShortDesc" style="float:none;border-top:1px solid black;">
									Subtract line 22 from line 19
									<span class="sty1139DotLn">.....</span>
								</td>
								<td class="sty1139AmtBox" style="float:none;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/CorpCarrybackDecreaseTxCmptGrp[1]/CorpBeforeCarrybackGrp/CorpCommonCarrybackGrp/SumTaxesLessTotalCreditsAmt"/>
									</xsl:call-template>
								</td>
								<td class="sty1139AmtBox" style="float:none;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/CorpCarrybackDecreaseTxCmptGrp[1]/CorpAfterCarrybackGrp/CorpCommonCarrybackGrp/SumTaxesLessTotalCreditsAmt"/>
									</xsl:call-template>
								</td>
								<td class="sty1139AmtBox" style="float:none;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/CorpCarrybackDecreaseTxCmptGrp[2]/CorpBeforeCarrybackGrp/CorpCommonCarrybackGrp/SumTaxesLessTotalCreditsAmt"/>
									</xsl:call-template>
								</td>
								<td class="sty1139AmtBox" style="float:none;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/CorpCarrybackDecreaseTxCmptGrp[2]/CorpAfterCarrybackGrp/CorpCommonCarrybackGrp/SumTaxesLessTotalCreditsAmt"/>
									</xsl:call-template>
								</td>
								<td class="sty1139AmtBox" style="float:none;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/CorpCarrybackDecreaseTxCmptGrp[3]/CorpBeforeCarrybackGrp/CorpCommonCarrybackGrp/SumTaxesLessTotalCreditsAmt"/>
									</xsl:call-template>
								</td>
								<td class="sty1139AmtBox" style="float:none;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/CorpCarrybackDecreaseTxCmptGrp[3]/CorpAfterCarrybackGrp/CorpCommonCarrybackGrp/SumTaxesLessTotalCreditsAmt"/>
									</xsl:call-template>
								</td>
							</tr>
							<!-- Line 24 -->
							<tr style="vertical-align:bottom;">
								<td class="styLNLeftNumBox" style="float:none;vertical-align:top;">24</td>
								<td class="sty1139ShortDesc" style="float:none;border-top:1px solid black;">
									Personal holding company tax (Sch. PH (Form 1120))
									<span class="sty1139DotLn">...........</span>
								</td>
								<td class="sty1139AmtBox" style="float:none;">
									<span style="float:left;">
										<xsl:call-template name="SetFormLinkInline">
											<xsl:with-param name="TargetNode" select="$FormData/CorpCarrybackDecreaseTxCmptGrp[1]/CorpBeforeCarrybackGrp/CorpCommonCarrybackGrp/PersonalHoldingCompanyTaxAmt"/>
										</xsl:call-template>
									</span>
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/CorpCarrybackDecreaseTxCmptGrp[1]/CorpBeforeCarrybackGrp/CorpCommonCarrybackGrp/PersonalHoldingCompanyTaxAmt"/>
									</xsl:call-template>
								</td>
								<td class="sty1139AmtBox" style="float:none;">
									<span style="float:left;">
										<xsl:call-template name="SetFormLinkInline">
											<xsl:with-param name="TargetNode" select="$FormData/CorpCarrybackDecreaseTxCmptGrp[1]/CorpAfterCarrybackGrp/CorpCommonCarrybackGrp/PersonalHoldingCompanyTaxAmt"/>
										</xsl:call-template>
									</span>
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/CorpCarrybackDecreaseTxCmptGrp[1]/CorpAfterCarrybackGrp/CorpCommonCarrybackGrp/PersonalHoldingCompanyTaxAmt"/>
									</xsl:call-template>
								</td>
								<td class="sty1139AmtBox" style="float:none;">
									<span style="float:left;">
										<xsl:call-template name="SetFormLinkInline">
											<xsl:with-param name="TargetNode" select="$FormData/CorpCarrybackDecreaseTxCmptGrp[2]/CorpBeforeCarrybackGrp/CorpCommonCarrybackGrp/PersonalHoldingCompanyTaxAmt"/>
										</xsl:call-template>
									</span>
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/CorpCarrybackDecreaseTxCmptGrp[2]/CorpBeforeCarrybackGrp/CorpCommonCarrybackGrp/PersonalHoldingCompanyTaxAmt"/>
									</xsl:call-template>
								</td>
								<td class="sty1139AmtBox" style="float:none;">
									<span style="float:left;">
										<xsl:call-template name="SetFormLinkInline">
											<xsl:with-param name="TargetNode" select="$FormData/CorpCarrybackDecreaseTxCmptGrp[2]/CorpAfterCarrybackGrp/CorpCommonCarrybackGrp/PersonalHoldingCompanyTaxAmt"/>
										</xsl:call-template>
									</span>
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/CorpCarrybackDecreaseTxCmptGrp[2]/CorpAfterCarrybackGrp/CorpCommonCarrybackGrp/PersonalHoldingCompanyTaxAmt"/>
									</xsl:call-template>
								</td>
								<td class="sty1139AmtBox" style="float:none;">
									<span style="float:left;">
										<xsl:call-template name="SetFormLinkInline">
											<xsl:with-param name="TargetNode" select="$FormData/CorpCarrybackDecreaseTxCmptGrp[3]/CorpBeforeCarrybackGrp/CorpCommonCarrybackGrp/PersonalHoldingCompanyTaxAmt"/>
										</xsl:call-template>
									</span>
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/CorpCarrybackDecreaseTxCmptGrp[3]/CorpBeforeCarrybackGrp/CorpCommonCarrybackGrp/PersonalHoldingCompanyTaxAmt"/>
									</xsl:call-template>
								</td>
								<td class="sty1139AmtBox" style="float:none;">
									<span style="float:left;">
										<xsl:call-template name="SetFormLinkInline">
											<xsl:with-param name="TargetNode" select="$FormData/CorpCarrybackDecreaseTxCmptGrp[3]/CorpAfterCarrybackGrp/CorpCommonCarrybackGrp/PersonalHoldingCompanyTaxAmt"/>
										</xsl:call-template>
									</span>
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/CorpCarrybackDecreaseTxCmptGrp[3]/CorpAfterCarrybackGrp/CorpCommonCarrybackGrp/PersonalHoldingCompanyTaxAmt"/>
									</xsl:call-template>
								</td>
							</tr>
							<!-- Line 25 -->
							<tr style="vertical-align:bottom;">
								<td class="styLNLeftNumBox" style="float:none;">25</td>
								<td class="sty1139ShortDesc" style="float:none;border-top:1px solid black;">
									Other taxes (see instructions)
									<span class="sty1139DotLn">....</span>
								</td>
								<td class="sty1139AmtBox" style="float:none;">
									<span style="float:left;">
										<xsl:call-template name="SetFormLinkInline">
											<xsl:with-param name="TargetNode" select="$FormData/CorpCarrybackDecreaseTxCmptGrp[1]/CorpBeforeCarrybackGrp/CorpCommonCarrybackGrp/OtherTaxesAmt"/>
										</xsl:call-template>
									</span>
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/CorpCarrybackDecreaseTxCmptGrp[1]/CorpBeforeCarrybackGrp/CorpCommonCarrybackGrp/OtherTaxesAmt"/>
									</xsl:call-template>
								</td>
								<td class="sty1139AmtBox" style="float:none;">
									<span style="float:left;">
										<xsl:call-template name="SetFormLinkInline">
											<xsl:with-param name="TargetNode" select="$FormData/CorpCarrybackDecreaseTxCmptGrp[1]/CorpAfterCarrybackGrp/CorpCommonCarrybackGrp/OtherTaxesAmt"/>
										</xsl:call-template>
									</span>
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/CorpCarrybackDecreaseTxCmptGrp[1]/CorpAfterCarrybackGrp/CorpCommonCarrybackGrp/OtherTaxesAmt"/>
									</xsl:call-template>
								</td>
								<td class="sty1139AmtBox" style="float:none;">
									<span style="float:left;">
										<xsl:call-template name="SetFormLinkInline">
											<xsl:with-param name="TargetNode" select="$FormData/CorpCarrybackDecreaseTxCmptGrp[2]/CorpBeforeCarrybackGrp/CorpCommonCarrybackGrp/OtherTaxesAmt"/>
										</xsl:call-template>
									</span>
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/CorpCarrybackDecreaseTxCmptGrp[2]/CorpBeforeCarrybackGrp/CorpCommonCarrybackGrp/OtherTaxesAmt"/>
									</xsl:call-template>
								</td>
								<td class="sty1139AmtBox" style="float:none;">
									<span style="float:left;">
										<xsl:call-template name="SetFormLinkInline">
											<xsl:with-param name="TargetNode" select="$FormData/CorpCarrybackDecreaseTxCmptGrp[2]/CorpAfterCarrybackGrp/CorpCommonCarrybackGrp/OtherTaxesAmt"/>
										</xsl:call-template>
									</span>
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/CorpCarrybackDecreaseTxCmptGrp[2]/CorpAfterCarrybackGrp/CorpCommonCarrybackGrp/OtherTaxesAmt"/>
									</xsl:call-template>
								</td>
								<td class="sty1139AmtBox" style="float:none;">
									<span style="float:left;">
										<xsl:call-template name="SetFormLinkInline">
											<xsl:with-param name="TargetNode" select="$FormData/CorpCarrybackDecreaseTxCmptGrp[3]/CorpBeforeCarrybackGrp/CorpCommonCarrybackGrp/OtherTaxesAmt"/>
										</xsl:call-template>
									</span>
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/CorpCarrybackDecreaseTxCmptGrp[3]/CorpBeforeCarrybackGrp/CorpCommonCarrybackGrp/OtherTaxesAmt"/>
									</xsl:call-template>
								</td>
								<td class="sty1139AmtBox" style="float:none;">
									<span style="float:left;">
										<xsl:call-template name="SetFormLinkInline">
											<xsl:with-param name="TargetNode" select="$FormData/CorpCarrybackDecreaseTxCmptGrp[3]/CorpAfterCarrybackGrp/CorpCommonCarrybackGrp/OtherTaxesAmt"/>
										</xsl:call-template>
									</span>
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/CorpCarrybackDecreaseTxCmptGrp[3]/CorpAfterCarrybackGrp/CorpCommonCarrybackGrp/OtherTaxesAmt"/>
									</xsl:call-template>
								</td>
							</tr>
							<!-- Line 26 -->
							<tr style="vertical-align:bottom;">
								<td class="styLNLeftNumBox" style="float:none;">26</td>
								<td class="sty1139ShortDesc" style="float:none;border-top:1px solid black;">
									Total tax liability. Add lines 23 through 25
									<span class="sty1139DotLn">.</span>
								</td>
								<td class="sty1139AmtBox" style="float:none;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/CorpCarrybackDecreaseTxCmptGrp[1]/CorpBeforeCarrybackGrp/CorpCommonCarrybackGrp/TotalTaxLiabilityAmt"/>
									</xsl:call-template>
								</td>
								<td class="sty1139AmtBox" style="float:none;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/CorpCarrybackDecreaseTxCmptGrp[1]/CorpAfterCarrybackGrp/CorpCommonCarrybackGrp/TotalTaxLiabilityAmt"/>
									</xsl:call-template>
								</td>
								<td class="sty1139AmtBox" style="float:none;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/CorpCarrybackDecreaseTxCmptGrp[2]/CorpBeforeCarrybackGrp/CorpCommonCarrybackGrp/TotalTaxLiabilityAmt"/>
									</xsl:call-template>
								</td>
								<td class="sty1139AmtBox" style="float:none;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/CorpCarrybackDecreaseTxCmptGrp[2]/CorpAfterCarrybackGrp/CorpCommonCarrybackGrp/TotalTaxLiabilityAmt"/>
									</xsl:call-template>
								</td>
								<td class="sty1139AmtBox" style="float:none;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/CorpCarrybackDecreaseTxCmptGrp[3]/CorpBeforeCarrybackGrp/CorpCommonCarrybackGrp/TotalTaxLiabilityAmt"/>
									</xsl:call-template>
								</td>
								<td class="sty1139AmtBox" style="float:none;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/CorpCarrybackDecreaseTxCmptGrp[3]/CorpAfterCarrybackGrp/CorpCommonCarrybackGrp/TotalTaxLiabilityAmt"/>
									</xsl:call-template>
								</td>
							</tr>
							<!-- Line 27 -->
							<tr style="vertical-align:bottom;">
								<td class="styLNLeftNumBox" style="float:none;vertical-align:top;">27</td>
								<td class="sty1139ShortDesc" style="float:none;border-top:1px solid black;">
									Enter amount from "After carryback" column on line 26 for each year
									<span class="sty1139DotLn">.......</span>
								</td>
								<td class="sty1139AmtBox" style="float:none;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/CorpCarrybackDecreaseTxCmptGrp[1]/CorpAfterCarrybackGrp/CorpCommonCarrybackGrp/TotalTaxLiabilityAmt"/>
									</xsl:call-template>
								</td>
								<td class="sty1139AmtBox" style="float:none;background-color:lightgrey;">&nbsp;</td>
								<td class="sty1139AmtBox" style="float:none;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/CorpCarrybackDecreaseTxCmptGrp[2]/CorpAfterCarrybackGrp/CorpCommonCarrybackGrp/TotalTaxLiabilityAmt"/>
									</xsl:call-template>
								</td>
								<td class="sty1139AmtBox" style="float:none;background-color:lightgrey;">&nbsp;</td>
								<td class="sty1139AmtBox" style="float:none;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/CorpCarrybackDecreaseTxCmptGrp[3]/CorpAfterCarrybackGrp/CorpCommonCarrybackGrp/TotalTaxLiabilityAmt"/>
									</xsl:call-template>
								</td>
								<td class="sty1139AmtBox" style="float:none;background-color:lightgrey;">&nbsp;</td>
							</tr>
							<!-- Line 28 -->
							<tr style="vertical-align:bottom;">
								<td class="styLNLeftNumBox" style="float:none;">28</td>
								<td class="sty1139ShortDesc" style="float:none;border-top:1px solid black;border-bottom:1px solid black;">
									<strong>Decrease in tax. </strong> Subtract line 27 from line 26
								</td>
								<td class="sty1139AmtBox" style="float:none;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/CorpCarrybackDecreaseTxCmptGrp[1]/CorpBeforeCarrybackGrp/TaxDecreaseAmt"/>
									</xsl:call-template>
								</td>
								<td class="sty1139AmtBox" style="float:none;background-color:lightgrey;">&nbsp;</td>
								<td class="sty1139AmtBox" style="float:none;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/CorpCarrybackDecreaseTxCmptGrp[2]/CorpBeforeCarrybackGrp/TaxDecreaseAmt"/>
									</xsl:call-template>
								</td>
								<td class="sty1139AmtBox" style="float:none;background-color:lightgrey;">&nbsp;</td>
								<td class="sty1139AmtBox" style="float:none;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/CorpCarrybackDecreaseTxCmptGrp[3]/CorpBeforeCarrybackGrp/TaxDecreaseAmt"/>
									</xsl:call-template>
								</td>
								<td class="sty1139AmtBox" style="float:none;background-color:lightgrey;">&nbsp;</td>
							</tr>
						</tbody>
					</table>
				</div>
				<!-- Line 29 -->
				<div class="styStdDiv">
					<div class="styLNLeftNumBox" style="margin-top:3mm;">29</div>
					<div class="sty1139LongDesc" style="width:150mm;margin-top:3mm;">
						Overpayment of tax due to a claim of right adjustment under section 1341(b)(1) (attach computation)
						<xsl:call-template name="SetFormLinkInline">
							<xsl:with-param name="TargetNode" select="$FormData/OvpmtTxClaimOfRightAdjAmt"/>
						</xsl:call-template>
						<span class="sty1139DotLn">....</span>
					</div>
					<div class="styLNRightNumBox" style="height:8mm;padding-top:3.5mm;">29</div>
					<div class="sty1139AmtBox" style="border-bottom-width:1px;height:8mm;padding-top:4mm;">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/OvpmtTxClaimOfRightAdjAmt"/>
						</xsl:call-template>
					</div>
				</div>
				<!-- Line 30 -->
				<div class="styStdDiv">
					<div class="styLNLeftNumBox">30</div>
					<div class="sty1139LongDesc" style="width:150mm;">
						Complete the direct deposit information for your refund from line(s) 28 and/or line 29. See instructions.
					</div>
					<div class="styLNRightNumBox" style="height:4.5mm;background-color:lightgrey;border-bottom:0;">&nbsp;</div>
					<div class="sty1139AmtBox" style="border-bottom-width:1px;height:4.5mm;padding-top:1mm;background-color:lightgrey;border-bottom:0;">
						&nbsp;
					</div>
				</div>
				<div class="styStdDiv">
					<div class="styLNLeftNumBoxSD" style="padding-left:4.2mm;">a</div>
					<div class="sty1139LongDesc" style="width:25mm;">
						Routing number
					</div>
					<div class="styGenericDiv" style="height:auto;width:50mm;border:1px solid;text-align:center;">
						<xsl:call-template name="PopulateText">
							<xsl:with-param name="TargetNode" select="$FormData/DirectDepositGrp/RoutingTransitNum"/>	
						</xsl:call-template>
					</div>
					<div class="styLNLeftLtrBox" style="margin-left:10mm;">b</div>
					<div class="sty1139LongDesc" style="width:17mm;">
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
					<div class="styLNRightNumBox" style="height:4.5mm;background-color:lightgrey;border-bottom:0;">&nbsp;</div>
					<div class="sty1139AmtBox" style="border-bottom-width:1px;height:4.5mm;padding-top:1mm;background-color:lightgrey;border-bottom:0;">
						&nbsp;
					</div>
				</div>
				<div class="styStdDiv">
					<div class="styLNLeftNumBoxSD" style="padding-left:4.2mm;">c</div>
					<div class="sty1139LongDesc" style="width:25mm;">
						Account number
					</div>
					<div style="width:125mm;float:left;">
						<div class="styGenericDiv" style="height:auto;width:75mm;border:1px solid;text-align:center;">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/DirectDepositGrp/DepositorAccountNum"/>
							</xsl:call-template>
						</div>
					</div>
					<div class="styLNRightNumBox" style="height:4.5mm;background-color:lightgrey;border-bottom:0;">&nbsp;</div>
					<div class="sty1139AmtBox" style="border-bottom-width:1px;height:4.5mm;padding-top:1mm;background-color:lightgrey;border-bottom:0;">
						&nbsp;
					</div>
				</div>
				<!-- Sign Here -->
				<div class="styStdDiv" style="border-bottom:1px solid black;border-top:1px solid black;">
					<div class="styGenericDiv" style="width:13mm;height:12.5mm;font-size:12pt;font-weight:bold;padding-top:1mm;">
						Sign Here
					</div>
					<div class="styGenericDiv" style="width:173mm;padding:0.5mm;padding-left:1mm;margin-bottom:0.5mm;">
						Under penalties of perjury, I declare that I have examined this application and accompanying schedules and statements, and to the best of my knowledge and belief, they are true, correct, and complete.
					</div>
					<div class="styGenericDiv" style="width:174mm;">
						<div class="styGenericDiv" style="width:92mm;">
							<span style="width:100%;height:5mm;border-bottom:1px solid black;border-right:1px solid black;vertical-align:bottom;padding-left:1mm;">
								<xsl:call-template name="PopulateReturnHeaderOfficer">
									<xsl:with-param name="TargetNode">Name</xsl:with-param>
								</xsl:call-template>
							</span>
							<span style="padding-left:1mm;">Signature of officer</span>
						</div>
						<div class="styGenericDiv" style="width:35mm;">
							<span style="width:100%;height:5mm;border-bottom:1px solid black;padding-left:1mm;border-right:1px solid black;">
								<xsl:call-template name="PopulateReturnHeaderOfficer">
									<xsl:with-param name="TargetNode">DateSigned</xsl:with-param>
								</xsl:call-template>
							</span>
							<span style="padding-left:1mm;">Date</span>
						</div>
						<div class="styGenericDiv" style="width:46mm;">
							<span style="width:100%;min-height:5mm;border-bottom:1px solid black;padding-left:1mm;">
								<xsl:call-template name="PopulateReturnHeaderOfficer">
									<xsl:with-param name="TargetNode">Title</xsl:with-param>
								</xsl:call-template>
							</span>
							<span style="padding-left:1mm;">Title</span>
						</div>
					</div>
				</div>
				<!-- Implementing the preparer section in table -->
				<div class="styStdDiv" style="font-size:6pt;">
					<div style="width:22.75mm;padding-top:4mm;float:left;clear:none;height:auto;">
						<span class="styMainTitle" style="font-size:11pt;height:auto;">
                  Paid
                  Preparer
                  Use Only
                  </span>
					</div>
					<div style="width:164mm;float:left;clear:none;">
						<div style="width:164mm;float:left;clear:none;border-style:solid;border-color:black;border-width:0px 0px 1px 0px;">
							<div class="styLNDesc" style="height:7.5mm;width:46.8mm;padding-top:0mm;border-right:1px solid black;border-left:1px solid black;padding-left:1mm;">
									Preparer's name<br/>
									<xsl:call-template name="PopulateReturnHeaderPreparer">
									<xsl:with-param name="TargetNode">PreparerPersonNm</xsl:with-param>
								</xsl:call-template>
                </div>
							<div class="styLNDesc" style="height:7.5mm;width:46.5mm;padding-top:0mm;border-right:1px solid black;padding-left:1mm;">
                Preparer's signature<br/>
              </div>
							<div class="styLNDesc" style="height:7.5mm;width:15mm;border-right:1px solid black;padding-top:0mm;padding-left:1mm;">Date <br/>
                  <xsl:call-template name="PopulateReturnHeaderPreparer">
									<xsl:with-param name="TargetNode">DatePrepared</xsl:with-param>
								</xsl:call-template>
                </div>
							<div class="styLNDesc" style="height:7.5mm;width:18mm;border-right:1px solid black;border-left:1px ;padding-top:.5mm;padding-bottom:0mm;padding-left:1mm;">
								<label>
                    <xsl:call-template name="PopulateReturnHeaderPreparer">
										<xsl:with-param name="TargetNode">SelfEmployedLabel</xsl:with-param>
										<xsl:with-param name="BackupName">PreparerSelfEmployed</xsl:with-param>
									</xsl:call-template>
                    Check 
                  <input type="checkbox" class="styCkboxNM" aria-label="Self Employed Checkbox">
										<xsl:call-template name="PopulateReturnHeaderPreparer">
											<xsl:with-param name="TargetNode">SelfEmployedCheckbox</xsl:with-param>
											<xsl:with-param name="BackupName">PreparerSelfEmployed</xsl:with-param>
										</xsl:call-template>
									</input>
                    <span style="width:4px;"/>if<br/>self-employed
                  </label>
							</div>
							<div class="styLNDesc" style="height:7.5mm;width:16mm;padding-top:0mm;padding-left:1mm;">PTIN
                  <br/>
                  <xsl:call-template name="PopulateReturnHeaderPreparer">
									<xsl:with-param name="TargetNode">SSN</xsl:with-param>
								</xsl:call-template>
									<xsl:call-template name="PopulateReturnHeaderPreparer">
									<xsl:with-param name="TargetNode">PTIN</xsl:with-param>
								</xsl:call-template>
                </div>
						</div>
						<div style="width:164mm;float:left;clear:none;border-bottom:1px ">
							<div class="styLNDesc" style="height:auto;width:108.5mm;border-right:1px solid black; border-left:1px solid black;padding-left:1mm;border-bottom:1px solid black;">
								<span class="styGenericDiv" style="">Firm's name 
                  <span style="width:2.2mm;"/>
                    <span style="width:4px;"/>
                  </span>
								<div class="styGenericDiv" style="padding-right:.5mm;">
									<xsl:call-template name="PopulateReturnHeaderPreparerFirm">
										<xsl:with-param name="TargetNode">BusinessNameLine1Txt</xsl:with-param>
									</xsl:call-template>
									<br/>
									<xsl:call-template name="PopulateReturnHeaderPreparerFirm">
										<xsl:with-param name="TargetNode">BusinessNameLine2Txt</xsl:with-param>
									</xsl:call-template>
								</div>
							</div>
							<div class="styLNDesc" style="height:auto;width:42mm;padding-left:1mm;border-bottom:0px solid black;">Firm's EIN
                <span style="width:4px;"/>
                  <xsl:call-template name="PopulateReturnHeaderPreparerFirm">
									<xsl:with-param name="TargetNode">EIN</xsl:with-param>
								</xsl:call-template>
								<xsl:call-template name="PopulateReturnHeaderPreparerFirm">
									<xsl:with-param name="TargetNode">MissingEINReason</xsl:with-param>
								</xsl:call-template>
                </div>
						</div>
						<div style="width:164mm;float:left;clear:none;">
							<div class="styLNDesc" style="height:auto;width:108.5mm;border-right:1px solid black;border-left:1px solid black;padding-left:1mm;">
								<div class="styGenericDiv" style="padding-right:.5mm;">Firm's address 
                </div>
								<div class="styGenericDiv" style="padding-right:.5mm;margin-left:1mm;">
									<xsl:call-template name="PopulateReturnHeaderPreparerFirm">
										<xsl:with-param name="TargetNode">AddressLine1Txt</xsl:with-param>
									</xsl:call-template>
									<br/>
									<xsl:call-template name="PopulateReturnHeaderPreparerFirm">
										<xsl:with-param name="TargetNode">AddressLine2Txt</xsl:with-param>
									</xsl:call-template>
									<br/>
									<xsl:call-template name="PopulateReturnHeaderPreparerFirm">
										<xsl:with-param name="TargetNode">CityStateInfo</xsl:with-param>
									</xsl:call-template>
									<br/>
									<xsl:call-template name="PopulateReturnHeaderPreparerFirm">
										<xsl:with-param name="TargetNode">CountryCd</xsl:with-param>
									</xsl:call-template>
								</div>
							</div>
							<div class="styLNDesc" style="width:55mm;padding-left:1mm;height:auto;border-top:1px solid black;"> Phone no. 
                  <xsl:call-template name="PopulateReturnHeaderPreparer">
									<xsl:with-param name="TargetNode">Phone</xsl:with-param>
								</xsl:call-template>
								<xsl:call-template name="PopulateReturnHeaderPreparer">
									<xsl:with-param name="TargetNode">ForeignPhoneNum</xsl:with-param>
								</xsl:call-template>
                </div>
						</div>
					</div>
				</div>
				<!-- Page 2 Break and Footer-->
				<div class="pageEnd" style="width:187mm;border-top:1px solid black;">
					<span class="styBoldText">For Paperwork Reduction Act Notice, see separate instructions. </span>
					<span style="width:19mm;"/>Cat. No. 11170F                      
					<span style="float:right;">
						Form <span class="styBoldText" style="font-size:8pt;">1139</span> (Rev. 12-2025)
					</span>
				</div>
				<xsl:if test="count($FormData/CorpCarrybackDecreaseTxCmptGrp) &gt; 3">
					<div class="styStdDiv" style="border-top:1px solid black;font-family:Verdana;font-size:9pt;margin-top:3mm;">
						<strong>Computation of Decrease in Tax </strong>
						<span style="font-style:italic;"> (continued)</span>
					</div>
					<xsl:for-each select="$FormData/CorpCarrybackDecreaseTxCmptGrp[position() &gt; 3]">
						<xsl:variable name="pos" select="position()"/>
						<xsl:if test="$pos mod 3 = 1">
							<div class="styStdDiv" style="text-align:center;border-top:1px solid black;padding-left:8mm;">
								<div class="styGenericDiv" style="width:59.6mm;border-left:1px solid black;">
									<div class="styGenericDiv" style="width:100%;height:auto;padding:0.5mm;border-bottom:1px solid black;">
									<span style="width:18mm;border-bottom:1px dashed black;margin-right:1mm;">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="$FormData/CorpCarrybackDecreaseTxCmptGrp[$pos + 3]/PrecedingYearNum"/>
											</xsl:call-template>
										</span>
									<strong>preceding <br/> tax year ended</strong>
									<span style="width:17mm;border-bottom:1px dashed black;margin-left:1mm;">
											<xsl:call-template name="PopulateMonthDayYear">
												<xsl:with-param name="TargetNode" select="$FormData/CorpCarrybackDecreaseTxCmptGrp[$pos + 3]/TaxPeriodEndDt"/>
											</xsl:call-template>
										</span>
								</div>
									<div class="styGenericDiv" style="width:50%;height:auto;padding:0.5mm;"><strong>(a) </strong> Before carryback</div>
									<div class="styGenericDiv" style="width:50%;height:auto;padding:0.5mm;border-left:1px solid black;"><strong>(b) </strong> After carryback</div>
								</div>
								<div class="styGenericDiv" style="width:59.6mm;border-left:1px solid black;">
									<div class="styGenericDiv" style="width:100%;height:auto;padding:0.5mm;border-bottom:1px solid black;">
									<span style="width:18mm;border-bottom:1px dashed black;margin-right:1mm;">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="$FormData/CorpCarrybackDecreaseTxCmptGrp[$pos + 4]/PrecedingYearNum"/>
											</xsl:call-template>
										</span>
									<strong>preceding <br/> tax year ended</strong>
									<span style="width:17mm;border-bottom:1px dashed black;margin-left:1mm;">
											<xsl:call-template name="PopulateMonthDayYear">
												<xsl:with-param name="TargetNode" select="$FormData/CorpCarrybackDecreaseTxCmptGrp[$pos + 4]/TaxPeriodEndDt"/>
											</xsl:call-template>
										</span>
								</div>
									<div class="styGenericDiv" style="width:50%;height:auto;padding:0.5mm;"><strong>(c) </strong> Before carryback</div>
									<div class="styGenericDiv" style="width:50%;height:auto;padding:0.5mm;border-left:1px solid black;"><strong>(d) </strong> After carryback</div>
								</div>
								<div class="styGenericDiv" style="width:59.6mm;border-left:1px solid black;">
									<div class="styGenericDiv" style="width:100%;height:auto;padding:0.5mm;border-bottom:1px solid black;">
									<span style="width:18mm;border-bottom:1px dashed black;margin-right:1mm;">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="$FormData/CorpCarrybackDecreaseTxCmptGrp[$pos + 5]/PrecedingYearNum"/>
											</xsl:call-template>
										</span>
									<strong>preceding <br/> tax year ended</strong> 
									<span style="width:17mm;border-bottom:1px dashed black;margin-left:1mm;">
											<xsl:call-template name="PopulateMonthDayYear">
												<xsl:with-param name="TargetNode" select="$FormData/CorpCarrybackDecreaseTxCmptGrp[$pos + 5]/TaxPeriodEndDt"/>
											</xsl:call-template>
										</span>
								</div>
									<div class="styGenericDiv" style="width:50%;height:auto;padding:0.5mm;"><strong>(e) </strong> Before carryback</div>
									<div class="styGenericDiv" style="width:50%;height:auto;padding:0.5mm;border-left:1px solid black;"><strong>(f) </strong> After carryback</div>
								</div>
							</div>
							<!-- Line 11 -->
							<div class="styStdDiv" style="border-top:1px solid black;">
								<div class="styLNLeftNumBox">11</div>
								<div class="sty1139AmtBoxEx">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/CorpCarrybackDecreaseTxCmptGrp[$pos + 3]/CorpBeforeCarrybackGrp/TaxableIncomePerReturnAmt"/>
									</xsl:call-template>
								</div>
								<div class="sty1139AmtBoxEx">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/CorpCarrybackDecreaseTxCmptGrp[$pos + 3]/CorpAfterCarrybackGrp/TaxableIncomePerReturnAmt"/>
									</xsl:call-template>
								</div>
								<div class="sty1139AmtBoxEx">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/CorpCarrybackDecreaseTxCmptGrp[$pos + 4]/CorpBeforeCarrybackGrp/TaxableIncomePerReturnAmt"/>
									</xsl:call-template>
								</div>
								<div class="sty1139AmtBoxEx">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/CorpCarrybackDecreaseTxCmptGrp[$pos + 4]/CorpAfterCarrybackGrp/TaxableIncomePerReturnAmt"/>
									</xsl:call-template>
								</div>
								<div class="sty1139AmtBoxEx">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/CorpCarrybackDecreaseTxCmptGrp[$pos + 5]/CorpBeforeCarrybackGrp/TaxableIncomePerReturnAmt"/>
									</xsl:call-template>
								</div>
								<div class="sty1139AmtBoxEx">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/CorpCarrybackDecreaseTxCmptGrp[$pos + 5]/CorpAfterCarrybackGrp/TaxableIncomePerReturnAmt"/>
									</xsl:call-template>
								</div>
							</div>
							<!-- Line 12 -->
							<div class="styStdDiv">
								<div class="styLNLeftNumBox">12</div>
								<div class="sty1139AmtBoxEx" style="background-color:lightgrey;">
									<xsl:call-template name="SetFormLinkInline">
										<xsl:with-param name="TargetNode" select="$FormData/CorpCarrybackDecreaseTxCmptGrp[$pos + 3]/CorpAfterCarrybackGrp/CapLossCybkAmt"/>
									</xsl:call-template>
								</div>
								<div class="sty1139AmtBoxEx">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/CorpCarrybackDecreaseTxCmptGrp[$pos + 3]/CorpAfterCarrybackGrp/CapLossCybkAmt"/>
									</xsl:call-template>
								</div>
								<div class="sty1139AmtBoxEx" style="background-color:lightgrey;">
									<xsl:call-template name="SetFormLinkInline">
										<xsl:with-param name="TargetNode" select="$FormData/CorpCarrybackDecreaseTxCmptGrp[$pos + 4]/CorpAfterCarrybackGrp/CapLossCybkAmt"/>
									</xsl:call-template>
								</div>
								<div class="sty1139AmtBoxEx">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/CorpCarrybackDecreaseTxCmptGrp[$pos + 4]/CorpAfterCarrybackGrp/CapLossCybkAmt"/>
									</xsl:call-template>
								</div>
								<div class="sty1139AmtBoxEx" style="background-color:lightgrey;">
									<xsl:call-template name="SetFormLinkInline">
										<xsl:with-param name="TargetNode" select="$FormData/CorpCarrybackDecreaseTxCmptGrp[$pos + 5]/CorpAfterCarrybackGrp/CapLossCybkAmt"/>
									</xsl:call-template>
								</div>
								<div class="sty1139AmtBoxEx">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/CorpCarrybackDecreaseTxCmptGrp[$pos + 5]/CorpAfterCarrybackGrp/CapLossCybkAmt"/>
									</xsl:call-template>
								</div>
							</div>
							<!-- Line 13 -->
							<div class="styStdDiv">
								<div class="styLNLeftNumBox">13</div>
								<div class="sty1139AmtBoxEx" style="background-color:lightgrey;">&nbsp;</div>
								<div class="sty1139AmtBoxEx">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/CorpCarrybackDecreaseTxCmptGrp[$pos + 3]/CorpAfterCarrybackGrp/TaxableIncmLessCapLossCybkAmt"/>
									</xsl:call-template>
								</div>
								<div class="sty1139AmtBoxEx" style="background-color:lightgrey;">&nbsp;</div>
								<div class="sty1139AmtBoxEx">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/CorpCarrybackDecreaseTxCmptGrp[$pos + 4]/CorpAfterCarrybackGrp/TaxableIncmLessCapLossCybkAmt"/>
									</xsl:call-template>
								</div>
								<div class="sty1139AmtBoxEx" style="background-color:lightgrey;">&nbsp;</div>
								<div class="sty1139AmtBoxEx">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/CorpCarrybackDecreaseTxCmptGrp[$pos + 5]/CorpAfterCarrybackGrp/TaxableIncmLessCapLossCybkAmt"/>
									</xsl:call-template>
								</div>
							</div>
							<!-- Line 14 -->
							<div class="styStdDiv">
								<div class="styLNLeftNumBox">14</div>
								<div class="sty1139AmtBoxEx" style="background-color:lightgrey;">&nbsp;</div>
								<div class="sty1139AmtBoxEx">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/CorpCarrybackDecreaseTxCmptGrp[$pos + 3]/CorpAfterCarrybackGrp/NetOperatingLossDeductionAmt"/>
									</xsl:call-template>
								</div>
								<div class="sty1139AmtBoxEx" style="background-color:lightgrey;">&nbsp;</div>
								<div class="sty1139AmtBoxEx">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/CorpCarrybackDecreaseTxCmptGrp[$pos + 4]/CorpAfterCarrybackGrp/NetOperatingLossDeductionAmt"/>
									</xsl:call-template>
								</div>
								<div class="sty1139AmtBoxEx" style="background-color:lightgrey;">&nbsp;</div>
								<div class="sty1139AmtBoxEx">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/CorpCarrybackDecreaseTxCmptGrp[$pos + 5]/CorpAfterCarrybackGrp/NetOperatingLossDeductionAmt"/>
									</xsl:call-template>
								</div>
							</div>
							<!-- Line 15 -->
							<div class="styStdDiv">
								<div class="styLNLeftNumBox">15</div>
								<div class="sty1139AmtBoxEx" style="background-color:lightgrey;">&nbsp;</div>
								<div class="sty1139AmtBoxEx">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/CorpCarrybackDecreaseTxCmptGrp[$pos + 3]/CorpAfterCarrybackGrp/TaxableIncomeAmt"/>
									</xsl:call-template>
								</div>
								<div class="sty1139AmtBoxEx" style="background-color:lightgrey;">&nbsp;</div>
								<div class="sty1139AmtBoxEx">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/CorpCarrybackDecreaseTxCmptGrp[$pos + 4]/CorpAfterCarrybackGrp/TaxableIncomeAmt"/>
									</xsl:call-template>
								</div>
								<div class="sty1139AmtBoxEx" style="background-color:lightgrey;">&nbsp;</div>
								<div class="sty1139AmtBoxEx">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/CorpCarrybackDecreaseTxCmptGrp[$pos + 5]/CorpAfterCarrybackGrp/TaxableIncomeAmt"/>
									</xsl:call-template>
								</div>
							</div>
							<!-- Line 16 -->
							<div class="styStdDiv">
								<div class="styLNLeftNumBox">16</div>
								<div class="sty1139AmtBoxEx">
									<span style="float:left;">
										<xsl:call-template name="SetFormLinkInline">
											<xsl:with-param name="TargetNode" select="$FormData/CorpCarrybackDecreaseTxCmptGrp[$pos + 3]/CorpBeforeCarrybackGrp/CorpCommonCarrybackGrp/IncomeTaxAmt"/>
										</xsl:call-template>
									</span>
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/CorpCarrybackDecreaseTxCmptGrp[$pos + 3]/CorpBeforeCarrybackGrp/CorpCommonCarrybackGrp/IncomeTaxAmt"/>
									</xsl:call-template>
								</div>
								<div class="sty1139AmtBoxEx">
									<span style="float:left;">
										<xsl:call-template name="SetFormLinkInline">
											<xsl:with-param name="TargetNode" select="$FormData/CorpCarrybackDecreaseTxCmptGrp[$pos + 3]/CorpAfterCarrybackGrp/CorpCommonCarrybackGrp/IncomeTaxAmt"/>
										</xsl:call-template>
									</span>
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/CorpCarrybackDecreaseTxCmptGrp[$pos + 3]/CorpAfterCarrybackGrp/CorpCommonCarrybackGrp/IncomeTaxAmt"/>
									</xsl:call-template>
								</div>
								<div class="sty1139AmtBoxEx">
									<span style="float:left;">
										<xsl:call-template name="SetFormLinkInline">
											<xsl:with-param name="TargetNode" select="$FormData/CorpCarrybackDecreaseTxCmptGrp[$pos + 4]/CorpBeforeCarrybackGrp/CorpCommonCarrybackGrp/IncomeTaxAmt"/>
										</xsl:call-template>
									</span>
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/CorpCarrybackDecreaseTxCmptGrp[$pos + 4]/CorpBeforeCarrybackGrp/CorpCommonCarrybackGrp/IncomeTaxAmt"/>
									</xsl:call-template>
								</div>
								<div class="sty1139AmtBoxEx">
									<span style="float:left;">
										<xsl:call-template name="SetFormLinkInline">
											<xsl:with-param name="TargetNode" select="$FormData/CorpCarrybackDecreaseTxCmptGrp[$pos + 4]/CorpAfterCarrybackGrp/CorpCommonCarrybackGrp/IncomeTaxAmt"/>
										</xsl:call-template>
									</span>
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/CorpCarrybackDecreaseTxCmptGrp[$pos + 4]/CorpAfterCarrybackGrp/CorpCommonCarrybackGrp/IncomeTaxAmt"/>
									</xsl:call-template>
								</div>
								<div class="sty1139AmtBoxEx">
									<span style="float:left;">
										<xsl:call-template name="SetFormLinkInline">
											<xsl:with-param name="TargetNode" select="$FormData/CorpCarrybackDecreaseTxCmptGrp[$pos + 5]/CorpBeforeCarrybackGrp/CorpCommonCarrybackGrp/IncomeTaxAmt"/>
										</xsl:call-template>
									</span>
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/CorpCarrybackDecreaseTxCmptGrp[$pos + 5]/CorpBeforeCarrybackGrp/CorpCommonCarrybackGrp/IncomeTaxAmt"/>
									</xsl:call-template>
								</div>
								<div class="sty1139AmtBoxEx">
									<span style="float:left;">
										<xsl:call-template name="SetFormLinkInline">
											<xsl:with-param name="TargetNode" select="$FormData/CorpCarrybackDecreaseTxCmptGrp[$pos + 5]/CorpAfterCarrybackGrp/CorpCommonCarrybackGrp/IncomeTaxAmt"/>
										</xsl:call-template>
									</span>
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/CorpCarrybackDecreaseTxCmptGrp[$pos + 5]/CorpAfterCarrybackGrp/CorpCommonCarrybackGrp/IncomeTaxAmt"/>
									</xsl:call-template>
								</div>
							</div>
							<!-- Line 17 -->
							<div class="styStdDiv">
								<div class="styLNLeftNumBox">17</div>
								<div class="sty1139AmtBoxEx">
									<span style="float:left;">
										<xsl:call-template name="SetFormLinkInline">
											<xsl:with-param name="TargetNode" select="$FormData/CorpCarrybackDecreaseTxCmptGrp[$pos + 3]/CorpBeforeCarrybackGrp/CorpCommonCarrybackGrp/AlternativeMinimumTaxAmt"/>
										</xsl:call-template>
									</span>
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/CorpCarrybackDecreaseTxCmptGrp[$pos + 3]/CorpBeforeCarrybackGrp/CorpCommonCarrybackGrp/AlternativeMinimumTaxAmt"/>
									</xsl:call-template>
								</div>
								<div class="sty1139AmtBoxEx">
									<span style="float:left;">
										<xsl:call-template name="SetFormLinkInline">
											<xsl:with-param name="TargetNode" select="$FormData/CorpCarrybackDecreaseTxCmptGrp[$pos + 3]/CorpAfterCarrybackGrp/CorpCommonCarrybackGrp/AlternativeMinimumTaxAmt"/>
										</xsl:call-template>
									</span>
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/CorpCarrybackDecreaseTxCmptGrp[$pos + 3]/CorpAfterCarrybackGrp/CorpCommonCarrybackGrp/AlternativeMinimumTaxAmt"/>
									</xsl:call-template>
								</div>
								<div class="sty1139AmtBoxEx">
									<span style="float:left;">
										<xsl:call-template name="SetFormLinkInline">
											<xsl:with-param name="TargetNode" select="$FormData/CorpCarrybackDecreaseTxCmptGrp[$pos + 4]/CorpBeforeCarrybackGrp/CorpCommonCarrybackGrp/AlternativeMinimumTaxAmt"/>
										</xsl:call-template>
									</span>
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/CorpCarrybackDecreaseTxCmptGrp[$pos + 4]/CorpBeforeCarrybackGrp/CorpCommonCarrybackGrp/AlternativeMinimumTaxAmt"/>
									</xsl:call-template>
								</div>
								<div class="sty1139AmtBoxEx">
									<span style="float:left;">
										<xsl:call-template name="SetFormLinkInline">
											<xsl:with-param name="TargetNode" select="$FormData/CorpCarrybackDecreaseTxCmptGrp[$pos + 4]/CorpAfterCarrybackGrp/CorpCommonCarrybackGrp/AlternativeMinimumTaxAmt"/>
										</xsl:call-template>
									</span>
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/CorpCarrybackDecreaseTxCmptGrp[$pos + 4]/CorpAfterCarrybackGrp/CorpCommonCarrybackGrp/AlternativeMinimumTaxAmt"/>
									</xsl:call-template>
								</div>
								<div class="sty1139AmtBoxEx">
									<span style="float:left;">
										<xsl:call-template name="SetFormLinkInline">
											<xsl:with-param name="TargetNode" select="$FormData/CorpCarrybackDecreaseTxCmptGrp[$pos + 5]/CorpBeforeCarrybackGrp/CorpCommonCarrybackGrp/AlternativeMinimumTaxAmt"/>
										</xsl:call-template>
									</span>
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/CorpCarrybackDecreaseTxCmptGrp[$pos + 5]/CorpBeforeCarrybackGrp/CorpCommonCarrybackGrp/AlternativeMinimumTaxAmt"/>
									</xsl:call-template>
								</div>
								<div class="sty1139AmtBoxEx">
									<span style="float:left;">
										<xsl:call-template name="SetFormLinkInline">
											<xsl:with-param name="TargetNode" select="$FormData/CorpCarrybackDecreaseTxCmptGrp[$pos + 5]/CorpAfterCarrybackGrp/CorpCommonCarrybackGrp/AlternativeMinimumTaxAmt"/>
										</xsl:call-template>
									</span>
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/CorpCarrybackDecreaseTxCmptGrp[$pos + 5]/CorpAfterCarrybackGrp/CorpCommonCarrybackGrp/AlternativeMinimumTaxAmt"/>
									</xsl:call-template>
								</div>
							</div>
							<!-- Line 18 -->
							<div class="styStdDiv">
								<div class="styLNLeftNumBox">18</div>
								<div class="sty1139AmtBoxEx">
									<span style="float:left;">
										<xsl:call-template name="SetFormLinkInline">
											<xsl:with-param name="TargetNode" select="$FormData/CorpCarrybackDecreaseTxCmptGrp[$pos + 3]/CorpBeforeCarrybackGrp/CorpCommonCarrybackGrp/BaseErosionMinimumTaxAmt"/>
										</xsl:call-template>
									</span>
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/CorpCarrybackDecreaseTxCmptGrp[$pos + 3]/CorpBeforeCarrybackGrp/CorpCommonCarrybackGrp/BaseErosionMinimumTaxAmt"/>
									</xsl:call-template>
								</div>
								<div class="sty1139AmtBoxEx">
									<span style="float:left;">
										<xsl:call-template name="SetFormLinkInline">
											<xsl:with-param name="TargetNode" select="$FormData/CorpCarrybackDecreaseTxCmptGrp[$pos + 3]/CorpAfterCarrybackGrp/CorpCommonCarrybackGrp/BaseErosionMinimumTaxAmt"/>
										</xsl:call-template>
									</span>
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/CorpCarrybackDecreaseTxCmptGrp[$pos + 3]/CorpAfterCarrybackGrp/CorpCommonCarrybackGrp/BaseErosionMinimumTaxAmt"/>
									</xsl:call-template>
								</div>
								<div class="sty1139AmtBoxEx">
									<span style="float:left;">
										<xsl:call-template name="SetFormLinkInline">
											<xsl:with-param name="TargetNode" select="$FormData/CorpCarrybackDecreaseTxCmptGrp[$pos + 4]/CorpBeforeCarrybackGrp/CorpCommonCarrybackGrp/BaseErosionMinimumTaxAmt"/>
										</xsl:call-template>
									</span>
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/CorpCarrybackDecreaseTxCmptGrp[$pos + 4]/CorpBeforeCarrybackGrp/CorpCommonCarrybackGrp/BaseErosionMinimumTaxAmt"/>
									</xsl:call-template>
								</div>
								<div class="sty1139AmtBoxEx">
									<span style="float:left;">
										<xsl:call-template name="SetFormLinkInline">
											<xsl:with-param name="TargetNode" select="$FormData/CorpCarrybackDecreaseTxCmptGrp[$pos + 4]/CorpAfterCarrybackGrp/CorpCommonCarrybackGrp/BaseErosionMinimumTaxAmt"/>
										</xsl:call-template>
									</span>
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/CorpCarrybackDecreaseTxCmptGrp[$pos + 4]/CorpAfterCarrybackGrp/CorpCommonCarrybackGrp/BaseErosionMinimumTaxAmt"/>
									</xsl:call-template>
								</div>
								<div class="sty1139AmtBoxEx">
									<span style="float:left;">
										<xsl:call-template name="SetFormLinkInline">
											<xsl:with-param name="TargetNode" select="$FormData/CorpCarrybackDecreaseTxCmptGrp[$pos + 5]/CorpBeforeCarrybackGrp/CorpCommonCarrybackGrp/BaseErosionMinimumTaxAmt"/>
										</xsl:call-template>
									</span>
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/CorpCarrybackDecreaseTxCmptGrp[$pos + 5]/CorpBeforeCarrybackGrp/CorpCommonCarrybackGrp/BaseErosionMinimumTaxAmt"/>
									</xsl:call-template>
								</div>
								<div class="sty1139AmtBoxEx">
									<span style="float:left;">
										<xsl:call-template name="SetFormLinkInline">
											<xsl:with-param name="TargetNode" select="$FormData/CorpCarrybackDecreaseTxCmptGrp[$pos + 5]/CorpAfterCarrybackGrp/CorpCommonCarrybackGrp/BaseErosionMinimumTaxAmt"/>
										</xsl:call-template>
									</span>
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/CorpCarrybackDecreaseTxCmptGrp[$pos + 5]/CorpAfterCarrybackGrp/CorpCommonCarrybackGrp/BaseErosionMinimumTaxAmt"/>
									</xsl:call-template>
								</div>
							</div>
							<!-- Line 19 -->
							<div class="styStdDiv">
								<div class="styLNLeftNumBox">19</div>
								<div class="sty1139AmtBoxEx">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/CorpCarrybackDecreaseTxCmptGrp[$pos + 3]/CorpBeforeCarrybackGrp/CorpCommonCarrybackGrp/SumTaxesAmt"/>
									</xsl:call-template>
								</div>
								<div class="sty1139AmtBoxEx">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/CorpCarrybackDecreaseTxCmptGrp[$pos + 3]/CorpAfterCarrybackGrp/CorpCommonCarrybackGrp/SumTaxesAmt"/>
									</xsl:call-template>
								</div>
								<div class="sty1139AmtBoxEx">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/CorpCarrybackDecreaseTxCmptGrp[$pos + 4]/CorpBeforeCarrybackGrp/CorpCommonCarrybackGrp/SumTaxesAmt"/>
									</xsl:call-template>
								</div>
								<div class="sty1139AmtBoxEx">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/CorpCarrybackDecreaseTxCmptGrp[$pos + 4]/CorpAfterCarrybackGrp/CorpCommonCarrybackGrp/SumTaxesAmt"/>
									</xsl:call-template>
								</div>
								<div class="sty1139AmtBoxEx">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/CorpCarrybackDecreaseTxCmptGrp[$pos + 5]/CorpBeforeCarrybackGrp/CorpCommonCarrybackGrp/SumTaxesAmt"/>
									</xsl:call-template>
								</div>
								<div class="sty1139AmtBoxEx">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/CorpCarrybackDecreaseTxCmptGrp[$pos + 5]/CorpAfterCarrybackGrp/CorpCommonCarrybackGrp/SumTaxesAmt"/>
									</xsl:call-template>
								</div>
							</div>
							<!-- Line 20 -->
							<div class="styStdDiv">
								<div class="styLNLeftNumBox">20</div>
								<div class="sty1139AmtBoxEx">
									<span style="float:left;">
										<xsl:call-template name="SetFormLinkInline">
											<xsl:with-param name="TargetNode" select="$FormData/CorpCarrybackDecreaseTxCmptGrp[$pos + 3]/CorpBeforeCarrybackGrp/CorpCommonCarrybackGrp/GeneralBusinessCreditAmt"/>
										</xsl:call-template>
									</span>
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/CorpCarrybackDecreaseTxCmptGrp[$pos + 3]/CorpBeforeCarrybackGrp/CorpCommonCarrybackGrp/GeneralBusinessCreditAmt"/>
									</xsl:call-template>
								</div>
								<div class="sty1139AmtBoxEx">
									<span style="float:left;">
										<xsl:call-template name="SetFormLinkInline">
											<xsl:with-param name="TargetNode" select="$FormData/CorpCarrybackDecreaseTxCmptGrp[$pos + 3]/CorpAfterCarrybackGrp/CorpCommonCarrybackGrp/GeneralBusinessCreditAmt"/>
										</xsl:call-template>
									</span>
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/CorpCarrybackDecreaseTxCmptGrp[$pos + 3]/CorpAfterCarrybackGrp/CorpCommonCarrybackGrp/GeneralBusinessCreditAmt"/>
									</xsl:call-template>
								</div>
								<div class="sty1139AmtBoxEx">
									<span style="float:left;">
										<xsl:call-template name="SetFormLinkInline">
											<xsl:with-param name="TargetNode" select="$FormData/CorpCarrybackDecreaseTxCmptGrp[$pos + 4]/CorpBeforeCarrybackGrp/CorpCommonCarrybackGrp/GeneralBusinessCreditAmt"/>
										</xsl:call-template>
									</span>
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/CorpCarrybackDecreaseTxCmptGrp[$pos + 4]/CorpBeforeCarrybackGrp/CorpCommonCarrybackGrp/GeneralBusinessCreditAmt"/>
									</xsl:call-template>
								</div>
								<div class="sty1139AmtBoxEx">
									<span style="float:left;">
										<xsl:call-template name="SetFormLinkInline">
											<xsl:with-param name="TargetNode" select="$FormData/CorpCarrybackDecreaseTxCmptGrp[$pos + 4]/CorpAfterCarrybackGrp/CorpCommonCarrybackGrp/GeneralBusinessCreditAmt"/>
										</xsl:call-template>
									</span>
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/CorpCarrybackDecreaseTxCmptGrp[$pos + 4]/CorpAfterCarrybackGrp/CorpCommonCarrybackGrp/GeneralBusinessCreditAmt"/>
									</xsl:call-template>
								</div>
								<div class="sty1139AmtBoxEx">
									<span style="float:left;">
										<xsl:call-template name="SetFormLinkInline">
											<xsl:with-param name="TargetNode" select="$FormData/CorpCarrybackDecreaseTxCmptGrp[$pos + 5]/CorpBeforeCarrybackGrp/CorpCommonCarrybackGrp/GeneralBusinessCreditAmt"/>
										</xsl:call-template>
									</span>
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/CorpCarrybackDecreaseTxCmptGrp[$pos + 5]/CorpBeforeCarrybackGrp/CorpCommonCarrybackGrp/GeneralBusinessCreditAmt"/>
									</xsl:call-template>
								</div>
								<div class="sty1139AmtBoxEx">
									<span style="float:left;">
										<xsl:call-template name="SetFormLinkInline">
											<xsl:with-param name="TargetNode" select="$FormData/CorpCarrybackDecreaseTxCmptGrp[$pos + 5]/CorpAfterCarrybackGrp/CorpCommonCarrybackGrp/GeneralBusinessCreditAmt"/>
										</xsl:call-template>
									</span>
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/CorpCarrybackDecreaseTxCmptGrp[$pos + 5]/CorpAfterCarrybackGrp/CorpCommonCarrybackGrp/GeneralBusinessCreditAmt"/>
									</xsl:call-template>
								</div>
							</div>
							<!-- Line 21 -->
							<div class="styStdDiv">
								<div class="styLNLeftNumBox">21</div>
								<div class="sty1139AmtBoxEx">
									<span style="float:left;">
										<xsl:call-template name="SetFormLinkInline">
											<xsl:with-param name="TargetNode" select="$FormData/CorpCarrybackDecreaseTxCmptGrp[$pos + 3]/CorpBeforeCarrybackGrp/CorpCommonCarrybackGrp/OtherCreditsAmt"/>
										</xsl:call-template>
									</span>
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/CorpCarrybackDecreaseTxCmptGrp[$pos + 3]/CorpBeforeCarrybackGrp/CorpCommonCarrybackGrp/OtherCreditsAmt"/>
									</xsl:call-template>
								</div>
								<div class="sty1139AmtBoxEx">
									<span style="float:left;">
										<xsl:call-template name="SetFormLinkInline">
											<xsl:with-param name="TargetNode" select="$FormData/CorpCarrybackDecreaseTxCmptGrp[$pos + 3]/CorpAfterCarrybackGrp/CorpCommonCarrybackGrp/OtherCreditsAmt"/>
										</xsl:call-template>
									</span>
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/CorpCarrybackDecreaseTxCmptGrp[$pos + 3]/CorpAfterCarrybackGrp/CorpCommonCarrybackGrp/OtherCreditsAmt"/>
									</xsl:call-template>
								</div>
								<div class="sty1139AmtBoxEx">
									<span style="float:left;">
										<xsl:call-template name="SetFormLinkInline">
											<xsl:with-param name="TargetNode" select="$FormData/CorpCarrybackDecreaseTxCmptGrp[$pos + 4]/CorpBeforeCarrybackGrp/CorpCommonCarrybackGrp/OtherCreditsAmt"/>
										</xsl:call-template>
									</span>
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/CorpCarrybackDecreaseTxCmptGrp[$pos + 4]/CorpBeforeCarrybackGrp/CorpCommonCarrybackGrp/OtherCreditsAmt"/>
									</xsl:call-template>
								</div>
								<div class="sty1139AmtBoxEx">
									<span style="float:left;">
										<xsl:call-template name="SetFormLinkInline">
											<xsl:with-param name="TargetNode" select="$FormData/CorpCarrybackDecreaseTxCmptGrp[$pos + 4]/CorpAfterCarrybackGrp/CorpCommonCarrybackGrp/OtherCreditsAmt"/>
										</xsl:call-template>
									</span>
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/CorpCarrybackDecreaseTxCmptGrp[$pos + 4]/CorpAfterCarrybackGrp/CorpCommonCarrybackGrp/OtherCreditsAmt"/>
									</xsl:call-template>
								</div>
								<div class="sty1139AmtBoxEx">
									<span style="float:left;">
										<xsl:call-template name="SetFormLinkInline">
											<xsl:with-param name="TargetNode" select="$FormData/CorpCarrybackDecreaseTxCmptGrp[$pos + 5]/CorpBeforeCarrybackGrp/CorpCommonCarrybackGrp/OtherCreditsAmt"/>
										</xsl:call-template>
									</span>
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/CorpCarrybackDecreaseTxCmptGrp[$pos + 5]/CorpBeforeCarrybackGrp/CorpCommonCarrybackGrp/OtherCreditsAmt"/>
									</xsl:call-template>
								</div>
								<div class="sty1139AmtBoxEx">
									<span style="float:left;">
										<xsl:call-template name="SetFormLinkInline">
											<xsl:with-param name="TargetNode" select="$FormData/CorpCarrybackDecreaseTxCmptGrp[$pos + 5]/CorpAfterCarrybackGrp/CorpCommonCarrybackGrp/OtherCreditsAmt"/>
										</xsl:call-template>
									</span>
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/CorpCarrybackDecreaseTxCmptGrp[$pos + 5]/CorpAfterCarrybackGrp/CorpCommonCarrybackGrp/OtherCreditsAmt"/>
									</xsl:call-template>
								</div>
							</div>
							<!-- Line 22 -->
							<div class="styStdDiv">
								<div class="styLNLeftNumBox">22</div>
								<div class="sty1139AmtBoxEx">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/CorpCarrybackDecreaseTxCmptGrp[$pos + 3]/CorpBeforeCarrybackGrp/CorpCommonCarrybackGrp/TotalCreditsAmt"/>
									</xsl:call-template>
								</div>
								<div class="sty1139AmtBoxEx">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/CorpCarrybackDecreaseTxCmptGrp[$pos + 3]/CorpAfterCarrybackGrp/CorpCommonCarrybackGrp/TotalCreditsAmt"/>
									</xsl:call-template>
								</div>
								<div class="sty1139AmtBoxEx">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/CorpCarrybackDecreaseTxCmptGrp[$pos + 4]/CorpBeforeCarrybackGrp/CorpCommonCarrybackGrp/TotalCreditsAmt"/>
									</xsl:call-template>
								</div>
								<div class="sty1139AmtBoxEx">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/CorpCarrybackDecreaseTxCmptGrp[$pos + 4]/CorpAfterCarrybackGrp/CorpCommonCarrybackGrp/TotalCreditsAmt"/>
									</xsl:call-template>
								</div>
								<div class="sty1139AmtBoxEx">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/CorpCarrybackDecreaseTxCmptGrp[$pos + 5]/CorpBeforeCarrybackGrp/CorpCommonCarrybackGrp/TotalCreditsAmt"/>
									</xsl:call-template>
								</div>
								<div class="sty1139AmtBoxEx">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/CorpCarrybackDecreaseTxCmptGrp[$pos + 5]/CorpAfterCarrybackGrp/CorpCommonCarrybackGrp/TotalCreditsAmt"/>
									</xsl:call-template>
								</div>
							</div>
							<!-- Line 23 -->
							<div class="styStdDiv">
								<div class="styLNLeftNumBox">23</div>
								<div class="sty1139AmtBoxEx">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/CorpCarrybackDecreaseTxCmptGrp[$pos + 3]/CorpBeforeCarrybackGrp/CorpCommonCarrybackGrp/SumTaxesLessTotalCreditsAmt"/>
									</xsl:call-template>
								</div>
								<div class="sty1139AmtBoxEx">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/CorpCarrybackDecreaseTxCmptGrp[$pos + 3]/CorpAfterCarrybackGrp/CorpCommonCarrybackGrp/SumTaxesLessTotalCreditsAmt"/>
									</xsl:call-template>
								</div>
								<div class="sty1139AmtBoxEx">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/CorpCarrybackDecreaseTxCmptGrp[$pos + 4]/CorpBeforeCarrybackGrp/CorpCommonCarrybackGrp/SumTaxesLessTotalCreditsAmt"/>
									</xsl:call-template>
								</div>
								<div class="sty1139AmtBoxEx">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/CorpCarrybackDecreaseTxCmptGrp[$pos + 4]/CorpAfterCarrybackGrp/CorpCommonCarrybackGrp/SumTaxesLessTotalCreditsAmt"/>
									</xsl:call-template>
								</div>
								<div class="sty1139AmtBoxEx">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/CorpCarrybackDecreaseTxCmptGrp[$pos + 5]/CorpBeforeCarrybackGrp/CorpCommonCarrybackGrp/SumTaxesLessTotalCreditsAmt"/>
									</xsl:call-template>
								</div>
								<div class="sty1139AmtBoxEx">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/CorpCarrybackDecreaseTxCmptGrp[$pos + 5]/CorpAfterCarrybackGrp/CorpCommonCarrybackGrp/SumTaxesLessTotalCreditsAmt"/>
									</xsl:call-template>
								</div>
							</div>
							<!-- Line 24 -->
							<div class="styStdDiv">
								<div class="styLNLeftNumBox">24</div>
								<div class="sty1139AmtBoxEx">
									<span style="float:left;">
										<xsl:call-template name="SetFormLinkInline">
											<xsl:with-param name="TargetNode" select="$FormData/CorpCarrybackDecreaseTxCmptGrp[$pos + 3]/CorpBeforeCarrybackGrp/CorpCommonCarrybackGrp/PersonalHoldingCompanyTaxAmt"/>
										</xsl:call-template>
									</span>
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/CorpCarrybackDecreaseTxCmptGrp[$pos + 3]/CorpBeforeCarrybackGrp/CorpCommonCarrybackGrp/PersonalHoldingCompanyTaxAmt"/>
									</xsl:call-template>
								</div>
								<div class="sty1139AmtBoxEx">
									<span style="float:left;">
										<xsl:call-template name="SetFormLinkInline">
											<xsl:with-param name="TargetNode" select="$FormData/CorpCarrybackDecreaseTxCmptGrp[$pos + 3]/CorpAfterCarrybackGrp/CorpCommonCarrybackGrp/PersonalHoldingCompanyTaxAmt"/>
										</xsl:call-template>
									</span>
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/CorpCarrybackDecreaseTxCmptGrp[$pos + 3]/CorpAfterCarrybackGrp/CorpCommonCarrybackGrp/PersonalHoldingCompanyTaxAmt"/>
									</xsl:call-template>
								</div>
								<div class="sty1139AmtBoxEx">
									<span style="float:left;">
										<xsl:call-template name="SetFormLinkInline">
											<xsl:with-param name="TargetNode" select="$FormData/CorpCarrybackDecreaseTxCmptGrp[$pos + 4]/CorpBeforeCarrybackGrp/CorpCommonCarrybackGrp/PersonalHoldingCompanyTaxAmt"/>
										</xsl:call-template>
									</span>
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/CorpCarrybackDecreaseTxCmptGrp[$pos + 4]/CorpBeforeCarrybackGrp/CorpCommonCarrybackGrp/PersonalHoldingCompanyTaxAmt"/>
									</xsl:call-template>
								</div>
								<div class="sty1139AmtBoxEx">
									<span style="float:left;">
										<xsl:call-template name="SetFormLinkInline">
											<xsl:with-param name="TargetNode" select="$FormData/CorpCarrybackDecreaseTxCmptGrp[$pos + 4]/CorpAfterCarrybackGrp/CorpCommonCarrybackGrp/PersonalHoldingCompanyTaxAmt"/>
										</xsl:call-template>
									</span>
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/CorpCarrybackDecreaseTxCmptGrp[$pos + 4]/CorpAfterCarrybackGrp/CorpCommonCarrybackGrp/PersonalHoldingCompanyTaxAmt"/>
									</xsl:call-template>
								</div>
								<div class="sty1139AmtBoxEx">
									<span style="float:left;">
										<xsl:call-template name="SetFormLinkInline">
											<xsl:with-param name="TargetNode" select="$FormData/CorpCarrybackDecreaseTxCmptGrp[$pos + 5]/CorpBeforeCarrybackGrp/CorpCommonCarrybackGrp/PersonalHoldingCompanyTaxAmt"/>
										</xsl:call-template>
									</span>
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/CorpCarrybackDecreaseTxCmptGrp[$pos + 5]/CorpBeforeCarrybackGrp/CorpCommonCarrybackGrp/PersonalHoldingCompanyTaxAmt"/>
									</xsl:call-template>
								</div>
								<div class="sty1139AmtBoxEx">
									<span style="float:left;">
										<xsl:call-template name="SetFormLinkInline">
											<xsl:with-param name="TargetNode" select="$FormData/CorpCarrybackDecreaseTxCmptGrp[$pos + 5]/CorpAfterCarrybackGrp/CorpCommonCarrybackGrp/PersonalHoldingCompanyTaxAmt"/>
										</xsl:call-template>
									</span>
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/CorpCarrybackDecreaseTxCmptGrp[$pos + 5]/CorpAfterCarrybackGrp/CorpCommonCarrybackGrp/PersonalHoldingCompanyTaxAmt"/>
									</xsl:call-template>
								</div>
							</div>
							<!-- Line 25 -->
							<div class="styStdDiv">
								<div class="styLNLeftNumBox">25</div>
								<div class="sty1139AmtBoxEx">
									<span style="float:left;">
										<xsl:call-template name="SetFormLinkInline">
											<xsl:with-param name="TargetNode" select="$FormData/CorpCarrybackDecreaseTxCmptGrp[$pos + 3]/CorpBeforeCarrybackGrp/CorpCommonCarrybackGrp/OtherTaxesAmt"/>
										</xsl:call-template>
									</span>
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/CorpCarrybackDecreaseTxCmptGrp[$pos + 3]/CorpBeforeCarrybackGrp/CorpCommonCarrybackGrp/OtherTaxesAmt"/>
									</xsl:call-template>
								</div>
								<div class="sty1139AmtBoxEx">
									<span style="float:left;">
										<xsl:call-template name="SetFormLinkInline">
											<xsl:with-param name="TargetNode" select="$FormData/CorpCarrybackDecreaseTxCmptGrp[$pos + 3]/CorpAfterCarrybackGrp/CorpCommonCarrybackGrp/OtherTaxesAmt"/>
										</xsl:call-template>
									</span>
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/CorpCarrybackDecreaseTxCmptGrp[$pos + 3]/CorpAfterCarrybackGrp/CorpCommonCarrybackGrp/OtherTaxesAmt"/>
									</xsl:call-template>
								</div>
								<div class="sty1139AmtBoxEx">
									<span style="float:left;">
										<xsl:call-template name="SetFormLinkInline">
											<xsl:with-param name="TargetNode" select="$FormData/CorpCarrybackDecreaseTxCmptGrp[$pos + 4]/CorpBeforeCarrybackGrp/CorpCommonCarrybackGrp/OtherTaxesAmt"/>
										</xsl:call-template>
									</span>
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/CorpCarrybackDecreaseTxCmptGrp[$pos + 4]/CorpBeforeCarrybackGrp/CorpCommonCarrybackGrp/OtherTaxesAmt"/>
									</xsl:call-template>
								</div>
								<div class="sty1139AmtBoxEx">
									<span style="float:left;">
										<xsl:call-template name="SetFormLinkInline">
											<xsl:with-param name="TargetNode" select="$FormData/CorpCarrybackDecreaseTxCmptGrp[$pos + 4]/CorpAfterCarrybackGrp/CorpCommonCarrybackGrp/OtherTaxesAmt"/>
										</xsl:call-template>
									</span>
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/CorpCarrybackDecreaseTxCmptGrp[$pos + 4]/CorpAfterCarrybackGrp/CorpCommonCarrybackGrp/OtherTaxesAmt"/>
									</xsl:call-template>
								</div>
								<div class="sty1139AmtBoxEx">
									<span style="float:left;">
										<xsl:call-template name="SetFormLinkInline">
											<xsl:with-param name="TargetNode" select="$FormData/CorpCarrybackDecreaseTxCmptGrp[$pos + 5]/CorpBeforeCarrybackGrp/CorpCommonCarrybackGrp/OtherTaxesAmt"/>
										</xsl:call-template>
									</span>
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/CorpCarrybackDecreaseTxCmptGrp[$pos + 5]/CorpBeforeCarrybackGrp/CorpCommonCarrybackGrp/OtherTaxesAmt"/>
									</xsl:call-template>
								</div>
								<div class="sty1139AmtBoxEx">
									<span style="float:left;">
										<xsl:call-template name="SetFormLinkInline">
											<xsl:with-param name="TargetNode" select="$FormData/CorpCarrybackDecreaseTxCmptGrp[$pos + 5]/CorpAfterCarrybackGrp/CorpCommonCarrybackGrp/OtherTaxesAmt"/>
										</xsl:call-template>
									</span>
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/CorpCarrybackDecreaseTxCmptGrp[$pos + 5]/CorpAfterCarrybackGrp/CorpCommonCarrybackGrp/OtherTaxesAmt"/>
									</xsl:call-template>
								</div>
							</div>
							<!-- Line 26 -->
							<div class="styStdDiv">
								<div class="styLNLeftNumBox">26</div>
								<div class="sty1139AmtBoxEx">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/CorpCarrybackDecreaseTxCmptGrp[$pos + 3]/CorpBeforeCarrybackGrp/CorpCommonCarrybackGrp/TotalTaxLiabilityAmt"/>
									</xsl:call-template>
								</div>
								<div class="sty1139AmtBoxEx">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/CorpCarrybackDecreaseTxCmptGrp[$pos + 3]/CorpAfterCarrybackGrp/CorpCommonCarrybackGrp/TotalTaxLiabilityAmt"/>
									</xsl:call-template>
								</div>
								<div class="sty1139AmtBoxEx">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/CorpCarrybackDecreaseTxCmptGrp[$pos + 4]/CorpBeforeCarrybackGrp/CorpCommonCarrybackGrp/TotalTaxLiabilityAmt"/>
									</xsl:call-template>
								</div>
								<div class="sty1139AmtBoxEx">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/CorpCarrybackDecreaseTxCmptGrp[$pos + 4]/CorpAfterCarrybackGrp/CorpCommonCarrybackGrp/TotalTaxLiabilityAmt"/>
									</xsl:call-template>
								</div>
								<div class="sty1139AmtBoxEx">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/CorpCarrybackDecreaseTxCmptGrp[$pos + 5]/CorpBeforeCarrybackGrp/CorpCommonCarrybackGrp/TotalTaxLiabilityAmt"/>
									</xsl:call-template>
								</div>
								<div class="sty1139AmtBoxEx">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/CorpCarrybackDecreaseTxCmptGrp[$pos + 5]/CorpAfterCarrybackGrp/CorpCommonCarrybackGrp/TotalTaxLiabilityAmt"/>
									</xsl:call-template>
								</div>
							</div>
							<!-- Line 27 -->
							<div class="styStdDiv">
								<div class="styLNLeftNumBox">27</div>
								<div class="sty1139AmtBoxEx">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/CorpCarrybackDecreaseTxCmptGrp[$pos + 3]/CorpAfterCarrybackGrp/CorpCommonCarrybackGrp/TotalTaxLiabilityAmt"/>
									</xsl:call-template>
								</div>
								<div class="sty1139AmtBoxEx" style="background-color:lightgrey;">&nbsp;</div>
								<div class="sty1139AmtBoxEx">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/CorpCarrybackDecreaseTxCmptGrp[$pos + 4]/CorpAfterCarrybackGrp/CorpCommonCarrybackGrp/TotalTaxLiabilityAmt"/>
									</xsl:call-template>
								</div>
								<div class="sty1139AmtBoxEx" style="background-color:lightgrey;">&nbsp;</div>
								<div class="sty1139AmtBoxEx">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/CorpCarrybackDecreaseTxCmptGrp[$pos + 5]/CorpAfterCarrybackGrp/CorpCommonCarrybackGrp/TotalTaxLiabilityAmt"/>
									</xsl:call-template>
								</div>
								<div class="sty1139AmtBoxEx" style="background-color:lightgrey;">&nbsp;</div>
							</div>
							<!-- Line 28 -->
							<div class="styStdDiv">
								<div class="styLNLeftNumBox">28</div>
								<div class="sty1139AmtBoxEx">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/CorpCarrybackDecreaseTxCmptGrp[$pos + 3]/CorpBeforeCarrybackGrp/TaxDecreaseAmt"/>
									</xsl:call-template>
								</div>
								<div class="sty1139AmtBoxEx" style="background-color:lightgrey;">&nbsp;</div>
								<div class="sty1139AmtBoxEx">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/CorpCarrybackDecreaseTxCmptGrp[$pos + 4]/CorpBeforeCarrybackGrp/TaxDecreaseAmt"/>
									</xsl:call-template>
								</div>
								<div class="sty1139AmtBoxEx" style="background-color:lightgrey;">&nbsp;</div>
								<div class="sty1139AmtBoxEx">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/CorpCarrybackDecreaseTxCmptGrp[$pos + 5]/CorpBeforeCarrybackGrp/TaxDecreaseAmt"/>
									</xsl:call-template>
								</div>
								<div class="sty1139AmtBoxEx" style="background-color:lightgrey;">&nbsp;</div>
							</div>
						</xsl:if>
					</xsl:for-each>
					<div class="styStdDiv pageEnd">&nbsp;</div>
				</xsl:if>
				<!--Begin ADDITIONAL DATA SECTION -->
				<div style="width:187mm;clear:both;">
					<div class="styLeftOverTitleLine" id="LeftoverData">
						<br/>
						<div class="styLeftOverTitle">
						Additional Data        
					</div>
						<div class="styLeftOverButtonContainer">
							<input class="styLeftoverTableBtn" TabIndex="1" type="button" value="Return to Form" onclick="javascript:returnToWriteInImage();"/>
						</div>
					</div>
				</div>
				<table class="styLeftOverTbl">
					<xsl:call-template name="PopulateCommonLeftover">
						<xsl:with-param name="TargetNode" select="$FormData"/>
						<xsl:with-param name="DescWidth" select="100"/>
					</xsl:call-template>
					<xsl:call-template name="PopulateLeftoverRow">
						<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/InCareOfNm"/>
						<xsl:with-param name="Desc">Part I, Line 1 - In Care Of Name</xsl:with-param>
					</xsl:call-template>
				</table>
				<br/>
			</body>
		</html>
	</xsl:template>
</xsl:stylesheet>