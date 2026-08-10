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
	<xsl:include href="IRS8933ScheduleDStyle.xsl"/>
	<xsl:output method="html" indent="yes"/>
	<xsl:strip-space elements="*"/>
	<xsl:param name="FormData" select="$RtnDoc/IRS8933ScheduleD"/>
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
				<meta name="Description" content="IRS Form 8933 Schedule D"/>
				<script language="JavaScript" src="{$ScriptPath}/FormDisplay.js" type="text/javascript"/>
				<xsl:call-template name="InitJS"/>
				<style type="text/css">
					<xsl:if test="not($Print) or $Print=''">
						<xsl:call-template name="IRS8933ScheduleDStyle"/>
						<xsl:call-template name="AddOnStyle"/>
					</xsl:if>
				</style>
				<xsl:call-template name="GlobalStylesForm"/>
			</head>
			<body class="styBodyClass">
				<form id="Form8933ScheduleD">
					<xsl:call-template name="DocumentHeaderLandscape"/>
					<!-- Page 1 -->
					<!-- Header -->
					<div class="styStdDivLS" style="height:19mm;">
						<div class="styFNBox" style="width:50mm;height:19mm;padding-top:1mm;">
							<strong>SCHEDULE D <br/> (Form 8933) </strong>
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
							<span class="styFMT" style="font-size:10pt;padding-top:1mm;padding-bottom:4mm;">
							Recapture Certification
							</span>
							<br/>
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
						<div class="styTYBox" style="width:46mm;height:auto;">
							<div class="styOMB" style="padding-top:7mm;height:19mm;border-bottom-width: 0px;">OMB No. 1545-0123</div>
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
					<!-- Part I - Header - Information About the Geological Disposal Site -->
					<div class="styStdDivLS" style="border-top:1px solid black;">
						<span class="styPartName">Part I</span>
						<span class="styPartDesc" style="font-size:9pt;">
							<strong>Information About the Geological Disposal Site</strong>
						</span>
					</div>
					<!-- Section 1 -->
					<div class="styStdDivLS" style="border-top:1px solid black;padding-top:1px;padding-bottom:1px;font-weight:bold;font-size:8pt;">
						Section 1 &mdash; Information about the owner(s) of the geological disposal site
					</div>
					<!-- Line 1 -->
					<div class="styStdIBDivLS" style="border-top:1px solid black;font-size:8pt;">
						<div class="styLNLeftNumBoxSD">1</div>
						<div class="sty8933DDescLandscapes">Provide information about owner(s) of the geological disposal site. See instructions.</div>
					</div>
					<!-- Table 1 -->
					<div class="styStdDivLS" style="border-top:1px solid black;">
						<div class="styLNLeftNumBox" style="height:11mm;">&nbsp;</div>
						<div class="sty8933DDescLandscapes" style="width:27.6mm;height:11mm;">&nbsp;</div>
						<div class="sty8933DHeaderBox">
							<strong>(a)</strong> Current tax year<br/>
							<div class="sty8933DYr">
								<xsl:call-template name="PopulateYear">
									<xsl:with-param name="TargetNode" select="$FormData/GeologicalDisposalSiteCYGrp/TaxYr"/>
								</xsl:call-template>
							</div>
						</div>
						<div class="sty8933DHeaderBox">
							<strong>(b)</strong> 1st previous tax year<br/>
							<div class="sty8933DYr">
								<xsl:call-template name="PopulateYear">
									<xsl:with-param name="TargetNode" select="$FormData/GeologicalDisposalSite1stPYGrp/TaxYr"/>
								</xsl:call-template>
							</div>
						</div>
						<div class="sty8933DHeaderBox">
							<strong>(c)</strong> 2nd previous tax year<br/>
							<div class="sty8933DYr">
								<xsl:call-template name="PopulateYear">
									<xsl:with-param name="TargetNode" select="$FormData/GeologicalDisposalSite2ndPYGrp/TaxYr"/>
								</xsl:call-template>
							</div>
						</div>
						<div class="sty8933DHeaderBox">
							<strong>(d)</strong> 3rd previous tax year<br/>
							<div class="sty8933DYr">
								<xsl:call-template name="PopulateYear">
									<xsl:with-param name="TargetNode" select="$FormData/GeologicalDisposalSite3rdPYGrp/TaxYr"/>
								</xsl:call-template>
							</div>
						</div>
					</div>
					<!-- P1 - Body -->
					<xsl:variable name="CYGrp" select="count($FormData/GeologicalDisposalSiteCYGrp/GeologicalDisposalSiteOwnerGrp)"/>
					<xsl:variable name="FirstPY" select="count($FormData/GeologicalDisposalSite1stPYGrp/GeologicalDisposalSiteOwnerGrp)"/>
					<xsl:variable name="SecondPY" select="count($FormData/GeologicalDisposalSite2ndPYGrp/GeologicalDisposalSiteOwnerGrp)"/>
					<xsl:variable name="ThirdPY" select="count($FormData/GeologicalDisposalSite3rdPYGrp/GeologicalDisposalSiteOwnerGrp)"/>
					<xsl:choose>
						<xsl:when test="$CYGrp &gt;= $FirstPY and $CYGrp &gt;= $SecondPY and $CYGrp &gt;= $ThirdPY">
							<xsl:for-each select="$FormData/GeologicalDisposalSiteCYGrp/GeologicalDisposalSiteOwnerGrp">
								<xsl:variable name="pos" select="position()"/>
								<div class="styStdIBDivLS" style="border-top:1px solid black;">
									<div class="styLNLeftLtrBox" style="width:8mm;border-bottom:1px;">
										<xsl:number value="position()" format="A"/>
									</div>
									<div class="sty8933DDescLandscapes" style="width:27.6mm;">
										<div style="width:28mm;border-bottom:1px solid black;height:19mm;">
											<span style="width:5mm;font-weight:bold;float:left;">(i)</span>
											<span style="padding-left:1mm;">Owner's name</span>
										</div>
										<div style="width:28mm;border-bottom:1px solid black;height:10mm;">
											<span style="width:5mm;font-weight:bold;padding-top:0;float:left;">(ii)</span>
											<span style="padding-left:1mm;">Employer<br/> identification<br/> number (EIN)</span>
										</div>
										<div style="width:28mm;border-bottom:1px solid black;height:19mm;">
											<span style="width:5mm;font-weight:bold;float:left;">(iii)</span>
											<span style="padding-left:1mm;">Address</span>
										</div>
										<div style="width:28mm;height:8mm;">
											<span style="width:5mm;font-weight:bold;float:left;">(iv)</span>
											<span style="padding-left:1mm;">Operating<br/> interest (%)</span>
										</div>
									</div>
									<div class="sty8933DP1Box">
										<div class="sty8933DBusP1Box">
											<xsl:call-template name="FillNameChoice">
												<xsl:with-param name="TargetBusinessName" select="$FormData/GeologicalDisposalSiteCYGrp/GeologicalDisposalSiteOwnerGrp[$pos]/FacilityOwnerBusinessName"/>
												<xsl:with-param name="TargetPersonName" select="$FormData/GeologicalDisposalSiteCYGrp/GeologicalDisposalSiteOwnerGrp[$pos]/FacilityOwnerPersonNm"/>
											</xsl:call-template>
										</div>
										<div class="sty8933DEINP1Box">
											<xsl:call-template name="FillEINChoice">
												<xsl:with-param name="TargetEIN" select="$FormData/GeologicalDisposalSiteCYGrp/GeologicalDisposalSiteOwnerGrp[$pos]/FacilityOwnerEIN"/>
												<xsl:with-param name="TargetSSN" select="$FormData/GeologicalDisposalSiteCYGrp/GeologicalDisposalSiteOwnerGrp[$pos]/FacilityOwnerSSN"/>
											</xsl:call-template>
										</div>
										<div class="sty8933DAddP1Box">
											<xsl:call-template name="FillAddressChoice">
												<xsl:with-param name="TargetUSAddress" select="$FormData/GeologicalDisposalSiteCYGrp/GeologicalDisposalSiteOwnerGrp[$pos]/FacilityOwnerUSAddress"/>
												<xsl:with-param name="TargetForeignAddress" select="$FormData/GeologicalDisposalSiteCYGrp/GeologicalDisposalSiteOwnerGrp[$pos]/FacilityOwnerForeignAddress"/>
											</xsl:call-template>
										</div>
										<div class="sty8933DOpIntP1Box">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="$FormData/GeologicalDisposalSiteCYGrp/GeologicalDisposalSiteOwnerGrp[$pos]/OperatingInterestPct"/>
											</xsl:call-template>
										</div>
									</div>
									<div class="sty8933DP1Box">
										<div class="sty8933DBusP1Box">
											<xsl:call-template name="FillNameChoice">
												<xsl:with-param name="TargetBusinessName" select="$FormData/GeologicalDisposalSite1stPYGrp/GeologicalDisposalSiteOwnerGrp[$pos]/FacilityOwnerBusinessName"/>
												<xsl:with-param name="TargetPersonName" select="$FormData/GeologicalDisposalSite1stPYGrp/GeologicalDisposalSiteOwnerGrp[$pos]/FacilityOwnerPersonNm"/>
											</xsl:call-template>
										</div>
										<div class="sty8933DEINP1Box">
											<xsl:call-template name="FillEINChoice">
												<xsl:with-param name="TargetEIN" select="$FormData/GeologicalDisposalSite1stPYGrp/GeologicalDisposalSiteOwnerGrp[$pos]/FacilityOwnerEIN"/>
												<xsl:with-param name="TargetSSN" select="$FormData/GeologicalDisposalSite1stPYGrp/GeologicalDisposalSiteOwnerGrp[$pos]/FacilityOwnerSSN"/>
											</xsl:call-template>
										</div>
										<div class="sty8933DAddP1Box">
											<xsl:call-template name="FillAddressChoice">
												<xsl:with-param name="TargetUSAddress" select="$FormData/GeologicalDisposalSite1stPYGrp/GeologicalDisposalSiteOwnerGrp[$pos]/FacilityOwnerUSAddress"/>
												<xsl:with-param name="TargetForeignAddress" select="$FormData/GeologicalDisposalSite1stPYGrp/GeologicalDisposalSiteOwnerGrp[$pos]/FacilityOwnerForeignAddress"/>
											</xsl:call-template>
										</div>
										<div class="sty8933DOpIntP1Box">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="$FormData/GeologicalDisposalSite1stPYGrp/GeologicalDisposalSiteOwnerGrp[$pos]/OperatingInterestPct"/>
											</xsl:call-template>
										</div>
									</div>
									<div class="sty8933DP1Box">
										<div class="sty8933DBusP1Box">
											<xsl:call-template name="FillNameChoice">
												<xsl:with-param name="TargetBusinessName" select="$FormData/GeologicalDisposalSite2ndPYGrp/GeologicalDisposalSiteOwnerGrp[$pos]/FacilityOwnerBusinessName"/>
												<xsl:with-param name="TargetPersonName" select="$FormData/GeologicalDisposalSite2ndPYGrp/GeologicalDisposalSiteOwnerGrp[$pos]/FacilityOwnerPersonNm"/>
											</xsl:call-template>
										</div>
										<div class="sty8933DEINP1Box">
											<xsl:call-template name="FillEINChoice">
												<xsl:with-param name="TargetEIN" select="$FormData/GeologicalDisposalSite2ndPYGrp/GeologicalDisposalSiteOwnerGrp[$pos]/FacilityOwnerEIN"/>
												<xsl:with-param name="TargetSSN" select="$FormData/GeologicalDisposalSite2ndPYGrp/GeologicalDisposalSiteOwnerGrp[$pos]/FacilityOwnerSSN"/>
											</xsl:call-template>
										</div>
										<div class="sty8933DAddP1Box">
											<xsl:call-template name="FillAddressChoice">
												<xsl:with-param name="TargetUSAddress" select="$FormData/GeologicalDisposalSite2ndPYGrp/GeologicalDisposalSiteOwnerGrp[$pos]/FacilityOwnerUSAddress"/>
												<xsl:with-param name="TargetForeignAddress" select="$FormData/GeologicalDisposalSite2ndPYGrp/GeologicalDisposalSiteOwnerGrp[$pos]/FacilityOwnerForeignAddress"/>
											</xsl:call-template>
										</div>
										<div class="sty8933DOpIntP1Box">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="$FormData/GeologicalDisposalSite2ndPYGrp/GeologicalDisposalSiteOwnerGrp[$pos]/OperatingInterestPct"/>
											</xsl:call-template>
										</div>
									</div>
									<div class="sty8933DP1Box">
										<div class="sty8933DBusP1Box">
											<xsl:call-template name="FillNameChoice">
												<xsl:with-param name="TargetBusinessName" select="$FormData/GeologicalDisposalSite3rdPYGrp/GeologicalDisposalSiteOwnerGrp[$pos]/FacilityOwnerBusinessName"/>
												<xsl:with-param name="TargetPersonName" select="$FormData/GeologicalDisposalSite3rdPYGrp/GeologicalDisposalSiteOwnerGrp[$pos]/FacilityOwnerPersonNm"/>
											</xsl:call-template>
										</div>
										<div class="sty8933DEINP1Box">
											<xsl:call-template name="FillEINChoice">
												<xsl:with-param name="TargetEIN" select="$FormData/GeologicalDisposalSite3rdPYGrp/GeologicalDisposalSiteOwnerGrp[$pos]/FacilityOwnerEIN"/>
												<xsl:with-param name="TargetSSN" select="$FormData/GeologicalDisposalSite3rdPYGrp/GeologicalDisposalSiteOwnerGrp[$pos]/FacilityOwnerSSN"/>
											</xsl:call-template>
										</div>
										<div class="sty8933DAddP1Box">
											<xsl:call-template name="FillAddressChoice">
												<xsl:with-param name="TargetUSAddress" select="$FormData/GeologicalDisposalSite3rdPYGrp/GeologicalDisposalSiteOwnerGrp[$pos]/FacilityOwnerUSAddress"/>
												<xsl:with-param name="TargetForeignAddress" select="$FormData/GeologicalDisposalSite3rdPYGrp/GeologicalDisposalSiteOwnerGrp[$pos]/FacilityOwnerForeignAddress"/>
											</xsl:call-template>
										</div>
										<div class="sty8933DOpIntP1Box">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="$FormData/GeologicalDisposalSite3rdPYGrp/GeologicalDisposalSiteOwnerGrp[$pos]/OperatingInterestPct"/>
											</xsl:call-template>
										</div>
									</div>
								</div>
							</xsl:for-each>
							<xsl:if test="((count($FormData/GeologicalDisposalSiteCYGrp/GeologicalDisposalSiteOwnerGrp) &lt; 4) and (count($FormData/GeologicalDisposalSite1stPYGrp/GeologicalDisposalSiteOwnerGrp) &lt; 4) and (count($FormData/GeologicalDisposalSite2ndPYGrp/GeologicalDisposalSiteOwnerGrp) &lt; 4) and (count($FormData/GeologicalDisposalSite3rdPYGrp/GeologicalDisposalSiteOwnerGrp) &lt; 4))">
								<xsl:call-template name="P1Filler">
									<xsl:with-param name="Start" select="count($FormData/GeologicalDisposalSiteCYGrp/GeologicalDisposalSiteOwnerGrp) + 1"/>
									<xsl:with-param name="End" select="4"/>
									<!--<xsl:with-param name="Sep" select="$sep1-1"/>-->
								</xsl:call-template>
							</xsl:if>
						</xsl:when>
						<xsl:when test="$FirstPY &gt;= $CYGrp and $FirstPY &gt;= $SecondPY and $FirstPY &gt;= $ThirdPY">
							<xsl:for-each select="$FormData/GeologicalDisposalSite1stPYGrp/GeologicalDisposalSiteOwnerGrp">
								<xsl:variable name="pos" select="position()"/>
								<div class="styStdIBDivLS" style="border-top:1px solid black;">
									<div class="styLNLeftLtrBox" style="width:8mm;border-bottom:1px;">
										<xsl:number value="position()" format="A"/>
									</div>
									<div class="sty8933DDescLandscapes" style="width:27.6mm;">
										<div style="width:28mm;border-bottom:1px solid black;height:19mm;">
											<span style="width:5mm;font-weight:bold;float:left;">(i)</span>
											<span style="padding-left:1mm;">Owner's name</span>
										</div>
										<div style="width:28mm;border-bottom:1px solid black;height:10mm;">
											<span style="width:5mm;font-weight:bold;padding-top:0;float:left;">(ii)</span>
											<span style="padding-left:1mm;">Employer<br/> identification<br/> number (EIN)</span>
										</div>
										<div style="width:28mm;border-bottom:1px solid black;height:19mm;">
											<span style="width:5mm;font-weight:bold;float:left;">(iii)</span>
											<span style="padding-left:1mm;">Address</span>
										</div>
										<div style="width:28mm;height:8mm;">
											<span style="width:5mm;font-weight:bold;float:left;">(iv)</span>
											<span style="padding-left:1mm;">Operating<br/> interest (%)</span>
										</div>
									</div>
									<div class="sty8933DP1Box">
										<div class="sty8933DBusP1Box">
											<xsl:call-template name="FillNameChoice">
												<xsl:with-param name="TargetBusinessName" select="$FormData/GeologicalDisposalSiteCYGrp/GeologicalDisposalSiteOwnerGrp[$pos]/FacilityOwnerBusinessName"/>
												<xsl:with-param name="TargetPersonName" select="$FormData/GeologicalDisposalSiteCYGrp/GeologicalDisposalSiteOwnerGrp[$pos]/FacilityOwnerPersonNm"/>
											</xsl:call-template>
										</div>
										<div class="sty8933DEINP1Box">
											<xsl:call-template name="FillEINChoice">
												<xsl:with-param name="TargetEIN" select="$FormData/GeologicalDisposalSiteCYGrp/GeologicalDisposalSiteOwnerGrp[$pos]/FacilityOwnerEIN"/>
												<xsl:with-param name="TargetSSN" select="$FormData/GeologicalDisposalSiteCYGrp/GeologicalDisposalSiteOwnerGrp[$pos]/FacilityOwnerSSN"/>
											</xsl:call-template>
										</div>
										<div class="sty8933DAddP1Box">
											<xsl:call-template name="FillAddressChoice">
												<xsl:with-param name="TargetUSAddress" select="$FormData/GeologicalDisposalSiteCYGrp/GeologicalDisposalSiteOwnerGrp[$pos]/FacilityOwnerUSAddress"/>
												<xsl:with-param name="TargetForeignAddress" select="$FormData/GeologicalDisposalSiteCYGrp/GeologicalDisposalSiteOwnerGrp[$pos]/FacilityOwnerForeignAddress"/>
											</xsl:call-template>
										</div>
										<div class="sty8933DOpIntP1Box">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="$FormData/GeologicalDisposalSiteCYGrp/GeologicalDisposalSiteOwnerGrp[$pos]/OperatingInterestPct"/>
											</xsl:call-template>
										</div>
									</div>
									<div class="sty8933DP1Box">
										<div class="sty8933DBusP1Box">
											<xsl:call-template name="FillNameChoice">
												<xsl:with-param name="TargetBusinessName" select="$FormData/GeologicalDisposalSite1stPYGrp/GeologicalDisposalSiteOwnerGrp[$pos]/FacilityOwnerBusinessName"/>
												<xsl:with-param name="TargetPersonName" select="$FormData/GeologicalDisposalSite1stPYGrp/GeologicalDisposalSiteOwnerGrp[$pos]/FacilityOwnerPersonNm"/>
											</xsl:call-template>
										</div>
										<div class="sty8933DEINP1Box">
											<xsl:call-template name="FillEINChoice">
												<xsl:with-param name="TargetEIN" select="$FormData/GeologicalDisposalSite1stPYGrp/GeologicalDisposalSiteOwnerGrp[$pos]/FacilityOwnerEIN"/>
												<xsl:with-param name="TargetSSN" select="$FormData/GeologicalDisposalSite1stPYGrp/GeologicalDisposalSiteOwnerGrp[$pos]/FacilityOwnerSSN"/>
											</xsl:call-template>
										</div>
										<div class="sty8933DAddP1Box">
											<xsl:call-template name="FillAddressChoice">
												<xsl:with-param name="TargetUSAddress" select="$FormData/GeologicalDisposalSite1stPYGrp/GeologicalDisposalSiteOwnerGrp[$pos]/FacilityOwnerUSAddress"/>
												<xsl:with-param name="TargetForeignAddress" select="$FormData/GeologicalDisposalSite1stPYGrp/GeologicalDisposalSiteOwnerGrp[$pos]/FacilityOwnerForeignAddress"/>
											</xsl:call-template>
										</div>
										<div class="sty8933DOpIntP1Box">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="$FormData/GeologicalDisposalSite1stPYGrp/GeologicalDisposalSiteOwnerGrp[$pos]/OperatingInterestPct"/>
											</xsl:call-template>
										</div>
									</div>
									<div class="sty8933DP1Box">
										<div class="sty8933DBusP1Box">
											<xsl:call-template name="FillNameChoice">
												<xsl:with-param name="TargetBusinessName" select="$FormData/GeologicalDisposalSite2ndPYGrp/GeologicalDisposalSiteOwnerGrp[$pos]/FacilityOwnerBusinessName"/>
												<xsl:with-param name="TargetPersonName" select="$FormData/GeologicalDisposalSite2ndPYGrp/GeologicalDisposalSiteOwnerGrp[$pos]/FacilityOwnerPersonNm"/>
											</xsl:call-template>
										</div>
										<div class="sty8933DEINP1Box">
											<xsl:call-template name="FillEINChoice">
												<xsl:with-param name="TargetEIN" select="$FormData/GeologicalDisposalSite2ndPYGrp/GeologicalDisposalSiteOwnerGrp[$pos]/FacilityOwnerEIN"/>
												<xsl:with-param name="TargetSSN" select="$FormData/GeologicalDisposalSite2ndPYGrp/GeologicalDisposalSiteOwnerGrp[$pos]/FacilityOwnerSSN"/>
											</xsl:call-template>
										</div>
										<div class="sty8933DAddP1Box">
											<xsl:call-template name="FillAddressChoice">
												<xsl:with-param name="TargetUSAddress" select="$FormData/GeologicalDisposalSite2ndPYGrp/GeologicalDisposalSiteOwnerGrp[$pos]/FacilityOwnerUSAddress"/>
												<xsl:with-param name="TargetForeignAddress" select="$FormData/GeologicalDisposalSite2ndPYGrp/GeologicalDisposalSiteOwnerGrp[$pos]/FacilityOwnerForeignAddress"/>
											</xsl:call-template>
										</div>
										<div class="sty8933DOpIntP1Box">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="$FormData/GeologicalDisposalSite2ndPYGrp/GeologicalDisposalSiteOwnerGrp[$pos]/OperatingInterestPct"/>
											</xsl:call-template>
										</div>
									</div>
									<div class="sty8933DP1Box">
										<div class="sty8933DBusP1Box">
											<xsl:call-template name="FillNameChoice">
												<xsl:with-param name="TargetBusinessName" select="$FormData/GeologicalDisposalSite3rdPYGrp/GeologicalDisposalSiteOwnerGrp[$pos]/FacilityOwnerBusinessName"/>
												<xsl:with-param name="TargetPersonName" select="$FormData/GeologicalDisposalSite3rdPYGrp/GeologicalDisposalSiteOwnerGrp[$pos]/FacilityOwnerPersonNm"/>
											</xsl:call-template>
										</div>
										<div class="sty8933DEINP1Box">
											<xsl:call-template name="FillEINChoice">
												<xsl:with-param name="TargetEIN" select="$FormData/GeologicalDisposalSite3rdPYGrp/GeologicalDisposalSiteOwnerGrp[$pos]/FacilityOwnerEIN"/>
												<xsl:with-param name="TargetSSN" select="$FormData/GeologicalDisposalSite3rdPYGrp/GeologicalDisposalSiteOwnerGrp[$pos]/FacilityOwnerSSN"/>
											</xsl:call-template>
										</div>
										<div class="sty8933DAddP1Box">
											<xsl:call-template name="FillAddressChoice">
												<xsl:with-param name="TargetUSAddress" select="$FormData/GeologicalDisposalSite3rdPYGrp/GeologicalDisposalSiteOwnerGrp[$pos]/FacilityOwnerUSAddress"/>
												<xsl:with-param name="TargetForeignAddress" select="$FormData/GeologicalDisposalSite3rdPYGrp/GeologicalDisposalSiteOwnerGrp[$pos]/FacilityOwnerForeignAddress"/>
											</xsl:call-template>
										</div>
										<div class="sty8933DOpIntP1Box">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="$FormData/GeologicalDisposalSite3rdPYGrp/GeologicalDisposalSiteOwnerGrp[$pos]/OperatingInterestPct"/>
											</xsl:call-template>
										</div>
									</div>
								</div>
							</xsl:for-each>
							<xsl:if test="((count($FormData/GeologicalDisposalSiteCYGrp/GeologicalDisposalSiteOwnerGrp) &lt; 4) and (count($FormData/GeologicalDisposalSite1stPYGrp/GeologicalDisposalSiteOwnerGrp) &lt; 4) and (count($FormData/GeologicalDisposalSite2ndPYGrp/GeologicalDisposalSiteOwnerGrp) &lt; 4) and (count($FormData/GeologicalDisposalSite3rdPYGrp/GeologicalDisposalSiteOwnerGrp) &lt; 4))">
								<xsl:call-template name="P1Filler">
									<xsl:with-param name="Start" select="count($FormData/GeologicalDisposalSite1stPYGrp/GeologicalDisposalSiteOwnerGrp) + 1"/>
									<xsl:with-param name="End" select="4"/>
								</xsl:call-template>
							</xsl:if>
						</xsl:when>
						<xsl:when test="$SecondPY &gt;= $CYGrp and $SecondPY &gt;= $FirstPY and $SecondPY &gt;= $ThirdPY">
							<xsl:for-each select="$FormData/GeologicalDisposalSite2ndPYGrp/GeologicalDisposalSiteOwnerGrp">
								<xsl:variable name="pos" select="position()"/>
								<div class="styStdIBDivLS" style="border-top:1px solid black;">
									<div class="styLNLeftLtrBox" style="width:8mm;border-bottom:1px;">
										<xsl:number value="position()" format="A"/>
									</div>
									<div class="sty8933DDescLandscapes" style="width:27.6mm;">
										<div style="width:28mm;border-bottom:1px solid black;height:19mm;">
											<span style="width:5mm;font-weight:bold;float:left;">(i)</span>
											<span style="padding-left:1mm;">Owner's name</span>
										</div>
										<div style="width:28mm;border-bottom:1px solid black;height:10mm;">
											<span style="width:5mm;font-weight:bold;padding-top:0;float:left;">(ii)</span>
											<span style="padding-left:1mm;">Employer<br/> identification<br/> number (EIN)</span>
										</div>
										<div style="width:28mm;border-bottom:1px solid black;height:19mm;">
											<span style="width:5mm;font-weight:bold;float:left;">(iii)</span>
											<span style="padding-left:1mm;">Address</span>
										</div>
										<div style="width:28mm;height:8mm;">
											<span style="width:5mm;font-weight:bold;float:left;">(iv)</span>
											<span style="padding-left:1mm;">Operating<br/> interest (%)</span>
										</div>
									</div>
									<div class="sty8933DP1Box">
										<div class="sty8933DBusP1Box">
											<xsl:call-template name="FillNameChoice">
												<xsl:with-param name="TargetBusinessName" select="$FormData/GeologicalDisposalSiteCYGrp/GeologicalDisposalSiteOwnerGrp[$pos]/FacilityOwnerBusinessName"/>
												<xsl:with-param name="TargetPersonName" select="$FormData/GeologicalDisposalSiteCYGrp/GeologicalDisposalSiteOwnerGrp[$pos]/FacilityOwnerPersonNm"/>
											</xsl:call-template>
										</div>
										<div class="sty8933DEINP1Box">
											<xsl:call-template name="FillEINChoice">
												<xsl:with-param name="TargetEIN" select="$FormData/GeologicalDisposalSiteCYGrp/GeologicalDisposalSiteOwnerGrp[$pos]/FacilityOwnerEIN"/>
												<xsl:with-param name="TargetSSN" select="$FormData/GeologicalDisposalSiteCYGrp/GeologicalDisposalSiteOwnerGrp[$pos]/FacilityOwnerSSN"/>
											</xsl:call-template>
										</div>
										<div class="sty8933DAddP1Box">
											<xsl:call-template name="FillAddressChoice">
												<xsl:with-param name="TargetUSAddress" select="$FormData/GeologicalDisposalSiteCYGrp/GeologicalDisposalSiteOwnerGrp[$pos]/FacilityOwnerUSAddress"/>
												<xsl:with-param name="TargetForeignAddress" select="$FormData/GeologicalDisposalSiteCYGrp/GeologicalDisposalSiteOwnerGrp[$pos]/FacilityOwnerForeignAddress"/>
											</xsl:call-template>
										</div>
										<div class="sty8933DOpIntP1Box">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="$FormData/GeologicalDisposalSiteCYGrp/GeologicalDisposalSiteOwnerGrp[$pos]/OperatingInterestPct"/>
											</xsl:call-template>
										</div>
									</div>
									<div class="sty8933DP1Box">
										<div class="sty8933DBusP1Box">
											<xsl:call-template name="FillNameChoice">
												<xsl:with-param name="TargetBusinessName" select="$FormData/GeologicalDisposalSite1stPYGrp/GeologicalDisposalSiteOwnerGrp[$pos]/FacilityOwnerBusinessName"/>
												<xsl:with-param name="TargetPersonName" select="$FormData/GeologicalDisposalSite1stPYGrp/GeologicalDisposalSiteOwnerGrp[$pos]/FacilityOwnerPersonNm"/>
											</xsl:call-template>
										</div>
										<div class="sty8933DEINP1Box">
											<xsl:call-template name="FillEINChoice">
												<xsl:with-param name="TargetEIN" select="$FormData/GeologicalDisposalSite1stPYGrp/GeologicalDisposalSiteOwnerGrp[$pos]/FacilityOwnerEIN"/>
												<xsl:with-param name="TargetSSN" select="$FormData/GeologicalDisposalSite1stPYGrp/GeologicalDisposalSiteOwnerGrp[$pos]/FacilityOwnerSSN"/>
											</xsl:call-template>
										</div>
										<div class="sty8933DAddP1Box">
											<xsl:call-template name="FillAddressChoice">
												<xsl:with-param name="TargetUSAddress" select="$FormData/GeologicalDisposalSite1stPYGrp/GeologicalDisposalSiteOwnerGrp[$pos]/FacilityOwnerUSAddress"/>
												<xsl:with-param name="TargetForeignAddress" select="$FormData/GeologicalDisposalSite1stPYGrp/GeologicalDisposalSiteOwnerGrp[$pos]/FacilityOwnerForeignAddress"/>
											</xsl:call-template>
										</div>
										<div class="sty8933DOpIntP1Box">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="$FormData/GeologicalDisposalSite1stPYGrp/GeologicalDisposalSiteOwnerGrp[$pos]/OperatingInterestPct"/>
											</xsl:call-template>
										</div>
									</div>
									<div class="sty8933DP1Box">
										<div class="sty8933DBusP1Box">
											<xsl:call-template name="FillNameChoice">
												<xsl:with-param name="TargetBusinessName" select="$FormData/GeologicalDisposalSite2ndPYGrp/GeologicalDisposalSiteOwnerGrp[$pos]/FacilityOwnerBusinessName"/>
												<xsl:with-param name="TargetPersonName" select="$FormData/GeologicalDisposalSite2ndPYGrp/GeologicalDisposalSiteOwnerGrp[$pos]/FacilityOwnerPersonNm"/>
											</xsl:call-template>
										</div>
										<div class="sty8933DEINP1Box">
											<xsl:call-template name="FillEINChoice">
												<xsl:with-param name="TargetEIN" select="$FormData/GeologicalDisposalSite2ndPYGrp/GeologicalDisposalSiteOwnerGrp[$pos]/FacilityOwnerEIN"/>
												<xsl:with-param name="TargetSSN" select="$FormData/GeologicalDisposalSite2ndPYGrp/GeologicalDisposalSiteOwnerGrp[$pos]/FacilityOwnerSSN"/>
											</xsl:call-template>
										</div>
										<div class="sty8933DAddP1Box">
											<xsl:call-template name="FillAddressChoice">
												<xsl:with-param name="TargetUSAddress" select="$FormData/GeologicalDisposalSite2ndPYGrp/GeologicalDisposalSiteOwnerGrp[$pos]/FacilityOwnerUSAddress"/>
												<xsl:with-param name="TargetForeignAddress" select="$FormData/GeologicalDisposalSite2ndPYGrp/GeologicalDisposalSiteOwnerGrp[$pos]/FacilityOwnerForeignAddress"/>
											</xsl:call-template>
										</div>
										<div class="sty8933DOpIntP1Box">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="$FormData/GeologicalDisposalSite2ndPYGrp/GeologicalDisposalSiteOwnerGrp[$pos]/OperatingInterestPct"/>
											</xsl:call-template>
										</div>
									</div>
									<div class="sty8933DP1Box">
										<div class="sty8933DBusP1Box">
											<xsl:call-template name="FillNameChoice">
												<xsl:with-param name="TargetBusinessName" select="$FormData/GeologicalDisposalSite3rdPYGrp/GeologicalDisposalSiteOwnerGrp[$pos]/FacilityOwnerBusinessName"/>
												<xsl:with-param name="TargetPersonName" select="$FormData/GeologicalDisposalSite3rdPYGrp/GeologicalDisposalSiteOwnerGrp[$pos]/FacilityOwnerPersonNm"/>
											</xsl:call-template>
										</div>
										<div class="sty8933DEINP1Box">
											<xsl:call-template name="FillEINChoice">
												<xsl:with-param name="TargetEIN" select="$FormData/GeologicalDisposalSite3rdPYGrp/GeologicalDisposalSiteOwnerGrp[$pos]/FacilityOwnerEIN"/>
												<xsl:with-param name="TargetSSN" select="$FormData/GeologicalDisposalSite3rdPYGrp/GeologicalDisposalSiteOwnerGrp[$pos]/FacilityOwnerSSN"/>
											</xsl:call-template>
										</div>
										<div class="sty8933DAddP1Box">
											<xsl:call-template name="FillAddressChoice">
												<xsl:with-param name="TargetUSAddress" select="$FormData/GeologicalDisposalSite3rdPYGrp/GeologicalDisposalSiteOwnerGrp[$pos]/FacilityOwnerUSAddress"/>
												<xsl:with-param name="TargetForeignAddress" select="$FormData/GeologicalDisposalSite3rdPYGrp/GeologicalDisposalSiteOwnerGrp[$pos]/FacilityOwnerForeignAddress"/>
											</xsl:call-template>
										</div>
										<div class="sty8933DOpIntP1Box">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="$FormData/GeologicalDisposalSite3rdPYGrp/GeologicalDisposalSiteOwnerGrp[$pos]/OperatingInterestPct"/>
											</xsl:call-template>
										</div>
									</div>
								</div>
							</xsl:for-each>
							<xsl:if test="((count($FormData/GeologicalDisposalSiteCYGrp/GeologicalDisposalSiteOwnerGrp) &lt; 4) and (count($FormData/GeologicalDisposalSite1stPYGrp/GeologicalDisposalSiteOwnerGrp) &lt; 4) and (count($FormData/GeologicalDisposalSite2ndPYGrp/GeologicalDisposalSiteOwnerGrp) &lt; 4) and (count($FormData/GeologicalDisposalSite3rdPYGrp/GeologicalDisposalSiteOwnerGrp) &lt; 4))">
								<xsl:call-template name="P1Filler">
									<xsl:with-param name="Start" select="count($FormData/GeologicalDisposalSite2ndPYGrp/GeologicalDisposalSiteOwnerGrp) + 1"/>
									<xsl:with-param name="End" select="4"/>
								</xsl:call-template>
							</xsl:if>
						</xsl:when>
						<xsl:otherwise>
							<xsl:for-each select="$FormData/GeologicalDisposalSite3rdPYGrp/GeologicalDisposalSiteOwnerGrp">
								<xsl:variable name="pos" select="position()"/>
								<div class="styStdIBDivLS" style="border-top:1px solid black;">
									<div class="styLNLeftLtrBox" style="width:8mm;border-bottom:1px;">
										<xsl:number value="position()" format="A"/>
									</div>
									<div class="sty8933DDescLandscapes" style="width:27.6mm;">
										<div style="width:28mm;border-bottom:1px solid black;height:19mm;">
											<span style="width:5mm;font-weight:bold;float:left;">(i)</span>
											<span style="padding-left:1mm;">Owner's name</span>
										</div>
										<div style="width:28mm;border-bottom:1px solid black;height:10mm;">
											<span style="width:5mm;font-weight:bold;padding-top:0;float:left;">(ii)</span>
											<span style="padding-left:1mm;">Employer<br/> identification<br/> number (EIN)</span>
										</div>
										<div style="width:28mm;border-bottom:1px solid black;height:19mm;">
											<span style="width:5mm;font-weight:bold;float:left;">(iii)</span>
											<span style="padding-left:1mm;">Address</span>
										</div>
										<div style="width:28mm;height:8mm;">
											<span style="width:5mm;font-weight:bold;float:left;">(iv)</span>
											<span style="padding-left:1mm;">Operating<br/> interest (%)</span>
										</div>
									</div>
									<div class="sty8933DP1Box">
										<div class="sty8933DBusP1Box">
											<xsl:call-template name="FillNameChoice">
												<xsl:with-param name="TargetBusinessName" select="$FormData/GeologicalDisposalSiteCYGrp/GeologicalDisposalSiteOwnerGrp[$pos]/FacilityOwnerBusinessName"/>
												<xsl:with-param name="TargetPersonName" select="$FormData/GeologicalDisposalSiteCYGrp/GeologicalDisposalSiteOwnerGrp[$pos]/FacilityOwnerPersonNm"/>
											</xsl:call-template>
										</div>
										<div class="sty8933DEINP1Box">
											<xsl:call-template name="FillEINChoice">
												<xsl:with-param name="TargetEIN" select="$FormData/GeologicalDisposalSiteCYGrp/GeologicalDisposalSiteOwnerGrp[$pos]/FacilityOwnerEIN"/>
												<xsl:with-param name="TargetSSN" select="$FormData/GeologicalDisposalSiteCYGrp/GeologicalDisposalSiteOwnerGrp[$pos]/FacilityOwnerSSN"/>
											</xsl:call-template>
										</div>
										<div class="sty8933DAddP1Box">
											<xsl:call-template name="FillAddressChoice">
												<xsl:with-param name="TargetUSAddress" select="$FormData/GeologicalDisposalSiteCYGrp/GeologicalDisposalSiteOwnerGrp[$pos]/FacilityOwnerUSAddress"/>
												<xsl:with-param name="TargetForeignAddress" select="$FormData/GeologicalDisposalSiteCYGrp/GeologicalDisposalSiteOwnerGrp[$pos]/FacilityOwnerForeignAddress"/>
											</xsl:call-template>
										</div>
										<div class="sty8933DOpIntP1Box">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="$FormData/GeologicalDisposalSiteCYGrp/GeologicalDisposalSiteOwnerGrp[$pos]/OperatingInterestPct"/>
											</xsl:call-template>
										</div>
									</div>
									<div class="sty8933DP1Box">
										<div class="sty8933DBusP1Box">
											<xsl:call-template name="FillNameChoice">
												<xsl:with-param name="TargetBusinessName" select="$FormData/GeologicalDisposalSite1stPYGrp/GeologicalDisposalSiteOwnerGrp[$pos]/FacilityOwnerBusinessName"/>
												<xsl:with-param name="TargetPersonName" select="$FormData/GeologicalDisposalSite1stPYGrp/GeologicalDisposalSiteOwnerGrp[$pos]/FacilityOwnerPersonNm"/>
											</xsl:call-template>
										</div>
										<div class="sty8933DEINP1Box">
											<xsl:call-template name="FillEINChoice">
												<xsl:with-param name="TargetEIN" select="$FormData/GeologicalDisposalSite1stPYGrp/GeologicalDisposalSiteOwnerGrp[$pos]/FacilityOwnerEIN"/>
												<xsl:with-param name="TargetSSN" select="$FormData/GeologicalDisposalSite1stPYGrp/GeologicalDisposalSiteOwnerGrp[$pos]/FacilityOwnerSSN"/>
											</xsl:call-template>
										</div>
										<div class="sty8933DAddP1Box">
											<xsl:call-template name="FillAddressChoice">
												<xsl:with-param name="TargetUSAddress" select="$FormData/GeologicalDisposalSite1stPYGrp/GeologicalDisposalSiteOwnerGrp[$pos]/FacilityOwnerUSAddress"/>
												<xsl:with-param name="TargetForeignAddress" select="$FormData/GeologicalDisposalSite1stPYGrp/GeologicalDisposalSiteOwnerGrp[$pos]/FacilityOwnerForeignAddress"/>
											</xsl:call-template>
										</div>
										<div class="sty8933DOpIntP1Box">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="$FormData/GeologicalDisposalSite1stPYGrp/GeologicalDisposalSiteOwnerGrp[$pos]/OperatingInterestPct"/>
											</xsl:call-template>
										</div>
									</div>
									<div class="sty8933DP1Box">
										<div class="sty8933DBusP1Box">
											<xsl:call-template name="FillNameChoice">
												<xsl:with-param name="TargetBusinessName" select="$FormData/GeologicalDisposalSite2ndPYGrp/GeologicalDisposalSiteOwnerGrp[$pos]/FacilityOwnerBusinessName"/>
												<xsl:with-param name="TargetPersonName" select="$FormData/GeologicalDisposalSite2ndPYGrp/GeologicalDisposalSiteOwnerGrp[$pos]/FacilityOwnerPersonNm"/>
											</xsl:call-template>
										</div>
										<div class="sty8933DEINP1Box">
											<xsl:call-template name="FillEINChoice">
												<xsl:with-param name="TargetEIN" select="$FormData/GeologicalDisposalSite2ndPYGrp/GeologicalDisposalSiteOwnerGrp[$pos]/FacilityOwnerEIN"/>
												<xsl:with-param name="TargetSSN" select="$FormData/GeologicalDisposalSite2ndPYGrp/GeologicalDisposalSiteOwnerGrp[$pos]/FacilityOwnerSSN"/>
											</xsl:call-template>
										</div>
										<div class="sty8933DAddP1Box">
											<xsl:call-template name="FillAddressChoice">
												<xsl:with-param name="TargetUSAddress" select="$FormData/GeologicalDisposalSite2ndPYGrp/GeologicalDisposalSiteOwnerGrp[$pos]/FacilityOwnerUSAddress"/>
												<xsl:with-param name="TargetForeignAddress" select="$FormData/GeologicalDisposalSite2ndPYGrp/GeologicalDisposalSiteOwnerGrp[$pos]/FacilityOwnerForeignAddress"/>
											</xsl:call-template>
										</div>
										<div class="sty8933DOpIntP1Box">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="$FormData/GeologicalDisposalSite2ndPYGrp/GeologicalDisposalSiteOwnerGrp[$pos]/OperatingInterestPct"/>
											</xsl:call-template>
										</div>
									</div>
									<div class="sty8933DP1Box">
										<div class="sty8933DBusP1Box">
											<xsl:call-template name="FillNameChoice">
												<xsl:with-param name="TargetBusinessName" select="$FormData/GeologicalDisposalSite3rdPYGrp/GeologicalDisposalSiteOwnerGrp[$pos]/FacilityOwnerBusinessName"/>
												<xsl:with-param name="TargetPersonName" select="$FormData/GeologicalDisposalSite3rdPYGrp/GeologicalDisposalSiteOwnerGrp[$pos]/FacilityOwnerPersonNm"/>
											</xsl:call-template>
										</div>
										<div class="sty8933DEINP1Box">
											<xsl:call-template name="FillEINChoice">
												<xsl:with-param name="TargetEIN" select="$FormData/GeologicalDisposalSite3rdPYGrp/GeologicalDisposalSiteOwnerGrp[$pos]/FacilityOwnerEIN"/>
												<xsl:with-param name="TargetSSN" select="$FormData/GeologicalDisposalSite3rdPYGrp/GeologicalDisposalSiteOwnerGrp[$pos]/FacilityOwnerSSN"/>
											</xsl:call-template>
										</div>
										<div class="sty8933DAddP1Box">
											<xsl:call-template name="FillAddressChoice">
												<xsl:with-param name="TargetUSAddress" select="$FormData/GeologicalDisposalSite3rdPYGrp/GeologicalDisposalSiteOwnerGrp[$pos]/FacilityOwnerUSAddress"/>
												<xsl:with-param name="TargetForeignAddress" select="$FormData/GeologicalDisposalSite3rdPYGrp/GeologicalDisposalSiteOwnerGrp[$pos]/FacilityOwnerForeignAddress"/>
											</xsl:call-template>
										</div>
										<div class="sty8933DOpIntP1Box">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="$FormData/GeologicalDisposalSite3rdPYGrp/GeologicalDisposalSiteOwnerGrp[$pos]/OperatingInterestPct"/>
											</xsl:call-template>
										</div>
									</div>
								</div>
							</xsl:for-each>
							<xsl:if test="((count($FormData/GeologicalDisposalSiteCYGrp/GeologicalDisposalSiteOwnerGrp) &lt; 4) and (count($FormData/GeologicalDisposalSite1stPYGrp/GeologicalDisposalSiteOwnerGrp) &lt; 4) and (count($FormData/GeologicalDisposalSite2ndPYGrp/GeologicalDisposalSiteOwnerGrp) &lt; 4) and (count($FormData/GeologicalDisposalSite3rdPYGrp/GeologicalDisposalSiteOwnerGrp) &lt; 4))">
								<xsl:call-template name="P1Filler">
									<xsl:with-param name="Start" select="count($FormData/GeologicalDisposalSite3rdPYGrp/GeologicalDisposalSiteOwnerGrp) + 1"/>
									<xsl:with-param name="End" select="4"/>
								</xsl:call-template>
							</xsl:if>
						</xsl:otherwise>
					</xsl:choose>
					<!-- Form footer - page 1-->
					<div class="styStdDivLS pageEnd" style="border-top:2px solid black;">
						<span style="font-weight:bold;">For Paperwork Reduction Act Notice, see the Instructions for Form 8933.</span>
						<span style="margin-left:35mm;">Cat. No. 94875N</span>
						<span style="float:right;">
							<strong>Schedule D (Form 8933) (Rev. 12-2025)</strong>
						</span>
					</div>
					<!-- Page 1 end -->
					<!-- Begin of Page 2 -->
					<div class="styStdDivLS">
						Schedule D (Form 8933) (Rev. 12-2025)
						<span style="float:right;">Page <span style="font-weight:bold;font-size:8pt;">2</span>
						</span>
					</div>
					<!-- Part I - Continued - Information About the Geological Disposal Site -->
					<div class="styStdDivLS" style="border-top:2px solid black;">
						<span class="styPartName">Part I</span>
						<span class="styPartDesc" style="font-size:9pt;">
							<strong>Information About the Geological Disposal Site</strong>
							<span style="font-weight:normal;margin-left:2mm;">
								<i>(continued)</i>
							</span>
						</span>
					</div>
					<!-- Section 2 -->
					<div class="styStdDivLS" style="border-top:1px solid black;padding-top:1px;padding-bottom:1px;font-weight:bold;font-size:8pt;">
						Section 2 &mdash; Information about the geological disposal site or enhanced oil recovery (EOR) project for the year
					</div>
					<!-- Line 2 -->
					<div class="styStdIBDivLS" style="border-top:1px solid black;">
						<div class="styLNLeftNumBoxSD">2</div>
						<div class="sty8933DDescLandscapes" style="height:9mm;">
							<div style="float:left;">Check if the project is:</div>
							<br/>
							<div class="styGenericDiv" style="padding-top:1mm;">
								<strong>(i)</strong>
								<span style="width:1mm;"/>
								<input type="checkbox" class="styCkboxNM" alt="Geological disposal site">
									<xsl:call-template name="PopulateCheckbox">
										<xsl:with-param name="TargetNode" select="$FormData/GeologicalDisposalSiteInd"/>
										<xsl:with-param name="BackupName">GeologicalDisposalSiteInd</xsl:with-param>
									</xsl:call-template>
								</input>
								<span style="width:1mm;"/>
								Geological disposal site
								<span style="width:10mm;"/>
								<strong>(ii)</strong>
								<span style="width:1mm;"/>
								<input type="checkbox" class="styCkboxNM" alt="EOR">
									<xsl:call-template name="PopulateCheckbox">
										<xsl:with-param name="TargetNode" select="$FormData/EORInd"/>
										<xsl:with-param name="BackupName">EORInd</xsl:with-param>
									</xsl:call-template>
								</input>
								<span style="width:1mm;"/>
								EOR
							</div>
						</div>
					</div>
					<!-- Line 3, 4a, 4b -->
					<div class="styStdIBDivLS" style="border-top:1px solid black;min-height:50px;display:flex;">
						<div class="styLNLeftNumBoxSD">3</div>
						<div class="sty8933DDescLandscapes" style="width:80mm;border-right:1px solid black;min-height:50px;">
							Name and location (county and state)<br/>
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/FacilityNameAndLocationTxt"/>
							</xsl:call-template>
						</div>
						<div class="styLNLeftNumBoxSD">4a</div>
						<div class="sty8933DDescLandscapes" style="width:91mm;border-right:1px solid black;min-height:50px;">
							EOR project operator's name<br/>
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/OperatorBusinessName/BusinessNameLine1Txt"/>
							</xsl:call-template>
							<xsl:if test="$FormData/OperatorBusinessName/BusinessNameLine2Txt">
								<br/>
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$FormData/OperatorBusinessName/BusinessNameLine2Txt"/>
								</xsl:call-template>
							</xsl:if>
						</div>
						<div class="styLNLeftNumBoxSD">4b</div>
						<div class="sty8933DDescLandscapes" style="width:44mm;min-height:50px;">
							EOR project operator's EIN<br/>
							<xsl:call-template name="PopulateEIN">
								<xsl:with-param name="TargetNode" select="$FormData/OperatorEIN"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 5 -->
					<div class="styStdIBDivLS" style="min-height:50px;border-top:1px solid black;">
						<div class="styLNLeftNumBoxSD">5</div>
						<div class="sty8933DDescLandscapes" style="">
							Other company(ies) identified as the operator of the project for any other purpose(s) and the nature of the purpose<br/>
							<xsl:choose>
								<xsl:when test="count($FormData/OthCoProjOperatorPurposeGrp) &gt; 1">
									<xsl:call-template name="LinkToLeftoverDataTableInline">
										<xsl:with-param name="TargetNode" select="."/>
										<xsl:with-param name="Desc">PartI - Section2 - Line5 - Company(ies) and purpose(s)</xsl:with-param>
									</xsl:call-template>
								</xsl:when>
								<xsl:otherwise>
									<xsl:for-each select="$FormData/OthCoProjOperatorPurposeGrp">
										<xsl:call-template name="FillNameChoice">
											<xsl:with-param name="TargetBusinessName" select="CompanyName"/>
										</xsl:call-template>
										<br/>
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="OtherPurposeDesc"/>
										</xsl:call-template>
									</xsl:for-each>
								</xsl:otherwise>
							</xsl:choose>
						</div>
					</div>
					<!-- Line 6a, 6b, 7 -->
					<div class="styStdIBDivLS" style="border-top:1px solid black;min-height:12mm;display:flex;">
						<div class="styLNLeftNumBoxSD">6a</div>
						<div class="sty8933DDescLandscapes" style="flex:1;width:82mm;border-right:1px solid black;min-height:12mm;">
							IRS-issued registration number(s) for the geological disposal site<br/>
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/FacilityIRSIssdRegistrationNum"/>
							</xsl:call-template>
						</div>
						<div class="styLNLeftNumBoxSD">6b</div>
						<div class="sty8933DDescLandscapes" style="width:65mm;border-right:1px solid black;min-height:12mm;">
							EPA e-GGRT ID number(s), if available<br/>
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/FacilityEPAeGGRTIdNum"/>
							</xsl:call-template>
						</div>
						<div class="styLNLeftNumBoxSD">7</div>
						<div class="sty8933DDescLandscapes" style="width:85mm;min-height:12mm;">
							Date (MM/YYYY) on which the injection of captured carbon oxide began<br/>
							<span class="sty8933DAmt">
								<xsl:call-template name="PopulateMonthYearForYearMonthType">
									<xsl:with-param name="TargetNode" select="$FormData/CarbonOxideInjectionBeginDt"/>
								</xsl:call-template>
							</span>
						</div>
					</div>
					<!-- Line 8a, 8b -->
					<div class="styStdIBDivLS" style="border-top:1px solid black;min-height:8mm;display:flex;">
						<div class="styLNLeftNumBoxSD">8a</div>
						<div class="sty8933DDescLandscapes" style="width:160mm;border-right:1px solid black;min-height:8mm;">
							If the EOR project was previously certified under section 43, state the name of the certified project<br/>
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/PrevCertifiedProjectNm"/>
							</xsl:call-template>
						</div>
						<div class="styLNLeftNumBoxSD">8b</div>
						<div class="sty8933DDescLandscapes" style="width:80mm;min-height:8mm;">
							Date (MM/YYYY) of the petroleum engineer's certification<br/>
							<span class="sty8933DAmt">
								<xsl:call-template name="PopulateMonthYearForYearMonthType">
									<xsl:with-param name="TargetNode" select="$FormData/PrevCertifiedProjectCertDt"/>
								</xsl:call-template>
							</span>
						</div>
					</div>
					<!-- Line 9 -->
					<div class="styStdIBDivLS" style="border-top:1px solid black;">
						<div class="styLNLeftNumBoxSD">9</div>
						<div class="sty8933DDescLandscapes">If the EOR project wasn't previously certified under section 43, attach a copy of a valid petroleum engineer's certification to this schedule.
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$FormData"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 10 -->
					<div class="styStdIBDivLS">
						<div class="styLNLeftNumBoxSD">10</div>
						<div class="sty8933DDescLandscapes" style="width:222mm;">
							Is this EOR project an enhanced natural gas recovery project?
							<span class="sty8933DDotLn">...................................</span>
						</div>
						<div class="styGenericDiv">
							<xsl:call-template name="PopulateSpan">
								<xsl:with-param name="TargetNode" select="$FormData/EnhancedNaturalGasRcvryProjInd"/>
							</xsl:call-template>
							<!-- Yes checkbox -->
							<input type="checkbox" class="styCkboxNM" style="margin-right:5px;" label="Natural gas recovery project indicator Yes">
								<xsl:call-template name="PopulateYesCheckbox">
									<xsl:with-param name="TargetNode" select="$FormData/EnhancedNaturalGasRcvryProjInd"/>
									<xsl:with-param name="BackupName">EnhancedNaturalGasRcvryProjIndYes</xsl:with-param>
								</xsl:call-template>
							</input>
							<strong>Yes</strong>
							<span style="width:5mm;"/>
							<!-- No checkbox -->
							<input type="checkbox" class="styCkboxNM" style="margin-right:5px;" label="Natural gas recovery project indicator No">
								<xsl:call-template name="PopulateNoCheckbox">
									<xsl:with-param name="TargetNode" select="$FormData/EnhancedNaturalGasRcvryProjInd"/>
									<xsl:with-param name="BackupName">EnhancedNaturalGasRcvryProjIndNo</xsl:with-param>
								</xsl:call-template>
							</input>
							<strong>No</strong>
						</div>
					</div>
					<!-- Line 11 -->
					<div class="styStdIBDivLS" style="height:8mm;">
						<div class="styLNLeftNumBoxSD">11</div>
						<div class="sty8933DDescLandscapes" style="width:247mm;">If the amount of sequestered carbon oxide has been determined pursuant to 40 CFR Part 98 subpart RR, attach a copy of the approved Monitoring, Reporting, and
