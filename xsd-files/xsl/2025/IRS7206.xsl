<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE xsl:stylesheet [
  <!ENTITY nbsp "&#160;">
  <!ENTITY mdash "&#8212;">
]>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:include href="PopulateTemplate.xsl" />
	<xsl:include href="AddHeader.xsl" />
	<xsl:include href="CommonPathRef.xsl" />
	<xsl:include href="AddOnTable.xsl" />
	<xsl:include href="IRS7206Style.xsl" />
	<xsl:output method="html" indent="yes" />
	<xsl:strip-space elements="*" />
	<xsl:param name="FormData" select="$RtnDoc/IRS7206" />
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
				<meta name="Description" content="IRS Form 7206" />
				<script language="JavaScript" src="{$ScriptPath}/FormDisplay.js" type="text/javascript" />
				<xsl:call-template name="InitJS" />
				<style type="text/css">
					<xsl:if test="not($Print) or $Print=''">
						<xsl:call-template name="IRS7206Style" />
						<xsl:call-template name="AddOnStyle" />
					</xsl:if>
				</style>
				<xsl:call-template name="GlobalStylesForm" />
			</head>
			<body class="styBodyClass">
				<form id="Form7206">
					<xsl:call-template name="DocumentHeader" />
					<!-- Page 1 -->
					<!-- Header -->
					<div class="styStdDiv">
						<div class="styFNBox" style="width:30mm;height:22.5mm;">
							Form <span class="styFN" style="font-size:18pt;">7206</span> 
							<br />
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$FormData" />
							</xsl:call-template>
							<br />
							<span class="styAgency" style="padding-top:5.5mm;">
								Department of the Treasury <br/>
								Internal Revenue Service
							</span>
						</div>
						<div class="styFTBox" style="width:127mm;height:22.5mm;">
							<span class="styFMT" style="font-size:14pt;padding-top:1mm;padding-bottom:1mm;">Self-Employed Health Insurance Deduction</span>
							<span style="font-weight:bold;padding-top:7mm;">
								Attach to Form 1040, 1040-SR, or 1040-NR.
							</span><br/>
							<span style="font-weight:bold;">
								Go to
								<span style="font-style:italic">www.irs.gov/Form7206</span>
								for instructions and the latest information.
							</span>
						</div>
						<div class="styTYBox" style="width:30mm;height:22.5mm;">
							<div class="styOMB" style="height:auto;font-size:6pt;">OMB No. 1545-0074</div>
							<div class="styTY">20<span class="styTYColor">25</span></div>
							<div style="margin-left:3mm;text-align:left;font-size:7pt;">
								Attachment<br/>Sequence No. 
								<span class="styBoldText" style="font-size:9pt;">206</span>
							</div>
						</div>
					</div>
					<!-- Filer information section -->
					<div class="sty7206LineDiv" style="border-top:2px solid black;">
						<div class="styNameBox" style="width:135mm;">
							<span style="width:0.5mm;height:1mm;"/> Name(s) shown on return <br/>  
						<xsl:call-template name="PopulateText">
							<xsl:with-param name="TargetNode" select="$FormData/NameLine1Txt"/>
							</xsl:call-template>
						</div>
						<div class="styEINBox" style="width:52mm;padding-left:0.5mm;font-weight:normal;">
							<span style="width:0.5mm;height:1mm;"/> <strong> Your taxpayer identification number</strong>
							<br/>
							<xsl:call-template name="PopulateSSN">
								<xsl:with-param name="TargetNode" select="$FormData/SSN"/>
							</xsl:call-template>
						</div>
					</div>
					<div class="sty7206LineDiv" style="border-top:1px solid black;border-bottom:1px solid black;">
						<div class=""><b>Note: </b></div>
						<div class="">Use a separate Form 7206 for each trade or business under which an insurance plan is established.</div>
					</div>
					<!-- Line 1 -->
					<div class="sty7206LineDiv" style="height:11mm;">
						<div class="styLNLeftNumBoxSD">1</div>
						<div class="styLNDesc" style="height:11mm;">
							Enter the total amount paid in 2025 for health insurance coverage established under your business<br/>
							(or the S corporation in which you were a more-than-2% shareholder) for 2025 for you, your spouse,<br/>and your dependents. But <b>don’t</b> include the following. See instructions
							<span class="sty7206DotLn">............</span><br/>																			
						</div>
						<div class="styLNRightNumBox" style="height:11mm; padding-top:7mm" >1</div>						
						<div class="styLNAmountBox" style="height:11mm;padding-top:7mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TotalHealthInsurancePaidAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<div class="sty7206LineDiv" style="height:19mm;">			
						<div class="styLNLeftNumBoxSD"></div>
						<div class="styLNDesc" style="height:19mm;">
							• Amounts for any month you were eligible to participate in a health plan subsidized by your<br/>
							employer or your spouse’s employer or the employer of either your dependent or your child who was<br/>
							under the age of 27 at the end of 2025.<br/>
							• Any amounts paid, not to exceed $3,000, from retirement plan distributions that were <b>nontaxable</b><br/>
							because you are a retired public safety officer. See instructions.<br/>
							• Any payments for qualified long-term care insurance (see line 2).	
						</div>
						<div class="styLNRightNumBox" style="height:19mm;background-color:lightgray;border-bottom-width:0mm;"></div> 
						<div class="styLNAmountBox" style="height:19mm;border-bottom-width:0mm;">
							&nbsp;
						</div>
					</div>
					<!-- Line 2 -->
					<div class="sty7206LineDiv" style="height:46mm;">
						<div class="styLNLeftNumBoxSD">2</div>
						<div class="styLNDesc" style="height:46mm;">
							For coverage under a qualified long-term care insurance contract, enter for each person covered the <br/><b>smaller</b> of (a) or (b).<br/>
							<b>(a)</b> <span style="padding-left:2mm">Total payments made for that person during the year.</span><br/>
							<b>(b)</b><span style="padding-left:2mm"> The amount shown below. Use the person’s age at the end of the tax year.</span><br/>
							<span style="padding-left:14mm">$480— if that person is age 40 or younger<br/>
							$900— if age 41 to 50<br/>
							$1,800— if age 51 to 60<br/>
							$4,810— if age 61 to 70<br/>
							$6,020— if age 71 or older<br/></span><br/>
							<span style="padding-left:7mm"><b>Note:</b> The amount of long-term care premiums that can be included as a medical expense is<br/>
							limited by the person’s age. <b>Don’t</b> include payments for any month you were eligible to<br/>
							participate in a long-term care insurance plan subsidized by your employer or your spouse’s<br/>
							employer, or the employer of either your dependent or your child who was under the age of 27<br/>
							at the end of 2025. If more than one person is covered, figure separately the amount to enter<br/>
							for each person. Then enter the total of those amounts
							<span class="sty7206DotLn" style="padding-left:2mm">...............</span></span>
						</div>
						<div class="styLNRightNumBox" style="height:46mm;padding-top:42mm;">2</div>
						<div class="styLNAmountBox" style="height:46mm;padding-top:42mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TotQlfyLTCareInsDedAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 3 -->
					<div class="sty7206LineDiv" style="">
						<div class="styLNLeftNumBoxSD" style="">3</div>
						<div class="styLNDesc" style="">
							Add lines 1 and 2 
							<span class="sty7206DotLn">............................</span>
						</div>
						<div class="styLNRightNumBox" style="">3</div>
						<div class="styLNAmountBox" style="">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TotHlthInsQlfyLTCareInsDedAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 4 -->
					<div class="sty7206LineDiv" style="height:11mm;">
						<div class="styLNLeftNumBoxSD" style="height:11mm;">4</div>
						<div class="styLNDesc" style="">
							Enter your net profit* and any other earned income** from the trade or business under which the<br/>
							insurance plan is established. Don’t include Conservation Reserve Program payments exempt from<br/>
							self-employment tax. If the business is an S corporation, skip to line 11
							<span class="sty7206DotLn">............</span>
						</div>
						<div class="styLNRightNumBox" style="height:11mm;padding-top:7mm">4</div>
						<div class="styLNAmountBox" style="height:11mm;padding-top:7mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/NetPrftOthEarnedIncmAmt"/>
							</xsl:call-template>
						</div>					
					</div>
					<!-- Line 5 -->
					<div class="sty7206LineDiv" style="height:16mm;">
						<div class="styLNLeftNumBoxSD" style="height:16mm;">5</div>
						<div class="styLNDesc" style="">
							Enter the total of all net profits* from Schedule C (Form 1040), line 31; Schedule F (Form 1040), line<br/>
							34; or Schedule K-1 (Form 1065), box 14, code A, plus any other income allocable to the profitable<br/>
							businesses. Don’t include Conservation Reserve Program payments exempt from self-employment<br/>
							tax. See the Instructions for Schedule SE (Form 1040). <b>Don’t</b> include any net losses shown on these<br/>
							schedules
							<span class="sty7206DotLn">..............................</span>
						</div>
						<div class="styLNRightNumBox" style="height:16mm;padding-top:11.5mm">5</div>
						<div class="styLNAmountBox" style="height:16mm;padding-top:11.5mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TotNetPrftIncmAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 6 -->
					<div class="sty7206LineDiv" style="">
						<div class="styLNLeftNumBoxSD">6</div>
						<div class="styLNDesc" style="">
							Divide line 4 by line 5
							<span class="sty7206DotLn">...........................</span>
						</div>
						<div class="styLNRightNumBox">6</div>
						<div class="styLNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/OthEarnedIncmDivTotNetPrftPct"/>
							</xsl:call-template>
						</div>					
					</div>
					<!-- Line 7 -->
					<div class="sty7206LineDiv" style="">
						<div class="styLNLeftNumBoxSD">7</div>
						<div class="styLNDesc" style="height:7.5mm;">
							Multiply Schedule 1 (Form 1040), line 15, deductible part of self-employment tax, by the percentage<br/>
							on line 6
							<span class="sty7206DotLn">...............................</span>
						</div>
						<div class="styLNRightNumBox" style="height:7.5mm;"><br/>7</div>
						<div class="styLNAmountBox" style="height:7.5mm;"><br/>
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/DedSETaxMultiplyPctAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 8 -->
					<div class="sty7206LineDiv" style="">
						<div class="styLNLeftNumBoxSD" style="">8</div>
						<div class="styLNDesc" style="">
							Subtract line 7 from line 4
							<span class="sty7206DotLn">.........................</span>
						</div>
						<div class="styLNRightNumBox">8</div>
						<div class="styLNAmountBox" style="">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/PctLessNetPrftOthEarnedIncmAmt"/>
							</xsl:call-template>
						</div>					
					</div>
					<!-- Line 9 -->
					<div class="sty7206LineDiv" style="height:7.5mm;">
						<div class="styLNLeftNumBoxSD" style="height:7.5mm;">9</div>
						<div class="styLNDesc" style="">
							Enter the amount, if any, from Schedule 1 (Form 1040), line 16, self-employed SEP, SIMPLE, and<br/>
							qualified plans, attributable to the same trade or business in which the insurance plan is established							
						</div>
						<div class="styLNRightNumBox" style="height:7.5mm;"><br/>9</div>
						<div class="styLNAmountBox" style="height:7.5mm;"><br/>
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/SelfEmpldSepSimpleQlfyPlansAmt"/>
							</xsl:call-template>
						</div>					
					</div>
					<!-- Line 10 -->								
					<div class="sty7206LineDiv" style="">
						<div class="styLNLeftNumBox">10</div>
						<div class="styLNDesc" style="">
							Subtract line 9 from line 8
							<span class="sty7206DotLn">.........................</span>
						</div>
						<div class="styLNRightNumBox" style="">10</div>
						<div class="styLNAmountBox" style="">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/PctMinusSEQlfyPlansAmt"/>
							</xsl:call-template>
						</div>					
					</div>
					<!-- Line 11 -->
					<div class="sty7206LineDiv" style="height:8mm;">
						<div class="styLNLeftNumBox">11</div>
						<div class="styLNDesc" style="height:8mm;">
							Enter your Medicare wages (box 5 of Form W-2) from an S corporation in which you are a more-<br/> than-2% shareholder and in which the insurance plan is established
							<span class="sty7206DotLn">............</span>
						</div>
						<div class="styLNRightNumBox" style="height:8mm;padding-top:3mm">11</div>
						<div class="styLNAmountBox" style="height:8mm;padding-top:3mm">
							<xsl:call-template name="PopulateAmount">							
								<xsl:with-param name="TargetNode" select="$FormData/MedicareWagesAndTipsAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 12 -->
					<div class="sty7206LineDiv" style="">
						<div class="styLNLeftNumBox">12</div>
						<div class="styLNDesc" style="">
							Enter any amount from Form 2555, line 45, attributable to the amount entered on line 4 or 11 above
						</div>
						<div class="styLNRightNumBox">12</div>
						<div class="styLNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/Form2555Amt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 13 -->
					<div class="sty7206LineDiv" style="">
						<div class="styLNLeftNumBox">13</div>
						<div class="styLNDesc" style="">
							Subtract line 12 from line 10 or 11, whichever applies
							<span class="sty7206DotLn">.................</span>
						</div>
						<div class="styLNRightNumBox">13</div>
						<div class="styLNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/SubtractForm2555Amt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 14 -->
					<div class="sty7206LineDiv" style="height:10mm;">
						<div class="styLNLeftNumBox" style="height:10mm;">14</div>
						<div class="styLNDesc" style="height:10mm;">
							<b>Self-employed health insurance deduction. </b>Enter the <b>smaller</b> of line 3 or line 13 here and on<br/>Schedule 1 (Form 1040), line 17.<b> Don’t </b> include this amount when figuring any medical expense<br/>deduction on Schedule A (Form 1040)
							<span class="sty7206DotLn">.....................</span>
						</div>
						<div class="styLNRightNumBoxNBB" style="height:10mm;padding-top:6mm">14</div>
						<div class="styLNAmountBoxNBB" style="height:10mm;padding-top:6mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/SelfEmpldHealthInsDedAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<div class="sty7206LineDiv" style="border-top:0.5px solid black;border-bottom:1px solid black;">
						<div>* If you used either optional method to figure your net earnings from self-employment from any business, don’t enter your net profit from the business.
