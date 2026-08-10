<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE xsl:stylesheet [
  <!ENTITY nbsp "&#160;">
  <!ENTITY ndash "&#8211;">
  <!ENTITY mdash "&#8212;">
]>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:include href="PopulateTemplate.xsl" />
	<xsl:include href="AddHeader.xsl" />
	<xsl:include href="CommonPathRef.xsl" />
	<xsl:include href="AddOnTable.xsl" />
	<xsl:include href="IRS1040Schedule1AStyle.xsl" />
	<xsl:output method="html" indent="yes" />
	<xsl:strip-space elements="*" />
	<xsl:param name="FormData" select="$RtnDoc/IRS1040Schedule1A" />
	<xsl:template match="/">
	<xsl:text disable-output-escaping="yes">&lt;!DOCTYPE html&gt;</xsl:text>
		<html lang="EN-US">
			<head>
				<meta http-equiv="X-UA-Compatible" content="IE=edge" />
				<title>
					<xsl:call-template name="FormTitle">
						<xsl:with-param name="RootElement" select="local-name($FormData)" />
					</xsl:call-template>
				</title>
				<!-- No Browser Caching -->
				<meta http-equiv="Pragma" content="no-cache" />
				<meta http-equiv="Cache-Control" content="no-cache" />
				<meta http-equiv="Expires" content="0" />
				<!-- No Proxy Caching -->
				<meta http-equiv="Cache-Control" content="private" />
				<!-- Define Character Set -->
				<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
				<meta name="Description" content="IRS Form 1040 Schedule 1A" />
				<script language="JavaScript" src="{$ScriptPath}/FormDisplay.js" type="text/javascript" />
				<xsl:call-template name="InitJS" />
				<style type="text/css">
					<xsl:if test="not($Print) or $Print=''">
						<xsl:call-template name="IRS1040Schedule1AStyle" />
						<xsl:call-template name="AddOnStyle" />
					</xsl:if>
				</style>
				<xsl:call-template name="GlobalStylesForm" />
			</head>
			<body class="styBodyClass">
				<form id="Form1040Schedule1A">
					<xsl:call-template name="DocumentHeader" />
					<!-- Header -->		
										
					<div class="styStdDiv">
						<div class="styFNBox" style="width:29mm;height:20mm;border-right-width:2px;">
							<div class="styFormNumber" style="font-size:7pt;">
								<span style="font-size:10pt;">SCHEDULE 1-A</span>
								<xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode" select="$FormData" />
								</xsl:call-template><br />
								(Form 1040)
							</div>
							<br /><br />
							<div class="styAgency" style="padding-top:.5mm;">Department of the Treasury<br/>
								Internal Revenue Service
							</div>
						</div>
						<div class="styFTBox" style="width:128mm;height:17mm;">
							<span class="styFMT" style="font-size:11pt;padding-top:2mm;">
								Additional Deductions</span>
							<br /><br />
							<span style="font-weight:bold;">
								<span style="width:4px;"/>Attach to Form 1040, 1040-SR, or 1040-NR.
							</span><br />
							<span style="font-weight:bold;">
								<span style="width:4px;"/>Go to
								<span style="font-style:italic">www.irs.gov/Form1040</span>
								for instructions and the latest information.
							</span>
						</div>
						<div class="styTYBox" style="width: 29mm; height: 20mm;">
							<div class="styOMB" style="font-size:6pt; height: 4mm; padding-right: 1.5mm; padding-left: 1.5mm;">
								OMB No. 1545-0074
							</div>
							<div class="styTY" style="height: 6mm; line-height: 100%; font-size: 21pt;">
								20<span class="styTYColor">25</span>
							</div>
							<div style="text-align: left; padding-top: .3mm; padding-left: 3mm;">
								Attachment<br/> Sequence No. <span class="styBoldText" style="font-size:8pt">1A</span>
							</div>
						</div>
					</div>
					
				<!-- Filer information section -->
					<div class="styStdDiv" style="border-top:2px solid black;font-size:8pt">
						<div class="styNameBox" style="width:135mm;font-size:8pt">Name(s) shown on Form 1040, 1040-SR, or 1040-NR
							<br />
							<xsl:call-template name="PopulateReturnHeaderFiler">
								<xsl:with-param name="TargetNode">BusinessNameLine1Txt</xsl:with-param>
							</xsl:call-template>
						</div>
						<div class="styEINBox" style="width:52mm;padding-left:0.5mm;font-weight:normal;font-size:8pt">
							<strong>Your social security number</strong>
							<br />
							<xsl:call-template name="PopulateReturnHeaderFilerTIN"/>
						</div>
					</div>					
					
       					<div class="styStdDiv" style="border-top:1px solid black;border-bottom:1px solid black;">
       					<!--Part I-->
						<div class="styPartName" style="padding-top:.25mm;">Part I</div>
						<div class="styPartDesc" style="padding-top:.25mm;">Modified Adjusted Gross Income (MAGI) Amount</div>
					</div>
					
				       <!-- Line 1 -->
					<div class="styStdDivNoScroll">
						<div class="styLNLeftNumBoxSD">1</div>
						<div class="styLNDesc" style="font-size:8pt">
							Enter the amount from Form 1040, 1040-SR, or 1040-NR, line 11b<span class="sty1040Sch1ADotLn">..........</span>
						</div>
						<div class="styLNRightNumBox">1</div>
							<div class="styLNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/AdjustedGrossIncomeAmt"/>
							</xsl:call-template>						
						</div>
					</div>
				   	<!-- Line 2 -->
					
					<!-- Line 2a -->
					<div class="styStdDivNoScroll">
						<div class="styLNLeftNumBoxSD">2&nbsp;a</div>
						<div class="styLNDesc" style="width:98mm;font-size:7.8pt;">
							Enter any income from Puerto Rico that you excluded							
							<span class="sty1040Sch1ADotLn">.....</span>		
						</div>
						<div class="styLNRightNumBox" style="padding-top:.5mm;">2a</div>
							<div class="styLNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/ExcldSect933PuertoRicoIncmAmt"/>
							</xsl:call-template>						
						</div>
						<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;border-right-width:1px;"></div>
						<div class="sty1040Sch1LNAmountBoxNBB"></div>
					</div>
					
                    <!-- Line 2b -->
					<div class="styStdDivNoScroll">
						<div class="styLNLeftLtrBoxDD">b</div>
						<div class="styLNDesc" style="width:98mm;font-size:7.8pt">
							Enter the amount from Form 2555, line 45							
							<span class="sty1040Sch1ADotLn">.........</span>
						</div>
						<div class="styLNRightNumBox">2b</div>
							<div class="styLNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TotalIncomeExclusionAmt"/>
							</xsl:call-template>						
						</div>
						<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;border-right-width:1px;"></div>
						<div class="sty1040Sch1LNAmountBoxNBB"></div>
					</div>		
					  
                      <!-- Line 2c -->
					<div class="styStdDivNoScroll">
						<div class="styLNLeftLtrBoxDD">c</div>
						<div class="styLNDesc" style="width:98mm;font-size:7.8pt">
							Enter the amount from Form 2555, line 50
							<span class="sty1040Sch1ADotLn">.........</span>		
						</div>
						<div class="styLNRightNumBox">2c</div>
						<div class="styLNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/HousingDeductionAmt"/>
							</xsl:call-template>						
						</div>
						<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;border-right-width: 1px;"></div>
						<div class="sty1040Sch1LNAmountBoxNBB"></div>
					</div>	
						
				    <!-- Line 2d -->
					<div class="styStdDivNoScroll">
						<div class="styLNLeftLtrBoxDD" style="height:4.4mm;">d</div>
						<div class="styLNDesc" style="height:4.4mm;width:98mm;font-size:8pt">
							Enter the amount from Form 4563, line 15
						
							<span class="sty1040Sch1ADotLn">........</span>
						</div>
						<div class="styLNRightNumBox" style="height:4.4mm;">2d</div>
						<div class="styLNAmountBox" style="height:4.4mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/GrossIncomeExclusionAmt"/>
							</xsl:call-template>						
						</div>
						<div class="styLNRightNumBoxNBB" style="height:4.4mm;background-color:lightgrey;border-right-width: 1px;">
						</div>
						<div class="sty1040Sch1LNAmountBoxNBB" style="height:4.4mm;"></div>
					</div>		
					
				      <!-- Line 2e -->            
					<div class="styStdDivNoScroll">
						<div class="styLNLeftLtrBoxDD">e</div>
						<div class="styLNDesc" style="height:4mm;width:138mm;font-size:8pt">
							Add lines 2a, 2b, 2c, and 2d							 
							<span class="sty1040Sch1ADotLn">.......................</span>
						</div>
						<div class="styLNRightNumBox" >2e</div>
						<div class="sty1040Sch1AAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TotalExclusionsDeductionAmt"/>
							</xsl:call-template>						
						</div>							
					</div>											
					<!-- Line 3 -->
					<div class="styStdDivNoScroll">
						<div class="styLNLeftNumBoxSD">3</div>
						<div class="styLNDesc" style="font-size:8pt">
							Add lines 1 and 2e<span class="sty1040Sch1ADotLn">..........................</span>
						</div>
						<div class="styLNRightNumBox" >3</div>
						<div class="sty1040Sch1AAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/ModifiedAGIAmt"/>
							</xsl:call-template>
							
						</div>
					</div>
					
					<div class="styStdDiv" style="border-top:1px solid black;border-bottom:1px solid black;">
       					<!--Part II-->
						<div class="styPartName" style="padding-top:.25mm;">Part II</div>
						<div class="styPartDesc" style="padding-top:.25mm;">No Tax on Tips</div>
					</div>							
						
					<div style="width:185mm;font-size:7.8pt">
						<b>Caution:</b>
				Fill out Part II only if you received qualified tips. You and/or your spouse who received qualified  tips must have a valid social security number to claim the deduction. If married, you must file jointly to claim this deduction. See instructions.	</div>		
												
