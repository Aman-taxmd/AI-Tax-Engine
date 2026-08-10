<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE xsl:stylesheet [
  <!ENTITY nbsp "&#160;">
  <!ENTITY mdash "&#8212;">
]>
	<!-- 04/21/2025 - 999120 - AJH -->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:include href="PopulateTemplate.xsl" />
	<xsl:include href="AddHeader.xsl" />
	<xsl:include href="CommonPathRef.xsl" />
	<xsl:include href="AddOnTable.xsl" />
	<xsl:include href="IRS7210Style.xsl" />
	<xsl:output method="html" indent="yes" />
	<xsl:strip-space elements="*" />
	<xsl:param name="FormData" select="$RtnDoc/IRS7210" />
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
				<meta name="Description" content="IRS Form 7210" />
				<script language="JavaScript" src="{$ScriptPath}/FormDisplay.js" type="text/javascript" />
				<xsl:call-template name="InitJS" />
				<style type="text/css">
					<xsl:if test="not($Print) or $Print=''">
						<xsl:call-template name="IRS7210Style" />
						<xsl:call-template name="AddOnStyle" />
					</xsl:if>
				</style>
				<xsl:call-template name="GlobalStylesForm" />
			</head>
			<body class="styBodyClass">
				<form id="Form7210">
					<xsl:call-template name="DocumentHeader" />
					<!-- Page 1 -->
					<!-- Header -->
					<div class="styStdDiv">
						<div class="styFNBox" style="width:30mm;height:22.5mm;">
							Form <span class="styFN" style="font-size:18pt;">7210</span> 
							<br />
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
							<span class="styFMT" style="font-size:14pt;padding-top:1mm;padding-bottom:1mm;">Clean Hydrogen Production Credit</span>
							<br /><br />
							<span style="font-weight:bold;">
								Attach to your tax return.
							</span><br /><br />
							<span style="font-weight:bold;">
								Go to
								<span style="font-style:italic">www.irs.gov/Form7210</span>
								for instructions and the latest information.
							</span>
						</div>
						<div class="styTYBox" style="width:30mm;height:22.5mm;">
							<div class="styOMB" style="height:auto;font-size:6pt;">OMB No. 1545-0123</div>
							<div class="styTY">20<span class="styTYColor">25</span></div>
							<div style="margin-left:3mm;text-align:left;font-size:7pt;">
								Attachment<br/>Sequence No. 
								<span class="styBoldText" style="font-size:9pt;">210</span>
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
					<div class="styStdDiv">
						<div class="styLNDesc" style="height:auto;width:100%;">
							<strong>Caution. </strong> You cannot take the section 45V credit with respect to any qualified clean hydrogen production produced at a facility that includes 
							carbon capture equipment for which the section 45Q credit is allowed to any taxpayer for the tax year or any prior tax year. 
							Production and sale or use of clean hydrogen must be verified by an unrelated party. Attach a copy of the verification report to the tax return.
						</div>
					</div>
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD">A</div>
						<div class="styLNDesc" style="width:69mm;"><strong>(i)</strong>Enter the facility’s emissions value or rate : </div>
						<div class="styLNDesc" style="width:109mm;min-height:3.5mm;height:auto;border-bottom:1px dashed black;margin-bottom:1px;">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/FacilityEmissionsValueOrRt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- A -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD">&nbsp;</div>
						<div class="styLNDesc" style="width:119mm;">and <strong>(ii)</strong> the Department of Energy (DOE) control number if applicable ( see instructions): </div>
						<div class="styLNDesc" style="width:42mm;min-height:3.5mm;height:auto;border-bottom:1px dashed black;margin-bottom:1px;">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/DOEControlNum"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Part 1 -->
					<div class="styStdDiv" style="border-bottom:1px solid black;border-top:1px solid black;">
						<div class="styPartName">Part I</div>
						<div class="styPartDesc">
							Information on Qualified Clean Hydrogen Production Facility
						</div>
					</div>
					<!-- Line 1 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD">1</div>
						<div class="styLNDesc" style="width:178.9mm;">If making an elective payment election or transfer election, enter the IRS-issued registration number of the facility: </div>
					</div>
					<div class="styStdDiv">
						<div class="styLNLeftNumBox">&nbsp;</div>
						<div class="styLNDesc" style="width:178.9mm;min-height:3mm;height:auto;border-bottom:1px solid black;">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/FacilityIRSIssdRegistrationNum"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 2 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD">2</div>
						<div class="styLNDesc" style="width:69mm;">If different than filer, enter <strong>(i)</strong> owner's name</div>
						<div class="styLNDesc" style="width:109mm;min-height:3.5mm;height:auto;border-bottom:1px dashed black;margin-bottom:1px;">
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
										 ($RtnHdrData/Filer/EstateOrTrustName/BusinessNameLine2Txt != 
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
										 ($RtnHdrData/Filer/EstateOrTrustName/BusinessNameLine2Txt != 
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
					</div>
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD">&nbsp;</div>
						<div class="styLNDesc" style="width:39mm;">and <strong>(ii)</strong> owner's TIN</div>
						<div class="styLNDesc" style="width:139mm;min-height:3.5mm;height:auto;border-bottom:1px dashed black;margin-bottom:1px;">
									<span style="text-align:left;width:100%;">
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
					<!-- Line 2a -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD" style="padding-left:4.2mm;">a</div>
						<div class="styLNDesc" style="width:49mm;">Address and description of the facility: </div>
						<div class="styLNDesc" style="width:129mm;min-height:3.5mm;height:auto;border-bottom:1px dashed black;margin-bottom:1px;">
							<xsl:call-template name="PopulateUSAddressTemplate">
								<xsl:with-param name="TargetNode" select="$FormData/FacilityUSAddress"/>
							</xsl:call-template>
						</div>
					</div>
					<div class="styStdDiv">
						<div class="styLNLeftNumBox">&nbsp;</div>
						<div class="styLNDesc" style="width:178.9mm;min-height:3mm;height:auto;border-bottom:1px solid black;">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/FacilityDesc"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 2b -->
					<div class="styStdDiv" style="margin-top:1mm;">
						<div class="styLNLeftNumBoxSD" style="padding-left:4.2mm;">b</div>
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
					<!-- Line 5 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD">5</div>
						<div class="styLNDesc" style="width:170mm;">
							Check this box if the facility is eligible for the increased credit amount. See instructions
							<span class="sty7210DotLn">............</span>
						</div>
						<input type="checkbox" class="styCkboxNM" style="float:right;margin:1px 12px 1px 1px" alt="Project eligible for increased credit amount">
							<xsl:call-template name="PopulateCheckbox">
								<xsl:with-param name="TargetNode" select="$FormData/FacilityEligIncreasedCrAmtInd"/>
								<xsl:with-param name="BackupName">F7210/ProjEligibleIncreasedCrAmtInd</xsl:with-param>
							</xsl:call-template>
						</input>
					</div>
					<!-- Part 2 -->
					<div class="styStdDiv" style="border-bottom:1px solid black;border-top:1px solid black;">
						<div class="styPartName">Part II</div>
						<div class="styPartDesc" style="">
							Clean Hydrogen Production
						</div>
					</div>
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD">&nbsp;</div>
						<div class="sty7210Desc" style="height:auto;"><br />
							Emissions (kg CO2e per kg of qualified clean hydrogen) <br />
							(see instructions)
						</div>
						<div class="styLNRightNumBox" style="height:13.5mm;border-left-width:0px;">&nbsp;</div>
						<div class="sty7210QtyBox" style="text-align:center;padding:0.5mm;height:13.5mm;">
							<strong>(a)</strong><br />Kilograms of qualifed <br /> clean hydrogen produced <br /> (see instructions)
						</div>
						<div class="sty7210RateBox" style="height:13.5mm;">
							<strong>(b)</strong><br />Applicable amount
						</div>
						<div class="styLNAmountBox" style="height:13.5mm;text-align:center;">
							<strong>(c)</strong><br />Column (a) x Column (b)
						</div>
					</div>
					<!-- Line 6a -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD">6a</div>
						<div class="sty7210Desc">
							Less than 0.45
							<span class="sty7210DotLn">..............</span>
						</div>
						<div class="styLNRightNumBox">6a</div>
						<div class="sty7210QtyBox">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/ClnHydrgnPrdcdLssThan45Grp/KgProducedQty"/>
							</xsl:call-template>
						</div>
						<div class="sty7210RateBox">$0.622</div>
						<div class="styLNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/ClnHydrgnPrdcdLssThan45Grp/CalcQlfyClnHydrogenProducedAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 6b -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD" style="padding-left:4.2mm;">b</div>
						<div class="sty7210Desc">
							0.45 to less than 1.5
							<span class="sty7210DotLn">............</span>
						</div>
						<div class="styLNRightNumBox">6b</div>
						<div class="sty7210QtyBox">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/ClnHydrgnPrdcd45ToLssThan15Grp/KgProducedQty"/>
							</xsl:call-template>
						</div>
						<div class="sty7210RateBox">$0.208</div>
						<div class="styLNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/ClnHydrgnPrdcd45ToLssThan15Grp/CalcQlfyClnHydrogenProducedAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 6c -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD" style="padding-left:4.2mm;">c</div>
						<div class="sty7210Desc">
							1.5 to less than 2.5
							<span class="sty7210DotLn">............</span>
						</div>
						<div class="styLNRightNumBox">6c</div>
						<div class="sty7210QtyBox">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/ClnHydrgnPrdcd15ToLssThan25Grp/KgProducedQty"/>
							</xsl:call-template>
						</div>
						<div class="sty7210RateBox">$0.156</div>
						<div class="styLNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/ClnHydrgnPrdcd15ToLssThan25Grp/CalcQlfyClnHydrogenProducedAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 6d -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD" style="padding-left:4.2mm;">d</div>
						<div class="sty7210Desc">
							2.5 to not greater than 4.0
							<span class="sty7210DotLn">..........</span>
						</div>
						<div class="styLNRightNumBox">6d</div>
						<div class="sty7210QtyBox">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/ClnHydrgnPrdcd25NotGrtr4Grp/KgProducedQty"/>
							</xsl:call-template>
						</div>
						<div class="sty7210RateBox">$0.124</div>
						<div class="styLNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/ClnHydrgnPrdcd25NotGrtr4Grp/CalcQlfyClnHydrogenProducedAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 7 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD">7</div>
						<div class="styLNDesc">
							Credit before reduction. Enter the amount from line 6a, 6b, 6c, or 6d. See instructions
							<span class="sty7210DotLn">..</span>
						</div>
						<div class="styLNRightNumBoxNBB">7</div>
						<div class="styLNAmountBoxNBB">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CreditBeforeReductionAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Part 3 -->
					<div class="styStdDiv" style="border-bottom:1px solid black;border-top:1px solid black;">
						<div class="styPartName">Part III</div>
						<div class="styPartDesc" style="">
							Credit Reduction for Tax-Exempt Bonds
						</div>
					</div>
					<div class="styStdDiv">
						<div class="styLNDesc" style="width:146mm;height:auto;">
							If you used proceeds of tax-exempt bonds to finance your facility, continue to line 8a; <br />
							otherwise, enter the amount from line 7 on line 9.
						</div>
						<div class="styLNRightNumBoxNBB" style="height:10mm;background-color:lightgrey;">&nbsp;</div>
						<div class="styLNAmountBoxNBB" style="height:10mm;">&nbsp;</div>
					</div>
					<!-- Line 8a -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBox">8a</div>
						<div class="styLNDesc" style="height:auto;">
							<span class="styGenericDiv" style="font-weight:bold;width:15mm;">Divide. </span>
							<span class="styGenericDiv" style="width:123mm;height:auto;">
								<span style="width:60%;text-align:justify;">
									Sum, for the tax year and all prior tax years, of all proceeds of tax-exempt bonds 
									(within the meaning of section 103), used to finance the qualified facility
								</span>
								<span style="width:100%;">
									<span style="width:60%;height:2px;border-top:1px solid black;margin-bottom:3px;"/>
									<span class="sty7210DotLn">=..........</span>
								</span>
								<span style="width:60%;text-align:justify;">
									Aggregate amount of additions to the capital account for the qualified facility, 
									for the tax year and all prior tax years, as of the close of the tax year
								</span>
							</span>
						</div>
						<div class="styLNRightNumBoxNBB" style="height:10mm;background-color:lightgrey;">&nbsp;</div>
						<div class="styLNAmountBoxNBB" style="height:10mm;">&nbsp;</div>
						<div class="styLNRightNumBox">8a</div>
						<div class="styLNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CalcTaxExemptBondsPct"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBoxNBB" style="height:10mm;background-color:lightgrey;">&nbsp;</div>
						<div class="styLNAmountBoxNBB" style="height:10mm;">&nbsp;</div>
					</div>
					<!-- Line 8b -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD" style="padding-left:4.2mm;">b</div>
						<div class="styLNDesc">
							Multiply line 7 by line 8a
							<span class="sty7210DotLn">..........................</span>
						</div>
						<div class="styLNRightNumBox">8b</div>
						<div class="styLNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CreditBeforeReductionFncAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 8c -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD" style="padding-left:4.2mm;">c</div>
						<div class="styLNDesc">
							Multiply line 7 by 15% (0.15)
							<span class="sty7210DotLn">........................</span>
						</div>
						<div class="styLNRightNumBox">8c</div>
						<div class="styLNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CreditBeforeReductionPctAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 8d -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD" style="padding-left:4.2mm;">d</div>
						<div class="styLNDesc">
							Enter the smaller of line 8b or 8c
							<span class="sty7210DotLn">.......................</span>
						</div>
						<div class="styLNRightNumBox">8d</div>
						<div class="styLNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/SmllrCrBfrReductionFncPctAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 9 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD">9</div>
						<div class="styLNDesc">
							Subtract line 8d from line 7
							<span class="sty7210DotLn">.........................</span>
						</div>
						<div class="styLNRightNumBoxNBB">9</div>
						<div class="styLNAmountBoxNBB">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TaxExemptBondsCrReductionAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Part 4 -->
					<div class="styStdDiv" style="border-bottom:1px solid black;border-top:1px solid black;">
						<div class="styPartName">Part IV</div>
						<div class="styPartDesc" style="">
							Clean Hydrogen Production Credit
						</div>
					</div>
					<!-- Line 10 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBox">10</div>
						<div class="styLNDesc" style="height:auto;">
							Increased credit amount for qualified clean hydrogen facilities. If you checked the box on line 5, <br />
							multiply the amount on line 9 by 5.0. Otherwise, enter the amount from line 9 here
							<span class="sty7210DotLn">........</span>
						</div>
						<div class="styLNRightNumBox" style="height:7mm;"><br />10</div>
						<div class="styLNAmountBox" style="height:7mm;"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/IncrCrQlfyClnHydrgnFcltsAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 11 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBox">11</div>
						<div class="styLNDesc">
							Clean hydrogen credit from partnerships and S corporations
							<span class="sty7210DotLn">...............</span>
						</div>
						<div class="styLNRightNumBox">11</div>
						<div class="styLNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/PrtshpSCorpClnHydrgnCrAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 12 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBox">12</div>
						<div class="styLNDesc" style="height:auto;">
							Add lines 10 and 11. Partnerships and S corporations, stop here and report this amount on Schedule K. <br />
							All others, stop here and report this amount on Form 3800, Part III, line 1g. See instructions
							<span class="sty7210DotLn">....</span>
						</div>
						<div class="styLNRightNumBoxNBB" style="height:7mm;"><br />12</div>
						<div class="styLNAmountBoxNBB" style="height:7mm;"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/ClnHydrgnProdCrAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<div class="styStdDiv pageEnd" style="border-top:1px solid black;">
						<span style="font-weight:bold;font-family:Arial;">For Paperwork Reduction Act Notice, see the separate instructions.</span>
						<span style="margin-left:20mm;">Cat. No. 56404K</span>
						<span style="float:right;">Form <strong>7210</strong> (2025)</span>
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
					<br/>
				</form>
			</body>
		</html>
	</xsl:template>
</xsl:stylesheet>
