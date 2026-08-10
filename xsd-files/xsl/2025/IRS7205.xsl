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
	<xsl:include href="IRS7205Style.xsl"/>
	<xsl:output method="html" indent="yes"/>
	<xsl:strip-space elements="*"/>
	<xsl:param name="FormData" select="$RtnDoc/IRS7205"/>
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
				<meta name="Description" content="IRS Form 7205"/>
				<script language="JavaScript" src="{$ScriptPath}/FormDisplay.js" type="text/javascript"/>
				<xsl:call-template name="InitJS"/>
				<style type="text/css">
					<xsl:if test="not($Print) or $Print=''">
					<xsl:call-template name="AddOnStyle"/>
					<xsl:call-template name="IRS7205Style"/>
					</xsl:if>
				</style>
				<xsl:call-template name="GlobalStylesForm"/>
			</head>
			<body class="styBodyClass">
				<form id="Form7205">
					<xsl:call-template name="DocumentHeader"/>
					<!-- Page 1 -->
					<!-- Header -->
					<div class="styStdDiv">
						<div class="styFNBox" style="width:31mm;height:19mm;border-right-width:2px;">
							Form <span class="styFN" style="font-size:16pt;">7205</span>
							<div style="font-size:7pt;">(Rev. December 2023)</div>
							<br/>
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$FormData"/>
							</xsl:call-template>
							<br/>
							<div class="styAgency" style="padding-top:.mm;">Department of the Treasury
								<br/>Internal Revenue Service
							</div>
						</div>
						<div class="styFTBox" style="width:127mm;height:19mm;">
							<span class="styFMT" style="font-size:12pt;">Energy Efficient Commercial Buildings Deduction</span>
							<br/>
							
							<span style="padding-top:2mm;">
								<strong>Attach to your tax return.</strong>
							</span>
							<br/>
							<span >
								<strong>Go to
								<span style="font-style:italic;">www.irs.gov/Form7205</span>
								for instructions and the latest information.
								</strong>
							</span>
						</div>
						<div class="styOMB" style="width:28mm;height:19mm;border-left-width:2px;padding-top: 9mm;border-bottom-width: 0px;text-align:center;">  
							OMB No. 1545-2004
						</div>
					</div>
					<!-- Filer information section -->
					<div class="styStdDiv" style="border-top:1px solid black;border-bottom:1px solid black;">
						<div class="styNameBox" style="width:125mm;">
							Name(s) shown on return<br/>
							<xsl:call-template name="PopulateReturnHeaderFiler">
								<xsl:with-param name="TargetNode">BusinessNameLine1Txt</xsl:with-param>
							</xsl:call-template>
							<br/>
							<xsl:call-template name="PopulateReturnHeaderFiler">
								<xsl:with-param name="TargetNode">BusinessNameLine2Txt</xsl:with-param>
							</xsl:call-template>
						</div>
						<div class="styEINBox" style="width:62mm;padding-left:0.5mm;font-weight:normal;">
							<span style="font-weight:bold">Identifying number</span><br/>
							<xsl:call-template name="PopulateReturnHeaderFilerTIN"/>
						</div>
					</div>
					<div style="padding-top:.5mm;width:187mm;min-height:5mm;">
						<span style="font-size:8pt">Claiming deduction as (check one): </span>
						<span style="width:2mm;"></span>
						<input type="Checkbox" class="styCkboxNM" alt="Building Owner IND">
							<xsl:call-template name="PopulateCheckbox">
								<xsl:with-param name="TargetNode" select="$FormData/BuildingOwnerInd"/>
								<xsl:with-param name="BackupName">IRS7205BuildingOwnerInd</xsl:with-param>
							</xsl:call-template>
						</input>
						<span style="width:2mm;"/>
						<span>Building owner</span>
						<span style="width:3mm;"/>
						<input type="Checkbox" class="styCkboxNM" alt="EEP Designer Ind">
							<xsl:call-template name="PopulateCheckbox">
								<xsl:with-param name="TargetNode" select="$FormData/EEPDesignerInd"/>
								<xsl:with-param name="BackupName">IRS7205EEPDesignerInd</xsl:with-param>
							</xsl:call-template>
						</input>
						<span style="width:2mm;"/>
						<span>Designer of energy efficient property (EEP)</span>
					</div>
					<!-- ************************** PART I START ************************** -->
					<!-- Part I - Information About Entity Submitting This Form -->
					<div class="styStdDiv" style="border-top:1px solid black; border-bottom:1px solid black;">
						<div class="styPartName" style="width:12mm;font-size:10pt;padding-bottom:4.5mm;font-family:arial;text-align:center;padding-top:.5mm">Part I</div>
						<div class="styPartDesc" style="width:140mm;font-size:10pt;padding-bottom:4.5mm;padding-top:.3mm">
							Building and EEP Information <span style="font-weight:normal;">(see instructions)</span>
						</div>
						<div style="float:right;width:4mm;height:3mm;">
							<xsl:call-template name="SetDynamicTableToggleButton">
								<xsl:with-param name="TargetNode" select="$FormData/EnergyBuildingDeductionGrp"/>
								<xsl:with-param name="containerID" select=" 'Part1Table1' "/>
								<xsl:with-param name="headerHeight" select="2"/>
								<xsl:with-param name="containerHeight" select="4"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Part I - Table 1 - Begin -->
					<xsl:variable name="shouldSeparatePart1Table1" select="($Print = $Separated) and (count($FormData/EnergyBuildingDeductionGrp) &gt; 4)"/>
					<div class="styStdDiv" id="Part1Table1">
						<xsl:call-template name="SetInitialState"/>
						<table class="styTable" style="border-collapse:collapse;font-size:6pt;">
							<thead class="styTableThead">
								<tr>
									<th class="styTableCellHeader" scope="col" style="min-width:5mm;max-width:5mm;vertical-align:top;">
									1
								</th>
									<th class="styTableCellHeader" scope="col" style="min-width:32mm;font-weight:normal;vertical-align:top;">
									<strong>(a)</strong> Address of building
								</th>
									<th class="styTableCellHeader" scope="col" style="min-width:17mm;font-weight:normal;vertical-align:top;">
									<strong>(b)</strong> Date EEP placed in service (see instructions)
								</th>
									<th class="styTableCellHeader" scope="col" style="min-width:27mm;font-weight:normal;vertical-align:top;">
									<strong>(c)</strong> Energy efficient commercial building property 
									(EECBP) system computed energy savings percentage, or 
									energy efficient building retrofit property (EEBRP) energy use intensity reduction
								</th>
									<th class="styTableCellHeader" scope="col" style="min-width:10mm;font-weight:normal;vertical-align:top;">
									<strong>(d)</strong> Check if Increased Deduction Amount criteria are met (see instructions)
								</th>
									<th class="styTableCellHeader" scope="col" style="min-width:10mm;font-weight:normal;vertical-align:top;">
									<strong>(e)</strong> Check if EEBRP was installed under a Qualified Retrofit Plan
								</th>
									<th class="styTableCellHeader" scope="col" style="min-width:18mm;font-weight:normal;vertical-align:top;">
									<strong>(f)</strong> Potential amount per square foot
								</th>
									<th class="styTableCellHeader" scope="col" style="min-width:30mm;font-weight:normal;vertical-align:top;">
									<strong>(g)</strong> Building square footage
								</th>
									<th class="styTableCellHeader" scope="col" style="min-width:18mm;font-weight:normal;vertical-align:top;border-right-width:0px;">
									<strong>(h)</strong> Potential section 179D deduction amount (multiply column 1(f) by column 1(g))
								</th>
								</tr>
							</thead>
							<tbody style="font-size:6pt;">
								<xsl:if test="not($shouldSeparatePart1Table1)">
									<xsl:for-each select="$FormData/EnergyBuildingDeductionGrp">
										<tr>
											<td class="styTableCell" style="font-weight:bold;text-align:center;">
												<xsl:number format="A" value="position()"/>
											</td>
											<td class="styTableCellTextInherit">
												<xsl:call-template name="PopulateUSAddressTemplate">
													<xsl:with-param name="TargetNode" select="BuildingUSAddress"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellCtrInherit">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="EEPPlacedInServiceDt"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellAmtInherit">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="EECBPEgySavIntensityRedRt"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellCtrInherit">
												<input class="styCkbox" type="checkbox">
													<xsl:attribute name="alt">Row <xsl:number format="A" value="position()"/> Increased Deduction Amount Met Ind</xsl:attribute>
													<xsl:call-template name="PopulateCheckbox">
														<xsl:with-param name="TargetNode" select="IncreasedDeductionAmtMetInd"/>
														<xsl:with-param name="BackupName">IRS7205IncreasedDeductionAmtMetInd<xsl:number format="1" value="position()"/>
														</xsl:with-param>
													</xsl:call-template>
												</input>
											</td>
											<td class="styTableCellCtrInherit">
												<input class="styCkbox" type="checkbox">
													<xsl:attribute name="alt">Row <xsl:number format="A" value="position()"/> EEBRP was installed under a Qualified Retrofit Plan Indicator</xsl:attribute>
													<xsl:call-template name="PopulateCheckbox">
														<xsl:with-param name="TargetNode" select="EEBRPQlfyRetrofitPlanInd"/>
														<xsl:with-param name="BackupName">IRS7205EEBRPQlfyRetrofitPlanInd<xsl:number format="1" value="position()"/>
														</xsl:with-param>
													</xsl:call-template>
												</input>
											</td>
											<td class="styTableCellAmtInherit">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="PotPerSqFtAmt"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellAmtInherit">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="BuildingSquareFootageNum"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellAmtInherit" style="border-right-width:0px;">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="PotentialSect179DDedAmt"/>
												</xsl:call-template>
											</td>
										</tr>
									</xsl:for-each>
								</xsl:if>
								<xsl:if test="$shouldSeparatePart1Table1 or count($FormData/EnergyBuildingDeductionGrp) &lt; 4">
									<xsl:call-template name="FillTable9Cols">
										<xsl:with-param name="LineNumber" select="1 + count($FormData/EnergyBuildingDeductionGrp)"/>
										<xsl:with-param name="SepMessage" select="$shouldSeparatePart1Table1"/>
									</xsl:call-template>
								</xsl:if>
							</tbody>
						</table>
					</div>
					<xsl:if test="not($shouldSeparatePart1Table1)">
						<xsl:call-template name="SetInitialDynamicTableHeight">
							<xsl:with-param name="TargetNode" select="$FormData/EnergyBuildingDeductionGrp"/>
							<xsl:with-param name="containerID" select=" 'Part1Table1' "/>
							<xsl:with-param name="headerHeight" select="2"/>
							<xsl:with-param name="containerHeight" select="4"/>
						</xsl:call-template>
					</xsl:if>
					<!-- Part I - End -->
					<!-- ************************** PART II START ************************** -->
					<!-- Part II - Computation of Energy Efficient Commercial Buildings Deduction Amount -->
					<div class="styStdDiv" style="border-top:1px solid black; border-bottom:1px solid black;">
						<div class="styPartName" style="width:12mm;font-size:10pt;padding-bottom:4.5mm;font-family:arial;text-align:center;padding-top:.5mm">Part II</div>
						<div class="styPartDesc" style="width:166mm;font-size:9pt;padding-bottom:4.5mm;padding-top:.3mm">
							Computation of Energy Efficient Commercial Buildings Deduction Amount <span style="font-weight:normal;">(see instructions)</span>
						</div>
						<div style="display:inline;width:4mm;height:3mm;">
							<xsl:call-template name="SetDynamicTableToggleButton">
								<xsl:with-param name="TargetNode" select="$FormData/EnergyBuildingDeductionGrp"/>
								<xsl:with-param name="containerID" select=" 'Part2Table1' "/>
								<xsl:with-param name="headerHeight" select="2"/>
								<xsl:with-param name="containerHeight" select="4"/>
							</xsl:call-template>
							<div style="display:inline;float:right;width:4mm;height:3mm;">
							<xsl:call-template name="SetDynamicTableToggleButton">
								<xsl:with-param name="TargetNode" select="$FormData/EnergyBuildingDeductionGrp"/>
								<xsl:with-param name="containerID" select=" 'Part2Table2' "/>
								<xsl:with-param name="headerHeight" select="2"/>
								<xsl:with-param name="containerHeight" select="4"/>
							</xsl:call-template>
						</div>
						</div>
					</div>
					<xsl:variable name="shouldSeparatePart2Table1" select="($Print = $Separated) and (count($FormData/EnergyBuildingDeductionGrp) &gt; 4)"/>
					<div class="styStdDiv" id="Part2Table1">
						<xsl:call-template name="SetInitialState"/>
						<table class="styTable" style="border-collapse:collapse;font-size:6pt;">
							<thead class="styTableThead">
								<tr style="vertical-align:top;">
									<th class="styTableCellHeader" scope="col" style="width:5mm;min-width:5mm;max-width:5mm;">
										2
									</th>
									<th class="styTableCellHeader" scope="col" style="min-width:27mm;font-weight:normal;">
										<strong>(a)</strong> Total per square foot amount claimed in prior years (see instructions)
									</th>
									<th class="styTableCellHeader" scope="col" style="min-width:27mm;font-weight:normal;">
										<strong>(b)</strong> Subtract column 2(a) from the maximum amount allowed (see instructions)
									</th>
									<th class="styTableCellHeader" scope="col" style="min-width:25mm;font-weight:normal;">
										<strong>(c)</strong> Check if the amount in column 2(b) is greater than or equal to column 1(f)
									</th>
									<th class="styTableCellHeader" scope="col" style="min-width:40mm;font-weight:normal;">
										<strong>(d)</strong> If column 2(c) if checked, enter amount from column 1(h), skip column 2(e) and column 2(f)
										and go to column 2(g)
									</th>
									<th class="styTableCellHeader" scope="col" style="min-width:25mm;font-weight:normal;">
										<strong>(e)</strong> Check if the amount from column 2(b) is less than the amount in column 1(f)
									</th>
									<th class="styTableCellHeader" scope="col" style="min-width:30mm;font-weight:normal;border-right-width:0px;">
										<strong>(f)</strong> If column 2(e) is checked, multiply column 2(b) by column 1(g)
									</th>
								</tr>
							</thead>
							<tbody style="font-size:6pt;">
								<xsl:if test="not($shouldSeparatePart2Table1)">
									<xsl:for-each select="$FormData/EnergyBuildingDeductionGrp">
										<tr>
											<td class="styTableCell" style="font-weight:bold;text-align:center;">
													<xsl:number format="A" value="position()"/>
												</td>
											<td class="styTableCellAmtInherit">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="PriorYearTotalSqFtClaimedAmt"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellAmtInherit">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="CYSqFtClaimedAmt"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellCtrInherit">
													<input class="styCkbox" type="checkbox">
														<xsl:attribute name="alt">Row <xsl:number format="A" value="position()"/> Current tax year square foot is greater or equal to total potential square foot indicator</xsl:attribute>
														<xsl:call-template name="PopulateCheckbox">
															<xsl:with-param name="TargetNode" select="Potential179DGrp/CYSqFtGrtrEqualPotPerSqFtInd"/>
															<xsl:with-param name="BackupName">IRS7205CYSqFtGrtrEqualPotPerSqFtInd<xsl:number format="1" value="position()"/>
															</xsl:with-param>
														</xsl:call-template>
													</input>
											</td>
											<td class="styTableCellAmtInherit">
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="Potential179DGrp/PotSect179DDedOrEnterZeroAmt"/>
													</xsl:call-template>
											</td>
											<td class="styTableCellCtrInherit">
													<input class="styCkbox" type="checkbox">
														<xsl:attribute name="alt">Row <xsl:number format="A" value="position()"/> Current tax year square foot less square footage total potential indicator</xsl:attribute>
														<xsl:call-template name="PopulateCheckbox">
															<xsl:with-param name="TargetNode" select="BuildingSquareFootageGrp/CYSqFtLessThanPotPerSqFtInd"/>
															<xsl:with-param name="BackupName">IRS7205CYSqFtLessThanPotPerSqFtInd<xsl:number format="1" value="position()"/>
															</xsl:with-param>
														</xsl:call-template>
													</input>
											</td>
											<td class="styTableCellAmtInherit" style="border-right-width:0px;">
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="BuildingSquareFootageGrp/CYSqFootTimesBldgSqFtAmt"/>
													</xsl:call-template>
											</td>
										</tr>
									</xsl:for-each>
								</xsl:if>
								<xsl:if test="$shouldSeparatePart2Table1 or count($FormData/EnergyBuildingDeductionGrp) &lt; 4">
									<xsl:call-template name="FillTable7Cols">
										<xsl:with-param name="LineNumber" select="1 + count($FormData/EnergyBuildingDeductionGrp)"/>
										<xsl:with-param name="SepMessage" select="$shouldSeparatePart2Table1"/>
									</xsl:call-template>
								</xsl:if>
							</tbody>
						</table>
					</div>
					<xsl:if test="not($shouldSeparatePart2Table1)">
						<xsl:call-template name="SetInitialDynamicTableHeight">
							<xsl:with-param name="TargetNode" select="$FormData/EnergyBuildingDeductionGrp"/>
							<xsl:with-param name="containerID" select=" 'Part2Table1' "/>
							<xsl:with-param name="headerHeight" select="2"/>
							<xsl:with-param name="containerHeight" select="4"/>
						</xsl:call-template>
					</xsl:if>
					<xsl:variable name="shouldSeparatePart2Table2" select="($Print = $Separated) and (count($FormData/EnergyBuildingDeductionGrp) &gt; 4)"/>
					<div class="styStdDiv" id="Part2Table2">
						<xsl:call-template name="SetInitialState"/>
						<table class="styTable" style="border-collapse:collapse;font-size:7pt;">
							<thead class="styTableThead">
								<tr style="vertical-align:top;">
									<th class="styTableCellHeader" scope="col" style="width:5mm;max-width:5mm;min-width:5mm;font-weight:normal;">
									</th>
									<th class="styTableCellHeader" scope="col" style="min-width:35mm;font-weight:normal;">
										<strong>(g)</strong> Cost of EEP placed in service during the tax year (see instructions if building ownership percentage is less than 100%)
									</th>
									<th class="styTableCellHeader" scope="col" style="min-width:35mm;font-weight:normal;">
										<strong>(h)</strong> Enter the greater of column 2(d) or column 2(f) (see instructions if building ownership percentage is less than 100%)
									</th>
									<th class="styTableCellHeader" scope="col" style="min-width:25mm;font-weight:normal;">
										<strong>(i)</strong> Enter the lesser of column 2(g) or column 2(h)
									</th>
									<th class="styTableCellHeader" scope="col" style="min-width:40mm;font-weight:normal;">
										<strong>(j)</strong> Designers enter the amount of the section 179D deduction allocated to you as the designer (see instructions)
									</th>
									<th class="styTableCellHeader" scope="col" style="min-width:40mm;font-weight:normal;border-right-width:0px;">
										<strong>(k)</strong> Section 179D deduction for the building 
										(designers, enter the lesser of column 2(i) or column 2(j); building owners, enter the amount from 2(i))
									</th>
								</tr>
							</thead>
							<tbody style="font-size:6pt;">
								<xsl:if test="not($shouldSeparatePart2Table2)">
									<xsl:for-each select="$FormData/EnergyBuildingDeductionGrp">
										<tr>
											<td class="styTableCell" style="font-weight:bold;text-align:center;">
												<xsl:number format="A" value="position()"/>
											</td>
											<td class="styTableCellAmtInherit">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="EEPCostsAmt"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellAmtInherit">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="GreaterThanPotSect179DDedAmt"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellAmtInherit">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="LesserThanPotSect179DDedAmt"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellAmtInherit">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="Sect179DDedAllocDesignerAmt"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellAmtInherit" style="border-right-width:0px;">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="Sect179DDedBuildingAmt"/>
												</xsl:call-template>
											</td>
										</tr>
									</xsl:for-each>
								</xsl:if>
								<xsl:if test="$shouldSeparatePart2Table2 or count($FormData/EnergyBuildingDeductionGrp) &lt; 4">
									<xsl:call-template name="FillTable6Cols">
										<xsl:with-param name="LineNumber" select="1 + count($FormData/EnergyBuildingDeductionGrp)"/>
										<xsl:with-param name="SepMessage" select="$shouldSeparatePart2Table2"/>
									</xsl:call-template>
								</xsl:if>
							</tbody>
						</table>
					</div>
					<xsl:if test="not($shouldSeparatePart2Table2)">
						<xsl:call-template name="SetInitialDynamicTableHeight">
							<xsl:with-param name="TargetNode" select="$FormData/EnergyBuildingDeductionGrp"/>
							<xsl:with-param name="containerID" select=" 'Part2Table1' "/>
							<xsl:with-param name="headerHeight" select="2"/>
							<xsl:with-param name="containerHeight" select="4"/>
						</xsl:call-template>
					</xsl:if>
					<!-- Part II Line 3 -->
					<div class="styStdDiv" style="height:7mm;width:187mm;">
						<div class="styLNLeftNumBox" style="width:5mm;">3</div>
						<div class="styLNDesc" style="height:7mm;width:132.75mm;">
							<strong>Total section 179D deduction.</strong> Add amounts from column 2(k). Enter here and on the appropriate<br/>
							line of your return. See instructions
							<span class="sty7205DotLn">....................</span>
						</div>
						<div class="styLNRightNumBox" style="height:7mm;border-bottom:0px;width:9mm;">
							<br/>
							<strong>3</strong>
						</div>
						<div class="styLNAmountBox" style="height:7mm;border-bottom:0px;width:40mm;">
							<br/>
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/EnergyEffcntCmrclBldgDedAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Part II - End -->
					<!-- ************************** PART III START ************************** -->
					<!-- Part III - Information About the Pass-Through Partner (Only fill out this section if this statement is being submitted by a pass-through partner.) -->
					<div class="styStdDiv" style="border-top:1px solid black; border-bottom:1px solid black;">
						<div class="styPartName" style="width:12mm;font-size:10pt;padding-bottom:4.5mm;font-family:arial;text-align:center;padding-top:.5mm">Part III</div>
						<div class="styPartDesc" style="width:170mm;font-size:10pt;padding-bottom:4.5mm;padding-top:.3mm">
							Certification Information for Each Property Listed in Part I <span style="font-weight:normal;">(see instructions)</span>
						</div>
						<div style="float:right;width:4mm;height:3mm;">
							<xsl:call-template name="SetDynamicTableToggleButton">
								<xsl:with-param name="TargetNode" select="$FormData/EnergyBuildingDeductionGrp"/>
								<xsl:with-param name="containerID" select=" 'Part3Table1' "/>
								<xsl:with-param name="headerHeight" select="2"/>
								<xsl:with-param name="containerHeight" select="4"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Part III Table 1 -->
					<xsl:variable name="shouldSeparatePart3Table1" select="($Print = $Separated) and (count($FormData/EnergyBuildingDeductionGrp) &gt; 4)"/>
					<div class="styStdDiv" id="Part3Table1">
						<xsl:call-template name="SetInitialState"/>
						<table class="styTable" style="border-collapse:collapse;font-size:7pt;">
							<thead class="styTableThead">
								<tr style="vertical-align:top;">
									<th class="styTableCellHeader" scope="col" style="width:5mm;min-width:5mm;max-width:5mm;font-weight:normal;">
										<strong>4</strong>
									</th>
									<th class="styTableCellHeader" scope="col" style="min-width:50mm;font-weight:normal;">
										<strong>(a)</strong> Name of Qualified Individual completing certification
									</th>
									<th class="styTableCellHeader" scope="col" style="min-width:20mm;font-weight:normal;">
										<strong>(b)</strong> Date of certification
									</th>
									<th class="styTableCellHeader" scope="col" style="min-width:50mm;font-weight:normal;">
										<strong>(c)</strong> Employer of Qualified Individual
									</th>
									<th class="styTableCellHeader" scope="col" style="min-width:57mm;font-weight:normal;border-right-width:0px;">
										<strong>(d)</strong> Address of Qualified Individual
									</th>
								</tr>
							</thead>
							<tbody style="font-size:6pt;">
								<xsl:if test="not($shouldSeparatePart3Table1)">
									<xsl:for-each select="$FormData/EnergyBuildingDeductionGrp">
										<tr>
											<td class="styTableCell" style="font-weight:bold;text-align:center;">
												<xsl:number format="A" value="position()"/>
											</td>
											<td class="styTableCellTextInherit">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="QualifiedIndividualNm"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellCtrInherit">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="CertificationDt"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellTextInherit">
												<xsl:choose>
													<xsl:when test="QlfyIndivBusinessEmplrName">
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="QlfyIndivBusinessEmplrName/BusinessNameLine1Txt"/>
														</xsl:call-template>
														<br/>
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="QlfyIndivBusinessEmplrName/BusinessNameLine2Txt"/>
														</xsl:call-template>
													</xsl:when>
													<xsl:otherwise>
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="QlfyIndivPersonEmplrName"/>
														</xsl:call-template>
													</xsl:otherwise>
												</xsl:choose>
											</td>
											<td class="styTableCellTextInherit" style="border-right-width:0px;">
												<xsl:call-template name="PopulateUSAddressTemplate">
													<xsl:with-param name="TargetNode" select="QualifiedIndividualUSAddress"/>
												</xsl:call-template>
											</td>
										</tr>
									</xsl:for-each>
								</xsl:if>
								<xsl:if test="$shouldSeparatePart3Table1 or count($FormData/EnergyBuildingDeductionGrp) &lt; 4">
									<xsl:call-template name="FillTable5Cols">
										<xsl:with-param name="LineNumber" select="1 + count($FormData/EnergyBuildingDeductionGrp)"/>
										<xsl:with-param name="SepMessage" select="$shouldSeparatePart3Table1"/>
									</xsl:call-template>
								</xsl:if>
							</tbody>
						</table>
					</div>
					<xsl:if test="not($shouldSeparatePart3Table1)">
						<xsl:call-template name="SetInitialDynamicTableHeight">
							<xsl:with-param name="TargetNode" select="$FormData/EnergyBuildingDeductionGrp"/>
							<xsl:with-param name="containerID" select=" 'Part3Table1' "/>
							<xsl:with-param name="headerHeight" select="2"/>
							<xsl:with-param name="containerHeight" select="4"/>
						</xsl:call-template>
					</xsl:if>
					<!-- Part III - End -->
					<!-- ************************** PART IV START ************************** -->
					<!-- Part IV - Designer Allocation Information for Each Property Listed in Part I (to be completed by Designer only) -->
					<div class="styStdDiv" style="border-top:1px solid black; border-bottom:1px solid black;">
						<div class="styPartName" style="width:12mm;font-size:10pt;padding-bottom:4.5mm;font-family:arial;text-align:center;padding-top:.5mm">Part IV</div>
						<div class="styPartDesc" style="width:170mm;font-size:8.5pt;padding-bottom:4.5mm;padding-top:.3mm">
							Designer Allocation Information for Each Property Listed in Part I <span style="font-weight:normal">(to be completed by Designer only)</span>
						</div>
						<div style="float:right;width:4mm;height:3mm;">
							<xsl:call-template name="SetDynamicTableToggleButton">
								<xsl:with-param name="TargetNode" select="$FormData/EnergyBuildingDeductionGrp/DesignerAllocationInfoPropGrp"/>
								<xsl:with-param name="containerID" select=" 'Part4Table1' "/>
								<xsl:with-param name="headerHeight" select="2"/>
								<xsl:with-param name="containerHeight" select="4"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Part IV Table 1 -->
					<xsl:variable name="shouldSeparatePart4Table1" select="($Print = $Separated) and (count($FormData/EnergyBuildingDeductionGrp/DesignerAllocationInfoPropGrp) &gt; 4)"/>
					<div class="styStdDiv" id="Part4Table1">
						<xsl:call-template name="SetInitialState"/>
						<table class="styTable" style="border-collapse:collapse;font-size:7pt;">
							<thead class="styTableThead">
								<tr style="vertical-align:top;">
									<th class="styTableCellHeader" scope="col" style="width:5mm;">
										5
									</th>
									<th class="styTableCellHeader" scope="col" style="min-width:50mm;font-weight:normal;">
										<strong>(a)</strong> Identified owner of building
									</th>
									<th class="styTableCellHeader" scope="col" style="min-width:20mm;font-weight:normal;">
										<strong>(b)</strong> Date of allocation
									</th>
									<th class="styTableCellHeader" scope="col" style="min-width:50mm;font-weight:normal;">
										<strong>(c)</strong> Name of building owner's authorized representative completing allocation
									</th>
									<th class="styTableCellHeader" scope="col" style="min-width:57mm;font-weight:normal;border-right-width:0px;">
										<strong>(d)</strong> Address of building owner's authorized representative
									</th>
								</tr>
							</thead>
							<tbody style="font-size:6pt;">
								<xsl:if test="not($shouldSeparatePart4Table1)">
									<xsl:for-each select="$FormData/EnergyBuildingDeductionGrp/DesignerAllocationInfoPropGrp">
										<tr>
											<td class="styTableCell" style="font-weight:bold;text-align:center;">
												<xsl:number format="A" value="position()"/>
											</td>
											<td class="styTableCellTextInherit">
                                                <xsl:call-template name="PopulateText">
                                                    <xsl:with-param name="TargetNode" select="BuildingOwnerName/BusinessNameLine1Txt"/>
                                                </xsl:call-template>
                                                <br/>
                                                <xsl:call-template name="PopulateText">
                                                    <xsl:with-param name="TargetNode" select="BuildingOwnerName/BusinessNameLine2Txt"/>
                                                </xsl:call-template>
											</td>
											<td class="styTableCellCtrInherit">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="AllocationDt"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellTextInherit">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="AuthorizedRepNm"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellTextInherit" style="border-right-width:0px;">
												<xsl:call-template name="PopulateUSAddressTemplate">
													<xsl:with-param name="TargetNode" select="AuthorizedRepUSAddress"/>
												</xsl:call-template>
											</td>
										</tr>
									</xsl:for-each>
								</xsl:if>
								<xsl:if test="$shouldSeparatePart4Table1 or count($FormData/EnergyBuildingDeductionGrp/DesignerAllocationInfoPropGrp) &lt; 4">
									<xsl:call-template name="FillTable5Cols">
										<xsl:with-param name="LineNumber" select="1 + count($FormData/EnergyBuildingDeductionGrp/DesignerAllocationInfoPropGrp)"/>
										<xsl:with-param name="SepMessage" select="$shouldSeparatePart4Table1"/>
									</xsl:call-template>
								</xsl:if>
							</tbody>
						</table>
					</div>
					<xsl:if test="not($shouldSeparatePart4Table1)">
						<xsl:call-template name="SetInitialDynamicTableHeight">
							<xsl:with-param name="TargetNode" select="$FormData/EnergyBuildingDeductionGrp/DesignerAllocationInfoPropGrp"/>
							<xsl:with-param name="containerID" select=" 'Part4Table1' "/>
							<xsl:with-param name="headerHeight" select="2"/>
							<xsl:with-param name="containerHeight" select="4"/>
						</xsl:call-template>
					</xsl:if>
					<!-- Part IV - End -->
					<div class="pageEnd" style="width:187mm;">
						<span class="styBoldText" style="width:100mm;">For Paperwork Reduction Act Notice, see separate instructions.</span>
						<span style="width:37mm; text-align:center;">Cat. No. 56398R</span>
						<div style="float:right;clear:none;">
							<span style="width:50mm;text-align:right;">Form <span style="font-size:9pt;">
									<b>7205</b>
								</span> (Rev.12-2023)</span>
						</div>
					</div>
					<!-- End of page 1 -->
					<!-- Additional Data title bar and button -->
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
					<!-- Part I Separated Table 1 -->
					<xsl:if test="$shouldSeparatePart1Table1">
						<br/>
						<br/>
						<span class="styRepeatingDataTitle"> </span>
						<table class="styDepTbl" cellspacing="0" style="font-size:7pt;">
							<thead class="styTableThead">
									<tr class="styDepTblHdr">
										<th class="styDepTblCell" scope="col" style="min-width:5mm;max-width:5mm;vertical-align:top;">
										1
									</th>
										<th class="styDepTblCell" scope="col" style="min-width:32mm;font-weight:normal;vertical-align:top;">
										<strong>(a)</strong> Address of building
									</th>
										<th class="styDepTblCell" scope="col" style="min-width:17mm;font-weight:normal;vertical-align:top;">
										<strong>(b)</strong> Date EEP placed in service (see instructions)
									</th>
										<th class="styDepTblCell" scope="col" style="min-width:30mm;font-weight:normal;vertical-align:top;">
										<strong>(c)</strong> Energy efficient commercial building property 
										(EECBP) system computed energy savings percentage, or 
										energy efficient building retrofit property (EEBRP) energy use intensity reduction
									</th>
										<th class="styDepTblCell" scope="col" style="min-width:10mm;font-weight:normal;vertical-align:top;">
										<strong>(d)</strong> Check if Increased Deduction Amount criteria are met (see instructions)
									</th>
										<th class="styDepTblCell" scope="col" style="min-width:10mm;font-weight:normal;vertical-align:top;">
										<strong>(e)</strong> Check if EEBRP was installed under a Qualified Retrofit Plan
									</th>
										<th class="styDepTblCell" scope="col" style="min-width:18mm;font-weight:normal;vertical-align:top;">
										<strong>(f)</strong> Potential amount per square foot
									</th>
										<th class="styDepTblCell" scope="col" style="min-width:30mm;font-weight:normal;vertical-align:top;">
										<strong>(g)</strong> Building square footage
									</th>
										<th class="styDepTblCell" scope="col" style="min-width:18mm;font-weight:normal;vertical-align:top;border-right-width:0px;">
										<strong>(h)</strong> Potential section 179D deduction amount (multiply column 1(f) by column 1(g))
									</th>
									</tr>
								</thead>
							<tbody>
								<xsl:for-each select="$FormData/EnergyBuildingDeductionGrp">
									<tr style="height:7.5mm;vertical-align:bottom;">
										<xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
										<td class="styTableCell" style="font-weight:bold;text-align:center;">
											<xsl:number format="A" value="position()"/>
										</td>
										<td class="styTableCellTextInherit">
											<xsl:call-template name="PopulateUSAddressTemplate">
												<xsl:with-param name="TargetNode" select="BuildingUSAddress"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellCtrInherit">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="EEPPlacedInServiceDt"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellAmtInherit">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="EECBPEgySavIntensityRedRt"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellCtrInherit">
											<input class="styCkbox" type="checkbox">
												<xsl:attribute name="alt">Row <xsl:number format="A" value="position()"/> Increased Deduction Amount Met indicator</xsl:attribute>
												<xsl:call-template name="PopulateCheckbox">
													<xsl:with-param name="TargetNode" select="IncreasedDeductionAmtMetInd"/>
													<xsl:with-param name="BackupName">IRS7205IncreasedDeductionAmtMetInd<xsl:number format="1" value="position()"/>
													</xsl:with-param>
												</xsl:call-template>
											</input>
										</td>
										<td class="styTableCellCtrInherit">
											<input class="styCkbox" type="checkbox">
												<xsl:attribute name="alt">Row <xsl:number format="A" value="position()"/> EEBRP was installed under a Qualified Retrofit Plan Indicator</xsl:attribute>
												<xsl:call-template name="PopulateCheckbox">
													<xsl:with-param name="TargetNode" select="EEBRPQlfyRetrofitPlanInd"/>
													<xsl:with-param name="BackupName">IRS7205EEBRPQlfyRetrofitPlanInd<xsl:number format="1" value="position()"/>
													</xsl:with-param>
												</xsl:call-template>
											</input>
										</td>
										<td class="styTableCellAmtInherit">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="PotPerSqFtAmt"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellAmtInherit">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="BuildingSquareFootageNum"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellAmtInherit" style="border-right-width:0px;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="PotentialSect179DDedAmt"/>
											</xsl:call-template>
										</td>
									</tr>
								</xsl:for-each>
							</tbody>
						</table>
					</xsl:if>
				
					<!-- Part II Separated Table 1 -->
					<xsl:if test="$shouldSeparatePart2Table1">
						<br/>
						<br/>
						<span class="styRepeatingDataTitle"> </span>
						<table class="styDepTbl" cellspacing="0" style="font-size:7pt;">
							<thead class="styTableThead">
								<tr class="styDepTblHdr" style="vertical-align:top;">
									<th class="styTableCellHeader" scope="col" style="width:5mm;min-width:5mm;max-width:5mm;">
										2
									</th>
									<th class="styTableCellHeader" scope="col" style="min-width:27mm;font-weight:normal;">
										<strong>(a)</strong> Total per square foot amount claimed in prior years (see instructions)
									</th>
									<th class="styTableCellHeader" scope="col" style="min-width:27mm;font-weight:normal;">
										<strong>(b)</strong> Subtract column 2(a) from the maximum amount allowed (see instructions)
									</th>
									<th class="styTableCellHeader" scope="col" style="min-width:25mm;font-weight:normal;">
										<strong>(c)</strong> Check if the amount in column 2(b) is greater than or equal to column 1(f)
									</th>
									<th class="styTableCellHeader" scope="col" style="min-width:40mm;font-weight:normal;">
										<strong>(d)</strong> If column 2(c) if checked, enter amount from column 1(h), skip column 2(e) and column 2(f)
										and go to column 2(g)
									</th>
									<th class="styTableCellHeader" scope="col" style="min-width:25mm;font-weight:normal;">
										<strong>(e)</strong> Check if the amount from column 2(b) is less than the amount in column 1(f)
									</th>
									<th class="styTableCellHeader" scope="col" style="min-width:30mm;font-weight:normal;border-right-width:0px;">
										<strong>(f)</strong> If column 2(e) is checked, multiply column 2(b) by column 1(g)
									</th>
								</tr>
								</thead>
							<tbody>
								<xsl:for-each select="$FormData/EnergyBuildingDeductionGrp">
									<tr style="height:7.5mm;vertical-align:bottom;">
										<xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
											<td class="styTableCell" style="font-weight:bold;text-align:center;">
													<xsl:number format="A" value="position()"/>
												</td>
											<td class="styTableCellAmtInherit">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="PriorYearTotalSqFtClaimedAmt"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellAmtInherit">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="CYSqFtClaimedAmt"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellCtrInherit">
												<input class="styCkbox" type="checkbox">
													<xsl:attribute name="alt">Row <xsl:number format="A" value="position()"/> Current tax year square foot is greater or equal to total potential square foot indicator</xsl:attribute>
													<xsl:call-template name="PopulateCheckbox">
														<xsl:with-param name="TargetNode" select="Potential179DGrp/CYSqFtGrtrEqualPotPerSqFtInd"/>
														<xsl:with-param name="BackupName">IRS7205CYSqFtGrtrEqualPotPerSqFtInd<xsl:number format="1" value="position()"/>
														</xsl:with-param>
													</xsl:call-template>
												</input>
											</td>
											<td class="styTableCellAmtInherit">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="Potential179DGrp/PotSect179DDedOrEnterZeroAmt"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellCtrInherit">
												<input class="styCkbox" type="checkbox">
													<xsl:attribute name="alt">Row <xsl:number format="A" value="position()"/> Current tax year square foot less square footage total potential indicator</xsl:attribute>
													<xsl:call-template name="PopulateCheckbox">
														<xsl:with-param name="TargetNode" select="BuildingSquareFootageGrp/CYSqFtLessThanPotPerSqFtInd"/>
														<xsl:with-param name="BackupName">IRS7205CYSqFtLessThanPotPerSqFtInd<xsl:number format="1" value="position()"/>
														</xsl:with-param>
													</xsl:call-template>
												</input>
											</td>
											<td class="styTableCellAmtInherit" style="border-right-width:0px;">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="BuildingSquareFootageGrp/CYSqFootTimesBldgSqFtAmt"/>
												</xsl:call-template>
											</td>
										</tr>
								</xsl:for-each>
							</tbody>
						</table>
					</xsl:if>
					<!-- Part II Separated Table 2 -->
					<xsl:if test="$shouldSeparatePart2Table2">
						<br/>
						<br/>
						<span class="styRepeatingDataTitle"> </span>
						<table class="styDepTbl" cellspacing="0" style="font-size:7pt;">
							<thead class="styTableThead">
								<tr class="styDepTblHdr" style="vertical-align:top;">
									<th class="styDepTblCell" scope="col" style="width:5mm;max-width:5mm;min-width:5mm;font-weight:normal;">
									</th>
									<th class="styDepTblCell" scope="col" style="min-width:35mm;font-weight:normal;">
										<strong>(g)</strong> Cost of EEP placed in service during the tax year (see instructions if building ownership percentage is less than 100%)
									</th>
									<th class="styDepTblCell" scope="col" style="min-width:35mm;font-weight:normal;">
										<strong>(h)</strong> Enter the greater of column 2(d) or column 2(f) (see instructions if building ownership percentage is less than 100%)
									</th>
									<th class="styDepTblCell" scope="col" style="min-width:25mm;font-weight:normal;">
										<strong>(i)</strong> Enter the lesser of column 2(g) or column 2(h)
									</th>
									<th class="styDepTblCell" scope="col" style="min-width:40mm;font-weight:normal;">
										<strong>(j)</strong> Designers enter the amount of the section 179D deduction allocated to you as the designer (see instructions)
									</th>
									<th class="styDepTblCell" scope="col" style="min-width:40mm;font-weight:normal;border-right-width:0px;">
										<strong>(k)</strong> Section 179D deduction for the building 
										(designers, enter the lesser of column 2(i) or column 2(j); building owners, enter the amount from 2(i)
									</th>
								</tr>
								</thead>
							<tbody>
								<xsl:for-each select="$FormData/EnergyBuildingDeductionGrp">
									<tr style="height:7.5mm;vertical-align:bottom;">
										<xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
											<td class="styTableCell" style="font-weight:bold;text-align:center;">
												<xsl:number format="A" value="position()"/>
											</td>
											<td class="styTableCellAmtInherit">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="EEPCostsAmt"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellAmtInherit">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="GreaterThanPotSect179DDedAmt"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellAmtInherit">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="LesserThanPotSect179DDedAmt"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellAmtInherit">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="Sect179DDedAllocDesignerAmt"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellAmtInherit" style="border-right-width:0px;">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="Sect179DDedBuildingAmt"/>
												</xsl:call-template>
											</td>
										</tr>
								</xsl:for-each>
							</tbody>
						</table>
					</xsl:if>
					<!-- Part III Separated Table 1 -->
					<xsl:if test="$shouldSeparatePart3Table1">
						<br/>
						<br/>
						<span class="styRepeatingDataTitle"> </span>
						<table class="styDepTbl" cellspacing="0" style="font-size:7pt;">
							<thead class="styTableThead">
								<tr class="styDepTblHdr" style="vertical-align:top;">
									<th class="styDepTblCell" scope="col" style="width:5mm;min-width:5mm;max-width:5mm;font-weight:normal;">
										<strong>4</strong>
									</th>
									<th class="styDepTblCell" scope="col" style="min-width:50mm;font-weight:normal;">
										<strong>(a)</strong> Name of Qualified Individual completing certification
									</th>
									<th class="styDepTblCell" scope="col" style="min-width:20mm;font-weight:normal;">
										<strong>(b)</strong> Date of certification
									</th>
									<th class="styDepTblCell" scope="col" style="min-width:50mm;font-weight:normal;">
										<strong>(c)</strong> Employer of Qualified Individual
									</th>
									<th class="styDepTblCell" scope="col" style="min-width:57mm;font-weight:normal;border-right-width:0px;">
										<strong>(d)</strong> Address of Qualified Individual
									</th>
								</tr>
								</thead>
							<tbody>
								<xsl:for-each select="$FormData/EnergyBuildingDeductionGrp">
									<tr style="height:7.5mm;vertical-align:bottom;">
										<xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
											<td class="styTableCell" style="font-weight:bold;text-align:center;">
												<xsl:number format="A" value="position()"/>
											</td>
											<td class="styTableCellTextInherit">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="QualifiedIndividualNm"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellCtrInherit">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="CertificationDt"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellTextInherit">
												<xsl:choose>
													<xsl:when test="QlfyIndivBusinessEmplrName">
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="QlfyIndivBusinessEmplrName/BusinessNameLine1Txt"/>
														</xsl:call-template>
														<br/>
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="QlfyIndivBusinessEmplrName/BusinessNameLine2Txt"/>
														</xsl:call-template>
													</xsl:when>
													<xsl:otherwise>
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="QlfyIndivPersonEmplrName"/>
														</xsl:call-template>
													</xsl:otherwise>
												</xsl:choose>
											</td>
											<td class="styTableCellTextInherit" style="border-right-width:0px;">
												<xsl:call-template name="PopulateUSAddressTemplate">
													<xsl:with-param name="TargetNode" select="QualifiedIndividualUSAddress"/>
												</xsl:call-template>
											</td>
										</tr>
								</xsl:for-each>
							</tbody>
						</table>
					</xsl:if>
					<!-- Part IV Separated Table 1 -->
					<xsl:if test="$shouldSeparatePart4Table1">
						<br/>
						<br/>
						<span class="styRepeatingDataTitle"> </span>
						<table class="styDepTbl" cellspacing="0" style="font-size:7pt;">
							<thead class="styTableThead">
								<tr class="styDepTblHdr" style="vertical-align:top;">
									<th class="styTableCellHeader" scope="col" style="width:5mm;">
										5
									</th>
									<th class="styTableCellHeader" scope="col" style="min-width:50mm;font-weight:normal;">
										<strong>(a)</strong> Identified owner of building
									</th>
									<th class="styTableCellHeader" scope="col" style="min-width:20mm;font-weight:normal;">
										<strong>(b)</strong> Date of allocation
									</th>
									<th class="styTableCellHeader" scope="col" style="min-width:50mm;font-weight:normal;">
										<strong>(c)</strong> Name of building owner's authorized representative completing allocation
									</th>
									<th class="styTableCellHeader" scope="col" style="min-width:57mm;font-weight:normal;border-right-width:0px;">
										<strong>(d)</strong> Address of building owner's authorized representative
									</th>
								</tr>
								</thead>
							<tbody>
								<xsl:for-each select="$FormData/EnergyBuildingDeductionGrp/DesignerAllocationInfoPropGrp">
									<tr style="height:7.5mm;vertical-align:bottom;">
										<xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
											<td class="styTableCell" style="font-weight:bold;text-align:center;">
												<xsl:number format="A" value="position()"/>
											</td>
											<td class="styTableCellTextInherit">
                                                <xsl:call-template name="PopulateText">
                                                    <xsl:with-param name="TargetNode" select="BuildingOwnerName/BusinessNameLine1Txt"/>
                                                </xsl:call-template>
                                                <br/>
                                                <xsl:call-template name="PopulateText">
                                                    <xsl:with-param name="TargetNode" select="BuildingOwnerName/BusinessNameLine2Txt"/>
                                                </xsl:call-template>
											</td>
											<td class="styTableCellCtrInherit">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="AllocationDt"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellTextInherit">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="AuthorizedRepNm"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellTextInherit" style="border-right-width:0px;">
												<xsl:call-template name="PopulateUSAddressTemplate">
													<xsl:with-param name="TargetNode" select="AuthorizedRepUSAddress"/>
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
	<xsl:template name="FillTable9Cols">
		<xsl:param name="LineNumber"/>
		<xsl:param name="SepMessage" select="false()"/>
		<xsl:param name="MaxLine" select="4"/>
		<tr style="height:3.5mm;">
			<td class="styTableCellCtrInherit" style="font-weight:bold;">
				<xsl:choose>
					<xsl:when test="$SepMessage">A</xsl:when>
					<xsl:otherwise><xsl:number format="A" value="$LineNumber"/></xsl:otherwise>
				</xsl:choose>
			</td>
			<td class="styTableCellCtrInherit"><xsl:choose>
				<xsl:when test="$SepMessage">
                    See Additional <br/> Data Table
				</xsl:when>
					<xsl:otherwise>
						&nbsp;
					</xsl:otherwise>
				</xsl:choose>
			</td>
			<td class="styTableCellTextInherit">&nbsp;</td>
			<td class="styTableCellCtrInherit">&nbsp;</td>
			<td class="styTableCellCtrInherit">						
				<input class="styCkbox" type="checkbox">
					<xsl:attribute name="alt">Row <xsl:number format="A" value="$LineNumber"/> Increased Deduction Amount Met Indicator</xsl:attribute>
					<xsl:call-template name="PopulateCheckbox">
						<xsl:with-param name="TargetNode" select="/.."/>
						<xsl:with-param name="BackupName">
							<xsl:value-of select="$LineNumber"/>
						</xsl:with-param>
					</xsl:call-template>
				</input>
			</td>
			<td class="styTableCellCtrInherit">
				<input class="styCkbox" type="checkbox">
					<xsl:attribute name="alt">Row <xsl:number format="A" value="$LineNumber"/> EEBRP was installed under a Qualified Retrofit Plan Indicator</xsl:attribute>
					<xsl:call-template name="PopulateCheckbox">
						<xsl:with-param name="TargetNode" select="/.."/>
						<xsl:with-param name="BackupName">
							<xsl:value-of select="$LineNumber"/>
						</xsl:with-param>
					</xsl:call-template>
				</input>
			</td>
			<td class="styTableCellAmtInherit">&nbsp;</td>
			<td class="styTableCellCtrInherit">&nbsp;</td>
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
	<xsl:template name="FillTable7Cols">
		<xsl:param name="LineNumber"/>
		<xsl:param name="SepMessage" select="false()"/>
		<xsl:param name="MaxLine" select="4"/>
		<tr style="height:3.5mm;">
			<td class="styTableCellCtrInherit" style="font-weight:bold;">
				<xsl:choose>
					<xsl:when test="$SepMessage">A</xsl:when>
					<xsl:otherwise><xsl:number format="A" value="$LineNumber"/></xsl:otherwise>
				</xsl:choose>
			</td>
			<td class="styTableCellCtrInherit"><xsl:choose>
					<xsl:when test="$SepMessage">
                    See Additional <br/> Data Table
				</xsl:when>
					<xsl:otherwise>
						&nbsp;
					</xsl:otherwise>
				</xsl:choose>
			</td>
			<td class="styTableCellTextInherit">&nbsp;</td>
			<td class="styTableCellCtrInherit">
				<input class="styCkbox" type="checkbox">
					<xsl:attribute name="alt">Row <xsl:number format="A" value="$LineNumber"/> Current tax year square foot is greater or equal to total potential square foot indicator</xsl:attribute>
					<xsl:call-template name="PopulateCheckbox">
						<xsl:with-param name="TargetNode" select="/.."/>
						<xsl:with-param name="BackupName">
							<xsl:value-of select="$LineNumber"/>
						</xsl:with-param>
					</xsl:call-template>
				</input>
			</td>
			<td class="styTableCellTextInherit">&nbsp;</td>
			<td class="styTableCellCtrInherit">
				<input class="styCkbox" type="checkbox">
					<xsl:attribute name="alt">Row <xsl:number format="A" value="$LineNumber"/> Current tax year square foot less square footage total potential indicator</xsl:attribute>
					<xsl:call-template name="PopulateCheckbox">
						<xsl:with-param name="TargetNode" select="/.."/>
						<xsl:with-param name="BackupName">
							<xsl:value-of select="$LineNumber"/>
						</xsl:with-param>
					</xsl:call-template>
				</input>
			</td>
			<td class="styTableCellAmtInherit" style="border-right-width:0px;">&nbsp;</td>
		</tr>
		<xsl:choose>
			<xsl:when test="$SepMessage">
				<xsl:call-template name="FillTable7Cols">
					<xsl:with-param name="LineNumber" select="2"/>
					<xsl:with-param name="SepMessage" select="false()"/>
				</xsl:call-template>
			</xsl:when>
			<xsl:when test="$LineNumber &lt; $MaxLine">
				<xsl:call-template name="FillTable7Cols">
					<xsl:with-param name="LineNumber" select="$LineNumber + 1"/>
					<xsl:with-param name="MaxLine" select="$MaxLine"/>
				</xsl:call-template>
			</xsl:when>
			<xsl:otherwise/>
		</xsl:choose>
	</xsl:template>
	<xsl:template name="FillTable6Cols">
		<xsl:param name="LineNumber"/>
		<xsl:param name="SepMessage" select="false()"/>
		<xsl:param name="MaxLine" select="4"/>
		<tr style="height:3.5mm;">
			<td class="styTableCellCtrInherit" style="font-weight:bold;">
				<xsl:choose>
					<xsl:when test="$SepMessage">A</xsl:when>
					<xsl:otherwise><xsl:number format="A" value="$LineNumber"/></xsl:otherwise>
				</xsl:choose>
			</td>
			<td class="styTableCellCtrInherit"><xsl:choose>
					<xsl:when test="$SepMessage">
                    See Additional <br/> Data Table
				</xsl:when>
					<xsl:otherwise>
						&nbsp;
					</xsl:otherwise>
				</xsl:choose>
			</td>
			<td class="styTableCellTextInherit">&nbsp;</td>
			<td class="styTableCellTextInherit">&nbsp;</td>
			<td class="styTableCellTextInherit">&nbsp;</td>
			<td class="styTableCellAmtInherit" style="border-right-width:0px;">&nbsp;</td>
		</tr>
		<xsl:choose>
			<xsl:when test="$SepMessage">
				<xsl:call-template name="FillTable6Cols">
					<xsl:with-param name="LineNumber" select="2"/>
					<xsl:with-param name="SepMessage" select="false()"/>
				</xsl:call-template>
			</xsl:when>
			<xsl:when test="$LineNumber &lt; $MaxLine">
				<xsl:call-template name="FillTable6Cols">
					<xsl:with-param name="LineNumber" select="$LineNumber + 1"/>
					<xsl:with-param name="MaxLine" select="$MaxLine"/>
				</xsl:call-template>
			</xsl:when>
			<xsl:otherwise/>
		</xsl:choose>
	</xsl:template>
	<xsl:template name="FillTable5Cols">
		<xsl:param name="LineNumber"/>
		<xsl:param name="SepMessage" select="false()"/>
		<xsl:param name="MaxLine" select="4"/>
		<tr style="height:3.5mm;">
			<td class="styTableCellCtrInherit" style="font-weight:bold;">
				<xsl:choose>
					<xsl:when test="$SepMessage">A</xsl:when>
					<xsl:otherwise><xsl:number format="A" value="$LineNumber"/></xsl:otherwise>
				</xsl:choose>
			</td>
			<td class="styTableCellCtrInherit"><xsl:choose>
					<xsl:when test="$SepMessage">
                    See Additional <br/> Data Table
				</xsl:when>
					<xsl:otherwise>
						&nbsp;
					</xsl:otherwise>
				</xsl:choose>
			</td>
			<td class="styTableCellTextInherit">&nbsp;</td>
			<td class="styTableCellTextInherit">&nbsp;</td>
			<td class="styTableCellAmtInherit" style="border-right-width:0px;">&nbsp;</td>
		</tr>
		<xsl:choose>
			<xsl:when test="$SepMessage">
				<xsl:call-template name="FillTable5Cols">
					<xsl:with-param name="LineNumber" select="2"/>
					<xsl:with-param name="SepMessage" select="false()"/>
				</xsl:call-template>
			</xsl:when>
			<xsl:when test="$LineNumber &lt; $MaxLine">
				<xsl:call-template name="FillTable5Cols">
					<xsl:with-param name="LineNumber" select="$LineNumber + 1"/>
					<xsl:with-param name="MaxLine" select="$MaxLine"/>
				</xsl:call-template>
			</xsl:when>
			<xsl:otherwise/>
		</xsl:choose>
	</xsl:template>
</xsl:stylesheet>