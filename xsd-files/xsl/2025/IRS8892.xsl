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
	<xsl:include href="IRS8892Style.xsl"/>
	<xsl:output method="html" indent="yes"/>
	<xsl:strip-space elements="*"/>
	<xsl:param name="FormData" select="$RtnDoc/IRS8892"/>
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
				<meta name="Description" content="IRS Form 8892"/>
				<!-- javascript include -->
				<script language="JavaScript" src="{$ScriptPath}/FormDisplay.js" type="text/javascript"/>
				<xsl:call-template name="InitJS"/>
				<style type="text/css">
					<xsl:if test="not($Print) or $Print=''">
						<xsl:call-template name="IRS8892Style"/>
						<xsl:call-template name="AddOnStyle"/>
					</xsl:if>
				</style>
				<xsl:call-template name="GlobalStylesForm"/>
			</head>
			<body class="styBodyClass" style="width:187mm;">
				<xsl:call-template name="DocumentHeader"/>
				<!-- BEGIN FORM HEADER -->
				<div class="styStdDiv">
					<div class="styFNBox" style="width:30mm;height:18.5mm;">
						Form <span class="styFormNumber">8892</span>
						<xsl:call-template name="SetFormLinkInline">
							<xsl:with-param name="TargetNode" select="$FormData"/>
						</xsl:call-template><br />
						(Rev. December 2024)
						<span class="styAgency">Department of the Treasury</span>
						<span class="styAgency">Internal Revenue Service</span>
					</div>
					<div class="styFTBox" style="width:126mm;height:18.5mm;padding-top:0.5mm;">
						<span class="styMainTitle" style="font-size:11pt;">Application for Automatic Extension of Time To File <br /> Form 709 or Form 709-NA and/or Payment of <br /> Gift/Generation-Skipping Transfer Tax</span>
						<div class="styFST" style="padding-top:0.5mm;">
							Go to <span style="font-style:italic;">www.irs.gov/Form8892</span> for instructions and the latest information.
						</div>
					</div>
					<div class="styTYBox" style="width:30mm;height:18.5mm;padding-top:6mm;">
						OMB No. 1545-1913
					</div>
				</div>
				<div class="styStdDiv" style="font-weight:bold;padding:0.5mm 0mm;border-top:2px solid black;">
					For calendar year
					<span style="width:26mm;border-bottom:1px dashed black;text-align:center;">
						<xsl:call-template name="PopulateReturnHeaderTaxYear"/>
					</span>, or other tax year beginning
					<span style="width:28mm;border-bottom:1px dashed black;text-align:center;">
						<xsl:call-template name="PopulateReturnHeaderTaxPeriodBeginDate"/>
					</span>, and ending 
					<span style="width:28mm;border-bottom:1px dashed black;text-align:center;">
						<xsl:call-template name="PopulateReturnHeaderTaxPeriodEndDate"/>
					</span> .
				</div>
				<div class="styStdDiv" style="vertical-align:center;padding:1mm 0px;">
					<span style="font-weight:bold;font-style:italic;font-size:12pt;">Before you begin: </span>
					Be sure that you have read the chart below to see if you must use Form 8892.
				</div>
				<div class="styStdDiv">
					<table style="font-size:7pt;border-collapse:collapse;border:1px solid black;width:187mm;">
						<thead>
							<tr style="border:1px solid black;">
								<th class="sty8892TablePad" scope="col">IF you...</th>
								<th class="sty8892TablePad" style="border:1px solid black;" scope="col">AND you...</th>
								<th class="sty8892TablePad" scope="col">THEN...</th>
							</tr>
						</thead>
						<tbody>
							<tr style="border:1px solid black;">
								<td class="sty8892TablePad">file Form 4868 or Form 2350</td>
								<td class="sty8892TablePad" style="border:1px solid black;">do not expect to owe gift or GST tax</td>
								<td class="sty8892TablePad">do not use Form 8892.</td>
							</tr>
							<tr style="border:1px solid black;">
								<td class="sty8892TablePad">file Form 4868 or Form 2350</td>
								<td class="sty8892TablePad" style="border:1px solid black;">expect to owe gift or GST tax</td>
								<td class="sty8892TablePad">use Form 8892-V, Payment Voucher, <br />(below) to pay gift or GST tax.</td>
							</tr>
							<tr style="border:1px solid black;">
								<td class="sty8892TablePad">need to extend the time to file <br /> Form 709 or Form 709-NA</td>
								<td class="sty8892TablePad" style="border:1px solid black;">are not requesting an extension for <br /> your individual income tax return</td>
								<td class="sty8892TablePad">use Form 8892 and Form 8892-V, if <br /> applicable. See instructions.</td>
							</tr>
						</tbody>
					</table>
				</div>
				<div class="styStdDiv" style="border-top:1px solid black;">
					<div class="styPartName">Part I</div>
					<div class="styPartDesc">Identification</div>
				</div>
				<div class="styStdDiv" style="border-top:1px solid black;">
					<div class="styGenericDiv" style="width:14.8mm;font-weight:bold;padding-top:12mm;text-align:center;font-size:10pt;">Type or print</div>
					<div class="styGenericDiv" style="width:172mm;height:auto;border-left:1px solid black;">
						<div class="styNameBox" style="width:46%;font-size:7pt;">
							<span class="sty8892HeaderNum">1</span>
							First name and initial <br/>
							<xsl:call-template name="PopulateReturnHeaderFiler">
								<xsl:with-param name="TargetNode">BusinessNameLine1Txt</xsl:with-param>
							</xsl:call-template>
							<xsl:call-template name="LinkToLeftoverDataTableInline">
								<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/InCareOfNm"/>
								<xsl:with-param name="Desc">Part I, Line 1 - In Care Of Name</xsl:with-param>
							</xsl:call-template>
							<xsl:call-template name="LinkToLeftoverDataTableInline">
								<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/PrimaryNameControlTxt"/>
								<xsl:with-param name="Desc">Part I, Line 1 - Primary Name Control</xsl:with-param>
							</xsl:call-template>
						</div>
						<div class="styNameBox" style="width:25%;font-size:7pt;">
							<span class="sty8892HeaderNum">2</span>
							Last name<br/> &nbsp;
						</div>
						<div class="styEINBox" style="width:29%;text-align:left;font-size:7pt;font-weight:normal;">
							<span class="sty8892HeaderNum">3</span>
							<span style="font-family:Arial;display:inline;">Donor's U.S. taxpayer identification number (see instructions)</span>
							<br/>
							<span style="font-weight:normal;">
								<xsl:call-template name="PopulateReturnHeaderFilerTIN">
									<xsl:with-param name="EINChanged" select="true()"/>
								</xsl:call-template>
							</span>
						</div>
						<div class="styNameBox" style="width:80%;font-size:7pt;border-top:1px solid black;">
							<span class="sty8892HeaderNum" style="height:8mm;padding-left:1mm;">4a</span>
							Address (number and street). If you have a P.O. box, see instructions. <br/>
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
						<div class="styEINBox" style="width:20%;text-align:left;font-size:7pt;font-weight:normal;border-top:1px solid black;">
							<span class="sty8892HeaderNum" style="padding-left:1mm;">4b</span>
							<span style="font-family:Arial;">Apt. No.</span>
							<br/>&nbsp;
						</div>
						<div class="styNameBox" style="width:40%;font-size:7pt;border-top:1px solid black;">
							<span class="sty8892HeaderNum">5</span>
							<span style="font-family:Arial;">City, town or post office.</span> <br/>
							<xsl:call-template name="PopulateReturnHeaderFiler">
								<xsl:with-param name="TargetNode">CityNm</xsl:with-param>
							</xsl:call-template>
						</div>
						<div class="styNameBox" style="width:30%;font-size:7pt;padding-left:0.5mm;border-top:1px solid black;">
							<span class="sty8892HeaderNum">6</span>
							State<br/>
							<xsl:call-template name="PopulateReturnHeaderFiler">
								<xsl:with-param name="TargetNode">StateAbbreviationCd</xsl:with-param>
							</xsl:call-template>
						</div>
						<div class="styEINBox" style="width:30%;padding-left:1mm;text-align:left;font-size:7pt;font-weight:normal;border-top:1px solid black;word-break:break-all;">
							<span class="sty8892HeaderNum">7</span>
							ZIP Code<br/>
							<xsl:call-template name="PopulateReturnHeaderFiler">
								<xsl:with-param name="TargetNode">ZIPCd</xsl:with-param>
							</xsl:call-template>
						</div>
						<div class="styNameBox" style="width:40%;font-size:7pt;border-top:1px solid black;">
							<span class="sty8892HeaderNum">8</span>
							Foreign country name <br/>
							<xsl:call-template name="PopulateReturnHeaderFiler">
								<xsl:with-param name="TargetNode">CountryCd</xsl:with-param>
								<xsl:with-param name="MainForm" select="true()"/>
							</xsl:call-template>
						</div>
						<div class="styNameBox" style="width:30%;font-size:7pt;padding-left:0.5mm;border-top:1px solid black;">
							<span class="sty8892HeaderNum">9</span>
							Foreign province/state/county<br/>
							<xsl:call-template name="PopulateReturnHeaderFiler">
								<xsl:with-param name="TargetNode">ProvinceOrStateNm</xsl:with-param>
							</xsl:call-template>
						</div>
						<div class="styEINBox" style="width:30%;text-align:left;font-size:7pt;font-weight:normal;border-top:1px solid black;word-break:break-all;">
							<span class="sty8892HeaderNum" style="padding-left:1mm;">10</span>
							Foreign postal code
							<br/>
							<xsl:call-template name="PopulateReturnHeaderFiler">
								<xsl:with-param name="TargetNode">ForeignPostalCd</xsl:with-param>
							</xsl:call-template>
						</div>
					</div>
				</div>
				<!-- Part II -->
				<div class="styStdDiv" style="border-top:1px solid black;border-bottom:1px solid black;">
					<span class="styPartName" style="width:16mm;">Part II</span>
					<span class="styPartDesc" style="width:170mm;height:auto;">
						Automatic Extension of Time To File Form 709 or Form 709-NA (Section 6081)
					</span>
				</div>
				<!-- Part 2, Line 1 -->
				<div class="styStdDiv" style="padding-top:0.5mm;">
					If you are applying for an automatic 6-month extension of time to file Form 709 or Form 709-NA but are not applying for an extension <br />
					of time to file your individual income tax return, check here. See instructions
					<span class="sty8892DotLn">..............</span>
					<input type="checkbox" class="styCkboxNM" style="" aria-label="Form 709 Auto Extension">
						<xsl:call-template name="PopulateCheckbox">
							<xsl:with-param name="TargetNode" select="$FormData/AutoExtensionToFile709Ind"/>
							<xsl:with-param name="BackupName">IRS8892/AutoExtensionToFile709Ind</xsl:with-param>
						</xsl:call-template>
					</input>
					709 
					<input type="checkbox" class="styCkboxNM" style="margin-left:4mm;" aria-label="Form 709-NA Auto Extension">
						<xsl:call-template name="PopulateCheckbox">
							<xsl:with-param name="TargetNode" select="$FormData/AutoExtensionToFile709NAInd"/>
							<xsl:with-param name="BackupName">IRS8892/AutoExtensionToFile709NAInd</xsl:with-param>
						</xsl:call-template>
					</input>
					709-NA 
				</div>
				<div class="styStdDiv" style="margin-top:4mm;border-bottom:1px solid black;padding-bottom:3mm;">
					For either box checked, if the donor died during the year, enter the date of death (mo., day, year) 
					<span style="width:45mm;min-height:3mm;border-bottom:1px dashed black;text-align:center;">
						<xsl:call-template name="PopulateMonthDayYear">
							<xsl:with-param name="TargetNode" select="$FormData/DonorDeathDt"/>
						</xsl:call-template>
					</span> .
				</div>
				<div class="styStdDiv" style="margin-top:10mm;border-bottom:1px dashed black;margin-bottom:3mm;text-align:center;font-weight:bold;">
					Detach Here and Mail With Your Payment
				</div>
				<div class="styStdDiv">
					<div class="styFNBox" style="width:30mm;height:16.5mm;">
						Form <span class="styFormNumber" style="font-size:16pt;">8892-V</span><br />
						(Rev. December 2024)
						<span class="styAgency">Department of the Treasury</span>
						<span class="styAgency">Internal Revenue Service</span>
					</div>
					<div class="styFTBox" style="width:126mm;height:16.5mm;padding-top:0.5mm;">
						<span class="styMainTitle" style="font-size:14pt;margin-top:2.5mm;margin-bottom:2.5mm;">Payment Voucher</span>
						<div class="styFST" style="padding-top:0.5mm;">
							Use this voucher when making a payment of gift and/or GST tax.
						</div>
					</div>
					<div class="styTYBox" style="width:30mm;height:16.5mm;padding-top:6mm;">
						OMB No. 1545-1913
					</div>
				</div>
				<div class="styStdDiv" style="border-top:1px solid black;">
					<span class="styPartName">Part III</span>
					<span class="styPartDesc">Payment of Gift (and/or Generation-Skipping Transfer) Tax</span>
				</div>
				<div class="styStdDiv" style="border-top:1px solid black;">
					<div class="styNameBox" style="width:26.7mm;font-size:7pt;">
						<span class="sty8892HeaderNum" style="height:4mm;">1</span>
						Tax year <br/><br />
						<span style="width:100%;text-align:center;">
							<xsl:call-template name="PopulateYear">
								<xsl:with-param name="TargetNode" select="$FormData/GiftGSTTaxPaymentGrp/TaxYr"/>
							</xsl:call-template>
						</span>
					</div>
					<div class="styNameBox" style="width:40mm;font-size:7pt;">
						<span class="sty8892HeaderNum" style="height:4mm;">2</span>
						Amount of gift tax paid from Form 709<br/> 
						$<span style="width:90%;text-align:right;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/GiftGSTTaxPaymentGrp/GiftTaxPaidFrom709Amt"/>
							</xsl:call-template>
						</span>
					</div>
					<div class="styNameBox" style="width:40mm;font-size:7pt;">
						<span class="sty8892HeaderNum" style="height:4mm;">3</span>
						Amount of gift tax paid from Form 709-NA<br/> 
						$<span style="width:90%;text-align:right;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/GiftGSTTaxPaymentGrp/GiftTaxPaidFrom709NAAmt"/>
							</xsl:call-template>
						</span>
					</div>
					<div class="styNameBox" style="width:40mm;font-size:7pt;">
						<span class="sty8892HeaderNum" style="height:4mm;">3</span>
						Amount of GST tax paid from Form 709<br/> 
						$<span style="width:90%;text-align:right;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/GiftGSTTaxPaymentGrp/GiftTaxPaidFrom709Amt"/>
							</xsl:call-template>
						</span>
					</div>
					<div class="styNameBox" style="width:40mm;font-size:7pt;border-right:none;">
						<span class="sty8892HeaderNum" style="height:4mm;">4</span>
						Amount of GST tax paid from Form 709-NA<br/> 
						$<span style="width:90%;text-align:right;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/GiftGSTTaxPaymentGrp/GiftTaxPaidFrom709Amt"/>
							</xsl:call-template>
						</span>
					</div>
				</div>
				<div class="styStdDiv" style="border-top:1px solid black;">
					<div class="styGenericDiv" style="width:20mm;font-weight:bold;padding:7mm 1mm 0px 3.5mm;">Complete if you file Part III only. (Type or print)</div>
					<div class="styGenericDiv" style="width:166.8mm;height:auto;border-left:1px solid black;">
						<div class="styNameBox" style="width:45%;font-size:7pt;">
							<span class="sty8892HeaderNum">6</span>
							First name and initial <br/>
							<br /><br />&nbsp;
						</div>
						<div class="styNameBox" style="width:25%;font-size:7pt;">
							<span class="sty8892HeaderNum">7</span>
							Last name<br/><br /><br /> &nbsp;
						</div>
						<div class="styEINBox" style="width:29.9%;text-align:left;font-size:7pt;font-weight:normal;">
							<span class="sty8892HeaderNum">8</span>
							<span style="font-family:Arial;display:inline;">Donor's U.S. taxpayer identification number (see instructions)</span>
							<br/>&nbsp;
						</div>
						<div class="styNameBox" style="width:70%;font-size:7pt;border-top:1px solid black;">
							<span class="sty8892HeaderNum" style="height:8mm;padding-left:1mm;">9a</span>
							Street address (or P.O. box if mail is not delivered to street address) 
							<br/><br /><br />&nbsp;						
						</div>
						<div class="styEINBox" style="width:30%;text-align:left;font-size:7pt;font-weight:normal;border-top:1px solid black;">
							<span class="sty8892HeaderNum" style="padding-left:1mm;">9b</span>
							<span style="font-family:Arial;">Apt. No.</span>
							<br/>&nbsp;
						</div>
						<div class="styNameBox" style="width:100%;font-size:7pt;border-top:1px solid black;border-right:none;">
							<span class="sty8892HeaderNum" style="padding-left:1mm;">10</span>
							<span style="font-family:Arial;">City or town, state or province, country, and ZIP or foreign postal code</span> 
							<br/><br /><br />&nbsp;
						</div>
					</div>
				</div>
				<!-- Page 1 Break and Footer-->
				<div class="pageEnd" style="width:187mm;border-top:1px solid black;">
					<span class="styBoldText">For Privacy Act and Paperwork Reduction Act Notice, see instructions. </span>
					<span style="width:12mm;"/>Cat. No. 37700N
					<span style="float:right;">
						Form <span class="styBoldText" style="font-size:8pt;">8892</span> (Rev. 12-2024)
					</span>
				</div>
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
					<xsl:call-template name="PopulateLeftoverRow">
						<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/PrimaryNameControlTxt"/>
						<xsl:with-param name="Desc">Part I, Line 1 - Primary Name Control</xsl:with-param>
					</xsl:call-template>
				</table>
				<br/>
			</body>
		</html>
	</xsl:template>
</xsl:stylesheet>