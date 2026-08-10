<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:output method="html" indent="yes" />
	<xsl:strip-space elements="*" /> 
	<xsl:include href="PopulateTemplate.xsl"/>
	<xsl:include href="AddHeader.xsl"/>
	<xsl:include href="CommonPathRef.xsl"/>
	<xsl:include href="AddOnTable.xsl"/>
	<xsl:param name="DependencyData" select="$RtnDoc/SchK2K3AddnlDtPFICShrAcqStmt" />
	<xsl:template name="ShowDependencyData">
		<!--  Add stylesheet dependency code here  -->
		<!-- Added Header Elements start here -->
		<div class="styTopSectionLineLandscape">
			<xsl:choose>
				<xsl:when test="$DependencyData/PartnershipEIN">
					<div class="styTopSectionLineLbl" style="float:left">
						 Partnership EIN :
					</div>
					<div class="styExplanationLine" style="float:left">
						<xsl:call-template name="PopulateEIN">
							<xsl:with-param name="TargetNode" select="$DependencyData/PartnershipEIN"/>
						</xsl:call-template>
					</div>
				</xsl:when>
				<xsl:when test="$DependencyData/PartnershipMissingEINReasonCd">
					<div class="styTopSectionLineLbl" style="float:left">
						 Partnership missing EIN reason code :
					 </div><br/>
					<div class="styExplanationLine" style="float:left">
						<xsl:call-template name="PopulateText">
							<xsl:with-param name="TargetNode" select="$DependencyData/PartnershipMissingEINReasonCd"/>
						</xsl:call-template>
					</div>
				</xsl:when>
				<xsl:when test="$DependencyData/CorporationEIN">
					<div class="styTopSectionLineLbl" style="float:left">
						 Corporation EIN:
					</div>
					<div class="styExplanationLine" style="float:left">
						<xsl:call-template name="PopulateEIN">
							<xsl:with-param name="TargetNode" select="$DependencyData/CorporationEIN"/>
						</xsl:call-template>
					</div>
				</xsl:when>
				<xsl:otherwise>
					<div class="styTopSectionLineLbl" style="float:left">
						 Corporation missing EIN reason code:
					</div>
					<div class="styExplanationLine" style="float:left;padding-top:4.5mm;">
						<xsl:call-template name="PopulateText">
							<xsl:with-param name="TargetNode" select="$DependencyData/CorporationMissingEINReasonCd"/>
						</xsl:call-template>
					</div>
				</xsl:otherwise>
			</xsl:choose>
	     </div>
	     <div  style="width:255mm;">
			<div class="styTopSectionLineLandscape">
			<div class="styExplanationLine" style="float:left">
		<xsl:choose>
					<xsl:when test="$DependencyData/PartnershipName">
					 <div  style="width:187mm;">
					<div class="styTopSectionLineLbl" style="float:left">
             			Name of Partnership:
		          	</div>
		          	<span style="width:110mm;;word-wrap: break-word;">
						<xsl:call-template name="PopulateText">
							<xsl:with-param name="TargetNode" select="$DependencyData/PartnershipName/BusinessNameLine1Txt"/>
						</xsl:call-template>
                           <br/>
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$DependencyData/PartnershipName/BusinessNameLine2Txt"/>
							</xsl:call-template>
						</span>
					 </div>	
					</xsl:when>
					<xsl:otherwise>
						 <div  style="width:187mm;">
					<div class="styTopSectionLineLbl" style="float:left">
             				Name of Corporation:
		          	</div>
			          	<span style="width:110mm;word-wrap: break-word;">
						<xsl:call-template name="PopulateText">
							<xsl:with-param name="TargetNode" select="$DependencyData/CorporationName/BusinessNameLine1Txt"/>
						</xsl:call-template>
                         <br/>
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$DependencyData/CorporationName/BusinessNameLine2Txt"/>
							</xsl:call-template>
						</span>
				 </div>	
						</xsl:otherwise>
				</xsl:choose>
			</div>
		</div>
	</div>
		<div class="styTopSectionLineLandscape">
			<xsl:choose>
				<xsl:when test="$DependencyData/PartnerEIN">
					<div class="styTopSectionLineLbl" style="float:left">
						Partner EIN:
					</div>
					<div class="styExplanationLine" style="float:left">
						<xsl:call-template name="PopulateEIN">
							<xsl:with-param name="TargetNode" select="$DependencyData/PartnerEIN"/>
						</xsl:call-template>
					</div>
				</xsl:when>
				<xsl:when test="$DependencyData/PartnerSSN">
					<div class="styTopSectionLineLbl" style="float:left">
						Partner SSN:
					</div>
					<div class="styExplanationLine" style="float:left">
						<xsl:call-template name="PopulateSSN">
							<xsl:with-param name="TargetNode" select="$DependencyData/PartnerSSN"/>
						</xsl:call-template>
					</div>
				</xsl:when>
				<xsl:when test="$DependencyData/PartnerMissingTINReasonCd">
					<div class="styTopSectionLineLbl" style="float:left">
						Partner missing TIN reason code:
					</div>
					<div class="styExplanationLine" style="float:left;padding-top:0mm;">
						<xsl:call-template name="PopulateText">
							<xsl:with-param name="TargetNode" select="$DependencyData/PartnerMissingTINReasonCd"/>
						</xsl:call-template>
					</div>
				</xsl:when>
				<xsl:when test="$DependencyData/ShareholderEIN">
					<div class="styTopSectionLineLbl" style="float:left">
						Shareholder EIN:
					</div>
					<div class="styExplanationLine" style="float:left">
						<xsl:call-template name="PopulateEIN">
							<xsl:with-param name="TargetNode" select="$DependencyData/ShareholderEIN"/>
						</xsl:call-template>
					</div>
				</xsl:when>
				<xsl:when test="$DependencyData/ShareholderSSN">
					<div class="styTopSectionLineLbl" style="float:left">
						Shareholder SSN:
					</div>
					<div class="styExplanationLine" style="float:left">
						<xsl:call-template name="PopulateSSN">
							<xsl:with-param name="TargetNode" select="$DependencyData/ShareholderSSN"/>
						</xsl:call-template>
					</div>
				</xsl:when>
				<xsl:otherwise>
					<div class="styTopSectionLineLbl" style="float:left">
						Shareholder missing TIN reason code:
					</div>
					<div class="styExplanationLine" style="float:left">
						<xsl:call-template name="PopulateText">
							<xsl:with-param name="TargetNode" select="$DependencyData/ShareholderMissingTINReasonCd"/>
						</xsl:call-template>
					</div>
				</xsl:otherwise>
			</xsl:choose>
		</div>
			<div class="styTopSectionLineLandscape">
         		<div class="styExplanationLine" style="float:left">
    				<xsl:choose>
					<xsl:when test="$DependencyData/PartnerName">
						 <div  style="width:187mm">
					<div class="styTopSectionLineLbl" style="float:left">
             			Name of Partner :
		          	</div>
		          	<span style="width:110mm;word-wrap: break-word;">
						<xsl:call-template name="PopulateText">
							<xsl:with-param name="TargetNode" select="$DependencyData/PartnerName/BusinessNameLine1Txt"/>
						</xsl:call-template>
                           <br/>
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$DependencyData/PartnerName/BusinessNameLine2Txt"/>
							</xsl:call-template>
						</span>
				 </div>	
			</xsl:when>
					<xsl:when test="$DependencyData/ShareholderName">
					 <div  style="width:255mm;">
						<div class="styTopSectionLineLbl" style="float:left">
				Name of Shareholder :
			</div>
			          <span style="width:150mm;word-wrap: break-word;">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$DependencyData/ShareholderName/BusinessNameLine1Txt"/>
							</xsl:call-template>
							<br/>
  	       							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$DependencyData/ShareholderName/BusinessNameLine2Txt"/>
							</xsl:call-template>
							</span></div>
					</xsl:when>
						<xsl:when test="$DependencyData/PartnerPersonNm">
							 <div  style="width:255mm">
						 	<div class="styTopSectionLineLbl" style="float:left">
				<!--	<div class="styTopSectionLineLbl" style="float:left;word-wrap: break-word;padding-left:10mm">-->
				Partner Person Name:
							</div>
						<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$DependencyData/PartnerPersonNm"/>
							</xsl:call-template></div>
						</xsl:when>
						<xsl:otherwise>
					 <div  style="width:255mm">
					 	<div class="styTopSectionLineLbl" style="float:left">
					<!--<div class="styTopSectionLineLbl" style="float:left;word-wrap: break-word;padding-left:10mm">-->
				Shareholder Person Name:
							</div>
						<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$DependencyData/ShareholderPersonNm"/>
							</xsl:call-template></div>
					</xsl:otherwise>
				</xsl:choose>
			</div>
		</div>
		<!--End of header -->
		 <br />
		<span style="font-weight:bold;font-size:10pt;">Additional information for Section 1:</span>
		<table id="INOLDTbl" class="styDepTblLandscape" style="font-size:7pt;">
			<thead class="styDepTableThead">
			<tr class="styDepTblHdr">
					<th class="styDepTblCell" scope="col" colspan="3" style="width:256mm;">Section 1 - PFIC shares acquired general information</th>
				</tr>
				<tr class="styDepTblHdr">           
					<th class="styDepTblHdr" scope="col" style="width:90mm;border:1px solid black;">(a) Name of PFIC</th>
					<th class="styDepTblHdr" scope="col" style="width:60mm;border:1px solid black;">(b) EIN or Reference ID number</th>
					<th class="styDepTblHdr" scope="col" style="width:37mm;border:1px solid black;">(g) Dates PFIC shares acquired during tax year</th>
				</tr>
			</thead>
			<tbody>
				<xsl:for-each select="$DependencyData/PFICShrAcqGeneralInfoGrp">
					<tr>
						<xsl:attribute name="class">
							<xsl:choose>
								<xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when>
								<xsl:otherwise>styDepTblRow2</xsl:otherwise>
							</xsl:choose>
						</xsl:attribute>
						<td class="styDepTblCell" style="text-align:left;">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="PFICOrQEFName/BusinessNameLine1Txt"/>
							</xsl:call-template>
							<br/>
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="PFICOrQEFName/BusinessNameLine2Txt"/>
							</xsl:call-template>	
						</td>
						<td class="styDepTblCell" style="text-align:center;word-break:break-all;">
							<xsl:choose>
								<xsl:when test="ForeignEntityIdentificationGrp">
									<xsl:for-each select="ForeignEntityIdentificationGrp">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="ForeignEntityReferenceIdNum"/>
									</xsl:call-template>
									<xsl:if test="position() != last()"><br /></xsl:if>
								</xsl:for-each>
								</xsl:when>
								<xsl:otherwise>
									<xsl:call-template name="PopulateEIN">
										<xsl:with-param name="TargetNode" select="PFICOrQEFEIN"/>
									</xsl:call-template>
								</xsl:otherwise>
							</xsl:choose>
						</td>
						<td class="styDepTblCell" style="text-align:center;">
							<xsl:for-each select="SharesAcquiredDt">
								<xsl:call-template name="PopulateMonthDayYear">
									<xsl:with-param name="TargetNode" select="."/>
								</xsl:call-template>
								<br></br>
							</xsl:for-each>
						</td>
					</tr>
				</xsl:for-each>
			</tbody>
		</table>
		<br/>
		<span style="font-weight:bold;font-size:10pt;">Additional information for Section 2:</span><br />
		<table id="INOLDTbl" class="styDepTblLandscape" style="font-size:6pt;width:256mm;">
			<thead class="styDepTableThead">
			<tr class="styDepTblHdr">
					<th class="styDepTblHdr" scope="col" colspan="10" style="width:256mm;">Section 2 - PFIC shares acquired additional information</th>
				</tr>
				<tr class="styDepTblHdr" style="border:1px solid black;">
					<th class="styDepTblHdr" scope="col" colspan="3" style="width:78mm;border:1px solid black;"></th>
					<th class="styDepTblHdr" scope="col" colspan="7" style="width:178mm;border:1px solid black;">PFIC shares information</th>
				</tr>
				<tr class="styDepTblHdr">           
					<th class="styDepTblHdr" scope="col" rowspan="2" style="width:57mm;border:1px solid black;"><strong>(a)</strong><br />Name of PFIC</th>
					<th class="styDepTblHdr" scope="col" rowspan="2" style="width:21mm;border:1px solid black;"><strong>(b)</strong><br />EIN or Reference ID number</th>
					<th class="styDepTblHdr" scope="col" rowspan="2" style="width:16mm;border:1px solid black;"><strong>(g)</strong><br />Dates PFIC shares acquired during tax year</th>
					<th class="styDepTblHdr" scope="col" style="width:22mm;border:1px solid black;"><strong>(h)</strong><br />Amount of cash and fair market value of property distributed by PFIC during the current tax year</th>
					<th class="styDepTblHdr" scope="col" style="width:15mm;border:1px solid black;"><strong>(i)</strong><br />Dates of distribution</th>
					<th class="styDepTblHdr" scope="col" style="width:22mm;border:1px solid black;"><strong>(j)</strong><br />Total creditable foreign taxes attributable to distribution by PFIC</th>
					<th class="styDepTblHdr" scope="col" style="width:15mm;border:1px solid black;"><strong>(l)</strong><br />Dates PFIC shares disposed of during tax year</th>
					<th class="styDepTblHdr" scope="col" style="width:22mm;border:1px solid black;"><strong>(m)</strong><br />Amount realized on disposition of PFIC shares</th>
					<th class="styDepTblHdr" scope="col" style="width:22mm;border:1px solid black;"><strong>(n)</strong><br />Tax basis of PFIC shares on date of disposition</th>
					<th class="styDepTblHdr" scope="col" style="width:22mm;border:1px solid black;"><strong>(o)</strong><br />Gain (loss) on disposition of PFIC shares</th>
				</tr>
			</thead>
			<tbody>
				<xsl:for-each select="$DependencyData/PFICShrAcqAdditionalInfoGrp">
					<xsl:variable name="outerPos" select="position()"/>
					<xsl:for-each select="PFICSharesInformationGrp">
						<tr>
							<xsl:attribute name="class">
								<xsl:choose>
									<xsl:when test="(position()) mod 2 = 1">styDepTblRow1</xsl:when>
									<xsl:otherwise>styDepTblRow2</xsl:otherwise>
								</xsl:choose>
							</xsl:attribute>
							<xsl:choose>
								<xsl:when test="position() = 1">
									<td class="styDepTblCell" style="text-align:left;">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$DependencyData/PFICShrAcqAdditionalInfoGrp[$outerPos]/PFICOrQEFName/BusinessNameLine1Txt"/>
										</xsl:call-template>
										<br/>
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$DependencyData/PFICShrAcqAdditionalInfoGrp[$outerPos]/PFICOrQEFName/BusinessNameLine2Txt"/>
										</xsl:call-template>
									</td>
									<td class="styDepTblCell" style="text-align:center;word-break:break-all;">
										<xsl:choose>
											<xsl:when test="$DependencyData/PFICShrAcqAdditionalInfoGrp[$outerPos]/ForeignEntityIdentificationGrp">
												<xsl:for-each select="$DependencyData/PFICShrAcqAdditionalInfoGrp[$outerPos]/ForeignEntityIdentificationGrp">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="ForeignEntityReferenceIdNum"/>
												</xsl:call-template>
												<xsl:if test="position() != last()"><br /></xsl:if>
												</xsl:for-each>
											</xsl:when>
											<xsl:otherwise>
												<xsl:call-template name="PopulateEIN">
													<xsl:with-param name="TargetNode" select="$DependencyData/PFICShrAcqAdditionalInfoGrp[$outerPos]/PFICOrQEFEIN"/>
												</xsl:call-template>
											</xsl:otherwise>
										</xsl:choose>
									</td>
								</xsl:when>
								<xsl:otherwise>
									<td class="styDepTblCell" style="text-align:center;background-color:darkgrey;">&#160;</td>
									<td class="styDepTblCell" style="text-align:center;background-color:darkgrey;">&#160;</td>
								</xsl:otherwise>
							</xsl:choose>
							<td class="styDepTblCell" style="text-align:center;">
								<xsl:call-template name="PopulateMonthDayYear">
									<xsl:with-param name="TargetNode" select="SharesAcquiredDt"/>
								</xsl:call-template>
							</td>
							<td class="styDepTblCell" style="text-align:right;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="PFICCashDistributedPropFMVAmt"/>
								</xsl:call-template>
							</td>
							<td class="styDepTblCell" style="text-align:center;">
								<xsl:call-template name="PopulateMonthDayYear">
									<xsl:with-param name="TargetNode" select="DistributionDt"/>
								</xsl:call-template>
							</td>
							<td class="styDepTblCell" style="text-align:right;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="TotPFICCrdblFrgnTxsDistriAmt"/>
								</xsl:call-template>
							</td>
							<td class="styDepTblCell" style="text-align:center;">
								<xsl:call-template name="PopulateMonthDayYear">
									<xsl:with-param name="TargetNode" select="DispositionDt"/>
								</xsl:call-template>
							</td>
							<td class="styDepTblCell" style="text-align:right;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="PFICSharesDisposRealizedAmt"/>
								</xsl:call-template>
							</td>
							<td class="styDepTblCell" style="text-align:right;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="PFICSharesTaxBasisAmt"/>
								</xsl:call-template>
							</td>
							<td class="styDepTblCell" style="text-align:right;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="PFICSharesDisposGainLossAmt"/>
								</xsl:call-template>
							</td>
						</tr>
					</xsl:for-each>
					<xsl:if test="count(PFICSharesInformationGrp) &lt; 1">
						<tr>
							<xsl:attribute name="class">
								<xsl:choose>
									<xsl:when test="(position()) mod 2 = 1">styDepTblRow1</xsl:when>
									<xsl:otherwise>styDepTblRow2</xsl:otherwise>
								</xsl:choose>
							</xsl:attribute>
							<td class="styDepTblCell" style="text-align:left;">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="PFICOrQEFName/BusinessNameLine1Txt"/>
								</xsl:call-template>
								<br/>
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="PFICOrQEFName/BusinessNameLine2Txt"/>
								</xsl:call-template>
							</td>
							<td class="styDepTblCell" style="text-align:center;word-break:break-all;">
								<xsl:choose>
									<xsl:when test="ForeignEntityIdentificationGrp">
										<xsl:for-each select="ForeignEntityIdentificationGrp">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="ForeignEntityReferenceIdNum"/>
										</xsl:call-template>
										<xsl:if test="position() != last()"><br /></xsl:if>
										</xsl:for-each>
									</xsl:when>
									<xsl:otherwise>
										<xsl:call-template name="PopulateEIN">
											<xsl:with-param name="TargetNode" select="PFICOrQEFEIN"/>
										</xsl:call-template>
									</xsl:otherwise>
								</xsl:choose>
							</td>
							<td class="styDepTblCell" style="text-align:center;">&#160;</td>
							<td class="styDepTblCell" style="text-align:center;">&#160;</td>
							<td class="styDepTblCell" style="text-align:center;">&#160;</td>
							<td class="styDepTblCell" style="text-align:center;">&#160;</td>
							<td class="styDepTblCell" style="text-align:center;">&#160;</td>
							<td class="styDepTblCell" style="text-align:center;">&#160;</td>
							<td class="styDepTblCell" style="text-align:center;">&#160;</td>
							<td class="styDepTblCell" style="text-align:center;">&#160;</td>
							<td class="styDepTblCell" style="text-align:center;">&#160;</td>
						</tr>
					</xsl:if>
				</xsl:for-each>
			</tbody>
		</table>
	</xsl:template>
	<xsl:param name="depDocTitle">
		<xsl:call-template name="PopulateDisplayName"><xsl:with-param name="TargetNode" select="$DependencyData" /></xsl:call-template>
	</xsl:param>
	<!-- Main template -->
	<xsl:template match="/">
		<html>
			<head>
				<title><xsl:value-of select="$depDocTitle" /></title>
				<!-- No Browser Caching -->
				<meta http-equiv="Pragma" content="no-cache" />
				<meta http-equiv="Cache-Control" content="no-cache" />
				<meta http-equiv="Expires" content="0" />
				<!-- No Proxy Caching -->
				<meta http-equiv="Cache-Control" content="private" />
				<!-- Define Character Set -->
				<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
				<meta name="Description" content= "{$depDocTitle}" />
				<script language="JavaScript" src="{$ScriptPath}/FormDisplay.js" type="text/javascript"></script>
				<xsl:call-template name="InitJS"></xsl:call-template>
				<style type="text/css">
					<xsl:if test="not($Print) or $Print=''"> 
						<xsl:call-template name="AddOnStyle"></xsl:call-template>
					 </xsl:if> 
				</style>
				<xsl:call-template name="GlobalStylesDep"/>
			</head>
			<body class="styBodyClass" >
				<xsl:call-template name="DocumentHeaderDependencyLandscape"></xsl:call-template>
				<div class="styDepTitleLineLandscape">
					<span class="styDepTitle" style="">
						<xsl:value-of select="$depDocTitle" />
					</span>
				</div>
				<!--Adding template for left over data  -->
				<xsl:call-template name="PopulateDepCommonLeftoverLandscape"><xsl:with-param name="TargetNode" select="$DependencyData" /></xsl:call-template>
				<xsl:call-template name="ShowDependencyData" />
				<br/>
			</body>
		</html>
	</xsl:template>
</xsl:stylesheet>
