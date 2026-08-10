<?xml version="1.0" encoding="UTF-8"?>
<!-- 11/14/2024 - Changes for 1302748 - AJH -->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:output method="html" indent="yes"/>
	<xsl:strip-space elements="*"/>
	<xsl:include href="PopulateTemplate.xsl"/>
	<xsl:include href="CommonPathRef.xsl"/>
	<xsl:include href="AddHeader.xsl"/>
	<xsl:include href="AddOnTable.xsl"/>
	<xsl:param name="DependencyData" select="$RtnDoc/OtherBaseErosionPaymentsStmt"/>
	<!-- Other Base Erosion Payments Statement -->
  <xsl:param name="depDocTitle">
  <xsl:call-template name="PopulateDisplayName"><xsl:with-param name="TargetNode" select="$DependencyData"/></xsl:call-template>  
  </xsl:param>	
	<xsl:template name="ShowDependencyData">		
		<table id="DependencyDataTbl" class="styDepTbl" style="font-size: 6pt">
			<thead class="styTableThead">
				<tr class="styDepTblHdr">
					<th class="styDepTblCell" scope="col" style="width:25mm;">Aggregate Group Payment Amount</th>
					<th class="styDepTblCell" scope="col" style="width:25mm;">Aggregate Group Benefit Amount</th>
					<th class="styDepTblCell" scope="col" style="width:25mm;">Taxpayer Group Payment Amount</th>
					<th class="styDepTblCell" scope="col" style="width:25mm;">Taxpayer Group Benefit Amount</th>
					<th class="styDepTblCell" scope="col" style="width:18mm;">Twenty Five Percent Owner Indicator</th>
					<th class="styDepTblCell" scope="col" style="width:18mm;">Person Related 267(b) Or 707(b)(1) Indicator</th>
					<th class="styDepTblCell" scope="col" style="width:18mm;">Person Related Section 482 Indicator</th>
					<th class="styDepTblCell" scope="col">Description</th>
				</tr>
			</thead>
			<tfoot/>
			<tbody>
					<tr>
						<td class="styDepTblCell" style="text-align:right">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$DependencyData/AggregateBaseErosionPymtAmt"/>
							</xsl:call-template>
						</td>
						<td class="styDepTblCell" style="text-align:right; width: 25mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$DependencyData/AggregateBaseErosionTaxBnftAmt"/>
							</xsl:call-template>
						</td>
						<td class="styDepTblCell" style="text-align:right; width: 25mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$DependencyData/TaxpayerBaseErosionPymtAmt"/>
							</xsl:call-template>
						</td>
						<td class="styDepTblCell" style="text-align:right; width: 25mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$DependencyData/TaxpayerBaseErosionTaxBnftAmt"/>
							</xsl:call-template>
						</td>
					<td class="styDepTblCell" style="text-align:center; width: 18mm">
							<input type="checkbox" class="styCkbox" name="Checkbox">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$DependencyData/Any25PercentageOwnerInd"/>
									<xsl:with-param name="BackupName">Any25PercentageOwnerInd</xsl:with-param>
								</xsl:call-template>
							</input>
							<span style="width: 2mm"/>
							<label>
								<xsl:call-template name="PopulateLabel">
									<xsl:with-param name="TargetNode" select="$DependencyData/Any25PercentageOwnerInd"/>
									<xsl:with-param name="BackupName">Any25PercentageOwnerInd</xsl:with-param>
								</xsl:call-template>
							</label>
						</td>
					<td class="styDepTblCell" style="text-align:center; width: 18mm">
							<input type="checkbox" class="styCkbox" name="Checkbox">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$DependencyData/PersonRelated267bOr707b1Ind"/>
									<xsl:with-param name="BackupName">PersonRelated267bOr707b1Ind</xsl:with-param>
								</xsl:call-template>
							</input>
							<span style="width: 2mm"/>
							<label>
								<xsl:call-template name="PopulateLabel">
									<xsl:with-param name="TargetNode" select="$DependencyData/PersonRelated267bOr707b1Ind"/>
									<xsl:with-param name="BackupName">PersonRelated267bOr707b1Ind</xsl:with-param>
								</xsl:call-template>
							</label>
						</td>
					<td class="styDepTblCell" style="text-align:center; width: 18mm">
							<input type="checkbox" class="styCkbox" name="Checkbox">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$DependencyData/PersonRelatedSection482Ind"/>
									<xsl:with-param name="BackupName">PersonRelatedSection482Ind</xsl:with-param>
								</xsl:call-template>
							</input>
							<span style="width: 2mm"/>
							<label>
								<xsl:call-template name="PopulateLabel">
									<xsl:with-param name="TargetNode" select="$DependencyData/PersonRelatedSection482Ind"/>
									<xsl:with-param name="BackupName">PersonRelatedSection482Ind</xsl:with-param>
								</xsl:call-template>
							</label>
						</td>
						<td class="styDepTblCell" style="text-align:left">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$DependencyData/Desc"/>
							</xsl:call-template>
						</td>
					</tr>
			</tbody>
		</table>
	</xsl:template>
  <!-- Main template -->
  <xsl:template match="/">

    <xsl:text disable-output-escaping="yes">&lt;!DOCTYPE html&gt;</xsl:text>
		<html>
      <head>
				<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
           <title><xsl:value-of select="$depDocTitle"/></title>
         <!-- No Browser Caching -->
         <meta http-equiv="Pragma" content="no-cache"/>
         <meta http-equiv="Cache-Control" content="no-cache"/>
         <meta http-equiv="Expires" content="0"/>
         <!-- No Proxy Caching -->
         <meta http-equiv="Cache-Control" content="private"/>
         <!-- Define Character Set -->
         <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1"/>         
         <meta name="Description" content="{$depDocTitle}"/>
         <script language="JavaScript" src="{$ScriptPath}/FormDisplay.js"/>
        <xsl:call-template name="InitJS"/>
        <style type="text/css">
  <xsl:if test="not($Print) or $Print=''">
    <xsl:call-template name="AddOnStyle"/>    
  </xsl:if>
</style>
      <xsl:call-template name="GlobalStylesDep"/>
</head>    
      <body class="styBodyClass">
        <xsl:call-template name="DocumentHeaderDependency"/>  
        <div class="styDepTitleLine">
          <span class="styDepTitle">
            <span><xsl:value-of select="$depDocTitle"/></span>            
          </span>
        </div>
        <xsl:call-template name="PopulateDepCommonLeftover">
        <xsl:with-param name="TargetNode" select="$DependencyData"/></xsl:call-template>
        <span style="height:5px;"/>
        <xsl:call-template name="ShowDependencyData">
        </xsl:call-template>  
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>