<div class="styStdDiv" style="border-top:1px solid black;border-bottom:1px "></div>

                    <!--Line 4-->             				
					<div class="styStdDivNoScroll">
						<div class="styLNLeftNumBoxSD">4</div>
						<div class="styLNDesc" style="width:98mm;font-size:7.8pt;">
							Qualified tips received as an employee.								
						</div>
						<div class="styLNRightNumBox" style="border-bottom:none" ></div>
						<div class="styLNAmountBox" style="border-bottom:none">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/NetOperatingLossDeductionAmt"/>
							</xsl:call-template>						
						</div>
						<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;border-right-width: 1px;"></div>
						<div class="sty1040Sch1LNAmountBoxNBB"></div>
					</div>

				    <!-- Line 4a -->
					<div class="styStdDivNoScroll">
						<div class="styLNLeftLtrBoxDD">a</div>
						<div class="styLNDesc" style="width:98mm;font-size:7.8pt; height:8mm;">
							If Form W-2, box 5, is $176,100 or less, enter qualified tips included <br/> in Form W-2, box 7. Otherwise, see instructions
							<span class="sty1040Sch1ADotLn">.......</span>
						</div>
						<div class="styLNRightNumBox" style="height:8mm;padding-top:4mm;">4a</div>
						<div class="styLNAmountBox" style="height:8mm;padding-top:4mm;">
							<xsl:call-template name="PopulateAmount" >
								<xsl:with-param name="TargetNode" select="$FormData/QualifiedTipsWagesAmt"/>
							</xsl:call-template>						
						</div>
						<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;height:8mm;border-right-width: 1px;"></div>
						<div class="sty1040Sch1LNAmountBoxNBB"></div>
					</div>		
					        <!-- Line 4b -->
					<div class="styStdDivNoScroll">
						<div class="styLNLeftLtrBoxDD">b</div>
						<div class="styLNDesc" style="width:98mm;font-size:7.8pt">
							Qualified tips included in Form 4137, line 1(c). If Form 4137 is not filed, enter -0-
							<span class="sty1040Sch1ADotLn">..................</span>		
						</div>
						<div class="styLNRightNumBox" style="height:6mm;padding-top:3mm;">4b</div>
						<div class="styLNAmountBox" style="height:6mm;padding-top:3mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/QualifiedTipsForm4137Amt"/>
							</xsl:call-template>						
						</div>
						<div class="styLNRightNumBoxNBB" style="height:8mm;background-color:lightgrey;border-right-width: 1px;">
						</div>
					</div>		
					       <!-- Line 4c -->
					<div class="styStdDivNoScroll">
						<div class="styLNLeftLtrBoxDD" style="height:7mm;">c</div>
						<div class="styLNDesc" style="height:7mm;width:138mm;font-size:8pt">
							If you only received qualified tips from one employer, enter the larger of line 4a or line 4b. <br/>Otherwise, 
							see instructions
							<span class="sty1040Sch1ADotLn">.......................</span>
						</div>
						<div class="styLNRightNumBox" style="height:7mm;padding-top:3mm;">4c</div>
						<div class="sty1040Sch1AAmountBox" style="height:7mm;padding-top:3mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/QualifiedTipsEmployeeAmt"/>
							</xsl:call-template>						
						</div>						
						<div class="sty1040Sch1LNAmountBoxNBB" style="height:4.4mm;"></div>
					</div>		
					
				     <!-- Line 5 -->
					<div class="styStdDivNoScroll">
						<div class="styLNLeftNumBoxSD">5</div>
						<div class="styLNDesc" style="font-size:8pt;height:14mm;width:138mm;">
						
					Qualified tips received in the course of a trade or business.<br/>
					Qualified tip amount included in Form 1099-NEC, box 1; Form 1099-MISC, box 3; or <br/>Form 1099-K, box 1a. Do not enter more than the net profit from the trade or business. If you received qualified tips in the course of more than one trade or business, see instructions
							
							<span class="sty1040Sch1ADotLn">..</span>
						</div>
						<div class="styLNRightNumBox" style="height:14mm;padding-top:10mm;">5</div>
						<div class="sty1040Sch1AAmountBox" style="height:14mm;padding-top:10mm;">
							<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/QualifiedTipsTradeOrBusAmt "/>
							</xsl:call-template>
						</div>
					</div>
		
				    <!-- Line 6 -->
					<div class="styStdDivNoScroll">
						<div class="styLNLeftNumBoxSD">6</div>
						<div class="styLNDesc" style="font-size:8pt">
							Add lines 4c and 5<span class="sty1040Sch1ADotLn">..........................</span>
						</div>
						<div class="styLNRightNumBox">6</div>
						<div class="sty1040Sch1AAmountBox">
							<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/TotalQualifiedTipsAmt"/>
							</xsl:call-template>
						</div>
					</div>
		
						  <!-- Line 7 -->
					<div class="styStdDivNoScroll">
						<div class="styLNLeftNumBoxSD">7</div>
						<div class="styLNDesc" style="font-size:8pt">
							Enter the smaller of the amount on line 6 or $25,000<span class="sty1040Sch1ADotLn">..............</span>
						</div>
						<div class="styLNRightNumBox">7</div>
						<div class="sty1040Sch1AAmountBox">
							<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/SmallerTipsOrMaxDedAmt"/>
							</xsl:call-template>
						</div>
					</div>
		
						  <!-- Line 8 -->
					<div class="styStdDivNoScroll">
						<div class="styLNLeftNumBoxSD">8</div>
						<div class="styLNDesc" style="font-size:8pt">
							Enter the amount from line 3<span class="sty1040Sch1ADotLn">......................</span>
						</div>
						<div class="styLNRightNumBox">8</div>
						<div class="sty1040Sch1AAmountBox">
							<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/ModifiedAGIAmt"/>
							</xsl:call-template>
						</div>
					</div>
					
						  <!-- Line 9 -->
					<div class="styStdDivNoScroll">
						<div class="styLNLeftNumBoxSD">9</div>
						<div class="styLNDesc" style="font-size:8pt">
							Enter $150,000 ($300,000 if married filing jointly)<span class="sty1040Sch1ADotLn">...............</span>
						</div>
						<div class="styLNRightNumBox">9</div>
						<div class="sty1040Sch1AAmountBox">
							<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/TipsFilingStatusThrshldAmt"/>
							</xsl:call-template>
						</div>
					</div>
				
						 <!-- Line 10 -->
					<div class="styStdDivNoScroll">
						<div class="styLNLeftNumBoxSD" style="padding-left:1mm;">10</div>
						<div class="styLNDesc" style="font-size:8pt">
							Subtract line 9 from line 8. If zero or less, enter amount from line 7 on line 13<span class="sty1040Sch1ADotLn">......</span>
						</div>
						<div class="styLNRightNumBox" >10</div>
						<div class="sty1040Sch1AAmountBox">
							<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/TipsMAGILessThrshldAmt"/>
							</xsl:call-template>
						</div>
					</div>
		
				          <!-- Line 11 -->
					<div class="styStdDivNoScroll">
						<div class="styLNLeftNumBoxSD" style="padding-left:1mm;">11</div>
						<div class="styLNDesc" style="font-size:8pt;height:8mm;width:138mm;">
							Divide line 10 by $1,000. If the resulting number isn't a whole number, decrease the result to<br/> the next
