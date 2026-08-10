<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE xsl:stylesheet [
	<!ENTITY nbsp "&#160;"> 
	<!ENTITY mdash "&#8212;"> 
]>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fo="http://www.w3.org/1999/XSL/Format" version="1.0">
	<xsl:include href="PopulateTemplate.xsl"/>
	<xsl:include href="AddHeader.xsl"/>
	<xsl:include href="CommonPathRef.xsl"/>
	<xsl:include href="AddOnTable.xsl"/>
	<xsl:include href="IRS4626Style.xsl"/>
	<xsl:output method="html" indent="yes"/>
	<xsl:strip-space elements="*"/>
	<xsl:param name="FormData" select="$RtnDoc/IRS4626"/>
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
				<!--  No Browser Caching   -->
				<meta http-equiv="Pragma" content="no-cache"/>
				<meta http-equiv="Cache-Control" content="no-cache"/>
				<meta http-equiv="Expires" content="0"/>
				<!-- No Proxy Caching -->
				<meta http-equiv="Cache-Control" content="private"/>
				<!-- Define Character Set -->
				<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1"/>
				<meta name="Description" content="IRS Form 4626"/>
				<!-- javascript include -->
				<script language="JavaScript" src="{$ScriptPath}/FormDisplay.js" type="text/javascript"/>
				<xsl:call-template name="InitJS"/>
				<style type="text/css">
					<xsl:if test="not($Print) or $Print=''">
						<xsl:call-template name="IRS4626Style"/>
						<xsl:call-template name="AddOnStyle"/>
					</xsl:if>
				</style>
				<xsl:call-template name="GlobalStylesForm"/>
			</head>
			<body class="styBodyClass" style="width:187mm;">
				<xsl:call-template name="DocumentHeader"/>
				<!-- BEGIN FORM HEADER -->
				<div class="styStdDiv">
					<div class="styFNBox" style="width:30mm;height:16mm;">
						Form <span class="styFormNumber">4626</span>
						<xsl:call-template name="SetFormLinkInline">
							<xsl:with-param name="TargetNode" select="$FormData"/>
						</xsl:call-template>
						<br/>
						<span style="height:3.5mm;"/>
						<span class="styAgency">Department of the Treasury</span>
						<span class="styAgency">Internal Revenue Service</span>
					</div>
					<div class="styFTBox" style="width:124mm;height:16mm;padding-top:2mm;">
						<span class="styMainTitle">Alternative Minimum Tax—Corporations</span>
						<div class="styFST" style="padding-top:2mm;">
							Attach to the corporation's tax return.<br/>
							Go to <span style="font-style:italic;">www.irs.gov/Form4626</span> for instructions and the latest information.
						</div>
					</div>
					<div class="styTYBox" style="width:32mm;height:16mm;">
						<div class="styOMB" style="width:32mm;">OMB No. XXXX-XXXX</div>
						<div class="styTaxYear" style="text-align:center;padding-top:1mm;">
							20<span class="styTYColor">25</span>
						</div>
					</div>
				</div>
				<div class="styStdDiv" style="border-top:1px solid black;">
					<div class="styNameBox" style="width:130mm;font-size:7pt;">
						Name <br/>
						<xsl:call-template name="PopulateReturnHeaderFiler">
							<xsl:with-param name="TargetNode">BusinessNameLine1Txt</xsl:with-param>
						</xsl:call-template>
						<br/>
						<xsl:call-template name="PopulateReturnHeaderFiler">
							<xsl:with-param name="TargetNode">BusinessNameLine2Txt</xsl:with-param>
						</xsl:call-template>
					</div>
					<div class="styEINBox" style="width:50mm;padding-left:2mm;text-align:left;font-size:7pt;">
						<span style="font-weight:bold;">Employer identification number</span>
						<br/>
						<span style="font-weight:normal;padding-top:3mm;">
							<xsl:call-template name="PopulateReturnHeaderFilerTIN"/>
						</span>
					</div>
				</div>
				<!-- Form body -->
				<!--  Line A  -->
				<div class="styStdDiv" style="border-top:1px solid black;">
					<div class="styLNLeftNumBoxSD">A</div>
					<div class="styLNDesc" style="height:auto;width:154mm;padding-right:3.5mm;">
						Is the corporation filing this form a member of a controlled group treated as a single employer under sections <br/> 59(k)(1)(D) and 52?
						<span class="sty4626DotLn">..............................</span>
					</div>
					<div class="styGenericDiv" style="width:24mm;font-weight:bold;padding-top:3.0mm;">
						<span>
							<xsl:call-template name="PopulateSpan">
								<xsl:with-param name="TargetNode" select="$FormData/CtrlGrpTreatedSingleEmplrInd"/>
							</xsl:call-template>					
							<input type="checkbox" class="styCkboxNM" style="margin-right:2px;" aria-label="controlled group treated as a single employer Yes">
								<xsl:call-template name="PopulateYesCheckbox">
									<xsl:with-param name="TargetNode" select="$FormData/CtrlGrpTreatedSingleEmplrInd"/>
									<xsl:with-param name="BackupName">F4626CtrlGrpTreatedSingleEmplrInd</xsl:with-param>
								</xsl:call-template>
							</input>
							Yes
							<input type="checkbox" class="styCkboxNM" style="margin-right:2px;margin-left:3mm;" aria-label="controlled group treated as a single employer No">
								<xsl:call-template name="PopulateNoCheckbox">
									<xsl:with-param name="TargetNode" select="$FormData/CtrlGrpTreatedSingleEmplrInd"/>
									<xsl:with-param name="BackupName">F4626CtrlGrpTreatedSingleEmplrInd</xsl:with-param>
								</xsl:call-template>
							</input>
							No
						</span>
					</div>
				</div>
				<div class="styStdDiv">
					<div class="styLNLeftNumBox">&nbsp;</div>
					<div class="styLNDesc" style="height:auto;width:154mm;padding-right:3.5mm;text-align:justify;">
						If "Yes," the corporation must complete Part V listing the names, EINs, and separate company financial 
						statement income or loss for each member of the controlled group treated as a single employer taken into account in the determination 
						of "applicable corporation" under section 59(k)(1)(D).
					</div>
				</div>
				<!-- Line B -->
				<div class="styStdDiv" style="">
					<div class="styLNLeftNumBoxSD">B</div>
					<div class="styLNDesc" style="height:auto;width:154mm;padding-right:3.5mm;">
						Is the corporation filing this form a member of a foreign-parented multinational group (FPMG) within the 
						meaning of section 59(k)(2)(B)?
						<span class="sty4626DotLn">..............................</span>
					</div>
					<div class="styGenericDiv" style="width:24mm;font-weight:bold;padding-top:3.0mm;">
						<span>
							<xsl:call-template name="PopulateSpan">
								<xsl:with-param name="TargetNode" select="$FormData/FPMGMemberInd"/>
							</xsl:call-template>					
							<input type="checkbox" class="styCkboxNM" style="margin-right:2px;" aria-label="foreign-parented multinational group Yes">
								<xsl:call-template name="PopulateYesCheckbox">
									<xsl:with-param name="TargetNode" select="$FormData/FPMGMemberInd"/>
									<xsl:with-param name="BackupName">F4626FPMGMemberInd</xsl:with-param>
								</xsl:call-template>
							</input>
							Yes
							<input type="checkbox" class="styCkboxNM" style="margin-right:2px;margin-left:3mm;" aria-label="foreign-parented multinational group No">
								<xsl:call-template name="PopulateNoCheckbox">
									<xsl:with-param name="TargetNode" select="$FormData/FPMGMemberInd"/>
									<xsl:with-param name="BackupName">F4626FPMGMemberInd</xsl:with-param>
								</xsl:call-template>
							</input>
							No
						</span>						
					</div>
				</div>
				<div class="styStdDiv">
					<div class="styLNLeftNumBox">&nbsp;</div>
					<div class="styLNDesc" style="height:auto;width:154mm;padding-right:3.5mm;text-align:justify;">
						If "Yes," the corporation must complete Part V listing the names, EINs, and separate company financial 
						statement income or loss for each member of the FPMG under section 59(k)(2)(B).
					</div>
				</div>
				<!-- Line C -->
				<div class="styStdDiv" style="">
					<div class="styLNLeftNumBoxSD">C</div>
					<div class="styLNDesc" style="height:auto;width:154mm;padding-right:3.5mm;">
						Has the corporation filing this form already determined it is an applicable corporation in current or prior years for purposes of 
 the corporate alternative minimum tax (CAMT)?         
						<span class="sty4626DotLn">..................</span>
					</div>
					<div class="styGenericDiv" style="width:24mm;font-weight:bold;padding-top:3.0mm;">
						<span>
							<xsl:call-template name="PopulateSpan">
								<xsl:with-param name="TargetNode" select="$FormData/ApplcblCorpDeterminationInd"/>
							</xsl:call-template>					
							<input type="checkbox" class="styCkboxNM" style="margin-right:2px;" aria-label="Applicable corporate determination indicator Yes">
								<xsl:call-template name="PopulateYesCheckbox">
									<xsl:with-param name="TargetNode" select="$FormData/ApplcblCorpDeterminationInd"/>
									<xsl:with-param name="BackupName">F4626ApplcblCorpDeterminationInd</xsl:with-param>
								</xsl:call-template>
							</input>
							Yes
							<input type="checkbox" class="styCkboxNM" style="margin-right:2px;margin-left:3mm;" aria-label="Applicable corporate determination indicator No">
								<xsl:call-template name="PopulateNoCheckbox">
									<xsl:with-param name="TargetNode" select="$FormData/ApplcblCorpDeterminationInd"/>
									<xsl:with-param name="BackupName">F4626ApplcblCorpDeterminationInd</xsl:with-param>
								</xsl:call-template>
							</input>
							No
						</span>							
					</div>
				</div>
				<div class="styStdDiv">
					<div class="styLNLeftNumBox">&nbsp;</div>
					<div class="styLNDesc" style="height:auto;width:154mm;padding-right:3.5mm;text-align:justify;">
						If "Yes," skip Part I and continue to Part II. If "No," complete Part I. 
					</div>
				</div>
				<!-- Part I - Header -->
				<div class="styStdDiv" style="border-top:1px solid black;border-bottom:1px solid black;">
					<span class="styPartName" style="width:16mm;">Part I</span>
					<span class="styPartDesc" style="width:170mm;height:auto;font-weight:normal;">
						<strong>Applicable Corporation Determination</strong> (Report all amounts in U.S. dollars.) <br/>
					</span>
				</div>
				<!-- head line -->
				<div class="styStdDiv" style="">
					<div class="styLNLeftNumBox">&nbsp;</div>
					<div class="sty4626ShortDesc" style="">&nbsp;</div>
					<div class="sty4626RightNumBox" style="height:14mm;border-left-width:0px;">&nbsp;</div>
					<div class="sty4626AmtBox" style="height:14mm;text-align:center;">
						<strong>(a)</strong>
						<br/> First Preceding <br/> Year Ended <br/>
						<span style="width:80%;height:3.5mm;border-bottom:1px solid black;">
							<xsl:call-template name="PopulateMonthDayYear">
								<xsl:with-param name="TargetNode" select="$FormData/ApplcblCorpDeterminationGrp/FirstPrecYrAnnualAFSIGrp/TaxYearEndDt"/>
							</xsl:call-template>
						</span>
					</div>
					<div class="sty4626AmtBox" style="height:14mm;text-align:center;">
						<strong>(b)</strong>
						<br/> Second Preceding <br/> Year Ended <br/>
						<span style="width:80%;min-height:3.5mm;border-bottom:1px solid black;">
							<xsl:call-template name="PopulateMonthDayYear">
								<xsl:with-param name="TargetNode" select="$FormData/ApplcblCorpDeterminationGrp/SecondPrecYrAnnualAFSIGrp/TaxYearEndDt"/>
							</xsl:call-template>
						</span>
					</div>
					<div class="sty4626AmtBox" style="height:14mm;text-align:center;">
						<strong>(c)</strong>
						<br/> Third Preceding <br/> Year Ended <br/>
						<span style="width:80%;min-height:3.5mm;border-bottom:1px solid black;">
							<xsl:call-template name="PopulateMonthDayYear">
								<xsl:with-param name="TargetNode" select="$FormData/ApplcblCorpDeterminationGrp/ThirdPrecYrAnnualAFSIGrp/TaxYearEndDt"/>
							</xsl:call-template>
						</span>
					</div>
				</div>
				<!-- P1 Line 1 -->
				<div class="styStdDiv" style="">
					<div class="styLNLeftNumBoxSD">1</div>
					<div class="sty4626ShortDesc" style="height:7.2mm;">
						Net income or loss per applicable financial statement(s) (AFS) (see instructions):
					</div>
					<div class="sty4626RightNumBox" style="height:7.2mm;border-bottom-width:0px;">&nbsp;</div>
					<div class="sty4626AmtBox" style="height:7.2mm;border-bottom-width:0px;">&nbsp;</div>
					<div class="sty4626AmtBox" style="height:7.2mm;border-bottom-width:0px;">&nbsp;</div>
					<div class="sty4626AmtBox" style="height:7.2mm;border-bottom-width:0px;">&nbsp;</div>
				</div>
				<!-- P1 Line 1a -->
				<div class="styStdDiv" style="">
					<div class="styLNLeftLtrBox">a</div>
					<div class="sty4626ShortDesc" style="">
						Consolidated net income or loss per the AFS of the corporation
						<span class="sty4626DotLn">..</span>
					</div>
					<div class="sty4626RightNumBox" style="">1a</div>
					<div class="sty4626AmtBox" style="">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/ApplcblCorpDeterminationGrp/FirstPrecYrAnnualAFSIGrp/CnsldtNetIncmLossPerAFSAmt"/>
						</xsl:call-template>
					</div>
					<div class="sty4626AmtBox" style="">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/ApplcblCorpDeterminationGrp/SecondPrecYrAnnualAFSIGrp/CnsldtNetIncmLossPerAFSAmt"/>
						</xsl:call-template>
					</div>
					<div class="sty4626AmtBox" style="">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/ApplcblCorpDeterminationGrp/ThirdPrecYrAnnualAFSIGrp/CnsldtNetIncmLossPerAFSAmt"/>
						</xsl:call-template>
					</div>
				</div>
				<!-- P1 Line 1b -->
				<div class="styStdDiv" style="">
					<div class="styLNLeftLtrBox">b</div>
					<div class="sty4626ShortDesc" style="height:7.2mm;">
						Include AFS net income or loss of other includible entities (add net income and subtract net loss)
						<span class="sty4626DotLn">............</span>
					</div>
					<div class="sty4626RightNumBox" style="height:7.2mm;">
						<br/>1b</div>
					<div class="sty4626AmtBox" style="height:7.2mm;">
						<br/>
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/ApplcblCorpDeterminationGrp/FirstPrecYrAnnualAFSIGrp/AFSNetIncmLossOtherIncldEntAmt"/>
						</xsl:call-template>
					</div>
					<div class="sty4626AmtBox" style="height:7.2mm;">
						<br/>
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/ApplcblCorpDeterminationGrp/SecondPrecYrAnnualAFSIGrp/AFSNetIncmLossOtherIncldEntAmt"/>
						</xsl:call-template>
					</div>
					<div class="sty4626AmtBox" style="height:7.2mm;">
						<br/>
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/ApplcblCorpDeterminationGrp/ThirdPrecYrAnnualAFSIGrp/AFSNetIncmLossOtherIncldEntAmt"/>
						</xsl:call-template>
					</div>
				</div>
				<!-- P1 Line 1c -->
				<div class="styStdDiv" style="">
					<div class="styLNLeftLtrBox">c</div>
					<div class="sty4626ShortDesc" style="height:7.2mm;">
						Exclude AFS net income or loss of excludible entities (add net loss and subtract net income)
						<span class="sty4626DotLn">...............</span>
					</div>
					<div class="sty4626RightNumBox" style="height:7.2mm;">
						<br/>1c</div>
					<div class="sty4626AmtBox" style="height:7.2mm;">
						<br/>
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/ApplcblCorpDeterminationGrp/FirstPrecYrAnnualAFSIGrp/AFSNetIncmLossExcldEntAmt"/>
						</xsl:call-template>
					</div>
					<div class="sty4626AmtBox" style="height:7.2mm;">
						<br/>
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/ApplcblCorpDeterminationGrp/SecondPrecYrAnnualAFSIGrp/AFSNetIncmLossExcldEntAmt"/>
						</xsl:call-template>
					</div>
					<div class="sty4626AmtBox" style="height:7.2mm;">
						<br/>
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/ApplcblCorpDeterminationGrp/ThirdPrecYrAnnualAFSIGrp/AFSNetIncmLossExcldEntAmt"/>
						</xsl:call-template>
					</div>
				</div>
				<!-- P1 Line 1d -->
				<xsl:choose>
					<xsl:when test="$FormData/ApplcblCorpDeterminationGrp/FirstPrecYrAnnualAFSIGrp/SpcfdAddnlNetIncmLossItemAAmt or $FormData/ApplcblCorpDeterminationGrp/SecondPrecYrAnnualAFSIGrp/SpcfdAddnlNetIncmLossItemAAmt or $FormData/ApplcblCorpDeterminationGrp/ThirdPrecYrAnnualAFSIGrp/SpcfdAddnlNetIncmLossItemAAmt">
						<div class="styStdDiv">
							<div class="styLNLeftLtrBox">d</div>
							<div class="sty4626ShortDesc">
							Specified additional net income or loss item A. Reserved for future use
						</div>
							<div class="sty4626RightNumBox">1d</div>
							<div class="sty4626AmtBox" style="background-color:lightgrey;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/ApplcblCorpDeterminationGrp/FirstPrecYrAnnualAFSIGrp/SpcfdAddnlNetIncmLossItemAAmt"/>
								</xsl:call-template>
							</div>
							<div class="sty4626AmtBox" style="background-color:lightgrey;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/ApplcblCorpDeterminationGrp/SecondPrecYrAnnualAFSIGrp/SpcfdAddnlNetIncmLossItemAAmt"/>
								</xsl:call-template>
							</div>
							<div class="sty4626AmtBox" style="background-color:lightgrey;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/ApplcblCorpDeterminationGrp/ThirdPrecYrAnnualAFSIGrp/SpcfdAddnlNetIncmLossItemAAmt"/>
								</xsl:call-template>
							</div>
						</div>
					</xsl:when>
					<xsl:otherwise>
						<div class="styStdDiv">
							<div class="styLNLeftLtrBox">d</div>
							<div class="sty4626ShortDesc">
							Adjustment for certain consolidating entries (see instructions)
							<span class="sty4626DotLn">...</span>
							</div>
							<div class="sty4626RightNumBox">1d</div>
							<div class="sty4626AmtBox">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/ApplcblCorpDeterminationGrp/FirstPrecYrAnnualAFSIGrp/CertainCnsldtEntriesAdjAmt"/>
								</xsl:call-template>
							</div>
							<div class="sty4626AmtBox">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/ApplcblCorpDeterminationGrp/SecondPrecYrAnnualAFSIGrp/CertainCnsldtEntriesAdjAmt"/>
								</xsl:call-template>
							</div>
							<div class="sty4626AmtBox">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/ApplcblCorpDeterminationGrp/ThirdPrecYrAnnualAFSIGrp/CertainCnsldtEntriesAdjAmt"/>
								</xsl:call-template>
							</div>
						</div>
					</xsl:otherwise>
				</xsl:choose>
				<!-- P1 Line 1e -->
				<div class="styStdDiv" style="">
					<div class="styLNLeftLtrBox">e</div>
					<div class="sty4626ShortDesc" style="">
						Specified additional net income or loss item B. Reserved for future use
						<!--<span class="sty4626DotLn">..</span>-->
					</div>
					<div class="sty4626RightNumBox" style="">1e</div>
					<div class="sty4626AmtBox" style="background-color:lightgrey;">
<!--						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/ApplcblCorpDeterminationGrp/FirstPrecYrAnnualAFSIGrp/SpcfdAddnlNetIncmLossItemBAmt"/>
						</xsl:call-template>-->
					</div>
					<div class="sty4626AmtBox" style="background-color:lightgrey;">
<!--						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/ApplcblCorpDeterminationGrp/SecondPrecYrAnnualAFSIGrp/SpcfdAddnlNetIncmLossItemBAmt"/>
						</xsl:call-template>-->
					</div>
					<div class="sty4626AmtBox" style="background-color:lightgrey;">
<!--						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/ApplcblCorpDeterminationGrp/ThirdPrecYrAnnualAFSIGrp/SpcfdAddnlNetIncmLossItemBAmt"/>
						</xsl:call-template>-->
					</div>
				</div>
				<!-- P1 Line 1f -->
				<div class="styStdDiv" style="">
					<div class="styLNLeftLtrBox">f</div>
					<div class="sty4626ShortDesc" style="height:7.2mm;">
						AFS net income or loss of all entities in the test group before adjustments. Combine lines 1a through 1c
						<span class="sty4626DotLn">........</span>
					</div>
					<div class="sty4626RightNumBox" style="height:7.2mm;">
						<br/>1f</div>
					<div class="sty4626AmtBox" style="height:7.2mm;">
						<br/>
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/ApplcblCorpDeterminationGrp/FirstPrecYrAnnualAFSIGrp/AFSNetIncmLossAllEntBfrAdjAmt"/>
						</xsl:call-template>
					</div>
					<div class="sty4626AmtBox" style="height:7.2mm;">
						<br/>
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/ApplcblCorpDeterminationGrp/SecondPrecYrAnnualAFSIGrp/AFSNetIncmLossAllEntBfrAdjAmt"/>
						</xsl:call-template>
					</div>
					<div class="sty4626AmtBox" style="height:7.2mm;">
						<br/>
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/ApplcblCorpDeterminationGrp/ThirdPrecYrAnnualAFSIGrp/AFSNetIncmLossAllEntBfrAdjAmt"/>
						</xsl:call-template>
					</div>
				</div>
				<!-- P1 Line 2 -->
				<div class="styStdDiv" style="">
					<div class="styLNLeftNumBoxSD">2</div>
					<div class="sty4626ShortDesc" style="">
						Adjustments:
					</div>
					<div class="sty4626RightNumBox" style="border-bottom-width:0px;">&nbsp;</div>
					<div class="sty4626AmtBox" style="border-bottom-width:0px;">&nbsp;</div>
					<div class="sty4626AmtBox" style="border-bottom-width:0px;">&nbsp;</div>
					<div class="sty4626AmtBox" style="border-bottom-width:0px;">&nbsp;</div>
				</div>
				<!-- P1 Line 2a -->
				<div class="styStdDiv" style="">
					<div class="styLNLeftLtrBox">a</div>
					<div class="sty4626ShortDesc" style="">
						Financial statements covering different tax years
						<span class="sty4626DotLn">......</span>
					</div>
					<div class="sty4626RightNumBox" style="">2a</div>
					<div class="sty4626AmtBox" style="">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/ApplcblCorpDeterminationGrp/FirstPrecYrAnnualAFSIGrp/FinancialStmtDiffTYAmt"/>
						</xsl:call-template>
					</div>
					<div class="sty4626AmtBox" style="">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/ApplcblCorpDeterminationGrp/SecondPrecYrAnnualAFSIGrp/FinancialStmtDiffTYAmt"/>
						</xsl:call-template>
					</div>
					<div class="sty4626AmtBox" style="">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/ApplcblCorpDeterminationGrp/ThirdPrecYrAnnualAFSIGrp/FinancialStmtDiffTYAmt"/>
						</xsl:call-template>
					</div>
				</div>
				<!-- P1 Line 2b -->
				<div class="styStdDiv" style="">
					<div class="styLNLeftLtrBox">b</div>
					<div class="sty4626ShortDesc" style="">
						Corporations that are not included on the taxpayer's consolidated return (see instructions)
						<span class="sty4626DotLn">..............</span>
					</div>
					<div class="sty4626RightNumBox" style="height:7.2mm;">
						<br/>2b</div>
					<div class="sty4626AmtBox" style="height:7.2mm;">
						<br/>
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/ApplcblCorpDeterminationGrp/FirstPrecYrAnnualAFSIGrp/CorpNotIncldCnsldtReturnAmt"/>
						</xsl:call-template>
					</div>
					<div class="sty4626AmtBox" style="height:7.2mm;">
						<br/>
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/ApplcblCorpDeterminationGrp/SecondPrecYrAnnualAFSIGrp/CorpNotIncldCnsldtReturnAmt"/>
						</xsl:call-template>
					</div>
					<div class="sty4626AmtBox" style="height:7.2mm;">
						<br/>
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/ApplcblCorpDeterminationGrp/ThirdPrecYrAnnualAFSIGrp/CorpNotIncldCnsldtReturnAmt"/>
						</xsl:call-template>
					</div>
				</div>
				<!-- P1 Line 2c -->
				<div class="styStdDiv" style="">
					<div class="styLNLeftLtrBox">c</div>
					<div class="sty4626ShortDesc" style="">
						Aggregate pro-rata share of adjusted net income from controlled foreign corporations (CFCs) for which the corporation is a U.S. shareholder. If zero or less, enter -0- (attach Schedule A (Form 4626))
