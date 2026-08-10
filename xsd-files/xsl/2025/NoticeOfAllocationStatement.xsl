<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:include href="CommonPathRef.xsl"/>
	<xsl:include href="AddHeader.xsl"/>
	<xsl:include href="AddOnTable.xsl"/>
	<xsl:include href="PopulateTemplate.xsl"/>
	<xsl:output method="html" indent="yes"/>
	<xsl:strip-space elements="*"/>
	<xsl:param name="DependencyData" select="$RtnDoc/NoticeOfAllocationStatement"/>
	<xsl:param name="depDocTitle">
		<xsl:call-template name="PopulateDisplayName">
			<xsl:with-param name="TargetNode" select="$DependencyData"/>
		</xsl:call-template>
	</xsl:param>
	<!-- Main template -->
	<xsl:template match="/">
		<xsl:text disable-output-escaping="yes">&lt;!DOCTYPE html&gt;</xsl:text>
		<html>
			<head>
				<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
				<title>
					<xsl:value-of select="$depDocTitle"/>
				</title>
				<!-- No Browser Caching -->
				<meta http-equiv="Pragma" content="no-cache"/>
				<meta http-equiv="Cache-Control" content="no-cache"/>
				<meta http-equiv="Expires" content="0"/>
				<!-- No Proxy Caching -->
				<meta http-equiv="Cache-Control" content="private"/>
				<!-- Define Character Set -->
				<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1"/>
				<meta name="Author" content="Beju Ekperigin"/>
				<meta name="Description" content="{$depDocTitle}"/>
				<script language="JavaScript" src="{$ScriptPath}/FormDisplay.js" type="text/javascript"/>
				<xsl:call-template name="InitJS"/>
				<style type="text/css">
					<xsl:if test="not($Print) or $Print=''">
						<xsl:call-template name="AddOnStyle"/>
					</xsl:if>
				</style>
				<xsl:call-template name="GlobalStylesDep"/>
			</head>
			<!-- Notice of Allocation -->
			<body class="styBodyClass">
				<xsl:call-template name="DocumentHeader"/>
				<div class="styDepTitleLine">
					<span class="styDepTitle">
						<span style="padding-right:5mm;">
							<xsl:value-of select="$depDocTitle"/>
						</span>
					</span>
				</div>
				<xsl:call-template name="PopulateDepCommonLeftover">
					<xsl:with-param name="TargetNode" select="$DependencyData"/>
				</xsl:call-template>
				<table id="NoticeAllnStmtTb" class="styDepTbl">
					<thead class="styTableThead">
						<tr class="styDepTblHdr">
							<th class="styDepTblCell" scope="col" style="width:45mm;font-weight:normal;">
								Business Name
							</th>
							<th class="styDepTblCell" scope="col" style="width:25mm;font-weight:normal;">
								EIN
							</th>
							<th class="styDepTblCell" scope="col" style="font-weight:normal;">
								Late allocation transfer year
							</th>
							<th class="styDepTblCell" scope="col" style="font-weight:normal;">
								The value of the trust assets at the effective date of the allocation
							</th>
							<th class="styDepTblCell" scope="col" style="font-weight:normal;">
								The amount or explanation of your GST exemption
							</th>
							<th class="styDepTblCell" scope="col" style="font-weight:normal;">
								The inclusion ratio of the trust after the allocation
							</th>
						</tr>
					</thead>
					<tbody>
						<xsl:for-each select="$DependencyData/AllocateGSTExemptionGrp">
							<tr>
								<xsl:attribute name="class">
									<xsl:choose>
										<xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when>
										<xsl:otherwise>styDepTblRow2</xsl:otherwise>
									</xsl:choose>
								</xsl:attribute>
								<td class="styDepTblCell" style="text-align: left;">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="BusinessName/BusinessNameLine1Txt"/>
									</xsl:call-template>
									<xsl:if test="BusinessName/BusinessNameLine2Txt">
										<br/>
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="BusinessName/BusinessNameLine2Txt"/>
										</xsl:call-template>
									</xsl:if>
								</td>
								<td class="styDepTblCell">
									<xsl:call-template name="PopulateEIN">
										<xsl:with-param name="TargetNode" select="EIN"/>
									</xsl:call-template>
								</td>
								<td class="styDepTblCell">
									<xsl:call-template name="PopulateYear">
										<xsl:with-param name="TargetNode" select="TransferYr"/>
									</xsl:call-template>
								</td>
								<td class="styDepTblCell" style="text-align: right;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="AssetValueAllocationDateAmt"/>
									</xsl:call-template>
								</td>
								<xsl:choose>
									<xsl:when test="GSTExemptionAllocatedAmt">
										<td class="styDepTblCell" style="text-align: right;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="GSTExemptionAllocatedAmt"/>
											</xsl:call-template>
										</td>
									</xsl:when>
									<xsl:otherwise>
										<td class="styDepTblCell" style="text-align: left;">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="GSTExemptionAllocatedTxt"/>
											</xsl:call-template>
										</td>
									</xsl:otherwise>
								</xsl:choose>
								<td class="styDepTblCell" style="text-align: right;">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="InclusionRt"/>
									</xsl:call-template>
								</td>
							</tr>
						</xsl:for-each>
					</tbody>
				</table>
			</body>
		</html>
	</xsl:template>
</xsl:stylesheet>