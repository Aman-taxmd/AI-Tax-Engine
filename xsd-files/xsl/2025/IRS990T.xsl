<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE xsl:stylesheet [
  <!ENTITY nbsp "&#160;">
  <!ENTITY mdash "&#8212;">
]>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:include href="PopulateTemplate.xsl" />
	<xsl:include href="AddHeader.xsl" />
	<xsl:include href="CommonPathRef.xsl" />
	<xsl:include href="AddOnTable.xsl" />
	<xsl:include href="IRS990TStyle.xsl" />
	<xsl:output method="html" indent="yes" />
	<xsl:strip-space elements="*" />
	<xsl:param name="FormData" select="$RtnDoc/IRS990T" />
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
				<meta name="Description" content="IRS Form 990-T" />
				<script language="JavaScript" src="{$ScriptPath}/FormDisplay.js" type="text/javascript" />
				<xsl:call-template name="InitJS" />
				<style type="text/css">
					<xsl:if test="not($Print) or $Print=''">
						<xsl:call-template name="IRS990TStyle" />
						<xsl:call-template name="AddOnStyle" />
					</xsl:if>
				</style>
				<xsl:call-template name="GlobalStylesForm" />
			</head>
			<body class="styBodyClass">
				<form id="Form990T">
					<xsl:call-template name="DocumentHeader" />
					<!-- Page 1 -->
					
					<!-- Header -->
					<div class="styStdDiv">
						<div class="styFNBox" style="width:30mm;height:24.3mm;">
							Form <span class="styFN" style="font-size:18pt;">990-T</span> 
							<br />
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$FormData" />
							</xsl:call-template>
							<br />
							<xsl:call-template name="LinkToLeftoverDataTableInline">
								<xsl:with-param name="TargetNode" select="$FormData/SpecialConditionDesc"/>
								<xsl:with-param name="Desc">Top Left Header - Special Condition Description</xsl:with-param>
							</xsl:call-template>
							<xsl:call-template name="LinkToLeftoverDataTableInline">
								<xsl:with-param name="TargetNode" select="$FormData/@accountingPeriodChangeCd"/>
								<xsl:with-param name="Desc">Top Left Header - Change of Accounting Code</xsl:with-param>
							</xsl:call-template>
							<xsl:call-template name="LinkToLeftoverDataTableInline">
								<xsl:with-param name="TargetNode" select="$FormData/@accountingPeriodChangeApprvCd"/>
								<xsl:with-param name="Desc">Top Left Header - Change of Accounting Reason</xsl:with-param>
							</xsl:call-template>
							<br /><br/>
							<span class="styAgency">
								Department of the Treasury <br />
								Internal Revenue Service
							</span>
						</div>
						<div class="styFTBox" style="width:127mm;height:24.3mm;">
							<span class="styFMT" style="font-size:11pt;padding-top:0.2mm;padding-bottom:0.5mm;">
								Exempt Organization Business Income Tax Return
							</span><br />
							<!-- Added new date logic 250604 gdy -->
							<span style="font-weight:bold;font-size:9pt">(and proxy tax under section 6033(e))</span><br />
							<span style="font-family:Arial;font-weight:bold;padding-top:2mm;padding-bottom:0mm;">
							 For calendar year 2025, or tax year beginning
								<span class="styFixedUnderline" style="float:none;text-align:left;width:8mm;">
									<xsl:call-template name="PopulateMonth">
										<xsl:with-param name="TargetNode" select="$RtnHdrData/TaxPeriodBeginDt"/>
									</xsl:call-template> -
									<xsl:call-template name="PopulateDay">
										<xsl:with-param name="TargetNode" select="$RtnHdrData/TaxPeriodBeginDt"/>
									</xsl:call-template>
								</span>, 2025, and ending,
								<span class="styFixedUnderline" style="float:none;text-align:left;width:8mm">
									<xsl:call-template name="PopulateMonth">
										<xsl:with-param name="TargetNode" select="$RtnHdrData/TaxPeriodEndDt"/>
									</xsl:call-template> -
									<xsl:call-template name="PopulateDay">
										<xsl:with-param name="TargetNode" select="$RtnHdrData/TaxPeriodEndDt"/>
									</xsl:call-template>
								</span>, 20
								<span class="styFixedUnderline" style="float:none;text-align:top;width:4mm">
									<xsl:value-of select="substring($RtnHdrData/TaxPeriodEndDt,3,2)"/>
								</span>
								<br/>
								Go to <a style="text-decoration:none;color:black;" href="http://www.irs.gov/Form990T" 
								title="Link to IRS.gov"><i>www.IRS.gov/Form990T</i></a>
								<span style="font-style:italic">www.irs.gov/Form990T</span>
								for instructions and the latest information.
							</span><br />
							<span style="font-weight:bold;font-family:Arial;">
								Do not enter SSN numbers on this form as it may be made public if your organization 
								is a 501(c)(3).
							</span>
						</div>
						<div class="styTYBox" style="width:30mm;height:24.3mm;">
							<div class="styOMB" style="height:auto;font-size:6pt;">OMB No. 1545-0047</div>
							<div class="styTY">20<span class="styTYColor">25</span></div>
							<div style="text-align:center;background-color:black;font-size:7pt;
							 font-family:Arial;padding:0.5mm;">
								<span class="styBoldText" style="color:white">Open to Public Inspection for 501(c)(3) 
								 Organizations Only</span>
							</div>
						</div>
					</div>
					<!-- Filer information section -->
					<div class="styGenericDiv" style="height:10mm;width:29.7mm;border-top:1px solid black;border-right:0px solid black;">
						<div class="sty990THeaderCell" style="height:10.3mm;border-left-width:0px;padding-top:1.5mm;">
							<span class="sty990TLeftLtrBox" style="">A</span>
							<span class="sty990TLeftLtrBox" style="">
								<input type="checkbox" class="styCkboxNM" alt="Address Change Indicator">
									<xsl:call-template name="PopulateCheckbox">
										<xsl:with-param name="TargetNode" select="$FormData/AddressChangeInd"/>
										<xsl:with-param name="BackupName">IRS990TAddressChangeInd</xsl:with-param>
									</xsl:call-template>
								</input>
							</span>
							<span style="width:20mm;float:left;font-family:Arial;">
								Check box if address changed.
							</span>
						</div>
						<div class="sty990THeaderCell" style="height:22.5mm;border-left-width:0px;padding-top:1mm;border-bottom-width:0px;">
							<span class="sty990TLeftLtrBox" style="">B</span>
							<span style="width:24mm;float:left;font-family:Arial;padding-top:1px;padding-bottom:4px;">
								Exempt under section
							</span>
							<br />
							<span class="sty990TLeftLtrBox" style="margin-left:2mm;">
								<input type="checkbox" class="styCkboxNM" alt="section 501">
									<xsl:call-template name="PopulateCheckbox">
										<xsl:with-param name="TargetNode" select="$FormData/Organization501IndicatorGrp/Organization501Ind"/>
										<xsl:with-param name="BackupName">IRS990TOrganization501Ind</xsl:with-param>
									</xsl:call-template>
								</input>
							</span>
							<span style="width:20mm;height:4mm;padding-top:2px;float:left;font-family:Arial;">
								501(
								<xsl:choose>
									<xsl:when test="$FormData/Organization501IndicatorGrp/Organization501aTypeTxt">
										<xsl:call-template name="PopulateText"><xsl:with-param name="TargetNode" 
										 select="$FormData/Organization501IndicatorGrp/Organization501aTypeTxt"/>
									</xsl:call-template>
									</xsl:when>
										<xsl:otherwise>
											<xsl:call-template name="PopulateText"><xsl:with-param name="TargetNode" 
											 select="$FormData/Organization501IndicatorGrp/Organization501cTypeTxt"/>
										</xsl:call-template>
									</xsl:otherwise>
								</xsl:choose>
								)
							</span>
							<br />
							<span class="sty990TLeftLtrBox" style="margin-left:2mm;">
								<input type="checkbox" class="styCkboxNM" alt="Section 408 e">
									<xsl:call-template name="PopulateCheckbox">
										<xsl:with-param name="TargetNode" select="$FormData/Section408eInd"/>
										<xsl:with-param name="BackupName">IRS990TSection408eInd</xsl:with-param>
									</xsl:call-template>
								</input>
							</span>
							<span style="width:10mm;float:left;font-family:Arial;">	408(e)	</span>
							<span class="sty990TLeftLtrBox" style="">
								<input type="checkbox" class="styCkboxNM" alt="Section 220 e">
									<xsl:call-template name="PopulateCheckbox">
										<xsl:with-param name="TargetNode" select="$FormData/Section220eInd"/>
										<xsl:with-param name="BackupName">IRS990TSection220eInd</xsl:with-param>
									</xsl:call-template>
								</input>
							</span>
							<span style="width:8mm;height:4mm;float:left;font-family:Arial;">220(e)</span>
							<br />
							<span class="sty990TLeftLtrBox" style="margin-left:2mm;">
								<input type="checkbox" class="styCkboxNM" alt="Section 408A">
									<xsl:call-template name="PopulateCheckbox">
										<xsl:with-param name="TargetNode" select="$FormData/Section408AInd"/>
										<xsl:with-param name="BackupName">IRS990TSection408AInd</xsl:with-param>
									</xsl:call-template>
								</input>
							</span>
							<span style="width:10mm;height:4mm;float:left;font-family:Arial;">408A</span>
							<span class="sty990TLeftLtrBox" style="">
								<input type="checkbox" class="styCkboxNM" alt="Section 530 a">
									<xsl:call-template name="PopulateCheckbox">
										<xsl:with-param name="TargetNode" select="$FormData/Section530aInd"/>
										<xsl:with-param name="BackupName">IRS990TSection530aInd</xsl:with-param>
									</xsl:call-template>
								</input>
							</span>
							<span style="width:8mm;height:4mm;float:left;font-family:Arial;">530(a)</span>
							<br />
							<span class="sty990TLeftLtrBox" style="margin-left:2mm;">
								<input type="checkbox" class="styCkboxNM" alt="Section 529 a">
									<xsl:call-template name="PopulateCheckbox">
										<xsl:with-param name="TargetNode" select="$FormData/Section529aInd"/>
										<xsl:with-param name="BackupName">IRS990TSection529aInd</xsl:with-param>
									</xsl:call-template>
								</input>
							</span>
							<span style="width:10mm;height:4mm;float:left;font-family:Arial;">529(a)</span>
							<span class="sty990TLeftLtrBox" style="">
								<input type="checkbox" class="styCkboxNM" alt="Section 529A">
									<xsl:call-template name="PopulateCheckbox">
										<xsl:with-param name="TargetNode" select="$FormData/Section529AInd"/>
										<xsl:with-param name="BackupName">IRS990TSection529AInd</xsl:with-param>
									</xsl:call-template>
								</input>
							</span>
							<span style="width:8mm;float:left;font-family:Arial;">529A</span>
						</div>
					</div>
					<div class="styGenericDiv" style="height:35mm;width:117mm;border-top:1px solid black;
					 border-right:1px solid black;">
						<div class="sty990THeaderCell" style="height:10.3mm;width:116.7mm;">
							Name of organization (
							<input type="checkbox" class="styCkboxNM" alt="Organization Name Changed">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$FormData/NameChangeInd"/>
									<xsl:with-param name="BackupName">IRS990TNameChangeInd</xsl:with-param>
								</xsl:call-template>
							</input>
							Check box if name changed and see instructions.)
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$FormData/NameChangeInd"/>
							</xsl:call-template>
							<br />
							<xsl:call-template name="PopulateReturnHeaderFiler">
								<xsl:with-param name="TargetNode">BusinessNameLine1Txt</xsl:with-param>
							</xsl:call-template>
							<br />
							<xsl:call-template name="PopulateReturnHeaderFiler">
								<xsl:with-param name="TargetNode">BusinessNameLine2Txt</xsl:with-param>
							</xsl:call-template>
						</div>
						<div class="styGenericDiv" style="height:24mm;width:117mm;">
							<!-- Number and StreetRoom or Suite-->
								<div class="styNameBox" style="height:10mm;width:78mm;font-size:7pt;border-style:solid;
								 border-top-width:0px;border-left-width:1px; border-bottom-width:1px;
								 border-right-width:1px;padding-left:1mm">
									 Number and street.  If a P.O. box, see instructions.
									<br />
									<xsl:choose>
										<xsl:when test="$RtnHdrData/Filer/USAddress">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/USAddress/AddressLine1Txt">
												</xsl:with-param>
											</xsl:call-template>
										 <br />
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/USAddress/AddressLine2Txt">
												</xsl:with-param>
											</xsl:call-template>
										</xsl:when>
										<xsl:otherwise>
											<xsl:if test="$RtnHdrData/Filer/ForeignAddress">
											</xsl:if>
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/ForeignAddress/AddressLine1Txt">
													</xsl:with-param>
												</xsl:call-template>
											 <br />
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/ForeignAddress/AddressLine2Txt">
													</xsl:with-param>
												</xsl:call-template>
										</xsl:otherwise>
									</xsl:choose>
								</div>
								<!-- Room or Suite -->
								<div class="styNameBox" style="height:10mm;width:38.5mm;font-size:7pt;border-style:solid;border-top-width:0px;
								 border-left-width:0px;border-bottom-width:1px;border-right-width:0px;padding-left:1mm;">
								  Room or suite no.
									<br />
								</div>
							<!--</div>-->
							<!-- Number and Street End -->
							<!-- Begining City/State/Country/ZIP Row -->
							<!-- City or Town -->
							<div class="styBB" style="width:116.5mm;">
								<div class="styNameBox" style="width:40mm;height:10mm;font-size:7pt;border-style:solid;
								 border-top-width:0px;border-left-width:1px; border-bottom-width:0px;
								 border-right-width:1px;padding-left:1mm;">City or town
									<br />
									<xsl:choose>
										<xsl:when test="$RtnHdrData/Filer/USAddress">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/USAddress/CityNm">
												</xsl:with-param>
											</xsl:call-template>
										</xsl:when>
										<xsl:otherwise>
											<xsl:if test="$RtnHdrData/Filer/ForeignAddress">
											</xsl:if>
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/ForeignAddress/CityNm">
													</xsl:with-param>
												</xsl:call-template>
										</xsl:otherwise>
									</xsl:choose>
								</div>
								<!-- State or Province -->
								<div class="styNameBox" style="width:26mm;height:10mm;font-size:7pt;border-style:solid;
								 border-top-width:0px;border-left-width:0px;border-bottom-width:0px;border-right-width:1px;
								 padding-left:1mm;">
								 State or province
									<br />
									<xsl:choose>
										<xsl:when test="$RtnHdrData/Filer/USAddress">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/USAddress/StateAbbreviationCd">
												</xsl:with-param>
											</xsl:call-template>
										</xsl:when>
										<xsl:otherwise>
											<xsl:if test="$RtnHdrData/Filer/ForeignAddress">
											</xsl:if>
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/ForeignAddress/ProvinceOrStateNm">
													</xsl:with-param>
												</xsl:call-template>
										</xsl:otherwise>
									</xsl:choose>
								</div>
								<!-- Country -->
								<div class="styNameBox" style="width:12mm;height:10mm;font-size:7pt;border-style:solid;
								 border-top-width:0px;border-left-width:0px; border-bottom-width:0px;
								 border-right-width:1px;padding-left:1mm;">Country
									<xsl:if test="$RtnHdrData/Filer/ForeignAddress">
									</xsl:if>
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/ForeignAddress/CountryCd">
											</xsl:with-param>
										</xsl:call-template>
								</div>
								<!-- ZIP/Foreign Postal Code -->
								<div class="styNameBox" style="width:35mm;height:10mm;font-size:7pt;border-style:solid;
								 border-top-width:0px;border-left-width:0px;border-bottom-width:0px;border-right-width:0px;
								 padding-left:1mm;">
								 ZIP or foreign postal code
									<br />
									<xsl:choose>
										<xsl:when test="$RtnHdrData/Filer/USAddress">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/USAddress/ZIPCd">
												</xsl:with-param>
											</xsl:call-template>
										</xsl:when>
										<xsl:otherwise>
											<xsl:if test="$RtnHdrData/Filer/ForeignAddress">
											</xsl:if>
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/ForeignAddress/ForeignPostalCd">
													</xsl:with-param>
												</xsl:call-template>
										</xsl:otherwise>
									</xsl:choose>
								</div>
							</div>
							<!-- End City/State/Country/ZIP Row -->
							<!-- Book Value Start -->
							<div class="styBB" style="width:117mm;border-left:none;border-top-width:0px;border-bottom-width:0px;padding-top:1mm">
								<span class="sty990TLeftLtrBox" style="">C</span>
								Book value of all assets at end of year
								<span class="sty990TDotLn" style="float:none;">.....</span>
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/BookValueAssetsEOYAmt"/>
								</xsl:call-template>
							</div>
							<!-- Book Value End -->
						</div>
					</div>
					<div class="styGenericDiv" style="height:10mm;width:40mm;border-top:1px solid black;">
						<div class="styEINBox" style="width:100%;height:10.3mm;padding-left:1mm;font-weight:normal;border-bottom:1px solid black;font-size:inherit;">
							<strong>D &nbsp; <span style="font-family:Arial;font-size:6pt;">Employer identification number</span></strong><br />
							<span style="height:7mm;width:40mm;padding-top:3mm;text-align:center;">
								<xsl:call-template name="PopulateReturnHeaderFilerTIN">
									<xsl:with-param name="EINChanged" select="true()"/>
								</xsl:call-template>
							</span>
						</div>
						<div class="sty990THeaderCell" style="height:10mm;width:100%;border-left-width:0px">
							<strong>E &nbsp; <span style="font-family:Arial;">Group exemption number</span></strong><br />
							&nbsp;&nbsp;&nbsp; <span style="font-family:Arial;">(see instructions)</span><br />
							<span style="height:3mm;width:40mm;text-align:center;">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$FormData/GroupExemptionNum"/>
								</xsl:call-template>
							</span>
						</div>
						<div class="sty990THeaderCell" style="width:100%;height:9mm;border-left-width:0px;border-bottom-width:0px;padding-top:1.5mm;">
							<span class="sty990TLeftLtrBox" style="">F</span>
							<span class="sty990TLeftLtrBox" style="">
								<input type="checkbox" class="styCkboxNM" alt="Amended Return Indicator">
									<xsl:call-template name="PopulateCheckbox">
										<xsl:with-param name="TargetNode" select="$FormData/AmendedReturnInd"/>
										<xsl:with-param name="BackupName">IRS990TAmendedReturnInd</xsl:with-param>
									</xsl:call-template>
								</input>
							</span>
							<span style="width:20mm;float:left;font-family:Arial;">
								Check box if an amended return.
							</span>
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$FormData/AmendedReturnInd"/>
							</xsl:call-template>
						</div>
					</div>
					<div class="styStdDiv" style="border-top:1px solid black;padding:1px;">
						<div class="sty990TLeftLtrBox">G</div>
						<div class="styGenericDiv" style="width:35mm;">
							Check organization type 
						</div>
						<div class="styGenericDiv" style="width:147mm;">
							<input type="checkbox" class="styCkboxNM" alt="501 c corporation">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$FormData/Organization501cCorporationInd"/>
									<xsl:with-param name="BackupName">IRS990TOrganization501cCorporationInd</xsl:with-param>
								</xsl:call-template>
							</input>
							501(c) corporation
							<input type="checkbox" class="styCkboxNM" alt="501 c trust" style="margin-left:3mm;">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$FormData/Organization501cTrustInd"/>
									<xsl:with-param name="BackupName">IRS990TOrganization501cTrustInd</xsl:with-param>
								</xsl:call-template>
							</input>
							501(c) trust
							<input type="checkbox" class="styCkboxNM" alt="401 A trust" style="margin-left:3mm;">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$FormData/Organization401aTrustInd"/>
									<xsl:with-param name="BackupName">IRS990TOrganization401aTrustInd</xsl:with-param>
								</xsl:call-template>
							</input>
							401(a) trust
							<input type="checkbox" class="styCkboxNM" alt="other trust" style="margin-left:3mm;">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" 
									 select="$FormData/OrganizationOtherTrustIndGrp/OrganizationOtherTrustInd"/>
									<xsl:with-param name="BackupName">IRS990TOrganizationOtherTrustInd</xsl:with-param>
								</xsl:call-template>
							</input>
							Other trust
							<xsl:call-template name="LinkToLeftoverDataTableInline">
								<xsl:with-param name="TargetNode"
								 select="$FormData/OrganizationOtherTrustIndGrp/OtherTrustTypeCd"/>
								<xsl:with-param name="Desc">Line G - Other Trust Type Code</xsl:with-param>
							</xsl:call-template>
							<xsl:call-template name="LinkToLeftoverDataTableInline">
								<xsl:with-param name="TargetNode"
								 select="$FormData/OrganizationOtherTrustIndGrp/OtherTrustTypeDesc"/>
								<xsl:with-param name="Desc">Line G - Other Trust Type Description</xsl:with-param>
							</xsl:call-template>
							<input type="checkbox" class="styCkboxNM" alt="state college university" 
							 style="margin-left:3mm;">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" 
									 select="$FormData/OrgStateCollegeUniversityInd"/>
									<xsl:with-param name="BackupName">IRS990TOrganizationStateCollegeUniversityInd
									</xsl:with-param>
								</xsl:call-template>
							</input>
							State college/university<br></br>
							<input type="checkbox" class="styCkboxNM" alt="6417 d 1 a applicable entity" 
							 style="margin-left:0mm;">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" 
									 select="$FormData/Section6417d1AEntityInd"/>
									<xsl:with-param name="BackupName">IRS990TSection6417d1AEntityInd
									</xsl:with-param>
								</xsl:call-template>
							</input>
							6417(d)(1)(A) Applicable entity
						</div>
					</div>
					<div class="styStdDiv" style="border-top:1px solid black;padding:1px;">
						<div class="sty990TLeftLtrBox">H</div>
						<div class="styGenericDiv" style="width:35mm;">
							Check if filing only to claim
						</div>
						<div class="styGenericDiv" style="width:147mm;">
							<input type="checkbox" class="styCkboxNM" alt="Credit from form 8941">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$FormData/ClaimCreditForm8941Ind"/>
									<xsl:with-param name="BackupName">IRS990TClaimCreditForm8941Ind</xsl:with-param>
								</xsl:call-template>
							</input>
							Credit from Form 8941
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$FormData/ClaimCreditForm8941Ind"/>
							</xsl:call-template>
							<input type="checkbox" class="styCkboxNM" alt="claim refund from form 2439" 
							 style="margin-left:3mm;">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$FormData/ClaimRefundForm2439Ind"/>
									<xsl:with-param name="BackupName">IRS990TClaimRefundForm2439Ind</xsl:with-param>
								</xsl:call-template>
							</input>
							Refund shown on Form 2439
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$FormData/ClaimRefundForm2439Ind"/>
							</xsl:call-template><br/>
							<input type="checkbox" class="styCkboxNM" alt="Elective payment amount from Form 3800" 
							 style="margin-left:0mm;">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$FormData/ElectivePaymentInd"/>
									<xsl:with-param name="BackupName">IRS990TElectivePaymentInd</xsl:with-param>
								</xsl:call-template>
							</input>
							Elective payment amount from Form 3800
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$FormData/ElectivePaymentInd"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line I -->
					<div class="styStdDiv" style="border-top:1px solid black;padding:1px;">
						<div class="sty990TLeftLtrBox">I</div>
						<div class="styGenericDiv">
							Check if a 501(c)(3) organization filing a consolidated return with a 501(c)(2) titleholding 
							corporation
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$FormData/ConsolidatedReturn501c3c2Ind"/>
							</xsl:call-template>
							<span class="sty990TDotLn" style="float:none;">.........</span>
						</div>
						<div class="stygenericdiv">
							<input type="checkbox" aria-label="consolidated return 501 c 3 c 2" style="styCkbox">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$FormData/ConsolidatedReturn501c3c2Ind"/>
									<xsl:with-param name="BackupName">IRS990TConsolidatedReturn501c3c2Ind</xsl:with-param>
								</xsl:call-template>
							</input>
						</div>
					</div>
					<!-- Line J -->
					<div class="styStdDiv" style="border-top:1px solid black;padding:1px;">
						<div class="sty990TLeftLtrBox">J</div>
						<div class="styGenericDiv">
							Enter the number of attached Schedules A (Form 990-T)
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$FormData/Form990TScheduleAAttachedCnt"/>
							</xsl:call-template>
							<span class="sty990TDotLn" style="float:none;">...............</span>
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/Form990TScheduleAAttachedCnt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line K -->
					<div class="styStdDiv" style="border-top:1px solid black;padding:1px;">
						<div class="sty990TLeftLtrBox">K</div>
						<div class="styGenericDiv">
							During the tax year, was the corporation a subsidiary in an affiliated group or a 
							parent-subsidiary controlled group? 
							<span class="sty990TDotLn" style="float:none;">...</span>
						</div>
						<div class="styGenericDiv">
							<xsl:call-template name="PopulateSpan">
								<xsl:with-param name="TargetNode" select="$FormData/SubsidiaryCorporationInd"/>
							</xsl:call-template>
							<input type="checkbox" aria-label="subsidiary corporation yes" style="">
								<xsl:call-template name="PopulateYesCheckbox">
									<xsl:with-param name="TargetNode" select="$FormData/SubsidiaryCorporationInd"/>
									<xsl:with-param name="BackupName">IRS990TSubsidiaryCorporationInd</xsl:with-param>
								</xsl:call-template>
							</input>
							Yes
							<input type="checkbox" aria-label="subsidiary corporation no" style="margin-left:2mm;">
								<xsl:call-template name="PopulateNoCheckbox">
									<xsl:with-param name="TargetNode" select="$FormData/SubsidiaryCorporationInd"/>
									<xsl:with-param name="BackupName">IRS990TSubsidiaryCorporationInd</xsl:with-param>
								</xsl:call-template>
							</input>
							No
						</div>
					</div>
					<div class="styStdDiv" style="padding:1px;">
						<div class="sty990TLeftLtrBox">&nbsp;</div>
						<div class="styGenericDiv" style="width:96mm;">
							If "Yes," enter the name and identifying number of the parent corporation 
						</div>
						<div class="styGenericDiv" style="width:86mm;">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/ParentCorporationName/BusinessNameLine1Txt"/>
							</xsl:call-template>
							<xsl:if test="$FormData/ParentCorporationName/BusinessNameLine2Txt">
								<br />
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$FormData/ParentCorporationName/BusinessNameLine2Txt"/>
								</xsl:call-template>
							</xsl:if>
							<xsl:call-template name="LinkToLeftoverDataTableInline">
								<xsl:with-param name="TargetNode" select="$FormData/PrntCorporationNameControlTxt"/>
								<xsl:with-param name="Desc">Line K - Parent Corporation Name Control</xsl:with-param>
							</xsl:call-template>
							<xsl:if test="$FormData/ParentCorporationEIN">
								<xsl:if test="$FormData/ParentCorporationName"><br /></xsl:if>
								<xsl:call-template name="PopulateEIN">
									<xsl:with-param name="TargetNode" select="$FormData/ParentCorporationEIN"/>
								</xsl:call-template>
							</xsl:if>
						</div>
					</div>
					<!-- Line L -->
					<div class="styStdDiv" style="padding:1px;border-top:1px solid black;">
						<div class="sty990TLeftLtrBox">L</div>
						<div class="styGenericDiv" style="width:34mm;">
							The books are in care of 
						</div>
						<div class="styGenericDiv" style="width:98mm;">
							<xsl:choose>
								<xsl:when test="$FormData/BooksInCareOfDetail/PersonNm">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$FormData/BooksInCareOfDetail/PersonNm"/>
									</xsl:call-template>
								</xsl:when>
								<xsl:otherwise>
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$FormData/BooksInCareOfDetail/BusinessName/BusinessNameLine1Txt"/>
									</xsl:call-template>
									<xsl:if test="$FormData/BooksInCareOfDetail/BusinessName/BusinessNameLine2Txt">
										<br />
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$FormData/BooksInCareOfDetail/BusinessName/BusinessNameLine2Txt"/>
										</xsl:call-template>
									</xsl:if>
								</xsl:otherwise>
							</xsl:choose>
							<xsl:if test="$FormData/BooksInCareOfDetail"><br /></xsl:if>
							<xsl:choose>
								<xsl:when test="$FormData/BooksInCareOfDetail/ForeignAddress">
									<xsl:call-template name="PopulateForeignAddressTemplate">
										<xsl:with-param name="TargetNode" select="$FormData/BooksInCareOfDetail/ForeignAddress"/>
									</xsl:call-template>
								</xsl:when>
								<xsl:otherwise>
									<xsl:call-template name="PopulateUSAddressTemplate">
										<xsl:with-param name="TargetNode" select="$FormData/BooksInCareOfDetail/USAddress"/>
									</xsl:call-template>
								</xsl:otherwise>
							</xsl:choose>
						</div>
						<div class="styGenericDiv" style="width:50mm;">
							Telephone number  
							<xsl:choose>
								<xsl:when test="$FormData/BooksInCareOfDetail/ForeignPhoneNum">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$FormData/BooksInCareOfDetail/ForeignPhoneNum"/>
									</xsl:call-template>
								</xsl:when>
								<xsl:otherwise>
									<xsl:call-template name="PopulatePhoneNumber">
										<xsl:with-param name="TargetNode" select="$FormData/BooksInCareOfDetail/PhoneNum"/>
									</xsl:call-template>
								</xsl:otherwise>
							</xsl:choose>
						</div>
					</div>
					<!-- Part 1 -->
					<div class="styStdDiv" style="border-bottom:1px solid black;border-top:1px solid black;">
						<div class="styPartName">Part I</div>
						<div class="styPartDesc" style="">
							Total Unrelated Business Taxable Income
						</div>
					</div>
					<!-- Part 1, Line 1 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD">1</div>
						<div class="styLNDesc" style="height:auto;">
							Total of unrelated business taxable income computed from all unrelated trades or businesses (see instructions)
							<span class="sty990TDotLn">..............................</span>
						</div>
						<div class="styLNRightNumBox" style="height:auto;"><br />1</div>
						<div class="styLNAmountBox" style="height:auto;"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TotalUBTIComputedAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Part 1, Line 2 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD">2</div>
						<div class="styLNDesc">
							Reserved
							<span class="sty990TDotLn">..............................</span>
						</div>
						<div class="styLNRightNumBox">2</div>
						<div class="styLNAmountBox" style="background-color:lightgrey;">&nbsp;</div>
					</div>
					<!-- Part 1, Line 3 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD">3</div>
						<div class="styLNDesc">
							Add lines 1 and 2
							<span class="sty990TDotLn">............................</span>
						</div>
						<div class="styLNRightNumBox">3</div>
						<div class="styLNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TotalUBTIComputedAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Part 1, Line 4 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD">4</div>
						<div class="styLNDesc">
							Charitable contributions (see instructions for limitation rules)
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$FormData/CharitableContributionsDedAmt"/>
							</xsl:call-template>
							<span class="sty990TDotLn">..............</span>
						</div>
						<div class="styLNRightNumBox">4</div>
						<div class="styLNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CharitableContributionsDedAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Part 1, Line 5 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD">5</div>
						<div class="styLNDesc">
							Total unrelated business taxable income before net operating losses. Subtract line 4 from line 3
							<span class="sty990TDotLn">....</span>
						</div>
						<div class="styLNRightNumBox">5</div>
						<div class="styLNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TotalUBTIBeforeNOLSpecificAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Part 1, Line 6 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD">6</div>
						<div class="styLNDesc">
							Deduction for net operating loss. See instructions
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$FormData/NetOperatingLossDeductionAmt"/>
							</xsl:call-template>
							<span class="sty990TDotLn">.................</span>
						</div>
						<div class="styLNRightNumBox">6</div>
						<div class="styLNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/NetOperatingLossDeductionAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Part 1, Line 7 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD">7</div>
						<div class="styLNDesc" style="height:auto;">
							Total of unrelated business taxable income before specific deduction and section 199A deduction. <br />
							Subtract line 6 from line 5
							<span class="sty990TDotLn">.........................</span>
						</div>
						<div class="styLNRightNumBox" style="height:auto;"><br />7</div>
						<div class="styLNAmountBox" style="height:auto;"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TotalUBTIBeforeSection199AAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Part 1, Line 8 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD">8</div>
						<div class="styLNDesc">
							Specific deduction (generally $1,000, but see instructions for exceptions)
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$FormData/SpecificDeductionAmt"/>
							</xsl:call-template>
							<span class="sty990TDotLn">..........</span>
						</div>
						<div class="styLNRightNumBox">8</div>
						<div class="styLNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/SpecificDeductionAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Part 1, Line 9 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD">9</div>
						<div class="styLNDesc">
							<strong>Trusts. </strong> Section 199A deduction. See instructions
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$FormData/Section199ADeductionAmt"/>
							</xsl:call-template>
							<span class="sty990TDotLn">.................</span>
						</div>
						<div class="styLNRightNumBox">9</div>
						<div class="styLNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/Section199ADeductionAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Part 1, Line 10 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBox">10</div>
						<div class="styLNDesc">
							<strong>Total deductions. </strong> Add lines 8 and 9
							<span class="sty990TDotLn">......................</span>
						</div>
						<div class="styLNRightNumBox">10</div>
						<div class="styLNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TotalDeductionAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Part 1, Line 11 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBox">11</div>
						<div class="styLNDesc" style="height:auto;">
							<strong>Unrelated business taxable income. </strong> 
							Subtract line 10 from line 7. If line 10 is greater than line 7, enter zero
							<span class="sty990TDotLn">................................</span>
						</div>
						<div class="styLNRightNumBoxNBB" style="height:auto;"><br />11</div>
						<div class="styLNAmountBoxNBB" style="height:auto;"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TotalUBTIAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Part 2 -->
					<div class="styStdDiv" style="border-bottom:1px solid black;border-top:1px solid black;">
						<div class="styPartName">Part II</div>
						<div class="styPartDesc" style="">
							Tax Computation
						</div>
					</div>
					<!-- Part 2, Line 1 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD">1</div>
						<div class="styLNDesc">
							<strong>Organizations taxable as corporations. </strong> Multiply Part I, line 11 by 21% (0.21)
							<span class="sty990TDotLn" style="margin-right:-5px;">.......</span>
						</div>
						<div class="styLNRightNumBox">1</div>
						<div class="styLNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TaxableCorporationAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Part 2, Line 2 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD">2</div>
						<div class="styLNDesc" style="height:auto;">
							<strong>Trusts taxable at trust rates. </strong> See instructions for tax computation. Income tax
							 on the amount on <br />
							 Part I, line 11 from: 
							<input type="checkbox" class="styCkboxNM" style="margin-left:2mm;" alt="Tax rate schedule">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$FormData/TaxRateScheduleInd"/>
									<xsl:with-param name="BackupName">IRS990TTaxRateScheduleInd</xsl:with-param>
								</xsl:call-template>
							</input>
							Tax rate schedule or
							<input type="checkbox" class="styCkboxNM" style="margin-left:3mm;" alt="Schedule D Form 1041">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$FormData/Form1041ScheduleDInd"/>
									<xsl:with-param name="BackupName">IRS990TForm1041ScheduleDInd</xsl:with-param>
								</xsl:call-template>
							</input>
							Schedule D (Form 1041)
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$FormData/Form1041ScheduleDInd"/>
							</xsl:call-template>
							<span class="sty990TDotLn" style="margin-right:-5px;">........</span>
						</div>
						<div class="styLNRightNumBox" style="height:7.5mm;"><br />2</div>
						<div class="styLNAmountBox" style="height:7.5mm;"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TaxableTrustAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Part 2, Line 3 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD">3</div>
						<div class="styLNDesc">
							<strong>Proxy tax. </strong> See instructions
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$FormData/ProxyTaxAmt"/>
							</xsl:call-template>
							<span class="sty990TDotLn" style="margin-right:-5px;">.......................</span>
						</div>
						<div class="styLNRightNumBox">3</div>
						<div class="styLNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/ProxyTaxAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Part 2, Line 4a -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD">4a</div>
						<div class="styLNDesc">
							Amount from Form 4255, Part I, line 3, column (q)
							<span class="sty990TDotLn">..................</span>
						</div>
						<div class="styLNRightNumBox">4a</div>
						<div class="styLNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TotalChapter1TaxAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Part 2, Line 4b -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD">4b</div>
						<div class="styLNDesc">
							Other tax amounts. See instructions
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$FormData/OtherTaxAmt"/>
							</xsl:call-template>
							<xsl:call-template name="LinkToLeftoverDataTableInline">
								<xsl:with-param name="TargetNode" select="$FormData/OtherTaxAmt/@section1291Cd"/>
								<xsl:with-param name="Desc">Part II, Line 4 - Section 1291 Code</xsl:with-param>
							</xsl:call-template>
							<xsl:call-template name="LinkToLeftoverDataTableInline">
								<xsl:with-param name="TargetNode" select="$FormData/OtherTaxAmt/@section1291Amt"/>
								<xsl:with-param name="Desc">Part II, Line 4 - Section 1291 Amount</xsl:with-param>
							</xsl:call-template>
							<span class="sty990TDotLn">....................</span>
						</div>
						<div class="styLNRightNumBox">4b</div>
						<div class="styLNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/OtherTaxAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Part 2, Line 5 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD">5</div>
						<div class="styLNDesc">
							Alternative minimum tax
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$FormData/AlternativeMinimumTaxAmt"/>
							</xsl:call-template>
							<span class="sty990TDotLn">.........................</span>
						</div>
						<div class="styLNRightNumBox">5</div>
						<div class="styLNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/AlternativeMinimumTaxAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Part 2, Line 6 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD">6</div>
						<div class="styLNDesc">
							<strong>Tax on noncompliant facility income. </strong> See instructions
							<span class="sty990TDotLn">................</span>
						</div>
						<div class="styLNRightNumBox">6</div>
						<div class="styLNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/NoncompliantFacilityIncmTaxAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Part 2, Line 7 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD">7</div>
						<div class="styLNDesc">
							<strong>Total. </strong> Add lines 3 through 6 to	 line 1 or 2, whichever applies
							<span class="sty990TDotLn">...............</span>
						</div>
						<div class="styLNRightNumBoxNBB">7</div>
						<div class="styLNAmountBoxNBB">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TotalTaxComputationAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Part 3 -->
					<div class="styStdDiv" style="border-top:1px solid black;border-bottom:1px solid black;">
						<div class="styPartName">Part III</div>
						<div class="styPartDesc">
							Tax and Payments
						</div>
					</div>
					<!-- Part 3, Line 1a -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD">1a</div>
						<div class="styLNDesc" style="width:98mm;">
							Foreign tax credit (corporations attach Form 1118; trusts attach Form 1116)
						</div>
						<div class="styLNRightNumBox">1a</div>
						<div class="styLNAmountBox">
							<span style="float:left;">
								<xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode" select="$FormData/ForeignTaxCreditAmt"/>
								</xsl:call-template>
							</span>
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/ForeignTaxCreditAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;">&nbsp;</div>
						<div class="styLNAmountBoxNBB">&nbsp;</div>
					</div>
					<!-- Part 3, Line 1b -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD" style="padding-left:4.2mm;">b</div>
						<div class="styLNDesc" style="width:98mm;">
							Other credits (see instructions)
							<span class="sty990TDotLn">..............</span>
						</div>
						<div class="styLNRightNumBox">1b</div>
						<div class="styLNAmountBox">
							<span style="float:left;">
								<xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode" select="$FormData/OtherCreditsAmt"/>
								</xsl:call-template>
							</span>
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/OtherCreditsAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;">&nbsp;</div>
						<div class="styLNAmountBoxNBB">&nbsp;</div>
					</div>
					<!-- Part 3, Line 1c -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD" style="padding-left:4.2mm;">c</div>
						<div class="styLNDesc" style="width:98mm;">
							General business credit. Attach Form 3800 (see instructions)
							<span class="sty990TDotLn">.....</span>
						</div>
						<div class="styLNRightNumBox">1c</div>
						<div class="styLNAmountBox">
							<span style="float:left;">
								<xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode" select="$FormData/CYGenBusinessCreditAllowedAmt"/>
								</xsl:call-template>
							</span>
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CYGenBusinessCreditAllowedAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;">&nbsp;</div>
						<div class="styLNAmountBoxNBB">&nbsp;</div>
					</div>
					<!-- Part 3, Line 1d -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD" style="padding-left:4.2mm;">d</div>
						<div class="styLNDesc" style="width:98mm;">
							Credit for prior year minimum tax (attach Form 8801 or 8827)
							<span class="sty990TDotLn">....</span>
						</div>
						<div class="styLNRightNumBox">1d</div>
						<div class="styLNAmountBox">
							<span style="float:left;">
								<xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode" select="$FormData/CurrentYearMinimumTaxCreditAmt"/>
								</xsl:call-template>
							</span>
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CurrentYearMinimumTaxCreditAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;">&nbsp;</div>
						<div class="styLNAmountBoxNBB">&nbsp;</div>
					</div>
					<!-- Part 3, Line 1e -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD" style="padding-left:4.2mm;">e</div>
						<div class="styLNDesc">
							<strong>Total credits. </strong> Add lines 1a through 1d
							<span class="sty990TDotLn">.....................</span>
						</div>
						<div class="styLNRightNumBox">1e</div>
						<div class="styLNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TotalCreditsAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Part 3, Line 2 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD">2</div>
						<div class="styLNDesc">
							Subtract line 1e from Part II, line 7
							<span class="sty990TDotLn">.......................</span>
						</div>
						<div class="styLNRightNumBox">2</div>
						<div class="styLNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TaxLessCreditsAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Part 3, Line 3a -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD">3a</div>
						<div class="styLNDesc" style="width:98mm;">
							Amount from Form 4255, Part I, line 3, column (r) (see instructions)
							<span class="sty990TDotLn">..</span>
						</div>
						<div class="styLNRightNumBox">3a</div>
						<div class="styLNAmountBox">
							<span style="float:left;">
								<xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode" select="$FormData/TotalNonChapter1TaxAmt"/>
								</xsl:call-template>
							</span>
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TotalNonChapter1TaxAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;">&nbsp;</div>
						<div class="styLNAmountBoxNBB">&nbsp;</div>
					</div>
					<!-- Part 3, Line 3b -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD" style="padding-left:4.2mm;">b</div>
						<div class="styLNDesc" style="width:98mm;">
							Amount due from Form 8611
							<span class="sty990TDotLn">...............</span>
						</div>
						<div class="styLNRightNumBox">3b</div>
						<div class="styLNAmountBox">
							<span style="float:left;">
								<xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode" select="$FormData/RecaptureTaxAmt"/>
								</xsl:call-template>
							</span>
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/RecaptureTaxAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;">&nbsp;</div>
						<div class="styLNAmountBoxNBB">&nbsp;</div>
					</div>
					<!-- Part 3, Line 3c -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD" style="padding-left:4.2mm;">c</div>
						<div class="styLNDesc" style="width:98mm;">
							Amount due from Form 8697
							<span class="sty990TDotLn">...............</span>
						</div>
						<div class="styLNRightNumBox">3c</div>
						<div class="styLNAmountBox">
							<span style="float:left;">
								<xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode" select="$FormData/NetAmtOfInterestOwedAmt"/>
								</xsl:call-template>
							</span>
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/NetAmtOfInterestOwedAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;">&nbsp;</div>
						<div class="styLNAmountBoxNBB">&nbsp;</div>
					</div>
					<!-- Part 3, Line 3d -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD" style="padding-left:4.2mm;">d</div>
						<div class="styLNDesc" style="width:98mm;">
							Amount due from Form 8866
							<span class="sty990TDotLn">...............</span>
						</div>
						<div class="styLNRightNumBox">3d</div>
						<div class="styLNAmountBox">
							<span style="float:left;">
								<xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode" select="$FormData/IntDueUndLkbckMthdIncmFrcstAmt"/>
								</xsl:call-template>
							</span>
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/IntDueUndLkbckMthdIncmFrcstAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;">&nbsp;</div>
						<div class="styLNAmountBoxNBB">&nbsp;</div>
					</div>
					<!-- Part 3, Line 3e -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD" style="padding-left:4.2mm;">e</div>
						<div class="styLNDesc" style="width:98mm;">
							Other amounts due (see instructions)
							<span class="sty990TDotLn">............</span>
						</div>
						<div class="styLNRightNumBox">3e</div>
						<div class="styLNAmountBox">
							<span style="float:left;">
								<xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode" select="$FormData/OtherAmt"/>
								</xsl:call-template>
							</span>
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/OtherAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;">&nbsp;</div>
						<div class="styLNAmountBoxNBB">&nbsp;</div>
					</div>
					<!-- Part 3, Line 3f -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD" style="padding-left:4.2mm;">f</div>
						<div class="styLNDesc">
							Total amounts due. Add lines 3a through 3e
							<xsl:call-template name="LinkToLeftoverDataTableInline">
								<xsl:with-param name="TargetNode" select="$FormData/OtherTaxesAmt/@section1291InterestCd"/>
								<xsl:with-param name="Desc">Section 1291 Interest Code</xsl:with-param>
							</xsl:call-template>
							<xsl:call-template name="LinkToLeftoverDataTableInline">
								<xsl:with-param name="TargetNode" select="$FormData/OtherTaxesAmt/@section1291InterestAmt"/>
								<xsl:with-param name="Desc">Section 1291 Interest Amount</xsl:with-param>
							</xsl:call-template>
							<xsl:call-template name="LinkToLeftoverDataTableInline">
								<xsl:with-param name="TargetNode" select="$FormData/OtherTaxesAmt/@section1294InterestCd"/>
								<xsl:with-param name="Desc">Section 1294 Interest Code</xsl:with-param>
							</xsl:call-template>
							<xsl:call-template name="LinkToLeftoverDataTableInline">
								<xsl:with-param name="TargetNode" select="$FormData/OtherTaxesAmt/@section1294InterestAmt"/>
								<xsl:with-param name="Desc">Section 1294 Interest Amount</xsl:with-param>
							</xsl:call-template>
							<span class="sty990TDotLn">................</span>
						</div>
						<div class="styLNRightNumBox">3f</div>
						<div class="styLNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/OtherTaxesAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Part 3, Line 4 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD">4</div>
						<div class="styLNDesc" style="height:auto;">
							<strong>Total tax. </strong> Add lines 2 and 3f (see instructions). 
							<input type="checkbox" class="styCkboxNM" alt="section 1294 indicator" style="margin-left:1mm;">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$FormData/Section1294Ind"/>
									<xsl:with-param name="BackupName">IRS990TSection1294Ind</xsl:with-param>
								</xsl:call-template>
							</input>
							Check if includes tax previously deferred under <br /> section 1294. Enter the tax amount here
							<span style="width:75mm;height:auto;border-bottom:1px solid black;text-align:right;">
								<xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode" select="$FormData/Section1294Ind"/>
								</xsl:call-template>
								<span style="width:7px;"/>
								<xsl:choose>
									<xsl:when test="$FormData/Section1294tAmt">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/Section1294tAmt"/>
										</xsl:call-template>
									</xsl:when>
									<xsl:otherwise>
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/Section1294Amt"/>
										</xsl:call-template>
									</xsl:otherwise>
								</xsl:choose>
							</span>
						</div>
						<div class="styLNRightNumBoxNBB" style="height:8.2mm;padding-top:1.4mm;"><br />4</div>
						<div class="styLNAmountBoxNBB" style="height:8.2mm;padding-top:1.4mm;"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TotalTaxAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<div class="styStdDiv pageEnd" style="border-top:1px solid black;">
						<span style="font-weight:bold;font-family:Arial;">For Paperwork Reduction Act Notice, see 
						 instructions.</span>
						<span style="margin-left:20mm;">Cat. No. 11291J</span>
						<span style="float:right;">Form <strong>990-T</strong> (2025)</span>
					</div>
					<!-- Page 2 -->
					<div class="styStdDiv" style="border-bottom:1px solid black;">
						Form 990-T (2025)
						<div style="float:right;">Page <strong>2</strong></div>
					</div>
					<!-- Part 3 Cont -->
					<div class="styStdDiv" style="border-bottom:1px solid black;">
						<div class="styPartName">Part III</div>
						<div class="styPartDesc">
							Tax and Payments  <span style="font-weight:normal;font-style:italic;">(continued)</span>
						</div>
					</div>
					<!-- Part 3, Line 5a -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD">5a</div>
						<div class="styLNDesc">
							Current net 965 tax liability paid from Form 965-A, Part II, column (k)
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$FormData/PaidTaxLiabilityAmt"/>
							</xsl:call-template>
							<span class="sty990TDotLn">...........</span>
						</div>
						<div class="styLNRightNumBox">5a</div>
						<div class="styLNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/PaidTaxLiabilityAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Part 3, Line 5b -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD" style="padding-left:4.2mm;">b</div>
						<div class="styLNDesc">
							First installment of section 1062 applicable net tax liability. Enter amount from Form 1062, line 15
							<span class="sty990TDotLn">...</span>
						</div>
						<div class="styLNRightNumBox">5b</div>
						<div class="styLNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/FirstInstallmentSect1062TaxAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Part 3, Line 6a -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD">6a</div>
						<div class="styLNDesc" style="width:98mm;">
							Payments: Preceding year's overpayment credited to the current year
							<span class="sty990TDotLn">..</span>
						</div>
						<div class="styLNRightNumBox">6a</div>
						<div class="styLNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/PriorYearOverpaymentCreditAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;">&nbsp;</div>
						<div class="styLNAmountBoxNBB">&nbsp;</div>
					</div>
					<!-- Part 3, Line 6b -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD" style="padding-left:4.2mm;">b</div>
						<div class="styLNDesc" style="width:98mm;height:auto;">
							Current Year's estimated tax payments. Check if section 643(g) election applies 
							<input type="checkbox" class="styCkboxNM" aria-label="section 643 g election indicator">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$FormData/Section643gElectionInd"/>
									<xsl:with-param name="BackupName">IRS990TSection643gElectionInd</xsl:with-param>
								</xsl:call-template>
							<span class="sty990TDotLn">....................</span>
							</input>
						</div>
						<div class="styLNRightNumBox" style="height:7.5mm;padding-top:4mm">6b</div>
						<div class="styLNAmountBox" style="height:7.5mm;padding-top:4mm">
							<span style="float:left;">
								<xsl:call-template name="LinkToLeftoverDataTableInline">
									<xsl:with-param name="TargetNode" 
									 select="$FormData/Section643gElectionInd/@section643gElectionAmt"/>
									<xsl:with-param name="Desc">Part III, Line 6b - Section 643(g) Election Amount
									</xsl:with-param>
								</xsl:call-template>
							</span>
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/EstimatedTaxPaymentsAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBoxNBB" style="height:7.5mm;background-color:lightgrey;">&nbsp;</div>
						<div class="styLNAmountBoxNBB" style="height:7.5mm;">&nbsp;</div>
					</div>
					<!-- Part 3, Line 6c -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD" style="padding-left:4.2mm;">c</div>
						<div class="styLNDesc" style="width:98mm;">
							Tax deposited with Form 8868
							<span class="sty990TDotLn">..............</span>
						</div>
						<div class="styLNRightNumBox">6c</div>
						<div class="styLNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/ExtsnRequestIncomeTaxPaidAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;">&nbsp;</div>
						<div class="styLNAmountBoxNBB">&nbsp;</div>
					</div>
					<!-- Part 3, Line 6d -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD" style="padding-left:4.2mm;">d</div>
						<div class="styLNDesc" style="width:98mm;">
							Foreign organizations: Tax paid or withheld at source (see instructions)
							<span class="sty990TDotLn">.</span>
						</div>
						<div class="styLNRightNumBox">6d</div>
						<div class="styLNAmountBox">
							<span style="float:left;">
								<xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode" select="$FormData/ForeignTaxPdWithheldAtSrceAmt"/>
								</xsl:call-template>
							</span>
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/ForeignTaxPdWithheldAtSrceAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;">&nbsp;</div>
						<div class="styLNAmountBoxNBB">&nbsp;</div>
					</div>
					<!-- Part 3, Line 6e -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD" style="padding-left:4.2mm;">e</div>
						<div class="styLNDesc" style="width:98mm;">
							Backup withholding (see instructions)
							<span class="sty990TDotLn">............</span>
						</div>
						<div class="styLNRightNumBox">6e</div>
						<div class="styLNAmountBox">
							<span style="float:left;">
								<xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode" select="$FormData/BackupWithholdingAmt"/>
								</xsl:call-template>
							</span>
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/BackupWithholdingAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;">&nbsp;</div>
						<div class="styLNAmountBoxNBB">&nbsp;</div>
					</div>
					<!-- Part 3, Line 6f -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD" style="padding-left:4.2mm;">f</div>
						<div class="styLNDesc" style="width:98mm;">
							Credit for small employer health insurance premiums (attach Form 8941)
							<span class="sty990TDotLn">.</span>
						</div>
						<div class="styLNRightNumBox">6f</div>
						<div class="styLNAmountBox">
							<span style="float:left;">
								<xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode" select="$FormData/SmllEmplrHIPTaxExemptCreditAmt"/>
								</xsl:call-template>
							</span>
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/SmllEmplrHIPTaxExemptCreditAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;">&nbsp;</div>
						<div class="styLNAmountBoxNBB">&nbsp;</div>
					</div>
					<!-- Part 3, Line 6g -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD" style="padding-left:4.2mm;">g</div>
						<div class="styLNDesc" style="width:98mm;">
							Elective payment election amount from Form 3800
							<span class="sty990TDotLn">........</span>
						</div>
						<div class="styLNRightNumBox">6g</div>
						<div class="styLNAmountBox">
							<span style="float:left;">
								<xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode" select="$FormData/ElectivePaymentAmt"/>
								</xsl:call-template>
							</span>
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/ElectivePaymentAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;">&nbsp;</div>
						<div class="styLNAmountBoxNBB">&nbsp;</div>
					</div>
					<!-- Part 3, Line 6h -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD" style="padding-left:4.2mm;">h</div>
						<div class="styLNDesc" style="width:98mm;">
							Payment from Form 2439
							<span class="sty990TDotLn">................</span>
						</div>
						<div class="styLNRightNumBox">6h</div>
						<div class="styLNAmountBox">
							<span style="float:left;">
								<xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode" select="$FormData/TotalUndistributedLTCapGainAmt"/>
								</xsl:call-template>
							</span>
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TotalUndistributedLTCapGainAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;">&nbsp;</div>
						<div class="styLNAmountBoxNBB">&nbsp;</div>
					</div>
					<!-- Part 3, Line 6i -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD" style="padding-left:4.2mm;">i</div>
						<div class="styLNDesc" style="width:98mm;">
							Credit from Form 4136
							<span class="sty990TDotLn">.................</span>
						</div>
						<div class="styLNRightNumBox">6i</div>
						<div class="styLNAmountBox">
							<span style="float:left;">
								<xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode" select="$FormData/TotalFuelTaxCreditAmt"/>
								</xsl:call-template>
							</span>
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TotalFuelTaxCreditAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;">&nbsp;</div>
						<div class="styLNAmountBoxNBB">&nbsp;</div>
					</div>
					<!-- Part 3, Line 6j -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD" style="padding-left:4.2mm;">j</div>
						<div class="styLNDesc" style="width:98mm;">
							Other (see instructions)
							<span class="sty990TDotLn">................</span>
						</div>
						<div class="styLNRightNumBox">6j</div>
						<div class="styLNAmountBox">
							<span style="float:left;">
								<xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode" select="$FormData/CreditsAdjPaymentOtherAmt"/>
								</xsl:call-template>
							</span>
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CreditsAdjPaymentOtherAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;">&nbsp;</div>
						<div class="styLNAmountBoxNBB">&nbsp;</div>
					</div>
					<!-- Part 3, Line 6k -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD" style="padding-left:4.2mm;">k</div>
						<div class="styLNDesc" style="width:98mm;">
							Section 1062 applicable net tax liability. Enter amount from Form 1062,<br/>
							line 14
							<span class="sty990TDotLn">......................</span>
						</div>
						<div class="styLNRightNumBox" style="height:7mm;padding-top:4mm">6k</div>
						<div class="styLNAmountBox" style="height:7mm;padding-top:4mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TotalLiabilitySect1062TaxAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;height:7mm">&nbsp;</div>
						<div class="styLNAmountBoxNBB" style="height:7mm">&nbsp;</div>
					</div>
					<!-- Part 3, Line 7 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD">7</div>
						<div class="styLNDesc">
							<strong>Total payments and section 1062 applicable net tax liability. </strong> Add lines 6a through 6k
							<span class="sty990TDotLn">.....</span>
						</div>
						<div class="styLNRightNumBox">7</div>
						<div class="styLNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TotalPaymentsAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Part 3, Line 8 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD">8</div>
						<div class="styLNDesc" style="height:4.5mm;">
							Estimated tax penalty (see instructions). Check if Form 2220 is attached 
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$FormData/Form2220AttachedInd"/>
							</xsl:call-template>
							<span style="float:right;">
								<span class="sty990TDotLn" style="float:none;padding-right:1px;">........</span>								
								<input type="checkbox" class="styCkboxNM" aria-label="form 2220 attached">
									<xsl:call-template name="PopulateCheckbox">
										<xsl:with-param name="TargetNode" select="$FormData/Form2220AttachedInd"/>
										<xsl:with-param name="BackupName">IRS990TForm2220AttachedInd</xsl:with-param>
									</xsl:call-template>
								</input>
							</span>
						</div>
						<div class="styLNRightNumBox" style="height:4.5mm;">8</div>
						<div class="styLNAmountBox" style="height:4.5mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/ESPenaltyAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Part 3, Line 9 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD">9</div>
						<div class="styLNDesc">
							<strong>Tax due. </strong> If line 7 is smaller than the total of lines 4, 5a, 5b, and 8, enter amount owed
							<span class="sty990TDotLn" style="margin-right:-6px;">.......</span>
						</div>
						<div class="styLNRightNumBox">9</div>
						<div class="styLNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/BalanceDueAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Part 3, Line 10 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBox">10</div>
						<div class="styLNDesc">
							<strong>Overpayment. </strong> If line 7 is larger than the total of lines 4, 5a, 5b, and 8, enter
							 amount overpaid
							<span class="sty990TDotLn" style="margin-right:-6px;">....</span>
						</div>
						<div class="styLNRightNumBox">10</div>
						<div class="styLNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/OverpaymentSection/OverpaymentAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Part 3, Line 11 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBox">11</div>
						<div class="styLNDesc" style="height:4mm;">
							Enter the amount of line 10 you want: <strong>Credited to 2026 estimated tax</strong>
							<span style="width:25mm;border-bottom:1px solid black;text-align:right;padding-right:3px;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" 
										select="$FormData/OverpaymentSection/AppliedToESTaxAmt"/>
								</xsl:call-template>
							</span>
							<span style="width:2mm"> </span>
							<strong>Refunded</strong>
							
						</div>
						<div class="styLNRightNumBox" style="height:4mm;padding-top:1mm;border-bottom-width:1px">11</div>
						<div class="styLNAmountBox" style="height:4mm;padding-top:1mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/OverpaymentSection/RefundAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<div class="styStdDiv">
						<div class="styLNLeftNumBox"></div>
						<div class="styLNDesc" style="height:4mm;">
						For Refunded amount, also complete and attach Form 8050. See instructions.
						</div>
						<div class="styLNRightNumBoxNBB" style="height:4mm;background-color:lightgrey"></div>
						<div class="styLNAmountBoxNBB" style="height:4mm;background-color:lightgrey">
						</div>
					</div>
					<!-- Part 4 -->
					<div class="styStdDiv" style="border-bottom:1px solid black;border-top:1px solid black;">
						<div class="styPartName">Part IV</div>
						<div class="styPartDesc" style="">
							Statements Regarding Certain Activities and Other Information 
							<span style="font-weight:normal;">(see instructions)</span>
						</div>
					</div>
					<!-- Part 4, Line 1 -->
					<div class="styStdDiv" style="">
						<div class="styLNLeftNumBoxSD">1</div>
						<div class="styLNDesc" style="height:auto;width:162mm;">
							At any time during the 2025 calendar year, did the organization have an interest in or a 
							signature or other authority over a financial account (bank, securities, or other) in a foreign
							country? If "Yes," the organization may have to file FinCEN Form 114, Report of Foreign Bank and
							Financial Accounts. If "Yes," enter the name of the foreign country here 
							<span style="width:160mm;border-bottom:1px dashed black;">
								<xsl:for-each select="$FormData/ForeignCountryCd">
									<xsl:if test="position() &gt; 1">&nbsp;</xsl:if>
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="."/>
									</xsl:call-template>
								</xsl:for-each>
							</span>
						</div>
						<div class="styLNRightNumBox">Yes</div>
						<div class="styLNRightNumBox">No</div>
						<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;height:5.5mm;">&nbsp;</div>
						<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;height:5.5mm;">&nbsp;</div>
						<div class="styLNRightNumBox">
							<xsl:call-template name="PopulateYesBoxText">
								<xsl:with-param name="TargetNode" select="$FormData/ForeignAccountsQuestionInd"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBox">
							<xsl:call-template name="PopulateNoBoxText">
								<xsl:with-param name="TargetNode" select="$FormData/ForeignAccountsQuestionInd"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Part 4, Line 2 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD">2</div>
						<div class="styLNDesc" style="width:162mm;">
							During the tax year, did the organization receive a distribution from, or was it the grantor of, or transferor to, a foreign trust?
						</div>
						<div class="styLNRightNumBox">
							<xsl:call-template name="PopulateYesBoxText">
								<xsl:with-param name="TargetNode" select="$FormData/ForeignTrustQuestionInd"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBox">
							<xsl:call-template name="PopulateNoBoxText">
								<xsl:with-param name="TargetNode" select="$FormData/ForeignTrustQuestionInd"/>
							</xsl:call-template>
						</div>
					</div>
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD">&nbsp;</div>
						<div class="styLNDesc" style="width:162mm;">
							If "Yes," see instructions for other forms the organization may have to file.
						</div>
						<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;">&nbsp;</div>
						<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;">&nbsp;</div>
					</div>
					<!-- Part 4, Line 3 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD">3</div>
						<div class="styLNDesc" style="width:162mm;">
							Enter the amount of tax-exempt interest received or accrued during the tax year 
							<span class="sty990TDotLn" style="float:none;padding-left:4mm;">.....</span>
							 $ 
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TaxExemptInterestAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;">&nbsp;</div>
						<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;">&nbsp;</div>
					</div>
					<!-- Part 4, Line 4 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD">4</div>
						<div class="styLNDesc" style="width:162mm;height:7.5mm;">
							Enter available pre-2018 NOL carryovers here.	 $ 
							<span style="width:25mm;border-bottom:1px solid black;padding-right:0.5mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/AvlblPre2018NOLCarryoverAmt"/>
								</xsl:call-template>
							</span>. 
							Do not include any post-2017 NOL carryover shown on Schedule A (Form 990-T). 
							Don't reduce the NOL carryover shown here by any deduction reported on Part I, line 4.
						</div>
						<div class="styLNRightNumBoxNBB" style="height:7.5mm;background-color:lightgrey;">&nbsp;</div>
						<div class="styLNRightNumBoxNBB" style="height:7.5mm;background-color:lightgrey;">&nbsp;</div>
					</div>
					<!-- Part 4, Line 5 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD">5</div>
						<div class="styLNDesc" style="width:162mm;min-height:7.5mm;">
							Post-2017 NOL carryovers. Enter the Business Activity Code and available post-2017 NOL 
							carryovers. Don't reduce the amounts shown below by any NOL claimed on any Schedule A, Part II,
							line 17 for	the tax year. See instructions.
						</div>
						<div class="styLNRightNumBoxNBB" style="height:8mm;background-color:lightgrey;">&nbsp;</div>
						<div class="styLNRightNumBoxNBB" style="height:8mm;background-color:lightgrey;">&nbsp;</div>
					</div>
					<xsl:variable name="NolCount" select="count($FormData/Post2017NOLCarryoverGrp)"/>
					<xsl:variable name="SepNol" select="($Print = $Separated) and ($NolCount &gt; 4)"/>
					<div class="styStdDiv">
						<table style="display:table;border-collapse:collapse;">
							<thead class="styTableThead">
								<tr>
									<th class="styTableCellHeader" scope="col" style="width:85mm;font-weight:normal;border-top-width:1px;">
										Business activity code
									</th>
									<th class="styTableCellHeader" scope="col" style="width:85.2mm;font-weight:normal;border-top-width:1px;">
										Available post-2017 NOL carryover
									</th>
									<th class="styTableCellHeader" scope="col" style="width:7.9mm;font-weight:normal;background-color:lightgrey;border-bottom-width:0px;border-top:1px solid lightgrey;">
										&nbsp;
									</th>
									<th class="styTableCellHeader" scope="col" style="width:8mm;font-weight:normal;background-color:lightgrey;border-bottom-width:0px;border-top:1px solid lightgrey;border-right-width:0px;">
										&nbsp;
									</th>
								</tr>
							</thead>
							<tbody>
								<xsl:if test="not($SepNol)">
									<xsl:for-each select="$FormData/Post2017NOLCarryoverGrp">
										<tr>
											<td class="styTableCellTextInherit">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="PrincipalBusinessActivityCd"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellAmtInherit">
												<span style="float:left;">$</span>
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="AvlblPost2017NOLCarryoverAmt"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellTextInherit" style="background-color:lightgrey;border-top-width:0px;border-bottom-width:1px;">
												&nbsp;
											</td>
											<td class="styTableCellTextInherit" style="background-color:lightgrey;border-top-width:0px;border-bottom-width:1px;border-right-width:0px;">
												&nbsp;
											</td>
										</tr>
									</xsl:for-each>
								</xsl:if>
								<xsl:if test="($NolCount &lt; 1) or $SepNol">
									<tr>
										<td class="styTableCellTextInherit">
											<xsl:if test="$SepNol">See Additional Data</xsl:if>
											&nbsp;
										</td>
										<td class="styTableCellTextInherit">
											$
										</td>
										<td class="styTableCellTextInherit" style="background-color:lightgrey;border-top-width:0px;border-bottom-width:0px;">
											&nbsp;
										</td>
										<td class="styTableCellTextInherit" style="background-color:lightgrey;border-top-width:0px;border-bottom-width:0px;border-right-width:0px;">
											&nbsp;
										</td>
									</tr>
								</xsl:if>
								<xsl:if test="($NolCount &lt; 2) or $SepNol">
									<tr>
										<td class="styTableCellTextInherit">
											&nbsp;
										</td>
										<td class="styTableCellTextInherit">
											$
										</td>
										<td class="styTableCellTextInherit" style="background-color:lightgrey;border-top-width:0px;border-bottom-width:0px;">
											&nbsp;
										</td>
										<td class="styTableCellTextInherit" style="background-color:lightgrey;border-top-width:0px;border-bottom-width:0px;border-right-width:0px;">
											&nbsp;
										</td>
									</tr>
								</xsl:if>
								<xsl:if test="($NolCount &lt; 3) or $SepNol">
									<tr>
										<td class="styTableCellTextInherit">
											&nbsp;
										</td>
										<td class="styTableCellTextInherit">
											$
										</td>
										<td class="styTableCellTextInherit" style="background-color:lightgrey;border-top-width:0px;border-bottom-width:0px;">
											&nbsp;
										</td>
										<td class="styTableCellTextInherit" style="background-color:lightgrey;border-top-width:0px;border-bottom-width:0px;border-right-width:0px;">
											&nbsp;
										</td>
									</tr>
								</xsl:if>
								<xsl:if test="($NolCount &lt; 4) or $SepNol">
									<tr>
										<td class="styTableCellTextInherit">
											&nbsp;
										</td>
										<td class="styTableCellTextInherit">
											$
										</td>
										<td class="styTableCellTextInherit" style="background-color:lightgrey;border-top-width:0px;">
											&nbsp;
										</td>
										<td class="styTableCellTextInherit" style="background-color:lightgrey;border-top-width:0px;border-right-width:0px;">
											&nbsp;
										</td>
									</tr>
								</xsl:if>
							</tbody>
						</table>
					</div>
					<!-- Part 4, Line 6a -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD">6a</div>
						<div class="styLNDesc" style="width:162mm;">
							Reserved for future use 
							<span class="sty990TDotLn">.................................</span>
						</div>
						<div class="styLNRightNumBox" style="background-color:lightgrey">
							<!--<xsl:call-template name="PopulateYesBoxText">
								<xsl:with-param name="TargetNode" select="$FormData/ChangeInMethodOfAccountingInd"/>
							</xsl:call-template>-->
						</div>
						<div class="styLNRightNumBox" style="background-color:lightgrey">
							<!--<xsl:call-template name="PopulateNoBoxText">
								<xsl:with-param name="TargetNode" select="$FormData/ChangeInMethodOfAccountingInd"/>
							</xsl:call-template>-->
						</div>
					</div>
					<!-- Part 4, Line 6b -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD" style="padding-left:4.2mm;">b</div>
						<div class="styLNDesc" style="width:162mm;">
							Reserved for future use 
							<span class="sty990TDotLn">.................................</span>
						</div>
						<div class="styLNRightNumBoxNBB" style="background-color:lightgrey">
							<!--<xsl:call-template name="PopulateYesBoxText">
								<xsl:with-param name="TargetNode" select="$FormData/ProvChangeMethodOfAcctDescInd"/>
							</xsl:call-template>-->
						</div>
						<div class="styLNRightNumBoxNBB" style="background-color:lightgrey">
							<!--<xsl:call-template name="PopulateNoBoxText">
								<xsl:with-param name="TargetNode" select="$FormData/ProvChangeMethodOfAcctDescInd"/>
							</xsl:call-template>-->
						</div>
					</div>
					<!-- Part 5 -->
					<div class="styStdDiv" style="border-bottom:1px solid black;border-top:1px solid black;">
						<div class="styPartName">Part V</div>
						<div class="styPartDesc" style="height:auto;">
							Supplemental Information 
						</div>
					</div>
					<div class="styStdDiv" style="padding-top:1mm;padding-bottom:1mm;border-bottom:1px solid black;">
						Provide any additional information. See instructions.
					</div>
					<!-- Supplemental Information -->
					<xsl:choose>
						<xsl:when test="$FormData/ItmzdSupplementalInfoGrp">
							<table class="styTable" style="width:187mm;border-collapse:collapse;font-size:7pt;">
								<thead class="styTableThead">
									<tr>
										<th class="styTableCellHeader" style="width:30mm;">
											Part Number
										</th>
										<th class="styTableCellHeader" style="width:30mm;">
											Line Number
										</th>
										<th class="styTableCellHeader" style="min-width:70mm;width:97mm;">
											Explanation
										</th>
										<th class="styTableCellHeader" style="width:30mm;border-right-width:0px;">
											Amount
										</th>
									</tr>
								</thead>
								<tbody>
									<xsl:for-each select="$FormData/ItmzdSupplementalInfoGrp">
										<tr style="vertical-align:top;">
											<td class="styTableCellCtrInherit">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="PartNum"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellCtrInherit">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="LineNum"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellTextInherit">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="ExplanationTxt"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellAmtInherit" style="border-right-width:0px;">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="ExplanationAmt"/>
												</xsl:call-template>
											</td>
										</tr>
									</xsl:for-each>
								</tbody>
							</table>
						</xsl:when>
						<xsl:otherwise>
							<div class="styStdDiv" style="padding-bottom:2px;">
								<span style="width:100%;border-bottom:1px dashed black;">&nbsp;</span><br />
								<span style="width:100%;border-bottom:1px dashed black;">&nbsp;</span>
							</div>
						</xsl:otherwise>
					</xsl:choose>
					<!-- Sign Here -->
					<div class="styStdDiv" style="border-bottom:1px solid black;">
						<div class="styGenericDiv" style="width:13mm;height:22.5mm;font-size:12pt;font-weight:bold;padding-top:6mm;border-right:1px solid black;">
							Sign Here
						</div>
						<div class="styGenericDiv" style="width:174mm;font-size:6pt;padding:0.5mm;margin-bottom:4mm;">
							Under penalties of perjury, I declare that I have examined this return, including accompanying schedules and statements, 
							and to the best of my knowledge and belief, it is true, correct, and complete. Declaration of preparer (other than taxpayer) 
							is based on all information of which preparer has any knowledge.<br />
						</div>
						<div class="styGenericDiv" style="width:174mm;">
							<div class="styGenericDiv" style="width:1mm;height:12mm;padding-left:1mm;">
								<!--<img alt="Right arrow" src="{$ImagePath}/1040_Bullet_Lg.gif" height="30" width="10" style="margin-top:3px;"/>-->
							</div>
							<div class="styGenericDiv" style="width:52mm;">
								<span style="width:100%;height:8mm;border-bottom:1px solid black;border-right:1px solid black;vertical-align:bottom;padding-top:2mm;">
									<br />
									<xsl:call-template name="PopulateReturnHeaderOfficer">
										<xsl:with-param name="TargetNode">PersonNm</xsl:with-param>
									</xsl:call-template>
								</span>
								<span>Signature of officer</span>
							</div>
							<div class="styGenericDiv" style="width:16mm;">
								<span style="width:100%;height:8mm;border-bottom:1px solid black;padding-left:0.5mm;padding-top:2mm;">
									<br />
									<xsl:call-template name="PopulateReturnHeaderOfficer">
										<xsl:with-param name="TargetNode">SignatureDt</xsl:with-param>
									</xsl:call-template>
								</span>
								<span>Date</span>
							</div>
							<div class="styGenericDiv" style="width:6mm;height:12mm;padding-left:1mm;">
							</div>
							<div class="styGenericDiv" style="width:52mm;">
								<span style="width:100%;height:8mm;border-bottom:1px solid black;padding-top:2mm;">
									<br />
									<xsl:call-template name="PopulateReturnHeaderOfficer">
										<xsl:with-param name="TargetNode">PersonTitleTxt</xsl:with-param>
									</xsl:call-template>
								</span>
								<span>Title</span>
							</div>
							<div class="styGenericDiv" style="width:40mm;border:2px solid black;font-size:6pt;margin-left:3px;padding:3px;">
								<xsl:call-template name="PopulateSpan">
									<xsl:with-param name="TargetNode" select="$RtnHdrData/BusinessOfficerGrp/DiscussWithPaidPreparerInd"/>
								</xsl:call-template>
								May the IRS discuss this return with the preparer shown below (see instructions)?
								<input type="checkbox" class="styCkboxNM" style="margin-right:2px;" aria-label="Discuss with paid preparer Yes">
									<xsl:call-template name="PopulateReturnHeaderOfficer">
										<xsl:with-param name="TargetNode">AuthorizeThirdPartyYesCheckbox</xsl:with-param>
										<xsl:with-param name="BackupName">IRS990TAuthorizeThirdPartyYesCheckbox</xsl:with-param>
									</xsl:call-template>
								</input>
								<span style="font-weight:bold;">Yes</span>
								<input type="checkbox" class="styCkboxNM" style="margin-left:6px;margin-right:2px;" aria-label="Discuss with paid preparer No">
									<xsl:call-template name="PopulateReturnHeaderOfficer">
										<xsl:with-param name="TargetNode">AuthorizeThirdPartyNoCheckbox</xsl:with-param>
										<xsl:with-param name="BackupName">IRS990TAuthorizeThirdPartyNoCheckbox</xsl:with-param>
									</xsl:call-template>
								</input>
								<span style="font-weight:bold;">No</span>
							</div>
						</div>
					</div>
					
					<!-- Implementing the preparer section in table -->
					<div class="styStdDiv" style="font-size:6pt;">
            <div style="width:22.75mm;padding-top:4mm;float:left;clear:none;height:auto;">
              <span class="styMainTitle" style="font-size:11pt;height:auto;">
                  Paid
                  Preparer
                  Use Only
                  </span>
            </div>
            <div style="width:164mm;float:left;clear:none;">
              <div style="width:164mm;float:left;clear:none;border-style:solid;border-color:black;border-width:0px 0px 1px 0px;">
                <div class="styLNDesc" style="height:7.5mm;width:46.8mm;padding-top:0mm;border-right:1px solid black;border-left:1px solid black;padding-left:1mm;">
									Enter preparer's name<br/><br/>
									<xsl:call-template name="PopulateReturnHeaderPreparer">
										<xsl:with-param name="TargetNode">PreparerPersonNm</xsl:with-param>
									</xsl:call-template>
                </div>
                <div class="styLNDesc" style="height:7.5mm;width:46.5mm;padding-top:0mm;border-right:1px solid black;padding-left:1mm;">
                Preparer's signature<br/>
              </div>
                <div class="styLNDesc" style="height:7.5mm;width:15mm;border-right:1px solid black;padding-top:0mm;padding-left:1mm;">Date <br/><br/>
                  <xsl:call-template name="PopulateReturnHeaderPreparer">
                    <xsl:with-param name="TargetNode">DatePrepared</xsl:with-param>
                  </xsl:call-template>
                </div>
                <div class="styLNDesc" style="height:7.5mm;width:18mm;border-right:1px solid black;border-left:1px ;padding-top:.5mm;padding-bottom:0mm;padding-left:1mm;">
                  <label>
                    <xsl:call-template name="PopulateReturnHeaderPreparer">
											<xsl:with-param name="TargetNode">SelfEmployedLabel</xsl:with-param>
											<xsl:with-param name="BackupName">PreparerSelfEmployed</xsl:with-param>
										</xsl:call-template>
                    Check 
                  <input type="checkbox" class="styCkboxNM" alt="Self Employed Checkbox">
                      <xsl:call-template name="PopulateReturnHeaderPreparer">
										<xsl:with-param name="TargetNode">SelfEmployedCheckbox</xsl:with-param>
										<xsl:with-param name="BackupName">PreparerSelfEmployed</xsl:with-param>
									</xsl:call-template>
                    </input>
                    <span style="width:4px;"/>if<br/>self-employed
                  </label>
                </div>
                <div class="styLNDesc" style="height:7.5mm;width:16mm;padding-top:0mm;padding-left:1mm;">PTIN
                  <br/>
                  <xsl:call-template name="PopulateReturnHeaderPreparer">
										<xsl:with-param name="TargetNode">SSN</xsl:with-param>
									</xsl:call-template>
									<xsl:call-template name="PopulateReturnHeaderPreparer">
										<xsl:with-param name="TargetNode">PTIN</xsl:with-param>
									</xsl:call-template>
                </div>
              </div>
              <div style="width:164mm;float:left;clear:none;border-bottom:1px ">
                <div class="styLNDesc" style="height:auto;width:108.5mm;border-right:1px solid black; border-left:1px solid black;padding-left:1mm;border-bottom:1px solid black;">
                  <span class="styGenericDiv" style="">Firm's name 
                  <span style="width:2.2mm;"/>
                    <span style="width:4px;"/>
                  </span>
                  <div class="styGenericDiv" style="padding-right:.5mm;">
										<xsl:call-template name="PopulateReturnHeaderPreparerFirm">
											<xsl:with-param name="TargetNode">BusinessNameLine1Txt</xsl:with-param>
										</xsl:call-template>
										<br/>
										<xsl:call-template name="PopulateReturnHeaderPreparerFirm">
											<xsl:with-param name="TargetNode">BusinessNameLine2Txt</xsl:with-param>
										</xsl:call-template>
                  </div>
                </div>
                <div class="styLNDesc" style="height:auto;width:42mm;padding-left:1mm;border-bottom:0px solid black;">Firm's EIN
                  <span style="width:4px;"/>
                  <xsl:call-template name="PopulateReturnHeaderPreparerFirm">
									<xsl:with-param name="TargetNode">EIN</xsl:with-param>
								</xsl:call-template>
                </div>
              </div>
              <div style="width:164mm;float:left;clear:none;">
                <div class="styLNDesc" style="height:auto;width:108.5mm;border-right:1px solid black;border-left:1px solid black;padding-left:1mm;">
                  <div class="styGenericDiv" style="padding-right:.5mm;">Firm's address
                  </div>
                  <br/>
                  <div class="styGenericDiv" style="padding-right:.5mm;">
                    <xsl:call-template name="PopulateReturnHeaderPreparerFirm">
											<xsl:with-param name="TargetNode">AddressLine1Txt</xsl:with-param>
										</xsl:call-template>
										<br/>
										<xsl:call-template name="PopulateReturnHeaderPreparerFirm">
											<xsl:with-param name="TargetNode">AddressLine2Txt</xsl:with-param>
										</xsl:call-template>
										<br/>
										<xsl:call-template name="PopulateReturnHeaderPreparerFirm">
											<xsl:with-param name="TargetNode">CityStateInfo</xsl:with-param>
										</xsl:call-template>
										<br/>
										<xsl:call-template name="PopulateReturnHeaderPreparerFirm">
											<xsl:with-param name="TargetNode">CountryCd</xsl:with-param>
										</xsl:call-template>
                  </div>
                </div>
                <div class="styLNDesc" style="width:55mm;padding-left:1mm;height:auto;border-top:1px solid black;"> Phone no. 
                  <xsl:call-template name="PopulateReturnHeaderPreparer">
									<xsl:with-param name="TargetNode">Phone</xsl:with-param>
								</xsl:call-template>
                </div>
              </div>
            </div>
          </div>
					<div class="styStdDiv pageEnd" style="border-top:1px solid black;">
						<span style="float:right;">Form <strong>990-T</strong> (2025)</span>
					</div>
					<!-- Additonal Data Title Bar and Button -->
					<div class="styLeftOverTitleLine" id="LeftoverData">
						<div class="styLeftOverTitle">
						   Additional Data        
						</div>
						<div class="styLeftOverButtonContainer">
							<input class="styLeftoverTableBtn" type="button" TabIndex="-1" value="Return to Form" 
							 onclick="javascript:returnToWriteInImage();"/>
						</div>
					</div>
					<!-- Additional Data Table -->
					<table class="styLeftOverTbl">
						<xsl:call-template name="PopulateCommonLeftover">
							<xsl:with-param name="TargetNode" select="$FormData"/>
							<xsl:with-param name="DescWidth" select="100"/>
						</xsl:call-template>
						<xsl:for-each select="$FormData/SpecialConditionDesc">
							<xsl:call-template name="PopulateLeftoverRow">
								<xsl:with-param name="TargetNode" select="."/>
								<xsl:with-param name="Desc">Top Left Header - Special Condition Description 
								 <xsl:value-of select="position()"/>
								</xsl:with-param>
							</xsl:call-template>
						</xsl:for-each>
						<xsl:call-template name="PopulateLeftoverRow">
							<xsl:with-param name="TargetNode" 
							 select="$FormData/@accountingPeriodChangeCd"/>
							<xsl:with-param name="Desc">Top Left Header - Change of Accounting Code</xsl:with-param>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRow">
							<xsl:with-param name="TargetNode" 
							 select="$FormData/@accountingPeriodChangeApprvCd"/>
							<xsl:with-param name="Desc">Top left leader – Change of Accounting Reason</xsl:with-param>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRow">
							<xsl:with-param name="TargetNode" 
							 select="$FormData/OrganizationOtherTrustIndGrp/OtherTrustTypeCd"/>
							<xsl:with-param name="Desc">Line G - Other Trust Type Code</xsl:with-param>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRow">
							<xsl:with-param name="TargetNode" 
							 select="$FormData/OrganizationOtherTrustIndGrp/OtherTrustTypeDesc"/>
							<xsl:with-param name="Desc">Line G - Other Trust Type Description</xsl:with-param>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRow">
							<xsl:with-param name="TargetNode" select="$FormData/PrntCorporationNameControlTxt"/>
							<xsl:with-param name="Desc">Line K - Parent Corporation Name Control</xsl:with-param>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRow">
							<xsl:with-param name="TargetNode" select="$FormData/OtherTaxAmt/@section1291Cd"/>
							<xsl:with-param name="Desc">Part II, Line 4 - Section 1291 Code</xsl:with-param>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRowAmount">
							<xsl:with-param name="TargetNode" select="$FormData/OtherTaxAmt/@section1291Amt"/>
							<xsl:with-param name="Desc">Part II, Line 4 - Section 1291 Amount</xsl:with-param>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRow">
							<xsl:with-param name="TargetNode" select="$FormData/OtherTaxesAmt/@section1291InterestCd"/>
							<xsl:with-param name="Desc">Part III, Line 3f - Section 1291 Interest Code</xsl:with-param>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRowAmount">
							<xsl:with-param name="TargetNode" select="$FormData/OtherTaxesAmt/@section1291InterestAmt"/>
							<xsl:with-param name="Desc">Part III, Line 3f - Section 1291 Interest Amount</xsl:with-param>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRow">
							<xsl:with-param name="TargetNode" select="$FormData/OtherTaxesAmt/@section1294InterestCd"/>
							<xsl:with-param name="Desc">Part III, Line 3f - Section 1294 Interest Code</xsl:with-param>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRowAmount">
							<xsl:with-param name="TargetNode" select="$FormData/OtherTaxesAmt/@section1294InterestAmt"/>
							<xsl:with-param name="Desc">Part III, Line 3f - Section 1294 Interest Amount</xsl:with-param>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRowAmount">
							<xsl:with-param name="TargetNode" 
							 select="$FormData/Section643gElectionInd/@section643gElectionAmt"/>
							<xsl:with-param name="Desc">Part III, Line 6b - Section 643(g) Election Amount</xsl:with-param>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRowAmount">
							<xsl:with-param name="TargetNode" 
							 select="$FormData/Form2439Ind/@totalUndistributedLTCapGainAmt"/>
							<xsl:with-param name="Desc">Part III, Line 6g - Total Undistributed Long-Term Capital Gains 
							 Amount
							</xsl:with-param>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRowAmount">
							<xsl:with-param name="TargetNode" select="$FormData/Form4136Ind/@totalFuelTaxCreditAmt"/>
							<xsl:with-param name="Desc">Part III, Line 6g - Total Fuel Tax Credit Amount</xsl:with-param>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRowAmount">
							<xsl:with-param name="TargetNode" 
							 select="$FormData/CreditsAdjPaymentOtherInd/@creditsAdjPaymentOtherAmt"/>
							<xsl:with-param name="Desc">Part III, Line 6g - Other Credits, Adjustments, and Payments Amount
							</xsl:with-param>
						</xsl:call-template>
					</table>
					<xsl:if test="$SepNol">
						<br /><br />
						<span class="styRepeatingDataTitle">Part IV, Line 5 - Post-2017 NOL carryovers</span>
						<table class="styDepTbl" cellspacing="0" style="font-size:7pt;">
							<thead class="styTableThead">
								<tr class="styDepTblHdr">
									<th class="styDepTblCell" scope="col" style="width:40mm;font-weight:normal;">
										Business activity code
									</th>
									<th class="styDepTblCell" scope="col" style="width:40mm;font-weight:normal;">
										Available post-2017 NOL carryover
									</th>
								</tr>
							</thead>
							<tbody>
								<xsl:for-each select="$FormData/Post2017NOLCarryoverGrp">
									<tr style="vertical-align:top;">
										<xsl:attribute name="class">
											<xsl:choose>
												<xsl:when test="position() mod 2 = 1">styDepTblRow1
												</xsl:when>
												<xsl:otherwise>styDepTblRow2
												</xsl:otherwise>
											</xsl:choose>
										</xsl:attribute>
										<td class="styTableCellTextInherit">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="PrincipalBusinessActivityCd"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellAmtInherit">
											<span style="float:left;">$</span>
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="AvlblPost2017NOLCarryoverAmt"/>
											</xsl:call-template>
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
