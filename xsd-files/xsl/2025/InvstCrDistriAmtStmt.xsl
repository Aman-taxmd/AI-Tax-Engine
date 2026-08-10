<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:include href="PopulateTemplate.xsl"/>   
	<xsl:include href="CommonPathRef.xsl"/>   
	<xsl:include href="AddHeader.xsl"/>   
	<xsl:include href="AddOnTable.xsl"/>   
	<xsl:output method="html" indent="yes"/>
	<xsl:strip-space elements="*"/>
	<xsl:param name="DependencyData" select="$RtnDoc/InvstCrDistriAmtStmt"/>
	<xsl:param name="depDocTitle">
		<xsl:call-template name="PopulateDisplayName">
			<xsl:with-param name="TargetNode" select="$DependencyData"/>
		</xsl:call-template>
	</xsl:param>
	<xsl:template match="/">
		<xsl:text disable-output-escaping="yes">&lt;!DOCTYPE html&gt;</xsl:text>
		<html>
			<head>
				<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
				<title>
					<xsl:call-template name="FormTitle">
						<xsl:with-param name="RootElement" select="local-name($DependencyData)"/>
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
				<meta name="Description" content="{$depDocTitle}"/>
				<script language="JavaScript" src="{$ScriptPath}/FormDisplay.js" type="text/javascript"/>
				<xsl:call-template name="InitJS"/>
				<style type="text/css">
					<xsl:if test="not($Print) or $Print=''">
						<xsl:call-template name="AddOnStyle"/>
					</xsl:if>
				</style>
				<xsl:call-template name="GlobalStylesForm"/>
			</head>
			<body class="styBodyClass">
				<form name="Form3468">
					<!--<xsl:call-template name="DocumentHeader"/>-->
					<xsl:call-template name="DocumentHeaderDependency"/>
					<div class="styDepTitleLine">
						<span class="styDepTitle" style="">
							<xsl:value-of select="$depDocTitle"/>
						</span>
					</div>
					<!--Adding template for left over data  -->
					<xsl:call-template name="PopulateDepCommonLeftover">
						<xsl:with-param name="TargetNode" select="$DependencyData"/>
					</xsl:call-template>
					<!-- Start of Part I -->
					<div class="styBB" style="width:187mm; border-top-width: 1px;">
						<div class="styPartName" style="width:13mm;height:5mm;font-size:8pt">Part I</div>
						<div class="styPartDesc" style="width:150mm;height:auto;font-weight:normal;font-size:9pt;padding-top:1mm">
							<b>Information on Qualified Property or Qualified Facility</b> (see instructions)
					      </div>
					</div>
					<div class="styBB" style="width:187mm; border-bottom-width: 0;">
						<!-- Line 1 -->
						<div style="width:187mm;">
							<div class="styLNLeftNumBox" style="height:4mm;padding-left: 2mm;">1</div>
							<div class="styLNDesc" style="width:125mm;height:auto;">
                              If making an elective payment election or transfer election, enter the IRS-issued registration
							  number for the facility:
								<span class="styDotLn" style="float:right;">.......................</span>
							</div>
							<span class="styUnderlineAmount" style="float:left; width:54mm;border-bottom-width:1px; padding-top: 2.5mm; 
							 text-align:left">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$DependencyData/FacilityIRSIssdRegistrationNum"/>
								</xsl:call-template>
							</span>
						</div>
						<!-- Line 2a (i) -->
						<div style="width:187mm;">
							<div class="styLNLeftNumBox" style="height:4mm;padding-left:2mm">2a</div>
							<div class="styLNDesc" style="width:120mm;height:6mm;">
								<strong>(i)</strong> Enter the facility’s emissions value or rate (kg of CO2e per kg of qualified clean hydrogen):
							</div>
							<span class="styUnderlineAmount" style="float:left; width:59mm;border-bottom-width:1px;
							 text-align:left;height:4mm;padding-top:1mm">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$DependencyData/FacilityEmissionsValueOrRt"/>
								</xsl:call-template>
							</span>
						</div>
						<!-- Line 2a (ii) -->
						<div style="width:187mm;">
							<div class="styLNLeftNumBox" style="height:4mm;padding-left:2mm"/>
							<div class="styLNDesc" style="width:115mm;height:6mm;">
								<strong>(ii)</strong> Enter the Department of Energy (DOE) control number, if applicable (see instructions):
							</div>
							<span class="styUnderlineAmount" style="float:left; width: 64mm;border-bottom-width:1px;
							 text-align:left;height:4mm;">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$DependencyData/DOEControlNum"/>
								</xsl:call-template>
							</span>
						</div>
						<!-- Line 2b -->
						<div style="width:187mm; height: 20mm;">
							<div class="styLNLeftNumBox" style="height:4mm;padding-left:4mm;">b</div>
							<div class="styLNDesc" style="width:179mm;height:12mm; float: left;">
                            If you petitioned for a provisional emissions rate (PER), check the applicable box below and complete line 2b(iii), if applicable.
                        <!-- Line 2b (i) -->
						<div style="width:187mm;">
							<div class="styLNDesc" style="width:120mm;height:6mm;">
								<strong style="float: left; padding-top: 0.5mm;">(i)</strong> 
								<input type="checkbox" aria-label="Claiming section 48E credit" class="styCkbox" style="float: left;">
									<xsl:call-template name="PopulateCheckbox">
										<xsl:with-param name="TargetNode" select="$DependencyData/EmissionsValueRcvdDOEInd"/>
										<xsl:with-param name="BackupName">EmissionsValueRcvdDOEInd</xsl:with-param>
									</xsl:call-template>
								</input>
								<span style="padding-top: 1mm;">An emissions value was received from DOE.</span>
							</div>
						</div>
                        <!-- Line 2b (ii) -->
						<div style="width:187mm;">
							<div class="styLNDesc" style="width:120mm;height:6mm;">
								<strong style="float: left; padding-top: 0.75mm;">(ii)</strong> 
								<input type="checkbox" aria-label="Claiming section 48E credit" class="styCkbox" style="float: left; margin-left: 0.5mm;">
									<xsl:call-template name="PopulateCheckbox">
										<xsl:with-param name="TargetNode" select="$DependencyData/LCAModelInd"/>
										<xsl:with-param name="BackupName">LCAModelInd</xsl:with-param>
									</xsl:call-template>
								</input>
								<span style="padding-top: 1mm;">A designated lifecycle analysis (LCA) model was used to determine an emissions value.</span>
							</div>
						</div>
						<!-- Line 2b (iii) -->
						<div style="width:187mm;">
							<div class="styLNDesc" style="width:64mm;height:6mm;">
								<strong>(iii)</strong> Enter the DOE control number, if applicable:
							</div>
							<span class="styUnderlineAmount" style="float:left; width: 115mm;border-bottom-width:1px;
							 text-align:left;height:4mm;">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$DependencyData/PERDOEControlNum"/>
								</xsl:call-template>
							</span>
						</div>
							</div>
						</div>
						<!-- Line 3a -->
						<div style="width:187mm;">
							<div class="styLNLeftNumBox" style="height:4mm;padding-left:2mm;">3a</div>
							<div class="styLNDesc" style="width:64mm;height:5mm;">
								Type (solar, clean hydrogen, rehabilitation, etc.):
							</div>
							<span class="styUnderlineAmount" style="float:left; width:115mm;border-bottom-width:1px;
							 text-align:left;">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$DependencyData/FacilityTypeDesc"/>
								</xsl:call-template>
							</span>
						</div>
						<!-- Line 3b -->
						<div style="width:187mm;">
							<div class="styLNLeftNumBox" style="height:4mm;padding-left:4mm;">b</div>
							<div class="styLNDesc" style="width:35mm;height:5mm;">
								If different from filer, enter:
							</div>
						</div>
						<!-- Line 3b (i)-->
						<div style="width:187mm;">
							<div class="styLNLeftNumBox" style="height:4mm;padding-left:7mm;">(i)</div>
							<div class="styLNDesc" style="width:29mm;height:6mm; padding-left: 6mm; padding-right: 0.5mm;">
								Owner's name:
							</div>
							<span class="styUnderlineAmount" style="float:left; width:150mm;border-bottom-width:1px; text-align:left;">
								<xsl:choose>
									<xsl:when test="$DependencyData/FacilityOwnerBusinessName != ''">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$DependencyData/FacilityOwnerBusinessName/BusinessNameLine1Txt"/>
										</xsl:call-template>
										<span style="width:1mm;"/>
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$DependencyData/FacilityOwnerBusinessName/BusinessNameLine2Txt"/>
										</xsl:call-template>
									</xsl:when>
									<xsl:otherwise>
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$DependencyData/FacilityOwnerPersonNm"/>
										</xsl:call-template>
									</xsl:otherwise>
								</xsl:choose>
							</span>
						</div>
						<!-- Line 3b (ii)-->
						<div style="width:187mm;">
							<div class="styLNLeftNumBox" style="height:4mm;padding-left:7mm;">(ii)</div>
							<div class="styLNDesc" style="width:25mm;height:6mm; padding-left: 6mm;">
								Owner's TIN:
							</div>
							<span class="styUnderlineAmount" style="float:left; width:40mm;border-bottom-width:1px; text-align: left;">
								<xsl:choose>
									<xsl:when test="$DependencyData/FacilityOwnerSSN != ''">
										<xsl:call-template name="PopulateSSN">
											<xsl:with-param name="TargetNode" select="$DependencyData/FacilityOwnerSSN"/>
										</xsl:call-template>
									</xsl:when>
									<xsl:otherwise>
										<xsl:call-template name="PopulateEIN">
											<xsl:with-param name="TargetNode" select="$DependencyData/FacilityOwnerEIN"/>
										</xsl:call-template>
									</xsl:otherwise>
								</xsl:choose>
							</span>
						</div>
						<!-- Line 3c -->
						<div style="width:187mm;">
							<div class="styLNLeftNumBox" style="height:4mm;padding-left:4mm;">c</div>
							<div class="styLNDesc" style="width:48mm;height:5mm;">
								Address of the facility (if applicable):
							</div>
							<span class="styUnderlineAmount" style="float:left; width:131mm;border-bottom-width:1px;
							 text-align:left;">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$DependencyData/FacilityUSAddress/AddressLine1Txt"/>
								</xsl:call-template>
								<span style="width:1mm;"/>
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$DependencyData/FacilityUSAddress/AddressLine2Txt"/>
								</xsl:call-template>
								<br/>
							</span>
							<span style="padding-left:9mm">
								<span class="styUnderlineAmount" style="width:179mm;border-bottom-width:1px;
							 text-align:left; float: left">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$DependencyData/FacilityUSAddress/CityNm"/>
									</xsl:call-template> 
								<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$DependencyData/FacilityUSAddress/StateAbbreviationCd"/>
									</xsl:call-template>
									<span style="width:1mm"/>
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$DependencyData/FacilityUSAddress/ZIPCd"/>
									</xsl:call-template>
								</span>
							</span>
						</div>
						<!-- Line 3d -->
						<!-- Latitude and Longitude -->
						<div class="styStdDiv" style="width:187mm;height:13mm;padding-top:3mm;vertical-align:top;">
							<div class="styLNLeftLtrBox" style="padding-left: 4mm; padding-top: 2mm;">d</div>
							<div style="">
								Coordinates.
								<span style="width:2mm; vertical-align:top;padding-top:2mm;"/>
								<b>(i)</b> Latitude:
								<!-- Latitude/Longitutude may begin with a '+' or '-' -->
								<xsl:choose>
									<xsl:when test="substring($DependencyData/FacilityLatitudeNum/text(),1,1) = '+' or
									 substring($DependencyData/FacilityLatitudeNum/text(),1,1) = '-'">
										<div>
											<xsl:call-template name="PopulateIndividualSizableLetterBox">
												<xsl:with-param name="TargetNode" select="$DependencyData/FacilityLatitudeNum"/>
												<xsl:with-param name="BoxNum" select="1"/>
												<xsl:with-param name="BoxWidth" select="'5mm'"/>
												<xsl:with-param name="BoxHeight" select="'5mm'"/>
												<xsl:with-param name="BoxTopPadding" select="'.5mm'"/>
											</xsl:call-template>
										</div>
										<span style="width:3mm;"/>
										<div>
											<xsl:call-template name="PopulateIndividualSizableLetterBox">
												<xsl:with-param name="TargetNode" select="$DependencyData/FacilityLatitudeNum"/>
												<xsl:with-param name="BoxNum" select="2"/>
												<xsl:with-param name="BoxWidth" select="'5mm'"/>
												<xsl:with-param name="BoxHeight" select="'5mm'"/>
												<xsl:with-param name="BoxTopPadding" select="'.5mm'"/>
											</xsl:call-template>
										</div>
										<div>
											<xsl:call-template name="PopulateIndividualSizableLetterBox">
												<xsl:with-param name="TargetNode" select="$DependencyData/FacilityLatitudeNum"/>
												<xsl:with-param name="BoxNum" select="3"/>
												<xsl:with-param name="BoxWidth" select="'5mm'"/>
												<xsl:with-param name="BoxHeight" select="'5mm'"/>
												<xsl:with-param name="BoxTopPadding" select="'.5mm'"/>
											</xsl:call-template>
										</div>
										.
										<div>
											<xsl:call-template name="PopulateIndividualSizableLetterBox">
												<xsl:with-param name="TargetNode" select="$DependencyData/FacilityLatitudeNum"/>
												<xsl:with-param name="BoxNum" select="5"/>
												<xsl:with-param name="BoxWidth" select="'5mm'"/>
												<xsl:with-param name="BoxHeight" select="'5mm'"/>
												<xsl:with-param name="BoxTopPadding" select="'.5mm'"/>
											</xsl:call-template>
										</div>
										<div>
											<xsl:call-template name="PopulateIndividualSizableLetterBox">
												<xsl:with-param name="TargetNode" select="$DependencyData/FacilityLatitudeNum"/>
												<xsl:with-param name="BoxNum" select="6"/>
												<xsl:with-param name="BoxWidth" select="'5mm'"/>
												<xsl:with-param name="BoxHeight" select="'5mm'"/>
												<xsl:with-param name="BoxTopPadding" select="'.5mm'"/>
											</xsl:call-template>
										</div>
										<div>
											<xsl:call-template name="PopulateIndividualSizableLetterBox">
												<xsl:with-param name="TargetNode" select="$DependencyData/FacilityLatitudeNum"/>
												<xsl:with-param name="BoxNum" select="7"/>
												<xsl:with-param name="BoxWidth" select="'5mm'"/>
												<xsl:with-param name="BoxHeight" select="'5mm'"/>
												<xsl:with-param name="BoxTopPadding" select="'.5mm'"/>
											</xsl:call-template>
										</div>
										<div>
											<xsl:call-template name="PopulateIndividualSizableLetterBox">
												<xsl:with-param name="TargetNode" select="$DependencyData/FacilityLatitudeNum"/>
												<xsl:with-param name="BoxNum" select="8"/>
												<xsl:with-param name="BoxWidth" select="'5mm'"/>
												<xsl:with-param name="BoxHeight" select="'5mm'"/>
												<xsl:with-param name="BoxTopPadding" select="'.5mm'"/>
											</xsl:call-template>
										</div>
										<div>
											<xsl:call-template name="PopulateIndividualSizableLetterBox">
												<xsl:with-param name="TargetNode" select="$DependencyData/FacilityLatitudeNum"/>
												<xsl:with-param name="BoxNum" select="9"/>
												<xsl:with-param name="BoxWidth" select="'5mm'"/>
												<xsl:with-param name="BoxHeight" select="'5mm'"/>
												<xsl:with-param name="BoxTopPadding" select="'.5mm'"/>
											</xsl:call-template>
										</div>
										<div>
											<xsl:call-template name="PopulateIndividualSizableLetterBox">
												<xsl:with-param name="TargetNode" select="$DependencyData/FacilityLatitudeNum"/>
												<xsl:with-param name="BoxNum" select="10"/>
												<xsl:with-param name="BoxWidth" select="'5mm'"/>
												<xsl:with-param name="BoxHeight" select="'5mm'"/>
												<xsl:with-param name="BoxTopPadding" select="'.5mm'"/>
											</xsl:call-template>
										</div>
									</xsl:when>
									<xsl:otherwise>
										<div class="emptyLonLatBox"/>
										<span style="width:3mm"/>
										<div>
											<xsl:call-template name="PopulateIndividualSizableLetterBox">
												<xsl:with-param name="TargetNode" select="$DependencyData/FacilityLatitudeNum"/>
												<xsl:with-param name="BoxNum" select="1"/>
												<xsl:with-param name="BoxWidth" select="'5mm'"/>
												<xsl:with-param name="BoxHeight" select="'5mm'"/>
												<xsl:with-param name="BoxTopPadding" select="'.5mm'"/>
											</xsl:call-template>
										</div>
										<div>
											<xsl:call-template name="PopulateIndividualSizableLetterBox">
												<xsl:with-param name="TargetNode" select="$DependencyData/FacilityLatitudeNum"/>
												<xsl:with-param name="BoxNum" select="2"/>
												<xsl:with-param name="BoxWidth" select="'5mm'"/>
												<xsl:with-param name="BoxHeight" select="'5mm'"/>
												<xsl:with-param name="BoxTopPadding" select="'.5mm'"/>
											</xsl:call-template>
										</div>
										.
										<div>
											<xsl:call-template name="PopulateIndividualSizableLetterBox">
												<xsl:with-param name="TargetNode" select="$DependencyData/FacilityLatitudeNum"/>
												<xsl:with-param name="BoxNum" select="4"/>
												<xsl:with-param name="BoxWidth" select="'5mm'"/>
												<xsl:with-param name="BoxHeight" select="'5mm'"/>
												<xsl:with-param name="BoxTopPadding" select="'.5mm'"/>
											</xsl:call-template>
										</div>
										<div>
											<xsl:call-template name="PopulateIndividualSizableLetterBox">
												<xsl:with-param name="TargetNode" select="$DependencyData/FacilityLatitudeNum"/>
												<xsl:with-param name="BoxNum" select="5"/>
												<xsl:with-param name="BoxWidth" select="'5mm'"/>
												<xsl:with-param name="BoxHeight" select="'5mm'"/>
												<xsl:with-param name="BoxTopPadding" select="'.5mm'"/>
											</xsl:call-template>
										</div>
										<div>
											<xsl:call-template name="PopulateIndividualSizableLetterBox">
												<xsl:with-param name="TargetNode" select="$DependencyData/FacilityLatitudeNum"/>
												<xsl:with-param name="BoxNum" select="6"/>
												<xsl:with-param name="BoxWidth" select="'5mm'"/>
												<xsl:with-param name="BoxHeight" select="'5mm'"/>
												<xsl:with-param name="BoxTopPadding" select="'.5mm'"/>
											</xsl:call-template>
										</div>
										<div>
											<xsl:call-template name="PopulateIndividualSizableLetterBox">
												<xsl:with-param name="TargetNode" select="$DependencyData/FacilityLatitudeNum"/>
												<xsl:with-param name="BoxNum" select="7"/>
												<xsl:with-param name="BoxWidth" select="'5mm'"/>
												<xsl:with-param name="BoxHeight" select="'5mm'"/>
												<xsl:with-param name="BoxTopPadding" select="'.5mm'"/>
											</xsl:call-template>
										</div>
										<div>
											<xsl:call-template name="PopulateIndividualSizableLetterBox">
												<xsl:with-param name="TargetNode" select="$DependencyData/FacilityLatitudeNum"/>
												<xsl:with-param name="BoxNum" select="8"/>
												<xsl:with-param name="BoxWidth" select="'5mm'"/>
												<xsl:with-param name="BoxHeight" select="'5mm'"/>
												<xsl:with-param name="BoxTopPadding" select="'.5mm'"/>
											</xsl:call-template>
										</div>
										<div>
											<xsl:call-template name="PopulateIndividualSizableLetterBox">
												<xsl:with-param name="TargetNode" select="$DependencyData/FacilityLatitudeNum"/>
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
									<xsl:when test="substring($DependencyData/FacilityLongitudeNum/text(),1,1) = '+' or 
									 substring($DependencyData/FacilityLongitudeNum/text(),1,1) = '-'">
										<div>
											<xsl:call-template name="PopulateIndividualSizableLetterBox">
												<xsl:with-param name="TargetNode" select="$DependencyData/FacilityLongitudeNum"/>
												<xsl:with-param name="BoxNum" select="1"/>
												<xsl:with-param name="BoxWidth" select="'5mm'"/>
												<xsl:with-param name="BoxHeight" select="'5mm'"/>
												<xsl:with-param name="BoxTopPadding" select="'.5mm'"/>
											</xsl:call-template>
										</div>
										<span style="width:3mm"/>
										<div>
											<xsl:call-template name="PopulateIndividualSizableLetterBox">
												<xsl:with-param name="TargetNode" select="$DependencyData/FacilityLongitudeNum"/>
												<xsl:with-param name="BoxNum" select="2"/>
												<xsl:with-param name="BoxWidth" select="'5mm'"/>
												<xsl:with-param name="BoxHeight" select="'5mm'"/>
												<xsl:with-param name="BoxTopPadding" select="'.5mm'"/>
											</xsl:call-template>
										</div>
										<div>
											<xsl:call-template name="PopulateIndividualSizableLetterBox">
												<xsl:with-param name="TargetNode" select="$DependencyData/FacilityLongitudeNum"/>
												<xsl:with-param name="BoxNum" select="3"/>
												<xsl:with-param name="BoxWidth" select="'5mm'"/>
												<xsl:with-param name="BoxHeight" select="'5mm'"/>
												<xsl:with-param name="BoxTopPadding" select="'.5mm'"/>
											</xsl:call-template>
										</div>
										<div>
											<xsl:call-template name="PopulateIndividualSizableLetterBox">
												<xsl:with-param name="TargetNode" select="$DependencyData/FacilityLongitudeNum"/>
												<xsl:with-param name="BoxNum" select="4"/>
												<xsl:with-param name="BoxWidth" select="'5mm'"/>
												<xsl:with-param name="BoxHeight" select="'5mm'"/>
												<xsl:with-param name="BoxTopPadding" select="'.5mm'"/>
											</xsl:call-template>
										</div>
										.
										<div>
											<xsl:call-template name="PopulateIndividualSizableLetterBox">
												<xsl:with-param name="TargetNode" select="$DependencyData/FacilityLongitudeNum"/>
												<xsl:with-param name="BoxNum" select="6"/>
												<xsl:with-param name="BoxWidth" select="'5mm'"/>
												<xsl:with-param name="BoxHeight" select="'5mm'"/>
												<xsl:with-param name="BoxTopPadding" select="'.5mm'"/>
											</xsl:call-template>
										</div>
										<div>
											<xsl:call-template name="PopulateIndividualSizableLetterBox">
												<xsl:with-param name="TargetNode" select="$DependencyData/FacilityLongitudeNum"/>
												<xsl:with-param name="BoxNum" select="7"/>
												<xsl:with-param name="BoxWidth" select="'5mm'"/>
												<xsl:with-param name="BoxHeight" select="'5mm'"/>
												<xsl:with-param name="BoxTopPadding" select="'.5mm'"/>
											</xsl:call-template>
										</div>
										<div>
											<xsl:call-template name="PopulateIndividualSizableLetterBox">
												<xsl:with-param name="TargetNode" select="$DependencyData/FacilityLongitudeNum"/>
												<xsl:with-param name="BoxNum" select="8"/>
												<xsl:with-param name="BoxWidth" select="'5mm'"/>
												<xsl:with-param name="BoxHeight" select="'5mm'"/>
												<xsl:with-param name="BoxTopPadding" select="'.5mm'"/>
											</xsl:call-template>
										</div>
										<div>
											<xsl:call-template name="PopulateIndividualSizableLetterBox">
												<xsl:with-param name="TargetNode" select="$DependencyData/FacilityLongitudeNum"/>
												<xsl:with-param name="BoxNum" select="9"/>
												<xsl:with-param name="BoxWidth" select="'5mm'"/>
												<xsl:with-param name="BoxHeight" select="'5mm'"/>
												<xsl:with-param name="BoxTopPadding" select="'.5mm'"/>
											</xsl:call-template>
										</div>
										<div>
											<xsl:call-template name="PopulateIndividualSizableLetterBox">
												<xsl:with-param name="TargetNode" select="$DependencyData/FacilityLongitudeNum"/>
												<xsl:with-param name="BoxNum" select="10"/>
												<xsl:with-param name="BoxWidth" select="'5mm'"/>
												<xsl:with-param name="BoxHeight" select="'5mm'"/>
												<xsl:with-param name="BoxTopPadding" select="'.5mm'"/>
											</xsl:call-template>
										</div>
										<div>
											<xsl:call-template name="PopulateIndividualSizableLetterBox">
												<xsl:with-param name="TargetNode" select="$DependencyData/FacilityLongitudeNum"/>
												<xsl:with-param name="BoxNum" select="11"/>
												<xsl:with-param name="BoxWidth" select="'5mm'"/>
												<xsl:with-param name="BoxHeight" select="'5mm'"/>
												<xsl:with-param name="BoxTopPadding" select="'.5mm'"/>
											</xsl:call-template>
										</div>
									</xsl:when>
									<xsl:otherwise>
										<div class="emptyLonLatBox"/>
										<span style="width:3mm"/>
										<div>
											<xsl:call-template name="PopulateIndividualSizableLetterBox">
												<xsl:with-param name="TargetNode" select="$DependencyData/FacilityLongitudeNum"/>
												<xsl:with-param name="BoxNum" select="1"/>
												<xsl:with-param name="BoxWidth" select="'5mm'"/>
												<xsl:with-param name="BoxHeight" select="'5mm'"/>
												<xsl:with-param name="BoxTopPadding" select="'.5mm'"/>
											</xsl:call-template>
										</div>
										<div>
											<xsl:call-template name="PopulateIndividualSizableLetterBox">
												<xsl:with-param name="TargetNode" select="$DependencyData/FacilityLongitudeNum"/>
												<xsl:with-param name="BoxNum" select="2"/>
												<xsl:with-param name="BoxWidth" select="'5mm'"/>
												<xsl:with-param name="BoxHeight" select="'5mm'"/>
												<xsl:with-param name="BoxTopPadding" select="'.5mm'"/>
											</xsl:call-template>
										</div>
										<div>
											<xsl:call-template name="PopulateIndividualSizableLetterBox">
												<xsl:with-param name="TargetNode" select="$DependencyData/FacilityLongitudeNum"/>
												<xsl:with-param name="BoxNum" select="3"/>
												<xsl:with-param name="BoxWidth" select="'5mm'"/>
												<xsl:with-param name="BoxHeight" select="'5mm'"/>
												<xsl:with-param name="BoxTopPadding" select="'.5mm'"/>
											</xsl:call-template>
										</div>
										<div>
											<xsl:call-template name="PopulateIndividualSizableLetterBox">
												<xsl:with-param name="TargetNode" select="$DependencyData/FacilityLongitudeNum"/>
												<xsl:with-param name="BoxNum" select="5"/>
												<xsl:with-param name="BoxWidth" select="'5mm'"/>
												<xsl:with-param name="BoxHeight" select="'5mm'"/>
												<xsl:with-param name="BoxTopPadding" select="'.5mm'"/>
											</xsl:call-template>
										</div>
										<div>
											<xsl:call-template name="PopulateIndividualSizableLetterBox">
												<xsl:with-param name="TargetNode" select="$DependencyData/FacilityLongitudeNum"/>
												<xsl:with-param name="BoxNum" select="6"/>
												<xsl:with-param name="BoxWidth" select="'5mm'"/>
												<xsl:with-param name="BoxHeight" select="'5mm'"/>
												<xsl:with-param name="BoxTopPadding" select="'.5mm'"/>
											</xsl:call-template>
										</div>
										<div>
											<xsl:call-template name="PopulateIndividualSizableLetterBox">
												<xsl:with-param name="TargetNode" select="$DependencyData/FacilityLongitudeNum"/>
												<xsl:with-param name="BoxNum" select="7"/>
												<xsl:with-param name="BoxWidth" select="'5mm'"/>
												<xsl:with-param name="BoxHeight" select="'5mm'"/>
												<xsl:with-param name="BoxTopPadding" select="'.5mm'"/>
											</xsl:call-template>
										</div>
										<div>
											<xsl:call-template name="PopulateIndividualSizableLetterBox">
												<xsl:with-param name="TargetNode" select="$DependencyData/FacilityLongitudeNum"/>
												<xsl:with-param name="BoxNum" select="8"/>
												<xsl:with-param name="BoxWidth" select="'5mm'"/>
												<xsl:with-param name="BoxHeight" select="'5mm'"/>
												<xsl:with-param name="BoxTopPadding" select="'.5mm'"/>
											</xsl:call-template>
										</div>
										<div>
											<xsl:call-template name="PopulateIndividualSizableLetterBox">
												<xsl:with-param name="TargetNode" select="$DependencyData/FacilityLongitudeNum"/>
												<xsl:with-param name="BoxNum" select="9"/>
												<xsl:with-param name="BoxWidth" select="'5mm'"/>
												<xsl:with-param name="BoxHeight" select="'5mm'"/>
												<xsl:with-param name="BoxTopPadding" select="'.5mm'"/>
											</xsl:call-template>
										</div>
										<div>
											<xsl:call-template name="PopulateIndividualSizableLetterBox">
												<xsl:with-param name="TargetNode" select="$DependencyData/FacilityLongitudeNum"/>
												<xsl:with-param name="BoxNum" select="10"/>
												<xsl:with-param name="BoxWidth" select="'5mm'"/>
												<xsl:with-param name="BoxHeight" select="'5mm'"/>
												<xsl:with-param name="BoxTopPadding" select="'.5mm'"/>
											</xsl:call-template>
										</div>
									</xsl:otherwise>
								</xsl:choose>
							</div>
							<div style="margin-left:46mm;font-size:6pt;">
								<span>Enter a "+" (plus) or "-" (minus) sign in the first box.</span>
								<span style="width:17mm"/>
								<span>Enter a "+" (plus) or "-" (minus) sign in the first box.</span>
							</div>
						</div>
						<!-- Line 3e -->
						<div style="width:187mm;">
							<div class="styLNLeftNumBox" style="height:4mm;padding-left:4mm;">e</div>
							<div class="styLNDesc" style="width:179.0mm;height:8mm; float: left;">
                            Check this box if the property includes qualified interconnection property under section 48(a)(8) or 48E(b)(1)(B)

							<input type="checkbox" aria-label="Qualified interconnection property" class="styCkbox" style="float: right; padding-top: 0.5mm;">
									<xsl:call-template name="PopulateCheckbox">
										<xsl:with-param name="TargetNode" select="$DependencyData/QlfyInterconnectionPropInd"/>
										<xsl:with-param name="BackupName">QlfyInterconnectionPropInd</xsl:with-param>
									</xsl:call-template>
								</input>
								<span class="styDotLn" style="float:right; padding-top: 1mm">.......</span>
							</div>
						</div>
						<!-- Line 4 -->
						<div style="width:187mm;">
							<div class="styLNLeftNumBox" style="height:4mm;padding-left:2mm">4</div>
							<div class="styLNDesc" style="width:53mm;height:6mm;">
                              Date construction began (MM/DD/YYYY):
							</div>
							<span class="styUnderlineAmount" style="float:left; width:60mm;height:5mm;
							  border-bottom-width:1px; text-align:left;">
								<xsl:call-template name="PopulateMonthDayYear">
									<xsl:with-param name="TargetNode" select="$DependencyData/FacilityConstructionStartDt"/>
								</xsl:call-template>
							</span>
						</div>
						<!-- Line 5 -->
						<div style="width:187mm;">
							<div class="styLNLeftNumBox" style="height:4mm;padding-left:2mm">5</div>
							<div class="styLNDesc" style="width:51mm;height:5mm;">
                              Date placed in service (MM/DD/YYYY):
							</div>
							<span class="styUnderlineAmount" style="float:left; width:60mm;
							  border-bottom-width:1px; text-align:left;">
								<xsl:call-template name="PopulateMonthDayYear">
									<xsl:with-param name="TargetNode" select="$DependencyData/FacilityPlacedInServiceDt"/>
								</xsl:call-template>
							</span>
						</div>
						<!-- Line 6 -->
						<div style="width:187mm; padding-bottom: 2mm;">
							<div class="styLNLeftNumBox" style="padding-left:2mm; padding-top: 2mm;">6</div>
							<div style="padding-top: 1.5mm;">
								<label>Is the facility an expansion of an existing facility? </label>
								<div>
									<span class="styDotLn" style="padding: 0 1mm; float:right; width: 95mm;">........................</span>
								</div>
							</div>
							<span>
								<xsl:call-template name="PopulateSpan">
									<xsl:with-param name="TargetNode" select="$DependencyData/ExistingFacilityExpansionInd"/>
								</xsl:call-template>
								<input type="checkbox" aria-label="Expansion of existing facility Yes" class="styCkbox">
									<xsl:call-template name="PopulateYesCheckbox">
										<xsl:with-param name="TargetNode" select="$DependencyData/ExistingFacilityExpansionInd"/>
										<xsl:with-param name="BackupName">ExistingFacilityExpansionInd</xsl:with-param>
									</xsl:call-template>
								</input>
								<label>
									<xsl:call-template name="PopulateLabelYes">
										<xsl:with-param name="TargetNode" select="$DependencyData/ExistingFacilityExpansionInd"/>
										<xsl:with-param name="BackupName">ExistingFacilityExpansionInd</xsl:with-param>
									</xsl:call-template>Yes
									</label>
								<span style="width: 3mm"/>
								<input type="checkbox" aria-label="Expansion of existing facility No" class="styCkbox">
									<xsl:call-template name="PopulateNoCheckbox">
										<xsl:with-param name="TargetNode" select="$DependencyData/ExistingFacilityExpansionInd"/>
										<xsl:with-param name="BackupName">ExistingFacilityExpansionInd</xsl:with-param>
									</xsl:call-template>
								</input>
								<label>
									<xsl:call-template name="PopulateLabelNo">
										<xsl:with-param name="TargetNode" select="$DependencyData/ExistingFacilityExpansionInd"/>
										<xsl:with-param name="BackupName">ExistingFacilityExpansionInd</xsl:with-param>
									</xsl:call-template>No
									</label>
							</span>
						</div>
						<!-- Line 7 -->
						<div style="width:187mm;">
							<div class="styLNLeftNumBox" style="padding-left:2mm;">7</div>
							<div class="styLNDesc" style="width:170mm; height: 7mm;">