Verification (MRV) plan or provide the URL of it on the EPA's website.
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$FormData"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 12 -->
					<div class="styStdIBDivLS" style="height:8mm;">
						<div class="styLNLeftNumBoxSD">12</div>
						<div class="sty8933DDescLandscapes" style="width:247mm;">If the amount of sequestered carbon oxide has been determined pursuant to ISO 27916, attach a copy of the ISO 27916 documentation for the tax year. Also attach a copy
of the certification by a qualified independent engineer or geologist.
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$FormData"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Part II - Header - Determination of Recaptured Qualified Carbon Oxide -->
					<div class="styStdDivLS" style="border-top:1px solid black;">
						<span class="styPartName">Part II</span>
						<span class="styPartDesc" style="font-size:9pt;">
							<strong>Determination of Recaptured Qualified Carbon Oxide</strong>
						</span>
					</div>
					<!-- Line 1 -->
					<div class="styStdIBDivLS" style="border-top:1px solid black;">
						<div class="styLNLeftNumBoxSD" style="">1</div>
						<div class="sty8933DDescLandscapes" style="width:203mm;">
							List the total metric tons of qualified carbon oxide securely stored in the geological disposal site or EOR project during the year
							<span class="sty8933DDotLn" style="">..........</span>
						</div>
						<div class="styLNRightNumBox" style="">1</div>
						<div class="styLNAmountBox" style="width:37mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TotMtrcTonsCrbnOxdStorQty"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 2 -->
					<div class="styStdIBDivLS">
						<div class="styLNLeftNumBoxSD" style="height:7mm;">2</div>
						<div class="sty8933DDescLandscapes" style="width:203mm;height:7mm;">
							Metric tons of qualified carbon oxide that, during the year, the owner, operator, or regulatory agency determined has leaked from the
