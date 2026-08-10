<?xml version="1.0"?>
<!DOCTYPE xsl:stylesheet [
	<!ENTITY nbsp "&#160;"> 
	<!-- 04/24/2025 - 1583708 - AJH -->
]>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:include href="PopulateTemplate.xsl"/>
	<xsl:include href="CommonPathRef.xsl"/>
	<xsl:include href="AddHeader.xsl"/>
	<xsl:include href="AddOnTable.xsl"/>
	<xsl:include href="IRS7213Style.xsl"/>
	<xsl:output method="html" indent="yes" encoding="iso-8859-1"/>
	<xsl:strip-space elements="*"/>
	<xsl:param name="Form7213Data" select="$RtnDoc/IRS7213"/>
	<xsl:template match="/">
		<xsl:text disable-output-escaping="yes">&lt;!DOCTYPE html&gt;</xsl:text>
		<html>
			<head>
				<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
				<title>
					<xsl:call-template name="FormTitle">
						<xsl:with-param name="RootElement" select="local-name($Form7213Data)"/>
					</xsl:call-template>
				</title>
				<!-- No Browser Caching -->
				<meta http-equiv="Pragma" content="no-cache"/>
				<meta http-equiv="Cache-Control" content="no-cache"/>
				<meta http-equiv="Expires" content="0"/>
				<!-- No Proxy Caching -->
				<meta http-equiv="Cache-Control" content="private"/>
				<meta name="Description" content="IRS Form 7213"/>
				<meta name="Generator" content="IBM WebSphere Studio"/>
				<script language="JavaScript" src="{$ScriptPath}/FormDisplay.js" type="text/javascript"/>
				<xsl:call-template name="InitJS"/>
				<style type="text/css">
					<!-- PRINT STATEMENT -->
					<xsl:if test="not($Print) or $Print=''">
						<xsl:call-template name="IRS7213Style"/>
						<xsl:call-template name="AddOnStyle"/>
					</xsl:if>
				</style>
				<xsl:call-template name="GlobalStylesForm"/>
			</head>
			<body class="styBodyClass">
				<form id="Form7213" style="font-family:verdana; font-size:7pt">
					<xsl:call-template name="DocumentHeader"/>
					<!-- Begin Form title and Form number section -->
					<div class="styBB" style="width:187mm;float:none;clear:both;">
						<div class="styFNBox" style="width:33mm;height:21mm;font-size:8pt;">
							Form <span class="styFormNumber">7213</span>
							<br/>
							<span style="font-size:7pt;font-weight:normal;">(Rev. January 2025)</span>
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$Form7213Data"/>
							</xsl:call-template>
							<br/>
							<div class="styAgency" style="padding-bottom:1mm;padding-top:2mm;font-size:8pt;"> Department of the Treasury<br/>
							Internal Revenue Service</div>
						</div>
						<div class="styFTBox" style="width:123mm;">
							<div class="styMainTitle" style="padding-top:4mm;">
							  Nuclear Power Production Credit</div>
							<br/>
							<div class="styFST" style="padding-top:0mm;font-weight:bold;">
								Attach to your tax return.
							</div>
							<div class="styFST" style="width:123mm;float:left;clear:none;padding-top:.5mm;">
								<!--<img src="{$ImagePath}/7213_Bullet.gif" alt="bullet image"/>-->
								Go to  			
								<a style="text-decoration:none;color:black;" href="http://www.irs.gov/form7213" title="Link to IRS.gov">
									<i>www.irs.gov/Form7213</i>
								</a> for instructions and the latest information.
							</div>
						</div>
						<div class="styTYBox" style="width:29mm;height:21mm;padding-top:5mm;">
							<div class="styOMB" style="height:5.5mm;">OMB No. 1545-0123</div>
							<div class="styOMB" style="border-bottom-width:0px;text-align:left;padding-left:2.75mm;padding-top:1mm;">
								<div style="padding-top:1mm;text-align:left;font-size:7pt;">
								Attachment<br/>Sequence No. 