Does the property, facility, or project produce a net output of less than 1 megawatt (MW) alternating current (ac), or equivalent
thermal energy?
							</div>
						</div>
						<!-- Line 7a -->
						<div style="width:187mm;">
							<div class="styLNLeftNumBox" style="padding-left:4mm;">a</div>
							<span>
								<xsl:call-template name="PopulateSpan">
									<xsl:with-param name="TargetNode" select="$DependencyData/NetOutLess1MWOrThermalEgyCd"/>
								</xsl:call-template>
								<input type="checkbox" class="styCkbox">
									<xsl:if test="$DependencyData/NetOutLess1MWOrThermalEgyCd = 'YES'">
										<xsl:attribute name="checked">checked</xsl:attribute>
									</xsl:if>
									<xsl:call-template name="PopulateEnumeratedCheckbox">
										<xsl:with-param name="TargetNode" select="$DependencyData/NetOutLess1MWOrThermalEgyCd"/>
										<xsl:with-param name="DisplayedCheckboxValue" select="'YES'"/>
										<xsl:with-param name="BackupName">NetOutLess1MWOrThermalEgyCd[YES]
											  </xsl:with-param>
									</xsl:call-template>
								</input>Yes.
									<label>
									<xsl:call-template name="PopulateLabel">
										<xsl:with-param name="TargetNode" select="$DependencyData/NetOutLess1MWOrThermalEgyCd"/>
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
									<xsl:with-param name="TargetNode" select="$DependencyData/NetOutLess1MWOrThermalEgyCd"/>
								</xsl:call-template>
								<input type="checkbox" class="styCkbox">
									<xsl:if test="$DependencyData/NetOutLess1MWOrThermalEgyCd = 'NO'">
										<xsl:attribute name="checked">checked</xsl:attribute>
									</xsl:if>
									<xsl:call-template name="PopulateEnumeratedCheckbox">
										<xsl:with-param name="TargetNode" select="$DependencyData/NetOutLess1MWOrThermalEgyCd"/>
										<xsl:with-param name="DisplayedCheckboxValue" select="'NO'"/>
										<xsl:with-param name="BackupName">NetOutLess1MWOrThermalEgyCd[NO]
										  </xsl:with-param>
									</xsl:call-template>
								</input>No.
								<label>
									<xsl:call-template name="PopulateLabel">
										<xsl:with-param name="TargetNode" select="$DependencyData/NetOutLess1MWOrThermalEgyCd"/>
										<xsl:with-param name="DisplayedCheckboxValue" select="'NO'"/>
										<xsl:with-param name="BackupName">NetOutLess1MWOrThermalEgyCd[NO]
										  </xsl:with-param>
									</xsl:call-template>
								</label>
							</span>
						</div>
						<!-- Line 7c -->
						<div style="width:187mm; padding-bottom: 2mm;">
							<div class="styLNLeftNumBox" style="padding-left:4mm;">c</div>
							<span>
								<xsl:call-template name="PopulateSpan">
									<xsl:with-param name="TargetNode" select="$DependencyData/NetOutLess1MWOrThermalEgyCd"/>
								</xsl:call-template>
								<input type="checkbox" class="styCkbox">
									<xsl:if test="$DependencyData/NetOutLess1MWOrThermalEgyCd = 'N/A'">
										<xsl:attribute name="checked">checked</xsl:attribute>
									</xsl:if>
									<xsl:call-template name="PopulateEnumeratedCheckbox">
										<xsl:with-param name="TargetNode" select="$DependencyData/NetOutLess1MWOrThermalEgyCd"/>
										<xsl:with-param name="DisplayedCheckboxValue" select="'N/A'"/>
										<xsl:with-param name="BackupName">NetOutLess1MWOrThermalEgyCd[N/A]
											  </xsl:with-param>
									</xsl:call-template>
								</input>Not applicable; the facility doesn’t produce electricity.
									<label>
									<xsl:call-template name="PopulateLabel">
										<xsl:with-param name="TargetNode" select="$DependencyData/NetOutLess1MWOrThermalEgyCd"/>
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
								Does the property, facility, or project satisfy the prevailing wage and apprenticeship requirements?
							</div>
						</div>
						<!-- Line 8a -->
						<div style="width:187mm;">
							<div class="styLNLeftNumBox" style="padding-left:4mm;">a</div>
							<input type="checkbox" aria-label="Wage and apprenticeship section 48(C)(e)(5) and (6) question" class="styCkbox">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$DependencyData/ProjWageRqrSect48Ce5And6Ind"/>
									<xsl:with-param name="BackupName">F3468ProjWageRqrSect48Ce5And6Ind</xsl:with-param>
								</xsl:call-template>
							</input>
							<label>
								<xsl:call-template name="PopulateLabelYes">
									<xsl:with-param name="TargetNode" select="$DependencyData/ProjWageRqrSect48Ce5And6Ind"/>
									<xsl:with-param name="BackupName">F3468ProjWageRqrSect48Ce5And6Ind</xsl:with-param>
								</xsl:call-template>Yes, and sections 48C(e)(5) and (6) apply, and it was declared as provided per Notice 2023-18.
								</label>
						</div>
						<!-- Line 8b -->
						<div style="width:187mm;">
							<div class="styLNLeftNumBox" style="padding-left:4mm;">b</div>
							<input type="checkbox" aria-label="Wage and apprenticeship section 48(a)(10) and (11) question" class="styCkbox">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$DependencyData/ProjWageRqrSect48a10And11Ind"/>
									<xsl:with-param name="BackupName">F3468ProjWageRqrSect48a10And11Ind</xsl:with-param>
								</xsl:call-template>
							</input>
							<label>
								<xsl:call-template name="PopulateLabelYes">
									<xsl:with-param name="TargetNode" select="$DependencyData/ProjWageRqrSect48a10And11Ind"/>
									<xsl:with-param name="BackupName">F3468ProjWageRqrSect48a10And11Ind</xsl:with-param>
								</xsl:call-template>Yes, and either (i) section 48(a)(9)(B)(ii), 48E(a)(2)(A)(ii)(ll), or 48E(a)(2)(B)(ii)(ll) applies if construction began before January 29, 2023; <span style="padding-left: 13mm;">or (ii) sections 48(a)(10) and (11), or 48E(d)(3) and (4) apply.</span>
							</label>
						</div>
						<!-- Line 8c -->
						<div style="width:187mm;">
							<div class="styLNLeftNumBox" style="padding-left:4mm;">c</div>
							<input type="checkbox" aria-label="No wage and apprenticeship question" class="styCkbox">
								<xsl:call-template name="PopulateNoCheckbox">
									<xsl:with-param name="TargetNode" select="$DependencyData/ProjWageRqrNotStsfdInd"/>
									<xsl:with-param name="BackupName">F3468ProjWageRqrNotStsfdInd</xsl:with-param>
								</xsl:call-template>
							</input>
							<label>
								<xsl:call-template name="PopulateLabelNo">
									<xsl:with-param name="TargetNode" select="$DependencyData/ProjWageRqrNotStsfdInd"/>
									<xsl:with-param name="BackupName">F3468ProjWageRqrNotStsfdInd</xsl:with-param>
								</xsl:call-template>No.
								</label>
						</div>
						<!-- Line 8d -->
						<div style="width:187mm; padding-bottom: 2mm;">
							<div class="styLNLeftNumBox" style="padding-left:4mm;">d</div>
							<input type="checkbox" aria-label="Wage and apprenticeship question not applicable" class="styCkbox">
								<xsl:call-template name="PopulateNoCheckbox">
									<xsl:with-param name="TargetNode" select="$DependencyData/ProjWageRqrNAInd"/>
									<xsl:with-param name="BackupName">F3468ProjWageRqrNAInd</xsl:with-param>
								</xsl:call-template>
							</input>
							<label>
								<xsl:call-template name="PopulateLabelNo">
									<xsl:with-param name="TargetNode" select="$DependencyData/ProjWageRqrNAInd"/>
									<xsl:with-param name="BackupName">F3468ProjWageRqrNAInd</xsl:with-param>
								</xsl:call-template>Not applicable.
								</label>
						</div>
						<!-- Line 9 -->
						<div style="width:187mm;">
							<div class="styLNLeftNumBox" style="padding-left:2mm;">9</div>
							<div class="styLNDesc" style="width:170mm;">
								Does the property, facility, or project qualify for a domestic content bonus credit per section 48(a)(12)(B) or 48E(a)(3)(B)?
							</div>
						</div>
						<!-- Line 9a -->
						<div style="width:187mm;">
							<div class="styLNLeftNumBox" style="padding-left:4mm;">a</div>
							<input type="checkbox" aria-label="section 48(a)(12)(B) or 48E(a)(3)(B) satisfied question" class="styCkbox">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$DependencyData/DomContentCrStsfdPctInd"/>
									<xsl:with-param name="BackupName">F3468DomContentCrStsfdPctInd</xsl:with-param>
								</xsl:call-template>
							</input>
							<label>
								<xsl:call-template name="PopulateLabelYes">
									<xsl:with-param name="TargetNode" select="$DependencyData/DomContentCrStsfdPctInd"/>
									<xsl:with-param name="BackupName">F3468DomContentCrStsfdPctInd</xsl:with-param>
								</xsl:call-template>Yes, and section 48(a)(9)(B), 48E(a)(2)(A)(ii), or 48E(a)(2)(B)(ii) is satisfied (10% bonus). Attach the required information.
								</label>
						</div>
						<!-- Line 9b -->
						<div style="width:187mm;">
							<div class="styLNLeftNumBox" style="padding-left:4mm;">b</div>
							<input type="checkbox" aria-label="section 48(a)(12)(B) or 48E(a)(3)(B) not satisfied question" class="styCkbox">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$DependencyData/DomContentCrNotStsfdPctInd"/>
									<xsl:with-param name="BackupName">F3468DomContentCrNotStsfdPctInd</xsl:with-param>
								</xsl:call-template>
							</input>
							<label>
								<xsl:call-template name="PopulateLabelYes">
									<xsl:with-param name="TargetNode" select="$DependencyData/DomContentCrNotStsfdPctInd"/>
									<xsl:with-param name="BackupName">F3468DomContentCrNotStsfdPctInd</xsl:with-param>
								</xsl:call-template>Yes, and section 48(a)(9)(B), 48E(a)(2)(A)(ii), or 48E(a)(2)(B)(ii) is <b>not</b> satisfied (2% bonus). Attach the required information.
								</label>
						</div>
						<!-- Line 9c -->
						<div style="width:187mm; padding-bottom: 2mm;">
							<div class="styLNLeftNumBox" style="padding-left:4mm;">c</div>
							<input type="checkbox" aria-label="No 48(a)(12)(B) or 48E(a)(3)(B) question" class="styCkbox">
								<xsl:call-template name="PopulateNoCheckbox">
									<xsl:with-param name="TargetNode" select="$DependencyData/DomContentCrNotQlfyInd"/>
									<xsl:with-param name="BackupName">F3468DomContentCrNotQlfyInd</xsl:with-param>
								</xsl:call-template>
							</input>
							<label>
								<xsl:call-template name="PopulateLabelNo">
									<xsl:with-param name="TargetNode" select="$DependencyData/DomContentCrNotQlfyInd"/>
									<xsl:with-param name="BackupName">F3468DomContentCrNotQlfyInd</xsl:with-param>
								</xsl:call-template>No.
								</label>
						</div>
						<!-- Line 10 -->
						<div style="width:187mm;">
							<div class="styLNLeftNumBox" style="padding-left:2mm;">10</div>
							<div class="styLNDesc" style="width:170mm;">
								Does the property, facility, or project qualify for an energy community bonus credit per section 48(a)(14) or 48E(a)(3)(A)?
							</div>
						</div>
						<!-- Line 10a -->
						<div style="width:187mm;">
							<div class="styLNLeftNumBox" style="padding-left:4mm;">a</div>
							<input type="checkbox" aria-label="section 45(b)(9)(B) and section 48(a)(9)(B) satisfied question 10%" class="styCkbox">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$DependencyData/EgyComBonusCrStsfdPctInd"/>
									<xsl:with-param name="BackupName">EgyComBonusCrStsfdPctInd</xsl:with-param>
								</xsl:call-template>
							</input>
							<label>
								<xsl:call-template name="PopulateLabelYes">
									<xsl:with-param name="TargetNode" select="$DependencyData/EgyComBonusCrStsfdPctInd"/>
									<xsl:with-param name="BackupName">EgyComBonusCrStsfdPctInd</xsl:with-param>
								</xsl:call-template>Yes, and section 48(a)(9)(B), 48E(a)(2)(A)(ii), or 48E(a)(2)(B)(ii) is satisfied (10% bonus).
								</label>
						</div>
						<!-- Line 10b -->
						<div style="width:187mm;">
							<div class="styLNLeftNumBox" style="padding-left:4mm;">b</div>
							<input type="checkbox" aria-label="section 45(b)(9)(B) and section 48(a)(9)(B) not satisfied question 2%" class="styCkbox">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$DependencyData/EgyComBonusCrNotStsfdPctInd"/>
									<xsl:with-param name="BackupName">EgyComBonusCrNotStsfdPctInd</xsl:with-param>
								</xsl:call-template>
							</input>
							<label>
								<xsl:call-template name="PopulateLabelYes">
									<xsl:with-param name="TargetNode" select="$DependencyData/EgyComBonusCrNotStsfdPctInd"/>
									<xsl:with-param name="BackupName">EgyComBonusCrNotStsfdPctInd</xsl:with-param>
								</xsl:call-template>Yes, and section 48(a)(9)(B), 48E(a)(2)(A)(ii), or 48E(a)(2)(B)(ii) is <b>not</b> satisfied (2% bonus).
								</label>
						</div>
						<!-- Line 10c -->
						<div style="width:187mm; padding-bottom: 2mm;">
							<div class="styLNLeftNumBox" style="padding-left:4mm;">c</div>
							<input type="checkbox" aria-label="No 45(b)(9)(B) question" class="styCkbox">
								<xsl:call-template name="PopulateNoCheckbox">
									<xsl:with-param name="TargetNode" select="$DependencyData/EgyComBonusCrNotQlfyInd"/>
									<xsl:with-param name="BackupName">F3468EgyComBonusCrNotQlfyInd</xsl:with-param>
								</xsl:call-template>
							</input>
							<label>
								<xsl:call-template name="PopulateLabelNo">
									<xsl:with-param name="TargetNode" select="$DependencyData/EgyComBonusCrNotQlfyInd"/>
									<xsl:with-param name="BackupName">F3468EgyComBonusCrNotQlfyInd</xsl:with-param>
								</xsl:call-template>No.
								</label>
						</div>
						<!-- Line 11 -->
						<div style="width:187mm;">
							<div class="styLNLeftNumBox" style="padding-left:2mm;">11</div>
							<div class="styLNDesc" style="width:170mm; height: 7mm;">