containment area of the reservoir during the year or previous tax years if not previously accounted for
							<span class="sty8933DDotLn" style="">..........................</span>
						</div>
						<div class="styLNRightNumBox" style="height:7mm;">
							<br/>2</div>
						<div class="styLNAmountBox" style="width:37mm;height:7mm;">
							<br/>
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/MtrcTonsCrbnOxdLkdQty"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 3 -->
					<div class="styStdIBDivLS">
						<div class="styLNLeftNumBoxSD" style="height:7mm;">3</div>
						<div class="sty8933DDescLandscapes" style="width:203mm;height:7mm;">
							Metric tons of qualified carbon oxide that, during the year, the owner, operator, or regulatory agency determined has leaked from the containment
area of the reservoir during the year or previous tax years if not previously accounted for, and will eventually migrate to the atmosphere
							<span class="sty8933DDotLn" style="">...........</span>
						</div>
						<div class="styLNRightNumBox" style="height:7mm;">
							<br/>3</div>
						<div class="styLNAmountBox" style="width:37mm;height:7mm;">
							<br/>
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/MtrcTonsCrbnOxdLkdMgrtQty"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 4 -->
					<div class="styStdIBDivLS" style="height:5mm;">
						<div class="styLNLeftNumBoxSD">4</div>
						<div class="sty8933DDescLandscapes" style="width:203mm;height:5mm;">
							If line 3 is less than line 2, attach a statement explaining how you determined that the qualified carbon oxide won't eventually migrate to the
