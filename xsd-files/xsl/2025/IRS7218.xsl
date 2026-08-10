<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE xsl:stylesheet [
  <!ENTITY nbsp "&#160;">
  <!ENTITY mdash "&#8212;">
]>
	<!-- 09/04/2024 - 993082/992049 - AJH -->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:include href="PopulateTemplate.xsl" />
	<xsl:include href="AddHeader.xsl" />
	<xsl:include href="CommonPathRef.xsl" />
	<xsl:include href="AddOnTable.xsl" />
	<xsl:include href="IRS7218Style.xsl" />
	<xsl:output method="html" indent="yes" />
	<xsl:strip-space elements="*" />
	<xsl:param name="FormData" select="$RtnDoc/IRS7218" />
	<xsl:template match="/">
		<xsl:text disable-output-escaping="yes">&lt;!DOCTYPE html&gt;</xsl:text>
		<html lang="EN-US">
			<head>
				<meta http-equiv="X-UA-Compatible" content="IE=edge" />
				<title>
					<xsl:call-template name="FormTitle">
						<xsl:with-param name="RootElement" select="local-name($FormData)" />
					</xsl:call-template>
				</title>
				<!-- No Browser Caching -->
				<meta http-equiv="Pragma" content="no-cache" />
				<meta http-equiv="Cache-Control" content="no-cache" />
				<meta http-equiv="Expires" content="0" />
				<!-- No Proxy Caching -->
				<meta http-equiv="Cache-Control" content="private" />
				<!-- Define Character Set -->
				<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
				<meta name="Description" content="IRS Form 7218" />
				<script language="JavaScript" src="{$ScriptPath}/FormDisplay.js" type="text/javascript" />
				<xsl:call-template name="InitJS" />
				<style type="text/css">
					<xsl:if test="not($Print) or $Print=''">
						<xsl:call-template name="IRS7218Style" />
						<xsl:call-template name="AddOnStyle" />
					</xsl:if>
				</style>
				<xsl:call-template name="GlobalStylesForm" />
			</head>
			<body class="styBodyClass">
				<form id="Form7218">
					<xsl:call-template name="DocumentHeader" />
					<!-- Page 1 -->
					<!-- Header -->
					<div class="styStdDiv">
						<div class="styFNBox" style="width:30mm;height:22.5mm;">
							Form <span class="styFN" style="font-size:18pt;">7218</span> 
							<br />
							(December 2024)
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$FormData" />
							</xsl:call-template>
							<br /><br />
							<span class="styAgency">
								Department of the Treasury <br />
								Internal Revenue Service
							</span>
						</div>
						<div class="styFTBox" style="width:127mm;height:22.5mm;">
							<span class="styFMT" style="font-size:14pt;padding-top:1mm;padding-bottom:1mm;">Clean Fuel Production Credit</span>
							<br /><br />
							<span style="font-weight:bold;">
								Attach to your tax return.
							</span><br /><br />
							<span style="font-weight:bold;">
								Go to
								<span style="font-style:italic">www.irs.gov/Form7218</span>
								for instructions and the latest information.
							</span>
						</div>
						<div class="styTYBox" style="width:30mm;height:22.5mm;">
							<div class="styOMB" style="height:auto;font-size:6pt;padding-top:3mm;padding-bottom:3mm;">OMB No. 1545-XXXX</div>
							<div style="margin-left:3mm;text-align:left;font-size:7pt;padding-top:3mm;">
								Attachment<br/>Sequence No. 
								<span class="styBoldText" style="font-size:9pt;">218</span>
							</div>
						</div>
					</div>
					<!-- Filer information section -->
					<div class="styStdDiv" style="border-top:1px solid black;border-bottom:1px solid black;">
						<div class="styNameBox" style="width:125mm;">
							Name(s) shown on return<br />
							<xsl:call-template name="PopulateReturnHeaderFiler">
								<xsl:with-param name="TargetNode">BusinessNameLine1Txt</xsl:with-param>
							</xsl:call-template><br />
							<xsl:call-template name="PopulateReturnHeaderFiler">
								<xsl:with-param name="TargetNode">BusinessNameLine2Txt</xsl:with-param>
							</xsl:call-template>
						</div>
						<div class="styEINBox" style="width:62mm;padding-left:0.5mm;font-weight:normal;">
							<strong>Identifying number</strong><br />
							<xsl:call-template name="PopulateReturnHeaderFilerTIN"/>
						</div>
					</div>
					<!-- Part 1 -->
					<div class="styStdDiv" style="border-bottom:1px solid black;border-top:1px solid black;">
						<div class="styPartName">Part I</div>
						<div class="styPartDesc">
							Facility and Other Information 
							<span style="font-weight:normal;">(see instructions)</span>
						</div>
					</div>
					<div class="styStdDiv">
						<div class="styLNDesc" style="height:auto;width:100%;">
							<strong>Caution: </strong> The facility must be a qualified facility under section 45Z(d)(4). Your eligibility to claim this credit is 
							restricted if you have taken credits for this facility related to section 45V, section 46 (to the extent such credit is attributable 
							to a section 48(a)(15) election), or section 45Q. See instructions.
						</div>
					</div>
					<!-- Line 1 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD">1</div>
						<div class="styLNDesc" style="width:144.9mm;">If making an elective payment election or transfer election, enter the IRS-issued registration number of the facility: </div>
						<div class="styLNDesc" style="width:32mm;border-bottom:1px dashed black;height:auto;text-align:center;">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/FacilityIRSIssdRegistrationNum"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 2a -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD">2a</div>
						<div class="styLNDesc" style="width:34mm;">Description of facility: </div>
						<div class="styLNDesc" style="width:144mm;min-height:3.5mm;height:auto;border-bottom:1px dashed black;margin-bottom:1px;">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/FacilityDesc"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 2b -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD" style="padding-left:4.2mm;">b</div>
						<div class="styLNDesc" style="width:66mm;">If different than filer, enter <strong>(i)</strong> owner's name</div>
						<div class="styLNDesc" style="width:112mm;min-height:3.5mm;height:auto;border-bottom:1px dashed black;margin-bottom:1px;">
							<xsl:choose>
								<xsl:when test="$FormData/FacilityOwnerPersonNm">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$FormData/FacilityOwnerPersonNm"/>
									</xsl:call-template>
								</xsl:when>
								<xsl:otherwise>
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$FormData/FacilityOwnerBusinessName/BusinessNameLine1Txt"/>
									</xsl:call-template>
									<xsl:if test="$FormData/FacilityOwnerBusinessName/BusinessNameLine2Txt">
										<br />
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$FormData/FacilityOwnerBusinessName/BusinessNameLine2Txt"/>
										</xsl:call-template>
									</xsl:if>
								</xsl:otherwise>
							</xsl:choose>
						</div>
					</div>
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD">&nbsp;</div>
						<div class="styLNDesc" style="width:39mm;">and <strong>(ii)</strong> owner's TIN</div>
						<div class="styLNDesc" style="width:139mm;min-height:3.5mm;height:auto;border-bottom:1px dashed black;margin-bottom:1px;">
							<span style="text-align:left;width:100%;">
								<xsl:choose>
									<xsl:when test="$FormData/FacilityOwnerSSN">											
										<xsl:call-template name="PopulateSSN">
											<xsl:with-param name="TargetNode" select="$FormData/FacilityOwnerSSN"/>
										</xsl:call-template>
									</xsl:when>
									<xsl:otherwise>
										<xsl:call-template name="PopulateEIN">
											<xsl:with-param name="TargetNode" select="$FormData/FacilityOwnerEIN"/>
										</xsl:call-template>
									</xsl:otherwise>
								</xsl:choose>
							</span>
						</div>
					</div>
					<!-- Line 2c -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD" style="padding-left:4.2mm;">c</div>
						<div class="styLNDesc" style="width:49mm;">Address of the facility (if applicable): </div>
						<div class="styLNDesc" style="width:129mm;min-height:3.5mm;height:auto;border-bottom:1px dashed black;margin-bottom:1px;">
							<xsl:call-template name="PopulateUSAddressTemplate">
								<xsl:with-param name="TargetNode" select="$FormData/FacilityUSAddress"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 2d -->
					<div class="styStdDiv" style="margin-top:1mm;">
						<div class="styLNLeftNumBoxSD" style="padding-left:4.2mm;">d</div>
						<div class="styLNDesc" style="width:50mm;">Coordinates. &nbsp; <strong>(i)</strong>Latitude: </div>
						<div class="styLNDesc" style="width:50mm;height:auto;">
							<div style="width:100%;border:1px solid black;text-align:center;">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$FormData/FacilityLatitudeNum"/>
								</xsl:call-template>
							</div>
							<span style="font-family:Arial Narrow;">Enter a "+" (plus) or "-" (minus) sign in the first box.</span>
						</div>
						<div class="styLNDesc" style="width:24mm;padding-left:6mm;"><strong>(ii)</strong>Longitude: </div>
						<div class="styLNDesc" style="width:50mm;height:auto;">
							<div style="width:100%;border:1px solid black;text-align:center;">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$FormData/FacilityLongitudeNum"/>
								</xsl:call-template>
							</div>
							<span style="font-family:Arial Narrow;">Enter a "+" (plus) or "-" (minus) sign in the first box.</span>
						</div>
					</div>
					<!-- Line 3 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD">3</div>
						<div class="styLNDesc" style="width:56mm;">Date construction began (MM/DD/YYYY): </div>
						<div class="styLNDesc" style="width:38mm;border-bottom:1px solid black;margin-bottom:1px;text-align:center;">
							<xsl:call-template name="PopulateMonthDayYear">
								<xsl:with-param name="TargetNode" select="$FormData/FacilityConstructionStartDt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 4 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD">4</div>
						<div class="styLNDesc" style="width:56mm;">Date placed in service (MM/DD/YYYY): </div>
						<div class="styLNDesc" style="width:38mm;border-bottom:1px solid black;margin-bottom:1px;text-align:center;">
							<xsl:call-template name="PopulateMonthDayYear">
								<xsl:with-param name="TargetNode" select="$FormData/FacilityPlacedInServiceDt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 5a -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD">5a</div>
						<div class="styLNDesc" style="width:56mm;">Enter the producer registration number: </div>
						<div class="styLNDesc" style="width:80mm;border-bottom:1px solid black;margin-bottom:1px;">
							<xsl:choose>
								<xsl:when test="count($FormData/ProducerRegistrationInfoGrp) &gt; 1">
									See additional data table
								</xsl:when>
								<xsl:otherwise>
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$FormData/ProducerRegistrationInfoGrp/ProducerRegistrationNum"/>
									</xsl:call-template>
								</xsl:otherwise>
							</xsl:choose>
						</div>
					</div>
					<!-- Line 5b -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD" style="padding-left:4.2mm;">b</div>
						<div class="styLNDesc" style="width:86mm;">Date of registration approval for activity letter "CA" and/or "CN":</div>
						<div class="styLNDesc" style="width:38mm;border-bottom:1px solid black;margin-bottom:1px;text-align:center;">
							<xsl:choose>
								<xsl:when test="count($FormData/ProducerRegistrationInfoGrp) &gt; 1">
									See additional data table
								</xsl:when>
								<xsl:otherwise>
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$FormData/ProducerRegistrationInfoGrp/ActyLtrRegistrationApprvlDt"/>
									</xsl:call-template>
								</xsl:otherwise>
							</xsl:choose>
						</div>
					</div>
					<!-- Line 6 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD">6</div>
						<div class="styLNDesc" style="width:170mm;">
							Check this box if you are using provisional emissions rate(s) (PER) to determine your amount of credit
							<span class="sty7218DotLn">.........</span>
						</div>
						<input type="checkbox" class="styCkboxNM" style="float:right;margin:1px 12px 1px 1px" alt="Provisional Emissions Rate">
							<xsl:call-template name="PopulateCheckbox">
								<xsl:with-param name="TargetNode" select="$FormData/ProvisionalEmissionsRateInd"/>
								<xsl:with-param name="BackupName">F7218/ProvisionalEmissionsRateInd</xsl:with-param>
							</xsl:call-template>
						</input>
					</div>
					<!-- Line 7 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD">7</div>
						<div class="styLNDesc" style="width:170mm;">
							Does the facility satisfy IRC 45Z(f)(6) prevailing wage requirements and IRC 45Z(f)(7) apprenticeship requirements?
						</div>
					</div>
					<!-- Line 7a -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD" style="padding-left:4.2mm;">a</div>
						<div class="styGenericDiv" style="width:4mm;">
							<xsl:call-template name="PopulateSpan"><xsl:with-param name="TargetNode" select="$FormData/PWARequirementMetInd"/></xsl:call-template>
							<input type="checkbox" class="styCkboxNM">
								<xsl:call-template name="PopulateYesCheckbox">
									<xsl:with-param name="TargetNode" select="$FormData/PWARequirementMetInd"/>
									<xsl:with-param name="BackupName">F7218/PWARequirementMetInd</xsl:with-param>
								</xsl:call-template>
							</input>
						</div>
						<div class="styLNDesc">Yes.</div>
					</div>
					<!-- Line 7b -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD" style="padding-left:4.2mm;">b</div>
						<div class="styGenericDiv" style="width:4mm;">
							<xsl:call-template name="PopulateSpan"><xsl:with-param name="TargetNode" select="$FormData/PWARequirementMetInd"/></xsl:call-template>
							<input type="checkbox" class="styCkboxNM">
								<xsl:call-template name="PopulateNoCheckbox">
									<xsl:with-param name="TargetNode" select="$FormData/PWARequirementMetInd"/>
									<xsl:with-param name="BackupName">F7218/PWARequirementMetInd</xsl:with-param>
								</xsl:call-template>
							</input>
						</div>
						<div class="styLNDesc">No.</div>
					</div>
					<!-- Part 2 -->
					<div class="styStdDiv" style="border-bottom:1px solid black;border-top:1px solid black;">
						<div class="styPartName">Part II</div>
						<div class="styPartDesc" style="">
							Clean Aviation and Non-Aviation Transportation Fuel Production Credit
						</div>
					</div>
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD">&nbsp;</div>
						<div class="styLNDesc">&nbsp;</div>
						<div class="styLNRightNumBoxNBB">&nbsp;</div>
						<div class="styLNAmountBoxNBB">&nbsp;</div>
					</div>
					<!-- Part 2, Line 1 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBox">1</div>
						<div class="styLNDesc">
							Enter the amount from Part III, line 25(h)
							<span class="sty7218DotLn">.....................</span>
						</div>
						<div class="styLNRightNumBox">1</div>
						<div class="styLNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TotClnAvnNonAvnFuelProdCrAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD">&nbsp;</div>
						<div class="styLNDesc">&nbsp;</div>
						<div class="styLNRightNumBoxNBB">&nbsp;</div>
						<div class="styLNAmountBoxNBB">&nbsp;</div>
					</div>
					<!-- Part 2, Line 2 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBox">2</div>
						<div class="styLNDesc">
							Clean fuel production credit from partnerships, S corporations, cooperatives, estates, and trusts
							<span class="sty7218DotLn">....</span>
						</div>
						<div class="styLNRightNumBox">2</div>
						<div class="styLNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/ClnFuelProdCrAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD">&nbsp;</div>
						<div class="styLNDesc">&nbsp;</div>
						<div class="styLNRightNumBoxNBB">&nbsp;</div>
						<div class="styLNAmountBoxNBB">&nbsp;</div>
					</div>
					<!-- Part 2, Line 3 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBox">3</div>
						<div class="styLNDesc" style="height:auto;">
							Add lines 1 and 2. Cooperatives, estates, and trusts, go to line 4. Partnerships and S corporations <br />
							not electing transfer, stop here and report on Schedule K. All others, stop here and report this <br />
							amount on Form 3800, Part III, line 1q. See instructions
							<span class="sty7218DotLn">................</span>
						</div>
						<div class="styLNRightNumBox" style="height:10.2mm;"><br /><br />3</div>
						<div class="styLNAmountBox" style="height:10.2mm;"><br /><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TotalAllowedTaxCreditAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD">&nbsp;</div>
						<div class="styLNDesc">&nbsp;</div>
						<div class="styLNRightNumBoxNBB">&nbsp;</div>
						<div class="styLNAmountBoxNBB">&nbsp;</div>
					</div>
					<!-- Part 2, Line 4 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBox">4</div>
						<div class="styLNDesc">
							Amount allocated to patrons of the cooperative or beneficiaries of the estate or trust
							<span class="sty7218DotLn">.......</span>
						</div>
						<div class="styLNRightNumBox">4</div>
						<div class="styLNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/AllocatedToBeneficiariesAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD">&nbsp;</div>
						<div class="styLNDesc">&nbsp;</div>
						<div class="styLNRightNumBoxNBB">&nbsp;</div>
						<div class="styLNAmountBoxNBB">&nbsp;</div>
					</div>
					<!-- Part 2, Line 5 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBox">5</div>
						<div class="styLNDesc" style="height:auto;">
							Cooperatives, estates, and trusts, subtract line 4 from line 3. Report this amount on Form 3800, <br /> Part 
							III, line 1q
							<span class="sty7218DotLn">............................</span>
						</div>
						<div class="styLNRightNumBoxNBB" style="height:7.2mm;"><br />5</div>
						<div class="styLNAmountBoxNBB" style="height:7.2mm;"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/EstatesTrustsAndCoopsCreditAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<div class="styStdDiv pageEnd" style="border-top:1px solid black;">
						<span style="font-weight:bold;font-family:Arial;">For Paperwork Reduction Act Notice, see the separate instructions.</span>
						<span style="margin-left:20mm;">Cat. No. 94754J</span>
						<span style="float:right;">Form <strong>7218</strong> (12-2024)</span>
					</div>
					<div class="styStdDivLS">
						Form 7218 (12-2024)
						<span style="float:right;">Page <span style="font-weight:bold;">2</span></span>
					</div>
					<!-- Part 3 -->
					<div class="styStdDivLS" style="border-bottom:1px solid black;border-top:2px solid black;">
						<div class="styPartName">Part III</div>
						<div class="styPartDesc" style="width:200mm;">
							Clean Aviation and Non-Aviation Transportation Fuel Produced and Sold After 2024 
							<span style="font-weight:normal;">(see instructions)</span>
						</div>
					</div>
					<div class="styTableContainerLandscape" id="p3table" style="border-bottom:none;">
						<xsl:call-template name="SetInitialState"/>
						<table class="styTable" style="border-collapse:collapse;font-size:7pt;">
							<thead class="styTableThead">
								<tr>
									<th class="styTableCellHeader" scope="col" style="width:8mm;font-weight:normal;">&nbsp;</th>
									<th class="styTableCellHeader" scope="col" style="width:41mm;font-weight:normal;">
										<strong>(a)</strong><br /> Type of <br /> fuel
									</th>
									<th class="styTableCellHeader" scope="col" style="width:41mm;font-weight:normal;">
										<strong>(b)</strong><br /> Type of <br /> feedstock
									</th>
									<th class="styTableCellHeader" scope="col" style="width:14mm;font-weight:normal;">
										<strong>(c)</strong><br /> Calendar <br /> year sold
									</th>
									<th class="styTableCellHeader" scope="col" style="width:25mm;font-weight:normal;">
										<strong>(d)</strong><br /> Emissions Rate <br /> or PER Value <br /> in kg of CO<sub>2e</sub> <br /> per mmBTU
									</th>
									<th class="styTableCellHeader" scope="col" style="width:25mm;font-weight:normal;">
										<strong>(e)</strong><br /> Subtract (d) from 50 kg <br /> of CO<sub>2e</sub> per mmBTU <br /> and divide <br /> 
										the result by <br />50 kg of CO<sub>2e</sub> <br /> per mmBTU
									</th>
									<th class="styTableCellHeader" scope="col" style="width:42mm;font-weight:normal;">
										<strong>(f)</strong><br /> Gallons or <br /> gallon equivalents
									</th>
									<th class="styTableCellHeader" scope="col" style="width:34mm;font-weight:normal;">
										<strong>(g)</strong><br /> Inflation-adjusted <br /> applicable amount for <br /> fuel sold
									</th>
									<th class="styTableCellHeader" scope="col" style="width:26mm;font-weight:normal;border-right-width:0px;">
										<strong>(h)</strong><br /> Multiply <br /> columns <br /> (e) x (f) x (g)
									</th>
								</tr>
							</thead>
							<tbody>
								<xsl:for-each select="$FormData/ClnAvnNonAvnFuelPrdcdSoldGrp">
									<tr>
										<td class="styTableCellCtrInherit" style="font-weight:bold;">
											<xsl:number value="position()"/>
										</td>
										<td class="styTableCellTextInherit">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="FuelTypeTxt" />
											</xsl:call-template>
										</td>
										<td class="styTableCellTextInherit">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="FeedstockTypeTxt" />
											</xsl:call-template>
										</td>
										<td class="styTableCellCtrInherit">
											<xsl:call-template name="PopulateYear">
												<xsl:with-param name="TargetNode" select="SoldCalendarYr" />
											</xsl:call-template>
										</td>
										<td class="styTableCellAmtInherit">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="FacilityEmissionsValueOrRt" />
											</xsl:call-template>
										</td>
										<td class="styTableCellAmtInherit">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="CalcFacilityEmissionsValueOrRt" />
											</xsl:call-template>
										</td>
										<td class="styTableCellAmtInherit">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="GallonsOrGallonsEquivalentQty" />
											</xsl:call-template>
										</td>
										<td class="styTableCellAmtInherit">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="InflationAdjFuelSoldAmt" />
											</xsl:call-template>
										</td>
										<td class="styTableCellAmtInherit" style="border-right-width:0px;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="ClnAvnNonAvnFuelProdCrAmt" />
											</xsl:call-template>
										</td>
									</tr>
								</xsl:for-each>
								<xsl:if test="count($FormData/ClnAvnNonAvnFuelPrdcdSoldGrp) &lt; 24">
									<xsl:call-template name="FillPage3Table">
										<xsl:with-param name="LineNumber" select="count($FormData/ClnAvnNonAvnFuelPrdcdSoldGrp) + 1"/>
									</xsl:call-template>
								</xsl:if>
							</tbody>
						</table>
					</div>
					<div class="styStdDivLS">
						<div class="styLNLeftNumBoxSD">&nbsp;</div>
						<div class="styLNDesc" style="width:207mm;">&nbsp;</div>
						<div class="styLNRightNumBoxNBB">&nbsp;</div>
						<div class="styLNAmountBoxNBB">&nbsp;</div>
					</div>
					<div class="styStdDivLS">
						<div class="styLNLeftNumBoxSD">25</div>
						<div class="styLNDesc" style="width:207mm;">
							Total of column (h)
							<span class="sty7218DotLn">.............................................</span>
						</div>
						<div class="styLNRightNumBoxNBB">25</div>
						<div class="styLNAmountBoxNBB">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TotClnAvnNonAvnFuelProdCrAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<div class="styStdDivLS pageEnd" style="border-top:1px solid black;">
						<span style="float:right;">Form <strong>7218</strong> (12-2024)</span>
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
					<xsl:if test="(count($FormData/ProducerRegistrationInfoGrp) &gt; 1)">
						<br />
						<br />
						<span class="styRepeatingDataTitle">Part I, Line 5 - Producer Registration Info</span>
						<table class="styDepTbl" style="font-size:7pt">
							<thead class="styTableHead">
								<tr class="styDepTblHdr">
									<th class="styDepTblCell" style="text-align:left">
										5a. Producer registration number
									</th>
									<th class="styDepTblCell" style="text-align:left">
										5b. Date of registration approval for activity letter "CA" and/or "CN"
									</th>
								</tr>
							</thead>
							<tbody>
								<xsl:for-each select="$FormData/ProducerRegistrationInfoGrp">
									<tr>
										<xsl:attribute name="class">
											<xsl:choose>
												<xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when>
												<xsl:otherwise>styDepTblRow2</xsl:otherwise>
											</xsl:choose>
										</xsl:attribute>
										<td class="styDepTblCell" style="text-align:center;">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="ProducerRegistrationNum"/>
											</xsl:call-template>
										</td>
										<td class="styDepTblCell" style="text-align:center;">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="ActyLtrRegistrationApprvlDt"/>
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
	<xsl:template name="FillPage3Table">
		<xsl:param name="LineNumber"/>
		<xsl:param name="MaxLine" select="24"/>
		<tr style="font-size:7pt;vertical-align:bottom;">
		    <td class="styTableCellCtrInherit" style="font-weight:bold;">
				<xsl:number value="$LineNumber"/>
			</td>
			<td class="styTableCellTextInherit">&nbsp;</td>
			<td class="styTableCellCtrInherit">&nbsp;</td>
			<td class="styTableCellAmtInherit">&nbsp;</td>
			<td class="styTableCellAmtInherit">&nbsp;</td>
			<td class="styTableCellCtrInherit">&nbsp;</td>
			<td class="styTableCellAmtInherit">&nbsp;</td>
			<td class="styTableCellAmtInherit">&nbsp;</td>
			<td class="styTableCellAmtInherit" style="border-right-width:0px;">&nbsp;</td>
		</tr>
		<xsl:if test="$LineNumber &lt; $MaxLine">
			<xsl:call-template name="FillPage3Table">
				<xsl:with-param name="LineNumber" select="$LineNumber + 1"/>
				<xsl:with-param name="MaxLine" select="$MaxLine"/>
			</xsl:call-template>
		</xsl:if>
	</xsl:template>
</xsl:stylesheet>
