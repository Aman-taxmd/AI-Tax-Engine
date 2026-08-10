<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output method="html" indent="yes"/>
  <xsl:strip-space elements="*"/>  
  <xsl:include href="PopulateTemplate.xsl"/>
  <xsl:include href="AddHeader.xsl"/>
  <xsl:include href="CommonPathRef.xsl"/>
  <xsl:include href="AddOnTable.xsl"/>  
    
  <xsl:param name="DependencyData" select="$RtnDoc/ForeclosurePropNetIncmStmt"/>
  
  <!-- Template to display Foreclosure Property Net Income Statement -->
  
  <xsl:template name="ShowDependencyData">
    <xsl:for-each select="$DependencyData/ForeclosurePropertyElectionGrp">
		<br /><br /><br />
		<div class="styTopSectionLine" style="font-weight:bold;">
			ForeclosurePropertyElectionGrp Instance <xsl:value-of select="position()"/>
		</div>
		<div class="styTopSectionLine">
			<div class="styTopSectionLineLbl" style="float:left;">Business Name:</div>
			<div style="float:left;clear:right;width:117mm;">
				<xsl:call-template name="PopulateText">
					<xsl:with-param name="TargetNode" select="BusinessName/BusinessNameLine1Txt"/>
				</xsl:call-template>
				<xsl:if test="BusinessName/BusinessNameLine2Txt">
					<br />
					<xsl:call-template name="PopulateText">
						<xsl:with-param name="TargetNode" select="BusinessName/BusinessNameLine2Txt"/>
					</xsl:call-template>
				</xsl:if>
			</div>
		</div>
		<div class="styTopSectionLine">
			<div class="styTopSectionLineLbl" style="float:left;">Address:</div>
			<div style="float:left;clear:right;">
				<xsl:choose>
					<xsl:when test="ForeignAddress">
						<xsl:call-template name="PopulateForeignAddressTemplate">
							<xsl:with-param name="TargetNode" select="ForeignAddress"/>
						</xsl:call-template>
					</xsl:when>
					<xsl:otherwise>
						<xsl:call-template name="PopulateUSAddressTemplate">
							<xsl:with-param name="TargetNode" select="USAddress"/>
						</xsl:call-template>
					</xsl:otherwise>
				</xsl:choose>
			</div>
		</div>
		<div class="styTopSectionLine">
			<div class="styTopSectionLineLbl" style="float:left;">EIN:</div>
			<div style="float:left;clear:right;">
				<xsl:call-template name="PopulateEIN">
					<xsl:with-param name="TargetNode" select="EIN"/>
				</xsl:call-template>
			</div>
		</div>
		<div class="styTopSectionLine">
			<div class="styTopSectionLineLbl" style="float:left;">Date property was acquired:</div>
			<div style="float:left;clear:right;">
				<xsl:call-template name="PopulateMonthDayYear">
					<xsl:with-param name="TargetNode" select="AcquiredDt"/>
				</xsl:call-template>
			</div>
		</div>
		<div class="styTopSectionLine">
			<div class="styTopSectionLineLbl" style="float:left;">How the property was acquired:</div>
			<div style="float:left;clear:right;width:117mm;">
				<xsl:call-template name="PopulateText">
					<xsl:with-param name="TargetNode" select="HowAcquiredExplanationTxt"/>
				</xsl:call-template>
			</div>
		</div>
		<div class="styTopSectionLine">
			<div class="styTopSectionLineLbl" style="float:left;">From whom the property was acquired:</div>
			<div style="float:left;clear:right;"><br />
				<xsl:call-template name="PopulateText">
					<xsl:with-param name="TargetNode" select="FromWhomAcquiredPersonNm"/>
				</xsl:call-template>
			</div>
		</div>
		<div class="styTopSectionLine">
			<div class="styTopSectionLineLbl" style="float:left;">A description of the lease or debt with respect to which default occurred or was imminent:</div>
			<div style="float:left;clear:right;width:117mm;"><br /><br />
				<xsl:call-template name="PopulateText">
					<xsl:with-param name="TargetNode" select="LeaseOrDebtExplanationTxt"/>
				</xsl:call-template>
			</div>
		</div>
	</xsl:for-each>
  </xsl:template>
  
  
  <xsl:param name="depDocTitle">
    <xsl:call-template name="PopulateDisplayName"><xsl:with-param name="TargetNode" select="$DependencyData"/></xsl:call-template>  
  </xsl:param>
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
        
        <script language="JavaScript" src="{$ScriptPath}/FormDisplay.js" type="text/javascript"/>
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
          <span class="styDepTitle" style="">
            <xsl:value-of select="$depDocTitle"/>
          </span>
        </div>
        <!--Adding template for left over data  -->
        <xsl:call-template name="PopulateDepCommonLeftover">
			<xsl:with-param name="TargetNode" select="$DependencyData"/>
        </xsl:call-template>
        <div class="styTopSectionLine">
			<div class="styTopSectionLineLbl" style="float:left;">Section 856(e) Election:</div>
			<div style="float:left;clear:right;">
				<xsl:call-template name="PopulateText">
					<xsl:with-param name="TargetNode" select="$DependencyData/Section856eElectionCd"/>
				</xsl:call-template>
			</div>
		</div>
        <xsl:call-template name="ShowDependencyData"/>          
        <br/>                      
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>