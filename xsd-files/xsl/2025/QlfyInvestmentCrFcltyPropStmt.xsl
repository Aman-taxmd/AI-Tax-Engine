<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">

	<xsl:output method="html" indent="yes" />
	<xsl:strip-space elements="*" /> 

	<xsl:include href="PopulateTemplate.xsl"/>
	<xsl:include href="AddHeader.xsl"/>
	<xsl:include href="CommonPathRef.xsl"/>
	<xsl:include href="AddOnTable.xsl"/>

    <xsl:param name="CCSData" select="$RtnDoc/QlfyInvestmentCrFcltyPropStmt"/>
    <!-- HINTS: Qualified Investment Credit Facility Property Statement for form 3468-->

	<xsl:template name="ShowDependencyData">
		<!-- Add stylesheet dependency code here -->
		
		<!--Added Header Elements start here-->
		<div class="styTopSectionLine">
			<div class="styTopSectionLineLbl" style="float:left">
				Name:
			</div>
			<div class="styExplanationLine" style="float:left">
				<xsl:choose>
					<xsl:when test="$CCSData/BusinessName/BusinessNameLine1Txt">
							
						<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$CCSData/BusinessName/BusinessNameLine1Txt"/>
							</xsl:call-template>
							<br/>
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$CCSData/BusinessName/BusinessNameLine2Txt"/>
							</xsl:call-template>
					</xsl:when>
					<xsl:otherwise>
						<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$CCSData/PersonNm"/>
							</xsl:call-template>
							<br/>
					</xsl:otherwise>
				</xsl:choose>
				
			</div>
		</div>
		<div class="styTopSectionLine">
			<div class="styTopSectionLineLbl" style="float:left">
				<br/>
				Address:
			</div>
			<div class="styExplanationLine" style="float:left">
				<xsl:choose>
					<!-- US Address -->
					<xsl:when test="$CCSData/USAddress">
						<xsl:if test="$CCSData/USAddress/AddressLine1Txt!='' ">
						  <br/>
							<xsl:call-template name="PopulateText">
							  <xsl:with-param name="TargetNode" select="$CCSData/USAddress/AddressLine1Txt"/>
							</xsl:call-template>
						</xsl:if>              
						<xsl:if test="$CCSData/USAddress/AddressLine2Txt!=''">
						  <br/>
							<xsl:call-template name="PopulateText">
							  <xsl:with-param name="TargetNode" select="$CCSData/USAddress/AddressLine2Txt"/>
							</xsl:call-template>
						</xsl:if>              
						<xsl:if test="$CCSData/USAddress/CityNm!=''">
						  <br/>
							<xsl:call-template name="PopulateText">
							  <xsl:with-param name="TargetNode" select="$CCSData/USAddress/CityNm"/>
							</xsl:call-template>,
						</xsl:if>    
						<xsl:if test="$CCSData/USAddress/StateAbbreviationCd!=''">
							<xsl:call-template name="PopulateText">
							  <xsl:with-param name="TargetNode" select="$CCSData/USAddress/StateAbbreviationCd"/>
							</xsl:call-template>
						</xsl:if>
						<br/>
						<xsl:if test="$CCSData/USAddress/ZIPCd!=''">
							<xsl:call-template name="PopulateText">
							  <xsl:with-param name="TargetNode" select="$CCSData/USAddress/ZIPCd"/>
							</xsl:call-template>
						</xsl:if>            
					</xsl:when>
					<!-- Foreign Address -->             
					<xsl:otherwise>
						<xsl:if test="$CCSData/ForeignAddress/AddressLine1Txt!=''">
						  <br/>
							<xsl:call-template name="PopulateText">
							  <xsl:with-param name="TargetNode" select="$CCSData/ForeignAddress/AddressLine1Txt"/>
							</xsl:call-template>
						</xsl:if>  
						<xsl:if test="$CCSData/ForeignAddress/AddressLine2Txt!=''">
						  <br/>
							<xsl:call-template name="PopulateText">
							  <xsl:with-param name="TargetNode" select="$CCSData/ForeignAddress/AddressLine2Txt"/>
							</xsl:call-template>
						</xsl:if>              
						<xsl:if test="$CCSData/ForeignAddress/CityNm!=''">
						<br/>
							<xsl:call-template name="PopulateText">
							  <xsl:with-param name="TargetNode" select="$CCSData/ForeignAddress/CityNm"/>
							</xsl:call-template>,
						</xsl:if>
						<xsl:if test="$CCSData/ForeignAddress/ProvinceOrStateNm!=''">
						   <xsl:call-template name="PopulateText">
							  <xsl:with-param name="TargetNode" select="$CCSData/ForeignAddress/ProvinceOrStateNm"/>
							</xsl:call-template>
						</xsl:if>
                        <span style="width:2mm;"/>
					  <!-- foreign postal code -->                    
						<xsl:if test="$CCSData/ForeignAddress/ForeignPostalCd!=''">
						   <xsl:call-template name="PopulateText">
							  <xsl:with-param name="TargetNode" select="$CCSData/ForeignAddress/ForeignPostalCd"/>
							</xsl:call-template>
						</xsl:if>
						<br/>
					  <!-- foreign country -->    
						<xsl:if test="$CCSData/ForeignAddress/CountryCd!=''">
							<xsl:call-template name="PopulateText">
							  <xsl:with-param name="TargetNode" select="$CCSData/ForeignAddress/CountryCd"/>
							</xsl:call-template>
						</xsl:if> 
					</xsl:otherwise>
				</xsl:choose>				
			</div>
		</div>
		<div class="styTopSectionLine">
			<div class="styTopSectionLineLbl" style="float:left">
				<br></br>
				EIN or SSN:
			</div>
			<div class="styExplanationLine" style="float:left"><br />
				<xsl:choose>
					<xsl:when test="$CCSData/EIN">
						<xsl:call-template name="PopulateEIN">
							<xsl:with-param name="TargetNode" select="$CCSData/EIN"/>
						</xsl:call-template>
					</xsl:when>
					<xsl:otherwise>
						<xsl:call-template name="PopulateSSN">
							<xsl:with-param name="TargetNode" select="$CCSData/SSN"/>
						</xsl:call-template>
					</xsl:otherwise>
				</xsl:choose>
			</div>	
		</div>
		<div class="styTopSectionLine">
			<div class="styTopSectionLineLbl" style="float:left">
				<br></br>
				Phone Number:
			</div>
			<div class="styExplanationLine" style="float:left"><br />
				<xsl:choose>
					<xsl:when test="$CCSData/PhoneNum">
						<xsl:call-template name="PopulatePhoneNumber">
							<xsl:with-param name="TargetNode" select="$CCSData/PhoneNum"/>
						</xsl:call-template>
					</xsl:when>
					<xsl:otherwise>
						<xsl:call-template name="PopulateText">
							<xsl:with-param name="TargetNode" select="$CCSData/ForeignPhoneNum"/>
						</xsl:call-template>
					</xsl:otherwise>
				</xsl:choose>
			</div>
		</div>		
		<!--End of header-->
		<table id="QlfyInvstCrTbl" class="styDepTblLandscape" style="text-align:center;">
		  <thead class="styTableThead">
			<tr class="styDepTblHdr">
			  <th class="styDepTblCell" scope="col" style="width:60mm;"></th>
			</tr>
		  </thead>
		  <tfoot/>
		  <tbody>
			<xsl:for-each select="$CCSData/QlfyInvestmentCrFcltyPropGrp">
			  <tr>
				<xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1
					</xsl:when><xsl:otherwise>styDepTblRow2
				</xsl:otherwise></xsl:choose></xsl:attribute>
				<td class="styDepTblCell" style="text-align:left;">
				<span style="font-size: 10pt;font-weight:bold">Description of the facility</span><br/>
				  <xsl:call-template name="PopulateText">
					<xsl:with-param name="TargetNode" select="TechnicalDesc"/>
				  </xsl:call-template>
					<br/>
					<br/>
				<span style="font-size: 10pt;font-weight:bold">Generating capacity</span><br/>
				  <xsl:call-template name="PopulateText">
					<xsl:with-param name="TargetNode" select="GeneratingCapacityQty"/>
				  </xsl:call-template>
					<br/>
					<br/>
					<xsl:for-each select="EnergyPropertyInformationGrp">
				<span style="font-size: 10pt;font-weight:bold">Description of energy property</span><br/>
					  <xsl:call-template name="PopulateText">
						<xsl:with-param name="TargetNode" select="TechnicalDesc"/>
					  </xsl:call-template>
						<br/>
						<br/>
				<span style="font-size: 10pt;font-weight:bold">Date energy property placed in service</span><br/>
					  <xsl:call-template name="PopulateText">
						<xsl:with-param name="TargetNode" select="PlacedInServiceDt"/>
					  </xsl:call-template>
						<br/>
						<br/>
				<span style="font-size: 10pt;font-weight:bold">Energy property basis amount</span><br/>
					  <xsl:call-template name="PopulateText">
						<xsl:with-param name="TargetNode" select="BasisAmt"/>
					  </xsl:call-template>
						<br/>
						<br/>
				<span style="font-size: 10pt;font-weight:bold">Remaining basis in energy property after credit claimed
				</span><br/>
					  <xsl:call-template name="PopulateText">
						<xsl:with-param name="TargetNode" select="RmngBasisAfterCrClaimedAmt"/>
					  </xsl:call-template>
						<br/>
						<br/>
					</xsl:for-each>
				</td>
			  </tr>
			</xsl:for-each>
		  </tbody>
		</table>
		<div class="styTopSectionLine">
			<div class="styTopSectionLineLbl" style="float:left">
				Did not or will not claim section 1603 grant Statement:
			</div>
			<div class="styExplanationLine" style="float:left"><br />
				<xsl:call-template name="PopulateText">
					<xsl:with-param name="TargetNode" select="$CCSData/DidNotClmSect1603GrantStmtTxt"/>
				</xsl:call-template>
			</div>
		</div>
		<div class="styTopSectionLine">
			<div class="styTopSectionLineLbl" style="float:left">
				Declaration statement:
			</div>
			<div class="styExplanationLine" style="float:left"><br />
				<xsl:call-template name="PopulateText">
					<xsl:with-param name="TargetNode" select="$CCSData/DidNotClmSect1603GrantStmtTxt"/>
				</xsl:call-template>
			</div>
		</div>
		
	</xsl:template>

	<xsl:param name="depDocTitle">
		<xsl:call-template name="PopulateDisplayName"><xsl:with-param name="TargetNode" select="$CCSData" />
		</xsl:call-template>
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
				<xsl:call-template name="DocumentHeaderDependencyLandscape"></xsl:call-template>
					<div class="styDepTitleLineLandscape">
						<span class="styDepTitle" style="">
							<xsl:value-of select="$depDocTitle" />
						</span>
					</div>
					<!--Adding template for left over data  -->
					<xsl:call-template name="PopulateDepCommonLeftover"><xsl:with-param name="TargetNode" select="$CCSData" />
					</xsl:call-template>
				<xsl:call-template name="ShowDependencyData" />
				<br/>
			</body>
		</html>
	</xsl:template>
</xsl:stylesheet>
