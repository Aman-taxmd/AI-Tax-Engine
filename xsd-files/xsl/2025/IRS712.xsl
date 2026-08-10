<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE xsl:stylesheet [
	<!ENTITY nbsp "&#160;"> 
	<!ENTITY mdash "&#8212;"> 
	<!ENTITY bull "&#8226;"> 
]>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fo="http://www.w3.org/1999/XSL/Format" version="1.0">
	<xsl:include href="PopulateTemplate.xsl"/>
	<xsl:include href="AddHeader.xsl"/>
	<xsl:include href="CommonPathRef.xsl"/>
	<xsl:include href="AddOnTable.xsl"/>
	<xsl:include href="IRS712Style.xsl"/>
	<xsl:output method="html" indent="yes"/>
	<xsl:strip-space elements="*"/>
	<xsl:param name="FormData" select="$RtnDoc/IRS712"/>
	<xsl:template match="/">
		<xsl:text disable-output-escaping="yes">&lt;!DOCTYPE html&gt;</xsl:text>
		<html>
			<head>
				<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
				<title>
					<xsl:call-template name="FormTitle">
						<xsl:with-param name="RootElement" select="local-name($FormData)"/>
					</xsl:call-template>
				</title>
				<!-- No Browser Caching   -->
				<meta http-equiv="Pragma" content="no-cache"/>
				<meta http-equiv="Cache-Control" content="no-cache"/>
				<meta http-equiv="Expires" content="0"/>
				<!-- No Proxy Caching -->
				<meta http-equiv="Cache-Control" content="private"/>
				<!-- Define Character Set -->
				<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1"/>
				<meta name="Description" content="IRS Form 712"/>
				<!-- javascript include -->
				<script language="JavaScript" src="{$ScriptPath}/FormDisplay.js" type="text/javascript"/>
				<xsl:call-template name="InitJS"/>
				<style type="text/css">
<!--					<xsl:if test="not($Print) or $Print=''">-->
						<xsl:call-template name="IRS712Style"/>
						<xsl:call-template name="AddOnStyle"/>
