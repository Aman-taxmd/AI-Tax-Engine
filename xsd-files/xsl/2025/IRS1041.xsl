<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:include href="PopulateTemplate.xsl"/>
	<xsl:include href="AddHeader.xsl"/>
	<xsl:include href="CommonPathRef.xsl"/>
	<xsl:include href="AddOnTable.xsl"/>
	<xsl:include href="IRS1041Style.xsl"/>
	<xsl:output method="html" indent="yes"/>
	<xsl:strip-space elements="*"/>
	<xsl:param name="FormData" select="$RtnDoc/IRS1041"/>
	<xsl:template name="DotLoop">		
		<xsl:param name="DotQty"/>
		<xsl:if test="$DotQty &gt; 0">
			<span style="width:11px" />.
			<xsl:call-template name="DotLoop">				
				<xsl:with-param name="DotQty" select="$DotQty - 1"/>
			</xsl:call-template>		
		</xsl:if>
	</xsl:template>	
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
				<meta name="Description" content="IRS Form 1041"/>
				<script language="JavaScript" src="{$ScriptPath}/FormDisplay.js" type="text/javascript"/>
				<xsl:call-template name="InitJS"/>
				<style type="text/css">
					<xsl:if test="not($Print) or $Print=''">
						<xsl:call-template name="IRS1041Style"/>
						<xsl:call-template name="AddOnStyle"/>
					</xsl:if>
				</style>
				<xsl:call-template name="GlobalStylesForm"/>
			</head>
			<body class="styBodyClass" style="width:187mm">
				<form id="Form1041">
					<!-- *****************************Start Page Header***************************** -->
					<xsl:call-template name="DocumentHeader"/>
					<div class="styTBB" style="width:187mm;">
						<!-- Extra data line -->
						<div class="styGenericDiv" style="width:187mm;padding-top:1px;">
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$FormData"/>
							</xsl:call-template>
							<xsl:call-template name="LinkToLeftoverDataTableInline">
								<xsl:with-param name="Desc">Top Left Margin - Short Period Reason 1041 Indicator</xsl:with-param>
								<xsl:with-param name="TargetNode" select="$FormData/ShortPeriodReason1041Ind"/>
							</xsl:call-template>
							<xsl:call-template name="LinkToLeftoverDataTableInline">
								<xsl:with-param name="Desc">Top Left Margin - Section 642(i) Indicator</xsl:with-param>
								<xsl:with-param name="TargetNode" select="$FormData/@section642iCd"/>
							</xsl:call-template>
							<xsl:call-template name="LinkToLeftoverDataTableInline">
								<xsl:with-param name="Desc">Top Left Margin - Pool Number Text</xsl:with-param>
								<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/PoolNumberTxt"/>
							</xsl:call-template>																				
						</div>
						<div style="width:187mm;height:12mm;">
							<div class="styGenericDiv" style="width:130mm;height:10mm;">
								<span style="padding-top:2mm;">
									<img alt="Form" src="{$ImagePath}/1040_Form.gif" height="34" width="19"/>							
									<span class="styFormNumber" style="vertical-align:bottom">1041</span>
								</span>
								<div class="styGenericDiv" style="float:right;padding-right:19mm;padding-top:2px;width:100mm;height:10mm;">
									<span class="styAgency">Department of the Treasury&#8212;Internal Revenue Service</span><span style="width:4mm;"/><br/>
									<span class="styMainTitle" style="font-family:Arial Narrow;width:100mm;">U.S. Income Tax Return for Estates and Trusts</span><br/>
									<span style="font-weight:bold;font-size:6pt;width:100mm;">
										Go to
										<a style="text-decoration:none;color:black;" href="http://www.irs.gov/form1041" title="Link to IRS.gov"><i>www.irs.gov/Form1041</i> for instructions and the latest information.</a>
									</span>
								</div>
							</div>
							<div class="styGenericDiv" style="width:21mm;height:12mm;border-right:2px solid black;border-left:2px solid black;padding-top:1mm;padding-left:9px;padding-right:8px;">
								<span class="styTaxYear">20<span class="styTYColor">25</span></span>
							</div>
							<div class="styOMB" style="width:34.5mm;height:12mm;padding:4mm 1mm 1mm 5mm;float:left;border-width:0px 0px 0px 0px;vertical-align:bottom;">
							OMB No. 1545-0092
							</div>						
						</div>
					</div>
					<!-- ************************End Page Header *************************** -->
					<!-- Entity Data -->
					<div class="styBB" style="width:187mm;">
						<!-- Line 0 -->
						<div class="styGenericDiv" style="width:39.8mm;float:left;">
							<div class="styGenericDiv" style="width:39.8mm;">
								<b>A</b><span style="width:2mm" />Check all that apply:
							</div>
							<div class="styLNDesc" style="height:4.5mm;width:39.8mm;padding-top:0mm;padding-bottom:0mm;">
								<label>
									<xsl:call-template name="PopulateLabel">
										<xsl:with-param name="TargetNode" select="$FormData/DecedentsEstateInd"/>
										<xsl:with-param name="BackupName">$FormDataDecedentsEstateInd</xsl:with-param>
									</xsl:call-template>										 
									<input class="styCkbox" type="checkbox" aria-label="Decedent Estate" style="width:4mm;">
										<xsl:call-template name="PopulateCheckbox">
											<xsl:with-param name="TargetNode" select="$FormData/DecedentsEstateInd"/>
											<xsl:with-param name="BackupName">$FormDataDecedentsEstateInd</xsl:with-param>
										</xsl:call-template>
									</input>
								</label>
								<span style="width:1px;"/>Decedent's Estate
							</div>
							<div class="styLNDesc" style="height:4.5mm;width:39.8mm;padding-top:0mm;padding-bottom:0mm;">
								<label>
									<xsl:call-template name="PopulateLabel">
										<xsl:with-param name="TargetNode" select="$FormData/SimpleTrustInd"/>
										<xsl:with-param name="BackupName">$FormDataSimpleTrustInd</xsl:with-param>
									</xsl:call-template>										 
									<input class="styCkbox" type="checkbox" aria-label="Simple trust" style="width:4mm;">
										<xsl:call-template name="PopulateCheckbox">
											<xsl:with-param name="TargetNode" select="$FormData/SimpleTrustInd"/>
											<xsl:with-param name="BackupName">$FormDataSimpleTrustInd</xsl:with-param>
										</xsl:call-template>
									</input>
								</label>
								<span style="width:1px;"/>Simple trust
							</div>
							<div class="styLNDesc" style="height:4.5mm;width:39.8mm;padding-top:0mm;padding-bottom:0mm;">
								<label>
									<xsl:call-template name="PopulateLabel">
										<xsl:with-param name="TargetNode" select="$FormData/ComplexTrustInd"/>
										<xsl:with-param name="BackupName">$FormDataComplexTrustInd</xsl:with-param>
									</xsl:call-template>										 
									<input class="styCkbox" type="checkbox" aria-label="Complex trust" style="width:4mm;">
										<xsl:call-template name="PopulateCheckbox">
											<xsl:with-param name="TargetNode" select="$FormData/ComplexTrustInd"/>
											<xsl:with-param name="BackupName">$FormDataComplexTrustInd</xsl:with-param>
										</xsl:call-template>
									</input>
								</label>
								<span style="width:1px;"/>Complex trust
							</div>
							<div class="styLNDesc" style="height:4.5mm;width:39.8mm;padding-top:0mm;padding-bottom:0mm;">
								<label>
									<xsl:call-template name="PopulateLabel">
										<xsl:with-param name="TargetNode" select="$FormData/QualifiedDisabilityTrustInd"/>
										<xsl:with-param name="BackupName">$FormDataQualifiedDisabilityTrustInd</xsl:with-param>
									</xsl:call-template>										 
									<input class="styCkbox" type="checkbox" aria-label="Qualified disability trust" style="width:4mm">
										<xsl:call-template name="PopulateCheckbox">
											<xsl:with-param name="TargetNode" select="$FormData/QualifiedDisabilityTrustInd"/>
											<xsl:with-param name="BackupName">$FormDataQualifiedDisabilityTrustInd</xsl:with-param>
										</xsl:call-template>
									</input>
								</label>
								<span style="width:1px;"/>Qualified disability trust
							</div>
							<div class="styLNDesc" style="height:4.5mm;width:39.8mm;padding-top:0mm;padding-bottom:0mm;">
								<label>
									<xsl:call-template name="PopulateLabel">
										<xsl:with-param name="TargetNode" select="$FormData/ESBTSPortionOnlyInd"/>
										<xsl:with-param name="BackupName">$FormDataESBTSPortionOnlyInd</xsl:with-param>
									</xsl:call-template>										 
									<input class="styCkbox" type="checkbox" aria-label="ESBT S Portion Only" style="width:4mm">
										<xsl:call-template name="PopulateCheckbox">
											<xsl:with-param name="TargetNode" select="$FormData/ESBTSPortionOnlyInd"/>
											<xsl:with-param name="BackupName">$FormDataESBTSPortionOnlyInd</xsl:with-param>
										</xsl:call-template>
									</input>
								</label>
								<span style="width:1px;"/>ESBT (S portion only)
							</div>
							<div class="styLNDesc" style="height:4.5mm;width:39.8mm;padding-top:0mm;padding-bottom:0mm;">
								<label>
									<xsl:call-template name="PopulateLabel">
										<xsl:with-param name="TargetNode" select="$FormData/GrantorTypeTrustInd"/>
										<xsl:with-param name="BackupName">$FormDataGrantorTypeTrustInd</xsl:with-param>
									</xsl:call-template>										 
									<input class="styCkbox" type="checkbox" aria-label="Grantor type trust" style="width:4mm;">
										<xsl:call-template name="PopulateCheckbox">
											<xsl:with-param name="TargetNode" select="$FormData/GrantorTypeTrustInd"/>
											<xsl:with-param name="BackupName">$FormDataGrantorTypeTrustInd</xsl:with-param>
										</xsl:call-template>
									</input>
								</label>
								<span style="width:1px;"/>Grantor type trust
								<xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode" select="$FormData/GrantorTypeTrustInd"/>
								</xsl:call-template>
							</div>
							<div class="styLNDesc" style="height:4.5mm;width:39.8mm;padding-top:0mm;padding-bottom:0mm;">
								<label>
									<xsl:call-template name="PopulateLabel">
										<xsl:with-param name="TargetNode" select="$FormData/BankruptcyEstateChap7Ind"/>
										<xsl:with-param name="BackupName">$FormDataBankruptcyEstateChap7Ind</xsl:with-param>
									</xsl:call-template>										 
									<input class="styCkbox" type="checkbox" aria-label="Bankruptcy estate Chapter 7" style="width:4mm">
										<xsl:call-template name="PopulateCheckbox">
											<xsl:with-param name="TargetNode" select="$FormData/BankruptcyEstateChap7Ind"/>
											<xsl:with-param name="BackupName">$FormDataBankruptcyEstateChap7Ind</xsl:with-param>
										</xsl:call-template>
									</input>
								</label>
								<span style="width:1px;"/>Bankruptcy estate-Ch. 7
							</div>
							<div class="styLNDesc" style="height:4.5mm;width:39.8mm;padding-top:0mm;padding-bottom:0mm;">
								<label>
									<xsl:call-template name="PopulateLabel">
										<xsl:with-param name="TargetNode" select="$FormData/BankruptcyEstateChap11Ind"/>
										<xsl:with-param name="BackupName">$FormDataBankruptcyEstateChap11Ind</xsl:with-param>
									</xsl:call-template>										 
									<input class="styCkbox" type="checkbox" aria-label="Bankruptcy estate Chapter 11" style="width:4mm;">
										<xsl:call-template name="PopulateCheckbox">
											<xsl:with-param name="TargetNode" select="$FormData/BankruptcyEstateChap11Ind"/>
											<xsl:with-param name="BackupName">$FormDataBankruptcyEstateChap11Ind</xsl:with-param>
										</xsl:call-template>
									</input>
								</label>
								<span style="width:1px;"/>Bankruptcy estate-Ch. 11
							</div>
							<div class="styLNDesc" style="height:4.5mm;width:39.8mm;padding-top:0mm;">
								<label>
									<xsl:call-template name="PopulateLabel">
										<xsl:with-param name="TargetNode" select="$FormData/PooledIncomeFundInd"/>
										<xsl:with-param name="BackupName">$FormDataPooledIncomeFundInd</xsl:with-param>
									</xsl:call-template>										 
									<input class="styCkbox" type="checkbox" aria-label="Pooled income fund" style="width:4mm;">
										<xsl:call-template name="PopulateCheckbox">
											<xsl:with-param name="TargetNode" select="$FormData/PooledIncomeFundInd"/>
											<xsl:with-param name="BackupName">$FormDataPooledIncomeFundInd</xsl:with-param>
										</xsl:call-template>
									</input>
								</label>
								<span style="width:1px;padding-bottom:1mm;"/>Pooled income fund
									<xsl:call-template name="SetFormLinkInline">
											<xsl:with-param name="TargetNode" select="$FormData/PooledIncomeFundInd"/>
										</xsl:call-template>
							</div>
							<div class="styLNDesc" style="height:0.1mm;width:39.8mm;padding-top:.1mm;padding-bottom:.1mm;border-bottom:1px solid black;">
							</div>
							<!-- 8/15/2014 AM- NOTE: Line above section B in XML is fixed but is misaligned in PP mode, XML takes precedence over PP. --> 
							<div class="styGenericDiv" style="width:39.8mm;font-size:6.5pt">
								<b>B</b><span style="width:2mm;" />Number of Schedules K-1<br />
								<span style="width:4mm;" />attached (see
								<xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode" select="$FormData/ScheduleK1AttachedCnt"/>
								</xsl:call-template><br />
								<span style="width:4mm;" />instructions) 
								<span style="width:14mm;" />
								<!--<img src="{$ImagePath}/1040_Bullet.gif" alt="Right pointing arrowhead image"/>-->
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$FormData/ScheduleK1AttachedCnt"/>
								</xsl:call-template>
							</div>
						</div>
						<div class="styGenericDiv" style="width:146.9mm;height:53mm;float:left;border-left:1px solid black;">
							<div class="styBB" style="width:146.9mm;height:5mm;padding-top:1mm;padding-left:1mm;">For calendar year 2025 or fiscal year beginning 
								<span style="width:2mm;"/>
								<xsl:call-template name="PopulateReturnHeaderTaxPeriodBeginDate"/> and ending 
								<span style="width:2mm;"/>
								<xsl:call-template name="PopulateReturnHeaderTaxPeriodEndDate"/>
							</div>
							<!-- 7/28/2015 AM: Changed Filer name information font to 6pt to fit inside field (Defect 43651) --> 
							<div class="styBB" style="width:146.9mm;height:auto;float:left;">
								<div class="" style="width:99mm;padding-left:1mm;float:left;height:auto;border-right:1px solid black;">
									Name of estate or trust (If a grantor type trust, see the instructions.)<br/>
									<span style="font-size:5.5pt;">
									<xsl:choose>
										<xsl:when test="$RtnHdrData/Filer/EstateOrTrustName">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/EstateOrTrustName/BusinessNameLine1Txt"/>
											</xsl:call-template><br/>
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/EstateOrTrustName/BusinessNameLine2Txt"/>								
											</xsl:call-template>
										</xsl:when>
										<xsl:otherwise>
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/NationalMortgageAssocCd"/>								
											</xsl:call-template>
										</xsl:otherwise>
									</xsl:choose>
									</span>
									<span style="width:6px;"/>
									<xsl:call-template name="LinkToLeftoverDataTableInline">
										<xsl:with-param name="Desc">Header - In Care Of Name</xsl:with-param>
										<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/InCareOfNm"/>
									</xsl:call-template>
									<xsl:call-template name="LinkToLeftoverDataTableInline">
										<xsl:with-param name="Desc">Header - Business Name Control</xsl:with-param>
										<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/BusinessNameControlTxt"/>
									</xsl:call-template>
								</div>
								<!-- 10/1/2015 AM: Per Defect 43651, height adjusted to 6.5mm and padding reduced to allow EIN to fit in field. When using Filer Business name, EIN will not be bottom-left aligned; when using Filer Mortgage Cd, EIN will be bottom-left aligned.-->
								<div class="" style="width:47.6mm;height:6mm;float:left;padding-left:1mm;">
									<b>C<span style="width:1mm;" />Employer identification number</b><br />
									<span style="width:46.6mm;text-align:bottom;padding-left:1mm;padding-top:.5mm">
										<xsl:call-template name="PopulateReturnHeaderFiler">
											<xsl:with-param name="TargetNode">EIN</xsl:with-param>
											<xsl:with-param name="EINChanged">true</xsl:with-param>
										</xsl:call-template>
										<span style="height:.5mm"/>	
									</span>														
								</div>
							</div>
							<div class="styBB" style="width:146.9mm;height:11.7mm;float:left;">
								<div class="" style="width:99mm;padding-left:1mm;height:100%;float:left;border-right:1px solid black;">
									<span style="" />Name and title of fiduciary<br />
									<span style="font-size:6.5pt;">
										<xsl:choose>
											<xsl:when test="$RtnHdrData/Filer/FiduciaryPersonName">
												<xsl:call-template name="PopulateReturnHeaderFiler">
													<xsl:with-param name="TargetNode">PersonFirstNm</xsl:with-param>
												</xsl:call-template>&#160;
												<xsl:call-template name="PopulateReturnHeaderFiler">
													<xsl:with-param name="TargetNode">PersonLastNm</xsl:with-param>
												</xsl:call-template><br />
											</xsl:when>
											<xsl:otherwise>
												<xsl:call-template name="PopulateReturnHeaderFiler">
													<xsl:with-param name="TargetNode">FiduciaryBusinessNm</xsl:with-param>
												</xsl:call-template><br />
											</xsl:otherwise>
										</xsl:choose>
										<xsl:call-template name="PopulateReturnHeaderFiler">
											<xsl:with-param name="TargetNode">FiduciaryTitleTxt</xsl:with-param>
										</xsl:call-template>
									</span>							
								</div>
								<div class="" style="width:47.6mm;height:11mm;float:left;padding-left:1mm;">
									<b>D</b><span style="width:1mm;" />Date entity created<br />
									<span style="width:46.6mm;text-align:center">	
										<xsl:call-template name="PopulateMonthDayYear">
											<xsl:with-param name="TargetNode" select="$FormData/EstateOrTrustCreateDt"/>
										</xsl:call-template>
									</span>						
								</div>
							</div>
							<div class="styBB" style="width:146.9mm;float:left;">
								<div class="" style="height:18.8mm;float:left;border-right:1px solid black;">
									<div class="styBB" style="width:98.8mm;padding-left:1mm;height:10mm;">
										<div style="width:75.5mm;height:100%;border-right:1px solid black;font-size:6.5pt">
											Number and street. (If a P.O. box, see the instructions.) 
											<br />
											<xsl:call-template name="PopulateReturnHeaderFiler">
												<xsl:with-param name="TargetNode">AddressLine1Txt</xsl:with-param>
											</xsl:call-template><br />
											<xsl:call-template name="PopulateReturnHeaderFiler">
												<xsl:with-param name="TargetNode">AddressLine2Txt</xsl:with-param>
											</xsl:call-template>
										</div>
										<div style="width:21.2mm;height:100%;font-size:6.5pt">
											Room or suite no.<br />
										</div>																											
									</div>
									<div class="styBB" style="width:98.8mm;height:8.9mm;padding-left:1mm;border-bottom:0px solid black;font-size:6pt">
										<div style="width:34mm;height:100%;border-right:1px solid black;">
											<span style="font-size:6.5pt">City or town</span> <br/>
											<span style="display:table-cell;vertical-align:bottom;height:5.5mm;">
												<xsl:call-template name="PopulateReturnHeaderFiler">
													<xsl:with-param name="TargetNode">CityNm</xsl:with-param>
												</xsl:call-template>
											</span>
										</div>
										<div style="width:22mm;height:100%;border-right:1px solid black;">
											<span style="font-size:6.5pt">State or province</span> <br/>
											<!--02/24/26 added logic for foriegn addrress per defect received-->
											<span style="display:table-cell;vertical-align:bottom;height:5.5mm;">
												<xsl:if test="$RtnHdrData/Filer/USAddress/StateAbbreviationCd">
													<xsl:call-template name="PopulateReturnHeaderFiler">
														<xsl:with-param name="TargetNode">StateAbbreviationCd</xsl:with-param>
													</xsl:call-template>
												</xsl:if>
												<xsl:if test="$RtnHdrData/Filer/ForeignAddress/ProvinceOrStateNm">
													<xsl:call-template name="PopulateReturnHeaderFiler">
														<xsl:with-param name="TargetNode">ProvinceOrStateNm</xsl:with-param>
													</xsl:call-template>
												</xsl:if>
											</span>
										</div>
										<div style="width:11mm;height:100%;border-right:1px solid black;">
											<span style="font-size:6.5pt">Country</span><br/> 
											<span style="display:table-cell;vertical-align:bottom;height:5.5mm;">
												<xsl:call-template name="PopulateReturnHeaderFiler">
													<xsl:with-param name="TargetNode">CountryCd</xsl:with-param>
												</xsl:call-template>
											</span>
										</div>
										<div style="width:28.5mm;height:100%">
											<span style="" />ZIP or foreign postal code <br/>
											<xsl:if test="$RtnHdrData/Filer/USAddress/ZIPCd">
												<span style="display:table-cell;vertical-align:bottom;height:5.5mm;">
													<xsl:call-template name="PopulateReturnHeaderFiler">
														<xsl:with-param name="TargetNode">ZIPCd</xsl:with-param>
													</xsl:call-template>
												</span>
											</xsl:if>
											<xsl:if test="$RtnHdrData/Filer/ForeignAddress/ForeignPostalCd">
												<span style="display:table-cell;vertical-align:bottom;height:5.5mm;">
													<xsl:call-template name="PopulateReturnHeaderFiler">
														<xsl:with-param name="TargetNode">ForeignPostalCd</xsl:with-param>
													</xsl:call-template>
												</span>
											</xsl:if>
										</div>																
									</div>
								</div>
								<div class="" style="width:47.6mm;height:18.8mm;float:left;font-size:6pt">
									<span style="padding-left:1mm;font-size:7pt"><b>E</b></span>
									<span style="width:1.5mm;" />Nonexempt charitable and split-interest<br />
									<span style="width:4.5mm;" />trusts, check applicable.<br />
									<span style="width:4.5mm;" />See instructions.<br />
									<div class="styGenericDiv">
										<label>
											<xsl:call-template name="PopulateLabel">
												<xsl:with-param name="TargetNode" select="$FormData/NonExemptSec4947a1Ind"/>
												<xsl:with-param name="BackupName">$FormDataNonExemptSec4947a1Ind</xsl:with-param>
											</xsl:call-template>										 
											<input class="styCkbox" aria-label="NonExemptSec4947a1" type="checkbox" style="width:4mm;margin:0mm;">
												<xsl:call-template name="PopulateCheckbox">
													<xsl:with-param name="TargetNode" select="$FormData/NonExemptSec4947a1Ind"/>
													<xsl:with-param name="BackupName">$FormDataNonExemptSec4947a1Ind</xsl:with-param>
												</xsl:call-template>
											</input>									
										</label>							
										<span style="font-size:7pt;font-family:arial narrow;padding-left:0.5mm;">Described in sec. 4947(a)(1). Check here</span>
									</div>
									<div class="styGenericDiv">
										<span style="font-size:7pt;font-family:arial narrow;padding-left:4.5mm;float:left;padding-top:1mm">if not a private foundation</span>
										<span class="styBoldText" style="float:right;">
											<xsl:call-template name="DotLoop">						
												<xsl:with-param name="DotQty" select="3"/>
											</xsl:call-template>
											<label>
												<xsl:call-template name="PopulateLabel">
													<xsl:with-param name="TargetNode" select="$FormData/NonPrivateFoundationInd"/>
													<xsl:with-param name="BackupName">$FormDataNonPrivateFoundationInd</xsl:with-param>
												</xsl:call-template>										 
												<input class="styCkbox" aria-label="NonPrivateFoundation" type="checkbox" style="width:4mm;margin:0mm;margin-left:2mm;">
													<xsl:call-template name="PopulateCheckbox">
														<xsl:with-param name="TargetNode" select="$FormData/NonPrivateFoundationInd"/>
														<xsl:with-param name="BackupName">$FormDataNonPrivateFoundationInd</xsl:with-param>
													</xsl:call-template>
												</input>									
											</label>
										</span>
									</div><br />
								<div class="styGenericDiv"><span style="float:left;">
								<label>
									<xsl:call-template name="PopulateLabel">
										<xsl:with-param name="TargetNode" select="$FormData/NonExemptSec4947a2Ind"/>
										<xsl:with-param name="BackupName">$FormDataNonExemptSec4947a2Ind</xsl:with-param>
									</xsl:call-template>										 
									<input class="styCkbox" aria-label="NonExemptSec4947a2" type="checkbox" style="width:4mm;margin:0mm;">
										<xsl:call-template name="PopulateCheckbox">
											<xsl:with-param name="TargetNode" select="$FormData/NonExemptSec4947a2Ind"/>
											<xsl:with-param name="BackupName">$FormDataNonExemptSec4947a2Ind</xsl:with-param>
										</xsl:call-template>
									</input>									
								</label>
								<span style="font-size:7pt;font-family:arial narrow;padding-left:0.5mm;">Described in sec. 4947(a)(2)</span><br /></span>
							</div>
							</div>
							</div>
							<div class="styGenericDiv" style="width:146.7mm;padding-left:1mm;">						
								<span style="float:left;">
									<b>F</b><span style="width:1mm;" />Check<br />
									<span style="width:3mm;" />applicable<br />
									<span style="width:3mm;" />boxes:
								</span>
								<!-- Span 1 for top 5 checkboxes -->
								<span style="float:left;padding-left:.5mm;padding-top:0mm;">
									<label>
										<xsl:call-template name="PopulateLabel">
											<xsl:with-param name="TargetNode" select="$FormData/InitialReturnInd"/>
											<xsl:with-param name="BackupName">$FormDataInitialReturnInd</xsl:with-param>
										</xsl:call-template>										 
										<input class="styCkbox" aria-label="InitialReturn" type="checkbox" style="width:3mm;">
											<xsl:call-template name="PopulateCheckbox">
												<xsl:with-param name="TargetNode" select="$FormData/InitialReturnInd"/>
												<xsl:with-param name="BackupName">$FormDataInitialReturnInd</xsl:with-param>
											</xsl:call-template>
										</input>									
									</label>
									<span style="font-family:arial narrow;font-size:6.5pt;">Initial return</span>
									<span style="width:1mm;"/>
									<label>
										<xsl:call-template name="PopulateLabel">
											<xsl:with-param name="TargetNode" select="$FormData/FutureFilingNotRequiredInd"/>
											<xsl:with-param name="BackupName">$FormDataFutureFilingNotRequiredInd</xsl:with-param>
										</xsl:call-template>										 
										<input class="styCkbox" aria-label="FinalReturn" type="checkbox" style="width:3mm;">
											<xsl:call-template name="PopulateCheckbox">
												<xsl:with-param name="TargetNode" select="$FormData/FutureFilingNotRequiredInd"/>
												<xsl:with-param name="BackupName">$FormDataFutureFilingNotRequiredInd</xsl:with-param>
											</xsl:call-template>
										</input>									
									</label>
									<span style="font-family:arial narrow;font-size:6.5pt;">Final return</span>
										<xsl:call-template name="LinkToLeftoverDataTableInline">
											<xsl:with-param name="Desc">Future Filling Required Ind</xsl:with-param>
											<xsl:with-param name="TargetNode" select="$FormData/FutureFilingNotRequiredInd/@finalGrantorTrust1041ReturnCd"/>
										</xsl:call-template>
									<span style="width:1mm;"/>
									<xsl:call-template name="LinkToLeftoverDataTableInline">
											<xsl:with-param name="Desc">Fifty Two or Fifty Three Week Filer Indicator</xsl:with-param>
											<xsl:with-param name="TargetNode" select="$FormData/FiftyTwoFiftyThreeWeekFilerInd"/>
									</xsl:call-template>
									<span style="width:1mm;"/>	
									<label>									
										<xsl:call-template name="PopulateLabel">
											<xsl:with-param name="TargetNode" select="$FormData/AmendedReturnInd"/>
											<xsl:with-param name="BackupName">$FormDataAmendedReturnInd</xsl:with-param>
										</xsl:call-template>										 
										<input class="styCkbox" aria-label="AmendedReturn" type="checkbox" style="width:3mm;">
											<xsl:call-template name="PopulateCheckbox">
												<xsl:with-param name="TargetNode" select="$FormData/AmendedReturnInd"/>
												<xsl:with-param name="BackupName">$FormDataAmendedReturnInd</xsl:with-param>
											</xsl:call-template>
										</input>									
									</label>
									<span style="font-family:arial narrow;font-size:6.5pt;">Amended return</span>
										<xsl:call-template name="SetFormLinkInline">
											<xsl:with-param name="TargetNode" select="$FormData/AmendedReturnInd"/>
										</xsl:call-template>
										<span style="width:1mm;"/>
									<label>
										<xsl:call-template name="PopulateLabel">
											<xsl:with-param name="TargetNode" select="$FormData/SupersededReturnInd"/>
											<xsl:with-param name="BackupName">$FormDataSupersededReturnInd</xsl:with-param>
										</xsl:call-template>										 
										<input class="styCkbox" aria-label="SupersededReturn" type="checkbox" style="width:3mm;">
											<xsl:call-template name="PopulateCheckbox">
												<xsl:with-param name="TargetNode" select="$FormData/SupersededReturnInd"/>
												<xsl:with-param name="BackupName">$FormDataSupersededReturnInd</xsl:with-param>
											</xsl:call-template>
										</input>									
									</label>
									<span style="font-family:arial narrow;font-size:6.5pt;">Superseded Return</span>
									<xsl:call-template name="SetFormLinkInline">
										<xsl:with-param name="TargetNode" select="$FormData/SupersededReturnInd"/>
									</xsl:call-template>
									<span style="width:4mm;"/>
									<label>
										<xsl:call-template name="PopulateLabel">
											<xsl:with-param name="TargetNode" select="$FormData/NetOperatingLossCarrybackInd"/>
											<xsl:with-param name="BackupName">$FormDataNetOperatingLossCarrybackInd</xsl:with-param>
										</xsl:call-template>										 
										<input class="styCkbox" aria-label="NetOperatingLossCarryback" type="checkbox" style="width:3mm;">
											<xsl:call-template name="PopulateCheckbox">
												<xsl:with-param name="TargetNode" select="$FormData/NetOperatingLossCarrybackInd"/>
												<xsl:with-param name="BackupName">$FormDataNetOperatingLossCarrybackInd</xsl:with-param>
											</xsl:call-template>
										</input>									
									</label>
									<span style="font-family:arial narrow;font-size:6.5pt;">Net operating loss carryback</span><br/>									
								</span>
								<!-- Span 2 for bottom 4 checkboxes -->
								<span style="float:left;padding-left:.5mm;padding-top:0mm;">
									<label>
										<xsl:call-template name="PopulateLabel">
											<xsl:with-param name="TargetNode" select="$FormData/TrustNameChangeInd"/>
											<xsl:with-param name="BackupName">$FormDataTrustNameChangeInd</xsl:with-param>
										</xsl:call-template>										 
										<input class="styCkbox" aria-label="ChangeInTrustName" type="checkbox" style="width:3mm;">
											<xsl:call-template name="PopulateCheckbox">
												<xsl:with-param name="TargetNode" select="$FormData/TrustNameChangeInd"/>
												<xsl:with-param name="BackupName">$FormDataTrustNameChangeInd</xsl:with-param>
											</xsl:call-template>
										</input>
									</label>
									<span style="font-family:arial narrow;font-size:6.5pt;">Change in trust's name</span>
									<span style="width:7mm;"/>
									<label>
										<xsl:call-template name="PopulateLabel">
											<xsl:with-param name="TargetNode" select="$FormData/FiduciaryChangeInd"/>
											<xsl:with-param name="BackupName">$FormDataFiduciaryChangeInd</xsl:with-param>
										</xsl:call-template>										 
										<input class="styCkbox" aria-label="ChangeInFiduciary" type="checkbox" style="width:3mm;">
											<xsl:call-template name="PopulateCheckbox">
												<xsl:with-param name="TargetNode" select="$FormData/FiduciaryChangeInd"/>
												<xsl:with-param name="BackupName">$FormDataFiduciaryChangeInd</xsl:with-param>
											</xsl:call-template>
										</input>									
									</label>
									<span style="font-family:arial narrow;font-size:6.5pt;">Change in fiduciary</span>
									<span style="width:2mm;"/>
									<label>
										<xsl:call-template name="PopulateLabel">
											<xsl:with-param name="TargetNode" select="$FormData/FiduciaryNameChangeInd"/>
											<xsl:with-param name="BackupName">$FormDataFiduciaryNameChangeInd</xsl:with-param>
										</xsl:call-template>										 
										<input class="styCkbox" aria-label="ChangeInFiduciaryName" type="checkbox" style="width:3mm;">
											<xsl:call-template name="PopulateCheckbox">
												<xsl:with-param name="TargetNode" select="$FormData/FiduciaryNameChangeInd"/>
												<xsl:with-param name="BackupName">$FormDataFiduciaryNameChangeInd</xsl:with-param>
											</xsl:call-template>
										</input>									
									</label>
									<span style="font-family:arial narrow;font-size:6.5pt;">Change in fiduciary's name</span>
									<span style="width:1mm;"/>
									<label>
										<xsl:call-template name="PopulateLabel">
											<xsl:with-param name="TargetNode" select="$FormData/FiduciaryAddressChangeInd"/>
											<xsl:with-param name="BackupName">$FormDataFiduciaryAddressChangeInd</xsl:with-param>
										</xsl:call-template>										 
										<input class="styCkbox" aria-label="ChangeInFiduciaryAddress" type="checkbox" style="width:3mm;">
											<xsl:call-template name="PopulateCheckbox">
												<xsl:with-param name="TargetNode" select="$FormData/FiduciaryAddressChangeInd"/>
												<xsl:with-param name="BackupName">$FormDataFiduciaryAddressChangeInd</xsl:with-param>
											</xsl:call-template>
										</input>									
									</label>
									<span style="font-family:arial narrow;font-size:6.5pt;">Change in fiduciary's address</span><br />									
								</span>
							</div>					
						</div>
					</div>
					<div style="width:187mm;height:auto;float:left;border-bottom:1px solid black;">
						<b>G(1)</b><span style="width:2mm;" />Check here if the estate or filing trust made a section 645 election
						<xsl:call-template name="SetFormLinkInline">
							<xsl:with-param name="TargetNode" select="$FormData/Section645ElectionInd"/>
						</xsl:call-template>
						<span class="styBoldText" style="padding-right:10px;">
							<xsl:call-template name="DotLoop">						
								<xsl:with-param name="DotQty" select="4"/>
							</xsl:call-template>	  
						</span>
						<span style="width:1mm;"/>
						<label>
							<xsl:call-template name="PopulateLabel">
								<xsl:with-param name="TargetNode" select="$FormData/Section645ElectionInd"/>
								<xsl:with-param name="BackupName">$FormDataSection645ElectionInd</xsl:with-param>
							</xsl:call-template>										 
							<input class="styCkbox" aria-label="Section645Election" type="checkbox" style="width:4mm;">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$FormData/Section645ElectionInd"/>
									<xsl:with-param name="BackupName">$FormDataSection645ElectionInd</xsl:with-param>
								</xsl:call-template>
							</input>									
						</label>
						<span style="width:2mm;"/><b>G(2)</b> Trust TIN
						<span style="width:2mm;"/>
						<span style="width:2mm;"/>
						<xsl:if test="(count($FormData/TrustEIN) &gt; 1)">
							<xsl:call-template name="LinkToLeftoverDataTableInline">
								<xsl:with-param name="Desc">Trust TIN</xsl:with-param>
								<xsl:with-param name="TargetNode" select="$FormData/TrustEIN" />
							</xsl:call-template>
						</xsl:if>
						<xsl:if test="(count($FormData/TrustEIN) = 1)">
							<xsl:call-template name="PopulateEIN">
								<xsl:with-param name="TargetNode" select="$FormData/TrustEIN"/>
							</xsl:call-template>
						</xsl:if>
					</div>
					<!--INCOME-->
					<div style="width:187mm;border-bottom:1px solid black;">
						<div style="width:4.8mm;padding-top:10mm;float:left;">
							<img src="{$ImagePath}/1041_Income.png" alt="Income image" width="18.8"/>
						</div>
						<div style="width:181.8mm;float:left;border-left:1px solid black;">
							<!--Line 1-->
							<div style="width:181.8mm;font-size:7pt;float:left;">
								<div class="styLNLeftNumBoxSD" style="height:3.5mm;">1</div>
								<div class="styLNDesc" style="width:134.3mm;height:3.5mm;">
									<span style="float:left;">Interest income</span>
									<span class="styBoldText" style="float:right;padding-right:10px;">
										<xsl:call-template name="DotLoop">						
											<xsl:with-param name="DotQty" select="24"/>
										</xsl:call-template>	  
									</span>
								</div>
								<div class="styLNRightNumBox" style="height:3.5mm;width:8mm;">1</div>
								<div class="styLNAmountBox" style="border-bottom-width:1px;height:3.5mm;width:31.5mm; ">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/TaxableInterestAmt" />
									</xsl:call-template>     
								</div>
							</div>
							<!--Line 2a-->
							<div style="width:181.8mm;font-size:7pt;float:left;">
								<div class="styLNLeftNumBoxSD" style="height:4mm;">2a</div>
								<div class="styLNDesc" style="width:134.3mm;height:4mm;">
									<span style="float:left;">Total ordinary dividends</span>
									<span class="styBoldText" style="float:right;padding-right:10px;">
										<xsl:call-template name="DotLoop">						
											<xsl:with-param name="DotQty" select="22"/>
										</xsl:call-template>			  
									</span>
								</div>
								<div class="styLNRightNumBox" style="height:4mm;width:8mm;">2a</div>
								<div class="styLNAmountBox" style="border-bottom-width:1px;height:4mm;width:31.5mm; ">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/OrdinaryDividendsAmt" />
									</xsl:call-template>     
								</div>
							</div>
							<!--Line 2b-->
							<div style="width:181.8mm;font-size:7pt;float:left;">
								<div class="styLNLeftNumBoxSD" style="height:3.5mm;padding-left:4mm;">b</div>
								<div class="styLNDesc" style="width:134.3mm;height:3.5mm;">
									<span style="float:left;">Qualified dividends allocable to:</span>
									<span style="float:left;font-size:7pt;padding-left:1mm;padding-right:1mm;">
										<b>(1) </b>Beneficiaries</span>
									<span style="border-bottom:1px dashed;float:left;height:3mm;width:23mm;font-size:6pt;text-align:right;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/QlfyDividendBeneficiariesAmt" />
										</xsl:call-template>     
									</span>
									<span style="float:left;font-size:7pt;padding-left:1mm;padding-right:1mm;">
										<b>(2) </b>Estate or trust</span>
									<span style="float:left;border-bottom:1px dashed;height:3mm;width:23mm;font-size:6pt;text-align:right;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/QlfyDividendsEstateTrustAmt" />
										</xsl:call-template>     
									</span>
								</div>
								<div class="styLNRightNumBox" style="height:3.5mm;width:8mm;border-bottom-width:0px;background-color:lightgray;"></div>
								<div class="styLNAmountBox" style="height:3.5mm;width:31.5mm;border-bottom-width:0px; " />
							</div>
							<!--Line 3-->
							<div style="width:181.8mm;font-size:7pt;float:left;">
								<div class="styLNLeftNumBoxSD" style="height:3.5mm;">3</div>
								<div class="styLNDesc" style="width:134.3mm;height:3.5mm;">
									<span style="float:left;">Business income or (loss). Attach Schedule C (Form 1040)
										<xsl:call-template name="SetFormLinkInline">
											<xsl:with-param name="TargetNode" select="$FormData/NetProfitOrLossAmt"/>
										</xsl:call-template>
									</span>
									<span class="styBoldText" style="float:right;padding-right:10px;">
										<xsl:call-template name="DotLoop">						
											<xsl:with-param name="DotQty" select="11"/>
										</xsl:call-template>		  
									</span>
								</div>
								<div class="styLNRightNumBox" style="height:3.5mm;width:8mm;">3</div>
								<div class="styLNAmountBox" style="border-bottom-width:1px;height:3.5mm;width:31.5mm; ">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/NetProfitOrLossAmt" />
									</xsl:call-template>     
								</div>
							</div>
							<!--Line 4-->
							<div style="width:181.8mm;font-size:7pt;float:left;">
								<div class="styLNLeftNumBoxSD" style="height:4mm;">4</div>
								<div class="styLNDesc" style="width:134.3mm;height:4mm;">
									<span style="float:left;">Capital gain or (loss). Attach Schedule D (Form 1041)
										<xsl:call-template name="SetFormLinkInline">
											<xsl:with-param name="TargetNode" select="$FormData/CapitalGainLossAmt"/>
										</xsl:call-template>
									</span>
									<span class="styBoldText" style="float:right;padding-right:10px;">
										<xsl:call-template name="DotLoop">						
											<xsl:with-param name="DotQty" select="12"/>
										</xsl:call-template>			  
									</span>
								</div>
								<div class="styLNRightNumBox" style="height:4mm;width:8mm;">4</div>
								<div class="styLNAmountBox" style="border-bottom-width:1px;height:4mm;width:31.5mm; ">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/CapitalGainLossAmt" />
									</xsl:call-template>     
								</div>
							</div>
							<!--Line 5-->
							<div style="width:181.8mm;font-size:7pt;float:left;">
								<div class="styLNLeftNumBoxSD" style="height:4mm;">5</div>
								<div class="styLNDesc" style="width:134.3mm;height:4mm;">
									<span style="float:left;">Rents, royalties, partnerships, other estates and trusts, etc. Attach Schedule E (Form 1040)
										<xsl:call-template name="SetFormLinkInline">
											<xsl:with-param name="TargetNode" select="$FormData/NetRentalIncomeOrLossAmt"/>
										</xsl:call-template>
									</span>
									<span class="styBoldText" style="float:right;padding-right:10px;">
										<xsl:call-template name="DotLoop">						
											<xsl:with-param name="DotQty" select="2"/>
										</xsl:call-template>				  		  
									</span>
								</div>
								<div class="styLNRightNumBox" style="height:4mm;width:8mm;">5</div>
								<div class="styLNAmountBox" style="border-bottom-width:1px;height:4mm;width:31.5mm; ">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/NetRentalIncomeOrLossAmt" />
									</xsl:call-template>     
								</div>
							</div>
							<!--Line 6-->
							<div style="width:181.8mm;font-size:7pt;float:left;">
								<div class="styLNLeftNumBoxSD" style="height:4mm;">6</div>
								<div class="styLNDesc" style="width:134.3mm;height:4mm;">
									<span style="float:left;">Farm income or (loss). Attach Schedule F (Form 1040)
										<xsl:call-template name="SetFormLinkInline">
											<xsl:with-param name="TargetNode" select="$FormData/NetFarmProfitLossAmt"/>
										</xsl:call-template>
									</span>
									<span class="styBoldText" style="float:right;padding-right:10px;">
										<xsl:call-template name="DotLoop">						
											<xsl:with-param name="DotQty" select="12"/>
										</xsl:call-template>			  
									</span>
								</div>
								<div class="styLNRightNumBox" style="height:4mm;width:8mm;">6</div>
								<div class="styLNAmountBox" style="border-bottom-width:1px;height:4mm;width:31.5mm; ">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/NetFarmProfitLossAmt" />
									</xsl:call-template>     
								</div>
							</div>
							<!--Line 7-->
							<div style="width:181.8mm;font-size:7pt;float:left;">
								<div class="styLNLeftNumBoxSD" style="height:4mm;">7</div>
								<div class="styLNDesc" style="width:134.3mm;height:4mm;">
									<span style="float:left;">Ordinary gain or (loss). Attach Form 4797
										<xsl:call-template name="SetFormLinkInline">
											<xsl:with-param name="TargetNode" select="$FormData/TotalOrdinaryGainLossAmt"/>
										</xsl:call-template>
										<xsl:call-template name="LinkToLeftoverDataTableInline">
											<xsl:with-param name="Desc">Line 7 - Form 4684 Code</xsl:with-param>
											<xsl:with-param name="TargetNode" select="$FormData/TotalOrdinaryGainLossAmt/@form4684Cd"/>
										</xsl:call-template>
									</span>
									<span class="styBoldText" style="float:right;padding-right:10px;">
										<xsl:call-template name="DotLoop">						
											<xsl:with-param name="DotQty" select="15"/>
										</xsl:call-template>		  
									</span>
								</div>
								<div class="styLNRightNumBox" style="height:4mm;width:8mm;">7</div>
								<div class="styLNAmountBox" style="border-bottom-width:1px;height:4mm;width:31.5mm; ">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/TotalOrdinaryGainLossAmt" />
									</xsl:call-template>     
								</div>
							</div>
							<!-- 4/20/2016 AM: inserted choice for Line 8. Displays if it is blank, equal to 1, and greater than 1 -->
							<!--Line 8-->
							<div style="width:181.8mm;font-size:7pt;float:left;">
								<div class="styLNLeftNumBoxSD" style="height:4mm;">8</div>
								<div class="styLNDesc" style="width:46mm;height:4mm;">
									<span style="float:left;padding-right:1mm;">Other income. List type and amount</span>
								</div>	
								<xsl:choose>
									<xsl:when test="count($FormData/OtherIncomeDescAndAmt) = 1">
                                        <xsl:if test="string-length(concat($FormData/OtherIncomeDescAndAmt/Desc, ' ' , $FormData/OtherIncomeDescAndAmt/Amt)) &gt;= 67">
 									    <span style="border-bottom:1px dashed;float:left;height:8mm;width:84mm;">
 									    <span style="width:2mm"/>
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="$FormData/OtherIncomeDescAndAmt/Desc"/>
												<xsl:with-param name="BackupName">IRS1041OtherIncomeDescAndAmt</xsl:with-param>
											</xsl:call-template>
											<span style="width:2mm"/>
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$FormData/OtherIncomeDescAndAmt/Amt"/>
												<xsl:with-param name="BackupName">IRS1041OtherIncomeDescAndAmt</xsl:with-param>
											</xsl:call-template>
										</span>
										<span style="float:right">
											<div class="styLNRightNumBox" style="height:8mm;width:8mm;padding-top:4mm;">8</div>
											<div class="styLNAmountBox" style="border-bottom-width:1px;padding-top:4mm;height:8mm;width:31.5mm;">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="$FormData/TotalOtherIncomeAmt" />
												</xsl:call-template>     
											</div>
										</span>
										</xsl:if>
										 <xsl:if test="string-length(concat($FormData/OtherIncomeDescAndAmt/Desc, ' ' , $FormData/OtherIncomeDescAndAmt/Amt)) &lt;67">
										<span style="border-bottom:1px dashed;float:left;height:4mm;width:85mm;">
										<span style="width:2mm"/>
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="$FormData/OtherIncomeDescAndAmt/Desc"/>
												<xsl:with-param name="BackupName">IRS1041OtherIncomeDescAndAmt</xsl:with-param>
											</xsl:call-template>
											<span style="width:2mm"/>
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$FormData/OtherIncomeDescAndAmt/Amt"/>
												<xsl:with-param name="BackupName">IRS1041OtherIncomeDescAndAmt</xsl:with-param>
											</xsl:call-template>
										</span>
										<span style="float:right">
											<div class="styLNRightNumBox" style="height:4mm;width:8mm;">8</div>
											<div class="styLNAmountBox" style="border-bottom-width:1px;height:4mm;width:31.5mm;">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="$FormData/TotalOtherIncomeAmt" />
												</xsl:call-template>     
											</div>
										</span>
										</xsl:if>										
									</xsl:when>
									<xsl:when test="count($FormData/OtherIncomeDescAndAmt) &gt; 1">
										<span style="border-bottom:1px dashed;float:left;height:4mm;width:85mm;">
											<xsl:call-template name="LinkToLeftoverDataTableInline">
												<xsl:with-param name="Desc">Line 8 - Other Income</xsl:with-param>
												<xsl:with-param name="TargetNode" select="$FormData/OtherIncomeDescAndAmt"/>
											</xsl:call-template>
										</span>
										<span style="float:right">
											<div class="styLNRightNumBox" style="height:4mm;width:8mm;">8</div>
											<div class="styLNAmountBox" style="border-bottom-width:1px;height:4mm;width:31.5mm; ">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="$FormData/TotalOtherIncomeAmt" />
												</xsl:call-template>     
											</div>
										</span>
									</xsl:when>
									<xsl:otherwise>
										<span style="border-bottom:1px dashed;float:left;height:4mm;width:85mm;"/>
										<span style="float:right">
											<div class="styLNRightNumBox" style="height:4mm;width:8mm;">8</div>
											<div class="styLNAmountBox" style="border-bottom-width:1px;height:4mm;width:31.5mm; ">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="$FormData/TotalOtherIncomeAmt" />
												</xsl:call-template>
											</div>
										</span>	
									</xsl:otherwise>
								</xsl:choose>
							</div>
							<!--Line 9-->
							<div style="width:181.8mm;font-size:7pt;float:left;">
								<div class="styLNLeftNumBoxSD" style="height:4mm;">9</div>
								<div class="styLNDesc" style="width:134.3mm;height:4mm;">
									<span style="float:left;">
										<b>Total income.</b> Combine lines 1, 2a, and 3 through 8</span>
									<span class="styBoldText" style="float:right;">
										<xsl:call-template name="DotLoop">						
											<xsl:with-param name="DotQty" select="14"/>
										</xsl:call-template>
										<span style="width:5px;" />		  
									</span>
								</div>
								<div class="styLNRightNumBox" style="height:4mm;width:8mm;border-bottom-width:0px;">9</div>
								<div class="styLNAmountBox" style="border-bottom-width:0px;height:4mm;width:31.5mm; ">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/TotalIncomeAmt" />
									</xsl:call-template>     
								</div>
							</div>
						</div>
					</div>
					<!--DEDUCTIONS-->
					<div style="width:187mm;border-bottom:1px solid black;">			
						<div style="width:4.8mm;padding-top:10mm;float:left;">
							<img src="{$ImagePath}/1041_Deductions.png" alt="Deductions image" width="18.8"/>
						</div>
						<div style="width:181.8mm;float:left;border-left:1px solid black;">
							<!--Line 10-->
							<div style="width:181.8mm;float:left;">
								<div class="styLNLeftNumBox">10</div>
								<div class="styLNDesc" style="width:134.3mm;">
									<span style="float:left;">Interest. Check if Form 4952 is attached</span>
									<span style="float:left;">
										<span style="float:left;padding-left:1mm;padding-right:1mm;"></span>
										<label>
											<xsl:call-template name="PopulateLabel">
												<xsl:with-param name="TargetNode" select="$FormData/Form4952Ind"/>
												<xsl:with-param name="BackupName">$FormDataForm4952Ind</xsl:with-param>
											</xsl:call-template>										 
											<input class="styCkbox" aria-label="Form4952" type="checkbox" style="width:4mm;">
												<xsl:call-template name="PopulateCheckbox">
													<xsl:with-param name="TargetNode" select="$FormData/Form4952Ind"/>
													<xsl:with-param name="BackupName">$FormDataForm4952Ind</xsl:with-param>
												</xsl:call-template>
											</input>									
										</label>
										<xsl:call-template name="SetFormLinkInline">
											<xsl:with-param name="TargetNode" select="$FormData/Form4952Ind"/>
										</xsl:call-template>
									</span>
									<span class="styBoldText" style="float:right;padding-right:10px;">
										<xsl:call-template name="DotLoop">						
											<xsl:with-param name="DotQty" select="15"/>
										</xsl:call-template>			  
									</span>
								</div>
								<div class="styLNRightNumBox" style="height:4mm;width:8mm;">10</div>
								<div class="styLNAmountBox" style="border-bottom-width:1px;height:4mm;width:31.5mm; ">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/InterestAmt" />
									</xsl:call-template>     
								</div>
							</div>
							<!--Line 11-->
							<div style="width:181.8mm;font-size:7pt;float:left;">
								<div class="styLNLeftNumBox" style="height:3.5mm;">11</div>
								<div class="styLNDesc" style="width:134.3mm;height:3.5mm;">
									<span style="float:left;">Taxes</span>
									<span class="styBoldText" style="float:right;padding-right:10px;">
										<xsl:call-template name="DotLoop">						
											<xsl:with-param name="DotQty" select="26"/>
										</xsl:call-template>			  
									</span>
								</div>
								<div class="styLNRightNumBox" style="height:3.5mm;width:8mm;">11</div>
								<div class="styLNAmountBox" style="border-bottom-width:1px;height:3.5mm;width:31.5mm; ">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/TaxesAmt" />
									</xsl:call-template>     
								</div>
							</div>
							<!--Line 12-->
							<div style="width:181.8mm;font-size:7pt;float:left;">
								<div class="styLNLeftNumBox" style="height:3.5mm;">12</div>
								<div class="styLNDesc" style="width:134.3mm;height:3.5mm;">
									<span style="float:left;">Fiduciary fees. If only a portion is deductible under section 67(e), see instructions</span>
									<span class="styBoldText" style="float:right;padding-right:10px;">
										<xsl:call-template name="DotLoop">						
											<xsl:with-param name="DotQty" select="6"/>
										</xsl:call-template>		  
									</span>
								</div>
								<div class="styLNRightNumBox" style="height:3.5mm;width:8mm;">12</div>
								<div class="styLNAmountBox" style="border-bottom-width:1px;height:3.5mm;width:31.5mm; ">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/FiduciaryFeesAmt" />
									</xsl:call-template>     
								</div>
							</div>
							<!--Line 13-->
							<div style="width:181.8mm;font-size:7pt;float:left;">
								<div class="styLNLeftNumBox" style="height:3.5mm;">13</div>
								<div class="styLNDesc" style="width:134.3mm;height:3.5mm;">
									<span style="float:left;">Charitable deduction (from Schedule A, line 7)</span>
									<span class="styBoldText" style="float:right;padding-right:10px;">
										<xsl:call-template name="DotLoop">						
											<xsl:with-param name="DotQty" select="15"/>
										</xsl:call-template>			  
									</span>
								</div>
								<div class="styLNRightNumBox" style="height:3.5mm;width:8mm;">13</div>
								<div class="styLNAmountBox" style="border-bottom-width:1px;height:3.5mm;width:31.5mm; ">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/CharitableDeductionsAmt" />
									</xsl:call-template>     
								</div>
							</div>
							<!--Line 14-->
							<div style="width:181.8mm;font-size:6.5pt;float:left;">
								<div class="styLNLeftNumBox" style="height:3.5mm;">14</div>
								<div class="styLNDesc" style="width:134.3mm;height:3.5mm;">
									<span style="float:left;">Attorney, accountant, and return preparer fees. If only a portion is deductible under section 67(e), see instructions </span>
									<span class="styBoldText" style="float:right;padding-right:10px;">
										<xsl:call-template name="DotLoop">						
											<xsl:with-param name="DotQty" select="0"/>
										</xsl:call-template>			  
									</span>
								</div>
								<div class="styLNRightNumBox" style="height:3.5mm;width:8mm;">14</div>
								<div class="styLNAmountBox" style="border-bottom-width:1px;height:3.5mm;width:31.5mm; ">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/TaxPreparationFeesAmt" />
									</xsl:call-template>     
								</div>
							</div>
							<!--Line 15a-->
							<div style="width:181.8mm;font-size:7pt;float:left;">
								<div class="styLNLeftNumBox" style="height:mm;">15a</div>
								<div class="styLNDesc" style="width:134.3mm;height:4mm;">
									<span style="float:left;">Other deductions (attach schedule). See instructions for deductions allowable under section 67(e)
										<xsl:call-template name="SetFormLinkInline">
											<xsl:with-param name="TargetNode" select="$FormData/OtherDeductionsAmt"/>
										</xsl:call-template>
									</span>
									<span class="styBoldText" style="float:right;padding-right:10px;">
										<xsl:call-template name="DotLoop">						
											<xsl:with-param name="DotQty" select="1"/>
										</xsl:call-template>			  
									</span>
								</div>
								<div class="styLNRightNumBox" style="height:4mm;width:8mm;">15a</div>
								<div class="styLNAmountBox" style="border-bottom-width:1px;height:4mm;width:31.5mm; ">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/OtherDeductionsAmt" />
									</xsl:call-template>     
								</div>
							</div>		  
							<!--Line 15b-->
							<div style="width:181.8mm;font-size:7pt;float:left;">
								<div class="styLNLeftNumBox" style="height:4mm;padding-left:4.2mm;">b</div>
								<div class="styLNDesc" style="width:134.3mm;height:4mm;">
									<span style="float:left;">Net operating loss deduction. See instructions
									<xsl:call-template name="SetFormLinkInline">
											<xsl:with-param name="TargetNode" select="$FormData/NetOperatingLossDeductionAmt"/>
										</xsl:call-template>
									</span>
									<span class="styBoldText" style="float:right;padding-right:10px;">
										<xsl:call-template name="DotLoop">						
											<xsl:with-param name="DotQty" select="15"/>
										</xsl:call-template>			  
									</span>
								</div>
								<div class="styLNRightNumBox" style="height:4mm;width:8mm;">15b</div>
								<div class="styLNAmountBox" style="border-bottom-width:1px;height:4mm;width:31.5mm; ">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/NetOperatingLossDeductionAmt" />
									</xsl:call-template>     
								</div>
							</div>
							<!--Line 16-->
							<div style="width:181.8mm;font-size:7pt;float:left;">
								<div class="styLNLeftNumBox" style="height:4mm;">16</div>
								<div class="styLNDesc" style="width:134.3mm;height:4mm;">
									<span style="float:left;">Add lines 10 through 15b</span>
									<span class="styBoldText" style="float:right;">
										<xsl:call-template name="DotLoop">						
											<xsl:with-param name="DotQty" select="21"/>
										</xsl:call-template>
										<span style="width:5px;" />			  
									</span>
								</div>
								<div class="styLNRightNumBox" style="height:4mm;width:8mm;">16</div>
								<div class="styLNAmountBox" style="border-bottom-width:1px;height:4mm;width:31.5mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/NetDeductionsAmt" />
									</xsl:call-template>     
								</div>
							</div>
							<!--Line 17-->
							<div style="width:181.8mm;font-size:7pt;float:left;">
								<div class="styLNLeftNumBox" style="height:4mm;">17</div>
								<div class="styLNDesc" style="width:94.9mm;height:4mm;">
									<span style="float:left;">Adjusted total income or (loss). Subtract line 16 from line 9</span>
									<span class="styBoldText" style="float:right;padding-right:10px;">
										<xsl:call-template name="DotLoop">						
											<xsl:with-param name="DotQty" select="3"/>
										</xsl:call-template>		  
									</span>
								</div>
								<div class="styLNRightNumBox" style="height:4mm;width:8mm;">17</div>
								<div class="styLNAmountBox" style="border-bottom-width:1px;height:4mm;width:31.4mm;padding-right:1mm" >
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/AdjustedTotalIncomeAmt" />
									</xsl:call-template>			  
								</div>  
								<div class="styLNRightNumBox" style="height:4mm;width:8mm;background-color:lightgray;"></div>
								<div class="styLNAmountBox" style="border-bottom-width:1px;height:4mm;width:31.5mm;background-color:lightgray;" />
							</div>
							<!--Line 18-->
							<div style="width:181.8mm;font-size:7pt;float:left;">
								<div class="styLNLeftNumBox" style="height:4mm;">18</div>
								<div class="styLNDesc" style="width:134.3mm;height:4mm;">
									<span style="float:left;">Income distribution deduction (from Schedule B, line 15). Attach Schedules K-1 (Form 1041)</span>
									<xsl:call-template name="LinkToLeftoverDataTableInline">
											<xsl:with-param name="Desc">Line 18 Income Distribution Deduction Amt gravesites Num</xsl:with-param>
											<xsl:with-param name="TargetNode" select="$FormData/IncomeDistributionDeductionAmt/@gravesitesNum"/>
										</xsl:call-template>
									<span class="styBoldText" style="float:right;padding-right:10px;">
										<xsl:call-template name="DotLoop">						
											<xsl:with-param name="DotQty" select="2"/>
										</xsl:call-template>			  
									</span>
								</div>
								<div class="styLNRightNumBox" style="height:4mm;width:8mm;">18</div>
								<div class="styLNAmountBox" style="border-bottom-width:1px;height:4mm;width:31.5mm; ">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/IncomeDistributionDeductionAmt" />
									</xsl:call-template>     
								</div>
							</div>
							<!--Line 19-->
							<div style="width:181.8mm;font-size:7pt;float:left;">
								<div class="styLNLeftNumBox" style="height:4mm;">19</div>
								<div class="styLNDesc" style="width:134.3mm;height:4mm;">
									<span style="float:left;">Estate tax deduction including certain generation-skipping taxes (attach computation)
										<xsl:call-template name="SetFormLinkInline">
											<xsl:with-param name="TargetNode" select="$FormData/EstateTaxDeductionAmt"/>
										</xsl:call-template>
									</span>
									<span class="styBoldText" style="float:right;padding-right:10px;">
										<xsl:call-template name="DotLoop">						
											<xsl:with-param name="DotQty" select="3"/>
										</xsl:call-template>			  
									</span>
								</div>
								<div class="styLNRightNumBox" style="height:4mm;width:8mm;">19</div>
								<div class="styLNAmountBox" style="border-bottom-width:1px;height:4mm;width:31.5mm; ">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/EstateTaxDeductionAmt" />
									</xsl:call-template>     
								</div>
							</div>
							<!--Line 20-->
							<div style="width:181.8mm;font-size:7pt;float:left;">
								<div class="styLNLeftNumBox" style="height:4mm;">20</div>
								<div class="styLNDesc" style="width:134.3mm;height:4mm;">
									<span style="float:left;">Qualified business income deduction. Attach Form 8995 or 8995-A 
									<xsl:call-template name="SetFormLinkInline">
                                    <xsl:with-param name="TargetNode" select="$FormData/QualifiedBusinessIncomeDedAmt"/>                                     </xsl:call-template>
                                    </span>
									<span class="styBoldText" style="float:right;padding-right:10px;">
										<xsl:call-template name="DotLoop">						
											<xsl:with-param name="DotQty" select="9"/>
										</xsl:call-template>			  
									</span>
								</div>
								<div class="styLNRightNumBox" style="height:4mm;width:8mm;">20</div>
								<div class="styLNAmountBox" style="border-bottom-width:1px;height:4mm;width:31.5mm; ">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/QualifiedBusinessIncomeDedAmt" />
									</xsl:call-template>     
								</div>
							</div>
							<!--Line 21-->
							<div style="width:181.8mm;font-size:7pt;float:left;">
								<div class="styLNLeftNumBox" style="height:3.5mm;">21</div>
								<div class="styLNDesc" style="width:134.3mm;height:3.5mm;">
									<span style="float:left;">Exemption</span>
									<span class="styBoldText" style="float:right;padding-right:10px;">
										<xsl:call-template name="DotLoop">						
											<xsl:with-param name="DotQty" select="25"/>
										</xsl:call-template>			  
									</span>
								</div>
								<div class="styLNRightNumBox" style="height:3.5mm;width:8mm;">21</div>
								<div class="styLNAmountBox" style="border-bottom-width:1px;height:3.5mm;width:31.5mm; ">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/ExemptionAmt" />
									</xsl:call-template>     
								</div>
							</div>
							<!--Line 22-->
							<div style="width:181.8mm;font-size:7pt;float:left;">
								<div class="styLNLeftNumBox" style="height:3.5mm;">22</div>
								<div class="styLNDesc" style="width:134.3mm;height:3.5mm;">
									<span style="float:left;">Add lines 18 through 21</span>
									<span class="styBoldText" style="float:right;">
										<xsl:call-template name="DotLoop">						
											<xsl:with-param name="DotQty" select="21"/>
										</xsl:call-template>
										<span style="width:5px;" />
										<!--<img src="{$ImagePath}/1040_Bullet.gif" alt="Right pointing arrowhead image"/>-->				  
									</span>
								</div>
								<div class="styLNRightNumBox" style="height:3.5mm;width:8mm;border-bottom-width:0px;">22</div>
								<div class="styLNAmountBox" style="border-bottom-width:0px;height:3.5mm;width:31.5mm; ">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/TotalDeductionAmt" />
									</xsl:call-template>     
								</div>
							</div>
						</div>
					</div>
					<!--TAX AND PAYMENTS-->
					<div style="width:187mm;border-bottom:1px solid black;">			
						<div style="width:4.8mm;padding-top:3mm;float:left;">
							<img src="{$ImagePath}/1041_TaxAndPayments.png" alt="Tax and Payments image" width="18"/>
						</div>
						<div style="width:181.8mm;float:left;border-left:1px solid black;">
							<!--Line 23-->
							<div style="width:181.8mm;font-size:7pt;float:left;">
								<div class="styLNLeftNumBox" style="height:4mm;">23</div>
								<div class="styLNDesc" style="width:134.3mm;height:4mm;">
									<span style="float:left;">Taxable Income. Subtract line 22 from line 17. If a loss, see instructions
										<xsl:call-template name="LinkToLeftoverDataTableInline">
											<xsl:with-param name="Desc">Line 23 - Residual Interst In REMIC Code</xsl:with-param>
											<xsl:with-param name="TargetNode" select="$FormData/TaxableIncomeAmt/@residualInterestInREMICCd"/>
										</xsl:call-template>
									</span>
									<span class="styBoldText" style="float:right;padding-right:10px;">
										<xsl:call-template name="DotLoop">						
											<xsl:with-param name="DotQty" select="8"/>
										</xsl:call-template>			  
									</span>
								</div>
								<div class="styLNRightNumBox" style="height:4mm;width:8mm;">23</div>
								<div class="styLNAmountBox" style="border-bottom-width:1px;height:4mm;width:31.5mm; ">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/TaxableIncomeAmt" />
									</xsl:call-template>				
								</div>
							</div>
							<!--Line 24-->
							<div style="width:181.8mm;font-size:7pt;float:left;">
								<div class="styLNLeftNumBox" style="height:3.5mm;">24</div>
								<div class="styLNDesc" style="width:134.3mm;height:3.5mm;">
									<span style="float:left;"><b>Total tax</b> (from Schedule G, Part I, line 9)</span>
									<span class="styBoldText" style="float:right;padding-right:10px;">
										<xsl:call-template name="DotLoop">						
											<xsl:with-param name="DotQty" select="17"/>
										</xsl:call-template>			  
									</span>
								</div>
								<div class="styLNRightNumBox" style="height:3.5mm;width:8mm;">24</div>
								<div class="styLNAmountBox" style="border-bottom-width:1px;height:3.5mm;width:31.5mm; ">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/TotalTaxAmt" />
									</xsl:call-template>     
								</div>
							</div>
							<!--Line 25a-->
							<div style="width:181.8mm;font-size:7pt;float:left;">
								<div class="styLNLeftNumBox" style="height:3.5mm;">25a</div>
								<div class="styLNDesc" style="width:134.3mm;height:3.5mm;">
									<span style="float:left;">Current year net 965 tax liability paid from Form 965-A, Part II, column (k) (see instructions)</span>
									<span class="styBoldText" style="float:right;padding-right:10px;">
										<xsl:call-template name="DotLoop">						
											<xsl:with-param name="DotQty" select="3"/>
										</xsl:call-template>			  
									</span>
								</div>
								<div class="styLNRightNumBox" style="height:3.5mm;width:8mm;">25a</div>
								<div class="styLNAmountBox" style="border-bottom-width:1px;height:3.5mm;width:31.5mm; ">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/NetSection965TaxLiabPaidAmt" />
									</xsl:call-template>     
								</div>
							</div>
							<!--Line 25b-->
							<div style="width:181.8mm;font-size:7pt;float:left;">
								<div class="styLNLeftNumBox" style="height:3.5mm;padding-left:4.5mm;">b</div>
								<div class="styLNDesc" style="width:134.3mm;height:3.5mm;">
									<span style="float:left;">First installment of section 1062 applicable net tax liability. Enter amount from Form 1062, line 15</span>
									<span class="styBoldText" style="float:right;padding-right:10px;">
										<xsl:call-template name="DotLoop">						
											<xsl:with-param name="DotQty" select="2"/>
										</xsl:call-template>			  
									</span>
								</div>
								<div class="styLNRightNumBox" style="height:3.5mm;width:8mm;">25b</div>
								<div class="styLNAmountBox" style="border-bottom-width:1px;height:3.5mm;width:31.5mm; ">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/FirstInstallmentSect1062TaxAmt" />
									</xsl:call-template>     
								</div>
							</div>
							<!--Line 26-->
							<div style="width:181.8mm;font-size:7pt;float:left;">
								<div class="styLNLeftNumBox" style="height:3.5mm;">26</div>
								<div class="styLNDesc" style="width:134.3mm;height:3.5mm;">
									<span style="float:left;"><b>Total payments.</b> (from Schedule G, Part II, line 19)</span>
									<span class="styBoldText" style="float:right;padding-right:10px;">
										<xsl:call-template name="DotLoop">						
											<xsl:with-param name="DotQty" select="14"/>
										</xsl:call-template>		  
									</span>
								</div>
								<div class="styLNRightNumBox" style="height:3.5mm;width:8mm;">26</div>
								<div class="styLNAmountBox" style="border-bottom-width:1px;height:3.5mm;width:31.5mm; ">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/TotalPaymentsAmt" />
									</xsl:call-template>     
								</div>
							</div>
							<!--Line 27-->
							<div style="width:181.8mm;font-size:7pt;float:left;">
								<div class="styLNLeftNumBox" style="height:3.5mm;">27</div>
								<div class="styLNDesc" style="width:134.3mm;height:3.5mm;">
									<span style="float:left;">Estimated tax penalty. See instructions</span>
									<span class="styBoldText" style="float:right;padding-right:10px;">
										<xsl:call-template name="DotLoop">						
											<xsl:with-param name="DotQty" select="17"/>
										</xsl:call-template>			  
									</span>
							   </div>
								<div class="styLNRightNumBox" style="height:3.5mm;width:8mm;">27</div>
								<div class="styLNAmountBox" style="border-bottom-width:1px;height:3.5mm;width:31.5mm; ">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/EstimatedPenaltyAmt" />
									</xsl:call-template>     
								</div>
							</div>
							<!--Line 28-->
							<div style="width:181.8mm;font-size:7pt;float:left;">
								<div class="styLNLeftNumBox" style="height:3.5mm;">28</div>
								<div class="styLNDesc" style="width:134.3mm;height:3.5mm;">
									<span style="float:left;"><b>Tax due.</b> If line 26 is smaller than the total of lines 24, 25a, 25b, and 27, enter amount owed</span>
									<span class="styBoldText" style="float:right;padding-right:10px;">
										<xsl:call-template name="DotLoop">						
											<xsl:with-param name="DotQty" select="3"/>
										</xsl:call-template>			  
									</span>
								</div>
								<div class="styLNRightNumBox" style="height:3.5mm;width:8mm;">28</div>
								<div class="styLNAmountBox" style="border-bottom-width:1px;height:3.5mm;width:31.5mm; ">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/TaxDueAmt" />
									</xsl:call-template>     
								</div>
							</div>
							<!--Line 29-->
							<div style="width:181.8mm;font-size:7pt;float:left;">
								<div class="styLNLeftNumBox" style="height:3.5mm;">29</div>
								<div class="styLNDesc" style="width:134.3mm;height:3.5mm;">
									<span style="float:left;"><b>Overpayment.</b> If line 26 is larger than the total of lines 24, 25a, 25b, and 27, enter amount overpaid</span>
									<span class="styBoldText" style="float:right;padding-right:10px;">
										<xsl:call-template name="DotLoop">						
											<xsl:with-param name="DotQty" select="1"/>
										</xsl:call-template>			  
									</span>
								</div>
								<div class="styLNRightNumBox" style="height:3.5mm;width:8mm;">29</div>
								<div class="styLNAmountBox" style="border-bottom-width:1px;height:3.5mm;width:31.5mm; ">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/OverpaymentAmt" />
									</xsl:call-template>     
								</div>
							</div>
							<!--Line 30-->
							<div style="width:181.8mm;font-size:7pt;float:left;">
								<div class="styLNLeftNumBox" style="height:3.5mm;">30</div>
								<div class="styLNDesc" style="width:134.3mm;height:3.5mm;">
									<span style="float:left;">Amount on line 29 to be: <b> a Credited to 2026</b><span style="width:2px;" /></span>				
									<span style="float:left;height:3mm;width:29mm;text-align:right; ">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/AppliedToEsTaxAmt" />
										</xsl:call-template>     
									</span>
									<span style="float:left;padding-left:1mm;padding-right:1mm;font-weight:bold;">; b Refunded</span>
									<span class="styBoldText" style="float:right;">
										<xsl:call-template name="DotLoop">						
											<xsl:with-param name="DotQty" select="5"/>
										</xsl:call-template>	
										<span style="width:5px;" />				  
									</span>
								</div>
								<div class="styLNRightNumBox" style="height:3.5mm;width:8mm;border-bottom-width:1px;">30b</div>
								<div class="styLNAmountBox" style="border-bottom-width:1px;height:3.5mm;width:31.5mm; ">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/RefundAmt" />
									</xsl:call-template>     
								</div>
							</div>
							<div style="width:181.8mm;font-size:7pt;float:left;height:3.5mm;">
								<div class="styLNLeftNumBox" style="height:3.5mm;"></div>
								<div class="styLNDesc" style="width:134.3mm;height:3.5mm;">
									If completing line 30b, also complete lines 30c, 30d, and 30e.
								</div>
								<div class="styLNRightNumBox" style="height:3.5mm;width:8mm;background-color:lightgray;border-bottom-width:0px"></div>
								<div class="styLNAmountBox" style="height:3.5mm;width:31.5mm;background-color:lightgray;border-left-width:0px;border-bottom-width:0px"></div>
							</div>
							<!--Line 30c, 30d-->
							<div style="width:181.8mm;font-size:7pt;float:left;">
								<div class="styLNLeftNumBox" style="height:4.5mm;padding-left:4.5mm;">c</div>
								<div class="styLNDesc" style="width:134.3mm;height:4mm;">
									<span style="width:25mm;float:left;clear:none;padding-top:0mm">
									   Routing number
									</span>
									<span class="styLNCtrNumBox" style="width:34mm;border-top-width:1px;padding-top:0mm;padding-bottom:0mm;font-weight:normal">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$FormData/DirectDepositGrp/RoutingTransitNum"/>
										</xsl:call-template>
									</span>
									<span style="width:90px;"/>
									<span style="width:4px;"/>
									<span class="styBoldText">d</span> Type:
									<span style="width:4px;"/>
									<input type="checkbox" class="styCkboxNM" aria-label="Checking Account">
										<xsl:call-template name="PopulateCheckbox">
											<xsl:with-param name="TargetNode" select="$FormData/DirectDepositGrp/CheckingAccountInd"/>
											<xsl:with-param name="BackupName">IRS1041CheckingAccountInd</xsl:with-param>
										</xsl:call-template>
									</input>
									<label>
										<xsl:call-template name="PopulateLabel">
											<xsl:with-param name="TargetNode" select="$FormData/DirectDepositGrp/CheckingAccountInd"/>
											<xsl:with-param name="BackupName">IRS1041CheckingAccountInd</xsl:with-param>
										</xsl:call-template>
										Checking
									</label>
										<input type="checkbox" class="styCkboxNM" aria-label="Savings Account" style="margin-left:4mm;">
										<xsl:call-template name="PopulateCheckbox">
											<xsl:with-param name="TargetNode" select="$FormData/DirectDepositGrp/SavingsAccountInd"/>
											<xsl:with-param name="BackupName">IRS1041SavingsAccountInd</xsl:with-param>
										</xsl:call-template>
									</input>
									<label>
										<xsl:call-template name="PopulateLabel">
											<xsl:with-param name="TargetNode" select="$FormData/DirectDepositGrp/SavingsAccountInd"/>
											<xsl:with-param name="BackupName">IRS1041SavingsAccountInd</xsl:with-param>
										</xsl:call-template>
										Savings
									</label>
								</div>
								<div class="styLNRightNumBox" style="height:4.5mm;width:8mm;background-color:lightgray;border-bottom-width:0px"></div>
								<div class="styLNAmountBox" style="height:4.5mm;width:31.5mm;background-color:lightgray;border-left-width:0px;border-bottom-width:0px"></div>							
							</div>							
							<!-- Line 30e -->
							<div style="width:181.8mm;height:5mm;font-size:7pt;float:left;">
								<div class="styLNLeftNumBox" style="height:4.5mm;padding-left:4.5mm;">e</div>
								<div class="styLNDesc" style="width:134.3mm;height:4.5mm;">
									<span style="width:25mm;float:left;clear:none;padding-top:0mm">
									   Account number
									</span>
									<span class="styLNCtrNumBox" style="width:84mm;border-top-width:1px;padding-top:0mm;padding-bottom:0mm;font-weight:normal">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$FormData/DirectDepositGrp/DepositorAccountNum"/>
										</xsl:call-template>
									</span>
								</div>
								<div class="styLNRightNumBox" style="height:5mm;width:8mm;background-color:lightgray;border-bottom-width:0px"></div>
								<div class="styLNAmountBox" style="height:5mm;width:31.5mm;background-color:lightgray;border-left-width:0px;border-bottom-width:0px"></div>
							</div>
						</div>
					</div>
					<!-- signature -->
					<div class="styBB" style="width:187mm;height:14.5mm;padding-top:0mm;float:left;clear:both;page-break-inside:always;">
						<div style="width:15mm;height:100%;float:left;clear:none;">
							<div style="width:10mm;float:left;clear:none;padding-top:2mm;">
								<span class="styMainTitle" style="font-size:11pt;float:left;clear:none;">
									Sign
									Here
								</span> 
							</div>
							<div style="width:4mm;padding-top:9.7mm;padding-left:6px;padding-right:0px;float:left;clear:none;border-left:1px solid black;height:100%;">
							</div>
						</div>
							<div class="styLNDesc" style="width:172mm;font-size:6pt;float:left;clear:none;">
                  Under penalties of perjury, I declare that I have examined this return, including accompanying schedules and statements, and to the best of my knowledge and belief, it is true, correct, and complete. Declaration of preparer (other than taxpayer) is based on all information of which preparer has any knowledge.
                  <div>
					  <div style="float:left;">
							<div class="styBB" style="width:136mm;float:left;clear:none;font-size:6pt;">	
								<div class="styFNBox" style="height:5.5mm;width:71mm;padding-top:0.5mm;float:left;clear:none;"><br />
									<xsl:call-template name="PopulatePin">
										<xsl:with-param name="TargetNode" select="$RtnHdrData/PractitionerPINGrp/FiduciaryPIN"/>
										<xsl:with-param name="BackupName">$RtnHdrDataFiduciaryPIN</xsl:with-param>
									</xsl:call-template>
								</div>							
								<div class="styFNBox" style="height:5.5mm;width:18mm;padding-top:0.5mm;text-align:center;float:left;clear:none;"><br />
									<xsl:call-template name="PopulateMonthDayYear">
										<xsl:with-param name="TargetNode" select="$RtnHdrData/PractitionerPINGrp/FiduciarySignatureDt"/>
										<xsl:with-param name="BackupName">$RtnHdrDataFiduciarySignatureDt</xsl:with-param>
									</xsl:call-template>
								</div>							
								<div class="styFNBox" style="height:5.5mm;width:46mm;padding-top:0.5mm;padding-left:2mm;float:left;clear:none;border-right:0px;">
								<br />
									<xsl:call-template name="PopulateEIN">
										<xsl:with-param name="TargetNode" select="$RtnHdrData/PractitionerPINGrp/FiduciaryEIN"/>
										<xsl:with-param name="BackupName">RtnHdrDataFiduciaryEIN</xsl:with-param>
									</xsl:call-template>
								</div>						
							</div>
						<div style="width:34.6mm;height:9mm;border:2px solid black;float:right;padding-left:.7mm;padding-top:0mm;font-size:5pt;">
						May the IRS discuss this return with the preparer shown below? See Instructions. 
							<!-- Checkbox -->
								<input type="Checkbox" aria-label="DiscussWithPaidPreparerYes" class="styCkbox" style="width:3mm;margin:0mm;">
									<xsl:call-template name="PopulateYesCheckbox">
										<xsl:with-param name="TargetNode" select="$RtnHdrData/DiscussWithPaidPreparerInd"/>
										<xsl:with-param name="BackupName">IRS1041DiscussWithPaidPreparerInd</xsl:with-param>
									</xsl:call-template>
								</input>
								<label>
									<xsl:call-template name="PopulateLabelYes">
										<xsl:with-param name="TargetNode" select="$RtnHdrData/DiscussWithPaidPreparerInd"/>
										<xsl:with-param name="BackupName">IRS1041DiscussWithPaidPreparerInd</xsl:with-param>
									</xsl:call-template>
									<span class="styBoldText" style="padding-left:1mm;padding-right:1mm;">Yes</span> 							
								</label>							
								<!-- Checkbox -->
								<input type="Checkbox" aria-label="DiscussWithPaidPreparerNo" class="styCkbox" style="width:3mm;margin:0mm;">
									<xsl:call-template name="PopulateNoCheckbox">
										<xsl:with-param name="TargetNode" select="$RtnHdrData/DiscussWithPaidPreparerInd"/>
										<xsl:with-param name="BackupName">IRS1041DiscussWithPaidPreparerInd</xsl:with-param>
									</xsl:call-template>								
								</input>
								<label>
									<xsl:call-template name="PopulateLabelNo">
										<xsl:with-param name="TargetNode" select="$RtnHdrData/DiscussWithPaidPreparerInd"/>
										<xsl:with-param name="BackupName">IRS1041DiscussWithPaidPreparerInd</xsl:with-param>
									</xsl:call-template>
									<span class="styBoldText" style="padding-left:1mm;">No</span>
								</label>
							</div>
							<div class="styGeneric" style="width:134mm;float:left;clear:none;font-size:6pt;">
								<span style="width:71mm;float:left;clear:none;"> Signature of fiduciary or officer representing fiduciary </span>
								<span style="width:18mm;float:left;clear:none;padding-left:2mm;"> Date </span>
								<span style="width:45mm;float:left;clear:none;padding-left:2mm;"> EIN of fiduciary if a financial institution	</span>	
							</div>
						</div>
						</div>
						</div>
					</div>
					<!-- paid preparer -->
					<div class="styBB" style="width:187mm;font-size:6pt;float:none;clear:both;">
						<div style="width:22.5mm;padding-top:4mm;float:left;clear:none;page-break-inside:avoid;">
							<span class="styMainTitle" style="font-size:11pt;">
									Paid
									Preparer
									Use Only
									</span>
						</div>
						<div style="width:164mm;float:left;clear:none;border-left:1px solid black;page-break-inside:avoid;">
							<div style="width:164mm;float:left;clear:none;border-style:solid;border-color:black;border-width:0px 0px 1px 0px;">
								<div class="styLNDesc" style="height:7mm;width:46.8mm;padding-top:0mm;border-right:1px solid black;padding-left:1mm">
								Print/Type preparer's name<br/>
									<xsl:call-template name="PopulateReturnHeaderPaidPreparerInformation">
										<xsl:with-param name="TargetNode">PreparerPersonNm</xsl:with-param>
										<xsl:with-param name="BackupName">$RtnHdrDataPreparerPersonNm</xsl:with-param>
									</xsl:call-template>
								</div>
								<div class="styLNDesc" style="height:7mm;width:46.5mm;padding-top:0mm;border-right:1px solid black;padding-left:1mm;">
								Preparer's signature
							</div>
								<div class="styLNDesc" style="height:7mm;width:15.2mm;border-right:1px solid black;padding-top:0mm;padding-left:1mm;">Date <br/>
									<xsl:call-template name="PopulateReturnHeaderPaidPreparerInformation">
										<xsl:with-param name="TargetNode">DateSigned</xsl:with-param>
										<xsl:with-param name="BackupName">$RtnHdrDataDateSigned</xsl:with-param>
									</xsl:call-template>
								</div>
								<div class="styLNDesc" style="height:7mm;width:18mm;border-right:1px solid black;padding-bottom:0mm;padding-left:1mm;">
									<label>
										<xsl:call-template name="PopulateLabel">
											<xsl:with-param name="TargetNode" select="$RtnHdrData/PaidPreparerInformationGrp/SelfEmployedInd"/>
											<xsl:with-param name="BackupName">$RtnHdrDataPaidPreparerInformationGrpSelfEmployedInd</xsl:with-param>
										</xsl:call-template>
										Check 
										<input class="styCkbox" aria-label="SelfEmployed" type="checkbox" style="width:3mm;margin:0mm;">
											<xsl:call-template name="PopulateCheckbox">
												<xsl:with-param name="TargetNode" select="$RtnHdrData/PaidPreparerInformationGrp/SelfEmployedInd"/>
												<xsl:with-param name="BackupName">$RtnHdrDataPaidPreparerInformationGrpSelfEmployedInd</xsl:with-param>
											</xsl:call-template>
										</input>
										<span style="width:4px;"/>if<br/>self-employed
									</label>
								</div>
								<div class="styLNDesc" style="height:6mm;width:16mm;padding-top:0mm;padding-left:1mm;">
									PTIN
									<br/>	
									<xsl:call-template name="PopulateReturnHeaderPaidPreparerInformation">
										<xsl:with-param name="TargetNode">PTIN</xsl:with-param>
										<xsl:with-param name="BackupName">$RtnHdrDataPaidPreparerInformationPTIN</xsl:with-param>
									</xsl:call-template>																	
								</div>
							</div>
							<div style="width:164mm;float:left;clear:none;border-style:solid;border-color:black;border-width:0px 0px 1px 0px;">
								<div class="styLNDesc" style="height:5.6mm;width:108.5mm;border-right:1px solid black;padding-left:1mm">
									<span class="styGenericDiv" style="">Firm's name 
									<span style="width:2.2mm;"/>
										<span style="width:4px;"/>
									</span>
									<div class="styGenericDiv" style="padding-right:.5mm;">
										<xsl:call-template name="PopulateReturnHeaderPaidPreparerInformation">
											<xsl:with-param name="TargetNode">BusinessNameLine1Txt</xsl:with-param>
											<xsl:with-param name="BackupName">$RtnHdrData/PaidPreparerInformation/Preparer/BusinessNameLine1Txt</xsl:with-param>
										</xsl:call-template>
										<br/>
										<xsl:call-template name="PopulateReturnHeaderPaidPreparerInformation">
											<xsl:with-param name="TargetNode">BusinessNameLine2Txt</xsl:with-param>
											<xsl:with-param name="BackupName">$RtnHdrData/PaidPreparerInformation/Preparer/BusinessNameLine2Txt</xsl:with-param>
										</xsl:call-template>
									</div>
								</div>
								<div class="styLNDesc" style="height:5.6mm;width:32mm;padding-left:1mm;">Firm's EIN
									<span style="width:4px;"/>
									<xsl:if test="$RtnHdrData/PaidPreparerInformationGrp/PreparerFirmEIN">
											<xsl:call-template name="PopulateEIN">
												<xsl:with-param name="TargetNode" select="$RtnHdrData/PaidPreparerInformationGrp/PreparerFirmEIN"/>
											</xsl:call-template>
										</xsl:if>
										<xsl:if test="$RtnHdrData/PaidPreparerInformationGrp/MissingEINReasonCd">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="$RtnHdrData/PaidPreparerInformationGrp/MissingEINReasonCd"/>
											</xsl:call-template>
										</xsl:if>
								</div>
							</div>
							<div style="width:164mm;float:left;clear:none;">
								<div class="styLNDesc" style="width:108.5mm;height:auto;border-right:1px solid black;padding-left:1mm">
									<div class="styGenericDiv" style="padding-right:.5mm;">Firm's address 
									</div>
									<div class="styGenericDiv" style="padding-left:1mm;">
										<xsl:call-template name="PopulateReturnHeaderPaidPreparerInformation">
											<xsl:with-param name="TargetNode">AddressLine1Txt</xsl:with-param>
											<xsl:with-param name="BackupName">$RtnHdrData/PaidPreparerInformation/AddressLine1Txt</xsl:with-param>
										</xsl:call-template>
										<br/>
										<xsl:call-template name="PopulateReturnHeaderPaidPreparerInformation">
											<xsl:with-param name="TargetNode">AddressLine2Txt</xsl:with-param>
											<xsl:with-param name="BackupName">$RtnHdrData/PaidPreparerInformation/AddressLine2Txt</xsl:with-param>
										</xsl:call-template>
										<br/>
										<xsl:if test="$RtnHdrData/PaidPreparerInformationGrp/PreparerUSAddress">
											<xsl:call-template name="PopulateReturnHeaderPaidPreparerInformation">
												<xsl:with-param name="TargetNode">CityStateInfo</xsl:with-param>
												<xsl:with-param name="BackupName">$RtnHdrDataPaidPreparerInformationUSAddressCity</xsl:with-param>
											</xsl:call-template>											
										</xsl:if>
										<xsl:if test="$RtnHdrData/PaidPreparerInformationGrp/PreparerForeignAddress">
											<xsl:call-template name="PopulateReturnHeaderPaidPreparerInformation">
												<xsl:with-param name="TargetNode">CityStateInfo</xsl:with-param>
												<xsl:with-param name="BackupName">$RtnHdrDataPaidPreparerInformationForeignAddressCity</xsl:with-param>
											</xsl:call-template>,
											<span style="width:2px;"/>		
											<xsl:call-template name="PopulateReturnHeaderPaidPreparerInformation">
												<xsl:with-param name="TargetNode">CountryCd</xsl:with-param>
												<xsl:with-param name="BackupName">$RtnHdrDataPaidPreparerInformationForeignCountryCd</xsl:with-param>
											</xsl:call-template>
										</xsl:if>
									</div>
								</div>
								<div class="styLNDesc" style="width:32mm;padding-left:1mm;"> Phone no. 
 								<xsl:call-template name="PopulateReturnHeaderPaidPreparerInformation">
										<xsl:with-param name="TargetNode">PhoneNum</xsl:with-param>
										<xsl:with-param name="BackupName">$RtnHdrDataPaidPreparerInformationPhone</xsl:with-param>
									</xsl:call-template>
									<xsl:call-template name="PopulateReturnHeaderPaidPreparerInformation">
										<xsl:with-param name="TargetNode">ForeignPhoneNum</xsl:with-param>
										<xsl:with-param name="BackupName">$RtnHdrDataPaidPreparerInformationForeignPhone</xsl:with-param>
									</xsl:call-template>
								</div>
							</div>
						</div>
					</div>
					<!-- END PREPARER SIGNATURE SECTION -->	
		<!-- page 1 footer -->
		<div class="pageEnd" style="width:187mm;">
			<span class="styBoldText" style="width:118mm;padding-top:.5mm;float:left;clear:none;font-size:6.5pt;">For Paperwork Reduction Act Notice, see the separate instructions.</span>
			<span class="styNormalText" style="padding-top:.5mm;float:left;clear:none;">Cat. No. 11370H</span>
			<span style="float:right;clear:none;">
               Form <span class="styBoldText" style="font-size:10pt;">1041</span> (2025)
            </span>
		</div>
		<!-- end page 1 footer -->
		<p style="page-break-before: always"/>
		<!-- page 2 -->
		<div class="styTBB" style="width:187mm;padding-top:.5mm;">
			<span class="" style="float:left;clear:none;">Form 1041 (2025)</span>
			<span style="float:right;clear:none;">Page <span class="styBoldText" style="font-size:8pt;">2</span>
			</span>
		</div>
		<!-- Schedule A-->
		<div class="styBB" style="width:187mm;">
			<div class="styPartName" style="width:22mm;text-align:center;height:4mm;padding-top:0mm;">Schedule A</div>
			<div class="styPartDesc" style="width:165mm;text-align:left;height:4mm;padding-top:0mm;padding-left:2mm;">Charitable Deduction. <span style="font-weight:normal;">Don't complete for a simple trust or a pooled income fund.</span></div>
		</div>
		<!--Line 1-->
			<div style="width:187mm;font-size:7pt;float:left;">
			  <div class="styLNLeftNumBoxSD" style="height:4mm;">1</div>
			  <div class="styLNDesc" style="width:139.8mm;height:4mm;">
				<span style="float:left;">Amounts paid or permanently set aside for charitable purposes from gross income. See instructions</span>
				<span class="styBoldText" style="float:right;padding-right:10px;">
				  <xsl:call-template name="DotLoop">						
						<xsl:with-param name="DotQty" select="2"/>
					</xsl:call-template>			  
				</span>
			   </div>
			<div class="styLNRightNumBox" style="height:4mm;width:8mm;">1</div>
			  <div class="styLNAmountBox" style="border-bottom-width:1px;height:4mm;width:31.2mm; ">
				<xsl:call-template name="PopulateAmount">
				  <xsl:with-param name="TargetNode" select="$FormData/CharitableContributionAmt" />
				</xsl:call-template>     
			  </div>
		  </div>
		  <!--Line 2-->
			<div style="width:187mm;font-size:7pt;float:left;">
			  <div class="styLNLeftNumBoxSD" style="height:4mm;">2</div>
			  <div class="styLNDesc" style="width:139.8mm;height:4mm;">
				<span style="float:left;">Tax-exempt income allocable to charitable contributions. See instructions</span>
				<span class="styBoldText" style="float:right;padding-right:10px;">
				  <xsl:call-template name="DotLoop">						
						<xsl:with-param name="DotQty" select="9"/>
					</xsl:call-template>			  
				</span>
			   </div>
			<div class="styLNRightNumBox" style="height:4mm;width:8mm;">2</div>
			  <div class="styLNAmountBox" style="border-bottom-width:1px;height:4mm;width:31.2mm; ">
				<xsl:call-template name="PopulateAmount">
				  <xsl:with-param name="TargetNode" select="$FormData/CharitableExemptDeductionAmt" />
				</xsl:call-template>     
			  </div>
		  </div>
		  <!--Line 3-->
			<div style="width:187mm;font-size:7pt;float:left;">
			  <div class="styLNLeftNumBoxSD" style="height:4mm;">3</div>
			  <div class="styLNDesc" style="width:139.8mm;height:4mm;">
				<span style="float:left;">Subtract line 2 from line 1</span>
				<span class="styBoldText" style="float:right;padding-right:10px;">
				  <xsl:call-template name="DotLoop">						
						<xsl:with-param name="DotQty" select="22"/>
					</xsl:call-template>			  
				</span>
			   </div>
			<div class="styLNRightNumBox" style="height:4mm;width:8mm;">3</div>
			  <div class="styLNAmountBox" style="border-bottom-width:1px;height:4mm;width:31.2mm; ">
				<xsl:call-template name="PopulateAmount">
				  <xsl:with-param name="TargetNode" select="$FormData/CharitableNetDeductAmt" />
				</xsl:call-template>     
			  </div>
		  </div>
		  <!--Line 4-->
			<div style="width:187mm;font-size:7pt;float:left;">
			  <div class="styLNLeftNumBoxSD" style="height:4mm;">4</div>
			  <div class="styLNDesc" style="width:139.8mm;height:4mm;">
				<span style="float:left;">Capital gains for the tax year allocated to corpus and paid or permanently set aside for charitable purposes</span>
					<span class="styBoldText" style="float:right;padding-right:10px;">
				  <xsl:call-template name="DotLoop">						
						<xsl:with-param name="DotQty" select="0"/>
					</xsl:call-template>			  
				</span>
			   </div>
			<div class="styLNRightNumBox" style="height:4mm;width:8mm;padding-top:.5mm;">4</div>
			  <div class="styLNAmountBox" style="border-bottom-width:1px;height:4mm;width:31.2mm;padding-top:.5mm;">
				<xsl:call-template name="PopulateAmount">
				  <xsl:with-param name="TargetNode" select="$FormData/CapitalGainCorpusCharityAmt" />
				</xsl:call-template>     
			  </div>
		  </div>
		  <!--Line 5-->
			<div style="width:187mm;font-size:7pt;float:left;">
			  <div class="styLNLeftNumBoxSD" style="height:4mm;">5</div>
			  <div class="styLNDesc" style="width:139.8mm;height:4mm;">
				<span style="float:left;">Add lines 3 and 4</span>
				<span class="styBoldText" style="float:right;padding-right:10px;">
				  <xsl:call-template name="DotLoop">						
						<xsl:with-param name="DotQty" select="25"/>
					</xsl:call-template>			  
				</span>
			   </div>
			<div class="styLNRightNumBox" style="height:4mm;width:8mm;">5</div>
			  <div class="styLNAmountBox" style="border-bottom-width:1px;height:4mm;width:31.2mm; ">
				<xsl:call-template name="PopulateAmount">
				  <xsl:with-param name="TargetNode" select="$FormData/CapitalGainNetAmt" />
				</xsl:call-template>     
			  </div>
		  </div>
		  <!--Line 6-->
			<div style="width:187mm;font-size:7pt;float:left;">
			  <div class="styLNLeftNumBoxSD" style="height:4mm;">6</div>
			  <div class="styLNDesc" style="width:139.8mm;height:4mm;font-family:arial narrow;font-size:8.5pt;">
				<span style="float:left;">Section 1202 exclusion allocable to capital gains paid or permanently set aside for charitable purposes. 
				See instructions</span>				
				<span class="styBoldText" style="float:right;padding-right:10px;font-family:verdana;font-size:7pt;">
				  <xsl:call-template name="DotLoop">						
						<xsl:with-param name="DotQty" select="1"/>
					</xsl:call-template>			  
				</span>
			   </div>
			<div class="styLNRightNumBox" style="width:8mm;height:4mm;padding-top:.5mm;">6</div>
			  <div class="styLNAmountBox" style="width:31.2mm;height:4mm;border-bottom-width:1px;padding-top:.5mm;">
				<xsl:call-template name="PopulateAmount">
				  <xsl:with-param name="TargetNode" select="$FormData/CapitalGainSect1202Amt" />
				</xsl:call-template>     
			  </div>
		  </div>
		  <!--Line 7-->
			<div style="width:187mm;font-size:7pt;float:left;">
			  <div class="styLNLeftNumBoxSD" style="height:4mm;">7</div>
			  <div class="styLNDesc" style="width:139.8mm;height:4mm;">
				<span style="float:left;"><b>Charitable deduction.</b> Subtract line 6 from line 5. Enter here and on page 1, line 13</span>
				<span class="styBoldText" style="float:right;padding-right:10px;">
				  <xsl:call-template name="DotLoop">						
						<xsl:with-param name="DotQty" select="6"/>
					</xsl:call-template>			  
				</span>
			   </div>
			<div class="styLNRightNumBox" style="height:4mm;width:8mm;border-bottom-width:0px;">7</div>
			  <div class="styLNAmountBox" style="border-bottom-width:0px;height:4mm;width:31.2mm; ">
				<xsl:call-template name="PopulateAmount">
				  <xsl:with-param name="TargetNode" select="$FormData/CharitableDeductionsAmt" />
				</xsl:call-template>     
			  </div>
		  </div>
		  <!-- Schedule B-->
		<div class="styBB" style="width:187mm;border-top-width:1px;">
			<div class="styPartName" style="width:22mm;text-align:center;height:4mm;padding-top:0mm;">Schedule B</div>
			<div class="styPartDesc" style="width:165mm;text-align:left;height:4mm;padding-top:0mm;padding-left:2mm;">Income Distribution Deduction</div>
		</div>
		<!--Line 1-->
			<div style="width:187mm;font-size:7pt;float:left;">
			  <div class="styLNLeftNumBoxSD" style="height:4mm;">1</div>
			  <div class="styLNDesc" style="width:139.8mm;height:4mm;">
				<span style="float:left;">Adjusted total income. See instructions</span>
				<span class="styBoldText" style="float:right;padding-right:10px;">
				  <xsl:call-template name="DotLoop">						
						<xsl:with-param name="DotQty" select="18"/>
					</xsl:call-template>			  
				</span>
			   </div>
			<div class="styLNRightNumBox" style="height:4mm;width:8mm;">1</div>
			  <div class="styLNAmountBox" style="height:4mm;width:31.2mm; ">
				<xsl:call-template name="PopulateAmount">
				  <xsl:with-param name="TargetNode" select="$FormData/SchBAdjustedTotalIncomeAmt" />
				</xsl:call-template>     
			  </div>
		  </div>
		  <!--Line 2-->
			<div style="width:187mm;font-size:7pt;float:left;">
			  <div class="styLNLeftNumBoxSD" style="height:4mm;">2</div>
			  <div class="styLNDesc" style="width:139.8mm;height:4mm;">
				<span style="float:left;">Adjusted tax-exempt interest</span>
				<span class="styBoldText" style="float:right;padding-right:10px;">
				  <xsl:call-template name="DotLoop">						
						<xsl:with-param name="DotQty" select="21"/>
					</xsl:call-template>			  
				</span>
			   </div>
			<div class="styLNRightNumBox" style="height:4mm;width:8mm;">2</div>
			  <div class="styLNAmountBox" style="height:4mm;width:31.2mm; ">
				<xsl:call-template name="PopulateAmount">
				  <xsl:with-param name="TargetNode" select="$FormData/AdjustedTaxExemptInterestAmt" />
				</xsl:call-template>     
			  </div>
		  </div>
		  <!--Line 3-->
			<div style="width:187mm;font-size:7pt;float:left;">
			  <div class="styLNLeftNumBoxSD" style="height:4mm;">3</div>
			  <div class="styLNDesc" style="width:139.8mm;height:4mm;">
				<span style="float:left;">Total net gain from Schedule D (Form 1041), line 19, column (1). See instructions</span>
				<span class="styBoldText" style="float:right;padding-right:10px;">
				  <xsl:call-template name="DotLoop">						
						<xsl:with-param name="DotQty" select="7"/>
					</xsl:call-template>			  
				</span>
			   </div>
			<div class="styLNRightNumBox" style="height:4mm;width:8mm;">3</div>
			  <div class="styLNAmountBox" style="height:4mm;width:31.2mm; ">
				<xsl:call-template name="PopulateAmount">
				  <xsl:with-param name="TargetNode" select="$FormData/TotalNetGainOrLossAmt" />
				</xsl:call-template>     
			  </div>
		  </div>
		  <!--Line 4-->
			<div style="width:187mm;font-size:7pt;float:left;">
			  <div class="styLNLeftNumBoxSD" style="height:4mm;">4</div>
			  <div class="styLNDesc" style="width:139.8mm;height:4mm;">
				<span style="float:left;">Enter amount from Schedule A, line 4 (minus any allocable section 1202 exclusion)</span>
				<span class="styBoldText" style="float:right;padding-right:10px;">
				  <xsl:call-template name="DotLoop">						
						<xsl:with-param name="DotQty" select="7"/>
					</xsl:call-template>			  
				</span>
			   </div>
			<div class="styLNRightNumBox" style="height:4mm;width:8mm;">4</div>
			  <div class="styLNAmountBox" style="height:4mm;width:31.2mm; ">
				<xsl:call-template name="PopulateAmount">
				  <xsl:with-param name="TargetNode" select="$FormData/CapGainAllocatedCorpusAmt" />
				</xsl:call-template>     
			  </div>
		  </div>
		  <!--Line 5-->
			<div style="width:187mm;font-size:7pt;float:left;">
			  <div class="styLNLeftNumBoxSD" style="height:4mm;">5</div>
			  <div class="styLNDesc" style="width:139.8mm;height:4mm;">
				<span style="float:left;">Capital gains for the tax year included on Schedule A, line 1. See instructions</span>
				<span class="styBoldText" style="float:right;padding-right:10px;">
				  <xsl:call-template name="DotLoop">						
						<xsl:with-param name="DotQty" select="8"/>
					</xsl:call-template>			  
				</span>
			   </div>
			<div class="styLNRightNumBox" style="height:4mm;width:8mm;">5</div>
			  <div class="styLNAmountBox" style="height:4mm;width:31.2mm; ">
				<xsl:call-template name="PopulateAmount">
				  <xsl:with-param name="TargetNode" select="$FormData/TotalCapitalDistributionsAmt" />
				</xsl:call-template>     
			  </div>
		  </div>
		  <!--Line 6-->
			<div style="width:187mm;font-size:7pt;float:left;">
			  <div class="styLNLeftNumBoxSD" style="height:4mm;">6</div>
			  <div class="styLNDesc" style="width:139.8mm;height:4mm;float:left;font-family:arial narrow;font-size:8.5pt;">
				<span style="float:left;">Enter any gain from page 1, line 4, as a negative number. If page 1, line 4, is a loss, enter the loss as a 
				positive number</span>				
				<span class="styBoldText" style="float:right;padding-right:10px;font-family:verdana;font-size:7pt;">
				    <xsl:call-template name="DotLoop">						
						<xsl:with-param name="DotQty" select="1"/>
					</xsl:call-template>			  
				</span>
			   </div>
			<div class="styLNRightNumBox" style="width:8mm;height:4mm;padding-top:.5mm;">6</div>
			  <div class="styLNAmountBox" style="width:31.2mm;height:4mm;border-bottom-width:1px;padding-top:.5mm;">			 
				<xsl:if test="string(number($FormData/CapitalGainLossAmt)) != 'NaN'">
					<!--updated code per defect to display number in correct format-->
					<xsl:variable name="CapitalGainLossAmtVar">
						<xsl:value-of select="format-number($FormData/CapitalGainLossAmt *-1, '0')"/>
					</xsl:variable>		
					<xsl:call-template name="PopulateAmount">
					  <xsl:with-param name="TargetNode" select="$CapitalGainLossAmtVar" />
					</xsl:call-template>  	  
				</xsl:if>
				<xsl:if test="string(number($FormData/CapitalGainLossAmt)) = 'NaN'"><br /></xsl:if>						
			  </div>
		  </div>		  
		  <!--Line 7-->
			<div style="width:187mm;font-size:7pt;float:left;">
			  <div class="styLNLeftNumBoxSD" style="height:4mm;">7</div>
			  <div class="styLNDesc" style="width:139.8mm;height:4mm;">
				<span style="float:left;"><b>Distributable net income.</b> Combine lines 1 through 6. If zero or less, enter -0-
					<xsl:call-template name="SetFormLinkInline">
						<xsl:with-param name="TargetNode" select="$FormData/DistributableNetIncomeAmt"/>
					</xsl:call-template>
				</span>
				<span class="styBoldText" style="float:right;padding-right:10px;">
				    <xsl:call-template name="DotLoop">						
						<xsl:with-param name="DotQty" select="6"/>
					</xsl:call-template>			  
				</span>
			</div>
			<div class="styLNRightNumBox" style="height:4mm;width:8mm;">7</div>
			  <div class="styLNAmountBox" style="height:4mm;width:31.2mm; ">
				<xsl:call-template name="PopulateAmount">
				  <xsl:with-param name="TargetNode" select="$FormData/DistributableNetIncomeAmt" />
				</xsl:call-template>     
			  </div>
		  </div>
		  <!--Line 8-->
			<div style="width:187mm;font-size:7pt;float:left;">
			  <div class="styLNLeftNumBoxSD" style="height:4mm;">8</div>
			  <div class="styLNDesc" style="width:100.6mm;height:4mm;">
				<span style="float:left;width:99.8mm;">If a complex trust, enter accounting income for the tax year as</span>
				<span style="float:left;">determined under the governing instrument and applicable local law</span>
				<span class="styBoldText" style="float:right;padding-right:10px;">
				  <xsl:call-template name="DotLoop">						
						<xsl:with-param name="DotQty" select="2"/>
					</xsl:call-template>			  
				</span>
			   </div>
			<div class="styLNRightNumBox" style="height:4mm;width:8mm;margin-top:3.05mm;">8</div>
			  <div class="styLNAmountBox" style="height:4mm;width:31.2mm;margin-top:3.05mm;" >
			  <xsl:call-template name="PopulateAmount">
				  <xsl:with-param name="TargetNode" select="$FormData/AccountingIncomeAmt" />
				</xsl:call-template>  
				</div>
			<div class="styLNRightNumBox" style="height:7mm;width:8mm;background-color:lightgray;"><br /><br /></div>
			  <div class="styLNAmountBox" style="height:7mm;width:31.2mm;" ><br /><br /></div>
		  </div>
		  <!--Line 9-->
			<div style="width:187mm;font-size:7pt;float:left;">
			  <div class="styLNLeftNumBoxSD" style="height:4mm;">9</div>
			  <div class="styLNDesc" style="width:139.8mm;height:4mm;">
				<span style="float:left;">Income required to be distributed currently</span>
				<span class="styBoldText" style="float:right;padding-right:10px;">
				  <xsl:call-template name="DotLoop">						
						<xsl:with-param name="DotQty" select="17"/>
					</xsl:call-template>			  
				</span>
			   </div>
			<div class="styLNRightNumBox" style="height:4mm;width:8mm;">9</div>
			  <div class="styLNAmountBox" style="height:4mm;width:31.2mm; ">
				<xsl:call-template name="PopulateAmount">
				  <xsl:with-param name="TargetNode" select="$FormData/FirstTierDistributionAmt" />
				</xsl:call-template>     
			  </div>
		  </div>
		  <!--Line 10-->
			<div style="width:187mm;font-size:7pt;float:left;">
			  <div class="styLNLeftNumBox" style="height:4mm;">10</div>
			  <div class="styLNDesc" style="width:139.8mm;height:4mm;">
				<span style="float:left;">Other amounts paid, credited, or otherwise required to be distributed</span>
				<span class="styBoldText" style="float:right;padding-right:10px;">
				  <xsl:call-template name="DotLoop">						
						<xsl:with-param name="DotQty" select="10"/>
					</xsl:call-template>			  
				</span>
			   </div>
			<div class="styLNRightNumBox" style="height:4mm;width:8mm;">10</div>
			  <div class="styLNAmountBox" style="height:4mm;width:31.2mm; ">
				<xsl:call-template name="PopulateAmount">
				  <xsl:with-param name="TargetNode" select="$FormData/SecondTierDistributionAmt" />
				</xsl:call-template>     
			  </div>
		  </div>
		  <!--Line 11-->
			<div style="width:187mm;font-size:7pt;float:left;">
			  <div class="styLNLeftNumBox" style="height:4mm;">11</div>
			  <div class="styLNDesc" style="width:139.8mm;height:4mm;">
				<span style="float:left;">Total distributions. Add lines 9 and 10. If greater than line 8, see instructions
				<xsl:call-template name="SetFormLinkInline">
					<xsl:with-param name="TargetNode" select="$FormData/TotalDistributionAmt"/>
				</xsl:call-template>
				</span>
				<span class="styBoldText" style="float:right;padding-right:10px;">
				  <xsl:call-template name="DotLoop">						
						<xsl:with-param name="DotQty" select="8"/>
					</xsl:call-template>			  
				</span>
			   </div>
			<div class="styLNRightNumBox" style="height:4.5mm;width:8mm;">11</div>
			  <div class="styLNAmountBox" style="height:4.5mm;width:31.2mm; ">
				<xsl:call-template name="PopulateAmount">
				  <xsl:with-param name="TargetNode" select="$FormData/TotalDistributionAmt" />
				</xsl:call-template>     
			  </div>
		  </div>
		  <!--Line 12-->
			<div style="width:187mm;font-size:7pt;float:left;">
			  <div class="styLNLeftNumBox" style="height:4mm;">12</div>
			  <div class="styLNDesc" style="width:139.8mm;height:4mm;">
				<span style="float:left;">Enter the amount of tax-exempt income included on line 11</span>
				<span class="styBoldText" style="float:right;padding-right:10px;">
				  <xsl:call-template name="DotLoop">						
						<xsl:with-param name="DotQty" select="13"/>
					</xsl:call-template>			  
				</span>
			   </div>
			<div class="styLNRightNumBox" style="height:4.5mm;width:8mm;">12</div>
			  <div class="styLNAmountBox" style="height:4.5mm;width:31.2mm; ">
				<xsl:call-template name="PopulateAmount">
				  <xsl:with-param name="TargetNode" select="$FormData/TaxExemptIncomeAmt" />
				</xsl:call-template>     
			  </div>
		  </div>
		  <!--Line 13-->
			<div style="width:187mm;font-size:7pt;float:left;">
			  <div class="styLNLeftNumBox" style="height:4mm;">13</div>
			  <div class="styLNDesc" style="width:139.8mm;height:4mm;">
				<span style="float:left;">Tentative income distribution deduction. Subtract line 12 from line 11</span>
				<span class="styBoldText" style="float:right;padding-right:10px;">
				  <xsl:call-template name="DotLoop">						
						<xsl:with-param name="DotQty" select="11"/>
					</xsl:call-template>			  
				</span>
			   </div>
			<div class="styLNRightNumBox" style="height:4mm;width:8mm;">13</div>
			  <div class="styLNAmountBox" style="height:4mm;width:31.2mm; ">
				<xsl:call-template name="PopulateAmount">
				  <xsl:with-param name="TargetNode" select="$FormData/TentativeIncmDistriIntDedAmt" />
				</xsl:call-template>     
			  </div>
		  </div>
		  <!--Line 14-->
			<div style="width:187mm;font-size:7pt;float:left;">
			  <div class="styLNLeftNumBox" style="height:4mm;">14</div>
			  <div class="styLNDesc" style="width:139.8mm;height:4mm;">
				<span style="float:left;">Tentative income distribution deduction. Subtract line 2 from line 7. If zero or less, enter -0-</span>
				<span class="styBoldText" style="float:right;padding-right:10px;">
				  <xsl:call-template name="DotLoop">						
						<xsl:with-param name="DotQty" select="4"/>
					</xsl:call-template>			  
				</span>
			   </div>
			<div class="styLNRightNumBox" style="height:4mm;width:8mm;">14</div>
			  <div class="styLNAmountBox" style="height:4mm;width:31.2mm; ">
				<xsl:call-template name="PopulateAmount">
				  <xsl:with-param name="TargetNode" select="$FormData/TentativeIncmDistriDedAmt" />
				</xsl:call-template>     
			  </div>
		  </div>
		  <!--Line 15-->
			<div style="width:187mm;font-size:7pt;float:left;">
			  <div class="styLNLeftNumBox" style="height:4mm;">15</div>
			  <div class="styLNDesc" style="width:139.8mm;height:4mm;">
				<span style="float:left;"><b>Income distribution deduction. </b> Enter the smaller of line 13 or line 14 here and on page 1, line 18</span>				
				<span class="styBoldText" style="float:right;padding-right:10px;">
				  <xsl:call-template name="DotLoop">						
						<xsl:with-param name="DotQty" select="2"/>
					</xsl:call-template>			  
				</span>
			   </div>
			<div class="styLNRightNumBox" style="height:4mm;width:8mm;border-bottom-width:0px;">15</div>
			  <div class="styLNAmountBox" style="border-bottom-width:0px;height:4mm;width:31.2mm; ">
				<xsl:call-template name="PopulateAmount">
				  <xsl:with-param name="TargetNode" select="$FormData/IncomeDistributionDeductionAmt" />
				</xsl:call-template>     
			  </div>
		  </div>
		  <!-- Schedule G-->
		<div class="styBB" style="width:187mm;border-top-width:1px;">
			<div class="styPartName" style="width:22mm;text-align:center;height:4mm;padding-top:0mm;">Schedule G</div>
			<div class="styPartDesc" style="width:165mm;text-align:left;height:4mm;padding-top:0mm;padding-left:2mm;font-weight:normal;">
				<b>Tax Computation and Payments</b> (see instructions)</div>
		</div>
		<!-- Part I - Tax Computation-->
		<div class="styBB" style="width:187mm;border-top-width:0.5px;">			
			<div class="styPartDesc" style="width:167mm;text-align:left;height:4mm;padding-top:0mm;padding-left:0mm;">Part I - Tax Computation</div>
		</div>
			<!--Line 1-->
			<div style="width:187mm;font-size:7pt;float:left;">
				<div class="styLNLeftNumBoxSD" style="height:4mm;width:8mm;">1</div>
				<div class="styLNDesc" style="height:4mm;width:8.5mm;font-weight:bold;padding-left:0mm;">
					<span style="float:left;">Tax:</span>
				</div>			  
				<div class="styLNDesc" style="width:92.1mm;height:4mm;padding-left:3mm;">
			   </div>
			 <div class="styLNRightNumBox" style="height:4.5mm;width:8mm;border-bottom-width:0px;"></div>
			  <div class="styLNAmountBox" style="height:4.5mm;width:31.2mm;border-bottom-width:0px; ">  
			  </div>
			<div class="styLNRightNumBox" style="height:4.5mm;width:8mm;background-color:lightgray;border-bottom-width:0px;"></div>
			  <div class="styLNAmountBox" style="height:4.5mm;width:31.2mm;border-bottom-width:0px;" />
		    </div>
			<!--Line 1a-->
			<div style="width:187mm;font-size:7pt;float:left;">
			  <div class="styLNLeftNumBoxSD" style="height:4mm;padding-left:4mm;">a</div>	
			  <div class="styLNDesc" style="width:100.6mm;height:4mm;">
				<span style="float:left;">Tax on taxable income. See instructions</span>
				<span class="styBoldText" style="float:right;padding-right:10px;">
				  <xsl:call-template name="DotLoop">						
						<xsl:with-param name="DotQty" select="10"/>
					</xsl:call-template>			  
				</span>
			   </div>
			 <div class="styLNRightNumBox" style="height:4.5mm;width:8mm;">1a</div>
			  <div class="styLNAmountBox" style="height:4.5mm;width:31.2mm; ">
				<xsl:call-template name="PopulateAmount">
				  <xsl:with-param name="TargetNode" select="$FormData/TaxAmt" />
				</xsl:call-template>     
			  </div>
			<div class="styLNRightNumBox" style="height:4.5mm;width:8mm;background-color:lightgray;border-bottom-width:0px;"></div>
			  <div class="styLNAmountBox" style="height:4.5mm;width:31.2mm;border-bottom-width:0px;" />
		  </div>
		  <!--Line 1b-->
			<div style="width:187mm;font-size:7pt;float:left;">
			  <div class="styLNLeftNumBoxSD" style="height:4mm;padding-left:4mm;">b</div>	
			  <div class="styLNDesc" style="width:100.6mm;height:4mm;">
					<span style="float:left;">Tax on lump-sum distributions. Attach Form 4972
					<xsl:call-template name="SetFormLinkInline">
						<xsl:with-param name="TargetNode" select="$FormData/LumpSumDistributionTaxAmt"/>
					</xsl:call-template>
				</span>
				<span class="styBoldText" style="float:right;padding-right:10px;">
				  <xsl:call-template name="DotLoop">						
						<xsl:with-param name="DotQty" select="6"/>
					</xsl:call-template>			  
				</span>
			   </div>
			 <div class="styLNRightNumBox" style="height:4.5mm;width:8mm;">1b</div>
			  <div class="styLNAmountBox" style="height:4.5mm;width:31.2mm; ">
				<xsl:call-template name="PopulateAmount">
				  <xsl:with-param name="TargetNode" select="$FormData/LumpSumDistributionTaxAmt" />
				</xsl:call-template>     
			  </div>
			<div class="styLNRightNumBox" style="height:4.5mm;width:8mm;background-color:lightgray;border-bottom-width:0px;"></div>
			  <div class="styLNAmountBox" style="height:4.5mm;width:31.2mm;border-bottom-width:0px;" />
		  </div>
		  <!--Line 1c-->
			<div style="width:187mm;font-size:7pt;float:left;">
			  <div class="styLNLeftNumBoxSD" style="height:4mm;padding-left:4mm;">c</div>	
			  <div class="styLNDesc" style="width:100.6mm;height:4mm;">
				<span style="float:left;">Alternative minimum tax (from Schedule I (Form 1041), line 54)
					<xsl:call-template name="SetFormLinkInline">
						<xsl:with-param name="TargetNode" select="$FormData/AlternativeMinimumTaxAmt"/>
					</xsl:call-template>
				</span>
				<span class="styBoldText" style="float:right;padding-right:10px;">
				  <xsl:call-template name="DotLoop">						
						<xsl:with-param name="DotQty" select="2"/>
					</xsl:call-template>			  
				</span>
			   </div>
			 <div class="styLNRightNumBox" style="height:4.5mm;width:8mm;">1c</div>
			  <div class="styLNAmountBox" style="height:4.5mm;width:31.2mm; ">
				<xsl:call-template name="PopulateAmount">
				  <xsl:with-param name="TargetNode" select="$FormData/AlternativeMinimumTaxAmt" />
				</xsl:call-template>     
			  </div>
			<div class="styLNRightNumBox" style="height:4.5mm;width:8mm;background-color:lightgray;border-bottom-width:0px;"></div>
			  <div class="styLNAmountBox" style="height:4.5mm;width:31.2mm;border-bottom-width:0px;" />
		  </div>
		  <!--Line 1d-->
			<div style="width:187mm;font-size:7pt;float:left;">
			  <div class="styLNLeftNumBoxSD" style="height:4mm;padding-left:4mm;">d</div>	
			  <div class="styLNDesc" style="width:100.6mm;height:4mm;">
				<span style="float:left;">Amount from Form 4255, Part I, line 3, column (q)
				  <xsl:call-template name="SetFormLinkInline">
					<xsl:with-param name="TargetNode" select="$FormData/TotalChapter1TaxAmt"/>
				  </xsl:call-template>
				</span>
				<span class="styBoldText" style="float:right;padding-right:10px;">
				  <xsl:call-template name="DotLoop">						
					<xsl:with-param name="DotQty" select="6"/>
				  </xsl:call-template>			  
				</span>
			   </div>
			 <div class="styLNRightNumBox" style="height:4.5mm;width:8mm;">1d</div>
			  <div class="styLNAmountBox" style="height:4.5mm;width:31.2mm; ">
				<xsl:call-template name="PopulateAmount">
				  <xsl:with-param name="TargetNode" select="$FormData/TotalChapter1TaxAmt" />
				</xsl:call-template>     
			  </div>
			<div class="styLNRightNumBox" style="height:4.5mm;width:8mm;background-color:lightgray;border-bottom-width:0px;"></div>
			  <div class="styLNAmountBox" style="height:4.5mm;width:31.2mm;border-bottom-width:0px;" />
		  </div>
		  <!--Line 1e-->
			<div style="width:187mm;font-size:7pt;float:left;">
			  <div class="styLNLeftNumBoxSD" style="height:4mm;padding-left:4mm;">e</div>
			  <div class="styLNDesc" style="width:139.8mm;height:4mm;">
				<span style="float:left;"><b>Total.</b> Add lines 1a through 1d
					<xsl:call-template name="SetFormLinkInline">
					   <xsl:with-param name="TargetNode" select="$FormData/TotalTaxForTaxYearAmt"/>
					</xsl:call-template>
                </span>
                <xsl:call-template name="LinkToLeftoverDataTableInline">
					<xsl:with-param name="Desc">Line 1e Schedule G - Amount</xsl:with-param>
					<xsl:with-param name="TargetNode" select="$FormData/TotalTaxForTaxYearAmt/@form8978Amt" />				
				</xsl:call-template>
				<xsl:call-template name="LinkToLeftoverDataTableInline">
					<xsl:with-param name="Desc">Line 1e Schedule G - Form8978Cd</xsl:with-param>
					<xsl:with-param name="TargetNode" select="$FormData/TotalTaxForTaxYearAmt/@form8978Cd" />				
				</xsl:call-template>
						
				<span class="styBoldText" style="float:right;">
				  <xsl:call-template name="DotLoop">						
						<xsl:with-param name="DotQty" select="18"/>
					</xsl:call-template>
					<span style="width:5px;" />
				</span>
			   </div>
			 <div class="styLNRightNumBox" style="height:4.5mm;width:8mm;">1e</div>
			  <div class="styLNAmountBox" style="height:4.5mm;width:31.2mm; ">
				<xsl:call-template name="PopulateAmount">
				  <xsl:with-param name="TargetNode" select="$FormData/TotalTaxForTaxYearAmt" />
				</xsl:call-template>     
			  </div>			
		  </div>			
		   <!--Line 2a-->
			<div style="width:187mm;font-size:7pt;float:left;">
			  <div class="styLNLeftNumBoxSD" style="height:4mm;">2a</div>			  		  
			  <div class="styLNDesc" style="width:100.6mm;height:4mm;">
				<span style="float:left;">Foreign tax credit. Attach Form 1116
					<xsl:call-template name="SetFormLinkInline">
						<xsl:with-param name="TargetNode" select="$FormData/ForeignTaxCreditAmt"/>
					</xsl:call-template>
				</span>
				<span class="styBoldText" style="float:right;padding-right:10px;">
				  <xsl:call-template name="DotLoop">						
						<xsl:with-param name="DotQty" select="9"/>
					</xsl:call-template>			  
				</span>
			   </div>
			 <div class="styLNRightNumBox" style="height:4.5mm;width:8mm;">2a</div>
			  <div class="styLNAmountBox" style="height:4.5mm;width:31.2mm; ">
				<xsl:call-template name="PopulateAmount">
				  <xsl:with-param name="TargetNode" select="$FormData/ForeignTaxCreditAmt" />
				</xsl:call-template>     
			  </div>
			<div class="styLNRightNumBox" style="height:4.5mm;width:8mm;background-color:lightgray;border-bottom-width:0px;"></div>
			  <div class="styLNAmountBox" style="height:4.5mm;width:31.2mm;border-bottom-width:0px;" />
		  </div>
		  <!--Line 2b-->
			<div style="width:187mm;font-size:7pt;float:left;">
			  <div class="styLNLeftNumBoxSD" style="height:4mm;padding-left:4mm;">b</div>			  		  
			  <div class="styLNDesc" style="width:100.6mm;height:4mm;">
				<span style="float:left;">General business credit. Attach Form 3800
					<xsl:call-template name="SetFormLinkInline">
						<xsl:with-param name="TargetNode" select="$FormData/CYGenBusinessCreditAllowedAmt"/>
					</xsl:call-template>
				</span>
				<span class="styBoldText" style="float:right;padding-right:10px;">
				  <xsl:call-template name="DotLoop">						
						<xsl:with-param name="DotQty" select="8"/>
					</xsl:call-template>			  
				</span>
			   </div>
			 <div class="styLNRightNumBox" style="height:4.5mm;width:8mm;">2b</div>
			  <div class="styLNAmountBox" style="height:4.5mm;width:31.2mm; ">
				<xsl:call-template name="PopulateAmount">
				  <xsl:with-param name="TargetNode" select="$FormData/CYGenBusinessCreditAllowedAmt" />
				</xsl:call-template>     
			  </div>
			<div class="styLNRightNumBox" style="height:4.5mm;width:8mm;background-color:lightgray;border-bottom-width:0px;"></div>
			  <div class="styLNAmountBox" style="height:4.5mm;width:31.2mm;border-bottom-width:0px;" />
		  </div>
		  <!--Line 2c-->
			<div style="width:187mm;font-size:7pt;float:left;">
			  <div class="styLNLeftNumBoxSD" style="height:4mm;padding-left:4mm;">c</div>			  		  
			  <div class="styLNDesc" style="width:100.6mm;height:4mm;">
				<span style="float:left;">Credit for prior year minimum tax. Attach Form 8801
				<xsl:call-template name="SetFormLinkInline">
					<xsl:with-param name="TargetNode" select="$FormData/CYNonrefundableAMTCrAmt"/>
				</xsl:call-template>
				</span>
				<span class="styBoldText" style="float:right;padding-right:10px;">
				  <xsl:call-template name="DotLoop">						
						<xsl:with-param name="DotQty" select="5"/>
					</xsl:call-template>			  
				</span>
			   </div>
			 <div class="styLNRightNumBox" style="height:4.5mm;width:8mm;">2c</div>
			  <div class="styLNAmountBox" style="height:4.5mm;width:31.2mm; ">
				<xsl:call-template name="PopulateAmount">
				  <xsl:with-param name="TargetNode" select="$FormData/CYNonrefundableAMTCrAmt" />
				</xsl:call-template>     
			  </div>
			<div class="styLNRightNumBox" style="height:4.5mm;width:8mm;background-color:lightgray;border-bottom-width:0px;"></div>
			  <div class="styLNAmountBox" style="height:4.5mm;width:31.2mm;border-bottom-width:0px;" />
		  </div>
		  <!--Line 2d-->
			<div style="width:187mm;font-size:7pt;float:left;">
			  <div class="styLNLeftNumBoxSD" style="height:4mm;padding-left:4mm;">d</div>			  		  
			  <div class="styLNDesc" style="width:100.6mm;height:4mm;">
				<span style="float:left;">Bond credits. Attach Form 8912
				<xsl:call-template name="SetFormLinkInline">
					<xsl:with-param name="TargetNode" select="$FormData/CYBondCreditAllowedAmt"/>
				</xsl:call-template>
				</span>
				<span class="styBoldText" style="float:right;padding-right:10px;">
				  <xsl:call-template name="DotLoop">						
						<xsl:with-param name="DotQty" select="10"/>
					</xsl:call-template>			  
				</span>
			   </div>
			 <div class="styLNRightNumBox" style="height:4.5mm;width:8mm;">2d</div>
			  <div class="styLNAmountBox" style="height:4.5mm;width:31.2mm; ">
				<xsl:call-template name="PopulateAmount">
				  <xsl:with-param name="TargetNode" select="$FormData/CYBondCreditAllowedAmt" />
				</xsl:call-template>     
			  </div>
			<div class="styLNRightNumBox" style="height:4.5mm;width:8mm;background-color:lightgray;border-bottom-width:0px;"></div>
			  <div class="styLNAmountBox" style="height:4.5mm;width:31.2mm;border-bottom-width:0px;" />
		  </div>
		  <!--Line 2e-->
			<div style="width:187mm;font-size:7pt;float:left;">
			  <div class="styLNLeftNumBoxSD" style="height:4mm;padding-left:4mm;">e</div>
			  <div class="styLNDesc" style="width:139.8mm;height:4mm;">
				<span style="float:left;"><b>Total credits.</b> Add lines 2a through 2d
				<xsl:call-template name="SetFormLinkInline">
                 <xsl:with-param name="TargetNode" select="$FormData/TotalCreditsAmt"/></xsl:call-template>						
					<xsl:if test="count($FormData/OtherCreditsFormAndAmt) = 1">
						<xsl:call-template name="LinkToLeftoverDataTableInline">
							<xsl:with-param name="Desc">Line G-2e - Other credits included in Schedule G-Line 2e Description</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$FormData/OtherCreditsFormAndAmt/Description" />				
						</xsl:call-template>
						<xsl:call-template name="LinkToLeftoverDataTableInline">
							<xsl:with-param name="Desc">Line G-2e - Other credits included in Schedule G-Line 2e Amount</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$FormData/OtherCreditsFormAndAmt/Amount" />				
						</xsl:call-template>
						</xsl:if>
						<xsl:if test="count($FormData/OtherCreditsFormAndAmt) &gt; 1">
						<xsl:call-template name="LinkToLeftoverDataTableInline">
							<xsl:with-param name="Desc">Line G-2e - Other credits included in Schedule G-Line 2e</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$FormData/OtherCreditsFormAndAmt" />				
						</xsl:call-template>
					</xsl:if>					
				</span>
                <xsl:call-template name="LinkToLeftoverDataTableInline">
					<xsl:with-param name="Desc">Line 2e Schedule G - Amount</xsl:with-param>
					<xsl:with-param name="TargetNode" select="$FormData/TotalCreditsAmt/@form8978Amt" />				
				</xsl:call-template>
				<xsl:call-template name="LinkToLeftoverDataTableInline">
					<xsl:with-param name="Desc">Line 2e Schedule G - Form8978Cd</xsl:with-param>
					<xsl:with-param name="TargetNode" select="$FormData/TotalCreditsAmt/@form8978Cd" />				
				</xsl:call-template>
				<span style="padding-left:1px; float:left;">
					<xsl:call-template name="SetFormLinkInline">
						<xsl:with-param name="TargetNode" select="$FormData/OtherTaxDueAmt"/>
					</xsl:call-template>
				</span>
				<span class="styBoldText" style="float:right;">
				  <xsl:call-template name="DotLoop">						
						<xsl:with-param name="DotQty" select="15"/>
					</xsl:call-template>			  
					<span style="width:5px;" />
				</span>
			   </div>
			<div class="styLNRightNumBox" style="height:4.5mm;width:8mm;">2e</div>
			  <div class="styLNAmountBox" style="height:4.5mm;width:31.2mm; ">
				<xsl:call-template name="PopulateAmount">
				  <xsl:with-param name="TargetNode" select="$FormData/TotalCreditsAmt" />
				</xsl:call-template>     
			  </div>
		  </div>
		  <!--Line 3-->
			<div style="width:187mm;font-size:7pt;float:left;">
			  <div class="styLNLeftNumBoxSD" style="height:4mm;">3</div>
			  <div class="styLNDesc" style="width:139.8mm;height:4mm;">
				<span style="float:left;">Subtract line 2e from line 1e. If zero or less, enter -0-</span>
				<span class="styBoldText" style="float:right;padding-right:10px;">
				  <xsl:call-template name="DotLoop">						
						<xsl:with-param name="DotQty" select="14"/>
					</xsl:call-template>			  
				</span>
			   </div>
			<div class="styLNRightNumBox" style="height:4.5mm;width:8mm;">3</div>
			  <div class="styLNAmountBox" style="height:4.5mm;width:31.2mm; ">
				<xsl:call-template name="PopulateAmount">
				  <xsl:with-param name="TargetNode" select="$FormData/TaxesLessCreditsAmt" />
				</xsl:call-template>     
			  </div>
		  </div>	
			<!--Line 4-->
			<div style="width:187mm;font-size:7pt;float:left;">
			  <div class="styLNLeftNumBoxSD" style="height:4mm;">4</div>
			  <div class="styLNDesc" style="width:139.8mm;height:4mm;">
				<span style="float:left;">Tax on the ESBT portion of the trust (from ESBT Tax Worksheet, line 17). See instructions
					<xsl:call-template name="SetFormLinkInline">
						<xsl:with-param name="TargetNode" select="$FormData/TotalESBTNIITAmt"/>
					</xsl:call-template>
					<xsl:call-template name="LinkToLeftoverDataTableInline">
						<xsl:with-param name="Desc">
							Line 4 - Tax on the ESBT portion of the trust - F1041 Total Tax Literal Cd
						</xsl:with-param>
						<xsl:with-param name="TargetNode" select="$FormData/TotalESBTNIITAmt/@F1041TotalTaxLiteralCd"/>
					</xsl:call-template>
				</span>
				<span class="styBoldText" style="float:right;padding-right:10px;">
				  <xsl:call-template name="DotLoop">						
						<xsl:with-param name="DotQty" select="3"/>
					</xsl:call-template>			  
				</span>
			   </div> 
			    <div class="styLNRightNumBox" style="height:4.5mm;width:8mm;">4</div>
			  <div class="styLNAmountBox" style="height:4.5mm;width:31.2mm; ">
				<xsl:call-template name="PopulateAmount">
				  <xsl:with-param name="TargetNode" select="$FormData/TotalESBTNIITAmt" />
				</xsl:call-template>     
			  </div>
		  </div>
		  <!--Line 5-->
			<div style="width:187mm;font-size:7pt;float:left;">
			  <div class="styLNLeftNumBoxSD" style="height:4mm;padding-top:1mm">5</div>
			  <div class="styLNDesc" style="width:139.8mm;height:4mm;">
				<span style="float:left;">Net investment income tax from Form 8960, line 21
					<xsl:call-template name="SetFormLinkInline">
						<xsl:with-param name="TargetNode" select="$FormData/EstTrustNetInvstIncomeTaxAmt"/>
					</xsl:call-template>	</span>
				<span class="styBoldText" style="float:right;padding-right:10px;">
				  <xsl:call-template name="DotLoop">						
						<xsl:with-param name="DotQty" select="14"/>
					</xsl:call-template>			  
				</span>
			   </div>
			<div class="styLNRightNumBox" style="height:4.5mm;width:8mm;">5</div>
			  <div class="styLNAmountBox" style="height:4.5mm;width:31.2mm; ">
				<xsl:call-template name="PopulateAmount">
				  <xsl:with-param name="TargetNode" select="$FormData/EstTrustNetInvstIncomeTaxAmt" />
				</xsl:call-template>     
			  </div>
		  </div>
		   <!--Line 6a-->
			<div style="width:187mm;font-size:7pt;float:left;">
			  <div class="styLNLeftNumBoxSD" style="height:4mm;">6a</div>
			  <div class="styLNDesc" style="width:139.8mm;height:5mm;">
				<span style="float:left;">Amount from Form 4255, Part I, line 3, column (r)
					<xsl:call-template name="SetFormLinkInline">
						<xsl:with-param name="TargetNode" select="$FormData/TotalNonChapter1TaxAmt"/>
					</xsl:call-template>	</span>
				<span class="styBoldText" style="float:right;padding-right:10px;">
				  <xsl:call-template name="DotLoop">						
						<xsl:with-param name="DotQty" select="14"/>
					</xsl:call-template>			  
				</span>
			   </div>
			<div class="styLNRightNumBox" style="height:5mm;width:8mm;">6a</div>
			  <div class="styLNAmountBox" style="height:5mm;width:31.2mm; ">
				<xsl:call-template name="PopulateAmount">
				  <xsl:with-param name="TargetNode" select="$FormData/TotalNonChapter1TaxAmt" />
				</xsl:call-template>     
			  </div>
		  </div>
		  <!--Line 6b-->
			<div style="width:187mm;font-size:7pt;float:left;">
			  <div class="styLNLeftNumBoxSD" style="height:4mm;padding-left:4mm;">b</div>
			  <div class="styLNDesc" style="width:139.8mm;height:5mm;">
				<span style="float:left;">Recapture tax from Form 8611
					<xsl:call-template name="SetFormLinkInline">
						<xsl:with-param name="TargetNode" select="$FormData/RecaptureTaxAmt"/>
					</xsl:call-template>	</span>
				<span class="styBoldText" style="float:right;padding-right:10px;">
				  <xsl:call-template name="DotLoop">						
						<xsl:with-param name="DotQty" select="20"/>
					</xsl:call-template>			  
				</span>
			   </div>
			<div class="styLNRightNumBox" style="height:5mm;width:8mm;">6b</div>
			  <div class="styLNAmountBox" style="height:5mm;width:31.2mm; ">
				<xsl:call-template name="PopulateAmount">
				  <xsl:with-param name="TargetNode" select="$FormData/RecaptureTaxAmt" />
				</xsl:call-template>     
			  </div>
		  </div>		  
		  <!--Line 6c-->
			<div style="width:187mm;font-size:7pt;float:left;">
			  <div class="styLNLeftNumBoxSD" style="height:4mm;padding-left:4mm;">c</div>
			  <div class="styLNDesc" style="width:139.8mm;height:5mm;">
				<span style="float:left;">Other recapture taxes
					<xsl:call-template name="LinkToLeftoverDataTableInline">
						<xsl:with-param name="Desc">Line 6c - Other recapture taxes</xsl:with-param>
						<xsl:with-param name="TargetNode" select="$FormData/RecaptureTaxCd" />
					</xsl:call-template>
				</span>
				<span class="styBoldText" style="float:right;padding-right:10px;">
				  <xsl:call-template name="DotLoop">						
						<xsl:with-param name="DotQty" select="22"/>
					</xsl:call-template>			  
				</span>
			   </div>
			<div class="styLNRightNumBox" style="height:5mm;width:8mm;">6c</div>
			  <div class="styLNAmountBox" style="height:5mm;width:31.2mm; ">
				<xsl:call-template name="PopulateAmount">
					<xsl:with-param name="TargetNode" select="$FormData/OtherRecaptureTaxesAmt" />
				</xsl:call-template>     			
			  </div>
		  </div>
		 
		  <!--Line 7-->
			<div style="width:187mm;font-size:7pt;float:left;">
			  <div class="styLNLeftNumBoxSD" style="height:5mm;padding-top:1mm">7</div>
			  <div class="styLNDesc" style="width:139.8mm;height:4mm;">
				<span style="float:left;">Household employment taxes. Attach Schedule H (Form 1040)
					<xsl:call-template name="SetFormLinkInline">
						<xsl:with-param name="TargetNode" select="$FormData/HouseholdEmploymentTaxAmt"/>
					</xsl:call-template>
				</span>
				<span class="styBoldText" style="float:right;padding-right:10px;">
				  <xsl:call-template name="DotLoop">						
						<xsl:with-param name="DotQty" select="11"/>
					</xsl:call-template>			  
				</span>
			   </div>
			<div class="styLNRightNumBox" style="height:5mm;width:8mm;padding-top:1mm">7</div>
			  <div class="styLNAmountBox" style="height:5mm;width:31.2mm;padding-top:1mm">
				<xsl:call-template name="PopulateAmount">
				  <xsl:with-param name="TargetNode" select="$FormData/HouseholdEmploymentTaxAmt" />
				</xsl:call-template>     
			  </div>
		  </div>
		  <!--Line 8-->
			<div style="width:187mm;font-size:7pt;float:left;">
			  <div class="styLNLeftNumBoxSD" style="height:4mm;">8</div>
			  <div class="styLNDesc" style="width:139.8mm;height:4mm;">
				<span style="float:left;">Other taxes and amounts due
					<xsl:call-template name="SetFormLinkInline">
						<xsl:with-param name="TargetNode" select="$FormData/OtherTaxDueAmt"/>
					</xsl:call-template>
					<xsl:call-template name="LinkToLeftoverDataTableInline">
						<xsl:with-param name="Desc">Line 8 Schedule G - Amount</xsl:with-param>
						<xsl:with-param name="TargetNode" select="$FormData/OtherTaxDueAmt/@form8978Amt" />				
					</xsl:call-template>
					<xsl:call-template name="LinkToLeftoverDataTableInline">
						<xsl:with-param name="Desc">Line 8 Schedule G - Form8978Cd</xsl:with-param>
						<xsl:with-param name="TargetNode" select="$FormData/OtherTaxDueAmt/@form8978Cd" />				
					</xsl:call-template>
				</span>
				<span class="styBoldText" style="float:right;padding-right:10px;">
				  <xsl:call-template name="DotLoop">						
						<xsl:with-param name="DotQty" select="19"/>
					</xsl:call-template>			  
				</span>
			   </div>
			   <div class="styLNRightNumBox" style="height:4.5mm;width:8mm;">8</div>
			  <div class="styLNAmountBox" style="height:4.5mm;width:31.2mm; ">
				<xsl:call-template name="PopulateAmount">
				  <xsl:with-param name="TargetNode" select="$FormData/OtherTaxDueAmt" />
				</xsl:call-template>
			  </div> 
			</div>
		  <!--Line 9-->
			<div style="width:187mm;font-size:7pt;float:left;">
			  <div class="styLNLeftNumBoxSD" style="height:4mm;">9</div>
			  <div class="styLNDesc" style="width:139.8mm;height:4mm;">
				<span style="float:left;"><b>Total tax.</b> Add lines 3 through 8. Enter here and on page 1, line 24
					<xsl:call-template name="SetFormLinkInline">
						<xsl:with-param name="TargetNode" select="$FormData/TotalTaxAmt"/>
					</xsl:call-template>
					<xsl:if test="count($FormData/F1041TotalTaxGrp) = 1">
					<xsl:call-template name="LinkToLeftoverDataTableInline">
						<xsl:with-param name="Desc">Line G-9 - Total Tax Literal Code</xsl:with-param>
						<xsl:with-param name="TargetNode" select="$FormData/F1041TotalTaxGrp/F1041TotalTaxLiteralCd" />				
					</xsl:call-template>
					<xsl:call-template name="LinkToLeftoverDataTableInline">
						<xsl:with-param name="Desc">Line G-9 - Total Tax Amount</xsl:with-param>
						<xsl:with-param name="TargetNode" select="$FormData/F1041TotalTaxGrp/TaxDueAmt" />				
					</xsl:call-template>
					</xsl:if>
					<xsl:if test="count($FormData/F1041TotalTaxGrp) &gt; 1">
					<xsl:call-template name="LinkToLeftoverDataTableInline">
						<xsl:with-param name="Desc">Line G-9 - Total Tax Literal Code and Amount</xsl:with-param>
						<xsl:with-param name="TargetNode" select="$FormData/F1041TotalTaxGrp" />				
					</xsl:call-template>
					</xsl:if>					
				</span>
				<span class="styBoldText" style="float:right;">
				  <xsl:call-template name="DotLoop">						
						<xsl:with-param name="DotQty" select="9"/>
					</xsl:call-template>			  
					<span style="width:5px;" />
				</span>
			   </div>
			<div class="styLNRightNumBox" style="height:4.5mm;width:8mm;border-bottom-width:0px;">9</div>
			  <div class="styLNAmountBox" style="height:4.5mm;width:31.2mm;border-bottom-width:0px;" >
			  <xsl:call-template name="PopulateAmount">
				  <xsl:with-param name="TargetNode" select="$FormData/TotalTaxAmt" />
				</xsl:call-template>
				</div>
		  </div>
		  <div class="styBB" style="width:187mm;border-top-width:0px;">			
		</div>
		<!-- page 2 footer -->
		<div class="pageEnd" style="width:187mm;">
			<span class="styBoldText" style="width:127mm;padding-top:.5mm;float:left;clear:none;font-size:6.5pt;"></span>
			<span class="styNormalText" style="padding-top:.5mm;float:left;clear:none;"></span>
			<span style="float:right;clear:none;">
               Form <span class="styBoldText" style="font-size:10pt;">1041</span> (2025)
            </span>
		</div>
		<!-- end page 2 footer -->	
		<p style="page-break-before: always"/>
		<!-- page 3 -->
		<div class="styBB" style="width:187mm;padding-top:.5mm;">
			<span class="" style="float:left;clear:none;">Form 1041 (2025)</span>
			<span style="float:right;clear:none;">Page <span class="styBoldText" style="font-size:8pt;">3</span>
			</span>
		</div> 
		<!-- Schedule G (continued) -->
		<div class="styBB" style="width:187mm;border-top-width:0.5px;">
			<div class="styPartName" style="width:22mm;text-align:center;height:4mm;padding-top:0mm;">Schedule G</div>
			<div class="styPartDesc" style="width:165mm;text-align:left;height:4mm;padding-top:0mm;padding-left:2mm;font-weight:normal;">
				<b>Tax Computation and Payments</b> (see instructions) <i>(continued)</i></div>
		</div>
		<!-- Part II - Payments-->
		<div class="styBB" style="width:187mm;border-top-width:1px;">			
			<div class="styPartDesc" style="width:167mm;text-align:left;height:4mm;padding-top:0mm;padding-left:0mm;">Part II - Payments</div>
			</div>
			<!-- 11/3/2021 AM: Line 10 NOW displays EstimatedTaxPaymentsAmt on the line and the Cd and amount is displayed additional data section -->
			<!--7/21/2020 AM: Know issue for lines 10-11, line 10 is supposed to display a Cd and/or 2 amounts and only one is displayed at a time; NO ENTRY for MeF for Line 11 -->
			<!--6/19/2019 AM: Schema for Line 10 has both Cd and Amt, but currently only displays one (Cd) and not the other.-->
			<!--Line 10-->
			<div style="width:187mm;font-size:7pt;float:left;">
			  <div class="styLNLeftNumBox" style="height:4mm;">10</div>
			  <div class="styLNDesc" style="width:139.8mm;height:4mm;">
				<span style="float:left;">Current year's estimated tax payments and amount applied from preceeding year's return
					<xsl:call-template name="LinkToLeftoverDataTableInline">
						<xsl:with-param name="Desc">Line 10 - Estimated Tax Credited To Trust Code</xsl:with-param>
						<xsl:with-param name="TargetNode" select="$FormData/EstimatedTaxCreditedToTrustGrp/EstimatedTaxCreditedToTrustCd" />
					</xsl:call-template>
					<xsl:call-template name="LinkToLeftoverDataTableInline">
						<xsl:with-param name="Desc">Line 10- Estimated Tax Credited To Trust Amount</xsl:with-param>
						<xsl:with-param name="TargetNode" select="$FormData/EstimatedTaxCreditedToTrustGrp/EstimatedTaxCreditedToTrustAmt" />
					</xsl:call-template>
				</span>
				<span class="styBoldText" style="float:right;padding-right:10px;">
				  <xsl:call-template name="DotLoop">						
						<xsl:with-param name="DotQty" select="3"/>
					</xsl:call-template>			  
				</span>
			   </div>			  
			<div class="styLNRightNumBox" style="height:4mm;width:8mm;">10</div>
			  <div class="styLNAmountBox" style="height:4mm;width:31.2mm;">
				<xsl:call-template name="PopulateAmount">
				  <xsl:with-param name="TargetNode" select="$FormData/EstimatedTaxPaymentsAmt" />
				</xsl:call-template>     
			  </div>
		  </div>
		  <!-- NO ENTRY for MeF for Line 11 -->
		  <!--Line 11-->
			<div style="width:187mm;font-size:7pt;float:left;">
			  <div class="styLNLeftNumBox" style="height:4mm;">11</div>
			  <div class="styLNDesc" style="width:139.8mm;height:4mm;">
				<span style="float:left;">Estimated tax payments allocated to beneficiaries (from Form 1041-T)</span>
				<span class="styBoldText" style="float:right;padding-right:10px;">
				  <xsl:call-template name="DotLoop">						
						<xsl:with-param name="DotQty" select="10"/>
					</xsl:call-template>			  
				</span>
			   </div>
			   <div class="styLNRightNumBox" style="height:4mm;width:8mm;">11</div>
			  <div class="styLNAmountBox" style="height:4mm;width:31.2mm; "></div>
		  </div>
		  <!--Line 12-->
			<div style="width:187mm;font-size:7pt;float:left;">
			  <div class="styLNLeftNumBox" style="height:4mm;">12</div>
			  <div class="styLNDesc" style="width:139.8mm;height:4mm;">
				<span style="float:left;">Subtract line 11 from line 10</span>
				<span class="styBoldText" style="float:right;padding-right:10px;">
				  <xsl:call-template name="DotLoop">						
						<xsl:with-param name="DotQty" select="22"/>
					</xsl:call-template>			  
				</span>
			   </div>
			<div class="styLNRightNumBox" style="height:4.5mm;width:8mm;">12</div>
			  <div class="styLNAmountBox" style="height:4.5mm;width:31.2mm; ">
				<xsl:call-template name="PopulateAmount">
				  <xsl:with-param name="TargetNode" select="$FormData/EstimatedTaxCreditAmt" />
				</xsl:call-template>     
			  </div>
		  </div>
		  <!--Line 13-->
			<div style="width:187mm;font-size:7pt;float:left;">
			  <div class="styLNLeftNumBox" style="height:4mm;">13</div>
			  <div class="styLNDesc" style="width:139.8mm;height:4mm;">
				<span style="float:left;">Tax paid with Form 7004. See instructions</span>
				<span class="styBoldText" style="float:right;padding-right:10px;">
				  <xsl:call-template name="DotLoop">						
						<xsl:with-param name="DotQty" select="18"/>
					</xsl:call-template>			  
				</span>
			   </div>
			<div class="styLNRightNumBox" style="height:4mm;width:8mm;">13</div>
			  <div class="styLNAmountBox" style="height:4mm;width:31.2mm; ">
				<xsl:call-template name="PopulateAmount">
				  <xsl:with-param name="TargetNode" select="$FormData/ExtsnRequestIncomeTaxPaidAmt" />
				</xsl:call-template>     
			  </div>
		  </div>
		  <!--Line 14-->
			<div style="width:187mm;font-size:7pt;float:left;">
			  <div class="styLNLeftNumBox" style="height:4mm;">14</div>
			  <div class="styLNDesc" style="width:139.8mm;height:4mm;">
				<span style="float:left;">Federal income tax withheld. If any is from Form(s) 1099, check here</span>
				<span style="float:left;">
					<label>
						<xsl:call-template name="PopulateLabel">
							<xsl:with-param name="TargetNode" select="$FormData/FederalIncomeTaxWthld1099Ind"/>
							<xsl:with-param name="BackupName">$FormDataFederalIncomeTaxWthld1099Ind</xsl:with-param>
						</xsl:call-template>										 
						<input class="styCkbox" aria-label="FederalIncomeTaxWthld1099" type="checkbox" style="width:4mm;">
							<xsl:call-template name="PopulateCheckbox">
								<xsl:with-param name="TargetNode" select="$FormData/FederalIncomeTaxWthld1099Ind"/>
								<xsl:with-param name="BackupName">$FormDataFederalIncomeTaxWthld1099Ind</xsl:with-param>
							</xsl:call-template>
						</input>									
					</label>
					<xsl:call-template name="SetFormLinkInline">
						<xsl:with-param name="TargetNode" select="$FormData/FederalIncomeTaxWithheldAmt"/>
					</xsl:call-template>
				</span>
				<span class="styBoldText" style="float:right;padding-right:10px;">
				  <xsl:call-template name="DotLoop">						
						<xsl:with-param name="DotQty" select="8"/>
					</xsl:call-template>			  
				</span>
			   </div>
			<div class="styLNRightNumBox" style="height:4mm;width:8mm;border-bottom-width:1px;">14</div>
			  <div class="styLNAmountBox" style="border-bottom-width:1px;height:4mm;width:31.2mm; ">
				<xsl:call-template name="PopulateAmount">
				  <xsl:with-param name="TargetNode" select="$FormData/FederalIncomeTaxWithheldAmt" />
				</xsl:call-template>     
			  </div>
		  </div>
		  <!--Line 15-->
			<div style="width:187mm;font-size:7pt;float:left;">
			  <div class="styLNLeftNumBox" style="height:4mm;">15</div>
			  <div class="styLNDesc" style="width:139.8mm;height:4mm;">
				<span style="float:left;">Current year net 965 tax liability from Form 965-A, Part I, column (f) (see instruction) </span>
				<span class="styBoldText" style="float:right;padding-right:10px;">	
					<xsl:call-template name="DotLoop">						
						<xsl:with-param name="DotQty" select="6"/>
					</xsl:call-template>	
				</span>
			   </div>
			<div class="styLNRightNumBox" style="height:4mm;width:8mm;border-bottom-width:1px;">15</div>
			  <div class="styLNAmountBox" style="border-bottom-width:1px;height:4mm;width:31.2mm; ">
				<xsl:call-template name="PopulateAmount">
				  <xsl:with-param name="TargetNode" select="$FormData/InstallmentPaymentElectionAmt" />
				</xsl:call-template>     
			  </div>
		  </div>		  
		   <!--Line 16-->
			<div style="width:187mm;font-size:7pt;float:left;">
			  <div class="styLNLeftNumBox" style="height:4mm;">16</div>
			  <div class="styLNDesc" style="width:139.8mm;height:5mm;">
				<span style="float:left;">Payments from Form 2439
					<xsl:call-template name="SetFormLinkInline">
						<xsl:with-param name="TargetNode" select="$FormData/TaxPaidByRICOrREITAmt"/>
					</xsl:call-template>	</span>
				<span class="styBoldText" style="float:right;padding-right:10px;">
				  <xsl:call-template name="DotLoop">						
						<xsl:with-param name="DotQty" select="21"/>
					</xsl:call-template>			  
				</span>
			   </div>
			<div class="styLNRightNumBox" style="height:5mm;width:8mm;">16</div>
			  <div class="styLNAmountBox" style="height:5mm;width:31.2mm; ">
				<xsl:call-template name="PopulateAmount">
				  <xsl:with-param name="TargetNode" select="$FormData/TaxPaidByRICOrREITAmt" />
				</xsl:call-template>     
			  </div>
		  </div>		  
		  <!--Line 17-->
			<div style="width:187mm;font-size:7pt;float:left;">
			  <div class="styLNLeftNumBox" style="height:4mm;">17</div>
			  <div class="styLNDesc" style="width:139.8mm;height:5mm;">
				<span style="float:left;">Payments from Form 4136
					<xsl:call-template name="SetFormLinkInline">
						<xsl:with-param name="TargetNode" select="$FormData/TotalFuelTaxCreditAmt"/>
					</xsl:call-template>	</span>
				<span class="styBoldText" style="float:right;padding-right:10px;">
				  <xsl:call-template name="DotLoop">						
						<xsl:with-param name="DotQty" select="21"/>
					</xsl:call-template>			  
				</span>
			   </div>
			<div class="styLNRightNumBox" style="height:5mm;width:8mm;">17</div>
			  <div class="styLNAmountBox" style="height:5mm;width:31.2mm; ">
				<xsl:call-template name="PopulateAmount">
				  <xsl:with-param name="TargetNode" select="$FormData/TotalFuelTaxCreditAmt" />
				</xsl:call-template>     
			  </div>
		  </div>		  
		   <!--Line 18a-->
			<div style="width:187mm;font-size:7pt;float:left;">
			  <div class="styLNLeftNumBox" style="height:4mm;">18a</div>
			  <div class="styLNDesc" style="width:139.8mm;height:5mm;">
				<span style="float:left;">Elective payment election amount from Form 3800
					<xsl:call-template name="SetFormLinkInline">
						<xsl:with-param name="TargetNode" select="$FormData/ElectivePaymentAmt"/>
					</xsl:call-template>	</span>
				<span class="styBoldText" style="float:right;padding-right:10px;">
				  <xsl:call-template name="DotLoop">						
						<xsl:with-param name="DotQty" select="15"/>
					</xsl:call-template>			  
				</span>
			   </div>
			<div class="styLNRightNumBox" style="height:5mm;width:8mm;">18a</div>
			  <div class="styLNAmountBox" style="height:5mm;width:31.2mm; ">
				<xsl:call-template name="PopulateAmount">
				  <xsl:with-param name="TargetNode" select="$FormData/ElectivePaymentAmt" />
				</xsl:call-template>     
			  </div>
		  </div>		   
		   <!--Line 18b-->
			<div style="width:187mm;font-size:7pt;float:left;">
			  <div class="styLNLeftNumBox" style="height:4mm;padding-left:4.5mm;">b</div>
			  <div class="styLNDesc" style="width:139.8mm;height:4mm;">
				<span style="float:left;">Other credits or payments (see instructions) </span>
				<span class="styBoldText" style="float:right;padding-right:10px;">	
				<xsl:call-template name="DotLoop">						
					<xsl:with-param name="DotQty" select="17"/>
				</xsl:call-template>	
				</span>
			   </div>
			<div class="styLNRightNumBox" style="height:4mm;width:8mm;border-bottom-width:1px;">18b</div>
			  <div class="styLNAmountBox" style="border-bottom-width:1px;height:4mm;width:31.2mm; ">
				<xsl:call-template name="PopulateAmount">
				  <xsl:with-param name="TargetNode" select="$FormData/OtherCreditsPaymentsAmt" />
				</xsl:call-template>     
			  </div>
		  </div>
		   <!--Line 18c-->
			<div style="width:187mm;font-size:7pt;float:left;">
			  <div class="styLNLeftNumBox" style="height:4mm;padding-left:4.5mm;">c</div>
			  <div class="styLNDesc" style="width:139.8mm;height:4mm;">
				<span style="float:left;">Section 1062 applicable net tax liability. Enter amount from Form 1062, line 14
