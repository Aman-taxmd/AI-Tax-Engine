<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:output method="html" indent="yes" />
	<xsl:strip-space elements="*" /> 
	<xsl:include href="PopulateTemplate.xsl"/>
	<xsl:include href="AddHeader.xsl"/>
	<xsl:include href="CommonPathRef.xsl"/>
	<xsl:include href="AddOnTable.xsl"/>
	<xsl:param name="DependencyData" select="$RtnDoc/SchK2K3DistriOwnrChainStmt" />

	<xsl:template name="ShowDependencyData">
		
		<!--Dependencies name from the Shared folder: Schedules K2 K3 Distribution Ownership Chain Statement-->
		<!--Added Header Elements start here-->
		
		<!--Partnership Sequence-->
		<xsl:choose>
			<xsl:when test="$DependencyData/PartnershipEIN">
				<div class="styTopSectionLine">
					<div class="styTopSectionLineLbl" style="float:left">
						Partnership EIN:
					</div>
					<div class="styExplanationLine" style="float:left">
						<xsl:call-template name="PopulateEIN">
							<xsl:with-param name="TargetNode" select="$DependencyData/PartnershipEIN"/>
						</xsl:call-template>
					</div>
				</div>
			</xsl:when>
			<xsl:when test="$DependencyData/PartnershipMissingEINReasonCd">
				<div class="styTopSectionLine">
					<div class="styTopSectionLineLbl" style="float:left">
						 Missing Partnership EIN Reason Code:
					</div>
					<br />
					<div class="styExplanationLine" style="float:left">
						<xsl:call-template name="PopulateText">
							<xsl:with-param name="TargetNode" select="$DependencyData/PartnershipMissingEINReasonCd"/>
						</xsl:call-template>
					</div>
				</div>
			</xsl:when>
		</xsl:choose>
		<xsl:if test="$DependencyData/PartnershipName">
			<div class="styTopSectionLine">
				<div class="styTopSectionLineLbl" style="float:left">
					Name of Partnership:
				</div>
				<div class="styExplanationLine" style="float:left">
					<xsl:call-template name="PopulateText">
						<xsl:with-param name="TargetNode" select="$DependencyData/PartnershipName/BusinessNameLine1Txt"/>
					</xsl:call-template>
					
					<xsl:if test="$DependencyData/PartnershipName/BusinessNameLine2Txt">
					<br />
					<xsl:call-template name="PopulateText">
						<xsl:with-param name="TargetNode" select="$DependencyData/PartnershipName/BusinessNameLine2Txt"/>
					</xsl:call-template>
					</xsl:if>
				</div>
			</div>
		</xsl:if>
		<xsl:choose>
			<xsl:when test="$DependencyData/PartnerEIN">
			<div class="styTopSectionLine">
				<div class="styTopSectionLineLbl" style="float:left">
					Partner EIN:
				</div>
				<div class="styExplanationLine" style="float:left">
					<xsl:call-template name="PopulateEIN">
						<xsl:with-param name="TargetNode" select="$DependencyData/PartnerEIN"/>
					</xsl:call-template>
				</div>
			</div>
			</xsl:when>
			<xsl:when test="$DependencyData/PartnerSSN">
			<div class="styTopSectionLine">
				<div class="styTopSectionLineLbl" style="float:left">
					Partner SSN:
				</div>
				<div class="styExplanationLine" style="float:left">
					<xsl:call-template name="PopulateSSN">
						<xsl:with-param name="TargetNode" select="$DependencyData/PartnerSSN"/>
					</xsl:call-template>
				</div>
			</div>
			</xsl:when>
			<xsl:when test="$DependencyData/PartnerMissingTINReasonCd">
			<div class="styTopSectionLine">
				<div class="styTopSectionLineLbl" style="float:left;">
					Missing Partner TIN Reason <br />Code:
				</div>
				<br />
				<div class="styExplanationLine" style="float:left">
					<xsl:call-template name="PopulateText">
						<xsl:with-param name="TargetNode" select="$DependencyData/PartnerMissingTINReasonCd"/>
					</xsl:call-template>
				</div>
			</div>
			</xsl:when>
		</xsl:choose>
		<xsl:choose>
			<xsl:when test="$DependencyData/PartnerName">
			<div class="styTopSectionLine">
				<div class="styTopSectionLineLbl" style="float:left">
					Name of Partner:
				</div>
				<div class="styExplanationLine" style="float:left">
					<xsl:call-template name="PopulateText">
						<xsl:with-param name="TargetNode" select="$DependencyData/PartnerName/BusinessNameLine1Txt"/>
					</xsl:call-template>
					
					<xsl:if test="$DependencyData/PartnerName/BusinessNameLine2Txt">
					<br />
					<xsl:call-template name="PopulateText">
						<xsl:with-param name="TargetNode" select="$DependencyData/PartnerName/BusinessNameLine2Txt"/>
					</xsl:call-template>
					</xsl:if>
				</div>
			</div>
			</xsl:when>
			<xsl:when test="$DependencyData/PartnerPersonNm">
			<div class="styTopSectionLine">
				<div class="styTopSectionLineLbl" style="float:left">
					Name of Partner:
				</div>
				<div class="styExplanationLine" style="float:left">
					<xsl:call-template name="PopulateText">
						<xsl:with-param name="TargetNode" select="$DependencyData/PartnerPersonNm"/>
					</xsl:call-template>
				</div>
			</div>
			</xsl:when>
		</xsl:choose>
		
		<!--Corporation Sequence-->
		<xsl:choose>
		<xsl:when test="$DependencyData/CorporationEIN">
			<div class="styTopSectionLine">
				<div class="styTopSectionLineLbl" style="float:left">
					Corporation EIN:
				</div>
				<div class="styExplanationLine" style="float:left">
					<xsl:call-template name="PopulateEIN">
						<xsl:with-param name="TargetNode" select="$DependencyData/CorporationEIN"/>
					</xsl:call-template>
				</div>
			</div>
		</xsl:when>
		<xsl:when test="$DependencyData/CorporationMissingEINReasonCd">
			<div class="styTopSectionLine">
				<div class="styTopSectionLineLbl" style="float:left">
					 Missing Corporation EIN Reason Code:
				</div>
				<div class="styExplanationLine" style="float:left">
					<xsl:call-template name="PopulateText">
						<xsl:with-param name="TargetNode" select="$DependencyData/CorporationMissingEINReasonCd"/>
					</xsl:call-template>
				</div>
			</div>
		</xsl:when>
		</xsl:choose>
		<xsl:if test="$DependencyData/CorporationName">
			<div class="styTopSectionLine">
				<div class="styTopSectionLineLbl" style="float:left">
					Name of Corporation:
				</div>
				<div class="styExplanationLine" style="float:left">
					<xsl:call-template name="PopulateText">
						<xsl:with-param name="TargetNode" select="$DependencyData/CorporationName/BusinessNameLine1Txt"/>
					</xsl:call-template>
					
					<xsl:if test="$DependencyData/CorporationName/BusinessNameLine2Txt">
					<br />
					<xsl:call-template name="PopulateText">
						<xsl:with-param name="TargetNode" select="$DependencyData/CorporationName/BusinessNameLine2Txt"/>
					</xsl:call-template>
					</xsl:if>
				</div>
			</div>
		</xsl:if>
		<xsl:choose>
			<xsl:when test="$DependencyData/ShareholderEIN">
			<div class="styTopSectionLine">
				<div class="styTopSectionLineLbl" style="float:left">
					Shareholder EIN:
				</div>
				<div class="styExplanationLine" style="float:left">
					<xsl:call-template name="PopulateEIN">
						<xsl:with-param name="TargetNode" select="$DependencyData/ShareholderEIN"/>
					</xsl:call-template>
				</div>
			</div>
			</xsl:when>
			<xsl:when test="$DependencyData/ShareholderSSN">
			<div class="styTopSectionLine">
				<div class="styTopSectionLineLbl" style="float:left">
					Shareholder SSN:
				</div>
				<div class="styExplanationLine" style="float:left">
					<xsl:call-template name="PopulateSSN">
						<xsl:with-param name="TargetNode" select="$DependencyData/ShareholderSSN"/>
					</xsl:call-template>
				</div>
			</div>
			</xsl:when>
			<xsl:when test="$DependencyData/ShareholderMissingTINReasonCd">
			<div class="styTopSectionLine">
				<div class="styTopSectionLineLbl" style="float:left">
					Missing Shareholder TIN Reason Code:
				</div>
				<div class="styExplanationLine" style="float:left">
					<xsl:call-template name="PopulateText">
						<xsl:with-param name="TargetNode" select="$DependencyData/ShareholderMissingTINReasonCd"/>
					</xsl:call-template>
				</div>
			</div>
			</xsl:when>
		</xsl:choose>
		<xsl:choose>
			<xsl:when test="$DependencyData/ShareholderName">
			<div class="styTopSectionLine">
				<div class="styTopSectionLineLbl" style="float:left">
					Name of Shareholder:
				</div>
				<div class="styExplanationLine" style="float:left">
					<xsl:call-template name="PopulateText">
						<xsl:with-param name="TargetNode" select="$DependencyData/ShareholderName/BusinessNameLine1Txt"/>
					</xsl:call-template>
					
					<xsl:if test="$DependencyData/ShareholderName/BusinessNameLine2Txt">
					<br />
					<xsl:call-template name="PopulateText">
						<xsl:with-param name="TargetNode" select="$DependencyData/ShareholderName/BusinessNameLine2Txt"/>
					</xsl:call-template>
					</xsl:if>
				</div>
			</div>
			</xsl:when>
			<xsl:when test="$DependencyData/ShareholderPersonNm">
			<div class="styTopSectionLine">
				<div class="styTopSectionLineLbl" style="float:left">
					Name of Shareholder:
				</div>
				<div class="styExplanationLine" style="float:left">
					<xsl:call-template name="PopulateText">
						<xsl:with-param name="TargetNode" select="$DependencyData/ShareholderPersonNm"/>
					</xsl:call-template>
				</div>
			</div>
			</xsl:when>
		</xsl:choose>
			
		<!--End of header-->		
		
		<table id="INOLDTbl" class="styDepTbl" style="font-size:7pt;">
			<thead class="styTableThead">
				<tr class="styDepTblHdr">           
					<th class="styDepTblCell" scope="col" style="width:15mm;">(a) Row number of distributing foreign corporation</th>
					<th class="styDepTblCell" scope="col" style="width:95mm;">(b) Description of ownership chain</th>					
				</tr>
			</thead>
			<tbody>
				<xsl:for-each select="$DependencyData/SchK2K3DistriOwnrChainGrp">
					<tr>
						<xsl:attribute name="class">
							<xsl:choose>
								<xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when>
								<xsl:otherwise>styDepTblRow2</xsl:otherwise>
							</xsl:choose>
						</xsl:attribute>
						<td class="styDepTblCell" style="text-align:center;">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="RowId"/>
							</xsl:call-template>
						</td>
						<td class="styDepTblCell" style="text-align:left;">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="MediumExplanationTxt"/>
							</xsl:call-template>
						</td>						
					</tr>
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
					<!--<xsl:if test="not($Print) or $Print=''"> -->
						<xsl:call-template name="AddOnStyle"></xsl:call-template>
					<!-- </xsl:if> -->
				</style>
				<xsl:call-template name="GlobalStylesDep"/>
			</head>
			<body class="styBodyClass" >
				<xsl:call-template name="DocumentHeaderDependency"></xsl:call-template>
				<div class="styDepTitleLine">
					<span class="styDepTitle" style="">
						<xsl:value-of select="$depDocTitle" />
					</span>
				</div>
				<!--Adding template for left over data  -->
				<xsl:call-template name="PopulateDepCommonLeftover"><xsl:with-param name="TargetNode" select="$DependencyData" /></xsl:call-template>
				<xsl:call-template name="ShowDependencyData" />
				<br/>
			</body>
		</html>
	</xsl:template>
</xsl:stylesheet>