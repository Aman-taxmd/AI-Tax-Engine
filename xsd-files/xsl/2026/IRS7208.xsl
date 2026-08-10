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
	<xsl:include href="IRS7208Style.xsl"/>
	<xsl:output method="html" indent="yes"/>
	<xsl:strip-space elements="*"/>
	<xsl:param name="FormData" select="$RtnDoc/IRS7208"/>
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
				<meta http-equiv="Content-Type" content="text/html; charset=ISO-7208-1"/>
				<meta name="Description" content="IRS Form 7208"/>
				<script language="JavaScript" src="{$ScriptPath}/FormDisplay.js" type="text/javascript"/>
				<xsl:call-template name="InitJS"/>
				<style type="text/css">
					<xsl:if test="not($Print) or $Print=''">
						<xsl:call-template name="IRS7208Style"/>
						<xsl:call-template name="AddOnStyle"/>
					</xsl:if>
				</style>
				<xsl:call-template name="GlobalStylesForm"/>
			</head>
			<body class="styBodyClass">
				<form id="Form7208">
					<xsl:call-template name="DocumentHeader"/>
					<!-- Page 1 -->
					<!-- Header -->
					<div class="styStdDiv">
						<div class="styFNBox" style="width:30mm;height:20mm;">
							Form <span class="styFN" style="font-size:18pt;">7208</span>
							<br/>
							<span class="styAgency">
								(April 2024)
							</span>
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$FormData"/>
							</xsl:call-template>
							<br/>
							<br/>
							<span class="styAgency">
								Department of the Treasury <br/>
								Internal Revenue Service
							</span>
						</div>
						<div class="styFTBox" style="width:125mm;height:20mm;">
							<span class="styFMT" style="font-size:11pt;padding-top:1mm;padding-bottom:1mm;">
							Excise Tax on Repurchase of Corporate Stock</span>
							<br/>
							For calendar year
							<span style="width:8mm;border-bottom:1px solid black;">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$FormData/TaxYr"/>
								</xsl:call-template>
							</span>
							or tax year beginning
							<span style="width: 19mm;border-bottom:1px solid black;">
								<xsl:call-template name="PopulateMonthDayYear">
									<xsl:with-param name="TargetNode" select="$FormData/FiscalYearDateGrp/TaxPeriodBeginDt"/>
								</xsl:call-template>
							</span>,
							<br/>
							and ending 
							<span style="width:19mm;border-bottom:1px solid black;">
								<xsl:call-template name="PopulateMonthDayYear">
									<xsl:with-param name="TargetNode" select="$FormData/FiscalYearDateGrp/TaxPeriodEndDt"/>
								</xsl:call-template>
							</span>.
							<br/>
							<span style="font-weight:bold;">
								Attach to Form 720.
							</span>
							<br/>
							<span style="font-weight:bold;">
								Go to
								<span style="font-style:italic">www.irs.gov/Form7208</span>
								for instructions the latest information.
							</span>
						</div>
						<div class="styTYBox" style="width:32mm;height:20mm;">
							<div class="styOMB" style="padding-top:8mm;height:auto;font-size:6pt;border-bottom-width:0px;">OMB No. 1545-XXXX</div>
						</div>
					</div>
					<!-- Filer information section -->
					<div class="styStdDiv" style="border-top:1px solid black;border-bottom:1px solid black;">
						<div class="styNameBox" style="width:125mm;">
							Name<br/>
							<xsl:call-template name="PopulateReturnHeaderFiler">
								<xsl:with-param name="TargetNode">BusinessNameLine1Txt</xsl:with-param>
							</xsl:call-template>
							<br/>
							<xsl:call-template name="PopulateReturnHeaderFiler">
								<xsl:with-param name="TargetNode">BusinessNameLine2Txt</xsl:with-param>
							</xsl:call-template>
						</div>
						<div class="styEINBox" style="width:62mm;padding-left:0.5mm;font-weight:normal;">
							Employer identification number (EIN)<br/>
							<xsl:call-template name="PopulateReturnHeaderFilerTIN"/>
						</div>
					</div>
					<!-- Part 1 -->
					<div class="styStdDiv" style="border-bottom:1px solid black;padding-top:2mm;padding-bottom:2mm;">
						<div class="styPartName">Part I</div>
						<div class="styPartDesc" style="width:167mm;height:auto;font-weight:normal;">
							<strong>Total Stock Repurchases </strong>(see instructions)
						</div>
						<div style="float:right;width:4mm;height:3mm;">
							<xsl:call-template name="SetDynamicTableToggleButton">
								<xsl:with-param name="TargetNode" select="$FormData/TotalStockRepurchasesGrp"/>
								<xsl:with-param name="containerID" select=" 'Part1Table' "/>
								<xsl:with-param name="headerHeight" select="2"/>
								<xsl:with-param name="containerHeight" select="11"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Table 1, cols (a)-(h) -->
					<xsl:variable name="shouldSeparateP1" select="($Print = $Separated) and (count($FormData/TotalStockRepurchasesGrp) &gt; 11)"/>
					<div class="styStdDiv" style="" id="Part1Table">
						<xsl:call-template name="SetInitialState"/>
						<table style="display:table;border-collapse:collapse;">
							<thead class="styTableThead">
								<tr>
									<th class="styIRS7208TableCellHeader" scope="col" style="width:52mm;font-weight:normal;">
										<strong>1(a)</strong> If repurchasing or acquiring entity is one other than the entry listed above, enter its name
									</th>
									<th class="styIRS7208TableCellHeader" scope="col" style="width:25mm;font-weight:normal;">
										<strong>(b)</strong> If repurchasing or acquiring entity is one other than the entity listed above, enter its EIN
									</th>
									<th class="styIRS7208TableCellHeader" scope="col" style="width:30mm;font-weight:normal;">
										<strong>(c)</strong> Type of <br/> transaction
									</th>
									<th class="styIRS7208TableCellHeader" scope="col" style="width:22mm;font-weight:normal;">
										<strong>(d)</strong> Stock <br/> symbol
									</th>
									<th class="styIRS7208TableCellHeader" scope="col" style="width:23mm;font-weight:normal;">
										<strong>(e)</strong> Class <br/> of stock
									</th>
									<th class="styIRS7208TableCellHeader" scope="col" style="width:25mm;font-weight:normal;">
										<strong>(f)</strong> Trading <br/> exchange
									</th>
									<th class="styIRS7208TableCellHeader" scope="col" style="width:30mm;font-weight:normal;">
										<strong>(g)</strong> Number <br/> of shares
									</th>
									<th class="styIRS7208TableCellHeader" scope="col" style="width:32mm;font-weight:normal;border-right-width:0px;">
										<strong>(h)</strong> Total fair market <br/> value (FMV) of <br/>
										repurchased shares
									</th>
								</tr>
							</thead>
							<tbody style="font-size:6pt;">
								<xsl:if test="not($shouldSeparateP1)">
									<xsl:for-each select="$FormData/TotalStockRepurchasesGrp">
										<tr style="height:7.5mm;vertical-align:bottom;">
											<td class="styTableCellTextInherit">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="RepurchaserName/BusinessNameLine1Txt"/>
												</xsl:call-template>
												<xsl:if test="RepurchaserName/BusinessNameLine2Txt">
													<br/>
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="RepurchaserName/BusinessNameLine2Txt"/>
													</xsl:call-template>
												</xsl:if>
											</td>
											<td class="styTableCellCtrInherit">
												<xsl:call-template name="PopulateEIN">
													<xsl:with-param name="TargetNode" select="RepurchaserEIN"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellTextInherit">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="StockTransactionTypeCd"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellTextInherit">
												<xsl:choose>
													<xsl:when test="TradingSymbolDesc">
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="TradingSymbolDesc"/>
														</xsl:call-template>
													</xsl:when>
													<xsl:when test="CUSIPNum">
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="CUSIPNum"/>
														</xsl:call-template>
													</xsl:when>
													<xsl:otherwise>
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="CINS"/>
														</xsl:call-template>
													</xsl:otherwise>
												</xsl:choose>
											</td>
											<td class="styTableCellTextInherit">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="StockClassDesc"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellTextInherit">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="TradingExchangeTxt"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellAmtInherit">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="SharesCnt"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellAmtInherit" style="border-right-width:0px;">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="TotalFairMarketValueAmt"/>
												</xsl:call-template>
											</td>
										</tr>
									</xsl:for-each>
								</xsl:if>
								<xsl:if test="$shouldSeparateP1 or count($FormData/TotalStockRepurchasesGrp) &lt; 11">
									<xsl:call-template name="FillTable8Cols">
										<xsl:with-param name="LineNumber" select="1 + count($FormData/TotalStockRepurchasesGrp)"/>
										<xsl:with-param name="SepMessage" select="$shouldSeparateP1"/>
									</xsl:call-template>
								</xsl:if>
							</tbody>
						</table>
					</div>
					<xsl:if test="not($shouldSeparateP1)">
						<xsl:call-template name="SetInitialDynamicTableHeight">
							<xsl:with-param name="TargetNode" select="$FormData/TotalStockRepurchasesGrp"/>
							<xsl:with-param name="containerID" select=" 'Part1Table' "/>
							<xsl:with-param name="headerHeight" select="2"/>
							<xsl:with-param name="containerHeight" select="11"/>
						</xsl:call-template>
					</xsl:if>
					<div class="styStdIBDiv">
						<div class="styLNLeftNumBox" style="height:9mm;padding-top:4mm;">2</div>
						<div class="styLNDesc" style="height:9mm;padding-top:4mm;">
							Total from attachment, if necessary
							<span class="sty7208DotLn">......................</span>
						</div>
						<div class="styLNRightNumBox" style="height:9mm;padding-top:4mm;">
							2</div>
						<div class="styLNAmountBox" style="height:9mm;padding-top:4mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TotalTradeOrBusinessLossAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 3 -->
					<div class="styStdIBDiv" style="">
						<div class="styLNLeftNumBox" style="height:9mm;padding-top:4mm;">3</div>
						<div class="styLNDesc" style="height:9mm;padding-top:4mm;">
							Add amounts in column (h) and enter here. If filer is an applicable specified affiliate, see instructions.
							<span class="sty7208DotLn">..</span>
						</div>
						<div class="styLNRightNumBox" style="height:9mm;padding-top:4mm;">3</div>
						<div class="styLNAmountBox" style="height:9mm;padding-top:4mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TotalFairMarketValueAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 4 -->
					<br/>
					<div class="styStdDiv">
						<div class="styLNLeftNumBox">4</div>
						<div class="styLNDesc" style="height:7mm;">
							Were any of the repurchases shown in line 1 or line 2 with respect to stock of an applicable foreign <br/>
							corporation or a covered surrogate foreign corporation? 
							<span class="sty7208DotLn">................</span>
						</div>
						<div>
							<xsl:call-template name="PopulateSpan">
								<xsl:with-param name="TargetNode" select="$FormData/ForeignEntityRepurchasesInd"/>
                            </xsl:call-template>
							<input class="styCkbox" type="checkbox" style="margin-left:2px;margin-top:3mm" alt="Foreign Entity Repurchases Indicator Yes">
								<xsl:call-template name="PopulateYesCheckbox">
									<xsl:with-param name="TargetNode" select="$FormData/ForeignEntityRepurchasesInd"/>
									<xsl:with-param name="BackupName">IRS7208ForeignEntityRepurchasesInd</xsl:with-param>
								</xsl:call-template>
							</input>
							<span style="width:2px;"/>
							<label>
								<xsl:call-template name="PopulateLabelYes">
									<xsl:with-param name="TargetNode" select="$FormData/ForeignEntityRepurchasesInd"/>
									<xsl:with-param name="BackupName" select="IRS7208ForeignEntityRepurchasesInd"/>
								</xsl:call-template>
								Yes
							</label>
							<input class="styCkbox" type="checkbox" style="margin-left:25px;" alt="Foreign Entity Repurchases Indicator No">
								<xsl:call-template name="PopulateNoCheckbox">
									<xsl:with-param name="TargetNode" select="$FormData/ForeignEntityRepurchasesInd"/>
									<xsl:with-param name="BackupName">IRS7208ForeignEntityRepurchasesInd</xsl:with-param>
								</xsl:call-template>
							</input>
							<span style="width:4px;"/>
							<label>
								<xsl:call-template name="PopulateLabelNo">
									<xsl:with-param name="TargetNode" select="$FormData/ForeignEntityRepurchasesInd"/>
									<xsl:with-param name="BackupName" select="IRS7208ForeignEntityRepurchasesInd"/>
								</xsl:call-template>
								No
							</label>
						</div>
					</div>
					<br/>
					<div class="styStdDiv" style="padding:.5mm;">
						All filers reporting more than $1 million on line 3 must go to Part II. If you're an applicable specified affiliate reporting $1 million or less on line 3, see instructions. If you're NOT an applicable specified affiliate and reporting $1 million or less on line 3, stop here, and attach this form to Form 720.
					</div>
					<!-- Part 2 -->
					<div class="styStdDiv" style="border-top:1px solid black;padding-top:.5mm;padding-bottom:.5mm"/>
					<div class="styStdDiv" style="border-bottom:1px solid black;padding-top:1mm;padding-bottom:2mm">
						<div class="styPartName">Part II</div>
						<div class="styPartDesc" style="width:167mm;height:auto;">
							<strong>Exceptions</strong>
						</div>
					</div>
					<!-- Line 5a -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBox" style="padding-top:3mm;">5a</div>
						<div class="styLNDesc" style="height:7mm;padding-top:3mm;">
							Stock repurchases as part of a reorganization in which no gain or loss is recognized
							<span class="sty7208DotLn" style="">........</span>
						</div>
						<div class="styLNRightNumBox" style="height:7mm;">
							<br/>
							<strong>5a</strong>
						</div>
						<div class="styLNAmountBox" style="height:7mm;">
							<br/>
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/StockRepurchasesNoGainLossAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 5b -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD" style="padding-top:3mm;">b</div>
						<div class="styLNDesc" style="height:7mm;padding-top:3mm;">
							Stock repurchases treated as dividends
							<span class="sty7208DotLn">......................</span>
						</div>
						<div class="styLNRightNumBox" style="height:7mm;">
							<br/>
							<strong>5b</strong>
						</div>
						<div class="styLNAmountBox" style="height:7mm;">
							<br/>
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/StockRepurchasesDividendsAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 5c -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD" style="padding-top:3mm;">c</div>
						<div class="styLNDesc" style="height:7mm;padding-top:3mm;">
							Stock repurchases by a regulated investment company (RIC) or a real estate investment trust (REIT)
							<span class="sty7208DotLn">..</span>
						</div>
						<div class="styLNRightNumBox" style="height:7mm;">
							<br/>
							<strong>5c</strong>
						</div>
						<div class="styLNAmountBox" style="height:7mm;">
							<br/>
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/StockRepurchasesRICOrREITAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 5d -->
					<xsl:choose>
						<xsl:when test="$FormData/OtherExceptionsAmt">
							<div class="styStdDiv">
								<div class="styLNLeftNumBoxSD" style="padding-top:3mm;">d</div>
								<div class="styLNDesc" style="height:7mm;padding-top:3mm;">
							Other exceptions (see instructions)
							<span class="sty7208DotLn">......................</span>
								</div>
								<div class="styLNRightNumBox" style="height:7mm;">
									<br/>
									<strong>5d</strong>
								</div>
								<div class="styLNAmountBox" style="height:7mm;">
									<br/>
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/OtherExceptionsAmt"/>
									</xsl:call-template>
								</div>
							</div>
						</xsl:when>
						<xsl:otherwise>
							<div class="styStdDiv">
								<div class="styLNLeftNumBoxSD" style="padding-top:3mm;">d</div>
								<div class="styLNDesc" style="height:7mm;padding-top:3mm;">
							Stock repurchases by a dealer in securities in the ordinary course of business
							<span class="sty7208DotLn">..........</span>
								</div>
								<div class="styLNRightNumBox" style="height:7mm;">
									<br/>
									<strong>5d</strong>
								</div>
								<div class="styLNAmountBox" style="height:7mm;">
									<br/>
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/StockRepurchasesDealerSecAmt"/>
									</xsl:call-template>
								</div>
							</div>
						</xsl:otherwise>
					</xsl:choose>
					<!-- Line 5e -->
					<div class="styStdDiv" style="border-bottom:0px;">
						<div class="styLNLeftNumBoxSD" style="padding-top:3mm;">e</div>
						<div class="styLNDesc" style="height:7mm;padding-top:3mm;">
							<strong>Total exceptions.</strong> Add lines 5a through 5d
							<span class="sty7208DotLn">....................</span>
						</div>
						<div class="styLNRightNumBox" style="height:7mm;border-bottom:0px;">
							<br/>
							<strong>5e</strong>
						</div>
						<div class="styLNAmountBox" style="height:7mm;border-bottom:0px;">
							<br/>
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TotalExceptionsAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Form footer-->
					<div class="styStdDiv pageEnd" style="border-top:1px solid black;">
						<span style="font-weight:bold;font-family:Arial;">For Paperwork Reduction Act Notice, see the instructions.</span>
						<span style="margin-left:20mm;">Cat. No. 56401D</span>
						<span style="float:right;">Form <strong>7208</strong> (4-2024)</span>
					</div>
					<!-- Page 2 -->
					<!-- Form Header -->
					<div class="styStdDiv" style="border-bottom:2px solid black;">
						<span style="font-family:Arial;">Form 7208 (Rev. 4-2024)</span>
						<span style="float:right;font-size:8pt;">Page <strong>2</strong>
						</span>
					</div>
					<!-- Part 3 -->
					<div class="styStdDiv" style="border-bottom:1px solid black;padding-top:2mm;padding-bottom:2mm">
						<div class="styPartName">Part III</div>
						<div class="styPartDesc" style="width:167mm;height:auto;font-weight:normal;">
							<strong>Contributions to Employer-Sponsored Retirement plans</strong> (see instructions)
						</div>
						<div style="float:right;width:4mm;height:3mm;">
							<xsl:call-template name="SetDynamicTableToggleButton">
								<xsl:with-param name="TargetNode" select="$FormData/ContriEmplrSponsRetirePlansGrp"/>
								<xsl:with-param name="containerID" select=" 'Part3Table' "/>
								<xsl:with-param name="headerHeight" select="2"/>
								<xsl:with-param name="containerHeight" select="13"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Table 3, cols (a)-(e) -->
					<xsl:variable name="shouldSeparateP3" select="($Print = $Separated) and (count($FormData/ContriEmplrSponsRetirePlansGrp) &gt; 13)"/>
					<div class="styStdDiv" style="" id="Part3Table">
						<xsl:call-template name="SetInitialState"/>
						<table style="display:table;border-collapse:collapse;">
							<thead class="styTableThead" style="height:auto;">
								<tr>
									<th class="styTableCellHeader" scope="col" colspan="4" style="width:50mm;height:14mm;font-weight:normal;">
										<div style="float:left;">
											<strong>6</strong>
										</div> Repurchases  
									</th>
									<th class="styTableCellHeader" scope="col" colspan="5" style="width:50mm;font-weight:normal;border-right-width:0px;">
										Contributions  
									</th>
								</tr>
								<tr>
									<th class="styTableCellHeader" scope="col" colspan="2" style="width:25mm;font-weight:normal;">
										Repurchased Class 
									</th>
									<th class="styTableCellHeader" scope="col" colspan="2" style="width:25mm;font-weight:normal;">
										Different Class 							
									</th>
								</tr>
							</thead>
							<thead>
								<tr>
									<th class="styIRS7208TableCellHeader" scope="col" style="width:10mm;font-weight:normal;">
										<strong>(a)</strong> Class <br/> 
										of stock <br/> repurchased
									</th>
									<th class="styIRS7208TableCellHeader" scope="col" style="width:10mm;font-weight:normal;">
										<strong>(b)</strong> Number <br/>
										of shares <br/> repurchased 
									</th>
									<th class="styIRS7208TableCellHeader" scope="col" style="width:25mm;font-weight:normal;">
										<strong>(c)</strong> Aggregate <br/>
										FMV
									</th>
									<th class="styIRS7208TableCellHeader" scope="col" style="width:33mm;font-weight:normal;padding-left:1px;padding-right:1px;">
										<strong>(d)</strong> Average <br/>
										price per share <br/> (divide (c) by (b))
									</th>
									<th class="styIRS7208TableCellHeader" scope="col" style="width:21mm;font-weight:normal;">
										<strong>(e)</strong> Number <br/> of shares
									</th>
									<th class="styIRS7208TableCellHeader" scope="col" style="width:36mm;font-weight:normal;padding-left:0;padding-right:0;">
										<strong>(f)</strong> Aggregate <br/> FMV of shares <br/>
										contributed <br/> (multiply (d) by (e))
									</th>
									<th class="styIRS7208TableCellHeader" scope="col" style="width:18mm;font-weight:normal;">
										<strong>(g)</strong> Number <br/> of shares <br/> contributed
									</th>
									<th class="styIRS7208TableCellHeader" scope="col" style="width:25mm;font-weight:normal;">
										<strong>(h)</strong> Aggregate <br/> FMV of shares <br/> contributed
									</th>
									<th class="styIRS7208TableCellHeader" scope="col" style="width:32mm;font-weight:normal;border-right-width:0px;">
										<strong>(i)</strong> Aggregate value of <br/> contributions
									</th>
								</tr>
							</thead>
							<tbody style="font-size:6pt;">
								<xsl:if test="not($shouldSeparateP3)">
									<xsl:for-each select="$FormData/ContriEmplrSponsRetirePlansGrp">
										<tr style="height:7.5mm;vertical-align:bottom;">
											<td class="styTableCellTextInherit">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="StockClassDesc"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellAmtInherit">
												<xsl:call-template name="PopulateShareNumP3">
													<xsl:with-param name="TargetNode" select="SharesCnt"/>
													<xsl:with-param name="Col">(b)</xsl:with-param>
												</xsl:call-template>
											</td>
											<td class="styTableCellAmtInherit">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="AggregateFMVAmt"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellAmtInherit">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="AveragePricePerShareAmt"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellAmtInherit">
												<xsl:call-template name="PopulateShareNumP3">
													<xsl:with-param name="TargetNode" select="ContriShareRepurchasedClassGrp/SharesCnt"/>
													<xsl:with-param name="Col">(e)</xsl:with-param>
												</xsl:call-template>
											</td>
											<td class="styTableCellAmtInherit">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="ContriShareRepurchasedClassGrp/AggregateFMVAmt"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellAmtInherit">
												<xsl:call-template name="PopulateShareNumP3">
													<xsl:with-param name="TargetNode" select="ContriShareDifferentClassGrp/SharesCnt"/>
													<xsl:with-param name="Col">(g)</xsl:with-param>
												</xsl:call-template>
											</td>
											<td class="styTableCellAmtInherit">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="ContriShareDifferentClassGrp/AggregateFMVAmt"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellAmtInherit" style="border-right-width:0px;">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="AggregateContriValueAmt"/>
												</xsl:call-template>
											</td>
										</tr>
									</xsl:for-each>
								</xsl:if>
								<xsl:if test="$shouldSeparateP3 or count($FormData/ContriEmplrSponsRetirePlansGrp) &lt; 5">
									<xsl:call-template name="FillTable9Cols">
										<xsl:with-param name="LineNumber" select="1 + count($FormData/ContriEmplrSponsRetirePlansGrp)"/>
										<xsl:with-param name="SepMessage" select="$shouldSeparateP3"/>
									</xsl:call-template>
								</xsl:if>
							</tbody>
						</table>
					</div>
					<xsl:if test="not($shouldSeparateP3)">
						<xsl:call-template name="SetInitialDynamicTableHeight">
							<xsl:with-param name="TargetNode" select="$FormData/ContriEmplrSponsRetirePlansGrp"/>
							<xsl:with-param name="containerID" select=" 'Part3Table' "/>
							<xsl:with-param name="headerHeight" select="2"/>
							<xsl:with-param name="containerHeight" select="13"/>
						</xsl:call-template>
					</xsl:if>
					<!-- Line 7 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBox" style="padding-top:3mm;">7</div>
						<div class="styLNDesc" style="height:7mm;padding-top:3mm;">
							Total from attachment, if necessary
							<span class="sty7208DotLn">.......................</span>
						</div>
						<div class="styLNRightNumBox" style="height:7mm;">
							<br/>
							<strong>7</strong>
						</div>
						<div class="styLNAmountBox" style="height:7mm;">
							<br/>
							&nbsp;</div>
					</div>
					<!-- Line 8 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBox" style="padding-top:3mm;">8</div>
						<div class="styLNDesc" style="height:7mm;padding-top:3mm;">
							Add amounts in column (i) and add here
							<span class="sty7208DotLn">.....................</span>
						</div>
						<div class="styLNRightNumBox" style="height:7mm;border-bottom:0px;">
							<br/>
							<strong>8</strong>
						</div>
						<div class="styLNAmountBox" style="height:7mm;border-bottom:0px;">
							<br/>
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TotalAggregateContriValueAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Part 4 -->
					<div class="styStdDiv" style="border-top:1px solid black;padding-top:.5mm;padding-bottom:.5mm"/>
					<div class="styStdDiv" style="border-bottom:1px solid black;padding-top:1mm;padding-bottom:2mm">
						<div class="styPartName">Part IV</div>
						<div class="styPartDesc" style="width:167mm;height:auto;font-weight:normal;">
							<strong>Stock Issued or Provided</strong>
						</div>
					</div>
					<!-- Line 9a -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBox" style="padding-top:3mm;">9a</div>
						<div class="styLNDesc" style="height:7mm;padding-top:3mm;">
							Stock issued or provided to employees
							<span class="sty7208DotLn">......................</span>
						</div>
						<div class="styLNRightNumBox" style="height:7mm;">
							<br/>
							<strong>9a</strong>
						</div>
						<div class="styLNAmountBox" style="height:7mm;">
							<br/>
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/StockToEmployeesAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 9b -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD" style="padding-top:3mm;">b</div>
						<div class="styLNDesc" style="height:7mm;padding-top:3mm;">
							Stock issued or provided to employees of a specified affiliate
							<span class="sty7208DotLn">...............</span>
						</div>
						<div class="styLNRightNumBox" style="height:7mm;">
							<br/>
							<strong>9b</strong>
						</div>
						<div class="styLNAmountBox" style="height:7mm;">
							<br/>
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/StockToEmplSpcfdAffiliateAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 9c -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD" style="padding-top:3mm;">c</div>
						<div class="styLNDesc" style="height:7mm;padding-top:3mm;">
							Stock issued but not entered on line 9a or 9b
							<span class="sty7208DotLn">....................</span>
						</div>
						<div class="styLNRightNumBox" style="height:7mm;">
							<br/>
							<strong>9c</strong>
						</div>
						<div class="styLNAmountBox" style="height:7mm;">
							<br/>
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/AdditionalStockToEmployeesAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 9d -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD" style="padding-top:3mm;">d</div>
						<div class="styLNDesc" style="height:7mm;padding-top:3mm;">
							<strong>Total issuances.</strong> Add lines 9a through 9c
							<span class="sty7208DotLn">....................</span>
						</div>
						<div class="styLNRightNumBox" style="height:7mm;border-bottom:0px;">
							<br/>
							<strong>9d</strong>
						</div>
						<div class="styLNAmountBox" style="height:7mm;border-bottom:0px;">
							<br/>
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TotalStockIssuancesAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<div class="styStdDiv" style="border-top:1px solid black;padding-top:.5mm;padding-bottom:.5mm"/>
					<!-- Part 5 -->
					<div class="styStdDiv" style="border-bottom:1px solid black;padding-top:1mm;padding-bottom:2mm">
						<div class="styPartName">Part V</div>
						<div class="styPartDesc" style="width:167mm;height:auto;font-weight:normal;">
							<strong>Tax and Payments</strong>
						</div>
					</div>
					<!-- Line 10 -->
					<div class="styStdIBDiv" style="">
						<div class="styLNLeftNumBox" style="height:12mm;padding-top:4mm;">10</div>
						<div class="styLNDesc" style="height:12mm;padding-top:4mm;">
							<strong>Stock repurchases subject to tax.</strong> Subtract lines 5e, 8, and 9d from line 3. If zero lor less, enter -0- and<br/>
							see instructions. if more than zero, continue to line 11
							<span class="sty7208DotLn">.................</span>
						</div>
						<div class="styLNRightNumBox" style="height:12mm;padding-top:3.5mm;">
							<br/>
							<strong>10</strong>
						</div>
						<div class="styLNAmountBox" style="height:12mm;padding-top:3.5mm;">
							<br/>
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TotTaxableStockRepurchasesAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 11 -->
					<div class="styStdIBDiv">
						<div class="styLNLeftNumBox" style="height:12mm;padding-top:4mm;">11</div>
						<div class="styLNDesc" style="height:12mm;padding-top:4mm;">
							<strong>Excise tax on stock repurchases.</strong> Multiply line 10 by 1% (0.01). Enter here and on Form 720 on the line<br/>
							for <strong>IRS No. 150</strong>
							<span class="sty7208DotLn">.............................</span>
						</div>
						<div class="styLNRightNumBox" style="height:12mm;padding-top:3.5mm;border-bottom:0px;">
							<br/>
							<strong>11</strong>
						</div>
						<div class="styLNAmountBox" style="height:12mm;padding-top:3.5mm;border-bottom:0px;">
							<br/>
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/StockRepurchasesExciseTaxAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Page end -->
					<div class="styStdDiv pageEnd" style="border-top:1px solid black;">
						<span style="float:right;">Form <strong>7208</strong> (4-2024)</span>
					</div>
					<!-- Additonal Data Title Bar and Button -->
					<div class="styLeftOverTitleLine" id="LeftoverData">
						<div class="styLeftOverTitle">
						   Additional Data        
						</div>
						<div class="styLeftOverButtonContainer">
							<input class="styLeftoverTableBtn" type="button" TabIndex="-1" value="Return to Form" onclick="javascript:returnToWriteInImage();"/>
						</div>
					</div>
					<!-- Additional Data Table -->
					<table class="styLeftOverTbl">
						<xsl:call-template name="PopulateCommonLeftover">
							<xsl:with-param name="TargetNode" select="$FormData"/>
							<xsl:with-param name="DescWidth" select="100"/>
						</xsl:call-template>
						<xsl:for-each select="$FormData/ContriEmplrSponsRetirePlansGrp">
							<xsl:if test="string-length(SharesCnt) &gt; 10">
								<xsl:call-template name="PopulateLeftoverRow">
									<xsl:with-param name="TargetNode" select="SharesCnt"/>
									<xsl:with-param name="Desc">Part III, Line 6, col (b), row <xsl:value-of select="position()"/> - Shares</xsl:with-param>
								</xsl:call-template>
							</xsl:if>
							<xsl:if test="string-length(ContriShareRepurchasedClassGrp/SharesCnt) &gt; 10">
								<xsl:call-template name="PopulateLeftoverRow">
									<xsl:with-param name="TargetNode" select="ContriShareRepurchasedClassGrp/SharesCnt"/>
									<xsl:with-param name="Desc">Part III, Line 6, col (e), row <xsl:value-of select="position()"/> - Shares</xsl:with-param>
								</xsl:call-template>
							</xsl:if>
							<xsl:if test="string-length(ContriShareDifferentClassGrp/SharesCnt) &gt; 10">
								<xsl:call-template name="PopulateLeftoverRow">
									<xsl:with-param name="TargetNode" select="ContriShareDifferentClassGrp/SharesCnt"/>
									<xsl:with-param name="Desc">Part III, Line 6, col (g), row <xsl:value-of select="position()"/> - Shares</xsl:with-param>
								</xsl:call-template>
							</xsl:if>
						</xsl:for-each>
					</table>
					<!-- Part 1 separated table -->
					<xsl:if test="$shouldSeparateP1">
						<br/>
						<br/>
						<span class="styRepeatingDataTitle"/>
						<table class="styDepTbl" cellspacing="0" style="font-size:7pt;">
							<thead class="styTableThead">
								<tr class="styDepTblHdr">
									<th class="styDepTblCell" scope="col" style="width:52mm;font-weight:normal;">
										<strong>1(a)</strong> If repurchasing or acquiring entity is one other than the entry listed above, enter its name
									</th>
									<th class="styDepTblCell" scope="col" style="width:25mm;font-weight:normal;">
										<strong>(b)</strong> If repurchasing or acquiring entity is one other than the entity listed above, enter its EIN
									</th>
									<th class="styDepTblCell" scope="col" style="width:30mm;font-weight:normal;">
										<strong>(c)</strong> Type of <br/> transaction
									</th>
									<th class="styDepTblCell" scope="col" style="width:22mm;font-weight:normal;">
										<strong>(d)</strong> Stock <br/> symbol
									</th>
									<th class="styDepTblCell" scope="col" style="width:23mm;font-weight:normal;">
										<strong>(e)</strong> Class <br/> of stock
									</th>
									<th class="styDepTblCell" scope="col" style="width:25mm;font-weight:normal;">
										<strong>(f)</strong> Trading <br/> exchange
									</th>
									<th class="styDepTblCell" scope="col" style="width:30mm;font-weight:normal;">
										<strong>(g)</strong> Number <br/> of shares
									</th>
									<th class="styDepTblCell" scope="col" style="width:32mm;font-weight:normal;border-right-width:0px;">
										<strong>(h)</strong> Total fair market <br/> value (FMV) of <br/>
										repurchased shares
									</th>
								</tr>
							</thead>
							<tbody>
								<xsl:for-each select="$FormData/TotalStockRepurchasesGrp">
									<tr style="height:7.5mm;vertical-align:bottom;">
										<xsl:attribute name="class">
											<xsl:choose>
												<xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when>
												<xsl:otherwise>styDepTblRow2</xsl:otherwise>
											</xsl:choose>
										</xsl:attribute>
										<td class="styTableCellTextInherit">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="RepurchaserName/BusinessNameLine1Txt"/>
											</xsl:call-template>
											<xsl:if test="RepurchaserName/BusinessNameLine2Txt">
												<br/>
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="RepurchaserName/BusinessNameLine2Txt"/>
												</xsl:call-template>
											</xsl:if>
										</td>
										<td class="styTableCellCtrInherit">
											<xsl:call-template name="PopulateEIN">
												<xsl:with-param name="TargetNode" select="RepurchaserEIN"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellTextInherit">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="StockTransactionTypeCd"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellTextInherit">
											<xsl:choose>
												<xsl:when test="TradingSymbolDesc">
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="TradingSymbolDesc"/>
													</xsl:call-template>
												</xsl:when>
												<xsl:when test="CUSIPNum">
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="CUSIPNum"/>
													</xsl:call-template>
												</xsl:when>
												<xsl:otherwise>
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="CINS"/>
													</xsl:call-template>
												</xsl:otherwise>
											</xsl:choose>
										</td>
										<td class="styTableCellTextInherit">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="StockClassDesc"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellTextInherit">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="TradingExchangeTxt"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellAmtInherit">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="SharesCnt"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellAmtInherit" style="border-right-width:0px;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="TotalFairMarketValueAmt"/>
											</xsl:call-template>
										</td>
									</tr>
								</xsl:for-each>
							</tbody>
						</table>
					</xsl:if>
					<!-- Part 3 separated table -->
					<xsl:if test="$shouldSeparateP3">
						<br/>
						<br/>
						<span class="styRepeatingDataTitle"/>
						<table class="styDepTbl" cellspacing="0" style="font-size:7pt;">
							<thead class="styTableThead" style="height:auto;">
								<tr class="styDepTblHdr">
									<th class="styDepTblCell" scope="col" colspan="4" style="width:50mm;height:14mm;font-weight:normal;">
										<div style="float:left;">
											<strong>6</strong>
										</div> Repurchases  
									</th>
									<th class="styDepTblCell" scope="col" colspan="5" style="width:50mm;font-weight:normal;border-right-width:0px;">
										Contributions  
									</th>
								</tr>
								<tr class="styDepTblHdr">
									<th class="styDepTblCell" scope="col" colspan="2" style="width:25mm;font-weight:normal;">
										Repurchased Class 
									</th>
									<th class="styDepTblCell" scope="col" colspan="2" style="width:25mm;font-weight:normal;">
										Different Class 							
									</th>
									<th class="styDepTblCell" style="border-bottom-width:0px;"/>
								</tr>
							</thead>
							<thead>
								<tr class="styDepTblHdr">
									<th class="styDepTblCell" scope="col" style="width:10mm;font-weight:normal;">
										<strong>(a)</strong> Class <br/> 
										of stock <br/> repurchased
									</th>
									<th class="styDepTblCell" scope="col" style="width:10mm;font-weight:normal;">
										<strong>(b)</strong> Number <br/>
										of shares <br/> repurchased 
									</th>
									<th class="styDepTblCell" scope="col" style="width:25mm;font-weight:normal;">
										<strong>(c)</strong> Aggregate <br/>
										FMV
									</th>
									<th class="styDepTblCell" scope="col" style="width:33mm;font-weight:normal;padding-left:1px;padding-right:1px;">
										<strong>(d)</strong> Average <br/>
										price per share <br/> (divide (c) by (b))
									</th>
									<th class="styDepTblCell" scope="col" style="width:21mm;font-weight:normal;">
										<strong>(e)</strong> Number <br/> of shares
									</th>
									<th class="styDepTblCell" scope="col" style="width:36mm;font-weight:normal;padding-left:0;padding-right:0;">
										<strong>(f)</strong> Aggregate <br/> FMV of shares <br/>
										contributed <br/> (multiply (d) by (e))
									</th>
									<th class="styDepTblCell" scope="col" style="width:18mm;font-weight:normal;">
										<strong>(g)</strong> Number <br/> of shares <br/> contributed
									</th>
									<th class="styDepTblCell" scope="col" style="width:25mm;font-weight:normal;">
										<strong>(h)</strong> Aggregate <br/> FMV of shares <br/> contributed
									</th>
									<th class="styDepTblCell" scope="col" style="width:32mm;font-weight:normal;border-right-width:0px;border-top-width:0px;">
										<strong>(i)</strong> Aggregate value of <br/> contributions
									</th>
								</tr>
							</thead>
							<tbody>
								<xsl:for-each select="$FormData/ContriEmplrSponsRetirePlansGrp">
									<tr style="height:7.5mm;vertical-align:bottom;">
										<xsl:attribute name="class">
											<xsl:choose>
												<xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when>
												<xsl:otherwise>styDepTblRow2</xsl:otherwise>
											</xsl:choose>
										</xsl:attribute>
										<td class="styTableCellTextInherit">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="StockClassDesc"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellAmtInherit">
											<xsl:call-template name="PopulateShareNumP3">
												<xsl:with-param name="TargetNode" select="SharesCnt"/>
												<xsl:with-param name="Col">(b)</xsl:with-param>
											</xsl:call-template>
										</td>
										<td class="styTableCellAmtInherit">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="AggregateFMVAmt"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellAmtInherit">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="AveragePricePerShareAmt"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellAmtInherit">
											<xsl:call-template name="PopulateShareNumP3">
												<xsl:with-param name="TargetNode" select="ContriShareRepurchasedClassGrp/SharesCnt"/>
												<xsl:with-param name="Col">(e)</xsl:with-param>
											</xsl:call-template>
										</td>
										<td class="styTableCellAmtInherit">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="ContriShareRepurchasedClassGrp/AggregateFMVAmt"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellAmtInherit">
											<xsl:call-template name="PopulateShareNumP3">
												<xsl:with-param name="TargetNode" select="ContriShareDifferentClassGrp/SharesCnt"/>
												<xsl:with-param name="Col">(g)</xsl:with-param>
											</xsl:call-template>
										</td>
										<td class="styTableCellAmtInherit">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="ContriShareDifferentClassGrp/AggregateFMVAmt"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellAmtInherit" style="border-right-width:0px;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="AggregateContriValueAmt"/>
											</xsl:call-template>
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
	<xsl:template name="FillTable8Cols">
		<xsl:param name="LineNumber"/>
		<xsl:param name="SepMessage" select="false()"/>
		<xsl:param name="MaxLine" select="11"/>
		<tr style="height:7mm;vertical-align:bottom;">
			<td class="styTableCellCtrInherit">
				<xsl:choose>
					<xsl:when test="$SepMessage">
                    See Additional <br/> Data Table
				</xsl:when>
					<xsl:otherwise>&nbsp;</xsl:otherwise>
				</xsl:choose>
			</td>
			<td class="styTableCellCtrInherit">&nbsp;</td>
			<td class="styTableCellTextInherit">&nbsp;</td>
			<td class="styTableCellTextInherit">&nbsp;</td>
			<td class="styTableCellCtrInherit">&nbsp;</td>
			<td class="styTableCellCtrInherit">&nbsp;</td>
			<td class="styTableCellAmtInherit">&nbsp;</td>
			<td class="styTableCellAmtInherit" style="border-right-width:0px;">&nbsp;</td>
		</tr>
		<xsl:choose>
			<xsl:when test="$SepMessage">
				<xsl:call-template name="FillTable8Cols">
					<xsl:with-param name="LineNumber" select="2"/>
					<xsl:with-param name="SepMessage" select="false()"/>
				</xsl:call-template>
			</xsl:when>
			<xsl:when test="$LineNumber &lt; $MaxLine">
				<xsl:call-template name="FillTable8Cols">
					<xsl:with-param name="LineNumber" select="$LineNumber + 1"/>
					<xsl:with-param name="MaxLine" select="$MaxLine"/>
				</xsl:call-template>
			</xsl:when>
			<xsl:otherwise/>
		</xsl:choose>
	</xsl:template>
	<xsl:template name="FillTable9Cols">
		<xsl:param name="LineNumber"/>
		<xsl:param name="SepMessage" select="false()"/>
		<xsl:param name="MaxLine" select="13"/>
		<tr style="height:7mm;vertical-align:bottom;">
			<td class="styTableCellCtrInherit">
				<xsl:choose>
					<xsl:when test="$SepMessage">
					See Additional <br/> Data Table
				</xsl:when>
					<xsl:otherwise>&nbsp;</xsl:otherwise>
				</xsl:choose>
			</td>
			<td class="styTableCellCtrInherit">&nbsp;</td>
			<td class="styTableCellTextInherit">&nbsp;</td>
			<td class="styTableCellCtrInherit">&nbsp;</td>
			<td class="styTableCellAmtInherit">&nbsp;</td>
			<td class="styTableCellAmtInherit">&nbsp;</td>
			<td class="styTableCellAmtInherit">&nbsp;</td>
			<td class="styTableCellAmtInherit">&nbsp;</td>
			<td class="styTableCellAmtInherit" style="border-right-width:0px;">&nbsp;</td>
		</tr>
		<xsl:choose>
			<xsl:when test="$SepMessage">
				<xsl:call-template name="FillTable9Cols">
					<xsl:with-param name="LineNumber" select="2"/>
					<xsl:with-param name="SepMessage" select="false()"/>
				</xsl:call-template>
			</xsl:when>
			<xsl:when test="$LineNumber &lt; $MaxLine">
				<xsl:call-template name="FillTable9Cols">
					<xsl:with-param name="LineNumber" select="$LineNumber + 1"/>
					<xsl:with-param name="MaxLine" select="$MaxLine"/>
				</xsl:call-template>
			</xsl:when>
			<xsl:otherwise/>
		</xsl:choose>
	</xsl:template>
	<xsl:template name="PopulateShareNumP3">
		<xsl:param name="TargetNode"/>
		<xsl:param name="Col"/>
		<xsl:param name="MaxDigits" select="10"/>
		<xsl:choose>
			<xsl:when test="string-length($TargetNode) &gt; $MaxDigits">
				<xsl:call-template name="LinkToLeftoverDataTableInline">
					<xsl:with-param name="TargetNode" select="$TargetNode"/>
					<xsl:with-param name="Desc">Part III, Line 6, col <xsl:value-of select="$Col"/>, row <xsl:value-of select="position()"/> - Shares</xsl:with-param>
				</xsl:call-template>
			</xsl:when>
			<xsl:otherwise>
				<xsl:call-template name="PopulateText">
					<xsl:with-param name="TargetNode" select="$TargetNode"/>
				</xsl:call-template>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
</xsl:stylesheet>