(see instructions for special rules if completing this form for an FPMG)
						<xsl:call-template name="SetFormLinkInline">
							<xsl:with-param name="TargetNode" select="$RtnDoc/IRS4626/ApplcblCorpDeterminationGrp/FirstPrecYrAnnualAFSIGrp/AggrgtProRataShrAdjCFCAmt"/>
						</xsl:call-template>
						<xsl:call-template name="LinkToLeftoverDataTableInline">
							<xsl:with-param name="Desc">IRS4626 Schedule A</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$RtnDoc/IRS4626/ApplcblCorpDeterminationGrp/FirstPrecYrAnnualAFSIGrp/AggrgtProRataShrAdjCFCAmt/@referenceDocumentName"/>
							<xsl:with-param name="Style">padding-left:4mm;</xsl:with-param>
						</xsl:call-template>
						<xsl:call-template name="LinkToLeftoverDataTableInline">
							<xsl:with-param name="Desc">IRS4626 Schedule A</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$RtnDoc/IRS4626/ApplcblCorpDeterminationGrp/SecondPrecYrAnnualAFSIGrp/AggrgtProRataShrAdjCFCAmt/@referenceDocumentName"/>
							<xsl:with-param name="Style">padding-left:4mm;</xsl:with-param>
						</xsl:call-template>
						<xsl:call-template name="LinkToLeftoverDataTableInline">
							<xsl:with-param name="Desc">IRS4626 Schedule A</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$RtnDoc/IRS4626/ApplcblCorpDeterminationGrp/ThirdPrecYrAnnualAFSIGrp/AggrgtProRataShrAdjCFCAmt/@referenceDocumentName"/>
							<xsl:with-param name="Style">padding-left:4mm;</xsl:with-param>
						</xsl:call-template>
					</div>
					<div class="sty4626RightNumBox" style="height:16.5mm;">
						<br/><br/><br/><br/>2c</div>
					<div class="sty4626AmtBox" style="height:16.5mm;"><br/><br/><br/><br/>
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/ApplcblCorpDeterminationGrp/FirstPrecYrAnnualAFSIGrp/AggrgtProRataShrAdjCFCAmt"/>
						</xsl:call-template>
					</div>
					<div class="sty4626AmtBox" style="height:16.5mm;"><br/><br/><br/><br/>
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/ApplcblCorpDeterminationGrp/SecondPrecYrAnnualAFSIGrp/AggrgtProRataShrAdjCFCAmt"/>
						</xsl:call-template>
					</div>
					<div class="sty4626AmtBox" style="height:16.5mm;"><br/><br/><br/><br/>
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/ApplcblCorpDeterminationGrp/ThirdPrecYrAnnualAFSIGrp/AggrgtProRataShrAdjCFCAmt"/>
						</xsl:call-template>
					</div>
				</div>
				<!-- P1 Line 2d -->
				<div class="styStdDiv" style="">
					<div class="styLNLeftLtrBox">d</div>
					<div class="sty4626ShortDesc" style="">
						Amounts that are not effectively connected to a U.S. trade or 
						business (see instructions for special rules if completing this form for a FPMG)
						<!--<span class="sty4626DotLn">..............</span>-->
					</div>
					<div class="sty4626RightNumBox" style="height:7.2mm;">
						<br/>2d</div>
					<div class="sty4626AmtBox" style="height:7.2mm;">
						<br/>
						<xsl:call-template name="PopulateNegativeNumber">
							<xsl:with-param name="TargetNode" select="$FormData/ApplcblCorpDeterminationGrp/FirstPrecYrAnnualAFSIGrp/AmountsNECUSTrdOrBusAmt"/>
						</xsl:call-template>
					</div>
					<div class="sty4626AmtBox" style="height:7.2mm;">
						<br/>
						<xsl:call-template name="PopulateNegativeNumber">
							<xsl:with-param name="TargetNode" select="$FormData/ApplcblCorpDeterminationGrp/SecondPrecYrAnnualAFSIGrp/AmountsNECUSTrdOrBusAmt"/>
						</xsl:call-template>
					</div>
					<div class="sty4626AmtBox" style="height:7.2mm;">
						<br/>
						<xsl:call-template name="PopulateNegativeNumber">
							<xsl:with-param name="TargetNode" select="$FormData/ApplcblCorpDeterminationGrp/ThirdPrecYrAnnualAFSIGrp/AmountsNECUSTrdOrBusAmt"/>
						</xsl:call-template>
					</div>
				</div>
				<!-- P1 Line 2e -->
				<div class="styStdDiv" style="">
					<div class="styLNLeftLtrBox">e</div>
					<div class="sty4626ShortDesc" style="">
						Certain taxes (see instructions)
						<span class="sty4626DotLn">............</span>
					</div>
					<div class="sty4626RightNumBox" style="">2e</div>
					<div class="sty4626AmtBox" style="">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/ApplcblCorpDeterminationGrp/FirstPrecYrAnnualAFSIGrp/CertainTaxesAmt"/>
						</xsl:call-template>
					</div>
					<div class="sty4626AmtBox" style="">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/ApplcblCorpDeterminationGrp/SecondPrecYrAnnualAFSIGrp/CertainTaxesAmt"/>
						</xsl:call-template>
					</div>
					<div class="sty4626AmtBox" style="">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/ApplcblCorpDeterminationGrp/ThirdPrecYrAnnualAFSIGrp/CertainTaxesAmt"/>
						</xsl:call-template>
					</div>
				</div>
				<!-- P1 Line 2f -->
				<div class="styStdDiv" style="">
					<div class="styLNLeftLtrBox">f</div>
					<div class="sty4626ShortDesc" style="">
						Patronage dividends and per-unit retain allocations (cooperatives only)
						<!--<span class="sty4626DotLn">.............</span>-->
					</div>
					<div class="sty4626RightNumBox" style="">2f</div>
					<div class="sty4626AmtBox" style="">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/ApplcblCorpDeterminationGrp/FirstPrecYrAnnualAFSIGrp/PatrDivPerUnitRtnAllocnAmt"/>
						</xsl:call-template>
					</div>
					<div class="sty4626AmtBox" style="">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/ApplcblCorpDeterminationGrp/SecondPrecYrAnnualAFSIGrp/PatrDivPerUnitRtnAllocnAmt"/>
						</xsl:call-template>
					</div>
					<div class="sty4626AmtBox" style="">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/ApplcblCorpDeterminationGrp/ThirdPrecYrAnnualAFSIGrp/PatrDivPerUnitRtnAllocnAmt"/>
						</xsl:call-template>
					</div>
				</div>
				<!-- P1 Line 2g -->
				<div class="styStdDiv" style="">
					<div class="styLNLeftLtrBox">g</div>
					<div class="sty4626ShortDesc" style="">
						Alaska native corporations
						<span class="sty4626DotLn">.............</span>
					</div>
					<div class="sty4626RightNumBox" style="">2g</div>
					<div class="sty4626AmtBox" style="">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/ApplcblCorpDeterminationGrp/FirstPrecYrAnnualAFSIGrp/AlaskaNativeCorporationsAmt"/>
						</xsl:call-template>
					</div>
					<div class="sty4626AmtBox" style="">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/ApplcblCorpDeterminationGrp/SecondPrecYrAnnualAFSIGrp/AlaskaNativeCorporationsAmt"/>
						</xsl:call-template>
					</div>
					<div class="sty4626AmtBox" style="">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/ApplcblCorpDeterminationGrp/ThirdPrecYrAnnualAFSIGrp/AlaskaNativeCorporationsAmt"/>
						</xsl:call-template>
					</div>
				</div>
				<!-- P1 Line 2h -->
				<div class="styStdDiv" style="">
					<div class="styLNLeftLtrBox">h</div>
					<div class="sty4626ShortDesc" style="">
						Certain credits (see instructions)
						<span class="sty4626DotLn">...........</span>
					</div>
					<div class="sty4626RightNumBox" style="">2h</div>
					<div class="sty4626AmtBox" style="">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/ApplcblCorpDeterminationGrp/FirstPrecYrAnnualAFSIGrp/CertainCreditsAmt"/>
						</xsl:call-template>
					</div>
					<div class="sty4626AmtBox" style="">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/ApplcblCorpDeterminationGrp/SecondPrecYrAnnualAFSIGrp/CertainCreditsAmt"/>
						</xsl:call-template>
					</div>
					<div class="sty4626AmtBox" style="">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/ApplcblCorpDeterminationGrp/ThirdPrecYrAnnualAFSIGrp/CertainCreditsAmt"/>
						</xsl:call-template>
					</div>
				</div>
				<!-- P1 Line 2i -->
				<div class="styStdDiv" style="">
					<div class="styLNLeftLtrBox">i</div>
					<div class="sty4626ShortDesc" style="">
						Mortgage servicing income
						<span class="sty4626DotLn">.............</span>
					</div>
					<div class="sty4626RightNumBox" style="">2i</div>
					<div class="sty4626AmtBox" style="">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/ApplcblCorpDeterminationGrp/FirstPrecYrAnnualAFSIGrp/MortgageServicingIncomeAmt"/>
						</xsl:call-template>
					</div>
					<div class="sty4626AmtBox" style="">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/ApplcblCorpDeterminationGrp/SecondPrecYrAnnualAFSIGrp/MortgageServicingIncomeAmt"/>
						</xsl:call-template>
					</div>
					<div class="sty4626AmtBox" style="">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/ApplcblCorpDeterminationGrp/ThirdPrecYrAnnualAFSIGrp/MortgageServicingIncomeAmt"/>
						</xsl:call-template>
					</div>
				</div>
				<!-- P1 Line 2j -->
				<div class="styStdDiv" style="">
					<div class="styLNLeftLtrBox">j</div>
					<div class="sty4626ShortDesc" style="">
						Tax-exempt entities (organizations subject to tax under section 511)
						<!--<span class="sty4626DotLn">.............</span>-->
					</div>
					<div class="sty4626RightNumBox" style="">2j</div>
					<div class="sty4626AmtBox" style="">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/ApplcblCorpDeterminationGrp/FirstPrecYrAnnualAFSIGrp/TaxExemptEntSubjTxSect511Amt"/>
						</xsl:call-template>
					</div>
					<div class="sty4626AmtBox" style="">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/ApplcblCorpDeterminationGrp/SecondPrecYrAnnualAFSIGrp/TaxExemptEntSubjTxSect511Amt"/>
						</xsl:call-template>
					</div>
					<div class="sty4626AmtBox" style="">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/ApplcblCorpDeterminationGrp/ThirdPrecYrAnnualAFSIGrp/TaxExemptEntSubjTxSect511Amt"/>
						</xsl:call-template>
					</div>
				</div>
				<!-- P1 Line 2k -->
				<div class="styStdDiv" style="">
					<div class="styLNLeftLtrBox">k</div>
					<div class="sty4626ShortDesc" style="">
						Depreciation
						<span class="sty4626DotLn">..................</span>
					</div>
					<div class="sty4626RightNumBox" style="">2k</div>
					<div class="sty4626AmtBox" style="">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/ApplcblCorpDeterminationGrp/FirstPrecYrAnnualAFSIGrp/DepreciationAmt"/>
						</xsl:call-template>
					</div>
					<div class="sty4626AmtBox" style="">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/ApplcblCorpDeterminationGrp/SecondPrecYrAnnualAFSIGrp/DepreciationAmt"/>
						</xsl:call-template>
					</div>
					<div class="sty4626AmtBox" style="">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/ApplcblCorpDeterminationGrp/ThirdPrecYrAnnualAFSIGrp/DepreciationAmt"/>
						</xsl:call-template>
					</div>
				</div>
				<!-- P1 Line 2l -->
				<div class="styStdDiv" style="">
					<div class="styLNLeftLtrBox">l</div>
					<div class="sty4626ShortDesc" style="">
						Qualified wireless spectrum
						<span class="sty4626DotLn">.............</span>
					</div>
					<div class="sty4626RightNumBox" style="">2l</div>
					<div class="sty4626AmtBox" style="">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/ApplcblCorpDeterminationGrp/FirstPrecYrAnnualAFSIGrp/QualifiedWirelessSpectrumAmt"/>
						</xsl:call-template>
					</div>
					<div class="sty4626AmtBox" style="">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/ApplcblCorpDeterminationGrp/SecondPrecYrAnnualAFSIGrp/QualifiedWirelessSpectrumAmt"/>
						</xsl:call-template>
					</div>
					<div class="sty4626AmtBox" style="">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/ApplcblCorpDeterminationGrp/ThirdPrecYrAnnualAFSIGrp/QualifiedWirelessSpectrumAmt"/>
						</xsl:call-template>
					</div>
				</div>
				<!-- P1 Line 2m -->
				<div class="styStdDiv" style="">
					<div class="styLNLeftLtrBox">m</div>
					<div class="sty4626ShortDesc" style="">
						Covered transactions
						<span class="sty4626DotLn">...............</span>
					</div>
					<div class="sty4626RightNumBox" style="">2m</div>
					<div class="sty4626AmtBox" style="">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/ApplcblCorpDeterminationGrp/FirstPrecYrAnnualAFSIGrp/CoveredTransactionsAmt"/>
						</xsl:call-template>
					</div>
					<div class="sty4626AmtBox" style="">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/ApplcblCorpDeterminationGrp/SecondPrecYrAnnualAFSIGrp/CoveredTransactionsAmt"/>
						</xsl:call-template>
					</div>
					<div class="sty4626AmtBox" style="">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/ApplcblCorpDeterminationGrp/ThirdPrecYrAnnualAFSIGrp/CoveredTransactionsAmt"/>
						</xsl:call-template>
					</div>
				</div>
				<!-- P1 Line 2n -->
				<div class="styStdIBDiv" style="">
					<div class="styLNLeftLtrBox">n</div>
					<div class="sty4626ShortDesc" style="">
						Adjustments related to bankruptcy and insolvency
						<span class="sty4626DotLn">......</span>
					</div>
					<div class="sty4626RightNumBox" style="">2n</div>
					<div class="sty4626AmtBox" style="">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/ApplcblCorpDeterminationGrp/FirstPrecYrAnnualAFSIGrp/BankruptcyAndInsolvencyAdjAmt"/>
						</xsl:call-template>
					</div>
					<div class="sty4626AmtBox" style="">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/ApplcblCorpDeterminationGrp/SecondPrecYrAnnualAFSIGrp/BankruptcyAndInsolvencyAdjAmt"/>
						</xsl:call-template>
					</div>
					<div class="sty4626AmtBox" style="">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/ApplcblCorpDeterminationGrp/ThirdPrecYrAnnualAFSIGrp/BankruptcyAndInsolvencyAdjAmt"/>
						</xsl:call-template>
					</div>
				</div>
				<!-- P1 Line 2o -->
				<div class="styStdIBDiv" style="">
					<div class="styLNLeftLtrBox">o</div>
					<div class="sty4626ShortDesc" style="">
						Certain insurance company adjustments
						<span class="sty4626DotLn">.........</span>
					</div>
					<div class="sty4626RightNumBox" style="">2o</div>
					<div class="sty4626AmtBox" style="">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/ApplcblCorpDeterminationGrp/FirstPrecYrAnnualAFSIGrp/CertainInsuranceCompanyAdjAmt"/>
						</xsl:call-template>
					</div>
					<div class="sty4626AmtBox" style="">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/ApplcblCorpDeterminationGrp/SecondPrecYrAnnualAFSIGrp/CertainInsuranceCompanyAdjAmt"/>
						</xsl:call-template>
					</div>
					<div class="sty4626AmtBox" style="">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/ApplcblCorpDeterminationGrp/ThirdPrecYrAnnualAFSIGrp/CertainInsuranceCompanyAdjAmt"/>
						</xsl:call-template>
					</div>
				</div>
				<!-- P1 Line 2p -->
				<div class="styStdIBDiv" style="">
					<div class="styLNLeftLtrBox">p</div>
					<div class="sty4626ShortDesc" style="">
						Adjustment P &mdash; Reserved for future use
						<span class="sty4626DotLn">.........</span>
					</div>
					<div class="sty4626RightNumBox" style="">2p</div>
					<div class="sty4626AmtBox" style="background-color:lightgrey;">
<!--						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/ApplcblCorpDeterminationGrp/FirstPrecYrAnnualAFSIGrp/AdjustmentPAmt"/>
						</xsl:call-template>-->
					</div>
					<div class="sty4626AmtBox" style="background-color:lightgrey;">
<!--						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/ApplcblCorpDeterminationGrp/SecondPrecYrAnnualAFSIGrp/AdjustmentPAmt"/>
						</xsl:call-template>-->
					</div>
					<div class="sty4626AmtBox" style="background-color:lightgrey;">
<!--						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/ApplcblCorpDeterminationGrp/ThirdPrecYrAnnualAFSIGrp/AdjustmentPAmt"/>
						</xsl:call-template>-->
					</div>
				</div>
				<!-- P1 Line 2q -->
				<div class="styStdIBDiv" style="">
					<div class="styLNLeftLtrBox">q</div>
					<div class="sty4626ShortDesc" style="">
						Adjustment Q &mdash; Reserved for future use
						<span class="sty4626DotLn">.........</span>
					</div>
					<div class="sty4626RightNumBox" style="">2q</div>
					<div class="sty4626AmtBox" style="background-color:lightgrey;">
<!--						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/ApplcblCorpDeterminationGrp/FirstPrecYrAnnualAFSIGrp/AdjustmentQAmt"/>
						</xsl:call-template>-->
					</div>
					<div class="sty4626AmtBox" style="background-color:lightgrey;">
<!--						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/ApplcblCorpDeterminationGrp/SecondPrecYrAnnualAFSIGrp/AdjustmentQAmt"/>
						</xsl:call-template>-->
					</div>
					<div class="sty4626AmtBox" style="background-color:lightgrey;">
<!--						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/ApplcblCorpDeterminationGrp/ThirdPrecYrAnnualAFSIGrp/AdjustmentQAmt"/>
						</xsl:call-template>-->
					</div>
				</div>
				<!-- P1 Line 2r -->
				<div class="styStdIBDiv" style="">
					<div class="styLNLeftLtrBox">r</div>
					<div class="sty4626ShortDesc" style="">
						Adjustment R &mdash; Reserved for future use
						<span class="sty4626DotLn">.........</span>
					</div>
					<div class="sty4626RightNumBox" style="">2r</div>
					<div class="sty4626AmtBox" style="background-color:lightgrey;">
<!--						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/ApplcblCorpDeterminationGrp/FirstPrecYrAnnualAFSIGrp/AdjustmentRAmt"/>
						</xsl:call-template>-->
					</div>
					<div class="sty4626AmtBox" style="background-color:lightgrey;">
<!--						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/ApplcblCorpDeterminationGrp/SecondPrecYrAnnualAFSIGrp/AdjustmentRAmt"/>
						</xsl:call-template>-->
					</div>
					<div class="sty4626AmtBox" style="background-color:lightgrey;">
<!--						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/ApplcblCorpDeterminationGrp/ThirdPrecYrAnnualAFSIGrp/AdjustmentRAmt"/>
						</xsl:call-template>-->
					</div>
				</div>
				<!-- P1 Line 2s -->
				<div class="styStdIBDiv" style="">
					<div class="styLNLeftLtrBox">s</div>
					<div class="sty4626ShortDesc" style="">
						Adjustment S &mdash; Reserved for future use
						<span class="sty4626DotLn">.........</span>
					</div>
					<div class="sty4626RightNumBox" style="">2s</div>
					<div class="sty4626AmtBox" style="background-color:lightgrey;">
<!--						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/ApplcblCorpDeterminationGrp/FirstPrecYrAnnualAFSIGrp/AdjustmentSAmt"/>
						</xsl:call-template>-->
					</div>
					<div class="sty4626AmtBox" style="background-color:lightgrey;">
<!--						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/ApplcblCorpDeterminationGrp/SecondPrecYrAnnualAFSIGrp/AdjustmentSAmt"/>
						</xsl:call-template>-->
					</div>
					<div class="sty4626AmtBox" style="background-color:lightgrey;">
<!--						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/ApplcblCorpDeterminationGrp/ThirdPrecYrAnnualAFSIGrp/AdjustmentSAmt"/>
						</xsl:call-template>-->
					</div>
				</div>
				<!-- P1 Line 2z -->
				<div class="styStdIBDiv" style="">
					<div class="styLNLeftLtrBox">z</div>
					<div class="sty4626ShortDesc" style="">
						Other (see instructions)
						<span class="sty4626DotLn">..............</span>
					</div>
					<div class="sty4626RightNumBox" style="">2z</div>
					<div class="sty4626AmtBox" style="">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/ApplcblCorpDeterminationGrp/FirstPrecYrAnnualAFSIGrp/OtherAmt"/>
						</xsl:call-template>
					</div>
					<div class="sty4626AmtBox" style="">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/ApplcblCorpDeterminationGrp/SecondPrecYrAnnualAFSIGrp/OtherAmt"/>
						</xsl:call-template>
					</div>
					<div class="sty4626AmtBox" style="">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/ApplcblCorpDeterminationGrp/ThirdPrecYrAnnualAFSIGrp/OtherAmt"/>
						</xsl:call-template>
					</div>
				</div>
				<!-- P1 Line 3 -->
				<div class="styStdIBDiv" style="">
					<div class="styLNLeftNumBoxSD">3</div>
					<div class="sty4626ShortDesc" style="">
						Specified adjustment. Reserved for future use
						<span class="sty4626DotLn">.......</span>
					</div>
					<div class="sty4626RightNumBox" style="">3</div>
					<div class="sty4626AmtBox" style="background-color:lightgrey;">
<!--						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/ApplcblCorpDeterminationGrp/FirstPrecYrAnnualAFSIGrp/SpecifiedAdjustmentAmt"/>
						</xsl:call-template>-->
					</div>
					<div class="sty4626AmtBox" style="background-color:lightgrey;">
<!--						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/ApplcblCorpDeterminationGrp/SecondPrecYrAnnualAFSIGrp/SpecifiedAdjustmentAmt"/>
						</xsl:call-template>-->
					</div>
					<div class="sty4626AmtBox" style="background-color:lightgrey;">