<span class="styBoldText" style="font-size:9pt;">213</span>
								</div>
							</div>
						</div>
					</div>
					<!-- End form title and Form number Section -->
					<div class="styStdDiv" style="border-top:1px solid black;border-bottom:1px solid black;">
						<div class="styNameBox" style="width:142mm;font-size:7pt;">
							Name(s) shown on return<br/>
							<xsl:call-template name="PopulateReturnHeaderFiler">
								<xsl:with-param name="TargetNode">BusinessNameLine1Txt</xsl:with-param>
							</xsl:call-template>
							<br/>
							<xsl:call-template name="PopulateReturnHeaderFiler">
								<xsl:with-param name="TargetNode">BusinessNameLine2Txt</xsl:with-param>
							</xsl:call-template>
						</div>
						<div class="styEINBox" style="width:45mm;padding-left:0.5mm;font-weight:bold;font-size:7pt;">
							Identifying number<br/><br/>
							<xsl:call-template name="PopulateReturnHeaderFilerTIN"/>
						</div>
					</div>
					<!-- End Name and Identifying Number Section-->
					<!-- Part I  -->
					<div class="styBB" style="width:187mm;height:6mm;float:none;border-top-width:0px;padding-bottom:0.0mm;padding-top:0.0mm;">
						<span class="styPartName" style="font-size:10pt;width:14mm;height:6mm;padding-top:0.5mm;padding-bottom:0.0">Part l</span>
						<!--Part I-->
						<span style="width:142mm;font-size:9pt;padding-top:1mm" class="styPartDesc">Credit for Production From Advanced Nuclear Power Facilities, Section 45J</span>
					</div>
					<!-- Section  -->
					<div class="styBB" style="width:187mm;float:none;border-top-width:0px;padding-top:.5mm;padding-bottom:2.5mm;">
						<!--Section I-->
						<span style="width:150mm;padding-top:0.5mm;height:3mm;" class="styPartDesc">Section 1: Information on Advanced Nuclear Power Facility</span>
					</div>
					<div class="styBB" style="width:187mm;float:none;border-top-width:0px;padding-bottom:1.5mm;padding-top:1.5mm;">
						<!-- Line 1a -->
						<div class="styStdDiv">
							<div class="styLNLeftNumBoxSD" style="padding-left:2mm;">1a</div>
							<div class="styLNDesc" style="width:50mm;alingn:left;">Name or description of nuclear facility: </div>
							<div class="styLNDesc" style="width:128mm;min-height:2.5mm;height:auto;border-bottom:1px dashed black;margin-bottom:1px;">							
							
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$Form7213Data/AdvncNuclearPwrFcltyProdCrGrp/FacilityDesc"/>
								</xsl:call-template>
							</div>
						</div>
						<div class="styStdDiv">
							<div class="styLNLeftNumBox">&nbsp;</div>
							<div class="styGenericDiv" style="width:178.9mm;height:3mm;border-bottom:1px solid black;"/>
						</div>
						<!-- Line 1b Owner's Name -->
						<div class="styStdDiv">
							<div class="styStdDiv" style="height:8.25mm; overflow: hidden;">
							<div class="styLNLeftNumBoxSD" style="padding-left:3.6mm;">b</div>
							<div class="styLNDesc" style="width:58mm;">If different than filer, enter (i) owner’s name: </div>
							<div class="styLNDesc" style="width:105mm;margin-bottom:1px;text-align:left;">
							<xsl:choose>
										<xsl:when test="(($Form7213Data/AdvncNuclearPwrFcltyProdCrGrp/FacilityOwnerPersonNm !='') and
										 ($RtnHdrData/Filer/NameLine1Txt != $Form7213Data/AdvncNuclearPwrFcltyProdCrGrp/FacilityOwnerPersonNm)) ">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" 
												 select="$Form7213Data/AdvncNuclearPwrFcltyProdCrGrp/FacilityOwnerPersonNm"/>
											</xsl:call-template>
												<div class="styGenericDiv" style="width:105mm;height:1mm;border-bottom:1px solid black;"></div>
										</xsl:when>
											<xsl:otherwise>
												<xsl:if test="(($Form7213Data/AdvncNuclearPwrFcltyProdCrGrp/FacilityOwnerBusinessName/BusinessNameLine1Txt 
												 !='') and ($Form7213Data/AdvncNuclearPwrFcltyProdCrGrp/FacilityOwnerBusinessName/BusinessNameLine2Txt 
												 !='') and
												 ($RtnHdrData/Filer/NameLine1Txt != 
												  $Form7213Data/AdvncNuclearPwrFcltyProdCrGrp/FacilityOwnerBusinessName/BusinessNameLine1Txt ) and ($RtnHdrData/Filer/NameLine1Txt != 
												  $Form7213Data/AdvncNuclearPwrFcltyProdCrGrp/FacilityOwnerBusinessName/BusinessNameLine2Txt )) ">									
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" 
														select="$Form7213Data/AdvncNuclearPwrFcltyProdCrGrp/FacilityOwnerBusinessName/BusinessNameLine1Txt "/>
													</xsl:call-template><br/>
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" 
														select="$Form7213Data/AdvncNuclearPwrFcltyProdCrGrp/FacilityOwnerBusinessName/BusinessNameLine2Txt "/>
													</xsl:call-template>
														<div class="styGenericDiv" style="width:105mm;height:1mm;border-bottom:1px solid black;"></div>
												</xsl:if>
														<div class="styGenericDiv" style="width:105mm;height:1mm;padding-top:3mm;border-bottom:1px solid black;"></div>
											</xsl:otherwise>
									</xsl:choose>
									
							
						
									
							</div>
						<!-- Line b (2nd line) -->
							</div>
							<div class="styStdDiv" style="height:6mm;">
							<div class="styLNLeftNumBoxSD" style="padding-left:4mm;">&nbsp;</div>
							<div class="styLNDesc" style="width:27mm;">and (ii) owner’s TIN: </div>
							<div class="styLNDesc" style="width:30mm;border-bottom:1px solid black;margin-bottom:1px;text-align:left;">
							<xsl:choose>
											<xsl:when test="(($Form7213Data/AdvncNuclearPwrFcltyProdCrGrp/FacilityOwnerSSN !='') and
											 ($RtnHdrData/Filer/PrimarySSN != $Form7213Data/AdvncNuclearPwrFcltyProdCrGrp/FacilityOwnerSSN)) ">											
												<xsl:call-template name="PopulateSSN">
													<xsl:with-param name="TargetNode" select="$Form7213Data/AdvncNuclearPwrFcltyProdCrGrp/FacilityOwnerSSN"/>
												</xsl:call-template>
											</xsl:when>
												<xsl:otherwise>
													<xsl:if test="(($Form7213Data/AdvncNuclearPwrFcltyProdCrGrp/FacilityOwnerEIN !='') and
													 ($RtnHdrData/Filer/PrimarySSN != $Form7213Data/AdvncNuclearPwrFcltyProdCrGrp/FacilityOwnerEIN)) ">											
														<xsl:call-template name="PopulateEIN">
															<xsl:with-param name="TargetNode" 
															select="$Form7213Data/AdvncNuclearPwrFcltyProdCrGrp/FacilityOwnerEIN"/>
														</xsl:call-template>
													</xsl:if>	
												</xsl:otherwise>
										</xsl:choose>
							</div>
							</div>
							
						<!-- Line 2a -->
							<div class="styStdDiv">
								<div class="styLNLeftNumBoxSD" style="padding-left:1.7mm;">2a</div>
								<div class="styLNDesc" style="width:43mm;">Address of facility (if applicable):</div>
								<div class="styLNDesc" style="width:135mm;min-height:3.5mm;height:auto;border-bottom:1px dashed black;margin-bottom:1px;">
									<xsl:call-template name="PopulateUSAddressTemplate">
										<xsl:with-param name="TargetNode" select="$Form7213Data/AdvncNuclearPwrFcltyProdCrGrp/FacilityUSAddress"/>
									</xsl:call-template>
								</div>
							</div>
							
						<!-- Line 2a Line Only -->
							<div class="styStdDiv">
								<div class="styLNLeftNumBox">&nbsp;</div>
								<div class="styLNDesc" style="width:178.9mm;min-height:3mm;height:auto;border-bottom:1px solid black;">
								</div>
								</div>
								
						<!-- Line 2b -->
							<div class="styStdDiv" style="width:187mm;height:10mm;padding-top:1mm;overflow:hidden;">
							<div class="styLNLeftLtrBox" style="padding-top:2mm;width:8mm;height:5mm;">b</div>
							<div style="width:179mm;">
								Coordinates.
								<span style="width:2mm">&nbsp;</span>
								<b>(i)</b> Latitude:
								<!-- Latitude/Longitutude may begin with a '+' or '-' -->
								<xsl:choose>
									<xsl:when test="substring($Form7213Data/AdvncNuclearPwrFcltyProdCrGrp/FacilityLatitudeNum/text(),1,1) = '+' or 
									 substring($Form7213Data/AdvncNuclearPwrFcltyProdCrGrp/FacilityLatitudeNum/text(),1,1) = '-'">
										<div>
											<xsl:call-template name="PopulateIndividualSizableLetterBox">
												<xsl:with-param name="TargetNode" select="$Form7213Data/AdvncNuclearPwrFcltyProdCrGrp/FacilityLatitudeNum"/>
												<xsl:with-param name="BoxNum" select="1"/>
												<xsl:with-param name="BoxWidth" select="'4.5mm'"/>
												<xsl:with-param name="BoxHeight" select="'4.5mm'"/>
												<xsl:with-param name="BoxTopPadding" select="'.5mm'"/>
											</xsl:call-template>
										</div>
										<span style="width:3mm">&nbsp;</span>
										<div>
											<xsl:call-template name="PopulateIndividualSizableLetterBox">
												<xsl:with-param name="TargetNode" select="$Form7213Data/AdvncNuclearPwrFcltyProdCrGrp/FacilityLatitudeNum"/>
												<xsl:with-param name="BoxNum" select="2"/>
												<xsl:with-param name="BoxWidth" select="'4.5mm'"/>
												<xsl:with-param name="BoxHeight" select="'4.5mm'"/>
												<xsl:with-param name="BoxTopPadding" select="'.5mm'"/>
											</xsl:call-template>
										</div>
										<div>
											<xsl:call-template name="PopulateIndividualSizableLetterBox">
												<xsl:with-param name="TargetNode" select="$Form7213Data/AdvncNuclearPwrFcltyProdCrGrp/FacilityLatitudeNum"/>
												<xsl:with-param name="BoxNum" select="3"/>
												<xsl:with-param name="BoxWidth" select="'4.5mm'"/>
												<xsl:with-param name="BoxHeight" select="'4.5mm'"/>
												<xsl:with-param name="BoxTopPadding" select="'.5mm'"/>
											</xsl:call-template>
										</div>
										.
										<div>
											<xsl:call-template name="PopulateIndividualSizableLetterBox">
												<xsl:with-param name="TargetNode" select="$Form7213Data/AdvncNuclearPwrFcltyProdCrGrp/FacilityLatitudeNum"/>
												<xsl:with-param name="BoxNum" select="5"/>
												<xsl:with-param name="BoxWidth" select="'4.5mm'"/>
												<xsl:with-param name="BoxHeight" select="'4.5mm'"/>
												<xsl:with-param name="BoxTopPadding" select="'.5mm'"/>
											</xsl:call-template>
										</div>
										<div>
											<xsl:call-template name="PopulateIndividualSizableLetterBox">
												<xsl:with-param name="TargetNode" select="$Form7213Data/AdvncNuclearPwrFcltyProdCrGrp/FacilityLatitudeNum"/>
												<xsl:with-param name="BoxNum" select="6"/>
												<xsl:with-param name="BoxWidth" select="'4.5mm'"/>
												<xsl:with-param name="BoxHeight" select="'4.5mm'"/>
												<xsl:with-param name="BoxTopPadding" select="'.5mm'"/>
											</xsl:call-template>
										</div>
										<div>
											<xsl:call-template name="PopulateIndividualSizableLetterBox">
												<xsl:with-param name="TargetNode" select="$Form7213Data/AdvncNuclearPwrFcltyProdCrGrp/FacilityLatitudeNum"/>
												<xsl:with-param name="BoxNum" select="7"/>
												<xsl:with-param name="BoxWidth" select="'4.5mm'"/>
												<xsl:with-param name="BoxHeight" select="'4.5mm'"/>
												<xsl:with-param name="BoxTopPadding" select="'.5mm'"/>
											</xsl:call-template>
										</div>
										<div>
											<xsl:call-template name="PopulateIndividualSizableLetterBox">
												<xsl:with-param name="TargetNode" select="$Form7213Data/AdvncNuclearPwrFcltyProdCrGrp/FacilityLatitudeNum"/>
												<xsl:with-param name="BoxNum" select="8"/>
												<xsl:with-param name="BoxWidth" select="'4.5mm'"/>
												<xsl:with-param name="BoxHeight" select="'4.5mm'"/>
												<xsl:with-param name="BoxTopPadding" select="'.5mm'"/>
											</xsl:call-template>
										</div>
										<div>
											<xsl:call-template name="PopulateIndividualSizableLetterBox">
												<xsl:with-param name="TargetNode" select="$Form7213Data/AdvncNuclearPwrFcltyProdCrGrp/FacilityLatitudeNum"/>
												<xsl:with-param name="BoxNum" select="9"/>
												<xsl:with-param name="BoxWidth" select="'4.5mm'"/>
												<xsl:with-param name="BoxHeight" select="'4.5mm'"/>
												<xsl:with-param name="BoxTopPadding" select="'.5mm'"/>
											</xsl:call-template>
										</div>
										<div>
											<xsl:call-template name="PopulateIndividualSizableLetterBox">
												<xsl:with-param name="TargetNode" select="$Form7213Data/AdvncNuclearPwrFcltyProdCrGrp/FacilityLatitudeNum"/>
												<xsl:with-param name="BoxNum" select="10"/>
												<xsl:with-param name="BoxWidth" select="'4.5mm'"/>
												<xsl:with-param name="BoxHeight" select="'4.5mm'"/>
												<xsl:with-param name="BoxTopPadding" select="'.5mm'"/>
											</xsl:call-template>
										</div>
										<div>
											<xsl:call-template name="PopulateIndividualSizableLetterBox">
												<xsl:with-param name="TargetNode" select="$Form7213Data/AdvncNuclearPwrFcltyProdCrGrp/FacilityLatitudeNum"/>
												<xsl:with-param name="BoxNum" select="10"/>
												<xsl:with-param name="BoxWidth" select="'4.5mm'"/>
												<xsl:with-param name="BoxHeight" select="'4.5mm'"/>
												<xsl:with-param name="BoxTopPadding" select="'.5mm'"/>
											</xsl:call-template>
										</div>
										<div>
											<xsl:call-template name="PopulateIndividualSizableLetterBox">
												<xsl:with-param name="TargetNode" select="$Form7213Data/AdvncNuclearPwrFcltyProdCrGrp/FacilityLatitudeNum"/>
												<xsl:with-param name="BoxNum" select="10"/>
												<xsl:with-param name="BoxWidth" select="'4.5mm'"/>
												<xsl:with-param name="BoxHeight" select="'4.5mm'"/>
												<xsl:with-param name="BoxTopPadding" select="'.5mm'"/>
											</xsl:call-template>
										</div>
									</xsl:when>
									<xsl:otherwise>
										<div class="sty7207EmptyLonLatBox"/>
										<span style="width:3mm">&nbsp;</span>
										<div>
											<xsl:call-template name="PopulateIndividualSizableLetterBox">
												<xsl:with-param name="TargetNode" select="$Form7213Data/AdvncNuclearPwrFcltyProdCrGrp/FacilityLatitudeNum"/>
												<xsl:with-param name="BoxNum" select="1"/>
												<xsl:with-param name="BoxWidth" select="'4.5mm'"/>
												<xsl:with-param name="BoxHeight" select="'4.5mm'"/>
												<xsl:with-param name="BoxTopPadding" select="'.5mm'"/>
											</xsl:call-template>
										</div>
										<span style="width:3mm">&nbsp;</span>
										<div>
											<xsl:call-template name="PopulateIndividualSizableLetterBox">
												<xsl:with-param name="TargetNode" select="$Form7213Data/AdvncNuclearPwrFcltyProdCrGrp/FacilityLatitudeNum"/>
												<xsl:with-param name="BoxNum" select="2"/>
												<xsl:with-param name="BoxWidth" select="'4.5mm'"/>
												<xsl:with-param name="BoxHeight" select="'4.5mm'"/>
												<xsl:with-param name="BoxTopPadding" select="'.5mm'"/>
											</xsl:call-template>
										</div>
										<div>
											<xsl:call-template name="PopulateIndividualSizableLetterBox">
												<xsl:with-param name="TargetNode" select="$Form7213Data/AdvncNuclearPwrFcltyProdCrGrp/FacilityLatitudeNum"/>
												<xsl:with-param name="BoxNum" select="4"/>
												<xsl:with-param name="BoxWidth" select="'4.5mm'"/>
												<xsl:with-param name="BoxHeight" select="'4.5mm'"/>
												<xsl:with-param name="BoxTopPadding" select="'.5mm'"/>
											</xsl:call-template>
										</div> 
										. 
										<div>
											<xsl:call-template name="PopulateIndividualSizableLetterBox">
												<xsl:with-param name="TargetNode" select="$Form7213Data/AdvncNuclearPwrFcltyProdCrGrp/FacilityLatitudeNum"/>
												<xsl:with-param name="BoxNum" select="5"/>
												<xsl:with-param name="BoxWidth" select="'4.5mm'"/>
												<xsl:with-param name="BoxHeight" select="'4.5mm'"/>
												<xsl:with-param name="BoxTopPadding" select="'.5mm'"/>
											</xsl:call-template>
										</div>
										<div>
											<xsl:call-template name="PopulateIndividualSizableLetterBox">
												<xsl:with-param name="TargetNode" select="$Form7213Data/AdvncNuclearPwrFcltyProdCrGrp/FacilityLatitudeNum"/>
												<xsl:with-param name="BoxNum" select="6"/>
												<xsl:with-param name="BoxWidth" select="'4.5mm'"/>
												<xsl:with-param name="BoxHeight" select="'4.5mm'"/>
												<xsl:with-param name="BoxTopPadding" select="'.5mm'"/>
											</xsl:call-template>
										</div>
										<div>
											<xsl:call-template name="PopulateIndividualSizableLetterBox">
												<xsl:with-param name="TargetNode" select="$Form7213Data/AdvncNuclearPwrFcltyProdCrGrp/FacilityLatitudeNum"/>
												<xsl:with-param name="BoxNum" select="7"/>
												<xsl:with-param name="BoxWidth" select="'4.5mm'"/>
												<xsl:with-param name="BoxHeight" select="'4.5mm'"/>
												<xsl:with-param name="BoxTopPadding" select="'.5mm'"/>
											</xsl:call-template>
										</div>
										<div>
											<xsl:call-template name="PopulateIndividualSizableLetterBox">
												<xsl:with-param name="TargetNode" select="$Form7213Data/AdvncNuclearPwrFcltyProdCrGrp/FacilityLatitudeNum"/>
												<xsl:with-param name="BoxNum" select="8"/>
												<xsl:with-param name="BoxWidth" select="'4.5mm'"/>
												<xsl:with-param name="BoxHeight" select="'4.5mm'"/>
												<xsl:with-param name="BoxTopPadding" select="'.5mm'"/>
											</xsl:call-template>
										</div>
										<div>
											<xsl:call-template name="PopulateIndividualSizableLetterBox">
												<xsl:with-param name="TargetNode" select="$Form7213Data/AdvncNuclearPwrFcltyProdCrGrp/FacilityLatitudeNum"/>
												<xsl:with-param name="BoxNum" select="9"/>
												<xsl:with-param name="BoxWidth" select="'4.5mm'"/>
												<xsl:with-param name="BoxHeight" select="'4.5mm'"/>
												<xsl:with-param name="BoxTopPadding" select="'.5mm'"/>
											</xsl:call-template>
										</div>
										<div>
											<xsl:call-template name="PopulateIndividualSizableLetterBox">
												<xsl:with-param name="TargetNode" select="$Form7213Data/AdvncNuclearPwrFcltyProdCrGrp/FacilityLatitudeNum"/>
												<xsl:with-param name="BoxNum" select="9"/>
												<xsl:with-param name="BoxWidth" select="'4.5mm'"/>
												<xsl:with-param name="BoxHeight" select="'4.5mm'"/>
												<xsl:with-param name="BoxTopPadding" select="'.5mm'"/>
											</xsl:call-template>
										</div>
									</xsl:otherwise>
								</xsl:choose>
								<span style="width:3mm;"/>
								
								<b>(ii)</b> Longitude:
								<xsl:choose>
									<xsl:when test="substring($Form7213Data/AdvncNuclearPwrFcltyProdCrGrp/FacilityLongitudeNum/text(),1,1) = '+' or
									 substring($Form7213Data/AdvncNuclearPwrFcltyProdCrGrp/FacilityLongitudeNum/text(),1,1) = '-'">
										<div>
											<xsl:call-template name="PopulateIndividualSizableLetterBox">
												<xsl:with-param name="TargetNode" select="$Form7213Data/AdvncNuclearPwrFcltyProdCrGrp/FacilityLongitudeNum"/>
												<xsl:with-param name="BoxNum" select="1"/>
												<xsl:with-param name="BoxWidth" select="'4.5mm'"/>
												<xsl:with-param name="BoxHeight" select="'4.5mm'"/>
												<xsl:with-param name="BoxTopPadding" select="'.5mm'"/>
											</xsl:call-template>
										</div>
										<span style="width:3mm">&nbsp;</span>
										<div>
											<xsl:call-template name="PopulateIndividualSizableLetterBox">
												<xsl:with-param name="TargetNode" select="$Form7213Data/AdvncNuclearPwrFcltyProdCrGrp/FacilityLongitudeNum"/>
												<xsl:with-param name="BoxNum" select="2"/>
												<xsl:with-param name="BoxWidth" select="'4.5mm'"/>
												<xsl:with-param name="BoxHeight" select="'4.5mm'"/>
												<xsl:with-param name="BoxTopPadding" select="'.5mm'"/>
											</xsl:call-template>
										</div>
										<div>
											<xsl:call-template name="PopulateIndividualSizableLetterBox">
												<xsl:with-param name="TargetNode" select="$Form7213Data/AdvncNuclearPwrFcltyProdCrGrp/FacilityLongitudeNum"/>
												<xsl:with-param name="BoxNum" select="3"/>
												<xsl:with-param name="BoxWidth" select="'4.5mm'"/>
												<xsl:with-param name="BoxHeight" select="'4.5mm'"/>
												<xsl:with-param name="BoxTopPadding" select="'.5mm'"/>
											</xsl:call-template>
										</div>
										<div>
											<xsl:call-template name="PopulateIndividualSizableLetterBox">
												<xsl:with-param name="TargetNode" select="$Form7213Data/AdvncNuclearPwrFcltyProdCrGrp/FacilityLongitudeNum"/>
												<xsl:with-param name="BoxNum" select="4"/>
												<xsl:with-param name="BoxWidth" select="'4.5mm'"/>
												<xsl:with-param name="BoxHeight" select="'4.5mm'"/>
												<xsl:with-param name="BoxTopPadding" select="'.5mm'"/>
											</xsl:call-template>
										</div>
										.
										<div>
											<xsl:call-template name="PopulateIndividualSizableLetterBox">
												<xsl:with-param name="TargetNode" select="$Form7213Data/AdvncNuclearPwrFcltyProdCrGrp/FacilityLongitudeNum"/>
												<xsl:with-param name="BoxNum" select="6"/>
												<xsl:with-param name="BoxWidth" select="'4.5mm'"/>
												<xsl:with-param name="BoxHeight" select="'4.5mm'"/>
												<xsl:with-param name="BoxTopPadding" select="'.5mm'"/>
											</xsl:call-template>
										</div>
										<div>
											<xsl:call-template name="PopulateIndividualSizableLetterBox">
												<xsl:with-param name="TargetNode" select="$Form7213Data/AdvncNuclearPwrFcltyProdCrGrp/FacilityLongitudeNum"/>
												<xsl:with-param name="BoxNum" select="7"/>
												<xsl:with-param name="BoxWidth" select="'4.5mm'"/>
												<xsl:with-param name="BoxHeight" select="'4.5mm'"/>
												<xsl:with-param name="BoxTopPadding" select="'.5mm'"/>
											</xsl:call-template>
										</div>
										<div>
											<xsl:call-template name="PopulateIndividualSizableLetterBox">
												<xsl:with-param name="TargetNode" select="$Form7213Data/AdvncNuclearPwrFcltyProdCrGrp/FacilityLongitudeNum"/>
												<xsl:with-param name="BoxNum" select="8"/>
												<xsl:with-param name="BoxWidth" select="'4.5mm'"/>
												<xsl:with-param name="BoxHeight" select="'4.5mm'"/>
												<xsl:with-param name="BoxTopPadding" select="'.5mm'"/>
											</xsl:call-template>
										</div>
										<div>
											<xsl:call-template name="PopulateIndividualSizableLetterBox">
												<xsl:with-param name="TargetNode" select="$Form7213Data/AdvncNuclearPwrFcltyProdCrGrp/FacilityLongitudeNum"/>
												<xsl:with-param name="BoxNum" select="9"/>
												<xsl:with-param name="BoxWidth" select="'4.5mm'"/>
												<xsl:with-param name="BoxHeight" select="'4.5mm'"/>
												<xsl:with-param name="BoxTopPadding" select="'.5mm'"/>
											</xsl:call-template>
										</div>
										<div>
											<xsl:call-template name="PopulateIndividualSizableLetterBox">
												<xsl:with-param name="TargetNode" select="$Form7213Data/AdvncNuclearPwrFcltyProdCrGrp/FacilityLongitudeNum"/>
												<xsl:with-param name="BoxNum" select="10"/>
												<xsl:with-param name="BoxWidth" select="'4.5mm'"/>
												<xsl:with-param name="BoxHeight" select="'4.5mm'"/>
												<xsl:with-param name="BoxTopPadding" select="'.5mm'"/>
											</xsl:call-template>
										</div>
										<div>
											<xsl:call-template name="PopulateIndividualSizableLetterBox">
												<xsl:with-param name="TargetNode" select="$Form7213Data/AdvncNuclearPwrFcltyProdCrGrp/FacilityLongitudeNum"/>
												<xsl:with-param name="BoxNum" select="11"/>
												<xsl:with-param name="BoxWidth" select="'4.5mm'"/>
												<xsl:with-param name="BoxHeight" select="'4.5mm'"/>
												<xsl:with-param name="BoxTopPadding" select="'.5mm'"/>
											</xsl:call-template>
										</div>
									</xsl:when>
									<xsl:otherwise>
										<div class="sty7207EmptyLonLatBox"/>
										<span style="width:3mm">&nbsp;</span>
										<div>
											<xsl:call-template name="PopulateIndividualSizableLetterBox">
												<xsl:with-param name="TargetNode" select="$Form7213Data/AdvncNuclearPwrFcltyProdCrGrp/FacilityLongitudeNum"/>
												<xsl:with-param name="BoxNum" select="1"/>
												<xsl:with-param name="BoxWidth" select="'4.5mm'"/>
												<xsl:with-param name="BoxHeight" select="'4.5mm'"/>
												<xsl:with-param name="BoxTopPadding" select="'.5mm'"/>
											</xsl:call-template>
										</div>
										<span style="width:3mm">&nbsp;</span>
										<div>
											<xsl:call-template name="PopulateIndividualSizableLetterBox">
												<xsl:with-param name="TargetNode" select="$Form7213Data/AdvncNuclearPwrFcltyProdCrGrp/FacilityLongitudeNum"/>
												<xsl:with-param name="BoxNum" select="2"/>
												<xsl:with-param name="BoxWidth" select="'4.5mm'"/>
												<xsl:with-param name="BoxHeight" select="'4.5mm'"/>
												<xsl:with-param name="BoxTopPadding" select="'.5mm'"/>
											</xsl:call-template>
										</div>
										<div>
											<xsl:call-template name="PopulateIndividualSizableLetterBox">
												<xsl:with-param name="TargetNode" select="$Form7213Data/AdvncNuclearPwrFcltyProdCrGrp/FacilityLongitudeNum"/>
												<xsl:with-param name="BoxNum" select="3"/>
												<xsl:with-param name="BoxWidth" select="'4.5mm'"/>
												<xsl:with-param name="BoxHeight" select="'4.5mm'"/>
												<xsl:with-param name="BoxTopPadding" select="'.5mm'"/>
											</xsl:call-template>
										</div>
										<div>
											<xsl:call-template name="PopulateIndividualSizableLetterBox">
												<xsl:with-param name="TargetNode" select="$Form7213Data/AdvncNuclearPwrFcltyProdCrGrp/FacilityLongitudeNum"/>
												<xsl:with-param name="BoxNum" select="5"/>
												<xsl:with-param name="BoxWidth" select="'4.5mm'"/>
												<xsl:with-param name="BoxHeight" select="'4.5mm'"/>
												<xsl:with-param name="BoxTopPadding" select="'.5mm'"/>
											</xsl:call-template>
										</div> 
										. 
										<div>
											<xsl:call-template name="PopulateIndividualSizableLetterBox">
												<xsl:with-param name="TargetNode" select="$Form7213Data/AdvncNuclearPwrFcltyProdCrGrp/FacilityLongitudeNum"/>
												<xsl:with-param name="BoxNum" select="6"/>
												<xsl:with-param name="BoxWidth" select="'4.5mm'"/>
												<xsl:with-param name="BoxHeight" select="'4.5mm'"/>
												<xsl:with-param name="BoxTopPadding" select="'.5mm'"/>
											</xsl:call-template>
										</div>
										<div>
											<xsl:call-template name="PopulateIndividualSizableLetterBox">
												<xsl:with-param name="TargetNode" select="$Form7213Data/AdvncNuclearPwrFcltyProdCrGrp/FacilityLongitudeNum"/>
												<xsl:with-param name="BoxNum" select="7"/>
												<xsl:with-param name="BoxWidth" select="'4.5mm'"/>
												<xsl:with-param name="BoxHeight" select="'4.5mm'"/>
												<xsl:with-param name="BoxTopPadding" select="'.5mm'"/>
											</xsl:call-template>
										</div>
										<div>
											<xsl:call-template name="PopulateIndividualSizableLetterBox">
												<xsl:with-param name="TargetNode" select="$Form7213Data/AdvncNuclearPwrFcltyProdCrGrp/FacilityLongitudeNum"/>
												<xsl:with-param name="BoxNum" select="8"/>
												<xsl:with-param name="BoxWidth" select="'4.5mm'"/>
												<xsl:with-param name="BoxHeight" select="'4.5mm'"/>
												<xsl:with-param name="BoxTopPadding" select="'.5mm'"/>
											</xsl:call-template>
										</div>
										<div>
											<xsl:call-template name="PopulateIndividualSizableLetterBox">
												<xsl:with-param name="TargetNode" select="$Form7213Data/AdvncNuclearPwrFcltyProdCrGrp/FacilityLongitudeNum"/>
												<xsl:with-param name="BoxNum" select="9"/>
												<xsl:with-param name="BoxWidth" select="'4.5mm'"/>
												<xsl:with-param name="BoxHeight" select="'4.5mm'"/>
												<xsl:with-param name="BoxTopPadding" select="'.5mm'"/>
											</xsl:call-template>
										</div>
										<div>
											<xsl:call-template name="PopulateIndividualSizableLetterBox">
												<xsl:with-param name="TargetNode" select="$Form7213Data/AdvncNuclearPwrFcltyProdCrGrp/FacilityLongitudeNum"/>
												<xsl:with-param name="BoxNum" select="10"/>
												<xsl:with-param name="BoxWidth" select="'4.5mm'"/>
												<xsl:with-param name="BoxHeight" select="'4.5mm'"/>
												<xsl:with-param name="BoxTopPadding" select="'.5mm'"/>
											</xsl:call-template>
										</div>
										<div>
											<xsl:call-template name="PopulateIndividualSizableLetterBox">
												<xsl:with-param name="TargetNode" select="$Form7213Data/AdvncNuclearPwrFcltyProdCrGrp/FacilityLongitudeNum"/>
												<xsl:with-param name="BoxNum" select="10"/>
												<xsl:with-param name="BoxWidth" select="'4.5mm'"/>
												<xsl:with-param name="BoxHeight" select="'4.5mm'"/>
												<xsl:with-param name="BoxTopPadding" select="'.5mm'"/>
											</xsl:call-template>
										</div>
										<div>
											<xsl:call-template name="PopulateIndividualSizableLetterBox">
												<xsl:with-param name="TargetNode" select="$Form7213Data/AdvncNuclearPwrFcltyProdCrGrp/FacilityLongitudeNum"/>
												<xsl:with-param name="BoxNum" select="10"/>
												<xsl:with-param name="BoxWidth" select="'4.5mm'"/>
												<xsl:with-param name="BoxHeight" select="'4.5mm'"/>
												<xsl:with-param name="BoxTopPadding" select="'.5mm'"/>
											</xsl:call-template>
										</div>
									</xsl:otherwise>
								</xsl:choose>
							</div>
							<div style="width:144.5mm;margin-left:42.75mm;font-size:6pt;">
								<span>Enter a "+" (plus) or "-" (minus) sign in the first box.</span>
								<span style="width:26mm;">&nbsp;</span>
								<span>Enter a "+" (plus) or "-" (minus) sign in the first box.</span>
							</div>
						</div>
							
							
							<!-- %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% -->	
						
							
						</div>
						
						<!-- Line 3 -->
						<div class="styStdDiv">
							<div class="styLNLeftNumBoxSD" style="padding-left:2mm;">3</div>
							<div class="styLNDesc" style="width:52mm;">Construction start date (MM/DD/YYYY): </div>
							<div class="styLNDesc" style="width:55mm;border-bottom:1px solid black;margin-bottom:1px;text-align:left;">
								<xsl:call-template name="PopulateMonthDayYear">
									<xsl:with-param name="TargetNode" select="$Form7213Data/AdvncNuclearPwrFcltyProdCrGrp/FacilityConstructionStartDt"/>
								</xsl:call-template>
							</div>
						</div>
						<div class="styStdDiv">
							<div class="styLNLeftNumBox">&nbsp;</div>
						</div>
						
						<!-- Line 4 -->
						<div class="styStdDiv">
							<div class="styLNLeftNumBoxSD" style="padding-left:2mm;">4</div>
							<div class="styLNDesc" style="width:65mm;">Date facility was placed in service (MM/DD/YYYY):</div>
							<div class="styLNDesc" style="width:50mm;border-bottom:1px solid black;margin-bottom:1px;text-align:left;">
								<xsl:call-template name="PopulateMonthDayYear">
									<xsl:with-param name="TargetNode" select="$Form7213Data/AdvncNuclearPwrFcltyProdCrGrp/FacilityPlacedInServiceDt"/>
								</xsl:call-template>
							</div>
						</div>
						<div class="styStdDiv">
							<div class="styLNLeftNumBox">&nbsp;</div>
						</div>
						
						<!-- Line 5 -->
						<div class="styStdDiv">
							<div class="styLNLeftNumBoxSD" style="padding-left:2mm;">5</div>
							<div class="styLNDesc" style="width:40mm;">Facility nameplate capacity:</div>
							<div class="styLNDesc" style="width:50mm;border-bottom:1px solid black;margin-bottom:1px;text-align:left;">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$Form7213Data/AdvncNuclearPwrFcltyProdCrGrp/NameplateEnergyCapKWQty"/>
								</xsl:call-template>
							</div>
						</div>
						<div class="styStdDiv">
							<div class="styLNLeftNumBox">&nbsp;</div>
						</div>
						
						<!-- Line 6 -->
						<div class="styStdDiv">
							<div class="styLNLeftNumBoxSD" style="padding-left:2mm;">6</div>
							<div class="styLNDesc" style="width:60mm;">Facility nameplate capacity allocated to you:</div>
							<div class="styLNDesc" style="width:60mm;border-bottom:1px solid black;margin-bottom:1px;text-align:left;">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$Form7213Data/AdvncNuclearPwrFcltyProdCrGrp/AllocNameplateEnergyCapKWQty"/>
								</xsl:call-template>
							</div>
						</div>
						<div class="styStdDiv">
							<div class="styLNLeftNumBox">&nbsp;</div>
						</div>
						
						<!-- Line 7 -->
						<div class="styLNLeftNumBoxSD" style="height:7mm; padding-left:2mm;">7</div>
						<div class="styLNDesc" style="width:175mm;height:9mm;">
							<span style="float:left;">Date of acceptance letter from the IRS under Notice 2023-24, section 6.05 (MM/DD/YYYY):</span>
							<div class="styLNDesc" style="width:51.5mm;border-bottom:1px solid black;margin-bottom:1px;text-align:left;">
								<xsl:call-template name="PopulateMonthDayYear">
									<xsl:with-param name="TargetNode" select="$Form7213Data/AdvncNuclearPwrFcltyProdCrGrp/IRSAcceptanceLtrDt"/>
								</xsl:call-template>								
							</div>(attach <span>copy of letter)  </span>
						<xsl:call-template name="SetFormLinkInline">
							<xsl:with-param name="TargetNode" select="$Form7213Data/AdvncNuclearPwrFcltyProdCrGrp/IRSAcceptanceLtrDt"/>
								</xsl:call-template> 
						</div>
						
						<!-- Line 8 -->
						<!--<div class="styStdDiv" style="height:10mm;border:solid;">-->
						<div class="styLNLeftNumBoxSD" style="height:10mm;padding-top:1.5mm; padding-left:2mm;">8</div>
						<div style="width:178mm;height:10mm;padding-top:0;padding-bottom:0;margin-top:o;">
						    Check one:	
						    <input type="checkbox" alt="Facility Owner Checked" class="styCkbox">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$Form7213Data/AdvncNuclearPwrFcltyProdCrGrp/FacilityOwnerInd"/>
									<xsl:with-param name="BackupName">Form7213DataAdvncNuclearPwrFcltyProdCrGrpFacilityOwnerInd</xsl:with-param>
								</xsl:call-template>
							</input>
							<label>
							  <xsl:call-template name="PopulateLabel">
								  <xsl:with-param name="TargetNode" select="$Form7213Data/AdvncNuclearPwrFcltyProdCrGrp/FacilityOwnerInd"/>
								  <xsl:with-param name="BackupName">Form7213DataAdvncNuclearPwrFcltyProdCrGrpFacilityOwnerInd</xsl:with-param>
							  </xsl:call-template>
							<span style="line-height:4mm;">Owner of facility</span>
							</label>
							<span style="width:3mm;"></span>
	                        <input type="checkbox" alt="Eligible Project Partner Checked" class="styCkbox">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$Form7213Data/AdvncNuclearPwrFcltyProdCrGrp/EligibleProjectPartnerInd"/>
									<xsl:with-param name="BackupName">Form7213DataAdvncNuclearPwrFcltyProdCrGrpEligibleProjectPartnerInd</xsl:with-param>
								</xsl:call-template>
							</input>
							<label>
							  <xsl:call-template name="PopulateLabel">
								  <xsl:with-param name="TargetNode" select="$Form7213Data/AdvncNuclearPwrFcltyProdCrGrp/EligibleProjectPartnerInd"/>
								  <xsl:with-param name="BackupName">Form7213DataAdvncNuclearPwrFcltyProdCrGrpEligibleProjectPartnerInd</xsl:with-param>
							  </xsl:call-template>
							<span style="line-height:4mm;">Eligible project partner under section 45J(e)(2)(B) (eligible project partners attach</span>
							<div style="width:92mm;padding-left:48mm;">section 45J(e) Election Statement)</div>
							</label>
						    <span>
							<xsl:call-template name="SetFormLinkInline">
							     <xsl:with-param name="TargetNode" select="$Form7213Data/AdvncNuclearPwrFcltyProdCrGrp/EligibleProjectPartnerInd"/>
							</xsl:call-template> 
							</span>											
						</div>
						<!--</div>-->
						
						<!-- Line 9 -->
						<div class="styStdDiv">
							<div class="styLNLeftNumBoxSD" style="padding-top:1mm;padding-left:2mm;">9</div>
							<div class="styLNDesc" style="width:150mm;height:6mm;padding-top:0mm;">Is the facility owned through an organization that has made a valid section 761(a) election? 
								<span>
									<xsl:call-template name="PopulateSpan">
										<xsl:with-param name="TargetNode" select="$Form7213Data/FacilityOwnedSect761aElectInd"/>
									</xsl:call-template>
								<span>
									<input type="checkbox" alt="Facility Owned Section 761a Election Indicator Yes" class="styCkbox">
										<xsl:call-template name="PopulateYesCheckbox">
											<xsl:with-param name="TargetNode" select="$Form7213Data/FacilityOwnedSect761aElectInd"/>
											<xsl:with-param name="BackupName">Form7213DataFacilityOwnedSect761aElectInd</xsl:with-param>
										</xsl:call-template>
									</input>
								</span>
									<label>
										<xsl:call-template name="PopulateLabelYes">
											<xsl:with-param name="TargetNode" 
											 select="$Form7213Data/FacilityOwnedSect761aElectInd"/>
											<xsl:with-param name="BackupName">Form7213DataFacilityOwnedSect761aElectInd</xsl:with-param>
										</xsl:call-template>
										<span style="line-height:4mm;">Yes</span>
										<span style="width: 4mm"/>
									</label>
								</span>
								<span>
									<xsl:call-template name="PopulateSpan">
										<xsl:with-param name="TargetNode" select="$Form7213Data/FacilityOwnedSect761aElectInd"/>
									</xsl:call-template>
								<span>
									<input type="checkbox" alt="Facility Owned Section 761a Election Indicator No" class="styCkbox">
										<xsl:call-template name="PopulateNoCheckbox">
											<xsl:with-param name="TargetNode" select="$Form7213Data/FacilityOwnedSect761aElectInd"/>
											<xsl:with-param name="BackupName">Form7213DataFacilityOwnedSect761aElectInd</xsl:with-param>
										</xsl:call-template>
									</input>
								</span>
									<label>
										<xsl:call-template name="PopulateLabelNo">
											<xsl:with-param name="TargetNode" 
											 select="$Form7213Data/FacilityOwnedSect761aElectInd"/>
											<xsl:with-param name="BackupName">Form7213DataFacilityOwnedSect761aElectInd</xsl:with-param>
										</xsl:call-template>
										<span style="line-height:4mm;">No</span>
									</label>
								</span>
						    </div>
						</div>
						<div class="styStdDiv">
							<div class="styGenericDiv" style="width:187mm;height:3mm;border-bottom:1px solid black;"/>
						</div>
						<!--Section II-->
						<span style="width:150mm;padding-top:1mm;" class="styPartDesc">Section 2: Production From Advanced Nuclear Power Facilities Credit Calculation</span>
					</div>
					<!-- BEGIN Line Items -->
					<!-- Start line 1 -->
					<div style="width:187mm;">
						<div class="styLN" style="clear:none;padding-top:4px;">
							<div class="styLNLeftNumBoxSD">1</div>
							<div class="styLNDesc" style="width:93mm;">
								Portion of the National Megawatt Capacity Limitation (NMCL) allocated   <span>to you </span>
								<div class="styDotLn" style="float:right;padding-right:1mm;">.....................</div>
							</div>
						</div>
						<div style="float:right;clear:none">
							<div class="styLNRightNumBox" style="height:8mm;padding-top:4mm;">1</div>
							<div class="styLNAmountBox" style="width:38mm;height:8mm;padding-top:4mm;padding-right:0.5mm">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form7213Data/NMCLPortionAllocatedQty"/>
								</xsl:call-template> MW
							</div>
							<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;height:8mm;padding-top:4mm;"/>
							<div class="styLNAmountBoxNBB" style="height:8mm;padding-top:6mm;padding-right:0.5mm"/>
						</div>
					</div>
					<!--end line 1-->
					<!-- Start line 2 -->
					<div style="width:187mm;">
						<div class="styLN" style="clear:none;padding-top:4px;">
							<div class="styLNLeftNumBoxSD">2</div>
							<div class="styLNDesc" style="width:93mm;">
								Facility nameplate capacity						
							<div class="styDotLn" style="float:right;padding-top:0mm;">..............</div>
							</div>
						</div>
						<div style="float:right;clear:none">
							<div class="styLNRightNumBox" style="height:6mm;padding-top:2mm;">2</div>
							<div class="styLNAmountBox" style="width:38mm;height:6mm;padding-top:2mm;padding-right:0.5mm">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form7213Data/NameplateEnergyCapKWQty"/>
								</xsl:call-template> MW
							</div>
							<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;height:6mm;padding-top:2mm;"/>
							<div class="styLNAmountBoxNBB" style="height:6mm;padding-top:2mm;padding-right:0.5mm"/>
						</div>
					</div>
					<!--end line 2-->
					<!-- Start line 3 -->
					<div style="width:187mm;">
						<div class="styLN" style="clear:none;padding-top:4px;">
							<div class="styLNLeftNumBoxSD">3</div>
							<div class="styLNDesc" style="width:93mm;">
								Divide line 1 by line 2
								<div class="styDotLn" style="float:right;padding-top:0mm;">................</div>
							</div>
						</div>
						<div style="float:right;clear:none">
							<div class="styLNRightNumBox" style="height:6mm;padding-top:2mm;">3</div>
							<div class="styLNAmountBox" style="width:38mm;height:6mm;padding-top:2mm;padding-right:0.5mm">
								<xsl:if test="string-length($Form7213Data/CalcNMCLAllocAcptncPct) &gt; 17">
									<xsl:attribute name="style">width:38mm;height:6mm;padding-top:2mm;font-size:6pt;</xsl:attribute>
								</xsl:if>
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form7213Data/CalcNMCLAllocAcptncPct"/>
								</xsl:call-template> %							
							</div>
							<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;height:6mm;padding-top:2mm;"/>
							<div class="styLNAmountBoxNBB" style="height:6mm;padding-top:2mm;padding-right:0.5mm"/>
						</div>
					</div>
					<!--end line 3-->
					<!-- Start line 4 -->
					<div style="width:187mm;">
						<div class="styLN" style="clear:none;padding-top:4px;">
							<div class="styLNLeftNumBoxSD">4</div>
							<div class="styLNDesc" style="width:93mm;">
								Kilowatt hours of electricity produced and sold to unrelated persons
								<span class="styLN">during tax year</span>
								<div class="styDotLn" style="float:right;padding-right:1mm;">.................</div>
							</div>
						</div>
						<div style="float:right;clear:none">
							<div class="styLNRightNumBox" style="height:8mm;padding-top:4mm;">4</div>
							<div class="styLNAmountBox" style="width:38mm;height:8mm;padding-top:4mm;padding-right:0.5mm">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form7213Data/FcltyQlfyElecSoldKWHQty"/>
								</xsl:call-template> kWh
							</div>
							<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;height:8mm;padding-top:4mm;"/>
							<div class="styLNAmountBoxNBB" style="height:8mm;padding-top:6mm;padding-right:0.5mm"/>
						</div>
					</div>
					<!--end line 4-->
					<!-- Start line 5 -->
					<div style="width:187mm;">
						<div class="styLN" style="clear:none;">
							<div class="styLNLeftNumBoxSD">5</div>
							<div class="styLNDesc" style="width:93mm;height:5mm;">
								Tentative credit:	</div>
							<div style="float:right;clear:none">
								<div class="styLNRightNumBox" style="height:5mm;padding-top:4mm;background-color:lightgrey;border-bottom-width:0;"/>
								<div class="styLNAmountBox" style="width:38mm;height:5mm;padding-top:4mm;border-bottom-width:0;padding-right:0.5mm"/>
								<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;height:5mm;padding-top:4mm;"/>
								<div class="styLNAmountBoxNBB" style="height:5mm"/>
							</div>
							<!-- Line 5a -->
							<div class="styIRS5695LineItem" style="height:5mm;">
								<div class="styLNLeftNumBoxSD" style="padding-left:4.2mm;">a</div>
								<div class="styLNDesc" style="width:73mm;">
						Qualifying electricity production. Multiply line 3 by line 4
							
					</div>
								<div class="styDotLn" style="float:right;padding-right:1mm;">....</div>
							</div>
							<div style="float:right;clear:none;height:5mm;">
								<div class="styLNRightNumBox" style="height:5mm;">5a</div>
								<div class="styLNAmountBox" style="width:38mm;height:5mm;padding-right:0.5mm">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form7213Data/CalcFcltyQlfyElecSoldKWHQty"/>
									</xsl:call-template> kWh
								</div>
								<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;height:5mm;"/>
								<div class="styLNAmountBoxNBB" style="height:5mm;"/>
							</div>
						</div>
						<!-- Line 5b -->
						<div class="styIRS5695LineItem" style="height:5mm;">
							<div class="styLNLeftNumBoxSD" style="padding-left:4.2mm;">b</div>
							<div class="styLNDesc" style="width:87mm;">
						Multiply kWh on line 5a by $0.018
							<div class="styDotLn" style="float:right;">..........</div>
							</div>
						</div> 
						<div style="float:right;clear:none;height:5mm;">
							<div class="styLNRightNumBox" style="height:5mm;">5b</div>
							<div class="styLNAmountBox" style="width:38mm;height:5mm;padding-right:0.5mm">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form7213Data/CalcTentCrQlfyElecSoldAmt"/>
								</xsl:call-template>
							</div>
							<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;height:5mm;"/>
							<div class="styLNAmountBoxNBB" style="height:5mm;padding-right:0.5mm"/>
						</div>
					</div>
					<!--end line 5-->
					<!-- Start line 6 -->
					<div style="width:187mm;">
						<div class="styLN" style="clear:none;">
							<div class="styLNLeftNumBoxSD">6</div>
							<div class="styLNDesc" style="width:70mm;height:5mm;">
								Annual limitation for credit:
							</div>
							<div style="float:right;clear:none">
								<div class="styLNRightNumBox" style="height:5mm;padding-top:4mm;background-color:lightgrey;border-bottom-width:0;"/>
								<div class="styLNAmountBox" style="width:38mm;height:5mm;padding-top:4mm;border-bottom-width:0;padding-right:0.5mm"/>
								<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;height:5mm;"/>
								<div class="styLNAmountBoxNBB" style="height:5mm;"/>
							</div>
							<!-- Line 6a -->
							<div class="styIRS5695LineItem" style="height:5mm;">
								<div class="styLNLeftNumBoxSD" style="padding-left:4.2mm;">a</div>
								<div class="styLNDesc" style="width:87mm;">
						 Divide line 1 by 1,000 
					<div class="styDotLn" style="float:right;">..............</div>
								</div>
							</div>
							<div style="float:right;clear:none;height:5mm;">
								<div class="styLNRightNumBox" style="height:5mm;">6a</div>
								<div class="styLNAmountBox" style="width:38mm;height:5mm;padding-right:0.5mm">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form7213Data/CalcTentCrNMCLAllocAcptnc2Qty"/>
									</xsl:call-template> MW
								</div>
								<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;height:5mm;"/>
								<div class="styLNAmountBoxNBB" style="height:5mm;"/>
							</div>
						</div>
						<!-- Line 6b -->
						<div class="styIRS5695LineItem" style="height:5mm;">
							<div class="styLNLeftNumBoxSD" style="padding-left:4.2mm;">b</div>
							<div class="styLNDesc" style="width:87mm;">
						Multiply line 6a by $125,000,000 
							<div class="styDotLn" style="float:right;padding-right:1mm;">...........</div>
							</div>
						</div>
						<div style="float:right;clear:none;height:5mm;">
							<div class="styLNRightNumBox" style="height:5mm;">6b</div>
							<div class="styLNAmountBox" style="width:38mm;height:5mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form7213Data/CalcTentCrNMCLAllocAcptnc2Amt"/>
								</xsl:call-template>
							</div>
							<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;height:5mm;"/>
							<div class="styLNAmountBoxNBB" style="height:5mm;"/>
						</div>
					</div>
					<!--end line 6-->
					<!-- Start line 7 -->
					<div style="width:187mm">
						<div class="styLN" style="clear:none;">
							<div class="styLNLeftNumBoxSD" style="height:6mm;padding-top:2mm;">7</div>
							<div class="styLNDesc" style="width:139mm;height:6mm;padding-top:2mm;">
								<span style="float:left;">Smaller of 5b or 6b</span>
								<div class="styDotLn" style="float:right;padding-right:1mm;">............................</div>
							</div>
						</div>
						<div style="float:right;clear:none">
							<div class="styLNRightNumBox" style="height:6mm;padding-top:2mm;">7</div>
							<div class="styLNAmountBox" style="height:6mm;padding-top:2mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form7213Data/SmallerTentCrSoldOrAllocAmt"/>
								</xsl:call-template>
							</div>
						</div>
					</div>
					<!--Start line 8  -->
					<div style="width:187mm">
						<div class="styLN" style="clear:none;">
							<div class="styLNLeftNumBoxSD" style="height:6mm;padding-top:2mm;">8</div>
							<div class="styLNDesc" style="width:139mm;height:6mm;padding-top:2mm;">
								<span style="float:left;">Credit for production from advanced nuclear power facilities from partnerships, S corporations,</span>
								<span style="float:left;">estates, and trusts</span>
								<div class="styDotLn" style="float:right;padding-right:1mm;">............................</div>
							</div>
						</div>
						<div style="float:right;clear:none">
							<div class="styLNRightNumBox" style="height:8mm;padding-top:4mm;">8</div>
							<div class="styLNAmountBox" style="height:8mm;padding-top:4mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form7213Data/AdvncNuclearPwrFcltyProdCrAmt"/>
								</xsl:call-template>
							</div>
						</div>
					</div>
					<!--end line 8-->
					<!-- Start line 9 -->
					<div style="width:187mm">
						<div style="float:left;clear:none;">
							<div class="styLNLeftNumBoxSD" style="height:6mm;padding-top:2mm;">9</div>
							<div class="styLNDesc" style="width:139mm;height:6mm;padding-top:2mm;">
								<span class="styLN">Total of lines 7 and 8. Estates and trusts, go to line 10. Partnerships and S corporations, stop here</span>
								<span class="styLN">and report this amount on Schedule K. All others, stop here and enter this amount on Form 3800,</span>
								<span class="styLN">Part III, line 1cc</span>
								<div class="styDotLn" style="float:right;padding-right:1mm;">.............................</div>
							</div>
						</div>
						<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;height:7.5mm;"/>
						<div class="styLNAmountBoxNBB" style="height:7.5mm;"/>
						<div style="float:right;clear:none">
							<div class="styLNRightNumBox" style="height:6mm;padding-top:2.5mm;">9</div>
							<div class="styLNAmountBox" style="height:6mm;padding-top:2.5mm; ">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form7213Data/TotAdvncNclrPwrFcltyProdCrAmt"/>
								</xsl:call-template>
							</div>
						</div>
					</div>
					<!--end line 9-->
					<!-- Start line 10 -->
					<div style="width:187mm">
						<div style="float:left;clear:none;">
							<div class="styLNLeftNumBoxSD" style="height:6mm;padding-top:2mm;padding-left:1mm;">10</div>
							<div class="styLNDesc" style="width:139mm;height:6mm;padding-top:2mm;">
								<span class="styLN">Amount allocated to beneficiaries of the estate or trusts</span>
								<div class="styDotLn" style="float:right;padding-right:1mm;">................</div>
							</div>
						</div>
						<div style="float:right;clear:none">
							<div class="styLNRightNumBox" style="height:6mm;padding-top:2mm;">10</div>
							<div class="styLNAmountBox" style="height:6mm;padding-top:2mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form7213Data/AllocToBeneficiariesAmt"/>
								</xsl:call-template>
							</div>
						</div>
					</div>
					<!--end line 10-->
					<!-- Start line 11 -->
					<div style="width:187mm">
						<div style="float:left;clear:none;">
							<div class="styLNLeftNumBoxSD" style="height:6mm;padding-top:2mm;padding-left:1mm;">11</div>
							<div class="styLNDesc" style="width:139mm;height:6mm;padding-top:2mm;">
								<span class="styLN">Estates and trusts, subtract line 10 from line 9. Report this amount on Form 3800, Part III, line 1cc</span>
								<div class="styDotLn" style="float:right;padding-right:1mm;">..</div>
							</div>
						</div>
						<div style="float:right;clear:none">
							<div class="styLNRightNumBox" style="height:6mm;padding-top:2mm;border-bottom-width:0;">11</div>
							<div class="styLNAmountBox" style="height:6mm;padding-top:2mm;border-bottom-width:0;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form7213Data/TotLessAllocToBeneficiariesAmt"/>
								</xsl:call-template>
							</div>
						</div>
					</div>
				<!-- Form footer -->
						<div class="styStdDiv pageEnd" style="border-top:2px solid black;">
							<span style="font-weight:bold;font-family:Arial;">For Paperwork Reduction Act Notice, see separate instructions.</span>
							<span style="margin-left:20mm;">Cat. No. 56407R</span>
							<span style="float:right;">Form <span style="font-weight:bold;font-size:9pt;">7213</span> (Rev. 1-2025)</span>
						</div>
					<!--end line 11-->
					<!-- Part II  -->
					<div class="styStdDiv" style="border-bottom:1px solid black;">
				Form 7213 (Rev. 1-2025)
				<div style="float:right;">Page <strong>2</strong>
						</div>
					</div>
					<!-- Page 2 -->
					<div class="styBB" style="width:187mm;float:none;border-top-width:0px;padding-bottom:1.5mm;padding-top:0mm;">
						<span class="styPartName" style="width:16mm;">Part II</span>
						<!--Part II-->
						<span style="width:150mm;" class="styPartDesc">Zero-Emission Nuclear Power Production Credit, Section 45U</span>
						<span style="width:130mm;padding-left:19mm"><i>Complete Part II only if the facility was placed in service prior to August 16, 2022.</i></span>
					</div>
					<!-- Section  -->
					<div class="styBB" style="width:187mm;float:none;border-top-width:0px;padding-bottom:1.5mm;padding-top:1.5mm;">
						<!--Section I-->
						<span style="width:150mm;" class="styPartDesc">Section 1: Information on Qualified Nuclear Power Facility</span>
					</div>
					
					<div class="styBB" style="width:187mm;float:none;border-top-width:0px;padding-bottom:1.5mm;padding-top:1.5mm;">
						<!-- Line 1 -->
						<div class="styStdDiv">
							<div class="styLNLeftNumBoxSD">1</div>
							<div class="styLNDesc" style="width:150mm;">If making an elective payment election or transfer election, enter the IRS-issued registration number</div>
							</div>
							<div class="styStdDiv">
							<div class="styLNLeftNumBoxSD">&nbsp;</div>
							<div class="styLNDesc" style="width:20mm;">of the facility:</div> 
							<div style="width:97mm;border-bottom:1px solid black;margin-bottom:1px;text-align:left;">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$Form7213Data/ZeroEmissionNclrPowerProdCrGrp/FacilityIRSIssdRegistrationNum"/>
								</xsl:call-template>
							</div>
						</div>
						
						<!-- Line 2a -->
						<div class="styStdDiv">
							<div class="styLNLeftNumBoxSD">2a</div>
							<div class="styLNDesc" style="width:70mm;">Name or description of qualified nuclear power facility:</div>
							<div class="styLNDesc" style="width:108mm;min-height:2.5mm;height:auto;border-bottom:1px dashed black;margin-bottom:1px;">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$Form7213Data/ZeroEmissionNclrPowerProdCrGrp/FacilityDesc"/>
								</xsl:call-template>								
							</div>
						<div class="styStdDiv">
							<div class="styLNLeftNumBox">&nbsp;</div>
							<div class="styGenericDiv" style="width:178.9mm;height:3mm;border-bottom:1px solid black;"/>
						</div>
						</div>
						
						
						
						
						<!-- Line 2b -->
						<div class="styStdDiv">
							<div class="styStdDiv" style="height:8.25mm;">
							<div class="styLNLeftNumBoxSD" style="padding-left:3.6mm;">b</div>
							<div class="styLNDesc" style="width:58mm;">If different than filer, enter (i) owner’s name: </div>
							<div class="styLNDesc" style="width:105mm;margin-bottom:1px;text-align:left;">
							<xsl:choose>
										<xsl:when test="(($Form7213Data/ZeroEmissionNclrPowerProdCrGrp/FacilityOwnerPersonNm !='') and
										 ($RtnHdrData/Filer/NameLine1Txt != $Form7213Data/ZeroEmissionNclrPowerProdCrGrp/FacilityOwnerPersonNm)) ">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" 
												 select="$Form7213Data/ZeroEmissionNclrPowerProdCrGrp/FacilityOwnerPersonNm"/>
											</xsl:call-template>
											<div class="styStdDiv" style="width:105mm;height:1mm;">
												<div class="styGenericDiv" style="width:105mm;height:1mm;border-bottom:1px solid black;"></div>
											</div>
										</xsl:when>
											<xsl:otherwise>
												<xsl:if test="(($Form7213Data/ZeroEmissionNclrPowerProdCrGrp/FacilityOwnerBusinessName/BusinessNameLine1Txt 
												 !='') and ($Form7213Data/ZeroEmissionNclrPowerProdCrGrp/FacilityOwnerBusinessName/BusinessNameLine2Txt 
												 !='') and
												 ($RtnHdrData/Filer/NameLine1Txt != 
												  $Form7213Data/ZeroEmissionNclrPowerProdCrGrp/FacilityOwnerBusinessName/BusinessNameLine1Txt ) and ($RtnHdrData/Filer/NameLine1Txt != 
												  $Form7213Data/ZeroEmissionNclrPowerProdCrGrp/FacilityOwnerBusinessName/BusinessNameLine2Txt )) ">									
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" 
														select="$Form7213Data/ZeroEmissionNclrPowerProdCrGrp/FacilityOwnerBusinessName/BusinessNameLine1Txt "/>
													</xsl:call-template><br/>
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" 
														select="$Form7213Data/ZeroEmissionNclrPowerProdCrGrp/FacilityOwnerBusinessName/BusinessNameLine2Txt "/>
													</xsl:call-template>
													<div class="styStdDiv" style="width:105mm;height:1mm;">
														<div class="styGenericDiv" style="width:105mm;height:1mm;border-bottom:1px solid black;"></div>
													</div>
												</xsl:if>												
											</xsl:otherwise>
									</xsl:choose>
							        </div>
							
						       <!-- Line b (2nd line) -->
							        </div>
							
							
							
							<div class="styStdDiv" style="height:6mm;">
							<div class="styLNLeftNumBoxSD" style="padding-left:4mm;">&nbsp;</div>
							<div class="styLNDesc" style="width:27mm;">and (ii) owner’s TIN: </div>
							<div class="styLNDesc" style="width:30mm;border-bottom:1px solid black;margin-bottom:1px;text-align:left;">
							<xsl:choose>
											<xsl:when test="(($Form7213Data/ZeroEmissionNclrPowerProdCrGrp/FacilityOwnerSSN !='') and
											 ($RtnHdrData/Filer/PrimarySSN != $Form7213Data/ZeroEmissionNclrPowerProdCrGrp/FacilityOwnerSSN)) ">											
												<xsl:call-template name="PopulateSSN">
													<xsl:with-param name="TargetNode" select="$Form7213Data/ZeroEmissionNclrPowerProdCrGrp/FacilityOwnerSSN"/>
												</xsl:call-template>
											</xsl:when>
												<xsl:otherwise>
													<xsl:if test="(($Form7213Data/ZeroEmissionNclrPowerProdCrGrp/FacilityOwnerEIN !='') and
													 ($RtnHdrData/Filer/PrimarySSN != $Form7213Data/ZeroEmissionNclrPowerProdCrGrp/FacilityOwnerEIN)) ">											
														<xsl:call-template name="PopulateEIN">
															<xsl:with-param name="TargetNode" 
															select="$Form7213Data/ZeroEmissionNclrPowerProdCrGrp/FacilityOwnerEIN"/>
														</xsl:call-template>
													</xsl:if>	
												</xsl:otherwise>
										</xsl:choose>
							</div>
							</div>
						
						
						
						
						
						
						<!-- Line 3a -->
							<div class="styStdDiv">
								<div class="styLNLeftNumBoxSD">3a</div>
								<div class="styLNDesc" style="width:43mm;">Address of facility (if applicable):</div>
								<div class="styLNDesc" style="width:135mm;min-height:3.5mm;height:auto;border-bottom:1px dashed black;margin-bottom:1px;">
									<xsl:call-template name="PopulateUSAddressTemplate">
										<xsl:with-param name="TargetNode" select="$Form7213Data/ZeroEmissionNclrPowerProdCrGrp/FacilityUSAddress"/>
									</xsl:call-template>
								</div>
							</div>
							
						<!-- Line 3a Line Only -->
							<div class="styStdDiv">
								<div class="styLNLeftNumBox">&nbsp;</div>
								<div class="styLNDesc" style="width:178.9mm;min-height:3mm;height:auto;border-bottom:1px solid black;">
								</div>
								</div>
							
						<!-- Line 3b -->	
						<div class="styStdDiv" style="width:187mm;height:10mm;padding-top:1mm;">
							<div class="styLNLeftLtrBox" style="padding-top:2mm;padding-left:3.85mm;">b</div>
							<div style="">
								Coordinates.
								<span style="width:2mm">&nbsp;</span>
								<b>(i)</b> Latitude:
								<!-- Latitude/Longitutude may begin with a '+' or '-' -->
								<xsl:choose>
									<xsl:when test="substring($Form7213Data/ZeroEmissionNclrPowerProdCrGrp/FacilityLatitudeNum/text(),1,1) = '+' or 
									 substring($Form7213Data/ZeroEmissionNclrPowerProdCrGrp/FacilityLatitudeNum/text(),1,1) = '-'">
										<div>
											<xsl:call-template name="PopulateIndividualSizableLetterBox">
												<xsl:with-param name="TargetNode" select="$Form7213Data/ZeroEmissionNclrPowerProdCrGrp/FacilityLatitudeNum"/>
												<xsl:with-param name="BoxNum" select="1"/>
												<xsl:with-param name="BoxWidth" select="'4.5mm'"/>
												<xsl:with-param name="BoxHeight" select="'4.5mm'"/>
												<xsl:with-param name="BoxTopPadding" select="'.5mm'"/>
											</xsl:call-template>
										</div>
										<span style="width:3mm">&nbsp;</span>
										<div>
											<xsl:call-template name="PopulateIndividualSizableLetterBox">
												<xsl:with-param name="TargetNode" select="$Form7213Data/ZeroEmissionNclrPowerProdCrGrp/FacilityLatitudeNum"/>
												<xsl:with-param name="BoxNum" select="2"/>
												<xsl:with-param name="BoxWidth" select="'4.5mm'"/>
												<xsl:with-param name="BoxHeight" select="'4.5mm'"/>
												<xsl:with-param name="BoxTopPadding" select="'.5mm'"/>
											</xsl:call-template>
										</div>
										<div>
											<xsl:call-template name="PopulateIndividualSizableLetterBox">
												<xsl:with-param name="TargetNode" select="$Form7213Data/ZeroEmissionNclrPowerProdCrGrp/FacilityLatitudeNum"/>
												<xsl:with-param name="BoxNum" select="3"/>
												<xsl:with-param name="BoxWidth" select="'4.5mm'"/>
												<xsl:with-param name="BoxHeight" select="'4.5mm'"/>
												<xsl:with-param name="BoxTopPadding" select="'.5mm'"/>
											</xsl:call-template>
										</div>
										.
										<div>
											<xsl:call-template name="PopulateIndividualSizableLetterBox">
												<xsl:with-param name="TargetNode" select="$Form7213Data/ZeroEmissionNclrPowerProdCrGrp/FacilityLatitudeNum"/>
												<xsl:with-param name="BoxNum" select="5"/>
												<xsl:with-param name="BoxWidth" select="'4.5mm'"/>
												<xsl:with-param name="BoxHeight" select="'4.5mm'"/>
												<xsl:with-param name="BoxTopPadding" select="'.5mm'"/>
											</xsl:call-template>
										</div>
										<div>
											<xsl:call-template name="PopulateIndividualSizableLetterBox">
												<xsl:with-param name="TargetNode" select="$Form7213Data/ZeroEmissionNclrPowerProdCrGrp/FacilityLatitudeNum"/>
												<xsl:with-param name="BoxNum" select="6"/>
												<xsl:with-param name="BoxWidth" select="'4.5mm'"/>
												<xsl:with-param name="BoxHeight" select="'4.5mm'"/>
												<xsl:with-param name="BoxTopPadding" select="'.5mm'"/>
											</xsl:call-template>
										</div>
										<div>
											<xsl:call-template name="PopulateIndividualSizableLetterBox">
												<xsl:with-param name="TargetNode" select="$Form7213Data/ZeroEmissionNclrPowerProdCrGrp/FacilityLatitudeNum"/>
												<xsl:with-param name="BoxNum" select="7"/>
												<xsl:with-param name="BoxWidth" select="'4.5mm'"/>
												<xsl:with-param name="BoxHeight" select="'4.5mm'"/>
												<xsl:with-param name="BoxTopPadding" select="'.5mm'"/>
											</xsl:call-template>
										</div>
										<div>
											<xsl:call-template name="PopulateIndividualSizableLetterBox">
												<xsl:with-param name="TargetNode" select="$Form7213Data/ZeroEmissionNclrPowerProdCrGrp/FacilityLatitudeNum"/>
												<xsl:with-param name="BoxNum" select="8"/>
												<xsl:with-param name="BoxWidth" select="'4.5mm'"/>
												<xsl:with-param name="BoxHeight" select="'4.5mm'"/>
												<xsl:with-param name="BoxTopPadding" select="'.5mm'"/>
											</xsl:call-template>
										</div>
										<div>
											<xsl:call-template name="PopulateIndividualSizableLetterBox">
												<xsl:with-param name="TargetNode" select="$Form7213Data/ZeroEmissionNclrPowerProdCrGrp/FacilityLatitudeNum"/>
												<xsl:with-param name="BoxNum" select="9"/>
												<xsl:with-param name="BoxWidth" select="'4.5mm'"/>
												<xsl:with-param name="BoxHeight" select="'4.5mm'"/>
												<xsl:with-param name="BoxTopPadding" select="'.5mm'"/>
											</xsl:call-template>
										</div>
										<div>
											<xsl:call-template name="PopulateIndividualSizableLetterBox">
												<xsl:with-param name="TargetNode" select="$Form7213Data/ZeroEmissionNclrPowerProdCrGrp/FacilityLatitudeNum"/>
												<xsl:with-param name="BoxNum" select="10"/>
												<xsl:with-param name="BoxWidth" select="'4.5mm'"/>
												<xsl:with-param name="BoxHeight" select="'4.5mm'"/>
												<xsl:with-param name="BoxTopPadding" select="'.5mm'"/>
											</xsl:call-template>
										</div>
									</xsl:when>
									<xsl:otherwise>
										<div class="sty7207EmptyLonLatBox"/>
										<span style="width:3mm">&nbsp;</span>
										<div>
											<xsl:call-template name="PopulateIndividualSizableLetterBox">
												<xsl:with-param name="TargetNode" select="$Form7213Data/ZeroEmissionNclrPowerProdCrGrp/FacilityLatitudeNum"/>
												<xsl:with-param name="BoxNum" select="1"/>
												<xsl:with-param name="BoxWidth" select="'4.5mm'"/>
												<xsl:with-param name="BoxHeight" select="'4.5mm'"/>
												<xsl:with-param name="BoxTopPadding" select="'.5mm'"/>
											</xsl:call-template>
										</div>
										<span style="width:3mm">&nbsp;</span>
										<div>
											<xsl:call-template name="PopulateIndividualSizableLetterBox">
												<xsl:with-param name="TargetNode" select="$Form7213Data/ZeroEmissionNclrPowerProdCrGrp/FacilityLatitudeNum"/>
												<xsl:with-param name="BoxNum" select="2"/>
												<xsl:with-param name="BoxWidth" select="'4.5mm'"/>
												<xsl:with-param name="BoxHeight" select="'4.5mm'"/>
												<xsl:with-param name="BoxTopPadding" select="'.5mm'"/>
											</xsl:call-template>
										</div>
										<div>
											<xsl:call-template name="PopulateIndividualSizableLetterBox">
												<xsl:with-param name="TargetNode" select="$Form7213Data/ZeroEmissionNclrPowerProdCrGrp/FacilityLatitudeNum"/>
												<xsl:with-param name="BoxNum" select="2"/>
												<xsl:with-param name="BoxWidth" select="'4.5mm'"/>
												<xsl:with-param name="BoxHeight" select="'4.5mm'"/>
												<xsl:with-param name="BoxTopPadding" select="'.5mm'"/>
											</xsl:call-template>
										</div>
										.
										<div>
											<xsl:call-template name="PopulateIndividualSizableLetterBox">
												<xsl:with-param name="TargetNode" select="$Form7213Data/ZeroEmissionNclrPowerProdCrGrp/FacilityLatitudeNum"/>
												<xsl:with-param name="BoxNum" select="4"/>
												<xsl:with-param name="BoxWidth" select="'4.5mm'"/>
												<xsl:with-param name="BoxHeight" select="'4.5mm'"/>
												<xsl:with-param name="BoxTopPadding" select="'.5mm'"/>
											</xsl:call-template>
										</div>
										<div>
											<xsl:call-template name="PopulateIndividualSizableLetterBox">
												<xsl:with-param name="TargetNode" select="$Form7213Data/ZeroEmissionNclrPowerProdCrGrp/FacilityLatitudeNum"/>
												<xsl:with-param name="BoxNum" select="5"/>
												<xsl:with-param name="BoxWidth" select="'4.5mm'"/>
												<xsl:with-param name="BoxHeight" select="'4.5mm'"/>
												<xsl:with-param name="BoxTopPadding" select="'.5mm'"/>
											</xsl:call-template>
										</div>
										<div>
											<xsl:call-template name="PopulateIndividualSizableLetterBox">
												<xsl:with-param name="TargetNode" select="$Form7213Data/ZeroEmissionNclrPowerProdCrGrp/FacilityLatitudeNum"/>
												<xsl:with-param name="BoxNum" select="6"/>
												<xsl:with-param name="BoxWidth" select="'4.5mm'"/>
												<xsl:with-param name="BoxHeight" select="'4.5mm'"/>
												<xsl:with-param name="BoxTopPadding" select="'.5mm'"/>
											</xsl:call-template>
										</div>
										<div>
											<xsl:call-template name="PopulateIndividualSizableLetterBox">
												<xsl:with-param name="TargetNode" select="$Form7213Data/ZeroEmissionNclrPowerProdCrGrp/FacilityLatitudeNum"/>
												<xsl:with-param name="BoxNum" select="7"/>
												<xsl:with-param name="BoxWidth" select="'4.5mm'"/>
												<xsl:with-param name="BoxHeight" select="'4.5mm'"/>
												<xsl:with-param name="BoxTopPadding" select="'.5mm'"/>
											</xsl:call-template>
										</div>
										<div>
											<xsl:call-template name="PopulateIndividualSizableLetterBox">
												<xsl:with-param name="TargetNode" select="$Form7213Data/ZeroEmissionNclrPowerProdCrGrp/FacilityLatitudeNum"/>
												<xsl:with-param name="BoxNum" select="8"/>
												<xsl:with-param name="BoxWidth" select="'4.5mm'"/>
												<xsl:with-param name="BoxHeight" select="'4.5mm'"/>
												<xsl:with-param name="BoxTopPadding" select="'.5mm'"/>
											</xsl:call-template>
										</div>
										<div>
											<xsl:call-template name="PopulateIndividualSizableLetterBox">
												<xsl:with-param name="TargetNode" select="$Form7213Data/ZeroEmissionNclrPowerProdCrGrp/FacilityLatitudeNum"/>
												<xsl:with-param name="BoxNum" select="9"/>
												<xsl:with-param name="BoxWidth" select="'4.5mm'"/>
												<xsl:with-param name="BoxHeight" select="'4.5mm'"/>
												<xsl:with-param name="BoxTopPadding" select="'.5mm'"/>
											</xsl:call-template>
										</div>
									</xsl:otherwise>
								</xsl:choose>
								<span style="width:3mm;"/>
								
								<b>(ii)</b> Longitude:
								<xsl:choose>
									<xsl:when test="substring($Form7213Data/ZeroEmissionNclrPowerProdCrGrp/FacilityLongitudeNum/text(),1,1) = '+' or
									 substring($Form7213Data/ZeroEmissionNclrPowerProdCrGrp/FacilityLongitudeNum/text(),1,1) = '-'">
										<div>
											<xsl:call-template name="PopulateIndividualSizableLetterBox">
												<xsl:with-param name="TargetNode" select="$Form7213Data/ZeroEmissionNclrPowerProdCrGrp/FacilityLongitudeNum"/>
												<xsl:with-param name="BoxNum" select="1"/>
												<xsl:with-param name="BoxWidth" select="'4.5mm'"/>
												<xsl:with-param name="BoxHeight" select="'4.5mm'"/>
												<xsl:with-param name="BoxTopPadding" select="'.5mm'"/>
											</xsl:call-template>
										</div>
										<span style="width:3mm">&nbsp;</span>
										<div>
											<xsl:call-template name="PopulateIndividualSizableLetterBox">
												<xsl:with-param name="TargetNode" select="$Form7213Data/ZeroEmissionNclrPowerProdCrGrp/FacilityLongitudeNum"/>
												<xsl:with-param name="BoxNum" select="2"/>
												<xsl:with-param name="BoxWidth" select="'4.5mm'"/>
												<xsl:with-param name="BoxHeight" select="'4.5mm'"/>
												<xsl:with-param name="BoxTopPadding" select="'.5mm'"/>
											</xsl:call-template>
										</div>
										<div>
											<xsl:call-template name="PopulateIndividualSizableLetterBox">
												<xsl:with-param name="TargetNode" select="$Form7213Data/ZeroEmissionNclrPowerProdCrGrp/FacilityLongitudeNum"/>
												<xsl:with-param name="BoxNum" select="3"/>
												<xsl:with-param name="BoxWidth" select="'4.5mm'"/>
												<xsl:with-param name="BoxHeight" select="'4.5mm'"/>
												<xsl:with-param name="BoxTopPadding" select="'.5mm'"/>
											</xsl:call-template>
										</div>
										<div>
											<xsl:call-template name="PopulateIndividualSizableLetterBox">
												<xsl:with-param name="TargetNode" select="$Form7213Data/ZeroEmissionNclrPowerProdCrGrp/FacilityLongitudeNum"/>
												<xsl:with-param name="BoxNum" select="4"/>
												<xsl:with-param name="BoxWidth" select="'4.5mm'"/>
												<xsl:with-param name="BoxHeight" select="'4.5mm'"/>
												<xsl:with-param name="BoxTopPadding" select="'.5mm'"/>
											</xsl:call-template>
										</div>
										.
										<div>
											<xsl:call-template name="PopulateIndividualSizableLetterBox">
												<xsl:with-param name="TargetNode" select="$Form7213Data/ZeroEmissionNclrPowerProdCrGrp/FacilityLongitudeNum"/>
												<xsl:with-param name="BoxNum" select="6"/>
												<xsl:with-param name="BoxWidth" select="'4.5mm'"/>
												<xsl:with-param name="BoxHeight" select="'4.5mm'"/>
												<xsl:with-param name="BoxTopPadding" select="'.5mm'"/>
											</xsl:call-template>
										</div>
										<div>
											<xsl:call-template name="PopulateIndividualSizableLetterBox">
												<xsl:with-param name="TargetNode" select="$Form7213Data/ZeroEmissionNclrPowerProdCrGrp/FacilityLongitudeNum"/>
												<xsl:with-param name="BoxNum" select="7"/>
												<xsl:with-param name="BoxWidth" select="'4.5mm'"/>
												<xsl:with-param name="BoxHeight" select="'4.5mm'"/>
												<xsl:with-param name="BoxTopPadding" select="'.5mm'"/>
											</xsl:call-template>
										</div>
										<div>
											<xsl:call-template name="PopulateIndividualSizableLetterBox">
												<xsl:with-param name="TargetNode" select="$Form7213Data/ZeroEmissionNclrPowerProdCrGrp/FacilityLongitudeNum"/>
												<xsl:with-param name="BoxNum" select="8"/>
												<xsl:with-param name="BoxWidth" select="'4.5mm'"/>
												<xsl:with-param name="BoxHeight" select="'4.5mm'"/>
												<xsl:with-param name="BoxTopPadding" select="'.5mm'"/>
											</xsl:call-template>
										</div>
										<div>
											<xsl:call-template name="PopulateIndividualSizableLetterBox">
												<xsl:with-param name="TargetNode" select="$Form7213Data/ZeroEmissionNclrPowerProdCrGrp/FacilityLongitudeNum"/>
												<xsl:with-param name="BoxNum" select="9"/>
												<xsl:with-param name="BoxWidth" select="'4.5mm'"/>
												<xsl:with-param name="BoxHeight" select="'4.5mm'"/>
												<xsl:with-param name="BoxTopPadding" select="'.5mm'"/>
											</xsl:call-template>
										</div>
										<div>
											<xsl:call-template name="PopulateIndividualSizableLetterBox">
												<xsl:with-param name="TargetNode" select="$Form7213Data/ZeroEmissionNclrPowerProdCrGrp/FacilityLongitudeNum"/>
												<xsl:with-param name="BoxNum" select="10"/>
												<xsl:with-param name="BoxWidth" select="'4.5mm'"/>
												<xsl:with-param name="BoxHeight" select="'4.5mm'"/>
												<xsl:with-param name="BoxTopPadding" select="'.5mm'"/>
											</xsl:call-template>
										</div>
										<div>
											<xsl:call-template name="PopulateIndividualSizableLetterBox">
												<xsl:with-param name="TargetNode" select="$Form7213Data/ZeroEmissionNclrPowerProdCrGrp/FacilityLongitudeNum"/>
												<xsl:with-param name="BoxNum" select="11"/>
												<xsl:with-param name="BoxWidth" select="'4.5mm'"/>
												<xsl:with-param name="BoxHeight" select="'4.5mm'"/>
												<xsl:with-param name="BoxTopPadding" select="'.5mm'"/>
											</xsl:call-template>
										</div>
									</xsl:when>
									<xsl:otherwise>
										<div class="sty7207EmptyLonLatBox"/>
										<span style="width:3mm">&nbsp;</span>
										<div>
											<xsl:call-template name="PopulateIndividualSizableLetterBox">
												<xsl:with-param name="TargetNode" select="$Form7213Data/ZeroEmissionNclrPowerProdCrGrp/FacilityLongitudeNum"/>
												<xsl:with-param name="BoxNum" select="1"/>
												<xsl:with-param name="BoxWidth" select="'4.5mm'"/>
												<xsl:with-param name="BoxHeight" select="'4.5mm'"/>
												<xsl:with-param name="BoxTopPadding" select="'.5mm'"/>
											</xsl:call-template>
										</div>
										<span style="width:3mm">&nbsp;</span>
										<div>
											<xsl:call-template name="PopulateIndividualSizableLetterBox">
												<xsl:with-param name="TargetNode" select="$Form7213Data/ZeroEmissionNclrPowerProdCrGrp/FacilityLongitudeNum"/>
												<xsl:with-param name="BoxNum" select="2"/>
												<xsl:with-param name="BoxWidth" select="'4.5mm'"/>
												<xsl:with-param name="BoxHeight" select="'4.5mm'"/>
												<xsl:with-param name="BoxTopPadding" select="'.5mm'"/>
											</xsl:call-template>
										</div>
										<div>
											<xsl:call-template name="PopulateIndividualSizableLetterBox">
												<xsl:with-param name="TargetNode" select="$Form7213Data/ZeroEmissionNclrPowerProdCrGrp/FacilityLongitudeNum"/>
												<xsl:with-param name="BoxNum" select="3"/>
												<xsl:with-param name="BoxWidth" select="'4.5mm'"/>
												<xsl:with-param name="BoxHeight" select="'4.5mm'"/>
												<xsl:with-param name="BoxTopPadding" select="'.5mm'"/>
											</xsl:call-template>
										</div>
										<div>
											<xsl:call-template name="PopulateIndividualSizableLetterBox">
												<xsl:with-param name="TargetNode" select="$Form7213Data/ZeroEmissionNclrPowerProdCrGrp/FacilityLongitudeNum"/>
												<xsl:with-param name="BoxNum" select="5"/>
												<xsl:with-param name="BoxWidth" select="'4.5mm'"/>
												<xsl:with-param name="BoxHeight" select="'4.5mm'"/>
												<xsl:with-param name="BoxTopPadding" select="'.5mm'"/>
											</xsl:call-template>
										</div>
										.
										<div>
											<xsl:call-template name="PopulateIndividualSizableLetterBox">
												<xsl:with-param name="TargetNode" select="$Form7213Data/ZeroEmissionNclrPowerProdCrGrp/FacilityLongitudeNum"/>
												<xsl:with-param name="BoxNum" select="6"/>
												<xsl:with-param name="BoxWidth" select="'4.5mm'"/>
												<xsl:with-param name="BoxHeight" select="'4.5mm'"/>
												<xsl:with-param name="BoxTopPadding" select="'.5mm'"/>
											</xsl:call-template>
										</div>
										<div>
											<xsl:call-template name="PopulateIndividualSizableLetterBox">
												<xsl:with-param name="TargetNode" select="$Form7213Data/ZeroEmissionNclrPowerProdCrGrp/FacilityLongitudeNum"/>
												<xsl:with-param name="BoxNum" select="7"/>
												<xsl:with-param name="BoxWidth" select="'4.5mm'"/>
												<xsl:with-param name="BoxHeight" select="'4.5mm'"/>
												<xsl:with-param name="BoxTopPadding" select="'.5mm'"/>
											</xsl:call-template>
										</div>
										<div>
											<xsl:call-template name="PopulateIndividualSizableLetterBox">
												<xsl:with-param name="TargetNode" select="$Form7213Data/ZeroEmissionNclrPowerProdCrGrp/FacilityLongitudeNum"/>
												<xsl:with-param name="BoxNum" select="8"/>
												<xsl:with-param name="BoxWidth" select="'4.5mm'"/>
												<xsl:with-param name="BoxHeight" select="'4.5mm'"/>
												<xsl:with-param name="BoxTopPadding" select="'.5mm'"/>
											</xsl:call-template>
										</div>
										<div>
											<xsl:call-template name="PopulateIndividualSizableLetterBox">
												<xsl:with-param name="TargetNode" select="$Form7213Data/ZeroEmissionNclrPowerProdCrGrp/FacilityLongitudeNum"/>
												<xsl:with-param name="BoxNum" select="9"/>
												<xsl:with-param name="BoxWidth" select="'4.5mm'"/>
												<xsl:with-param name="BoxHeight" select="'4.5mm'"/>
												<xsl:with-param name="BoxTopPadding" select="'.5mm'"/>
											</xsl:call-template>
										</div>
										<div>
											<xsl:call-template name="PopulateIndividualSizableLetterBox">
												<xsl:with-param name="TargetNode" select="$Form7213Data/ZeroEmissionNclrPowerProdCrGrp/FacilityLongitudeNum"/>
												<xsl:with-param name="BoxNum" select="10"/>
												<xsl:with-param name="BoxWidth" select="'4.5mm'"/>
												<xsl:with-param name="BoxHeight" select="'4.5mm'"/>
												<xsl:with-param name="BoxTopPadding" select="'.5mm'"/>
											</xsl:call-template>
										</div>
										<div>
											<xsl:call-template name="PopulateIndividualSizableLetterBox">
												<xsl:with-param name="TargetNode" select="$Form7213Data/ZeroEmissionNclrPowerProdCrGrp/FacilityLongitudeNum"/>
												<xsl:with-param name="BoxNum" select="10"/>
												<xsl:with-param name="BoxWidth" select="'4.5mm'"/>
												<xsl:with-param name="BoxHeight" select="'4.5mm'"/>
												<xsl:with-param name="BoxTopPadding" select="'.5mm'"/>
											</xsl:call-template>
										</div>
									</xsl:otherwise>
								</xsl:choose>
							</div>
							<div style="margin-left:45.75mm;font-size:6pt;">
								<span>Enter a "+" (plus) or "-" (minus) sign in the first box.</span>
								<span style="width:19.35mm;">&nbsp;</span>
								<span>Enter a "+" (plus) or "-" (minus) sign in the first box.</span>
							</div>
						</div>
							
							
							<!-- %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% -->	
						
							
						</div>
						
						<!--####### Line 4 ########
						<div class="styStdDiv" style="height:6mm;">
							<div class="styLNLeftNumBoxSD">4</div>
							<div class="styLNDesc" style="width:45mm;">
								<b>(i)</b><span style="width:3mm;"></span> Facility nameplate capacity: </div>
							<div class="styLNCtrNumBox" style="border-bottom-width:1px; border-left-width:0;border-right-width:0;width:20mm;text-align:left">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$Form7213Data/ZeroEmissionNclrPowerProdCrGrp/NameplateEnergyCapKWQty"/>
								</xsl:call-template>
							</div>
							
							<div class="styLNDesc" style="width:70mm;">
								<span style="width:5mm;"></span><b>(ii)</b><span style="width:3mm;"></span> Facility nameplate capacity allocated to you:</div>
							<div class="styLNCtrNumBox" style="border-bottom-width:1px; border-left-width:0;border-right-width:0;width:20mm;text-align:left;padding-left:1mm;">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$Form7213Data/ZeroEmissionNclrPowerProdCrGrp/AllocNameplateEnergyCapKWQty"/>
								</xsl:call-template>
							</div>
						</div>
						#######################-->
						
						<!-- Line 4 -->
						<div class="styStdDiv" style="height:7mm;padding-top:2mm;padding-left:.25mm;">
							<div class="styLNLeftNumBoxSD">4</div>
							
						Active construction permit or license number from the Nuclear Regulatory Commission
						<span style="border-bottom:1px solid; border-left-width:0;border-right-width:0;width:40mm;text-align:left;padding-left:1mm;">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$Form7213Data/ZeroEmissionNclrPowerProdCrGrp/NRCPermitOrLicenseNum"/>
								</xsl:call-template>
							</span>
						<!--#########(attach copy of permit or license)#############	
						<xsl:call-template name="SetFormLinkInline">
							<xsl:with-param name="TargetNode" select="$Form7213Data/ZeroEmissionNclrPowerProdCrGrp/NRCPermitOrLicenseNum"/>
								</xsl:call-template>
						############################################################--> 							
						</div>
						
						
						<!-- Line 6 -->
					<!--############################################################
					<div class="styStdDiv">
							<div class="styLNLeftNumBoxSD" style="padding-top:1mm;">6</div>
							<div class="styLNDesc" style="width:150mm;height:6mm;padding-top:0mm;">Was a section 761(a) election made? 	
							<input type="checkbox" alt="IRS7213InitialReturn" class="styCkbox" name="InitialReturnInd">
									<xsl:call-template name="PopulateYesCheckbox">
										<xsl:with-param name="TargetNode" select="$Form7213Data/FacilityOwnedSect761aElectInd"/>
										<xsl:with-param name="BackupName">Yes</xsl:with-param>
									</xsl:call-template>
								</input>Yes
			<input type="checkbox" alt="IRS7213InitialReturn" class="styCkbox" name="InitialReturnInd">
									<xsl:call-template name="PopulateNoCheckbox">
										<xsl:with-param name="TargetNode" select="$Form7213Data/FacilityOwnedSect761aElectInd"/>
										<xsl:with-param name="BackupName">No</xsl:with-param>
									</xsl:call-template>
								</input>
						 No</div>
						</div>
					
					< Line "If Yes">
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD" style="padding-top:1mm;">&nbsp;</div>
						<div class="styLNDesc" style="width:150mm;height:6mm;padding-top:0mm;">If Yes, complete (a) through (e).</div>
					</div>
					
					< Line (a) >
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD" style="padding-top:1mm;">&nbsp;</div>
						<div class="styLNDesc" style="width:90mm;height:6mm;padding-top:0mm;">(a) Enter the tax year for which the section 761(a) election was made:</div>
						<div class="styLNCtrNumBox" style="border-bottom-width:1px; border-left-width:0;border-right-width:0;width:20mm;text-align:left">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$Form7213Data/ZeroEmissionNclrPowerProdCrGrp/NameplateEnergyCapKWQty"/>
								</xsl:call-template>
						</div>
						(YYYY)
						</div>
					
					
					< Line (b) >
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD" style="padding-top:1mm;">&nbsp;</div>
						<div class="styLNDesc" style="width:114mm;height:6mm;padding-top:0mm;">(b) Enter the EIN of the unincorporated organization making the section 761(a) election:</div>
 						<div class="styLNCtrNumBox" style="border-bottom-width:1px; border-left-width:0;border-right-width:0;width:20mm;text-align:left">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$Form7213Data/ZeroEmissionNclrPowerProdCrGrp/NameplateEnergyCapKWQty"/>
							</xsl:call-template>
						</div>
					</div>
					
					< Line (c) >
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD" style="padding-top:1mm;">&nbsp;</div>
						<div class="styLNDesc" style="width:78mm;height:6mm;padding-top:0mm;">(c) Enter the ownership percentage of the property or facility</div>
 						<div class="styLNCtrNumBox" style="border-bottom-width:1px; border-left-width:0;border-right-width:0;width:20mm;text-align:left">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$Form7213Data/ZeroEmissionNclrPowerProdCrGrp/NameplateEnergyCapKWQty"/>
							</xsl:call-template>
						</div><span>%</span>
					</div>
					
					< Line (d) >
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD" style="padding-top:1mm;">&nbsp;</div>
						<div class="styLNDesc" style="width:114mm;height:6mm;padding-top:0mm;">(d) Electricity produced and sold to an unrelated  person during the tax year by the facility</div>
						<div class="styLNCtrNumBox" style="border-bottom-width:1px; border-left-width:0;border-right-width:0;width:20mm;text-align:left">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$Form7213Data/ZeroEmissionNclrPowerProdCrGrp/NameplateEnergyCapKWQty"/>
							</xsl:call-template>
						</div><span>kWh</span>
					</div>
					
					< Line (e) >
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD" style="padding-top:1mm;">&nbsp;</div>
						<div class="styLNDesc" style="width:30mm;height:6mm;padding-top:0mm;">(e) Multiply (c) x (d) = </div>
						<div class="styLNCtrNumBox" style="border-bottom-width:1px; border-left-width:0;border-right-width:0;width:20mm;text-align:left">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$Form7213Data/ZeroEmissionNclrPowerProdCrGrp/NameplateEnergyCapKWQty"/>
							</xsl:call-template>
						</div><span>kWh. Enter this in line 1 of Section 2.</span>
					</div>
					#################################################################-->
					
			
					<div class="styGenericDiv" style="width:187mm;height:3mm;border-bottom:1px solid black;"/>
					
						<!--Section 2-->
						<span style="width:150mm;padding-top:1mm" class="styPartDesc">Section 2: Zero-Emission Nuclear Power Production Credit Calculation</span>
					</div>
					
					<!-- BEGIN Line Items -->
					<!-- Start line 1 -->
					<div style="width:187mm;">
						<div class="styLN" style="clear:none;">
							<div class="styLNLeftNumBoxSD" style="padding-top:5mm;">1</div>
							<div class="styLNDesc" style="width:90mm;padding-top:5mm;">
								Kilowatt hours of electricity produced and sold at facility during tax year							
							</div>
						</div>
						<div style="float:right;">
							<div class="styLNRightNumBox" style="height:9.5mm;padding-top:5mm;">1</div>
							<div class="styLNAmountBox" style="width:38mm;height:9.5mm;word-break:break-all;float:bottom;padding-bottom:2mm;font-size:7pt;">
							<span style="padding-bottom:2mm;width:28.5mm;">								
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form7213Data/ZeroEmissionNclrPowerProdCrGrp/FcltyQlfyElecSoldKWHQty"/>
								</xsl:call-template>
							</span>	
							<div style="width:6.5mm;height:9.5mm;word-break:break-all;padding-top:4.5mm;font-size:7pt;">kWh</div>
							</div>						
							<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;height:9.5mm;padding-top:0mm;"/>
							<div class="styLNAmountBoxNBB" style="height:9.5mm;padding-top:0mm;"/>
						</div>
					</div>
					<!--end line 1-->
					<!-- Start line 2 -->
					<div style="width:187mm;">
						<div class="styLN" style="clear:none;padding-top:3px;">
							<div class="styLNLeftNumBoxSD">2</div>
							<div class="styLNDesc" style="width:93mm;">
								Rate  
								<div class="styDotLn" style="float:right;padding-right:1mm;">....................</div>
							</div>
						</div>
						<div style="float:right;clear:none">
							<div class="styLNRightNumBox" style="height:6mm;padding-top:2mm;">2</div>
							<div class="styLNAmountBox" style="width:38mm;height:6mm;padding-top:2mm;">
								<span style="float:right;">$0.003</span>
							</div>
							<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;height:6mm;padding-top:4mm;"/>
							<div class="styLNAmountBoxNBB" style="height:6mm;padding-top:4mm;"/>
						</div>
					</div>
					<!--end line 2-->
					<!-- Start line 3 -->
					<div style="width:187mm">
						<div class="styLN" style="clear:none;">
							<div class="styLNLeftNumBoxSD" style="height:6mm;padding-top:2mm;">3</div>
							<div class="styLNDesc" style="width:139mm;height:6mm;padding-top:2mm;">
								<span style="float:left;">Multiply line 1 by line 2</span>
								<div class="styDotLn" style="float:right;padding-right:1mm;">..........................</div>
							</div>
						</div>
						<div style="float:right;clear:none">
							<div class="styLNRightNumBox" style="height:6mm;padding-top:2mm;">3</div>
							<div class="styLNAmountBox" style="height:6mm;padding-top:2mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form7213Data/ZeroEmissionNclrPowerProdCrGrp/CalcFcltyQlfyElecSoldKWHAmt"/>
								</xsl:call-template>
							</div>
						</div>
					</div>
					<!--end line 3-->
					<!-- Start line 4 -->
					<div style="width:187mm;">
						<div class="styLN" style="clear:none;padding-top:4px;">
							<div class="styLNLeftNumBoxSD">4</div>
							<div class="styLNDesc" style="width:93mm;">
								Gross receipts from electricity produced and sold by the facility to
								<span class="styLN">unrelated persons during the tax year, including amounts received with</span>
								<span class="styLN">respect to the facility from a zero-emission (ZEC) credit program  
								<div class="styDotLn" style="float:right;padding-right:1mm;">..</div>
								</span>
							</div>
						</div>
						<div style="float:right;clear:none">
							<div class="styLNRightNumBox" style="height:12mm;padding-top:8mm;">4</div>
							<div class="styLNAmountBox" style="width:38mm;height:12mm;padding-top:8mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form7213Data/ZeroEmissionNclrPowerProdCrGrp/GrossRcptsElecProdSoldAmt"/>
								</xsl:call-template>
							</div>
							<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;height:12mm;padding-top:4mm;"/>
							<div class="styLNAmountBoxNBB" style="height:12mm;padding-top:10mm;"/>
						</div>
					</div>
					<!--end line 4-->
					<!-- Start line 5 -->
					<div style="width:187mm;">
						<div class="styLN" style="clear:none;padding-top:4px;">
							<div class="styLNLeftNumBoxSD">5</div>
							<div class="styLNDesc" style="width:93mm;">
								<span style="float:left;"> Amount of payments from ZEC program (if any) included on line 4  
								<div class="styDotLn" style="float:right;padding-right:1mm;">..</div>
								</span>
							</div>
						</div>
						<div style="float:right;clear:none">
							<div class="styLNRightNumBox" style="height:6mm;padding-top:2mm;">5</div>
							<div class="styLNAmountBox" style="width:38mm;height:6mm;padding-top:2mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form7213Data/ZeroEmissionNclrPowerProdCrGrp/ZeroEmissionCrAmt"/>
								</xsl:call-template>
							</div>
							<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;height:6mm;padding-top:2mm;"/>
							<div class="styLNAmountBoxNBB" style="height:6mm;padding-top:2mm;"/>
						</div>
					</div>
					<!--end line 5-->
					<!-- Start line 6 -->
					<div style="width:187mm;">
						<div class="styLN" style="clear:none;padding-top:4px;">
							<div class="styLNLeftNumBoxSD">6</div>
							<div class="styLNDesc" style="width:93mm;">
								If the full amount of the zero-emission nuclear power production credit is used 
								<span class="styLN">to reduce the ZEC program payments reported on line 5, subtract</span>
								<span class="styLN">line 5 from line 4. Otherwise, enter the amount from line 4  
								<div class="styDotLn" style="float:right;padding-right:1mm;">....</div>
								</span>
							</div>
						</div>
						<div style="float:right;clear:none">
							<div class="styLNRightNumBox" style="height:10mm;padding-top:6mm;">6</div>
							<div class="styLNAmountBox" style="width:38mm;height:10mm;padding-top:6mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form7213Data/ZeroEmissionNclrPowerProdCrGrp/TotZeroEmissionCrCalcAmt"/>
								</xsl:call-template>
							</div>
							<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;height:10mm;padding-top:6mm;"/>
							<div class="styLNAmountBoxNBB" style="height:10mm;padding-top:6mm;"/>
						</div>
					</div>
					<!--end line 6-->
					<!-- Start line 7 -->
					<div style="width:187mm;">
						<div class="styLN" style="clear:none;padding-top:4px;">
							<div class="styLNLeftNumBoxSD">7</div>
							<div class="styLNDesc" style="width:93mm;">
								Multiply line 1 by $0.025	 
								<div class="styDotLn" style="float:right;padding-right:1mm;">..............</div>
							</div>
						</div>
						<div style="float:right;clear:none">
							<div class="styLNRightNumBox" style="height:6mm;padding-top:2mm;">7</div>
							<div class="styLNAmountBox" style="width:38mm;height:6mm;padding-top:2mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form7213Data/ZeroEmissionNclrPowerProdCrGrp/CalcGrossRcptsElecProdSoldAmt"/>
								</xsl:call-template>
							</div>
							<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;height:6mm;padding-top:2mm;"/>
							<div class="styLNAmountBoxNBB" style="height:6mm;padding-top:2mm;"/>
						</div>
					</div>
					<!--end line 7-->
					<!-- Start line 8 -->
					<div style="width:187mm;">
						<div class="styLN" style="clear:none;padding-top:4px;">
							<div class="styLNLeftNumBoxSD">8</div>
							<div class="styLNDesc" style="width:93mm;">
								Subtract line 7 from line 6. If zero or less, enter -0-  
								<div class="styDotLn" style="float:right;padding-right:1mm;">......</div>
							</div>
						</div>
						<div style="float:right;clear:none">
							<div class="styLNRightNumBox" style="height:6mm;padding-top:2mm;">8</div>
							<div class="styLNAmountBox" style="width:38mm;height:6mm;padding-top:2mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form7213Data/ZeroEmissionNclrPowerProdCrGrp/GroRcptsElecLessCalcElecAmt"/>
								</xsl:call-template>
							</div>
							<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;height:6mm;padding-top:2mm;"/>
							<div class="styLNAmountBoxNBB" style="height:6mm;padding-top:2mm;"/>
						</div>
					</div>
					<!--end line 8-->
					<!-- Start line 9 -->
					<div style="width:187mm">
						<div class="styLN" style="clear:none;">
							<div class="styLNLeftNumBoxSD" style="height:6mm;padding-top:2mm;">9</div>
							<div class="styLNDesc" style="width:139mm;height:6mm;padding-top:2mm;">
								<span style="float:left;">Enter the smaller of line 3 or 16% (0.16) of line 8</span>
								<div class="styDotLn" style="float:right;padding-right:1mm;">..................</div>
							</div>
						</div>
						<div style="float:right;clear:none">
							<div class="styLNRightNumBox" style="height:6mm;padding-top:2mm;">9</div>
							<div class="styLNAmountBox" style="height:6mm;padding-top:2mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form7213Data/ZeroEmissionNclrPowerProdCrGrp/GrossReceiptsElecReductionAmt"/>
								</xsl:call-template>
							</div>
						</div>
					</div>
					<!--end line 9-->
					<!-- Start line 10 -->
					<div style="width:187mm">
						<div class="styLN" style="clear:none;">
							<div class="styLNLeftNumBoxSD" style="height:6mm;padding-top:2mm;padding-left:0.7mm;">10</div>
							<div class="styLNDesc" style="width:139mm;height:6mm;padding-top:2mm;">
								<span style="float:left;">Subtract line 9 from line 3</span>
								<div class="styDotLn" style="float:right;padding-right:1mm;">..........................</div>
							</div>
						</div>
						<div style="float:right;clear:none">
							<div class="styLNRightNumBox" style="height:6mm;padding-top:2mm;">10</div>
							<div class="styLNAmountBox" style="height:6mm;padding-top:2mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form7213Data/ZeroEmissionNclrPowerProdCrGrp/CalcGrossRcptsElecReductionAmt"/>
								</xsl:call-template>
							</div>
						</div>
					</div>
					<!--end line 10-->
					<!-- Start line 11 -->
					<div style="width:187mm">
						<div class="styLN" style="clear:none;">
							<div class="styLNLeftNumBoxSD" style="height:6mm;padding-top:2mm;padding-left:0.7mm;">11</div>
							<div class="styLNDesc" style="width:139mm;height:6mm;padding-top:2mm;">
								<span class="styLN">Increased credit amount for qualified nuclear power production qualified facilities. If you meet the prevailing wage requirements, multiply the amount on line 10 by 5.0. Otherwise, enter the amount from line 10. See instructions <span class="styDotLn" style="float:right;padding-right:1mm;">..............................</span></span>
								<span class="styLN">  	
								</span>
							</div>
						</div>
						<div style="float:right;clear:none">
							<div class="styLNRightNumBox" style="height:12mm;padding-top:8mm;">11</div>
							<div class="styLNAmountBox" style="height:12mm;padding-top:8mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form7213Data/ZeroEmissionNclrPowerProdCrGrp/QualifiedFacilitiesIncrCrAmt"/>
								</xsl:call-template>
							</div>
						</div>
					</div>
					<!--end line 11-->
					<!-- Start line 12 -->
					<div style="width:187mm">
						<div style="float:left;clear:none;">
							<div class="styLNLeftNumBoxSD" style="height:8mm;padding-top:2mm;padding-left:0.7mm;">12</div>
							<div class="styLNDesc" style="width:139mm;height:8mm;padding-top:2mm;">
								<span class="styLN">Credit for production from zero-emission nuclear power facilities from partnerships, S corporations,</span>
								<span class="styLN">estates, and trusts  
								<div class="styDotLn" style="float:right;padding-right:1mm;">..........................</div>
								</span>
							</div>
						</div>
						<div style="float:right;clear:none">
							<div class="styLNRightNumBox" style="height:8mm;padding-top:4mm;">12</div>
							<div class="styLNAmountBox" style="height:8mm;padding-top:4mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form7213Data/ZeroEmissionNclrPowerProdCrGrp/ZeroEmissionNuclearPowerCrAmt"/>
								</xsl:call-template>
							</div>
						</div>
					</div>
					<!--end line 12-->
					<!-- Start line 13 -->
					<div style="width:187mm">
						<div style="float:left;clear:none;">
							<div class="styLNLeftNumBoxSD" style="height:12mm;padding-top:4mm;padding-left:0.7mm;">13</div>
							<div class="styLNDesc" style="width:139mm;height:12mm;padding-top:4mm;">
								<span class="styLN">Total of lines 11 and 12. Estates and trusts, go to line 14. Partnerships and S corporations, stop
