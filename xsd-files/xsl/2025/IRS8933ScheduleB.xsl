<?xml version="1.0" encoding="UTF-8"?>
<!-- This style was created by Sheeba Namburi(IBM)   on 08/26/2025 -->
<!DOCTYPE xsl:stylesheet [
	<!ENTITY nbsp "&#160;"> 
]>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:include href="PopulateTemplate.xsl"/>
	<xsl:include href="AddHeader.xsl"/>
	<xsl:include href="CommonPathRef.xsl"/>
	<xsl:include href="AddOnTable.xsl"/>
	<xsl:include href="IRS8933ScheduleBStyle.xsl"/>
	<xsl:output method="html" indent="yes"/>
	<xsl:strip-space elements="*"/>
	<xsl:param name="FormData" select="$RtnDoc/IRS8933ScheduleB"/>
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
				<meta name="Description" content="IRS Form 8933 Schedule B"/>
				<script language="JavaScript" src="{$ScriptPath}/FormDisplay.js" type="text/javascript"/>
				<xsl:call-template name="InitJS"/>
				<style type="text/css">
					<!--<xsl:if test="not($Print) or $Print=''">-->
					<xsl:call-template name="AddOnStyle"/>
					<xsl:call-template name="IRS8933ScheduleBStyle"/>
					<!--</xsl:if>-->
				</style>
				<xsl:call-template name="GlobalStylesForm"/>
			</head>
			<body class="styBodyClass">
				<form id="Form8933ScheduleB">
					<xsl:call-template name="DocumentHeaderLandscape"/>
					<!-- Page 1 -->
					<!-- Header -->
					<div class="styStdDivLS" style="height:19mm;">
						<div class="styFNBox" style="width:50mm;height:19mm;padding-top:1mm;">
							<strong>SCHEDULE B <br/> (Form 8933) </strong>
							<br/>
							<span class="styAgency" style="padding-top:1.5mm;">
								(Rev. December 2025)
							</span>
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$FormData"/>
							</xsl:call-template>
							<br/>
							<span class="styAgency" style="padding-top:1.5mm;">
								Department of the Treasury <br/>
								Internal Revenue Service
							</span>
						</div>
						<div class="styFTBox" style="width:160mm;">
							<span class="styFMT" style="font-size:10pt;padding-top:1mm;padding-bottom:1mm;">
								Disposal Operator Certification
							</span>
							<br/><br />
							<span style="font-weight:bold;">
								Attach to Form 8933.
							</span>
							<br/>
							<span style="font-weight:bold;padding-top:1mm;">
								Go to
								<span style="font-style:italic">www.irs.gov/Form8933</span>
								for instructions and the latest information.
							</span>
						</div>
						<div class="styTYBox" style="width:46mm;height:19mm;">
							<div class="styOMB" style="padding-top:2.5mm;height:9mm;margin-top:4mm;border-bottom:none;">OMB No. 1545-0123</div>
						</div>
					</div>
					<!-- Filer information section -->
					<div class="styStdDivLS" style="border-top:1px solid black;">
						<div class="styNameBox" style="width:176mm;font-size:7pt;">
							Name(s) shown on return<br/>
							<xsl:call-template name="PopulateReturnHeaderFiler">
								<xsl:with-param name="TargetNode">BusinessNameLine1Txt</xsl:with-param>
							</xsl:call-template>
							<br/>
							<xsl:call-template name="PopulateReturnHeaderFiler">
								<xsl:with-param name="TargetNode">BusinessNameLine2Txt</xsl:with-param>
							</xsl:call-template>
						</div>
						<div class="styEINBox" style="width:80mm;padding-left:0.5mm;font-weight:normal;border-left-width:0px;font-size:7pt;">
							<strong>Identifying number</strong>
							<br/>
							<span style="font-weight:normal;padding-top:3mm;">
								<xsl:call-template name="PopulateReturnHeaderFilerTIN"/>
							</span>
						</div>
					</div>					
				

					<!--Part I  line 5 table -->
					<!-- Part 1 -->
					<div class="styStdDivLS" style="border-top:1px solid black;border-bottom:1px solid black;">
						<div class="styPartName">Part I</div>
						<div class="styPartDesc">Information About the Owner(s) of the Geological Disposal Site</div>
					</div>
					<!-- Line 1 -->
					<div class="styStdDivLS" style="">
						<div class="styLNLeftNumBoxSD">1</div>
						<div class="styLNDesc" style="width:246mm;">
							Provide information about each owner of the disposal site during the tax year. See instructions.
						</div>
					</div>
					<xsl:variable name="shouldSeparateL1" select="($Print = $Separated) and (count($FormData/GeologicalDisposalSiteOwnerGrp) &gt; 4)"/>
					<div class="styTableContainerLandscapeNBB" style="" id="Line1Table">
						<xsl:call-template name="SetInitialState"/>
						<table class="styTable" style="font-size:7pt;border-collapse:collapse;">
							<thead class="styTableThead">
								<tr style="border-top:1px solid black;">
									<th class="styTableCellHeader" scope="col" style="width:85mm;font-weight:normal;">
										<strong>(i)</strong>
										Disposal site owner
									</th>
									<th class="styTableCellHeader" scope="col" style="width:85mm;font-weight:normal;">
										<strong>(ii)</strong>
										Address
									</th>
									<th class="styTableCellHeader" scope="col" style="width:25mm;font-weight:normal;">
										<strong>(iii)</strong>
										Employer <br/>identification <br/>number(EIN)
									</th>
									<th class="styTableCellHeader" scope="col" style="width:60mm;font-weight:normal;border-right-width:0px;">
										<strong>(iv)</strong>
										Operating <br/>interest (%)
									</th>
								</tr>
							</thead>
							<tbody>
								<xsl:for-each select="$FormData/GeologicalDisposalSiteOwnerGrp">
									<tr>
										<td class="styTableCellTextInherit">
											<span style="font-weight:bold;width:5mm;">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="AlphaRowId"/>
												</xsl:call-template>
											</span>
											<xsl:call-template name="FillNameChoice">
												<xsl:with-param name="TargetBusinessName" select="FacilityOwnerBusinessName"/>
												<xsl:with-param name="TargetPersonName" select="FacilityOwnerPersonNm"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellTextInherit">
											<xsl:choose>
												<xsl:when test="FacilityOwnerForeignAddress">
													<xsl:call-template name="PopulateForeignAddressTemplate">
														<xsl:with-param name="TargetNode" select="FacilityOwnerForeignAddress"/>
													</xsl:call-template>
												</xsl:when>
												<xsl:otherwise>
													<xsl:call-template name="PopulateUSAddressTemplate">
														<xsl:with-param name="TargetNode" select="FacilityOwnerUSAddress"/>
													</xsl:call-template>
												</xsl:otherwise>
											</xsl:choose>
										</td>
										<td class="styTableCellCtrInherit">
											<xsl:choose>
												<xsl:when test="FacilityOwnerSSN">
													<xsl:call-template name="PopulateSSN">
														<xsl:with-param name="TargetNode" select="FacilityOwnerSSN"/>
													</xsl:call-template>
												</xsl:when>
												<xsl:otherwise>
													<xsl:call-template name="PopulateEIN">
														<xsl:with-param name="TargetNode" select="FacilityOwnerEIN"/>
													</xsl:call-template>
												</xsl:otherwise>
											</xsl:choose>
										</td>
										<td class="styTableCellCtrInherit" style="border-right-width:0px;">
											<xsl:call-template name="PopulatePercent">
												<xsl:with-param name="TargetNode" select="OperatingInterestPct"/>
											</xsl:call-template>
										</td>
									</tr>
								</xsl:for-each>
								<xsl:if test="$shouldSeparateL1 or count($FormData/GeologicalDisposalSiteOwnerGrp) &lt; 4">
									<xsl:call-template name="FillTable4Cols">
										<xsl:with-param name="SepMessage" select="$shouldSeparateL1"/>
										<xsl:with-param name="LineNumber" select="count($FormData/GeologicalDisposalSiteOwnerGrp) + 1"/>
									</xsl:call-template>
								</xsl:if>
							</tbody>
						</table>
					</div>
					
						<!-- Part II -->
					<div class="styStdDivLS" style="border-top:1px solid black;border-bottom:1px solid black;">
						<div class="styPartName">Part II</div>
						<div class="styPartDesc">Information About the Geological Disposal Site</div>
					</div>

					<!-- Line 2 -->
					<div class="styStdDivLS" style="">
						<div class="styLNLeftNumBoxSD" style="height:9mm;">2</div>
						<div class="styLNDesc" style="width:120mm;height:auto;min-height:10mm;border-right:1px solid black;">
							Name and location (county and state, or offshore tract)<br />
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/ProjectNm"/>
							</xsl:call-template><br />
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/FacilityNameAndLocationTxt"/>
							</xsl:call-template>
						</div>
						<div class="styLNLeftNumBoxSD" style="height:9mm;">3</div>
						<div class="styLNDesc" style="width:119mm;height:auto;">
							Name and EIN of the operator of the site<br />
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/OperatorBusinessName/BusinessNameLine1Txt"/>
							</xsl:call-template>
							<xsl:if test="$FormData/OperatorBusinessName/BusinessNameLine2Txt">
								<br />
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$FormData/OperatorBusinessName/BusinessNameLine2Txt"/>
								</xsl:call-template>
							</xsl:if>
							<span style="float:right;">
								<xsl:call-template name="PopulateEIN">
									<xsl:with-param name="TargetNode" select="$FormData/OperatorEIN"/>
								</xsl:call-template>
							</span>
						</div>
					</div>
					<!-- Line 4 -->
					<div class="styStdDivLS" style="border-top:1px solid black;">
						<div class="styLNLeftNumBoxSD" style="height:7mm;">4</div>
						<div class="styLNDesc" style="width:247mm;height:auto;min-height:7mm;">
							Other company(ies) identified as the operator of the project for any other purpose(s) and the nature of the purpose<br />
							<xsl:choose>
								<xsl:when test="count($FormData/ OthCoProjOperatorPurposeGrp) &gt; 1">
									<xsl:call-template name="LinkToLeftoverDataTableInline">
										<xsl:with-param name="TargetNode" select="$FormData/ OthCoProjOperatorPurposeGrp"/>
										<xsl:with-param name="Desc">Part II, Line 4 - Other companies identified as operator of project for other purposes</xsl:with-param>
									</xsl:call-template>
								</xsl:when>
								<xsl:otherwise>
									<xsl:call-template name="FillNameChoice">
										<xsl:with-param name="TargetBusinessName" select="$FormData/  OthCoProjOperatorPurposeGrp/OtherPurposeDesc"/>
										<xsl:with-param name="TargetPersonName" select="/.."/>
									</xsl:call-template>
									
								</xsl:otherwise>
							</xsl:choose>
						</div>
					</div>
					<!-- Line 5, Line 6 -->
					<div class="styStdDivLS" style="border-top:1px solid black;">
						<div class="styLNLeftNumBoxSD" style="height:9mm;">5a</div>
			<div class="styLNDesc" style="width:78mm;height:auto;min-height:10mm;border-right:1px solid black;">
							IRS-issued registration number(s) for the geological<br/>