<!--						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/ApplcblCorpDeterminationGrp/ThirdPrecYrAnnualAFSIGrp/SpecifiedAdjustmentAmt"/>
						</xsl:call-template>-->
					</div>
				</div>
				<!-- P1 Line 4 -->
				<div class="styStdIBDiv" style="">
					<div class="styLNLeftNumBoxSD">4</div>
					<div class="sty4626ShortDesc" style="">
						Total adjustments. Combine lines 2a through 2z
						<span class="sty4626DotLn">......</span>
					</div>
					<div class="sty4626RightNumBox" style="">4</div>
					<div class="sty4626AmtBox" style="">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/ApplcblCorpDeterminationGrp/FirstPrecYrAnnualAFSIGrp/TotalAdjustmentsAmt"/>
						</xsl:call-template>
					</div>
					<div class="sty4626AmtBox" style="">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/ApplcblCorpDeterminationGrp/SecondPrecYrAnnualAFSIGrp/TotalAdjustmentsAmt"/>
						</xsl:call-template>
					</div>
					<div class="sty4626AmtBox" style="">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/ApplcblCorpDeterminationGrp/ThirdPrecYrAnnualAFSIGrp/TotalAdjustmentsAmt"/>
						</xsl:call-template>
					</div>
				</div>
				<!-- P1 Line 5 -->
				<div class="styStdIBDiv" style="">
					<div class="styLNLeftNumBoxSD">5</div>
					<div class="sty4626ShortDesc" style="">
						AFSI. Combine lines 1f and 4
						<span class="sty4626DotLn">............</span>
					</div>
					<div class="sty4626RightNumBox" style="">5</div>
					<div class="sty4626AmtBox" style="">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/ApplcblCorpDeterminationGrp/FirstPrecYrAnnualAFSIGrp/AFSIAmt"/>
						</xsl:call-template>
					</div>
					<div class="sty4626AmtBox" style="">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/ApplcblCorpDeterminationGrp/SecondPrecYrAnnualAFSIGrp/AFSIAmt"/>
						</xsl:call-template>
					</div>
					<div class="sty4626AmtBox" style="">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/ApplcblCorpDeterminationGrp/ThirdPrecYrAnnualAFSIGrp/AFSIAmt"/>
						</xsl:call-template>
					</div>
				</div>
				<!-- P1 Line 6 -->
				<div class="styStdIBDiv" style="">
					<div class="styLNLeftNumBoxSD">6</div>
					<div class="sty4626LongDesc" style="">
						AFSI of first, second, and third preceding tax years. Combine columns (a), (b), and (c) of line 5
						<span class="sty4626DotLn">.....</span>
					</div>
					<div class="sty4626RightNumBox" style="">6</div>
					<div class="sty4626AmtBox" style="">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/ApplcblCorpDeterminationGrp/AFSICombinedPrecedingTYAmt"/>
						</xsl:call-template>
					</div>
				</div>
				<!-- P1 Line 7 -->
				<div class="styStdIBDiv" style="">
					<div class="styLNLeftNumBoxSD">7</div>
					<div class="sty4626LongDesc" style="">
						3-year average annual AFSI (see instructions)
						<span class="sty4626DotLn">.....................</span>
					</div>
					<div class="sty4626RightNumBox" style="border-bottom-width:0px;">7</div>
					<div class="sty4626AmtBox" style="border-bottom-width:0px;">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/ApplcblCorpDeterminationGrp/ThrYrAvgAnnlAFSIAmt"/>
						</xsl:call-template>
					</div>
				</div>
				<!-- Page 1 Break and Footer-->
				<div class="pageEnd" style="width:187mm;border-top:1px solid black;">
					<span class="styBoldText">For Paperwork Reduction Act Notice, see separate instructions. </span>
					<span style="width:20mm;"/>Cat. No. 12955I                      
					<span style="float:right;">
						Form <span class="styBoldText" style="font-size:8pt;">4626</span> (2025)
					</span>
				</div>
				<div class="styStdDiv">
					Form 4626 (2025)
					<span style="float:right;">
						Page <span style="font-weight:bold;font-size:9pt;">2</span>
					</span>
				</div>
				<!-- Part I Header cont -->
				<div class="styStdDiv" style="border-top:1px solid black;border-bottom:1px solid black;">
					<span class="styPartName" style="width:16mm;">Part I</span>
					<span class="styPartDesc" style="width:170mm;height:auto;font-weight:normal;">
						<strong>Applicable Corporation Determination</strong> (Report all amounts in U.S. dollars.) 
						<span style="font-style:italic;">(continued)</span>
					</span>
				</div>
				<!-- Line 8 -->
				<div class="styStdDiv">
					<div class="styLNLeftNumBoxSD">8</div>
					<div class="sty4626LongDesc" style="width:178mm;">
						Is line 7 more than $1 billion? <br/>
						<input type="checkbox" class="styCkboxNM" style="margin-right:3px;" aria-label="Three year average annual AFSI greater than one billion Yes">
							<xsl:call-template name="PopulateYesCheckbox">
								<xsl:with-param name="TargetNode" select="$FormData/ApplcblCorpDeterminationGrp/ThrYrAvgAnnlAFSIGrtrBillionInd"/>
								<xsl:with-param name="BackupName">F4626/ThrYrAvgAnnlAFSIGrtrBillionInd</xsl:with-param>
							</xsl:call-template>
						</input>
						<strong>Yes. </strong> Continue to line 9.<br/>
						<input type="checkbox" class="styCkboxNM" style="margin-right:3px;" aria-label="Three year average annual AFSI greater than one billion No">
							<xsl:call-template name="PopulateNoCheckbox">
								<xsl:with-param name="TargetNode" select="$FormData/ApplcblCorpDeterminationGrp/ThrYrAvgAnnlAFSIGrtrBillionInd"/>
								<xsl:with-param name="BackupName">F4626/ThrYrAvgAnnlAFSIGrtrBillionInd</xsl:with-param>
							</xsl:call-template>
						</input>
						<strong>No. </strong> STOP here and attach to your tax return.
					</div>
				</div>
				<!-- Line 9 -->
				<div class="styStdDiv">
					<div class="styLNLeftNumBoxSD">9</div>
					<div class="sty4626LongDesc" style="width:178mm;">
						Is the corporation a member of a FPMG within the meaning of section 59(k)(2)(B)? <br/>
						<input type="checkbox" class="styCkboxNM" style="margin-right:3px;" aria-label="Corporation a member of FPMG within section 59 k 2 b Yes">
							<xsl:call-template name="PopulateYesCheckbox">
								<xsl:with-param name="TargetNode" select="$FormData/ApplcblCorpDeterminationGrp/CorpMemFPMGSect59k2BInd"/>
								<xsl:with-param name="BackupName">F4626/CorpMemFPMGSect59k2BInd</xsl:with-param>
							</xsl:call-template>
						</input>
						<strong>Yes. </strong> Continue to line 10.<br/>
						<input type="checkbox" class="styCkboxNM" style="margin-right:3px;" aria-label="Corporation a member of FPMG within section 59 k 2 b No">
							<xsl:call-template name="PopulateNoCheckbox">
								<xsl:with-param name="TargetNode" select="$FormData/ApplcblCorpDeterminationGrp/CorpMemFPMGSect59k2BInd"/>
								<xsl:with-param name="BackupName">F4626/CorpMemFPMGSect59k2BInd</xsl:with-param>
							</xsl:call-template>
						</input>
						<strong>No. </strong> Continue to Part II.
					</div>
				</div>
				<!-- head line -->
				<div class="styStdDiv" style="">
					<div class="styLNLeftNumBox">&nbsp;</div>
					<div class="sty4626ShortDesc" style="">&nbsp;</div>
					<div class="sty4626RightNumBox" style="height:14mm;border-left-width:0px;">&nbsp;</div>
					<div class="sty4626AmtBox" style="height:14mm;text-align:center;border-top-width:1px;">
						<strong>(a)</strong>
						<br/> First Preceding <br/> Year Ended <br/>
						<span style="width:80%;height:3.5mm;border-bottom:1px solid black;">
							<xsl:call-template name="PopulateMonthDayYear">
								<xsl:with-param name="TargetNode" select="$FormData/ApplcblCorpDeterminationGrp/FirstPrecYrAnnualAFSIGrp/TaxYearEndDt"/>
							</xsl:call-template>
						</span>
					</div>
					<div class="sty4626AmtBox" style="height:14mm;text-align:center;border-top-width:1px;">
						<strong>(b)</strong>
						<br/> Second Preceding <br/> Year Ended <br/>
						<span style="width:80%;min-height:3.5mm;border-bottom:1px solid black;">
							<xsl:call-template name="PopulateMonthDayYear">
								<xsl:with-param name="TargetNode" select="$FormData/ApplcblCorpDeterminationGrp/SecondPrecYrAnnualAFSIGrp/TaxYearEndDt"/>
							</xsl:call-template>
						</span>
					</div>
					<div class="sty4626AmtBox" style="height:14mm;text-align:center;border-top-width:1px;">
						<strong>(c)</strong>
						<br/> Third Preceding <br/> Year Ended <br/>
						<span style="width:80%;min-height:3.5mm;border-bottom:1px solid black;">
							<xsl:call-template name="PopulateMonthDayYear">
								<xsl:with-param name="TargetNode" select="$FormData/ApplcblCorpDeterminationGrp/ThirdPrecYrAnnualAFSIGrp/TaxYearEndDt"/>
							</xsl:call-template>
						</span>
					</div>
				</div>
				<!-- P1 Line 10 -->
				<div class="styStdDiv" style="">
					<div class="styLNLeftNumBox">10</div>
					<div class="sty4626ShortDesc" style="">
						AFSI for purposes of the $100 million test before adjustments:
					</div>
					<div class="sty4626RightNumBox" style="border-bottom-width:0px;">&nbsp;</div>
					<div class="sty4626AmtBox" style="border-bottom-width:0px;">&nbsp;</div>
					<div class="sty4626AmtBox" style="border-bottom-width:0px;">&nbsp;</div>
					<div class="sty4626AmtBox" style="border-bottom-width:0px;">&nbsp;</div>
				</div>
				<!-- P1 Line 10a -->
				<div class="styStdDiv" style="">
					<div class="styLNLeftLtrBox">a</div>
					<div class="sty4626ShortDesc" style="">
						AFSI from line 5
						<span class="sty4626DotLn">................</span>
					</div>
					<div class="sty4626RightNumBox" style="">10a</div>
					<div class="sty4626AmtBox" style="">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/ApplcblCorpDeterminationGrp/FirstPrecYrAnnualAFSIGrp/AFSIAmt"/>
						</xsl:call-template>
					</div>
					<div class="sty4626AmtBox" style="">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/ApplcblCorpDeterminationGrp/SecondPrecYrAnnualAFSIGrp/AFSIAmt"/>
						</xsl:call-template>
					</div>
					<div class="sty4626AmtBox" style="">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/ApplcblCorpDeterminationGrp/ThirdPrecYrAnnualAFSIGrp/AFSIAmt"/>
						</xsl:call-template>
					</div>
				</div>
				<!-- P1 Line 10b -->
				<div class="styStdDiv" style="">
					<div class="styLNLeftLtrBox">b</div>
					<div class="sty4626ShortDesc" style="">
						Aggregation differences (see instructions)
						<span class="sty4626DotLn">.........</span>
					</div>
					<div class="sty4626RightNumBox" style="">10b</div>
					<div class="sty4626AmtBox" style="">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/ApplcblCorpDeterminationGrp/FirstPrecYrAnnualAFSIGrp/AggregationDifferencesAmt"/>
						</xsl:call-template>
					</div>
					<div class="sty4626AmtBox" style="">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/ApplcblCorpDeterminationGrp/SecondPrecYrAnnualAFSIGrp/AggregationDifferencesAmt"/>
						</xsl:call-template>
					</div>
					<div class="sty4626AmtBox" style="">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/ApplcblCorpDeterminationGrp/ThirdPrecYrAnnualAFSIGrp/AggregationDifferencesAmt"/>
						</xsl:call-template>
					</div>
				</div>
				<!-- P1 Line 10c -->
				<div class="styStdDiv" style="">
					<div class="styLNLeftLtrBox">c</div>
					<div class="sty4626ShortDesc" style="">
						Total AFSI for purposes of the $100 million test before adjustments. 
						Combine lines 10a and 10b
						<span class="sty4626DotLn">.............</span>
					</div>
					<div class="sty4626RightNumBox" style="height:7.2mm;">
						<br/>10c</div>
					<div class="sty4626AmtBox" style="height:7.2mm;">
						<br/>
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/ApplcblCorpDeterminationGrp/FirstPrecYrAnnualAFSIGrp/TotalAFSIBeforeAdjustmentsAmt"/>
						</xsl:call-template>
					</div>
					<div class="sty4626AmtBox" style="height:7.2mm;">
						<br/>
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/ApplcblCorpDeterminationGrp/SecondPrecYrAnnualAFSIGrp/TotalAFSIBeforeAdjustmentsAmt"/>
						</xsl:call-template>
					</div>
					<div class="sty4626AmtBox" style="height:7.2mm;">
						<br/>
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/ApplcblCorpDeterminationGrp/ThirdPrecYrAnnualAFSIGrp/TotalAFSIBeforeAdjustmentsAmt"/>
						</xsl:call-template>
					</div>
				</div>
				<!-- P1 Line 11 -->
				<div class="styStdDiv" style="">
					<div class="styLNLeftNumBox">11</div>
					<div class="sty4626ShortDesc" style="">
						Adjustments:
					</div>
					<div class="sty4626RightNumBox" style="border-bottom-width:0px;">&nbsp;</div>
					<div class="sty4626AmtBox" style="border-bottom-width:0px;">&nbsp;</div>
					<div class="sty4626AmtBox" style="border-bottom-width:0px;">&nbsp;</div>
					<div class="sty4626AmtBox" style="border-bottom-width:0px;">&nbsp;</div>
				</div>
				<!-- P1 Line 11a -->
				<div class="styStdDiv" style="">
					<div class="styLNLeftLtrBox">a</div>
					<div class="sty4626ShortDesc" style="">
						Income not effectively connected to a U.S. trade or business
						<span class="sty4626DotLn">...</span>
					</div>
					<div class="sty4626RightNumBox" style="">11a</div>
					<div class="sty4626AmtBox" style="">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/ApplcblCorpDeterminationGrp/FirstPrecYrAnnualAFSIGrp/IncomeNECUSTradeOrBusAmt"/>
						</xsl:call-template>
					</div>
					<div class="sty4626AmtBox" style="">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/ApplcblCorpDeterminationGrp/SecondPrecYrAnnualAFSIGrp/IncomeNECUSTradeOrBusAmt"/>
						</xsl:call-template>
					</div>
					<div class="sty4626AmtBox" style="">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/ApplcblCorpDeterminationGrp/ThirdPrecYrAnnualAFSIGrp/IncomeNECUSTradeOrBusAmt"/>
						</xsl:call-template>
					</div>
				</div>
				<!-- P1 Line 11b -->
				<div class="styStdDiv" style="">
					<div class="styLNLeftLtrBox">b</div>
					<div class="sty4626ShortDesc" style="">
						Aggregate pro-rata share of adjusted net income from CFCs for which the corporation is a U.S. shareholder. If zero or less, enter -0-
						<xsl:call-template name="SetFormLinkInline">
							<xsl:with-param name="TargetNode" select="$RtnDoc/IRS4626/ApplcblCorpDeterminationGrp/FirstPrecYrAnnualAFSIGrp/FPMGAggrgtProRataShrAdjCFCAmt"/>
						
<!--							<xsl:with-param name="TargetNode" select="$RtnDoc/IRS4626/ApplcblCorpDeterminationGrp"/>-->
						</xsl:call-template>						
						<xsl:call-template name="LinkToLeftoverDataTableInline">
							<xsl:with-param name="Desc">IRS4626 Schedule A</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$RtnDoc/IRS4626/ApplcblCorpDeterminationGrp/FirstPrecYrAnnualAFSIGrp/FPMGAggrgtProRataShrAdjCFCAmt/@referenceDocumentName"/>
							<xsl:with-param name="Style">padding-left:4mm;</xsl:with-param>
						</xsl:call-template>
						<xsl:call-template name="LinkToLeftoverDataTableInline">
							<xsl:with-param name="Desc">IRS4626 Schedule A</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$RtnDoc/IRS4626/ApplcblCorpDeterminationGrp/SecondPrecYrAnnualAFSIGrp/FPMGAggrgtProRataShrAdjCFCAmt/@referenceDocumentName"/>
							<xsl:with-param name="Style">padding-left:4mm;</xsl:with-param>
						</xsl:call-template>
						<xsl:call-template name="LinkToLeftoverDataTableInline">
							<xsl:with-param name="Desc">IRS4626 Schedule A</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$RtnDoc/IRS4626/ApplcblCorpDeterminationGrp/ThirdPrecYrAnnualAFSIGrp/FPMGAggrgtProRataShrAdjCFCAmt/@referenceDocumentName"/>
							<xsl:with-param name="Style">padding-left:4mm;</xsl:with-param>
						</xsl:call-template>
					</div>
					<div class="sty4626RightNumBox" style="height:11.2mm;padding-top:7mm;">
						11b</div>
					<div class="sty4626AmtBox" style="height:11.2mm;padding-top:7mm;">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/ApplcblCorpDeterminationGrp/FirstPrecYrAnnualAFSIGrp/FPMGAggrgtProRataShrAdjCFCAmt"/>
						</xsl:call-template>
					</div>
					<div class="sty4626AmtBox" style="height:11.2mm;padding-top:7mm;">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/ApplcblCorpDeterminationGrp/SecondPrecYrAnnualAFSIGrp/FPMGAggrgtProRataShrAdjCFCAmt"/>
						</xsl:call-template>
					</div>
					<div class="sty4626AmtBox" style="height:11.2mm;padding-top:7mm;">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/ApplcblCorpDeterminationGrp/ThirdPrecYrAnnualAFSIGrp/FPMGAggrgtProRataShrAdjCFCAmt"/>
						</xsl:call-template>
					</div>
				</div>
				<!-- P1 Line 11c -->
				<div class="styStdDiv" style="">
					<div class="styLNLeftLtrBox">c</div>
					<div class="sty4626ShortDesc" style="">
						Reserved for future use &mdash; Other adjustments 1
						<span class="sty4626DotLn">.......</span>
					</div>
					<div class="sty4626RightNumBox" style="">11c</div>
					<div class="sty4626AmtBox" style="background-color:lightgrey;">
<!--						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/ApplcblCorpDeterminationGrp/FirstPrecYrAnnualAFSIGrp/OtherAdjustments1Amt"/>
						</xsl:call-template>-->
					</div>
					<div class="sty4626AmtBox" style="background-color:lightgrey;">
<!--						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/ApplcblCorpDeterminationGrp/SecondPrecYrAnnualAFSIGrp/OtherAdjustments1Amt"/>
						</xsl:call-template>-->
					</div>
					<div class="sty4626AmtBox" style="background-color:lightgrey;">
<!--						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/ApplcblCorpDeterminationGrp/ThirdPrecYrAnnualAFSIGrp/OtherAdjustments1Amt"/>
						</xsl:call-template>-->
					</div>
				</div>
				<!-- P1 Line 11d -->
				<div class="styStdDiv" style="">
					<div class="styLNLeftLtrBox">d</div>
					<div class="sty4626ShortDesc" style="">
						Reserved for future use &mdash; Other adjustments 2
						<span class="sty4626DotLn">.......</span>
					</div>
					<div class="sty4626RightNumBox" style="">11d</div>
					<div class="sty4626AmtBox" style="background-color:lightgrey;">
<!--						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/ApplcblCorpDeterminationGrp/FirstPrecYrAnnualAFSIGrp/OtherAdjustments2Amt"/>
						</xsl:call-template>-->
					</div>
					<div class="sty4626AmtBox" style="background-color:lightgrey;">
<!--						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/ApplcblCorpDeterminationGrp/SecondPrecYrAnnualAFSIGrp/OtherAdjustments2Amt"/>
						</xsl:call-template>-->
					</div>
					<div class="sty4626AmtBox" style="background-color:lightgrey;">
<!--						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/ApplcblCorpDeterminationGrp/ThirdPrecYrAnnualAFSIGrp/OtherAdjustments2Amt"/>
						</xsl:call-template>-->
					</div>
				</div>
				<!-- P1 Line 12 -->
				<div class="styStdDiv" style="">
					<div class="styLNLeftNumBox">12</div>
					<div class="sty4626ShortDesc" style="">
						Total adjustments. Combine lines 11a and 11b
						<span class="sty4626DotLn">.......</span>
					</div>
					<div class="sty4626RightNumBox" style="">12</div>
					<div class="sty4626AmtBox" style="">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/ApplcblCorpDeterminationGrp/FirstPrecYrAnnualAFSIGrp/TotalAFSIAdjTestPrpsAmt"/>
						</xsl:call-template>
					</div>
					<div class="sty4626AmtBox" style="">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/ApplcblCorpDeterminationGrp/SecondPrecYrAnnualAFSIGrp/TotalAFSIAdjTestPrpsAmt"/>
						</xsl:call-template>
					</div>
					<div class="sty4626AmtBox" style="">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/ApplcblCorpDeterminationGrp/ThirdPrecYrAnnualAFSIGrp/TotalAFSIAdjTestPrpsAmt"/>
						</xsl:call-template>
					</div>
				</div>
				<!-- P1 Line 13 -->
				<div class="styStdDiv" style="">
					<div class="styLNLeftNumBox">13</div>
					<div class="sty4626ShortDesc" style="">
						Total AFSI for purposes of the $100 million test. Combine lines <br/> 10c and 12 of columns (a), (b), and (c)
						<span class="sty4626DotLn">.........</span>
					</div>
					<div class="sty4626RightNumBox" style="height:7.2mm;">
						<br/>13</div>
					<div class="sty4626AmtBox" style="height:7.2mm;">
						<br/>
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/ApplcblCorpDeterminationGrp/FirstPrecYrAnnualAFSIGrp/TotalAFSITestPrpsAmt"/>
						</xsl:call-template>
					</div>
					<div class="sty4626AmtBox" style="height:7.2mm;">
						<br/>
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/ApplcblCorpDeterminationGrp/SecondPrecYrAnnualAFSIGrp/TotalAFSITestPrpsAmt"/>
						</xsl:call-template>
					</div>
					<div class="sty4626AmtBox" style="height:7.2mm;">
						<br/>
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/ApplcblCorpDeterminationGrp/ThirdPrecYrAnnualAFSIGrp/TotalAFSITestPrpsAmt"/>
						</xsl:call-template>
					</div>
				</div>
				<!-- P1 Line 14 -->
				<div class="styStdDiv" style="">
					<div class="styLNLeftNumBox">14</div>
					<div class="sty4626LongDesc" style="">
						AFSI of first, second, and third preceding tax years. Combine columns (a), (b), and (c) of line 13
						<span class="sty4626DotLn">.....</span>
					</div>
					<div class="sty4626RightNumBox" style="">14</div>
					<div class="sty4626AmtBox" style="">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/ApplcblCorpDeterminationGrp/AFSICombinedPrecTYTestPrpsAmt"/>
						</xsl:call-template>
					</div>
				</div>
				<!-- P1 Line 15 -->
				<div class="styStdDiv" style="">
					<div class="styLNLeftNumBox">15</div>
					<div class="sty4626LongDesc" style="">
						3-year average annual AFSI for purposes of the $100 million test
						<span class="sty4626DotLn">...............</span>
					</div>
					<div class="sty4626RightNumBox" style="">15</div>
					<div class="sty4626AmtBox" style="">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/ApplcblCorpDeterminationGrp/ThrYrAvgAnnlAFSITestPrpsAmt"/>
						</xsl:call-template>
					</div>
				</div>
				<!-- P1 Line 16 -->
				<div class="styStdDiv">
					<div class="styLNLeftNumBox">16</div>
					<div class="sty4626LongDesc" style="width:178mm;">
						Is line 15 $100 million or more? <br/>
						<input type="checkbox" class="styCkboxNM" style="margin-right:3px;" aria-label="Three year average annual AFSI greater than one hundred million Yes">
							<xsl:call-template name="PopulateYesCheckbox">
								<xsl:with-param name="TargetNode" select="$FormData/ApplcblCorpDeterminationGrp/ThrYrAvgAnnlAFSIAtAboveLmtInd"/>
								<xsl:with-param name="BackupName">F4626/ThrYrAvgAnnlAFSIAtAboveLmtInd</xsl:with-param>
							</xsl:call-template>
						</input>
						<strong>Yes. </strong> Continue to Part II.<br/>
						<input type="checkbox" class="styCkboxNM" style="margin-right:3px;" aria-label="Three year average annual AFSI greater than one hundred million No">
							<xsl:call-template name="PopulateNoCheckbox">
								<xsl:with-param name="TargetNode" select="$FormData/ApplcblCorpDeterminationGrp/ThrYrAvgAnnlAFSIAtAboveLmtInd"/>
								<xsl:with-param name="BackupName">F4626/ThrYrAvgAnnlAFSIAtAboveLmtInd</xsl:with-param>
							</xsl:call-template>
						</input>
						<strong>No. </strong> STOP here. Attach to your tax return.
					</div>
				</div>
				<div class="pageEnd" style="width:187mm;border-top:1px solid black;text-align:right;">
					Form <span class="styBoldText" style="font-size:8pt;">4626</span> (2025)
				</div>
				<div class="styStdDiv" style="border-bottom:1px solid black;vertical-align:bottom;">
					Form 4626 (2025)
					<span style="float:right;">
						Page <span style="font-weight:bold;font-size:9pt;">3</span>
					</span>
				</div>
				<!-- Part 2 Header -->
				<div class="styStdDiv" style="border-bottom:1px solid black;border-top:1px solid black;">
					<span class="styPartName" style="width:16mm;">Part II</span>
					<span class="styPartDesc" style="width:170mm;">Corporate Alternative Minimum Tax (CAMT)</span>
				</div>
				<div class="styStdDiv">
					<div class="styLNLeftNumBoxSD">1</div>
					<div class="styLNDesc">
						Net income or loss per AFS (see instructions):
					</div>
					<div class="styLNRightNumBoxNBB">&nbsp;</div>
					<div class="styLNAmountBoxNBB">&nbsp;</div>
				</div>
				<!-- P2 Line 1a -->
				<div class="styStdDiv">
					<div class="styLNLeftLtrBox">a</div>
					<div class="styLNDesc">
						Consolidated net income or loss per the AFS of the corporation
						<span class="sty4626DotLn">.............</span>
					</div>
					<div class="styLNRightNumBox">1a</div>
					<div class="styLNAmountBox">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/CAMTGrp/CnsldtNetIncmLossPerAFSAmt"/>
						</xsl:call-template>
					</div>
				</div>
				<!-- P2 Line 1b -->
				<div class="styStdDiv">
					<div class="styLNLeftLtrBox">b</div>
					<div class="styLNDesc">
						Include AFS net income or loss of other includible entities (add net income and subtract net loss)
						<span class="sty4626DotLn">...</span>
					</div>
					<div class="styLNRightNumBox">1b</div>
					<div class="styLNAmountBox">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/CAMTGrp/AFSNetIncmLossOtherIncldEntAmt"/>
						</xsl:call-template>
					</div>
				</div>
				<!-- P2 Line 1c -->
				<div class="styStdDiv">
					<div class="styLNLeftLtrBox">c</div>
					<div class="styLNDesc">
						Exclude AFS net income or loss of excludible entities (add net loss and subtract net income)
						<span class="sty4626DotLn">.....</span>
					</div>
					<div class="styLNRightNumBox">1c</div>
					<div class="styLNAmountBox">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/CAMTGrp/AFSNetIncmLossExcldEntAmt"/>
						</xsl:call-template>
					</div>
				</div>
				<!-- P2 Line 1d -->
				<xsl:choose>
					<xsl:when test="$FormData/CAMTGrp/SpcfdAddnlNetIncmLossItemCAmt">
						<div class="styStdDiv">
							<div class="styLNLeftLtrBox">d</div>
							<div class="styLNDesc">
						Specified additional net income or loss item C. Reserved for future use
						<span class="sty4626DotLn">...........</span>
							</div>
							<div class="styLNRightNumBox">1d</div>
							<div class="styLNAmountBox" style="background-color:lightgrey;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/CAMTGrp/SpcfdAddnlNetIncmLossItemCAmt"/>
								</xsl:call-template>
							</div>
						</div>
					</xsl:when>
					<xsl:otherwise>
						<div class="styStdDiv">
							<div class="styLNLeftLtrBox">d</div>
							<div class="styLNDesc">
						Adjustment for certain consolidating entries (see instructions)
						<span class="sty4626DotLn">...............</span>
							</div>
							<div class="styLNRightNumBox">1d</div>
							<div class="styLNAmountBox">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/CAMTGrp/CertainCnsldtEntriesAdjAmt"/>
								</xsl:call-template>
							</div>
						</div>
					</xsl:otherwise>
				</xsl:choose>
				<!-- P2 Line 1e -->
				<div class="styStdDiv">
					<div class="styLNLeftLtrBox">e</div>
					<div class="styLNDesc">
						Specified additional net income or loss item D. Reserved for future use
						<span class="sty4626DotLn">...........</span>
					</div>
					<div class="styLNRightNumBox">1e</div>
					<div class="styLNAmountBox" style="background-color:lightgrey;">
