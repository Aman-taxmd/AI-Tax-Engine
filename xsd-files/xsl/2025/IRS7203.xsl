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
	<xsl:include href="IRS7203Style.xsl"/>
	<xsl:output method="html" indent="yes"/>
	<xsl:strip-space elements="*"/>
	<xsl:param name="FormData" select="$RtnDoc/IRS7203"/>
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
				<meta name="Description" content="IRS Form 7203"/>
				<script language="JavaScript" src="{$ScriptPath}/FormDisplay.js" type="text/javascript"/>
				<xsl:call-template name="InitJS"/>
				<style type="text/css">
					<xsl:if test="not($Print) or $Print=''">
						<xsl:call-template name="AddOnStyle"/>
						<xsl:call-template name="IRS7203Style"/>
					</xsl:if>
				</style>
				<xsl:call-template name="GlobalStylesForm"/>
			</head>
			<body class="styBodyClass">
				<form id="Form7203">
					<xsl:call-template name="DocumentHeader"/>
					<!-- Page 1 -->
					<!-- Header -->
					<div class="sty7203LineDiv">
						<div class="styFNBox" style="width:30mm;height:20.5mm;">
							Form <span class="styFN" style="font-size:18pt;">7203</span> 
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$FormData"/>
							</xsl:call-template>
							<br/>
							(Rev. December 2022)
							<br/><br />
							<span class="styAgency">
								Department of the Treasury
								<br/>
								Internal Revenue Service
							</span>
						</div>
						<div class="styFTBox" style="width:127mm;height:20.5mm;">
							<span class="styFMT" style="font-size:12pt;padding-top:1mm;padding-bottom:1mm;">
								S Corporation Shareholder Stock and <br />
								Debt Basis Limitations
							</span>
							<br/>
							<span style="font-weight:bold;">
								<img src="{$ImagePath}/Small_Right_Pointing_Arrow.gif" alt="Right Arrow Image"/> Attach to your tax return.
							</span>
							<br/>
							<span style="font-weight:bold;">
								<img src="{$ImagePath}/Small_Right_Pointing_Arrow.gif" alt="Right Arrow Image"/> Go to
								<i>www.irs.gov/Form7203</i>
								for instructions and the latest information.
							</span>
						</div>
						<div class="styTYBox" style="width:30mm;height:20.5mm;">
							<div class="styOMB" style="height:10mm;font-size:7pt;padding-top:3mm;">OMB No. 1545-2302</div>
							<div style="margin-left:2mm;text-align:left;font-size:7pt;padding-top:2mm;">
								Attachment<br/>Sequence No. 
								<span class="styBoldText" style="font-size:9pt;">203</span>
							</div>
						</div>
					</div>
					<!-- Filer information section -->
					<div class="sty7203LineDiv" style="border-top:2px solid black;">
						<div class="styNameBox" style="width:135mm;">
							<span style="width:0.5mm;height:1mm;"/> Name of shareholder <br/>
							<xsl:choose>
								<xsl:when test="$FormData/ShareholderBusinessName">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$FormData/ShareholderBusinessName/BusinessNameLine1Txt"/>
									</xsl:call-template>
									<br />
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$FormData/ShareholderBusinessName/BusinessNameLine2Txt"/>
									</xsl:call-template>
								</xsl:when>
								<xsl:otherwise>
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$FormData/ShareholderPersonNm"/>
									</xsl:call-template>
								</xsl:otherwise>
							</xsl:choose>
						</div>
						<div class="styEINBox" style="width:52mm;padding-left:0.5mm;font-weight:normal;">
							<span style="width:0.5mm;height:1mm;"/> <strong> Identifying number</strong>
							<br/>
							<xsl:choose>
								<xsl:when test="$FormData/ShareholderEIN">
									<xsl:call-template name="PopulateEIN">
										<xsl:with-param name="TargetNode" select="$FormData/ShareholderEIN"/>
									</xsl:call-template>
								</xsl:when>
								<xsl:otherwise>
									<xsl:call-template name="PopulateSSN">
										<xsl:with-param name="TargetNode" select="$FormData/ShareholderSSN"/>
									</xsl:call-template>
								</xsl:otherwise>
							</xsl:choose>
						</div>
					</div>
					<div class="sty7203LineDiv" style="border-top:1px solid black;">
						<div class="styNameBox" style="width:135mm;">
							<span style="font-weight:bold;width:3mm;font-size:7pt;">A</span> Name of S corporation <br/>
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/SCorporationName/BusinessNameLine1Txt"/>
							</xsl:call-template>
							<br />
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/SCorporationName/BusinessNameLine2Txt"/>
							</xsl:call-template>
						</div>
						<div class="styEINBox" style="width:52mm;padding-left:0.5mm;font-weight:normal;">
							<span style="font-weight:bold;width:3mm;font-size:7pt;">B</span> Employer identification number
							<br/>
							<xsl:call-template name="PopulateEIN">
								<xsl:with-param name="TargetNode" select="$FormData/SCorporationEIN"/>
							</xsl:call-template>
						</div>
					</div>
					<div class="sty7203LineDiv" style="border-top:1px solid black;padding:0.5mm 0px;">
						<span style="font-weight:bold;width:3mm;">C</span> Stock block (see instructions) &#9658;
						<xsl:call-template name="PopulateText">
							<xsl:with-param name="TargetNode" select="$FormData/StockBlockDesc"/>
						</xsl:call-template>
					</div>
					<div class="sty7203LineDiv" style="border-top:1px solid black;padding:0.5mm 0px;">
						<span style="font-weight:bold;width:3mm;">D</span> 
						Check applicable box(es) to indicate how stock was acquired: <br />
						<span style="width:1mm;height:1mm;"/><span style="font-weight:bold;width:7.5mm;text-align:right;">(1)</span> 
						<input type="checkbox" class="styCkboxNM" style="margin:0px 2px;" alt="Original shareholder">
							<xsl:call-template name="PopulateCheckbox">
								<xsl:with-param name="TargetNode" select="$FormData/OriginalShareholderInd"/>
							</xsl:call-template>
						</input>
						Original shareholder 
						<span style="font-weight:bold;width:7.5mm;text-align:right;">(2)</span> 
						<input type="checkbox" class="styCkboxNM" style="margin:0px 2px;" alt="Purchased">
							<xsl:call-template name="PopulateCheckbox">
								<xsl:with-param name="TargetNode" select="$FormData/PurchasedInd"/>
							</xsl:call-template>
						</input>
						Purchased 
						<span style="font-weight:bold;width:7.5mm;text-align:right;">(3)</span> 
						<input type="checkbox" class="styCkboxNM" style="margin:0px 2px;" alt="Inherited">
							<xsl:call-template name="PopulateCheckbox">
								<xsl:with-param name="TargetNode" select="$FormData/InheritedInd"/>
							</xsl:call-template>
						</input>
						Inherited 
						<span style="font-weight:bold;width:7.5mm;text-align:right;">(4)</span> 
						<input type="checkbox" class="styCkboxNM" style="margin:0px 2px;" alt="Gift">
							<xsl:call-template name="PopulateCheckbox">
								<xsl:with-param name="TargetNode" select="$FormData/GiftInd"/>
							</xsl:call-template>
						</input>
						Gift 
						<span style="font-weight:bold;width:7.5mm;text-align:right;">(5)</span> 
						<input type="checkbox" class="styCkboxNM" style="margin:0px 2px;" alt="Other">
							<xsl:call-template name="PopulateCheckbox">
								<xsl:with-param name="TargetNode" select="$FormData/StockAcquiredOtherGrp/OtherInd"/>
							</xsl:call-template>
						</input>
						Other 
						<span style="min-height:3.2mm;border-bottom:1px solid black;width:55mm;">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/StockAcquiredOtherGrp/OtherTxt"/>
							</xsl:call-template>
						</span>
					</div>
					<div class="sty7203LineDiv" style="border-top:1px solid black;padding:0.5mm 0px;">
						<span style="font-weight:bold;width:3mm;">E</span> 
						<input type="checkbox" class="styCkboxNM" style="margin:0px 4px;" alt="Section 1.1367 dash 1 g election">
							<xsl:call-template name="PopulateCheckbox">
								<xsl:with-param name="TargetNode" select="$FormData/Section113671gElectionInd"/>
							</xsl:call-template>
						</input>
						Check if you have a Regulations section 1.1367-1(g) election in effect during the tax year for this S corporation.
					</div>
					<div class="sty7203LineDiv" style="border-top:1px solid black;border-bottom:1px solid black;">
						<div class="styPartName">Part I</div>
						<div class="styPartDesc">Shareholder Stock Basis</div>
					</div>
					<!-- Line 1 -->
					<div class="sty7203LineDiv" style="">
						<div class="styLNLeftNumBoxSD">1</div>
						<div class="styLNDesc" style="">
							Stock basis at the beginning of the corporation's tax year
							<span class="sty8995ASchADotLn">................</span>
						</div>
						<div class="styLNRightNumBox">1</div>
						<div class="styLNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/StockBasisBeginTaxYearAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 2 -->
					<div class="sty7203LineDiv" style="">
						<div class="styLNLeftNumBoxSD">2</div>
						<div class="styLNDesc" style="">
							Basis from any capital contributions made or additional stock acquired during the tax year
							<span class="sty8995ASchADotLn">.....</span>
						</div>
						<div class="styLNRightNumBox">2</div>
						<div class="styLNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CapitalContributionBasisAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 3a -->
					<div class="sty7203LineDiv" style="">
						<div class="styLNLeftNumBoxSD">3a</div>
						<div class="styLNDesc" style="width:98mm;">
							Ordinary business income (enter losses in Part III)
							<span class="sty8995ASchADotLn">........</span>
						</div>
						<div class="styLNRightNumBox">3a</div>
						<div class="styLNAmountBox" style="padding:0.5mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/OrdinaryBusinessIncomeAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;">&nbsp;</div>
						<div class="styLNAmountBoxNBB" style="background-color:lightgrey;">&nbsp;</div>
					</div>
					<!-- Line 3b -->
					<div class="sty7203LineDiv" style="">
						<div class="styLNLeftNumBoxSD" style="padding-left:4.2mm;">b</div>
						<div class="styLNDesc" style="width:98mm;">
							Net rental real estate income (enter losses in Part III)
							<span class="sty8995ASchADotLn">.......</span>
						</div>
						<div class="styLNRightNumBox">3b</div>
						<div class="styLNAmountBox" style="padding:0.5mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/NetRentalRealEstateIncomeAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;">&nbsp;</div>
						<div class="styLNAmountBoxNBB" style="background-color:lightgrey;">&nbsp;</div>
					</div>
					<!-- Line 3c -->
					<div class="sty7203LineDiv" style="">
						<div class="styLNLeftNumBoxSD" style="padding-left:4.2mm;">c</div>
						<div class="styLNDesc" style="width:98mm;">
							Other net rental income (enter losses in Part III)
							<span class="sty8995ASchADotLn">........</span>
						</div>
						<div class="styLNRightNumBox">3c</div>
						<div class="styLNAmountBox" style="padding:0.5mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/OtherNetRentalIncomeAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;">&nbsp;</div>
						<div class="styLNAmountBoxNBB" style="background-color:lightgrey;">&nbsp;</div>
					</div>
					<!-- Line 3d -->
					<div class="sty7203LineDiv" style="">
						<div class="styLNLeftNumBoxSD" style="padding-left:4.2mm;">d</div>
						<div class="styLNDesc" style="width:98mm;">
							Interest income
							<span class="sty8995ASchADotLn">...................</span>
						</div>
						<div class="styLNRightNumBox">3d</div>
						<div class="styLNAmountBox" style="padding:0.5mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/InterestIncomeAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;">&nbsp;</div>
						<div class="styLNAmountBoxNBB" style="background-color:lightgrey;">&nbsp;</div>
					</div>
					<!-- Line 3e -->
					<div class="sty7203LineDiv" style="">
						<div class="styLNLeftNumBoxSD" style="padding-left:4.2mm;">e</div>
						<div class="styLNDesc" style="width:98mm;">
							Ordinary dividends
							<span class="sty8995ASchADotLn">..................</span>
						</div>
						<div class="styLNRightNumBox">3e</div>
						<div class="styLNAmountBox" style="padding:0.5mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/OrdinaryIncomeAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;">&nbsp;</div>
						<div class="styLNAmountBoxNBB" style="background-color:lightgrey;">&nbsp;</div>
					</div>
					<!-- Line 3f -->
					<div class="sty7203LineDiv" style="">
						<div class="styLNLeftNumBoxSD" style="padding-left:4.2mm;">f</div>
						<div class="styLNDesc" style="width:98mm;">
							Royalties
							<span class="sty8995ASchADotLn">....................</span>
						</div>
						<div class="styLNRightNumBox">3f</div>
						<div class="styLNAmountBox" style="padding:0.5mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/RoyaltiesAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;">&nbsp;</div>
						<div class="styLNAmountBoxNBB" style="background-color:lightgrey;">&nbsp;</div>
					</div>
					<!-- Line 3g -->
					<div class="sty7203LineDiv" style="">
						<div class="styLNLeftNumBoxSD" style="padding-left:4.2mm;">g</div>
						<div class="styLNDesc" style="width:98mm;">
							Net capital gains (enter losses in Part III)
							<span class="sty8995ASchADotLn">...........</span>
						</div>
						<div class="styLNRightNumBox">3g</div>
						<div class="styLNAmountBox" style="padding:0.5mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/NetCapitalGainsAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;">&nbsp;</div>
						<div class="styLNAmountBoxNBB" style="background-color:lightgrey;">&nbsp;</div>
					</div>
					<!-- Line 3h -->
					<div class="sty7203LineDiv" style="">
						<div class="styLNLeftNumBoxSD" style="padding-left:4.2mm;">h</div>
						<div class="styLNDesc" style="width:98mm;">
							Net section 1231 gain (enter losses in Part III)
							<span class="sty8995ASchADotLn">.........</span>
						</div>
						<div class="styLNRightNumBox">3h</div>
						<div class="styLNAmountBox" style="padding:0.5mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/NetSection1231GainAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;">&nbsp;</div>
						<div class="styLNAmountBoxNBB" style="background-color:lightgrey;">&nbsp;</div>
					</div>
					<!-- Line 3i -->
					<div class="sty7203LineDiv" style="">
						<div class="styLNLeftNumBoxSD" style="padding-left:4.2mm;">i</div>
						<div class="styLNDesc" style="width:98mm;">
							Other income (enter losses in Part III)
							<span class="sty8995ASchADotLn">............</span>
						</div>
						<div class="styLNRightNumBox">3i</div>
						<div class="styLNAmountBox" style="padding:0.5mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/OtherIncomeAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;">&nbsp;</div>
						<div class="styLNAmountBoxNBB" style="background-color:lightgrey;">&nbsp;</div>
					</div>
					<!-- Line 3j -->
					<div class="sty7203LineDiv" style="">
						<div class="styLNLeftNumBoxSD" style="padding-left:4.2mm;">j</div>
						<div class="styLNDesc" style="width:98mm;">
							Excess depletion adjustment
							<span class="sty8995ASchADotLn">...............</span>
						</div>
						<div class="styLNRightNumBox">3j</div>
						<div class="styLNAmountBox" style="padding:0.5mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/ExcessDepletionAdjAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;">&nbsp;</div>
						<div class="styLNAmountBoxNBB" style="background-color:lightgrey;">&nbsp;</div>
					</div>
					<!-- Line 3k -->
					<div class="sty7203LineDiv" style="">
						<div class="styLNLeftNumBoxSD" style="padding-left:4.2mm;">k</div>
						<div class="styLNDesc" style="width:98mm;">
							Tax-exempt income
							<span class="sty8995ASchADotLn">.................</span>
						</div>
						<div class="styLNRightNumBox">3k</div>
						<div class="styLNAmountBox" style="padding:0.5mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TaxExemptIncomeAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;">&nbsp;</div>
						<div class="styLNAmountBoxNBB" style="background-color:lightgrey;">&nbsp;</div>
					</div>
					<!-- Line 3l -->
					<div class="sty7203LineDiv" style="">
						<div class="styLNLeftNumBoxSD" style="padding-left:4.2mm;">l</div>
						<div class="styLNDesc" style="width:98mm;">
							Recapture of business credits
							<span class="sty8995ASchADotLn">..............</span>
						</div>
						<div class="styLNRightNumBox">3l</div>
						<div class="styLNAmountBox" style="padding:0.5mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/RecaptureBusinessCreditsAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;">&nbsp;</div>
						<div class="styLNAmountBoxNBB" style="background-color:lightgrey;">&nbsp;</div>
					</div>
					<!-- Line 3m -->
					<div class="sty7203LineDiv" style="">
						<div class="styLNLeftNumBoxSD" style="padding-left:4.2mm;">m</div>
						<div class="styLNDesc" style="width:98mm;">
							Other items that increase stock basis
							<span class="sty8995ASchADotLn">............</span>
						</div>
						<div class="styLNRightNumBox">3m</div>
						<div class="styLNAmountBox" style="padding:0.5mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/OthItemsIncreaseStockBasisAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;">&nbsp;</div>
						<div class="styLNAmountBoxNBB" style="background-color:lightgrey;">&nbsp;</div>
					</div>
					<!-- Line 4 -->
					<div class="sty7203LineDiv" style="">
						<div class="styLNLeftNumBoxSD">4</div>
						<div class="styLNDesc" style="">
							Add lines 3a through 3m
							<span class="sty8995ASchADotLn">..........................</span>
						</div>
						<div class="styLNRightNumBox">4</div>
						<div class="styLNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TotalK1IncomeAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 5 -->
					<div class="sty7203LineDiv" style="">
						<div class="styLNLeftNumBoxSD">5</div>
						<div class="styLNDesc" style="">
							Stock basis before distributions. Add lines 1, 2, and 4
							<span class="sty8995ASchADotLn">.................</span>
						</div>
						<div class="styLNRightNumBox">5</div>
						<div class="styLNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/StockBasisBfrDistributionsAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 6 -->
					<div class="sty7203LineDiv" style="">
						<div class="styLNLeftNumBoxSD">6</div>
						<div class="styLNDesc" style="">
							Distributions (excluding dividend distributions)
							<span class="sty8995ASchADotLn">...................</span>
						</div>
						<div class="styLNRightNumBox">6</div>
						<div class="styLNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/DistributionsAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<div class="sty7203LineDiv" style="">
						<div class="styLNLeftNumBoxSD">&nbsp;</div>
						<div class="styLNDesc" style="height:7.5mm;">
							<strong>Note: </strong> If line 6 is larger than line 5, subtract line 5 from line 6 and 
							report the result as a capital gain on <br /> Form 8949 and Schedule D. See instructions.
						</div>
						<div class="styLNRightNumBox" style="height:7.5mm;background-color:lightgrey;">&nbsp;</div>
						<div class="styLNAmountBox" style="height:7.5mm;background-color:lightgrey;">&nbsp;</div>
					</div>
					<!-- Line 7 -->
					<div class="sty7203LineDiv" style="">
						<div class="styLNLeftNumBoxSD">7</div>
						<div class="styLNDesc" style="height:7.5mm;">
							Stock basis after distributions. Subtract line 6 from line 5. If the result is zero or less, enter -0-, skip 
							lines 8 through 14, and enter -0- on line 15
							<span class="sty8995ASchADotLn">......................</span>
						</div>
						<div class="styLNRightNumBox" style="height:7.5mm;"><br />7</div>
						<div class="styLNAmountBox" style="height:7.5mm;"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/StockBasisAftrDistributionsAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 8a -->
					<div class="sty7203LineDiv" style="">
						<div class="styLNLeftNumBoxSD">8a</div>
						<div class="styLNDesc" style="width:98mm;">
							Nondeductible expenses
							<span class="sty8995ASchADotLn">................</span>
						</div>
						<div class="styLNRightNumBox">8a</div>
						<div class="styLNAmountBox" style="padding:0.5mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/NondeductibleExpensesAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;">&nbsp;</div>
						<div class="styLNAmountBoxNBB" style="background-color:lightgrey;">&nbsp;</div>
					</div>
					<!-- Line 8b -->
					<div class="sty7203LineDiv" style="">
						<div class="styLNLeftNumBoxSD" style="padding-left:4.2mm;">b</div>
						<div class="styLNDesc" style="width:98mm;">
							Depletion for oil and gas
							<span class="sty8995ASchADotLn">................</span>
						</div>
						<div class="styLNRightNumBox">8b</div>
						<div class="styLNAmountBox" style="padding:0.5mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/OilGasDepletionAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;">&nbsp;</div>
						<div class="styLNAmountBoxNBB" style="background-color:lightgrey;">&nbsp;</div>
					</div>
					<!-- Line 8c -->
					<div class="sty7203LineDiv" style="">
						<div class="styLNLeftNumBoxSD" style="padding-left:4.2mm;">c</div>
						<div class="styLNDesc" style="width:98mm;">
							Business credits (sections 50(c)(1) and (5))
							<span class="sty8995ASchADotLn">..........</span>
						</div>
						<div class="styLNRightNumBox">8c</div>
						<div class="styLNAmountBox" style="padding:0.5mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/BusinessCredit50c1And5Amt"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;">&nbsp;</div>
						<div class="styLNAmountBoxNBB" style="background-color:lightgrey;">&nbsp;</div>
					</div>
					<!-- Line 9 -->
					<div class="sty7203LineDiv" style="">
						<div class="styLNLeftNumBoxSD">9</div>
						<div class="styLNDesc" style="">
							Add lines 8a through 8c
							<span class="sty8995ASchADotLn">..........................</span>
						</div>
						<div class="styLNRightNumBox">9</div>
						<div class="styLNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TotalCreditAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 10 -->
					<div class="sty7203LineDiv" style="">
						<div class="styLNLeftNumBox">10</div>
						<div class="styLNDesc" style="height:7.5mm;">
							Stock basis before loss and deduction items. Subtract line 9 from line 7. If the result is zero or less, <br/>
							enter -0-, skip lines 11 through 14, and enter -0- on line 15
							<span class="sty8995ASchADotLn">...............</span>
						</div>
						<div class="styLNRightNumBox" style="height:7.5mm;"><br />10</div>
						<div class="styLNAmountBox" style="height:7.5mm;"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/StockBasisBeforeLossDedAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 11 -->
					<div class="sty7203LineDiv" style="">
						<div class="styLNLeftNumBox">11</div>
						<div class="styLNDesc" style="">
							Allowable loss and deduction items. Enter the amount from line 47, column (c)
							<span class="sty8995ASchADotLn">.........</span>
						</div>
						<div class="styLNRightNumBox">11</div>
						<div class="styLNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/ShrAllwblLossFromStockBasisGrp/TotalAllowableLossAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 12 -->
					<div class="sty7203LineDiv" style="">
						<div class="styLNLeftNumBox">12</div>
						<div class="styLNDesc" style="">
							Debt basis restoration (see net increase in instructions for line 23)
							<span class="sty8995ASchADotLn">.............</span>
						</div>
						<div class="styLNRightNumBox">12</div>
						<div class="styLNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TotDebtBasisRestorationAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 13 -->
					<div class="sty7203LineDiv" style="">
						<div class="styLNLeftNumBox">13</div>
						<div class="styLNDesc" style="">
							Other items that decrease stock basis
							<span class="sty8995ASchADotLn">......................</span>
						</div>
						<div class="styLNRightNumBox">13</div>
						<div class="styLNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/OthItemsDecreaseStockBasisAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 14 -->
					<div class="sty7203LineDiv" style="">
						<div class="styLNLeftNumBox">14</div>
						<div class="styLNDesc" style="">
							Add lines 11, 12, and 13
							<span class="sty8995ASchADotLn">..........................</span>
						</div>
						<div class="styLNRightNumBox">14</div>
						<div class="styLNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TotalDecreaseStockBasisAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 15 -->
					<div class="sty7203LineDiv" style="">
						<div class="styLNLeftNumBox">15</div>
						<div class="styLNDesc" style="height:7.2mm;">
							<strong>Stock basis at the end of the corporation's tax year. </strong> Subtract line 14 from line 10. 
							If the result is <br /> zero or less, enter -0-
							<span class="sty8995ASchADotLn">...........................</span>
						</div>
						<div class="styLNRightNumBoxNBB" style="height:7.2mm;"><br />15</div>
						<div class="styLNAmountBoxNBB" style="height:7.2mm;"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/StockBasisEndTaxYearAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<div class="sty7203LineDiv" style="border-top:1px solid black;">
						<div class="styPartName">Part II</div>
						<div class="styPartDesc">Shareholder Debt Basis</div>
					</div>
					<div class="sty7203LineDiv" style="border-top:1px solid black;text-align:center;padding:0.5mm;">
						<strong>Section A &mdash; Amount of Debt </strong> (If more than three debts, see instructions.)
					</div>
					<xsl:variable name="p2separated" select="($Print = $Separated) and (count($FormData/ShareholderDebtBasisGrp) &gt; 3)"/>
					<!-- Column Headers -->
					<div class="sty7203LineDiv" style="border-top:1px solid black;">
						<div class="styLNLeftNumBox" style="height:15mm;border-bottom:1px solid black;"></div>
						<div class="sty7203Desc" style="height:15mm;font-weight:bold;text-align:center;padding-top:5mm;padding-right:5mm;border-bottom:1px solid black;">Description</div>
						<div class="sty7203AmtBox" style="height:15mm;text-align:left;">
							<span style="width:100%;text-align:center;"><strong>(a)</strong> Debt 1</span><br />
							<input type="checkbox" class="styCkboxNM" style="margin:0px 2px;" alt="Debt 1 Formal Note">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$FormData/ShareholderDebtBasisGrp[1]/FormalNoteInd"/>
									<xsl:with-param name="BackupName">ShareholderDebtBasisGrp1FormalNoteInd</xsl:with-param>
								</xsl:call-template>
							</input>
							Formal note <br />
							<input type="checkbox" class="styCkboxNM" style="margin:2px 2px;float:left;" alt="Debt 1 Open Account Debt">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$FormData/ShareholderDebtBasisGrp[1]/OpenAccountDebtInd"/>
									<xsl:with-param name="BackupName">ShareholderDebtBasisGrp1OpenAccountDebtInd</xsl:with-param>
								</xsl:call-template>
							</input>
							<span style="width:21mm;padding-left:4px;float:left;margin-top:2px;">Open account debt</span> 
						</div>
						<div class="sty7203AmtBox" style="height:15mm;text-align:left;">
							<span style="width:100%;text-align:center;"><strong>(b)</strong> Debt 2</span><br />
							<input type="checkbox" class="styCkboxNM" style="margin:0px 2px;" alt="Debt 2 Formal Note">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$FormData/ShareholderDebtBasisGrp[2]/FormalNoteInd"/>
									<xsl:with-param name="BackupName">ShareholderDebtBasisGrp2FormalNoteInd</xsl:with-param>
								</xsl:call-template>
							</input>
							Formal note <br />
							<input type="checkbox" class="styCkboxNM" style="margin:2px 2px;float:left;" alt="Debt 2 Open Account Debt">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$FormData/ShareholderDebtBasisGrp[2]/OpenAccountDebtInd"/>
									<xsl:with-param name="BackupName">ShareholderDebtBasisGrp2OpenAccountDebtInd</xsl:with-param>
								</xsl:call-template>
							</input>
							<span style="width:21mm;padding-left:4px;float:left;margin-top:2px;">Open account debt</span> 
						</div>
						<div class="sty7203AmtBox" style="height:15mm;text-align:left;">
							<span style="width:100%;text-align:center;"><strong>(c)</strong> Debt 3</span><br />
							<input type="checkbox" class="styCkboxNM" style="margin:0px 2px;" alt="Debt 3 Formal Note">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$FormData/ShareholderDebtBasisGrp[3]/FormalNoteInd"/>
									<xsl:with-param name="BackupName">ShareholderDebtBasisGrp3FormalNoteInd</xsl:with-param>
								</xsl:call-template>
							</input>
							Formal note <br />
							<input type="checkbox" class="styCkboxNM" style="margin:2px 2px;float:left;" alt="Debt 3 Open Account Debt">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$FormData/ShareholderDebtBasisGrp[3]/OpenAccountDebtInd"/>
									<xsl:with-param name="BackupName">ShareholderDebtBasisGrp3OpenAccountDebtInd</xsl:with-param>
								</xsl:call-template>
							</input>
							<span style="width:21mm;padding-left:4px;float:left;margin-top:2px;">Open account debt</span> 
						</div>
						<div class="sty7203AmtBox" style="height:15mm;text-align:center;padding-top:6mm;">
							<strong>(d) </strong> Total  
							<xsl:if test="$p2separated">
								<xsl:call-template name="LinkToLeftoverDataTableInline">
									<xsl:with-param name="TargetNode" select="$FormData/ShareholderDebtBasisGrp"/>
									<xsl:with-param name="Desc">Part II - More than three debts</xsl:with-param>
								</xsl:call-template>
							</xsl:if>
						</div>
					</div>
					<!-- Line 16 -->
					<div class="sty7203LineDiv">
						<div class="styLNLeftNumBox">16</div>
						<div class="sty7203Desc" style="height:7.5mm;">
							Loan balance at the beginning of the corporation's tax year
							<span class="sty8995ASchADotLn">...............</span>
						</div>
						<div class="sty7203AmtBox" style="height:7.5mm;">
							<br/>
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/ShareholderDebtBasisGrp[1]/LoanBalanceBeginTaxYrAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty7203AmtBox" style="height:7.5mm;">
							<br/>
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/ShareholderDebtBasisGrp[2]/LoanBalanceBeginTaxYrAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty7203AmtBox" style="height:7.5mm;">
							<br/>
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/ShareholderDebtBasisGrp[3]/LoanBalanceBeginTaxYrAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty7203AmtBox" style="height:7.5mm;">
							<br/>
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TotLoanBalanceBeginTaxYrAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 17 -->
					<div class="sty7203LineDiv">
						<div class="styLNLeftNumBox">17</div>
						<div class="sty7203Desc">
							Additional loans (see instructions)
							<span class="sty8995ASchADotLn">......</span>
						</div>
						<div class="sty7203AmtBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/ShareholderDebtBasisGrp[1]/AdditionalLoansAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty7203AmtBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/ShareholderDebtBasisGrp[2]/AdditionalLoansAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty7203AmtBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/ShareholderDebtBasisGrp[3]/AdditionalLoansAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty7203AmtBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TotAdditionalLoansAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 18 -->
					<div class="sty7203LineDiv">
						<div class="styLNLeftNumBox">18</div>
						<div class="sty7203Desc">
							Loan balance before repayment. Add lines 16 and 17
						</div>
						<div class="sty7203AmtBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/ShareholderDebtBasisGrp[1]/LoanedBeginningBalAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty7203AmtBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/ShareholderDebtBasisGrp[2]/LoanedBeginningBalAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty7203AmtBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/ShareholderDebtBasisGrp[3]/LoanedBeginningBalAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty7203AmtBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TotLoanedBeginningBalAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 19 -->
					<div class="sty7203LineDiv">
						<div class="styLNLeftNumBox">19</div>
						<div class="sty7203Desc" style="height:7.5mm;">
							Principal portion of debt repayment (this line doesn't include interest)
							<span class="sty8995ASchADotLn">...........</span>
						</div>
						<div class="sty7203AmtBox" style="height:7.5mm;">
							<br/>
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/ShareholderDebtBasisGrp[1]/PrincipalDebtRepaymentAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty7203AmtBox" style="height:7.5mm;">
							<br/>
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/ShareholderDebtBasisGrp[2]/PrincipalDebtRepaymentAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty7203AmtBox" style="height:7.5mm;">
							<br/>
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/ShareholderDebtBasisGrp[3]/PrincipalDebtRepaymentAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty7203AmtBox" style="height:7.5mm;">
							<br/>
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TotPrincipalDebtRepaymentAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 20 -->
					<div class="sty7203LineDiv">
						<div class="styLNLeftNumBox">20</div>
						<div class="sty7203Desc" style="height:7.5mm;">
							Loan balance at the end of the corporation's tax year. <br />
							Subtract line 19 from line 18
							<span class="sty8995ASchADotLn">.......</span>
						</div>
						<div class="sty7203AmtBox" style="height:7.5mm;">
							<br/>
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/ShareholderDebtBasisGrp[1]/LoanBalanceEndTaxYrAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty7203AmtBox" style="height:7.5mm;">
							<br/>
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/ShareholderDebtBasisGrp[2]/LoanBalanceEndTaxYrAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty7203AmtBox" style="height:7.5mm;">
							<br/>
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/ShareholderDebtBasisGrp[3]/LoanBalanceEndTaxYrAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty7203AmtBox" style="height:7.5mm;">
							<br/>
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TotLoanBalanceEndTaxYrAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<xsl:if test="(count($FormData/ShareholderDebtBasisGrp) &gt; 3) and not($Print = $Separated)">
						<xsl:for-each select="$FormData/ShareholderDebtBasisGrp">
							<xsl:if test="(position() + 3) mod 6 = 1">
								<xsl:variable name="pos" select="position()"/>
								<div class="sty7203LineDiv" style="border-top:1px solid black;">
									<div class="styLNLeftNumBox" style="height:15mm;width:6.5mm;border-bottom:1px solid black;"></div>
									<div class="sty7203AmtBoxEx" style="height:15mm;text-align:left;">
										<span style="width:100%;text-align:center;">Debt <xsl:value-of select="$pos"/></span><br />
										<input type="checkbox" class="styCkboxNM" style="margin:0px 2px;">
											<xsl:attribute name="alt">Debt <xsl:value-of select="$pos"/> Formal Note</xsl:attribute>
											<xsl:call-template name="PopulateCheckbox">
												<xsl:with-param name="TargetNode" select="$FormData/ShareholderDebtBasisGrp[$pos]/FormalNoteInd"/>
												<xsl:with-param name="BackupName">ShareholderDebtBasisGrp<xsl:value-of select="$pos"/>FormalNoteInd</xsl:with-param>
											</xsl:call-template>
										</input>
										Formal note <br />
										<input type="checkbox" class="styCkboxNM" style="margin:2px 2px;float:left;">
											<xsl:attribute name="alt">Debt <xsl:value-of select="$pos"/> Formal Note</xsl:attribute>
											<xsl:call-template name="PopulateCheckbox">
												<xsl:with-param name="TargetNode" select="$FormData/ShareholderDebtBasisGrp[$pos]/OpenAccountDebtInd"/>
												<xsl:with-param name="BackupName">ShareholderDebtBasisGrp<xsl:value-of select="$pos"/>OpenAccountDebtInd</xsl:with-param>
											</xsl:call-template>
										</input>
										<span style="width:21mm;padding-left:4px;float:left;margin-top:2px;">Open account debt</span> 
									</div>
									<div class="sty7203AmtBoxEx" style="height:15mm;text-align:left;">
										<span style="width:100%;text-align:center;">Debt <xsl:value-of select="$pos + 1"/></span><br />
										<input type="checkbox" class="styCkboxNM" style="margin:0px 2px;">
											<xsl:attribute name="alt">Debt <xsl:value-of select="$pos + 1"/> Formal Note</xsl:attribute>
											<xsl:call-template name="PopulateCheckbox">
												<xsl:with-param name="TargetNode" select="$FormData/ShareholderDebtBasisGrp[$pos + 1]/FormalNoteInd"/>
												<xsl:with-param name="BackupName">ShareholderDebtBasisGrp<xsl:value-of select="$pos + 1"/>FormalNoteInd</xsl:with-param>
											</xsl:call-template>
										</input>
										Formal note <br />
										<input type="checkbox" class="styCkboxNM" style="margin:2px 2px;float:left;">
											<xsl:attribute name="alt">Debt <xsl:value-of select="$pos + 1"/> Formal Note</xsl:attribute>
											<xsl:call-template name="PopulateCheckbox">
												<xsl:with-param name="TargetNode" select="$FormData/ShareholderDebtBasisGrp[$pos + 1]/OpenAccountDebtInd"/>
												<xsl:with-param name="BackupName">ShareholderDebtBasisGrp<xsl:value-of select="$pos + 1"/>OpenAccountDebtInd</xsl:with-param>
											</xsl:call-template>
										</input>
										<span style="width:21mm;padding-left:4px;float:left;margin-top:2px;">Open account debt</span> 
									</div>
									<div class="sty7203AmtBoxEx" style="height:15mm;text-align:left;">
										<span style="width:100%;text-align:center;">Debt <xsl:value-of select="$pos + 2"/></span><br />
										<input type="checkbox" class="styCkboxNM" style="margin:0px 2px;">
											<xsl:attribute name="alt">Debt <xsl:value-of select="$pos + 2"/> Formal Note</xsl:attribute>
											<xsl:call-template name="PopulateCheckbox">
												<xsl:with-param name="TargetNode" select="$FormData/ShareholderDebtBasisGrp[$pos + 2]/FormalNoteInd"/>
												<xsl:with-param name="BackupName">ShareholderDebtBasisGrp<xsl:value-of select="$pos + 2"/>FormalNoteInd</xsl:with-param>
											</xsl:call-template>
										</input>
										Formal note <br />
										<input type="checkbox" class="styCkboxNM" style="margin:2px 2px;float:left;">
											<xsl:attribute name="alt">Debt <xsl:value-of select="$pos + 2"/> Formal Note</xsl:attribute>
											<xsl:call-template name="PopulateCheckbox">
												<xsl:with-param name="TargetNode" select="$FormData/ShareholderDebtBasisGrp[$pos + 2]/OpenAccountDebtInd"/>
												<xsl:with-param name="BackupName">ShareholderDebtBasisGrp<xsl:value-of select="$pos + 2"/>OpenAccountDebtInd</xsl:with-param>
											</xsl:call-template>
										</input>
										<span style="width:21mm;padding-left:4px;float:left;margin-top:2px;">Open account debt</span> 
									</div>
									<div class="sty7203AmtBoxEx" style="height:15mm;text-align:left;">
										<span style="width:100%;text-align:center;">Debt <xsl:value-of select="$pos + 3"/></span><br />
										<input type="checkbox" class="styCkboxNM" style="margin:0px 2px;">
											<xsl:attribute name="alt">Debt <xsl:value-of select="$pos + 3"/> Formal Note</xsl:attribute>
											<xsl:call-template name="PopulateCheckbox">
												<xsl:with-param name="TargetNode" select="$FormData/ShareholderDebtBasisGrp[$pos + 3]/FormalNoteInd"/>
												<xsl:with-param name="BackupName">ShareholderDebtBasisGrp<xsl:value-of select="$pos + 3"/>FormalNoteInd</xsl:with-param>
											</xsl:call-template>
										</input>
										Formal note <br />
										<input type="checkbox" class="styCkboxNM" style="margin:2px 2px;float:left;">
											<xsl:attribute name="alt">Debt <xsl:value-of select="$pos + 3"/> Formal Note</xsl:attribute>
											<xsl:call-template name="PopulateCheckbox">
												<xsl:with-param name="TargetNode" select="$FormData/ShareholderDebtBasisGrp[$pos + 3]/OpenAccountDebtInd"/>
												<xsl:with-param name="BackupName">ShareholderDebtBasisGrp<xsl:value-of select="$pos + 3"/>OpenAccountDebtInd</xsl:with-param>
											</xsl:call-template>
										</input>
										<span style="width:21mm;padding-left:4px;float:left;margin-top:2px;">Open account debt</span> 
									</div>
									<div class="sty7203AmtBoxEx" style="height:15mm;text-align:left;">
										<span style="width:100%;text-align:center;">Debt <xsl:value-of select="$pos + 4"/></span><br />
										<input type="checkbox" class="styCkboxNM" style="margin:0px 2px;">
											<xsl:attribute name="alt">Debt <xsl:value-of select="$pos + 4"/> Formal Note</xsl:attribute>
											<xsl:call-template name="PopulateCheckbox">
												<xsl:with-param name="TargetNode" select="$FormData/ShareholderDebtBasisGrp[$pos + 4]/FormalNoteInd"/>
												<xsl:with-param name="BackupName">ShareholderDebtBasisGrp<xsl:value-of select="$pos + 4"/>FormalNoteInd</xsl:with-param>
											</xsl:call-template>
										</input>
										Formal note <br />
										<input type="checkbox" class="styCkboxNM" style="margin:2px 2px;float:left;">
											<xsl:attribute name="alt">Debt <xsl:value-of select="$pos + 4"/> Formal Note</xsl:attribute>
											<xsl:call-template name="PopulateCheckbox">
												<xsl:with-param name="TargetNode" select="$FormData/ShareholderDebtBasisGrp[$pos + 4]/OpenAccountDebtInd"/>
												<xsl:with-param name="BackupName">ShareholderDebtBasisGrp<xsl:value-of select="$pos + 4"/>OpenAccountDebtInd</xsl:with-param>
											</xsl:call-template>
										</input>
										<span style="width:21mm;padding-left:4px;float:left;margin-top:2px;">Open account debt</span> 
									</div>
									<div class="sty7203AmtBoxEx" style="height:15mm;text-align:left;">
										<span style="width:100%;text-align:center;">Debt <xsl:value-of select="$pos + 5"/></span><br />
										<input type="checkbox" class="styCkboxNM" style="margin:0px 2px;">
											<xsl:attribute name="alt">Debt <xsl:value-of select="$pos + 5"/> Formal Note</xsl:attribute>
											<xsl:call-template name="PopulateCheckbox">
												<xsl:with-param name="TargetNode" select="$FormData/ShareholderDebtBasisGrp[$pos + 5]/FormalNoteInd"/>
												<xsl:with-param name="BackupName">ShareholderDebtBasisGrp<xsl:value-of select="$pos + 5"/>FormalNoteInd</xsl:with-param>
											</xsl:call-template>
										</input>
										Formal note <br />
										<input type="checkbox" class="styCkboxNM" style="margin:2px 2px;float:left;">
											<xsl:attribute name="alt">Debt <xsl:value-of select="$pos + 5"/> Formal Note</xsl:attribute>
											<xsl:call-template name="PopulateCheckbox">
												<xsl:with-param name="TargetNode" select="$FormData/ShareholderDebtBasisGrp[$pos + 5]/OpenAccountDebtInd"/>
												<xsl:with-param name="BackupName">ShareholderDebtBasisGrp<xsl:value-of select="$pos + 5"/>OpenAccountDebtInd</xsl:with-param>
											</xsl:call-template>
										</input>
										<span style="width:21mm;padding-left:4px;float:left;margin-top:2px;">Open account debt</span> 
									</div>
								</div>
								<!-- Line 16Ex -->
								<xsl:call-template name="P2ExLine">
									<xsl:with-param name="LineNum" select="16"/>
									<xsl:with-param name="Position" select="$pos"/>
									<xsl:with-param name="LineElement">LoanBalanceBeginTaxYrAmt</xsl:with-param>
								</xsl:call-template>
								<!-- Line 17Ex -->
								<xsl:call-template name="P2ExLine">
									<xsl:with-param name="LineNum" select="17"/>
									<xsl:with-param name="Position" select="$pos"/>
									<xsl:with-param name="LineElement">AdditionalLoansAmt</xsl:with-param>
								</xsl:call-template>
								<!-- Line 18Ex -->
								<xsl:call-template name="P2ExLine">
									<xsl:with-param name="LineNum" select="18"/>
									<xsl:with-param name="Position" select="$pos"/>
									<xsl:with-param name="LineElement">LoanedBeginningBalAmt</xsl:with-param>
								</xsl:call-template>
								<!-- Line 19Ex -->
								<xsl:call-template name="P2ExLine">
									<xsl:with-param name="LineNum" select="19"/>
									<xsl:with-param name="Position" select="$pos"/>
									<xsl:with-param name="LineElement">PrincipalDebtRepaymentAmt</xsl:with-param>
								</xsl:call-template>
								<!-- Line 20Ex -->
								<xsl:call-template name="P2ExLine">
									<xsl:with-param name="LineNum" select="20"/>
									<xsl:with-param name="Position" select="$pos"/>
									<xsl:with-param name="LineElement">LoanBalanceEndTaxYrAmt</xsl:with-param>
								</xsl:call-template>
							</xsl:if>
						</xsl:for-each>
					</xsl:if>
					<!-- Form footer -->
					<div class="styStdDiv pageEnd" style="border-top:2px solid black;">
						<span style="font-weight:bold;font-family:Arial;">For Paperwork Reduction Act Notice, see separate instructions.</span>
						<span style="margin-left:20mm;">Cat. No. 56396V</span>
						<span style="float:right;">Form <span style="font-weight:bold;font-size:9pt;">7203</span> (Rev. 12-2022)</span>
					</div>
					<!-- Page 2 -->
					<div class="styStdDiv" style="border-bottom:1px solid black;">
						Form 7203 (Rev. 12-2022)
						<div style="float:right;">Page <strong>2</strong></div>
					</div>
					<div class="sty7203LineDiv" style="border-top:1px solid black;">
						<div class="styPartName">Part II</div>
						<div class="styPartDesc">Shareholder Debt Basis <span style="font-weight:normal;font-style:italic;">(continued)</span></div>
					</div>
					<div class="sty7203LineDiv" style="border-top:1px solid black;text-align:center;padding:0.5mm;font-weight:bold;">
						Section B &mdash; Adjustments to Debt Basis
					</div>
					<!-- Column Headers -->
					<div class="sty7203LineDiv" style="border-top:1px solid black;">
						<div class="styLNLeftNumBox" style="border-bottom:1px solid black;"></div>
						<div class="sty7203Desc" style="height:4mm;min-height:3mm;font-weight:bold;text-align:center;padding-right:5mm;border-bottom:1px solid black;">Description</div>
						<div class="sty7203AmtBox" style="text-align:center;">
							<strong>(a)</strong> Debt 1
						</div>
						<div class="sty7203AmtBox" style="text-align:center;">
							<strong>(b)</strong> Debt 2
						</div>
						<div class="sty7203AmtBox" style="text-align:center;">
							<strong>(c)</strong> Debt 3
						</div>
						<div class="sty7203AmtBox" style="text-align:center;">
							<strong>(d)</strong> Total
						</div>
					</div>
					<!-- Line 21 -->
					<div class="sty7203LineDiv">
						<div class="styLNLeftNumBox">21</div>
						<div class="sty7203Desc" style="font-family:Arial;height:4mm;">
							Debt basis at the beginning of the corporation's tax year
							<span class="sty8995ASchADotLn">.</span>
						</div>
						<div class="sty7203AmtBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/ShareholderDebtBasisGrp[1]/DebtBasisBeginTaxYrAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty7203AmtBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/ShareholderDebtBasisGrp[2]/DebtBasisBeginTaxYrAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty7203AmtBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/ShareholderDebtBasisGrp[3]/DebtBasisBeginTaxYrAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty7203AmtBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TotDebtBasisBeginTaxYrAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 22 -->
					<div class="sty7203LineDiv">
						<div class="styLNLeftNumBox">22</div>
						<div class="sty7203Desc">
							Enter the amount, if any, from line 17
							<span class="sty8995ASchADotLn">.....</span>
						</div>
						<div class="sty7203AmtBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/ShareholderDebtBasisGrp[1]/AdditionalLoansAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty7203AmtBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/ShareholderDebtBasisGrp[2]/AdditionalLoansAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty7203AmtBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/ShareholderDebtBasisGrp[3]/AdditionalLoansAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty7203AmtBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TotAdditionalLoansAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 23 -->
					<div class="sty7203LineDiv">
						<div class="styLNLeftNumBox">23</div>
						<div class="sty7203Desc">
							Debt basis restoration (see instructions)
							<span class="sty8995ASchADotLn">....</span>
						</div>
						<div class="sty7203AmtBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/ShareholderDebtBasisGrp[1]/DebtBasisRestorationAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty7203AmtBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/ShareholderDebtBasisGrp[2]/DebtBasisRestorationAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty7203AmtBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/ShareholderDebtBasisGrp[3]/DebtBasisRestorationAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty7203AmtBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TotDebtBasisRestorationAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 24 -->
					<div class="sty7203LineDiv">
						<div class="styLNLeftNumBox">24</div>
						<div class="sty7203Desc" style="height:4mm;">
							Debt basis before repayment. Add lines 21, 22, and 23
							<!--<span class="sty8995ASchADotLn">.</span>-->
						</div>
						<div class="sty7203AmtBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/ShareholderDebtBasisGrp[1]/DebtBasisBfrRepaymentAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty7203AmtBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/ShareholderDebtBasisGrp[2]/DebtBasisBfrRepaymentAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty7203AmtBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/ShareholderDebtBasisGrp[3]/DebtBasisBfrRepaymentAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty7203AmtBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TotDebtBasisBfrRepaymentAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 25 -->
					<div class="sty7203LineDiv">
						<div class="styLNLeftNumBox">25</div>
						<div class="sty7203Desc">
							Divide line 24 by line 18
							<span class="sty8995ASchADotLn">.........</span>
						</div>
						<div class="sty7203AmtBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/ShareholderDebtBasisGrp[1]/DebtLoanRepaymentPct"/>
							</xsl:call-template>
						</div>
						<div class="sty7203AmtBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/ShareholderDebtBasisGrp[2]/DebtLoanRepaymentPct"/>
							</xsl:call-template>
						</div>
						<div class="sty7203AmtBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/ShareholderDebtBasisGrp[3]/DebtLoanRepaymentPct"/>
							</xsl:call-template>
						</div>
						<div class="sty7203AmtBox" style="background-color:lightgrey;">&nbsp;</div>
					</div>
					<!-- Line 26 -->
					<div class="sty7203LineDiv">
						<div class="styLNLeftNumBox">26</div>
						<div class="sty7203Desc" style="height:4mm;">
							Nontaxable debt repayment. Multiply line 25 by line 19
							<!--<span class="sty8995ASchADotLn">.</span>-->
						</div>
						<div class="sty7203AmtBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/ShareholderDebtBasisGrp[1]/NontaxableDebtRepaymentAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty7203AmtBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/ShareholderDebtBasisGrp[2]/NontaxableDebtRepaymentAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty7203AmtBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/ShareholderDebtBasisGrp[3]/NontaxableDebtRepaymentAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty7203AmtBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TotNontaxableDebtRepaymentAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 27 -->
					<div class="sty7203LineDiv">
						<div class="styLNLeftNumBox">27</div>
						<div class="sty7203Desc" style="height:7.5mm;">
							Debt basis before nondeductible expenses and losses. <br />
							Subtract line 26 from line 24
							<span class="sty8995ASchADotLn">.......</span>
						</div>
						<div class="sty7203AmtBox" style="height:7.5mm;">
							<br/>
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/ShareholderDebtBasisGrp[1]/DebtBasisBfrExpnssLossAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty7203AmtBox" style="height:7.5mm;">
							<br/>
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/ShareholderDebtBasisGrp[2]/DebtBasisBfrExpnssLossAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty7203AmtBox" style="height:7.5mm;">
							<br/>
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/ShareholderDebtBasisGrp[3]/DebtBasisBfrExpnssLossAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty7203AmtBox" style="height:7.5mm;">
							<br/>
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TotDebtBasisBfrExpnssLossAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 28 -->
					<div class="sty7203LineDiv">
						<div class="styLNLeftNumBox">28</div>
						<div class="sty7203Desc" style="height:7.5mm;">
							Nondeductible expenses and oil and gas depletion deductions in excess of stock basis
							<span class="sty8995ASchADotLn">.....</span>
						</div>
						<div class="sty7203AmtBox" style="height:7.5mm;">
							<br/>
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/ShareholderDebtBasisGrp[1]/NondedExpnssOilGasDpltnAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty7203AmtBox" style="height:7.5mm;">
							<br/>
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/ShareholderDebtBasisGrp[2]/NondedExpnssOilGasDpltnAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty7203AmtBox" style="height:7.5mm;">
							<br/>
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/ShareholderDebtBasisGrp[3]/NondedExpnssOilGasDpltnAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty7203AmtBox" style="height:7.5mm;">
							<br/>
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TotNondedExpnssOilGasDpltnAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 29 -->
					<div class="sty7203LineDiv">
						<div class="styLNLeftNumBox">29</div>
						<div class="sty7203Desc" style="height:7.5mm;">
							Debt basis before losses and deductions. Subtract line 28 from line 27. If the result is zero or less, enter -0-
							<!--<span class="sty8995ASchADotLn">.</span>-->
						</div>
						<div class="sty7203AmtBox" style="height:7.5mm;">
							<br/>
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/ShareholderDebtBasisGrp[1]/DebtBasisBeforeLossDedAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty7203AmtBox" style="height:7.5mm;">
							<br/>
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/ShareholderDebtBasisGrp[2]/DebtBasisBeforeLossDedAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty7203AmtBox" style="height:7.5mm;">
							<br/>
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/ShareholderDebtBasisGrp[3]/DebtBasisBeforeLossDedAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty7203AmtBox" style="height:7.5mm;">
							<br/>
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TotDebtBasisBeforeLossDedAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 30 -->
					<div class="sty7203LineDiv">
						<div class="styLNLeftNumBox">30</div>
						<div class="sty7203Desc" style="height:7.5mm;">
							Allowable losses in excess of stock basis. Enter the amount from line 47, column (d)
							<span class="sty8995ASchADotLn">......</span>
						</div>
						<div class="sty7203AmtBox" style="height:7.5mm;">
							<br/>
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/ShareholderDebtBasisGrp[1]/AllowableLossAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty7203AmtBox" style="height:7.5mm;">
							<br/>
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/ShareholderDebtBasisGrp[2]/AllowableLossAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty7203AmtBox" style="height:7.5mm;">
							<br/>
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/ShareholderDebtBasisGrp[3]/AllowableLossAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty7203AmtBox" style="height:7.5mm;">
							<br/>
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/ShrAllwblLossFromDebtBasisGrp/TotalAllowableLossAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 31 -->
					<div class="sty7203LineDiv">
						<div class="styLNLeftNumBox">31</div>
						<div class="sty7203Desc" style="height:10.5mm;">
							<strong>Debt basis at the end of the corporation's tax year.</strong> 
							Subtract line 30 from line 29. If the result is <br /> zero or less, enter -0-
							<span class="sty8995ASchADotLn">.........</span>
						</div>
						<div class="sty7203AmtBox" style="height:10.5mm;border-bottom-width:0px;">
							<br/><br/>
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/ShareholderDebtBasisGrp[1]/DebtBasisEndTaxYrAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty7203AmtBox" style="height:10.5mm;border-bottom-width:0px;">
							<br/><br/>
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/ShareholderDebtBasisGrp[2]/DebtBasisEndTaxYrAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty7203AmtBox" style="height:10.5mm;border-bottom-width:0px;">
							<br/><br/>
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/ShareholderDebtBasisGrp[3]/DebtBasisEndTaxYrAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty7203AmtBox" style="height:10.5mm;border-bottom-width:0px;">
							<br/><br/>
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TotDebtBasisEndTaxYrAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<div class="sty7203LineDiv" style="border-top:1px solid black;text-align:center;padding:0.5mm;font-weight:bold;border-bottom:1px solid black;">
						Section C &mdash; Gain on Loan Repayment
					</div>
					<!-- Line 32 -->
					<div class="sty7203LineDiv">
						<div class="styLNLeftNumBox">32</div>
						<div class="sty7203Desc">
							Repayment. Enter the amount from line 19
							<span class="sty8995ASchADotLn">...</span>
						</div>
						<div class="sty7203AmtBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/ShareholderDebtBasisGrp[1]/PrincipalDebtRepaymentAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty7203AmtBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/ShareholderDebtBasisGrp[2]/PrincipalDebtRepaymentAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty7203AmtBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/ShareholderDebtBasisGrp[3]/PrincipalDebtRepaymentAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty7203AmtBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TotPrincipalDebtRepaymentAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 33 -->
					<div class="sty7203LineDiv">
						<div class="styLNLeftNumBox">33</div>
						<div class="sty7203Desc">
							Nontaxable repayments. Enter the amount from line 26
							<!--<span class="sty8995ASchADotLn">....</span>-->
						</div>
						<div class="sty7203AmtBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/ShareholderDebtBasisGrp[1]/NontaxableDebtRepaymentAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty7203AmtBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/ShareholderDebtBasisGrp[2]/NontaxableDebtRepaymentAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty7203AmtBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/ShareholderDebtBasisGrp[3]/NontaxableDebtRepaymentAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty7203AmtBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TotNontaxableDebtRepaymentAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 34 -->
					<div class="sty7203LineDiv">
						<div class="styLNLeftNumBox">34</div>
						<div class="sty7203Desc">
							<strong>Reportable gain. </strong> Subtract line 33 from line 32
							<span class="sty8995ASchADotLn">..</span>
						</div>
						<div class="sty7203AmtBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/ShareholderDebtBasisGrp[1]/ReportableGainAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty7203AmtBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/ShareholderDebtBasisGrp[2]/ReportableGainAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty7203AmtBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/ShareholderDebtBasisGrp[3]/ReportableGainAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty7203AmtBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TotReportableGainAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<xsl:if test="(count($FormData/ShareholderDebtBasisGrp) &gt; 3) and not($Print = $Separated)">
						<xsl:for-each select="$FormData/ShareholderDebtBasisGrp">
							<xsl:if test="(position() + 3) mod 6 = 1">
								<xsl:variable name="pos" select="position()"/>
								<div class="sty7203LineDiv" style="border-top:1px solid black;text-align:center;padding:0.5mm;font-weight:bold;">
									Section B &mdash; Adjustments to Debt Basis
								</div>
								<div class="sty7203LineDiv" style="border-top:1px solid black;">
									<div class="styLNLeftNumBox" style="width:6.5mm;border-bottom:1px solid black;"></div>
									<div class="sty7203AmtBoxEx" style="text-align:center;">
										Debt <xsl:value-of select="$pos"/>
									</div>
									<div class="sty7203AmtBoxEx" style="text-align:center;">
										Debt <xsl:value-of select="$pos + 1"/>
									</div>
									<div class="sty7203AmtBoxEx" style="text-align:center;">
										Debt <xsl:value-of select="$pos + 2"/>
									</div>
									<div class="sty7203AmtBoxEx" style="text-align:center;">
										Debt <xsl:value-of select="$pos + 3"/>
									</div>
									<div class="sty7203AmtBoxEx" style="text-align:center;">
										Debt <xsl:value-of select="$pos + 4"/>
									</div>
									<div class="sty7203AmtBoxEx" style="text-align:center;">
										Debt <xsl:value-of select="$pos + 5"/>
									</div>
								</div>
								<!-- Line 21Ex -->
								<xsl:call-template name="P2ExLine">
									<xsl:with-param name="LineNum" select="21"/>
									<xsl:with-param name="Position" select="$pos"/>
									<xsl:with-param name="LineElement">DebtBasisBeginTaxYrAmt</xsl:with-param>
								</xsl:call-template>
								<!-- Line 22Ex -->
								<xsl:call-template name="P2ExLine">
									<xsl:with-param name="LineNum" select="22"/>
									<xsl:with-param name="Position" select="$pos"/>
									<xsl:with-param name="LineElement">AdditionalLoansAmt</xsl:with-param>
								</xsl:call-template>
								<!-- Line 23Ex -->
								<xsl:call-template name="P2ExLine">
									<xsl:with-param name="LineNum" select="23"/>
									<xsl:with-param name="Position" select="$pos"/>
									<xsl:with-param name="LineElement">DebtBasisRestorationAmt</xsl:with-param>
								</xsl:call-template>
								<!-- Line 24Ex -->
								<xsl:call-template name="P2ExLine">
									<xsl:with-param name="LineNum" select="24"/>
									<xsl:with-param name="Position" select="$pos"/>
									<xsl:with-param name="LineElement">DebtBasisBfrRepaymentAmt</xsl:with-param>
								</xsl:call-template>
								<!-- Line 25Ex -->
								<xsl:call-template name="P2ExLine">
									<xsl:with-param name="LineNum" select="25"/>
									<xsl:with-param name="Position" select="$pos"/>
									<xsl:with-param name="LineElement">DebtLoanRepaymentPct</xsl:with-param>
								</xsl:call-template>
								<!-- Line 26Ex -->
								<xsl:call-template name="P2ExLine">
									<xsl:with-param name="LineNum" select="26"/>
									<xsl:with-param name="Position" select="$pos"/>
									<xsl:with-param name="LineElement">NontaxableDebtRepaymentAmt</xsl:with-param>
								</xsl:call-template>
								<!-- Line 27Ex -->
								<xsl:call-template name="P2ExLine">
									<xsl:with-param name="LineNum" select="27"/>
									<xsl:with-param name="Position" select="$pos"/>
									<xsl:with-param name="LineElement">DebtBasisBfrExpnssLossAmt</xsl:with-param>
								</xsl:call-template>
								<!-- Line 28Ex -->
								<xsl:call-template name="P2ExLine">
									<xsl:with-param name="LineNum" select="28"/>
									<xsl:with-param name="Position" select="$pos"/>
									<xsl:with-param name="LineElement">NondedExpnssOilGasDpltnAmt</xsl:with-param>
								</xsl:call-template>
								<!-- Line 29Ex -->
								<xsl:call-template name="P2ExLine">
									<xsl:with-param name="LineNum" select="29"/>
									<xsl:with-param name="Position" select="$pos"/>
									<xsl:with-param name="LineElement">DebtBasisBeforeLossDedAmt</xsl:with-param>
								</xsl:call-template>
								<!-- Line 30Ex -->
								<xsl:call-template name="P2ExLine">
									<xsl:with-param name="LineNum" select="30"/>
									<xsl:with-param name="Position" select="$pos"/>
									<xsl:with-param name="LineElement">AllowableLossAmt</xsl:with-param>
								</xsl:call-template>
								<!-- Line 31Ex -->
								<xsl:call-template name="P2ExLine">
									<xsl:with-param name="LineNum" select="31"/>
									<xsl:with-param name="Position" select="$pos"/>
									<xsl:with-param name="LineElement">DebtBasisEndTaxYrAmt</xsl:with-param>
								</xsl:call-template>
								<div class="sty7203LineDiv" style="border-bottom:1px solid black;text-align:center;padding:0.5mm;font-weight:bold;">
									Section C &mdash; Gain on Loan Repayment
								</div>
								<!-- Line 32Ex -->
								<xsl:call-template name="P2ExLine">
									<xsl:with-param name="LineNum" select="32"/>
									<xsl:with-param name="Position" select="$pos"/>
									<xsl:with-param name="LineElement">PrincipalDebtRepaymentAmt</xsl:with-param>
								</xsl:call-template>
								<!-- Line 33Ex -->
								<xsl:call-template name="P2ExLine">
									<xsl:with-param name="LineNum" select="33"/>
									<xsl:with-param name="Position" select="$pos"/>
									<xsl:with-param name="LineElement">NontaxableDebtRepaymentAmt</xsl:with-param>
								</xsl:call-template>
								<!-- Line 34Ex -->
								<xsl:call-template name="P2ExLine">
									<xsl:with-param name="LineNum" select="34"/>
									<xsl:with-param name="Position" select="$pos"/>
									<xsl:with-param name="LineElement">ReportableGainAmt</xsl:with-param>
								</xsl:call-template>
							</xsl:if>
						</xsl:for-each>
					</xsl:if>
					<div class="sty7203LineDiv" style="border-top:1px solid black;">
						<div class="styPartName">Part III</div>
						<div class="styPartDesc">Shareholder Allowable Loss and Deduction Items</div>
					</div>
					<!-- Column Headers -->
					<div class="sty7203LineDiv" style="border-top:1px solid black;">
						<div class="styLNLeftNumBox" style="height:14mm;width:7mm;border-bottom:1px solid black;"></div>
						<div class="sty7203DescShorter" style="height:14mm;font-weight:bold;text-align:center;padding-right:5mm;border-bottom:1px solid black;padding-top:5mm;">Description</div>
						<div class="sty7203AmtBox" style="height:14mm;text-align:center;">
							<strong>(a)</strong> Current year losses and deductions
						</div>
						<div class="sty7203AmtBox" style="height:14mm;text-align:center;">
							<strong>(b)</strong> Carryover amounts (column (e)) from the previous year
						</div>
						<div class="sty7203AmtBox" style="height:14mm;text-align:center;">
							<strong>(c)</strong> Allowable loss from stock basis
						</div>
						<div class="sty7203AmtBox" style="height:14mm;text-align:center;">
							<strong>(d)</strong> Allowable loss from debt basis
						</div>
						<div class="sty7203AmtBox" style="height:14mm;text-align:center;">
							<strong>(e)</strong> Carryover amounts
						</div>
					</div>
					<!-- Line 35 -->
					<div class="sty7203LineDiv">
						<div class="styLNLeftNumBox" style="width:7mm;">35</div>
						<div class="sty7203DescShorter" style="">
							Ordinary business loss
							<span class="sty8995ASchADotLn">...</span>
						</div>
						<div class="sty7203AmtBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/ShrCurrentYrLossDeductionsGrp/OrdinaryBusinessLossAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty7203AmtBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/ShrCarryoverAmtPreviousYrGrp/OrdinaryBusinessLossAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty7203AmtBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/ShrAllwblLossFromStockBasisGrp/OrdinaryBusinessLossAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty7203AmtBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/ShrAllwblLossFromDebtBasisGrp/OrdinaryBusinessLossAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty7203AmtBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/ShrCarryoverAmountsGrp/OrdinaryBusinessLossAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 36 -->
					<div class="sty7203LineDiv">
						<div class="styLNLeftNumBox" style="width:7mm;">36</div>
						<div class="sty7203DescShorter" style="">
							Net rental real estate loss
							<span class="sty8995ASchADotLn">..</span>
						</div>
						<div class="sty7203AmtBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/ShrCurrentYrLossDeductionsGrp/NetRentalRealEstateLossAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty7203AmtBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/ShrCarryoverAmtPreviousYrGrp/NetRentalRealEstateLossAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty7203AmtBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/ShrAllwblLossFromStockBasisGrp/NetRentalRealEstateLossAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty7203AmtBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/ShrAllwblLossFromDebtBasisGrp/NetRentalRealEstateLossAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty7203AmtBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/ShrCarryoverAmountsGrp/NetRentalRealEstateLossAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 37 -->
					<div class="sty7203LineDiv">
						<div class="styLNLeftNumBox" style="width:7mm;">37</div>
						<div class="sty7203DescShorter" style="">
							Other net rental loss
							<span class="sty8995ASchADotLn">....</span>
						</div>
						<div class="sty7203AmtBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/ShrCurrentYrLossDeductionsGrp/OtherNetRentalLossAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty7203AmtBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/ShrCarryoverAmtPreviousYrGrp/OtherNetRentalLossAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty7203AmtBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/ShrAllwblLossFromStockBasisGrp/OtherNetRentalLossAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty7203AmtBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/ShrAllwblLossFromDebtBasisGrp/OtherNetRentalLossAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty7203AmtBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/ShrCarryoverAmountsGrp/OtherNetRentalLossAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 38 -->
					<div class="sty7203LineDiv">
						<div class="styLNLeftNumBox" style="width:7mm;">38</div>
						<div class="sty7203DescShorter" style="">
							Net capital loss
							<span class="sty8995ASchADotLn">.....</span>
						</div>
						<div class="sty7203AmtBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/ShrCurrentYrLossDeductionsGrp/NetCapitalLossAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty7203AmtBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/ShrCarryoverAmtPreviousYrGrp/NetCapitalLossAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty7203AmtBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/ShrAllwblLossFromStockBasisGrp/NetCapitalLossAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty7203AmtBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/ShrAllwblLossFromDebtBasisGrp/NetCapitalLossAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty7203AmtBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/ShrCarryoverAmountsGrp/NetCapitalLossAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 39 -->
					<div class="sty7203LineDiv">
						<div class="styLNLeftNumBox" style="width:7mm;">39</div>
						<div class="sty7203DescShorter" style="">
							Net section 1231 loss
							<span class="sty8995ASchADotLn">...</span>
						</div>
						<div class="sty7203AmtBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/ShrCurrentYrLossDeductionsGrp/NetSection1231LossAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty7203AmtBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/ShrCarryoverAmtPreviousYrGrp/NetSection1231LossAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty7203AmtBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/ShrAllwblLossFromStockBasisGrp/NetSection1231LossAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty7203AmtBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/ShrAllwblLossFromDebtBasisGrp/NetSection1231LossAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty7203AmtBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/ShrCarryoverAmountsGrp/NetSection1231LossAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 40 -->
					<div class="sty7203LineDiv">
						<div class="styLNLeftNumBox" style="width:7mm;">40</div>
						<div class="sty7203DescShorter" style="">
							Other loss
							<span class="sty8995ASchADotLn">.......</span>
						</div>
						<div class="sty7203AmtBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/ShrCurrentYrLossDeductionsGrp/OtherLossAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty7203AmtBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/ShrCarryoverAmtPreviousYrGrp/OtherLossAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty7203AmtBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/ShrAllwblLossFromStockBasisGrp/OtherLossAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty7203AmtBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/ShrAllwblLossFromDebtBasisGrp/OtherLossAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty7203AmtBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/ShrCarryoverAmountsGrp/OtherLossAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 41 -->
					<div class="sty7203LineDiv">
						<div class="styLNLeftNumBox" style="width:7mm;">41</div>
						<div class="sty7203DescShorter" style="">
							Section 179 deductions
							<span class="sty8995ASchADotLn">...</span>
						</div>
						<div class="sty7203AmtBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/ShrCurrentYrLossDeductionsGrp/Section179DeductionAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty7203AmtBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/ShrCarryoverAmtPreviousYrGrp/Section179DeductionAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty7203AmtBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/ShrAllwblLossFromStockBasisGrp/Section179DeductionAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty7203AmtBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/ShrAllwblLossFromDebtBasisGrp/Section179DeductionAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty7203AmtBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/ShrCarryoverAmountsGrp/Section179DeductionAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 42 -->
					<div class="sty7203LineDiv">
						<div class="styLNLeftNumBox" style="width:7mm;">42</div>
						<div class="sty7203DescShorter" style="">
							Charitable contributions
							<span class="sty8995ASchADotLn">...</span>
						</div>
						<div class="sty7203AmtBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/ShrCurrentYrLossDeductionsGrp/CharitableContributionAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty7203AmtBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/ShrCarryoverAmtPreviousYrGrp/CharitableContributionAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty7203AmtBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/ShrAllwblLossFromStockBasisGrp/CharitableContributionAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty7203AmtBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/ShrAllwblLossFromDebtBasisGrp/CharitableContributionAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty7203AmtBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/ShrCarryoverAmountsGrp/CharitableContributionAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 43 -->
					<div class="sty7203LineDiv">
						<div class="styLNLeftNumBox" style="width:7mm;">43</div>
						<div class="sty7203DescShorter" style="">
							Investment interest expense
							<span class="sty8995ASchADotLn">.</span>
						</div>
						<div class="sty7203AmtBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/ShrCurrentYrLossDeductionsGrp/InvestmentInterestExpenseAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty7203AmtBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/ShrCarryoverAmtPreviousYrGrp/InvestmentInterestExpenseAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty7203AmtBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/ShrAllwblLossFromStockBasisGrp/InvestmentInterestExpenseAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty7203AmtBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/ShrAllwblLossFromDebtBasisGrp/InvestmentInterestExpenseAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty7203AmtBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/ShrCarryoverAmountsGrp/InvestmentInterestExpenseAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 44 -->
					<div class="sty7203LineDiv">
						<div class="styLNLeftNumBox" style="width:7mm;">44</div>
						<div class="sty7203DescShorter" style="">
							Section 59(e)(2) expenditures
							<span class="sty8995ASchADotLn">.</span>
						</div>
						<div class="sty7203AmtBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/ShrCurrentYrLossDeductionsGrp/Section59e2ExpendituresAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty7203AmtBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/ShrCarryoverAmtPreviousYrGrp/Section59e2ExpendituresAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty7203AmtBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/ShrAllwblLossFromStockBasisGrp/Section59e2ExpendituresAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty7203AmtBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/ShrAllwblLossFromDebtBasisGrp/Section59e2ExpendituresAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty7203AmtBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/ShrCarryoverAmountsGrp/Section59e2ExpendituresAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 45 -->
					<div class="sty7203LineDiv">
						<div class="styLNLeftNumBox" style="width:7mm;">45</div>
						<div class="sty7203DescShorter" style="">
							Other deductions
							<span class="sty8995ASchADotLn">.....</span>
						</div>
						<div class="sty7203AmtBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/ShrCurrentYrLossDeductionsGrp/OtherDeductionsAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty7203AmtBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/ShrCarryoverAmtPreviousYrGrp/OtherDeductionsAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty7203AmtBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/ShrAllwblLossFromStockBasisGrp/OtherDeductionsAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty7203AmtBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/ShrAllwblLossFromDebtBasisGrp/OtherDeductionsAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty7203AmtBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/ShrCarryoverAmountsGrp/OtherDeductionsAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 46 -->
					<div class="sty7203LineDiv">
						<div class="styLNLeftNumBox" style="width:7mm;">46</div>
						<div class="sty7203DescShorter" style="">
							Foreign taxes paid or accrued
							<span class="sty8995ASchADotLn">.</span>
						</div>
						<div class="sty7203AmtBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/ShrCurrentYrLossDeductionsGrp/ForeignTaxesPaidOrAccruedAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty7203AmtBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/ShrCarryoverAmtPreviousYrGrp/ForeignTaxesPaidOrAccruedAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty7203AmtBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/ShrAllwblLossFromStockBasisGrp/ForeignTaxesPaidOrAccruedAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty7203AmtBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/ShrAllwblLossFromDebtBasisGrp/ForeignTaxesPaidOrAccruedAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty7203AmtBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/ShrCarryoverAmountsGrp/ForeignTaxesPaidOrAccruedAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 47 -->
					<div class="sty7203LineDiv">
						<div class="styLNLeftNumBox" style="width:7mm;">47</div>
						<div class="sty7203DescShorter" style="height:17mm;padding-right:2px;">
							<strong>Total loss.</strong> Add lines 35 through 46 for each column. Enter the total loss in 
							column (c) on line 11 and enter the total loss in column (d) on line 30
							<span class="sty8995ASchADotLn">......</span>
						</div>
						<div class="sty7203AmtBox" style="height:17mm;border-bottom-width:0px;"><br /><br /><br /><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/ShrCurrentYrLossDeductionsGrp/TotalAllowableLossAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty7203AmtBox" style="height:17mm;border-bottom-width:0px;"><br /><br /><br /><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/ShrCarryoverAmtPreviousYrGrp/TotalAllowableLossAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty7203AmtBox" style="height:17mm;border-bottom-width:0px;"><br /><br /><br /><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/ShrAllwblLossFromStockBasisGrp/TotalAllowableLossAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty7203AmtBox" style="height:17mm;border-bottom-width:0px;"><br /><br /><br /><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/ShrAllwblLossFromDebtBasisGrp/TotalAllowableLossAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty7203AmtBox" style="height:17mm;border-bottom-width:0px;"><br /><br /><br /><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/ShrCarryoverAmountsGrp/TotalAllowableLossAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Form footer -->
					<div class="styStdDiv pageEnd" style="border-top:2px solid black;">
						<span style="float:right;">Form <span style="font-weight:bold;font-size:9pt;">7203</span> (Rev. 12-2022)</span>
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
					</table>
					<xsl:if test="$p2separated">
						<br />
						<br />
						<span class="styRepeatingDataTitle">Part II - Shareholder Debt Basis</span><br />
						<xsl:for-each select="$FormData/ShareholderDebtBasisGrp">
							<xsl:if test="(position() + 3) mod 6 = 1">
								<xsl:variable name="pos" select="position()"/>
								<div class="sty7203LineDiv" style="border-top:1px solid black;">
									<div class="styLNLeftNumBox" style="height:15mm;width:6.5mm;border-bottom:1px solid black;"></div>
									<div class="sty7203AmtBoxEx" style="height:15mm;text-align:left;">
										<span style="width:100%;text-align:center;">Debt <xsl:value-of select="$pos"/></span><br />
										<input type="checkbox" class="styCkboxNM" style="margin:0px 2px;">
											<xsl:attribute name="alt">Debt <xsl:value-of select="$pos"/> Formal Note</xsl:attribute>
											<xsl:call-template name="PopulateCheckbox">
												<xsl:with-param name="TargetNode" select="$FormData/ShareholderDebtBasisGrp[$pos]/FormalNoteInd"/>
												<xsl:with-param name="BackupName">ShareholderDebtBasisGrp<xsl:value-of select="$pos"/>FormalNoteInd</xsl:with-param>
											</xsl:call-template>
										</input>
										Formal note <br />
										<input type="checkbox" class="styCkboxNM" style="margin:2px 2px;float:left;">
											<xsl:attribute name="alt">Debt <xsl:value-of select="$pos"/> Formal Note</xsl:attribute>
											<xsl:call-template name="PopulateCheckbox">
												<xsl:with-param name="TargetNode" select="$FormData/ShareholderDebtBasisGrp[$pos]/OpenAccountDebtInd"/>
												<xsl:with-param name="BackupName">ShareholderDebtBasisGrp<xsl:value-of select="$pos"/>OpenAccountDebtInd</xsl:with-param>
											</xsl:call-template>
										</input>
										<span style="width:21mm;padding-left:4px;float:left;margin-top:2px;">Open account debt</span> 
									</div>
									<div class="sty7203AmtBoxEx" style="height:15mm;text-align:left;">
										<span style="width:100%;text-align:center;">Debt <xsl:value-of select="$pos + 1"/></span><br />
										<input type="checkbox" class="styCkboxNM" style="margin:0px 2px;">
											<xsl:attribute name="alt">Debt <xsl:value-of select="$pos + 1"/> Formal Note</xsl:attribute>
											<xsl:call-template name="PopulateCheckbox">
												<xsl:with-param name="TargetNode" select="$FormData/ShareholderDebtBasisGrp[$pos + 1]/FormalNoteInd"/>
												<xsl:with-param name="BackupName">ShareholderDebtBasisGrp<xsl:value-of select="$pos + 1"/>FormalNoteInd</xsl:with-param>
											</xsl:call-template>
										</input>
										Formal note <br />
										<input type="checkbox" class="styCkboxNM" style="margin:2px 2px;float:left;">
											<xsl:attribute name="alt">Debt <xsl:value-of select="$pos + 1"/> Formal Note</xsl:attribute>
											<xsl:call-template name="PopulateCheckbox">
												<xsl:with-param name="TargetNode" select="$FormData/ShareholderDebtBasisGrp[$pos + 1]/OpenAccountDebtInd"/>
												<xsl:with-param name="BackupName">ShareholderDebtBasisGrp<xsl:value-of select="$pos + 1"/>OpenAccountDebtInd</xsl:with-param>
											</xsl:call-template>
										</input>
										<span style="width:21mm;padding-left:4px;float:left;margin-top:2px;">Open account debt</span> 
									</div>
									<div class="sty7203AmtBoxEx" style="height:15mm;text-align:left;">
										<span style="width:100%;text-align:center;">Debt <xsl:value-of select="$pos + 2"/></span><br />
										<input type="checkbox" class="styCkboxNM" style="margin:0px 2px;">
											<xsl:attribute name="alt">Debt <xsl:value-of select="$pos + 2"/> Formal Note</xsl:attribute>
											<xsl:call-template name="PopulateCheckbox">
												<xsl:with-param name="TargetNode" select="$FormData/ShareholderDebtBasisGrp[$pos + 2]/FormalNoteInd"/>
												<xsl:with-param name="BackupName">ShareholderDebtBasisGrp<xsl:value-of select="$pos + 2"/>FormalNoteInd</xsl:with-param>
											</xsl:call-template>
										</input>
										Formal note <br />
										<input type="checkbox" class="styCkboxNM" style="margin:2px 2px;float:left;">
											<xsl:attribute name="alt">Debt <xsl:value-of select="$pos + 2"/> Formal Note</xsl:attribute>
											<xsl:call-template name="PopulateCheckbox">
												<xsl:with-param name="TargetNode" select="$FormData/ShareholderDebtBasisGrp[$pos + 2]/OpenAccountDebtInd"/>
												<xsl:with-param name="BackupName">ShareholderDebtBasisGrp<xsl:value-of select="$pos + 2"/>OpenAccountDebtInd</xsl:with-param>
											</xsl:call-template>
										</input>
										<span style="width:21mm;padding-left:4px;float:left;margin-top:2px;">Open account debt</span> 
									</div>
									<div class="sty7203AmtBoxEx" style="height:15mm;text-align:left;">
										<span style="width:100%;text-align:center;">Debt <xsl:value-of select="$pos + 3"/></span><br />
										<input type="checkbox" class="styCkboxNM" style="margin:0px 2px;">
											<xsl:attribute name="alt">Debt <xsl:value-of select="$pos + 3"/> Formal Note</xsl:attribute>
											<xsl:call-template name="PopulateCheckbox">
												<xsl:with-param name="TargetNode" select="$FormData/ShareholderDebtBasisGrp[$pos + 3]/FormalNoteInd"/>
												<xsl:with-param name="BackupName">ShareholderDebtBasisGrp<xsl:value-of select="$pos + 3"/>FormalNoteInd</xsl:with-param>
											</xsl:call-template>
										</input>
										Formal note <br />
										<input type="checkbox" class="styCkboxNM" style="margin:2px 2px;float:left;">
											<xsl:attribute name="alt">Debt <xsl:value-of select="$pos + 3"/> Formal Note</xsl:attribute>
											<xsl:call-template name="PopulateCheckbox">
												<xsl:with-param name="TargetNode" select="$FormData/ShareholderDebtBasisGrp[$pos + 3]/OpenAccountDebtInd"/>
												<xsl:with-param name="BackupName">ShareholderDebtBasisGrp<xsl:value-of select="$pos + 3"/>OpenAccountDebtInd</xsl:with-param>
											</xsl:call-template>
										</input>
										<span style="width:21mm;padding-left:4px;float:left;margin-top:2px;">Open account debt</span> 
									</div>
									<div class="sty7203AmtBoxEx" style="height:15mm;text-align:left;">
										<span style="width:100%;text-align:center;">Debt <xsl:value-of select="$pos + 4"/></span><br />
										<input type="checkbox" class="styCkboxNM" style="margin:0px 2px;">
											<xsl:attribute name="alt">Debt <xsl:value-of select="$pos + 4"/> Formal Note</xsl:attribute>
											<xsl:call-template name="PopulateCheckbox">
												<xsl:with-param name="TargetNode" select="$FormData/ShareholderDebtBasisGrp[$pos + 4]/FormalNoteInd"/>
												<xsl:with-param name="BackupName">ShareholderDebtBasisGrp<xsl:value-of select="$pos + 4"/>FormalNoteInd</xsl:with-param>
											</xsl:call-template>
										</input>
										Formal note <br />
										<input type="checkbox" class="styCkboxNM" style="margin:2px 2px;float:left;">
											<xsl:attribute name="alt">Debt <xsl:value-of select="$pos + 4"/> Formal Note</xsl:attribute>
											<xsl:call-template name="PopulateCheckbox">
												<xsl:with-param name="TargetNode" select="$FormData/ShareholderDebtBasisGrp[$pos + 4]/OpenAccountDebtInd"/>
												<xsl:with-param name="BackupName">ShareholderDebtBasisGrp<xsl:value-of select="$pos + 4"/>OpenAccountDebtInd</xsl:with-param>
											</xsl:call-template>
										</input>
										<span style="width:21mm;padding-left:4px;float:left;margin-top:2px;">Open account debt</span> 
									</div>
									<div class="sty7203AmtBoxEx" style="height:15mm;text-align:left;">
										<span style="width:100%;text-align:center;">Debt <xsl:value-of select="$pos + 5"/></span><br />
										<input type="checkbox" class="styCkboxNM" style="margin:0px 2px;">
											<xsl:attribute name="alt">Debt <xsl:value-of select="$pos + 5"/> Formal Note</xsl:attribute>
											<xsl:call-template name="PopulateCheckbox">
												<xsl:with-param name="TargetNode" select="$FormData/ShareholderDebtBasisGrp[$pos + 5]/FormalNoteInd"/>
												<xsl:with-param name="BackupName">ShareholderDebtBasisGrp<xsl:value-of select="$pos + 5"/>FormalNoteInd</xsl:with-param>
											</xsl:call-template>
										</input>
										Formal note <br />
										<input type="checkbox" class="styCkboxNM" style="margin:2px 2px;float:left;">
											<xsl:attribute name="alt">Debt <xsl:value-of select="$pos + 5"/> Formal Note</xsl:attribute>
											<xsl:call-template name="PopulateCheckbox">
												<xsl:with-param name="TargetNode" select="$FormData/ShareholderDebtBasisGrp[$pos + 5]/OpenAccountDebtInd"/>
												<xsl:with-param name="BackupName">ShareholderDebtBasisGrp<xsl:value-of select="$pos + 5"/>OpenAccountDebtInd</xsl:with-param>
											</xsl:call-template>
										</input>
										<span style="width:21mm;padding-left:4px;float:left;margin-top:2px;">Open account debt</span> 
									</div>
								</div>
								<div class="sty7203LineDiv" style="border-bottom:1px solid black;text-align:center;padding:0.5mm;">
									<strong>Section A &mdash; Amount of Debt </strong>
								</div>
								<!-- Line 16Ex -->
								<xsl:call-template name="P2ExLine">
									<xsl:with-param name="LineNum" select="16"/>
									<xsl:with-param name="Position" select="$pos"/>
									<xsl:with-param name="LineElement">LoanBalanceBeginTaxYrAmt</xsl:with-param>
								</xsl:call-template>
								<!-- Line 17Ex -->
								<xsl:call-template name="P2ExLine">
									<xsl:with-param name="LineNum" select="17"/>
									<xsl:with-param name="Position" select="$pos"/>
									<xsl:with-param name="LineElement">AdditionalLoansAmt</xsl:with-param>
								</xsl:call-template>
								<!-- Line 18Ex -->
								<xsl:call-template name="P2ExLine">
									<xsl:with-param name="LineNum" select="18"/>
									<xsl:with-param name="Position" select="$pos"/>
									<xsl:with-param name="LineElement">LoanedBeginningBalAmt</xsl:with-param>
								</xsl:call-template>
								<!-- Line 19Ex -->
								<xsl:call-template name="P2ExLine">
									<xsl:with-param name="LineNum" select="19"/>
									<xsl:with-param name="Position" select="$pos"/>
									<xsl:with-param name="LineElement">PrincipalDebtRepaymentAmt</xsl:with-param>
								</xsl:call-template>
								<!-- Line 20Ex -->
								<xsl:call-template name="P2ExLine">
									<xsl:with-param name="LineNum" select="20"/>
									<xsl:with-param name="Position" select="$pos"/>
									<xsl:with-param name="LineElement">LoanBalanceEndTaxYrAmt</xsl:with-param>
								</xsl:call-template>
								<div class="sty7203LineDiv" style="border-bottom:1px solid black;text-align:center;padding:0.5mm;font-weight:bold;">
									Section B &mdash; Adjustments to Debt Basis
								</div>
								<!--<div class="sty7203LineDiv" style="border-top:1px solid black;">
									<div class="styLNLeftNumBox" style="width:6.5mm;border-bottom:1px solid black;"></div>
									<div class="sty7203AmtBoxEx" style="text-align:center;">
										Debt <xsl:value-of select="$pos"/>
									</div>
									<div class="sty7203AmtBoxEx" style="text-align:center;">
										Debt <xsl:value-of select="$pos + 1"/>
									</div>
									<div class="sty7203AmtBoxEx" style="text-align:center;">
										Debt <xsl:value-of select="$pos + 2"/>
									</div>
									<div class="sty7203AmtBoxEx" style="text-align:center;">
										Debt <xsl:value-of select="$pos + 3"/>
									</div>
									<div class="sty7203AmtBoxEx" style="text-align:center;">
										Debt <xsl:value-of select="$pos + 4"/>
									</div>
									<div class="sty7203AmtBoxEx" style="text-align:center;">
										Debt <xsl:value-of select="$pos + 5"/>
									</div>
								</div>-->
								<!-- Line 21Ex -->
								<xsl:call-template name="P2ExLine">
									<xsl:with-param name="LineNum" select="21"/>
									<xsl:with-param name="Position" select="$pos"/>
									<xsl:with-param name="LineElement">DebtBasisBeginTaxYrAmt</xsl:with-param>
								</xsl:call-template>
								<!-- Line 22Ex -->
								<xsl:call-template name="P2ExLine">
									<xsl:with-param name="LineNum" select="22"/>
									<xsl:with-param name="Position" select="$pos"/>
									<xsl:with-param name="LineElement">AdditionalLoansAmt</xsl:with-param>
								</xsl:call-template>
								<!-- Line 23Ex -->
								<xsl:call-template name="P2ExLine">
									<xsl:with-param name="LineNum" select="23"/>
									<xsl:with-param name="Position" select="$pos"/>
									<xsl:with-param name="LineElement">DebtBasisRestorationAmt</xsl:with-param>
								</xsl:call-template>
								<!-- Line 24Ex -->
								<xsl:call-template name="P2ExLine">
									<xsl:with-param name="LineNum" select="24"/>
									<xsl:with-param name="Position" select="$pos"/>
									<xsl:with-param name="LineElement">DebtBasisBfrRepaymentAmt</xsl:with-param>
								</xsl:call-template>
								<!-- Line 25Ex -->
								<xsl:call-template name="P2ExLine">
									<xsl:with-param name="LineNum" select="25"/>
									<xsl:with-param name="Position" select="$pos"/>
									<xsl:with-param name="LineElement">DebtLoanRepaymentPct</xsl:with-param>
								</xsl:call-template>
								<!-- Line 26Ex -->
								<xsl:call-template name="P2ExLine">
									<xsl:with-param name="LineNum" select="26"/>
									<xsl:with-param name="Position" select="$pos"/>
									<xsl:with-param name="LineElement">NontaxableDebtRepaymentAmt</xsl:with-param>
								</xsl:call-template>
								<!-- Line 27Ex -->
								<xsl:call-template name="P2ExLine">
									<xsl:with-param name="LineNum" select="27"/>
									<xsl:with-param name="Position" select="$pos"/>
									<xsl:with-param name="LineElement">DebtBasisBfrExpnssLossAmt</xsl:with-param>
								</xsl:call-template>
								<!-- Line 28Ex -->
								<xsl:call-template name="P2ExLine">
									<xsl:with-param name="LineNum" select="28"/>
									<xsl:with-param name="Position" select="$pos"/>
									<xsl:with-param name="LineElement">NondedExpnssOilGasDpltnAmt</xsl:with-param>
								</xsl:call-template>
								<!-- Line 29Ex -->
								<xsl:call-template name="P2ExLine">
									<xsl:with-param name="LineNum" select="29"/>
									<xsl:with-param name="Position" select="$pos"/>
									<xsl:with-param name="LineElement">DebtBasisBeforeLossDedAmt</xsl:with-param>
								</xsl:call-template>
								<!-- Line 30Ex -->
								<xsl:call-template name="P2ExLine">
									<xsl:with-param name="LineNum" select="30"/>
									<xsl:with-param name="Position" select="$pos"/>
									<xsl:with-param name="LineElement">AllowableLossAmt</xsl:with-param>
								</xsl:call-template>
								<!-- Line 31Ex -->
								<xsl:call-template name="P2ExLine">
									<xsl:with-param name="LineNum" select="31"/>
									<xsl:with-param name="Position" select="$pos"/>
									<xsl:with-param name="LineElement">DebtBasisEndTaxYrAmt</xsl:with-param>
								</xsl:call-template>
								<div class="sty7203LineDiv" style="border-bottom:1px solid black;text-align:center;padding:0.5mm;font-weight:bold;">
									Section C &mdash; Gain on Loan Repayment
								</div>
								<!-- Line 32Ex -->
								<xsl:call-template name="P2ExLine">
									<xsl:with-param name="LineNum" select="32"/>
									<xsl:with-param name="Position" select="$pos"/>
									<xsl:with-param name="LineElement">PrincipalDebtRepaymentAmt</xsl:with-param>
								</xsl:call-template>
								<!-- Line 33Ex -->
								<xsl:call-template name="P2ExLine">
									<xsl:with-param name="LineNum" select="33"/>
									<xsl:with-param name="Position" select="$pos"/>
									<xsl:with-param name="LineElement">NontaxableDebtRepaymentAmt</xsl:with-param>
								</xsl:call-template>
								<!-- Line 34Ex -->
								<xsl:call-template name="P2ExLine">
									<xsl:with-param name="LineNum" select="34"/>
									<xsl:with-param name="Position" select="$pos"/>
									<xsl:with-param name="LineElement">ReportableGainAmt</xsl:with-param>
								</xsl:call-template>
							</xsl:if>
						</xsl:for-each>
					</xsl:if>					
					<br /><br />
				</form>
			</body>
		</html>
	</xsl:template>
	<xsl:template name="P2ExLine">
		<xsl:param name="LineNum"/>
		<xsl:param name="Position"/>
		<xsl:param name="LineElement"/>
		<div class="sty7203LineDiv">
			<div class="styLNLeftNumBox" style="width:6.5mm;"><xsl:value-of select="$LineNum"/></div>
			<div class="sty7203AmtBoxEx">
				<xsl:call-template name="PopulateAmount">
					<xsl:with-param name="TargetNode" select="$FormData/ShareholderDebtBasisGrp[$Position]/*[local-name() = $LineElement]"/>
				</xsl:call-template>
			</div>
			<div class="sty7203AmtBoxEx">
				<xsl:call-template name="PopulateAmount">
					<xsl:with-param name="TargetNode" select="$FormData/ShareholderDebtBasisGrp[$Position + 1]/*[local-name() = $LineElement]"/>
				</xsl:call-template>
			</div>
			<div class="sty7203AmtBoxEx">
				<xsl:call-template name="PopulateAmount">
					<xsl:with-param name="TargetNode" select="$FormData/ShareholderDebtBasisGrp[$Position + 2]/*[local-name() = $LineElement]"/>
				</xsl:call-template>
			</div>
			<div class="sty7203AmtBoxEx">
				<xsl:call-template name="PopulateAmount">
					<xsl:with-param name="TargetNode" select="$FormData/ShareholderDebtBasisGrp[$Position + 3]/*[local-name() = $LineElement]"/>
				</xsl:call-template>
			</div>
			<div class="sty7203AmtBoxEx">
				<xsl:call-template name="PopulateAmount">
					<xsl:with-param name="TargetNode" select="$FormData/ShareholderDebtBasisGrp[$Position + 4]/*[local-name() = $LineElement]"/>
				</xsl:call-template>
			</div>
			<div class="sty7203AmtBoxEx">
				<xsl:call-template name="PopulateAmount">
					<xsl:with-param name="TargetNode" select="$FormData/ShareholderDebtBasisGrp[$Position + 5]/*[local-name() = $LineElement]"/>
				</xsl:call-template>
			</div>
		</div>
	</xsl:template>
</xsl:stylesheet>