Does the property, facility, or project qualify for the low-income communities bonus credit under section 48(e)(2) or 48E(h)(2)?
<br/>(The facility must have received an allocation of capacity limitation.)
							</div>
						</div>
						<!-- Line 11a -->
						<div style="width:187mm;">
							<div class="styLNLeftNumBox" style="padding-left:4mm;">a</div>
							<input type="checkbox" aria-label="low incm community solar or wind facility" class="styCkbox">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$DependencyData/SolarWindCrComSect45DeInd"/>
									<xsl:with-param name="BackupName">SolarWindCrComSect45DeInd</xsl:with-param>
								</xsl:call-template>
							</input>
							<label>
								<xsl:call-template name="PopulateLabelYes">
									<xsl:with-param name="TargetNode" select="$DependencyData/SolarWindCrComSect45DeInd"/>
									<xsl:with-param name="BackupName">F3468SolarWindCrComSect45DeInd</xsl:with-param>
								</xsl:call-template>Yes, and the facility is located in a low-income community per 
									 section 45D(e) (10% bonus).
								</label>
						</div>
						<!-- Line 11b -->
						<div style="width:187mm;">
							<div class="styLNLeftNumBox" style="padding-left:4mm;">b</div>
							<input type="checkbox" aria-label="low incm community solar or wind facility on Indian land" class="styCkbox">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$DependencyData/SolarWindCrComIndianLandInd"/>
									<xsl:with-param name="BackupName">SolarWindCrComIndianLandInd</xsl:with-param>
								</xsl:call-template>
							</input>
							<label>
								<xsl:call-template name="PopulateLabelYes">
									<xsl:with-param name="TargetNode" select="$DependencyData/SolarWindCrComIndianLandInd"/>
									<xsl:with-param name="BackupName">F3468SolarWindCrComIndianLandInd</xsl:with-param>
								</xsl:call-template>Yes, and the facility is located on Indian land per section 2601(2) 
									 of P.L. 102-486 (10% bonus).
								</label>
						</div>
						<!-- Line 11c -->
						<div style="width:187mm;">
							<div class="styLNLeftNumBox" style="padding-left:4mm;">c</div>
							<input type="checkbox" aria-label="low incm community solar or wind facility is a residential building" class="styCkbox">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$DependencyData/SolarWindCrComRsdntlBldgInd"/>
									<xsl:with-param name="BackupName">SolarWindCrComRsdntlBldgInd</xsl:with-param>
								</xsl:call-template>
							</input>
							<label>
								<xsl:call-template name="PopulateLabelYes">
									<xsl:with-param name="TargetNode" select="$DependencyData/SolarWindCrComRsdntlBldgInd"/>
									<xsl:with-param name="BackupName">F3468SolarWindCrComRsdntlBldgInd</xsl:with-param>
								</xsl:call-template>Yes, and the facility is part of a qualified low-income residential building project facility 
									per section 48(e)(2)(B) or 48E(h)(2)(B) <br/>
								<span style="padding-left: 13mm;">(20% bonus).</span>
							</label>
						</div>
						<!-- Line 11d -->
						<div style="width:187mm;">
							<div class="styLNLeftNumBox" style="padding-left:4mm;">d</div>
							<input type="checkbox" aria-label="low incm community solar or wind facility is econ benefit project" class="styCkbox">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$DependencyData/SolarWindCrComEconomicBnftInd"/>
									<xsl:with-param name="BackupName">F3468SolarWindCrComEconomicBnftInd</xsl:with-param>
								</xsl:call-template>
							</input>
							<label>
								<xsl:call-template name="PopulateLabelYes">
									<xsl:with-param name="TargetNode" select="$DependencyData/SolarWindCrComEconomicBnftInd"/>
									<xsl:with-param name="BackupName">SolarWindCrComEconomicBnftInd</xsl:with-param>
								</xsl:call-template>Yes, and the facility is part of a qualified low-income economic benefit project facility 
									per section 48(e)(2)(C) or 48E(h)(2)(C) <br/>
								<span style="padding-left: 13mm;">(20% bonus).</span>
							</label>
						</div>
						<!-- Line 11e -->
						<div style="width:187mm;">
							<div class="styLNLeftNumBox" style="padding-left:4mm">e</div>
							<div class="styLNDesc" style="width:106mm;height:auto;padding-left:1mm">
                             If “Yes” to line 11a, 11b, 11c, or 11d, enter your 48(e) or 48E(h) Control Number:
							</div>
							<span class="styUnderlineAmount" style="float:left; width:73mm;border-bottom-width:1px; 
							 text-align:left">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$DependencyData/Section48eOr48EhControlNum"/>
								</xsl:call-template>
							</span>
						</div>
						<!-- Line 11f -->
						<div style="width:187mm;">
							<div class="styLNLeftNumBox" style="padding-left:4mm">f</div>
							<div class="styLNDesc" style="width:123mm;height:auto;padding-left:1mm">
                             Enter the originating pass-through entity’s employer identification number (EIN) (if applicable):
							</div>
							<span class="styUnderlineAmount" style="float:left; width:56mm;border-bottom-width:1px; 
							 text-align:left">
								<xsl:call-template name="PopulateEIN">
									<xsl:with-param name="TargetNode" select="$DependencyData/OrigPassThruEntityEIN"/>
								</xsl:call-template>
							</span>
						</div>
						<!-- Line 11g -->
						<div style="width:187mm;">
							<div class="styLNLeftNumBox" style="padding-left:4mm;">g</div>
							<input type="checkbox" aria-label="no low incm community solar or wind facility" class="styCkbox">
								<xsl:call-template name="PopulateNoCheckbox">
									<xsl:with-param name="TargetNode" select="$DependencyData/SolarWindCrComNotQlfyInd"/>
									<xsl:with-param name="BackupName">F3468SolarWindCrComNotQlfyInd</xsl:with-param>
								</xsl:call-template>
							</input>
							<label>
								<xsl:call-template name="PopulateLabelNo">
									<xsl:with-param name="TargetNode" select="$DependencyData/SolarWindCrComNotQlfyInd"/>
									<xsl:with-param name="BackupName">SolarWindCrComNotQlfyInd</xsl:with-param>
								</xsl:call-template>No.
								</label>
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
						<div class="pageEnd"/>
						<div style="page-break-after:always"/>
						<div style="width:187mm;padding-top:1mm;float:left">
						  Form 3468 (2025)
							<span style="width:15mm;float:right; padding-left: 22px;">Page 
								<span class="styBoldText" style="font-size:8pt;">2</span>
							</span>
						</div>
						<!-- Part I cont. -->
						<div class="styBB" style="width:187mm;border-top-width:2px;">
							<div class="styPartName" style="width:15mm;height:7mm; font-size:8pt;padding-top:2mm;">Part I</div>
							<div class="styPartDesc" style="width:170mm;height:auto;font-weight:normal;font-size:9pt;
						 padding-top:1mm">
								<b>Information on Qualified Property or Qualified Facility</b> (see instructions) <em>(continued)</em>
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
							<input type="checkbox" aria-label="solar energy nameplate capacity" class="styCkbox">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$DependencyData/SolarEnergyPropOrFacilityInd"/>
									<xsl:with-param name="BackupName">SolarEnergyPropOrFacilityInd</xsl:with-param>
								</xsl:call-template>
							</input>
							<label>
								<xsl:call-template name="PopulateLabelYes">
									<xsl:with-param name="TargetNode" select="$DependencyData/SolarEnergyPropOrFacilityInd"/>
									<xsl:with-param name="BackupName">SolarEnergyPropOrFacilityInd</xsl:with-param>
								</xsl:call-template>Solar.
								</label>
						</div>
						<!-- Line 12a (i)-->
						<div style="width:187mm; padding-left: 4mm;">
							<div class="styLNLeftNumBox" style="padding-left:4.5mm; padding-top: 1mm;">(i)</div>
							<label style="padding-left: 2mm;">Nameplate capacity:</label>
							<div>
								<span class="styUnderlineAmount" style="float:left; width:40mm;border-bottom-width:1px; 
									 text-align:left">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$DependencyData/DCNameplateCapKWQty"/>
									</xsl:call-template>
								</span>
								<div class="styLNDesc" style="width:45mm;padding-top:1mm;
										padding-left:1mm;">
										kilowatt (kW) direct current (dc)
									</div>
							</div>
						</div>
						<!-- Line 12a (ii)-->
						<div style="width:187mm; padding-left: 4mm;">
							<div class="styLNLeftNumBox" style="padding-left:4.5mm; padding-top: 1mm;">(ii)</div>
							<label style="padding-left: 2mm;">Nameplate capacity:</label>
							<div>
								<span class="styUnderlineAmount" style="float:left; width:40mm;border-bottom-width:1px; 
									 text-align:left">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$DependencyData/ACNameplateCapKWQty"/>
									</xsl:call-template>
								</span>
								<div class="styLNDesc" style="width:45mm;padding-top:1mm;
										padding-left:1mm;">
										kW ac
									</div>
							</div>
						</div>
						<!-- Line 12a (iii)-->
						<div style="width:187mm; padding-left: 4mm;">
							<div class="styLNLeftNumBox" style="padding-left:4.5mm; padding-top: 1mm;">(iii)</div>
							<div style="padding-top: 1mm;">
								<label style="padding-left: 3mm;">Check here if the solar energy property or facility includes a solar tracking device </label>
								<div>
									<span class="styDotLn" style="float:right; width: 45mm;">.................</span>
								</div>
							</div>
							<input style="float:right;" type="checkbox" aria-label="solar energy property or facility includes solar tracking device" class="styCkbox">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$DependencyData/SolarTrackingDeviceInd"/>
									<xsl:with-param name="BackupName">SolarTrackingDeviceInd</xsl:with-param>
								</xsl:call-template>
							</input>
						</div>
						<!-- Line 12b -->
						<div style="width:187mm;">
							<div class="styLNLeftNumBox" style="padding-left:4mm;">b</div>
							<input type="checkbox" aria-label="small wind energy nameplate capacity" class="styCkbox">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$DependencyData/WindEnergyPropOrFacilityInd"/>
									<xsl:with-param name="BackupName">F3468DCSmallWindEnergyPropCapInd</xsl:with-param>
								</xsl:call-template>
							</input>
							<label>
								<xsl:call-template name="PopulateLabelYes">
									<xsl:with-param name="TargetNode" select="$DependencyData/WindEnergyPropOrFacilityInd"/>
									<xsl:with-param name="BackupName">F3468WindEnergyPropOrFacilityInd</xsl:with-param>
								</xsl:call-template>Wind nameplate capacity:
								</label>
							<div>
								<span class="styUnderlineAmount" style="float:left; width:40mm;border-bottom-width:1px; 
									 text-align:left">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$DependencyData/ACNameplateCapWindEgyPropKWQty"/>
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
							<input type="checkbox" aria-label="solar energy nameplate capacity" class="styCkbox">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$DependencyData/OtherEnergyPropOrFacilityInd"/>
									<xsl:with-param name="BackupName">OtherEnergyPropOrFacilityInd</xsl:with-param>
								</xsl:call-template>
							</input>
							<label>
								<xsl:call-template name="PopulateLabelYes">
									<xsl:with-param name="TargetNode" select="$DependencyData/OtherEnergyPropOrFacilityInd"/>
									<xsl:with-param name="BackupName">OtherEnergyPropOrFacilityInd</xsl:with-param>
								</xsl:call-template>Other.
								</label>
						</div>
						<!-- Line 12c (i)-->
						<div style="width:187mm; padding-left: 4mm;">
							<div class="styLNLeftNumBox" style="padding-left:4.5mm; padding-top: 1mm;">(i)</div>
							<label style="padding-left: 2mm; padding-right: 1mm;">Type:</label>
							<div>
								<span class="styUnderlineAmount" style="float:left; width:164mm;border-bottom-width:1px; 
									 text-align:left">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$DependencyData/PropOrFacilityTypeDesc"/>
									</xsl:call-template>
								</span>
							</div>
						</div>
						<!-- Line 12c (ii)-->
						<div style="width:187mm; padding-left: 4mm;">
							<div class="styLNLeftNumBox" style="padding-left:4.5mm; padding-top: 1mm;">(ii)</div>
							<label style="padding-left: 2mm;">Nameplate capacity:</label>
							<div>
								<span class="styUnderlineAmount" style="float:left; width:40mm;border-bottom-width:1px; 
									 text-align:left">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$DependencyData/NameplateCapKWQty"/>
									</xsl:call-template>
								</span>
								<div class="styLNDesc" style="width:45mm;padding-top:1mm;
										padding-left:1mm;">
										kW 
									</div>
							</div>
						</div>
						<!-- Line 12c (iii)-->
						<div style="width:187mm; padding-left: 4mm; padding-top: 1mm;">
							<div class="styLNLeftNumBox" style="padding-left:4.5mm; padding-top: 1mm;">(iii)</div>
							<div>
								<label style="padding-left: 3mm;">Kilowatt type: </label>
								<input type="checkbox" class="styCkbox">
									<xsl:if test="$DependencyData/ElectricCurrentTypeCd = 'AC'">
										<xsl:attribute name="checked">checked</xsl:attribute>
									</xsl:if>
									<xsl:call-template name="PopulateEnumeratedCheckbox">
										<xsl:with-param name="TargetNode" select="$DependencyData/ElectricCurrentTypeCd"/>
										<xsl:with-param name="DisplayedCheckboxValue" select="'AC'"/>
										<xsl:with-param name="BackupName">ElectricCurrentTypeCd
										  </xsl:with-param>
									</xsl:call-template>
								</input>
								<label>
									<xsl:call-template name="PopulateLabel">
										<xsl:with-param name="TargetNode" select="$DependencyData/ElectricCurrentTypeCd"/>
										<xsl:with-param name="DisplayedCheckboxValue" select="'AC'"/>
										<xsl:with-param name="BackupName">ElectricCurrentTypeCd
										  </xsl:with-param>
									</xsl:call-template>
								</label> ac
								<input type="checkbox" class="styCkbox">
									<xsl:if test="$DependencyData/ElectricCurrentTypeCd = 'DC'">
										<xsl:attribute name="checked">checked</xsl:attribute>
									</xsl:if>
									<xsl:call-template name="PopulateEnumeratedCheckbox">
										<xsl:with-param name="TargetNode" select="$DependencyData/ElectricCurrentTypeCd"/>
										<xsl:with-param name="DisplayedCheckboxValue" select="'DC'"/>
										<xsl:with-param name="BackupName">ElectricCurrentTypeCd
										  </xsl:with-param>
									</xsl:call-template>
								</input>
								<label>
									<xsl:call-template name="PopulateLabel">
										<xsl:with-param name="TargetNode" select="$DependencyData/ElectricCurrentTypeCd"/>
										<xsl:with-param name="DisplayedCheckboxValue" select="'DC'"/>
										<xsl:with-param name="BackupName">ElectricCurrentTypeCd
										  </xsl:with-param>
									</xsl:call-template>
								</label> dc
							</div>
						</div>
						<!-- Line 12d -->
						<div style="width:187mm;">
							<div class="styLNLeftNumBox" style="padding-left:4mm;">d</div>
							<input type="checkbox" aria-label="solar energy nameplate capacity" class="styCkbox">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$DependencyData/EnergyStorageInd"/>
									<xsl:with-param name="BackupName">EnergyStorageInd</xsl:with-param>
								</xsl:call-template>
							</input>
							<label>
								<xsl:call-template name="PopulateLabelYes">
									<xsl:with-param name="TargetNode" select="$DependencyData/EnergyStorageInd"/>
									<xsl:with-param name="BackupName">EnergyStorageInd</xsl:with-param>
								</xsl:call-template>Energy storage.
								</label>
						</div>
						<!-- Line 12d (i)-->
						<div style="width:187mm; padding-left: 4mm;">
							<div class="styLNLeftNumBox" style="padding-left:4.5mm; padding-top: 1mm;">(i)</div>
							<label style="padding-left: 2mm;">Power capacity rating:</label>
							<div>
								<span class="styUnderlineAmount" style="float:left; width:40mm;border-bottom-width:1px; 
									 text-align:left">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$DependencyData/PowerCapacityRatingKWQty"/>
									</xsl:call-template>
								</span>
								<div class="styLNDesc" style="width:45mm;padding-top:1mm;
										padding-left:1mm;">
										kW
									</div>
							</div>
						</div>
						<!-- Line 12d (ii)-->
						<div style="width:187mm; padding-left: 4mm;">
							<div class="styLNLeftNumBox" style="padding-left:4.5mm; padding-top: 1mm;">(ii)</div>
							<label style="padding-left: 2mm;">Energy storage capacity:</label>
							<div>
								<span class="styUnderlineAmount" style="float:left; width:40mm;border-bottom-width:1px; 
									 text-align:left">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$DependencyData/EnergyStorageCapacityKWHQty"/>
									</xsl:call-template>
								</span>
								<div class="styLNDesc" style="width:45mm;padding-top:1mm;
										padding-left:1mm;">
										kilowatt-hours (kWh)
									</div>
							</div>
						</div>
						<!-- Line 12d (iii)-->
						<div style="width:187mm; padding-left: 4mm;">
							<div class="styLNLeftNumBox" style="padding-left:4.5mm; padding-top: 1.5mm;">(iii)</div>
							<div style="padding-top: 1mm;">
								<label style="padding-left: 3mm;">Is the energy storage installed in connection with the solar or wind facility a thermal storage? </label>
								<div>
									<span class="styDotLn" style="padding: 0 1mm; float:right; width: 33mm;">........</span>
								</div>
							</div>
							<span>
								<xsl:call-template name="PopulateSpan">
									<xsl:with-param name="TargetNode" select="$DependencyData/ThermalStorSolarWindCnnctInd"/>
								</xsl:call-template>
								<input type="checkbox" aria-label="Thermal storage of solar or wind facility Yes" class="styCkbox">
									<xsl:call-template name="PopulateYesCheckbox">
										<xsl:with-param name="TargetNode" select="$DependencyData/ThermalStorSolarWindCnnctInd"/>
										<xsl:with-param name="BackupName">ThermalStorSolarWindCnnctInd</xsl:with-param>
									</xsl:call-template>
								</input>
								<label>
									<xsl:call-template name="PopulateLabelYes">
										<xsl:with-param name="TargetNode" select="$DependencyData/ThermalStorSolarWindCnnctInd"/>
										<xsl:with-param name="BackupName">ThermalStorSolarWindCnnctInd</xsl:with-param>
									</xsl:call-template>Yes
									</label>
								<span style="width: 3mm"/>
								<input type="checkbox" aria-label="Thermal storage of solar or wind facility No" class="styCkbox">
									<xsl:call-template name="PopulateNoCheckbox">
										<xsl:with-param name="TargetNode" select="$DependencyData/ThermalStorSolarWindCnnctInd"/>
										<xsl:with-param name="BackupName">ThermalStorSolarWindCnnctInd</xsl:with-param>
									</xsl:call-template>
								</input>
								<label>
									<xsl:call-template name="PopulateLabelNo">
										<xsl:with-param name="TargetNode" select="$DependencyData/ThermalStorSolarWindCnnctInd"/>
										<xsl:with-param name="BackupName">ThermalStorSolarWindCnnctInd</xsl:with-param>
									</xsl:call-template>No
									</label>
							</span>
						</div>
						<!-- Line 12e -->
						<div style="width:187mm;">
							<div class="styLNLeftNumBox" style="padding-left:4mm;">e</div>
							<span>
								<xsl:call-template name="PopulateSpan">
									<xsl:with-param name="TargetNode" select="$DependencyData/NotApplicableInd"/>
								</xsl:call-template>
								<input type="checkbox" aria-label="no nameplate or storage capacity" class="styCkbox">
									<xsl:call-template name="PopulateNoCheckbox">
										<xsl:with-param name="TargetNode" select="$DependencyData/NotApplicableInd"/>
										<xsl:with-param name="BackupName">NotApplicableInd
											</xsl:with-param>
									</xsl:call-template>
								</input>
								<label>
									<xsl:call-template name="PopulateLabelNo">
										<xsl:with-param name="TargetNode" select="$DependencyData/NotApplicableInd"/>
										<xsl:with-param name="BackupName">NotApplicableInd
											</xsl:with-param>
									</xsl:call-template>Not applicable.
									</label>
							</span>
						</div>
					</div>
					<!-- Line 13 -->
					<div style="width:185mm;">
						<div class="styLNLeftNumBox" style="height:5mm;padding-left:2mm;padding-top:2mm">
						 13
						</div>
						<div class="styLNDesc" style="width:177mm;height:auto;">
						 Are you claiming the investment credit as a lessee based on a section 48(d) (as in effect on
						  November 4, 1990) election?
							  <span style="display: inline;">
								<xsl:call-template name="PopulateSpan">
									<xsl:with-param name="TargetNode" select="$DependencyData/InvstCreditLesseeSect48dInd"/>
								</xsl:call-template>
								<input type="checkbox" aria-label="investment credit based on sect 48(d) question Yes" class="styCkbox">
									<xsl:call-template name="PopulateYesCheckbox">
										<xsl:with-param name="TargetNode" select="$DependencyData/InvstCreditLesseeSect48dInd"/>
										<xsl:with-param name="BackupName">InvstCreditLesseeSect48dInd</xsl:with-param>
									</xsl:call-template>
								</input>
								<label>
									<xsl:call-template name="PopulateLabelYes">
										<xsl:with-param name="TargetNode" select="$DependencyData/InvstCreditLesseeSect48dInd"/>
										<xsl:with-param name="BackupName">InvstCreditLesseeSect48dInd</xsl:with-param>
									</xsl:call-template>Yes
								</label>
								<span style="width: 4mm"/>
								<input type="checkbox" aria-label="investment credit based on sect 48(d) question No" class="styCkbox">
									<xsl:call-template name="PopulateNoCheckbox">
										<xsl:with-param name="TargetNode" select="$DependencyData/InvstCreditLesseeSect48dInd"/>
										<xsl:with-param name="BackupName">InvstCreditLesseeSect48dInd</xsl:with-param>
									</xsl:call-template>
								</input>
								<label>
									<xsl:call-template name="PopulateLabelNo">
										<xsl:with-param name="TargetNode" select="$DependencyData/InvstCreditLesseeSect48dInd"/>
										<xsl:with-param name="BackupName">F3468InvstCreditLesseeSect48dInd</xsl:with-param>
									</xsl:call-template>No
								</label>
								<br/>If “Yes,” complete lines 13a through 13e. If you acquired more than one property as a lessee,
								 attach a statement showing the information below separately reported for each property.
							</span>
						</div>
					</div>
					<!--  Line 13a  - 13e   -->
					<div class="styTableContainer" style="width: 187mm;height:auto;display:table;" id="2aASctn">
						<xsl:call-template name="SetInitialState"/>
						<table class="styTable" style="font-size: 7pt">
							<tbody>
								<xsl:if test="($Print != $Separated) or 
								 (count($DependencyData/InvstCreditLesseeSect48dGrp) &lt;4)">
									<xsl:for-each select="$DependencyData/InvstCreditLesseeSect48dGrp">
										<tr>
											<td style="text-align:left; border-bottom-width: 0px; border-left-width: 0px;
											 border-top-width: 0px; width: 30mm">
												<span class="styBoldText" style="padding-left:3.5mm">a</span>
												<span style="width: 2mm"/>Name of lessor:
											</td>
										</tr>
										<tr>
											<td class="styBB" style="width: 187mm; padding-left: 7mm">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="LessorBusinessName/BusinessNameLine1Txt"/>
												</xsl:call-template>
												<br/>
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="LessorBusinessName/BusinessNameLine2Txt"/>
												</xsl:call-template>
											</td>
										</tr>
										<!-- End Line 13a  -->
										<!--  Line 13b  -->
										<tr>
											<td style="text-align:left;border-bottom-width:0px;border-left-width:0px;
											 border-top-width: 0px">
												<span class="styBoldText" style="padding-left:3.5mm">b</span>
												<span style="width: 2mm"/>Address of lessor:
											</td>
										</tr>
										<tr>
											<xsl:choose>
												<xsl:when test="LessorUSAddress">
													<td class="styBB" style="width: 187mm; padding-left: 7mm">
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="LessorUSAddress/AddressLine1Txt"/>
														</xsl:call-template>
														<br/>
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="LessorUSAddress/AddressLine2Txt"/>
														</xsl:call-template>
														<br/>
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="LessorUSAddress/CityNm"/>
														</xsl:call-template>,
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="LessorUSAddress/StateAbbreviationCd"/>
														</xsl:call-template>
														<span style="width:1mm"/>
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="LessorUSAddress/ZIPCd"/>
														</xsl:call-template>
													</td>
												</xsl:when>
												<xsl:otherwise>
													<td class="styBB" style="width: 187mm; padding-left: 6mm">
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="LessorForeignAddress/AddressLine1Txt"/>
														</xsl:call-template>
														<br/>
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="LessorForeignAddress/AddressLine2Txt"/>
														</xsl:call-template>
														<br/>
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="LessorForeignAddress/CityNm"/>
														</xsl:call-template>,
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="LessorForeignAddress/ProvinceOrStateNm"/>
														</xsl:call-template>
														<br/>
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="LessorForeignAddress/CountryCd"/>
														</xsl:call-template>,
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="LessorForeignAddress/ForeignPostalCd"/>
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
												<span class="styBoldText" style="padding-left:3.5mm">c</span>
												<span style="width: 2mm"/>Description of property:</td>
										</tr>
										<tr>
											<td class="styBB" style="width: 187mm; padding-left: 7mm">
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
												<span class="styBoldText" style="padding-left:3.5mm">d</span>
												<span style="width: 2mm"/>Amount for which you were treated as having 
												 acquired the property
											 <div class="styBB" style="width: 30mm; text-align: right; float: right;">
													$
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="TreatedAsAcquiredPropertyAmt"/>
													</xsl:call-template>
												</div>
												<span class="styDotLn" style="padding: 0 1mm; float:right; width: 64mm;">................</span>
											</td>
										</tr>
										<!-- End Line 13d  -->
										<!--  Line 13e  -->
										<tr>
											<td style="text-align:left;border-bottom-width:0px;border-left-width:0px;
											 border-top-width: 0px; width: 187mm">
												<span class="styBoldText" style="padding-left:3.5mm">e</span>
												<span style="width: 2mm"/>Income inclusion amount reported for tax year 
												under Regulations section 1.50-1
													 <div class="styBB" style="width: 30mm; float: right; text-align: right;">
													$
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="Sect48dCreditRegs1501InclsnAmt"/>
													</xsl:call-template>
												</div>
												<span class="styDotLn" style="padding: 1mm 1mm; float:right; width: 48mm;">...........</span>
											</td>
										</tr>
										<!-- End Line 13e  -->
									</xsl:for-each>
								</xsl:if>
								<xsl:if test="(count($DependencyData/InvstCreditLesseeSect48dGrp)=0) or 
								(($Print = $Separated) and 
									(count($DependencyData/InvstCreditLesseeSect48dGrp) &gt;1))">
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
												<xsl:with-param name="TargetNode" select="$DependencyData/InvstCreditLesseeSect48dGrp/LessorBusinessName/
												  BusinessNameLine1Txt"/>
											</xsl:call-template>
										</td>
									</tr>
									<!-- End Line 14a  -->
									<!--  Line 14b  -->
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
												<xsl:with-param name="TargetNode" select="$DependencyData/InvstCreditLesseeSect48dGrp"/>
											</xsl:call-template>
										</td>
									</tr>
									<!-- End Line 14b  -->
									<!--  Line 14c  -->
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
												<xsl:with-param name="TargetNode" select="$DependencyData/InvstCreditLesseeSect48dGrp"/>
											</xsl:call-template>
										</td>
									</tr>
									<!-- End Line 14c  -->
									<!--  Line 14d  -->
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
												<xsl:with-param name="TargetNode" select="$DependencyData/InvstCreditLesseeSect48dGrp"/>
											</xsl:call-template>
										</td>
									</tr>
									<!-- End Line 14d  -->
									<!--  Line 14e  -->
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
												<xsl:with-param name="TargetNode" select="$DependencyData/InvstCreditLesseeSect48dGrp"/>
											</xsl:call-template>
										</td>
									</tr>
									<!-- End Line 14e  -->
								</xsl:if>
							</tbody>
						</table>
					</div>
					<xsl:if test="($Print != $Separated) and (count($DependencyData/InvstCreditLesseeSect48dGrp) &gt;1)">
						<xsl:call-template name="SetInitialDynamicTableHeight">
							<xsl:with-param name="TargetNode" select="$DependencyData/InvstCreditLesseeSect48dGrp"/>
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
						 padding-left:0mm;padding-top:1mm">
							<b>Section A—Qualifying Advanced Coal Project Credit Under 
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
						<div class="styLNRightNumBox" style="height:14mm;padding-top:10mm">1a</div>
						<div class="styLNAmountBox" style="width:27mm;height:14mm;padding-top:10.5mm;font-size:7pt">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$DependencyData/InvstIntgrtGasCombCycPropAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;height:14mm;
						 border-right-width:0mm"/>
						<div class="styLNAmountBox" style="width:27mm;height:14mm;border-bottom-width:0px;"/>
						<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;height:14mm; padding-top:3.5mm;border-left-width:1px;border-right-width:0px;"/>
						<div class="styLNAmountBox" style="width:27mm;height:14mm;border-left-width:1px;border-bottom-width:0px;"/>
					</div>
					<!-- End of 1a -->
					<!-- Start of Line 2a -->
					<div style="width:187mm;font-size:8pt">
						<div class="styLNLeftNumBox" style="height:1mm;padding-left:2mm">2a</div>
						<div class="styLNDesc" style="width:73mm;height:7.5mm;padding-left:2mm">
						 Enter the qualified investment in advanced coal-based generation technology property placed in 
						 service during the tax year for projects described in section 48A(d)(3)(B)(ii)
						  <!--Dotted Line-->
						  <span class="styDotLn" style="float:right;">........</span>
						</div>
						<div class="styLNRightNumBox" style="height:14mm;padding-top:10mm">2a</div>
						<div class="styLNAmountBox" style="width:27mm;height:14mm;padding-top:10.5mm;font-size:7pt">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$DependencyData/AdvancedCoalBaseTechnologyAmt"/>
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
					<!-- End of 2b -->
					<!-- Start of Line 3a -->
					<div style="width:187mm;font-size:8pt; height: 15mm;">
						<div class="styLNLeftNumBox" style="height:1mm;padding-left:2mm">3a</div>
						<div class="styLNDesc" style="width:73mm;height:8.5mm;padding-left:2mm">
						Enter the qualified investment in advanced coal-based generation technology property placed in service during the tax year for projects described in section 48A(d)(3)(B)(iii)
						  <!--Dotted Line-->
						  <span class="styDotLn" style="float:right;">.......</span>
						</div>
						<div class="styLNRightNumBox" style="height:15mm;padding-top:10mm;border-bottom-width:0mm">3a</div>
						<div class="styLNAmountBox" style="width:27mm;height:15mm;padding-top:10.5mm;font-size:7pt;border-bottom-width:0mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$DependencyData/QlfyAdvCoalBasedTechAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;height:15mm;
						 border-right-width:0mm"/>
						<div class="styLNAmountBox" style="width:27mm;height:15mm;border-bottom-width:0px;"/>
						<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;height:15mm;
						  padding-top:3.5mm;border-left-width:1px;border-right-width:0px;"/>
						<div class="styLNAmountBox" style="width:27mm;height:15mm;border-left-width:1px;
						  border-bottom-width:0px;"/>
					</div>
					<!-- End of 3a -->
					<!-- Line 3b -->
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
						<div class="styLNAmountBox" style="width:27mm;height:24mm;padding-top:20mm;font-size:7pt">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$DependencyData/QlfyGasificationPropBssAmt"/>
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
					<!-- End of 4b -->
					<!-- Start of Line 5a -->
					<div style="width:187mm;font-size:8pt">
						<div class="styLNLeftNumBox" style="height:1mm;padding-left:2mm;padding-top:2mm">5a</div>
						<div class="styLNDesc" style="width:73mm;height:7.5mm;padding-left:2mm;padding-top:2mm">
						Enter the qualified investment in property other than in line 4a above placed in service during the tax year
						  <!--Dotted Line-->
						  <span class="styDotLn" style="float:right;">..............</span>
						</div>
						<div class="styLNRightNumBox" style="height:12mm;padding-top:8mm">5a</div>
						<div class="styLNAmountBox" style="width:27mm;height:12mm;padding-top:8mm;font-size:7pt">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$DependencyData/OtherQlfyInvstPropertyBasisAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;height:12mm;
						 border-right-width:0mm"/>
						<div class="styLNAmountBox" style="width:27mm;height:12mm;border-bottom-width:0px;"/>
						<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;height:12mm;
						  padding-top:3.5mm;border-left-width:1px;border-right-width:0px;"/>
						<div class="styLNAmountBox" style="width:27mm;height:12mm;border-left-width:1px;
						  border-bottom-width:0px;"/>
					</div>
					<!-- End of 5a -->
					<!-- Line 6 -->
					<div style="width:187mm;font-size:8pt">
						<div class="styLNLeftNumBox" style="height:11mm;padding-top:3.5mm;padding-left:2mm">6</div>
						<div class="styLNDesc" style="width:108mm;height:11mm;padding-top:3mm;padding-left:2mm;">
							<span style="text-align:left;">Enter the applicable unused investment credit from cooperatives. 
						   See instructions
						  <!--Dotted Line-->
						  <span class="styDotLn" style="float:right;">.....................</span>
							</span>
						</div>
						<div class="styLNRightNumBox" style="height:11mm;padding-top:7mm;border-bottom-width:0mm">6</div>
						<div class="styLNAmountBox" style="width:27mm;height:11mm;padding-top:7mm;border-bottom-width:0mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$DependencyData/UnusedCoopInvstGsfcnProjCrAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;height:11mm; width: 7.98mm;"/>
						<div class="styLNAmountBox" style="width:27mm;height:11mm;border-left-width:1px;
						  border-bottom-width:0px;"/>
					</div>
					<!-- End of Line 6 -->
					<!--Line 7 -->
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
					<div class="pageEnd"/>
					<div style="page-break-after:always"/>
					<!-- End Footer -->
					<!-- Header -->
					<div style="width:187mm;padding-top:1mm;float:left">
					  Form 3468 (2025)
						<span style="width:15mm;float:right; padding-left: 22px;">Page 
							<span class="styBoldText" style="font-size:8pt;">3</span>
						</span>
					</div>
					<!-- End Header -->
					<!-- Start of Part III -->
					<div class="styBB" style="width:187mm;border-top-width:1px;">
						<div class="styPartName" style="width:15mm;height:5mm; font-size:8pt;padding-top:1mm;">Part III
						</div>
						<div class="styPartDesc" style="width:170mm; height:auto; font-weight:normal;font-size:9pt;
						 padding-left:2mm;padding-top:1mm">
							<b>Qualifying Advanced Energy Project Credit Under Section 48C</b> (see instructions) 
						</div>
					</div>
					<div class="styBB" style="width:187mm;border-top-width:1px;">
						<div class="styPartDesc" style="width:187mm; height:auto; font-weight:normal;font-size:9pt;padding-left:0mm;padding-top:1mm;">
							<b>Caution: </b>You cannot claim any investment credits for a facility or property under section 48C if you also claimed 
					 <span style="padding-left:16mm">credits under section 45X. 
					 </span>
						</div>
					</div>
					<!-- Start of Line 1a -->
					<div style="width:187mm;font-size:8pt; height: 14mm;">
						<div class="styLNLeftNumBox" style="height:11mm;padding-left:2mm">1a</div>
						<div class="styLNDesc" style="width:73mm;height:10mm;padding-left:2mm">
						 Enter the qualified investment in advanced energy project property placed in service during the
						 tax year
						  <!--Dotted Line-->
						  <span class="styDotLn" style="float:right;">.............</span>
						</div>
						<div class="styLNRightNumBox" style="height:10mm;padding-top:5mm;">1a</div>
						<div class="styLNAmountBox" style="width:27mm;height:10mm;padding-top:5mm;font-size:7pt">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$DependencyData/QlfyInvAdvncEnergyProjPropAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;height:14mm;
						 border-right-width:0mm"/>
						<div class="styLNAmountBox" style="width:27mm;height:16mm;border-bottom-width:0px;"/>
						<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;height:14mm;
						  padding-top:3.5mm;border-left-width:1px;border-right-width:1px; border-bottom-width:0px;"/>

					</div>
					<!-- End of 1a -->
					<!-- Line 1d -->
					<div style="width:187mm">
						<div class="styLNLeftNumBox" style="height:8mm;padding-bottom:.5mm;padding-left:4mm">d</div>
						<!--<div class="styLNDesc" style="width:143mm;height:8mm;">-->
						<div class="styLNDesc" style="width:108mm;height:8mm;">
							<span style="float:left;padding-left:2mm;">Enter your section 48C Allocation control number </span>
							<span class="styFixedUnderline" style="width:44.8mm;padding-top:.1mm;padding-bottom:0mm;
								text-align:center">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$DependencyData/Sect48CAllocationControlNum"/>
								</xsl:call-template>
							</span>
							<!--<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;border-right-width:1px;
						 width:8.3mm; height:18mm;"/>-->
						 </div>
