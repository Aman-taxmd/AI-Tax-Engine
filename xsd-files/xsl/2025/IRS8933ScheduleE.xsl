<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE xsl:stylesheet [
	<!ENTITY nbsp "&#160;"> 
	<!ENTITY mdash "&#8211;"> 
]>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:include href="PopulateTemplate.xsl"/>
	<xsl:include href="AddHeader.xsl"/>
	<xsl:include href="CommonPathRef.xsl"/>
	<xsl:include href="AddOnTable.xsl"/>
	<xsl:include href="IRS8933ScheduleEStyle.xsl"/>
	<xsl:output method="html" indent="yes"/>
	<xsl:strip-space elements="*"/>
	<xsl:param name="FormData" select="$RtnDoc/IRS8933ScheduleE"/>
	
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
				<meta name="Description" content="IRS Form 8933 Schedule E"/>
				<script language="JavaScript" src="{$ScriptPath}/FormDisplay.js" type="text/javascript"/>
				<xsl:call-template name="InitJS"/>
				<style type="text/css">
					<xsl:if test="not($Print) or $Print=''">
						<xsl:call-template name="IRS8933ScheduleEStyle"/>
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
						<div class="styFNBox" style="width:30mm;height:22mm;border-right-width:1.5px;">
							<span class="styFN" style="font-size:9pt;">SCHEDULE E<br/>(Form 8933)</span>
							<br/>
							(Rev. December 2025)
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$FormData"/>
							</xsl:call-template>
							<br/>
							<span class="styAgency" style="padding-top:1.5mm;">
								Department of the Treasury
								Internal Revenue Service
							</span>
						</div>
						<div class="styFTBox" style="width:127mm;height:22mm;">
							<span class="styFMT" style="width:inherit;font-size:12pt;padding-top:1mm;">
								Election Certification
							</span>
							<span style="font-weight:bold;padding-top:4mm;">
								Attach to Form 8933.
							</span>
							<span style="font-weight:bold;padding-top:1mm;">
								Go to
								<a style="text-decoration:none;color:black;" href="www.irs.gov/Form8933" ><i>www.irs.gov/Form8933</i></a>
								for instructions and the latest information.
							</span>
						</div>
						<div class="styTYBox" style="width:30mm;padding-top:11mm;height:22mm;border-left-width:1.5px;">
							<div style="font-size:7pt;">
								<span style="width:6px;"/>OMB No. 1545-0123
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
					<!-- Part I -->
					<div class="styStdDiv" style="border: solid black; border-width:1px 0px 1px 0px;">
						<div class="styPartName">Part I</div>
						<div class="styPartDesc">
							Information About the Electing Taxpayer and the Credit Claimant
						</div>
					</div>
					<!-- Section 1 -->
          <div class="styGenericDiv" style="border: solid black; border-width:0px 0px 1px 0px;">
            <div class="styPartDesc" style="width:17mm;padding-left:0mm;">
							Section 1&mdash;
						</div>
						<span class="styBoldText" style="width:170mm;font-size: 8pt;">
              Electing taxpayer's information from Form 8933
						</span>
          </div>
				<!-- Section 1: Lines 1 and 2 -->
				<div class="styIRS8933SchEGenericDiv" style="height:10mm;">
					<!-- Line 1 -->
					<div class="styLNLeftNumBoxSD" style="height:inherit;">1</div>
					<div class="styLNDesc" style="width:115mm;padding-left:1mm;padding-right:1mm;height:auto">
              Name <br/>
						<xsl:choose>
							<xsl:when test="$FormData/FacilityOwnerPersonNm">
								<div>
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$FormData/FacilityOwnerPersonNm"/>
									</xsl:call-template>
								</div>
							</xsl:when>
							<xsl:when test="$FormData/FacilityOwnerBusinessName">
								<div>
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$FormData/FacilityOwnerBusinessName/BusinessNameLine1Txt"/>
									</xsl:call-template>
									<br/>
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$FormData/FacilityOwnerBusinessName/BusinessNameLine2Txt"/>
									</xsl:call-template>
								</div>
							</xsl:when>
						</xsl:choose>
					</div>
					<!-- Line 2 -->
					<div style="float:right;border: solid black;border-width: 0px 0px 0px 1px;height:inherit;width:64mm;padding-left:1mm;">
						<div class="styLNLeftNumBoxSD">2</div>
						<div class="styLNDesc" style="width:50mm;padding-right:1mm;">
                Taxpayer identification number (TIN) <br/>
							<xsl:choose>
								<xsl:when test="$FormData/FacilityOwnerSSN">
									<div>
										<xsl:call-template name="PopulateSSN">
											<xsl:with-param name="TargetNode" select="$FormData/FacilityOwnerSSN"/>
										</xsl:call-template>
									</div>
								</xsl:when>
								<xsl:when test="$FormData/FacilityOwnerEIN">
									<div>
										<xsl:call-template name="PopulateEIN">
											<xsl:with-param name="TargetNode" select="$FormData/FacilityOwnerEIN"/>
										</xsl:call-template>
									</div>
								</xsl:when>
							</xsl:choose>
						</div>
					</div>
				</div>
				<!-- Line 3 -->
				<div class="styIRS8933SchEGenericDiv">
					<div class="styLNLeftNumBoxSD">3</div>
					<div class="styLNDesc" style="padding-left:1mm;padding-right:1mm;height:auto;">
              Address <br/>
						<div>
							<xsl:choose>
								<xsl:when test="$FormData/FacilityOwnerUSAddress">
									<xsl:call-template name="PopulateUSAddressTemplate">
										<xsl:with-param name="TargetNode" select="$FormData/FacilityOwnerUSAddress"/>
									</xsl:call-template>
								</xsl:when>
								<xsl:when test="$FormData/FacilityOwnerForeignAddress">
									<xsl:call-template name="PopulateForeignAddressTemplate">
										<xsl:with-param name="TargetNode" select="$FormData/FacilityOwnerForeignAddress"/>
									</xsl:call-template>
								</xsl:when>
							</xsl:choose>
						</div>
					</div>
				</div>
				<!-- Section 1: Lines 4, 5, and 6 -->
				
				<div class="styIRS8933SchEGenericDiv" style="height:20mm;">
					<!-- Line 4 -->
				<div class="styIRS8933SchEBottmBB">
          <div class="styLNLeftNumBoxSD">4</div>
						<div class="styLNDesc" style="width:115mm;padding-left:1mm;padding-right:1mm;height:auto;">Location of capture facility <br/>
							<div>
								<xsl:call-template name="PopulateUSAddressTemplate">
									<xsl:with-param name="TargetNode" select="$FormData/FacilityUSAddress"/>
								</xsl:call-template>
							</div>
						</div>
					</div>
					<!-- Line 5 -->
					<div style="height:100%;width:64mm;float:right;">
						<div style="border: solid black;border-width: 0px 0px 0px 1px;height:100%;width:inherit;">
							<div class="styLNLeftNumBoxSD">5</div>
							<div class="styLNDesc" style="padding-left:1mm;padding-right:1mm;width:50mm;">Placed-in-service date of carbon capture equipment (see instructions)<br/>
								<div>
									<xsl:call-template name="PopulateMonthDayYear">
										<xsl:with-param name="TargetNode" select="$FormData/FacilityPlacedInServiceDt"/>
									</xsl:call-template>
								</div>
							</div>
						</div>
					</div>
					<!-- Line 6 -->
					<div style="float:left;border-top:1px solid black;">
						<div class="styLNLeftNumBoxSD">6</div>
						<div class="styLNDesc" style="padding-left:1mm;padding-right:1mm;width:115mm;">
                Type of industrial facility <br/>
							<div>
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$FormData/FacilityTypeDesc"/>
								</xsl:call-template>
							</div>
						</div>
					</div>
				</div>
				

				<!-- Section 1: Lines 7a and 7b -->
				<div class="styIRS8933SchEGenericDiv" style="height:10mm;">
					<!-- Line 7a -->
					<div style="height:inherit;width:93mm;">
						<div class="styLNLeftNumBoxSD" style="height:inherit;">7a</div>
						<div class="styLNDesc" style="width:77mm;padding-left:1mm;padding-right:1mm;">
                IRS-issued registration number for each facility where carbon oxide was captured
                <br/>
							<div>
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$FormData/FacilityIRSIssdRegistrationNum"/>
								</xsl:call-template>
							</div>
						</div>
					</div>
					<!-- Line 7b -->
					<div style="border: solid black;border-width: 0px 0px 0px 1px;height:inherit;width:93mm;">
						<div class="styLNLeftNumBoxSD">7b</div>
						<div class="styLNDesc" style="width:77mm;padding-left:1mm;padding-right:1mm;">
                EPA e-GGRT ID number(s), if available, of each facility where carbon oxide was captured
                <br/>
							<div>
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$FormData/FacilityEPAeGGRTIdNum"/>
								</xsl:call-template>
							</div>
						</div>
					</div>
				</div>
				<!-- Section 2 -->
				<div class="styGenericDiv styIRS8933SchEBottomBB">
					<div class="styPartDesc" style="width:17mm;padding-left:0mm;">
							Section 2&mdash;
						</div>
					<span class="styBoldText" style="width:170mm;font-size: 8pt;">
              Information about the credit claimant. Complete a separate Schedule E (Form 8933) for each credit claimant (see instructions).
						</span>
				</div>
				<!-- Section 2: Lines 8 and 9 -->
				<div class="styIRS8933SchEGenericDiv">
					<!-- Line 8 -->
					<div class="styLNLeftNumBoxSD" style="height:inherit;">8</div>
					<div class="styLNDesc" style="padding-left:1mm;padding-right:1mm;border: solid black;border-width: 0px 1px 0px 0px;height:auto;width:115mm;">
    Name <br/>
						<div>
							<xsl:choose>
                <xsl:when test="$FormData/ClaimantPersonNm">
                  <xsl:call-template name="PopulateText">
                    <xsl:with-param name="TargetNode" select="$FormData/ClaimantPersonNm"/>
                  </xsl:call-template>
                </xsl:when>
                <xsl:when test="$FormData/ClaimantBusinessName">
                  <xsl:call-template name="PopulateText">
                    <xsl:with-param name="TargetNode" select="$FormData/ClaimantBusinessName"/>
                  </xsl:call-template>
                </xsl:when>
                <xsl:otherwise/>
              </xsl:choose>
						</div>
					</div>
					<!-- Line 9 -->
					<div style="float:right;width:64mm;">
						<div class="styLNLeftNumBoxSD">9</div>
						<div class="styLNDesc" style="padding-left:1mm;padding-right:1mm;height:auto;width:50mm;">
      TIN <br/>
							<div>
								<xsl:choose>
                  <xsl:when test="$FormData/ClaimantSSN">
                    <xsl:call-template name="PopulateSSN">
                      <xsl:with-param name="TargetNode" select="$FormData/ClaimantSSN"/>
                    </xsl:call-template>
                  </xsl:when>
                  <xsl:when test="$FormData/ClaimantEIN">
                    <xsl:call-template name="PopulateEIN">
                      <xsl:with-param name="TargetNode" select="$FormData/ClaimantEIN"/>
                    </xsl:call-template>
                  </xsl:when>
                  <xsl:otherwise/>
                </xsl:choose>
							</div>
						</div>
					</div>
				</div>
				<!-- Line 10 -->
				<div class="styIRS8933SchEGenericDiv">
					<div class="styLNLeftNumBoxSD">10</div>
					<div class="styLNDesc" style="padding-left:1mm;padding-right:1mm;height:auto;">
              Address <br/>
						<div>
							<xsl:choose>
								<xsl:when test="$FormData/ClaimantUSAddress">
									<xsl:call-template name="PopulateUSAddressTemplate">
										<xsl:with-param name="TargetNode" select="$FormData/ClaimantUSAddress"/>
									</xsl:call-template>
								</xsl:when>
								<xsl:when test="$FormData/ClaimantForeignAddress">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/ClaimantForeignAddress"/>
									</xsl:call-template>
								</xsl:when>
							</xsl:choose>
						</div>
					</div>
				</div>
				<!-- Line 11 -->
				<div class="styGenericDiv" style="height:7mm;padding-bottom:0.5mm;">
					<div class="styLNLeftNumBoxSD">11</div>
					<div class="styLNDesc" style="width:158mm;padding-left:1mm;padding-right:1mm;">
              Do you attest that the credit claimant isn't a subcontractor? If you can't answer "Yes," you can't elect to allow the credit claimant to claim any of your credit <span class="styDotLn" style="float:none;margin-left:0.5mm;padding-right:1mm;">..........................</span>
					</div>
					<div style="margin-top:4mm;">
						<input type="checkbox" class="styCkboxNM" aria-label="Claimant not a subcontractor Yes">
							<xsl:call-template name="PopulateYesCheckbox">
								<xsl:with-param name="TargetNode" select="$FormData/AttestCrCImntNotSbcntrctInd"/>
								<xsl:with-param name="BackupName">IRS8933ScheduleEAttestCrCImntNotSbcntrctIndYes</xsl:with-param>
							</xsl:call-template>
						</input>
						<b style="margin-left:1mm;">Yes</b>
						<input type="checkbox" class="styCkboxNM" style="margin-left:4mm;" aria-label="Claimant not a subcontractor No">
							<xsl:call-template name="PopulateNoCheckbox">
								<xsl:with-param name="TargetNode" select="$FormData/AttestCrCImntNotSbcntrctInd