<!--						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/CAMTGrp/SpcfdAddnlNetIncmLossItemDAmt"/>
						</xsl:call-template>-->
					</div>
				</div>
				<!-- P2 Line 1f -->
				<div class="styStdDiv">
					<div class="styLNLeftLtrBox">f</div>
					<div class="styLNDesc">
						AFS net income or loss before adjustments. Combine lines 1a through 1c
						<span class="sty4626DotLn">...........</span>
					</div>
					<div class="styLNRightNumBox">1f</div>
					<div class="styLNAmountBox">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/CAMTGrp/AFSNetIncmLossBfrAdjAmt"/>
						</xsl:call-template>
					</div>
				</div>
				<div class="styStdDiv">
					<div class="styLNLeftNumBoxSD">2</div>
					<div class="styLNDesc">
						Adjustments:
					</div>
					<div class="styLNRightNumBoxNBB">&nbsp;</div>
					<div class="styLNAmountBoxNBB">&nbsp;</div>
				</div>
				<!-- P2 Line 2a -->
				<div class="styStdDiv">
					<div class="styLNLeftLtrBox">a</div>
					<div class="styLNDesc">
						Financial statements covering different tax years
						<span class="sty4626DotLn">..................</span>
					</div>
					<div class="styLNRightNumBox">2a</div>
					<div class="styLNAmountBox">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/CAMTGrp/FinancialStmtDiffTYAmt"/>
						</xsl:call-template>
					</div>
				</div>
				<!-- P2 Line 2b -->
				<div class="styStdDiv">
					<div class="styLNLeftLtrBox">b</div>
					<div class="styLNDesc">
						Reserved for future use &mdash; Adjustment 2b
						<span class="sty4626DotLn">....................</span>
					</div>
					<div class="styLNRightNumBox">2b</div>
					<div class="styLNAmountBox" style="background-color:lightgrey;">
<!--						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/CAMTGrp/Adjustment2bAmt"/>
						</xsl:call-template>-->
					</div>
				</div>
				<!-- P2 Line 2c -->
				<div class="styStdDiv">
					<div class="styLNLeftLtrBox">c</div>
					<div class="styLNDesc">
						Corporations that are not included on the taxpayer's consolidated return (see instructions)
						<span class="sty4626DotLn">.....</span>
					</div>
					<div class="styLNRightNumBox">2c</div>
					<div class="styLNAmountBox">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/CAMTGrp/CorpNotIncldCnsldtReturnAmt"/>
						</xsl:call-template>
					</div>
				</div>
				<!-- P2 Line 2d -->
				<div class="styStdDiv">
					<div class="styLNLeftLtrBox">d</div>
					<div class="styLNDesc">
						The corporation's distributive share of adjusted financial statement income of partnerships
						<span class="sty4626DotLn">.....</span>
					</div>
					<div class="styLNRightNumBox">2d</div>
					<div class="styLNAmountBox">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/CAMTGrp/CorpDistriShrAFSIPrtshpAmt"/>
						</xsl:call-template>
					</div>
				</div>
				<!-- P2 Line 2e -->
				<div class="styStdDiv">
					<div class="styLNLeftLtrBox">e</div>
					<div class="styLNDesc" style="height:auto;">
						Aggregate pro-rata share of adjusted net income from CFCs for which the corporation is a U.S. shareholder. Enter the amount from Part VI, Section II, line 3 (see instructions).
<!--						<xsl:call-template name="SetFormLinkInline">
							<xsl:with-param name="TargetNode" select="$FormData/AggrgtProRataShrAdjCFCAmt"/>
							
						</xsl:call-template> -->
						<span class="sty4626DotLn">.............</span>
					</div>
					<div class="styLNRightNumBox" style="height:7.2mm;">
						<br/>2e</div>
					<div class="styLNAmountBox" style="height:7.2mm;">
						<br/>
<!--B-->
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/AggrgtProRataShrAdjCFCAmt"/>
						</xsl:call-template>
<!--E-->
<!--						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/CAMTGrp/ProRataShrIncmCFCUSShrAmt"/>
						</xsl:call-template>-->
					</div>
				</div>
				<!-- P2 Line 2f -->
				<div class="styStdDiv">
					<div class="styLNLeftLtrBox">f</div>
					<div class="styLNDesc">
						Amounts that are not effectively connected to a U.S. trade or business
						<span class="sty4626DotLn">............</span>
					</div>
					<div class="styLNRightNumBox">2f</div>
					<div class="styLNAmountBox">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/CAMTGrp/AmountsNECUSTrdOrBusAmt"/>
						</xsl:call-template>
					</div>
				</div>
				<!-- P2 Line 2g -->
				<div class="styStdDiv">
					<div class="styLNLeftLtrBox">g</div>
					<div class="styLNDesc">
						Certain taxes. Enter the amount from Part III, line 7
						<span class="sty4626DotLn">.................</span>
					</div>
					<div class="styLNRightNumBox">2g</div>
					<div class="styLNAmountBox">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/CertainTaxesAmt"/>
						</xsl:call-template>
					</div>
				</div>
				<!-- P2 Line 2h -->
				<div class="styStdDiv">
					<div class="styLNLeftLtrBox">h</div>
					<div class="styLNDesc">
						Patronage dividends and per-unit retain allocations (cooperatives only)
						<span class="sty4626DotLn">............</span>
					</div>
					<div class="styLNRightNumBox">2h</div>
					<div class="styLNAmountBox">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/CAMTGrp/PatrDivPerUnitRtnAllocnAmt"/>
						</xsl:call-template>
					</div>
				</div>
				<!-- P2 Line 2i -->
				<div class="styStdDiv">
					<div class="styLNLeftLtrBox">i</div>
					<div class="styLNDesc">
						Alaska native corporations
						<span class="sty4626DotLn">.........................</span>
					</div>
					<div class="styLNRightNumBox">2i</div>
					<div class="styLNAmountBox">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/CAMTGrp/AlaskaNativeCorporationsAmt"/>
						</xsl:call-template>
					</div>
				</div>
				<!-- P2 Line 2j -->
				<div class="styStdDiv">
					<div class="styLNLeftLtrBox">j</div>
					<div class="styLNDesc">
						Certain credits (see instructions)
						<span class="sty4626DotLn">.......................</span>
					</div>
					<div class="styLNRightNumBox">2j</div>
					<div class="styLNAmountBox">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/CAMTGrp/CertainCreditsAmt"/>
						</xsl:call-template>
					</div>
				</div>
				<!-- P2 Line 2k -->
				<div class="styStdDiv">
					<div class="styLNLeftLtrBox">k</div>
					<div class="styLNDesc">
						Mortgage servicing income
						<span class="sty4626DotLn">.........................</span>
					</div>
					<div class="styLNRightNumBox">2k</div>
					<div class="styLNAmountBox">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/CAMTGrp/MortgageServicingIncomeAmt"/>
						</xsl:call-template>
					</div>
				</div>
				<!-- P2 Line 2l -->
				<div class="styStdDiv">
					<div class="styLNLeftLtrBox">l</div>
					<div class="styLNDesc">
						Covered benefit plans described in section 56A(c)(11)(B)
						<span class="sty4626DotLn">................</span>
					</div>
					<div class="styLNRightNumBox">2l</div>
					<div class="styLNAmountBox">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/CAMTGrp/CvrBnftPlansSect56Ac11BAmt"/>
						</xsl:call-template>
					</div>
				</div>
				<!-- P2 Line 2m -->
				<div class="styStdDiv">
					<div class="styLNLeftLtrBox">m</div>
					<div class="styLNDesc">
						Tax-exempt entities (organizations subject to tax under section 511)
						<span class="sty4626DotLn">............</span>
					</div>
					<div class="styLNRightNumBox">2m</div>
					<div class="styLNAmountBox">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/CAMTGrp/TaxExemptEntSubjTxSect511Amt"/>
						</xsl:call-template>
					</div>
				</div>
				<!-- P2 Line 2n -->
				<div class="styStdDiv">
					<div class="styLNLeftLtrBox">n</div>
					<div class="styLNDesc">
						Depreciation
						<span class="sty4626DotLn">.............................</span>
					</div>
					<div class="styLNRightNumBox">2n</div>
					<div class="styLNAmountBox">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/CAMTGrp/DepreciationAmt"/>
						</xsl:call-template>
					</div>
				</div>
				<!-- P2 Line 2o -->
				<div class="styStdDiv">
					<div class="styLNLeftLtrBox">o</div>
					<div class="styLNDesc">
						Qualified wireless spectrum
						<span class="sty4626DotLn">.........................</span>
					</div>
					<div class="styLNRightNumBox">2o</div>
					<div class="styLNAmountBox">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/CAMTGrp/QualifiedWirelessSpectrumAmt"/>
						</xsl:call-template>
					</div>
				</div>
				<!-- P2 Line 2p -->
				<div class="styStdDiv">
					<div class="styLNLeftLtrBox">p</div>
					<div class="styLNDesc">
						Covered transactions
						<span class="sty4626DotLn">...........................</span>
					</div>
					<div class="styLNRightNumBox">2p</div>
					<div class="styLNAmountBox">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/CAMTGrp/CoveredTransactionsAmt"/>
						</xsl:call-template>
					</div>
				</div>
				<!-- P2 Line 2q -->
				<div class="styStdDiv">
					<div class="styLNLeftLtrBox">q</div>
					<div class="styLNDesc">
						Adjustments related to bankruptcy and insolvency
						<span class="sty4626DotLn">..................</span>
					</div>
					<div class="styLNRightNumBox">2q</div>
					<div class="styLNAmountBox">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/CAMTGrp/BankruptcyAndInsolvencyAdjAmt"/>
						</xsl:call-template>
					</div>
				</div>
				<!-- P2 Line 2r -->
				<div class="styStdDiv">
					<div class="styLNLeftLtrBox">r</div>
					<div class="styLNDesc">
						Certain insurance company adjustments
						<span class="sty4626DotLn">.....................</span>
					</div>
					<div class="styLNRightNumBox">2r</div>
					<div class="styLNAmountBox">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/CAMTGrp/CertainInsuranceCompanyAdjAmt"/>
						</xsl:call-template>
					</div>
				</div>
				<!-- P2 Line 2s -->
				<div class="styStdDiv">
					<div class="styLNLeftLtrBox">s</div>
					<div class="styLNDesc">
						AFSI adjustment S &mdash; Reserved for future use
						<span class="sty4626DotLn">...................</span>
					</div>
					<div class="styLNRightNumBox">2s</div>
					<div class="styLNAmountBox" style="background-color:lightgrey;">
<!--						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/CAMTGrp/AFSIAdjustmentSAmt"/>
						</xsl:call-template>-->
					</div>
				</div>
				<!-- P2 Line 2t -->
				<div class="styStdDiv">
					<div class="styLNLeftLtrBox">t</div>
					<div class="styLNDesc">
						AFSI adjustment T &mdash; Reserved for future use
						<span class="sty4626DotLn">...................</span>
					</div>
					<div class="styLNRightNumBox">2t</div>
					<div class="styLNAmountBox" style="background-color:lightgrey;">
<!--						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/CAMTGrp/AFSIAdjustmentTAmt"/>
						</xsl:call-template>-->
					</div>
				</div>
				<!-- P2 Line 2u -->
				<div class="styStdDiv">
					<div class="styLNLeftLtrBox">u</div>
					<div class="styLNDesc">
						AFSI adjustment U &mdash; Reserved for future use
						<span class="sty4626DotLn">...................</span>
					</div>
					<div class="styLNRightNumBox">2u</div>
					<div class="styLNAmountBox" style="background-color:lightgrey;">
<!--						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/CAMTGrp/AFSIAdjustmentUAmt"/>
						</xsl:call-template>-->
					</div>
				</div>
				<!-- P2 Line 2z -->
				<div class="styStdDiv">
					<div class="styLNLeftLtrBox">z</div>
					<div class="styLNDesc">
						Other (see instructions)
						<span class="sty4626DotLn">..........................</span>
					</div>
					<div class="styLNRightNumBox">2z</div>
					<div class="styLNAmountBox">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/CAMTGrp/OtherAmt"/>
						</xsl:call-template>
					</div>
				</div>
				<!-- P2 Line 3 -->
				<div class="styStdDiv">
					<div class="styLNLeftNumBoxSD">3</div>
					<div class="styLNDesc">
						Total adjustments. Combine lines 2a through 2z
						<span class="sty4626DotLn">...................</span>
					</div>
					<div class="styLNRightNumBox">3</div>
					<div class="styLNAmountBox">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/CAMTGrp/TotalAdjustmentsAmt"/>
						</xsl:call-template>
					</div>
				</div>
				<!-- P2 Line 4 -->
				<div class="styStdDiv">
					<div class="styLNLeftNumBoxSD">4</div>
					<div class="styLNDesc">
						AFSI before financial statement net operating loss carryover. Combine lines 1f and 3
						<span class="sty4626DotLn">.......</span>
					</div>
					<div class="styLNRightNumBox">4</div>
					<div class="styLNAmountBox">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/CAMTGrp/AFSIBeforeFSNOLCarryoverAmt"/>
						</xsl:call-template>
					</div>
				</div>
				<!-- P2 Line 5 -->
				<div class="styStdDiv">
					<div class="styLNLeftNumBoxSD">5</div>
					<div class="styLNDesc">
						Financial statement net operating loss (FSNOL) (see instructions)
						<span class="sty4626DotLn">.............</span>
					</div>
					<div class="styLNRightNumBox">5</div>
					<div class="styLNAmountBox">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/CAMTGrp/FSNOLAmt"/>
						</xsl:call-template>
					</div>
				</div>
				<!-- P2 Line 6 -->
				<div class="styStdDiv">
					<div class="styLNLeftNumBoxSD">6</div>
					<div class="styLNDesc">
						AFSI. Subtract line 5 from line 4. If zero or less, enter -0-
						<span class="sty4626DotLn">................</span>
					</div>
					<div class="styLNRightNumBox">6</div>
					<div class="styLNAmountBox">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/CAMTGrp/AFSIAmt"/>
						</xsl:call-template>
					</div>
				</div>
				<!-- P2 Line 7 -->
				<div class="styStdDiv">
					<div class="styLNLeftNumBoxSD">7</div>
					<div class="styLNDesc">
						Multiply line 6 by 15% (0.15)
						<span class="sty4626DotLn">........................</span>
					</div>
					<div class="styLNRightNumBox">7</div>
					<div class="styLNAmountBox">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/CAMTGrp/BaseAFSIMinimumTaxAmt"/>
						</xsl:call-template>
					</div>
				</div>
				<!-- P2 Line 8 -->
				<div class="styStdDiv">
					<div class="styLNLeftNumBoxSD">8</div>
					<div class="styLNDesc" style="font-family:Arial Narrow;font-size:8pt;">
						Corporate alternative minimum tax foreign tax credit (CAMT FTC). Enter amount from Part IV, Section I, line 6 (see instructions)
						<span class="sty4626DotLn" style="font-family:Verdana;font-size:7pt;">.</span>
					</div>
					<div class="styLNRightNumBox">8</div>
					<div class="styLNAmountBox">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/TotalAMTFTCAmt"/>
						</xsl:call-template>
					</div>
				</div>
				<!-- P2 Line 9 -->
				<div class="styStdDiv">
					<div class="styLNLeftNumBoxSD">9</div>
					<div class="styLNDesc">
						Tentative minimum tax. Subtract line 8 from line 7. If zero or less, enter -0-
						<span class="sty4626DotLn">..........</span>
					</div>
					<div class="styLNRightNumBox">9</div>
					<div class="styLNAmountBox">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/CAMTGrp/TentativeMinimumTaxAmt"/>
						</xsl:call-template>
					</div>
				</div>
				<!-- P2 Line 10 -->
				<div class="styStdDiv">
					<div class="styLNLeftNumBox">10</div>
					<div class="styLNDesc">
						Regular tax liability (see instructions)
						<span class="sty4626DotLn">......................</span>
					</div>
					<div class="styLNRightNumBox">10</div>
					<div class="styLNAmountBox">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/CAMTGrp/RegularTaxLiabilityAmt"/>
						</xsl:call-template>
					</div>
				</div>
				<!-- P2 Line 11 -->
				<div class="styStdDiv">
					<div class="styLNLeftNumBox">11</div>
					<div class="styLNDesc">
						Base erosion minimum tax (see instructions)
						<span class="sty4626DotLn">....................</span>
					</div>
					<div class="styLNRightNumBox">11</div>
					<div class="styLNAmountBox">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/CAMTGrp/BaseErosionMinimumTaxAmt"/>
						</xsl:call-template>
					</div>
				</div>
				<!-- P2 Line 12 -->
				<div class="styStdDiv">
					<div class="styLNLeftNumBox">12</div>
					<div class="styLNDesc">
						Combine lines 10 and 11
						<span class="sty4626DotLn">..........................</span>
					</div>
					<div class="styLNRightNumBox">12</div>
					<div class="styLNAmountBox">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/CAMTGrp/CombinedTaxLiabilityAmt"/>
						</xsl:call-template>
					</div>
				</div>
				<!-- P2 Line 13 -->
				<div class="styStdDiv">
					<div class="styLNLeftNumBox">13</div>
					<div class="styLNDesc" style="height:auto;">
						Alternative minimum tax. Subtract line 12 from line 9. If zero or less, enter -0-. Enter here and on Form 
						1120, Schedule J, line 3, or the appropriate line of the corporation’s income tax return
						<span class="sty4626DotLn">.......</span>
					</div>
					<div class="styLNRightNumBoxNBB" style="height:7.2mm;">
						<br/>13</div>
					<div class="styLNAmountBoxNBB" style="height:7.2mm;">
						<br/>
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/CAMTGrp/CorpAlternativeMinimumTaxAmt"/>
						</xsl:call-template>
					</div>
				</div>
				<!-- Part 3 Header -->
				<div class="styStdDiv" style="border-bottom:1px solid black;border-top:1px solid black;">
					<span class="styPartName" style="width:16mm;">Part III</span>
					<span class="styPartDesc" style="width:170mm;">Adjustment for Certain Taxes Under Section 56A(c)(5)</span>
				</div>
				<!-- P3 Line 1 -->
				<div class="styStdDiv">
					<div class="styLNLeftNumBoxSD">1</div>
					<div class="styLNDesc">
						Current income tax provision &mdash; Foreign
						<span class="sty4626DotLn">.....................</span>
					</div>
					<div class="styLNRightNumBox">1</div>
					<div class="styLNAmountBox">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/CurrentITProvisionForeignAmt"/>
						</xsl:call-template>
					</div>
				</div>
				<!-- P3 Line 2 -->
				<div class="styStdDiv">
					<div class="styLNLeftNumBoxSD">2</div>
					<div class="styLNDesc">
						Current income tax provision &mdash; Federal
						<span class="sty4626DotLn">.....................</span>
					</div>
					<div class="styLNRightNumBox">2</div>
					<div class="styLNAmountBox">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/CurrentITProvisionFederalAmt"/>
						</xsl:call-template>
					</div>
				</div>
				<!-- P3 Line 3 -->
				<div class="styStdDiv">
					<div class="styLNLeftNumBoxSD">3</div>
					<div class="styLNDesc">
						Deferred income tax provision &mdash; Foreign
						<span class="sty4626DotLn">.....................</span>
					</div>
					<div class="styLNRightNumBox">3</div>
					<div class="styLNAmountBox">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/DeferredITProvisionForeignAmt"/>
						</xsl:call-template>
					</div>
				</div>
				<!-- P3 Line 4 -->
				<div class="styStdIBDiv">
					<div class="styLNLeftNumBoxSD">4</div>
					<div class="styLNDesc">
						Deferred income tax provision &mdash; Federal
						<span class="sty4626DotLn">.....................</span>
					</div>
					<div class="styLNRightNumBox">4</div>
					<div class="styLNAmountBox">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/DeferredITProvisionFederalAmt"/>
						</xsl:call-template>
					</div>
				</div>
				<!-- P3 Line 5 -->
				<div class="styStdIBDiv">
					<div class="styLNLeftNumBoxSD">5</div>
					<div class="styLNDesc">
						Income taxes included in equity method investment income
						<span class="sty4626DotLn">...............</span>
					</div>
					<div class="styLNRightNumBox">5</div>
					<div class="styLNAmountBox">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/IncmTxsEquityMthdInvstIncmAmt"/>
						</xsl:call-template>
					</div>
				</div>
				<!-- P3 Line 6a -->
				<div class="styStdIBDiv">
					<div class="styLNLeftNumBoxSD">6a</div>
					<div class="styLNDesc">
						Adjustment A &mdash; Reserved for future use
						<span class="sty4626DotLn">.....................</span>
					</div>
					<div class="styLNRightNumBox">6a</div>
					<div class="styLNAmountBox" style="background-color:lightgrey;">