</span>
				<span class="styBoldText" style="float:right;padding-right:10px;">	
				<xsl:call-template name="DotLoop">						
					<xsl:with-param name="DotQty" select="8"/>
				</xsl:call-template>	
				</span>
			   </div>
			<div class="styLNRightNumBox" style="height:4mm;width:8mm;border-bottom-width:1px;">18c</div>
			  <div class="styLNAmountBox" style="border-bottom-width:1px;height:4mm;width:31.2mm; ">
				<xsl:call-template name="PopulateAmount">
				  <xsl:with-param name="TargetNode" select="$FormData/TotalLiabilitySect1062TaxAmt" />
				</xsl:call-template>     
			  </div>
		  </div>
		<!--Line 19-->
		<div style="width:187mm;font-size:7pt;float:left;">
			<div class="styLNLeftNumBox" style="height:7mm;">19</div>
			<div class="styLNDesc" style="width:139.8mm;height:7mm;">
				<span style="float:left;font-size:7pt"><b>Total payments and section 1062 net tax liability deferred.</b> Add lines 12 through 18c. Enter here and on </span>
				<span style="float:left;font-size:7pt">page 1, line 26</span>
				<span class="styBoldText" style="float:right;padding-right:10px;">
					<xsl:call-template name="DotLoop">						
						<xsl:with-param name="DotQty" select="25"/>
					</xsl:call-template>			  
				</span>
			</div>
			<div class="styLNRightNumBox" style="height:7mm;width:8mm;padding-top:4mm;border-bottom-width:0px;">19</div>
			<div class="styLNAmountBox" style="height:7mm;width:31.2mm;padding-top:4mm;border-bottom-width:0px;">
				<xsl:call-template name="PopulateAmount">
					<xsl:with-param name="TargetNode" select="$FormData/TotalPaymentsAmt" />
				</xsl:call-template>     
			</div>
		</div>
		<!-- Other Information-->
		<div class="styBB" style="width:187mm;border-top-width:1px;">			
			<div class="styPartDesc" style="width:167mm;text-align:left;height:4mm;padding-top:0mm;padding-left:0mm;">Other Information</div>
			<div class="styPartDesc" style="width:10mm;text-align:center;height:4mm;padding:0mm;border-left:1px solid black;">Yes</div>
			<div class="styPartDesc" style="width:10mm;text-align:center;height:4mm;padding:0mm;border-left:1px solid black;">No</div>
		</div>
		<!--Line 1-->
			<div style="width:187mm;font-size:7pt;float:left;">
			  <div class="styLNLeftNumBoxSD" style="height:4mm;">1</div>
			  <div class="styLNDesc" style="width:159mm;height:4mm;">
				<span style="float:left;">Did the estate or trust receive tax-exempt income? If “Yes,” attach a computation of the allocation of expenses.
				<xsl:call-template name="SetFormLinkInline">
					<xsl:with-param name="TargetNode" select="$FormData/TaxExemptIncomeInd"/>
				</xsl:call-template>
				</span>
				<span class="styBoldText" style="float:right;padding-right:10px;">
				  <xsl:call-template name="DotLoop">						
						<xsl:with-param name="DotQty" select="0"/>
					</xsl:call-template>	
				</span>
			   </div>
			<div class="styPartDesc" style="width:10mm;text-align:center;height:4.5mm;padding:0mm;border-left:1px solid black;border-bottom:1px solid black;">
				<!-- Checkbox -->
				<xsl:call-template name="PopulateSpan">
					<xsl:with-param name="TargetNode" select="$FormData/TaxExemptIncomeInd"/>
				</xsl:call-template>
				<input type="Checkbox" aria-label="TaxExemptIncomeYes" class="styCkbox">
					<xsl:call-template name="PopulateYesCheckbox">
						<xsl:with-param name="TargetNode" select="$FormData/TaxExemptIncomeInd"/>
						<xsl:with-param name="BackupName">IRS1041TaxExemptIncomeInd</xsl:with-param>
					</xsl:call-template>
				</input>
				<label>
					<xsl:call-template name="PopulateLabelYes">
						<xsl:with-param name="TargetNode" select="$FormData/TaxExemptIncomeInd"/>
						<xsl:with-param name="BackupName">IRS1041TaxExemptIncomeInd</xsl:with-param>
					</xsl:call-template>												
                </label>
			</div>
			<div class="styPartDesc" style="width:10mm;text-align:center;height:4.5mm;padding:0mm;border-left:1px solid black;border-bottom:1px solid black;">
				<!-- Checkbox -->
				<xsl:call-template name="PopulateSpan">
					<xsl:with-param name="TargetNode" select="$FormData/TaxExemptIncomeInd"/>
				</xsl:call-template>
				<input type="Checkbox" aria-label="TaxExemptIncomeNo" class="styCkbox">
					<xsl:call-template name="PopulateNoCheckbox">
						<xsl:with-param name="TargetNode" select="$FormData/TaxExemptIncomeInd"/>
						<xsl:with-param name="BackupName">IRS1041TaxExemptIncomeInd</xsl:with-param>
					</xsl:call-template>
				</input>
				<label>
					<xsl:call-template name="PopulateLabelNo">
						<xsl:with-param name="TargetNode" select="$FormData/TaxExemptIncomeInd"/>
						<xsl:with-param name="BackupName">IRS1041TaxExemptIncomeInd</xsl:with-param>
					</xsl:call-template>												
                </label>
			</div>
		  </div>
		  <!--Line 1 Amount-->
			<div style="width:187mm;font-size:7pt;float:left;">
			  <div class="styLNLeftNumBoxSD" style="height:4mm;"></div>
			  <div class="styLNDesc" style="width:159mm;height:4mm;">
				<span style="float:left;padding-right:1mm">Enter the amount of tax-exempt interest income and exempt-interest dividends</span>
				<span style="width:5px;float:left;" /><span style="float:left;"><!--<img src="{$ImagePath}/1040_Bullet.gif" alt="Right pointing arrowhead image"/>--></span>
				<span style="width:5px;padding:.5mm;float:left;" /><span style="float:left;">$</span><span style="width:5px;float:left;" />
				<span style="border-bottom:1px dashed;padding-left:1mm;height:3mm;width:45mm;">
					<xsl:call-template name="PopulateAmount">
					  <xsl:with-param name="TargetNode" select="$FormData/TaxExemptInterestAmt" />
					</xsl:call-template>     
				</span>								
			   </div>
			<div class="styPartDesc" style="width:10mm;text-align:center;height:4.4mm;padding:0mm;border-left:1px solid black;background-color:lightgray;" />
			<div class="styPartDesc" style="width:10mm;text-align:center;height:4.4mm;padding:0mm;border-left:1px solid black;background-color:lightgray;" />
		  </div>
		  <!--Line 2 (1)-->
			<div style="width:187mm;font-size:7pt;float:left;">
			  <div class="styLNLeftNumBoxSD" style="height:4mm;">2</div>
			  <div class="styLNDesc" style="width:159mm;height:4mm;">
				<span style="float:left;">Did the estate or trust receive all or any part of the earnings (salary, wages, and other compensation) of any</span>
				<span class="styBoldText" style="float:right;padding-right:10px;">
				  <xsl:call-template name="DotLoop">						
						<xsl:with-param name="DotQty" select="0"/>
					</xsl:call-template>	
				</span>
			   </div>
			<div class="styPartDesc" style="width:10mm;text-align:center;height:4.2mm;padding:0mm;border-left:1px solid black;background-color:lightgray;" />
			<div class="styPartDesc" style="width:10mm;text-align:center;height:4.2mm;padding:0mm;border-left:1px solid black;background-color:lightgray;" />			
		  </div>
		  <!--Line 2 (2)-->
			<div style="width:187mm;font-size:7pt;float:left;">
			  <div class="styLNLeftNumBoxSD" style="height:4mm;"></div>
			  <div class="styLNDesc" style="width:159mm;height:4mm;">
				<span style="float:left;">individual by reason of a contract assignment or similar arrangement?</span>
				<span class="styBoldText" style="float:right;padding-right:10px;">
				  <xsl:call-template name="DotLoop">						
						<xsl:with-param name="DotQty" select="15"/>
					</xsl:call-template>	
				</span>
			   </div>
			<div class="styPartDesc" style="width:10mm;text-align:center;height:4.2mm;padding:0mm;border-left:1px solid black;border-bottom:1px solid black;">
				<!-- Checkbox -->
				<xsl:call-template name="PopulateSpan">
					<xsl:with-param name="TargetNode" select="$FormData/IndividualEarningsInd"/>
				</xsl:call-template>
				<input type="Checkbox" aria-label="IndividualEarningsYes" class="styCkbox">
					<xsl:call-template name="PopulateYesCheckbox">
						<xsl:with-param name="TargetNode" select="$FormData/IndividualEarningsInd"/>
						<xsl:with-param name="BackupName">IRS1041IndividualEarningsInd</xsl:with-param>
					</xsl:call-template>
				</input>
				<label>
					<xsl:call-template name="PopulateLabelYes">
						<xsl:with-param name="TargetNode" select="$FormData/IndividualEarningsInd"/>
						<xsl:with-param name="BackupName">IRS1041IndividualEarningsInd</xsl:with-param>
					</xsl:call-template>												
                </label>
			</div>
			<div class="styPartDesc" style="width:10mm;text-align:center;height:4.2mm;padding:0mm;border-left:1px solid black;border-bottom:1px solid black;">
				<!-- Checkbox -->
				<xsl:call-template name="PopulateSpan">
					<xsl:with-param name="TargetNode" select="$FormData/IndividualEarningsInd"/>
				</xsl:call-template>
				<input type="Checkbox" aria-label="IndividualEarningsNo" class="styCkbox">
					<xsl:call-template name="PopulateNoCheckbox">
						<xsl:with-param name="TargetNode" select="$FormData/IndividualEarningsInd"/>
						<xsl:with-param name="BackupName">IRS101IndividualEarningsInd</xsl:with-param>
					</xsl:call-template>
				</input>
				<label>
					<xsl:call-template name="PopulateLabelNo">
						<xsl:with-param name="TargetNode" select="$FormData/IndividualEarningsInd"/>
						<xsl:with-param name="BackupName">IRS1041IndividualEarningsInd</xsl:with-param>
					</xsl:call-template>												
                </label>
			</div>
		  </div>
		  <!--Line 3 (1)-->
			<div style="width:187mm;font-size:7pt;float:left;">
			  <div class="styLNLeftNumBoxSD" style="height:4mm;">3</div>
			  <div class="styLNDesc" style="width:159mm;height:4mm;">
				<span style="float:left;width:158.9mm;height:auto;">At any time during calendar year 2025, did the estate or trust have an interest in or a signature or other authority</span>
				<span style="float:left;">over a bank, securities, or other financial account in a foreign country?</span>
				<span class="styBoldText" style="float:right;padding-right:10px;">
				  <xsl:call-template name="DotLoop">						
						<xsl:with-param name="DotQty" select="14"/>
					</xsl:call-template>	
				</span>
			   </div>
			<div class="styPartDesc" style="width:10mm;text-align:center;height:7.6mm;padding:0mm;padding-top:3mm;border-left:1px solid black;border-bottom:1px solid black;">
				<!-- Checkbox -->
				<!--<br />-->
				<xsl:call-template name="PopulateSpan">
					<xsl:with-param name="TargetNode" select="$FormData/ForeignAccountsQuestionInd"/>
				</xsl:call-template>
				<input type="Checkbox" aria-label="ForeignAccountsQuestionYes" class="styCkbox">
					<xsl:call-template name="PopulateYesCheckbox">
						<xsl:with-param name="TargetNode" select="$FormData/ForeignAccountsQuestionInd"/>
						<xsl:with-param name="BackupName">IRS1041ForeignAccountsQuestionInd</xsl:with-param>
					</xsl:call-template>
				</input>
				<label>
					<xsl:call-template name="PopulateLabelYes">
						<xsl:with-param name="TargetNode" select="$FormData/ForeignAccountsQuestionInd"/>
						<xsl:with-param name="BackupName">IRS1041ForeignAccountsQuestionInd</xsl:with-param>
					</xsl:call-template>												
                </label>
			</div>
			<div class="styPartDesc" style="width:10mm;text-align:center;height:7.6mm;padding:0mm;padding-top:3mm;border-left:1px solid black;border-bottom:1px solid black;">
				<!-- Checkbox -->
				<xsl:call-template name="PopulateSpan">
					<xsl:with-param name="TargetNode" select="$FormData/ForeignAccountsQuestionInd"/>
				</xsl:call-template>
				<input type="Checkbox" aria-label="ForeignAccountsQuestionNo" class="styCkbox">
					<xsl:call-template name="PopulateNoCheckbox">
						<xsl:with-param name="TargetNode" select="$FormData/ForeignAccountsQuestionInd"/>
						<xsl:with-param name="BackupName">IRS1041ForeignAccountsQuestionInd</xsl:with-param>
					</xsl:call-template>
				</input>
				<label>
					<xsl:call-template name="PopulateLabelNo">
						<xsl:with-param name="TargetNode" select="$FormData/ForeignAccountsQuestionInd"/>
						<xsl:with-param name="BackupName">IRS1041ForeignAccountsQuestionInd</xsl:with-param>
					</xsl:call-template>												
                </label>
			</div>
		  </div>
		  <!--Line 3 (2)-->
			<div style="width:187mm;font-size:7pt;float:left;">
			  <div class="styLNLeftNumBoxSD" style="height:4mm;"></div>
			  <div class="styLNDesc" style="width:159mm;height:4mm;">
				<span style="float:left;width:158.9mm;">See the instructions for exceptions and filing requirements for FinCEN Form 114. If “Yes,” enter the name of the</span>
				<span style="float:left;padding-right:1mm">foreign country</span>
				<span style="width:5px;float:left;" /><span style="float:left;"><!--<img src="{$ImagePath}/1040_Bullet.gif" alt="Right pointing arrowhead image"/>--></span>
				<span style="width:5px;float:left;" />
				<span style="border-bottom:1px dashed;float:left;height:3mm;width:125mm;">
					<xsl:call-template name="LinkToLeftoverDataTableInline">
						<xsl:with-param name="Desc">Other Information - Line 3 - Foreign Country Name</xsl:with-param>
						<xsl:with-param name="TargetNode" select="$FormData/ForeignCountryCd" />
					</xsl:call-template>   
				</span>
			   </div>
			<div class="styPartDesc" style="width:10mm;text-align:center;height:8.2mm;padding:0mm;border-left:1px solid black;background-color:lightgray;" />
			<div class="styPartDesc" style="width:10mm;text-align:center;height:8.2mm;padding:0mm;border-left:1px solid black;background-color:lightgray;" />
		</div>
		 <!--Line 4-->
			<div style="width:187mm;font-size:7pt;float:left;">
			  <div class="styLNLeftNumBoxSD" style="height:4mm;">4</div>
			  <div class="styLNDesc" style="width:159mm;height:4mm;">
				<span style="float:left;width:158.9mm;">During the tax year, did the estate or trust receive a distribution from, or was it the grantor of, or transferor to, a</span>
				<span style="float:left;">foreign trust? If “Yes,” the estate or trust may have to file Form 3520. See instructions</span>
				<span class="styBoldText" style="float:right;padding-right:10px;">
				  <xsl:call-template name="DotLoop">						
						<xsl:with-param name="DotQty" select="10"/>
					</xsl:call-template>	
				</span>
			   </div>
			<div class="styPartDesc" style="width:10mm;text-align:center;height:7.6mm;padding:0mm;padding-top:3mm;border-left:1px solid black;border-bottom:1px solid black;">
				<!-- Checkbox -->
				<!--<br />-->
				<xsl:call-template name="PopulateSpan">
					<xsl:with-param name="TargetNode" select="$FormData/ForeignTrustInd"/>
				</xsl:call-template>
				<input type="Checkbox" aria-label="ForeignTrustYes" class="styCkbox">
					<xsl:call-template name="PopulateYesCheckbox">
						<xsl:with-param name="TargetNode" select="$FormData/ForeignTrustInd"/>
						<xsl:with-param name="BackupName">IRS1041ForeignTrustInd</xsl:with-param>
					</xsl:call-template>
				</input>
				<label>
					<xsl:call-template name="PopulateLabelYes">
						<xsl:with-param name="TargetNode" select="$FormData/ForeignTrustInd"/>
						<xsl:with-param name="BackupName">IRS1041ForeignTrustInd</xsl:with-param>
					</xsl:call-template>												
                </label>
			</div>
			<div class="styPartDesc" style="width:10mm;text-align:center;height:7.6mm;padding:0mm;padding-top:3mm;border-left:1px solid black;border-bottom:1px solid black;">
				<!-- Checkbox -->
				<!--<br />-->
				<xsl:call-template name="PopulateSpan">
					<xsl:with-param name="TargetNode" select="$FormData/ForeignTrustInd"/>
				</xsl:call-template>
				<input type="Checkbox" aria-label="ForeignTrustNo" class="styCkbox">
					<xsl:call-template name="PopulateNoCheckbox">
						<xsl:with-param name="TargetNode" select="$FormData/ForeignTrustInd"/>
						<xsl:with-param name="BackupName">IRS1041ForeignTrustInd</xsl:with-param>
					</xsl:call-template>
				</input>
				<label>
					<xsl:call-template name="PopulateLabelNo">
						<xsl:with-param name="TargetNode" select="$FormData/ForeignTrustInd"/>
						<xsl:with-param name="BackupName">IRS1041ForeignTrustInd</xsl:with-param>
					</xsl:call-template>												
                </label>
			</div>
		  </div>
		  <!--Line 5-->
			<div style="width:187mm;font-size:7pt;float:left;">
			  <div class="styLNLeftNumBoxSD" style="height:4mm;">5</div>
			  <div class="styLNDesc" style="width:159mm;height:4mm;">
				<span style="float:left;width:158.9mm;">Did the estate or trust receive, or pay, any qualified residence interest on seller-provided financing? If “Yes,” see</span>
				<span style="float:left;">the instructions for required attachment
					<xsl:call-template name="SetFormLinkInline">
						<xsl:with-param name="TargetNode" select="$FormData/SellerFinancedMortgageInd"/>
					</xsl:call-template>
				</span>
				<span class="styBoldText" style="float:right;padding-right:10px;">
				  <xsl:call-template name="DotLoop">						
						<xsl:with-param name="DotQty" select="22"/>
					</xsl:call-template>	
				</span>
			   </div>
			<div class="styPartDesc" style="width:10mm;text-align:center;height:7.6mm;padding:0mm;padding-top:3mm;border-left:1px solid black;border-bottom:1px solid black;">
				<!-- Checkbox -->
				<xsl:call-template name="PopulateSpan">
					<xsl:with-param name="TargetNode" select="$FormData/SellerFinancedMortgageInd"/>
				</xsl:call-template>
				<input type="Checkbox" aria-label="SellerFinancedMortgageYes" class="styCkbox">
					<xsl:call-template name="PopulateYesCheckbox">
						<xsl:with-param name="TargetNode" select="$FormData/SellerFinancedMortgageInd"/>
						<xsl:with-param name="BackupName">IRS1041SellerFinancedMortgageInd</xsl:with-param>
					</xsl:call-template>
				</input>
				<label>
					<xsl:call-template name="PopulateLabelYes">
						<xsl:with-param name="TargetNode" select="$FormData/SellerFinancedMortgageInd"/>
						<xsl:with-param name="BackupName">IRS1041SellerFinancedMortgageInd</xsl:with-param>
					</xsl:call-template>												
                </label>
			</div>
			<div class="styPartDesc" style="width:10mm;text-align:center;height:7.6mm;padding:0mm;padding-top:3mm;border-left:1px solid black;border-bottom:1px solid black;">
				<!-- Checkbox -->
				<xsl:call-template name="PopulateSpan">
					<xsl:with-param name="TargetNode" select="$FormData/SellerFinancedMortgageInd"/>
				</xsl:call-template>
				<input type="Checkbox" aria-label="SellerFinancedMortgageNo" class="styCkbox">
					<xsl:call-template name="PopulateNoCheckbox">
						<xsl:with-param name="TargetNode" select="$FormData/SellerFinancedMortgageInd"/>
						<xsl:with-param name="BackupName">IRS1041SellerFinancedMortgageInd</xsl:with-param>
					</xsl:call-template>
				</input>
				<label>
					<xsl:call-template name="PopulateLabelNo">
						<xsl:with-param name="TargetNode" select="$FormData/SellerFinancedMortgageInd"/>
						<xsl:with-param name="BackupName">IRS1041SellerFinancedMortgageInd</xsl:with-param>
					</xsl:call-template>												
                </label>
			</div>
		  </div>
		  <!--Line 6-->
			<div style="width:187mm;font-size:7pt;float:left;">
			  <div class="styLNLeftNumBoxSD" style="height:4mm;">6</div>
			  <div class="styLNDesc" style="width:159mm;height:4mm;">
				<span style="float:left;">If this is an estate or a complex trust making the section 663(b) election, check here. See instructions</span>
				<span class="styBoldText" style="float:right;padding-right:10px;">
				  <xsl:call-template name="DotLoop">						
						<xsl:with-param name="DotQty" select="4"/>
					</xsl:call-template>
					<span style="width:5px;" /><span style=""><!--<img src="{$ImagePath}/1040_Bullet.gif" alt="Right pointing arrowhead image"/>--></span>
				<span style="width:5px;" />
				<span style="">
				<!-- Checkbox -->
				<input type="Checkbox" aria-label="EstateOrTrust663bElection" class="styCkbox">
					<xsl:call-template name="PopulateCheckbox">
						<xsl:with-param name="TargetNode" select="$FormData/EstateOrTrust663bElectionInd"/>
						<xsl:with-param name="BackupName">IRS1041EstateOrTrust663bElectionInd</xsl:with-param>
					</xsl:call-template>
				</input>
				<label>
					<xsl:call-template name="PopulateLabel">
						<xsl:with-param name="TargetNode" select="$FormData/EstateOrTrust663bElectionInd"/>
						<xsl:with-param name="BackupName">IRS1041EstateOrTrust663bElectionInd</xsl:with-param>
					</xsl:call-template>												
                </label>
				</span>
				</span>
			   </div>
			<div class="styPartDesc" style="width:10mm;text-align:center;height:4.2mm;padding:0mm;border-left:1px solid black;background-color:lightgray;" />
			<div class="styPartDesc" style="width:10mm;text-align:center;height:4.2mm;padding:0mm;border-left:1px solid black;background-color:lightgray;" />			
		  </div>
		  <!--Line 7-->
			<div style="width:187mm;font-size:7pt;float:left;">
			  <div class="styLNLeftNumBoxSD" style="height:4mm;">7</div>
			  <div class="styLNDesc" style="width:159mm;height:4mm;">
				<span style="float:left;">To make a section 643(e)(3) election, attach Schedule D (Form 1041), and check here. See instructions
				<xsl:call-template name="SetFormLinkInline">
					<xsl:with-param name="TargetNode" select="$FormData/Section643e3Ind"/>
				</xsl:call-template>
				</span>
				<span class="styBoldText" style="float:right;padding-right:10px;">
				  <xsl:call-template name="DotLoop">						
						<xsl:with-param name="DotQty" select="3"/>
					</xsl:call-template>
				
				<span style="width:5px;" /><span style=""><!--<img src="{$ImagePath}/1040_Bullet.gif" alt="Right pointing arrowhead image"/>--></span>
				<span style="width:5px;" />
				<span style="">
				<!-- Checkbox -->
				<input type="Checkbox" aria-label="Section643e3" class="styCkbox">
					<xsl:call-template name="PopulateCheckbox">
						<xsl:with-param name="TargetNode" select="$FormData/Section643e3Ind"/>
						<xsl:with-param name="BackupName">IRS1041Section643e3Ind</xsl:with-param>
					</xsl:call-template>
				</input>
				<label>
					<xsl:call-template name="PopulateLabel">
						<xsl:with-param name="TargetNode" select="$FormData/Section643e3Ind"/>
						<xsl:with-param name="BackupName">IRS1041Section643e3Ind</xsl:with-param>
					</xsl:call-template>												
                </label>
				</span>
				</span>
			   </div>
			<div class="styPartDesc" style="width:10mm;text-align:center;height:4.5mm;padding:0mm;border-left:1px solid black;background-color:lightgray;" />
			<div class="styPartDesc" style="width:10mm;text-align:center;height:4.5mm;padding:0mm;border-left:1px solid black;background-color:lightgray;" />			
		  </div>
		  <!--Line 8(1)-->
			<div style="width:187mm;font-size:7pt;float:left;">
			  <div class="styLNLeftNumBoxSD" style="height:4mm;padding-top:1mm;">8</div>
			  <div class="styLNDesc" style="width:159mm;height:4mm;padding-top:1mm;padding-bottom:0mm;font-family:arial narrow;font-size:8.5pt;">
				<span style="float:left;">If the decedent’s estate has been open for more than 2 years, attach an explanation for the delay in closing the estate,
				 and check here</span>
				 <span style="float:right;padding-right:2.5mm">
				<!-- Checkbox -->
				<input type="Checkbox" aria-label="DecedentEstate2Years" class="styCkbox">
					<xsl:call-template name="PopulateCheckbox">
						<xsl:with-param name="TargetNode" select="$FormData/DecedentEstate2YearsInd"/>
						<xsl:with-param name="BackupName">IRS1041DecedentEstate2YearsInd</xsl:with-param>
					</xsl:call-template>
				</input>
				<label>
					<xsl:call-template name="PopulateLabel">
						<xsl:with-param name="TargetNode" select="$FormData/DecedentEstate2YearsInd"/>
						<xsl:with-param name="BackupName">IRS1041DecedentEstate2YearsInd</xsl:with-param>
					</xsl:call-template>												
                </label>
				</span>
			   </div>
			<div class="styPartDesc" style="width:10mm;text-align:center;height:5mm;padding:0mm;border-left:1px solid black;background-color:lightgray;" />
			<div class="styPartDesc" style="width:10mm;text-align:center;height:5mm;padding:0mm;border-left:1px solid black;background-color:lightgray;" />			
		  </div>
		  <!-- 11/1/2017 AM: Inserted PopulateSpan for Yes and No checkboxes for Lines 9 and 10 per Defect 125592 - XPath issue (Checkboxes weren't being highlghted in RRD)-->
		  <!--Line 9-->
			<div style="width:187mm;font-size:7pt;float:left;">
			  <div class="styLNLeftNumBoxSD" style="height:4mm;">9</div>
			  <div class="styLNDesc" style="width:159mm;height:4mm;">
				<span style="float:left;">Are any present or future trust beneficiaries skip persons? See instructions</span>
				<span class="styBoldText" style="float:right;padding-right:10px;">
				  <xsl:call-template name="DotLoop">						
						<xsl:with-param name="DotQty" select="13"/>
					</xsl:call-template>	
				</span>
			   </div>
			<div class="styPartDesc" style="width:10mm;text-align:center;height:4.2mm;padding:0mm;border-left:1px solid black;border-bottom:1px solid black;">
				<xsl:call-template name="PopulateSpan">
					<xsl:with-param name="TargetNode" select="$FormData/TrustBeneficiariesSkipInd"/>
				</xsl:call-template>
				<!-- Checkbox -->
				<input type="Checkbox" aria-label="TrustBeneficiariesSkipYes" class="styCkbox">
					<xsl:call-template name="PopulateYesCheckbox">
						<xsl:with-param name="TargetNode" select="$FormData/TrustBeneficiariesSkipInd"/>
						<xsl:with-param name="BackupName">IRS1041TrustBeneficiariesSkipInd</xsl:with-param>
					</xsl:call-template>
				</input>
				<label>
					<xsl:call-template name="PopulateLabelYes">
						<xsl:with-param name="TargetNode" select="$FormData/TrustBeneficiariesSkipInd"/>
						<xsl:with-param name="BackupName">IRS1041TrustBeneficiariesSkipInd</xsl:with-param>
					</xsl:call-template>												
                </label>
			</div>
			<div class="styPartDesc" style="width:10mm;text-align:center;height:4.2mm;padding:0mm;border-left:1px solid black;border-bottom:1px solid black;">
				<xsl:call-template name="PopulateSpan">
					<xsl:with-param name="TargetNode" select="$FormData/TrustBeneficiariesSkipInd"/>
				</xsl:call-template>
				<!-- Checkbox -->
				<input type="Checkbox" aria-label="TrustBeneficiariesSkipNo" class="styCkbox">
					<xsl:call-template name="PopulateNoCheckbox">
						<xsl:with-param name="TargetNode" select="$FormData/TrustBeneficiariesSkipInd"/>
						<xsl:with-param name="BackupName">IRS1041TrustBeneficiariesSkipInd</xsl:with-param>
					</xsl:call-template>
				</input>
				<label>
					<xsl:call-template name="PopulateLabelNo">
						<xsl:with-param name="TargetNode" select="$FormData/TrustBeneficiariesSkipInd"/>
						<xsl:with-param name="BackupName">IRS1041TrustBeneficiariesSkipInd</xsl:with-param>
					</xsl:call-template>												
                </label>
			</div>
			</div>
			<!--Line 10-->
			<div style="width:187mm;font-size:7pt;float:left;">
				<div class="styLNLeftNumBox" style="height:4mm;">10</div>
				<div class="styLNDesc" style="width:159mm;height:4mm;">
					<span style="float:left;">Was the trust a specified domestic entity required to file Form 8938 for the tax year (see the Instructions for Form 8938)? 
						<xsl:call-template name="SetFormLinkInline">
							<xsl:with-param name="TargetNode" select="$FormData/RequiredToFileForm8938Ind"/>
						</xsl:call-template>
					</span>
				</div>
			    <div class="styPartDesc" style="width:10mm;text-align:center;height:4.2mm;padding:0mm;border-left:1px solid black;border-bottom:1px solid black;">
			        <xsl:call-template name="PopulateSpan">
						<xsl:with-param name="TargetNode" select="$FormData/RequiredToFileForm8938Ind"/>
					</xsl:call-template>
					<!-- Checkbox -->
					<input type="Checkbox" aria-label="RequiredToFileForm8938Yes" class="styCkbox">
						<xsl:call-template name="PopulateYesCheckbox">
							<xsl:with-param name="TargetNode" select="$FormData/RequiredToFileForm8938Ind"/>
							<xsl:with-param name="BackupName">IRS1041RequiredToFileForm8938Ind</xsl:with-param>
						</xsl:call-template>
					</input>
					<label>
						<xsl:call-template name="PopulateLabelYes">
							<xsl:with-param name="TargetNode" select="$FormData/RequiredToFileForm8938Ind"/>
							<xsl:with-param name="BackupName">IRS1041RequiredToFileForm8938Ind</xsl:with-param>
						</xsl:call-template>												
			        </label>
				</div>
			    <div class="styPartDesc" style="width:10mm;text-align:center;height:4.2mm;padding:0mm;border-left:1px solid black;border-bottom:1px solid black;">
					<xsl:call-template name="PopulateSpan">
						<xsl:with-param name="TargetNode" select="$FormData/RequiredToFileForm8938Ind"/>
					</xsl:call-template>
					<!-- Checkbox -->
					<input type="Checkbox" aria-label="RequiredToFileForm8938No" class="styCkbox">
						<xsl:call-template name="PopulateNoCheckbox">
							<xsl:with-param name="TargetNode" select="$FormData/RequiredToFileForm8938Ind"/>
							<xsl:with-param name="BackupName">IRS1041RequiredToFileForm8938Ind</xsl:with-param>
						</xsl:call-template>
					</input>
					<label>
						<xsl:call-template name="PopulateLabelNo">
							<xsl:with-param name="TargetNode" select="$FormData/RequiredToFileForm8938Ind"/>
							<xsl:with-param name="BackupName">IRS1041RequiredToFileForm8938Ind</xsl:with-param>
						</xsl:call-template>												
			        </label>
				</div>
		  	</div>
		  	<!--Line 11a-->
			<div style="width:187mm;font-size:7pt;float:left;">
			  <div class="styLNLeftNumBox" style="height:4mm;">11a</div>
			  <div class="styLNDesc" style="width:159mm;height:4mm;">
				<span style="float:left;">Did the estate or trust distribute S corporation stock for which it made a section 965(i) election?</span>
				<span class="styBoldText" style="float:right;padding-right:10px;">
				  <xsl:call-template name="DotLoop">						
						<xsl:with-param name="DotQty" select="8"/>
					</xsl:call-template>	
				</span>
			   </div>
			<div class="styPartDesc" style="width:10mm;text-align:center;height:4.2mm;padding:0mm;border-left:1px solid black;border-bottom:1px solid black;">
				<xsl:call-template name="PopulateSpan">
					<xsl:with-param name="TargetNode" select="$FormData/Section965iElectionInd"/>
				</xsl:call-template>
				<!-- Checkbox -->
				<input type="Checkbox" aria-label="Section965iElectionIndYes" class="styCkbox">
					<xsl:call-template name="PopulateYesCheckbox">
						<xsl:with-param name="TargetNode" select="$FormData/Section965iElectionInd"/>
						<xsl:with-param name="BackupName">IRS1041Section965iElectionInd</xsl:with-param>
					</xsl:call-template>
				</input>
				<label>
					<xsl:call-template name="PopulateLabelYes">
						<xsl:with-param name="TargetNode" select="$FormData/Section965iElectionInd"/>
						<xsl:with-param name="BackupName">IRS1041Section965iElectionInd</xsl:with-param>
					</xsl:call-template>												
                </label>
			</div>
			<div class="styPartDesc" style="width:10mm;text-align:center;height:4.2mm;padding:0mm;border-left:1px solid black;border-bottom:1px solid black;">
				<xsl:call-template name="PopulateSpan">
					<xsl:with-param name="TargetNode" select="$FormData/Section965iElectionInd"/>
				</xsl:call-template>
				<!-- Checkbox -->
				<input type="Checkbox" aria-label="Section965iElectionIndNo" class="styCkbox">
					<xsl:call-template name="PopulateNoCheckbox">
						<xsl:with-param name="TargetNode" select="$FormData/Section965iElectionInd"/>
						<xsl:with-param name="BackupName">IRS1041Section965iElectionInd</xsl:with-param>
					</xsl:call-template>
				</input>
				<label>
					<xsl:call-template name="PopulateLabelNo">
						<xsl:with-param name="TargetNode" select="$FormData/Section965iElectionInd"/>
						<xsl:with-param name="BackupName">IRS1041Section965iElectionInd</xsl:with-param>
					</xsl:call-template>												
                </label>
				</div>
			</div>
			<!--Line 11b-->
			<div style="width:187mm;font-size:7pt;float:left;">
			  <div class="styLNLeftNumBox" style="height:4mm;padding-left:4.5mm;">b</div>
			  <div class="styLNDesc" style="width:159mm;height:4mm;">
				<span style="float:left;">If "Yes", did each beneficiary enter into an agreement to be liable for the net tax liability? See instructions.</span>
				<span class="styBoldText" style="float:right;padding-right:10px;">
				  <xsl:call-template name="DotLoop">						
						<xsl:with-param name="DotQty" select="5"/>
					</xsl:call-template>		
				</span>
			   </div>
			<div class="styPartDesc" style="width:10mm;text-align:center;height:4.2mm;padding:0mm;border-left:1px solid black;border-bottom:1px solid black;">
				<xsl:call-template name="PopulateSpan">
					<xsl:with-param name="TargetNode" select="$FormData/BenefNetTaxLiabilityAgrmtInd"/>
				</xsl:call-template>
				<!-- Checkbox -->
				<input type="Checkbox" aria-label="BenefNetTaxLiabilityAgrmtIndYes" class="styCkbox">
					<xsl:call-template name="PopulateYesCheckbox">
						<xsl:with-param name="TargetNode" select="$FormData/BenefNetTaxLiabilityAgrmtInd"/>
						<xsl:with-param name="BackupName">IRS1041BenefNetTaxLiabilityAgrmtInd</xsl:with-param>
					</xsl:call-template>
				</input>
				<label>
					<xsl:call-template name="PopulateLabelYes">
						<xsl:with-param name="TargetNode" select="$FormData/BenefNetTaxLiabilityAgrmtInd"/>
						<xsl:with-param name="BackupName">IRS1041BenefNetTaxLiabilityAgrmtInd</xsl:with-param>
					</xsl:call-template>												
                </label>
			</div>
			<div class="styPartDesc" style="width:10mm;text-align:center;height:4.2mm;padding:0mm;border-left:1px solid black;border-bottom:1px solid black;">
				<xsl:call-template name="PopulateSpan">
					<xsl:with-param name="TargetNode" select="$FormData/BenefNetTaxLiabilityAgrmtInd"/>
				</xsl:call-template>
				<!-- Checkbox -->
				<input type="Checkbox" aria-label="BenefNetTaxLiabilityAgrmtIndNo" class="styCkbox">
					<xsl:call-template name="PopulateNoCheckbox">
						<xsl:with-param name="TargetNode" select="$FormData/BenefNetTaxLiabilityAgrmtInd"/>
						<xsl:with-param name="BackupName">IRS1041BenefNetTaxLiabilityAgrmtInd</xsl:with-param>
					</xsl:call-template>
				</input>
				<label>
					<xsl:call-template name="PopulateLabelNo">
						<xsl:with-param name="TargetNode" select="$FormData/BenefNetTaxLiabilityAgrmtInd"/>
						<xsl:with-param name="BackupName">IRS1041BenefNetTaxLiabilityAgrmtInd</xsl:with-param>
					</xsl:call-template>												
                </label>
				</div>
			</div>
			<!--Line 12(1)-->
			<div style="width:187mm;font-size:7pt;float:left;">
				<div class="styLNLeftNumBox" style="height:4mm;">12</div>
				<div class="styLNDesc" style="width:159mm;height:4mm;">
				<span style="float:left;">Did the estate or trust either make a section 965(i) election or enter into a transfer agreement
				 as an eligible 965(i) transferee</span>
				<span class="styBoldText" style="float:right;padding-right:10px;">
				  <xsl:call-template name="DotLoop">						
						<xsl:with-param name="DotQty" select="0"/>
					</xsl:call-template>	
				</span>
			   </div>
			<div class="styPartDesc" style="width:10mm;text-align:center;height:4.2mm;padding:0mm;border-left:1px solid black;background-color:lightgray;" />
			<div class="styPartDesc" style="width:10mm;text-align:center;height:4.2mm;padding:0mm;border-left:1px solid black;background-color:lightgray;" />			
		  </div>
		  <!--Line 12 (2)-->
			<div style="width:187mm;font-size:7pt;float:left;">
			  <div class="styLNLeftNumBoxSD" style="height:4mm;"></div>
			  <div class="styLNDesc" style="width:159mm;height:4mm;">
				<span style="float:left;">for S corporation stock held on the last day of the tax year? See instructions.</span>
				<span class="styBoldText" style="float:right;padding-right:10px;">
				  <xsl:call-template name="DotLoop">						
						<xsl:with-param name="DotQty" select="13"/>
					</xsl:call-template>	
				</span>
			   </div>
			<div class="styPartDesc" style="width:10mm;text-align:center;height:4.2mm;padding:0mm;border-left:1px solid black;border-bottom:1px solid black;">		
				<input type="Checkbox" aria-label="SCorpStockDistributionIndYes" class="styCkbox">
					<xsl:call-template name="PopulateYesCheckbox">
						<xsl:with-param name="TargetNode" select="$FormData/SCorpStockDistributionInd"/>
						<xsl:with-param name="BackupName">IRS1041SCorpStockDistributionInd</xsl:with-param>
					</xsl:call-template>
				</input>
				<label>
					<xsl:call-template name="PopulateLabelYes">
						<xsl:with-param name="TargetNode" select="$FormData/SCorpStockDistributionInd"/>
						<xsl:with-param name="BackupName">IRS1041SCorpStockDistributionInd</xsl:with-param>
					</xsl:call-template>												
                </label>
			</div>
			<div class="styPartDesc" style="width:10mm;text-align:center;height:4.2mm;padding:0mm;border-left:1px solid black;border-bottom:1px solid black;">
				<xsl:call-template name="PopulateSpan">
					<xsl:with-param name="TargetNode" select="$FormData/SCorpStockDistributionInd"/>
				</xsl:call-template>
				<!-- Checkbox -->
				<input type="Checkbox" aria-label="SCorpStockDistributionIndNo" class="styCkbox">
					<xsl:call-template name="PopulateNoCheckbox">
						<xsl:with-param name="TargetNode" select="$FormData/SCorpStockDistributionInd"/>
						<xsl:with-param name="BackupName">IRS1041SCorpStockDistributionInd</xsl:with-param>
					</xsl:call-template>
				</input>
				<label>
					<xsl:call-template name="PopulateLabelNo">
						<xsl:with-param name="TargetNode" select="$FormData/SCorpStockDistributionInd"/>
						<xsl:with-param name="BackupName">IRS1041SCorpStockDistributionInd</xsl:with-param>
					</xsl:call-template>												
                </label>
				</div>
			</div>					
			<!--Line 13(1)-->
			<div style="width:187mm;font-size:7pt;float:left;">
				<div class="styLNLeftNumBox" style="height:4mm;">13</div>
				<div class="styLNDesc" style="width:159mm;height:4mm;">
				<span style="float:left;">At any time during the tax year, did the estate or trust: (a) receive (as a reward, award, or payment for property or services);</span>
				<span class="styBoldText" style="float:right;padding-right:10px;">
				  <xsl:call-template name="DotLoop">						
						<xsl:with-param name="DotQty" select="0"/>
					</xsl:call-template>	
				</span>
			   </div>
			<div class="styPartDesc" style="width:10mm;text-align:center;height:4.2mm;padding:0mm;border-left:1px solid black;background-color:lightgray;" />
			<div class="styPartDesc" style="width:10mm;text-align:center;height:4.2mm;padding:0mm;border-left:1px solid black;background-color:lightgray;" />			
		  </div>
		  <!--Line 13 (2)-->
			<div style="width:187mm;font-size:7pt;float:left;">
			  <div class="styLNLeftNumBoxSD" style="height:4mm;"></div>
			  <div class="styLNDesc" style="width:159mm;height:4mm;">
				<span style="float:left;"> or (b) sell, exchange, gift, or otherwise dispose of a digital asset (or a financial interest in a digital asset)? See instructions.</span>
				<span class="styBoldText" style="float:right;padding-right:10px;">
				  <xsl:call-template name="DotLoop">						
						<xsl:with-param name="DotQty" select="0"/>
					</xsl:call-template>	
				</span>
			   </div>
			<div class="styPartDesc" style="width:10mm;text-align:center;height:4.2mm;padding:0mm;border-left:1px solid black;border-bottom:1px solid black;">		
				<input type="Checkbox" aria-label="VirtualCurAcquiredDurTYIndYes" class="styCkbox">
					<xsl:call-template name="PopulateYesCheckbox">
						<xsl:with-param name="TargetNode" select="$FormData/VirtualCurAcquiredDurTYInd"/>
						<xsl:with-param name="BackupName">IRS1041VirtualCurAcquiredDurTYInd</xsl:with-param>
					</xsl:call-template>
				</input>
				<label>
					<xsl:call-template name="PopulateLabelYes">
						<xsl:with-param name="TargetNode" select="$FormData/VirtualCurAcquiredDurTYInd"/>
						<xsl:with-param name="BackupName">IRS1041VirtualCurAcquiredDurTYInd</xsl:with-param>
					</xsl:call-template>												
                </label>
			</div>
			<div class="styPartDesc" style="width:10mm;text-align:center;height:4.2mm;padding:0mm;border-left:1px solid black;border-bottom:1px solid black;">
				<xsl:call-template name="PopulateSpan">
					<xsl:with-param name="TargetNode" select="$FormData/VirtualCurAcquiredDurTYInd"/>
				</xsl:call-template>
				<!-- Checkbox -->
				<input type="Checkbox" aria-label="VirtualCurAcquiredDurTYIndNo" class="styCkbox">
					<xsl:call-template name="PopulateNoCheckbox">
						<xsl:with-param name="TargetNode" select="$FormData/VirtualCurAcquiredDurTYInd"/>
						<xsl:with-param name="BackupName">IRS1041VirtualCurAcquiredDurTYInd</xsl:with-param>
					</xsl:call-template>
				</input>
				<label>
					<xsl:call-template name="PopulateLabelNo">
						<xsl:with-param name="TargetNode" select="$FormData/VirtualCurAcquiredDurTYInd"/>
						<xsl:with-param name="BackupName">IRS1041VirtualCurAcquiredDurTYInd</xsl:with-param>
					</xsl:call-template>												
                </label>
				</div>
			</div>	
			<!--Line 14-->
			<div style="width:187mm;font-size:7pt;float:left;border-bottom:0px solid black;">
				<div class="styLNLeftNumBox" style="height:4mm;">14</div>
				<div class="styLNDesc" style="width:159mm;height:4mm;">
					<span style="float:left;"><b>ESBTs only.</b> Does the ESBT have a non-resident alien grantor? If "Yes",  see instructions.</span>
					<span class="styBoldText" style="float:right;padding-right:10px;">
				  <xsl:call-template name="DotLoop">						
						<xsl:with-param name="DotQty" select="8"/>
					</xsl:call-template>	
				</span>
				</div>
			    <div class="styPartDesc" style="width:10mm;text-align:center;height:4.2mm;padding:0mm;border-left:1px solid black;border-bottom:1px solid black;">
			        <xsl:call-template name="PopulateSpan">
						<xsl:with-param name="TargetNode" select="$FormData/ESBTNonResidentAlienGrantorInd"/>
					</xsl:call-template>
					<!-- Checkbox -->
					<input type="Checkbox" aria-label="ESBTNonResidentAlienGrantorIndYes" class="styCkbox">
						<xsl:call-template name="PopulateYesCheckbox">
							<xsl:with-param name="TargetNode" select="$FormData/ESBTNonResidentAlienGrantorInd"/>
							<xsl:with-param name="BackupName">IRS1041ESBTNonResidentAlienGrantorInd</xsl:with-param>
						</xsl:call-template>
					</input>
					<label>
						<xsl:call-template name="PopulateLabelYes">
							<xsl:with-param name="TargetNode" select="$FormData/ESBTNonResidentAlienGrantorInd"/>
							<xsl:with-param name="BackupName">IRS1041ESBTNonResidentAlienGrantorInd</xsl:with-param>
						</xsl:call-template>												
			        </label>
				</div>
			    <div class="styPartDesc" style="width:10mm;text-align:center;height:4.2mm;padding:0mm;border-left:1px solid black;border-bottom:1px solid black;">
					<xsl:call-template name="PopulateSpan">
						<xsl:with-param name="TargetNode" select="$FormData/ESBTNonResidentAlienGrantorInd"/>
					</xsl:call-template>
					<!-- Checkbox -->
					<input type="Checkbox" aria-label="ESBTNonResidentAlienGrantorIndNo" class="styCkbox">
						<xsl:call-template name="PopulateNoCheckbox">
							<xsl:with-param name="TargetNode" select="$FormData/ESBTNonResidentAlienGrantorInd"/>
							<xsl:with-param name="BackupName">IRS1041ESBTNonResidentAlienGrantorInd</xsl:with-param>
						</xsl:call-template>
					</input>
					<label>
						<xsl:call-template name="PopulateLabelNo">
							<xsl:with-param name="TargetNode" select="$FormData/ESBTNonResidentAlienGrantorInd"/>
							<xsl:with-param name="BackupName">IRS1041ESBTNonResidentAlienGrantorInd</xsl:with-param>
						</xsl:call-template>												
					</label>
					</div>
				</div>
				<!--Line 15-->
			<div style="width:187mm;font-size:7pt;float:left;border-bottom:1px solid black;">
				<div class="styLNLeftNumBox" style="height:4mm;">15</div>
				<div class="styLNDesc" style="width:159mm;height:4mm;">
					<span style="float:left;"><b>ESBTs only.</b> Did the S portion of the trust claim a qualified business income deduction? If "Yes",  see instructions.</span>
					<span class="styBoldText" style="float:right;padding-right:10px;">
				  <xsl:call-template name="DotLoop">						
						<xsl:with-param name="DotQty" select="3"/>
					</xsl:call-template>	
				</span>
				</div>
			    <div class="styPartDesc" style="width:10mm;text-align:center;height:4.2mm;padding:0mm;border-left:1px solid black;">
			        <xsl:call-template name="PopulateSpan">
						<xsl:with-param name="TargetNode" select="$FormData/QualifiedBusinessIncomeDedInd"/>
				</xsl:call-template>
				<!-- Checkbox -->
				<input type="Checkbox" aria-label="QualifiedBusinessIncomeDedIndYes" class="styCkbox">
					<xsl:call-template name="PopulateYesCheckbox">
						<xsl:with-param name="TargetNode" select="$FormData/QualifiedBusinessIncomeDedInd"/>
						<xsl:with-param name="BackupName">IRS1041QualifiedBusinessIncomeDedInd</xsl:with-param>
					</xsl:call-template>
					</input>
					<label>
						<xsl:call-template name="PopulateLabelYes">
							<xsl:with-param name="TargetNode" select="$FormData/QualifiedBusinessIncomeDedInd"/>
						<xsl:with-param name="BackupName">IRS1041QualifiedBusinessIncomeDedInd</xsl:with-param>
						</xsl:call-template>												
			        </label>
				</div>
			    <div class="styPartDesc" style="width:10mm;text-align:center;height:4.2mm;padding:0mm;border-left:1px solid black;">
					<xsl:call-template name="PopulateSpan">
							<xsl:with-param name="TargetNode" select="$FormData/QualifiedBusinessIncomeDedInd"/>
				</xsl:call-template>
				<!-- Checkbox -->
				<input type="Checkbox" aria-label="QualifiedBusinessIncomeDedIndNo" class="styCkbox">
					<xsl:call-template name="PopulateNoCheckbox">
						<xsl:with-param name="TargetNode" select="$FormData/QualifiedBusinessIncomeDedInd"/>
						<xsl:with-param name="BackupName">IRS1041QualifiedBusinessIncomeDedInd</xsl:with-param>
						</xsl:call-template>
					</input>
					<label>
						<xsl:call-template name="PopulateLabelNo">
							<xsl:with-param name="TargetNode" select="$FormData/QualifiedBusinessIncomeDedInd"/>
						<xsl:with-param name="BackupName">IRS1041QualifiedBusinessIncomeDedInd</xsl:with-param>
						</xsl:call-template>												
					</label>
					</div>
				</div>
				<!-- page 2 footer -->
				<div class="pageEnd" style="width:187mm;">
					<span style="float:right;clear:none;">
					   Form <span class="styBoldText" style="font-size:10pt;">1041</span> (2025)
					</span>
				</div>
		<!-- end page 2 footer -->
        <p style="page-break-before: always"/>  
          <!-- Additonal Data Title Bar and Button -->
          <div class="styLeftOverTitleLine" id="LeftoverData" style="padding-top:0mm;">
            <div class="styLeftOverTitle">
              Additional Data        
            </div>
            <div class="styLeftOverButtonContainer">
              <input class="styLeftoverTableBtn" type="button" TabIndex="-1" value="Return to Form" onclick="javascript:returnToWriteInImage();"/>
            </div>
          </div>
          <!-- Additional Data Table -->
          <xsl:variable name="TableWidth">130</xsl:variable>
          <table class="styLeftOverTbl">
            <xsl:call-template name="PopulateCommonLeftover">
              <xsl:with-param name="TargetNode" select="$FormData"/>
              <xsl:with-param name="DescWidth" select="$TableWidth"/>
            </xsl:call-template>
            <xsl:call-template name="PopulateLeftoverRow">
				<xsl:with-param name="Desc">Top Left Margin - Section 642(i) Indicator</xsl:with-param>
				<xsl:with-param name="TargetNode" select="$FormData/@section642iCd"/>
				<xsl:with-param name="DescWidth" select="$TableWidth"/>
			</xsl:call-template>
			<xsl:call-template name="PopulateLeftoverRow">
				<xsl:with-param name="Desc">Top Left Margin - Pool Number Text</xsl:with-param>
				<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/PoolNumberTxt"/>
				<xsl:with-param name="DescWidth" select="$TableWidth"/>
			</xsl:call-template>		
			<xsl:call-template name="PopulateLeftoverRow">
				<xsl:with-param name="Desc">Header - In Care Of Name</xsl:with-param>
				<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/InCareOfNm"/>
				<xsl:with-param name="DescWidth" select="$TableWidth"/>
			</xsl:call-template>
			<xsl:call-template name="PopulateLeftoverRow">
				<xsl:with-param name="Desc">Header - Business Name Control</xsl:with-param>
				<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/BusinessNameControlTxt"/>
				<xsl:with-param name="DescWidth" select="$TableWidth"/>
			</xsl:call-template>
			<xsl:call-template name="PopulateLeftoverRow">
				<xsl:with-param name="Desc">Line 23 - Residual Interest In REMIC Code</xsl:with-param>
				<xsl:with-param name="TargetNode" select="$FormData/TaxableIncomeAmt/@residualInterestInREMICCd"/>
				<xsl:with-param name="DescWidth" select="105"/>
			</xsl:call-template>
			<xsl:call-template name="PopulateLeftoverRow">
				<xsl:with-param name="Desc">Future Filing Not Required Ind</xsl:with-param>
				<xsl:with-param name="TargetNode" select="$FormData/FutureFilingNotRequiredInd/@finalGrantorTrust1041ReturnCd"/>
				<xsl:with-param name="DescWidth" select="$TableWidth"/>
			</xsl:call-template>			
			<xsl:if test="$FormData/FiftyTwoFiftyThreeWeekFilerInd">
				<tr>
					<td class="styLeftOverTableRowDesc" style="width:{$TableWidth}mm;" scope="row">
						<label>
							<xsl:call-template name="PopulateLabel">
								<xsl:with-param name="TargetNode" select="$FormData/FiftyTwoFiftyThreeWeekFilerInd"/>
								<xsl:with-param name="BackupName">IRS1041FiftyTwoFiftyThreeWeekFilerInd</xsl:with-param>
							</xsl:call-template>
						Fifty Two or Fifty Three Week Filer Indicator:
						</label>
					</td>
					<td class="PopulateLeftoverRow" style="width:87mm;">
						<input type="checkbox" class="styCkbox">
							<xsl:call-template name="PopulateCheckbox">
								<xsl:with-param name="TargetNode" select="$FormData/FiftyTwoFiftyThreeWeekFilerInd"/>
								<xsl:with-param name="BackupName">IRS1041FiftyTwoFiftyThreeWeekFilerInd</xsl:with-param>
							</xsl:call-template>
						</input>
					</td>
				</tr>
			</xsl:if>						
			<xsl:call-template name="PopulateLeftoverRow">
				<xsl:with-param name="Desc">Line 7 - Form 4684 Code</xsl:with-param>
				<xsl:with-param name="TargetNode" select="$FormData/TotalOrdinaryGainLossAmt/@form4684Cd"/>
				<xsl:with-param name="DescWidth" select="$TableWidth"/>
			</xsl:call-template>			
			<xsl:call-template name="PopulateLeftoverRow">
				<xsl:with-param name="Desc">Line 18 - Gravesites Number</xsl:with-param>
				<xsl:with-param name="TargetNode" select="$FormData/IncomeDistributionDeductionAmt/@gravesitesNum"/>
				<xsl:with-param name="DescWidth" select="$TableWidth"/>
			</xsl:call-template>			
			<xsl:call-template name="PopulateLeftoverRow">
				<xsl:with-param name="Desc">Schedule G Part I, Line 1e</xsl:with-param>
				<xsl:with-param name="TargetNode" select="$FormData/TotalTaxForTaxYearAmt/@form8978Amt"/>
				<xsl:with-param name="DescWidth" select="$TableWidth"/>
			</xsl:call-template>
			<xsl:call-template name="PopulateLeftoverRow">
				<xsl:with-param name="Desc">Schedule G Part I, Line 1e</xsl:with-param>
				<xsl:with-param name="TargetNode" select="$FormData/TotalTaxForTaxYearAmt/@form8978Cd"/>
				<xsl:with-param name="DescWidth" select="$TableWidth"/>
			</xsl:call-template>			
			<xsl:call-template name="PopulateLeftoverRow">
				<xsl:with-param name="Desc">Schedule G Part I, Line 2e</xsl:with-param>
				<xsl:with-param name="TargetNode" select="$FormData/TotalCreditsAmt/@form8978Amt"/>
				<xsl:with-param name="DescWidth" select="$TableWidth"/>
			</xsl:call-template>
			<xsl:call-template name="PopulateLeftoverRow">
				<xsl:with-param name="Desc">Schedule G Part I, Line 2e</xsl:with-param>
				<xsl:with-param name="TargetNode" select="$FormData/TotalCreditsAmt/@form8978Cd"/>
				<xsl:with-param name="DescWidth" select="$TableWidth"/>
			</xsl:call-template>	
			<xsl:call-template name="PopulateLeftoverRow">
				<xsl:with-param name="Desc">Schedule G Part I, Line 4</xsl:with-param>
				<xsl:with-param name="TargetNode" select="$FormData/TotalESBTNIITAmt/@F1041TotalTaxLiteralCd"/>
				<xsl:with-param name="DescWidth" select="$TableWidth"/>
			</xsl:call-template>				
			<xsl:call-template name="PopulateLeftoverRow">
				<xsl:with-param name="Desc">Schedule G Part I, Line 8</xsl:with-param>
				<xsl:with-param name="TargetNode" select="$FormData/OtherTaxDueAmt/@form8978Amt"/>
				<xsl:with-param name="DescWidth" select="$TableWidth"/>
			</xsl:call-template>
			<xsl:call-template name="PopulateLeftoverRow">
				<xsl:with-param name="Desc">Schedule G Part I, Line 8</xsl:with-param>
				<xsl:with-param name="TargetNode" select="$FormData/OtherTaxDueAmt/@form8978Cd"/>
				<xsl:with-param name="DescWidth" select="$TableWidth"/>
			</xsl:call-template>			
			<xsl:call-template name="PopulateLeftoverRow">
				<xsl:with-param name="Desc">Schedule G, Part II, Line 10</xsl:with-param>
				<xsl:with-param name="TargetNode" select="$FormData/EstimatedTaxCreditedToTrustGrp/EstimatedTaxCreditedToTrustCd"/>
				<xsl:with-param name="DescWidth" select="$TableWidth"/>
			</xsl:call-template>
			<xsl:call-template name="PopulateLeftoverRowAmount">
				<xsl:with-param name="Desc">Schedule G, Part II, Line 10</xsl:with-param>
				<xsl:with-param name="TargetNode" select="$FormData/EstimatedTaxCreditedToTrustGrp/EstimatedTaxCreditedToTrustAmt"/>
				<xsl:with-param name="DescWidth" select="$TableWidth"/>
			</xsl:call-template>
            </table>
            <!-- Begin Separated Repeating data table for Short Period Reason-->
			<xsl:if test="$FormData/ShortPeriodReason1041Ind">
				<span class="styRepeatingDataTitle">Top Left Margin - Short Period Reason</span>
				<table class="styDepTbl" cellspacing="0" style="font-size:7pt;">
					<thead class="styTableThead">
						<tr class="styDepTblHdr">
							<th class="styDepTblCell" scope="col" rowspan="1" style="width:91.5mm;">
							   Short Period Reason
							</th>
						</tr>
					</thead>
					<tbody>
						<xsl:for-each select="$FormData/ShortPeriodReason1041Ind">
							<tr style="border-color:black;height:6mm;">
								<xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
								<td class="styTableCellText" style="width:91.5mm;">
									<div style="width:6.5mm;" class="styGenericDiv">
										<div style="width:6mm;font-weight:bold;float:right;clear:none;">
											<span class="styBoldText" style="float:right;text-align:right;padding-right:2mm;">
												<xsl:value-of select="position()"/>
											</span>
										</div>
									</div>
									<div style="width:80mm;float:none;clear:none;">
										<xsl:variable name="pos" select="position()"/>
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="."/>
											<xsl:with-param name="BackupName">IRS1041ShortPeriodReason1041Ind</xsl:with-param>
										</xsl:call-template>
									</div>
								</td>
							</tr>
						</xsl:for-each>
					</tbody>
				</table>
			</xsl:if>
			<!-- End Separated Repeating data table for Special Condition Description-->
			
			<!-- Begin Separated Repeating data table for Trust TIN-->
			<xsl:if test="(count($FormData/TrustEIN) &gt; 1)">
			<!--<xsl:if test="$FormData/TrustEIN">-->
				<span class="styRepeatingDataTitle">Trust EIN</span>
				<table class="styDepTbl" cellspacing="0" style="font-size:7pt;">
					<thead class="styTableThead">
						<tr class="styDepTblHdr">
							<th class="styDepTblCell" scope="col" rowspan="1" style="width:91.5mm;">Trust EIN</th>
						</tr>
					</thead>
					<tbody>
						<xsl:for-each select="$FormData/TrustEIN">
							<tr style="border-color:black;height:6mm;">
								<xsl:attribute name="class">
									<xsl:choose>
										<xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when>
										<xsl:otherwise>styDepTblRow2</xsl:otherwise>
									</xsl:choose>
								</xsl:attribute>								
								<td class="styTableCellText" style="width:91.5mm;">
									<div style="width:6.5mm;" class="styGenericDiv">
										<div style="width:6mm;font-weight:bold;float:right;clear:none;">
											<span class="styBoldText" style="float:right;text-align:right;padding-right:2mm;">
												<xsl:value-of select="position()"/>
											</span>
										</div>
									</div>
									<div style="width:80mm;float:none;clear:none;">
										<xsl:variable name="pos" select="position()"/>
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="."/>
											<xsl:with-param name="BackupName">IRS1041TrustEIN</xsl:with-param>
										</xsl:call-template>
									</div>
								</td>
							</tr>
						</xsl:for-each>
					</tbody>
				</table>
			</xsl:if>
			<!-- End Separated Repeating data table for Special Condition Description-->					
          <!-- Begin Separated Repeating data table for OtherIncomeDescAndAmt -->
			<xsl:if test="(count($FormData/OtherIncomeDescAndAmt) &gt; 1)">
				<span class="styRepeatingDataTitle">Form 1041 Line 8 - Other Income</span>
				<table class="styDepTbl" cellspacing="0" style="font-size:7pt;">
					<thead class="styTableThead">
						<tr class="styDepTblHdr">
							<th class="styDepTblCell" scope="col" rowspan="2" style="width:91.5mm;">										
							   Description
							</th>
							<th class="styDepTblCell" scope="col" rowspan="2" style="width:91.5mm;">										
							   Amount
							</th>
						</tr>
					</thead>
					<tbody>
						<xsl:for-each select="$FormData/OtherIncomeDescAndAmt">
							<tr style="border-color:black;height:6mm;">
								<xsl:attribute name="class">
									<xsl:choose>
										<xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when>
										<xsl:otherwise>styDepTblRow2</xsl:otherwise>
									</xsl:choose>
								</xsl:attribute>
								<td class="styTableCellText" style="width:91.5mm;">
									<div style="width:6.5mm;" class="styGenericDiv">
										<div style="width:6mm;font-weight:bold;float:right;clear:none;">
											<span class="styBoldText" style="float:right;text-align:right;padding-right:2mm;">
												<xsl:value-of select="position()"/>
											</span>
										</div>
									</div>
									<div style="width:80mm;float:none;clear:none;text-align:left;">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="Desc"/>													
										</xsl:call-template>
									</div>
								</td>										
								<td class="styTableCellText" style="width:91.5mm;text-align:right;padding-top:4mm;">
									<div style="width:80mm;">
										<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="Amt"/>												
									</xsl:call-template>
									</div>
								</td>
							</tr>
						</xsl:for-each>
					</tbody>
				</table>
			</xsl:if>
			<!-- End Separated Repeating data table for OtherIncomeDescAndAmount -->
					<!-- Begin Separated Repeating data table for OtherCreditsFormAndAmt -->
					<xsl:if test="(count($FormData/OtherCreditsFormAndAmt) &gt; 0)">
						<span class="styRepeatingDataTitle">Other credits included in Schedule G-Line 2e</span>
						<table class="styDepTbl" cellspacing="0" style="font-size:7pt;">
							<thead class="styTableThead">
								<tr class="styDepTblHdr">
									<th class="styDepTblCell" scope="col" rowspan="2" style="width:91.5mm;">										
									   Description
									</th>
									<th class="styDepTblCell" scope="col" rowspan="2" style="width:91.5mm;">										
									   Amount
									</th>
								</tr>
							</thead>
							<tbody>
								<xsl:for-each select="$FormData/OtherCreditsFormAndAmt">
									<tr style="border-color:black;height:6mm;">
										<xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
										<td class="styTableCellText" style="width:91.5mm;">
											<div style="width:6.5mm;" class="styGenericDiv">
												<div style="width:6mm;font-weight:bold;float:right;clear:none;">
													<span class="styBoldText" style="float:right;text-align:right;padding-right:2mm;">
														<xsl:value-of select="position()"/>
													</span>
												</div>
											</div>
											<div style="width:80mm;float:none;clear:none;text-align:left;">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="Desc"/>													
												</xsl:call-template>
											</div>
										</td>
										<td class="styTableCellText" style="width:91.5mm;text-align:right;padding-top:4mm;">
										<div style="width:80mm;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="Amt"/>												
											</xsl:call-template>
											</div>
										</td>
									</tr>
								</xsl:for-each>
							</tbody>
						</table>
					</xsl:if>
					<!-- End Separated Repeating data table for OtherCreditsFormAndAmt -->
					<!-- Begin Separated Repeating data table for RecaptureTaxCd-->
					<xsl:if test="$FormData/RecaptureTaxCd">
						<span class="styRepeatingDataTitle">Line G-6c - Recapture Tax Code</span>
						<table class="styDepTbl" cellspacing="0" style="font-size:7pt;">
							<thead class="styTableThead">
								<tr class="styDepTblHdr">
									<th class="styDepTblCell" scope="col" rowspan="1" style="width:91.5mm;">
									   Recapture Tax
									</th>
								</tr>
							</thead>
							<tbody>
								<xsl:for-each select="$FormData/RecaptureTaxCd">
									<tr style="border-color:black;height:6mm;">
										<xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
										<td class="styTableCellText" style="width:91.5mm;">
											<div style="width:6.5mm;" class="styGenericDiv">
												<div style="width:6mm;font-weight:bold;float:right;clear:none;">
													<span class="styBoldText" style="float:right;text-align:right;padding-right:2mm;">
														<xsl:value-of select="position()"/>
													</span>
												</div>
											</div>
											<div style="width:80mm;float:none;clear:none;">
												<!--02/07/2025 Defect 1637696, added populateSpan to address issue with RacaptureTaxCd not showing up on RRD-->
												<xsl:call-template name="PopulateSpan">
													<xsl:with-param name="TargetNode" select="$FormData/RecaptureTaxCd"/>
												</xsl:call-template>
												<xsl:variable name="pos" select="position()"/>
												<xsl:variable name="recaptxcd" select="."/>
												<xsl:variable name="recaptxcddesc">
													<xsl:choose>
													  <xsl:when test="$recaptxcd='ICR'">ICR (investment credit)</xsl:when>
													  <xsl:when test="$recaptxcd='LIHCR'">LIHCR (low income housing credit)</xsl:when>
													  <xsl:when test="$recaptxcd='QEVCR'">QEVCR (qualified electric vehicle credit)</xsl:when>
													  <xsl:when test="$recaptxcd='IECR'">IECR (indian employment credit)</xsl:when>
													  <xsl:when test="$recaptxcd='NMCR'">NMCR (new markets credit)</xsl:when>
													  <xsl:when test="$recaptxcd='ECCFR'">ECCFR (employer provided child care faciltities credit)</xsl:when>
													  <xsl:when test="$recaptxcd='AMVCR'">AMVCR (alternative motor vehicle credit)</xsl:when>
													  <xsl:when test="$recaptxcd='ARPCR'">ARPCR (alternative fuel vehicle refueling credit)</xsl:when>
													  <!--9/6/2024 Per defect 1542968, fixed display issue when input is COSCR-->
													  <xsl:when test="$recaptxcd='COSCR'">COSCR (carbon oxide sequestration credit)</xsl:when>
													  <xsl:otherwise>blank</xsl:otherwise>
													</xsl:choose>
												</xsl:variable>
												<xsl:value-of select="$recaptxcddesc"/>
											</div>
										</td>
									</tr>
								</xsl:for-each>
							</tbody>
						</table>
					</xsl:if>
					<!-- End Separated Repeating data table for RecaptureTaxCd-->
					<!-- Begin Separated Repeating data table for F1041TotalTaxGrp -->
					<xsl:if test="(count($FormData/F1041TotalTaxGrp) &gt; 0)">
						<span class="styRepeatingDataTitle">Line G-9 - Total Tax Literal Code and Amount</span>
						<table class="styDepTbl" cellspacing="0" style="font-size:7pt;">
							<thead class="styTableThead">
								<tr class="styDepTblHdr">
									<th class="styDepTblCell" scope="col" rowspan="2" style="width:91.5mm;">										
									   Additional Tax Codes
									</th>
									<th class="styDepTblCell" scope="col" rowspan="2" style="width:91.5mm;">										
									   Amount
									</th>
								</tr>
							</thead>
							<tbody>
								<xsl:for-each select="$FormData/F1041TotalTaxGrp">
									<tr style="border-color:black;height:6mm;">
										<xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
										<td class="styTableCellText" style="width:91.5mm;">
											<div style="width:6.5mm;" class="styGenericDiv">
												<div style="width:6mm;font-weight:bold;float:right;clear:none;">
													<span class="styBoldText" style="float:right;text-align:right;padding-right:2mm;">
														<xsl:value-of select="position()"/>
													</span>
												</div>
											</div>
											<div style="width:80mm;float:none;clear:none;text-align:left;">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="F1041TotalTaxLiteralCd"/>													
												</xsl:call-template>
											</div>
										</td>
										<td class="styTableCellText" style="width:91.5mm;text-align:right;padding-top:4mm;">
										<div style="width:80mm;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="TaxDueAmt"/>												
											</xsl:call-template>
											</div>
										</td>
									</tr>
								</xsl:for-each>
							</tbody>
						</table>
					</xsl:if>
					<!-- End Separated Repeating data table for F1041TotalTaxGrp -->
					<!-- Begin Separated Repeating data table for Foreign Country Name-->
					<xsl:if test="$FormData/ShortPeriodReason1041Ind">
						<span class="styRepeatingDataTitle">Other Information - Line 3 - Foreign Country Name</span>
						<table class="styDepTbl" cellspacing="0" style="font-size:7pt;">
							<thead class="styTableThead">
								<tr class="styDepTblHdr">
									<th class="styDepTblCell" scope="col" rowspan="1" style="width:91.5mm;">
									   Foreign Country Name
									</th>
								</tr>
							</thead>
							<tbody>
								<xsl:for-each select="$FormData/ForeignCountryCd">
									<tr style="border-color:black;height:6mm;">
										<xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
										<td class="styTableCellText" style="width:91.5mm;">
											<div style="width:6.5mm;" class="styGenericDiv">
												<div style="width:6mm;font-weight:bold;float:right;clear:none;">
													<span class="styBoldText" style="float:right;text-align:right;padding-right:2mm;">
														<xsl:value-of select="position()"/>
													</span>
												</div>
											</div>
											<div style="width:80mm;float:none;clear:none;">
												<xsl:variable name="pos" select="position()"/>
												<xsl:variable name="countryname" select="document('CountriesList.xml')/countries" />
												<xsl:variable name="countryab" select="." />
												  <xsl:call-template name="PopulateText">
													  <xsl:with-param name="TargetNode" select="$countryname/country[@id=$countryab]" />
												  </xsl:call-template>												
											</div>
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
</xsl:stylesheet>
