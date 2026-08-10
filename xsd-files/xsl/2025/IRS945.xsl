<?xml version="1.0" encoding="UTF-8"?> 

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:include href="PopulateTemplate.xsl"/>
	<xsl:include href="AddHeader.xsl"/>
	<xsl:include href="CommonPathRef.xsl"/>
	<xsl:include href="AddOnTable.xsl"/>
	<xsl:include href="IRS945Style.xsl"/>
	<xsl:output method="html" indent="yes"/>
	<xsl:strip-space elements="*"/>
	<xsl:param name="FormData" select="$RtnDoc/IRS945"/>
	<xsl:template match="/">
		<xsl:text disable-output-escaping="yes">&lt;!DOCTYPE html&gt;</xsl:text>
		<html lang="EN-US">
			<head>
				<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
				<title>
					<xsl:call-template name="FormTitle">
						<xsl:with-param name="RootElement" select="local-name($FormData)">
					</xsl:with-param>
					</xsl:call-template>
				</title>
				<!-- No Browser Caching -->
				<meta http-equiv="Pragma" content="no-cache"/>
				<meta http-equiv="Cache-Control" content="no-cache"/>
				<meta http-equiv="Expires" content="0"/>
				<!-- No Proxy Caching -->
				<meta http-equiv="Cache-Control" content="private"/>
				<!-- Define Character Set -->
				<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1"/>
				<meta name="Description" content="IRS Form 945"/>
				<script language="JavaScript" src="{$ScriptPath}/FormDisplay.js" type="text/javascript"/>
				<xsl:call-template name="InitJS"/>
				<style type="text/css">
					<xsl:if test="not($Print) or $Print=''">
						<xsl:call-template name="IRS945Style"/>
						<xsl:call-template name="AddOnStyle"/>
					</xsl:if>
				</style>
				<xsl:call-template name="GlobalStylesForm"/>
			</head>
			<body class="styBodyClass" style="width:187mm">
				<form name="Form945" style="font-family:arial;">
					<xsl:call-template name="DocumentHeader"/>
					<!-- Begin Form Number and Name -->
					<div class="styBB" style="width:187mm;height:20mm;border-bottom-width:2px">
						<div class="styFNBox" style="width:29mm;height:20mm;border-right-width:2px">Form <span class="styFormNumber">945</span><br/>
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$FormData"/>
							</xsl:call-template>
							<br/>
							<div class="styAgency" style="font-size:7.5pt;padding-top:1mm;">Department of the Treasury<br/>Internal Revenue Service
							</div>
						</div>
						<div class="styFTBox" style="width:128mm;height:20mm; ">
							<div class="styMainTitle" style="height:4mm;padding-top:3mm;">Annual Return of Withheld Federal Income Tax</div>
							<div class="styFBT" style="width:128mm;height:auto;padding-top:3.5mm;font:size:6pt;">
								For withholding reported on Forms 1099 and W-2G.<br/>
								<span style="padding-top:1mm;">
								For more information on income tax withholding, see Pub. 15 and Pub. 15-A.<br/>
								Go to <a style="text-decoration:none;color:black;" href="http://www.irs.gov/form945" title="Link to IRS.gov"><i>www.irs.gov/Form945</i> for instructions and the latest information.</a>
								</span>
							</div>
						</div>
						<div class="styTYBox" style="width:30mm;height:20mm;border-left-width:2px">
							<div class="styOMB" style="height:8mm;padding-top:2mm;">OMB No. 1545-0029 </div>
							<div class="styTY" style="padding-top:1mm;">20<span class="styTYColor">25</span>
							</div>
						</div>
					</div>
                    <div class="styBB" style="width:187mm;border-bottom-width:0px;padding-top:2mm;">
						<div class="styBB" style=" width:131mm;height:65mm;float:left;border:black solid 1px;padding-top:2mm;padding-left:1mm;padding-right:2mm;">
							<div style="width:128mm;padding-top:0mm;">
								<span style="float:left;padding-top:3mm;"><b>Employer identification number </b>(EIN)</span>
								<span class="styLNCtrNumBox" style="width:80mm;border-top-width:1px;padding-top:1mm;float:right;height:6.3mm;">
									<xsl:call-template name="PopulateReturnHeaderFiler">
										<xsl:with-param name="TargetNode">EIN</xsl:with-param>
										<xsl:with-param name="EINChanged">true</xsl:with-param>
									</xsl:call-template>
								</span>
							</div>
							<div style="width:128mm;padding-bottom:2mm;padding-top:2mm;">
								<span style="float:left;padding-top:4mm;"><b>Name</b><i> (not your trade name)</i></span>
								<span class="styLNCtrNumBox" style="width:95mm;border-top-width:1px;float:right;height:12mm;text-align:left;padding-left:1mm;">
									<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/BusinessName/BusinessNameLine1Txt"/>
										</xsl:call-template><br/>
									<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/BusinessName/BusinessNameLine2Txt"/>
										</xsl:call-template>
								</span>
							</div>
							<div style="width:128mm;padding-bottom:2mm;">
								<span style="float:left;padding-top:4mm;"><b>Trade name</b><i> (if any)</i></span>
								<span class="styLNCtrNumBox" style="width:104mm;border-top-width:1px;float:right;height:7mm;text-align:left;padding-left:1mm;">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/TradeName/BusinessNameLine1Txt"/>
									</xsl:call-template><br/>
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/TradeName/BusinessNameLine2Txt"/>
									</xsl:call-template>
								</span>
							</div>
							<div style="width:128mm;padding-bottom:0mm;">
								<span style="width:20mm;height:15mm;float:left;padding-top:2mm;font-weight:bold;">Address</span>
								<span class="styLNCtrNumBox" style="width:108mm;height:auto;float:right;border-top-width:1px;padding-top:1mm;padding-left:1mm;text-align:left;">
									<xsl:call-template name="PopulateReturnHeaderFiler">
										<xsl:with-param name="TargetNode">AddressLine1Txt</xsl:with-param>
									</xsl:call-template><br/>
									<xsl:call-template name="PopulateReturnHeaderFiler">
										<xsl:with-param name="TargetNode">AddressLine2Txt</xsl:with-param>
									</xsl:call-template>
								</span>
								<span style="width:108mm;font-size:6pt;padding-left:1mm;">
									Number<span style="width:16mm"/>Street<span style="width:50mm;"/>Suite or room number
								</span>
								<span class="styLNCtrNumBox" style="width:66mm;border-top-width:1px;padding-top:1mm;height:7mm;text-align:left;padding-left:1mm;">
									<xsl:call-template name="PopulateReturnHeaderFiler">
										<xsl:with-param name="TargetNode">CityNm</xsl:with-param>
									</xsl:call-template>
								</span>
								<span class="styLNCtrNumBox" style="width:2.5mm;float:left;border:none"/>
								<span class="styLNCtrNumBox" style="width:13mm;border-top-width:1px;padding-top:1mm;height:7mm;">
									<xsl:call-template name="PopulateReturnHeaderFiler">
										<xsl:with-param name="TargetNode">StateAbbreviationCd</xsl:with-param>
									</xsl:call-template>
								</span>
								<span class="styLNCtrNumBox" style="width:2.5mm;float:left;border:none"/>
								<span class="styLNCtrNumBox" style="width:24mm;border-top-width:1px;padding-top:1mm;height:7mm;">
									<xsl:call-template name="PopulateReturnHeaderFiler">
										<xsl:with-param name="TargetNode">ZIPCd</xsl:with-param>
									</xsl:call-template>
								</span>
								<span style="width:128mm;font-size:6pt;padding-left:21mm;">
									<span style="width:66mm;">City</span>
									<span style="width:13mm;text-align:center;">State</span>
									<span style="width:24mm;text-align:center;">ZIP code</span>
								</span>
								<!-- 9/23/2015 AM: Per Defect 44870, adjusted foreign address fields heights from 6mm to 7mm. -->
								<span style="width:128mm;padding-left:20mm;">
								<span class="styLNCtrNumBox" style="width:52mm;height:7mm;border-top-width:1px;padding-top:1mm;text-align:left;padding-left:1mm;word-wrap:break-word;">
									<xsl:call-template name="PopulateReturnHeaderFiler">
										<xsl:with-param name="TargetNode">CountryCd</xsl:with-param>
									</xsl:call-template>
								</span>
								<span class="styLNCtrNumBox" style="width:2.5mm;float:left;border:none"/>
								<span class="styLNCtrNumBox" style="width:29mm;border-top-width:1px;padding-top:1mm;height:7mm;word-wrap:break-word;">
									<xsl:call-template name="PopulateReturnHeaderFiler">
										<xsl:with-param name="TargetNode">ProvinceOrStateNm</xsl:with-param>
									</xsl:call-template>
								</span>
								<span class="styLNCtrNumBox" style="width:2.5mm;float:left;border:none"/>
								<span class="styLNCtrNumBox" style="width:22mm;border-top-width:1px;padding-top:1mm;height:7mm;word-wrap:break-word;">
									<xsl:call-template name="PopulateReturnHeaderFiler">
										<xsl:with-param name="TargetNode">ForeignPostalCd</xsl:with-param>
									</xsl:call-template>
								</span>
								</span>
								<span style="width:128mm;font-size:6pt;padding-left:20mm;">
									<span style="width:53mm;padding-left:1mm;">Foreign country name</span>
									<span style="width:29.5mm;text-align:center;">Foreign province/county</span>
									<span style="width:24mm;text-align:center;">Foreign postal code</span>
								</span>
							</div>
						</div>
						<div style="float:right;padding-right:2mm;padding-top:22mm;">
							<div class="styBB" style="width:51mm;height:19mm;border-left-width:1px;border-right-width:1px;border-top-width:1px;padding-top:5mm;padding-left:7mm;">
								<span class="styBoldText">If address is different from prior<br/>return, check here. 
								<input type="checkbox" aria-label="PriorAddress" class="styCkbox">
									<xsl:call-template name="PopulateCheckbox">
										<xsl:with-param name="TargetNode" select="$FormData/PriorAddressInd"/>
										<xsl:with-param name="BackupName">IRS945PriorAddressInd</xsl:with-param>
									</xsl:call-template>
								</input>
								<label>
									<xsl:call-template name="PopulateLabel">
										<xsl:with-param name="TargetNode" select="$FormData/PriorAddressInd"/>
										<xsl:with-param name="BackupName">IRS945PriorAddressInd</xsl:with-param>
									</xsl:call-template>
								</label>
								</span>
							</div>
						</div>
					</div>
					<!-- BEGIN LINE A -->
					<div class="styBB" style="width:187mm;padding-top:2mm;padding-bottom:2mm;">
						<div class="styLNLeftNumBoxSD" style="padding-top:2mm;">A</div>
						<div class="styLNDesc" style="width:135mm;">
							<span style="padding-right:.5mm">If you don't have to file returns in the future, check here </span>
							<input type="checkbox" aria-label="FutureFilingNotRequired" class="styCkbox">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$FormData/BusinessClosedGrp/FutureFilingNotRequiredInd"/>
									<xsl:with-param name="BackupName">IRS945FutureFilingNotRequiredInd</xsl:with-param>
								</xsl:call-template>
							</input>
							<label>
								<xsl:call-template name="PopulateLabel">
									<xsl:with-param name="TargetNode" select="$FormData/BusinessClosedGrp/FutureFilingNotRequiredInd"/>
									<xsl:with-param name="BackupName">IRS945FutureFilingNotRequiredInd</xsl:with-param>
								</xsl:call-template>
							</label>
							<span style="padding-left:.5mm">and enter date final payments made. </span>
						</div>
						<div class="styLNCtrNumBox" style="width:40mm;border-top-width:1px;height:5mm;">
							<xsl:call-template name="PopulateMonth">
								<xsl:with-param name="TargetNode" select="$FormData/BusinessClosedGrp/FinalPaymentDt"/>
							</xsl:call-template>/<xsl:call-template name="PopulateDay">
								<xsl:with-param name="TargetNode" select="$FormData/BusinessClosedGrp/FinalPaymentDt"/>
							</xsl:call-template>/<xsl:call-template name="PopulateYear">
								<xsl:with-param name="TargetNode" select="$FormData/BusinessClosedGrp/FinalPaymentDt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- END LINE A -->
					<!-- BEGIN LINE 1 -->
					<div style="width:187mm;"/>
					<div class="styBB" style="width:187mm;border-bottom-width:0px;font-weight:bold;">
						<div style="padding-top:2mm;float:left">
							<div class="styLNLeftNumBoxSD">1</div>
							<div class="styLNDesc" style="width:138.8mm;">
								<span style="float:left;">Federal income tax withheld from pensions, annuities, IRAs, gambling winnings, etc. </span>
								<!--Dotted Line-->
								<span class="styDotLn" style="float:right;padding-right:1mm;">.......</span>
							</div>
							<div class="styLNLeftNumBoxSD" style="height:4.4mm">1</div>
						</div>
						<div class="styLNCtrNumBox" style="width:32mm;border-top-width:1px;height:6mm;padding-top:1.5mm;text-align:right;padding-right:0.5mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/FederalIncomeTaxWithheldAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- END LINE 1 -->
					<!-- BEGIN LINE 2 -->
					<div style="width:187mm;"/>
					<div class="styBB" style="width:187mm;border-bottom-width:0px;font-weight:bold;">
						<div style="padding-top:2mm;float:left">
							<div class="styLNLeftNumBoxSD">2</div>
							<div class="styLNDesc" style="width:138.8mm;">
								<span style="float:left;">Backup withholding </span>
								<!--Dotted Line-->
								<span class="styDotLn" style="float:right;padding-right:1mm;">.............................</span>
							</div>
							<div class="styLNLeftNumBoxSD" style="height:4.4mm">2</div>
						</div>
						<div class="styLNCtrNumBox" style="width:32mm;border-top-width:1px;height:6mm;padding-top:1.5mm;text-align:right;padding-right:0.5mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/BackupWithholdingAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- END LINE 2 -->
					<!-- BEGIN LINE 3 -->
					<div style="width:187mm;"/>
					<div class="styBB" style="width:187mm;border-bottom-width:0px;">
						<div style="padding-top:2mm;float:left">
							<div class="styLNLeftNumBoxSD">3</div>
							<div class="styLNDesc" style="width:138.8mm;">
								<span style="float:left;">
									<b>Total taxes.</b> Add lines 1 and 2 </span>
								<!--Dotted Line-->
								<span class="styDotLn" style="float:right;padding-right:1mm;">...........................</span>
							</div>
							<div class="styLNLeftNumBoxSD" style="height:4.4mm">3</div>
						</div>
						<div class="styLNCtrNumBox" style="width:32mm;border-top-width:1px;height:6mm;padding-top:1.5mm;text-align:right;padding-right:0.5mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TotalTaxAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- END LINE 3 -->
					<!-- BEGIN LINE 4 -->
					<div style="width:187mm;"/>
					<div class="styBB" style="width:187mm;border-bottom-width:0px;font-weight:bold;">
						<div style="padding-top:2mm;float:left">
							<div class="styLNLeftNumBoxSD">4</div>
							<div class="styLNDesc" style="width:138.8mm;">Total deposits for 2025, including overpayment applied from a prior year and overpayment applied from<br/>
								<span style="float:left;">Form 945-X </span>
								<!--Dotted Line-->
								<span class="styDotLn" style="float:right;padding-right:1mm;">................................</span>
							</div>
							<div class="styLNLeftNumBoxSD" style="height:8mm;padding-top:3mm;">4</div>
						</div>
						<div class="styLNCtrNumBox" style="width:32mm;border-top-width:1px;height:8mm;padding-top:1.5mm;text-align:right;padding-right:0.5mm;">
							<br/>
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TotalTaxDepositAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- END LINE 4 -->
					<!-- BEGIN LINE 5 -->
					<div style="width:187mm;"/>
					<div class="styBB" style="width:187mm;border-bottom-width:0px;">
						<div style="padding-top:2mm;float:left">
							<div class="styLNLeftNumBoxSD">5</div>
							<div class="styLNDesc" style="width:138.8mm;">
								<span style="float:left;">
									<b>Balance due.</b> If line 3 is more than line 4, enter the difference and see the separate instructions </span>
								<!--Dotted Line-->
								<span class="styDotLn" style="float:right;padding-right:1mm;">........</span>
							</div>
							<div class="styLNLeftNumBoxSD" style="height:4.4mm;">5</div>
						</div>
						<div class="styLNCtrNumBox" style="width:32mm;border-top-width:1px;height:6mm;padding-top:2mm;text-align:right;padding-right:0.5mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/BalanceDueAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- END LINE 5 -->
					<!-- BEGIN LINE 6a -->
					<div style="width:187mm;"></div>
					<div class="styBB" style="width:187mm;border-bottom-width:0px;">
						<div style="padding-top:1mm;float:left">
							<div class="styLNLeftNumBoxSD">6a</div>
							<div class="styLNDesc" style="width:72mm;">
								<span style="float:left;">
									<b>Overpayment.</b> If line 4 is more than line 3, enter the difference 
								</span>
							</div>
						</div>
						<div class="styLNCtrNumBox" style="width:33mm;border-top-width:1px;height:5mm;padding-top:1mm;text-align:right;padding-right:0.5mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/OverpaymentGrp/OverpaidAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- END LINE 6a -->
					<!-- BEGIN LINE 6b -->
					<div style="width:187mm;"/>
					<div class="styBB" style="width:187mm;height:5mm;border-bottom-width:0px;">
						<div class="styLNLeftNumBoxSD" style="padding-left:4mm;padding-top:1.5mm;">b</div>
						<div class="styLNDesc" style="width:138.8mm;">
							<span style="">Check one: </span>
							<span style="width:6mm;"/>
							<span>
								<xsl:call-template name="PopulateSpan">
									<xsl:with-param name="TargetNode" select="$FormData/OverpaymentGrp/ApplyOverpaymentNextReturnInd"/>
								</xsl:call-template>
								<input type="checkbox" aria-label="ApplyOverpaymentToNextReturn" class="styCkbox">
									<xsl:call-template name="PopulateCheckbox">
										<xsl:with-param name="TargetNode" select="$FormData/OverpaymentGrp/ApplyOverpaymentNextReturnInd"/>
										<xsl:with-param name="BackupName">IRS945ApplyOverpaymentNextReturnInd</xsl:with-param>
									</xsl:call-template>
								</input>
								<label>
									<xsl:call-template name="PopulateLabel">
										<xsl:with-param name="TargetNode" select="$FormData/OverpaymentGrp/ApplyOverpaymentNextReturnInd"/>
										<xsl:with-param name="BackupName">IRS945ApplyOverpaymentNextReturnInd</xsl:with-param>
									</xsl:call-template>
									<span style="width:2mm;"/>Apply to next return.<span style="width:6mm;"/>
								</label>
							</span>
							<span>
								<xsl:call-template name="PopulateSpan">
									<xsl:with-param name="TargetNode" select="$FormData/OverpaymentGrp/RefundOverpaymentInd"/>
								</xsl:call-template>
								<input type="checkbox" aria-label="RefundOverpayment" class="styCkbox">
									<xsl:call-template name="PopulateCheckbox">
										<xsl:with-param name="TargetNode" select="$FormData/OverpaymentGrp/RefundOverpaymentInd"/>
										<xsl:with-param name="BackupName">IRS945RefundOverpaymentInd</xsl:with-param>
									</xsl:call-template>
								</input>
								<label>
									<xsl:call-template name="PopulateLabel">
										<xsl:with-param name="TargetNode" select="$FormData/OverpaymentGrp/RefundOverpaymentInd"/>
										<xsl:with-param name="BackupName">IRS945RefundOverpaymentInd</xsl:with-param>
									</xsl:call-template>
									<span style="width:2mm;"/>Send a refund.
								</label>
							</span>
						</div>
					</div>
					<!-- END LINE 6b -->
					<!-- BEGIN LINE 6c, 6d -->
					<div style="width:187mm;"></div>
					<div class="styBB" style="width:187mm;height:4.5mm;border-bottom-width:0px;">
						<div class="styLNLeftNumBoxSD" style="padding-left:4mm;padding-top:0.5mm">c</div>
						<div class="styLNDesc" style="height:4mm;">
							<span style="width:25mm;float:left;clear:none;">
							   Routing number
							</span>
							<span class="styLNCtrNumBox" style="width:34mm;border-top-width:1px;padding-top:0mm;padding-bottom:0mm;font-weight:normal">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$FormData/DirectDepositGrp/RoutingTransitNum"/>
								</xsl:call-template>
							</span>
							<span style="width:50px;"/>
							<span class="styBoldText">d</span>
							<span style="width:8px;"/>Type:
							<span style="width:8px;"/>
							<input type="checkbox" class="styCkboxNM" aria-label="Checking Account">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$FormData/DirectDepositGrp/CheckingAccountInd"/>
									<xsl:with-param name="BackupName">IRS1041CheckingAccountInd</xsl:with-param>
								</xsl:call-template>
							</input>
							<label>
								<xsl:call-template name="PopulateLabel">
									<xsl:with-param name="TargetNode" select="$FormData/DirectDepositGrp/CheckingAccountInd"/>
									<xsl:with-param name="BackupName">IRS1041CheckingAccountInd</xsl:with-param>
								</xsl:call-template>
								Checking
							</label>
								<input type="checkbox" class="styCkboxNM" aria-label="Savings Account" style="margin-left:4mm;">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$FormData/DirectDepositGrp/SavingsAccountInd"/>
									<xsl:with-param name="BackupName">IRS1041SavingsAccountInd</xsl:with-param>
								</xsl:call-template>
							</input>
							<label>
								<xsl:call-template name="PopulateLabel">
									<xsl:with-param name="TargetNode" select="$FormData/DirectDepositGrp/SavingsAccountInd"/>
									<xsl:with-param name="BackupName">IRS1041SavingsAccountInd</xsl:with-param>
								</xsl:call-template>
								Savings
							</label>
						</div>					
					</div>							
					<!-- END LINE 6c, 6d -->
					<!-- BEGIN LINE 6e -->
					<div style="width:187mm;"></div>
					<div class="styBB" style="width:187mm;border-bottom-width:0px;">
						<div class="styLNLeftNumBoxSD" style="padding-left:4mm;padding-top:0.5mm">e</div>
						<div class="styLNDesc" style="height:4.5mm;">
							<span style="width:25mm;float:left;clear:none;">
							   Account number
							</span>
							<span class="styLNCtrNumBox" style="width:84mm;border-top-width:1px;padding-top:0mm;padding-bottom:0mm;font-weight:normal">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$FormData/DirectDepositGrp/DepositorAccountNum"/>
								</xsl:call-template>
							</span>
						</div>	
					</div>
					<!-- END LINE 6e -->
					<!-- Page boundary -->
					<div style="width:187mm;"></div>
					<div class="pageEnd" style="width:187mm;border-top:2px solid black;font-size:6pt;">
						<span style="float:left;clear:none;font-weight:bold;">For Privacy Act and Paperwork Reduction Act Notice, see the separate instructions.</span>
						<span style="float:left;clear:none;margin-left:25mm;padding-top:0.5mm;">Cat. No. 14584B</span>
						<span style="float:right;clear:none;">Form <span class="styBoldText" style="font-size:7pt;">945</span> (2025) Created 3/21/25</span>
					</div>
					<p style="page-break-before: always"/>
					<!--Begin Page 2-->
					<div style="width:187mm;">
						<!--Name Shown on return-->
						<div class="styBB" style="width:187mm;font-size:7pt;border-top-width:2px;">
							<div class="styFNBox" style="width:126mm; height:8.5mm;">
								<b>Name</b><i> (not your trade name)</i><br/>
								<xsl:call-template name="PopulateReturnHeaderFiler">
									<xsl:with-param name="TargetNode">BusinessNameLine1Txt</xsl:with-param>
								</xsl:call-template><br/>
								<xsl:call-template name="PopulateReturnHeaderFiler">
									<xsl:with-param name="TargetNode">BusinessNameLine2Txt</xsl:with-param>
								</xsl:call-template>
								<div style="line-height:100%; font-family:verdana;font-size:7pt"/>
							</div>
							<div style="padding-left:1mm;">
							<b>Employer identification number (EIN)</b><br/>
								<div style="text-align:left;padding-top:2.5mm;">
									<xsl:call-template name="PopulateReturnHeaderFiler">
										<xsl:with-param name="TargetNode">EIN</xsl:with-param>
									</xsl:call-template>
								</div>
							</div>
						</div>
					</div>
					<!-- BEGIN ALL FILERS SECTION -->
					<div style="width:187mm;">
						<div class="styGenericDiv" style="width:187mm;padding-top:0.5mm;">
							<b>• All filers:</b> If line 3 is less than $2,500, <b>don't</b> complete line 7 or Form 945-A.			  
						</div>
						<div class="styGenericDiv" style="width:182mm;float:left;padding-top:1mm;">
							<span style="float:left;padding-right:2mm;">
								<b>• Semiweekly schedule depositors:</b> Complete Form 945-A and check here </span>
							<!--Dotted Line-->
							<span class="styDotLn" style="float:left;padding-left:2.5mm;padding-right:1mm;">.......................</span>
							
							<div class="styGenericDiv" style="float:right;">
								<input type="checkbox" aria-label="SemiweeklyScheduleDepositor" class="styCkbox">
									<xsl:call-template name="PopulateCheckbox">
										<xsl:with-param name="TargetNode" select="$FormData/SemiweeklyScheduleDepositorInd"/>
										<xsl:with-param name="BackupName">IRS945SemiweeklyScheduleDepositorInd</xsl:with-param>
									</xsl:call-template>
								</input>
								<label>
									<xsl:call-template name="PopulateLabel">
										<xsl:with-param name="TargetNode" select="$FormData/SemiweeklyScheduleDepositorInd"/>
										<xsl:with-param name="BackupName">IRS945SemiweeklyScheduleDepositorInd</xsl:with-param>
									</xsl:call-template>
								</label>
							</div>
						</div>
						<div class="styGenericDiv" style="width:182mm;float:left">
							<span style="float:left;padding-right:4mm;">
								<b>• Monthly schedule depositors:</b> Complete line 7, entries 7a through 7m, and check here</span>
							<!--Dotted Line-->
							<span class="styDotLn" style="float:left;">...................</span>
							
							<div class="styGenericDiv" style="float:right;">
								<input type="checkbox" aria-label="MonthlyScheduleDepositor" class="styCkbox">
									<xsl:call-template name="PopulateCheckbox">
										<xsl:with-param name="TargetNode" select="$FormData/MonthlyScheduleDepositorInd"/>
										<xsl:with-param name="BackupName">IRS945MonthlyScheduleDepositorInd</xsl:with-param>
									</xsl:call-template>
								</input>
								<label>
									<xsl:call-template name="PopulateLabel">
										<xsl:with-param name="TargetNode" select="$FormData/MonthlyScheduleDepositorInd"/>
										<xsl:with-param name="BackupName">IRS945MonthlyScheduleDepositorInd</xsl:with-param>
									</xsl:call-template>
								</label>
							</div>
						</div>
					</div>
					<!-- END ALL FILERS SECTION -->					
					<!-- BEGIN LINE 7 -->
					<div class="styGenericDiv" style="width:187mm;">
						<div class="styGenericDiv" style="width:186.5mm;">
							<div class="styLNLeftNumBoxSD">7</div>
							<div class="styLNDesc" style="width:170mm;">
								<b>Monthly Summary of Federal Tax Liability.</b> (<b>Don't</b> complete if you were a semiweekly schedule depositor.)
							</div>
						</div>
						<div style="width:187mm;">
							<div class="styLNLeftNumBox" style="width:8mm;float:left;"/>
							<div style="float:left;">
								<div style="width:40mm;float:left;">
									<!--7a-->
									<div class="styLNDesc" style="width:40mm;padding-left:8mm;text-align:center;padding-top:1mm;padding-bottom:0mm;">Jan.</div>
									<div class="styLNLeftNumBoxSD" style="float:left;width:9mm;padding-top:2.8mm;">7a</div>
									<div class="styLNCtrNumBox" style="width:30mm;border-top-width:1px;height:6mm;float:left;padding-top:1.5mm;text-align:right;padding-right:1mm;">
										<xsl:for-each select="$FormData/TaxLiabilityMonthlyDetailGrp[MonthCd = 'JANUARY']">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="TaxLiabilityAmt"/>
											</xsl:call-template>
										</xsl:for-each>
									</div>
									<!--7b-->			
									<div class="styLNDesc" style="width:40mm;padding-left:8mm;text-align:center;padding-top:1mm;padding-bottom:0mm;">Feb.</div>
									<div class="styLNLeftNumBoxSD" style="float:left;width:9mm;padding-top:2.8mm;">7b</div>
									<div class="styLNCtrNumBox" style="width:30mm;border-top-width:1px;height:6mm;float:left;padding-top:1.5mm;text-align:right;padding-right:1mm;">
										<xsl:for-each select="$FormData/TaxLiabilityMonthlyDetailGrp[MonthCd = 'FEBRUARY']">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="TaxLiabilityAmt"/>
										</xsl:call-template>
									</xsl:for-each>
								</div>
								<!--7c-->			
								<div class="styLNDesc" style="width:40mm;padding-left:8mm;text-align:center;padding-top:1mm;padding-bottom:0mm;">Mar.</div>
								<div class="styLNLeftNumBoxSD" style="float:left;width:9mm;padding-top:2.8mm;">7c</div>
								<div class="styLNCtrNumBox" style="width:30mm;border-top-width:1px;height:6mm;float:left;padding-top:1.5mm;text-align:right;padding-right:1mm;">
									<xsl:for-each select="$FormData/TaxLiabilityMonthlyDetailGrp[MonthCd = 'MARCH']">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="TaxLiabilityAmt"/>
										</xsl:call-template>
									</xsl:for-each>
								</div>	
							</div>
							<!--7d-->
							<div style="width:40mm;float:left;">
								<div class="styLNDesc" style="width:40mm;padding-left:8mm;text-align:center;padding-top:1mm;padding-bottom:0mm;">Apr.</div>
								<div class="styLNLeftNumBoxSD" style="float:left;width:9mm;padding-top:2.8mm;">7d</div>
								<div class="styLNCtrNumBox" style="width:30mm;border-top-width:1px;height:6mm;float:left;padding-top:1.5mm;text-align:right;padding-right:1mm;">
									<xsl:for-each select="$FormData/TaxLiabilityMonthlyDetailGrp[MonthCd = 'APRIL']">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="TaxLiabilityAmt"/>
										</xsl:call-template>
									</xsl:for-each>
								</div>
								<!--7e-->
								<div class="styLNDesc" style="width:40mm;padding-left:8mm;text-align:center;padding-top:1mm;padding-bottom:0mm;">May</div>
								<div class="styLNLeftNumBoxSD" style="float:left;width:9mm;padding-top:2.8mm;">7e</div>
								<div class="styLNCtrNumBox" style="width:30mm;border-top-width:1px;height:6mm;float:left;padding-top:1.5mm;text-align:right;padding-right:1mm;">
									<xsl:for-each select="$FormData/TaxLiabilityMonthlyDetailGrp[MonthCd = 'MAY']">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="TaxLiabilityAmt"/>
										</xsl:call-template>
									</xsl:for-each>
								</div>
								<!--7f-->
								<div class="styLNDesc" style="width:40mm;padding-left:8mm;text-align:center;padding-top:1mm;padding-bottom:0mm;">Jun.</div>
								<div class="styLNLeftNumBoxSD" style="float:left;width:9mm;padding-top:2.8mm;">7f</div>
								<div class="styLNCtrNumBox" style="width:30mm;border-top-width:1px;height:6mm;float:left;padding-top:1.5mm;text-align:right;padding-right:1mm;">
									<xsl:for-each select="$FormData/TaxLiabilityMonthlyDetailGrp[MonthCd = 'JUNE']">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="TaxLiabilityAmt"/>
										</xsl:call-template>
									</xsl:for-each>
								</div>	
							</div>
							<!--7g-->
							<div style="width:40mm;float:left;">
								<div class="styLNDesc" style="width:40mm;padding-left:8mm;text-align:center;padding-top:1mm;padding-bottom:0mm;">Jul.</div>
								<div class="styLNLeftNumBoxSD" style="float:left;width:9mm;padding-top:2.8mm;">7g</div>
								<div class="styLNCtrNumBox" style="width:30mm;border-top-width:1px;height:6mm;float:left;padding-top:1.5mm;text-align:right;padding-right:1mm;">
									<xsl:for-each select="$FormData/TaxLiabilityMonthlyDetailGrp[MonthCd = 'JULY']">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="TaxLiabilityAmt"/>
										</xsl:call-template>
									</xsl:for-each>
								</div>
								<!--7h-->
								<div class="styLNDesc" style="width:40mm;padding-left:8mm;text-align:center;padding-top:1mm;padding-bottom:0mm;">Aug.</div>
								<div class="styLNLeftNumBoxSD" style="float:left;width:9mm;padding-top:2.8mm;">7h</div>
								<div class="styLNCtrNumBox" style="width:30mm;border-top-width:1px;height:6mm;float:left;padding-top:1.5mm;text-align:right;padding-right:1mm;">
									<xsl:for-each select="$FormData/TaxLiabilityMonthlyDetailGrp[MonthCd = 'AUGUST']">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="TaxLiabilityAmt"/>
										</xsl:call-template>
									</xsl:for-each>
								</div>
								<!--7i-->
								<div class="styLNDesc" style="width:40mm;padding-left:8mm;text-align:center;padding-top:1mm;padding-bottom:0mm;">Sep.</div>
								<div class="styLNLeftNumBoxSD" style="float:left;width:9mm;padding-top:2.8mm;">7i</div>
								<div class="styLNCtrNumBox" style="width:30mm;border-top-width:1px;height:6mm;float:left;padding-top:1.5mm;text-align:right;padding-right:1mm;">
									<xsl:for-each select="$FormData/TaxLiabilityMonthlyDetailGrp[MonthCd = 'SEPTEMBER']">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="TaxLiabilityAmt"/>
										</xsl:call-template>
									</xsl:for-each>
								</div>
							</div>
							<!--7j-->
							<div style="width:40mm;float:left;">
								<div class="styLNDesc" style="width:40mm;padding-left:10mm;text-align:center;padding-top:1mm;padding-bottom:0mm;">Oct.</div>
								<div class="styLNLeftNumBoxSD" style="float:left;width:9mm;padding-top:2.8mm;">7j</div>
								<div class="styLNCtrNumBox" style="width:30mm;border-top-width:1px;height:6mm;float:right;padding-top:1.5mm;text-align:right;padding-right:1mm;">
									<xsl:for-each select="$FormData/TaxLiabilityMonthlyDetailGrp[MonthCd = 'OCTOBER']">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="TaxLiabilityAmt"/>
										</xsl:call-template>
									</xsl:for-each>
								</div>
								<!--7k-->
								<div class="styLNDesc" style="width:40mm;padding-left:10mm;text-align:center;padding-top:1mm;padding-bottom:0mm;">Nov.</div>
								<div class="styLNLeftNumBoxSD" style="float:left;width:9mm;padding-top:2.8mm;">7k</div>
								<div class="styLNCtrNumBox" style="width:30mm;border-top-width:1px;height:6mm;float:right;padding-top:1.5mm;text-align:right;padding-right:1mm;">
									<xsl:for-each select="$FormData/TaxLiabilityMonthlyDetailGrp[MonthCd = 'NOVEMBER']">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="TaxLiabilityAmt"/>
										</xsl:call-template>
									</xsl:for-each>
								</div>
								<!--7l-->
								<div class="styLNDesc" style="width:40mm;padding-left:10mm;text-align:center;padding-top:1mm;padding-bottom:0mm;">Dec.</div>
								<div class="styLNLeftNumBoxSD" style="float:left;width:9mm;padding-top:2.8mm;">7l</div>
								<div class="styLNCtrNumBox" style="width:30mm;border-top-width:1px;height:6mm;float:right;padding-top:1.5mm;text-align:right;padding-right:1mm;">
									<xsl:for-each select="$FormData/TaxLiabilityMonthlyDetailGrp[MonthCd = 'DECEMBER']">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="TaxLiabilityAmt"/>
										</xsl:call-template>
									</xsl:for-each>
								</div>	
							</div>
						</div>
					</div>
					<!--Total Liability for year-->
					<div style="width:187mm;font-size:8pt;padding-top:2mm;padding-bottom:2mm;">
						<span style="float:left;">
							<div class="styLNLeftNumBox" style="width:7mm;"/>
							<div class="styLNDesc" style="width:118mm;padding-left:1mm;font-weight:bold;padding-top:2.4mm;">
								Total liability for year. Add lines 7a through 7l. Total must equal line 9.<span style="width:16mm;"/>7m
							</div>
						</span>
						<div class="styLNCtrNumBox" style="width:43mm;border-top-width:1px;height:6mm;padding-top:1mm;text-align:right;padding-right:1mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TotalTaxLiabilityAmt"/>
							</xsl:call-template>
						</div>
					</div>
					</div>
					<!-- END LINE 7 -->
					<!--THIRD PARTY DESIGNEE-->
					<div class="styLNDesc" style="width:187mm;height:8mm;padding-top:2mm;font-size:10pt;border-top:1px solid black">
						<b>Third-party designee</b>
					</div>
					<div class="styLNDesc" style="width:187mm;height:auto;padding-left:2mm;padding-right:6mm;font-size:8pt;">
						<b>Do you want to allow an employee, a paid tax preparer, or another person to discuss this return with the IRS?</b><br/>
						See separate instructions for details.
					</div>
					<div style="width:187mm;float:none;clear:both;padding-bottom:2mm;font-size:8pt;">
						<div style="width:13mm;padding-top:.7mm;padding-left:2mm;float:left;">
							<span>
								<xsl:call-template name="PopulateSpan">
									<xsl:with-param name="TargetNode" select="$RtnHdrData/DiscussWithThirdPartyYesGrp/DiscussWithThirdPartyYesInd"/>
								</xsl:call-template>
								<input type="checkbox" aria-label="DiscussWithThirdPartyYes" class="styCkbox">
									<xsl:call-template name="PopulateYesCheckbox">
										<xsl:with-param name="TargetNode" select="$RtnHdrData/DiscussWithThirdPartyYesGrp/DiscussWithThirdPartyYesInd"/>
										<xsl:with-param name="BackupName">944DiscussWithThirdPartyYesInd</xsl:with-param>
									</xsl:call-template>
								</input>
							</span>
						<label>
							<xsl:call-template name="PopulateLabelYes">
								<xsl:with-param name="TargetNode" select="$RtnHdrData/DiscussWithThirdPartyYesGrp/DiscussWithThirdPartyYesInd"/>
								<xsl:with-param name="BackupName">944DiscussWithThirdPartyYesInd</xsl:with-param>
							</xsl:call-template>Yes.
						</label>
						<br/><br/><br/><br/>
						<span>
							<xsl:call-template name="PopulateSpan">
								<xsl:with-param name="TargetNode" select="$RtnHdrData/DiscussWithThirdPartyNoInd"/>
							</xsl:call-template>
							<input type="checkbox" aria-label="DiscussWithThirdPartyNo" class="styCkbox">
								<xsl:call-template name="PopulateNoCheckbox">
									<xsl:with-param name="TargetNode" select="$RtnHdrData/DiscussWithThirdPartyNoInd"/>
									<xsl:with-param name="BackupName">944DiscussWithThirdPartyNoInd</xsl:with-param>
								</xsl:call-template>
							</input>
						</span>
						<label>
							<xsl:call-template name="PopulateLabelNo">
								<xsl:with-param name="TargetNode" select="$RtnHdrData/DiscussWithThirdPartyNoInd"/>
								<xsl:with-param name="BackupName">944DiscussWithThirdPartyNoInd</xsl:with-param>
							</xsl:call-template>No.
						</label>
					</div>
						<div style="width:166mm;font-size:8pt;">
							<div style="width:166mm;height:6mm;">
								<div class="styLNDesc" style="width:50mm;height:6mm;float:left;padding-top:2mm;">Designee's name and phone number </div>
								<div class="styLNCtrNumBox" style="width:54mm;height:6mm;border-top-width:1px;float:left;padding-top:1mm;text-align:left;padding-left:1mm;">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$RtnHdrData/DiscussWithThirdPartyYesGrp/ThirdPartyDesigneeNm"/>
									</xsl:call-template>
								</div>
								<span class="styLNCtrNumBox" style="width:3mm;border:none"/>
								<div class="styLNCtrNumBox" style="width:42mm;border-top-width:1px;height:6mm;padding-top:1mm;word-wrap:break-word;">
									<xsl:if test="$RtnHdrData/DiscussWithThirdPartyYesGrp/ThirdPartyDesigneePhoneNum">
										<xsl:call-template name="PopulatePhoneNumber">
											<xsl:with-param name="TargetNode" select="$RtnHdrData/DiscussWithThirdPartyYesGrp/ThirdPartyDesigneePhoneNum"/>
										</xsl:call-template>
									</xsl:if>
									<xsl:if test="$RtnHdrData/DiscussWithThirdPartyYesGrp/ThirdPartyDesigneeFrgnPhoneNum">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$RtnHdrData/DiscussWithThirdPartyYesGrp/ThirdPartyDesigneeFrgnPhoneNum"/>
										</xsl:call-template>
									</xsl:if>
								</div>
							</div>
							<div style="width:166mm;padding-top:2mm;">
								<div class="styLNDesc" style="width:107mm;padding-top:2mm;">
									Select a 5-digit personal identification number (PIN) to use when talking to IRS.
								</div>
								<div style="float:left;">
									<div class="styLNCtrNumBox" style="width:42mm;border-top-width:1px;height:5mm;float:left;">
										<xsl:call-template name="PopulatePin">
											<xsl:with-param name="TargetNode" select="$RtnHdrData/DiscussWithThirdPartyYesGrp/ThirdPartyDesigneePIN"/>
										</xsl:call-template>
									</div>
								</div>
							</div>
						</div>
					</div>
					<!--Sign your name section-->
					<div class="styLNDesc" style="width:187mm;height:10mm;padding-left:2mm;padding-right:2mm;font-size:7pt;padding-top:2mm;border-top:1px solid black;">
						Under penalties of perjury, I declare that I have examined this return, including accompanying schedules and 
						statements, and to the best of my knowledge and belief, it is true, correct, and complete. Declaration of preparer (other 
						than taxpayer) is based on all information of which preparer has any knowledge.
					</div>
					<div style="width:187mm;float:none;clear:both;">
						<div style="width:23mm;padding-top:2mm;padding-left:2mm;font-weight:bold;font-size:10pt;float:left;text-align:left;">Sign your <br/>name here </div>
						<div class="styLNCtrNumBox" style="width:75mm;height:14mm;border-top-width:1px;float:left;word-wrap:break-word;padding-top:1mm;text-align:left;padding-left:1mm;padding-right:1mm;">
							<xsl:if test="$RtnHdrData/ReportingAgentPINGrp/PIN">
								<xsl:call-template name="PopulatePin">
									<xsl:with-param name="TargetNode" select="$RtnHdrData/ReportingAgentPINGrp/PIN"/>
								</xsl:call-template>
							</xsl:if>
							<xsl:if test="$RtnHdrData/PractitionerPINGrp/TaxpayerPIN">
								<xsl:call-template name="PopulatePin">
									<xsl:with-param name="TargetNode" select="$RtnHdrData/PractitionerPINGrp/TaxpayerPIN"/>
								</xsl:call-template>
							</xsl:if>
						</div>
						<div style="width:86mm;float:left;font-size:8pt;padding-left:10mm;padding-top:0mm;">
							<div style="width:15mm;height:8mm;float:left;padding-top:0mm;">Print your name here</div>
							<div style="height:9mm;float:right;">
								<div class="styLNCtrNumBox" style="width:60mm;border-top-width:1px;height:8mm;float:right;text-align:left;padding-left:1mm;">
									<xsl:if test="$RtnHdrData/SignatureDocumentGrp/PersonNm">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$RtnHdrData/SignatureDocumentGrp/PersonNm"/>
										</xsl:call-template>
									</xsl:if>
									<xsl:if test="$RtnHdrData/PractitionerPINGrp/TaxpayerNm">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$RtnHdrData/PractitionerPINGrp/TaxpayerNm"/>
										</xsl:call-template>
									</xsl:if>
								</div>
							</div>
							<div style="width:15mm;float:left;padding-top:0mm;">Print your title here</div>
							<div style="float:right;">
								<div class="styLNCtrNumBox" style="width:60mm;border-top-width:1px;height:8mm;padding-top:1mm;float:right;text-align:left;padding-left:1mm;">
									<xsl:if test="$RtnHdrData/SignatureDocumentGrp/PartnershipAuthorizationCd">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$RtnHdrData/SignatureDocumentGrp/PartnershipAuthorizationCd"/>
										</xsl:call-template>
									</xsl:if>
									<xsl:if test="$RtnHdrData/SignatureDocumentGrp/CorporationAuthorizationCd">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$RtnHdrData/SignatureDocumentGrp/CorporationAuthorizationCd"/>
										</xsl:call-template>
									</xsl:if>
									<xsl:if test="$RtnHdrData/SignatureDocumentGrp/ExemptOrgAuthorizationCd">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$RtnHdrData/SignatureDocumentGrp/ExemptOrgAuthorizationCd"/>
										</xsl:call-template>
									</xsl:if>
									<xsl:if test="$RtnHdrData/SignatureDocumentGrp/EstateAuthorizationCd">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$RtnHdrData/SignatureDocumentGrp/EstateAuthorizationCd"/>
										</xsl:call-template>
									</xsl:if>
									<xsl:if test="$RtnHdrData/SignatureDocumentGrp/IndividualAuthorizationCd">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$RtnHdrData/SignatureDocumentGrp/IndividualAuthorizationCd"/>
										</xsl:call-template>
									</xsl:if>
									<xsl:if test="$RtnHdrData/PractitionerPINGrp/Title">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$RtnHdrData/PractitionerPINGrp/Title"/>
										</xsl:call-template>
									</xsl:if>
								</div>
							</div>
						</div>
					</div>
					<div class="styBB" style="width:187mm;padding-bottom:2mm;padding-top:1mm;padding-right:3mm;float:none;clear:both;">
						<div class="styLNDesc" style="width:23mm;text-align:right;padding-right:2mm;font-size:8pt;padding-top:2mm;">Date </div>
						<div class="styLNCtrNumBox" style="width:30mm;border-top-width:1px;height:6mm;padding-top:1mm;">
							<xsl:if test="$RtnHdrData/SignatureDocumentGrp/SignatureDt">
								<xsl:call-template name="PopulateMonthDayYear">
									<xsl:with-param name="TargetNode" select="$RtnHdrData/SignatureDocumentGrp/SignatureDt"/>
								</xsl:call-template>
							</xsl:if>
							<xsl:if test="$RtnHdrData/PractitionerPINGrp/TaxpayerSignatureDt">
								<xsl:call-template name="PopulateMonthDayYear">
									<xsl:with-param name="TargetNode" select="$RtnHdrData/PractitionerPINGrp/TaxpayerSignatureDt"/>
								</xsl:call-template>
							</xsl:if>
						</div>
						<div class="styLNDesc" style="width:80mm;font-size:8pt;padding-top:2mm;text-align:right;">Best daytime phone </div>
						<div class="styLNCtrNumBox" style="width:48mm;border-top-width:1px;height:7mm;padding-top:1mm;float:right;word-wrap:break-word;">
							<xsl:if test="$RtnHdrData/SignatureDocumentGrp/DaytimePhoneNum">
								<xsl:call-template name="PopulatePhoneNumber">
									<xsl:with-param name="TargetNode" select="$RtnHdrData/SignatureDocumentGrp/DaytimePhoneNum"/>
								</xsl:call-template>
							</xsl:if>
							<xsl:if test="$RtnHdrData/SignatureDocumentGrp/DaytimeForeignPhoneNum">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$RtnHdrData/SignatureDocumentGrp/DaytimeForeignPhoneNum"/>
								</xsl:call-template>
							</xsl:if>
						</div>
					</div>
					<!--Paid Preparer Section-->
					<div style="width:187mm;padding-bottom:4mm;">
						<div class="styLNDesc" style="width:46mm;font-size:9pt;font-weight:bold;float:left;padding-left:2mm;">Paid Preparer Use Only </div>
						<div class="styLNDesc" style="width:52mm;float:right;font-size:9pt;">Check if you're self-employed
							<span style="width:2px;"/><span>
							<xsl:call-template name="PopulateSpan">
								<xsl:with-param name="TargetNode" select="$RtnHdrData/PaidPreparerInformationGrp/SelfEmployedInd"/>
							</xsl:call-template>
							<input type="checkbox" aria-label="SelfEmployed" class="styCkbox">
					<xsl:call-template name="PopulateCheckbox">
						<xsl:with-param name="TargetNode" select="$RtnHdrData/PaidPreparerInformationGrp/SelfEmployedInd"/>
						<xsl:with-param name="BackupName">944SelfEmployedInd</xsl:with-param>
					</xsl:call-template>
				</input>
				</span>
				<label>
					<xsl:call-template name="PopulateLabel">
						<xsl:with-param name="TargetNode" select="$RtnHdrData/PaidPreparerInformationGrp/SelfEmployedInd"/>
						<xsl:with-param name="BackupName">944SelfEmployedInd</xsl:with-param>
					</xsl:call-template>
							</label>
						</div>
					</div>
					<!--Preparer Name and PTIN-->
					<div style="width:187mm;padding-bottom:2mm;padding-right:3mm;font-size:8pt;">
						<div class="styLNDesc" style="width:32mm;height:6mm;padding-left:2mm;padding-right:1mm;padding-top:1mm;">Preparer's name </div>
						<div class="styLNCtrNumBox" style="width:90mm;border-top-width:1px;height:6mm;padding-top:1mm;text-align:left;padding-left:1mm;">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$RtnHdrData/PaidPreparerInformationGrp/PreparerPersonNm"/>
							</xsl:call-template>
						</div>
						<div class="styLNDesc" style="width:20mm;height:6mm;padding-top:1mm;padding-left:8mm;">PTIN </div>
						<div class="styLNCtrNumBox" style="width:41mm;border-top-width:1px;height:6mm;padding-top:1mm;float:right;">
							<xsl:choose>
								<xsl:when test="$RtnHdrData/PaidPreparerInformationGrp/PTIN">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$RtnHdrData/PaidPreparerInformationGrp/PTIN"/>
									</xsl:call-template>
								</xsl:when>
								<xsl:otherwise>
									<xsl:call-template name="PopulateSSN">
										<xsl:with-param name="TargetNode" select="$RtnHdrData/PaidPreparerInformationGrp/PreparerSSN"/>
									</xsl:call-template>
								</xsl:otherwise>
							</xsl:choose>
						</div>
					</div>
					<!--Preparer Signature and Date-->
					<div style="width:187mm;padding-bottom:2mm;font-size:8pt;">
						<div class="styLNDesc" style="width:32mm;height:6mm;padding-top:1mm;padding-left:2mm;padding-right:1mm;">Preparer's signature </div>
						<div class="styLNCtrNumBox" style="width:90mm;border-top-width:1px;height:6mm;word-wrap:break-word;padding-top:1mm;text-align:left;padding-right:1mm;padding-left:1mm;">
						</div>
						<div class="styLNDesc" style="width:21.1mm;height:6mm;padding-top:1mm;padding-left:8mm;">Date </div>
						<div class="styLNCtrNumBox" style="width:25mm;border-top-width:1px;height:6mm;padding-top:1mm;">
							<xsl:call-template name="PopulateMonthDayYear">
								<xsl:with-param name="TargetNode" select="$RtnHdrData/PaidPreparerInformationGrp/SignatureDt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- 5/13/2015 AM: Adjusted Firm name height from 8mm to 14mm per Defect 43014 --> 
					<!--Preparer Business Name and EIN-->
					<div style="width:187mm;font-size:8pt;padding-bottom:2mm;padding-right:3mm;">
						<div class="styLNDesc" style="width:32mm;padding-left:2mm;padding-right:1mm;padding-top:0mm;">Firm's name (or yours if self-employed) </div>
						<div class="styLNCtrNumBox" style="width:90mm;height:14mm;border-top-width:1px;text-align:left;padding-left:1mm;">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$RtnHdrData/PaidPreparerInformationGrp/PreparerFirmName/BusinessNameLine1Txt"/>
							</xsl:call-template><br/>
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$RtnHdrData/PaidPreparerInformationGrp/PreparerFirmName/BusinessNameLine2Txt"/>
							</xsl:call-template>
						</div>
						<div class="styLNDesc" style="width:20mm;height:6mm;padding-top:1mm;padding-left:8mm;">EIN </div>
						<div class="styLNCtrNumBox" style="width:41mm;height:6mm;border-top-width:1px;padding-top:1mm;float:right;">
							<xsl:if test="$RtnHdrData/PaidPreparerInformationGrp/PreparerFirmEIN">
								<xsl:call-template name="PopulateEIN">
									<xsl:with-param name="TargetNode" select="$RtnHdrData/PaidPreparerInformationGrp/PreparerFirmEIN"/>
								</xsl:call-template>
							</xsl:if>
							<xsl:if test="$RtnHdrData/PaidPreparerInformationGrp/MissingEINReasonCd">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$RtnHdrData/PaidPreparerInformationGrp/MissingEINReasonCd"/>
								</xsl:call-template>
							</xsl:if>
						</div>
					</div>
					<!--Preparer Address and Phone Number-->
					<div style="width:187mm;padding-bottom:2mm;padding-right:3mm;font-size:8pt;">
						<div class="styLNDesc" style="width:32mm;height:6mm;padding-top:2mm;padding-left:2mm;padding-right:1mm;">Address </div>
						<div class="styLNCtrNumBox" style="width:90mm;height:auto;border-top-width:1px;text-align:left;padding-left:1mm;">
							<xsl:if test="$RtnHdrData/PaidPreparerInformationGrp/PreparerUSAddress">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$RtnHdrData/PaidPreparerInformationGrp/PreparerUSAddress/AddressLine1Txt"/>
								</xsl:call-template><br/>
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$RtnHdrData/PaidPreparerInformationGrp/PreparerUSAddress/AddressLine2Txt"/>
								</xsl:call-template>
							</xsl:if>
							<xsl:if test="$RtnHdrData/PaidPreparerInformationGrp/PreparerForeignAddress">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$RtnHdrData/PaidPreparerInformationGrp/PreparerForeignAddress/AddressLine1Txt"/>
								</xsl:call-template><br/>
							</xsl:if>
							<xsl:if test="$RtnHdrData/PaidPreparerInformationGrp/PreparerForeignAddress">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$RtnHdrData/PaidPreparerInformationGrp/PreparerForeignAddress/AddressLine2Txt"/>
								</xsl:call-template>
							</xsl:if>
						</div>
						<div class="styLNDesc" style="width:20mm;height:6mm;padding-top:2mm;padding-left:8mm;">Phone </div>
						<div class="styLNCtrNumBox" style="width:41mm;height:8mm;border-top-width:1px;padding-top:1mm;float:right;word-wrap:break-word;">
							<xsl:if test="$RtnHdrData/PaidPreparerInformationGrp/PhoneNum">
								<xsl:call-template name="PopulatePhoneNumber">
									<xsl:with-param name="TargetNode" select="$RtnHdrData/PaidPreparerInformationGrp/PhoneNum"/>
								</xsl:call-template>
							</xsl:if>
							<xsl:if test="$RtnHdrData/PaidPreparerInformationGrp/ForeignPhoneNum">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$RtnHdrData/PaidPreparerInformationGrp/ForeignPhoneNum"/>
								</xsl:call-template>
							</xsl:if>
						</div>
					</div>
					<!--Preparer Foreign Address/Phone Number vs. US Address/Phone Number-->
					<div class="styBB" style="width:187mm;padding-bottom:4mm;border-bottom-width:2px;font-size:8pt;padding-right:3mm;">
						<xsl:choose>
							<xsl:when test="$RtnHdrData/PaidPreparerInformationGrp/PreparerForeignAddress">
								<div class="styLNDesc" style="width:32mm;height:6mm;padding-top:2mm;padding-left:2mm;padding-right:1mm;">City </div>
								<div class="styLNCtrNumBox" style="width:40mm;border-top-width:1px;height:auto;padding-top:1mm;text-align:left;padding-left:1mm;word-wrap:break-word;">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$RtnHdrData/PaidPreparerInformationGrp/PreparerForeignAddress/CityNm"/>
									</xsl:call-template>
								</div>
								<div class="styLNDesc" style="width:12mm;height:6mm;padding-top:2mm;text-align:center;">Prov./St. </div>
								<div class="styLNCtrNumBox" style="width:16mm;border-top-width:1px;height:8mm;padding-top:1mm;word-wrap:break-word;">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$RtnHdrData/PaidPreparerInformationGrp/PreparerForeignAddress/ProvinceOrStateNm"/>
									</xsl:call-template>
								</div>
								<div class="styLNDesc" style="width:12mm;height:6mm;padding-top:2mm;text-align:center;">Country </div>
								<div class="styLNCtrNumBox" style="width:10mm;border-top-width:1px;height:8mm;padding-top:2mm;word-wrap:break-word;">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$RtnHdrData/PaidPreparerInformationGrp/PreparerForeignAddress/CountryCd"/>
									</xsl:call-template>
								</div>
								<div class="styLNDesc" style="width:20mm;height:6mm;padding-top:2mm;padding-left:8mm;">P. Code </div>
								<div class="styLNCtrNumBox" style="width:41mm;border-top-width:1px;height:8mm;padding-top:1mm;float:right;word-wrap:break-word;">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$RtnHdrData/PaidPreparerInformationGrp/PreparerForeignAddress/ForeignPostalCd"/>
									</xsl:call-template>
								</div>
							</xsl:when>
							<xsl:otherwise>
								<div class="styLNDesc" style="width:32mm;height:6mm;padding-top:2mm;padding-left:2mm;padding-right:1mm;">City </div>
								<div class="styLNCtrNumBox" style="width:65mm;border-top-width:1px;height:auto;padding-top:1mm;text-align:left;padding-left:1mm;">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$RtnHdrData/PaidPreparerInformationGrp/PreparerUSAddress/CityNm"/>
									</xsl:call-template>						
								</div>
								<div class="styLNDesc" style="width:15mm;height:6mm;padding-top:2mm;padding-left:5mm;">State </div>
								<div class="styLNCtrNumBox" style="width:10mm;border-top-width:1px;height:8mm;padding-top:1mm;">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$RtnHdrData/PaidPreparerInformationGrp/PreparerUSAddress/StateAbbreviationCd"/>
									</xsl:call-template>
								</div>
								<div class="styLNDesc" style="width:20mm;height:6mm;padding-top:2mm;padding-left:8mm;">ZIP code </div>
								<div class="styLNCtrNumBox" style="width:41mm;border-top-width:1px;height:8mm;padding-top:1mm;float:right;">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$RtnHdrData/PaidPreparerInformationGrp/PreparerUSAddress/ZIPCd"/>
									</xsl:call-template>				
								</div>
							</xsl:otherwise>
						</xsl:choose>
					</div>					
					<!-- Page Break and Footer-->
					<div class="pageEnd" style="width:187mm;padding-top:1mm;">
						<div style="width:125mm;float:left;">
							Page <span class="styBoldText" style="font-size:8pt;">2</span>
						</div>
						<div style="float:right;">
							<span style="width:50px;"/>Form 
							<span class="styBoldText" style="font-size:8pt;">945 </span> (2025)
						</div>
					</div>
					<p style="page-break-before: always"/>
					<!-- END Page Break and Footer-->
					<!-- Additonal Data Title Bar and Button -->
					<div class="styLeftOverTitleLine" id="LeftoverData" style="padding-top:5mm;">
						<div class="styLeftOverTitle">Additional Data </div>
						<div class="styLeftOverButtonContainer">
							<input class="styLeftoverTableBtn" type="button" TabIndex="-1" value="Return to Form" onclick="javascript:returnToWriteInImage();"/>
						</div>
					</div>
					<!-- Additional Data Table -->
					<xsl:variable name="TableWidth">100</xsl:variable>
					<table class="styLeftOverTbl">
						<xsl:call-template name="PopulateCommonLeftover">
							<xsl:with-param name="TargetNode" select="$FormData"/>
							<xsl:with-param name="DescWidth" select="$TableWidth"/>
						</xsl:call-template>
					</table>
				</form>
			</body>
		</html>
	</xsl:template>
</xsl:stylesheet>