<!--						<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;border-right-width:1px;
						 width:8.1mm; height:8mm;"/>-->
						<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;height:8mm;
						 border-right-width:0mm"/>
						<div class="styLNAmountBox" style="width:27mm;height:8mm;border-bottom-width:0px;"/>
						<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;height:8mm;
						  padding-top:3.5mm;border-left-width:1px;border-right-width:1px; border-bottom-width:0px;"/>
						 
					</div>
					<!-- End of 1d -->
					<!-- Line 1e -->
					<div style="width:187mm;height:8mm;">
						<div class="styLNLeftNumBox" style="height:5mm;padding-left:4mm;padding-top:2mm">e</div>
						<div class="styLNDesc" style="width:108mm;height:8mm;">
							<span style="float:left;padding-left:2mm; padding-top: 1.5mm;">Is the facility in a section 48C energy community census tract?</span>
							<span>
								<xsl:call-template name="PopulateSpan">
									<xsl:with-param name="TargetNode" select="$DependencyData/Sect48CEnergyComFacilityInd"/>
								</xsl:call-template>
								<input type="checkbox" aria-label="Section 48C Energy Community Facility Indicator Yes" class="styCkbox">
									<xsl:call-template name="PopulateYesCheckbox">
										<xsl:with-param name="TargetNode" select="$DependencyData/Sect48CEnergyComFacilityInd"/>
										<xsl:with-param name="BackupName">3468Sect48CEnergyComFacilityInd
										</xsl:with-param>
									</xsl:call-template>
								</input>
								<label>
									<xsl:call-template name="PopulateLabelYes">
										<xsl:with-param name="TargetNode" select="$DependencyData/ExistingFacilityExpansionInd"/>
										<xsl:with-param name="BackupName">3468Sect48CEnergyComFacilityInd
										</xsl:with-param>
									</xsl:call-template>Yes
								</label>
								<span style="width: 4mm"/>
								<input type="checkbox" aria-label="Section 48C Energy Community Facility Indicator No" class="styCkbox">
									<xsl:call-template name="PopulateNoCheckbox">
										<xsl:with-param name="TargetNode" select="$DependencyData/Sect48CEnergyComFacilityInd"/>
										<xsl:with-param name="BackupName">3468Sect48CEnergyComFacilityInd
										</xsl:with-param>
									</xsl:call-template>
								</input>
								<label>
									<xsl:call-template name="PopulateLabelNo">
										<xsl:with-param name="TargetNode" select="$DependencyData/Sect48CEnergyComFacilityInd"/>
										<xsl:with-param name="BackupName">3468Sect48CEnergyComFacilityInd
										</xsl:with-param>
									</xsl:call-template>No
								</label>
							</span>
						</div>
