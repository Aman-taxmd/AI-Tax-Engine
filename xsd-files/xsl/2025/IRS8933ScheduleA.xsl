<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE xsl:stylesheet [
	<!ENTITY nbsp "&#160;"> 
]>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:include href="PopulateTemplate.xsl"/>
	<xsl:include href="AddHeader.xsl"/>
	<xsl:include href="CommonPathRef.xsl"/>
	<xsl:include href="AddOnTable.xsl"/>
	<xsl:include href="IRS8933ScheduleAStyle.xsl"/>
	<xsl:output method="html" indent="yes"/>
	<xsl:strip-space elements="*"/>
	<xsl:param name="FormData" select="$RtnDoc/IRS8933ScheduleA"/>
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
				<meta name="Description" content="IRS Form 8933 Schedule A"/>
				<script language="JavaScript" src="{$ScriptPath}/FormDisplay.js" type="text/javascript"/>
				<xsl:call-template name="InitJS"/>
				<style type="text/css">
					<!--<xsl:if test="not($Print) or $Print=''">-->
					<xsl:call-template name="AddOnStyle"/>
					<xsl:call-template name="IRS8933ScheduleAStyle"/>
					<!--</xsl:if>-->
				</style>
				<xsl:call-template name="GlobalStylesForm"/>
			</head>
			<body class="styBodyClass">
				<form id="Form8933ScheduleA">
					<xsl:call-template name="DocumentHeader"/>
					<!-- Page 1 -->
					<!-- Header -->
					<div class="styBB" style="width:187mm;">
						<div class="styFNBox" style="width:30mm;height:26mm;border-right:2px solid black;">
							<span class="styFN" style="font-size:9pt;">Schedule A</span>
							<br/>
							<span class="styFN" style="font-size:8pt;">(Form 8933)</span>
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$FormData"/>
							</xsl:call-template>
							<br/> 
							(December 2024)
							<br/>
							<br/>
							<br/>
							<span class="styAgency" style="padding-top:0mm;">
								Department of the Treasury
								<br/>
								Internal Revenue Service
							</span>
						</div>
						<div class="styFTBox" style="width:124mm;height:22mm;">
							<span class="styFMT" style="font-size:13pt;padding-top:1mm;padding-bottom:1mm;">
								Disposal or Enhanced Oil Recovery Owner Certification<br/>
							</span>
							<br/>
							<br/>
							<span class="styBoldText" style="font-size:7.5pt;padding-top:2mm;">
								Attach to Form 8933. <br/>
								Go to <i>www.irs.gov/Form8933</i> for instructions and the latest information.
							</span>
						</div>
						<div class="styTYBox" style="width:32mm;height:26mm;text-align:center;padding-bottom:14mm;">
							<br/>
							<br/>
							<br/>OMB No. 1545-2132										
						  </div>
					</div>
					<!-- Filer information section -->
					<div class="styStdDiv" style="border-top:1px solid black;width:187mm;">
						<div class="styNameBox" style="width:133mm;">
							Name(s) shown on return<br/>
							<xsl:call-template name="PopulateReturnHeaderFiler">
								<xsl:with-param name="TargetNode">BusinessNameLine1Txt</xsl:with-param>
							</xsl:call-template>
							<br/>
							<xsl:call-template name="PopulateReturnHeaderFiler">
								<xsl:with-param name="TargetNode">BusinessNameLine2Txt</xsl:with-param>
							</xsl:call-template>
						</div>
						<div class="styEINBox" style="width:50mm;padding-left:0.5mm;font-weight:normal;">
							<span style="width:0.5mm;height:1mm;"/>
							<strong> Identifying number</strong>
							<br/>
							<span style="width:53mm;padding-left:1mm;">
								<xsl:call-template name="PopulateReturnHeaderFilerTIN">
									<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/EIN"/>
								</xsl:call-template>
							</span>
						</div>
					</div>
					<div class="styStdDiv" style="border-top:1px solid black;"/>
					<!-- Line A -->
					<div>
						<div class="styLNLeftNumBoxSD" style="padding-top:2mm;">A</div>
						<div class="styLNDesc" style="height:10mm;padding-top:2mm;width:125mm">
							Check if you are filing this as a:<br/>
							(i) <input class="styCkbox" type="checkbox" style="paddinng-right:2px;" alt="Geologic Disposal Site Ownr Ind Yes">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$FormData/GeologicDisposalSiteOwnrInd"/>
									<xsl:with-param name="BackupName">IRS8933SchAGeologicDisposalSiteOwnrInd</xsl:with-param>
								</xsl:call-template>
							</input>
							<span style="width:4px;"/>
							<label>
								<xsl:call-template name="PopulateLabel">
									<xsl:with-param name="TargetNode" select="$FormData/GeologicDisposalSiteOwnrInd"/>
									<xsl:with-param name="BackupName" select="IRS8936SchGeologicDisposalSiteOwnrInd"/>
								</xsl:call-template>
					 Geological disposal site owner	</label>
							<span style="width:18mm;"/>				
						 
					 (ii)	<input class="styCkbox" type="checkbox" style="margin-left:2px;" alt="Enhanced Oil Recovery Proj Ownr Ind No">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$FormData/EnhancedOilRecoveryProjOwnrInd"/>
									<xsl:with-param name="BackupName">IRS8936SchAEnhancedOilRecoveryProjOwnrInd</xsl:with-param>
								</xsl:call-template>
							</input>
							<span style="width:2px;"/>
							<label>
								<xsl:call-template name="PopulateLabel">
									<xsl:with-param name="TargetNode" select="$FormData/EnhancedOilRecoveryProjOwnrInd"/>
									<xsl:with-param name="BackupName" select="IRS8936SchAEnhancedOilRecoveryProjOwnrInd"/>
								</xsl:call-template>
							 Enhanced oil recovery project owner</label>
							<div class="styLNDesc" style="height:5mm;padding-top:2mm;width:167mm;"/>
						</div>
					</div>
					<!-- Part I -->
					<div class="styStdDiv" style="border-top:1px solid black;border-bottom:1px solid black;">
						<div class="styPartName">Part I</div>
						<div class="styPartDesc" style="width:167mm;height:auto;font-weight:normal;">
							<strong>Information About You, the Owner of the Geological Disposal Site, or the Enhanced Oil Recovery (EOR) <br/>Project</strong>
						</div>
					</div>
					<!--- Line 1 -->
					<div>
						<div class="styStDiv" style="border-top:2px ;width:187mm;">
							<div class="styNameBox" style="width:133mm;padding-left:2mm;height:10mm;">
								<span style="padding-left:1mm;">
									<strong>1 </strong>Name</span>
								<br/>
								<xsl:choose>
									<xsl:when test="$FormData/FacilityOwnerPersonNm">
										<span style="width:90mm;padding-left:4mm;">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="$FormData/FacilityOwnerPersonNm"/>
											</xsl:call-template>
										</span>
									</xsl:when>
									<xsl:otherwise>
										<div>
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="$FormData/FacilityOwnerBusinessName/BusinessNameLine1Txt"/>
											</xsl:call-template>
											<br/>
											<xsl:if test="$FormData/FacilityOwnerBusinessName/BusinessNameLine2Txt">
												<br/>
												<span style="border-bottom:1px solid black;width:100mm;padding-left:4mm;">
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="$FormData/FacilityOwnerBusinessName/BusinessNameLine2Txt"/>
													</xsl:call-template>
												</span>
											</xsl:if>
										</div>
									</xsl:otherwise>
								</xsl:choose>
							</div>							
                          <!-- Line 3 -->
							<div class="styEINBox" style="width:45mm;font-weight:normal;">
								<strong>3</strong>
								<span style="padding-left:2mm;"> Employer identification number (EIN)</span>
								<xsl:choose>
									<xsl:when test="$FormData/ FacilityOwnerSSN">
										<span style="width:12m;padding-left:4mm;">
											<xsl:call-template name="PopulateSSN">
												<xsl:with-param name="TargetNode" select="$FormData/ FacilityOwnerSSN"/>
											</xsl:call-template>
										</span>
									</xsl:when>
									<xsl:otherwise>
										<div>
									<span style="width:44mm;padding-left:4mm;">
												<xsl:call-template name="PopulateSSN">
													<xsl:with-param name="TargetNode" select="$FormData/ FacilityOwnerSSN"/>
												</xsl:call-template>
											</span>
											<br/>
											<xsl:if test="$FormData/ FacilityOwnerSSN">
												<br/>
												<span style="width:44mm;padding-left:4mm;">
													<xsl:call-template name="PopulateEIN">
														<xsl:with-param name="TargetNode" select="$FormData/ FacilityOwnerEIN"/>
													</xsl:call-template>
												</span>
											</xsl:if>
										</div>
									</xsl:otherwise>
								</xsl:choose>
							</div>
						</div>
					</div>					
					 <!-- Line 2 -->
					<div class="styStdDiv" style="border-top:1px solid black;">
						<div class="styLNLeftNumBoxSD" style="padding-top:2mm;">2</div>
						<div class="styLNDesc" style="height:8mm;padding-top:2mm;width:120mm">
							Address </div>
						<div class="styLNDesc" style="height:10mm;padding-top:.5mm;padding-left:2mm;">
							<xsl:call-template name="PopulateUSAddressTemplate">
								<xsl:with-param name="TargetNode" select="$FormData/ FacilityOwnerUSAddress"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Part II -->
					<div class="styStdDiv" style="border-top:1px solid black;border-bottom:.1px solid black;">
						<div class="styPartName">Part II</div>
						<div class="styPartDesc" style="width:167mm;height:3mm;">
							<strong>Information About Your Suppliers of Qualified Carbon Oxide</strong>
						</div>
						<div class="styPartDesc" style="width:167mm;height:auto;font-weight:normal;padding-left:.5mm;">
		                 Complete a separate Schedule A (Form 8933) for each of your suppliers of qualified carbon oxide.
						</div>
					</div>
					<div>
						<!--- Line 4 -->
						<div class="styStDiv" style="border-top:2px ;width:187mm;">
							<div class="styNameBox" style="width:133mm;padding-left:2mm;height:10mm;">
								<span>
									<strong>4</strong>   Name		</span>
								<div class="styLNDesc" style="height:8mm;padding-top:.5mm;padding-left:2mm;">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$FormData/SupplierName/BusinessNameLine1Txt"/>
									</xsl:call-template>
									<br/>
									<xsl:if test="$FormData/SupplierName/BusinessNameLine2Txt">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$FormData/SupplierName/BusinessNameLine2Txt"/>
										</xsl:call-template>
									</xsl:if>
								</div>
							</div>
							<!--- Line 5 -->
							<div class="styEINBox" style="width:45mm;padding-left:2mm;font-weight:normal;">
								<strong> 5 </strong> EIN 
							  <div class="styLNDesc" style="height:6mm;padding-top:.5mm;padding-left:2mm;">
									<xsl:call-template name="PopulateEIN">
										<xsl:with-param name="TargetNode" select="$FormData/SupplierEIN"/>
									</xsl:call-template>
								</div>
							</div>
						</div>
						<div class="styStdDiv" style="border-top:1px "/>
					</div>
					<div class="styStdDiv" style="border-top:1px solid black;"/>
					<!--- Line 6 -->
					<div class="styLNLeftNumBoxSD" style="padding-top:.5mm;">6</div>
					<div class="styLNDesc" style="height:8mm;padding-top:.5mm;width:160mm">
						Name and location (county and state) of facility (if supplier supplied any qualified carbon oxide) </div>
					<div class="styLNDesc" style="height:6mm;padding-top:.5mm;padding-left:2mm;">
						<xsl:call-template name="PopulateText">
							<xsl:with-param name="TargetNode" select="$FormData/FacilityNameAndLocationTxt"/>
						</xsl:call-template>
					</div>
					<div class="styStdDiv" style="border-top:.5px solid black;"/>
					<!--- Line 7 -->
					<div class="styLNLeftNumBoxSD" style="padding-top:.5mm;">7</div>
					<div class="styLNDesc" style="height:8mm;padding-top:.5mm;width:160mm">
			Type of industrial facility at which the supplier captured its qualified carbon oxide</div>
					<div class="styLNDesc" style="height:10mm;padding-top:.5mm;padding-left:.5mm;">
						<xsl:call-template name="PopulateText">
							<xsl:with-param name="TargetNode" select="$FormData/FacilityTypeDesc"/>
						</xsl:call-template>
						<div class="styStdDiv" style="border-top:.5px solid black;"/>
					</div>
					<!--- Line 8 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD">8</div>
						<div class="styLNDesc" style="width:170mm;font-weight:normal;height:12mm;">
							<span style="float:left">	Check here if you were one of the suppliers. Don’t check unless the EIN of the supplier of the qualified carbon oxide is the<br/>same as the EIN of the entity that’s an owner of the geological disposal site. If the EINs aren’t the same, there must be a<br/>binding written contract between the entities				
			<span class="sty8933SchADotLn">............................</span>
							</span>
						</div>
						<span style="float:right;padding-top:6mm;">
							<input class="styCkbox" type="checkbox" style="margin-left:3px;" alt="Supplier Exists Ind Yes">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$FormData/SupplierExistsInd"/>
									<xsl:with-param name="BackupName">IRS8933SchASupplierInd</xsl:with-param>
								</xsl:call-template>
							</input>
						</span>
					</div>
					<!--- Line 9 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD">9</div>
						<div class="styLNDesc" style="width:175mm;font-weight:normal;height:12mm;">
							<span style="float:left">	Unless line 8 is checked, do you attest that a binding written contract between you and the supplier exists<br/>that ensures that you will securely store the qualified carbon oxide in the manner required under section <br/>45Q and the underlying regulations? 							
				<span class="sty8933SchADotLn">......................</span>
							</span>
							<span style="float:right;padding-top:5mm;padding-left:6mm;">
								<input class="styCkbox" type="checkbox" style="margin-left:1px;" alt="ContractExists Ind Yes">
									<xsl:call-template name="PopulateYesCheckbox">
										<xsl:with-param name="TargetNode" select="$FormData/ContractExistsInd"/>
										<xsl:with-param name="BackupName">IRS8933SchAContractExistsInd</xsl:with-param>
									</xsl:call-template>
								</input>
								<span style="width:2px;"/>
								<label>
									<xsl:call-template name="PopulateLabelYes">
										<xsl:with-param name="TargetNode" select="$FormData/ContractExistsInd"/>
										<xsl:with-param name="BackupName" select="IRS8936SchAContractExistsInd"/>
									</xsl:call-template>
									<strong>Yes</strong>
								</label>
								<span style="padding-left:6mm;">
									<input class="styCkbox" type="checkbox" style="margin-left:1px;" alt="ContractExists Ind No">
										<xsl:call-template name="PopulateNoCheckbox">
											<xsl:with-param name="TargetNode" select="$FormData/ContractExistsInd"/>
											<xsl:with-param name="BackupName">IRS8936SchAContractExistsInd</xsl:with-param>
										</xsl:call-template>
									</input>
									<span style="width:2px;"/>
									<label>
										<xsl:call-template name="PopulateLabelNo">
											<xsl:with-param name="TargetNode" select="$FormData/ContractExistsInd"/>
											<xsl:with-param name="BackupName" select="IRS8936SchAContractExistsInd"/>
										</xsl:call-template>
										<strong>No</strong>
									</label>
								</span>
							</span>
						</div>
					</div>
					<!-- Line 10 -->
					<div class="styStdDiv" style="padding-top:1mm;">
						<div class="styLNLeftNumBox" style="">10</div>
						<div class="styLNDesc" style="height:10mm;width:138mm;">
						Provide the date (MM/DD/YYYY) of the contract referenced on line 9 or the date of the most recent