lower whole number. (For example, decrease 1.5 to 1, and decrease 0.05 to 0.)
<span class="sty1040Sch1ADotLn">..</span>
						</div>
						<div class="styLNRightNumBox" style="height:8mm;padding-top:4mm;">11</div>
						<div class="sty1040Sch1AAmountBox" style="height:8mm;padding-top:4mm;font-size:5.7pt;">
							<xsl:call-template name="PopulateText">
							<xsl:with-param name="TargetNode" select="$FormData/TipsMAGILessThrshldDivideNum"/>
							</xsl:call-template>
						</div>
					</div>
					
						 <!-- Line 12 -->
					<div class="styStdDivNoScroll">
						<div class="styLNLeftNumBoxSD" style="padding-left:1mm;">12</div>
						<div class="styLNDesc" style="font-size:8pt">
							Multiply line 11 by $100<span class="sty1040Sch1ADotLn">........................</span>
						</div>
						<div class="styLNRightNumBox">12</div>
						<div class="sty1040Sch1AAmountBox">
							<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/TipsMAGILessThrshldRedAmt"/>
							</xsl:call-template>
						</div>
					</div>
					
						 <!-- Line 13 -->
					<div class="styStdDivNoScroll">
						<div class="styLNLeftNumBoxSD" style="padding-left:1mm;">13</div>
						<div class="styLNDesc" style="font-size:8pt">
							<b>Qualified tips deduction.</b> Subtract line 12 from line 7. If zero or less, enter -0-<span class="sty1040Sch1ADotLn">.....</span>
						</div>
						<div class="styLNRightNumBox">13</div>
						<div class="sty1040Sch1AAmountBox">
							<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/QualifiedTipsDeductionAmt"/>
							</xsl:call-template>
						</div>
					</div>		
				
					<div class="styStdDiv" style="border-top:1px solid black;border-bottom:1px solid black;">
       					<!--Part III-->
						<div class="styPartName" style="padding-top:.25mm;">Part III</div>
						<div class="styPartDesc" style="padding-top:.25mm;">No Tax on Overtime</div>					</div>							
						
					<div style="width:185mm;font-size:7.8pt">
						<b>Caution:</b>
				Fill out Part III only if you received qualified overtime compensation. You and/or your spouse who received the qualified overtime compensation must have a valid social security number to claim this deduction.
