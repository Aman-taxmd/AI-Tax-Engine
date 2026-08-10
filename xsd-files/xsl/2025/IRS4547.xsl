<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE xsl:stylesheet [
	<!ENTITY nbsp "&#160;"> 
	<!ENTITY mdash "&#8212;"> 
	<!ENTITY bull "&#8226;"> 
]>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fo="http://www.w3.org/1999/XSL/Format" version="1.0">
	<xsl:include href="PopulateTemplate.xsl"/>
	<xsl:include href="AddHeader.xsl"/>
	<xsl:include href="CommonPathRef.xsl"/>
	<xsl:include href="AddOnTable.xsl"/>
	<xsl:include href="IRS4547Style.xsl"/>
	<xsl:output method="html" indent="yes"/>
	<xsl:strip-space elements="*"/>
	<xsl:param name="FormData" select="$RtnDoc/IRS4547"/>
	<xsl:template match="/">
		<xsl:text disable-output-escaping="yes">&lt;!DOCTYPE html&gt;</xsl:text>
		<html>
			<head>
				<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
				<title>
					<xsl:call-template name="FormTitle">
						<xsl:with-param name="RootElement" select="local-name($FormData)"/>
					</xsl:call-template>
				</title>
				<!-- No Browser Caching   -->
				<meta http-equiv="Pragma" content="no-cache"/>
				<meta http-equiv="Cache-Control" content="no-cache"/>
				<meta http-equiv="Expires" content="0"/>
				<!-- No Proxy Caching -->
				<meta http-equiv="Cache-Control" content="private"/>
				<!-- Define Character Set -->
				<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1"/>
				<meta name="Description" content="IRS Form 4547"/>
				<!-- javascript include -->
				<script language="JavaScript" src="{$ScriptPath}/FormDisplay.js" type="text/javascript"/>
				<xsl:call-template name="InitJS"/>
				<style type="text/css">
					<xsl:if test="not($Print) or $Print=''">
						<xsl:call-template name="IRS4547Style"/>
						<xsl:call-template name="AddOnStyle"/>
					</xsl:if>
				</style>
				<xsl:call-template name="GlobalStylesForm"/>
			</head>
			<body class="styBodyClass" style="width:187mm;">
				<xsl:call-template name="DocumentHeader"/>
				<!-- BEGIN FORM HEADER -->
				<div class="styStdDiv">
					<div class="styFNBox" style="width:30mm;height:18mm;">
						Form <span class="styFormNumber">4547</span>
						<xsl:call-template name="SetFormLinkInline">
							<xsl:with-param name="TargetNode" select="$FormData"/>
						</xsl:call-template>
						<br/>
						(December 2025)
						<br/>
						<span class="styAgency">Department of the Treasury</span>
						<span class="styAgency">Internal Revenue Service</span>
					</div>
					<div class="styFTBox" style="width:126mm;height:18mm;padding-top:0.5mm;">
						<span class="styMainTitle" style="font-size:13pt;padding-top:1mm;">Trump Account Election(s)</span>
						<div class="styFST" style="padding-top:4mm;">
							Go to <span style="font-style:italic;">www.irs.gov/Form4547</span> for instructions and the latest information.
						</div>
					</div>
					<div class="styTYBox" style="width:30mm;height:18mm;">
						<div class="styOMB" style="height:5mm;border-bottom:none;margin-top:7mm;">OMB No. 1545-XXXX</div>
					</div>
				</div>
				<div class="styStdDiv" style="border-top:1px solid black;">
					If you have a child that is eligible for a Trump account, and you want to open a Trump account for that child, complete Form 4547.
					<br/>
					<span style="padding-left:2mm;"/>&bull; For each child that is eligible and for whom you want to open a Trump account, complete Parts I, II, and IV.
					<br/>
					<span style="padding-left:2mm;"/>&bull; For each child that is eligible to receive a $1,000 Pilot Program Contribution, check the box in Part III, line 7, in order to receive the contribution.
				</div>
				<!-- Part I - Header -->
				<div class="styStdDiv" style="border-top:1px solid black;">
					<span class="styPartName" style="width:16mm;">Part I</span>
					<span class="styPartDesc" style="width:170mm;height:auto;font-weight:normal;">
						<strong>Parent/Guardian or Other Authorized Individual Information</strong>
						<br/>
						<span style="font-size:7pt;"><b>Note:</b> The parent/guardian or other authorized individual listed in Part I will be the responsible party for the Trump account.</span>
					</span>
				</div>
				<!-- Parent/Guardian Information box -->
				<div class="styStdDiv" style="border-top:1px solid black;">
					<div class="styNameBox" style="width:46mm;font-size:7pt;">
						First name <br/>
						<xsl:call-template name="PopulateText">
							<xsl:with-param name="TargetNode" select="$FormData/ResponsiblePrtyPersonFirstNm"/>
						</xsl:call-template>
					</div>
					<div class="styNameBox" style="width:46mm;font-size:7pt;padding-left:1mm;">
						Middle name <br/>
						<xsl:call-template name="PopulateText">
							<xsl:with-param name="TargetNode" select="$FormData/ResponsiblePrtyPersonMiddleNm"/>
						</xsl:call-template>
					</div>
					<div class="styNameBox" style="width:46mm;font-size:7pt;padding-left:1mm;">
						Last name <br/>
						<xsl:call-template name="PopulateText">
							<xsl:with-param name="TargetNode" select="$FormData/ResponsiblePrtyPersonLastNm"/>
						</xsl:call-template>
					</div>
					<div class="styEINBox" style="padding-left:1mm;font-size:7pt;font-weight:normal;">
						Social security number <br/>
						<xsl:call-template name="PopulateSSN">
							<xsl:with-param name="TargetNode" select="$FormData/ResponsiblePrtySSN"/>
						</xsl:call-template>
					</div>
				</div>
				<div class="styStdDiv" style="border-top:1px solid black;min-height:8mm;">
					<div class="styNameBox" style="width:112mm;font-size:7pt;height:9.5mm;">
						Home address (number and street). If you have a P.O. box, see instructions.<br/>
						<xsl:choose>
							<xsl:when test="$FormData/ResponsiblePrtyUSAddress">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$FormData/ResponsiblePrtyUSAddress/AddressLine1Txt"/>
								</xsl:call-template><br/>
								<xsl:if test="$FormData/ResponsiblePrtyUSAddress/AddressLine2Txt">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$FormData/ResponsiblePrtyUSAddress/AddressLine2Txt"/>
									</xsl:call-template>
								</xsl:if>
							</xsl:when>
							<xsl:otherwise>
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$FormData/ResponsiblePrtyForeignAddress/AddressLine1Txt"/>
								</xsl:call-template><br/>
								<xsl:if test="$FormData/ResponsiblePrtyForeignAddress/AddressLine2Txt">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$FormData/ResponsiblePrtyForeignAddress/AddressLine2Txt"/>
									</xsl:call-template>
								</xsl:if>
							</xsl:otherwise>
						</xsl:choose>
					</div>
					<div class="styNameBox" style="width:26mm;font-size:7pt;padding-left:1mm;height:9.5mm;">
						Apartment number
					</div>
					<div class="styNameBox" style="padding-left:1mm;height:9.5mm;border-right-width:0;font-size:7pt;">
						Date of birth <br/>
						<xsl:call-template name="PopulateMonthDayYear">
							<xsl:with-param name="TargetNode" select="$FormData/ResponsiblePrtyBirthDt"/>
						</xsl:call-template>
					</div>
				</div>
				<div class="styStdDiv" style="border-top:1px solid black;display:flex;">
					<div class="styNameBox" style="width:58mm;font-size:7pt;min-height:9mm;">
						City, town, or post office. If you have a foreign address, also complete spaces below. <br/>
						<xsl:choose>
							<xsl:when test="$FormData/ResponsiblePrtyUSAddress">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$FormData/ResponsiblePrtyUSAddress/CityNm"/>
								</xsl:call-template>
							</xsl:when>
							<xsl:otherwise>
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$FormData/ResponsiblePrtyForeignAddress/CityNm"/>
								</xsl:call-template>
							</xsl:otherwise>
						</xsl:choose>
					</div>
					<div class="styNameBox" style="width:27mm;font-size:7pt;padding-left:1mm;min-height:9mm;">
						County <br/>
						<xsl:call-template name="PopulateText">
							<xsl:with-param name="TargetNode" select="$FormData/ResponsiblePrtyCountyNm"/>
						</xsl:call-template>
					</div>
					<div class="styNameBox" style="width:27mm;font-size:7pt;padding-left:1mm;min-height:9mm;">
						State <br/>
						<xsl:call-template name="PopulateText">
							<xsl:with-param name="TargetNode" select="$FormData/ResponsiblePrtyUSAddress/StateAbbreviationCd"/>
						</xsl:call-template>
					</div>
					<div class="styNameBox" style="width:26mm;font-size:7pt;padding-left:1mm;min-height:9mm;">
						ZIP code <br/>
						<xsl:call-template name="PopulateText">
							<xsl:with-param name="TargetNode" select="$FormData/ResponsiblePrtyUSAddress/ZIPCd"/>
						</xsl:call-template>
					</div>
					<div class="styEINBox" style="width:49mm;padding-left:1mm;min-height:9mm;text-align:left;font-size:7pt;font-weight:normal;word-break:break-all;">
						Phone no. <br/>
						<xsl:choose>
							<xsl:when test="$FormData/ResponsiblePrtyPhoneNum">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$FormData/ResponsiblePrtyPhoneNum"/>
								</xsl:call-template>
							</xsl:when>
							<xsl:otherwise>
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$FormData/ResponsiblePrtyForeignPhoneNum"/>
								</xsl:call-template>
							</xsl:otherwise>
						</xsl:choose>
					</div>
				</div>
				<div class="styStdDiv" style="border-top:1px solid black;display:flex;">
					<div class="styNameBox" style="width:58mm;font-size:7pt;min-height:3mm;">
						Foreign country name <br/>
						<xsl:call-template name="PopulateText">
							<xsl:with-param name="TargetNode" select="$FormData/ResponsiblePrtyForeignAddress/CountryCd"/>
						</xsl:call-template>
					</div>
					<div class="styNameBox" style="width:41mm;font-size:7pt;padding-left:1mm;min-height:3mm;">
						Foreign province/state/county <br/>
						<xsl:call-template name="PopulateText">
							<xsl:with-param name="TargetNode" select="$FormData/ResponsiblePrtyForeignAddress/ProvinceOrStateNm"/>
						</xsl:call-template>
					</div>
					<div class="styNameBox" style="width:39mm;font-size:7pt;padding-left:1mm;min-height:3mm;">
						Foreign postal code <br/>
						<xsl:call-template name="PopulateText">
							<xsl:with-param name="TargetNode" select="$FormData/ResponsiblePrtyForeignAddress/ForeignPostalCd"/>
						</xsl:call-template>
					</div>
					<div class="styEINBox" style="width:49mm;padding-left:1mm;min-height:3mm;text-align:left;font-size:7pt;font-weight:normal;word-break:break-all;">
						Email address <br/>
						<xsl:call-template name="PopulateText">
							<xsl:with-param name="TargetNode" select="$FormData/ResponsiblePrtyEmailAddressTxt"/>
						</xsl:call-template>
					</div>
				</div>
				<!-- End of Parent/Guardian Information box -->
				<!-- End of Part I -->
				<!-- Part II - Header -->
				<div class="styStdDiv" style="border-top:1px solid black;">
					<span class="styPartName" style="width:16mm;">Part II</span>
					<span class="styPartDesc" style="width:170mm;height:auto;font-weight:normal;">
						<strong>Child's Information</strong>
						<br/>
						<span style="font-size:7pt;">If more than two children, see instructions.</span>
					</span>
				</div>
				<!-- Part II - Table begin -->
				<div class="styStdDiv" style="border-top:1px solid black;">
					<div class="styLNDesc" style="width:61mm;">
						&nbsp;
					</div>
					<div class="styLNDesc" style="width:63mm;border-left:1px solid black;text-align:center;">
						<strong>(i) Child 1</strong>
					</div>
					<div class="styLNDesc" style="width:63mm;border-left:1px solid black;text-align:center;">
						<strong>(ii) Child 2</strong>
					</div>
				</div>
				<div class="styStdDiv">
					<table style="width:100%;font-size:7pt;border-collapse:collapse;" role="presentation">
						<tbody>
							<!-- Line 1a -->
							<tr style="vertical-align:bottom;">
								<td class="styLNLeftNumBox" style="float:none;">1a</td>
								<td class="sty4547ShortDesc" style="float:none;border-top:1px solid black;">
									First name
								</td>
								<td class="sty4547TxtBox" style="border-top:1px solid black;">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$FormData/TrumpAccountChildInfoGrp[1]/PersonFirstNm"/>
									</xsl:call-template>
								</td>
								<td class="sty4547TxtBox" style="border-top:1px solid black;">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$FormData/TrumpAccountChildInfoGrp[2]/PersonFirstNm"/>
									</xsl:call-template>
								</td>
							</tr>
							<!-- Line 1b -->
							<tr style="vertical-align:bottom;">
								<td class="styLNLeftNumBox" style="float:none;padding-left:2.5mm;">b</td>
								<td class="sty4547ShortDesc" style="float:none;border-top:1px solid black;">
									Middle name
								</td>
								<td class="sty4547TxtBox">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$FormData/TrumpAccountChildInfoGrp[1]/PersonMiddleNm"/>
									</xsl:call-template>
								</td>
								<td class="sty4547TxtBox">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$FormData/TrumpAccountChildInfoGrp[2]/PersonMiddleNm"/>
									</xsl:call-template>
								</td>
							</tr>
							<!-- Line 1c -->
							<tr style="vertical-align:bottom;">
								<td class="styLNLeftNumBox" style="float:none;padding-left:2.5mm;">c</td>
								<td class="sty4547ShortDesc" style="float:none;border-top:1px solid black;">
									Last name
								</td>
								<td class="sty4547TxtBox">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$FormData/TrumpAccountChildInfoGrp[1]/PersonLastNm"/>
									</xsl:call-template>
								</td>
								<td class="sty4547TxtBox">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$FormData/TrumpAccountChildInfoGrp[2]/PersonLastNm"/>
									</xsl:call-template>
								</td>
							</tr>
							<!-- Line 2 -->
							<tr style="vertical-align:bottom;">
								<td class="styLNLeftNumBox" style="float:none;">2</td>
								<td class="sty4547ShortDesc" style="float:none;border-top:1px solid black;">
									Social security number
								</td>
								<td class="sty4547TxtCtrBox">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$FormData/TrumpAccountChildInfoGrp[1]/SSN"/>
									</xsl:call-template>
								</td>
								<td class="sty4547TxtCtrBox">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$FormData/TrumpAccountChildInfoGrp[2]/SSN"/>
									</xsl:call-template>
								</td>
							</tr>
							<!-- Line 3 -->
							<tr style="vertical-align:bottom;">
								<td class="styLNLeftNumBox" style="float:none;">3</td>
								<td class="sty4547ShortDesc" style="float:none;border-top:1px solid black;">
									Date of birth
								</td>
								<td class="sty4547TxtCtrBox">
									<xsl:call-template name="PopulateMonthDayYear">
										<xsl:with-param name="TargetNode" select="$FormData/TrumpAccountChildInfoGrp[1]/BirthDt"/>
									</xsl:call-template>
								</td>
								<td class="sty4547TxtCtrBox">
									<xsl:call-template name="PopulateMonthDayYear">
										<xsl:with-param name="TargetNode" select="$FormData/TrumpAccountChildInfoGrp[2]/BirthDt"/>
									</xsl:call-template>
								</td>
							</tr>
							<!-- Line 4 -->
							<tr style="vertical-align:bottom;">
								<td class="styLNLeftNumBox" style="float:none;">4</td>
								<td class="sty4547ShortDesc" style="float:none;border-top:1px solid black;">
									Relationship
								</td>
								<td class="sty4547TxtBox">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$FormData/TrumpAccountChildInfoGrp[1]/ChildRelationshipCd"/>
									</xsl:call-template>
								</td>
								<td class="sty4547TxtBox">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$FormData/TrumpAccountChildInfoGrp[2]/ChildRelationshipCd"/>
									</xsl:call-template>
								</td>
							</tr>
							<!-- Line 5 -->
							<tr style="vertical-align:bottom;">
								<td class="styLNLeftNumBox" style="float:none;vertical-align:top;">5</td>
								<td class="sty4547ShortDesc" style="float:none;border-top:1px solid black;border-right:1px solid black;">
									<b>Home Address</b><br/>
									Check here if address is same as Part I. Otherwise, complete lines 5a through 5f. If you have a foreign address, complete lines 5g, 5h, and 5i.
								</td>
								<td class="styTableCellCtrInherit" style="padding-bottom:5mm;">
									<input type="Checkbox" class="styCkboxNM" alt="HomeAddressSameInd1">
										<xsl:call-template name="PopulateCheckbox">
											<xsl:with-param name="TargetNode" select="$FormData/TrumpAccountChildInfoGrp[1]/HomeAddressSameInd"/>
											<xsl:with-param name="BackupName">IRS4547HomeAddressSameInd1</xsl:with-param>
										</xsl:call-template>
									</input>
								</td>
								<td class="styTableCellCtrInherit" style="padding-bottom:5mm;border-right:0;">
									<input type="Checkbox" class="styCkboxNM" alt="HomeAddressSameInd2">
										<xsl:call-template name="PopulateCheckbox">
											<xsl:with-param name="TargetNode" select="$FormData/TrumpAccountChildInfoGrp[2]/HomeAddressSameInd"/>
											<xsl:with-param name="BackupName">IRS4547HomeAddressSameInd2</xsl:with-param>
										</xsl:call-template>
									</input>
								</td>
							</tr>
							<!-- Line 5a -->
							<tr style="vertical-align:bottom;">
								<td class="styLNLeftNumBox" style="float:none;padding-left:2.5mm;vertical-align:top;">a</td>
								<td class="sty4547ShortDesc" style="float:none;border-top:1px solid black;vertical-align:top;">
									Numer and street
								</td>
								<xsl:choose>
									<xsl:when test="$FormData/TrumpAccountChildInfoGrp[1]/USAddress">
										<td class="sty4547TxtBox">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="$FormData/TrumpAccountChildInfoGrp[1]/USAddress/AddressLine1Txt"/>
											</xsl:call-template><br/>
											<xsl:if test="$FormData/TrumpAccountChildInfoGrp[1]/USAddress/AddressLine2Txt">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="$FormData/TrumpAccountChildInfoGrp[1]/USAddress/AddressLine2Txt"/>
												</xsl:call-template>
											</xsl:if>
										</td>
									</xsl:when>
									<xsl:otherwise>	
										<td class="sty4547TxtBox">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="$FormData/TrumpAccountChildInfoGrp[1]/ForeignAddress/AddressLine1Txt"/>
											</xsl:call-template><br/>
											<xsl:if test="$FormData/TrumpAccountChildInfoGrp[1]/ForeignAddress/AddressLine2Txt">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="$FormData/TrumpAccountChildInfoGrp[1]/ForeignAddress/AddressLine2Txt"/>
												</xsl:call-template>
											</xsl:if>
										</td>
									</xsl:otherwise>
								</xsl:choose>
								<xsl:choose>
									<xsl:when test="$FormData/TrumpAccountChildInfoGrp[2]/USAddress">
										<td class="sty4547TxtBox">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="$FormData/TrumpAccountChildInfoGrp[2]/USAddress/AddressLine1Txt"/>
											</xsl:call-template><br/>
											<xsl:if test="$FormData/TrumpAccountChildInfoGrp[2]/USAddress/AddressLine2Txt">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="$FormData/TrumpAccountChildInfoGrp[2]/USAddress/AddressLine2Txt"/>
												</xsl:call-template>
											</xsl:if>
										</td>
									</xsl:when>
									<xsl:otherwise>
										<td class="sty4547TxtBox">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="$FormData/TrumpAccountChildInfoGrp[2]/ForeignAddress/AddressLine1Txt"/>
											</xsl:call-template><br/>
											<xsl:if test="$FormData/TrumpAccountChildInfoGrp[2]/ForeignAddress/AddressLine2Txt">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="$FormData/TrumpAccountChildInfoGrp[2]/ForeignAddress/AddressLine2Txt"/>
												</xsl:call-template>
											</xsl:if>
										</td>
									</xsl:otherwise>
								</xsl:choose>
							</tr>
							<!-- Line 5b -->
							<tr style="vertical-align:bottom;">
								<td class="styLNLeftNumBox" style="float:none;padding-left:2.5mm;vertical-align:top;">b</td>
								<td class="sty4547ShortDesc" style="float:none;border-top:1px solid black;">
									Appartment number
								</td>
								<td class="sty4547TxtBox">&nbsp;</td>
								<td class="sty4547TxtBox">&nbsp;</td>
							</tr>
							<!-- Line 5c -->
							<tr style="vertical-align:bottom;">
								<td class="styLNLeftNumBox" style="float:none;padding-left:2.5mm;vertical-align:top;">c</td>
								<td class="sty4547ShortDesc" style="float:none;border-top:1px solid black;">
									City, town, or post office
								</td>
								<xsl:choose>
									<xsl:when test="$FormData/TrumpAccountChildInfoGrp[1]/USAddress">
										<td class="sty4547TxtBox">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="$FormData/TrumpAccountChildInfoGrp[1]/USAddress/CityNm"/>
											</xsl:call-template>
										</td>
									</xsl:when>
									<xsl:otherwise>
										<td class="sty4547TxtBox">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="$FormData/TrumpAccountChildInfoGrp[1]/ForeignAddress/CityNm"/>
											</xsl:call-template>
										</td>
									</xsl:otherwise>
								</xsl:choose>
								<xsl:choose>
									<xsl:when test="$FormData/TrumpAccountChildInfoGrp[2]/USAddress">
										<td class="sty4547TxtBox">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="$FormData/TrumpAccountChildInfoGrp[2]/USAddress/CityNm"/>
											</xsl:call-template>
										</td>
									</xsl:when>
									<xsl:otherwise>
										<td class="sty4547TxtBox">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="$FormData/TrumpAccountChildInfoGrp[2]/ForeignAddress/CityNm"/>
											</xsl:call-template>
										</td>
									</xsl:otherwise>
								</xsl:choose>
							</tr>
							<!-- Line 5d -->
							<tr style="vertical-align:bottom;">
								<td class="styLNLeftNumBox" style="float:none;padding-left:2.5mm;vertical-align:top;">d</td>
								<td class="sty4547ShortDesc" style="float:none;border-top:1px solid black;">
									County
								</td>
								<td class="sty4547TxtBox">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$FormData/TrumpAccountChildInfoGrp[1]/CountyNm"/>
									</xsl:call-template>
								</td>
								<td class="sty4547TxtBox">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$FormData/TrumpAccountChildInfoGrp[2]/CountyNm"/>
									</xsl:call-template>
								</td>
							</tr>
							<!-- Line 5e -->
							<tr style="vertical-align:bottom;">
								<td class="styLNLeftNumBox" style="float:none;padding-left:2.5mm;vertical-align:top;">e</td>
								<td class="sty4547ShortDesc" style="float:none;border-top:1px solid black;">
									State
								</td>
								<td class="sty4547TxtCtrBox">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$FormData/TrumpAccountChildInfoGrp[1]/USAddress/StateAbbreviationCd"/>
									</xsl:call-template>
								</td>
								<td class="sty4547TxtCtrBox">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$FormData/TrumpAccountChildInfoGrp[2]/USAddress/StateAbbreviationCd"/>
									</xsl:call-template>
								</td>
							</tr>
							<!-- Line 5f -->
							<tr style="vertical-align:bottom;">
								<td class="styLNLeftNumBox" style="float:none;padding-left:2.5mm;vertical-align:top;">f</td>
								<td class="sty4547ShortDesc" style="float:none;border-top:1px solid black;">
									ZIP code
								</td>
								<td class="sty4547TxtBox">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$FormData/TrumpAccountChildInfoGrp[1]/USAddress/ZIPCd"/>
									</xsl:call-template>
								</td>
								<td class="sty4547TxtBox">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$FormData/TrumpAccountChildInfoGrp[2]/USAddress/ZIPCd"/>
									</xsl:call-template>
								</td>
							</tr>
							<!-- Line 5g -->
							<tr style="vertical-align:bottom;">
								<td class="styLNLeftNumBox" style="float:none;padding-left:2.5mm;vertical-align:top;">g</td>
								<td class="sty4547ShortDesc" style="float:none;border-top:1px solid black;">
									Foreign country name
								</td>
								<td class="sty4547TxtCtrBox">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$FormData/TrumpAccountChildInfoGrp[1]/ForeignAddress/CountryCd"/>
									</xsl:call-template>
								</td>
								<td class="sty4547TxtCtrBox">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$FormData/TrumpAccountChildInfoGrp[2]/ForeignAddress/CountryCd"/>
									</xsl:call-template>
								</td>
							</tr>
							<!-- Line 5h -->
							<tr style="vertical-align:bottom;">
								<td class="styLNLeftNumBox" style="float:none;padding-left:2.5mm;vertical-align:top;">h</td>
								<td class="sty4547ShortDesc" style="float:none;border-top:1px solid black;">
									Foreign province/state/county
								</td>
								<td class="sty4547TxtBox">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$FormData/TrumpAccountChildInfoGrp[1]/ForeignAddress/ProvinceOrStateNm"/>
									</xsl:call-template>
								</td>
								<td class="sty4547TxtBox">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$FormData/TrumpAccountChildInfoGrp[2]/ForeignAddress/ProvinceOrStateNm"/>
									</xsl:call-template>
								</td>
							</tr>
							<!-- Line 5i -->
							<tr style="vertical-align:bottom;">
								<td class="styLNLeftNumBox" style="float:none;padding-left:2.5mm;vertical-align:top;">i</td>
								<td class="sty4547ShortDesc" style="float:none;border-top:1px solid black;">
									Foreign postal code
								</td>
								<td class="sty4547TxtBox">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$FormData/TrumpAccountChildInfoGrp[1]/ForeignAddress/ForeignPostalCd"/>
									</xsl:call-template>
								</td>
								<td class="sty4547TxtBox">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$FormData/TrumpAccountChildInfoGrp[2]/ForeignAddress/ForeignPostalCd"/>
									</xsl:call-template>
								</td>
							</tr>
							<!-- Line 6 -->
							<tr style="vertical-align:bottom;">
								<td class="styLNLeftNumBox" style="float:none;vertical-align:top;">6</td>
								<td class="sty4547ShortDesc" style="float:none;border-top:1px solid black;border-right:1px solid black;">
									Check box if you are authorized to open the Trump account for the child. See instructions.
								</td>
								<td class="styTableCellCtrInherit" style="padding-bottom:1mm;border-bottom:0;">
									<input type="Checkbox" class="styCkboxNM" alt="AuthorizedOpenAccountInd1">
										<xsl:call-template name="PopulateCheckbox">
											<xsl:with-param name="TargetNode" select="$FormData/TrumpAccountChildInfoGrp[1]/AuthorizedOpenAccountInd"/>
											<xsl:with-param name="BackupName">IRS4547AuthorizedOpenAccountInd1</xsl:with-param>
										</xsl:call-template>
									</input>
								</td>
								<td class="styTableCellCtrInherit" style="padding-bottom:1mm;border-right:0;border-bottom:0;">
									<input type="Checkbox" class="styCkboxNM" alt="AuthorizedOpenAccountInd2">
										<xsl:call-template name="PopulateCheckbox">
											<xsl:with-param name="TargetNode" select="$FormData/TrumpAccountChildInfoGrp[2]/AuthorizedOpenAccountInd"/>
											<xsl:with-param name="BackupName">IRS4547AuthorizedOpenAccountInd2</xsl:with-param>
										</xsl:call-template>
									</input>
								</td>
							</tr>
						</tbody>
					</table>
				</div>
				<!-- End of Part II -->
				<!-- Part III - Header -->
				<div class="styStdDiv" style="border-top:1px solid black;">
					<span class="styPartName" style="width:16mm;">Part III</span>
					<span class="styPartDesc" style="width:170mm;height:auto;font-weight:normal;">
						<strong>Pilot Program Contribution Election</strong>
					</span>
				</div>
				<div class="styStdDiv" style="border-top:1px solid black;">
					For a child to qualify to receive the $1,000 Pilot Program Contribution to their Trump account, the child must have been born in 2025&mdash;2028, must be a
