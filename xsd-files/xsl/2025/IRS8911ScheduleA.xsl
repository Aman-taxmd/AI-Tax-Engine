<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE xsl:stylesheet [
	<!ENTITY nbsp "&#160;"> 
]>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:include href="PopulateTemplate.xsl"/>
	<xsl:include href="AddHeader.xsl"/>
	<xsl:include href="CommonPathRef.xsl"/>
	<xsl:include href="AddOnTable.xsl"/>
	<xsl:include href="IRS8911ScheduleAStyle.xsl"/>
	<xsl:output method="html" indent="yes"/>
	<xsl:strip-space elements="*"/>
	<xsl:param name="FormData" select="$RtnDoc/IRS8911ScheduleA"/>
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
				<meta name="Description" content="IRS Form 8911 Schedule A"/>
				<script language="JavaScript" src="{$ScriptPath}/FormDisplay.js" type="text/javascript"/>
				<xsl:call-template name="InitJS"/>
				<style type="text/css">
					<xsl:if test="not($Print) or $Print=''">
						<xsl:call-template name="IRS8911ScheduleAStyle"/>
						<xsl:call-template name="AddOnStyle"/>
					</xsl:if>
				</style>
				<xsl:call-template name="GlobalStylesForm"/>
			</head>
			<body class="styBodyClass">
					<xsl:call-template name="DocumentHeader"/>
					<!-- Page 1 -->
					<!-- Header -->
					<div class="styStdDiv">
						<div class="styFNBox" style="width:30mm;height:20mm;border-right-width:1.5px;">
							<span class="styFN" style="font-size:9pt;">SCHEDULE A<br/>(Form 8911)</span>
							<br/>
							(December 2025)
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$FormData"/>
							</xsl:call-template>
							<br/>
							<span class="styAgency" style="padding-top:2.5mm;">
								Department of the Treasury
								Internal Revenue Service
							</span>
						</div>
						<div class="styFTBox" style="width:127mm;height:20mm;">
							<span class="styFMT" style="font-size:12pt;padding-top:1mm;">
								Alternative Fuel Vehicle Refueling Property
							</span>
							<span style="font-weight:bold;padding-top:4mm;">
								Attach to your tax return.
							</span>
							<span style="font-weight:bold;padding-top:1mm;">
								Go to
								<a style="text-decoration:none;color:black;" href="www.irs.gov/Form8911" ><i>www.irs.gov/Form8911</i></a>
								for instructions and the latest information.
							</span>
						</div>
						<div class="styTYBox" style="width:30mm;padding-top:4mm;height:10mm;border-left-width:1.5px;border-bottom-width:1px;">
							<div style="font-size:7pt;">
								<span style="width:6px;"/>OMB No. 1545-0123
							</div>
						</div>
						<div class="styTYBox" style="width:30mm;padding-top:2mm;height:10mm;border-left-width:1.5px;">
							<div style="font-size:7pt;text-align:left;">
								<span style="width:6px;"/>Attachment<br/>
								<span style="width:6px;"/>Sequence No.
								<span style="font-family:Arial;font-size:9pt;font-weight:bold;">151A</span>
							</div>
						</div>
					</div>
					<!-- End form title and Form number Section -->
					<div class="styStdDiv" style="border-top:1.5px solid black;border-bottom:1px solid black;">
						<div class="styNameBox" style="width:142mm;font-size:7pt;">
							Name(s) shown on return<br/>
							<xsl:call-template name="PopulateFilerName">
								<xsl:with-param name="TargetNode" select="$RtnHdrData"/>
							</xsl:call-template>
						</div>
						<div class="styEINBox" style="width:45mm;padding-left:0.5mm;font-size:7pt;">
							Identifying number<br/>
							<br/>
							<xsl:call-template name="PopulateReturnHeaderFilerTIN"/>
						</div>
					</div>
					<!-- Note -->
					<div class="styStdDiv" style="border-bottom:1px solid black;padding-top:0.5mm;padding-bottom:0.5mm;">
            <span style="font-weight:bold;">Note:</span> Complete a separate Schedule A (Form 8911) for each qualified alternative fuel vehicle refueling property placed in service
