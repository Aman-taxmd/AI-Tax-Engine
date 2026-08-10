<?xml version="1.0" encoding="UTF-8"?>
<!-- Created by Sergey Smirnov on 09/20/2023 -->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  
  <xsl:include href="CommonPathRef.xsl"/>
  <xsl:include href="AddHeader.xsl"/>
  <xsl:include href="AddOnTable.xsl"/>
  <xsl:include href="PopulateTemplate.xsl"/>

  <xsl:output method="html" indent="yes"/>
  <xsl:strip-space elements="*"/>

  <xsl:param name="DependencyData" select="$RtnDoc/ResidentialCleanEnergyHomeStmt"/>

  <xsl:param name="depDocTitle">
     <xsl:call-template name="PopulateDisplayName">
        <xsl:with-param name="TargetNode" select="$DependencyData"/>
     </xsl:call-template>  
  </xsl:param>
  
<xsl:template name="OneLineHomeAddress">
	<xsl:param name="TotalWidth"/>
	<xsl:param name="TargetNode"/>
	<div style="width:{$TotalWidth}; font-size:7pt;">
	<div style="width:33%; margin:0mm 1mm 0mm 0mm">
		<div>
			<xsl:call-template name="PopulateText">	
				<xsl:with-param name="TargetNode" 
				select="$TargetNode/AddressLine1Txt"/>
			</xsl:call-template>							
		</div>
		<div style="width:100%;border-top:1px solid black">Number and Street</div>
	</div>
	<div style="width:14%; margin:0mm 1mm 0mm 0mm">							
		<div>
			<xsl:call-template name="PopulateText">	
				<xsl:with-param name="TargetNode" 
				select="$TargetNode/AddressLine2Txt"/>
			</xsl:call-template>							
		</div>
	<div style="width:100%;border-top:1px solid black">Unit no.</div>
	</div>
	<div style="width:26%; margin:0mm 1mm 0mm 0mm">
		<div>
			<xsl:call-template name="PopulateText">	
				<xsl:with-param name="TargetNode" 
				select="$TargetNode/CityNm"/>
			</xsl:call-template>							
		</div>
	<div style="width:100%;border-top:1px solid black">City or town</div>
	</div>
	<div style="width:7%; margin:0mm 1mm 0mm 0mm">							
		<div>
			<xsl:call-template name="PopulateText">	
				<xsl:with-param name="TargetNode" 
				select="$TargetNode/StateAbbreviationCd"/>
			</xsl:call-template>							
		</div>
	<div style="width:100%;border-top:1px solid black">State</div>
	</div>
	<div style="width:10%; margin:0mm 1mm 0mm 1mm">							
		<div>
			<xsl:call-template name="PopulateText">	
				<xsl:with-param name="TargetNode" 
				select="$TargetNode/ZIPCd"/>
			</xsl:call-template>							
		</div>
	<div style="width:100%;border-top:1px solid black">ZIP code</div>
	</div>
	</div>
	</xsl:template>	  
    
  <xsl:template name="OneHomeTable">
	<xsl:param name="TargetNode" />
	<div style="width:187mm; margin:2mm; padding:2mm; border:1px solid black">
	<xsl:call-template name="OneLineHomeAddress">
		<xsl:with-param name="TotalWidth">187mm</xsl:with-param>
		<xsl:with-param name="TargetNode" select="$TargetNode/ResidentialCleanEgyHomeAddress"/>
	</xsl:call-template>  
	
	<div style="font-size:10pt; width:100%">
	<table style="width:100%">
		<tbody>
			<tr>
				<td>Qualified solar electric property costs</td>
				<td>
				<xsl:call-template name="PopulateAmount">
					<xsl:with-param name="TargetNode" select="$TargetNode/SolarElecPropCostAmt"/>
				</xsl:call-template>
				</td>
			</tr>
			<tr>
				<td>Qualified solar water heating property costs</td>
				<td>
				<xsl:call-template name="PopulateAmount">
					<xsl:with-param name="TargetNode" select="$TargetNode/SolarWaterHtPropCostAmt"/>
				</xsl:call-template>
				</td>
			</tr><tr>
				<td>Qualified small wind energy property costs</td>
				<td>
				<xsl:call-template name="PopulateAmount">
					<xsl:with-param name="TargetNode" select="$TargetNode/SmallWindPropCostAmt"/>
				</xsl:call-template>
				</td>
			</tr><tr>
				<td>Qualified geothermal heat pump property cost</td>
				<td>
				<xsl:call-template name="PopulateAmount">
					<xsl:with-param name="TargetNode" select="$TargetNode/GeothrmlHtPumpPropCostAmt"/>
				</xsl:call-template>
				</td>
			</tr><tr>
				<td>Qualified battery technology costs</td>
				<td>
				<xsl:call-template name="PopulateAmount">
					<xsl:with-param name="TargetNode" select="$TargetNode/QlfyBatteryStorageTechCostsAmt"/>
				</xsl:call-template>
				</td>
			</tr>
		</tbody>
	</table>
	</div>
	</div>	
	
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
         <meta name="Author" content="Sergey Smirnov:: sergey.n.smirnov@irs.gov"/>
         <meta name="Description" content="{$depDocTitle}"/>
         
        <script language="JavaScript" src="{$ScriptPath}/FormDisplay.js" type="text/javascript"/>
        <xsl:call-template name="InitJS"/>
        <style type="text/css">
          <xsl:if test="not($Print) or $Print=''">
            <xsl:call-template name="AddOnStyle"/>    
          </xsl:if>
        </style>
      <xsl:call-template name="GlobalStylesDep"/>
		  <style>
		   td { width:50%; border-bottom: 1px solid black }
		  </style>
	  </head>
    
      <body class="styBodyClass">
      <xsl:call-template name="DocumentHeaderDependency"/>
    
        <div class="styDepTitleLine">
          <span class="styDepTitle">
            <span style="width:82mm;">
              <xsl:value-of select="$depDocTitle"/>
            </span>
          </span>
        </div>
        
        <xsl:call-template name="PopulateDepCommonLeftover"><xsl:with-param name="TargetNode" select="$DependencyData"/></xsl:call-template>                
		<xsl:for-each select="$DependencyData/ResidentialCleanEgyCrStmtGrp">        
        <xsl:call-template name="OneHomeTable">
			<xsl:with-param name="TargetNode" select="."/>
        </xsl:call-template>
        </xsl:for-each>    
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>