qualifying child of the individual opening the Trump account, must be a U.S. citizen, and must have a valid social security number. See instructions.
				</div>
				<div class="styStdDiv" style="border-top:1px solid black;">
					<div class="styLNDesc" style="width:61mm;">
						&nbsp;
					</div>
					<div class="styLNDesc" style="width:63mm;border-left:1px solid black;border-bottom:1px solid black;text-align:center;">
						<strong>(i) Child 1</strong>
					</div>
					<div class="styLNDesc" style="width:63mm;border-left:1px solid black;border-bottom:1px solid black;text-align:center;">
						<strong>(ii) Child 2</strong>
					</div>
				</div>
				<div class="styStdDiv">
					<table style="width:100%;font-size:7pt;border-collapse:collapse;" role="presentation">
						<tbody>
							<!-- Line 7 -->
							<tr style="vertical-align:bottom;">
								<td class="styLNLeftNumBox" style="float:none;vertical-align:top;">7</td>
								<td class="sty4547ShortDesc" style="float:none;font-size:6pt;border-right:1px solid black;">
									Check box if child qualifies for, and you want the child to receive, a Pilot Program Contribution
								</td>
								<td class="styTableCellCtrInherit" style="padding-bottom:1mm;border-bottom:0;width:63mm;">
									<input type="Checkbox" class="styCkboxNM" alt="PilotProgramContributionInd1">
										<xsl:call-template name="PopulateCheckbox">
											<xsl:with-param name="TargetNode" select="$FormData/TrumpAccountChildInfoGrp[1]/PilotProgramContributionInd"/>
											<xsl:with-param name="BackupName">IRS4547PilotProgramContributionInd1</xsl:with-param>
										</xsl:call-template>
									</input>
								</td>
								<td class="styTableCellCtrInherit" style="padding-bottom:1mm;border-right:0;border-bottom:0;width:63mm;">
									<input type="Checkbox" class="styCkboxNM" alt="PilotProgramContributionInd2">
										<xsl:call-template name="PopulateCheckbox">
											<xsl:with-param name="TargetNode" select="$FormData/TrumpAccountChildInfoGrp[2]/PilotProgramContributionInd"/>
											<xsl:with-param name="BackupName">IRS4547PilotProgramContributionInd2</xsl:with-param>
										</xsl:call-template>
									</input>
								</td>
							</tr>
						</tbody>
					</table>
				</div>
				<!-- End of Part III -->
				<!-- Part IV - Header -->
				<div class="styStdDiv" style="border-top:1px solid black;">
					<span class="styPartName" style="width:16mm;">Part IV</span>
					<span class="styPartDesc" style="width:170mm;height:auto;font-weight:normal;">
						<strong>Consent to Disclose Information</strong>
					</span>
				</div>
				<div class="styStdDiv" style="border-top:1px solid black;border-bottom:1px solid black;">
					By completing this form, you authorize the IRS, Treasury, and their agent(s) to create and maintain a Trump account with respect to the eligible