during the tax year. See instructions.
					</div>
					<!-- Part I -->
					<div class="styStdDiv" style="border-bottom:1px solid black;">
						<div class="styPartName">Part I</div>
						<div class="styPartDesc">
							Vehicle Refueling Property Details 
							<span style="font-weight:normal;">(see instructions)</span>
						</div>
					</div>
					<!-- Line 1 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD"> 1</div>
						<div class="styLNDesc" style="height:7mm;width:130mm;">
							If making an elective payment election or transfer election, enter the IRS-issued registration <br/> number for the refueling property					
							<span class="sty8911ScheduleADotLn">.....................</span>
						</div>
						<div class="sty8911ScheduleARightField" style="width:49mm;">
							<br/>
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/FacilityIRSIssdRegistrationNum"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 2a -->
					<div class="styStdDiv" style="margin-top:1mm;">
						<div class="styLNLeftNumBoxSD">2a</div>
						<div class="styLNDesc" style="width:42mm;height:auto;">Description of refueling property:</div>
						<span style="border-bottom:1px solid black;width:137mm;">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/FacilityDesc"/>
							</xsl:call-template>
						</span>
					</div>
					<!-- Line 2b -->
					<div class="styStdDiv" style="margin-top:1mm;">
						<div class="styLNLeftNumBoxSD" style="padding-left:4.2mm;"> b</div>
						<div class="styLNDesc" style="width:60mm;height:auto;">If different than filer, enter:  <span style="font-weight:bold;">(i)</span> Owner’s name:</div>
						<xsl:choose>
							<xsl:when test="$FormData/FacilityOwnerBusinessName">
								<span style="border-bottom:1px solid black;width:69mm;">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$FormData/FacilityOwnerBusinessName/BusinessNameLine1Txt"/>
									</xsl:call-template>
									<xsl:if test="$FormData/FacilityOwnerBusinessName/BusinessNameLine2Txt != ''">
										<br/>
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$FormData/FacilityOwnerBusinessName/BusinessNameLine2Txt"/>
										</xsl:call-template>
									</xsl:if>
								</span>
							</xsl:when>
							<xsl:when test="$FormData/FacilityOwnerPersonNm">
								<span style="border-bottom:1px solid black;width:69mm;">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$FormData/FacilityOwnerPersonNm"/>
									</xsl:call-template>
								</span>
							</xsl:when>
						</xsl:choose>
						<span style="padding-right:2mm;padding-left:6mm;vertical-align:top"> <span style="font-weight:bold;">(ii)</span> Owner's TIN:</span>
						<span class="sty8911ScheduleARightField" style="width:20mm;">
							<xsl:choose>
								<xsl:when test="$FormData/FacilityOwnerEIN">
									<xsl:call-template name="PopulateEIN">
										<xsl:with-param name="TargetNode" select="$FormData/FacilityOwnerEIN"/>
									</xsl:call-template>
								</xsl:when>
								<xsl:when test="$FormData/FacilityOwnerSSN">
									<xsl:call-template name="PopulateSSN">
										<xsl:with-param name="TargetNode" select="$FormData/FacilityOwnerSSN"/>
									</xsl:call-template>
								</xsl:when>
							</xsl:choose>
						</span>
					</div>
					<!-- Line 3 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD">3</div>
						<div class="styLNDesc">Location of refueling property.</div>
					</div>
					<!-- Line 3a -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD" style="padding-left:4.2mm;"> a</div>
						<div class="styLNDesc" style="width:30mm;">Address (if applicable):</div>
						<div class="styLNDesc" style="width:149mm;min-height:3.5mm;height:auto;border-bottom:1px solid black;margin-bottom:1px;">
							<xsl:call-template name="PopulateUSAddressTemplate">
								<xsl:with-param name="TargetNode" select="$FormData/FacilityUSAddress"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 3b -->
					<div class="styStdDiv" style="margin-top:1mm;">
						<div class="styLNLeftNumBoxSD" style="padding-left:4.2mm;height:2mm">b  </div>
						<div class="styLNDesc" style="width:25mm;">Coordinates. &nbsp;</div>
						<div class="styLNDesc" style="width:20mm;">
							<span style="font-weight:bold;">(i)  </span> Latitude: </div>
						<div class="styLNDesc" style="width:50mm;height:auto;">
							<div style="width:100%;border:1px solid black;text-align:center;">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$FormData/FacilityLatitudeNum"/>
								</xsl:call-template>
							</div>
							<span style="font-family:Arial Narrow;">Enter a "+" (plus) or "-" (minus) sign in the first box.</span>
						</div>
						<div class="styLNDesc" style="width:28mm;padding-left:5mm;">
							<span style="font-weight:bold;"> (ii) </span>   Longitude: </div>
						<div class="styLNDesc" style="width:50mm;height:auto;">
							<div style="width:100%;border:1px solid black;text-align:center;">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$FormData/FacilityLongitudeNum"/>
								</xsl:call-template>
							</div>
							<span style="font-family:Arial Narrow;">Enter a "+" (plus) or "-" (minus) sign in the first box.</span>
						</div>
					</div>
					<div class="styStdDiv" style="margin-top:1mm;"/>
					<!-- Line 4 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD">4</div>
						<div class="styLNDesc" style="width:53mm;height:4mm;">Date construction began (MM/DD/YYYY): </div>
						<div class="styLNDesc" style="width:60mm;height:4mm;border-bottom:1px solid black;margin-bottom:1px;text-align:center;">
							<xsl:call-template name="PopulateMonthDayYear">
								<xsl:with-param name="TargetNode" select="$FormData/FacilityConstructionStartDt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 5 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD">5</div>
						<div class="styLNDesc" style="width:53mm;height:4mm;">Date placed in service (MM/DD/YYYY): </div>
						<div class="styLNDesc" style="width:60mm;height:4mm;border-bottom:1px solid black;margin-bottom:1px;text-align:center;">
							<xsl:call-template name="PopulateMonthDayYear">
								<xsl:with-param name="TargetNode" select="$FormData/FacilityPlacedInServiceDt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 6 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD">6</div>
						<div class="styLNDesc">
								Eligible census tract determination.<br/>
						</div>
						<!-- Line 6a -->
						<div class="styStdDiv" style="margin-top:1mm;">
							<div class="styLNLeftNumBoxSD" style="padding-left:4.2mm;height:2mm">a  </div>
							<div class="styLNDesc">Was the refueling property placed in service in an eligible census tract? See instructions.</div>
							<br/>
						</div>
						<div class="styStdDiv" style="padding-bottom:0.5mm;">
							<span>
								<xsl:call-template name="PopulateSpan">
									<xsl:with-param name="TargetNode" select="$FormData/PlacedInSrvcEligCensusTractInd"/>
								</xsl:call-template>
							</span>
							<span>
								<span style="width:7mm;"/>
								<input type="checkbox" class="styCkbox" aria-label="refueling property in service before year yes">
									<xsl:call-template name="PopulateYesCheckbox">
										<xsl:with-param name="TargetNode" select="$FormData/PlacedInSrvcEligCensusTractInd"/>
										<xsl:with-param name="BackupName">IRS8911ScheduleAPlacedInServiceBfrSpcfdYrInd</xsl:with-param>
									</xsl:call-template>
								</input>
								<span style="width:2mm;"/>
								<b>Yes. </b>  Continue to line 6b.<br/>
								<!-- ++++++++++++++ No Checkbox +++++++++++++ -->
								<span style="width:7mm;"/>
								<input type="checkbox" class="styCkbox" aria-label="refueling property in service before year no">
									<xsl:call-template name="PopulateNoCheckbox">
										<xsl:with-param name="TargetNode" select="$FormData/PlacedInSrvcEligCensusTractInd"/>
										<xsl:with-param name="BackupName">IRS8911ScheduleAPlacedInServiceBfrSpcfdYrIndInd</xsl:with-param>
									</xsl:call-template>
								</input>
								<span style="width:2mm;"/>
								<b>No. Stop here.</b> Refueling property placed in service at the location described on line 3 does not qualify for this credit.<br/>
							</span>
						</div>
					</div>
					<!--Line  6b -->
					<div class="styStdDiv" style="height:4.5mm;">
						<div class="styLNLeftNumBoxSD" style="padding-left:4.2mm;">b  </div>
						<div class="styLNDesc" style="width:120mm;">
							Enter the 11-digit census tract GEOID pertaining to your refueling property. See instructions.
						</div>
						<div class="sty8911ScheduleARightBox">
              <xsl:call-template name="PopulateText">
                <xsl:with-param name="TargetNode" select="$FormData/CensusTractId2015GEOIDNum"/>
              </xsl:call-template>
            </div>
					</div>
					<!-- Line 7 -->
					<div class="styStdDiv" style="margin-bottom:1mm;">
						<div class="styLNLeftNumBoxSD"> 7</div>
						<div class="styLNDesc" style="height:8mm;width:130mm;">
							If applicable, enter the certification/permit number issued by government with jurisdiction over operation of refueling property						
							<span class="sty8911ScheduleADotLn" style="display:inline;">......................</span>
						</div>
						<div class="sty8911ScheduleARightField" style="width:49mm;">
							<br/>
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/FacilityIRSIssdRegistrationNum"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Part II -->
					<div class="styStdDiv" style="border-bottom:1px solid black;border-top:1px solid black;">
						<div class="styPartName">Part II</div>
						<div class="styPartDesc">
							Credit Amount for Business/Investment Use Part of Refueling Property
						</div>
					</div>
					<!-- Line 8 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD">8</div>
						<div class="styLNDesc" style="width:139mm;">
							Enter the cost of the qualified alternative fuel vehicle refueling property described above					
							<span class="sty8911ScheduleADotLn">......</span>
						</div>
						<div class="styLNRightNumBox">8</div>
						<div class="styLNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TotQlfyPropertyCostCreditAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 9 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD">9</div>
						<div class="styLNDesc" style="width:139mm;">
							Business/investment use percentage (see instructions)				
							<span class="sty8911ScheduleADotLn">.................</span>
						</div>
						<div class="styLNRightNumBox">9</div>
						<div class="styLNAmountBox">
							<xsl:call-template name="PopulatePercent">
								<xsl:with-param name="TargetNode" select="$FormData/BusinessInvestmentUsePct"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 10 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBox">10</div>
						<div class="styLNDesc" style="width:139mm;">
							Multiply line 8 by line 9. If the result is zero, enter -0-, skip lines 11 through 16, and go to line 17			
							<span class="sty8911ScheduleADotLn">...</span>
						</div>
						<div class="styLNRightNumBox">10</div>
						<div class="styLNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/BusinessInvestmentUseAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 11 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBox">11</div>
						<div class="styLNDesc" style="width:139mm;">
							Section 179 expense deduction (see instructions)				
							<span class="sty8911ScheduleADotLn">..................</span>
						</div>
						<div class="styLNRightNumBox">11</div>
						<div class="styLNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/Section179ExpenseDeductionAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 12 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBox">12</div>
						<div class="styLNDesc" style="width:139mm;">
							Subtract line 11 from line 10				
							<span class="sty8911ScheduleADotLn">.........................</span>
						</div>
						<div class="styLNRightNumBox">12</div>
						<div class="styLNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/NetBusinessUsePartAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 13 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBox">13</div>
						<div class="styLNDesc" style="width:139mm;">
							<span class="styGenericDiv" style="width:135mm;height:auto;">
								<span style="">
									Is the refueling property part of a qualified alternative fuel vehicle refueling project that meets the
									prevailing wage and apprenticeship requirements? See instructions. If construction began before
									January 29, 2023 (see line 4), skip the instructions and answer “Yes”
								<span style="padding-left:2mm;">
										<span class="sty8911ScheduleADotLn"> ......</span>
										<span>
                      <xsl:call-template name="PopulateSpan">
                        <xsl:with-param name="TargetNode" select="$FormData/PWARequirementMetInd"/>
                      </xsl:call-template>
										</span>
									</span>
									<span>
										<span style="width:1mm;"/>
										<input type="checkbox" class="styCkbox" aria-label="qualified alternative fuel vehicle refuleing project yes">
											<xsl:call-template name="PopulateYesCheckbox">
												<xsl:with-param name="TargetNode" select="$FormData/PWARequirementMetInd"/>
												<xsl:with-param name="BackupName">IRS8911ScheduleAPWARequirementMetInd</xsl:with-param>
											</xsl:call-template>
										</input>
										<span style="width:2mm;"/>
										<b>Yes </b>
										<!-- ++++++++++++++ No Checkbox +++++++++++++ -->
										<span style="width:4mm;"/>
										<input type="checkbox" class="styCkbox" aria-label="qualified alternative fuel vehicle refuleing project no">
											<xsl:call-template name="PopulateNoCheckbox">
												<xsl:with-param name="TargetNode" select="$FormData/PWARequirementMetInd"/>
												<xsl:with-param name="BackupName">IRS8911ScheduleAPWARequirementMetInd</xsl:with-param>
											</xsl:call-template>
										</input>
										<span style="width:2mm;"/>
										<b>No </b>
										<br/>
									</span>
								</span>
							</span>
						</div>
						<div class="styLNRightNumBoxNBB" style="height:12mm;background-color:lightgrey;">&nbsp;</div>
						<div class="styLNAmountBoxNBB" style="height:12mm;width:29mm;">&nbsp;</div>
					</div>
					<!-- Line 14 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBox">14</div>
						<div class="styLNDesc" style="width:139mm;">
							Multiply line 12 by 6% (0.06) (30% (0.30) if the answer on line 13 above is “Yes”)				
							<span class="sty8911ScheduleADotLn">........</span>
						</div>
						<div class="styLNRightNumBox">14</div>
						<div class="styLNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TotBusinessUsePartAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 15 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBox">15</div>
						<div class="styLNDesc" style="width:139mm;">
							Maximum business/investment use part of credit				
							<span class="sty8911ScheduleADotLn">...................</span>
						</div>
						<div class="styLNRightNumBox">15</div>
						<div class="styLNAmountBox">
						<i>$ 100,000</i>
						</div>
					</div>
					<!-- Line 16 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBox">16</div>
						<div class="styLNDesc" style="height:auto;width:139mm;">
						Enter the <span style="font-weight:bold">smaller</span> of line 14 or line 15. Include this credit amount on line 1 in Part I of Form 8911. If you<br/>
						 entered 100% on line 9 above, stop here. Otherwise, continue to line 17
						<span class="sty8911ScheduleADotLn">...........</span>
						</div>
						<div class="styLNRightNumBox" style="height:7mm;border-bottom:0;">
							<br/>16</div>
						<div class="styLNAmountBox" style="height:7mm;border-bottom:0;">
							<br/>
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/SmallerTotOrMaxBusUsePartAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Part III -->
					<div class="styStdDiv" style="border-bottom:1px solid black;border-top:1px solid black;">
						<div class="styPartName">Part III</div>
						<div class="styPartDesc">
							Credit Amount for Personal Use Part of Refueling Property
						</div>
					</div>
					<!-- Line 17 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBox">17</div>
						<div class="styLNDesc" style="width:139mm;">
							<span class="styGenericDiv" style="width:135mm;height:auto;">
								<span style="">
									Was the refueling property installed on property used as your main home?
									<br/>
									<span>
                    <xsl:call-template name="PopulateSpan">
										<xsl:with-param name="TargetNode" select="$FormData/PropertyUsedMainHomeInd"/>
									</xsl:call-template>
									</span>
									
									<span>
										<input type="checkbox" class="styCkbox" aria-label="refueling property installed at main home yes">
											<xsl:call-template name="PopulateYesCheckbox">
												<xsl:with-param name="TargetNode" select="$FormData/PropertyUsedMainHomeInd"/>
												<xsl:with-param name="BackupName">IRS8911ScheduleAPropertyUsedMainHomeInd</xsl:with-param>
											</xsl:call-template>
										</input>
										<span style="width:2mm;"/>
										<b>Yes. </b> Continue to line 18.<br/>
										<!-- ++++++++++++++ No Checkbox +++++++++++++ -->
										<input type="checkbox" class="styCkbox" aria-label="refueling property installed at main home no">
											<xsl:call-template name="PopulateNoCheckbox">
												<xsl:with-param name="TargetNode" select="$FormData/PropertyUsedMainHomeInd"/>
												<xsl:with-param name="BackupName">IRS8911ScheduleAEmissionsValueRcvdDOEIndInd</xsl:with-param>
											</xsl:call-template>
										</input>
										<span style="width:2mm;"/>
										<b>No.  Stop here. </b> Refueling property not installed on property used as your main home does not qualify<br/>
										<span style="width:6mm;"/> for the personal use part of the credit.
										<br/>
									</span>
								</span>
							</span>
						</div>
						<div class="styLNRightNumBoxNBB" style="height:16mm;background-color:lightgrey;"/>
						<div class="styLNAmountBoxNBB" style="height:16mm;width:29mm;"/>
					</div>
					<!-- Line 18 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBox">18</div>
						<div class="styLNDesc" style="width:139mm;">
							Subtract line 10 from line 8			
							<span class="sty8911ScheduleADotLn">.........................</span>
						</div>
						<div class="styLNRightNumBox">18</div>
						<div class="styLNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TotQlfyPropLessBusInvstUseAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 19 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBox">19</div>
						<div class="styLNDesc" style="width:139mm;">
							Multiply line 18 by 30% (0.30)				
							<span class="sty8911ScheduleADotLn">........................</span>
						</div>
						<div class="styLNRightNumBox">19</div>
						<div class="styLNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/AdjustedPersonalUsePartAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 20 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBox">20</div>
						<div class="styLNDesc" style="width:139mm;">
							Maximum personal use part of credit				
							<span class="sty8911ScheduleADotLn">......................</span>
						</div>
						<div class="styLNRightNumBox">20</div>
						<div class="styLNAmountBox">
						<i>$ 1,000</i>
						</div>
					</div>
					<!-- Line 21 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBox">21</div>
						<div class="styLNDesc" style="width:139mm;">
							Enter the <span style="font-weight:bold">smaller</span> of line 19 or line 20. Include this credit amount on line 4 in Part II of Form 8911			
							<span class="sty8911ScheduleADotLn">...</span>
						</div>
						<div class="styLNRightNumBox" style="border-bottom:0;">21</div>
						<div class="styLNAmountBox" style="border-bottom:0;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TotalPersonalUsePartOfCrAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- End of Page -->
					<div class="pageEnd" style="width:187mm;border-top:1.5px solid black;">
						<div style="float:left;clear:none;">
							<span class="styBoldText" style="width:97mm;">For Paperwork Reduction Act Notice, see the Form 8911 instructions. </span>
							<span style="width:40mm; text-align:center;">Cat. No. 94797A</span>
						</div>
						<div style="float:right;clear:none;">
							<span style="width:50mm;text-align:right;">
								<b>Schedule A (Form 8911) (12-2025)</b>
							</span>
						</div>
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
			</body>
		</html>
	</xsl:template>
</xsl:stylesheet>