Instead, enter the amount attributable to that business from Schedule SE (Form 1040), Part I, line 4b.<br/>
** <b>Earned income</b> includes net earnings and gains from the sale, transfer, or licensing of property you created. However, it doesn’t include capital gain income.
						</div>
					</div>
					<!-- Form footer -->
					<div class="styStdDiv pageEnd" style="border-top:2px solid black;">
						<b>For Privacy Act and Paperwork Reduction Act Notice, see separate instructions.</b>      
					    <span style="width:37mm; text-align:center;">Cat. No. 56399C </span>
						<span style="float:right;">Form <span style="font-weight:bold;font-size:9pt;">7206</span> (2025)</span>
					</div>
					<!-- Additional Data title bar and button -->
					<div class="styLeftOverTitleLine" id="LeftoverData">
						<div class="styLeftOverTitle">
							Additional Data        
						</div>
						<div class="styLeftOverButtonContainer">
							<input class="styLeftoverTableBtn" type="button" TabIndex="-1" value="Return to Form" onclick="javascript:returnToWriteInImage();"/>
						</div>
					</div>
					<!-- Additional Data table -->
					<table class="styLeftOverTbl">
						<xsl:call-template name="PopulateCommonLeftover">
							<xsl:with-param name="TargetNode" select="$FormData"/>
							<xsl:with-param name="DescWidth" select="100"/>
						</xsl:call-template>
					</table>				
					<br />
					<br />	
				</form>
			</body>
		</html>
	</xsl:template>
	<xsl:template name="P2ExLine">
		<xsl:param name="LineNum"/>
		<xsl:param name="Position"/>
		<xsl:param name="LineElement"/>
		<div class="sty7206LineDiv">
			<div class="styLNLeftNumBox" style="width:6.5mm;"><xsl:value-of select="$LineNum"/></div>
			<div class="sty7206AmtBoxEx">
				<xsl:call-template name="PopulateAmount">
					<xsl:with-param name="TargetNode" select="$FormData/ShareholderDebtBasisGrp[$Position]/*[local-name() = $LineElement]"/>
				</xsl:call-template>
			</div>
			<div class="sty7206AmtBoxEx">
				<xsl:call-template name="PopulateAmount">
					<xsl:with-param name="TargetNode" select="$FormData/ShareholderDebtBasisGrp[$Position + 1]/*[local-name() = $LineElement]"/>
				</xsl:call-template>
			</div>
			<div class="sty7206AmtBoxEx">
				<xsl:call-template name="PopulateAmount">
					<xsl:with-param name="TargetNode" select="$FormData/ShareholderDebtBasisGrp[$Position + 2]/*[local-name() = $LineElement]"/>
				</xsl:call-template>
			</div>
			<div class="sty7206AmtBoxEx">
				<xsl:call-template name="PopulateAmount">
					<xsl:with-param name="TargetNode" select="$FormData/ShareholderDebtBasisGrp[$Position + 3]/*[local-name() = $LineElement]"/>
				</xsl:call-template>
			</div>
			<div class="sty7206AmtBoxEx">
				<xsl:call-template name="PopulateAmount">
					<xsl:with-param name="TargetNode" select="$FormData/ShareholderDebtBasisGrp[$Position + 4]/*[local-name() = $LineElement]"/>
				</xsl:call-template>
			</div>
			<div class="sty7206AmtBoxEx">
				<xsl:call-template name="PopulateAmount">
					<xsl:with-param name="TargetNode" select="$FormData/ShareholderDebtBasisGrp[$Position + 5]/*[local-name() = $LineElement]"/>
				</xsl:call-template>
			</div>
		</div>
	</xsl:template>
</xsl:stylesheet>
