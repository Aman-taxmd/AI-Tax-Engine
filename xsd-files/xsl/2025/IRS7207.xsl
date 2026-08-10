<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE xsl:stylesheet [
	<!ENTITY nbsp "&#160;"> 
]>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:include href="PopulateTemplate.xsl"/>
	<xsl:include href="AddHeader.xsl"/>
	<xsl:include href="CommonPathRef.xsl"/>
	<xsl:include href="AddOnTable.xsl"/>
	<xsl:include href="IRS7207Style.xsl"/>
	<xsl:output method="html" indent="yes"/>
	<xsl:strip-space elements="*"/>
	<xsl:param name="FormData" select="$RtnDoc/IRS7207"/>
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
				<meta name="Description" content="IRS Form 7207"/>
				<script language="JavaScript" src="{$ScriptPath}/FormDisplay.js" type="text/javascript"/>
				<xsl:call-template name="InitJS"/>
				<style type="text/css">
					<xsl:if test="not($Print) or $Print=''">
						<xsl:call-template name="AddOnStyle"/>
						<xsl:call-template name="IRS7207Style"/>
					</xsl:if>
				</style>
				<xsl:call-template name="GlobalStylesForm"/>
			</head>
			<body class="styBodyClass">
				<form id="Form7207">
					<xsl:call-template name="DocumentHeader"/>
					<!-- Page 1 -->
					<!-- Header -->
					<div class="styStdDiv">
						<div class="styFNBox" style="width:31mm;height:18mm;border-right-width:2px;">
							Form <span class="styFN" style="font-size:16pt;">7207</span>
							<div style="font-size:7pt;">(December 2025)</div>
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$FormData"/>
							</xsl:call-template>
							<br/>
							<div class="styAgency" style="padding-top:2mm;">Department of the Treasury
								<br/>Internal Revenue Service
							</div>
						</div>
						<div class="styFTBox" style="width:124mm;height:18mm;">
							<span class="styFMT" style="font-size:11pt;">Advanced Manufacturing Production Credit</span>
							<br/>
							<br/>
							<span class="styBoldText" style="padding-top:2mm;">
								Go to
								<a style="text-decoration:none;color:black;" href="http://www.irs.gov/Form7207" title="Link to IRS.gov"><i>www.IRS.gov/Form7207</i></a>
								for instructions and the latest information.
							</span>
						</div>
						<div style="width:32mm;height:18mm;text-align:center;border-left:2px solid black;">
							<div class="styOMB" style="padding-top:1mm;height:8mm;">  
								OMB No. 1545-2306
							</div>
							<div style="width:28mm;">
								<span style="text-align:left;padding-top:2mm;">Attachment<br/>Sequence No.</span>
								<span class="styBoldText" style="font-size:10pt">207</span>
							</div>
						</div>
					</div>
					<div class="styStdDiv" style="border-top:2px solid black;min-height:6mm;width:187mm;">
						<div style="float:left;width:130mm;border-right:.5px solid black;">
							Name (as shown on your income tax return)
							<br/>
							<span class="" style="">
								<xsl:call-template name="PopulateReturnHeaderFiler">
									<xsl:with-param name="TargetNode">BusinessNameLine1Txt</xsl:with-param>
								</xsl:call-template>
								<br/>
								<xsl:call-template name="PopulateReturnHeaderFiler">
									<xsl:with-param name="TargetNode">BusinessNameLine2Txt</xsl:with-param>
								</xsl:call-template>
							</span>
						</div>
						<div style="width:53mm;padding-left:1mm;">
							<span class="styBoldText">Identifying Number</span>
							<br/>
							<span class="sty7207AmountSpan" style="width:53mm;text-align:center;">
								<xsl:call-template name="PopulateReturnHeaderFilerTIN">
									<xsl:with-param name="TargetNode"/>
								</xsl:call-template>
							</span>
						</div>
					</div>
					<!-- ************************** PART I START ************************** -->
					<!-- Part I - Facility Information -->
					<div class="styStdDiv" style="border-top:1px solid black; border-bottom:.5px solid black;">
						<div class="styPartName" style="font-size:10pt;padding-bottom:4.5mm;font-family:arial;
						 text-align:center;padding-top:.5mm">Part I</div>
						<div class="styPartDesc" style="font-size:9pt;padding-bottom:4.5mm;padding-top:.3mm;
						 font-family:arial;">
							Facility Information
						</div>
					</div>
					<div class="styGenericDiv" style="width:187mm;">
						<!-- Part I - 1 -->
						<div class="styStdDiv" style="width:187mm;height:14mm;">
							<div class="styLNLeftLtrBox">1</div>
							<div class="styGenericDiv" style="height:14mm;width:179mm;border-bottom:.5px solid black;">
								<div class="styGenericDiv" style="height:14mm;width:110mm;border-right:.5px solid black;">
									<div style="height:10mm;border-bottom:1px dashed black;width:110mm;">If making an 
									 elective payment election or transfer election, enter the IRS-issued registration number
									 for the facility:<br/>
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" 
											 select="$FormData/FacilityIRSIssdRegistrationNum"/>
										</xsl:call-template>
									</div>
								</div>
								<!-- Part I - 2 -->
								<div class="styLNLeftLtrBox">2</div>
								<div style="height:10mm">Date the facility was placed<br/>in service (MM/DD/YYYY):<br/>
									<span style="text-align:center;width:100%;">
										<xsl:call-template name="PopulateMonthDayYear">
											<xsl:with-param name="TargetNode" select="$FormData/FacilityPlacedInServiceDt"/>
										</xsl:call-template>
									</span>
								</div>
							</div>
						</div>
						<!-- Part I - 3a -->
						<div class="styStdDiv" style="width:187mm;height:auto;max-height:81mm;">
							<div class="styLNLeftLtrBox" style="padding-top:.5mm;">3a</div>
							<div style="width:179mm;border-bottom:.5px solid black;height:auto;max-height:80mm;
							 padding-top:.5mm;">
								Address of the facility (if applicable):
								<br/>
								<div style="font-size:6pt;">
									<xsl:call-template name="PopulateUSAddressTemplate">
										<xsl:with-param name="TargetNode" select="$FormData/FacilityUSAddress"/>
									</xsl:call-template>
									<br/>
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$FormData/FacilityDesc"/>
									</xsl:call-template>
								</div>
							</div>
						</div>
						<!-- Part I - 3b(i) -->
						<div class="styStdDiv" style="width:187mm;height:10mm;">
							<div class="styLNLeftLtrBox" style="width:8mm">3b</div>
							<div class="styGenericDiv" style="height:10mm;width:175mm;border-bottom:.5px solid black;">
								<div class="styGenericDiv" style="height:10mm;width:112mm;border-right:.5px solid black;
								border-bottom:.5px solid black;">
									If different than filer, enter (i) owner's name:<br/>
									<xsl:choose>
										<!-- F990 Return Header -->
										<xsl:when test="(($FormData/FacilityOwnerPersonNm !='') and
										 ($RtnHdrData/Filer/BusinessName/BusinessNameLine1Txt != 
										 $FormData/FacilityOwnerPersonNm)) ">
										 <br/>
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode"
												 select="$FormData/FacilityOwnerPersonNm"/>
											</xsl:call-template>
										</xsl:when>
										<xsl:when test="(($FormData/FacilityOwnerBusinessName/BusinessNameLine1Txt!='') and
										 ($RtnHdrData/Filer/BusinessName/BusinessNameLine1Txt != 
										  $FormData/FacilityOwnerBusinessName/BusinessNameLine1Txt )) ">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" 
												select="$FormData/FacilityOwnerBusinessName/BusinessNameLine1Txt "/>
											</xsl:call-template>
											<br/>
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" 
												select="$FormData/FacilityOwnerBusinessName/BusinessNameLine2Txt "/>
											</xsl:call-template>
										</xsl:when>
										<!-- F1040/NR Return Header -->
										<xsl:when test="(($FormData/FacilityOwnerPersonNm !='') and
										 ($RtnHdrData/Filer/EstateOrTrustName/NameLine1Txt != 
										 $FormData/FacilityOwnerPersonNm)) ">
										 <br/>
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode"
												 select="$FormData/FacilityOwnerPersonNm"/>
											</xsl:call-template>
										</xsl:when>
										<xsl:when test="(($FormData/FacilityOwnerBusinessName/BusinessNameLine1Txt!='') and
										 ($RtnHdrData/Filer/NameLine1Txt != 
										  $FormData/FacilityOwnerBusinessName/BusinessNameLine1Txt )) ">						
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" 
												select="$FormData/FacilityOwnerBusinessName/BusinessNameLine1Txt "/>
											</xsl:call-template>
											<br/>
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" 
												select="$FormData/FacilityOwnerBusinessName/BusinessNameLine2Txt "/>
											</xsl:call-template>
										</xsl:when>
										<!-- F1041 Return Header -->
										<xsl:when test="(($FormData/FacilityOwnerPersonNm !='') and
										 ($RtnHdrData/Filer/InCareOfNm != $FormData/FacilityOwnerPersonNm)) ">
										 <br/>
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" 
												 select="$FormData/FacilityOwnerPersonNm"/>
											</xsl:call-template>
										</xsl:when>
										<xsl:when test="(($FormData/FacilityOwnerBusinessName/BusinessNameLine1Txt!='') and
										 ($RtnHdrData/Filer/EstateOrTrustName/BusinessNameLine1Txt != 
										  $FormData/FacilityOwnerBusinessName/BusinessNameLine1Txt )) ">									
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" 
												select="$FormData/FacilityOwnerBusinessName/BusinessNameLine1Txt "/>
											</xsl:call-template>
											<br/>
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" 
												select="$FormData/FacilityOwnerBusinessName/BusinessNameLine2Txt "/>
											</xsl:call-template>
										</xsl:when>
										<!-- F1065 Return Header -->
										<xsl:when test="(($FormData/FacilityOwnerPersonNm !='') and
										 ($RtnHdrData/Filer/BusinessName/BusinessNameLine1Txt and 
										 $RtnHdrData/Filer/BusinessName/BusinessNameLine2Txt != 
										 $FormData/FacilityOwnerPersonNm)) ">
										 <br/>
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" 
												 select="$FormData/FacilityOwnerPersonNm"/>
											</xsl:call-template>
										</xsl:when>
										<xsl:when test="(($FormData/FacilityOwnerBusinessName/BusinessNameLine1Txt!='') and
										 ($RtnHdrData/Filer/EstateOrTrustName/BusinessNameLine1Txt != 
										  $FormData/FacilityOwnerBusinessName/BusinessNameLine1Txt )) ">									
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" 
												select="$FormData/FacilityOwnerBusinessName/BusinessNameLine1Txt "/>
											</xsl:call-template>
											<br/>
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" 
												select="$FormData/FacilityOwnerBusinessName/BusinessNameLine2Txt "/>
											</xsl:call-template>
										</xsl:when>
										<!-- F1120/F/S/POL Return Header -->
										<xsl:when test="(($FormData/FacilityOwnerPersonNm !='') and
										 ($RtnHdrData/Filer/BusinessName/BusinessNameLine1Txt and 
										 $RtnHdrData/Filer/BusinessName/BusinessNameLine2Txt != 
										 $FormData/FacilityOwnerPersonNm)) ">
										 <br/>
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" 
												 select="$FormData/FacilityOwnerPersonNm"/>
											</xsl:call-template>
										</xsl:when>
										<xsl:when test="(($FormData/FacilityOwnerBusinessName/BusinessNameLine1Txt!='') and
										 ($RtnHdrData/Filer/BusinessName/BusinessNameLine1Txt and 
										 $RtnHdrData/Filer/BusinessName/BusinessNameLine2Txt != 
										  $FormData/FacilityOwnerBusinessName/BusinessNameLine1Txt )) ">									
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" 
												select="$FormData/FacilityOwnerBusinessName/BusinessNameLine1Txt "/>
											</xsl:call-template>
											<br/>
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" 
												select="$FormData/FacilityOwnerBusinessName/BusinessNameLine2Txt "/>
											</xsl:call-template>
										</xsl:when>
									</xsl:choose>
								</div>
								<!-- Part I - 3b(ii) -->
								<div style="height:10mm;padding-left:2mm">and (ii) owner's TIN:<br/><br/>
									<span style="text-align:center;width:100%;">
										<xsl:choose>
											<!-- F990 Return Header -->
											<xsl:when test="(($FormData/FacilityOwnerSSN !='') 
											 and ($RtnHdrData/Filer/EIN != 
											 $FormData/FacilityOwnerSSN)) ">
												<xsl:call-template name="PopulateSSN">
													<xsl:with-param name="TargetNode"
													 select="$FormData/FacilityOwnerSSN"/>
												</xsl:call-template>
											</xsl:when>
											<xsl:when test="(($FormData/FacilityOwnerEIN !='') 
											 and ($RtnHdrData/Filer/EIN != 
											  $FormData/FacilityOwnerEIN)) ">						
												<xsl:call-template name="PopulateEIN">
													<xsl:with-param name="TargetNode" 
													select="$FormData/FacilityOwnerEIN"/>
												</xsl:call-template>
											</xsl:when>
											<!-- F1040/NR Return Header -->
											<xsl:when test="(($FormData/FacilityOwnerSSN !='') and
											 ($RtnHdrData/Filer/PrimarySSN != 
											 $FormData/FacilityOwnerSSN)) ">
												<xsl:call-template name="PopulateSSN">
													<xsl:with-param name="TargetNode"
													 select="$FormData/FacilityOwnerSSN"/>
												</xsl:call-template>
											</xsl:when>
											<xsl:when test="(($FormData/FacilityOwnerEIN!='') and
											 ($RtnHdrData/Filer/PrimarySSN != 
											  $FormData/FacilityOwnerEIN)) ">						
												<xsl:call-template name="PopulateEIN">
													<xsl:with-param name="TargetNode" 
													select="$FormData/FacilityOwnerEIN"/>
												</xsl:call-template>
											</xsl:when>
											<!-- F1041 Return Header -->
											<xsl:when test="(($FormData/FacilityOwnerSSN !='') and
											 ($RtnHdrData/Filer/EIN != $FormData/FacilityOwnerSSN )) ">
												<xsl:call-template name="PopulateSSN">
													<xsl:with-param name="TargetNode" 
													 select="$FormData/FacilityOwnerSSN "/>
												</xsl:call-template>
											</xsl:when>
											<xsl:when test="(($FormData/FacilityOwnerEIN!='') and
											 ($RtnHdrData/Filer/EIN != 
											  $FormData/FacilityOwnerEIN)) ">									
												<xsl:call-template name="PopulateEIN">
													<xsl:with-param name="TargetNode" 
													select="$FormData/FacilityOwnerEIN"/>
												</xsl:call-template>
											</xsl:when>
											<!-- F1065 Return Header -->
											<xsl:when test="(($FormData/FacilityOwnerSSN !='') and
											 ($RtnHdrData/Filer/EIN and
											 $FormData/FacilityOwnerSSN)) ">
												<xsl:call-template name="PopulateSSN">
													<xsl:with-param name="TargetNode" 
													 select="$FormData/FacilityOwnerSSN"/>
												</xsl:call-template>
											</xsl:when>
											<xsl:when test="(($FormData/FacilityOwnerEIN !='') and
											 ($RtnHdrData/Filer/EIN != 
											  $FormData/FacilityOwnerEIN)) ">									
												<xsl:call-template name="PopulateEIN">
													<xsl:with-param name="TargetNode" 
													select="$FormData/FacilityOwnerEIN"/>
												</xsl:call-template>
											</xsl:when>
											<!-- F1120/F/S/POL Return Header -->
											<xsl:when test="(($FormData/FacilityOwnerSSN !='') and
											 ($RtnHdrData/Filer/EIN != 
											 $FormData/FacilityOwnerSSN)) ">
												<xsl:call-template name="PopulateSSN">
													<xsl:with-param name="TargetNode" 
													 select="$FormData/FacilityOwnerSSN"/>
												</xsl:call-template>
											</xsl:when>
											<xsl:when test="(($FormData/FacilityOwnerEIN !='') and
											 ($RtnHdrData/Filer/EIN != 
											  $FormData/FacilityOwnerEIN )) ">									
												<xsl:call-template name="PopulateEIN">
													<xsl:with-param name="TargetNode" 
													select="$FormData/FacilityOwnerEIN "/>
												</xsl:call-template>
											</xsl:when>
										</xsl:choose>
									</span>
								</div>
							</div>
						</div>
						<!-- Part I - 4 -->
						<div class="styStdDiv" style="width:187mm;height:10mm;padding-top:1mm;">
							<div class="styLNLeftLtrBox" style="padding-top:2mm;">4</div>
							<div style="">
								Coordinates.
								<span style="width:2mm">&nbsp;</span>
								(i) Latitude:
								<!-- Latitude/Longitutude may begin with a '+' or '-' -->
								<xsl:choose>
									<xsl:when test="substring($FormData/FacilityLatitudeNum/text(),1,1) = '+' or 
									 substring($FormData/FacilityLatitudeNum/text(),1,1) = '-'">
										<div>
											<xsl:call-template name="PopulateIndividualSizableLetterBox">
												<xsl:with-param name="TargetNode" select="$FormData/FacilityLatitudeNum"/>
												<xsl:with-param name="BoxNum" select="1"/>
												<xsl:with-param name="BoxWidth" select="'5mm'"/>
												<xsl:with-param name="BoxHeight" select="'5mm'"/>
												<xsl:with-param name="BoxTopPadding" select="'.5mm'"/>
											</xsl:call-template>
										</div>
										<span style="width:3mm">&nbsp;</span>
										<div>
											<xsl:call-template name="PopulateIndividualSizableLetterBox">
												<xsl:with-param name="TargetNode" select="$FormData/FacilityLatitudeNum"/>
												<xsl:with-param name="BoxNum" select="2"/>
												<xsl:with-param name="BoxWidth" select="'5mm'"/>
												<xsl:with-param name="BoxHeight" select="'5mm'"/>
												<xsl:with-param name="BoxTopPadding" select="'.5mm'"/>
											</xsl:call-template>
										</div>
										<div>
											<xsl:call-template name="PopulateIndividualSizableLetterBox">
												<xsl:with-param name="TargetNode" select="$FormData/FacilityLatitudeNum"/>
												<xsl:with-param name="BoxNum" select="3"/>
												<xsl:with-param name="BoxWidth" select="'5mm'"/>
												<xsl:with-param name="BoxHeight" select="'5mm'"/>
												<xsl:with-param name="BoxTopPadding" select="'.5mm'"/>
											</xsl:call-template>
										</div>
										.
										<div>
											<xsl:call-template name="PopulateIndividualSizableLetterBox">
												<xsl:with-param name="TargetNode" select="$FormData/FacilityLatitudeNum"/>
												<xsl:with-param name="BoxNum" select="5"/>
												<xsl:with-param name="BoxWidth" select="'5mm'"/>
												<xsl:with-param name="BoxHeight" select="'5mm'"/>
												<xsl:with-param name="BoxTopPadding" select="'.5mm'"/>
											</xsl:call-template>
										</div>
										<div>
											<xsl:call-template name="PopulateIndividualSizableLetterBox">
												<xsl:with-param name="TargetNode" select="$FormData/FacilityLatitudeNum"/>
												<xsl:with-param name="BoxNum" select="6"/>
												<xsl:with-param name="BoxWidth" select="'5mm'"/>
												<xsl:with-param name="BoxHeight" select="'5mm'"/>
												<xsl:with-param name="BoxTopPadding" select="'.5mm'"/>
											</xsl:call-template>
										</div>
										<div>
											<xsl:call-template name="PopulateIndividualSizableLetterBox">
												<xsl:with-param name="TargetNode" select="$FormData/FacilityLatitudeNum"/>
												<xsl:with-param name="BoxNum" select="7"/>
												<xsl:with-param name="BoxWidth" select="'5mm'"/>
												<xsl:with-param name="BoxHeight" select="'5mm'"/>
												<xsl:with-param name="BoxTopPadding" select="'.5mm'"/>
											</xsl:call-template>
										</div>
										<div>
											<xsl:call-template name="PopulateIndividualSizableLetterBox">
												<xsl:with-param name="TargetNode" select="$FormData/FacilityLatitudeNum"/>
												<xsl:with-param name="BoxNum" select="8"/>
												<xsl:with-param name="BoxWidth" select="'5mm'"/>
												<xsl:with-param name="BoxHeight" select="'5mm'"/>
												<xsl:with-param name="BoxTopPadding" select="'.5mm'"/>
											</xsl:call-template>
										</div>
										<div>
											<xsl:call-template name="PopulateIndividualSizableLetterBox">
												<xsl:with-param name="TargetNode" select="$FormData/FacilityLatitudeNum"/>
												<xsl:with-param name="BoxNum" select="9"/>
												<xsl:with-param name="BoxWidth" select="'5mm'"/>
												<xsl:with-param name="BoxHeight" select="'5mm'"/>
												<xsl:with-param name="BoxTopPadding" select="'.5mm'"/>
											</xsl:call-template>
										</div>
										<div>
											<xsl:call-template name="PopulateIndividualSizableLetterBox">
												<xsl:with-param name="TargetNode" select="$FormData/FacilityLatitudeNum"/>
												<xsl:with-param name="BoxNum" select="10"/>
												<xsl:with-param name="BoxWidth" select="'5mm'"/>
												<xsl:with-param name="BoxHeight" select="'5mm'"/>
												<xsl:with-param name="BoxTopPadding" select="'.5mm'"/>
											</xsl:call-template>
										</div>
									</xsl:when>
									<xsl:otherwise>
										<div class="sty7207EmptyLonLatBox"/>
										<span style="width:3mm">&nbsp;</span>
										<div>
											<xsl:call-template name="PopulateIndividualSizableLetterBox">
												<xsl:with-param name="TargetNode" select="$FormData/FacilityLatitudeNum"/>
												<xsl:with-param name="BoxNum" select="1"/>
												<xsl:with-param name="BoxWidth" select="'5mm'"/>
												<xsl:with-param name="BoxHeight" select="'5mm'"/>
												<xsl:with-param name="BoxTopPadding" select="'.5mm'"/>
											</xsl:call-template>
										</div>
										<div>
											<xsl:call-template name="PopulateIndividualSizableLetterBox">
												<xsl:with-param name="TargetNode" select="$FormData/FacilityLatitudeNum"/>
												<xsl:with-param name="BoxNum" select="2"/>
												<xsl:with-param name="BoxWidth" select="'5mm'"/>
												<xsl:with-param name="BoxHeight" select="'5mm'"/>
												<xsl:with-param name="BoxTopPadding" select="'.5mm'"/>
											</xsl:call-template>
										</div>.
										<div>
											<xsl:call-template name="PopulateIndividualSizableLetterBox">
												<xsl:with-param name="TargetNode" select="$FormData/FacilityLatitudeNum"/>
												<xsl:with-param name="BoxNum" select="4"/>
												<xsl:with-param name="BoxWidth" select="'5mm'"/>
												<xsl:with-param name="BoxHeight" select="'5mm'"/>
												<xsl:with-param name="BoxTopPadding" select="'.5mm'"/>
											</xsl:call-template>
										</div>
										<div>
											<xsl:call-template name="PopulateIndividualSizableLetterBox">
												<xsl:with-param name="TargetNode" select="$FormData/FacilityLatitudeNum"/>
												<xsl:with-param name="BoxNum" select="5"/>
												<xsl:with-param name="BoxWidth" select="'5mm'"/>
												<xsl:with-param name="BoxHeight" select="'5mm'"/>
												<xsl:with-param name="BoxTopPadding" select="'.5mm'"/>
											</xsl:call-template>
										</div>
										<div>
											<xsl:call-template name="PopulateIndividualSizableLetterBox">
												<xsl:with-param name="TargetNode" select="$FormData/FacilityLatitudeNum"/>
												<xsl:with-param name="BoxNum" select="6"/>
												<xsl:with-param name="BoxWidth" select="'5mm'"/>
												<xsl:with-param name="BoxHeight" select="'5mm'"/>
												<xsl:with-param name="BoxTopPadding" select="'.5mm'"/>
											</xsl:call-template>
										</div>
										<div>
											<xsl:call-template name="PopulateIndividualSizableLetterBox">
												<xsl:with-param name="TargetNode" select="$FormData/FacilityLatitudeNum"/>
												<xsl:with-param name="BoxNum" select="7"/>
												<xsl:with-param name="BoxWidth" select="'5mm'"/>
												<xsl:with-param name="BoxHeight" select="'5mm'"/>
												<xsl:with-param name="BoxTopPadding" select="'.5mm'"/>
											</xsl:call-template>
										</div>
										<div>
											<xsl:call-template name="PopulateIndividualSizableLetterBox">
												<xsl:with-param name="TargetNode" select="$FormData/FacilityLatitudeNum"/>
												<xsl:with-param name="BoxNum" select="8"/>
												<xsl:with-param name="BoxWidth" select="'5mm'"/>
												<xsl:with-param name="BoxHeight" select="'5mm'"/>
												<xsl:with-param name="BoxTopPadding" select="'.5mm'"/>
											</xsl:call-template>
										</div>
										<div>
											<xsl:call-template name="PopulateIndividualSizableLetterBox">
												<xsl:with-param name="TargetNode" select="$FormData/FacilityLatitudeNum"/>
												<xsl:with-param name="BoxNum" select="9"/>
												<xsl:with-param name="BoxWidth" select="'5mm'"/>
												<xsl:with-param name="BoxHeight" select="'5mm'"/>
												<xsl:with-param name="BoxTopPadding" select="'.5mm'"/>
											</xsl:call-template>
										</div>
									</xsl:otherwise>
								</xsl:choose>
								<span style="width:3mm;"/>
								
								(ii) Longitude:
								<xsl:choose>
									<xsl:when test="substring($FormData/FacilityLongitudeNum/text(),1,1) = '+' or
									 substring($FormData/FacilityLongitudeNum/text(),1,1) = '-'">
										<div>
											<xsl:call-template name="PopulateIndividualSizableLetterBox">
												<xsl:with-param name="TargetNode" select="$FormData/FacilityLongitudeNum"/>
												<xsl:with-param name="BoxNum" select="1"/>
												<xsl:with-param name="BoxWidth" select="'5mm'"/>
												<xsl:with-param name="BoxHeight" select="'5mm'"/>
												<xsl:with-param name="BoxTopPadding" select="'.5mm'"/>
											</xsl:call-template>
										</div>
										<span style="width:3mm">&nbsp;</span>
										<div>
											<xsl:call-template name="PopulateIndividualSizableLetterBox">
												<xsl:with-param name="TargetNode" select="$FormData/FacilityLongitudeNum"/>
												<xsl:with-param name="BoxNum" select="2"/>
												<xsl:with-param name="BoxWidth" select="'5mm'"/>
												<xsl:with-param name="BoxHeight" select="'5mm'"/>
												<xsl:with-param name="BoxTopPadding" select="'.5mm'"/>
											</xsl:call-template>
										</div>
										<div>
											<xsl:call-template name="PopulateIndividualSizableLetterBox">
												<xsl:with-param name="TargetNode" select="$FormData/FacilityLongitudeNum"/>
												<xsl:with-param name="BoxNum" select="3"/>
												<xsl:with-param name="BoxWidth" select="'5mm'"/>
												<xsl:with-param name="BoxHeight" select="'5mm'"/>
												<xsl:with-param name="BoxTopPadding" select="'.5mm'"/>
											</xsl:call-template>
										</div>
										<div>
											<xsl:call-template name="PopulateIndividualSizableLetterBox">
												<xsl:with-param name="TargetNode" select="$FormData/FacilityLongitudeNum"/>
												<xsl:with-param name="BoxNum" select="4"/>
												<xsl:with-param name="BoxWidth" select="'5mm'"/>
												<xsl:with-param name="BoxHeight" select="'5mm'"/>
												<xsl:with-param name="BoxTopPadding" select="'.5mm'"/>
											</xsl:call-template>
										</div>
										.
										<div>
											<xsl:call-template name="PopulateIndividualSizableLetterBox">
												<xsl:with-param name="TargetNode" select="$FormData/FacilityLongitudeNum"/>
												<xsl:with-param name="BoxNum" select="6"/>
												<xsl:with-param name="BoxWidth" select="'5mm'"/>
												<xsl:with-param name="BoxHeight" select="'5mm'"/>
												<xsl:with-param name="BoxTopPadding" select="'.5mm'"/>
											</xsl:call-template>
										</div>
										<div>
											<xsl:call-template name="PopulateIndividualSizableLetterBox">
												<xsl:with-param name="TargetNode" select="$FormData/FacilityLongitudeNum"/>
												<xsl:with-param name="BoxNum" select="7"/>
												<xsl:with-param name="BoxWidth" select="'5mm'"/>
												<xsl:with-param name="BoxHeight" select="'5mm'"/>
												<xsl:with-param name="BoxTopPadding" select="'.5mm'"/>
											</xsl:call-template>
										</div>
										<div>
											<xsl:call-template name="PopulateIndividualSizableLetterBox">
												<xsl:with-param name="TargetNode" select="$FormData/FacilityLongitudeNum"/>
												<xsl:with-param name="BoxNum" select="8"/>
												<xsl:with-param name="BoxWidth" select="'5mm'"/>
												<xsl:with-param name="BoxHeight" select="'5mm'"/>
												<xsl:with-param name="BoxTopPadding" select="'.5mm'"/>
											</xsl:call-template>
										</div>
										<div>
											<xsl:call-template name="PopulateIndividualSizableLetterBox">
												<xsl:with-param name="TargetNode" select="$FormData/FacilityLongitudeNum"/>
												<xsl:with-param name="BoxNum" select="9"/>
												<xsl:with-param name="BoxWidth" select="'5mm'"/>
												<xsl:with-param name="BoxHeight" select="'5mm'"/>
												<xsl:with-param name="BoxTopPadding" select="'.5mm'"/>
											</xsl:call-template>
										</div>
										<div>
											<xsl:call-template name="PopulateIndividualSizableLetterBox">
												<xsl:with-param name="TargetNode" select="$FormData/FacilityLongitudeNum"/>
												<xsl:with-param name="BoxNum" select="10"/>
												<xsl:with-param name="BoxWidth" select="'5mm'"/>
												<xsl:with-param name="BoxHeight" select="'5mm'"/>
												<xsl:with-param name="BoxTopPadding" select="'.5mm'"/>
											</xsl:call-template>
										</div>
										<div>
											<xsl:call-template name="PopulateIndividualSizableLetterBox">
												<xsl:with-param name="TargetNode" select="$FormData/FacilityLongitudeNum"/>
												<xsl:with-param name="BoxNum" select="11"/>
												<xsl:with-param name="BoxWidth" select="'5mm'"/>
												<xsl:with-param name="BoxHeight" select="'5mm'"/>
												<xsl:with-param name="BoxTopPadding" select="'.5mm'"/>
											</xsl:call-template>
										</div>
									</xsl:when>
									<xsl:otherwise>
										<div class="sty7207EmptyLonLatBox"/>
										<span style="width:3mm">&nbsp;</span>
										<div>
											<xsl:call-template name="PopulateIndividualSizableLetterBox">
												<xsl:with-param name="TargetNode" select="$FormData/FacilityLongitudeNum"/>
												<xsl:with-param name="BoxNum" select="1"/>
												<xsl:with-param name="BoxWidth" select="'5mm'"/>
												<xsl:with-param name="BoxHeight" select="'5mm'"/>
												<xsl:with-param name="BoxTopPadding" select="'.5mm'"/>
											</xsl:call-template>
										</div>
										<div>
											<xsl:call-template name="PopulateIndividualSizableLetterBox">
												<xsl:with-param name="TargetNode" select="$FormData/FacilityLongitudeNum"/>
												<xsl:with-param name="BoxNum" select="2"/>
												<xsl:with-param name="BoxWidth" select="'5mm'"/>
												<xsl:with-param name="BoxHeight" select="'5mm'"/>
												<xsl:with-param name="BoxTopPadding" select="'.5mm'"/>
											</xsl:call-template>
										</div>
										<div>
											<xsl:call-template name="PopulateIndividualSizableLetterBox">
												<xsl:with-param name="TargetNode" select="$FormData/FacilityLongitudeNum"/>
												<xsl:with-param name="BoxNum" select="3"/>
												<xsl:with-param name="BoxWidth" select="'5mm'"/>
												<xsl:with-param name="BoxHeight" select="'5mm'"/>
												<xsl:with-param name="BoxTopPadding" select="'.5mm'"/>
											</xsl:call-template>
										</div>
										.
										<div>
											<xsl:call-template name="PopulateIndividualSizableLetterBox">
												<xsl:with-param name="TargetNode" select="$FormData/FacilityLongitudeNum"/>
												<xsl:with-param name="BoxNum" select="5"/>
												<xsl:with-param name="BoxWidth" select="'5mm'"/>
												<xsl:with-param name="BoxHeight" select="'5mm'"/>
												<xsl:with-param name="BoxTopPadding" select="'.5mm'"/>
											</xsl:call-template>
										</div>
										<div>
											<xsl:call-template name="PopulateIndividualSizableLetterBox">
												<xsl:with-param name="TargetNode" select="$FormData/FacilityLongitudeNum"/>
												<xsl:with-param name="BoxNum" select="6"/>
												<xsl:with-param name="BoxWidth" select="'5mm'"/>
												<xsl:with-param name="BoxHeight" select="'5mm'"/>
												<xsl:with-param name="BoxTopPadding" select="'.5mm'"/>
											</xsl:call-template>
										</div>
										<div>
											<xsl:call-template name="PopulateIndividualSizableLetterBox">
												<xsl:with-param name="TargetNode" select="$FormData/FacilityLongitudeNum"/>
												<xsl:with-param name="BoxNum" select="7"/>
												<xsl:with-param name="BoxWidth" select="'5mm'"/>
												<xsl:with-param name="BoxHeight" select="'5mm'"/>
												<xsl:with-param name="BoxTopPadding" select="'.5mm'"/>
											</xsl:call-template>
										</div>
										<div>
											<xsl:call-template name="PopulateIndividualSizableLetterBox">
												<xsl:with-param name="TargetNode" select="$FormData/FacilityLongitudeNum"/>
												<xsl:with-param name="BoxNum" select="8"/>
												<xsl:with-param name="BoxWidth" select="'5mm'"/>
												<xsl:with-param name="BoxHeight" select="'5mm'"/>
												<xsl:with-param name="BoxTopPadding" select="'.5mm'"/>
											</xsl:call-template>
										</div>
										<div>
											<xsl:call-template name="PopulateIndividualSizableLetterBox">
												<xsl:with-param name="TargetNode" select="$FormData/FacilityLongitudeNum"/>
												<xsl:with-param name="BoxNum" select="9"/>
												<xsl:with-param name="BoxWidth" select="'5mm'"/>
												<xsl:with-param name="BoxHeight" select="'5mm'"/>
												<xsl:with-param name="BoxTopPadding" select="'.5mm'"/>
											</xsl:call-template>
										</div>
										<div>
											<xsl:call-template name="PopulateIndividualSizableLetterBox">
												<xsl:with-param name="TargetNode" select="$FormData/FacilityLongitudeNum"/>
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
								<span style="width:17mm">&nbsp;</span>
								<span>Enter a "+" (plus) or "-" (minus) sign in the first box.</span>
							</div>
						</div>
						<!-- Part I - 5 -->
						<div class="styStdDiv" style="width:187mm;height:6mm;">
							<div class="styLNLeftLtrBox" style="">5</div>
							<div style="width:155mm;">Check to indicate whether the election under section 45X(a)(3)(B) has 
							 been made for this tax year<span class="sty7207DotLn">.......</span>
							</div>
							Yes
							<input type="Checkbox" class="styCkboxNM" alt="Section 45Xa3B Election Indicator Yes">
								<xsl:call-template name="PopulateYesCheckbox">
									<xsl:with-param name="TargetNode" select="$FormData/Section45Xa3BElectionInd"/>
									<xsl:with-param name="BackupName">Section45Xa3BElectionInd</xsl:with-param>
								</xsl:call-template>
							</input>
							<span style="width:3mm;"/>
							No
							<input type="Checkbox" class="styCkboxNM" alt="Section 45Xa3B Election Indicator No">
								<xsl:call-template name="PopulateNoCheckbox">
									<xsl:with-param name="TargetNode" select="$FormData/Section45Xa3BElectionInd"/>
									<xsl:with-param name="BackupName">Section45Xa3BElectionInd</xsl:with-param>
								</xsl:call-template>
							</input>
						</div>
						<!-- Part I - 6 -->
						<div class="styStdDiv" style="width:187mm;height:7mm;">
							<div class="styLNLeftLtrBox" style="">6</div>
							<div style="width:155mm;">Check to indicate whether eligible components include property at a facility taken into account<br/>
							for which a credit under section 48C is being claimed. See instructions <span class="sty7207DotLn">................ </span>
							</div>
							Yes
							<input type="Checkbox" class="styCkboxNM" alt="Section 48C Eligible Property Indicator Yes">
								<xsl:call-template name="PopulateYesCheckbox">
									<xsl:with-param name="TargetNode" select="$FormData/Section48CEligiblePropertyInd"/>
									<xsl:with-param name="BackupName">Section48CEligiblePropertyInd</xsl:with-param>
								</xsl:call-template>
							</input>
							<span style="width:3mm;"/>
							No
							<input type="Checkbox" class="styCkboxNM" alt="Section 48C Eligible Property Indicator No">
								<xsl:call-template name="PopulateNoCheckbox">
									<xsl:with-param name="TargetNode" select="$FormData/Section48CEligiblePropertyInd"/>
									<xsl:with-param name="BackupName">Section48CEligiblePropertyInd</xsl:with-param>
								</xsl:call-template>
							</input>
						</div>
					</div>
					<!-- Part I - End -->
					<!-- ************************** PART II START ************************** -->
					<!-- Part II - Eligible Components -->
					<div class="styStdDiv" style="border-bottom:1px solid black;border-top:1px solid black;">
						<div class="styPartName" style="font-size:10pt;padding-bottom:4.5mm;font-family:arial;text-align:center;padding-top:.5mm">Part II</div>
						<div class="styPartDesc" style="font-size:9pt;padding-bottom:4.5mm;padding-top:.3mm;font-family:arial;">
							Eligible Components
						</div>
					</div>
					<div class="styGenericDiv" style="height:8mm;">
						Components produced by you in the United States and sold in your trade or business during your tax year to unrelated persons<br/>
						(unless the election under section 45X(a)(3)(B) has been made). See instructions.
					</div>
					<!-- Part II - 1 -->
					<div style="width:187mm;height:6mm;text-align:center;border-top:.5px solid black; border-bottom:.5px solid black;">
						<div class="styLNLeftLtrBox" style="font-size:9pt">1</div>
						<span class="styBoldText" style="font-size:10pt;">Solar Energy Components</span>
					</div>
					<!-- Part II - Solar Energy Components Table -->
					<table class="styTable" style="border-collapse:collapse;font-size:7pt;">
						<thead class="styTableThead">
							<tr style="vertical-align:top;">
								<th class="styTableCellHeader" scope="col" style="width:77mm;">
                                        (a)<br/>Eligible component
                                    </th>
								<th class="styTableCellHeader" scope="col" style="width:30mm;">
                                        (b)<br/>Unit<br/>
								</th>
								<th class="styTableCellHeader" scope="col" style="width:20mm;">
										(c)<br/>Credit per unit
                                    </th>
								<th class="styTableCellHeader" scope="col" style="width:30mm;">
                                        (d)<br/>
                                        Lines 1a and 1e:<br/>
									<span style="font-weight:normal;">aggregate capacity <br/> (see instructions)</span>
									<br/>
									<br/>
                                        Lines 1b-1d, 1f,<br/>and 1g: <span style="font-weight:normal;display:inline;">number of<br/>units specified in<br/>column (b)</span>
								</th>
								<th class="styTableCellHeader" scope="col" style="width:32mm;border-right-width:0px;">
                                        (e)<br/>Amount of credit<br/>
									<span style="font-weight:normal">(column (c) multiplied<br/>by column (d))</span>
								</th>
							</tr>
						</thead>
						<tbody>
							<tr style="height:6mm;">
								<td class="styTableCell" style="width:77mm;border-bottom:0mm;">
									<div style="width:77mm;text-align:left;">
										<div class="styLNLeftLtrBox">a</div>
												Thin film photovoltaic cell or crystalline photovoltaic cell <span class="sty7207DotLn">...............</span>
									</div>
								</td>
								<td class="styTableCellTextInherit" style="text-align:center;">
											Capacity in direct current watts
										</td>
								<td class="styTableCellTextInherit" style="text-align:center;vertical-align:bottom">
											$ 0.04
										</td>
								<td class="styTableCellAmtInherit" style="vertical-align:bottom;">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$FormData/PhotovoltaicCellGrp/UnitsProducedQty"/>
									</xsl:call-template>
								</td>
								<td class="styTableCellAmtInherit" style="vertical-align:bottom;border-right-width:0px;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/PhotovoltaicCellGrp/CreditAmt"/>
									</xsl:call-template>
								</td>
							</tr>
							<tr style="height:4mm;">
								<td class="styTableCell" style="width:77mm;border-bottom:0mm;">
									<div style="width:77mm;text-align:left;">
										<div class="styLNLeftLtrBox">b</div> 
										 Photovoltaic wafer <span class="sty7207DotLn">...........</span>
									</div>
								</td>
								<td class="styTableCellTextInherit" style="text-align:center;">
											Square meter
										</td>
								<td class="styTableCellTextInherit" style="text-align:center;">
											$ 12.00
										</td>
								<td class="styTableCellAmtInherit">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$FormData/PhotovoltaicWaferGrp/UnitsProducedQty"/>
									</xsl:call-template>
								</td>
								<td class="styTableCellAmtInherit" style="border-right-width:0px;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/PhotovoltaicWaferGrp/CreditAmt"/>
									</xsl:call-template>
								</td>
							</tr>
							<tr style="height:4mm;">
								<td class="styTableCell" style="width:77mm;border-bottom:0mm;">
									<div style="width:77mm;text-align:left;">
										<div class="styLNLeftLtrBox">c</div> 
												Solar grade polysilicon <span class="sty7207DotLn">.........</span>
									</div>
								</td>
								<td class="styTableCellTextInherit" style="text-align:center;">
											Kilogram
										</td>
								<td class="styTableCellTextInherit" style="text-align:center;">
											$ 3.00
										</td>
								<td class="styTableCellAmtInherit">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$FormData/SolarGradePolysiliconGrp/UnitsProducedQty"/>
									</xsl:call-template>
								</td>
								<td class="styTableCellAmtInherit" style="border-right-width:0px;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/SolarGradePolysiliconGrp/CreditAmt"/>
									</xsl:call-template>
								</td>
							</tr>
							<tr style="height:4mm;">
								<td class="styTableCell" style="width:77mm;border-bottom:0mm;">
									<div style="width:77mm;text-align:left;">
										<div class="styLNLeftLtrBox">d</div> 
												Polymeric backsheet <span class="sty7207DotLn">..........</span>
									</div>
								</td>
								<td class="styTableCellTextInherit" style="text-align:center;">
											Square meter
										</td>
								<td class="styTableCellTextInherit" style="text-align:center;">
											$ 0.40
										</td>
								<td class="styTableCellAmtInherit">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$FormData/PolymericBacksheetGrp/UnitsProducedQty"/>
									</xsl:call-template>
								</td>
								<td class="styTableCellAmtInherit" style="border-right-width:0px;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/PolymericBacksheetGrp/CreditAmt"/>
									</xsl:call-template>
								</td>
							</tr>
							<tr style="height:6mm;">
								<td class="styTableCell" style="width:77mm;border-bottom:0mm;">
									<div style="width:77mm;text-align:left;">
										<div class="styLNLeftLtrBox">e</div> 
												Solar module <span class="sty7207DotLn">............</span>
									</div>
								</td>
								<td class="styTableCellTextInherit" style="text-align:center;">
								 Capacity in direct current watts
								</td>
								<td class="styTableCellTextInherit" style="text-align:center;vertical-align:bottom">
								 $ 0.07
								</td>
								<td class="styTableCellAmtInherit" style="vertical-align:bottom">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$FormData/SolarModuleGrp/UnitsProducedQty"/>
									</xsl:call-template>
								</td>
								<td class="styTableCellAmtInherit" style="border-right-width:0px;vertical-align:bottom">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/SolarModuleGrp/CreditAmt"/>
									</xsl:call-template>
								</td>
							</tr>
							<tr style="height:4mm;">
								<td class="styTableCell" style="width:77mm;border-bottom:0mm;">
									<div style="width:77mm;text-align:left;">
										<div class="styLNLeftLtrBox">f</div> 
												Torque tube (for solar tracking device) <span class="sty7207DotLn">....</span>
									</div>
								</td>
								<td class="styTableCellTextInherit" style="text-align:center;">
											Kilogram
										</td>
								<td class="styTableCellTextInherit" style="text-align:center;">
											$ 0.87
										</td>
								<td class="styTableCellAmtInherit">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$FormData/TorqueTubeGrp/UnitsProducedQty"/>
									</xsl:call-template>
								</td>
								<td class="styTableCellAmtInherit" style="border-right-width:0px;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/TorqueTubeGrp/CreditAmt"/>
									</xsl:call-template>
								</td>
							</tr>
							<tr style="height:4mm;">
								<td class="styTableCell" style="width:77mm;border-bottom:0mm;border-bottom:0px;">
									<div style="width:77mm;text-align:left;">
										<div class="styLNLeftLtrBox">g</div> 
										 Structural fastener (for solar tracking device <span class="sty7207DotLn">...</span>
									</div>
								</td>
								<td class="styTableCellTextInherit" style="text-align:center;vertical-align:bottom;border-bottom:0px;">
								 Kilogram
								</td>
								<td class="styTableCellTextInherit" style="text-align:center;vertical-align:bottom;border-bottom:0px;">
								 $ 2.28
								</td>
								<td class="styTableCellAmtInherit" style="vertical-align:bottom;border-bottom:0px;">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$FormData/StructuralFastenerGrp/UnitsProducedQty"/>
									</xsl:call-template>
								</td>
								<td class="styTableCellAmtInherit" style="border-right-width:0px;border-bottom:0px;">$
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/StructuralFastenerGrp/CreditAmt"/>
									</xsl:call-template>
								</td>
							</tr>
						</tbody>
					</table>
					<!-- Part II - 2 -->
					<div style="width:187mm;height:6mm;text-align:center;border-top:.5px solid black; border-bottom:.5px solid black;">
						<div class="styLNLeftLtrBox" style="font-size:9pt">2</div>
						<span class="styBoldText" style="font-size:10pt;">Wind Energy Components</span>
					</div>
					<!-- Part II - Wind Energy Components Table -->
					<table class="styTable" style="border-collapse:collapse;font-size:7pt;">
						<thead class="styTableThead">
							<tr style="vertical-align:top;">
								<th class="styTableCellHeader" scope="col" style="width:77mm;">
                                        (a)<br/>Eligible component
                                    </th>
								<th class="styTableCellHeader" scope="col" style="width:30mm;">
                                        (b)<br/>Unit<br/>
								</th>
								<th class="styTableCellHeader" scope="col" style="width:20mm;">
										(c)<br/>Credit per unit
                                    </th>
								<th class="styTableCellHeader" scope="col" style="width:30mm;">
                                        (d)<br/>
                                        Lines 2a:
									<span style="font-weight:normal;display:inline;">sales price <br/> from Part III</span>
									<br/>
									<br/>
                                        Lines 2b-2f:<br/>
									<span style="font-weight:normal;">aggregate capacity<br/>(see instructions)</span>
								</th>
								<th class="styTableCellHeader" scope="col" style="width:32mm;border-right-width:0px;">
                                        (e)<br/>Amount of credit<br/>
									<span style="font-weight:normal">(column (c) multiplied<br/>by column (d))</span>
								</th>
							</tr>
						</thead>
						<tbody>
							<tr style="height:4mm;">
								<td class="styTableCell" style="width:77mm;border-bottom:0mm;">
									<div style="width:77mm;text-align:left;">
										<div class="styLNLeftLtrBox">a</div>
											Related offshore wind vessel(s) from Part III <span class="sty7207DotLn">...</span>
									</div>
								</td>
								<td class="styTableCellTextInherit" style="text-align:center;">
											Sales price of vessel
										</td>
								<td class="styTableCellTextInherit" style="text-align:center;">
											10% (0.10)
										</td>
								<td class="styTableCellAmtInherit" style="border-right-width:1px;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/TotalSalesPriceAmt"/>
									</xsl:call-template>
								</td>
								<td class="styTableCellAmtInherit" style="border-right-width:0px;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/RelatedOffshoreWindVesselCrAmt"/>
									</xsl:call-template>
								</td>
							</tr>
							<tr style="height:4mm;">
								<td class="styTableCell" style="width:77mm;border-bottom:0mm;">
									<div style="width:77mm;text-align:left;">
										<div class="styLNLeftLtrBox">b</div> 
											Blade <span class="sty7207DotLn">...............</span>
									</div>
								</td>
								<td class="styTableCellTextInherit" style="text-align:center;border-bottom:0px;" rowspan="5">
											Total rated capacity(expressed on a per watt basis) of the completed wind turbine for which such component is designed
										</td>
								<td class="styTableCellTextInherit" style="text-align:center;">
											$ 0.02
										</td>
								<td class="styTableCellAmtInherit">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$FormData/BladeGrp/UnitsProducedQty"/>
									</xsl:call-template>
								</td>
								<td class="styTableCellAmtInherit" style="border-right-width:0px;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/BladeGrp/CreditAmt"/>
									</xsl:call-template>
								</td>
							</tr>
							<tr style="height:4mm;">
								<td class="styTableCell" style="width:77mm;border-bottom:0mm;">
									<div style="width:77mm;text-align:left;">
										<div class="styLNLeftLtrBox">c</div> 
											Nacelle <span class="sty7207DotLn">..............</span>
									</div>
								</td>
								<td class="styTableCellTextInherit" style="text-align:center;">
											$ 0.05
										</td>
								<td class="styTableCellAmtInherit">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$FormData/NacelleGrp/UnitsProducedQty"/>
									</xsl:call-template>
								</td>
								<td class="styTableCellAmtInherit" style="border-right-width:0px;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/NacelleGrp/CreditAmt"/>
									</xsl:call-template>
								</td>
							</tr>
							<tr style="height:4mm;">
								<td class="styTableCell" style="width:77mm;border-bottom:0mm;">
									<div style="width:77mm;text-align:left;">
										<div class="styLNLeftLtrBox">d</div> 
											Tower <span class="sty7207DotLn">...............</span>
									</div>
								</td>
								<td class="styTableCellTextInherit" style="text-align:center;">
											$ 0.03
										</td>
								<td class="styTableCellAmtInherit">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$FormData/TowerGrp/UnitsProducedQty"/>
									</xsl:call-template>
								</td>
								<td class="styTableCellAmtInherit" style="border-right-width:0px;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/TowerGrp/CreditAmt"/>
									</xsl:call-template>
								</td>
							</tr>
							<tr style="height:6mm;">
								<td class="styTableCell" style="width:77mm;border-bottom:0mm;">
									<div style="width:77mm;text-align:left;">
										<div class="styLNLeftLtrBox">e</div> 
											Offshore wind foundation which uses a fixed<br/>platform <span class="sty7207DotLn">..............</span>
									</div>
								</td>
								<td class="styTableCellTextInherit" style="text-align:center;">
											$ 0.02
										</td>
								<td class="styTableCellAmtInherit">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$FormData/OffshoreWindFndtnFxdPltfGrp/UnitsProducedQty"/>
									</xsl:call-template>
								</td>
								<td class="styTableCellAmtInherit" style="border-right-width:0px;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/OffshoreWindFndtnFxdPltfGrp/CreditAmt"/>
									</xsl:call-template>
								</td>
							</tr>
							<tr style="height:6mm;">
								<td class="styTableCell" style="width:77mm;border-bottom:0px;">
									<div style="width:77mm;text-align:left;">
										<div class="styLNLeftLtrBox">f</div> 
											Offshore wind foundation which uses a floating<br/>platform <span class="sty7207DotLn">..............</span>
									</div>
								</td>
								<td class="styTableCellTextInherit" style="text-align:center;border-bottom:0px;">
											$ 0.04
										</td>
								<td class="styTableCellAmtInherit" style="border-bottom:0px;">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$FormData/OffshoreWindFndtnFloatPltfGrp/UnitsProducedQty"/>
									</xsl:call-template>
								</td>
								<td class="styTableCellAmtInherit" style="border-right-width:0px;border-bottom:0px;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/OffshoreWindFndtnFloatPltfGrp/CreditAmt"/>
									</xsl:call-template>
								</td>
							</tr>
						</tbody>
					</table>
					<!--</div>-->
					<!-- Part II - End -->
					<div class="pageEnd" style="width:187mm;border-top:2px solid black;">
						<span class="styBoldText" style="width:100mm;">For Privacy Act and Paperwork Reduction Act Notice, see instructions. </span>
						<span style="width:35mm; text-align:center;">Cat. No. 56400S</span>
						<div style="clear:none;width:50mm;text-align:right;">
								Form <span style="font-size:9pt;">
								<b>7207</b>
							</span> (Rev. 12-2025)<br/>
						</div>
					</div>
					<!-- Page 1 End -->
					<!-- Begin page 2 -->
					<div class="styStdDiv" style="width:187mm;">
						Form 7207 (Rev. 12-2025)
						<span style="float:right;">Page <span style="font-weight:bold;font-size:8pt;">2</span>
						</span>
					</div>
					<div class="styStdDiv" style="border-bottom:1px solid black;border-top:1px solid black;">
						<div class="styPartName" style="font-size:10pt;padding-bottom:4.5mm;font-family:arial;text-align:center;padding-top:.5mm">Part II</div>
						<div class="styPartDesc" style="font-size:9pt;padding-bottom:4.5mm;padding-top:.3mm;font-family:arial;">
							Eligible Components <i>(continued)</i>
						</div>
					</div>
					<div class="styGenericDiv" style="height:8mm;">
						Components produced by you in the United States and sold in your trade or business during your tax year to unrelated persons<br/>
						(unless the election under section 45X(a)(3)(B) has been made). See instructions.
					</div>
					<!-- Part II - 3 -->
					<div style="width:187mm;height:6mm;text-align:center;border-top:.5px solid black; border-bottom:.5px solid black;">
						<div class="styLNLeftLtrBox" style="font-size:9pt">3</div>
						<span class="styBoldText" style="font-size:10pt;">Inverter Components</span>
					</div>
					<!-- Part II - Inverter Components Table -->
					<table class="styTable" style="border-collapse:collapse;font-size:7pt;">
						<thead class="styTableThead">
							<tr style="vertical-align:top;">
								<th class="styTableCellHeader" scope="col" style="width:77mm;">
                                        (a)<br/>Eligible component
                                    </th>
								<th class="styTableCellHeader" scope="col" style="width:30mm;">
                                        (b)<br/>Unit<br/>
								</th>
								<th class="styTableCellHeader" scope="col" style="width:20mm;">
										(c)<br/>Credit per unit
                                    </th>
								<th class="styTableCellHeader" scope="col" style="width:30mm;">
                                        (d)<br/>
                                        Lines 3a-3f:<br/>
									<span style="font-weight:normal;">aggregate capacity<br/>(see instructions)</span>
								</th>
								<th class="styTableCellHeader" scope="col" style="width:32mm;border-right-width:0px;">
                                        (e)<br/>Amount of credit<br/>
									<span style="font-weight:normal">(column (c) multiplied<br/>by column (d))</span>
								</th>
							</tr>
						</thead>
						<tbody>
							<tr style="height:4mm;">
								<td class="styTableCell" style="width:77mm;border-bottom:0mm;">
									<div style="width:77mm;text-align:left;">
										<div class="styLNLeftLtrBox">a</div>
												Central inverter<span class="sty7207DotLn">............</span>
									</div>
								</td>
								<td class="styTableCellTextInherit" style="text-align:center;border-bottom:0px;" rowspan="6">
									Capacity expressed on a per alternating current watt basis
								</td>
								<td class="styTableCellTextInherit" style="text-align:center;">
									$ 0.0025
								</td>
								<td class="styTableCellAmtInherit">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$FormData/CentralInverterGrp/UnitsProducedQty"/>
									</xsl:call-template>
								</td>
								<td class="styTableCellAmtInherit" style="border-right-width:0px;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/CentralInverterGrp/CreditAmt"/>
									</xsl:call-template>
								</td>
							</tr>
							<tr style="height:4mm;">
								<td class="styTableCell" style="width:77mm;border-bottom:0mm;">
									<div style="width:77mm;text-align:left;">
										<div class="styLNLeftLtrBox">b</div> 
											Utility Inverter <span class="sty7207DotLn">............</span>
									</div>
								</td>
								<td class="styTableCellTextInherit" style="text-align:center;">
											$ 0.015
										</td>
								<td class="styTableCellAmtInherit">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$FormData/UtilityInverterGrp/UnitsProducedQty"/>
									</xsl:call-template>
								</td>
								<td class="styTableCellAmtInherit" style="border-right-width:0px;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/UtilityInverterGrp/CreditAmt"/>
									</xsl:call-template>
								</td>
							</tr>
							<tr style="height:4mm;">
								<td class="styTableCell" style="width:77mm;border-bottom:0mm;">
									<div style="width:77mm;text-align:left;">
										<div class="styLNLeftLtrBox">c</div> 
											Commercial inverter <span class="sty7207DotLn">..........</span>
									</div>
								</td>
								<td class="styTableCellTextInherit" style="text-align:center;">
											$ 0.02
										</td>
								<td class="styTableCellAmtInherit">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$FormData/CommercialInverterGrp/UnitsProducedQty"/>
									</xsl:call-template>
								</td>
								<td class="styTableCellAmtInherit" style="border-right-width:0px;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/CommercialInverterGrp/CreditAmt"/>
									</xsl:call-template>
								</td>
							</tr>
							<tr style="height:4mm;">
								<td class="styTableCell" style="width:77mm;border-bottom:0mm;">
									<div style="width:77mm;text-align:left;">
										<div class="styLNLeftLtrBox">d</div> 
											Residential inverter <span class="sty7207DotLn">...........</span>
									</div>
								</td>
								<td class="styTableCellTextInherit" style="text-align:center;">
											$ 0.065
										</td>
								<td class="styTableCellAmtInherit">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$FormData/ResidentialInverterGrp/UnitsProducedQty"/>
									</xsl:call-template>
								</td>
								<td class="styTableCellAmtInherit" style="border-right-width:0px;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/ResidentialInverterGrp/CreditAmt"/>
									</xsl:call-template>
								</td>
							</tr>
							<tr style="height:4mm;">
								<td class="styTableCell" style="width:77mm;border-bottom:0mm;">
									<div style="width:77mm;text-align:left;">
										<div class="styLNLeftLtrBox">e</div> 
											Microinverter <span class="sty7207DotLn">............</span>
									</div>
								</td>
								<td class="styTableCellTextInherit" style="text-align:center;">
											$ 0.11
										</td>
								<td class="styTableCellAmtInherit">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$FormData/MicroinverterGrp/UnitsProducedQty"/>
									</xsl:call-template>
								</td>
								<td class="styTableCellAmtInherit" style="border-right-width:0px;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/MicroinverterGrp/CreditAmt"/>
									</xsl:call-template>
								</td>
							</tr>
							<tr style="height:4mm;border-bottom:0;">
								<td class="styTableCell" style="width:77mm;border-bottom:0mm;">
									<div style="width:77mm;text-align:left;">
										<div class="styLNLeftLtrBox">f</div> 
											Distributed wind inverter<span class="sty7207DotLn">.........</span>
									</div>
								</td>
								<td class="styTableCellTextInherit" style="text-align:center;border-bottom:0px;">
											$ 0.11
										</td>
								<td class="styTableCellAmtInherit" style="border-bottom:0px;">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$FormData/DistributedWindInverterGrp/UnitsProducedQty"/>
									</xsl:call-template>
								</td>
								<td class="styTableCellAmtInherit" style="border-right-width:0px;border-bottom:0px;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/DistributedWindInverterGrp/CreditAmt"/>
									</xsl:call-template>
								</td>
							</tr>
						</tbody>
					</table>
					<!-- Part II - 4 -->
					<div style="width:187mm;height:6mm;text-align:center;border-top:.5px solid black; border-bottom:.5px solid black;">
						<div class="styLNLeftLtrBox" style="font-size:9pt">4</div>
						<span class="styBoldText" style="font-size:10pt;">Electrode Active Materials</span>
					</div>
					<!-- Part II - Electrode Active Materials Table -->
					<table class="styTable" style="border-collapse:collapse;font-size:7pt;">
						<thead class="styTableThead">
							<tr style="vertical-align:top;">
								<th class="styTableCellHeader" scope="col" style="width:77mm;">
                                        (a)<br/>Eligible component
                                    </th>
								<th class="styTableCellHeader" scope="col" style="width:30mm;">
                                        (b)<br/>Unit<br/>
								</th>
								<th class="styTableCellHeader" scope="col" style="width:20mm;">
										(c)<br/>Credits per unit
                                    </th>
								<th class="styTableCellHeader" scope="col" style="width:30mm;">
                                        (d)<br/>Costs incurred<br/>
									<span style="font-weight:normal">(as indicated in column (b))</span>
								</th>
								<th class="styTableCellHeader" scope="col" style="width:32mm;border-right-width:0px;">
                                        (e)<br/>Amount of credit<br/>
									<span style="font-weight:normal">(column (c) multiplied<br/>by column (d))</span>
								</th>
							</tr>
						</thead>
						<tbody>
							<tr style="height:14mm;">
								<td class="styTableCellTextInherit" style="width:77mm;border-bottom:0mm;">
									<div style="width:77mm;height:14mm;padding-top:10mm;">
										<div class="styLNLeftLtrBox">a</div>
											Electrode active materials<span class="sty7207DotLn">........</span>
									</div>
								</td>
								<td class="styTableCellTextInherit" style="text-align:center;border-bottom:0px;" rowspan="6">
									Costs incurred by taxpayer with respect to the production of electrode active materials
								</td>
								<td class="styTableCellTextInherit" style="text-align:center;border-bottom-width:0px;">
									10% (0.10)
								</td>
								<td class="styTableCellAmtInherit" style="border-bottom:0px;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/ElectrodeActiveMaterialsGrp/CostsIncurredAmt"/>
									</xsl:call-template>
								</td>
								<td class="styTableCellAmtInherit" style="border-right-width:0px;border-bottom:0px;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/ElectrodeActiveMaterialsGrp/CreditAmt"/>
									</xsl:call-template>
								</td>
							</tr>
						</tbody>
					</table>
					<!-- Part II - 5 -->
					<div style="width:187mm;height:6mm;text-align:center;border-top:.5px solid black; border-bottom:.5px solid black;">
						<div class="styLNLeftLtrBox" style="font-size:9pt">5</div>
						<span class="styBoldText" style="font-size:10pt;">Battery Components</span>
					</div>
					<!-- Part II - Battery Components Table -->
					<table class="styTable" style="border-collapse:collapse;font-size:7pt;">
						<thead class="styTableThead">
							<tr style="vertical-align:top;">
								<th class="styTableCellHeader" scope="col" style="width:77mm;">
                                        (a)<br/>Eligible component
                                    </th>
								<th class="styTableCellHeader" scope="col" style="width:30mm;">
                                        (b)<br/>Unit<br/>
								</th>
								<th class="styTableCellHeader" scope="col" style="width:20mm;">
										(c)<br/>Credit per unit
                                    </th>
								<th class="styTableCellHeader" scope="col" style="width:30mm;">
                                        (d)<br/>Lines 5a-5c:<br/>
									<span style="font-weight:normal;">aggregate capacity<br/>(see instructions)</span>
								</th>
								<th class="styTableCellHeader" scope="col" style="width:32mm;border-right-width:0px;">
                                        (e)<br/>Amount of credit<br/>
									<span style="font-weight:normal">(column (c) multiplied<br/>by column (d))</span>
								</th>
							</tr>
						</thead>
						<tbody>
							<tr style="height:8mm;">
								<td class="styTableCell" style="width:77mm;border-bottom:0mm;">
									<div style="width:77mm;text-align:left;">
										<div class="styLNLeftLtrBox">a</div>
											Battery cell<span class="sty7207DotLn">.............</span>
									</div>
								</td>
								<td class="styTableCellTextInherit" style="text-align:center;border-bottom:0px;" rowspan="3">
									Capacity expressed on a killowatt-hour basis (limitations apply; see instructions)
								</td>
								<td class="styTableCellTextInherit" style="text-align:center;">
									$ 35.00
								</td>
								<td class="styTableCellAmtInherit">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$FormData/BatteryCellGrp/UnitsProducedQty"/>
									</xsl:call-template>
								</td>
								<td class="styTableCellAmtInherit" style="border-right-width:0px;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/BatteryCellGrp/CreditAmt"/>
									</xsl:call-template>
								</td>
							</tr>
							<tr style="height:4mm;">
								<td class="styTableCell" style="width:77mm;border-bottom:0mm;">
									<div style="width:77mm;text-align:left;">
										<div class="styLNLeftLtrBox">b</div> 
											Battery module which uses battery cells <span class="sty7207DotLn">....</span>
									</div>
								</td>
								<td class="styTableCellTextInherit" style="text-align:center;">
									$ 10.00
								</td>
								<td class="styTableCellAmtInherit">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$FormData/BatteryModUseBatteryCellGrp/UnitsProducedQty"/>
									</xsl:call-template>
								</td>
								<td class="styTableCellAmtInherit" style="border-right-width:0px;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/BatteryModUseBatteryCellGrp/CreditAmt"/>
									</xsl:call-template>
								</td>
							</tr>
							<tr style="height:4mm;">
								<td class="styTableCell" style="width:77mm;border-bottom:0mm;">
									<div style="width:77mm;text-align:left;">
										<div class="styLNLeftLtrBox">c</div> 
											Battery module which does not use battery cells <span class="sty7207DotLn">..</span>
									</div>
								</td>
								<td class="styTableCellTextInherit" style="text-align:center;border-bottom-width:0px;">
											$ 45.00
										</td>
								<td class="styTableCellAmtInherit" style="border-bottom:0px;">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$FormData/BatteryModNotUseBatteryCellGrp/UnitsProducedQty"/>
									</xsl:call-template>
								</td>
								<td class="styTableCellAmtInherit" style="border-right-width:0px;border-bottom:0px;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/BatteryModNotUseBatteryCellGrp/CreditAmt"/>
									</xsl:call-template>
								</td>
							</tr>
						</tbody>
					</table>
					<!-- Part II - 6 -->
					<div style="width:187mm;height:6mm;text-align:center;border-top:.5px solid black; border-bottom:.5px solid black;">
						<div class="styLNLeftLtrBox" style="font-size:9pt">6</div>
						<span class="styBoldText" style="font-size:10pt;">Critical Minerals</span>
					</div>
					<!-- Part II - Critical Minerals Table -->
					<table class="styTable" style="border-collapse:collapse;font-size:7pt;">
						<thead class="styTableThead">
							<tr style="vertical-align:top;">
								<th class="styTableCellHeader" scope="col" style="width:77mm;">
                                        (a)<br/>Eligible component
                                    </th>
								<th class="styTableCellHeader" scope="col" style="width:30mm;">
                                        (b)<br/>Unit<br/>
								</th>
								<th class="styTableCellHeader" scope="col" style="width:20mm;">
										(c)<br/>Credits per unit
                                    </th>
								<th class="styTableCellHeader" scope="col" style="width:30mm;">
                                        (d)<br/>Line 6a:<br/>
									<span style="font-weight:normal">amount from Part IV, line 74</span>
									<br/>Line 6b:<br/>
									<span style="font-weight:normal">(see instructions)</span>
								</th>
								<th class="styTableCellHeader" scope="col" style="width:32mm;border-right-width:0px;">
                                        (e)<br/>Amount of credit<br/>
									<span style="font-weight:normal">(column (c) multiplied<br/>by column (d))</span>
								</th>
							</tr>
						</thead>
						<tbody>
							<tr style="height:14mm;">
								<td class="styTableCellTextInherit" style="width:77mm;border-bottom:0mm;">
									<div style="width:77mm;padding-top:10mm;">
										<div class="styLNLeftLtrBox">a</div>
											Applicable critical minerals from Part IV<span class="sty7207DotLn">....</span>
									</div>
								</td>
								<td class="styTableCellTextInherit" style="text-align:center;border-bottom:0px;" rowspan="6">
									Costs incurred by taxpayer with respect to the production of such minerals
								</td>
								<td class="styTableCellTextInherit" style="text-align:center;border-bottom-width:0px;">
									10% (0.10)
								</td>
								<td class="styTableCellAmtInherit" style="border-bottom:0px;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/TotalCostsAmt"/>
									</xsl:call-template>
								</td>
								<td class="styTableCellAmtInherit" style="border-right-width:0px;border-bottom:0px;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/ApplcblCriticalMineralsCrAmt"/>
									</xsl:call-template>
								</td>
							</tr>
							<tr style="height:4mm;">
								<td class="styTableCell" style="width:77mm;border-bottom:0mm;">
									<div style="width:77mm;text-align:left;">
										<div class="styLNLeftLtrBox">b</div> 
											Metallurgical coal <span class="sty7207DotLn">...........</span>
									</div>
								</td>
								<td class="styTableCellTextInherit" style="text-align:center;border-bottom-width:0px;border-top-width:1px">
									2.5% (0.025)
								</td>
								<td class="styTableCellAmtInherit" style="border-bottom-width:0px;border-top-width:1px">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/MetallurgicalCoalGrp/TotalCostsAmt"/>
									</xsl:call-template>
								</td>
								<td class="styTableCellAmtInherit" style="border-right-width:0px;border-bottom-width:0px;border-top-width:1px">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/MetallurgicalCoalGrp/CreditAmt"/>
									</xsl:call-template>
								</td>
							</tr>
						</tbody>
					</table>
					<!-- Part II - 7 -->
					<div style="width:187mm;height:6mm;text-align:center;border-top:.5px solid black; border-bottom:.5px solid black;">
						<div class="styLNLeftLtrBox" style="font-size:9pt">7</div>
						<span class="styBoldText" style="font-size:11pt;">Advanced Manufacturing Production Credit From Other Entities</span>
					</div>
					<div class="styStdDiv" style="width:187mm;">
						<div class="styLNDesc" style="width:147mm;padding-left:8.5mm;">
							Advanced manufacturing production credit from partnerships, S corporations, estates, and trusts
						</div>
						<div class="styLNRightNumBox" style="border-bottom:0px;">
							<strong>7</strong>
						</div>
						<div class="styLNAmountBox" style="border-bottom:0px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/AdvncMfrPrdCrOthEntitiesAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Part II - 8 -->
					<div style="width:187mm;height:6mm;text-align:center;border-top:.5px solid black; border-bottom:.5px solid black;">
						<div class="styLNLeftLtrBox" style="font-size:9pt">8</div>
						<span class="styBoldText" style="font-size:11pt;">Advanced Manufacturing Production Credit</span>
					</div>
					<div class="styStdDiv" style="width:187mm;height:18mm;">
						<div class="styLNDesc" style="width:147mm;">
							<div class="styLNLeftLtrBox" style="height:9mm">a</div>
								Add amounts in column (e), lines 1 through 7. Estates and trusts, go to line 8b. 
								Partnerships and S corporations, stop here and report this amount on Schedule K. 
								All others, stop here and report this amount on Form 3800, Part III, line 1b
								<span class="sty7207DotLn">.........................</span>
						</div>
						<div class="styLNRightNumBox" style="height:9mm;">
							<strong>8a</strong>
						</div>
						<div class="styLNAmountBox" style="height:9mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/AdvncManufacturingProdCrAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNDesc" style="width:147mm;">
							<div class="styLNLeftLtrBox" style="">b</div>
								Amount allocated to beneficiaries of the estate or trust (see instructions)
								<span class="sty7207DotLn">...........</span>
						</div>
						<div class="styLNRightNumBox" style="">
							<strong>8b</strong>
						</div>
						<div class="styLNAmountBox" style="">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/EstateOrTrustAllocatedBenefAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNDesc" style="width:147mm">
							<div class="styLNLeftLtrBox" style="">c</div>
								Estates and trusts, subtract line 8b from line 8a. Report this amount on Form 3800, Part III, line 1b.
						</div>
						<div class="styLNRightNumBox" style="border-bottom:0px;height:5mm;">
							<strong>8c</strong>
						</div>
						<div class="styLNAmountBox" style="border-bottom:0px;height:5mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/EstateTrustAdvncMfrProdCrAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<div class="styStdDiv pageEnd" style="border-top:2px solid black;">
						<span style="float:right;">Form <strong>7207</strong> (Rev. 12-2025)</span>
					</div>
					<!-- End of page 2 -->
					<!-- Page 3 -->
					<!-- Header -->
					<div class="styStdDiv" style="border-bottom:1px solid black;">
						Form 7207 (Rev. 12-2025)
						<div style="float:right;">Page <strong>3</strong>
						</div>
					</div>
					<div class="styStdDiv" style="border-bottom:1px solid black;padding-bottom:1mm;">
						<div class="styPartName">Part III</div>
						<div class="styPartDesc" style="width:167mm;height:auto;font-weight:normal;">
							<strong>Related Offshore Wind Vessels</strong>
						</div>
						<div style="border-top:1px solid black;padding-top:.5mm;padding-bottom:1px;">
							Provide information for each produced vessel sold during the current tax year. Attach additional Parts III for additional vessels, if
							necessary. After completing the information for all vessels, total the sales prices and enter on Part II, line 2a, column (d). See
							instructions.
						</div>
						<div style="float:right;">
							<xsl:call-template name="SetDynamicTableToggleButton">
								<xsl:with-param name="TargetNode" select="$FormData/OffshoreWindVesselsGrp"/>
								<xsl:with-param name="containerID" select=" 'Part3Table' "/>
								<xsl:with-param name="headerHeight" select="2"/>
								<xsl:with-param name="containerHeight" select="49"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Part III table -->
					<xsl:variable name="shouldSeparateP3" select="($Print = $Separated) and (count($FormData/OffshoreWindVesselsGrp) &gt; 49)"/>
					<div class="styStdDiv" style="" id="Part3Table">
						<xsl:call-template name="SetInitialState"/>
						<table style="display:table;border-collapse:collapse;">
							<thead class="styTableThead">
								<tr>
									<th class="styTableCellHeader" scope="col" rowspan="2" style="width:10mm;font-weight:normal;height:10mm;"/>
									<th class="styTableCellHeader" scope="col" rowspan="2" style="width:50mm;font-weight:normal;vertical-align:top;padding-top:1mm;">
										<strong>Name of vessel</strong>
									</th>
									<th class="styTableCellHeader" scope="col" rowspan="2" style="width:30mm;font-weight:normal;vertical-align:top;padding-top:1mm;">
										<strong>Purpose of vessel</strong>
									</th>
									<th class="styTableCellHeader" scope="col" rowspan="2" style="width:25mm;font-weight:normal;vertical-align:top;padding-top:1mm;">
										<strong>Official number of vessel</strong>
									</th>
									<th class="styTableCellHeader" scope="col" colspan="2" style="width:25mm;font-weight:normal;">
										<strong>New or retrofitted</strong>
									</th>
									<th class="styTableCellHeader" scope="col" rowspan="2" style="width:25mm;min-width:32mm;font-weight:normal;padding-top:1mm;
										vertical-align:top;border-right-width:0px;">
										<strong>Sales price</strong>
									</th>
								</tr>
								<tr>
									<th class="styTableCellHeader" scope="col" style="width:23mm;font-weight:normal;">
										<strong>New</strong>
									</th>
									<th class="styTableCellHeader" scope="col" style="width:23mm;font-weight:normal;">
										<strong>Retrofitted</strong>
									</th>
								</tr>
							</thead>
							<tbody style="font-size:6pt;">
								<xsl:if test="not($shouldSeparateP3)">
									<xsl:for-each select="$FormData/OffshoreWindVesselsGrp">
										<tr style="height:4mm;vertical-align:bottom;">
											<td class="styTableCellTextInherit">
												<span style="width:4mm;font-weight:bold;padding-bottom:.5mm;
													padding-left:.5mm;vertical-align:top;">
													<xsl:number format="1" value="position()"/>
												</span>
											</td>
											<td class="styTableCellTextInherit">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="VesselNm"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellTextInherit">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="VesselPurposeDesc"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellTextInherit">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="VesselNum"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellCtrInherit">
												<xsl:choose>
													<xsl:when test="NewInd">
														<input class="styCkbox" type="checkbox" alt="New Ind">
															<xsl:call-template name="PopulateCheckbox">
																<xsl:with-param name="TargetNode" select="NewInd"/>
																<xsl:with-param name="BackupName">IRS7207NewInd</xsl:with-param>
															</xsl:call-template>
														</input>
													</xsl:when>
												</xsl:choose>
											</td>
											<td class="styTableCellCtrInherit">
												<xsl:choose>
													<xsl:when test="RetrofittedInd">
														<input class="styCkbox" type="checkbox" alt="Retrofitted Ind">
															<xsl:call-template name="PopulateCheckbox">
																<xsl:with-param name="TargetNode" select="RetrofittedInd"/>
																<xsl:with-param name="BackupName">IRS7207RetrofittedInd</xsl:with-param>
															</xsl:call-template>
														</input>
													</xsl:when>
												</xsl:choose>
											</td>
											<td class="styTableCellAmtInherit" style="border-right-width:0px;">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="SalesPriceAmt"/>
												</xsl:call-template>
											</td>
										</tr>
									</xsl:for-each>
								</xsl:if>
								<xsl:if test="$shouldSeparateP3 or count($FormData/OffshoreWindVesselsGrp) &lt; 49">
									<xsl:call-template name="FillTable7Cols">
										<xsl:with-param name="LineNumber" select="1 + count($FormData/OffshoreWindVesselsGrp)"/>
										<xsl:with-param name="SepMessage" select="$shouldSeparateP3"/>
									</xsl:call-template>
								</xsl:if>
							</tbody>
						</table>
					</div>
					<xsl:if test="not($shouldSeparateP3)">
						<xsl:call-template name="SetInitialDynamicTableHeight">
							<xsl:with-param name="TargetNode" select="$FormData/OffshoreWindVesselsGrp"/>
							<xsl:with-param name="containerID" select=" 'Part3Table' "/>
							<xsl:with-param name="headerHeight" select="2"/>
							<xsl:with-param name="containerHeight" select="49"/>
						</xsl:call-template>
					</xsl:if>
					<div class="styStdDiv" style="border-top:.5px solid black;">
						<div class="styLNDesc" style="height:8mm;font-size:8pt;width:155mm;">
							<Strong>Total of sales prices on lines 1 through 49</Strong>
							<br/>
							Total of all Parts III. Enter here and on Part II, line 2a, column (d)
							<span class="sty7207DotLn">.............</span>
						</div>
						<div class="styLNAmountBoxNBB" style="height:8mm;"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TotalSalesPriceAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Page 3 footer -->
					<div class="styStdDiv pageEnd" style="border-top:2px solid black;">
						<span style="float:right;">Form <strong>7207</strong> (Rev. 12-2025)</span>
					</div>
					<!-- Page 4 -->
					<!-- Header -->
					<div class="styStdDiv" style="border-bottom:2px solid black;">
						Form 7207 (Rev. 12-2025)
						<div style="float:right;">Page <strong>4</strong>
						</div>
					</div>
					<div class="styStdDiv" style="border-bottom:1px solid black;">
						<div class="styPartName">Part IV</div>
						<div class="styPartDesc" style="width:167mm;height:auto;font-weight:normal;">
							<strong>Costs of Producing Applicable Critical Minerals in Current Tax Year</strong>
						</div>
					</div>
					<div class="styStdDiv" style="height:17mm;">
						<div class="styLNDesc" style="padding-top:.5mm;padding-bottom:.5mm;font-size:8pt;width:145mm;">
							For each applicable critical mineral produced and sold by you in the current tax year, enter the costs incurred by
							you with respect to the production of such mineral. See instructions.
						</div>
						<div class="sty7207LNRightDescBox">
							<Strong>Costs incurred</Strong>
							<br/>(by you in the production of applicable critical minerals)
						</div>
					</div>
					<!-- Line 1 -->
					<div style="border-top:1px solid black;height:4mm;">
						<div class="styLNLeftNumBoxSD">1</div>
						<div class="styLNDesc" style="padding-top:.5mm;padding-bottom:.5mm;width:147mm;">
							Aluminum converted from bauxite to a minimum purity of 99% alumina by mass
							<span class="sty7207DotLn">..........</span>
						</div>
						<div class="styLNAmountBox" style="height:4mm;border-top:1px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/AluminumConvertedCostsAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 2 -->
					<div style="height:4mm;">
						<div class="styLNLeftNumBoxSD">2</div>
						<div class="styLNDesc" style="padding-top:.5mm;padding-bottom:.5mm;width:147mm;">
							Aluminum purified to a minimum purity of 99.9% aluminum by mass
							<span class="sty7207DotLn">..............</span>
						</div>
						<div class="styLNAmountBox" style="height:4mm;border-top:1px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/AluminumPurifiedCostsAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 3 -->
					<div style="height:4mm;">
						<div class="styLNLeftNumBoxSD">3</div>
						<div class="styLNDesc" style="padding-top:.5mm;padding-bottom:.5mm;width:147mm;">	
							Antimony converted to antimony trisulfide concentrate with a minimum purity of 90% antimony 
							trisulfide by mass
						</div>
						<div class="styLNAmountBox" style="height:4mm;border-top:1px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/AntimonyConvertedCostsAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 4 -->
					<div style="height:4mm;">
						<div class="styLNLeftNumBoxSD">4</div>
						<div class="styLNDesc" style="padding-top:.5mm;padding-bottom:.5mm;width:147mm;">
							Antimony purified to a minimum purity of 99.65% antimony by mass
							<span class="sty7207DotLn">..............</span>
						</div>
						<div class="styLNAmountBox" style="height:4mm;border-top:1px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/AntimonyPurifiedCostsAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 5 -->
					<div style="height:4mm;">
						<div class="styLNLeftNumBoxSD">5</div>
						<div class="styLNDesc" style="padding-top:.5mm;padding-bottom:.5mm;width:147mm;">
							Arsenic purified to a minimum purity of 99% by mass
							<span class="sty7207DotLn">...................</span>
						</div>
						<div class="styLNAmountBox" style="height:4mm;border-top:1px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/ArsenicPurifiedCostsAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 6 -->
					<div style="height:4mm;">
						<div class="styLNLeftNumBoxSD">6</div>
						<div class="styLNDesc" style="padding-top:.5mm;padding-bottom:.5mm;width:147mm;">
							Barite purified to a minimum purity of 80% barite by mass
							<span class="sty7207DotLn">.................</span>
						</div>
						<div class="styLNAmountBox" style="height:4mm;border-top:1px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/BaritePurifiedCostsAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 7 -->
					<div style="height:4mm;">
						<div class="styLNLeftNumBoxSD">7</div>
						<div class="styLNDesc" style="padding-top:.5mm;padding-bottom:.5mm;width:147mm;">
							Beryllium converted to copper-beryllium master alloy
							<span class="sty7207DotLn">...................</span>
						</div>
						<div class="styLNAmountBox" style="height:4mm;border-top:1px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/BerylliumConvertedCostsAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 8 -->
					<div style="height:4mm;">
						<div class="styLNLeftNumBoxSD">8</div>
						<div class="styLNDesc" style="padding-top:.5mm;padding-bottom:.5mm;width:147mm;">
							Beryllium purified to a minimum purity of 99% beryllium by mass
							<span class="sty7207DotLn">...............</span>
						</div>
						<div class="styLNAmountBox" style="height:4mm;border-top:1px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/BerylliumPurifiedCostsAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 9 -->
					<div style="height:4mm;">
						<div class="styLNLeftNumBoxSD">9</div>
						<div class="styLNDesc" style="padding-top:.5mm;padding-bottom:.5mm;width:147mm;">
							Bismuth purified to a minimum purity of 99% by mass 
							<span class="sty7207DotLn">...................</span>
						</div>
						<div class="styLNAmountBox" style="height:4mm;border-top:1px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/BismuthPurifiedCostsAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 10 -->
					<div style="height:4mm;">
						<div class="styLNLeftNumBox">10</div>
						<div class="styLNDesc" style="padding-top:.5mm;padding-bottom:.5mm;width:147mm;">
							Cerium converted to cerium oxide which is purified to a minimum purity of 99.9% cerium oxide by mass
							<span class="sty7207DotLn">...</span>
						</div>
						<div class="styLNAmountBox" style="height:4mm;border-top:1px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CeriumConvertedCostsAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 11 -->
					<div style="height:4mm;">
						<div class="styLNLeftNumBox">11</div>
						<div class="styLNDesc" style="padding-top:.5mm;padding-bottom:.5mm;width:147mm;">
							Cerium purified to a minimum purity of 99% cerium by mass
							<span class="sty7207DotLn">.................</span>
						</div>
						<div class="styLNAmountBox" style="height:4mm;border-top:1px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CeriumPurifiedCostsAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 12 -->
					<div style="height:4mm;">
						<div class="styLNLeftNumBox">12</div>
						<div class="styLNDesc" style="padding-top:.5mm;padding-bottom:.5mm;width:147mm;">
							Cesium converted to cesium formate or cesium carbonate
							<span class="sty7207DotLn">..................</span>
						</div>
						<div class="styLNAmountBox" style="height:4mm;border-top:1px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CesiumConvertedCostsAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 13 -->
					<div style="height:4mm;">
						<div class="styLNLeftNumBox">13</div>
						<div class="styLNDesc" style="padding-top:.5mm;padding-bottom:.5mm;width:147mm;">
							Cesium purified to a minimum purity of 99% cesium by mass
							<span class="sty7207DotLn">................</span>
						</div>
						<div class="styLNAmountBox" style="height:4mm;border-top:1px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CesiumPurifiedCostsAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 14 -->
					<div style="height:4mm;">
						<div class="styLNLeftNumBox">14</div>
						<div class="styLNDesc" style="padding-top:.5mm;padding-bottom:.5mm;width:147mm;">
							Chromium converted to ferrochromium consisting of not less than 60% chromium by mass
							<span class="sty7207DotLn">.......</span>
						</div>
						<div class="styLNAmountBox" style="height:4mm;border-top:1px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/ChromiumConvertedCostsAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 15 -->
					<div style="height:4mm;">
						<div class="styLNLeftNumBox">15</div>
						<div class="styLNDesc" style="padding-top:.5mm;padding-bottom:.5mm;width:147mm;">
							Chromium purified to a minimum purity of 99% chromium by mass
							<span class="sty7207DotLn">...............</span>
						</div>
						<div class="styLNAmountBox" style="height:4mm;border-top:1px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/ChromiumPurifiedCostsAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 16 -->
					<div style="height:4mm;">
						<div class="styLNLeftNumBox">16</div>
						<div class="styLNDesc" style="padding-top:.5mm;padding-bottom:.5mm;width:147mm;">
							Cobalt converted to cobalt sulfate
							<span class="sty7207DotLn">.........................</span>
						</div>
						<div class="styLNAmountBox" style="height:4mm;border-top:1px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CobaltConvertedCostsAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 17 -->
					<div style="height:4mm;">
						<div class="styLNLeftNumBox">17</div>
						<div class="styLNDesc" style="padding-top:.5mm;padding-bottom:.5mm;width:147mm;">
							Cobalt purified to a minimum purity of 99.6% cobalt by mass
							<span class="sty7207DotLn">................</span>
						</div>
						<div class="styLNAmountBox" style="height:4mm;border-top:1px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CobaltPurifiedCostsAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 18 -->
					<div style="height:4mm;">
						<div class="styLNLeftNumBox">18</div>
						<div class="styLNDesc" style="padding-top:.5mm;padding-bottom:.5mm;width:147mm;">
							Dysprosium converted to not less than 99% pure dysprosium iron alloy by mass 
							<span class="sty7207DotLn">...........</span>
						</div>
						<div class="styLNAmountBox" style="height:4mm;border-top:1px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/DysprosiumConvertedCostsAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 19 -->
					<div style="height:4mm;">
						<div class="styLNLeftNumBox">19</div>
						<div class="styLNDesc" style="padding-top:.5mm;padding-bottom:.5mm;width:147mm;">
							Dysprosium purified to a minimum purity of 99% dysprosium by mass 
							<span class="sty7207DotLn">..............</span>
						</div>
						<div class="styLNAmountBox" style="height:4mm;border-top:1px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/DysprosiumPurifiedCostsAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 20 -->
					<div style="height:4mm;">
						<div class="styLNLeftNumBox">20</div>
						<div class="styLNDesc" style="padding-top:.5mm;padding-bottom:.5mm;width:147mm;">
							Erbium purified to a minimum purity of 99% by mass
							<span class="sty7207DotLn">...................</span>
						</div>
						<div class="styLNAmountBox" style="height:4mm;border-top:1px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/ErbiumPurifiedCostsAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 21 -->
					<div style="height:4mm;">
						<div class="styLNLeftNumBox">21</div>
						<div class="styLNDesc" style="padding-top:.5mm;padding-bottom:.5mm;width:147mm;">
							Europium converted to europium oxide which is purified to a minimum purity of 99.9% europium oxide by mass
						</div>
						<div class="styLNAmountBox" style="height:4mm;border-top:1px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/EuropiumConvertedCostsAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 22 -->
					<div style="height:4mm;">
						<div class="styLNLeftNumBox">22</div>
						<div class="styLNDesc" style="padding-top:.5mm;padding-bottom:.5mm;width:147mm;">
							Europium purified to a minimum purity of 99% by mass
							<span class="sty7207DotLn">...................</span>
						</div>
						<div class="styLNAmountBox" style="height:4mm;border-top:1px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/EuropiumPurifiedCostsAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 23 -->
					<div style="height:4mm;">
						<div class="styLNLeftNumBox">23</div>
						<div class="styLNDesc" style="padding-top:.5mm;padding-bottom:.5mm;width:147mm;">
							Fluorspar converted to fluorspar which is purified to a minimum purity of 97% calcium fluoride by mass
							<span class="sty7207DotLn">....</span>
						</div>
						<div class="styLNAmountBox" style="height:4mm;border-top:1px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/FluorsparConvertedCostsAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 24 -->
					<div style="height:4mm;">
						<div class="styLNLeftNumBox">24</div>
						<div class="styLNDesc" style="padding-top:.5mm;padding-bottom:.5mm;width:147mm;">
							Fluorspar purified to a minimum purity of 99% fluorspar by mass
							<span class="sty7207DotLn">................</span>
						</div>
						<div class="styLNAmountBox" style="height:4mm;border-top:1px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/FluorsparPurifiedCostsAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 25 -->
					<div style="height:4mm;">
						<div class="styLNLeftNumBox">25</div>
						<div class="styLNDesc" style="padding-top:.5mm;padding-bottom:.5mm;width:147mm;">
							Gadolinium converted to gadolinium oxide which is purified to a minimum purity of 99.9% gadolinium oxide by mass
						</div>
						<div class="styLNAmountBox" style="height:4mm;border-top:1px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/GadoliniumConvertedCostsAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 26 -->
					<div style="height:4mm;">
						<div class="styLNLeftNumBox">26</div>
						<div class="styLNDesc" style="padding-top:.5mm;padding-bottom:.5mm;width:147mm;">
							Gadolinium purified to a minimum purity of 99.9% gadolinium by mass
							<span class="sty7207DotLn">..............</span>
						</div>
						<div class="styLNAmountBox" style="height:4mm;border-top:1px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/GadoliniumPurifiedCostsAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 27 -->
					<div style="height:4mm;">
						<div class="styLNLeftNumBox">27</div>
						<div class="styLNDesc" style="padding-top:.5mm;padding-bottom:.5mm;width:147mm;">
							Gallium purified to a minimum purity of 99% by mass
							<span class="sty7207DotLn">...................</span>
						</div>
						<div class="styLNAmountBox" style="height:4mm;border-top:1px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/GalliumPurifiedCostsAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 28 -->
					<div style="height:4mm;">
						<div class="styLNLeftNumBox">28</div>
						<div class="styLNDesc" style="padding-top:.5mm;padding-bottom:.5mm;width:147mm;">
							Germanium converted to germanium tetrachloride
							<span class="sty7207DotLn">....................</span>
						</div>
						<div class="styLNAmountBox" style="height:4mm;border-top:1px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/GermaniumConvertedCostsAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 29 -->
					<div style="height:4mm;">
						<div class="styLNLeftNumBox">29</div>
						<div class="styLNDesc" style="padding-top:.5mm;padding-bottom:.5mm;width:147mm;">
							Germanium purified to a minimum purity of 99.99% germanium by mass
							<span class="sty7207DotLn">.............</span>
						</div>
						<div class="styLNAmountBox" style="height:4mm;border-top:1px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/GermaniumPurifiedCostsAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 30 -->
					<div style="height:4mm;">
						<div class="styLNLeftNumBox">30</div>
						<div class="styLNDesc" style="padding-top:.5mm;padding-bottom:.5mm;width:147mm;">
							Graphite purified to a minimum purity of 99.9% graphitic carbon by mass
							<span class="sty7207DotLn">.............</span>
						</div>
						<div class="styLNAmountBox" style="height:4mm;border-top:1px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/GraphitePurifiedCostsAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 31 -->
					<div style="height:4mm;">
						<div class="styLNLeftNumBox">31</div>
						<div class="styLNDesc" style="padding-top:.5mm;padding-bottom:.5mm;width:147mm;">
							Hafnium purified to a minimum purity of 99% by mass
							<span class="sty7207DotLn">...................</span>
						</div>
						<div class="styLNAmountBox" style="height:4mm;border-top:1px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/HafniumPurifiedCostsAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 32 -->
					<div style="height:4mm;">
						<div class="styLNLeftNumBox">32</div>
						<div class="styLNDesc" style="padding-top:.5mm;padding-bottom:.5mm;width:147mm;">
							Holmium purified to a minimum purity of 99% by mass
							<span class="sty7207DotLn">...................</span>
						</div>
						<div class="styLNAmountBox" style="height:4mm;border-top:1px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/HolmiumPurifiedCostsAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 33 -->
					<div style="height:4mm;">
						<div class="styLNLeftNumBox">33</div>
						<div class="styLNDesc" style="padding-top:.5mm;padding-bottom:.5mm;width:147mm;">
							Indium converted to indium tin oxide
							<span class="sty7207DotLn">........................</span>
						</div>
						<div class="styLNAmountBox" style="height:4mm;border-top:1px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/IndiumConvertedCostsAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 34 -->
					<div style="height:4mm;">
						<div class="styLNLeftNumBox">34</div>
						<div class="styLNDesc" style="padding-top:.5mm;padding-bottom:.5mm;width:147mm;">
							Indium converted to indium oxide which is purified to a minimum purity of 99.9% indium oxide by mass
							<span class="sty7207DotLn">...</span>
						</div>
						<div class="styLNAmountBox" style="height:4mm;border-top:1px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/IndiumCnvrtIndiumOxideCostsAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 35 -->
					<div style="height:4mm;">
						<div class="styLNLeftNumBox">35</div>
						<div class="styLNDesc" style="padding-top:.5mm;padding-bottom:.5mm;width:147mm;">
							Indium purified to a minimum purity of 99% indium by mass
							<span class="sty7207DotLn">.................</span>
						</div>
						<div class="styLNAmountBox" style="height:4mm;border-top:1px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/IndiumPurifiedCostsAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 36 -->
					<div style="height:4mm;">
						<div class="styLNLeftNumBox">36</div>
						<div class="styLNDesc" style="padding-top:.5mm;padding-bottom:.5mm;width:147mm;">
							Iridium purified to a minimum purity of 99% by mass
							<span class="sty7207DotLn">...................</span>
						</div>
						<div class="styLNAmountBox" style="height:4mm;border-top:1px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/IridiumPurifiedCostsAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 37 -->
					<div style="height:4mm;">
						<div class="styLNLeftNumBox">37</div>
						<div class="styLNDesc" style="padding-top:.5mm;padding-bottom:.5mm;width:147mm;">
							Lanthanum purified to a minimum purity of 99% by mass
							<span class="sty7207DotLn">..................</span>
						</div>
						<div class="styLNAmountBox" style="height:4mm;border-top:1px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/LanthanumPurifiedCostsAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 38 -->
					<div style="height:4mm;">
						<div class="styLNLeftNumBox">38</div>
						<div class="styLNDesc" style="padding-top:.5mm;padding-bottom:.5mm;width:147mm;">
							Lithium converted to lithium carbonate or lithium hydroxide
							<span class="sty7207DotLn">.................</span>
						</div>
						<div class="styLNAmountBox" style="height:4mm;border-top:1px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/LithiumConvertedCostsAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 39 -->
					<div style="height:4mm;">
						<div class="styLNLeftNumBox">39</div>
						<div class="styLNDesc" style="padding-top:.5mm;padding-bottom:.5mm;width:147mm;">
							Lithium purified to a minimum purity of 99.9% lithium by mass
							<span class="sty7207DotLn">................</span>
						</div>
						<div class="styLNAmountBox" style="height:4mm;border-top:1px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/LithiumPurifiedCostsAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 40 -->
					<div style="height:4mm;">
						<div class="styLNLeftNumBox">40</div>
						<div class="styLNDesc" style="padding-top:.5mm;padding-bottom:.5mm;width:147mm;">
							Lutetium purified to a minimum purity of 99% by mass
							<span class="sty7207DotLn">...................</span>
						</div>
						<div class="styLNAmountBox" style="height:4mm;border-top:1px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/LutetiumPurifiedCostsAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 41 -->
					<div style="height:4mm;">
						<div class="styLNLeftNumBox">41</div>
						<div class="styLNDesc" style="padding-top:.5mm;padding-bottom:.5mm;width:147mm;">
							Magnesium purified to a minimum purity of 99% by mass
							<span class="sty7207DotLn">..................</span>
						</div>
						<div class="styLNAmountBox" style="height:4mm;border-top:1px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/MagnesiumPurifiedCostsAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 42 -->
					<div style="height:4mm;">
						<div class="styLNLeftNumBox">42</div>
						<div class="styLNDesc" style="padding-top:.5mm;padding-bottom:.5mm;width:147mm;">
							Manganese converted to manganese sulphate
							<span class="sty7207DotLn">......................</span>
						</div>
						<div class="styLNAmountBox" style="height:4mm;border-top:1px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/ManganeseConvertedCostsAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 43 -->
					<div style="height:4mm;">
						<div class="styLNLeftNumBox">43</div>
						<div class="styLNDesc" style="padding-top:.5mm;padding-bottom:.5mm;width:147mm;">
							Manganese purified to a minimum purity of 99.7% manganese by mass
							<span class="sty7207DotLn">.............</span>
						</div>
						<div class="styLNAmountBox" style="height:4mm;border-top:1px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/ManganesePurifiedCostsAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 44 -->
					<div style="height:7mm;">
						<div class="styLNLeftNumBox">44</div>
						<div class="styLNDesc" style="padding-top:.5mm;padding-bottom:.5mm;width:147mm;">
							Neodymium converted to neodymium-praseodymium oxide which is purified to a minimum purity of 99%
							neodymium-praseodymium oxide by mass
							<span class="sty7207DotLn">.......................</span>
						</div>
						<div class="styLNAmountBox" style="height:7mm;border-top:1px;">
							<br/>
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/NeodymiumConvertedCostAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 45 -->
					<div style="height:7mm;">
						<div class="styLNLeftNumBox">45</div>
						<div class="styLNDesc" style="padding-top:.5mm;padding-bottom:.5mm;width:147mm;">
							Neodymium converted to neodymium oxide which is purified to a minimum purity of 99.5% neodymium
							oxide by mass
							<span class="sty7207DotLn">..................................</span>
						</div>
						<div class="styLNAmountBox" style="height:7mm;border-top:1px;">
							<br/>
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/NeodymiumCnvrtNeodymiumOxdAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 46 -->
					<div style="height:4mm;">
						<div class="styLNLeftNumBox">46</div>
						<div class="styLNDesc" style="padding-top:.5mm;padding-bottom:.5mm;width:147mm;">
							Neodymiun purified to a minimum purity of 99.9% neodymium by mass
							<span class="sty7207DotLn">.............</span>
						</div>
						<div class="styLNAmountBox" style="height:4mm;border-top:1px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/NeodymiumPurifiedCostsAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 47 -->
					<div style="height:4mm;">
						<div class="styLNLeftNumBox">47</div>
						<div class="styLNDesc" style="padding-top:.5mm;padding-bottom:.5mm;width:147mm;">
							Nickel converted to nickel sulphate
							<span class="sty7207DotLn">.........................</span>
						</div>
						<div class="styLNAmountBox" style="height:4mm;border-top:1px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/NickelConvertedCostsAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 48 -->
					<div style="height:4mm;">
						<div class="styLNLeftNumBox">48</div>
						<div class="styLNDesc" style="padding-top:.5mm;padding-bottom:.5mm;width:147mm;">
							Nickel purified to a minimum purity of 99% nickel by mass
							<span class="sty7207DotLn">.................</span>
						</div>
						<div class="styLNAmountBox" style="height:4mm;border-top:1px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/NickelPurifiedCostsAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 49 -->
					<div style="height:4mm;">
						<div class="styLNLeftNumBox">49</div>
						<div class="styLNDesc" style="padding-top:.5mm;padding-bottom:.5mm;width:147mm;">
							Niobium converted to ferronibium
							<span class="sty7207DotLn">.........................</span>
						</div>
						<div class="styLNAmountBox" style="height:4mm;border-top:1px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/NiobiumConvertedCostsAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 50 -->
					<div style="height:4mm;">
						<div class="styLNLeftNumBox">50</div>
						<div class="styLNDesc" style="padding-top:.5mm;padding-bottom:.5mm;width:147mm;">
							Niobium purified to a minimum purity of 99% niobium by mass
							<span class="sty7207DotLn">................</span>
						</div>
						<div class="styLNAmountBox" style="height:4mm;border-top:1px;border-bottom-width:0px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/NiobiumPurifiedCostsAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Page 4 footer -->
					<div class="styStdDiv pageEnd" style="border-top:2px solid black;">
						<span style="float:right;">Form <strong>7207</strong> (Rev. 12-2025)</span>
					</div>
					<!-- Page 5 -->
					<!-- Header -->
					<div class="styStdDiv" style="border-bottom:2px solid black;">
						Form 7207 (Rev. 12-2025)
						<div style="float:right;">Page <strong>5</strong>
						</div>
					</div>
					<div class="styStdDiv" style="border-bottom:1px solid black;">
						<div class="styPartName">Part IV</div>
						<div class="styPartDesc" style="width:167mm;height:auto;font-weight:normal;">
							<strong>Costs of Producing Applicable Critical Minerals in Current Tax Year</strong>&nbsp;<i>(continued)</i>
						</div>
					</div>
					<div class="styStdDiv" style="height:17mm;">
						<div class="styLNDesc" style="padding-top:.5mm;padding-bottom:.5mm;font-size:8pt;width:145mm;">
							For each applicable critical mineral produced and sold by you in the current tax year, enter the costs incurred by
							you with respect to the production of such mineral. See instructions.
						</div>
						<div class="sty7207LNRightDescBox">
							<Strong>Costs incurred</Strong>
							<br/>(by you in the production of applicable critical minerals)
						</div>
					</div>
					<!-- Line 51 -->
					<div style="border-top:1px solid black;height:4mm;">
						<div class="styLNLeftNumBox">51</div>
						<div class="styLNDesc" style="padding-top:.5mm;padding-bottom:.5mm;width:147mm;">
							Palladium purified to a minimum purity of 99% by mass
							<span class="sty7207DotLn">..................</span>
						</div>
						<div class="styLNAmountBox" style="height:4mm;border-top:1px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/PalladiumPurifiedCostsAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 52 -->
					<div style="height:4mm;">
						<div class="styLNLeftNumBox">52</div>
						<div class="styLNDesc" style="padding-top:.5mm;padding-bottom:.5mm;width:147mm;">
							Platinum purified to a minimum purity of 99% by mass
							<span class="sty7207DotLn">...................</span>
						</div>
						<div class="styLNAmountBox" style="height:4mm;border-top:1px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/PlatinumPurifiedCostsAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 53 -->
					<div style="height:4mm;">
						<div class="styLNLeftNumBox">53</div>
						<div class="styLNDesc" style="padding-top:.5mm;padding-bottom:.5mm;width:147mm;">
							Praseodymium purified to a minimum purity of 99% by mass
							<span class="sty7207DotLn">.................</span>
						</div>
						<div class="styLNAmountBox" style="height:4mm;border-top:1px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/PraseodymiumPurifiedCostsAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 54 -->
					<div style="height:4mm;">
						<div class="styLNLeftNumBox">54</div>
						<div class="styLNDesc" style="padding-top:.5mm;padding-bottom:.5mm;width:147mm;">
							Rhodium purified to a minimum purity of 99% by mass
							<span class="sty7207DotLn">...................</span>
						</div>
						<div class="styLNAmountBox" style="height:4mm;border-top:1px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/RhodiumPurifiedCostsAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 55 -->
					<div style="height:4mm;">
						<div class="styLNLeftNumBox">55</div>
						<div class="styLNDesc" style="padding-top:.5mm;padding-bottom:.5mm;width:147mm;">
							Rubidium purified to a minimum purity of 99% by mass
							<span class="sty7207DotLn">..................</span>
						</div>
						<div class="styLNAmountBox" style="height:4mm;border-top:1px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/RubidiumPurifiedCostsAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 56 -->
					<div style="height:4mm;">
						<div class="styLNLeftNumBox">56</div>
						<div class="styLNDesc" style="padding-top:.5mm;padding-bottom:.5mm;width:147mm;">
							Ruthenium purified to a minimum purity of 99% by mass
							<span class="sty7207DotLn">..................</span>
						</div>
						<div class="styLNAmountBox" style="height:4mm;border-top:1px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/RutheniumPurifiedCostsAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 57 -->
					<div style="height:4mm;">
						<div class="styLNLeftNumBox">57</div>
						<div class="styLNDesc" style="padding-top:.5mm;padding-bottom:.5mm;width:147mm;">
							Samarium purified to a minimum purity of 99% by mass
							<span class="sty7207DotLn">..................</span>
						</div>
						<div class="styLNAmountBox" style="height:4mm;border-top:1px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/SamariumPurifiedCostsAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 58 -->
					<div style="height:4mm;">
						<div class="styLNLeftNumBox">58</div>
						<div class="styLNDesc" style="padding-top:.5mm;padding-bottom:.5mm;width:147mm;">
							Scandium purified to a minimum purity of 99% by mass
							<span class="sty7207DotLn">..................</span>
						</div>
						<div class="styLNAmountBox" style="height:4mm;border-top:1px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/ScandiumPurifiedCostsAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 59 -->
					<div style="height:4mm;">
						<div class="styLNLeftNumBox">59</div>
						<div class="styLNDesc" style="padding-top:.5mm;padding-bottom:.5mm;width:147mm;">
							Tantalum purified to a minimum purity of 99% by mass
							<span class="sty7207DotLn">..................</span>
						</div>
						<div class="styLNAmountBox" style="height:4mm;border-top:1px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TantalumPurifiedCostsAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 60 -->
					<div style="height:4mm;">
						<div class="styLNLeftNumBox">60</div>
						<div class="styLNDesc" style="padding-top:.5mm;padding-bottom:.5mm;width:147mm;">
							Tellurium converted to cadmium telluride
							<span class="sty7207DotLn">.......................</span>
						</div>
						<div class="styLNAmountBox" style="height:4mm;border-top:1px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TelluriumConvertedCostsAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 61 -->
					<div style="height:4mm;">
						<div class="styLNLeftNumBox">61</div>
						<div class="styLNDesc" style="padding-top:.5mm;padding-bottom:.5mm;width:147mm;">
							Tellurium purified to a minimum purity of 99% tellurium by mass 
							<span class="sty7207DotLn">................</span>
						</div>
						<div class="styLNAmountBox" style="height:4mm;border-top:1px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TelluriumPurifiedCostsAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 62 -->
					<div style="height:4mm;">
						<div class="styLNLeftNumBox">62</div>
						<div class="styLNDesc" style="padding-top:.5mm;padding-bottom:.5mm;width:147mm;">
							Terbium purified to a minimum purity of 99% by mass
							<span class="sty7207DotLn">...................</span>
						</div>
						<div class="styLNAmountBox" style="height:4mm;border-top:1px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TerbiumPurifiedCostsAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 63 -->
					<div style="height:4mm;">
						<div class="styLNLeftNumBox">63</div>
						<div class="styLNDesc" style="padding-top:.5mm;padding-bottom:.5mm;width:147mm;">
							Thulium purified to a minimum purity of 99% by mass
							<span class="sty7207DotLn">...................</span>
						</div>
						<div class="styLNAmountBox" style="height:4mm;border-top:1px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/ThuliumPurifiedCostsAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 64 -->
					<div style="height:4mm;">
						<div class="styLNLeftNumBox">64</div>
						<div class="styLNDesc" style="padding-top:.5mm;padding-bottom:.5mm;width:147mm;">
							Tin purified to a low alpha emitting tin which has a purity of greater than 99.99% by mass
							<span class="sty7207DotLn">........</span>
						</div>
						<div class="styLNAmountBox" style="height:4mm;border-top:1px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TinPurifiedCostsAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 65 -->
					<div style="height:7mm;">
						<div class="styLNLeftNumBox">65</div>
						<div class="styLNDesc" style="padding-top:.5mm;padding-bottom:.5mm;width:147mm;">
							Tin purified to a low alpha emitting tin which possesses an alpha emission rate of not greater than 0.01 counts per hour per centimeter square
							<span class="sty7207DotLn">...........................</span>
						</div>
						<div class="styLNAmountBox" style="height:7mm;border-top:1px;">
						<br/>
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TinPurifiedAlphaEmsnRtCostsAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 66 -->
					<div style="height:4mm;">
						<div class="styLNLeftNumBox">66</div>
						<div class="styLNDesc" style="padding-top:.5mm;padding-bottom:.5mm;width:147mm;">
							Titanium purified to a minimum purity of 99% by mass
							<span class="sty7207DotLn">...................</span>
						</div>
						<div class="styLNAmountBox" style="height:4mm;border-top:1px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TitaniumPurifiedCostsAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 67 -->
					<div style="height:4mm;">
						<div class="styLNLeftNumBox">67</div>
						<div class="styLNDesc" style="padding-top:.5mm;padding-bottom:.5mm;width:147mm;">
							Tungsten converted to ammonium paratungstate or ferrotungsten
							<span class="sty7207DotLn">...............</span>
						</div>
						<div class="styLNAmountBox" style="height:4mm;border-top:1px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TungstenConvertedCostsAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 68 -->
					<div style="height:4mm;">
						<div class="styLNLeftNumBox">68</div>
						<div class="styLNDesc" style="padding-top:.5mm;padding-bottom:.5mm;width:147mm;">
							Vanadium converted to ferrovanadium or vanadium pentoxide
							<span class="sty7207DotLn">................</span>
						</div>
						<div class="styLNAmountBox" style="height:4mm;border-top:1px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/VanadiumConvertedCostsAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 69 -->
					<div style="height:4mm;">
						<div class="styLNLeftNumBox">69</div>
						<div class="styLNDesc" style="padding-top:.5mm;padding-bottom:.5mm;width:147mm;">
							Ytterbium purified to a minimum purity of 99% by mass
							<span class="sty7207DotLn">..................</span>
						</div>
						<div class="styLNAmountBox" style="height:4mm;border-top:1px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/YtterbiumPurifiedCostsAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 70 -->
					<div style="height:4mm;">
						<div class="styLNLeftNumBox">70</div>
						<div class="styLNDesc" style="padding-top:.5mm;padding-bottom:.5mm;width:147mm;">
							Yttrium converted to yttrium oxide which is purified to a minimum purity of 99.999% yttrium oxide by mass
							<span class="sty7207DotLn">..</span>
						</div>
						<div class="styLNAmountBox" style="height:4mm;border-top:1px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/YttriumConvertedCostsAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 71 -->
					<div style="height:4mm;">
						<div class="styLNLeftNumBox">71</div>
						<div class="styLNDesc" style="padding-top:.5mm;padding-bottom:.5mm;width:147mm;">
							Yttrium purified to a minimum purity of 99.9% yttrium by mass
							<span class="sty7207DotLn">................</span>
						</div>
						<div class="styLNAmountBox" style="height:4mm;border-top:1px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/YttriumPurifiedCostsAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 72 -->
					<div style="height:4mm;">
						<div class="styLNLeftNumBox">72</div>
						<div class="styLNDesc" style="padding-top:.5mm;padding-bottom:.5mm;width:147mm;">
							Zinc purified to a minimum purity of 99% by mass
							<span class="sty7207DotLn">....................</span>
						</div>
						<div class="styLNAmountBox" style="height:4mm;border-top:1px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/ZincPurifiedCostsAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 73 -->
					<div style="height:4mm;">
						<div class="styLNLeftNumBox">73</div>
						<div class="styLNDesc" style="padding-top:.5mm;padding-bottom:.5mm;width:147mm;">
							Zirconium purified to a minimum purity of 99% by mass
							<span class="sty7207DotLn">..................</span>
						</div>
						<div class="styLNAmountBox" style="height:4mm;border-top:1px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/ZirconiumPurifiedCostsAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 74 -->
					<div style="height:4mm;">
						<div class="styLNLeftNumBox">74</div>
						<div class="styLNDesc" style="padding-top:.5mm;padding-bottom:.5mm;width:147mm;">
							<strong>Total costs.</strong> Enter here and on Part II, line 6a, column (d)
							<span class="sty7207DotLn">.................</span>
						</div>
						<div class="styLNAmountBox" style="height:4mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TotalCostsAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Page 5 footer -->
					<div class="styStdDiv pageEnd" style="border-top:2px solid black;">
						<span style="float:right;">Form <strong>7207</strong> (Rev. 12-2025)</span>
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
					<!-- Page 3 separated table -->
					<xsl:if test="$shouldSeparateP3">
						<br/>
						<br/>
						<span class="styRepeatingDataTitle"/>
						<table style="display:table;border-collapse:collapse;">
							<thead class="styTableThead">
								<tr class="styDepTblHdr">
									<th class="styTableCellHeader" scope="col" rowspan="2" style="width:10mm;font-weight:normal;height:10mm;"/>
									<th class="styTableCellHeader" scope="col" rowspan="2" style="width:50mm;font-weight:normal;vertical-align:top;padding-top:1mm;">
										<strong>Name of vessel</strong>
									</th>
									<th class="styTableCellHeader" scope="col" rowspan="2" style="width:30mm;font-weight:normal;vertical-align:top;padding-top:1mm;">
										<strong>Purpose of vessel</strong>
									</th>
									<th class="styTableCellHeader" scope="col" rowspan="2" style="width:25mm;font-weight:normal;vertical-align:top;padding-top:1mm;">
										<strong>Official number of vessel</strong>
									</th>
									<th class="styTableCellHeader" scope="col" colspan="2" style="width:25mm;font-weight:normal;">
										<strong>New or retrofitted</strong>
									</th>
									<th class="styTableCellHeader" scope="col" rowspan="2" style="width:25mm;min-width:32mm;font-weight:normal;padding-top:1mm;
										vertical-align:top;border-right-width:0px;">
										<strong>Sales price</strong>
									</th>
								</tr>
								<tr class="styDepTblHdr">
									<th class="styTableCellHeader" scope="col" style="width:23mm;font-weight:normal;">
										<strong>New</strong>
									</th>
									<th class="styTableCellHeader" scope="col" style="width:23mm;font-weight:normal;">
										<strong>Retrofitted</strong>
									</th>
								</tr>
							</thead>
							<tbody style="font-size:6pt;">
								<xsl:for-each select="$FormData/OffshoreWindVesselsGrp">
									<tr style="height:4.5mm;vertical-align:bottom;">
										<xsl:attribute name="class">
											<xsl:choose>
												<xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when>
												<xsl:otherwise>styDepTblRow2</xsl:otherwise>
											</xsl:choose>
										</xsl:attribute>
										<td class="styTableCellTextInherit">
											<span style="width:4mm;font-weight:bold;padding-bottom:0mm;
												padding-left:1mm;vertical-align:top;">
												<xsl:number format="1" value="position()"/>
											</span>
										</td>
										<td class="styTableCellCtrInherit">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="VesselNm"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellTextInherit">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="VesselPurposeDesc"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellTextInherit">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="VesselNum"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellCtrInherit">
											<xsl:choose>
												<xsl:when test="NewInd">
													<input class="styCkbox" type="checkbox" alt="New Ind">
														<xsl:call-template name="PopulateCheckbox">
															<xsl:with-param name="TargetNode" select="NewInd"/>
															<xsl:with-param name="BackupName">IRS7207NewInd</xsl:with-param>
														</xsl:call-template>
													</input>
												</xsl:when>
											</xsl:choose>
										</td>
										<td class="styTableCellCtrInherit">
											<xsl:choose>
												<xsl:when test="RetrofittedInd">
													<input class="styCkbox" type="checkbox" alt="Retrofitted Ind">
														<xsl:call-template name="PopulateCheckbox">
															<xsl:with-param name="TargetNode" select="RetrofittedInd"/>
															<xsl:with-param name="BackupName">IRS7207RetrofittedInd
															</xsl:with-param>
														</xsl:call-template>
													</input>
												</xsl:when>
											</xsl:choose>
										</td>
										<td class="styTableCellTextInherit" style="border-right-width:0px;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="SalesPriceAmt"/>
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
	<!-- FillTable7Cols -->
	<xsl:template name="FillTable7Cols">
		<xsl:param name="LineNumber"/>
		<xsl:param name="SepMessage" select="false()"/>
		<xsl:param name="MaxLine" select="49"/>
		<xsl:param name="RowID" select="true()"/>
		<tr style="height:4.5mm;">
			<td class="styTableCellCtrInherit" style="width:6mm;font-weight:bold;padding-right:3mm;">
				<xsl:choose>
					<xsl:when test="not($RowID)">&nbsp;</xsl:when>
					<xsl:when test="$SepMessage">1</xsl:when>
					<xsl:otherwise>
						<xsl:number value="$LineNumber" format="1"/>
					</xsl:otherwise>
				</xsl:choose>
			</td>
			<td class="styTableCellTextInherit">
				<xsl:choose>
					<xsl:when test="$SepMessage">
						See Additional <br/> Data Table
					</xsl:when>
					<xsl:otherwise>&nbsp;</xsl:otherwise>
				</xsl:choose>
			</td>
			<td class="styTableCellTextInherit">&nbsp;</td>
			<td class="styTableCellTextInherit">&nbsp;</td>
			<td class="styTableCellCtrInherit">
				<xsl:choose>
					<xsl:when test="NewInd">
						<input class="styCkbox" type="checkbox" alt="New Ind">
							<xsl:call-template name="PopulateCheckbox">
								<xsl:with-param name="TargetNode" select="NewInd"/>
								<xsl:with-param name="BackupName">IRS7207NewInd</xsl:with-param>
							</xsl:call-template>
						</input>
					</xsl:when>
				</xsl:choose>
			</td>
			<td class="styTableCellCtrInherit">
				<xsl:choose>
					<xsl:when test="RetrofittedInd">
						<input class="styCkbox" type="checkbox" alt="Retrofitted Ind">
							<xsl:call-template name="PopulateCheckbox">
								<xsl:with-param name="TargetNode" select="RetrofittedInd"/>
								<xsl:with-param name="BackupName">IRS7207RetrofittedInd</xsl:with-param>
							</xsl:call-template>
						</input>
					</xsl:when>
				</xsl:choose>
			</td>
			<td class="styTableCellAmtInherit" style="border-right-width:0px;">&nbsp;</td>
		</tr>
		<xsl:choose>
			<xsl:when test="$SepMessage">
				<xsl:call-template name="FillTable7Cols">
					<xsl:with-param name="LineNumber" select="2"/>
					<xsl:with-param name="SepMessage" select="false()"/>
					<xsl:with-param name="MaxLine" select="$MaxLine"/>
					<xsl:with-param name="RowID" select="$RowID"/>
				</xsl:call-template>
			</xsl:when>
			<xsl:when test="$LineNumber &lt; $MaxLine">
				<xsl:call-template name="FillTable7Cols">
					<xsl:with-param name="LineNumber" select="$LineNumber + 1"/>
					<xsl:with-param name="MaxLine" select="$MaxLine"/>
					<xsl:with-param name="RowID" select="$RowID"/>
				</xsl:call-template>
			</xsl:when>
			<xsl:otherwise/>
		</xsl:choose>
	</xsl:template>
</xsl:stylesheet>