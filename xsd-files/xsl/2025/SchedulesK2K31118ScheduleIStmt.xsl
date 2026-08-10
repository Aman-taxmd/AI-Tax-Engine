<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:import href="PopulateTemplate.xsl"/>
	<xsl:include href="AddHeader.xsl"/>
	<xsl:include href="CommonPathRef.xsl"/>
	<xsl:include href="AddOnTable.xsl"/>
	
	<xsl:output method="html" indent="yes"/>
	<xsl:strip-space elements="*"/>
	
	<xsl:param name="DependencyData" select="$RtnDoc/SchedulesK2K31118ScheduleIStmt"/>
	<!-- /////////////////////////////////////////// -->
	<xsl:template name="ShowDependencyData">
		<!-- Add stylesheet dependency code here -->
		<!--Added Header Elements start here-->
		<!-- Choice of Partnership or Corporation Name Line Label and data -->
		<div class="styTopSectionLineLandscape">
			<div class="styTopSectionLineLbl" style="float:left">
				<xsl:choose>
					<xsl:when test="$DependencyData/PartnershipName">
						Name of Partnership:
					</xsl:when>
					<xsl:when test="$DependencyData/CorporationName">
						Name of Corporation:
					</xsl:when>
				</xsl:choose>
			</div>
			<div class="styExplanationLine" style="float:left">
				<xsl:choose>
					<xsl:when test="$DependencyData/PartnershipName">
						<xsl:call-template name="PopulateText">
							<xsl:with-param name="TargetNode" select="$DependencyData/PartnershipName/BusinessNameLine1Txt"/>
						</xsl:call-template>
						<xsl:if test="$DependencyData/PartnershipName/BusinessNameLine2Txt">
							<br />
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$DependencyData/PartnershipName/BusinessNameLine2Txt"/>
							</xsl:call-template>
						</xsl:if>
					</xsl:when>
					<xsl:when test="$DependencyData/CorporationName">
						<xsl:call-template name="PopulateText">
							<xsl:with-param name="TargetNode" select="$DependencyData/CorporationName/BusinessNameLine1Txt"/>
						</xsl:call-template>
						<xsl:if test="$DependencyData/CorporationName/BusinessNameLine2Txt">
							<br />
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$DependencyData/CorporationName/BusinessNameLine2Txt"/>
							</xsl:call-template>
						</xsl:if>
					</xsl:when>
				</xsl:choose>
			</div>
		</div>
		<!-- Choice of Partnership or Corporation EIN Label and data -->
		<div class="styTopSectionLineLandscape">
			<div class="styTopSectionLineLbl" style="float:left">
				<xsl:choose>
					<xsl:when test="$DependencyData/PartnershipEIN">
					    <br/>
						Partnership EIN:
					</xsl:when>
					<xsl:when test="$DependencyData/PartnershipMissingEINReasonCd">
						Partnership Missing EIN Reason Code:
					</xsl:when>
					<xsl:when test="$DependencyData/CorporationMissingEINReasonCd">
						Corporation Missing EIN Reason Code:
					</xsl:when>
					<xsl:when test="$DependencyData/CorporationEIN">
						<br/>
						Corporation EIN:
					</xsl:when>
				</xsl:choose>
			</div>
			<div class="styExplanationLine" style="float:left">
				<br />
				<xsl:choose>
					<xsl:when test="$DependencyData/PartnershipEIN">
						<xsl:call-template name="PopulateEIN">
							<xsl:with-param name="TargetNode" select="$DependencyData/PartnershipEIN"/>
						</xsl:call-template>
					</xsl:when>
					<xsl:when test="$DependencyData/PartnershipMissingEINReasonCd">
						<xsl:call-template name="PopulateText">
							<xsl:with-param name="TargetNode" select="$DependencyData/PartnershipMissingEINReasonCd"/>
						</xsl:call-template>
					</xsl:when>
					<xsl:when test="$DependencyData/CorporationMissingEINReasonCd">
						<xsl:call-template name="PopulateText">
							<xsl:with-param name="TargetNode" select="$DependencyData/CorporationMissingEINReasonCd"/>
						</xsl:call-template>
					</xsl:when>
					<xsl:when test="$DependencyData/CorporationEIN">
						<xsl:call-template name="PopulateEIN">
							<xsl:with-param name="TargetNode" select="$DependencyData/CorporationEIN"/>
						</xsl:call-template>
					</xsl:when>
				</xsl:choose>				
			</div>
			<!-- Choice of Partner or Shareholder Name Label and data-->
			<div class="styTopSectionLineLandscape">
				<div class="styTopSectionLineLbl" style="float:left">
					<br></br>
					<xsl:choose>
						<xsl:when test="$DependencyData/PartnerName">
							Name of Partner:
						</xsl:when>
						<xsl:when test="$DependencyData/PartnerPersonNm">
							Partner Person Name:
						</xsl:when>
						<xsl:when test="$DependencyData/ShareholderPersonNm">
							Shareholder Person Name:
						</xsl:when>
						<xsl:otherwise>
							Name of Shareholder:
						</xsl:otherwise>
					</xsl:choose> 				
				</div>
				<div class="styExplanationLine" style="float:left"><br />
					<xsl:choose>
						<xsl:when test="$DependencyData/PartnerName">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$DependencyData/PartnerName/BusinessNameLine1Txt"/>
							</xsl:call-template>
							<br/>
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$DependencyData/PartnerName/BusinessNameLine2Txt"/>
							</xsl:call-template>
						</xsl:when>
						<xsl:when test="$DependencyData/ShareholderName">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$DependencyData/ShareholderName/BusinessNameLine1Txt"/>
							</xsl:call-template>
							<br/>
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$DependencyData/ShareholderName/BusinessNameLine2Txt"/>
							</xsl:call-template>
						</xsl:when>
						<xsl:when test="$DependencyData/PartnerPersonNm">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$DependencyData/PartnerPersonNm"/>
							</xsl:call-template>
						</xsl:when>
						<xsl:when test="$DependencyData/ShareholderPersonNm">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$DependencyData/ShareholderPersonNm"/>
							</xsl:call-template>
						</xsl:when>
					</xsl:choose>
				</div>
			</div>
			<!-- Choice of Partner or Shareholder EIN Label and data-->
			<div class="styTopSectionLineLandscape">
				<div class="styTopSectionLineLbl" style="float:left">
					<br></br>
					<xsl:choose>
						<xsl:when test="$DependencyData/PartnerEIN or $DependencyData/PartnerSSN or $DependencyData/PartnerMissingTINReasonCd">
							Partner TIN:
						</xsl:when>
						<xsl:otherwise>
							Shareholder TIN:
						</xsl:otherwise>
					</xsl:choose>
				</div>
				<div class="styExplanationLine" style="float:left"><br />
					<xsl:choose>
						<xsl:when test="$DependencyData/PartnerEIN">
							<xsl:call-template name="PopulateEIN">
								<xsl:with-param name="TargetNode" select="$DependencyData/PartnerEIN"/>
							</xsl:call-template>
						</xsl:when>
						<xsl:when test="$DependencyData/PartnerSSN">
							<xsl:call-template name="PopulateSSN">
								<xsl:with-param name="TargetNode" select="$DependencyData/PartnerSSN"/>
							</xsl:call-template>
						</xsl:when>
						<xsl:when test="$DependencyData/PartnerMissingTINReasonCd">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$DependencyData/PartnerMissingTINReasonCd"/>
							</xsl:call-template>
						</xsl:when>
						<xsl:when test="$DependencyData/ShareholderMissingTINReasonCd">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$DependencyData/ShareholderMissingTINReasonCd"/>
							</xsl:call-template>
						</xsl:when>
						<xsl:when test="$DependencyData/ShareholderSSN">
							<xsl:call-template name="PopulateSSN">
								<xsl:with-param name="TargetNode" select="$DependencyData/ShareholderSSN"/>
							</xsl:call-template>
						</xsl:when>
						<xsl:when test="$DependencyData/ShareholderEIN">
							<xsl:call-template name="PopulateEIN">
								<xsl:with-param name="TargetNode" select="$DependencyData/ShareholderEIN"/>
							</xsl:call-template>
						</xsl:when>
					</xsl:choose>
				</div>
			</div>
		</div>
		<!--End of header-->
		<br />	
				
		<!--BEGIN CATEGORY OF INCOME SECTION -->
		<div class="styBB" style="width:256mm;float:none;">
			Use a separate Schedule I (Form 1118) for each applicable category of income (see instructions).
			<br/>
			<!-- Lines a-c before Part I -->
			<div style="width:256mm;">
				<div class="styLNLeftNumBox" style="height:4mm;padding-left:2mm;">a</div>
				<div class="styLNDesc" style="width:216mm;height:4mm;">
					Separate Category (Enter code—see instructions.)
					<!-- dotted line -->
					<span class="styDotLn" style="float:none;padding-left:2mm">.....................................</span>
					<img src="{$ImagePath}/3468_Bullet.gif" width="7" alt="bullet image"/>
				</div>
				<span style="float:left;padding-right:0mm;">
					<span class="styUnderlineAmount" style="width:32mm;padding-top:0px;padding-bottom:0px;text-align:center;">
						<xsl:call-template name="PopulateText">
							<xsl:with-param name="TargetNode" select="$DependencyData/SeparateCategoryCd"/>
						</xsl:call-template>
					</span>
				</span>
			</div>
			<div style="width:256mm;">
				<div class="styLNLeftNumBox" style="height:4mm;padding-left:2mm">b</div>
				<div class="styLNDesc" style="width:216mm;height:4mm;">
					If code 901j is entered on line a, enter the country code for the sanctioned country (see instructions)
					<!-- dotted line -->
					<span class="styDotLn" style="float:none;padding-left:2mm">....................</span>
					<img src="{$ImagePath}/3468_Bullet.gif" width="7" alt="bullet image"/>
				</div>
				<span style="float:left;padding-right:0mm;">
					<span class="styUnderlineAmount" style="width:32mm;padding-top:0px;padding-bottom:0px;text-align:center;">
						<xsl:call-template name="PopulateText">
							<xsl:with-param name="TargetNode" select="$DependencyData/SanctionedCountryCd"/>
						</xsl:call-template>
					</span>
				</span>
			</div>
			<div style="width:256mm;">
				<div class="styLNLeftNumBox" style="height:4mm;padding-left:2mm">c</div>
				<div class="styLNDesc" style="width:216mm;height:4mm;">
					If one of the RBT codes is entered on line a, enter the country code for the treaty country (see instructions)
					<!-- dotted line -->
					<span class="styDotLn" style="float:none;padding-left:2mm">..................</span>
					<img src="{$ImagePath}/3468_Bullet.gif" width="7" alt="bullet image"/>
				</div>
				<span style="float:left;padding-right:0mm;">
					<span class="styUnderlineAmount" style="width:32mm;padding-top:0px;padding-bottom:0px;text-align:center;">
						<xsl:call-template name="PopulateText">
							<xsl:with-param name="TargetNode" select="$DependencyData/TreatyCountryCd"/>
						</xsl:call-template>
					</span>
				</span>
			</div>
		</div>
		<!--END CATEGORY OF INCOME SECTION-->
		<!--Table Begins Here-->
		<!-- Part I-->
		<div class="styStdDivLS">
			<div class="styPartName" style="">Part I</div>
			<div class="styPartDesc" style="width:236mm;">
				Combined Foreign Oil and Gas Income and Taxes
			</div>
		</div>
		<!-- Part I table columns 1-7 -->
		<table class="styDepTblLandscape" cellspacing="0" style="font-size:7pt;border:none;">
			<thead style="display:table-header-group;">
				<tr>
					<!-- column gray-->
					<th class="styDepTblCell" style="width:9mm;height:14mm;background-color:lightgrey;text-align:center;" rowspan="2" scope="col">
						<span style="width:1px;"/>
					</th>
					<!-- column 1a.-->
					<th class="styDepTblCell" style="width:41mm;height:14mm;text-align:center;padding-top:2mm;padding-left:2mm;
        adding-right:2mm" rowspan="2" scope="col">
						<b>1(a).</b><br/>EIN or Reference ID
					</th>
					<!-- column 1b.-->
					<th class="styDepTblCell" style="width:41mm;height:14mm;text-align:center;padding-top:2mm;padding-left:3mm;
        padding-right:3mm" rowspan="2" scope="col">
						<b>1(b).</b><br/>Foreign country or U.S. possession
					    (enter two-letter code -- use a separate line for each)
					</th>
					<!-- -->
					<th class="styDepTblCell" style="height:4mm;width:165mm;font-size:7pt;font-weight:bold;border-right-width:0px;
		text-align:center;" colspan="6" scope="col">
						Gross Foreign Oil and Gas Income From Sources Outside the United States and its Possessions
					</th>
				</tr>
					<tr>
						<!-- column 2.-->
						<th class="styDepTblCell" style="width:33mm;text-align:center;height:10mm;" scope="col">
							<span class="styBoldText">2.</span><br/> Gross foreign oil and gas extraction income
						</th>
						<!-- column 3.-->
						<th class="styDepTblCell" style="width:33mm;text-align:center;height:10mm" scope="col">
							<span class="styBoldText">3.</span><br/> Gross foreign oil related income 
						</th>
						<!-- column 4.-->
						<!--<th class="styDepTblCell" style="width:33mm;text-align:center;height:10mm" scope="col">
							<span class="styBoldText">4.</span><br/> Certain dividends from foreign corporations????
						</th>-->
						<!-- column 5.-->
						<th class="styDepTblCell" style="width:33mm;text-align:center;height:10mm" scope="col">
							<span class="styBoldText">4.</span><br/> Inclusions under sections 951(a)(1) and 951A
						</th>
						<!-- column 6.-->
						<th class="styDepTblCell" style="width:33mm;border-right-width:1px;text-align:center;height:10mm" scope="col">
							<span class="styBoldText">5.</span><br/> Other
						</th>
						<!-- column 7.-->
						<th class="styDepTblCell" style="width:33mm;border-right-width:0px;text-align:center;height:10mm;" scope="col">
							<span class="styBoldText">6.</span><br/>Total<br/>(add columns 2 <br/>through 5)
						</th>
					</tr>
				</thead>
				<tfoot/>
				<tbody>
					<xsl:for-each select="$DependencyData/ForeignOilAndGasIncomeTaxes">
						<tr>
							<!-- column display Row identifier letter(s)-->
							<td class="styDepTblCell" style="width:9mm;font-weight:bold;text-align:center;" scope="row">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="RowId"/>
								</xsl:call-template>
							</td>
							<!-- column 1a. display choice of Foreign ID or EIN-->
							<td class="styDepTblCell" style="text-align:center;width:41mm;word-break:break-all;">
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
											<xsl:with-param name="TargetNode" select="ForeignCorporationEIN"/>
										</xsl:call-template>
									</xsl:otherwise>
								</xsl:choose>
							</td>
							<!-- column 1b. display choice of Foreign/US code 863b income cd-->
							<td class="styDepTblCell" style="text-align:center;width:41mm;">
								<xsl:choose>
									<xsl:when test="(ForeignCountryOrUSPossessionCd)">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="ForeignCountryOrUSPossessionCd"/>
										</xsl:call-template>
									</xsl:when>
									<xsl:otherwise>
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="Section863bIncomeCd"/>
										</xsl:call-template>
									</xsl:otherwise>
								</xsl:choose>
							</td>
							<!-- column 2. display Gross foreign oil and gas extraction income-->
							<td class="styDepTblCell" style="width:33mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="GroFrgnOilGasExtractionIncmAmt"/>
								</xsl:call-template>
							</td>
							<!-- column 3. display Gross foreign oil related income-->
							<td class="styDepTblCell" style="width:33mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="GroForeignOilRelatedIncomeAmt"/>
								</xsl:call-template>
							</td>
							<!-- column display Gross foreign oil related income-->
							<!--<td class="styDepTblCell" style="width:auto;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="DividendsPaidFrgnCorpAmt"/>
								</xsl:call-template>
							</td>-->
							<!-- column 4. display Inclusions under section 951(a)(1) and section 951A-->
							<td class="styDepTblCell" style="width:33mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="InclusionsSect951a1Or951AAmt"/>
								</xsl:call-template>
							</td>
							<!-- column 5. display Other gross oil and gas extraction income-->
							<td class="styDepTblCell" style="width:33mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="OtherGrossIncomeAmt"/>
								</xsl:call-template>
							</td>
							<!-- column 6. display Gross oil and gas extraction income total - Sum of columns 2 through 5-->
							<td class="styDepTblCell" style="width:33mm;border-right-width:0px;padding-right:2px;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="TotalGrossIncomeAmt"/>
								</xsl:call-template>
							</td>
						</tr>
					</xsl:for-each>
					<!-- Total Row-->
					<tr>
						<td class="styDepTblCell" style="width:auto;height:4mm;font-weight:bold;text-align:left;" colspan="3" scope="row">
							Totals <span style="font-weight:normal;">(add lines A through F)</span>
						</td>
						<!--Total column 2.-->						
						<td class="styDepTblCell" style="width:33mm;height:4mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$DependencyData/TotForeignOilAndGasIncomeTaxes/GroFrgnOilGasExtractionIncmAmt"/>
							</xsl:call-template>
						</td>
						<!--Total column 3.-->	
						<td class="styDepTblCell" style="width:33mm;height:4mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$DependencyData/TotForeignOilAndGasIncomeTaxes/GroForeignOilRelatedIncomeAmt"/>
							</xsl:call-template>
						</td>
						<!--Total column-->	
						<!--<td class="styDepTblCell" style="width:auto;height:4mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$DependencyData/TotForeignOilAndGasIncomeTaxes/DividendsPaidFrgnCorpAmt"/>
							</xsl:call-template>
						</td>-->
						<!--Total column 4.-->	
						<td class="styDepTblCell" style="width:auto;height:4mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$DependencyData/TotForeignOilAndGasIncomeTaxes/InclusionsSect951a1Or951AAmt"/>
							</xsl:call-template>
						</td>
						<!--Total column 5.-->	
						<td class="styDepTblCell" style="width:auto;height:4mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$DependencyData/TotForeignOilAndGasIncomeTaxes/OtherGrossIncomeAmt"/>
							</xsl:call-template>
						</td>
						<!--Total column 6.-->	
						<td class="styDepTblCell" style="width:auto;height:4mm;border-right-width:0px;padding-right:2px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$DependencyData/TotForeignOilAndGasIncomeTaxes/TotalGrossIncomeAmt"/>
							</xsl:call-template>
						</td>
					</tr>
				</tbody>
			</table>
			<!-- End Part I table column 1-6 -->
			<div class="styBB" style="width:256mm;padding-left:5mm;float:none;margin-bottom:8mm;">
				* For section 863(b) income, use a single line (see instructions). 
			</div>
			<!-- spacer line to accommodate the button -->
			<!-- Part I table columns 7-13 -->
			<table class="styDepTblLandscape" cellspacing="0" style="font-size:7pt;border:none;">
				<thead style="display:table-header-group;">
					<tr style="border-top:1px solid black;">
						<!-- column gray-->
						<th class="styDepTblCell" style="width:9mm;height:14mm;background-color:lightgrey;text-align:center;" rowspan="2" scope="col">
							<span style="width:1px;"/>
						</th>
						<!-- column Deductions-->
						<th class="styDepTblCell" style="width:auto;height:4mm;font-weight:bold;text-align:center;" colspan="3" scope="col">
							Deductions
						</th>
						<!-- column -->
						<th class="styDepTblCell" style="width:auto;height:4mm;font-weight:bold;text-align:center;border-bottom:0px" colspan="1" scope="col">
						</th>
						<!-- column Foreign Oil and Gas Taxes-->
						<th class="styDepTblCell" style="width:auto;height:4mm;font-weight:bold;border-right-width:0px;text-align:center;" colspan="2" scope="col">
							Foreign Oil and Gas Taxes
						</th>
					</tr>
					<tr>
						<!-- column 7.-->
						<th class="styDepTblCell" style="height:10mm;width:41mm;text-align:center;" scope="col">
							<span class="styBoldText">7.</span><br/> Allocable deductions
						</th>
						<!-- column 8.-->
						<th class="styDepTblCell" style="height:10mm;width:41mm;text-align:center;" scope="col">
							<span class="styBoldText">8.</span><br/> Apportioned deductions
						</th>
						<!-- column 9.-->
						<th class="styDepTblCell" style="height:10mm;width:41mm;text-align:center;" scope="col">
							<span class="styBoldText">9.</span><br/>Total<br/> (add columns 7 and 8)
						</th>
						<!-- column 10.-->
						<th class="styDepTblCell" style="text-align:center;height:10mm;width:42mm;" scope="col">
							<b>10.</b><br/>Taxable income<br/>(column 6 minus column 9)
						</th>
						<!-- column 11.-->
						<th class="styDepTblCell" style="height:10mm;width:41mm;text-align:center;" scope="col">
							<span class="styBoldText">11.</span><br/> Paid or accrued
						</th>
						<!-- column -->
						<!-- <th class="styDepTblCell" style="height:10mm;width:35mm;text-align:center;" scope="col">
							<span class="styBoldText">13.</span><br/> Deemed paid</th>-->
						<!-- column 13.-->
						<th class="styDepTblCell" style="height:10mm;width:41mm;border-right-width:0px;text-align:center;" scope="col">
							<span class="styBoldText">13.</span><br/>Total<br/> (add columns 10 and 11)
						</th>
					</tr>
				</thead>
				<tfoot/>
				<tbody style="">
					<xsl:for-each select="$DependencyData/ForeignOilAndGasIncomeTaxes">
						<tr>
							<!-- column display Row identifier letter(s)-->
							<td class="styDepTblCell" style="width:9mm;font-weight:bold;text-align:center" scope="row">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="RowId"/>
								</xsl:call-template>
							</td>
							<!-- column 7. display Allocable deductions-->
							<td class="styDepTblCell" style="text-align:right;width:41mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="DefinitelyAllocableDedAmt"/>
								</xsl:call-template>
							</td>
							<!-- column 8. display Apportioned deductions-->
							<td class="styDepTblCell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="ApportionedShareDeductionAmt"/>
								</xsl:call-template>
							</td>
							<!-- column 9. display Total deductions - sum of columns 7 and 8-->
							<td class="styDepTblCell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="TotalAllocableDeductionsAmt"/>
								</xsl:call-template>
							</td>
							<!-- column 10. display Taxable income - column 6 minus 9-->
							<td class="styDepTblCell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="TaxableIncomeAmt"/>
								</xsl:call-template>
							</td>
							<!-- column 11. display Oil and gas extraction taxes - Paid or accrued-->
							<td class="styDepTblCell">
								<!--<span style="float:left; clear:none">
									<xsl:call-template name="SetFormLinkInline">
										<xsl:with-param name="TargetNode" select="$DependencyData/ForeignOilAndGasIncomeTaxes/OilGasExtractionTxsPaidAccrAmt"/>
									</xsl:call-template>
								</span>-->
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="OilGasExtractionTxsPaidAccrAmt"/>
								</xsl:call-template>
							</td>
							<!-- column 13. display Oil and gas extraction taxes - Deemed Paid-->
							<td class="styDepTblCell" style="width:41mm;border-right-width:0px;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="TotalOilGasExtractionTaxesAmt"/>
								</xsl:call-template>
							</td>
						</tr>
					</xsl:for-each>
					<tr>
						<!-- Total Row-->
						<td class="styDepTblCell" style="width:6mm;height:4mm;text-align:left;font-weight:bold;font-size:7pt" scope="row">
							Totals 
						</td>
						<!-- column 7. Total -->
						<td class="styDepTblCell" style="text-align:right;width:auto;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$DependencyData/TotalsFrgnOilGasExtAndDedTaxes/DefinitelyAllocableDedAmt"/>
							</xsl:call-template>  
						</td>
						<!-- column 8. Total -->
						<td class="styDepTblCell" style="width:auto;height:4mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$DependencyData/TotalsFrgnOilGasExtAndDedTaxes/ApportionedShareDeductionAmt"/>
							</xsl:call-template>  
						</td>
						<!-- column 9. Total -->
						<td class="styDepTblCell" style="width:auto;height:4mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$DependencyData/TotalsFrgnOilGasExtAndDedTaxes/TotalAllocableDeductionsAmt"/>
							</xsl:call-template>  
						</td>
						<!-- column 10. Total -->
						<td class="styDepTblCell" style="width:auto;height:4mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$DependencyData/TotalsFrgnOilGasExtAndDedTaxes/TaxableIncomeAmt"/>
							</xsl:call-template>  
						</td>
						<!-- column 11. Total -->
						<td class="styDepTblCell" style="width:auto;height:4mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$DependencyData/TotalsFrgnOilGasExtAndDedTaxes/OilGasExtractionTxsPaidAccrAmt"/>
							</xsl:call-template>  
						</td>
						<!-- column 13. Total -->
						<td class="styDepTblCell" style="width:auto;height:4mm;border-right-width:0px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$DependencyData/TotalsFrgnOilGasExtAndDedTaxes/TotalOilGasExtractionTaxesAmt"/>
							</xsl:call-template>  
						</td>
					</tr>
				</tbody>
			</table>
			
			<!-- Part II header -->
			<div class="styStdIBDiv" style="width:256mm;border-top:1px solid black;border-bottom:1px solid black;margin-top:4mm;">
				<div class="styPartName">Part II</div>
				<div class="styPartDesc" style="width:173mm;">
					Reduction Under Section 907(a)
				</div>
			</div>
			<!-- Part II line 1 -->
			<div class="styStdIBDiv" style="width:256mm;margin-top:4mm;margin-bottom:4mm;">
				<div class="styLNLeftNumBoxSD">1</div>
				<div class="styLNDesc" style="width:216mm;">
					<div style="float:left;clear:none;">
						Combined foreign oil and gas income. (See the instructions for Part II line 1 below.)
					</div>
					<div style="float:ritgh;clear:none">
						<span class="styDotLn" style="padding-right:1mm;">...........................</span>
					</div>
				</div>
				<div class="styLNAmountBox" style="width:32mm;">
					<xsl:call-template name="PopulateAmount">
						<xsl:with-param name="TargetNode" select="$DependencyData/CombForeignOilAndGasIncomeAmt"/>
					</xsl:call-template>
				</div>
			</div>
			<!-- Part III header -->
			<div class="styStdIBDiv" style="width:256mm;border-top:1px solid black;border-bottom:1px solid black;">
				<div class="styPartName">Part III</div>
				<div class="styPartDesc">
					Foreign Oil and Gas Taxes Available For Use in the Current Tax Year
				</div>
			</div>
			<!-- part III line 2 -->
			<div class="styStdIBDiv" style="width:256mm;margin-top:4mm;margin-bottom:4mm;">
				<div class="styLNLeftNumBoxSD">2</div>
				<div class="styLNDesc" style="width:216mm;">
					<div style="float:left;clear:none;">
						Enter the sum of any carryover of foreign oil and gas tax to the current year. Attach a schedule showing the computation in detail
					</div>
					<div style="float:ritgh;clear:none">
						<span class="styDotLn" style="padding-right:1mm;">............</span>
					</div>
				</div>
				<div class="styLNAmountBox" style="width:32mm;">
					<xsl:call-template name="PopulateAmount">
						<xsl:with-param name="TargetNode" select="$DependencyData/TotCYCarryoverFrgnOilAndTxAmt"/>
					</xsl:call-template>
				</div>
			</div>
	</xsl:template>
	
	<xsl:param name="depDocTitle">
		<xsl:call-template name="PopulateDisplayName">
			<xsl:with-param name="TargetNode" select="$DependencyData" />
		</xsl:call-template>
	</xsl:param>

	<!-- Main template -->
	<xsl:template match="/">
		<!--<xsl:text disable-output-escaping="yes">&lt;!DOCTYPE html&gt;</xsl:text>-->
		<html>
			<head>
				<!--<meta http-equiv="X-UA-Compatible" content="IE=edge"/>-->
				<title><xsl:value-of select="$depDocTitle" /></title>
				<!-- No Browser Caching -->
				<meta http-equiv="Pragma" content="no-cache"/>
				<meta http-equiv="Cache-Control" content="no-cache"/>
				<meta http-equiv="Expires" content="0"/>
				<!-- No Proxy Caching -->
				<meta http-equiv="Cache-Control" content="private"/>
				<!-- Define Character Set -->
				<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1"/>
				<meta name="Description" content="Depdendency 1118 Schedule I"/>
				<!-- javascript include -->
				<script language="JavaScript" src="{$ScriptPath}/FormDisplay.js" type="text/javascript"/>
				<xsl:call-template name="InitJS"/>
				<style type="text/css">
					<xsl:if test="not($Print) or $Print=''">
						<!--<xsl:call-template name="IRS1118ScheduleIStyle"/>-->
						<xsl:call-template name="AddOnStyle"/>
					</xsl:if>
				</style>
				<xsl:call-template name="GlobalStylesForm"/>
			</head>
			<body class="styBodyClass">
				<xsl:call-template name="DocumentHeaderDependencyLandscape"></xsl:call-template>
				<div class="styDepTitleLineLandscape">
					<span class="styDepTitle" style="">
						<xsl:value-of select="$depDocTitle" />
					</span>
				</div>
				<!--Adding template for left over data  -->
				<xsl:call-template name="PopulateDepCommonLeftoverLandscape">
					<xsl:with-param name="TargetNode" select="$DependencyData" /></xsl:call-template>
				<xsl:call-template name="ShowDependencyData" />
				<br/>
			</body>
		</html>
	</xsl:template>
</xsl:stylesheet>
