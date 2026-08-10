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
	<xsl:include href="IRS8933ScheduleCStyle.xsl"/>
	<xsl:output method="html" indent="yes"/>
	<xsl:strip-space elements="*"/>
	<xsl:param name="FormData" select="$RtnDoc/IRS8933ScheduleC"/>
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
				<meta name="Description" content="IRS Form 8933 Schedule C"/>
				<script language="JavaScript" src="{$ScriptPath}/FormDisplay.js" type="text/javascript"/>
				<xsl:call-template name="InitJS"/>
				<style type="text/css">
					<xsl:if test="not($Print) or $Print=''">
						<xsl:call-template name="IRS8933ScheduleCStyle"/>
						<xsl:call-template name="AddOnStyle"/>
					</xsl:if>
				</style>
				<xsl:call-template name="GlobalStylesForm"/>
			</head>
			<body class="styBodyClass">
				<form id="Form8933ScheduleC">
					<xsl:call-template name="DocumentHeaderLandscape"/>
					<!-- Page 1 -->
					<!-- Header -->
					<div class="styStdDivLS" style="height:19mm;">
						<div class="styFNBox" style="width:50mm;height:19mm;padding-top:1mm;">
							<strong>SCHEDULE C <br/> (Form 8933) </strong>
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
								Enhanced Oil Recovery Operator Certification
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
					<!-- Part 1 -->
					<div class="styStdDivLS" style="border-top:1px solid black;border-bottom:1px solid black;">
						<div class="styPartName">Part I</div>
						<div class="styPartDesc">Information About the Owner(s) of the Enhanced Oil Recovery (EOR) Project</div>
					</div>
					<!-- Line 1 -->
					<div class="styStdDivLS" style="">
						<div class="styLNLeftNumBoxSD">1</div>
						<div class="styLNDesc" style="width:246mm;">
							Provide information about each owner of the EOR project during the tax year. See instructions.
						</div>
					</div>
					<xsl:variable name="shouldSeparateL1" select="($Print = $Separated) and (count($FormData/EORProjectOwnerInfoGrp) &gt; 4)"/>
					<div class="styTableContainerLandscapeNBB" style="" id="Line1Table">
						<xsl:call-template name="SetInitialState"/>
						<table class="styTable" style="font-size:7pt;border-collapse:collapse;">
							<thead class="styTableThead">
								<tr style="border-top:1px solid black;">
									<th class="styTableCellHeader" scope="col" style="width:85mm;font-weight:normal;">
										<strong>(i)</strong>
										EOR project owner
									</th>
									<th class="styTableCellHeader" scope="col" style="width:85mm;font-weight:normal;">
										<strong>(ii)</strong>
										Address
									</th>
									<th class="styTableCellHeader" scope="col" style="width:25mm;font-weight:normal;">
										<strong>(iii)</strong>
										Employer identification number
									</th>
									<th class="styTableCellHeader" scope="col" style="width:60mm;font-weight:normal;border-right-width:0px;">
										<strong>(iv)</strong>
										Operating interest (%)
									</th>
								</tr>
							</thead>
							<tbody>
								<xsl:for-each select="$FormData/EORProjectOwnerInfoGrp">
									<tr>
										<td class="styTableCellTextInherit">
											<span style="font-weight:bold;width:5mm;">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="AlphaRowId"/>
												</xsl:call-template>
											</span>
											<xsl:call-template name="FillNameChoice">
												<xsl:with-param name="TargetBusinessName" select="BusinessOwnerName"/>
												<xsl:with-param name="TargetPersonName" select="OwnerNm"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellTextInherit">
											<xsl:choose>
												<xsl:when test="OwnerForeignAddress">
													<xsl:call-template name="PopulateForeignAddressTemplate">
														<xsl:with-param name="TargetNode" select="OwnerForeignAddress"/>
													</xsl:call-template>
												</xsl:when>
												<xsl:otherwise>
													<xsl:call-template name="PopulateUSAddressTemplate">
														<xsl:with-param name="TargetNode" select="OwnerUSAddress"/>
													</xsl:call-template>
												</xsl:otherwise>
											</xsl:choose>
										</td>
										<td class="styTableCellCtrInherit">
											<xsl:choose>
												<xsl:when test="OwnerSSN">
													<xsl:call-template name="PopulateSSN">
														<xsl:with-param name="TargetNode" select="OwnerSSN"/>
													</xsl:call-template>
												</xsl:when>
												<xsl:otherwise>
													<xsl:call-template name="PopulateEIN">
														<xsl:with-param name="TargetNode" select="OwnerEIN"/>
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
								<xsl:if test="$shouldSeparateL1 or count($FormData/EORProjectOwnerInfoGrp) &lt; 4">
									<xsl:call-template name="FillTable4Cols">
										<xsl:with-param name="SepMessage" select="$shouldSeparateL1"/>
										<xsl:with-param name="LineNumber" select="count($FormData/EORProjectOwnerInfoGrp) + 1"/>
									</xsl:call-template>
								</xsl:if>
							</tbody>
						</table>
					</div>
					<!-- Part 2 -->
					<div class="styStdDivLS" style="border-top:1px solid black;border-bottom:1px solid black;">
						<div class="styPartName">Part II</div>
						<div class="styPartDesc">Information About the EOR Project</div>
					</div>
					<!-- Line 2 -->
					<div class="styStdDivLS" style="">
						<div class="styLNLeftNumBoxSD" style="height:9mm;">2</div>
						<div class="styLNDesc" style="width:120mm;height:auto;min-height:10mm;border-right:1px solid black;">
							Name and location (county and state)<br />
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/ProjectNm"/>
							</xsl:call-template><br />
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/ProjectLocationTxt"/>
							</xsl:call-template>
						</div>
						<div class="styLNLeftNumBoxSD" style="height:9mm;">3</div>
						<div class="styLNDesc" style="width:119mm;height:auto;">
							Name and EIN of the person who, for purposes of Regulations section 1.45Q-2(h), 
							is the operator of the project<br />
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
								<xsl:when test="count($FormData/OthCoProjOperatorPurposeGrp) &gt; 1">
									<xsl:call-template name="LinkToLeftoverDataTableInline">
										<xsl:with-param name="TargetNode" select="$FormData/OthCoProjOperatorPurposeGrp"/>
										<xsl:with-param name="Desc">Part II, Line 4 - Other companies identified as operator of project for other purposes</xsl:with-param>
									</xsl:call-template>
								</xsl:when>
								<xsl:otherwise>
									<xsl:call-template name="FillNameChoice">
										<xsl:with-param name="TargetBusinessName" select="$FormData/OthCoProjOperatorPurposeGrp/CompanyName"/>
										<xsl:with-param name="TargetPersonName" select="/.."/>
									</xsl:call-template>
									<span style="float:right;">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$FormData/OthCoProjOperatorPurposeGrp/OtherPurposeDesc"/>
										</xsl:call-template>
									</span>
								</xsl:otherwise>
							</xsl:choose>
						</div>
					</div>
					<!-- Line 5, Line 6 -->
					<div class="styStdDivLS" style="border-top:1px solid black;">
						<div class="styLNLeftNumBoxSD" style="height:9mm;">5a</div>
						<div class="styLNDesc" style="width:78mm;height:auto;min-height:10mm;border-right:1px solid black;">
							IRS-issued registration number(s) for the EOR project<br />
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/FacilityIRSIssdRegistrationNum"/>
							</xsl:call-template>
						</div>
						<div class="styLNLeftNumBoxSD" style="height:9mm;">5b</div>
						<div class="styLNDesc" style="width:78mm;height:auto;min-height:10mm;border-right:1px solid black;">
							EPA e-GGRT ID number(s), if available<br />
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/FacilityEPAeGGRTIdNum"/>
							</xsl:call-template>
						</div>
						<div class="styLNLeftNumBoxSD" style="height:9mm;">6</div>
						<div class="styLNDesc" style="width:75mm;height:auto;">
							Date (MM/YYYY) on which the injection of captured qualified carbon oxide began<br />
							<xsl:call-template name="PopulateMonthDayYear">
								<xsl:with-param name="TargetNode" select="$FormData/CarbonOxideInjectionBeginDt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 7 -->
					<div class="styStdDivLS" style="border-top:1px solid black;">
						<div class="styLNLeftNumBoxSD" style="height:7mm;">7</div>
						<div class="styLNDesc" style="width:247mm;height:auto;min-height:7mm;">
							If the project was previously certified under section 43, name of the certified project and date (MM/DD/YYYY) of the petroleum engineer's certification
							<br />
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/PrevCertifiedProjectNm"/>
							</xsl:call-template>
							<span style="margin-left:10mm;">
								<xsl:call-template name="PopulateMonthDayYear">
									<xsl:with-param name="TargetNode" select="$FormData/PrevCertifiedProjectCertDt"/>
								</xsl:call-template>
							</span>
						</div>
					</div>
					<!-- Line 8 -->
					<div class="styStdDivLS" style="border-top:1px solid black;">
						<div class="styLNLeftNumBoxSD">8</div>
						<div class="styLNDesc" style="width:247mm;height:auto;">
							If the project wasn't previously certified under section 43, attach a copy of a valid petroleum engineer's certification to this schedule.
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$FormData/PrevCertifiedProjectNm"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 9-->
					<div class="styStdDivLS">
						<div class="styLNLeftNumBoxSD">9</div>
						<div class="styLNDesc" style="width:217mm;height:auto;">
							Is this project an enhanced natural gas recovery project?
							<span class="sty8933SchCDotLn">...................................</span>
						</div>
						<div class="styGenericDiv" style="font-weight:bold;padding-top:1px;">
							<xsl:call-template name="PopulateSpan">
								<xsl:with-param name="TargetNode" select="$FormData/EnhancedNaturalGasRcvryProjInd"/>
							</xsl:call-template>
							<input type="checkbox" class="styCkboxNM" style="" aria-label="Enhanced Natural Gas Recovery Project Yes">
								<xsl:call-template name="PopulateYesCheckbox">
									<xsl:with-param name="TargetNode" select="$FormData/EnhancedNaturalGasRcvryProjInd"/>
									<xsl:with-param name="BackupName">IRS8933SchC/EnhancedNaturalGasRcvryProjInd</xsl:with-param>
								</xsl:call-template>
							</input>
							Yes
							<input type="checkbox" class="styCkboxNM" style="margin-left:4mm;" aria-label="Enhanced Natural Gas Recovery Project No">
								<xsl:call-template name="PopulateNoCheckbox">
									<xsl:with-param name="TargetNode" select="$FormData/EnhancedNaturalGasRcvryProjInd"/>
									<xsl:with-param name="BackupName">IRS8933SchC/EnhancedNaturalGasRcvryProjInd</xsl:with-param>
								</xsl:call-template>
							</input>
							No
						</div>
					</div>
					<!-- Line 10 -->
					<div class="styStdDivLS">
						<div class="styLNLeftNumBox">10</div>
						<div class="styLNDesc" style="width:217mm;height:auto;">
							Are all injection wells appropriately permitted? If you answered "No," you can't claim the credit
							<span class="sty8933SchCDotLn">.......................</span>
						</div>
						<div class="styGenericDiv" style="font-weight:bold;padding-top:1px;">
							<xsl:call-template name="PopulateSpan">
								<xsl:with-param name="TargetNode" select="$FormData/InjectionWellsPermittedInd"/>
							</xsl:call-template>
							<input type="checkbox" class="styCkboxNM" style="" aria-label="Injection Wells Permitted Yes">
								<xsl:call-template name="PopulateYesCheckbox">
									<xsl:with-param name="TargetNode" select="$FormData/InjectionWellsPermittedInd"/>
									<xsl:with-param name="BackupName">IRS8933SchC/InjectionWellsPermittedInd</xsl:with-param>
								</xsl:call-template>
							</input>
							Yes
							<input type="checkbox" class="styCkboxNM" style="margin-left:4mm;" aria-label="Injection Wells Permitted No">
								<xsl:call-template name="PopulateNoCheckbox">
									<xsl:with-param name="TargetNode" select="$FormData/InjectionWellsPermittedInd"/>
									<xsl:with-param name="BackupName">IRS8933SchC/InjectionWellsPermittedInd</xsl:with-param>
								</xsl:call-template>
							</input>
							No
						</div>
					</div>
					<!-- Line 11 -->
					<div class="styStdDivLS">
						<div class="styLNLeftNumBox">11</div>
						<div class="styLNDesc" style="width:247mm;">
							Reserved for future use
						</div>
					</div>
					<!-- Line 12-->
					<div class="styStdDivLS">
						<div class="styLNLeftNumBox">12</div>
						<div class="styLNDesc" style="width:217mm;height:auto;">
							Are any of the wells in the project EPA Class VI?
							<span class="sty8933SchCDotLn">......................................</span>
						</div>
						<div class="styGenericDiv" style="font-weight:bold;padding-top:1px;">
							<xsl:call-template name="PopulateSpan">
								<xsl:with-param name="TargetNode" select="$FormData/WellsEPAClassVIInd"/>
							</xsl:call-template>
							<input type="checkbox" class="styCkboxNM" style="" aria-label="EPA Class VI Wells Yes">
								<xsl:call-template name="PopulateYesCheckbox">
									<xsl:with-param name="TargetNode" select="$FormData/WellsEPAClassVIInd"/>
									<xsl:with-param name="BackupName">IRS8933SchC/WellsEPAClassVIInd</xsl:with-param>
								</xsl:call-template>
							</input>
							Yes
							<input type="checkbox" class="styCkboxNM" style="margin-left:4mm;" aria-label="EPA Class VI Wells No">
								<xsl:call-template name="PopulateNoCheckbox">
									<xsl:with-param name="TargetNode" select="$FormData/WellsEPAClassVIInd"/>
									<xsl:with-param name="BackupName">IRS8933SchC/WellsEPAClassVIInd</xsl:with-param>
								</xsl:call-template>
							</input>
							No
						</div>
					</div>
					<!-- Line 13 -->
					<div class="styStdDivLS">
						<div class="styLNLeftNumBox">13</div>
						<div class="styLNDesc" style="width:240mm;height:auto;">
							If you answered "Yes" to line 12, check here to declare that all figures of stored qualified carbon oxide on this schedule are consistent with figures reported to the EPA 
							pursuant to the applicable MRV plan and subpart RR of EPA's Greenhouse Gas Reporting Program
							<span class="sty8933SchCDotLn">..................................</span>
						</div>
						<input type="checkbox" class="styCkboxNM" style="margin-top:3mm;" aria-label="Figures Consistent with EPA Report ">
							<xsl:call-template name="PopulateCheckbox">
								<xsl:with-param name="TargetNode" select="$FormData/EPAFiguresRptConsistentInd"/>
								<xsl:with-param name="BackupName">IRS8933SchC/EPAFiguresRptConsistentInd</xsl:with-param>
							</xsl:call-template>
						</input>
					</div>
					<!-- Line 14 -->
					<div class="styStdDivLS">
						<div class="styLNLeftNumBox">14</div>
						<div class="styLNDesc" style="width:220mm;height:auto;">
							If you answered "Yes" to line 12, provide the EPA approval date (MM/DD/YYYY) of the MRV plan, and attach a copy of the approved MRV 
							plan or its URL on the EPA's website
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$FormData/EPAApprovalDt"/>
							</xsl:call-template>
							<!--<span class="sty8933SchCDotLn">................................</span>-->
						</div>
						<div class="styLNAmountBox" style="width:27mm;border-left-width:0px;text-align:center;height:auto;">
							<xsl:call-template name="PopulateMonthDayYear">
								<xsl:with-param name="TargetNode" select="$FormData/EPAApprovalDt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 15 -->
					<div class="styStdDivLS">
						<div class="styLNLeftNumBox">15</div>
						<div class="styLNDesc" style="width:200mm;height:auto;">
							If you answered "Yes" to line 10 and "No" to line 12, are you relying on subpart RR of the Greenhouse 
							Gas Reporting Program or ISO 27916 to demonstrate secure storage (check which one)?
							<span class="sty8933SchCDotLn">.....................................</span>
						</div>
						<div class="styGenericDiv" style="width:47mm;padding-top:2.5mm;">
							<input type="checkbox" class="styCkboxNM" style="" aria-label="Subpart RR">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$FormData/SubpartRRInd"/>
									<xsl:with-param name="BackupName">IRS8933SchC/SubpartRRInd</xsl:with-param>
								</xsl:call-template>
							</input>
							Subpart RR
							<input type="checkbox" class="styCkboxNM" style="margin-left:5mm;" aria-label="ISO 27916">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$FormData/ISO27916Ind"/>
									<xsl:with-param name="BackupName">IRS8933SchC/ISO27916Ind</xsl:with-param>
								</xsl:call-template>
							</input>
							ISO 27916
						</div>
					</div>
					<!-- Line 16 -->
					<div class="styStdDivLS">
						<div class="styLNLeftNumBox">16</div>
						<div class="styLNDesc" style="width:220mm;height:auto;">
							If line 15 is subpart RR, provide the EPA approval date (MM/DD/YYYY) of the MRV plan, and attach a copy of the approved MRV plan or its URL on the EPA's website
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$FormData/SubpartRREPAApprovalDt"/>
							</xsl:call-template>
							<!--<span class="sty8933SchCDotLn">................................</span>-->
						</div>
						<div class="styLNAmountBox" style="width:27mm;border-left-width:0px;text-align:center;height:auto;">
							<xsl:call-template name="PopulateMonthDayYear">
								<xsl:with-param name="TargetNode" select="$FormData/SubpartRREPAApprovalDt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 17 -->
					<div class="styStdDivLS">
						<div class="styLNLeftNumBox">17</div>
						<div class="styLNDesc" style="width:247mm;height:auto;">
							If line 15 is ISO 27916, attach a copy of the ISO 27916 documentation for the year.
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$FormData/ISO27916Ind"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 18 -->
					<div class="styStdDivLS">
						<div class="styLNLeftNumBox">18</div>
						<div class="styLNDesc" style="width:247mm;height:auto;">
							If line 15 is ISO 27916, attach a copy of the certification completed by a qualified independent engineer or geologist.
							<!--<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$FormData/ISO27916Ind"/>
							</xsl:call-template>-->
						</div>
					</div>
					<!-- Form footer-->
					<div class="styStdDivLS pageEnd" style="border-top:1px solid black;">
						<span style="font-weight:bold;font-family:Arial;">For Paperwork Reduction Act Notice, see the Instructions for Form 8933.</span>
						<span style="margin-left:35mm;">Cat. No. 94874C</span>
						<span style="float:right;">
							<strong>Schedule C (Form 8933)</strong> (Rev. 12-2025)
						</span>
					</div>
					<div class="styStdDivLS">
						Schedule C (Form 8933) (Rev. 12-2025)
						<div style="float:right;">
							Page <span style="font-weight:bold;font-size:8pt;">2</span>
						</div>
					</div>
					<!-- Part 3 -->
					<div class="styStdDivLS" style="border-top:1px solid black;border-bottom:1px solid black;">
						<div class="styPartName">Part III</div>
						<div class="styPartDesc">Information About the Owner(s) of the Enhanced Oil Recovery (EOR) Project</div>
					</div>
					<!-- Line 19 -->
					<div class="styStdDivLS">
						<div class="styLNLeftNumBox">19</div>
						<div class="styLNDesc" style="width:247mm;">
							Provide information about all suppliers of qualified carbon oxide during the tax year. See instructions.
						</div>
					</div>
					<xsl:variable name="shouldSeparateL19" select="($Print = $Separated) and (count($FormData/QlfyCrbnOxdSupplierEORGrp) &gt; 4)"/>
					<div class="styTableContainerLandscapeNBB" style="" id="Line19Table">
						<xsl:call-template name="SetInitialState"/>
						<table class="styTable" style="font-size:7pt;border-collapse:collapse;width:256mm;">
							<thead class="styTableThead">
								<tr style="border-top:1px solid black;">
									<th class="styTableCellHeader" scope="col" style="width:65mm;font-weight:normal;">
										<strong>(i)</strong>
										Qualified carbon <br /> oxide supplier
									</th>
									<th class="styTableCellHeader" scope="col" style="width:25mm;font-weight:normal;">
										<strong>(ii)</strong>
										EIN
									</th>
									<th class="styTableCellHeader" scope="col" style="width:65mm;font-weight:normal;">
										<strong>(iii)</strong>
										Name of capture facility
									</th>
									<th class="styTableCellHeader" scope="col" style="width:60mm;font-weight:normal;">
										<strong>(iv)</strong>
										Location of capture facility <br /> (county and state)
									</th>
									<th class="styTableCellHeader" scope="col" style="width:20mm;font-weight:normal;">
										<strong>(v)</strong>
										Check if supplier provided any qualified carbon oxide
									</th>
									<th class="styTableCellHeader" scope="col" style="width:20mm;font-weight:normal;border-right-width:0px;">
										<strong>(vi)</strong>
										Check if supplier supplied any nonqualified carbon oxide from any source
									</th>
								</tr>
							</thead>
							<tbody>
								<xsl:for-each select="$FormData/QlfyCrbnOxdSupplierEORGrp">
									<tr>
										<td class="styTableCellTextInherit">
											<span style="font-weight:bold;width:5mm;"><xsl:number format="A" value="position()"/></span>
											<xsl:call-template name="FillNameChoice">
												<xsl:with-param name="TargetBusinessName" select="SupplierName"/>
												<xsl:with-param name="TargetPersonName" select="/.."/>
											</xsl:call-template>
										</td>
										<td class="styTableCellCtrInherit">
											<xsl:call-template name="PopulateEIN">
												<xsl:with-param name="TargetNode" select="SupplierEIN"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellTextInherit">
											<xsl:call-template name="FillNameChoice">
												<xsl:with-param name="TargetBusinessName" select="FacilityName"/>
												<xsl:with-param name="TargetPersonName" select="/.."/>
											</xsl:call-template>
										</td>
										<td class="styTableCellTextInherit">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="LocationTxt"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellCtrInherit">
											<input type="checkbox" class="styCkbox" style="">
												<xsl:attribute name="aria-label">
													Row <xsl:number format="A" value="position()"/>, Supplied Any Qualified Carbon Oxide
												</xsl:attribute>
												<xsl:call-template name="PopulateCheckbox">
													<xsl:with-param name="TargetNode" select="QlfyCrbnOxdInd"/>
													<xsl:with-param name="BackupName">IRS8933SchC/QlfyCrbnOxdInd<xsl:value-of select="position()"/></xsl:with-param>
												</xsl:call-template>
											</input>
										</td>
										<td class="styTableCellCtrInherit" style="border-right-width:0px;">
											<input type="checkbox" class="styCkbox" style="">
												<xsl:attribute name="aria-label">
													Row <xsl:number format="A" value="position()"/>, Supplied Any Nonqualified Carbon Oxide
												</xsl:attribute>
												<xsl:call-template name="PopulateCheckbox">
													<xsl:with-param name="TargetNode" select="NonqualifiedCrbnOxdInd"/>
													<xsl:with-param name="BackupName">IRS8933SchC/NonqualifiedCrbnOxdInd<xsl:value-of select="position()"/></xsl:with-param>
												</xsl:call-template>
											</input>
										</td>
									</tr>
								</xsl:for-each>
								<xsl:if test="$shouldSeparateL19 or count($FormData/QlfyCrbnOxdSupplierEORGrp) &lt; 1">
									<tr>
										<td class="styTableCellTextInherit">
											<span style="font-weight:bold;width:5mm;">A</span>
											<xsl:if test="$shouldSeparateL19">
												See additional data table
											</xsl:if>
										</td>
										<td class="styTableCellCtrInherit">&nbsp;</td>
										<td class="styTableCellTextInherit">&nbsp;</td>
										<td class="styTableCellTextInherit">&nbsp;</td>
										<td class="styTableCellCtrInherit">
											<input type="checkbox" class="styCkbox" style="">
												<xsl:attribute name="aria-label">Row A, Supplied Any Qualified Carbon Oxide</xsl:attribute>
												<xsl:call-template name="PopulateCheckbox">
													<xsl:with-param name="TargetNode" select="/.."/>
													<xsl:with-param name="BackupName">IRS8933SchC/QlfyCrbnOxdInd1</xsl:with-param>
												</xsl:call-template>
											</input>
										</td>
										<td class="styTableCellCtrInherit" style="border-right-width:0px;">
											<input type="checkbox" class="styCkbox" style="">
												<xsl:attribute name="aria-label">Row A, Supplied Any Nonqualified Carbon Oxide</xsl:attribute>
												<xsl:call-template name="PopulateCheckbox">
													<xsl:with-param name="TargetNode" select="/.."/>
													<xsl:with-param name="BackupName">IRS8933SchC/NonqualifiedCrbnOxdInd1</xsl:with-param>
												</xsl:call-template>
											</input>
										</td>
									</tr>
								</xsl:if> 
								<xsl:if test="$shouldSeparateL19 or count($FormData/QlfyCrbnOxdSupplierEORGrp) &lt; 2">
									<tr>
										<td class="styTableCellTextInherit">
											<span style="font-weight:bold;width:5mm;">B</span>
										</td>
										<td class="styTableCellCtrInherit">&nbsp;</td>
										<td class="styTableCellTextInherit">&nbsp;</td>
										<td class="styTableCellTextInherit">&nbsp;</td>
										<td class="styTableCellCtrInherit">
											<input type="checkbox" class="styCkbox" style="">
												<xsl:attribute name="aria-label">Row B, Supplied Any Qualified Carbon Oxide</xsl:attribute>
												<xsl:call-template name="PopulateCheckbox">
													<xsl:with-param name="TargetNode" select="/.."/>
													<xsl:with-param name="BackupName">IRS8933SchC/QlfyCrbnOxdInd2</xsl:with-param>
												</xsl:call-template>
											</input>
										</td>
										<td class="styTableCellCtrInherit" style="border-right-width:0px;">
											<input type="checkbox" class="styCkbox" style="">
												<xsl:attribute name="aria-label">Row B, Supplied Any Nonqualified Carbon Oxide</xsl:attribute>
												<xsl:call-template name="PopulateCheckbox">
													<xsl:with-param name="TargetNode" select="/.."/>
													<xsl:with-param name="BackupName">IRS8933SchC/NonqualifiedCrbnOxdInd2</xsl:with-param>
												</xsl:call-template>
											</input>
										</td>
									</tr>
								</xsl:if> 
								<xsl:if test="$shouldSeparateL19 or count($FormData/QlfyCrbnOxdSupplierEORGrp) &lt; 3">
									<tr>
										<td class="styTableCellTextInherit">
											<span style="font-weight:bold;width:5mm;">C</span>
										</td>
										<td class="styTableCellCtrInherit">&nbsp;</td>
										<td class="styTableCellTextInherit">&nbsp;</td>
										<td class="styTableCellTextInherit">&nbsp;</td>
										<td class="styTableCellCtrInherit">
											<input type="checkbox" class="styCkbox" style="">
												<xsl:attribute name="aria-label">Row C, Supplied Any Qualified Carbon Oxide</xsl:attribute>
												<xsl:call-template name="PopulateCheckbox">
													<xsl:with-param name="TargetNode" select="/.."/>
													<xsl:with-param name="BackupName">IRS8933SchC/QlfyCrbnOxdInd3</xsl:with-param>
												</xsl:call-template>
											</input>
										</td>
										<td class="styTableCellCtrInherit" style="border-right-width:0px;">
											<input type="checkbox" class="styCkbox" style="">
												<xsl:attribute name="aria-label">Row C, Supplied Any Nonqualified Carbon Oxide</xsl:attribute>
												<xsl:call-template name="PopulateCheckbox">
													<xsl:with-param name="TargetNode" select="/.."/>
													<xsl:with-param name="BackupName">IRS8933SchC/NonqualifiedCrbnOxdInd3</xsl:with-param>
												</xsl:call-template>
											</input>
										</td>
									</tr>
								</xsl:if> 
							</tbody>
						</table>
					</div>
					<!-- Line 20 -->
					<div class="styStdDivLS">
						<div class="styLNLeftNumBox">20</div>
						<div class="styLNDesc" style="width:247mm;height:auto;">
							Provide enhanced oil recovery information consistent with all applicable EPA filings and certified ISO 27916 documentation if it was used to demonstrate secure storage. See instructions.
						</div>
					</div>
					<!-- Line 20, Table 1, cols (a)-(i) -->
					<xsl:variable name="shouldSeparateL20" select="($Print = $Separated) and (count($FormData/EORProjOwnerGrp) &gt; 4)"/>
					<div class="styTableContainerLandscapeNBB" style="" id="Line20Table1">
						<xsl:call-template name="SetInitialState"/>
						<table class="styTable" style="font-size:7pt;border-collapse:collapse;">
							<thead class="styTableThead">
								<tr style="border-top:1px solid black;">
									<th class="styTableCellHeader" scope="col" rowspan="3" style="width:46mm;font-weight:normal;">
										<strong>(a)</strong>
										EOR project owner
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
									<xsl:for-each select="$FormData/EORProjOwnerGrp">
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
								</xsl:if>
								<xsl:if test="$shouldSeparateL20 or count($FormData/EORProjOwnerGrp) &lt; 4">
									<xsl:call-template name="FillTable7Cols">
										<xsl:with-param name="LineNumber" select="1 + count($FormData/EORProjOwnerGrp)"/>
										<xsl:with-param name="MaxLine" select="4"/>
										<xsl:with-param name="SepMessage" select="$shouldSeparateL20"/>
									</xsl:call-template>
								</xsl:if>
								<tr style="vertical-align:bottom;">
									<td class="styTableCellTextInherit">
										Total 
										<span class="sty8933SchCDotLn">........</span>
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
					<!--<xsl:if test="not($shouldSeparateP1)">
						<xsl:call-template name="SetInitialDynamicTableHeight">
							<xsl:with-param name="TargetNode" select="$FormData/ProRataShrAdjNetIncmLossCFCGrp"/>
							<xsl:with-param name="containerID" select=" 'Part1Table' "/>
							<xsl:with-param name="headerHeight" select="2"/>
							<xsl:with-param name="containerHeight" select="30"/>
						</xsl:call-template>
					</xsl:if>-->
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
									<xsl:for-each select="$FormData/EORProjOwnerGrp">
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
								<xsl:if test="$shouldSeparateL20 or count($FormData/EORProjOwnerGrp) &lt; 4">
									<xsl:call-template name="FillTable7Cols">
										<xsl:with-param name="LineNumber" select="1 + count($FormData/EORProjOwnerGrp)"/>
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
					<!-- Line 21 -->
					<div class="styStdDivLS" style="padding-top:3mm;">
						<div class="styLNLeftNumBox">21</div>
						<div class="styLNDesc" style="width:240mm;">
							Check here to attest that all information provided on line 20 conforms to all applicable EPA filings and certified ISO 27916 documentation
							<span class="sty8933SchCDotLn">................</span>
						</div>
						<div class="styGenericDiv" style="padding-top:1px;">
							<input type="checkbox" class="styCkboxNM" style="" aria-label="Attestation">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$FormData/AttestationInd"/>
									<xsl:with-param name="BackupName">IRS8933SchC/AttestationInd</xsl:with-param>
								</xsl:call-template>
							</input>
						</div>
					</div>
					<!-- Form footer-->
					<div class="styStdDivLS pageEnd" style="border-top:1px solid black;">
						<span style="font-weight:bold;font-family:Arial;">For Privacy Act and Paperwork Reduction Act Notice, see the Instructions for Form 4626.</span>
						<span style="margin-left:35mm;">Cat. No. 94588N</span>
						<span style="float:right;">
							<strong>Schedule C (Form 8933)</strong> (Rev. 12-2025)
						</span>
					</div>
					<!-- Page end -->
					<xsl:variable name="ExcessSuppliers" select="$FormData/EORProjOwnerGrp/SupplierSectionGrp[count(preceding-sibling::*) mod 3 = 1 and position() > 1]"/>
					<xsl:if test="$shouldSeparateL20 or count($ExcessSuppliers) &gt; 1">
						<div class="styStdDivLS">
							Schedule C (Form 8933) (Rev. 12-2025)
							<div style="float:right;">
								Page <span style="font-weight:bold;font-size:8pt;">3</span>
							</div>
						</div>
						<div class="styStdDivLS" style="border-top:1px solid black;border-bottom:1px solid black;">
							<div class="styPartName">Part III</div>
							<div class="styPartDesc">Line 20 Additional Data</div>
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
											EOR project owner
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
									<xsl:for-each select="$FormData/EORProjOwnerGrp">
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
									<xsl:for-each select="$FormData/EORProjOwnerGrp">
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
											EOR project owner
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
									<xsl:variable name="rowNum" select="count(../preceding-sibling::EORProjOwnerGrp) + 1"></xsl:variable>
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
					<xsl:if test="$shouldSeparateL20 or count($ExcessSuppliers) &gt; 1">
						<div class="styStdDivLS pageEnd">
							<span style="float:right;">
								<strong>Schedule C (Form 8933)</strong> (Rev. 12-2025)
							</span>
						</div>
					</xsl:if>
					<!-- Additonal Data Title Bar and Button -->
					<div class="styLeftOverTitleLineLandscape" id="">
						<div class="styLeftOverTitle">
						   Additional Data        
						</div>
						<div class="styLeftOverButtonContainerLandscape">
							<input class="styLeftoverTableBtn" type="button" TabIndex="-1" value="Return to Form" onclick="javascript:returnToWriteInImage();"/>
						</div>
					</div>
					<!-- Additional Data Table -->
					<table class="styLeftOverTblLandscape">
						<xsl:call-template name="PopulateCommonLeftover">
							<xsl:with-param name="TargetNode" select="$FormData"/>
							<xsl:with-param name="DescWidth" select="100"/>
						</xsl:call-template>
						
						<xsl:for-each select="$FormData/EORProjOwnerGrp">
							<xsl:variable name="RowLetter"><xsl:number value="position()" format="A"/></xsl:variable>
							<xsl:for-each select="SupplierSectionGrp[position() &lt;= 3]">
								<xsl:variable name="ColLetter"><xsl:number value="position()" format="i"/></xsl:variable>
								<tr>
									<td class="styLeftOverTableRowDesc" style="width:100mm;" scope="row">
										Part III, Line 20, Row <xsl:value-of select="$RowLetter"/>, 
										col(<xsl:value-of select="$ColLetter"/>) - Supplier Name:
									</td>
									<td class="styLeftOverTableRowAmount" style="width:150mm;">
										<xsl:call-template name="FillNameChoice">
											<xsl:with-param name="TargetBusinessName" select="SupplierName"/>
											<xsl:with-param name="TargetPersonName" select="SupplierPersonNm"/>
										</xsl:call-template>
									</td>
								</tr>
							</xsl:for-each>
						</xsl:for-each>
					</table>
					<xsl:if test="count($FormData/OthCoProjOperatorPurposeGrp) &gt; 1">
						<br/>
						<span class="styRepeatingDataTitle">Part II, Line 4 &mdash; Other companies identified as operator</span>
						<table class="styDepTbl" style="font-size:7pt;width:187mm;">
							<thead class="styTableThead">
								<tr class="styDepTblHdr">
									<th class="styDepTblCell" scope="col" style="width:90mm;">Company Name</th>
									<th class="styDepTblCell" scope="col" style="width:95mm;">Purpose</th>
								</tr>
							</thead>
							<tbody>
								<xsl:for-each select="$FormData/OthCoProjOperatorPurposeGrp">
									<tr>
										<xsl:attribute name="class"><xsl:choose>
											<xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when>
											<xsl:otherwise>styDepTblRow2</xsl:otherwise>
										</xsl:choose></xsl:attribute>
										<td class="styTableCellTextInherit">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="CompanyName/BusinessNameLine1Txt"/>
											</xsl:call-template>
											<xsl:if test="CompanyName/BusinessNameLine2Txt">
												<br />
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="CompanyName/BusinessNameLine2Txt"/>
												</xsl:call-template>
											</xsl:if>
										</td>
										<td class="styTableCellTextInherit">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="OtherPurposeDesc"/>
											</xsl:call-template>
										</td>
									</tr>
								</xsl:for-each>
							</tbody>
						</table>
					</xsl:if>
					<xsl:if test="$shouldSeparateL1">
						<br/>
						<span class="styRepeatingDataTitle">Part I, Line 1 &mdash; Owners of EOR Project</span>
						<table class="styDepTbl" style="font-size:7pt;width:256mm;">
							<thead class="styTableThead">
								<tr class="styDepTblHdr">
									<th class="styDepTblCell" scope="col" style="width:85mm;font-weight:normal;">
										<strong>(i)</strong>
										EOR project owner
									</th>
									<th class="styDepTblCell" scope="col" style="width:85mm;font-weight:normal;">
										<strong>(ii)</strong>
										Address
									</th>
									<th class="styDepTblCell" scope="col" style="width:25mm;font-weight:normal;">
										<strong>(iii)</strong>
										Employer identification number
									</th>
									<th class="styDepTblCell" scope="col" style="width:60mm;font-weight:normal;">
										<strong>(iv)</strong>
										Operating interest (%)
									</th>
								</tr>
							</thead>
							<tbody>
								<xsl:for-each select="$FormData/EORProjectOwnerInfoGrp">
									<tr>
										<xsl:attribute name="class"><xsl:choose>
											<xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when>
											<xsl:otherwise>styDepTblRow2</xsl:otherwise>
										</xsl:choose></xsl:attribute>
										<td class="styTableCellTextInherit">
											<span style="font-weight:bold;width:5mm;">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="AlphaRowId"/>
												</xsl:call-template>
											</span>
											<xsl:call-template name="FillNameChoice">
												<xsl:with-param name="TargetBusinessName" select="BusinessOwnerName"/>
												<xsl:with-param name="TargetPersonName" select="OwnerNm"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellTextInherit">
											<xsl:choose>
												<xsl:when test="OwnerForeignAddress">
													<xsl:call-template name="PopulateForeignAddressTemplate">
														<xsl:with-param name="TargetNode" select="OwnerForeignAddress"/>
													</xsl:call-template>
												</xsl:when>
												<xsl:otherwise>
													<xsl:call-template name="PopulateUSAddressTemplate">
														<xsl:with-param name="TargetNode" select="OwnerUSAddress"/>
													</xsl:call-template>
												</xsl:otherwise>
											</xsl:choose>
										</td>
										<td class="styTableCellCtrInherit">
											<xsl:choose>
												<xsl:when test="OwnerSSN">
													<xsl:call-template name="PopulateSSN">
														<xsl:with-param name="TargetNode" select="OwnerSSN"/>
													</xsl:call-template>
												</xsl:when>
												<xsl:otherwise>
													<xsl:call-template name="PopulateEIN">
														<xsl:with-param name="TargetNode" select="OwnerEIN"/>
													</xsl:call-template>
												</xsl:otherwise>
											</xsl:choose>
										</td>
										<td class="styTableCellCtrInherit">
											<xsl:call-template name="PopulatePercent">
												<xsl:with-param name="TargetNode" select="OperatingInterestPct"/>
											</xsl:call-template>
										</td>
									</tr>
								</xsl:for-each>
							</tbody>
						</table>
					</xsl:if>
					<xsl:if test="$shouldSeparateL19">
						<br/>
						<span class="styRepeatingDataTitle">Part III, Line 19 &mdash; Qualified Carbon Oxide Supplier Information</span>
						<table class="styDepTbl" style="font-size:7pt;width:256mm;">
							<thead class="styTableThead">
								<tr class="styDepTblHdr">
									<th class="styDepTblCell" scope="col" style="width:65mm;font-weight:normal;">
										<strong>(i)</strong>
										Qualified carbon <br /> oxide supplier
									</th>
									<th class="styDepTblCell" scope="col" style="width:25mm;font-weight:normal;">
										<strong>(ii)</strong>
										EIN
									</th>
									<th class="styDepTblCell" scope="col" style="width:65mm;font-weight:normal;">
										<strong>(iii)</strong>
										Name of capture facility
									</th>
									<th class="styDepTblCell" scope="col" style="width:60mm;font-weight:normal;">
										<strong>(iv)</strong>
										Location of capture facility <br /> (county and state)
									</th>
									<th class="styDepTblCell" scope="col" style="width:20mm;font-weight:normal;">
										<strong>(v)</strong>
										Check if supplier provided any qualified carbon oxide
									</th>
									<th class="styDepTblCell" scope="col" style="width:20mm;font-weight:normal;">
										<strong>(vi)</strong>
										Check if supplier supplied any nonqualified carbon oxide from any source
									</th>
								</tr>
							</thead>
							<tbody>
								<xsl:for-each select="$FormData/QlfyCrbnOxdSupplierEORGrp">
									<tr>
										<xsl:attribute name="class"><xsl:choose>
											<xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when>
											<xsl:otherwise>styDepTblRow2</xsl:otherwise>
										</xsl:choose></xsl:attribute>
										<td class="styTableCellTextInherit">
											<span style="font-weight:bold;width:5mm;"><xsl:number format="A" value="position()"/></span>
											<xsl:call-template name="FillNameChoice">
												<xsl:with-param name="TargetBusinessName" select="SupplierName"/>
												<xsl:with-param name="TargetPersonName" select="/.."/>
											</xsl:call-template>
										</td>
										<td class="styTableCellCtrInherit">
											<xsl:call-template name="PopulateEIN">
												<xsl:with-param name="TargetNode" select="SupplierEIN"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellTextInherit">
											<xsl:call-template name="FillNameChoice">
												<xsl:with-param name="TargetBusinessName" select="FacilityName"/>
												<xsl:with-param name="TargetPersonName" select="/.."/>
											</xsl:call-template>
										</td>
										<td class="styTableCellTextInherit">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="LocationTxt"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellCtrInherit">
											<input type="checkbox" class="styCkbox" style="">
												<xsl:attribute name="aria-label">
													Row <xsl:number format="A" value="position()"/>, Supplied Any Qualified Carbon Oxide
												</xsl:attribute>
												<xsl:call-template name="PopulateCheckbox">
													<xsl:with-param name="TargetNode" select="QlfyCrbnOxdInd"/>
													<xsl:with-param name="BackupName">IRS8933SchC/QlfyCrbnOxdInd<xsl:value-of select="position()"/></xsl:with-param>
												</xsl:call-template>
											</input>
										</td>
										<td class="styTableCellCtrInherit">
											<input type="checkbox" class="styCkbox" style="">
												<xsl:attribute name="aria-label">
													Row <xsl:number format="A" value="position()"/>, Supplied Any Nonqualified Carbon Oxide
												</xsl:attribute>
												<xsl:call-template name="PopulateCheckbox">
													<xsl:with-param name="TargetNode" select="NonqualifiedCrbnOxdInd"/>
													<xsl:with-param name="BackupName">IRS8933SchC/NonqualifiedCrbnOxdInd<xsl:value-of select="position()"/></xsl:with-param>
												</xsl:call-template>
											</input>
										</td>
									</tr>
								</xsl:for-each>
							</tbody>
						</table>
					</xsl:if>
					<br />
				</form>
			</body>
		</html>
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
</xsl:stylesheet>