child(ren) listed on this form. You also authorize the IRS, Treasury, and their agent(s) to disclose the fact that a Trump account has been established
for the eligible child(ren) listed above to any parent, guardian, or authorized individual of the eligible child who is permitted to make an election to
request creation of the Trump account.
				</div>
				<!-- BEGIN Signature Section -->
				<div class="styStdDiv" style="border-bottom:1px solid black;">
					<!-- Implementing the signature section in table -->
					<div style="width:18mm;height:20mm;border-right:1px solid black;float:left;">
						<span class="styMainTitle" style="font-size:12pt;padding-top:4mm;padding-bottom:3mm;">
							Sign Here							
						</span>
					</div>
					<div style="width:169mm;float:left;clear:none;">
						<div class="styLNDesc" style="width:169mm;height:8mm;padding-left:1mm">
							Under penalties of perjury, I declare that I have examined this form, and to the best of my knowledge and belief, it is true, correct, and complete.
Declaration of preparer (other than taxpayer) is based on all information of which preparer has any knowledge.<br/>
						</div>
						<div class="styLNDesc" style="height:12mm;width:128mm;padding-left:1mm;padding-top:5mm;">
							<span style="border-bottom:1px solid black;width:120mm;">
								<xsl:call-template name="PopulatePin">
									<xsl:with-param name="TargetNode" select="$FormData/SignaturePIN"/>
									<xsl:with-param name="BackupName">SignaturePIN</xsl:with-param>
								</xsl:call-template>
							</span><br/>
							Your signature
						</div>
						<div class="styLNDesc" style="height:12mm;width:40mm;padding-left:1mm;padding-top:5mm;">
							<span style="border-bottom:1px solid black;width:38mm;">
								<xsl:call-template name="PopulateMonthDayYear">
									<xsl:with-param name="TargetNode" select="$FormData/SignatureDt"/>
									<xsl:with-param name="BackupName">SignatureDt</xsl:with-param>
								</xsl:call-template>
							</span><br/>
							Date
						</div>
					</div>
				</div>
				<!-- End Signature Section -->
				<!-- BEGIN PREPARER SIGNATURE SECTION   -->
				<!-- paid preparer -->
				<div class="styStdDiv">
					<div style="width:18mm;padding-top:5mm;float:left;clear:none;">
						<span class="styMainTitle" style="font-size:11pt;">
							Paid Preparer Use Only
						</span>
					</div>
					<div style="width:169mm;float:left;clear:none;boorder-left:1px solid black;">
						<div class="styLNDesc" style="height:9mm;width:48mm;padding-top:0mm;border-right:1px solid black;border-left:1px solid black;padding-left:1mm">
							Print/Type preparer's name<br/>
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/PaidPreparerInformationGrp/PreparerPersonNm"/>
								<xsl:with-param name="BackupName">$FormDataPaidPreparerInformationGrpPreparerPersonName</xsl:with-param>
							</xsl:call-template>
						</div>
						<div class="styLNDesc" style="height:9mm;width:49mm;padding-top:0mm;border-right:1px solid black;padding-left:1mm;">
							Preparer's signature
						</div>
						<div class="styLNDesc" style="height:9mm;width:17mm;border-right:1px solid black;padding-top:0mm;padding-left:1mm">Date <br/>
							<xsl:call-template name="PopulateMonthDayYear">
								<xsl:with-param name="TargetNode" select="$FormData/PaidPreparerInformationGrp/SignatureDt"/>
								<xsl:with-param name="BackupName">$FormDataPaidPreparerInformationGrpPreparationDt</xsl:with-param>
							</xsl:call-template>
						</div>
						<div class="styLNDesc" style="height:9mm;width:20mm;border-right:1px solid black;padding-top:.5mm;padding-bottom:0mm;padding-left:1mm;">
							<label>
								<xsl:call-template name="PopulateLabel">
									<xsl:with-param name="TargetNode" select="$FormData/PaidPreparerInformationGrp/SelfEmployedInd"/>
									<xsl:with-param name="BackupName">$FormDataPaidPreparerInformationGrpSelfEmployedInd</xsl:with-param>
								</xsl:call-template>
								Check 
								<input class="styCkboxNM" type="checkbox" style="width:4mm;">
									<xsl:call-template name="PopulateCheckbox">
										<xsl:with-param name="TargetNode" select="$FormData/PaidPreparerInformationGrp/SelfEmployedInd"/>
										<xsl:with-param name="BackupName">$FormDataPaidPreparerInformationGrpSelfEmployedInd</xsl:with-param>
									</xsl:call-template>
								</input>
								<span style="width:6px;"/>if<br/>self-employed
							</label>
						</div>
						<div class="styLNDesc" style="height:8mm;width:30mm;padding-top:0mm;padding-left:1mm;">PTIN<br/>
							<xsl:choose>
								<xsl:when test="$FormData/PaidPreparerInformationGrp/PreparerSSN">
									<xsl:call-template name="PopulateSSN">
										<xsl:with-param name="TargetNode" select="$FormData/PaidPreparerInformationGrp/PreparerSSN"/>
										<xsl:with-param name="BackupName">$FormDataPaidPreparerInformationGrpSSN</xsl:with-param>
									</xsl:call-template>
								</xsl:when>
								<xsl:when test="$FormData/PaidPreparerInformationGrp/PTIN">
									<xsl:call-template name="PopulateSSN">
										<xsl:with-param name="TargetNode" select="$FormData/PaidPreparerInformationGrp/PTIN"/>
										<xsl:with-param name="BackupName">$FormDataPaidPreparerInformationGrpPTIN</xsl:with-param>
									</xsl:call-template>
								</xsl:when>
								<xsl:otherwise>
									<xsl:call-template name="PopulateSSN">
										<xsl:with-param name="TargetNode" select="$FormData/PaidPreparerInformationGrp/STIN"/>
										<xsl:with-param name="BackupName">$FormDataPaidPreparerInformationGrpSTIN</xsl:with-param>
									</xsl:call-template>
								</xsl:otherwise>
							</xsl:choose>
						</div>
					</div>
					<div style="width:169mm;float:left;clear:none;border-top: 1px solid black;border-bottom: 1px solid black;">
						<div class="styLNDesc" style="height:7mm;width:126.5mm;border-right:1px solid black;border-left:1px solid black;padding-left:1mm;">
							<span class="styGenericDiv">Firm's name<span style="width:3mm;"/></span>
							<div style="padding-right:.5mm;">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$FormData/PaidPreparerInformationGrp/PreparerFirmName/BusinessNameLine1Txt"/>
									<xsl:with-param name="BackupName">$FormDataPaidPreparerInformationGrpPreparerFirmNameBusinessName1</xsl:with-param>
								</xsl:call-template>
								<br/>
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$FormData/PaidPreparerInformationGrp/PreparerFirmName/BusinessNameLine2Txt"/>
									<xsl:with-param name="BackupName">$FormDataPaidPreparerInformationGrpPreparerFirmNameBusinessName2</xsl:with-param>
								</xsl:call-template>
							</div>
						</div>
						<div class="styLNDesc" style="height:6mm;width:34mm;padding-left:1mm;">
							Firm's EIN<br/>
							<xsl:if test="$FormData/PaidPreparerInformationGrp/PreparerFirmEIN">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$FormData/PaidPreparerInformationGrp/PreparerFirmEIN"/>
									<xsl:with-param name="BackupName">$FormDataPaidPreparerInformationGrpPreparerFirmEIN</xsl:with-param>
								</xsl:call-template>
							</xsl:if>
						</div>
					</div>
					<div style="width:164mm;float:left;clear:none;">
						<div class="styLNDesc" style="width:126.5mm;border-right:1px solid black;border-left:1px solid black;padding-left:1mm;height:10mm;">
							<span class="styGenericDiv">Firm's address<span style="width:3mm;"/></span>
							<div style="padding-right:.5mm;">
								<xsl:if test="$FormData/PaidPreparerInformationGrp/PreparerUSAddress">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$FormData/PaidPreparerInformationGrp/PreparerUSAddress/AddressLine1Txt"/>
										<xsl:with-param name="BackupName">$FormDataPaidPreparerInformationGrpUSAddressLine1</xsl:with-param>
									</xsl:call-template>
									<br/>
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$FormData/PaidPreparerInformationGrp/PreparerUSAddress/AddressLine1Txt"/>
										<xsl:with-param name="BackupName">$FormDataPaidPreparerInformationGrpUSAddressLine2</xsl:with-param>
									</xsl:call-template>
									<br/>
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$FormData/PaidPreparerInformationGrp/PreparerUSAddress/CityNm"/>
										<xsl:with-param name="BackupName">$FormDataPaidPreparerInformationGrpUSAddressCity</xsl:with-param>
									</xsl:call-template>,
									<span style="width:2px;"/>
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$FormData/PaidPreparerInformationGrp/PreparerUSAddress/StateAbbreviationCd"/>
										<xsl:with-param name="BackupName">$FormDataPaidPreparerInformationGrpUSAddressState</xsl:with-param>
									</xsl:call-template>,
									<span style="width:2px;"/>
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$FormData/PaidPreparerInformationGrp/PreparerUSAddress/ZIPCd"/>
										<xsl:with-param name="BackupName">$FormDataPaidPreparerInformationGrpUSAddressZIPCd</xsl:with-param>
									</xsl:call-template>
								</xsl:if>
								<xsl:if test="$FormData/PaidPreparerInformationGrp/PreparerForeignAddress">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$FormData/PaidPreparerInformationGrp/PreparerForeignAddress/AddressLine1Txt"/>
										<xsl:with-param name="BackupName">$FormDataPaidPreparerInformationGrpFirmGrpAddressLine1</xsl:with-param>
									</xsl:call-template>
									<br/>
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$FormData/PaidPreparerInformationGrp/PreparerForeignAddress/AddressLine1Txt"/>
										<xsl:with-param name="BackupName">$FormDataPaidPreparerInformationGrpFirmGrpAddressLine2</xsl:with-param>
									</xsl:call-template>
									<br/>
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$FormData/PaidPreparerInformationGrp/PreparerForeignAddress/CityNm"/>
										<xsl:with-param name="BackupName">$FormDataPaidPreparerInformationGrpFirmGrpCityNm</xsl:with-param>
									</xsl:call-template>,
									<span style="width:2px;"/>
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$FormData/PaidPreparerInformationGrp/PreparerForeignAddress/ProvinceOrStateNm"/>
										<xsl:with-param name="BackupName">$FormDataPaidPreparerInformationGrpFirmGrpProvinceOrStateNm</xsl:with-param>
									</xsl:call-template>,
									<span style="width:2px;"/>
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$FormData/PaidPreparerInformationGrp/PreparerForeignAddress/ForeignPostalCd"/>
										<xsl:with-param name="BackupName">$FormDataPaidPreparerInformationGrpFirmGrpForeignPostalCd</xsl:with-param>
									</xsl:call-template>,
									<span style="width:2px;"/>
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$FormData/PaidPreparerInformationGrp/PreparerForeignAddress/CountryCd"/>
										<xsl:with-param name="BackupName">$FormDataPaidPreparerInformationGrpFirmGrpCountryCd</xsl:with-param>
									</xsl:call-template>
								</xsl:if>
							</div>
						</div>
						<div class="styLNDesc" style="width:34mm;padding-left:1mm;">Phone no. 
							<xsl:call-template name="LinkToLeftoverDataTableInline">
								<xsl:with-param name="Desc">Bottom - Email Address </xsl:with-param>
								<xsl:with-param name="TargetNode" select="$FormData/PaidPreparerInformationGrp/EmailAddressTxt"/>
							</xsl:call-template><br/>
							<xsl:choose>
								<xsl:when test="$FormData/PaidPreparerInformationGrp/PhoneNum">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$FormData/PaidPreparerInformationGrp/PhoneNum"/>
										<xsl:with-param name="BackupName">$FormDataPaidPreparerInformationGrpFirmGrpPhoneNum</xsl:with-param>
									</xsl:call-template>
								</xsl:when>
								<xsl:otherwise>
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$FormData/PaidPreparerInformationGrp/ForeignPhoneNum"/>
										<xsl:with-param name="BackupName">$FormDataPaidPreparerInformationGrpFirmGrpForeignPhoneNum</xsl:with-param>
									</xsl:call-template>
								</xsl:otherwise>
							</xsl:choose>
						</div>
					</div>
				</div>
				<!-- END PREPARER SIGNATURE SECTION -->
				<!-- Footer -->
				<div class="styStdDiv pageEnd" style="border-top:2px solid black;">
					<span style="font-weight:bold;font-family:Arial;">For Paperwork Reduction Act Notice, see separate instructions.</span>
					<span style="margin-left:14mm;">Cat. No. 95927O</span>
					<span style="float:right;">Form <strong>4547</strong> (12-2025)</span>
				</div>
				<!-- Begin additional table for Part 2 and 3 when there are more than 2 children -->
				<xsl:if test="count($FormData/TrumpAccountChildInfoGrp) &gt; 2">
					<div class="styStdDiv" style="border-top:1px solid black;">
						<span class="styPartName" style="width:23mm;">Part II &amp; III</span>
						<span class="styPartDesc" style="width:164mm;height:auto;font-weight:normal;">
							<strong>Child's Information and Pilot Program Contribution Election </strong> <i>(continued)</i>
						</span>
					</div>
					
					<!-- Part II - Table begin -->
					<xsl:for-each select="$FormData/TrumpAccountChildInfoGrp[position() &gt; 2]">
						<xsl:variable name="pos" select="position()"/>
						<xsl:if test="$pos mod 4 = 1">
							<div class="styStdDiv" style="text-align:center;border-top:1px solid black;padding-left:8mm;">
								<div class="styGenericDiv" style="width:44.75mm;border-left:1px solid black;height:auto;padding:0.5mm;border-bottom:1px solid black;">
									<strong>(<xsl:number value="$pos+2" format="i"/>) Child <xsl:value-of select="$pos+2"/></strong>
								</div>
								<div class="styGenericDiv" style="width:44.75mm;border-left:1px solid black;height:auto;padding:0.5mm;border-bottom:1px solid black;">
									<strong>(<xsl:number value="$pos+3" format="i"/>) Child <xsl:value-of select="$pos+3"/></strong>
								</div>
								<div class="styGenericDiv" style="width:44.75mm;border-left:1px solid black;height:auto;padding:0.5mm;border-bottom:1px solid black;">
									<strong>(<xsl:number value="$pos+4" format="i"/>) Child <xsl:value-of select="$pos+4"/></strong>
								</div>
								<div class="styGenericDiv" style="width:44.75mm;border-left:1px solid black;height:auto;padding:0.5mm;border-bottom:1px solid black;">
									<strong>(<xsl:number value="$pos+5" format="i"/>) Child <xsl:value-of select="$pos+5"/></strong>
								</div>
							</div>
							<!-- 1a -->
							<div class="styStdDiv">
								<div class="styLNLeftNumBox">1a</div>
								<div class="sty4547TextBoxEx">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$FormData/TrumpAccountChildInfoGrp[$pos + 2]/PersonFirstNm"/>
									</xsl:call-template>
								</div>
								<div class="sty4547TextBoxEx">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$FormData/TrumpAccountChildInfoGrp[$pos + 3]/PersonFirstNm"/>
									</xsl:call-template>
								</div>
								<div class="sty4547TextBoxEx">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$FormData/TrumpAccountChildInfoGrp[$pos + 4]/PersonFirstNm"/>
									</xsl:call-template>
								</div>
								<div class="sty4547TextBoxEx">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$FormData/TrumpAccountChildInfoGrp[$pos + 5]/PersonFirstNm"/>
									</xsl:call-template>
								</div>
							</div>
							<!-- 1b -->
							<div class="styStdDiv">
								<div class="styLNLeftNumBox" style="padding-left:2.5mm;">b</div>
								<div class="sty4547TextBoxEx">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$FormData/TrumpAccountChildInfoGrp[$pos + 2]/PersonMiddleNm"/>
									</xsl:call-template>
								</div>
								<div class="sty4547TextBoxEx">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$FormData/TrumpAccountChildInfoGrp[$pos + 3]/PersonMiddleNm"/>
									</xsl:call-template>
								</div>
								<div class="sty4547TextBoxEx">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$FormData/TrumpAccountChildInfoGrp[$pos + 4]/PersonMiddleNm"/>
									</xsl:call-template>
								</div>
								<div class="sty4547TextBoxEx">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$FormData/TrumpAccountChildInfoGrp[$pos + 5]/PersonMiddleNm"/>
									</xsl:call-template>
								</div>
							</div>
							<!-- 1c -->
							<div class="styStdDiv">
								<div class="styLNLeftNumBox" style="padding-left:2.5mm;">c</div>
								<div class="sty4547TextBoxEx">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$FormData/TrumpAccountChildInfoGrp[$pos + 2]/PersonLastNm"/>
									</xsl:call-template>
								</div>
								<div class="sty4547TextBoxEx">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$FormData/TrumpAccountChildInfoGrp[$pos + 3]/PersonLastNm"/>
									</xsl:call-template>
								</div>
								<div class="sty4547TextBoxEx">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$FormData/TrumpAccountChildInfoGrp[$pos + 4]/PersonLastNm"/>
									</xsl:call-template>
								</div>
								<div class="sty4547TextBoxEx">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$FormData/TrumpAccountChildInfoGrp[$pos + 5]/PersonLastNm"/>
									</xsl:call-template>
								</div>
							</div>
							<!-- 2 -->
							<div class="styStdDiv">
								<div class="styLNLeftNumBox">2</div>
								<div class="sty4547TextCenterBoxEx">
									<xsl:call-template name="PopulateSSN">
										<xsl:with-param name="TargetNode" select="$FormData/TrumpAccountChildInfoGrp[$pos + 2]/SSN"/>
									</xsl:call-template>
								</div>
								<div class="sty4547TextCenterBoxEx">
									<xsl:call-template name="PopulateSSN">
										<xsl:with-param name="TargetNode" select="$FormData/TrumpAccountChildInfoGrp[$pos + 3]/SSN"/>
									</xsl:call-template>
								</div>
								<div class="sty4547TextCenterBoxEx">
									<xsl:call-template name="PopulateSSN">
										<xsl:with-param name="TargetNode" select="$FormData/TrumpAccountChildInfoGrp[$pos + 4]/SSN"/>
									</xsl:call-template>
								</div>
								<div class="sty4547TextCenterBoxEx">
									<xsl:call-template name="PopulateSSN">
										<xsl:with-param name="TargetNode" select="$FormData/TrumpAccountChildInfoGrp[$pos + 5]/SSN"/>
									</xsl:call-template>
								</div>
							</div>
							<!-- 3 -->
							<div class="styStdDiv">
								<div class="styLNLeftNumBox">3</div>
								<div class="sty4547TextCenterBoxEx">
									<xsl:call-template name="PopulateMonthDayYear">
										<xsl:with-param name="TargetNode" select="$FormData/TrumpAccountChildInfoGrp[$pos + 2]/BirthDt"/>
									</xsl:call-template>
								</div>
								<div class="sty4547TextCenterBoxEx">
									<xsl:call-template name="PopulateMonthDayYear">
										<xsl:with-param name="TargetNode" select="$FormData/TrumpAccountChildInfoGrp[$pos + 3]/BirthDt"/>
									</xsl:call-template>
								</div>
								<div class="sty4547TextCenterBoxEx">
									<xsl:call-template name="PopulateMonthDayYear">
										<xsl:with-param name="TargetNode" select="$FormData/TrumpAccountChildInfoGrp[$pos + 4]/BirthDt"/>
									</xsl:call-template>
								</div>
								<div class="sty4547TextCenterBoxEx">
									<xsl:call-template name="PopulateMonthDayYear">
										<xsl:with-param name="TargetNode" select="$FormData/TrumpAccountChildInfoGrp[$pos + 5]/BirthDt"/>
									</xsl:call-template>
								</div>
							</div>
							<!-- 4 -->
							<div class="styStdDiv">
								<div class="styLNLeftNumBox">4</div>
								<div class="sty4547TextBoxEx">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$FormData/TrumpAccountChildInfoGrp[$pos + 2]/ChildRelationshipCd"/>
									</xsl:call-template>
								</div>
								<div class="sty4547TextBoxEx">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$FormData/TrumpAccountChildInfoGrp[$pos + 3]/ChildRelationshipCd"/>
									</xsl:call-template>
								</div>
								<div class="sty4547TextBoxEx">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$FormData/TrumpAccountChildInfoGrp[$pos + 4]/ChildRelationshipCd"/>
									</xsl:call-template>
								</div>
								<div class="sty4547TextBoxEx">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$FormData/TrumpAccountChildInfoGrp[$pos + 5]/ChildRelationshipCd"/>
									</xsl:call-template>
								</div>
							</div>
							<!-- 5 -->
							<div class="styStdDiv">
								<div class="styLNLeftNumBox">5</div>
								<div class="sty4547TextCenterBoxEx">
									<input type="Checkbox" class="styCkboxNM" alt="HomeAddressSameInd{$pos+2}">
										<xsl:call-template name="PopulateCheckbox">
											<xsl:with-param name="TargetNode" select="$FormData/TrumpAccountChildInfoGrp[$pos + 2]/HomeAddressSameInd"/>
											<xsl:with-param name="BackupName">IRS4547HomeAddressSameInd1<xsl:value-of select="$pos+2"/></xsl:with-param>
										</xsl:call-template>
									</input>
								</div>
								<div class="sty4547TextCenterBoxEx">
									<input type="Checkbox" class="styCkboxNM" alt="HomeAddressSameInd{$pos+3}">
										<xsl:call-template name="PopulateCheckbox">
											<xsl:with-param name="TargetNode" select="$FormData/TrumpAccountChildInfoGrp[$pos + 3]/HomeAddressSameInd"/>
											<xsl:with-param name="BackupName">IRS4547HomeAddressSameInd<xsl:value-of select="$pos+3"/></xsl:with-param>
										</xsl:call-template>
									</input>
								</div>
								<div class="sty4547TextCenterBoxEx">
									<input type="Checkbox" class="styCkboxNM" alt="HomeAddressSameInd{$pos+4}">
										<xsl:call-template name="PopulateCheckbox">
											<xsl:with-param name="TargetNode" select="$FormData/TrumpAccountChildInfoGrp[$pos + 4]/HomeAddressSameInd"/>
											<xsl:with-param name="BackupName">IRS4547HomeAddressSameInd<xsl:value-of select="$pos+4"/></xsl:with-param>
										</xsl:call-template>
									</input>
								</div>
								<div class="sty4547TextCenterBoxEx">
									<input type="Checkbox" class="styCkboxNM" alt="HomeAddressSameInd{$pos+5}">
										<xsl:call-template name="PopulateCheckbox">
											<xsl:with-param name="TargetNode" select="$FormData/TrumpAccountChildInfoGrp[$pos + 5]/HomeAddressSameInd"/>
											<xsl:with-param name="BackupName">IRS4547HomeAddressSameInd<xsl:value-of select="$pos+5"/></xsl:with-param>
										</xsl:call-template>
									</input>
								</div>
							</div>
							<!-- 5a -->
							<div class="styStdDiv" style="min-height:7mm;display:flex;">
								<div class="styLNLeftNumBox" style="padding-left:2.5mm;">a</div>
								<div class="sty4547TextBoxEx">
									<xsl:choose>
										<xsl:when test="$FormData/TrumpAccountChildInfoGrp[$pos + 2]/USAddress">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="$FormData/TrumpAccountChildInfoGrp[$pos + 2]/USAddress/AddressLine1Txt"/>
											</xsl:call-template><br/>
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="$FormData/TrumpAccountChildInfoGrp[$pos + 2]/USAddress/AddressLine2Txt"/>
											</xsl:call-template>
										</xsl:when>
										<xsl:otherwise>
											<xsl:if test="$FormData/TrumpAccountChildInfoGrp[$pos + 2]/ForeignAddress">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="$FormData/TrumpAccountChildInfoGrp[$pos + 2]/ForeignAddress/AddressLine1Txt"/>
												</xsl:call-template><br/>
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="$FormData/TrumpAccountChildInfoGrp[$pos + 2]/ForeignAddress/AddressLine2Txt"/>
												</xsl:call-template>
											</xsl:if>
										</xsl:otherwise>
									</xsl:choose>
								</div>
								<div class="sty4547TextBoxEx">
									<xsl:choose>
										<xsl:when test="$FormData/TrumpAccountChildInfoGrp[$pos + 3]/USAddress">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="$FormData/TrumpAccountChildInfoGrp[$pos + 3]/USAddress/AddressLine1Txt"/>
											</xsl:call-template><br/>
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="$FormData/TrumpAccountChildInfoGrp[$pos + 3]/USAddress/AddressLine2Txt"/>
											</xsl:call-template>
										</xsl:when>
										<xsl:otherwise>
											<xsl:if test="$FormData/TrumpAccountChildInfoGrp[$pos + 3]/ForeignAddress">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="$FormData/TrumpAccountChildInfoGrp[$pos + 3]/ForeignAddress/AddressLine1Txt"/>
												</xsl:call-template><br/>
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="$FormData/TrumpAccountChildInfoGrp[$pos + 3]/ForeignAddress/AddressLine2Txt"/>
												</xsl:call-template>
											</xsl:if>
										</xsl:otherwise>
									</xsl:choose>
								</div>
								<div class="sty4547TextBoxEx">
									<xsl:choose>
										<xsl:when test="$FormData/TrumpAccountChildInfoGrp[$pos + 4]/USAddress">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="$FormData/TrumpAccountChildInfoGrp[$pos + 4]/USAddress/AddressLine1Txt"/>
											</xsl:call-template><br/>
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="$FormData/TrumpAccountChildInfoGrp[$pos + 4]/USAddress/AddressLine2Txt"/>
											</xsl:call-template>
										</xsl:when>
										<xsl:otherwise>
											<xsl:if test="$FormData/TrumpAccountChildInfoGrp[$pos + 4]/ForeignAddress">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="$FormData/TrumpAccountChildInfoGrp[$pos + 4]/ForeignAddress/AddressLine1Txt"/>
												</xsl:call-template><br/>
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="$FormData/TrumpAccountChildInfoGrp[$pos + 4]/ForeignAddress/AddressLine2Txt"/>
												</xsl:call-template>
											</xsl:if>
										</xsl:otherwise>
									</xsl:choose>
								</div>
								<div class="sty4547TextBoxEx">
									<xsl:choose>
										<xsl:when test="$FormData/TrumpAccountChildInfoGrp[$pos + 5]/USAddress">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="$FormData/TrumpAccountChildInfoGrp[$pos + 5]/USAddress/AddressLine1Txt"/>
											</xsl:call-template><br/>
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="$FormData/TrumpAccountChildInfoGrp[$pos + 5]/USAddress/AddressLine2Txt"/>
											</xsl:call-template>
										</xsl:when>
										<xsl:otherwise>
											<xsl:if test="$FormData/TrumpAccountChildInfoGrp[$pos + 5]/ForeignAddress">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="$FormData/TrumpAccountChildInfoGrp[$pos + 5]/ForeignAddress/AddressLine1Txt"/>
												</xsl:call-template><br/>
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="$FormData/TrumpAccountChildInfoGrp[$pos + 5]/ForeignAddress/AddressLine2Txt"/>
												</xsl:call-template>
											</xsl:if>
										</xsl:otherwise>
									</xsl:choose>
								</div>
							</div>
							<!-- 5b -->
							<div class="styStdDiv">
								<div class="styLNLeftNumBox" style="padding-left:2.5mm;">b</div>
								<div class="sty4547TextBoxEx">
									&nbsp;
								</div>
								<div class="sty4547TextBoxEx">
									&nbsp;
								</div>
								<div class="sty4547TextBoxEx">
									&nbsp;
								</div>
								<div class="sty4547TextBoxEx">
									&nbsp;
								</div>
							</div>
							<!-- 5c -->
							<div class="styStdDiv" style="display:flex;">
								<div class="styLNLeftNumBox" style="padding-left:2.5mm;">c</div>
								<div class="sty4547TextBoxEx">
									<xsl:choose>
										<xsl:when test="$FormData/TrumpAccountChildInfoGrp[$pos + 2]/USAddress">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="$FormData/TrumpAccountChildInfoGrp[$pos + 2]/USAddress/CityNm"/>
											</xsl:call-template>
										</xsl:when>
										<xsl:otherwise>
											<xsl:if test="$FormData/TrumpAccountChildInfoGrp[$pos + 2]/ForeignAddress">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="$FormData/TrumpAccountChildInfoGrp[$pos + 2]/ForeignAddress/CityNm"/>
												</xsl:call-template>
											</xsl:if>
										</xsl:otherwise>
									</xsl:choose>
								</div>
								<div class="sty4547TextBoxEx">
									<xsl:choose>
										<xsl:when test="$FormData/TrumpAccountChildInfoGrp[$pos + 3]/USAddress">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="$FormData/TrumpAccountChildInfoGrp[$pos + 3]/USAddress/CityNm"/>
											</xsl:call-template>
										</xsl:when>
										<xsl:otherwise>
											<xsl:if test="$FormData/TrumpAccountChildInfoGrp[$pos + 3]/ForeignAddress">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="$FormData/TrumpAccountChildInfoGrp[$pos + 3]/ForeignAddress/CityNm"/>
												</xsl:call-template>
											</xsl:if>
										</xsl:otherwise>
									</xsl:choose>
								</div>
								<div class="sty4547TextBoxEx">
									<xsl:choose>
										<xsl:when test="$FormData/TrumpAccountChildInfoGrp[$pos + 4]/USAddress">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="$FormData/TrumpAccountChildInfoGrp[$pos + 4]/USAddress/CityNm"/>
											</xsl:call-template>
										</xsl:when>
										<xsl:otherwise>
											<xsl:if test="$FormData/TrumpAccountChildInfoGrp[$pos + 4]/ForeignAddress">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="$FormData/TrumpAccountChildInfoGrp[$pos + 4]/ForeignAddress/CityNm"/>
												</xsl:call-template>
											</xsl:if>
										</xsl:otherwise>
									</xsl:choose>
								</div>
								<div class="sty4547TextBoxEx">
									<xsl:choose>
										<xsl:when test="$FormData/TrumpAccountChildInfoGrp[$pos + 5]/USAddress">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="$FormData/TrumpAccountChildInfoGrp[$pos + 5]/USAddress/CityNm"/>
											</xsl:call-template>
										</xsl:when>
										<xsl:otherwise>
											<xsl:if test="$FormData/TrumpAccountChildInfoGrp[$pos + 5]/ForeignAddress">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="$FormData/TrumpAccountChildInfoGrp[$pos + 5]/ForeignAddress/CityNm"/>
												</xsl:call-template>
											</xsl:if>
										</xsl:otherwise>
									</xsl:choose>
								</div>
							</div>
							<!-- 5d -->
							<div class="styStdDiv">
								<div class="styLNLeftNumBox" style="padding-left:2.5mm;">d</div>
								<div class="sty4547TextBoxEx">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$FormData/TrumpAccountChildInfoGrp[$pos + 2]/CountyNm"/>
									</xsl:call-template>
								</div>
								<div class="sty4547TextBoxEx">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$FormData/TrumpAccountChildInfoGrp[$pos + 3]/CountyNm"/>
									</xsl:call-template>
								</div>
								<div class="sty4547TextBoxEx">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$FormData/TrumpAccountChildInfoGrp[$pos + 4]/CountyNm"/>
									</xsl:call-template>
								</div>
								<div class="sty4547TextBoxEx">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$FormData/TrumpAccountChildInfoGrp[$pos + 5]/CountyNm"/>
									</xsl:call-template>
								</div>
							</div>
							<!-- 5e -->
							<div class="styStdDiv">
								<div class="styLNLeftNumBox" style="padding-left:2.5mm;">e</div>
								<div class="sty4547TextCenterBoxEx">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$FormData/TrumpAccountChildInfoGrp[$pos + 2]/USAddress/StateAbbreviationCd"/>
									</xsl:call-template>
								</div>
								<div class="sty4547TextCenterBoxEx">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$FormData/TrumpAccountChildInfoGrp[$pos + 3]/USAddress/StateAbbreviationCd"/>
									</xsl:call-template>
								</div>
								<div class="sty4547TextCenterBoxEx">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$FormData/TrumpAccountChildInfoGrp[$pos + 4]/USAddress/StateAbbreviationCd"/>
									</xsl:call-template>
								</div>
								<div class="sty4547TextCenterBoxEx">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$FormData/TrumpAccountChildInfoGrp[$pos + 5]/USAddress/StateAbbreviationCd"/>
									</xsl:call-template>
								</div>
							</div>
							<!-- 5f -->
							<div class="styStdDiv">
								<div class="styLNLeftNumBox" style="padding-left:2.5mm;">f</div>
								<div class="sty4547TextBoxEx">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$FormData/TrumpAccountChildInfoGrp[$pos + 2]/USAddress/ZIPCd"/>
									</xsl:call-template>
								</div>
								<div class="sty4547TextBoxEx">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$FormData/TrumpAccountChildInfoGrp[$pos + 3]/USAddress/ZIPCd"/>
									</xsl:call-template>
								</div>
								<div class="sty4547TextBoxEx">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$FormData/TrumpAccountChildInfoGrp[$pos + 4]/USAddress/ZIPCd"/>
									</xsl:call-template>
								</div>
								<div class="sty4547TextBoxEx">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$FormData/TrumpAccountChildInfoGrp[$pos + 5]/USAddress/ZIPCd"/>
									</xsl:call-template>
								</div>
							</div>
							<!-- 5g -->
							<div class="styStdDiv">
								<div class="styLNLeftNumBox" style="padding-left:2.5mm;">g</div>
								<div class="sty4547TextCenterBoxEx">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$FormData/TrumpAccountChildInfoGrp[$pos + 2]/ForeignAddress/CountryCd"/>
									</xsl:call-template>
								</div>
								<div class="sty4547TextCenterBoxEx">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$FormData/TrumpAccountChildInfoGrp[$pos + 3]/ForeignAddress/CountryCd"/>
									</xsl:call-template>
								</div>
								<div class="sty4547TextCenterBoxEx">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$FormData/TrumpAccountChildInfoGrp[$pos + 4]/ForeignAddress/CountryCd"/>
									</xsl:call-template>
								</div>
								<div class="sty4547TextCenterBoxEx">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$FormData/TrumpAccountChildInfoGrp[$pos + 5]/ForeignAddress/CountryCd"/>
									</xsl:call-template>
								</div>
							</div>
							<!-- 5h -->
							<div class="styStdDiv">
								<div class="styLNLeftNumBox" style="padding-left:2.5mm;">h</div>
								<div class="sty4547TextBoxEx">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$FormData/TrumpAccountChildInfoGrp[$pos + 2]/ForeignAddress/ProvinceOrStateNm"/>
									</xsl:call-template>
								</div>
								<div class="sty4547TextBoxEx">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$FormData/TrumpAccountChildInfoGrp[$pos + 3]/ForeignAddress/ProvinceOrStateNm"/>
									</xsl:call-template>
								</div>
								<div class="sty4547TextBoxEx">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$FormData/TrumpAccountChildInfoGrp[$pos + 4]/ForeignAddress/ProvinceOrStateNm"/>
									</xsl:call-template>
								</div>
								<div class="sty4547TextBoxEx">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$FormData/TrumpAccountChildInfoGrp[$pos + 5]/ForeignAddress/ProvinceOrStateNm"/>
									</xsl:call-template>
								</div>
							</div>
							<!-- 5i -->
							<div class="styStdDiv">
								<div class="styLNLeftNumBox" style="padding-left:2.5mm;">i</div>
								<div class="sty4547TextBoxEx">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$FormData/TrumpAccountChildInfoGrp[$pos + 2]/ForeignAddress/ForeignPostalCd"/>
									</xsl:call-template>
								</div>
								<div class="sty4547TextBoxEx">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$FormData/TrumpAccountChildInfoGrp[$pos + 3]/ForeignAddress/ForeignPostalCd"/>
									</xsl:call-template>
								</div>
								<div class="sty4547TextBoxEx">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$FormData/TrumpAccountChildInfoGrp[$pos + 4]/ForeignAddress/ForeignPostalCd"/>
									</xsl:call-template>
								</div>
								<div class="sty4547TextBoxEx">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$FormData/TrumpAccountChildInfoGrp[$pos + 5]/ForeignAddress/ForeignPostalCd"/>
									</xsl:call-template>
								</div>
							</div>
							<!-- 6 -->
							<div class="styStdDiv">
								<div class="styLNLeftNumBox">6</div>
								<div class="sty4547TextCenterBoxEx">
									<input type="Checkbox" class="styCkboxNM" alt="AuthorizedOpenAccountInd{$pos+2}">
										<xsl:call-template name="PopulateCheckbox">
											<xsl:with-param name="TargetNode" select="$FormData/TrumpAccountChildInfoGrp[$pos + 2]/AuthorizedOpenAccountInd"/>
											<xsl:with-param name="BackupName">IRS4547AuthorizedOpenAccountInd<xsl:value-of select="$pos+2"/></xsl:with-param>
										</xsl:call-template>
									</input>
								</div>
								<div class="sty4547TextCenterBoxEx">
									<input type="Checkbox" class="styCkboxNM" alt="AuthorizedOpenAccountInd{$pos+3}">
										<xsl:call-template name="PopulateCheckbox">
											<xsl:with-param name="TargetNode" select="$FormData/TrumpAccountChildInfoGrp[$pos + 3]/AuthorizedOpenAccountInd"/>
											<xsl:with-param name="BackupName">IRS4547AuthorizedOpenAccountInd<xsl:value-of select="$pos+3"/></xsl:with-param>
										</xsl:call-template>
									</input>
								</div>
								<div class="sty4547TextCenterBoxEx">
									<input type="Checkbox" class="styCkboxNM" alt="AuthorizedOpenAccountInd{$pos+4}">
										<xsl:call-template name="PopulateCheckbox">
											<xsl:with-param name="TargetNode" select="$FormData/TrumpAccountChildInfoGrp[$pos + 4]/AuthorizedOpenAccountInd"/>
											<xsl:with-param name="BackupName">IRS4547AuthorizedOpenAccountInd<xsl:value-of select="$pos+4"/></xsl:with-param>
										</xsl:call-template>
									</input>
								</div>
								<div class="sty4547TextCenterBoxEx">
									<input type="Checkbox" class="styCkboxNM" alt="AuthorizedOpenAccountInd{$pos+5}">
										<xsl:call-template name="PopulateCheckbox">
											<xsl:with-param name="TargetNode" select="$FormData/TrumpAccountChildInfoGrp[$pos + 5]/AuthorizedOpenAccountInd"/>
											<xsl:with-param name="BackupName">IRS4547AuthorizedOpenAccountInd<xsl:value-of select="$pos+5"/></xsl:with-param>
										</xsl:call-template>
									</input>
								</div>
							</div>
							<!-- Part III - Line 7 -->
							<div class="styStdDiv">
								<div class="styLNLeftNumBox">7</div>
								<div class="sty4547TextCenterBoxEx">
									<input type="Checkbox" class="styCkboxNM" alt="PilotProgramContributionInd{$pos+2}">
										<xsl:call-template name="PopulateCheckbox">
											<xsl:with-param name="TargetNode" select="$FormData/TrumpAccountChildInfoGrp[$pos + 2]/PilotProgramContributionInd"/>
											<xsl:with-param name="BackupName">IRS4547PilotProgramContributionInd<xsl:value-of select="$pos+2"/></xsl:with-param>
										</xsl:call-template>
									</input>
								</div>
								<div class="sty4547TextCenterBoxEx">
									<input type="Checkbox" class="styCkboxNM" alt="PilotProgramContributionInd{$pos+3}">
										<xsl:call-template name="PopulateCheckbox">
											<xsl:with-param name="TargetNode" select="$FormData/TrumpAccountChildInfoGrp[$pos + 3]/PilotProgramContributionInd"/>
											<xsl:with-param name="BackupName">IRS4547PilotProgramContributionInd<xsl:value-of select="$pos+3"/></xsl:with-param>
										</xsl:call-template>
									</input>
								</div>
								<div class="sty4547TextCenterBoxEx">
									<input type="Checkbox" class="styCkboxNM" alt="PilotProgramContributionInd{$pos+4}">
										<xsl:call-template name="PopulateCheckbox">
											<xsl:with-param name="TargetNode" select="$FormData/TrumpAccountChildInfoGrp[$pos + 4]/PilotProgramContributionInd"/>
											<xsl:with-param name="BackupName">IRS4547PilotProgramContributionInd<xsl:value-of select="$pos+4"/></xsl:with-param>
										</xsl:call-template>
									</input>
								</div>
								<div class="sty4547TextCenterBoxEx">
									<input type="Checkbox" class="styCkboxNM" alt="PilotProgramContributionInd{$pos+5}">
										<xsl:call-template name="PopulateCheckbox">
											<xsl:with-param name="TargetNode" select="$FormData/TrumpAccountChildInfoGrp[$pos + 5]/PilotProgramContributionInd"/>
											<xsl:with-param name="BackupName">IRS4547PilotProgramContributionInd<xsl:value-of select="$pos+5"/></xsl:with-param>
										</xsl:call-template>
									</input>
								</div>
							</div>
						</xsl:if>
					</xsl:for-each>
					<div class="styStdDiv pageEnd">&nbsp;</div>
				</xsl:if>
				<!-- Additional Data title bar and button -->
				<div class="styLeftOverTitleLine" id="LeftoverData">
					<div class="styLeftOverTitle">
						Additional Data        
					</div>
					<div class="styLeftOverButtonContainer">
						<input class="styLeftoverTableBtn" type="button" TabIndex="-1" value="Return to Form" onclick="javascript:returnToWriteInImage();"/>
					</div>
				</div>
				<!-- Additional Data table -->
				<table class="styLeftOverTbl">
					<xsl:call-template name="PopulateCommonLeftover">
						<xsl:with-param name="TargetNode" select="$FormData"/>
						<xsl:with-param name="DescWidth" select="100"/>
					</xsl:call-template>
					<xsl:call-template name="PopulateLeftoverRow">
						<xsl:with-param name="Desc">Bottom - Email Address </xsl:with-param>
						<xsl:with-param name="TargetNode" select="$FormData/PaidPreparerInformationGrp/EmailAddressTxt"/>
						<xsl:with-param name="DescWidth"/>
					</xsl:call-template>
				</table>
			</body>
		</html>
	</xsl:template>
</xsl:stylesheet>