If married, you must file jointly to claim this deduction. See instructions.</div>	
	
<div class="styStdDiv" style="border-top:1px solid black;border-bottom:1px ">
</div>	

				     <!-- Line 14a -->
					<div class="styStdDivNoScroll">
						<div class="styLNLeftLtrBoxDD" style="padding-left:1.5mm;">14a</div>
						<div class="styLNDesc" style="width:98mm;font-size:7.8pt; height:7mm;">
							Qualified overtime compensation included on Form W-2, box 1 (see <br/>instructions)						
							<span class="sty1040Sch1ADotLn">...................</span>
						</div>
						<div class="styLNRightNumBox" style="height:7mm;padding-top:4mm;">14a</div>
						<div class="styLNAmountBox" style="height:7mm;padding-top:4mm;">
							<xsl:call-template name="PopulateAmount" >
								<xsl:with-param name="TargetNode"
								select="$FormData/QualifiedOvertimeWagesAmt"/>
							</xsl:call-template>						
						</div>
						<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;height:7mm;border-right-width: 1px;"></div>
						<div class="sty1040Sch1LNAmountBoxNBB"></div>
					</div>		
					
					<!-- Line 14b -->
					<div class="styStdDivNoScroll">
						<div class="styLNLeftLtrBoxDD" style="padding-top:2mm;">b</div>
						<div class="styLNDesc" style="width:98mm;font-size:7.8pt;height:9mm;padding-top:2mm;">
							Qualified overtime compensation included on Form 1099-NEC, box 1<br/> or Form 
							1099-MISC, box 3 (see instructions)
							<span class="sty1040Sch1ADotLn">........</span>		
						</div>
						<div class="styLNRightNumBox" style="height:9mm; padding-top:6mm;">14b</div>
						<div class="styLNAmountBox" style="height:9mm; padding-top:6mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/QualifiedOvertimeForm1099Amt"/>
							</xsl:call-template>						
						</div>
						<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;height:9mm;border-right-width: 1px;"></div>
						<div class="sty1040Sch1LNAmountBoxNBB"></div>
					</div>								
					<!-- Line 14c -->
					<div class="styStdDivNoScroll">
						<div class="styLNLeftLtrBoxDD" style="height:6.4mm;padding-top:3mm;">c</div>
						<div class="styLNDesc" style="height:6.4mm;width:138mm;font-size:8pt;padding-top:3mm;">
							Add lines 14a and 14b
							 
							<span class="sty1040Sch1ADotLn">.........................</span>
						</div>
						<div class="styLNRightNumBox" style="height:6.4mm;padding-top:3mm;">14c</div>
						<div class="sty1040Sch1AAmountBox" style="height:6.4mm;padding-top:3mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TotalQualifiedOvertimeAmt"/>
							</xsl:call-template>						
						</div>							
					</div>		
										
					<!-- Line 15 -->
					<div class="styStdDivNoScroll">
						<div class="styLNLeftNumBoxSD" style="height:4mm;padding-left:1mm;">15</div>
						<div class="styLNDesc" style="font-size:8pt">
						Enter the smaller of the amount on line 14c or $12,500 ($25,000 if married filing jointly)
							<span class="sty1040Sch1ADotLn">..</span>
						</div>
						<div class="styLNRightNumBox" style="height:4mm;">15</div>
						<div class="sty1040Sch1AAmountBox" style="height:4mm;">
							<xsl:call-template name="PopulateAmount" >
								<xsl:with-param name="TargetNode" select="$FormData/SmallerOvertimeOrMaxDedAmt"/>
							</xsl:call-template>
						</div>
					</div>
					
					 <!-- Line 16 -->
					<div class="styStdDivNoScroll">
						<div class="styLNLeftNumBoxSD" style="padding-left:1mm;">16</div>
						<div class="styLNDesc" style="font-size:8pt">
							Enter the amount from line 3<span class="sty1040Sch1ADotLn">......................</span>
						</div>
						<div class="styLNRightNumBox">16</div>
						<div class="sty1040Sch1AAmountBox">
							<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/ModifiedAGIAmt"/>
							</xsl:call-template>
						</div>
					</div>
					
				     <!-- Line 17 -->
					<div class="styStdDivNoScroll">
						<div class="styLNLeftNumBoxSD" style="padding-left:1mm;">17</div>
						<div class="styLNDesc" style="font-size:8pt">
							Enter $150,000 ($300,000 if married filing jointly)<span class="sty1040Sch1ADotLn">...............</span>
						</div>
						<div class="styLNRightNumBox">17</div>
						<div class="sty1040Sch1AAmountBox">
							<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/OvertimeFilingStatusThrshldAmt"/>
							</xsl:call-template>
						</div>
					</div>
					
				    <!-- Line 18 -->
					<div class="styStdDivNoScroll">
						<div class="styLNLeftNumBoxSD" style="padding-left:1mm;">18</div>
						<div class="styLNDesc" style="font-size:8pt">
							Subtract line 17 from line 16. If zero or less, enter amount from line 15 on line 21<span class="sty1040Sch1ADotLn">....</span>
						</div>
						<div class="styLNRightNumBox">18</div>
						<div class="sty1040Sch1AAmountBox">
							<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/OtMAGILessThrshldAmt"/>
							</xsl:call-template>
						</div>
					</div>
					
				     <!-- Line 19 -->
					<div class="styStdDivNoScroll">
						<div class="styLNLeftNumBoxSD" style="padding-left:1mm;">19</div>
						<div class="styLNDesc" style="font-size:8pt;height:8mm;">
							Divide line 18 by $1,000. If the resulting number isn't a whole number, decrease the result to <br/> the next lower whole number. (For example, decrease 1.5 to 1, and decrease 0.05 to 0.)						
							<span class="sty1040Sch1ADotLn">..</span>
						</div>
						<div class="styLNRightNumBox"  style="height:8mm;padding-top:4mm;">19</div>
						<div class="sty1040Sch1AAmountBox" style="height:8mm;padding-top:4mm;font-size:5.7pt;">
							<xsl:call-template name="PopulateText">
							<xsl:with-param name="TargetNode" select="$FormData/OtMAGILessThrshldDivideNum"/>
							</xsl:call-template>
						</div>
					</div>

				    <!-- Line 20 -->
					<div class="styStdDivNoScroll">
						<div class="styLNLeftNumBoxSD" style="padding-left:1mm;">20</div>
						<div class="styLNDesc" style="font-size:8pt">
							Multiply line 19 by $100
							<span class="sty1040Sch1ADotLn">........................</span>
						</div>
						<div class="styLNRightNumBox">20</div>
						<div class="sty1040Sch1AAmountBox">
							<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/OtMAGILessThrshldRedAmt"/>
							</xsl:call-template>
						</div>
					</div>

				     <!-- Line 21 -->
					<div class="styStdDivNoScroll">
						<div class="styLNLeftNumBoxSD" style="height:7mm; padding-left:1mm;">21</div>
						<div class="styLNDesc" style="font-size:8pt; width:138mm;">
							<b>Qualified overtime compensation deduction.</b> Subtract line 20 from line 15. If zero or less,<br/> enter -0-
							<span class="sty1040Sch1ADotLn">..............................</span>
						</div>
						<div class="styLNRightNumBox" style="height:7mm; padding-top:3mm;border-top:4mm;">21</div>
						<div class="sty1040Sch1AAmountBox" style="height:7mm; padding-top:3mm;border-top:4mm;">
							<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/QualifiedOvertimeCompDedAmt"/>
							</xsl:call-template>
						</div>
					</div>
					
					 <!-- Page 1 Form footer-->
					<div class="styStdDiv pageEnd" style="border-top:1px solid black;">
						<span style="font-weight:bold;font-family:Arial;">For Paperwork Reduction Act Notice, see your tax return instructions.</span>
						<span style="margin-left:16mm;font-size:6.5pt;">Cat. No. 95872Q</span>
						<span style="float:right;font-size:6.5pt;"><b>Schedule 1-A (Form 1040) 2025</b>
						</span> 	
					</div>						
					
					<!-- Pae2-->
									<!-- begin of extra page -->
					<div class="styStdDiv">
						Schedule 1A (Form 1040) (Rev. 12-2025)
						<span style="float:right;">Page <span style="font-weight:bold;font-size:8pt;">2</span>
						</span>
					</div>					
					<div class="styStdDiv" style="border-top:1px solid black;border-bottom:1px solid black;">
       					<!--Part IV-->
						<div class="styPartName" style="padding-top:.25mm;">Part IV</div>
						<div class="styPartDesc" style="padding-top:.25mm;">No Tax on Car Loan Interest</div>
					</div>							
					<div style="width:185mm;font-size:7.8pt">
						<b>Caution:</b>
				Fill out Part IV only if you paid or accrued qualified passenger vehicle loan interest. See instructions to learn more about what is an applicable passenger vehicle.</div>														
 
                <div class="styStdDiv" style="border-top:1px solid black; "></div>	
					 <!-- Line 22 -->					 
					<div class="styStdDivNoScroll">
						<div class="styLNLeftNumBoxSD">22</div>
						<div class="styLNDesc" style="font-size:8pt">
							Applicable passenger vehicle (see instructions). If more than two VINs, see instructions.
						</div>						 					
					</div>
				<div class="styStdDiv" style="border-top:1px solid black;border-bottom:1px "></div>					
			        
           	<xsl:variable name="shouldSeparateL22" select="(count($FormData/QlfyPassengerVehicleLoanIntGrp) &gt; 2)"/>
					<div class="styTableContainerNBB" style="" id="Line1Table">
						<xsl:call-template name="SetInitialState"/>
						<table class="styTable" style="font-size:7pt;border-collapse:collapse;">
							<thead class="styTableThead">							
							<tr>
								<th class="styTableCellHeader" rowspan="2" style="width:120mm;font-weight:normal;" scope="col" >								
									
									<strong>(i)</strong>
										Vehicle identification number (VIN)
								</th>
							    <th class="styTableCellHeader" colspan="2" style="width:auto;font-weight:normal;border-right-width:0px;" scope="colgroup" >
									Interest for this loan:
								</th>
							</tr>
					<tr>							    	
						<th class="styTableCellHeader" scope="col" style="width:34mm;font-weight:normal;padding-bottom:2mm;padding-right:4mm;">
								<center><strong>(ii)</strong>										 		
							 Deducted on Schedule C, Schedule <br/>E, or Schedule F</center>							 
						</th>
						<th class="styTableCellHeader" scope="col" style="width:33mm;font-weight:normal;border-right:none;">
										<center><strong>(iii)</strong>
										Schedule 1-A</center>		
						</th>						
						</tr>
						</thead>						
					</table>
						</div>		
 
					<!-- Original table -->
					<!-- when table has 2 or less instances -->
					<xsl:if test="count($FormData/QlfyPassengerVehicleLoanIntGrp) &lt;= 2">
						<div class="styStdDiv" style="border-bottom:1px;border-top:1px solid black;"/>
						<div class="styLNLeftNumBoxSD">a</div>
						<div class="styLNDesc" style="width:112mm;height:auto;border-right:1px solid black;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/QlfyPassengerVehicleLoanIntGrp[1]/VIN"/>
							</xsl:call-template>
						</div>
						<div class="styLNDesc" style="width:34mm;height:auto;border-right:1px solid black;text-align:right;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/QlfyPassengerVehicleLoanIntGrp[1]/QualifiedCarLoanIntDedSchAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNDesc" style="width:30mm;height:auto;text-align:right;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/QlfyPassengerVehicleLoanIntGrp[1]/QualifiedCarLoanInterestAmt"/>
							</xsl:call-template>
						</div>
						<div class="styStdDiv" style="border-top:1px solid black;border-bottom:1px "/>
						<div class="styLNLeftNumBoxSD">b</div>
						<div class="styLNDesc" style="width:112mm;height:auto;border-right:1px solid black;">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/QlfyPassengerVehicleLoanIntGrp[2]/VIN"/>
							</xsl:call-template>
						</div>
						<div class="styLNDesc" style="width:34mm;height:auto;border-right:1px solid black;text-align:right;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/QlfyPassengerVehicleLoanIntGrp[2]/QualifiedCarLoanIntDedSchAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNDesc" style="width:30mm;height:auto;text-align:right;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/QlfyPassengerVehicleLoanIntGrp[2]/QualifiedCarLoanInterestAmt"/>
							</xsl:call-template>
						</div>
						<div class="styStdDiv" style="border-top:1px solid black;border-bottom:1px "/>
					</xsl:if>
					
					<!-- when table is more than 2 -->

					<xsl:if test="count($FormData/QlfyPassengerVehicleLoanIntGrp) &gt; 2">	
					<div class="styStdDiv" style="border-bottom:1px;border-top:1px solid black;"/>
						<div class="styLNLeftNumBoxSD">a</div>
						<div class="styLNDesc" style="width:112mm;height:auto;border-right:1px solid black;">
							See additional table
						</div>
						<div class="styLNDesc" style="width:34mm;height:auto;border-right:1px solid black;text-align:right;">
							&nbsp;
						</div>
						<div class="styLNDesc" style="width:30mm;height:auto;text-align:right;">
							&nbsp;
						</div>
						<div class="styStdDiv" style="border-top:1px solid black;border-bottom:1px "/>
						<div class="styLNLeftNumBoxSD">b</div>
						<div class="styLNDesc" style="width:112mm;height:auto;border-right:1px solid black;">
							&nbsp;
						</div>
						<div class="styLNDesc" style="width:34mm;height:auto;border-right:1px solid black;text-align:right;">
							&nbsp;
						</div>
						<div class="styLNDesc" style="width:30mm;height:auto;text-align:right;">
							&nbsp;
						</div>
						<div class="styStdDiv" style="border-top:1px solid black;border-bottom:1px "/>
					
					</xsl:if>
                    <!--Line 22 Data table End-->
                    
	         <!-- Line 23 -->					 
					<div class="styStdDivNoScroll">
						<div class="styLNLeftNumBoxSD">23</div>
						<div class="styLNDesc" style="font-size:8pt">
							Add lines 22a and 22b, column (iii)<span class="sty1040Sch1ADotLn">.....................</span>
						</div>
						<div class="styLNRightNumBox">23</div>
						<div class="sty1040Sch1AAmountBox">
							<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/TotQualifiedCarLoanInterestAmt"/>
							</xsl:call-template>
						</div>
					</div>
					
					<!-- Line 24 -->
					<div class="styStdDivNoScroll">
						<div class="styLNLeftNumBoxSD">24</div>
						<div class="styLNDesc" style="font-size:8pt">
							Enter the smaller of the amount on line 23 or $10,000
							<span class="sty1040Sch1ADotLn">..............</span>
						</div>
						<div class="styLNRightNumBox">24</div>
						<div class="sty1040Sch1AAmountBox">
							<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/SmallerCarLoanIntOrMaxDedAmt"/>
							</xsl:call-template>
						</div>
					</div>					

                 <!-- Line 25 -->
					<div class="styStdDivNoScroll">
						<div class="styLNLeftNumBoxSD">25</div>
						<div class="styLNDesc" style="font-size:8pt">
							Enter the amount from line 3<span class="sty1040Sch1ADotLn">......................</span>
						</div>
						<div class="styLNRightNumBox">25</div>
						<div class="sty1040Sch1AAmountBox">
							<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/ModifiedAGIAmt"/>
							</xsl:call-template>
						</div>
					</div>
					
					<!-- Line 26 -->
					<div class="styStdDivNoScroll">
						<div class="styLNLeftNumBoxSD">26</div>
						<div class="styLNDesc" style="font-size:8pt">
							Enter $100,000 ($200,000 if married filing jointly)<span class="sty1040Sch1ADotLn">...............</span>
						</div>
						<div class="styLNRightNumBox">26</div>
						<div class="sty1040Sch1AAmountBox">
							<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/CarLnIntFilingStatusThrshldAmt"/>
							</xsl:call-template>
						</div>
					</div>
					
				    <!-- Line 27 -->
					<div class="styStdDivNoScroll">
						<div class="styLNLeftNumBoxSD">27</div>
						<div class="styLNDesc" style="font-size:8pt">
							Subtract line 26 from line 25. If zero or less, enter amount from line 24 on line 30 <span class="sty1040Sch1ADotLn">.</span>
						</div>
						<div class="styLNRightNumBox">27</div>
						<div class="sty1040Sch1AAmountBox">
							<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/CarLnIntMAGILessThrshldAmt"/>
							</xsl:call-template>
						</div>
					</div>
					
						 <!-- Line 28 -->
					<div class="styStdDivNoScroll">
						<div class="styLNLeftNumBoxSD">28</div>
						<div class="styLNDesc" style="font-size:8pt;height:8mm;">
