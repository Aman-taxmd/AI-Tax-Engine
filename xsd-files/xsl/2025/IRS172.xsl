<?xml version="1.0" encoding="UTF-8"?>
<!-- 06/12/2025 - 1001759 - AJH -->
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
	<xsl:include href="IRS172Style.xsl"/>
	<xsl:output method="html" indent="yes"/>
	<xsl:strip-space elements="*"/>
	<xsl:param name="FormData" select="$RtnDoc/IRS172"/>
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
				<meta name="Description" content="IRS Form 172"/>
				<!-- javascript include -->
				<script language="JavaScript" src="{$ScriptPath}/FormDisplay.js" type="text/javascript"/>
				<xsl:call-template name="InitJS"/>
				<style type="text/css">
					<xsl:if test="not($Print) or $Print=''">
						<xsl:call-template name="IRS172Style"/>
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
						Form <span class="styFormNumber">172</span>
						<xsl:call-template name="SetFormLinkInline">
							<xsl:with-param name="TargetNode" select="$FormData"/>
						</xsl:call-template>
						<br/>
						<span style="font-size:7pt;">(December 2024)</span><br />
						<span class="styAgency">Department of the Treasury</span>
						<span class="styAgency">Internal Revenue Service</span>
					</div>
					<div class="styFTBox" style="width:124mm;height:18mm;padding-top:2mm;">
						<span class="styMainTitle">Net Operating Losses (NOLs)</span>
						<div class="styFST" style="padding-top:2mm;">
							For Individuals, Estates, and Trusts.<br/>
							Go to <span style="font-style:italic;">www.irs.gov/Form172</span> for instructions and the latest information.
						</div>
					</div>
					<div class="styTYBox" style="width:32mm;height:18mm;padding-top:8mm;">
						OMB No. 1545-0074
					</div>
				</div>
				<div class="styStdDiv" style="padding-top:2mm;padding-bottom:2mm;border-top:1px solid black;">
					For calendar year 
					<span style="width:20mm;border-bottom:1px solid black;text-align:center;">
						<xsl:call-template name="PopulateYear">
							<xsl:with-param name="TargetNode" select="$RtnHdrData/TaxYr"/>
						</xsl:call-template>
					</span> 
					, or other tax year beginning 
					<span style="width:40mm;border-bottom:1px solid black;text-align:center;">
						<xsl:call-template name="PopulateReturnHeaderTaxPeriodBeginDate"/>
					</span> 
					and ending
					<span style="width:40mm;border-bottom:1px solid black;text-align:center;">
						<xsl:call-template name="PopulateReturnHeaderTaxPeriodEndDate"/>
					</span> 
				</div>
				<div class="styStdDiv" style="border-top:1px solid black;">
					<div class="styNameBox" style="width:138mm;font-size:7pt;">
						Name(s) shown on return <br/>
						<xsl:call-template name="PopulateReturnHeaderFiler">
							<xsl:with-param name="TargetNode">BusinessNameLine1Txt</xsl:with-param>
						</xsl:call-template>
						<xsl:if test="$RtnHdrData/Filer//BusinessNameLine2Txt">
							<br/>
							<xsl:call-template name="PopulateReturnHeaderFiler">
								<xsl:with-param name="TargetNode">BusinessNameLine2Txt</xsl:with-param>
							</xsl:call-template>
						</xsl:if>
					</div>
					<div class="styEINBox" style="width:49mm;padding-left:1mm;text-align:left;font-size:7pt;">
						<span style="font-weight:bold;font-family:Arial Narrow;">Social security or employer identification number</span>
						<br/>
						<span style="font-weight:normal;">
							<xsl:call-template name="PopulateReturnHeaderFilerTIN">
								<xsl:with-param name="EINChanged" select="true()"/>
							</xsl:call-template>
						</span>
					</div>
				</div>
				<div class="styStdDiv" style="border-top:1px solid black;">
					<div class="styNameBox" style="width:113mm;font-size:7pt;">
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
					<div class="styNameBox" style="width:25mm;font-size:7pt;padding-left:0.5mm;">
						Apt. or suite no.<br/><br />
						<xsl:if test="$RtnHdrData/Filer//AddressLine2Txt"><br/></xsl:if>
					</div>
					<div class="styEINBox" style="width:49mm;padding-left:1mm;text-align:left;font-size:7pt;">
						<span style="font-weight:bold;font-family:Arial;">Spouse's social security number (SSN)</span>
						<br/>
						<span style="font-weight:normal;">
							<xsl:call-template name="PopulateReturnHeaderFiler">
								<xsl:with-param name="TargetNode">SpouseSSN</xsl:with-param>
								<xsl:with-param name="EINChanged" select="true()"/>
							</xsl:call-template>
						</span>
					</div>
				</div>
				<div class="styStdDiv" style="border-top:1px solid black;">
					<div class="styNameBox" style="width:95mm;font-size:7pt;">
						<span style="font-family:Arial;">City, town, or post office. If you have a foreign address, also complete spaces below.</span> <br/>
						<xsl:call-template name="PopulateReturnHeaderFiler">
							<xsl:with-param name="TargetNode">CityNm</xsl:with-param>
						</xsl:call-template>
					</div>
					<div class="styNameBox" style="width:18mm;font-size:7pt;padding-left:0.5mm;">
						State<br/>
						<xsl:call-template name="PopulateReturnHeaderFiler">
							<xsl:with-param name="TargetNode">StateAbbreviationCd</xsl:with-param>
						</xsl:call-template>
					</div>
					<div class="styNameBox" style="width:25mm;font-size:7pt;padding-left:0.5mm;">
						ZIP Code<br/>
						<xsl:call-template name="PopulateReturnHeaderFiler">
							<xsl:with-param name="TargetNode">ZIPCd</xsl:with-param>
						</xsl:call-template>
					</div>
					<div class="styEINBox" style="width:49mm;padding-left:1mm;text-align:left;font-size:7pt;font-weight:normal;word-break:break-all;">
						Daytime phone number
						<br/>
						<xsl:choose>
							<xsl:when test="$RtnHdrData/Filer/ForeignPhoneNum">
								<xsl:call-template name="PopulateReturnHeaderFiler">
									<xsl:with-param name="TargetNode">ForeignPhoneNum</xsl:with-param>
								</xsl:call-template>
							</xsl:when>
							<xsl:otherwise>
								<xsl:call-template name="PopulateReturnHeaderFiler">
									<xsl:with-param name="TargetNode">PhoneNum</xsl:with-param>
								</xsl:call-template>
							</xsl:otherwise>
						</xsl:choose>
					</div>
				</div>
				<div class="styStdDiv" style="border-top:1px solid black;height:auto;">
					<div class="styNameBox" style="width:89mm;font-size:7pt;padding-left:0.5mm;">
						Foreign country name<br/>
						<xsl:call-template name="PopulateReturnHeaderFiler">
							<xsl:with-param name="TargetNode">CountryCd</xsl:with-param>
							<xsl:with-param name="MainForm" select="true()"/>
						</xsl:call-template>
					</div>
					<div class="styNameBox" style="width:49mm;font-size:7pt;padding-left:0.5mm;">
						Foreign province/county<br/>
						<xsl:call-template name="PopulateReturnHeaderFiler">
							<xsl:with-param name="TargetNode">ProvinceOrStateNm</xsl:with-param>
						</xsl:call-template>
					</div>
					<div class="styNameBox" style="width:49mm;padding-left:1mm;text-align:left;font-size:7pt;font-weight:normal;word-break:break-all;border-right:0px">
						Foreign postal code<br/>
						<xsl:call-template name="PopulateReturnHeaderFiler">
							<xsl:with-param name="TargetNode">ForeignPostalCd</xsl:with-param>
						</xsl:call-template>
					</div>
				</div>
				<!-- Form body -->
				<!-- Part I - Header -->
				<div class="styStdDiv" style="border-top:1px solid black;border-bottom:1px solid black;">
					<span class="styPartName" style="width:16mm;">Part I</span>
					<span class="styPartDesc" style="width:170mm;height:auto;font-weight:normal;">
						<strong>NOL</strong> (see instructions) <br/>
					</span>
				</div>
				<!-- P1 Line 1 -->
				<div class="styStdDiv" style="">
					<div class="styLNLeftNumBoxSD">1</div>
					<div class="sty4626LongDesc" style="">
						For individuals, subtract your standard deduction or itemized deductions from your adjusted gross 
						income (AGI) and enter it here. For estates and trusts, enter taxable income increased by the total of 
						the charitable deduction, income distribution deduction, and exemption amount
						<span class="sty4626DotLn">..................</span>
					</div>
					<div class="sty4626RightNumBox" style="height:auto;"><br /><br />1</div>
					<div class="sty4626AmtBox" style="height:auto;"><br /><br />
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/IncomeAmt"/>
						</xsl:call-template>
					</div>
				</div>
				<!-- P1 Line 2 -->
				<div class="styStdDiv" style="">
					<div class="styLNLeftNumBoxSD">2</div>
					<div class="sty4626MediumDesc" style="">
						Nonbusiness capital losses before limitation. Enter as a positive number
						<span class="sty4626DotLn">....</span>
					</div>
					<div class="sty4626RightNumBox" style="">2</div>
					<div class="sty4626AmtBox" style="">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/NBCapitalLossAmt"/>
						</xsl:call-template>
					</div>
					<div class="sty4626RightNumBox" style="background-color:lightgrey;border-bottom-width:0px;">&nbsp;</div>
					<div class="sty4626AmtBoxNBB" style="">&nbsp;</div>
				</div>
				<!-- P1 Line 3 -->
				<div class="styStdDiv" style="">
					<div class="styLNLeftNumBoxSD">3</div>
					<div class="sty4626MediumDesc" style="">
						Nonbusiness capital gains (without regard to any section 1202 exclusion)
						<span class="sty4626DotLn">...</span>
					</div>
					<div class="sty4626RightNumBox" style="">3</div>
					<div class="sty4626AmtBox" style="">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/NBCapitalGainAmt"/>
						</xsl:call-template>
					</div>
					<div class="sty4626RightNumBox" style="background-color:lightgrey;border-bottom-width:0px;">&nbsp;</div>
					<div class="sty4626AmtBoxNBB" style="">&nbsp;</div>
				</div>
				<!-- P1 Line 4 -->
				<div class="styStdDiv" style="">
					<div class="styLNLeftNumBoxSD">4</div>
					<div class="sty4626MediumDesc" style="">
						If line 2 is more than line 3, enter the difference. Otherwise, enter -0-
						<span class="sty4626DotLn">....</span>
					</div>
					<div class="sty4626RightNumBox" style="">4</div>
					<div class="sty4626AmtBox" style="">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/NBCapLossLessGainAmt"/>
						</xsl:call-template>
					</div>
					<div class="sty4626RightNumBox" style="background-color:lightgrey;border-bottom-width:0px;">&nbsp;</div>
					<div class="sty4626AmtBoxNBB" style="">&nbsp;</div>
				</div>
				<!-- P1 Line 5 -->
				<div class="styStdDiv" style="">
					<div class="styLNLeftNumBoxSD">5</div>
					<div class="sty4626ShortDesc" style="">
						If line 3 is more than line 2, enter the difference. <br /> Otherwise, enter -0-
						<span class="sty4626DotLn">...........</span>
					</div>
					<div class="sty4626RightNumBox" style="height:auto;"><br />5</div>
					<div class="sty4626AmtBox" style="height:auto;"><br />
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/NBCapGainLessLossAmt"/>
						</xsl:call-template>
					</div>
					<div class="sty4626RightNumBox" style="height:auto;background-color:lightgrey;border-bottom-color:lightgrey;"><br />&nbsp;</div>
					<div class="sty4626AmtBoxNBB" style="height:auto;"><br />&nbsp;</div>
					<div class="sty4626RightNumBox" style="height:auto;background-color:lightgrey;border-bottom-color:lightgrey;"><br />&nbsp;</div>
					<div class="sty4626AmtBoxNBB" style="height:auto;"><br />&nbsp;</div>
				</div>
				<!-- P1 Line 6 -->
				<div class="styStdDiv" style="">
					<div class="styLNLeftNumBoxSD">6</div>
					<div class="sty4626MediumDesc" style="">
						Nonbusiness deductions (see instructions). Enter as a positive number
						<span class="sty4626DotLn">....</span>
					</div>
					<div class="sty4626RightNumBox" style="">6</div>
					<div class="sty4626AmtBox" style="">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/NBDeductionsAmt"/>
						</xsl:call-template>
					</div>
					<div class="sty4626RightNumBox" style="background-color:lightgrey;border-bottom-width:0px;">&nbsp;</div>
					<div class="sty4626AmtBoxNBB" style="">&nbsp;</div>
				</div>
				<!-- P1 Line 7 -->
				<div class="styStdDiv" style="">
					<div class="styLNLeftNumBoxSD">7</div>
					<div class="sty4626ShortDesc" style="">
						Nonbusiness income other than capital gains (see instructions)
						<span class="sty4626DotLn">.............</span>
					</div>
					<div class="sty4626RightNumBox" style="height:auto;"><br />7</div>
					<div class="sty4626AmtBox" style="height:auto;"><br />
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/NBIncomeOthThanCapGainAmt"/>
						</xsl:call-template>
					</div>
					<div class="sty4626RightNumBox" style="height:auto;background-color:lightgrey;border-bottom-color:lightgrey;"><br />&nbsp;</div>
					<div class="sty4626AmtBoxNBB" style="height:auto;"><br />&nbsp;</div>
					<div class="sty4626RightNumBox" style="height:auto;background-color:lightgrey;border-bottom-color:lightgrey;"><br />&nbsp;</div>
					<div class="sty4626AmtBoxNBB" style="height:auto;"><br />&nbsp;</div>
				</div>
				<!-- P1 Line 8 -->
				<div class="styStdDiv" style="">
					<div class="styLNLeftNumBoxSD">8</div>
					<div class="sty4626MediumDesc" style="">
						Add lines 5 and 7
						<span class="sty4626DotLn">.....................</span>
					</div>
					<div class="sty4626RightNumBox" style="">8</div>
					<div class="sty4626AmtBox" style="">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/TotNBCapGainLossIncmAmt"/>
						</xsl:call-template>
					</div>
					<div class="sty4626RightNumBox" style="background-color:lightgrey;border-bottom-width:0px;">&nbsp;</div>
					<div class="sty4626AmtBoxNBB" style="">&nbsp;</div>
				</div>
				<!-- P1 Line 9 -->
				<div class="styStdDiv" style="">
					<div class="styLNLeftNumBoxSD">9</div>
					<div class="sty4626LongDesc" style="">
						If line 6 is more than line 8, enter the difference. Otherwise, enter -0-
						<span class="sty4626DotLn">.............</span>
					</div>
					<div class="sty4626RightNumBox" style="">9</div>
					<div class="sty4626AmtBox" style="">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/NBDedLessTotCapGainLossIncmAmt"/>
						</xsl:call-template>
					</div>
				</div>
				<!-- P1 Line 10 -->
				<div class="styStdDiv" style="">
					<div class="styLNLeftNumBox">10</div>
					<div class="sty4626ShortDesc" style="">
						If line 8 is more than line 6, enter the difference. <br /> Otherwise, enter -0-. 
						<strong>But don't enter more than line 5</strong>
					</div>
					<div class="sty4626RightNumBox" style="height:auto;"><br />10</div>
					<div class="sty4626AmtBox" style="height:auto;"><br />
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/TotCapGainLossIncmLessNBDedAmt"/>
						</xsl:call-template>
					</div>
					<div class="sty4626RightNumBox" style="height:auto;background-color:lightgrey;border-bottom-color:lightgrey;"><br />&nbsp;</div>
					<div class="sty4626AmtBoxNBB" style="height:auto;"><br />&nbsp;</div>
					<div class="sty4626RightNumBox" style="height:auto;background-color:lightgrey;border-bottom-color:lightgrey;"><br />&nbsp;</div>
					<div class="sty4626AmtBoxNBB" style="height:auto;"><br />&nbsp;</div>
				</div>
				<!-- P1 Line 11 -->
				<div class="styStdDiv" style="">
					<div class="styLNLeftNumBox">11</div>
					<div class="sty4626MediumDesc" style="">
						Business capital losses before limitation. Enter as a positive number
						<span class="sty4626DotLn">....</span>
					</div>
					<div class="sty4626RightNumBox" style="">11</div>
					<div class="sty4626AmtBox" style="">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/BusinessCapitalLossAmt"/>
						</xsl:call-template>
					</div>
					<div class="sty4626RightNumBox" style="background-color:lightgrey;border-bottom-width:0px;">&nbsp;</div>
					<div class="sty4626AmtBoxNBB" style="">&nbsp;</div>
				</div>
				<!-- P1 Line 12 -->
				<div class="styStdDiv" style="">
					<div class="styLNLeftNumBox">12</div>
					<div class="sty4626ShortDesc" style="">
						Business capital gains (without regard to any <br /> section 1202 exclusion) 
						<span class="sty4626DotLn">.........</span>
					</div>
					<div class="sty4626RightNumBox" style="height:auto;"><br />12</div>
					<div class="sty4626AmtBox" style="height:auto;"><br />
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/BusinessCapitalGainsAmt"/>
						</xsl:call-template>
					</div>
					<div class="sty4626RightNumBox" style="height:auto;background-color:lightgrey;border-bottom-color:lightgrey;"><br />&nbsp;</div>
					<div class="sty4626AmtBoxNBB" style="height:auto;"><br />&nbsp;</div>
					<div class="sty4626RightNumBox" style="height:auto;background-color:lightgrey;border-bottom-color:lightgrey;"><br />&nbsp;</div>
					<div class="sty4626AmtBoxNBB" style="height:auto;"><br />&nbsp;</div>
				</div>
				<!-- P1 Line 13 -->
				<div class="styStdDiv" style="">
					<div class="styLNLeftNumBox">13</div>
					<div class="sty4626MediumDesc" style="">
						Add lines 10 and 12
						<span class="sty4626DotLn">....................</span>
					</div>
					<div class="sty4626RightNumBox" style="">13</div>
					<div class="sty4626AmtBox" style="">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/TotCapGnLssIncmNBDedCapGnAmt"/>
						</xsl:call-template>
					</div>
					<div class="sty4626RightNumBox" style="background-color:lightgrey;border-bottom-width:0px;">&nbsp;</div>
					<div class="sty4626AmtBoxNBB" style="">&nbsp;</div>
				</div>
				<!-- P1 Line 14 -->
				<div class="styStdDiv" style="">
					<div class="styLNLeftNumBox">14</div>
					<div class="sty4626MediumDesc" style="">
						Subtract line 13 from line 11. If zero or less, enter -0-
						<span class="sty4626DotLn">.........</span>
					</div>
					<div class="sty4626RightNumBox" style="">14</div>
					<div class="sty4626AmtBox" style="">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/BusCapLossTotCapGnAmt"/>
						</xsl:call-template>
					</div>
					<div class="sty4626RightNumBox" style="background-color:lightgrey;border-bottom-width:0px;">&nbsp;</div>
					<div class="sty4626AmtBoxNBB" style="">&nbsp;</div>
				</div>
				<!-- P1 Line 15 -->
				<div class="styStdDiv" style="">
					<div class="styLNLeftNumBox">15</div>
					<div class="sty4626MediumDesc" style="">
						Add lines 4 and 14
						<span class="sty4626DotLn">....................</span>
					</div>
					<div class="sty4626RightNumBox" style="">15</div>
					<div class="sty4626AmtBox" style="">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/NBCapLossLessGainBusCapLossAmt"/>
						</xsl:call-template>
					</div>
					<div class="sty4626RightNumBox" style="background-color:lightgrey;border-bottom-width:0px;">&nbsp;</div>
					<div class="sty4626AmtBoxNBB" style="">&nbsp;</div>
				</div>
				<!-- P1 Line 16 -->
				<div class="styStdDiv" style="">
					<div class="styLNLeftNumBox">16</div>
					<div class="sty4626MediumDesc" style="">
						Enter, if any, the combined net short-term and long-term capital loss from your 
						Schedule D (Form 1040). Estates and trusts, enter, if any, the total net 
						short-term and long-term loss from Schedule D (Form 1041). Enter as a 
						positive number. If you don't have a loss on that line (and don't have a section 
						1202 exclusion), skip lines 16 through 21 and enter on line 22 the amount from line 15
						<span class="sty4626DotLn">........</span>
					</div>
					<div class="sty4626RightNumBox" style="height:16.5mm;padding-top:12.7mm;">16</div>
					<div class="sty4626AmtBox" style="height:16.5mm;padding-top:12.7mm;">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/CombNetSchDLossAmt"/>
						</xsl:call-template>
					</div>
					<div class="sty4626RightNumBox" style="height:16.5mm;background-color:lightgrey;border-bottom-width:0px;">&nbsp;</div>
					<div class="sty4626AmtBoxNBB" style="height:16.5mm;">&nbsp;</div>
				</div>
				<!-- P1 Line 17 -->
				<div class="styStdDiv" style="">
					<div class="styLNLeftNumBox">17</div>
					<div class="sty4626LongDesc" style="">
						Section 1202 exclusion. Enter as a positive number
						<span class="sty4626DotLn">..................</span>
					</div>
					<div class="sty4626RightNumBox" style="">17</div>
					<div class="sty4626AmtBox" style="">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/Section1202ExclusionAmt"/>
						</xsl:call-template>
					</div>
				</div>
				<!-- P1 Line 18 -->
				<div class="styStdDiv" style="">
					<div class="styLNLeftNumBox">18</div>
					<div class="sty4626MediumDesc" style="">
						Subtract line 17 from line 16. If zero or less, enter -0-
						<span class="sty4626DotLn">.........</span>
					</div>
					<div class="sty4626RightNumBox" style="">18</div>
					<div class="sty4626AmtBox" style="">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/CombNetSchDLossMns1202ExclAmt"/>
						</xsl:call-template>
					</div>
					<div class="sty4626RightNumBox" style="background-color:lightgrey;border-bottom-width:0px;">&nbsp;</div>
					<div class="sty4626AmtBoxNBB" style="">&nbsp;</div>
				</div>
				<!-- P1 Line 19 -->
				<div class="styStdDiv" style="">
					<div class="styLNLeftNumBox">19</div>
					<div class="sty4626MediumDesc" style="">
						If line 16 is a loss, enter, as a positive number, the smaller of: <br />
						&bull; The loss on line 16; or <br />
						&bull; $3,000 (If filing Form 1040, $1,500 when married filing separately)
						<span class="sty4626DotLn">....</span>
					</div>
					<div class="sty4626RightNumBox" style="height:10.5mm;padding-top:6.7mm;">19</div>
					<div class="sty4626AmtBox" style="height:10.5mm;padding-top:6.7mm;">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/SmllrCombNetSchDLossOrFSAmt"/>
						</xsl:call-template>
					</div>
					<div class="sty4626RightNumBox" style="height:10.5mm;background-color:lightgrey;border-bottom-width:0px;">&nbsp;</div>
					<div class="sty4626AmtBoxNBB" style="height:10.5mm;">&nbsp;</div>
				</div>
				<!-- P1 Line 20 -->
				<div class="styStdDiv" style="">
					<div class="styLNLeftNumBox">20</div>
					<div class="sty4626MediumDesc" style="">
						If line 18 is more than line 19, enter the difference. Otherwise, enter -0-
						<span class="sty4626DotLn">...</span>
					</div>
					<div class="sty4626RightNumBox" style="">20</div>
					<div class="sty4626AmtBox" style="">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/DiffCombNetSchDLossMns1202Amt"/>
						</xsl:call-template>
					</div>
					<div class="sty4626RightNumBox" style="background-color:lightgrey;border-bottom-width:0px;">&nbsp;</div>
					<div class="sty4626AmtBoxNBB" style="">&nbsp;</div>
				</div>
				<!-- P1 Line 21 -->
				<div class="styStdDiv" style="">
					<div class="styLNLeftNumBox">21</div>
					<div class="sty4626LongDesc" style="">
						If line 19 is more than line 18, enter the difference. Otherwise, enter -0-
						<span class="sty4626DotLn">.............</span>
					</div>
					<div class="sty4626RightNumBox" style="">21</div>
					<div class="sty4626AmtBox" style="">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/DiffSmllrCombNetSchDLossFSAmt"/>
						</xsl:call-template>
					</div>
				</div>
				<!-- P1 Line 22 -->
				<div class="styStdDiv" style="">
					<div class="styLNLeftNumBox">22</div>
					<div class="sty4626LongDesc" style="">
						Subtract line 20 from line 15. If zero or less, enter -0-
						<span class="sty4626DotLn">..................</span>
					</div>
					<div class="sty4626RightNumBox" style="">22</div>
					<div class="sty4626AmtBox" style="">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/MnsDiffCmbNetSchDLssMns1202Amt"/>
						</xsl:call-template>
					</div>
				</div>
				<!-- P1 Line 23 -->
				<div class="styStdDiv" style="">
					<div class="styLNLeftNumBox">23</div>
					<div class="sty4626LongDesc" style="">
						NOL deduction for losses from other years. Enter as a positive number
						<span class="sty4626DotLn">.............</span>
					</div>
					<div class="sty4626RightNumBox" style="">23</div>
					<div class="sty4626AmtBox" style="">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/NOLDeductionLossOtherYearsAmt"/>
						</xsl:call-template>
					</div>
				</div>
				<!-- P1 Line 24 -->
				<div class="styStdDiv" style="">
					<div class="styLNLeftNumBox">24</div>
					<div class="sty4626LongDesc" style="font-weight:bold;">
						NOL. Combine lines 1, 9, 17, and 21 through 23. If the result is less than zero, enter it here. If the 
						result is zero or more, you don't have an NOL
						<span class="sty4626DotLn" style="font-weight:normal;">..................</span>
					</div>
					<div class="sty4626RightNumBox" style="border-bottom-width:0px;height:auto;"><br />24</div>
					<div class="sty4626AmtBox" style="border-bottom-width:0px;height:auto;"><br />
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/NetOperatingLossAmt"/>
						</xsl:call-template>
					</div>
				</div>
				<!-- Page 1 Break and Footer-->
				<div class="pageEnd" style="width:187mm;border-top:1px solid black;">
					<span class="styBoldText">For Paperwork Reduction Act Notice, see the instructions. </span>
					<span style="width:20mm;"/>Cat. No. 16545W                      
					<span style="float:right;">
						Form <span class="styBoldText" style="font-size:8pt;">172</span> (12-2024)
					</span>
				</div>
				<div class="styStdDiv">
					Form 172 (12-2024)
					<span style="float:right;">
						Page <span style="font-weight:bold;font-size:9pt;">2</span>
					</span>
				</div>
				<!-- Part II Header -->
				<div class="styStdDiv" style="border-top:1px solid black;border-bottom:1px solid black;">
					<span class="styPartName" style="width:16mm;">Part II</span>
					<span class="styPartDesc" style="width:170mm;font-weight:normal;">
						<strong>NOL Carryover</strong> (see instructions) 
					</span>
				</div>
				<!-- head line -->
				<div class="styStdDiv" style="">
					<!--<div class="styLNLeftNumBox">&nbsp;</div>-->
					<div class="sty172P2Desc" style="width:74mm;height:10mm;padding-top:1.5mm;border-bottom:1px solid black;">
						Complete one column before going to the next <br /> column. Start with the earliest carryback year.
					</div>
					<div class="sty172ColHeader">
						<xsl:choose>
							<xsl:when test="$FormData/NOLCarryoverPrecYrGrp[1]">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$FormData/NOLCarryoverPrecYrGrp[1]/PrecedingYearNum"/>
								</xsl:call-template>
							</xsl:when>
							<xsl:otherwise>2nd</xsl:otherwise>
						</xsl:choose>
						preceding tax year <br/> ended: 
						<span style="width:70%;height:3.5mm;border-bottom:1px solid black;margin-top:1mm;">
							<xsl:call-template name="PopulateMonthDayYear">
								<xsl:with-param name="TargetNode" select="$FormData/NOLCarryoverPrecYrGrp[1]/TaxYearEndDt"/>
							</xsl:call-template>
						</span>
					</div>
					<div class="sty172ColHeader">
						<xsl:choose>
							<xsl:when test="$FormData/NOLCarryoverPrecYrGrp[2]">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$FormData/NOLCarryoverPrecYrGrp[2]/PrecedingYearNum"/>
								</xsl:call-template>
							</xsl:when>
							<xsl:otherwise>1st</xsl:otherwise>
						</xsl:choose>
						preceding tax year <br/> ended: 
						<span style="width:70%;height:3.5mm;border-bottom:1px solid black;margin-top:1mm;">
							<xsl:call-template name="PopulateMonthDayYear">
								<xsl:with-param name="TargetNode" select="$FormData/NOLCarryoverPrecYrGrp[2]/TaxYearEndDt"/>
							</xsl:call-template>
						</span>
					</div>
				</div>
				<!-- P2 Line 1 -->
				<div class="styStdDiv" style="">
					<div class="styLNLeftNumBoxSD">1</div>
					<div class="sty172P2Desc" style="">
						<strong>NOL deduction. </strong> Enter as a positive number
					</div>
					<div class="sty4626AmtBox" style="background-color:lightgrey;">&nbsp;</div>
					<div class="sty4626AmtBox" style="">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/NOLCarryoverPrecYrGrp[1]/NetOperatingLossDeductionAmt"/>
						</xsl:call-template>
					</div>
					<div class="sty4626AmtBox" style="background-color:lightgrey;">&nbsp;</div>
					<div class="sty4626AmtBox" style="">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/NOLCarryoverPrecYrGrp[2]/NetOperatingLossDeductionAmt"/>
						</xsl:call-template>
					</div>
				</div>
				<!-- P2 Line 2 -->
				<div class="styStdDiv" style="">
					<div class="styLNLeftNumBoxSD">2</div>
					<div class="sty172P2Desc" style="">
						Taxable income before the current year NOL carryback. For estates and trusts, increase this 
						amount by the sum of the charitable deduction <br /> (see instructions)
						<span class="sty4626DotLn">..........</span>
					</div>
					<div class="sty4626AmtBox" style="height:13.7mm;"><br /><br /><br />
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/NOLCarryoverPrecYrGrp[1]/TXIBeforeCYNOLCarrybackAmt"/>
						</xsl:call-template>
					</div>
					<div class="sty4626AmtBox" style="background-color:lightgrey;height:13.7mm;">&nbsp;</div>
					<div class="sty4626AmtBox" style="height:13.7mm;"><br /><br /><br />
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/NOLCarryoverPrecYrGrp[2]/TXIBeforeCYNOLCarrybackAmt"/>
						</xsl:call-template>
					</div>
					<div class="sty4626AmtBox" style="background-color:lightgrey;height:13.7mm;">&nbsp;</div>
				</div>
				<!-- P2 Line 3 -->
				<div class="styStdDiv" style="">
					<div class="styLNLeftNumBoxSD">3</div>
					<div class="sty172P2Desc" style="">
						Net capital loss deduction (see instructions)
						<span class="sty4626DotLn">..</span>
					</div>
					<div class="sty4626AmtBox" style="">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/NOLCarryoverPrecYrGrp[1]/NetCapitalLossDeductionAmt"/>
						</xsl:call-template>
					</div>
					<div class="sty4626AmtBox" style="background-color:lightgrey;">&nbsp;</div>
					<div class="sty4626AmtBox" style="">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/NOLCarryoverPrecYrGrp[2]/NetCapitalLossDeductionAmt"/>
						</xsl:call-template>
					</div>
					<div class="sty4626AmtBox" style="background-color:lightgrey;">&nbsp;</div>
				</div>
				<!-- P2 Line 4 -->
				<div class="styStdDiv" style="">
					<div class="styLNLeftNumBoxSD">4</div>
					<div class="sty172P2Desc" style="">
						Section 1202 exclusion. Enter as a positive number (see instructions)
						<span class="sty4626DotLn">..........</span>
					</div>
					<div class="sty4626AmtBox" style="height:7.4mm;"><br />
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/NOLCarryoverPrecYrGrp[1]/Section1202ExclusionAmt"/>
						</xsl:call-template>
					</div>
					<div class="sty4626AmtBox" style="background-color:lightgrey;height:7.4mm;">&nbsp;</div>
					<div class="sty4626AmtBox" style="height:7.4mm;"><br />
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/NOLCarryoverPrecYrGrp[2]/Section1202ExclusionAmt"/>
						</xsl:call-template>
					</div>
					<div class="sty4626AmtBox" style="background-color:lightgrey;height:7.4mm;">&nbsp;</div>
				</div>
				<!-- P2 Line 5 -->
				<div class="styStdDiv" style="">
					<div class="styLNLeftNumBoxSD">5</div>
					<div class="sty172P2Desc" style="">
						Qualified business income deduction (see instructions)
						<span class="sty4626DotLn">...........</span>
					</div>
					<div class="sty4626AmtBox" style="height:7.4mm;"><br />
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/NOLCarryoverPrecYrGrp[1]/QualifiedBusinessIncomeDedAmt"/>
						</xsl:call-template>
					</div>
					<div class="sty4626AmtBox" style="background-color:lightgrey;height:7.4mm;">&nbsp;</div>
					<div class="sty4626AmtBox" style="height:7.4mm;"><br />
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/NOLCarryoverPrecYrGrp[2]/QualifiedBusinessIncomeDedAmt"/>
						</xsl:call-template>
					</div>
					<div class="sty4626AmtBox" style="background-color:lightgrey;height:7.4mm;">&nbsp;</div>
				</div>
				<!-- P2 Line 6 -->
				<div class="styStdDiv" style="">
					<div class="styLNLeftNumBoxSD">6</div>
					<div class="sty172P2Desc" style="">
						Adjustment to adjusted gross income (AGI) (see instructions)
						<span class="sty4626DotLn">...........</span>
					</div>
					<div class="sty4626AmtBox" style="height:7.4mm;"><br />
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/NOLCarryoverPrecYrGrp[1]/AGIAdjAmt"/>
						</xsl:call-template>
					</div>
					<div class="sty4626AmtBox" style="background-color:lightgrey;height:7.4mm;">&nbsp;</div>
					<div class="sty4626AmtBox" style="height:7.4mm;"><br />
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/NOLCarryoverPrecYrGrp[2]/AGIAdjAmt"/>
						</xsl:call-template>
					</div>
					<div class="sty4626AmtBox" style="background-color:lightgrey;height:7.4mm;">&nbsp;</div>
				</div>
				<!-- P2 Line 7 -->
				<div class="styStdDiv" style="">
					<div class="styLNLeftNumBoxSD">7</div>
					<div class="sty172P2Desc" style="">
						Adjustment to itemized deductions from line 33 below (see instructions)
						<span class="sty4626DotLn">........</span>
					</div>
					<div class="sty4626AmtBox" style="height:7.4mm;"><br />
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/NOLCarryoverPrecYrGrp[1]/ItemizedDeductionsAdjAmt"/>
						</xsl:call-template>
					</div>
					<div class="sty4626AmtBox" style="background-color:lightgrey;height:7.4mm;">&nbsp;</div>
					<div class="sty4626AmtBox" style="height:7.4mm;"><br />
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/NOLCarryoverPrecYrGrp[2]/ItemizedDeductionsAdjAmt"/>
						</xsl:call-template>
					</div>
					<div class="sty4626AmtBox" style="background-color:lightgrey;height:7.4mm;">&nbsp;</div>
				</div>
				<!-- P2 Line 8 -->
				<div class="styStdDiv" style="">
					<div class="styLNLeftNumBoxSD">8</div>
					<div class="sty172P2Desc" style="">
						<strong>Estates and trusts,</strong> enter exemption amount
						<span class="sty4626DotLn">.</span>
					</div>
					<div class="sty4626AmtBox" style="height:4.2mm;">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/NOLCarryoverPrecYrGrp[1]/EstateTrustExemptionAmt"/>
						</xsl:call-template>
					</div>
					<div class="sty4626AmtBox" style="background-color:lightgrey;height:4.2mm;">&nbsp;</div>
					<div class="sty4626AmtBox" style="height:4.2mm;">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/NOLCarryoverPrecYrGrp[2]/EstateTrustExemptionAmt"/>
						</xsl:call-template>
					</div>
					<div class="sty4626AmtBox" style="background-color:lightgrey;height:4.2mm;">&nbsp;</div>
				</div>
				<!-- P2 Line 9 -->
				<div class="styStdDiv" style="">
					<div class="styLNLeftNumBoxSD">9</div>
					<div class="sty172P2Desc" style="">
						<strong>Modified taxable income.</strong> Add lines 2 through 8. If zero or less, enter -0-
						<span class="sty4626DotLn">........</span>
					</div>
					<div class="sty4626AmtBox" style="background-color:lightgrey;height:7.4mm;">&nbsp;</div>
					<div class="sty4626AmtBox" style="height:7.4mm;"><br />
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/NOLCarryoverPrecYrGrp[1]/ModifiedTaxableIncomeAmt"/>
						</xsl:call-template>
					</div>
					<div class="sty4626AmtBox" style="background-color:lightgrey;height:7.4mm;">&nbsp;</div>
					<div class="sty4626AmtBox" style="height:7.4mm;"><br />
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/NOLCarryoverPrecYrGrp[2]/ModifiedTaxableIncomeAmt"/>
						</xsl:call-template>
					</div>
				</div>
				<!-- P2 Line 10 -->
				<div class="styStdDiv" style="">
					<div class="styLNLeftNumBox">10</div>
					<div class="sty172P2Desc" style="">
						<strong>NOL carryover to the subsequent year.</strong> <br /> Subtract line 9 from line 1. Enter the result 
						from <br />the first preceding tax year here and on the net operating loss line of Schedule 1 (Form 
						1040) or Form 1040-NR or the net operating loss deduction line of Form 1041. If zero or 
						less, enter -0-
						<span class="sty4626DotLn">..</span>
					</div>
					<div class="sty4626AmtBox" style="background-color:lightgrey;height:19.6mm;">&nbsp;</div>
					<div class="sty4626AmtBox" style="height:19.6mm;"><br /><br /><br /><br /><br />
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/NOLCarryoverPrecYrGrp[1]/NOLCarryoverAmt"/>
						</xsl:call-template>
					</div>
					<div class="sty4626AmtBox" style="background-color:lightgrey;height:19.6mm;">&nbsp;</div>
					<div class="sty4626AmtBox" style="height:19.6mm;"><br /><br /><br /><br /><br />
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/NOLCarryoverPrecYrGrp[2]/NOLCarryoverAmt"/>
						</xsl:call-template>
					</div>
				</div>
				<!-- P2 Adjustment Header -->
				<div class="styStdDiv" style="">
					<div class="styLNLeftNumBox">&nbsp;</div>
					<div class="sty172P2Desc" style="">
						<strong>Adjustment to Itemized Deductions <br /> (Individuals Only).</strong>  
						Complete lines 11 through <br /> 33 for the carryback year(s) for which you <br /> itemized deductions 
						<strong>only</strong> if line 3, 4, or 5 above is more than zero.
					</div>
					<div class="sty4626AmtBox" style="background-color:lightgrey;height:17.0mm;">&nbsp;</div>
					<div class="sty4626AmtBox" style="background-color:lightgrey;height:17.0mm;">&nbsp;</div>
					<div class="sty4626AmtBox" style="background-color:lightgrey;height:17mm;">&nbsp;</div>
					<div class="sty4626AmtBox" style="background-color:lightgrey;height:17.0mm;">&nbsp;</div>
				</div>
				<!-- P2 Line 11 -->
				<div class="styStdDiv" style="">
					<div class="styLNLeftNumBox">11</div>
					<div class="sty172P2Desc" style="">
						AGI before the current year NOL carryback
						<span class="sty4626DotLn">..</span>
					</div>
					<div class="sty4626AmtBox" style="">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/NOLCarryoverPrecYrGrp[1]/AGIBeforeCYNOLCarrybackAmt"/>
						</xsl:call-template>
					</div>
					<div class="sty4626AmtBox" style="background-color:lightgrey;">&nbsp;</div>
					<div class="sty4626AmtBox" style="">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/NOLCarryoverPrecYrGrp[2]/AGIBeforeCYNOLCarrybackAmt"/>
						</xsl:call-template>
					</div>
					<div class="sty4626AmtBox" style="background-color:lightgrey;">&nbsp;</div>
				</div>
				<!-- P2 Line 12 -->
				<div class="styStdDiv" style="">
					<div class="styLNLeftNumBox">12</div>
					<div class="sty172P2Desc" style="">
						Add lines 3 through 6 above
						<span class="sty4626DotLn">.......</span>
					</div>
					<div class="sty4626AmtBox" style="">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/NOLCarryoverPrecYrGrp[1]/NetCapLoss1202QBIAGIAdjAmt"/>
						</xsl:call-template>
					</div>
					<div class="sty4626AmtBox" style="background-color:lightgrey;">&nbsp;</div>
					<div class="sty4626AmtBox" style="">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/NOLCarryoverPrecYrGrp[2]/NetCapLoss1202QBIAGIAdjAmt"/>
						</xsl:call-template>
					</div>
					<div class="sty4626AmtBox" style="background-color:lightgrey;">&nbsp;</div>
				</div>
				<!-- P2 Line 13 -->
				<div class="styStdDiv" style="">
					<div class="styLNLeftNumBox">13</div>
					<div class="sty172P2Desc" style="">
						<strong>Modified AGI.</strong> Add lines 11 and 12
						<span class="sty4626DotLn">....</span>
					</div>
					<div class="sty4626AmtBox" style="">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/NOLCarryoverPrecYrGrp[1]/ModifiedAGIAmt"/>
						</xsl:call-template>
					</div>
					<div class="sty4626AmtBox" style="background-color:lightgrey;">&nbsp;</div>
					<div class="sty4626AmtBox" style="">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/NOLCarryoverPrecYrGrp[2]/ModifiedAGIAmt"/>
						</xsl:call-template>
					</div>
					<div class="sty4626AmtBox" style="background-color:lightgrey;">&nbsp;</div>
				</div>
				<!-- P2 Line 14 -->
				<div class="styStdDiv" style="">
					<div class="styLNLeftNumBox">14</div>
					<div class="sty172P2Desc" style="">
						Medical and dental expenses after AGI <br /> limitation from Sch. A (Form 1040), or as <br /> previously adjusted
						<span class="sty4626DotLn">.........</span>
					</div>
					<div class="sty4626AmtBox" style="height:10.7mm;"><br /><br />
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/NOLCarryoverPrecYrGrp[1]/TotalMedicalAndDentalExpnssAmt"/>
						</xsl:call-template>
					</div>
					<div class="sty4626AmtBox" style="height:10.7mm;background-color:lightgrey;">&nbsp;</div>
					<div class="sty4626AmtBox" style="height:10.7mm;"><br /><br />
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/NOLCarryoverPrecYrGrp[2]/TotalMedicalAndDentalExpnssAmt"/>
						</xsl:call-template>
					</div>
					<div class="sty4626AmtBox" style="height:10.7mm;background-color:lightgrey;">&nbsp;</div>
				</div>
				<!-- P2 Line 15 -->
				<div class="styStdDiv" style="">
					<div class="styLNLeftNumBox">15</div>
					<div class="sty172P2Desc" style="">
						Medical and dental expenses before AGI <br /> limitation from Sch. A (Form 1040), or as <br /> previously adjusted
						<span class="sty4626DotLn">.........</span>
					</div>
					<div class="sty4626AmtBox" style="height:10.7mm;"><br /><br />
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/NOLCarryoverPrecYrGrp[1]/MedicalAndDentalExpensesAmt"/>
						</xsl:call-template>
					</div>
					<div class="sty4626AmtBox" style="height:10.7mm;background-color:lightgrey;">&nbsp;</div>
					<div class="sty4626AmtBox" style="height:10.7mm;"><br /><br />
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/NOLCarryoverPrecYrGrp[2]/MedicalAndDentalExpensesAmt"/>
						</xsl:call-template>
					</div>
					<div class="sty4626AmtBox" style="height:10.7mm;background-color:lightgrey;">&nbsp;</div>
				</div>
				<!-- P2 Line 16 -->
				<div class="styStdDiv" style="">
					<div class="styLNLeftNumBox">16</div>
					<div class="sty172P2Desc" style="">
						Multiply line 13 by 7.5% (0.075)
						<span class="sty4626DotLn">.....</span>
					</div>
					<div class="sty4626AmtBox" style="">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/NOLCarryoverPrecYrGrp[1]/ModifiedAGIMultiplyPctAmt"/>
						</xsl:call-template>
					</div>
					<div class="sty4626AmtBox" style="background-color:lightgrey;">&nbsp;</div>
					<div class="sty4626AmtBox" style="">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/NOLCarryoverPrecYrGrp[2]/ModifiedAGIMultiplyPctAmt"/>
						</xsl:call-template>
					</div>
					<div class="sty4626AmtBox" style="background-color:lightgrey;">&nbsp;</div>
				</div>
				<!-- P2 Line 17 -->
				<div class="styStdDiv" style="">
					<div class="styLNLeftNumBox">17</div>
					<div class="sty172P2Desc" style="">
						Subtract line 16 from line 15. If zero or less, <br /> enter -0-
						<span class="sty4626DotLn">.............</span>
					</div>
					<div class="sty4626AmtBox" style="height:7.4mm;"><br />
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/NOLCarryoverPrecYrGrp[1]/LessModifiedAGIMultiplyPctAmt"/>
						</xsl:call-template>
					</div>
					<div class="sty4626AmtBox" style="height:7.4mm;background-color:lightgrey;">&nbsp;</div>
					<div class="sty4626AmtBox" style="height:7.4mm;"><br />
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/NOLCarryoverPrecYrGrp[2]/LessModifiedAGIMultiplyPctAmt"/>
						</xsl:call-template>
					</div>
					<div class="sty4626AmtBox" style="height:7.4mm;background-color:lightgrey;">&nbsp;</div>
				</div>
				<!-- P2 Line 18 -->
				<div class="styStdDiv" style="">
					<div class="styLNLeftNumBox">18</div>
					<div class="sty172P2Desc" style="">
						Subtract line 17 from line 14
						<span class="sty4626DotLn">.......</span>
					</div>
					<div class="sty4626AmtBox" style="background-color:lightgrey;">&nbsp;</div>
					<div class="sty4626AmtBox" style="">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/NOLCarryoverPrecYrGrp[1]/MedicalAndDentalExpensesAdjAmt"/>
						</xsl:call-template>
					</div>
					<div class="sty4626AmtBox" style="background-color:lightgrey;">&nbsp;</div>
					<div class="sty4626AmtBox" style="">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/NOLCarryoverPrecYrGrp[2]/MedicalAndDentalExpensesAdjAmt"/>
						</xsl:call-template>
					</div>
				</div>
				<!-- P2 Line 19 -->
				<div class="styStdDiv" style="">
					<div class="styLNLeftNumBox">19</div>
					<div class="sty172P2Desc" style="">
						Mortgage insurance premiums from Sch. A <br /> (Form 1040), for tax years before 2022, or as <br /> previously adjusted
						<span class="sty4626DotLn">..........</span>
					</div>
					<div class="sty4626AmtBox" style="height:10.7mm;"><br /><br />
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/NOLCarryoverPrecYrGrp[1]/MortgageInsurancePremiumsAmt"/>
						</xsl:call-template>
					</div>
					<div class="sty4626AmtBox" style="height:10.7mm;background-color:lightgrey;">&nbsp;</div>
					<div class="sty4626AmtBox" style="height:10.7mm;"><br /><br />
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/NOLCarryoverPrecYrGrp[2]/MortgageInsurancePremiumsAmt"/>
						</xsl:call-template>
					</div>
					<div class="sty4626AmtBox" style="height:10.7mm;background-color:lightgrey;">&nbsp;</div>
				</div>
				<!-- P2 Line 20 -->
				<div class="styStdDiv" style="">
					<div class="styLNLeftNumBox">20</div>
					<div class="sty172P2Desc" style="">
						Refigured mortgage insurance premiums (see instructions)
						<span class="sty4626DotLn">............</span>
					</div>
					<div class="sty4626AmtBox" style="height:7.4mm;"><br />
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/NOLCarryoverPrecYrGrp[1]/RefiguredMortgInsPremAmt"/>
						</xsl:call-template>
					</div>
					<div class="sty4626AmtBox" style="height:7.4mm;background-color:lightgrey;">&nbsp;</div>
					<div class="sty4626AmtBox" style="height:7.4mm;"><br />
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/NOLCarryoverPrecYrGrp[2]/RefiguredMortgInsPremAmt"/>
						</xsl:call-template>
					</div>
					<div class="sty4626AmtBox" style="height:7.4mm;background-color:lightgrey;">&nbsp;</div>
				</div>
				<!-- P2 Line 21 -->
				<div class="styStdDiv" style="">
					<div class="styLNLeftNumBox">21</div>
					<div class="sty172P2Desc" style="">
						Subtract line 20 from line 19
						<span class="sty4626DotLn">.......</span>
					</div>
					<div class="sty4626AmtBoxNBB" style="background-color:lightgrey;">&nbsp;</div>
					<div class="sty4626AmtBoxNBB" style="">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/NOLCarryoverPrecYrGrp[1]/MortgInsurancePremiumsAdjAmt"/>
						</xsl:call-template>
					</div>
					<div class="sty4626AmtBoxNBB" style="background-color:lightgrey;">&nbsp;</div>
					<div class="sty4626AmtBoxNBB" style="">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/NOLCarryoverPrecYrGrp[2]/MortgInsurancePremiumsAdjAmt"/>
						</xsl:call-template>
					</div>
				</div>
				<div class="styStdDiv pageEnd" style="border-top:2px solid black;text-align:right;">
					Form <span class="styBoldText" style="font-size:8pt;">172</span> (12-2024)
				</div>
				<div class="styStdDiv">
					Form 172 (12-2024)
					<span style="float:right;">
						Page <span style="font-weight:bold;font-size:9pt;">3</span>
					</span>
				</div>
				<!-- Part II Header -->
				<div class="styStdDiv" style="border-top:1px solid black;border-bottom:1px solid black;">
					<span class="styPartName" style="width:16mm;">Part II</span>
					<span class="styPartDesc" style="width:170mm;font-weight:normal;">
						<strong>NOL Carryover</strong> (see instructions) 
						<span style="font-style:italic;">(continued)</span>
					</span>
				</div>
				<!-- head line -->
				<div class="styStdDiv" style="">
					<!--<div class="styLNLeftNumBox">&nbsp;</div>-->
					<div class="sty172P2Desc" style="width:74mm;height:10mm;padding-top:1.5mm;border-bottom:1px solid black;">
						Complete one column before going to the next <br /> column. Start with the earliest carryback year.
					</div>
					<div class="sty172ColHeader">
						<xsl:choose>
							<xsl:when test="$FormData/NOLCarryoverPrecYrGrp[1]">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$FormData/NOLCarryoverPrecYrGrp[1]/PrecedingYearNum"/>
								</xsl:call-template>
							</xsl:when>
							<xsl:otherwise>2nd</xsl:otherwise>
						</xsl:choose>
						preceding tax year <br/> ended: 
						<span style="width:70%;height:3.5mm;border-bottom:1px solid black;margin-top:1mm;">
							<xsl:call-template name="PopulateMonthDayYear">
								<xsl:with-param name="TargetNode" select="$FormData/NOLCarryoverPrecYrGrp[1]/TaxYearEndDt"/>
							</xsl:call-template>
						</span>
					</div>
					<div class="sty172ColHeader">
						<xsl:choose>
							<xsl:when test="$FormData/NOLCarryoverPrecYrGrp[2]">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$FormData/NOLCarryoverPrecYrGrp[2]/PrecedingYearNum"/>
								</xsl:call-template>
							</xsl:when>
							<xsl:otherwise>1st</xsl:otherwise>
						</xsl:choose>
						preceding tax year <br/> ended: 
						<span style="width:70%;height:3.5mm;border-bottom:1px solid black;margin-top:1mm;">
							<xsl:call-template name="PopulateMonthDayYear">
								<xsl:with-param name="TargetNode" select="$FormData/NOLCarryoverPrecYrGrp[2]/TaxYearEndDt"/>
							</xsl:call-template>
						</span>
					</div>
				</div>
				<!-- P2 Line 22 -->
				<div class="styStdDiv" style="">
					<div class="styLNLeftNumBox">22</div>
					<div class="sty172P2Desc" style="">
						Modified AGI from line 13
						<span class="sty4626DotLn">........</span>
					</div>
					<div class="sty4626AmtBox" style="">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/NOLCarryoverPrecYrGrp[1]/ModifiedAGIAmt"/>
						</xsl:call-template>
					</div>
					<div class="sty4626AmtBox" style="background-color:lightgrey;">&nbsp;</div>
					<div class="sty4626AmtBox" style="">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/NOLCarryoverPrecYrGrp[2]/ModifiedAGIAmt"/>
						</xsl:call-template>
					</div>
					<div class="sty4626AmtBox" style="background-color:lightgrey;">&nbsp;</div>
				</div>
				<!-- P2 Line 23 -->
				<div class="styStdDiv" style="">
					<div class="styLNLeftNumBox">23</div>
					<div class="sty172P2Desc" style="">
						Enter as a positive number any NOL carryback from a prior year that was deducted to figure line 11
						<span class="sty4626DotLn">.</span>
					</div>
					<div class="sty4626AmtBox" style="height:7.4mm;"><br />
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/NOLCarryoverPrecYrGrp[1]/PYNOLCarrybackAmt"/>
						</xsl:call-template>
					</div>
					<div class="sty4626AmtBox" style="height:7.4mm;background-color:lightgrey;">&nbsp;</div>
					<div class="sty4626AmtBox" style="height:7.4mm;"><br />
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/NOLCarryoverPrecYrGrp[2]/PYNOLCarrybackAmt"/>
						</xsl:call-template>
					</div>
					<div class="sty4626AmtBox" style="height:7.4mm;background-color:lightgrey;">&nbsp;</div>
				</div>
				<!-- P2 Line 24 -->
				<div class="styStdDiv" style="">
					<div class="styLNLeftNumBox">24</div>
					<div class="sty172P2Desc" style="">
						Add lines 22 and 23
						<span class="sty4626DotLn">.........</span>
					</div>
					<div class="sty4626AmtBox" style="">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/NOLCarryoverPrecYrGrp[1]/ModifiedAGIPYNOLCarrybackAmt"/>
						</xsl:call-template>
					</div>
					<div class="sty4626AmtBox" style="background-color:lightgrey;">&nbsp;</div>
					<div class="sty4626AmtBox" style="">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/NOLCarryoverPrecYrGrp[2]/ModifiedAGIPYNOLCarrybackAmt"/>
						</xsl:call-template>
					</div>
					<div class="sty4626AmtBox" style="background-color:lightgrey;">&nbsp;</div>
				</div>
				<!-- P2 Line 25 -->
				<div class="styStdDiv" style="">
					<div class="styLNLeftNumBox">25</div>
					<div class="sty172P2Desc" style="">
						Total charitable contributions for Sch. A (Form 1040 or Form 1040-NR), or as previously 
						adjusted (see instructions)
						<span class="sty4626DotLn">...........</span>
					</div>
					<div class="sty4626AmtBox" style="height:10.7mm;"><br /><br />
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/NOLCarryoverPrecYrGrp[1]/TotalCharitableContriAmt"/>
						</xsl:call-template>
					</div>
					<div class="sty4626AmtBox" style="height:10.7mm;background-color:lightgrey;">&nbsp;</div>
					<div class="sty4626AmtBox" style="height:10.7mm;"><br /><br />
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/NOLCarryoverPrecYrGrp[2]/TotalCharitableContriAmt"/>
						</xsl:call-template>
					</div>
					<div class="sty4626AmtBox" style="height:10.7mm;background-color:lightgrey;">&nbsp;</div>
				</div>
				<!-- P2 Line 26 -->
				<div class="styStdDiv" style="">
					<div class="styLNLeftNumBox">26</div>
					<div class="sty172P2Desc" style="">
						Refigured charitable contributions (see instructions)
						<!--<span class="sty4626DotLn">.....</span>-->
					</div>
					<div class="sty4626AmtBox" style="">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/NOLCarryoverPrecYrGrp[1]/RefiguredCharitableContriAmt"/>
						</xsl:call-template>
					</div>
					<div class="sty4626AmtBox" style="background-color:lightgrey;">&nbsp;</div>
					<div class="sty4626AmtBox" style="">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/NOLCarryoverPrecYrGrp[2]/RefiguredCharitableContriAmt"/>
						</xsl:call-template>
					</div>
					<div class="sty4626AmtBox" style="background-color:lightgrey;">&nbsp;</div>
				</div>
				<!-- P2 Line 27 -->
				<div class="styStdDiv" style="">
					<div class="styLNLeftNumBox">27</div>
					<div class="sty172P2Desc" style="">
						Subtract line 26 from line 25
						<span class="sty4626DotLn">.......</span>
					</div>
					<div class="sty4626AmtBox" style="background-color:lightgrey;">&nbsp;</div>
					<div class="sty4626AmtBox" style="">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/NOLCarryoverPrecYrGrp[1]/TotalCharitableContriAdjAmt"/>
						</xsl:call-template>
					</div>
					<div class="sty4626AmtBox" style="background-color:lightgrey;">&nbsp;</div>
					<div class="sty4626AmtBox" style="">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/NOLCarryoverPrecYrGrp[2]/TotalCharitableContriAdjAmt"/>
						</xsl:call-template>
					</div>
				</div>
				<!-- P2 Line 28 -->
				<div class="styStdDiv" style="">
					<div class="styLNLeftNumBox">28</div>
					<div class="sty172P2Desc" style="">
						Casualty and theft losses deduction from Form <br /> 4684
						<span class="sty4626DotLn">..............</span>
					</div>
					<div class="sty4626AmtBox" style="height:7.4mm;"><br />
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/NOLCarryoverPrecYrGrp[1]/CalcAdjGroIncmMnsTotNetLossAmt"/>
						</xsl:call-template>
					</div>
					<div class="sty4626AmtBox" style="height:7.4mm;background-color:lightgrey;">&nbsp;</div>
					<div class="sty4626AmtBox" style="height:7.4mm;"><br />
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/NOLCarryoverPrecYrGrp[2]/CalcAdjGroIncmMnsTotNetLossAmt"/>
						</xsl:call-template>
					</div>
					<div class="sty4626AmtBox" style="height:7.4mm;background-color:lightgrey;">&nbsp;</div>
				</div>
				<!-- P2 Line 29 -->
				<div class="styStdDiv" style="">
					<div class="styLNLeftNumBox">29</div>
					<div class="sty172P2Desc" style="">
						Casualty and theft losses before AGI limitation <br /> from Form 4684
						<span class="sty4626DotLn">..........</span>
					</div>
					<div class="sty4626AmtBox" style="height:7.4mm;"><br />
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/NOLCarryoverPrecYrGrp[1]/TotalLossLessTotalTheftGainAmt"/>
						</xsl:call-template>
					</div>
					<div class="sty4626AmtBox" style="height:7.4mm;background-color:lightgrey;">&nbsp;</div>
					<div class="sty4626AmtBox" style="height:7.4mm;"><br />
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/NOLCarryoverPrecYrGrp[2]/TotalLossLessTotalTheftGainAmt"/>
						</xsl:call-template>
					</div>
					<div class="sty4626AmtBox" style="height:7.4mm;background-color:lightgrey;">&nbsp;</div>
				</div>
				<!-- P2 Line 30 -->
				<div class="styStdDiv" style="">
					<div class="styLNLeftNumBox">30</div>
					<div class="sty172P2Desc" style="">
						Multiply line 22 by 10% (0.10)
						<span class="sty4626DotLn">......</span>
					</div>
					<div class="sty4626AmtBox" style="">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/NOLCarryoverPrecYrGrp[1]/ModifiedAGITimesPctAmt"/>
						</xsl:call-template>
					</div>
					<div class="sty4626AmtBox" style="background-color:lightgrey;">&nbsp;</div>
					<div class="sty4626AmtBox" style="">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/NOLCarryoverPrecYrGrp[2]/ModifiedAGITimesPctAmt"/>
						</xsl:call-template>
					</div>
					<div class="sty4626AmtBox" style="background-color:lightgrey;">&nbsp;</div>
				</div>
				<!-- P2 Line 31 -->
				<div class="styStdDiv" style="">
					<div class="styLNLeftNumBox">31</div>
					<div class="sty172P2Desc" style="">
						Subtract line 30 from line 29. If zero or less, <br />enter -0-
						<span class="sty4626DotLn">.............</span>
					</div>
					<div class="sty4626AmtBox" style="height:7.4mm;"><br />
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/NOLCarryoverPrecYrGrp[1]/LessModifiedAGITimesPctAmt"/>
						</xsl:call-template>
					</div>
					<div class="sty4626AmtBox" style="height:7.4mm;background-color:lightgrey;">&nbsp;</div>
					<div class="sty4626AmtBox" style="height:7.4mm;"><br />
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/NOLCarryoverPrecYrGrp[2]/LessModifiedAGITimesPctAmt"/>
						</xsl:call-template>
					</div>
					<div class="sty4626AmtBox" style="height:7.4mm;background-color:lightgrey;">&nbsp;</div>
				</div>
				<!-- P2 Line 32 -->
				<div class="styStdDiv" style="">
					<div class="styLNLeftNumBox">32</div>
					<div class="sty172P2Desc" style="">
						Subtract line 31 from line 28
						<span class="sty4626DotLn">.......</span>
					</div>
					<div class="sty4626AmtBox" style="background-color:lightgrey;">&nbsp;</div>
					<div class="sty4626AmtBox" style="">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/NOLCarryoverPrecYrGrp[1]/CasualtyTheftLossAdjAmt"/>
						</xsl:call-template>
					</div>
					<div class="sty4626AmtBox" style="background-color:lightgrey;">&nbsp;</div>
					<div class="sty4626AmtBox" style="">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/NOLCarryoverPrecYrGrp[2]/CasualtyTheftLossAdjAmt"/>
						</xsl:call-template>
					</div>
				</div>
				<!-- P2 Line 33 -->
				<div class="styStdDiv" style="">
					<div class="styLNLeftNumBox">33</div>
					<div class="sty172P2Desc" style="">
						Combine lines 18, 21, 27, and 32; enter the <br /> result here and on line 7
						<span class="sty4626DotLn">........</span>
					</div>
					<div class="sty4626AmtBoxNBB" style="height:7.4mm;background-color:lightgrey;">&nbsp;</div>
					<div class="sty4626AmtBoxNBB" style="height:7.4mm;"><br />
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/NOLCarryoverPrecYrGrp[1]/ItemizedDeductionsAdjAmt"/>
						</xsl:call-template>
					</div>
					<div class="sty4626AmtBoxNBB" style="height:7.4mm;background-color:lightgrey;">&nbsp;</div>
					<div class="sty4626AmtBoxNBB" style="height:7.4mm;"><br />
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/NOLCarryoverPrecYrGrp[2]/ItemizedDeductionsAdjAmt"/>
						</xsl:call-template>
					</div>
				</div>
				<div class="styStdDiv pageEnd" style="border-top:2px solid black;text-align:right;">
					Form <span class="styBoldText" style="font-size:8pt;">172</span> (12-2024)
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
</xsl:stylesheet>