amendment<span class="sty8933SchADotLn" style=" float:right">..............................</span>
						</div>
						<span style=" float:right">
							<div class="styLNDesc" style="width:15mm;height:4mm;padding-bottom:6mm;border-bottom:1px solid black;margin-bottom:1px;text-align:center;">
								<xsl:call-template name="PopulateMonthDayYear">
									<xsl:with-param name="TargetNode" select="$FormData/ContractOrAmendmentDt"/>
								</xsl:call-template>
							</div>
						</span>
					</div>
					<!-- Line 11 -->
					<div class="styStdDiv" style="padding-top:3mm;">
						<div class="styLNLeftNumBox" style="padding-top:3mm;">11</div>
						<div class="styLNDesc" style="height:12mm;padding-top:3mm;width:135mm;">
						Metric tons of qualified carbon oxide received from the supplier during the calendar year (metric<br/>tons should agree with the figure reported for you for this supplier by the project’s operator on<br/>
Schedule B (Form 8933), Part III, line 10; or Schedule C (Form 8933), Part III, line 20)
							<span class="sty8933SchADotLn">......</span>
						</div>
						<div class="styLNRightNumBox" style="height:12mm;padding-top:8mm;">
							<strong>11</strong>
						</div>
						<div class="styLNAmountBox" style="height:12mm;padding-top:8mm;width:36mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/MtrcTonsQlfyCrbnOxdRcvdQty"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 12 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBox" style="padding-top:3mm;">12</div>
						<div class="styLNDesc" style="height:18mm;padding-top:3mm;width:135mm;">
							Metric tons of qualified carbon oxide received from the supplier and stored by you during the