Divide line 27 by $1,000. If the resulting number isn't a whole number, increase the result to <br/>the  next higher whole number. (For example, increase 1.5 to 2, and increase 0.05 to 1.)<span class="sty1040Sch1ADotLn">..</span>
						</div>
						<div class="styLNRightNumBox" style="height:8mm;padding-top:4mm;">28</div>
						<div class="sty1040Sch1AAmountBox" style="height:8mm;padding-top:4mm;font-size:5.7pt;">
							<xsl:call-template name="PopulateText">
							<xsl:with-param name="TargetNode" select="$FormData/CarLnIntMAGILessThrshldDivNum"/>
							</xsl:call-template>
						</div>
					</div>
					
				         <!-- Line 29 -->
					<div class="styStdDivNoScroll">
						<div class="styLNLeftNumBoxSD">29</div>
						<div class="styLNDesc" style="font-size:8pt">
							Multiply line 28 by $200<span class="sty1040Sch1ADotLn">........................</span>
						</div>
						<div class="styLNRightNumBox">29</div>
						<div class="sty1040Sch1AAmountBox">
							<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/CarLnIntMAGILessThrshldRedAmt"/>
							</xsl:call-template>
						</div>
					</div>
					
					     <!-- Line 30 -->
					<div class="styStdDivNoScroll">
						<div class="styLNLeftNumBoxSD">30</div>
						<div class="styLNDesc" style="font-size:8pt">
							<b>Qualified car loan interest deduction.</b> Subtract line 29 from line 24. If zero or less, enter -0-<span class="sty1040Sch1ADotLn">..</span>
						</div>
						<div class="styLNRightNumBox">30</div>
						<div class="sty1040Sch1AAmountBox">
							<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/QualifiedCarLoanInterestDedAmt"/>
							</xsl:call-template>
						</div>
					</div>
					
					<div class="styStdDiv" style="border-top:1px solid black;border-bottom:1px solid black;">
       					<!--Part V-->
						<div class="styPartName" style="padding-top:.25mm;">Part V</div>
						<div class="styPartDesc" style="padding-top:.25mm;">Enhanced Deduction for Seniors</div>
					</div>							
						
					<div style="width:185mm;font-size:7.8pt">
						<b>Caution:</b>
				You and/or your spouse must have a valid social security number. If married, you must file jointly to claim this deduction.<br/>