<!--						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/AdjustmentAAmt"/>
						</xsl:call-template>-->
					</div>
				</div>
				<!-- P3 Line 6b -->
				<div class="styStdIBDiv">
					<div class="styLNLeftNumBoxSD" style="padding-left:4.2mm;">b</div>
					<div class="styLNDesc">
						Adjustment B &mdash; Reserved for future use
						<span class="sty4626DotLn">.....................</span>
					</div>
					<div class="styLNRightNumBox">6b</div>
					<div class="styLNAmountBox" style="background-color:lightgrey;">
<!--						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/AdjustmentBAmt"/>
						</xsl:call-template>-->
					</div>
				</div>
				<!-- P3 Line 6c -->
				<div class="styStdIBDiv">
					<div class="styLNLeftNumBoxSD" style="padding-left:4.2mm;">c</div>
					<div class="styLNDesc">
						Adjustment C &mdash; Reserved for future use
						<span class="sty4626DotLn">.....................</span>
					</div>
					<div class="styLNRightNumBox">6c</div>
					<div class="styLNAmountBox" style="background-color:lightgrey;">
<!--						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/AdjustmentCAmt"/>
						</xsl:call-template>-->
					</div>
				</div>
				<!-- P3 Line 6d -->
				<div class="styStdIBDiv">
					<div class="styLNLeftNumBoxSD" style="padding-left:4.2mm;">d</div>
					<div class="styLNDesc">
						Adjustment D &mdash; Reserved for future use
						<span class="sty4626DotLn">.....................</span>
					</div>
					<div class="styLNRightNumBox">6d</div>
					<div class="styLNAmountBox" style="background-color:lightgrey;">
<!--						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/AdjustmentDAmt"/>
						</xsl:call-template>-->
					</div>
				</div>
				<!-- P3 Line 6e -->
				<div class="styStdIBDiv">
					<div class="styLNLeftNumBoxSD" style="padding-left:4.2mm;">e</div>
					<div class="styLNDesc">
						Adjustment E &mdash; Reserved for future use
						<span class="sty4626DotLn">.....................</span>
					</div>
					<div class="styLNRightNumBox">6e</div>
					<div class="styLNAmountBox" style="background-color:lightgrey;">
<!--						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/AdjustmentEAmt"/>
						</xsl:call-template>-->
					</div>
				</div>
				<!-- P3 Line 6f -->
				<div class="styStdIBDiv">
					<div class="styLNLeftNumBoxSD" style="padding-left:4.2mm;">f</div>
					<div class="styLNDesc">
						Adjustment F &mdash; Reserved for future use
						<span class="sty4626DotLn">.....................</span>
					</div>
					<div class="styLNRightNumBox">6f</div>
					<div class="styLNAmountBox" style="background-color:lightgrey;">
<!--						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/AdjustmentFAmt"/>
						</xsl:call-template>-->
					</div>
				</div>
				<!-- P3 Line 6g -->
				<div class="styStdIBDiv">
					<div class="styLNLeftNumBoxSD" style="padding-left:4.2mm;">g</div>
					<div class="styLNDesc">
						Adjustment G &mdash; Reserved for future use
						<span class="sty4626DotLn">.....................</span>
					</div>
					<div class="styLNRightNumBox">6g</div>
					<div class="styLNAmountBox" style="background-color:lightgrey;">
<!--						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/AdjustmentGAmt"/>
						</xsl:call-template>-->
					</div>
				</div>
				<!-- P3 Line 6h -->
				<div class="styStdIBDiv">
					<div class="styLNLeftNumBoxSD" style="padding-left:4.2mm;">h</div>
					<div class="styLNDesc">
						Adjustment H &mdash; Reserved for future use
						<span class="sty4626DotLn">.....................</span>
					</div>
					<div class="styLNRightNumBox">6h</div>
					<div class="styLNAmountBox" style="background-color:lightgrey;">
<!--						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/AdjustmentHAmt"/>
						</xsl:call-template>-->
					</div>
				</div>
				<!-- P3 Line 6z -->
				<div class="styStdIBDiv">
					<div class="styLNLeftNumBoxSD" style="padding-left:4.2mm;">z</div>
					<div class="styLNDesc">
						Income taxes in other places
						<span class="sty4626DotLn">........................</span>
					</div>
					<div class="styLNRightNumBox">6z</div>
					<div class="styLNAmountBox">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/IncmTxsOtherPlacesAmt"/>
						</xsl:call-template>
					</div>
				</div>
				<!-- P3 Line 7 -->
				<div class="styStdIBDiv">
					<div class="styLNLeftNumBoxSD">7</div>
					<div class="styLNDesc">
						Total. Combine lines 1 through 6z. Enter here and on Part II, line 2g
						<span class="sty4626DotLn">............</span>
					</div>
					<div class="styLNRightNumBoxNBB">7</div>
					<div class="styLNAmountBoxNBB">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/CertainTaxesAmt"/>
						</xsl:call-template>
					</div>
				</div>
				<div class="pageEnd" style="width:187mm;border-top:1px solid black;text-align:right;">
					Form <span class="styBoldText" style="font-size:8pt;">4626</span> (2025)
				</div>
				<div class="styStdDiv" style="border-bottom:1px solid black;vertical-align:bottom;">
					Form 4626 (2025)
					<span style="float:right;">
						Page <span style="font-weight:bold;font-size:9pt;">4</span>
					</span>
				</div>
				<!-- Part 4 Header -->
				<div class="styStdDiv" style="border-bottom:1px solid black;border-top:1px solid black;">
					<span class="styPartName" style="width:16mm;">Part IV</span>
					<span class="styPartDesc" style="width:170mm;">Corporate Alternative Minimum Tax &mdash; Foreign Tax Credit</span>
				</div>
				<div class="styStdDiv" style="padding-top:1px;padding-bottom:1px;font-weight:bold;font-size:8pt;border-top:1px solid black;border-bottom:1px solid black;">
					Section I &mdash; CAMT Foreign Tax Credit
<!--					Section I-->
				</div>
				<!-- P4 Line 1 -->
				<div class="styStdDiv">
					<div class="styLNLeftNumBoxSD">1</div>
					<div class="styLNDesc" style="width:98mm;">
						Domestic corporation CAMT foreign income taxes:
					</div>
					<div class="styLNRightNumBoxNBB">&nbsp;</div>
					<div class="styLNAmountBoxNBB">&nbsp;</div>
					<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;">&nbsp;</div>
					<div class="styLNAmountBoxNBB">&nbsp;</div>
				</div>
				<!-- P4 Line 1a -->
				<div class="styStdIBDiv">
					<div class="styLNLeftLtrBox">a</div>
					<div class="styLNDesc" style="width:98mm;min-height:4mm;height:auto;">
						Total foreign taxes paid or accrued as reported on Form 1118, Schedule B, Part I, column 2(j)
						<span class="sty4626DotLn">..................</span>
					</div>
					<div class="styLNRightNumBox" style="height:7.2mm;">
						<br/>1a</div>
					<div class="styLNAmountBox" style="height:7.2mm;padding-right:0.5mm;">
						<br/>
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/TotalForeignTaxesPaidOrAccrAmt"/>
						</xsl:call-template>
					</div>
					<div class="styLNRightNumBoxNBB" style="height:7.2mm;background-color:lightgrey;">&nbsp;</div>
					<div class="styLNAmountBoxNBB" style="height:7.2mm;">&nbsp;</div>
				</div>
				<!-- P4 Line 1b+ -->
				<xsl:variable name="sepP4" select="($Print = $Separated) and (count($FormData/DomCorpAMTFrgnIncmTxsAdjGrp) &gt; 6)"/>
				<xsl:if test="not($sepP4)">
					<xsl:for-each select="$FormData/DomCorpAMTFrgnIncmTxsAdjGrp">
						<xsl:variable name="letter">
							<xsl:number format="a" value="position() + 1"/>
						</xsl:variable>
						<div class="styStdIBDiv">
							<div class="styLNLeftLtrBox">
								<xsl:value-of select="$letter"/>
							</div>
							<div class="styLNDesc" style="width:98mm;min-height:4mm;height:auto;">
								Adjustment
								<span style="width:80mm;min-height:3mm;border-bottom:1px solid black;">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="AdjustmentTypeDesc"/>
									</xsl:call-template>
								</span>
							</div>
							<div class="styLNRightNumBox" style="height:4.2mm;">1<xsl:value-of select="$letter"/>
							</div>
							<div class="styLNAmountBox" style="height:4.2mm;padding-right:0.5mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="AdjustmentAmt"/>
								</xsl:call-template>
							</div>
							<div class="styLNRightNumBoxNBB" style="height:4.2mm;background-color:lightgrey;">&nbsp;</div>
							<div class="styLNAmountBoxNBB" style="height:4.2mm;">&nbsp;</div>
						</div>
					</xsl:for-each>
				</xsl:if>
				<xsl:call-template name="P4L1Filler">
					<xsl:with-param name="Start" select="count($FormData/DomCorpAMTFrgnIncmTxsAdjGrp) + 1"/>
					<xsl:with-param name="Sep" select="$sepP4"/>
				</xsl:call-template>
				<!-- P4 Line 2 -->
				<div class="styStdDiv">
					<div class="styLNLeftNumBoxSD">2</div>
					<div class="styLNDesc" style="">
						Total domestic corporation CAMT foreign income taxes. Combine lines 1a through 1g
						<span class="sty4626DotLn">.......</span>
					</div>
					<div class="styLNRightNumBox">2</div>
					<div class="styLNAmountBox">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/TotDomCorpAMTFrgnIncmTxsAmt"/>
						</xsl:call-template>
					</div>
				</div>
				<!-- P4 Line 3 -->
				<div class="styStdDiv">
					<div class="styLNLeftNumBoxSD">3</div>
					<div class="styLNDesc" style="width:98mm;">
						Allowable CFC CAMT foreign income taxes:
					</div>
					<div class="styLNRightNumBoxNBB">&nbsp;</div>
					<div class="styLNAmountBoxNBB">&nbsp;</div>
					<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;">&nbsp;</div>
					<div class="styLNAmountBoxNBB">&nbsp;</div>
				</div>
				<!-- P4 Line 3a -->
				<div class="styStdIBDiv">
					<div class="styLNLeftLtrBox">a</div>
					<div class="styLNDesc" style="width:98mm;">
						Pro-rata share of CFC CAMT foreign income taxes from Part IV, Section II, line 11, column (n)
						<span class="sty4626DotLn">...................</span>
					</div>
					<div class="styLNRightNumBox" style="height:7.2mm;">
						<br/>3a</div>
					<div class="styLNAmountBox" style="height:7.2mm;padding-right:0.5mm;">
						<br/>
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/TotProRataCFCAMTFrgnIncmTxsAmt"/>
						</xsl:call-template>
					</div>
					<div class="styLNRightNumBoxNBB" style="height:7.2mm;background-color:lightgrey;">&nbsp;</div>
					<div class="styLNAmountBoxNBB" style="height:7.2mm;">&nbsp;</div>
				</div>
				<!-- P4 Line 3b - Add new one -->
				<div class="styStdIBDiv">
					<div class="styLNLeftLtrBox">b</div>
					<div class="styLNDesc" style="width:98mm;font-family:Arial;">
						Other
						<span class="sty4626DotLn" style="font-family:Verdana;">......................</span>
					</div>
					<div class="styLNRightNumBox" style="height:4.2mm;">3b</div>
					<div class="styLNAmountBox" style="height:4.2mm;padding-right:0.5mm;">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/OtherCAMTFrgnIncmTxsAmt"/>
						</xsl:call-template>
					</div>
					<div class="styLNRightNumBoxNBB" style="height:4.2mm;background-color:lightgrey;">&nbsp;</div>
					<div class="styLNAmountBoxNBB" style="height:4.2mm;">&nbsp;</div>
				</div>				
				<!-- P4 Line 3c - 3b OLD-->
				<div class="styStdIBDiv">
					<div class="styLNLeftLtrBox">c</div>
					<div class="styLNDesc" style="width:98mm;font-family:Arial;">
						Carryover of excess foreign taxes (from Part IV, Section III, line 4, column (vii))
						<span class="sty4626DotLn" style="font-family:Verdana;">..</span>
					</div>
					<div class="styLNRightNumBox" style="height:4.2mm;">3c</div>
					<div class="styLNAmountBox" style="height:4.2mm;padding-right:0.5mm;">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/AdjustedFrgnTxCyovPriorYrGrp/TotalAmt"/>
						</xsl:call-template>
					</div>
					<div class="styLNRightNumBoxNBB" style="height:4.2mm;background-color:lightgrey;">&nbsp;</div>
					<div class="styLNAmountBoxNBB" style="height:4.2mm;">&nbsp;</div>
				</div>
				<!-- P4 Line 3d -->
				<div class="styStdDiv">
					<div class="styLNLeftLtrBox">d</div>
					<div class="styLNDesc" style="">
						Total CFC CAMT foreign income taxes. Add lines 3a, 3b, and 3c.
						<span class="sty4626DotLn">..............</span>
					</div>
					<div class="styLNRightNumBox">3d</div>
					<div class="styLNAmountBox">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/TotalCFCAMTFrgnIncmTxsAmt"/>
						</xsl:call-template>
					</div>
				</div>
				<!-- P4 Line 3e -->
				<div class="styStdIBDiv">
					<div class="styLNLeftLtrBox">e</div>
					<div class="styLNDesc" style="width:98mm;">
						Percentage specified in section 55(b)(2)(A)(i)
						<span class="sty4626DotLn">..........</span>
					</div>
					<div class="styLNRightNumBox" style="height:4.2mm;">3e</div>
					<div class="styLNAmountBox" style="height:4.2mm;padding-right:0.5mm;">15%</div>
					<div class="styLNRightNumBoxNBB" style="height:4.2mm;background-color:lightgrey;">&nbsp;</div>
					<div class="styLNAmountBoxNBB" style="height:4.2mm;">&nbsp;</div>
				</div>
				<!-- P4 Line 3f -->
				<div class="styStdIBDiv">
					<div class="styLNLeftLtrBox">f</div>
					<div class="styLNDesc" style="width:98mm;min-height:4mm;height:auto;">
Aggregate pro-rata share of adjusted net income from CFCs for which the corporation is a U.S. shareholder. Enter the amount from Part VI, Section II, line 3 (see instructions). 
						<span class="sty4626DotLn">................</span>
					</div>
					<div class="styLNRightNumBox" style="height:10.2mm;">
						<br/><br/>3f</div>
					<div class="styLNAmountBox" style="height:10.2mm;padding-right:0.5mm;">
						<br/><br/>					
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/AggrgtProRataShrAdjCFCAmt"/>
						</xsl:call-template>					

					</div>
					<div class="styLNRightNumBoxNBB" style="height:10.2mm;background-color:lightgrey;">&nbsp;</div>
					<div class="styLNAmountBoxNBB" style="height:10.2mm;">&nbsp;</div>
				</div>
				<!-- P4 Line 3g -->
				<div class="styStdDiv">
					<div class="styLNLeftLtrBox">g</div>
					<div class="styLNDesc" style="">
						CFC CAMT FTC limitation (multiply line 3e by line 3f)
						<span class="sty4626DotLn">.................</span>
					</div>
					<div class="styLNRightNumBox">3g</div>
					<div class="styLNAmountBox">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/CFCAMTForeignTxCrLimitationAmt"/>
						</xsl:call-template>
					</div>
				</div>
				<!-- P4 Line 3h -->
				<div class="styStdDiv">
					<div class="styLNLeftLtrBox">h</div>
					<div class="styLNDesc" style="">
						Allowable CFC CAMT foreign income taxes (lesser of line 3d or line 3g)
						<span class="sty4626DotLn">............</span>
					</div>
					<div class="styLNRightNumBox">3h</div>
					<div class="styLNAmountBox">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/AllwblCFCAMTFrgnIncmTxsAmt"/>
						</xsl:call-template>
					</div>
				</div>
				<!-- P4 Line 4 -->
				<div class="styStdDiv">
					<div class="styLNLeftNumBoxSD">4</div>
					<div class="styLNDesc" style="">
						CAMT FTC Line 4 &mdash; Reserved for future use
						<span class="sty4626DotLn">....................</span>
					</div>
					<div class="styLNRightNumBox">4</div>
					<div class="styLNAmountBox" style="background-color:lightgrey;">
<!--						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/AMTFTC1Amt"/>
						</xsl:call-template>-->
					</div>
				</div>
				<!-- P4 Line 5 -->
				<div class="styStdDiv">
					<div class="styLNLeftNumBoxSD">5</div>
					<div class="styLNDesc" style="">
						CAMT FTC Line 5 &mdash; Reserved for future use
						<span class="sty4626DotLn">....................</span>
					</div>
					<div class="styLNRightNumBox">5</div>
					<div class="styLNAmountBox" style="background-color:lightgrey;">