<!--						<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;border-right-width:1px;
							  width:8.1mm; height: 14mm"/>-->
						<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;height:8mm;
						 border-right-width:0mm"/>
						<div class="styLNAmountBox" style="width:27mm;height:8mm;border-bottom-width:0px;"/>
						<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;height:8mm;
						  padding-top:3.5mm;border-left-width:1px;border-right-width:1px; border-bottom-width:0px;"/>
						 					</div>
					<!-- End of 1e -->
					<!-- Line 1f -->
					<div style="width:187mm; "><!-- margin-top: 5px;-->
						<div class="styLNLeftNumBox" style="height:8mm;padding-bottom:.5mm;padding-left:4mm">f</div>
						<div class="styLNDesc" style="width:108mm;height:8mm;">
							<span style="float:left;padding-left:2mm;">Enter the originating pass-through entity's EIN (if applicable): </span>
							<span class="styFixedUnderline" style="width:28.8mm;padding-top:.1mm;padding-bottom:0mm;
								text-align:center">
								<xsl:call-template name="PopulateEIN">
									<xsl:with-param name="TargetNode" select="$DependencyData/OrigPassThroughEntityEIN"/>
								</xsl:call-template>
							</span>
<!--							<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;border-right-width:1px;
						 width:8.1mm; height:8mm;"/>-->
						</div>
<!--						<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;border-right-width:1px;
						 width:8.1mm; height:8mm;"/>
-->
						<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;height:8mm;
						 border-right-width:0mm"/>
						<div class="styLNAmountBox" style="width:27mm;height:8mm;border-bottom-width:0px;"/>
						<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;height:8mm;
						  padding-top:3.5mm;border-left-width:1px;border-right-width:1px; border-bottom-width:0px;"/>
						 
					</div>
					<!-- End of 1f -->
					
					
					<!-- Start-->

					<!-- End -->
					<!-- Line 2 -->
					<div style="width:187mm;font-size:8pt">
						<div class="styLNLeftNumBox" style="height:11mm;padding-top:3.5mm;padding-left:2mm">2</div>
						<div class="styLNDesc" style="width:108mm;height:11mm;padding-top:3mm;padding-left:2mm;">
						  Enter the applicable unused investment credit from cooperatives 
						   See instructions
							<!--Dotted Line-->
							<div class="styDotLn" style="float:none;padding-right:1mm;">...................</div>
						</div>
						<div class="styLNRightNumBox" style="height:11mm;padding-top:7mm;border-bottom-width:0mm; border-left-width: 0.5px;">2</div>
						<div class="styLNAmountBox" style="width:27mm;height:11mm;padding-top:7mm;border-bottom-width:0mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$DependencyData/UnsdCoopInvstAdvncEnergyCrAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;height:11mm; border-right-width: 1px;"/>
						<div class="styLNAmountBox" style="width:27mm;height:11mm;border-left-width:0px;
						  border-bottom-width:0px;;"/>
					</div>
					<!-- End of 2 -->
					<!--Line 3 -->
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
						<div class="styLNLeftNumBox" style="height:1mm;padding-left:2mm"/>
						<div class="styLNDesc" style="width:73mm;height:7.5mm;padding-left:1mm">
							<input type="checkbox" aria-label="Semiconductor Manufacturing Facility" class="styCkbox">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$DependencyData/SemiconductorMfrFacilityInd"/>
									<xsl:with-param name="BackupName">F3468SemiconductorMfrFacilityInd</xsl:with-param>
								</xsl:call-template>
							</input>
							<label>
								<xsl:call-template name="PopulateLabelYes">
									<xsl:with-param name="TargetNode" select="$DependencyData/SemiconductorMfrFacilityInd"/>
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
						<div class="styLNLeftNumBox" style="height:1mm;padding-left:2mm"/>
						<div class="styLNDesc" style="height:7.5mm;width:73mm;font-size:7pt;padding-left:1mm">
							<input type="checkbox" aria-label="Semiconductor Equipment Manufacturing Facility" class="styCkbox">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$DependencyData/SemiconductorEquipMfrFcltyInd"/>
									<xsl:with-param name="BackupName">F3468SemiconductorEquipMfrFcltyInd</xsl:with-param>
								</xsl:call-template>
							</input>
							<label>
								<xsl:call-template name="PopulateLabelYes">
									<xsl:with-param name="TargetNode" select="$DependencyData/SemiconductorEquipMfrFcltyInd"/>
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
						Enter the basis of the qualified investment for the tax
year with respect to any advanced manufacturing facility
						  <!--Dotted Line-->
							<span class="styDotLn" style="float:right;">.........</span>
						</div>
						<div class="styLNRightNumBox" style="height:11mm;padding-top:7mm">1b</div>
						<div class="styLNAmountBox" style="width:27mm;height:11mm;padding-top:7.5mm;font-size:7pt">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$DependencyData/BssAdvncMfrInvstCrAmt"/>
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
					<!-- End of 1c -->
					<!-- Line 2 -->
					<div style="width:187mm;font-size:8pt">
						<div class="styLNLeftNumBox" style="height:7.5mm;padding-top:3.5mm;padding-left:2mm">2</div>
						<div class="styLNDesc" style="width:108mm;height:9mm;padding-top:3mm;padding-left:2mm;">
						  Enter the applicable unused investment credit from cooperatives. See instructions
							<!--Dotted Line-->
							<div class="styDotLn" style="float:none;padding-right:1mm;">....................</div>
						</div>
						<div class="styLNRightNumBox" style="height:11mm;padding-top:5mm; border-bottom-width:0px;">2</div>
						<div class="styLNAmountBox" style="height:11mm;width:27mm;padding-top:5.5mm; border-bottom-width:0px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$DependencyData/UnusedCoopInvstMfrFcltyCrAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBoxNBB" style="height:11mm;background-color:lightgrey; border-bottom-width:0px; width: 7.9mm;"/>
						<div class="styLNAmountBox" style="height:11mm;width:27mm;border-left-width:1px;
						  border-bottom-width:0px;"/>
					</div>
					<!-- End of 2 -->

					<!-- Start of Part V -->
					<div class="styBB" style="width:187mm;border-top-width:1px;">
						<div class="styPartName" style="width:15mm;height:5mm; font-size:8pt;padding-top:1mm;">Part V
						</div>
						<div class="styPartDesc" style="width:170mm; height:auto; font-weight:normal;font-size:9pt;
						 padding-left:2mm;padding-top:1mm">
							<b>Clean Electricity Investment Credit Under Section 48E</b>
						</div>
						<div class="styBB" style="width:187mm;border-top-width:1px;">
							<div class="styPartDesc" style="width:170mm; height:auto; font-weight:normal;font-size:9pt;
						 padding-left:0mm;padding-top:1mm">
								<b>Section A—Qualified Clean Electricity Facilities
						 </b> (see instructions)
						</div>
						</div>
						<div class="styBB" style="width:187mm;border-top-width:1px;">
							<div class="styPartDesc" style="width:170mm; height:auto; font-weight:normal;font-size:9pt;
						 padding-left:0mm;padding-top:1mm;ba">
								<b>Caution: </b>You cannot claim any investment credits for a facility under section 38 for the tax year or any <span style="padding-left:17mm">prior tax year if a credit was allowed under section 45, 45J, 45Q, 45U, 45Y, 48, or 48A.
						 </span>
							</div>
						</div>
						<!-- Start of Line 1a -->
						<div style="width:187mm;font-size:8pt; height: 11mm;">
							<div class="styLNLeftNumBox" style="height:1mm;padding-left:2mm">1a</div>
							<div class="styLNDesc" style="width:73mm;height:11mm;padding-left:2mm">
						Enter the basis of the qualified investment for any qualified facility described in section 48E(b)(1) placed in service during the tax year
						  <!--Dotted Line-->
						  <span class="styDotLn" style="float:right;">..</span>
							</div>
							<div class="styLNRightNumBox" style="height:11mm;padding-top:6mm;">1a</div>
							<div class="styLNAmountBox" style="width:47mm;height:11mm;padding-top:6mm;font-size:7pt">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$DependencyData/BssQlfyInvstSect48Eb1Amt"/>
								</xsl:call-template>
							</div>
							<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;height:14mm;
						 border-right-width:0mm"/>
							<div class="styLNAmountBox" style="width:27mm;height:14mm;border-bottom-width:0px;"/>
							<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;height:14mm;
						  padding-top:3.5mm;border-left-width:1px;border-right-width:1px;"/>
							<div class="styLNAmountBox" style="width:27mm;height:14mm;border-left-width:0px;
						  border-bottom-width:0px;"/>
						</div>
						<!-- End of 1a -->
						<!-- Start of Line 1i -->
						<div style="width:187mm;font-size:8pt; height: 8mm;">
							<div class="styLNLeftNumBox" style="height:1mm;padding-left:5mm">i</div>
							<div class="styLNDesc" style="width:73mm;height:8mm;padding-left:2mm">
					Enter the amount of capacity limitation you were allocated in the allocation letter
						  <!--Dotted Line-->
						  <span class="styDotLn" style="float:right;">......</span>
							</div>
							<div class="styLNRightNumBox" style="height:8mm;padding-top:3.5mm;border-bottom-width:0mm">1i</div>
							<div class="styLNAmountBox" style="width:47mm;height:8mm;padding-top:3.5mm;font-size:7pt;border-bottom-width:0mm">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$DependencyData/AllocLmtEnergyCapKWQty"/>
								</xsl:call-template> kW
							</div>
							<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;height:8mm;
						 border-right-width:0mm"/>
							<div class="styLNAmountBox" style="width:27mm;height:8mm;border-bottom-width:0px;"/>
							<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;height:8mm;
						  padding-top:3.5mm;border-left-width:1px;border-right-width:1px;"/>
							<div class="styLNAmountBox" style="width:27mm;height:8mm;border-left-width:0px;
						  border-bottom-width:0px;"/>
						</div>
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
						<div style="width:187mm;padding-top:1mm;float:left">
						  Form 3468 (2025)
							<span style="width:15mm;float:right; padding-left: 22px;">Page 
								<span class="styBoldText" style="font-size:8pt;">4</span>
							</span>
						</div>
						<!-- End of 1i -->
						<div class="styBB" style="width:187mm;border-top-width:1px;">
							<div class="styPartName" style="width:15mm;height:5mm; font-size:8pt;padding-top:1mm;">Part V
						</div>
							<div class="styPartDesc" style="width:170mm; height:auto; font-weight:normal;font-size:9pt;
						 padding-left:2mm;padding-top:1mm">
								<b>Clean Electricity Investment Credit Under Section 48E </b> <em>(continued)</em>
						</div>
						</div>
						<div class="styBB" style="width:187mm;border-top-width:1px;">
							<div class="styPartDesc" style="width:170mm; height:auto; font-weight:normal;font-size:9pt;
						 padding-left:0mm;padding-top:1mm">
								<b>Section B—Qualified Energy Storage Technology
						 </b> (see instructions)
						</div>
						</div>
						<div class="styBB" style="width:187mm;border-top-width:1px;">
							<div class="styPartDesc" style="width:170mm; height:auto; font-weight:normal;font-size:9pt;
						 padding-left:0mm;padding-top:1mm;ba">
								<b>Caution: </b>You cannot claim any investment credits for a facility under section 38 for the tax year or any<span style="padding-left:17mm"> prior tax year if a credit was allowed under section 45, 45J, 45Q, 45U, 45Y, 48, or 48A.
						 </span>
							</div>
						</div>
					</div>

					<!-- Start of Line 3a -->
					<div style="height:14mm;width:187mm;font-size:8pt">
						<div class="styLNLeftNumBox" style="height:1mm;padding-left:2mm">3a</div>
						<div class="styLNDesc" style="height:14mm;width:73mm;padding-left:2mm">