See instructions.</div>		
												
<div class="styStdDiv" style="border-top:1px solid black;border-bottom:1px "></div>	
						<!-- Line 31 -->
					<div class="styStdDivNoScroll">
						<div class="styLNLeftNumBoxSD">31</div>
						<div class="styLNDesc" style="font-size:8pt">
							Enter the amount from line 3<span class="sty1040Sch1ADotLn">.......................</span>
						</div>
						<div class="styLNRightNumBox">31</div>
						<div class="sty1040Sch1AAmountBox">
							<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/ModifiedAGIAmt"/>
							</xsl:call-template>
						</div>
					</div>

						<!-- Line 32 -->
					<div class="styStdDivNoScroll">
						<div class="styLNLeftNumBoxSD">32</div>
						<div class="styLNDesc" style="font-size:8pt">
							Enter $75,000 ($150,000 if married filing jointly)<span class="sty1040Sch1ADotLn">................</span>
						</div>
						<div class="styLNRightNumBox">32</div>
						<div class="sty1040Sch1AAmountBox">
							<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/EnhncSrDedFSThrshldAmt"/>
							</xsl:call-template>
						</div>
					</div>

						<!-- Line 33 -->
					<div class="styStdDivNoScroll">
						<div class="styLNLeftNumBoxSD">33</div>
						<div class="styLNDesc" style="font-size:8pt">
							Subtract line 32 from line 31. If zero or less, enter $6,000 on line 35<span class="sty1040Sch1ADotLn">.........</span>
						</div>
						<div class="styLNRightNumBox">33</div>
						<div class="sty1040Sch1AAmountBox">
							<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/EnhncSrDedMAGILessThrshldAmt"/>
							</xsl:call-template>
						</div>
					</div>
					
                 <!-- Line 34 -->
					<div class="styStdDivNoScroll">
						<div class="styLNLeftNumBoxSD">34</div>
						<div class="styLNDesc" style="font-size:8pt">
							Multiply line 33 by 6% (0.06)<span class="sty1040Sch1ADotLn">.......................</span>
						</div>
						<div class="styLNRightNumBox">34</div>
						<div class="sty1040Sch1AAmountBox">
							<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/EnhnSrDedMAGILessThrshldRedAmt"/>
							</xsl:call-template>
						</div>
					</div>
					
					<!-- Line 35 -->
					<div class="styStdDivNoScroll">
						<div class="styLNLeftNumBoxSD">35</div>
						<div class="styLNDesc" style="font-size:8pt">
							Subtract line 34 from $6,000. If zero or less, enter -0-.<span class="sty1040Sch1ADotLn">..............</span>
						</div>
						<div class="styLNRightNumBox">35</div>
						<div class="sty1040Sch1AAmountBox">
							<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/SpecfiedDolLessThrshldRedAmt"/>
							</xsl:call-template>
						</div>
					</div>
					
					<!-- Line 36a -->
					<div class="styStdDivNoScroll">
						<div class="styLNLeftNumBoxSD">36a</div>
						<div class="styLNDesc" style="font-size:8pt;height:8mm;">
							If you have a valid social security number (see instructions) and were born before January 2,<br/> 1961, enter the amount from line 35<span class="sty1040Sch1ADotLn">....................</span>
						</div>
						<div class="styLNRightNumBox" style="height:8mm;padding-top:4mm;">36a</div>
						<div class="sty1040Sch1AAmountBox" style="height:8mm;padding-top:4mm;">
							<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/PrimaryEnhancedSeniorDedAmt"/>
							</xsl:call-template>
						</div>
					</div>

						<!-- Line 36b -->
								<div class="styStdDivNoScroll">
						<div class="styLNLeftNumBoxSD" style="padding-left:6mm;">b</div>
						<div class="styLNDesc" style="font-size:8pt;height:10mm;">
							If you are married filing jointly, your spouse has a valid social security number <br/> (see instructions), and your spouse was born before January 2, 1961, enter the amount from line 35<span class="sty1040Sch1ADotLn">...............................</span>
						</div>
						<div class="styLNRightNumBox" style="height:10mm;padding-top:6mm;">36b</div>
						<div class="sty1040Sch1AAmountBox" style="height:10mm;padding-top:6mm;">
							<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/SpouseEnhancedSeniorDedAmt"/>
							</xsl:call-template>
						</div>
					</div>
						<!-- Line 37 -->
					<div class="styStdDivNoScroll">
						<div class="styLNLeftNumBoxSD">37</div>
						<div class="styLNDesc" style="font-size:8pt">
							<b>Enhanced deduction for seniors.</b> Add lines 36a and 36b <span class="sty1040Sch1ADotLn">............</span>
						</div>
						<div class="styLNRightNumBox">37</div>
						<div class="sty1040Sch1AAmountBox">
							<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/EnhancedSeniorDeductionAmt"/>
							</xsl:call-template>
						</div>
					</div>
					
					<div class="styStdDiv" style="border-top:1px solid black;border-bottom:1px solid black;">
					
       					<!--Part VI-->
		<div class="styStdDiv" style="border-top:1px solid black;border-bottom:1px solid black;">
       					<!--Part VI-->
						<div class="styPartName" style="padding-top:.25mm;">Part VI</div>
						<div class="styPartDesc" style="padding-top:.25mm;">Total Additional Deductions</div>
					</div>		
					
												