<!--					</xsl:if>-->
				</style>
				<xsl:call-template name="GlobalStylesForm"/>
			</head>
			<body class="styBodyClass" style="width:187mm;">
				<xsl:call-template name="DocumentHeader"/>
				<!-- BEGIN FORM HEADER -->
				<div class="styStdDiv">
					<div class="styFNBox" style="width:28mm;height:19mm;">
						Form <span class="styFormNumber" style="font-size:18pt;padding-right:1mm;">712</span>
							<!--General Dependency Push Pin-->
							<xsl:call-template name="SetFormLinkInline">
							<xsl:with-param name="TargetNode" select="$FormData"/>
						</xsl:call-template>
						
						<span class="styAgency" style="padding-bottom:1.5mm;">(Rev. December 2024)</span>
						<span class="styAgency">Department of the Treasury</span>
						<span class="styAgency">Internal Revenue Service</span>
					</div>
					<div class="styFTBox" style="width:128mm;height:19mm;padding-top:5mm;">
						<span class="styMainTitle" style="font-size:13pt;">Life Insurance Statement</span>
						<div class="styFST" style="padding-top:4mm;font-weight:normal;">
							Go to <span style="font-style:italic;">www.irs.gov/Form712</span> for instructions and the latest information.
						</div>
					</div>
					<div class="styTYBox" style="width:30mm;height:19mm;padding-top:8mm;">
						OMB No. 1545-0022
					</div>
				</div>
				<!-- END FORM HEADER -->
				<!--Part I-->
				<div class="styStdDiv" style="border-top:1px solid black;">
					<span class="styPartName" style="width:12mm;text-align:left;">Part I</span>
					<span class="styPartDesc" style="width:175mm;height:auto;font-weight:normal;">
						<b>Decedent—Insured</b>
						(To be filed by the executor with Form 706, United States Estate (and Generation-Skipping Transfer) Tax Return, or
						Form 706-NA, United States Estate (and Generation-Skipping Transfer) Tax Return, Estate of nonresident not a citizen of the United States.)
					</span>
				</div>
				<!--Line 1, 2 3 4-->
				<div class="styStdDiv" style="border-top:1px solid #000; position:relative; overflow:hidden;">
					<!-- Full-height vertical separators -->
					<!-- after col1: 59 -->
					<div style="position:absolute;top:0;bottom:0;left:59mm;width:1px;background:#000;"/>
					<!-- after col2: 59+55=114 -->
					<div style="position:absolute;top:0;bottom:0;left:114mm;width:1px;background:#000;"/>
					<!-- after col3: 114+49=163 -->
					<div style="position:absolute;top:0;bottom:0;left:163mm;width:1px;background:#000;"/>
					<!-- Line 1 -->
					<div style="width:59mm;height:auto;float:left;">
						<span class="styIRS712HeaderNum">1</span>
						Decedent’s first name and middle initial<br/>
						<xsl:if test="$FormData/DecedentInsuredInfoGrp">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/NameLine1Txt"/>
							</xsl:call-template>
						</xsl:if>
					</div>
					<!--Line 2 -->
					<div style="width:55mm;height:auto;float:left;">
						<span class="styIRS712HeaderNum">2</span>
						Decedent’s last name<br/>
						<xsl:if test="$FormData/DecedentInsuredInfoGrp">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/NameLine1Txt"/>
							</xsl:call-template>
						</xsl:if>
					</div>
					<!-- Line 3 -->
					<div class="styEINBox" style="width:49mm;height:auto;float:left;font-weight:normal;">
						<span class="styIRS712HeaderNum">3</span>
						Decedent’s social security number <br/>(if known)<br/>
						<xsl:if test="$FormData/DecedentInsuredInfoGrp">
							<xsl:call-template name="PopulateReturnHeaderFilerTIN">
								<xsl:with-param name="EINChanged" select="true()"/>
							</xsl:call-template>
						</xsl:if>
					</div>
					<!-- Line 4 -->
					<div style="width:24mm;height:auto;float:left;font-weight:normal;">
						<span class="styIRS712HeaderNum">4</span>
						Date of death<br/>
						<xsl:call-template name="PopulateMonthDayYear">
							<xsl:with-param name="TargetNode" select="$FormData/DecedentInsuredInfoGrp/DeathDt"/>
						</xsl:call-template>
					</div>
				</div>
				<!--Line 5a, b, c d, e-->
				<div class="styStdDiv" style="border-top:1px solid #000; position:relative; overflow:hidden;">
					<!-- Full-height vertical separators -->
					<div style="position:absolute;top:0;bottom:0;left:59mm;width:1px;background:#000;"/>
					<div style="position:absolute;top:0;bottom:0;left:114mm;width:1px;background:#000;"/>
					<div style="position:absolute;top:0;bottom:0;left:144mm;width:1px;background:#000;"/>
					<div style="position:absolute;top:0;bottom:0;left:163mm;width:1px;background:#000;"/>
					<!-- Line 5a -->
					<div style="width:59mm;min-height:8mm;height:auto;float:left;">
						<span class="styIRS712HeaderNum" style="height:auto">5a</span>
						Name of insurance company
						<div style="margin-left:8mm;">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/DecedentInsuredInfoGrp/BusinessName/BusinessNameLine1Txt"/>
							</xsl:call-template>
							<xsl:if test="$FormData/DecedentInsuredInfoGrp/BusinessName/BusinessNameLine2Txt">
								<br/>
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$FormData/DecedentInsuredInfoGrp/BusinessName/BusinessNameLine2Txt"/>
								</xsl:call-template>
							</xsl:if>
						</div>
					</div>
					<!-- Line 5b -->
					<div style="width:55mm; min-height:8mm;height:auto;float:left;">
						<span class="styIRS712HeaderNum">5b</span>
						Address (number and street) of <br/>insurance company
						<div style="margin-left:8mm;">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/DecedentInsuredInfoGrp/BusinessUSAddress/AddressLine1Txt"/>
							</xsl:call-template>
							<xsl:if test="$FormData/DecedentInsuredInfoGrp/BusinessUSAddress/AddressLine2Txt">
								<br/>
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$FormData/DecedentInsuredInfoGrp/BusinessUSAddress/AddressLine2Txt"/>
								</xsl:call-template>
							</xsl:if>
						</div>
					</div>
					<!-- Line 5c-->
					<div style="width:30mm;min-height:8mm;height:auto;float:left;">
						<span class="styIRS712HeaderNum" style="height:auto;">5c</span>
						City<br/>
						<div style="margin-left:8mm;">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/DecedentInsuredInfoGrp/BusinessUSAddress/CityNm"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 5d-->
					<div style="width:19mm;min-height:8mm;height:auto;float:left;">
						<span class="styIRS712HeaderNum">5d</span>
						State<br/>
						<xsl:call-template name="PopulateText">
							<xsl:with-param name="TargetNode" select="$FormData/DecedentInsuredInfoGrp/BusinessUSAddress/StateAbbreviationCd"/>
						</xsl:call-template>
					</div>
					<!-- Line 5e-->
					<div style="width:24mm;min-height:8mm;height:auto;float:left;">
						<span class="styIRS712HeaderNum">5e</span>
						ZIP Code<br/>
						<xsl:call-template name="PopulateText">
							<xsl:with-param name="TargetNode" select="$FormData/DecedentInsuredInfoGrp/BusinessUSAddress/ZIPCd"/>
						</xsl:call-template>
					</div>
				</div>
				<!--Line 6 7 -->
				<div class="styStdDiv" style="border-top:1px solid #000; position:relative; overflow:hidden;">
					<!-- Full-height vertical separator (after 114mm) -->
					<div style="position:absolute; top:0; bottom:0; left:114mm; width:1px; background:#000;"/>
					<!-- Line 6 -->
					<div style="width:114mm;height:auto;float:left;">
						<span class="styIRS712HeaderNum" style="height:auto;">6</span>
						Type of policy <br/>
						<div style="margin-left:8mm;padding-right:0.5mm;">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/DecedentInsuredInfoGrp/PolicyTypeDesc"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 7 -->
					<div style="width:69mm;height:auto;float:left;border-right:0;">
						<span class="styIRS712HeaderNum" style="height:auto;">7</span>
						Policy number<br/>
						<div style="margin-left:8mm;">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/DecedentInsuredInfoGrp/PolicyNum"/>
							</xsl:call-template>
						</div>
					</div>
				</div>
				<!--Line 8 9 10 11 -->
				<div class="styStdDiv" style="border-top:1px solid #000; position:relative; overflow:hidden;">
					<!-- Full-height vertical separator lines -->
					<div style="position:absolute; top:0; bottom:0; left:58mm; width:1px; background:#000;"/>
					<div style="position:absolute; top:0; bottom:0; left:85mm; width:1px; background:#000;"/>
					<div style="position:absolute; top:0; bottom:0; left:160mm; width:1px; background:#000;"/>
					<div style="position:absolute; top:0; bottom:0; left:187mm; width:1px; background:#000;"/>
					<!-- Line 8 -->
					<div style="width:58mm;height:auto;float:left;">
						<span class="styIRS712HeaderNum" style="height:5mm;">8</span>
						Owner’s name. If decedent is not owner, attach copy of application.<br/>
						<div style="margin-left:8mm;">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/DecedentInsuredInfoGrp/OwnerNm"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 9 -->
					<div style="width:27mm;height:auto;float:left;">
						<span class="styIRS712HeaderNum">9</span>
						Date issued <br/>
						<xsl:call-template name="PopulateMonthDayYear">
							<xsl:with-param name="TargetNode" select="$FormData/DecedentInsuredInfoGrp/IssueDt"/>
						</xsl:call-template>
					</div>
					<!-- Line 10 -->
					<div style="width:75mm;height:auto;float:left;">
						<span class="styIRS712HeaderNum" style="height:auto;">10</span>
						Assignor’s name. Attach copy of assignment. <br/>
						<div style="margin-left:8mm;">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/DecedentInsuredInfoGrp/AssignorName/BusinessNameLine1Txt"/>
							</xsl:call-template>
							<xsl:if test="$FormData/DecedentInsuredInfoGrp/AssignorName/BusinessNameLine2Txt">
								<br/>
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$FormData/DecedentInsuredInfoGrp/AssignorName/BusinessNameLine2Txt"/>
								</xsl:call-template>
							</xsl:if>
						</div>
					</div>
					<!-- Line 11 -->
					<div style="width:27mm;height:auto;float:left;border-right:0;">
						<span class="styIRS712HeaderNum">11</span>
						Date assigned <br/>
						<xsl:call-template name="PopulateMonthDayYear">
							<xsl:with-param name="TargetNode" select="$FormData/DecedentInsuredInfoGrp/AssignedDt"/>
						</xsl:call-template>
					</div>
				</div>
				<!--Line 12 13 14 -->
				<div class="styStdDiv" style="border-top:1px solid #000;border-bottom:1px solid #000; position:relative;overflow:hidden;">
					<!-- full-height vertical separators -->
					<div style="position:absolute;top:0;bottom:0;left:44mm;width:1px;background:#000;"/>
					<div style="position:absolute;top:0;bottom:0;left:85mm;width:1px;background:#000;"/>
					<!-- Line 12 -->
					<div style="width:44mm;min-height:5mm;height:auto;float:left;border-right-width:0px">
						<span class="styIRS712HeaderNum" style="height:5mm;">12</span>
							Value of the policy at the <br/>time of assignment
						<div style="margin-left:8mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/DecedentInsuredInfoGrp/PolicyValueAssignmentTimeAmt"/>
							</xsl:call-template>
						</div>						
					</div>
					<!-- Line 13 -->
					<div style="width:41mm;min-height:5mm;height:auto;float:left;border-right-width:0px">
						<span class="styIRS712HeaderNum" style="height:5mm;">13</span>
						Amount of premium (see instructions) <br/>
						<div style="margin-left:8mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/DecedentInsuredInfoGrp/AnnualPremiumAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 14 -->
					<div style="width:102mm;min-height:5mm;height:auto;float:left;border-right-width:0px">
						<span class="styIRS712HeaderNum" style="height:auto;">14</span>
						Name of beneficiaries
						<div style="padding-left:8mm;">
							<xsl:for-each select="$FormData/DecedentInsuredInfoGrp/BeneficiaryBusinessName">
								<xsl:choose>
									<xsl:when test="BusinessNameLine1Txt">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="BusinessNameLine1Txt"/>
										</xsl:call-template>
										<xsl:if test="BusinessNameLine2Txt">
											<br/>
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="BusinessNameLine2Txt"/>
											</xsl:call-template>
										</xsl:if>
									</xsl:when>
									<xsl:otherwise>
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="BeneficiaryPersonNm"/>
										</xsl:call-template>
									</xsl:otherwise>
								</xsl:choose>
								<xsl:if test="position()!=last()">
									<br/>
								</xsl:if>
							</xsl:for-each>
						</div>
					</div>
				</div>
				<!--Line 15-->
				<div class="styStdDiv">
					<div class="styLNLeftNumBox">15</div>
					<div class="styLNDesc" style="width:138.7mm;">
						Face amount of policy
						<span class="styIRS712DotLn">...........................</span>
					</div>
					<div class="styLNRightNumBox">15</div>
					<div class="styLNAmountBox">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/PolicyFaceValueAmt"/>
						</xsl:call-template>
					</div>
				</div>
				<!--Line 16-->
				<div class="styStdDiv">
					<div class="styLNLeftNumBox">16</div>
					<div class="styLNDesc" style="width:138.7mm;">
						Indemnity benefits
						<span class="styIRS712DotLn">............................</span>
					</div>
					<div class="styLNRightNumBox">16</div>
					<div class="styLNAmountBox">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/IndemnityBenefitsAmt"/>
						</xsl:call-template>
					</div>
				</div>
				<!--Line 17-->
				<div class="styStdDiv">
					<div class="styLNLeftNumBox">17</div>
					<div class="styLNDesc" style="width:138.7mm;">
						Additional insurance
						<span class="styIRS712DotLn">...........................</span>
					</div>
					<div class="styLNRightNumBox">17</div>
					<div class="styLNAmountBox">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/AdditionalInsuranceAmt"/>
						</xsl:call-template>
					</div>
				</div>
				<!--Line 18-->
				<div class="styStdDiv">
					<div class="styLNLeftNumBox">18</div>
					<div class="styLNDesc" style="width:138.7mm;">
						Other benefits
						<span class="styIRS712DotLn">.............................</span>
					</div>
					<div class="styLNRightNumBox">18</div>
					<div class="styLNAmountBox">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/OtherBenefitsAmt"/>
						</xsl:call-template>
					</div>
				</div>
				<!--Line 19-->
				<div class="styStdDiv">
					<div class="styLNLeftNumBox">19</div>
					<div class="styLNDesc" style="width:138.7mm;">
						Principal of any indebtedness to the company that is deductible in determining net proceeds
						<span class="styIRS712DotLn">.....</span>
					</div>
					<div class="styLNRightNumBox">19</div>
					<div class="styLNAmountBox">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/PrincipalIndebtednessDedAmt"/>
						</xsl:call-template>
					</div>
				</div>
				<!--Line 20-->
				<div class="styStdDiv">
					<div class="styLNLeftNumBox">20</div>
					<div class="styLNDesc" style="width:138.7mm;">
						Interest on indebtedness (line 19) accrued to date of death
						<span class="styIRS712DotLn">...............</span>
					</div>
					<div class="styLNRightNumBox">20</div>
					<div class="styLNAmountBox">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/IndebtednessInterestAccrDODAmt"/>
						</xsl:call-template>
					</div>
				</div>
				<!--Line 21-->
				<div class="styStdDiv">
					<div class="styLNLeftNumBox">21</div>
					<div class="styLNDesc" style="width:138.7mm;">
						Amount of accumulated dividends
						<span class="styIRS712DotLn">.......................</span>
					</div>
					<div class="styLNRightNumBox">21</div>
					<div class="styLNAmountBox">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/AccumulatedDividendsAmt"/>
						</xsl:call-template>
					</div>
				</div>
				<!--Line 22-->
				<div class="styStdDiv">
					<div class="styLNLeftNumBox">22</div>
					<div class="styLNDesc" style="width:138.7mm;">
						Amount of post-mortem dividends
						<span class="styIRS712DotLn">.......................</span>
					</div>
					<div class="styLNRightNumBox">22</div>
					<div class="styLNAmountBox">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/PostMortemDividendsAmt"/>
						</xsl:call-template>
					</div>
				</div>
				<!--Line 23-->
				<div class="styStdDiv">
					<div class="styLNLeftNumBox">23</div>
					<div class="styLNDesc" style="width:138.7mm;">
						Amount of returned premium
						<span class="styIRS712DotLn">.........................</span>
					</div>
					<div class="styLNRightNumBox">23</div>
					<div class="styLNAmountBox">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/ReturnedPremiumAmt"/>
						</xsl:call-template>
					</div>
				</div>
				<!-- Line 24 -->
				<div class="styStdDiv">
					<div class="styLNLeftNumBox">24</div>
					<div class="styLNDesc" style="width:138.7mm;">Amount of proceeds if payable in one sum
							<span class="styIRS712DotLn">.....................</span>
					  </div>
					<div class="styLNRightNumBox">24</div>
					<div class="styLNAmountBox">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/ProceedsOneSumAmt"/>
						</xsl:call-template>
					</div>
				</div>
				<!-- Line 25 -->
				<div class="styStdDiv">
					<div class="styLNLeftNumBox">25</div>
					<div class="styLNDesc" style="width:138.7mm;">Value of proceeds as of date of death (if not payable in one sum)
						<span class="styIRS712DotLn">..............</span>
					  </div>
					<div class="styLNRightNumBox">25</div>
					<div class="styLNAmountBox">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/ProceedsValueDODAmt"/>
						</xsl:call-template>
					</div>
				</div>
				<!--line 26-->
				<div class="styStdDiv" style="display:table; width:100%; table-layout:fixed; border-collapse:collapse;">
					<div class="styLNLeftNumBox" style="display:table-cell; float:none; vertical-align:top;">26</div>
					<!-- Description -->
					<div class="styLNDesc" style="display:table-cell; float:none; height:auto; width:138mm; vertical-align:top;">
						Policy provisions concerning deferred payments or installments.<br/>
						If other than a lump-sum settlement is authorized for a surviving spouse, check here and attach a copy <br/>of the insurance policy
						<input type="checkbox" class="styCkboxNM" aria-label="Other than lump-sum settlement">
							<xsl:call-template name="PopulateCheckbox">
								<xsl:with-param name="TargetNode" select="$FormData/OtherThanLumpSumInd"/>
								<xsl:with-param name="BackupName">F712/OtherThanLumpSumInd</xsl:with-param>
							</xsl:call-template>
						</input>
						<br/>
						<span style="width:98%;height:auto;border-bottom:1px dashed black;">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/PolicyProvisionsTxt"/>
							</xsl:call-template>
						</span>
						<xsl:if test="not($FormData/PolicyProvisionsTxt) or $FormData/PolicyProvisionsTxt=''">
							<span style="width:98%;height:auto;border-bottom:1px dashed black;"/>
						</xsl:if>
					</div>
					<!-- Grey boxes: now they stretch to row height automatically -->
					<div class="styLNRightNumBox" style="border-bottom-width:0px; display:table-cell; float:none; background-color:lightgrey;"/>
					<div class="styLNAmountBox" style="border-bottom-width:0px; display:table-cell; float:none; background-color:lightgrey;"/>
				</div>
				<!-- Line 27 -->
				<div class="styStdDiv">
					<div class="styLNLeftNumBox">27</div>
					<div class="styLNDesc" style="width:138.7mm;">Amount of installments
						<span class="styIRS712DotLn">...........................</span>
					  </div>
					<div class="styLNRightNumBox">27</div>
					<div class="styLNAmountBox">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/InstallmentsAmt"/>
						</xsl:call-template>
					</div>
				</div>
				<!-- Line 28 -->
				<div class="styStdDiv" style="display:table;width:100%;table-layout:fixed;border-collapse:collapse;">
					<div class="styLNLeftNumBox" style="display:table-cell;float:none;vertical-align:top;">28</div>
					<!-- Description + embedded table -->
					<div class="styLNDesc" style="display:table-cell;float:none;vertical-align:top;">
						Date of birth, sex, and name of any person the duration of whose life may measure the number of payments.
						<div style="margin-top:2mm;">
							<table class="styTable" style="border-collapse:collapse; font-size:7pt;width:97mm; border:1px normal black;">
								<thead class="styTableThead">
									<tr>
										<th class="styTableCellHeader" style="width:94mm; height:5mm; text-align:left;font-weight:normal;border:1px solid black;" scope="col">
											(i) Name of person the duration of whose life may measure beyond the number of payments
										</th>
										<th class="styTableCellHeader" style="width:24mm; height:5mm; text-align:left; font-weight:normal; border-top:1px solid black;" scope="col">
											(ii) Date of birth
										</th>
										<th class="styTableCellHeader" style="width:17mm; height:5mm;font-weight:normal; text-align:left; border-top:1px solid;" scope="col">
											(iii) Sex
										</th>
									</tr>
								</thead>
								<tbody>
									<xsl:for-each select="$FormData/LifeDurMeasureBeyondPymtGrp">
										<tr style="vertical-align:bottom;">
											<td class="styTableCellCtrInherit" style="font-weight:normal;border-left-width:1px;">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="PersonNm"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellCtrInherit" style="font-weight:normal;">
												<xsl:call-template name="PopulateMonthDayYear">
													<xsl:with-param name="TargetNode" select="BirthDt"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellCtrInherit">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="SexCd"/>
												</xsl:call-template>
											</td>
										</tr>
									</xsl:for-each>
									<xsl:if test="count($FormData/LifeDurMeasureBeyondPymtGrp) &lt; 3">
										<xsl:call-template name="FillPage1Table">
											<xsl:with-param name="LineNumber" select="count($FormData/LifeDurMeasureBeyondPymtGrp) + 1"/>
										</xsl:call-template>
									</xsl:if>
								</tbody>
							</table>
						</div>
					</div>
					<!-- Grey columns: auto-height, matches row height -->
					<div class="styLNRightNumBox" style="border-bottom-width:0px; display:table-cell;width:8mm;float:none;vertical-align:top;background-color:lightgrey;"/>
					<div class="styLNAmountBox" style="border-bottom-width:0px; display:table-cell;width:32mm;float:none;vertical-align:top;background-color:lightgrey;"/>
				</div>
				<!-- Line 29 -->
				<div class="styStdDiv">
					<div class="styLNLeftNumBox">29</div>
					<div class="styLNDesc" style="height:7mm;width:138.7mm;">
						Amount applied by the insurance company as a single premium representing the purchase of <br/>installment benefits
						<span class="styIRS712DotLn">............................</span>
					</div>
					<div class="styLNRightNumBox" style="height:7mm;padding-top:3mm;">29</div>
					<div class="styLNAmountBox" style="height:7mm;padding-top:3mm;">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/SinglePremiumAmt"/>
						</xsl:call-template>
					</div>
				</div>
				<!-- Line 30 -->
				<div class="styStdDiv">
					<div class="styLNLeftNumBox">30</div>
					<div class="styLNDesc" style="width:178mm;height:auto;">Basis (mortality table and rate of interest) used by insurer in valuing installment benefits.
						<br/>
						<span style="width:100%;height:auto;border-bottom:1px dashed black;">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/InstallmentBenefitsBasisTxt"/>
							</xsl:call-template>
						</span>
					</div>
				</div>
				<!--Line 31-->
				<div class="styStdDiv">
					<div class="styLNLeftNumBox">31</div>
					<div class="styLNDesc" style="width:157mm;">
						Were there any transfers of the policy within the three years prior to the death of the decedent?
						<xsl:call-template name="SetFormLinkInline">
							<xsl:with-param name="TargetNode" select="$FormData/PolicyTransfers3YrsPrDeathInd"/>
						</xsl:call-template>
						<span class="styIRS712DotLn">.........</span>
					</div>
					<div class="styGenericDiv" style="width:22mm;padding-top:1px;">
						<xsl:call-template name="PopulateSpan">
							<xsl:with-param name="TargetNode" select="$FormData/PolicyTransfers3YrsPrDeathInd"/>
						</xsl:call-template>
						<input type="checkbox" class="styCkboxNM" style="margin-right:2px;" aria-label="Transfers of the policy Yes">
							<xsl:call-template name="PopulateYesCheckbox">
								<xsl:with-param name="TargetNode" select="$FormData/PolicyTransfers3YrsPrDeathInd"/>
								<xsl:with-param name="BackupName">F712/PolicyTransfers3YrsPrDeathInd</xsl:with-param>
							</xsl:call-template>
						</input>
						Yes
						<input type="checkbox" class="styCkboxNM" style="margin-right:2px;margin-left:3mm;" aria-label="Transfers of the policy No">
							<xsl:call-template name="PopulateNoCheckbox">
								<xsl:with-param name="TargetNode" select="$FormData/PolicyTransfers3YrsPrDeathInd"/>
								<xsl:with-param name="BackupName">F712/PolicyTransfers3YrsPrDeathInd</xsl:with-param>
							</xsl:call-template>
						</input>
						No
					</div>
				</div>
				<!--Line 32-->
				<div class="styStdDiv">
					<div class="styLNLeftNumBox">32</div>
					<div class="styLNDesc" style="width:90mm;">
						If you checked "Yes" on line 31, enter date of assignment or transfer.
					</div>
					<span style="width:35mm;border-bottom:1px dashed black;text-align:center;">
						<xsl:call-template name="PopulateMonthDayYear">
							<xsl:with-param name="TargetNode" select="$FormData/AssignmentOrTransferDt"/>
						</xsl:call-template>
					</span><br/>
					&nbsp; Month &nbsp;&nbsp;&nbsp; Day &nbsp;&nbsp;&nbsp; Year
				</div>
				<!--Line 33-->
				<div class="styStdDiv">
					<div class="styLNLeftNumBox">33</div>
					<div class="styLNDesc" style="width:157mm;">
						Was the insured the annuitant or beneficiary of any annuity contract issued by the company?
						<xsl:call-template name="SetFormLinkInline">
							<xsl:with-param name="TargetNode" select="$FormData/InsuredAnnuitantOrBenefInd"/>
						</xsl:call-template>
						<span class="styIRS712DotLn">.........</span>
					</div>
					<div class="styGenericDiv" style="width:22mm;padding-top:1px;">
						<xsl:call-template name="PopulateSpan">
							<xsl:with-param name="TargetNode" select="$FormData/InsuredAnnuitantOrBenefInd"/>
						</xsl:call-template>
						<input type="checkbox" class="styCkboxNM" style="margin-right:2px;" aria-label="Was the insured the annuitant or beneficiary Yes">
							<xsl:call-template name="PopulateYesCheckbox">
								<xsl:with-param name="TargetNode" select="$FormData/InsuredAnnuitantOrBenefInd"/>
								<xsl:with-param name="BackupName">F712/InsuredAnnuitantOrBenefInd</xsl:with-param>
							</xsl:call-template>
						</input>
						Yes
						<input type="checkbox" class="styCkboxNM" style="margin-right:2px;margin-left:3mm;" aria-label="Was the insured the annuitant or beneficiary No">
							<xsl:call-template name="PopulateNoCheckbox">
								<xsl:with-param name="TargetNode" select="$FormData/InsuredAnnuitantOrBenefInd"/>
								<xsl:with-param name="BackupName">F712/InsuredAnnuitantOrBenefInd</xsl:with-param>
							</xsl:call-template>
						</input>
						No
					</div>
				</div>
				<!--Line 34-->
				<div class="styStdDiv">
					<div class="styLNLeftNumBox">34</div>
					<div class="styLNDesc" style="width:157mm;height:7mm;">
						Did the decedent have any incidents of ownership on any policies on the decedent's life, but not owned by the decedent at the date of death?
						<xsl:call-template name="SetFormLinkInline">
							<xsl:with-param name="TargetNode" select="$FormData/OwnrAnyPoliciesNotOwnedDODInd"/>
						</xsl:call-template>
						<span class="styIRS712DotLn">................................</span>
					</div>
					<div class="styGenericDiv" style="width:22mm;padding-top:3mm;height:7mm;">
						<xsl:call-template name="PopulateSpan">
							<xsl:with-param name="TargetNode" select="$FormData/OwnrAnyPoliciesNotOwnedDODInd"/>
						</xsl:call-template>
						
						<input type="checkbox" class="styCkboxNM" style="margin-right:2px;" aria-label="Did the decedent have any incidents of ownership on any policies on his/her life Yes">
							<xsl:call-template name="PopulateYesCheckbox">
								<xsl:with-param name="TargetNode" select="$FormData/OwnrAnyPoliciesNotOwnedDODInd"/>
								<xsl:with-param name="BackupName">F712/OwnrAnyPoliciesNotOwnedDODInd</xsl:with-param>
							</xsl:call-template>
						</input>
						Yes
						<input type="checkbox" class="styCkboxNM" style="margin-right:2px;margin-left:3mm;" aria-label="Did the decedent have any incidents of ownership on any policies on his/her life No">
							<xsl:call-template name="PopulateNoCheckbox">
								<xsl:with-param name="TargetNode" select="$FormData/OwnrAnyPoliciesNotOwnedDODInd"/>
								<xsl:with-param name="BackupName">F712/OwnrAnyPoliciesNotOwnedDODInd</xsl:with-param>
							</xsl:call-template>
						</input>
						No
					</div>
				</div>
				<!-- Line 35 -->
				<div class="styStdDiv">
					<div class="styLNLeftNumBox">35</div>
					<div class="styLNDesc" style="width:178mm;height:auto;">
						Names of companies with which decedent carried other policies and amount of such policies if this information is disclosed by your records.
						<br/>
						<span style="width:100%;height:auto;border-bottom:1px dashed black;">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/OtherPoliciesInformationTxt"/>
							</xsl:call-template>
						</span>
						<xsl:if test="not($FormData/OtherPoliciesInformationTxt) or $FormData/OtherPoliciesInformationTxt=''">
							<span style="width:100%;height:auto;border-bottom:1px dashed black;"/>
							<span style="width:100%;height:auto;border-bottom:1px dashed black;"/>
						</xsl:if>
					</div>
				</div>
				<!--Signature-->
				<div class="styStdDiv">
					<div class="styLNDesc" style="width:187mm;height:8mm;border-top:1px solid black;">
						The undersigned officer of the above-named insurance company (or appropriate federal agency
						or retirement system official) hereby certifies that this statement sets forth true and correct information.
					</div>
					<div class="styLNDesc" style="height:8mm;width:80mm;padding:4mm 0 0 0mm;">Signature</div>
					<div class="styLNDesc" style="height:8mm;width:55mm;padding:4mm 0 0 1mm;">Title</div>
					<div class="styLNDesc" style="height:8mm;width:50mm;padding:4mm 0 0 1mm;">Date of Certification</div>
				</div>
				<!-- Page 1 Break and Footer-->
				<div class="styStdDiv pageEnd" style="border-top:2px solid black;padding-top:.5mm;font-size:7pt;">
					<div style="font-weight:normal;width:110mm;float:left;padding-left:0mm;">
						For Privacy Act and Paper Reduction Act Notice, see instructions.
					</div>
					<div style="width:25mm;float:left;text-align:left;padding-top:0.2mm;">Cat. No. 10170V</div>
					<div style="width:auto;text-align:right;float:right;">
						<span style="font-weight:normal;">Form <span style="font-weight:bold;font-size:9pt;">712</span> (Rev. 12-2024)</span>
					</div>
				</div>
				<!--Page 2-->
				<div class="styBB" style="width:187mm; padding-top:.5mm;">
					<div style="float:left;">
						<span style="font-weight:normal;font-size:8pt;">Form 712 (Rev. 12-2024)</span>
						<span style="width:70mm;"/>
					</div>
					<div style="float:right;">Page <span style="font-weight:bold;font-size:8pt;">2</span></div>
				</div>
				<!--Part II-->
				<div class="styStdDiv" style="border-top:1px solid black;padding-bottom:0.5mm;">
					<span class="styPartName" style="width:12mm;text-align:left;">Part II</span>
					<span class="styPartDesc" style="width:175mm;height:auto;font-weight:normal;">
						<b>Living Insured</b><br/>
						(File with Form 709, United States Gift (and Generation-Skipping Transfer) Tax Return, and Form 709-NA, United States Gift (and Generation-Skipping Transfer) 
						Tax Return on Nonresident Not a Citizen of the United States. May also be filed with Form 706, United States Estate (and Generation-Skipping Transfer) Tax Return, 
						or Form 706-NA, United States Estate (and Generation-Skipping Transfer) Tax Return, Estate of nonresident not a citizen of the United States, where decedent owned 
						insurance on life of another.)
					</span>
				</div>
				<div class="styStdDiv" style="font-weight:bold; padding:2mm 0; border-top:1px solid black; border-bottom:1px solid black; font-size:10pt; text-align:center;">
					SECTION A &mdash; General Information
				</div>
				<!--Line 36 37 38-->
				<div class="styStdDiv" style="border-bottom:1px solid #000;position:relative; overflow:hidden;">
					<!-- Full-height vertical separators -->
					<!-- after col1: 90-->
					<div style="position:absolute;top:0;bottom:0;left:90mm;width:1px;background:#000;"/>
					<!-- after col2: 90 + 57 = 142 -->
					<div style="position:absolute;top:0;bottom:0;left:146mm;width:1px;background:#000;"/>
					<!-- after col3: 147+40=187 -->
					<div style="position:absolute;top:0;bottom:0;left:187mm;width:1px;background:#000;"/>
					<!-- Line 36 -->
					<div style="width:90mm;height:auto;float:left;">
						<span class="styIRS712HeaderPage2Num">36</span>
						First name and middle initial of donor (or decedent)<br/>
						<xsl:if test="$FormData/LivingInsuredInfoGrp">
							<xsl:call-template name="PopulateReturnHeaderFiler">
								<xsl:with-param name="TargetNode">NameLine1Txt</xsl:with-param>
							</xsl:call-template>
						</xsl:if>
					</div>
					<!-- Line 37 -->
					<div style="width:56mm;height:auto;float:left;padding-left:0.5mm;">
						<span class="styIRS712HeaderPage2Num">37</span>
						Last name<br/>
						<xsl:if test="$FormData/LivingInsuredInfoGrp">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/NameLine1Txt"/>
							</xsl:call-template>
						</xsl:if>
					</div>
					<!-- Line 38 -->
					<div class="styEINBox" style="width:41mm;height:auto;float:left;font-weight:normal;padding-left:0.5mm;">
						<span class="styIRS712HeaderPage2Num">38</span>
						<b>Social security number</b> <br/>
						<xsl:if test="$FormData/LivingInsuredInfoGrp">
							<xsl:call-template name="PopulateReturnHeaderFiler">
								<xsl:with-param name="TargetNode">PrimarySSN</xsl:with-param>
								<xsl:with-param name="EINChanged">true</xsl:with-param>
							</xsl:call-template>
						</xsl:if>
					</div>
				</div>
				<!--Line 39-->
				<div class="styStdDiv">
					<div class="styLNLeftNumBox">39</div>
					<div class="styLNDesc">
						Date of gift for which valuation data submitted
						<span class="styIRS712DotLn">...................</span>
					</div>
					<div class="styLNAmountBox" style="width:40mm;">
						<xsl:call-template name="PopulateMonthDayYear">
							<xsl:with-param name="TargetNode" select="$FormData/LivingInsuredInfoGrp/GiftDt"/>
						</xsl:call-template>
					</div>
				</div>
				<!--Line 40-->
				<div class="styStdDiv">
					<div class="styLNLeftNumBox">40</div>
					<div class="styLNDesc">
						Date of decedent’s death for which valuation data submitted
						<span class="styIRS712DotLn">..............</span>
					</div>
					<div class="styLNAmountBox" style="width:40mm;border-bottom:0px solid black;">
						<xsl:call-template name="PopulateMonthDayYear">
							<xsl:with-param name="TargetNode" select="$FormData/LivingInsuredInfoGrp/ValuationDeathDt"/>
						</xsl:call-template>
					</div>
				</div>
				<div class="styStdDiv" style="font-weight:bold;padding-top:2mm;padding-bottom:2mm;border-bottom:1px solid black;border-top:1px solid black; font-size:10pt;text-align:center;">
					SECTION B &mdash; Policy Information
				</div>
				<!--Line 41 42 43-->
				<div class="styStdDiv" style="border-bottom:1px solid #000;position:relative; overflow:hidden;">
					<!-- Full-height vertical separators -->
					<!-- after col1: 141-->
					<div style="position:absolute;top:0;bottom:0;left:141mm;width:1px;background:#000;"/>
					<!-- after col2: 141 + 19 = 160-->
					<div style="position:absolute;top:0;bottom:0;left:160mm;width:1px;background:#000;"/>
					<!-- after col3: 160+27=187 -->
					<div style="position:absolute;top:0;bottom:0;left:187mm;width:1px;background:#000;"/>
					<!-- Line 41 -->
					<div style="width:141mm;height:auto;float:left;">
						<span class="styIRS712HeaderPage2Num">41</span>
						Name of insured<br/>
						<xsl:if test="$FormData/LivingInsuredInfoGrp/InsuredNm">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/LivingInsuredInfoGrp/InsuredNm"/>
							</xsl:call-template>
						</xsl:if>
					</div>
					<!-- Line 42 -->
					<div style="width:19mm;height:auto;float:left;padding-left:0.5mm;">
						<span class="styIRS712HeaderPage2Num">42</span>
						Sex<br/>
						<xsl:call-template name="PopulateText">
							<xsl:with-param name="TargetNode" select="$FormData/LivingInsuredInfoGrp/SexCd"/>
						</xsl:call-template>
					</div>
					<!-- Line 43 -->
					<div style="width:27mm;height:auto;padding-left:0.5mm;">
						<span class="styIRS712HeaderPage2Num">43</span>
						Date of birth <br/>
						<xsl:call-template name="PopulateMonthDayYear">
							<xsl:with-param name="TargetNode" select="$FormData/LivingInsuredInfoGrp/BirthDt"/>
						</xsl:call-template>
					</div>
				</div>
				<!--Line 44a, b, c, d, e-->
				<div class="styStdDiv" style="position:relative; overflow:hidden;">
					<!-- Full-height vertical separators -->
					<div style="position:absolute;top:0;bottom:0;left:59mm;width:1px;background:#000;"/>
					<div style="position:absolute;top:0;bottom:0;left:114mm;width:1px;background:#000;"/>
					<div style="position:absolute;top:0;bottom:0;left:141mm;width:1px;background:#000;"/>
					<div style="position:absolute;top:0;bottom:0;left:160mm;width:1px;background:#000;"/>
					<!-- Line 44a -->
					<div style="width:59mm;min-height:8mm;height:auto;float:left;">
						<span class="styIRS712HeaderPage2Num" style="height:auto">44a</span>
						Name of insurance company<br/>
						<div style="margin-left:8mm;padding-right:.5mm;">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/LivingInsuredInfoGrp/BusinessName/BusinessNameLine1Txt"/>
							</xsl:call-template>
							<xsl:if test="$FormData/LivingInsuredInfoGrp/BusinessName/BusinessNameLine2Txt">
								<br/>
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$FormData/LivingInsuredInfoGrp/BusinessName/BusinessNameLine2Txt"/>
								</xsl:call-template>
							</xsl:if>
						</div>
					</div>
					<!-- Line 44b -->
					<div style="width:55mm;min-height:8mm;height:auto;float:left;">
						<span class="styIRS712HeaderPage2Num">44b</span>
						Address (number and street) of <br/>insurance company<br/>
						<div style="margin-left:8mm;padding-right:.5mm;">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/LivingInsuredInfoGrp/USAddress/AddressLine1Txt"/>
							</xsl:call-template>
							<xsl:if test="$FormData/LivingInsuredInfoGrp/USAddress/AddressLine2Txt">
								<br/>
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$FormData/LivingInsuredInfoGrp/USAddress/AddressLine2Txt"/>
								</xsl:call-template>
							</xsl:if>
						</div>
					</div>
					<!-- Line 44c -->
					<div style="width:27mm;min-height:8mm;height:auto;float:left;">
						<span class="styIRS712HeaderPage2Num" style="height:auto">44c</span>
						City<br/>
						<div style="margin-left:8mm;padding-right:.5mm;">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/LivingInsuredInfoGrp/USAddress/CityNm"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 44d -->
					<div style="width:19mm;min-height:8mm;height:auto;float:left;">
						<span class="styIRS712HeaderPage2Num" style="height:auto">44d</span>
						State<br/>
						<div style="margin-left:8mm;padding-right:.5mm;">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/LivingInsuredInfoGrp/USAddress/StateAbbreviationCd"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 44e -->
					<div style="width:27mm;min-height:8mm;height:auto;padding-left:0.5mm;">
						<span class="styIRS712HeaderPage2Num" style="height:auto">44e</span>
						ZIP Code<br/>
						<div style="margin-left:8mm;padding-right:.5mm;">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/LivingInsuredInfoGrp/USAddress/ZIPCd"/>
							</xsl:call-template>
						</div>
					</div>
				</div>
				<!--Line 45 46 47 48-->
				<div class="styStdDiv" style="border-top:1px solid #000; border-bottom:1px solid #000;position:relative; overflow:hidden;">
					<!-- Full-height vertical separators -->
					<!-- after col1: 67-->
					<div style="position:absolute;top:0;bottom:0;left:67mm;width:1px;background:#000;"/>
					<!-- after col2: 67+ 56 = 123 -->
					<div style="position:absolute;top:0;bottom:0;left:123mm;width:1px;background:#000;"/>
					<!-- after col2: 123 + 37 = 160 -->
					<div style="position:absolute;top:0;bottom:0;left:160mm;width:1px;background:#000;"/>
					<!-- after col3: 160+27=187 -->
					<div style="position:absolute;top:0;bottom:0;left:187mm;width:1px;background:#000;"/>
					<!-- Line 45 -->
					<div style="width:67mm;height:auto;float:left;">
						<span class="styIRS712HeaderPage2Num" style="height:auto">45</span>
						Type of policy<br/>
						<div style="margin-left:8mm;">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/LivingInsuredInfoGrp/PolicyTypeDesc"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 46 -->
					<div style="width:56mm;height:auto;float:left;font-weight:normal;padding-left:0.5mm;">
						<span class="styIRS712HeaderPage2Num">46</span>
						Policy number<br/>
						<xsl:call-template name="PopulateText">
							<xsl:with-param name="TargetNode" select="$FormData/LivingInsuredInfoGrp/PolicyNum"/>
						</xsl:call-template>
					</div>
					<!-- Line 47 -->
					<div style="width:37mm;height:auto;float:left;font-weight:normal;padding-left:0.5mm;">
						<span class="styIRS712HeaderPage2Num">47</span>
						Face amount<br/>
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/LivingInsuredInfoGrp/PolicyFaceValueAmt"/>
						</xsl:call-template>
					</div>
					<!-- Line 48 -->
					<div style="width:27mm;height:auto;float:right;font-weight:normal;padding-left:0.5mm;">
						<span class="styIRS712HeaderPage2Num">48</span>
						Issue date <br/>
						<div style="margin-left:0mm;">
							<xsl:call-template name="PopulateMonthDayYear">
								<xsl:with-param name="TargetNode" select="$FormData/LivingInsuredInfoGrp/IssueDt"/>
							</xsl:call-template>
						</div>
					</div>
				</div>
				<!--Line 49 50 -->
				<div class="styStdDiv" style="border-bottom:1px solid #000;position:relative; overflow:hidden;">
					<!-- after col1: 142-->
					<div style="position:absolute;top:0;bottom:0;left:142mm;width:1px;background:#000;"/>
					<!-- after col2: 142 + 20 = 162 -->
					<div style="position:absolute;top:0;bottom:0;left:187mm;width:1px;background:#000;"/>
					<!-- Line 49 -->
					<div style="width:142mm;height:auto;font-weight:normal;float:left;">
						<span class="styIRS712HeaderPage2Num">49</span>
						Gross premium<br/>
						<xsl:if test="$FormData/LivingInsuredInfoGrp">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/LivingInsuredInfoGrp/GrossPremiumAmt"/>
							</xsl:call-template>
						</xsl:if>
					</div>
					<!-- Line 50 -->
					<div style="width:45mm;height:auto;font-weight:normal;padding-left:0.5mm;">
						<span class="styIRS712HeaderPage2Num">50</span>
						Frequency of payment <br/>
						<xsl:call-template name="PopulateText">
							<xsl:with-param name="TargetNode" select="$FormData/LivingInsuredInfoGrp/PaymentFrequencyTxt"/>
						</xsl:call-template>
					</div>
				</div>
				<!--Line 51 52-->
				<div class="styStdDiv" style="border-bottom:1px solid #000;position:relative; overflow:hidden;">
					<!--Col1 160 Col2 27-->
					<div style="position:absolute;top:0;bottom:0;left:160mm;width:1px;background:#000;"/>
					<div style="position:absolute;top:0;bottom:0;left:187mm;width:1px;background:#000;"/>
					<!-- Line 51 -->
					<div style="width:160mm;height:auto;float:left;">
						<span class="styIRS712HeaderPage2Num" style="height:auto">51</span>
						Assignee’s name<br/>
						<span style="padding-left:8mm;">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/LivingInsuredInfoGrp/AssigneeName/BusinessNameLine1Txt"/>
							</xsl:call-template>							
							<xsl:if test="$FormData/LivingInsuredInfoGrp/AssigneeName/BusinessNameLine2Txt">
								<br/>
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$FormData/LivingInsuredInfoGrp/AssigneeName/BusinessNameLine2Txt"/>
									</xsl:call-template>
							</xsl:if>
						</span>
					</div>
					<!-- Line 52 -->
					<div style="width:27mm;height:auto;float:right;font-weight:normal;padding-left:0.5mm;">
						<span class="styIRS712HeaderPage2Num">52</span>
						Date assigned <br/>
						<div style="margin-left:0mm;">
							<xsl:call-template name="PopulateMonthDayYear">
								<xsl:with-param name="TargetNode" select="$FormData/LivingInsuredInfoGrp/AssignedDt"/>
							</xsl:call-template>
						</div>
					</div>
				</div>
				<!--Line 53 54 55 56-->
				<div class="styStdDiv" style="border-bottom:1px solid #000;position:relative; overflow:hidden;">
					<!-- col1: 116 col2 17 col3 27 col4 27 -->
					<div style="position:absolute;top:0;bottom:0;left:116mm;width:1px;background:#000;"/>
					<!--Col 1 = 116mm-->
					<div style="position:absolute;top:0;bottom:0;left:133mm;width:1px;background:#000;"/>
					<!--Col 2 = 116mm + 17mm = 133mm-->
					<div style="position:absolute;top:0;bottom:0;left:160mm;width:1px;background:#000;"/>
					<!--Col 3 = 133 + 27mm = 160 mm-->
					<div style="position:absolute;top:0;bottom:0;left:187mm;width:1px;background:#000;"/>
					<!--Col 4 = 160 mm + 27 mm = 187mm-->
					<!-- Line 53 -->
					<div style="width:116mm;height:auto;float:left;">
						<span class="styIRS712HeaderPage2Num">53</span>
						If irrevocable designation of beneficiary made, name of beneficiary<br/>
						<xsl:if test="$FormData/LivingInsuredInfoGrp/BeneficiaryPersonNm">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/LivingInsuredInfoGrp/BeneficiaryPersonNm"/>
							</xsl:call-template>
						</xsl:if>
						<xsl:if test="$FormData/LivingInsuredInfoGrp/BeneficiaryBusinessName/BusinessNameLine1Txt">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/LivingInsuredInfoGrp/BeneficiaryBusinessName/BusinessNameLine1Txt"/>
							</xsl:call-template>
						</xsl:if>
						<xsl:if test="$FormData/LivingInsuredInfoGrp/BeneficiaryBusinessName/BusinessNameLine2Txt">
							<br/>
							<div style="margin-left:8mm;">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$FormData/LivingInsuredInfoGrp/BeneficiaryBusinessName/BusinessNameLine2Txt"/>
								</xsl:call-template>
							</div>
						</xsl:if>
					</div>
					<!-- Line 54 -->
					<div style="width:17mm;height:auto;float:left;font-weight:normal;padding-left:0.5mm;">
						<span class="styIRS712HeaderPage2Num">54</span>
						Sex <br/>
						<xsl:call-template name="PopulateMonthDayYear">
							<xsl:with-param name="TargetNode" select="$FormData/LivingInsuredInfoGrp/BeneficiarySexCd"/>
						</xsl:call-template>
					</div>
					<!-- Line 55 -->
					<div style="width:27mm;height:auto;float:left;font-weight:normal;padding-left:0.5mm;">
						<span class="styIRS712HeaderPage2Num">55</span>
						Date of birth, <br/>if known
						<div style="margin-left:8mm;">
							<xsl:call-template name="PopulateMonthDayYear">
								<xsl:with-param name="TargetNode" select="$FormData/LivingInsuredInfoGrp/BeneficiaryBirthDt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 56 -->
					<div style="width:27mm;height:auto;float:right;font-weight:normal;padding-left:0.5mm;">
						<span class="styIRS712HeaderPage2Num">56</span>
						Date designated <br/>
						<div style="margin-left:8mm;">
							<xsl:if test="$FormData/LivingInsuredInfoGrp/BeneficiaryDesignatedDt">
								<xsl:call-template name="PopulateMonthDayYear">
									<xsl:with-param name="TargetNode" select="$FormData/LivingInsuredInfoGrp/BeneficiaryDesignatedDt"/>
								</xsl:call-template>
							</xsl:if>
							<xsl:if test="$FormData/LivingInsuredInfoGrp/BeneficiaryBusDesignatedDt">
								<xsl:call-template name="PopulateMonthDayYear">
									<xsl:with-param name="TargetNode" select="$FormData/LivingInsuredInfoGrp/BeneficiaryBusDesignatedDt"/>
								</xsl:call-template>
							</xsl:if>
						</div>
					</div>
				</div>
				<!--Line 57-->
				<div class="styStdDiv" style="border-bottom:1px solid #000;position:relative; overflow:hidden;">	
					<span class="styIRS712HeaderPage2Num" style="height:auto">57</span>
						If other than simple designation, quote in full. Attach additional sheets if necessary. <br/>	
					<div class="styStdDiv" style="min-height:34mm;height:auto;padding-left:8mm;padding-bottom:.5mm;">
						<xsl:call-template name="PopulateText">
							<xsl:with-param name="TargetNode" select="$FormData/OtherThanSimpleDesignationTxt"/>
						</xsl:call-template>
					</div>
				</div>
				<!-- Line 58a -->
				<div class="styStdDiv">
					<div class="styLNLeftNumBox">58</div>
					<div class="styLNDesc" style="width:99mm;">If policy is not paid up:</div>
					<div class="styLNRightNumBox" style="border-bottom:0px solid black;"/>
					<div class="styLNAmountBox" style="border-bottom:0px solid black;"/>
					<div class="styLNRightNumBox" style="background:lightgray;border-bottom:0px solid black;"/>
					<div class="styLNAmountBox" style="background:lightgray;border-bottom:0px solid black;"/>
					<!-- 58a subline (same level structure as 59a) -->
					<div class="styLNLeftNumBox" style="height:7mm; padding-left:4mm;">a</div>
					<div class="styLNDesc" style="width:99mm; height:7mm;">
						If a complex trust, enter accounting income for the tax year as determined under the governing instrument and applicable local law
						<span class="styIRS712DotLn">.......</span>
					</div>
					<div class="styLNRightNumBox" style="height:7mm;padding-top:3mm;">58a</div>
					<div class="styLNAmountBox" style="height:7mm;padding-top:3mm; padding-right:0.5mm;">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/InterpolatedTermRsrvDODAmt"/>
						</xsl:call-template>
					</div>
					<div class="styLNRightNumBox" style="height:7mm;background:lightgray;border-bottom:0px solid black;"/>
					<div class="styLNAmountBox" style="height:7mm;background:lightgray;border-bottom:0px solid black;"/>
				</div>
				<!-- Line 58b -->
				<div class="styStdDiv" style="border-top-width:1px;">
					<div class="styLNLeftNumBox" style="height:7mm;padding-left:4mm;">b</div>
					<div class="styLNDesc" style="width:99mm;height:7mm;">
						Add proportion of gross premium paid beyond date of death, assignment, or irrevocable designation of beneficiary
						<span class="styIRS712DotLn">............</span>
					</div>
					<div class="styLNRightNumBox" style="height:7mm;padding-top:3mm;">58b</div>
					<div class="styLNAmountBox" style="height:7mm;padding-top:3mm;padding-right:0.5mm;">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/GrossPremiumPaidBeyondDODAmt"/>
						</xsl:call-template>
					</div>
					<!-- blank/gray boxes -->
					<div class="styLNRightNumBox" style="height:7mm;background-color:lightgray;border-bottom:0px solid black;"/>
					<div class="styLNAmountBox" style="height:7mm;background-color:lightgray;border-bottom:0px solid black;"/>
				</div>
				<!-- Line 58c -->
				<div class="styStdDiv" style="border-top-width:1px;">
					<div class="styLNLeftNumBox" style="padding-left:4mm;">c</div>
					<div class="styLNDesc" style="width:99mm;">Add adjustment on account of dividends to credit of policy
						<span class="styIRS712DotLn">......</span>
					</div>
					<div class="styLNRightNumBox">58c</div>
					<div class="styLNAmountBox" style="padding-right:0.5mm;">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/AccountAdjDividendsCrPolicyAmt"/>
						</xsl:call-template>
					</div>
					<!-- blank/gray boxes -->
					<div class="styLNRightNumBox" style="background-color:lightgray;border-bottom:0px solid black;"/>
					<div class="styLNAmountBox" style="background-color:lightgray;border-bottom:0px solid black;"/>
				</div>
				<!-- Line 58d -->
				<div class="styStdDiv" style="border-top-width:1px;">
					<div class="styLNLeftNumBox" style="padding-left:4mm;">d</div>
					<div class="styLNDesc" style="width:139mm;">
						<b>Total.</b> Add lines 58a, b, and c.
						<span class="styIRS712DotLn">........................</span>
					</div>
					<!-- blank/gray boxes -->
					<div class="styLNRightNumBox">58d</div>
					<div class="styLNAmountBox" style="padding-right:0.5mm;">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/NotPaidTotalAmt"/>
						</xsl:call-template>
					</div>
				</div>
				<!-- Line 58e -->
				<div class="styStdDiv" style="border-top-width:1px;">
					<div class="styLNLeftNumBox" style="padding-left:4mm;">e</div>
					<div class="styLNDesc" style="width:139mm;">Outstanding indebtedness against policy
						<span class="styIRS712DotLn">.....................</span>
					</div>
					<div class="styLNRightNumBox">58e</div>
					<div class="styLNAmountBox" style="padding-right:0.5mm;">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/OutstdIndebtednessPolicyAmt"/>
						</xsl:call-template>
					</div>
				</div>
				<!-- Line 58f -->
				<div class="styStdDiv" style="border-top-width:1px;">
					<div class="styLNLeftNumBox" style="padding-left:4mm;">f</div>
					<div class="styLNDesc" style="width:139mm;">Net total value of the policy (for gift or estate tax purposes). Subtract line 58e from line 58d
						<span class="styIRS712DotLn">.....</span>
					</div>
					<div class="styLNRightNumBox">58f</div>
					<div class="styLNAmountBox" style="padding-right:0.5mm;">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/NetTotalValuePolicyAmt"/>
						</xsl:call-template>
					</div>
				</div>
				<!-- Line 59a -->
				<div class="styStdDiv" style="border-top-width:1px;">
					<div class="styLNLeftNumBox">59</div>
					<div class="styLNDesc" style="width:99mm;">If policy is either paid up or a single premium:</div>
					<div class="styLNRightNumBox" style="border-bottom:0px solid black;"/>
					<div class="styLNAmountBox" style="border-bottom:0px solid black;"/>
					<div class="styLNRightNumBox" style="background-color:lightgray;border-bottom:0px solid black;"/>
					<div class="styLNAmountBox" style="background-color:lightgray;border-bottom:0px solid black;"/>
					<div class="styLNLeftNumBox" style="height:14mm;padding-left:4mm;">a</div>
					<div class="styLNDesc" style="width:99mm;height:14mm;padding-right:.5mm;">
						Total cost, on date of death, assignment, or irrevocable designation of beneficiary, 
						of a single-premium policy on life of insured at attained age, for original face 
						amount plus any additional paid-up insurance (additional face amount
						<span style="width:25mm;height:auto;border-bottom:1px solid black;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/AdditionalFaceValueAmt"/>
							</xsl:call-template>
						</span>
						)
						<span class="styIRS712DotLn">..............</span>
					</div>
					<div class="styLNRightNumBox" style="height:14mm;padding-top:10mm;">59a</div>
					<div class="styLNAmountBox" style="height:14mm;padding-top:10mm;padding-right:0.5mm;">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/TotalCostAmt"/>
						</xsl:call-template>
					</div>
					<div class="styLNRightNumBox" style="height:14mm;background-color:lightgray;border-bottom:0px solid black;"/>
					<div class="styLNAmountBox" style="height:14mm;background-color:lightgray;border-bottom:0px solid black;"/>
				</div>
				<!-- Line 59b -->
				<div class="styStdDiv" style="border-top-width:1px;">
					<div class="styLNLeftNumBox" style="height:20mm;padding-left:4mm;"/>
					<div class="styLNDesc" style="width:99mm;height:20mm;padding-right:.5mm;">
						(If a single-premium policy for the total face amount would not have been
						issued on the life of the insured as of the date specified, nevertheless, assume
						that such a policy could then have been purchased by the insured and state
						the cost thereof, using for such purpose the same formula and basis employed,
						on the date specified, by the company in calculating single premiums.)
					</div>
					<div class="styLNRightNumBox" style="height:20mm;padding-top:4mm;border-bottom:0px solid black;"/>
					<div class="styLNAmountBox" style="height:20mm;border-bottom:0px solid black;"/>
					<div class="styLNRightNumBox" style="height:20mm;background-color:lightgray;border-bottom:0px solid black;"/>
					<div class="styLNAmountBox" style="height:20mm;background-color:lightgray;border-bottom:0px solid black;"/>
					<div class="styLNLeftNumBox" style="padding-left:4mm;">b</div>
					<div class="styLNDesc" style="width:99mm;">
						Adjustment on account of dividends to credit of policy
						<span class="styIRS712DotLn">.......</span>
					</div>
					<div class="styLNRightNumBox">59b</div>
					<div class="styLNAmountBox" style="padding-right:0.5mm;">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/AcctAdjDividendsCrPolicyPdAmt"/>
						</xsl:call-template>
					</div>
					<div class="styLNRightNumBox" style="background-color:lightgray;border-bottom:0px solid black;"/>
					<div class="styLNAmountBox" style="background-color:lightgray;border-bottom:0px solid black;"/>
				</div>
				<!-- Line 59c -->
				<div class="styStdDiv" style="border-top-width:1px;">
					<div class="styLNLeftNumBox" style="padding-left:4mm;">c</div>
					<div class="styLNDesc" style="width:139mm;"><strong>Total.</strong> Add lines 59a and 59b
						<span class="styIRS712DotLn">.........................</span>
					</div>
					<div class="styLNRightNumBox">59c</div>
					<div class="styLNAmountBox" style="padding-right:0.5mm;">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/PaidTotalAmt"/>
						</xsl:call-template>
					</div>
				</div>
				<!-- Line 59d -->
				<div class="styStdDiv" style="border-top-width:1px;">
					<div class="styLNLeftNumBox" style="padding-left:4mm;">d</div>
					<div class="styLNDesc" style="width:139mm;"> Outstanding indebtedness against policy
						<span class="styIRS712DotLn">.....................</span>
				    </div>
					<div class="styLNRightNumBox">59d</div>
					<div class="styLNAmountBox" style="padding-right:0.5mm;">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/OutstdIndebtednessPolicyPdAmt"/>
						</xsl:call-template>
					</div>
				</div>
				<!-- Line 59e -->
				<div class="styStdDiv" style="border-top-width:1px;">
					<div class="styLNLeftNumBox" style="padding-left:4mm;">e</div>
					<div class="styLNDesc" style="width:139mm;">Net total value of policy (for gift or estate tax purposes). Subtract line 59d from line 59c
						<span class="styIRS712DotLn">......</span>
					</div>
					<div class="styLNRightNumBox" style="border-bottom:0px solid black;">59e</div>
					<div class="styLNAmountBox" style="border-bottom:0px solid black;padding-right:0.5mm;">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/NetTotalValuePolicyPdAmt"/>
						</xsl:call-template>
					</div>
				</div>
				<!--Signature-->
				<div class="styStdDiv">
					<div class="styLNDesc" style="width:187mm;height:8mm;border-top:1px solid black;">
						The undersigned officer of the above-named insurance company (or appropriate federal agency
						or retirement system official) hereby certifies that this statement sets forth true and correct information.
					</div>
					<div class="styLNDesc" style="height:8mm;width:80mm;padding:4mm 0 0 0mm;">Signature</div>
					<div class="styLNDesc" style="height:8mm;width:55mm;padding:4mm 0 0 1mm;">Title</div>
					<div class="styLNDesc" style="height:8mm;width:50mm;padding:4mm 0 0 1mm;">Date of Certification</div>
				</div>
				<!--Page End-->
				<div class="styStdDiv pageEnd" style="border-top:2px solid black;text-align:right;">
					<div style="text-align:right;float:right;">
						<span style="font-weight:normal;">Form <span style="font-weight:bold;font-size:9pt;">712</span> (Rev. 12-2024)</span>
					</div>
				</div>
				<!-- Begin Additonal Data Title Bar and Button -->
				<div class="styLeftOverTitleLine" id="LeftoverData">
					<div class="styLeftOverTitle"> Additional Data</div>
					<div class="styLeftOverButtonContainer">
						<input class="styLeftoverTableBtn" TabIndex="1" type="button" value="Return to Form" onclick="javascript:returnToWriteInImage();"/>
					</div>
				</div>
				<table class="styLeftOverTbl">
					<xsl:call-template name="PopulateCommonLeftover">
						<xsl:with-param name="TargetNode" select="$FormData"/>
						<xsl:with-param name="DescWidth" select="100"/>
					</xsl:call-template>
				</table>
			</body>
		</html>
	</xsl:template>
	<xsl:template name="FillPage1Table">
		<xsl:param name="LineNumber"/>
		<xsl:param name="MaxLine" select="3"/>
		<xsl:param name="Main" select="false()"/>
		<tr style="font-size:7pt;vertical-align:bottom;">
			<td class="styTableCellCtrInherit" style="font-weight:bold;border-left-width:1px;">
				<xsl:choose>
					<xsl:when test="$Main and ($LineNumber = 1)">1</xsl:when>
					<xsl:otherwise>&nbsp;</xsl:otherwise>
				</xsl:choose>
			</td>
			<td class="styTableCellAmtInherit" style="border-left-width:1px;">&nbsp;</td>
			<td class="styTableCellAmtInherit" style="border-right-width:1px;">&nbsp;</td>
		</tr>
		<xsl:if test="$LineNumber &lt; $MaxLine">
			<xsl:call-template name="FillPage1Table">
				<xsl:with-param name="LineNumber" select="$LineNumber + 1"/>
				<xsl:with-param name="MaxLine" select="$MaxLine"/>
			</xsl:call-template>
		</xsl:if>
	</xsl:template>
</xsl:stylesheet>