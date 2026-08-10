<?xml version="1.0" encoding="UTF-8" ?>
<!-- Last Modified by Matt Caldwell on 02/12/2025 -->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:output method="html" indent="yes" />
	<xsl:strip-space elements="*" /> 
	<xsl:include href="PopulateTemplate.xsl"/>
	<xsl:include href="AddHeader.xsl"/>
	<xsl:include href="CommonPathRef.xsl"/>
	<xsl:include href="AddOnTable.xsl"/>

	<xsl:param name="DependencyData" select="$RtnDoc/JointOccupancyStatement" />

	<xsl:template name="ShowDependencyData">
    <xsl:param name="PartNumber"/>
    <xsl:choose>
      <xsl:when test="$PartNumber = 1">
        <div class="styTopSectionLineLandscape" style="font-weight:bold;text-align:center;margin-top:3mm;">
          Part I: Qualified Fuel Cell Property
        </div>
        <table id="JointOccupancyStatementPartI" class="styDepTblLandscape">
          <thead class="styTableThead">
            <tr class="styDepTblHdr">
               <th class="styDepTblCell" scope="col">Explanation of what was purchased</th>
               <th class="styDepTblCell" scope="col">Fuel cell property kilowatt capacity amount</th>
               <th class="styDepTblCell" scope="col">Maximum qualifying costs per each one-half kilowatt of capacity amount</th>
               <th class="styDepTblCell" scope="col">Allocable credit amount</th>
               <th class="styDepTblCell" scope="col">Amount the filer paid</th>
               <th class="styDepTblCell" scope="col">Total amount paid by all the joint occupants</th>
               <th class="styDepTblCell" style="width:22.5mm" scope="col">Calculated percentage of the amount paid by the filer</th>
               <th class="styDepTblCell" scope="col">Calculated credit amount</th>
            </tr>
          </thead>      
          <xsl:for-each select="$DependencyData/QualifiedFuelCellPropertyGrp">
            <tr>
              <xsl:attribute name="class">
                <xsl:choose>
                  <xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when>
                  <xsl:otherwise>styDepTblRow2</xsl:otherwise>
                </xsl:choose>
              </xsl:attribute>
              <td class="styDepTblCell">
                <xsl:call-template name="PopulateText">
                  <xsl:with-param name="TargetNode" select="ExplanationTxt"/>
                  <xsl:with-param name="BackupName">ExplanationText</xsl:with-param>
                </xsl:call-template>          
              </td>
              <td class="styDepTblCell" style="text-align:right;">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="FuelCellPropKWCapAmt"/>
                  <xsl:with-param name="BackupName">FuelCellPropKiloWattCapAmt</xsl:with-param>
                </xsl:call-template>          
              </td>
              <td class="styDepTblCell" style="text-align:right;">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="MaxQualifyingCostsPerKWAmt"/>
                  <xsl:with-param name="BackupName">MaxQualifyingCostsPerKiloWattAmt</xsl:with-param>
                </xsl:call-template>          
              </td>
              <td class="styDepTblCell" style="text-align:right;">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="AllocableCreditAmt"/>
                  <xsl:with-param name="BackupName">AllocableCreditAmount</xsl:with-param>
                </xsl:call-template>          
              </td>
              <td class="styDepTblCell" style="text-align:right;">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="PaidAmt"/>
                  <xsl:with-param name="BackupName">PaidAmount</xsl:with-param>
                </xsl:call-template>          
              </td>
              <td class="styDepTblCell" style="text-align:right;">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="TotalJointOccupantPaidAmt"/>
                  <xsl:with-param name="BackupName">TotalJointOccupantPaidAmount</xsl:with-param>
                </xsl:call-template>          
              </td>
              <!-- PopulatePercent does not allow for the precision needed for this efile type -->
              <td class="styDepTblCell" style="text-align:right;">
                %
                <xsl:call-template name="PopulateText">
                  <xsl:with-param name="TargetNode" select="CalculatedPct"/>
                  <xsl:with-param name="BackupName">CalculatedPercent</xsl:with-param>
                </xsl:call-template>        
              </td>
              <td class="styDepTblCell" style="text-align:right;">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="CalculatedCreditAmt"/>
                  <xsl:with-param name="BackupName">CalculatedCreditAmount</xsl:with-param>
                </xsl:call-template>          
              </td>
            </tr>
          </xsl:for-each>
        </table>
      </xsl:when>
      <xsl:otherwise>
        <xsl:for-each select="$DependencyData/*">
          <div class="styTopSectionLineLandscape" style="font-weight:bold;text-align:center;margin-top:3mm;">
            <xsl:choose>
              <xsl:when test="name() = 'InsulationOrAirSealingGrp'">Part II: Insulation Or Air Sealing Material Or System</xsl:when>
              <xsl:when test="name() = 'ExteriorDoorsGrp'">Part II: Exterior Doors</xsl:when>
              <xsl:when test="name() = 'WindowsOrSkylightsGrp'">Part II: Windows And Skylights</xsl:when>
              <xsl:when test="name() = 'CentralAirConditionersGrp'">Part II: Central Air Conditioners</xsl:when>
              <xsl:when test="name() = 'GasPropaneOilWaterHeatersGrp'">Part II: Natural Gas, Propane Or Oil Water Heaters</xsl:when>
              <xsl:when test="name() = 'FurnaceOrHotWaterBoilersGrp'">Part II: Natural Gas, Propane Or Oil Furnace Or Hot Water Boilers</xsl:when>
              <xsl:when test="name() = 'BoardsCircuitsOrFeedersGrp'">Part II: Improvements Or Replacement Of Panelboards, Subpanelboards, Branch Circuits Or Feeders</xsl:when>
              <xsl:when test="name() = 'HomeEnergyAuditsGrp'">Part II: Home Energy Audits</xsl:when>
              <xsl:when test="name() = 'HeatPumpsBmssStovesBoilersGrp'">Part II: Heat Pumps And Heat Pump Water Heaters; Biomass Stoves And Biomass Boilers</xsl:when>
            </xsl:choose>
          </div>
          <xsl:if test="name() != 'QualifiedFuelCellPropertyGrp'">   
            <table class="styDepTblLandscape">
              <xsl:attribute name="id">
                <xsl:value-of select="concat('PartIITable', name())" />
              </xsl:attribute>
              <thead class="styTableThead">
                <tr class="styDepTblHdr">
                   <th class="styDepTblCell" scope="col">Explanation of what was purchased</th>
                   <th class="styDepTblCell" scope="col">Maximum allowed credit amount</th>
                   <th class="styDepTblCell" scope="col">Amount the filer paid</th>
                   <th class="styDepTblCell" scope="col">Total amount paid by all the joint occupants</th>
                   <th class="styDepTblCell" style="width:22.5mm;" scope="col">Calculated percentage of the amount paid by the filer</th>
                   <th class="styDepTblCell" scope="col">Calculated credit amount</th>
                </tr>
              </thead>
              <tr>
                <xsl:attribute name="class">
                  <xsl:choose>
                    <xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when>
                    <xsl:otherwise>styDepTblRow2</xsl:otherwise>
                  </xsl:choose>
                </xsl:attribute>
                <td class="styDepTblCell">
                  <xsl:call-template name="PopulateText">
                    <xsl:with-param name="TargetNode" select="ExplanationTxt"/>
                    <xsl:with-param name="BackupName">ExplanationText</xsl:with-param>
                  </xsl:call-template>
                </td>
                <td class="styDepTblCell" style="text-align:right;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="MaximumCreditAllowedAmt"/>
                    <xsl:with-param name="BackupName">MaximumCreditAllowedAmountt</xsl:with-param>
                  </xsl:call-template>
                </td>
                <td class="styDepTblCell" style="text-align:right;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="PaidAmt"/>
                    <xsl:with-param name="BackupName">PaidAmount</xsl:with-param>
                  </xsl:call-template>
                </td>
                <td class="styDepTblCell" style="text-align:right;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="TotalJointOccupantPaidAmt"/>
                    <xsl:with-param name="BackupName">TotalJointOccupantPaidAmount</xsl:with-param>
                  </xsl:call-template>
                </td>
                <!-- PopulatePercent does not allow for the precision needed for this efile type -->
                <td class="styDepTblCell" style="text-align:right;">
                  %
                  <xsl:call-template name="PopulateText">
                    <xsl:with-param name="TargetNode" select="CalculatedPct"/>
                    <xsl:with-param name="BackupName">CalculatedPercent</xsl:with-param>
                  </xsl:call-template>
                </td>
                <td class="styDepTblCell" style="text-align:right;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="CalculatedCreditAmt"></xsl:with-param>
                    <xsl:with-param name="BackupName">CalculatedCreditAmount</xsl:with-param>
                  </xsl:call-template>
                </td>
              </tr>
            </table>
          </xsl:if>
        </xsl:for-each>
      </xsl:otherwise>
    </xsl:choose>
	</xsl:template>
	
	<xsl:param name="depDocTitle">
		<xsl:call-template name="PopulateDisplayName"><xsl:with-param name="TargetNode" select="$DependencyData" /></xsl:call-template>
	</xsl:param>

	<!-- Main template -->
	<xsl:template match="/">
		<xsl:text disable-output-escaping="yes">&lt;!DOCTYPE html&gt;</xsl:text>
		<html>
			<head>
				<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
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
				<xsl:call-template name="InitJS" />
				<style type="text/css">
					<xsl:if test="not($Print) or $Print=''">
						<xsl:call-template name="AddOnStyle"/>
					</xsl:if>
				</style>
				<xsl:call-template name="GlobalStylesDep"/>
			</head>
			<body class="styBodyClass" >
				<xsl:call-template name="DocumentHeaderDependency"></xsl:call-template>
				<div class="styDepTitleLine">
					<span class="styDepTitle">
						<xsl:value-of select="$depDocTitle" />
					</span>
				</div>
				<!--Adding template for left over data  -->
				<xsl:call-template name="PopulateDepCommonLeftover"><xsl:with-param name="TargetNode" select="$DependencyData" /></xsl:call-template>
        
        <!-- Part I -->
				<xsl:call-template name="ShowDependencyData">
          <xsl:with-param name="PartNumber">1</xsl:with-param>
        </xsl:call-template>
        
        <!-- Part II -->
        <xsl:call-template name="ShowDependencyData">
          <xsl:with-param name="PartNumber">2</xsl:with-param>
        </xsl:call-template>
				<br/>
			</body>
		</html>
	</xsl:template>	
</xsl:stylesheet>