</span>
								<span class="styLN">here and report this amount on Schedule K. All others, stop here and report this amount on Form
</span>
								<span class="styLN">3800, Part III, line 1u  
								<div class="styDotLn" style="float:right;padding-right:1mm;">...........................</div>
								</span>
							</div>
						</div>
						<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;height:8mm"/>
						<div class="styLNAmountBoxNBB" style="height:8mm;"/>
						<div style="float:right;clear:none">
							<div class="styLNRightNumBox" style="height:6mm;padding-top:2mm;">13</div>
							<div class="styLNAmountBox" style="height:6mm;padding-top:2mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form7213Data/ZeroEmissionNclrPowerProdCrGrp/TotZeroEmsnNuclearPowerCrAmt"/>
								</xsl:call-template>
							</div>
						</div>
					</div>
					<!--end line 13-->
					<!-- Start line 14 -->
					<div style="width:187mm">
						<div style="float:left;clear:none;">
							<div class="styLNLeftNumBoxSD" style="height:6mm;padding-top:2mm;padding-left:0.7mm;">14</div>
							<div class="styLNDesc" style="width:139mm;height:6mm;padding-top:2mm;">
								<span class="styLN">Amount allocated to beneficiaries of the estate or trusts
								<div class="styDotLn" style="float:right;padding-right:1mm;">.................</div>
								</span>
							</div>
						</div>
						<div class="styLN" style="clear:none">
							<div class="styLNRightNumBox" style="height:6mm;padding-top:2mm;">14</div>
							<div class="styLNAmountBox" style="height:6mm;padding-top:2mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form7213Data/ZeroEmissionNclrPowerProdCrGrp/AllocToBeneficiariesAmt"/>
								</xsl:call-template>
							</div>
						</div>
					</div>
					<!--end line 14-->
					<!-- Start line 15 -->
					<div style="width:187mm">
						<div class="styLN" style="clear:none;">
							<div class="styLNLeftNumBoxSD" style="height:6mm;padding-top:2mm;padding-left:0.7mm;">15</div>
							<div class="styLNDesc" style="width:139mm;height:6mm;padding-top:2mm;">
								<span class="styLN">Estates and trusts, subtract line 14 from line 13. Report this amount on Form 3800, Part III, line 1u
								<div class="styDotLn" style="float:right;padding-right:1mm;">...
								</div>
								</span>
							</div>
						</div>
						<div style="float:right;clear:none">
							<div class="styLNRightNumBox" style="height:6mm;padding-top:2mm;border-bottom-width:0;">15</div>
							<div class="styLNAmountBox" style="height:6mm;padding-top:2mm;border-bottom-width:0;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form7213Data/ZeroEmissionNclrPowerProdCrGrp/TotLessAllocToBeneficiariesAmt"/>
								</xsl:call-template>
							</div>
						</div>
					</div>
					<div class="styStdDiv pageEnd" style="border-top:2px solid black;">
						<span style="float:right;height:mm;">Form <strong>7213</strong> (Rev. 1-2025)<br/>
							<br/>
						</span>
					</div>
					<!--end line 15-->
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
							<xsl:with-param name="TargetNode" select="$Form7213Data"/>
							<xsl:with-param name="DescWidth" select="100"/>
						</xsl:call-template>
					</table>
					<br/>
					<!-- end Additional Data Page -->
				</form>
			</body>
		</html>
	</xsl:template>
</xsl:stylesheet>