atmosphere.
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$FormData"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBox" style="background-color:lightgrey;border-bottom:0;height:5mm;"/>
						<div class="styLNAmountBox" style="width:37mm;border-bottom:0;height:5mm;"/>
					</div>
					<!-- Line 5 -->
					<div class="styStdIBDivLS">
						<div class="styLNLeftNumBoxSD" style="height:7mm;">5</div>
						<div class="sty8933DDescLandscapes" style="width:203mm;height:7mm;">
							Qualified carbon oxide subject to recapture. Subtract line 1 from line 3. If greater than zero, a recapture event has occurred. See Regulations
section 1.45Q-5(d). Complete the remainder of Part II. Don't complete this schedule if a recapture event didn't occur
							<span class="sty8933DDotLn" style="">....................</span>
						</div>
						<div class="styLNRightNumBox" style="height:7mm;">
							<br/>5</div>
						<div class="styLNAmountBox" style="width:37mm;height:7mm;">
							<br/>
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/SubjectToRecaptureQty"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 6 -->
					<div class="styStdIBDivLS">
						<div class="styLNLeftNumBoxSD">6</div>
						<div class="sty8933DDescLandscapes">Attach a statement describing the cause of the leakage of qualified carbon oxide.
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$FormData"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 7 -->
					<div class="styStdIBDivLS">
						<div class="styLNLeftNumBoxSD">7</div>
						<div class="sty8933DDescLandscapes" style="width:247mm;">Which regulatory agencies were made aware of the leakage of qualified carbon oxide?
							<span style="width:139mm;border-bottom:1px solid black;">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$FormData/RegulatoryAgenciesNameTxt"/>
								</xsl:call-template>
							</span>
						</div>
					</div>
					<!-- Line 8 -->
					<div class="styStdIBDivLS">
						<div class="styLNLeftNumBoxSD">8</div>
						<div class="sty8933DDescLandscapes">Attach a copy of Schedule B (Form 8933) or Schedule C (Form 8933) for this disposal site for each of the previous THREE tax years.
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$FormData"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Form footer - page 2 -->
					<div class="styStdDivLS pageEnd" style="border-top:2px solid black;">
						<span style="float:right;">
							<strong>Schedule D (Form 8933) (Rev. 12-2025)</strong>
						</span>
					</div>
					<!-- Page 2 end -->
					<!-- Begin of Page 3 -->
					<div class="styStdDivLS">
						Schedule D (Form 8933) (Rev. 12-2025)
						<span style="float:right;">Page <span style="font-weight:bold;font-size:8pt;">3</span>
						</span>
					</div>
					<!-- Part II - Header - Determination of Recaptured Qualified Carbon Oxide -->
					<div class="styStdDivLS" style="border-top:2px solid black;">
						<span class="styPartName">Part II</span>
						<span class="styPartDesc" style="font-size:9pt;">
							<strong>Determination of Recaptured Qualified Carbon Oxide</strong>
							<span style="font-weight:normal;margin-left:2mm;">
								<i>(continued)</i>
							</span>
						</span>
					</div>
					<!-- Line 9 -->
					<div class="styStdIBDivLS" style="border-top:1px solid black;font-size:8pt;">
						<div class="styLNLeftNumBoxSD">9</div>
						<div class="sty8933DDescLandscapes">List information about stored carbon oxide subject to recapture.</div>
					</div>
					<!-- Line 9 Table start-->
					<xsl:variable name="shouldSeparate2nd" select="(count($FormData/AllocnCrbnOxdRcptr1stPYGrp/AllocationCrbnOxdRcptrOwnerGrp) &gt;= 1) or (count($FormData/AllocnCrbnOxdRcptr2ndPYGrp/AllocationCrbnOxdRcptrOwnerGrp) &gt;= 1) or (count($FormData/AllocnCrbnOxdRcptr3rdPYGrp/AllocationCrbnOxdRcptrOwnerGrp) &gt;= 1) or (count($FormData/TotAllocnCrbnOxdRcptrGrp/AllocationCrbnOxdRcptrOwnerGrp) &gt;= 1)"/>
					<div class="styTableContainerLandscapeNBB" id="schDp2table1" style="border-top:1px solid black;">
						<xsl:call-template name="SetInitialState"/>
						<table class="styTable" style="border-collapse:collapse;word-wrap:break-word;">
							<thead class="styTableThead">
								<tr>
									<th class="styTableCellHeader" rowspan="5" style="width:20mm;font-weight:normal;" scope="col"/>
									<th class="styTableCellHeader" rowspan="5" style="width:8mm;font-weight:normal;" scope="col">
										<strong>(a)</strong> Year prior
									</th>
									<th class="styTableCellHeader" rowspan="5" style="width:33mm;font-weight:normal;" scope="col">
										<strong>(b)</strong> Metric tons of stored carbon oxide for the indicated year
									</th>
									<th class="styTableCellHeader" rowspan="5" style="width:33mm;font-weight:normal;" scope="col">
										<strong>(c)</strong> Stored carbon oxide subject to recapture
									</th>
									<th class="styTableCellHeader" colspan="6" style="width:auto;font-weight:bold;border-right-width:0px;" scope="colgroup">
										Allocation of stored carbon oxide subject to recapture
									</th>
								</tr>
								<tr>
									<th class="styTableCellHeader" style="width:25mm;font-weight:normal;" scope="col">
										<strong>(d)</strong> Geological disposal site or EOR project
									</th>
									<th class="styTableCellHeader" style="width:25mm;font-weight:normal;" scope="col">
										<strong>(e)</strong> Geological disposal site or EOR project
									</th>
									<th class="styTableCellHeader" style="width:25mm;font-weight:normal;" scope="col">
										<strong>(f)</strong> Geological disposal site or EOR project
									</th>
									<th class="styTableCellHeader" style="width:25mm;font-weight:normal;" scope="col">
										<strong>(g)</strong> Geological disposal site or EOR project
									</th>
									<th class="styTableCellHeader" style="width:25mm;font-weight:normal;" scope="col">
										<strong>(h)</strong> Geological disposal site or EOR project
									</th>
									<th class="styTableCellHeader" rowspan="5" style="width:32mm;font-weight:normal;border-right-width:0;" scope="col">
										<strong>(i)</strong> Total. Add columns (d) through (h)
									</th>
								</tr>
								<tr>
									<th class="styTableCellHeader" style="width:25mm;font-weight:normal;text-align:left;" scope="col">
										<strong>(i)</strong> Owner's name <br/>
									</th>
									<th class="styTableCellHeader" style="width:25mm;font-weight:normal;text-align:left;" scope="col">
										<strong>(i)</strong> Owner's name
									</th>
									<th class="styTableCellHeader" style="width:25mm;font-weight:normal;text-align:left;" scope="col">
										<strong>(i)</strong> Owner's name
									</th>
									<th class="styTableCellHeader" style="width:25mm;font-weight:normal;text-align:left;" scope="col">
										<strong>(i)</strong> Owner's name
									</th>
									<th class="styTableCellHeader" style="width:25mm;font-weight:normal;text-align:left;" scope="col">
										<strong>(i)</strong> Owner's name
									</th>
								</tr>
								<tr>
									<th class="styTableCellHeader" style="width:25mm;font-weight:normal;text-align:left;" scope="col">
										<strong>(ii)</strong> EIN
									</th>
									<th class="styTableCellHeader" style="width:25mm;font-weight:normal;text-align:left;" scope="col">
										<strong>(ii)</strong> EIN
									</th>
									<th class="styTableCellHeader" style="width:25mm;font-weight:normal;text-align:left;" scope="col">
										<strong>(ii)</strong> EIN
									</th>
									<th class="styTableCellHeader" style="width:25mm;font-weight:normal;text-align:left;" scope="col">
										<strong>(ii)</strong> EIN
									</th>
									<th class="styTableCellHeader" style="width:25mm;font-weight:normal;text-align:left;" scope="col">
										<strong>(ii)</strong> EIN
									</th>
								</tr>
								<tr>
									<th class="styTableCellHeader" style="width:25mm;font-weight:normal;text-align:left;" scope="col">
										<strong>(iii)</strong> Check if carbon oxide was qualified carbon oxide
										<input type="checkbox" class="styCkboxNM"/>
									</th>
									<th class="styTableCellHeader" rowspan="2" style="width:25mm;font-weight:normal;text-align:left;" scope="col">
										<strong>(iii)</strong> Check if carbon oxide was qualified carbon oxide
										<input type="checkbox" class="styCkboxNM"/>
									</th>
									<th class="styTableCellHeader" rowspan="2" style="width:25mm;font-weight:normal;text-align:left;" scope="col">
										<strong>(iii)</strong> Check if carbon oxide was qualified carbon oxide
										<input type="checkbox" class="styCkboxNM"/>
									</th>
									<th class="styTableCellHeader" rowspan="2" style="width:25mm;font-weight:normal;text-align:left;" scope="col">
										<strong>(iii)</strong> Check if carbon oxide was qualified carbon oxide
										<input type="checkbox" class="styCkboxNM"/>
									</th>
									<th class="styTableCellHeader" rowspan="2" style="width:25mm;font-weight:normal;text-align:left;" scope="col">
										<strong>(iii)</strong> Check if carbon oxide was qualified carbon oxide
										<input type="checkbox" class="styCkboxNM"/>
									</th>
								</tr>
							</thead>
							<tbody style="overflow:hidden;">
								<!-- AllocnCrbnOxdRcptr1stPYGrp -->
								<tr style="vertical-align:bottom;">
									<td class="styTableCellTextInherit" style="width:25mm;">
										<div class="styLNLeftLtrBox" style="width:8mm;float:left;">A</div>
										<div class="sty8933DDescLandscapes" style="width:15mm;height:6mm;">1st previous tax year</div>
									</td>
									<td class="styTableCellCtrInherit">
										<xsl:call-template name="PopulateYear">
											<xsl:with-param name="TargetNode" select="$FormData/AllocnCrbnOxdRcptr1stPYGrp/PriorYr"/>
										</xsl:call-template>
									</td>
									<td class="styTableCellAmtInherit">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/AllocnCrbnOxdRcptr1stPYGrp/MtrcTonsCrbnOxdQty"/>
										</xsl:call-template>
									</td>
									<td class="styTableCellAmtInherit">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/AllocnCrbnOxdRcptr1stPYGrp/MtrcTonsCrbnOxdRcptrQty"/>
										</xsl:call-template>
									</td>
									<xsl:if test="$shouldSeparate2nd or count($FormData/AllocnCrbnOxdRcptr1stPYGrp/AllocationCrbnOxdRcptrOwnerGrp) &lt; 5">
										<xsl:call-template name="fillTable2">
											<xsl:with-param name="LineNumber" select="1 + count($FormData/AllocnCrbnOxdRcptr1stPYGrp/AllocationCrbnOxdRcptrOwnerGrp)"/>
											<xsl:with-param name="SepMessage" select="$shouldSeparate2nd"/>
										</xsl:call-template>
									</xsl:if>
									<td class="styTableCellAmtInherit" style="border-right-width:0;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/AllocnCrbnOxdRcptr1stPYGrp/TotAllocMtrcTonsRcptrQty"/>
										</xsl:call-template>
									</td>
								</tr>
								<!-- AllocnCrbnOxdRcptr2ndPYGrp -->
								<tr style="vertical-align:bottom;">
									<td class="styTableCellTextInherit" style="width:25mm;">
										<div class="styLNLeftLtrBox" style="width:8mm;float:left;">B</div>
										<div class="sty8933DDescLandscapes" style="width:15mm;height:6mm;">2nd previous tax year</div>
									</td>
									<td class="styTableCellCtrInherit">
										<xsl:call-template name="PopulateYear">
											<xsl:with-param name="TargetNode" select="$FormData/AllocnCrbnOxdRcptr2ndPYGrp/PriorYr"/>
										</xsl:call-template>
									</td>
									<td class="styTableCellAmtInherit">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/AllocnCrbnOxdRcptr2ndPYGrp/MtrcTonsCrbnOxdQty"/>
										</xsl:call-template>
									</td>
									<td class="styTableCellAmtInherit">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/AllocnCrbnOxdRcptr2ndPYGrp/MtrcTonsCrbnOxdRcptrQty"/>
										</xsl:call-template>
									</td>
									<xsl:if test="$shouldSeparate2nd or count($FormData/AllocnCrbnOxdRcptr2ndPYGrp/AllocationCrbnOxdRcptrOwnerGrp) &lt; 5">
										<xsl:call-template name="fillTable2">
											<xsl:with-param name="LineNumber" select="1 + count($FormData/AllocnCrbnOxdRcptr2ndPYGrp/AllocationCrbnOxdRcptrOwnerGrp)"/>
											<xsl:with-param name="SepMessage" select="$shouldSeparate2nd"/>
										</xsl:call-template>
									</xsl:if>
									<td class="styTableCellAmtInherit" style="border-right-width:0;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/AllocnCrbnOxdRcptr2ndPYGrp/TotAllocMtrcTonsRcptrQty"/>
										</xsl:call-template>
									</td>
								</tr>
								<!-- AllocnCrbnOxdRcptr3rdPYGrp -->
								<tr style="vertical-align:bottom;">
									<td class="styTableCellTextInherit" style="width:25mm;">
										<div class="styLNLeftLtrBox" style="width:8mm;float:left;">C</div>
										<div class="sty8933DDescLandscapes" style="width:15mm;height:6mm;">3rd previous tax year</div>
									</td>
									<td class="styTableCellCtrInherit">
										<xsl:call-template name="PopulateYear">
											<xsl:with-param name="TargetNode" select="$FormData/AllocnCrbnOxdRcptr3rdPYGrp/PriorYr"/>
										</xsl:call-template>
									</td>
									<td class="styTableCellAmtInherit">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/AllocnCrbnOxdRcptr3rdPYGrp/MtrcTonsCrbnOxdQty"/>
										</xsl:call-template>
									</td>
									<td class="styTableCellAmtInherit">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/AllocnCrbnOxdRcptr3rdPYGrp/MtrcTonsCrbnOxdRcptrQty"/>
										</xsl:call-template>
									</td>
									<xsl:if test="$shouldSeparate2nd or count($FormData/AllocnCrbnOxdRcptr3rdPYGrp/AllocationCrbnOxdRcptrOwnerGrp) &lt; 5">
										<xsl:call-template name="fillTable2">
											<xsl:with-param name="LineNumber" select="1 + count($FormData/AllocnCrbnOxdRcptr3rdPYGrp/AllocationCrbnOxdRcptrOwnerGrp)"/>
											<xsl:with-param name="SepMessage" select="$shouldSeparate2nd"/>
										</xsl:call-template>
									</xsl:if>
									<td class="styTableCellAmtInherit" style="border-right-width:0;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/AllocnCrbnOxdRcptr3rdPYGrp/TotAllocMtrcTonsRcptrQty"/>
										</xsl:call-template>
									</td>
								</tr>
								<!-- D row -->
								<tr style="vertical-align:bottom;">
									<td class="styTableCellTextInherit" style="width:25mm;">
										<div class="styLNLeftLtrBox" style="width:8mm;float:left;">D</div>
										<div class="sty8933DDescLandscapes" style="width:15mm;height:9mm;">
											<strong>Total.</strong> Add lines 9A through 9C</div>
									</td>
									<td class="styTableCellCtrInherit" style="background-color:lightgray;">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="background-color:lightgray;">&nbsp;</td>
									<td class="styTableCellAmtInherit">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/TotAllocnCrbnOxdRcptrGrp/MtrcTonsCrbnOxdRcptrQty"/>
										</xsl:call-template>
									</td>
									<xsl:if test="$shouldSeparate2nd or count($FormData/TotAllocnCrbnOxdRcptrGrp/AllocationCrbnOxdRcptrOwnerGrp) &lt; 5">
										<xsl:call-template name="fillTable2">
											<xsl:with-param name="LineNumber" select="1 + count($FormData/TotAllocnCrbnOxdRcptrGrp/AllocationCrbnOxdRcptrOwnerGrp)"/>
											<xsl:with-param name="SepMessage" select="$shouldSeparate2nd"/>
										</xsl:call-template>
									</xsl:if>
									<td class="styTableCellAmtInherit" style="border-right-width:0;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/TotAllocnCrbnOxdRcptrGrp/TotAllocMtrcTonsRcptrQty"/>
										</xsl:call-template>
									</td>
								</tr>
								<!-- E row -->
								<tr style="vertical-align:bottom;">
									<td class="styTableCellTextInherit" colspan="3" style="width:25mm;">
										<div class="styLNLeftLtrBox" style="width:8mm;float:left;">E</div>
										<div class="sty8933DDescLandscapes" style="width:55mm;height:11mm;">Metric tons of carbon oxide not
