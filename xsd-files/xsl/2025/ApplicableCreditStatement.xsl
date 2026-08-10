<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE xsl:stylesheet [
	<!ENTITY nbsp "&#160;"> 
]>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:include href="CommonPathRef.xsl"/>
	<xsl:include href="AddHeader.xsl"/>
	<xsl:include href="AddOnTable.xsl"/>
	<xsl:include href="PopulateTemplate.xsl"/>
	<xsl:output method="html" indent="yes"/>
	<xsl:strip-space elements="*"/>
	<xsl:param name="DependencyData" select="$RtnDoc/ApplicableCreditStatement"/>
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
				<xsl:call-template name="DocumentHeaderLandscape"/>
				<div class="styDepTitleLineLandscape">
					<span class="styDepTitle">
						<span style="padding-right:5mm;">
							<xsl:value-of select="$depDocTitle"/>
						</span>
					</span>
				</div>
				<xsl:call-template name="PopulateDepCommonLeftoverLandscape">
					<xsl:with-param name="TargetNode" select="$DependencyData"/>
				</xsl:call-template>
				<table id="FirstTb" class="styDepTblLandscape">
					<thead class="styTableThead">
						<tr class="styDepTblHdr">
							<th class="styDepTblCell" scope="col" style="width:23mm;font-weight:normal;">
								Calendar Year or Calendar Quarter Code
							</th>
							<th class="styDepTblCell" scope="col" style="width:38mm;font-weight:normal;">
								Taxable Gifts for Current Period
							</th>
							<th class="styDepTblCell" scope="col" style="width:39mm;font-weight:normal;">
								Taxable Gifts for Prior Periods
							</th>
							<th class="styDepTblCell" scope="col" style="width:39mm;font-weight:normal;">
								Cumulative Taxable Gifts Including Current Period
							</th>
							<th class="styDepTblCell" scope="col" style="width:39mm;font-weight:normal;">
								Tax on Gifts for Prior Periods
							</th>
							<th class="styDepTblCell" scope="col" style="width:39mm;font-weight:normal;">
								Tax on Cumulative Gifts Including Current Period
							</th>
							<th class="styDepTblCell" scope="col" style="width:39mm;font-weight:normal;">
								Tax on Gifts for Current Period
							</th>
						</tr>
					</thead>
					<tbody>
						<xsl:for-each select="$DependencyData/ApplicableCreditGrp">
							<tr>
								<xsl:attribute name="class">
									<xsl:choose>
										<xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when>
										<xsl:otherwise>styDepTblRow2</xsl:otherwise>
									</xsl:choose>
								</xsl:attribute>
								<td class="styDepTblCell">
									<xsl:call-template name="PopulateYear">
										<xsl:with-param name="TargetNode" select="CalendarYr"/>
									</xsl:call-template>
									<br />
									<xsl:for-each select="CalendarQuarterCd">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="."/>
										</xsl:call-template>
										<xsl:if test="position() != last()">,<span style="width:4px;"/></xsl:if>
									</xsl:for-each>
								</td>
								<td class="styDepTblCell" style="text-align: right;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="TaxableGiftsAmt"/>
									</xsl:call-template>
								</td>
								<td class="styDepTblCell" style="text-align: right;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="PriorPrdTaxableGiftsAmt"/>
									</xsl:call-template>
								</td>
								<td class="styDepTblCell" style="text-align: right;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="CumulativeTaxableGiftsAmt"/>
									</xsl:call-template>
								</td>
								<td class="styDepTblCell" style="text-align: right;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="PriorPrdGiftsTaxAmt"/>
									</xsl:call-template>
								</td>
								<td class="styDepTblCell" style="text-align: right;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="CumulativeGiftsTaxAmt"/>
									</xsl:call-template>
								</td>
								<td class="styDepTblCell" style="text-align: right;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="GiftsTaxAmt"/>
									</xsl:call-template>
								</td>
							</tr>
						</xsl:for-each>
					</tbody>
				</table>
				<br/>
				<table id="SecondTb" class="styDepTblLandscape">
					<thead class="styTableThead">
						<tr class="styDepTblHdr">
							<th class="styDepTblCell" scope="col" style="width:23mm;font-weight:normal;">
								Used DSUE Amount from Predeceased Spouses and Restored Exclusion Amount
							</th>
							<th class="styDepTblCell" scope="col" style="width:38mm;font-weight:normal;">
								Basic Exclusion Amount for Year of Gift
							</th>
							<th class="styDepTblCell" scope="col" style="width:39mm;font-weight:normal;">
								Applicable Exclusion Amount
							</th>
							<th class="styDepTblCell" scope="col" style="width:39mm;font-weight:normal;">
								Applicable Credit Amount
							</th>
							<th class="styDepTblCell" scope="col" style="width:39mm;font-weight:normal;">
								Applicable Credit Amount Used in Prior Periods
							</th>
							<th class="styDepTblCell" scope="col" style="width:39mm;font-weight:normal;">
								Available Credit in Current Period
							</th>
							<th class="styDepTblCell" scope="col" style="width:39mm;font-weight:normal;">
								Credit Allowable
							</th>
						</tr>
					</thead>
					<tbody>
						<xsl:for-each select="$DependencyData/ApplicableCreditGrp">
							<tr>
								<xsl:attribute name="class">
									<xsl:choose>
										<xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when>
										<xsl:otherwise>styDepTblRow2</xsl:otherwise>
									</xsl:choose>
								</xsl:attribute>
								<td class="styDepTblCell" style="text-align: right;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="UsedDSUERestoredExclusionAmt"/>
									</xsl:call-template>
								</td>
								<td class="styDepTblCell" style="text-align: right;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="BasicExclusionAmt"/>
									</xsl:call-template>
								</td>
								<td class="styDepTblCell" style="text-align: right;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="ApplicableExclusionAmt"/>
									</xsl:call-template>
								</td>
								<td class="styDepTblCell" style="text-align: right;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="ApplicableCreditAmt"/>
									</xsl:call-template>
								</td>
								<td class="styDepTblCell" style="text-align: right;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="PriorPrdApplicableCreditAmt"/>
									</xsl:call-template>
								</td>
								<td class="styDepTblCell" style="text-align: right;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="AvailableCreditAmt"/>
									</xsl:call-template>
								</td>
								<td class="styDepTblCell" style="text-align: right;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="CreditAllowableAmt"/>
									</xsl:call-template>
								</td>
							</tr>
						</xsl:for-each>
					</tbody>
				</table>
				<div class="styTopSectionLineLandscape">
					<div class="styDepGenericDiv" style="font-weight: bold;width:128mm;">
					Total Applicable Credit Used in Prior Periods:
					</div>
					<div class="" style="width:128mm;">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$DependencyData/TotPriorPrdApplicableCreditAmt"/>
						</xsl:call-template>
					</div>
				</div>
			</body>
		</html>
	</xsl:template>
</xsl:stylesheet>