<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE xsl:stylesheet [
	<!ENTITY nbsp "&#160;"> 
	<!ENTITY mdash "&#8212;"> 
]>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fo="http://www.w3.org/1999/XSL/Format" version="1.0">
	<xsl:include href="PopulateTemplate.xsl"/>
	<xsl:include href="AddHeader.xsl"/>
	<xsl:include href="CommonPathRef.xsl"/>
	<xsl:include href="AddOnTable.xsl"/>
	<xsl:include href="IRS1120REITStyle.xsl"/>
	<xsl:output method="html" indent="yes"/>
	<xsl:strip-space elements="*"/>
	<xsl:param name="FormData" select="$RtnDoc/IRS1120REIT"/>
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
				<meta name="Description" content="IRS Form 1120-REIT"/>
				<!-- javascript include -->
				<script language="JavaScript" src="{$ScriptPath}/FormDisplay.js" type="text/javascript"/>
				<xsl:call-template name="InitJS"/>
				<style type="text/css">
					<xsl:if test="not($Print) or $Print=''">
						<xsl:call-template name="IRS1120REITStyle"/>
						<xsl:call-template name="AddOnStyle"/>
					</xsl:if>
				</style>
				<xsl:call-template name="GlobalStylesForm"/>
			</head>
			<body class="styBodyClass" style="width:187mm;">
				<xsl:call-template name="DocumentHeader"/>
				<!-- BEGIN FORM HEADER -->
				<div class="styStdDiv">
					<div class="styFNBox" style="width:35mm;height:17mm;">
						Form <span class="styFormNumber" style="font-size:16pt;">1120-REIT</span><br />
						<xsl:call-template name="SetFormLinkInline">
							<xsl:with-param name="TargetNode" select="$FormData"/>
						</xsl:call-template>
						<xsl:call-template name="LinkToLeftoverDataTableInline">
							<xsl:with-param name="TargetNode" select="$FormData/@shortPeriodReasonCd"/>
							<xsl:with-param name="Desc">Top Left Header - Short Period Reason Code</xsl:with-param>
						</xsl:call-template>
						<br />
						<span class="styAgency" style="font-family:Arial;">Department of the Treasury</span>
						<span class="styAgency" style="font-family:Arial;">Internal Revenue Service</span>
					</div>
					<div class="styFTBox" style="width:119mm;height:17mm;padding-top:0.5mm;">
						<span class="styMainTitle" style="font-size:12pt;">U.S. Income Tax Return for Real Estate Investment Trusts</span>
						<div class="styFST" style="padding-top:2mm;font-size:6pt;">
							For calendar year 2025 or tax year beginning 
							<span style="width:20mm;text-align:center;border-bottom:1px solid black;">
								<xsl:call-template name="PopulateReturnHeaderTaxPeriodBeginDate"/>
							</span>
							and ending 
							<span style="width:20mm;text-align:center;border-bottom:1px solid black;">
								<xsl:call-template name="PopulateReturnHeaderTaxPeriodEndDate"/>
							</span>
						</div>
						<div class="styFST" style="padding-top:2mm;">
							Go to <span style="font-style:italic;">www.irs.gov/Form1120REIT</span> for instructions and the latest information.
						</div>
					</div>
					<div class="styTYBox" style="width:32mm;height:17mm;">
						<div class="styOMB" style="width:32mm;">OMB No. 1545-0123</div>
						<div class="styTaxYear" style="text-align:center;padding-top:1mm;">
							20<span class="styTYColor">25</span>
						</div>
					</div>
				</div>
				<div class="styStdDiv" style="border-top:2px solid black;">
					<div class="styGenericDiv" style="width:30mm;font-size:6pt;font-family:Arial;">
						<div class="styGenericDiv" style="width:100%;height:9mm;">
							<span style="font-weight:bold;width:3mm;">A</span> 
							Year of REIT status election <br />
							<span style="width:100%;text-align:center;">
								<xsl:call-template name="PopulateYear">
									<xsl:with-param name="TargetNode" select="$FormData/REITStatusElectionYr"/>
								</xsl:call-template>
							</span>
						</div>
						<div class="styGenericDiv" style="width:100%;height:15mm;border-top:1px solid black;">
							<span style="font-weight:bold;width:3mm;">B</span> 
							<strong>Check if a:</strong> <br />
							<span style="font-weight:bold;width:3mm;float:left;">1</span>
							<span style="width:21mm;">
								REIT with 100% owned subsidiaries (see instructions)
							</span>
							<span style="width:4.5mm;text-align:center;">
								<input type="checkbox" class="styCkboxNM" style="" aria-label="One Hundred Percent Owned Subsidiaries">
									<xsl:call-template name="PopulateCheckbox">
										<xsl:with-param name="TargetNode" select="$FormData/Subsidaries100PctOwnedInd"/>
										<xsl:with-param name="BackupName">F1120REITSubsidaries100PctOwnedInd</xsl:with-param>
									</xsl:call-template>
								</input>
							</span><br />
							<span style="font-weight:bold;width:3mm;float:left;">2</span>
							<span style="width:21mm;">
								Personal holding co. (attach Sch. PH)
								<xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode" select="$FormData/PersonalHoldingCompanyInd"/>
								</xsl:call-template>
							</span>
							<span style="width:4.5mm;text-align:center;">
								<input type="checkbox" class="styCkboxNM" style="" aria-label="Personal Holding Company">
									<xsl:call-template name="PopulateCheckbox">
										<xsl:with-param name="TargetNode" select="$FormData/PersonalHoldingCompanyInd"/>
										<xsl:with-param name="BackupName">F1120REITPersonalHoldingCompanyInd</xsl:with-param>
									</xsl:call-template>
								</input>
							</span>
						</div>
					</div>
					<div class="styGenericDiv" style="width:115mm;border-left:1px solid black;border-right:1px solid black;">
						<div class="styGenericDiv" style="width:100%;min-height:9mm;padding-left:3px;">
							Name <br />
							<xsl:call-template name="PopulateReturnHeaderFiler">
								<xsl:with-param name="TargetNode">BusinessNameLine1Txt</xsl:with-param>
							</xsl:call-template>
							<xsl:if test="$RtnHdrData/Filer//AddressLine2Txt">
								<br/>
								<xsl:call-template name="PopulateReturnHeaderFiler">
									<xsl:with-param name="TargetNode">BusinessNameLine2Txt</xsl:with-param>
								</xsl:call-template>
							</xsl:if>
						</div>
						<div class="styGenericDiv" style="width:75%;min-height:9mm;padding-left:3px;border-top:1px solid black;border-right:1px solid black;">
							Number and street (If a P.O. box, see instructions.) <br />
							<xsl:call-template name="PopulateReturnHeaderFiler">
								<xsl:with-param name="TargetNode">AddressLine1Txt</xsl:with-param>
							</xsl:call-template>
							<xsl:if test="$RtnHdrData/Filer//AddressLine2Txt">
								<br />
								<xsl:call-template name="PopulateReturnHeaderFiler">
									<xsl:with-param name="TargetNode">AddressLine2Txt</xsl:with-param>
								</xsl:call-template>
							</xsl:if>
						</div>
						<div class="styGenericDiv" style="width:25%;padding-left:3px;border-top:1px solid black;">Room or suite no.</div>
						<div class="styGenericDiv" style="width:45%;padding-left:3px;border-top:1px solid black;">
							City or town <br />
							<xsl:call-template name="PopulateReturnHeaderFiler">
								<xsl:with-param name="TargetNode">CityNm</xsl:with-param>
							</xsl:call-template>
						</div>
						<div class="styGenericDiv" style="width:30%;padding-left:3px;border-top:1px solid black;border-left:1px solid black;">
							State <br />
							<xsl:choose>
								<xsl:when test="$RtnHdrData/Filer/ForeignAddress/ProvinceOrStateNm">
									<xsl:call-template name="PopulateReturnHeaderFiler">
										<xsl:with-param name="TargetNode">ProvinceOrStateNm</xsl:with-param>
									</xsl:call-template>, 
									<xsl:call-template name="PopulateReturnHeaderFiler">
										<xsl:with-param name="TargetNode">CountryCd</xsl:with-param>
									</xsl:call-template>
								</xsl:when>
								<xsl:otherwise>
									<xsl:call-template name="PopulateReturnHeaderFiler">
										<xsl:with-param name="TargetNode">StateAbbreviationCd</xsl:with-param>
									</xsl:call-template>
								</xsl:otherwise>
							</xsl:choose>
						</div>
						<div class="styGenericDiv" style="width:25%;padding-left:3px;border-top:1px solid black;border-left:1px solid black;">
							ZIP code <br />
							<xsl:choose>
								<xsl:when test="$RtnHdrData/Filer/ForeignAddress/ForeignPostalCd">
									<xsl:call-template name="PopulateReturnHeaderFiler">
										<xsl:with-param name="TargetNode">ForeignPostalCd</xsl:with-param>
									</xsl:call-template>
								</xsl:when>
								<xsl:otherwise>
									<xsl:call-template name="PopulateReturnHeaderFiler">
										<xsl:with-param name="TargetNode">ZIPCd</xsl:with-param>
									</xsl:call-template>
								</xsl:otherwise>
							</xsl:choose>
						</div>
						
					</div>
					<div class="styGenericDiv" style="width:41.5mm;height:9mm;padding-left:3px;">
						<span style="font-weight:bold;width:3mm;">C</span> 
						<span style="font-weight:bold;font-size:6pt;font-family:Arial;">Employer identification number</span> <br />
						<xsl:call-template name="PopulateReturnHeaderFilerTIN">
							<xsl:with-param name="EINChanged" select="true()"/>
						</xsl:call-template>
					</div>
					<div class="styGenericDiv" style="width:41.5mm;height:9mm;padding-left:3px;border-top:1px solid black;">
						<span style="font-weight:bold;width:3mm;">D</span> 
						Date REIT established <br />
						<xsl:call-template name="PopulateMonthDayYear">
							<xsl:with-param name="TargetNode" select="$FormData/EstablishedDt"/>
						</xsl:call-template>
					</div>
					<div class="styGenericDiv" style="width:41.5mm;height:auto;padding-left:3px;border-top:1px solid black;font-family:Arial;">
						<span style="font-weight:bold;width:3mm;">E</span> 
						Total assets (see instructions) <br />
						$ 
						<span style="float:right;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TotalAssetsAmt"/>
							</xsl:call-template>
						</span>
					</div>
				</div>
				<!-- Form body -->
				<div class="styStdDiv" style="border-top:1px solid black;">
					<div class="styGenericDiv" style="width:145mm;font-family:Arial;border-right:1px solid black;">
						<div class="styLNDesc" style="height:auto;width:100%;">
							<span style="font-weight:bold;width:4mm;">F</span> 
							Check applicable box(es): 
							<span style="width:111mm;float:right;">
								<span style="width:2mm;"/> (1) 
								<input type="checkbox" class="styCkboxNM" style="margin-left:2px;" aria-label="Final Return">
									<xsl:call-template name="PopulateCheckbox">
										<xsl:with-param name="TargetNode" select="$FormData/FinalReturnInd"/>
										<xsl:with-param name="BackupName">F1120REITFinalReturnInd</xsl:with-param>
									</xsl:call-template>
								</input>
								Final return
								<span style="width:2mm;"/> (2) 
								<input type="checkbox" class="styCkboxNM" style="margin-left:2px;" aria-label="Name Change">
									<xsl:call-template name="PopulateCheckbox">
										<xsl:with-param name="TargetNode" select="$FormData/NameChangeInd"/>
										<xsl:with-param name="BackupName">F1120REITNameChangeInd</xsl:with-param>
									</xsl:call-template>
								</input>
								Name Change
								<span style="width:2mm;"/> (3) 
								<input type="checkbox" class="styCkboxNM" style="margin-left:2px;" aria-label="Address Change">
									<xsl:call-template name="PopulateCheckbox">
										<xsl:with-param name="TargetNode" select="$FormData/AddressChangeInd"/>
										<xsl:with-param name="BackupName">F1120REITAddressChangeInd</xsl:with-param>
									</xsl:call-template>
								</input>
								Address Change
								<br />
								<span style="width:2mm;"/> (4) 
								<input type="checkbox" class="styCkboxNM" style="margin-left:2px;" aria-label="Amended Return">
									<xsl:call-template name="PopulateCheckbox">
										<xsl:with-param name="TargetNode" select="$FormData/AmendedReturnInd"/>
										<xsl:with-param name="BackupName">F1120REITAmendedReturnInd</xsl:with-param>
									</xsl:call-template>
								</input>
								Amended return
								<span style="width:2mm;"/> (5) 
								<input type="checkbox" class="styCkboxNM" style="margin-left:2px;" aria-label="Superseded Return">
									<xsl:call-template name="PopulateCheckbox">
										<xsl:with-param name="TargetNode" select="$FormData/SupersededReturnInd"/>
										<xsl:with-param name="BackupName">F1120REITSupersededReturnInd</xsl:with-param>
									</xsl:call-template>
								</input>
								Superseded return
							</span>
						</div>
						<div class="styLNDesc" style="height:auto;width:100%;border-top:1px solid black;">
							<span style="font-weight:bold;width:4mm;">G</span> 
							Identify the type of REIT (see instructions): <span style="width:7.5mm;"/> (1) 
							<input type="checkbox" class="styCkboxNM" style="margin-left:2px;" aria-label="Equity REIT">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$FormData/EquityREITInd"/>
									<xsl:with-param name="BackupName">F1120REITEquityREITInd</xsl:with-param>
								</xsl:call-template>
							</input>
							Equity REIT
							<span style="width:5mm;"/> (2) 
							<input type="checkbox" class="styCkboxNM" style="margin-left:2px;" aria-label="Mortgage REIT">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$FormData/MortgageREITInd"/>
									<xsl:with-param name="BackupName">F1120REITMortgageREITInd</xsl:with-param>
								</xsl:call-template>
							</input>
							Mortgage REIT
							<span style="float:right;padding-right:0.5mm;">
								<xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode" select="$FormData/AmendedReturnInd"/>
								</xsl:call-template>
								<xsl:call-template name="LinkToLeftoverDataTableInline">
									<xsl:with-param name="TargetNode" select="$FormData/AmendedReturnInd/@filedPursuantToSect30191002Cd"/>
									<xsl:with-param name="Desc">Box F, (4) - Code</xsl:with-param>
								</xsl:call-template>							
							</span>
						</div>
					</div>
					<div class="styGenericDiv" style="width:41.5mm;font-family:Arial;padding:3px;">
						<span style="font-weight:bold;width:3mm;">H</span> 
						PBA code (see instructions) <br />
						<xsl:call-template name="PopulateText">
							<xsl:with-param name="TargetNode" select="$FormData/PrincipalBusinessActivityCd"/>
						</xsl:call-template>
					</div>
				</div>
				<div class="styStdDiv" style="padding:1px;font-size:8pt;border-top:1px solid black;">
					<strong>Part I&mdash;Real Estate Investment Trust Taxable Income</strong> (see instructions)
				</div>
				<div class="styStdDiv" style="text-align:center;padding-top:1px;padding-bottom:1px;font-size:8pt;border-top:1px solid black;border-bottom:1px solid black;">
					<strong>Income </strong> (EXCLUDING income required to be reported in Part II or Part IV)
				</div>
				<!-- Line 1 -->
				<div class="styStdDiv">
					<div class="styLNLeftNumBoxSD">1</div>
					<div class="styLNDesc">
						Dividends
						<span class="sty1120REITDotLn">..............................</span>
					</div>
					<div class="styLNRightNumBox">1</div>
					<div class="styLNAmountBox">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/TotalDividendsReceivedAmt"/>
						</xsl:call-template>
					</div>
				</div>
				<!-- Line 2 -->
				<div class="styStdDiv">
					<div class="styLNLeftNumBoxSD">2</div>
					<div class="styLNDesc">
						Interest
						<span class="sty1120REITDotLn">...............................</span>
					</div>
					<div class="styLNRightNumBox">2</div>
					<div class="styLNAmountBox">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/TaxableInterestAmt"/>
						</xsl:call-template>
					</div>
				</div>
				<!-- Line 3 -->
				<div class="styStdDiv">
					<div class="styLNLeftNumBoxSD">3</div>
					<div class="styLNDesc">
						Gross rents from real property
						<span class="sty1120REITDotLn">........................</span>
					</div>
					<div class="styLNRightNumBox">3</div>
					<div class="styLNAmountBox">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/GrossRentsAmt"/>
						</xsl:call-template>
					</div>
				</div>
				<!-- Line 4 -->
				<div class="styStdDiv">
					<div class="styLNLeftNumBoxSD">4</div>
					<div class="styLNDesc">
						Other gross rents
						<span class="sty1120REITDotLn">............................</span>
					</div>
					<div class="styLNRightNumBox">4</div>
					<div class="styLNAmountBox">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/OtherGrossRentsAmt"/>
						</xsl:call-template>
					</div>
				</div>
				<!-- Line 5 -->
				<div class="styStdDiv">
					<div class="styLNLeftNumBoxSD">5</div>
					<div class="styLNDesc">
						Capital gain net income (attach Schedule D (Form 1120))
						<xsl:call-template name="SetFormLinkInline">
							<xsl:with-param name="TargetNode" select="$FormData/CapitalGainNetIncomeAmt"/>
						</xsl:call-template>
						<span class="sty1120REITDotLn">...............</span>
					</div>
					<div class="styLNRightNumBox">5</div>
					<div class="styLNAmountBox">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/CapitalGainNetIncomeAmt"/>
						</xsl:call-template>
					</div>
				</div>
				<!-- Line 6 -->
				<div class="styStdDiv">
					<div class="styLNLeftNumBoxSD">6</div>
					<div class="styLNDesc">
						Net gain or (loss) from Form 4797, Part II, line 17 (attach Form 4797)
						<xsl:call-template name="SetFormLinkInline">
							<xsl:with-param name="TargetNode" select="$FormData/TotalOrdinaryGainLossAmt"/>
						</xsl:call-template>
						<span class="sty1120REITDotLn">...........</span>
					</div>
					<div class="styLNRightNumBox">6</div>
					<div class="styLNAmountBox">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/TotalOrdinaryGainLossAmt"/>
						</xsl:call-template>
					</div>
				</div>
				<!-- Line 7 -->
				<div class="styStdDiv">
					<div class="styLNLeftNumBoxSD">7</div>
					<div class="styLNDesc">
						Other income (see instructions &mdash; attach statement)
						<xsl:call-template name="LinkToLeftoverDataTableInline">
							<xsl:with-param name="Desc">Line 7 - Other Income Description</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$FormData/OtherIncomeAmt/@otherIncomeDesc"/>
						</xsl:call-template>
						<xsl:call-template name="SetFormLinkInline">
							<xsl:with-param name="TargetNode" select="$FormData/OtherIncomeAmt"/>
						</xsl:call-template>
						<span class="sty1120REITDotLn">................</span>
					</div>
					<div class="styLNRightNumBox">7</div>
					<div class="styLNAmountBox">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/OtherIncomeAmt"/>
						</xsl:call-template>
					</div>
				</div>
				<!-- Line 8 -->
				<div class="styStdDiv">
					<div class="styLNLeftNumBoxSD">8</div>
					<div class="styLNDesc">
						<strong>Total income. </strong> Add lines 1 through 7
						<span class="sty1120REITDotLn">......................</span>
					</div>
					<div class="styLNRightNumBoxNBB">8</div>
					<div class="styLNAmountBoxNBB">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/TotalIncomeAmt"/>
						</xsl:call-template>
					</div>
				</div>
				<div class="styStdDiv" style="text-align:center;padding-top:1px;padding-bottom:1px;font-size:8pt;border-top:1px solid black;border-bottom:1px solid black;">
					<strong>Deductions </strong> (EXCLUDING deductions directly connected with income required to be reported in Part II or Part IV)
				</div>
				<!-- Line 9 -->
				<div class="styStdDiv">
					<div class="styLNLeftNumBoxSD">9</div>
					<div class="styLNDesc">
						Compensation of officers (see instructions &mdash; attach Form 1125-E)
						<xsl:call-template name="SetFormLinkInline">
							<xsl:with-param name="TargetNode" select="$FormData/OfficersCompensationAmt"/>
						</xsl:call-template>
						<span class="sty1120REITDotLn">............</span>
					</div>
					<div class="styLNRightNumBox">9</div>
					<div class="styLNAmountBox">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/OfficersCompensationAmt"/>
						</xsl:call-template>
					</div>
				</div>
				<!-- Line 10 -->
				<div class="styStdDiv">
					<div class="styLNLeftNumBox">10</div>
					<div class="styLNDesc">
						Salaries and wages
						<span class="sty1120REITDotLn">............................</span>
					</div>
					<div class="styLNRightNumBox">10</div>
					<div class="styLNAmountBox">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/SalariesAndWagesAmt"/>
						</xsl:call-template>
					</div>
				</div>
				<!-- Line 11 -->
				<div class="styStdDiv">
					<div class="styLNLeftNumBox">11</div>
					<div class="styLNDesc">
						Repairs and maintenance
						<span class="sty1120REITDotLn">..........................</span>
					</div>
					<div class="styLNRightNumBox">11</div>
					<div class="styLNAmountBox">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/RepairsAndMaintenanceAmt"/>
						</xsl:call-template>
					</div>
				</div>
				<!-- Line 12 -->
				<div class="styStdDiv">
					<div class="styLNLeftNumBox">12</div>
					<div class="styLNDesc">
						Bad debts
						<span class="sty1120REITDotLn">..............................</span>
					</div>
					<div class="styLNRightNumBox">12</div>
					<div class="styLNAmountBox">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/BadDebtExpenseAmt"/>
						</xsl:call-template>
					</div>
				</div>
				<!-- Line 13 -->
				<div class="styStdDiv">
					<div class="styLNLeftNumBox">13</div>
					<div class="styLNDesc">
						Rents
						<xsl:call-template name="SetFormLinkInline">
							<xsl:with-param name="TargetNode" select="$FormData/TotalRentOrLeaseExpenseAmt"/>
						</xsl:call-template>
						<span class="sty1120REITDotLn">..............................</span>
					</div>
					<div class="styLNRightNumBox">13</div>
					<div class="styLNAmountBox">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/TotalRentOrLeaseExpenseAmt"/>
						</xsl:call-template>
					</div>
				</div>
				<!-- Line 14 -->
				<div class="styStdDiv">
					<div class="styLNLeftNumBox">14</div>
					<div class="styLNDesc">
						Taxes and licenses
						<span class="sty1120REITDotLn">............................</span>
					</div>
					<div class="styLNRightNumBox">14</div>
					<div class="styLNAmountBox">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/TaxesAndLicensesAmt"/>
						</xsl:call-template>
					</div>
				</div>
				<!-- Line 15 -->
				<div class="styStdDiv">
					<div class="styLNLeftNumBox">15</div>
					<div class="styLNDesc">
						Interest (see instructions)
						<xsl:call-template name="SetFormLinkInline">
							<xsl:with-param name="TargetNode" select="$FormData/InterestDeductionAmt"/>
						</xsl:call-template>
						<span class="sty1120REITDotLn">.........................</span>
					</div>
					<div class="styLNRightNumBox">15</div>
					<div class="styLNAmountBox">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/InterestDeductionAmt"/>
						</xsl:call-template>
					</div>
				</div>
				<!-- Line 16 -->
				<div class="styStdDiv">
					<div class="styLNLeftNumBox">16</div>
					<div class="styLNDesc">
						Depreciation (attach Form 4562)
						<xsl:call-template name="SetFormLinkInline">
							<xsl:with-param name="TargetNode" select="$FormData/DepreciationAmt"/>
						</xsl:call-template>
						<span class="sty1120REITDotLn">......................</span>
					</div>
					<div class="styLNRightNumBox">16</div>
					<div class="styLNAmountBox">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/DepreciationAmt"/>
						</xsl:call-template>
					</div>
				</div>
				<!-- Line 17 -->
				<div class="styStdDiv">
					<div class="styLNLeftNumBox">17</div>
					<div class="styLNDesc">
						Advertising
						<span class="sty1120REITDotLn">..............................</span>
					</div>
					<div class="styLNRightNumBox">17</div>
					<div class="styLNAmountBox">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/AdvertisingAmt"/>
						</xsl:call-template>
					</div>
				</div>
				<!-- Line 18 -->
				<div class="styStdDiv">
					<div class="styLNLeftNumBox">18</div>
					<div class="styLNDesc">
						Energy efficient commercial buildings deduction (attach Form 7205)
						<xsl:call-template name="SetFormLinkInline">
							<xsl:with-param name="TargetNode" select="$FormData/EnergyEffcntCmrclBldgDedAmt"/>
						</xsl:call-template>
						<span class="sty1120REITDotLn">...........</span>
					</div>
					<div class="styLNRightNumBox">18</div>
					<div class="styLNAmountBox">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/EnergyEffcntCmrclBldgDedAmt"/>
						</xsl:call-template>
					</div>
				</div>
				<!-- Line 19 -->
				<div class="styStdDiv">
					<div class="styLNLeftNumBox">19</div>
					<div class="styLNDesc">
						Other deductions (see instructions &mdash; attach statement)
						<xsl:call-template name="SetFormLinkInline">
							<xsl:with-param name="TargetNode" select="$FormData/OtherDeductionsAmt"/>
						</xsl:call-template>
						<span class="sty1120REITDotLn">...............</span>
					</div>
					<div class="styLNRightNumBox">19</div>
					<div class="styLNAmountBox">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/OtherDeductionsAmt"/>
						</xsl:call-template>
					</div>
				</div>
				<!-- Line 20 -->
				<div class="styStdDiv">
					<div class="styLNLeftNumBox">20</div>
					<div class="styLNDesc">
						<strong>Total deductions. </strong> Add lines 9 through 19
						<span class="sty1120REITDotLn">....................</span>
					</div>
					<div class="styLNRightNumBox">20</div>
					<div class="styLNAmountBox">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/TotalDeductionAmt"/>
						</xsl:call-template>
					</div>
				</div>
				<!-- Line 21 -->
				<div class="styStdDiv">
					<div class="styLNLeftNumBox">21</div>
					<div class="styLNDesc">
						Taxable income before net operating loss and other special deductions. Subtract line 20 from line 8
						<xsl:call-template name="SetFormLinkInline">
							<xsl:with-param name="TargetNode" select="$FormData/TaxableIncomeBfrNOLSpclDedAmt"/>
						</xsl:call-template>
						<!--<span class="sty1120REITDotLn">.</span>-->
					</div>
					<div class="styLNRightNumBox">21</div>
					<div class="styLNAmountBox">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/TaxableIncomeBfrNOLSpclDedAmt"/>
						</xsl:call-template>
					</div>
				</div>
				<!-- Line 22a -->
				<div class="styStdDiv">
					<div class="styLNLeftNumBox">22</div>
					<div class="styLNDesc" style="width:98mm;">
						<span style="width:9mm;font-weight:bold;">Less: </span>
						<span style="width:3mm;font-weight:bold;">a</span>
						Net operating loss deduction (see instructions)
						<xsl:call-template name="SetFormLinkInline">
							<xsl:with-param name="TargetNode" select="$FormData/NetOperatingLossDeductionAmt"/>
						</xsl:call-template>
						<span class="sty1120REITDotLn">.....</span>
					</div>
					<div class="styLNRightNumBox">22a</div>
					<div class="styLNAmountBox" style="padding-right:0.5mm;">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/NetOperatingLossDeductionAmt"/>
						</xsl:call-template>
					</div>
					<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;">&nbsp;</div>
					<div class="styLNAmountBoxNBB">&nbsp;</div>
				</div>
				<!-- Line 22b -->
				<div class="styStdDiv">
					<div class="styLNLeftNumBox">&nbsp;</div>
					<div class="styLNDesc" style="width:98mm;">
						<span style="width:9mm;font-weight:bold;">&nbsp;</span>
						<span style="width:3mm;font-weight:bold;">b</span>
						Total deduction for dividends paid (Schedule A, line 7)
						<span class="sty1120REITDotLn">....</span>
					</div>
					<div class="styLNRightNumBox">22b</div>
					<div class="styLNAmountBox" style="padding-right:0.5mm;">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/TotalDeductionDividendsPaidAmt"/>
						</xsl:call-template>
					</div>
					<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;">&nbsp;</div>
					<div class="styLNAmountBoxNBB">&nbsp;</div>
				</div>
				<!-- Line 22c -->
				<div class="styStdDiv">
					<div class="styLNLeftNumBox">&nbsp;</div>
					<div class="styLNDesc" style="width:98mm;height:auto;">
						<span style="width:9mm;font-weight:bold;">&nbsp;</span>
						<span style="width:4mm;font-weight:bold;">c</span>
						<span style="width:84.5mm;">
							Section 857(b)(2)(E) deduction (Schedule J, lines 1c, 1e, 1f, and 1g)
							<span class="sty1120REITDotLn">...................</span>
						</span>
					</div>
					<div class="styLNRightNumBox" style="height:7.2mm;"><br />22c</div>
					<div class="styLNAmountBox" style="height:7.2mm;padding-right:0.5mm;"><br />
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/Section857b2EDeductionAmt"/>
						</xsl:call-template>
					</div>
					<div class="styLNRightNumBoxNBB" style="height:3.2mm;background-color:lightgrey;"></div>
					<div class="styLNAmountBoxNBB" style="height:3.2mm;"></div>
					<div class="styLNRightNumBox" style="">22d</div>
					<div class="styLNAmountBox" style="">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/TotNOLDivPdSect857b2EDedAmt"/>
						</xsl:call-template>
					</div>
				</div>
				<!-- Line 23 -->
				<div class="styStdDiv">
					<div class="styLNLeftNumBox">23</div>
					<div class="styLNDesc">
						<strong>Real estate investment trust taxable income. </strong> Subtract line 22d from line 21
						<span class="sty1120REITDotLn">........</span>
					</div>
					<div class="styLNRightNumBoxNBB">23</div>
					<div class="styLNAmountBoxNBB">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/REITTaxableIncomeAmt"/>
						</xsl:call-template>
					</div>
				</div>
				<!-- BEGIN Signature Section -->
				<div class="styStdDiv" style="border-bottom:1px solid black;border-top:1px solid black;">
					<div class="styGenericDiv" style="width:13mm;height:17mm;font-size:12pt;font-weight:bold;padding-top:3mm;border-right:1px solid black;">
						Sign Here
					</div>
					<div class="styGenericDiv" style="width:174mm;font-size:6pt;padding:0.5mm;">
						Under penalties of perjury, I declare that I have examined this return, including accompanying schedules and statements, 
						and to the best of my knowledge and belief, it is true, correct, and complete. Declaration of preparer (other than taxpayer) 
						is based on all information of which preparer has any knowledge.<br />
					</div>
					<div class="styGenericDiv" style="width:174mm;">
						<div class="styGenericDiv" style="width:56mm;">
							<span style="width:100%;height:6mm;border-bottom:1px solid black;border-right:1px solid black;vertical-align:bottom;padding-left:0.5mm;padding-top:2mm;">
								<xsl:call-template name="PopulateReturnHeaderOfficer">
									<xsl:with-param name="TargetNode">PersonNm</xsl:with-param>
								</xsl:call-template>
							</span>
							<span style="padding-left:1mm;">Signature of officer</span>
						</div>
						<div class="styGenericDiv" style="width:16mm;">
							<span style="width:100%;height:6mm;border-bottom:1px solid black;padding-left:0.5mm;padding-top:2mm;">
								<xsl:call-template name="PopulateReturnHeaderOfficer">
									<xsl:with-param name="TargetNode">SignatureDt</xsl:with-param>
								</xsl:call-template>
							</span>
							<span>Date</span>
						</div>
						<div class="styGenericDiv" style="width:56mm;margin-left:2mm;">
							<span style="width:100%;height:6mm;border-bottom:1px solid black;padding-top:2mm;">
								<xsl:call-template name="PopulateReturnHeaderOfficer">
									<xsl:with-param name="TargetNode">PersonTitleTxt</xsl:with-param>
								</xsl:call-template>
							</span>
							<span>Title</span>
						</div>
						<div class="styGenericDiv" style="width:42mm;height:11mm;border:3px solid black;margin-left:3px;font-family:Arial;padding-left:1mm;">
							<xsl:call-template name="PopulateSpan">
								<xsl:with-param name="TargetNode" select="$RtnHdrData/BusinessOfficerGrp/DiscussWithPaidPreparerInd"/>
							</xsl:call-template>
							May the IRS discuss this return<br/>with the preparer shown below?<br/> See instructions.
							<input type="checkbox" class="styCkboxNM" style="margin-right:2px;" alt="Discuss with paid preparer Yes">
								<xsl:call-template name="PopulateReturnHeaderOfficer">
									<xsl:with-param name="TargetNode">AuthorizeThirdPartyYesCheckbox</xsl:with-param>
									<xsl:with-param name="BackupName">IRS1120REITAuthorizeThirdPartyYesCheckbox</xsl:with-param>
								</xsl:call-template>
							</input>
							<span>Yes</span>
							<input type="checkbox" class="styCkboxNM" style="margin-left:6px;margin-right:2px;" alt="Discuss with paid preparer No">
								<xsl:call-template name="PopulateReturnHeaderOfficer">
									<xsl:with-param name="TargetNode">AuthorizeThirdPartyNoCheckbox</xsl:with-param>
									<xsl:with-param name="BackupName">IRS1120REITAuthorizeThirdPartyNoCheckbox</xsl:with-param>
								</xsl:call-template>
							</input>
							<span>No</span>
						</div>
					</div>
				</div>
				<!-- paid preparer -->
				<div class="styStdDiv"  style="width:187mm;font-size:6pt;">
					<div class="styGenericDiv" style="width:23mm;height:auto;padding-top:4mm;">
						<span class="styMainTitle" style="font-size:11pt;">
							Paid
							Preparer
							Use Only
						</span>
					</div>
					<div class="styGenericDiv" style="width:164mm;">
						<div class="styGenericDiv" style="width:164mm;border-style:solid;border-color:black;border-width:0px 0px 1px 0px;">
							<div class="styLNDesc" style="height:8mm;width:46.5mm;padding-top:0mm;border-right:1px solid black;border-left:1px solid black;padding-left:1mm;">Print/Type preparer's name<br/>
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$RtnHdrData/PreparerPersonGrp/PreparerPersonNm"/>
								</xsl:call-template>
							</div>
						<div class="styLNDesc" style="height:8mm;width:46.5mm;padding-top:0mm;border-right:1px solid black;padding-left:1mm;">
							Preparer's signature
						</div>
							<div class="styLNDesc" 
							style="height:8mm;width:15mm;border-right:1px solid black;padding-top:0mm;padding-left:1mm;">Date <br/>
								<br/>
								<xsl:call-template name="PopulateReturnHeaderPreparer">
									<xsl:with-param name="TargetNode">DatePrepared</xsl:with-param>
								</xsl:call-template>
							</div>
							<div class="styLNDesc"
							 style="height:8mm;width:18mm;border-right:1px solid  black;padding-top:0mm;vertical-align:top;padding-bottom:0mm;padding-left:1mm;">
								<label>
									<xsl:call-template name="PopulateLabel">
										<xsl:with-param name="TargetNode" select="$RtnHdrData/PreparerPersonGrp/SelfEmployedInd"/>
										<xsl:with-param name="BackupName">$RtnHdrDataPreparerPersonGrpSelfEmployed</xsl:with-param>
									</xsl:call-template>
									Check 
									<input class="styCkbox" alt="Preparer Person Self Employed" type="checkbox" style="width:4mm;">
										<xsl:call-template name="PopulateCheckbox">
											<xsl:with-param name="TargetNode" select="$RtnHdrData/PreparerPersonGrp/SelfEmployedInd"/>
											<xsl:with-param name="BackupName">$RtnHdrDataPreparerPersonGrpSelfEmployed</xsl:with-param>
										</xsl:call-template>
									</input>
									<span style="width:4.5px;"/>if<br/>self-employed
								</label>
							</div>
							<div class="styLNDesc" style="height:6mm;width:26mm;padding-top:0mm;padding-left:1mm;">PTIN
							<br/>
								<br/>
								<span style="width:6mm;"/>
								<xsl:if test="$RtnHdrData/PreparerPersonGrp/SSN">
									<xsl:call-template name="PopulateReturnHeaderPreparer">
										<xsl:with-param name="TargetNode">SSN</xsl:with-param>
									</xsl:call-template>
								</xsl:if>
								<xsl:if test="$RtnHdrData/PreparerPersonGrp/PTIN">
									<xsl:call-template name="PopulateReturnHeaderPreparer">
										<xsl:with-param name="TargetNode">PTIN</xsl:with-param>
									</xsl:call-template>
								</xsl:if>
							</div>
						</div>
						<div style="width:164mm;float:left;clear:none;border-style:solid;border-color:black;border-width:0px 0px 1px 0px;">
						<div class="styLNDesc" style="height:6mm;width:126mm;border-right:1px solid black;border-left:1px solid black;padding-left:1mm;">
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
							<div class="styLNDesc" style="height:6mm;width:32mm;padding-left:1mm;">Firm's EIN
								<span style="width:4px;"/>
								<xsl:choose>
									<xsl:when test="$RtnHdrData/PreparerFirmGrp/PreparerFirmEIN">
										<xsl:call-template name="PopulateReturnHeaderPreparerFirm">
											<xsl:with-param name="TargetNode">EIN</xsl:with-param>
										</xsl:call-template>
									</xsl:when>
									<xsl:otherwise>
										<xsl:call-template name="PopulateReturnHeaderPreparerFirm">
											<xsl:with-param name="TargetNode">MissingEINReason</xsl:with-param>
										</xsl:call-template>
									</xsl:otherwise>
								</xsl:choose>
							</div>
						</div>
						<div style="width:164mm;float:left;clear:none;">
							<div class="styLNDesc" style="width:126mm;border-right:1px solid black;border-left:1px solid black;padding-left:1mm;min-height:8mm;height:auto;">
								<div class="styGenericDiv" style="padding-right:.5mm;">Firm's address 
								</div>
								<div class="styGenericDiv" style="padding-right:.5mm;">
									<xsl:call-template name="PopulateReturnHeaderPreparerFirm">
										<xsl:with-param name="TargetNode">AddressLine1Txt</xsl:with-param>
									</xsl:call-template>
									<br/>
									<xsl:call-template name="PopulateReturnHeaderPreparerFirm">
										<xsl:with-param name="TargetNode">AddressLine2Txt</xsl:with-param>
									</xsl:call-template>
									<br/>
									<xsl:if test="$RtnHdrData/PreparerFirmGrp/PreparerUSAddress">
										<xsl:call-template name="PopulateReturnHeaderPreparerFirm">
											<xsl:with-param name="TargetNode">CityNm</xsl:with-param>
										</xsl:call-template>,
										<span style="width:2px;"/>
										<xsl:call-template name="PopulateReturnHeaderPreparerFirm">
											<xsl:with-param name="TargetNode">StateAbbreviationCd</xsl:with-param>
										</xsl:call-template>,
										<span style="width:2px;"/>
										<xsl:call-template name="PopulateReturnHeaderPreparerFirm">
											<xsl:with-param name="TargetNode">ZIPCd</xsl:with-param>
										</xsl:call-template>
									</xsl:if>
									<xsl:if test="$RtnHdrData/PreparerFirmGrp/PreparerForeignAddress">
										<xsl:call-template name="PopulateReturnHeaderPreparerFirm">
											<xsl:with-param name="TargetNode">CityNm</xsl:with-param>
										</xsl:call-template>,
										<span style="width:2px;"/>
										<xsl:call-template name="PopulateReturnHeaderPreparerFirm">
											<xsl:with-param name="TargetNode">ProvinceOrStateNm</xsl:with-param>
										</xsl:call-template>,
										<span style="width:2px;"/>
										<xsl:call-template name="PopulateReturnHeaderPreparerFirm">
											<xsl:with-param name="TargetNode">ForeignPostalCd</xsl:with-param>
										</xsl:call-template>,
										<span style="width:2px;"/>
										<xsl:call-template name="PopulateReturnHeaderPreparerFirm">
											<xsl:with-param name="TargetNode">CountryCd</xsl:with-param>
										</xsl:call-template>
									</xsl:if>
								</div>
							</div>
							<div class="styLNDesc" style="width:37mm;padding-left:1mm;height:auto;word-break:break-all;"> 
								Phone no. 
								<xsl:call-template name="PopulateReturnHeaderPreparer">
									<xsl:with-param name="TargetNode">Phone</xsl:with-param>
								</xsl:call-template>
								<xsl:call-template name="PopulateReturnHeaderPreparer">
									<xsl:with-param name="TargetNode">ForeignPhone</xsl:with-param>
								</xsl:call-template>
							</div>
						</div>
					</div>
				</div>
				<!-- Form footer-->
				<div class="styStdDiv pageEnd" style="border-top:1px solid black;">
					<span style="font-weight:bold;font-family:Arial;">For Paperwork Reduction Act Notice, see separate instructions.</span>
					<span style="margin-left:10mm;">Cat. No. 64114F</span>
					<span style="float:right;">
						Form <strong>1120-REIT</strong> (2025)
					</span>
				</div>
				<div class="styStdDiv">
					Form 1120-REIT (2025)
					<div style="float:right;">
						Page <span style="font-weight:bold;font-size:8pt;">2</span>
					</div>
				</div>
				<div class="styStdDiv" style="text-align:center;padding:1px;font-size:8pt;border-top:1px solid black;border-bottom:1px solid black;">
					<strong>Tax and Payments</strong>
				</div>
				<!-- Line 24 -->
				<div class="styStdDiv">
					<div class="styLNLeftNumBox">24</div>
					<div class="styLNDesc">
						<strong>Total tax </strong> (Schedule J, line 9)
						<span class="sty1120REITDotLn">........................</span>
					</div>
					<div class="styLNRightNumBox">24</div>
					<div class="styLNAmountBox">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/TotalTaxAmt"/>
						</xsl:call-template>
					</div>
				</div>
				<!-- Line 25a -->
				<div class="styStdDiv">
					<div class="styLNLeftNumBox">25a</div>
					<div class="styLNDesc" style="width:98mm;">
						Preceding year's overpayment credited to the current year
						<span class="sty1120REITDotLn">.....</span>
					</div>
					<div class="styLNRightNumBox">25a</div>
					<div class="styLNAmountBox" style="padding-right:0.5mm;">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/PriorYearOverpaymentCreditAmt"/>
						</xsl:call-template>
					</div>
					<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;">&nbsp;</div>
					<div class="styLNAmountBoxNBB" style="">&nbsp;</div>
				</div>
				<!-- Line 25b -->
				<div class="styStdDiv">
					<div class="styLNLeftNumBox" style="padding-left:4.2mm;">b</div>
					<div class="styLNDesc" style="width:98mm;">
						Current year's estimated tax payments
						<span class="sty1120REITDotLn">...........</span>
					</div>
					<div class="styLNRightNumBox">25b</div>
					<div class="styLNAmountBox" style="padding-right:0.5mm;">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/EstimatedTaxPaymentsAmt"/>
						</xsl:call-template>
					</div>
					<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;">&nbsp;</div>
					<div class="styLNAmountBoxNBB" style="">&nbsp;</div>
				</div>
				<!-- Line 25c -->
				<div class="styStdDiv">
					<div class="styLNLeftNumBox" style="padding-left:4.2mm;">c</div>
					<div class="styLNDesc" style="width:98mm;">
						Less current year's refund applied for on Form 4466
						<span class="sty1120REITDotLn">.......</span>
					</div>
					<div class="styLNRightNumBox">25c</div>
					<div class="styLNAmountBox" style="padding-right:0.5mm;">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/OverpaymentOfEstimatedTaxAmt"/>
						</xsl:call-template>
					</div>
					<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;">&nbsp;</div>
					<div class="styLNAmountBoxNBB" style="">&nbsp;</div>
				</div>
				<!-- Line 25d -->
				<div class="styStdDiv">
					<div class="styLNLeftNumBox" style="padding-left:4.2mm;">d</div>
					<div class="styLNDesc" style="width:98mm;">
						Tax deposited with Form 7004
						<span class="sty1120REITDotLn">..............</span>
					</div>
					<div class="styLNRightNumBox">25d</div>
					<div class="styLNAmountBox" style="padding-right:0.5mm;">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/TaxPaidForm7004Amt"/>
						</xsl:call-template>
					</div>
					<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;">&nbsp;</div>
					<div class="styLNAmountBoxNBB" style="">&nbsp;</div>
				</div>
				<!-- Line 25e -->
				<div class="styStdDiv">
					<div class="styLNLeftNumBox" style="padding-left:4.2mm;">e</div>
					<div class="styLNDesc" style="width:98mm;">
						Credit for tax paid on undistributed capital gains (attach Form 2439)
						<xsl:call-template name="SetFormLinkInline">
							<xsl:with-param name="TargetNode" select="$FormData/TotalUndistributedLTCapGainAmt"/>
						</xsl:call-template>
						<span class="sty1120REITDotLn">.</span>
					</div>
					<div class="styLNRightNumBox">25e</div>
					<div class="styLNAmountBox" style="padding-right:0.5mm;">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/TotalUndistributedLTCapGainAmt"/>
						</xsl:call-template>
					</div>
					<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;">&nbsp;</div>
					<div class="styLNAmountBoxNBB" style="">&nbsp;</div>
				</div>
				<!-- Line 25f -->
				<div class="styStdDiv">
					<div class="styLNLeftNumBox" style="padding-left:4.2mm;">f</div>
					<div class="styLNDesc" style="width:98mm;">
						Credit for federal tax paid on fuels (attach Form 4136)
						<xsl:call-template name="SetFormLinkInline">
							<xsl:with-param name="TargetNode" select="$FormData/TotalFuelTaxCreditAmt"/>
						</xsl:call-template>
						<span class="sty1120REITDotLn">......</span>
					</div>
					<div class="styLNRightNumBox">25f</div>
					<div class="styLNAmountBox" style="padding-right:0.5mm;">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/TotalFuelTaxCreditAmt"/>
						</xsl:call-template>
					</div>
					<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;">&nbsp;</div>
					<div class="styLNAmountBoxNBB" style="">&nbsp;</div>
				</div>
				<!-- Line 25g -->
				<div class="styStdDiv">
					<div class="styLNLeftNumBox" style="padding-left:4.2mm;">g</div>
					<div class="styLNDesc" style="width:98mm;">
						Elective payment election amount from Form 3800
						<xsl:call-template name="SetFormLinkInline">
							<xsl:with-param name="TargetNode" select="$FormData/ElectivePaymentAmt"/>
						</xsl:call-template>
						<span class="sty1120REITDotLn">.......</span>
					</div>
					<div class="styLNRightNumBox">25g</div>
					<div class="styLNAmountBox" style="padding-right:0.5mm;">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/ElectivePaymentAmt"/>
						</xsl:call-template>
					</div>
					<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;">&nbsp;</div>
					<div class="styLNAmountBoxNBB" style="">&nbsp;</div>
				</div>
				<!-- Line 25z -->
				<div class="styStdDiv">
					<div class="styLNLeftNumBox" style="padding-left:4.2mm;">z</div>
					<div class="styLNDesc" style="width:98mm;">
						Other payments and credits (see instructions &mdash; attach statement)
						<xsl:call-template name="SetFormLinkInline">
							<xsl:with-param name="TargetNode" select="$FormData/OtherCreditPaymentAmt"/>
						</xsl:call-template>
						<xsl:call-template name="LinkToLeftoverDataTableInline">
							<xsl:with-param name="TargetNode" select="$FormData/OtherCreditPaymentAmt/@backupWithholdingAmt"/>
							<xsl:with-param name="Desc">Part I, Line 27z - Backup Withholding Amount</xsl:with-param>
						</xsl:call-template>
						<xsl:call-template name="LinkToLeftoverDataTableInline">
							<xsl:with-param name="TargetNode" select="$FormData/OtherCreditPaymentAmt/@backupWithholdingTypeCd"/>
							<xsl:with-param name="Desc">Part I, Line 27z - Backup Withholding Type</xsl:with-param>
						</xsl:call-template>
						<!--<span class="sty1120REITDotLn">..</span>-->
					</div>
					<div class="styLNRightNumBox">25z</div>
					<div class="styLNAmountBox" style="padding-right:0.5mm;">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/OtherCreditPaymentAmt"/>
						</xsl:call-template>
					</div>
					<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;">&nbsp;</div>
					<div class="styLNAmountBoxNBB" style="">&nbsp;</div>
				</div>
				<!-- Line 26 -->
				<div class="styStdDiv">
					<div class="styLNLeftNumBox">26</div>
					<div class="styLNDesc">
						<strong>Total payments and credits. </strong> Combine lines 25a through 25z
						<span class="sty1120REITDotLn">..............</span>
					</div>
					<div class="styLNRightNumBox">26</div>
					<div class="styLNAmountBox">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/TotalPaymentsAndCreditsAmt"/>
						</xsl:call-template>
					</div>
				</div>
				<!-- Line 27 -->
				<div class="styStdDiv">
					<div class="styLNLeftNumBox">27</div>
					<div class="styLNDesc">
						Estimated tax penalty (see instructions). Check if Form 2220 is attached
						<xsl:call-template name="SetFormLinkInline">
							<xsl:with-param name="TargetNode" select="$FormData/Form2220AttachedInd"/>
						</xsl:call-template>
						<span class="sty1120REITDotLn" style="padding-right:1.5mm;">.........
						<input type="checkbox" class="styCkboxNM" style="float:right;" aria-label="Form 2220 attached">
							<xsl:call-template name="PopulateCheckbox">
								<xsl:with-param name="TargetNode" select="$FormData/Form2220AttachedInd"/>
								<xsl:with-param name="BackupName">F1120REITForm2220AttachedInd</xsl:with-param>
							</xsl:call-template>
						</input></span>
					</div>
					<div class="styLNRightNumBox">27</div>
					<div class="styLNAmountBox">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/EsPenaltyAmt"/>
						</xsl:call-template>
					</div>
				</div>
				<!-- Line 28 -->
				<div class="styStdDiv">
					<div class="styLNLeftNumBox">28</div>
					<div class="styLNDesc">
						<strong>Tax due. </strong> If line 26 is smaller than the total of lines 24 and 27, enter amount owed
						<span class="sty1120REITDotLn">........</span>
					</div>
					<div class="styLNRightNumBox">28</div>
					<div class="styLNAmountBox">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/BalanceDueAmt"/>
						</xsl:call-template>
					</div>
				</div>
				<!-- Line 29 -->
				<div class="styStdDiv">
					<div class="styLNLeftNumBox">29</div>
					<div class="styLNDesc">
						<strong>Overpayment. </strong> If line 26 is larger than the total of lines 24 and 27, enter amount overpaid
						<span class="sty1120REITDotLn">.....</span>
					</div>
					<div class="styLNRightNumBox">29</div>
					<div class="styLNAmountBox">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/OverpaymentSection/OverpaymentAmt"/>
						</xsl:call-template>
					</div>
				</div>
				<!-- Line 30 -->
				<div class="styStdDiv">
					<div class="styLNLeftNumBox">30</div>
					<div class="styLNDesc">
						Enter amount of line 25 you want: <strong>a&nbsp;Credited to 2026 estimated tax </strong>
						<span style="width:28mm;text-align:right;padding-right:1mm;border-bottom:1px dashed black;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/OverpaymentSection/AppliedToEsTaxAmt"/>
							</xsl:call-template>
						</span>
						<span style="font-weight:bold;float:right;padding-right:1mm;">b Refunded</span>
					</div>
					<div class="styLNRightNumBox">30b</div>
					<div class="styLNAmountBox">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/OverpaymentSection/RefundAmt"/>
						</xsl:call-template>
					</div>
				</div>
				<!-- Direct Deposit -->
				<div class="styStdDiv" style="">
					<div class="styLNLeftNumBox">&nbsp;</div>
					<div class="styLNDesc" style="height:auto;">
						<div class="styLNDesc" style="width:27mm;"><strong>c</strong>&nbsp;Routing number </div>
						<div class="styLNDesc" style="border:1px solid black;text-align:center;width:40mm;">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/RoutingTransitNum"/>
							</xsl:call-template>
						</div>
						<div class="styLNLeftNumBox" style="padding-left:1mm;font-weight:bold;margin-left:3mm;"> d</div>
						<div class="styLNDesc" style="width:40mm;padding-top:0px;height:auto;">
							Type: 
							<input type="checkbox" class="styCkboxNM" style="" aria-label="Checking">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$FormData/CheckingAccountInd"/>
									<xsl:with-param name="BackupName">IRS1120REITBankAccountTypeCd[1]</xsl:with-param>
								</xsl:call-template>
							</input>
							Checking
							<input type="checkbox" class="styCkboxNM" style="margin-left:6px;" aria-label="Savings">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$FormData/SavingsAccountInd"/>
									<xsl:with-param name="BackupName">IRS1120REITBankAccountTypeCd[2]</xsl:with-param>
								</xsl:call-template>
							</input>
							Savings
						</div>
					</div>
					<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;height:5mm;">&nbsp;</div>
					<div class="styLNAmountBoxNBB" style="height:5mm;">&nbsp;</div>
				</div>
				<div class="styStdDiv">
					<div class="styLNLeftNumBox">&nbsp;</div>
					<div class="styLNDesc" style="height:auto;"><strong>e</strong>&nbsp;Account number 
						<span style="border:1px solid black;text-align:center;width:80mm;height:auto;margin-left:3.1mm;">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/DepositorAccountNum"/>
							</xsl:call-template>
						</span>
					</div>
					<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;height:4.2mm;">&nbsp;</div>
					<div class="styLNAmountBoxNBB" style="height:4.2mm;">&nbsp;</div>
				</div>
				<div class="styStdDiv" style="padding:1px;font-size:8pt;border-top:1px solid black;border-bottom:1px solid black;">
					<strong>Part II&mdash;Tax on Net Income From Foreclosure Property</strong> 
					(Section 856(e)) (see instructions)
				</div>
				<!-- Part 2, Line 1 -->
				<div class="styStdDiv">
					<div class="styLNLeftNumBoxSD">1</div>
					<div class="styLNDesc" style="height:auto;">
						Net gain or (loss) from the sale or other disposition of foreclosure property described in section 
						1221(a)(1) (attach statement)
						<xsl:call-template name="SetFormLinkInline">
							<xsl:with-param name="TargetNode" select="$FormData/NetGainOrLossAmt"/>
						</xsl:call-template>
						<span class="sty1120REITDotLn">..........................</span>
					</div>
					<div class="styLNRightNumBox" style="height:7.2mm;"><br />1</div>
					<div class="styLNAmountBox" style="height:7.2mm;"><br />
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/NetGainOrLossAmt"/>
						</xsl:call-template>
					</div>
				</div>
				<!-- Part 2, Line 2 -->
				<div class="styStdDiv">
					<div class="styLNLeftNumBoxSD">2</div>
					<div class="styLNDesc" style="height:auto;">
						Gross income from foreclosure property (see instructions&mdash;attach statement)
						<xsl:call-template name="SetFormLinkInline">
							<xsl:with-param name="TargetNode" select="$FormData/GrossIncomeForeclosurePropAmt"/>
						</xsl:call-template>
						<span class="sty1120REITDotLn">.........</span>
					</div>
					<div class="styLNRightNumBox" style="height:4.4mm;">2</div>
					<div class="styLNAmountBox" style="height:4.4mm;">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/GrossIncomeForeclosurePropAmt"/>
						</xsl:call-template>
					</div>
				</div>
				<!-- Part 2, Line 3 -->
				<div class="styStdDiv">
					<div class="styLNLeftNumBoxSD">3</div>
					<div class="styLNDesc" style="height:auto;">
						Total income from foreclosure property. Add lines 1 and 2
						<span class="sty1120REITDotLn">................</span>
					</div>
					<div class="styLNRightNumBox">3</div>
					<div class="styLNAmountBox">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/TotalIncomeForeclosurePropAmt"/>
						</xsl:call-template>
					</div>
				</div>
				<!-- Part 2, Line 4 -->
				<div class="styStdDiv">
					<div class="styLNLeftNumBoxSD">4</div>
					<div class="styLNDesc" style="height:auto;">
						Deductions directly connected with the production of income shown on line 3 (attach statement)
						<xsl:call-template name="SetFormLinkInline">
							<xsl:with-param name="TargetNode" select="$FormData/DedIncomeForeclosurePropAmt"/>
						</xsl:call-template>
						<span class="sty1120REITDotLn">...</span>
					</div>
					<div class="styLNRightNumBox" style="height:4.4mm;">4</div>
					<div class="styLNAmountBox" style="height:4.4mm;">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/DedIncomeForeclosurePropAmt"/>
						</xsl:call-template>
					</div>
				</div>
				<!-- Part 2, Line 5 -->
				<div class="styStdDiv">
					<div class="styLNLeftNumBoxSD">5</div>
					<div class="styLNDesc" style="height:auto;">
						Net income from foreclosure property. Subtract line 4 from line 3
						<span class="sty1120REITDotLn">.............</span>
					</div>
					<div class="styLNRightNumBox">5</div>
					<div class="styLNAmountBox">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/NetIncomeForeclosurePropAmt"/>
						</xsl:call-template>
					</div>
				</div>
				<!-- Part 2, Line 6 -->
				<div class="styStdDiv">
					<div class="styLNLeftNumBoxSD">6</div>
					<div class="styLNDesc" style="height:auto;">
						<strong>Tax on net income from foreclosure property. </strong>
						Multiply line 5 by 21% (0.21). Enter here and on <br /> Schedule J, line 1b
						<span class="sty1120REITDotLn">...........................</span>
					</div>
					<div class="styLNRightNumBoxNBB" style="height:7.2mm;"><br />6</div>
					<div class="styLNAmountBoxNBB" style="height:7.2mm;"><br />
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/NetIncomeForeclosurePropTaxAmt"/>
						</xsl:call-template>
					</div>
				</div>
				<div class="styStdDiv" style="padding:1px;font-size:8pt;border-top:1px solid black;border-bottom:1px solid black;">
					<strong>Part III&mdash;Tax for Failure To Meet Certain Source-of-Income Requirements</strong> 
					(Section 857(b)(5)) (see instructions)
				</div>
				<!-- Part 3, Line 1a -->
				<div class="styStdDiv">
					<div class="styLNLeftNumBoxSD">1a</div>
					<div class="styLNDesc" style="width:98mm;">
						Enter total income from Part I, line 8
						<span class="sty1120REITDotLn">............</span>
					</div>
					<div class="styLNRightNumBox">1a</div>
					<div class="styLNAmountBox" style="padding-right:0.5mm;">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/TotalIncomeAmt"/>
						</xsl:call-template>
					</div>
					<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;">&nbsp;</div>
					<div class="styLNAmountBoxNBB" style="">&nbsp;</div>
				</div>
				<!-- Part 3, Line 1b -->
				<div class="styStdDiv">
					<div class="styLNLeftNumBox" style="padding-left:4.2mm;">b</div>
					<div class="styLNDesc" style="width:98mm;">
						Enter total income from foreclosure property from Part II, line 3
						<span class="sty1120REITDotLn">....</span>
					</div>
					<div class="styLNRightNumBox">1b</div>
					<div class="styLNAmountBox" style="padding-right:0.5mm;">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/TotalIncomeForeclosurePropAmt"/>
						</xsl:call-template>
					</div>
					<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;">&nbsp;</div>
					<div class="styLNAmountBoxNBB" style="">&nbsp;</div>
				</div>
				<!-- Part 3, Line 1c -->
				<div class="styStdDiv">
					<div class="styLNLeftNumBox" style="padding-left:4.2mm;">c</div>
					<div class="styLNDesc">
						Total. Add lines 1a and 1b
						<span class="sty1120REITDotLn">.........................</span>
					</div>
					<div class="styLNRightNumBox">26</div>
					<div class="styLNAmountBox">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/TotalTaxableIncomeAmt"/>
						</xsl:call-template>
					</div>
				</div>
				<!-- Part 3, Line 2a -->
				<div class="styStdDiv">
					<div class="styLNLeftNumBoxSD">2a</div>
					<div class="styLNDesc" style="width:98mm;">
						Enter income from hedging transactions referred to in section 856(c)(5)(G)
						<!--<span class="sty1120REITDotLn">.</span>-->
					</div>
					<div class="styLNRightNumBox">2a</div>
					<div class="styLNAmountBox" style="padding-right:0.5mm;">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/HedgingTransactionIncomeAmt"/>
						</xsl:call-template>
					</div>
					<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;">&nbsp;</div>
					<div class="styLNAmountBoxNBB" style="">&nbsp;</div>
				</div>
				<!-- Part 3, Line 2b -->
				<div class="styStdDiv">
					<div class="styLNLeftNumBox" style="padding-left:4.2mm;">b</div>
					<div class="styLNDesc" style="width:98mm;height:auto;">
						Enter income from passive foreign exchange gain referred to in section <br />856(n)(3). See instructions
						<span class="sty1120REITDotLn">...............</span>
					</div>
					<div class="styLNRightNumBox" style="height:7.2mm;"><br />2b</div>
					<div class="styLNAmountBox" style="padding-right:0.5mm;height:7.2mm;"><br />
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/PassiveForiegnExchangeGainAmt"/>
						</xsl:call-template>
					</div>
					<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;height:7.2mm;">&nbsp;</div>
					<div class="styLNAmountBoxNBB" style="height:7.2mm;">&nbsp;</div>
				</div>
				<!-- Part 3, Line 2c -->
				<div class="styStdDiv">
					<div class="styLNLeftNumBox" style="padding-left:4.2mm;">c</div>
					<div class="styLNDesc" style="width:98mm;font-family:Arial;">
						Enter income from sources referred to in section 856(c)(5)(J)(i). See instructions
						<span class="sty1120REITDotLn" style="font-family:Verdana;">..</span>
					</div>
					<div class="styLNRightNumBox">2c</div>
					<div class="styLNAmountBox" style="padding-right:0.5mm;">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/Section856c5JiIncomeAmt"/>
						</xsl:call-template>
					</div>
					<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;">&nbsp;</div>
					<div class="styLNAmountBoxNBB" style="">&nbsp;</div>
				</div>
				<!-- Part 3, Line 2d -->
				<div class="styStdDiv">
					<div class="styLNLeftNumBox" style="padding-left:4.2mm;">d</div>
					<div class="styLNDesc" style="width:98mm;">
						Enter the net section 965(a) inclusion reported in Part I. See instructions
						<span class="sty1120REITDotLn">.</span>
					</div>
					<div class="styLNRightNumBox">2d</div>
					<div class="styLNAmountBox" style="padding-right:0.5mm;">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/Net965aInclusionAmt"/>
						</xsl:call-template>
					</div>
					<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;">&nbsp;</div>
					<div class="styLNAmountBoxNBB" style="">&nbsp;</div>
				</div>
				<!-- Part 3, Line 2e -->
				<div class="styStdDiv">
					<div class="styLNLeftNumBox" style="padding-left:4.2mm;">e</div>
					<div class="styLNDesc" style="width:98mm;">
						Subtract lines 2a, 2b, 2c, and 2d from line 1c
						<span class="sty1120REITDotLn">.........</span>
					</div>
					<div class="styLNRightNumBox">2e</div>
					<div class="styLNAmountBox" style="padding-right:0.5mm;">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/PassiveGainTaxAmt"/>
						</xsl:call-template>
					</div>
					<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;">&nbsp;</div>
					<div class="styLNAmountBoxNBB" style="">&nbsp;</div>
				</div>
				<!-- Part 3, Line 2f -->
				<div class="styStdDiv">
					<div class="styLNLeftNumBox" style="padding-left:4.2mm;">f</div>
					<div class="styLNDesc">
						Multiply line 2e by 95% (0.95)
						<span class="sty1120REITDotLn">........................</span>
					</div>
					<div class="styLNRightNumBox">2f</div>
					<div class="styLNAmountBox">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/CalcPassiveGainTaxAmt"/>
						</xsl:call-template>
					</div>
				</div>
				<!-- Part 3, Line 3 -->
				<div class="styStdDiv">
					<div class="styLNLeftNumBoxSD">3</div>
					<div class="styLNDesc">
						Enter income on line 1c from sources referred to in section 856(c)(2)
						<span class="sty1120REITDotLn">............</span>
					</div>
					<div class="styLNRightNumBox">3</div>
					<div class="styLNAmountBox">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/Section856c2IncomeAmt"/>
						</xsl:call-template>
					</div>
				</div>
				<!-- Part 3, Line 4 -->
				<div class="styStdDiv">
					<div class="styLNLeftNumBoxSD">4</div>
					<div class="styLNDesc">
						Subtract line 3 from line 2f. (If zero or less, enter -0-.)
						<span class="sty1120REITDotLn">................</span>
					</div>
					<div class="styLNRightNumBox">4</div>
					<div class="styLNAmountBox">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/LessSection856c2IncomeAmt"/>
						</xsl:call-template>
					</div>
				</div>
				<!-- Part 3, Line 5a -->
				<div class="styStdDiv">
					<div class="styLNLeftNumBoxSD">5a</div>
					<div class="styLNDesc" style="width:98mm;">
						Enter income from hedging transactions referred to in section 856(c)(5)(G)
						<!--<span class="sty1120REITDotLn">.</span>-->
					</div>
					<div class="styLNRightNumBox">5a</div>
					<div class="styLNAmountBox" style="padding-right:0.5mm;">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/HedgingTransactionIncomeAmt"/>
						</xsl:call-template>
					</div>
					<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;">&nbsp;</div>
					<div class="styLNAmountBoxNBB" style="">&nbsp;</div>
				</div>
				<!-- Part 3, Line 5b -->
				<div class="styStdDiv">
					<div class="styLNLeftNumBox" style="padding-left:4.2mm;">b</div>
					<div class="styLNDesc" style="width:98mm;height:auto;">
						Enter income from real estate foreign exchange gain referred to in section <br />856(n)(2). See instructions
						<span class="sty1120REITDotLn">...............</span>
					</div>
					<div class="styLNRightNumBox" style="height:7.2mm;"><br />5b</div>
					<div class="styLNAmountBox" style="padding-right:0.5mm;height:7.2mm;"><br />
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/ForeignRealEstateGainAmt"/>
						</xsl:call-template>
					</div>
					<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;height:7.2mm;">&nbsp;</div>
					<div class="styLNAmountBoxNBB" style="height:7.2mm;">&nbsp;</div>
				</div>
				<!-- Part 3, Line 5c -->
				<div class="styStdDiv">
					<div class="styLNLeftNumBox" style="padding-left:4.2mm;">c</div>
					<div class="styLNDesc" style="width:98mm;font-family:Arial;">
						Enter income from sources referred to in section 856(c)(5)(J)(i). See instructions
						<span class="sty1120REITDotLn" style="font-family:Verdana;">..</span>
					</div>
					<div class="styLNRightNumBox">5c</div>
					<div class="styLNAmountBox" style="padding-right:0.5mm;">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/Section856c5JiIncomeAmt"/>
						</xsl:call-template>
					</div>
					<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;">&nbsp;</div>
					<div class="styLNAmountBoxNBB" style="">&nbsp;</div>
				</div>
				<!-- Part 3, Line 5d -->
				<div class="styStdDiv">
					<div class="styLNLeftNumBox" style="padding-left:4.2mm;">d</div>
					<div class="styLNDesc" style="width:98mm;">
						Enter the net section 965(a) inclusion reported in Part I. See instructions
						<span class="sty1120REITDotLn">.</span>
					</div>
					<div class="styLNRightNumBox">5d</div>
					<div class="styLNAmountBox" style="padding-right:0.5mm;">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/Net965aInclusionAmt"/>
						</xsl:call-template>
					</div>
					<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;">&nbsp;</div>
					<div class="styLNAmountBoxNBB" style="">&nbsp;</div>
				</div>
				<!-- Part 3, Line 5e -->
				<div class="styStdDiv">
					<div class="styLNLeftNumBox" style="padding-left:4.2mm;">e</div>
					<div class="styLNDesc" style="width:98mm;">
						Subtract lines 5a, 5b, 5c, and 5d from line 1c
						<span class="sty1120REITDotLn">.........</span>
					</div>
					<div class="styLNRightNumBox">5e</div>
					<div class="styLNAmountBox" style="padding-right:0.5mm;">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/LessHedgeRealEstSrcIncmAmt"/>
						</xsl:call-template>
					</div>
					<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;">&nbsp;</div>
					<div class="styLNAmountBoxNBB" style="">&nbsp;</div>
				</div>
				<!-- Part 3, Line 5f -->
				<div class="styStdDiv">
					<div class="styLNLeftNumBox" style="padding-left:4.2mm;">f</div>
					<div class="styLNDesc">
						Multiply line 5e by 75% (0.75)
						<span class="sty1120REITDotLn">........................</span>
					</div>
					<div class="styLNRightNumBox">5f</div>
					<div class="styLNAmountBox">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/CalcHedgeRealEstSrcIncmAmt"/>
						</xsl:call-template>
					</div>
				</div>
				<!-- Part 3, Line 6 -->
				<div class="styStdDiv">
					<div class="styLNLeftNumBoxSD">6</div>
					<div class="styLNDesc">
						Enter income on line 1c from sources referred to in section 856(c)(3)
						<span class="sty1120REITDotLn">............</span>
					</div>
					<div class="styLNRightNumBox">6</div>
					<div class="styLNAmountBox">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/Section856c3IncomeAmt"/>
						</xsl:call-template>
					</div>
				</div>
				<!-- Part 3, Line 7 -->
				<div class="styStdDiv">
					<div class="styLNLeftNumBoxSD">7</div>
					<div class="styLNDesc">
						Subtract line 6 from line 5f. (If zero or less, enter -0-.)
						<span class="sty1120REITDotLn">................</span>
					</div>
					<div class="styLNRightNumBox">7</div>
					<div class="styLNAmountBox">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/LessSection856c3IncomeAmt"/>
						</xsl:call-template>
					</div>
				</div>
				<!-- Part 3, Line 8 -->
				<div class="styStdDiv">
					<div class="styLNLeftNumBoxSD">8</div>
					<div class="styLNDesc">
						Enter the greater of line 4 or line 7.
						<strong>(If line 8 is zero, do not complete the rest of Part III.)</strong>
						<span class="sty1120REITDotLn">...</span>
					</div>
					<div class="styLNRightNumBox">8</div>
					<div class="styLNAmountBox">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/TotalHedgingTransactionsAmt"/>
						</xsl:call-template>
					</div>
				</div>
				<!-- Part 3, Line 9 -->
				<div class="styStdDiv">
					<div class="styLNLeftNumBoxSD">9</div>
					<div class="styLNDesc">
						Enter the amount from Part I, line 21
						<span class="sty1120REITDotLn">......................</span>
					</div>
					<div class="styLNRightNumBox">9</div>
					<div class="styLNAmountBox">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/TaxableIncomeBfrNOLSpclDedAmt"/>
						</xsl:call-template>
					</div>
				</div>
				<!-- Part 3, Line 10 -->
				<div class="styStdDiv">
					<div class="styLNLeftNumBox">10</div>
					<div class="styLNDesc">
						Enter the net capital gain from Schedule D (Form 1120), line 17
						<span class="sty1120REITDotLn">..............</span>
					</div>
					<div class="styLNRightNumBox">10</div>
					<div class="styLNAmountBox">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/NetCapitalGainAmt"/>
						</xsl:call-template>
					</div>
				</div>
				<!-- Part 3, Line 11 -->
				<div class="styStdDiv">
					<div class="styLNLeftNumBox">11</div>
					<div class="styLNDesc">
						Subtract line 10 from line 9
						<span class="sty1120REITDotLn">.........................</span>
					</div>
					<div class="styLNRightNumBox">11</div>
					<div class="styLNAmountBox">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/TaxableIncomeAmt"/>
						</xsl:call-template>
					</div>
				</div>
				<!-- Part 3, Line 12a -->
				<div class="styStdDiv">
					<div class="styLNLeftNumBox">12a</div>
					<div class="styLNDesc" style="width:98mm;">
						Enter total income from Part I, line 8
						<span class="sty1120REITDotLn">............</span>
					</div>
					<div class="styLNRightNumBox">12a</div>
					<div class="styLNAmountBox" style="padding-right:0.5mm;">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/TotalIncomeAmt"/>
						</xsl:call-template>
					</div>
					<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;">&nbsp;</div>
					<div class="styLNAmountBoxNBB" style="">&nbsp;</div>
				</div>
				<!-- Part 3, Line 12b -->
				<div class="styStdDiv">
					<div class="styLNLeftNumBox" style="padding-left:4.2mm;">b</div>
					<div class="styLNDesc" style="width:98mm;height:auto;">
						Enter the net short-term capital gain from Schedule D (Form 1120), line 7. <br />
						(If line 7 is a loss, enter -0-.)
						<span class="sty1120REITDotLn">..............</span>
					</div>
					<div class="styLNRightNumBox" style="height:7.2mm;"><br />12b</div>
					<div class="styLNAmountBox" style="padding-right:0.5mm;height:7.2mm;"><br />
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/NetSTCapitalGainOrLossAmt"/>
						</xsl:call-template>
					</div>
					<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;height:7.2mm;">&nbsp;</div>
					<div class="styLNAmountBoxNBB" style="height:7.2mm;">&nbsp;</div>
				</div>
				<!-- Part 3, Line 12c -->
				<div class="styStdDiv">
					<div class="styLNLeftNumBox" style="padding-left:4.2mm;">c</div>
					<div class="styLNDesc">
						Add lines 12a and 12b
						<span class="sty1120REITDotLn">..........................</span>
					</div>
					<div class="styLNRightNumBox">12c</div>
					<div class="styLNAmountBox">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/CapitalGainAmt"/>
						</xsl:call-template>
					</div>
				</div>
				<!-- Part 3, Line 13 -->
				<div class="styStdDiv">
					<div class="styLNLeftNumBox">13</div>
					<div class="styLNDesc">
						Enter capital gain net income from Part I, line 5
						<span class="sty1120REITDotLn">...................</span>
					</div>
					<div class="styLNRightNumBox">13</div>
					<div class="styLNAmountBox">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/CapitalGainNetIncomeAmt"/>
						</xsl:call-template>
					</div>
				</div>
				<!-- Part 3, Line 14 -->
				<div class="styStdDiv">
					<div class="styLNLeftNumBox">14</div>
					<div class="styLNDesc">
						Subtract line 13 from line 12c
						<span class="sty1120REITDotLn">........................</span>
					</div>
					<div class="styLNRightNumBox">14</div>
					<div class="styLNAmountBox">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/TotalCapitalGainAmt"/>
						</xsl:call-template>
					</div>
				</div>
				<!-- Part 3, Line 15 -->
				<div class="styStdDiv">
					<div class="styLNLeftNumBox">15</div>
					<div class="styLNDesc">
						Divide line 11 by line 14. Carry the result to five decimal places
						<span class="sty1120REITDotLn">..............</span>
					</div>
					<div class="styLNRightNumBox">15</div>
					<div class="styLNAmountBox">
						<xsl:call-template name="PopulateText">
							<xsl:with-param name="TargetNode" select="$FormData/CapitalGainPct"/>
						</xsl:call-template>
					</div>
				</div>
				<!-- Part 3, Line 16 -->
				<div class="styStdDiv">
					<div class="styLNLeftNumBox">16</div>
					<div class="styLNDesc">
						<strong>Section 857(b)(5) tax. </strong>
						Multiply line 8 by line 15. Enter here and on Schedule J, line 1c
						<xsl:call-template name="SetFormLinkInline">
							<xsl:with-param name="TargetNode" select="$FormData/Section857b5TaxAmt"/>
						</xsl:call-template>
						<span class="sty1120REITDotLn">.....</span>
					</div>
					<div class="styLNRightNumBoxNBB">16</div>
					<div class="styLNAmountBoxNBB">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/Section857b5TaxAmt"/>
						</xsl:call-template>
					</div>
				</div>
				<div class="pageEnd" style="width:187mm;border-top:1px solid black;">
					<span style="float:right;">
						Form <span class="styBoldText" style="font-size:8pt;">1120-REIT</span> (2025)
					</span>
				</div>
				<div class="styStdDiv">
					Form 1120-REIT (2025)
					<div style="float:right;">
						Page <span style="font-weight:bold;font-size:8pt;">3</span>
					</div>
				</div>
				<div class="styStdDiv" style="text-align:center;padding:1px;font-size:8pt;border-top:1px solid black;border-bottom:1px solid black;">
					<strong>Part IV&mdash;Tax on Net Income From Prohibited Transactions</strong> (see instructions)
				</div>
				<!-- Part 4, Line 1 -->
				<div class="styStdDiv">
					<div class="styLNLeftNumBoxSD">1</div>
					<div class="styLNDesc" style="height:auto;">
						Gain from sale or other disposition of section 1221(a)(1) property (other than foreclosure property)
						<span class="sty1120REITDotLn">..</span>
					</div>
					<div class="styLNRightNumBox">1</div>
					<div class="styLNAmountBox">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/SaleDisposGn1221a1PropAmt"/>
						</xsl:call-template>
					</div>
				</div>
				<!-- Part 4, Line 2 -->
				<div class="styStdDiv">
					<div class="styLNLeftNumBoxSD">2</div>
					<div class="styLNDesc" style="height:auto;">
						Deductions directly connected with the production of income shown on line 1
						<span class="sty1120REITDotLn">..........</span>
					</div>
					<div class="styLNRightNumBox">2</div>
					<div class="styLNAmountBox">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/SaleDisposGn1221a1PropDedAmt"/>
						</xsl:call-template>
					</div>
				</div>
				<!-- Part 4, Line 3 -->
				<div class="styStdDiv">
					<div class="styLNLeftNumBoxSD">3</div>
					<div class="styLNDesc" style="height:auto;">
						<strong>Tax on net income from prohibited transactions. </strong>
						Subtract line 2 from line 1. Enter here and on <br /> Schedule J, line 1d
						<span class="sty1120REITDotLn">...........................</span>
					</div>
					<div class="styLNRightNumBoxNBB" style="height:7.2mm;"><br />3</div>
					<div class="styLNAmountBoxNBB" style="height:7.2mm;"><br />
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/NetIncomeProhibitedTransTaxAmt"/>
						</xsl:call-template>
					</div>
				</div>
				<div class="styStdDiv" style="font-size:8pt;border-top:1px solid black;border-bottom:1px solid black;">
					<div class="styPartName" style="width:22mm;">Schedule A</div> 
					<div class="styPartDesc" style="width:160mm;">
						Deduction for Dividends Paid
						<span style="font-weight:normal;">(see instructions)</span>
					</div>
				</div>
				<!-- Schedule A, Line 1 -->
				<div class="styStdDiv">
					<div class="styLNLeftNumBoxSD">1</div>
					<div class="styLNDesc" style="height:auto;">
						Dividends paid (other than dividends paid after the end of the tax year). Do not include dividends <br />
						considered paid in the preceding tax year under section 857(b)(9) or 858(a), or deficiency dividends <br />
						as defined in section 860
						<span class="sty1120REITDotLn">..........................</span>
					</div>
					<div class="styLNRightNumBox" style="height:10.2mm;"><br /><br />1</div>
					<div class="styLNAmountBox" style="height:10.2mm;"><br /><br />
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/DividendsPaidAmt"/>
						</xsl:call-template>
					</div>
				</div>
				<!-- Schedule A, Line 2 -->
				<div class="styStdDiv">
					<div class="styLNLeftNumBoxSD">2</div>
					<div class="styLNDesc" style="height:auto;">
						Dividends paid in the 12-month period following the close of the tax year under a section 858(a) <br /> election to treat the dividends as paid during the tax year
						<span class="sty1120REITDotLn">...............</span>
					</div>
					<div class="styLNRightNumBox" style="height:7.2mm;"><br />2</div>
					<div class="styLNAmountBox" style="height:7.2mm;"><br />
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/DividendsPaidUnderSect858aAmt"/>
						</xsl:call-template>
					</div>
				</div>
				<!-- Schedule A, Line 3 -->
				<div class="styStdDiv">
					<div class="styLNLeftNumBoxSD">3</div>
					<div class="styLNDesc" style="height:auto;">
						Dividends declared in October, November, or December deemed paid on December 31 under <br /> section 857(b)(9)
						<span class="sty1120REITDotLn">............................</span>
					</div>
					<div class="styLNRightNumBox" style="height:7.2mm;"><br />3</div>
					<div class="styLNAmountBox" style="height:7.2mm;"><br />
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/DividendsPaidUnderSect857b9Amt"/>
						</xsl:call-template>
					</div>
				</div>
				<!-- Schedule A, Line 4 -->
				<div class="styStdDiv">
					<div class="styLNLeftNumBoxSD">4</div>
					<div class="styLNDesc">
						Consent dividends (attach Forms 972 and 973) 
						<xsl:call-template name="SetFormLinkInline">
							<xsl:with-param name="TargetNode" select="$FormData/ConsentDividendsAmt"/>
						</xsl:call-template>
						<span class="sty1120REITDotLn">..................</span>
					</div>
					<div class="styLNRightNumBox">4</div>
					<div class="styLNAmountBox">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/ConsentDividendsAmt"/>
						</xsl:call-template>
					</div>
				</div>
				<!-- Schedule A, Line 5 -->
				<div class="styStdDiv">
					<div class="styLNLeftNumBoxSD">5</div>
					<div class="styLNDesc">
						Deficiency dividends (section 860) (attach Form 976)
						<xsl:call-template name="SetFormLinkInline">
							<xsl:with-param name="TargetNode" select="$FormData/DeficiencyDivDeductionAmt"/>
						</xsl:call-template>
						<span class="sty1120REITDotLn">................</span>
					</div>
					<div class="styLNRightNumBox">5</div>
					<div class="styLNAmountBox">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/DeficiencyDivDeductionAmt"/>
						</xsl:call-template>
					</div>
				</div>
				<!-- Schedule A, Line 6 -->
				<div class="styStdDiv">
					<div class="styLNLeftNumBoxSD">6</div>
					<div class="styLNDesc">
						Total dividends paid. Add lines 1 through 5
						<span class="sty1120REITDotLn">....................</span>
					</div>
					<div class="styLNRightNumBox">6</div>
					<div class="styLNAmountBox">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/TotalDividendsPaidAmt"/>
						</xsl:call-template>
					</div>
				</div>
				<!-- Schedule A, Line 7 -->
				<div class="styStdDiv">
					<div class="styLNLeftNumBoxSD">7</div>
					<div class="styLNDesc" style="height:auto;">
						<strong>Total deduction for dividends paid. </strong> 
						If there is net income from foreclosure property on Part II, line 
						5, see instructions for limitation on the deduction for dividends paid. Otherwise, enter the total 
						dividends paid from line 6 here and on page 1, line 22b
						<span class="sty1120REITDotLn">......................</span>
					</div>
					<div class="styLNRightNumBoxNBB" style="height:10.2mm;"><br /><br />7</div>
					<div class="styLNAmountBoxNBB" style="height:10.2mm;"><br /><br />
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/TotalDeductionDividendsPaidAmt"/>
						</xsl:call-template>
					</div>
				</div>
				<div class="styStdDiv" style="font-size:8pt;border-top:1px solid black;border-bottom:1px solid black;">
					<div class="styPartName" style="width:22mm;">Schedule J</div> 
					<div class="styPartDesc" style="width:160mm;">
						Tax Computation
						<span style="font-weight:normal;">(see instructions)</span>
					</div>
				</div>
				<!-- Schedule J, Line 1a -->
				<div class="styStdDiv">
					<div class="styLNLeftNumBoxSD">1a</div>
					<div class="styLNDesc" style="width:98mm;">
						Tax on REIT taxable income
						<span class="sty1120REITDotLn">...............</span>
					</div>
					<div class="styLNRightNumBox">1a</div>
					<div class="styLNAmountBox" style="padding-right:0.5mm;">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/REITTaxableIncomeTaxAmt"/>
						</xsl:call-template>
					</div>
					<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;">&nbsp;</div>
					<div class="styLNAmountBoxNBB" style="">&nbsp;</div>
				</div>
				<!-- Schedule J, Line 1b -->
				<div class="styStdDiv">
					<div class="styLNLeftNumBoxSD" style="padding-left:4.2mm;">b</div>
					<div class="styLNDesc" style="width:98mm;">
						Tax from Part II, line 6
						<span class="sty1120REITDotLn">................</span>
					</div>
					<div class="styLNRightNumBox">1b</div>
					<div class="styLNAmountBox" style="padding-right:0.5mm;">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/NetIncomeForeclosurePropTaxAmt"/>
						</xsl:call-template>
					</div>
					<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;">&nbsp;</div>
					<div class="styLNAmountBoxNBB" style="">&nbsp;</div>
				</div>
				<!-- Schedule J, Line 1c -->
				<div class="styStdDiv">
					<div class="styLNLeftNumBoxSD" style="padding-left:4.2mm;">c</div>
					<div class="styLNDesc" style="width:98mm;">
						Tax from Part III, line 16
						<span class="sty1120REITDotLn">................</span>
					</div>
					<div class="styLNRightNumBox">1c</div>
					<div class="styLNAmountBox" style="padding-right:0.5mm;">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/Section857b5TaxAmt"/>
						</xsl:call-template>
					</div>
					<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;">&nbsp;</div>
					<div class="styLNAmountBoxNBB" style="">&nbsp;</div>
				</div>
				<!-- Schedule J, Line 1d -->
				<div class="styStdDiv">
					<div class="styLNLeftNumBoxSD" style="padding-left:4.2mm;">d</div>
					<div class="styLNDesc" style="width:98mm;">
						Tax from Part IV, line 3
						<span class="sty1120REITDotLn">................</span>
					</div>
					<div class="styLNRightNumBox">1d</div>
					<div class="styLNAmountBox" style="padding-right:0.5mm;">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/NetIncomeProhibitedTransTaxAmt"/>
						</xsl:call-template>
					</div>
					<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;">&nbsp;</div>
					<div class="styLNAmountBoxNBB" style="">&nbsp;</div>
				</div>
				<!-- Schedule J, Line 1e -->
				<div class="styStdDiv">
					<div class="styLNLeftNumBoxSD" style="padding-left:4.2mm;">e</div>
					<div class="styLNDesc" style="width:98mm;">
						Tax imposed under section 857(b)(7)(A) (see instructions)
						<span class="sty1120REITDotLn">......</span>
					</div>
					<div class="styLNRightNumBox">1e</div>
					<div class="styLNAmountBox" style="padding-right:0.5mm;">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/TaxImposedSect857b7AAmt"/>
						</xsl:call-template>
					</div>
					<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;">&nbsp;</div>
					<div class="styLNAmountBoxNBB" style="">&nbsp;</div>
				</div>
				<!-- Schedule J, Line 1f -->
				<div class="styStdDiv">
					<div class="styLNLeftNumBoxSD" style="padding-left:4.2mm;">f</div>
					<div class="styLNDesc" style="width:98mm;">
						Tax imposed under section 856(c)(7)
						<xsl:call-template name="SetFormLinkInline">
							<xsl:with-param name="TargetNode" select="$FormData/TaxImposedSect856c7Amt"/>
						</xsl:call-template>
						<span class="sty1120REITDotLn">...........</span>
					</div>
					<div class="styLNRightNumBox">1f</div>
					<div class="styLNAmountBox" style="padding-right:0.5mm;">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/TaxImposedSect856c7Amt"/>
						</xsl:call-template>
					</div>
					<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;">&nbsp;</div>
					<div class="styLNAmountBoxNBB" style="">&nbsp;</div>
				</div>
				<!-- Schedule J, Line 1g -->
				<div class="styStdDiv">
					<div class="styLNLeftNumBoxSD" style="padding-left:4.2mm;">g</div>
					<div class="styLNDesc" style="width:98mm;">
						Tax imposed under section 856(g)(5)
						<xsl:call-template name="SetFormLinkInline">
							<xsl:with-param name="TargetNode" select="$FormData/TaxImposedSect856g5Amt"/>
						</xsl:call-template>
						<span class="sty1120REITDotLn">...........</span>
					</div>
					<div class="styLNRightNumBox">1g</div>
					<div class="styLNAmountBox" style="padding-right:0.5mm;">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/TaxImposedSect856g5Amt"/>
						</xsl:call-template>
					</div>
					<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;">&nbsp;</div>
					<div class="styLNAmountBoxNBB" style="">&nbsp;</div>
				</div>
				<!-- Schedule J, Line 1h -->
				<div class="styStdDiv">
					<div class="styLNLeftNumBoxSD" style="padding-left:4.2mm;">h</div>
					<div class="styLNDesc" style="width:98mm;">
						Section 1291 tax from Form 8621
						<span class="sty1120REITDotLn">.............</span>
					</div>
					<div class="styLNRightNumBox">1h</div>
					<div class="styLNAmountBox" style="padding-right:0.5mm;">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/Section1291Amt"/>
						</xsl:call-template>
					</div>
					<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;">&nbsp;</div>
					<div class="styLNAmountBoxNBB" style="">&nbsp;</div>
				</div>
				<!-- Schedule J, Line 1i -->
				<div class="styStdDiv">
					<div class="styLNLeftNumBoxSD" style="padding-left:4.2mm;">i</div>
					<div class="styLNDesc" style="width:98mm;">
						Additional tax under section 197(f)
						<span class="sty1120REITDotLn">............</span>
					</div>
					<div class="styLNRightNumBox">1i</div>
					<div class="styLNAmountBox" style="padding-right:0.5mm;">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/Section197Amt"/>
						</xsl:call-template>
					</div>
					<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;">&nbsp;</div>
					<div class="styLNAmountBoxNBB" style="">&nbsp;</div>
				</div>
				<!-- Schedule J, Line 1j -->
				<div class="styStdDiv">
					<div class="styLNLeftNumBoxSD" style="padding-left:4.2mm;">j</div>
					<div class="styLNDesc" style="width:98mm;">
						Tax adjustment from Form 8978
						<xsl:call-template name="SetFormLinkInline">
							<xsl:with-param name="TargetNode" select="$FormData/Form8978Amt"/>
						</xsl:call-template>
						<span class="sty1120REITDotLn">............</span>
					</div>
					<div class="styLNRightNumBox">1j</div>
					<div class="styLNAmountBox" style="padding-right:0.5mm;">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/Form8978Amt"/>
						</xsl:call-template>
					</div>
					<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;">&nbsp;</div>
					<div class="styLNAmountBoxNBB" style="">&nbsp;</div>
				</div>
				<!-- Schedule J, Line 1k -->
				<div class="styStdDiv">
					<div class="styLNLeftNumBoxSD" style="padding-left:4.2mm;">k</div>
					<div class="styLNDesc" style="width:98mm;">
						Amount from Form 4255, Part l, line 3, column (q)
						<xsl:call-template name="SetFormLinkInline">
							<xsl:with-param name="TargetNode" select="$FormData/TotalChapter1TaxAmt"/>
						</xsl:call-template>
						<span class="sty1120REITDotLn">.......</span>
					</div>
					<div class="styLNRightNumBox">1k</div>
					<div class="styLNAmountBox" style="padding-right:0.5mm;">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/TotalChapter1TaxAmt"/>
						</xsl:call-template>
					</div>
					<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;">&nbsp;</div>
					<div class="styLNAmountBoxNBB" style="">&nbsp;</div>
				</div>
				<!-- Schedule J, Line 1z -->
				<div class="styStdDiv">
					<div class="styLNLeftNumBoxSD" style="padding-left:4.2mm;">z</div>
					<div class="styLNDesc" style="width:98mm;">
						Other chapter 1 tax
						<span class="sty1120REITDotLn">................</span>
					</div>
					<div class="styLNRightNumBox">1z</div>
					<div class="styLNAmountBox" style="padding-right:0.5mm;">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/OtherChapter1TaxAmt"/>
						</xsl:call-template>
					</div>
					<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;">&nbsp;</div>
					<div class="styLNAmountBoxNBB" style="">&nbsp;</div>
				</div>
				<!-- Schedule J, Line 2 -->
				<div class="styStdDiv">
					<div class="styLNLeftNumBoxSD">2</div>
					<div class="styLNDesc">
						<strong>Income tax. </strong> Add lines 1a through 1z
						<span class="sty1120REITDotLn">......................</span>
					</div>
					<div class="styLNRightNumBox">2</div>
					<div class="styLNAmountBox">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/IncomeTaxAmt"/>
						</xsl:call-template>
					</div>
				</div>
				<!-- Schedule J, Line 3a -->
				<div class="styStdDiv">
					<div class="styLNLeftNumBoxSD">3a</div>
					<div class="styLNDesc" style="width:98mm;">
						Foreign tax credit (attach Form 1118)
						<xsl:call-template name="SetFormLinkInline">
							<xsl:with-param name="TargetNode" select="$FormData/ForeignTaxCreditAmt"/>
						</xsl:call-template>
						<span class="sty1120REITDotLn">...........</span>
					</div>
					<div class="styLNRightNumBox">3a</div>
					<div class="styLNAmountBox" style="padding-right:0.5mm;">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/ForeignTaxCreditAmt"/>
						</xsl:call-template>
					</div>
					<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;">&nbsp;</div>
					<div class="styLNAmountBoxNBB" style="">&nbsp;</div>
				</div>
				<!-- Schedule J, Line 3b -->
				<div class="styStdDiv">
					<div class="styLNLeftNumBoxSD" style="padding-left:4.2mm;">b</div>
					<div class="styLNDesc" style="width:98mm;">
						Credit from Form 8834 (see instructions)
						<xsl:call-template name="SetFormLinkInline">
							<xsl:with-param name="TargetNode" select="$FormData/QlfyElecMotorVehCrAmt"/>
						</xsl:call-template>
						<span class="sty1120REITDotLn">..........</span>
					</div>
					<div class="styLNRightNumBox">3b</div>
					<div class="styLNAmountBox" style="padding-right:0.5mm;">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/QlfyElecMotorVehCrAmt"/>
						</xsl:call-template>
					</div>
					<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;">&nbsp;</div>
					<div class="styLNAmountBoxNBB" style="">&nbsp;</div>
				</div>
				<!-- Schedule J, Line 3c -->
				<div class="styStdDiv">
					<div class="styLNLeftNumBoxSD" style="padding-left:4.2mm;">c</div>
					<div class="styLNDesc" style="width:98mm;">
						General business credit (attach Form 3800)
						<xsl:call-template name="SetFormLinkInline">
							<xsl:with-param name="TargetNode" select="$FormData/CYGenBusinessCreditAllowedAmt"/>
						</xsl:call-template>
						<span class="sty1120REITDotLn">.........</span>
					</div>
					<div class="styLNRightNumBox">3c</div>
					<div class="styLNAmountBox" style="padding-right:0.5mm;">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/CYGenBusinessCreditAllowedAmt"/>
						</xsl:call-template>
					</div>
					<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;">&nbsp;</div>
					<div class="styLNAmountBoxNBB" style="">&nbsp;</div>
				</div>
				<!-- Schedule J, Line 3d -->
				<div class="styStdDiv">
					<div class="styLNLeftNumBoxSD" style="padding-left:4.2mm;">d</div>
					<div class="styLNDesc" style="width:98mm;">
						Adjustment from Form 8978
						<xsl:call-template name="SetFormLinkInline">
							<xsl:with-param name="TargetNode" select="$FormData/Form8978AdjustmentCrAmt"/>
						</xsl:call-template>
						<span class="sty1120REITDotLn">..............</span>
					</div>
					<div class="styLNRightNumBox">3d</div>
					<div class="styLNAmountBox" style="padding-right:0.5mm;">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/Form8978AdjustmentCrAmt"/>
						</xsl:call-template>
					</div>
					<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;">&nbsp;</div>
					<div class="styLNAmountBoxNBB" style="">&nbsp;</div>
				</div>
				<!-- Schedule J, Line 3z -->
				<div class="styStdDiv">
					<div class="styLNLeftNumBoxSD" style="padding-left:4.2mm;">z</div>
					<div class="styLNDesc" style="width:98mm;">
						Other credits (attach statement&mdash;see instructions)
						<xsl:call-template name="SetFormLinkInline">
							<xsl:with-param name="TargetNode" select="$FormData/OtherCreditsAmt"/>
						</xsl:call-template>
						<span class="sty1120REITDotLn">.......</span>
					</div>
					<div class="styLNRightNumBox">3z</div>
					<div class="styLNAmountBox" style="padding-right:0.5mm;">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/OtherCreditsAmt"/>
						</xsl:call-template>
					</div>
					<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;">&nbsp;</div>
					<div class="styLNAmountBoxNBB" style="">&nbsp;</div>
				</div>
				<!-- Schedule J, Line 4 -->
				<div class="styStdDiv">
					<div class="styLNLeftNumBoxSD">4</div>
					<div class="styLNDesc">
						<strong>Total credits. </strong> Add lines 3a through 3z
						<span class="sty1120REITDotLn">.....................</span>
					</div>
					<div class="styLNRightNumBox">4</div>
					<div class="styLNAmountBox">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/TotalCreditAmt"/>
						</xsl:call-template>
					</div>
				</div>
				<!-- Schedule J, Line 5 -->
				<div class="styStdDiv">
					<div class="styLNLeftNumBoxSD">5</div>
					<div class="styLNDesc">
						Subtract line 4 from line 2
						<span class="sty1120REITDotLn">.........................</span>
					</div>
					<div class="styLNRightNumBox">5</div>
					<div class="styLNAmountBox">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/TaxLessCreditsAmt"/>
						</xsl:call-template>
					</div>
				</div>
				<!-- Schedule J, Line 6a -->
				<div class="styStdDiv">
					<div class="styLNLeftNumBoxSD">6a</div>
					<div class="styLNDesc" style="width:98mm;">
						Personal holding company tax (attach Schedule PH (Form 1120))
						<xsl:call-template name="SetFormLinkInline">
							<xsl:with-param name="TargetNode" select="$FormData/PersonalHoldingCompanyTaxAmt"/>
						</xsl:call-template>
						<span class="sty1120REITDotLn">..</span>
					</div>
					<div class="styLNRightNumBox">6a</div>
					<div class="styLNAmountBox" style="padding-right:0.5mm;">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/PersonalHoldingCompanyTaxAmt"/>
						</xsl:call-template>
					</div>
					<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;">&nbsp;</div>
					<div class="styLNAmountBoxNBB" style="">&nbsp;</div>
				</div>
				<!-- Schedule J, Line 6b -->
				<div class="styStdDiv">
					<div class="styLNLeftNumBoxSD" style="padding-left:4.2mm;">b</div>
					<div class="styLNDesc" style="width:98mm;height:auto;">
						Interest on deferred tax liability for installment obligations under section 453A(c)
						<span class="sty1120REITDotLn">.....................</span>
					</div>
					<div class="styLNRightNumBox" style="height:7.2mm;"><br />6b</div>
					<div class="styLNAmountBox" style="height:7.2mm;padding-right:0.5mm;"><br />
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/InterestTaxDueSection453AcAmt"/>
						</xsl:call-template>
					</div>
					<div class="styLNRightNumBoxNBB" style="height:7.2mm;background-color:lightgrey;">&nbsp;</div>
					<div class="styLNAmountBoxNBB" style="height:7.2mm;">&nbsp;</div>
				</div>
				<!-- Schedule J, Line 6c -->
				<div class="styStdDiv">
					<div class="styLNLeftNumBoxSD" style="padding-left:4.2mm;">c</div>
					<div class="styLNDesc" style="width:98mm;height:auto;">
						Interest on deferred tax liability for installment obligations under section 453(l)(3)
						<span class="sty1120REITDotLn">.....................</span>
					</div>
					<div class="styLNRightNumBox" style="height:7.2mm;"><br />6c</div>
					<div class="styLNAmountBox" style="height:7.2mm;padding-right:0.5mm;"><br />
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/InterestTaxDueSection453IAmt"/>
						</xsl:call-template>
					</div>
					<div class="styLNRightNumBoxNBB" style="height:7.2mm;background-color:lightgrey;">&nbsp;</div>
					<div class="styLNAmountBoxNBB" style="height:7.2mm;">&nbsp;</div>
				</div>
				<!-- Schedule J, Line 6d -->
				<div class="styStdDiv">
					<div class="styLNLeftNumBoxSD" style="padding-left:4.2mm;">d</div>
					<div class="styLNDesc" style="width:98mm;">
						Amount from Form 4255, Part l, line 3, column (r)
						<xsl:call-template name="SetFormLinkInline">
							<xsl:with-param name="TargetNode" select="$FormData/TotalNonChapter1TaxAmt"/>
						</xsl:call-template>
						<span class="sty1120REITDotLn">.......</span>
					</div>
					<div class="styLNRightNumBox">6d</div>
					<div class="styLNAmountBox" style="padding-right:0.5mm;">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/TotalNonChapter1TaxAmt"/>
						</xsl:call-template>
					</div>
					<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;">&nbsp;</div>
					<div class="styLNAmountBoxNBB" style="">&nbsp;</div>
				</div>
				<!-- Schedule J, Line 6e -->
				<div class="styStdDiv">
					<div class="styLNLeftNumBoxSD" style="padding-left:4.2mm;">e</div>
					<div class="styLNDesc" style="width:98mm;">
						Recapture of low-income housing credit (attach Form 8611)
						<xsl:call-template name="SetFormLinkInline">
							<xsl:with-param name="TargetNode" select="$FormData/RecaptureTaxAmt"/>
						</xsl:call-template>
						<span class="sty1120REITDotLn">....</span>
					</div>
					<div class="styLNRightNumBox">6e</div>
					<div class="styLNAmountBox" style="padding-right:0.5mm;">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/RecaptureTaxAmt"/>
						</xsl:call-template>
					</div>
					<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;">&nbsp;</div>
					<div class="styLNAmountBoxNBB" style="">&nbsp;</div>
				</div>
				<!-- Schedule J, Line 6z -->
				<div class="styStdDiv">
					<div class="styLNLeftNumBoxSD" style="padding-left:4.2mm;">z</div>
					<div class="styLNDesc" style="width:98mm;">
						Other credits (attach statement&mdash;see instructions)
						<xsl:call-template name="SetFormLinkInline">
							<xsl:with-param name="TargetNode" select="$FormData/OtherTaxesAmt"/>
						</xsl:call-template>
						<span class="sty1120REITDotLn">.......</span>
					</div>
					<div class="styLNRightNumBox">6z</div>
					<div class="styLNAmountBox" style="padding-right:0.5mm;">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/OtherTaxesAmt"/>
						</xsl:call-template>
					</div>
					<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;">&nbsp;</div>
					<div class="styLNAmountBoxNBB" style="">&nbsp;</div>
				</div>
				<!-- Schedule J, Line 7 -->
				<div class="styStdDiv">
					<div class="styLNLeftNumBoxSD">7</div>
					<div class="styLNDesc">
						<strong>Total. </strong> Add lines 6a through 6z
						<span class="sty1120REITDotLn">........................</span>
					</div>
					<div class="styLNRightNumBox">7</div>
					<div class="styLNAmountBox">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/TotalOtherTaxesAndInterestAmt"/>
						</xsl:call-template>
					</div>
				</div>
				<!-- Schedule J, Line 8a -->
				<div class="styStdDiv">
					<div class="styLNLeftNumBoxSD">8a</div>
					<div class="styLNDesc" style="width:98mm;">
						Total tax before deferred tax. Add lines 5 and 7
						<span class="sty1120REITDotLn">........</span>
					</div>
					<div class="styLNRightNumBox">8a</div>
					<div class="styLNAmountBox" style="padding-right:0.5mm;">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/TotTaxBeforeDefrdTaxesAmt"/>
						</xsl:call-template>
					</div>
					<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;">&nbsp;</div>
					<div class="styLNAmountBoxNBB" style="">&nbsp;</div>
				</div>
				<!-- Schedule J, Line 8b -->
				<div class="styStdDiv">
					<div class="styLNLeftNumBoxSD" style="padding-left:4.2mm;">b</div>
					<div class="styLNDesc" style="width:98mm;height:auto;">
						Deferred tax on the REIT's share of undistributed earnings of a qualified electing fund
						<span class="sty1120REITDotLn">....................</span>
					</div>
					<div class="styLNRightNumBox" style="height:7.2mm;"><br />8b</div>
					<div class="styLNAmountBox" style="height:7.2mm;padding-right:0.5mm;"><br />
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/DefrdTaxCorpUndistrEarnQEFAmt"/>
						</xsl:call-template>
					</div>
					<div class="styLNRightNumBoxNBB" style="height:7.2mm;background-color:lightgrey;">&nbsp;</div>
					<div class="styLNAmountBoxNBB" style="height:7.2mm;">&nbsp;</div>
				</div>
				<!-- Schedule J, Line 8c -->
				<div class="styStdDiv">
					<div class="styLNLeftNumBoxSD" style="padding-left:4.2mm;">c</div>
					<div class="styLNDesc" style="width:98mm;">
						Other deferred tax
						<xsl:call-template name="SetFormLinkInline">
							<xsl:with-param name="TargetNode" select="$FormData/OtherDefrdTaxAmt"/>
						</xsl:call-template>
						<span class="sty1120REITDotLn">..................</span>
					</div>
					<div class="styLNRightNumBox">8c</div>
					<div class="styLNAmountBox" style="padding-right:0.5mm;">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/OtherDefrdTaxAmt"/>
						</xsl:call-template>
					</div>
					<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;">&nbsp;</div>
					<div class="styLNAmountBoxNBB" style="">&nbsp;</div>
				</div>
				<!-- Schedule J, Line 9 -->
				<div class="styStdDiv">
					<div class="styLNLeftNumBoxSD">9</div>
					<div class="styLNDesc">
						<strong>Total tax. </strong> Subtract sum of lines 8b and 8c from 8a. Enter here and on page 2, line 24
						<xsl:call-template name="SetFormLinkInline">
							<xsl:with-param name="TargetNode" select="$FormData/TotalTaxAmt"/>
						</xsl:call-template>
						<span class="sty1120REITDotLn">.....</span>
					</div>
					<div class="styLNRightNumBoxNBB">9</div>
					<div class="styLNAmountBoxNBB">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/TotalTaxAmt"/>
						</xsl:call-template>
					</div>
				</div>
				<div class="pageEnd" style="width:187mm;border-top:1px solid black;">
					<span style="float:right;">
						Form <span class="styBoldText" style="font-size:8pt;">1120-REIT</span> (2025)
					</span>
				</div>
				<div class="styStdDiv">
					Form 1120-REIT (2025)
					<div style="float:right;">
						Page <span style="font-weight:bold;font-size:8pt;">4</span>
					</div>
				</div>
				<div class="styStdDiv" style="font-size:8pt;border-top:1px solid black;border-bottom:1px solid black;">
					<div class="styPartName" style="width:22mm;">Schedule K</div> 
					<div class="styPartDesc" style="width:160mm;">
						Other Information
						<span style="font-weight:normal;">(see instructions)</span>
					</div>
				</div>
				<!-- Schedule K, Line 1 -->
				<div class="styStdDiv">
					<div class="styLNLeftNumBoxSD">1</div>
					<div class="styLNDesc" style="width:162mm;">
						Check method of accounting:
					</div>
					<div class="styLNRightNumBox">Yes</div>
					<div class="styLNRightNumBox">No</div>
				</div>
				<!-- Schedule K, Line 1a -->
				<div class="styStdDiv">
					<div class="styLNLeftNumBoxSD" style="padding-left:4.2mm;">a</div>
					<div class="styLNDesc" style="width:162mm;height:auto;">
						<input type="checkbox" class="styCkboxNM" style="margin-right:1mm;" aria-label="Cash">
							<xsl:call-template name="PopulateCheckbox">
								<xsl:with-param name="TargetNode" select="$FormData/MethodOfAccountingCashInd"/>
								<xsl:with-param name="BackupName">F1120REITCash</xsl:with-param>
							</xsl:call-template>
						</input>
						Cash
					</div>
					<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;height:4.7mm;">&nbsp;</div>
					<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;height:4.7mm;">&nbsp;</div>
				</div>
				<!-- Schedule K, Line 1b -->
				<div class="styStdDiv">
					<div class="styLNLeftNumBoxSD" style="padding-left:4.2mm;">b</div>
					<div class="styLNDesc" style="width:162mm;height:auto;">
						<input type="checkbox" class="styCkboxNM" style="margin-right:1mm;" aria-label="Accrual">
							<xsl:call-template name="PopulateCheckbox">
								<xsl:with-param name="TargetNode" select="$FormData/MethodOfAccountingAccrualInd"/>
								<xsl:with-param name="BackupName">F1120REITAccrual</xsl:with-param>
							</xsl:call-template>
						</input>
						Accrual
					</div>
					<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;height:4.4mm;">&nbsp;</div>
					<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;height:4.4mm;">&nbsp;</div>
				</div>
				<!-- Schedule K, Line 1c -->
				<div class="styStdDiv">
					<div class="styLNLeftNumBoxSD" style="padding-left:4.2mm;">c</div>
					<div class="styLNDesc" style="width:162mm;height:auto;">
						<input type="checkbox" class="styCkboxNM" style="margin-right:1mm;" aria-label="Other">
							<xsl:call-template name="PopulateCheckbox">
								<xsl:with-param name="TargetNode" select="$FormData/MethodOfAccountingOtherInd"/>
								<xsl:with-param name="BackupName">F1120REITOtherAccounting</xsl:with-param>
							</xsl:call-template>
						</input>
						Other (specify): 
						<span style="width:100mm;border-bottom:1px solid black;padding-left:0.5mm;">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/MethodOfAccountingOtherInd/@methodOfAccountingOtherDesc"/>
							</xsl:call-template>
						</span>
					</div>
					<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;height:4.6mm;">&nbsp;</div>
					<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;height:4.6mm;">&nbsp;</div>
				</div>
				<!-- Schedule K, Line 2 -->
				<div class="styStdDiv">
					<div class="styLNLeftNumBoxSD">2</div>
					<div class="styLNDesc" style="width:162mm;height:auto;">
						At the end of the tax year, did the REIT own, directly or indirectly, 50% or more of the voting stock of a domestic 
						corporation? (For rules of attribution, see section 267(c).)
						<span class="sty1120REITDotLn">.........................</span>
					</div>
					<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;height:3mm;"></div>
					<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;height:3mm;"></div>
					<div class="styLNRightNumBox">
						<xsl:call-template name="PopulateYesBoxText">
							<xsl:with-param name="TargetNode" select="$FormData/Own50PctOrMoreVotingStkDomInd"/>
						</xsl:call-template>
					</div>
					<div class="styLNRightNumBox">
						<xsl:call-template name="PopulateNoBoxText">
							<xsl:with-param name="TargetNode" select="$FormData/Own50PctOrMoreVotingStkDomInd"/>
						</xsl:call-template>
					</div>
				</div>
				<div class="styStdDiv">
					<div class="styLNLeftNumBoxSD">&nbsp;</div>
					<div class="styLNDesc" style="width:162mm;height:auto;">
						If "Yes," attach a statement showing: (a) name and employer identification number (EIN), (b) percentage owned, <br />
						and (c) taxable income or (loss) before NOL and special deductions of such corporation for the tax year ending <br />
						with or within your tax year.
						<xsl:call-template name="SetFormLinkInline">
							<xsl:with-param name="TargetNode" select="$FormData/Own50PctOrMoreVotingStkDomInd"/>
						</xsl:call-template>
					</div>
					<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;height:11mm;"></div>
					<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;height:11mm;"></div>
				</div>
				<!-- Schedule K, Line 3 -->
				<div class="styStdDiv">
					<div class="styLNLeftNumBoxSD">3</div>
					<div class="styLNDesc" style="width:162mm;height:auto;">
						Is the REIT a subsidiary in a parent-subsidiary controlled group?
						<span class="sty1120REITDotLn">...............</span>
					</div>
					<div class="styLNRightNumBox">
						<xsl:call-template name="PopulateYesBoxText">
							<xsl:with-param name="TargetNode" select="$FormData/ControlledGroupMemberInd"/>
						</xsl:call-template>
					</div>
					<div class="styLNRightNumBox">
						<xsl:call-template name="PopulateNoBoxText">
							<xsl:with-param name="TargetNode" select="$FormData/ControlledGroupMemberInd"/>
						</xsl:call-template>
					</div>
				</div>
				<div class="styStdDiv">
					<div class="styLNLeftNumBoxSD">&nbsp;</div>
					<div class="styLNDesc" style="width:162mm;">
						If "Yes," enter the name and EIN of the parent corporation: 
						<span style="width:85mm;border-bottom:1px dashed black;">
							<xsl:choose>
								<xsl:when test="$FormData/MissingEINReasonCd">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$FormData/MissingEINReasonCd"/>
									</xsl:call-template>
								</xsl:when>
								<xsl:otherwise>
									<xsl:call-template name="PopulateEIN">
										<xsl:with-param name="TargetNode" select="$FormData/ParentCorporationEIN"/>
									</xsl:call-template>
								</xsl:otherwise>
							</xsl:choose>
						</span>
					</div>
					<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;"></div>
					<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;"></div>
				</div>
				<div class="styStdDiv">
					<div class="styLNLeftNumBoxSD">&nbsp;</div>
					<div class="styLNDesc" style="width:162mm;height:auto;border-bottom:1px dashed black;">
						<xsl:call-template name="PopulateText">
							<xsl:with-param name="TargetNode" select="$FormData/ParentCorporationName/BusinessNameLine1Txt"/>
						</xsl:call-template>
						<xsl:call-template name="LinkToLeftoverDataTableInline">
							<xsl:with-param name="TargetNode" select="$FormData/PrntCorporationNameControlTxt"/>
							<xsl:with-param name="Desc">Schedule K, Line 3 - Parent Corporation Name Control</xsl:with-param>
						</xsl:call-template>
						<xsl:if test="$FormData/ParentCorporationName/BusinessNameLine2Txt">
							<br />
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/ParentCorporationName/BusinessNameLine2Txt"/>
							</xsl:call-template>
						</xsl:if>
					</div>
					<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;height:7.5mm;"></div>
					<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;height:7.5mm;"></div>
				</div>
				<!-- Schedule K, Line 4 -->
				<div class="styStdDiv">
					<div class="styLNLeftNumBoxSD">4</div>
					<div class="styLNDesc" style="width:162mm;height:auto;">
						At the end of the tax year, did any individual, partnership, corporation, estate, or trust own, directly or indirectly, <br />
						50% or more of the REIT's voting stock? (For rules of attribution, see section 856(h).)
						<span class="sty1120REITDotLn">.............</span>
					</div>
					<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;height:3mm;"></div>
					<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;height:3mm;"></div>
					<div class="styLNRightNumBox">
						<xsl:call-template name="PopulateYesBoxText">
							<xsl:with-param name="TargetNode" select="$FormData/Own50PercentOrMoreVotingStkInd"/>
						</xsl:call-template>
					</div>
					<div class="styLNRightNumBox">
						<xsl:call-template name="PopulateNoBoxText">
							<xsl:with-param name="TargetNode" select="$FormData/Own50PercentOrMoreVotingStkInd"/>
						</xsl:call-template>
					</div>
				</div>
				<div class="styStdDiv">
					<div class="styLNLeftNumBoxSD">&nbsp;</div>
					<div class="styLNDesc" style="width:162mm;height:auto;">
						If "Yes," attach a statement showing name and identifying number. (Do not include any information already <br />
						entered in <strong>3</strong> above.) Enter percentage owned
						<span class="sty1120REITDotLn" style="float:none;">........</span>
						<span style="width:70mm;border-bottom:1px dashed black;text-align:center;">
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$FormData/Own50PercentOrMoreVotingStkInd"/>
							</xsl:call-template>
							<xsl:call-template name="PopulatePercent">
								<xsl:with-param name="TargetNode" select="$FormData/VotingStockOwnedPct"/>
							</xsl:call-template>
						</span>
					</div>
					<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;height:7.6mm;"></div>
					<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;height:7.6mm;"></div>
				</div>
				<!-- Schedule K, Line 5 -->
				<div class="styStdDiv">
					<div class="styLNLeftNumBoxSD">5</div>
					<div class="styLNDesc" style="width:162mm;height:auto;">
						At any time during the tax year, did one foreign person own, directly or indirectly, at least 25% of: (a) the total 
						voting power of all classes of stock of the REIT entitled to vote, or (b) the total value of all classes of stock of the REIT?
						<span class="sty1120REITDotLn">.......</span>
					</div>
					<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;height:3mm;"></div>
					<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;height:3mm;"></div>
					<div class="styLNRightNumBox">
						<xsl:call-template name="PopulateYesBoxText">
							<xsl:with-param name="TargetNode" select="$FormData/FrgnOwn25PctTotVotingPowerInd"/>
						</xsl:call-template>
					</div>
					<div class="styLNRightNumBox">
						<xsl:call-template name="PopulateNoBoxText">
							<xsl:with-param name="TargetNode" select="$FormData/FrgnOwn25PctTotVotingPowerInd"/>
						</xsl:call-template>
					</div>
				</div>
				<div class="styStdDiv">
					<div class="styLNLeftNumBoxSD">&nbsp;</div>
					<div class="styLNDesc" style="width:162mm;">
						If "Yes," enter:
					</div>
					<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;height:4mm;"></div>
					<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;height:4mm;"></div>
				</div>
				<!-- Schedule K, Line 5a -->
				<div class="styStdDiv">
					<div class="styLNLeftNumBoxSD" style="padding-left:4.2mm;">a</div>
					<div class="styLNDesc" style="width:162mm;">
						Percentage owned: 
						<span style="width:40mm;border-bottom:1px dashed black;text-align:center;">
							<xsl:call-template name="PopulatePercent">
								<xsl:with-param name="TargetNode" select="$FormData/VotingStockForeignOwnedPct"/>
							</xsl:call-template>
						</span>
					</div>
					<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;height:4mm;"></div>
					<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;height:4mm;"></div>
				</div>
				<!-- Schedule K, Line 5b -->
				<div class="styStdDiv">
					<div class="styLNLeftNumBoxSD" style="padding-left:4.2mm;">b</div>
					<div class="styLNDesc" style="width:162mm;">
						Owner's country: 
						<span style="width:40mm;border-bottom:1px dashed black;text-align:center;">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/ForeignOwnStockCountryCd"/>
							</xsl:call-template>
						</span>
					</div>
					<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;height:4mm;"></div>
					<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;height:4mm;"></div>
				</div>
				<!-- Schedule K, Line 5c -->
				<div class="styStdDiv">
					<div class="styLNLeftNumBoxSD" style="padding-left:4.2mm;">c</div>
					<div class="styLNDesc" style="width:162mm;height:4.2mm;">
						The REIT may have to file Form 5472. Enter number of Forms 5472 attached
						<span class="sty1120REITDotLn" style="float:none;">.....</span>
						<span style="width:30mm;border-bottom:1px dashed black;text-align:center;">
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$FormData/TotalForm5472FiledCnt"/>
							</xsl:call-template>
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/TotalForm5472FiledCnt"/>
							</xsl:call-template>
						</span>
					</div>
					<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;height:4.4mm;"></div>
					<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;height:4.4mm;"></div>
				</div>
				<!-- Schedule K, Line 6 -->
				<div class="styStdDiv">
					<div class="styLNLeftNumBoxSD">6</div>
					<div class="styLNDesc" style="width:162mm;height:auto;">
						During this tax year, did the REIT pay dividends (other than stock dividends and distributions in exchange for <br />
						stock) in excess of the REIT's current and accumulated earnings and profits? (See sections 301 and 316.)
						<span class="sty1120REITDotLn">.......</span>
					</div>
					<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;height:3mm;"></div>
					<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;height:3mm;"></div>
					<div class="styLNRightNumBox">
						<xsl:call-template name="PopulateYesBoxText">
							<xsl:with-param name="TargetNode" select="$FormData/ExcessDividendsPaidInd"/>
						</xsl:call-template>
					</div>
					<div class="styLNRightNumBox">
						<xsl:call-template name="PopulateNoBoxText">
							<xsl:with-param name="TargetNode" select="$FormData/ExcessDividendsPaidInd"/>
						</xsl:call-template>
					</div>
				</div>
				<div class="styStdDiv">
					<div class="styLNLeftNumBoxSD">&nbsp;</div>
					<div class="styLNDesc" style="width:162mm;">
						If "Yes," file Form 5452. 
						<xsl:call-template name="SetFormLinkInline">
							<xsl:with-param name="TargetNode" select="$FormData/ExcessDividendsPaidInd"/>
						</xsl:call-template>
					</div>
					<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;height:4mm;"></div>
					<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;height:4mm;"></div>
				</div>
				<!-- Schedule K, Line 7 -->
				<div class="styStdDiv">
					<div class="styLNLeftNumBoxSD">7</div>
					<div class="styLNDesc" style="width:162mm;height:auto;">
						Check this box if the REIT issued publicly offered debt instruments with original issue discount
						<span class="sty1120REITDotLn">.........<input type="checkbox" class="styCkboxNM" style="" aria-label="Offered Debt Instruments with OID">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$FormData/OfferedDebtInstrumentsInd"/>
									<xsl:with-param name="BackupName">F1120REITOfferedDebtInstrumentsInd</xsl:with-param>
								</xsl:call-template>
							</input>
						</span>
					</div>
					<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;height:4.7mm;"></div>
					<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;height:4.7mm;"></div>
				</div>
				<div class="styStdDiv">
					<div class="styLNLeftNumBoxSD">&nbsp;</div>
					<div class="styLNDesc" style="width:162mm;">
						If so, the REIT may have to file Form 8281.
						<xsl:call-template name="SetFormLinkInline">
							<xsl:with-param name="TargetNode" select="$FormData/OfferedDebtInstrumentsInd"/>
						</xsl:call-template>
					</div>
					<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;height:4mm;"></div>
					<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;height:4mm;"></div>
				</div>
				<!-- Schedule K, Line 8 -->
				<div class="styStdDiv">
					<div class="styLNLeftNumBoxSD">8</div>
					<div class="styLNDesc" style="width:162mm;height:auto;">
						Enter the amount of tax-exempt interest received or accrued during the tax year
						<span class="sty1120REITDotLn" style="float:none;">......</span>
						<span style="width:32mm;border-bottom:1px dashed black;text-align:right;">
							<span style="float:left;">$</span>
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TaxExemptInterestAmt"/>
							</xsl:call-template>
						</span>
					</div>
					<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;height:4.2mm;"></div>
					<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;height:4.2mm;"></div>
				</div>
				<!-- Schedule K, Line 9 -->
				<div class="styStdDiv">
					<div class="styLNLeftNumBoxSD">9</div>
					<div class="styLNDesc" style="width:162mm;height:auto;">
						Enter the available NOL carryover from prior tax years. (Do not reduce it by any deduction on <br />
						page 1, line 22a.)
						<span class="sty1120REITDotLn" style="float:none;">..........................</span>
						<span style="width:32mm;border-bottom:1px dashed black;text-align:right;">
							<span style="float:left;">$</span>
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/NOLCarryoverFromPriorYearAmt"/>
							</xsl:call-template>
						</span>
					</div>
					<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;height:7.4mm;"></div>
					<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;height:7.4mm;"></div>
				</div>
				<!-- Schedule K, Line 10 -->
				<div class="styStdDiv">
					<div class="styLNLeftNumBox">10</div>
					<div class="styLNDesc" style="width:162mm;height:auto;">
						Did the REIT have an election under section 163(j) for any real property trade or business or any farming business <br />
						in effect during the tax year? See instructions
						<span class="sty1120REITDotLn">.........................</span>
					</div>
					<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;height:3mm;"></div>
					<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;height:3mm;"></div>
					<div class="styLNRightNumBox">
						<xsl:call-template name="PopulateYesBoxText">
							<xsl:with-param name="TargetNode" select="$FormData/Section163jElectionInd"/>
						</xsl:call-template>
					</div>
					<div class="styLNRightNumBox">
						<xsl:call-template name="PopulateNoBoxText">
							<xsl:with-param name="TargetNode" select="$FormData/Section163jElectionInd"/>
						</xsl:call-template>
					</div>
				</div>
				<!-- Schedule K, Line 11 -->
				<div class="styStdDiv">
					<div class="styLNLeftNumBox">11</div>
					<div class="styLNDesc" style="width:162mm;">
						Does the REIT satisfy one or more of the following? See instructions
						<span class="sty1120REITDotLn">..................</span>
					</div>
					<div class="styLNRightNumBox">
						<xsl:call-template name="PopulateYesBoxText">
							<xsl:with-param name="TargetNode" select="$FormData/SatisfyOneOrMoreConditionsInd"/>
						</xsl:call-template>
					</div>
					<div class="styLNRightNumBox">
						<xsl:call-template name="PopulateNoBoxText">
							<xsl:with-param name="TargetNode" select="$FormData/SatisfyOneOrMoreConditionsInd"/>
						</xsl:call-template>
					</div>
				</div>
				<!-- Schedule K, Line 11a -->
				<div class="styStdDiv">
					<div class="styLNLeftNumBoxSD" style="padding-left:4.2mm;">a</div>
					<div class="styLNDesc" style="width:162mm;">
						The REIT owns a pass-through entity with current or prior-year carryover excess business interest expense.
					</div>
					<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;height:4mm;"></div>
					<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;height:4mm;"></div>
				</div>
				<!-- Schedule K, Line 11b -->
				<div class="styStdDiv">
					<div class="styLNLeftNumBoxSD" style="padding-left:4.2mm;">b</div>
					<div class="styLNDesc" style="width:162mm;height:auto;">
						The REIT's aggregate average annual gross receipts (determined under section 448(c)) for the 3 tax years <br />
						preceding the current tax year are more than $31 million and the REIT has business interest expense.
					</div>
					<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;height:7.2mm;"></div>
					<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;height:7.2mm;"></div>
				</div>
				<!-- Schedule K, Line 11c -->
				<div class="styStdDiv">
					<div class="styLNLeftNumBoxSD" style="padding-left:4.2mm;">c</div>
					<div class="styLNDesc" style="width:162mm;">
						The REIT is a tax shelter and the REIT has business interest expense.
					</div>
					<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;height:4mm;"></div>
					<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;height:4mm;"></div>
				</div>
				<div class="styStdDiv">
					<div class="styLNLeftNumBoxSD">&nbsp;</div>
					<div class="styLNDesc" style="width:162mm;">
						If "Yes" to any of the above, complete and attach Form 8990.
						<xsl:call-template name="SetFormLinkInline">
							<xsl:with-param name="TargetNode" select="$FormData/SatisfyOneOrMoreConditionsInd"/>
						</xsl:call-template>
					</div>
					<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;height:4.2mm;"></div>
					<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;height:4.2mm;"></div>
				</div>
				<!-- Schedule K, Line 12 -->
				<div class="styStdDiv">
					<div class="styLNLeftNumBox">12</div>
					<div class="styLNDesc" style="width:162mm;">
						Does the REIT intend to self-certify as a Qualified Opportunity Fund?
						<span class="sty1120REITDotLn">..................</span>
					</div>
					<div class="styLNRightNumBox">
						<xsl:call-template name="PopulateYesBoxText">
							<xsl:with-param name="TargetNode" select="$FormData/Form8996AttachedInd"/>
						</xsl:call-template>
					</div>
					<div class="styLNRightNumBox">
						<xsl:call-template name="PopulateNoBoxText">
							<xsl:with-param name="TargetNode" select="$FormData/Form8996AttachedInd"/>
						</xsl:call-template>
					</div>
				</div>
				<div class="styStdDiv">
					<div class="styLNLeftNumBoxSD">&nbsp;</div>
					<div class="styLNDesc" style="width:162mm;">
						If "Yes," complete and attach Form 8996. Enter the amount (if any) from Form 8996, line 15
						<xsl:call-template name="SetFormLinkInline">
							<xsl:with-param name="TargetNode" select="$FormData/QlfyOpportunityFundPenaltyAmt"/>
						</xsl:call-template>
						<span class="sty1120REITDotLn" style="float:none;">..</span>
						<span style="width:32mm;border-bottom:1px dashed black;text-align:right;">
							<span style="float:left;">$</span>
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/QlfyOpportunityFundPenaltyAmt"/>
							</xsl:call-template>
						</span>
					</div>
					<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;height:4.2mm;"></div>
					<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;height:4.2mm;"></div>
				</div>
				<!-- Schedule K, Line 13 -->
				<div class="styStdDiv">
					<div class="styLNLeftNumBox">13</div>
					<div class="styLNDesc" style="width:162mm;">
						Is the REIT a member of a controlled group?
						<span class="sty1120REITDotLn">.........................</span>
					</div>
					<div class="styLNRightNumBox">
						<xsl:call-template name="PopulateYesBoxText">
							<xsl:with-param name="TargetNode" select="$FormData/MemberOfControlledGroupInd"/>
						</xsl:call-template>
					</div>
					<div class="styLNRightNumBox">
						<xsl:call-template name="PopulateNoBoxText">
							<xsl:with-param name="TargetNode" select="$FormData/MemberOfControlledGroupInd"/>
						</xsl:call-template>
					</div>
				</div>
				<div class="styStdDiv">
					<div class="styLNLeftNumBoxSD">&nbsp;</div>
					<div class="styLNDesc" style="width:162mm;">
						If "Yes," attach Schedule O (Form 1120). See instructions.
						<xsl:call-template name="SetFormLinkInline">
							<xsl:with-param name="TargetNode" select="$FormData/MemberOfControlledGroupInd"/>
						</xsl:call-template>
					</div>
					<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;height:4.2mm;"></div>
					<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;height:4.2mm;"></div>
				</div>
				<div class="pageEnd" style="width:187mm;border-top:1px solid black;">
					<span style="float:right;">
						Form <span class="styBoldText" style="font-size:8pt;">1120-REIT</span> (2025)
					</span>
				</div>
				<div class="styStdDiv">
					Form 1120-REIT (2025)
					<div style="float:right;">
						Page <span style="font-weight:bold;font-size:8pt;">4</span>
					</div>
				</div>
				<div class="styStdDiv" style="font-size:8pt;border-top:1px solid black;border-bottom:1px solid black;">
					<div class="styPartName" style="width:22mm;">Schedule L</div> 
					<div class="styPartDesc" style="width:56.8mm;">
						Balance Sheets per Books
					</div>
					<div class="styGenericDiv" style="width:54mm;padding:2px;text-align:center;border-left:1px solid black;">
						Beginning of tax year
					</div>
					<div class="styGenericDiv" style="width:54mm;padding:2px;text-align:center;border-left:1px solid black;">
						End of tax year
					</div>
				</div>
				<div class="styStdDiv">
					<div class="styLNLeftNumBoxSD">&nbsp;</div>
					<div class="sty1120REITShortDesc" style="font-weight:bold;text-align:center;">
						Assets
					</div>
					<div class="sty1120REITSLAmt" style="font-weight:bold;text-align:center;">
						(a)
					</div>
					<div class="sty1120REITSLAmt" style="font-weight:bold;text-align:center;">
						(b)
					</div>
					<div class="sty1120REITSLAmt" style="font-weight:bold;text-align:center;">
						(c)
					</div>
					<div class="sty1120REITSLAmt" style="font-weight:bold;text-align:center;">
						(d)
					</div>
				</div>
				<!-- Schedule L, Line 1 -->
				<div class="styStdDiv">
					<div class="styLNLeftNumBoxSD">1</div>
					<div class="sty1120REITShortDesc">
						Cash
						<span class="sty1120REITDotLn">..........</span>
					</div>
					<div class="sty1120REITSLAmt sty1120REIT-bg">
						&nbsp;
					</div>
					<div class="sty1120REITSLAmt">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/CashBOYAmt"/>
						</xsl:call-template>
					</div>
					<div class="sty1120REITSLAmt sty1120REIT-bg">
						&nbsp;
					</div>
					<div class="sty1120REITSLAmt">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/CashEOYAmt"/>
						</xsl:call-template>
					</div>
				</div>
				<!-- Schedule L, Line 2a -->
				<div class="styStdDiv">
					<div class="styLNLeftNumBoxSD">2a</div>
					<div class="sty1120REITShortDesc">
						Trade notes and accounts receivable 
						<span class="sty1120REITDotLn">..</span>
					</div>
					<div class="sty1120REITSLAmt">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/TradeNotesAccountsRcvblBOYAmt"/>
						</xsl:call-template>
					</div>
					<div class="sty1120REITSLAmt sty1120REIT-bg">
						&nbsp;
					</div>
					<div class="sty1120REITSLAmt">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/TradeNotesAccountsRcvblEOYAmt"/>
						</xsl:call-template>
					</div>
					<div class="sty1120REITSLAmt sty1120REIT-bg">
						&nbsp;
					</div>
				</div>
				<!-- Schedule L, Line 2b -->
				<div class="styStdDiv">
					<div class="styLNLeftNumBoxSD" style="padding-left:4.2mm;">b</div>
					<div class="sty1120REITShortDesc">
						Less allowance for bad debts 
						<span class="sty1120REITDotLn">......</span>
					</div>
					<div class="sty1120REITSLAmt">
						<xsl:call-template name="PopulateNegativeNumber">
							<xsl:with-param name="TargetNode" select="$FormData/BadDebtAllowanceBOYAmt"/>
						</xsl:call-template>
					</div>
					<div class="sty1120REITSLAmt">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/NetTradeNotesAcctRcvblBOYAmt"/>
						</xsl:call-template>
					</div>
					<div class="sty1120REITSLAmt">
						<xsl:call-template name="PopulateNegativeNumber">
							<xsl:with-param name="TargetNode" select="$FormData/BadDebtAllowanceEOYAmt"/>
						</xsl:call-template>
					</div>
					<div class="sty1120REITSLAmt">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/NetTradeNotesAcctRcvblEOYAmt"/>
						</xsl:call-template>
					</div>
				</div>
				<!-- Schedule L, Line 3 -->
				<div class="styStdDiv">
					<div class="styLNLeftNumBoxSD">3</div>
					<div class="sty1120REITShortDesc">
						U.S. Government obligations
						<span class="sty1120REITDotLn">......</span>
					</div>
					<div class="sty1120REITSLAmt sty1120REIT-bg">
						&nbsp;
					</div>
					<div class="sty1120REITSLAmt">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/USGovernmentObligationsBOYAmt"/>
						</xsl:call-template>
					</div>
					<div class="sty1120REITSLAmt sty1120REIT-bg">
						&nbsp;
					</div>
					<div class="sty1120REITSLAmt">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/USGovernmentObligationsEOYAmt"/>
						</xsl:call-template>
					</div>
				</div>
				<!-- Schedule L, Line 4 -->
				<div class="styStdDiv">
					<div class="styLNLeftNumBoxSD">4</div>
					<div class="sty1120REITShortDesc">
						Tax-exempt securities (see instructions)
						<span class="sty1120REITDotLn">....</span>
					</div>
					<div class="sty1120REITSLAmt sty1120REIT-bg">
						&nbsp;
					</div>
					<div class="sty1120REITSLAmt">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/TaxExemptSecuritiesBOYAmt"/>
						</xsl:call-template>
					</div>
					<div class="sty1120REITSLAmt sty1120REIT-bg">
						&nbsp;
					</div>
					<div class="sty1120REITSLAmt">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/TaxExemptSecuritiesEOYAmt"/>
						</xsl:call-template>
					</div>
				</div>
				<!-- Schedule L, Line 5 -->
				<div class="styStdDiv">
					<div class="styLNLeftNumBoxSD">5</div>
					<div class="sty1120REITShortDesc">
						Other current assets (attach statement)
						<span class="sty1120REITDotLn">....</span>
					</div>
					<div class="sty1120REITSLAmt sty1120REIT-bg">
						<xsl:call-template name="SetFormLinkInline">
							<xsl:with-param name="TargetNode" select="$FormData/OtherCurrentAssetsBOYAmt"/>
						</xsl:call-template>
						&nbsp;
					</div>
					<div class="sty1120REITSLAmt">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/OtherCurrentAssetsBOYAmt"/>
						</xsl:call-template>
					</div>
					<div class="sty1120REITSLAmt sty1120REIT-bg">
						<xsl:call-template name="SetFormLinkInline">
							<xsl:with-param name="TargetNode" select="$FormData/OtherCurrentAssetsEOYAmt"/>
						</xsl:call-template>
						&nbsp;
					</div>
					<div class="sty1120REITSLAmt">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/OtherCurrentAssetsEOYAmt"/>
						</xsl:call-template>
					</div>
				</div>
				<!-- Schedule L, Line 6 -->
				<div class="styStdDiv">
					<div class="styLNLeftNumBoxSD">6</div>
					<div class="sty1120REITShortDesc">
						Loans to shareholders
						<span class="sty1120REITDotLn">......</span>
					</div>
					<div class="sty1120REITSLAmt sty1120REIT-bg">
						&nbsp;
					</div>
					<div class="sty1120REITSLAmt">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/LoansToShareholdersBOYAmt"/>
						</xsl:call-template>
					</div>
					<div class="sty1120REITSLAmt sty1120REIT-bg">
						&nbsp;
					</div>
					<div class="sty1120REITSLAmt">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/LoansToShareholdersEOYAmt"/>
						</xsl:call-template>
					</div>
				</div>
				<!-- Schedule L, Line 7 -->
				<div class="styStdDiv">
					<div class="styLNLeftNumBoxSD">7</div>
					<div class="sty1120REITShortDesc">
						Mortgage and real estate loans
						<span class="sty1120REITDotLn">......</span>
					</div>
					<div class="sty1120REITSLAmt sty1120REIT-bg">
						&nbsp;
					</div>
					<div class="sty1120REITSLAmt">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/MortgageRealEstateLoansBOYAmt"/>
						</xsl:call-template>
					</div>
					<div class="sty1120REITSLAmt sty1120REIT-bg">
						&nbsp;
					</div>
					<div class="sty1120REITSLAmt">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/MortgageRealEstateLoansEOYAmt"/>
						</xsl:call-template>
					</div>
				</div>
				<!-- Schedule L, Line 8 -->
				<div class="styStdDiv">
					<div class="styLNLeftNumBoxSD">8</div>
					<div class="sty1120REITShortDesc">
						Other investments (attach statement)
						<span class="sty1120REITDotLn">.....</span>
					</div>
					<div class="sty1120REITSLAmt sty1120REIT-bg">
						<xsl:call-template name="SetFormLinkInline">
							<xsl:with-param name="TargetNode" select="$FormData/OtherInvestmentsBOYAmt"/>
						</xsl:call-template>
						&nbsp;
					</div>
					<div class="sty1120REITSLAmt">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/OtherInvestmentsBOYAmt"/>
						</xsl:call-template>
					</div>
					<div class="sty1120REITSLAmt sty1120REIT-bg">
						<xsl:call-template name="SetFormLinkInline">
							<xsl:with-param name="TargetNode" select="$FormData/OtherInvestmentsEOYAmt"/>
						</xsl:call-template>
						&nbsp;
					</div>
					<div class="sty1120REITSLAmt">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/OtherInvestmentsEOYAmt"/>
						</xsl:call-template>
					</div>
				</div>
				<!-- Schedule L, Line 9a -->
				<div class="styStdDiv">
					<div class="styLNLeftNumBoxSD">9a</div>
					<div class="sty1120REITShortDesc">
						Buildings and other depreciable assets
						<span class="sty1120REITDotLn">..</span>
					</div>
					<div class="sty1120REITSLAmt">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/BuildingOtherDeprecAstBOYAmt"/>
						</xsl:call-template>
					</div>
					<div class="sty1120REITSLAmt sty1120REIT-bg">
						&nbsp;
					</div>
					<div class="sty1120REITSLAmt">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/BuildingOtherDeprecAstEOYAmt"/>
						</xsl:call-template>
					</div>
					<div class="sty1120REITSLAmt sty1120REIT-bg">
						&nbsp;
					</div>
				</div>
				<!-- Schedule L, Line 9b -->
				<div class="styStdDiv">
					<div class="styLNLeftNumBoxSD" style="padding-left:4.2mm;">b</div>
					<div class="sty1120REITShortDesc">
						Less accumulated depreciation
						<span class="sty1120REITDotLn">......</span>
					</div>
					<div class="sty1120REITSLAmt">
						<xsl:call-template name="PopulateNegativeNumber">
							<xsl:with-param name="TargetNode" select="$FormData/AccumulatedDepreciationBOYAmt"/>
						</xsl:call-template>
					</div>
					<div class="sty1120REITSLAmt">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/NetDepreciableAssetsBOYAmt"/>
						</xsl:call-template>
					</div>
					<div class="sty1120REITSLAmt">
						<xsl:call-template name="PopulateNegativeNumber">
							<xsl:with-param name="TargetNode" select="$FormData/AccumulatedDepreciationEOYAmt"/>
						</xsl:call-template>
					</div>
					<div class="sty1120REITSLAmt">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/NetDepreciableAssetsEOYAmt"/>
						</xsl:call-template>
					</div>
				</div>
				<!-- Schedule L, Line 10 -->
				<div class="styStdDiv">
					<div class="styLNLeftNumBox">10</div>
					<div class="sty1120REITShortDesc">
						Land (net of any amortization)
						<span class="sty1120REITDotLn">......</span>
					</div>
					<div class="sty1120REITSLAmt sty1120REIT-bg">
						&nbsp;
					</div>
					<div class="sty1120REITSLAmt">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/LandBOYAmt"/>
						</xsl:call-template>
					</div>
					<div class="sty1120REITSLAmt sty1120REIT-bg">
						&nbsp;
					</div>
					<div class="sty1120REITSLAmt">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/LandEOYAmt"/>
						</xsl:call-template>
					</div>
				</div>
				<!-- Schedule L, Line 11a -->
				<div class="styStdDiv">
					<div class="styLNLeftNumBox">11a</div>
					<div class="sty1120REITShortDesc">
						Intangible assets (amortizable only)
						<span class="sty1120REITDotLn">..</span>
					</div>
					<div class="sty1120REITSLAmt">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/IntangibleAssetsBOYAmt"/>
						</xsl:call-template>
					</div>
					<div class="sty1120REITSLAmt sty1120REIT-bg">
						&nbsp;
					</div>
					<div class="sty1120REITSLAmt">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/IntangibleAssetsEOYAmt"/>
						</xsl:call-template>
					</div>
					<div class="sty1120REITSLAmt sty1120REIT-bg">
						&nbsp;
					</div>
				</div>
				<!-- Schedule L, Line 11b -->
				<div class="styStdDiv">
					<div class="styLNLeftNumBoxSD" style="padding-left:4.2mm;">b</div>
					<div class="sty1120REITShortDesc">
						Less accumulated amortization
						<span class="sty1120REITDotLn">......</span>
					</div>
					<div class="sty1120REITSLAmt">
						<xsl:call-template name="PopulateNegativeNumber">
							<xsl:with-param name="TargetNode" select="$FormData/AccumulatedAmortizationBOYAmt"/>
						</xsl:call-template>
					</div>
					<div class="sty1120REITSLAmt">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/NetIntangibleAssetsBOYAmt"/>
						</xsl:call-template>
					</div>
					<div class="sty1120REITSLAmt">
						<xsl:call-template name="PopulateNegativeNumber">
							<xsl:with-param name="TargetNode" select="$FormData/AccumulatedAmortizationEOYAmt"/>
						</xsl:call-template>
					</div>
					<div class="sty1120REITSLAmt">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/NetIntangibleAssetsEOYAmt"/>
						</xsl:call-template>
					</div>
				</div>
				<!-- Schedule L, Line 12 -->
				<div class="styStdDiv">
					<div class="styLNLeftNumBox">12</div>
					<div class="sty1120REITShortDesc">
						Other assets (attach statement)
						<span class="sty1120REITDotLn">.......</span>
					</div>
					<div class="sty1120REITSLAmt sty1120REIT-bg">
						<xsl:call-template name="SetFormLinkInline">
							<xsl:with-param name="TargetNode" select="$FormData/OtherAssetsBOYAmt"/>
						</xsl:call-template>
						&nbsp;
					</div>
					<div class="sty1120REITSLAmt">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/OtherAssetsBOYAmt"/>
						</xsl:call-template>
					</div>
					<div class="sty1120REITSLAmt sty1120REIT-bg">
						<xsl:call-template name="SetFormLinkInline">
							<xsl:with-param name="TargetNode" select="$FormData/OtherAssetsEOYAmt"/>
						</xsl:call-template>
						&nbsp;
					</div>
					<div class="sty1120REITSLAmt">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/OtherAssetsEOYAmt"/>
						</xsl:call-template>
					</div>
				</div>
				<!-- Schedule L, Line 13 -->
				<div class="styStdDiv">
					<div class="styLNLeftNumBox">13</div>
					<div class="sty1120REITShortDesc">
						Total assets
						<span class="sty1120REITDotLn">..........</span>
					</div>
					<div class="sty1120REITSLAmt sty1120REIT-nbb sty1120REIT-bg">
						&nbsp;
					</div>
					<div class="sty1120REITSLAmt sty1120REIT-nbb">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/TotalAssetsBOYAmt"/>
						</xsl:call-template>
					</div>
					<div class="sty1120REITSLAmt sty1120REIT-nbb sty1120REIT-bg">
						&nbsp;
					</div>
					<div class="sty1120REITSLAmt sty1120REIT-nbb">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/TotalAssetsEOYAmt"/>
						</xsl:call-template>
					</div>
				</div>
				<div class="styStdDiv" style="border-top:1px solid black;">
					<div class="styLNLeftNumBoxSD">&nbsp;</div>
					<div class="sty1120REITShortDesc" style="font-weight:bold;text-align:center;">
						Liabilities and Shareholders' Equity
					</div>
					<div class="sty1120REITSLAmt sty1120REIT-nbb sty1120REIT-bg">
						&nbsp;
					</div>
					<div class="sty1120REITSLAmt sty1120REIT-nbb">
						&nbsp;
					</div>
					<div class="sty1120REITSLAmt sty1120REIT-nbb sty1120REIT-bg">
						&nbsp;
					</div>
					<div class="sty1120REITSLAmt sty1120REIT-nbb">
						&nbsp;
					</div>
				</div>
				<!-- Schedule L, Line 14 -->
				<div class="styStdDiv">
					<div class="styLNLeftNumBox">14</div>
					<div class="sty1120REITShortDesc">
						Accounts payable
						<span class="sty1120REITDotLn">..........</span>
					</div>
					<div class="sty1120REITSLAmt sty1120REIT-bg">
						&nbsp;
					</div>
					<div class="sty1120REITSLAmt">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/AccountsPayableBOYAmt"/>
						</xsl:call-template>
					</div>
					<div class="sty1120REITSLAmt sty1120REIT-bg">
						&nbsp;
					</div>
					<div class="sty1120REITSLAmt">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/AccountsPayableEOYAmt"/>
						</xsl:call-template>
					</div>
				</div>
				<!-- Schedule L, Line 15 -->
				<div class="styStdDiv">
					<div class="styLNLeftNumBox">15</div>
					<div class="sty1120REITShortDesc">
						Mortgages, notes, bonds payable in less than 1 year
						<!--<span class="sty1120REITDotLn">..........</span>-->
					</div>
					<div class="sty1120REITSLAmt sty1120REIT-bg">
						&nbsp;
					</div>
					<div class="sty1120REITSLAmt">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/ShortTermPayableBOYAmt"/>
						</xsl:call-template>
					</div>
					<div class="sty1120REITSLAmt sty1120REIT-bg">
						&nbsp;
					</div>
					<div class="sty1120REITSLAmt">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/ShortTermPayableEOYAmt"/>
						</xsl:call-template>
					</div>
				</div>
				<!-- Schedule L, Line 16 -->
				<div class="styStdDiv">
					<div class="styLNLeftNumBox">16</div>
					<div class="sty1120REITShortDesc">
						Other current liabilities (attach statement)
						<span class="sty1120REITDotLn">...</span>
					</div>
					<div class="sty1120REITSLAmt sty1120REIT-bg">
						<xsl:call-template name="SetFormLinkInline">
							<xsl:with-param name="TargetNode" select="$FormData/OtherCurrentLiabilitiesBOYAmt"/>
						</xsl:call-template>
						&nbsp;
					</div>
					<div class="sty1120REITSLAmt">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/OtherCurrentLiabilitiesBOYAmt"/>
						</xsl:call-template>
					</div>
					<div class="sty1120REITSLAmt sty1120REIT-bg">
						<xsl:call-template name="SetFormLinkInline">
							<xsl:with-param name="TargetNode" select="$FormData/OtherCurrentLiabilitiesEOYAmt"/>
						</xsl:call-template>
						&nbsp;
					</div>
					<div class="sty1120REITSLAmt">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/OtherCurrentLiabilitiesEOYAmt"/>
						</xsl:call-template>
					</div>
				</div>
				<!-- Schedule L, Line 17 -->
				<div class="styStdDiv">
					<div class="styLNLeftNumBox">17</div>
					<div class="sty1120REITShortDesc">
						Loans from shareholders
						<span class="sty1120REITDotLn">........</span>
					</div>
					<div class="sty1120REITSLAmt sty1120REIT-bg">
						&nbsp;
					</div>
					<div class="sty1120REITSLAmt">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/LoansFromShareholdersBOYAmt"/>
						</xsl:call-template>
					</div>
					<div class="sty1120REITSLAmt sty1120REIT-bg">
						&nbsp;
					</div>
					<div class="sty1120REITSLAmt">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/LoansFromShareholdersEOYAmt"/>
						</xsl:call-template>
					</div>
				</div>
				<!-- Schedule L, Line 18 -->
				<div class="styStdDiv">
					<div class="styLNLeftNumBox">18</div>
					<div class="sty1120REITShortDesc">
						Mortgages, notes, bonds payable in 1 year or more
						<!--<span class="sty1120REITDotLn">..........</span>-->
					</div>
					<div class="sty1120REITSLAmt sty1120REIT-bg">
						&nbsp;
					</div>
					<div class="sty1120REITSLAmt">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/LongTermPayableBOYAmt"/>
						</xsl:call-template>
					</div>
					<div class="sty1120REITSLAmt sty1120REIT-bg">
						&nbsp;
					</div>
					<div class="sty1120REITSLAmt">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/LongTermPayableEOYAmt"/>
						</xsl:call-template>
					</div>
				</div>
				<!-- Schedule L, Line 19 -->
				<div class="styStdDiv">
					<div class="styLNLeftNumBox">19</div>
					<div class="sty1120REITShortDesc">
						Other liabilities (attach statement)
						<span class="sty1120REITDotLn">.....</span>
					</div>
					<div class="sty1120REITSLAmt sty1120REIT-bg">
						<xsl:call-template name="SetFormLinkInline">
							<xsl:with-param name="TargetNode" select="$FormData/OtherLiabilitiesBOYAmt"/>
						</xsl:call-template>
						&nbsp;
					</div>
					<div class="sty1120REITSLAmt">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/OtherLiabilitiesBOYAmt"/>
						</xsl:call-template>
					</div>
					<div class="sty1120REITSLAmt sty1120REIT-bg">
						<xsl:call-template name="SetFormLinkInline">
							<xsl:with-param name="TargetNode" select="$FormData/OtherLiabilitiesEOYAmt"/>
						</xsl:call-template>
						&nbsp;
					</div>
					<div class="sty1120REITSLAmt">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/OtherLiabilitiesEOYAmt"/>
						</xsl:call-template>
					</div>
				</div>
				<!-- Schedule L, Line 20a -->
				<div class="styStdDiv">
					<div class="styLNLeftNumBox">20</div>
					<div class="sty1120REITShortDesc">
						<span style="width:22mm;">
							Capital stock:
						</span>
						<strong>a </strong> Preferred stock
						<span class="sty1120REITDotLn">......</span>
					</div>
					<div class="sty1120REITSLAmt">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/CapitalPreferredStockBOYAmt"/>
						</xsl:call-template>
					</div>
					<div class="sty1120REITSLAmt sty1120REIT-bg">
						&nbsp;
					</div>
					<div class="sty1120REITSLAmt">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/CapitalPreferredStockEOYAmt"/>
						</xsl:call-template>
					</div>
					<div class="sty1120REITSLAmt sty1120REIT-bg">
						&nbsp;
					</div>
				</div>
				<!-- Schedule L, Line 20b -->
				<div class="styStdDiv">
					<div class="styLNLeftNumBoxSD">&nbsp;</div>
					<div class="sty1120REITShortDesc" style="padding-left:22mm;">
						<strong>b </strong> Common stock
						<span class="sty1120REITDotLn">......</span>
					</div>
					<div class="sty1120REITSLAmt">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/CapitalCommonStockBOYAmt"/>
						</xsl:call-template>
					</div>
					<div class="sty1120REITSLAmt">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/CapitalStockBOYAmt"/>
						</xsl:call-template>
					</div>
					<div class="sty1120REITSLAmt">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/CapitalCommonStockEOYAmt"/>
						</xsl:call-template>
					</div>
					<div class="sty1120REITSLAmt">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/CapitalStockEOYAmt"/>
						</xsl:call-template>
					</div>
				</div>
				<!-- Schedule L, Line 21 -->
				<div class="styStdDiv">
					<div class="styLNLeftNumBox">21</div>
					<div class="sty1120REITShortDesc">
						Additional paid-in capital
						<span class="sty1120REITDotLn">.........</span>
					</div>
					<div class="sty1120REITSLAmt sty1120REIT-bg">
						&nbsp;
					</div>
					<div class="sty1120REITSLAmt">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/AdditionalPaidInCapitalBOYAmt"/>
						</xsl:call-template>
					</div>
					<div class="sty1120REITSLAmt sty1120REIT-bg">
						&nbsp;
					</div>
					<div class="sty1120REITSLAmt">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/AdditionalPaidInCapitalEOYAmt"/>
						</xsl:call-template>
					</div>
				</div>
				<!-- Schedule L, Line 22 -->
				<div class="styStdDiv">
					<div class="styLNLeftNumBox">22</div>
					<div class="sty1120REITShortDesc">
						Retained earnings&mdash;Appropriated (attach statement)
						<span class="sty1120REITDotLn">.</span>
					</div>
					<div class="sty1120REITSLAmt sty1120REIT-bg">
						<xsl:call-template name="SetFormLinkInline">
							<xsl:with-param name="TargetNode" select="$FormData/RetainedEarningsApprBOYAmt"/>
						</xsl:call-template>
						&nbsp;
					</div>
					<div class="sty1120REITSLAmt">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/RetainedEarningsApprBOYAmt"/>
						</xsl:call-template>
					</div>
					<div class="sty1120REITSLAmt sty1120REIT-bg">
						<xsl:call-template name="SetFormLinkInline">
							<xsl:with-param name="TargetNode" select="$FormData/RetainedEarningsApprEOYAmt"/>
						</xsl:call-template>
						&nbsp;
					</div>
					<div class="sty1120REITSLAmt">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/RetainedEarningsApprEOYAmt"/>
						</xsl:call-template>
					</div>
				</div>
				<!-- Schedule L, Line 23 -->
				<div class="styStdDiv">
					<div class="styLNLeftNumBox">23</div>
					<div class="sty1120REITShortDesc">
						Retained earnings&mdash;Unappropriated
						<span class="sty1120REITDotLn">......</span>
					</div>
					<div class="sty1120REITSLAmt sty1120REIT-bg">
						&nbsp;
					</div>
					<div class="sty1120REITSLAmt">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/RetainedEarningsUnapprBOYAmt"/>
						</xsl:call-template>
					</div>
					<div class="sty1120REITSLAmt sty1120REIT-bg">
						&nbsp;
					</div>
					<div class="sty1120REITSLAmt">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/RetainedEarningsUnapprEOYAmt"/>
						</xsl:call-template>
					</div>
				</div>
				<!-- Schedule L, Line 24 -->
				<div class="styStdDiv">
					<div class="styLNLeftNumBox">24</div>
					<div class="sty1120REITShortDesc">
						Adjustments to shareholders' equity <br /> (see instructions&mdash;attach statement)
						<span class="sty1120REITDotLn">.....</span>
					</div>
					<div class="sty1120REITSLAmt sty1120REIT-bg"><br />
						<xsl:call-template name="SetFormLinkInline">
							<xsl:with-param name="TargetNode" select="$FormData/AdjustmentToShrEqtyBOYAmt"/>
						</xsl:call-template>
						&nbsp;
					</div>
					<div class="sty1120REITSLAmt"><br />
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/AdjustmentToShrEqtyBOYAmt"/>
						</xsl:call-template>
					</div>
					<div class="sty1120REITSLAmt sty1120REIT-bg"><br />
						<xsl:call-template name="SetFormLinkInline">
							<xsl:with-param name="TargetNode" select="$FormData/AdjustmentToShrEqtyEOYAmt"/>
						</xsl:call-template>
						&nbsp;
					</div>
					<div class="sty1120REITSLAmt"><br />
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/AdjustmentToShrEqtyEOYAmt"/>
						</xsl:call-template>
					</div>
				</div>
				<!-- Schedule L, Line 25 -->
				<div class="styStdDiv">
					<div class="styLNLeftNumBox">25</div>
					<div class="sty1120REITShortDesc">
						Less cost of treasury stock
						<span class="sty1120REITDotLn">.........</span>
					</div>
					<div class="sty1120REITSLAmt sty1120REIT-bg">
						&nbsp;
					</div>
					<div class="sty1120REITSLAmt">
						<xsl:call-template name="PopulateNegativeNumber">
							<xsl:with-param name="TargetNode" select="$FormData/CostOfTreasuryStockBOYAmt"/>
						</xsl:call-template>
					</div>
					<div class="sty1120REITSLAmt sty1120REIT-bg">
						&nbsp;
					</div>
					<div class="sty1120REITSLAmt">
						<xsl:call-template name="PopulateNegativeNumber">
							<xsl:with-param name="TargetNode" select="$FormData/CostOfTreasuryStockEOYAmt"/>
						</xsl:call-template>
					</div>
				</div>
				<!-- Schedule L, Line 26 -->
				<div class="styStdDiv">
					<div class="styLNLeftNumBox">26</div>
					<div class="sty1120REITShortDesc">
						Total liabilities and shareholders' equity
						<span class="sty1120REITDotLn">.....</span>
					</div>
					<div class="sty1120REITSLAmt sty1120REIT-nbb sty1120REIT-bg">
						&nbsp;
					</div>
					<div class="sty1120REITSLAmt sty1120REIT-nbb">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/TotalLiabilitiesShrEqtyBOYAmt"/>
						</xsl:call-template>
					</div>
					<div class="sty1120REITSLAmt sty1120REIT-nbb sty1120REIT-bg">
						&nbsp;
					</div>
					<div class="sty1120REITSLAmt sty1120REIT-nbb">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/TotalLiabilitiesShrEqtyEOYAmt"/>
						</xsl:call-template>
					</div>
				</div>
				<div class="styStdDiv" style="font-size:8pt;border-top:1px solid black;border-bottom:1px solid black;">
					<div class="styPartName" style="width:22mm;">Schedule M-1</div> 
					<div class="styPartDesc" style="width:160mm;">
						Reconciliation of Income (Loss) per Books With Income per Return
						<span style="font-weight:normal;">(see instructions)</span>
					</div>
				</div>
				<!-- Left half -->
				<div class="styGenericDiv" style="width:93.4mm;border-right:1px solid black;">
					<!-- Schedule M-1, Line 1 -->
					<div class="styStdDiv" style="width:100%;">
						<div class="styLNLeftNumBoxSD">1</div>
						<div class="sty1120REITSchMDesc">
							Net income (loss) per books
							<span class="sty1120REITDotLn">.....</span>
						</div>
						<div class="sty1120REITSLAmt">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/IRS1120REITScheduleM1Grp/NetIncomeLossPerBooksAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Schedule M-1, Line 2a -->
					<div class="styStdDiv" style="width:100%;">
						<div class="styLNLeftNumBoxSD">2a</div>
						<div class="sty1120REITSchMDesc">
							Federal income tax
							<!--<span class="sty1120REITDotLn">...</span>-->
							<span class="sty1120REITSMField"><span style="float:left;">$</span>
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/IRS1120REITScheduleM1Grp/FederalIncomeTaxPerBooksAmt"/>
								</xsl:call-template>
							</span>
						</div>
						<div class="sty1120REITSLAmt sty1120REIT-bg sty1120REIT-nbb" style="height:4.2mm;">&nbsp;</div>
					</div>
					<!-- Schedule M-1, Line 2b -->
					<div class="styStdDiv" style="width:100%;">
						<div class="styLNLeftNumBoxSD" style="padding-left:4.2mm;">b</div>
						<div class="sty1120REITSchMDesc">
							Less: Section 856(c)(7) tax, 856(g)(5) tax, <br />
							857(b)(5) tax, section 857(b)(7) tax, and <br />
							built-in gains tax
							<span class="sty1120REITDotLn" style="float:none;">.</span>
							<span class="sty1120REITSMField" style="width:28mm;"><span style="float:left;">$</span>
								<xsl:call-template name="PopulateNegativeNumber">
									<xsl:with-param name="TargetNode" select="$FormData/IRS1120REITScheduleM1Grp/FederalIncomeTaxLessGainsAmt"/>
								</xsl:call-template>
							</span>
						</div>
						<div class="sty1120REITSLAmt sty1120REIT-bg sty1120REIT-nbb"><br /><br />&nbsp;</div>
					</div>
					<!-- Schedule M-1, Line 2c -->
					<div class="styStdDiv" style="width:100%;">
						<div class="styLNLeftNumBoxSD" style="padding-left:4.2mm;">c</div>
						<div class="sty1120REITSchMDesc">
							Balance
							<span class="sty1120REITDotLn">.........</span>
						</div>
						<div class="sty1120REITSLAmt">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/IRS1120REITScheduleM1Grp/FederalIncomeTaxBalanceAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Schedule M-1, Line 3 -->
					<div class="styStdDiv" style="width:100%;">
						<div class="styLNLeftNumBoxSD">3</div>
						<div class="sty1120REITSchMDesc">
							Excess of capital losses over capital gains
							<span class="sty1120REITDotLn">.</span>
						</div>
						<div class="sty1120REITSLAmt">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/IRS1120REITScheduleM1Grp/ExcessCapLossesOverCapGainsAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Schedule M-1, Line 4 -->
					<div class="styStdDiv" style="width:100%;">
						<div class="styLNLeftNumBoxSD">4</div>
						<div class="sty1120REITSchMDesc">
							Income subject to tax not recorded on books <br />
							this year (itemize):
							<!--<span class="sty1120REITDotLn" style="float:none;">..</span>-->
							<span class="sty1120REITSMField">
								<xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode" select="$FormData/IRS1120REITScheduleM1Grp/TotalTaxableIncmNotRecOnBksAmt"/>
								</xsl:call-template>
								&nbsp;
							</span>
						</div>
						<div class="sty1120REITSLAmt sty1120REIT-bg sty1120REIT-nbb" style="min-height:3mm;"/>
						<div class="sty1120REITSLAmt">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/IRS1120REITScheduleM1Grp/TotalTaxableIncmNotRecOnBksAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Schedule M-1, Line 5 -->
					<div class="styStdDiv" style="width:100%;">
						<div class="styLNLeftNumBoxSD">5</div>
						<div class="sty1120REITSchMDesc">
							Expenses recorded on books this year <br /> 
							not deducted on this return (itemize):
							<!--<span class="sty1120REITDotLn" style="float:none;">..</span>-->
						</div>
						<div class="sty1120REITSLAmt sty1120REIT-bg sty1120REIT-nbb"><br />&nbsp;</div>
					</div>
					<!-- Schedule M-1, Line 5a -->
					<div class="styStdDiv" style="width:100%;">
						<div class="styLNLeftNumBoxSD" style="padding-left:4.2mm;">a</div>
						<div class="sty1120REITSchMDesc">
							Depreciation
							<span class="sty1120REITDotLn" style="float:none;">...</span>
							<span class="sty1120REITSMField"><span style="float:left;">$</span>
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/IRS1120REITScheduleM1Grp/DepreciationExpensesAmt"/>
								</xsl:call-template>
							</span>
						</div>
						<div class="sty1120REITSLAmt sty1120REIT-bg sty1120REIT-nbb" style="height:4.2mm;">&nbsp;</div>
					</div>
					<!-- Schedule M-1, Line 5b -->
					<div class="styStdDiv" style="width:100%;">
						<div class="styLNLeftNumBoxSD" style="padding-left:4.2mm;">b</div>
						<div class="sty1120REITSchMDesc">
							Section 4981 tax
							<span class="sty1120REITDotLn" style="float:none;">.</span>
							<span class="sty1120REITSMField"><span style="float:left;">$</span>
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/IRS1120REITScheduleM1Grp/Section4981TaxAmt"/>
								</xsl:call-template>
							</span>
						</div>
						<div class="sty1120REITSLAmt sty1120REIT-bg sty1120REIT-nbb" style="height:4.2mm;">&nbsp;</div>
					</div>
					<!-- Schedule M-1, Line 5c -->
					<div class="styStdDiv" style="width:100%;">
						<div class="styLNLeftNumBoxSD" style="padding-left:4.2mm;">c</div>
						<div class="sty1120REITSchMDesc">
							<span style="font-family:Arial;">Travel and entertainment</span>
							<!--<span class="sty1120REITDotLn">.</span>-->
							<span class="sty1120REITSMField"><span style="float:left;">$</span>
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/IRS1120REITScheduleM1Grp/TravelEntertainmentAmt"/>
								</xsl:call-template>
							</span>
						</div>
						<div class="sty1120REITSLAmt sty1120REIT-bg sty1120REIT-nbb">&nbsp;</div>
					</div>
					<div class="styStdDiv" style="width:100%;">
						<div class="styLNLeftNumBoxSD" style="padding-left:4.2mm;">&nbsp;</div>
						<div class="sty1120REITSchMDesc" style="border-bottom:1px dashed black;">
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$FormData/IRS1120REITScheduleM1Grp/TotalExpensesNotDeductedAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty1120REITSLAmt">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/IRS1120REITScheduleM1Grp/TotalExpensesNotDeductedAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Schedule M-1, Line 6 -->
					<div class="styStdDiv" style="width:100%;">
						<div class="styLNLeftNumBoxSD">6</div>
						<div class="sty1120REITSchMDesc">
							Add lines 1 through 5
							<span class="sty1120REITDotLn">.......</span>
						</div>
						<div class="sty1120REITSLAmt sty1120REIT-nbb">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/IRS1120REITScheduleM1Grp/IncomeExpensesSubtotalAmt"/>
							</xsl:call-template>
						</div>
					</div>
				</div>
				<!-- Right half -->
				<div class="styGenericDiv" style="width:93.2mm;">
					<!-- Schedule M-1, Line 7 -->
					<div class="styStdDiv" style="width:100%;">
						<div class="styLNLeftNumBoxSD">7</div>
						<div class="sty1120REITSchMDesc">
							Income recorded on books this year <br /> 
							not included on this return (itemize):
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$FormData/IRS1120REITScheduleM1Grp/TotIncmRecordedNotIncludedAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty1120REITSLAmt sty1120REIT-bg sty1120REIT-nbb"><br />&nbsp;</div>
					</div>
					<div class="styStdDiv" style="width:100%;">
						<div class="styLNLeftNumBoxSD">&nbsp;</div>
						<div class="sty1120REITSchMDesc">
							Tax-exempt interest
							<span class="sty1120REITSMField"><span style="float:left;">$</span>
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/IRS1120REITScheduleM1Grp/TaxExemptInterestAmt"/>
								</xsl:call-template>
							</span>
						</div>
						<div class="sty1120REITSLAmt" style="height:4.2mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/IRS1120REITScheduleM1Grp/TotIncmRecordedNotIncludedAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Schedule M-1, Line 8 -->
					<div class="styStdDiv" style="width:100%;">
						<div class="styLNLeftNumBoxSD">8</div>
						<div class="sty1120REITSchMDesc">
							Deductions on this return not <br />
							charged against book income this <br /> year (itemize):
						</div>
						<div class="sty1120REITSLAmt sty1120REIT-bg sty1120REIT-nbb"><br /><br />&nbsp;</div>
					</div>
					<!-- Schedule M-1, Line 8a -->
					<div class="styStdDiv" style="width:100%;">
						<div class="styLNLeftNumBoxSD" style="padding-left:4.2mm;">a</div>
						<div class="sty1120REITSchMDesc">
							Depreciation
							<span class="sty1120REITDotLn" style="float:none;">...</span>
							<span class="sty1120REITSMField"><span style="float:left;">$</span>
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/IRS1120REITScheduleM1Grp/DepreciationDeductionAmt"/>
								</xsl:call-template>
							</span>
						</div>
						<div class="sty1120REITSLAmt sty1120REIT-bg sty1120REIT-nbb" style="height:4.2mm;">&nbsp;</div>
					</div>
					<!-- Schedule M-1, Line 8b -->
					<div class="styStdDiv" style="width:100%;">
						<div class="styLNLeftNumBoxSD" style="padding-left:4.2mm;">b</div>
						<div class="sty1120REITSchMDesc">
							Net operating loss deduction (Part I, <br />line 22a)
							<span class="sty1120REITDotLn" style="float:none;">....</span>
							<span class="sty1120REITSMField"><span style="float:left;">$</span>
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/NetOperatingLossDeductionAmt"/>
								</xsl:call-template>
							</span>
						</div>
						<div class="sty1120REITSLAmt sty1120REIT-bg sty1120REIT-nbb" style="height:7.2mm;">&nbsp;</div>
					</div>
					<!-- Schedule M-1, Line 8c -->
					<div class="styStdDiv" style="width:100%;">
						<div class="styLNLeftNumBoxSD" style="padding-left:4.2mm;">c</div>
						<div class="sty1120REITSchMDesc">
							Deduction for dividends paid (Part I, <br />line 22b)
							<span class="sty1120REITDotLn" style="float:none;">....</span>
							<span class="sty1120REITSMField"><span style="float:left;">$</span>
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/TotalDeductionDividendsPaidAmt"/>
								</xsl:call-template>
							</span>
						</div>
						<div class="sty1120REITSLAmt sty1120REIT-bg sty1120REIT-nbb" style="min-height:4mm;"></div>
						<div class="sty1120REITSLAmt">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/IRS1120REITScheduleM1Grp/TotalDeductionsAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Schedule M-1, Line 9 -->
					<div class="styStdDiv" style="width:100%;">
						<div class="styLNLeftNumBoxSD">9</div>
						<div class="sty1120REITSchMDesc">
							Net income from foreclosure property
							<span class="sty1120REITDotLn">..</span>
						</div>
						<div class="sty1120REITSLAmt">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/IRS1120REITScheduleM1Grp/NetIncomeForeclosurePropAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Schedule M-1, Line 10 -->
					<div class="styStdDiv" style="width:100%;">
						<div class="styLNLeftNumBox">10</div>
						<div class="sty1120REITSchMDesc">
							Net income from prohibited transactions
							<span class="sty1120REITDotLn">.</span>
						</div>
						<div class="sty1120REITSLAmt">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/IRS1120REITScheduleM1Grp/NetIncomeProhibitedTransTaxAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Schedule M-1, Line 11 -->
					<div class="styStdDiv" style="width:100%;">
						<div class="styLNLeftNumBox">11</div>
						<div class="sty1120REITSchMDesc">
							Add lines 7 through 10
							<span class="sty1120REITDotLn">.....</span>
						</div>
						<div class="sty1120REITSLAmt">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/IRS1120REITScheduleM1Grp/IncomeDeductionsSubtotalAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Schedule M-1, Line 12 -->
					<div class="styStdDiv" style="width:100%;">
						<div class="styLNLeftNumBox">12</div>
						<div class="sty1120REITSchMDesc">
							REIT taxable income (Part I, line 23) <br />
							&mdash;line 6 less line 11
							<span class="sty1120REITDotLn">.....</span>
						</div>
						<div class="sty1120REITSLAmt sty1120REIT-bg sty1120REIT-nbb" style="min-height:4mm;"/>
						<div class="sty1120REITSLAmt sty1120REIT-nbb">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/REITTaxableIncomeAmt"/>
							</xsl:call-template>
						</div>
					</div>
				</div>
				<div class="styStdDiv" style="font-size:8pt;border-top:1px solid black;border-bottom:1px solid black;">
					<div class="styPartName" style="width:22mm;">Schedule M-2</div> 
					<div class="styPartDesc" style="width:160mm;">
						Analysis of Unappropriated Retained Earnings per Books (Schedule L, line 23)
					</div>
				</div>
				<!-- Left half -->
				<div class="styGenericDiv" style="width:93.4mm;border-right:1px solid black;">
					<!-- Schedule M-2, Line 1 -->
					<div class="styStdDiv" style="width:100%;">
						<div class="styLNLeftNumBoxSD">1</div>
						<div class="sty1120REITSchMDesc">
							Balance at beginning of year
							<span class="sty1120REITDotLn">.....</span>
						</div>
						<div class="sty1120REITSLAmt">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/IRS1120REITScheduleM2Grp/BeginningYearBalanceAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Schedule M-2, Line 2 -->
					<div class="styStdDiv" style="width:100%;">
						<div class="styLNLeftNumBoxSD">2</div>
						<div class="sty1120REITSchMDesc">
							Net income (loss) per books
							<span class="sty1120REITDotLn">.....</span>
						</div>
						<div class="sty1120REITSLAmt">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/IRS1120REITScheduleM2Grp/NetIncomeLossPerBooksAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Schedule M-2, Line 3 -->
					<div class="styStdDiv" style="width:100%;">
						<div class="styLNLeftNumBoxSD">3</div>
						<div class="sty1120REITSchMDesc">
							Other increases (itemize):
							<span class="sty1120REITSMField" style="width:24mm;">&nbsp;</span><br />
							<span style="border-bottom:1px dashed black;width:100%">&nbsp;</span>
						</div>
						<div class="sty1120REITSLAmt sty1120REIT-bg sty1120REIT-nbb" style="height:8mm;">&nbsp;</div>
					</div>
					<div class="styStdDiv" style="width:100%;">
						<div class="styLNLeftNumBoxSD" style="padding-left:4.2mm;">&nbsp;</div>
						<div class="sty1120REITSchMDesc" style="border-bottom:1px dashed black;">
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$FormData/IRS1120REITScheduleM2Grp/TotalOtherIncreasesAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty1120REITSLAmt">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/IRS1120REITScheduleM2Grp/TotalOtherIncreasesAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Schedule M-2, Line 4 -->
					<div class="styStdDiv" style="width:100%;">
						<div class="styLNLeftNumBoxSD">4</div>
						<div class="sty1120REITSchMDesc">
							Add lines 1, 2, and 3
							<span class="sty1120REITDotLn">.....</span>
						</div>
						<div class="sty1120REITSLAmt sty1120REIT-nbb">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/IRS1120REITScheduleM2Grp/BalanceIncomeOtherIncreasesAmt"/>
							</xsl:call-template>
						</div>
					</div>
				</div>
				<!-- Right half -->
				<div class="styGenericDiv" style="width:93.2mm;">
					<!-- Schedule M-2, Line 5a -->
					<div class="styStdDiv" style="width:100%;">
						<div class="styLNLeftNumBoxSD">5</div>
						<div class="sty1120REITSchMDesc">
							<span style="width:30mm;">Distributions: </span>
							<strong>a </strong> Cash
							<span class="sty1120REITDotLn">....</span>
						</div>
						<div class="sty1120REITSLAmt">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/IRS1120REITScheduleM2Grp/CashDistributionAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Schedule M-2, Line 5b -->
					<div class="styStdDiv" style="width:100%;">
						<div class="styLNLeftNumBoxSD">&nbsp;</div>
						<div class="sty1120REITSchMDesc">
							<span style="width:30mm;">&nbsp;</span>
							<strong>b </strong> Stock
							<span class="sty1120REITDotLn">....</span>
						</div>
						<div class="sty1120REITSLAmt">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/IRS1120REITScheduleM2Grp/StockDistributionAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Schedule M-2, Line 5c -->
					<div class="styStdDiv" style="width:100%;">
						<div class="styLNLeftNumBoxSD">&nbsp;</div>
						<div class="sty1120REITSchMDesc">
							<span style="width:30mm;">&nbsp;</span>
							<strong>c </strong> Property
							<span class="sty1120REITDotLn">...</span>
						</div>
						<div class="sty1120REITSLAmt">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/IRS1120REITScheduleM2Grp/PropertyDistributionAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Schedule M-f2, Line 6 -->
					<div class="styStdDiv" style="width:100%;">
						<div class="styLNLeftNumBoxSD">6</div>
						<div class="sty1120REITSchMDesc">
							Other decreases (itemize):
							<span class="sty1120REITSMField" style="width:23mm;">
								<xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode" select="$FormData/IRS1120REITScheduleM2Grp/TotalOtherDecreasesAmt"/>
								</xsl:call-template>
							</span>
						</div>
						<div class="sty1120REITSLAmt">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/IRS1120REITScheduleM2Grp/TotalOtherDecreasesAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Schedule M-2, Line 7 -->
					<div class="styStdDiv" style="width:100%;">
						<div class="styLNLeftNumBoxSD">7</div>
						<div class="sty1120REITSchMDesc">
							Add lines 5 and 6
							<span class="sty1120REITDotLn">.......</span>
						</div>
						<div class="sty1120REITSLAmt">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/IRS1120REITScheduleM2Grp/DistributionsOtherDecreasesAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Schedule M-2, Line 8 -->
					<div class="styStdDiv" style="width:100%;">
						<div class="styLNLeftNumBoxSD">8</div>
						<div class="sty1120REITSchMDesc">
							Balance at end of year (line 4 less line 7)
							<!--<span class="sty1120REITDotLn">.....</span>-->
						</div>
						<div class="sty1120REITSLAmt sty1120REIT-nbb">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/IRS1120REITScheduleM2Grp/EndYearBalanceAmt"/>
							</xsl:call-template>
						</div>
					</div>
				</div>
				<div class="pageEnd" style="width:187mm;border-top:1px solid black;clear:both;">
					<span style="float:right;">
						Form <span class="styBoldText" style="font-size:8pt;">1120-REIT</span> (2025)
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
						<xsl:with-param name="TargetNode" select="$FormData/@shortPeriodReasonCd"/>
						<xsl:with-param name="Desc">Top Left Header - Short Period Reason Code</xsl:with-param>
					</xsl:call-template>
					<xsl:call-template name="PopulateLeftoverRow">
						<xsl:with-param name="TargetNode" select="$FormData/AmendedReturnInd/@filedPursuantToSect30191002Cd"/>
						<xsl:with-param name="Desc">Box F, (4) - Code</xsl:with-param>
					</xsl:call-template>
					<xsl:call-template name="PopulateLeftoverRow">
						<xsl:with-param name="Desc">Line 7 - Other Income Description</xsl:with-param>
						<xsl:with-param name="TargetNode" select="$FormData/OtherIncomeAmt/@otherIncomeDesc"/>
					</xsl:call-template>
					<xsl:call-template name="PopulateLeftoverRowAmount">
						<xsl:with-param name="TargetNode" select="$FormData/OtherCreditPaymentAmt/@backupWithholdingAmt"/>
						<xsl:with-param name="Desc">Part I, Line 27z - Backup Withholding Amount</xsl:with-param>
					</xsl:call-template>
					<xsl:call-template name="PopulateLeftoverRow">
						<xsl:with-param name="TargetNode" select="$FormData/OtherCreditPaymentAmt/@backupWithholdingTypeCd"/>
						<xsl:with-param name="Desc">Part I, Line 27z - Backup Withholding Type</xsl:with-param>
					</xsl:call-template>
					<xsl:call-template name="PopulateLeftoverRow">
						<xsl:with-param name="TargetNode" select="$FormData/PrntCorporationNameControlTxt"/>
						<xsl:with-param name="Desc">Schedule K, Line 3 - Parent Corporation Name Control</xsl:with-param>
					</xsl:call-template>
				</table>
				<br/>
			</body>
		</html>
	</xsl:template>
</xsl:stylesheet>