<!--						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/AMTFTC2Amt"/>
						</xsl:call-template>-->
					</div>
				</div>
				<!-- P4 Line 6 -->
				<div class="styStdDiv">
					<div class="styLNLeftNumBoxSD">6</div>
					<div class="styLNDesc" style="">
						Total CAMT foreign income taxes. Combine lines 2 and 3h. Enter this amount on Part II, line 8
						<span class="sty4626DotLn">.....</span>
					</div>
					<div class="styLNRightNumBoxNBB">6</div>
					<div class="styLNAmountBoxNBB">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/TotalAMTFTCAmt"/>
						</xsl:call-template>
					</div>
				</div>
				<div class="pageEnd" style="width:187mm;border-top:1px solid black;text-align:right;">
					Form <span class="styBoldText" style="font-size:8pt;">4626</span> (2025)
				</div>
				<!-- Page 5 -->
				<div class="styStdDivLS">
					Form 4626 (2025)
					<span style="float:right;">Page <span style="font-weight:bold;font-size:8pt;">5</span>
					</span>
				</div>
				<!-- Part 4 -->
				<div class="styStdDivLS" style="border-top:1px solid black;border-bottom:1px solid black;">
					<div class="styPartName" style="">Part IV</div>
					<div class="styPartDesc" style="">
						Corporate Alternative Minimum Tax &mdash; Foreign Tax Credit <span style="font-style:italic;">(continued)</span>
					</div>
				</div>
				<div class="styStdDivLS" style="padding-top:1px;padding-bottom:1px;font-weight:bold;font-size:8pt;">
					Section II &mdash; Allowable CFC CAMT Foreign Income Taxes
				</div>
				<xsl:variable name="sep4-2" select="($Print = $Separated) and (count($FormData/AllwblCFCAMTFrgnIncmTxsGrp) &gt; 10)"/>
				<div class="styTableContainerLandscapeNBB" id="Part4Table1">
					<xsl:call-template name="SetInitialState"/>
					<table class="styTable" style="border-collapse:collapse;font-size:7pt;">
						<thead class="styTableThead">
							<tr style="border-top:1px solid black;vertical-align:top;">
								<th class="styTableCellHeader" scope="col" style="width:8mm;font-weight:normal;">&nbsp;</th>
								<th class="styTableCellHeader" scope="col" style="width:84mm;font-weight:normal;">
									<strong>(a)</strong>
									<br/> Name of CFC
								</th>
								<th class="styTableCellHeader" scope="col" style="width:40mm;font-weight:normal;">
									<strong>(b)</strong>
									<br/> EIN or <br/> reference ID number<br/> of CFC
								</th>
								<th class="styTableCellHeader" scope="col" style="width:31mm;font-weight:normal">
									<strong>(c)</strong>
									<br/> CFC Income
								</th>
								<th class="styTableCellHeader" scope="col" style="width:31mm;font-weight:normal">
									<strong>(d)</strong>
									<br/> Foreign taxes <br/> for which credit <br/> is allowed
								</th>
								<th class="styTableCellHeader" scope="col" style="width:31mm;font-weight:normal">
									<strong>(e)</strong>
									<br/> Adjustment <br/>
									<br/>
									<span style="width:27mm;min-height:3.5mm;padding-bottom:1px;border-bottom:1px solid black;margin-bottom:2mm;">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$FormData/AdjustmentEDesc"/>
										</xsl:call-template>
									</span>
								</th>
								<th class="styTableCellHeader" scope="col" style="width:31mm;font-weight:normal;border-right-width:0px;">
									<strong>(f)</strong>
									<br/> Adjustment <br/>
									<br/>
									<span style="width:27mm;min-height:3.5mm;padding-bottom:1px;border-bottom:1px solid black;margin-bottom:2mm;">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$FormData/AdjustmentFDesc"/>
										</xsl:call-template>
									</span>
								</th>
							</tr>
						</thead>
						<tbody>
							<xsl:if test="not(sep4-2)">
								<xsl:for-each select="$FormData/AllwblCFCAMTFrgnIncmTxsGrp">
									<tr style="vertical-align:bottom;">
										<td class="styTableCellCtrInherit" style="font-weight:bold;">
											<xsl:number value="position()" format="1"/>
										</td>
										<td class="styTableCellTextInherit" style="">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="CFCName/BusinessNameLine1Txt"/>
											</xsl:call-template>
											<xsl:if test="CFCName/BusinessNameLine2Txt">
												<br/>
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="CFCName/BusinessNameLine2Txt"/>
												</xsl:call-template>
											</xsl:if>
										</td>
										<td class="styTableCellCtrInherit" style="word-break:break-all;">
											<xsl:choose>
												<xsl:when test="count(ForeignEntityIdentificationGrp) &gt; 1">
													<xsl:call-template name="LinkToLeftoverDataTableInline">
														<xsl:with-param name="TargetNode" select="ForeignEntityIdentificationGrp"/>
														<xsl:with-param name="Desc">Part IV, Section II, Row <xsl:value-of select="position()"/> - Foreign Entity Identification Groups</xsl:with-param>
													</xsl:call-template>
												</xsl:when>
												<xsl:when test="ForeignEntityIdentificationGrp">
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="ForeignEntityIdentificationGrp/ForeignEntityReferenceIdNum"/>
													</xsl:call-template>
												</xsl:when>
												<xsl:otherwise>
													<xsl:call-template name="PopulateEIN">
														<xsl:with-param name="TargetNode" select="CFCEIN"/>
													</xsl:call-template>
												</xsl:otherwise>
											</xsl:choose>
										</td>
										<td class="styTableCellAmtInherit" style="">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="CFCIncomeAmt"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellAmtInherit" style="">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="ForeignTaxesCreditAllowedAmt"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellAmtInherit" style="">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="AdjustmentEAmt"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellAmtInherit" style="border-right-width:0px;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="AdjustmentFAmt"/>
											</xsl:call-template>
										</td>
									</tr>
								</xsl:for-each>
							</xsl:if>
							<xsl:if test="$sep4-2 or (count($FormData/AllwblCFCAMTFrgnIncmTxsGrp) &lt; 10)">
								<xsl:call-template name="FillTable7ColsN">
									<xsl:with-param name="Start" select="1 + count($FormData/AllwblCFCAMTFrgnIncmTxsGrp)"/>
									<xsl:with-param name="End" select="10"/>
									<xsl:with-param name="Sep" select="$sep4-2"/>
								</xsl:call-template>
							</xsl:if>
						</tbody>
					</table>
				</div>
				<!-- Part 4 Table 1 Total -->
				<div class="styStdDivLS">
					<div class="styLNLeftNumBoxSD" style="height:auto;">
						<br/>11</div>
					<div class="styLNDesc" style="height:auto;width:123.9mm;">
						<br/>Total. Combine lines 1 through 10
						<span class="sty4626DotLn">...................</span>
					</div>
					<div class="styLNAmountBoxNBB" style="width:31mm;height:auto;">
						<br/>
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/TotalCFCIncomeAmt"/>
						</xsl:call-template>
					</div>
					<div class="styLNAmountBoxNBB" style="width:31mm;height:auto;">
						<br/>
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/TotForeignTxsCreditAllowedAmt"/>
						</xsl:call-template>
					</div>
					<div class="styLNAmountBoxNBB" style="width:31mm;height:auto;">
						<br/>
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/TotalAdjustmentEAmt"/>
						</xsl:call-template>
					</div>
					<div class="styLNAmountBoxNBB" style="width:31mm;height:auto;">
						<br/>
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/TotalAdjustmentFAmt"/>
						</xsl:call-template>
					</div>
				</div>
				<div class="styTableContainerLandscapeNBB" id="Part4Table2">
					<xsl:call-template name="SetInitialState"/>
					<table class="styTable" style="border-collapse:collapse;font-size:7pt;">
						<thead class="styTableThead">
							<tr style="border-top:1px solid black;vertical-align:top;">
								<th class="styTableCellHeader" scope="col" style="width:8mm;font-weight:normal;">&nbsp;</th>
								<th class="styTableCellHeader" scope="col" style="width:31mm;font-weight:normal">
									<strong>(g)</strong>
									<br/> Adjustment <br/>
									<br/>
									<span style="width:27mm;min-height:3.5mm;padding-bottom:1px;border-bottom:1px solid black;margin-bottom:2mm;">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$FormData/AdjustmentGDesc"/>
										</xsl:call-template>
									</span>
								</th>
								<th class="styTableCellHeader" scope="col" style="width:31mm;font-weight:normal">
									<strong>(h)</strong>
									<br/> Adjustment <br/>
									<br/>
									<span style="width:27mm;min-height:3.5mm;padding-bottom:1px;border-bottom:1px solid black;margin-bottom:2mm;">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$FormData/AdjustmentHDesc"/>
										</xsl:call-template>
									</span>
								</th>
								<th class="styTableCellHeader" scope="col" style="width:31mm;font-weight:normal">
									<strong>(i)</strong>
									<br/> Adjustment <br/>
									<br/>
									<span style="width:27mm;min-height:3.5mm;padding-bottom:1px;border-bottom:1px solid black;margin-bottom:2mm;">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$FormData/AdjustmentIDesc"/>
										</xsl:call-template>
									</span>
								</th>
								<th class="styTableCellHeader" scope="col" style="width:31mm;font-weight:normal">
									<strong>(j)</strong>
									<br/> Adjustment <br/>
									<br/>
									<span style="width:27mm;min-height:3.5mm;padding-bottom:1px;border-bottom:1px solid black;margin-bottom:2mm;">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$FormData/AdjustmentJDesc"/>
										</xsl:call-template>
									</span>
								</th>
								<th class="styTableCellHeader" scope="col" style="width:31mm;font-weight:normal">
									<strong>(k)</strong>
									<br/> Adjustment <br/>
									<br/>
									<span style="width:27mm;min-height:3.5mm;padding-bottom:1px;border-bottom:1px solid black;margin-bottom:2mm;">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$FormData/AdjustmentKDesc"/>
										</xsl:call-template>
									</span>
								</th>
								<th class="styTableCellHeader" scope="col" style="width:31mm;font-weight:normal">
									<strong>(l)</strong>
									<br/> Total <br/> (combine columns (d) <br/> through (k))
								</th>
								<th class="styTableCellHeader" scope="col" style="width:31mm;font-weight:normal">
									<strong>(m)</strong>
									<br/> Reserved for <br/> future use
								</th>
								<th class="styTableCellHeader" scope="col" style="width:31mm;font-weight:normal;border-right-width:0px;">
									<strong>(n)</strong>
									<br/> Pro-rata share of <br/> CFC CAMT foreign <br/> income taxes <br/> (see instructions)
								</th>
							</tr>
						</thead>
						<tbody>
							<xsl:if test="not(sep4-2)">
								<xsl:for-each select="$FormData/AllwblCFCAMTFrgnIncmTxsGrp">
									<tr style="vertical-align:bottom;">
										<td class="styTableCellCtrInherit" style="font-weight:bold;">
											<xsl:number value="position()" format="1"/>
										</td>
										<td class="styTableCellAmtInherit" style="">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="AdjustmentGAmt"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellAmtInherit" style="">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="AdjustmentHAmt"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellAmtInherit" style="">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="AdjustmentIAmt"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellAmtInherit" style="">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="AdjustmentJAmt"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellAmtInherit" style="">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="AdjustmentKAmt"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellAmtInherit" style="">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="TotalAllowedFrgnTaxCreditAmt"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellAmtInherit" style="background-color:lightgrey;">&nbsp;</td>
										<td class="styTableCellAmtInherit" style="border-right-width:0px;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="ProRataCFCAMTFrgnIncmTxsAmt"/>
											</xsl:call-template>
										</td>
									</tr>
								</xsl:for-each>
							</xsl:if>
							<xsl:if test="$sep4-2 or (count($FormData/AllwblCFCAMTFrgnIncmTxsGrp) &lt; 10)">
								<xsl:call-template name="FillTable9ColsN">
									<xsl:with-param name="Start" select="1 + count($FormData/AllwblCFCAMTFrgnIncmTxsGrp)"/>
									<xsl:with-param name="End" select="10"/>
									<xsl:with-param name="Sep" select="$sep4-2"/>
								</xsl:call-template>
							</xsl:if>
						</tbody>
					</table>
				</div>
				<!-- Part 4 Table 2 Total -->
				<div class="styStdDivLS">
					<div class="styLNLeftNumBoxSD" style="height:auto;width:7.9mm;">
						<br/>11</div>
					<div class="styLNAmountBoxNBB" style="width:31mm;height:auto;">
						<br/>
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/TotalAdjustmentGAmt"/>
						</xsl:call-template>
					</div>
					<div class="styLNAmountBoxNBB" style="width:31mm;height:auto;">
						<br/>
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/TotalAdjustmentHAmt"/>
						</xsl:call-template>
					</div>
					<div class="styLNAmountBoxNBB" style="width:31mm;height:auto;">
						<br/>
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/TotalAdjustmentIAmt"/>
						</xsl:call-template>
					</div>
					<div class="styLNAmountBoxNBB" style="width:31mm;height:auto;">
						<br/>
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/TotalAdjustmentJAmt"/>
						</xsl:call-template>
					</div>
					<div class="styLNAmountBoxNBB" style="width:31mm;height:auto;">
						<br/>
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/TotalAdjustmentKAmt"/>
						</xsl:call-template>
					</div>
					<div class="styLNAmountBoxNBB" style="width:31mm;height:auto;">
						<br/>
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/TotalForeignIncomeTaxesAmt"/>
						</xsl:call-template>
					</div>
					<div class="styLNAmountBoxNBB" style="width:31mm;height:auto;background-color:lightgrey;">
						<br/>&nbsp;</div>
					<div class="styLNAmountBoxNBB" style="width:31mm;height:auto;">
						<br/>
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/TotProRataCFCAMTFrgnIncmTxsAmt"/>
						</xsl:call-template>
					</div>
				</div>
				<div class="styStdDivLS pageEnd" style="border-top:2px solid black;text-align:right;">
					Form <span class="styBoldText" style="font-size:8pt;">4626</span> (2025)
				</div>
				<!-- Page 6 -->
				<div class="styStdDivLS">
					Form 4626 (2025)
					<span style="float:right;">Page <span style="font-weight:bold;font-size:8pt;">6</span>
					</span>
				</div>
				<!-- Part 4 -->
				<div class="styStdDivLS" style="border-top:1px solid black;border-bottom:1px solid black;">
					<div class="styPartName" style="">Part IV</div>
					<div class="styPartDesc" style="">
						Corporate Alternative Minimum Tax &mdash; Foreign Tax Credit <span style="font-style:italic;">(continued)</span>
					</div>
				</div>
				<div class="styStdDivLS" style="padding-top:1px;padding-bottom:1px;font-weight:bold;font-size:8pt;">
					Section III &mdash; CAMT Foreign Tax Credit Carryover for CFCs 
					<span style="font-weight:normal;">(Report all amounts in U.S. dollars.)</span>
				</div>
				<div class="styStdDivLS" style="border-top:1px solid black;">
					<div class="styLNLeftNumBoxSD">&nbsp;</div>
					<div class="styLNDesc" style="width:58.5mm;height:13.5mm;padding-top:2mm;">
						<br/>Foreign Tax Carryover Reconciliation
					</div>
					<div class="sty4626AmtBoxNBB" style="height:13.5mm;text-align:center;">
						<strong>(i)</strong>
						<br/> 5th Preceding <br/> Tax Year
					</div>
					<div class="sty4626AmtBoxNBB" style="height:13.5mm;text-align:center;">
						<strong>(ii)</strong>
						<br/> 4th Preceding <br/> Tax Year
					</div>
					<div class="sty4626AmtBoxNBB" style="height:13.5mm;text-align:center;">
						<strong>(iii)</strong>
						<br/> 3rd Preceding <br/> Tax Year
					</div>
					<div class="sty4626AmtBoxNBB" style="height:13.5mm;text-align:center;">
						<strong>(iv)</strong>
						<br/> 2nd Preceding <br/> Tax Year
					</div>
					<div class="sty4626AmtBoxNBB" style="height:13.5mm;text-align:center;">
						<strong>(v)</strong>
						<br/> 1st Preceding <br/> Tax Year
					</div>
					<div class="sty4626AmtBoxNBB" style="height:13.5mm;text-align:center;">
						<strong>(vi)</strong>
						<br/> Current <br/> Tax Year
					</div>
					<div class="sty4626AmtBoxNBB" style="height:13.5mm;text-align:center;">
						<strong>(vii)</strong>
						<br/> Total <br/> (add columns (i) through (vi))
					</div>
				</div>
				<!-- P4 S3 Line 1 -->
				<div class="styStdDivLS" style="border-top:1px solid black;">
					<div class="styLNLeftNumBoxSD">1</div>
					<div class="styLNDesc" style="width:58.5mm;height:13.5mm;">
						Foreign tax carryover from the prior tax year (enter amounts from the appropriate columns 
						of line 8 of the prior year Form 4626, Part IV, Section III (see instructions))
						<span class="sty4626DotLn">....</span>
					</div>
					<div class="sty4626AmtBoxNBB" style="height:13.5mm;">
						<br/>
						<br/>
						<br/>
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/ForeignTaxCarryoverPriorYrGrp/FifthPrecedingTYAmt"/>
						</xsl:call-template>
					</div>
					<div class="sty4626AmtBoxNBB" style="height:13.5mm;">
						<br/>
						<br/>
						<br/>
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/ForeignTaxCarryoverPriorYrGrp/FourthPrecedingTYAmt"/>
						</xsl:call-template>
					</div>
					<div class="sty4626AmtBoxNBB" style="height:13.5mm;">
						<br/>
						<br/>
						<br/>
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/ForeignTaxCarryoverPriorYrGrp/ThirdPrecedingTYAmt"/>
						</xsl:call-template>
					</div>
					<div class="sty4626AmtBoxNBB" style="height:13.5mm;">
						<br/>
						<br/>
						<br/>
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/ForeignTaxCarryoverPriorYrGrp/SecondPrecedingTYAmt"/>
						</xsl:call-template>
					</div>
					<div class="sty4626AmtBoxNBB" style="height:13.5mm;">
						<br/>
						<br/>
						<br/>
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/ForeignTaxCarryoverPriorYrGrp/FirstPrecedingTYAmt"/>
						</xsl:call-template>
					</div>
					<div class="sty4626AmtBoxNBB" style="height:13.5mm;background-color:lightgrey;">&nbsp;</div>
					<div class="sty4626AmtBoxNBB" style="height:13.5mm;">
						<br/>
						<br/>
						<br/>
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/ForeignTaxCarryoverPriorYrGrp/TotalAmt"/>
						</xsl:call-template>
					</div>
				</div>
				<!-- P4 S3 Line 2 -->
				<div class="styStdDivLS" style="border-top:1px solid black;">
					<div class="styLNLeftNumBoxSD">2</div>
					<div class="styLNDesc" style="width:58.5mm;height:7.2mm;">
						Adjustments to line 1 (enter description &mdash; see instructions):
					</div>
					<div class="sty4626AmtBoxNBB" style="height:7.2mm;background-color:lightgrey;">&nbsp;</div>
					<div class="sty4626AmtBoxNBB" style="height:7.2mm;background-color:lightgrey;">&nbsp;</div>
					<div class="sty4626AmtBoxNBB" style="height:7.2mm;background-color:lightgrey;">&nbsp;</div>
					<div class="sty4626AmtBoxNBB" style="height:7.2mm;background-color:lightgrey;">&nbsp;</div>
					<div class="sty4626AmtBoxNBB" style="height:7.2mm;background-color:lightgrey;">&nbsp;</div>
					<div class="sty4626AmtBoxNBB" style="height:7.2mm;background-color:lightgrey;">&nbsp;</div>
					<div class="sty4626AmtBoxNBB" style="height:7.2mm;background-color:lightgrey;">&nbsp;</div>
				</div>
				<!-- P4 S3 Line 2a+ -->
				<xsl:variable name="sep4-3" select="($Print = $Separated) and (count($FormData/OtherForeignTaxCyovAdjGrp) &gt; 7)"/>
				<xsl:for-each select="$FormData/OtherForeignTaxCyovAdjGrp">
					<div class="styStdIBDivLS" style="">
						<div class="styLNLeftLtrBox">
							<xsl:number value="position()" format="a"/>
						</div>
						<div class="styLNDesc" style="width:58.5mm;height:4.2mm;border-bottom:1px solid black;">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="OtherAdjustmentsTxt"/>
							</xsl:call-template>
						</div>
						<div class="sty4626AmtBox" style="height:4.2mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="ForeignTaxCarryoverGrp/FifthPrecedingTYAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty4626AmtBox" style="height:4.2mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="ForeignTaxCarryoverGrp/FourthPrecedingTYAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty4626AmtBox" style="height:4.2mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="ForeignTaxCarryoverGrp/ThirdPrecedingTYAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty4626AmtBox" style="height:4.2mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="ForeignTaxCarryoverGrp/SecondPrecedingTYAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty4626AmtBox" style="height:4.2mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="ForeignTaxCarryoverGrp/FirstPrecedingTYAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty4626AmtBox" style="height:4.2mm;background-color:lightgrey;">&nbsp;</div>
						<div class="sty4626AmtBox" style="height:4.2mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="ForeignTaxCarryoverGrp/TotalAmt"/>
							</xsl:call-template>
						</div>
					</div>
				</xsl:for-each>
				<xsl:if test="$sep4-3 or (count($FormData/OtherForeignTaxCyovAdjGrp) &lt; 7)">
					<xsl:call-template name="P4L2Filler">
						<xsl:with-param name="Start" select="count($FormData/OtherForeignTaxCyovAdjGrp) + 1"/>
						<xsl:with-param name="End" select="7"/>
						<xsl:with-param name="Sep" select="$sep4-3"/>
					</xsl:call-template>
				</xsl:if>
				<!-- P4 S3 Line 3 -->
				<div class="styStdIBDivLS" style="border-top:1px solid black;">
					<div class="styLNLeftNumBoxSD">3</div>
					<div class="styLNDesc" style="width:58.5mm;height:4.2mm;">
						Total. Combine lines 2a through 2g
						<span class="sty4626DotLn">...</span>
					</div>
					<div class="sty4626AmtBoxNBB" style="height:4.2mm;">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/TotalOtherForeignTaxCyovAdjGrp/FifthPrecedingTYAmt"/>
						</xsl:call-template>
					</div>
					<div class="sty4626AmtBoxNBB" style="height:4.2mm;">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/TotalOtherForeignTaxCyovAdjGrp/FourthPrecedingTYAmt"/>
						</xsl:call-template>
					</div>
					<div class="sty4626AmtBoxNBB" style="height:4.2mm;">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/TotalOtherForeignTaxCyovAdjGrp/ThirdPrecedingTYAmt"/>
						</xsl:call-template>
					</div>
					<div class="sty4626AmtBoxNBB" style="height:4.2mm;">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/TotalOtherForeignTaxCyovAdjGrp/SecondPrecedingTYAmt"/>
						</xsl:call-template>
					</div>
					<div class="sty4626AmtBoxNBB" style="height:4.2mm;">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/TotalOtherForeignTaxCyovAdjGrp/FirstPrecedingTYAmt"/>
						</xsl:call-template>
					</div>
					<div class="sty4626AmtBoxNBB" style="height:4.2mm;background-color:lightgrey;">&nbsp;</div>
					<div class="sty4626AmtBoxNBB" style="height:4.2mm;">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/TotalOtherForeignTaxCyovAdjGrp/TotalAmt"/>
						</xsl:call-template>
					</div>
				</div>
				<!-- P4 S3 Line 4 -->
				<div class="styStdIBDivLS" style="border-top:1px solid black;">
					<div class="styLNLeftNumBoxSD">4</div>
					<div class="styLNDesc" style="width:58.5mm;height:10.3mm;">
						Adjusted foreign tax carryover from prior tax year (combine lines 1 and 3). If zero or less, enter -0-
						<span class="sty4626DotLn">...........</span>
					</div>
					<div class="sty4626AmtBoxNBB" style="height:10.3mm;">
						<br/>
						<br/>
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/AdjustedFrgnTxCyovPriorYrGrp/FifthPrecedingTYAmt"/>
						</xsl:call-template>
					</div>
					<div class="sty4626AmtBoxNBB" style="height:10.3mm;">
						<br/>
						<br/>
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/AdjustedFrgnTxCyovPriorYrGrp/FourthPrecedingTYAmt"/>
						</xsl:call-template>
					</div>
					<div class="sty4626AmtBoxNBB" style="height:10.3mm;">
						<br/>
						<br/>
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/AdjustedFrgnTxCyovPriorYrGrp/ThirdPrecedingTYAmt"/>
						</xsl:call-template>
					</div>
					<div class="sty4626AmtBoxNBB" style="height:10.3mm;">
						<br/>
						<br/>
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/AdjustedFrgnTxCyovPriorYrGrp/SecondPrecedingTYAmt"/>
						</xsl:call-template>
					</div>
					<div class="sty4626AmtBoxNBB" style="height:10.3mm;">
						<br/>
						<br/>
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/AdjustedFrgnTxCyovPriorYrGrp/FirstPrecedingTYAmt"/>
						</xsl:call-template>
					</div>
					<div class="sty4626AmtBoxNBB" style="height:10.3mm;background-color:lightgrey;">&nbsp;</div>
					<div class="sty4626AmtBoxNBB" style="height:10.3mm;">
						<br/>
						<br/>
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/AdjustedFrgnTxCyovPriorYrGrp/TotalAmt"/>
						</xsl:call-template>
					</div>
				</div>
				<!-- P4 S3 Line 5 -->
				<div class="styStdIBDivLS" style="border-top:1px solid black;">
					<div class="styLNLeftNumBoxSD">5</div>
					<div class="styLNDesc" style="width:58.5mm;height:7.2mm;">
						Foreign tax carryover used in current tax year (see instructions)
						<span class="sty4626DotLn">........</span>
					</div>
					<div class="sty4626AmtBoxNBB" style="height:7.2mm;">
						<br/>
						<xsl:call-template name="PopulateNegativeNumber">
							<xsl:with-param name="TargetNode" select="$FormData/ForeignTaxCyovUsedGrp/FifthPrecedingTYAmt"/>
						</xsl:call-template>
					</div>
					<div class="sty4626AmtBoxNBB" style="height:7.2mm;">
						<br/>
						<xsl:call-template name="PopulateNegativeNumber">
							<xsl:with-param name="TargetNode" select="$FormData/ForeignTaxCyovUsedGrp/FourthPrecedingTYAmt"/>
						</xsl:call-template>
					</div>
					<div class="sty4626AmtBoxNBB" style="height:7.2mm;">
						<br/>
						<xsl:call-template name="PopulateNegativeNumber">
							<xsl:with-param name="TargetNode" select="$FormData/ForeignTaxCyovUsedGrp/ThirdPrecedingTYAmt"/>
						</xsl:call-template>
					</div>
					<div class="sty4626AmtBoxNBB" style="height:7.2mm;">
						<br/>
						<xsl:call-template name="PopulateNegativeNumber">
							<xsl:with-param name="TargetNode" select="$FormData/ForeignTaxCyovUsedGrp/SecondPrecedingTYAmt"/>
						</xsl:call-template>
					</div>
					<div class="sty4626AmtBoxNBB" style="height:7.2mm;">
						<br/>
						<xsl:call-template name="PopulateNegativeNumber">
							<xsl:with-param name="TargetNode" select="$FormData/ForeignTaxCyovUsedGrp/FirstPrecedingTYAmt"/>
						</xsl:call-template>
					</div>
					<div class="sty4626AmtBoxNBB" style="height:7.2mm;background-color:lightgrey;">&nbsp;</div>
					<div class="sty4626AmtBoxNBB" style="height:7.2mm;">
						<br/>
						<xsl:call-template name="PopulateNegativeNumber">
							<xsl:with-param name="TargetNode" select="$FormData/ForeignTaxCyovUsedGrp/TotalAmt"/>
						</xsl:call-template>
					</div>
				</div>
				<!-- P4 S3 Line 6 -->
				<div class="styStdIBDivLS" style="border-top:1px solid black;">
					<div class="styLNLeftNumBoxSD">6</div>
					<div class="styLNDesc" style="width:58.5mm;height:7.2mm;">
						Foreign tax carryover expired and unused in current tax year (see instructions)
						<span class="sty4626DotLn">...</span>
					</div>
					<div class="sty4626AmtBoxNBB" style="height:7.2mm;">
						<br/>
						<xsl:call-template name="PopulateNegativeNumber">
							<xsl:with-param name="TargetNode" select="$FormData/ForeignTaxCyovExprUnusedGrp/FifthPrecedingTYAmt"/>
						</xsl:call-template>
					</div>
					<div class="sty4626AmtBoxNBB" style="height:7.2mm;background-color:lightgrey;">&nbsp;</div>
					<div class="sty4626AmtBoxNBB" style="height:7.2mm;background-color:lightgrey;">&nbsp;</div>
					<div class="sty4626AmtBoxNBB" style="height:7.2mm;background-color:lightgrey;">&nbsp;</div>
					<div class="sty4626AmtBoxNBB" style="height:7.2mm;background-color:lightgrey;">&nbsp;</div>
					<div class="sty4626AmtBoxNBB" style="height:7.2mm;background-color:lightgrey;">&nbsp;</div>
					<div class="sty4626AmtBoxNBB" style="height:7.2mm;">
						<br/>
						<xsl:call-template name="PopulateNegativeNumber">
							<xsl:with-param name="TargetNode" select="$FormData/ForeignTaxCyovExprUnusedGrp/TotalAmt"/>
						</xsl:call-template>
					</div>
				</div>
				<!-- P4 S3 Line 7 -->
				<div class="styStdIBDivLS" style="border-top:1px solid black;">
					<div class="styLNLeftNumBoxSD">7</div>
					<div class="styLNDesc" style="width:58.5mm;height:7.2mm;">
						Foreign tax carryover generated in current tax year (see instructions)
						<span class="sty4626DotLn">.......</span>
					</div>
					<div class="sty4626AmtBoxNBB" style="height:7.2mm;background-color:lightgrey;">&nbsp;</div>
					<div class="sty4626AmtBoxNBB" style="height:7.2mm;background-color:lightgrey;">&nbsp;</div>
					<div class="sty4626AmtBoxNBB" style="height:7.2mm;background-color:lightgrey;">&nbsp;</div>
					<div class="sty4626AmtBoxNBB" style="height:7.2mm;background-color:lightgrey;">&nbsp;</div>
					<div class="sty4626AmtBoxNBB" style="height:7.2mm;background-color:lightgrey;">&nbsp;</div>
					<div class="sty4626AmtBoxNBB" style="height:7.2mm;">
						<br/>
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/ForeignTaxCarryoverCurrYrGrp/CurrentTaxYearAmt"/>
						</xsl:call-template>
					</div>
					<div class="sty4626AmtBoxNBB" style="height:7.2mm;">
						<br/>
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/ForeignTaxCarryoverCurrYrGrp/TotalAmt"/>
						</xsl:call-template>
					</div>
				</div>
				<!-- P4 S3 Line 8 -->
				<div class="styStdIBDivLS" style="border-top:1px solid black;">
					<div class="styLNLeftNumBoxSD">8</div>
					<div class="styLNDesc" style="width:58.5mm;height:10.3mm;">
						Foreign tax carryover to the following tax year. Combine lines 4 through 7. If zero or less, enter -0-
						<span class="sty4626DotLn">.........</span>
					</div>
					<div class="sty4626AmtBoxNBB" style="height:10.3mm;">
						<br/>
						<br/>
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/FrgnTaxCyovFollowingTaxYrGrp/FifthPrecedingTYAmt"/>
						</xsl:call-template>
					</div>
					<div class="sty4626AmtBoxNBB" style="height:10.3mm;">
						<br/>
						<br/>
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/FrgnTaxCyovFollowingTaxYrGrp/FourthPrecedingTYAmt"/>
						</xsl:call-template>
					</div>
					<div class="sty4626AmtBoxNBB" style="height:10.3mm;">
						<br/>
						<br/>
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/FrgnTaxCyovFollowingTaxYrGrp/ThirdPrecedingTYAmt"/>
						</xsl:call-template>
					</div>
					<div class="sty4626AmtBoxNBB" style="height:10.3mm;">
						<br/>
						<br/>
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/FrgnTaxCyovFollowingTaxYrGrp/SecondPrecedingTYAmt"/>
						</xsl:call-template>
					</div>
					<div class="sty4626AmtBoxNBB" style="height:10.3mm;">
						<br/>
						<br/>
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/FrgnTaxCyovFollowingTaxYrGrp/FirstPrecedingTYAmt"/>
						</xsl:call-template>
					</div>
					<div class="sty4626AmtBoxNBB" style="height:10.3mm;">
						<br/>
						<br/>
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/FrgnTaxCyovFollowingTaxYrGrp/CurrentTaxYearAmt"/>
						</xsl:call-template>
					</div>
					<div class="sty4626AmtBoxNBB" style="height:10.3mm;">
						<br/>
						<br/>
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/FrgnTaxCyovFollowingTaxYrGrp/TotalAmt"/>
						</xsl:call-template>
					</div>
				</div>
				<div class="styStdDivLS pageEnd" style="border-top:2px solid black;text-align:right;">
					Form <span class="styBoldText" style="font-size:8pt;">4626</span> (2025)
				</div>
				<!-- Page 7 -->
				<div class="styStdDivLS">
					Form 4626 (2025)
					<span style="float:right;">Page <span style="font-weight:bold;font-size:8pt;">7</span>
					</span>
				</div>
				<!-- Part 5 -->
				<div class="styStdDivLS" style="border-top:1px solid black;border-bottom:1px solid black;">
					<div class="styPartName" style="">Part V</div>
					<div class="styPartDesc" style="height:auto;width:240mm;">
						Members of a Controlled Group Treated as a Single Employer and Foreign-Parented Multinational Group (FPMG) Members Taken Into Account in "Applicable Corporation" Determination
					</div>
				</div>
				<!--<xsl:variable name="sep5" select="($Print = $Separated) and (count($FormData/MemCtrlGrpAndFPMGGroupMemGrp) &gt; 24)"/>-->
				<div class="styTableContainerLandscapeNBB" id="Part5Table">
					<xsl:call-template name="SetInitialState"/>
					<table class="styTable" style="border-collapse:collapse;font-size:7pt;">
						<thead class="styTableThead">
							<tr style="border-top:1px solid black;vertical-align:top;">
								<th class="styTableCellHeader" scope="col" style="width:8mm;font-weight:normal;">&nbsp;</th>
								<th class="styTableCellHeader" scope="col" style="width:95mm;font-weight:normal;">
									<strong>(a)</strong>
									<br/> Name of member
								</th>
								<th class="styTableCellHeader" scope="col" style="width:30mm;font-weight:normal;">
									<strong>(b)</strong>
									<br/> EIN of member
								</th>
								<th class="styTableCellHeader" scope="col" style="width:28mm;font-weight:normal">
									<strong>(c)</strong>
									<br/> Check if the entity <br/> is a member of a <br/> 59(k)(1)(D) group
								</th>
								<th class="styTableCellHeader" scope="col" style="width:28mm;font-weight:normal">
									<strong>(d)</strong>
									<br/> Check if the entity <br/> is a member of a <br/> 59(k)(2)(B) group
								</th>
								<th class="styTableCellHeader" scope="col" style="width:40mm;font-weight:normal">
									<strong>(e)</strong>
									<br/> EIN/FTIN of the <br/> U.S. return (if any) <br/> 
									on which the majority <br/> of the member's <br/> income is reported
								</th>
								<th class="styTableCellHeader" scope="col" style="width:31mm;font-weight:normal;border-right-width:0px;">
									<strong>(f)</strong>
									<br/> Member's <br/> financial statement <br/> income/(loss)
								</th>
							</tr>
						</thead>
						<tbody>
							<xsl:for-each select="$FormData/MemCtrlGrpAndFPMGGroupMemGrp">
								<xsl:variable name="pos" select="position()"/>
								<tr style="vertical-align:bottom;">
									<td class="styTableCellCtrInherit" style="font-weight:bold;">
										<xsl:number value="position()" format="1"/>
									</td>
									<td class="styTableCellTextInherit" style="">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="GroupMemberName/BusinessNameLine1Txt"/>
										</xsl:call-template>
										<xsl:if test="GroupMemberName/BusinessNameLine2Txt">
											<br/>
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="GroupMemberName/BusinessNameLine2Txt"/>
											</xsl:call-template>
										</xsl:if>
									</td>
									<td class="styTableCellCtrInherit" style="">
										<xsl:call-template name="PopulateEIN">
											<xsl:with-param name="TargetNode" select="GroupMemberEIN"/>
										</xsl:call-template>
									</td>
									<td class="styTableCellCtrInherit" style="">
										<input type="checkbox" class="styCkboxNM" style="" aria-label="Entity Member of 59 k 1 D group row {$pos}">
											<xsl:call-template name="PopulateCheckbox">
												<xsl:with-param name="TargetNode" select="EntityMember59k1DGroupInd"/>
												<xsl:with-param name="BackupName">P5EntityMember59k1DGroupInd<xsl:value-of select="$pos"/>
												</xsl:with-param>
											</xsl:call-template>
										</input>
									</td>
									<td class="styTableCellCtrInherit" style="">
										<input type="checkbox" class="styCkboxNM" style="" aria-label="Entity Member of 59 k 2 B group row {$pos}">
											<xsl:call-template name="PopulateCheckbox">
												<xsl:with-param name="TargetNode" select="EntityMember59k2BGroupInd"/>
												<xsl:with-param name="BackupName">P5EntityMember59k2BGroupInd<xsl:value-of select="$pos"/>
												</xsl:with-param>
											</xsl:call-template>
										</input>
									</td>
									<td class="styTableCellCtrInherit" style="word-break:break-all;">
										<xsl:choose>
											<xsl:when test="FTIN">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="FTIN"/>
												</xsl:call-template>
											</xsl:when>
											<xsl:otherwise>
												<xsl:call-template name="PopulateEIN">
													<xsl:with-param name="TargetNode" select="EIN"/>
												</xsl:call-template>
											</xsl:otherwise>
										</xsl:choose>
									</td>
									<td class="styTableCellAmtInherit" style="border-right-width:0px;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="FinancialStmtIncomeLossAmt"/>
										</xsl:call-template>
									</td>
								</tr>
							</xsl:for-each>
							<xsl:if test="count($FormData/MemCtrlGrpAndFPMGGroupMemGrp) &lt; 24">
								<xsl:call-template name="FillTable7ColsN">
									<xsl:with-param name="Start" select="1 + count($FormData/MemCtrlGrpAndFPMGGroupMemGrp)"/>
									<xsl:with-param name="End" select="24"/>
									<xsl:with-param name="P5" select="true()"/>
								</xsl:call-template>
							</xsl:if>
						</tbody>
					</table>
				</div>
				<div class="styStdDivLS pageEnd" style="border-top:2px solid black;text-align:right;">
					Form <span class="styBoldText" style="font-size:8pt;">4626</span> (2025)
				</div>
				<!-- Page 8 -->
				<div class="styStdDivLS">
					Form 4626 (2025)
					<span style="float:right;">Page <span style="font-weight:bold;font-size:8pt;">8</span>
					</span>
				</div>
				<!-- Part 6 -->
				<div class="styStdDivLS" style="border-top:1px solid black;border-bottom:1px solid black;">
					<div class="styPartName" style="">Part VI</div>
					<div class="styPartDesc" style="height:auto;width:240mm;">
						Aggregate Pro-Rata Share of Adjusted Net Income or Loss of CFCs Described in Section 56A(c)(3)
					</div>
				</div>
				<div class="styStdDivLS" style="padding-top:1px;padding-bottom:1px;font-weight:bold;font-size:8pt;">
					Section I - Pro-Rata Share of Adjusted Net Income or Loss of CFCs Described in Section 56A(c)(3)
				</div>
				<xsl:variable name="sep8-2" select="($Print = $Separated) and (count($FormData/AggrgtProRataAdjNetIncmLossGrp) &gt; 46)"/>
				<div class="styTableContainerLandscapeNBB" id="Part8Table1">
					<xsl:call-template name="SetInitialState"/>
					<table class="styTable" style="border-collapse:collapse;font-size:7pt;">
						<thead class="styTableThead">
							<tr style="border-top:1px solid black;vertical-align:top;">
								<th class="styTableCellHeader" scope="col" style="width:8mm;font-weight:normal;">&nbsp;</th>
								<th class="styTableCellHeader" scope="col" style="width:95mm;font-weight:normal;">
									<strong>(a)</strong>
									<br/> Name of CFC
								</th>
								<th class="styTableCellHeader" scope="col" style="width:55mm;font-weight:normal;">
									<strong>(b)</strong>
									<br/> EIN or reference ID number of the CFC
								</th>
								<th class="styTableCellHeader" scope="col" style="width:50mm;font-weight:normal">
									<strong>(c)</strong>
									<br/> Country of incorporation <br/> (enter country code)
								</th>
								<th class="styTableCellHeader" scope="col" style="width:50mm;font-weight:normal;border-right-width:0px;">
									<strong>(d)</strong>
									<br/> Pro-rata share of adjusted net income or (loss) of the CFC described in section 56A(c)(3) (in U.S.
dollars)
								</th>
							</tr>
						</thead>
						<tbody>
							<xsl:if test="not(sep8-2)">						
							<xsl:for-each select="$FormData/AggrgtProRataAdjNetIncmLossGrp">
								<xsl:variable name="pos" select="position()"/>
								<tr style="vertical-align:bottom;">
									<td class="styTableCellCtrInherit" style="font-weight:bold;">
										<xsl:number value="position()" format="1"/>
									</td>
									
									<td class="styTableCellTextInherit" style="">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="CFCName/BusinessNameLine1Txt"/>
										</xsl:call-template>
										<xsl:if test="CFCName/BusinessNameLine2Txt">
											<br/>
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="CFCName/BusinessNameLine2Txt"/>
											</xsl:call-template>
										</xsl:if>
									</td>
										<td class="styTableCellCtrInherit" style="word-break:break-all;">
											<xsl:choose>
												<xsl:when test="count(ForeignEntityIdentificationGrp) &gt; 1">
													<xsl:call-template name="LinkToLeftoverDataTableInline">
														<xsl:with-param name="TargetNode" select="ForeignEntityIdentificationGrp"/>
														<xsl:with-param name="Desc">Part IV, Section II, Row <xsl:value-of select="position()"/> - Foreign Entity Identification Groups</xsl:with-param>
													</xsl:call-template>
												</xsl:when>
												<xsl:when test="ForeignEntityIdentificationGrp">
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="ForeignEntityIdentificationGrp/ForeignEntityReferenceIdNum"/>
													</xsl:call-template>
												</xsl:when>
												<xsl:otherwise>
													<xsl:call-template name="PopulateEIN">
														<xsl:with-param name="TargetNode" select="CFCEIN"/>
													</xsl:call-template>
												</xsl:otherwise>
											</xsl:choose>
										</td>
									<td class="styTableCellTextInherit" style="">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="CountryCd"/>
										</xsl:call-template>
									</td>
									<td class="styTableCellTextInherit" style="border-right-width:0px;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="ProRataShrIncmCFCUSShrAmt"/>
										</xsl:call-template>
									</td>
								</tr>
							</xsl:for-each>
							</xsl:if>							
							<xsl:if test="count($FormData/AggrgtProRataAdjNetIncmLossGrp) &lt; 46">
								<xsl:call-template name="FillTable5ColsN">
									<xsl:with-param name="Start" select="1 + count($FormData/AggrgtProRataAdjNetIncmLossGrp)"/>
									<xsl:with-param name="End" select="46"/>
									<xsl:with-param name="P5" select="true()"/>
								</xsl:call-template>
							</xsl:if>
						</tbody>
					</table>
					<div class="styLNLeftNumBoxSD" style="height:auto;">
						<br/>47</div>
					<div class="styLNDesc" style="height:4mm;width:198mm;font-weight:bold;">
						<br/>Total
						<span class="sty4626DotLn">...............................................</span>
					</div>
					<div class="sty4626AmtBox" style="height:7mm;border-bottom:0px;"><br/>
						<span style="">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TotProRataShrIncmCFCUSShrAmt"/>
							</xsl:call-template>
						</span>
					</div>						
				<div class="styStdDivLS" style="border-bottom:1px solid black;">
				</div>						
				<div class="styStdDiv" style="padding-top:1px;padding-bottom:1px;font-weight:bold;font-size:8pt;border-top:0px;border-bottom:1px solid black;">
					Section II &mdash; Section 56A(c)(3)(B) Negative Adjustment
				</div>
				<!-- P6 Line 1 -->
				<div class="styStdIBDiv">
					<div class="styLNLeftLtrBox">1</div>
					<div class="styLNDesc" style="width:98mm;min-height:4mm;height:auto;">
