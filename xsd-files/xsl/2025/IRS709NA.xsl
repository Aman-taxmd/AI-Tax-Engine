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
	<xsl:include href="IRS709NAStyle.xsl"/>
	<xsl:output method="html" indent="yes"/>
	<xsl:strip-space elements="*"/>
	<xsl:param name="FormData" select="$RtnDoc/IRS709NA"/>
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
				<meta name="Description" content="IRS Form 709-NA"/>
				<!-- javascript include -->
				<script language="JavaScript" src="{$ScriptPath}/FormDisplay.js" type="text/javascript"/>
				<xsl:call-template name="InitJS"/>
				<style type="text/css">
					<xsl:if test="not($Print) or $Print=''">
						<xsl:call-template name="IRS709NAStyle"/>
						<xsl:call-template name="AddOnStyle"/>
					</xsl:if>
				</style>
				<xsl:call-template name="GlobalStylesForm"/>
			</head>
			<body class="styBodyClass" style="width:187mm;">
				<xsl:call-template name="DocumentHeader"/>
				<!-- BEGIN FORM HEADER -->
				<div class="styStdDiv">
					<div class="styFNBox" style="width:29mm;height:18mm;">
						Form <span class="styFormNumber" style="font-family:Arial Narrow;">709-NA</span><br/>
						<xsl:call-template name="SetFormLinkInline">
							<xsl:with-param name="TargetNode" select="$FormData"/>
						</xsl:call-template>
						
						<br />
						<span class="styAgency">Department of the Treasury</span>
						<span class="styAgency">Internal Revenue Service</span>
					</div>
					<div class="styFTBox" style="width:127mm;height:18mm;padding-top:0.5mm;">
						<span class="styMainTitle" style="font-size:11pt;">
							United States Gift (and Generation-Skipping Transfer) Tax Return <br /> 
							of Nonresident Not a Citizen of the United States
						</span>
						<div class="styFST" style="padding-top:1.5mm;">
							Go to <span style="font-style:italic;">www.irs.gov/Form709NA</span> for instructions and the latest information.
						</div>
						<div class="styFST" style="font-weight:normal;">(For gifts made during calendar year 2025)</div>
					</div>
					<div class="styTYBox" style="width:30mm;height:18mm;">
						<div class="styOMB" style="height:5mm;">OMB No. 1545-0092</div>
						<div class="styTY" style="height:9mm;font-size:21pt;padding-top:2mm;">
							<span>20<span class="styTYColor">25</span></span>
						</div>
					</div>
				</div>
				<div class="styStdDiv" style="border-top:1px solid black;">
					<div class="styPartDesc" style="font-size:9pt;padding-left:0px;">Part 1 &mdash; General Information</div>
				</div>
				<div class="styStdDiv" style="border-top:1px solid black;">
					<div class="styNameBox" style="width:80mm;font-size:7pt;">
						<span class="sty709NAHeaderNum">1</span>
						Donor's first name (given) and middle initial <br/>
						<xsl:call-template name="PopulateReturnHeaderFiler">
							<xsl:with-param name="TargetNode">BusinessNameLine1Txt</xsl:with-param>
						</xsl:call-template>
					</div>
					<div class="styNameBox" style="width:50mm;font-size:7pt;">
						<span class="sty709NAHeaderNum">2</span>
						Donor's last (family) name<br/> &nbsp;
					</div>
					<div class="styEINBox" style="width:57mm;text-align:left;font-size:7pt;">
						<span class="sty709NAHeaderNum">3</span>
						<span style="font-weight:normal;font-family:Arial Narrow;">Donor's U.S. taxpayer identification number (if any)</span>
						<br/>
						<span style="font-weight:normal;">
							<xsl:call-template name="PopulateReturnHeaderFilerTIN">
								<xsl:with-param name="EINChanged" select="true()"/>
							</xsl:call-template>
						</span>
					</div>
				</div>
				<div class="styStdDiv" style="border-top:1px solid black;">
					<div class="styNameBox" style="width:100%;font-size:7pt;border-right:none;">
						<span class="sty709NAHeaderNum">4</span>
						Legal residence (domicile) (see instructions) <br/>
						<xsl:call-template name="PopulateText">
							<xsl:with-param name="TargetNode" select="$FormData/LegalDomicileForeignCountryCd"/>
						</xsl:call-template>
					</div>
				</div>
				<div class="styStdDiv" style="border-top:1px solid black;">
					<div class="styNameBox" style="width:80mm;font-size:7pt;word-break:break-all;">
						<span class="sty709NAHeaderNum">5</span>
						Citizenship (see instructions) <br/>
						<xsl:call-template name="PopulateText">
							<xsl:with-param name="TargetNode" select="$FormData/CitizenCountryCd"/>
						</xsl:call-template>
					</div>
					<div class="styNameBox" style="width:50mm;font-size:7pt;">
						<span class="sty709NAHeaderNum">6</span>
						Date of birth<br/>
						<xsl:call-template name="PopulateMonthDayYear">
							<xsl:with-param name="TargetNode" select="$FormData/BirthDt"/>
						</xsl:call-template>
					</div>
					<div class="styEINBox" style="width:49mm;text-align:left;font-size:7pt;font-weight:normal;">
						<span class="sty709NAHeaderNum">7</span>
						Place of birth <br/>
						<span style="font-weight:normal;">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/BirthPlaceCountryCd"/>
							</xsl:call-template>
						</span>
					</div>
				</div>
				<div class="styStdDiv" style="border-top:1px solid black;">
					<div class="styNameBox" style="width:150mm;font-size:7pt;">
						<span class="sty709NAHeaderNum" style="height:8mm;margin-right:1mm;">8a</span>
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
					<div class="styEINBox" style="width:37mm;text-align:left;font-size:7pt;font-weight:normal;">
						<span class="sty709NAHeaderNum" style="margin-right:1mm;">8b</span>
						<span style="font-family:Arial;">Apt. No.</span>
						<br/>&nbsp;
					</div>
				</div>
				<div class="styStdDiv" style="border-top:1px solid black;">
					<div class="styNameBox" style="width:140mm;font-size:7pt;">
						<span class="sty709NAHeaderNum">9</span>
						<span style="font-family:Arial;">City, town, or post office. If you have a foreign address, also complete spaces below.</span> <br/>
						<xsl:call-template name="PopulateReturnHeaderFiler">
							<xsl:with-param name="TargetNode">CityNm</xsl:with-param>
						</xsl:call-template>
					</div>
					<div class="styNameBox" style="width:20mm;font-size:7pt;padding-left:0.5mm;">
						<span class="sty709NAHeaderNum" style="padding-left:1mm;">10</span>
						State<br/>
						<xsl:call-template name="PopulateReturnHeaderFiler">
							<xsl:with-param name="TargetNode">StateAbbreviationCd</xsl:with-param>
						</xsl:call-template>
					</div>
					<div class="styEINBox" style="width:25mm;padding-left:1mm;text-align:left;font-size:7pt;font-weight:normal;word-break:break-all;">
						<span class="sty709NAHeaderNum" style="padding-left:1mm;">11</span>
						ZIP Code<br/>
						<xsl:call-template name="PopulateReturnHeaderFiler">
							<xsl:with-param name="TargetNode">ZIPCd</xsl:with-param>
						</xsl:call-template>
					</div>
				</div>
				<div class="styStdDiv" style="border-top:1px solid black;">
					<div class="styNameBox" style="width:89mm;font-size:7pt;">
						<span class="sty709NAHeaderNum" style="padding-left:1mm;">12</span>
						Foreign country name <br/>
						<xsl:call-template name="PopulateReturnHeaderFiler">
							<xsl:with-param name="TargetNode">CountryCd</xsl:with-param>
							<xsl:with-param name="MainForm" select="true()"/>
						</xsl:call-template>
					</div>
					<div class="styNameBox" style="width:49mm;font-size:7pt;padding-left:0.5mm;">
						<span class="sty709NAHeaderNum" style="padding-left:1mm;">13</span>
						Foreign province/state/county<br/>
						<xsl:call-template name="PopulateReturnHeaderFiler">
							<xsl:with-param name="TargetNode">ProvinceOrStateNm</xsl:with-param>
						</xsl:call-template>
					</div>
					<div class="styEINBox" style="width:49mm;text-align:left;font-size:7pt;font-weight:normal;word-break:break-all;">
						<span class="sty709NAHeaderNum" style="padding-left:1mm;">14</span>
						Foreign postal code
						<br/>
						<xsl:call-template name="PopulateReturnHeaderFiler">
							<xsl:with-param name="TargetNode">ForeignPostalCd</xsl:with-param>
						</xsl:call-template>
					</div>
				</div>
				<div class="styStdDiv" style="border-top:1px solid black;">
					<!--15 Telephone number-->
					<div class="styNameBox" style="width:55mm;font-size:7pt;">
						<span class="sty709NAHeaderNum" style="padding-left:1mm;">15</span>
						Telephone number <br/>
						<xsl:choose>
							<xsl:when test="$RtnHdrData/Filer/ForeignPhoneNum">
								<xsl:call-template name="PopulateReturnHeaderFiler">
									<xsl:with-param name="TargetNode">ForeignPhoneNum</xsl:with-param>
								</xsl:call-template>
							</xsl:when>
							<xsl:otherwise>
								<xsl:call-template name="PopulateReturnHeaderFiler">
									<xsl:with-param name="TargetNode">Phone</xsl:with-param>
								</xsl:call-template>
							</xsl:otherwise>
						</xsl:choose>
					</div>
					<!--16 Fax Number-->
					<div class="styNameBox" style="width:49mm;font-size:7pt;padding-left:0.5mm;">
						<span class="sty709NAHeaderNum" style="padding-left:1mm;">16</span>
						Fax number<br/>
						<xsl:call-template name="PopulateReturnHeaderFiler">
							<xsl:with-param name="TargetNode">FaxNum</xsl:with-param>
						</xsl:call-template>
					</div>
					<!--17 Email Address-->
					<div class="styEINBox" style="width:82mm;text-align:left;font-size:7pt;font-weight:normal;word-break:break-all;">
						<span class="sty709NAHeaderNum" style="padding-left:1mm;">17</span>
						Email address
						<br/>
						<xsl:call-template name="PopulateReturnHeaderFiler">
							<xsl:with-param name="TargetNode">EmailAddressTxt</xsl:with-param>
						</xsl:call-template>
					</div>
				</div>
				<!-- Line 18 -->
				<div class="styStdDiv" style="border-top:1px solid black;">
					<div class="styLNLeftNumBox">18</div>
					<div class="sty709NALongDesc">
						If the donor died during the year, check here 
						<input type="checkbox" class="styCkboxNM" aria-label="Donor Died">
							<xsl:call-template name="PopulateCheckbox">
								<xsl:with-param name="TargetNode" select="$FormData/DonorDeathInformationGrp/DonorDiedInd"/>
								<xsl:with-param name="BackupName">F709/DonorDiedInd</xsl:with-param>
							</xsl:call-template>
						</input>
						and enter date of death
						<span style="width:20mm;border-bottom:1px dashed black;text-align:center;">
							<xsl:call-template name="PopulateMonthDayYear">
								<xsl:with-param name="TargetNode" select="$FormData/DonorDeathInformationGrp/DonorDeathDt"/>
							</xsl:call-template>
						</span>
					</div>
				</div>
				<!-- Line 19 -->
				<div class="styStdDiv">
					<div class="styLNLeftNumBox">19</div>
					<div class="sty709NALongDesc" style="width:160mm;">
						If you extended the time to file this Form 709-NA, check here 
						<span class="sty709NADotLn" style="margin-right:3mm;">................
							<input type="checkbox" class="styCkboxNM" aria-label="Time To File Extension">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$FormData/TimeToFileExtensionInd"/>
									<xsl:with-param name="BackupName">F709/TimeToFileExtensionInd</xsl:with-param>
								</xsl:call-template>
							</input>
						</span>
					</div>
				</div>
				<!-- Line 20 -->
				<div class="styStdDiv">
					<div class="styLNLeftNumBox">20</div>
					<div class="sty709NALongDesc">
						Enter the total number of donees listed on Schedule A. Count each person only once 
						<span style="width:14mm;border-bottom:1px dashed black;text-align:center;">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/ScheduleADoneesCnt"/>
							</xsl:call-template>
						</span>
					</div>
					<div class="styLNRightNumBoxNBB" style="height:4.9mm;border-top-width:1px;">
						Yes
					</div>
					<div class="styLNRightNumBoxNBB" style="height:4.9mm;border-top-width:1px;">
						No
					</div>
				</div>
				<!-- Line 21 -->
				<div class="styStdDiv" style="border-top:1px solid black;">
					<div class="styLNLeftNumBox">21</div>
					<div class="sty709NALongDesc">
						Will you (the donor) file or have you filed Form 709 for the current year? (see instructions)
						<span class="sty709NADotLn">........</span>
					</div>
					<div class="styLNRightNumBoxNBB">
						<xsl:call-template name="PopulateYesBox">
							<xsl:with-param name="TargetNode" select="$FormData/CurrentYearForm709FilingInd"/>
						</xsl:call-template>
					</div>
					<div class="styLNRightNumBoxNBB">
						<xsl:call-template name="PopulateNoBox">
							<xsl:with-param name="TargetNode" select="$FormData/CurrentYearForm709FilingInd"/>
						</xsl:call-template>
					</div>
				</div>
				<!-- Line 22a -->
				<div class="styStdDiv" style="border-top:1px solid black;">
					<div class="styLNLeftNumBox">22a</div>
					<div class="sty709NALongDesc">
						Have you (the donor) previously filed a Form 709-NA (or 709 or 709-A) for any other year? 
						If "Yes," complete Schedule B. <br /> If "No," skip line 22b
						<span class="sty709NADotLn">................................</span>
					</div>
					<div class="styLNRightNumBox" style="height:7.4mm;"><br />
						<xsl:call-template name="PopulateYesBox">
							<xsl:with-param name="TargetNode" select="$FormData/PrevFiledReturnOtherYearInd"/>
						</xsl:call-template>
					</div>
					<div class="styLNRightNumBox" style="height:7.4mm;"><br />
						<xsl:call-template name="PopulateNoBox">
							<xsl:with-param name="TargetNode" select="$FormData/PrevFiledReturnOtherYearInd"/>
						</xsl:call-template>
					</div>
				</div>
				<!-- Line 22b -->
				<div class="styStdDiv">
					<div class="styLNLeftNumBox" style="padding-left:4.4mm;">b</div>
					<div class="sty709NALongDesc" style="font-family:Arial;">
						Has your address changed since you last filed Form 709-NA (or 709 or 709-A)? If "Yes," attach a statement listing address(es)
						<xsl:call-template name="SetFormLinkInline">
							<xsl:with-param name="TargetNode" select="$FormData/AddrChgSinceLastFiledReturnInd"/>
						</xsl:call-template>
						<span class="sty709NADotLn" style="font-family:Verdana;">....</span>
					</div>
					<div class="styLNRightNumBoxNBB" style="height:4.4mm;">
						<xsl:call-template name="PopulateYesBox">
							<xsl:with-param name="TargetNode" select="$FormData/AddrChgSinceLastFiledReturnInd"/>
						</xsl:call-template>
					</div>
					<div class="styLNRightNumBoxNBB" style="height:4.4mm;">
						<xsl:call-template name="PopulateNoBox">
							<xsl:with-param name="TargetNode" select="$FormData/AddrChgSinceLastFiledReturnInd"/>
						</xsl:call-template>
					</div>
				</div>
				<!-- Line 23a -->
				<div class="styStdDiv" style="border-top:1px solid black;">
					<div class="styLNLeftNumBox">23a</div>
					<div class="sty709NALongDesc" style="width:175mm;">
						If you are reporting items on this return based on the provisions of a gift tax treaty or protocol, check here 
						<input type="checkbox" class="styCkboxNM" aria-label="Amended Return">
							<xsl:call-template name="PopulateCheckbox">
								<xsl:with-param name="TargetNode" select="$FormData/RptGiftTaxTreatyOrProtocolInd"/>
								<xsl:with-param name="BackupName">F709/RptGiftTaxTreatyOrProtocolInd</xsl:with-param>
							</xsl:call-template>
						</input>
						and attach Form 8833
						<xsl:call-template name="SetFormLinkInline">
							<xsl:with-param name="TargetNode" select="$FormData/RptGiftTaxTreatyOrProtocolInd"/>
						</xsl:call-template>
					</div>
				</div>
				<!-- Line 23b -->
				<div class="styStdDiv">
					<div class="styLNLeftNumBox" style="padding-left:4.4mm;">b</div>
					<div class="sty709NALongDesc" style="width:179mm;">
						If an amended return, check here 
						<span class="sty709NADotLn" style="margin-right:0mm;">................................
							<input type="checkbox" class="styCkboxNM" aria-label="Amended Return">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$FormData/AmendedReturnInd"/>
									<xsl:with-param name="BackupName">F709/AmendedReturnInd</xsl:with-param>
								</xsl:call-template>
							</input>
						</span>				
					</div>
				</div>
				
				<!-- Part II Tax Computation-->
				<div class="styStdDiv" style="border-top:1px solid black;border-bottom:1px solid black;">
					<span class="styPartDesc" style="width:170mm;height:auto;font-size:9pt;padding-left:0px;">
						Part 2 &mdash; Tax Computation
					</span>
				</div>
				<!-- Part 2, Line 1 -->
				<div class="styStdDiv">
					<div class="styLNLeftNumBoxSD">1</div>
					<div class="styLNDesc">
						Enter the amount from Schedule A, Part 4, line 11
						<span class="sty709NADotLn">..................</span>
					</div>
					<div class="styLNRightNumBox">1</div>
					<div class="styLNAmountBox">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/TaxableGiftsAmt"/>
						</xsl:call-template>
					</div>
				</div>
				<!-- Part 2, Line 2 -->
				<div class="styStdDiv">
					<div class="styLNLeftNumBoxSD">2</div>
					<div class="styLNDesc">
						Enter the amount from Schedule B, line 3
						<span class="sty709NADotLn">....................</span>
					</div>
					<div class="styLNRightNumBox">2</div>
					<div class="styLNAmountBox">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/TotTaxableGiftsPriorPeriodsAmt"/>
						</xsl:call-template>
					</div>
				</div>
				<!-- Part 2, Line 3 -->
				<div class="styStdDiv">
					<div class="styLNLeftNumBoxSD">3</div>
					<div class="styLNDesc">
						Total taxable gifts. Add lines 1 and 2
						<span class="sty709NADotLn">......................</span>
					</div>
					<div class="styLNRightNumBox">3</div>
					<div class="styLNAmountBox">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/TotalTaxableGiftsAmt"/>
						</xsl:call-template>
					</div>
				</div>
				<!-- Part 2, Line 4 -->
				<div class="styStdDiv">
					<div class="styLNLeftNumBoxSD">4</div>
					<div class="styLNDesc">
						Tax computed on amount on line 3 (see <span style="font-style:italic;">Table for Computing Gift Tax</span> in instructions)
						<span class="sty709NADotLn">.......</span>
					</div>
					<div class="styLNRightNumBox">4</div>
					<div class="styLNAmountBox">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/TaxCmptTotalTaxableGiftsAmt"/>
						</xsl:call-template>
					</div>
				</div>
				<!-- Part 2, Line 5 -->
				<div class="styStdDiv">
					<div class="styLNLeftNumBoxSD">5</div>
					<div class="styLNDesc">
						Tax computed on amount on line 2 (see <span style="font-style:italic;">Table for Computing Gift Tax</span> in instructions)
						<span class="sty709NADotLn">.......</span>
					</div>
					<div class="styLNRightNumBox">5</div>
					<div class="styLNAmountBox">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/TaxCmptTotTaxableGiftsPrPrdAmt"/>
						</xsl:call-template>
					</div>
				</div>
				<!-- Part 2, Line 6 -->
				<div class="styStdDiv">
					<div class="styLNLeftNumBoxSD">6</div>
					<div class="styLNDesc">
						Balance. Subtract line 5 from line 4
						<span class="sty709NADotLn">......................</span>
					</div>
					<div class="styLNRightNumBox">6</div>
					<div class="styLNAmountBox">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/TaxableGiftsTaxBalanceAmt"/>
						</xsl:call-template>
					</div>
				</div>
				<!-- Part 2, Line 7 -->
				<div class="styStdDiv">
					<div class="styLNLeftNumBoxSD">7</div>
					<div class="styLNDesc">
						Other credits (see instructions)
						<span class="sty709NADotLn">........................</span>
					</div>
					<div class="styLNRightNumBox">7</div>
					<div class="styLNAmountBox">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/OtherCreditsAmt"/>
						</xsl:call-template>
					</div>
				</div>
				<!-- Part 2, Line 8 -->
				<div class="styStdDiv">
					<div class="styLNLeftNumBoxSD">8</div>
					<div class="styLNDesc">
						Credit for foreign gift taxes (see instructions)
						<span class="sty709NADotLn">....................</span>
					</div>
					<div class="styLNRightNumBox">8</div>
					<div class="styLNAmountBox">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/CreditForeignGiftTaxesAmt"/>
						</xsl:call-template>
					</div>
				</div>
				<!-- Part 2, Line 9 -->
				<div class="styStdDiv">
					<div class="styLNLeftNumBoxSD">9</div>
					<div class="styLNDesc">
						Total credits. Add lines 7 and 8
						<span class="sty709NADotLn">.......................</span>
					</div>
					<div class="styLNRightNumBox">9</div>
					<div class="styLNAmountBox">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/TotalCreditsAmt"/>
						</xsl:call-template>
					</div>
				</div>
				<!-- Part 2, Line 10 -->
				<div class="styStdDiv">
					<div class="styLNLeftNumBox">10</div>
					<div class="styLNDesc">
						Balance. Subtract line 9 from line 6. Do not enter less than zero
						<span class="sty709NADotLn">.............</span>
					</div>
					<div class="styLNRightNumBox">10</div>
					<div class="styLNAmountBox">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/TotalCreditBalanceAmt"/>
						</xsl:call-template>
					</div>
				</div>
				<!-- Part 2, Line 11 -->
				<div class="styStdDiv">
					<div class="styLNLeftNumBox">11</div>
					<div class="styLNDesc">
						Generation-skipping transfer taxes (from Schedule D, Part 3, col. (g), total)
						<span class="sty709NADotLn">..........</span>
					</div>
					<div class="styLNRightNumBox">11</div>
					<div class="styLNAmountBox">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/TotalGSTTaxAmt"/>
						</xsl:call-template>
					</div>
				</div>
				<!-- Part 2, Line 12 -->
				<div class="styStdDiv">
					<div class="styLNLeftNumBox">12</div>
					<div class="styLNDesc">
						Total tax. Add lines 10 and 11
						<span class="sty709NADotLn">........................</span>
					</div>
					<div class="styLNRightNumBox">12</div>
					<div class="styLNAmountBox">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/TotalTaxAmt"/>
						</xsl:call-template>
					</div>
				</div>
				<!-- Part 2, Line 13 -->
				<div class="styStdDiv">
					<div class="styLNLeftNumBox">13</div>
					<div class="styLNDesc">
						Gift and generation-skipping transfer taxes prepaid with extension of time to file
						<span class="sty709NADotLn">.........</span>
					</div>
					<div class="styLNRightNumBox">13</div>
					<div class="styLNAmountBox">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/GiftAndGSTTaxesPrepaidAmt"/>
						</xsl:call-template>
					</div>
				</div>
				
				<!-- Part 2, Line 14 -->
				<div class="styStdDiv">
					<div class="styLNLeftNumBox" style="height:6.5mm;">14</div>
					<div class="styLNDesc" style="height:6.5mm;">
						<b>Tax due.</b> If the amount on line 12 is more than the amount on line 13, subtract line 13 from line 12.<br/>
						For details on how to pay, go to <span style="font-style:italic;">www.irs.gov/Payments</span> or see the instructions 
						<span class="sty709NADotLn">.........</span>
					</div>
					<div class="styLNRightNumBox" style="height:6.5mm;padding-top:2mm;">14</div>
					<div class="styLNAmountBox" style="height:6.5mm;padding-top:3mm;">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/BalanceDueAmt"/>
						</xsl:call-template>
					</div>
				</div>
				
				<!-- Part 2, Line 15 -->
				<div class="styStdDiv">
					<div class="styLNLeftNumBox">15a</div>
					<div class="styLNDesc">
						<b>Overpayment.</b> If the amount on line 13 is more than the amount on line 12, subtract line 12 from line 13.
					</div>
					<div class="styLNRightNumBox">15a</div>
					<div class="styLNAmountBox">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/RefundAmt"/>
						</xsl:call-template>
					</div>
				</div>
				<!-- Part 2, Line 15a -->
				<div class="styStdDiv">
					<div class="styLNLeftNumBox"></div>
					<div class="styLNDesc">
						Complete lines 15b, 15c, and 15d.
					</div>
					<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;">&nbsp;</div>
					<div class="styLNAmountBoxNBB" style="background-color:lightgrey;border-left-width:0px;">&nbsp;</div>
				</div>
				
				<!-- Part 2, Line 15b -->
				<div class="styStdDiv">
					<div class="styLNLeftNumBox" style="padding-left:5mm;padding-top:1mm;">b</div>
					<div class="styLNDesc" style="height:5mm;padding-rigth:1mm;">Routing number
						<span class="styLNCtrNumBox" style="width:40mm;border-top-width:1px;float:none;height:4mm;">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/DirectDepositGrp/RoutingTransitNum"/>
							</xsl:call-template>
						</span>
						<span style="padding-left:10mm;padding-right:15mm;"> c. Type: </span>
						<input type="checkbox" class="styCkboxNM" aria-label="Checking Account">
							<xsl:call-template name="PopulateCheckbox">
								<xsl:with-param name="TargetNode" select="$FormData/DirectDepositGrp/CheckingAccountInd"/>
								<xsl:with-param name="BackupName">IRS709NACheckingAccountInd</xsl:with-param>
							</xsl:call-template>
						</input>
						<label>
							<xsl:call-template name="PopulateLabel">
								<xsl:with-param name="TargetNode" select="$FormData/DirectDepositGrp/CheckingAccountInd"/>
								<xsl:with-param name="BackupName">IRS709NACheckingAccountInd</xsl:with-param>
							</xsl:call-template>
							Checking
						</label>
						<input type="checkbox" class="styCkboxNM" aria-label="Savings Account" style="margin-left:4mm;">
							<xsl:call-template name="PopulateCheckbox">
								<xsl:with-param name="TargetNode" select="$FormData/DirectDepositGrp/SavingsAccountInd"/>
								<xsl:with-param name="BackupName">IRS709NASavingsAccountInd</xsl:with-param>
							</xsl:call-template>
						</input>
						<label>
							<xsl:call-template name="PopulateLabel">
								<xsl:with-param name="TargetNode" select="$FormData/DirectDepositGrp/SavingsAccountInd"/>
								<xsl:with-param name="BackupName">IRS709NASavingsAccountInd</xsl:with-param>
							</xsl:call-template>
							Savings
						</label>
					</div>
					<div class="styLNRightNumBox" style="height:5mm;background-color:lightgrey;border-bottom-width:0px;"></div>
					<div class="styLNAmountBox" style="height:5mm;background-color:lightgrey;border-bottom-width:0px;border-left-width:0px;">
					</div>
				</div>
				<!-- Part 2, Line 15d -->
				<div class="styStdDiv">
					<div class="styLNLeftNumBox" style="padding-left:5mm;padding-top:1mm;">d</div>
					<div class="styLNDesc" style="height:5mm;">Account number
						<span class="styLNCtrNumBox" style="width:72mm;border-top-width:1px;float:none;height:4mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/DirectDepositGrp/DepositorAccountNum"/>
							</xsl:call-template>
						</span>
					</div>
					<div class="styLNRightNumBox" style="height:5mm;background-color:lightgrey;"></div>
					<div class="styLNAmountBox" style="height:5mm;background-color:lightgrey;border-left-width:0px;">
					</div>
				</div>				
				
				<!-- Sign Here -->
				<div class="styStdIBDiv" style="border-bottom:1px solid black;border-top:1px solid black;">
					<div class="styGenericDiv" style="width:13mm;height:22.5mm;font-size:12pt;font-weight:bold;padding-top:6mm;border-right:1px solid black;">
						Sign Here
					</div>
					<div class="styGenericDiv" style="width:174mm;font-size:6pt;padding:0.5mm;padding-left:1mm;margin-bottom:2mm;">
						Under penalties of perjury, I declare that I have examined this return, including any accompanying schedules and 
						statements, and to the best of my knowledge and belief, it is true, correct, and complete. Declaration of preparer 
						(other than donor) is based on all information of which preparer has any knowledge.
					</div>
					<div class="styGenericDiv" style="width:174mm;">
						<div class="styGenericDiv" style="width:92mm;">
							<span style="width:100%;height:5mm;border-bottom:1px solid black;border-right:1px solid black;vertical-align:bottom;padding-left:1mm;">
								<xsl:call-template name="PopulatePin">
									<xsl:with-param name="TargetNode" select="$RtnHdrData/PrimarySignaturePIN" />
								</xsl:call-template>
							</span>
							<span style="padding-left:1mm;">Signature of donor</span>
						</div>
						<div class="styGenericDiv" style="width:36mm;">
							<span style="width:100%;height:5mm;border-bottom:1px solid black;padding-left:1mm;">
								<xsl:call-template name="PopulateMonthDayYear">
									<xsl:with-param name="TargetNode" select="$RtnHdrData/PrimarySignatureDt"/>
								</xsl:call-template>
							</span>
							<span style="padding-left:1mm;">Date</span>
						</div>
						<div class="styGenericDiv" style="width:40mm;border:2px solid black;font-size:6pt;margin-left:3px;padding:3px;">
						<xsl:call-template name="PopulateSpan">
							<xsl:with-param name="TargetNode" select="$RtnHdrData/DiscussWithPaidPreparerInd"/>
						</xsl:call-template>
						May the IRS discuss this return with the preparer shown below? See instructions.
						<input type="checkbox" class="styCkboxNM" style="margin-right:2px;" aria-label="Discuss with paid preparer Yes">
							<xsl:call-template name="PopulateYesCheckbox">
								<xsl:with-param name="TargetNode" select="$RtnHdrData/DiscussWithPaidPreparerInd"/>
								<xsl:with-param name="BackupName">IRS709AuthorizeThirdPartyYesCheckbox</xsl:with-param>
							</xsl:call-template>
						</input>
						<span style="font-weight:bold;">Yes</span>
						<input type="checkbox" class="styCkboxNM" style="margin-left:6px;margin-right:2px;" aria-label="Discuss with paid preparer No">
							<xsl:call-template name="PopulateNoCheckbox">
								<xsl:with-param name="TargetNode" select="$RtnHdrData/DiscussWithPaidPreparerInd"/>
								<xsl:with-param name="BackupName">IRS709AuthorizeThirdPartyNoCheckbox</xsl:with-param>
							</xsl:call-template>
						</input>
						<span style="font-weight:bold;">No</span>
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
									<xsl:call-template name="PopulateReturnHeaderPaidPreparerInformation">
                    <xsl:with-param name="TargetNode">PreparerPersonNm</xsl:with-param>
                  </xsl:call-template>
                </div>
                <div class="styLNDesc" style="height:7.5mm;width:46.5mm;padding-top:0mm;border-right:1px solid black;padding-left:1mm;">
                Preparer's signature<br/>
              </div>
                <div class="styLNDesc" style="height:7.5mm;width:15.3mm;border-right:1px solid black;padding-top:0mm;padding-left:1mm;">Date <br/>
                  <xsl:call-template name="PopulateReturnHeaderPaidPreparerInformation">
                    <xsl:with-param name="TargetNode">DateSigned</xsl:with-param>
                  </xsl:call-template>
                </div>
                <div class="styLNDesc" style="height:7.5mm;width:20mm;border-right:1px solid black;border-left:1px ;padding-top:.5mm;padding-bottom:0mm;padding-left:1mm;">
                  <label>
                    <xsl:call-template name="PopulateReturnHeaderPaidPreparerInformation">
											<xsl:with-param name="TargetNode">SelfEmployedLabel</xsl:with-param>
											<xsl:with-param name="BackupName">PreparerSelfEmployed</xsl:with-param>
										</xsl:call-template>
                    Check 
                  <input type="checkbox" class="styCkboxNM" aria-label="Self Employed Checkbox">
                      <xsl:call-template name="PopulateReturnHeaderPaidPreparerInformation">
										<xsl:with-param name="TargetNode">SelfEmployedCheckbox</xsl:with-param>
										<xsl:with-param name="BackupName">PreparerSelfEmployed</xsl:with-param>
									</xsl:call-template>
                    </input>
                    <span style="width:4px;"/>if<br/>self-employed
                  </label>
                </div>
                <div class="styLNDesc" style="height:7.5mm;width:16mm;padding-top:0mm;padding-left:1mm;">PTIN
                  <br/>
                  <xsl:call-template name="PopulateReturnHeaderPaidPreparerInformation">
										<xsl:with-param name="TargetNode">SSN</xsl:with-param>
									</xsl:call-template>
									<xsl:call-template name="PopulateReturnHeaderPaidPreparerInformation">
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
										<xsl:call-template name="PopulateReturnHeaderPaidPreparerInformation">
											<xsl:with-param name="TargetNode">BusinessNameLine1Txt</xsl:with-param>
										</xsl:call-template>
										<br/>
										<xsl:call-template name="PopulateReturnHeaderPaidPreparerInformation">
											<xsl:with-param name="TargetNode">BusinessNameLine2Txt</xsl:with-param>
										</xsl:call-template>
                  </div>
                </div>
                <div class="styLNDesc" style="height:auto;width:42mm;padding-left:1mm;border-bottom:0px solid black;">Firm's EIN
                  <span style="width:4px;"/>
                  <xsl:call-template name="PopulateReturnHeaderPaidPreparerInformation">
									<xsl:with-param name="TargetNode">PreparerFirmIDNumber</xsl:with-param>
								</xsl:call-template>
                </div>
              </div>
              <div style="width:164mm;float:left;clear:none;">
                <div class="styLNDesc" style="height:auto;width:108.5mm;border-right:1px solid black;border-left:1px solid black;padding-left:1mm;">
                  <div class="styGenericDiv" style="padding-right:2.5mm;">Firm's address</div>
                  <div class="styGenericDiv" style="padding-right:.5mm;">
                    <xsl:call-template name="PopulateReturnHeaderPaidPreparerInformation">
											<xsl:with-param name="TargetNode">AddressLine1Txt</xsl:with-param>
										</xsl:call-template>
										<br/>
										<xsl:call-template name="PopulateReturnHeaderPaidPreparerInformation">
											<xsl:with-param name="TargetNode">AddressLine2Txt</xsl:with-param>
										</xsl:call-template>
										<br/>
										<xsl:call-template name="PopulateReturnHeaderPaidPreparerInformation">
											<xsl:with-param name="TargetNode">CityStateInfo</xsl:with-param>
										</xsl:call-template>
										<br/>
										<xsl:call-template name="PopulateReturnHeaderPaidPreparerInformation">
											<xsl:with-param name="TargetNode">CountryCd</xsl:with-param>
										</xsl:call-template>
                  </div>
                </div>
                <div class="styLNDesc" style="width:55mm;padding-left:1mm;height:auto;border-top:1px solid black;"> Phone no. 
					<xsl:choose>
						<xsl:when test="$RtnHdrData/PaidPreparerInformationGrp/ForeignPhoneNum">
							<xsl:call-template name="PopulateReturnHeaderPaidPreparerInformation">
								<xsl:with-param name="TargetNode">ForeignPhone</xsl:with-param>
							</xsl:call-template>
						</xsl:when>
						<xsl:otherwise>
							<xsl:call-template name="PopulateReturnHeaderPaidPreparerInformation">
								<xsl:with-param name="TargetNode">Phone</xsl:with-param>
							</xsl:call-template>
						</xsl:otherwise>
					</xsl:choose>
                </div>
              </div>
            </div>
          </div>
				<!-- Page 1 Break and Footer-->
				<div class="pageEnd" style="width:187mm;border-top:1px solid black;text-align:center;">
					<span class="styBoldText" style="width:92mm;float:left;text-align:left;">For Disclosure, Privacy Act, and Paperwork Reduction Act Notice, see the instructions for this form. </span>
					<span style="width:6mm;"/>Cat. No. 94048Y                     
					<span style="float:right;">
						Form <span class="styBoldText" style="font-size:8pt;">709-NA</span> (2025)
					</span>
				</div>
				
				<!--///////////////////////////////////////Page 2/////////////////////////////////////////-->
				<div class="styStdDivLS">
					Form 709-NA (2025)
					<span style="float:right;">
						Page <span style="font-weight:bold;font-size:9pt;">2</span>
					</span>
				</div>
				<!-- Sch A Header -->
				<div class="styStdDivLS" style="border-top:1px solid black;">
					<span class="styPartName" style="width:25mm;">SCHEDULE A</span>
					<span class="styPartDesc" style="width:230mm;font-weight:normal;">
						<strong>Computation of Taxable Gifts</strong> (including transfers in trust) (see instructions) 
					</span>
				</div>
				<!--Schedule A A-->
				<div class="styStdDivLS" style="border-top:1px solid black;padding-top:1px;">
					<div class="styLNLeftNumBox" style="padding-left:0px;">A</div>
					<div class="styLNDesc" style="width:225mm;">
						Does the value of any item listed on Schedule A reflect any valuation discount? If "Yes," attach explanation 
						<xsl:call-template name="SetFormLinkInline">
							<xsl:with-param name="TargetNode" select="$FormData/ValuationDiscountInd"/>
						</xsl:call-template>
						<span class="sty709NADotLn">.....................</span>
					</div>
					<div class="styGenericDiv" style="width:22mm;padding-top:1px;">
						<xsl:call-template name="PopulateSpan">
							<xsl:with-param name="TargetNode" select="$FormData/ValuationDiscountInd"/>
						</xsl:call-template>
						<input type="checkbox" class="styCkboxNM" style="margin-right:2px;" aria-label="Valuation Discount Yes">
							<xsl:call-template name="PopulateYesCheckbox">
								<xsl:with-param name="TargetNode" select="$FormData/ValuationDiscountInd"/>
								<xsl:with-param name="BackupName">F709NAValuationDiscountInd</xsl:with-param>
							</xsl:call-template>
						</input>
						Yes
						<input type="checkbox" class="styCkboxNM" style="margin-right:2px;margin-left:3mm;" aria-label="Valuation Discount No">
							<xsl:call-template name="PopulateNoCheckbox">
								<xsl:with-param name="TargetNode" select="$FormData/ValuationDiscountInd"/>
								<xsl:with-param name="BackupName">F709NAValuationDiscountInd</xsl:with-param>
							</xsl:call-template>
						</input>
						No
					</div>
				</div>
				<!--Schedule A B-->
				<div class="styStdDivLS" style="margin-bottom:2px;">
					<div class="styLNLeftNumBox" style="padding-left:0px;">B</div>
					<div class="styLNDesc" style="width:246mm;font-family:Arial;height:auto;">
						If you elect under section 529(c)(2)(B) to treat any transfers made this year to a qualified tuition program as made ratably over a 5-year period, check here 
						<input type="checkbox" class="styCkboxNM" style="" aria-label="Section 529 c2B Election">
							<xsl:call-template name="PopulateCheckbox">
								<xsl:with-param name="TargetNode" select="$FormData/Section529c2BElectionInd"/>
								<xsl:with-param name="BackupName">F709/Section529c2BElectionInd</xsl:with-param>
							</xsl:call-template>
						</input> . 
						See instructions. Attach a statement.
						<xsl:call-template name="SetFormLinkInline">
							<xsl:with-param name="TargetNode" select="$FormData/Section529c2BElectionInd"/>
						</xsl:call-template>
					</div>
				</div>
				
				<!--Part 1 — Gifts Subject Only to Gift Tax.-->
				<div class="styStdDivLS" style="border-top:1px solid black;border-bottom:1px solid black;">
					<div class="styLNDesc" style="width:100%">
						<strong>Part 1 &mdash; Gifts Subject Only to Gift Tax. </strong>
						Gifts less political organization, medical, and educational exclusions.
					</div>
				</div>

				<!--Table -->
				<div class="styTableContainerLandscapeNBB" id="schAp1table1">
					<xsl:call-template name="SetInitialState"/>
					<table class="styTable" style="border-collapse:collapse;font-size:7pt;">
						<thead class="styTableThead">
							<tr>
								<th class="styTableCellHeader" rowspan="2" style="width:10mm;font-weight:normal;" scope="col" >
									<strong>(a)</strong><br />Item number
								</th>
								<th class="styTableCellHeader" rowspan="2" style="width:53mm;font-weight:normal;" scope="col" >
									<strong>(b)</strong><br />Donee's name and address
								</th>
								<th class="styTableCellHeader" rowspan="2" style="width:25mm;font-weight:normal;" scope="col" >
									<strong>(c)</strong><br />Relationship to donor <br /> (if any)
								</th>
								<th class="styTableCellHeader" rowspan="2" style="width:46mm;font-weight:normal;" scope="col" >
									<strong>(d)</strong><br />Description of gift
								</th>
								<th class="styTableCellHeader" rowspan="2" style="width:30mm;font-weight:normal;" scope="col" >
									<strong>(e)</strong><br />Donor's adjusted <br /> basis of gift
								</th>
								<th class="styTableCellHeader" rowspan="2" style="width:20mm;font-weight:normal;" scope="col" >
									<strong>(f)</strong><br />Date of gift
								</th>
								<th class="styTableCellHeader" rowspan="2" style="width:30mm;font-weight:normal;" scope="col" >
									<strong>(g)</strong><br />Value at <br /> date of gift
								</th>
								<th class="styTableCellHeader" colspan="3" style="width:42mm;font-weight:normal;border-right-width:0px;" scope="colgroup" >
									Check boxes where applicable
								</th>
							</tr>
							<tr>
								<th class="styTableCellHeader" style="width:14mm;font-weight:normal;" scope="col">
									<strong>(h)</strong><br />Deductible charitable gift
								</th>
								<th class="styTableCellHeader" style="width:14mm;font-weight:normal;" scope="col">
									<strong>(i)</strong><br />Deductible gift to spouse
								</th>
								<th class="styTableCellHeader" style="width:14mm;font-weight:normal;border-right-width:0px;" scope="col">
									<strong>(j)</strong><br />Section 2652(a)(3) election
								</th>
							</tr>
						</thead>
						<tbody>
							<xsl:for-each select="$FormData/DonorGiftsSubjectToGiftTxNAGrp">
								<tr style="vertical-align:bottom;min-height:7mm;">
									<td class="styTableCellCtrInherit" style="font-weight:bold;">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="ItemNum"/>
										</xsl:call-template>
									</td>
									<td class="styTableCellTextInherit">
										<xsl:choose>
											<xsl:when test="DoneeName">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="DoneeName/BusinessNameLine1Txt"/>
												</xsl:call-template>
												<xsl:if test="DoneeName/BusinessNameLine2Txt">
													<br />
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="DoneeName/BusinessNameLine2Txt"/>
													</xsl:call-template>
												</xsl:if>
											</xsl:when>
											<xsl:otherwise>
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="DoneePersonNm"/>
												</xsl:call-template>
											</xsl:otherwise>
										</xsl:choose>
										<br />
										<xsl:choose>
											<xsl:when test="DoneeForeignAddress">
												<xsl:call-template name="PopulateForeignAddressTemplate">
													<xsl:with-param name="TargetNode" select="DoneeForeignAddress"/>
												</xsl:call-template>
											</xsl:when>
											<xsl:otherwise>
												<xsl:call-template name="PopulateUSAddressTemplate">
													<xsl:with-param name="TargetNode" select="DoneeUSAddress"/>
												</xsl:call-template>
											</xsl:otherwise>
										</xsl:choose>
									</td>
									<td class="styTableCellTextInherit">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="RelationshipDescriptionTxt"/>
										</xsl:call-template>
									</td>
									<td class="styTableCellTextInherit">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="GiftDesc"/>
										</xsl:call-template>
										<xsl:if test="CUSIPNum">
											<br /> CUSIP: 
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="CUSIPNum"/>
											</xsl:call-template>
										</xsl:if>
										<xsl:if test="EntityEIN">
											<br /> Entity EIN: 
											<xsl:call-template name="PopulateEIN">
												<xsl:with-param name="TargetNode" select="EntityEIN"/>
											</xsl:call-template>
										</xsl:if>
									</td>
									<td class="styTableCellAmtInherit">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="AdjustedBasisAmt"/>
										</xsl:call-template>
									</td>
									<td class="styTableCellCtrInherit">
										<xsl:call-template name="PopulateMonthDayYear">
											<xsl:with-param name="TargetNode" select="GiftDt"/>
										</xsl:call-template>
									</td>
									<td class="styTableCellAmtInherit">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="GiftFMVOnDateAmt"/>
										</xsl:call-template>
									</td>
									<td class="styTableCellCtrInherit">
										<input type="checkbox" class="styCkboxNM" style="">
											<xsl:attribute name="aria-label">Item <xsl:value-of select="ItemNum"/>Deductible Charitable Gift</xsl:attribute>
											<xsl:call-template name="PopulateCheckbox">
												<xsl:with-param name="TargetNode" select="DeductibleCharitableGiftInd"/>
												<xsl:with-param name="BackupName">F709/CharitableGiftInd<xsl:number value="position()"/></xsl:with-param>
											</xsl:call-template>
										</input>
									</td>
									<td class="styTableCellCtrInherit">
										<input type="checkbox" class="styCkboxNM" style="">
											<xsl:attribute name="aria-label">Item <xsl:value-of select="ItemNum"/>Deductible Gift to Spouse</xsl:attribute>
											<xsl:call-template name="PopulateCheckbox">
												<xsl:with-param name="TargetNode" select="DeductibleGiftSpouseInd"/>
												<xsl:with-param name="BackupName">F709/DeductibleGiftSpouseInd<xsl:number value="position()"/></xsl:with-param>
											</xsl:call-template>
										</input>
									</td>
									<td class="styTableCellCtrInherit" style="border-right-width:0px;">
										<input type="checkbox" class="styCkboxNM">
											<xsl:attribute name="aria-label">Item <xsl:value-of select="ItemNum"/> Section 2652 a 3 Election</xsl:attribute>
											<xsl:call-template name="PopulateCheckbox">
												<xsl:with-param name="TargetNode" select="Section2652a3ElectionInd"/>
												<xsl:with-param name="BackupName">F709/Section2652a3ElectionInd<xsl:number value="position()"/></xsl:with-param>
											</xsl:call-template>
										</input>
									</td>	
								</tr>
							</xsl:for-each>
							<xsl:if test="count($FormData/DonorGiftsSubjectToGiftTxNAGrp) &lt; 16">
								<xsl:call-template name="FillPage2Table">
									<xsl:with-param name="LineNumber" select="count($FormData/DonorGiftsSubjectToGiftTxNAGrp) + 1"/>
								</xsl:call-template>
							</xsl:if>
						</tbody>
					</table>
				</div>
				<!--Total of Part 1-->
				<div class="styStdDivLS">
					<div class="styLNDesc" style="width:185.2mm;">
						<strong>Total of Part 1. </strong>
						Add amounts from Part 1, column (g)
						<span class="sty709NADotLn">............................</span>
					</div>
					<div class="styLNAmountBoxNBB" style="width:29.3mm;padding-right:.5mm;">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/TotGiftsSubjGiftTxGiftFMVDtAmt"/>
						</xsl:call-template>
					</div>
					<div class="styLNAmountBoxNBB" style="width:41.5mm;background-color:lightgrey;"/>
				</div>
				<div class="styStdDivLS pageEnd" style="border-top:2px solid black;text-align:right;">
					<span style="float:left;font-style:italic;">(If more space is needed, attach additional statements.)</span>
					Form <span class="styBoldText" style="font-size:8pt;">709-NA</span> (2025)
				</div>
				
				<!--//////////////////////////////////////////////Page 3//////////////////////////////////////-->
				<div class="styStdDivLS">
					Form 709-NA (2025)
					<span style="float:right;">
						Page <span style="font-weight:bold;font-size:9pt;">3</span>
					</span>
				</div>
				<!-- Sch A Header -->
				<div class="styStdDivLS" style="border-top:1px solid black;">
					<span class="styPartName" style="width:25mm;">SCHEDULE A</span>
					<span class="styPartDesc" style="width:230mm;font-weight:normal;">
						<strong>Computation of Taxable Gifts</strong> (including transfers in trust) (see instructions) 
						<span style="font-style:italic;">(continued)</span>
					</span>
				</div>
				<div class="styStdDivLS" style="border-top:1px solid black;border-bottom:1px solid black;">
					<div class="styLNDesc" style="width:100%;">
						<strong>Part 2 &mdash; Direct Skips. </strong>
						Gifts that are direct skips and are subject to both gift tax and generation-skipping transfer tax. You must list the gifts in chronological order.
					</div>
				</div>
				<div class="styTableContainerLandscapeNBB" id="schAp2table1">
					<xsl:call-template name="SetInitialState"/>
					<table class="styTable" style="border-collapse:collapse;">
						<thead class="styTableThead">
							<tr>
								<th class="styTableCellHeader" rowspan="2" style="width:10mm;font-weight:normal;" scope="col" >
									<strong>(a)</strong><br />Item number
								</th>
								<th class="styTableCellHeader" rowspan="2" style="width:53mm;font-weight:normal;" scope="col" >
									<strong>(b)</strong><br />Donee's name and address
								</th>
								<th class="styTableCellHeader" rowspan="2" style="width:25mm;font-weight:normal;" scope="col" >
									<strong>(c)</strong><br />Relationship to donor <br /> (if any)
								</th>
								<th class="styTableCellHeader" rowspan="2" style="width:46mm;font-weight:normal;" scope="col" >
									<strong>(d)</strong><br />Description of gift
								</th>
								
								<th class="styTableCellHeader" rowspan="2" style="width:30mm;font-weight:normal;" scope="col" >
									<strong>(e)</strong><br />Donor's adjusted <br /> basis of gift
								</th>
								<th class="styTableCellHeader" rowspan="2" style="width:20mm;font-weight:normal;" scope="col" >
									<strong>(f)</strong><br />Date of gift
								</th>
								<th class="styTableCellHeader" rowspan="2" style="width:30mm;font-weight:normal;" scope="col" >
									<strong>(g)</strong><br />Value at <br /> date of gift
								</th>
								<th class="styTableCellHeader" colspan="4" style="width:42mm;font-weight:normal;border-right-width:0px;" scope="colgroup" >
									Check boxes where applicable
								</th>
							</tr>
							<tr>
								<th class="styTableCellHeader" style="width:14mm;font-weight:normal;" scope="col">
									<strong>(h)</strong><br />Deductible charitable gift
								</th>
								<th class="styTableCellHeader" style="width:14mm;font-weight:normal;" scope="col">
									<strong>(i)</strong><br />Deductible gift to spouse
								</th>
								<th class="styTableCellHeader" style="width:14mm;font-weight:normal;" scope="col">
									<strong>(j)</strong><br />Section 2652(a)(3) election
								</th>
								<th class="styTableCellHeader" style="width:14mm;font-weight:normal;border-right-width:0px;" scope="col">
									<strong>(j)</strong><br />Section 2652(b) election out
								</th>
							</tr>
						</thead>
						<tbody>
							<xsl:for-each select="$FormData/DonorDirectSkipsNAGrp">
								<tr style="vertical-align:bottom;min-height:7mm;">
									<td class="styTableCellCtrInherit" style="font-weight:bold;">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="ItemNum"/>
										</xsl:call-template>
									</td>
									<td class="styTableCellTextInherit">
										<xsl:choose>
											<xsl:when test="DoneeName">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="DoneeName/BusinessNameLine1Txt"/>
												</xsl:call-template>
												<xsl:if test="DoneeName/BusinessNameLine2Txt">
													<br />
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="DoneeName/BusinessNameLine2Txt"/>
													</xsl:call-template>
												</xsl:if>
											</xsl:when>
											<xsl:otherwise>
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="DoneePersonNm"/>
												</xsl:call-template>
											</xsl:otherwise>
										</xsl:choose>
										<br />
										<xsl:choose>
											<xsl:when test="DoneeForeignAddress">
												<xsl:call-template name="PopulateForeignAddressTemplate">
													<xsl:with-param name="TargetNode" select="DoneeForeignAddress"/>
												</xsl:call-template>
											</xsl:when>
											<xsl:otherwise>
												<xsl:call-template name="PopulateUSAddressTemplate">
													<xsl:with-param name="TargetNode" select="DoneeUSAddress"/>
												</xsl:call-template>
											</xsl:otherwise>
										</xsl:choose>
									</td>
									<td class="styTableCellTextInherit">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="RelationshipDescriptionTxt"/>
										</xsl:call-template>
									</td>
									<td class="styTableCellTextInherit">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="GiftDesc"/>
										</xsl:call-template>
										<xsl:if test="CUSIPNum">
											<br /> CUSIP: 
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="CUSIPNum"/>
											</xsl:call-template>
										</xsl:if>
										<xsl:if test="EntityEIN">
											<br /> Entity EIN: 
											<xsl:call-template name="PopulateEIN">
												<xsl:with-param name="TargetNode" select="EntityEIN"/>
											</xsl:call-template>
										</xsl:if>
									</td>
									<td class="styTableCellAmtInherit">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="AdjustedBasisAmt"/>
										</xsl:call-template>
									</td>
									<td class="styTableCellCtrInherit">
										<xsl:call-template name="PopulateMonthDayYear">
											<xsl:with-param name="TargetNode" select="GiftDt"/>
										</xsl:call-template>
									</td>
									<td class="styTableCellAmtInherit">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="GiftFMVOnDateAmt"/>
										</xsl:call-template>
									</td>
									<td class="styTableCellCtrInherit">
										<input type="checkbox" class="styCkboxNM" style="" disabled="disabled">
											<xsl:attribute name="aria-label">Item <xsl:value-of select="ItemNum"/>Deductible charitable gift</xsl:attribute>
											<xsl:call-template name="PopulateCheckbox">
												<xsl:with-param name="TargetNode" select="xxxxx"/>
												<xsl:with-param name="BackupName">F709/P2/xxxx<xsl:number value="position()"/></xsl:with-param>
											</xsl:call-template>
										</input>
									</td>
									<td class="styTableCellCtrInherit">
										<input type="checkbox" class="styCkboxNM" style="" disabled="disabled">
											<xsl:attribute name="aria-label">Item <xsl:value-of select="ItemNum"/>Deductible gift to spouse</xsl:attribute>
											<xsl:call-template name="PopulateCheckbox">
												<xsl:with-param name="TargetNode" select="xxxx"/>
												<xsl:with-param name="BackupName">F709/P2/xxxxx<xsl:number value="position()"/></xsl:with-param>
											</xsl:call-template>
										</input>
									</td>
									<td class="styTableCellCtrInherit">
										<input type="checkbox" class="styCkboxNM" style="" disabled="disabled">
											<xsl:attribute name="aria-label">Item <xsl:value-of select="ItemNum"/>Section 2652(a)(3) election</xsl:attribute>
											<xsl:call-template name="PopulateCheckbox">
												<xsl:with-param name="TargetNode" select="xxxxx"/>
												<xsl:with-param name="BackupName">F709/P2/Section2652a3ElectionInd<xsl:number value="position()"/></xsl:with-param>
											</xsl:call-template>
										</input>
									</td>
									<td class="styTableCellCtrInherit" style="border-right-width:0px;">
										<input type="checkbox" class="styCkboxNM" style="">
											<xsl:attribute name="aria-label">Item <xsl:value-of select="ItemNum"/>Section 2632(b) election out</xsl:attribute>
											<xsl:call-template name="PopulateCheckbox">
												<xsl:with-param name="TargetNode" select="Section2632bElectionOutInd"/>
												<xsl:with-param name="BackupName">F709/P2/Section2632bElectionOutInd<xsl:number value="position()"/></xsl:with-param>
											</xsl:call-template>
										</input>
										<span style="padding-right:.5mm;"/>
										<xsl:call-template name="SetFormLinkInline">
											<xsl:with-param name="TargetNode" select="Section2632bElectionOutInd"/>
										</xsl:call-template>
									</td>
								</tr>
							</xsl:for-each>
							<xsl:if test="count($FormData/DonorDirectSkipsNAGrp) &lt; 16">
								<xsl:call-template name="FillPage4Table">
									<xsl:with-param name="LineNumber" select="count($FormData/DonorDirectSkipsNAGrp) + 1"/>
								</xsl:call-template>
							</xsl:if>
						</tbody>
					</table>
				</div>
				<div class="styStdDivLS">
					<div class="styLNDesc" style="width:173.2mm;">
						<strong>Total of Part 2. </strong>
						Add amounts from Part 2, column (g)
						<span class="sty709NADotLn">.........................</span>
					</div>
					<div class="styLNAmountBoxNBB" style="width:28mm;border-right-width:1px; padding-right:.5mm;">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/TotDirectSkipsGiftFMVOnDateAmt"/>
						</xsl:call-template>
					</div>
					<div class="styLNAmountBoxNBB" style="width:54.8mm;background-color:lightgrey;">
					</div>
				</div>
				<div class="styStdDivLS pageEnd" style="border-top:2px solid black;text-align:right;">
					<span style="float:left;font-style:italic;">(If more space is needed, attach additional statements.)</span>
					Form <span class="styBoldText" style="font-size:8pt;">709-NA</span> (2025)
				</div>
				<!--///////////////////////////////////////////////////////Page 4//////////////////////////////////////////-->
				<div class="styStdDivLS">
					Form 709-NA (2025)
					<span style="float:right;">
						Page <span style="font-weight:bold;font-size:9pt;">4</span>
					</span>
				</div>
				<!-- Sch A Header -->
				<div class="styStdDivLS" style="border-top:1px solid black;">
					<span class="styPartName" style="width:25mm;">SCHEDULE A</span>
					<span class="styPartDesc" style="width:230mm;font-weight:normal;">
						<strong>Computation of Taxable Gifts</strong> (including transfers in trust) (see instructions) 
						<span style="font-style:italic;">(continued)</span>
					</span>
				</div>
				<div class="styStdDivLS" style="border-top:1px solid black;border-bottom:1px solid black;">
					<div class="styLNDesc" style="width:100%;height:auto;">
						<strong>Part 3 &mdash; Indirect Skips and Other Transfers in Trust. </strong>
						Gifts to trusts that are indirect skips as defined under section 2632(c) or to trusts that are currently subject to gift tax and may later be 
						subject to generation-skipping transfer tax. You must list these gifts in chronological order.
					</div>
				</div>
				<div class="styTableContainerLandscapeNBB" id="schAp3table1">
					<xsl:call-template name="SetInitialState"/>
					<table class="styTable" style="border-collapse:collapse;">
						<thead class="styTableThead">
							<tr>
								<th class="styTableCellHeader" rowspan="2" style="width:10mm;font-weight:normal;" scope="col" >
									<strong>(a)</strong><br />Item number
								</th>
								<th class="styTableCellHeader" rowspan="2" style="width:53mm;font-weight:normal;" scope="col" >
									<strong>(b)</strong><br />Donee's name and address
								</th>
								<th class="styTableCellHeader" rowspan="2" style="width:25mm;font-weight:normal;" scope="col" >
									<strong>(c)</strong><br />Relationship <br /> to donor <br /> (if any)
								</th>
								<th class="styTableCellHeader" rowspan="2" style="width:46mm;font-weight:normal;" scope="col" >
									<strong>(d)</strong><br />Description of gift
								</th>
								<th class="styTableCellHeader" rowspan="2" style="width:30mm;font-weight:normal;" scope="col" >
									<strong>(e)</strong><br />Donor's adjusted <br /> basis of gift
								</th>
								<th class="styTableCellHeader" rowspan="2" style="width:20mm;font-weight:normal;" scope="col" >
									<strong>(f)</strong><br />Date of gift
								</th>
								<th class="styTableCellHeader" rowspan="2" style="width:30mm;font-weight:normal;" scope="col" >
									<strong>(g)</strong><br />Value at <br /> date of gift
								</th>
								<th class="styTableCellHeader" colspan="4" style="width:42mm;font-weight:normal;border-right-width:0px;" scope="colgroup" >
									Check boxes where applicable
								</th>
							</tr>
							<tr>
								<th class="styTableCellHeader" style="width:14mm;font-weight:normal;" scope="col">
									<strong>(h)</strong><br />Deductible charitable gift
								</th>
								<th class="styTableCellHeader" style="width:14mm;font-weight:normal;" scope="col">
									<strong>(i)</strong><br />Deductible gift to spouse
								</th>
								<th class="styTableCellHeader" style="width:14mm;font-weight:normal;" scope="col">
									<strong>(j)</strong><br />Section 2652(a)(3) election
								</th>
								<th class="styTableCellHeader" style="width:14mm;font-weight:normal;border-right-width:0px;" scope="col">
									<strong>(k)</strong><br />Section 2632(c) election
								</th>
							</tr>
						</thead>
						<tbody>
							<xsl:for-each select="$FormData/DonorIndirectSkipsNAGrp">
								<tr style="vertical-align:bottom;min-height:7mm;">
									<td class="styTableCellCtrInherit" style="font-weight:bold;">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="ItemNum"/>
										</xsl:call-template>
									</td>
									<td class="styTableCellTextInherit">
										<xsl:choose>
											<xsl:when test="DoneeName">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="DoneeName/BusinessNameLine1Txt"/>
												</xsl:call-template>
												<xsl:if test="DoneeName/BusinessNameLine2Txt">
													<br />
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="DoneeName/BusinessNameLine2Txt"/>
													</xsl:call-template>
												</xsl:if>
											</xsl:when>
											<xsl:otherwise>
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="DoneePersonNm"/>
												</xsl:call-template>
											</xsl:otherwise>
										</xsl:choose>
										<br />
										<xsl:choose>
											<xsl:when test="DoneeForeignAddress">
												<xsl:call-template name="PopulateForeignAddressTemplate">
													<xsl:with-param name="TargetNode" select="DoneeForeignAddress"/>
												</xsl:call-template>
											</xsl:when>
											<xsl:otherwise>
												<xsl:call-template name="PopulateUSAddressTemplate">
													<xsl:with-param name="TargetNode" select="DoneeUSAddress"/>
												</xsl:call-template>
											</xsl:otherwise>
										</xsl:choose>
									</td>
									<td class="styTableCellTextInherit">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="RelationshipDescriptionTxt"/>
										</xsl:call-template>
									</td>
									<td class="styTableCellTextInherit">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="GiftDesc"/>
										</xsl:call-template>
										<xsl:if test="CUSIPNum">
											<br /> CUSIP: 
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="CUSIPNum"/>
											</xsl:call-template>
										</xsl:if>
										<xsl:if test="EntityEIN">
											<br /> Entity EIN: 
											<xsl:call-template name="PopulateEIN">
												<xsl:with-param name="TargetNode" select="EntityEIN"/>
											</xsl:call-template>
										</xsl:if>
									</td>
									<td class="styTableCellAmtInherit">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="AdjustedBasisAmt"/>
										</xsl:call-template>
									</td>
									<td class="styTableCellCtrInherit">
										<xsl:call-template name="PopulateMonthDayYear">
											<xsl:with-param name="TargetNode" select="GiftDt"/>
										</xsl:call-template>
									</td>
									<td class="styTableCellAmtInherit">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="GiftFMVOnDateAmt"/>
										</xsl:call-template>
									</td>
									<td class="styTableCellCtrInherit">
										<input type="checkbox" class="styCkboxNM" style="">
											<xsl:attribute name="aria-label">Item <xsl:value-of select="ItemNum"/>Deductible Charitable Gift</xsl:attribute>
											<xsl:call-template name="PopulateCheckbox">
												<xsl:with-param name="TargetNode" select="DeductibleCharitableGiftInd"/>
												<xsl:with-param name="BackupName">F709/P3/DeductibleCharitableGiftInd<xsl:number value="position()"/></xsl:with-param>
											</xsl:call-template>
										</input>
									</td>
									<td class="styTableCellCtrInherit">
										<input type="checkbox" class="styCkboxNM" style="">
											<xsl:attribute name="aria-label">Item <xsl:value-of select="ItemNum"/>Deductible Gift Spouse</xsl:attribute>
											<xsl:call-template name="PopulateCheckbox">
												<xsl:with-param name="TargetNode" select="DeductibleGiftSpouseInd"/>
												<xsl:with-param name="BackupName">F709/P3/DeductibleGiftSpouseInd<xsl:number value="position()"/></xsl:with-param>
											</xsl:call-template>
										</input>
									</td>
									<td class="styTableCellCtrInherit">
										<input type="checkbox" class="styCkboxNM" style="">
											<xsl:attribute name="aria-label">Item <xsl:value-of select="ItemNum"/>Section 2652 a3 Election</xsl:attribute>
											<xsl:call-template name="PopulateCheckbox">
												<xsl:with-param name="TargetNode" select="Section2652a3ElectionInd"/>
												<xsl:with-param name="BackupName">F709/P3/Section2652a3ElectionInd<xsl:number value="position()"/></xsl:with-param>
											</xsl:call-template>
										</input>
									</td>
									<td class="styTableCellCtrInherit" style="border-right-width:0px;">
										<input type="checkbox" class="styCkboxNM">
											<xsl:attribute name="aria-label">Item <xsl:value-of select="ItemNum"/>Section 2632c Election Statement</xsl:attribute>
											<xsl:call-template name="PopulateCheckbox">
												<xsl:with-param name="TargetNode" select="Section2632cElectionInd"/>
												<xsl:with-param name="BackupName">F709/P3/Section2632cElectionInd<xsl:number value="position()"/></xsl:with-param>
											</xsl:call-template>
										</input>
										<span style="padding-right:.5mm;"/>
										<xsl:call-template name="SetFormLinkInline">
											<xsl:with-param name="TargetNode" select="Section2632cElectionInd"/>
										</xsl:call-template>
									</td>
								</tr>
							</xsl:for-each>
							<xsl:if test="count($FormData/DonorIndirectSkipsNAGrp) &lt; 16">
								<xsl:call-template name="FillPage5Table">
									<xsl:with-param name="LineNumber" select="count($FormData/DonorIndirectSkipsNAGrp) + 1"/>
								</xsl:call-template>
							</xsl:if>
						</tbody>
					</table>
				</div>
				<div class="styStdDivLS">
					<div class="styLNDesc" style="width:173.2mm;">
						<strong>Total of Part 3. </strong>
						Add amounts from Part 3, column (g)
						<span class="sty709NADotLn">.........................</span>
					</div>
					<div class="styLNAmountBoxNBB" style="width:28mm;padding-right:.5mm;">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/TotalIndrSkipsGiftFMVOnDateAmt"/>
						</xsl:call-template>
					</div>
					<div class="styLNAmountBoxNBB" style="width:54.8mm;background-color:lightgrey;">
					</div>
				</div>
				<div class="styStdDivLS pageEnd" style="border-top:2px solid black;text-align:right;">
					<span style="float:left;font-style:italic;">(If more space is needed, attach additional statements.)</span>
					Form <span class="styBoldText" style="font-size:8pt;">709-NA</span> (2025)
				</div>
				
				<!--//////////////////////////////////////////////////////Page 5/////////////////////////////////////////////////////-->
				<div class="styStdDiv">
					Form 709-NA (2025)
					<span style="float:right;">
						Page <span style="font-weight:bold;font-size:9pt;">5</span>
					</span>
				</div>
				<div class="styStdDiv" style="border-top:1px solid black;">
					<span class="styPartName" style="width:25mm;">SCHEDULE A</span>
					<span class="styPartDesc" style="width:162mm;font-weight:normal;">
						<strong>Computation of Taxable Gifts</strong> (including transfers in trust) (see instructions) 
						<span style="font-style:italic;">(continued)</span>
					</span>
				</div>
				<div class="styStdDiv" style="border-top:1px solid black;border-bottom:1px solid black;">
					<div class="styLNDesc" style="width:100%;font-weight:bold;">
						Part 4 &mdash; Taxable Gift Reconciliation
					</div>
				</div>
				<!-- Sch A, Part 4, Line 1 -->
				<div class="styStdDiv">
					<div class="styLNLeftNumBoxSD">1</div>
					<div class="styLNDesc">
						Total value of gifts of donor. Add totals from column (j) of Schedule A, Parts 1, 2, and 3
						<span class="sty709NADotLn">......</span>
					</div>
					<div class="styLNRightNumBox">1</div>
					<div class="styLNAmountBox">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/TotalGiftsValueAmt"/>
						</xsl:call-template>
					</div>
				</div>
				<!-- Sch A, Part 4, Line 2 -->
				<div class="styStdDiv">
					<div class="styLNLeftNumBoxSD">2</div>
					<div class="styLNDesc">
						Total annual exclusions for gifts listed on line 1 (see instructions)
						<span class="sty709NADotLn">.............</span>
					</div>
					<div class="styLNRightNumBox">2</div>
					<div class="styLNAmountBox">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/TotalAnnualExclusionsGiftsAmt"/>
						</xsl:call-template>
					</div>
				</div>
				<!-- Sch A, Part 4, Line 3 -->
				<div class="styStdDiv">
					<div class="styLNLeftNumBoxSD">3</div>
					<div class="styLNDesc">
						Total included amount of gifts. Subtract line 2 from line 1
						<span class="sty709NADotLn">...............</span>
					</div>
					<div class="styLNRightNumBox">3</div>
					<div class="styLNAmountBox">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/TotalIncludedGiftsAmt"/>
						</xsl:call-template>
					</div>
				</div>
				<div class="styStdDiv">
					<div class="styLNDesc" style="width:146mm;"><strong>Deductions </strong> (see instructions)</div>
					<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;">&nbsp;</div>
					<div class="styLNAmountBoxNBB">&nbsp;</div>
				</div>
				<!-- Sch A, Part 4, Line 4 -->
				<div class="styStdDiv">
					<div class="styLNLeftNumBoxSD">4</div>
					<div class="styLNDesc" style="height:auto;width:98mm;">
						Gifts of interest to U.S citizen spouse for which a marital deduction will be claimed.
						Enter the total value of items on Parts 1 and 3 of Schedule A for which the box in column (i) is checked
						<span class="sty709NADotLn">...........</span>
					</div>
					<div class="styLNRightNumBox" style="height:10.4mm;"><br /><br />4</div>
					<div class="styLNAmountBox" style="height:10.4mm;padding-right:0.5mm;"><br /><br />
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/MaritalDeductionClaimedAmt"/>
						</xsl:call-template>
					</div>
					<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;height:10.4mm;"><br /><br />&nbsp;</div>
					<div class="styLNAmountBoxNBB" style="height:10.4mm;"><br /><br />&nbsp;</div>
					
				</div>
				<!-- Sch A, Part 4, Line 5 -->
				<div class="styStdDiv">
					<div class="styLNLeftNumBoxSD">5</div>
					<div class="styLNDesc" style="width:98mm;">
						Exclusions attributable to gifts on line 4
						<span class="sty709NADotLn">...........</span>
					</div>
					<div class="styLNRightNumBox">5</div>
					<div class="styLNAmountBox" style="padding-right:0.5mm;">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/MaritalDeductionExclusionsAmt"/>
						</xsl:call-template>
					</div>
					<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;">&nbsp;</div>
					<div class="styLNAmountBoxNBB">&nbsp;</div>
				</div>
				<!-- Sch A, Part 4, Line 6 -->
				<div class="styStdDiv">
					<div class="styLNLeftNumBoxSD">6</div>
					<div class="styLNDesc" style="width:98mm;">
						Marital deduction. Subtract line 5 from line 4
						<span class="sty709NADotLn">..........</span>
					</div>
					<div class="styLNRightNumBox">6</div>
					<div class="styLNAmountBox" style="padding-right:0.5mm;">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/MaritalDeductionAmt"/>
						</xsl:call-template>
					</div>
					<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;">&nbsp;</div>
					<div class="styLNAmountBoxNBB">&nbsp;</div>
				</div>
				<!-- Sch A, Part 4, Line 7 -->
				<div class="styStdDiv">
					<div class="styLNLeftNumBoxSD">7</div>
					<div class="styLNDesc" style="width:98mm;height:auto;">
						Charitable deduction. Enter the total value of items on Parts 1 and 3 of Schedule A for which the box in column (h) is checked less exclusions
						<span class="sty709NADotLn">..</span>
					</div>
					<div class="styLNRightNumBox" style="height:7.4mm;"><br />7</div>
					<div class="styLNAmountBox" style="height:7.4mm;padding-right:0.5mm;"><br />
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/CharitableDeductionLessExclAmt"/>
						</xsl:call-template>
					</div>
					<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;height:7.4mm;"><br />&nbsp;</div>
					<div class="styLNAmountBoxNBB" style="height:7.4mm;"><br />&nbsp;</div>
				</div>
				<!-- Sch A, Part 4, Line 8 -->
				<div class="styStdDiv">
					<div class="styLNLeftNumBoxSD">8</div>
					<div class="styLNDesc">
						Total deductions. Add lines 6 and 7
						<span class="sty709NADotLn">.......................</span>
					</div>
					<div class="styLNRightNumBox">8</div>
					<div class="styLNAmountBox">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/TotalDeductionsAmt"/>
						</xsl:call-template>
					</div>
				</div>
				<!-- Sch A, Part 4, Line 9 -->
				<div class="styStdDiv">
					<div class="styLNLeftNumBoxSD">9</div>
					<div class="styLNDesc">
						Subtract line 8 from line 3
						<span class="sty709NADotLn">.........................</span>
					</div>
					<div class="styLNRightNumBox">9</div>
					<div class="styLNAmountBox">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/GiftsLessDeductionsAmt"/>
						</xsl:call-template>
					</div>
				</div>
				<!-- Sch A, Part 4, Line 10 -->
				<div class="styStdDiv">
					<div class="styLNLeftNumBox">10</div>
					<div class="styLNDesc">
						Generation-skipping transfer taxes payable with this Form 709-NA (from Schedule D, Part 3, col. (g), total)
						<!--<span class="sty709NADotLn">.</span>-->
					</div>
					<div class="styLNRightNumBox">10</div>
					<div class="styLNAmountBox">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/TotalGSTTaxAmt"/>
						</xsl:call-template>
					</div>
				</div>
				<!-- Sch A, Part 4, Line 11 -->
				<div class="styStdDiv">
					<div class="styLNLeftNumBox">11</div>
					<div class="styLNDesc">
						<strong>Taxable gifts.</strong> Add lines 9 and 10. Enter here and on Part 2&mdash;Tax Computation, line 1
						<span class="sty709NADotLn">.......</span>
					</div>
					<div class="styLNRightNumBoxNBB">11</div>
					<div class="styLNAmountBoxNBB">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/TaxableGiftsAmt"/>
						</xsl:call-template>
					</div>
				</div>
				<div class="styStdDiv" style="padding:0.5mm 0mm;font-weight:bold;border-top:1px solid black;">Gifts to Your Spouse</div>
				<!-- Sch A, Part 4, Line 12 -->
				<div class="styStdDiv">
					<div class="styLNLeftNumBox">12</div>
					<div class="styLNDesc" style="height:auto;">
						In what country was your spouse born?
						<span style="width:30mm;margin-left:2mm;border-bottom:1px dashed black;text-align:center;">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/SpouseBirthCountryCd"/>
							</xsl:call-template>
						</span>
					</div>
				</div>
				<!-- Sch A, Part 4, Line 13 -->
				<div class="styStdDiv">
					<div class="styLNLeftNumBox">13</div>
					<div class="styLNDesc" style="height:auto;">
						What is your spouse's date of birth?
						<span style="width:30mm;margin-left:2mm;border-bottom:1px dashed black;text-align:center;">
							<xsl:call-template name="PopulateMonthDayYear">
								<xsl:with-param name="TargetNode" select="$FormData/SpouseBirthDt"/>
							</xsl:call-template>
						</span>
					</div>
				</div>
				<!-- Sch A, Part 4, Line 14 -->
				<div class="styStdDiv">
					<div class="styLNLeftNumBox">14</div>
					<div class="styLNDesc" style="height:auto;">
						Is your spouse a U.S. citizen?
						<input type="checkbox" class="styCkboxNM" style="margin-left:1mm;margin-right:1mm;" aria-label="Spouse U.S. Citizen Yes">
							<xsl:call-template name="PopulateYesCheckbox">
								<xsl:with-param name="TargetNode" select="$FormData/SpouseUSCitizenInd"/>
								<xsl:with-param name="BackupName">F709NA/SpouseUSCitizenInd</xsl:with-param>
							</xsl:call-template>
						</input>
						<strong>Yes</strong>
						<input type="checkbox" class="styCkboxNM" style="margin-left:4mm;margin-right:1mm;" aria-label="Spouse U.S. Citizen No">
							<xsl:call-template name="PopulateNoCheckbox">
								<xsl:with-param name="TargetNode" select="$FormData/SpouseUSCitizenInd"/>
								<xsl:with-param name="BackupName">F709NA/SpouseUSCitizenInd</xsl:with-param>
							</xsl:call-template>
						</input>
						<strong>No</strong>
					</div>
				</div>
				<!-- Sch A, Part 4, Line 15 -->
				<div class="styStdDiv">
					<div class="styLNLeftNumBox">15</div>
					<div class="styLNDesc" style="height:auto;width:178mm;">
						If your spouse is a naturalized citizen, when and where did your spouse acquire citizenship?
						<span style="width:55mm;margin-left:2mm;border-bottom:1px dashed black;text-align:right;">
							<span style="float:left;">
								<xsl:call-template name="PopulateMonthDayYear">
									<xsl:with-param name="TargetNode" select="$FormData/SpouseAcqCitizenshipDt"/>
								</xsl:call-template>
							</span>
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/SpouseAcqCitizenshipLocTxt"/>
							</xsl:call-template>
						</span>
					</div>
				</div>
				<!-- Sch A, Part 4, Line 16 -->
				<div class="styStdDiv">
					<div class="styLNLeftNumBox">16</div>
					<div class="styLNDesc" style="height:auto;width:178mm;">
						If your spouse is not a U.S. citizen, of what country is your spouse a citizen?
						<span style="width:30mm;margin-left:2mm;border-bottom:1px dashed black;text-align:center;">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/SpouseCitizenCountryCd"/>
							</xsl:call-template>
						</span>
					</div>
				</div>
				<div class="styStdDiv" style="border-top:1px solid black;padding:0.5mm 0px;">
					<strong>Terminable Interest (Qualified Terminable Interest Property) Marital Deduction</strong> (See instructions for Schedule A, Part 4, line 4.)
				</div>
				<div class="styStdDiv">
					<div class="styLNLeftNumBox">&nbsp;</div>
					<div class="styLNDesc" style="width:178mm;height:auto;">
						If a trust (or other property) meets the requirements of qualified terminable interest property under section 2523(f), and: <br />
						<span style="width:5mm;padding-left:2mm;font-weight:bold;">a.</span>
						The trust (or other property) is listed on Schedule A; and <br />
						<span style="width:6mm;height:8mm;padding-left:2mm;font-weight:bold;float:left;">b.</span>
						The value of the trust (or other property) is entered in whole or in part as a deduction on Schedule A, Part 4, line 4, then the donor shall be 
						deemed to have made an election to have such trust (or other property) treated as qualified terminable interest property under section 2523(f). <br />
					</div>
				</div>
				<div class="styStdDiv">
					<div class="styLNLeftNumBox">&nbsp;</div>
					<div class="styLNDesc" style="width:178mm;height:auto;">
						If less than the entire value of the trust (or other property) that the donor has included in Parts 1 and 3 of Schedule A is entered as a deduction 
						on line 4, the donor shall be considered to have made an election only as to a fraction of the trust (or other property). The numerator of this 
						fraction is equal to the amount of the trust (or other property) deducted on Schedule A, Part 4, line 6. The denominator is equal to the total 
						value of the trust (or other property) listed in Parts 1 and 3 of Schedule A.
					</div>
				</div>
				<div class="styStdDiv" style="margin-top:2mm;">
					<div class="styLNLeftNumBox">&nbsp;</div>
					<div class="styLNDesc" style="width:178mm;height:auto;">
						If you make the Qualified Terminable Interest Property election, the terminable interest property involved will be included in your spouse's gross estate upon his or her 
						death (section 2044). See instructions for line 4 of Schedule A. If your spouse disposes (by gift or otherwise) of all or part of the qualifying life 
						income interest, he or she will be considered to have made a transfer of the entire property that is subject to the gift tax. See 
						<span style="display:inline;font-style:italic;">Transfer of Certain Life Estates Received From Spouse</span> in the instructions. 
					</div>
				</div>
				<div class="styStdDiv" style="margin-top:2mm;">
					<div class="styLNLeftNumBox">17</div>
					<div class="styLNDesc" style="width:178mm;height:auto;">
						<strong>Election Out of Qualified Terminable Interest Property Treatment of Annuities</strong><br />
						<input type="checkbox" class="styCkbox" style="margin-left:0px;" aria-label="Election Out of QTIP Treatment">
							<xsl:call-template name="PopulateCheckbox">
								<xsl:with-param name="TargetNode" select="$FormData/QTIPTreatmentElectOutItemGrp/QTIPTreatmentElectOutInd"/>
								<xsl:with-param name="BackupName">F709/QTIPTreatmentElectOutInd</xsl:with-param>
							</xsl:call-template>
						</input> 
						Check here if you elect under section 2523(f)(6) <strong>not</strong> to treat as qualified terminable interest property any joint and survivor annuities that are 
						reported on Schedule A and would otherwise be treated as qualified terminable interest property under section 2523(f). See instructions. Enter the 
						item numbers from Schedule A for the annuities for which you are making this election. <br />
						<span style="width:100%;min-height:4.5mm;border-bottom:1px dashed black;">
							<xsl:for-each select="$FormData/QTIPTreatmentElectOutItemGrp/QTIPTreatmentElectOutItemNum">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="."/>
								</xsl:call-template>
								<xsl:if test="position() != last()">, <span style="width:2mm;height:3mm;"/></xsl:if>
							</xsl:for-each>
						</span>
					</div>
				</div>
				<div class="styStdDiv pageEnd" style="border-top:2px solid black;text-align:right;margin-top:1mm;">
					Form <span class="styBoldText" style="font-size:8pt;">709-NA</span> (2025)
				</div>
				
				<!--////////////////////////////////////////////////////Page 6//////////////////////////////////////////-->
				<div class="styStdDivLS">
					Form 709-NA (2025)
					<span style="float:right;">
						Page <span style="font-weight:bold;font-size:9pt;">6</span>
					</span>
				</div>
				<!-- Schedule B Header -->
				<div class="styStdDivLS" style="border-top:1px solid black;">
					<span class="styPartName" style="width:25mm;">SCHEDULE B</span>
					<span class="styPartDesc" style="width:230mm;">
						Gifts From Prior Periods
					</span>
				</div>
				<div class="styStdDivLS" style="border-top:1px solid black;border-bottom:1px solid black;padding-top:2.2mm;padding-bottom:2mm;">
					<div class="styLNDesc" style="width:100%;height:auto;font-weight:bold;">
						If you answered "Yes" on line 22a of Part 1 &mdash; General Information, see the instructions for completing Schedule B. If you answered "No," skip to Part 2 &mdash; Tax Computation (or Schedule D, if applicable). Complete Schedule A before beginning Schedule B. See instructions for recalculation of the column (c) amounts. Attach calculations.
					</div>
				</div>
				<div class="styTableContainerLandscapeNBB" id="schBtable1">
					<xsl:call-template name="SetInitialState"/>
					<table class="styTable" style="border-collapse:collapse;font-size:7pt;">
						<thead class="styTableThead">
							<tr style="vertical-align:top;">
								<th class="styTableCellHeader" style="width:30mm;font-weight:normal;" scope="col" >
									<strong>(a)</strong><br /> Calendar year or <br /> calendar quarter <br /> (see instructions)
								</th>
								<th class="styTableCellHeader" style="width:112mm;font-weight:normal;" scope="col" >
									<strong>(b)</strong><br /> Internal Revenue office <br /> where prior return was filed
								</th>
								<th class="styTableCellHeader" style="width:38mm;font-weight:normal;" scope="col" >
									<strong>(c)</strong><br /> Amount of applicable credit <br /> (unified credit) against gift <br /> tax for periods after <br /> December 31, 1976
								</th>
								<th class="styTableCellHeader" style="width:38mm;font-weight:normal;" scope="col" >
									<strong>(d)</strong><br /> Amount of specific <br /> exemption for prior <br /> periods ending before <br /> January 1, 1977
								</th>
								<th class="styTableCellHeader" style="width:38mm;font-weight:normal;border-right-width:0px;" scope="col" >
									<strong>(e)</strong><br /> Amount of <br /> taxable gifts
								</th>
							</tr>
						</thead>
						<tbody>
							<xsl:for-each select="$FormData/PriorPeriodsGiftsGrp">
								<tr style="vertical-align:bottom;">
									<td class="styTableCellCtrInherit" style="">
										<xsl:call-template name="PopulateYear">
											<xsl:with-param name="TargetNode" select="CalendarYr"/>
										</xsl:call-template>
										<xsl:if test="CalendarQuarterCd">
											- 
											<xsl:for-each select="CalendarQuarterCd">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="."/>
												</xsl:call-template>
												<xsl:if test="position() != last()">, &nbsp;</xsl:if>
											</xsl:for-each>
										</xsl:if>
									</td>
									<td class="styTableCellTextInherit">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="IRSOfficePYReturnFiledTxt"/>
										</xsl:call-template>
									</td>
									<td class="styTableCellAmtInherit">
										<xsl:call-template name="SetFormLinkInline">
											<xsl:with-param name="TargetNode" select="ApplicableCreditAmt"/>
										</xsl:call-template>										
										<span style="padding-right:.5mm;"/>
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="ApplicableCreditAmt"/>
										</xsl:call-template>
									</td>
									<td class="styTableCellAmtInherit">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="ExemptionAmt"/>
										</xsl:call-template>
									</td>
									<td class="styTableCellAmtInherit" style="border-right-width:0px;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="TaxableGiftsAmt"/>
										</xsl:call-template>
									</td>
								</tr>
							</xsl:for-each>
							<xsl:if test="count($FormData/PriorPeriodsGiftsGrp) &lt; 31">
								<xsl:call-template name="FillPage7Table">
									<xsl:with-param name="LineNumber" select="count($FormData/PriorPeriodsGiftsGrp) + 1"/>
								</xsl:call-template>
							</xsl:if>
						</tbody>
					</table>
				</div>
				<!-- Sch B, Line 1 -->
				<div class="styStdIBDivLS">
					<div class="styLNLeftNumBoxSD">1</div>
					<div class="styLNDesc" style="width:125.9mm;">
						Totals for prior periods
						<span class="sty709NADotLn">.......................</span>
					</div>
					<div class="styLNRightNumBox">1</div>
					<div class="styLNAmountBox" style="width:38.1mm;padding-right:0.5mm;">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/TotPriorPrdApplicableCreditAmt"/>
						</xsl:call-template>
					</div>
					<div class="styLNAmountBox" style="width:38mm;padding-right:0.5mm;">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/TotPriorPrdExemptionAmt"/>
						</xsl:call-template>
					</div>
					<div class="styLNAmountBox" style="width:38mm;padding-right:0.5mm;">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/TotPriorPrdTaxableGiftsAmt"/>
						</xsl:call-template>
					</div>
				</div>
				<!-- Sch B, Line 2 -->
				<div class="styStdIBDivLS">
					<div class="styLNLeftNumBoxSD">2</div>
					<div class="styLNDesc" style="width:202mm;">
						Amount, if any, by which total specific exemption, line 1, column (d), is more than $30,000
						<span class="sty709NADotLn">.....................</span>
					</div>
					<div class="styLNRightNumBox">2</div>
					<div class="styLNAmountBox" style="width:38mm;">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/SpecificExemptionAmt"/>
						</xsl:call-template>
					</div>
				</div>
				<!-- Sch B, Line 3 -->
				<div class="styStdIBDivLS">
					<div class="styLNLeftNumBoxSD">3</div>
					<div class="styLNDesc" style="width:202mm;height:auto;">
						Total amount of taxable gifts for prior periods. Add amount on line 1, column (e), and amount, if any, on line 2. Enter here and on Part 2&mdash;Tax Computation, <br/>line 2
						<span class="sty709NADotLn">...............................................</span>
					</div>
					<div class="styLNRightNumBoxNBB" style="height:7.2mm;"><br />3</div>
					<div class="styLNAmountBoxNBB" style="height:7.2mm;width:38mm;"><br />
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/TotTaxableGiftsPriorPeriodsAmt"/>
						</xsl:call-template>
					</div>
				</div>
				<div class="styStdDivLS pageEnd" style="border-top:2px solid black;text-align:right;">
					<span class="styGenericDiv" style="font-style:italic;">(If more space is needed, attach additional statements.)</span>
					Form <span class="styBoldText" style="font-size:8pt;">709-NA</span> (2025)
				</div>

				<!--//////////////////////////////////////////Page 7///////////////////////////////////////////////////////////////////-->
				<!-- Sch D -->
				<div class="styStdDivLS">
					Form 709-NA (2025)
					<span style="float:right;">
						Page <span style="font-weight:bold;font-size:9pt;">7</span>
					</span>
				</div>
				<!-- Part II Header -->
				<div class="styStdDivLS" style="border-top:1px solid black;">
					<span class="styPartName" style="width:25mm;">SCHEDULE D</span>
					<span class="styPartDesc" style="width:230mm;">
						Computation of Generation-Skipping Transfer Tax
					</span>
				</div>
				<div class="styStdDivLS" style="border-top:1px solid black;">
					<div class="styLNDesc" style="width:100%">
						<strong>Note:</strong>
						Inter vivos direct skips that are completely excluded by the GST exemption must still be fully reported (including value and exemptions claimed) on Schedule D.
					</div>
				</div>
				<div class="styStdDivLS" style="border-top:1px solid black;border-bottom:1px solid black;">
					<div class="styLNDesc" style="width:100%">
						<strong>Part 1 &mdash; Generation-Skipping Transfers. </strong>
						List items from Schedule A first, then items to be reported on Schedule D, including any transfers subject to an Estate Tax Inclusion Period (ETIP).
					</div>
				</div>
				<div class="styTableContainerLandscapeNBB" id="schDp1table1">
					<xsl:call-template name="SetInitialState"/>
					<table class="styTable" style="border-collapse:collapse;font-size:7pt;">
						<thead class="styTableThead">
							<tr>
								<th class="styTableCellHeader" style="width:30mm;font-weight:normal;" scope="col" >
									<strong>(a)</strong><br />Item number (from Schedule A, Part 2, col. (a), then ETIP transfers, if any)
								</th>
								<th class="styTableCellHeader" style="width:118mm;font-weight:normal;" scope="col" >
									<strong>(b)</strong><br />Description <br /> (only for ETIP transfers)
								</th>
								<th class="styTableCellHeader" style="width:36mm;font-weight:normal;" scope="col" >
									<strong>(c)</strong><br />Value (from Schedule A, Part 2, col. (g), or close of ETIP described in col. (b))
								</th>
								<th class="styTableCellHeader" style="width:36mm;font-weight:normal;" scope="col" >
									<strong>(d)</strong><br />Nontaxable portion of transfer
								</th>
								<th class="styTableCellHeader" style="width:36mm;font-weight:normal;border-right-width:0px;" scope="col" >
									<strong>(e)</strong><br />Net transfer (subtract <br /> col. (d) from col. (c))
								</th>
							</tr>
						</thead>
						<tbody>
							<xsl:for-each select="$FormData/DonorGSTNAGrp">
								<tr style="vertical-align:bottom;">
									<td class="styTableCellCtrInherit" style="font-weight:bold;">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="ItemNum"/>
										</xsl:call-template>
									</td>
									<td class="styTableCellTextInherit">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="ETIPDesc"/>
										</xsl:call-template>
									</td>
									<td class="styTableCellAmtInherit">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="GiftFMVOnDateOrETIPCloseAmt"/>
										</xsl:call-template>
									</td>
									<td class="styTableCellAmtInherit">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="NontaxableTransferPortionAmt"/>
										</xsl:call-template>
									</td>
									<td class="styTableCellAmtInherit" style="border-right-width:0px;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="NetTransferAmt"/>
										</xsl:call-template>
									</td>
								</tr>
							</xsl:for-each>
							<xsl:if test="count($FormData/DonorGSTNAGrp) &lt; 22">
								<xsl:call-template name="FillPage9Table">
									<xsl:with-param name="LineNumber" select="count($FormData/DonorGSTNAGrp) + 1"/>
								</xsl:call-template>
							</xsl:if>
						</tbody>
					</table>
				</div>
				<div class="styStdDivLS pageEnd" style="border-top:1px solid black;text-align:right;">
					<span class="styGenericDiv" style="font-style:italic;">(If more space is needed, attach additional statements.)</span>
					Form <span class="styBoldText" style="font-size:8pt;">709-NA</span> (2025)
				</div>
				<div class="styStdDivLS">
					Form 709-NA (2025)
					<span style="float:right;">
						Page <span style="font-weight:bold;font-size:9pt;">8</span>
					</span>
				</div>
				<!-- Part II Header -->
				<div class="styStdDivLS" style="border-top:1px solid black;">
					<span class="styPartName" style="width:25mm;">SCHEDULE D</span>
					<span class="styPartDesc" style="width:230mm;">
						Computation of Generation-Skipping Transfer Tax 
						<span style="font-weight:normal;font-style:italic;">(continued)</span>
					</span>
				</div>
				<div class="styStdDivLS" style="border-top:1px solid black;border-bottom:1px solid black;">
					<div class="styLNDesc" style="width:100%;font-weight:bold;">
						Part 2 &mdash; GST Exemption Reconciliation (Section 2631)
					</div>
				</div>
				<div class="styStdDivLS">
					<div class="styLNDesc" style="width:215mm;">
						Complete items 1-8 below if any gifts are listed on Schedule A, Parts 2 or 3 (direct skips, indirect skips, and other transfer in trust).
					</div>
					<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;">&nbsp;</div>
					<div class="styLNAmountBoxNBB">&nbsp;</div>
				</div>
				<!-- Sch D, Part 2, Line 1 -->
				<div class="styStdDivLS">
					<div class="styLNLeftNumBoxSD">1</div>
					<div class="styLNDesc" style="width:207mm;">
						Maximum allowable exemption (see instructions)
						<span class="sty709NADotLn">....................................</span>
					</div>
					<div class="styLNRightNumBox">1</div>
					<div class="styLNAmountBox">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/MaximumAllowableExemptionAmt"/>
						</xsl:call-template>
					</div>
				</div>
				<!-- Sch D, Part 2, Line 2 -->
				<div class="styStdDivLS">
					<div class="styLNLeftNumBoxSD">2</div>
					<div class="styLNDesc" style="width:207mm;">
						Total exemption used for periods before filing this return
						<span class="sty709NADotLn">.................................</span>
					</div>
					<div class="styLNRightNumBox">2</div>
					<div class="styLNAmountBox">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/ExemptionPrevUsedAmt"/>
						</xsl:call-template>
					</div>
				</div>
				<!-- Sch D, Part 2, Line 3 -->
				<div class="styStdDivLS">
					<div class="styLNLeftNumBoxSD">3</div>
					<div class="styLNDesc" style="width:207mm;">
						Exemption available for this return. Subtract line 2 from line 1
						<span class="sty709NADotLn">...............................</span>
					</div>
					<div class="styLNRightNumBox">3</div>
					<div class="styLNAmountBox">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/AvailableExemptionAmt"/>
						</xsl:call-template>
					</div>
				</div>
				<!-- Sch D, Part 2, Line 4 -->
				<div class="styStdDivLS">
					<div class="styLNLeftNumBoxSD">4</div>
					<div class="styLNDesc" style="width:207mm;">
						Exemption claimed on this return from Part 3, column (c), total below
						<span class="sty709NADotLn">.............................</span>
					</div>
					<div class="styLNRightNumBox">4</div>
					<div class="styLNAmountBox">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/TotalGSTExemptionClaimedAmt"/>
						</xsl:call-template>
					</div>
				</div>
				<!-- Sch D, Part 2, Line 5 -->
				<div class="styStdDivLS">
					<div class="styLNLeftNumBoxSD">5</div>
					<div class="styLNDesc" style="width:207mm;height:auto;">
						Automatic allocation of exemption to transfers reported on Schedule A, Part 3. To opt out of the automatic allocation rules, you must attach an <strong>"Election Out"</strong> <br />
						statement. See instructions
						<xsl:call-template name="SetFormLinkInline">
							<xsl:with-param name="TargetNode" select="$FormData/AutomaticAllocExemptTrnsfrAmt"/>
						</xsl:call-template>
						<span class="sty709NADotLn">.........................................</span>
					</div>
					<div class="styLNRightNumBox" style="height:7.4mm;"><br />5</div>
					<div class="styLNAmountBox" style="height:7.4mm;"><br />
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/AutomaticAllocExemptTrnsfrAmt"/>
						</xsl:call-template>
					</div>
				</div>
				<!-- Sch D, Part 2, Line 6 -->
				<div class="styStdDivLS">
					<div class="styLNLeftNumBoxSD">6</div>
					<div class="styLNDesc" style="width:207mm;">
						Exemption allocated to transfers not shown on line 4 or line 5 above. <strong>You must attach a "Notice of Allocation."</strong> See instructions
						<xsl:call-template name="SetFormLinkInline">
							<xsl:with-param name="TargetNode" select="$FormData/ExemptionAllocatedOthTrnsfrAmt"/>
						</xsl:call-template>
						<span class="sty709NADotLn">.........</span>
					</div>
					<div class="styLNRightNumBox">6</div>
					<div class="styLNAmountBox">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/ExemptionAllocatedOthTrnsfrAmt"/>
						</xsl:call-template>
					</div>
				</div>
				<!-- Sch D, Part 2, Line 7 -->
				<div class="styStdDivLS">
					<div class="styLNLeftNumBoxSD">7</div>
					<div class="styLNDesc" style="width:207mm;">
						Add lines 4, 5, and 6
						<span class="sty709NADotLn">............................................</span>
					</div>
					<div class="styLNRightNumBox">7</div>
					<div class="styLNAmountBox">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/TotalExemptionAmt"/>
						</xsl:call-template>
					</div>
				</div>
				<!-- Sch D, Part 2, Line 8 -->
				<div class="styStdDivLS">
					<div class="styLNLeftNumBoxSD">8</div>
					<div class="styLNDesc" style="width:207mm;">
						Exemption available for future transfers. Subtract line 7 from line 3
						<span class="sty709NADotLn">..............................</span>
					</div>
					<div class="styLNRightNumBoxNBB">8</div>
					<div class="styLNAmountBoxNBB">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/FutureTransfersExemptionAmt"/>
						</xsl:call-template>
					</div>
				</div>
				<div class="styStdDivLS" style="border-top:1px solid black;border-bottom:1px solid black;">
					<div class="styLNDesc" style="width:100%;font-weight:bold;">
						Part 3 &mdash; Tax Computation
					</div>
				</div>
				<div class="styTableContainerLandscapeNBB" id="schDp3table1">
					<xsl:call-template name="SetInitialState"/>
					<table class="styTable" style="border-collapse:collapse;font-size:7pt;">
						<thead class="styTableThead">
							<tr>
								<th class="styTableCellHeader" style="width:28mm;font-weight:normal;" scope="col" >
									<strong>(a)</strong><br />Item number <br /> from Schedule D, <br />Part 1, col. (a)
								</th>
								<th class="styTableCellHeader" style="width:38mm;font-weight:normal;" scope="col" >
									<strong>(b)</strong><br />Net transfer <br /> (from Schedule D, <br />Part 1, col. (e))
								</th>
								<th class="styTableCellHeader" style="width:38mm;font-weight:normal;" scope="col" >
									<strong>(c)</strong><br />GST exemption allocated
								</th>
								<th class="styTableCellHeader" style="width:38mm;font-weight:normal;" scope="col" >
									<strong>(d)</strong><br />Divide col. (c) <br /> by col. (b)
								</th>
								<th class="styTableCellHeader" style="width:38mm;font-weight:normal;" scope="col" >
									<strong>(e)</strong><br />Inclusion ratio <br /> (Subtract col. (d) <br /> from 1.000)
								</th>
								<th class="styTableCellHeader" style="width:38mm;font-weight:normal;" scope="col" >
									<strong>(f)</strong><br />Applicable rate <br /> (multiply col. (e) <br /> by 40% (0.40))
								</th>
								<th class="styTableCellHeader" style="width:38mm;font-weight:normal;border-right-width:0px;" scope="col" >
									<strong>(g)</strong><br />Generation-skipping <br />transfer tax <br /> (multiply col. (b) <br /> by col. (f))
								</th>
							</tr>
						</thead>
						<tbody>
							<xsl:for-each select="$FormData/DonorGSTNAGrp">
								<tr style="vertical-align:bottom;">
									<td class="styTableCellCtrInherit" style="font-weight:bold;">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="ItemNum"/>
										</xsl:call-template>
									</td>
									<td class="styTableCellAmtInherit">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="NetTransferAmt"/>
										</xsl:call-template>
									</td>
									<td class="styTableCellAmtInherit">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="GSTExemptionAllocatedAmt"/>
										</xsl:call-template>
									</td>
									<td class="styTableCellAmtInherit">
										<xsl:call-template name="PopulatePercent">
											<xsl:with-param name="TargetNode" select="GSTExemptNetTrnsfrCmptPct"/>
										</xsl:call-template>
									</td>
									<td class="styTableCellAmtInherit">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="InclusionRt"/>
										</xsl:call-template>
									</td>
									<td class="styTableCellAmtInherit">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="ApplicableRt"/>
										</xsl:call-template>
									</td>
									<td class="styTableCellAmtInherit" style="border-right-width:0px;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="GSTTaxAmt"/>
										</xsl:call-template>
									</td>
								</tr>
							</xsl:for-each>
							<xsl:if test="count($FormData/DonorGSTNAGrp) &lt; 15">
								<xsl:call-template name="FillPage10Table">
									<xsl:with-param name="LineNumber" select="count($FormData/DonorGSTNAGrp) + 1"/>
								</xsl:call-template>
							</xsl:if>
						</tbody>
					</table>
				</div>
				<div class="styStdIBDivLS">
					<div class="styLNDesc" style="width:65.9mm;height:auto;padding-top:1.5mm;"><br />
						Total exemption claimed. Enter here and on Part 2, line 4, above. May not exceed Part 2, line 3, above
						<!--<span class="sty709NADotLn">....</span>-->
					</div>
					<div class="styLNAmountBoxNBB" style="width:37.9mm;height:11mm;padding-right:0.5mm;"><br /><br />
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/TotalGSTExemptionClaimedAmt"/>
						</xsl:call-template>
					</div>
					<div class="styLNAmountBoxNBB" style="width:38.1mm;height:11mm;background-color:lightgrey;border-right-width:1px;">&nbsp;</div>
					<div class="styLNDesc" style="width:76mm;height:auto;padding-top:1.5mm;padding-left:1.5mm;">
						<strong>Total generation-skipping transfer tax.</strong> Enter here; also on Schedule A, Part 4, line 10; and on Part 2&mdash;Tax Computation, line 11
						<span class="sty709NADotLn">...........</span>
					</div>
					<div class="styLNAmountBoxNBB" style="width:37mm;height:11mm;"><br /><br />
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/TotalGSTTaxAmt"/>
						</xsl:call-template>
					</div>
				</div>
				<div class="styStdDivLS pageEnd" style="border-top:1px solid black;text-align:right;">
					<span class="styGenericDiv" style="font-style:italic;">(If more space is needed, attach additional statements.)</span>
					Form <span class="styBoldText" style="font-size:8pt;">709-NA</span> (2025)
				</div>
				<br/><br/>
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
				</table>
				<br/>
			</body>
		</html>
	</xsl:template>
	
	<!--Schedule A Part 1-->
	<xsl:template name="FillPage2Table">
		<xsl:param name="LineNumber"/>
		<xsl:param name="MaxLine" select="16"/>
		<tr style="font-size:7pt;vertical-align:bottom;min-height:7mm;">
		    <td class="styTableCellCtrInherit">&nbsp;</td>
			<td class="styTableCellTextInherit">&nbsp;</td>
			<td class="styTableCellTextInherit">&nbsp;</td>
			<td class="styTableCellTextInherit">&nbsp;</td>
			<td class="styTableCellCtrInherit">&nbsp;</td>
			<td class="styTableCellAmtInherit">&nbsp;</td>
			<td class="styTableCellAmtInherit">&nbsp;</td>
			<td class="styTableCellCtrInherit">
				<input type="checkbox" class="styCkboxNM" style="">
					<xsl:attribute name="aria-label">Item <xsl:value-of select="$LineNumber"/>Deductible Charitable Gift</xsl:attribute>
					<xsl:call-template name="PopulateCheckbox">
						<xsl:with-param name="TargetNode" select="/.."/>
						<xsl:with-param name="BackupName">F709/DeductibleCharitableGiftInd<xsl:number value="$LineNumber"/></xsl:with-param>
					</xsl:call-template>
				</input>
			</td>
			<td class="styTableCellCtrInherit">
				<input type="checkbox" class="styCkboxNM" style="">
					<xsl:attribute name="aria-label">Item <xsl:value-of select="$LineNumber"/>Deductible Gift to Spouse</xsl:attribute>
					<xsl:call-template name="PopulateCheckbox">
						<xsl:with-param name="TargetNode" select="/.."/>
						<xsl:with-param name="BackupName">F709/DeductibleGiftSpouseInd<xsl:number value="$LineNumber"/></xsl:with-param>
					</xsl:call-template>
				</input>
			</td>
			<td class="styTableCellCtrInherit" style="border-right-width:0px;">
				<input type="checkbox" class="styCkboxNM" style="">
					<xsl:attribute name="aria-label">Item <xsl:value-of select="$LineNumber"/>Section 2652 a 3 Election</xsl:attribute>
					<xsl:call-template name="PopulateCheckbox">
						<xsl:with-param name="TargetNode" select="/.."/>
						<xsl:with-param name="BackupName">F709/P1/Section2652a3ElectionInd<xsl:number value="$LineNumber"/></xsl:with-param>
					</xsl:call-template>
				</input>
			</td>
		</tr>
		<xsl:if test="$LineNumber &lt; $MaxLine">
			<xsl:call-template name="FillPage2Table">
				<xsl:with-param name="LineNumber" select="$LineNumber + 1"/>
				<xsl:with-param name="MaxLine" select="$MaxLine"/>
			</xsl:call-template>
		</xsl:if>
	</xsl:template>
	
	<xsl:template name="FillPage4Table">
		<xsl:param name="LineNumber"/>
		<xsl:param name="MaxLine" select="16"/>
		<tr style="font-size:7pt;vertical-align:bottom;min-height:7mm;">
		    <td class="styTableCellCtrInherit">&nbsp;</td>
			<td class="styTableCellTextInherit">&nbsp;</td>
			<td class="styTableCellTextInherit">&nbsp;</td>
			<td class="styTableCellCtrInherit">&nbsp;</td>
			<td class="styTableCellAmtInherit">&nbsp;</td>
			<td class="styTableCellAmtInherit">&nbsp;</td>
			<td class="styTableCellTextInherit">&nbsp;</td>
						<td class="styTableCellCtrInherit">
				<input type="checkbox" class="styCkboxNM" style="" disabled="disabled">
					<xsl:attribute name="aria-label">Item <xsl:value-of select="$LineNumber"/>Deductible charitable gift</xsl:attribute>
					<xsl:call-template name="PopulateCheckbox">
						<xsl:with-param name="TargetNode" select="/.."/>
						<xsl:with-param name="BackupName">F709/P2/CharitableGiftInd<xsl:number value="$LineNumber"/></xsl:with-param>
					</xsl:call-template>
				</input>
			</td>
			<td class="styTableCellCtrInherit">
				<input type="checkbox" class="styCkboxNM" style="" disabled="disabled">
					<xsl:attribute name="aria-label">Item <xsl:value-of select="$LineNumber"/>Deductible gift to spouse</xsl:attribute>
					<xsl:call-template name="PopulateCheckbox">
						<xsl:with-param name="TargetNode" select="/.."/>
						<xsl:with-param name="BackupName">F709/P2/Section2632bElectionOutInd<xsl:number value="$LineNumber"/></xsl:with-param>
					</xsl:call-template>
				</input>
			</td>
			<td class="styTableCellCtrInherit">
				<input type="checkbox" class="styCkboxNM" style="" disabled="disabled">
					<xsl:attribute name="aria-label">Item <xsl:value-of select="$LineNumber"/>Section 2652(a)(3) election</xsl:attribute>
					<xsl:call-template name="PopulateCheckbox">
						<xsl:with-param name="TargetNode" select="/.."/>
						<xsl:with-param name="BackupName">F709/P2/Section2652a3ElectionInd<xsl:number value="$LineNumber"/></xsl:with-param>
					</xsl:call-template>
				</input>
			</td>
			<td class="styTableCellCtrInherit" style="border-right-width:0px;">
				<input type="checkbox" class="styCkboxNM" style="">
					<xsl:attribute name="aria-label">Item <xsl:value-of select="$LineNumber"/>Section 2652(b) election out</xsl:attribute>
					<xsl:call-template name="PopulateCheckbox">
						<xsl:with-param name="TargetNode" select="/.."/>
						<xsl:with-param name="BackupName">F709/P2/Section2652a3ElectionInd<xsl:number value="$LineNumber"/></xsl:with-param>
					</xsl:call-template>
				</input>
			</td>
		</tr>
		<xsl:if test="$LineNumber &lt; $MaxLine">
			<xsl:call-template name="FillPage4Table">
				<xsl:with-param name="LineNumber" select="$LineNumber + 1"/>
				<xsl:with-param name="MaxLine" select="$MaxLine"/>
			</xsl:call-template>
		</xsl:if>
	</xsl:template>
	<xsl:template name="FillPage5Table">
		<xsl:param name="LineNumber"/>
		<xsl:param name="MaxLine" select="16"/>
		<tr style="font-size:7pt;vertical-align:bottom;min-height:7mm;">
		    <td class="styTableCellCtrInherit">&nbsp;</td>
			<td class="styTableCellTextInherit">&nbsp;</td>
			<td class="styTableCellTextInherit">&nbsp;</td>
			<td class="styTableCellCtrInherit">&nbsp;</td>
			<td class="styTableCellAmtInherit">&nbsp;</td>
			<td class="styTableCellAmtInherit">&nbsp;</td>
			
			<td class="styTableCellTextInherit">&nbsp;</td>
						<td class="styTableCellCtrInherit">
				<input type="checkbox" class="styCkboxNM" style="">
					<xsl:attribute name="aria-label">Item <xsl:value-of select="$LineNumber"/>Deductible charitable gift</xsl:attribute>
					<xsl:call-template name="PopulateCheckbox">
						<xsl:with-param name="TargetNode" select="/.."/>
						<xsl:with-param name="BackupName">F709/P3/CharitableGiftInd<xsl:number value="$LineNumber"/></xsl:with-param>
					</xsl:call-template>
				</input>
			</td>
			<td class="styTableCellCtrInherit">
				<input type="checkbox" class="styCkboxNM" style="">
					<xsl:attribute name="aria-label">Item <xsl:value-of select="$LineNumber"/>Deductible gift to spouse</xsl:attribute>
					<xsl:call-template name="PopulateCheckbox">
						<xsl:with-param name="TargetNode" select="/.."/>
						<xsl:with-param name="BackupName">F709/P3/Section2632cElectionOutInd<xsl:number value="$LineNumber"/></xsl:with-param>
					</xsl:call-template>
				</input>
			</td>
			<td class="styTableCellCtrInherit">
				<input type="checkbox" class="styCkboxNM" style="">
					<xsl:attribute name="aria-label">Item <xsl:value-of select="$LineNumber"/>Section 2652(a)(3) election</xsl:attribute>
					<xsl:call-template name="PopulateCheckbox">
						<xsl:with-param name="TargetNode" select="/.."/>
						<xsl:with-param name="BackupName">F709/P3/Section2652a3ElectionInd<xsl:number value="$LineNumber"/></xsl:with-param>
					</xsl:call-template>
				</input>
			</td>
			<td class="styTableCellCtrInherit" style="border-right-width:0px;">
				<input type="checkbox" class="styCkboxNM" style="">
					<xsl:attribute name="aria-label">Item <xsl:value-of select="$LineNumber"/>Section 2632(c) election</xsl:attribute>
					<xsl:call-template name="PopulateCheckbox">
						<xsl:with-param name="TargetNode" select="/.."/>
						<xsl:with-param name="BackupName">F709/P3/Section2652a3ElectionInd<xsl:number value="$LineNumber"/></xsl:with-param>
					</xsl:call-template>
				</input>
			</td>
		</tr>
		<xsl:if test="$LineNumber &lt; $MaxLine">
			<xsl:call-template name="FillPage5Table">
				<xsl:with-param name="LineNumber" select="$LineNumber + 1"/>
				<xsl:with-param name="MaxLine" select="$MaxLine"/>
			</xsl:call-template>
		</xsl:if>
	</xsl:template>
	<xsl:template name="FillPage7Table">
		<xsl:param name="LineNumber"/>
		<xsl:param name="MaxLine" select="31"/>
		<tr style="font-size:7pt;vertical-align:bottom;">
			<td class="styTableCellCtrInherit">&nbsp;</td>
			<td class="styTableCellAmtInherit">&nbsp;</td>
			<td class="styTableCellAmtInherit">&nbsp;</td>
			<td class="styTableCellAmtInherit">&nbsp;</td>
			<td class="styTableCellAmtInherit" style="border-right-width:0px;">&nbsp;</td>
		</tr>
		<xsl:if test="$LineNumber &lt; $MaxLine">
			<xsl:call-template name="FillPage7Table">
				<xsl:with-param name="LineNumber" select="$LineNumber + 1"/>
				<xsl:with-param name="MaxLine" select="$MaxLine"/>
			</xsl:call-template>
		</xsl:if>
	</xsl:template>
	<xsl:template name="FillPage8Table">
		<xsl:param name="LineNumber"/>
		<xsl:param name="MaxLine" select="6"/>
		<tr style="font-size:7pt;vertical-align:bottom;">
			<td class="styTableCellCtrInherit">&nbsp;</td>
			<td class="styTableCellAmtInherit">&nbsp;</td>
			<td class="styTableCellAmtInherit">&nbsp;</td>
			<td class="styTableCellAmtInherit">&nbsp;</td>
			<td class="styTableCellAmtInherit">&nbsp;</td>
			<td class="styTableCellAmtInherit">&nbsp;</td>
			<td class="styTableCellAmtInherit" style="border-right-width:0px;">&nbsp;</td>
		</tr>
		<xsl:if test="$LineNumber &lt; $MaxLine">
			<xsl:call-template name="FillPage8Table">
				<xsl:with-param name="LineNumber" select="$LineNumber + 1"/>
				<xsl:with-param name="MaxLine" select="$MaxLine"/>
			</xsl:call-template>
		</xsl:if>
	</xsl:template>
	<xsl:template name="FillPage9Table">
		<xsl:param name="LineNumber"/>
		<xsl:param name="MaxLine" select="22"/>
		<tr style="font-size:7pt;vertical-align:bottom;height:5mm;">
			<td class="styTableCellCtrInherit" style="font-weight:bold;">
				<xsl:choose>
					<xsl:when test="$LineNumber = 1">1</xsl:when>
					<xsl:otherwise>&nbsp;</xsl:otherwise>
				</xsl:choose>
			</td>
			<td class="styTableCellAmtInherit">&nbsp;</td>
			<td class="styTableCellAmtInherit">&nbsp;</td>
			<td class="styTableCellAmtInherit">&nbsp;</td>
			<td class="styTableCellAmtInherit" style="border-right-width:0px;">&nbsp;</td>
		</tr>
		<xsl:if test="$LineNumber &lt; $MaxLine">
			<xsl:call-template name="FillPage9Table">
				<xsl:with-param name="LineNumber" select="$LineNumber + 1"/>
				<xsl:with-param name="MaxLine" select="$MaxLine"/>
			</xsl:call-template>
		</xsl:if>
	</xsl:template>
	<xsl:template name="FillPage10Table">
		<xsl:param name="LineNumber"/>
		<xsl:param name="MaxLine" select="15"/>
		<tr style="font-size:7pt;vertical-align:bottom;height:5mm;">
			<td class="styTableCellCtrInherit" style="font-weight:bold;">
				<xsl:choose>
					<xsl:when test="$LineNumber = 1">1</xsl:when>
					<xsl:otherwise>&nbsp;</xsl:otherwise>
				</xsl:choose>
			</td>
			<td class="styTableCellAmtInherit">&nbsp;</td>
			<td class="styTableCellAmtInherit">&nbsp;</td>
			<td class="styTableCellAmtInherit">&nbsp;</td>
			<td class="styTableCellAmtInherit">&nbsp;</td>
			<td class="styTableCellAmtInherit">&nbsp;</td>
			<td class="styTableCellAmtInherit" style="border-right-width:0px;">&nbsp;</td>
		</tr>
		<xsl:if test="$LineNumber &lt; $MaxLine">
			<xsl:call-template name="FillPage10Table">
				<xsl:with-param name="LineNumber" select="$LineNumber + 1"/>
				<xsl:with-param name="MaxLine" select="$MaxLine"/>
			</xsl:call-template>
		</xsl:if>
	</xsl:template>
</xsl:stylesheet>