subject to recapture due to lookback being limited to THREE tax years. Subtract Part II, line 5, from line 9D, column (c)
										<span class="sty8933DDotLn">...........</span>
										</div>
									</td>
									<td class="styTableCellAmtInherit">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/MtrcTonsCrbnOxdNotRcptrQty"/>
										</xsl:call-template>
									</td>
									<td class="styTableCellCtrInherit" style="background-color:lightgray;">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="background-color:lightgray;">&nbsp;</td>
									<td class="styTableCellCtrInherit" style="background-color:lightgray;">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="background-color:lightgray;">&nbsp;</td>
									<td class="styTableCellCtrInherit" style="background-color:lightgray;">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="background-color:lightgray;border-right-width:0;">&nbsp;</td>
								</tr>
							</tbody>
						</table>
					</div>
					<!-- Line 9 Table end -->
					<!-- Line 10 -->
					<div class="styStdIBDivLS" style="height:7mm;">
						<div class="styLNLeftNumBoxSD">10</div>
						<div class="sty8933DDescLandscapes" style="width:247mm;">In column (b), list the amount of total carbon oxide stored in each of the THREE tax years prior to the current tax year. This would be from Schedule C (Form 8933), line 20,
column (m), for each year.</div>
					</div>
					<!-- Line 11 -->
					<div class="styStdIBDivLS" style="height:7mm;">
						<div class="styLNLeftNumBoxSD">11</div>
						<div class="sty8933DDescLandscapes" style="width:247mm;">In columns (d) through (h), allocate the amount in column (c) to each owner of the geological disposal site or EOR project for each year. Check the box if the carbon oxide