Aggregate pro-rata share of CFCs' adjusted net income or (loss) from the total of Part VI, Section I 
						<span class="sty4626DotLn">.................</span>
					</div>
					<div class="styLNRightNumBox" style="height:7.2mm;">
						<br/>1</div>
					<div class="styLNAmountBox" style="height:7.2mm;padding-right:0.5mm;">
						<br/>
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/TotProRataShrIncmCFCUSShrAmt"/>
						</xsl:call-template>
					</div>
					<div class="styLNRightNumBoxNBB" style="height:7.2mm;">&nbsp;</div>
					<div class="styLNAmountBoxNBB" style="height:7.2mm;">&nbsp;</div>
				</div>
				<!-- P6 Line 2 -->
				<div class="styStdIBDiv">
					<div class="styLNLeftLtrBox">2</div>
					<div class="styLNDesc" style="width:98mm;min-height:4mm;height:auto;">
Available section 56A(c)(3)(B) negative adjustment from preceding year 
						<span class="sty4626DotLn">.</span>
					</div>
					<div class="styLNRightNumBox" style="">
						2
					</div>
					<div class="styLNAmountBox" style="padding-right:0.5mm;">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/PrecYrCyovSect56Ac3BNegAdjAmt"/>
						</xsl:call-template>
					</div>
					<div class="styLNRightNumBoxNBB" style="height:4.2mm;">&nbsp;</div>
					<div class="styLNAmountBoxNBB" style="height:4.2mm;">&nbsp;</div>
				</div>
				<!-- P6 Line 3 -->
				<div class="styStdIBDiv" style="padding-bottom:.5mm;">
					<div class="styLNLeftLtrBox">3</div>
					<div class="styLNDesc" style="width:98mm;height:auto;padding-bottom:.5mm;">
Aggregate pro-rata share of adjusted net income from CFCs for which the corporation is a U.S. shareholder, taking
available section 56A(c)(3)(B) negative adjustment into account. Combine line 1 and line 2. if zero or less, enter -0-.
Enter here and on Part II, line 2e, and Part IV, Section I, line 3f 
						<span class="sty4626DotLn">.</span>
					</div>
					<div class="styLNRightNumBox" style="height:13.8mm;">&nbsp;</div>
					<div class="styLNAmountBox" style="height:13.8mm;">&nbsp;</div>					
					<div class="styLNRightNumBox" style="height:13.8mm;">
						<br/><br/><br/>3
					</div>
					<div class="styLNAmountBox" style="height:13.8mm;padding-right:0.5mm;"><br/><br/><br/>
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/AggrgtProRataShrAdjCFCAmt"/>
						</xsl:call-template>
					</div>

				</div>
				<!-- P6 Line 4 -->
				<div class="styStdIBDiv" style="height:auto;">
					<div class="styLNLeftLtrBox">4</div>
					<div class="styLNDesc" style="width:98mm;min-height:4mm;height:auto;">
Section 56A(c)(3)(B) negative adjustment to carry over to succeeding year. Combine line 1 and line 2. if more than zero,
enter -0- 
						<span class="sty4626DotLn">.......</span>
					</div>
					<div class="styLNRightNumBox" style="height:8.2mm;padding-top:.5mm;">&nbsp;</div>
					<div class="styLNAmountBox" style="height:8.2mm;padding-top:.5mm;">&nbsp;</div>					
					<div class="styLNRightNumBox" style="height:8.2mm;">
						<br/>4</div>
					<div class="styLNAmountBox" style="height:8.2mm;padding-right:0.5mm;">
						<br/>
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/CyovSect56Ac3BNegAdjAmt"/>
						</xsl:call-template>
					</div>
				</div>				
				<div class="styStdDivLS pageEnd" style="width:256mm;border-top:2px solid black;text-align:right;">
					Form <span class="styBoldText" style="font-size:8pt;">4626</span> (2025)
				</div>
				</div>
				<br/><br/>
				<!--Begin ADDITIONAL DATA SECTION -->
				<div style="width:187mm;clear:both;">
					<div class="styLeftOverTitleLine" id="LeftoverData">
						<br/>
						<div class="styLeftOverTitle">
						Additional Data        
					</div>
						<div class="styLeftOverButtonContainer">
							<input class="styLeftoverTableBtn" TabIndex="1" type="button" value="Return to Form" onclick="javascript:returnToWriteInImage();"/>
						</div>
					</div>
				</div>
				<table class="styLeftOverTbl">
					<xsl:call-template name="PopulateCommonLeftover">
						<xsl:with-param name="TargetNode" select="$FormData"/>
						<xsl:with-param name="DescWidth" select="100"/>
					</xsl:call-template>
				</table>
				<xsl:if test="$sepP4">
					<br/>
					<br/>
					<span class="styRepeatingDataTitle">Part IV - Section I - Line 1 - Adjustments </span>
					<table class="styDepTbl" style="font-size:7pt">
						<thead class="styTableHead">
							<tr class="styDepTblHdr">
								<th class="styDepTblCell" scope="col" style="width:8mm;font-weight:normal;">&nbsp;</th>
								<th class="styDepTblCell" scope="col" style="width:139mm;font-weight:normal;">
									Description
								</th>
								<th class="styDepTblCell" scope="col" style="width:40mm;font-weight:normal;">
									Amount 
								</th>
							</tr>
						</thead>
						<tbody>
							<xsl:for-each select="$FormData/DomCorpAMTFrgnIncmTxsAdjGrp">
								<tr>
									<xsl:attribute name="class">
										<xsl:choose>
											<xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when>
											<xsl:otherwise>styDepTblRow2</xsl:otherwise>
										</xsl:choose>
									</xsl:attribute>
									<td class="styTableCellCtrInherit" style="font-weight:bold;">
										1<xsl:number value="position() + 1" format="a"/>
									</td>
									<td class="styTableCellTextInherit" style="">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="AdjustmentTypeDesc"/>
										</xsl:call-template>
									</td>
									<td class="styTableCellAmtInherit" style="">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="AdjustmentAmt"/>
										</xsl:call-template>
									</td>
								</tr>
							</xsl:for-each>
						</tbody>
					</table>
				</xsl:if>
				<!-- Part 4 Section 2 separated table -->
				<xsl:if test="$sep4-2">
					<br/>
					<br/>
					<span class="styRepeatingDataTitle">Part IV - Section II - Allowable CFC AMT Foreign Income Taxes </span>
					<table class="styDepTblLandscape" style="font-size:7pt">
						<thead class="styTableHead">
							<tr class="styDepTblHdr">
								<th class="styDepTblCell" scope="col" style="width:8mm;font-weight:normal;">&nbsp;</th>
								<th class="styDepTblCell" scope="col" style="width:84mm;font-weight:normal;">
									<strong>(a)</strong>
									<br/> Name of CFC
								</th>
								<th class="styDepTblCell" scope="col" style="width:40mm;font-weight:normal;">
									<strong>(b)</strong>
									<br/> EIN or <br/> Reference ID Number <br/> of CFC
								</th>
								<th class="styDepTblCell" scope="col" style="width:31mm;font-weight:normal">
									<strong>(c)</strong>
									<br/> CFC Income
								</th>
								<th class="styDepTblCell" scope="col" style="width:31mm;font-weight:normal">
									<strong>(d)</strong>
									<br/> Foreign taxes <br/> for which credit <br/> is allowed
								</th>
								<th class="styDepTblCell" scope="col" style="width:31mm;font-weight:normal">
									<strong>(e)</strong>
									<br/> Adjustment <br/>
									<br/>
									<span style="width:27mm;min-height:3.5mm;padding-bottom:1px;border-bottom:1px solid black;margin-bottom:2mm;">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$FormData/AdjustmentEDesc"/>
										</xsl:call-template>
									</span>
								</th>
								<th class="styDepTblCell" scope="col" style="width:31mm;font-weight:normal;">
									<strong>(f)</strong>
									<br/> Adjustment <br/>
									<br/>
									<span style="width:27mm;min-height:3.5mm;padding-bottom:1px;border-bottom:1px solid black;margin-bottom:2mm;">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$FormData/AdjustmentFDesc"/>
										</xsl:call-template>
									</span>
								</th>
							</tr>
						</thead>
						<tbody>
							<xsl:for-each select="$FormData/AllwblCFCAMTFrgnIncmTxsGrp">
								<tr>
									<xsl:attribute name="class">
										<xsl:choose>
											<xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when>
											<xsl:otherwise>styDepTblRow2</xsl:otherwise>
										</xsl:choose>
									</xsl:attribute>
									<td class="styTableCellCtrInherit" style="font-weight:bold;">
										<xsl:number value="position()" format="1"/>
									</td>
									<td class="styTableCellTextInherit" style="">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="CFCName/BusinessNameLine1Txt"/>
										</xsl:call-template>
										<xsl:if test="CFCName/BusinessNameLine2Txt">
											<br/>
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="CFCName/BusinessNameLine2Txt"/>
											</xsl:call-template>
										</xsl:if>
									</td>
									<td class="styTableCellCtrInherit" style="word-break:break-all;">
										<xsl:choose>
											<xsl:when test="count(ForeignEntityIdentificationGrp) &gt; 1">
												<xsl:call-template name="LinkToLeftoverDataTableInline">
													<xsl:with-param name="TargetNode" select="ForeignEntityIdentificationGrp"/>
													<xsl:with-param name="Desc">Part IV, Section II, Row <xsl:value-of select="position()"/> - Foreign Entity Identification Groups</xsl:with-param>
												</xsl:call-template>
											</xsl:when>
											<xsl:when test="ForeignEntityIdentificationGrp">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="ForeignEntityIdentificationGrp/ForeignEntityReferenceIdNum"/>
												</xsl:call-template>
											</xsl:when>
											<xsl:otherwise>
												<xsl:call-template name="PopulateEIN">
													<xsl:with-param name="TargetNode" select="CFCEIN"/>
												</xsl:call-template>
											</xsl:otherwise>
										</xsl:choose>
									</td>
									<td class="styTableCellAmtInherit" style="">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="CFCIncomeAmt"/>
										</xsl:call-template>
									</td>
									<td class="styTableCellAmtInherit" style="">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="ForeignTaxesCreditAllowedAmt"/>
										</xsl:call-template>
									</td>
									<td class="styTableCellAmtInherit" style="">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="AdjustmentEAmt"/>
										</xsl:call-template>
									</td>
									<td class="styTableCellAmtInherit" style="">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="AdjustmentFAmt"/>
										</xsl:call-template>
									</td>
								</tr>
							</xsl:for-each>
						</tbody>
					</table>
					<table class="styDepTblLandscape" style="font-size:7pt">
						<thead class="styTableHead">
							<tr class="styDepTblHdr">
								<th class="styDepTblCell" scope="col" style="width:8mm;font-weight:normal;">&nbsp;</th>
								<th class="styDepTblCell" scope="col" style="width:31mm;font-weight:normal">
									<strong>(g)</strong>
									<br/> Adjustment <br/>
									<br/>
									<span style="width:27mm;min-height:3.5mm;padding-bottom:1px;border-bottom:1px solid black;margin-bottom:2mm;">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$FormData/AdjustmentGDesc"/>
										</xsl:call-template>
									</span>
								</th>
								<th class="	styDepTblCell" scope="col" style="width:31mm;font-weight:normal">
									<strong>(h)</strong>
									<br/> Adjustment <br/>
									<br/>
									<span style="width:27mm;min-height:3.5mm;padding-bottom:1px;border-bottom:1px solid black;margin-bottom:2mm;">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$FormData/AdjustmentHDesc"/>
										</xsl:call-template>
									</span>
								</th>
								<th class="styDepTblCell" scope="col" style="width:31mm;font-weight:normal">
									<strong>(i)</strong>
									<br/> Adjustment <br/>
									<br/>
									<span style="width:27mm;min-height:3.5mm;padding-bottom:1px;border-bottom:1px solid black;margin-bottom:2mm;">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$FormData/AdjustmentIDesc"/>
										</xsl:call-template>
									</span>
								</th>
								<th class="styDepTblCell" scope="col" style="width:31mm;font-weight:normal">
									<strong>(j)</strong>
									<br/> Adjustment <br/>
									<br/>
									<span style="width:27mm;min-height:3.5mm;padding-bottom:1px;border-bottom:1px solid black;margin-bottom:2mm;">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$FormData/AdjustmentJDesc"/>
										</xsl:call-template>
									</span>
								</th>
								<th class="styDepTblCell" scope="col" style="width:31mm;font-weight:normal">
									<strong>(k)</strong>
									<br/> Adjustment <br/>
									<br/>
									<span style="width:27mm;min-height:3.5mm;padding-bottom:1px;border-bottom:1px solid black;margin-bottom:2mm;">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$FormData/AdjustmentKDesc"/>
										</xsl:call-template>
									</span>
								</th>
								<th class="styDepTblCell" scope="col" style="width:31mm;font-weight:normal">
									<strong>(l)</strong>
									<br/> Total <br/> (combine columns (d) <br/> through (k))
								</th>
								<th class="styDepTblCell" scope="col" style="width:31mm;font-weight:normal">
									<strong>(m)</strong>
									<br/> Pro-rata share <br/> percentage
								</th>
								<th class="styDepTblCell" scope="col" style="width:31mm;font-weight:normal;">
									<strong>(n)</strong>
									<br/> Pro-rata share of <br/> CFC AMT foreign <br/> income taxes <br/> (multiply column (l) <br/> by column (m))
								</th>
							</tr>
						</thead>
						<tbody>
							<xsl:for-each select="$FormData/AllwblCFCAMTFrgnIncmTxsGrp">
								<tr>
									<xsl:attribute name="class">
										<xsl:choose>
											<xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when>
											<xsl:otherwise>styDepTblRow2</xsl:otherwise>
										</xsl:choose>
									</xsl:attribute>
									<td class="styTableCellCtrInherit" style="font-weight:bold;">
										<xsl:number value="position()" format="1"/>
									</td>
									<td class="styTableCellAmtInherit" style="">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="AdjustmentGAmt"/>
										</xsl:call-template>
									</td>
									<td class="styTableCellAmtInherit" style="">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="AdjustmentHAmt"/>
										</xsl:call-template>
									</td>
									<td class="styTableCellAmtInherit" style="">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="AdjustmentIAmt"/>
										</xsl:call-template>
									</td>
									<td class="styTableCellAmtInherit" style="">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="AdjustmentJAmt"/>
										</xsl:call-template>
									</td>
									<td class="styTableCellAmtInherit" style="">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="AdjustmentKAmt"/>
										</xsl:call-template>
									</td>
									<td class="styTableCellAmtInherit" style="">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="TotalAllowedFrgnTaxCreditAmt"/>
										</xsl:call-template>
									</td>
									<td class="styTableCellAmtInherit" style="">