Enter the basis of the qualified investment for any energy storage technology described in section 48E(c) placed in service during the tax year
						  <!--Dotted Line-->
						  <span class="styDotLn" style="float:right;">...............</span>
						</div>
						<div class="styLNRightNumBox" style="height:14mm;padding-top:10mm;border-bottom-width:0mm">3a</div>
						<div class="styLNAmountBox" style="height:14mm;width:27mm;padding-top:10.5mm;font-size:7pt;border-bottom-width:0mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$DependencyData/BssQlfyInvstEgyStorTechAmt"/>
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
					<!-- Part VI Section C -->
					<div class="styBB" style="width:187mm;border-top-width:1px;">
						<div class="styPartDesc" style="width:170mm; height:auto; font-weight:normal;font-size:9pt;
						 padding-left:0mm;padding-top:1mm">
							<b>Section C—Totals, Credit Reduction for Subsidized Energy Financing or Private Activity Bonds, and Credit Phaseout</b> (see instructions)
						</div>
					</div>
					<!-- Start of Line 6a -->
					<div style="14mm;width:187mm;font-size:8pt">
						<div class="styLNLeftNumBox" style="height:4mm;padding-left:2mm;"> 6a</div>
						<div class="styLNDesc" style="height:18mm;width:73mm;padding-left:2mm">
							<b>Divide.</b> Sum, for the tax year and all prior tax years, of all proceeds of subsidized energy financing or private activity bonds used to<br/> finance the qualified facility or qualified storage <u>technology, as of the close of the tax year</u>
							<!--Dotted Line-->
							<!--							<span class="styDotLn" style="float:right;">.............</span>
-->
						</div>
						<div class="styLNRightNumBox" style="height:18mm;padding-top:13.5mm">6a</div>
						<div class="styLNAmountBox" style="height:18mm;width:27mm;padding-top:13.5mm;font-size:7pt">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$DependencyData/CalcTotEgyFncOrBondPct"/>
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
					<!-- End of 6a -->
					<!-- Start of Line 6a pt2 -->
					<div style="14mm;width:187mm;font-size:8pt">
						<div class="styLNLeftNumBox" style="height:4mm;padding-left:0mm;border-bottom-width:0mm"/>
						<div class="styLNDesc" style="height:14mm;width:73mm;padding-left:2mm;border-bottom-width:0mm">
						 Aggregate amount of additions to the capital account for the qualified facility, for the tax year
						  and all prior tax years, as of the close of the tax year
						</div>
						<div class="styLNRightNumBox" style="height:14mm;padding-top:10.5mm;background-color:lightgrey;border-bottom-width:0mm"/>
						<div class="styLNAmountBox" style="height:14mm;width:27mm;padding-top:11mm;font-size:7pt;border-bottom-width:0mm"/>
						<div class="styLNRightNumBoxNBB" style="height:14mm;background-color:lightgrey;
						 border-right-width:0mm"/>
						<div class="styLNAmountBox" style="height:14mm;width:27mm;border-bottom-width:0px;"/>
						<div class="styLNRightNumBoxNBB" style="height:14mm;background-color:lightgrey;
						 border-left-width:1px;border-right-width:0px;border-bottom-width:0mm"/>
						<div class="styLNAmountBox" style="height:14mm;width:27mm;border-left-width:1px;border-bottom-width:0mm;"/>
					</div>
					<!-- End of 6a pt2 -->
					<!-- Line 10 -->
					<div class="styBB" style="width:187mm;border-top-width:1px;">
						<div style="height:7.5mm;width:187mm;font-size:8pt">
							<div class="styLNLeftNumBox" style="height:4mm;padding-top:.5mm;padding-left:2mm">10</div>
							<div class="styLNDesc" style="height:7.5mm;width:108mm;padding-top:0mm;padding-left:2mm;">
						Enter the applicable unused investment credit from cooperatives. See instructions
						  <!--Dotted Line-->
						  <span class="styDotLn" style="float:right;">.....................</span>
							</div>
							<div class="styLNRightNumBox" style="height:7.5mm;padding-top:3.5mm;border-bottom-width:0mm">10</div>
							<div class="styLNAmountBox" style="height:7.5mm;width:27mm;padding-top:4mm;border-bottom-width:0mm">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$DependencyData/UnusedCoopInvstCrAmt"/>
								</xsl:call-template>
							</div>
							<div class="styLNRightNumBoxNBB" style="height:7.5mm;background-color:lightgrey;"/>
							<div class="styLNAmountBox" style="height:7.5mm;width:27mm;border-left-width:1px;
						  border-bottom-width:0px;"/>
						</div>
					</div>
					<!-- End of line 10-->
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
						<span style="width:15mm;float:right; padding-left: 22px;">Page 
							<span class="styBoldText" style="font-size:8pt;">5</span>
						</span>
					</div>
					<!-- End Header -->
					<!-- Start of Part VI Section A cont. -->
					<div class="styBB" style="width:187mm;border-top-width:1px;">
						<div class="styPartName" style="height:5mm;width:15mm;font-size:8pt;padding-top:1mm;">Part VI
						</div>
						<div class="styPartDesc" style="height:auto;width:170mm;font-weight:normal;font-size:9pt;
						 padding-left:2mm;padding-top:1mm">
							<b>Energy Credit Under Section 48</b>
						</div>
					</div>
					<div class="styBB" style="width:187mm;border-top-width:1px;">
						<div class="styPartDesc" style="width:170mm; height:auto; font-weight:normal;font-size:9pt;
						 padding-left:0mm;padding-top:1mm">
							<b>Section A—Geothermal Energy Credit </b> (see instructions)
						</div>
					</div>
					<!--Start of 1a -->
					<div style="height:8mm;width:187mm;font-size:8pt">
						<div class="styLNLeftNumBox" style="height:4mm;padding-left:2mm">1a</div>
						<div class="styLNDesc" style="height:8mm;width:73mm;padding-left:2mm">
				Enter the basis of property using geothermal energy placed in service during the tax year
						  <!--Dotted Line-->
						  <span class="styDotLn" style="float:right;">.</span>
						</div>
						<div class="styLNRightNumBox" style="height:8mm;padding-top:4mm;border-bottom-width:0mm">1a</div>
						<div class="styLNAmountBox" style="height:8mm;width:48mm;padding-top:4mm;font-size:7pt;border-bottom-width:0mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$DependencyData/GeothermalEnergyPropBasisAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBoxNBB" style="height:8mm;background-color:lightgrey;
						 border-right-width:0mm"/>
						<div class="styLNAmountBox" style="height:8mm;width:27mm;border-bottom-width:0px;"/>
						<div class="styLNRightNumBoxNBB" style="height:8mm;background-color:lightgrey;
						  padding-top:3.5mm;border-left-width:1px;border-right-width:1px;"/>
						<div class="styLNAmountBox" style="height:8mm;width:27mm;border-left-width:0px;
						  border-bottom-width:0px;"/>
					</div>
					<!-- End of 1a -->
					<div class="styBB" style="width:187mm;border-top-width:1px;">
						<div class="styPartDesc" style="width:170mm; height:auto; font-weight:normal;font-size:9pt;
						 padding-left:0mm;padding-top:1mm">
							<b>Section B—Solar Energy Credit</b> (see instructions)
						</div>
					</div>
					<!-- Start of 3a -->
					<div style="height:15mm;width:187mm;font-size:8pt">
						<div class="styLNLeftNumBox" style="height:4mm;padding-left:2mm">3a</div>
						<div class="styLNDesc" style="height:15mm;width:73mm;padding-left:2mm">
		Enter the basis of property using solar illumination (including electrochromic glass) or either solar energy property or solar facility placed in service during the tax year
						  <!--Dotted Line-->
						 <span class="styDotLn" style="float:right;">....</span>
						</div>
						<div class="styLNRightNumBox" style="height:15mm;padding-top:10.5mm">3a</div>
						<div class="styLNAmountBox" style="height:15mm;width:48mm;padding-top:10.5mm;font-size:7pt;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$DependencyData/PropSolarIllmntnOrEgyBssAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBoxNBB" style="height:15mm;background-color:lightgrey;
						 border-right-width:0mm"/>
						<div class="styLNAmountBox" style="height:15mm;width:27mm;border-bottom-width:0px;"/>
						<div class="styLNRightNumBoxNBB" style="height:15mm;background-color:lightgrey;
						  padding-top:3.5mm;border-left-width:1px;border-right-width:1px;"/>
						<div class="styLNAmountBox" style="height:15mm;width:27mm;border-left-width:0px;
						  border-bottom-width:0px;"/>
					</div>
					<!-- End of 3a -->
					<!-- Start 3e -->
					<div style="height:9mm;width:187mm;font-size:8pt">
						<div class="styLNLeftNumBox" style="height:4mm;padding-left:4mm">e</div>
						<div class="styLNDesc" style="height:9mm;width:73mm;padding-left:2mm">
				Enter the amount of capacity limitation you were allocated in the allocation letter
						  <!--Dotted Line-->
						  <span class="styDotLn" style="float:right;">......</span>
						</div>
						<div class="styLNRightNumBox" style="height:9mm;padding-top:3.5mm;border-bottom-width:0mm">3e</div>
						<div class="styLNAmountBox" style="height:9mm;width:48mm;padding-top:3.5mm;font-size:7pt;border-bottom-width:0mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$DependencyData/SolarEgyAllocLmtEnergyCapKWQty"/>
							</xsl:call-template> kW dc
						</div>
						<div class="styLNRightNumBoxNBB" style="height:9mm;background-color:lightgrey; border-right-width:0mm;"/>
						<div class="styLNAmountBox" style="height:9mm;width:27mm; border-bottom-width: 0px;"/>
						<div class="styLNRightNumBoxNBB" style="height:9mm;background-color:lightgrey;
						  padding-top:3.5mm;border-left-width:1px;border-right-width:1px;"/>
						<div class="styLNAmountBox" style="height:9mm;width:27mm;border-left-width:0px;
						  border-bottom-width:0px;"/>
					</div>
					<!-- End of 3e -->
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
						<span style="width:15mm;float:right; padding-left: 22px;">Page 
							<span class="styBoldText" style="font-size:8pt;">6</span>
						</span>
					</div>
					<!-- End Header -->
					<!-- Start of Part VI Section E cont. -->
					<div class="styBB" style="width:187mm;border-top-width:1px;">
						<div class="styPartName" style="height:5mm;width:15mm;font-size:8pt;padding-top:1mm;">Part VI
						</div>
						<div class="styPartDesc" style="height:auto;width:170mm;font-weight:normal;font-size:9pt;
						 padding-left:2mm;padding-top:1mm">
							<b>Energy Credit Under Section 48 </b> <em>(continued)</em>
						</div>
					</div>
					<div class="styBB" style="width:187mm;border-top-width:1px;">
						<div class="styPartDesc" style="width:170mm; height:auto; font-weight:normal;font-size:9pt;
						 padding-left:0mm;padding-top:1mm">
							<b>Section C—Qualified Fuel Cell Property</b> (see instructions)
						</div>
					</div>
					<!-- Start of Line 5a -->
					<div style="height:21.5mm;width:187mm;font-size:8pt">
						<div class="styLNLeftNumBox" style="height:4mm;padding-left:2mm">5a</div>
						<div class="styLNDesc" style="height:22mm;width:73mm;padding-left:2mm">
						 Enter the basis of property using qualified fuel cell property placed in service during the tax year that was acquired after 2005 and before October 4, 2008, and
the basis attributable to construction, reconstruction, or erection by the taxpayer after 2005 and before October 4, 2008
						  <!--Dotted Line-->
						  <!--<span class="styDotLn" style="float:right;">.........</span>-->
						</div>
						<div class="styLNRightNumBox" style="height:22mm;padding-top:18.5mm">5a</div>
						<div class="styLNAmountBox" style="height:22mm;width:40mm;padding-top:18.5mm;font-size:7pt">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$DependencyData/QualifiedFuelCellPropBssAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBoxNBB" style="height:22mm;background-color:lightgrey;
						 border-right-width:0mm"/>
						<div class="styLNAmountBox" style="height:22mm;width:27mm;border-bottom-width:0px;"/>
						<div class="styLNRightNumBoxNBB" style="height:22mm;background-color:lightgrey;
						  padding-top:3.5mm;border-left-width:1px;border-right-width:1px;"/>
						<div class="styLNAmountBox" style="height:22mm;width:27mm;border-left-width:0px;
						  border-bottom-width:0px;"/>
					</div>
					<!-- End of 5a -->
					<!-- Start of Line 5c -->
					<div style="height:8mm;width:187mm;font-size:8pt">
						<div class="styLNLeftNumBox" style="height:4mm;padding-left:4mm">c</div>
						<div class="styLNDesc" style="height:22mm;width:73mm;padding-left:2mm">
						 Enter the applicable kW capacity of property on line 5a.
						 See instructions
						  <!--Dotted Line-->
						  <span class="styDotLn" style="float:right;">........</span>
						</div>
						<div class="styLNRightNumBox" style="height:8mm;padding-top:4mm">5c</div>
						<div class="styLNAmountBox" style="height:8mm;width:40mm;padding-top:4mm;font-size:7pt">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$DependencyData/ApplicableFuelCellPropKWCapQty"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBoxNBB" style="height:12mm;background-color:lightgrey;
						 border-right-width:0mm"/>
						<div class="styLNAmountBox" style="height:12mm;width:27mm;border-bottom-width:0px;"/>
						<div class="styLNRightNumBoxNBB" style="height:12mm;background-color:lightgrey;
						  padding-top:3.5mm;border-left-width:1px;border-right-width:1px;"/>
						<div class="styLNAmountBox" style="height:11mm;width:27mm;border-left-width:0px;
						  border-bottom-width:0px;"/>
					</div>
					<!-- End of 5c -->
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
						<div class="styLNAmountBox" style="height:14mm;width:40mm;padding-top:11mm;font-size:7pt">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$DependencyData/BasisQlfyFuelCellPropAcqAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBoxNBB" style="height:14mm;background-color:lightgrey;
						 border-right-width:0mm"/>
						<div class="styLNAmountBox" style="height:14mm;width:27mm;border-bottom-width:0px;"/>
						<div class="styLNRightNumBoxNBB" style="height:14mm;background-color:lightgrey;
						  padding-top:3.5mm;border-left-width:1px;border-right-width:1px;"/>
						<div class="styLNAmountBox" style="height:14mm;width:27mm;border-left-width:0px;
						  border-bottom-width:0px;"/>
					</div>
					<!-- End of 5f -->
					<!-- Start of Line 5o -->
					<div style="height:11mm;width:187mm;font-size:8pt">
						<div class="styLNLeftNumBox" style="height:4.5mm;padding-left:4mm">o</div>
						<div class="styLNDesc" style="height:11mm;width:73mm;padding-left:2mm;padding-top:1mm">Enter the applicable kW capacity of property on line 5f.