"/>
								<xsl:with-param name="BackupName">IRS8933ScheduleEAttestCrCImntNotSbcntrctIndNo</xsl:with-param>
							</xsl:call-template>
						</input>
						<b style="margin-left:1mm;">No</b>
					</div>
				</div>
				<!-- Line 12 -->
				<div class="styIRS8933SchEGenericDiv">
					<div class="styLNLeftNumBoxSD">12</div>
					<div class="styLNDesc" style="width:176.5mm;padding-left:1mm;padding-right:1mm;">
              Check which statement applies:
						</div>
					<!-- Line 12a -->
					<div style="padding-top:1mm;">
						<div class="styLNLeftLtrBoxDD" style="margin-left:1mm;">a</div>
						<input type="checkbox" class="styCkboxNM" style="margin-bottom:3mm;margin-top:0.5mm;" aria-label="Dispose Carbon Oxide Not Used">
							<xsl:call-template name="PopulateCheckbox">
								<xsl:with-param name="TargetNode" select="$FormData/DisposQlfyCrbnOxdNotUsedInd"/>
								<xsl:with-param name="BackupName">IRS8933ScheduleEDisposQlfyCrbnOxdNotUsedInd</xsl:with-param>
							</xsl:call-template>
						</input>
						<div style="width:174mm;">
							<span style="margin-left:1mm;">
                Credit claimant disposed of qualified carbon oxide in secure geological storage and didn't use it as a tertiary injectant in a qualified enhanced oil or natural gas recovery project, nor utilized it in a way described in section 45Q(f)(5).
                </span>
						</div>
					</div>
					<!-- Line 12b -->
					<div style="padding-top:1mm;">
						<div class="styLNLeftLtrBoxDD" style="margin-left:1mm;">b</div>
						<input type="checkbox" class="styCkboxNM" style="margin-bottom:3mm;margin-top:0.5mm;" aria-label="Dispose Carbon Oxide Used">
							<xsl:call-template name="PopulateCheckbox">
								<xsl:with-param name="TargetNode" select="$FormData/DisposQlfyCrbnOxdUsedInd"/>
								<xsl:with-param name="BackupName">IRS8933ScheduleEDisposQlfyCrbnOxdUsedInd</xsl:with-param>
							</xsl:call-template>
						</input>
						<div style="width:174mm;">
							<span style="margin-left:1mm;">
                Credit claimant disposed of qualified carbon oxide in secure geological storage and used it as a tertiary injectant in a qualified enhanced oil or natural gas recovery project.
                </span>
						</div>
					</div>
					<!-- Line 12c -->
					<div style="padding-top:1mm;">
						<div class="styLNLeftLtrBoxDD" style="margin-left:1mm;">c</div>
						<input type="checkbox" class="styCkboxNM" style="margin-top:0.5mm;" aria-label="Used Carbon Oxide in 45Q(f)(5)">
							<xsl:call-template name="PopulateCheckbox">
								<xsl:with-param name="TargetNode" select="$FormData/UtilizedtQlfyCrbnOxd45Qf5Ind"/>
								<xsl:with-param name="BackupName">IRS8933ScheduleEUtilizedtQlfyCrbnOxd45Qf5Ind</xsl:with-param>
							</xsl:call-template>
						</input>
						<div style="width:174mm;">
							<span style="margin-left:1mm;">
                Credit claimant utilized qualified carbon oxide in a way described in section 45Q(f)(5).
                </span>
						</div>
					</div>
				</div>
				<!-- Line 13 -->
				<div class="styIRS8933SchEGenericDiv">
					<div class="styLNLeftNumBoxSD">13</div>
					<div class="styLNDesc" style="padding-left:1mm;padding-right:1mm;height:auto;">
              Location of disposal site if box 12a or 12b was checked <br/>
						<div>
							<xsl:call-template name="PopulateUSAddressTemplate">
								<xsl:with-param name="TargetNode" select="$FormData/LocationAddressInUS"/>
							</xsl:call-template>
						</div>
					</div>
				</div>
				<!-- Section 1: Lines 14a and 14b -->
				<div class="styIRS8933SchEGenericDiv" style="height:10mm;">
					<!-- Line 14a -->
					<div style="height:inherit;width:93mm;">
						<div class="styLNLeftNumBoxSD" style="height:inherit;">14a</div>
						<div class="styLNDesc" style="width:77mm;padding-left:1.5mm;padding-right:1mm;">
                IRS-issued registration number for each disposal site if box 12a or 12b was checked
                <br/>
							<div>
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$FormData/DispSiteIRSIssdRegistrationNum"/>
								</xsl:call-template>
							</div>
						</div>
					</div>
					<!-- Line 14b -->
					<div style="border: solid black;border-width: 0px 0px 0px 1px;height:inherit;width:93mm;">
						<div class="styLNLeftNumBoxSD">14b</div>
						<div class="styLNDesc" style="width:77mm;padding-left:1.5mm;padding-right:1mm;">
                EPA e-GGRT ID number(s), if available, of each disposal site if box 12a or 12b was checked 
                <br/>
							<div>
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$FormData/DispSiteEPAeGGRTIdNum"/>
								</xsl:call-template>
							</div>
						</div>
					</div>
				</div>
				<!-- Line 15 -->
				<div class="styGenericDiv">
					<div class="styLNLeftNumBoxSD">15</div>
					<div class="styLNDesc" style="width:176.5mm;padding-left:1mm;padding-right:1mm;">
              Check which statement applies:
						</div>
					<!-- Line 15a -->
					<div style="padding-top:1mm;">
						<div class="styLNLeftLtrBoxDD" style="margin-left:1mm;">a</div>
						<input type="checkbox" class="styCkboxNM" style="margin-bottom:6mm;margin-top:0.5mm;" aria-label="Disposed and not injectant, recovery, or 45Q(f)(5)">
							<xsl:call-template name="PopulateCheckbox">
								<xsl:with-param name="TargetNode" select="$FormData/CrbnOxdOnAftrSpcfdDtINotUsednd"/>
								<xsl:with-param name="BackupName">IRS8933ScheduleECrbnOxdOnAftrSpcfdDtINotUsednd</xsl:with-param>
							</xsl:call-template>
						</input>
						<div style="width:174mm;">
							<span style="margin-left:1mm;">
                Qualified carbon oxide captured using carbon capture equipment originally placed in service at a facility on or after February 9, 2018, and before 2023, disposed of in secure geological storage, and not used as a tertiary injectant in a qualified enhanced oil or natural gas recovery project, nor utilized in a way described in section 45Q(f)(5).
                </span>
						</div>
					</div>
					<!-- Line 15b -->
					<div style="padding-top:1mm;">
						<div class="styLNLeftLtrBoxDD" style="margin-left:1mm;">b</div>
						<input type="checkbox" class="styCkboxNM" style="margin-bottom:6mm;margin-top:0.5mm;" aria-label="Disposed and injectant or recovery">
							<xsl:call-template name="PopulateCheckbox">
								<xsl:with-param name="TargetNode" select="$FormData/CrbnOxdOnAftrSpcfdDtUsedInd"/>
								<xsl:with-param name="BackupName">IRS8933ScheduleECrbnOxdOnAftrSpcfdDtUsedInd</xsl:with-param>
							</xsl:call-template>
						</input>
						<div style="width:174mm;">
							<span style="margin-left:1mm;">
                Qualified carbon oxide captured using carbon capture equipment originally placed in service at a facility on or after February 9, 2018, and before 2023, disposed of in secure geological storage, and used as a tertiary injectant in a qualified enhanced oil or natural gas recovery project.
                </span>
						</div>
					</div>
					<!-- Line 15c -->
					<div style="padding-top:1mm;">
						<div class="styLNLeftLtrBoxDD" style="margin-left:1mm;">c</div>
						<input type="checkbox" class="styCkboxNM" style="margin-bottom:3mm;margin-top:0.5mm;" aria-label="Utilized 45Q(f)(5)">
							<xsl:call-template name="PopulateCheckbox">
								<xsl:with-param name="TargetNode" select="$FormData/CrbnOxdOnAftrSpcfdDtUtlzInd"/>
								<xsl:with-param name="BackupName">IRS8933ScheduleECrbnOxdOnAftrSpcfdDtUtlzInd</xsl:with-param>
							</xsl:call-template>
						</input>
						<div style="width:174mm;">
							<span style="margin-left:1mm;">
                Qualified carbon oxide captured using carbon capture equipment originally placed in service at a facility on or after February 9, 2018, and before 2023, and utilized as described in section 45Q(f)(5).
                </span>
						</div>
					</div>
					<!-- Line 15d -->
					<div style="padding-top:1mm;">
						<div class="styLNLeftLtrBoxDD" style="margin-left:1mm;">d</div>
						<input type="checkbox" class="styCkboxNM" style="margin-bottom:9mm;margin-top:0.5mm;" aria-label="Carbon capture or DAC Disposed and not injectant, recovery, or 45Q(f)(5)">
							<xsl:call-template name="PopulateCheckbox">
								<xsl:with-param name="TargetNode" select="$FormData/CrbnOxdDACSpcfdDtNotUsedInd"/>
								<xsl:with-param name="BackupName">IRS8933ScheduleECrbnOxdDACSpcfdDtNotUsedInd</xsl:with-param>
							</xsl:call-template>
						</input>
						<div style="width:174mm;">
							<span style="margin-left:1mm;">
                Qualified carbon oxide captured using carbon capture equipment or a direct air capture (DAC) facility originally placed in service after 2022, during the 12-year period beginning on the date the equipment was originally placed in service, disposed of in secure geological storage, and not used as a tertiary injectant in a qualified enhanced oil or natural gas recovery project, nor utilized as described in section 45Q(f)(5).
                </span>
						</div>
					</div>
					<!-- Line 15e -->
					<div style="padding-top:1mm;">
						<div class="styLNLeftLtrBoxDD" style="margin-left:1mm;">e</div>
						<input type="checkbox" class="styCkboxNM" style="margin-bottom:6mm;margin-top:0.5mm;" aria-label="Carbon capture or DAC Disposed and injectant or recovery">
							<xsl:call-template name="PopulateCheckbox">
								<xsl:with-param name="TargetNode" select="$FormData/CrbnOxdDACAftrSpcfdDtUsedInd"/>
								<xsl:with-param name="BackupName">IRS8933ScheduleECrbnOxdDACAftrSpcfdDtUsedInd</xsl:with-param>
							</xsl:call-template>
						</input>
						<div style="width:174mm;">
							<span style="margin-left:1mm;">
                Qualified carbon oxide captured using carbon capture equipment or a DAC facility originally placed in service after 2022, during the 12-year period beginning on the date the equipment was originally placed in service, disposed of in secure geological storage, and used as a tertiary injectant in a qualified enhanced oil or natural gas recovery project.
                </span>
						</div>
					</div>
					<!-- Line 15f -->
					<div style="padding-top:1mm;">
						<div class="styLNLeftLtrBoxDD" style="margin-left:1mm;">f</div>
						<input type="checkbox" class="styCkboxNM" style="margin-bottom:3mm;margin-top:0.5mm;" aria-label="Carbon capture or DAC Utilized 45Q(f)(5)">
							<xsl:call-template name="PopulateCheckbox">
								<xsl:with-param name="TargetNode" select="$FormData/CrbnOxdDACAftrSpcfdDtUtlzInd"/>
								<xsl:with-param name="BackupName">IRS8933ScheduleECrbnOxdDACAftrSpcfdDtUtlzInd</xsl:with-param>
							</xsl:call-template>
						</input>
						<div style="width:174mm;">
							<span style="margin-left:1mm;">
                Qualified carbon oxide captured using carbon capture equipment or a DAC facility originally placed in service after 2022, during the 12-year period beginning on the date the equipment was originally placed in service, and utilized as described in section 45Q(f)(5).
                </span>
						</div>
					</div>
				</div>
				<!-- Line 16 -->
				<div class="styStdDiv styTBB" style="padding-top:1mm;">
					<div class="styLNLeftNumBoxSD">16</div>
					<input type="checkbox" class="styCkboxNM" style="margin-bottom:3mm;margin-top:0.5mm;margin-left:1mm;" aria-label="TODO">
						<xsl:call-template name="PopulateCheckbox">
							<xsl:with-param name="TargetNode" select="$FormData/ElectClaimCrRtEquipmentInd"/>
							<xsl:with-param name="BackupName">IRS8933ScheduleEElectClaimCrRtEquipmentInd</xsl:with-param>
						</xsl:call-template>
					</input>
					<div style="width:174mm;">
						<span style="margin-left:1mm;">
              If box 15a, 15b, or 15c was checked, check here if you elect to claim the credit rates for equipment placed in service prior to February 9, 2018.
              </span>
					</div>
				</div>
				<!-- Page 1 Footer -->
				<div class="styStdDiv pageEnd" style="padding-top:0.5mm">
					<span class="styBoldText">For Paperwork Reduction Act Notice, see the Instructions for Form 8933.</span>
					<span style="margin-left:8mm;font-size:6.5pt;">Cat. No. 94876Y</span>
					<span class="styBoldText" style="float:right;font-size:6.5pt;">Schedule E (Form 8933) (Rev. 12-2025)</span>
				</div>
				<!-- Page 2 -->
				<div class="styStdDiv styTBB">
					<span style="font-size:6.5pt;">Schedule E (Form 8933) (Rev. 12-2025)</span>
					<div style="float:right;">
						<span style="font-size:6.5pt;">Page</span>
						<span class="styBoldText" style="padding-left:1mm;">2</span>
					</div>
				</div>
				<!-- Part I (continued) -->
				<div class="styStdDiv" style="border: solid black; border-width:1px 0px 1px 0px;">
					<div class="styPartName">Part I</div>
					<div class="styPartDesc">
							Information About the Electing Taxpayer and the Credit Claimant
							<span class="styItalicText" style="font-weight:normal;">(continued)</span>
					</div>
				</div>
				<!-- Section 2 (continued) -->
				<div class="styGenericDiv styIRS8933SchEBottomBB">
					<div class="styPartDesc" style="width:17mm;padding-left:0mm;">
							Section 2&mdash;
						</div>
					<span class="styBoldText" style="width:170mm;font-size: 8pt;">
              Information about the credit claimant. Complete a separate Schedule E (Form 8933) for each credit claimant (see instructions).
              <span class="styItalicText" style="font-weight:normal;">(continued)</span>
					</span>
				</div>
				<!-- Line 17 -->
				<!-- If checkbox line descriptions change, ensure aria labels are updated to match. -->
				<div class="styGenericDiv">
					<div class="styLNLeftNumBoxSD">17</div>
					<div class="styLNDesc" style="width:176.5mm;padding-left:1mm;padding-right:1mm;">
              Check the applicable credit rate or dollar amount that applies to the year based on the boxes checked for lines 12, 15, and 16.
						</div>
					<!-- Line 17a -->
					<div style="padding-top:1mm;">
						<div class="styLNLeftLtrBoxDD" style="margin-left:1mm;">a</div>
						<input type="checkbox" class="styCkboxNM" style="margin-bottom:3mm;margin-top:0.5mm;" aria-label="$20 plus inflation">
							<xsl:call-template name="PopulateCheckbox">
								<xsl:with-param name="TargetNode" select="$FormData/SpcfdCrRt20InfltnOldEquipInd"/>
								<xsl:with-param name="BackupName">IRS8933ScheduleESpcfdCrRt20InfltnOldEquipInd</xsl:with-param>
							</xsl:call-template>
						</input>
						<div style="width:174mm;">
							<span style="margin-left:1mm;">
                $XX.XX ($20 plus inflation for old equipment), for tax year beginning in 2025. See instructions for the inflation-adjusted rates applicable in later tax years.
                </span>
						</div>
					</div>
					<!-- Line 17b -->
					<div style="padding-top:1mm;">
						<div class="styLNLeftLtrBoxDD" style="margin-left:1mm;">b</div>
						<input type="checkbox" class="styCkboxNM" style="margin-bottom:3mm;margin-top:0.5mm;" aria-label="$10 plus inflation">
							<xsl:call-template name="PopulateCheckbox">
								<xsl:with-param name="TargetNode" select="$FormData/SpcfdCrRt10InfltnOldEquipInd"/>
								<xsl:with-param name="BackupName">IRS8933ScheduleESpcfdCrRt10InfltnOldEquipInd</xsl:with-param>
							</xsl:call-template>
						</input>
						<div style="width:174mm;">
							<span style="margin-left:1mm;">
                $XX.XX ($10 plus inflation for old equipment), for tax year beginning in 2025. See instructions for the inflation-adjusted rates applicable in later tax years.
                </span>
						</div>
					</div>
					<!-- Line 17c -->
					<div style="padding-top:1mm;">
						<div class="styLNLeftLtrBoxDD" style="margin-left:1mm;">c</div>
						<input type="checkbox" class="styCkboxNM" style="margin-bottom:3mm;margin-top:0.5mm;" aria-label="$46.96 for new equipment and unused qualified carbon">
							<xsl:call-template name="PopulateCheckbox">
								<xsl:with-param name="TargetNode" select="$FormData/SpcfdDolNewEquipNotUsedEORInd"/>
								<xsl:with-param name="BackupName">IRS8933ScheduleESpcfdDolNewEquipNotUsedEORInd</xsl:with-param>
							</xsl:call-template>
						</input>
						<div style="width:174mm;">
							<span style="margin-left:1mm;">
                $46.96 for new equipment and qualified carbon oxide disposed of in secure storage and not used in EOR. See Notice 2018-93 for the applicable dollar amounts in later tax years.
                </span>
						</div>
					</div>
					<!-- Line 17d -->
					<div style="padding-top:1mm;">
						<div class="styLNLeftLtrBoxDD" style="margin-left:1mm;">d</div>
						<input type="checkbox" class="styCkboxNM" style="margin-bottom:3mm;margin-top:0.5mm;" aria-label="$32.54 for new equipment and used qualifed carbon">
							<xsl:call-template name="PopulateCheckbox">
								<xsl:with-param name="TargetNode" select="$FormData/SpcfdDolNewEquipUsedEORInd"/>
								<xsl:with-param name="BackupName">IRS8933ScheduleESpcfdDolNewEquipUsedEORInd</xsl:with-param>
							</xsl:call-template>
						</input>
						<div style="width:174mm;">
							<span style="margin-left:1mm;">
                $32.54 for new equipment and qualified carbon oxide disposed of in secure storage and used in EOR or utilized in a manner described in section 45Q(t)(5). See Notice 2018-93 for the applicable dollar amounts in later tax years.
                </span>
						</div>
					</div>
					<!-- Line 17e -->
					<div style="padding-top:1mm;">
						<div class="styLNLeftLtrBoxDD" style="margin-left:1mm;">e</div>
						<input type="checkbox" class="styCkboxNM" style="margin-top:0.5mm;" aria-label="$17 for equipment and unutilized disposed qualified carbon">
							<xsl:call-template name="PopulateCheckbox">
								<xsl:with-param name="TargetNode" select="$FormData/SpcfdDolEquipNotUsedEORInd"/>
								<xsl:with-param name="BackupName">IRS8933ScheduleESpcfdDolEquipNotUsedEORInd</xsl:with-param>
							</xsl:call-template>
						</input>
						<div style="width:174mm;">
							<span style="margin-left:1mm;">
                $17 for equipment placed in service after 2022 and qualified carbon oxide disposed of in secure storage and not used in EOR.
                </span>
						</div>
					</div>
					<!-- Line 17f -->
					<div style="padding-top:1mm;">
						<div class="styLNLeftLtrBoxDD" style="margin-left:1mm;">f</div>
						<input type="checkbox" class="styCkboxNM" style="margin-bottom:3mm;margin-top:0.5mm;" aria-label="$12 for equipment and utilized disposed qualified carbon ">
							<xsl:call-template name="PopulateCheckbox">
								<xsl:with-param name="TargetNode" select="$FormData/SpcfdDolEquipUsedEORInd"/>
								<xsl:with-param name="BackupName">IRS8933ScheduleESpcfdDolEquipUsedEORInd</xsl:with-param>
							</xsl:call-template>
						</input>
						<div style="width:174mm;">
							<span style="margin-left:1mm;">
                $12 for equipment placed in service after 2022 and qualified carbon oxide disposed of in secure storage and used in EOR or utilized in a manner described in section 45Q(t)(5).
                </span>
						</div>
					</div>
					<!-- Line 17g -->
					<div style="padding-top:1mm;">
						<div class="styLNLeftLtrBoxDD" style="margin-left:1mm;">g</div>
						<input type="checkbox" class="styCkboxNM" style="margin-top:0.5mm;" aria-label="$36 for DAC and unutilized disposed carbon">
							<xsl:call-template name="PopulateCheckbox">
								<xsl:with-param name="TargetNode" select="$FormData/SpcfdDolDACEquipNotUsedEORInd"/>
								<xsl:with-param name="BackupName">IRS8933ScheduleESpcfdDolDACEquipNotUsedEORInd</xsl:with-param>
							</xsl:call-template>
						</input>
						<div style="width:174mm;">
							<span style="margin-left:1mm;">
                $36 for DAC equipment placed in service after 2022 and qualified carbon oxide disposed of in secure storage and not used in EOR.
                </span>
						</div>
					</div>
					<!-- Line 17h -->
					<div style="padding-top:1mm;margin-bottom:1mm;">
						<div class="styLNLeftLtrBoxDD" style="margin-left:1mm;">h</div>
						<input type="checkbox" class="styCkboxNM" style="margin-bottom:3mm;margin-top:0.5mm;" aria-label="$26 for DAC equipment and utilized disposed carbon">
							<xsl:call-template name="PopulateCheckbox">
								<xsl:with-param name="TargetNode" select="$FormData/SpcfdDolDACEquipUsedEORInd"/>
								<xsl:with-param name="BackupName">IRS8933ScheduleESpcfdDolDACEquipUsedEORInd</xsl:with-param>
							</xsl:call-template>
						</input>
						<div style="width:174mm;">
							<span style="margin-left:1mm;">
                $26 for DAC equipment placed in service after 2022 and qualified carbon oxide disposed of in secure storage and used in EOR or utilized in a manner described in section 45Q(t)(5).
                </span>
						</div>
					</div>
				</div>
				<!-- Part II -->
				<div class="styStdDiv" style="border: solid black; border-width:1px 0px 1px 0px;">
					<div class="styPartName">Part II</div>
					<div class="styPartDesc">
							Election Information
						</div>
				</div>
				<!-- Part II Line 1 -->
				<div class="styGenericDiv" style="height:13mm;">
					<div class="styLNLeftNumBoxSD">1</div>
					<div class="styLNDesc" style="padding-right:1mm;height:auto;width:135mm;">
              If Part I, box 12a was checked, metric tons of qualified carbon oxide captured by the electing taxpayer and disposed of in secure geological storage by the credit claimant and not used as a tertiary injectant in a qualified enhanced oil or natural gas recovery project, nor utilized in a way described in section 45Q(t)(5) (metric tons should agree with the amount on Schedule A (Form 8933), line 12)
              <span class="styDotLn" style="float:none;margin-left:0.5mm;padding-right:1mm;">.......</span>
					</div>
					<div class="styLNRightNumBox" style="height:inherit;display:flex;align-items:flex-end;justify-content:center;">1&nbsp;</div>
					<div class="styLNAmountBox" style="height:inherit;display:flex;align-items:flex-end;justify-content:flex-end;width:36mm;color:darkblue;">
						<xsl:call-template name="PopulateText">
							<xsl:with-param name="TargetNode" select="$FormData/MtrcTonsCrClmntNotUsedUtlzQty"/>
						</xsl:call-template>
					</div>
				</div>
				<!-- Part II Line 2 -->
				<div class="styGenericDiv" style="height:13mm;">
					<div class="styLNLeftNumBoxSD">2</div>
					<div class="styLNDesc" style="padding-right:1mm;height:auto;width:135mm;">
              If Part I, box 12b was checked, metric tons of qualified carbon oxide captured by the electing taxpayer and disposed of in secure geological storage by the credit claimant and used as a tertiary injectant in a qualified enhanced oil or natural gas recovery project (metric tons should agree with the amount on Schedule A (Form 8933), line 12)
              <span class="styDotLn" style="float:none;margin-left:0.5mm;padding-right:1mm;">......................</span>
					</div>
					<div class="styLNRightNumBox" style="height:inherit;display:flex;align-items:flex-end;justify-content:center;">2&nbsp;</div>
					<div class="styLNAmountBox" style="height:inherit;display:flex;align-items:flex-end;justify-content:flex-end;width:36mm;color:darkblue;">
						<xsl:call-template name="PopulateText">
							<xsl:with-param name="TargetNode" select="$FormData/MtrcTonsCrClmntUsedQty"/>
						</xsl:call-template>
					</div>
				</div>
				<!-- Part II Line 3 -->
				<div class="styGenericDiv" style="height:11mm;">
					<div class="styLNLeftNumBoxSD">3</div>
					<div class="styLNDesc" style="padding-right:1mm;height:auto;width:135mm;">
              If Part I, box 12c was checked, metric tons of the electing taxpayer's qualified carbon oxide, expressed as carbon dioxide equivalent, utilized in the credit claimant's facility, and determined by an LCA (metric tons should agree with the amount in Schedule F (Form 8933), Part III, line 12)
              <span class="styDotLn" style="float:none;margin-left:0.5mm;padding-right:1mm;">.........</span>
					</div>
					<div class="styLNRightNumBox" style="height:inherit;display:flex;align-items:flex-end;justify-content:center;">3&nbsp;</div>
					<div class="styLNAmountBox" style="height:inherit;display:flex;align-items:flex-end;justify-content:right;width:36mm;color:darkblue;">
						<xsl:call-template name="PopulateText">
							<xsl:with-param name="TargetNode" select="$FormData/MtrcTonsCrClmntFcltyLCAQty"/>
						</xsl:call-template>
					</div>
				</div>
				<!-- Part II Line 4 -->
				<div class="styGenericDiv" style="height:10mm;">
					<div class="styLNLeftNumBoxSD">4</div>
					<div class="styLNDesc" style="padding-right:1mm;height:auto;width:135mm;">
              Metric tons of qualified carbon oxide listed on line 1, 2, or 3, allowed by the electing taxpayer to be claimed by the credit claimant. Based upon the box checked in Part I, line 15, electing taxpayer adds this amount to Form 8933, Part III, line 1e, 2e, or 3e
              <span class="styDotLn" style="float:none;margin-left:0.5mm;padding-right:1mm;">.................</span>
					</div>
					<div class="styLNRightNumBox" style="height:inherit;display:flex;align-items:flex-end;justify-content:center;">4&nbsp;</div>
					<div class="styLNAmountBox" style="height:inherit;display:flex;align-items:flex-end;justify-content:flex-end;width:36mm;color:darkblue;">
						<xsl:call-template name="PopulateText">
							<xsl:with-param name="TargetNode" select="$FormData/TotMtrcTonsClmCrClmntQty"/>
						</xsl:call-template>
					</div>
				</div>
				<!-- Part II Line 5 -->
				<div class="styGenericDiv" style="height:5mm;">
					<div class="styLNLeftNumBoxSD">5</div>
					<div class="styLNDesc" style="padding-right:1mm;height:auto;width:135mm;">
              Credit rate from Part I, line 17
              <span class="styDotLn" style="float:none;margin-left:0.5mm;padding-right:1mm;">.......................</span>
					</div>
					<div class="styLNRightNumBox" style="height:inherit;display:flex;align-items:flex-end;justify-content:center;">5&nbsp;</div>
					<div class="styLNAmountBox" style="height:inherit;display:flex;align-items:flex-end;justify-content:flex-end;width:36mm;">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/CreditRateAmt"/>
						</xsl:call-template>
					</div>
				</div>
				<!-- Part II Line 6 -->
				<div class="styGenericDiv" style="height:9mm;">
					<div class="styLNLeftNumBoxSD">6</div>
					<div class="styLNDesc" style="padding-right:1mm;height:auto;width:135mm;">
              Carbon oxide sequestration credit allowed by the electing taxpayer to be claimed by the credit claimant. Multiply line 4 by line 5. Credit claimant adds this amount to its Form 8933, Part III, line 7
              <span class="styDotLn" style="float:none;margin-left:0.5mm;">....</span>
					</div>
					<div class="styLNRightNumBox" style="height:inherit;display:flex;align-items:flex-end;justify-content:center;">6&nbsp;</div>
					<div class="styLNAmountBox" style="height:inherit;display:flex;align-items:flex-end;justify-content:flex-end;width:36mm;">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/COSCAllwClmCrClmntAmt"/>
						</xsl:call-template>
					</div>
				</div>
				<!-- Part II Line 7 -->
				<div class="styGenericDiv" style="height:9mm;">
					<div class="styLNLeftNumBoxSD">7</div>
					<div class="styLNDesc" style="padding-right:1mm;height:auto;width:135mm;">
              Metric tons of qualified carbon oxide not allowed by the electing taxpayer to be claimed by the credit claimant. Subtract line 4 from amount listed on line 1, 2, or 3
              <span class="styDotLn" style="float:none;margin-left:0.5mm;padding-right:1mm;">.............</span>
					</div>
					<div class="styLNRightNumBox" style="height:inherit;display:flex;align-items:flex-end;justify-content:center;">7&nbsp;</div>
					<div class="styLNAmountBox" style="height:inherit;display:flex;align-items:flex-end;justify-content:flex-end;width:36mm;color:darkblue;">
						<xsl:call-template name="PopulateText">
							<xsl:with-param name="TargetNode" select="$FormData/MtrcTonsNotAllwClmCrClmntQty"/>
						</xsl:call-template>
					</div>
				</div>
				<!-- Part II Line 8 -->
				<div class="styGenericDiv styTBB" style="height:5mm;">
					<div class="styLNLeftNumBoxSD">8</div>
					<div class="styLNDesc" style="padding-right:1mm;height:auto;width:135mm;">
              Multiply line 7 by line 5. Carbon oxide sequestration credit retained by the electing taxpayer
              <span class="styDotLn" style="float:none;margin-left:0.5mm;padding-right:1mm;">....</span>
					</div>
					<div class="styLNRightNumBox" style="height:inherit;display:flex;align-items:flex-end;justify-content:center;">8&nbsp;</div>
					<div class="styLNAmountBox" style="height:inherit;display:flex;align-items:flex-end;justify-content:flex-end;width:36mm;">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/COSCRetainedAmt"/>
						</xsl:call-template>
					</div>
				</div>
				<!-- Page 2 Footer -->
				<div class="styStdDiv pageEnd" style="padding-top:0.5mm">
					<span class="styBoldText" style="float:right;font-size:6.5pt;">Schedule E (Form 8933) (Rev. 12-2025)</span>
				</div>
				
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
			</body>
		</html>
	</xsl:template>
</xsl:stylesheet>