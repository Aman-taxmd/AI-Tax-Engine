<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE xsl:stylesheet [
	<!ENTITY nbsp "&#160;"> 
]>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:include href="PopulateTemplate.xsl"/>
	<xsl:include href="CommonPathRef.xsl"/>
	<xsl:include href="AddHeader.xsl"/>
	<xsl:include href="AddOnTable.xsl"/>
	<!--<xsl:include href="IRS8332Style.xsl"/>-->
	<xsl:output method="html" indent="yes"/>
	<xsl:strip-space elements="*"/>
	<xsl:param name="FormData" select="$RtnDoc/IRS8332"/>
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
				<!-- No Browser Caching -->
				<meta http-equiv="Pragma" content="no-cache"/>
				<meta http-equiv="Cache-Control" content="no-cache"/>
				<meta http-equiv="Expires" content="0"/>
				<!-- No Proxy Caching -->
				<meta http-equiv="Cache-Control" content="private"/>
				<!-- Define Character Set -->
				<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1"/>
				<meta name="Description" content="IRS Form 8332"/>
				<xsl:call-template name="InitJS"/>
				<script language="JavaScript" src="{$ScriptPath}/FormDisplay.js"/>
				<style type="text/css">
					<xsl:if test="not($Print) or $Print=''">
						<!--<xsl:call-template name="IRS8332Style"/>-->
						<xsl:call-template name="AddOnStyle"/>
					</xsl:if>
				</style>
				<xsl:call-template name="GlobalStylesForm"/>
			</head>
			<body class="styBodyClass">
				<form name="Form8332">
					<xsl:call-template name="DocumentHeader"/>
					<!-- Page 1 -->
					<!-- Header -->
					<div class="styStdDiv">
						<div class="styFNBox" style="width:31mm;height:21mm;border-right-width:2px;">
							Form <span class="styFN" style="font-size:16pt;">8332</span>
							<div style="font-size:7pt;">(Rev. October 2025)</div>
							<br/>
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$FormData"/>
							</xsl:call-template>
							<br/>
							<div class="styAgency">Department of the Treasury
								<br/>Internal Revenue Service
							</div>
						</div>
						<div class="styFTBox" style="width:127mm;height:21mm;">
							<span class="styFMT" style="font-size:11pt;">Release/Revocation of Release of Claim<br/>to Exemption for Child by Custodial Parent</span>
							<br/>
							<span style="padding-top:2mm;">
								<b>Attach a separate form for each child.<br/>
								Go to <span style="font-style:italic;">www.irs.gov/Form8332</span> for the latest information.</b>
							</span>
						</div>
						<div class="styOMB" style="width:28mm;height:21mm;border-left-width:2px;border-bottom-width: 0px;text-align:center;">  
							<span style="height:6mm;padding-top:1mm;">OMB No. 1545-0074</span>
							<div style="border-top:.5mm solid;width:28mm;height:15mm;margin-left:0mm;text-align:left;font-size:7pt;padding-top:2mm;padding-left:1mm;">
								Attachment<br/>Sequence No. 
								<span class="styBoldText" style="font-size:9pt;">115</span>
							</div>
						</div>
					</div>
					<!-- End Form Header -->
					<!-- Begin Parent Info -->
					<div class="styBB" style="width:187mm;border-top:2px solid black;">
						<div class="styNameBox" style="width:105mm;height:7mm;font-size:7pt;">Name of noncustodial parent<br/>
							<div style="font-family:verdana;font-size:7pt;height:10mm;">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$FormData/NoncustodialParentNm"/>
									<xsl:with-param name="BackupName">IRS8332NoncustodialParentNm</xsl:with-param>
								</xsl:call-template>
							</div>
						</div>
						<div class="styNameBox" style="height:7mm;width:47mm;font-size:7pt;border-right:0px solid black;padding-left:1mm;">
							<span class="styBoldText" style="">Noncustodial parent's<br/>social security number (SSN)</span>
						</div>
						<div style="width:35mm;height:7mm;font-size:7pt; font-weight: normal;border-left:1px solid black;text-align:center;">
							&nbsp;<br/>
							<xsl:call-template name="PopulateSSN">
								<xsl:with-param name="TargetNode" select="$FormData/NoncustodialParentSSN"/>
								<xsl:with-param name="BackupName">IRS8332NoncustodialParentSSN</xsl:with-param>
							</xsl:call-template>
						</div>
					</div>
					<div class="styBB" style="width:187mm;border-bottom:0;">
						<div class="styLNDesc" style="height:11mm;font-size:7pt;width:187mm;">
							<b>Note:</b> This form also applies to some tax benefits, including the child tax credit, additional child tax credit, and credit for other dependents. It doesn’t apply to other tax benefits, such as the earned income credit, dependent care credit, or head of household filing status. See the instructions and Pub. 501.
						</div>
					</div>
					<!-- End Parent Info -->
					<!-- Part I, Release of Claim to Exemption for Current Year -->
					<div class="styStdDiv" style="border-top:0.5mm solid black; border-bottom:1px solid black;">
						<span class="styPartName" style="padding-top:.5mm;padding-bottom:.5mm;">Part I</span>
						<div class="styPartDesc" style="font-size:8pt;padding-left:3mm;">
							<b>Release of Claim to Exemption for Current Year</b>
						</div>
					</div>
					<div class="styGenericDiv">
						<div class="styNameBox" style="height:30mm;width:187mm;font-size:7pt;border-right-width:0;">
							<span style="padding-top:3mm;width:50mm;">I agree not to claim an exemption for</span>
							<span style="width:137mm;border-bottom:solid .1mm;">
								<xsl:if test="count($FormData/RelClmExemptionCYAndFutYrsGrp/CurrentTaxYr) &gt; 0">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$FormData/ChildFirstAndLastName/PersonFirstNm"/>
										<xsl:with-param name="BackupName">IRS8332ChildFirstAndLastName</xsl:with-param>
									</xsl:call-template>
									<span>&nbsp;</span>
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$FormData/ChildFirstAndLastName/PersonLastNm"/>
										<xsl:with-param name="BackupName">IRS8332ChildFirstAndLastName</xsl:with-param>
									</xsl:call-template>
								</xsl:if>
							</span>
							<br/>
							<span style="width:187mm;text-align:center;padding-left:50mm;font-size:6pt;">Name of child</span>
							<br/>
							<span style="padding-top:2.5mm;width:20mm;">for the tax year </span>
							<span style="width:8mm;border-bottom:solid .1mm;text-align:center;">
								<xsl:call-template name="PopulateYear">
									<xsl:with-param name="TargetNode" select="$FormData/RelClmExemptionCYAndFutYrsGrp/CurrentTaxYr"/>
									<xsl:with-param name="BackupName">IRS8332CurrentTaxYrExemptFrCrnt</xsl:with-param>
								</xsl:call-template>
							</span>.
							<br/>
							<!-- Signature of Part I -->
							<div style="padding-top:4mm;">
								<span style="width:100mm;border-bottom:solid .1mm;">
									&nbsp;
								</span>
								<span style="padding-left:5mm;"/>
								<span style="width:41mm;border-bottom:solid .1mm;text-align:center;">
									<xsl:if test="count($FormData/RelClmExemptionCYAndFutYrsGrp/CurrentTaxYr) &gt; 0">
										<xsl:call-template name="PopulateSSN">
											<xsl:with-param name="TargetNode" select="$FormData/CustodialParentSSN"/>
											<xsl:with-param name="BackupName">IRS8332CustodialParentSSNPrtI</xsl:with-param>
										</xsl:call-template>
									</xsl:if>
								</span>
								<span style="padding-left:5mm;"/>
								<span style="width:36mm;border-bottom:solid .1mm;text-align:center;">
									<xsl:if test="count($FormData/RelClmExemptionCYAndFutYrsGrp/CurrentTaxYr) &gt; 0">
										<xsl:call-template name="PopulateMonthDayYear">
											<xsl:with-param name="TargetNode" select="$FormData/SignatureDt"/>
											<xsl:with-param name="BackupName">IRS8332SignatureDtPrtI</xsl:with-param>
										</xsl:call-template>
									</xsl:if>
								</span>
							</div>
							<br/>
							<span style="width:100mm;text-align:center;font-size:6pt;">Signature of custodial parent releasing claim to exemption</span>
							
							<span style="width:47mm;text-align:center;font-size:6pt;padding-left:2mm;">Custodial parent’s SSN</span>
							
							<span style="width:40mm;text-align:center;font-size:6pt;padding-left:2mm;">Date</span>
							
							<span style="padding-top:1mm;"><b>Note:</b> If you choose not to claim an exemption for this child for future tax years, also complete Part II.</span>
						</div>
					</div>
					<!-- End Part I, Release of Claim to Exemption for Current Year -->
					<!-- Part II, Release of Claim to Exemption for Future Years (If completed, see Noncustodial Parent on page 2.) -->
					<div class="styStdDiv" style="width:187mm;float:none;clear:both;border-top:.5mm solid;border-bottom:1px solid black;">
						<span class="styPartName" style="padding-top:.5mm;padding-bottom:.5mm;">Part II</span>
						<div class="styPartDesc" style="font-size:8pt;padding-left:3mm;font-weight:normal;">
							<b>Release of Claim to Exemption for Future Years</b> (If completed, see <b>Noncustodial Parent</b> on page 2.) 
						</div>
					</div>
					<div class="styGenericDiv" style="padding-bottom:0.5mm;">
						<div class="styNameBox" style="height:auto;width:187mm;font-size:7pt;border-right-width:0;">
							<span style="padding-top:3mm;width:50mm;">I agree not to claim an exemption for</span>
							<span style="width:137mm;border-bottom:solid .1mm;">
								<xsl:if test="count($FormData/RelClmExemptionCYAndFutYrsGrp/FutureTaxYr) &gt; 0 or count($FormData/RelClmExemptionCYAndFutYrsGrp/AllFutureTaxYrLiteralCd) &gt; 0">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$FormData/ChildFirstAndLastName/PersonFirstNm"/>
										<xsl:with-param name="BackupName">IRS8332ChildFirstAndLastName</xsl:with-param>
									</xsl:call-template>
									<span>&nbsp;</span>
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$FormData/ChildFirstAndLastName/PersonLastNm"/>
										<xsl:with-param name="BackupName">IRS8332ChildFirstAndLastName</xsl:with-param>
									</xsl:call-template>
								</xsl:if>
							</span>
							<br/>
							<span style="width:187mm;text-align:center;padding-left:50mm;font-size:6pt;">Name of child</span>
							<br/>
							<span style="padding-top:2.5mm;width:25mm;">for the tax year(s)</span>
							<span style="width:50mm;border-bottom:solid .1mm;text-align:center;">
								<xsl:choose>
									<xsl:when test="$FormData/RelClmExemptionCYAndFutYrsGrp/FutureTaxYr">
										<xsl:for-each select="$FormData/RelClmExemptionCYAndFutYrsGrp/FutureTaxYr">
											<xsl:call-template name="PopulateYear">
												<xsl:with-param name="TargetNode" select="."/>
											</xsl:call-template>
											<xsl:if test="position() != last()">,<span style="width:4px;"/></xsl:if>
										</xsl:for-each>
									</xsl:when>
									<xsl:otherwise>
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$FormData/RelClmExemptionCYAndFutYrsGrp/AllFutureTaxYrLiteralCd"/>
											<xsl:with-param name="BackupName">IRS8332AllFutureTaxYrLiteralCdPrtIII</xsl:with-param>
										</xsl:call-template>
									</xsl:otherwise>
								</xsl:choose>
							</span>.
							<br/>
							<span style="width:187mm;padding-left:35mm;font-size:6pt;">(Specify. See instructions.)</span>
							<!-- Signature of Part II -->
							<div style="padding-top:4mm;">
								<span style="width:100mm;border-bottom:solid .1mm;">
									&nbsp;
								</span>
								<span style="padding-left:5mm;"/>
								<span style="width:41mm;border-bottom:solid .1mm;text-align:center;">
									<xsl:if test="count($FormData/RelClmExemptionCYAndFutYrsGrp/FutureTaxYr) &gt; 0 or count($FormData/RelClmExemptionCYAndFutYrsGrp/AllFutureTaxYrLiteralCd) &gt; 0">
										<xsl:call-template name="PopulateSSN">
											<xsl:with-param name="TargetNode" select="$FormData/CustodialParentSSN"/>
											<xsl:with-param name="BackupName">IRS8332CustodialParentSSNPrtII</xsl:with-param>
										</xsl:call-template>
									</xsl:if>
								</span>
								<span style="padding-left:5mm;"/>
								<span style="width:36mm;border-bottom:solid .1mm;text-align:center;">
									<xsl:if test="count($FormData/RelClmExemptionCYAndFutYrsGrp/FutureTaxYr) &gt; 0 or count($FormData/RelClmExemptionCYAndFutYrsGrp/AllFutureTaxYrLiteralCd) &gt; 0">
										<xsl:call-template name="PopulateMonthDayYear">
											<xsl:with-param name="TargetNode" select="$FormData/SignatureDt"/>
											<xsl:with-param name="BackupName">IRS8332SignatureDtPrtII</xsl:with-param>
										</xsl:call-template>
									</xsl:if>
								</span>
							</div>
							<br/>
							<span style="width:100mm;text-align:center;font-size:6pt;">Signature of custodial parent releasing claim to exemption</span>
							
							<span style="width:47mm;text-align:center;font-size:6pt;padding-left:2mm;">Custodial parent’s SSN</span>
							
							<span style="width:40mm;text-align:center;font-size:6pt;padding-left:2mm;">Date</span>
						</div>
					</div>
					<!-- End Part II, Release of Claim to Exemption for Future Years (If completed, see Noncustodial Parent on page 2.) -->
					<!-- Part III, Date of Sale or Exchange of Partnership Interest -->
					<div class="styStdDiv" style="width:187mm;float:none;clear:both;border-top:0.5mm solid;border-bottom:1px solid black;">
						<span class="styPartName" style="padding-top:.5mm;padding-bottom:.5mm;">Part III</span>
						<div class="styPartDesc" style="width:170mm;font-size:8pt;padding-left:3mm;">
							<b>Revocation of Release of Claim to Exemption for Future Year(s)</b>
						</div>
					</div>
					<div class="styGenericDiv" style="padding-bottom:0.5mm;">
						<div class="styNameBox" style="height:auto;width:187mm;font-size:7pt;border-right-width:0;">
							<span style="padding-top:3mm;width:65mm;">I revoke the release of claim to an exemption for</span>
							<span style="width:122mm;border-bottom:solid .1mm;">
								<xsl:if test="count($FormData/RvkRelClmExemptionFutYrsGrp/FutureTaxYr) &gt; 0 or count($FormData/RvkRelClmExemptionFutYrsGrp/AllFutureTaxYrLiteralCd) &gt; 0">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$FormData/ChildFirstAndLastName/PersonFirstNm"/>
										<xsl:with-param name="BackupName">IRS8332ChildFirstAndLastName</xsl:with-param>
									</xsl:call-template>
									<span>&nbsp;</span>
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$FormData/ChildFirstAndLastName/PersonLastNm"/>
										<xsl:with-param name="BackupName">IRS8332ChildFirstAndLastName</xsl:with-param>
									</xsl:call-template>
								</xsl:if>
							</span>
							<br/>
							<span style="width:187mm;text-align:center;padding-left:50mm;font-size:6pt;">Name of child</span>
							<br/>
							<span style="padding-top:2.5mm;width:25mm;">for the tax year(s)</span>
							<span style="width:50mm;border-bottom:solid .1mm;text-align:center;">
								<xsl:choose>
									<xsl:when test="$FormData/RvkRelClmExemptionFutYrsGrp/FutureTaxYr">
										<xsl:for-each select="$FormData/RvkRelClmExemptionFutYrsGrp/FutureTaxYr">
											<xsl:call-template name="PopulateYear">
												<xsl:with-param name="TargetNode" select="."/>
											</xsl:call-template>
											<xsl:if test="position() != last()">,<span style="width:4px;"/></xsl:if>
										</xsl:for-each>
									</xsl:when>
									<xsl:otherwise>
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$FormData/RvkRelClmExemptionFutYrsGrp/AllFutureTaxYrLiteralCd"/>
											<xsl:with-param name="BackupName">IRS8332AllFutureTaxYrLiteralCdPrtIII</xsl:with-param>
										</xsl:call-template>
									</xsl:otherwise>
								</xsl:choose>
							</span>.
							<br/>
							<span style="width:187mm;padding-left:35mm;font-size:6pt;">(Specify. See instructions.)</span>
							<!-- Signature of Part III -->
							<div style="padding-top:4mm;">
								<span style="width:100mm;border-bottom:solid .1mm;">
									&nbsp;
								</span>
								<span style="padding-left:5mm;"/>
								<span style="width:41mm;border-bottom:solid .1mm;text-align:center;">
									<xsl:if test="count($FormData/RvkRelClmExemptionFutYrsGrp/FutureTaxYr) &gt; 0 or count($FormData/RvkRelClmExemptionFutYrsGrp/AllFutureTaxYrLiteralCd) &gt; 0">
										<xsl:call-template name="PopulateSSN">
											<xsl:with-param name="TargetNode" select="$FormData/CustodialParentSSN"/>
											<xsl:with-param name="BackupName">IRS8332CustodialParentSSNPrtIII</xsl:with-param>
										</xsl:call-template>
									</xsl:if>
								</span>
								<span style="padding-left:5mm;"/>
								<span style="width:36mm;border-bottom:solid .1mm;text-align:center;">
									<xsl:if test="count($FormData/RvkRelClmExemptionFutYrsGrp/FutureTaxYr) &gt; 0 or count($FormData/RvkRelClmExemptionFutYrsGrp/AllFutureTaxYrLiteralCd) &gt; 0">
										<xsl:call-template name="PopulateMonthDayYear">
											<xsl:with-param name="TargetNode" select="$FormData/SignatureDt"/>
											<xsl:with-param name="BackupName">IRS8332SignatureDtPrtIII</xsl:with-param>
										</xsl:call-template>
									</xsl:if>
								</span>
							</div>
							<br/>
							<span style="width:100mm;text-align:center;font-size:6pt;">Signature of custodial parent revoking the release of claim to exemption</span>
							
							<span style="width:47mm;text-align:center;font-size:6pt;padding-left:2mm;">Custodial parent’s SSN</span>
							
							<span style="width:40mm;text-align:center;font-size:6pt;padding-left:2mm;">Date</span>
						</div>
					</div>
					<!-- End Part III, Revocation of Release of Claim to Exemption for Future Year(s) -->
					<div class="pageEnd" style="width:187mm;">
						<div style="border-top: solid;width:187mm;padding-top:1mm;">
							<span class="styBoldText" style="width:100mm;">For Paperwork Reduction Act Notice, see back of form.</span>
							<span style="width:35mm; text-align:center;">Cat. No. 13910F</span>
							<div style="float:right;clear:none;">
								<span style="width:50mm;text-align:right;">Form <span style="font-size:9pt;">
									<b>8332</b>
								</span>(Rev. 10-2025)</span>
							</div>
						</div>
					</div>
					<!-- End of Page 1 -->
					<!-- BEGIN Left Over Table -->
					<!-- Additonal Data Title Bar and Button -->
					<div class="styLeftOverTitleLine" id="LeftoverData">
						<div class="styLeftOverTitle">
							Additional Data        
						</div>
						<div class="styLeftOverButtonContainer">
							<input class="styLeftoverTableBtn" TabIndex="1" type="button" value="Return to Form" onclick="javascript:returnToWriteInImage();"/>
						</div>
					</div>
					<!-- Additional Data Table -->
					<table class="styLeftOverTbl">
						<xsl:call-template name="PopulateCommonLeftover">
							<xsl:with-param name="TargetNode" select="$FormData"/>
							<xsl:with-param name="DescWidth" select="100"/>
						</xsl:call-template>
					</table>
					<!-- END Left Over Table -->
				</form>
			</body>
		</html>
	</xsl:template>
</xsl:stylesheet>