See instructions
						  <!--Dotted Line-->
						  <span class="styDotLn" style="float:right;">........</span>
						</div>
						<div class="styLNRightNumBox" style="height:11mm;padding-top:7mm;
						  border-bottom-width:0px">5o</div>
						<div class="styLNAmountBox" style="height:11mm;width:40mm;padding-top:8mm;font-size:7pt;
						  border-bottom-width:0px">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$DependencyData/ApplicablePropKWCapAfterQty"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBoxNBB" style="height:11mm;background-color:lightgrey;
						 border-right-width:0mm"/>
						<div class="styLNAmountBox" style="height:11mm;width:27mm;border-bottom-width:0px;"/>
						<div class="styLNRightNumBoxNBB" style="height:11mm;background-color:lightgrey;
						  padding-top:3.5mm;border-left-width:1px;border-right-width:1px;"/>
						<div class="styLNAmountBox" style="height:11mm;width:27mm;border-left-width:0px;
						  border-bottom-width:0px;"/>
					</div>
					<!-- End of 5g -->
					<!-- Part VI Section D -->
					<div class="styBB" style="width:187mm;border-top-width:1px;">
						<div class="styPartDesc" style="width:170mm; height:auto; font-weight:normal;font-size:9pt;
						 padding-left:0mm;padding-top:1mm">
							<b>Section D—Qualified Microturbine Property</b> (see 
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
						<div class="styLNAmountBox" style="height:18mm;width:40mm;padding-top:14.5mm;font-size:7pt">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$DependencyData/QlfyMicroturbinePropBssAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBoxNBB" style="height:18mm;background-color:lightgrey;
						 border-right-width:0mm"/>
						<div class="styLNAmountBox" style="height:18mm;width:27mm;border-bottom-width:0px;"/>
						<div class="styLNRightNumBoxNBB" style="height:18mm;background-color:lightgrey;
						  border-left-width:1px;border-right-width:1px;"/>
						<div class="styLNAmountBox" style="height:18mm;width:27mm;border-left-width:0px;
						  border-bottom-width:0px;"/>
					</div>
					<!-- End of 7a -->
					<!-- Start of Line 7j -->
					<div style="height:7.5mm;width:187mm;font-size:8pt">
						<div class="styLNLeftNumBox" style="height:4mm;padding-left:4mm">j</div>
						<div class="styLNDesc" style="height:7.5mm;width:73mm;padding-left:2mm">
						Enter the applicable kW capacity of property on line 7a. See instructions
						  <!--Dotted Line-->
							<span class="styDotLn" style="float:right;">.......</span>
						</div>
						<div class="styLNRightNumBox" style="height:7.5mm;padding-top:3mm; border-bottom-width: 0px;">7j</div>
						<div class="styLNAmountBox" style="height:7.5mm;width:40mm;padding-top:3mm;font-size:7pt; border-bottom-width: 0px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$DependencyData/ApplicableMcrtrbnPropKWCapQty"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBoxNBB" style="height:7.5mm;background-color:lightgrey;
						 border-right-width:0mm"/>
						<div class="styLNAmountBox" style="height:7.5mm;width:27mm;border-bottom-width:0px;"/>
						<div class="styLNRightNumBoxNBB" style="height:7.5mm;background-color:lightgrey;
						  border-left-width:1px;border-right-width:1px;"/>
						<div class="styLNAmountBox" style="height:7.5mm;width:27mm;border-left-width:0px;
						  border-bottom-width:0px;"/>
					</div>
					<!-- End of 7j -->
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
						<span style="width:15mm;float:right; padding-left: 22px;">Page 
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
							<b>Energy Credit Under Section 48 </b> <em>(continued)</em>
						</div>
					</div>
					<!-- Part VI Section E -->
					<div class="styBB" style="width:187mm;border-top-width:1px;">
						<div class="styPartDesc" style="width:170mm; height:auto; font-weight:normal;font-size:9pt;
						 padding-left:0mm;padding-top:1mm">
							<b>Section E—Combined Heat and Power System Property</b> 
						  (see instructions)
						</div>
					</div>
					<div class="styBB" style="width:187mm;border-top-width:1px;">
						<div class="styPartDesc" style="width:170mm; height:auto; font-weight:normal;border-top-width:0px;
						 padding-left:0mm;padding-top:1mm">
							<b>Caution:</b> You can’t claim this credit if the electrical 
						  capacity of the property is more than 50 MW or has a mechanical energy capacity of more
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
						<div class="styLNAmountBox" style="height:11mm;width:45mm;padding-top:7.5mm;font-size:7pt">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$DependencyData/BasisOfHeatAndPowerPropAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBoxNBB" style="height:11mm;background-color:lightgrey;
						 border-right-width:0mm"/>
						<div class="styLNAmountBox" style="height:11mm;width:27mm;border-bottom-width:0px;"/>
						<div class="styLNRightNumBoxNBB" style="height:11mm;background-color:lightgrey;
						  border-left-width:1px;border-right-width:1px;"/>
						<div class="styLNAmountBox" style="height:11mm;width:27mm;border-left-width:0px;
						  border-bottom-width:0px;"/>
					</div>
					<!-- End of 9a -->
					<!-- Start of Line 9b -->
					<div style="height:25mm;width:187mm;font-size:8pt;">
						<div class="styLNLeftNumBox" style="height:4.5mm;padding-left:4mm">b</div>
						<div class="styLNDesc" style="height:22mm;width:73mm;padding-left:2mm;padding-top:1mm">
						If the electrical capacity of the property is measured in: <br/>• MW, divide 15 by the MW capacity. Enter 1.0 if the capacity is 15 MW or less.<br/>
• Horsepower, divide 20,000 by the horsepower. Enter 1.0 if the capacity is 20,000 horsepower or less
						  <!--Dotted Line-->
							<span class="styDotLn" style="float:right;">...............</span>
						</div>
						<div class="styLNRightNumBox" style="height:25mm;padding-top:21mm;border-bottom-width:0mm;">9b</div>
						<div class="styLNAmountBox" style="height:25mm;width:45mm;padding-top:21mm;font-size:7pt;border-bottom-width:0mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$DependencyData//MegaHorsepowerPct"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBoxNBB" style="height:25mm;background-color:lightgrey;
						 border-right-width:0mm"/>
						<div class="styLNAmountBox" style="height:25mm;width:27mm;border-bottom-width:0px;"/>
						<div class="styLNRightNumBoxNBB" style="height:25mm;background-color:lightgrey;
						  border-left-width:1px;border-right-width:1px;"/>
						<div class="styLNAmountBox" style="height:25mm;width:27mm;border-left-width:0px;
						  border-bottom-width:0px;"/>
					</div>
					<!-- End of 9b -->
					<!-- Part VI Section F -->
					<div class="styBB" style="width:187mm;border-top-width:1px;">
						<div class="styPartDesc" style="width:170mm; height:auto; font-weight:normal;font-size:9pt;
						 padding-left:0mm;padding-top:1mm">
							<b>Section F—Qualified Small Wind Energy Property</b> 
						  (see instructions)
						</div>
					</div>
					<!-- Start of Line 11d -->
					<div style="height:11mm;width:187mm;font-size:8pt">
						<div class="styLNLeftNumBox" style="height:4mm;padding-left:0mm;">11d</div>
						<!--<div class="styLNLeftNumBox" style="height:4mm;padding-left:4mm;">11d</div>-->
						<div class="styLNDesc" style="height:11mm;width:73mm;padding-left:2mm">
						Enter the basis of property using small wind energy
property placed in service during the tax year
						  <!--Dotted Line-->
						  <span class="styDotLn" style="float:right;">...............</span>
							<!--<span class="styDotLn" style="float:right;">.....</span>-->
						</div>
						<div class="styLNRightNumBox" style="height:11mm;padding-top:7.5mm">11d</div>
						<div class="styLNAmountBox" style="height:11mm;width:45mm;padding-top:7.5mm;font-size:7pt">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$DependencyData/WindEgyBssAfterSpcfdPrdAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBoxNBB" style="height:11mm;background-color:lightgrey;
						 border-right-width:0mm"/>
						<div class="styLNAmountBox" style="height:11mm;width:27mm;border-bottom-width:0px;"/>
						<div class="styLNRightNumBoxNBB" style="height:11mm;background-color:lightgrey;
						 border-left-width:1px;border-right-width:1px;"/>
						<div class="styLNAmountBox" style="height:11mm;width:27mm;border-left-width:0px;
						  border-bottom-width:0px;"/>
					</div>
					<!-- End of 11d -->
					<!-- Start of Line 11h -->
					<div style="height:11mm;width:187mm;font-size:8pt">
						<div class="styLNLeftNumBox" style="height:4mm;padding-left:4mm;;padding-top:2mm">h</div>
						<div class="styLNDesc" style="height:8mm;width:73mm;padding-left:2mm;padding-top:2mm">
						Enter the amount of capacity limitation you were allocated in the allocation letter
						  <!--Dotted Line-->
							<span class="styDotLn" style="float:right;">......</span>
						</div>
						<div class="styLNRightNumBox" style="height:11mm;padding-top:6.5mm;border-bottom-width:0mm">11h</div>
						<div class="styLNAmountBox" style="height:11mm;width:45mm;padding-top:6.5mm;font-size:7pt;border-bottom-width:0mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$DependencyData/WindEgyAllocLmtEnergyCapKWQty"/>
							</xsl:call-template> kW
						</div>
						<div class="styLNRightNumBoxNBB" style="height:11mm;background-color:lightgrey;
						 border-right-width:0mm"/>
						<div class="styLNAmountBox" style="height:11mm;width:27mm;border-bottom-width:0px;"/>
						<div class="styLNRightNumBoxNBB" style="height:11mm;background-color:lightgrey;
						 border-left-width:1px;border-right-width:1px;"/>
						<div class="styLNAmountBox" style="height:10mm;width:27mm;border-left-width:0px;
						  border-bottom-width:0px;"/>
					</div>
					<!-- End of 11h -->
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
						<span style="width:15mm;float:right; padding-left: 22px;">Page 
							<span class="styBoldText" style="font-size:8pt;">8</span>
						</span>
					</div>
					<!-- End Header -->
					<!-- Start of Part VI Section F cont. -->
					<div class="styBB" style="width:187mm;border-top-width:1px;">
						<div class="styPartName" style="height:5mm;width:15mm;font-size:8pt;padding-top:1mm;">Part VI
						</div>
						<div class="styPartDesc" style="height:auto;width:170mm;font-weight:normal;font-size:9pt;
						 padding-left:2mm;padding-top:1mm">
							<b>Energy Credit Under Section 48 </b> <em>(continued)</em>
						</div>
					</div>
					<!-- Part VI Section G -->
					<div class="styBB" style="width:187mm;border-top-width:1px;">
						<div class="styPartDesc" style="width:170mm; height:auto; font-weight:normal;font-size:9pt;
						 padding-left:0mm;padding-top:1mm">
							<b>Section G—Waste Energy Recovery Property</b> 
						  (see instructions)
						</div>
					</div>
					<!-- Start of Line 13a -->
					<div style="7.5mm;width:187mm;font-size:8pt">
						<div class="styLNLeftNumBox" style="height:4mm;padding-left:0mm;">13a</div>
						<div class="styLNDesc" style="height:7.5mm;width:73mm;padding-left:2mm">
						 Enter the basis of property using waste energy recovery placed in service during the tax year
						  <!--Dotted Line-->
							<span class="styDotLn" style="float:right;">.</span>
						</div>
						<div class="styLNRightNumBox" style="height:7.5mm;padding-top:3.5mm;border-bottom-width:0mm">13a</div>
						<div class="styLNAmountBox" style="height:7.5mm;width:27mm;padding-top:4mm;font-size:7pt;border-bottom-width:0mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$DependencyData/BssWasteEgyRcvryPropAmt"/>
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
					<!-- Part VI Section H -->
					<div class="styBB" style="width:187mm;border-top-width:1px;">
						<div class="styPartDesc" style="width:170mm; height:auto; font-weight:normal;font-size:9pt;
						 padding-left:0mm;padding-top:1mm">
							<b>Section H—Geothermal Heat Pump Systems</b> 
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
						<div class="styLNRightNumBox" style="height:11mm;padding-top:7.5mm;border-bottom-width:0mm">15a</div>
						<div class="styLNAmountBox" style="height:11mm;width:27mm;padding-top:8mm;font-size:7pt;border-bottom-width:0mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$DependencyData/BssGthrmlPropHtPumpSysAmt"/>
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
						<span style="width:15mm;float:right; padding-left: 22px;">Page 
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
							<b>Energy Credit Under Section 48 </b> <em>(continued)</em>
						</div>
					</div>
					<!-- Part VI Section I -->
					<div class="styBB" style="width:187mm;border-top-width:1px;">
						<div class="styPartDesc" style="width:170mm; height:auto; font-weight:normal;font-size:9pt;
						 padding-left:0mm;padding-top:1mm">
							<b>Section I—Energy Storage Technology Property</b> 
						  (see instructions)
						</div>
					</div>
					<!-- Start of Line 17a -->
					<div style="height:7.5mm;width:187mm;font-size:8pt">
						<div class="styLNLeftNumBox" style="height:4mm;padding-left:0mm;">17a</div>
						<div class="styLNDesc" style="height:7.5mm;width:73mm;padding-left:2mm">
						 Enter the basis of property using energy storage technology placed in service during the tax year
						  <!--Dotted Line-->
							<!--<span class="styDotLn" style="float:right;">..............</span>-->
						</div>
						<div class="styLNRightNumBox" style="height:7.5mm;padding-top:3.5mm">17a</div>
						<div class="styLNAmountBox" style="height:7.5mm;width:45mm;padding-top:4mm;font-size:7pt">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$DependencyData/EnergyStorageTechPropBasisAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBoxNBB" style="height:7.5mm;background-color:lightgrey;
						 border-right-width:0mm"/>
						<div class="styLNAmountBox" style="height:7.5mm;width:27mm;border-bottom-width:0px;"/>
						<div class="styLNRightNumBoxNBB" style="height:7.5mm;background-color:lightgrey;
						 border-left-width:1px;border-right-width:1px;"/>
						<div class="styLNAmountBox" style="height:7.5mm;width:27mm;border-left-width:0px;
						  border-bottom-width:0px;"/>
					</div>
					<!-- End of 17a -->
					<!-- Start of Line 17e -->
					<div style="height:15mm;width:187mm;font-size:8pt">
						<div class="styLNLeftNumBox" style="height:4mm;padding-left:4mm;">e</div>
						<div class="styLNDesc" style="height:15mm;width:73mm;padding-left:2mm">
						Enter the amount of capacity limitation you were allocated in the allocation letter for the solar or wind energy property in connection with the energy storage technology
						  <!--Dotted Line-->
							<span class="styDotLn" style="float:right;">.......</span>
						</div>
						<div class="styLNRightNumBox" style="height:15mm;padding-top:10.5mm;border-bottom-width:0mm">17e</div>
						<div class="styLNAmountBox" style="height:15mm;width:45mm;padding-top:11mm;font-size:7pt;border-bottom-width:0mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$DependencyData/EgyStorAllocLmtEnergyCapKWQty"/>
							</xsl:call-template> kW
						</div>
						<div class="styLNRightNumBoxNBB" style="height:15mm;background-color:lightgrey;
						 border-right-width:0mm"/>
						<div class="styLNAmountBox" style="height:15mm;width:27mm;border-bottom-width:0px;"/>
						<div class="styLNRightNumBoxNBB" style="height:15mm;background-color:lightgrey;
						 border-left-width:1px;border-right-width:1px;"/>
						<div class="styLNAmountBox" style="height:15mm;width:27mm;border-left-width:0px;
						  border-bottom-width:0px;"/>
					</div>
					<!-- End of 17e -->
					<!-- Part VI Section J -->
					<div class="styBB" style="width:187mm;border-top-width:1px;">
						<div class="styPartDesc" style="width:170mm; height:auto; font-weight:normal;font-size:9pt;
						 padding-left:0mm;padding-top:1mm">
							<b>Section J—Qualified Biogas Property</b> 
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
						<div class="styLNRightNumBox" style="height:7.5mm;padding-top:4mm;border-bottom-width:0mm">19a</div>
						<div class="styLNAmountBox" style="height:7.5mm;width:45mm;padding-top:4mm;font-size:7pt;border-bottom-width:0mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$DependencyData/QualifiedBiogasPropBasisAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBoxNBB" style="height:7.5mm;background-color:lightgrey;
						 border-right-width:0mm;border-bottom-width:0px"/>
						<div class="styLNAmountBox" style="height:7.5mm;width:27mm;border-bottom-width:0px;"/>
						<div class="styLNRightNumBoxNBB" style="height:7.5mm;background-color:lightgrey;
						  border-left-width:1px;border-right-width:1px;"/>
						<div class="styLNAmountBox" style="height:7.5mm;width:27mm;border-left-width:0px;
						  border-bottom-width:0px;"/>
					</div>
					<!-- End of 19a -->
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
						<span style="width:15mm;float:right; padding-left: 15px;">Page 
							<span class="styBoldText" style="font-size:8pt;">10</span>
						</span>
					</div>
					<!-- End Header -->
					<div class="styBB" style="width:187mm;border-top-width:1px;">
						<div class="styPartName" style="height:5mm;width:15mm;font-size:8pt;padding-top:1mm;">Part VI
						</div>
						<div class="styPartDesc" style="height:auto;width:170mm;font-weight:normal;font-size:9pt;
						 padding-left:2mm;padding-top:1mm">
							<b>Energy Credit Under Section 48 </b> <em>(continued)</em>
						</div>
					</div>
					<!-- Part VI Section K -->
					<div class="styBB" style="width:187mm;border-top-width:1px;">
						<div class="styPartDesc" style="width:170mm; height:auto; font-weight:normal;font-size:9pt;
						 padding-left:0mm;padding-top:1mm">
							<b>Section K—Microgrid Controllers Property</b> 
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
						<div class="styLNRightNumBox" style="height:7.5mm;padding-top:4mm; border-bottom-width: 0px;">21a</div>
						<div class="styLNAmountBox" style="height:7.5mm;width:45mm;padding-top:4mm;font-size:7pt; border-bottom-width: 0px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$DependencyData/MicrogridControllersPropBssAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBoxNBB" style="height:7.5mm;background-color:lightgrey;
						 border-right-width:0mm;border-bottom-width:0px"/>
						<div class="styLNAmountBox" style="height:7.5mm;width:27mm;border-bottom-width:0px;"/>
						<div class="styLNRightNumBoxNBB" style="height:7.5mm;background-color:lightgrey;
						  border-left-width:1px;border-right-width:1px;"/>
						<div class="styLNAmountBox" style="height:7.5mm;width:27mm;border-left-width:0px;
						  border-bottom-width:0px;"/>
					</div>
					<!-- End of 21a -->
					<!-- Part VI Section L -->
					<div class="styBB" style="width:187mm;border-top-width:1px;">
						<div class="styPartDesc" style="width:170mm; height:auto; font-weight:normal;font-size:9pt;
						 padding-left:0mm;padding-top:1mm">
							<b>Section L—Qualified Investment Credit Facility Property</b> 
						  (see instructions)
						</div>
					</div>
					<!-- Start of Line 23a -->
					<div style="height:11mm;width:187mm;font-size:8pt">
						<div class="styLNLeftNumBox" style="height:4mm;padding-left:0mm;">23a</div>
						<div class="styLNDesc" style="height:11mm;width:73mm;padding-left:2mm">
						 Enter the basis of property using investment credit facility property placed in service during the
						  tax year
						  <!--Dotted Line-->
							<span class="styDotLn" style="float:right;">.............</span>
						</div>
						<div class="styLNRightNumBox" style="height:11mm;padding-top:7.5mm">23a</div>
						<div class="styLNAmountBox" style="height:11mm;width:45mm;padding-top:8mm;font-size:7pt">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$DependencyData/QlfyInvstFcltyPropBasisAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBoxNBB" style="height:11mm;background-color:lightgrey;
						 border-right-width:0mm"/>
						<div class="styLNAmountBox" style="height:11mm;width:27mm;border-bottom-width:0px;"/>
						<div class="styLNRightNumBoxNBB" style="height:11mm;background-color:lightgrey;
						 border-left-width:1px;border-right-width:1px;"/>
						<div class="styLNAmountBox" style="height:11mm;width:27mm;border-left-width:0px;
						  border-bottom-width:0px;"/>
					</div>
					<!-- End of 23a -->
					<!--  Start of Line 23e -->
					<div style="height:8mm;width:187mm;font-size:8pt">
						<div class="styLNLeftNumBox" style="height:8mm;padding-left:4mm;">e</div>
						<div class="styLNDesc" style="height:8mm;width:73mm;padding-left:2mm">
Enter the amount of capacity limitation you were allocated in the allocation letter		
				  <!--Dotted Line-->
						<span class="styDotLn" style="float:right;">......</span>
						</div>
						<div class="styLNRightNumBox" style="height:8mm;padding-top:4mm;border-bottom-width:0mm">23e</div>
						<div class="styLNAmountBox" style="height:8mm;width:45mm;padding-top:1mm;font-size:7pt;padding-top:4mm;border-bottom-width:0mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$DependencyData/QlfyInvsAllocLmtEnergyCapKWQty"/>
							</xsl:call-template> kW
						</div>
						<div class="styLNRightNumBoxNBB" style="height:8mm;background-color:lightgrey;
						 border-right-width:0mm"/>
						<div class="styLNAmountBox" style="height:8mm;width:27mm;border-bottom-width:0px;"/>
						<div class="styLNRightNumBoxNBB" style="height:8mm;background-color:lightgrey;
						 border-left-width:1px;border-right-width:1px;"/>
						<div class="styLNAmountBox" style="height:8mm;width:27mm;border-left-width:0px;
						  border-bottom-width:0px;"/>
					</div>
					<!-- End of 23e -->
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
						<span style="width:15mm;float:right; padding-left: 15px;">Page 
							<span class="styBoldText" style="font-size:8pt;">11</span>
						</span>
					</div>
					<!-- End Header -->
					<!-- Start of Part VI cont. Page 11 -->
					<div class="styBB" style="width:187mm;border-top-width:1px;">
						<div class="styPartName" style="height:5mm;width:15mm;font-size:8pt;padding-top:1mm;">Part VI
						</div>
						<div class="styPartDesc" style="height:auto;width:170mm;font-weight:normal;font-size:9pt;
						 padding-left:2mm;padding-top:1mm">
							<b>Energy Credit Under Section 48 </b> <em>(continued)</em>
						</div>
					</div>
					<!-- Part VI Section M -->
					<div class="styBB" style="width:187mm;border-top-width:1px;">
						<div class="styPartDesc" style="width:170mm; height:auto; font-weight:normal;font-size:9pt;
						 padding-left:0mm;padding-top:1mm">
							<b>Section M—Clean Hydrogen Production Facilities as Energy
						  Property</b> (see instructions)
						</div>
					</div>
					<div class="styBB" style="width:187mm;border-top-width:1px;">
						<div class="styPartDesc" style="width:170mm; height:auto; font-weight:normal;border-top-width:0px;
						 padding-left:0mm;padding-top:1mm">
							<b>Caution:</b> If you choose to treat specified clean hydrogen production property as energy property, you cannot also take the credit under section 45V or 45Q. Production and sale or use of clean hydrogen must be verified by an unrelated party. Attach a copy of the
verification report to the tax return.
						</div>
					</div>
					<!-- Start of Line 25a -->
					<div style="18mm;width:187mm;font-size:8pt">
						<div class="styLNLeftNumBox" style="height:4mm;padding-left:0mm;">25a</div>
						<div class="styLNDesc" style="height:18mm;width:73mm;padding-left:2mm">Enter the basis of property placed in service during the tax year for the facility that is designed and reasonably expected to produce qualified clean hydrogen per
section 45V(b)(2)(A)						 
                         <!--Dotted Line-->
							<span class="styDotLn" style="float:right;">................</span>
						</div>
						<div class="styLNRightNumBox" style="height:18mm;padding-top:14.5mm">25a</div>
						<div class="styLNAmountBox" style="height:18mm;width:27mm;padding-top:15mm;font-size:7pt">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$DependencyData/CleanHydrgn45Vb2APropBasisAmt"/>
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
					<!-- Start of Line 25d -->
					<div style="18mm;width:187mm;font-size:8pt">
						<div class="styLNLeftNumBox" style="height:4mm;padding-left:4mm;">d</div>
						<div class="styLNDesc" style="height:18mm;width:73mm;padding-left:2mm">
						Enter the basis of property placed in service during the tax year for the facility that is designed and reasonably expected to produce qualified clean hydrogen per section 45V(b)(2)(B)
						<!--Dotted Line-->
							<span class="styDotLn" style="float:right;">................</span>
						</div>
						<div class="styLNRightNumBox" style="height:18mm;padding-top:14.5mm">25d</div>
						<div class="styLNAmountBox" style="height:18mm;width:27mm;padding-top:15mm;font-size:7pt">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$DependencyData/CleanHydrgn45Vb2BPropBasisAmt"/>
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
					<!-- Start of Line 25g -->
					<div style="18mm;width:187mm;font-size:8pt">
						<div class="styLNLeftNumBox" style="height:4mm;padding-left:4mm;">g</div>
						<div class="styLNDesc" style="height:18mm;width:73mm;padding-left:2mm">
					Enter the basis of property placed in service during the tax year for the facility that is designed and reasonably
expected to produce qualified clean hydrogen per section 45V(b)(2)(C)
						 <!--Dotted Line-->
							<span class="styDotLn" style="float:right;">..............</span>
						</div>
						<div class="styLNRightNumBox" style="height:18mm;padding-top:14.5mm">25g</div>
						<div class="styLNAmountBox" style="height:18mm;width:27mm;padding-top:15mm;font-size:7pt">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$DependencyData/CleanHydrgn45Vb2CPropBasisAmt"/>
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
					<!-- Start of Line 25j -->
					<div style="18mm;width:187mm;font-size:8pt">
						<div class="styLNLeftNumBox" style="height:4mm;padding-left:4mm;">j</div>
						<div class="styLNDesc" style="height:18mm;width:73mm;padding-left:2mm">
						 Enter the basis of property placed in service during the tax year for the facility that is designed
						  and reasonably expected to produce qualified clean hydrogen per section 45V(b)(2)(D)
						<!--Dotted Line-->
							<span class="styDotLn" style="float:right;">................</span>
						</div>
						<div class="styLNRightNumBox" style="height:18mm;padding-top:14.5mm;border-bottom-width:0mm">25j</div>
						<div class="styLNAmountBox" style="height:18mm;width:27mm;padding-top:15mm;font-size:7pt;border-bottom-width:0mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$DependencyData/CleanHydrgn45Vb2DPropBasisAmt"/>
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
					<!-- Part VI Section N Header -->
					<div class="styBB" style="width:187mm;border-top-width:2px;">
						<div class="styPartDesc" style="width:170mm; height:auto; font-weight:normal;font-size:9pt;
						 padding-left:0mm;padding-top:1mm">
							<b>Section N—Totals and Credit Reduction for Tax-Exempt Bonds</b>
						  (see instructions)
						</div>
					</div>
					<!-- Start of Line 28a -->
					<div style="height: 20mm;width:187mm;font-size:8pt">
						<div class="styLNLeftNumBox" style="height:4mm;padding-left:0mm;">28a</div>
						<div class="styLNDesc" style="height:20mm;width:73mm;padding-left:2mm">
							<strong>Divide.</strong> Sum, for the tax year and all prior tax years, of all proceeds of tax-exempt bonds (within
						  the meaning of section 103) used to finance the qualified facility, as of the close of <br/>the tax year
						  <!--Dotted Line-->
							<span class="styDotLn" style="float:right;">.............</span>
							<hr style="border-top: 2px solid black;"/>
						</div>
						<div class="styLNRightNumBox" style="height:20mm;padding-top:13.5mm">28a</div>
						<div class="styLNAmountBox" style="height:20mm;width:27mm;padding-top:13.5mm;font-size:7pt">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$DependencyData/CalcTaxExemptBondsPct"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBoxNBB" style="height:20mm;background-color:lightgrey;
						 border-right-width:0mm"/>
						<div class="styLNAmountBox" style="height:20mm;width:27mm;border-bottom-width:0px;"/>
						<div class="styLNRightNumBoxNBB" style="height:20mm;background-color:lightgrey;
						 border-left-width:1px;border-right-width:0px;"/>
						<div class="styLNAmountBox" style="height:20mm;width:27mm;border-left-width:1px;
						  border-bottom-width:0px;"/>
					</div>
					<!-- End of 28a -->
					<!-- Start of Line 28a pt2 -->
					<div style="14mm;width:187mm;font-size:8pt;">
						<div class="styLNLeftNumBox" style="height:4mm;padding-left:0mm;"/>
						<div class="styLNDesc" style="height:14mm;width:73mm;padding-left:2mm">
						 Aggregate amount of additions to the capital account for the qualified facility,for the tax year
						  and all prior tax years, as of the close of the tax year
						</div>
						<div class="styLNRightNumBox" style="height:14mm;padding-top:10.5mm;background-color:lightgrey"/>
						<div class="styLNAmountBox" style="height:14mm;width:27mm;padding-top:11mm;font-size:7pt;"/>
						<div class="styLNRightNumBoxNBB" style="height:14mm;background-color:lightgrey;
						 border-right-width:0mm"/>
						<div class="styLNAmountBox" style="height:14mm;width:27mm;border-bottom-width:0px;"/>
						<div class="styLNRightNumBoxNBB" style="height:14mm;background-color:lightgrey;
						 border-left-width:1px;border-right-width:0px;"/>
						<div class="styLNAmountBox" style="height:14mm;width:27mm;border-left-width:1px;
						  border-bottom-width:0px;"/>
					</div>
					<!-- End of 28a pt2 -->
					<!-- Line 31 -->
					<div style="height:7.5mm;width:187mm;font-size:8pt">
						<div class="styLNLeftNumBox" style="height:4mm;padding-top:.5mm;padding-left:0mm">31</div>
						<div class="styLNDesc" style="height:7.5mm;width:108mm;padding-top:0mm;padding-left:2mm;">
						  Enter the applicable unused investment credit from cooperatives. See instructions
						  <!--Dotted Line-->
						  <!--<span class="styDotLn" style="float:right;">.....................</span>-->
						</div>
						<div class="styLNRightNumBox" style="height:7.5mm;padding-top:3.5mm;border-bottom-width:0mm">31</div>
						<div class="styLNAmountBox" style="height:7.5mm;width:27mm;padding-top:4mm;border-bottom-width:0mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$DependencyData/UnusedCreditFromCoopAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBoxNBB" style="height:7.5mm;background-color:lightgrey; width: 7.98mm;"/>
						<div class="styLNAmountBox" style="height:7.5mm;width:27mm;border-left-width:1px;
						  border-bottom-width:0px;"/>
					</div>
					<!-- End of 31 -->
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
						<span style="width:15mm;float:right; padding-left: 15px;">Page 
							<span class="styBoldText" style="font-size:8pt;">12</span>
						</span>
					</div>
					<!-- End of 32 -->
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
					<div style="width:177mm;">
						<div class="styLNLeftNumBox" style="height:5mm;padding-left:2mm;padding-top:2mm">
							 1a
							</div>
						<div class="styLNDesc" style="width:155mm;height:4mm;">
							 Was there a prior section 170(h) deduction on this property?
								<input type="checkbox" aria-label="Prior 170h deduction Yes" class="styCkbox">
								<xsl:call-template name="PopulateYesCheckbox">
									<xsl:with-param name="TargetNode" select="$DependencyData/Prior170hDeductionInd"/>
									<xsl:with-param name="BackupName">F3468Prior170hDeductionInd</xsl:with-param>
								</xsl:call-template>
							</input>
							<label>
								<xsl:call-template name="PopulateLabelYes">
									<xsl:with-param name="TargetNode" select="$DependencyData/Prior170hDeductionInd"/>
									<xsl:with-param name="BackupName">F3468Prior170hDeductionInd</xsl:with-param>
								</xsl:call-template>Yes
								</label>
							<span style="width: 4mm"/>
							<input type="checkbox" aria-label="Prior 170h deduction No" class="styCkbox">
								<xsl:call-template name="PopulateNoCheckbox">
									<xsl:with-param name="TargetNode" select="$DependencyData/Prior170hDeductionInd"/>
									<xsl:with-param name="BackupName">F3468Prior170hDeductionInd</xsl:with-param>
								</xsl:call-template>
							</input>
							<label>
								<xsl:call-template name="PopulateLabelNo">
									<xsl:with-param name="TargetNode" select="$DependencyData/Prior170hDeductionInd"/>
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
								<xsl:with-param name="TargetNode" select="$DependencyData/Prior170hDeductionNPSProjNum"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- End of 1b -->
					<!-- Line 1c -->
					<div style="height:11mm;width:187mm;">
						<div class="styLNLeftNumBox" style="height:4mm;padding-left:4mm">
							 c
							</div>
						<div class="styLNDesc" style="height:11mm;width:155mm;">
							 Check this box if you are electing under section 47(d)(5) to take your qualified rehabilitation
							  expenditures into account for the tax year in which paid (or, for self-rehabilitated property,
							  when capitalized). This election applies to the current tax year and to all later tax years.
							  You may not revoke this election without IRS consent
								<!--Dotted Line-->
								<span class="styDotLn" style="float:none;padding-left:2mm">............
								</span>
							<input type="checkbox" aria-label="Rehabilitation Expenditures" class="styCkbox">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$DependencyData/RehabilitationExpendElectInd"/>
									<xsl:with-param name="BackupName">
										  IRS3468ProvisionalEmissionRtApprvlInd
										</xsl:with-param>
								</xsl:call-template>
							</input>
						</div>
					</div>
					<!-- End 1c  -->
					<!-- Line 1d -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:4mm;padding-left:4mm;">d</div>
						<div class="styLNDesc" style="height:4mm;width:85mm;">
                              Enter the dates for the 24- or 60-month measuring period.
                            </div>
					</div>
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:4mm;padding-left:4mm;"/>
						<div class="styLNDesc" style="height:4mm;width:21mm">
							 Beginning Date:
							</div>
						<span class="styUnderlineAmount" style="float:left; width:15mm;border-bottom-width:1px;
							    text-align:left;">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$DependencyData/RehabilitationPeriodBeginDt"/>
							</xsl:call-template>
						</span>
					</div>
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:4mm;padding-left:4mm;"/>
						<div class="styLNDesc" style="width:13mm;height:4mm;">
							 End Date:
							</div>
						<span class="styUnderlineAmount" style="float:left; width:15mm;border-bottom-width:1px;
							    text-align:left;">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$DependencyData/RehabilitationPeriodEndDt"/>
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
								<xsl:with-param name="TargetNode" select="$DependencyData/AdjustedBasisOfBuildingAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- End of 1e -->
					<!--Line 1f -->
					<div style="height:7.5mm;width:187mm;font-size:8pt">
						<div class="styLNLeftNumBox" style="height:4mm;padding-top:.5mm;padding-left:4mm">f</div>
						<div class="styLNDesc" style="height:7.5mm;width:143mm;padding-top:1mm;padding-left:0mm;">
						  Enter the amount of the qualified rehabilitation expenditures incurred, or treated as incurred,
						   during the period on line 1d above
							<!--Dotted Line-->
							<div class="styDotLn" style="float:none;">.........................</div>
						</div>
						<div class="styLNAmountBox" style="height:7.5mm;width:30mm;padding-top:4mm;border-left-width:0px;
						 border-bottom-width:1px;">$
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$DependencyData/QlfyRehbltExpendIncurredAmt"/>
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
						<div class="styLNAmountBox" style="height:7.5mm;width:27mm;padding-top:4mm;font-size:7pt">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$DependencyData/QlfyRehabilitationExpendAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBoxNBB" style="height:7.5mm;background-color:lightgrey;
						 border-right-width:0mm"/>
						<div class="styLNAmountBox" style="height:7.5mm;width:27mm;border-bottom-width:0px;"/>
						<div class="styLNRightNumBoxNBB" style="height:7.5mm;background-color:lightgrey;
						 border-left-width:1px;border-right-width:0px; width: 8.1mm;"/>
						<div class="styLNAmountBox" style="height:7.5mm;width:27mm;border-left-width:1px;
						  border-bottom-width:0px;"/>
					</div>
					<!-- Line 1k pt 1-->
					<div style="height:6mm;width:187mm">
						<div class="styLNLeftNumBox" style="height:20mm;padding-bottom:.5mm;padding-left:4mm;">k</div>
						<div class="styLNDesc" style="width:108mm;height:20mm;">
						<span style="float: left; padding-left:0mm;">If you completed line 1j, enter the following.
						  <br/>  (i) The assigned NPS  project number: 
							<span class="styFixedUnderline" style="width:30mm;padding-top:.1mm;padding-bottom:0mm;
								text-align:center; float: none;">
								<xsl:choose>
									<xsl:when test="$DependencyData/NPSProjectNum">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$DependencyData/NPSProjectNum"/>
										</xsl:call-template>
									</xsl:when>
									<xsl:when test="$DependencyData/PassThroughEntityEIN">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$DependencyData/PassThroughEntityEIN"/>
										</xsl:call-template>
									</xsl:when>
									<xsl:when test="$DependencyData/MissingEINReasonCd">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$DependencyData/MissingEINReasonCd"/>
										</xsl:call-template>
									</xsl:when>
								</xsl:choose>
							</span>
							</span>
						</div>
						<div class="styLNRightNumBox" style="height:11mm;padding-top:3.5mm;
						 border-bottom-width:0px;background-color:lightgrey"/>
						<div class="styLNAmountBox" style="height:11mm;width:27mm;padding-top:4mm;
						 border-bottom-width:0px;"/>
						<div class="styLNRightNumBox" style="height:11mm;padding-top:3.5mm;
						 border-bottom-width:0px;background-color:lightgrey;"/>
						<div class="styLNAmountBox" style="height:11mm;width:27mm;border-left-width:1px;
						  border-bottom-width:0px;"/>
					</div>
					<!-- End of 1k pt 1 -->
					<!-- Line 1k pt 2-->
					<div style="width:187mm; height: 5mm;">
						<div class="styLNLeftNumBox" style="height:4mm;padding-bottom:.5mm;padding-left:4mm"/>
						<div class="styLNDesc" style="width:108mm;height:8mm;">
							<br/>
							<span style="float:left;padding-left:0mm;">(ii)  The originating pass-through entity's EIN (if applicable):  </span>
							<span style="width:6mm"/> 
							<span class="styFixedUnderline" style="width:16mm;padding-top:.1mm;padding-bottom:0mm;
								text-align:center">
								<xsl:call-template name="PopulateEIN">
									<xsl:with-param name="TargetNode" select="$DependencyData/PassThroughEntityEIN"/>
								</xsl:call-template>
							</span>
						</div>
						<div class="styLNRightNumBox" style="height:8mm;padding-top:3.5mm;
						 border-bottom-width:0px;background-color:lightgrey"/>
						<div class="styLNAmountBox" style="height:8mm;width:27mm;padding-top:4mm;
						 border-bottom-width:0px;"/>
						<div class="styLNRightNumBox" style="height:8mm;padding-top:3.5mm;
						 border-bottom-width:0px;background-color:lightgrey;"/>
						<div class="styLNAmountBox" style="height:7.5mm;width:27mm;border-left-width:1px;
						  border-bottom-width:0px;"/>
					</div>
					<!-- End of 1k pt 2 -->
					<!-- Line 1k pt3-->
					<div style="width:187mm">
						<div class="styLNLeftNumBox" style="height:4mm;padding-bottom:.5mm;padding-left:4mm"/>
						<div class="styLNDesc" style="width:108mm;height:12mm;">
							<br/>
							<span style="float:left;padding-left:0mm;">(iii)  The date the NPS approved the Request for Certification of Completed Work:</span>
							<span style="width:4mm"/>
							<span class="styFixedUnderline" style="width:16mm;padding-top:.1mm;padding-bottom:0mm;
								text-align:center">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$DependencyData/NPSApprovalDt"/>
								</xsl:call-template>
							</span>
						</div>
						<div class="styLNRightNumBox" style="height:12mm;padding-top:3.5mm;
						 border-bottom-width:0px;background-color:lightgrey"/>
						<div class="styLNAmountBox" style="height:12mm;width:27mm;padding-top:4mm;
						 border-bottom-width:0px;"/>
						<div class="styLNRightNumBox" style="height:12mm;padding-top:3.5mm;
						 border-bottom-width:0px;background-color:lightgrey;"/>
						<div class="styLNAmountBox" style="height:12mm;width:27mm;border-left-width:1px;
						  border-bottom-width:0px;"/>
					</div>
					<!-- End of 1k pt 3 -->
					<!-- Start of 1m -->
					<div style="height:18mm;width:187mm">
						<div class="styLNLeftNumBox" style="height:20mm;padding-bottom:.5mm;padding-left:4mm;">m</div>
						<div class="styLNDesc" style="width:108mm;height:20mm;">
						<span style="float: left; padding-left:0mm;">If you have not received an approved certification of completed work,
						enter the date that is 30 months after the date that the original rehabilitation credit was claimed for the property: 
						  <!--<br/>  (i) The assigned NPS  project number: -->
							<span class="styFixedUnderline" style="width:30mm;padding-top:.1mm;padding-bottom:0mm;
								text-align:center; float: none;">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$DependencyData/SpcfdDtAftrOrigRehbltCrClaimDt"/>
								</xsl:call-template>
							</span>, and attach the first page of NPS-Form 10-168, with an indication that it was received, and a statement
							that you did not receive the final certification of completed work before the date above.
							</span>
						</div>
						<div class="styLNRightNumBox" style="height:18mm;padding-top:3.5mm;
						 border-bottom-width:0px;background-color:lightgrey"/>
						<div class="styLNAmountBox" style="height:18mm;width:27mm;padding-top:4mm;
						 border-bottom-width:0px;"/>
						<div class="styLNRightNumBox" style="height:18mm;padding-top:3.5mm;
						 border-bottom-width:0px;background-color:lightgrey;"/>
						<div class="styLNAmountBox" style="height:18mm;width:27mm;border-left-width:1px;
						  border-bottom-width:0px;"/>
					</div>
					<!-- End of 1m -->
					<!-- Line 2 -->
					<div class="styBB" style="width:187mm;border-top-width:0px;">
						<div style="height:7.5mm;width:187mm;font-size:8pt">
							<div class="styLNLeftNumBox" style="height:4mm;padding-top:.5mm;padding-left:2mm">2</div>
							<div class="styLNDesc" style="height:7.5mm;width:108mm;padding-top:0mm;">
						  Enter the applicable unused investment credit from cooperatives (see instructions)
						  <!--Dotted Line-->
						  <span class="styDotLn" style="float:right;">.....................</span>
							</div>
							<div class="styLNRightNumBox" style="height:7.5mm;padding-top:3.5mm;border-bottom-width:0mm">2</div>
							<div class="styLNAmountBox" style="height:7.5mm;width:27mm;padding-top:4mm;border-bottom-width:0mm">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$DependencyData/UnusedCrRehbltEgyCrFromCoopAmt"/>
								</xsl:call-template>
							</div>
							<div class="styLNRightNumBoxNBB" style="height:7.5mm;background-color:lightgrey;"/>
							<div class="styLNAmountBox" style="height:7.5mm;width:27mm;border-left-width:1px;
						  border-bottom-width:0px;"/>
						</div>
					</div>
					<!-- End of 2 -->
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
							<input class="styLeftoverTableBtn" TabIndex="1" type="button" value="Return to Form" onclick="javascript:returnToWriteInImage();"/>
						</div>
					</div>
					<table class="styLeftOverTbl">
						<xsl:call-template name="PopulateCommonLeftover">
							<xsl:with-param name="TargetNode" select="$DependencyData"/>
							<xsl:with-param name="DescWidth" select="100"/>
						</xsl:call-template>
						<xsl:if test="$DependencyData/CertifiedHistoricStructures/@historicStructureCertOnFile">
							<tr>
								<td class="styLeftOverTableRowDesc" style="width:110mm;" scope="row">
									Line 1g - Certified Historic Structure on File:
								</td>
								<td class="styLeftOverTableRowAmount" style="width:100mm;text-align:left;">
									<xsl:choose>
										<xsl:when test="$DependencyData/
										CertifiedHistoricStructures/@historicStructureCertOnFile = '1'">
											<xsl:call-template name="PopulateYesBoxText">
												<xsl:with-param name="TargetNode" select="$DependencyData/
												CertifiedHistoricStructures/  @historicStructureCertOnFile"/>
											</xsl:call-template>
										</xsl:when>
										<xsl:otherwise>
											<xsl:call-template name="PopulateNoBoxText">
												<xsl:with-param name="TargetNode" select="$DependencyData/
												CertifiedHistoricStructures/  @historicStructureCertOnFile"/>
											</xsl:call-template>
										</xsl:otherwise>
									</xsl:choose>
								</td>
							</tr>
						</xsl:if>
					</table>
					<!-- ***** Begin Separated ***** -->
					<xsl:if test="($Print = $Separated) and (count($DependencyData/InvstCreditLesseeSect48dGrp) &gt;1)">
						<br/>
						<span class="styRepeatingDataTitle">Form 3468 Part I Line 14a-14e - Investment Credit Lessee
						</span>
						<table class="styDepTbl" style="font-size: 7pt">
							<thead class="styTableThead">
								<tr class="styDepTblHdr">
									<th scope="col" class="styDepTblCell" style="border-right-width: 0px; width: 53mm">(a)
										<span class="styNormalText">
										   Lessee Name and Address
										</span>
									</th>
									<!--
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
								<xsl:for-each select="$DependencyData/InvstCreditLesseeSect48dGrp">
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
													<xsl:with-param name="TargetNode" select="LessorBusinessName/BusinessNameLine1Txt"/>
												</xsl:call-template>
												<xsl:if test="LessorBusinessName/BusinessNameLine2Txt != ''">
													<br/>
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="LessorBusinessName/BusinessNameLine2Txt"/>
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
