<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE xsl:stylesheet [
	<!ENTITY nbsp "&#160;">
	<!ENTITY ndash "&#8211;">
]>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:include href="CommonPathRef.xsl"/>
	<xsl:include href="PopulateTemplate.xsl"/>
	<xsl:include href="AddHeader.xsl"/>
	<xsl:include href="AddOnTable.xsl"/>
	<xsl:include href="IRS1040NRSchedulePStyle.xsl"/>
	<xsl:output method="html" indent="yes"/>
	<xsl:strip-space elements="*"/>
	<xsl:param name="FormData" select="$RtnDoc/IRS1040NRScheduleP"/>
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
				<meta http-equiv="Content-Type" content="text/html; charset=ISO-IRS1040NRScheduleP-1"/>
				<meta name="Description" content="IRS Form 1040NR Schedule P"/>
				<script language="JavaScript" src="{$ScriptPath}/FormDisplay.js" type="text/javascript"/>
				<xsl:call-template name="InitJS"/>
				<style type="text/css">
					<xsl:if test="not($Print) or $Print=''">
						<xsl:call-template name="IRS1040NRSchedulePStyle"/>
						<xsl:call-template name="AddOnStyle"/>
					</xsl:if>
				</style>
				<xsl:call-template name="GlobalStylesForm"/>
			</head>
			<body class="styBodyClass">
				<form id="IRS1040NRScheduleP">
					<xsl:call-template name="DocumentHeaderLandscape"/>
					<!-- Page 1 -->
					<!-- Header -->
					<div class="styTBB" style="width:256mm;height:18mm;">
						<div class="styFNBox" style="width:35mm;height:18mm;">
							<span style="font-size:9pt;font-weight:bold;height:3mm;">SCHEDULE P<br/>
								<span style="font-size:9pt;font-weight:bold;height:5mm;">(Form 1040-NR)</span>
							</span>
							<br/>
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$FormData" />
							</xsl:call-template>
							<br/>
							<span class="styAgency">
								Department of the Treasury <br/>
								Internal Revenue Service
							</span>
						</div>
						<div class="styFTBox" style="width:178mm;height:18mm;">
							<span class="styFMT" style="font-size:11pt;padding-bottom:2mm;">
							Foreign Partner's Interests in Certain Partnerships Transferred During Tax Year</span>
							<br/>
							<span style="font-weight:bold;">
								Attach to Form 1040-NR.
							</span>
							<br/>
							<span style="font-weight:bold;">
								Go to
								<span style="font-style:italic">www.irs.gov/Form1040NR</span>
								for instructions and the latest information.
							</span>
						</div>
						<div class="styTYBox" style="width:31mm;height:18mm;">
							<div class="styOMB" style="height:4mm;padding-top;1mm;line-height:15px;border-bottom:auto;width:42mm;">OMB No. 1545-0074</div>
							<div class="styTY" style="height:6mm;font-size:18pt;padding-top:0mm;padding-bottom:0mm;line-height:100%;padding-left:0mm;">
										20<span class="styTYColor">25</span>
							</div>
							<br/>
							<div class="styOMB" style="padding-top:1mm;text-align:left;padding-left:5mm;border-bottom-width:0px;line-height:10px">
								Attachment <br/>
								Sequence No. <span class="styBoldText">7D</span>
							</div>
						</div>
					</div>
					<!-- Filer information section -->
					<div class="styBB" style="width:256mm;">
						<div class="styNameBox" style="width:205mm;">
						Name shown on Form 1040-NR (foreign partner)<br/>
							<xsl:call-template name="PopulateReturnHeaderFiler">
								<xsl:with-param name="TargetNode">BusinessNameLine1Txt</xsl:with-param>
							</xsl:call-template>
							<br/>
							<xsl:call-template name="PopulateReturnHeaderFiler">
								<xsl:with-param name="TargetNode">BusinessNameLine2Txt</xsl:with-param>
							</xsl:call-template>
						</div>
						<div class="styEINBox" style="width:50mm;padding-left:0.5mm;font-weight:normal;">
						<strong>Your identifying number</strong><br/>
							<xsl:call-template name="PopulateReturnHeaderFilerTIN"/>
						</div>
					</div>
					<!-- Part 1 -->
					<div class="styStdDiv" style="width:256mm;padding-bottom:0mm;height:4mm;">
						<div class="styPartName" style="width:16mm;">Part I</div>
						<div class="styPartDesc" style="width:160mm;height:auto;font-weight:normal;">
							<strong>Foreign Partner's Interests in Certain Partnerships Transferred During Tax Year </strong>
						</div>
						<div style="float:right;width:4mm;height:3mm;">
							<xsl:call-template name="SetDynamicTableToggleButton">
								<xsl:with-param name="TargetNode" select="$FormData/FrgnPrtnrIntPrtshpDuringTYGrp"/>
								<xsl:with-param name="containerID" select=" 'Part1Table' "/>
								<xsl:with-param name="headerHeight" select="2"/>
								<xsl:with-param name="containerHeight" select="4"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Page 1 Table 1 -->
					<div class="styBB" style="width:256mm;">
						<div class="styGenericDiv" style="width:3.2mm;text-align:right;"/>
					</div>
					<xsl:variable name="shouldSeparateP1" select="($Print = $Separated) and (count($FormData/FrgnPrtnrIntPrtshpDuringTYGrp) &gt; 4)"/>
					<div class="styTableContainerLandscape" style="width:256mm;" id="Part1Table">
						<xsl:call-template name="SetInitialState"/>
						<table class="styTable" cellspacing="0" style="height:15mm;">
							<thead class="styTableThead">
								<tr>
									<th class="styIRS1040NRSchPTableCellHeader" scope="col" style="width:5mm;font-weight:normal;border-width:0px 0px 1px 0px;">
									</th>
									<th class="styIRS1040NRSchPTableCellHeader" scope="col" style="width:50mm;font-weight:normal;padding-right:5mm;">
										<strong>(a)</strong> Name of partnership
									</th>
									<th class="styIRS1040NRSchPTableCellHeader" scope="col" style="width:60mm;font-weight:normal;">
										<strong>(b)</strong> Address
									</th>
									<th class="styIRS1040NRSchPTableCellHeader" scope="col" style="width:25mm;font-weight:normal;">
										<strong>(c)</strong> Employer <br/> Identification <br/> Number (EIN)
									</th>
									<th class="styIRS1040NRSchPTableCellHeader" scope="col" style="width:25mm;font-weight:normal;">
										<strong>(d)(1)</strong> Percentage <br/> interest transferred
									</th>
									<th class="styIRS1040NRSchPTableCellHeader" scope="col" style="width:40mm;font-weight:normal;">
										<strong>(d)(2)</strong> Units transferred
									</th>
									<th class="styIRS1040NRSchPTableCellHeader" scope="col" style="width:40mm;font-weight:normal;">
										<strong>(e)</strong> Date acquired <br/> (mm/dd/yyyy)
									</th>
									<th class="styIRS1040NRSchPTableCellHeader" scope="col" style="width:40mm;font-weight:normal;border-right-width:0px;">
										<strong>(f)</strong> Date transferred <br/> (mm/dd/yyyy)
									</th>
								</tr>
							</thead>
							<tbody style="font-size:6pt;">
								<xsl:if test="not($shouldSeparateP1)">
									<xsl:for-each select="$FormData/FrgnPrtnrIntPrtshpDuringTYGrp">
										<xsl:if test="($Print != $Separated) or (count($FormData/FrgnPrtnrIntPrtshpDuringTYGrp) &lt; 4)">
											<tr style="height:20mm;vertical-align:top;">
												<td class="styTableCellTextInherit" style="width:5mm;padding-top:2mm;vertical-align:top;border-width:0px 0px 1px 0px;font-weight:bold;">												
														<xsl:number format="A" value="position()"/>
												</td>
												<td class="styTableCellTextInherit" style="width:45mm;font-weight:normal;vertical-align:top;padding-top:2mm;">
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="PartnershipName/BusinessNameLine1Txt"/>
													</xsl:call-template>
													<xsl:if test="PartnershipName/BusinessNameLine2Txt">
														<br/>
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="PartnershipName/BusinessNameLine2Txt"/>
														</xsl:call-template>
													</xsl:if>
												</td>
												<td class="styTableCellTextInherit" style="padding-left:1mm;padding-top:2mm;">
													<xsl:choose>
														<xsl:when test="PartnershipUSAddress">
															<xsl:call-template name="PopulateUSAddressTemplate">
																<xsl:with-param name="TargetNode" select="PartnershipUSAddress"/>
															</xsl:call-template>
														</xsl:when>
														<xsl:otherwise>
															<xsl:call-template name="PopulateForeignAddressTemplate">
																<xsl:with-param name="TargetNode" select="PartnershipForeignAddress"/>
															</xsl:call-template>
														</xsl:otherwise>
													</xsl:choose>
												</td>
												<td class="styTableCellCtrInherit" style="padding-top:2mm;">
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="PartnershipEIN"/>
													</xsl:call-template>
												</td>
												<td class="styTableCellCtrInherit" style="padding-top:2mm;">
													<xsl:call-template name="PopulatePercent">
														<xsl:with-param name="TargetNode" select="PartnershipIntTransferredPct"/>
													</xsl:call-template>
												</td>
												<td class="styTableCellCtrInherit" style="padding-top:2mm;">										
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="PartnershipUnitsTransferredNum"/>
													</xsl:call-template>
												</td>												
												<td class="styTableCellTextInherit" style="padding-left:10mm;padding-top:2mm;">
													<xsl:call-template name="PopulateMonthDayYear">
														<xsl:with-param name="TargetNode" select="AcquiredDt"/>
													</xsl:call-template>
												</td>
												<td class="styTableCellTextInherit" style="padding-top:2mm;padding-left:10mm;border-right-width:0px;">
													<xsl:call-template name="PopulateMonthDayYear">
														<xsl:with-param name="TargetNode" select="PartnershipIntTransferredDt"/>
													</xsl:call-template>
												</td>
											</tr>
										</xsl:if>
									</xsl:for-each>
								</xsl:if>
								<xsl:if test="$shouldSeparateP1 or (count($FormData/FrgnPrtnrIntPrtshpDuringTYGrp) &lt; 4)">
									<xsl:call-template name="FillTable7Cols">
										<xsl:with-param name="LineNumber" select="1 + count($FormData/FrgnPrtnrIntPrtshpDuringTYGrp)"/>
										<xsl:with-param name="SepMessage" select="$shouldSeparateP1"/>
										<xsl:with-param name="MaxLine" select="4"/>
									</xsl:call-template>
								</xsl:if>
							</tbody>
						</table>
					</div>
					<xsl:if test="not($shouldSeparateP1)">
						<xsl:call-template name="SetInitialDynamicTableHeight">
							<xsl:with-param name="TargetNode" select="$FormData/FrgnPrtnrIntPrtshpDuringTYGrp"/>
							<xsl:with-param name="containerID" select=" 'Part1Table' "/>
							<xsl:with-param name="headerHeight" select="1"/>
							<xsl:with-param name="containerHeight" select="4"/>
						</xsl:call-template>
					</xsl:if>
					<div class="styLNDesc" style="width:219mm; border-bottom-width:0px;border-color:black;height:7mm;border-style:solid;border-top-width:0px;border-right-width:0px;border-left-width: 0px;">
						<span>
							<strong>Note:</strong>  If you have transferred more than four partnership interests, continue on separate Schedules P (Form 1040-NR) as needed.  See instructions.</span>
					</div>
					<div style="width:256mm;">
						<div class="styLNDesc" style="width:219mm; border-bottom-width: 1px; border-color: black;height:7mm;border-style: solid;border-top-width:1px;border-right-width: 0px;border-left-width:0px;">
							<span>Enter the total number of transfers of partnership interests reported on all of your Schedules P (Form 1040-NR), Part I. See instructions.</span>
						</div>
						<div class="styLNAmountBox" style="width:37mm;height:7mm;padding-top:4mm;border-top-width:1px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/PartnershipIntTrnsfrTotCnt"/>
							</xsl:call-template>
						</div>
					</div>
					<div style="width:256mm;">
						<div class="styLNDesc" style="width:219mm; border-bottom-width:0px;border-color: black;height:7mm;border-style: solid;border-top-width: 0px;border-right-width: 0px;border-left-width:0px;">
							<span>Enter the total proceeds/amount realized from the transfers of partnership interests reported on all of your Schedules P (Form 1040-NR), Part II, Line 1.  See instructions.</span>
						</div>
						<div class="styLNAmountBox" style="width:37mm;height:7mm;padding-top:4mm;border-bottom-width:0px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/PartnershipIntTrnsfrTotRlzdAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<br/>
					<!-- Page 1 footer-->
					<div class="styStdDiv" style="border-top:1px solid black;width:256mm;">
						<span style="font-weight:bold;font-family:Arial;">For Disclosure, Privacy Act, and Paperwork Reduction Act Notice, see the instructions for Form 1040-NR.</span>
						<span style="margin-left:20mm;">Cat. No. 93752D</span>
						<span style="float:right;">
							<strong>Schedule P (Form 1040-NR) 2025</strong>
						</span>
					</div>
					<!-- Page 1 end -->
					<div class="pageEnd"/>
					<!-- Page 2 -->
					<!-- Header -->
					<div class="styBB" style="width:256mm;float:none">
						<div style="float: left; clear: none">Schedule P (Form 1040-NR) 2025 </div>
						<div style="float:right">
							Page <span class="styBoldText" style="font-size: 8pt">2</span>
						</div>
					</div>
					<!-- Filer information section -->
					<div class="styBB" style="width:256mm;border-top-width:1px;">
						<div class="styNameBox" style="width:205mm;">
							Name shown on Form 1040-NR (foreign partner)<br/>
							<xsl:call-template name="PopulateReturnHeaderFiler">
								<xsl:with-param name="TargetNode">BusinessNameLine1Txt</xsl:with-param>
							</xsl:call-template>
							<br/>
							<xsl:call-template name="PopulateReturnHeaderFiler">
								<xsl:with-param name="TargetNode">BusinessNameLine2Txt</xsl:with-param>
							</xsl:call-template>
						</div>
						<div class="styEINBox" style="width:50mm;padding-left:0.5mm;font-weight:normal;">
							<strong>Your identifying number</strong><br/>
							<xsl:call-template name="PopulateReturnHeaderFilerTIN"/>
						</div>
					</div>
					<div class="styStdDiv" style="width:256mm;padding-bottom:0mm;height:4mm;">
						<div class="styPartName" style="width:16mm;">Part II</div>
						<div class="styPartDesc" style="width:160mm;height:auto;font-weight:normal;">
							<strong>Foreign Partner's Gain or Loss on Transfer of Interests in Certain Partnerships </strong>
						</div>
					</div>
					<xsl:if test="count($FormData/FrgnPrtnrIntPrtshpDuringTYGrp) &gt;= 1">
						<div class="styStdDiv" style="width:256mm;border-top:1px solid black;vertical-align:middle;">
							<div class="styIRS1040NRSchPTableCellHeaderSmall" style="float:right;height:4mm;width:121mm;text-align:center;font-weight:bold;border-bottom:1px solid black;"><strong>Partnership Interest Transferred</strong></div>
						</div>
					</xsl:if>
					<xsl:for-each select="$FormData/FrgnPrtnrIntPrtshpDuringTYGrp">
						<xsl:if test="position() mod 4 = 1">
							<xsl:variable name="pos" select="position()"/>
							<!-- Page 2 Column Headers -->
							<div class="styStdDiv" style="width:256mm;">
								<div class="styLNLeftNumBox">&nbsp;</div>
								<div class="sty1040NRSchPDesc" style="padding-left:2mm;"><strong>Complete lines 1&ndash;9 if your Schedule K-3 (Form 1065), Part XIII, includes information on <br/>
											lines 1 through 6. Complete lines 1&ndash;3 and line 18 if your Schedule K-3 (Form 1065), Part<br/>
											XIII, includes information on line 7.</strong></div>
								<div class="sty1040NRSchPAmtBox" style="height:10mm;width:30mm;text-align:center;font-weight:bold;vertical-align:bottom;padding-top:5mm;">
									<xsl:number value="$pos" format="(A)"/></div>
								<div class="sty1040NRSchPAmtBox" style="height:10mm;width:30mm;text-align:center;font-weight:bold;vertical-align:bottom;padding-top:5mm;">
									<xsl:number value="$pos + 1" format="(A)"/></div>
								<div class="sty1040NRSchPAmtBox" style="height:10mm;width:30mm;text-align:center;font-weight:bold;vertical-align:bottom;padding-top:5mm;">
									<xsl:number value="$pos + 2" format="(A)"/></div>
								<div class="sty1040NRSchPAmtBox" style="height:10mm;width:30mm;text-align:center;font-weight:bold;vertical-align:bottom;padding-top:5mm;">
									<xsl:number value="$pos + 3" format="(A)"/></div>
							</div>
							<!-- Page 2 Line 1 -->
							<div style="width:256mm;">
								<div class="styLNLeftNumBoxSD">1</div>
								<div class="sty1040NRSchPDesc" style="height:4mm;">
									Proceeds/amount realized from the transfer of partnership interest
									<span class="sty1040NRSchPDotLn">..........</span>
								</div>
								<div class="sty1040NRSchPAmtBox" style="height:4mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="RealizedAmt" />
									</xsl:call-template>
								</div>
								<div class="sty1040NRSchPAmtBox" style="height:4mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/FrgnPrtnrIntPrtshpDuringTYGrp[$pos + 1]/RealizedAmt" />
									</xsl:call-template>
								</div>
								<div class="sty1040NRSchPAmtBox" style="height:4mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/FrgnPrtnrIntPrtshpDuringTYGrp[$pos + 2]/RealizedAmt" />
									</xsl:call-template>
								</div>
								<div class="sty1040NRSchPAmtBox" style="height:4mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/FrgnPrtnrIntPrtshpDuringTYGrp[$pos + 3]/RealizedAmt" />
									</xsl:call-template>
								</div>
							</div>
							<!-- Page 2 Line 2 -->
							<div style="width:256mm;">
								<div class="styLNLeftNumBoxSD">2</div>
								<div class="sty1040NRSchPDesc" style="height:4mm;">
									Section 705 outside basis
									<span class="sty1040NRSchPDotLn">.......................</span>
								</div>
								<div class="sty1040NRSchPAmtBox" style="height:4mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="Section705OutsideBasisAmt" />
									</xsl:call-template>
								</div>
								<div class="sty1040NRSchPAmtBox" style="height:4mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/FrgnPrtnrIntPrtshpDuringTYGrp[$pos + 1]/Section705OutsideBasisAmt" />
									</xsl:call-template>
								</div>
								<div class="sty1040NRSchPAmtBox" style="height:4mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/FrgnPrtnrIntPrtshpDuringTYGrp[$pos + 2]/Section705OutsideBasisAmt" />
									</xsl:call-template>
								</div>
								<div class="sty1040NRSchPAmtBox" style="height:4mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/FrgnPrtnrIntPrtshpDuringTYGrp[$pos + 3]/Section705OutsideBasisAmt" />
									</xsl:call-template>
								</div>
							</div>
							<!-- Page 2 Line 3 -->
							<div style="width:256mm;">
								<div class="styLNLeftNumBoxSD">3</div>
								<div class="sty1040NRSchPDesc" style="height:4mm;">
									Total outside gain (loss) on transfer of partnership interest. Subtract line 2 from line 1
									<span class="sty1040NRSchPDotLn">....</span>
								</div>
								<div class="sty1040NRSchPAmtBox" style="height:4mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="TotalOutsideGainLossAmt" />
									</xsl:call-template>
								</div>
								<div class="sty1040NRSchPAmtBox" style="height:4mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/FrgnPrtnrIntPrtshpDuringTYGrp[$pos + 1]/TotalOutsideGainLossAmt" />
									</xsl:call-template>
								</div>
								<div class="sty1040NRSchPAmtBox" style="height:4mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/FrgnPrtnrIntPrtshpDuringTYGrp[$pos + 2]/TotalOutsideGainLossAmt" />
									</xsl:call-template>
								</div>
								<div class="sty1040NRSchPAmtBox" style="height:4mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/FrgnPrtnrIntPrtshpDuringTYGrp[$pos + 3]/TotalOutsideGainLossAmt" />
									</xsl:call-template>
								</div>
							</div>
							<!-- Page 2 Line 4 -->
							<div style="width:256mm;">
								<div class="styLNLeftNumBoxSD">4</div>
								<div class="sty1040NRSchPDesc" style="height:7mm;">
									Total outside ordinary gain (loss) that would be recognized on the deemed sale of section<br/> 
									751  property. Enter amount from Schedule K-3 (Form 1065), Part XIII, line 1
									<span class="sty1040NRSchPDotLn">.......</span>
								</div>
								<div class="sty1040NRSchPAmtBox" style="height:7mm;"><br />
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="TotOrdinaryGainLossSect751Amt" />
									</xsl:call-template>
								</div>
								<div class="sty1040NRSchPAmtBox" style="height:7mm;"><br />
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/FrgnPrtnrIntPrtshpDuringTYGrp[$pos + 1]/TotOrdinaryGainLossSect751Amt" />
									</xsl:call-template>
								</div>
								<div class="sty1040NRSchPAmtBox" style="height:7mm;"><br />
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/FrgnPrtnrIntPrtshpDuringTYGrp[$pos + 2]/TotOrdinaryGainLossSect751Amt" />
									</xsl:call-template>
								</div>
								<div class="sty1040NRSchPAmtBox" style="height:7mm;"><br />
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/FrgnPrtnrIntPrtshpDuringTYGrp[$pos + 3]/TotOrdinaryGainLossSect751Amt" />
									</xsl:call-template>
								</div>
							</div>
							<!-- Page 2 Line 5 -->
							<div style="width:256mm;">
								<div class="styLNLeftNumBoxSD">5</div>
								<div class="sty1040NRSchPDesc" style="height:7mm;">
									Total outside capital gain (loss) that would be recognized on the transfer of the partnership<br/> 
									interest. Subtract line 4 from line 3
									<span class="sty1040NRSchPDotLn">....................</span>
								</div>
								<div class="sty1040NRSchPAmtBox" style="height:7mm;"><br />
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="TotOutsideCapitalGainLossAmt" />
									</xsl:call-template>
								</div>
								<div class="sty1040NRSchPAmtBox" style="height:7mm;"><br />
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/FrgnPrtnrIntPrtshpDuringTYGrp[$pos + 1]/TotOutsideCapitalGainLossAmt" />
									</xsl:call-template>
								</div>
								<div class="sty1040NRSchPAmtBox" style="height:7mm;"><br />
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/FrgnPrtnrIntPrtshpDuringTYGrp[$pos + 2]/TotOutsideCapitalGainLossAmt" />
									</xsl:call-template>
								</div>
								<div class="sty1040NRSchPAmtBox" style="height:7mm;"><br />
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/FrgnPrtnrIntPrtshpDuringTYGrp[$pos + 3]/TotOutsideCapitalGainLossAmt" />
									</xsl:call-template>
								</div>
							</div>
							<!-- Page 2 Line 6 -->
							<div style="width:256mm;">
								<div class="styLNLeftNumBoxSD">6</div>
								<div class="sty1040NRSchPDesc" style="height:10mm;">
									Aggregate effectively connected ordinary gain (loss) that would be recognized on the<br/>
									deemed sale of section 751 property. Enter amount from Schedule K-3 (Form 1065), Part<br/>
									XIII, line 2
									<span class="sty1040NRSchPDotLn">....................</span>
								</div>
								<div class="sty1040NRSchPAmtBox" style="height:10mm;"><br />
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="TotEffCnnctOrdnryGain751Amt" />
									</xsl:call-template>
								</div>
								<div class="sty1040NRSchPAmtBox" style="height:10mm;"><br />
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/FrgnPrtnrIntPrtshpDuringTYGrp[$pos + 1]/TotEffCnnctOrdnryGain751Amt" />
									</xsl:call-template>
								</div>
								<div class="sty1040NRSchPAmtBox" style="height:10mm;"><br />
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/FrgnPrtnrIntPrtshpDuringTYGrp[$pos + 2]/TotEffCnnctOrdnryGain751Amt" />
									</xsl:call-template>
								</div>
								<div class="sty1040NRSchPAmtBox" style="height:10mm;"><br />
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/FrgnPrtnrIntPrtshpDuringTYGrp[$pos + 3]/TotEffCnnctOrdnryGain751Amt" />
									</xsl:call-template>
								</div>
							</div>
							<!-- Page 2 Line 7 -->
							<div style="width:256mm;">
								<div class="styLNLeftNumBoxSD">7</div>
								<div class="sty1040NRSchPDesc" style="height:7mm;">
									Aggregate effectively connected capital gain (loss) that would be recognized on the deemed sale<br/>
									of non-section 751 property. Enter amount from Schedule K-3 (Form 1065), Part XIII, line 3
									<span class="sty1040NRSchPDotLn">..</span>
								</div>
								<div class="sty1040NRSchPAmtBox" style="height:7mm;"><br />
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="TotalEffCnnctCapGainNon751Amt" />
									</xsl:call-template>
								</div>
								<div class="sty1040NRSchPAmtBox" style="height:7mm;"><br />
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/FrgnPrtnrIntPrtshpDuringTYGrp[$pos + 1]/TotalEffCnnctCapGainNon751Amt" />
									</xsl:call-template>
								</div>
								<div class="sty1040NRSchPAmtBox" style="height:7mm;"><br />
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/FrgnPrtnrIntPrtshpDuringTYGrp[$pos + 2]/TotalEffCnnctCapGainNon751Amt" />
									</xsl:call-template>
								</div>
								<div class="sty1040NRSchPAmtBox" style="height:7mm;"><br />
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/FrgnPrtnrIntPrtshpDuringTYGrp[$pos + 3]/TotalEffCnnctCapGainNon751Amt" />
									</xsl:call-template>
								</div>
							</div>
							<!-- Page 2 Line 8 -->
							<div style="width:256mm;">
								<div class="styLNLeftNumBoxSD">8</div>
								<div class="sty1040NRSchPDesc" style="height:7mm;">
									Recognized effectively connected ordinary gain (loss). Enter the smaller of line 4 or line 6.<br/>
									See instructions
									<span class="sty1040NRSchPDotLn">..........................</span>
								</div>
								<div class="sty1040NRSchPAmtBox" style="height:7mm;"><br />
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="RcgnzEffCnnctOrdnryGainLossAmt" />
									</xsl:call-template>
								</div>
								<div class="sty1040NRSchPAmtBox" style="height:7mm;"><br />
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/FrgnPrtnrIntPrtshpDuringTYGrp[$pos + 1]/RcgnzEffCnnctOrdnryGainLossAmt" />
									</xsl:call-template>
								</div>
								<div class="sty1040NRSchPAmtBox" style="height:7mm;"><br />
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/FrgnPrtnrIntPrtshpDuringTYGrp[$pos + 2]/RcgnzEffCnnctOrdnryGainLossAmt" />
									</xsl:call-template>
								</div>
								<div class="sty1040NRSchPAmtBox" style="height:7mm;"><br />
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/FrgnPrtnrIntPrtshpDuringTYGrp[$pos + 3]/RcgnzEffCnnctOrdnryGainLossAmt" />
									</xsl:call-template>
								</div>
							</div>
							<!-- Page 2 Line 9 -->
							<div style="width:256mm;">
								<div class="styLNLeftNumBoxSD">9</div>
								<div class="sty1040NRSchPDesc" style="height:7mm;">
									Recognized effectively connected capital gain (loss). Enter the smaller of line 5 or line 7. See<br/>
									instructions
									<span class="sty1040NRSchPDotLn">...........................</span>
								</div>
								<div class="sty1040NRSchPAmtBox" style="height:7mm;"><br />
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="RcgnzEffCnnctCapGainLossAmt" />
									</xsl:call-template>
								</div>
								<div class="sty1040NRSchPAmtBox" style="height:7mm;"><br />
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/FrgnPrtnrIntPrtshpDuringTYGrp[$pos + 1]/RcgnzEffCnnctCapGainLossAmt" />
									</xsl:call-template>
								</div>
								<div class="sty1040NRSchPAmtBox" style="height:7mm;"><br />
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/FrgnPrtnrIntPrtshpDuringTYGrp[$pos + 2]/RcgnzEffCnnctCapGainLossAmt" />
									</xsl:call-template>
								</div>
								<div class="sty1040NRSchPAmtBox" style="height:7mm;"><br />
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/FrgnPrtnrIntPrtshpDuringTYGrp[$pos + 3]/RcgnzEffCnnctCapGainLossAmt" />
									</xsl:call-template>
								</div>
							</div>
							<div style="width:256mm;">
								<div class="styLNLeftNumBoxSD">&nbsp;</div>
								<div class="sty1040NRSchPDesc" style="height:7mm;padding-left:2mm;">
									<strong>Complete lines 10&ndash;17 only if the capital gain (loss) on line 5 is long term and an<br/>
									amount was reported on your Schedule K-3 (Form 1065), Part XIII, line 4 or line 5.</strong>
								</div>
								<div class="sty1040NRSchPAmtBox" style="height:7mm;background-color:lightgrey;"><br /></div>
								<div class="sty1040NRSchPAmtBox" style="height:7mm;background-color:lightgrey;"><br /></div>
								<div class="sty1040NRSchPAmtBox" style="height:7mm;background-color:lightgrey;"><br /></div>
								<div class="sty1040NRSchPAmtBox" style="height:7mm;background-color:lightgrey;"><br />	
								</div>
							</div>
							<!-- Page 2 Line 10 -->
							<div style="width:256mm;">
								<div class="styLNLeftNumBox">10</div>
								<div class="sty1040NRSchPDesc" style="height:7mm;">
									Total outside collectibles gain that would be recognized on the deemed sale of section<br/>
									1(h)(5) assets. See instructions
									<span class="sty1040NRSchPDotLn">.....................</span>
								</div>
								<div class="sty1040NRSchPAmtBox" style="height:7mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="TotOutsideCollectiblesGainAmt" />
									</xsl:call-template>
								</div>
								<div class="sty1040NRSchPAmtBox" style="height:7mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/FrgnPrtnrIntPrtshpDuringTYGrp[$pos + 1]/TotOutsideCollectiblesGainAmt" />
									</xsl:call-template>
								</div>
								<div class="sty1040NRSchPAmtBox" style="height:7mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/FrgnPrtnrIntPrtshpDuringTYGrp[$pos + 2]/TotOutsideCollectiblesGainAmt" />
									</xsl:call-template>
								</div>
								<div class="sty1040NRSchPAmtBox" style="height:7mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/FrgnPrtnrIntPrtshpDuringTYGrp[$pos + 3]/TotOutsideCollectiblesGainAmt" />
									</xsl:call-template>
								</div>
							</div>
							<!-- Page 2 Line 11 -->
							<div style="width:256mm;">
								<div class="styLNLeftNumBox">11</div>
								<div class="sty1040NRSchPDesc" style="height:7mm;">
									Total outside unrecaptured section 1250 gain that would be recognized on the deemed sale<br/> 
									of section 1(h)(6) assets. See instructions
									<span class="sty1040NRSchPDotLn">..................</span>
								</div>
								<div class="sty1040NRSchPAmtBox" style="height:7mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="TotOutsideUnrcptr1250GainAmt" />
									</xsl:call-template>
								</div>
								<div class="sty1040NRSchPAmtBox" style="height:7mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/FrgnPrtnrIntPrtshpDuringTYGrp[$pos + 1]/TotOutsideUnrcptr1250GainAmt" />
									</xsl:call-template>
								</div>
								<div class="sty1040NRSchPAmtBox" style="height:7mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/FrgnPrtnrIntPrtshpDuringTYGrp[$pos + 2]/TotOutsideUnrcptr1250GainAmt" />
									</xsl:call-template>
								</div>
								<div class="sty1040NRSchPAmtBox" style="height:7mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/FrgnPrtnrIntPrtshpDuringTYGrp[$pos + 3]/TotOutsideUnrcptr1250GainAmt" />
									</xsl:call-template>
								</div>
							</div>
							<!-- Page 2 Line 12 -->
							<div style="width:256mm;">
								<div class="styLNLeftNumBox">12</div>
								<div class="sty1040NRSchPDesc" style="height:4mm;">
									Total outside look-through capital gains. Add lines 10 and 11
									<span class="sty1040NRSchPDotLn">............</span>
								</div>
								<div class="sty1040NRSchPAmtBox" style="height:4mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="TotalOutsideCapitalGainsAmt" />
									</xsl:call-template>
								</div>
								<div class="sty1040NRSchPAmtBox" style="height:4mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/FrgnPrtnrIntPrtshpDuringTYGrp[$pos + 1]/TotalOutsideCapitalGainsAmt" />
									</xsl:call-template>
								</div>
								<div class="sty1040NRSchPAmtBox" style="height:4mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/FrgnPrtnrIntPrtshpDuringTYGrp[$pos + 2]/TotalOutsideCapitalGainsAmt" />
									</xsl:call-template>
								</div>
								<div class="sty1040NRSchPAmtBox" style="height:4mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/FrgnPrtnrIntPrtshpDuringTYGrp[$pos + 3]/TotalOutsideCapitalGainsAmt" />
									</xsl:call-template>
								</div>
							</div>
							<!-- Page 2 Line 13 -->
							<div style="width:256mm;">
								<div class="styLNLeftNumBox">13</div>
								<div class="sty1040NRSchPDesc" style="height:7mm;">
									Aggregate effectively connected collectibles gain that would be recognized on the deemed<br/>
									sale of section 1(h)(5) assets. Enter amount from Schedule K-3 (Form 1065), Part XIII, line 4	
									<span class="sty1040NRSchPDotLn">..</span>
								</div>
								<div class="sty1040NRSchPAmtBox" style="height:7mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="TotalEffCnnctSect1h5AssetsAmt" />
									</xsl:call-template>
								</div>
								<div class="sty1040NRSchPAmtBox" style="height:7mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/FrgnPrtnrIntPrtshpDuringTYGrp[$pos + 1]/TotalEffCnnctSect1h5AssetsAmt" />
									</xsl:call-template>
								</div>
								<div class="sty1040NRSchPAmtBox" style="height:7mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/FrgnPrtnrIntPrtshpDuringTYGrp[$pos + 2]/TotalEffCnnctSect1h5AssetsAmt" />
									</xsl:call-template>
								</div>
								<div class="sty1040NRSchPAmtBox" style="height:7mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/FrgnPrtnrIntPrtshpDuringTYGrp[$pos + 3]/TotalEffCnnctSect1h5AssetsAmt" />
									</xsl:call-template>
								</div>
							</div>
							<!-- Page 2 Line 14 -->
							<div style="width:256mm;">
								<div class="styLNLeftNumBox">14</div>
								<div class="sty1040NRSchPDesc" style="height:10mm;">
									Aggregate effectively connected unrecaptured section 1250 gain that would be recognized<br/>
									on the deemed sale of section 1(h)(6) assets. Enter amount from Schedule K-3 (Form 1065),<br/>
									Part XIII, line 5
									<span class="sty1040NRSchPDotLn">..........................</span>
								</div>
								<div class="sty1040NRSchPAmtBox" style="height:10mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="TotEffCnnctSect1h6Sect1250Amt" />
									</xsl:call-template>
								</div>
								<div class="sty1040NRSchPAmtBox" style="height:10mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/FrgnPrtnrIntPrtshpDuringTYGrp[$pos + 1]/TotEffCnnctSect1h6Sect1250Amt" />
									</xsl:call-template>
								</div>
								<div class="sty1040NRSchPAmtBox" style="height:10mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/FrgnPrtnrIntPrtshpDuringTYGrp[$pos + 2]/TotEffCnnctSect1h6Sect1250Amt" />
									</xsl:call-template>
								</div>
								<div class="sty1040NRSchPAmtBox" style="height:10mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/FrgnPrtnrIntPrtshpDuringTYGrp[$pos + 3]/TotEffCnnctSect1h6Sect1250Amt" />
									</xsl:call-template>
								</div>
							</div>
							<!-- Page 2 Line 15 -->
							<div style="width:256mm;">
								<div class="styLNLeftNumBox">15</div>
								<div class="sty1040NRSchPDesc" style="height:4mm;">
									Total aggregate effectively connected look-through capital gains. Add lines 13 and 14
									<span class="sty1040NRSchPDotLn">....</span>
								</div>
								<div class="sty1040NRSchPAmtBox" style="height:4mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="TotalEffCnnctCapitalGainsAmt" />
									</xsl:call-template>
								</div>
								<div class="sty1040NRSchPAmtBox" style="height:4mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/FrgnPrtnrIntPrtshpDuringTYGrp[$pos + 1]/TotalEffCnnctCapitalGainsAmt" />
									</xsl:call-template>
								</div>
								<div class="sty1040NRSchPAmtBox" style="height:4mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/FrgnPrtnrIntPrtshpDuringTYGrp[$pos + 2]/TotalEffCnnctCapitalGainsAmt" />
									</xsl:call-template>
								</div>
								<div class="sty1040NRSchPAmtBox" style="height:4mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/FrgnPrtnrIntPrtshpDuringTYGrp[$pos + 3]/TotalEffCnnctCapitalGainsAmt" />
									</xsl:call-template>
								</div>
							</div>
							<!-- Page 2 Line 16 -->
							<div style="width:256mm;">
								<div class="styLNLeftNumBox">16</div>
								<div class="sty1040NRSchPDesc" style="height:10mm;">
									If the amount entered on line 9 is from line 5, then enter the amount from line 12. If the<br/>
									amount entered on line 9 is from line 7, then enter the amount from line 15. See instructions<br/>
									for whether and where to report lines 10 and 11 or lines 13 and 14 on your Form 1040-NR
									<span class="sty1040NRSchPDotLn">..</span>
								</div>
								<div class="sty1040NRSchPAmtBox" style="height:10mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="SpecifiedAmt" />
									</xsl:call-template>
								</div>
								<div class="sty1040NRSchPAmtBox" style="height:10mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/FrgnPrtnrIntPrtshpDuringTYGrp[$pos + 1]/SpecifiedAmt" />
									</xsl:call-template>
								</div>
								<div class="sty1040NRSchPAmtBox" style="height:10mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/FrgnPrtnrIntPrtshpDuringTYGrp[$pos + 2]/SpecifiedAmt" />
									</xsl:call-template>
								</div>
								<div class="sty1040NRSchPAmtBox" style="height:10mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/FrgnPrtnrIntPrtshpDuringTYGrp[$pos + 3]/SpecifiedAmt" />
									</xsl:call-template>
								</div>
							</div>
							<!-- Page 2 Line 17 -->
							<div style="width:256mm;">
								<div class="styLNLeftNumBox">17</div>
								<div class="sty1040NRSchPDesc" style="height:7mm;">
									Recognized effectively connected residual long-term capital gain (loss). Subtract line 16 from<br/>
									line 9. See instructions	
									<span class="sty1040NRSchPDotLn">........................</span>
								</div>
								<div class="sty1040NRSchPAmtBox" style="height:7mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="RcgnzEffCnnctLTCapGainLossAmt" />
									</xsl:call-template>
								</div>
								<div class="sty1040NRSchPAmtBox" style="height:7mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/FrgnPrtnrIntPrtshpDuringTYGrp[$pos + 1]/RcgnzEffCnnctLTCapGainLossAmt" />
									</xsl:call-template>
								</div>
								<div class="sty1040NRSchPAmtBox" style="height:7mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/FrgnPrtnrIntPrtshpDuringTYGrp[$pos + 2]/RcgnzEffCnnctLTCapGainLossAmt" />
									</xsl:call-template>
								</div>
								<div class="sty1040NRSchPAmtBox" style="height:7mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/FrgnPrtnrIntPrtshpDuringTYGrp[$pos + 3]/RcgnzEffCnnctLTCapGainLossAmt" />
									</xsl:call-template>
								</div>
								<!-- Page 2 Line 18 -->
							<div style="width:256mm;">
								<div class="styLNLeftNumBox">18</div>
								<div class="sty1040NRSchPDesc" style="height:10mm;">
									Capital gain (loss) that would be recognized under section 897(g) on the deemed sale of U.S.<br/>
									real property interests. Enter the amount from Schedule K-3 (Form 1065), Part XIII, line 7. See<br/>
									instructions
									<span class="sty1040NRSchPDotLn">...........................</span>
								</div>
								<div class="sty1040NRSchPAmtBox" style="height:10mm;border-bottom-width:0px;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="GainLossSect897gAmt" />
									</xsl:call-template>
								</div>
								<div class="sty1040NRSchPAmtBox" style="height:10mm;border-bottom-width:0px;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/FrgnPrtnrIntPrtshpDuringTYGrp[$pos + 1]/GainLossSect897gAmt" />
									</xsl:call-template>
								</div>
								<div class="sty1040NRSchPAmtBox" style="height:10mm;border-bottom-width:0px;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/FrgnPrtnrIntPrtshpDuringTYGrp[$pos + 2]/GainLossSect897gAmt" />
									</xsl:call-template>
								</div>
								<div class="sty1040NRSchPAmtBox" style="height:10mm;border-bottom-width:0px;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/FrgnPrtnrIntPrtshpDuringTYGrp[$pos + 3]/GainLossSect897gAmt" />
									</xsl:call-template>
								</div>
							</div>
							</div>
						</xsl:if>
						</xsl:for-each>
					
						<xsl:if test="count($FormData/FrgnPrtnrIntPrtshpDuringTYGrp) &lt; 1">
							<!-- Page 2 Column Headers -->
							<div class="styStdDiv" style="width:256mm;border-top:1px solid black;vertical-align:middle;">
								<div class="styIRS1040NRSchPTableCellHeaderSmall" style="float:right;height:4mm;width:121mm;text-align:center;font-weight:bold;border-bottom:1px solid black;"><strong>Partnership Interest Transferred</strong></div>
							</div>
							<div class="styStdDiv" style="width:256mm;">
								<div class="styLNLeftNumBox">&nbsp;</div>
								<div class="sty1040NRSchPDesc" style="padding-left:2mm;"><strong>Complete lines 1&ndash;9 if your Schedule K-3 (Form 1065), Part XIII, includes information on <br/>
											lines 1 through 6. Complete lines 1&ndash;3 and line 18 if your Schedule K-3 (Form 1065), Part<br/>
											XIII, includes information on line 7.</strong></div>
								<div class="sty1040NRSchPAmtBox" style="height:10mm;width:30mm;text-align:center;font-weight:bold;padding-top:5mm;">(A)</div>
								<div class="sty1040NRSchPAmtBox" style="height:10mm;width:30mm;text-align:center;font-weight:bold;padding-top:5mm;">(B)</div>
								<div class="sty1040NRSchPAmtBox" style="height:10mm;width:30mm;text-align:center;font-weight:bold;padding-top:5mm;">(C)</div>
								<div class="sty1040NRSchPAmtBox" style="height:10mm;width:30mm;text-align:center;font-weight:bold;padding-top:5mm;">(D)</div>
							</div>
							<!-- Page 2 Line 1 -->
							<div style="width:256mm;">
								<div class="styLNLeftNumBoxSD">1</div>
								<div class="sty1040NRSchPDesc" style="height:4mm;">
									Proceeds/amount realized from the transfer of partnership interest
									<span class="sty1040NRSchPDotLn">..........</span>
								</div>
								<div class="sty1040NRSchPAmtBox" style="height:4mm;">&nbsp;</div>
								<div class="sty1040NRSchPAmtBox" style="height:4mm;">&nbsp;</div>
								<div class="sty1040NRSchPAmtBox" style="height:4mm;">&nbsp;</div>
								<div class="sty1040NRSchPAmtBox" style="height:4mm;">&nbsp;</div>
							</div>
							<!-- Page 2 Line 2 -->
							<div style="width:256mm;">
								<div class="styLNLeftNumBoxSD">2</div>
								<div class="sty1040NRSchPDesc" style="height:4mm;">
									Section 705 outside basis
									<span class="sty1040NRSchPDotLn">.......................</span>
								</div>
								<div class="sty1040NRSchPAmtBox" style="height:4mm;">&nbsp;</div>
								<div class="sty1040NRSchPAmtBox" style="height:4mm;">&nbsp;</div>
								<div class="sty1040NRSchPAmtBox" style="height:4mm;">&nbsp;</div>
								<div class="sty1040NRSchPAmtBox" style="height:4mm;">&nbsp;</div>
							</div>
							<!-- Page 2 Line 3 -->
							<div style="width:256mm;">
								<div class="styLNLeftNumBoxSD">3</div>
								<div class="sty1040NRSchPDesc" style="height:4mm;">
									Total outside gain (loss) on transfer of partnership interest. Subtract line 2 from line 1
									<span class="sty1040NRSchPDotLn">....</span>
								</div>
								<div class="sty1040NRSchPAmtBox" style="height:4mm;">&nbsp;</div>
								<div class="sty1040NRSchPAmtBox" style="height:4mm;">&nbsp;</div>
								<div class="sty1040NRSchPAmtBox" style="height:4mm;">&nbsp;</div>
								<div class="sty1040NRSchPAmtBox" style="height:4mm;">&nbsp;</div>
							</div>
							<!-- Page 2 Line 4 -->
							<div style="width:256mm;">
								<div class="styLNLeftNumBoxSD">4</div>
								<div class="sty1040NRSchPDesc" style="height:7mm;">
									Total outside ordinary gain (loss) that would be recognized on the deemed sale of section<br/> 
									751  property. Enter amount from Schedule K-3 (Form 1065), Part XIII, line 1
									<span class="sty1040NRSchPDotLn">.......</span>
								</div>
								<div class="sty1040NRSchPAmtBox" style="height:7mm;">&nbsp;</div>
								<div class="sty1040NRSchPAmtBox" style="height:7mm;">&nbsp;</div>
								<div class="sty1040NRSchPAmtBox" style="height:7mm;">&nbsp;</div>
								<div class="sty1040NRSchPAmtBox" style="height:7mm;">&nbsp;</div>
							</div>
							<!-- Page 2 Line 5 -->
							<div style="width:256mm;">
								<div class="styLNLeftNumBoxSD">5</div>
								<div class="sty1040NRSchPDesc" style="height:7mm;">
									Total outside capital gain (loss) that would be recognized on the transfer of the partnership<br/> 
									interest. Subtract line 4 from line 3
									<span class="sty1040NRSchPDotLn">....................</span>
								</div>
								<div class="sty1040NRSchPAmtBox" style="height:7mm;">&nbsp;</div>
								<div class="sty1040NRSchPAmtBox" style="height:7mm;">&nbsp;</div>
								<div class="sty1040NRSchPAmtBox" style="height:7mm;">&nbsp;</div>
								<div class="sty1040NRSchPAmtBox" style="height:7mm;">&nbsp;</div>
							</div>
							<!-- Page 2 Line 6 -->
							<div style="width:256mm;">
								<div class="styLNLeftNumBoxSD">6</div>
								<div class="sty1040NRSchPDesc" style="height:10mm;">
									Aggregate effectively connected ordinary gain (loss) that would be recognized on the<br/>
									deemed sale of section 751 property. Enter amount from Schedule K-3 (Form 1065), Part<br/>
									XIII, line 2
									<span class="sty1040NRSchPDotLn">............................</span>
								</div>
								<div class="sty1040NRSchPAmtBox" style="height:10mm;">&nbsp;</div>
								<div class="sty1040NRSchPAmtBox" style="height:10mm;">&nbsp;</div>
								<div class="sty1040NRSchPAmtBox" style="height:10mm;">&nbsp;</div>
								<div class="sty1040NRSchPAmtBox" style="height:10mm;">&nbsp;</div>
							</div>
							<!-- Page 2 Line 7 -->
							<div style="width:256mm;">
								<div class="styLNLeftNumBoxSD">7</div>
								<div class="sty1040NRSchPDesc" style="height:7mm;">
									Aggregate effectively connected capital gain (loss) that would be recognized on the deemed sale<br/>
									of non-section 751 property. Enter amount from Schedule K-3 (Form 1065), Part XIII, line 3
									<span class="sty1040NRSchPDotLn">..</span>
								</div>
								<div class="sty1040NRSchPAmtBox" style="height:7mm;">&nbsp;</div>
								<div class="sty1040NRSchPAmtBox" style="height:7mm;">&nbsp;</div>
								<div class="sty1040NRSchPAmtBox" style="height:7mm;">&nbsp;</div>
								<div class="sty1040NRSchPAmtBox" style="height:7mm;">&nbsp;</div>
							</div>
							<!-- Page 2 Line 8 -->
							<div style="width:256mm;">
								<div class="styLNLeftNumBoxSD">8</div>
								<div class="sty1040NRSchPDesc" style="height:7mm;">
									Recognized effectively connected ordinary gain (loss). Enter the smaller of line 4 or line 6.<br/>
									See instructions
									<span class="sty1040NRSchPDotLn">..........................</span>
								</div>
								<div class="sty1040NRSchPAmtBox" style="height:7mm;">&nbsp;</div>
								<div class="sty1040NRSchPAmtBox" style="height:7mm;">&nbsp;</div>
								<div class="sty1040NRSchPAmtBox" style="height:7mm;">&nbsp;</div>
								<div class="sty1040NRSchPAmtBox" style="height:7mm;">&nbsp;</div>
							</div>
							<!-- Page 2 Line 9 -->
							<div style="width:256mm;">
								<div class="styLNLeftNumBoxSD">9</div>
								<div class="sty1040NRSchPDesc" style="height:7mm;">
									Recognized effectively connected capital gain (loss). Enter the smaller of line 5 or line 7. See<br/>
									instructions
									<span class="sty1040NRSchPDotLn">...........................</span>
								</div>
								<div class="sty1040NRSchPAmtBox" style="height:7mm;">&nbsp;</div>
								<div class="sty1040NRSchPAmtBox" style="height:7mm;">&nbsp;</div>
								<div class="sty1040NRSchPAmtBox" style="height:7mm;">&nbsp;</div>
								<div class="sty1040NRSchPAmtBox" style="height:7mm;">&nbsp;</div>
							</div>
							<div style="width:256mm;">
								<div class="styLNLeftNumBoxSD">&nbsp;</div>
								<div class="sty1040NRSchPDesc" style="height:7mm;padding-left:2mm;">
									<strong>Complete lines 10&ndash;17 only if the capital gain (loss) on line 5 is long term and an<br/>
									amount was reported on your Schedule K-3 (Form 1065), Part XIII, line 4 or line 5.</strong>
								</div>
								<div class="sty1040NRSchPAmtBox" style="height:7mm;background-color:lightgrey;"><br /></div>
								<div class="sty1040NRSchPAmtBox" style="height:7mm;background-color:lightgrey;"><br /></div>
								<div class="sty1040NRSchPAmtBox" style="height:7mm;background-color:lightgrey;"><br /></div>
								<div class="sty1040NRSchPAmtBox" style="height:7mm;background-color:lightgrey;"><br />	
								</div>
							</div>
							<!-- Page 2 Line 10 -->
							<div style="width:256mm;">
								<div class="styLNLeftNumBox">10</div>
								<div class="sty1040NRSchPDesc" style="height:7mm;">
									Total outside collectibles gain that would be recognized on the deemed sale of section<br/>
									1(h)(5) assets. See instructions
									<span class="sty1040NRSchPDotLn">.....................</span>
								</div>
								<div class="sty1040NRSchPAmtBox" style="height:7mm;">&nbsp;</div>
								<div class="sty1040NRSchPAmtBox" style="height:7mm;">&nbsp;</div>
								<div class="sty1040NRSchPAmtBox" style="height:7mm;">&nbsp;</div>
								<div class="sty1040NRSchPAmtBox" style="height:7mm;">&nbsp;</div>
							</div>
							<!-- Page 2 Line 11 -->
							<div style="width:256mm;">
								<div class="styLNLeftNumBox">11</div>
								<div class="sty1040NRSchPDesc" style="height:7mm;">
									Total outside unrecaptured section 1250 gain that would be recognized on the deemed sale<br/> 
									of section 1(h)(6) assets. See instructions
									<span class="sty1040NRSchPDotLn">..................</span>
								</div>
								<div class="sty1040NRSchPAmtBox" style="height:7mm;">&nbsp;</div>
								<div class="sty1040NRSchPAmtBox" style="height:7mm;">&nbsp;</div>
								<div class="sty1040NRSchPAmtBox" style="height:7mm;">&nbsp;</div>
								<div class="sty1040NRSchPAmtBox" style="height:7mm;">&nbsp;</div>
							</div>
							<!-- Page 2 Line 12 -->
							<div style="width:256mm;">
								<div class="styLNLeftNumBox">12</div>
								<div class="sty1040NRSchPDesc" style="height:4mm;">
									Total outside look-through capital gains. Add lines 10 and 11
									<span class="sty1040NRSchPDotLn">............</span>
								</div>
								<div class="sty1040NRSchPAmtBox" style="height:4mm;">&nbsp;</div>
								<div class="sty1040NRSchPAmtBox" style="height:4mm;">&nbsp;</div>
								<div class="sty1040NRSchPAmtBox" style="height:4mm;">&nbsp;</div>
								<div class="sty1040NRSchPAmtBox" style="height:4mm;">&nbsp;</div>
							</div>
							<!-- Page 2 Line 13 -->
							<div style="width:256mm;">
								<div class="styLNLeftNumBox">13</div>
								<div class="sty1040NRSchPDesc" style="height:7mm;">
									Aggregate effectively connected collectibles gain that would be recognized on the deemed<br/>
									sale of section 1(h)(5) assets. Enter amount from Schedule K-3 (Form 1065), Part XIII, line 4	
									<span class="sty1040NRSchPDotLn">..</span>
								</div>
								<div class="sty1040NRSchPAmtBox" style="height:7mm;">&nbsp;</div>
								<div class="sty1040NRSchPAmtBox" style="height:7mm;">&nbsp;</div>
								<div class="sty1040NRSchPAmtBox" style="height:7mm;">&nbsp;</div>
								<div class="sty1040NRSchPAmtBox" style="height:7mm;">&nbsp;</div>
							</div>
							<!-- Page 2 Line 14 -->
							<div style="width:256mm;">
								<div class="styLNLeftNumBox">14</div>
								<div class="sty1040NRSchPDesc" style="height:10mm;">
									Aggregate effectively connected unrecaptured section 1250 gain that would be recognized<br/>
									on the deemed sale of section 1(h)(6) assets. Enter amount from Schedule K-3 (Form 1065),<br/>
									Part XIII, line 5
									<span class="sty1040NRSchPDotLn">..........................</span>
								</div>
								<div class="sty1040NRSchPAmtBox" style="height:10mm;">&nbsp;</div>
								<div class="sty1040NRSchPAmtBox" style="height:10mm;">&nbsp;</div>
								<div class="sty1040NRSchPAmtBox" style="height:10mm;">&nbsp;</div>
								<div class="sty1040NRSchPAmtBox" style="height:10mm;">&nbsp;</div>
							</div>
							<!-- Page 2 Line 15 -->
							<div style="width:256mm;">
								<div class="styLNLeftNumBox">15</div>
								<div class="sty1040NRSchPDesc" style="height:4mm;">
									Total aggregate effectively connected look-through capital gains. Add lines 13 and 14
									<span class="sty1040NRSchPDotLn">....</span>
								</div>
								<div class="sty1040NRSchPAmtBox" style="height:4mm;">&nbsp;</div>
								<div class="sty1040NRSchPAmtBox" style="height:4mm;">&nbsp;</div>
								<div class="sty1040NRSchPAmtBox" style="height:4mm;">&nbsp;</div>
								<div class="sty1040NRSchPAmtBox" style="height:4mm;">&nbsp;</div>
							</div>
							<!-- Page 2 Line 16 -->
							<div style="width:256mm;">
								<div class="styLNLeftNumBox">16</div>
								<div class="sty1040NRSchPDesc" style="height:10mm;">
									If the amount entered on line 9 is from line 5, then enter the amount from line 12. If the<br/>
									amount entered on line 9 is from line 7, then enter the amount from line 15. See instructions<br/>
									for whether and where to report lines 10 and 11 or lines 13 and 14 on your Form 1040-NR
									<span class="sty1040NRSchPDotLn">..</span>
								</div>
								<div class="sty1040NRSchPAmtBox" style="height:10mm;">&nbsp;</div>
								<div class="sty1040NRSchPAmtBox" style="height:10mm;">&nbsp;</div>
								<div class="sty1040NRSchPAmtBox" style="height:10mm;">&nbsp;</div>
								<div class="sty1040NRSchPAmtBox" style="height:10mm;">&nbsp;</div>
							</div>
							<!-- Page 2 Line 17 -->
							<div style="width:256mm;">
								<div class="styLNLeftNumBox">17</div>
								<div class="sty1040NRSchPDesc" style="height:7mm;">
									Recognized effectively connected residual long-term capital gain (loss). Subtract line 16 from<br/>
									line 9. See instructions	
									<span class="sty1040NRSchPDotLn">........................</span>
								</div>
								<div class="sty1040NRSchPAmtBox" style="height:7mm;">&nbsp;</div>
								<div class="sty1040NRSchPAmtBox" style="height:7mm;">&nbsp;</div>
								<div class="sty1040NRSchPAmtBox" style="height:7mm;">&nbsp;</div>
								<div class="sty1040NRSchPAmtBox" style="height:7mm;">&nbsp;</div>
							</div>
							<!-- Page 2 Line 18 -->
							<div style="width:256mm;">
								<div class="styLNLeftNumBox">18</div>
								<div class="sty1040NRSchPDesc" style="height:10mm;">
									Capital gain (loss) that would be recognized under section 897(g) on the deemed sale of U.S.<br/>
									real property interests. Enter the amount from Schedule K-3 (Form 1065), Part XIII, line 7. See<br/>
									instructions
									<span class="sty1040NRSchPDotLn">...........................</span>
								</div>
								<div class="sty1040NRSchPAmtBox" style="height:10mm;border-bottom-width:0px;">&nbsp;</div>
								<div class="sty1040NRSchPAmtBox" style="height:10mm;border-bottom-width:0px;">&nbsp;</div>
								<div class="sty1040NRSchPAmtBox" style="height:10mm;border-bottom-width:0px;">&nbsp;</div>
								<div class="sty1040NRSchPAmtBox" style="height:10mm;border-bottom-width:0px;">&nbsp;</div>
							</div>
						</xsl:if>
					<!-- Page 2 footer-->
					<div class="styStdDiv pageEnd" style="border-top:1px solid black;width:256mm;">
						<span style="float:right;">
							<strong>Schedule P (Form 1040-NR) 2025</strong>
						</span>
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
					</table>
					<!-- Page 1 separated table -->
					<xsl:if test="$shouldSeparateP1">
						<br/>
						<br/>
						<span class="styRepeatingDataTitle">Part I - Foreign Partner's Interests in Certain Partnerships Transferred During Tax Year</span>
						<table class="styDepTbl" cellspacing="0" style="height:15mm;font-size:7pt;width:256mm;">
							<thead class="styTableThead">
								<tr class="styDepTblHdr">
									<th class="styDepTblCell" scope="col" style="width:5mm;font-weight:normal;border-width:0px 0px 1px 0px;">
									</th>
									<th class="styDepTblCell" scope="col" style="width:50mm;font-weight:normal;padding-right:5mm;">
										<strong>(a)</strong> Name of partnership
									</th>
									<th class="styDepTblCell" scope="col" style="width:60mm;font-weight:normal;">
										<strong>(b)</strong> Address
									</th>
									<th class="styDepTblCell" scope="col" style="width:25mm;font-weight:normal;">
										<strong>(c)</strong> Employer <br/> Identification <br/> Number (EIN)
									</th>
									<th class="styDepTblCell" scope="col" style="width:25mm;font-weight:normal;">
										<strong>(d)(1)</strong> Percentage <br/> interest transferred
									</th>
									<th class="styDepTblCell" scope="col" style="width:40mm;font-weight:normal;">
										<strong>(d)(2)</strong> Units transferred
									</th>
									<th class="styDepTblCell" scope="col" style="width:40mm;font-weight:normal;">
										<strong>(e)</strong> Date acquired <br/> (mm/dd/yyyy)
									</th>
									<th class="styDepTblCell" scope="col" style="width:40mm;font-weight:normal;border-right-width:0px;">
										<strong>(f)</strong> Date transferred <br/> (mm/dd/yyyy)
									</th>
								</tr>
							</thead>
							<tbody style="font-size:6pt;">
								<xsl:for-each select="$FormData/FrgnPrtnrIntPrtshpDuringTYGrp">
									<tr style="height:20mm;vertical-align:top;">
										<td class="styTableCellTextInherit" style="width:5mm;padding-top:2mm;vertical-align:top;border-width:0px 0px 1px 0px;font-weight:bold;">												
											<xsl:number format="A" value="position()"/>
										</td>
										<td class="styTableCellTextInherit" style="width:45mm;font-weight:normal;vertical-align:top;padding-top:2mm;">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="PartnershipName/BusinessNameLine1Txt"/>
											</xsl:call-template>
											<xsl:if test="PartnershipName/BusinessNameLine2Txt">
												<br/>
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="PartnershipName/BusinessNameLine2Txt"/>
												</xsl:call-template>
											</xsl:if>
										</td>
										<td class="styTableCellTextInherit" style="padding-left:1mm;padding-top:2mm;">
											<xsl:choose>
												<xsl:when test="PartnershipUSAddress">
													<xsl:call-template name="PopulateUSAddressTemplate">
														<xsl:with-param name="TargetNode" select="PartnershipUSAddress"/>
													</xsl:call-template>
												</xsl:when>
												<xsl:otherwise>
													<xsl:call-template name="PopulateForeignAddressTemplate">
														<xsl:with-param name="TargetNode" select="PartnershipForeignAddress"/>
													</xsl:call-template>
												</xsl:otherwise>
											</xsl:choose>
										</td>
										<td class="styTableCellCtrInherit" style="padding-top:2mm;">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="PartnershipEIN"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellCtrInherit" style="padding-top:2mm;">
											<xsl:call-template name="PopulatePercent">
												<xsl:with-param name="TargetNode" select="PartnershipIntTransferredPct"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellCtrInherit" style="padding-top:2mm;">										
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="PartnershipUnitsTransferredNum"/>
											</xsl:call-template>
										</td>												
										<td class="styTableCellTextInherit" style="padding-left:10mm;padding-top:2mm;">
											<xsl:call-template name="PopulateMonthDayYear">
												<xsl:with-param name="TargetNode" select="AcquiredDt"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellTextInherit" style="padding-top:2mm;padding-left:10mm;border-right-width:0px;">
											<xsl:call-template name="PopulateMonthDayYear">
												<xsl:with-param name="TargetNode" select="PartnershipIntTransferredDt"/>
											</xsl:call-template>
										</td>
									</tr>
								</xsl:for-each>
							</tbody>
						</table>
					</xsl:if>
				</form>
			</body>
		</html>
	</xsl:template>
	<xsl:template name="FillTable7Cols">
		<xsl:param name="LineNumber"/>
		<xsl:param name="SepMessage" select="false()"/>
		<xsl:param name="MaxLine" select="4"/>
		<xsl:param name="RowID" select="true()"/>
		<tr style="height:20mm;vertical-align:top;">
			<td class="styTableCellTextInherit" style="vertical-align:top;padding-top:2mm;font-weight:bold;border-right-width:0px;">
				<xsl:choose>
					<xsl:when test="not($RowID)">&nbsp;</xsl:when>
					<xsl:when test="$SepMessage">A</xsl:when>
					<xsl:otherwise>
						<xsl:number value="$LineNumber" format="A"/>
					</xsl:otherwise>
				</xsl:choose>
			</td>
			<td class="styTableCellTextInherit">
				<xsl:if test="$SepMessage">See additional data</xsl:if>
					&nbsp;</td>
			<td class="styTableCellTextInherit">&nbsp;</td>
			<td class="styTableCellTextInherit">&nbsp;</td>
			<td class="styTableCellTextInherit">&nbsp;</td>
			<td class="styTableCellAmtInherit">&nbsp;</td>
			<td class="styTableCellTextInherit">&nbsp;</td>
			<td class="styTableCellTextInherit" style="border-right-width:0px;">&nbsp;</td>
		</tr>
		<xsl:choose>
			<xsl:when test="$SepMessage">
				<xsl:call-template name="FillTable7Cols">
					<xsl:with-param name="LineNumber" select="2"/>
					<xsl:with-param name="SepMessage" select="false()"/>
					<xsl:with-param name="MaxLine" select="$MaxLine"/>
					<xsl:with-param name="RowID" select="$RowID"/>
				</xsl:call-template>
			</xsl:when>
			<xsl:when test="$LineNumber &lt; $MaxLine">
				<xsl:call-template name="FillTable7Cols">
					<xsl:with-param name="LineNumber" select="$LineNumber + 1"/>
					<xsl:with-param name="MaxLine" select="$MaxLine"/>
					<xsl:with-param name="RowID" select="$RowID"/>
				</xsl:call-template>
			</xsl:when>
			<xsl:otherwise/>
		</xsl:choose>
	</xsl:template>
	<xsl:template name="FillTable4Cols">
		<xsl:param name="LineNumber"/>
		<xsl:param name="SepMessage" select="false()"/>
		<xsl:param name="MaxLine" select="4"/>
		<xsl:param name="RowID" select="true()"/>
		<tr style="height:20mm;vertical-align:top;">
			<td class="styTableCellTextInherit" style="vertical-align:top;padding-top:2mm;font-weight:bold;">
				<xsl:choose>
					<xsl:when test="not($RowID)">&nbsp;</xsl:when>
					<xsl:when test="$SepMessage">A</xsl:when>
					<xsl:otherwise>
						<xsl:number value="$LineNumber" format="A"/>
					</xsl:otherwise>
				</xsl:choose>
			</td>
			<td class="styTableCellTextInherit">
				<xsl:if test="$SepMessage">See additional data</xsl:if>
					&nbsp;</td>
			
			<td class="styTableCellAmtInherit">&nbsp;</td>
			
			<td class="styTableCellAmtInherit" style="border-right-width:0px;">&nbsp;</td>
		</tr>
		<xsl:choose>
			<xsl:when test="$SepMessage">
				<xsl:call-template name="FillTable4Cols">
					<xsl:with-param name="LineNumber" select="2"/>
					<xsl:with-param name="SepMessage" select="false()"/>
					<xsl:with-param name="MaxLine" select="$MaxLine"/>
					<xsl:with-param name="RowID" select="$RowID"/>
				</xsl:call-template>
			</xsl:when>
			<xsl:when test="$LineNumber &lt; $MaxLine">
				<xsl:call-template name="FillTable4Cols">
					<xsl:with-param name="LineNumber" select="$LineNumber + 1"/>
					<xsl:with-param name="MaxLine" select="$MaxLine"/>
					<xsl:with-param name="RowID" select="$RowID"/>
				</xsl:call-template>
			</xsl:when>
			<xsl:otherwise/>
		</xsl:choose>
	</xsl:template>
</xsl:stylesheet>