<div class="styStdDiv" style="border-top:1px solid black;border-bottom:1px "></div>	
						<!-- Line 38 -->
					<div class="styStdDivNoScroll">
						<div class="styLNLeftNumBoxSD">38</div>
						<div class="styLNDesc" style="font-size:8pt;height:8mm;">
							Add lines 13, 21, 30, and 37. Enter here and on Form 1040 or 1040-SR, line 13b, or on Form<br/> 1040-NR,
line 13c<span class="sty1040Sch1ADotLn">...........................</span>
						</div>
						<div class="styLNRightNumBox" style="height:8mm; padding-top:4mm;">38</div>
						<div class="sty1040Sch1AAmountBox" style="height:8mm;padding-top:4mm;">
							<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/TotalAdditionalDeductionsAmt"/>
							</xsl:call-template>
						</div>
					</div>					
						</div>		
					 <!-- Page 2 Form footer-->
					<div class="styStdDiv pageEnd" style="border-top:1px solid black;">
						
						<span style="float:right;font-size:6.5pt;"><b>Schedule 1-A (Form 1040) 2025 </b></span> 	
					</div>					       
						 
								
					<!-- begin of extra page -->
					<xsl:if test="count($FormData/QlfyPassengerVehicleLoanIntGrp) &gt; 2">	
					<div class="styStdDiv">
						Schedule 1-A (Form 1040) 2025					
					</div>
					<!-- Continue table of part4 line 22 -->
					
					<div class="styStdDiv" style="border-top:1px solid black;">						
						<span class="styPartDesc" style="font-size:9pt;">
							<strong>Applicable Passenger Information Table Continued</strong>
						</span>
					</div>
					<div class="styStdDiv" style="border-top:1px solid black;border-bottom:1px "/>
					<div class="styLNDesc" style="width:120mm;height:auto;min-height:14mm;border-right:1px solid black;">
						<center>	(i) Vehicle identification number (VIN)</center><br/>		</div>
					<div class="styLNDesc" style="width:67mm;">
						<center>
									Interest for this loan:</center>
					</div>
					<div class="styLNDesc" style="width:34mm;height:auto;min-height:10mm;border-right:1px solid black;border-top:1px solid black;">
						<center>				
							<b> 	(ii)</b> Deducted on Schedule C, Schedule E, <br/> or Schedule F </center>
					</div>
					<div class="styLNDesc" style="width:33mm;height:auto;min-height:10mm;border-top:1px solid black;padding-top:3mm;">
						<center> <b> 	(iii)</b> Schedule 1-A</center>
					</div>
					<xsl:if test="count($FormData/QlfyPassengerVehicleLoanIntGrp) &gt; 2">
					<xsl:for-each select="$FormData/QlfyPassengerVehicleLoanIntGrp">
						<xsl:variable name="pos" select="position()"/>
						<div class="styStdDiv" style="border-bottom:1px;border-top:1px solid black;"/>
						<div class="styLNLeftNumBoxSD"><xsl:number value="position()" format="a"/></div>
						<div class="styLNDesc" style="width:112mm;height:auto;border-right:1px solid black;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/QlfyPassengerVehicleLoanIntGrp[$pos]/VIN"/>
							</xsl:call-template>
						</div>
						<div class="styLNDesc" style="width:34mm;height:auto;border-right:1px solid black;text-align:right;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/QlfyPassengerVehicleLoanIntGrp[$pos]/QualifiedCarLoanIntDedSchAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNDesc" style="width:30mm;height:auto;text-align:right;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/QlfyPassengerVehicleLoanIntGrp[$pos]/QualifiedCarLoanInterestAmt"/>
							</xsl:call-template>
						</div>
						<div class="styStdDiv" style="border-top:1px solid black;border-bottom:1px "/>
						</xsl:for-each>
					</xsl:if>
	
					<div class="styStdDiv pageEnd" style="border-top:2px solid black;">
						<span style="float:right;">
							<strong>Schedule 1-A (Form 1040) 2025</strong>
						</span>
					</div> 	
		         </xsl:if>
				<!-- BEGIN Left Over Table -->
					<!-- Additonal Data Title Bar and Button -->
 		<div class="styLeftOverTitleLine" id="LeftoverData">
						<div class="styLeftOverTitle">
							Additional Data        
						</div>
						<div class="styLeftOverButtonContainer">
							<input class="styLeftoverTableBtn" TabIndex="1" type="button" value="Return to Form" onclick="javascript:returnToWriteInImage();"/>
						</div>
					</div> 
					<!-- Additional Data Table --> 
			 		<table class="styLeftOverTbl">
						<xsl:call-template name="PopulateCommonLeftover">
							<xsl:with-param name="TargetNode" select="$FormData"/>
							<xsl:with-param name="DescWidth" select="100"/>
						</xsl:call-template>
					</table> 
					
			     </form>
			</body> 
			
		</html>
