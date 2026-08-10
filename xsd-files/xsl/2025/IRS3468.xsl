<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:include href="PopulateTemplate.xsl"/>
	<xsl:include href="CommonPathRef.xsl"/>
	<xsl:include href="AddHeader.xsl"/>
	<xsl:include href="AddOnTable.xsl"/>
	<xsl:include href="IRS3468Style.xsl"/>
	<xsl:output method="html" indent="yes"/>
	<xsl:strip-space elements="*"/>
	<!--  Defines the stage of the data, e.g. original or latest -->
	<xsl:param name="Form3468Data" select="$RtnDoc/IRS3468"/>
	<xsl:template match="/">
		<xsl:text disable-output-escaping="yes">&lt;!DOCTYPE html&gt;</xsl:text>
		<html>
			<head>
				<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
				<title>
					<xsl:call-template name="FormTitle">
						<xsl:with-param name="RootElement" select="local-name($Form3468Data)"/>
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
				<meta name="Description" content="IRS Form 3468"/>
				<script language="JavaScript" src="{$ScriptPath}/FormDisplay.js" type="text/javascript"/>
				<xsl:call-template name="InitJS"/>
				<style type="text/css">
					<xsl:if test="not($Print) or $Print=''">
						<xsl:call-template name="IRS3468Style"/>
						<xsl:call-template name="AddOnStyle"/>
					</xsl:if>
				</style>
				<xsl:call-template name="GlobalStylesForm"/>
			</head>
			<body class="styBodyClass">
				<form name="Form3468">
					<xsl:call-template name="DocumentHeader"/>
					<!-- Begin Form Number and Name -->
					<div class="styTBB" style="width:187mm;height:24mm;">
						<div class="styFNBox" style="width:30mm;">
							<div style="height:13.5mm;">Form 
								<span class="styFormNumber">3468</span>
								<div style="height:0mm;float:left">
									<xsl:call-template name="SetFormLinkInline">
										<xsl:with-param name="TargetNode" select="$Form3468Data"/>
									</xsl:call-template>
								</div>
							</div>
							<div style="height:10mm;font-family:arial;font-size:7pt">
								<div class="styAgency">Department of the Treasury</div>
								<span class="styAgency">Internal Revenue Service</span>
								<span class="styAgency" style="padding-left:0mm;">(99)</span>
							</div>
						</div>
						<div class="styFTBox" style="width:113mm;height:20mm;padding-top:1mm;">
							<div class="styMainTitle" style="height:5mm;">Investment Credit
							</div>
							<br/>
							<div class="styFBT" style="padding-top:0mm;"> Attach to your tax return. 
							</div>
							<div class="styFBT" style="padding-top:0mm;">
							 Go to <a style="text-decoration:none;color:black;"  href="http://www.irs.gov/Form3468" 
							 title="Link to IRS.gov"><i>www.IRS.gov/Form3468</i></a> for instructions and the latest 
							 information.
							</div>							
						</div>
						<div class="styTYBox" style="width:38mm;height:24mm;">
							<div class="styOMB" style="">OMB No. 1545-0155</div>
							<div style="text-align:left;padding-left:10mm;padding-top:1mm">
								<div class="styTY" style="height:9.5mm;">20<span class="styTYColor">25</span>
								</div>
								<div style="padding-top:0mm;">	
                                   Attachment<br/>
                                   Sequence No.<span class="styBoldText">174</span>
								</div>
							</div>
						</div>
					</div>
					<!-- End Form Number and Name section -->
					<!-- Begin Names and Identifying number section -->
					<div class="styBB" style="width:187mm;">
						<div class="styNameBox" style="width:146mm;height:9mm;font-size:7pt;font-weight:normal;">
						     Name(s) shown on return<br/>
							<span>
							  <xsl:choose>
								<!--Business Name from F1120 Return Header-->
								<xsl:when test="$RtnHdrData/Filer/BusinessName">
								  <xsl:call-template name="PopulateReturnHeaderFiler">
										<xsl:with-param name="TargetNode">BusinessNameLine1Txt</xsl:with-param>
								  </xsl:call-template>
								  <br/>
								  <xsl:call-template name="PopulateReturnHeaderFiler">
										<xsl:with-param name="TargetNode">BusinessNameLine2Txt</xsl:with-param>
								  </xsl:call-template>
								</xsl:when>
								<!--Individual Name from F1040/NR Return Header-->
								<xsl:when test="$RtnHdrData/Filer/NameLine1Txt">
								<br/>
								  <xsl:call-template name="PopulateReturnHeaderFiler">
										<xsl:with-param name="TargetNode">NameLine1Txt</xsl:with-param>
								  </xsl:call-template>
								</xsl:when>
								<!--Business Name from F1041 Return Header-->
								<xsl:when test="$RtnHdrData/Filer/EstateOrTrustName/BusinessNameLine1Txt">
								  <xsl:call-template name="PopulateReturnHeaderFiler">
										<xsl:with-param name="TargetNode">BusinessNameLine1Txt</xsl:with-param>
								  </xsl:call-template>
								  <br/>
								  <xsl:call-template name="PopulateReturnHeaderFiler">
										<xsl:with-param name="TargetNode">BusinessNameLine2Txt</xsl:with-param>
								  </xsl:call-template>            
								</xsl:when>
								<!--National Morgage Association Code from F1041 Return Header-->
								<xsl:when test="$RtnHdrData/Filer/NationalMortgageAssocCd">
								  <br/>
								  <xsl:call-template name="PopulateReturnHeaderFiler">
										<xsl:with-param name="TargetNode">NationalMortgageAssocCd</xsl:with-param>
								  </xsl:call-template>
								</xsl:when>
							  </xsl:choose>
							</span>
						</div>
						<div class="styEINBox" style="width:30mm;height:9mm;font-size:7pt;font-weight:bold;
						 padding-left:2mm;">
						  Identifying number<br/>
							<br/>
							<span style="width:25mm;text-align:left;font-size:7pt;font-weight:normal;">
								<xsl:choose>
							  <!-- This process changed 170509 by gdy per UWR 164393 -->
								  <xsl:when test="$RtnHdrData/Filer/PrimarySSN">
									 <xsl:call-template name="PopulateReturnHeaderFiler">
										<xsl:with-param name="TargetNode">PrimarySSN</xsl:with-param>
									 </xsl:call-template>
								  </xsl:when>
								  <xsl:when test="$RtnHdrData/Filer/SSN">
									 <xsl:call-template name="PopulateReturnHeaderFiler">
										<xsl:with-param name="TargetNode">SSN</xsl:with-param>
									 </xsl:call-template>
								  </xsl:when>
								  <xsl:when test="$RtnHdrData/Filer/EIN">
									 <xsl:call-template name="PopulateReturnHeaderFiler">
										<xsl:with-param name="TargetNode">EIN</xsl:with-param>
									 </xsl:call-template>
								  </xsl:when>
								  <xsl:otherwise>
								  </xsl:otherwise>
								</xsl:choose>
							</span>
						</div>
					</div>
					<!-- Start of Part I -->
					<div class="styBB" style="width:187mm">
						<div class="styPartName" style="width:13mm;height:5mm;font-size:8pt">Part I</div>
						<div class="styPartDesc" 
						 style="width:150mm;height:auto;font-weight:normal;font-size:9pt;padding-top:1mm">
					      <b>Information on Qualified Property or Qualified Facility</b> (see instructions)
					      </div>
					</div>
					<div class="styBB" style="width:187mm;">
						<!-- Line 1 -->
						<div style="width:187mm;">
							<div class="styLNLeftNumBox" style="height:4mm;padding-left:2mm">1</div>
							<div class="styLNDesc" style="width:155mm;height:4mm;">
                             If making an elective payment election or transfer election, enter the IRS-issued registration
                              number for the facility
								<!--Dotted Line-->
								<span class="styDotLn" 
								 style="float:none;padding-left:2mm">..
								</span>
							</div>
							<span class="styUnderlineAmount" style="float:left; width:20mm;border-bottom-width:1px;
							 text-align:left;height:4mm;padding-top:.5mm;">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$Form3468Data/FacilityIRSIssdRegistrationNum"/>
								</xsl:call-template>
							</span>
						</div>
						<!-- Line 2a(i) -->
						<div style="width:187mm;">
							<div class="styLNLeftNumBox" style="height:4mm;padding-left:2mm">2a</div>
							<div class="styLNDesc" style="width:140mm;height:4mm;">
                             <b>(i)</b> Enter the facility’s emissions value or rate (kg of CO2e per kg of qualified clean
                              hydrogen):
								<!--Dotted Line-->
								<span class="styDotLn" 
								 style="float:none;padding-left:2mm">....
								</span>
							</div>
							<span class="styUnderlineAmount" style="float:left; width:36mm;border-bottom-width:1px;
							 text-align:left;height:4mm;padding-top:.5mm">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$Form3468Data/FacilityEmissionsValueOrRt"/>
								</xsl:call-template>
							</span>
						</div>
						<!-- Line 2a(ii) -->
						<div style="width:187mm;">
							<div class="styLNLeftNumBox" style="height:4mm;padding-left:2mm"></div>
							<div class="styLNDesc" style="width:140mm;height:4mm;">
                             <b>(ii)</b> Enter the Department of Energy (DOE) control number, if applicable (see
                              instructions):							 
								<!--Dotted Line-->
								<span class="styDotLn"
								 style="float:none;padding-left:2mm">.....
								</span>
							</div>
							<span class="styUnderlineAmount" style="float:left; width:35mm;border-bottom-width:1px;
							 text-align:left;height:4mm;padding-top:.5mm">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$Form3468Data/DOEControlNum"/>
								</xsl:call-template>
							</span>
						</div>
						<!-- Line 2b -->
						<div style="width:177mm;">
							<div class="styLNLeftNumBox" style="height:4mm;padding-left: 4mm">
							 b
							</div>
							<div class="styLNDesc" style="width:165mm;height:4mm;">
							 If you petitioned for a provisional emissions rate (PER), check the applicable box below and complete line 2b(iii), if applicable.
								<!--Dotted Line-->
								<!--<span class="styDotLn" 
								 style="float:none;padding-left:2mm">...................
								</span>-->
							</div>
						</div>
						<!-- Line 2b(i) -->
						<div style="width:187mm;">
							<div class="styLNLeftNumBox" style="height:4mm;padding-top:2mm;padding-left: 4mm"></div>
							<div class="styLNDesc" style="width:165mm;height:6mm;">
							 <b>(i)</b>
							 <span style="width:1mm"/>
								<input type="checkbox" alt="ProvisionalEmissionRatetApproval" class="styCkbox">
									<xsl:call-template name="PopulateCheckbox">
										<xsl:with-param name="TargetNode" 
										 select="$Form3468Data/QlfyInterconnectionPropInd"/>
										<xsl:with-param name="BackupName">
										  IRS3468ProvisionalEmissionRtApprvlInd
										</xsl:with-param>
									</xsl:call-template>
								</input> An emissions value was received from the DOE.								
							</div>							
						</div>
						<!-- End Line 2b(i) -->
						<!-- Line 2b(ii) -->
						<div style="width:187mm;">
							<div class="styLNLeftNumBox" style="height:4mm;padding-top:2mm;padding-left: 4mm"></div>
							<div class="styLNDesc" style="width:150mm;height:6mm;">
							 <b>(ii)</b>
								<input type="checkbox" alt="ProvisionalEmissionRatetApproval" class="styCkbox">
									<xsl:call-template name="PopulateCheckbox">
										<xsl:with-param name="TargetNode" 
										 select="$Form3468Data/QlfyInterconnectionPropInd"/>
										<xsl:with-param name="BackupName">
										  IRS3468ProvisionalEmissionRtApprvlInd
										</xsl:with-param>
									</xsl:call-template>
								</input> A designated lifecycle analysis (LCA) model was used to determine an emissions value.
							</div>							
						</div>
						<!-- End Line 2b(ii) -->
						<!-- Line 2b(iii) -->
						<div style="width:187mm;">
							<div class="styLNLeftNumBox" style="height:4mm;padding-top:2mm;padding-left: 4mm"></div>
							<div class="styLNDesc" style="width:65mm;height:4mm;">
							 <b>(iii)</b>  Enter the DOE control number, if applicable:
							</div>
							<span class="styUnderlineAmount" style="float:left; width:35mm;border-bottom-width:1px;
							 text-align:left;height:4mm;padding-top:.5mm">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$Form3468Data/DOEControlNum"/>
								</xsl:call-template>
							</span>
						</div>
						<!-- End Line 2b(iii) -->
						<!-- Line 3a -->
						<div style="width:187mm;">
							<div class="styLNLeftNumBox" style="height:4mm;padding-left:2mm;">3a</div>
							<div class="styLNDesc" style="width:65mm;height:4.5mm;">
                            Type (solar, clean hydrogen, rehabilitation, etc.):
							</div>
							<div>
							<!--<div class="styLNLeftNumBox" style="height:4mm;padding-left:2mm;"></div>-->
								<span class="styUnderlineAmount" style="float:left; width:70mm;border-bottom-width:1px;
								 text-align:left;height:4.5mm;padding-top:1mm;">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$Form3468Data/FacilityTypeDesc"/>
									</xsl:call-template>
								</span>
							</div>
						</div>
						<!-- Line 3b -->
						<div style="width:187mm;">
							<div class="styLNLeftNumBox" style="height:6mm;padding-top:1mm;padding-left:4mm;">b</div>
							<div class="styLNDesc" style="width:40mm;height:6mm;padding-top:1mm">
                            If different from filer, enter:
							</div>
						</div>
						<!-- Line 3b(i) -->
						<div style="width:187mm">
							<div class="styLNLeftNumBox" style="height:4mm;padding-bottom:.5mm;padding-left:4mm"></div>
							<div class="styLNDesc" style="width:155mm;height:7mm;">
							  <span style="float:left;padding-left:0mm;"><b>(i)</b> Owner’s name:</span>
								<span class="styFixedUnderline" style="width:105mm;padding-top:.1mm;padding-left:1mm;
								 height-auto;">
									<xsl:choose>
										<!--Person Name vs Business Name-->
										<xsl:when test="$Form3468Data/FacilityOwnerPersonNm">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode"
												 select="$Form3468Data/FacilityOwnerPersonNm"/>
											</xsl:call-template>
										</xsl:when>
										<xsl:when test="$Form3468Data/FacilityOwnerBusinessName">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode"
												 select="$Form3468Data/FacilityOwnerBusinessName/BusinessNameLine1Txt"/>
											</xsl:call-template>
											<br/>
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode"
												 select="$Form3468Data/FacilityOwnerBusinessName/BusinessNameLine2Txt"/>
											</xsl:call-template>
										</xsl:when>
									</xsl:choose>
								</span>						  
							</div>
						</div>
						<!-- Line 3b(ii) -->
						<div style="width:187mm">
							<div class="styLNLeftNumBox" style="height:4mm;padding-bottom:.5mm;"></div>
							<div class="styLNDesc" style="width:143mm;height:4mm;">
							  <span style="float:left;padding-left:0mm;"><b>(ii)</b> Owner’s TIN:</span>
								<span class="styUnderlineAmount" style="width:20mm;padding-top:.1mm;padding-bottom:0mm;
									padding-left:1mm;text-align:left;height-auto;">
									<xsl:choose>
										<!--Person Name vs Business Name-->
										<xsl:when test="$Form3468Data/FacilityOwnerSSN">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode"
												 select="$Form3468Data/FacilityOwnerSSN"/>
											</xsl:call-template>
										</xsl:when>
										<xsl:when test="$Form3468Data/FacilityOwnerEIN">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode"
												 select="$Form3468Data/FacilityOwnerEIN"/>
											</xsl:call-template>
										</xsl:when>
									</xsl:choose>
								</span>						  
							</div>
						</div>
						<!-- Line 3c -->
						<div style="width:187mm;">
							<div class="styLNLeftNumBox" style="height:4mm;padding-left:4mm">c</div>
							<div class="styLNDesc" style="width:35mm;height:7mm;">
                            Address of the facility (if applicable):
							</div>
							<br/>
							<span class="styUnderlineAmount" style="float:left; width:135mm;border-bottom-width:1px;
							     text-align:left;height:auto;">
								<xsl:choose>
									<xsl:when test="$Form3468Data/FacilityUSAddress/AddressLine1Txt">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" 
											 select="$Form3468Data/FacilityUSAddress/AddressLine1Txt"/>
										</xsl:call-template>
										<span style="width:2mm"/>
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" 
											 select="$Form3468Data/FacilityUSAddress/AddressLine2Txt"/>
										</xsl:call-template>
										<span style="width:1mm"/>
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" 
											 select="$Form3468Data/FacilityUSAddress/CityNm"/>
										</xsl:call-template>
										<span style="width:1mm"/>
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" 
											 select="$Form3468Data/FacilityUSAddress/StateAbbreviationCd"/>
										</xsl:call-template>
										<span style="width:1mm"/>
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" 
											 select="$Form3468Data/FacilityUSAddress/ZIPCd"/>
										</xsl:call-template>
									</xsl:when>
								</xsl:choose>
							</span>
						</div>
						<!-- Line 3c -->
						<!-- Line 3d -->
						<!-- Latitude and Longitude -->
						<div class="styStdDiv" style="width:187mm;height:13mm;padding-top:1mm;vertical-align:top;">
							<div class="styLNLeftLtrBox" style="padding-left: 4mm;height:7mm;padding-top:2mm;">d</div>
							<div style="">
								Coordinates.
								<span style="width:2mm; vertical-align:top;padding-top:2mm;"> </span>
								<b>(i)</b> Latitude:
								<!-- Latitude/Longitutude may begin with a '+' or '-' -->
								<xsl:choose>
									<xsl:when test="substring($Form3468Data/FacilityLatitudeNum/text(),1,1) = '+' or
									 substring($Form3468Data/FacilityLatitudeNum/text(),1,1) = '-'">
										<div>
											<xsl:call-template name="PopulateIndividualSizableLetterBox">
												<xsl:with-param name="TargetNode" 
												 select="$Form3468Data/FacilityLatitudeNum"/>
												<xsl:with-param name="BoxNum" select="1"/>
												<xsl:with-param name="BoxWidth" select="'5mm'"/>
												<xsl:with-param name="BoxHeight" select="'5mm'"/>
												<xsl:with-param name="BoxTopPadding" select="'.5mm'"/>
											</xsl:call-template>
										</div>
										<span style="width:3mm;"> </span>
										<div>
											<xsl:call-template name="PopulateIndividualSizableLetterBox">
												<xsl:with-param name="TargetNode" 
												 select="$Form3468Data/FacilityLatitudeNum"/>
												<xsl:with-param name="BoxNum" select="2"/>
												<xsl:with-param name="BoxWidth" select="'5mm'"/>
												<xsl:with-param name="BoxHeight" select="'5mm'"/>
												<xsl:with-param name="BoxTopPadding" select="'.5mm'"/>
											</xsl:call-template>
										</div>
										<div>
											<xsl:call-template name="PopulateIndividualSizableLetterBox">
												<xsl:with-param name="TargetNode" 
												 select="$Form3468Data/FacilityLatitudeNum"/>
												<xsl:with-param name="BoxNum" select="3"/>
												<xsl:with-param name="BoxWidth" select="'5mm'"/>
												<xsl:with-param name="BoxHeight" select="'5mm'"/>
												<xsl:with-param name="BoxTopPadding" select="'.5mm'"/>
											</xsl:call-template>
										</div>
										.
										<div>
											<xsl:call-template name="PopulateIndividualSizableLetterBox">
												<xsl:with-param name="TargetNode" 
												 select="$Form3468Data/FacilityLatitudeNum"/>
												<xsl:with-param name="BoxNum" select="5"/>
												<xsl:with-param name="BoxWidth" select="'5mm'"/>
												<xsl:with-param name="BoxHeight" select="'5mm'"/>
												<xsl:with-param name="BoxTopPadding" select="'.5mm'"/>
											</xsl:call-template>
										</div>
										<div>
											<xsl:call-template name="PopulateIndividualSizableLetterBox">
												<xsl:with-param name="TargetNode" 
												 select="$Form3468Data/FacilityLatitudeNum"/>
												<xsl:with-param name="BoxNum" select="6"/>
												<xsl:with-param name="BoxWidth" select="'5mm'"/>
												<xsl:with-param name="BoxHeight" select="'5mm'"/>
												<xsl:with-param name="BoxTopPadding" select="'.5mm'"/>
											</xsl:call-template>
										</div>
										<div>
											<xsl:call-template name="PopulateIndividualSizableLetterBox">
												<xsl:with-param name="TargetNode" 
												 select="$Form3468Data/FacilityLatitudeNum"/>
												<xsl:with-param name="BoxNum" select="7"/>
												<xsl:with-param name="BoxWidth" select="'5mm'"/>
												<xsl:with-param name="BoxHeight" select="'5mm'"/>
												<xsl:with-param name="BoxTopPadding" select="'.5mm'"/>
											</xsl:call-template>
										</div>
										<div>
											<xsl:call-template name="PopulateIndividualSizableLetterBox">
												<xsl:with-param name="TargetNode" 
												 select="$Form3468Data/FacilityLatitudeNum"/>
												<xsl:with-param name="BoxNum" select="8"/>
												<xsl:with-param name="BoxWidth" select="'5mm'"/>
												<xsl:with-param name="BoxHeight" select="'5mm'"/>
												<xsl:with-param name="BoxTopPadding" select="'.5mm'"/>
											</xsl:call-template>
										</div>
										<div>
											<xsl:call-template name="PopulateIndividualSizableLetterBox">
												<xsl:with-param name="TargetNode" 
												 select="$Form3468Data/FacilityLatitudeNum"/>
												<xsl:with-param name="BoxNum" select="9"/>
												<xsl:with-param name="BoxWidth" select="'5mm'"/>
												<xsl:with-param name="BoxHeight" select="'5mm'"/>
												<xsl:with-param name="BoxTopPadding" select="'.5mm'"/>
											</xsl:call-template>
										</div>
										<div>
											<xsl:call-template name="PopulateIndividualSizableLetterBox">
												<xsl:with-param name="TargetNode" 
												 select="$Form3468Data/FacilityLatitudeNum"/>
												<xsl:with-param name="BoxNum" select="10"/>
												<xsl:with-param name="BoxWidth" select="'5mm'"/>
												<xsl:with-param name="BoxHeight" select="'5mm'"/>
												<xsl:with-param name="BoxTopPadding" select="'.5mm'"/>
											</xsl:call-template>
										</div>
									</xsl:when>
									<xsl:otherwise>
										<div class="emptyLonLatBox"/>
										<span style="width:3mm"> </span>
										<div>
											<xsl:call-template name="PopulateIndividualSizableLetterBox">
												<xsl:with-param name="TargetNode" 
												 select="$Form3468Data/FacilityLatitudeNum"/>
												<xsl:with-param name="BoxNum" select="1"/>
												<xsl:with-param name="BoxWidth" select="'5mm'"/>
												<xsl:with-param name="BoxHeight" select="'5mm'"/>
												<xsl:with-param name="BoxTopPadding" select="'.5mm'"/>
											</xsl:call-template>
										</div>
										<div>
											<xsl:call-template name="PopulateIndividualSizableLetterBox">
												<xsl:with-param name="TargetNode" 
												 select="$Form3468Data/FacilityLatitudeNum"/>
												<xsl:with-param name="BoxNum" select="2"/>
												<xsl:with-param name="BoxWidth" select="'5mm'"/>
												<xsl:with-param name="BoxHeight" select="'5mm'"/>
												<xsl:with-param name="BoxTopPadding" select="'.5mm'"/>
											</xsl:call-template>
										</div>
										.
										<div>
											<xsl:call-template name="PopulateIndividualSizableLetterBox">
												<xsl:with-param name="TargetNode" 
												 select="$Form3468Data/FacilityLatitudeNum"/>
												<xsl:with-param name="BoxNum" select="4"/>
												<xsl:with-param name="BoxWidth" select="'5mm'"/>
												<xsl:with-param name="BoxHeight" select="'5mm'"/>
												<xsl:with-param name="BoxTopPadding" select="'.5mm'"/>
											</xsl:call-template>
										</div>
										<div>
											<xsl:call-template name="PopulateIndividualSizableLetterBox">
												<xsl:with-param name="TargetNode" 
												 select="$Form3468Data/FacilityLatitudeNum"/>
												<xsl:with-param name="BoxNum" select="5"/>
												<xsl:with-param name="BoxWidth" select="'5mm'"/>
												<xsl:with-param name="BoxHeight" select="'5mm'"/>
												<xsl:with-param name="BoxTopPadding" select="'.5mm'"/>
											</xsl:call-template>
										</div>
										<div>
											<xsl:call-template name="PopulateIndividualSizableLetterBox">
												<xsl:with-param name="TargetNode" 
												 select="$Form3468Data/FacilityLatitudeNum"/>
												<xsl:with-param name="BoxNum" select="6"/>
												<xsl:with-param name="BoxWidth" select="'5mm'"/>
												<xsl:with-param name="BoxHeight" select="'5mm'"/>
												<xsl:with-param name="BoxTopPadding" select="'.5mm'"/>
											</xsl:call-template>
										</div>
										<div>
											<xsl:call-template name="PopulateIndividualSizableLetterBox">
												<xsl:with-param name="TargetNode" 
												 select="$Form3468Data/FacilityLatitudeNum"/>
												<xsl:with-param name="BoxNum" select="7"/>
												<xsl:with-param name="BoxWidth" select="'5mm'"/>
												<xsl:with-param name="BoxHeight" select="'5mm'"/>
												<xsl:with-param name="BoxTopPadding" select="'.5mm'"/>
											</xsl:call-template>
										</div>
										<div>
											<xsl:call-template name="PopulateIndividualSizableLetterBox">
												<xsl:with-param name="TargetNode" 
												 select="$Form3468Data/FacilityLatitudeNum"/>
												<xsl:with-param name="BoxNum" select="8"/>
												<xsl:with-param name="BoxWidth" select="'5mm'"/>
												<xsl:with-param name="BoxHeight" select="'5mm'"/>
												<xsl:with-param name="BoxTopPadding" select="'.5mm'"/>
											</xsl:call-template>
										</div>
										<div>
											<xsl:call-template name="PopulateIndividualSizableLetterBox">
												<xsl:with-param name="TargetNode" 
												 select="$Form3468Data/FacilityLatitudeNum"/>
												<xsl:with-param name="BoxNum" select="9"/>
												<xsl:with-param name="BoxWidth" select="'5mm'"/>
												<xsl:with-param name="BoxHeight" select="'5mm'"/>
												<xsl:with-param name="BoxTopPadding" select="'.5mm'"/>
											</xsl:call-template>
										</div>
									</xsl:otherwise>
								</xsl:choose>
								<span style="width:3mm; vertical-align:top"/>
								
								<b>(ii)</b> Longitude:
								<xsl:choose>
									<xsl:when test="substring($Form3468Data/FacilityLongitudeNum/text(),1,1) = '+' or 
									 substring($Form3468Data/FacilityLongitudeNum/text(),1,1) = '-'">
										<div>
											<xsl:call-template name="PopulateIndividualSizableLetterBox">
												<xsl:with-param name="TargetNode" 
												 select="$Form3468Data/FacilityLongitudeNum"/>
												<xsl:with-param name="BoxNum" select="1"/>
												<xsl:with-param name="BoxWidth" select="'5mm'"/>
												<xsl:with-param name="BoxHeight" select="'5mm'"/>
												<xsl:with-param name="BoxTopPadding" select="'.5mm'"/>
											</xsl:call-template>
										</div>
										<span style="width:3mm"> </span>
										<div>
											<xsl:call-template name="PopulateIndividualSizableLetterBox">
												<xsl:with-param name="TargetNode" 
												 select="$Form3468Data/FacilityLongitudeNum"/>
												<xsl:with-param name="BoxNum" select="2"/>
												<xsl:with-param name="BoxWidth" select="'5mm'"/>
												<xsl:with-param name="BoxHeight" select="'5mm'"/>
												<xsl:with-param name="BoxTopPadding" select="'.5mm'"/>
											</xsl:call-template>
										</div>
										<div>
											<xsl:call-template name="PopulateIndividualSizableLetterBox">
												<xsl:with-param name="TargetNode" 
												 select="$Form3468Data/FacilityLongitudeNum"/>
												<xsl:with-param name="BoxNum" select="3"/>
												<xsl:with-param name="BoxWidth" select="'5mm'"/>
												<xsl:with-param name="BoxHeight" select="'5mm'"/>
												<xsl:with-param name="BoxTopPadding" select="'.5mm'"/>
											</xsl:call-template>
										</div>
										<div>
											<xsl:call-template name="PopulateIndividualSizableLetterBox">
												<xsl:with-param name="TargetNode" 
												 select="$Form3468Data/FacilityLongitudeNum"/>
												<xsl:with-param name="BoxNum" select="4"/>
												<xsl:with-param name="BoxWidth" select="'5mm'"/>
												<xsl:with-param name="BoxHeight" select="'5mm'"/>
												<xsl:with-param name="BoxTopPadding" select="'.5mm'"/>
											</xsl:call-template>
										</div>
										.
										<div>
											<xsl:call-template name="PopulateIndividualSizableLetterBox">
												<xsl:with-param name="TargetNode" 
												 select="$Form3468Data/FacilityLongitudeNum"/>
												<xsl:with-param name="BoxNum" select="6"/>
												<xsl:with-param name="BoxWidth" select="'5mm'"/>
												<xsl:with-param name="BoxHeight" select="'5mm'"/>
												<xsl:with-param name="BoxTopPadding" select="'.5mm'"/>
											</xsl:call-template>
										</div>
										<div>
											<xsl:call-template name="PopulateIndividualSizableLetterBox">
												<xsl:with-param name="TargetNode" 
												 select="$Form3468Data/FacilityLongitudeNum"/>
												<xsl:with-param name="BoxNum" select="7"/>
												<xsl:with-param name="BoxWidth" select="'5mm'"/>
												<xsl:with-param name="BoxHeight" select="'5mm'"/>
												<xsl:with-param name="BoxTopPadding" select="'.5mm'"/>
											</xsl:call-template>
										</div>
										<div>
											<xsl:call-template name="PopulateIndividualSizableLetterBox">
												<xsl:with-param name="TargetNode" 
												 select="$Form3468Data/FacilityLongitudeNum"/>
												<xsl:with-param name="BoxNum" select="8"/>
												<xsl:with-param name="BoxWidth" select="'5mm'"/>
												<xsl:with-param name="BoxHeight" select="'5mm'"/>
												<xsl:with-param name="BoxTopPadding" select="'.5mm'"/>
											</xsl:call-template>
										</div>
										<div>
											<xsl:call-template name="PopulateIndividualSizableLetterBox">
												<xsl:with-param name="TargetNode" 
												 select="$Form3468Data/FacilityLongitudeNum"/>
												<xsl:with-param name="BoxNum" select="9"/>
												<xsl:with-param name="BoxWidth" select="'5mm'"/>
												<xsl:with-param name="BoxHeight" select="'5mm'"/>
												<xsl:with-param name="BoxTopPadding" select="'.5mm'"/>
											</xsl:call-template>
										</div>
										<div>
											<xsl:call-template name="PopulateIndividualSizableLetterBox">
												<xsl:with-param name="TargetNode" 
												 select="$Form3468Data/FacilityLongitudeNum"/>
												<xsl:with-param name="BoxNum" select="10"/>
												<xsl:with-param name="BoxWidth" select="'5mm'"/>
												<xsl:with-param name="BoxHeight" select="'5mm'"/>
												<xsl:with-param name="BoxTopPadding" select="'.5mm'"/>
											</xsl:call-template>
										</div>
										<div>
											<xsl:call-template name="PopulateIndividualSizableLetterBox">
												<xsl:with-param name="TargetNode" 
												 select="$Form3468Data/FacilityLongitudeNum"/>
												<xsl:with-param name="BoxNum" select="11"/>
												<xsl:with-param name="BoxWidth" select="'5mm'"/>
												<xsl:with-param name="BoxHeight" select="'5mm'"/>
												<xsl:with-param name="BoxTopPadding" select="'.5mm'"/>
											</xsl:call-template>
										</div>
									</xsl:when>
									<xsl:otherwise>
										<div class="emptyLonLatBox"/>
										<span style="width:3mm"> </span>
										<div>
											<xsl:call-template name="PopulateIndividualSizableLetterBox">
												<xsl:with-param name="TargetNode" 
												 select="$Form3468Data/FacilityLongitudeNum"/>
												<xsl:with-param name="BoxNum" select="1"/>
												<xsl:with-param name="BoxWidth" select="'5mm'"/>
												<xsl:with-param name="BoxHeight" select="'5mm'"/>
												<xsl:with-param name="BoxTopPadding" select="'.5mm'"/>
											</xsl:call-template>
										</div>
										<div>
											<xsl:call-template name="PopulateIndividualSizableLetterBox">
												<xsl:with-param name="TargetNode" 
												 select="$Form3468Data/FacilityLongitudeNum"/>
												<xsl:with-param name="BoxNum" select="2"/>
												<xsl:with-param name="BoxWidth" select="'5mm'"/>
												<xsl:with-param name="BoxHeight" select="'5mm'"/>
												<xsl:with-param name="BoxTopPadding" select="'.5mm'"/>
											</xsl:call-template>
										</div>
										<div>
											<xsl:call-template name="PopulateIndividualSizableLetterBox">
												<xsl:with-param name="TargetNode"
												 select="$Form3468Data/FacilityLongitudeNum"/>
												<xsl:with-param name="BoxNum" select="3"/>
												<xsl:with-param name="BoxWidth" select="'5mm'"/>
												<xsl:with-param name="BoxHeight" select="'5mm'"/>
												<xsl:with-param name="BoxTopPadding" select="'.5mm'"/>
											</xsl:call-template>
										</div>
										.
										<div>
											<xsl:call-template name="PopulateIndividualSizableLetterBox">
												<xsl:with-param name="TargetNode"
												 select="$Form3468Data/FacilityLongitudeNum"/>
												<xsl:with-param name="BoxNum" select="5"/>
												<xsl:with-param name="BoxWidth" select="'5mm'"/>
												<xsl:with-param name="BoxHeight" select="'5mm'"/>
												<xsl:with-param name="BoxTopPadding" select="'.5mm'"/>
											</xsl:call-template>
										</div>
										<div>
											<xsl:call-template name="PopulateIndividualSizableLetterBox">
												<xsl:with-param name="TargetNode"
												 select="$Form3468Data/FacilityLongitudeNum"/>
												<xsl:with-param name="BoxNum" select="6"/>
												<xsl:with-param name="BoxWidth" select="'5mm'"/>
												<xsl:with-param name="BoxHeight" select="'5mm'"/>
												<xsl:with-param name="BoxTopPadding" select="'.5mm'"/>
											</xsl:call-template>
										</div>
										<div>
											<xsl:call-template name="PopulateIndividualSizableLetterBox">
												<xsl:with-param name="TargetNode"
												 select="$Form3468Data/FacilityLongitudeNum"/>
												<xsl:with-param name="BoxNum" select="7"/>
												<xsl:with-param name="BoxWidth" select="'5mm'"/>
												<xsl:with-param name="BoxHeight" select="'5mm'"/>
												<xsl:with-param name="BoxTopPadding" select="'.5mm'"/>
											</xsl:call-template>
										</div>
										<div>
											<xsl:call-template name="PopulateIndividualSizableLetterBox">
												<xsl:with-param name="TargetNode"
												 select="$Form3468Data/FacilityLongitudeNum"/>
												<xsl:with-param name="BoxNum" select="8"/>
												<xsl:with-param name="BoxWidth" select="'5mm'"/>
												<xsl:with-param name="BoxHeight" select="'5mm'"/>
												<xsl:with-param name="BoxTopPadding" select="'.5mm'"/>
											</xsl:call-template>
										</div>
										<div>
											<xsl:call-template name="PopulateIndividualSizableLetterBox">
												<xsl:with-param name="TargetNode"
												 select="$Form3468Data/FacilityLongitudeNum"/>
												<xsl:with-param name="BoxNum" select="9"/>
												<xsl:with-param name="BoxWidth" select="'5mm'"/>
												<xsl:with-param name="BoxHeight" select="'5mm'"/>
												<xsl:with-param name="BoxTopPadding" select="'.5mm'"/>
											</xsl:call-template>
										</div>
										<div>
											<xsl:call-template name="PopulateIndividualSizableLetterBox">
												<xsl:with-param name="TargetNode" 
												 select="$Form3468Data/FacilityLongitudeNum"/>
												<xsl:with-param name="BoxNum" select="10"/>
												<xsl:with-param name="BoxWidth" select="'5mm'"/>
												<xsl:with-param name="BoxHeight" select="'5mm'"/>
												<xsl:with-param name="BoxTopPadding" select="'.5mm'"/>
											</xsl:call-template>
										</div>
									</xsl:otherwise>
								</xsl:choose>
							</div>
							<div style="margin-left:50mm;font-size:6pt;">
								<span>Enter a "+" (plus) or "-" (minus) sign in the first box.</span>
								<span style="width:17mm"> </span>
								<span>Enter a "+" (plus) or "-" (minus) sign in the first box.</span>
							</div>
						</div>
						<!-- Line 3e -->
						<div style="width:177mm;">
							<div class="styLNLeftNumBox" style="height:4mm;padding-top:2mm;padding-left: 4mm">e</div>
							<div class="styLNDesc" style="width:165mm;height:6mm;">
							 Check this box if the property includes qualified interconnection property under section 48(a)(8) or 48E(b)(1)(B)
								<!--Dotted Line-->
								<span class="styDotLn" 
								 style="float:none;padding-left:2mm">...
								</span>
								<input type="checkbox" alt="ProvisionalEmissionRatetApproval" class="styCkbox">
									<xsl:call-template name="PopulateCheckbox">
										<xsl:with-param name="TargetNode" 
										 select="$Form3468Data/QlfyInterconnectionPropInd"/>
										<xsl:with-param name="BackupName">
										  IRS3468ProvisionalEmissionRtApprvlInd
										</xsl:with-param>
									</xsl:call-template>
								</input>
							</div>
						</div>
						<!-- Line 4 -->
						<div style="width:187mm;">
							<div class="styLNLeftNumBox" style="height:4mm;padding-left:2mm">4</div>
							<div class="styLNDesc" style="width:52mm;height:4mm;">
                              Date construction began (MM/DD/YYYY):
							</div>
							<span class="styUnderlineAmount" style="float:left; width:15mm;height:4mm;
							  border-bottom-width:1px; text-align:left;">
								<xsl:call-template name="PopulateMonthDayYear">
									<xsl:with-param name="TargetNode" select="$Form3468Data/FacilityConstructionStartDt"/>
								</xsl:call-template>
							</span>
						</div>
						<!-- Line 5 -->
						<div style="width:187mm;">
							<div class="styLNLeftNumBox" style="height:4mm;padding-left:2mm">5</div>
							<div class="styLNDesc" style="width:52mm;height:4mm;">
                              Date placed in service (MM/DD/YYYY):
							</div>
							<span class="styUnderlineAmount" style="float:left; width:15mm;height:4mm;
							  border-bottom-width:1px; text-align:left;">
								<xsl:call-template name="PopulateMonthDayYear">
									<xsl:with-param name="TargetNode" select="$Form3468Data/FacilityPlacedInServiceDt"/>
								</xsl:call-template>
							</span>
						</div>
						<!-- Line 6 -->
						<div style="width:177mm;">
							<div class="styLNLeftNumBox" style="height:5mm;padding-left:2mm;padding-top:2mm">
							 6
							</div>
							<div class="styLNDesc" style="width:165mm;height:5mm;">
							 Is the facility part of an expansion of an existing facility?
								<!--Dotted Line-->
								<span class="styDotLn" 
								 style="float:none;padding-left:2mm">.................
								</span>
								<span>
									<xsl:call-template name="PopulateSpan">
										<xsl:with-param name="TargetNode" select="$Form3468Data/ExistingFacilityExpansionInd"/>
									</xsl:call-template>
									<input type="checkbox" aria-label="Expansion of closed or open-loop biomassYes" class="styCkbox">
										<xsl:call-template name="PopulateYesCheckbox">
											<xsl:with-param name="TargetNode" 
											 select="$Form3468Data/ExistingFacilityExpansionInd"/>
											<xsl:with-param name="BackupName">F3468ExistingFacilityExpansionInd</xsl:with-param>
										</xsl:call-template>
									</input>
									<label>
										<xsl:call-template name="PopulateLabelYes">
											<xsl:with-param name="TargetNode" 
											 select="$Form3468Data/ExistingFacilityExpansionInd"/>
											<xsl:with-param name="BackupName">F3468ExistingFacilityExpansionInd</xsl:with-param>
										</xsl:call-template>Yes
									</label>
								</span>
								<span style="width: 4mm"/>
								<span>
									<xsl:call-template name="PopulateSpan">
										<xsl:with-param name="TargetNode" select="$Form3468Data/ExistingFacilityExpansionInd"/>
									</xsl:call-template>
									<input type="checkbox" aria-label="Expansion of closed or open-loop biomassNo" class="styCkbox">
										<xsl:call-template name="PopulateNoCheckbox">
											<xsl:with-param name="TargetNode" 
											 select="$Form3468Data/ExistingFacilityExpansionInd"/>
											<xsl:with-param name="BackupName">F3468ExistingFacilityExpansionInd</xsl:with-param>
										</xsl:call-template>
									</input>
									<label>
										<xsl:call-template name="PopulateLabelNo">
											<xsl:with-param name="TargetNode" 
											 select="$Form3468Data/ExistingFacilityExpansionInd"/>
											<xsl:with-param name="BackupName">F3468ExistingFacilityExpansionInd</xsl:with-param>
										</xsl:call-template>No
									</label>
								</span>
							</div>
						</div>
						<!-- Line 7 -->
						<div style="width:187mm;">
							<div class="styLNLeftNumBox" style="padding-left:2mm;">7</div>
							<div class="styLNDesc" style="width:175mm;height:7mm">
							 Does the property, facility, or project produce a net output of less than 1 megawatt (MW) 
							 alternating current (ac), or equivalent thermal energy?
							</div>
						</div>
						<!-- Line 7a -->
						<div style="width:187mm;">
							<div class="styLNLeftNumBox" style="padding-left:4mm;">a</div>
							<span>
								<xsl:call-template name="PopulateSpan">
									<xsl:with-param name="TargetNode" select="$Form3468Data/NetOutLess1MWOrThermalEgyCd"/>
								</xsl:call-template>
								<input type="checkbox" aria-label="NetOutputLessThan1MegawattYes" class="styCkbox">
									<xsl:if test="$Form3468Data/NetOutLess1MWOrThermalEgyCd = 'YES'">
										<xsl:attribute name="checked">checked</xsl:attribute>
									</xsl:if>
									<xsl:call-template name="PopulateEnumeratedCheckbox">
										<xsl:with-param name="TargetNode" 
										   select="$Form3468Data/NetOutLess1MWOrThermalEgyCd"/>
										<xsl:with-param name="DisplayedCheckboxValue" select="'YES'"/>                                                    
										<xsl:with-param name="BackupName">NetOutLess1MWOrThermalEgyCd[YES]
										</xsl:with-param>
									</xsl:call-template>                                             
								</input>Yes
								<label>
									<xsl:call-template name="PopulateLabel">
										<xsl:with-param name="TargetNode" 
										   select="$Form3468Data/NetOutLess1MWOrThermalEgyCd"/>
										<xsl:with-param name="DisplayedCheckboxValue" select="'YES'"/>
										<xsl:with-param name="BackupName">NetOutLess1MWOrThermalEgyCd[YES]
										</xsl:with-param>
									</xsl:call-template>
								</label>
							</span>
						</div>
						<!-- Line 7b -->
						<div style="width:187mm;">
							<div class="styLNLeftNumBox" style="padding-left:4mm;">b</div>
							<span>
								<xsl:call-template name="PopulateSpan">
									<xsl:with-param name="TargetNode" select="$Form3468Data/NetOutLess1MWOrThermalEgyCd"/>
								</xsl:call-template>
								<input type="checkbox" aria-label="NetOutputLessThan1MegawattNo" class="styCkbox">
									<xsl:if test="$Form3468Data/NetOutLess1MWOrThermalEgyCd = 'NO'">
										<xsl:attribute name="checked">checked</xsl:attribute>
									</xsl:if>
									<xsl:call-template name="PopulateEnumeratedCheckbox">
										<xsl:with-param name="TargetNode" 
										   select="$Form3468Data/NetOutLess1MWOrThermalEgyCd"/>
										<xsl:with-param name="DisplayedCheckboxValue" select="'NO'"/>                                                    
										<xsl:with-param name="BackupName">NetOutLess1MWOrThermalEgyCd[NO]
										</xsl:with-param>
									</xsl:call-template>                                             
								</input>No
								<label>
									<xsl:call-template name="PopulateLabel">
										<xsl:with-param name="TargetNode" 
										 select="$Form3468Data/NetOutLess1MWOrThermalEgyCd"/>
										<xsl:with-param name="DisplayedCheckboxValue" select="'NO'"/>
										<xsl:with-param name="BackupName">NetOutLess1MWOrThermalEgyCd[NO]
										</xsl:with-param>
									</xsl:call-template>                                             
								</label>
							</span>
						</div>
						<!-- Line 7c -->
						<div style="width:187mm;">
							<div class="styLNLeftNumBox" style="padding-left:4mm;">c</div>
							<span>
								<xsl:call-template name="PopulateSpan">
									<xsl:with-param name="TargetNode" select="$Form3468Data/NetOutLess1MWOrThermalEgyCd"/>
								</xsl:call-template>
								<input type="checkbox" aria-label="NetOutputLessThan1MegawattN/A" class="styCkbox">
									<xsl:if test="$Form3468Data/NetOutLess1MWOrThermalEgyCd = 'N/A'">
										<xsl:attribute name="checked">checked</xsl:attribute>
									</xsl:if>
									<xsl:call-template name="PopulateEnumeratedCheckbox">
										<xsl:with-param name="TargetNode" 
										   select="$Form3468Data/NetOutLess1MWOrThermalEgyCd"/>
										<xsl:with-param name="DisplayedCheckboxValue" select="'N/A'"/>                                                    
										<xsl:with-param name="BackupName">NetOutLess1MWOrThermalEgyCd[N/A]
										</xsl:with-param>
									</xsl:call-template>                                             
								</input>Not applicable, the facility doesn’t produce electricity.
								<label>
									<xsl:call-template name="PopulateLabel">
										<xsl:with-param name="TargetNode" 
										   select="$Form3468Data/NetOutLess1MWOrThermalEgyCd"/>
										<xsl:with-param name="DisplayedCheckboxValue" select="'N/A'"/>
										<xsl:with-param name="BackupName">NetOutLess1MWOrThermalEgyCd[N/A]
										 </xsl:with-param>
									</xsl:call-template>                                             
								</label>
							</span>
						</div>
						<!-- Line 8 -->
						<div style="width:187mm;">
							<div class="styLNLeftNumBox" style="padding-left:2mm;">8</div>
							<div class="styLNDesc" style="width:170mm;">
							 Does the property, facility, or project satisfy the prevailing wage and apprenticeship 
							 requirements?
							</div>
						</div>
						<!-- Line 8a -->
						<div style="width:187mm;">
							<div class="styLNLeftNumBox" style="padding-left:4mm;">a</div>
								<input type="checkbox" 
								   aria-label="Sections48(C)(e)(5)And(6)ApplyYes" class="styCkbox">
									<xsl:call-template name="PopulateCheckbox">
										<xsl:with-param name="TargetNode" 
										 select="$Form3468Data/ProjWageRqrSect48Ce5And6Ind"/>
										<xsl:with-param name="BackupName">F3468ProjWageRqrSect48Ce5And6Ind</xsl:with-param>
									</xsl:call-template>
								</input>
								<label>
									<xsl:call-template name="PopulateLabelYes">
										<xsl:with-param name="TargetNode" 
										 select="$Form3468Data/ProjWageRqrSect48Ce5And6Ind"/>
										<xsl:with-param name="BackupName">F3468ProjWageRqrSect48Ce5And6Ind</xsl:with-param>
									</xsl:call-template>Yes, and sections 48C(e)(5) and (6) apply, and it was declared as
									 provided per Notice 2023-18.
								</label>
						</div>
						<!-- Line 8b -->
						<div style="width:187mm;">
							<div class="styLNLeftNumBox" style="padding-left:4mm;">b</div>
								<input type="checkbox" 
								   aria-label="Sections48(a)(10)And(11)ApplyYes" class="styCkbox">
									<xsl:call-template name="PopulateCheckbox">
										<xsl:with-param name="TargetNode" 
										 select="$Form3468Data/ProjWageRqrSect48a10And11Ind"/>
										<xsl:with-param name="BackupName">F3468ProjWageRqrSect48a10And11Ind</xsl:with-param>
									</xsl:call-template>
								</input>
								<label>
									<xsl:call-template name="PopulateLabelYes">
										<xsl:with-param name="TargetNode" 
										 select="$Form3468Data/ProjWageRqrSect48a10And11Ind"/>
										<xsl:with-param name="BackupName">F3468ProjWageRqrSect48a10And11Ind</xsl:with-param>
									</xsl:call-template>Yes, and either (i) section 48(a)(9)(B)(ii), 48E(a)(2)(A)(ii)(ll),
									 or 48E(a)(2)(B)(ii)(ll) applies if construction began before January 29,
								</label>
						</div>
						<div style="width:187mm;">
							<div class="styLNLeftNumBox" style="padding-left:4mm;width:13mm;"></div>
							  2023; or (ii) sections 48(a)(10) and (11), or 48E(d)(3) and (4) apply.
						</div>
						<!-- Line 8c -->
						<div style="width:187mm;">
							<div class="styLNLeftNumBox" style="padding-left:4mm;">c</div>
								<input type="checkbox" aria-label="WageAndApprenticeshipRequirementsMetNo" class="styCkbox">
									<xsl:call-template name="PopulateNoCheckbox">
										<xsl:with-param name="TargetNode" select="$Form3468Data/ProjWageRqrNotStsfdInd"/>
										<xsl:with-param name="BackupName">F3468ProjWageRqrNotStsfdInd</xsl:with-param>
									</xsl:call-template>
								</input>
								<label>
									<xsl:call-template name="PopulateLabelNo">
										<xsl:with-param name="TargetNode" 
										 select="$Form3468Data/ProjWageRqrNotStsfdInd"/>
										<xsl:with-param name="BackupName">F3468ProjWageRqrNotStsfdInd</xsl:with-param>
									</xsl:call-template>No
								</label>
						</div>
						<!-- Line 8d -->
						<div style="width:187mm;">
							<div class="styLNLeftNumBox" style="padding-left:4mm;">d</div>
								<input type="checkbox" 
								 aria-label="Wage and apprenticeship question not applicable" class="styCkbox">
									<xsl:call-template name="PopulateNoCheckbox">
										<xsl:with-param name="TargetNode" select="$Form3468Data/ProjWageRqrNAInd"/>
										<xsl:with-param name="BackupName">F3468ProjWageRqrNAInd</xsl:with-param>
									</xsl:call-template>
								</input>
								<label>
									<xsl:call-template name="PopulateLabelNo">
										<xsl:with-param name="TargetNode" 
										 select="$Form3468Data/ProjWageRqrNAInd"/>
										<xsl:with-param name="BackupName">F3468ProjWageRqrNAInd</xsl:with-param>
									</xsl:call-template>Not applicable.
								</label>
						</div>
						<!-- Line 9 -->
						<div style="width:187mm;">
							<div class="styLNLeftNumBox" style="padding-left:2mm;">9</div>
							<div class="styLNDesc" style="width:170mm;">
							 Does the property, facility, or project qualify for a domestic content bonus credit 
							 per section 48(a)(12)(B) or 48E(a)(3)(B)?
							</div>
						</div>
						<!-- Line 9a -->
						<div style="width:187mm;">
							<div class="styLNLeftNumBox" style="padding-left:4mm;">a</div>
								<input type="checkbox" 
								   aria-label="Sections48(a)(9)(B)And48E(a)(2)(A)(ii)SatisfiedYes" 
								   class="styCkbox">
									<xsl:call-template name="PopulateCheckbox">
										<xsl:with-param name="TargetNode" 
										 select="$Form3468Data/DomContentCrStsfdPctInd"/>
										<xsl:with-param name="BackupName">F3468DomContentCrStsfdPctInd</xsl:with-param>
									</xsl:call-template>
								</input>
								<label>
									<xsl:call-template name="PopulateLabelYes">
										<xsl:with-param name="TargetNode" 
										 select="$Form3468Data/DomContentCrStsfdPctInd"/>
										<xsl:with-param name="BackupName">F3468DomContentCrStsfdPctInd</xsl:with-param>
									</xsl:call-template>Yes, and section 48(a)(9)(B), 48E(a)(2)(A)(ii), or 48E(a)(2)(B)(ii)
									 is satisfied (10% bonus). Attach the required information.
								</label>
						</div>
						<!-- Line 9b -->
						<div style="width:187mm;">
							<div class="styLNLeftNumBox" style="padding-left:4mm;">b</div>
								<input type="checkbox" 
								   aria-label="Sections48(a)(9)(B)And48E(a)(2)(A)(ii)NotSatisfiedYes" 
								   class="styCkbox">
									<xsl:call-template name="PopulateCheckbox">
										<xsl:with-param name="TargetNode" 
										 select="$Form3468Data/DomContentCrNotStsfdPctInd"/>
										<xsl:with-param name="BackupName">F3468DomContentCrNotStsfdPctInd</xsl:with-param>
									</xsl:call-template>
								</input>
								<label>
									<xsl:call-template name="PopulateLabelYes">
										<xsl:with-param name="TargetNode" 
										 select="$Form3468Data/DomContentCrNotStsfdPctInd"/>
										<xsl:with-param name="BackupName">F3468DomContentCrNotStsfdPctInd</xsl:with-param>
									</xsl:call-template>Yes, and section 48(a)(9)(B), 48E(a)(2)(A)(ii), or 48E(a)(2)(B)(ii)
									 is <b>not</b> satisfied (2% bonus). Attach the required information.
								</label>
						</div>
						<!-- Line 9c -->
						<div style="width:187mm;">
							<div class="styLNLeftNumBox" style="padding-left:4mm;">c</div>
								<input type="checkbox" aria-label="No 45(b)(9)(B) question" class="styCkbox">
									<xsl:call-template name="PopulateNoCheckbox">
										<xsl:with-param name="TargetNode" select="$Form3468Data/DomContentCrNotQlfyInd"/>
										<xsl:with-param name="BackupName">F3468DomContentCrNotQlfyInd</xsl:with-param>
									</xsl:call-template>
								</input>
								<label>
									<xsl:call-template name="PopulateLabelNo">
										<xsl:with-param name="TargetNode" 
										 select="$Form3468Data/DomContentCrNotQlfyInd"/>
										<xsl:with-param name="BackupName">F3468DomContentCrNotQlfyInd</xsl:with-param>
									</xsl:call-template>No
								</label>
						</div>
						<!-- Line 10 -->
						<div style="width:187mm;">
							<div class="styLNLeftNumBox" style="padding-left:2mm;">10</div>
							<div class="styLNDesc" style="width:170mm;">
								Does the property, facility, or project qualify for an energy community bonus credit per
								section 48(a)(14) or 48E(a)(3)(A)?
							</div>
						</div>
						<!-- Line 10a -->
						<div style="width:187mm;">
							<div class="styLNLeftNumBox" style="padding-left:4mm;">a</div>
								<input type="checkbox" 
								   alt="Sections45(b)(9)(B)And48(a)(9)(B)SatisfiedYes" class="styCkbox">
									<xsl:call-template name="PopulateCheckbox">
										<xsl:with-param name="TargetNode" 
										 select="$Form3468Data/EgyComBonusCrStsfdPctInd"/>
										<xsl:with-param name="BackupName">F3468DomContentCrStsfdPctInd</xsl:with-param>
									</xsl:call-template>
								</input>
								<label>
									<xsl:call-template name="PopulateLabelYes">
										<xsl:with-param name="TargetNode" 
										 select="$Form3468Data/EgyComBonusCrStsfdPctInd"/>
										<xsl:with-param name="BackupName">F3468EgyComBonusCrStsfdPctInd</xsl:with-param>
									</xsl:call-template>Yes, and section 48(a)(9)(B), 48E(a)(2)(A)(ii), or 48E(a)(2)(B)(ii)
									 is satisfied (10% bonus).
								</label>
						</div>
						<!-- Line 10b -->
						<div style="width:187mm;">
							<div class="styLNLeftNumBox" style="padding-left:4mm;">b</div>
								<input type="checkbox" 
								   aria-label="Sections45(b)(9)(B)And48(a)(9)(B)NotSatisfiedYes"
								   class="styCkbox">
									<xsl:call-template name="PopulateCheckbox">
										<xsl:with-param name="TargetNode" 
										 select="$Form3468Data/EgyComBonusCrNotStsfdPctInd"/>
										<xsl:with-param name="BackupName">F3468EgyComBonusCrNotStsfdPctInd</xsl:with-param>
									</xsl:call-template>
								</input>
								<label>
									<xsl:call-template name="PopulateLabelYes">
										<xsl:with-param name="TargetNode" 
										 select="$Form3468Data/EgyComBonusCrNotStsfdPctInd"/>
										<xsl:with-param name="BackupName">F3468EgyComBonusCrNotStsfdPctInd</xsl:with-param>
									</xsl:call-template>Yes, and section 48(a)(9)(B), 48E(a)(2)(A)(ii), or 48E(a)(2)(B)(ii)
									 is <b>not</b> satisfied (2% bonus).
								</label>
						</div>
						<!-- Line 10c -->
						<div style="width:187mm;">
							<div class="styLNLeftNumBox" style="padding-left:4mm;">c</div>
								<input type="checkbox" aira-label="DoesPropertyFacilityOrProjectQualifyNo" class="styCkbox">
									<xsl:call-template name="PopulateNoCheckbox">
										<xsl:with-param name="TargetNode" select="$Form3468Data/EgyComBonusCrNotQlfyInd"/>
										<xsl:with-param name="BackupName">F3468EgyComBonusCrNotQlfyInd</xsl:with-param>
									</xsl:call-template>
								</input>
								<label>
									<xsl:call-template name="PopulateLabelNo">
										<xsl:with-param name="TargetNode" 
										 select="$Form3468Data/EgyComBonusCrNotQlfyInd"/>
										<xsl:with-param name="BackupName">F3468EgyComBonusCrNotQlfyInd</xsl:with-param>
									</xsl:call-template>No
								</label>
						</div>
						<!-- Line 11 -->
						<div style="width:187mm;">
							<div class="styLNLeftNumBox" style="padding-left:2mm;">11</div>
							<div class="styLNDesc" style="width:170mm;height:7mm">
								Does the property, facility, or project qualify for the low-income communities bonus credit
								 under section 48(e)(2) or 48E(h)(2)? (The facility must have received an allocation of 
								 capacity limitation.)
							</div>
						</div>
						<!-- Line 11a -->
						<div style="width:187mm;">
							<div class="styLNLeftNumBox" style="padding-left:4mm;">a</div>
								<input type="checkbox" 
								   aria-label="FacilityLocatedInLow-IncomeCommunityYes " class="styCkbox">
									<xsl:call-template name="PopulateCheckbox">
										<xsl:with-param name="TargetNode" 
										 select="$Form3468Data/SolarWindCrComSect45DeInd"/>
										<xsl:with-param name="BackupName">F3468SolarWindCrComSect45DeInd</xsl:with-param>
									</xsl:call-template>
								</input>
								<label>
									<xsl:call-template name="PopulateLabelYes">
										<xsl:with-param name="TargetNode" 
										 select="$Form3468Data/SolarWindCrComSect45DeInd"/>
										<xsl:with-param name="BackupName">F3468SolarWindCrComSect45DeInd</xsl:with-param>
									</xsl:call-template>Yes, and the facility is located in a low-income community per 
									 section 45D(e) (10% bonus).
								</label>
						</div>
						<!-- Line 11b -->
						<div style="width:187mm;">
							<div class="styLNLeftNumBox" style="padding-left:4mm;">b</div>
								<input type="checkbox" 
								   aria-label="FacilityLocatedOnIndianLandYes" class="styCkbox">
									<xsl:call-template name="PopulateCheckbox">
										<xsl:with-param name="TargetNode" 
										 select="$Form3468Data/SolarWindCrComIndianLandInd"/>
										<xsl:with-param name="BackupName">F3468SolarWindCrComIndianLandInd</xsl:with-param>
									</xsl:call-template>
								</input>
								<label>
									<xsl:call-template name="PopulateLabelYes">
										<xsl:with-param name="TargetNode" 
										 select="$Form3468Data/SolarWindCrComIndianLandInd"/>
										<xsl:with-param name="BackupName">F3468SolarWindCrComIndianLandInd</xsl:with-param>
									</xsl:call-template>Yes, and the facility is located on Indian land per section 2601(2) 
									 of P.L. 102-486 (10% bonus).
								</label>
						</div>
						<!-- Line 11c -->
						<div style="width:187mm;">
							<div class="styLNLeftNumBox" style="padding-left:4mm;">c</div>
								<input type="checkbox" 
								   aria-label="facilityPartOfQualifiedLow-IincomeResidentialBuildingProjectYes"
								    class="styCkbox">
									<xsl:call-template name="PopulateCheckbox">
										<xsl:with-param name="TargetNode" 
										 select="$Form3468Data/SolarWindCrComRsdntlBldgInd"/>
										<xsl:with-param name="BackupName">F3468SolarWindCrComRsdntlBldgInd</xsl:with-param>
									</xsl:call-template>
								</input>
								<label>
									<xsl:call-template name="PopulateLabelYes">
										<xsl:with-param name="TargetNode" 
										 select="$Form3468Data/SolarWindCrComRsdntlBldgInd"/>
										<xsl:with-param name="BackupName">F3468SolarWindCrComRsdntlBldgInd</xsl:with-param>
									</xsl:call-template>Yes, and the facility is part of a qualified low-income residential
									 building project facility per section 48(e)(2)(B), or 48E(h)(2)(B)
								</label>
								<div style="width:187mm;">
									<div class="styLNLeftNumBox" style="padding-left:4mm;width:13mm;"></div>
									 (20% bonus).
								</div>
						</div>
						<!-- Line 11d -->
						<div style="width:187mm;">
							<div class="styLNLeftNumBox" style="padding-left:4mm;">d</div>
								<input type="checkbox" 
								   aria-label="facilityPartOfQualifiedLow-IncomeEconomicBenefitProjectYes" class="styCkbox">
									<xsl:call-template name="PopulateCheckbox">
										<xsl:with-param name="TargetNode" 
										 select="$Form3468Data/SolarWindCrComEconomicBnftInd"/>
										<xsl:with-param name="BackupName">F3468SolarWindCrComEconomicBnftInd</xsl:with-param>
									</xsl:call-template>
								</input>
								<label>
									<xsl:call-template name="PopulateLabelYes">
										<xsl:with-param name="TargetNode" 
										 select="$Form3468Data/SolarWindCrComEconomicBnftInd"/>
										<xsl:with-param name="BackupName">F3468SolarWindCrComEconomicBnftInd</xsl:with-param>
									</xsl:call-template>Yes, and the facility is part of a qualified low-income economic
									 benefit project facility per section 48(e)(2)(C), or 48E(h)(2)(c)
								</label>
								<div style="width:187mm;">
									<div class="styLNLeftNumBox" style="padding-left:4mm;width:13mm;"></div>
									 (20% bonus).
								</div>
						</div>
						<!-- Line 11e -->
						<div style="width:187mm;">
							<div class="styLNLeftNumBox" style="padding-left:4mm">e</div>
							<div class="styLNDesc" style="width:110mm;height:auto;padding-left:1mm">
                              If “Yes” to 11a, 11b, 11c, or 11d, enter your 48(e), or 48E(h) Control Number:
							</div>
							<span class="styUnderlineAmount" style="float:left; width:42mm;border-bottom-width:1px; 
							 text-align:left">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$Form3468Data/Section48eOr48EhControlNum"/>
								</xsl:call-template>
							</span>
						</div>
						<!-- Line 11f -->
						<div style="width:187mm;">
							<div class="styLNLeftNumBox" style="padding-left:4mm">f</div>
							<div class="styLNDesc" style="width:123mm;height:auto;padding-left:1mm">
                              Enter the originating pass-through entity’s employer identification number (EIN) (if
                               applicable):
							</div>
							<span class="styUnderlineAmount" style="float:left; width:15mm;border-bottom-width:1px; 
							 text-align:left">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$Form3468Data/OrigPassThruEntityEIN"/>
								</xsl:call-template>
							</span>
						</div>
						<!-- Line 11g -->
						<div style="width:187mm;">
							<div class="styLNLeftNumBox" style="padding-left:4mm;">g</div>
								<input type="checkbox" alt="no low incm community solar or wind facility" class="styCkbox">
									<xsl:call-template name="PopulateNoCheckbox">
										<xsl:with-param name="TargetNode" select="$Form3468Data/SolarWindCrComNotQlfyInd"/>
										<xsl:with-param name="BackupName">F3468SolarWindCrComNotQlfyInd</xsl:with-param>
									</xsl:call-template>
								</input>
								<label>
									<xsl:call-template name="PopulateLabelNo">
										<xsl:with-param name="TargetNode" 
										 select="$Form3468Data/SolarWindCrComNotQlfyInd"/>
										<xsl:with-param name="BackupName">F3468EgySolarWindCrComNotQlfyInd</xsl:with-param>
									</xsl:call-template>No
								</label>
						</div>	
					</div>
							<!-- Page Break and Footer-->
						<div class="styBB" style="width:187mm;clear:both;padding-top:0.4mm;border-top-width:2px;
						 border-bottom-width:0px">
							<div style="width:90mm;font-weight:bold;font-size:7pt" class="styGenericDiv">For Paperwork 
							 Reduction Act Notice, see separate instructions.</div>
							<div style="width:55mm;text-align:center;" class="styGenericDiv">Cat. No. 12276E</div>
							<div style="float:right;" class="styGenericDiv">Form <span class="styBoldText">3468</span> (2025)
							</div>
						</div>
						<br/>
						<div class="styStdDiv pageEnd"/>
						<div style="page-break-after:always"/>
						<div style="width:187mm;padding-top:1mm;float:left">
						  Form 3468 (2025)
							<span style="width:15mm;float:right;">Page 
								<span class="styBoldText" style="font-size:8pt;">2</span>
							</span>
						</div>
					<!-- Part I cont. -->
					<div class="styBB" style="width:187mm;border-top-width:1px;">
						<div class="styPartName" style="width:15mm;height:7mm; font-size:8pt;padding-top:2mm;">Part I</div>
						<div class="styPartDesc" style="width:170mm;height:auto;font-weight:normal;font-size:9pt;
						 padding-top:1mm">
					      <b>Information on Qualified Property or Qualified Facility</b> (see instructions) <i>(continued)</i>
					    </div>
					</div>
						<!-- Line 12 -->
						<div style="width:187mm;">
							<div class="styLNLeftNumBox" style="padding-left:2mm;">12</div>
							<div class="styLNDesc" style="width:170mm;">
							 Enter the nameplate capacity or storage capacity for your property, facility, or project.
							</div>
						</div>
						<!-- Line 12a -->
						<div style="width:187mm;">
							<div class="styLNLeftNumBox" style="padding-left:4mm;">a</div>
								<input type="checkbox" 
								   alt="solar energy nameplate capacity" class="styCkbox">
									<xsl:call-template name="PopulateCheckbox">
										<xsl:with-param name="TargetNode" 
										 select="$Form3468Data/SolarEnergyPropOrFacilityInd"/>
										<xsl:with-param name="BackupName">F3468DCSolarEnergyPropCapacityInd</xsl:with-param>
									</xsl:call-template>
								</input>
								<label>
									<xsl:call-template name="PopulateLabelYes">
										<xsl:with-param name="TargetNode" 
										 select="$Form3468Data/SolarEnergyPropOrFacilityInd"/>
										<xsl:with-param name="BackupName">F3468DCSolarEnergyPropCapacityInd</xsl:with-param>
									</xsl:call-template>Solar.
								</label>
						</div>
						<!-- Line 12a(i) -->
						<div style="width:187mm;">
							<div class="styLNLeftNumBox" style="padding-left:4mm;"></div>
							<div class="styLNLeftNumBox" style="width:5mm;padding-left:0mm;"><b>(i)</b></div>
							  Nameplate capacity:
								<div>
									<span class="styUnderlineAmount" style="float:left; width:40mm;border-bottom-width:1px; 
									 text-align:left">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" 
											 select="$Form3468Data/DCNameplateCapKWQty"/>
										</xsl:call-template>
									</span>
									<div class="styLNDesc" style="width:45mm;padding-top:1mm;padding-left:1mm;">
										kilowatt (kW) direct current (dc)
									</div>
								</div>
						</div>
						<!-- Line 12a(ii) -->
						<div style="width:187mm;">
							<div class="styLNLeftNumBox" style="padding-left:4mm;"></div>
							<div class="styLNLeftNumBox" style="width:5mm;padding-left:0mm;"><b>(ii)</b></div>
							  Nameplate capacity:
								<div>
									<span class="styUnderlineAmount" style="float:left; width:40mm;border-bottom-width:1px; 
									 text-align:left">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" 
											 select="$Form3468Data/ACNameplateCapKWQty"/>
										</xsl:call-template>
									</span>
									<div class="styLNDesc" style="width:45mm;padding-top:1mm;padding-left:1mm;">
										kW ac
									</div>
								</div>
						</div>
						<!-- Line 12a(iii) -->
						<div style="width:187mm;">
							<div class="styLNLeftNumBox" style="padding-left:4mm;"></div>
							<div class="styLNLeftNumBox" style="width:6mm;padding-left:0mm;"><b>(iii)</b></div>
							Check here if the solar energy property or facility includes a solar tracking device
						  <!--Dotted Line-->
							<span class="styDotLn" style="float:none;">...........</span>
								<input type="checkbox" 
								   alt="solar energy nameplate capacity" class="styCkbox">
									<xsl:call-template name="PopulateCheckbox">
										<xsl:with-param name="TargetNode" 
										 select="$Form3468Data/SolarTrackingDeviceInd"/>
										<xsl:with-param name="BackupName">F3468DCSolarEnergyPropCapacityInd</xsl:with-param>
									</xsl:call-template>
								</input>
								<label>
									<xsl:call-template name="PopulateLabelYes">
										<xsl:with-param name="TargetNode" 
										 select="$Form3468Data/DCSolarEnergyPropCapacityInd"/>
										<xsl:with-param name="BackupName">F3468DCSolarEnergyPropCapacityInd</xsl:with-param>
									</xsl:call-template>
								</label>
						</div>
						<!-- Line 12b -->
						<div style="width:187mm;">
							<div class="styLNLeftNumBox" style="padding-left:4mm;">b</div>
								<input type="checkbox" 
								   alt="small wind energy nameplate capacity" class="styCkbox">
									<xsl:call-template name="PopulateCheckbox">
										<xsl:with-param name="TargetNode" 
										 select="$Form3468Data/WindEnergyPropOrFacilityInd"/>
										<xsl:with-param name="BackupName">F3468DCSmallWindEnergyPropCapInd</xsl:with-param>
									</xsl:call-template>
								</input>
								<label>
									<xsl:call-template name="PopulateLabelYes">
										<xsl:with-param name="TargetNode" 
										 select="$Form3468Data/DCSmallWindEnergyPropCapInd"/>
										<xsl:with-param name="BackupName">F3468DCSmallWindEnergyPropCapInd</xsl:with-param>
									</xsl:call-template>Wind nameplate capacity:
								</label>
								<div>
									<span class="styUnderlineAmount" style="float:left; width:40mm;border-bottom-width:1px; 
									 text-align:left">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" 
											 select="$Form3468Data/ACNameplateCapWindEgyPropKWQty"/>
										</xsl:call-template>
									</span>
									<div class="styLNDesc" style="width:45mm;padding-top:1mm;
										padding-left:1mm;">
										kW ac
									</div>
								</div>
						</div>
						<!-- Line 12c -->
						<div style="width:187mm;">
							<div class="styLNLeftNumBox" style="padding-left:4mm;">c</div>
								<input type="checkbox" 
								   alt="storage capacity associated with facility" class="styCkbox">
									<xsl:call-template name="PopulateCheckbox">
										<xsl:with-param name="TargetNode" 
										 select="$Form3468Data/OtherEnergyPropOrFacilityInd"/>
										<xsl:with-param name="BackupName">F3468OtherEnergyPropOrFacilityInd</xsl:with-param>
									</xsl:call-template>
								</input>
								<label>
									<xsl:call-template name="PopulateLabelYes">
										<xsl:with-param name="TargetNode" 
										 select="$Form3468Data/OtherEnergyPropOrFacilityInd"/>
										<xsl:with-param name="BackupName">F3468OtherEnergyPropOrFacilityInd</xsl:with-param>
									</xsl:call-template>
								</label>Other.
						</div>
						<!-- Line 12c(i) -->
						<div style="width:187mm;">
							<div class="styLNLeftNumBox" style="padding-left:4mm;"></div>
							<div class="styLNLeftNumBox" style="width:5mm;padding-left:0mm;"><b>(i)</b></div>
							  Type:
								<div>
									<span class="styUnderlineAmount" style="float:left; width:125mm;border-bottom-width:1px; 
									 text-align:left;">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" 
											 select="$Form3468Data/PropOrFacilityTypeDesc"/>
										</xsl:call-template>
									</span>									
								</div>
						</div>
						<!-- Line 12c(ii) -->
						<div style="width:187mm;">
							<div class="styLNLeftNumBox" style="padding-left:4mm;"></div>
							<div class="styLNLeftNumBox" style="width:5mm;padding-left:0mm;"><b>(ii)</b></div>
							  Nameplate capacity:
								<div>
									<span class="styUnderlineAmount" style="float:left; width:40mm;border-bottom-width:1px; 
									 text-align:left">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" 
											 select="$Form3468Data/NameplateCapKWQty"/>
										</xsl:call-template>
									</span>
									<div class="styLNDesc" style="width:45mm;padding-top:1mm;padding-left:1mm;">
										kW
									</div>
								</div>
						</div>
						<!-- Line 12c(iii) -->
						<div style="width:187mm;">
							<div class="styLNLeftNumBox" style="padding-left:4mm;"></div>
							<div class="styLNLeftNumBox" style="width:6mm;padding-left:0mm;"><b>(iii)</b></div>
							Kilowatt type:
								<span class="styUnderlineAmount" style="float:none;width:10mm;border-bottom-width:1px; 
								 text-align:center">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" 
										 select="$Form3468Data/ElectricCurrentTypeCd"/>
									</xsl:call-template>
								</span>
						</div>
						<!-- Line 12d -->
						<div style="width:187mm;">
							<div class="styLNLeftNumBox" style="padding-left:4mm;">d</div>
								<input type="checkbox" 
								   alt="energy storage capacity rating" class="styCkbox">
									<xsl:call-template name="PopulateCheckbox">
										<xsl:with-param name="TargetNode" 
										 select="$Form3468Data/EnergyStorageInd"/>
										<xsl:with-param name="BackupName">F3468EnergyStorageInd</xsl:with-param>
									</xsl:call-template>
								</input>
								<label>
									<xsl:call-template name="PopulateLabelYes">
										<xsl:with-param name="TargetNode" 
										 select="$Form3468Data/EnergyStorageInd"/>
										<xsl:with-param name="BackupName">F3468EnergyStorageInd</xsl:with-param>
									</xsl:call-template>Energy storage.
								</label>
						</div>
						<!-- Line 12d(i) -->
						<div style="width:187mm;">
							<div class="styLNLeftNumBox" style="padding-left:4mm;"></div>
							<div class="styLNLeftNumBox" style="width:5mm;padding-left:0mm;"><b>(i)</b></div>
							  Power capacity rating:
								<div>
									<span class="styUnderlineAmount" style="float:left; width:40mm;border-bottom-width:1px; 
									 text-align:left">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" 
											 select="$Form3468Data/PowerCapacityRatingKWQty"/>
										</xsl:call-template>
									</span>
									<div class="styLNDesc" style="width:45mm;padding-top:1mm;padding-left:1mm;">
										kW
									</div>
								</div>
						</div>
						<!-- Line 12d(ii) -->
						<div style="width:187mm;">
							<div class="styLNLeftNumBox" style="padding-left:4mm;"></div>
							<div class="styLNLeftNumBox" style="width:5mm;padding-left:0mm;"><b>(ii)</b></div>
							  Energy storage capacity:
								<div>
									<span class="styUnderlineAmount" style="float:left; width:40mm;border-bottom-width:1px; 
									 text-align:left">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" 
											 select="$Form3468Data/EnergyStorageCapacityKWHQty"/>
										</xsl:call-template>
									</span>
									<div class="styLNDesc" style="width:45mm;padding-top:1mm;padding-left:1mm;">
										kilowatt-hours (kWh)
									</div>
								</div>
						</div>
						<!-- Line 12d(iii) -->
						<div style="width:187mm;">
							<div class="styLNLeftNumBox" style="padding-left:4mm;"></div>
							<div class="styLNLeftNumBox" style="width:6mm;padding-left:0mm;"><b>(iii)</b></div>
							Is the energy storage installed in connection with the solar or wind facility a thermal storage?
						  <!--Dotted Line-->
							<span class="styDotLn" style="float:none;">.......</span>
							<span style="width:.5mm"/>
								<input type="checkbox" aria-label="part of solar/wind thermal storageYes" class="styCkbox">
									<xsl:call-template name="PopulateYesCheckbox">
										<xsl:with-param name="TargetNode" 
										 select="$Form3468Data/ThermalStorSolarWindCnnctInd"/>
										<xsl:with-param name="BackupName">F3468ThermalStorSolarWindCnnctInd</xsl:with-param>
									</xsl:call-template>
								</input>
								<label>
									<xsl:call-template name="PopulateLabelYes">
										<xsl:with-param name="TargetNode" 
										 select="$Form3468Data/ThermalStorSolarWindCnnctInd"/>
										<xsl:with-param name="BackupName">F3468ThermalStorSolarWindCnnctInd</xsl:with-param>
									</xsl:call-template>Yes
								</label>
								<span style="width: 4mm"/>
								<input type="checkbox" aria-label="part of solar/wind thermal storageNo" class="styCkbox">
									<xsl:call-template name="PopulateNoCheckbox">
										<xsl:with-param name="TargetNode" 
										 select="$Form3468Data/ThermalStorSolarWindCnnctInd"/>
										<xsl:with-param name="BackupName">F3468ThermalStorSolarWindCnnctInd</xsl:with-param>
									</xsl:call-template>
								</input>
								<label>
									<xsl:call-template name="PopulateLabelNo">
										<xsl:with-param name="TargetNode" 
										 select="$Form3468Data/ThermalStorSolarWindCnnctInd"/>
										<xsl:with-param name="BackupName">F3468ThermalStorSolarWindCnnctInd</xsl:with-param>
									</xsl:call-template>No
								</label>
						</div>
						<!-- Line 12e -->
						<div style="width:187mm;">
							<div class="styLNLeftNumBox" style="padding-left:4mm;">e</div>
								<input type="checkbox" 
								   alt="N/A" class="styCkbox">
									<xsl:call-template name="PopulateCheckbox">
										<xsl:with-param name="TargetNode" 
										 select="$Form3468Data/NotApplicableInd"/>
										<xsl:with-param name="BackupName">F3468NotApplicableInd</xsl:with-param>
									</xsl:call-template>
								</input>
								<label>
									<xsl:call-template name="PopulateLabelYes">
										<xsl:with-param name="TargetNode" 
										 select="$Form3468Data/NotApplicableInd"/>
										<xsl:with-param name="BackupName">F3468NotApplicableInd</xsl:with-param>
									</xsl:call-template>Not applicable.
								</label>
						</div>
					<!-- Line 13 -->
					<div style="width:185mm;">
						<div class="styLNLeftNumBox" style="height:5mm;padding-left:2mm;padding-top:2mm">
						 13
						</div>
						<div class="styLNDesc" style="width:177mm;height:auto;">
						 Are you claiming the investment credit as a lessee based on a section 48(d) (as in effect on
						  November 4, 1990) election?
							<span>
								<xsl:call-template name="PopulateSpan">
									<xsl:with-param name="TargetNode" select="$Form3468Data/InvstCreditLesseeSect48dInd"/>
								</xsl:call-template>
								<input type="checkbox" aria-lable="investment credit based on sect 48(d) questionYes"
								 class="styCkbox">
									<xsl:call-template name="PopulateYesCheckbox">
										<xsl:with-param name="TargetNode" 
										 select="$Form3468Data/InvstCreditLesseeSect48dInd"/>
										<xsl:with-param name="BackupName">F3468InvstCreditLesseeSect48dInd</xsl:with-param>
									</xsl:call-template>
								</input>
								<label>
									<xsl:call-template name="PopulateLabelYes">
										<xsl:with-param name="TargetNode" 
										 select="$Form3468Data/InvstCreditLesseeSect48dInd"/>
										<xsl:with-param name="BackupName">F3468InvstCreditLesseeSect48dInd</xsl:with-param>
									</xsl:call-template>Yes
								</label>
							</span>
								<span style="width: 4mm"/>
							<span>
								<xsl:call-template name="PopulateSpan">
									<xsl:with-param name="TargetNode" select="$Form3468Data/InvstCreditLesseeSect48dInd"/>
								</xsl:call-template>
								<input type="checkbox" alt="investment credit based on sect 48(d) questionNo"
								 class="styCkbox">
									<xsl:call-template name="PopulateNoCheckbox">
										<xsl:with-param name="TargetNode" 
										 select="$Form3468Data/InvstCreditLesseeSect48dInd"/>
										<xsl:with-param name="BackupName">F3468InvstCreditLesseeSect48dInd</xsl:with-param>
									</xsl:call-template>
								</input>
								<label>
									<xsl:call-template name="PopulateLabelNo">
										<xsl:with-param name="TargetNode" 
										 select="$Form3468Data/InvstCreditLesseeSect48dInd"/>
										<xsl:with-param name="BackupName">F3468InvstCreditLesseeSect48dInd</xsl:with-param>
									</xsl:call-template>No
								</label>
							</span>
							<br/>
							If “Yes,” complete lines 14a through 14e. If you acquired more than one property as a lessee,
							 attach a statement showing the information below separately reported for each property.
						</div>
					</div>
					<!--  Line 13a  - 13e   -->					
						<div style="float:right">
							<xsl:call-template name="SetDynamicTableToggleButton">
								<xsl:with-param name="TargetNode" 
									select="$Form3468Data/InvstCreditLesseeSect48dGrp"/>
								<xsl:with-param name="containerHeight" select="5"/>
								<xsl:with-param name="containerID" select="'2aASctn'"/>
								<xsl:with-param name="imageID" select=" 'RETDimg' "/>
								<xsl:with-param name="buttonID" select=" 'RETDbtn' "/>
							</xsl:call-template>
						</div>
					<div class="styTableContainer" style="width: 187mm;height:auto;display:table;" id="2aASctn">
						<xsl:call-template name="SetInitialState"/>
						<table class="styTable" style="font-size: 7pt">
							<tbody>
								<xsl:if test="($Print != $Separated) or 
								 (count($Form3468Data/InvstCreditLesseeSect48dGrp) &lt;4)">
									<xsl:for-each 
									 select="$Form3468Data/InvstCreditLesseeSect48dGrp">
										<tr>
											<td style="text-align:left; border-bottom-width: 0px; border-left-width: 0px;
											 border-top-width: 0px; width: 187mm">
												<span class="styBoldText" style="padding-left:2mm">a</span>
												<span style="width: 2mm"/>Name of lessor:
											</td>
										</tr>
										<tr>
											<td class="styBB" style="width: 187mm; padding-left: 6mm">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" 
													select="LessorBusinessName/BusinessNameLine1Txt"/>
												</xsl:call-template>
												<br/>
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" 
													select="LessorBusinessName/BusinessNameLine2Txt"/>
												</xsl:call-template>
											</td>
										</tr>
										<!-- End Line 13a  -->
										<!--  Line 13b  -->
										<tr>
											<td style="text-align:left;border-bottom-width:0px;border-left-width:0px;
											 border-top-width: 0px">
												<span class="styBoldText" style="padding-left:2mm">b</span>
												<span style="width: 2mm"/>Address of lessor:
											</td>
										</tr>
										<tr>
											<xsl:choose>
												<xsl:when test="LessorUSAddress">
													<td class="styBB" style="width: 187mm; padding-left: 6mm">
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" 
															 select="LessorUSAddress/AddressLine1Txt"/>
														</xsl:call-template>
														<br/>
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" 
															 select="LessorUSAddress/AddressLine2Txt"/>
														</xsl:call-template>
														<br/>
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" 
															 select="LessorUSAddress/CityNm"/>
														</xsl:call-template>,
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" 
															 select="LessorUSAddress/StateAbbreviationCd"/>
														</xsl:call-template>
														<span style="width:1mm"></span>
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" 
															 select="LessorUSAddress/ZIPCd"/>
														</xsl:call-template>
													</td>
												</xsl:when>
												<xsl:otherwise>
													<td class="styBB" style="width: 187mm; padding-left: 6mm">
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" 
															 select="LessorForeignAddress/AddressLine1Txt"/>
														</xsl:call-template>
														<br/>
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" 
															 select="LessorForeignAddress/AddressLine2Txt"/>
														</xsl:call-template>
														<br/>
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" 
															 select="LessorForeignAddress/CityNm"/>
														</xsl:call-template>,
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" 
															 select="LessorForeignAddress/ProvinceOrStateNm"/>
														</xsl:call-template>
														<br/>
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" 
															 select="LessorForeignAddress/CountryCd"/>
														</xsl:call-template>,
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" 
															 select="LessorForeignAddress/ForeignPostalCd"/>
														</xsl:call-template>
													</td>
												</xsl:otherwise>	
											</xsl:choose>
										</tr>
										<!-- End Line 13b  -->
										<!--  Line 13c  -->
										<tr>
											<td style="text-align:left;border-bottom-width:0px;border-left-width:0px;
											 border-top-width: 0px; width: 187mm">
												<span class="styBoldText" style="padding-left:2mm">c</span>
												<span style="width: 2mm"/>Description of property:</td>
										</tr>
										<tr>
											<td class="styBB" style="width: 187mm; padding-left: 6mm">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="PropertyDesc"/>
												</xsl:call-template>
											</td>
										</tr>
										<!-- End Line 13c  -->
										<!--  Line 13d  -->
										<tr>
											<td style="text-align:left;border-bottom-width:0px;border-left-width:0px;
											 border-top-width: 0px; width: 187mm">
												<span class="styBoldText" style="padding-left:2mm">d</span>
												<span style="width: 2mm"/>Amount for which you were treated as having 
												 acquired the property
											</td>
										</tr>
										<tr>
											<td class="styBB" style="width: 187mm; padding-left: 6mm">
												<xsl:if test="position()=last()">
													<xsl:attribute name="style">width:187mm;padding-left:6mm;
													</xsl:attribute>
												</xsl:if>$
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" 
													select="TreatedAsAcquiredPropertyAmt"/>
												</xsl:call-template>
											</td>
										</tr>
										<!-- End Line 13d  -->
										<!--  Line 13e  -->
										<tr>
											<td style="text-align:left;border-bottom-width:0px;border-left-width:0px;
												 border-top-width: 0px; width: 187mm">
												<span class="styBoldText" style="padding-left:2mm">e</span>
												<span style="width: 2mm"/>Income inclusion amount reported for tax year 
												under Regulations section 1.50-1
											</td>
										</tr>
										<tr>
											<td class="styBB" style="width: 187mm; padding-left: 6mm">
												<xsl:if test="position()=last()">
													<xsl:attribute name="style">width:187mm;padding-left:6mm;
													</xsl:attribute>
												</xsl:if>$
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" 
													 select="Sect48dCreditRegs1501InclsnAmt"/>
												</xsl:call-template>
											</td>
										</tr>
										<!-- End Line 13e  -->
									</xsl:for-each>
								</xsl:if>
								<xsl:if test="(count($Form3468Data/InvstCreditLesseeSect48dGrp)=0) or 
								(($Print = $Separated) and 
									(count($Form3468Data/InvstCreditLesseeSect48dGrp) &gt;1))">
									<tr>
										<td style="text-align:left; border-bottom-width: 0px; border-left-width: 0px; 
										 border-top-width: 0px; width: 187mm">
											<span class="styBoldText" style="padding-left:2mm">a</span>
											<span style="width: 2mm"/>Name of lessor:
										</td>
									</tr>
									<tr>
										<td class="styBB" style="width: 187mm; padding-left: 6mm; padding-top: 4mm">
											<span class="styTableCellPad"/>
											<xsl:call-template name="PopulateAdditionalDataTableMessage">
												<xsl:with-param name="TargetNode" 
												 select="$Form3468Data/InvstCreditLesseeSect48dGrp/LessorBusinessName/
												  BusinessNameLine1Txt"/>
											</xsl:call-template>
										</td>
									</tr>
									<!-- End Line 13a  -->
									<!--  Line 13b  -->
									<tr>
										<td style="text-align:left; border-bottom-width: 0px; border-left-width: 0px; 
										 border-top-width: 0px; padding-top: 1mm">
											<span class="styBoldText" style="padding-left:2mm">b</span>
											<span style="width: 2mm"/>Address of lessor:
										</td>
									</tr>
									<tr>
										<td class="styBB" style="width: 187mm; padding-left: 6mm; padding-top: 4mm">
											<span class="styTableCellPad"/>
											<xsl:call-template name="PopulateAdditionalDataTableMessage">
												<xsl:with-param name="TargetNode" 
													select="$Form3468Data/InvstCreditLesseeSect48dGrp"/>
											</xsl:call-template>
										</td>
									</tr>
									<!-- End Line 13b  -->
									<!--  Line 13c  -->
									<tr>
										<td style="text-align:left; border-bottom-width: 0px; border-left-width: 0px; 
										 border-top-width: 0px; width: 187mm; padding-top: 1mm">
											<span class="styBoldText" style="padding-left:2mm">c</span>
											<span style="width: 2mm"/>Description of property:
										</td>
									</tr>
									<tr>
										<td class="styBB" style="width: 187mm; padding-left: 6mm; padding-top: 4mm">
											<span class="styTableCellPad"/>
											<xsl:call-template name="PopulateAdditionalDataTableMessage">
												<xsl:with-param name="TargetNode" 
													select="$Form3468Data/InvstCreditLesseeSect48dGrp"/>
											</xsl:call-template>
										</td>
									</tr>
									<!-- End Line 13c  -->
									<!--  Line 13d  -->
									<tr>
										<td style="text-align:left; border-bottom-width: 0px; border-left-width: 0px; 
										 border-top-width: 0px; width: 187mm; padding-top: 1mm">
											<span class="styBoldText" style="padding-left:2mm">d</span>
											<span style="width: 2mm"/>Amount for which you were treated as having 
											acquired the property
										</td>
									</tr>
									<tr>
										<td class="styBB" style="width: 187mm; padding-left: 6mm;padding-top:5mm">
											<span class="styTableCellPad"/>
											<xsl:call-template name="PopulateAdditionalDataTableMessage">
												<xsl:with-param name="TargetNode" 
													select="$Form3468Data/InvstCreditLesseeSect48dGrp"/>
												</xsl:call-template>
											</td>
										</tr>
									<!-- End Line 13d  -->
									<!--  Line 13e  -->
									<tr>
										<td style="text-align:left; border-bottom-width: 0px; border-left-width: 0px; 
										 border-top-width: 0px; width: 187mm; padding-top: 1mm">
											<span class="styBoldText" style="padding-left:2mm">e</span>
											<span style="width: 2mm"/>Income inclusion amount reported for tax year under 
											 Regulations section 1.50-1
										</td>
									</tr>
									<tr>
										<td class="styBB" style="width: 187mm; padding-left: 6mm;padding-top:5mm">
											<span class="styTableCellPad"/>
											<xsl:call-template name="PopulateAdditionalDataTableMessage">
												<xsl:with-param name="TargetNode" 
													select="$Form3468Data/InvstCreditLesseeSect48dGrp"/>
											</xsl:call-template>
										</td>
									</tr>
									<!-- End Line 13e  -->
								</xsl:if>
							</tbody>
						</table>
					</div>
					<xsl:if test="($Print != $Separated) and (count($Form3468Data/InvstCreditLesseeSect48dGrp) &gt;1)">
						<xsl:call-template name="SetInitialDynamicTableHeight">
							<xsl:with-param name="TargetNode" select="$Form3468Data/InvstCreditLesseeSect48dGrp"/>
							<xsl:with-param name="containerHeight" select="1"/>
							<xsl:with-param name="containerID" select="'2aASctn'"/>
						</xsl:call-template>			
					</xsl:if>
					<!-- Start of Part II Sect A -->
					<div class="styBB" style="width:187mm;border-top-width:1px;">
						<div class="styPartName" style="width:15mm;height:5mm; font-size:8pt;padding-top:1mm;">Part II
						</div>
						<div class="styPartDesc" style="width:170mm; height:auto; font-weight:bold;font-size:9pt;
						 padding-top:1mm">Qualifying Advanced Coal Project Credit and Qualifying Gasification Project
						  Credit 
						</div>
					</div>
					<div class="styBB" style="width:187mm;border-top-width:1px;">
						<div class="styPartDesc" style="width:170mm; height:auto; font-weight:normal;font-size:9pt;
						 padding-left:0mm;padding-top:1mm"><b>Section A—Qualifying Advanced Coal Project Credit Under 
						 Section 48A</b> (see instructions)
						</div>
					</div>
					<!-- Start of Line 1a -->
					<div style="width:187mm;font-size:8pt">
						<div class="styLNLeftNumBox" style="height:1mm;padding-left:2mm">1a</div>
						<div class="styLNDesc" style="width:73mm;height:7.5mm;padding-left:2mm">
						 Enter the qualified investment in integrated gasification combined cycle property placed in 
						 service during the tax year for projects described in section 48A(d)(3)(B)(i)
						  <!--Dotted Line-->
						  <span class="styDotLn" style="float:right;">........</span>
						</div>
						<div class="styLNRightNumBox" style="height:14mm;padding-top:10.5mm">1a</div>
						<div class="styLNAmountBox" style="width:27mm;height:14mm;padding-top:10.5mm;font-size:8pt">
							<xsl:call-template name="PopulateAmount">
							  <xsl:with-param name="TargetNode" select="$Form3468Data/InvstIntgrtGasCombCycPropAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;height:14mm;
						 border-right-width:0mm"/>
						<div class="styLNAmountBox" style="width:27mm;height:14mm;border-bottom-width:0px;"/>      
						<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;height:14mm;
						  padding-top:3.5mm;border-left-width:1px;border-right-width:0px;"/>  
						<div class="styLNAmountBox" style="width:27mm;height:14mm;border-left-width:1px;
						  border-bottom-width:0px;"/>
					</div>
					<!-- End of 1a -->
					<!-- Line 1b -->
					<div style="width:187mm;font-size:8pt">
						<div class="styLNLeftNumBox" style="height:6mm;padding-top:2mm;padding-left:4mm">b</div>
						<div class="styLNDesc" style="width:108mm;height:6mm;padding-top:2mm;padding-left:2mm;">
						  <span style="text-align:left;">Multiply line 1a by 20% (0.20)</span>
						  <!--Dotted Line-->
						  <span class="styDotLn" style="float:right;">...............</span>
						</div>
						<div class="styLNRightNumBox" style="height:6mm;padding-top: 2.5mm;">1b</div>
						<div class="styLNAmountBox" style="width:27mm;height:6mm;padding-top:2.5mm">
						  <xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$Form3468Data/CalcGasCombCycPropInvstCrAmt"/>
						  </xsl:call-template>
						</div>
						 <div class="styLNRightNumBoxNBB" style="background-color:lightgrey;height:6mm;"/>  
						 <div class="styLNAmountBox" style="width:27mm;height:6mm;border-left-width:1px;
						  border-bottom-width:0px;"/>  
					</div>
					<!-- End of 1b -->
					<!-- Start of Line 2a -->
					<div style="width:187mm;font-size:8pt">
						<div class="styLNLeftNumBox" style="height:1mm;padding-left:2mm">2a</div>
						<div class="styLNDesc" style="width:73mm;height:7.5mm;padding-left:2mm">
						 Enter the qualified investment in advanced coal-based generation technology property placed in 
						 service during the tax year for projects described in section 48A(d)(3)(B)(ii)
						  <!--Dotted Line-->
						  <span class="styDotLn" style="float:right;">........</span>
						</div>
						<div class="styLNRightNumBox" style="height:14mm;padding-top:10.5mm">2a</div>
						<div class="styLNAmountBox" style="width:27mm;height:14mm;padding-top:10.5mm;font-size:8pt">
							<xsl:call-template name="PopulateAmount">
							  <xsl:with-param name="TargetNode" select="$Form3468Data/AdvancedCoalBaseTechnologyAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;height:14mm;
						 border-right-width:0mm"/>
						<div class="styLNAmountBox" style="width:27mm;height:14mm;border-bottom-width:0px;"/>      
						<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;height:14mm;
						  padding-top:3.5mm;border-left-width:1px;border-right-width:0px;"/>  
						<div class="styLNAmountBox" style="width:27mm;height:14mm;border-left-width:1px;
						  border-bottom-width:0px;"/>
					</div>
					<!-- End of 2a -->
					<!-- Line 2b -->
					<div style="width:187mm;font-size:8pt">
						<div class="styLNLeftNumBox" style="height:6mm;padding-top:2mm;padding-left:4mm">b</div>
						<div class="styLNDesc" style="width:108mm;height:6mm;padding-top:2mm;padding-left:2mm;">
						  <span style="text-align:left;">Multiply line 2a by 15% (0.15)</span>
						  <!--Dotted Line-->
						  <span class="styDotLn" style="float:right;">...............</span>
						</div>
						<div class="styLNRightNumBox" style="height:6mm;padding-top: 2.5mm;">2b</div>
						<div class="styLNAmountBox" style="width:27mm;height:6mm;padding-top: 2.5mm">
						  <xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$Form3468Data/CalcAdvancedCoalBaseTechAmt"/>
						  </xsl:call-template>
						</div>
						 <div class="styLNRightNumBoxNBB" style="background-color:lightgrey;height:6mm;"/>  
						 <div class="styLNAmountBox" style="width:27mm;height:6mm;border-left-width:1px;
						  border-bottom-width:0px;"/>  
					</div>
					<!-- End of 2b -->
					<!-- Start of Line 3a -->
					<div style="width:187mm;font-size:8pt">
						<div class="styLNLeftNumBox" style="height:1mm;padding-left:2mm">3a</div>
						<div class="styLNDesc" style="width:73mm;height:7.5mm;padding-left:2mm">
						 Enter the qualified investment in advanced coal-based generation technology property placed in 
						 service during the tax year for projects described in section 48A(d)(3)(B)(iii)
						  <!--Dotted Line-->
						  <span class="styDotLn" style="float:right;">.......</span>
						</div>
						<div class="styLNRightNumBox" style="height:14mm;padding-top:10.5mm">3a</div>
						<div class="styLNAmountBox" style="width:27mm;height:14mm;padding-top:10.5mm;font-size:8pt">
							<xsl:call-template name="PopulateAmount">
							  <xsl:with-param name="TargetNode" select="$Form3468Data/QlfyAdvCoalBasedTechAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;height:14mm;
						 border-right-width:0mm"/>
						<div class="styLNAmountBox" style="width:27mm;height:14mm;border-bottom-width:0px;"/>      
						<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;height:14mm;
						  padding-top:3.5mm;border-left-width:1px;border-right-width:0px;"/>  
						<div class="styLNAmountBox" style="width:27mm;height:14mm;border-left-width:1px;
						  border-bottom-width:0px;"/>
					</div>
					<!-- End of 3a -->
					<!-- Line 3b -->
					<div style="width:187mm;font-size:8pt">
						<div class="styLNLeftNumBox" style="height:6mm;padding-top:2mm;padding-left:4mm">b</div>
						<div class="styLNDesc" style="width:108mm;height:6mm;padding-top:2mm;padding-left:2mm;">
						  <span style="text-align:left;">Multiply line 3a by 30% (0.30)</span>
						  <!--Dotted Line-->
						  <span class="styDotLn" style="float:right;">...............</span>
						</div>
						<div class="styLNRightNumBoxNBB" style="height:6mm;padding-top: 2.5mm;">3b</div>
						<div class="styLNAmountBox" style="width:27mm;height:6mm;padding-top:2.5mm;
						 border-bottom-width:0px">
						  <xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$Form3468Data/CalcAdvCoalBasedTechAmt"/>
						  </xsl:call-template>
							</div>
						 <div class="styLNRightNumBoxNBB" style="background-color:lightgrey;height:6mm;"/>  
						 <div class="styLNAmountBox" style="width:27mm;height:6mm;border-left-width:1px;
						  border-bottom-width:0px;"/>  
					</div>
					<!-- End of 3b -->
					<!-- Start of Part II Sect B -->
					<div class="styBB" style="width:187mm;border-top-width:2px;">
						<div class="styPartDesc" style="width:170mm; height:auto; font-weight:normal;font-size:9pt;
						 padding-left:0mm;padding-top:1mm">
						 <b>Section B—Qualifying Gasification Project Credit Under Section 48B</b> (see instructions)
						</div>
					</div>
					<!-- Start of Line 4a -->
					<div style="width:187mm;font-size:8pt">
						<div class="styLNLeftNumBox" style="height:22mm;padding-left:2mm">4a</div>
						<div class="styLNDesc" style="width:73mm;height:7.5mm;padding-left:2mm">
						 Enter the qualified investment in qualified gasification property placed in service during the
						  tax year for which credits were allocated or reallocated after October 3, 2008, and that 
						  includes equipment that separates and sequesters at least 75% of the project’s carbon dioxide
						  emissions
						  <!--Dotted Line-->
						  <span class="styDotLn" style="float:right;">..........</span>
						</div>
						<div class="styLNRightNumBox" style="height:24mm;padding-top:20mm">4a</div>
						<div class="styLNAmountBox" style="width:27mm;height:24mm;padding-top:20mm;;font-size:8pt">
							<xsl:call-template name="PopulateAmount">
							  <xsl:with-param name="TargetNode" select="$Form3468Data/QlfyGasificationPropBssAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;height:24mm;
						 border-right-width:0mm"/>
						<div class="styLNAmountBox" style="width:27mm;height:24mm;border-bottom-width:0px;"/>      
						<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;height:24mm;
						  padding-top:3.5mm;border-left-width:1px;border-right-width:0px;"/>  
						<div class="styLNAmountBox" style="width:27mm;height:24mm;border-left-width:1px;
						  border-bottom-width:0px;"/>
					</div>
					<!-- End of 4a -->
					<!-- Line 4b -->
					<div style="width:187mm;font-size:8pt">
						<div class="styLNLeftNumBox" style="height:6mm;padding-top:2mm;padding-left:4mm">b</div>
						<div class="styLNDesc" style="width:108mm;height:6mm;padding-top:2mm;padding-left:2mm;">
						  <span style="text-align:left;">Multiply line 4a by 30% (0.30)</span>
						  <!--Dotted Line-->
						  <span class="styDotLn" style="float:right;">...............</span>
						</div>
						<div class="styLNRightNumBoxNBB" style="height:6mm;padding-top: 2mm;">4b</div>
						<div class="styLNAmountBox" style="width:27mm;height:6mm;padding-top:2mm;">
						  <xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$Form3468Data/CalcQlfyGasificationPropBssAmt"/>
						  </xsl:call-template>
						</div>
						 <div class="styLNRightNumBoxNBB" style="background-color:lightgrey;height:6mm;"/>  
						 <div class="styLNAmountBox" style="width:27mm;height:6mm;border-left-width:1px;
						  border-bottom-width:0px;"/>  
					</div>
					<!-- End of 4b -->
					<!-- Start of Line 5a -->
					<div style="width:187mm;font-size:8pt">
						<div class="styLNLeftNumBox" style="height:1mm;padding-left:2mm">5a</div>
						<div class="styLNDesc" style="width:73mm;height:7.5mm;padding-left:2mm">
						 Enter the qualified investment in property other than in line 4a above placed in service 
						 during the tax year
						  <!--Dotted Line-->
						  <span class="styDotLn" style="float:right;">..............</span>
						</div>
						<div class="styLNRightNumBox" style="height:11mm;padding-top:7.5mm">5a</div>
						<div class="styLNAmountBox" style="width:27mm;height:11mm;padding-top:7.5mm;;font-size:8pt">
							<xsl:call-template name="PopulateAmount">
							  <xsl:with-param name="TargetNode" select="$Form3468Data/OtherQlfyInvstPropertyBasisAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;height:11mm;
						 border-right-width:0mm"/>
						<div class="styLNAmountBox" style="width:27mm;height:11mm;border-bottom-width:0px;"/>      
						<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;height:11mm;
						  padding-top:3.5mm;border-left-width:1px;border-right-width:0px;"/>  
						<div class="styLNAmountBox" style="width:27mm;height:11mm;border-left-width:1px;
						  border-bottom-width:0px;"/>
					</div>
					<!-- End of 5a -->
					<!-- Line 5b -->
					<div style="width:187mm;font-size:8pt">
						<div class="styLNLeftNumBox" style="height:6mm;padding-top:2mm;padding-left:4mm">b</div>
						<div class="styLNDesc" style="width:108mm;height:6mm;padding-top:2mm;padding-left:2mm;">
						  <span style="text-align:left;">Multiply line 5a by 20% (0.20)</span>
						  <!--Dotted Line-->
						  <span class="styDotLn" style="float:right;">...............</span>
						</div>
						<div class="styLNRightNumBox" style="height:6mm;padding-top: 2mm;">5b</div>
						<div class="styLNAmountBox" style="width:27mm;height:6mm;padding-top:2mm;">
						  <xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$Form3468Data/CalcOtherQlfyInvstPropCrAmt"/>
						  </xsl:call-template>
						</div>
						 <div class="styLNRightNumBoxNBB" style="background-color:lightgrey;height:6mm;"/>  
						 <div class="styLNAmountBox" style="width:27mm;height:6mm;border-left-width:1px;
						  border-bottom-width:0px;"/>  
					</div>
					<!-- End of 5b -->
					<!-- Line 6 -->
					<div style="width:187mm;font-size:8pt;">
						<div class="styLNLeftNumBox" style="height:7.5mm;padding-top:2.5mm;padding-left:2mm">6</div>
						<div class="styLNDesc" style="width:108mm;height:9mm;padding-top:2.5mm;padding-left:2mm;">
						  Enter the applicable unused investment credit from cooperatives. See instructions
						  <!--Dotted Line-->
						  <span class="styDotLn" style="float:right;">.....................</span>
						</div>
						<div class="styLNRightNumBox" style="height:9mm;padding-top: 5mm;">6</div>
						<div class="styLNAmountBox" style="width:27mm;height:9mm;padding-top:5mm;">
						  <xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$Form3468Data/UnusedCoopInvstGsfcnProjCrAmt"/>
						  </xsl:call-template>
						</div>
						 <div class="styLNRightNumBoxNBB" style="background-color:lightgrey;height:9mm;"/>  
						 <div class="styLNAmountBox" style="width:27mm;height:9mm;border-left-width:1px;
						  border-bottom-width:0px;"/>  
					</div>
					<!-- End of 6 -->
					<!--Line 7 -->
					<div style="width:187mm;font-size:8pt">
						<div class="styLNLeftNumBox" style="height:7.5mm;padding-top:4mm;padding-left:2mm">7</div>
						<div class="styLNDesc" style="width:143mm;height:7.5mm;padding-top:5mm;padding-left:2mm;">
						  Add lines 1b, 2b, 3b, 4b, 5b, and 6. Report this amount on Form 3800, Part III, line 1a
						  <!--Dotted Line-->
						  <span class="styDotLn" style="float:right;">....</span>						  
						</div>
						<div class="styLNRightNumBoxNBB" style="height:9mm;padding-top:5.5mm">7</div>  
						<div class="styLNAmountBox" style="width:27mm;height:9mm;padding-top:5.5mm;border-left-width:1px;
						 border-bottom-width:0px;font-size:8pt;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form3468Data/TotAdvncCoalAndGsfctnCrAmt"/>
							</xsl:call-template>
						</div>  
					</div>
					<!-- End of 7 -->
					<!-- Page Break and Footer-->
					<div class="styBB" style="width:187mm;clear:both;padding-top:0.4mm;border-top-width:2px;
					 border-bottom-width:0px">
						<!--<div style="width:90mm;font-weight:bold;font-size:7pt" class="styGenericDiv">For Paperwork 
						 Reduction Act Notice, see separate instructions.</div>
						<div style="width:55mm;text-align:center;" class="styGenericDiv">Cat. No. 12276E</div>-->
						<div style="float:right;" class="styGenericDiv">Form <span class="styBoldText">3468</span> (2025)
						</div>
					</div>
					<br/>
					<div class="styStdDiv pageEnd"/>
					<div style="page-break-after:always"/>
					<div style="width:187mm;padding-top:1mm;float:left">
					  Form 3468 (2025)
						<span style="width:15mm;float:right;">Page 
							<span class="styBoldText" style="font-size:8pt;">3</span>
						</span>
					</div>
					<!-- Start of Part III -->
					<div class="styBB" style="width:187mm;border-top-width:1px;">
						<div class="styPartName" style="width:15mm;height:5mm; font-size:8pt;padding-top:1mm;">Part III
						</div>
						<div class="styPartDesc" style="width:170mm; height:auto; font-weight:normal;font-size:9pt;
						 padding-left:2mm;padding-top:1mm">
						 <b>Qualifying Advanced Energy Project Credit Under Section 48C</b> (see instructions) 
						</div>
					</div>
					<div class="styBB" style="width:187mm;border-top-width:0px;">
						<div class="styPartDesc" style="width:186mm; height:auto; font-weight:normal;font-size:8pt;
						 padding-left:0mm;padding-top:1mm"><b>Caution:</b> You cannot claim any investment credits for a 
						 facility or property under section 48C if you also claimed credits under section 45X.
						</div>
					</div>
					<!-- Start of Line 1a -->
					<div style="width:187mm;font-size:8pt">
						<div class="styLNLeftNumBox" style="height:1mm;padding-left:2mm">1a</div>
						<div class="styLNDesc" style="width:73mm;height:7.5mm;padding-left:2mm">
						 Enter the qualified investment in advanced energy project property placed in service during the
						 tax year
						  <!--Dotted Line-->
						  <span class="styDotLn" style="float:right;">.............</span>
						</div>
						<div class="styLNRightNumBox" style="height:11mm;padding-top:7mm">1a</div>
						<div class="styLNAmountBox" style="width:27mm;height:11mm;padding-top:7.5mm;font-size:8pt">
							<xsl:call-template name="PopulateAmount">
							  <xsl:with-param name="TargetNode" select="$Form3468Data/QlfyInvAdvncEnergyProjPropAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;height:11mm;
						 border-right-width:0mm"/>
						<div class="styLNAmountBox" style="width:27mm;height:11mm;border-bottom-width:0px;"/>      
						<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;height:11mm;
						  padding-top:3.5mm;border-left-width:1px;border-right-width:0px;"/>  
						<div class="styLNAmountBox" style="width:27mm;height:11mm;border-left-width:1px;
						  border-bottom-width:0px;"/>
					</div>
					<!-- End of 1a -->
					<!-- Start of Line 1b -->
					<div style="width:187mm;font-size:8pt">
						<div class="styLNLeftNumBox" style="height:1mm;padding-left:4mm">b</div>
						<div class="styLNDesc" style="width:73mm;height:7.5mm;padding-left:2mm">
						 If you checked the box in Part I, line 8a, and it’s consistent with your 48C application per
						 Notice 2023-18, enter 30%. If you checked the box in Part I, line 8c, enter 6%
						  <!--Dotted Line-->
							<span class="styDotLn" style="float:right;">........</span>
						</div>
						<div class="styLNRightNumBox" style="height:14mm;padding-top:10mm">b</div>
						<div class="styLNAmountBox" style="width:27mm;height:14mm;padding-top:10.5mm;font-size:8pt">
							<xsl:call-template name="PopulateAmount">
							  <xsl:with-param name="TargetNode" select="$Form3468Data/QlfyInvAdvncEgyProjProp48CPct"/>
							</xsl:call-template>%
						</div>
						<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;height:14mm;
						 border-right-width:0mm"/>
						<div class="styLNAmountBox" style="width:27mm;height:14mm;border-bottom-width:0px;"/>      
						<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;height:14mm;
						  padding-top:3.5mm;border-left-width:1px;border-right-width:0px;"/>  
						<div class="styLNAmountBox" style="width:27mm;height:14mm;border-left-width:1px;
						  border-bottom-width:0px;"/>
					</div>
					<!-- End of 1b -->
					<!-- Line 1c -->
					<div style="width:187mm;font-size:8pt">
						<div class="styLNLeftNumBox" style="height:7.5mm;padding-top:3.5mm;padding-left:4mm">c</div>
						<div class="styLNDesc" style="width:108mm;height:7.5mm;padding-top:3.5mm;padding-left:2mm;">
						  <span style="text-align:left;">Multiply line 1a by line 1b</span>
						  <!--Dotted Line-->
						  <span class="styDotLn" style="float:right;">...............</span>
						</div>
						<div class="styLNRightNumBox" style="height:7.5mm;padding-top: 3.5mm;">c</div>
						<div class="styLNAmountBox" style="width:27mm;height:7.5mm;padding-top:3.5mm;font-size:8pt;">
						  <xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$Form3468Data/CalcQlfyInvAdvncEgyProjPropAmt"/>
						  </xsl:call-template>
						</div>
						 <div class="styLNRightNumBoxNBB" style="background-color:lightgrey;height:7.5mm;"/>  
						 <div class="styLNAmountBox" style="width:27mm;height:7.5mm;border-left-width:1px;
						  border-bottom-width:0px;"/>  
					</div>
					<!-- End of 1c -->
					<!-- Line 1d -->
					<div style="width:187mm;font-size:8pt">
						<div class="styLNLeftNumBox" style="height:4mm;padding-bottom:.5mm;padding-left:4mm">d</div>
						<div class="styLNDesc" style="width:108mm;height:4mm;">
						  <span style="float:left;padding-left:2mm;">Enter your 48C Allocation control number </span>
							<span class="styFixedUnderline" style="width:40mm;padding-top:.1mm;padding-bottom:0mm;
								text-align:center">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" 
									 select="$Form3468Data/Sect48CAllocationControlNum"/>
								</xsl:call-template>
							</span>						  
						</div>
						<div class="styLNRightNumBoxNBB" style="height:5mm;background-color:lightgrey"></div>
						<div class="styLNAmountBox" style="width:27mm;height:5mm;border-bottom-width:0mm"></div>
						<div class="styLNRightNumBoxNBB" style="border-right-width:1px;
						 background-color:lightgrey;height:5mm;width:8.3mm"/>
					</div>
					<!-- End of 1d -->
					<!-- Line 1e -->
					<div style="width:187mm;height:6mm;font-size:7pt;">
						<div class="styLNLeftNumBox" style="height:5mm;padding-left:4mm;padding-top:2mm">e</div>
							<div class="styLNDesc" style="width:108mm;height:3mm;padding-left:2mm">
							 Is the facility in a section 48C energy community census tract?
								<span>
									<xsl:call-template name="PopulateSpan">
										<xsl:with-param name="TargetNode" select="$Form3468Data/Sect48CEnergyComFacilityInd"/>
									</xsl:call-template>
										<input type="checkbox" aria-label="Sect48CEnergyComFacilityIndYes" class="styCkbox">
											<xsl:call-template name="PopulateYesCheckbox">
												<xsl:with-param name="TargetNode" 
												 select="$Form3468Data/Sect48CEnergyComFacilityInd"/>
												<xsl:with-param name="BackupName">3468Sect48CEnergyComFacilityInd
												</xsl:with-param>
											</xsl:call-template>
										</input>
									<label>
										<xsl:call-template name="PopulateLabelYes">
											<xsl:with-param name="TargetNode" 
											 select="$Form3468Data/ExistingFacilityExpansionInd"/>
											<xsl:with-param name="BackupName">3468Sect48CEnergyComFacilityInd
											</xsl:with-param>
										</xsl:call-template>Yes
									</label>
								</span>
									<span style="width: 4mm"/>
								<span>
									<xsl:call-template name="PopulateSpan">
										<xsl:with-param name="TargetNode" select="$Form3468Data/Sect48CEnergyComFacilityInd"/>
									</xsl:call-template>
										<input type="checkbox" aria-label="Sect48CEnergyComFacilityIndNo" class="styCkbox">
											<xsl:call-template name="PopulateNoCheckbox">
												<xsl:with-param name="TargetNode" 
												 select="$Form3468Data/Sect48CEnergyComFacilityInd"/>
												<xsl:with-param name="BackupName">3468Sect48CEnergyComFacilityInd
												</xsl:with-param>
											</xsl:call-template>
										</input>
									<label>
										<xsl:call-template name="PopulateLabelNo">
											<xsl:with-param name="TargetNode" 
											 select="$Form3468Data/Sect48CEnergyComFacilityInd"/>
											<xsl:with-param name="BackupName">3468Sect48CEnergyComFacilityInd
											</xsl:with-param>
										</xsl:call-template>No
									</label>
								</span>	
							</div>
						<div class="styLNRightNumBoxNBB" style="height:6mm;background-color:lightgrey"></div>
						<div class="styLNAmountBoxNBB" style="width:27mm;height:6mm;"></div>
						<div class="styLNRightNumBoxNBB" style="border-right-width:1px;
						 background-color:lightgrey;height:6mm;width:8.3mm"/>
						</div>
					<!-- End of 1e -->
					<!-- Line 1f -->
					<div style="width:187mm">
						<div class="styLNLeftNumBox" style="height:4mm;padding-bottom:.5mm;padding-left:4mm">f</div>
						<div class="styLNDesc" style="width:108mm;height:4mm;">
						  <span style="float:left;padding-left:2mm;">Enter the originating pass-through entity’s EIN (if
						   applicable):</span>
							<span class="styFixedUnderline" style="width:25mm;padding-top:.1mm;padding-bottom:0mm;
								text-align:center">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" 
									 select="$Form3468Data/OrigPassThroughEntityEIN"/>
								</xsl:call-template>
							</span>						  
						</div>
						<div class="styLNRightNumBoxNBB" style="height:4mm;background-color:lightgrey"></div>
						<div class="styLNAmountBoxNBB" style="width:27mm;height:4mm;"></div>
						<div class="styLNRightNumBoxNBB" style="border-right-width:1px;
						 background-color:lightgrey;height:4mm;width:8.3mm"/>
					</div>
					<!-- End of 1d -->
					<!-- Line 2 -->
					<div style="width:187mm;font-size:8pt">
						<div class="styLNLeftNumBox" style="height:7.5mm;padding-top:3.5mm;padding-left:2mm">2</div>
						<div class="styLNDesc" style="width:108mm;height:9mm;padding-top:3mm;padding-left:2mm;">
						  Enter the applicable unused investment credit from cooperatives. 
						   See instructions
							<!--Dotted Line-->
							<div class="styDotLn" style="float:none;padding-right:1mm;">...................</div>
						</div>
						<div class="styLNRightNumBox" style="height:9mm;padding-top:5mm;">2</div>
						<div class="styLNAmountBox" style="width:27mm;height:9mm;padding-top:5mm;">
						  <xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$Form3468Data/UnsdCoopInvstAdvncEnergyCrAmt"/>
						  </xsl:call-template>
						</div>
						 <div class="styLNRightNumBoxNBB" style="background-color:lightgrey;height:9mm;"/>  
						 <div class="styLNAmountBox" style="width:27mm;height:9mm;border-left-width:1px;
						  border-bottom-width:0px;"/>  
					</div>
					<!-- End of 2 -->
					<!--Line 3 -->
					<div style="width:187mm;font-size:8pt">
						<div class="styLNLeftNumBox" style="height:7.5mm;padding-top:3.5mm;padding-left:2mm">3</div>
						<div class="styLNDesc" style="width:143mm;height:7.5mm;padding-top:4mm;padding-left:2mm;">
						  Add lines 1c and 2. Report this amount on Form 3800, Part III, 
						   line 1d
							<!--Dotted Line-->
							<div class="styDotLn" style="float:none;padding-right:1mm;">.........</div>						  
						</div>
						<div class="styLNRightNumBoxNBB" style="height:9mm;padding-top:5mm">3</div>  
						<div class="styLNAmountBox" style="width:27mm;height:9mm;padding-top:5mm;border-left-width:1px;
						 border-bottom-width:0px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form3468Data/TotQlfyInvAdvncEgyProjPropAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- End of 3 -->
					<!-- Start of Part IV -->
					<div class="styBB" style="width:187mm;border-top-width:1px;">
						<div class="styPartName" style="width:15mm;height:5mm; font-size:8pt;padding-top:1mm;">Part IV
						</div>
						<div class="styPartDesc" style="width:170mm; height:auto; font-weight:normal;font-size:9pt;
						 padding-left:2mm;padding-top:1mm">
						 <b>Advanced Manufacturing Investment Credit Under Section 48D</b> (see instructions) 
						</div>
					</div>
					<!-- Start of Line 1a -->
					<div style="width:187mm;font-size:8pt">
						<div class="styLNLeftNumBox" style="height:1mm;padding-left:2mm">1a</div>
						<div class="styLNDesc" style="width:73mm;height:7.5mm;padding-left:2mm">
						 Check the box below that applies to your advanced manufacturing investment project.
						</div>
						<div class="styLNRightNumBoxNBB" style="height:7.5mm;background-color:lightgrey"/>
						<div class="styLNAmountBoxNBB" style="width:27mm;height:7.5mm;font-size:7pt"/>
						<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;height:7.5mm;
						 border-right-width:0mm"/>
						<div class="styLNAmountBox" style="width:27mm;height:7.5mm;border-bottom-width:0px;"/>      
						<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;height:7.5mm;
						 border-left-width:1px;border-right-width:0px;"/>  
						<div class="styLNAmountBox" style="width:27mm;height:7.5mm;border-left-width:1px;
						 border-bottom-width:0px;"/>
					</div>
					<!-- End of 1a -->
					<!-- Start of Line 1a Ckbx1 -->
					<div style="height:5mm;width:187mm;font-size:8pt;">
						<div class="styLNLeftNumBox" style="height:1mm;padding-left:2mm">
						</div>
						<div class="styLNDesc" style="width:73mm;height:7.5mm;padding-left:1mm">
							<input type="checkbox" 
							   aria-label="Semiconductor Manufacturing Facility" class="styCkbox">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" 
									 select="$Form3468Data/SemiconductorMfrFacilityInd"/>
									<xsl:with-param name="BackupName">F3468SemiconductorMfrFacilityInd</xsl:with-param>
								</xsl:call-template>
							</input>
							<label>
								<xsl:call-template name="PopulateLabelYes">
									<xsl:with-param name="TargetNode" 
									 select="$Form3468Data/SemiconductorMfrFacilityInd"/>
									<xsl:with-param name="BackupName">F3468SemiconductorMfrFacilityInd</xsl:with-param>
								</xsl:call-template>Semiconductor manufacturing facility
							</label>
						</div>
						<div class="styLNRightNumBoxNBB" style="height:5mm;background-color:lightgrey"/>
						<div class="styLNAmountBoxNBB" style="height:5mm;width:27mm;font-size:7pt"/>
						<div class="styLNRightNumBoxNBB" style="height:5mm;background-color:lightgrey;
						 border-right-width:0mm"/>
						<div class="styLNAmountBox" style="height:5mm;width:27mm;border-bottom-width:0px;"/>      
						<div class="styLNRightNumBoxNBB" style="height:5mm;background-color:lightgrey;
						 border-left-width:1px;border-right-width:0px;"/>  
						<div class="styLNAmountBox" style="height:5mm;width:27mm;border-left-width:1px;
						 border-bottom-width:0px;"/>
					</div>
					<!-- End of 1a Ckbx1 -->
					<!-- Start of Line 1a Ckbx2 -->
					<div style="height:5mm;width:187mm;font-size:8pt">
						<div class="styLNLeftNumBox" style="height:1mm;padding-left:2mm">
						</div>
						<div class="styLNDesc" style="height:7.5mm;width:73mm;font-size:7pt;padding-left:1mm">
							<input type="checkbox" aria-label="Semiconductor Equipment Facility" class="styCkbox">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" 
									 select="$Form3468Data/SemiconductorEquipMfrFcltyInd"/>
									<xsl:with-param name="BackupName">F3468SemiconductorEquipMfrFcltyInd</xsl:with-param>
								</xsl:call-template>
							</input>
							<label>
								<xsl:call-template name="PopulateLabelYes">
									<xsl:with-param name="TargetNode" 
									 select="$Form3468Data/SemiconductorEquipMfrFcltyInd"/>
									<xsl:with-param name="BackupName">F3468SemiconductorEquipMfrFcltyInd</xsl:with-param>
								</xsl:call-template>Semiconductor equipment manufacturing facility
							</label>
						</div>
						<div class="styLNRightNumBoxNBB" style="height:5mm;background-color:lightgrey"/>
						<div class="styLNAmountBoxNBB" style="height:5mm;width:27mm;font-size:7pt"/>
						<div class="styLNRightNumBoxNBB" style="height:5mm;background-color:lightgrey;
						 border-right-width:0mm"/>
						<div class="styLNAmountBox" style="height:5mm;width:27mm;border-bottom-width:0px;"/>      
						<div class="styLNRightNumBoxNBB" style="height:5mm;background-color:lightgrey;
						 border-left-width:1px;border-right-width:0px;"/>  
						<div class="styLNAmountBox" style="height:5mm;width:27mm;border-left-width:1px;
						 border-bottom-width:0px;"/>
					</div>
					<!-- End of 1a Ckbx2 -->
					<!-- Start of Line 1b -->
					<div style="width:187mm;font-size:8pt">
						<div class="styLNLeftNumBox" style="height:1mm;padding-left:4mm">b</div>
						<div class="styLNDesc" style="width:73mm;height:7.5mm;padding-left:2mm">
						 Enter the basis of the qualified investment for the tax year with respect to any advanced 
						 manufacturing facility
						  <!--Dotted Line-->
							<span class="styDotLn" style="float:right;">.........</span>
						</div>
						<div class="styLNRightNumBox" style="height:11mm;padding-top:7mm">b</div>
						<div class="styLNAmountBox" style="width:27mm;height:11mm;padding-top:7.5mm;font-size:8pt">
							<xsl:call-template name="PopulateAmount">
							  <xsl:with-param name="TargetNode" select="$Form3468Data/BssAdvncMfrInvstCrAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBoxNBB" style="height:11mm;background-color:lightgrey;
						 border-right-width:0mm"/>
						<div class="styLNAmountBox" style="height:11mm;width:27mm;border-bottom-width:0px;"/>      
						<div class="styLNRightNumBoxNBB" style="height:11mm;background-color:lightgrey;
						  padding-top:3.5mm;border-left-width:1px;border-right-width:0px;"/>  
						<div class="styLNAmountBox" style="height:11mm;width:27mm;border-left-width:1px;
						  border-bottom-width:0px;"/>
					</div>
					<!-- End of 1b -->
					<!-- Start of Line 1c -->
					<div style="width:187mm;font-size:8pt">
						<div class="styLNLeftNumBox" style="height:7.5mm;padding-top:3.5mm;padding-left:2mm">c</div>
						<div class="styLNDesc" style="width:108mm;height:9mm;padding-top:3mm;padding-left:2mm;">
						  Multiply line 1b by 25% (0.25) (35% (0.35) for poperty placed in service after 2025)
							<!--Dotted Line-->
							<div class="styDotLn" style="float:none;padding-right:1mm;">...................</div>
						</div>
						<div class="styLNRightNumBox" style="height:9.5mm;padding-top:5.5mm;">c</div>
						<div class="styLNAmountBox" style="height:9.5mm;width:27mm;padding-top:5.5mm;">
						  <xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$Form3468Data/CalcBssAdvncMfrInvstCrAmt"/>
						  </xsl:call-template>
						</div>
						 <div class="styLNRightNumBoxNBB" style="height:9.5mm;background-color:lightgrey;"/>  
						 <div class="styLNAmountBox" style="height:9.5mm;width:27mm;border-left-width:1px;
						  border-bottom-width:0px;"/>  
					</div>
					<!-- End of 1c -->
					<!-- Line 2 -->
					<div style="width:187mm;font-size:8pt">
						<div class="styLNLeftNumBox" style="height:7.5mm;padding-top:3.5mm;padding-left:2mm">2</div>
						<div class="styLNDesc" style="width:108mm;height:9mm;padding-top:3mm;padding-left:2mm;">
						  Enter the applicable unused investment credit from cooperatives. See instructions
							<!--Dotted Line-->
							<div class="styDotLn" style="float:none;padding-right:1mm;">...................</div>
						</div>
						<div class="styLNRightNumBox" style="height:9.5mm;padding-top:5.5mm;">2</div>
						<div class="styLNAmountBox" style="height:9.5mm;width:27mm;padding-top:5.5mm;">
						  <xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$Form3468Data/UnusedCoopInvstMfrFcltyCrAmt"/>
						  </xsl:call-template>
						</div>
						 <div class="styLNRightNumBoxNBB" style="height:9.5mm;background-color:lightgrey;"/>  
						 <div class="styLNAmountBox" style="height:9.5mm;width:27mm;border-left-width:1px;
						  border-bottom-width:0px;"/>  
					</div>
					<!-- End of 2 -->
					<!--Line 3 -->
					<div style="width:187mm;font-size:8pt">
						<div class="styLNLeftNumBox" style="height:7.5mm;padding-top:3.5mm;padding-left:2mm">3</div>
						<div class="styLNDesc" style="width:143mm;height:7.5mm;padding-top:4mm;padding-left:2mm;">
						  Add lines 1c and 2. Report this amount on Form 3800, Part III, line 1o
							<!--Dotted Line-->
							<div class="styDotLn" style="float:none;padding-right:1mm;">.........</div>						  
						</div>
						<div class="styLNRightNumBoxNBB" style="height:8mm;padding-top:4.5mm">3</div>  
						<div class="styLNAmountBox" style="width:27mm;height:8mm;padding-top:4.5mm;border-left-width:1px;
						 border-bottom-width:0px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form3468Data/TotBssQlfyInvstCrAdvncMfrAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- End of 3 -->
					<!-- Start of Part V -->
					<div class="styBB" style="width:187mm;border-top-width:1px;">
						<div class="styPartName" style="width:15mm;height:5mm; font-size:8pt;padding-top:1mm;">Part V
						</div>
						<div class="styPartDesc" style="width:170mm; height:auto; font-weight:normal;font-size:9pt;
						 padding-left:2mm;padding-top:1mm">
						 <b>Clean Electricity Investment Credit Under Section 48E</b>
						</div>
					</div>
					<div class="styBB" style="width:187mm;border-top-width:1px;">
						<div class="styPartDesc" style="width:170mm; height:auto; font-weight:normal;font-size:9pt;
						 padding-left:0mm;padding-top:1mm"><b>Section A—Qualified Clean Electricity Facilities </b> (see 
						 instructions)
						</div>
					</div>
					<div class="styBB" style="width:187mm;border-top-width:0px;">
						<div class="styPartDesc" style="width:170mm; height:auto; font-weight:normal;font-size:9pt;
						 padding-left:0mm;padding-top:1mm"><b>Caution:</b> You cannot claim any investment credits for a 
						 facility under section 38 for the tax year or any prior tax year if a credit was allowed under 
						 section 45, 45J, 45Q, 45U, 45Y, 48, or 48A.
						</div>
					</div>
					<!-- Start of Line 1a -->
					<div style="height:11mm;width:187mm;font-size:8pt">
						<div class="styLNLeftNumBox" style="height:1mm;padding-left:2mm">1a</div>
						<div class="styLNDesc" style="height:11mm;width:73mm;padding-left:2mm">
						 Enter the basis of the qualified investment for any qualified facility described in section 48E(b)
						 (1) placed in service during the tax year
						  <!--Dotted Line-->
						  <span class="styDotLn" style="float:right;">..</span>
						</div>
						<div class="styLNRightNumBox" style="height:11mm;padding-top:7.5mm">1a</div>
						<div class="styLNAmountBox" style="height:11mm;width:27mm;padding-top:7.5mm;font-size:8pt">
							<xsl:call-template name="PopulateAmount">
							  <xsl:with-param name="TargetNode" 
							   select="$Form3468Data/QlfyCleanElectricityFcltyGrp/BssQlfyInvstSect48Eb1Amt"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBoxNBB" style="height:11mm;background-color:lightgrey;
						 border-right-width:0mm"/>
						<div class="styLNAmountBox" style="height:11mm;width:27mm;border-bottom-width:0px;"/>      
						<div class="styLNRightNumBoxNBB" style="height:11mm;background-color:lightgrey;
						  padding-top:3.5mm;border-left-width:1px;border-right-width:0px;"/>  
						<div class="styLNAmountBox" style="height:11mm;width:27mm;border-left-width:1px;
						  border-bottom-width:0px;"/>
					</div>
					<!-- End of 1a -->
					<!-- Start of Line 1b -->
					<div style="width:187mm;font-size:8pt">
						<div class="styLNLeftNumBox" style="height:1mm;padding-left:4mm">b</div>
						<div class="styLNDesc" style="width:73mm;height:14mm;padding-left:2mm;">
						 If you checked Part I, line 7a or 8b, enter 30%. Otherwise, enter 6%. For qualified fuel cell property described under section 48(c)(1), 
						 see instructions
						  <!--Dotted Line-->
							<span class="styDotLn" style="float:right;">..........</span>
						</div>
						<div class="styLNRightNumBox" style="height:14mm;padding-top:10mm">1b</div>
						<div class="styLNAmountBox" style="height:14mm;width:27mm;padding-top:10mm;font-size:8pt">
							<xsl:call-template name="PopulateAmount">
							  <xsl:with-param name="TargetNode" 
							   select="$Form3468Data/QlfyCleanElectricityFcltyGrp/NetOutLss1MWACOrStsfdWgReqPct"/>
							</xsl:call-template>%
						</div>
						<div class="styLNRightNumBoxNBB" style="height:14mm;background-color:lightgrey;
						 border-right-width:0mm"/>
						<div class="styLNAmountBox" style="height:14mm;width:27mm;border-bottom-width:0px;"/>      
						<div class="styLNRightNumBoxNBB" style="height:14mm;background-color:lightgrey;
						  padding-top:6.5mm;border-left-width:1px;border-right-width:0px;"/>  
						<div class="styLNAmountBox" style="height:14mm;width:27mm;border-left-width:1px;
						  border-bottom-width:0px;"/>
					</div>
					<!-- End of 1b -->
					<!-- Line 1c -->
					<div style="width:187mm;font-size:8pt">
						<div class="styLNLeftNumBox" style="height:7.5mm;padding-top:3.5mm;padding-left:4mm">c</div>
						<div class="styLNDesc" style="width:108mm;height:7.5mm;padding-top:3.5mm;padding-left:2mm;">
						  Multiply line 1a by line 1b
						  <!--Dotted Line-->
						  <span class="styDotLn" style="float:right;">................</span>
						</div>
						<div class="styLNRightNumBox" style="height:7.5mm;padding-top: 3.5mm;">1c</div>
						<div class="styLNAmountBox" style="width:27mm;height:7.5mm;padding-top:3.5mm;font-size:8pt">
						  <xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" 
							 select="$Form3468Data/QlfyCleanElectricityFcltyGrp/CalcBssQlfyInvstSect48Eb1Amt"/>
						  </xsl:call-template>
						</div>
						<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;height:7.5mm;"/>  
						<div class="styLNAmountBox" style="width:27mm;height:7.5mm;border-left-width:1px;
						  border-bottom-width:0px;"/>  
					</div>
					<!-- End of 1c -->
					<!-- Start of Line 1d -->
					<div style="width:187mm;font-size:8pt">
						<div class="styLNLeftNumBox" style="height:1mm;padding-left:4mm">d</div>
						<div class="styLNDesc" style="width:73mm;height:7.5mm;padding-left:2mm">
						 If you checked the box in Part I, line 9a, enter 10%. If you checked the box in Part I, line 9b, 
						 enter 2%. Otherwise, go to line 1f
						  <!--Dotted Line-->
							<span class="styDotLn" style="float:right;">.....</span>
						</div>
						<div class="styLNRightNumBox" style="height:10mm;padding-top:6.5mm">1d</div>
						<div class="styLNAmountBox" style="height:10mm;width:27mm;padding-top:6.5mm;font-size:8pt">
							<xsl:call-template name="PopulateAmount">
							  <xsl:with-param name="TargetNode" 
							   select="$Form3468Data/QlfyCleanElectricityFcltyGrp/DomContentBonusCreditPct"/>
							</xsl:call-template>%
						</div>
						<div class="styLNRightNumBoxNBB" style="height:10mm;background-color:lightgrey;
						 border-right-width:0mm"/>
						<div class="styLNAmountBox" style="height:10mm;width:27mm;border-bottom-width:0px;"/>      
						<div class="styLNRightNumBoxNBB" style="height:10mm;background-color:lightgrey;
						  padding-top:6.5mm;border-left-width:1px;border-right-width:0px;"/>  
						<div class="styLNAmountBox" style="height:10mm;width:27mm;border-left-width:1px;
						  border-bottom-width:0px;"/>
					</div>
					<!-- End of 1d -->
					<!-- Line 1e -->
					<div style="width:187mm;font-size:8pt">
						<div class="styLNLeftNumBox" style="height:7.5mm;padding-top:3.5mm;padding-left:4mm">e</div>
						<div class="styLNDesc" style="width:108mm;height:7.5mm;padding-top:3.5mm;padding-left:2mm;">
						  <span style="text-align:left;">Multiply line 1a by line 1d</span>
						  <!--Dotted Line-->
						  <span class="styDotLn" style="float:right;">................</span>
						</div>
						<div class="styLNRightNumBox" style="height:7.5mm;padding-top: 3.5mm;">1e</div>
						<div class="styLNAmountBox" style="width:27mm;height:7.5mm;padding-top:3.5mm;font-size:8pt">
						  <xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" 
							 select="$Form3468Data/QlfyCleanElectricityFcltyGrp/CalcDomContentBonusCreditAmt"/>
						  </xsl:call-template>
						</div>
						 <div class="styLNRightNumBoxNBB" style="background-color:lightgrey;height:7.5mm;"/>  
						 <div class="styLNAmountBox" style="width:27mm;height:7.5mm;border-left-width:1px;
						  border-bottom-width:0px;"/>  
					</div>
					<!-- End of 1e -->
					<!-- Start of Line 1f -->
					<div style="width:187mm;font-size:8pt">
						<div class="styLNLeftNumBox" style="height:1mm;padding-left:4mm">f</div>
						<div class="styLNDesc" style="width:73mm;height:7.5mm;padding-left:2mm">
						 If you checked the box in Part I, line 10a, enter 10%. If you checked the box in Part I, line 
						 10b, enter 2%. Otherwise, go to line 1h
						  <!--Dotted Line-->
							<span class="styDotLn" style="float:right;">.....</span>
						</div>
						<div class="styLNRightNumBox" style="height:10mm;padding-top:6.5mm">1f</div>
						<div class="styLNAmountBox" style="height:10mm;width:27mm;padding-top:6.5mm;font-size:8pt">
							<xsl:call-template name="PopulateAmount">
							  <xsl:with-param name="TargetNode" 
							   select="$Form3468Data/QlfyCleanElectricityFcltyGrp/EnergyComBonusCreditPct"/>
							</xsl:call-template>%
						</div>
						<div class="styLNRightNumBoxNBB" style="height:10mm;background-color:lightgrey;
						 border-right-width:0mm"/>
						<div class="styLNAmountBox" style="height:10mm;width:27mm;border-bottom-width:0px;"/>      
						<div class="styLNRightNumBoxNBB" style="height:10mm;background-color:lightgrey;
						  padding-top:6.5mm;border-left-width:1px;border-right-width:0px;"/>  
						<div class="styLNAmountBox" style="height:10mm;width:27mm;border-left-width:1px;
						  border-bottom-width:0px;"/>
					</div>
					<!-- End of 1f -->
					<!-- Line 1g -->
					<div style="width:187mm;font-size:8pt">
						<div class="styLNLeftNumBox" style="height:7.5mm;padding-top:3.5mm;padding-left:4mm">g</div>
						<div class="styLNDesc" style="width:108mm;height:7.5mm;padding-top:3.5mm;padding-left:2mm;">
						  <span style="text-align:left;">Multiply line 1a by line 1f</span>
						  <!--Dotted Line-->
						  <span class="styDotLn" style="float:right;">.................</span>
						</div>
						<div class="styLNRightNumBox" style="height:7.5mm;padding-top: 3.5mm;">1g</div>
						<div class="styLNAmountBox" style="width:27mm;height:7.5mm;padding-top:3.5mm;font-size:8pt">
						  <xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" 
							 select="$Form3468Data/QlfyCleanElectricityFcltyGrp/CalcEnergyComBonusCreditAmt"/>
						  </xsl:call-template>
						</div>
						 <div class="styLNRightNumBoxNBB" style="background-color:lightgrey;height:7.5mm;"/>  
						 <div class="styLNAmountBox" style="width:27mm;height:7.5mm;border-left-width:1px;
						  border-bottom-width:0px;"/>  
					</div>
					<!-- End of 1g -->
					<!-- Start of Line 1h -->
					<div style="height:32mm;width:187mm;font-size:8pt;">
						<div class="styLNLeftNumBox" style="height:1mm;padding-left:2mm">1h</div>
						<div class="styLNDesc" style="height:28mm;width:73mm;padding-left:2mm">
						 If you checked the box in Part I, line 11a or 11b, enter 10%. If you checked the box in Part I, line
						 11c or 11d, enter 20%. However, if you checked the box in Part I, line 11g; or Part I, line 12a(ii),
						 12b, or 12c(ii), is 5 MW ac or more (in relation to line 11a, 11b, 11c, or 11d), you don’t qualify
						 for the bonus credit. In that situation, enter 0% here, go to line 1n and enter -0-, and then go to 
						 line 2
						  <!--Dotted Line-->
						  <span class="styDotLn" style="float:right;">...............</span>
						</div>
						<div class="styLNRightNumBox" style="height:32mm;padding-top:28.5mm">1h</div>
						<div class="styLNAmountBoxNBB" style="height:32mm;width:27mm;padding-top:29mm;font-size:8pt">
							<xsl:call-template name="PopulateAmount">
							  <xsl:with-param name="TargetNode" 
							   select="$Form3468Data/QlfyCleanElectricityFcltyGrp/LowIncmSolarWindBonusCrPct"/>
							</xsl:call-template>%
						</div>
						<div class="styLNRightNumBoxNBB" style="height:32mm;background-color:lightgrey;
						 border-right-width:0mm"/>
						<div class="styLNAmountBox" style="height:32mm;width:27mm;border-bottom-width:0px;"/>      
						<div class="styLNRightNumBoxNBB" style="height:32mm;background-color:lightgrey;
						  padding-top:3.5mm;border-left-width:1px;border-right-width:0px;"/>  
						<div class="styLNAmountBox" style="height:32mm;width:27mm;border-left-width:1px;
						  border-bottom-width:0px;"/>
					</div>
					<!-- End of 1h -->
					<!-- Start of Line 1i -->
					<div style="width:187mm;font-size:8pt">
						<div class="styLNLeftNumBox" style="height:1mm;padding-left:4mm">i</div>
						<div class="styLNDesc" style="width:73mm;height:7.5mm;padding-left:2mm;">
						 Enter the amount of capacity limitation you were allocated in the allocation letter
						  <!--Dotted Line-->
							<span class="styDotLn" style="float:right;">......</span>
						</div>
						<div class="styLNRightNumBox" style="height:7.5mm;padding-top:4mm">1i</div>
						<div class="styLNAmountBox" style="height:7.5mm;width:45mm;padding-top:3.5mm;font-size:8pt;
						 border-top-width:1px">
							<xsl:call-template name="PopulateAmount">
							  <xsl:with-param name="TargetNode" 
							   select="$Form3468Data/QlfyCleanElectricityFcltyGrp/AllocLmtEnergyCapKWQty"/>
							</xsl:call-template>kW
						</div>
						<!--<div class="styLNRightNumBoxNBB" style="height:7.5mm;background-color:lightgrey;
						 border-right-width:0mm"/>-->
						<div class="styLNAmountBox" style="height:7.5mm;width:17mm;border-bottom-width:0px;"/>      
						<div class="styLNRightNumBoxNBB" style="height:7.5mm;background-color:lightgrey;
						  padding-top:6.5mm;border-left-width:1px;border-right-width:0px;"/>  
						<div class="styLNAmountBox" style="height:7.5mm;width:27mm;border-left-width:1px;
						  border-bottom-width:0px;"/>
					</div>
					<!-- End of 1i -->
					<!-- Line 1j -->
					<div style="height:17mm;width:187mm;font-size:8pt;">
						<div class="styLNLeftNumBox" style="height:14mm;padding-top:3.5mm;padding-left:4mm">j</div>
						<div class="styLNDesc" style="width:73mm;height:7.5mm;padding-top:3.5mm;padding-left:2mm;">
						 If the entry on Part I, line 12a(i), 12b, or 12c(ii), equals the entry on line 1i, multiply line 1a
						 by line 1h and go to line 1n. Otherwise, continue to line 1k
						  <!--Dotted Line-->
						  <span class="styDotLn" style="float:right;">..............</span>
						</div>
						<div class="styLNRightNumBox" style="height:17mm;padding-top: 12mm;">1j</div>
						<div class="styLNAmountBox" style="width:27mm;height:17mm;padding-top:12mm;font-size:8pt">
						  <xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" 
							 select="$Form3468Data/QlfyCleanElectricityFcltyGrp/CalcSolarWindOthrCapAllocAmt"/>
						  </xsl:call-template>
						</div>
						<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;height:17mm;"/>  
						<div class="styLNAmountBox" style="width:27mm;height:17mm;border-left-width:1px;
						  border-bottom-width:0px;"/>
						<div class="styLNRightNumBoxNBB" style="height:17mm;width:8.3mm;background-color:lightgrey;
						 border-right-width:1px"/>
					</div>
					<!-- End of 1j -->
					<!-- Start of Line 1k -->
					<div style="width:187mm;font-size:8pt">
						<div class="styLNLeftNumBox" style="height:1mm;padding-left:4mm">k</div>
						<div class="styLNDesc" style="width:73mm;height:7.5mm;padding-left:2mm">
						 If the entry on Part I, line 12a(i), 12b, or 12c(ii), is more than the entry on line 1i, divide line
						 1i by Part I, line 12a(i), 12b, or 12c(ii)
						  <!--Dotted Line-->
							<span class="styDotLn" style="float:right;">.....</span>
						</div>
						<div class="styLNRightNumBox" style="height:10mm;padding-top:6.5mm">1k</div>
						<div class="styLNAmountBox" style="height:10mm;width:27mm;padding-top:6.5mm;font-size:8pt">
							<xsl:call-template name="PopulateAmount">
							  <xsl:with-param name="TargetNode" 
							   select="$Form3468Data/QlfyCleanElectricityFcltyGrp/SolarWindOthrCapAllocRt"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBoxNBB" style="height:10mm;background-color:lightgrey;
						 border-right-width:0mm"/>
						<div class="styLNAmountBox" style="height:10mm;width:27mm;border-bottom-width:0px;"/>      
						<div class="styLNRightNumBoxNBB" style="height:10mm;background-color:lightgrey;
						  padding-top:6.5mm;border-left-width:1px;border-right-width:0px;"/>  
						<div class="styLNAmountBox" style="height:10mm;width:27mm;border-left-width:1px;
						  border-bottom-width:0px;"/>
					</div>
					<!-- End of 1k -->
					<!-- Line 1l -->
					<div style="width:187mm;font-size:8pt;">
						<div class="styLNLeftNumBox" style="height:7.5mm;padding-top:3.5mm;padding-left:4mm">l</div>
						<div class="styLNDesc" style="width:73mm;height:7.5mm;padding-top:3.5mm;padding-left:2mm;">
						  <span style="text-align:left;">Multiply line 1h by line 1k</span>
						  <!--Dotted Line-->
						  <span class="styDotLn" style="float:right;">........</span>
						</div>
						<div class="styLNRightNumBox" style="height:7.5mm;padding-top: 3.5mm;">1l</div>
						<div class="styLNAmountBox" style="width:27mm;height:7.5mm;padding-top:3.5mm;">
						  <xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" 
							 select="$Form3468Data/QlfyCleanElectricityFcltyGrp/ApplcblCalcDomCntntBonusCrAmt"/>
						  </xsl:call-template>
						</div>
						 <div class="styLNRightNumBoxNBB" style="background-color:lightgrey;height:7.5mm;"/>  
						 <div class="styLNAmountBox" style="width:27mm;height:7.5mm;border-left-width:1px;
						  border-bottom-width:0px;"/>
						 <div class="styLNRightNumBoxNBB" style="background-color:lightgrey;height:7.5mm;
						  border-right-width:1px;width:8.3mm"/>
					</div>
					<!-- End of 1l -->
					<!-- Start of Line 1m -->
					<div style="width:187mm;font-size:8pt">
						<div class="styLNLeftNumBox" style="height:7.5mm;padding-top:3.5mm;padding-left:4mm">m</div>
						<div class="styLNDesc" style="width:73mm;height:7.5mm;padding-top:3.5mm;padding-left:2mm">
						 Multiply line 1a by line 1l
						  <!--Dotted Line-->
							<span class="styDotLn" style="float:right;">........</span>
						</div>
						<div class="styLNRightNumBox" style="height:7.5mm;padding-top:3.5mm">1m</div>
						<div class="styLNAmountBox" style="height:7.5mm;width:27mm;padding-top:4mm;">
							<xsl:call-template name="PopulateAmount">
							  <xsl:with-param name="TargetNode" 
							   select="$Form3468Data/QlfyCleanElectricityFcltyGrp/Calc2BssQlfyInvstSect48Eb1Amt"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBoxNBB" style="height:7.5mm;background-color:lightgrey;
						 border-right-width:0mm"/>
						<div class="styLNAmountBox" style="height:7.5mm;width:27mm;border-bottom-width:0px;"/>      
						<div class="styLNRightNumBoxNBB" style="height:7.5mm;background-color:lightgrey;
						  padding-top:3.5mm;border-left-width:1px;border-right-width:0px;"/>  
						<div class="styLNAmountBox" style="height:7.5mm;width:27mm;border-left-width:1px;
						  border-bottom-width:0px;"/>
					</div>
					<!-- End of 1m -->
					<!-- Line 1n -->
					<div style="height:10mm;width:187mm;font-size:8pt;">
						<div class="styLNLeftNumBox" style="height:10mm;padding-top:3.5mm;padding-left:4mm">n</div>
						<div class="styLNDesc" style="width:108mm;height:10mm;padding-top:3.5mm;padding-left:2mm;">
						  If Part I, line 12a(i), 12b, or 12c(ii), is more than the entry on
						   line 1i, enter the amount from line 1m. Otherwise, enter the amount from line 1j
						  <!--Dotted Line-->
						  <!--<span class="styDotLn" style="float:right;">.................</span>-->
						</div>
						<div class="styLNRightNumBox" style="height:10mm;padding-top:6mm;">1n</div>
						<div class="styLNAmountBox" style="width:27mm;height:10mm;padding-top:6mm;">
						  <xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" 
							 select="$Form3468Data/QlfyCleanElectricityFcltyGrp/Calc3BssQlfyInvstSect48Eb1Amt"/>
						  </xsl:call-template>
						</div>
						 <div class="styLNRightNumBoxNBB" style="background-color:lightgrey;height:10mm;"/>  
						 <div class="styLNAmountBox" style="width:27mm;height:10mm;border-left-width:1px;
						  border-bottom-width:0px;"/>  
					</div>
					<!-- End of 1n -->
					<!--Line 2 -->
					<div style="height:5mm;width:187mm;font-size:8pt">
						<div class="styLNLeftNumBox" style="height:2mm;padding-top:1.5mm;padding-left:2mm">2</div>
						<div class="styLNDesc" style="width:143mm;height:5mm;padding-top:1.5mm;padding-left:2mm;">
						  Add lines 1c, 1e, 1g, and 1n
							<!--Dotted Line-->
							<div class="styDotLn" style="float:none;padding-right:1mm;">........................</div>			  
						</div>
						<div class="styLNRightNumBoxNBB" style="height:5mm;padding-top:1.5mm">2</div>
						<div class="styLNAmountBox" style="height:5mm;width:28mm;padding-top:1.5mm;border-left-width:1px;
						 border-bottom-width:0px;">
						  <xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" 
							 select="$Form3468Data/QlfyCleanElectricityFcltyGrp/TotQlfyElecFcltySect48Eb1CrAmt"/>
						  </xsl:call-template>
						</div>
					</div>
					<!-- End of 2 -->
						<!-- Page Break and Footer-->
					<div class="styBB" style="width:187mm;clear:both;padding-top:0.4mm;border-top-width:2px;
					 border-bottom-width:0px">
						<!--<div style="width:90mm;font-weight:bold;font-size:7pt" class="styGenericDiv">For Paperwork 
						 Reduction Act Notice, see separate instructions.</div>
						<div style="width:55mm;text-align:center;" class="styGenericDiv">Cat. No. 12276E</div>-->
						<div style="float:right;" class="styGenericDiv">Form <span class="styBoldText">3468</span> (2025)
						</div>
					</div>
					<br/>
					<div class="pageEnd"/>
					<div style="page-break-after:always"/>
					<!-- End Footer -->
					<!-- Header -->
					<div style="width:187mm;padding-top:1mm;float:left">
					  Form 3468 (2025)
						<span style="width:15mm;float:right;">Page 
							<span class="styBoldText" style="font-size:8pt;">4</span>
						</span>
					</div>
					<!-- Start of Part V cont. -->
					<!-- Begin Header -->
					<div class="styBB" style="width:187mm;border-top-width:1px;">
						<div class="styPartName" style="width:15mm;height:5mm; font-size:8pt;padding-top:1mm;">Part V
						</div>
						<div class="styPartDesc" style="width:170mm; height:auto; font-weight:normal;font-size:9pt;
						 padding-left:2mm;padding-top:1mm">
						 <b>Clean Electricity Investment Credit Under Section 48E</b> <i> (continued)</i>
						</div>
					</div>
					<div class="styBB" style="width:187mm;border-top-width:1px;">
						<div class="styPartDesc" style="width:170mm; height:auto; font-weight:normal;font-size:9pt;
						 padding-left:0mm;padding-top:1mm"><b>Section B—Qualified Energy Storage Technology</b>
						 (see instructions)
						</div>
					</div>
					<div class="styBB" style="width:187mm;border-top-width:0px;">
						<div class="styPartDesc" style="width:170mm; height:auto; font-weight:normal;font-size:9pt;
						 padding-left:0mm;padding-top:1mm"><b>Caution:</b> You cannot claim any investment credits for a 
						 facility under section 38 for the tax year or any prior tax year if a credit was allowed under 
						 section 45, 45J, 45Q, 45U, 45Y, 48, or 48A.
						</div>
					</div>
					<!-- End Header -->
					<!-- Start of Line 3a -->
					<div style="height:14mm;width:187mm;font-size:8pt;">
						<div class="styLNLeftNumBox" style="height:1mm;padding-left:2mm">3a</div>
						<div class="styLNDesc" style="height:11mm;width:73mm;padding-left:2mm">
						 Enter the basis of the qualified investment for any energy storage technology described in section
						 48E(c) placed in service during the tax year
						  <!--Dotted Line-->
						  <span class="styDotLn" style="float:right;">...............</span>
						</div>
						<div class="styLNRightNumBox" style="height:14mm;padding-top:10mm">3a</div>
						<div class="styLNAmountBox" style="height:14mm;width:27mm;padding-top:10mm;font-size:8pt">
							<xsl:call-template name="PopulateAmount">
							  <xsl:with-param name="TargetNode" 
							   select="$Form3468Data/QlfyEgyStorTechGrp/BssQlfyInvstEgyStorTechAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBoxNBB" style="height:14mm;background-color:lightgrey;
						 border-right-width:0mm"/>
						<div class="styLNAmountBox" style="height:14mm;width:27mm;border-bottom-width:0px;"/>      
						<div class="styLNRightNumBoxNBB" style="height:14mm;background-color:lightgrey;
						  padding-top:3.5mm;border-left-width:1px;border-right-width:0px;"/>  
						<div class="styLNAmountBox" style="height:14mm;width:27mm;border-left-width:1px;
						  border-bottom-width:0px;"/>
					</div>
					<!-- End of 3a -->
					<!-- Start of Line 3b -->
					<div style="width:187mm;font-size:8pt">
						<div class="styLNLeftNumBox" style="height:1mm;padding-left:4mm">b</div>
						<div class="styLNDesc" style="width:73mm;height:7.5mm;padding-left:2mm;">
						 If you checked Part I, line 7a or 8b, enter 30%. Otherwise, enter 6%
						  <!--Dotted Line-->
							<span class="styDotLn" style="float:right;">..........</span>
						</div>
						<div class="styLNRightNumBox" style="height:7.5mm;padding-top:4mm">3b</div>
						<div class="styLNAmountBox" style="height:7.5mm;width:27mm;padding-top:4mm;font-size:8pt">
							<xsl:call-template name="PopulateAmount">
							  <xsl:with-param name="TargetNode" 
							   select="$Form3468Data/QlfyEgyStorTechGrp/NetOutLss1MWACOrStsfdWgReqPct"/>
							</xsl:call-template>%
						</div>
						<div class="styLNRightNumBoxNBB" style="height:7.5mm;background-color:lightgrey;
						 border-right-width:0mm"/>
						<div class="styLNAmountBox" style="height:7.5mm;width:27mm;border-bottom-width:0px;"/>      
						<div class="styLNRightNumBoxNBB" style="height:7.5mm;background-color:lightgrey;
						  padding-top:6.5mm;border-left-width:1px;border-right-width:0px;"/>  
						<div class="styLNAmountBox" style="height:7.5mm;width:27mm;border-left-width:1px;
						  border-bottom-width:0px;"/>
					</div>
					<!-- End of 3b -->
					<!-- Line 3c -->
					<div style="width:187mm;font-size:8pt">
						<div class="styLNLeftNumBox" style="height:7.5mm;padding-top:3.5mm;padding-left:4mm">c</div>
						<div class="styLNDesc" style="width:108mm;height:7.5mm;padding-top:3.5mm;padding-left:2mm;">
						  Multiply line 3a by line 3b
						  <!--Dotted Line-->
						  <span class="styDotLn" style="float:right;">................</span>
						</div>
						<div class="styLNRightNumBox" style="height:7.5mm;padding-top: 3.5mm;">3c</div>
						<div class="styLNAmountBox" style="width:27mm;height:7.5mm;padding-top:3.5mm;font-size:8pt">
						  <xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" 
							 select="$Form3468Data/QlfyEgyStorTechGrp/CalcBssQlfyInvstEgyStorTechAmt"/>
						  </xsl:call-template>
						</div>
						<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;height:7.5mm;"/>  
						<div class="styLNAmountBox" style="width:27mm;height:7.5mm;border-left-width:1px;
						  border-bottom-width:0px;"/>  
					</div>
					<!-- End of 3c -->
					<!-- Start of Line 3d -->
					<div style="width:187mm;font-size:8pt">
						<div class="styLNLeftNumBox" style="height:1mm;padding-left:4mm">d</div>
						<div class="styLNDesc" style="width:73mm;height:7.5mm;padding-left:2mm">
						 If you checked the box in Part I, line 9a, enter 10%. If you checked the box in Part I, line 9b, 
						 enter 2%. Otherwise, go to line 3f
						  <!--Dotted Line-->
							<span class="styDotLn" style="float:right;">.....</span>
						</div>
						<div class="styLNRightNumBox" style="height:10mm;padding-top:6.5mm">3d</div>
						<div class="styLNAmountBox" style="height:10mm;width:27mm;padding-top:6.5mm;font-size:8pt">
							<xsl:call-template name="PopulateAmount">
							  <xsl:with-param name="TargetNode" 
							   select="$Form3468Data/QlfyEgyStorTechGrp/DomContentBonusCreditPct"/>
							</xsl:call-template>%
						</div>
						<div class="styLNRightNumBoxNBB" style="height:10mm;background-color:lightgrey;
						 border-right-width:0mm"/>
						<div class="styLNAmountBox" style="height:10mm;width:27mm;border-bottom-width:0px;"/>      
						<div class="styLNRightNumBoxNBB" style="height:10mm;background-color:lightgrey;
						  padding-top:6.5mm;border-left-width:1px;border-right-width:0px;"/>  
						<div class="styLNAmountBox" style="height:10mm;width:27mm;border-left-width:1px;
						  border-bottom-width:0px;"/>
					</div>
					<!-- End of 3d -->
					<!-- Line 3e -->
					<div style="width:187mm;font-size:8pt">
						<div class="styLNLeftNumBox" style="height:7.5mm;padding-top:3.5mm;padding-left:4mm">e</div>
						<div class="styLNDesc" style="width:108mm;height:7.5mm;padding-top:3.5mm;padding-left:2mm;">
						  <span style="text-align:left;">Multiply line 3a by line 3d</span>
						  <!--Dotted Line-->
						  <span class="styDotLn" style="float:right;">................</span>
						</div>
						<div class="styLNRightNumBox" style="height:7.5mm;padding-top: 3.5mm;">3e</div>
						<div class="styLNAmountBox" style="width:27mm;height:7.5mm;padding-top:3.5mm;font-size:8pt">
						  <xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" 
							 select="$Form3468Data/QlfyEgyStorTechGrp/CalcDomContentBonusCreditAmt"/>
						  </xsl:call-template>
						</div>
						 <div class="styLNRightNumBoxNBB" style="background-color:lightgrey;height:7.5mm;"/>  
						 <div class="styLNAmountBox" style="width:27mm;height:7.5mm;border-left-width:1px;
						  border-bottom-width:0px;"/>  
					</div>
					<!-- End of 3e -->
					<!-- Start of Line 3f -->
					<div style="width:187mm;font-size:8pt">
						<div class="styLNLeftNumBox" style="height:1mm;padding-left:4mm">f</div>
						<div class="styLNDesc" style="width:73mm;height:7.5mm;padding-left:2mm">
						 If you checked the box in Part I, line 10a, enter 10%. If you checked the box in Part I, line 
						 10b, enter 2%. Otherwise, go to line 4
						  <!--Dotted Line-->
							<span class="styDotLn" style="float:right;">.....</span>
						</div>
						<div class="styLNRightNumBox" style="height:10mm;padding-top:6.5mm">3f</div>
						<div class="styLNAmountBox" style="height:10mm;width:27mm;padding-top:6.5mm;font-size:8pt">
							<xsl:call-template name="PopulateAmount">
							  <xsl:with-param name="TargetNode" 
							   select="$Form3468Data/QlfyEgyStorTechGrp/EnergyComBonusCreditPct"/>
							</xsl:call-template>%
						</div>
						<div class="styLNRightNumBoxNBB" style="height:10mm;background-color:lightgrey;
						 border-right-width:0mm"/>
						<div class="styLNAmountBox" style="height:10mm;width:27mm;border-bottom-width:0px;"/>      
						<div class="styLNRightNumBoxNBB" style="height:10mm;background-color:lightgrey;
						  padding-top:6.5mm;border-left-width:1px;border-right-width:0px;"/>  
						<div class="styLNAmountBox" style="height:10mm;width:27mm;border-left-width:1px;
						  border-bottom-width:0px;"/>
					</div>
					<!-- End of 3f -->
					<!-- Line 3g -->
					<div style="width:187mm;font-size:8pt;">
						<div class="styLNLeftNumBox" style="height:7.5mm;padding-top:3.5mm;padding-left:4mm">g</div>
						<div class="styLNDesc" style="width:108mm;height:7.5mm;padding-top:3.5mm;padding-left:2mm;">
						  <span style="text-align:left;">Multiply line 3a by line 3f</span>
						  <!--Dotted Line-->
						  <span class="styDotLn" style="float:right;">.................</span>
						</div>
						<div class="styLNRightNumBox" style="height:7.5mm;padding-top: 3.5mm;">3g</div>
						<div class="styLNAmountBox" style="width:27mm;height:7.5mm;padding-top:3.5mm;font-size:8pt">
						  <xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" 
							 select="$Form3468Data/QlfyEgyStorTechGrp/CalcEnergyComBonusCreditAmt"/>
						  </xsl:call-template>
						</div>
						 <div class="styLNRightNumBoxNBB" style="background-color:lightgrey;height:7.5mm;"/>  
						 <div class="styLNAmountBox" style="width:27mm;height:7.5mm;border-left-width:1px;
						  border-bottom-width:0px;"/>
					</div>
					<!-- End of 3g -->
					<!-- Start of Line 3h -->
					<div style="height:4mm;width:187mm;font-size:8pt;">
						<div class="styLNLeftNumBox" style="height:1mm;padding-left:4mm">h</div>
						<div class="styLNDesc" style="height:4mm;width:73mm;padding-left:2mm">
						 Reserved for future use
						  <!--Dotted Line-->
						  <span class="styDotLn" style="float:right;">.........</span>
						</div>
						<div class="styLNRightNumBox" style="height:4mm;padding-top:.5mm">3h</div>
						<div class="styLNAmountBox" style="height:4mm;width:27mm;padding-top:.5mm;font-size:7pt;
						 background-color:lightgrey">
							<!--<xsl:call-template name="PopulateAmount">
							  <xsl:with-param name="TargetNode" 
							   select="$Form3468Data/QlfyEgyStorTechGrp/LowIncmSolarWindBonusCrPct"/>
							</xsl:call-template>%-->
						</div>
						<div class="styLNRightNumBoxNBB" style="height:4mm;background-color:lightgrey;
						 border-right-width:0mm"/>
						<div class="styLNAmountBox" style="height:4mm;width:27mm;border-bottom-width:0px;"/>      
						<div class="styLNRightNumBoxNBB" style="height:4mm;background-color:lightgrey;
						  padding-top:3.5mm;border-left-width:1px;border-right-width:0px;"/>  
						<div class="styLNAmountBox" style="height:4mm;width:27mm;border-left-width:1px;
						  border-bottom-width:0px;"/>
					</div>
					<!-- End of 3h -->
					<!-- Start of Line 3i -->
					<div style="height:4mm;width:187mm;font-size:8pt;">
						<div class="styLNLeftNumBox" style="height:1mm;padding-left:4mm">i</div>
						<div class="styLNDesc" style="height:4mm;width:73mm;padding-left:2mm">
						 Reserved for future use
						  <!--Dotted Line-->
						  <span class="styDotLn" style="float:right;">.........</span>
						</div>
						<div class="styLNRightNumBox" style="height:4mm;padding-top:.5mm">3i</div>
						<div class="styLNAmountBox" style="height:4mm;width:27mm;padding-top:.5mm;font-size:7pt;
						 background-color:lightgrey">
							<!--<xsl:call-template name="PopulateAmount">
							  <xsl:with-param name="TargetNode" 
							   select="$Form3468Data/QlfyEgyStorTechGrp/LowIncmSolarWindBonusCrPct"/>
							</xsl:call-template>%-->
						</div>
						<div class="styLNRightNumBoxNBB" style="height:4mm;background-color:lightgrey;
						 border-right-width:0mm"/>
						<div class="styLNAmountBox" style="height:4mm;width:27mm;border-bottom-width:0px;"/>      
						<div class="styLNRightNumBoxNBB" style="height:4mm;background-color:lightgrey;
						  padding-top:3.5mm;border-left-width:1px;border-right-width:0px;"/>  
						<div class="styLNAmountBox" style="height:4mm;width:27mm;border-left-width:1px;
						  border-bottom-width:0px;"/>
					</div>
					<!-- End of 3i -->
					<!-- Start of Line 3j -->
					<div style="height:4mm;width:187mm;font-size:8pt;">
						<div class="styLNLeftNumBox" style="height:1mm;padding-left:4mm">j</div>
						<div class="styLNDesc" style="height:4mm;width:73mm;padding-left:2mm">
						 Reserved for future use
						  <!--Dotted Line-->
						  <span class="styDotLn" style="float:right;">.........</span>
						</div>
						<div class="styLNRightNumBox" style="height:4mm;padding-top:0mm">3j</div>
						<div class="styLNAmountBox" style="height:4mm;width:27mm;padding-top:.5mm;font-size:7pt;
						 background-color:lightgrey">
							<!--<xsl:call-template name="PopulateAmount">
							  <xsl:with-param name="TargetNode" 
							   select="$Form3468Data/QlfyEgyStorTechGrp/LowIncmSolarWindBonusCrPct"/>
							</xsl:call-template>%-->
						</div>
						<div class="styLNRightNumBoxNBB" style="height:4mm;background-color:lightgrey;
						 border-right-width:0mm"/>
						<div class="styLNAmountBox" style="height:4mm;width:27mm;border-bottom-width:0px;"/>      
						<div class="styLNRightNumBoxNBB" style="height:4mm;background-color:lightgrey;
						  padding-top:3.5mm;border-left-width:1px;border-right-width:0px;"/>  
						<div class="styLNAmountBox" style="height:4mm;width:27mm;border-left-width:1px;
						  border-bottom-width:0px;"/>
					</div>
					<!-- End of 3j -->
					<!-- Start of Line 3k -->
					<div style="height:4mm;width:187mm;font-size:8pt;">
						<div class="styLNLeftNumBox" style="height:1mm;padding-left:4mm">k</div>
						<div class="styLNDesc" style="height:4mm;width:73mm;padding-left:2mm">
						 Reserved for future use
						  <!--Dotted Line-->
						  <span class="styDotLn" style="float:right;">.........</span>
						</div>
						<div class="styLNRightNumBox" style="height:4mm;padding-top:.5mm">3k</div>
						<div class="styLNAmountBox" style="height:4mm;width:27mm;padding-top:.5mm;font-size:7pt;
						 background-color:lightgrey">
							<!--<xsl:call-template name="PopulateAmount">
							  <xsl:with-param name="TargetNode" 
							   select="$Form3468Data/QlfyEgyStorTechGrp/LowIncmSolarWindBonusCrPct"/>
							</xsl:call-template>%-->
						</div>
						<div class="styLNRightNumBoxNBB" style="height:4mm;background-color:lightgrey;
						 border-right-width:0mm"/>
						<div class="styLNAmountBox" style="height:4mm;width:27mm;border-bottom-width:0px;"/>      
						<div class="styLNRightNumBoxNBB" style="height:4mm;background-color:lightgrey;
						  padding-top:3.5mm;border-left-width:1px;border-right-width:0px;"/>  
						<div class="styLNAmountBox" style="height:4mm;width:27mm;border-left-width:1px;
						  border-bottom-width:0px;"/>
					</div>
					<!-- End of 3k -->
					<!-- Start of Line 3l -->
					<div style="height:4mm;width:187mm;font-size:8pt;">
						<div class="styLNLeftNumBox" style="height:1mm;padding-left:4mm">l</div>
						<div class="styLNDesc" style="height:4mm;width:73mm;padding-left:2mm">
						 Reserved for future use
						  <!--Dotted Line-->
						  <span class="styDotLn" style="float:right;">.........</span>
						</div>
						<div class="styLNRightNumBox" style="height:4mm;padding-top:.5mm">3l</div>
						<div class="styLNAmountBox" style="height:4mm;width:27mm;padding-top:.5mm;font-size:7pt;
						 background-color:lightgrey">
							<!--<xsl:call-template name="PopulateAmount">
							  <xsl:with-param name="TargetNode" 
							   select="$Form3468Data/QlfyEgyStorTechGrp/LowIncmSolarWindBonusCrPct"/>
							</xsl:call-template>%-->
						</div>
						<div class="styLNRightNumBoxNBB" style="height:4mm;background-color:lightgrey;
						 border-right-width:0mm"/>
						<div class="styLNAmountBox" style="height:4mm;width:27mm;border-bottom-width:0px;"/>      
						<div class="styLNRightNumBoxNBB" style="height:4mm;background-color:lightgrey;
						  padding-top:3.5mm;border-left-width:1px;border-right-width:0px;"/>  
						<div class="styLNAmountBox" style="height:4mm;width:27mm;border-left-width:1px;
						  border-bottom-width:0px;"/>
					</div>
					<!-- End of 3l -->
					<!-- Start of Line 3m -->
					<div style="height:4mm;width:187mm;font-size:8pt;">
						<div class="styLNLeftNumBox" style="height:1mm;padding-left:4mm">m</div>
						<div class="styLNDesc" style="height:4mm;width:73mm;padding-left:2mm">
						 Reserved for future use
						  <!--Dotted Line-->
						  <span class="styDotLn" style="float:right;">.........</span>
						</div>
						<div class="styLNRightNumBox" style="height:4mm;padding-top:.5mm">3m</div>
						<div class="styLNAmountBox" style="height:4mm;width:27mm;padding-top:.5mm;font-size:7pt;
						 background-color:lightgrey">
							<!--<xsl:call-template name="PopulateAmount">
							  <xsl:with-param name="TargetNode" 
							   select="$Form3468Data/QlfyEgyStorTechGrp/LowIncmSolarWindBonusCrPct"/>
							</xsl:call-template>%-->
						</div>
						<div class="styLNRightNumBoxNBB" style="height:4mm;background-color:lightgrey;
						 border-right-width:0mm"/>
						<div class="styLNAmountBoxNBB" style="height:4mm;width:27mm;"/>      
						<div class="styLNRightNumBox" style="height:4mm;background-color:lightgrey;
						  padding-top:3.5mm;border-left-width:1px;border-right-width:0px;"/>  
						<div class="styLNAmountBox" style="height:4mm;width:27mm;border-left-width:1px;
						  border-bottom-width:0px;"/>
					</div>
					<!-- End of 3m -->
					<!-- Start of Line 3n -->
					<div style="width:187mm;font-size:8pt;">
						<div class="styLNLeftNumBox" style="height:4mm;padding-top:.5mm;padding-left:4mm">n</div>
						<div class="styLNDesc" style="width:108mm;height:4mm;padding-top:.5mm;padding-left:2mm;">
						  <span style="text-align:left;">Multiply line 3a by line 3f</span>
						  <!--Dotted Line-->
						  <span class="styDotLn" style="float:right;">.................</span>
						</div>
						<div class="styLNRightNumBox" style="height:4mm;padding-top: .5mm;">3n</div>
						<div class="styLNAmountBox" style="width:27mm;height:4mm;padding-top:1.5mm;font-size:8pt;
						 background-color:lightgrey">
						  <!--<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" 
							 select="$Form3468Data/QlfyEgyStorTechGrp/CalcEnergyComBonusCreditAmt"/>
						  </xsl:call-template>-->
						</div>
						<div class="styLNRightNumBox" style="background-color:lightgrey;height:4mm;border-right-width:1px;
						 width:8.3mm"/>  
						<!--<div class="styLNAmountBox" style="width:27mm;height:4mm;border-left-width:1px;
						 border-bottom-width:0px;background-color:lightgrey"/>-->
					</div>
					<!-- End of 3n -->
					<!--Line 4 -->
					<div style="height:5mm;width:187mm;font-size:8pt">
						<div class="styLNLeftNumBox" style="height:2mm;padding-top:1.5mm;padding-left:2mm">4</div>
						<div class="styLNDesc" style="width:143mm;height:5mm;padding-top:1.5mm;padding-left:2mm;">
						  Add lines 3c, 3e, and 3g
							<!--Dotted Line-->
							<div class="styDotLn" style="float:none;padding-right:1mm;">........................</div>			  
						</div>
						<div class="styLNRightNumBoxNBB" style="height:5mm;padding-top:1.5mm">4</div>
						<div class="styLNAmountBox" style="height:5mm;width:28mm;padding-top:1.3mm;border-left-width:1px;
						 border-bottom-width:0px;">
						  <xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" 
							 select="$Form3468Data/QlfyEgyStorTechGrp/TotalQlfyEgyStorTechCrAmt"/>
						  </xsl:call-template>
						</div>
					</div>
					<!-- End of 4 --> <!-- STOPPED HERE 250618 -->
					<!-- Part V Section C -->
					<div class="styBB" style="width:187mm;border-top-width:1px;border-bottom-width:.5px;">
						<div class="styPartDesc" style="width:185mm; height:auto; font-weight:normal;font-size:9pt;
						 padding-left:0mm;padding-top:1mm"><b>Section C—Totals, Credit Reduction for Subsidized Energy
						 Financing or Private Activity Bonds, and Credit Phaseout</b> (see instructions)
						</div>
					</div>
					<!-- Start of Line 5 -->
					<div style="7.5mm;width:187mm;font-size:8pt">
						<div class="styLNLeftNumBox" style="height:4mm;padding-left:0mm;">5</div>
						<div class="styLNDesc" style="height:4mm;width:73mm;padding-left:2mm">
						 Add Part V, lines 2 and 4
						  <!--Dotted Line-->
							<span class="styDotLn" style="float:right;">........</span>
						</div>
						<div class="styLNRightNumBox" style="height:4mm;padding-top:.5mm">5</div>
						<div class="styLNAmountBox" style="height:4mm;width:27mm;padding-top:.5mm;font-size:8pt">
							<xsl:call-template name="PopulateAmount">
							  <xsl:with-param name="TargetNode" 
							   select="$Form3468Data/TotalQlfyElecEgyStorTechCrAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBoxNBB" style="height:4mm;background-color:lightgrey;
						 border-right-width:0mm"/>
						<div class="styLNAmountBox" style="height:4mm;width:27mm;border-bottom-width:0px;"/>      
						<div class="styLNRightNumBoxNBB" style="height:4mm;background-color:lightgrey;
						 border-left-width:1px;border-right-width:0px;"/>  
						<div class="styLNAmountBox" style="height:4mm;width:27mm;border-left-width:1px;
						  border-bottom-width:0px;"/>
					</div>
					<!-- End of 5 -->
					<!-- Start of Line 5 Instructions  -->
					<div style="11mm;width:187mm;font-size:8pt">
						<div class="styLNLeftNumBox" style="height:4mm;padding-left:0mm;"></div>
						<div class="styLNDesc" style="height:18mm;width:73mm;padding-left:2mm">
						 If proceeds of subsidized energy financing or private activity bonds were not used to finance 
						 your qualified clean electricity facility or your qualified energy storage technology, skip line 6, 
						 and go to line 7.
						  <!--Dotted Line-->
							<!--<span class="styDotLn" style="float:right;">..............</span>-->
						</div>
						<div class="styLNRightNumBoxNBB" style="height:18mm;padding-top:7.5mm;background-color:lightgrey">
						</div>
						<div class="styLNAmountBox" style="height:18mm;width:27mm;padding-top:8mm;font-size:7pt;
						 border-bottom-width:0px">
							<!--<xsl:call-template name="PopulateAmount">
							  <xsl:with-param name="TargetNode" 
							   select="$Form3468Data/QlfyInvstCreditFacilityPropGrp/AllocNameplateEnergyCapKWQty"/>
							</xsl:call-template>-->
						</div>
						<div class="styLNRightNumBoxNBB" style="height:18mm;background-color:lightgrey;
						 border-right-width:0mm"/>
						<div class="styLNAmountBox" style="height:18mm;width:27mm;border-bottom-width:0px;"/>      
						<div class="styLNRightNumBoxNBB" style="height:18mm;background-color:lightgrey;
						 border-left-width:1px;border-right-width:0px;"/>  
						<div class="styLNAmountBox" style="height:18mm;width:27mm;border-left-width:1px;
						  border-bottom-width:0px;"/>
					</div>
					<!-- End of 5 Instructions -->
					<!-- Start of Line 6a Instructions -->
					<div style="18mm;width:187mm;font-size:8pt;">
						<div class="styLNLeftNumBox" style="height:4mm;padding-left:0mm;">6a</div>
						<div class="styLNDesc" style="height:18mm;width:73mm;padding-left:2mm">
						 <b>Divide.</b> Sum, for the tax year and all prior tax years, of all proceeds of subsidized energy 
						 financing or private activity bonds used to finance the qualified facility or qualified storage 
						 technology, as of the close of the tax year
						</div>
						<div class="styLNRightNumBox" style="height:18mm;padding-top:14.5mm;background-color:lightgrey">
						</div>
						<div class="styLNAmountBox" style="height:18mm;width:27mm;padding-top:14.5mm;font-size:7pt">
						</div>
						<div class="styLNRightNumBoxNBB" style="height:18mm;background-color:lightgrey;
						 border-right-width:0mm"/>
						<div class="styLNAmountBox" style="height:18mm;width:27mm;border-bottom-width:0px;"/>      
						<div class="styLNRightNumBoxNBB" style="height:18mm;background-color:lightgrey;
						 border-left-width:1px;border-right-width:0px;"/>  
						<div class="styLNAmountBox" style="height:18mm;width:27mm;border-left-width:1px;
						  border-bottom-width:0px;"/>
					</div>
					<!-- End of 6a Instructions -->
					<!-- Start of 6a Amount Line -->
					<div style="2mm;width:187mm;font-size:8pt;">
						<div class="styLNLeftNumBox" style="height:2mm;width:30mm;padding-left:0mm;"></div>
						<div class="styLNAmountBox" style="height:2mm;width:33mm;padding-left:2mm;bottom-border-width:1mm;
						 border-left-width:0mm;"/>
						<div class="styLNRightNumBoxNBB" style="height:4mm;width:18mm;padding-top:0.5mm;
						 border-left-width:0mm;"></div>
						<div class="styLNRightNumBox" style="height:4mm;padding-top:0.5mm">6a</div>
						<div class="styLNAmountBox" style="height:4mm;width:27mm;padding-top:.5mm;font-size:8pt">
							<xsl:call-template name="PopulateAmount">
							  <xsl:with-param name="TargetNode" 
							   select="$Form3468Data/CalcTotEgyFncOrBondPct"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBoxNBB" style="height:4mm;background-color:lightgrey;
						 border-right-width:0mm"/>
						<div class="styLNAmountBox" style="height:4mm;width:27mm;border-bottom-width:0px;"/>      
						<div class="styLNRightNumBoxNBB" style="height:4mm;background-color:lightgrey;
						 border-left-width:1px;border-right-width:0px;"/>  
						<div class="styLNAmountBox" style="height:4mm;width:27mm;border-left-width:1px;
						  border-bottom-width:0px;"/>
					</div>
					<!-- End of 6a Amount Line -->
					<!-- Start of Line 6a pt2 -->
					<div style="14mm;width:187mm;font-size:8pt">
						<div class="styLNLeftNumBox" style="height:4mm;padding-left:0mm;"></div>
						<div class="styLNDesc" style="height:14mm;width:73mm;padding-left:2mm">
						 Aggregate amount of additions to the capital account for the qualified facility, for the tax year 
						 and all prior tax years, as of the close of the tax year
						</div>
						<div class="styLNRightNumBox" style="height:14mm;padding-top:10.5mm;background-color:lightgrey">
						</div>
						<div class="styLNAmountBox" style="height:14mm;width:27mm;padding-top:11mm;font-size:7pt;">
						</div>
						<div class="styLNRightNumBoxNBB" style="height:14mm;background-color:lightgrey;
						 border-right-width:0mm"/>
						<div class="styLNAmountBox" style="height:14mm;width:27mm;border-bottom-width:0px;"/>      
						<div class="styLNRightNumBoxNBB" style="height:14mm;background-color:lightgrey;
						 border-left-width:1px;border-right-width:0px;"/>  
						<div class="styLNAmountBox" style="height:14mm;width:27mm;border-left-width:1px;
						  border-bottom-width:0px;"/>
					</div>
					<!-- End of 6a pt2 -->
					<!-- Start of Line 6b -->
					<div style="4mm;width:187mm;font-size:8pt">
						<div class="styLNLeftNumBox" style="height:4mm;padding-left:4mm;">b</div>
						<div class="styLNDesc" style="height:4mm;width:73mm;padding-left:2mm">
						 Multiply line 5 by line 6a
						  <!--Dotted Line-->
							<span class="styDotLn" style="float:right;">.......</span>
						</div>
						<div class="styLNRightNumBox" style="height:4mm;padding-top:.5mm">6b</div>
						<div class="styLNAmountBox" style="height:4mm;width:27mm;padding-top:.5mm;font-size:8pt">
							<xsl:call-template name="PopulateAmount">
							  <xsl:with-param name="TargetNode" 
							   select="$Form3468Data/CalcTotEgyFncCrOrBondAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBoxNBB" style="height:4mm;background-color:lightgrey;
						 border-right-width:0mm"/>
						<div class="styLNAmountBox" style="height:4mm;width:27mm;border-bottom-width:0px;"/>      
						<div class="styLNRightNumBoxNBB" style="height:4mm;background-color:lightgrey;
						 border-left-width:1px;border-right-width:0px;"/>  
						<div class="styLNAmountBox" style="height:4mm;width:27mm;border-left-width:1px;
						  border-bottom-width:0px;"/>
					</div>
					<!-- End of 6b -->
					<!-- Start of Line 6c -->
					<div style="4mm;width:187mm;font-size:8pt">
						<div class="styLNLeftNumBox" style="height:4mm;padding-left:4mm;">c</div>
						<div class="styLNDesc" style="height:4mm;width:73mm;padding-left:2mm">
						 Multiply line 5 by 15% (0.15)
						  <!--Dotted Line-->
							<span class="styDotLn" style="float:right;">.......</span>
						</div>
						<div class="styLNRightNumBox" style="height:4mm;padding-top:.5mm">6c</div>
						<div class="styLNAmountBox" style="height:4mm;width:27mm;padding-top:.5mm;font-size:8pt">
							<xsl:call-template name="PopulateAmount">
							  <xsl:with-param name="TargetNode" 
							   select="$Form3468Data/CalcEgyFncCrOrBondPctAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBoxNBB" style="height:4mm;background-color:lightgrey;
						 border-right-width:0mm"/>
						<div class="styLNAmountBox" style="height:4mm;width:27mm;border-bottom-width:0px;"/>      
						<div class="styLNRightNumBoxNBB" style="height:4mm;background-color:lightgrey;
						 border-left-width:1px;border-right-width:0px;"/>  
						<div class="styLNAmountBox" style="height:4mm;width:27mm;border-left-width:1px;
						  border-bottom-width:0px;"/>
					</div>
					<!-- End of 6c -->
					<!-- Start of Line 6d -->
					<div style="4mm;width:187mm;font-size:8pt">
						<div class="styLNLeftNumBox" style="height:4mm;padding-left:4mm;">d</div>
						<div class="styLNDesc" style="height:4mm;width:73mm;padding-left:2mm">
						 Enter the smaller of line 6b or 6c
						  <!--Dotted Line-->
							<span class="styDotLn" style="float:right;">...</span>
						</div>
						<div class="styLNRightNumBox" style="height:4mm;padding-top:.5mm">6d</div>
						<div class="styLNAmountBox" style="height:4mm;width:27mm;padding-top:.5mm;font-size:8pt">
							<xsl:call-template name="PopulateAmount">
							  <xsl:with-param name="TargetNode" 
							   select="$Form3468Data/SmllrEgyFncCrOrBondAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBoxNBB" style="height:4mm;background-color:lightgrey;
						 border-right-width:0mm"/>
						<div class="styLNAmountBox" style="height:4mm;width:27mm;border-bottom-width:0px;"/>      
						<div class="styLNRightNumBoxNBB" style="height:4mm;background-color:lightgrey;
						 border-left-width:1px;border-right-width:0px;"/>  
						<div class="styLNAmountBox" style="height:4mm;width:27mm;border-left-width:1px;
						  border-bottom-width:0px;"/>
					</div>
					<!-- End of 6d -->
					<!-- Start of Line 6e -->
					<div style="4mm;width:187mm;font-size:8pt">
						<div class="styLNLeftNumBox" style="height:4mm;padding-left:4mm;">e</div>
						<div class="styLNDesc" style="height:4mm;width:73mm;padding-left:2mm">
						 Subtract line 6d from line 5
						  <!--Dotted Line-->
							<span class="styDotLn" style="float:right;">......</span>
						</div>
						<div class="styLNRightNumBox" style="height:4mm;padding-top:.5mm">6e</div>
						<div class="styLNAmountBox" style="height:4mm;width:27mm;padding-top:.5mm;font-size:8pt">
							<xsl:call-template name="PopulateAmount">
							  <xsl:with-param name="TargetNode" 
							   select="$Form3468Data/LessSmllrEgyFncCrOrBondAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBoxNBB" style="height:4mm;background-color:lightgrey;
						 border-right-width:0mm"/>
						<div class="styLNAmountBox" style="height:4mm;width:27mm;border-bottom-width:0px;"/>      
						<div class="styLNRightNumBoxNBB" style="height:4mm;background-color:lightgrey;
						 border-left-width:1px;border-right-width:0px;"/>  
						<div class="styLNAmountBox" style="height:4mm;width:27mm;border-left-width:1px;
						  border-bottom-width:0px;"/>
					</div>
					<!-- End of 6e -->
					<!-- Start of Line 7 -->
					<div style="14mm;width:187mm;font-size:8pt">
						<div class="styLNLeftNumBox" style="height:4mm;padding-left:4mm;">7</div>
						<div class="styLNDesc" style="height:14mm;width:73mm;padding-left:2mm">
						 If proceeds of subsidized energy financing or private activity bonds were used to finance your 
						 facility, enter the amount from line 6e. Otherwise, enter the amount from line 5
						  <!--Dotted Line-->
							<!--<span class="styDotLn" style="float:right;">......</span>-->
						</div>
						<div class="styLNRightNumBox" style="height:14mm;padding-top:10.5mm">7</div>
						<div class="styLNAmountBox" style="height:14mm;width:27mm;padding-top:10.5mm;font-size:8pt">
							<xsl:call-template name="PopulateAmount">
							  <xsl:with-param name="TargetNode" 
							   select="$Form3468Data/FncFcltyEgyFncCrOrBondAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBoxNBB" style="height:14mm;background-color:lightgrey;
						 border-right-width:0mm"/>
						<div class="styLNAmountBox" style="height:14mm;width:27mm;border-bottom-width:0px;"/>      
						<div class="styLNRightNumBoxNBB" style="height:14mm;background-color:lightgrey;
						 border-left-width:1px;border-right-width:0px;"/>  
						<div class="styLNAmountBox" style="height:14mm;width:27mm;border-left-width:1px;
						  border-bottom-width:0px;"/>
					</div>
					<!-- End of 7 -->
					<!-- Line 8 Instructions -->
					<div style="height:23mm;width:187mm;font-size:8pt;">
						<div class="styLNLeftNumBox" style="height:4mm;padding-top:1.5mm;padding-left:0mm">8</div>
						<div class="styLNDesc" style="height:23mm;width:108mm;padding-top:2mm;padding-left:2mm;">
						  If you are making an elective payment election under section 6417 and the facility doesn’t meet 
						  the rules of section 45Y(g)(12)(B)(i), doesn’t have a maximum net output of less than 1 MW 
						  (as measured in ac), or meet an exception under section 45Y(g)(12)(D), and construction began in 
						  2024, 2025, or after 2025, multiply line 7 by line A, B, or C below.  All others, enter the amount 
						  from line 7.
						</div>
						<div class="styLNRightNumBoxNBB" style="height:23mm;padding-top:12.5mm;background-color:lightgrey">
						</div>
						<div class="styLNAmountBoxNBB" style="height:23mm;width:27mm;padding-top:13mm;">
						</div>
						 <div class="styLNRightNumBoxNBB" style="height:23mm;background-color:lightgrey;"/>
						 <div class="styLNAmountBoxNBB" style="height:23mm;width:27mm;border-left-width:1px;
						  border-bottom-width:0px;"/>  
					</div>
					<!-- End of 8 Instructions -->
					<!-- Line 8A Non Amount Line -->
					<div style="height:4mm;width:187mm;font-size:8pt">
						<div class="styLNLeftNumBox" style="height:4mm;width:15mm;padding-top:.5mm;padding-left:0mm"></div>
						<div class="styLNDesc" style="height:4mm;width:101mm;padding-top:.5mm;padding-left:2mm;">
						  A. Construction began in 2024, 90% (0.90)
						</div>
						<div class="styLNRightNumBoxNBB" style="height:4mm;padding-top:.5mm;background-color:lightgrey">
						</div>
						<div class="styLNAmountBoxNBB" style="height:4mm;width:27mm;padding-top:.5mm;">
						</div>
						 <div class="styLNRightNumBoxNBB" style="height:4mm;background-color:lightgrey;"/>
						 <div class="styLNAmountBox" style="height:4mm;width:27mm;border-left-width:1px;
						  border-bottom-width:0px;"/>  
					</div>
					<!-- End of 8A NonAmount Line -->
					<!-- Line 8B Amount Line -->
					<div style="height:4mm;width:187mm;font-size:8pt">
						<div class="styLNLeftNumBox" style="height:4mm;width:15mm;padding-top:.5mm;padding-left:0mm"></div>
						<div class="styLNDesc" style="height:4mm;width:101mm;padding-top:.5mm;padding-left:2mm;">
						  B. Construction began in 2025, 85% (0.85)
						</div>
						<div class="styLNRightNumBoxNBB" style="height:4mm;padding-top:.5mm;background-color:lightgrey;"></div>
						<div class="styLNAmountBoxNBB" style="height:4mm;width:27mm;padding-top:.5mm;">
						</div>
						 <div class="styLNRightNumBoxNBB" style="height:4mm;width:8.3mm;background-color:lightgrey;border-right-width:1px"/>
					</div>
					<!-- End of 8B Amount Line -->
					<!-- Line 8B Amount Line -->
					<div style="height:4mm;width:187mm;font-size:8pt">
						<div class="styLNLeftNumBox" style="height:4mm;width:15mm;padding-top:.5mm;padding-left:0mm"></div>
						<div class="styLNDesc" style="height:4mm;width:101mm;padding-top:.5mm;padding-left:2mm;">
						  C. Construction began after 2025, 0% (0.00)
						</div>
						<div class="styLNRightNumBox" style="height:4mm;padding-top:.5mm;">8</div>
						<div class="styLNAmountBox" style="height:4mm;width:27mm;padding-top:.5mm;">
						  <xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" 
							 select="$Form3468Data/ACLess1MWEPESect48a12BAmt"/>
						  </xsl:call-template>
						</div>
						 <div class="styLNRightNumBoxNBB" style="height:4mm;background-color:lightgrey;"/>
						 <div class="styLNAmountBox" style="height:4mm;width:27mm;border-left-width:1px;
						  border-bottom-width:0px;"/>  
					</div>
					<!-- End of 8C Amount Line -->
					<!-- Line 9 -->
					<div style="height:4mm;width:187mm;font-size:8pt;">
						<div class="styLNLeftNumBox" style="height:4mm;padding-top:.5mm;padding-left:0mm">9</div>
						<div class="styLNDesc" style="height:7.5mm;width:108mm;padding-top:0mm;padding-left:2mm;">
						  Reserved for future use
						  <!--Dotted Line-->
						  <span class="styDotLn" style="float:right;">.................</span>
						</div>
						<div class="styLNRightNumBox" style="height:4mm;padding-top:.5mm;">9</div>
						<div class="styLNAmountBox" style="height:4mm;width:27mm;padding-top:.5mm;
						 background-color:lightgrey">
						  <!--<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" 
							 select="$Form3468Data/UnusedCreditFromCoopAmt"/>
						  </xsl:call-template>-->
						</div>
						 <div class="styLNRightNumBoxNBB" style="height:4mm;background-color:lightgrey;"/>
						 <div class="styLNAmountBoxNBB" style="height:4mm;width:27mm;border-left-width:1px;"/>
					</div>
					<!-- End of 9 -->
					<!-- Line 10 -->
					<div style="height:7.5mm;width:187mm;font-size:8pt">
						<div class="styLNLeftNumBox" style="height:4mm;padding-top:.5mm;padding-left:0mm">10</div>
						<div class="styLNDesc" style="height:7.5mm;width:108mm;padding-top:0mm;padding-left:2mm;">
						  Enter the applicable unused investment credit from cooperatives (see instructions)
						  <!--Dotted Line-->
						  <span class="styDotLn" style="float:right;">.....................</span>
						</div>
						<div class="styLNRightNumBox" style="height:7.5mm;padding-top:3.5mm;">10</div>
						<div class="styLNAmountBox" style="height:7.5mm;width:27mm;padding-top:3.5mm;">
						  <xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" 
							 select="$Form3468Data/UnusedCoopInvstCrAmt"/>
						  </xsl:call-template>
						</div>
						 <div class="styLNRightNumBoxNBB" style="height:7.5mm;background-color:lightgrey;"/>
						 <div class="styLNAmountBox" style="height:7.5mm;width:27mm;border-left-width:1px;
						  border-bottom-width:0px;"/>  
					</div>
					<!-- End of 10 -->
					<!--Line 11 -->
					<div style="height:4.5mm;width:187mm;font-size:8pt">
						<div class="styLNLeftNumBox" style="height:4.5mm;padding-top:.5mm;padding-left:0mm">11</div>
						<div class="styLNDesc" style="width:143mm;height:4.5mm;padding-top:.5mm;padding-left:2mm;">
						  Add lines 8 and 10. Report this amount on Form 3800, Part III, line 1v
							<!--Dotted Line-->
							<span class="styDotLn" style="float:none;">.........</span>
						</div>
						<div class="styLNRightNumBoxNBB" style="height:4.5mm;padding-top:1mm">11</div>
						<div class="styLNAmountBox" style="height:4.5mm;width:27mm;padding-top:1mm;border-left-width:1px;
						 border-bottom-width:0px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" 
								select="$Form3468Data/TotReportableEgyFncCrAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- End of 11 -->					
						<!-- Page Break and Footer-->
					<div class="styBB" style="width:187mm;clear:both;padding-top:0.4mm;border-top-width:2px;
					 border-bottom-width:0px">
						<!--<div style="width:90mm;font-weight:bold;font-size:7pt" class="styGenericDiv">For Paperwork 
						 Reduction Act Notice, see separate instructions.</div>
						<div style="width:55mm;text-align:center;" class="styGenericDiv">Cat. No. 12276E</div>-->
						<div style="float:right;" class="styGenericDiv">Form <span class="styBoldText">3468</span> (2025)
						</div>
					</div>
					<br/>
					<div class="pageEnd"/>
					<div style="page-break-after:always"/>
					<!-- End Footer -->
					<!-- Header -->
					<div style="width:187mm;padding-top:1mm;float:left">
					  Form 3468 (2025)
						<span style="width:15mm;float:right;">Page 
							<span class="styBoldText" style="font-size:8pt;">5</span>
						</span>
					</div>
					<!-- Start of Part VI -->
					<div class="styBB" style="width:187mm;border-top-width:1px;">
						<div class="styPartName" style="width:15mm;height:5mm; font-size:8pt;padding-top:1mm;">Part VI
						</div>
						<div class="styPartDesc" style="width:170mm; height:auto; font-weight:normal;font-size:9pt;
						 padding-left:2mm;padding-top:1mm">
						 <b>Energy Credit Under Section 48</b>
						</div>
					</div>
					<div class="styBB" style="width:187mm;border-top-width:1px;">
						<div class="styPartDesc" style="width:170mm; height:auto; font-weight:normal;font-size:9pt;
						 padding-left:0mm;padding-top:1mm"><b>Section A—Geothermal Energy Credit</b> (see instructions)
						</div>
					</div>
					<!-- Start of Line 1a -->
					<div style="height:7.5mm;width:187mm;font-size:8pt">
						<div class="styLNLeftNumBox" style="height:1mm;padding-left:2mm">1a</div>
						<div class="styLNDesc" style="height:7.5mm;width:73mm;padding-left:2mm">
						 Enter the basis of property using geothermal energy placed in service during the tax year
						  <!--Dotted Line-->
						  <span class="styDotLn" style="float:right;">..</span>
						</div>
						<div class="styLNRightNumBox" style="height:7.5mm;padding-top:4mm">1a</div>
						<div class="styLNAmountBox" style="height:7.5mm;width:27mm;padding-top:4mm;font-size:8pt">
							<xsl:call-template name="PopulateAmount">
							  <xsl:with-param name="TargetNode" 
							   select="$Form3468Data/GeothermalEnergyPropCrGrp/GeothermalEnergyPropBasisAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBoxNBB" style="height:7.5mm;background-color:lightgrey;
						 border-right-width:0mm"/>
						<div class="styLNAmountBox" style="height:7.5mm;width:27mm;border-bottom-width:0px;"/>      
						<div class="styLNRightNumBoxNBB" style="height:7.5mm;background-color:lightgrey;
						  padding-top:3.5mm;border-left-width:1px;border-right-width:0px;"/>  
						<div class="styLNAmountBox" style="height:7.5mm;width:27mm;border-left-width:1px;
						  border-bottom-width:0px;"/>
					</div>
					<!-- End of 1a -->
					<!-- Start of Line 1b -->
					<div style="width:187mm;font-size:8pt">
						<div class="styLNLeftNumBox" style="height:7mm;padding-top:3.5mm;padding-left:4mm">b</div>
						<div class="styLNDesc" style="width:73mm;height:7mm;padding-top:3.5mm;padding-left:2mm">
						 Applicable energy percentage. See instructions
						  <!--Dotted Line-->
							<!--<span class="styDotLn" style="float:right;">.....</span>-->
						</div>
						<div class="styLNRightNumBox" style="height:7mm;padding-top:3.5mm">1b</div>
						<div class="styLNAmountBox" style="height:7mm;width:27mm;padding-top:3.5mm;font-size:8pt">
							<xsl:call-template name="PopulateAmount">
							  <xsl:with-param name="TargetNode" 
							   select="$Form3468Data/GeothermalEnergyPropCrGrp/NetOutLss1MWACOrStsfdWgReqPct"/>
							</xsl:call-template>%
						</div>
						<div class="styLNRightNumBoxNBB" style="height:7mm;background-color:lightgrey;
						 border-right-width:0mm"/>
						<div class="styLNAmountBox" style="height:7mm;width:27mm;border-bottom-width:0px;"/>      
						<div class="styLNRightNumBoxNBB" style="height:7mm;background-color:lightgrey;
						  padding-top:6.5mm;border-left-width:1px;border-right-width:0px;"/>  
						<div class="styLNAmountBox" style="height:7mm;width:27mm;border-left-width:1px;
						  border-bottom-width:0px;"/>
					</div>
					<!-- End of 1b -->
					<!-- Line 1c -->
					<div style="width:187mm;font-size:8pt">
						<div class="styLNLeftNumBox" style="height:7.5mm;padding-top:3.5mm;padding-left:4mm">c</div>
						<div class="styLNDesc" style="width:108mm;height:7.5mm;padding-top:3.5mm;padding-left:2mm;">
						  <span style="text-align:left;">Multiply line 1a by line 1b</span>
						  <!--Dotted Line-->
						  <span class="styDotLn" style="float:right;">...............</span>
						</div>
						<div class="styLNRightNumBox" style="height:7.5mm;padding-top: 3.5mm;">1c</div>
						<div class="styLNAmountBox" style="width:27mm;height:7.5mm;padding-top:3.5mm;">
						  <xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" 
							 select="$Form3468Data/GeothermalEnergyPropCrGrp/CalcGeothermalEgyPropBasisAmt"/>
						  </xsl:call-template>
						</div>
						<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;height:7.5mm;"/>  
						<div class="styLNAmountBox" style="width:27mm;height:7.5mm;border-left-width:1px;
						  border-bottom-width:0px;"/>  
					</div>
					<!-- End of 1c -->
					<!-- Start of Line 1d -->
					<div style="width:187mm;font-size:8pt">
						<div class="styLNLeftNumBox" style="height:1mm;padding-left:4mm">d</div>
						<div class="styLNDesc" style="width:73mm;height:7.5mm;padding-left:2mm">
						 If you checked the box in Part I, line 9a, enter 10%. If you checked the box in Part I, line 9b, 
						 enter 2%. Otherwise, go to line 1f
						  <!--Dotted Line-->
							<span class="styDotLn" style="float:right;">.....</span>
						</div>
						<div class="styLNRightNumBox" style="height:10mm;padding-top:6.5mm">1d</div>
						<div class="styLNAmountBox" style="height:10mm;width:27mm;padding-top:6.5mm;font-size:8pt">
							<xsl:call-template name="PopulateAmount">
							  <xsl:with-param name="TargetNode" 
							   select="$Form3468Data/GeothermalEnergyPropCrGrp/DomContentBonusCreditPct"/>
							</xsl:call-template>%
						</div>
						<div class="styLNRightNumBoxNBB" style="height:10mm;background-color:lightgrey;
						 border-right-width:0mm"/>
						<div class="styLNAmountBox" style="height:10mm;width:27mm;border-bottom-width:0px;"/>      
						<div class="styLNRightNumBoxNBB" style="height:10mm;background-color:lightgrey;
						  padding-top:6.5mm;border-left-width:1px;border-right-width:0px;"/>  
						<div class="styLNAmountBox" style="height:10mm;width:27mm;border-left-width:1px;
						  border-bottom-width:0px;"/>
					</div>
					<!-- End of 1d -->
					<!-- Line 1e -->
					<div style="width:187mm;font-size:8pt">
						<div class="styLNLeftNumBox" style="height:7.5mm;padding-top:3.5mm;padding-left:4mm">e</div>
						<div class="styLNDesc" style="width:108mm;height:7.5mm;padding-top:3.5mm;padding-left:2mm;">
						  <span style="text-align:left;">Multiply line 1a by line 1d</span>
						  <!--Dotted Line-->
						  <span class="styDotLn" style="float:right;">................</span>
						</div>
						<div class="styLNRightNumBox" style="height:7.5mm;padding-top: 3.5mm;">1e</div>
						<div class="styLNAmountBox" style="width:27mm;height:7.5mm;padding-top:3.5mm;">
						  <xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" 
							 select="$Form3468Data/GeothermalEnergyPropCrGrp/CalcDomContentBonusCreditAmt"/>
						  </xsl:call-template>
						</div>
						 <div class="styLNRightNumBoxNBB" style="background-color:lightgrey;height:7.5mm;"/>  
						 <div class="styLNAmountBox" style="width:27mm;height:7.5mm;border-left-width:1px;
						  border-bottom-width:0px;"/>  
					</div>
					<!-- End of 1e -->
					<!-- Start of Line 1f -->
					<div style="width:187mm;font-size:8pt">
						<div class="styLNLeftNumBox" style="height:1mm;padding-left:4mm">f</div>
						<div class="styLNDesc" style="width:73mm;height:7.5mm;padding-left:2mm">
						 If you checked the box in Part I, line 10a, enter 10%. If you checked the box in Part I, line 
						 10b, enter 2%. Otherwise, go to line 2
						  <!--Dotted Line-->
							<span class="styDotLn" style="float:right;">.....</span>
						</div>
						<div class="styLNRightNumBox" style="height:10mm;padding-top:6.5mm">1f</div>
						<div class="styLNAmountBox" style="height:10mm;width:27mm;padding-top:6.5mm;font-size:8pt">
							<xsl:call-template name="PopulateAmount">
							  <xsl:with-param name="TargetNode" 
							   select="$Form3468Data/GeothermalEnergyPropCrGrp/EnergyComBonusCreditPct"/>
							</xsl:call-template>%
						</div>
						<div class="styLNRightNumBoxNBB" style="height:10mm;background-color:lightgrey;
						 border-right-width:0mm"/>
						<div class="styLNAmountBox" style="height:10mm;width:27mm;border-bottom-width:0px;"/>      
						<div class="styLNRightNumBoxNBB" style="height:10mm;background-color:lightgrey;
						  padding-top:6.5mm;border-left-width:1px;border-right-width:0px;"/>  
						<div class="styLNAmountBox" style="height:10mm;width:27mm;border-left-width:1px;
						  border-bottom-width:0px;"/>
					</div>
					<!-- End of 1f -->
					<!-- Line 1g -->
					<div style="width:187mm;font-size:8pt">
						<div class="styLNLeftNumBox" style="height:7.5mm;padding-top:3.5mm;padding-left:4mm">g</div>
						<div class="styLNDesc" style="width:108mm;height:7.5mm;padding-top:3.5mm;padding-left:2mm;">
						  <span style="text-align:left;">Multiply line 1a by line 1f</span>
						  <!--Dotted Line-->
						  <span class="styDotLn" style="float:right;">.................</span>
						</div>
						<div class="styLNRightNumBox" style="height:7.5mm;padding-top: 3.5mm;">1g</div>
						<div class="styLNAmountBox" style="width:27mm;height:7.5mm;padding-top:3.5mm;">
						  <xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" 
							 select="$Form3468Data/GeothermalEnergyPropCrGrp/CalcEnergyComBonusCreditAmt"/>
						  </xsl:call-template>
						</div>
						 <div class="styLNRightNumBoxNBB" style="background-color:lightgrey;height:7.5mm;"/>  
						 <div class="styLNAmountBox" style="width:27mm;height:7.5mm;border-left-width:1px;
						  border-bottom-width:0px;"/>  
					</div>
					<!-- End of 1g -->
					<!--Line 2 -->
					<div style="width:187mm;font-size:8pt">
						<div class="styLNLeftNumBox" style="height:7.5mm;padding-top:3.5mm;padding-left:2mm">2</div>
						<div class="styLNDesc" style="width:143mm;height:7.5mm;padding-top:4mm;padding-left:2mm;">
						  Add lines 1c, 1e, and 1g
							<!--Dotted Line-->
							<div class="styDotLn" style="float:none;padding-right:1mm;">.........................</div>						  
						</div>
						<div class="styLNRightNumBoxNBB" style="height:8mm;padding-top:5mm">2</div>
						<div class="styLNAmountBox" style="width:27mm;height:8mm;padding-top:4.5mm;border-left-width:1px;
						 border-bottom-width:0px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form3468Data/TotalGeothermalEnergyPropCrAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- End of 2 -->
					<!-- Start of Part VI Section B cont. -->					
					<div class="styBB" style="width:187mm;border-top-width:1px;">
						<div class="styPartDesc" style="width:170mm; height:auto; font-weight:normal;font-size:9pt;
						 padding-left:0mm;padding-top:1mm"><b>Section B—Solar Energy Credit</b> (see instructions)
						</div>
					</div>
					<!-- Start of Line 3a -->
					<div style="height:14mm;width:187mm;font-size:8pt">
						<div class="styLNLeftNumBox" style="height:1mm;padding-left:2mm">3a</div>
						<div class="styLNDesc" style="height:14mm;width:73mm;padding-left:2mm">
						 Enter the basis of property using solar illumination (including electrochromic glass) or either 
						 solar energy property or solar facility placed in service during the tax year
						  <!--Dotted Line-->
						  <span class="styDotLn" style="float:right;">....</span>
						</div>
						<div class="styLNRightNumBox" style="height:14mm;padding-top:10mm">3a</div>
						<div class="styLNAmountBox" style="height:14mm;width:27mm;padding-top:10.5mm;font-size:8pt">
							<xsl:call-template name="PopulateAmount">
							  <xsl:with-param name="TargetNode" 
							   select="$Form3468Data/SolarEnergyPropCrGrp/PropSolarIllmntnOrEgyBssAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBoxNBB" style="height:14mm;background-color:lightgrey;
						 border-right-width:0mm"/>
						<div class="styLNAmountBox" style="height:14mm;width:27mm;border-bottom-width:0px;"/>      
						<div class="styLNRightNumBoxNBB" style="height:14mm;background-color:lightgrey;
						  padding-top:3.5mm;border-left-width:1px;border-right-width:0px;"/>  
						<div class="styLNAmountBox" style="height:14mm;width:27mm;border-left-width:1px;
						  border-bottom-width:0px;"/>
					</div>
					<!-- End of 3a -->
					<!-- Start of Line 3b -->
					<div style="width:187mm;font-size:8pt">
						<div class="styLNLeftNumBox" style="height:10mm;padding-top:6.5mm;padding-left:4mm">b</div>
						<div class="styLNDesc" style="height:10mm;width:73mm;padding-top:6.5mm;padding-left:2mm">
						 Applicable energy percentage. See instructions
						  <!--Dotted Line-->
							<!--<span class="styDotLn" style="float:right;">.....</span>-->
						</div>
						<div class="styLNRightNumBox" style="height:10mm;padding-top:6.5mm">3b</div>
						<div class="styLNAmountBox" style="height:10mm;width:27mm;padding-top:6.5mm;font-size:8pt">
							<xsl:call-template name="PopulateAmount">
							  <xsl:with-param name="TargetNode" 
							   select="$Form3468Data/SolarEnergyPropCrGrp/NetOutLss1MWACOrStsfdWgReqPct"/>
							</xsl:call-template>%
						</div>
						<div class="styLNRightNumBoxNBB" style="height:10mm;background-color:lightgrey;
						 border-right-width:0mm"/>
						<div class="styLNAmountBox" style="height:10mm;width:27mm;border-bottom-width:0px;"/>      
						<div class="styLNRightNumBoxNBB" style="height:10mm;background-color:lightgrey;
						  padding-top:6.5mm;border-left-width:1px;border-right-width:0px;"/>  
						<div class="styLNAmountBox" style="height:10mm;width:27mm;border-left-width:1px;
						  border-bottom-width:0px;"/>
					</div>
					<!-- End of 3b -->
					<!-- Line 3c -->
					<div style="width:187mm;font-size:8pt">
						<div class="styLNLeftNumBox" style="height:7.5mm;padding-top:3.5mm;padding-left:4mm">c</div>
						<div class="styLNDesc" style="width:108mm;height:7.5mm;padding-top:3.5mm;padding-left:2mm;">
						  <span style="text-align:left;">Multiply line 3a by line 3b</span>
						  <!--Dotted Line-->
						  <span class="styDotLn" style="float:right;">...............</span>
						</div>
						<div class="styLNRightNumBox" style="height:7.5mm;padding-top: 3.5mm;">3c</div>
						<div class="styLNAmountBox" style="width:27mm;height:7.5mm;padding-top:3.5mm;">
						  <xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" 
							 select="$Form3468Data/SolarEnergyPropCrGrp/CalcPropSolarIllmntnOrEgyAmt"/>
						  </xsl:call-template>
						</div>
						 <div class="styLNRightNumBoxNBB" style="background-color:lightgrey;height:7.5mm;"/>  
						 <div class="styLNAmountBox" style="width:27mm;height:7.5mm;border-left-width:1px;
						  border-bottom-width:0px;"/>  
					</div>
					<!-- End of 3c -->
					<!-- Start Caution -->
					<div style="height:14mm;width:187mm;font-size:8pt">
						<div class="styLNDesc" style="height:14mm;width:116mm;padding-left:2mm">
						 <b>Caution:</b> Property described under section 48(a)(3)(ii) does not qualify for the solar 
						 facility in connection with low-income community bonus credit under section 48(e). If completing 
						 Section B for a section 48(a)(3)(ii) property, skip lines 3d through 3j, and go to line 3k.
						</div>
						<div class="styLNRightNumBoxNBB" style="height:14mm;background-color:lightgrey;
						 border-right-width:0mm"/>
						<div class="styLNAmountBox" style="height:14mm;width:27mm;border-bottom-width:0px;"/>      
						<div class="styLNRightNumBoxNBB" style="height:14mm;background-color:lightgrey;
						  padding-top:3.5mm;border-left-width:1px;border-right-width:0px;"/>  
						<div class="styLNAmountBox" style="height:14mm;width:27mm;border-left-width:1px;
						  border-bottom-width:0px;"/>
					</div>
					<!-- End Caution -->
					<!-- Start of Line 3d -->
					<div style="height:28mm;width:187mm;font-size:8pt">
						<div class="styLNLeftNumBox" style="height:1mm;padding-left:4mm">d</div>
						<div class="styLNDesc" style="height:28mm;width:73mm;padding-left:2mm">
						 If you checked the box in Part I, line 11a or 11b, enter 10%. If you checked the box in Part I, line
						 11c or 11d, enter 20%. However, if you checked the box in Part I, line 11g; or Part I, line 12a(ii),
						 is 5 MW ac or more (in relation to line 11a, 11b, 11c, or 11d), you don’t qualify for the bonus 
						 credit. In that situation, enter 0% here, go to line 3j and enter -0-, and then go to line 3k
						  <!--Dotted Line-->
						  <span class="styDotLn" style="float:right;">...</span>
						</div>
						<div class="styLNRightNumBox" style="height:28mm;padding-top:24.5mm">3d</div>
						<div class="styLNAmountBox" style="height:28mm;width:27mm;padding-top:24.5mm;font-size:8pt;
						  border-bottom-width:0mm">
							<xsl:call-template name="PopulateAmount">
							  <xsl:with-param name="TargetNode" 
							   select="$Form3468Data/SolarEnergyPropCrGrp/LowIncmSolarWindBonusCrPct"/>
							</xsl:call-template>%
						</div>
						<div class="styLNRightNumBoxNBB" style="height:28mm;background-color:lightgrey;
						 border-right-width:0mm"/>
						<div class="styLNAmountBox" style="height:28mm;width:27mm;border-bottom-width:0px;"/>      
						<div class="styLNRightNumBoxNBB" style="height:28mm;background-color:lightgrey;
						  padding-top:3.5mm;border-left-width:1px;border-right-width:0px;"/>  
						<div class="styLNAmountBox" style="height:28mm;width:27mm;border-left-width:1px;
						  border-bottom-width:0px;"/>
					</div>
					<!-- End of 3d -->
					<!-- Start of Line 3e -->
					<div style="height:7.5mm;width:187mm;font-size:8pt">
						<div class="styLNLeftNumBox" style="height:1mm;padding-left:4mm">e</div>
						<div class="styLNDesc" style="height:7.5mm;width:73mm;padding-left:2mm">
						 Enter the amount of capacity limitation you were allocated in the allocation letter
						  <!--Dotted Line-->
						  <span class="styDotLn" style="float:right;">......</span>
						</div>
						<div class="styLNRightNumBox" style="height:7.5mm;padding-top:3.5mm">3e</div>
						<div class="styLNAmountBox" style="height:7.5mm;width:48mm;padding-top:3.5mm;font-size:8pt;
						  border-top-width:1px">
							<xsl:call-template name="PopulateAmount">
							  <xsl:with-param name="TargetNode" 
							   select="$Form3468Data/SolarEnergyPropCrGrp/AllocLmtEnergyCapKWQty"/>
							</xsl:call-template>kWdc
						</div>
						<!--<div class="styLNRightNumBoxNBB" style="height:28mm;background-color:lightgrey;
						 border-right-width:0mm"/>-->
						<div class="styLNAmountBox" style="height:7.5mm;width:14mm;border-bottom-width:0px;"/>      
						<div class="styLNRightNumBoxNBB" style="height:28mm;background-color:lightgrey;
						  padding-top:3.5mm;border-left-width:1px;border-right-width:0px;"/>  
						<div class="styLNAmountBox" style="height:28mm;width:27mm;border-left-width:1px;
						  border-bottom-width:0px;"/>
					</div>
					<!-- End of 3e -->
					<!-- Start of Line 3f -->
					<div style="height:11mm;width:187mm;font-size:8pt">
						<div class="styLNLeftNumBox" style="height:1mm;padding-left:4mm">f</div>
						<div class="styLNDesc" style="height:10mm;width:73mm;padding-left:2mm">
						 If the entry on Part I, line 12a(i), equals the entry on line 3e, multiply line 3a by line 3d and go 
						 to line 3j. Otherwise, continue to line 3g
						  <!--Dotted Line-->
						  <span class="styDotLn" style="float:right;">..</span>
						</div>
						<div class="styLNRightNumBox" style="height:11mm;padding-top:7.5mm">3f</div>
						<div class="styLNAmountBox" style="height:11mm;width:27mm;padding-top:7.5mm;font-size:8pt">
							<xsl:call-template name="PopulateAmount">
							  <xsl:with-param name="TargetNode" 
							   select="$Form3468Data/SolarEnergyPropCrGrp/LowIncmComFullBonusCrAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBoxNBB" style="height:11mm;background-color:lightgrey;
						 border-right-width:0mm"/>
						<div class="styLNAmountBox" style="height:11mm;width:27mm;border-bottom-width:0px;"/>      
						<div class="styLNRightNumBoxNBB" style="height:11mm;background-color:lightgrey;
						  padding-top:3.5mm;border-left-width:1px;border-right-width:0px;"/>  
						<div class="styLNAmountBox" style="height:11mm;width:27mm;border-left-width:1px;
						  border-bottom-width:0px;"/>
					</div>
					<!-- End of 3f -->
					<!-- Start of Line 3g -->
					<div style="height:11mm;width:187mm;font-size:8pt">
						<div class="styLNLeftNumBox" style="height:11mm;padding-left:4mm">g</div>
						<div class="styLNDesc" style="height:11mm;width:73mm;padding-left:2mm">
						 If the entry on Part I, line 12a(i), is more than the entry on line 3e, divide line 3e by Part I, 
						 line 12a(i)
						  <!--Dotted Line-->
						  <span class="styDotLn" style="float:right;">...............</span>
						</div>
						<div class="styLNRightNumBox" style="height:11mm;padding-top:7mm">3g</div>
						<div class="styLNAmountBox" style="height:11mm;width:27mm;padding-top:7.5mm;font-size:8pt">
							<xsl:call-template name="PopulateAmount">
							  <xsl:with-param name="TargetNode"
							   select="$Form3468Data/SolarEnergyPropCrGrp/LowIncmComAllocRedFctrRt"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBoxNBB" style="height:11mm;background-color:lightgrey;
						 border-right-width:0mm"/>
						<div class="styLNAmountBox" style="height:11mm;width:27mm;border-bottom-width:0px;"/>      
						<div class="styLNRightNumBoxNBB" style="height:11mm;background-color:lightgrey;
						  padding-top:3.5mm;border-left-width:1px;border-right-width:0px;"/>  
						<div class="styLNAmountBox" style="height:11mm;width:27mm;border-left-width:1px;
						  border-bottom-width:0px;"/>
					</div>
					<!-- End of 3g -->
					<!-- Start of Line 3h -->
					<div style="height:4mm;width:187mm;font-size:8pt">
						<div class="styLNLeftNumBox" style="height:4mm;padding-left:4mm">h</div>
						<div class="styLNDesc" style="height:4mm;width:73mm;padding-left:2mm">
						 Multiply line 3d by line 3g
						  <!--Dotted Line-->
						  <span class="styDotLn" style="float:right;">........</span>
						</div>
						<div class="styLNRightNumBox" style="height:4mm;padding-top:.5mm;border-bottom-width:1px">3h</div>
						<div class="styLNAmountBox" style="height:4mm;width:27mm;padding-top:.5mm;font-size:8pt;
						 border-bottom-width:1px">
							<xsl:call-template name="PopulateAmount">
							  <xsl:with-param name="TargetNode" 
							   select="$Form3468Data/SolarEnergyPropCrGrp/LowIncmComPctRedFctrRt"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBoxNBB" style="height:4mm;background-color:lightgrey;
						 border-right-width:0mm;border-bottom-width:0px"/>
						<div class="styLNAmountBox" style="height:4mm;width:27mm;border-bottom-width:0px;"/>      
						<div class="styLNRightNumBoxNBB" style="height:4mm;background-color:lightgrey;
						  padding-top:3.5mm;border-left-width:1px;border-right-width:0px;"/>  
						<div class="styLNAmountBox" style="height:4mm;width:27mm;border-left-width:1px;
						  border-bottom-width:0px;"/>
					</div>
					<!-- End of 3h -->
					<div style="width:187mm;font-size:8pt">
						<div class="styLNLeftNumBox" style="height:4mm;padding-left:4mm;">i</div>
						<div class="styLNDesc" style="height:4mm;width:73mm;padding-left:2mm">
						 Multiply line 3a by line 3h
						  <!--Dotted Line-->
							<span class="styDotLn" style="float:right;">........</span>
						</div>
						<div class="styLNRightNumBox" style="height:4mm;padding-top:.5mm">3i</div>
						<div class="styLNAmountBox" style="height:4mm;width:27mm;padding-top:.5mm;font-size:8pt">
							<xsl:call-template name="PopulateAmount">
							  <xsl:with-param name="TargetNode" 
							   select="$Form3468Data/SolarEnergyPropCrGrp/LowIncmComRedFctrCrAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBoxNBB" style="height:4mm;background-color:lightgrey;
						 border-right-width:0mm"/>
						<div class="styLNAmountBox" style="height:4mm;width:27mm;border-bottom-width:0px;"/>      
						<div class="styLNRightNumBoxNBB" style="height:4mm;background-color:lightgrey;
						 border-left-width:1px;border-right-width:0px;"/>  
						<div class="styLNAmountBox" style="height:4mm;width:27mm;border-left-width:1px;
						  border-bottom-width:0px;"/>
					</div>
					<!-- End of 3i -->
					<!-- Line 3j -->
					<div style="width:187mm;font-size:8pt">
						<div class="styLNLeftNumBox" style="height:7.5mm;padding-top:3.5mm;padding-left:4mm">j</div>
						<div class="styLNDesc" style="height:10mm;width:108mm;padding-top:3.5mm;padding-left:2mm;">
						  If Part I, line 12a(i), is more than the entry on line 3e, enter 
						  the amount from line 3i. Otherwise, enter the amount from line 3f						  
						  <!--Dotted Line-->
						  <span class="styDotLn" style="float:right;">.......</span>
						</div>
						<div class="styLNRightNumBox" style="height:10mm;padding-top:6mm;">3j</div>
						<div class="styLNAmountBox" style="height:10mm;width:27mm;padding-top:6mm;">
						  <xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" 
							 select="$Form3468Data/SolarEnergyPropCrGrp/CalcLowIncmSolarWindBonusCrAmt"/>
						  </xsl:call-template>
						</div>
						 <div class="styLNRightNumBoxNBB" style="height:10mm;background-color:lightgrey;"/>
						 <div class="styLNAmountBox" style="height:10mm;width:27mm;border-left-width:1px;
						  border-bottom-width:0px;"/>  
					</div>
					<!-- End of 3j -->
					<!-- Start of Line 3k -->
					<div style="width:187mm;font-size:8pt">
						<div class="styLNLeftNumBox" style="height:4mm;padding-left:4mm;">k</div>
						<div class="styLNDesc" style="height:12mm;width:73mm;padding-top:1mm;padding-left:2mm">
						 If you checked the box in Part I, line 9a, enter 10%. If you checked the box in Part I, line 9b, 
						  enter 2%. Otherwise, go to line 3m
						  <!--Dotted Line-->
							<span class="styDotLn" style="float:right;">....</span>
						</div>
						<div class="styLNRightNumBox" style="height:12mm;padding-top:8.5mm">3k</div>
						<div class="styLNAmountBox" style="height:12mm;width:27mm;padding-top:8.5mm;font-size:8pt">
							<xsl:call-template name="PopulateAmount">
							  <xsl:with-param name="TargetNode" 
							   select="$Form3468Data/SolarEnergyPropCrGrp/DomContentBonusCreditPct"/>
							</xsl:call-template>%
						</div>
						<div class="styLNRightNumBoxNBB" style="height:12mm;background-color:lightgrey;
						 border-right-width:0mm"/>
						<div class="styLNAmountBox" style="height:12mm;width:27mm;border-bottom-width:0px;"/>      
						<div class="styLNRightNumBoxNBB" style="height:12mm;background-color:lightgrey;
						 border-left-width:1px;border-right-width:0px;"/>  
						<div class="styLNAmountBox" style="height:12mm;width:27mm;border-left-width:1px;
						  border-bottom-width:0px;"/>
					</div>
					<!-- End of 3k -->
					<!-- Line 3l -->
					<div style="width:187mm;font-size:8pt">
						<div class="styLNLeftNumBox" style="height:4mm;padding-top:0mm;padding-left:4mm">l</div>
						<div class="styLNDesc" style="height:4mm;width:108mm;padding-top:0mm;padding-left:2mm;">
						  Multiply line 3a by line 3k
						  <!--Dotted Line-->
						  <span class="styDotLn" style="float:right;">................</span>
						</div>
						<div class="styLNRightNumBox" style="height:4mm;padding-top:0mm;">3l</div>
						<div class="styLNAmountBox" style="height:4mm;width:27mm;padding-top:0mm;">
						  <xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" 
							 select="$Form3468Data/SolarEnergyPropCrGrp/CalcDomContentBonusCreditAmt"/>
						  </xsl:call-template>
						</div>
						 <div class="styLNRightNumBoxNBB" style="height:4mm;background-color:lightgrey;"/>
						 <div class="styLNAmountBox" style="height:4mm;width:27mm;border-left-width:1px;
						  border-bottom-width:0px;"/>  
					</div>
					<!-- End of 3l -->
					<!-- Start of Line 3m -->
					<div style="width:187mm;font-size:8pt">
						<div class="styLNLeftNumBox" style="height:4mm;padding-left:4mm;">m</div>
						<div class="styLNDesc" style="height:12mm;width:73mm;padding-top:1mm;padding-left:2mm">
						 If you checked the box in Part I, line 10a, enter 10%. If you checked the box in Part I, line 10b, 
						 enter 2%. Otherwise, go to line 4
						  <!--Dotted Line-->
							<span class="styDotLn" style="float:right;">.....</span>
						</div>
						<div class="styLNRightNumBox" style="height:12mm;padding-top:8.5mm">3m</div>
						<div class="styLNAmountBox" style="height:12mm;width:27mm;padding-top:8.5mm;font-size:8pt">
							<xsl:call-template name="PopulateAmount">
							  <xsl:with-param name="TargetNode" 
							   select="$Form3468Data/SolarEnergyPropCrGrp/EnergyComBonusCreditPct"/>
							</xsl:call-template>%
						</div>
						<div class="styLNRightNumBoxNBB" style="height:12mm;background-color:lightgrey;
						 border-right-width:0mm"/>
						<div class="styLNAmountBox" style="height:12mm;width:27mm;border-bottom-width:0px;"/>      
						<div class="styLNRightNumBoxNBB" style="height:12mm;background-color:lightgrey;
						 border-left-width:1px;border-right-width:0px;"/>  
						<div class="styLNAmountBox" style="height:12mm;width:27mm;border-left-width:1px;
						  border-bottom-width:0px;"/>
					</div>
					<!-- End of 3m -->
					<!-- Line 3n -->
					<div style="width:187mm;font-size:8pt">
						<div class="styLNLeftNumBox" style="height:4mm;padding-top:0mm;padding-left:4mm">n</div>
						<div class="styLNDesc" style="height:4mm;width:108mm;padding-top:0mm;padding-left:2mm;">
						  Multiply line 3a by line 3m
						  <!--Dotted Line-->
						  <span class="styDotLn" style="float:right;">................</span>
						</div>
						<div class="styLNRightNumBox" style="height:4mm;padding-top:0mm;">3n</div>
						<div class="styLNAmountBox" style="height:4mm;width:27mm;padding-top:0mm;">
						  <xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" 
							 select="$Form3468Data/SolarEnergyPropCrGrp/CalcEnergyComBonusCreditAmt"/>
						  </xsl:call-template>
						</div>
						 <div class="styLNRightNumBoxNBB" style="height:4mm;background-color:lightgrey;"/>
						 <div class="styLNAmountBox" style="height:4mm;width:27mm;border-left-width:1px;
						  border-bottom-width:0px;"/>  
					</div>
					<!-- End of 3n -->
					<!--Line 4 -->
					<div style="width:187mm;font-size:8pt">
						<div class="styLNLeftNumBox" style="height:4.5mm;padding-top:.5mm;padding-left:2mm">4</div>
						<div class="styLNDesc" style="width:143mm;height:4.5mm;padding-top:.5mm;padding-left:2mm;">
						  Add lines 3c, 3j, 3l, and 3n
							<!--Dotted Line-->
							<div class="styDotLn" style="float:none;padding-right:1mm;">........................</div>						  
						</div>
						<div class="styLNRightNumBoxNBB" style="height:4.5mm;padding-top:1.5mm">4</div>
						<div class="styLNAmountBox" style="height:4.5mm;width:27mm;padding-top:1mm;border-left-width:1px;
						 border-bottom-width:0px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" 
								select="$Form3468Data/SolarEnergyPropCrGrp/TotalSolarEnergyPropCrAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- End of 4 -->
						<!-- Page Break and Footer-->
					<div class="styBB" style="width:187mm;clear:both;padding-top:0.4mm;border-top-width:2px;
					 border-bottom-width:0px">
						<!--<div style="width:90mm;font-weight:bold;font-size:7pt" class="styGenericDiv">For Paperwork 
						 Reduction Act Notice, see separate instructions.</div>
						<div style="width:55mm;text-align:center;" class="styGenericDiv">Cat. No. 12276E</div>-->
						<div style="float:right;" class="styGenericDiv">Form <span class="styBoldText">3468</span> (2025)
						</div>
					</div>
					<br/>
					<div class="pageEnd"/>
					<div style="page-break-after:always"/>
					<!-- End Footer -->
					<!-- Header -->
					<div style="width:187mm;padding-top:1mm;float:left">
					  Form 3468 (2025)
						<span style="width:15mm;float:right;">Page 
							<span class="styBoldText" style="font-size:8pt;">6</span>
						</span>
					</div>
					<!-- End Header -->
					<!-- Part VI Section C -->
					<div class="styBB" style="width:187mm;border-top-width:1px;">
						<div class="styPartName" style="width:15mm;height:5mm; font-size:8pt;padding-top:1mm;">Part VI
						</div>
						<div class="styPartDesc" style="width:170mm; height:auto; font-weight:normal;font-size:9pt;
						 padding-left:2mm;padding-top:1mm">
						 <b>Energy Credit Under Section 48</b><i> (continued)</i>
						</div>
					</div>
					<div class="styBB" style="width:187mm;border-top-width:1px;">
						<div class="styPartDesc" style="width:170mm; height:auto; font-weight:normal;font-size:9pt;
						 padding-left:0mm;padding-top:1mm"><b>Section C—Qualified Fuel Cell Property</b> (see instructions)
						</div>
					</div>
					<!-- Start of Line 5a -->
					<div style="height:21.5mm;width:187mm;font-size:8pt">
						<div class="styLNLeftNumBox" style="height:4mm;padding-left:2mm">5a</div>
						<div class="styLNDesc" style="height:22mm;width:73mm;padding-left:2mm">
						 Enter the basis of property using qualified fuel cell property placed in service during the tax year 
						  that was acquired after 2005 and before October 4, 2008, and the basis attributable to 
						  construction, reconstruction, or erection by the taxpayer after 2005 and before October 4, 2008
						  <!--Dotted Line-->
						  <!--<span class="styDotLn" style="float:right;">.........</span>-->
						</div>
						<div class="styLNRightNumBox" style="height:22mm;padding-top:18.5mm">5a</div>
						<div class="styLNAmountBox" style="height:22mm;width:27mm;padding-top:18.5mm;font-size:8pt">
							<xsl:call-template name="PopulateAmount">
							  <xsl:with-param name="TargetNode" 
							   select="$Form3468Data/QualifiedFuelCellPropCrGrp/QualifiedFuelCellPropBssAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBoxNBB" style="height:22mm;background-color:lightgrey;
						 border-right-width:0mm"/>
						<div class="styLNAmountBox" style="height:22mm;width:27mm;border-bottom-width:0px;"/>      
						<div class="styLNRightNumBoxNBB" style="height:22mm;background-color:lightgrey;
						  padding-top:3.5mm;border-left-width:1px;border-right-width:0px;"/>  
						<div class="styLNAmountBox" style="height:22mm;width:27mm;border-left-width:1px;
						  border-bottom-width:0px;"/>
					</div>
					<!-- End of 5a -->
					<!-- Start of Line 5b -->
					<div style="height:4.5mm;width:187mm;font-size:8pt">
						<div class="styLNLeftNumBox" style="height:4.5mm;padding-left:4mm">b</div>
						<div class="styLNDesc" style="height:4.5mm;width:73mm;padding-left:2mm;padding-top:1mm">
						 Multiply line 5a by 30% (0.30)
						  <!--Dotted Line-->
						  <span class="styDotLn" style="float:right;">......</span>
						</div>
						<div class="styLNRightNumBox" style="height:4.5mm;padding-top:1mm">5b</div>
						<div class="styLNAmountBox" style="height:4.5mm;width:27mm;padding-top:1mm;font-size:8pt;
						  border-bottom-width:0mm">
							<xsl:call-template name="PopulateAmount">
							  <xsl:with-param name="TargetNode" 
							   select="$Form3468Data/QualifiedFuelCellPropCrGrp/CalcQlfyFuelCellPropBssAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBoxNBB" style="height:4.5mm;background-color:lightgrey;
						 border-right-width:0mm"/>
						<div class="styLNAmountBox" style="height:4.5mm;width:27mm;border-bottom-width:0px;"/>      
						<div class="styLNRightNumBoxNBB" style="height:4.5mm;background-color:lightgrey;
						  padding-top:3.5mm;border-left-width:1px;border-right-width:0px;"/>  
						<div class="styLNAmountBox" style="height:4.5mm;width:27mm;border-left-width:1px;
						  border-bottom-width:0px;"/>
					</div>
					<!-- End of 5b -->
					<!-- Start of Line 5c -->
					<div style="height:7.5mm;width:187mm;font-size:8pt">
						<div class="styLNLeftNumBox" style="height:1mm;padding-left:4mm">c</div>
						<div class="styLNDesc" style="height:7.5mm;width:73mm;padding-left:2mm">
						 Enter the applicable kilowatt capacity of property on line 5a. See instructions
						  <!--Dotted Line-->
						  <span class="styDotLn" style="float:right;">.......</span>
						</div>
						<div class="styLNRightNumBox" style="height:7.5mm;padding-top:3.5mm">5c</div>
						<div class="styLNAmountBox" style="height:7.5mm;width:40mm;padding-top:4mm;font-size:7pt;
						  border-top-width:1px">
							<xsl:call-template name="PopulateAmount">
							  <xsl:with-param name="TargetNode"
							   select="$Form3468Data/QualifiedFuelCellPropCrGrp/ApplicableFuelCellPropKWCapQty"/>
							</xsl:call-template>
						</div>
						<!--<div class="styLNRightNumBoxNBB" style="height:7.5mm;background-color:lightgrey;
						 border-right-width:0mm"/>-->
						<div class="styLNAmountBox" style="height:7.5mm;width:22mm;border-bottom-width:0px;"/>      
						<div class="styLNRightNumBoxNBB" style="height:7.5mm;background-color:lightgrey;
						  padding-top:3.5mm;border-left-width:1px;border-right-width:0px;"/>  
						<div class="styLNAmountBox" style="height:7.5mm;width:27mm;border-left-width:1px;
						  border-bottom-width:0px;"/>
					</div>
					<!-- End of 5c -->
					<!-- Start of Line 5d -->
					<div style="height:4mm;width:187mm;font-size:8pt">
						<div class="styLNLeftNumBox" style="height:4mm;padding-left:4mm">d</div>
						<div class="styLNDesc" style="height:4mm;width:73mm;padding-left:2mm">
						 Multiply line 5c by $1,000
						  <!--Dotted Line-->
						  <span class="styDotLn" style="float:right;">........</span>
						</div>
						<div class="styLNRightNumBox" style="height:4mm;padding-top:.5mm;">5d</div>
						<div class="styLNAmountBox" style="height:4mm;width:27mm;padding-top:.5mm;font-size:8pt">
							<xsl:call-template name="PopulateAmount">
							  <xsl:with-param name="TargetNode" 
							   select="$Form3468Data/QualifiedFuelCellPropCrGrp/CalcQlfyFuelCellPropBssKWAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBoxNBB" style="height:4mm;background-color:lightgrey;
						 border-right-width:0mm;border-bottom-width:0px"/>
						<div class="styLNAmountBox" style="height:4mm;width:27mm;border-bottom-width:0px;"/>      
						<div class="styLNRightNumBoxNBB" style="height:4mm;background-color:lightgrey;
						  padding-top:3.5mm;border-left-width:1px;border-right-width:0px;"/>  
						<div class="styLNAmountBox" style="height:4mm;width:27mm;border-left-width:1px;
						  border-bottom-width:0px;"/>
					</div>
					<!-- End of 5d -->
					<!-- Line 5e -->
					<div style="width:187mm;font-size:8pt">
						<div class="styLNLeftNumBox" style="height:4mm;padding-top:0mm;padding-left:4mm">e</div>
						<div class="styLNDesc" style="height:4mm;width:108mm;padding-top:0mm;padding-left:2mm;">
						  Enter the smaller of line 5b or 5d
						  <!--Dotted Line-->
						  <span class="styDotLn" style="float:right;">..............</span>
						</div>
						<div class="styLNRightNumBox" style="height:4mm;padding-top:0mm;">5e</div>
						<div class="styLNAmountBox" style="height:4mm;width:27mm;padding-top:0mm;">
						  <xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" 
							 select="$Form3468Data/QualifiedFuelCellPropCrGrp/SmallerQlfyFuelCellPropCrAmt"/>
						  </xsl:call-template>
						</div>
						 <div class="styLNRightNumBoxNBB" style="height:4mm;background-color:lightgrey;"/>
						 <div class="styLNAmountBox" style="height:4mm;width:27mm;border-left-width:1px;
						  border-bottom-width:0px;"/>  
					</div>
					<!-- End of 5e -->
					<!-- Start of Line 5f -->
					<div style="height:14mm;width:187mm;font-size:8pt">
						<div class="styLNLeftNumBox" style="height:4mm;padding-left:4mm">f</div>
						<div class="styLNDesc" style="height:14mm;width:73mm;padding-left:2mm">
						 Enter the basis of property using qualified fuel cell property placed in service during the tax year 
						  that is attributable to periods after October 3, 2008
						  <!--Dotted Line-->
						  <span class="styDotLn" style="float:right;">...............</span>
						</div>
						<div class="styLNRightNumBox" style="height:14mm;padding-top:10.5mm">5f</div>
						<div class="styLNAmountBox" style="height:14mm;width:27mm;padding-top:10.5mm;font-size:8pt">
							<xsl:call-template name="PopulateAmount">
							  <xsl:with-param name="TargetNode" 
							   select="$Form3468Data/QualifiedFuelCellPropCrGrp/BasisQlfyFuelCellPropAcqAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBoxNBB" style="height:14mm;background-color:lightgrey;
						 border-right-width:0mm"/>
						<div class="styLNAmountBox" style="height:14mm;width:27mm;border-bottom-width:0px;"/>      
						<div class="styLNRightNumBoxNBB" style="height:14mm;background-color:lightgrey;
						  padding-top:3.5mm;border-left-width:1px;border-right-width:0px;"/>  
						<div class="styLNAmountBox" style="height:14mm;width:27mm;border-left-width:1px;
						  border-bottom-width:0px;"/>
					</div>
					<!-- End of 5f -->
					<!-- Start of Line 5g -->
					<div style="height:11mm;width:187mm;font-size:8pt">
						<div class="styLNLeftNumBox" style="height:4.5mm;padding-left:4mm;padding-top:4mm">g</div>
						<div class="styLNDesc" style="height:11mm;width:73mm;padding-left:2mm;padding-top:4mm">
						 If you checked the box in Part I, line 7a or 8b, enter 30%. Otherwise, enter 6%
						  <!--Dotted Line-->
						  <span class="styDotLn" style="float:right;">.....</span>
						</div>
						<div class="styLNRightNumBox" style="height:11mm;padding-top:7mm;">5g</div>
						<div class="styLNAmountBox" style="height:11mm;width:27mm;padding-top:7.5mm;font-size:8pt;">
							<xsl:call-template name="PopulateAmount">
							  <xsl:with-param name="TargetNode" 
							   select="$Form3468Data/QualifiedFuelCellPropCrGrp/NetOutLss1MWACOrStsfdWgReqPct"/>
							</xsl:call-template>%
						</div>
						<div class="styLNRightNumBoxNBB" style="height:11mm;background-color:lightgrey;
						 border-right-width:0mm"/>
						<div class="styLNAmountBox" style="height:11mm;width:27mm;border-bottom-width:0px;"/>      
						<div class="styLNRightNumBoxNBB" style="height:11mm;background-color:lightgrey;
						  padding-top:3.5mm;border-left-width:1px;border-right-width:0px;"/>  
						<div class="styLNAmountBox" style="height:11mm;width:27mm;border-left-width:1px;
						  border-bottom-width:0px;"/>
					</div>
					<!-- End of 5g -->
					<!-- Start of Line 5h -->
					<div style="height:4mm;width:187mm;font-size:8pt">
						<div class="styLNLeftNumBox" style="height:4mm;padding-left:4mm">h</div>
						<div class="styLNDesc" style="height:4mm;width:73mm;padding-left:2mm">
						 Multiply line 5f by line 5g
						  <!--Dotted Line-->
						  <span class="styDotLn" style="float:right;">.......</span>
						</div>
						<div class="styLNRightNumBox" style="height:4mm;padding-top:.5mm">5h</div>
						<div class="styLNAmountBox" style="height:4mm;width:27mm;padding-top:.5mm;font-size:8pt">
							<xsl:call-template name="PopulateAmount">
							  <xsl:with-param name="TargetNode"
							   select="$Form3468Data/QualifiedFuelCellPropCrGrp/CalcBssQlfyFuelCellPropAcqAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBoxNBB" style="height:4mm;background-color:lightgrey;
						 border-right-width:0mm"/>
						<div class="styLNAmountBox" style="height:4mm;width:27mm;border-bottom-width:0px;"/>      
						<div class="styLNRightNumBoxNBB" style="height:4mm;background-color:lightgrey;
						 border-left-width:1px;border-right-width:0px;"/>  
						<div class="styLNAmountBox" style="height:4mm;width:27mm;border-left-width:1px;
						  border-bottom-width:0px;"/>
					</div>
					<!-- End of 5h -->
					<!-- Start of Line 5i -->
					<div style="height:11mm;width:187mm;font-size:8pt">
						<div class="styLNLeftNumBox" style="height:4mm;padding-left:4mm">i</div>
						<div class="styLNDesc" style="height:11mm;width:73mm;padding-left:2mm">
						 If you checked the box in Part I, line 9a, enter 10%. If you checked the box in Part I, line 9b, 
						  enter 2%. Otherwise, go to line 5l
						  <!--Dotted Line-->
						  <span class="styDotLn" style="float:right;">.....</span>
						</div>
						<div class="styLNRightNumBox" style="height:11mm;padding-top:7.5mm;">5i</div>
						<div class="styLNAmountBox" style="height:11mm;width:27mm;padding-top:7.5mm;font-size:8pt">
							<xsl:call-template name="PopulateAmount">
							  <xsl:with-param name="TargetNode" 
							   select="$Form3468Data/QualifiedFuelCellPropCrGrp/DomContentBonusCreditPct"/>
							</xsl:call-template>%
						</div>
						<div class="styLNRightNumBoxNBB" style="height:11mm;background-color:lightgrey;
						 border-right-width:0mm;border-bottom-width:0px"/>
						<div class="styLNAmountBox" style="height:11mm;width:27mm;border-bottom-width:0px;"/>      
						<div class="styLNRightNumBoxNBB" style="height:11mm;background-color:lightgrey;
						  border-left-width:1px;border-right-width:0px;"/>  
						<div class="styLNAmountBox" style="height:11mm;width:27mm;border-left-width:1px;
						  border-bottom-width:0px;"/>
					</div>
					<!-- End of 5i -->
					<!-- Start of Line 5j -->
					<div style="height:4mm;width:187mm;font-size:8pt">
						<div class="styLNLeftNumBox" style="height:4mm;padding-left:4mm">j</div>
						<div class="styLNDesc" style="height:4mm;width:73mm;padding-left:2mm">
						 Multiply line 5f by line 5i
						  <!--Dotted Line-->
						  <span class="styDotLn" style="float:right;">........</span>
						</div>
						<div class="styLNRightNumBox" style="height:4mm;padding-top:0mm;">5j</div>
						<div class="styLNAmountBox" style="height:4mm;width:27mm;padding-top:.5mm;font-size:8pt">
							<xsl:call-template name="PopulateAmount">
							  <xsl:with-param name="TargetNode" 
							   select="$Form3468Data/QualifiedFuelCellPropCrGrp/CalcDomContentBonusCreditAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBoxNBB" style="height:4mm;background-color:lightgrey;
						 border-right-width:0mm;border-bottom-width:0px"/>
						<div class="styLNAmountBox" style="height:4mm;width:27mm;border-bottom-width:0px;"/>      
						<div class="styLNRightNumBoxNBB" style="height:4mm;background-color:lightgrey;
						  border-left-width:1px;border-right-width:0px;"/>
						<div class="styLNAmountBox" style="height:4mm;width:27mm;border-left-width:1px;
						  border-bottom-width:0px;"/>
					</div>
					<!-- End of 5j -->
					<!-- Line 5k -->
					<div style="width:187mm;font-size:8pt">
						<div class="styLNLeftNumBox" style="height:4mm;padding-top:0mm;padding-left:4mm">k</div>
						<div class="styLNDesc" style="height:4mm;width:108mm;padding-top:0mm;padding-left:2mm;">
						  Reserved for future use
						  <!--Dotted Line-->
						  <span class="styDotLn" style="float:right;">.................</span>
						</div>
						<div class="styLNRightNumBox" style="height:4mm;padding-top:0mm;">5k</div>
						<div class="styLNAmountBox" style="height:4mm;width:27mm;padding-top:0mm;background-color:lightgrey">
						  <!--<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" 
							 select="$Form3468Data/QualifiedFuelCellPropCrGrp/SmallerQlfyFuelCellPropCrAmt"/>
						  </xsl:call-template>-->
						</div>
						 <div class="styLNRightNumBoxNBB" style="height:4mm;background-color:lightgrey;"/>
						 <div class="styLNAmountBox" style="height:4mm;width:27mm;border-left-width:1px;
						  border-bottom-width:0px;"/>  
					</div>
					<!-- End of 5k -->
					<!-- Start of Line 5l -->
					<div style="height:11mm;width:187mm;font-size:8pt">
						<div class="styLNLeftNumBox" style="height:4mm;padding-left:4mm">l</div>
						<div class="styLNDesc" style="height:11mm;width:73mm;padding-left:2mm">
						 If you checked the box in Part I, line 10a, enter 10%. If you checked the box in Part I, line 10b,  
						  enter 2%. Otherwise, go to line 5n
						  <!--Dotted Line-->
						  <span class="styDotLn" style="float:right;">.....</span>
						</div>
						<div class="styLNRightNumBox" style="height:11mm;padding-top:7.5mm">5l</div>
						<div class="styLNAmountBox" style="height:11mm;width:27mm;padding-top:7.5mm;font-size:8pt">
							<xsl:call-template name="PopulateAmount">
							  <xsl:with-param name="TargetNode" 
							   select="$Form3468Data/QualifiedFuelCellPropCrGrp/EnergyComBonusCreditPct"/>
							</xsl:call-template>%
						</div>
						<div class="styLNRightNumBoxNBB" style="height:11mm;background-color:lightgrey;
						 border-right-width:0mm"/>
						<div class="styLNAmountBox" style="height:11mm;width:27mm;border-bottom-width:0px;"/>      
						<div class="styLNRightNumBoxNBB" style="height:11mm;background-color:lightgrey;
						  padding-top:3.5mm;border-left-width:1px;border-right-width:0px;"/>  
						<div class="styLNAmountBox" style="height:11mm;width:27mm;border-left-width:1px;
						  border-bottom-width:0px;"/>
					</div>
					<!-- End of 5l -->
					<!-- Start of Line 5m -->
					<div style="height:4mm;width:187mm;font-size:8pt">
						<div class="styLNLeftNumBox" style="height:4mm;padding-left:4mm">m</div>
						<div class="styLNDesc" style="height:4mm;width:73mm;padding-left:2mm;padding-top:1mm">
						 Multiply line 5f by line 5l
						  <!--Dotted Line-->
						  <span class="styDotLn" style="float:right;">........</span>
						</div>
						<div class="styLNRightNumBox" style="height:4mm;padding-top:.5mm">5m</div>
						<div class="styLNAmountBox" style="height:4mm;width:27mm;padding-top:.5mm;font-size:8pt">
							<xsl:call-template name="PopulateAmount">
							  <xsl:with-param name="TargetNode" 
							   select="$Form3468Data/QualifiedFuelCellPropCrGrp/CalcEnergyComBonusCreditAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBoxNBB" style="height:4mm;background-color:lightgrey;
						 border-right-width:0mm"/>
						<div class="styLNAmountBox" style="height:4mm;width:27mm;border-bottom-width:0px;"/>      
						<div class="styLNRightNumBoxNBB" style="height:4mm;background-color:lightgrey;
						  border-left-width:1px;border-right-width:0px;"/>  
						<div class="styLNAmountBox" style="height:4mm;width:27mm;border-left-width:1px;
						  border-bottom-width:0px;"/>
					</div>
					<!-- End of 5m -->
					<!-- Start of Line 5n -->
					<div style="height:4mm;width:187mm;font-size:8pt">
						<div class="styLNLeftNumBox" style="height:4mm;padding-left:4mm">n</div>
						<div class="styLNDesc" style="height:4mm;width:73mm;padding-left:2mm">
						 Add lines 5h, 5j, and 5m
						  <!--Dotted Line-->
						  <span class="styDotLn" style="float:right;">.......</span>
						</div>
						<div class="styLNRightNumBox" style="height:4mm;padding-top:.5mm">5n</div>
						<div class="styLNAmountBox" style="height:4mm;width:27mm;padding-top:.5mm;font-size:8pt;
						 border-bottom-width:0mm">
							<xsl:call-template name="PopulateAmount">
							  <xsl:with-param name="TargetNode"
							   select="$Form3468Data/QualifiedFuelCellPropCrGrp/TotalFuelCellBonusCreditAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBoxNBB" style="height:4mm;background-color:lightgrey;
						 border-right-width:0mm"/>
						<div class="styLNAmountBox" style="height:4mm;width:27mm;border-bottom-width:0px;"/>      
						<div class="styLNRightNumBoxNBB" style="height:4mm;background-color:lightgrey;
						  border-left-width:1px;border-right-width:0px;"/>  
						<div class="styLNAmountBox" style="height:4mm;width:27mm;border-left-width:1px;
						  border-bottom-width:0px;"/>
					</div>
					<!-- End of 5n -->
					<!-- Start of Line 5o -->
					<div style="height:7.5mm;width:187mm;font-size:8pt">
						<div class="styLNLeftNumBox" style="height:7.5mm;padding-left:4mm">o</div>
						<div class="styLNDesc" style="height:7.5mm;width:73mm;padding-left:2mm">
						 Enter the applicable kW capacity of property on line 5f. See instructions
						  <!--Dotted Line-->
						  <span class="styDotLn" style="float:right;">.........</span>
						</div>
						<div class="styLNRightNumBox" style="height:7.5mm;padding-top:4mm;">5o</div>
						<div class="styLNAmountBox" style="height:7.5mm;width:40mm;padding-top:4mm;font-size:7pt;
						  border-top-width:1px">
							<xsl:call-template name="PopulateAmount">
							  <xsl:with-param name="TargetNode" 
							   select="$Form3468Data/QualifiedFuelCellPropCrGrp/ApplicablePropKWCapAfterQty"/>
							</xsl:call-template>
						</div>
						<!--<div class="styLNRightNumBoxNBB" style="height:7.5mm;background-color:lightgrey;
						 border-right-width:0mm;border-bottom-width:0px"/>-->
						<div class="styLNAmountBox" style="height:7.5mm;width:22mm;border-bottom-width:0px;"/>      
						<div class="styLNRightNumBoxNBB" style="height:7.5mm;background-color:lightgrey;
						  border-left-width:1px;border-right-width:0px;"/>  
						<div class="styLNAmountBox" style="height:7.5mm;width:27mm;border-left-width:1px;
						  border-bottom-width:0px;"/>
					</div>
					<!-- End of 5o -->
					<!-- Start of Line 5p -->
					<div style="height:4mm;width:187mm;font-size:8pt">
						<div class="styLNLeftNumBox" style="height:4mm;padding-left:4mm">p</div>
						<div class="styLNDesc" style="height:4mm;width:73mm;padding-left:2mm">
						 Multiply line 5o by $3,000
						  <!--Dotted Line-->
						  <span class="styDotLn" style="float:right;">........</span>
						</div>
						<div class="styLNRightNumBox" style="height:4mm;padding-top:.5mm;">5p</div>
						<div class="styLNAmountBox" style="height:4mm;width:27mm;padding-top:.5mm;font-size:8pt">
							<xsl:call-template name="PopulateAmount">
							  <xsl:with-param name="TargetNode" 
							   select="$Form3468Data/QualifiedFuelCellPropCrGrp/AfterLmtFuelCellPropKwCapAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBoxNBB" style="height:4mm;background-color:lightgrey;
						 border-right-width:0mm;border-bottom-width:0px"/>
						<div class="styLNAmountBox" style="height:4mm;width:27mm;border-bottom-width:0px;"/>      
						<div class="styLNRightNumBoxNBB" style="height:4mm;background-color:lightgrey;
						  padding-top:3.5mm;border-left-width:1px;border-right-width:0px;"/>  
						<div class="styLNAmountBox" style="height:4mm;width:27mm;border-left-width:1px;
						  border-bottom-width:0px;"/>
					</div>
					<!-- End of 5p -->
					<!-- Line 5q -->
					<div style="height:4mm;width:187mm;font-size:8pt">
						<div class="styLNLeftNumBox" style="height:4mm;padding-top:0mm;padding-left:4mm">q</div>
						<div class="styLNDesc" style="height:4mm;width:108mm;padding-top:0mm;padding-left:2mm;">
						  Enter the smaller of line 5n or line 5p
						  <!--Dotted Line-->
						  <span class="styDotLn" style="float:right;">............</span>
						</div>
						<div class="styLNRightNumBox" style="height:4mm;padding-top:0mm;">5q</div>
						<div class="styLNAmountBox" style="height:4mm;width:27mm;padding-top:.5mm;">
						  <xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" 
							 select="$Form3468Data/QualifiedFuelCellPropCrGrp/SmllrQlfyApplcblFuelCellCrAmt"/>
						  </xsl:call-template>
						</div>
						 <div class="styLNRightNumBoxNBB" style="height:4mm;background-color:lightgrey;"/>
						 <div class="styLNAmountBox" style="height:4mm;width:27mm;border-left-width:1px;
						  border-bottom-width:0px;"/>  
					</div>
					<!-- End of 5q -->
					<!--Line 6 -->
					<div style="height:7.5mm;width:187mm;font-size:8pt">
						<div class="styLNLeftNumBox" style="height:7.5mm;padding-top:3.5mm;padding-left:2mm">6</div>
						<div class="styLNDesc" style="width:143mm;height:7.5mm;padding-top:4mm;padding-left:2mm;">
						  Add lines 5e and 5q
							<!--Dotted Line-->
							<div class="styDotLn" style="float:none;">...........................</div>						  
						</div>
						<div class="styLNRightNumBoxNBB" style="height:7.5mm;padding-top:4.3mm">6</div>
						<div class="styLNAmountBox" style="height:7.5mm;width:27mm;padding-top:4.3mm;border-left-width:1px;
						 border-bottom-width:0px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" 
								select="$Form3468Data/QualifiedFuelCellPropCrGrp/TotalQlfyFuelCellPropCrAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- End of 6 -->
					<!-- Part VI Section D -->
					<div class="styBB" style="width:187mm;border-top-width:1px;">
						<div class="styPartDesc" style="width:170mm; height:auto; font-weight:normal;font-size:9pt;
						 padding-left:0mm;padding-top:1mm"><b>Section D—Qualified Microturbine Property</b> (see 
						 instructions)
						</div>
					</div>
					<!-- Start of Line 7a -->
					<div style="height:18mm;width:187mm;font-size:8pt">
						<div class="styLNLeftNumBox" style="height:4mm;padding-left:2mm">7a</div>
						<div class="styLNDesc" style="height:18mm;width:73mm;padding-left:2mm">
						 Enter the basis of property using microturbine property placed in service during the tax year that  
						  was acquired after 2005, and the basis attributable to construction, reconstruction, or erection by 
						  the taxpayer after 2005
						  <!--Dotted Line-->
						  <span class="styDotLn" style="float:right;">....</span>
						</div>
						<div class="styLNRightNumBox" style="height:18mm;padding-top:14mm">7a</div>
						<div class="styLNAmountBox" style="height:18mm;width:27mm;padding-top:14.5mm;font-size:8pt">
							<xsl:call-template name="PopulateAmount">
							  <xsl:with-param name="TargetNode" 
							   select="$Form3468Data/QualifiedMicroturbinePropCrGrp/QlfyMicroturbinePropBssAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBoxNBB" style="height:18mm;background-color:lightgrey;
						 border-right-width:0mm"/>
						<div class="styLNAmountBox" style="height:18mm;width:27mm;border-bottom-width:0px;"/>      
						<div class="styLNRightNumBoxNBB" style="height:18mm;background-color:lightgrey;
						  border-left-width:1px;border-right-width:0px;"/>  
						<div class="styLNAmountBox" style="height:18mm;width:27mm;border-left-width:1px;
						  border-bottom-width:0px;"/>
					</div>
					<!-- End of 7a -->
					<!-- Start of Line 7b -->
					<div style="height:8mm;width:187mm;font-size:8pt">
						<div class="styLNLeftNumBox" style="height:8mm;padding-left:4mm">b</div>
						<div class="styLNDesc" style="height:8mm;width:73mm;padding-left:2mm;padding-top:1mm">
						 If you checked the box in Part I, line 7a or 8b, enter 10%. Otherwise, enter 2%
						  <!--Dotted Line-->
						  <span class="styDotLn" style="float:right;">.....</span>
						</div>
						<div class="styLNRightNumBox" style="height:8mm;padding-top:4.5mm">7b</div>
						<div class="styLNAmountBox" style="height:8mm;width:27mm;padding-top:4.5mm;font-size:8pt">
							<xsl:call-template name="PopulateAmount">
							  <xsl:with-param name="TargetNode" 
							   select="$Form3468Data/QualifiedMicroturbinePropCrGrp/NetOutLss1MWACOrStsfdWgReqPct"/>
							</xsl:call-template>%
						</div>
						<div class="styLNRightNumBoxNBB" style="height:8mm;background-color:lightgrey;
						 border-right-width:0mm"/>
						<div class="styLNAmountBox" style="height:8mm;width:27mm;border-bottom-width:0px;"/>      
						<div class="styLNRightNumBoxNBB" style="height:8mm;background-color:lightgrey;
						  border-left-width:1px;border-right-width:0px;"/>  
						<div class="styLNAmountBox" style="height:8mm;width:27mm;border-left-width:1px;
						  border-bottom-width:0px;"/>
					</div>
					<!-- End of 7b -->
					<!-- Start of Line 7c -->
					<div style="height:4mm;width:187mm;font-size:8pt">
						<div class="styLNLeftNumBox" style="height:4mm;padding-left:4mm">c</div>
						<div class="styLNDesc" style="height:4mm;width:73mm;padding-left:2mm">
						 Multiply line 7a by line 7b
						  <!--Dotted Line-->
						  <span class="styDotLn" style="float:right;">.......</span>
						</div>
						<div class="styLNRightNumBox" style="height:4mm;padding-top:.5mm">7c</div>
						<div class="styLNAmountBox" style="height:4mm;width:27mm;padding-top:.5mm;font-size:8pt">
							<xsl:call-template name="PopulateAmount">
							  <xsl:with-param name="TargetNode"
							   select="$Form3468Data/QualifiedMicroturbinePropCrGrp/CalcQlfyMicroturbinePropBssAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBoxNBB" style="height:4mm;background-color:lightgrey;
						 border-right-width:0mm"/>
						<div class="styLNAmountBox" style="height:4mm;width:27mm;border-bottom-width:0px;"/>      
						<div class="styLNRightNumBoxNBB" style="height:4mm;background-color:lightgrey;
						  border-left-width:1px;border-right-width:0px;"/>  
						<div class="styLNAmountBox" style="height:4mm;width:27mm;border-left-width:1px;
						  border-bottom-width:0px;"/>
					</div>
					<!-- End of 7c -->
					<!-- Start of Line 7d -->
					<div style="height:11mm;width:187mm;font-size:8pt">
						<div class="styLNLeftNumBox" style="height:11mm;padding-left:4mm">d</div>
						<div class="styLNDesc" style="height:11mm;width:73mm;padding-left:2mm">
						 If you checked the box in Part I, line 9a, enter 10%. If you checked the box in Part I, line 9b,
						 enter 2%.  Otherwise, go to line 7g
						  <!--Dotted Line-->
						  <span class="styDotLn" style="float:right;">....</span>
						</div>
						<div class="styLNRightNumBox" style="height:11mm;padding-top:7.5mm;">7d</div>
						<div class="styLNAmountBox" style="height:11mm;width:27mm;padding-top:7.5mm;font-size:8pt">
							<xsl:call-template name="PopulateAmount">
							  <xsl:with-param name="TargetNode" 
							   select="$Form3468Data/QualifiedMicroturbinePropCrGrp/DomContentBonusCreditPct"/>
							</xsl:call-template>%
						</div>
						<div class="styLNRightNumBoxNBB" style="height:11mm;background-color:lightgrey;
						 border-right-width:0mm;border-bottom-width:0px"/>
						<div class="styLNAmountBox" style="height:11mm;width:27mm;border-bottom-width:0px;"/>      
						<div class="styLNRightNumBoxNBB" style="height:11mm;background-color:lightgrey;
						  padding-top:3.5mm;border-left-width:1px;border-right-width:0px;"/>  
						<div class="styLNAmountBox" style="height:11mm;width:27mm;border-left-width:1px;
						  border-bottom-width:0px;"/>
					</div>
					<!-- End of 7d -->
					<!-- Start of Line 7e -->
					<div style="width:187mm;font-size:8pt">
						<div class="styLNLeftNumBox" style="height:4mm;padding-left:4mm;">e</div>
						<div class="styLNDesc" style="height:4mm;width:73mm;padding-left:2mm">
						 Multiply line 7a by line 7d
						  <!--Dotted Line-->
							<span class="styDotLn" style="float:right;">........</span>
						</div>
						<div class="styLNRightNumBox" style="height:4mm;padding-top:.5mm">7e</div>
						<div class="styLNAmountBox" style="height:4mm;width:27mm;padding-top:.5mm;font-size:8pt">
							<xsl:call-template name="PopulateAmount">
							  <xsl:with-param name="TargetNode" 
							   select="$Form3468Data/QualifiedMicroturbinePropCrGrp/CalcQlfyMcrtrbnPropKwCapAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBoxNBB" style="height:4mm;background-color:lightgrey;
						 border-right-width:0mm"/>
						<div class="styLNAmountBox" style="height:4mm;width:27mm;border-bottom-width:0px;"/>      
						<div class="styLNRightNumBoxNBB" style="height:4mm;background-color:lightgrey;
						 border-left-width:1px;border-right-width:0px;"/>  
						<div class="styLNAmountBox" style="height:4mm;width:27mm;border-left-width:1px;
						  border-bottom-width:0px;"/>
					</div>
					<!-- End of 7e -->
					<!-- Line 7f -->
					<div style="height:4mm;width:187mm;font-size:8pt">
						<div class="styLNLeftNumBox" style="height:4mm;padding-top:.5mm;padding-left:4mm">f</div>
						<div class="styLNDesc" style="height:4mm;width:108mm;padding-top:0mm;padding-left:2mm;">
						  Reserved for future use						  
						  <!--Dotted Line-->
						  <span class="styDotLn" style="float:right;">.................</span>
						</div>
						<div class="styLNRightNumBox" style="height:4mm;padding-top:.5mm;">7f</div>
						<div class="styLNAmountBox" style="height:4mm;width:27mm;padding-top:0mm;
						 background-color:lightgrey;">
						  <!--<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" 
							 select="$Form3468Data/SolarEnergyPropCrGrp/CalcLowIncmSolarWindBonusCrAmt"/>
						  </xsl:call-template>-->
						</div>
						 <div class="styLNRightNumBoxNBB" style="height:4mm;background-color:lightgrey;"/>
						 <div class="styLNAmountBox" style="height:4mm;width:27mm;border-left-width:1px;
						  border-bottom-width:0px;"/>  
					</div>
					<!-- End of 7f -->
					<!-- Start of Line 7g -->
					<div style="11mm;width:187mm;font-size:8pt">
						<div class="styLNLeftNumBox" style="height:4mm;padding-left:4mm;">g</div>
						<div class="styLNDesc" style="height:11mm;width:73mm;padding-left:2mm">
						 If you checked the box in Part I, line 10a, enter 10%. If you checked the box in Part I, line 10b, 
						  enter 2%. Otherwise, go to line 7i
						  <!--Dotted Line-->
							<span class="styDotLn" style="float:right;">.....</span>
						</div>
						<div class="styLNRightNumBox" style="height:11mm;padding-top:7mm">7g</div>
						<div class="styLNAmountBox" style="height:11mm;width:27mm;padding-top:7.5mm;font-size:8pt">
							<xsl:call-template name="PopulateAmount">
							  <xsl:with-param name="TargetNode" 
							   select="$Form3468Data/QualifiedMicroturbinePropCrGrp/EnergyComBonusCreditPct"/>
							</xsl:call-template>%
						</div>
						<div class="styLNRightNumBoxNBB" style="height:11mm;background-color:lightgrey;
						 border-right-width:0mm"/>
						<div class="styLNAmountBox" style="height:11mm;width:27mm;border-bottom-width:0px;"/>      
						<div class="styLNRightNumBoxNBB" style="height:11mm;background-color:lightgrey;
						 border-left-width:1px;border-right-width:0px;"/>  
						<div class="styLNAmountBox" style="height:11mm;width:27mm;border-left-width:1px;
						  border-bottom-width:0px;"/>
					</div>
					<!-- End of 7g -->
					<!-- Start of Line 7h -->
					<div style="height:4mm;width:187mm;font-size:8pt">
						<div class="styLNLeftNumBox" style="height:4mm;padding-left:4mm;">h</div>
						<div class="styLNDesc" style="height:4mm;width:73mm;padding-left:2mm">
						 Multiply line 7a by line 7g
						  <!--Dotted Line-->
							<span class="styDotLn" style="float:right;">........</span>
						</div>
						<div class="styLNRightNumBox" style="height:4mm;padding-top:.5mm">7h</div>
						<div class="styLNAmountBox" style="height:4mm;width:27mm;padding-top:.5mm;font-size:8pt">
							<xsl:call-template name="PopulateAmount">
							  <xsl:with-param name="TargetNode" 
							   select="$Form3468Data/QualifiedMicroturbinePropCrGrp/CalcEnergyComBonusCreditAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBoxNBB" style="height:4mm;background-color:lightgrey;
						 border-right-width:0mm"/>
						<div class="styLNAmountBox" style="height:4mm;width:27mm;border-bottom-width:0px;"/>      
						<div class="styLNRightNumBoxNBB" style="height:4mm;background-color:lightgrey;
						 border-left-width:1px;border-right-width:0px;"/>  
						<div class="styLNAmountBox" style="height:4mm;width:27mm;border-left-width:1px;
						  border-bottom-width:0px;"/>
					</div>
					<!-- End of 7h -->
					<!-- Line 7i -->
					<div style="height:4mm;width:187mm;font-size:8pt">
						<div class="styLNLeftNumBox" style="height:4mm;padding-top:.5mm;padding-left:4mm">i</div>
						<div class="styLNDesc" style="height:4mm;width:108mm;padding-top:0mm;padding-left:2mm;">
						  Add lines 7c, 7e, and 7h
						  <!--Dotted Line-->
						  <span class="styDotLn" style="float:right;">.................</span>
						</div>
						<div class="styLNRightNumBox" style="height:4mm;padding-top:.5mm;">7i</div>
						<div class="styLNAmountBox" style="height:4mm;width:27mm;padding-top:0mm;">
						  <xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" 
							 select="$Form3468Data/QualifiedMicroturbinePropCrGrp/TotalEnergyComBonusCrAmt"/>
						  </xsl:call-template>
						</div>
						 <div class="styLNRightNumBoxNBB" style="height:4mm;background-color:lightgrey;"/>
						 <div class="styLNAmountBox" style="height:4mm;width:27mm;border-left-width:1px;
						  border-bottom-width:0px;"/>  
					</div>
					<!-- End of 7i -->
					<!-- Start of Line 7j -->
					<div style="height:7.5mm;width:187mm;font-size:8pt">
						<div class="styLNLeftNumBox" style="height:7.5mm;padding-left:4mm;">j</div>
						<div class="styLNDesc" style="height:7.5mm;width:73mm;padding-left:2mm">
						 Enter the applicable kW capacity of property on line 7a. See instructions
						  <!--Dotted Line-->
							<span class="styDotLn" style="float:right;">........</span>
						</div>
						<div class="styLNRightNumBox" style="height:7.5mm;padding-top:3.5mm;">7j</div>
						<div class="styLNAmountBox" style="height:7.5mm;width:40mm;padding-top:4mm;font-size:7pt">
							<xsl:call-template name="PopulateAmount">
							  <xsl:with-param name="TargetNode" 
							   select="$Form3468Data/QualifiedMicroturbinePropCrGrp/ApplicableMcrtrbnPropKWCapQty"/>
							</xsl:call-template>
						</div>
						<!--<div class="styLNRightNumBoxNBB" style="height:7.5mm;background-color:lightgrey;
						 border-right-width:0mm"/>-->
						<div class="styLNAmountBox" style="height:7.5mm;width:22mm;border-bottom-width:0px;"/>      
						<div class="styLNRightNumBoxNBB" style="height:7.5mm;background-color:lightgrey;
						 border-left-width:1px;border-right-width:0px;"/>  
						<div class="styLNAmountBox" style="height:7.5mm;width:27mm;border-left-width:1px;
						  border-bottom-width:0px;"/>
					</div>
					<!-- End of 7j -->
					<!-- Start of Line 7k -->
					<div style="width:187mm;font-size:8pt">
						<div class="styLNLeftNumBox" style="height:4mm;padding-left:4mm;">k</div>
						<div class="styLNDesc" style="height:4mm;width:73mm;padding-left:2mm">
						 Reserved for future use
						  <!--Dotted Line-->
							<span class="styDotLn" style="float:right;">........</span>
						</div>
						<div class="styLNRightNumBox" style="height:4mm;padding-top:.5mm">7k</div>
						<div class="styLNAmountBox" style="height:4mm;width:27mm;padding-top:.5mm;font-size:7pt;
						 background-color:lightgrey;">
							<!--<xsl:call-template name="PopulateAmount">
							  <xsl:with-param name="TargetNode" 
							   select="$Form3468Data/QualifiedMicroturbinePropCrGrp/CalcEnergyComBonusCrOtherAmt"/>
							</xsl:call-template>-->
						</div>
						<div class="styLNRightNumBoxNBB" style="height:4mm;background-color:lightgrey;
						 border-right-width:0mm"/>
						<div class="styLNAmountBox" style="height:4mm;width:27mm;border-bottom-width:0px;"/>      
						<div class="styLNRightNumBoxNBB" style="height:4mm;background-color:lightgrey;
						 border-left-width:1px;border-right-width:0px;"/>  
						<div class="styLNAmountBox" style="height:4mm;width:27mm;border-left-width:1px;
						  border-bottom-width:0px;"/>
					</div>
					<!-- End of 7k -->
					<!-- Line 7l -->
					<div style="height:4mm;width:187mm;font-size:8pt">
						<div class="styLNLeftNumBox" style="height:4mm;padding-top:.5mm;padding-left:4mm">l</div>
						<div class="styLNDesc" style="height:4mm;width:108mm;padding-top:0mm;padding-left:2mm;">
						  Multiply line 7j by $200
						  <!--Dotted Line-->
						  <span class="styDotLn" style="float:right;">.................</span>
						</div>
						<div class="styLNRightNumBox" style="height:4mm;padding-top:.5mm;">7l</div>
						<div class="styLNAmountBox" style="height:4mm;width:27mm;padding-top:0mm;">
						  <xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" 
							 select="$Form3468Data/QualifiedMicroturbinePropCrGrp/CalcEnergyComBonusCrOtherAmt"/>
						  </xsl:call-template>
						</div>
						 <div class="styLNRightNumBoxNBB" style="height:4mm;background-color:lightgrey;"/>
						 <div class="styLNAmountBox" style="height:4mm;width:27mm;border-left-width:1px;
						  border-bottom-width:0px;"/>  
					</div>
					<!-- End of 7l -->
					<!--Line 8 -->
					<div style="height:7.5mm;width:187mm;font-size:8pt">
						<div class="styLNLeftNumBox" style="height:7.5mm;padding-top:3.5mm;padding-left:2mm">8</div>
						<div class="styLNDesc" style="width:143mm;height:7.5mm;padding-top:4mm;padding-left:2mm;">
						  Enter the smaller of line 7i or line 7l
							<!--Dotted Line-->
							<div class="styDotLn" style="float:none;">.....................</div>						  
						</div>
						<div class="styLNRightNumBoxNBB" style="height:7.5mm;padding-top:4.3mm">8</div>
						<div class="styLNAmountBox" style="height:7.5mm;width:27mm;padding-top:4.3mm;border-left-width:1px;
						 border-bottom-width:0px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" 
								select="$Form3468Data/QualifiedMicroturbinePropCrGrp/SmllrQlfyMicroturbinePropCrAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- End of 8 -->
						<!-- Page Break and Footer-->
					<div class="styBB" style="width:187mm;clear:both;padding-top:0.4mm;border-top-width:2px;
					 border-bottom-width:0px">
						<!--<div style="width:90mm;font-weight:bold;font-size:7pt" class="styGenericDiv">For Paperwork 
						 Reduction Act Notice, see separate instructions.</div>
						<div style="width:55mm;text-align:center;" class="styGenericDiv">Cat. No. 12276E</div>-->
						<div style="float:right;" class="styGenericDiv">Form <span class="styBoldText">3468</span> (2025)
						</div>
					</div>
					<br/>
					<div class="pageEnd"/>
					<div style="page-break-after:always"/>
					<!-- End Footer -->
					<!-- Header -->
					<div style="width:187mm;padding-top:1mm;float:left">
					  Form 3468 (2025)
						<span style="width:15mm;float:right;">Page 
							<span class="styBoldText" style="font-size:8pt;">7</span>
						</span>
					</div>
					<!-- End Header -->
					<!-- Start of Part VI Section E cont. -->
					<div class="styBB" style="width:187mm;border-top-width:1px;">
						<div class="styPartName" style="height:5mm;width:15mm;font-size:8pt;padding-top:1mm;">Part VI
						</div>
						<div class="styPartDesc" style="height:auto;width:170mm;font-weight:normal;font-size:9pt;
						 padding-left:2mm;padding-top:1mm">
						 <b>Energy Credit Under Section 48</b><i> (continued)</i>
						</div>
					</div>
					<!-- Part VI Section E -->
					<div class="styBB" style="width:187mm;border-top-width:1px;">
						<div class="styPartDesc" style="width:170mm; height:auto; font-weight:normal;font-size:9pt;
						 padding-left:0mm;padding-top:1mm"><b>Section E—Combined Heat and Power System Property</b> 
						  (see instructions)
						</div>
					</div>
					<div class="styBB" style="width:187mm;border-top-width:1px;">
						<div class="styPartDesc" style="width:170mm; height:auto; font-weight:normal;border-top-width:0px;
						 padding-left:0mm;padding-top:1mm"><b>Caution:</b>You can’t claim this credit if the electrical 
						  capacity of the property is more than 50 megawatts or has a mechanical energy capacity of more
						  than 67,000 horsepower or an equivalent combination of electrical and mechanical energy 
						  capabilities.
						</div>
					</div>
					<!-- Start of Line 9a -->
					<div style="height:11mm;width:187mm;font-size:8pt">
						<div class="styLNLeftNumBox" style="height:4mm;padding-left:2mm">9a</div>
						<div class="styLNDesc" style="height:11mm;width:73mm;padding-left:2mm">
						 Enter the basis of property using combined heat and power system placed in service during the tax  
						  year
						  <!--Dotted Line-->
						  <span class="styDotLn" style="float:right;">..............</span>
						</div>
						<div class="styLNRightNumBox" style="height:11mm;padding-top:7mm">9a</div>
						<div class="styLNAmountBoxNBB" style="height:11mm;width:27mm;padding-top:7.5mm;font-size:8pt">
							<xsl:call-template name="PopulateAmount">
							  <xsl:with-param name="TargetNode" 
							   select="$Form3468Data/HeatAndPowerSystemPropCrGrp/BasisOfHeatAndPowerPropAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBoxNBB" style="height:11mm;background-color:lightgrey;
						 border-right-width:0mm"/>
						<div class="styLNAmountBox" style="height:11mm;width:27mm;border-bottom-width:0px;"/>      
						<div class="styLNRightNumBoxNBB" style="height:11mm;background-color:lightgrey;
						  border-left-width:1px;border-right-width:0px;"/>  
						<div class="styLNAmountBox" style="height:11mm;width:27mm;border-left-width:1px;
						  border-bottom-width:0px;"/>
					</div>
					<!-- End of 9a -->
					<!-- Start of Line 9b -->
					<div style="height:29mm;width:187mm;font-size:8pt;">
						<div class="styLNLeftNumBox" style="height:4.5mm;padding-left:4mm">b</div>
						<div class="styLNDesc" style="height:29mm;width:73mm;padding-left:2mm;padding-top:1mm">
						 If the electrical capacity of the property is measured in:<br/>
						  • Megawatts, divide 15 by the megawatt capacity. Enter 1.0 if the capacity is 15 megawatts or less.
						  <br/>
						  • Horsepower, divide 20,000 by the horsepower. Enter 1.0 if the capacity is 20,000 horsepower or
						  less
						  <!--Dotted Line-->
						  <span class="styDotLn" style="float:right;">...............</span>
						</div>
						<div class="styLNRightNumBox" style="height:29mm;padding-top:25mm">9b</div>
						<div class="styLNAmountBox" style="height:29mm;width:42mm;padding-top:25.3mm;font-size:8pt;
						 border-top-width:1px">
							<xsl:call-template name="PopulateAmount">
							  <xsl:with-param name="TargetNode" 
							   select="$Form3468Data/HeatAndPowerSystemPropCrGrp/MegaHorsepowerPct"/>
							</xsl:call-template>
						</div>
						<!--<div class="styLNRightNumBoxNBB" style="height:29mm;background-color:lightgrey;
						 border-right-width:0mm"/>-->
						<div class="styLNAmountBox" style="height:29mm;width:20mm;border-bottom-width:0px;"/>      
						<div class="styLNRightNumBoxNBB" style="height:29mm;background-color:lightgrey;
						  border-left-width:1px;border-right-width:0px;"/>  
						<div class="styLNAmountBox" style="height:29mm;width:27mm;border-left-width:1px;
						  border-bottom-width:0px;"/>
					</div>
					<!-- End of 9b -->
					<!-- Start of Line 9c -->
					<div style="height:4mm;width:187mm;font-size:8pt">
						<div class="styLNLeftNumBox" style="height:4mm;padding-left:4mm">c</div>
						<div class="styLNDesc" style="height:4mm;width:73mm;padding-left:2mm">
						 Multiply line 9a by line 9b
						  <!--Dotted Line-->
						  <span class="styDotLn" style="float:right;">.......</span>
						</div>
						<div class="styLNRightNumBox" style="height:4mm;padding-top:.5mm">9c</div>
						<div class="styLNAmountBox" style="height:4mm;width:27mm;padding-top:.5mm;font-size:8pt">
							<xsl:call-template name="PopulateAmount">
							  <xsl:with-param name="TargetNode"
							   select="$Form3468Data/HeatAndPowerSystemPropCrGrp/CalcHeatAndPowerPropCapAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBoxNBB" style="height:4mm;background-color:lightgrey;
						 border-right-width:0mm"/>
						<div class="styLNAmountBox" style="height:4mm;width:27mm;border-bottom-width:0px;"/>      
						<div class="styLNRightNumBoxNBB" style="height:4mm;background-color:lightgrey;
						  border-left-width:1px;border-right-width:0px;"/>  
						<div class="styLNAmountBox" style="height:4mm;width:27mm;border-left-width:1px;
						  border-bottom-width:0px;"/>
					</div>
					<!-- End of 9c -->
					<!-- Start of Line 9d -->
					<div style="height:8mm;width:187mm;font-size:8pt;">
						<div class="styLNLeftNumBox" style="height:4mm;padding-left:4mm">d</div>
						<div class="styLNDesc" style="height:7.5mm;width:73mm;padding-left:2mm">
						 If you checked the box in Part I, line 7a or 8b, enter 30%. Otherwise, enter 6%
						  <!--Dotted Line-->
						  <span class="styDotLn" style="float:right;">.....</span>
						</div>
						<div class="styLNRightNumBox" style="height:7.5mm;padding-top:4mm;">9d</div>
						<div class="styLNAmountBox" style="height:7.5mm;width:27mm;padding-top:4mm;font-size:8pt">
							<xsl:call-template name="PopulateAmount">
							  <xsl:with-param name="TargetNode" 
							   select="$Form3468Data/HeatAndPowerSystemPropCrGrp/NetOutLss1MWACOrStsfdWgReqPct"/>
							</xsl:call-template>%
						</div>
						<div class="styLNRightNumBoxNBB" style="height:8mm;background-color:lightgrey;
						 border-right-width:0mm;border-bottom-width:0px"/>
						<div class="styLNAmountBox" style="height:8mm;width:27mm;border-bottom-width:0px;"/>      
						<div class="styLNRightNumBoxNBB" style="height:8mm;background-color:lightgrey;
						  border-left-width:1px;border-right-width:0px;"/>  
						<div class="styLNAmountBox" style="height:8mm;width:27mm;border-left-width:1px;
						  border-bottom-width:0px;"/>
					</div>
					<!-- End of 9d -->
					<!-- Line 9e -->
					<div style="height:4mm;width:187mm;font-size:8pt">
						<div class="styLNLeftNumBox" style="height:4mm;padding-top:.5mm;padding-left:4mm">e</div>
						<div class="styLNDesc" style="height:4mm;width:108mm;padding-top:0mm;padding-left:2mm;">
						  Multiply line 9c by line 9d
						  <!--Dotted Line-->
						  <span class="styDotLn" style="float:right;">................</span>
						</div>
						<div class="styLNRightNumBox" style="height:4mm;padding-top:.5mm;">9e</div>
						<div class="styLNAmountBox" style="height:4mm;width:27mm;padding-top:0mm;">
						  <xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" 
							 select="$Form3468Data/HeatAndPowerSystemPropCrGrp/CalcBasisOfHeatAndPowerPropAmt"/>
						  </xsl:call-template>
						</div>
						 <div class="styLNRightNumBoxNBB" style="height:4mm;background-color:lightgrey;"/>
						 <div class="styLNAmountBox" style="height:4mm;width:27mm;border-left-width:1px;
						  border-bottom-width:0px;"/>  
					</div>
					<!-- End of 9e -->
					<!-- Start of Line 9f -->
					<div style="height:11mm;width:187mm;font-size:8pt">
						<div class="styLNLeftNumBox" style="height:4mm;padding-left:4mm">f</div>
						<div class="styLNDesc" style="height:11mm;width:73mm;padding-left:2mm">
						 If you checked the box in Part I, line 9a, enter 10%. If you checked the box in Part I, line 9b, 
						 enter 2%. Otherwise, go to line 9h
						  <!--Dotted Line-->
						  <span class="styDotLn" style="float:right;">....</span>
						</div>
						<div class="styLNRightNumBox" style="height:11mm;padding-top:7mm;">9f</div>
						<div class="styLNAmountBox" style="height:11mm;width:27mm;padding-top:7.5mm;font-size:8pt">
							<xsl:call-template name="PopulateAmount">
							  <xsl:with-param name="TargetNode" 
							   select="$Form3468Data/HeatAndPowerSystemPropCrGrp/DomContentBonusCreditPct"/>
							</xsl:call-template>%
						</div>
						<div class="styLNRightNumBoxNBB" style="height:11mm;background-color:lightgrey;
						 border-right-width:0mm;border-bottom-width:0px"/>
						<div class="styLNAmountBox" style="height:11mm;width:27mm;border-bottom-width:0px;"/>      
						<div class="styLNRightNumBoxNBB" style="height:11mm;background-color:lightgrey;
						  border-left-width:1px;border-right-width:0px;"/>  
						<div class="styLNAmountBox" style="height:11mm;width:27mm;border-left-width:1px;
						  border-bottom-width:0px;"/>
					</div>
					<!-- End of 9f -->
					<!-- Line 9g -->
					<div style="height:4mm;width:187mm;font-size:8pt">
						<div class="styLNLeftNumBox" style="height:4mm;padding-top:.5mm;padding-left:4mm">g</div>
						<div class="styLNDesc" style="height:4mm;width:108mm;padding-top:.5mm;padding-left:2mm;">
						  Multiply line 9c by line 9f
						  <!--Dotted Line-->
						  <span class="styDotLn" style="float:right;">................</span>
						</div>
						<div class="styLNRightNumBox" style="height:4.5mm;padding-top:.5mm;">9g</div>
						<div class="styLNAmountBox" style="height:4.5mm;width:27mm;padding-top:1mm;">
						  <xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" 
							 select="$Form3468Data/HeatAndPowerSystemPropCrGrp/CalcDomContentBonusCreditAmt"/>
						  </xsl:call-template>
						</div>
						 <div class="styLNRightNumBoxNBB" style="height:4mm;background-color:lightgrey;"/>
						 <div class="styLNAmountBox" style="height:4mm;width:27mm;border-left-width:1px;
						  border-bottom-width:0px;"/>  
					</div>
					<!-- End of 9g -->
					<!-- Start of Line 9h -->
					<div style="height:11mm;width:187mm;font-size:8pt">
						<div class="styLNLeftNumBox" style="height:4mm;padding-left:4mm">h</div>
						<div class="styLNDesc" style="height:11mm;width:73mm;padding-left:2mm">
						 If you checked the box in Part I, line 10a, enter 10%. If you checked the box in Part I, line 10b, 
						 enter 2%. Otherwise, go to line 10
						  <!--Dotted Line-->
						  <span class="styDotLn" style="float:right;">.....</span>
						</div>
						<div class="styLNRightNumBox" style="height:11mm;padding-top:7.5mm;">9h</div>
						<div class="styLNAmountBox" style="height:11mm;width:27mm;padding-top:7.5mm;font-size:8pt">
							<xsl:call-template name="PopulateAmount">
							  <xsl:with-param name="TargetNode" 
							   select="$Form3468Data/HeatAndPowerSystemPropCrGrp/EnergyComBonusCreditPct"/>
							</xsl:call-template>%
						</div>
						<div class="styLNRightNumBoxNBB" style="height:11mm;background-color:lightgrey;
						 border-right-width:0mm;border-bottom-width:0px"/>
						<div class="styLNAmountBox" style="height:11mm;width:27mm;border-bottom-width:0px;"/>      
						<div class="styLNRightNumBoxNBB" style="height:11mm;background-color:lightgrey;
						  border-left-width:1px;border-right-width:0px;"/>  
						<div class="styLNAmountBox" style="height:11mm;width:27mm;border-left-width:1px;
						  border-bottom-width:0px;"/>
					</div>
					<!-- End of 9h -->
					<!-- Line 9i -->
					<div style="height:4mm;width:187mm;font-size:8pt">
						<div class="styLNLeftNumBox" style="height:4mm;padding-top:.5mm;padding-left:4mm">i</div>
						<div class="styLNDesc" style="height:4mm;width:108mm;padding-top:0mm;padding-left:2mm;">
						  Multiply line 9c by line 9h
						  <!--Dotted Line-->
						  <span class="styDotLn" style="float:right;">................</span>
						</div>
						<div class="styLNRightNumBox" style="height:4mm;padding-top:.5mm;">9i</div>
						<div class="styLNAmountBox" style="height:4mm;width:27mm;padding-top:0mm;">
						  <xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" 
							 select="$Form3468Data/HeatAndPowerSystemPropCrGrp/CalcEnergyComBonusCreditAmt"/>
						  </xsl:call-template>
						</div>
						 <div class="styLNRightNumBoxNBB" style="height:4mm;background-color:lightgrey;"/>
						 <div class="styLNAmountBox" style="height:4mm;width:27mm;border-left-width:1px;
						  border-bottom-width:0px;"/>  
					</div>
					<!-- End of 9i -->
					<!--Line 10 -->
					<div style="height:7.5mm;width:187mm;font-size:8pt">
						<div class="styLNLeftNumBox" style="height:7.5mm;padding-top:3.5mm;padding-left:0mm">10</div>
						<div class="styLNDesc" style="width:143mm;height:7.5mm;padding-top:4mm;padding-left:2mm;">
						  Add lines 9e, 9g, and 9i
							<!--Dotted Line-->
							<div class="styDotLn" style="float:none;">.........................</div>						  
						</div>
						<div class="styLNRightNumBoxNBB" style="height:7.5mm;padding-top:4.5mm">10</div>
						<div class="styLNAmountBox" style="height:7.5mm;width:27mm;padding-top:4mm;border-left-width:1px;
						 border-bottom-width:0px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" 
								select="$Form3468Data/HeatAndPowerSystemPropCrGrp/TotalHeatAndPowerSysPropCrAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- End of 10 -->
					<!-- Part VI Section F -->
					<div class="styBB" style="width:187mm;border-top-width:1px;">
						<div class="styPartDesc" style="width:170mm; height:auto; font-weight:normal;font-size:9pt;
						 padding-left:0mm;padding-top:1mm"><b>Section F—Qualified Small Wind Energy Property</b> 
						  (see instructions)
						</div>
					</div>
					<!-- Start of Line 11a -->
					<div style="height:4mm;width:187mm;font-size:8pt">
						<div class="styLNLeftNumBox" style="height:4mm;padding-left:0mm;">11a</div>
						<div class="styLNDesc" style="height:4mm;width:73mm;padding-left:2mm">
						 Reserved for future use
						  <!--Dotted Line-->
							<span class="styDotLn" style="float:right;">.........</span>
						</div>
						<div class="styLNRightNumBox" style="height:4mm;padding-top:.5mm">11a</div>
						<div class="styLNAmountBox" style="height:4mm;width:27mm;padding-top:.5mm;font-size:8pt;
						 background-color:lightgrey">
							<!--<xsl:call-template name="PopulateAmount">
							  <xsl:with-param name="TargetNode" 
							   select="$Form3468Data/QlfySmallWindEnergyPropCrGrp/BasisOfWindEnergyPropAmt"/>
							</xsl:call-template>-->
						</div>
						<div class="styLNRightNumBoxNBB" style="height:4mm;background-color:lightgrey;
						 border-right-width:0mm"/>
						<div class="styLNAmountBox" style="height:4mm;width:27mm;border-bottom-width:0px;"/>      
						<div class="styLNRightNumBoxNBB" style="height:4mm;background-color:lightgrey;
						 border-left-width:1px;border-right-width:0px;"/>  
						<div class="styLNAmountBox" style="height:4mm;width:27mm;border-left-width:1px;
						  border-bottom-width:0px;"/>
					</div>
					<!-- End of 11a -->
					<!-- Start of Line 11b -->
					<div style="height:4mm;width:187mm;font-size:8pt">
						<div class="styLNLeftNumBox" style="height:4mm;padding-left:4mm;">b</div>
						<div class="styLNDesc" style="height:4mm;width:73mm;padding-left:2mm">
						 Reserved for future use
						  <!--Dotted Line-->
							<span class="styDotLn" style="float:right;">.........</span>
						</div>
						<div class="styLNRightNumBox" style="height:4mm;padding-top:.5mm">11b</div>
						<div class="styLNAmountBox" style="height:4mm;width:27mm;padding-top:.5mm;font-size:8pt;
						 background-color:lightgrey">
							<!--<xsl:call-template name="PopulateAmount">
							  <xsl:with-param name="TargetNode" 
							   select="$Form3468Data/QlfySmallWindEnergyPropCrGrp/CalcBasisOfWindEnergyPropAmt"/>
							</xsl:call-template>-->
						</div>
						<div class="styLNRightNumBoxNBB" style="height:4mm;background-color:lightgrey;
						 border-right-width:0mm"/>
						<div class="styLNAmountBox" style="height:4mm;width:27mm;border-bottom-width:0px;"/>      
						<div class="styLNRightNumBoxNBB" style="height:4mm;background-color:lightgrey;
						 border-left-width:1px;border-right-width:0px;"/>  
						<div class="styLNAmountBox" style="height:4mm;width:27mm;border-left-width:1px;
						  border-bottom-width:0px;"/>
					</div>
					<!-- End of 11b -->
					<!-- Line 11c -->
					<div style="height:4mm;width:187mm;font-size:8pt">
						<div class="styLNLeftNumBox" style="height:4mm;padding-top:.5mm;padding-left:4mm">c</div>
						<div class="styLNDesc" style="height:4mm;width:108mm;padding-top:0mm;padding-left:2mm;">
						  Reserved for future use
						  <!--Dotted Line-->
						  <span class="styDotLn" style="float:right;">.................</span>
						</div>
						<div class="styLNRightNumBox" style="height:4mm;padding-top:.5mm;">11c</div>
						<div class="styLNAmountBox" style="height:4mm;width:27mm;padding-top:0mm;
						 background-color:lightgrey;">
						  <!--<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" 
							 select="$Form3468Data/QlfySmallWindEnergyPropCrGrp/SmllrCalcBasisWindEgySpcfdAmt"/>
						  </xsl:call-template>-->
						</div>
						 <div class="styLNRightNumBoxNBB" style="height:4mm;background-color:lightgrey;"/>
						 <div class="styLNAmountBox" style="height:4mm;width:27mm;border-left-width:1px;
						  border-bottom-width:0px;"/>  
					</div>
					<!-- End of 11c -->
					<!-- Start of Line 11d -->
					<div style="11mm;width:187mm;font-size:8pt">
						<div class="styLNLeftNumBox" style="height:4mm;padding-left:4mm;">d</div>
						<div class="styLNDesc" style="height:11mm;width:73mm;padding-left:2mm">
						 Enter the basis of property using small wind energy property placed in service during the tax year
						  <!--Dotted Line-->
							<span class="styDotLn" style="float:right;">...............</span>
						</div>
						<div class="styLNRightNumBox" style="height:11mm;padding-top:7.5mm">11d</div>
						<div class="styLNAmountBox" style="height:11mm;width:27mm;padding-top:7.5mm;font-size:8pt">
							<xsl:call-template name="PopulateAmount">
							  <xsl:with-param name="TargetNode" 
							   select="$Form3468Data/QlfySmallWindEnergyPropCrGrp/WindEgyBssAfterSpcfdPrdAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBoxNBB" style="height:11mm;background-color:lightgrey;
						 border-right-width:0mm"/>
						<div class="styLNAmountBox" style="height:11mm;width:27mm;border-bottom-width:0px;"/>      
						<div class="styLNRightNumBoxNBB" style="height:11mm;background-color:lightgrey;
						 border-left-width:1px;border-right-width:0px;"/>  
						<div class="styLNAmountBox" style="height:11mm;width:27mm;border-left-width:1px;
						  border-bottom-width:0px;"/>
					</div>
					<!-- End of 11d -->
					<!-- Start of Line 11e -->
					<div style="height:7.5mm;width:187mm;font-size:8pt">
						<div class="styLNLeftNumBox" style="height:4mm;padding-left:4mm;">e</div>
						<div class="styLNDesc" style="height:7.5mm;width:73mm;padding-left:2mm">
						 If you checked the box in Part I, line 7a or 8b, enter 30%. Otherwise, enter 6%
						  <!--Dotted Line-->
							<span class="styDotLn" style="float:right;">.....</span>
						</div>
						<div class="styLNRightNumBox" style="height:7.5mm;padding-top:4mm">11e</div>
						<div class="styLNAmountBox" style="height:7.5mm;width:27mm;padding-top:4mm;font-size:8pt">
							<xsl:call-template name="PopulateAmount">
							  <xsl:with-param name="TargetNode" 
							   select="$Form3468Data/QlfySmallWindEnergyPropCrGrp/NetOutLss1MWACOrStsfdWgReqPct"/>
							</xsl:call-template>%
						</div>
						<div class="styLNRightNumBoxNBB" style="height:7.5mm;background-color:lightgrey;
						 border-right-width:0mm"/>
						<div class="styLNAmountBox" style="height:7.5mm;width:27mm;border-bottom-width:0px;"/>      
						<div class="styLNRightNumBoxNBB" style="height:7.5mm;background-color:lightgrey;
						 border-left-width:1px;border-right-width:0px;"/>  
						<div class="styLNAmountBox" style="height:7.5mm;width:27mm;border-left-width:1px;
						  border-bottom-width:0px;"/>
					</div>
					<!-- End of 11e -->
					<!-- Line 11f -->
					<div style="height:4mm;width:187mm;font-size:8pt">
						<div class="styLNLeftNumBox" style="height:4mm;padding-top:.5mm;padding-left:4mm">f</div>
						<div class="styLNDesc" style="height:4mm;width:108mm;padding-top:1mm;padding-left:2mm;">
						  Multiply line 11d by line 11e
						  <!--Dotted Line-->
						  <span class="styDotLn" style="float:right;">................</span>
						</div>
						<div class="styLNRightNumBox" style="height:4.5mm;padding-top:.5mm;border-bottom-width:0px;">11f</div>
						<div class="styLNAmountBox" style="height:4.5mm;width:27mm;padding-top:1mm;border-bottom-width:1px;">
						  <xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" 
							 select="$Form3468Data/QlfySmallWindEnergyPropCrGrp/CalcWindEgyBssAfterSpcfdPrdAmt"/>
						  </xsl:call-template>
						</div>
						 <div class="styLNRightNumBoxNBB" style="height:4mm;background-color:lightgrey;"/>
						 <div class="styLNAmountBox" style="height:4mm;width:27mm;border-left-width:1px;
						  border-bottom-width:0px;"/>  
					</div>
					<!-- End of 11f -->
					<!-- Start of Line 11g -->
					<div style="27.5mm;width:187mm;font-size:8pt">
						<div class="styLNLeftNumBox" style="height:4mm;padding-left:4mm;">g</div>
						<div class="styLNDesc" style="height:27mm;width:73mm;padding-left:2mm">
						 If you checked the box in Part I, line 11a or 11b, enter 10%. If you checked the box in Part I, line
						 11c or 11d, enter 20%. However, if you checked the box in Part I, line 11g; or Part I, line 12b, is
						 5 MW ac or more (in relation to line 11a, 11b, 11c, or 11d), you don’t qualify for the bonus credit.
						 In that situation, enter 0% here, go to line 11m and enter -0-, and then go to line 11n
						  <!--Dotted Line-->
							<span class="styDotLn" style="float:right;">..</span>
						</div>
						<div class="styLNRightNumBox" style="height:27.5mm;padding-top:23.5mm">11g</div>
						<div class="styLNAmountBox" style="height:27.5mm;width:27mm;padding-top:24mm;font-size:8pt;
						  border-bottom-width:0mm">
							<xsl:call-template name="PopulateAmount">
							  <xsl:with-param name="TargetNode" 
							   select="$Form3468Data/QlfySmallWindEnergyPropCrGrp/LowIncmSolarWindBonusCrPct"/>
							</xsl:call-template>%
						</div>
						<div class="styLNRightNumBoxNBB" style="height:27.5mm;background-color:lightgrey;
						 border-right-width:0mm"/>
						<div class="styLNAmountBox" style="height:27.5mm;width:27mm;border-bottom-width:0px;"/>      
						<div class="styLNRightNumBoxNBB" style="height:27.5mm;background-color:lightgrey;
						 border-left-width:1px;border-right-width:0px;"/>  
						<div class="styLNAmountBox" style="height:27.5mm;width:27mm;border-left-width:1px;
						  border-bottom-width:0px;"/>
					</div>
					<!-- End of 11g -->
					<!-- Start of Line 11h -->
					<div style="7.5mm;width:187mm;font-size:8pt">
						<div class="styLNLeftNumBox" style="height:4mm;padding-left:4mm;">h</div>
						<div class="styLNDesc" style="height:7.5mm;width:73mm;padding-left:2mm">
						 Enter the amount of capacity limitation you were allocated in the allocation letter
						  <!--Dotted Line-->
							<span class="styDotLn" style="float:right;">......</span>
						</div>
						<div class="styLNRightNumBox" style="height:7.5mm;padding-top:3.5mm">11h</div>
						<div class="styLNAmountBox" style="height:7.5mm;width:50mm;padding-top:3.5mm;font-size:8pt;
						  border-top-width:1px">
							<xsl:call-template name="PopulateAmount">
							  <xsl:with-param name="TargetNode" 
							   select="$Form3468Data/QlfySmallWindEnergyPropCrGrp/AllocLmtEnergyCapKWQty"/>
							</xsl:call-template>kW
						</div>
						<!--<div class="styLNRightNumBoxNBB" style="height:7.5mm;background-color:lightgrey;
						 border-right-width:0mm"/>-->
						<div class="styLNAmountBox" style="height:7.5mm;width:12mm;border-bottom-width:0px;"/>      
						<div class="styLNRightNumBoxNBB" style="height:7.5mm;background-color:lightgrey;
						 border-left-width:1px;border-right-width:0px;"/>  
						<div class="styLNAmountBox" style="height:7.5mm;width:27mm;border-left-width:1px;
						  border-bottom-width:0px;"/>
					</div>
					<!-- End of 11h -->
					<!-- Start of Line 11i -->
					<div style="11mm;width:187mm;font-size:8pt">
						<div class="styLNLeftNumBox" style="height:4mm;padding-left:4mm;">i</div>
						<div class="styLNDesc" style="height:11mm;width:73mm;padding-left:2mm">
						 If the entry on Part I, line 12b, equals the entry on line 11h, multiply line 11d by 11g and go to
						  line 11m. Otherwise, continue to line 11j
						  <!--Dotted Line-->
							<span class="styDotLn" style="float:right;">..</span>
						</div>
						<div class="styLNRightNumBox" style="height:11mm;padding-top:7.5mm">11i</div>
						<div class="styLNAmountBox" style="height:11mm;width:27mm;padding-top:7.5mm;font-size:8pt">
							<xsl:call-template name="PopulateAmount">
							  <xsl:with-param name="TargetNode" 
							   select="$Form3468Data/QlfySmallWindEnergyPropCrGrp/LowIncmComFullBonusCrAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBoxNBB" style="height:11mm;background-color:lightgrey;
						 border-right-width:0mm"/>
						<div class="styLNAmountBox" style="height:11mm;width:27mm;border-bottom-width:0px;"/>      
						<div class="styLNRightNumBoxNBB" style="height:11mm;background-color:lightgrey;
						 border-left-width:1px;border-right-width:0px;"/>  
						<div class="styLNAmountBox" style="height:11mm;width:27mm;border-left-width:1px;
						  border-bottom-width:0px;"/>
					</div>
					<!-- End of 11i -->
					<!-- Start of Line 11j -->
					<div style="11mm;width:187mm;font-size:8pt">
						<div class="styLNLeftNumBox" style="height:4mm;padding-left:4mm;">j</div>
						<div class="styLNDesc" style="height:11mm;width:73mm;padding-left:2mm">
						 If the entry on Part I, line 12b, is more than the entry on line 11h, divide line 11h by Part I, 
						  line 12b
						  <!--Dotted Line-->
							<span class="styDotLn" style="float:right;">...............</span>
						</div>
						<div class="styLNRightNumBox" style="height:11mm;padding-top:7.5mm">11j</div>
						<div class="styLNAmountBox" style="height:11mm;width:27mm;padding-top:7.5mm;font-size:8pt">
							<xsl:call-template name="PopulateAmount">
							  <xsl:with-param name="TargetNode" 
							   select="$Form3468Data/QlfySmallWindEnergyPropCrGrp/LowIncmComAllocRedFctrRt"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBoxNBB" style="height:11mm;background-color:lightgrey;
						 border-right-width:0mm"/>
						<div class="styLNAmountBox" style="height:11mm;width:27mm;border-bottom-width:0px;"/>      
						<div class="styLNRightNumBoxNBB" style="height:11mm;background-color:lightgrey;
						 border-left-width:1px;border-right-width:0px;"/>  
						<div class="styLNAmountBox" style="height:11mm;width:27mm;border-left-width:1px;
						  border-bottom-width:0px;"/>
					</div>
					<!-- End of 11j -->
					<!-- Start of Line 11k -->
					<div style="4mm;width:187mm;font-size:8pt">
						<div class="styLNLeftNumBox" style="height:4mm;padding-left:4mm;">k</div>
						<div class="styLNDesc" style="height:4mm;width:73mm;padding-left:2mm">
						 Multiply line 11g by line 11j
						  <!--Dotted Line-->
							<span class="styDotLn" style="float:right;">.......</span>
						</div>
						<div class="styLNRightNumBox" style="height:4mm;padding-top:.5mm">11k</div>
						<div class="styLNAmountBox" style="height:4mm;width:27mm;padding-top:.5mm;font-size:8pt">
							<xsl:call-template name="PopulateAmount">
							  <xsl:with-param name="TargetNode" 
							   select="$Form3468Data/QlfySmallWindEnergyPropCrGrp/LowIncmComPctRedFctrRt"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBoxNBB" style="height:4mm;background-color:lightgrey;
						 border-right-width:0mm"/>
						<div class="styLNAmountBox" style="height:4mm;width:27mm;border-bottom-width:0px;"/>      
						<div class="styLNRightNumBoxNBB" style="height:4mm;background-color:lightgrey;
						 border-left-width:1px;border-right-width:0px;"/>  
						<div class="styLNAmountBox" style="height:4mm;width:27mm;border-left-width:1px;
						  border-bottom-width:0px;"/>
					</div>
					<!-- End of 11k -->
					<!-- Start of Line 11l -->
					<div style="4mm;width:187mm;font-size:8pt">
						<div class="styLNLeftNumBox" style="height:4mm;padding-left:4mm;">l</div>
						<div class="styLNDesc" style="height:4mm;width:73mm;padding-left:2mm">
						 Multiply line 11d by line 11k
						  <!--Dotted Line-->
							<span class="styDotLn" style="float:right;">.......</span>
						</div>
						<div class="styLNRightNumBox" style="height:4mm;padding-top:.5mm">11l</div>
						<div class="styLNAmountBox" style="height:4mm;width:27mm;padding-top:.5mm;font-size:8pt">
							<xsl:call-template name="PopulateAmount">
							  <xsl:with-param name="TargetNode" 
							   select="$Form3468Data/QlfySmallWindEnergyPropCrGrp/LowIncmComRedFctrCrAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBoxNBB" style="height:4mm;background-color:lightgrey;
						 border-right-width:0mm"/>
						<div class="styLNAmountBox" style="height:4mm;width:27mm;border-bottom-width:0px;"/>      
						<div class="styLNRightNumBoxNBB" style="height:4mm;background-color:lightgrey;
						 border-left-width:1px;border-right-width:0px;"/>  
						<div class="styLNAmountBox" style="height:4mm;width:27mm;border-left-width:1px;
						  border-bottom-width:0px;"/>
					</div>
					<!-- End of 11l -->
					<!-- Line 11m -->
					<div style="height:7.5mm;width:187mm;font-size:8pt">
						<div class="styLNLeftNumBox" style="height:4mm;padding-top:.5mm;padding-left:4mm">m</div>
						<div class="styLNDesc" style="height:7.5mm;width:108mm;padding-top:1mm;padding-left:2mm;">
						  If Part I, line 12b, is more than the entry on line 11h, enter the amount from line 11l. 
						   Otherwise, enter the amount from line 11i
						  <!--Dotted Line-->
						  <span class="styDotLn" style="float:right;">.....</span>
						</div>
						<div class="styLNRightNumBox" style="height:7.5mm;padding-top:4mm;border-bottom-width:0px;">11m
						</div>
						<div class="styLNAmountBox" style="height:7.5mm;width:27mm;padding-top:4mm;border-bottom-width:0px">
						  <xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" 
							 select="$Form3468Data/QlfySmallWindEnergyPropCrGrp/CalcLowIncmSolarWindBonusCrAmt"/>
						  </xsl:call-template>
						</div>
						 <div class="styLNRightNumBoxNBB" style="height:7.5mm;background-color:lightgrey;"/>
						 <div class="styLNAmountBox" style="height:7.5mm;width:27mm;border-left-width:1px;
						  border-bottom-width:0px;"/>  
					</div>
					<!-- End of 11m -->
					<!-- Start of Line 11n -->
					<div style="height:11mm;width:187mm;font-size:8pt">
						<div class="styLNLeftNumBox" style="height:4mm;padding-left:4mm">n</div>
						<div class="styLNDesc" style="height:11mm;width:73mm;padding-left:2mm">
						 If you checked the box in Part I, line 9a, enter 10%. If you checked the box in Part I, line 9b, 
						 enter 2%. Otherwise, go to line 11p
						  <!--Dotted Line-->
						  <span class="styDotLn" style="float:right;">....</span>
						</div>
						<div class="styLNRightNumBox" style="height:11mm;padding-top:7mm;">11n</div>
						<div class="styLNAmountBox" style="height:11mm;width:27mm;padding-top:7.5mm;font-size:8pt">
							<xsl:call-template name="PopulateAmount">
							  <xsl:with-param name="TargetNode" 
							   select="$Form3468Data/QlfySmallWindEnergyPropCrGrp/DomContentBonusCreditPct"/>
							</xsl:call-template>%
						</div>
						<div class="styLNRightNumBoxNBB" style="height:11mm;background-color:lightgrey;
						 border-right-width:0mm;border-bottom-width:0px"/>
						<div class="styLNAmountBox" style="height:11mm;width:27mm;border-bottom-width:0px;"/>      
						<div class="styLNRightNumBoxNBB" style="height:11mm;background-color:lightgrey;
						  border-left-width:1px;border-right-width:0px;"/>  
						<div class="styLNAmountBox" style="height:11mm;width:27mm;border-left-width:1px;
						  border-bottom-width:0px;"/>
					</div>
					<!-- End of 11n -->
					<!-- Line 11o -->
					<div style="height:4mm;width:187mm;font-size:8pt">
						<div class="styLNLeftNumBox" style="height:4mm;padding-top:.5mm;padding-left:4mm">o</div>
						<div class="styLNDesc" style="height:4mm;width:108mm;padding-top:0mm;padding-left:2mm;">
						  Multiply line 11d by line 11n
						  <!--Dotted Line-->
						  <span class="styDotLn" style="float:right;">...............</span>
						</div>
						<div class="styLNRightNumBox" style="height:4mm;padding-top:.5mm;">11o</div>
						<div class="styLNAmountBox" style="height:4mm;width:27mm;padding-top:0mm;">
						  <xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" 
							 select="$Form3468Data/QlfySmallWindEnergyPropCrGrp/CalcDomContentBonusCreditAmt"/>
						  </xsl:call-template>
						</div>
						 <div class="styLNRightNumBoxNBB" style="height:4mm;background-color:lightgrey;"/>
						 <div class="styLNAmountBox" style="height:4mm;width:27mm;border-left-width:1px;
						  border-bottom-width:0px;"/>  
					</div>
					<!-- End of 11o -->
					<!-- Start of Line 11p -->
					<div style="height:11mm;width:187mm;font-size:8pt">
						<div class="styLNLeftNumBox" style="height:4mm;padding-left:4mm">p</div>
						<div class="styLNDesc" style="height:11mm;width:73mm;padding-left:2mm">
						 If you checked the box in Part I, line 10a, enter 10%. If you checked the box in Part I, line 10b,
						 enter 2%. Otherwise, go to line 12
						  <!--Dotted Line-->
						  <span class="styDotLn" style="float:right;">....</span>
						</div>
						<div class="styLNRightNumBox" style="height:11mm;padding-top:7mm;">11p</div>
						<div class="styLNAmountBox" style="height:11mm;width:27mm;padding-top:7.5mm;font-size:8pt">
							<xsl:call-template name="PopulateAmount">
							  <xsl:with-param name="TargetNode" 
							   select="$Form3468Data/QlfySmallWindEnergyPropCrGrp/EnergyComBonusCreditPct"/>
							</xsl:call-template>%
						</div>
						<div class="styLNRightNumBoxNBB" style="height:11mm;background-color:lightgrey;
						 border-right-width:0mm;border-bottom-width:0px"/>
						<div class="styLNAmountBox" style="height:11mm;width:27mm;border-bottom-width:0px;"/>      
						<div class="styLNRightNumBoxNBB" style="height:11mm;background-color:lightgrey;
						  border-left-width:1px;border-right-width:0px;"/>  
						<div class="styLNAmountBox" style="height:11mm;width:27mm;border-left-width:1px;
						  border-bottom-width:0px;"/>
					</div>
					<!-- End of 11p -->
					<!-- Line 11q -->
					<div style="height:4mm;width:187mm;font-size:8pt">
						<div class="styLNLeftNumBox" style="height:4mm;padding-top:.5mm;padding-left:4mm">q</div>
						<div class="styLNDesc" style="height:4mm;width:108mm;padding-top:0mm;padding-left:2mm;">
						  Multiply line 11d by line 11p
						  <!--Dotted Line-->
						  <span class="styDotLn" style="float:right;">...............</span>
						</div>
						<div class="styLNRightNumBox" style="height:4mm;padding-top:.3mm;">11q</div>
						<div class="styLNAmountBox" style="height:4mm;width:27mm;padding-top:0mm;">
						  <xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" 
							 select="$Form3468Data/QlfySmallWindEnergyPropCrGrp/CalcEnergyComBonusCreditAmt"/>
						  </xsl:call-template>
						</div>
						 <div class="styLNRightNumBoxNBB" style="height:4mm;background-color:lightgrey;"/>
						 <div class="styLNAmountBox" style="height:4mm;width:27mm;border-left-width:1px;
						  border-bottom-width:0px;"/>  
					</div>
					<!-- End of 11q -->
					<!--Line 12 -->
					<div style="height:5.5mm;width:187mm;font-size:8pt;">
						<div class="styLNLeftNumBox" style="height:5.5mm;padding-top:2mm;padding-left:0mm">12</div>
						<div class="styLNDesc" style="width:143mm;height:5.5mm;padding-top:2mm;padding-left:2mm;">
						  Add lines 11f, 11m, 11o, and 11q
							<!--Dotted Line-->
							<div class="styDotLn" style="float:none;">......................</div>						  
						</div>
						<div class="styLNRightNumBoxNBB" style="height:5.5mm;padding-top:2.3mm">12</div>
						<div class="styLNAmountBox" style="height:5.5mm;width:27mm;padding-top:2.3mm;border-left-width:1px;
						 border-bottom-width:0px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" 
								select="$Form3468Data/QlfySmallWindEnergyPropCrGrp/TotalSmallWindEnergyPropCrAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- End of 12 -->
						<!-- Page Break and Footer-->
					<div class="styBB" style="width:187mm;clear:both;padding-top:0.4mm;border-top-width:2px;
					 border-bottom-width:0px">
						<!--<div style="width:90mm;font-weight:bold;font-size:7pt" class="styGenericDiv">For Paperwork 
						 Reduction Act Notice, see separate instructions.</div>
						<div style="width:55mm;text-align:center;" class="styGenericDiv">Cat. No. 12276E</div>-->
						<div style="float:right;" class="styGenericDiv">Form <span class="styBoldText">3468</span> (2025)
						</div>
					</div>
					<br/>
					<div class="pageEnd"/>
					<div style="page-break-after:always"/>
					<!-- End Footer -->
					<!-- Header -->
					<div style="width:187mm;padding-top:1mm;float:left">
					  Form 3468 (2025)
						<span style="width:15mm;float:right;">Page 
							<span class="styBoldText" style="font-size:8pt;">8</span>
						</span>
					</div>
					<!-- End Header -->
					<!-- Start of Part VI Section G -->
					<div class="styBB" style="width:187mm;border-top-width:1px;">
						<div class="styPartName" style="height:5mm;width:15mm;font-size:8pt;padding-top:1mm;">Part VI
						</div>
						<div class="styPartDesc" style="height:auto;width:170mm;font-weight:normal;font-size:9pt;
						 padding-left:2mm;padding-top:1mm">
						 <b>Energy Credit Under Section 48</b><i> (continued)</i>
						</div>
					</div>
					<!-- Part VI Section G -->
					<div class="styBB" style="width:187mm;border-top-width:1px;">
						<div class="styPartDesc" style="width:170mm; height:auto; font-weight:normal;font-size:9pt;
						 padding-left:0mm;padding-top:1mm"><b>Section G—Waste Energy Recovery Property</b> 
						  (see instructions)
						</div>
					</div>
					<!-- Start of Line 13a -->
					<div style="7.5mm;width:187mm;font-size:8pt">
						<div class="styLNLeftNumBox" style="height:4mm;padding-left:2mm;">13a</div>
						<div class="styLNDesc" style="height:7.5mm;width:73mm;padding-left:2mm">
						 Enter the basis of property using waste energy recovery placed in service during the tax year
						  <!--Dotted Line-->
							<!--<span class="styDotLn" style="float:right;">.......</span>-->
						</div>
						<div class="styLNRightNumBox" style="height:7.5mm;padding-top:3.5mm">13a</div>
						<div class="styLNAmountBox" style="height:7.5mm;width:27mm;padding-top:3.5mm;font-size:8pt">
							<xsl:call-template name="PopulateAmount">
							  <xsl:with-param name="TargetNode" 
							   select="$Form3468Data/WasteEnergyRecoveryPropCrGrp/BssWasteEgyRcvryPropAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBoxNBB" style="height:7.5mm;background-color:lightgrey;
						 border-right-width:0mm"/>
						<div class="styLNAmountBox" style="height:7.5mm;width:27mm;border-bottom-width:0px;"/>      
						<div class="styLNRightNumBoxNBB" style="height:7.5mm;background-color:lightgrey;
						 border-left-width:1px;border-right-width:0px;"/>  
						<div class="styLNAmountBox" style="height:7.5mm;width:27mm;border-left-width:1px;
						  border-bottom-width:0px;"/>
					</div>
					<!-- End of 13a -->
					<!-- Start of Line 13b -->
					<div style="7.5mm;width:187mm;font-size:8pt">
						<div class="styLNLeftNumBox" style="height:4mm;padding-left:4mm;">b</div>
						<div class="styLNDesc" style="height:7.5mm;width:73mm;padding-left:2mm;">
						 If you checked the box in Part I, line 7a or 8b, enter 30%. Otherwise, enter 6%
						  <!--Dotted Line-->
							<span class="styDotLn" style="float:right;">.....</span>
						</div>
						<div class="styLNRightNumBox" style="height:7.5mm;padding-top:4mm">13b</div>
						<div class="styLNAmountBox" style="height:7.5mm;width:27mm;padding-top:3.5mm;font-size:8pt">
							<xsl:call-template name="PopulateAmount">
							  <xsl:with-param name="TargetNode" 
							   select="$Form3468Data/WasteEnergyRecoveryPropCrGrp/NetOutLss1MWACOrStsfdWgReqPct"/>
							</xsl:call-template>%
						</div>
						<div class="styLNRightNumBoxNBB" style="height:7.5mm;background-color:lightgrey;
						 border-right-width:0mm"/>
						<div class="styLNAmountBox" style="height:7.5mm;width:27mm;border-bottom-width:0px;"/>      
						<div class="styLNRightNumBoxNBB" style="height:7.5mm;background-color:lightgrey;
						 border-left-width:1px;border-right-width:0px;"/>  
						<div class="styLNAmountBox" style="height:7.5mm;width:27mm;border-left-width:1px;
						  border-bottom-width:0px;"/>
					</div>
					<!-- End of 13b -->
					<!-- Line 13c -->
					<div style="height:4mm;width:187mm;font-size:8pt">
						<div class="styLNLeftNumBox" style="height:4mm;padding-top:.5mm;padding-left:4mm">c</div>
						<div class="styLNDesc" style="height:4mm;width:108mm;padding-top:.5mm;padding-left:2mm;">
						  Multiply line 13a by line 13b
						  <!--Dotted Line-->
						  <span class="styDotLn" style="float:right;">...............</span>
						</div>
						<div class="styLNRightNumBox" style="height:4mm;padding-top:.5mm;border-bottom-width:0px;">13c
						</div>
						<div class="styLNAmountBox" style="height:4mm;width:27mm;padding-top:.5mm;">
						  <xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" 
							 select="$Form3468Data/WasteEnergyRecoveryPropCrGrp/CalcBssWasteEgyRcvryPropAmt"/>
						  </xsl:call-template>
						</div>
						 <div class="styLNRightNumBoxNBB" style="height:4mm;background-color:lightgrey;"/>
						 <div class="styLNAmountBox" style="height:4mm;width:27mm;border-left-width:1px;
						  border-bottom-width:0px;"/>  
					</div>
					<!-- End of 13c -->
					<!-- Start of Line 13d -->
					<div style="height:11mm;width:187mm;font-size:8pt">
						<div class="styLNLeftNumBox" style="height:4mm;padding-left:4mm">d</div>
						<div class="styLNDesc" style="height:11mm;width:73mm;padding-left:2mm">
						 If you checked the box in Part I, line 9a, enter 10%. If you checked the box in Part I, line 9b,
						  enter 2%. Otherwise, go to line 13f
						  <!--Dotted Line-->
						  <span class="styDotLn" style="float:right;">....</span>
						</div>
						<div class="styLNRightNumBox" style="height:11mm;padding-top:7mm;">13d</div>
						<div class="styLNAmountBox" style="height:11mm;width:27mm;padding-top:7.5mm;font-size:8pt">
							<xsl:call-template name="PopulateAmount">
							  <xsl:with-param name="TargetNode" 
							   select="$Form3468Data/WasteEnergyRecoveryPropCrGrp/DomContentBonusCreditPct"/>
							</xsl:call-template>%
						</div>
						<div class="styLNRightNumBoxNBB" style="height:11mm;background-color:lightgrey;
						 border-right-width:0mm;border-bottom-width:0px"/>
						<div class="styLNAmountBox" style="height:11mm;width:27mm;border-bottom-width:0px;"/>      
						<div class="styLNRightNumBoxNBB" style="height:11mm;background-color:lightgrey;
						  border-left-width:1px;border-right-width:0px;"/>  
						<div class="styLNAmountBox" style="height:11mm;width:27mm;border-left-width:1px;
						  border-bottom-width:0px;"/>
					</div>
					<!-- End of 13d -->
					<!-- Line 13e -->
					<div style="height:4mm;width:187mm;font-size:8pt">
						<div class="styLNLeftNumBox" style="height:4mm;padding-top:.5mm;padding-left:4mm">e</div>
						<div class="styLNDesc" style="height:4mm;width:108mm;padding-top:0mm;padding-left:2mm;">
						  Multiply line 13a by line 13d
						  <!--Dotted Line-->
						  <span class="styDotLn" style="float:right;">................</span>
						</div>
						<div class="styLNRightNumBox" style="height:4mm;padding-top:.5mm;">13e</div>
						<div class="styLNAmountBox" style="height:4mm;width:27mm;padding-top:.5mm;">
						  <xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" 
							 select="$Form3468Data/WasteEnergyRecoveryPropCrGrp/CalcDomContentBonusCreditAmt"/>
						  </xsl:call-template>
						</div>
						 <div class="styLNRightNumBoxNBB" style="height:4mm;background-color:lightgrey;"/>
						 <div class="styLNAmountBox" style="height:4mm;width:27mm;border-left-width:1px;
						  border-bottom-width:0px;"/>  
					</div>
					<!-- End of 13e -->
					<!-- Start of Line 13f -->
					<div style="height:14mm;width:187mm;font-size:8pt">
						<div class="styLNLeftNumBox" style="height:4mm;padding-left:4mm">f</div>
						<div class="styLNDesc" style="height:14mm;width:73mm;padding-left:2mm">
						 If you checked the box in Part I, line 10a, enter 10%. If you checked the box in Part I, line 10b,
						  enter 2%. Otherwise, go to line 14
						  <!--Dotted Line-->
						  <span class="styDotLn" style="float:right;">.....</span>
						</div>
						<div class="styLNRightNumBox" style="height:14mm;padding-top:10.5mm;">13f</div>
						<div class="styLNAmountBox" style="height:14mm;width:27mm;padding-top:10.5mm;font-size:8pt">
							<xsl:call-template name="PopulateAmount">
							  <xsl:with-param name="TargetNode" 
							   select="$Form3468Data/WasteEnergyRecoveryPropCrGrp/EnergyComBonusCreditPct"/>
							</xsl:call-template>%
						</div>
						<div class="styLNRightNumBoxNBB" style="height:14mm;background-color:lightgrey;
						 border-right-width:0mm;border-bottom-width:0px"/>
						<div class="styLNAmountBox" style="height:14mm;width:27mm;border-bottom-width:0px;"/>      
						<div class="styLNRightNumBoxNBB" style="height:14mm;background-color:lightgrey;
						  border-left-width:1px;border-right-width:0px;"/>  
						<div class="styLNAmountBox" style="height:14mm;width:27mm;border-left-width:1px;
						  border-bottom-width:0px;"/>
					</div>
					<!-- End of 13f -->
					<!-- Line 13g -->
					<div style="height:4mm;width:187mm;font-size:8pt">
						<div class="styLNLeftNumBox" style="height:4mm;padding-top:.5mm;padding-left:4mm">g</div>
						<div class="styLNDesc" style="height:4mm;width:108mm;padding-top:0mm;padding-left:2mm;">
						  Multiply line 13a by line 13f
						  <!--Dotted Line-->
						  <span class="styDotLn" style="float:right;">................</span>
						</div>
						<div class="styLNRightNumBox" style="height:4mm;padding-top:0mm;">13g</div>
						<div class="styLNAmountBox" style="height:4mm;width:27mm;padding-top:.5mm;">
						  <xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" 
							 select="$Form3468Data/WasteEnergyRecoveryPropCrGrp/CalcEnergyComBonusCreditAmt"/>
						  </xsl:call-template>
						</div>
						 <div class="styLNRightNumBoxNBB" style="height:4mm;background-color:lightgrey;"/>
						 <div class="styLNAmountBox" style="height:4mm;width:27mm;border-left-width:1px;
						  border-bottom-width:0px;"/>  
					</div>
					<!-- End of 13g -->
					<!--Line 14 -->
					<div style="height:7.5mm;width:187mm;font-size:8pt">
						<div class="styLNLeftNumBox" style="height:7.5mm;padding-top:3.5mm;padding-left:0mm">14</div>
						<div class="styLNDesc" style="width:143mm;height:7.5mm;padding-top:4mm;padding-left:2mm;">
						  Add lines 13c, 13e, and 13g
							<!--Dotted Line-->
							<div class="styDotLn" style="float:none;">........................</div>						  
						</div>
						<div class="styLNRightNumBoxNBB" style="height:7.5mm;padding-top:4.5mm">14</div>
						<div class="styLNAmountBox" style="height:7.5mm;width:27mm;padding-top:4.5mm;border-left-width:1px;
						 border-bottom-width:0px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" 
								select="$Form3468Data/WasteEnergyRecoveryPropCrGrp/TotalWasteEnergyRecoveryCrAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- End of 14 -->
					<!-- Part VI Section H -->
					<div class="styBB" style="width:187mm;border-top-width:1px;">
						<div class="styPartDesc" style="width:170mm; height:auto; font-weight:normal;font-size:9pt;
						 padding-left:0mm;padding-top:1mm"><b>Section H—Geothermal Heat Pump Systems</b> 
						  (see instructions)
						</div>
					</div>
					<!-- Start of Line 15a -->
					<div style="11mm;width:187mm;font-size:8pt">
						<div class="styLNLeftNumBox" style="height:4mm;padding-left:0mm;">15a</div>
						<div class="styLNDesc" style="height:11mm;width:73mm;padding-left:2mm">
						 Enter the basis of property using geothermal heat pump systems placed in service during the tax year
						  <!--Dotted Line-->
							<span class="styDotLn" style="float:right;">..............</span>
						</div>
						<div class="styLNRightNumBox" style="height:11mm;padding-top:7.5mm">15a</div>
						<div class="styLNAmountBox" style="height:11mm;width:27mm;padding-top:7.5mm;font-size:8pt">
							<xsl:call-template name="PopulateAmount">
							  <xsl:with-param name="TargetNode" 
							   select="$Form3468Data/GeothermalHeatPumpSystemCrGrp/BssGthrmlPropHtPumpSysAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBoxNBB" style="height:11mm;background-color:lightgrey;
						 border-right-width:0mm"/>
						<div class="styLNAmountBox" style="height:11mm;width:27mm;border-bottom-width:0px;"/>      
						<div class="styLNRightNumBoxNBB" style="height:11mm;background-color:lightgrey;
						 border-left-width:1px;border-right-width:0px;"/>  
						<div class="styLNAmountBox" style="height:11mm;width:27mm;border-left-width:1px;
						  border-bottom-width:0px;"/>
					</div>
					<!-- End of 15a -->
					<!-- Start of Line 15b -->
					<div style="7.5mm;width:187mm;font-size:8pt">
						<div class="styLNLeftNumBox" style="height:4mm;padding-left:4mm;">b</div>
						<div class="styLNDesc" style="height:7.5mm;width:73mm;padding-left:2mm;">
						 If you checked the box in Part I, line 7a or 8b, enter 30%. Otherwise, enter 6%
						  <!--Dotted Line-->
							<span class="styDotLn" style="float:right;">.....</span>
						</div>
						<div class="styLNRightNumBox" style="height:7.5mm;padding-top:3.5mm">15b</div>
						<div class="styLNAmountBox" style="height:7.5mm;width:27mm;padding-top:4mm;font-size:8pt">
							<xsl:call-template name="PopulateAmount">
							  <xsl:with-param name="TargetNode" 
							   select="$Form3468Data/GeothermalHeatPumpSystemCrGrp/NetOutLss1MWACOrStsfdWgReqPct"/>
							</xsl:call-template>%
						</div>
						<div class="styLNRightNumBoxNBB" style="height:7.5mm;background-color:lightgrey;
						 border-right-width:0mm"/>
						<div class="styLNAmountBox" style="height:7.5mm;width:27mm;border-bottom-width:0px;"/>      
						<div class="styLNRightNumBoxNBB" style="height:7.5mm;background-color:lightgrey;
						 border-left-width:1px;border-right-width:0px;"/>  
						<div class="styLNAmountBox" style="height:7.5mm;width:27mm;border-left-width:1px;
						  border-bottom-width:0px;"/>
					</div>
					<!-- End of 15b -->
					<!-- Line 15c -->
					<div style="height:4mm;width:187mm;font-size:8pt">
						<div class="styLNLeftNumBox" style="height:4mm;padding-top:.5mm;padding-left:4mm">c</div>
						<div class="styLNDesc" style="height:4mm;width:108mm;padding-top:.5mm;padding-left:2mm;">
						  Multiply line 15a by line 15b
						  <!--Dotted Line-->
						  <span class="styDotLn" style="float:right;">...............</span>
						</div>
						<div class="styLNRightNumBox" style="height:4mm;padding-top:.5mm;border-bottom-width:0px;">15c
						</div>
						<div class="styLNAmountBox" style="height:4mm;width:27mm;padding-top:.5mm;">
						  <xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" 
							 select="$Form3468Data/GeothermalHeatPumpSystemCrGrp/CalcBssGthrmlPropHtPumpSysAmt"/>
						  </xsl:call-template>
						</div>
						 <div class="styLNRightNumBoxNBB" style="height:4mm;background-color:lightgrey;"/>
						 <div class="styLNAmountBox" style="height:4mm;width:27mm;border-left-width:1px;
						  border-bottom-width:0px;"/>  
					</div>
					<!-- End of 15c -->
					<!-- Start of Line 15d -->
					<div style="height:11mm;width:187mm;font-size:8pt">
						<div class="styLNLeftNumBox" style="height:4mm;padding-left:4mm">d</div>
						<div class="styLNDesc" style="height:11mm;width:73mm;padding-left:2mm">
						 If you checked the box in Part I, line 9a, enter 10%. If you checked the box in Part I, line 9b,
						  enter 2%. Otherwise, go to line 15f
						  <!--Dotted Line-->
						  <span class="styDotLn" style="float:right;">....</span>
						</div>
						<div class="styLNRightNumBox" style="height:11mm;padding-top:7mm;">15d</div>
						<div class="styLNAmountBox" style="height:11mm;width:27mm;padding-top:7.5mm;font-size:8pt">
							<xsl:call-template name="PopulateAmount">
							  <xsl:with-param name="TargetNode" 
							   select="$Form3468Data/GeothermalHeatPumpSystemCrGrp/DomContentBonusCreditPct"/>
							</xsl:call-template>%
						</div>
						<div class="styLNRightNumBoxNBB" style="height:11mm;background-color:lightgrey;
						 border-right-width:0mm;border-bottom-width:0px"/>
						<div class="styLNAmountBox" style="height:11mm;width:27mm;border-bottom-width:0px;"/>      
						<div class="styLNRightNumBoxNBB" style="height:11mm;background-color:lightgrey;
						  border-left-width:1px;border-right-width:0px;"/>  
						<div class="styLNAmountBox" style="height:11mm;width:27mm;border-left-width:1px;
						  border-bottom-width:0px;"/>
					</div>
					<!-- End of 15d -->
					<!-- Line 15e -->
					<div style="height:4mm;width:187mm;font-size:8pt">
						<div class="styLNLeftNumBox" style="height:4mm;padding-top:.5mm;padding-left:4mm">e</div>
						<div class="styLNDesc" style="height:4mm;width:108mm;padding-top:0mm;padding-left:2mm;">
						  Multiply line 15a by line 15d
						  <!--Dotted Line-->
						  <span class="styDotLn" style="float:right;">................</span>
						</div>
						<div class="styLNRightNumBox" style="height:4mm;padding-top:.5mm;">15e</div>
						<div class="styLNAmountBox" style="height:4mm;width:27mm;padding-top:.5mm;">
						  <xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" 
							 select="$Form3468Data/GeothermalHeatPumpSystemCrGrp/CalcDomContentBonusCreditAmt"/>
						  </xsl:call-template>
						</div>
						 <div class="styLNRightNumBoxNBB" style="height:4mm;background-color:lightgrey;"/>
						 <div class="styLNAmountBox" style="height:4mm;width:27mm;border-left-width:1px;
						  border-bottom-width:0px;"/>  
					</div>
					<!-- End of 15e -->
					<!-- Start of Line 15f -->
					<div style="height:11mm;width:187mm;font-size:8pt">
						<div class="styLNLeftNumBox" style="height:4mm;padding-left:4mm">f</div>
						<div class="styLNDesc" style="height:14mm;width:73mm;padding-left:2mm">
						 If you checked the box in Part I, line 10a, enter 10%. If you checked the box in Part I, line 10b,
						  enter 2%. Otherwise, go to line 16
						  <!--Dotted Line-->
						  <span class="styDotLn" style="float:right;">.....</span>
						</div>
						<div class="styLNRightNumBox" style="height:11mm;padding-top:7.5mm;border-bottom-width:1px">15f
						</div>
						<div class="styLNAmountBox" style="height:11mm;width:27mm;padding-top:7.5mm;font-size:7pt;
						 border-bottom-width:1px">
							<xsl:call-template name="PopulateAmount">
							  <xsl:with-param name="TargetNode" 
							   select="$Form3468Data/GeothermalHeatPumpSystemCrGrp/EnergyComBonusCreditPct"/>
							</xsl:call-template>%
						</div>
						<div class="styLNRightNumBoxNBB" style="height:11mm;background-color:lightgrey;
						 border-right-width:0mm;border-bottom-width:0px"/>
						<div class="styLNAmountBox" style="height:11mm;width:27mm;border-bottom-width:0px;"/>      
						<div class="styLNRightNumBoxNBB" style="height:11mm;background-color:lightgrey;
						  border-left-width:1px;border-right-width:0px;"/>  
						<div class="styLNAmountBox" style="height:11mm;width:27mm;border-left-width:1px;
						  border-bottom-width:0px;"/>
					</div>
					<!-- Line 15g -->
					<div style="height:4mm;width:187mm;font-size:8pt">
						<div class="styLNLeftNumBox" style="height:4mm;padding-top:.5mm;padding-left:4mm">g</div>
						<div class="styLNDesc" style="height:4mm;width:108mm;padding-top:0mm;padding-left:2mm;">
						  Multiply line 15a by line 15f
						  <!--Dotted Line-->
						  <span class="styDotLn" style="float:right;">................</span>
						</div>
						<div class="styLNRightNumBox" style="height:4mm;padding-top:0mm;">15g</div>
						<div class="styLNAmountBox" style="height:4mm;width:27mm;padding-top:.5mm;">
						  <xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" 
							 select="$Form3468Data/GeothermalHeatPumpSystemCrGrp/CalcEnergyComBonusCreditAmt"/>
						  </xsl:call-template>
						</div>
						 <div class="styLNRightNumBoxNBB" style="height:4mm;background-color:lightgrey;"/>
						 <div class="styLNAmountBox" style="height:4mm;width:27mm;border-left-width:1px;
						  border-bottom-width:0px;"/>  
					</div>
					<!-- End of 15g -->
					<!--Line 16 -->
					<div style="height:4mm;width:187mm;font-size:8pt">
						<div class="styLNLeftNumBox" style="height:4mm;padding-top:.5mm;padding-left:0mm">16</div>
						<div class="styLNDesc" style="width:143mm;height:4mm;padding-top:.5mm;padding-left:2mm;">
						  Add lines 15c, 15e, and 15g
							<!--Dotted Line-->
							<div class="styDotLn" style="float:none;">........................</div>						  
						</div>
						<div class="styLNRightNumBoxNBB" style="height:4mm;padding-top:.5mm">16</div>
						<div class="styLNAmountBox" style="height:4mm;width:27mm;padding-top:.5mm;border-left-width:1px;
						 border-bottom-width:0px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" 
								select="$Form3468Data/GeothermalHeatPumpSystemCrGrp/TotalGthrmlHeatPumpSysCrAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- End of 16 -->
						<!-- Page Break and Footer-->
					<div class="styBB" style="width:187mm;clear:both;padding-top:0.4mm;border-top-width:2px;
					 border-bottom-width:0px">
						<!--<div style="width:90mm;font-weight:bold;font-size:7pt" class="styGenericDiv">For Paperwork 
						 Reduction Act Notice, see separate instructions.</div>
						<div style="width:55mm;text-align:center;" class="styGenericDiv">Cat. No. 12276E</div>-->
						<div style="float:right;" class="styGenericDiv">Form <span class="styBoldText">3468</span> (2025)
						</div>
					</div>
					<br/>
					<div class="pageEnd"/>
					<div style="page-break-after:always"/>
					<!-- End Footer -->
					<!-- Header -->
					<div style="width:187mm;padding-top:1mm;float:left">
					  Form 3468 (2025)
						<span style="width:15mm;float:right;">Page 
							<span class="styBoldText" style="font-size:8pt;">9</span>
						</span>
					</div>
					<!-- End Header -->
					<!-- Start of Part VI Section I cont. -->
					<div class="styBB" style="width:187mm;border-top-width:1px;">
						<div class="styPartName" style="height:5mm;width:15mm;font-size:8pt;padding-top:1mm;">Part VI
						</div>
						<div class="styPartDesc" style="height:auto;width:170mm;font-weight:normal;font-size:9pt;
						 padding-left:2mm;padding-top:1mm">
						 <b>Energy Credit Under Section 48</b><i> (continued)</i>
						</div>
					</div>
					<!-- Part VI Section I -->
					<div class="styBB" style="width:187mm;border-top-width:1px;">
						<div class="styPartDesc" style="width:170mm; height:auto; font-weight:normal;font-size:9pt;
						 padding-left:0mm;padding-top:1mm"><b>Section I—Energy Storage Technology Property</b> 
						  (see instructions)
						</div>
					</div>
					<!-- Start of Line 17a -->
					<div style="7.5mm;width:187mm;font-size:8pt">
						<div class="styLNLeftNumBox" style="height:4mm;padding-left:0mm;">17a</div>
						<div class="styLNDesc" style="height:7.5mm;width:73mm;padding-left:2mm">
						 Enter the basis of property using energy storage technology placed in service during the tax year
						  <!--Dotted Line-->
							<!--<span class="styDotLn" style="float:right;">..............</span>-->
						</div>
						<div class="styLNRightNumBox" style="height:7.5mm;padding-top:4mm">17a</div>
						<div class="styLNAmountBox" style="height:7.5mm;width:27mm;padding-top:4mm;font-size:8pt">
							<xsl:call-template name="PopulateAmount">
							  <xsl:with-param name="TargetNode" 
							   select="$Form3468Data/EnergyStorageTechPropCrGrp/EnergyStorageTechPropBasisAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBoxNBB" style="height:7.5mm;padding-top:3.5mm;background-color:lightgrey;
						 border-right-width:0mm"/>
						<div class="styLNAmountBox" style="height:7.5mm;width:27mm;padding-top:3.5mm;
						 border-bottom-width:0px;"/>      
						<div class="styLNRightNumBoxNBB" style="height:7.5mm;padding-top:3.5mm;background-color:lightgrey;
						 border-left-width:1px;border-right-width:0px;"/>  
						<div class="styLNAmountBox" style="height:7.5mm;width:27mm;border-left-width:1px;
						  border-bottom-width:0px;"/>
					</div>
					<!-- End of 17a -->
					<!-- Start of Line 17b -->
					<div style="7.5mm;width:187mm;font-size:8pt">
						<div class="styLNLeftNumBox" style="height:4mm;padding-left:4mm;">b</div>
						<div class="styLNDesc" style="height:7.5mm;width:73mm;padding-left:2mm;">
						 If you checked the box in Part I, line 7a or 8b, enter 30%. Otherwise, enter 6%
						  <!--Dotted Line-->
							<span class="styDotLn" style="float:right;">.....</span>
						</div>
						<div class="styLNRightNumBox" style="height:7.5mm;padding-top:3.5mm">17b</div>
						<div class="styLNAmountBox" style="height:7.5mm;width:27mm;padding-top:4mm;font-size:8pt">
							<xsl:call-template name="PopulateAmount">
							  <xsl:with-param name="TargetNode" 
							   select="$Form3468Data/EnergyStorageTechPropCrGrp/NetOutLss1MWACOrStsfdWgReqPct"/>
							</xsl:call-template>%
						</div>
						<div class="styLNRightNumBoxNBB" style="height:7.5mm;background-color:lightgrey;
						 border-right-width:0mm"/>
						<div class="styLNAmountBox" style="height:7.5mm;width:27mm;border-bottom-width:0px;"/>      
						<div class="styLNRightNumBoxNBB" style="height:7.5mm;background-color:lightgrey;
						 border-left-width:1px;border-right-width:0px;"/>  
						<div class="styLNAmountBox" style="height:7.5mm;width:27mm;border-left-width:1px;
						  border-bottom-width:0px;"/>
					</div>
					<!-- End of 17b -->
					<!-- Line 17c -->
					<div style="height:4mm;width:187mm;font-size:8pt">
						<div class="styLNLeftNumBox" style="height:4mm;padding-top:.5mm;padding-left:4mm">c</div>
						<div class="styLNDesc" style="height:4mm;width:108mm;padding-top:.5mm;padding-left:2mm;">
						  Multiply line 17a by line 17b
						  <!--Dotted Line-->
						  <span class="styDotLn" style="float:right;">...............</span>
						</div>
						<div class="styLNRightNumBox" style="height:4mm;padding-top:.5mm;border-bottom-width:0px;">17c
						</div>
						<div class="styLNAmountBox" style="height:4mm;width:27mm;padding-top:.5mm;">
						  <xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" 
							 select="$Form3468Data/EnergyStorageTechPropCrGrp/CalcEgyStorageTechPropBasisAmt"/>
						  </xsl:call-template>
						</div>
						 <div class="styLNRightNumBoxNBB" style="height:4mm;background-color:lightgrey;"/>
						 <div class="styLNAmountBox" style="height:4mm;width:27mm;border-left-width:1px;
						  border-bottom-width:0px;"/>  
					</div>
					<!-- End of 17c -->
					<!-- Start Caution -->
					<div style="height:25mm;width:187mm;font-size:8pt">
						<div class="styLNDesc" style="height:14mm;width:116mm;padding-left:2mm">
						 <b>Caution:</b> For lines 17d through 17j, the energy storage technology property must be installed
						  in connection with a solar or wind energy property under section 45(d)(1), 48(a)(3)(A)(i), or
						  48(a)(3)(A)(vi) that qualifies for the low-income community bonus credit under section 48(e) to
						  also qualify for the bonus credit. If the energy storage technology property is not installed in
						  connection with such solar or wind energy property, then skip lines 17d through 17j, and go to 
						  line 17k.
						</div>
						<div class="styLNRightNumBoxNBB" style="height:25mm;background-color:lightgrey;
						 border-right-width:0mm"/>
						<div class="styLNAmountBox" style="height:25mm;width:27mm;border-bottom-width:0px;"/>      
						<div class="styLNRightNumBoxNBB" style="height:25mm;background-color:lightgrey;
						  padding-top:3.5mm;border-left-width:1px;border-right-width:0px;"/>  
						<div class="styLNAmountBox" style="height:25mm;width:27mm;border-left-width:1px;
						  border-bottom-width:0px;"/>
					</div>
					<!-- End Caution -->
					<!-- Start of Line 17d -->
					<div style="28mm;width:187mm;font-size:8pt">
						<div class="styLNLeftNumBox" style="height:4mm;padding-left:4mm;">d</div>
						<div class="styLNDesc" style="height:28mm;width:73mm;padding-left:2mm">
						 If you checked the box in Part I, line 11a or 11b, enter 10%. If you checked the box in Part I, line
						 11c or 11d, enter 20%. However, if you checked the box in Part I, line 11g; or Part I, line 12a(ii) 
						 or 12b, is 5 MW ac or more (in relation to line 11a, 11b, 11c, or 11d), you don’t qualify for the
						 bonus credit. In that situation, enter 0% here, go to line 17j and enter -0-, and then go to line 
						 17k
						  <!--Dotted Line-->
							<!--<span class="styDotLn" style="float:right;">......</span>-->
						</div>
						<div class="styLNRightNumBox" style="height:28mm;padding-top:24mm">17d</div>
						<div class="styLNAmountBox" style="height:28mm;width:27mm;padding-top:24mm;font-size:8pt;
						  border-bottom-width:0px">
							<xsl:call-template name="PopulateAmount">
							  <xsl:with-param name="TargetNode" 
							   select="$Form3468Data/EnergyStorageTechPropCrGrp/LowIncmSolarWindBonusCrPct"/>
							</xsl:call-template>%
						</div>
						<div class="styLNRightNumBoxNBB" style="height:28mm;background-color:lightgrey;
						 border-right-width:0mm"/>
						<div class="styLNAmountBox" style="height:28mm;width:27mm;border-bottom-width:0px;"/>      
						<div class="styLNRightNumBoxNBB" style="height:28mm;background-color:lightgrey;
						 border-left-width:1px;border-right-width:0px;"/>  
						<div class="styLNAmountBox" style="height:28mm;width:27mm;border-left-width:1px;
						  border-bottom-width:0px;"/>
					</div>
					<!-- End of 17d -->
					<!-- Start of Line 17e -->
					<div style="14mm;width:187mm;font-size:8pt">
						<div class="styLNLeftNumBox" style="height:4mm;padding-left:4mm;">e</div>
						<div class="styLNDesc" style="height:14mm;width:73mm;padding-left:2mm">
						 Enter the amount of capacity limitation you were allocated in the allocation letter for the solar or 
						 wind energy property in connection with the energy storage technology
						  <!--Dotted Line-->
							<span class="styDotLn" style="float:right;">........</span>
						</div>
						<div class="styLNRightNumBox" style="height:14mm;padding-top:10.5mm">17e</div>
						<div class="styLNAmountBox" style="height:14mm;width:45mm;padding-top:10.5mm;font-size:7pt;
						  border-top-width:1px">
							<xsl:call-template name="PopulateAmount">
							  <xsl:with-param name="TargetNode" 
							   select="$Form3468Data/EnergyStorageTechPropCrGrp/AllocLmtEnergyCapKWQty"/>
							</xsl:call-template>kW
						</div>
						<!--<div class="styLNRightNumBoxNBB" style="height:14mm;background-color:lightgrey;
						 border-right-width:0mm"/>-->
						<div class="styLNAmountBoxNBB" style="height:14mm;width:17mm;"/>      
						<div class="styLNRightNumBoxNBB" style="height:14mm;background-color:lightgrey;
						 border-left-width:1px;border-right-width:0px;"/>  
						<div class="styLNAmountBox" style="height:14mm;width:22mm;border-left-width:1px;
						  border-bottom-width:0px;"/>
					</div>
					<!-- End of 17e -->
					<!-- Start of Line 17f -->
					<div style="14mm;width:187mm;font-size:8pt">
						<div class="styLNLeftNumBox" style="height:4mm;padding-left:4mm;">f</div>
						<div class="styLNDesc" style="height:14mm;width:73mm;padding-left:2mm">
						 If the relevant entry on Part I, line 12a(i) or 12b, equals the entry on line 17e, multiply line 17a
						 by line 17d and go to line 17j. Otherwise, continue to line 17g
						  <!--Dotted Line-->
							<span class="styDotLn" style="float:right;">.............</span>
						</div>
						<div class="styLNRightNumBox" style="height:14mm;padding-top:10.5mm">17f</div>
						<div class="styLNAmountBox" style="height:14mm;width:27mm;padding-top:10.5mm;font-size:8pt">
							<xsl:call-template name="PopulateAmount">
							  <xsl:with-param name="TargetNode" 
							   select="$Form3468Data/EnergyStorageTechPropCrGrp/LowIncmComFullBonusCrAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBoxNBB" style="height:14mm;background-color:lightgrey;
						 border-right-width:0mm"/>
						<div class="styLNAmountBox" style="height:14mm;width:27mm;border-bottom-width:0px;"/>      
						<div class="styLNRightNumBoxNBB" style="height:14mm;background-color:lightgrey;
						 border-left-width:1px;border-right-width:0px;"/>  
						<div class="styLNAmountBox" style="height:14mm;width:27mm;border-left-width:1px;
						  border-bottom-width:0px;"/>
					</div>
					<!-- End of 17f -->
					<!-- Start of Line 17g -->
					<div style="height:11mm;width:187mm;font-size:8pt;">
						<div class="styLNLeftNumBox" style="height:4mm;padding-left:4mm;">g</div>
						<div class="styLNDesc" style="height:11mm;width:73mm;padding-left:2mm">
						 If the relevant entry on Part I, line 12a(i) or 12b, is more than the entry on line 17e, divide line
						 17e by Part I, line 12a(i) or 12b
						  <!--Dotted Line-->
							<span class="styDotLn" style="float:right;">......</span>
						</div>
						<div class="styLNRightNumBox" style="height:11mm;padding-top:7.5mm">17g</div>
						<div class="styLNAmountBox" style="height:11mm;width:27mm;padding-top:7mm;font-size:8pt">
							<xsl:call-template name="PopulateAmount">
							  <xsl:with-param name="TargetNode" 
							   select="$Form3468Data/EnergyStorageTechPropCrGrp/LowIncmComAllocRedFctrRt"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBoxNBB" style="height:11mm;background-color:lightgrey;
						 border-right-width:0mm"/>
						<div class="styLNAmountBox" style="height:11mm;width:27mm;border-bottom-width:0px;"/>      
						<div class="styLNRightNumBoxNBB" style="height:11mm;background-color:lightgrey;
						 border-left-width:1px;border-right-width:0px;"/>  
						<div class="styLNAmountBox" style="height:11mm;width:27mm;border-left-width:1px;
						  border-bottom-width:0px;"/>
					</div>
					<!-- End of 17g -->
					<!-- Start of Line 17h -->
					<div style="4mm;width:187mm;font-size:8pt">
						<div class="styLNLeftNumBox" style="height:4mm;padding-left:4mm;">h</div>
						<div class="styLNDesc" style="height:4mm;width:73mm;padding-left:2mm">
						 Multiply line 17d by line 17g
						  <!--Dotted Line-->
							<span class="styDotLn" style="float:right;">.......</span>
						</div>
						<div class="styLNRightNumBox" style="height:4mm;padding-top:.5mm">17h</div>
						<div class="styLNAmountBox" style="height:4mm;width:27mm;padding-top:.5mm;font-size:8pt">
							<xsl:call-template name="PopulateAmount">
							  <xsl:with-param name="TargetNode" 
							   select="$Form3468Data/EnergyStorageTechPropCrGrp/LowIncmComPctRedFctrRt"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBoxNBB" style="height:4mm;background-color:lightgrey;
						 border-right-width:0mm"/>
						<div class="styLNAmountBox" style="height:4mm;width:27mm;border-bottom-width:0px;"/>      
						<div class="styLNRightNumBoxNBB" style="height:4mm;background-color:lightgrey;
						 border-left-width:1px;border-right-width:0px;"/>  
						<div class="styLNAmountBox" style="height:4mm;width:27mm;border-left-width:1px;
						  border-bottom-width:0px;"/>
					</div>
					<!-- End of 17h -->
					<!-- Start of Line 17i -->
					<div style="4mm;width:187mm;font-size:8pt">
						<div class="styLNLeftNumBox" style="height:4mm;padding-left:4mm;">i</div>
						<div class="styLNDesc" style="height:4mm;width:73mm;padding-left:2mm">
						 Multiply line 17a by line 17h
						  <!--Dotted Line-->
							<span class="styDotLn" style="float:right;">.......</span>
						</div>
						<div class="styLNRightNumBox" style="height:4mm;padding-top:.5mm">17i</div>
						<div class="styLNAmountBox" style="height:4mm;width:27mm;padding-top:.5mm;font-size:8pt">
							<xsl:call-template name="PopulateAmount">
							  <xsl:with-param name="TargetNode" 
							   select="$Form3468Data/EnergyStorageTechPropCrGrp/LowIncmComRedFctrCrAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBoxNBB" style="height:4mm;background-color:lightgrey;
						 border-right-width:0mm"/>
						<div class="styLNAmountBox" style="height:4mm;width:27mm;border-bottom-width:0px;"/>      
						<div class="styLNRightNumBoxNBB" style="height:4mm;background-color:lightgrey;
						 border-left-width:1px;border-right-width:0px;"/>  
						<div class="styLNAmountBox" style="height:4mm;width:27mm;border-left-width:1px;
						  border-bottom-width:0px;"/>
					</div>
					<!-- End of 17i -->
					<!-- Line 17j -->
					<div style="height:14mm;width:187mm;font-size:8pt">
						<div class="styLNLeftNumBox" style="height:4mm;padding-top:.5mm;padding-left:4mm">j</div>
						<div class="styLNDesc" style="height:14mm;width:108mm;padding-top:.5mm;padding-left:2mm;">
						  If the entry for the solar or wind energy property in connection with the energy storage technology 
						  on Part I, line 12a(i) or 12b, is more than the entry on line 17e, enter the amount from line 17i. 
						  Otherwise, enter the amount from line 17f
						  <!--Dotted Line-->
						  <span class="styDotLn" style="float:right;">..................</span>
						</div>
						<div class="styLNRightNumBox" style="height:14mm;padding-top:10.5mm;border-bottom-width:0px;">17j
						</div>
						<div class="styLNAmountBox" style="height:14mm;width:27mm;padding-top:10.5mm;">
						  <xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" 
							 select="$Form3468Data/EnergyStorageTechPropCrGrp/CalcLowIncmSolarWindBonusCrAmt"/>
						  </xsl:call-template>
						</div>
						 <div class="styLNRightNumBoxNBB" style="height:14mm;background-color:lightgrey;"/>
						 <div class="styLNAmountBox" style="height:14mm;width:27mm;border-left-width:1px;
						  border-bottom-width:0px;"/>  
					</div>
					<!-- End of 17j -->
					<!-- Start of Line 17k -->
					<div style="height:11mm;width:187mm;font-size:8pt">
						<div class="styLNLeftNumBox" style="height:4mm;padding-left:4mm">k</div>
						<div class="styLNDesc" style="height:11mm;width:73mm;padding-left:2mm">
						 If you checked the box in Part I, line 9a, enter 10%. If you checked the box in Part I, line 9b, 
						  enter 2%. Otherwise, go to line 17m
						  <!--Dotted Line-->
						  <span class="styDotLn" style="float:right;">....</span>
						</div>
						<div class="styLNRightNumBox" style="height:11mm;padding-top:7mm;">17k</div>
						<div class="styLNAmountBox" style="height:11mm;width:27mm;padding-top:7.5mm;font-size:8pt">
							<xsl:call-template name="PopulateAmount">
							  <xsl:with-param name="TargetNode" 
							   select="$Form3468Data/EnergyStorageTechPropCrGrp/DomContentBonusCreditPct"/>
							</xsl:call-template>%
						</div>
						<div class="styLNRightNumBoxNBB" style="height:11mm;background-color:lightgrey;
						 border-right-width:0mm;border-bottom-width:0px"/>
						<div class="styLNAmountBox" style="height:11mm;width:27mm;border-bottom-width:0px;"/>      
						<div class="styLNRightNumBoxNBB" style="height:11mm;background-color:lightgrey;
						  border-left-width:1px;border-right-width:0px;"/>  
						<div class="styLNAmountBox" style="height:11mm;width:27mm;border-left-width:1px;
						  border-bottom-width:0px;"/>
					</div>
					<!-- End of 17k -->
					<!-- Line 17l -->
					<div style="height:4mm;width:187mm;font-size:8pt">
						<div class="styLNLeftNumBox" style="height:4mm;padding-top:.5mm;padding-left:4mm">l</div>
						<div class="styLNDesc" style="height:4mm;width:108mm;padding-top:0mm;padding-left:2mm;">
						  Multiply line 17a by line 17k
						  <!--Dotted Line-->
						  <span class="styDotLn" style="float:right;">................</span>
						</div>
						<div class="styLNRightNumBox" style="height:4mm;padding-top:.5mm;">17l</div>
						<div class="styLNAmountBox" style="height:4mm;width:27mm;padding-top:.5mm;">
						  <xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" 
							 select="$Form3468Data/EnergyStorageTechPropCrGrp/CalcDomContentBonusCreditAmt"/>
						  </xsl:call-template>
						</div>
						 <div class="styLNRightNumBoxNBB" style="height:4mm;background-color:lightgrey;"/>
						 <div class="styLNAmountBox" style="height:4mm;width:27mm;border-left-width:1px;
						  border-bottom-width:0px;"/>  
					</div>
					<!-- End of 17l -->
					<!-- Start of Line 17m -->
					<div style="height:11mm;width:187mm;font-size:8pt">
						<div class="styLNLeftNumBox" style="height:4mm;padding-left:4mm">m</div>
						<div class="styLNDesc" style="height:11mm;width:73mm;padding-left:2mm">
						 If you checked the box in Part I, line 10a, enter 10%. If you checked the box in Part I, line 10b,
						  enter 2%. Otherwise, go to line 18
						  <!--Dotted Line-->
						  <span class="styDotLn" style="float:right;">.....</span>
						</div>
						<div class="styLNRightNumBox" style="height:11mm;padding-top:7.5mm;">17m</div>
						<div class="styLNAmountBox" style="height:11mm;width:27mm;padding-top:7.5mm;font-size:8pt;">
							<xsl:call-template name="PopulateAmount">
							  <xsl:with-param name="TargetNode" 
							   select="$Form3468Data/EnergyStorageTechPropCrGrp/EnergyComBonusCreditPct"/>
							</xsl:call-template>%
						</div>
						<div class="styLNRightNumBoxNBB" style="height:11mm;background-color:lightgrey;
						 border-right-width:0mm;border-bottom-width:0px"/>
						<div class="styLNAmountBox" style="height:11mm;width:27mm;border-bottom-width:0px;"/>      
						<div class="styLNRightNumBoxNBB" style="height:11mm;background-color:lightgrey;
						  border-left-width:1px;border-right-width:0px;"/>  
						<div class="styLNAmountBox" style="height:11mm;width:27mm;border-left-width:1px;
						  border-bottom-width:0px;"/>
					</div>
					<!-- End of 17m -->
					<!-- Line 17n -->
					<div style="height:4mm;width:187mm;font-size:8pt">
						<div class="styLNLeftNumBox" style="height:4mm;padding-top:1.5mm;padding-left:4mm">n</div>
						<div class="styLNDesc" style="height:4mm;width:108mm;padding-top:1.5mm;padding-left:2mm;">
						  Multiply line 17a by line 17m
						  <!--Dotted Line-->
						  <span class="styDotLn" style="float:right;">...............</span>
						</div>
						<div class="styLNRightNumBox" style="height:5mm;padding-top:1.5mm;">17n</div>
						<div class="styLNAmountBox" style="height:5mm;width:27mm;padding-top:1.5mm;">
						  <xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" 
							 select="$Form3468Data/EnergyStorageTechPropCrGrp/CalcEnergyComBonusCreditAmt"/>
						  </xsl:call-template>
						</div>
						 <div class="styLNRightNumBoxNBB" style="height:4mm;background-color:lightgrey;"/>
						 <div class="styLNAmountBox" style="height:4mm;width:27mm;border-left-width:1px;
						  border-bottom-width:0px;"/>  
					</div>
					<!-- End of 17n -->
					<!--Line 18 -->
					<div style="height:7.5mm;width:187mm;font-size:8pt">
						<div class="styLNLeftNumBox" style="height:7.5mm;padding-top:3.5mm;padding-left:0mm">18</div>
						<div class="styLNDesc" style="width:143mm;height:7.5mm;padding-top:4mm;padding-left:2mm;">
						  Add lines 17c, 17j, 17l, and 17n
							<!--Dotted Line-->
							<div class="styDotLn" style="float:none;">.....................</div>						  
						</div>
						<div class="styLNRightNumBoxNBB" style="height:7.5mm;padding-top:4.5mm">18</div>
						<div class="styLNAmountBox" style="height:7.5mm;width:27mm;padding-top:4mm;border-left-width:1px;
						 border-bottom-width:0px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" 
								select="$Form3468Data/EnergyStorageTechPropCrGrp/TotalEnergyStorTechPropCrAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- End of 18 -->
					<!-- Part VI Section J -->
					<div class="styBB" style="width:187mm;border-top-width:1px;">
						<div class="styPartDesc" style="width:170mm; height:auto; font-weight:normal;font-size:9pt;
						 padding-left:0mm;padding-top:1mm"><b>Section J—Qualified Biogas Property</b> 
						  (see instructions)
						</div>
					</div>
					<!-- Start of Line 19a -->
					<div style="height:7.5mm;width:187mm;font-size:8pt">
						<div class="styLNLeftNumBox" style="height:4mm;padding-left:0mm">19a</div>
						<div class="styLNDesc" style="height:7.5mm;width:73mm;padding-left:2mm">
						 Enter the basis of property using biogas placed in service during the tax year
						  <!--Dotted Line-->
						  <span class="styDotLn" style="float:right;">.......</span>
						</div>
						<div class="styLNRightNumBox" style="height:7.5mm;padding-top:4mm;">19a</div>
						<div class="styLNAmountBox" style="height:7.5mm;width:27mm;padding-top:3.5mm;font-size:8pt">
							<xsl:call-template name="PopulateAmount">
							  <xsl:with-param name="TargetNode" 
							   select="$Form3468Data/QualifiedBiogasPropertyCrGrp/QualifiedBiogasPropBasisAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBoxNBB" style="height:7.5mm;background-color:lightgrey;
						 border-right-width:0mm;border-bottom-width:0px"/>
						<div class="styLNAmountBox" style="height:7.5mm;width:27mm;border-bottom-width:0px;"/>      
						<div class="styLNRightNumBoxNBB" style="height:7.5mm;background-color:lightgrey;
						  border-left-width:1px;border-right-width:0px;"/>  
						<div class="styLNAmountBox" style="height:7.5mm;width:27mm;border-left-width:1px;
						  border-bottom-width:0px;"/>
					</div>
					<!-- End of 19a -->
					<!-- Start of Line 19b -->
					<div style="height:7.5mm;width:187mm;font-size:8pt">
						<div class="styLNLeftNumBox" style="height:4mm;padding-left:4mm">b</div>
						<div class="styLNDesc" style="height:7.5mm;width:73mm;padding-left:2mm">
						 If you checked the box in Part I, line 7a or 8b, enter 30%. Otherwise, enter 6%
						  <!--Dotted Line-->
						  <span class="styDotLn" style="float:right;">.....</span>
						</div>
						<div class="styLNRightNumBox" style="height:7.5mm;padding-top:4mm;">19b</div>
						<div class="styLNAmountBox" style="height:7.5mm;width:27mm;padding-top:4mm;font-size:8pt">
							<xsl:call-template name="PopulateAmount">
							  <xsl:with-param name="TargetNode" 
							   select="$Form3468Data/QualifiedBiogasPropertyCrGrp/NetOutLss1MWACOrStsfdWgReqPct"/>
							</xsl:call-template>%
						</div>
						<div class="styLNRightNumBoxNBB" style="height:7.5mm;background-color:lightgrey;
						 border-right-width:0mm;border-bottom-width:0px"/>
						<div class="styLNAmountBox" style="height:7.5mm;width:27mm;border-bottom-width:0px;"/>      
						<div class="styLNRightNumBoxNBB" style="height:7.5mm;background-color:lightgrey;
						  border-left-width:1px;border-right-width:0px;"/>  
						<div class="styLNAmountBox" style="height:7.5mm;width:27mm;border-left-width:1px;
						  border-bottom-width:0px;"/>
					</div>
					<!-- End of 19b -->
					<!-- Line 19c -->
					<div style="height:4mm;width:187mm;font-size:8pt">
						<div class="styLNLeftNumBox" style="height:4mm;padding-top:.3mm;padding-left:4mm">c</div>
						<div class="styLNDesc" style="height:5mm;width:108mm;padding-top:1mm;padding-left:2mm;">
						  Multiply line 19a by line 19b
						  <!--Dotted Line-->
						  <span class="styDotLn" style="float:right;">................</span>
						</div>
						<div class="styLNRightNumBox" style="height:5mm;padding-top:1mm;">19c</div>
						<div class="styLNAmountBox" style="height:4.5mm;width:27mm;padding-top:1mm;">
						  <xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" 
							 select="$Form3468Data/QualifiedBiogasPropertyCrGrp/CalcQlfyBiogasPropBasisAmt"/>
						  </xsl:call-template>
						</div>
						 <div class="styLNRightNumBoxNBB" style="height:4mm;background-color:lightgrey;"/>
						 <div class="styLNAmountBox" style="height:4mm;width:27mm;border-left-width:1px;
						  border-bottom-width:0px;"/>  
					</div>
					<!-- End of 19c -->
					<!-- Start of Line 19d -->
					<div style="height:11mm;width:187mm;font-size:8pt">
						<div class="styLNLeftNumBox" style="height:4mm;padding-left:4mm">d</div>
						<div class="styLNDesc" style="height:11mm;width:73mm;padding-left:2mm">
						 If you checked the box in Part I, line 9a, enter 10%. If you checked the box in Part I, line 9b, 
						  enter 2%. Otherwise, go to line 19f
						  <!--Dotted Line-->
						  <span class="styDotLn" style="float:right;">....</span>
						</div>
						<div class="styLNRightNumBox" style="height:11mm;padding-top:7.5mm;">19d</div>
						<div class="styLNAmountBox" style="height:11mm;width:27mm;padding-top:7.5mm;font-size:8pt">
							<xsl:call-template name="PopulateAmount">
							  <xsl:with-param name="TargetNode" 
							   select="$Form3468Data/QualifiedBiogasPropertyCrGrp/DomContentBonusCreditPct"/>
							</xsl:call-template>%
						</div>
						<div class="styLNRightNumBoxNBB" style="height:11mm;background-color:lightgrey;
						 border-right-width:0mm;border-bottom-width:0px"/>
						<div class="styLNAmountBox" style="height:11mm;width:27mm;border-bottom-width:0px;"/>      
						<div class="styLNRightNumBoxNBB" style="height:11mm;background-color:lightgrey;
						  border-left-width:1px;border-right-width:0px;"/>  
						<div class="styLNAmountBox" style="height:11mm;width:27mm;border-left-width:1px;
						  border-bottom-width:0px;"/>
					</div>
					<!-- End of 19d -->
					<!-- Line 19e -->
					<div style="height:4mm;width:187mm;font-size:8pt">
						<div class="styLNLeftNumBox" style="height:4mm;padding-top:.5mm;padding-left:4mm">e</div>
						<div class="styLNDesc" style="height:4mm;width:108mm;padding-top:0mm;padding-left:2mm;">
						  Multiply line 19a by line 19d
						  <!--Dotted Line-->
						  <span class="styDotLn" style="float:right;">................</span>
						</div>
						<div class="styLNRightNumBox" style="height:4mm;padding-top:.5mm;">19e</div>
						<div class="styLNAmountBox" style="height:4mm;width:27mm;padding-top:.5mm;">
						  <xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" 
							 select="$Form3468Data/QualifiedBiogasPropertyCrGrp/CalcDomContentBonusCreditAmt"/>
						  </xsl:call-template>
						</div>
						 <div class="styLNRightNumBoxNBB" style="height:4mm;background-color:lightgrey;"/>
						 <div class="styLNAmountBox" style="height:4mm;width:27mm;border-left-width:1px;
						  border-bottom-width:0px;"/>  
					</div>
					<!-- End of 19e -->
					<!-- Start of Line 19f -->
					<div style="height:14mm;width:187mm;font-size:8pt">
						<div class="styLNLeftNumBox" style="height:4mm;padding-left:4mm">f</div>
						<div class="styLNDesc" style="height:14mm;width:73mm;padding-left:2mm">
						 If you checked the box in Part I, line 10a, enter 10%. If you checked the box in Part I, line 10b,
						  enter 2%. Otherwise, go to line 20
						  <!--Dotted Line-->
						  <span class="styDotLn" style="float:right;">.....</span>
						</div>
						<div class="styLNRightNumBox" style="height:14mm;padding-top:10.5mm;">19f</div>
						<div class="styLNAmountBox" style="height:14mm;width:27mm;padding-top:10.5mm;font-size:8pt;">
							<xsl:call-template name="PopulateAmount">
							  <xsl:with-param name="TargetNode" 
							   select="$Form3468Data/QualifiedBiogasPropertyCrGrp/EnergyComBonusCreditPct"/>
							</xsl:call-template>%
						</div>
						<div class="styLNRightNumBoxNBB" style="height:14mm;background-color:lightgrey;
						 border-right-width:0mm;border-bottom-width:0px"/>
						<div class="styLNAmountBox" style="height:14mm;width:27mm;border-bottom-width:0px;"/>      
						<div class="styLNRightNumBoxNBB" style="height:14mm;background-color:lightgrey;
						  border-left-width:1px;border-right-width:0px;"/>  
						<div class="styLNAmountBox" style="height:14mm;width:27mm;border-left-width:1px;
						  border-bottom-width:0px;"/>
					</div>
					<!-- End of 19f -->
					<!-- Line 19g -->
					<div style="height:4mm;width:187mm;font-size:8pt">
						<div class="styLNLeftNumBox" style="height:4mm;padding-top:.5mm;padding-left:4mm">g</div>
						<div class="styLNDesc" style="height:4mm;width:108mm;padding-top:0mm;padding-left:2mm;">
						  Multiply line 19a by line 19f
						  <!--Dotted Line-->
						  <span class="styDotLn" style="float:right;">...............</span>
						</div>
						<div class="styLNRightNumBox" style="height:4mm;padding-top:.5mm;">19g</div>
						<div class="styLNAmountBox" style="height:4mm;width:27mm;padding-top:.5mm;">
						  <xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" 
							 select="$Form3468Data/QualifiedBiogasPropertyCrGrp/CalcEnergyComBonusCreditAmt"/>
						  </xsl:call-template>
						</div>
						 <div class="styLNRightNumBoxNBB" style="height:4mm;background-color:lightgrey;"/>
						 <div class="styLNAmountBox" style="height:4mm;width:27mm;border-left-width:1px;
						  border-bottom-width:0px;"/>  
					</div>
					<!-- End of 19g -->
					<!--Line 20 -->
					<div style="height:7.5mm;width:187mm;font-size:8pt">
						<div class="styLNLeftNumBox" style="height:7.5mm;padding-top:3.5mm;padding-left:0mm">20</div>
						<div class="styLNDesc" style="width:143mm;height:7.5mm;padding-top:4mm;padding-left:2mm;">
						  Add lines 19c, 19e, and 19g
							<!--Dotted Line-->
							<div class="styDotLn" style="float:none;">........................</div>						  
						</div>
						<div class="styLNRightNumBoxNBB" style="height:7.5mm;padding-top:4.3mm">20</div>
						<div class="styLNAmountBox" style="height:7.5mm;width:27mm;padding-top:4.3mm;border-left-width:1px;
						 border-bottom-width:0px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" 
								select="$Form3468Data/QualifiedBiogasPropertyCrGrp/TotalQualifiedBiogasPropCrAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- End of 20 -->
						<!-- Page Break and Footer-->
					<div class="styBB" style="width:187mm;clear:both;padding-top:0.4mm;border-top-width:2px;
					 border-bottom-width:0px">
						<!--<div style="width:90mm;font-weight:bold;font-size:7pt" class="styGenericDiv">For Paperwork 
						 Reduction Act Notice, see separate instructions.</div>
						<div style="width:55mm;text-align:center;" class="styGenericDiv">Cat. No. 12276E</div>-->
						<div style="float:right;" class="styGenericDiv">Form <span class="styBoldText">3468</span> (2025)
						</div>
					</div>
					<br/>
					<div class="pageEnd"/>
					<div style="page-break-after:always"/>
					<!-- End Footer -->
					<!-- Header -->
					<div style="width:187mm;padding-top:1mm;float:left">
					  Form 3468 (2025)
						<span style="width:15mm;float:right;">Page 
							<span class="styBoldText" style="font-size:8pt;">10</span>
						</span>
					</div>
					<!-- End Header -->
					<!-- Start of Part VI cont. -->
					<div class="styBB" style="width:187mm;border-top-width:1px;">
						<div class="styPartName" style="height:5mm;width:15mm;font-size:8pt;padding-top:1mm;">Part VI
						</div>
						<div class="styPartDesc" style="height:auto;width:170mm;font-weight:normal;font-size:9pt;
						 padding-left:2mm;padding-top:1mm">
						 <b>Energy Credit Under Section 48</b><i> (continued)</i>
						</div>
					</div>
					<!-- Part VI Section K -->
					<div class="styBB" style="width:187mm;border-top-width:1px;">
						<div class="styPartDesc" style="width:170mm; height:auto; font-weight:normal;font-size:9pt;
						 padding-left:0mm;padding-top:1mm"><b>Section K—Microgrid Controllers Property</b> 
						  (see instructions)
						</div>
					</div>
					<!-- Start of Line 21a -->
					<div style="height:7.5mm;width:187mm;font-size:8pt">
						<div class="styLNLeftNumBox" style="height:4mm;padding-left:0mm">21a</div>
						<div class="styLNDesc" style="height:7.5mm;width:73mm;padding-left:2mm">
						 Enter the basis of property using microgrid controllers placed in service during the tax year
						  <!--Dotted Line-->
						  <!--<span class="styDotLn" style="float:right;">.......</span>-->
						</div>
						<div class="styLNRightNumBox" style="height:7.5mm;padding-top:4mm;">21a</div>
						<div class="styLNAmountBox" style="height:7.5mm;width:27mm;padding-top:4mm;font-size:8pt">
							<xsl:call-template name="PopulateAmount">
							  <xsl:with-param name="TargetNode" 
							   select="$Form3468Data/MicrogridControllersPropCrGrp/MicrogridControllersPropBssAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBoxNBB" style="height:7.5mm;background-color:lightgrey;
						 border-right-width:0mm;border-bottom-width:0px"/>
						<div class="styLNAmountBox" style="height:7.5mm;width:27mm;border-bottom-width:0px;"/>      
						<div class="styLNRightNumBoxNBB" style="height:7.5mm;background-color:lightgrey;
						  border-left-width:1px;border-right-width:0px;"/>  
						<div class="styLNAmountBox" style="height:7.5mm;width:27mm;border-left-width:1px;
						  border-bottom-width:0px;"/>
					</div>
					<!-- End of 21a -->
					<!-- Start of Line 21b -->
					<div style="height:7.5mm;width:187mm;font-size:8pt">
						<div class="styLNLeftNumBox" style="height:4mm;padding-left:4mm">b</div>
						<div class="styLNDesc" style="height:7.5mm;width:73mm;padding-left:2mm">
						 If you checked the box in Part I, line 7a or 8b, enter 
						 30%. Otherwise, enter 6%
						  <!--Dotted Line-->
						  <span class="styDotLn" style="float:right;">.....</span>
						</div>
						<div class="styLNRightNumBox" style="height:7.5mm;padding-top:4mm;">21b</div>
						<div class="styLNAmountBox" style="height:7.5mm;width:27mm;padding-top:4mm;font-size:8pt">
							<xsl:call-template name="PopulateAmount">
							  <xsl:with-param name="TargetNode" 
							   select="$Form3468Data/MicrogridControllersPropCrGrp/NetOutLss1MWACOrStsfdWgReqPct"/>
							</xsl:call-template>%
						</div>
						<div class="styLNRightNumBoxNBB" style="height:7.5mm;background-color:lightgrey;
						 border-right-width:0mm;border-bottom-width:0px"/>
						<div class="styLNAmountBox" style="height:7.5mm;width:27mm;border-bottom-width:0px;"/>      
						<div class="styLNRightNumBoxNBB" style="height:7.5mm;background-color:lightgrey;
						  border-left-width:1px;border-right-width:0px;"/>  
						<div class="styLNAmountBox" style="height:7.5mm;width:27mm;border-left-width:1px;
						  border-bottom-width:0px;"/>
					</div>
					<!-- End of 21b -->
					<!-- Line 21c -->
					<div style="height:4mm;width:187mm;font-size:8pt">
						<div class="styLNLeftNumBox" style="height:4mm;padding-top:.5mm;padding-left:4mm">c</div>
						<div class="styLNDesc" style="height:4mm;width:108mm;padding-top:0mm;padding-left:2mm;">
						  Multiply line 21a by line 21b
						  <!--Dotted Line-->
						  <span class="styDotLn" style="float:right;">................</span>
						</div>
						<div class="styLNRightNumBox" style="height:4mm;padding-top:.5mm;">21c</div>
						<div class="styLNAmountBox" style="height:4mm;width:27mm;padding-top:.5mm;">
						  <xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" 
							 select="$Form3468Data/MicrogridControllersPropCrGrp/CalcMicrogridControllersBssAmt"/>
						  </xsl:call-template>
						</div>
						 <div class="styLNRightNumBoxNBB" style="height:4mm;background-color:lightgrey;"/>
						 <div class="styLNAmountBox" style="height:4mm;width:27mm;border-left-width:1px;
						  border-bottom-width:0px;"/>  
					</div>
					<!-- End of 21c -->
					<!-- Start of Line 21d -->
					<div style="height:11mm;width:187mm;font-size:8pt">
						<div class="styLNLeftNumBox" style="height:4mm;padding-left:4mm">d</div>
						<div class="styLNDesc" style="height:11mm;width:73mm;padding-left:2mm">
						 If you checked the box in Part I, line 9a, enter 10%. If you checked the box in Part I, line 9b,
						  enter 2%. Otherwise, go to line 21f
						  <!--Dotted Line-->
						  <span class="styDotLn" style="float:right;">....</span>
						</div>
						<div class="styLNRightNumBox" style="height:11mm;padding-top:7.5mm;">21d</div>
						<div class="styLNAmountBox" style="height:11mm;width:27mm;padding-top:7.5mm;font-size:8pt">
							<xsl:call-template name="PopulateAmount">
							  <xsl:with-param name="TargetNode" 
							   select="$Form3468Data/MicrogridControllersPropCrGrp/DomContentBonusCreditPct"/>
							</xsl:call-template>%
						</div>
						<div class="styLNRightNumBoxNBB" style="height:11mm;background-color:lightgrey;
						 border-right-width:0mm;border-bottom-width:0px"/>
						<div class="styLNAmountBox" style="height:11mm;width:27mm;border-bottom-width:0px;"/>      
						<div class="styLNRightNumBoxNBB" style="height:11mm;background-color:lightgrey;
						  border-left-width:1px;border-right-width:0px;"/>  
						<div class="styLNAmountBox" style="height:11mm;width:27mm;border-left-width:1px;
						  border-bottom-width:0px;"/>
					</div>
					<!-- End of 21d -->
					<!-- Line 21e -->
					<div style="height:4mm;width:187mm;font-size:8pt">
						<div class="styLNLeftNumBox" style="height:4mm;padding-top:.5mm;padding-left:4mm">e</div>
						<div class="styLNDesc" style="height:4mm;width:108mm;padding-top:.5mm;padding-left:2mm;">
						  Multiply line 21a by line 21d
						  <!--Dotted Line-->
						  <span class="styDotLn" style="float:right;">................</span>
						</div>
						<div class="styLNRightNumBox" style="height:4mm;padding-top:.5mm;">21e</div>
						<div class="styLNAmountBox" style="height:4mm;width:27mm;padding-top:.5mm;">
						  <xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" 
							 select="$Form3468Data/MicrogridControllersPropCrGrp/CalcDomContentBonusCreditAmt"/>
						  </xsl:call-template>
						</div>
						 <div class="styLNRightNumBoxNBB" style="height:4mm;background-color:lightgrey;"/>
						 <div class="styLNAmountBox" style="height:4mm;width:27mm;border-left-width:1px;
						  border-bottom-width:0px;"/>  
					</div>
					<!-- End of 21e -->
					<!-- Start of Line 21f -->
					<div style="height:11mm;width:187mm;font-size:8pt">
						<div class="styLNLeftNumBox" style="height:4mm;padding-left:4mm">f</div>
						<div class="styLNDesc" style="height:11mm;width:73mm;padding-left:2mm">
						 If you checked the box in Part I, line 10a, enter 10%. If you checked the box in Part I, line 10b,
						  enter 2%. Otherwise, go to line 22
						  <!--Dotted Line-->
						  <span class="styDotLn" style="float:right;">.....</span>
						</div>
						<div class="styLNRightNumBox" style="height:11mm;padding-top:7.5mm;">21f</div>
						<div class="styLNAmountBox" style="height:11mm;width:27mm;padding-top:7.5mm;font-size:8pt;">
							<xsl:call-template name="PopulateAmount">
							  <xsl:with-param name="TargetNode" 
							   select="$Form3468Data/MicrogridControllersPropCrGrp/EnergyComBonusCreditPct"/>
							</xsl:call-template>%
						</div>
						<div class="styLNRightNumBoxNBB" style="height:11mm;background-color:lightgrey;
						 border-right-width:0mm;border-bottom-width:0px"/>
						<div class="styLNAmountBox" style="height:11mm;width:27mm;border-bottom-width:0px;"/>      
						<div class="styLNRightNumBoxNBB" style="height:11mm;background-color:lightgrey;
						  border-left-width:1px;border-right-width:0px;"/>  
						<div class="styLNAmountBox" style="height:11mm;width:27mm;border-left-width:1px;
						  border-bottom-width:0px;"/>
					</div>
					<!-- End of 21f -->
					<!-- Line 21g -->
					<div style="height:4mm;width:187mm;font-size:8pt">
						<div class="styLNLeftNumBox" style="height:4mm;padding-top:.5mm;padding-left:4mm">g</div>
						<div class="styLNDesc" style="height:4mm;width:108mm;padding-top:0mm;padding-left:2mm;">
						  Multiply line 21a by line 21f
						  <!--Dotted Line-->
						  <span class="styDotLn" style="float:right;">...............</span>
						</div>
						<div class="styLNRightNumBox" style="height:4mm;padding-top:.5mm;">21g</div>
						<div class="styLNAmountBox" style="height:4mm;width:27mm;padding-top:.5mm;">
						  <xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" 
							 select="$Form3468Data/MicrogridControllersPropCrGrp/CalcEnergyComBonusCreditAmt"/>
						  </xsl:call-template>
						</div>
						 <div class="styLNRightNumBoxNBB" style="height:4mm;background-color:lightgrey;"/>
						 <div class="styLNAmountBox" style="height:4mm;width:27mm;border-left-width:1px;
						  border-bottom-width:0px;"/>  
					</div>
					<!-- End of 21g -->
					<!--Line 22 -->
					<div style="height:7.5mm;width:187mm;font-size:8pt">
						<div class="styLNLeftNumBox" style="height:7.5mm;padding-top:3.5mm;padding-left:0mm">22</div>
						<div class="styLNDesc" style="width:143mm;height:7.5mm;padding-top:4mm;padding-left:2mm;">
						  Add lines 21c, 21e, and 21g
							<!--Dotted Line-->
							<div class="styDotLn" style="float:none;">........................</div>						  
						</div>
						<div class="styLNRightNumBoxNBB" style="height:7.5mm;padding-top:4.3mm">22</div>
						<div class="styLNAmountBox" style="height:7.5mm;width:27mm;padding-top:4.3mm;border-left-width:1px;
						 border-bottom-width:0px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" 
								select="$Form3468Data/MicrogridControllersPropCrGrp/TotMicrogridControllersPropAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- End of 22 -->
					<!-- Part VI Section L -->
					<div class="styBB" style="width:187mm;border-top-width:1px;">
						<div class="styPartDesc" style="width:170mm; height:auto; font-weight:normal;font-size:9pt;
						 padding-left:0mm;padding-top:1mm"><b>Section L—Qualified Investment Credit Facility Property</b> 
						  (see instructions)
						</div>
					</div>
					<!-- Start of Line 23a -->
					<div style="11mm;width:187mm;font-size:8pt">
						<div class="styLNLeftNumBox" style="height:4mm;padding-left:0mm;">23a</div>
						<div class="styLNDesc" style="height:11mm;width:73mm;padding-left:2mm">
						 Enter the basis of property using investment credit facility property placed in service during the
						  tax year
						  <!--Dotted Line-->
							<span class="styDotLn" style="float:right;">.............</span>
						</div>
						<div class="styLNRightNumBox" style="height:11mm;padding-top:7.5mm">23a</div>
						<div class="styLNAmountBox" style="height:11mm;width:27mm;padding-top:7.5mm;font-size:8pt">
							<xsl:call-template name="PopulateAmount">
							  <xsl:with-param name="TargetNode" 
							   select="$Form3468Data/QlfyInvstCreditFacilityPropGrp/QlfyInvstFcltyPropBasisAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBoxNBB" style="height:11mm;background-color:lightgrey;
						 border-right-width:0mm"/>
						<div class="styLNAmountBox" style="height:11mm;width:27mm;border-bottom-width:0px;"/>      
						<div class="styLNRightNumBoxNBB" style="height:11mm;background-color:lightgrey;
						 border-left-width:1px;border-right-width:0px;"/>  
						<div class="styLNAmountBox" style="height:11mm;width:27mm;border-left-width:1px;
						  border-bottom-width:0px;"/>
					</div>
					<!-- End of 23a -->
					<!-- Start of Line 23b -->
					<div style="7.5mm;width:187mm;font-size:8pt">
						<div class="styLNLeftNumBox" style="height:4mm;padding-left:4mm;">b</div>
						<div class="styLNDesc" style="height:7.5mm;width:73mm;padding-left:2mm;">
						 If you checked the box in Part I, line 7a or 8b, enter 30%. Otherwise, enter 6%
						  <!--Dotted Line-->
							<span class="styDotLn" style="float:right;">.....</span>
						</div>
						<div class="styLNRightNumBox" style="height:7.5mm;padding-top:3.5mm">23b</div>
						<div class="styLNAmountBox" style="height:7.5mm;width:27mm;padding-top:4mm;font-size:8pt">
							<xsl:call-template name="PopulateAmount">
							  <xsl:with-param name="TargetNode" 
							   select="$Form3468Data/QlfyInvstCreditFacilityPropGrp/NetOutLss1MWACOrStsfdWgReqPct"/>
							</xsl:call-template>%
						</div>
						<div class="styLNRightNumBoxNBB" style="height:7.5mm;background-color:lightgrey;
						 border-right-width:0mm"/>
						<div class="styLNAmountBox" style="height:7.5mm;width:27mm;border-bottom-width:0px;"/>      
						<div class="styLNRightNumBoxNBB" style="height:7.5mm;background-color:lightgrey;
						 border-left-width:1px;border-right-width:0px;"/>  
						<div class="styLNAmountBox" style="height:7.5mm;width:27mm;border-left-width:1px;
						  border-bottom-width:0px;"/>
					</div>
					<!-- End of 23b -->
					<!-- Line 23c -->
					<div style="height:4mm;width:187mm;font-size:8pt">
						<div class="styLNLeftNumBox" style="height:4mm;padding-top:.5mm;padding-left:4mm">c</div>
						<div class="styLNDesc" style="height:4mm;width:108mm;padding-top:.5mm;padding-left:2mm;">
						  Multiply line 23a by line 23b
						  <!--Dotted Line-->
						  <span class="styDotLn" style="float:right;">...............</span>
						</div>
						<div class="styLNRightNumBox" style="height:4mm;padding-top:.5mm;border-bottom-width:0px;">23c
						</div>
						<div class="styLNAmountBox" style="height:4mm;width:27mm;padding-top.5mm;">
						  <xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" 
							 select="$Form3468Data/QlfyInvstCreditFacilityPropGrp/CalcQlfyInvstFcltyPropBasisAmt"/>
						  </xsl:call-template>
						</div>
						 <div class="styLNRightNumBoxNBB" style="height:4mm;background-color:lightgrey;"/>
						 <div class="styLNAmountBox" style="height:4mm;width:27mm;border-left-width:1px;
						  border-bottom-width:0px;"/>  
					</div>
					<!-- End of 23c -->
					<!-- Start Caution -->
					<div style="height:14mm;width:187mm;font-size:8pt">
						<div class="styLNDesc" style="height:14mm;width:116mm;padding-left:2mm">
						 <b>Caution:</b> For property other than that described under section 45(d)(1), the property
						  does not qualify for the wind facility in connection with low-income community bonus
						  credit under section 48(e). Skip lines 23d through 23j, and go to line 23k.
						</div>
						<div class="styLNRightNumBoxNBB" style="height:14mm;background-color:lightgrey;
						 border-right-width:0mm"/>
						<div class="styLNAmountBox" style="height:14mm;width:27mm;border-bottom-width:0px;"/>      
						<div class="styLNRightNumBoxNBB" style="height:14mm;background-color:lightgrey;
						  padding-top:3.5mm;border-left-width:1px;border-right-width:0px;"/>  
						<div class="styLNAmountBox" style="height:14mm;width:27mm;border-left-width:1px;
						  border-bottom-width:0px;"/>
					</div>
					<!-- End Caution -->
					<!-- Start of Line 23d -->
					<div style="28mm;width:187mm;font-size:8pt">
						<div class="styLNLeftNumBox" style="height:4mm;padding-left:4mm;">d</div>
						<div class="styLNDesc" style="height:28mm;width:73mm;padding-left:2mm">
						 If you checked the box in Part I, line 11a or 11b, enter 10%. If you checked the box in Part I, line
						 11c or 11d, enter 20%. However, if you checked the box in Part I, line 11g; or Part I, line 12b, is
						 5 MW ac or more (in relation to line 11a, 11b, 11c, or 11d), you don’t qualify for the bonus credit.
						 In that situation, enter 0% here, go to line 23j and enter -0-, and then go to line 23k
						  <!--Dotted Line-->
							<span class="styDotLn" style="float:right;">..</span>
						</div>
						<div class="styLNRightNumBox" style="height:28mm;padding-top:24.5mm">23d</div>
						<div class="styLNAmountBox" style="height:28mm;width:27mm;padding-top:25mm;font-size:8pt;
						  border-bottom-width:0px">
							<xsl:call-template name="PopulateAmount">
							  <xsl:with-param name="TargetNode" 
							   select="$Form3468Data/QlfyInvstCreditFacilityPropGrp/LowIncmSolarWindBonusCrPct"/>
							</xsl:call-template>%
						</div>
						<div class="styLNRightNumBoxNBB" style="height:28mm;background-color:lightgrey;
						 border-right-width:0mm"/>
						<div class="styLNAmountBox" style="height:28mm;width:27mm;border-bottom-width:0px;"/>      
						<div class="styLNRightNumBoxNBB" style="height:28mm;background-color:lightgrey;
						 border-left-width:1px;border-right-width:0px;"/>  
						<div class="styLNAmountBox" style="height:28mm;width:27mm;border-left-width:1px;
						  border-bottom-width:0px;"/>
					</div>
					<!-- End of 23d -->
					<!-- Start of Line 23e -->
					<div style="7.5mm;width:187mm;font-size:8pt">
						<div class="styLNLeftNumBox" style="height:4mm;padding-left:4mm;">e</div>
						<div class="styLNDesc" style="height:7.5mm;width:73mm;padding-left:2mm">
						 Enter the amount of capacity limitation you were allocated in the allocation letter
						  <!--Dotted Line-->
							<span class="styDotLn" style="float:right;">......</span>
						</div>
						<div class="styLNRightNumBox" style="height:7.5mm;padding-top:3.5mm">23e</div>
						<div class="styLNAmountBox" style="height:7.5mm;width:45mm;padding-top:4mm;font-size:7pt;
						  border-top-width:1px">
							<xsl:call-template name="PopulateAmount">
							  <xsl:with-param name="TargetNode" 
							   select="$Form3468Data/QlfyInvstCreditFacilityPropGrp/AllocLmtEnergyCapKWQty"/>
							</xsl:call-template>kW
						</div>
						<!--<div class="styLNRightNumBoxNBB" style="height:7.5mm;background-color:lightgrey;
						 border-right-width:0mm"/>-->
						<div class="styLNAmountBox" style="height:7.5mm;width:17mm;border-bottom-width:0px;"/>      
						<div class="styLNRightNumBoxNBB" style="height:7.5mm;background-color:lightgrey;
						 border-left-width:1px;border-right-width:0px;"/>  
						<div class="styLNAmountBox" style="height:7.5mm;width:27mm;border-left-width:1px;
						  border-bottom-width:0px;"/>
					</div>
					<!-- End of 23e -->
					<!-- Start of Line 23f -->
					<div style="11mm;width:187mm;font-size:8pt">
						<div class="styLNLeftNumBox" style="height:4mm;padding-left:4mm;">f</div>
						<div class="styLNDesc" style="height:11mm;width:73mm;padding-left:2mm">
						 If the entry on Part I, line 12b, equals the entry on line 23e, multiply line 23a by 23d and go to
						  line 23j. Otherwise, continue to line 23g
						  <!--Dotted Line-->
							<span class="styDotLn" style="float:right;">...</span>
						</div>
						<div class="styLNRightNumBox" style="height:11mm;padding-top:7.5mm">23f</div>
						<div class="styLNAmountBox" style="height:11mm;width:27mm;padding-top:7.5mm;font-size:8pt">
							<xsl:call-template name="PopulateAmount">
							  <xsl:with-param name="TargetNode" 
							   select="$Form3468Data/QlfyInvstCreditFacilityPropGrp/LowIncmComFullBonusCrAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBoxNBB" style="height:11mm;background-color:lightgrey;
						 border-right-width:0mm"/>
						<div class="styLNAmountBox" style="height:11mm;width:27mm;border-bottom-width:0px;"/>      
						<div class="styLNRightNumBoxNBB" style="height:11mm;background-color:lightgrey;
						 border-left-width:1px;border-right-width:0px;"/>  
						<div class="styLNAmountBox" style="height:11mm;width:27mm;border-left-width:1px;
						  border-bottom-width:0px;"/>
					</div>
					<!-- End of 23f -->
					<!-- Start of Line 23g -->
					<div style="11mm;width:187mm;font-size:8pt">
						<div class="styLNLeftNumBox" style="height:4mm;padding-left:4mm;">g</div>
						<div class="styLNDesc" style="height:11mm;width:73mm;padding-left:2mm">
						 If the entry on Part I, line 12b, is more than the entry on  line 23e, divide line 23e by Part I,
						  line 12b
						  <!--Dotted Line-->
							<span class="styDotLn" style="float:right;">...............</span>
						</div>
						<div class="styLNRightNumBox" style="height:11mm;padding-top:7.5mm">23g</div>
						<div class="styLNAmountBox" style="height:11mm;width:27mm;padding-top:7.5mm;font-size:8pt">
							<xsl:call-template name="PopulateAmount">
							  <xsl:with-param name="TargetNode" 
							   select="$Form3468Data/QlfyInvstCreditFacilityPropGrp/LowIncmComAllocRedFctrRt"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBoxNBB" style="height:11mm;background-color:lightgrey;
						 border-right-width:0mm"/>
						<div class="styLNAmountBox" style="height:11mm;width:27mm;border-bottom-width:0px;"/>      
						<div class="styLNRightNumBoxNBB" style="height:11mm;background-color:lightgrey;
						 border-left-width:1px;border-right-width:0px;"/>  
						<div class="styLNAmountBox" style="height:11mm;width:27mm;border-left-width:1px;
						  border-bottom-width:0px;"/>
					</div>
					<!-- End of 23g -->
					<!-- Start of Line 23h -->
					<div style="4mm;width:187mm;font-size:8pt">
						<div class="styLNLeftNumBox" style="height:4mm;padding-left:4mm;">h</div>
						<div class="styLNDesc" style="height:4mm;width:73mm;padding-left:2mm">
						 Multiply line 23d by line 23g
						  <!--Dotted Line-->
							<span class="styDotLn" style="float:right;">.......</span>
						</div>
						<div class="styLNRightNumBox" style="height:4mm;padding-top:.5mm">23h</div>
						<div class="styLNAmountBox" style="height:4mm;width:27mm;padding-top:.5mm;font-size:8pt">
							<xsl:call-template name="PopulateAmount">
							  <xsl:with-param name="TargetNode" 
							   select="$Form3468Data/QlfyInvstCreditFacilityPropGrp/LowIncmComPctRedFctrRt"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBoxNBB" style="height:4mm;background-color:lightgrey;
						 border-right-width:0mm"/>
						<div class="styLNAmountBox" style="height:4mm;width:27mm;border-bottom-width:0px;"/>      
						<div class="styLNRightNumBoxNBB" style="height:4mm;background-color:lightgrey;
						 border-left-width:1px;border-right-width:0px;"/>  
						<div class="styLNAmountBox" style="height:4mm;width:27mm;border-left-width:1px;
						  border-bottom-width:0px;"/>
					</div>
					<!-- End of 23h -->
					<!-- Start of Line 23i -->
					<div style="4mm;width:187mm;font-size:8pt">
						<div class="styLNLeftNumBox" style="height:4mm;padding-left:4mm;">i</div>
						<div class="styLNDesc" style="height:4mm;width:73mm;padding-left:2mm">
						 Multiply line 23a by line 23h
						  <!--Dotted Line-->
							<span class="styDotLn" style="float:right;">.......</span>
						</div>
						<div class="styLNRightNumBox" style="height:4mm;padding-top:.5mm;">23i</div>
						<div class="styLNAmountBox" style="height:4mm;width:27mm;padding-top:.5mm;font-size:8pt;">
							<xsl:call-template name="PopulateAmount">
							  <xsl:with-param name="TargetNode" 
							   select="$Form3468Data/QlfyInvstCreditFacilityPropGrp/LowIncmComRedFctrCrAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBoxNBB" style="height:4mm;background-color:lightgrey;
						 border-right-width:0mm"/>
						<div class="styLNAmountBox" style="height:4mm;width:27mm;border-bottom-width:0px;"/>      
						<div class="styLNRightNumBoxNBB" style="height:4mm;background-color:lightgrey;
						 border-left-width:1px;border-right-width:0px;"/>  
						<div class="styLNAmountBox" style="height:4mm;width:27mm;border-left-width:1px;
						  border-bottom-width:0px;"/>
					</div>
					<!-- End of 23i -->
					<!-- Line 23j -->
					<div style="height:7.5mm;width:187mm;font-size:8pt">
						<div class="styLNLeftNumBox" style="height:4mm;padding-top:.5mm;padding-left:4mm">j</div>
						<div class="styLNDesc" style="height:7.5mm;width:108mm;padding-top:.5mm;padding-left:2mm;">
						  If Part I, line 12b, is more than the entry on line 23e, enter the amount from line
						   23i. Otherwise, enter the amount from line 23f
						  <!--Dotted Line-->
						  <span class="styDotLn" style="float:right;">......</span>
						</div>
						<div class="styLNRightNumBox" style="height:7.5mm;padding-top:3.5mm;border-bottom-width:0px;">23j
						</div>
						<div class="styLNAmountBox" style="height:7.5mm;width:27mm;padding-top:4mm;">
						  <xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" 
							 select="$Form3468Data/QlfyInvstCreditFacilityPropGrp/CalcLowIncmSolarWindBonusCrAmt"/>
						  </xsl:call-template>
						</div>
						 <div class="styLNRightNumBoxNBB" style="height:7.5mm;background-color:lightgrey;"/>
						 <div class="styLNAmountBox" style="height:7.5mm;width:27mm;border-left-width:1px;
						  border-bottom-width:0px;"/>  
					</div>
					<!-- End of 23j -->
					<!-- Start of Line 23k -->
					<div style="height:11mm;width:187mm;font-size:8pt">
						<div class="styLNLeftNumBox" style="height:4mm;padding-left:4mm">k</div>
						<div class="styLNDesc" style="height:11mm;width:73mm;padding-left:2mm">
						 If you checked the box in Part I, line 9a, enter 10%. If you checked the box in Part I, line 9b,
						  enter 2%. Otherwise, go to line 23m
						  <!--Dotted Line-->
						  <span class="styDotLn" style="float:right;">....</span>
						</div>
						<div class="styLNRightNumBox" style="height:11mm;padding-top:7mm;">23k</div>
						<div class="styLNAmountBox" style="height:11mm;width:27mm;padding-top:7.5mm;font-size:8pt">
							<xsl:call-template name="PopulateAmount">
							  <xsl:with-param name="TargetNode" 
							   select="$Form3468Data/QlfyInvstCreditFacilityPropGrp/DomContentBonusCreditPct"/>
							</xsl:call-template>%
						</div>
						<div class="styLNRightNumBoxNBB" style="height:11mm;background-color:lightgrey;
						 border-right-width:0mm;border-bottom-width:0px"/>
						<div class="styLNAmountBox" style="height:11mm;width:27mm;border-bottom-width:0px;"/>      
						<div class="styLNRightNumBoxNBB" style="height:11mm;background-color:lightgrey;
						  border-left-width:1px;border-right-width:0px;"/>  
						<div class="styLNAmountBox" style="height:11mm;width:27mm;border-left-width:1px;
						  border-bottom-width:0px;"/>
					</div>
					<!-- End of 23k -->
					<!-- Line 23l -->
					<div style="height:4mm;width:187mm;font-size:8pt">
						<div class="styLNLeftNumBox" style="height:4mm;padding-top:.5mm;padding-left:4mm">l</div>
						<div class="styLNDesc" style="height:4mm;width:108mm;padding-top:.5mm;padding-left:2mm;">
						  Multiply line 23a by line 23k
						  <!--Dotted Line-->
						  <span class="styDotLn" style="float:right;">................</span>
						</div>
						<div class="styLNRightNumBox" style="height:4mm;padding-top:.5mm;">23l</div>
						<div class="styLNAmountBox" style="height:4mm;width:27mm;padding-top:.5mm;">
						  <xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" 
							 select="$Form3468Data/QlfyInvstCreditFacilityPropGrp/CalcDomContentBonusCreditAmt"/>
						  </xsl:call-template>
						</div>
						 <div class="styLNRightNumBoxNBB" style="height:4mm;background-color:lightgrey;"/>
						 <div class="styLNAmountBox" style="height:4mm;width:27mm;border-left-width:1px;
						  border-bottom-width:0px;"/>  
					</div>
					<!-- End of 23l -->
					<!-- Start of Line 23m -->
					<div style="height:11mm;width:187mm;font-size:8pt">
						<div class="styLNLeftNumBox" style="height:4mm;padding-left:4mm">m</div>
						<div class="styLNDesc" style="height:11mm;width:73mm;padding-left:2mm">
						 If you checked the box in Part I, line 10a, enter 10%. If you checked the box in Part I, line 10b,
						  enter 2%. Otherwise, go to line 24
						  <!--Dotted Line-->
						  <span class="styDotLn" style="float:right;">.....</span>
						</div>
						<div class="styLNRightNumBox" style="height:11mm;padding-top:7.5mm;">23m</div>
						<div class="styLNAmountBox" style="height:11mm;width:27mm;padding-top:7.5mm;font-size:8pt;">
							<xsl:call-template name="PopulateAmount">
							  <xsl:with-param name="TargetNode" 
							   select="$Form3468Data/QlfyInvstCreditFacilityPropGrp/EnergyComBonusCreditPct"/>
							</xsl:call-template>%
						</div>
						<div class="styLNRightNumBoxNBB" style="height:11mm;background-color:lightgrey;
						 border-right-width:0mm;border-bottom-width:0px"/>
						<div class="styLNAmountBox" style="height:11mm;width:27mm;border-bottom-width:0px;"/>      
						<div class="styLNRightNumBoxNBB" style="height:11mm;background-color:lightgrey;
						  border-left-width:1px;border-right-width:0px;"/>  
						<div class="styLNAmountBox" style="height:11mm;width:27mm;border-left-width:1px;
						  border-bottom-width:0px;"/>
					</div>
					<!-- End of 23m -->
					<!-- Line 23n -->
					<div style="height:4mm;width:187mm;font-size:8pt">
						<div class="styLNLeftNumBox" style="height:4mm;padding-top:.5mm;padding-left:4mm">n</div>
						<div class="styLNDesc" style="height:4mm;width:108mm;padding-top:.5mm;padding-left:2mm;">
						  Multiply line 23a by line 23m
						  <!--Dotted Line-->
						  <span class="styDotLn" style="float:right;">...............</span>
						</div>
						<div class="styLNRightNumBox" style="height:4mm;padding-top:.5mm;">23n</div>
						<div class="styLNAmountBox" style="height:4mm;width:27mm;padding-top:.5mm;">
						  <xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" 
							 select="$Form3468Data/QlfyInvstCreditFacilityPropGrp/CalcEnergyComBonusCreditAmt"/>
						  </xsl:call-template>
						</div>
						 <div class="styLNRightNumBoxNBB" style="height:4mm;background-color:lightgrey;"/>
						 <div class="styLNAmountBox" style="height:4mm;width:27mm;border-left-width:1px;
						  border-bottom-width:0px;"/>  
					</div>
					<!-- End of 23n -->
					<!--Line 24 -->
					<div style="height:7.5mm;width:187mm;font-size:8pt">
						<div class="styLNLeftNumBox" style="height:7.5mm;padding-top:3.5mm;padding-left:0mm">24</div>
						<div class="styLNDesc" style="width:143mm;height:7.5mm;padding-top:4mm;padding-left:2mm;">
						  Add lines 23c, 23j, 23l, and 23n
							<!--Dotted Line-->
							<div class="styDotLn" style="float:none;">......................</div>						  
						</div>
						<div class="styLNRightNumBoxNBB" style="height:7.5mm;padding-top:4.5mm">24</div>
						<div class="styLNAmountBox" style="height:7.5mm;width:27mm;padding-top:4mm;border-left-width:1px;
						 border-bottom-width:0px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" 
								select="$Form3468Data/QlfyInvstCreditFacilityPropGrp/TotQlfyInvstFacilityPropCrAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- End of 24 -->
						<!-- Page Break and Footer-->
					<div class="styBB" style="width:187mm;clear:both;padding-top:0.4mm;border-top-width:2px;
					 border-bottom-width:0px">
						<div style="float:right;" class="styGenericDiv">Form <span class="styBoldText">3468</span> (2025)
						</div>
					</div>
					<br/>
					<div class="pageEnd"/>
					<div style="page-break-after:always"/>
					<!-- End Footer -->
					<!-- Header -->
					<div style="width:187mm;padding-top:1mm;float:left">
					  Form 3468 (2025)
						<span style="width:15mm;float:right;">Page 
							<span class="styBoldText" style="font-size:8pt;">11</span>
						</span>
					</div>
					<!-- End Header -->
					<!-- Start of Part VI cont. -->
					<div class="styBB" style="width:187mm;border-top-width:1px;">
						<div class="styPartName" style="height:5mm;width:15mm;font-size:8pt;padding-top:1mm;">Part VI
						</div>
						<div class="styPartDesc" style="height:auto;width:170mm;font-weight:normal;font-size:9pt;
						 padding-left:2mm;padding-top:1mm">
						 <b>Energy Credit Under Section 48</b><i> (continued)</i>
						</div>
					</div>
					<!-- Part VI Section M -->
					<div class="styBB" style="width:187mm;border-top-width:1px;">
						<div class="styPartDesc" style="width:170mm; height:auto; font-weight:normal;font-size:9pt;
						 padding-left:0mm;padding-top:1mm"><b>Section M—Clean Hydrogen Production Facilities as Energy
						  Property</b> (see instructions)
						</div>
					</div>
					<div class="styBB" style="width:187mm;border-top-width:1px;">
						<div class="styPartDesc" style="width:170mm; height:auto; font-weight:normal;border-top-width:0px;
						 padding-left:0mm;padding-top:1mm"><b>Caution:</b>If you choose to treat specified clean hydrogen
						  production property as energy property, you cannot also take the credit under section 45V or 45Q.
						  Production and sale or use of clean hydrogen must be verified by an unrelated party. Attach a copy
						  of the verification report to the tax return.
						</div>
					</div>
					<!-- Start of Line 25a -->
					<div style="18mm;width:187mm;font-size:8pt">
						<div class="styLNLeftNumBox" style="height:4mm;padding-left:0mm;">25a</div>
						<div class="styLNDesc" style="height:18mm;width:73mm;padding-left:2mm">
						 Enter the basis of property placed in service during the tax year for the facility that is designed
						  and reasonably expected to produce qualified clean hydrogen per section 45V(b)(2)(A)
						  <!--Dotted Line-->
							<span class="styDotLn" style="float:right;">................</span>
						</div>
						<div class="styLNRightNumBox" style="height:18mm;padding-top:14.5mm">25a</div>
						<div class="styLNAmountBox" style="height:18mm;width:27mm;padding-top:14.5mm;font-size:8pt">
							<xsl:call-template name="PopulateAmount">
							  <xsl:with-param name="TargetNode" 
							   select="$Form3468Data/ClnHydrgnProdFcltsEgyPropCrGrp/CleanHydrgn45Vb2APropBasisAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBoxNBB" style="height:18mm;background-color:lightgrey;
						 border-right-width:0mm"/>
						<div class="styLNAmountBox" style="height:18mm;width:27mm;border-bottom-width:0px;"/>      
						<div class="styLNRightNumBoxNBB" style="height:18mm;background-color:lightgrey;
						 border-left-width:1px;border-right-width:0px;"/>  
						<div class="styLNAmountBox" style="height:18mm;width:27mm;border-left-width:1px;
						  border-bottom-width:0px;"/>
					</div>
					<!-- End of 25a -->
					<!-- Start of Line 25b -->
					<div style="11mm;width:187mm;font-size:8pt">
						<div class="styLNLeftNumBox" style="height:4mm;padding-left:4mm;">b</div>
						<div class="styLNDesc" style="height:11mm;width:73mm;padding-left:2mm;">
						 If you checked the box in Part I, line 8b, enter 6%. If you checked the box in Part I, line 8c, 
						 enter 1.2%
						  <!--Dotted Line-->
							<span class="styDotLn" style="float:right;">.............</span>
						</div>
						<div class="styLNRightNumBox" style="height:11mm;padding-top:7.5mm">25b</div>
						<div class="styLNAmountBox" style="height:11mm;width:27mm;padding-top:7.5mm;font-size:8pt">
							<xsl:call-template name="PopulateAmount">
							  <xsl:with-param name="TargetNode" 
							   select="$Form3468Data/ClnHydrgnProdFcltsEgyPropCrGrp/NetOutLss1MWStsfdWgReqSectAPct"/>
							</xsl:call-template>%
						</div>
						<div class="styLNRightNumBoxNBB" style="height:11mm;background-color:lightgrey;
						 border-right-width:0mm"/>
						<div class="styLNAmountBox" style="height:11mm;width:27mm;border-bottom-width:0px;"/>      
						<div class="styLNRightNumBoxNBB" style="height:11mm;background-color:lightgrey;
						 border-left-width:1px;border-right-width:0px;"/>  
						<div class="styLNAmountBox" style="height:11mm;width:27mm;border-left-width:1px;
						  border-bottom-width:0px;"/>
					</div>
					<!-- End of 25b -->
					<!-- Line 25c -->
					<div style="height:4mm;width:187mm;font-size:8pt">
						<div class="styLNLeftNumBox" style="height:4mm;padding-top:.5mm;padding-left:4mm">c</div>
						<div class="styLNDesc" style="height:4mm;width:108mm;padding-top:.5mm;padding-left:2mm;">
						  Multiply line 25a by line 25b
						  <!--Dotted Line-->
						  <span class="styDotLn" style="float:right;">...............</span>
						</div>
						<div class="styLNRightNumBox" style="height:4mm;padding-top:.5mm;border-bottom-width:0px;">25c
						</div>
						<div class="styLNAmountBox" style="height:4mm;width:27mm;padding-top:.5mm;">
						  <xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" 
							 select="$Form3468Data/ClnHydrgnProdFcltsEgyPropCrGrp/CalcClnHydrgn45Vb2APropBssAmt"/>
						  </xsl:call-template>
						</div>
						 <div class="styLNRightNumBoxNBB" style="height:4mm;background-color:lightgrey;"/>
						 <div class="styLNAmountBox" style="height:4mm;width:27mm;border-left-width:1px;
						  border-bottom-width:0px;"/>  
					</div>
					<!-- End of 25c -->
					<!-- Start of Line 25d -->
					<div style="18mm;width:187mm;font-size:8pt">
						<div class="styLNLeftNumBox" style="height:4mm;padding-left:4mm;">d</div>
						<div class="styLNDesc" style="height:18mm;width:73mm;padding-left:2mm">
						 Enter the basis of property placed in service during the tax year for the facility that is designed
						  and reasonably expected to produce qualified clean hydrogen per section 45V(b)(2)(B)
						  <!--Dotted Line-->
							<span class="styDotLn" style="float:right;">................</span>
						</div>
						<div class="styLNRightNumBox" style="height:18mm;padding-top:14.5mm">25d</div>
						<div class="styLNAmountBox" style="height:18mm;width:27mm;padding-top:14.5mm;font-size:8pt">
							<xsl:call-template name="PopulateAmount">
							  <xsl:with-param name="TargetNode" 
							   select="$Form3468Data/ClnHydrgnProdFcltsEgyPropCrGrp/CleanHydrgn45Vb2BPropBasisAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBoxNBB" style="height:18mm;background-color:lightgrey;
						 border-right-width:0mm"/>
						<div class="styLNAmountBox" style="height:18mm;width:27mm;border-bottom-width:0px;"/>      
						<div class="styLNRightNumBoxNBB" style="height:18mm;background-color:lightgrey;
						 border-left-width:1px;border-right-width:0px;"/>  
						<div class="styLNAmountBox" style="height:18mm;width:27mm;border-left-width:1px;
						  border-bottom-width:0px;"/>
					</div>
					<!-- End of 25d -->
					<!-- Start of Line 25e -->
					<div style="11mm;width:187mm;font-size:8pt">
						<div class="styLNLeftNumBox" style="height:4mm;padding-left:4mm;">e</div>
						<div class="styLNDesc" style="height:11mm;width:73mm;padding-left:2mm;">
						 If you checked the box in Part I, line 8b, enter 7.5%. If you checked the box in Part I, line 8c, 
						 enter 1.5%
						  <!--Dotted Line-->
							<span class="styDotLn" style="float:right;">.............</span>
						</div>
						<div class="styLNRightNumBox" style="height:11mm;padding-top:7.5mm">25e</div>
						<div class="styLNAmountBox" style="height:11mm;width:27mm;padding-top:7.5mm;font-size:8pt">
							<xsl:call-template name="PopulateAmount">
							  <xsl:with-param name="TargetNode" 
							   select="$Form3468Data/ClnHydrgnProdFcltsEgyPropCrGrp/NetOutLss1MWStsfdWgReqSectBPct"/>
							</xsl:call-template>%
						</div>
						<div class="styLNRightNumBoxNBB" style="height:11mm;background-color:lightgrey;
						 border-right-width:0mm"/>
						<div class="styLNAmountBox" style="height:11mm;width:27mm;border-bottom-width:0px;"/>      
						<div class="styLNRightNumBoxNBB" style="height:11mm;background-color:lightgrey;
						 border-left-width:1px;border-right-width:0px;"/>  
						<div class="styLNAmountBox" style="height:11mm;width:27mm;border-left-width:1px;
						  border-bottom-width:0px;"/>
					</div>
					<!-- End of 25e -->
					<!-- Line 25f -->
					<div style="height:4mm;width:187mm;font-size:8pt">
						<div class="styLNLeftNumBox" style="height:4mm;padding-top:.5mm;padding-left:4mm">f</div>
						<div class="styLNDesc" style="height:4mm;width:108mm;padding-top:.5mm;padding-left:2mm;">
						  Multiply line 25d by line 25e
						  <!--Dotted Line-->
						  <span class="styDotLn" style="float:right;">...............</span>
						</div>
						<div class="styLNRightNumBox" style="height:4mm;padding-top:.5mm;border-bottom-width:0px;">25f
						</div>
						<div class="styLNAmountBox" style="height:4mm;width:27mm;padding-top:.5mm;">
						  <xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" 
							 select="$Form3468Data/ClnHydrgnProdFcltsEgyPropCrGrp/CalcClnHydrgn45Vb2BPropBssAmt"/>
						  </xsl:call-template>
						</div>
						 <div class="styLNRightNumBoxNBB" style="height:4mm;background-color:lightgrey;"/>
						 <div class="styLNAmountBox" style="height:4mm;width:27mm;border-left-width:1px;
						  border-bottom-width:0px;"/>  
					</div>
					<!-- End of 25f -->
					<!-- Start of Line 25g -->
					<div style="18mm;width:187mm;font-size:8pt">
						<div class="styLNLeftNumBox" style="height:4mm;padding-left:4mm;">g</div>
						<div class="styLNDesc" style="height:18mm;width:73mm;padding-left:2mm">
						 Enter the basis of property placed in service during the tax year for the facility that is designed
						  and reasonably expected to produce qualified clean hydrogen per section 45V(b)(2)(C)
						  <!--Dotted Line-->
							<span class="styDotLn" style="float:right;">................</span>
						</div>
						<div class="styLNRightNumBox" style="height:18mm;padding-top:14mm">25g</div>
						<div class="styLNAmountBox" style="height:18mm;width:27mm;padding-top:14.5mm;font-size:8pt">
							<xsl:call-template name="PopulateAmount">
							  <xsl:with-param name="TargetNode" 
							   select="$Form3468Data/ClnHydrgnProdFcltsEgyPropCrGrp/CleanHydrgn45Vb2CPropBasisAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBoxNBB" style="height:18mm;background-color:lightgrey;
						 border-right-width:0mm"/>
						<div class="styLNAmountBox" style="height:18mm;width:27mm;border-bottom-width:0px;"/>      
						<div class="styLNRightNumBoxNBB" style="height:18mm;background-color:lightgrey;
						 border-left-width:1px;border-right-width:0px;"/>  
						<div class="styLNAmountBox" style="height:18mm;width:27mm;border-left-width:1px;
						  border-bottom-width:0px;"/>
					</div>
					<!-- End of 25g -->
					<!-- Start of Line 25h -->
					<div style="11mm;width:187mm;font-size:8pt">
						<div class="styLNLeftNumBox" style="height:4mm;padding-left:4mm;">h</div>
						<div class="styLNDesc" style="height:11mm;width:73mm;padding-left:2mm;">
						 If you checked the box in Part I, line 8b, enter 10%. If you checked the box in Part I, line 8c, 
						 enter 2%
						  <!--Dotted Line-->
							<span class="styDotLn" style="float:right;">..............</span>
						</div>
						<div class="styLNRightNumBox" style="height:11mm;padding-top:7.5mm">25h</div>
						<div class="styLNAmountBox" style="height:11mm;width:27mm;padding-top:7.5mm;font-size:8pt">
							<xsl:call-template name="PopulateAmount">
							  <xsl:with-param name="TargetNode" 
							   select="$Form3468Data/ClnHydrgnProdFcltsEgyPropCrGrp/NetOutLss1MWStsfdWgReqSectCPct"/>
							</xsl:call-template>%
						</div>
						<div class="styLNRightNumBoxNBB" style="height:11mm;background-color:lightgrey;
						 border-right-width:0mm"/>
						<div class="styLNAmountBox" style="height:11mm;width:27mm;border-bottom-width:0px;"/>      
						<div class="styLNRightNumBoxNBB" style="height:11mm;background-color:lightgrey;
						 border-left-width:1px;border-right-width:0px;"/>  
						<div class="styLNAmountBox" style="height:11mm;width:27mm;border-left-width:1px;
						  border-bottom-width:0px;"/>
					</div>
					<!-- End of 25h -->
					<!-- Line 25i -->
					<div style="height:4mm;width:187mm;font-size:8pt">
						<div class="styLNLeftNumBox" style="height:4mm;padding-top:.5mm;padding-left:4mm">i</div>
						<div class="styLNDesc" style="height:4mm;width:108mm;padding-top:.5mm;padding-left:2mm;">
						  Multiply line 25g by line 25h
						  <!--Dotted Line-->
						  <span class="styDotLn" style="float:right;">...............</span>
						</div>
						<div class="styLNRightNumBox" style="height:4mm;padding-top:.5mm;border-bottom-width:0px;">25i
						</div>
						<div class="styLNAmountBox" style="height:4mm;width:27mm;padding-top:.5mm;">
						  <xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" 
							 select="$Form3468Data/ClnHydrgnProdFcltsEgyPropCrGrp/CalcClnHydrgn45Vb2CPropBssAmt"/>
						  </xsl:call-template>
						</div>
						 <div class="styLNRightNumBoxNBB" style="height:4mm;background-color:lightgrey;"/>
						 <div class="styLNAmountBox" style="height:4mm;width:27mm;border-left-width:1px;
						  border-bottom-width:0px;"/>  
					</div>
					<!-- End of 25i -->
					<!-- Start of Line 25j -->
					<div style="18mm;width:187mm;font-size:8pt">
						<div class="styLNLeftNumBox" style="height:4mm;padding-left:4mm;">j</div>
						<div class="styLNDesc" style="height:18mm;width:73mm;padding-left:2mm">
						 Enter the basis of property placed in service during the tax year for the facility that is designed
						  and reasonably expected to produce qualified clean hydrogen per section 45V(b)(2)(D)
						  <!--Dotted Line-->
							<span class="styDotLn" style="float:right;">................</span>
						</div>
						<div class="styLNRightNumBox" style="height:18mm;padding-top:14mm">25j</div>
						<div class="styLNAmountBox" style="height:18mm;width:27mm;padding-top:14.5mm;font-size:8pt">
							<xsl:call-template name="PopulateAmount">
							  <xsl:with-param name="TargetNode" 
							   select="$Form3468Data/ClnHydrgnProdFcltsEgyPropCrGrp/CleanHydrgn45Vb2DPropBasisAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBoxNBB" style="height:18mm;background-color:lightgrey;
						 border-right-width:0mm"/>
						<div class="styLNAmountBox" style="height:18mm;width:27mm;border-bottom-width:0px;"/>      
						<div class="styLNRightNumBoxNBB" style="height:18mm;background-color:lightgrey;
						 border-left-width:1px;border-right-width:0px;"/>  
						<div class="styLNAmountBox" style="height:18mm;width:27mm;border-left-width:1px;
						  border-bottom-width:0px;"/>
					</div>
					<!-- End of 25j -->
					<!-- Start of Line 25k -->
					<div style="11mm;width:187mm;font-size:8pt">
						<div class="styLNLeftNumBox" style="height:4mm;padding-left:4mm;">k</div>
						<div class="styLNDesc" style="height:11mm;width:73mm;padding-left:2mm;">
						 If you checked the box in Part I, line 8b, enter 30%. If you checked the box in Part I, line 8c, 
						 enter 6%
						  <!--Dotted Line-->
							<span class="styDotLn" style="float:right;">.............</span>
						</div>
						<div class="styLNRightNumBox" style="height:11mm;padding-top:7.5mm">25k</div>
						<div class="styLNAmountBox" style="height:11mm;width:27mm;padding-top:7.5mm;font-size:8pt">
							<xsl:call-template name="PopulateAmount">
							  <xsl:with-param name="TargetNode" 
							   select="$Form3468Data/ClnHydrgnProdFcltsEgyPropCrGrp/NetOutLss1MWACOrStsfdWgReqPct"/>
							</xsl:call-template>%
						</div>
						<div class="styLNRightNumBoxNBB" style="height:11mm;background-color:lightgrey;
						 border-right-width:0mm"/>
						<div class="styLNAmountBox" style="height:11mm;width:27mm;border-bottom-width:0px;"/>      
						<div class="styLNRightNumBoxNBB" style="height:11mm;background-color:lightgrey;
						 border-left-width:1px;border-right-width:0px;"/>  
						<div class="styLNAmountBox" style="height:11mm;width:27mm;border-left-width:1px;
						  border-bottom-width:0px;"/>
					</div>
					<!-- End of 25k -->
					<!-- Line 25l -->
					<div style="height:4mm;width:187mm;font-size:8pt">
						<div class="styLNLeftNumBox" style="height:4mm;padding-top:.5mm;padding-left:4mm">l</div>
						<div class="styLNDesc" style="height:4mm;width:108mm;padding-top:.5mm;padding-left:2mm;">
						  Multiply line 25j by line 25k
						  <!--Dotted Line-->
						  <span class="styDotLn" style="float:right;">...............</span>
						</div>
						<div class="styLNRightNumBox" style="height:4mm;padding-top:.5mm;">25l
						</div>
						<div class="styLNAmountBox" style="height:4mm;width:27mm;padding-top:.5mm;">
						  <xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" 
							 select="$Form3468Data/ClnHydrgnProdFcltsEgyPropCrGrp/CalcClnHydrgn45Vb2DPropBssAmt"/>
						  </xsl:call-template>
						</div>
						 <div class="styLNRightNumBoxNBB" style="height:4mm;background-color:lightgrey;"/>
						 <div class="styLNAmountBox" style="height:4mm;width:27mm;border-left-width:1px;
						  border-bottom-width:0px;"/>  
					</div>
					<!-- End of 25l -->
					<!--Line 26 -->
					<div class="styBB" style="height:7.5mm;width:187mm;font-size:8pt">
						<div class="styLNLeftNumBox" style="height:7.5mm;padding-top:3.5mm;padding-left:0mm">26</div>
						<div class="styLNDesc" style="width:143mm;height:7.5mm;padding-top:4mm;padding-left:2mm;">
						  Add lines 25c, 25f, 25i,and 25l
							<!--Dotted Line-->
							<div class="styDotLn" style="float:none;">.......................</div>
						</div>
						<div class="styLNRightNumBox" style="height:7.5mm;padding-top:4mm">26</div>
						<div class="styLNAmountBox" style="height:7.5mm;width:27mm;padding-top:4mm;
						 border-left-width:1px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" 
								select="$Form3468Data/ClnHydrgnProdFcltsEgyPropCrGrp/TotClnHydrgnFcltsEgyPropCrAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- End of 26 -->
					<!-- Part VI Section N -->
					<div class="styBB" style="width:187mm;border-top-width:1px;">
						<div class="styPartDesc" style="width:170mm; height:auto; font-weight:normal;font-size:9pt;
						 padding-left:0mm;padding-top:1mm"><b>Section N—Totals and Credit Reduction for Tax-Exempt Bonds</b>
						  (see instructions)
						</div>
					</div>
					<!-- Start of Line 27 -->
					<div style="7.5mm;width:187mm;font-size:8pt;">
						<div class="styLNLeftNumBox" style="height:4mm;padding-left:0mm;">27</div>
						<div class="styLNDesc" style="height:7.5mm;width:73mm;padding-left:2mm">
						 Add Part VI, lines 2, 4, 6, 8, 10, 12, 14, 16, 18, 20, 22, 24, and 26
						  <!--Dotted Line-->
							<span class="styDotLn" style="float:right;">..........</span>
						</div>
						<div class="styLNRightNumBox" style="height:7.5mm;padding-top:4mm">27</div>
						<div class="styLNAmountBox" style="height:7.5mm;width:27mm;padding-top:4mm;font-size:8pt">
							<xsl:call-template name="PopulateAmount">
							  <xsl:with-param name="TargetNode" 
							   select="$Form3468Data/TotalEnergyCreditsAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBoxNBB" style="height:7.5mm;background-color:lightgrey;
						 border-right-width:0mm"/>
						<div class="styLNAmountBox" style="height:7.5mm;width:27mm;border-bottom-width:0px;"/>      
						<div class="styLNRightNumBoxNBB" style="height:7.5mm;background-color:lightgrey;
						 border-left-width:1px;border-right-width:0px;"/>  
						<div class="styLNAmountBox" style="height:7.5mm;width:27mm;border-left-width:1px;
						  border-bottom-width:0px;"/>
					</div>
					<!-- End of 27 -->
					<!-- Start of Line 27 Instructions -->
					<div style="11mm;width:187mm;font-size:8pt">
						<div class="styLNLeftNumBox" style="height:4mm;padding-left:0mm;"></div>
						<div class="styLNDesc" style="height:11mm;width:73mm;padding-left:2mm">
						 If proceeds of tax-exempt bonds were <b>not</b> used to finance your facility, skip line 28, and 
						  go to line 29.
						</div>
						<div class="styLNRightNumBoxNBB" style="height:11mm;padding-top:7.5mm;background-color:lightgrey">
						</div>
						<div class="styLNAmountBoxNBB" style="height:11mm;width:27mm;padding-top:7.5mm;font-size:8pt;">
						</div>
						<div class="styLNRightNumBoxNBB" style="height:11mm;background-color:lightgrey;
						 border-right-width:0mm"/>
						<div class="styLNAmountBox" style="height:11mm;width:27mm;border-bottom-width:0px;"/>      
						<div class="styLNRightNumBoxNBB" style="height:11mm;background-color:lightgrey;
						 border-left-width:1px;border-right-width:0px;"/>  
						<div class="styLNAmountBox" style="height:11mm;width:27mm;border-left-width:1px;
						  border-bottom-width:0px;"/>
					</div>
					<!-- End of 27 Instructions -->
					<!-- Start of Line 28a Instructions -->
					<div style="18mm;width:187mm;font-size:8pt;">
						<div class="styLNLeftNumBox" style="height:4mm;padding-left:0mm;">28a</div>
						<div class="styLNDesc" style="height:18mm;width:73mm;padding-left:2mm">
						 <b>Divide.</b> Sum, for the tax year and all prior tax years, of all proceeds of tax-exempt
						 bonds (within the meaning of section 103), used to finance the qualified facility, as of the close
						 of the tax year
						</div>
						<div class="styLNRightNumBox" style="height:18mm;padding-top:14.5mm;background-color:lightgrey">
						</div>
						<div class="styLNAmountBox" style="height:18mm;width:27mm;padding-top:14.5mm;font-size:7pt">
						</div>
						<div class="styLNRightNumBoxNBB" style="height:18mm;background-color:lightgrey;
						 border-right-width:0mm"/>
						<div class="styLNAmountBox" style="height:18mm;width:27mm;border-bottom-width:0px;"/>      
						<div class="styLNRightNumBoxNBB" style="height:18mm;background-color:lightgrey;
						 border-left-width:1px;border-right-width:0px;"/>  
						<div class="styLNAmountBox" style="height:18mm;width:27mm;border-left-width:1px;
						  border-bottom-width:0px;"/>
					</div>
					<!-- End of 28a Instructions -->
					<!-- Start of 28a Amount Line -->
					<div style="2mm;width:187mm;font-size:8pt;">
						<div class="styLNLeftNumBox" style="height:2mm;width:30mm;padding-left:0mm;"></div>
						<div class="styLNAmountBox" style="height:2mm;width:33mm;padding-left:2mm;bottom-border-width:1mm;
						 border-left-width:0mm;"/>
						<div class="styLNRightNumBoxNBB" style="height:4mm;width:18mm;padding-top:0.5mm;
						 border-left-width:0mm;"></div>
						<div class="styLNRightNumBox" style="height:4mm;padding-top:0.5mm">28a</div>
						<div class="styLNAmountBox" style="height:4mm;width:27mm;padding-top:.5mm;font-size:8pt">
							<xsl:call-template name="PopulateAmount">
							  <xsl:with-param name="TargetNode" 
							   select="$Form3468Data/CalcTaxExemptBondsPct"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBoxNBB" style="height:4mm;background-color:lightgrey;
						 border-right-width:0mm"/>
						<div class="styLNAmountBox" style="height:4mm;width:27mm;border-bottom-width:0px;"/>      
						<div class="styLNRightNumBoxNBB" style="height:4mm;background-color:lightgrey;
						 border-left-width:1px;border-right-width:0px;"/>  
						<div class="styLNAmountBox" style="height:4mm;width:27mm;border-left-width:1px;
						  border-bottom-width:0px;"/>
					</div>
					<!-- End of 28a Amount Line -->
					<!-- Start of Line 28a pt2 -->
					<div style="14mm;width:187mm;font-size:8pt">
						<div class="styLNLeftNumBox" style="height:4mm;padding-left:0mm;"></div>
						<div class="styLNDesc" style="height:14mm;width:73mm;padding-left:2mm">
						 Aggregate amount of additions to the capital account for the qualified facility, for the tax year 
						 and all prior tax years, as of the close of the tax year
						</div>
						<div class="styLNRightNumBox" style="height:14mm;padding-top:10.5mm;background-color:lightgrey">
						</div>
						<div class="styLNAmountBox" style="height:14mm;width:27mm;padding-top:11mm;font-size:7pt;">
						</div>
						<div class="styLNRightNumBoxNBB" style="height:14mm;background-color:lightgrey;
						 border-right-width:0mm"/>
						<div class="styLNAmountBox" style="height:14mm;width:27mm;border-bottom-width:0px;"/>      
						<div class="styLNRightNumBoxNBB" style="height:14mm;background-color:lightgrey;
						 border-left-width:1px;border-right-width:0px;"/>  
						<div class="styLNAmountBox" style="height:14mm;width:27mm;border-left-width:1px;
						  border-bottom-width:0px;"/>
					</div>
					<!-- End of 28a pt2 -->
					<!-- Start of Line 28b -->
					<div style="4mm;width:187mm;font-size:8pt">
						<div class="styLNLeftNumBox" style="height:4mm;padding-left:4mm;">b</div>
						<div class="styLNDesc" style="height:4mm;width:73mm;padding-left:2mm">
						 Multiply line 27 by line 28a
						  <!--Dotted Line-->
							<span class="styDotLn" style="float:right;">.......</span>
						</div>
						<div class="styLNRightNumBox" style="height:4mm;padding-top:.5mm">28b</div>
						<div class="styLNAmountBox" style="height:4mm;width:27mm;padding-top:.5mm;font-size:8pt">
							<xsl:call-template name="PopulateAmount">
							  <xsl:with-param name="TargetNode" 
							   select="$Form3468Data/CalcTotEgyCrAndTxExmptBondAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBoxNBB" style="height:4mm;background-color:lightgrey;
						 border-right-width:0mm"/>
						<div class="styLNAmountBox" style="height:4mm;width:27mm;border-bottom-width:0px;"/>      
						<div class="styLNRightNumBoxNBB" style="height:4mm;background-color:lightgrey;
						 border-left-width:1px;border-right-width:0px;"/>  
						<div class="styLNAmountBox" style="height:4mm;width:27mm;border-left-width:1px;
						  border-bottom-width:0px;"/>
					</div>
					<!-- End of 28b -->
					<!-- Start of Line 28c -->
					<div style="4mm;width:187mm;font-size:8pt">
						<div class="styLNLeftNumBox" style="height:4mm;padding-left:4mm;">c</div>
						<div class="styLNDesc" style="height:4mm;width:73mm;padding-left:2mm">
						 Multiply line 27 by 15% (0.15)
						  <!--Dotted Line-->
							<span class="styDotLn" style="float:right;">......</span>
						</div>
						<div class="styLNRightNumBox" style="height:4mm;padding-top:.5mm">28c</div>
						<div class="styLNAmountBox" style="height:4mm;width:27mm;padding-top:.5mm;font-size:8pt">
							<xsl:call-template name="PopulateAmount">
							  <xsl:with-param name="TargetNode" 
							   select="$Form3468Data/CalcTotalEnergyCreditAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBoxNBB" style="height:4mm;background-color:lightgrey;
						 border-right-width:0mm"/>
						<div class="styLNAmountBox" style="height:4mm;width:27mm;border-bottom-width:0px;"/>      
						<div class="styLNRightNumBoxNBB" style="height:4mm;background-color:lightgrey;
						 border-left-width:1px;border-right-width:0px;"/>  
						<div class="styLNAmountBox" style="height:4mm;width:27mm;border-left-width:1px;
						  border-bottom-width:0px;"/>
					</div>
					<!-- End of 28c -->
					<!-- Start of Line 28d -->
					<div style="4mm;width:187mm;font-size:8pt">
						<div class="styLNLeftNumBox" style="height:4mm;padding-left:4mm;">d</div>
						<div class="styLNDesc" style="height:4mm;width:73mm;padding-left:2mm">
						 Enter the smaller of line 28b or 28c
						  <!--Dotted Line-->
							<span class="styDotLn" style="float:right;">....</span>
						</div>
						<div class="styLNRightNumBox" style="height:4mm;padding-top:.5mm">28d</div>
						<div class="styLNAmountBox" style="height:4mm;width:27mm;padding-top:.5mm;font-size:8pt">
							<xsl:call-template name="PopulateAmount">
							  <xsl:with-param name="TargetNode" 
							   select="$Form3468Data/SmllrTotEgyCrOrTxExmptBondAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBoxNBB" style="height:4mm;background-color:lightgrey;
						 border-right-width:0mm"/>
						<div class="styLNAmountBox" style="height:4mm;width:27mm;border-bottom-width:0px;"/>      
						<div class="styLNRightNumBoxNBB" style="height:4mm;background-color:lightgrey;
						 border-left-width:1px;border-right-width:0px;"/>  
						<div class="styLNAmountBox" style="height:4mm;width:27mm;border-left-width:1px;
						  border-bottom-width:0px;"/>
					</div>
					<!-- End of 28d -->
					<!-- Start of Line 28e -->
					<div style="4mm;width:187mm;font-size:8pt">
						<div class="styLNLeftNumBox" style="height:4mm;padding-left:4mm;">e</div>
						<div class="styLNDesc" style="height:4mm;width:73mm;padding-left:2mm">
						 Subtract line 28d from line 27
						  <!--Dotted Line-->
							<span class="styDotLn" style="float:right;">......</span>
						</div>
						<div class="styLNRightNumBox" style="height:4mm;padding-top:.5mm">28e</div>
						<div class="styLNAmountBox" style="height:4mm;width:27mm;padding-top:.5mm;font-size:8pt">
							<xsl:call-template name="PopulateAmount">
							  <xsl:with-param name="TargetNode" 
							   select="$Form3468Data/TotEgyCrLssSmllrTxExmptBondAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBoxNBB" style="height:4mm;background-color:lightgrey;
						 border-right-width:0mm"/>
						<div class="styLNAmountBox" style="height:4mm;width:27mm;border-bottom-width:0px;"/>      
						<div class="styLNRightNumBoxNBB" style="height:4mm;background-color:lightgrey;
						 border-left-width:1px;border-right-width:0px;"/>  
						<div class="styLNAmountBox" style="height:4mm;width:27mm;border-left-width:1px;
						  border-bottom-width:0px;"/>
					</div>
					<!-- End of 28e -->
					<!-- Line 29 -->
					<div style="height:7.5mm;width:187mm;font-size:8pt">
						<div class="styLNLeftNumBox" style="height:4mm;padding-top:.5mm;padding-left:0mm">29</div>
						<div class="styLNDesc" style="height:7.5mm;width:108mm;padding-top:0mm;padding-left:2mm;">
						  If proceeds of tax-exempt bonds were used to finance your facility, enter the amount from line 28e.
						   Otherwise, enter the amount from line 27
						  <!--Dotted Line-->
						  <span class="styDotLn" style="float:right;">..</span>
						</div>
						<div class="styLNRightNumBox" style="height:7.5mm;padding-top:4mm;">29</div>
						<div class="styLNAmountBox" style="height:7.5mm;width:27mm;padding-top:4mm;">
						  <xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" 
							 select="$Form3468Data/FacilityTaxExemptBondFncAmt"/>
						  </xsl:call-template>
						</div>
						 <div class="styLNRightNumBoxNBB" style="height:7.5mm;background-color:lightgrey;"/>
						 <div class="styLNAmountBox" style="height:7.5mm;width:27mm;border-left-width:1px;
						  border-bottom-width:0px;"/>  
					</div>
					<!-- End of 29 -->
					<!-- Line 30 -->
					<div style="height:24mm;width:187mm;font-size:8pt;">
						<div class="styLNLeftNumBox" style="height:4mm;padding-top:.5mm;padding-left:0mm">30</div>
						<div class="styLNDesc" style="height:27mm;width:108mm;padding-top:0mm;padding-left:2mm;">
						  If you are making an elective payment election under section 6417 for a facility whose 
						  construction began in calendar year 2024, and the facility doesn’t meet the rules of 
						  section 48(a)(12)(B), doesn’t have a maximum net output of less than 1 MW (as measured in ac), 
						  or meet an exception under section 45(b)(10)(D), multiply line 29 by 90% (0.90). All 
						  others, enter the amount from line 29
						  <!--Dotted Line-->
						  <span class="styDotLn" style="float:right;">...............</span>
						</div>
						<div class="styLNRightNumBox" style="height:24mm;padding-top:20.5mm;">30</div>
						<div class="styLNAmountBox" style="height:24mm;width:27mm;padding-top:20.5mm;">
						  <xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" 
							 select="$Form3468Data/CYACLess1MWEPESect48a12BAmt"/>
						  </xsl:call-template>
						</div>
						 <div class="styLNRightNumBoxNBB" style="height:24mm;background-color:lightgrey;"/>
						 <div class="styLNAmountBox" style="height:24mm;width:27mm;border-left-width:1px;
						  border-bottom-width:0px;"/>  
					</div>
					<!-- End of 30 -->
					<!-- Line 31 -->
					<div style="height:7.5mm;width:187mm;font-size:8pt">
						<div class="styLNLeftNumBox" style="height:4mm;padding-top:.5mm;padding-left:0mm">31</div>
						<div class="styLNDesc" style="height:7.5mm;width:108mm;padding-top:0mm;padding-left:2mm;">
						  Enter the applicable unused investment credit from cooperatives. See instructions
						  <!--Dotted Line-->
						  <span class="styDotLn" style="float:right;">.....................</span>
						</div>
						<div class="styLNRightNumBox" style="height:7.5mm;padding-top:4mm;">31</div>
						<div class="styLNAmountBox" style="height:7.5mm;width:27mm;padding-top:4mm;">
						  <xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" 
							 select="$Form3468Data/UnusedCreditFromCoopAmt"/>
						  </xsl:call-template>
						</div>
						 <div class="styLNRightNumBoxNBB" style="height:7.5mm;background-color:lightgrey;"/>
						 <div class="styLNAmountBox" style="height:7.5mm;width:27mm;border-left-width:1px;
						  border-bottom-width:0px;"/>  
					</div>
					<!-- End of 31 -->
					<!--Line 32 -->
					<div style="height:4mm;width:187mm;font-size:8pt">
						<div class="styLNLeftNumBox" style="height:4mm;padding-top:.5mm;padding-left:0mm">32</div>
						<div class="styLNDesc" style="width:143mm;height:4mm;padding-top:.5mm;padding-left:2mm;">
						  Add lines 30 and 31. Report this amount on Form 3800, Part III, line 4a
							<!--Dotted Line-->
							<div class="styDotLn" style="float:none;">.........</div>
						</div>
						<div class="styLNRightNumBoxNBB" style="height:4mm;padding-top:.5mm">32</div>
						<div class="styLNAmountBoxNBB" style="height:4mm;width:27mm;padding-top:.5mm;border-left-width:1px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" 
								select="$Form3468Data/ReportableEnergyCreditAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- End of 32 -->
						<!-- Page Break and Footer-->
					<div class="styBB" style="width:187mm;clear:both;padding-top:0.4mm;border-top-width:2px;
					 border-bottom-width:0px">
						<div style="float:right;" class="styGenericDiv">Form <span class="styBoldText">3468</span> (2025)
						</div>
					</div>
					<br/>
					<div class="pageEnd"/>
					<div style="page-break-after:always"/>
					<!-- End Footer -->
					<!-- Header -->
					<div style="width:187mm;padding-top:1mm;float:left">
					  Form 3468 (2025)
						<span style="width:15mm;float:right;">Page 
							<span class="styBoldText" style="font-size:8pt;">12</span>
						</span>
					</div>
					<!-- End Header -->
					<!-- Start of Part VII -->
					<div class="styBB" style="width:187mm;border-top-width:1px;">
						<div class="styPartName" style="width:15mm;height:5mm; font-size:8pt;padding-top:1mm;">Part VII
						</div>
						<div class="styPartDesc" style="width:170mm; height:auto; font-weight:normal;font-size:9pt;
						 padding-left:2mm;padding-top:1mm">
						 <b>Rehabilitation Credit Under Section 47</b> (see instructions)
						</div>
					</div>
						<!-- Line 1a -->
						<div style="width:177mm;font-size:8pt">
							<div class="styLNLeftNumBox" style="height:5mm;padding-left:2mm;padding-top:2mm">
							 1a
							</div>
							<div class="styLNDesc" style="width:155mm;height:4mm;">
							 Was there a prior 170(h) deduction on this property?
								<input type="checkbox" alt="Prior 170h deductionYes" class="styCkbox">
									<xsl:call-template name="PopulateYesCheckbox">
										<xsl:with-param name="TargetNode" 
										 select="$Form3468Data/Prior170hDeductionInd"/>
										<xsl:with-param name="BackupName">F3468Prior170hDeductionInd</xsl:with-param>
									</xsl:call-template>
								</input>
								<label>
									<xsl:call-template name="PopulateLabelYes">
										<xsl:with-param name="TargetNode" 
										 select="$Form3468Data/Prior170hDeductionInd"/>
										<xsl:with-param name="BackupName">F3468Prior170hDeductionInd</xsl:with-param>
									</xsl:call-template>Yes
								</label>
								<span style="width: 4mm"/>
								<input type="checkbox" alt="Prior 170h deductionNo" class="styCkbox">
									<xsl:call-template name="PopulateNoCheckbox">
										<xsl:with-param name="TargetNode" 
										 select="$Form3468Data/Prior170hDeductionInd"/>
										<xsl:with-param name="BackupName">F3468Prior170hDeductionInd</xsl:with-param>
									</xsl:call-template>
								</input>
								<label>
									<xsl:call-template name="PopulateLabelNo">
										<xsl:with-param name="TargetNode" 
										 select="$Form3468Data/Prior170hDeductionInd"/>
										<xsl:with-param name="BackupName">F3468Prior170hDeductionInd</xsl:with-param>
									</xsl:call-template>No
								</label>
							</div>
						</div>
						<!-- End 1a -->
					<!--Line 1b -->
					<div style="height:4.5mm;width:187mm;font-size:8pt">
						<div class="styLNLeftNumBox" style="height:4mm;padding-top:.5mm;padding-left:4mm">b</div>
						<div class="styLNDesc" style="height:4mm;width:143mm;padding-top:1mm;padding-left:0mm;">
						  If “Yes” to line 1a, then provide the prior NPS number
							<!--Dotted Line-->
							<div class="styDotLn" style="float:none;">...............</div>
						</div>
						<div class="styLNAmountBox" style="height:4mm;width:33mm;padding-top:.5mm;border-left-width:0px;
						 border-bottom-width:1px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" 
								select="$Form3468Data/Prior170hDeductionNPSProjNum"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- End of 1b -->
						<!-- Line 1c -->		
						<div style="height:15mm;width:187mm;font-size:8pt">
							<div class="styLNLeftNumBox" style="height:4mm;padding-left:4mm">
							 c
							</div>
							<div class="styLNDesc" style="height:11mm;width:155mm;">
							 Check this box if you are electing under section 47(d)(5) to take your qualified rehabilitation
							  expenditures into account for the tax year in which paid (or, for self-rehabilitated property,
							  when capitalized). This election applies to the current tax year and to all later tax years.
							  You may not revoke this election without IRS consent
								<!--Dotted Line-->
								<span class="styDotLn" 
								 style="float:none;padding-left:2mm">............
								</span>
								<input type="checkbox" alt="RehabilitationExpendatutres" class="styCkbox">
									<xsl:call-template name="PopulateCheckbox">
										<xsl:with-param name="TargetNode" 
										 select="$Form3468Data/RehabilitationExpendElectInd"/>
										<xsl:with-param name="BackupName">
										  IRS3468ProvisionalEmissionRtApprvlInd
										</xsl:with-param>
									</xsl:call-template>
								</input>
							</div>
						</div>
						<!-- End 1c  -->
						<!-- Line 1d -->
						<div style="width:187mm;font-size:8pt">
							<div class="styLNLeftNumBox" style="height:4mm;padding-left:4mm;">d</div>
							<div class="styLNDesc" style="height:4mm;width:85mm;font-size:8pt;">
                              Enter the dates for the 24- or 60-month measuring period.
                            </div>
						</div>
						<div style="width:187mm;">
							<div class="styLNLeftNumBox" style="height:4mm;padding-left:4mm;"></div>
							<div class="styLNDesc" style="height:7mm;font-size:8pt;width:21mm">
							 Beginning Date:
							</div>
							<span class="styUnderlineAmount" style="float:left; width:18mm;border-bottom-width:1px;
							    text-align:left;font-size:8pt;height:7mm;padding-top:3mm">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$Form3468Data/RehabilitationPeriodBeginDt"/>
								</xsl:call-template>
							</span>
						</div>
						<div style="width:187mm;">
							<div class="styLNLeftNumBox" style="height:4mm;padding-left:4mm;"></div>
							<div class="styLNDesc" style="height:7mm;font-size:8pt;width:21mm;padding-top:3mm">
							 End Date:
							</div>
							<span class="styUnderlineAmount" style="float:left; width:18mm;border-bottom-width:1px;
							    text-align:left;font-size:8pt;height:7mm;padding-top:3mm">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$Form3468Data/RehabilitationPeriodEndDt"/>
								</xsl:call-template>
							</span>
						</div>
						<!-- End 1d -->
					<!--Line 1e -->
					<div style="height:7.5mm;width:187mm;font-size:8pt">
						<div class="styLNLeftNumBox" style="height:4mm;padding-top:.5mm;padding-left:4mm">e</div>
						<div class="styLNDesc" style="height:7.5mm;width:143mm;padding-top:1mm;padding-left:0mm;">
						  Enter the adjusted basis of the building as of the beginning date above (or the first day of your
						   holding period, if later)
							<!--Dotted Line-->
							<div class="styDotLn" style="float:none;">..........................</div>
						</div>
						<div class="styLNAmountBox" style="height:7.5mm;width:30mm;padding-top:4mm;border-left-width:0px;
						 border-bottom-width:1px;">$
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" 
								select="$Form3468Data/AdjustedBasisOfBuildingAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- End of 1e -->
					<!--Line 1f -->
					<div style="height:9.5mm;width:187mm;font-size:8pt">
						<div class="styLNLeftNumBox" style="height:4mm;padding-top:.5mm;padding-left:4mm">f</div>
						<div class="styLNDesc" style="height:8mm;width:143mm;padding-top:1mm;padding-left:0mm;">
						  Enter the amount of the qualified rehabilitation expenditures incurred, or treated as incurred,
						   during the period on line 1d above
							<!--Dotted Line-->
							<div class="styDotLn" style="float:none;">.........................</div>
						</div>
						<div class="styLNAmountBox" style="height:8mm;width:30mm;padding-top:4mm;border-left-width:0px;
						 border-bottom-width:1px;">$
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" 
								select="$Form3468Data/QlfyRehbltExpendIncurredAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- End of 1f -->
					<!-- Start of Line 1g -->
					<div style="height:7.5mm;width:187mm;font-size:8pt">
						<div class="styLNLeftNumBox" style="height:4mm;padding-left:4mm;">g</div>
						<div class="styLNDesc" style="height:7.5mm;width:73mm;padding-left:0mm">
						 Enter the amount of qualified rehabilitation expenditures
						  <!--Dotted Line-->
							<span class="styDotLn" style="float:none;">............</span>
						</div>
						<div class="styLNRightNumBox" style="height:7.5mm;padding-top:3.5mm">1g</div>
						<div class="styLNAmountBox" style="height:7.5mm;width:27mm;padding-top:3.5mm;font-size:8pt">
							<xsl:call-template name="PopulateAmount">
							  <xsl:with-param name="TargetNode" 
							   select="$Form3468Data/QlfyRehabilitationExpendAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBoxNBB" style="height:7.5mm;background-color:lightgrey;
						 border-right-width:0mm"/>
						<div class="styLNAmountBox" style="height:7.5mm;width:27mm;border-bottom-width:0px;"/>      
						<div class="styLNRightNumBoxNBB" style="height:7.5mm;background-color:lightgrey;
						 border-left-width:1px;border-right-width:0px;"/>  
						<div class="styLNAmountBox" style="height:7.5mm;width:27mm;border-left-width:1px;
						  border-bottom-width:0px;"/>
					</div>
					<!-- End of 1g -->
					<!-- Line 1h -->
					<div style="height:7.5mm;width:187mm;font-size:8pt">
						<div class="styLNLeftNumBox" style="height:4mm;padding-top:3mm;padding-left:4mm">h</div>
						<div class="styLNDesc" style="height:7.5mm;width:108mm;padding-top:3mm;padding-left:0mm;">
						  Reserved for future use
						  <!--Dotted Line-->
						  <span class="styDotLn" style="float:none;">.................</span>
						</div>
						<div class="styLNRightNumBox" style="height:7.5mm;padding-top:4mm;">1h</div>
						<div class="styLNAmountBox" style="height:7.5mm;width:27mm;padding-top:4mm;
						 background-color:lightgrey">
						  <!--<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" 
							 select="$Form3468Data/Pre1936BuildingCreditAmt"/>
						  </xsl:call-template>-->
						</div>
						<div class="styLNRightNumBox" style="height:7.5mm;padding-top:3.5mm;background-color:lightgrey;"/>
						<div class="styLNAmountBox" style="height:7.5mm;width:27mm;border-left-width:1px;
						  border-bottom-width:0px;"/>  
					</div>
					<!-- End of 1h -->
					<!-- Line 1i -->
					<div style="height:7.5mm;width:187mm;font-size:8pt">
						<div class="styLNLeftNumBox" style="height:4mm;padding-top:3mm;padding-left:4mm">i</div>
						<div class="styLNDesc" style="height:7.5mm;width:108mm;padding-top:3mm;padding-left:0mm;">
						  Reserved for future use
						  <!--Dotted Line-->
						  <span class="styDotLn" style="float:none;">.................</span>
						</div>
						<div class="styLNRightNumBox" style="height:7.5mm;padding-top:3.5mm;">1i</div>
						<div class="styLNAmountBox" style="height:7.5mm;width:27mm;padding-top:4mm;background-color:lightgrey">
						  <!--<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" 
							 select="$Form3468Data/CertHistoricStructureCrAmt"/>
						  </xsl:call-template>-->
						</div>
						<div class="styLNRightNumBox" style="height:7.5mm;padding-top:3.5mm;background-color:lightgrey;"/>
						<div class="styLNAmountBox" style="height:7.5mm;width:27mm;border-left-width:1px;
						  border-bottom-width:0px;"/>  
					</div>
					<!-- End of 1i -->
					<!-- Line 1j -->
					<div style="height:7.5mm;width:187mm;font-size:8pt">
						<div class="styLNLeftNumBox" style="height:4mm;padding-top:.5mm;padding-left:4mm">j</div>
						<div class="styLNDesc" style="height:7.5mm;width:108mm;padding-top:0mm;padding-left:0mm;">
						  For certified historic structures with expenditures paid or incurred multiply line 1g by 4% (0.04)
						  <!--Dotted Line-->
						  <span class="styDotLn" style="float:none;">..................</span>
						</div>
						<div class="styLNRightNumBox" style="height:7.5mm;padding-top:3.5mm;">1j</div>
						<div class="styLNAmountBox" style="height:7.5mm;width:27mm;padding-top:4mm;">
						  <xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" 
							 select="$Form3468Data/OtherCertifiedHistStrctrCrAmt"/>
						  </xsl:call-template>
						</div>
						<div class="styLNRightNumBox" style="height:7.5mm;padding-top:3.5mm;background-color:lightgrey;"/>
						<div class="styLNAmountBox" style="height:7.5mm;width:27mm;border-left-width:1px;
						  border-bottom-width:0px;"/>  
					</div>
					<!-- End of 1j -->
					<!-- Line j NOTE -->
					<div style="height:7.5mm;width:187mm;font-size:8pt">
						<div class="styLNLeftNumBox" style="height:4mm;padding-top:.5mm;padding-left:4mm"></div>
						<div class="styLNDesc" style="height:7.5mm;width:108mm;padding-top:0mm;padding-left:0mm;">
						  <b>Note:</b> This credit is allowed for a 5-year period beginning in the tax year that the 
						   qualified rehabilitated building is placed in service.
						</div>
						<div class="styLNRightNumBox" style="height:7.5mm;padding-top:3.5mm;
						 border-bottom-width:0px;background-color:lightgrey"></div>
						<div class="styLNAmountBox" style="height:7.5mm;width:27mm;padding-top:4mm;
						 border-bottom-width:0px;">
						</div>
						<div class="styLNRightNumBox" style="height:7.5mm;padding-top:3.5mm;
						 border-bottom-width:0px;background-color:lightgrey;"/>
						<div class="styLNAmountBox" style="height:7.5mm;width:27mm;border-left-width:1px;
						  border-bottom-width:0px;"/>  
					</div>
					<!-- End of j NOTE -->
					<!-- Line 1k-->
					<div style="height:20mm;width:187mm;">
						<div class="styLNLeftNumBox" style="height:11mm;padding-bottom:.5mm;padding-left:4mm">k</div>
						<div class="styLNDesc" style="width:108mm;height:11mm;">
						  <span style="float:left;padding-left:0mm;">If you completed line 1j, enter the following. 
						  </span>
						  <br/>
							<!-- Line 1k(i) -->
							<b>(i)</b>
							 The assigned NPS project number:
								<div>
									<span class="styUnderlineAmount" style="float:left; width:28mm;border-bottom-width:1px; 
									 text-align:left">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" 
											 select="$Form3468Data/NPSProjectNum"/>
										</xsl:call-template>
									</span>
									<span style="width:1mm"></span>
									<xsl:call-template name="SetFormLinkInline">
										<xsl:with-param name="TargetNode" select="$Form3468Data/NPSProjectNum"/>
									</xsl:call-template>
								</div>
							<!-- End Line 1k(i) -->
						  <br/>
							<!-- Line 1k(ii) -->
							<b>(ii)</b>
							 The originating pass-through entity’s EIN (if applicable):
								<div>
									<span class="styUnderlineAmount" style="float:left; width:15mm;border-bottom-width:1px; 
									 text-align:left">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" 
											 select="$Form3468Data/PassThroughEntityEIN"/>
										</xsl:call-template>
									</span>
								</div>
							<!-- End Line 1k(ii) -->
						  <br/>
							<!-- Line 1k(iii) -->
							<b>(iii)</b>
							 The date the NPS approved the Request for Certification of Completed Work:
								<div>
									<span class="styUnderlineAmount" style="float:left; width:15mm;border-bottom-width:1px; 
									 text-align:left">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" 
											 select="$Form3468Data/NPSApprovalDt"/>
										</xsl:call-template>
									</span>
								</div>
							<!-- End Line 1k(iii) -->
						</div>
						<div class="styLNRightNumBox" style="height:20mm;padding-top:3.5mm;
						 border-bottom-width:0px;background-color:lightgrey">
						</div>
						<div class="styLNAmountBox" style="height:20mm;width:27mm;padding-top:4mm;
						 border-bottom-width:0px;">
						</div>
						<div class="styLNRightNumBox" style="height:20mm;padding-top:3.5mm;
						 border-bottom-width:0px;background-color:lightgrey;"/>
						<div class="styLNAmountBox" style="height:20mm;width:27mm;border-left-width:1px;
						  border-bottom-width:0px;"/>  
					</div>
					<!-- End of 1k -->
					<!-- Line 11-->
					<div style="height:4mm;width:187mm;">
						<div class="styLNLeftNumBox" style="height:4mm;padding-bottom:.5mm;padding-left:4mm">l</div>
						<div class="styLNDesc" style="width:108mm;height:4mm;">
						  <span style="float:left;padding-left:0mm;">
						   Reserved for future use.
						  </span>
						</div> 
						<div class="styLNRightNumBox" style="height:4mm;padding-top:3.5mm;
						 border-bottom-width:0px;background-color:lightgrey">
						</div>
						<div class="styLNAmountBox" style="height:4mm;width:27mm;padding-top:4mm;
						 border-bottom-width:0px;">
						</div>
						<div class="styLNRightNumBox" style="height:4mm;padding-top:3.5mm;
						 border-bottom-width:0px;background-color:lightgrey;"/>
						<div class="styLNAmountBox" style="height:4mm;width:27mm;border-left-width:1px;
						  border-bottom-width:0px;"/>  
					</div>
					<!-- Line 1m -->
					<div style="width:187mm;height:17mm">
						<div class="styLNLeftNumBox" style="height:11mm;padding-bottom:.5mm;padding-left:4mm">m</div>
						<div class="styLNDesc" style="width:108mm;height:17mm;">
						   If you have not received an approved certification of completed work, enter the date that is 30
						   months after the date that the original rehabilitation credit was claimed for the property:
							<div>
								<span class="styFixedUnderline" style="width:15mm;padding-top:.1mm;padding-bottom:0mm;
									text-align:center">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" 
										 select="$Form3468Data/SpcfdDtAftrOrigRehbltCrClaimDt"/>
									</xsl:call-template>
								</span>,
							</div>
							 and attach the first page of NPS Form 10-168, with an indication that it was received, and a 
							 statement that you did not receive the final certification of completed work before the date above.
						</div>
						<div class="styLNRightNumBox" style="height:17mm;padding-top:3.5mm;
						 border-bottom-width:0px;background-color:lightgrey"></div>
						<div class="styLNAmountBox" style="height:17mm;width:27mm;padding-top:4mm;
						 border-bottom-width:0px;">
						</div>
						<div class="styLNRightNumBox" style="height:17mm;padding-top:3.5mm;
						 border-bottom-width:0px;background-color:lightgrey;"/>
						<div class="styLNAmountBox" style="height:17mm;width:27mm;border-left-width:1px;
						  border-bottom-width:0px;"/>  
					</div>
					<!-- End of 1m -->
					<!-- Line 2 -->
					<div style="height:7.5mm;width:187mm;font-size:8pt">
						<div class="styLNLeftNumBox" style="height:4mm;padding-top:.5mm;padding-left:2mm">2</div>
						<div class="styLNDesc" style="height:7.5mm;width:108mm;padding-top:0mm;padding-left:0mm;">
						  Enter the applicable unused investment credit from cooperatives (see instructions)
						  <!--Dotted Line-->
						  <span class="styDotLn" style="float:right;">.....................</span>
						</div>
						<div class="styLNRightNumBox" style="height:7.5mm;padding-top:3.5mm;">2</div>
						<div class="styLNAmountBox" style="height:7.5mm;width:27mm;padding-top:4mm;">
						  <xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" 
							 select="$Form3468Data/UnusedCrRehbltEgyCrFromCoopAmt"/>
						  </xsl:call-template>
						</div>
						 <div class="styLNRightNumBoxNBB" style="height:7.5mm;background-color:lightgrey;"/>
						 <div class="styLNAmountBox" style="height:7.5mm;width:27mm;border-left-width:1px;
						  border-bottom-width:0px;"/>  
					</div>
					<!-- End of 2 -->
					<!--Line 3 -->
					<div class="styBB" style="height:4mm;width:187mm;font-size:8pt">
						<div class="styLNLeftNumBox" style="height:4mm;padding-top:.5mm;padding-left:2mm">3</div>
						<div class="styLNDesc" style="width:143mm;height:4mm;padding-top:.5mm;padding-left:0mm;">
						  Add lines 1j and 2. Report this amount on Form 3800, Part III, line 4k
							<!--Dotted Line-->
							<div class="styDotLn" style="float:none;">.......</div>
						</div>
						<div class="styLNRightNumBoxNBB" style="height:4mm;padding-top:.5mm">3</div>
						<div class="styLNAmountBox" style="height:4mm;width:27mm;padding-top:.5mm;border-left-width:1px;
						 border-bottom-width:0px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" 
								select="$Form3468Data/TotQlfyRehabilitationExpendAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- End of 3 -->			
					<!-- Adding page break -->
					<div style="width:187mm;">
						<div style="float:right;" class="styGenericDiv">Form
					       <span class="styBoldText" style="font-size:8pt;">3468</span> (2025)</div>
					</div>
						<br/>
					<div class="pageEnd"/>
					<div style="page-break-after:always"/>
					<!-- Begininning of write-in data -->
					<div class="styLeftOverTitleLine" id="LeftoverData" style="width:187mm;">
						<div class="styLeftOverTitle">
  						 Additional Data        
						</div>
						<div class="styLeftOverButtonContainer">
							<input class="styLeftoverTableBtn" TabIndex="1" type="button" value="Return to Form"
							 onclick="javascript:returnToWriteInImage();"/>
						</div>
					</div>
					<table class="styLeftOverTbl">
						<xsl:call-template name="PopulateCommonLeftover">
							<xsl:with-param name="TargetNode" select="$Form3468Data"/>
							<xsl:with-param name="DescWidth" select="100"/>
						</xsl:call-template>
						<xsl:if test="$Form3468Data/CertifiedHistoricStructures/@historicStructureCertOnFile">
							<tr>
								<td class="styLeftOverTableRowDesc" style="width:110mm;" scope="row">
									Line 1g - Certified Historic Structure on File:
								</td>
								<td class="styLeftOverTableRowAmount" style="width:100mm;text-align:left;">
									<xsl:choose>
										<xsl:when test="$Form3468Data/
										CertifiedHistoricStructures/@historicStructureCertOnFile = '1'">
											<xsl:call-template name="PopulateYesBoxText">
												<xsl:with-param name="TargetNode" select="$Form3468Data/
												CertifiedHistoricStructures/  @historicStructureCertOnFile"/>
											</xsl:call-template>
										</xsl:when>
										<xsl:otherwise>
											<xsl:call-template name="PopulateNoBoxText">
												<xsl:with-param name="TargetNode" select="$Form3468Data/
												CertifiedHistoricStructures/  @historicStructureCertOnFile"/>
											</xsl:call-template>
										</xsl:otherwise>
									</xsl:choose>
								</td>
							</tr>
						</xsl:if>
					</table>
					<!-- ***** Begin Separated ***** -->
					<xsl:if test="($Print = $Separated) and (count($Form3468Data/InvstCreditLesseeSect48dGrp) &gt;1)">
						<br/>
						<span class="styRepeatingDataTitle">Form 3468 Part I Line 13a-13e - Investment Credit Lessee
						</span>
						<table class="styDepTbl" style="font-size: 7pt">
							<thead class="styTableThead">
								<tr class="styDepTblHdr">
									<th scope="col" class="styDepTblCell" style="border-right-width: 0px; width: 53mm">(a)
										<span class="styNormalText">
										   Lessee Name and Address
										</span>
									</th><!--
									<th scope="col" class="styDepTblCell" style="border-right-width:0px;
									 border-left-width: 1px; width: 31mm">(b)
										<span class="styNormalText">
											Lessee Address
										</span>
									</th>-->
									<th scope="col" class="styDepTblCell" style="border-right-width:0px;
									 border-left-width: 1px; width: 31mm">(c)
										<span class="styNormalText">
										  Property Description
										</span>
									</th>
									<th scope="col" class="styDepTblCell" style="border-right-width: 0px; 
									 border-left-width: 1px; width: 31mm">(d)
										<span class="styNormalText">
										  Amount treated as acquired property
										</span>
									</th>
									<th scope="col" class="styDepTblCell" style="width: 31mm; border-right-width: 0px; 
									 border-left-width: 1px">(e)
										<span class="styNormalText">
											Income inclusion reported under regulations section 1.50-1 amount
										</span>
									</th>
								</tr>
							</thead>
							<tfoot/>
							<tbody valign="top">
								<xsl:for-each select="$Form3468Data/InvstCreditLesseeSect48dGrp">
									<tr>
										<xsl:attribute name="class">
											<xsl:choose>
												<xsl:when test="position() mod 2 = 1">styDepTblRow1
												</xsl:when>
													<xsl:otherwise>styDepTblRow2
													</xsl:otherwise>
											</xsl:choose>
										</xsl:attribute>
										<td class="styDepTblCell" style="text-align:left;width:53mm;border-left-width:0px;
										 font-size: 6pt">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="TitleTxt"/>
											</xsl:call-template>
											<xsl:if test="LessorBusinessName != ''">
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" 
														 select="LessorBusinessName/BusinessNameLine1Txt"/>
													</xsl:call-template>
													<xsl:if test="LessorBusinessName/BusinessNameLine2Txt != ''">
														<br/>
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" 
															 select="LessorBusinessName/BusinessNameLine2Txt"/>
														</xsl:call-template>
													</xsl:if>
											</xsl:if>
										</td>
										<td class="styDepTblCell" rowspan="2" style="width: 31mm; text-align:left">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="PropertyDesc"/>
											</xsl:call-template>
										</td>
										<td class="styDepTblCell" rowspan="2" style="width: 31mm; text-align:right">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="TreatedAsAcquiredPropertyAmt"/>
											</xsl:call-template>
										</td>
										<td class="styDepTblCell" rowspan="2" style="border-right-width:0px; width: 31mm;
										 text-align:right">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="Sect48dCreditRegs1501InclsnAmt"/>
											</xsl:call-template>
										</td>
									</tr>
									<tr>
										<xsl:attribute name="class">
											<xsl:choose>
												<xsl:when test="position() mod 2 = 1">styDepTblRow1
												</xsl:when>
													<xsl:otherwise>styDepTblRow2
													</xsl:otherwise>
											</xsl:choose>
										</xsl:attribute>
										<td class="styDepTblCell" style="text-align: left; width:53mm;border-left-width: 0px">
											<xsl:choose>
												<xsl:when test="LessorForeignAddress !=''">
													<xsl:call-template name="PopulateForeignAddressTemplate">
														<xsl:with-param name="TargetNode" select="LessorForeignAddress"/>
													</xsl:call-template>
												</xsl:when>
												<xsl:otherwise>
													<xsl:call-template name="PopulateUSAddressTemplate">
														<xsl:with-param name="TargetNode" select="LessorUSAddress"/>
													</xsl:call-template>
												</xsl:otherwise>
											</xsl:choose>
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
</xsl:stylesheet>