was qualified. See instructions.</div>
					</div>
					<!-- Line 12 -->
					<div class="styStdIBDivLS">
						<div class="styLNLeftNumBoxSD">12</div>
						<div class="sty8933DDescLandscapes" style="width:242mm;">Check here if the allocation of the amounts in column (c) were figured in a manner other than pro rata and attach an explanatory statement
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$FormData"/>
							</xsl:call-template>
							<span class="sty8933DDotLn">...............</span>
						</div>
						<span style="float:right;margin-right:2mm;">
							<input type="checkbox" class="styCkboxNM" style="border:solid blue;" alt="Allocation indicator stored carbon oxide subject to recapture">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$FormData/AllocationInd"/>
									<xsl:with-param name="BackupName">AllocationInd</xsl:with-param>
								</xsl:call-template>
							</input>
						</span>
					</div>
					<!-- Line 13 -->
					<div class="styStdIBDivLS">
						<div class="styLNLeftNumBoxSD">13</div>
						<div class="sty8933DDescLandscapes">Provide a copy of Parts I and II to each owner of the disposal site or EOR project during the current and THREE previous tax years.
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$FormData"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Form footer - page 3-->
					<div class="styStdDivLS pageEnd" style="border-top:2px solid black;">
						<span style="float:right;">
							<strong>Schedule D (Form 8933) (Rev. 12-2025)</strong>
						</span>
					</div>
					<!-- Page 3 end -->
					<!-- Begin Line 9 Extended Table -->
					<!-- Extended Table -->
					<xsl:if test="($shouldSeparate2nd)">
						<xsl:call-template name="FillPart2Line9PYGrp">
							<xsl:with-param name="FirstPY" select="$FormData/AllocnCrbnOxdRcptr1stPYGrp"/>
							<xsl:with-param name="SecondPY" select="$FormData/AllocnCrbnOxdRcptr2ndPYGrp"/>
							<xsl:with-param name="ThirdPY" select="$FormData/AllocnCrbnOxdRcptr3rdPYGrp"/>
							<xsl:with-param name="ColDTotal" select="$FormData/TotAllocnCrbnOxdRcptrGrp"/>
						</xsl:call-template>
						<!-- Form footer - page 3 extension-->
						<div class="styStdDivLS pageEnd" style="border-top:2px solid black;">
							<span style="float:right;">
								<strong>Schedule D (Form 8933) (Rev. 12-2025)</strong>
							</span>
						</div>
					</xsl:if>
					<!-- Begin of Page 4 -->
					<!-- Loop through page 4 -->
					<xsl:for-each select="$FormData/DetermRcptrCrbnOxdSupplierGrp">
						<xsl:variable name="pos" select="position()"/>
						<div class="styStdDivLS">
							Schedule D (Form 8933) (Rev. 12-2025)
							<span style="float:right;">Page <span style="font-weight:bold;font-size:8pt;">4</span>
							</span>
						</div>
						<!-- Part III - Determination of Recaptured Qualified Carbon Oxide for Supplier -->
						<div class="styStdDivLS" style="border-top:2px solid black;">
							<span class="styPartName">Part III</span>
							<span class="styPartDesc" style="font-size:9pt;">
								<strong>Determination of Recaptured Qualified Carbon Oxide for Supplier</strong>
								<xsl:if test="$pos &gt;= 2"> (#<xsl:value-of select="$pos"/>)</xsl:if>
							</span>
						</div>
						<!-- Note -->
						<div class="styStdDivLS" style="border-top:1px solid black;padding-top:1px;padding-bottom:1px;font-size:8pt;">
							<strong>Note:</strong> Complete a Part III for each supplier. See instructions.
						</div>
						<!-- Section 1 -->
						<div class="styStdDivLS" style="border-top:1px solid black;padding-top:1px;padding-bottom:1px;font-weight:bold;font-size:8pt;">
							Section 1 &mdash; Information about you, the owner of the EOR project
						</div>
						<!-- Line 1, 2 -->
						<div class="styStdIBDivLS" style="border-top:1px solid black;min-height:10mm;display:flex;">
							<div class="styLNLeftNumBoxSD">1</div>
							<div class="sty8933DDescLandscapes" style="width:188mm;border-right:1px solid black;min-height:10mm;">
							Name<br/>
								<xsl:call-template name="FillNameChoice">
									<xsl:with-param name="TargetBusinessName" select="ProjectOwnerBusinessName"/>
									<xsl:with-param name="TargetPersonName" select="ProjectOwnerPersonNm"/>
								</xsl:call-template>
							</div>
							<div class="styLNLeftNumBoxSD">2</div>
							<div class="sty8933DDescLandscapes" style="width:52mm;min-height:10mm;">
							EIN<br/>
								<xsl:call-template name="FillEINChoice">
									<xsl:with-param name="TargetEIN" select="EIN"/>
									<xsl:with-param name="TargetSSN" select="SSN"/>
								</xsl:call-template>
							</div>
						</div>
						<!-- Line 3 -->
						<div class="styStdIBDivLS" style="min-height:10mm;border-top:1px solid black;display:flex;">
							<div class="styLNLeftNumBoxSD">3</div>
							<div class="sty8933DDescLandscapes">
							Address<br/>
								<xsl:call-template name="FillAddressChoice">
									<xsl:with-param name="TargetUSAddress" select="USAddress"/>
									<xsl:with-param name="TargetForeignAddress" select="ForeignAddress"/>
								</xsl:call-template>
							</div>
						</div>
						<!-- Section 2 -->
						<div class="styStdDivLS" style="border-top:1px solid black;padding-top:1px;padding-bottom:1px;font-weight:bold;font-size:8pt;">
							Section 2 &mdash; Information about suppliers who supplied carbon oxide during any of the THREE previous tax years
						</div>
						<!-- Line 4, 5 -->
						<div class="styStdIBDivLS" style="border-top:1px solid black;min-height:10mm;display:flex;">
							<div class="styLNLeftNumBoxSD">4</div>
							<div class="sty8933DDescLandscapes" style="width:188mm;border-right:1px solid black;min-height:10mm;">
							Name<br/>
								<xsl:call-template name="FillNameChoice">
									<xsl:with-param name="TargetBusinessName" select="SupplierName"/>
									<xsl:with-param name="TargetPersonName" select="SupplierPersonNm"/>
								</xsl:call-template>
							</div>
							<div class="styLNLeftNumBoxSD">5</div>
							<div class="sty8933DDescLandscapes" style="width:52mm;min-height:10mm;">
							EIN<br/>
								<xsl:call-template name="FillEINChoice">
									<xsl:with-param name="TargetEIN" select="SupplierEIN"/>
									<xsl:with-param name="TargetSSN" select="SupplierSSN"/>
								</xsl:call-template>
							</div>
						</div>
						<!-- Line 6, 7 -->
						<div class="styStdIBDivLS" style="min-height:10mm;border-top:1px solid black;display:flex;">
							<div class="styLNLeftNumBoxSD">6</div>
							<div class="sty8933DDescLandscapes" style="width:135mm;border-right:1px solid black;min-height:10mm;padding-right:.5mm;">
							Name and location of carbon oxide capture facility (if supplier supplied any qualified carbon oxide)<br/>
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="FacilityNameAndLocationTxt"/>
								</xsl:call-template>
							</div>
							<div class="styLNLeftNumBoxSD">7</div>
							<div class="sty8933DDescLandscapes" style="width:105mm;min-height:10mm;">
							Type of industrial facility at which the supplier captured its qualified carbon oxide<br/>
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="FacilityDesc"/>
								</xsl:call-template>
							</div>
						</div>
						<!-- Line 8 -->
						<div class="styStdIBDivLS" style="border-top:1px solid black;">
							<div class="styLNLeftNumBoxSD">8</div>
							<div class="sty8933DDescLandscapes">Complete Part III, line 8, using information from Schedule C (Form 8933), line 20, for the previous THREE tax years. See instructions.</div>
						</div>
						<!-- Line 8 Table begin -->
						<div class="styTableContainerLandscapeNBB" id="" style="border-top:1px solid black;">
							<xsl:call-template name="SetInitialState"/>
							<table class="styTable" style="border-collapse:collapse;word-wrap:break-word;">
								<thead class="styTableThead">
									<tr>
										<th class="styTableCellHeader" rowspan="5" style="width:20mm;" scope="col"/>
										<th class="styTableCellHeader" rowspan="5" style="width:8mm;font-weight:normal;" scope="col">
											<strong>(a)</strong> Year
										</th>
										<th class="styTableCellHeader" rowspan="5" style="width:26mm;font-weight:normal;" scope="col">
											<strong>(b)</strong> Total metric tons of stored carbon oxide from Part II, line 9
										</th>
										<th class="styTableCellHeader" rowspan="5" style="width:26mm;font-weight:normal;" scope="col">
											<strong>(c)</strong> Total metric tons of stored carbon oxide subject to recapture
										</th>
										<th class="styTableCellHeader" colspan="6" style="width:auto;font-weight:bold;border-right-width:0px;text-align:left;" scope="colgroup">
										Supplier Name:
											<span style="font-weight:normal;">
												<xsl:call-template name="FillNameChoice">
													<xsl:with-param name="TargetBusinessName" select="SupplierName"/>
													<xsl:with-param name="TargetPersonName" select="SupplierPersonNm"/>
												</xsl:call-template>
											</span>
										</th>
									</tr>
									<tr>
										<th class="styTableCellHeader" style="width:31.5mm;font-weight:normal;" scope="col">
											<strong>(d)</strong> Your amount of qualified carbon oxide subject to recapture
										</th>
										<th class="styTableCellHeader" style="width:25.5mm;font-weight:normal;" scope="col">
											<strong>(e)</strong> Rate of carbon oxide sequestration credit for the year ($/MT)
										</th>
										<th class="styTableCellHeader" style="width:31.5mm;font-weight:normal;" scope="col">
											<strong>(f)</strong> Metric tons of carbon oxide for which the supplier elected to allow you to claim the carbon oxide sequestration credit (MT)
										</th>
										<th class="styTableCellHeader" style="width:25.5mm;font-weight:normal;" scope="col">
											<strong>(g)</strong> Amount of carbon oxide sequestration credit for which the supplier elected to allow you to claim the carbon oxide sequestration credit ($). Multiply column (f) by column (e).
										</th>
										<th class="styTableCellHeader" style="width:31.5mm;font-weight:normal;" scope="col">
											<strong>(h)</strong> Metric tons of carbon oxide for which the supplier didn't elect to allow you to claim the carbon oxide sequestration credit (MT). Subtract column (f) from column (d).
										</th>
										<th class="styTableCellHeader" rowspan="5" style="width:25.5mm;font-weight:normal;border-right-width:0;" scope="col">
											<strong>(i)</strong> Amount of carbon oxide sequestration credit for which the supplier didn't elect to allow you to claim the carbon oxide sequestration credit ($). Multiply column (h) by column (e).
										</th>
									</tr>
								</thead>
								<tbody>
									<!-- AllocnCrbnOxdRcptr1stPYGrp -->
									<tr style="vertical-align:bottom;">
										<td class="styTableCellTextInherit" style="width:25mm;">
											<div class="styLNLeftLtrBox" style="width:8mm;float:left;">A</div>
											<div class="sty8933DDescLandscapes" style="width:15mm;height:6mm;">1st previous tax year</div>
										</td>
										<td class="styTableCellCtrInherit">
											<xsl:call-template name="PopulateYear">
												<xsl:with-param name="TargetNode" select="SupplierCrbnOxdRcptr1stPYGrp/PriorYr"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellAmtInherit">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="SupplierCrbnOxdRcptr1stPYGrp/MtrcTonsCrbnOxdQty"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellAmtInherit">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="SupplierCrbnOxdRcptr1stPYGrp/MtrcTonsCrbnOxdRcptrQty"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellAmtInherit">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="SupplierCrbnOxdRcptr1stPYGrp/MtrcTonsCrbnOxdRcptrYourQty"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellAmtInherit">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="SupplierCrbnOxdRcptr1stPYGrp/CrbnOxdSeqCreditRateAmt"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellAmtInherit">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="SupplierCrbnOxdRcptr1stPYGrp/MetricTonsCptrAnotherClmCrQty"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellAmtInherit">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="SupplierCrbnOxdRcptr1stPYGrp/COSCAllwClmCrClmntAmt"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellAmtInherit">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="SupplierCrbnOxdRcptr1stPYGrp/MetricTonsCptrDsallwClmCrQty"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellAmtInherit" style="border-right-width:0;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="SupplierCrbnOxdRcptr1stPYGrp/COSCRetainedAmt"/>
											</xsl:call-template>
										</td>
									</tr>
									<!-- AllocnCrbnOxdRcptr2ndPYGrp -->
									<tr style="vertical-align:bottom;">
										<td class="styTableCellTextInherit" style="width:25mm;">
											<div class="styLNLeftLtrBox" style="width:8mm;float:left;">B</div>
											<div class="sty8933DDescLandscapes" style="width:15mm;height:6mm;">2nd previous tax year</div>
										</td>
										<td class="styTableCellCtrInherit">
											<xsl:call-template name="PopulateYear">
												<xsl:with-param name="TargetNode" select="SupplierCrbnOxdRcptr2ndPYGrp/PriorYr"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellAmtInherit">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="SupplierCrbnOxdRcptr2ndPYGrp/MtrcTonsCrbnOxdQty"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellAmtInherit">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="SupplierCrbnOxdRcptr2ndPYGrp/MtrcTonsCrbnOxdRcptrQty"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellAmtInherit">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="SupplierCrbnOxdRcptr2ndPYGrp/MtrcTonsCrbnOxdRcptrYourQty"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellAmtInherit">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="SupplierCrbnOxdRcptr2ndPYGrp/CrbnOxdSeqCreditRateAmt"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellAmtInherit">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="SupplierCrbnOxdRcptr2ndPYGrp/MetricTonsCptrAnotherClmCrQty"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellAmtInherit">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="SupplierCrbnOxdRcptr2ndPYGrp/COSCAllwClmCrClmntAmt"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellAmtInherit">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="SupplierCrbnOxdRcptr2ndPYGrp/MetricTonsCptrDsallwClmCrQty"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellAmtInherit" style="border-right-width:0;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="SupplierCrbnOxdRcptr2ndPYGrp/COSCRetainedAmt"/>
											</xsl:call-template>
										</td>
									</tr>
									<!-- AllocnCrbnOxdRcptr3rdPYGrp -->
									<tr style="vertical-align:bottom;">
										<td class="styTableCellTextInherit" style="width:25mm;">
											<div class="styLNLeftLtrBox" style="width:8mm;float:left;">C</div>
											<div class="sty8933DDescLandscapes" style="width:15mm;height:6mm;">3rd previous tax year</div>
										</td>
										<td class="styTableCellCtrInherit">
											<xsl:call-template name="PopulateYear">
												<xsl:with-param name="TargetNode" select="SupplierCrbnOxdRcptr3rdPYGrp/PriorYr"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellAmtInherit">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="SupplierCrbnOxdRcptr3rdPYGrp/MtrcTonsCrbnOxdQty"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellAmtInherit">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="SupplierCrbnOxdRcptr3rdPYGrp/MtrcTonsCrbnOxdRcptrQty"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellAmtInherit">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="SupplierCrbnOxdRcptr3rdPYGrp/MtrcTonsCrbnOxdRcptrYourQty"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellAmtInherit">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="SupplierCrbnOxdRcptr3rdPYGrp/CrbnOxdSeqCreditRateAmt"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellAmtInherit">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="SupplierCrbnOxdRcptr3rdPYGrp/MetricTonsCptrAnotherClmCrQty"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellAmtInherit">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="SupplierCrbnOxdRcptr3rdPYGrp/COSCAllwClmCrClmntAmt"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellAmtInherit">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="SupplierCrbnOxdRcptr3rdPYGrp/MetricTonsCptrDsallwClmCrQty"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellAmtInherit" style="border-right-width:0;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="SupplierCrbnOxdRcptr3rdPYGrp/COSCRetainedAmt"/>
											</xsl:call-template>
										</td>
									</tr>
								</tbody>
							</table>
						</div>
						<!-- Line D -->
						<div class="styStdIBDivLS">
							<div class="styLNLeftLtrBox">D</div>
							<div class="sty8933DDescLandscapes" style="width:134mm;">Total metric tons. Add lines 8A through 8C, column (f)
							<span class="sty8933DDotLn">................</span>
							</div>
							<div style="float:right;">
								<div class="styLNAmountBox" style="width:31.5mm;font-size:6pt;padding-right:.5mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="TotMtrcTonsAllowedQty"/>
									</xsl:call-template>
								</div>
								<div class="styLNAmountBox" style="background-color:lightgray;width:25.5mm;">&nbsp;</div>
								<div class="styLNAmountBox" style="background-color:lightgray;width:31.5mm;">&nbsp;</div>
								<div class="styLNAmountBox" style="background-color:lightgray;width:25.5mm;">&nbsp;</div>
							</div>
						</div>
						<!-- Line E -->
						<div class="styStdIBDivLS" style="height:8mm;">
							<div class="styLNLeftLtrBox">E</div>
							<div class="sty8933DDescLandscapes" style="width:164mm;">Amount of carbon oxide sequestration credit you must recapture this year for carbon oxide supplied by this
supplier. Add lines 8A through 8C, column (g). Add to your Form 8933, Part III, line 10
							<span class="sty8933DDotLn">....................</span>
							</div>
							<div style="float:right;">
								<div class="styLNAmountBox" style="height:8mm;vertical-align:bottom;width:25.5mm;font-size:6pt;padding-right:.5mm;">
								<br/>
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="TotalCOSCElectClmAmt"/>
									</xsl:call-template>
								</div>
								<div class="styLNAmountBox" style="background-color:lightgray;height:8mm;width:31.5mm;">&nbsp;</div>
								<div class="styLNAmountBox" style="background-color:lightgray;height:8mm;width:25.5mm;">&nbsp;</div>
							</div>
						</div>
						<!-- Line F -->
						<div class="styStdIBDivLS">
							<div class="styLNLeftLtrBox">F</div>
							<div class="sty8933DDescLandscapes" style="width:190mm;">Total metric tons. Add lines 8A through 8C, column (h)
							<span class="sty8933DDotLn">..............................</span>
							</div>
							<div style="float:right;">
								<div class="styLNAmountBox" style="width:31.5mm;font-size:6pt;padding-right:.5mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="TotMtrcTonsDisallowedQty"/>
									</xsl:call-template>
								</div>
								<div class="styLNAmountBox" style="background-color:lightgray;width:25.5mm;">&nbsp;</div>
							</div>
						</div>
						<!-- Line G -->
						<div class="styStdIBDivLS" style="height:8mm;">
							<div class="styLNLeftLtrBox">G</div>
							<div class="sty8933DDescLandscapes" style="width:219mm;">Amount of carbon oxide sequestration credit the supplier of carbon oxide must recapture this year. Add lines 8A through 8C, column (i). The supplier
must add this amount to its Form 8933, Part III, line 10
							<span class="sty8933DDotLn">.............................................</span>
							</div>
							<div style="float:right;">
								<div class="styLNAmountBox" style="height:8mm;vertical-align:bottom;font-size:6pt;width:25.5mm;border-bottom-width:0;padding-right:.5mm;">
									<br/>
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="CrbnOxdSqstrtnCrRcptrAmt"/>
									</xsl:call-template>
								</div>
							</div>
						</div>
						<xsl:if test="$pos != last()">
							<div class="styStdDivLS pageEnd" style="border-top:2px solid black;">
							<span style="float:right;">
									<strong>Schedule D (Form 8933) (Rev. 12-2025)</strong>
								</span>
							</div>
						</xsl:if>
					</xsl:for-each>
					<!-- When page 4 is optional -->
					<xsl:if test="count($FormData/DetermRcptrCrbnOxdSupplierGrp) &lt; 1">
						<div class="styStdDivLS">
							Schedule D (Form 8933) (Rev. 12-2025)
							<span style="float:right;">Page <span style="font-weight:bold;font-size:8pt;">4</span></span>
						</div>
						<!-- Part III - Determination of Recaptured Qualified Carbon Oxide for Supplier -->
						<div class="styStdDivLS" style="border-top:2px solid black;">
							<span class="styPartName">Part III</span>
							<span class="styPartDesc" style="font-size:9pt;">
								<strong>Determination of Recaptured Qualified Carbon Oxide for Supplier</strong>
							</span>
						</div>
						<!-- Note -->
						<div class="styStdDivLS" style="border-top:1px solid black;padding-top:1px;padding-bottom:1px;font-size:8pt;">
							<strong>Note:</strong> Complete a Part III for each supplier. See instructions.
						</div>
						<!-- Section 1 -->
						<div class="styStdDivLS" style="border-top:1px solid black;padding-top:1px;padding-bottom:1px;font-weight:bold;font-size:8pt;">
							Section 1 &mdash; Information about you, the owner of the EOR project
						</div>
						<!-- Line 1, 2 -->
						<div class="styStdIBDivLS" style="border-top:1px solid black;min-height:10mm;">
							<div class="styLNLeftNumBoxSD">1</div>
							<div class="sty8933DDescLandscapes" style="width:188mm;border-right:1px solid black;min-height:10mm;">
								Name<br/>
							</div>
							<div class="styLNLeftNumBoxSD">2</div>
							<div class="sty8933DDescLandscapes" style="width:52mm;min-height:10mm;">
								EIN<br/>
							</div>
						</div>
						<!-- Line 3 -->
						<div class="styStdIBDivLS" style="height:10mm;border-top:1px solid black;">
							<div class="styLNLeftNumBoxSD">3</div>
							<div class="sty8933DDescLandscapes">
								Address<br/>
							</div>
						</div>
						<!-- Section 2 -->
						<div class="styStdDivLS" style="border-top:1px solid black;padding-top:1px;padding-bottom:1px;font-weight:bold;font-size:8pt;">
							Section 2 &mdash; Information about suppliers who supplied carbon oxide during any of the THREE previous tax years
						</div>
						<!-- Line 4, 5 -->
						<div class="styStdIBDivLS" style="border-top:1px solid black;min-height:10mm;">
							<div class="styLNLeftNumBoxSD">4</div>
							<div class="sty8933DDescLandscapes" style="width:188mm;border-right:1px solid black;min-height:10mm;">
							Name<br/>
							</div>
							<div class="styLNLeftNumBoxSD">5</div>
							<div class="sty8933DDescLandscapes" style="width:52mm;min-height:10mm;">
							EIN<br/>
							</div>
						</div>
						<!-- Line 6, 7 -->
						<div class="styStdIBDivLS" style="min-height:10mm;border-top:1px solid black;">
							<div class="styLNLeftNumBoxSD">6</div>
							<div class="sty8933DDescLandscapes" style="width:135mm;border-right:1px solid black;min-height:10mm;">
							Name and location of carbon oxide capture facility (if supplier supplied any qualified carbon oxide)<br/>
							</div>
							<div class="styLNLeftNumBoxSD">7</div>
							<div class="sty8933DDescLandscapes" style="width:105mm;min-height:10mm;">
							Type of industrial facility at which the supplier captured its qualified carbon oxide<br/>
							</div>
						</div>
						<!-- Line 8 -->
						<div class="styStdIBDivLS" style="border-top:1px solid black;">
							<div class="styLNLeftNumBoxSD">8</div>
							<div class="sty8933DDescLandscapes">Complete Part III, line 8, using information from Schedule C (Form 8933), line 20, for the previous THREE tax years. See instructions.</div>
						</div>
						<!-- Line 8 Table begin -->
						<div class="styTableContainerLandscapeNBB" id="schDp2table1" style="border-top:1px solid black;">
							<xsl:call-template name="SetInitialState"/>
							<table class="styTable" style="border-collapse:collapse;word-wrap:break-word;">
								<thead class="styTableThead">
									<tr>
										<th class="styTableCellHeader" rowspan="5" style="width:18mm;font-weight:normal;" scope="col"/>
										<th class="styTableCellHeader" rowspan="5" style="width:8mm;font-weight:normal;" scope="col">
											<strong>(a)</strong> Year
										</th>
											<th class="styTableCellHeader" rowspan="5" style="width:20mm;font-weight:normal;" scope="col">
												<strong>(b)</strong> Total metric tons of stored carbon oxide from Part II, line 9
										</th>
											<th class="styTableCellHeader" rowspan="5" style="width:20mm;font-weight:normal;" scope="col">
												<strong>(c)</strong> Total metric tons of stored carbon oxide subject to recapture
										</th>
											<th class="styTableCellHeader" colspan="6" style="width:auto;font-weight:bold;border-right-width:0px;text-align:left;" scope="colgroup">
											Supplier Name:
										</th>
									</tr>
									<tr>
										<th class="styTableCellHeader" style="width:28mm;font-weight:normal;" scope="col">
											<strong>(d)</strong> Your amount of qualified carbon oxide subject to recapture
										</th>
										<th class="styTableCellHeader" style="width:28mm;font-weight:normal;" scope="col">
											<strong>(e)</strong> Rate of carbon oxide sequestration credit for the year ($/MT)
										</th>
										<th class="styTableCellHeader" style="width:32mm;font-weight:normal;" scope="col">
											<strong>(f)</strong> Metric tons of carbon oxide for which the supplier elected to allow you to claim the carbon oxide sequestration credit (MT)
										</th>
										<th class="styTableCellHeader" style="width:32mm;font-weight:normal;" scope="col">
											<strong>(g)</strong> Amount of carbon oxide sequestration credit for which the supplier elected to allow you to claim the carbon oxide sequestration credit ($). Multiply column (f) by column (e).
										</th>
										<th class="styTableCellHeader" style="width:32mm;font-weight:normal;" scope="col">
											<strong>(h)</strong> Metric tons of carbon oxide for which the supplier didn't elect to allow you to claim the carbon oxide sequestration credit (MT). Subtract column (f) from column (d).
										</th>
										<th class="styTableCellHeader" rowspan="5" style="width:32mm;font-weight:normal;border-right-width:0;" scope="col">
											<strong>(i)</strong> Amount of carbon oxide sequestration credit for which the supplier didn't elect to allow you to claim the carbon oxide sequestration credit ($). Multiply column (h) by column (e).
										</th>
									</tr>
								</thead>
								<tbody>
									<!-- AllocnCrbnOxdRcptr1stPYGrp -->
									<tr style="vertical-align:bottom;">
										<td class="styTableCellTextInherit" style="width:25mm;">
											<div class="styLNLeftLtrBox" style="width:8mm;float:left;">A</div>
											<div class="sty8933DDescLandscapes" style="width:15mm;height:6mm;">1st previous tax year</div>
										</td>
										<td class="styTableCellCtrInherit">&nbsp;</td>
										<td class="styTableCellAmtInherit">&nbsp;</td>
										<td class="styTableCellAmtInherit">&nbsp;</td>
										<td class="styTableCellAmtInherit">&nbsp;</td>
										<td class="styTableCellAmtInherit">&nbsp;</td>
										<td class="styTableCellAmtInherit">&nbsp;</td>
										<td class="styTableCellAmtInherit">&nbsp;</td>
										<td class="styTableCellAmtInherit">&nbsp;</td>
										<td class="styTableCellAmtInherit" style="border-right-width:0;">&nbsp;</td>
									</tr>
									<!-- AllocnCrbnOxdRcptr2ndPYGrp -->
									<tr style="vertical-align:bottom;">
										<td class="styTableCellTextInherit" style="width:25mm;">
											<div class="styLNLeftLtrBox" style="width:8mm;float:left;">B</div>
											<div class="sty8933DDescLandscapes" style="width:15mm;height:6mm;">2nd previous tax year</div>
										</td>
										<td class="styTableCellCtrInherit">&nbsp;</td>
										<td class="styTableCellAmtInherit">&nbsp;</td>
										<td class="styTableCellAmtInherit">&nbsp;</td>
										<td class="styTableCellAmtInherit">&nbsp;</td>
										<td class="styTableCellAmtInherit">&nbsp;</td>
										<td class="styTableCellAmtInherit">&nbsp;</td>
										<td class="styTableCellAmtInherit">&nbsp;</td>
										<td class="styTableCellAmtInherit">&nbsp;</td>
										<td class="styTableCellAmtInherit" style="border-right-width:0;">&nbsp;</td>
									</tr>
									<!-- AllocnCrbnOxdRcptr3rdPYGrp -->
									<tr style="vertical-align:bottom;">
										<td class="styTableCellTextInherit" style="width:25mm;">
											<div class="styLNLeftLtrBox" style="width:8mm;float:left;">C</div>
											<div class="sty8933DDescLandscapes" style="width:15mm;height:6mm;">3rd previous tax year</div>
										</td>
										<td class="styTableCellCtrInherit">&nbsp;</td>
										<td class="styTableCellAmtInherit">&nbsp;</td>
										<td class="styTableCellAmtInherit">&nbsp;</td>
										<td class="styTableCellAmtInherit">&nbsp;</td>
										<td class="styTableCellAmtInherit">&nbsp;</td>
										<td class="styTableCellAmtInherit">&nbsp;</td>
										<td class="styTableCellAmtInherit">&nbsp;</td>
										<td class="styTableCellAmtInherit">&nbsp;</td>
										<td class="styTableCellAmtInherit" style="border-right-width:0;">&nbsp;</td>
									</tr>
								</tbody>
							</table>
						</div>
						<!-- Line D -->
						<div class="styStdIBDivLS">
							<div class="styLNLeftLtrBox">D</div>
							<div class="sty8933DDescLandscapes" style="width:115mm;">Total metric tons. Add lines 8A through 8C, column (f)
							<span class="sty8933DDotLn">...........</span>
							</div>
							<div style="float:right;">
								<div class="styLNAmountBox" style="">&nbsp;</div>
								<div class="styLNAmountBox" style="background-color:lightgray;">&nbsp;</div>
								<div class="styLNAmountBox" style="background-color:lightgray;">&nbsp;</div>
								<div class="styLNAmountBox" style="background-color:lightgray;">&nbsp;</div>
							</div>
						</div>
						<!-- Line E -->
						<div class="styStdIBDivLS" style="height:8mm;">
							<div class="styLNLeftLtrBox">E</div>
							<div class="sty8933DDescLandscapes" style="width:150mm;">Amount of carbon oxide sequestration credit you must recapture this year for carbon oxide supplied by this
supplier. Add lines 8A through 8C, column (g). Add to your Form 8933, Part III, line 10
							<span class="sty8933DDotLn">............</span>
							</div>
							<div style="float:right;">
								<div class="styLNAmountBox" style="height:8mm;vertical-align:bottom;">&nbsp;</div>
								<div class="styLNAmountBox" style="background-color:lightgray;height:8mm;">&nbsp;</div>
								<div class="styLNAmountBox" style="background-color:lightgray;height:8mm;">&nbsp;</div>
							</div>
						</div>
						<!-- Line F -->
						<div class="styStdIBDivLS">
							<div class="styLNLeftLtrBox">F</div>
							<div class="sty8933DDescLandscapes" style="width:180mm;">Total metric tons. Add lines 8A through 8C, column (h)
							<span class="sty8933DDotLn">...........................</span>
							</div>
							<div style="float:right;">
								<div class="styLNAmountBox">&nbsp;</div>
								<div class="styLNAmountBox" style="background-color:lightgray;">&nbsp;</div>
							</div>
						</div>
						<!-- Line G -->
						<div class="styStdIBDivLS" style="height:8mm;">
							<div class="styLNLeftLtrBox">G</div>
							<div class="sty8933DDescLandscapes" style="width:215mm;">Amount of carbon oxide sequestration credit the supplier of carbon oxide must recapture this year. Add lines 8A through 8C, column (i). The supplier
must add this amount to its Form 8933, Part III, line 10
							<span class="sty8933DDotLn">...........................................</span>
							</div>
							<div style="float:right;">
								<div class="styLNAmountBox" style="height:8mm;vertical-align:bottom;border-bottom-width:0;">&nbsp;</div>
							</div>
						</div>
					</xsl:if>
					<!-- Form footer - page 4-->
					<div class="styStdDivLS pageEnd" style="border-top:2px solid black;">
						<span style="float:right;">
							<strong>Schedule D (Form 8933) (Rev. 12-2025)</strong>
						</span>
					</div>
					<!-- Page 4 end -->
					<!-- Additonal Data Title Bar and Button -->
					<div class="styLeftOverTitleLineLandscape" id="LeftoverData">
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
					</table>
					<!-- Part I - Section 2 - Line 5 - Separated table -->
					<xsl:if test="count($FormData/OthCoProjOperatorPurposeGrp) &gt; 1">
						<br/>
						<br/>
						<span class="styRepeatingDataTitle">Part I - Section 2 - Line 5 - Company(ies) and purpose(s)</span>
						<br/>
						<table class="styDepTblLandscape" cellspacing="0" style="font-size:7pt;">
							<thead class="styTableThead">
								<tr class="styDepTblHdr">
									<th class="styDepTblCell" style="height:6mm;font-weight:normal;">
                                        Company<br/>
									</th>
									<th class="styDepTblCell" style="font-weight:normal;border-right-width:0px;">
                                        Purpose<br/>
									</th>
								</tr>
							</thead>
							<tbody>
								<xsl:for-each select="$FormData/OthCoProjOperatorPurposeGrp">
									<tr>
										<xsl:attribute name="class">
											<xsl:choose>
												<xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when>
												<xsl:otherwise>styDepTblRow2</xsl:otherwise>
											</xsl:choose>
										</xsl:attribute>
										<td class="styTableCellTextInherit">
											<xsl:call-template name="FillNameChoice">
												<xsl:with-param name="TargetBusinessName" select="CompanyName"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellTextInherit" style="border-right-width:0px;">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="OtherPurposeDesc"/>
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
	<xsl:template name="P1Filler">
		<xsl:param name="Start"/>
		<xsl:param name="End" select="4"/>
		<xsl:param name="Sep" select="false()"/>
		<xsl:variable name="letter">
			<xsl:choose>
				<xsl:when test="$Sep">a</xsl:when>
				<xsl:otherwise>
					<xsl:number format="A" value="$Start"/>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>
		<div class="styStdIBDivLS" style="border-top:1px solid black;">
			<div class="styLNLeftLtrBox">
				<xsl:value-of select="$letter"/>
			</div>
			<div class="sty8933DDescLandscapes" style="width:27.6mm;height:33mm;">
				<div style="width:28mm;border-bottom:1px solid black;height:4mm;">
					<span style="width:5mm;font-weight:bold;float:left;">(i)</span>
					<span style="padding-left:1mm;">Owner's name</span>
				</div>
				<div style="width:28mm;border-bottom:1px solid black;height:10mm;">
					<span style="width:5mm;font-weight:bold;padding-top:0;float:left;">(ii)</span>
					<span style="padding-left:1mm;">Employer<br/> identification<br/> number (EIN)</span>
				</div>
				<div style="width:28mm;border-bottom:1px solid black;height:10mm;">
					<span style="width:5mm;font-weight:bold;float:left;">(iii)</span>
					<span style="padding-left:1mm;">Address</span>
				</div>
				<div style="width:28mm;height:8mm;">
					<span style="width:5mm;font-weight:bold;float:left;">(iv)</span>
					<span style="padding-left:1mm;">Operating<br/> interest (%)</span>
				</div>
			</div>
			<div class="sty8933DP1Box" style="height:33mm;">
				<div style="width:55mm;border-bottom:1px solid black;height:4mm;">
					&nbsp;
				</div>
				<div style="width:55mm;border-bottom:1px solid black;height:10mm;">
					&nbsp;
				</div>
				<div style="width:55mm;border-bottom:1px solid black;height:10mm;">
					&nbsp;
				</div>
				<div style="width:55mm;height:8mm;">
					&nbsp;
				</div>
			</div>
			<div class="sty8933DP1Box" style="height:33mm;">
				<div style="width:55mm;border-bottom:1px solid black;height:4mm;">
					&nbsp;
				</div>
				<div style="width:55mm;border-bottom:1px solid black;height:10mm;">
					&nbsp;
				</div>
				<div style="width:55mm;border-bottom:1px solid black;height:10mm;">
					&nbsp;
				</div>
				<div style="width:55mm;height:8mm;">
					&nbsp;
				</div>
			</div>
			<div class="sty8933DP1Box" style="height:33mm;">
				<div style="width:55mm;border-bottom:1px solid black;height:4mm;">
					&nbsp;
				</div>
				<div style="width:55mm;border-bottom:1px solid black;height:10mm;">
					&nbsp;
				</div>
				<div style="width:55mm;border-bottom:1px solid black;height:10mm;">
					&nbsp;
				</div>
				<div style="width:55mm;height:8mm;">
					&nbsp;
				</div>
			</div>
			<div class="sty8933DP1Box" style="height:33mm;">
				<div style="width:55mm;border-bottom:1px solid black;height:4mm;">
					&nbsp;
				</div>
				<div style="width:55mm;border-bottom:1px solid black;height:10mm;">
					&nbsp;
				</div>
				<div style="width:55mm;border-bottom:1px solid black;height:10mm;">
					&nbsp;
				</div>
				<div style="width:55mm;height:8mm;">
					&nbsp;
				</div>
			</div>
		</div>
		<xsl:choose>
			<xsl:when test="$Start &lt; $End">
				<xsl:call-template name="P1Filler">
					<xsl:with-param name="Start" select="$Start + 1"/>
					<xsl:with-param name="End" select="$End"/>
				</xsl:call-template>
			</xsl:when>
			<xsl:otherwise/>
		</xsl:choose>
	</xsl:template>
	<xsl:template name="fillTable2">
		<xsl:param name="LineNumber"/>
		<xsl:param name="SepMessage" select="false()"/>
		<xsl:param name="BoxType"/>
		<xsl:param name="MaxLine" select="5"/>
		<xsl:choose>
			<xsl:when test="$BoxType = 'Name'">
				<th class="styTableCellHeader" style="width:46mm;font-weight:normal;text-align:left;" scope="col">
					<strong>(i)</strong> Owner's name<br/>&nbsp;</th>
			</xsl:when>
			<xsl:when test="$BoxType = 'EIN'">
				<th class="styTableCellHeader" style="width:46mm;font-weight:normal;text-align:left;" scope="col">
					<strong>(ii)</strong> EIN<br/>
				</th>
			</xsl:when>
			<xsl:when test="$BoxType = 'Checkbox'">
				<th class="styTableCellHeader" style="width:46mm;font-weight:normal;text-align:left;" scope="col">
					<strong>(iii)</strong> Check if carbon oxide was qualified carbon oxide
					<input type="checkbox" class="styCkboxNM" style="margin-right:2px;" alt="Qualified carbon oxide checkbox">
					&nbsp;</input>
				</th>
			</xsl:when>
			<xsl:otherwise>
				<td class="styTableCellAmtInherit">
					<xsl:choose>
						<xsl:when test="$SepMessage">
							See Line 9 <br/> Extended Table
						</xsl:when>
						<xsl:otherwise>&nbsp;</xsl:otherwise>
					</xsl:choose>
				</td>
			</xsl:otherwise>
		</xsl:choose>
		<xsl:choose>
			<xsl:when test="$SepMessage">
				<xsl:call-template name="fillTable2">
					<xsl:with-param name="LineNumber" select="2"/>
					<xsl:with-param name="SepMessage" select="false()"/>
				</xsl:call-template>
			</xsl:when>
			<xsl:when test="$LineNumber &lt; $MaxLine">
				<xsl:call-template name="fillTable2">
					<xsl:with-param name="LineNumber" select="$LineNumber + 1"/>
					<xsl:with-param name="BoxType" select="$BoxType"/>
					<xsl:with-param name="MaxLine" select="$MaxLine"/>
				</xsl:call-template>
			</xsl:when>
			<xsl:otherwise/>
		</xsl:choose>
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
	<xsl:template name="FillEINChoice">
		<xsl:param name="TargetEIN"/>
		<xsl:param name="TargetSSN"/>
		<xsl:choose>
			<xsl:when test="$TargetEIN">
				<xsl:call-template name="PopulateEIN">
					<xsl:with-param name="TargetNode" select="$TargetEIN"/>
				</xsl:call-template>
			</xsl:when>
			<xsl:otherwise>
				<xsl:call-template name="PopulateSSN">
					<xsl:with-param name="TargetNode" select="$TargetSSN"/>
				</xsl:call-template>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>	
	<xsl:template name="FillAddressChoice">
		<xsl:param name="TargetUSAddress"/>
		<xsl:param name="TargetForeignAddress"/>
		<xsl:choose>
			<xsl:when test="$TargetUSAddress">
				<xsl:call-template name="PopulateUSAddressTemplate">
					<xsl:with-param name="TargetNode" select="$TargetUSAddress"/>
				</xsl:call-template>
			</xsl:when>
			<xsl:otherwise>
				<xsl:call-template name="PopulateForeignAddressTemplate">
					<xsl:with-param name="TargetNode" select="$TargetForeignAddress"/>
				</xsl:call-template>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>	
	<xsl:template name="FillPart2Line9PYGrp">
		<xsl:param name="FirstPY"/>
		<xsl:param name="SecondPY"/>
		<xsl:param name="ThirdPY"/>
		<xsl:param name="ColDTotal"/>
		<div class="styStdDivLS">
							Schedule C (Form 8933) (Rev. 12-2025)
							<div style="float:right;">
								Page <span style="font-weight:bold;font-size:8pt;">3</span>
			</div>
		</div>
		<div class="styStdDivLS" style="border-top:2px solid black;">
			<div class="styPartName">Part II</div>
			<div class="styPartDesc">Line 9 Extended Table</div>
		</div>
		<xsl:variable name="repeat5times" select="5"/>
		<xsl:if test="$FirstPY">
			<div class="styTableContainerLandscapeNBB" id="schAp1table1" style="border-top:1px solid black;">
				<xsl:call-template name="SetInitialState"/>
				<table class="styTable" style="border-collapse:collapse;">
					<thead class="styTableThead">
						<tr>
							<th class="styTableCellHeader" rowspan="4" style="width:25.8mm;font-weight:normal;text-align:left;" scope="col">&nbsp;</th>
							<th class="styTableCellHeader" style="width:46mm;font-weight:normal;" scope="col">
								<strong>(d)</strong> Geological disposal site or EOR project
									</th>
							<th class="styTableCellHeader" style="width:46mm;font-weight:normal;" scope="col">
								<strong>(e)</strong> Geological disposal site or EOR project
									</th>
							<th class="styTableCellHeader" style="width:46mm;font-weight:normal;" scope="col">
								<strong>(f)</strong> Geological disposal site or EOR project
									</th>
							<th class="styTableCellHeader" style="width:46mm;font-weight:normal;" scope="col">
								<strong>(g)</strong> Geological disposal site or EOR project
									</th>
							<th class="styTableCellHeader" style="width:46mm;font-weight:normal;" scope="col">
								<strong>(h)</strong> Geological disposal site or EOR project
							</th>
							<th class="" rowspan="4" style="width:1mm;border-right:0;border-bottom:0;line-height:1;overflow:hidden;font-weight:normal;font-size:6pt;white-space:nowrap;" scope="col">E<br/>x<br/>t<br/>e<br/>n<br/>d<br/>e<br/>d<br/><br/>A</th>
						</tr>
						<tr style="vertical-align:top;">
							<xsl:for-each select="$FirstPY/AllocationCrbnOxdRcptrOwnerGrp[position() &lt;= $repeat5times]">
							<xsl:variable name="pos" select="position()"/>
							
								<th class="styTableCellHeader" style="font-weight:normal;text-align:left;" scope="col">
									<strong>(i)</strong> Owner's name<br/>
									<xsl:call-template name="FillNameChoice">
										<xsl:with-param name="TargetBusinessName" select="$FirstPY/AllocationCrbnOxdRcptrOwnerGrp[$pos]/FacilityOwnerBusinessName"/>
										<xsl:with-param name="TargetPersonName" select="$FirstPY/AllocationCrbnOxdRcptrOwnerGrp[$pos]/FacilityOwnerPersonNm"/>
									</xsl:call-template>
								</th>
							</xsl:for-each>
							<xsl:if test="count($FirstPY/AllocationCrbnOxdRcptrOwnerGrp) &lt; 5">
								<xsl:call-template name="fillTable2">
									<xsl:with-param name="LineNumber" select="count($FirstPY/AllocationCrbnOxdRcptrOwnerGrp) + 1"/>
									<xsl:with-param name="BoxType">Name</xsl:with-param>
								</xsl:call-template>
							</xsl:if>
						</tr>
						<tr style="vertical-align:top;">
							<xsl:for-each select="$FirstPY/AllocationCrbnOxdRcptrOwnerGrp[position() &lt;= $repeat5times]">
								<th class="styTableCellHeader" style="font-weight:normal;text-align:left;" scope="col">
									<xsl:variable name="pos" select="position()"/>
									<strong>(ii)</strong> EIN<br/>
									<xsl:call-template name="FillEINChoice">
										<xsl:with-param name="TargetEIN" select="$FirstPY/AllocationCrbnOxdRcptrOwnerGrp[$pos]/FacilityOwnerEIN"/>
										<xsl:with-param name="TargetSSN" select="$FirstPY/AllocationCrbnOxdRcptrOwnerGrp[$pos]/FacilityOwnerSSN"/>
									</xsl:call-template>
								</th>
							</xsl:for-each>
							<xsl:if test="count($FirstPY/AllocationCrbnOxdRcptrOwnerGrp) &lt; 5">
								<xsl:call-template name="fillTable2">
									<xsl:with-param name="LineNumber" select="count($FirstPY/AllocationCrbnOxdRcptrOwnerGrp) + 1"/>
									<xsl:with-param name="BoxType">EIN</xsl:with-param>
								</xsl:call-template>
							</xsl:if>
						</tr>
						<tr>
							<xsl:for-each select="$FirstPY/AllocationCrbnOxdRcptrOwnerGrp[position() &lt;= $repeat5times]">
								<th class="styTableCellHeader" style="font-weight:normal;text-align:left;" scope="col">
									<xsl:variable name="pos" select="position()"/>
									<strong>(iii)</strong> Check if carbon oxide was qualified carbon oxide
									<input type="checkbox" class="styCkboxNM" style="margin-right:2px;right:0;" alt="Qualified carbon oxide checkbox">
										<xsl:call-template name="PopulateCheckbox">
											<xsl:with-param name="TargetNode" select="$FirstPY/AllocationCrbnOxdRcptrOwnerGrp[$pos]/QlfyCrbnOxdInd"/>
											<xsl:with-param name="BackupName">QlfyCrbnOxdInd<xsl:value-of select="$pos"/>
											</xsl:with-param>
										</xsl:call-template>
									</input>
								</th>
							</xsl:for-each>
							<xsl:if test="count($FirstPY/AllocationCrbnOxdRcptrOwnerGrp) &lt; 5">
								<xsl:call-template name="fillTable2">
									<xsl:with-param name="LineNumber" select="count($FirstPY/AllocationCrbnOxdRcptrOwnerGrp) + 1"/>
									<xsl:with-param name="BoxType">Checkbox</xsl:with-param>
								</xsl:call-template>
							</xsl:if>
						</tr>
					</thead>
					<tbody>
						<tr style="vertical-align:bottom;">
							<td class="styTableCellTextInherit" style="width:25.8mm;">
								<div class="styLNLeftLtrBox" style="width:8mm;float:left;">A</div>
								<div class="styLNDescLandscape" style="width:15mm;height:6mm;">1st previous tax year</div>
							</td>
							<xsl:variable name="shouldSeparate2nd2" select="(count($FirstPY/AllocationCrbnOxdRcptrOwnerGrp) = 5)"/>
							<xsl:for-each select="$FirstPY/AllocationCrbnOxdRcptrOwnerGrp[position() &lt;= $repeat5times]">
								<xsl:variable name="pos" select="position()"/>
								<td class="styTableCellAmtInherit">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="MtrcTonsCrbnOxdRcptrQty"/>
									</xsl:call-template>
								</td>
							</xsl:for-each>
							<xsl:if test="not($shouldSeparate2nd2)">
								<xsl:call-template name="fillTable2">
									<xsl:with-param name="LineNumber" select="count($FirstPY/AllocationCrbnOxdRcptrOwnerGrp) + 1"/>
									<xsl:with-param name="SepMessage" select="$shouldSeparate2nd2"/>
								</xsl:call-template>
							</xsl:if>
						</tr>
					</tbody>
				</table>
			</div>
		</xsl:if>
		<xsl:if test="$SecondPY">
			<div class="styTableContainerLandscapeNBB" id="schAp1table1" style="border-top:1px solid black;">
				<xsl:call-template name="SetInitialState"/>
				<table class="styTable" style="border-collapse:collapse;">
					<thead class="styTableThead">
						<tr>
							<th class="styTableCellHeader" rowspan="4" style="width:25.8mm;font-weight:normal;text-align:left;" scope="col">&nbsp;</th>
							<th class="styTableCellHeader" style="width:46mm;font-weight:normal;" scope="col">
								<strong>(d)</strong> Geological disposal site or EOR project
									</th>
							<th class="styTableCellHeader" style="width:46mm;font-weight:normal;" scope="col">
								<strong>(e)</strong> Geological disposal site or EOR project
									</th>
							<th class="styTableCellHeader" style="width:46mm;font-weight:normal;" scope="col">
								<strong>(f)</strong> Geological disposal site or EOR project
									</th>
							<th class="styTableCellHeader" style="width:46mm;font-weight:normal;" scope="col">
								<strong>(g)</strong> Geological disposal site or EOR project
									</th>
							<th class="styTableCellHeader" style="width:46mm;font-weight:normal;" scope="col">
								<strong>(h)</strong> Geological disposal site or EOR project
							</th>
							<th class="" rowspan="4" style="width:1mm;border-right:0;border-bottom:0;line-height:1;overflow:hidden;font-weight:normal;font-size:6pt;white-space:nowrap;" scope="col">E<br/>x<br/>t<br/>e<br/>n<br/>d<br/>e<br/>d<br/><br/>B</th>
						</tr>
						<tr style="vertical-align:top;">
							<xsl:for-each select="$SecondPY/AllocationCrbnOxdRcptrOwnerGrp[position() &lt;= $repeat5times]">
								<th class="styTableCellHeader" style="font-weight:normal;text-align:left;" scope="col">
									<xsl:variable name="pos" select="position()"/>
									<strong>(i)</strong> Owner's name<br/>
									<xsl:call-template name="FillNameChoice">
										<xsl:with-param name="TargetBusinessName" select="$SecondPY/AllocationCrbnOxdRcptrOwnerGrp[$pos]/FacilityOwnerBusinessName"/>
										<xsl:with-param name="TargetPersonName" select="$SecondPY/AllocationCrbnOxdRcptrOwnerGrp[$pos]/FacilityOwnerPersonNm"/>
									</xsl:call-template>
								</th>
							</xsl:for-each>
							<xsl:if test="count($SecondPY/AllocationCrbnOxdRcptrOwnerGrp) &lt; 5">
								<xsl:call-template name="fillTable2">
									<xsl:with-param name="LineNumber" select="count($SecondPY/AllocationCrbnOxdRcptrOwnerGrp) + 1"/>
									<xsl:with-param name="BoxType">Name</xsl:with-param>
								</xsl:call-template>
							</xsl:if>
						</tr>
						<tr style="vertical-align:top;">
							<xsl:for-each select="$SecondPY/AllocationCrbnOxdRcptrOwnerGrp[position() &lt;= $repeat5times]">
								<th class="styTableCellHeader" style="font-weight:normal;text-align:left;" scope="col">
									<xsl:variable name="pos" select="position()"/>
									<strong>(ii)</strong> EIN<br/>
									<xsl:call-template name="FillEINChoice">
										<xsl:with-param name="TargetEIN" select="$SecondPY/AllocationCrbnOxdRcptrOwnerGrp[$pos]/FacilityOwnerEIN"/>
										<xsl:with-param name="TargetSSN" select="$SecondPY/AllocationCrbnOxdRcptrOwnerGrp[$pos]/FacilityOwnerSSN"/>
									</xsl:call-template>
								</th>
							</xsl:for-each>
							<xsl:if test="count($SecondPY/AllocationCrbnOxdRcptrOwnerGrp) &lt; 5">
								<xsl:call-template name="fillTable2">
									<xsl:with-param name="LineNumber" select="count($SecondPY/AllocationCrbnOxdRcptrOwnerGrp) + 1"/>
									<xsl:with-param name="BoxType">EIN</xsl:with-param>
								</xsl:call-template>
							</xsl:if>
						</tr>
						<tr>
							<xsl:for-each select="$SecondPY/AllocationCrbnOxdRcptrOwnerGrp[position() &lt;= $repeat5times]">
								<th class="styTableCellHeader" style="font-weight:normal;text-align:left;" scope="col">
									<xsl:variable name="pos" select="position()"/>
									<strong>(iii)</strong> Check if carbon oxide was qualified carbon oxide
									<input type="checkbox" class="styCkboxNM" style="margin-right:2px;right:0;" alt="Qualified carbon oxide checkbox">
										<xsl:call-template name="PopulateCheckbox">
											<xsl:with-param name="TargetNode" select="$SecondPY/AllocationCrbnOxdRcptrOwnerGrp[$pos]/QlfyCrbnOxdInd"/>
											<xsl:with-param name="BackupName">QlfyCrbnOxdInd<xsl:value-of select="$pos"/>
											</xsl:with-param>
										</xsl:call-template>
									</input>
								</th>
							</xsl:for-each>
							<xsl:if test="count($SecondPY/AllocationCrbnOxdRcptrOwnerGrp) &lt; 5">
								<xsl:call-template name="fillTable2">
									<xsl:with-param name="LineNumber" select="count($SecondPY/AllocationCrbnOxdRcptrOwnerGrp) + 1"/>
									<xsl:with-param name="BoxType">Checkbox</xsl:with-param>
								</xsl:call-template>
							</xsl:if>
						</tr>
					</thead>
					<tbody>
						<tr style="vertical-align:bottom;">
							<td class="styTableCellTextInherit" style="width:25mm;">
								<div class="styLNLeftLtrBox" style="width:8mm;float:left;">B</div>
								<div class="styLNDescLandscape" style="width:15mm;height:6mm;">2nd previous tax year</div>
							</td>
							<xsl:variable name="shouldSeparate2nd2" select="(count($SecondPY/AllocationCrbnOxdRcptrOwnerGrp) = 5)"/>
							<xsl:for-each select="$SecondPY/AllocationCrbnOxdRcptrOwnerGrp[position() &lt;= $repeat5times]">
								<xsl:variable name="pos" select="position()"/>
								<td class="styTableCellAmtInherit">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="MtrcTonsCrbnOxdRcptrQty"/>
									</xsl:call-template>
								</td>
							</xsl:for-each>
							<xsl:if test="not($shouldSeparate2nd2)">
								<xsl:call-template name="fillTable2">
									<xsl:with-param name="LineNumber" select="count($SecondPY/AllocationCrbnOxdRcptrOwnerGrp) + 1"/>
									<xsl:with-param name="SepMessage" select="$shouldSeparate2nd2"/>
								</xsl:call-template>
							</xsl:if>
						</tr>
					</tbody>
				</table>
			</div>
		</xsl:if>
		<xsl:if test="$ThirdPY">
			<div class="styTableContainerLandscapeNBB" id="schAp1table1" style="border-top:1px solid black;">
				<xsl:call-template name="SetInitialState"/>
				<table class="styTable" style="border-collapse:collapse;">
					<thead class="styTableThead">
						<tr>
							<th class="styTableCellHeader" rowspan="4" style="width:25.8mm;font-weight:normal;text-align:left;" scope="col">&nbsp;</th>
							<th class="styTableCellHeader" style="width:46mm;font-weight:normal;" scope="col">
								<strong>(d)</strong> Geological disposal site or EOR project
									</th>
							<th class="styTableCellHeader" style="width:46mm;font-weight:normal;" scope="col">
								<strong>(e)</strong> Geological disposal site or EOR project
									</th>
							<th class="styTableCellHeader" style="width:46mm;font-weight:normal;" scope="col">
								<strong>(f)</strong> Geological disposal site or EOR project
									</th>
							<th class="styTableCellHeader" style="width:46mm;font-weight:normal;" scope="col">
								<strong>(g)</strong> Geological disposal site or EOR project
									</th>
							<th class="styTableCellHeader" style="width:46mm;font-weight:normal;" scope="col">
								<strong>(h)</strong> Geological disposal site or EOR project
							</th>
							<th class="" rowspan="4" style="width:1mm;border-right:0;border-bottom:0;line-height:1;overflow:hidden;font-weight:normal;font-size:6pt;white-space:nowrap;" scope="col">E<br/>x<br/>t<br/>e<br/>n<br/>d<br/>e<br/>d<br/><br/>C</th>
						</tr>
						<tr style="vertical-align:top;">
							<xsl:for-each select="$ThirdPY/AllocationCrbnOxdRcptrOwnerGrp[position() &lt;= $repeat5times]">
								<th class="styTableCellHeader" style="font-weight:normal;text-align:left;" scope="col">
									<xsl:variable name="pos" select="position()"/>
									<strong>(i)</strong> Owner's name<br/>
									<xsl:call-template name="FillNameChoice">
										<xsl:with-param name="TargetBusinessName" select="$ThirdPY/AllocationCrbnOxdRcptrOwnerGrp[$pos]/FacilityOwnerBusinessName"/>
										<xsl:with-param name="TargetPersonName" select="$ThirdPY/AllocationCrbnOxdRcptrOwnerGrp[$pos]/FacilityOwnerPersonNm"/>
									</xsl:call-template>
								</th>
							</xsl:for-each>
							<xsl:if test="count($ThirdPY/AllocationCrbnOxdRcptrOwnerGrp) &lt; 5">
								<xsl:call-template name="fillTable2">
									<xsl:with-param name="LineNumber" select="count($ThirdPY/AllocationCrbnOxdRcptrOwnerGrp) + 1"/>
									<xsl:with-param name="BoxType">Name</xsl:with-param>
								</xsl:call-template>
							</xsl:if>
						</tr>
						<tr style="vertical-align:top;">
							<xsl:for-each select="$ThirdPY/AllocationCrbnOxdRcptrOwnerGrp[position() &lt;= $repeat5times]">
								<th class="styTableCellHeader" style="font-weight:normal;text-align:left;" scope="col">
									<xsl:variable name="pos" select="position()"/>
									<strong>(ii)</strong> EIN<br/>
									<xsl:call-template name="FillEINChoice">
										<xsl:with-param name="TargetEIN" select="$ThirdPY/AllocationCrbnOxdRcptrOwnerGrp[$pos]/FacilityOwnerEIN"/>
										<xsl:with-param name="TargetSSN" select="$ThirdPY/AllocationCrbnOxdRcptrOwnerGrp[$pos]/FacilityOwnerSSN"/>
									</xsl:call-template>
								</th>
							</xsl:for-each>
							<xsl:if test="count($ThirdPY/AllocationCrbnOxdRcptrOwnerGrp) &lt; 5">
								<xsl:call-template name="fillTable2">
									<xsl:with-param name="LineNumber" select="count($ThirdPY/AllocationCrbnOxdRcptrOwnerGrp) + 1"/>
									<xsl:with-param name="BoxType">EIN</xsl:with-param>
								</xsl:call-template>
							</xsl:if>
						</tr>
						<tr>
							<xsl:for-each select="$ThirdPY/AllocationCrbnOxdRcptrOwnerGrp[position() &lt;= $repeat5times]">
								<th class="styTableCellHeader" style="font-weight:normal;text-align:left;" scope="col">
									<xsl:variable name="pos" select="position()"/>
									<strong>(iii)</strong> Check if carbon oxide was qualified carbon oxide
									<input type="checkbox" class="styCkboxNM" style="margin-right:2px;right:0;" alt="Qualified carbon oxide checkbox">
										<xsl:call-template name="PopulateCheckbox">
											<xsl:with-param name="TargetNode" select="$ThirdPY/AllocationCrbnOxdRcptrOwnerGrp[$pos]/QlfyCrbnOxdInd"/>
											<xsl:with-param name="BackupName">QlfyCrbnOxdInd<xsl:value-of select="$pos"/>
											</xsl:with-param>
										</xsl:call-template>
									</input>
								</th>
							</xsl:for-each>
							<xsl:if test="count($ThirdPY/AllocationCrbnOxdRcptrOwnerGrp) &lt; 5">
								<xsl:call-template name="fillTable2">
									<xsl:with-param name="LineNumber" select="count($ThirdPY/AllocationCrbnOxdRcptrOwnerGrp) + 1"/>
									<xsl:with-param name="BoxType">Checkbox</xsl:with-param>
								</xsl:call-template>
							</xsl:if>
						</tr>
					</thead>
					<tbody>
						<tr style="vertical-align:bottom;">
							<td class="styTableCellTextInherit" style="width:25mm;">
								<div class="styLNLeftLtrBox" style="width:8mm;float:left;">C</div>
								<div class="styLNDescLandscape" style="width:15mm;height:6mm;">3rd previous tax year</div>
							</td>
							<xsl:variable name="shouldSeparate2nd2" select="(count($ThirdPY/AllocationCrbnOxdRcptrOwnerGrp) = 5)"/>
							<xsl:for-each select="$ThirdPY/AllocationCrbnOxdRcptrOwnerGrp[position() &lt;= $repeat5times]">
								<xsl:variable name="pos" select="position()"/>
								<td class="styTableCellAmtInherit">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="MtrcTonsCrbnOxdRcptrQty"/>
									</xsl:call-template>
								</td>
							</xsl:for-each>
							<xsl:if test="not($shouldSeparate2nd2)">
								<xsl:call-template name="fillTable2">
									<xsl:with-param name="LineNumber" select="count($ThirdPY/AllocationCrbnOxdRcptrOwnerGrp) + 1"/>
									<xsl:with-param name="SepMessage" select="$shouldSeparate2nd2"/>
								</xsl:call-template>
							</xsl:if>
						</tr>
					</tbody>
				</table>
			</div>
		</xsl:if>
		<xsl:if test="$ColDTotal">
			<div class="styTableContainerLandscapeNBB" id="schAp1table1" style="border-top:1px solid black;">
				<xsl:call-template name="SetInitialState"/>
				<table class="styTable" style="border-collapse:collapse;">
					<thead class="styTableThead">
						<tr>
							<th class="styTableCellHeader" rowspan="4" style="width:25.8mm;font-weight:normal;text-align:left;" scope="col">&nbsp;</th>
							<th class="styTableCellHeader" style="width:46mm;font-weight:normal;" scope="col">
								<strong>(d)</strong> Geological disposal site or EOR project
									</th>
							<th class="styTableCellHeader" style="width:46mm;font-weight:normal;" scope="col">
								<strong>(e)</strong> Geological disposal site or EOR project
									</th>
							<th class="styTableCellHeader" style="width:46mm;font-weight:normal;" scope="col">
								<strong>(f)</strong> Geological disposal site or EOR project
									</th>
							<th class="styTableCellHeader" style="width:46mm;font-weight:normal;" scope="col">
								<strong>(g)</strong> Geological disposal site or EOR project
									</th>
							<th class="styTableCellHeader" style="width:46mm;font-weight:normal;" scope="col">
								<strong>(h)</strong> Geological disposal site or EOR project
							</th>
							<th class="" rowspan="4" style="width:1mm;border-right:0;border-bottom:0;line-height:1;overflow:hidden;font-weight:normal;font-size:6pt;white-space:nowrap;" scope="col">E<br/>x<br/>t<br/>e<br/>n<br/>d<br/>e<br/>d<br/><br/>D</th>
						</tr>
						<tr style="vertical-align:top;">
							<xsl:for-each select="$ColDTotal/AllocationCrbnOxdRcptrOwnerGrp[position() &lt;= $repeat5times]">
								<th class="styTableCellHeader" style="font-weight:normal;text-align:left;" scope="col">
									<xsl:variable name="pos" select="position()"/>
									<strong>(i)</strong> Owner's name<br/>
									<xsl:call-template name="FillNameChoice">
										<xsl:with-param name="TargetBusinessName" select="$ColDTotal/AllocationCrbnOxdRcptrOwnerGrp[$pos]/FacilityOwnerBusinessName"/>
										<xsl:with-param name="TargetPersonName" select="$ColDTotal/AllocationCrbnOxdRcptrOwnerGrp[$pos]/FacilityOwnerPersonNm"/>
									</xsl:call-template>
								</th>
							</xsl:for-each>
							<xsl:if test="count($ColDTotal/AllocationCrbnOxdRcptrOwnerGrp) &lt; 5">
								<xsl:call-template name="fillTable2">
									<xsl:with-param name="LineNumber" select="count($ColDTotal/AllocationCrbnOxdRcptrOwnerGrp) + 1"/>
									<xsl:with-param name="BoxType">Name</xsl:with-param>
								</xsl:call-template>
							</xsl:if>
						</tr>
						<tr style="vertical-align:top;">
							<xsl:for-each select="$ColDTotal/AllocationCrbnOxdRcptrOwnerGrp[position() &lt;= $repeat5times]">
								<th class="styTableCellHeader" style="font-weight:normal;text-align:left;" scope="col">
									<xsl:variable name="pos" select="position()"/>
									<strong>(ii)</strong> EIN<br/>
									<xsl:call-template name="FillEINChoice">
										<xsl:with-param name="TargetEIN" select="$ColDTotal/AllocationCrbnOxdRcptrOwnerGrp[$pos]/FacilityOwnerEIN"/>
										<xsl:with-param name="TargetSSN" select="$ColDTotal/AllocationCrbnOxdRcptrOwnerGrp[$pos]/FacilityOwnerSSN"/>
									</xsl:call-template>
								</th>
							</xsl:for-each>
							<xsl:if test="count($ColDTotal/AllocationCrbnOxdRcptrOwnerGrp) &lt; 5">
								<xsl:call-template name="fillTable2">
									<xsl:with-param name="LineNumber" select="count($ColDTotal/AllocationCrbnOxdRcptrOwnerGrp) + 1"/>
									<xsl:with-param name="BoxType">EIN</xsl:with-param>
								</xsl:call-template>
							</xsl:if>
						</tr>
						<tr>
							<xsl:for-each select="$ColDTotal/AllocationCrbnOxdRcptrOwnerGrp[position() &lt;= $repeat5times]">
								<th class="styTableCellHeader" style="font-weight:normal;text-align:left;" scope="col">
									<xsl:variable name="pos" select="position()"/>
									<strong>(iii)</strong> Check if carbon oxide was qualified carbon oxide
									<input type="checkbox" class="styCkboxNM" style="margin-right:2px;right:0;" alt="Qualified carbon oxide checkbox">
										<xsl:call-template name="PopulateCheckbox">
											<xsl:with-param name="TargetNode" select="$ColDTotal/AllocationCrbnOxdRcptrOwnerGrp[$pos]/QlfyCrbnOxdInd"/>
											<xsl:with-param name="BackupName">QlfyCrbnOxdInd<xsl:value-of select="$pos"/>
											</xsl:with-param>
										</xsl:call-template>
									</input>
								</th>
							</xsl:for-each>
							<xsl:if test="count($ColDTotal/AllocationCrbnOxdRcptrOwnerGrp) &lt; 5">
								<xsl:call-template name="fillTable2">
									<xsl:with-param name="LineNumber" select="count($ColDTotal/AllocationCrbnOxdRcptrOwnerGrp) + 1"/>
									<xsl:with-param name="BoxType">Checkbox</xsl:with-param>
								</xsl:call-template>
							</xsl:if>
						</tr>
					</thead>
					<tbody>
						<tr style="vertical-align:bottom;">
							<td class="styTableCellTextInherit" style="width:25mm;">
								<div class="styLNLeftLtrBox" style="width:8mm;float:left;">D</div>
								<div class="styLNDescLandscape" style="width:15mm;min-height:9mm;"><strong>Total.</strong> Add lines 9A through 9C</div>
							</td>
							<xsl:variable name="shouldSeparate2nd2" select="(count($ColDTotal/AllocationCrbnOxdRcptrOwnerGrp) = 5)"/>
							<xsl:for-each select="$ColDTotal/AllocationCrbnOxdRcptrOwnerGrp[position() &lt;= $repeat5times]">
								<xsl:variable name="pos" select="position()"/>
								<td class="styTableCellAmtInherit">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="MtrcTonsCrbnOxdRcptrQty"/>
									</xsl:call-template>
								</td>
							</xsl:for-each>
							<xsl:if test="not($shouldSeparate2nd2)">
								<xsl:call-template name="fillTable2">
									<xsl:with-param name="LineNumber" select="count($ColDTotal/AllocationCrbnOxdRcptrOwnerGrp) + 1"/>
									<xsl:with-param name="SepMessage" select="$shouldSeparate2nd2"/>
								</xsl:call-template>
							</xsl:if>
						</tr>
					</tbody>
				</table>
			</div>
		</xsl:if>
	</xsl:template>
</xsl:stylesheet>