<br/>calendar year (metric tons should agree with the figure reported for you for this supplier by the
<br/>disposal site’s operator on Schedule B (Form 8933), Part III, line 10; or Schedule C (Form 8933),
<br/>Part III, line 20) 

							<span class="sty8933SchADotLn">............................</span>
						</div>
						<div class="styLNRightNumBox" style="height:18mm;padding-top:12mm;">
							<strong>12</strong>
						</div>
						<div class="styLNAmountBox" style="height:18mm;padding-top:12mm;width:36mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/MtrcTonsQlfyCrbnOxdRcvdStorQty"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 13 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBox" style="padding-top:2mm;">13</div>
						<div class="styLNDesc" style="height:6mm;padding-top:2mm;width:135mm;">
						Metric tons of nonqualified carbon oxide received by you during the calendar year 
							<span class="sty8933SchADotLn">........</span>
						</div>
						<div class="styLNRightNumBox" style="height:6mm;padding-top:2mm;">
							<strong>13</strong>
						</div>
						<div class="styLNAmountBox" style="height:6mm;padding-top:2mm;width:36mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/MtrcTonsNonQlfyCrbnOxdRcvdQty"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 14 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBox" style="padding-top:2mm;">14</div>
						<div class="styLNDesc" style="height:12mm;padding-top:2mm;width:135mm;">
						Metric tons of nonqualified carbon oxide stored or utilized as a tertiary injectant stored by you