<!--										<xsl:call-template name="PopulatePercent">
											<xsl:with-param name="TargetNode" select="ProRataShareCFCIncomePct"/>
										</xsl:call-template>-->
									</td>
									<td class="styTableCellAmtInherit" style="">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="ProRataCFCAMTFrgnIncmTxsAmt"/>
										</xsl:call-template>
									</td>
								</tr>
							</xsl:for-each>
						</tbody>
					</table>
				</xsl:if>
				<!-- Part 4 Section 2 Reference ID Number -->
				<xsl:for-each select="$FormData/AllwblCFCAMTFrgnIncmTxsGrp">
					<xsl:if test="(count(ForeignEntityIdentificationGrp) &gt; 1)">
						<br/>
						<br/>
						<span class="styRepeatingDataTitle">Part IV - Section II - Row <xsl:value-of select="position()"/>
						</span>
						<table class="styDepTbl" style="font-size:7pt">
							<thead class="styTableHead">
								<tr class="styDepTblHdr">
									<th class="styDepTblCell" style="text-align:left">
										Reference ID number
									</th>
								</tr>
							</thead>
							<tbody>
								<xsl:for-each select="ForeignEntityIdentificationGrp">
									<tr>
										<xsl:attribute name="class">
											<xsl:choose>
												<xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when>
												<xsl:otherwise>styDepTblRow2</xsl:otherwise>
											</xsl:choose>
										</xsl:attribute>
										<td class="styDepTblCell" style="text-align:left;">
											<span style="font-size:7pt;">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="ForeignEntityReferenceIdNum"/>
												</xsl:call-template>
											</span>
										</td>
									</tr>
								</xsl:for-each>
							</tbody>
						</table>
					</xsl:if>
				</xsl:for-each>
				<!-- Part 4 Section 3 Line 2 separated table -->
				<xsl:if test="$sep4-3">
					<br/>
					<br/>
					<span class="styRepeatingDataTitle">Part IV - Section III - Line 2 - Adjustments to line 1 </span>
					<table class="styDepTblLandscape" style="font-size:7pt">
						<thead class="styTableHead">
							<tr class="styDepTblHdr">
								<th class="styDepTblCell" scope="col" style="width:8mm;font-weight:normal;">&nbsp;</th>
								<th class="styDepTblCell" scope="col" style="width:84mm;font-weight:normal;">
									Description
								</th>
								<th class="styDepTblCell" scope="col" style="width:31mm;font-weight:normal;">
									<strong>(i)</strong>
									<br/> 5th Preceding <br/> Tax Year 
								</th>
								<th class="styDepTblCell" scope="col" style="width:31mm;font-weight:normal">
									<strong>(ii)</strong>
									<br/> 4th Preceding <br/> Tax Year 
								</th>
								<th class="styDepTblCell" scope="col" style="width:31mm;font-weight:normal">
									<strong>(iii)</strong>
									<br/> 3rd Preceding <br/> Tax Year 
								</th>
								<th class="styDepTblCell" scope="col" style="width:31mm;font-weight:normal">
									<strong>(iv)</strong>
									<br/> 2nd Preceding <br/> Tax Year 
								</th>
								<th class="styDepTblCell" scope="col" style="width:31mm;font-weight:normal;">
									<strong>(v)</strong>
									<br/> 1st Preceding <br/> Tax Year 
								</th>
								<th class="styDepTblCell" scope="col" style="width:31mm;font-weight:normal;">
									<strong>(vii)</strong>
									<br/> Total  (add columns (i) through (vi)) 
								</th>
							</tr>
						</thead>
						<tbody>
							<xsl:for-each select="$FormData/OtherForeignTaxCyovAdjGrp">
								<tr>
									<xsl:attribute name="class">
										<xsl:choose>
											<xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when>
											<xsl:otherwise>styDepTblRow2</xsl:otherwise>
										</xsl:choose>
									</xsl:attribute>
									<td class="styTableCellCtrInherit" style="font-weight:bold;">
										2<xsl:number value="position()" format="a"/>
									</td>
									<td class="styTableCellTextInherit" style="">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="OtherAdjustmentsTxt"/>
										</xsl:call-template>
									</td>
									<td class="styTableCellAmtInherit" style="">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="ForeignTaxCarryoverGrp/FifthPrecedingTYAmt"/>
										</xsl:call-template>
									</td>
									<td class="styTableCellAmtInherit" style="">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="ForeignTaxCarryoverGrp/FourthPrecedingTYAmt"/>
										</xsl:call-template>
									</td>
									<td class="styTableCellAmtInherit" style="">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="ForeignTaxCarryoverGrp/ThirdPrecedingTYAmt"/>
										</xsl:call-template>
									</td>
									<td class="styTableCellAmtInherit" style="">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="ForeignTaxCarryoverGrp/SecondPrecedingTYAmt"/>
										</xsl:call-template>
									</td>
									<td class="styTableCellAmtInherit" style="">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="ForeignTaxCarryoverGrp/FirstPrecedingTYAmt"/>
										</xsl:call-template>
									</td>
									<td class="styTableCellAmtInherit" style="">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="ForeignTaxCarryoverGrp/TotalAmt"/>
										</xsl:call-template>
									</td>
								</tr>
							</xsl:for-each>
						</tbody>
					</table>
				</xsl:if>
				<!-- Page 8 Part 6 Section 1 Reference ID Number -->
				<xsl:for-each select="$FormData/AggrgtProRataAdjNetIncmLossGrp">
					<xsl:if test="(count(ForeignEntityIdentificationGrp) &gt; 1)">
						<br/>
						<br/>
						<span class="styRepeatingDataTitle">Part VI - Section I - Row <xsl:value-of select="position()"/>
						</span>
						<table class="styDepTbl" style="font-size:7pt">
							<thead class="styTableHead">
								<tr class="styDepTblHdr">
									<th class="styDepTblCell" style="text-align:left">
										Reference ID number
									</th>
								</tr>
							</thead>
							<tbody>
								<xsl:for-each select="ForeignEntityIdentificationGrp">								
									<tr>
										<xsl:attribute name="class">
											<xsl:choose>
												<xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when>
												<xsl:otherwise>styDepTblRow2</xsl:otherwise>
											</xsl:choose>
										</xsl:attribute>
										<td class="styDepTblCell" style="text-align:left;">
											<span style="font-size:7pt;">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="ForeignEntityReferenceIdNum"/>
												</xsl:call-template>
											</span>
										</td>
									</tr>
								</xsl:for-each>
							</tbody>
						</table>
					</xsl:if>
				</xsl:for-each>
				<br/>
			</body>
		</html>
	</xsl:template>
	<xsl:template name="P4L1Filler">
		<xsl:param name="Start"/>
		<xsl:param name="End" select="6"/>
		<xsl:param name="Sep" select="false()"/>
		<xsl:variable name="letter">
			<xsl:choose>
				<xsl:when test="$Sep">b</xsl:when>
				<xsl:otherwise>
					<xsl:number format="a" value="$Start + 1"/>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>
		<div class="styStdDiv">
			<div class="styLNLeftLtrBox">
				<xsl:value-of select="$letter"/>
			</div>
			<div class="styLNDesc" style="width:98mm;min-height:4mm;height:auto;">
				Adjustment
				<span style="width:80mm;min-height:3mm;border-bottom:1px solid black;">
					<xsl:choose>
						<xsl:when test="$Sep">See additional data</xsl:when>
						<xsl:otherwise>&nbsp;</xsl:otherwise>
					</xsl:choose>
				</span>
			</div>
			<div class="styLNRightNumBox" style="height:4.3mm;">1<xsl:value-of select="$letter"/>
			</div>
			<div class="styLNAmountBox" style="height:4.3mm;">&nbsp;</div>
			<div class="styLNRightNumBoxNBB" style="height:4.3mm;background-color:lightgrey;">&nbsp;</div>
			<div class="styLNAmountBoxNBB" style="height:4.3mm;">&nbsp;</div>
		</div>
		<xsl:choose>
			<xsl:when test="$Sep">
				<xsl:call-template name="P4L1Filler">
					<xsl:with-param name="Start" select="2"/>
					<xsl:with-param name="End" select="$End"/>
					<xsl:with-param name="Sep" select="false()"/>
				</xsl:call-template>
			</xsl:when>
			<xsl:when test="$Start &lt; $End">
				<xsl:call-template name="P4L1Filler">
					<xsl:with-param name="Start" select="$Start + 1"/>
					<xsl:with-param name="End" select="$End"/>
				</xsl:call-template>
			</xsl:when>
			<xsl:otherwise/>
		</xsl:choose>
	</xsl:template>
	<xsl:template name="P4L2Filler">
		<xsl:param name="Start"/>
		<xsl:param name="End" select="7"/>
		<xsl:param name="Sep" select="false()"/>
		<xsl:variable name="letter">
			<xsl:choose>
				<xsl:when test="$Sep">a</xsl:when>
				<xsl:otherwise>
					<xsl:number format="a" value="$Start"/>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>
		<div class="styStdDivLS" style="">
			<div class="styLNLeftLtrBox">
				<xsl:value-of select="$letter"/>
			</div>
			<div class="styLNDesc" style="width:58.5mm;height:4.2mm;border-bottom:1px solid black;">
				<xsl:choose>
					<xsl:when test="$Sep">See additional data</xsl:when>
					<xsl:otherwise>&nbsp;</xsl:otherwise>
				</xsl:choose>
			</div>
			<div class="sty4626AmtBox" style="height:4.2mm;">&nbsp;</div>
			<div class="sty4626AmtBox" style="height:4.2mm;">&nbsp;</div>
			<div class="sty4626AmtBox" style="height:4.2mm;">&nbsp;</div>
			<div class="sty4626AmtBox" style="height:4.2mm;">&nbsp;</div>
			<div class="sty4626AmtBox" style="height:4.2mm;">&nbsp;</div>
			<div class="sty4626AmtBox" style="height:4.2mm;background-color:lightgrey;">&nbsp;</div>
			<div class="sty4626AmtBox" style="height:4.2mm;">&nbsp;</div>
		</div>
		<xsl:choose>
			<xsl:when test="$Sep">
				<xsl:call-template name="P4L2Filler">
					<xsl:with-param name="Start" select="2"/>
					<xsl:with-param name="End" select="$End"/>
					<xsl:with-param name="Sep" select="false()"/>
				</xsl:call-template>
			</xsl:when>
			<xsl:when test="$Start &lt; $End">
				<xsl:call-template name="P4L2Filler">
					<xsl:with-param name="Start" select="$Start + 1"/>
					<xsl:with-param name="End" select="$End"/>
				</xsl:call-template>
			</xsl:when>
			<xsl:otherwise/>
		</xsl:choose>
	</xsl:template>
	<xsl:template name="FillTable7ColsN">
		<xsl:param name="Start"/>
		<xsl:param name="End" select="10"/>
		<xsl:param name="Sep" select="false()"/>
		<xsl:param name="P5" select="false()"/>
		<tr>
			<td class="styTableCellCtrInherit" style="font-weight:bold;">
				<xsl:choose>
					<xsl:when test="$Sep">1</xsl:when>
					<xsl:otherwise>
						<xsl:value-of select="$Start"/>
					</xsl:otherwise>
				</xsl:choose>
			</td>
			<td class="styTableCellCtrInherit" style="">
				<xsl:choose>
					<xsl:when test="$Sep">
						See Additional Data
					</xsl:when>
					<xsl:otherwise>&nbsp;</xsl:otherwise>
				</xsl:choose>
			</td>
			<td class="styTableCellAmtInherit" style="">&nbsp;</td>
			<td class="styTableCellCtrInherit" style="">
				<xsl:choose>
					<xsl:when test="$P5">
						<xsl:variable name="pos" select="position()"/>
						<input type="checkbox" class="styCkboxNM">
							<xsl:attribute name="aria-label">Entity Member of 59 k 1 D group row <xsl:choose>
									<xsl:when test="$Sep">1</xsl:when>
									<xsl:otherwise><xsl:value-of select="$Start"/></xsl:otherwise>
								</xsl:choose></xsl:attribute>
							<xsl:call-template name="PopulateCheckbox">
								<xsl:with-param name="TargetNode" select="/.."/>
								<xsl:with-param name="BackupName">P5EntityMember59k1DGroupInd<xsl:choose>
									<xsl:when test="$Sep">1</xsl:when>
									<xsl:otherwise><xsl:value-of select="$Start"/></xsl:otherwise>
								</xsl:choose></xsl:with-param>
							</xsl:call-template>
						</input>
					</xsl:when>
					<xsl:otherwise>&nbsp;</xsl:otherwise>
				</xsl:choose>
			</td>
			<td class="styTableCellCtrInherit" style="">
				<xsl:choose>
					<xsl:when test="$P5">
						<xsl:variable name="pos" select="position()"/>
						<input type="checkbox" class="styCkboxNM">
							<xsl:attribute name="aria-label">Entity Member of 59 k 2 B group row <xsl:choose>
									<xsl:when test="$Sep">1</xsl:when>
									<xsl:otherwise><xsl:value-of select="$Start"/></xsl:otherwise>
								</xsl:choose></xsl:attribute>
							<xsl:call-template name="PopulateCheckbox">
								<xsl:with-param name="TargetNode" select="/.."/>
								<xsl:with-param name="BackupName">P5EntityMember59k2BGroupInd<xsl:choose>
									<xsl:when test="$Sep">1</xsl:when>
									<xsl:otherwise><xsl:value-of select="$Start"/></xsl:otherwise>
								</xsl:choose></xsl:with-param>
							</xsl:call-template>
						</input>
					</xsl:when>
					<xsl:otherwise>&nbsp;</xsl:otherwise>
				</xsl:choose>
			</td>
			<td class="styTableCellAmtInherit" style="">&nbsp;</td>
			<td class="styTableCellAmtInherit" style="border-right-width:0px;">&nbsp;</td>
		</tr>
		<xsl:choose>
			<xsl:when test="$Sep">
				<xsl:call-template name="FillTable7ColsN">
					<xsl:with-param name="Start" select="2"/>
					<xsl:with-param name="End" select="$End"/>
					<xsl:with-param name="Sep" select="false()"/>
					<xsl:with-param name="P5" select="$P5"/>
				</xsl:call-template>
			</xsl:when>
			<xsl:when test="$Start &lt; $End">
				<xsl:call-template name="FillTable7ColsN">
					<xsl:with-param name="Start" select="$Start + 1"/>
					<xsl:with-param name="End" select="$End"/>
					<xsl:with-param name="P5" select="$P5"/>
				</xsl:call-template>
			</xsl:when>
			<xsl:otherwise/>
		</xsl:choose>
	</xsl:template>
	<xsl:template name="FillTable9ColsN">
		<xsl:param name="Start"/>
		<xsl:param name="End" select="10"/>
		<xsl:param name="Sep" select="false()"/>
		<tr>
			<td class="styTableCellCtrInherit" style="font-weight:bold;">
				<xsl:choose>
					<xsl:when test="$Sep">1</xsl:when>
					<xsl:otherwise>
						<xsl:value-of select="$Start"/>
					</xsl:otherwise>
				</xsl:choose>
			</td>
			<td class="styTableCellCtrInherit" style="">
				<xsl:choose>
					<xsl:when test="$Sep">
						See Additional Data
					</xsl:when>
					<xsl:otherwise>&nbsp;</xsl:otherwise>
				</xsl:choose>
			</td>
			<td class="styTableCellAmtInherit" style="">&nbsp;</td>
			<td class="styTableCellAmtInherit" style="">&nbsp;</td>
			<td class="styTableCellAmtInherit" style="">&nbsp;</td>
			<td class="styTableCellAmtInherit" style="">&nbsp;</td>
			<td class="styTableCellAmtInherit" style="">&nbsp;</td>
			<td class="styTableCellAmtInherit" style="background-color:lightgrey;">&nbsp;</td>
			<td class="styTableCellAmtInherit" style="border-right-width:0px;">&nbsp;</td>
		</tr>
		<xsl:choose>
			<xsl:when test="$Sep">
				<xsl:call-template name="FillTable9ColsN">
					<xsl:with-param name="Start" select="2"/>
					<xsl:with-param name="End" select="$End"/>
					<xsl:with-param name="Sep" select="false()"/>
				</xsl:call-template>
			</xsl:when>
			<xsl:when test="$Start &lt; $End">
				<xsl:call-template name="FillTable9ColsN">
					<xsl:with-param name="Start" select="$Start + 1"/>
					<xsl:with-param name="End" select="$End"/>
				</xsl:call-template>
			</xsl:when>
			<xsl:otherwise/>
		</xsl:choose>
	</xsl:template>
	<xsl:template name="FillTable5ColsN">
		<xsl:param name="Start"/>
		<xsl:param name="End" select="10"/>
		<xsl:param name="Sep" select="false()"/>
		<tr>
			<td class="styTableCellCtrInherit" style="font-weight:bold;">
				<xsl:choose>
					<xsl:when test="$Sep">1</xsl:when>
					<xsl:otherwise>
						<xsl:value-of select="$Start"/>
					</xsl:otherwise>
				</xsl:choose>
			</td>
			<td class="styTableCellCtrInherit" style="">
				<xsl:choose>
					<xsl:when test="$Sep">
						See Additional Data
					</xsl:when>
					<xsl:otherwise>&nbsp;</xsl:otherwise>
				</xsl:choose>
			</td>
			<td class="styTableCellAmtInherit" style="">&nbsp;</td>
			<td class="styTableCellAmtInherit" style="">&nbsp;</td>
			<td class="styTableCellAmtInherit" style="border-right-width:0px;">&nbsp;</td>
		</tr>
		<xsl:choose>
			<xsl:when test="$Sep">
				<xsl:call-template name="FillTable5ColsN">
					<xsl:with-param name="Start" select="2"/>
					<xsl:with-param name="End" select="$End"/>
					<xsl:with-param name="Sep" select="false()"/>
				</xsl:call-template>
			</xsl:when>
			<xsl:when test="$Start &lt; $End">
				<xsl:call-template name="FillTable5ColsN">
					<xsl:with-param name="Start" select="$Start + 1"/>
					<xsl:with-param name="End" select="$End"/>
				</xsl:call-template>
			</xsl:when>
			<xsl:otherwise/>
		</xsl:choose>
	</xsl:template>	
</xsl:stylesheet>