disposal facility<br/>
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/FacilityIRSIssdRegistrationNum"/>
							</xsl:call-template>
						</div>
						<div class="styLNLeftNumBoxSD" style="height:9mm;">5b</div>
		<div class="styLNDesc" style="width:78mm;height:auto;min-height:10mm;border-right:1px solid black;">
							Geological disposal site's EPA e-GGRT ID number(s),<br />if available<br/>
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/FacilityEPAeGGRTIdNum"/>
							</xsl:call-template>
						</div>
						<div class="styLNLeftNumBoxSD" style="height:9mm;">6</div>
						<div class="styLNDesc" style="width:75mm;height:auto;">
							Date (MM/YYYY) on which the injection<br />of captured qualified carbon oxide began<br/>
							<xsl:call-template name="PopulateMonthDayYear">
								<xsl:with-param name="TargetNode" select="$FormData/CarbonOxideInjectionBeginDt"/>
							</xsl:call-template>
						</div>
					</div>
					
						<!-- Line 7 -->
					<div class="styStdDivLS" style="border-top:1px solid black;padding-left:1.5mm;height:8mm;">
						<div class="styLNLeftNumBox">7</div>
						<div class="styLNDesc" style="width:240mm;">
							Check here to declare that all figures of stored carbon oxide on this schedule are for carbon oxide consistent with figures reported to the EPA pursuant to the<br/>
							applicable MRV plan and subpart RR of the EPA's Greenhouse Gas Reporting Program 							<span class="sty8933SchBDotLn">.................................</span>
						</div>
						<div class="styGenericDiv" style="padding-top:3mm;">
							<input type="checkbox" class="styCkboxNM" style="" aria-label="Attestation">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$FormData/AttestationInd"/>
									<xsl:with-param name="BackupName">IRS8933SchB/AttestationInd</xsl:with-param>
								</xsl:call-template>
							</input>
						</div>
					</div>
				<!-- Line 8 -->
				
						<div class="styLNDesc" style="height:6mm;padding-top:1mm;width:170mm">
						<div class="styLNLeftNumBoxSD" style="padding-top:auto;">8</div>					
						Attach a copy of the approved MRV plan or provide the URL where it can be viewed on the EPA website.		<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/ BinaryAttachment"/>
							</xsl:call-template>
						</div>									
					
					<!-- Part III -->					
		
					<div class="styStdDivLS" style="border-top:1px solid black;border-bottom:1px solid black;">
						<div class="styPartName">Part III</div>
						<div class="styPartDesc" style="width:240mm;">Information About the Qualified Carbon Oxide Supplied to the Geological Disposal Site and Securely Stored</div>
					</div>
					
					<!-- Line 9 -->
					<div style=" width: 187mm; ">
						<div class="styLNLeftNumBox" style="padding-left:2mm;padding-top:1mm">9</div>
						<div style="padding-left:2mm;padding-top:1mm;">Provide information about all suppliers of qualified carbon oxide during the tax year. See instructions. </div>
					</div>					
				
					<!--Part III   line 9 and table -->
					
					<xsl:variable name="shouldSeparateL9" select="($Print = $Separated) and (count($FormData/QlfyCrbnOxdSupdGlgclDispGrp) &gt; 6)"/>
					<div class="styTableContainerLandscapeNBB" style="" id="Line1Table">
						<xsl:call-template name="SetInitialState"/>
						<table class="styTable" style="font-size:7pt;border-collapse:collapse;">
							<thead class="styTableThead">
								<tr style="border-top:1px solid black;">
									<th class="styTableCellHeader" scope="col" style="width:85mm;font-weight:normal;">
									<strong>(i)</strong>
										Qualified carbon<br/>oxide supplier
									</th>
									<th class="styTableCellHeader" scope="col" style="width:25mm;font-weight:normal;padding-bottom:2mm;">
										<strong>(ii)</strong>
										EIN
									</th>
									<th class="styTableCellHeader" scope="col" style="width:95mm;font-weight:normal;">
										<strong>(iii)</strong>
										Name and location of capture facility<br/>(county and state)
									</th>
									<th class="styTableCellHeader" scope="col" style="width:60mm;font-weight:normal;">
										<strong>(iv)</strong>
										IRS-issued <br/>registration number
									</th>
	                                <th class="styTableCellHeader" scope="col" style="width:60mm;font-weight:normal;">
										<strong>(v)</strong>
										EPA's e-GGRT ID<br/>(if any)
									</th>
	                                <th class="styTableCellHeader" scope="col" style="width:30mm;font-weight:normal;border-right-width:0px;">
										<strong>(vi)</strong>
										Check if<br/>supplier<br/>supplied any<br/>nonqualified<br/>carbon oxide<br/>from any<br/>source
									</th>


								</tr>
							</thead>
							<tbody>
								<xsl:for-each select="$FormData/QlfyCrbnOxdSupdGlgclDispGrp">
									<tr>
										<td class="styTableCellTextInherit">
											<span style="font-weight:bold;width:5mm;"><xsl:number format="A" value="position()"/></span>
											<xsl:call-template name="FillNameChoice">
												<xsl:with-param name="TargetBusinessName" select="BusinessName"/>
												<xsl:with-param name="TargetPersonName" select="PersonNm"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellCtrInherit">
											<xsl:choose>
												<xsl:when test="SSN">
													<xsl:call-template name="PopulateSSN">
														<xsl:with-param name="TargetNode" select="SSN"/>
													</xsl:call-template>
												</xsl:when>
												<xsl:otherwise>
													<xsl:call-template name="PopulateEIN">
														<xsl:with-param name="TargetNode" select="EIN"/>
													</xsl:call-template>
												</xsl:otherwise>
											</xsl:choose>
										</td>
										<td class="styTableCellTextInherit">
											<xsl:call-template name="FillNameChoice">
												<xsl:with-param name="TargetBusinessName" select="FacilityName"/>
												<xsl:with-param name="TargetPersonName" select="FacilityNameAndLocationTxt"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellTextInherit">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="FacilityIRSIssdRegistrationNum"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellCtrInherit">
										<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="FacilityEPAeGGRTIdNum"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellCtrInherit" style="border-right-width:0px;">
											<input type="checkbox" class="styCkbox" style="">
												<xsl:attribute name="aria-label">
													Row <xsl:number format="A" value="position()"/>, Supplied Any Nonqualified Carbon Oxide
												</xsl:attribute>
												<xsl:call-template name="PopulateCheckbox">
													<xsl:with-param name="TargetNode" select="NonqualifiedCrbnOxdInd"/>
													<xsl:with-param name="BackupName">IRS8933SchB/NonqualifiedCrbnOxdInd<xsl:value-of select="position()"/></xsl:with-param>
												</xsl:call-template>
											</input>
										</td>
									</tr>
								</xsl:for-each>
								<xsl:if test="$shouldSeparateL9 or count($FormData/QlfyCrbnOxdSupdGlgclDispGrp) &lt; 1">
									<tr>
										<td class="styTableCellTextInherit">
											<span style="font-weight:bold;width:5mm;">A</span>
											<xsl:if test="$shouldSeparateL9">
												See additional data table
											</xsl:if>
										</td>
										<td class="styTableCellCtrInherit">&nbsp;</td>
										<td class="styTableCellTextInherit">&nbsp;</td>
										<td class="styTableCellTextInherit">&nbsp;</td>
										<td class="styTableCellCtrInherit">&nbsp;</td>
											
										<td class="styTableCellCtrInherit" style="border-right-width:0px;">
											<input type="checkbox" class="styCkbox" style="">
												<xsl:attribute name="aria-label">Row A, Supplied Any Nonqualified Carbon Oxide</xsl:attribute>
												<xsl:call-template name="PopulateCheckbox">
													<xsl:with-param name="TargetNode" select="/.."/>
													<xsl:with-param name="BackupName">IRS8933SchB/NonqualifiedCrbnOxdInd1</xsl:with-param>
												</xsl:call-template>
											</input>
										</td>
									</tr>
								</xsl:if> 
								<xsl:if test="$shouldSeparateL9 or count($FormData/QlfyCrbnOxdSupdGlgclDispGrp) &lt; 2">
									<tr>
										<td class="styTableCellTextInherit">
											<span style="font-weight:bold;width:5mm;">B</span>
										</td>
										<td class="styTableCellCtrInherit">&nbsp;</td>
										<td class="styTableCellTextInherit">&nbsp;</td>
										<td class="styTableCellTextInherit">&nbsp;</td>
										<td class="styTableCellCtrInherit">&nbsp;</td>											
										 
										<td class="styTableCellCtrInherit" style="border-right-width:0px;">
											<input type="checkbox" class="styCkbox" style="">
												<xsl:attribute name="aria-label">Row B, Supplied Any Nonqualified Carbon Oxide</xsl:attribute>
												<xsl:call-template name="PopulateCheckbox">
													<xsl:with-param name="TargetNode" select="/.."/>
													<xsl:with-param name="BackupName">IRS8933SchB/NonqualifiedCrbnOxdInd2</xsl:with-param>
												</xsl:call-template>
											</input>
										</td>
									</tr>
								</xsl:if> 
								<xsl:if test="$shouldSeparateL9 or count($FormData/QlfyCrbnOxdSupdGlgclDispGrp) &lt; 3">
									<tr>
										<td class="styTableCellTextInherit">
											<span style="font-weight:bold;width:5mm;">C</span>
										</td>
										<td class="styTableCellCtrInherit">&nbsp;</td>
										<td class="styTableCellTextInherit">&nbsp;</td>
										<td class="styTableCellTextInherit">&nbsp;</td>
										<td class="styTableCellCtrInherit">&nbsp;</td>
											
										<td class="styTableCellCtrInherit" style="border-right-width:0px;">
											<input type="checkbox" class="styCkbox" style="">
												<xsl:attribute name="aria-label">Row C, Supplied Any Nonqualified Carbon Oxide</xsl:attribute>
												<xsl:call-template name="PopulateCheckbox">
													<xsl:with-param name="TargetNode" select="/.."/>
													<xsl:with-param name="BackupName">IRS8933SchB/NonqualifiedCrbnOxdInd3</xsl:with-param>
												</xsl:call-template>
											</input>
										</td>
									</tr>
								</xsl:if> 
							</tbody>
							
						</table>
					</div>	
					
				<!-- Form  Header-->
				<div class="styStdDivLS pageEnd" style="border-top:1px solid black;">
						<span style="font-weight:bold;font-family:Arial;">For Paperwork Reduction Act Notice, see the Instructions for Form 8933.</span>
						<span style="margin-left:35mm;">Cat. No. 94873R</span>
						<span style="float:right;">
							<strong>Schedule B (Form 8933)</strong> (Rev. 12-2025)
						</span>
					</div>
					<br/>
					<br class="pageEnd"/>		
					
						<!-- Form footer-->
					<div class="styStdDivLS pageEnd" style="border-top:1px solid black;">
						
					</div>
					<div class="styStdDivLS">
						Schedule B (Form 8933) (Rev. 12-2025)
						<div style="float:right;">
							Page <span style="font-weight:bold;font-size:8pt;">2</span>
						</div>
					</div>	
					
					
				<div class="styStdDivLS" style="border-top:1px solid black;border-bottom:1px solid black;">
						<div class="styPartName">Part III</div>
						<div class="styPartDesc" style="width:240mm;">Information About the Qualified Carbon Oxide Supplied to the Geological Disposal Site and Securely Stored <i>(continued)</i></div>
					</div>		
					
					
					<!-- Line 10 -->
			<div style=" width: 245mm; ">
			<div class="styLNLeftNumBox" style="padding-left: 1mm;padding-top:1mm;">10</div>
			<div  style="paadding-left:2mm;padding-top:1mm;">Provide disposal information consistent with all applicable EPA filings. See instructions.</div>
			</div>	

					<!-- Part 1 -->
					<!-- Table 1, cols (a)-(i) -->
					<xsl:variable name="shouldSeparateL20" select="($Print = $Separated) and (count($FormData/GeologicalDisposalSiteOwnrGrp) &gt; 4)"/>
					<div class="styTableContainerLandscapeNBB" style="" id="Line20Table1">
						<xsl:call-template name="SetInitialState"/>
						<table class="styTable" style="font-size:7pt;border-collapse:collapse;">
							<thead class="styTableThead">
								<tr style="border-top:1px solid black;">
									<th class="styTableCellHeader" scope="col" rowspan="3" style="width:46mm;font-weight:normal;">
										<strong>(a)</strong>
										Geological disposal<br/>site owner
									</th>
									<th class="styTableCellHeader" scope="colgroup" colspan="6" style="width:auto;border-right-width:0px;">
										Qualified Carbon Oxide Supplier
									</th>
								</tr>
								<tr>
									<th class="styTableCellHeader" scope="colgroup" colspan="2" style="width:70mm;padding-top:1.5mm;padding-bottom:1.5mm;font-weight:normal;">
										<strong>(i)</strong> 
										<span style="width:60mm;border-bottom:1px solid black;margin-left:0.5mm;">
											<xsl:call-template name="FillNameChoice">
												<xsl:with-param name="TargetBusinessName" select="$FormData/TotalSupplierSectionGrp[1]/SupplierName"/>
												<xsl:with-param name="TargetPersonName" select="$FormData/TotalSupplierSectionGrp[1]/SupplierPersonNm"/>
											</xsl:call-template>
										</span>
									</th>
									<th class="styTableCellHeader" scope="colgroup" colspan="2" style="width:70mm;font-weight:normal;">
										<strong>(ii)</strong> 
										<span style="width:60mm;border-bottom:1px solid black;margin-left:0.5mm;">
											<xsl:call-template name="FillNameChoice">
												<xsl:with-param name="TargetBusinessName" select="$FormData/TotalSupplierSectionGrp[2]/SupplierName"/>
												<xsl:with-param name="TargetPersonName" select="$FormData/TotalSupplierSectionGrp[2]/SupplierPersonNm"/>
											</xsl:call-template>
										</span>
									</th>
									<th class="styTableCellHeader" scope="colgroup" colspan="2" style="width:70mm;border-right-width:0px;font-weight:normal;">
										<strong>(iii)</strong> 
										<span style="width:60mm;border-bottom:1px solid black;margin-left:0.5mm;">
											<xsl:call-template name="FillNameChoice">
												<xsl:with-param name="TargetBusinessName" select="$FormData/TotalSupplierSectionGrp[3]/SupplierName"/>
												<xsl:with-param name="TargetPersonName" select="$FormData/TotalSupplierSectionGrp[3]/SupplierPersonNm"/>
											</xsl:call-template>
										</span>
									</th>
								</tr>
								<tr>
									<th class="styTableCellHeader" scope="col" style="width:35mm;font-weight:normal;padding:0.5mm;">
										<strong>(b)</strong>
										Metric tons <br /> delivered
									</th>
									<th class="styTableCellHeader" scope="col" style="width:35mm;font-weight:normal;padding:0.5mm;">
										<strong>(c)</strong>
										Metric tons <br /> stored
									</th>
									<th class="styTableCellHeader" scope="col" style="width:35mm;font-weight:normal;padding:0.5mm;">
										<strong>(d)</strong>
										Metric tons <br /> delivered
									</th>
									<th class="styTableCellHeader" scope="col" style="width:35mm;font-weight:normal;padding:0.5mm;">
										<strong>(e)</strong>
										Metric tons <br /> stored
									</th>
									<th class="styTableCellHeader" scope="col" style="width:35mm;font-weight:normal;padding:0.5mm;">
										<strong>(f)</strong>
										Metric tons <br /> delivered
									</th>
									<th class="styTableCellHeader" scope="col" style="width:35mm;font-weight:normal;padding:0.5mm;border-right-width:0px;">
										<strong>(g)</strong>
										Metric tons <br /> stored
									</th>
								</tr>
							</thead>
							<tbody>
								<xsl:if test="not($shouldSeparateL20)">
									<xsl:for-each select="$FormData/GeologicalDisposalSiteOwnrGrp">
										<xsl:variable name="rowNum"><xsl:number format="A" value="position()"/></xsl:variable>
										<tr style="vertical-align:bottom;">
											<td class="styTableCellTextInherit">
												<span style="font-weight:bold;width:4mm;"><xsl:value-of select="$rowNum"/></span>
												<xsl:call-template name="FillNameChoice">
													<xsl:with-param name="TargetBusinessName" select="FacilityOwnerBusinessName"/>
													<xsl:with-param name="TargetPersonName" select="FacilityOwnerPersonNm"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellAmtInherit" style="">
												<span style="float:left;">
													<xsl:call-template name="LinkToLeftoverDataTableInline">
														<xsl:with-param name="Desc">Line 20, row <xsl:value-of select="$rowNum"/> - Supplier 1 Person Name</xsl:with-param>
														<xsl:with-param name="TargetNode" select="SupplierSectionGrp[1]/SupplierPersonNm"/>
													</xsl:call-template>
													<xsl:call-template name="LinkToLeftoverDataTableInline">
														<xsl:with-param name="Desc">Line 20, row <xsl:value-of select="$rowNum"/> - Supplier 1 Business Name</xsl:with-param>
														<xsl:with-param name="TargetNode" select="SupplierSectionGrp[1]/SupplierName/BusinessNameLine1Txt"/>
													</xsl:call-template>
												</span>
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="SupplierSectionGrp[1]/SupplierMetricTonsGrp/DeliveredQty"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellAmtInherit">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="SupplierSectionGrp[1]/SupplierMetricTonsGrp/StoredQty"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellAmtInherit" style="">
												<span style="float:left;">
													<xsl:call-template name="LinkToLeftoverDataTableInline">
														<xsl:with-param name="Desc">Line 20, row <xsl:value-of select="$rowNum"/> - Supplier 2 Person Name</xsl:with-param>
														<xsl:with-param name="TargetNode" select="SupplierSectionGrp[2]/SupplierPersonNm"/>
													</xsl:call-template>
													<xsl:call-template name="LinkToLeftoverDataTableInline">
														<xsl:with-param name="Desc">Line 20, row <xsl:value-of select="$rowNum"/> - Supplier 2 Business Name</xsl:with-param>
														<xsl:with-param name="TargetNode" select="SupplierSectionGrp[2]/SupplierName/BusinessNameLine1Txt"/>
													</xsl:call-template>
												</span>
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="SupplierSectionGrp[2]/SupplierMetricTonsGrp/DeliveredQty"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellAmtInherit">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="SupplierSectionGrp[2]/SupplierMetricTonsGrp/StoredQty"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellAmtInherit" style="">
												<span style="float:left;">
													<xsl:call-template name="LinkToLeftoverDataTableInline">
														<xsl:with-param name="Desc">Line 20, row <xsl:value-of select="$rowNum"/> - Supplier 3 Person Name</xsl:with-param>
														<xsl:with-param name="TargetNode" select="SupplierSectionGrp[3]/SupplierPersonNm"/>
													</xsl:call-template>
													<xsl:call-template name="LinkToLeftoverDataTableInline">
														<xsl:with-param name="Desc">Line 20, row <xsl:value-of select="$rowNum"/> - Supplier 3 Business Name</xsl:with-param>
														<xsl:with-param name="TargetNode" select="SupplierSectionGrp[3]/SupplierName/BusinessNameLine1Txt"/>
													</xsl:call-template>
												</span>
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="SupplierSectionGrp[3]/SupplierMetricTonsGrp/DeliveredQty"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellAmtInherit" style="border-right-width:0px;">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="SupplierSectionGrp[3]/SupplierMetricTonsGrp/StoredQty"/>
												</xsl:call-template>
											</td>
										</tr>
									</xsl:for-each>
								</xsl:if>
								<xsl:if test="$shouldSeparateL20 or count($FormData/OthNonQlfyCrbnOxdGrp) &lt; 4">
									<xsl:call-template name="FillTable7Cols">
										<xsl:with-param name="LineNumber" select="1 + count($FormData/OthNonQlfyCrbnOxdGrp)"/>
										<xsl:with-param name="MaxLine" select="4"/>
										<xsl:with-param name="SepMessage" select="$shouldSeparateL20"/>
									</xsl:call-template>
								</xsl:if>
								<tr style="vertical-align:bottom;">
									<td class="styTableCellTextInherit">
										Total 
										<span class="sty8933BDotLn">..........................................</span>
									</td>
									<td class="styTableCellAmtInherit" style="">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$FormData/TotalSupplierSectionGrp[1]/TotSupplierMetricTonsGrp/DeliveredQty"/>
										</xsl:call-template>
									</td>
									<td class="styTableCellAmtInherit">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$FormData/TotalSupplierSectionGrp[1]/TotSupplierMetricTonsGrp/StoredQty"/>
										</xsl:call-template>
									</td>
									<td class="styTableCellAmtInherit" style="">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$FormData/TotalSupplierSectionGrp[2]/TotSupplierMetricTonsGrp/DeliveredQty"/>
										</xsl:call-template>
									</td>
									<td class="styTableCellAmtInherit">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$FormData/TotalSupplierSectionGrp[2]/TotSupplierMetricTonsGrp/StoredQty"/>
										</xsl:call-template>
									</td>
									<td class="styTableCellAmtInherit" style="">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$FormData/TotalSupplierSectionGrp[3]/TotSupplierMetricTonsGrp/DeliveredQty"/>
										</xsl:call-template>
									</td>
									<td class="styTableCellAmtInherit" style="border-right-width:0px;">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$FormData/TotalSupplierSectionGrp[3]/TotSupplierMetricTonsGrp/StoredQty"/>
										</xsl:call-template>
									</td>
								</tr>
							</tbody>
						</table>
					</div>
					
					
					
					<!-- Table 1 Total -->
					<div class="styTableContainerLandscapeNBB" style="" id="Line20Table2">
						<xsl:call-template name="SetInitialState"/>
						<table class="styTable" style="font-size:7pt;border-collapse:collapse;">
							<thead class="styTableThead">
								<tr>
									<th class="styTableCellHeader" scope="col" rowspan="2" style="width:11mm;font-weight:normal;background-color:lightgrey;">
										&nbsp;
									</th>
									<th class="styTableCellHeader" scope="colgroup" colspan="2" style="width:81mm;padding-top:1.5mm;padding-bottom:1.5mm;font-weight:normal;">
										<strong>(iv)</strong> 
										Total qualified carbon oxide <br /> from all suppliers
									</th>
									<th class="styTableCellHeader" scope="colgroup" colspan="2" style="width:80mm;font-weight:normal;">
										<strong>(v)</strong> 
										All other suppliers of <br /> nonqualified carbon oxide
									</th>
									<th class="styTableCellHeader" scope="colgroup" colspan="2" style="width:80mm;font-weight:normal;border-right-width:0px;">
										<strong>(vi)</strong> 
										Total metric tons <br /> for all carbon oxide suppliers
									</th>
								</tr>
								<tr>
									<th class="styTableCellHeader" scope="col" style="width:40mm;font-weight:normal;padding:0.5mm;">
										<strong>(h)</strong>
										Metric tons delivered <br /> (add columns (b), (d), and (f))
									</th>
									<th class="styTableCellHeader" scope="col" style="width:41mm;font-weight:normal;padding:0.5mm;">
										<strong>(i)</strong>
										Metric tons stored <br /> (add columns (c), (e), and (g))
									</th>
									<th class="styTableCellHeader" scope="col" style="width:40mm;font-weight:normal;padding:0.5mm;">
										<strong>(j)</strong>
										Metric tons delivered
									</th>
									<th class="styTableCellHeader" scope="col" style="width:40mm;font-weight:normal;padding:0.5mm;">
										<strong>(k)</strong>
										Metric tons stored
									</th>
									<th class="styTableCellHeader" scope="col" style="width:40mm;font-weight:normal;padding:0.5mm;">
										<strong>(l)</strong>
										Metric tons delivered <br /> (add columns (h) and (j))
									</th>
									<th class="styTableCellHeader" scope="col" style="width:40mm;font-weight:normal;padding:0.5mm;border-right-width:0px;">
										<strong>(m)</strong>
										Metric tons stored <br /> (add columns (i) and (k))
									</th>
								</tr>
							</thead>
							<tbody>
								<xsl:if test="not($shouldSeparateL20)">
									<xsl:for-each select="$FormData/GeologicalDisposalSiteOwnrGrp">
										<xsl:variable name="rowNum"><xsl:number format="A" value="position()"/></xsl:variable>
										<tr style="">
											<td class="styTableCellTextInherit">
												<span style="font-weight:bold;width:4mm;"><xsl:value-of select="$rowNum"/></span>
											</td>
											<td class="styTableCellAmtInherit" style="">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="TotQlfyCrbnOxdGrp/DeliveredQty"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellAmtInherit">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="TotQlfyCrbnOxdGrp/StoredQty"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellAmtInherit" style="">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="OthNonQlfyCrbnOxdGrp/DeliveredQty"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellAmtInherit">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="OthNonQlfyCrbnOxdGrp/StoredQty"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellAmtInherit" style="">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="TotAllCrbnOxdSuppliersGrp/DeliveredQty"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellAmtInherit" style="border-right-width:0px;">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="TotAllCrbnOxdSuppliersGrp/StoredQty"/>
												</xsl:call-template>
											</td>
										</tr>
									</xsl:for-each>
								</xsl:if>
								<xsl:if test="$shouldSeparateL20 or count($FormData/OthNonQlfyCrbnOxdGrp) &lt; 4">
									<xsl:call-template name="FillTable7Cols">
										<xsl:with-param name="LineNumber" select="1 + count($FormData/GeologicalDisposalSiteOwnrGrp)"/>
										<xsl:with-param name="MaxLine" select="4"/>
										<xsl:with-param name="SepMessage" select="$shouldSeparateL20"/>
									</xsl:call-template>
								</xsl:if>
								<tr style="vertical-align:bottom;">
									<td class="styTableCellTextInherit">
										Total 
									</td>
									<td class="styTableCellAmtInherit" style="">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$FormData/AllOwnerTotQlfyCrbnOxdGrp/DeliveredQty"/>
										</xsl:call-template>
									</td>
									<td class="styTableCellAmtInherit">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$FormData/AllOwnerTotQlfyCrbnOxdGrp/StoredQty"/>
										</xsl:call-template>
									</td>
									<td class="styTableCellAmtInherit" style="">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$FormData/AllOwnerOthNonQlfyCrbnOxdGrp/DeliveredQty"/>
										</xsl:call-template>
									</td>
									<td class="styTableCellAmtInherit">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$FormData/AllOwnerOthNonQlfyCrbnOxdGrp/StoredQty"/>
										</xsl:call-template>
									</td>
									<td class="styTableCellAmtInherit" style="">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$FormData/AllOwnerTotAllCrbnOxdSuprGrp/DeliveredQty"/>
										</xsl:call-template>
									</td>
									<td class="styTableCellAmtInherit" style="border-right-width:0px;">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$FormData/AllOwnerTotAllCrbnOxdSuprGrp/StoredQty"/>
										</xsl:call-template>
									</td>
								</tr>
							</tbody>
						</table>
					</div>
			
							<!--Line 11-->
					<div class="styStdDivLS" style="padding-top:3mm;">
						<div class="styLNLeftNumBox">11</div>
						<div class="styLNDesc" style="width:240mm;">
							Check here to attest that all information provided on line 10 conforms to all applicable EPA filings
							<span class="sty8933SchBDotLn">.............................</span>
						</div>
						<div class="styGenericDiv" style="padding-top:1px;">
							<input type="checkbox" class="styCkboxNM" style="" aria-label="Attestation">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$FormData/AttestationInd"/>
									<xsl:with-param name="BackupName">IRS8933SchB/AttestationInd</xsl:with-param>
								</xsl:call-template>
							</input>
						</div>
					</div>
					
			
			
					<!-- Page end -->
					
				<!---Footer-->
					<div class="styStdDivLS pageEnd" style="border-top:1px solid black;">						
					</div>
								<div class="styStdDivLS pageEnd" style="border-top:1px solid black;">
					
						<span style="float:right;">
							<strong>Schedule B (Form 8933)</strong> (Rev. 12-2025)
						</span>
					</div>
					
					<!--Header-->
					<div class="styStdDivLS">
						Schedule B (Form 8933) (Rev. 12-2025)
						<div style="float:right;">
							Page <span style="font-weight:bold;font-size:8pt;">3</span>
						</div>
					</div>				
								
					
					<xsl:variable name="ExcessSuppliers" select="$FormData/GeologicalDisposalSiteOwnrGrp/SupplierSectionGrp[count(preceding-sibling::*) mod 3 = 1 and position() > 1]"/>
					<xsl:if test="$shouldSeparateL20 or count($ExcessSuppliers) &gt; 1">
						
						<div class="styStdDivLS" style="border-top:1px solid black;border-bottom:1px solid black;">
							<div class="styPartName">Part III</div>
							<div class="styPartDesc">Line 10 Additional Data</div>
						</div>
					</xsl:if>
					<xsl:if test="$shouldSeparateL20">
						<div class="styTableContainerLandscapeNBB" style="" id="Line20Table1">
							<xsl:call-template name="SetInitialState"/>
							<table class="styTable" style="font-size:7pt;border-collapse:collapse;">
								<thead class="styTableThead">
									<tr style="border-top:1px solid black;">
										<th class="styTableCellHeader" scope="col" rowspan="3" style="width:46mm;font-weight:normal;">
											<strong>(a)</strong>
											Geological disposal<br/>site owner
										</th>
										<th class="styTableCellHeader" scope="colgroup" colspan="6" style="width:auto;border-right-width:0px;">
											Qualified Carbon Oxide Supplier
										</th>
									</tr>
									<tr>
										<th class="styTableCellHeader" scope="colgroup" colspan="2" style="width:70mm;padding-top:1.5mm;padding-bottom:1.5mm;font-weight:normal;">
											<strong>(i)</strong> 
											<span style="width:60mm;border-bottom:1px solid black;margin-left:0.5mm;">
												<xsl:call-template name="FillNameChoice">
													<xsl:with-param name="TargetBusinessName" select="$FormData/TotalSupplierSectionGrp[1]/SupplierName"/>
													<xsl:with-param name="TargetPersonName" select="$FormData/TotalSupplierSectionGrp[1]/SupplierPersonNm"/>
												</xsl:call-template>
											</span>
										</th>
										<th class="styTableCellHeader" scope="colgroup" colspan="2" style="width:70mm;font-weight:normal;">
											<strong>(ii)</strong> 
											<span style="width:60mm;border-bottom:1px solid black;margin-left:0.5mm;">
												<xsl:call-template name="FillNameChoice">
													<xsl:with-param name="TargetBusinessName" select="$FormData/TotalSupplierSectionGrp[2]/SupplierName"/>
													<xsl:with-param name="TargetPersonName" select="$FormData/TotalSupplierSectionGrp[2]/SupplierPersonNm"/>
												</xsl:call-template>
											</span>
										</th>
										<th class="styTableCellHeader" scope="colgroup" colspan="2" style="width:70mm;border-right-width:0px;font-weight:normal;">
											<strong>(iii)</strong> 
											<span style="width:60mm;border-bottom:1px solid black;margin-left:0.5mm;">
												<xsl:call-template name="FillNameChoice">
													<xsl:with-param name="TargetBusinessName" select="$FormData/TotalSupplierSectionGrp[3]/SupplierName"/>
													<xsl:with-param name="TargetPersonName" select="$FormData/TotalSupplierSectionGrp[3]/SupplierPersonNm"/>
												</xsl:call-template>
											</span>
										</th>
									</tr>
									<tr>
										<th class="styTableCellHeader" scope="col" style="width:35mm;font-weight:normal;padding:0.5mm;">
											<strong>(b)</strong>
											Metric tons <br /> delivered
										</th>
										<th class="styTableCellHeader" scope="col" style="width:35mm;font-weight:normal;padding:0.5mm;">
											<strong>(c)</strong>
											Metric tons <br /> stored
										</th>
										<th class="styTableCellHeader" scope="col" style="width:35mm;font-weight:normal;padding:0.5mm;">
											<strong>(d)</strong>
											Metric tons <br /> delivered
										</th>
										<th class="styTableCellHeader" scope="col" style="width:35mm;font-weight:normal;padding:0.5mm;">
											<strong>(e)</strong>
											Metric tons <br /> stored
										</th>
										<th class="styTableCellHeader" scope="col" style="width:35mm;font-weight:normal;padding:0.5mm;">
											<strong>(f)</strong>
											Metric tons <br /> delivered
										</th>
										<th class="styTableCellHeader" scope="col" style="width:35mm;font-weight:normal;padding:0.5mm;border-right-width:0px;">
											<strong>(g)</strong>
											Metric tons <br /> stored
										</th>
									</tr>
								</thead>
								<tbody>
									<xsl:for-each select="$FormData/GeologicalDisposalSiteOwnrGrp">
										<xsl:variable name="rowNum"><xsl:number format="A" value="position()"/></xsl:variable>
										<tr style="vertical-align:bottom;">
											<td class="styTableCellTextInherit">
												<span style="font-weight:bold;width:4mm;"><xsl:value-of select="$rowNum"/></span>
												<xsl:call-template name="FillNameChoice">
													<xsl:with-param name="TargetBusinessName" select="BusinessOwnerName"/>
													<xsl:with-param name="TargetPersonName" select="OwnerNm"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellAmtInherit" style="">
												<span style="float:left;">
													<xsl:call-template name="LinkToLeftoverDataTableInline">
														<xsl:with-param name="Desc">Line 20, row <xsl:value-of select="$rowNum"/> - Supplier 1 Person Name</xsl:with-param>
														<xsl:with-param name="TargetNode" select="SupplierSectionGrp[1]/SupplierPersonNm"/>
													</xsl:call-template>
													<xsl:call-template name="LinkToLeftoverDataTableInline">
														<xsl:with-param name="Desc">Line 20, row <xsl:value-of select="$rowNum"/> - Supplier 1 Business Name</xsl:with-param>
														<xsl:with-param name="TargetNode" select="SupplierSectionGrp[1]/SupplierName/BusinessNameLine1Txt"/>
													</xsl:call-template>
												</span>
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="SupplierSectionGrp[1]/SupplierMetricTonsGrp/DeliveredQty"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellAmtInherit">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="SupplierSectionGrp[1]/SupplierMetricTonsGrp/StoredQty"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellAmtInherit" style="">
												<span style="float:left;">
													<xsl:call-template name="LinkToLeftoverDataTableInline">
														<xsl:with-param name="Desc">Line 20, row <xsl:value-of select="$rowNum"/> - Supplier 2 Person Name</xsl:with-param>
														<xsl:with-param name="TargetNode" select="SupplierSectionGrp[2]/SupplierPersonNm"/>
													</xsl:call-template>
													<xsl:call-template name="LinkToLeftoverDataTableInline">
														<xsl:with-param name="Desc">Line 20, row <xsl:value-of select="$rowNum"/> - Supplier 2 Business Name</xsl:with-param>
														<xsl:with-param name="TargetNode" select="SupplierSectionGrp[2]/SupplierName/BusinessNameLine1Txt"/>
													</xsl:call-template>
												</span>
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="SupplierSectionGrp[2]/SupplierMetricTonsGrp/DeliveredQty"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellAmtInherit">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="SupplierSectionGrp[2]/SupplierMetricTonsGrp/StoredQty"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellAmtInherit" style="">
												<span style="float:left;">
													<xsl:call-template name="LinkToLeftoverDataTableInline">
														<xsl:with-param name="Desc">Line 20, row <xsl:value-of select="$rowNum"/> - Supplier 3 Person Name</xsl:with-param>
														<xsl:with-param name="TargetNode" select="SupplierSectionGrp[3]/SupplierPersonNm"/>
													</xsl:call-template>
													<xsl:call-template name="LinkToLeftoverDataTableInline">
														<xsl:with-param name="Desc">Line 20, row <xsl:value-of select="$rowNum"/> - Supplier 3 Business Name</xsl:with-param>
														<xsl:with-param name="TargetNode" select="SupplierSectionGrp[3]/SupplierName/BusinessNameLine1Txt"/>
													</xsl:call-template>
												</span>
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="SupplierSectionGrp[3]/SupplierMetricTonsGrp/DeliveredQty"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellAmtInherit" style="border-right-width:0px;">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="SupplierSectionGrp[3]/SupplierMetricTonsGrp/StoredQty"/>
												</xsl:call-template>
											</td>
										</tr>
									</xsl:for-each>
									<tr style="vertical-align:bottom;">
										<td class="styTableCellTextInherit">
											Total 
											<span class="sty8933CDotLn">........</span>
										</td>
										<td class="styTableCellAmtInherit" style="">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="$FormData/TotalSupplierSectionGrp[1]/TotSupplierMetricTonsGrp/DeliveredQty"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellAmtInherit">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="$FormData/TotalSupplierSectionGrp[1]/TotSupplierMetricTonsGrp/StoredQty"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellAmtInherit" style="">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="$FormData/TotalSupplierSectionGrp[2]/TotSupplierMetricTonsGrp/DeliveredQty"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellAmtInherit">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="$FormData/TotalSupplierSectionGrp[2]/TotSupplierMetricTonsGrp/StoredQty"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellAmtInherit" style="">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="$FormData/TotalSupplierSectionGrp[3]/TotSupplierMetricTonsGrp/DeliveredQty"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellAmtInherit" style="border-right-width:0px;">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="$FormData/TotalSupplierSectionGrp[3]/TotSupplierMetricTonsGrp/StoredQty"/>
											</xsl:call-template>
										</td>
									</tr>
								</tbody>
							</table>
						</div>
						
						
						
						<!-- Table 1 Total -->
						<div class="styTableContainerLandscapeNBB" style="" id="Line20Table2Sep">
							<xsl:call-template name="SetInitialState"/>
							<table class="styTable" style="font-size:7pt;border-collapse:collapse;">
								<thead class="styTableThead">
									<tr>
										<th class="styTableCellHeader" scope="col" rowspan="2" style="width:11mm;font-weight:normal;background-color:lightgrey;">
											&nbsp;
										</th>
										<th class="styTableCellHeader" scope="colgroup" colspan="2" style="width:81mm;padding-top:1.5mm;padding-bottom:1.5mm;font-weight:normal;">
											<strong>(iv)</strong> 
											Total qualified carbon oxide <br /> from all suppliers
										</th>
										<th class="styTableCellHeader" scope="colgroup" colspan="2" style="width:80mm;font-weight:normal;">
											<strong>(v)</strong> 
											All other suppliers of <br /> nonqualified carbon oxide
										</th>
										<th class="styTableCellHeader" scope="colgroup" colspan="2" style="width:80mm;font-weight:normal;border-right-width:0px;">
											<strong>(vi)</strong> 
											Total metric tons <br /> for all carbon oxide suppliers
										</th>
									</tr>
									<tr>
										<th class="styTableCellHeader" scope="col" style="width:40mm;font-weight:normal;padding:0.5mm;">
											<strong>(h)</strong>
											Metric tons delivered <br /> (add columns (b), (d), and (f))
										</th>
										<th class="styTableCellHeader" scope="col" style="width:41mm;font-weight:normal;padding:0.5mm;">
											<strong>(i)</strong>
											Metric tons stored <br /> (add columns (c), (e), and (g))
										</th>
										<th class="styTableCellHeader" scope="col" style="width:40mm;font-weight:normal;padding:0.5mm;">
											<strong>(j)</strong>
											Metric tons delivered
										</th>
										<th class="styTableCellHeader" scope="col" style="width:40mm;font-weight:normal;padding:0.5mm;">
											<strong>(k)</strong>
											Metric tons stored
										</th>
										<th class="styTableCellHeader" scope="col" style="width:40mm;font-weight:normal;padding:0.5mm;">
											<strong>(l)</strong>
											Metric tons delivered <br /> (add columns (h) and (j))
										</th>
										<th class="styTableCellHeader" scope="col" style="width:40mm;font-weight:normal;padding:0.5mm;border-right-width:0px;">
											<strong>(m)</strong>
											Metric tons stored <br /> (add columns (i) and (k))
										</th>
									</tr>
								</thead>
								<tbody>
									<xsl:for-each select="$FormData/OthNonQlfyCrbnOxdGrp">
										<xsl:variable name="rowNum"><xsl:number format="A" value="position()"/></xsl:variable>
										<tr style="">
											<td class="styTableCellTextInherit">
												<span style="font-weight:bold;width:4mm;"><xsl:value-of select="$rowNum"/></span>
											</td>
											<td class="styTableCellAmtInherit" style="">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="TotQlfyCrbnOxdGrp/DeliveredQty"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellAmtInherit">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="TotQlfyCrbnOxdGrp/StoredQty"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellAmtInherit" style="">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="OthNonQlfyCrbnOxdGrp/DeliveredQty"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellAmtInherit">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="OthNonQlfyCrbnOxdGrp/StoredQty"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellAmtInherit" style="">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="TotAllCrbnOxdSuppliersGrp/DeliveredQty"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellAmtInherit" style="border-right-width:0px;">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="TotAllCrbnOxdSuppliersGrp/StoredQty"/>
												</xsl:call-template>
											</td>
										</tr>
									</xsl:for-each>
									<tr style="vertical-align:bottom;">
										<td class="styTableCellTextInherit">
											Total 
										</td>
										<td class="styTableCellAmtInherit" style="">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="$FormData/AllOwnerTotQlfyCrbnOxdGrp/DeliveredQty"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellAmtInherit">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="$FormData/AllOwnerTotQlfyCrbnOxdGrp/StoredQty"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellAmtInherit" style="">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="$FormData/AllOwnerOthNonQlfyCrbnOxdGrp/DeliveredQty"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellAmtInherit">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="$FormData/AllOwnerOthNonQlfyCrbnOxdGrp/StoredQty"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellAmtInherit" style="">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="$FormData/AllOwnerTotAllCrbnOxdSuprGrp/DeliveredQty"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellAmtInherit" style="border-right-width:0px;">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="$FormData/AllOwnerTotAllCrbnOxdSuprGrp/StoredQty"/>
											</xsl:call-template>
										</td>
									</tr>
								</tbody>
							</table>
						</div>
					</xsl:if>
					<xsl:for-each select="$ExcessSuppliers">
						<xsl:variable name="pos" select="count(preceding-sibling::*)"/>
						<xsl:if test="position() != 1">
							<br /><br />
						</xsl:if>
						<div class="styTableContainerLandscapeNBB" style="" id="Line20TableX">
							<xsl:call-template name="SetInitialState"/>
							<table class="styTable" style="font-size:7pt;border-collapse:collapse;">
								<thead class="styTableThead">
									<tr style="border-top:1px solid black;">
										<th class="styTableCellHeader" scope="col" rowspan="3" style="width:46mm;font-weight:normal;">
											<strong>(a)</strong>
											Geological disposal<br/>site owner
										</th>
										<th class="styTableCellHeader" scope="colgroup" colspan="6" style="width:auto;border-right-width:0px;">
											Qualified Carbon Oxide Supplier
										</th>
									</tr>
									<tr>
										<th class="styTableCellHeader" scope="colgroup" colspan="2" style="width:70mm;font-weight:normal;padding-top:1.5mm;padding-bottom:1.5mm;">
											<strong>(<xsl:number value="$pos" format="i"/>)</strong> 
											<span style="width:60mm;border-bottom:1px solid black;margin-left:0.5mm;">
												<xsl:call-template name="FillNameChoice">
													<xsl:with-param name="TargetBusinessName" select="SupplierName"/>
													<xsl:with-param name="TargetPersonName" select="SupplierPersonNm"/>
												</xsl:call-template>
											</span>
										</th>
										<th class="styTableCellHeader" scope="colgroup" colspan="2" style="width:70mm;font-weight:normal;">
											<strong>(<xsl:number value="$pos + 1" format="i"/>)</strong> 
											<span style="width:60mm;border-bottom:1px solid black;margin-left:0.5mm;">
												<xsl:call-template name="FillNameChoice">
													<xsl:with-param name="TargetBusinessName" select="../SupplierSectionGrp[$pos + 1]/SupplierName"/>
													<xsl:with-param name="TargetPersonName" select="../SupplierSectionGrp[$pos + 1]/SupplierPersonNm"/>
												</xsl:call-template>
											</span>
										</th>
										<th class="styTableCellHeader" scope="colgroup" colspan="2" style="width:70mm;font-weight:normal;border-right-width:0px;">
											<strong>(<xsl:number value="$pos + 2" format="i"/>)</strong> 
											<span style="width:60mm;border-bottom:1px solid black;margin-left:0.5mm;">
												<xsl:call-template name="FillNameChoice">
													<xsl:with-param name="TargetBusinessName" select="../SupplierSectionGrp[$pos + 2]/SupplierName"/>
													<xsl:with-param name="TargetPersonName" select="../SupplierSectionGrp[$pos + 2]/SupplierPersonNm"/>
												</xsl:call-template>
											</span>
										</th>
									</tr>
									<tr>
										<th class="styTableCellHeader" scope="col" style="width:35mm;font-weight:normal;padding:0.5mm;">
											<strong>(b)</strong>
											Metric tons <br /> delivered
										</th>
										<th class="styTableCellHeader" scope="col" style="width:35mm;font-weight:normal;padding:0.5mm;">
											<strong>(c)</strong>
											Metric tons <br /> stored
										</th>
										<th class="styTableCellHeader" scope="col" style="width:35mm;font-weight:normal;padding:0.5mm;">
											<strong>(d)</strong>
											Metric tons <br /> delivered
										</th>
										<th class="styTableCellHeader" scope="col" style="width:35mm;font-weight:normal;padding:0.5mm;">
											<strong>(e)</strong>
											Metric tons <br /> stored
										</th>
										<th class="styTableCellHeader" scope="col" style="width:35mm;font-weight:normal;padding:0.5mm;">
											<strong>(f)</strong>
											Metric tons <br /> delivered
										</th>
										<th class="styTableCellHeader" scope="col" style="width:35mm;font-weight:normal;padding:0.5mm;border-right-width:0px;">
											<strong>(g)</strong>
											Metric tons <br /> stored
										</th>
									</tr>
								</thead>
								<tbody>
									<xsl:variable name="rowNum" select="count(../preceding-sibling::GeologicalDisposalSiteOwnrGrp) + 1"></xsl:variable>
									<xsl:variable name="rowLetter"><xsl:number format="A" value="$rowNum"/></xsl:variable>
									<tr style="vertical-align:bottom;">
										<td class="styTableCellTextInherit">
											<span style="font-weight:bold;width:4mm;"><xsl:value-of select="$rowLetter"/></span>
											<xsl:call-template name="FillNameChoice">
												<xsl:with-param name="TargetBusinessName" select="../BusinessOwnerName"/>
												<xsl:with-param name="TargetPersonName" select="../OwnerNm"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellAmtInherit" style="">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="../SupplierSectionGrp[$pos]/SupplierMetricTonsGrp/DeliveredQty"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellAmtInherit">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="../SupplierSectionGrp[$pos]/SupplierMetricTonsGrp/StoredQty"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellAmtInherit" style="">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="../SupplierSectionGrp[$pos + 1]/SupplierMetricTonsGrp/DeliveredQty"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellAmtInherit">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="../SupplierSectionGrp[$pos + 1]/SupplierMetricTonsGrp/StoredQty"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellAmtInherit" style="">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="../SupplierSectionGrp[$pos + 2]/SupplierMetricTonsGrp/DeliveredQty"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellAmtInherit" style="border-right-width:0px;">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="../SupplierSectionGrp[$pos + 2]/SupplierMetricTonsGrp/StoredQty"/>
											</xsl:call-template>
										</td>
									</tr>
								</tbody>
							</table>
						</div>
					</xsl:for-each>
		
					<!--End Line 10  Table 	--> 								
				
	
					
					<!--Header-->
					<div class="styStdDivLS">
						Schedule B (Form 8933) (Rev. 12-2025)
						<div style="float:right;">
							Page <span style="font-weight:bold;font-size:8pt;">3</span>
						</div>
					</div>				
								
						
					<xsl:for-each select="$FormData/TotalSupplierSectionGrp[position() &gt; 3]">
						<xsl:if test="position() mod 3 = 1">
							<xsl:variable name="pos" select="position() + 3"/>
							<br /><br />
							<div class="styTableContainerLandscapeNBB" style="" id="Line20TableTotalGroupX">
								<xsl:call-template name="SetInitialState"/>
								<table class="styTable" style="font-size:7pt;border-collapse:collapse;">
									<thead class="styTableThead">
										<tr style="border-top:1px solid black;">
											<th class="styTableCellHeader" scope="col" rowspan="3" style="width:28mm;font-weight:normal;">
												&nbsp;
											</th>
											<th class="styTableCellHeader" scope="colgroup" colspan="6" style="width:auto;border-right-width:0px;">
												Qualified Carbon Oxide Supplier
											</th>
										</tr>
										<tr>
											<th class="styTableCellHeader" scope="colgroup" colspan="2" style="width:76mm;font-weight:normal;padding-top:1.5mm;padding-bottom:1.5mm;">
												<strong>(<xsl:number value="$pos" format="i"/>)</strong> 
												<span style="width:60mm;border-bottom:1px solid black;margin-left:0.5mm;">
													<xsl:call-template name="FillNameChoice">
														<xsl:with-param name="TargetBusinessName" select="SupplierName"/>
														<xsl:with-param name="TargetPersonName" select="SupplierPersonNm"/>
													</xsl:call-template>
												</span>
											</th>
											<th class="styTableCellHeader" scope="colgroup" colspan="2" style="width:76mm;font-weight:normal;">
												<strong>(<xsl:number value="$pos + 1" format="i"/>)</strong> 
												<span style="width:60mm;border-bottom:1px solid black;margin-left:0.5mm;">
													<xsl:call-template name="FillNameChoice">
														<xsl:with-param name="TargetBusinessName" select="$FormData/TotalSupplierSectionGrp[$pos + 1]/SupplierName"/>
														<xsl:with-param name="TargetPersonName" select="$FormData/TotalSupplierSectionGrp[$pos + 1]/SupplierPersonNm"/>
													</xsl:call-template>
												</span>
											</th>
											<th class="styTableCellHeader" scope="colgroup" colspan="2" style="width:76mm;font-weight:normal;border-right-width:0px;">
												<strong>(<xsl:number value="$pos + 2" format="i"/>)</strong> 
												<span style="width:60mm;border-bottom:1px solid black;margin-left:0.5mm;">
													<xsl:call-template name="FillNameChoice">
														<xsl:with-param name="TargetBusinessName" select="$FormData/TotalSupplierSectionGrp[$pos + 2]/SupplierName"/>
														<xsl:with-param name="TargetPersonName" select="$FormData/TotalSupplierSectionGrp[$pos + 2]/SupplierPersonNm"/>
													</xsl:call-template>
												</span>
											</th>
										</tr>
										<tr>
											<th class="styTableCellHeader" scope="col" style="width:38mm;font-weight:normal;padding:0.5mm;">
												<strong>(b)</strong>
												Metric tons <br /> delivered
											</th>
											<th class="styTableCellHeader" scope="col" style="width:38mm;font-weight:normal;padding:0.5mm;">
												<strong>(c)</strong>
												Metric tons <br /> stored
											</th>
											<th class="styTableCellHeader" scope="col" style="width:38mm;font-weight:normal;padding:0.5mm;">
												<strong>(d)</strong>
												Metric tons <br /> delivered
											</th>
											<th class="styTableCellHeader" scope="col" style="width:38mm;font-weight:normal;padding:0.5mm;">
												<strong>(e)</strong>
												Metric tons <br /> stored
											</th>
											<th class="styTableCellHeader" scope="col" style="width:38mm;font-weight:normal;padding:0.5mm;">
												<strong>(f)</strong>
												Metric tons <br /> delivered
											</th>
											<th class="styTableCellHeader" scope="col" style="width:38mm;font-weight:normal;padding:0.5mm;border-right-width:0px;">
												<strong>(g)</strong>
												Metric tons <br /> stored
											</th>
										</tr>
									</thead>
									<tbody>
										<tr style="vertical-align:bottom;">
											<td class="styTableCellTextInherit" style="font-weight:bold;">
												Total
											</td>
											<td class="styTableCellAmtInherit" style="">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="$FormData/TotalSupplierSectionGrp[$pos]/TotSupplierMetricTonsGrp/DeliveredQty"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellAmtInherit">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="$FormData/TotalSupplierSectionGrp[$pos]/TotSupplierMetricTonsGrp/StoredQty"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellAmtInherit" style="">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="$FormData/TotalSupplierSectionGrp[$pos + 1]/TotSupplierMetricTonsGrp/DeliveredQty"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellAmtInherit">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="$FormData/TotalSupplierSectionGrp[$pos + 1]/TotSupplierMetricTonsGrp/StoredQty"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellAmtInherit" style="">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="$FormData/TotalSupplierSectionGrp[$pos + 2]/TotSupplierMetricTonsGrp/DeliveredQty"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellAmtInherit" style="border-right-width:0px;">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="$FormData/TotalSupplierSectionGrp[$pos + 2]/TotSupplierMetricTonsGrp/StoredQty"/>
												</xsl:call-template>
											</td>
										</tr>
									</tbody>
								</table>
							</div>
						</xsl:if>
					</xsl:for-each>
			
			
			
							<!-- Form footer-->
					<div class="styStdDivLS pageEnd" style="border-top:1px solid black;">
					
						<span style="float:right;">
							<strong>Schedule B (Form 8933)</strong> (Rev. 12-2025)
						</span>
					</div>
					
					<!-- BEGIN Left Over Table -->				
					
					<!-- Additonal Data Title Bar and Button -->
					
					<div class="styLeftOverTitleLineLandscape" id="">
						<div class="styLeftOverTitle">
						   Additional Data        
						</div>
						<div class="styLeftOverButtonContainerLandscape">
							<input class="styLeftoverTableBtn" type="button" TabIndex="-1" value="Return to Form" onclick="javascript:returnToWriteInImage();"/>
						</div>
					</div>
					
			
					<br/>
					<br class="pageEnd"/>		
					
					
					
					<!-- Additional Data Table -->
					<table class="styLeftOverTbl">
						<xsl:call-template name="PopulateCommonLeftover">
							<xsl:with-param name="TargetNode" select="$FormData"/>
							<xsl:with-param name="DescWidth" select="100"/>
						</xsl:call-template>
					</table>
					
							
				
				</form>
			</body>
		</html>
	</xsl:template>
	
	
	
	<xsl:template name="IRS8933SchBTableFillerRow">
		<xsl:param name="index"/>
		<tr>
			<td class="styTableCell" style="width:60mm;border-top-width:1px;height:7.5mm;text-align:left;">
				<xsl:value-of select="$index"/>
				<span style="width:4px"/>
			</td>
			<td class="styTableCell" style="width:90mm;border-top-width:1px;height:7.5mm">
				<span style="width:4px"/>
			</td>
			<td class="styTableCell" style="width:20mm;border-top-width:1px;height:7.5mm">
				<span style="width:4px"/>
			</td>
			<td class="styTableCell" style="width:20mm;border-top-width:1px;height:7.5mm">
				<span style="width:4px"/>
			</td>
			
		</tr>
	 </xsl:template>
	
		<xsl:template name="FillNameChoice">
		<xsl:param name="TargetBusinessName"/>
		<xsl:param name="TargetPersonName"/>
		<xsl:choose>
			<xsl:when test="$TargetBusinessName">
				<xsl:call-template name="PopulateText">
					<xsl:with-param name="TargetNode" select="$TargetBusinessName/BusinessNameLine1Txt"/>
				</xsl:call-template>
				<xsl:if test="$TargetBusinessName/BusinessNameLine2Txt">
					<br/>
					<xsl:call-template name="PopulateText">
						<xsl:with-param name="TargetNode" select="$TargetBusinessName/BusinessNameLine2Txt"/>
					</xsl:call-template>
				</xsl:if>
			</xsl:when>
			<xsl:otherwise>
				<xsl:call-template name="PopulateText">
					<xsl:with-param name="TargetNode" select="$TargetPersonName"/>
				</xsl:call-template>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template name="FillTable4Cols">
		<xsl:param name="LineNumber"/>
		<xsl:param name="SepMessage" select="false()"/>
		<xsl:param name="MaxLine" select="4"/>
		<tr>
			<td class="styTableCellTextInherit" style="font-weight:bold;"><xsl:number value="$LineNumber" format="A"/></td>
			<td class="styTableCellCtrInherit">
				<xsl:choose>
					<xsl:when test="$SepMessage">
                    See Additional Data Table
				</xsl:when>
					<xsl:otherwise>&nbsp;</xsl:otherwise>
				</xsl:choose>
			</td>
			<td class="styTableCellAmtInherit">&nbsp;</td>
			<td class="styTableCellAmtInherit" style="border-right-width:0px;">&nbsp;</td>
		</tr>
		<xsl:choose>
			<xsl:when test="$SepMessage">
				<xsl:call-template name="FillTable4Cols">
					<xsl:with-param name="LineNumber" select="2"/>
					<xsl:with-param name="SepMessage" select="false()"/>
				</xsl:call-template>
			</xsl:when>
			<xsl:when test="$LineNumber &lt; $MaxLine">
				<xsl:call-template name="FillTable4Cols">
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
		<xsl:param name="MaxLine" select="30"/>
		<tr>
			<td class="styTableCellTextInherit" style="font-weight:bold;"><xsl:number value="$LineNumber" format="A"/></td>
			<td class="styTableCellCtrInherit">
				<xsl:choose>
					<xsl:when test="$SepMessage">
                    See Additional Data Table
				</xsl:when>
					<xsl:otherwise>&nbsp;</xsl:otherwise>
				</xsl:choose>
			</td>
			<td class="styTableCellAmtInherit">&nbsp;</td>
			<td class="styTableCellAmtInherit">&nbsp;</td>
			<td class="styTableCellAmtInherit">&nbsp;</td>
			<td class="styTableCellAmtInherit">&nbsp;</td>
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
		<xsl:param name="MaxLine" select="3"/>
		<tr>
			<td class="styTableCellTextInherit" style="font-weight:bold;"><xsl:number value="$LineNumber" format="A"/></td>
			<td class="styTableCellCtrInherit">
				<xsl:choose>
					<xsl:when test="$SepMessage">
                    See Additional Data Table
				</xsl:when>
					<xsl:otherwise>&nbsp;</xsl:otherwise>
				</xsl:choose>
			</td>
			<td class="styTableCellAmtInherit">&nbsp;</td>
			<td class="styTableCellAmtInherit">&nbsp;</td>
			<td class="styTableCellAmtInherit">&nbsp;</td>
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
	
	

</xsl:stylesheet>