<br/>during the calendar year (metric tons should be from Schedule B (Form 8933), Part III, line 10; or
<br/>Schedule C (Form 8933), Part III, line 20)

							<span class="sty8933SchADotLn">....................</span>
						</div>
						<div class="styLNRightNumBox" style="height:12mm;padding-top:8mm;">
							<strong>14</strong>
						</div>
						<div class="styLNAmountBox" style="height:12mm;padding-top:8mm;width:36mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/MtrcTonsNonQlfyCrbnOxdStorQty"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 15 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBox" style="padding-top:3mm;">15</div>
						<div class="styLNDesc" style="height:12mm;padding-top:3mm;width:135mm;">
						Add lines 11 and 13. Total amount of qualified carbon oxide injected (amount should agree with
<br/>the figure reported for you on Schedule B (Form 8933), Part III, line 10; or Schedule C (Form 8933),
<br/>Part III, line 20) 	
						<span class="sty8933SchADotLn">...........................</span>
						</div>
						<div class="styLNRightNumBox" style="height:14mm;padding-top:10mm;">
							<strong>15</strong>
						</div>
						<div class="styLNAmountBox" style="height:14mm;padding-top:10mm;width:36mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TotMtrcTonsQlfyCrbnOxdRcvdQty"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 16 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBox" style="padding-top:3mm;">16</div>
						<div class="styLNDesc" style="height:14mm;padding-top:2mm;width:135mm;">
						Add lines 12 and 14. Total amount of qualified carbon oxide stored (amount should agree with the
<br/>figure reported for you on Schedule B (Form 8933), Part III, line 10; or Schedule C (Form 8933),
<br/>Part III, line 20) <span class="sty8933SchADotLn">............................</span>
						</div>
						<div class="styLNRightNumBox" style="height:12mm;padding-top:9mm;">
							<strong>16</strong>
						</div>
						<div class="styLNAmountBox" style="height:12mm;padding-top:9mm;width:36mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TotMtrcTonsQlfyCrbnOxdStorQty"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 17 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD" style="padding-left:1.5mm;">17</div>
						<div class="styLNDesc" style="width:178mm;height:8mm;">
							<span style="float:left;">Check here if you attest that the supplier of qualified carbon oxide elected to allow you to claim some or all of the carbon<br/>oxide sequestration credit attributable to their qualified carbon oxide. If you checked the box, attach Schedule E (Form 8933)   </span>
							<span style="padding-top:2mm;padding-left:14mm;">
								<input class="styCkbox" type="checkbox" style="margin-left:2px;" alt="TPElect Clm Crbn Oxd Sqstrtn Cr Ind Yes">
									<xsl:call-template name="PopulateCheckbox">
										<xsl:with-param name="TargetNode" select="$FormData/TPElectClmCrbnOxdSqstrtnCrInd"/>
										<xsl:with-param name="BackupName">IRS8933SchATPElectClmCrbnOxdSqstrtnCrInd</xsl:with-param>
									</xsl:call-template>
								</input>
							</span>
						</div>
					</div>
					<div class="styStdDiv" style="border-top:1px solid black;border-bottom:.5px solid black;"/>
					<div style="width:187mm;height:2mm;">
						<span class="styBoldText">For Paperwork Reduction Act Notice, see the Instructions for Form 8933. </span>
						<span style="width:25px;"/>          
						Cat. No. 94872G 					
					<span class="styBoldText" style="padding-left:5.5mm;">Schedule A (Form 8933) (12-2024)</span>
					</div>
					<br/>
					<br class="pageEnd"/>
					<!-- BEGIN Left Over Table -->
					<!-- Additonal Data Title Bar and Button -->
					<div class="styLeftOverTitleLine" id="LeftoverData">
						<div class="styLeftOverTitle">
							Additional Data        
						</div>
						<div class="styLeftOverButtonContainer">
							<input class="styLeftoverTableBtn" TabIndex="1" type="button" value="Return to Form" onclick="javascript:returnToWriteInImage();"/>
						</div>
					</div>
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
</xsl:stylesheet>