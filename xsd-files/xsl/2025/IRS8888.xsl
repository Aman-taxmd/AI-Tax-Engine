<?xml version="1.0" encoding="UTF-8"?>
<!-- Last Modified by Emanesse Fleurancy on 10/03/2025 -->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:include href="CommonPathRef.xsl"/>
	<xsl:include href="PopulateTemplate.xsl"/>
	<xsl:include href="IRS8888Template.xsl"/>  
	<xsl:include href="AddHeader.xsl"/>
	<xsl:include href="AddOnTable.xsl"/>
	<xsl:include href="IRS8888Style.xsl"/>
	<xsl:output method="html" indent="yes"/>
	<xsl:strip-space elements="*"/>
	<xsl:param name="Form8888Data" select="$RtnDoc/IRS8888"/>
	<xsl:template match="/">
		<xsl:text disable-output-escaping="yes">&lt;!DOCTYPE html&gt;</xsl:text>
		<html>
			<head>
				<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
				<META http-equiv="Content-Type" content="text/html"/>
				<title>
					<xsl:call-template name="FormTitle">
						<xsl:with-param name="RootElement" select="local-name($Form8888Data)"/>
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
				<meta name="Description" content="IRS Form 8888"/>
				<script language="JavaScript" src="{$ScriptPath}/FormDisplay.js" type="text/javascript"/>
				<xsl:call-template name="InitJS"/>
				<style type="text/css">
					<xsl:if test="not($Print) or $Print=''">
						<xsl:call-template name="IRS8888Style"/>
						<xsl:call-template name="AddOnStyle"/>
					</xsl:if>
				</style>
				<xsl:call-template name="GlobalStylesForm"/>
			</head>
			<body class="styBodyClass">
				<form name="Form8888">
					<xsl:call-template name="DocumentHeader"/>
					<div class="styBB" style="width:187mm;padding-bottom:0mm;">
						<div class="styFNBox" style="width:31mm;height:21mm;padding-bottom:0mm;">
							<div style="padding-top:3mm;padding-bottom:0mm;font-size:8pt;">
            Form <span class="styFormNumber">  8888</span>
							</div>
							<div class="styAgency" style="font-size:7.5pt;padding-bottom:0mm;">(Rev. December 2025)<br/>Department of the Treasury<br/>
            Internal Revenue Service
							</div>
						</div>
						<div class="styFTBox" style="width:120mm;height:14mm;padding-bottom:0mm;">
							<div class="styMainTitle" style="font-size:12pt;height:10mm;padding-top:3mm;padding-bottom:1.5mm;width:inherit;">Allocation of Refund</div>
							<div class="styFBT" style="font-size:9pt;height:5mm;margin-top:1mm;padding-bottom:1.5mm;">
								<b>Attach to Form 1040, 1040-SR, 1040-SS, or 1040-NR.</b>
							</div>
							<div class="styFBT" style="height:1mm;margin-top:1mm;padding-bottom:1.5mm;font-size:6.5pt;">
								<!--<br/><br/>-->
								Go to <i>www.irs.gov/Form8888</i> for the latest information.
							</div>
						</div>
						<div class="styTYBox" style="width:32mm;height:21mm;text-align:left;">
							<div class="styOMB" style="width:35.5mm;height:5mm;font-size:7pt;padding-left:4.5mm;padding-top:1mm;padding-bottom:0mm;">
							OMB No. 1545-0074</div>
							<div style="width:32mm;height:2mm;margin-left:3mm; text-align:left;font-size:7.5pt;padding-top:0mm;border:">
							  For calendar year 
							  <xsl:value-of select="$RtnHdrData/TaxYr"/>
							  <br/><br/>
							  Attachment<br/> Sequence No.  <b>  56</b>
							</div>
						</div>
					</div>
					<!-- BEGIN Occupation TITLE.. -->
					<div class="styBB" style="width:187mm;">
						<div class="styNameBox" style="width:135mm;font-size:7.5pt;font-weight:normal;height:9mm;">
          Name(s) shown on return <br/>
                                 			  <xsl:choose>
                                  
                                                                                     <!-- Name from 1040 Return Header-->
                                          <xsl:when test="$RtnHdrData/Filer/NameLine1Txt">
                                                   <xsl:call-template name="PopulateReturnHeaderFiler">
                                                 <xsl:with-param name="TargetNode">NameLine1Txt</xsl:with-param>
                                                 </xsl:call-template>
                                          </xsl:when>
                                                                                     <!-- Name from 1041 Return Header-->
                                          <xsl:when test="$RtnHdrData/Filer/BusinessNameLine1Txt">
                                                      <xsl:call-template name="PopulateReturnHeaderFiler">
                                                      <xsl:with-param name="TargetNode">BusinessNameLine1Txt</xsl:with-param>
                                                      </xsl:call-template>
                                               <br/>
                                                      <xsl:call-template name="PopulateReturnHeaderFiler">
                                                      <xsl:with-param name="TargetNode">BusinessNameLine2Txt</xsl:with-param>
                                                      </xsl:call-template>                                                                                                       
                                          </xsl:when>
                                          <xsl:otherwise> 
                                                  <xsl:call-template name="PopulateReturnHeaderFiler"> 
                                                  <xsl:with-param name="TargetNode">BusinessNameLine1Txt</xsl:with-param> 
                                                  </xsl:call-template>
                                             <br/>
                                                   <xsl:call-template name="PopulateReturnHeaderFiler">
                                                   <xsl:with-param name="TargetNode">BusinessNameLine2Txt</xsl:with-param>
                                                   </xsl:call-template>
                                            </xsl:otherwise>                                                                                                
                                       </xsl:choose>
							
							
						</div>
						<div class="styIRS8888SSNBox" style="width:45mm;font-size:7pt;font-weight:normal;padding-top:0mm;padding-bottom:0mm;height:8mm;">
							<b>Your social security number</b>
							<br/>
							<div style="padding-top:2mm;padding-bottom:0mm;text-align:left">
								 <xsl:choose>
                                                               
                                                                        <xsl:when test="$RtnHdrData/Filer/PrimarySSN"> 
                                                                            <xsl:call-template name="PopulateReturnHeaderFiler">
                                                                            <xsl:with-param name="TargetNode">PrimarySSN</xsl:with-param>
                                                                            </xsl:call-template>
                                                                        </xsl:when>
                                                                        <xsl:when test="$RtnHdrData/Filer/EIN"> 
                                                                               <xsl:call-template name="PopulateReturnHeaderFiler"> 
                                                                               <xsl:with-param name="TargetNode">EIN</xsl:with-param>
                                                                               </xsl:call-template>
                                                                         </xsl:when>
                                                                </xsl:choose>
							</div>
						</div>
					</div>
					<!-- Line 1-->
					<div style="width:187mm;font-family:Arial;font-size:9.5pt" class="styBB">
						<div class="styPartDesc" style="font-weight:normal;font-size:9.5pt;">
							<b>Direct  Deposit</b>
						</div>
					</div>
					<div style="width:187mm;height:66mm;clear:all;">
						<xsl:variable name="pos" select="position()"/>
						<xsl:if test="(position() mod 3)=1">
							<div class="styIRS8888TableContainer" id="Spcctn">
								<xsl:call-template name="SetInitialState"/>
								<!-- Beginning of 1a -->
								<div style="width:187mm;font-size:8.5pt;font-family:Arial;height:5mm;">
									<span style="float:left;">
									<div class="styLNLeftNumBox" style="width:8mm;padding-left:1.7mm;height:113mm">
										<xsl:number value="($pos)" format="1"/>a</div>
									<div class="styLNDesc" style="width:140.3mm;height:3mm">Amount to be deposited in first account (see instructions)
										<span class="styDotLn" style="float:none;padding-left:2mm;padding-right:.5mm;">...............</span>
									</div>
									</span>
									<span style="float:right;">
									<div class="styLNLeftNumBox" style="height:4.9mm;width:7mm;text-align:center;border-style:solid;border-right-width:1px;border-left-width:1px;border-top-width:0px;
									border-bottom-width:1px;border-color:black;padding-bottom:.5mm;padding-top:.5mm;">
										<xsl:number value="($pos)" format="1"/>a</div>
									<div class="styLNAmountBox" style="font-size:7.5pt;border-bottom-width:1px;border-left-width:0px;border-right-width:0px;width:31mm;clear:right;height:4.9mm;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$Form8888Data/DirectDepositInfoGroup[$pos]/DirectDepositRefundAmt"/>
										</xsl:call-template>
									</div>
									</span>
								</div>
								<div style="width:187mm;font-size:8.5pt;height:3mm;font-family:Arial;padding-top:0px;">
									<span style="float:left;">
									<div class="styLNLeftNumBox" style="width:8mm;padding-left:1.7mm;height:11.7mm"/>
										<div class="styLNDesc" style="width:140.3mm;height:3mm">
										</div>
									</span>
									<span  style="float:right;">
										<div class="styLNLeftNumBox" style="height:4.7mm;width:7mm;border-style:solid;border-width:0px 1px 0px 1px;border-color:black;padding:0px 0px 0px 0px;background-color:#B8B8B8"/>
										<div class="styLNAmountBox" style="font-size:7.5pt;border-width:0px 0px 0px 0px;width:31mm;clear:right;height:4.7mm;"/>
									</span>
								</div>
								<!-- End of Step 1a -->
								<!-- Beginning of b -->
								<div style="width:187mm;font-size:8.5pt;height:8mm;font-family:Arial;padding-top:0px;">
									<span style="float:left;">
									<div class="styLNLeftNumBox" style="padding-right:3mm;text-align:right;padding-top:.5mm;height:8mm;">b</div>
									<div class="styLNDesc" style="width:140.3mm;padding-top:0mm;padding-bottom:0mm;height:8mm;">
										<div class="styLNDesc" style="width:28mm;">Routing number</div>
										<!-- call routing number -->
										<span class="styLNCtrNumBox" style="width:34mm;border-top-width:1px;padding-top:0mm;padding-bottom:0mm;font-weight:normal;">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="$Form8888Data/DirectDepositInfoGroup[$pos]/RoutingTransitNum"/>
												<xsl:with-param name="BackupName">IRS1040RoutingTransitNumber1</xsl:with-param>
											</xsl:call-template>
										</span>
										<span style="width:4mm;padding-top:.5mm;padding-bottom:.5mm;float:left;clear:none;"/>
										<span style="width:.3mm;"/>
										<span class="styBoldText" style="font-size:8pt;padding-bottom:3mm;">c</span>
										<span style="width:3.5mm;"/>
										<span>
											<xsl:call-template name="PopulateSpan">
												<xsl:with-param name="TargetNode" select="$Form8888Data/DirectDepositInfoGroup[$pos]/BankAccountTypeCd"/>
											</xsl:call-template>
										<input type="checkbox" class="styCkbox" style="height:4mm;width:4mm;" alt="1c Checking">
											<xsl:call-template name="PopulateNoCheckbox">
												<xsl:with-param name="TargetNode" select="$Form8888Data/DirectDepositInfoGroup[$pos]/BankAccountTypeCd"/>
												<xsl:with-param name="BackupName">IRS8888AccountTypeCd</xsl:with-param>
												<xsl:with-param name="Checkbox1or2Type">yes</xsl:with-param>
											</xsl:call-template>
										</input>
										<span style="width:1mm;"/>
										<label>
											<xsl:call-template name="PopulateSpan">
												<xsl:with-param name="TargetNode" select="$Form8888Data/DirectDepositInfoGroup[$pos]/BankAccountTypeCd"/>
											</xsl:call-template>
											<xsl:call-template name="PopulateLabelNo">
												<xsl:with-param name="TargetNode" select="$Form8888Data/DirectDepositInfoGroup[$pos]/BankAccountTypeCd"/>
												<xsl:with-param name="BackupName">IRS8888AccountTypeCd</xsl:with-param>
											</xsl:call-template>
											<span style="font-size:8pt;padding-bottom:0mm;padding-top:2mm;font-family:Arial">Checking</span>
										</label>
										</span>
										<span style="width:4mm;"/>
										<span>
											<xsl:call-template name="PopulateSpan">
												<xsl:with-param name="TargetNode" select="$Form8888Data/DirectDepositInfoGroup[$pos]/BankAccountTypeCd"/>
											</xsl:call-template>
										<input type="checkbox" class="styCkbox" style="height:4mm;width:4mm;" alt="1c Savings">
											<xsl:call-template name="PopulateYesCheckbox">
												<xsl:with-param name="TargetNode" select="$Form8888Data/DirectDepositInfoGroup[$pos]/BankAccountTypeCd"/>
												<xsl:with-param name="BackupName">IRS8888AccountTypeCd</xsl:with-param>
												<xsl:with-param name="Checkbox1or2Type">yes</xsl:with-param>
											</xsl:call-template>
										</input>
										<span style="width:1mm;"/>
										<label>
											<xsl:call-template name="PopulateSpan">
												<xsl:with-param name="TargetNode" select="$Form8888Data/DirectDepositInfoGroup[$pos]/BankAccountTypeCd"/>
											</xsl:call-template>
											<xsl:call-template name="PopulateLabelYes">
												<xsl:with-param name="TargetNode" select="$Form8888Data/DirectDepositInfoGroup[$pos]/BankAccountTypeCd"/>
												<xsl:with-param name="BackupName">IRS8888AccountTypeCd</xsl:with-param>
											</xsl:call-template>
											<span style="font-size:8pt;padding-bottom:0mm;padding-top:2mm;font-family:Arial">Savings</span>
										</label>
										</span>
									</div>
									</span>
									<span style="float:right;">
									<div class="styShadingCellRB" style="width:7mm;text-align:center;border-style:solid;border-right-width:1px;border-left-width:1px;height:8mm;border-top-width:0px;border-bottom-width:0px;background-color:#B8B8B8;float:left;clear:right;"/>
									<div class="styLNAmountBox" style="width:31mm;padding-top:0mm;border-style:solid;border-right-width:0px;border-left-width:0px;border-top-width:0px;padding-top:0px;border-bottom-width:0px;height:8mm;float:left;"/>
									</span>
								</div>
								<!-- End of 1b -->
								<!-- Line 1d -->
								<div style="width:187mm;font-size:8.5pt;height:8mm;font-family:Arial;">
									<span style="float:left;">
									<div class="styLNLeftNumBox" style="padding-right:3mm;font-size:8.5pt;text-align:right;padding-top:1mm;font-family:Arial;height:8mm;">d</div>
									<div class="styLNDesc" style="height:8mm;width:28mm;padding-top:1mm;">Account number</div>
									<span class="styLNCtrNumBox" style="width:84mm;border-top-width:1px;padding-top:0mm;padding-bottom:0mm;font-weight:normal;">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$Form8888Data/DirectDepositInfoGroup[$pos]/DepositorAccountNum"/>
											<xsl:with-param name="BackupName">IRS1040DepositorAccountNumber</xsl:with-param>
										</xsl:call-template>
									</span>
									<span style="width:28.3mm;float:left;"/>
									</span>
									<span style="float:right;">
									<div class="styShadingCellRB" style="width:7mm;height:8mm;text-align:center;background-color:#B8B8B8;"/>
									<div class="styLNAmountBox" style="width:31mm;padding-top:0mm;border-style:solid;border-right-width:0px;border-left-width:0px;border-top-width:0px;border-bottom-width:0px;height:8mm;float:left;"/>
									</span>
								</div>
								<!-- END of Item 1 -->							
								<!-- Beginning of Item 2 -->								
								<div class="BB" style="width:187mm;font-size:8.5pt;height:4mm;font-family:Arial;">
									<span style="float:left;">
									<div class="styLNLeftNumBox" style="padding-top:1mm;padding-right:3mm;padding-left:1.7mm;height:4mm;padding-bottom:0mm;">
										<xsl:number value="($pos + 1)" format="1"/>a</div>
									<div class="styLNDesc" style="width:140.4mm;padding-top:1mm;height:4mm;padding-bottom:0mm;">Amount to be deposited in second account
         <!--Dotted Line-->
										<span class="styDotLn" style="float:none;padding-left:2.1mm;padding-right:.5mm;clear:none;">....................</span>
									</div>
									</span>
									<span style="float:right;">
									<div class="styLNLeftNumBox" style="height:4mm;width:7mm;padding-top:0.5mm;text-align:center;border-style:solid; border-right-width:1px; border-left-width:1px;border-top-width:0px;border-bottom-width:1px;border-color:black;">
										<xsl:number value="($pos + 1)" format="1"/>a</div>
									<div class="styLNAmountBox" style="height:4mm;font-size:7.5pt;border-left:0px;border-right-width:0px;padding-top:0.9mm;padding-bottom:.5mm;width:31mm;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$Form8888Data/DirectDepositInfoGroup[$pos + 1]/DirectDepositRefundAmt"/>
										</xsl:call-template>
									</div>
									</span>
									<!-- blank line space -->
									<span style="float:left;">
									<div class="styLNDesc" style="height:2mm; width:148.2mm;float:left; clear:none;font-size:7pt;"/>
									</span>
									<span style="float:right;">
									<div class="styShadingCellRB" style="height:17mm; width:7mm; border-style:solid; border-right-width:1px; border-left-width:1px; border-top-width:0px; border-bottom-width:0px; border-color:black; background-color:#B8B8B8; float:left; clear:none;"/>
									<div class="styLNAmountBox" style="height:2mm;font-size:7pt;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;width:31mm;float:left;"/>
									</span>
								</div>
								<div style="width:187mm;font-size:8.5pt;height:9mm;font-family:Arial;padding-top:2mm">
									<span style="float:left;">
									<div class="styLNLeftNumBox" style="padding-top:1mm;padding-right:3mm;text-align:right;">b</div>
									<div class="styLNDesc" style="width:139.5mm;padding-top:0mm;padding-bottom:0mm;">
										<div class="styLNDesc" style="width:28mm;padding-top:1mm;">Routing number</div>
										<!-- call routing number -->
										<span class="styLNCtrNumBox" style="width:34mm;border-top-width:1px;padding-top:0mm;padding-bottom:0mm;font-weight:normal;">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="$Form8888Data/DirectDepositInfoGroup[$pos + 1]/RoutingTransitNum"/>
												<xsl:with-param name="BackupName">IRS1040RoutingTransitNumber1</xsl:with-param>
											</xsl:call-template>
										</span>
										<span style="width:4mm;padding-top:.5mm;padding-bottom:.5mm;float:left; clear: none;"/>
										<span style="width:.3mm;"/>
										<span class="styBoldText" style="font-size:8pt;padding-bottom:3mm;">c</span>
										<span style="width:3.5mm;"/>
										<span>
											<xsl:call-template name="PopulateSpan">
												<xsl:with-param name="TargetNode" select="$Form8888Data/DirectDepositInfoGroup[$pos + 1]/BankAccountTypeCd"/>
											</xsl:call-template>
										<input type="checkbox" class="styCkbox" style="height:4mm;width:4mm;" alt="2c Checking">
											<xsl:call-template name="PopulateNoCheckbox">
												<xsl:with-param name="TargetNode" select="$Form8888Data/DirectDepositInfoGroup[$pos + 1]/BankAccountTypeCd"/>
												<xsl:with-param name="BackupName">IRS8888AccountTypeCd1</xsl:with-param>
												<xsl:with-param name="Checkbox1or2Type">yes</xsl:with-param>
											</xsl:call-template>
										</input>
										<span style="width:1mm;"/>
										<label>
											<xsl:call-template name="PopulateSpan">
												<xsl:with-param name="TargetNode" select="$Form8888Data/DirectDepositInfoGroup[$pos + 1]/BankAccountTypeCd"/>
											</xsl:call-template>
											<xsl:call-template name="PopulateLabelNo">
												<xsl:with-param name="TargetNode" select="$Form8888Data/DirectDepositInfoGroup[$pos + 1]/BankAccountTypeCd"/>
												<xsl:with-param name="BackupName">IRS8888AccountTypeCd1</xsl:with-param>
											</xsl:call-template>
											<span style="font-size:8.5pt;padding-bottom:0mm;padding-top:2mm;font-family:Arial;">Checking</span>
										</label>
										</span>
										<span style="width:4mm;"/>
										<span>
											<xsl:call-template name="PopulateSpan">
												<xsl:with-param name="TargetNode" select="$Form8888Data/DirectDepositInfoGroup[$pos + 1]/BankAccountTypeCd"/>
											</xsl:call-template>
										<input type="checkbox" class="styCkbox" style="height:4mm;width:4mm;" alt="2c Savings">
											<xsl:call-template name="PopulateYesCheckbox">
												<xsl:with-param name="TargetNode" select="$Form8888Data/DirectDepositInfoGroup[$pos + 1]/BankAccountTypeCd"/>
												<xsl:with-param name="BackupName">IRS8888AccountTypeCd1</xsl:with-param>
												<xsl:with-param name="Checkbox1or2Type">yes</xsl:with-param>
											</xsl:call-template>
										</input>
										<span style="width:1mm;"/>
										<label>
										<xsl:call-template name="PopulateSpan">
												<xsl:with-param name="TargetNode" select="$Form8888Data/DirectDepositInfoGroup[$pos + 1]/BankAccountTypeCd"/>
											</xsl:call-template>
											<xsl:call-template name="PopulateLabelYes">
												<xsl:with-param name="TargetNode" select="$Form8888Data/DirectDepositInfoGroup[$pos + 1]/BankAccountTypeCd"/>
												<xsl:with-param name="BackupName">IRS8888AccountTypeCd1</xsl:with-param>
											</xsl:call-template>
											<span style="font-size:8.5pt;padding-bottom:0mm;padding-top:2mm;font-family:Arial">Savings</span>
										</label>
										</span>
									</div>
									</span>
								</div>
								<div style="width:187mm;font-size:8.5pt;height:8mm;font-family:Arial;">
									<span style="float:left;">
									<div class="styLNLeftNumBox" style="height:6mm;padding-top:1mm;;padding-right:3mm;font-size:8.5pt;text-align:right;">d</div>
									<div class="styLNDesc" style="width:28mm;height:2mm;padding-top:1mm;font-family:Arial">Account number</div>
									<span class="styLNCtrNumBox" style="width:84mm;border-top-width:1px;padding-top:0mm;padding-bottom:0mm;font-weight:normal;">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$Form8888Data/DirectDepositInfoGroup[$pos + 1]/DepositorAccountNum"/>
											<xsl:with-param name="BackupName">IRS1040DepositorAccountNumber</xsl:with-param>
										</xsl:call-template>
									</span>
									<span style="width:27.5mm;"/>
									</span>
								</div>
								<!-- End of Item 2 -->
								<!-- Beginning of Item 3 -->
								<div class="BB" style="width:187mm;font-size:8.5pt;height:4mm;font-family:Arial;padding-bottom:0mm;">
									<span style="float:left;">
									<div class="styLNLeftNumBox" style="height:4mm;padding-right:3mm;padding-left:1.7mm;padding-top:0mm;padding-bottom:0mm;font-size:8.5pt;">
										<xsl:number value="($pos + 2)" format="1"/>a</div>
									<div class="styLNDesc" style="width:140.4mm;height:4mm;padding-bottom:0mm;padding-top:0mm;">Amount to be deposited in third account
										<span class="styDotLn" style="float:none;padding-left:2.1mm;padding-right:.5mm;height:4mm;">.....................</span>
									</div>
									</span>
									<span style="float:right;">
									<div class="styLNLeftNumBox" style="height:4mm;width:7mm;text-align:center;font-size:8.5pt;border-style:solid;border-right-width:1px;border-left-width:1px;border-top-width:0px;border-bottom-width:1px;border-color:black;padding-top:0.5mm;padding-bottom:0mm;">
										<xsl:number value="($pos + 2)" format="1"/>a</div>
									<div class="styLNAmountBox" style="height:4mm;font-size:7.5pt;border-left:0px;border-right-width:0px;width:31mm;padding-top:0.9mm;padding-bottom:0mm;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$Form8888Data/DirectDepositInfoGroup[$pos + 2]/DirectDepositRefundAmt"/>
										</xsl:call-template>
									</div>
									</span>
									<!-- blank line space -->
									<span style="float:left;">
									<div class="styLNDesc" style="height:2mm; width:148.2mm;float:left;clear:none;padding-top:0mm;padding-bottom:0mm;"/>
									</span>
									<span style="float:right;">
									<div class="styShadingCellRB" style="height:17mm; width:7mm; border-style:solid; border-right-width:1px; border-left-width:1px; border-top-width:0px; border-bottom-width:0px; border-color:black; background-color:#B8B8B8; float:left;clear:none;padding-top:0mm;padding-bottom:0mm;"/>
									<div class="styLNAmountBox" style="height:2mm;font-size:7pt;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;width:31mm;float:left;padding-top:0mm;padding-bottom:0mm;clear:right;"/>
									</span>
								</div>
									<div style="width:187mm;font-size:8.5pt;height:9mm;font-family:Arial;padding-top:2mm">
									<span style="float:left;">
									<div class="styLNLeftNumBox" style="height:4.5mm;padding-top:1mm;padding-right:3mm;text-align:right;">b</div>
									<div class="styLNDesc" style="width:139.5mm;padding-top:0mm;padding-bottom:0mm;">
										<div class="styLNDesc" style="width:28mm;height:2mm;padding-top:1mm;">Routing number</div>
										<!-- call routing number -->
										<span class="styLNCtrNumBox" style="width:34mm;border-top-width:1px;padding-top:0mm;padding-bottom:0mm;font-weight:normal;">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="$Form8888Data/DirectDepositInfoGroup[$pos + 2]/RoutingTransitNum"/>
												<xsl:with-param name="BackupName">IRS1040RoutingTransitNumber1</xsl:with-param>
											</xsl:call-template>
										</span>
										<span style="width:4mm;padding-top:.5mm;padding-bottom:.5mm;float:left; clear: none;"/>
										<span style="width:.3mm;"/>
										<span class="styBoldText" style="font-size:8pt;padding-bottom:3mm;">c</span>
										<span style="width:3.5mm;"/>
										<span>
											<xsl:call-template name="PopulateSpan">
												<xsl:with-param name="TargetNode" select="$Form8888Data/DirectDepositInfoGroup[$pos + 2]/BankAccountTypeCd"/>
											</xsl:call-template>
										<input type="checkbox" class="styCkbox" style="height:4mm;width:4mm;" alt="3c Checking">
											<xsl:call-template name="PopulateNoCheckbox">
												<xsl:with-param name="TargetNode" select="$Form8888Data/DirectDepositInfoGroup[$pos + 2]/BankAccountTypeCd"/>
												<xsl:with-param name="BackupName">IRS8888AccountTypeCd2</xsl:with-param>
												<xsl:with-param name="Checkbox1or2Type">yes</xsl:with-param>
											</xsl:call-template>
										</input>
										<span style="width:1mm;"/>
										<label>
											<xsl:call-template name="PopulateSpan">
												<xsl:with-param name="TargetNode" select="$Form8888Data/DirectDepositInfoGroup[$pos + 2]/BankAccountTypeCd"/>
											</xsl:call-template>
											<xsl:call-template name="PopulateLabelNo">
												<xsl:with-param name="TargetNode" select="$Form8888Data/DirectDepositInfoGroup[$pos + 2]/BankAccountTypeCd"/>
												<xsl:with-param name="BackupName">IRS8888AccountTypeCd2</xsl:with-param>
											</xsl:call-template>
											<span style="font-size:8.5pt;padding-bottom:0mm;padding-top:2mm;font-family:Arial">Checking</span>
										</label>
										</span>
										<span style="width:7.5mm;"/>
										<span>
											<xsl:call-template name="PopulateSpan">
												<xsl:with-param name="TargetNode" select="$Form8888Data/DirectDepositInfoGroup[$pos + 2]/BankAccountTypeCd"/>
											</xsl:call-template>
										<input type="checkbox" class="styCkbox" style="height:4mm;width:4mm;padding-left:4mm;" alt="3c Savings">
											<xsl:call-template name="PopulateYesCheckbox">
												<xsl:with-param name="TargetNode" select="$Form8888Data/DirectDepositInfoGroup[$pos + 2]/BankAccountTypeCd"/>
												<xsl:with-param name="BackupName">IRS8888AccountTypeCd2</xsl:with-param>
												<xsl:with-param name="Checkbox1or2Type">yes</xsl:with-param>
											</xsl:call-template>
										</input>
										<span style="width:1mm;"/>
										<label>
											<xsl:call-template name="PopulateSpan">
												<xsl:with-param name="TargetNode" select="$Form8888Data/DirectDepositInfoGroup[$pos + 2]/BankAccountTypeCd"/>
											</xsl:call-template>
											<xsl:call-template name="PopulateLabelYes">
												<xsl:with-param name="TargetNode" select="$Form8888Data/DirectDepositInfoGroup[$pos + 2]/BankAccountTypeCd"/>
												<xsl:with-param name="BackupName">IRS8888AccountTypeCd2</xsl:with-param>
											</xsl:call-template>
											<span style="font-size:8.5pt;padding-bottom:0mm;padding-top:2mm;font-family:Arial">Savings</span>
										</label>
										</span>
									</div>
									</span>
								</div>
								<div style="width:187mm;font-size:8.5pt;height:9.5mm;font-family:Arial;" >
									<span style="float:left;">
									<div class="styLNLeftNumBox" style="height:4.5mm;padding-top:1mm;padding-right:3mm;font-size:8.5pt;text-align:right;">d</div>
									<div class="styLNDesc" style="width:28mm;height:2mm;padding-top:1mm;">Account number</div>
									<span class="styLNCtrNumBox" style="width:84mm;border-top-width:1px;padding-top:0mm;padding-bottom:0mm;font-weight:normal;">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$Form8888Data/DirectDepositInfoGroup[$pos + 2]/DepositorAccountNum"/>
											<xsl:with-param name="BackupName">IRS1040DepositorAccountNumber</xsl:with-param>
										</xsl:call-template>
									</span>
									<span style="width:27.5mm;"/>
									</span>
								<!--	<span style="float:right;">
									<span style="width:7mm;height:8mm;padding-top:4mm;text-align:center;border-style:solid;   border-right-width:1px;border-left-width:1px;border-top-width:0px;border-bottom-width:0px;border-color:black;background-color:B8B8B8"/>
									<span style="width:31mm;height:4mm;padding-top:4mm;border-style:solid;border-right-width:0px;border-left-width:0px;border-top-width:0px;    border-bottom-width:0px;border-color:black;"/>
									</span>-->
								</div>
								<!-- End of Item 3 -->
							</div>
						</xsl:if>
					</div>
					<div style="width:187mm;font-size:9.5pt;padding-bottom:.1mm;font-family:Arial;border-top-width:1.5px;" class="styBB">
						<!-- <div class="styPartName" style="height:4mm;font-family:Arial;font-size:9.5pt;">Part III</div> -->
						<div class="styPartDesc" style="font-weight:normal;font-size:9.5pt;">
							<b>Reserved</b>
							<!--<span style="font-size:8pt;">Complete this part if you want a portion of your refund to be sent to you as a check.</span>-->
						</div>
					</div>
					<!-- Line 4 -->
					<div style="width:187mm;font-size:8.5pt;height:4.5mm;padding-top:0mm;font-family:Arial;" class="styBB">
				 		<span style="float:left;">
						<div class="styLNLeftNumBox" style="width:7.5mm;padding-right:3mm">4</div>
						<div class="styLNDesc" style="width:140.2mm;">Reserved									         
						<!--Dotted Line-->
						<span class="styDotLn" style="float:none;padding-left:2.7mm;padding-right:.5mm;">...............................</span>
						</div>
						</span>
						<span style="float:right;">
						<div class="styLNLeftNumBox" style="height:4.5mm;width:7mm;padding-top:.5mm;padding-left:0mm;border-style:solid;text-align:center; border-right-width:1px;border-left-width:1px;border-top-width:0px;border-bottom-width:0px;border-color:black;font-size:8.5pt;">4</div>
						<!--<div class="styIRS8888ColBox" style="height:4.5mm;font-size:7.5pt;border-left:0px;border-right-width:0px;padding-top:1mm;border-bottom:0mm;width:31mm;text-align:right;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form8888Data/RefundByCheckAmt"/>
							</xsl:call-template>
						</div>-->
						<div class="styLNAmountBoxNBB" style="height:4mm;font-size:7.5pt;border-left:0px;border-right-width:0px;padding-top:1mm;border-bottom:0mm;width:31mm;text-align:right;background-color:lightgrey;">
						</div>
						</span>
					</div>
					<!-- end of item 4 -->
					<!-- Item 5 -->
					<div style="width:187mm;height:4.4mm;font-family:Arial;" class="styBB">
						<div class="styPartDesc" style="font-weight:normal;font-size:9.5pt;font-family:Arial;">
							<b>Total Allocation of Refund</b>
							<br/>
						</div>
					</div>
					<div class="styBB" style="width:187mm;font-family:Arial;font-size:8.5pt;height:4.5mm;">
						<span style="float:left;">
						<div class="styLNLeftNumBox" style="width:7.5mm;height:3.5mm;padding-top:1mm;">5
						</div>
												<div class="styLNDesc" style="width:140.2mm;height:3.5mm;padding-top:1mm;padding-bottom:0mm;">
		 Add lines 1a, 2a, and 3a. The total must equal the refund amount shown on your tax return 
		<span class="styDotLn" style="float:none;padding-right:.5mm;padding-left:1.5mm;padding-bottom:0mm;">....</span>
						</div>
						</span>
						<span style="float:right;">
						<!-- ACF- chg styIRS8888ColBoxGrey to styLNLeftNumBox remove padding-top:5mm add padding-bottom:.5 -->
						<div class="styLNLeftNumBox" style="height:4.1mm;width:7mm;padding-bottom:.5mm;border-style:solid;border-right-width:1px;border-left-width:1px;border-top-width:0px;border-bottom-width:0px;border-color:black;">
							<span style="width:4.5mm;height:2.3mm;text-align:center;padding-top:0mm;background-color:white;
							padding-left:0mm;border-bottom-width:3px;">5</span>
						</div> 
						<div class="styGenericDiv" style="width:31mm;height:8mm;font-size:7.5pt;padding-top:0.5mm;text-align:right;border-left-width:0px;border-bottom-width:1px;border-right-width:0px;padding-bottom:1mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form8888Data/TotalAllocationOfRefundAmt"/>
							</xsl:call-template>
						</div>
						</span>
					</div>
					<!-- End line 5 -->
					<div class="styBB" style="width:187mm;font-size:6.5pt;padding-top:1mm;padding-bottom:4mm;clear:all;border-top-width:1px;border-bottom-width:0px;">
						
     			<div style="width:114mm;font-weight:bold;float:left;clear:none;font-size:7.5pt;">For Paperwork Reduction Act Notice, see your tax return instructions.</div>
						<div style="width:30mm;float:left;clear:none;">Cat. No. 21858A</div>
						<div style="width:40mm;text-align:right;font-size:6pt;float:right;clear:none;">Form <span class="styBoldText" style="font-size:8pt;">8888  </span> (Rev. 12-2025)</div>
					</div>
					<div class="pageEnd" style="width:187mm;"/>
					<!-- END of Page 1 -->
					<!-- BEGIN Left Over Table -->
					<!-- Additonal Data Title Bar and Button -->
					<div class="styLeftOverTitleLine" id="LeftoverData">
						<div class="styLeftOverTitle">
            Additional Data        
          </div>
						<div class="styLeftOverButtonContainer">
							<input class="styLeftoverTableBtn" type="button" TabIndex="1" value="Return to Form" onclick="javascript:returnToWriteInImage();"/>
						</div>
					</div>
					<!-- Additional Data Table -->
					<table class="styLeftOverTbl">
						<xsl:call-template name="PopulateCommonLeftover">
							<xsl:with-param name="TargetNode" select="$Form8888Data"/>
							<xsl:with-param name="DescWidth" select="100"/>
						</xsl:call-template>
					</table>
				</form>
			</body>
		</html>
	</xsl:template>
</xsl:stylesheet>