</xsl:template>
<!--
	<xsl:template name="FillTable4Cols">
		<xsl:param name="LineNumber"/>
		<xsl:param name="SepMessage" select="false()"/>
		<xsl:param name="MaxLine" select="4"/>
		<tr>
			<td class="styTableCellTextInherit" style="font-weight:bold;"><xsl:number value="$LineNumber" format="A"/></td>
			<td class="styTableCellCtrInherit">
				<xsl:choose>
					<xsl:when test="$SepMessage">
                    See Additional Data Table
				</xsl:when>
					<xsl:otherwise>&nbsp;</xsl:otherwise>
				</xsl:choose>
			</td>
			<td class="styTableCellAmtInherit">&nbsp;</td>
			<td class="styTableCellAmtInherit" style="border-right-width:0px;">&nbsp;</td>
		</tr>
		<xsl:choose>
			<xsl:when test="$SepMessage">
				<xsl:call-template name="FillTable4Cols">
					<xsl:with-param name="LineNumber" select="2"/>
					<xsl:with-param name="SepMessage" select="false()"/>
				</xsl:call-template>
			</xsl:when>
			<xsl:when test="$LineNumber &lt; $MaxLine">
				<xsl:call-template name="FillTable4Cols">
					<xsl:with-param name="LineNumber" select="$LineNumber + 1"/>
					<xsl:with-param name="MaxLine" select="$MaxLine"/>
				</xsl:call-template>
			</xsl:when>
			<xsl:otherwise/>
		</xsl:choose>
	</xsl:template>
	-->
</xsl:stylesheet>