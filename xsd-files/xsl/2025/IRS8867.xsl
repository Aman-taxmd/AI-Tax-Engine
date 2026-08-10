<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE xsl:stylesheet [
	<!ENTITY nbsp "&#160;"> 
	<!ENTITY bull "&#8226;"> 
	<!ENTITY ndash "&#8211;"> 
	<!ENTITY mdash "&#8212;"> 
]>
<!-- Last Modified by Yee Chen on 2/20/2024 - 8867 - TY2023 -->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:include href="PopulateTemplate.xsl"/>
	<xsl:include href="AddHeader.xsl"/>
	<xsl:include href="CommonPathRef.xsl"/>
	<xsl:include href="AddOnTable.xsl"/>
	<xsl:include href="IRS8867Style.xsl"/>
	<xsl:output method="html" indent="yes"/>
	<xsl:strip-space elements="*"/>
	<xsl:param name="FormData" select="$RtnDoc/IRS8867"/>
	<xsl:template match="/">
		<xsl:text disable-output-escaping="yes">&lt;!DOCTYPE html&gt;</xsl:text>
		<html lang="EN-US">
			<head>
				<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
				<title>
					<xsl:call-template name="FormTitle">
						<xsl:with-param name="RootElement" select="local-name($FormData)"/>
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
				<meta name="Description" content="IRS Form 8867"/>
				<script language="JavaScript" src="{$ScriptPath}/FormDisplay.js" type="text/javascript"/>
				<xsl:call-template name="InitJS"/>
				<style type="text/css">
					<xsl:if test="not($Print) or $Print=''">
					<xsl:call-template name="IRS8867Style"/>
					<xsl:call-template name="AddOnStyle"/>
					</xsl:if> 
				</style>
				<xsl:call-template name="GlobalStylesForm"/>
			</head>
			<body class="styBodyClass">
				<form id="IRS8867">
					<xsl:call-template name="DocumentHeader"/>
					<!-- Header -->
					<div class="styTBB" style="width:187mm;">
						<div class="styFNBox" style="width:29mm;height:26.7mm;">
							Form <span class="styFN">8867</span>
							<br/>
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$FormData"/>
							</xsl:call-template>
							<br/>
							<br/>
							<div style="width:28.8mm;font-weight:normal;font-size:7pt;">(Rev. November 2024)</div>
							<span class="styAgency" style="padding-top:3.5mm;">Department of the Treasury <br/>Internal Revenue Service</span>
						</div>
						<div class="styFTBox" style="width:125mm;height:25.7mm;">
							<span class="styFMT" style="font-size:12.5pt;">Paid Preparer's Due Diligence Checklist</span>
							<span class="styFMT" style="font-size:7.5pt;font-weight:normal;">
								<i>Earned Income Credit (EIC), American Opportunity Tax Credit (AOTC), Child Tax Credit (CTC) (including the Additional Child Tax Credit (ACTC) and Credit for Other Dependents (ODC)),
and Head of Household (HOH) Filing Status</i>
							</span>
							<b> To be completed by preparer and filed with Form 1040, 1040-SR, 1040-NR, or 1040-SS.</b>
							<br/>
							<b> Go to <a style="text-decoration:none;color:black;" href="http://www.irs.gov/Form8867" title="Link to IRS.gov">
									<i>www.irs.gov/Form8867</i>
								</a> for instructions and the latest information.</b>
						</div>
						<div class="styTYBox" style="width:32.7mm;height:26.7mm;">
							<div class="styOMB">OMB No. 1545-0074</div>
							<div>
								<span class="styTaxYear" style="font-size:21pt;">20<span class="styTYColor"><xsl:value-of select="substring($TaxYear, 3, 4)"/></span>
								</span>
							</div>
							<span class="stySequence" style="width:33.9mm;padding-top: .5mm;">For tax year<br/>
								<span style="font-size:10pt;"/>
							</span>
							<span class="stySequence" style="width:32.7mm;border-bottom: black 1px solid;height:.5mm;">Attachment <br/>Sequence No. <span style="font-size:10pt;font-weight:bold;">70</span>
							</span>
						</div>
					</div>
					<!-- Taxpayer Name/SSN -->
					<div class="styBB" style="width:187mm;">
						<div class="styNameBox" style="width:126mm;height:6.5mm;">
							Taxpayer name(s) shown on return <br/>
							<xsl:call-template name="PopulateReturnHeaderFiler">
								<xsl:with-param name="TargetNode">Name</xsl:with-param>
							</xsl:call-template>
						</div>
						<div class="styEINBox" style="width:48mm;height:6.5mm;">
							Taxpayer identification number <br/>
							<span style="padding-left:1mm;font-weight:normal;width:100%;text-align:left;">
								<xsl:call-template name="PopulateReturnHeaderFiler">
									<xsl:with-param name="TargetNode">PrimarySSN</xsl:with-param>
								</xsl:call-template>
							</span>
						</div>
					</div>
					<!-- Preparers name and PTIN -->
					<div class="styBB" style="width:187mm;">
						<div class="styNameBox" style="width:126mm;height:6.5mm;">
			                Enter preparer's name <br/>
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/PreparerPersonNm"/>
							</xsl:call-template>
							<!--xsl:call-template name="PopulateReturnHeaderPreparer">
			                    <xsl:with-param name="TargetNode">PreparerPersonName</xsl:with-param>
			                    </xsl:call-template-->
						</div>
						<div class="styEINBox" style="width:50mm;height:6.5mm;">
			                Preparer taxpayer identification number <br/>
							<span style="padding-left:1mm;font-weight:normal;width:100%;text-align:left;">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$FormData/PTIN"/>
								</xsl:call-template>
								<!--xsl:if test="$RtnHdrData/PreparerPersonGrp/PTIN">
										<xsl:call-template name="PopulateReturnHeaderPreparer">
											<xsl:with-param name="TargetNode">PTIN</xsl:with-param>
											<xsl:with-param name="BackupName">$RtnHdrDataPreparerPersonGrpPTIN</xsl:with-param>
			                    </xsl:call-template>
			                    </xsl:if-->
							</span>
						</div>
					</div>
					<!--div class="styBB" style="width:187mm;height:8mm;padding-top:2px;padding-bottom:8px;background-color:white;">
						Enter preparer's name<br/>
						<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$FormData/PreparerPersonNm"/>
								</xsl:call-template>
								<span style="width:6px"/>
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$FormData/PTIN"/>
								</xsl:call-template>
					</div-->
					<!-- BEGIN Due Diligence Requirements -->
					<div class="styBB">
						<div class="styPartName">Part I</div>
						<div class="styPartName" style="color:black;background-color:white;width:173mm;height:2mm;padding-left:1.3mm;text-align:left;font-size:7pt;padding-top:.5mm">Due Diligence Requirements
					</div>
					</div>
					<div class="styBB">
						<div class="styBB">
						Please check the appropriate box for  the credit(s) and/or HOH filing status claimed on this return and complete the related Parts I-V for the benefit(s) claimed (check all that apply).
					</div>
						<div class="styLNDesc" style="width:96mm;height: 0mm;"/>
						<!--<div class="styIRS8867ChildBox" style="width:18mm;height:13mm;font-weight:normal;;padding-left:6mm;padding-right:2mm;padding-top:1mm;border-bottom-width: 0px;background-color:yellow;">-->
						<!--label-->
						<div style="padding-left:0mm; " id="/EICClaimedInd">
							<xsl:call-template name="PopulateSpan">
								<xsl:with-param name="TargetNode" select="$FormData/EICClaimedInd"/>
							</xsl:call-template>
							<input type="checkbox" class="styCkbox" aria-label="EICClaimedIndYES">
								<xsl:call-template name="PopulateEnumeratedCheckbox">
									<xsl:with-param name="TargetNode" select="$FormData/EICClaimedInd"/>
									<xsl:with-param name="DisplayedCheckboxValue" select="'YES'"/>
									<xsl:with-param name="BackupName">IRS8867EICClaimedInd</xsl:with-param>
								</xsl:call-template>EIC
							</input>
						</div>
						<!--div style="padding-left:0mm; " for="/EICClaimedInd">
						<xsl:call-template name="PopulateLabel">
							<xsl:with-param name="TargetNode" select="$FormData/EICClaimedIndYES"/>
							<xsl:with-param name="DisplayedCheckboxValue" select="'YES'"/>
							<xsl:with-param name="BackupName">IRS8867EICClaimedInd</xsl:with-param>
						</xsl:call-template>EIC</div-->
						<!--/label-->
						<span style="width:3mm"/>
						<span>
							<!--<xsl:call-template name="PopulateSpan">
								<xsl:with-param name="TargetNode" select="$FormData/EICClaimedInd"/>
							</xsl:call-template>
							<input type="checkbox" class="styCkbox">
								<xsl:call-template name="PopulateEnumeratedCheckbox">
									<xsl:with-param name="TargetNode" select="$FormData/EICClaimedInd"/>
									<xsl:with-param name="DisplayedCheckboxValue" select="'YES'"/>
									<xsl:with-param name="BackupName">IRS8867EICClaimedInd</xsl:with-param>
								</xsl:call-template>
							</input>-->
						</span>
						<!--</div>-->
						<!--<div class="styIRS8867ChildBox" style="width:24mm;height:13mm;text-align:center;font-weight:normal;padding-right:5mm;padding-top:1mm;border-bottom-width: 0px;">-->
						<!--label-->
						<div style="padding-left:0mm; " id="/CTCACTCODCClaimedInd">
							<xsl:call-template name="PopulateSpan">
								<xsl:with-param name="TargetNode" select="$FormData/CTCACTCODCClaimedInd"/>
							</xsl:call-template>
							<div style="float:left; clear:left; padding-left:8mm; padding-right:2mm;"/>
							<input type="checkbox" class="styCkbox" aria-label="CTCACTCODCClaimedIndYES">
								<xsl:call-template name="PopulateEnumeratedCheckbox">
									<xsl:with-param name="TargetNode" select="$FormData/CTCACTCODCClaimedInd"/>
									<xsl:with-param name="DisplayedCheckboxValue" select="'YES'"/>
									<xsl:with-param name="BackupName">IRS8867CTCACTCODCClaimedInd</xsl:with-param>
								</xsl:call-template>CTC/ACTC/ODC
							</input>
						</div>
						<!--xsl:call-template name="PopulateLabel">
							<xsl:with-param name="TargetNode" select="$FormData/CTCACTCODCClaimedIndYES"/>
							<xsl:with-param name="DisplayedCheckboxValue" select="'YES'"/>
							<xsl:with-param name="BackupName">IRS8867CTCACTCODCClaimedInd</xsl:with-param>
						</xsl:call-template>CTC/ACTC/ODC-->
						<!--/label-->
						<span style="width:1.3mm"/>
						<span>
							<!--<xsl:call-template name="PopulateSpan">
								<xsl:with-param name="TargetNode" select="$FormData/CTCACTCODCClaimedInd"/>
							</xsl:call-template>
							<input type="checkbox" class="styCkbox">
								<xsl:call-template name="PopulateEnumeratedCheckbox">
									<xsl:with-param name="TargetNode" select="$FormData/CTCACTCODCClaimedInd"/>
									<xsl:with-param name="DisplayedCheckboxValue" select="'YES'"/>
									<xsl:with-param name="BackupName">IRS8867CTCACTCODCClaimedInd</xsl:with-param>
								</xsl:call-template>
							</input>-->
						</span>
						<!--</div>-->
						<!--<div class="styIRS8867ChildBox" style="width:16mm;height:13mm;font-weight:normal;padding-left:6mm;padding-right:2mm;padding-top:1mm;border-bottom-width: 0px;">-->
						<!--label-->
						<div style="padding-left:0mm; " id="/AOTCClaimedInd">
							<xsl:call-template name="PopulateSpan">
								<xsl:with-param name="TargetNode" select="$FormData/AOTCClaimedInd"/>
							</xsl:call-template>
							<div style="float:left; clear:left; padding-left:8mm; padding-right:2mm;"/>
							<input type="checkbox" class="styCkbox" aria-label="AOTCClaimedIndYES">
								<xsl:call-template name="PopulateEnumeratedCheckbox">
									<xsl:with-param name="TargetNode" select="$FormData/AOTCClaimedInd"/>
									<xsl:with-param name="DisplayedCheckboxValue" select="'YES'"/>
									<xsl:with-param name="BackupName">IRS8867AOTCClaimedInd</xsl:with-param>
								</xsl:call-template>AOTC
							</input>
						</div>
						<!--div style="padding-left:0mm; " for="/AOTCClaimedInd">
						<xsl:call-template name="PopulateLabel">
							<xsl:with-param name="TargetNode" select="$FormData/AOTCClaimedInd"/>
							<xsl:with-param name="DisplayedCheckboxValue" select="'YES'"/>
							<xsl:with-param name="BackupName">IRS8867AOTCClaimedInd</xsl:with-param>
						</xsl:call-template>AOTC</div>
						</label-->
						<span style="width:1mm"/>
						<span>
							<!--<xsl:call-template name="PopulateSpan">
								<xsl:with-param name="TargetNode" select="$FormData/AOTCClaimedInd"/>
							</xsl:call-template>
							<input type="checkbox" class="styCkbox">
								<xsl:call-template name="PopulateEnumeratedCheckbox">
									<xsl:with-param name="TargetNode" select="$FormData/AOTCClaimedInd"/>
									<xsl:with-param name="DisplayedCheckboxValue" select="'YES'"/>
									<xsl:with-param name="BackupName">IRS8867AOTCClaimedInd</xsl:with-param>
								</xsl:call-template>
							</input>-->
						</span>
						<!--</div>-->
						<!--<div class="styIRS8867ChildBox" style="width:16mm;height:13mm;font-weight:normal;padding-left:6mm;padding-right:2mm;padding-top:1mm;border-bottom-width: 0px;">-->
						<!--label-->
						<div style="padding-left:0mm; " id="/HOHClaimedInd;">
							<xsl:call-template name="PopulateSpan">
								<xsl:with-param name="TargetNode" select="$FormData/HOHClaimedInd"/>
							</xsl:call-template>
							<div style="float:left; clear:left; padding-left:8mm; padding-right:2mm;"/>
							<input type="checkbox" class="styCkbox" aria-label="HOHFilingStatusIndYES">
								<xsl:call-template name="PopulateEnumeratedCheckbox">
									<xsl:with-param name="TargetNode" select="$FormData/HOHFilingStatusInd"/>
									<xsl:with-param name="DisplayedCheckboxValue" select="'YES'"/>
									<xsl:with-param name="BackupName">IRS8867THOHFilingStatusInd</xsl:with-param>
								</xsl:call-template>HOH
							</input>
						</div>
						<!--div style="padding-left:0mm; " for="/HOHClaimedInd;">
						<xsl:call-template name="PopulateLabel">
							<xsl:with-param name="TargetNode" select="$FormData/HOHFilingStatusInd"/>
							<xsl:with-param name="DisplayedCheckboxValue" select="'YES'"/>
							<xsl:with-param name="BackupName">IRS8867THOHFilingStatusInd</xsl:with-param>
						</xsl:call-template>HOH</div>
						</label-->
						<span style="width:1mm"/>
						<span>
							<!--<xsl:call-template name="PopulateSpan">
								<xsl:with-param name="TargetNode" select="$FormData/HOHFilingStatusInd"/>
							</xsl:call-template>
							<input type="checkbox" class="styCkbox">
								<xsl:call-template name="PopulateEnumeratedCheckbox">
									<xsl:with-param name="TargetNode" select="$FormData/HOHFilingStatusInd"/>
									<xsl:with-param name="DisplayedCheckboxValue" select="'YES'"/>
									<xsl:with-param name="BackupName">IRS8867THOHFilingStatusInd</xsl:with-param>
								</xsl:call-template>
							</input>-->
						</span>
						<!--</div>-->
					</div>
					<!-- Begin Line 1 -->
					<div class="styGenericDiv" style="width:187mm;height:13.2mm;">
						<div class="styLNLeftNumBoxBB" style="padding-top:2.2mm;height:13.25mm;">1</div>
						<div class="styIRS8867ChildDesc" style="width:148.2mm; padding-top:2mm; height:13.25mm;">
							<span style="font-size:8pt;float:left;clear:none;">Did you complete the return based on information for the applicable tax year provided by the taxpayer or reasonably obtained by you?<span class="styDotLn" style="float:none;clear:none;padding-left:3mm;">........................</span>
							</span>
							<div class="styBB" style="width:178mm;padding-top:4.1mm;"/>
						</div>
						<!--<div class="styIRS8867ChildBox" style="width:31mm;height: 5.5mm;">-->
						<div>
							<div class="styIRS8867ChBx" style="border-left: black 1px solid;border-bottom: black 1px solid">Yes</div>
							<div class="styIRS8867ChBx" style="border-bottom: black 1px solid">No</div>
							<div class="styIRS8867ChBx" style="border-bottom: black 1px solid">N/A</div>
						</div>
						<div>
							<div class="styIRS8867ChBx" style="height:8.2mm;border-bottom: black 1px solid;padding-top: 1mm;border-left: black 1px solid">
								<xsl:call-template name="PopulateSpan">
									<xsl:with-param name="TargetNode" select="$FormData/TxpyrProvidedOrObtainedInfoInd"/>
								</xsl:call-template>
								<input type="checkbox" aria-label="TxpyrProvidedOrObtainedInfoIndYes" class="styCkbox">
									<xsl:call-template name="PopulateYesCheckbox">
										<xsl:with-param name="TargetNode" select="$FormData/TxpyrProvidedOrObtainedInfoInd"/>
										<xsl:with-param name="BackupName">IRS8867TxpyrProvidedOrObtainedInfoInd</xsl:with-param>
									</xsl:call-template>
								</input>
							</div>
							<div class="styIRS8867ChBx" style="height:8.2mm;border-bottom: black 1px solid;padding-top: 1mm">
								<input type="checkbox" aria-label="TxpyrProvidedOrObtainedInfoIndNo" class="styCkbox">
									<xsl:call-template name="PopulateNoCheckbox">
										<xsl:with-param name="TargetNode" select="$FormData/TxpyrProvidedOrObtainedInfoInd"/>
										<xsl:with-param name="BackupName">IRS8867TxpyrProvidedOrObtainedInfoInd</xsl:with-param>
									</xsl:call-template>
								</input>
							</div>
							<div class="styIRS8867ChBx" style="height:8.2mm;border-bottom: black 1px solid;background-color:lightgrey;"/>
						</div>
						<!--</div>-->
					</div>
					<!-- End Line 1 -->
					<!-- Begin Line 2 -->
					<div class="styBB" style="width:187mm;height:17.7mm;">
						<div class="styLNLeftNumBox" style="padding-top:3mm;height:100%;">2</div>
						<div class="styIRS8867ChildDesc" style="font-size: 8pt;width:148.2mm;padding-top:3.1mm;height:100%;">
							  If credits are claimed on the return, did you complete the applicable EIC and/or CTC/ACTC/ODC <br/>
							  worksheets found in the Form 1040, 1040-SR, 1040-NR, or 1040-SS instructions, and/or<br/>
							  the AOTC worksheet found in the Form 8863 instructions, or your own worksheet(s) that provides<br/>
							  the same information, and all related forms and schedules for each credit claimed?
							  <span class="styDotLn" style="float:none;clear:none;padding-left:1mm;">......</span>
						</div>
						<div>
							<div class="styIRS8867ChBx" style="height:7.5mm;border-bottom: black 1px solid;border-left: black 1px solid;background-color:lightgrey;"/>
							<div class="styIRS8867ChBx" style="height:7.5mm;border-bottom: black 1px solid;background-color:lightgrey;"/>
							<div class="styIRS8867ChBx" style="height:7.5mm;border-bottom: black 1px solid;background-color:lightgrey;"/>
						</div>
						<div class="styIRS8867ChBx" style="height:10mm;padding-top:3mm;border-left: black 1px solid;">
							<xsl:call-template name="PopulateSpan">
								<xsl:with-param name="TargetNode" select="$FormData/CompleteApplicableWorksheetCd"/>
							</xsl:call-template>
							<input type="checkbox" aria-label="CompleteApplicableWorksheetYES" class="styCkbox">
								<xsl:call-template name="PopulateEnumeratedCheckbox">
									<xsl:with-param name="TargetNode" select="$FormData/CompleteApplicableWorksheetCd"/>
									<xsl:with-param name="DisplayedCheckboxValue" select="'YES'"/>
									<xsl:with-param name="BackupName">IRS8867CompleteApplicableWorksheetCdYES</xsl:with-param>
								</xsl:call-template>
							</input>
						</div>
						<div class="styIRS8867ChBx" style="height:10mm;padding-top:3mm">
							<input type="checkbox" aria-label="CompleteApplicableWorksheetNO" class="styCkbox">
								<xsl:call-template name="PopulateEnumeratedCheckbox">
									<xsl:with-param name="TargetNode" select="$FormData/CompleteApplicableWorksheetCd"/>
									<xsl:with-param name="DisplayedCheckboxValue" select="'NO'"/>
									<xsl:with-param name="BackupName">IRS8867CompleteApplicableWorksheetCdNO</xsl:with-param>
								</xsl:call-template>
							</input>
						</div>
						<div class="styIRS8867ChBx" style="height:10mm;padding-top:3mm">
							<input type="checkbox" aria-label="CompleteApplicableWorksheetN/A" class="styCkbox">
								<xsl:call-template name="PopulateEnumeratedCheckbox">
									<xsl:with-param name="TargetNode" select="$FormData/CompleteApplicableWorksheetCd"/>
									<xsl:with-param name="DisplayedCheckboxValue" select="'N/A'"/>
									<xsl:with-param name="BackupName">IRS8867CompleteApplicableWorksheetCdNA</xsl:with-param>
								</xsl:call-template>
							</input>
						</div>
						<!--</div>-->
					</div>
					<!-- End Line 2 -->
					<!-- Begin Line 3 -->
					<div class="styGenericDiv" style="width:187mm;height:10mm;padding-top:0.1mm;">
						<div class="styLNLeftNumBox" style="height:100%;padding-top:1mm;">3</div>
						<div class="styIRS8867ChildDesc" style="font-size: 8pt;height:10mm;padding-top:1mm;width:148mm;">
								Did you satisfy the knowledge requirement? To meet the knowledge requirement, you must do both of the following.	
							</div>
						<div class="styIRS8867ChildBox" style="height:10.4mm; width:31mm;padding-top:0mm;border-bottom:none;">
							<div class="styIRS8867ChBx" style="height: 100%; background-color:lightgrey;"/>
							<div class="styIRS8867ChBx" style="height: 100%; background-color:lightgrey;"/>
							<div class="styIRS8867ChBx" style="height: 100%; background-color:lightgrey;"/>
						</div>
					</div>
					<!-- End Line 3 -->
					<!-- Begin Line 3a -->
					<div class="styGenericDiv" style="width:187mm;height:10mm;">
						<div class="styLNLeftNumBox" style="height:9.5mm;padding-left:5mm;">
							<img src="{$ImagePath}/8911_Bullet_Round.gif" width="5" height="5" alt="Bullet"/>
						</div>
						<div class="styIRS8867ChildDesc" style="font-size: 8pt;height:10mm;padding-top:1mm;width:148mm;">Interview the taxpayer, ask questions, and contemporaneously document the taxpayer's responses to determine that the taxpayer is eligible to claim the credit(s) and/or HOH filing status.<span class="styDotLn" style="float:none;clear:none;padding-left:1.5mm;"/>
						</div>
						<div class="styIRS8867ChildBox" style="height:10.5mm; width:31mm;padding-top:0mm;border-bottom:none;">
							<div class="styIRS8867ChBx" style="height: 100%; background-color:lightgrey;"/>
							<div class="styIRS8867ChBx" style="height: 100%; background-color:lightgrey;"/>
							<div class="styIRS8867ChBx" style="height: 100%; background-color:lightgrey;"/>
						</div>
					</div>
					<!-- End Line 3a -->
					<!-- Begin Line 3b -->
					<div class="styGenericDiv" style="width:187mm;height:9.4mm;border:1px solid black;border-width: 0px 0px 1px 0px;">
						<div class="styLNLeftNumBoxBB" style="height:9.4mm;width:8mm;padding-left:5mm;padding-top:1mm;">
							<img src="{$ImagePath}/8911_Bullet_Round.gif" width="5" height="5" alt="Bullet"/>
						</div>
						<div class="styIRS8867ChildDesc" style="font-size: 8pt;height:9.4mm;padding-top:1mm;width:148mm;">
									Review information to determine that the taxpayer is eligible to claim the credit(s) and/or HOH filing status and to figure the amount(s) of any credit(s).<span class="styDotLn" style="float:none;clear:none;padding-left:1.5mm;">.................</span>
						</div>
						<div class="styIRS8867ChildBox" style="height:9.4mm; width:31mm;padding-top:0mm;">
							<div class="styIRS8867ChBx" style="height: 9.4mm;">
								<xsl:call-template name="PopulateSpan">
									<xsl:with-param name="TargetNode" select="$FormData/SatisfyKnowledgeRequirementInd"/>
								</xsl:call-template>
								<input type="checkbox" aria-label="SatisfyKnowledgeRequirementYes" class="styCkbox" style="margin-top:3.3mm">
									<xsl:call-template name="PopulateYesCheckbox">
										<xsl:with-param name="TargetNode" select="$FormData/SatisfyKnowledgeRequirementInd"/>
										<xsl:with-param name="BackupName">IRS8867SatisfyKnowledgeRequirementInd</xsl:with-param>
									</xsl:call-template>
								</input>
							</div>
							<div class="styIRS8867ChBx" style="height: 9.4mm;">
								<input type="checkbox" aria-label="SatisfyKnowledgeRequirementNo" class="styCkbox" style="margin-top:3.3mm">
									<xsl:call-template name="PopulateNoCheckbox">
										<xsl:with-param name="TargetNode" select="$FormData/SatisfyKnowledgeRequirementInd"/>
										<xsl:with-param name="BackupName">IRS8867SatisfyKnowledgeRequirementInd</xsl:with-param>
									</xsl:call-template>
								</input>
							</div>
							<div class="styIRS8867ChBx" style="height: 9.1mm;background-color:lightgrey"/>
						</div>
					</div>
					<!-- End Line 3b -->
					<!-- Line 4 -->
					<div class="styGenericDiv" style="width:187mm;height:12mm">
						<div class="styLNLeftNumBox" style="height:12mm;padding-top:.5mm;">4</div>
						<div class="styIRS8867ChildDesc" style="font-size: 8pt;height:12mm;padding-top:.5mm;width:148mm;">
								Did any information provided by the taxpayer or a third party for use in preparing the return, or information reasonably known to you, appear to be incorrect, incomplete, or inconsistent? (If<b> &#8220;Yes,&#8221;</b> answer questions 4a and 4b. If <b>&#8220;No,&#8221;</b> go to question 5.)
								<span class="styDotLn" style="float:none;clear:none;padding-left:1.5mm;">...............</span>
						</div>
						<div class="styIRS8867ChildBox" style="height:12mm; width:31mm;padding-top:0mm;">
							<div>
								<div class="styIRS8867ChBx" style="height: 6mm; background-color:lightgrey;"/>
								<div class="styIRS8867ChBx" style="height: 6mm; background-color:lightgrey;"/>
								<div class="styIRS8867ChBx" style="height: 6mm; background-color:lightgrey;"/>
							</div>
							<div class="styIRS8867ChBx" style="height: 6mm;padding-top:1mm">
								<xsl:call-template name="PopulateSpan">
									<xsl:with-param name="TargetNode" select="$FormData/IncorIncmplInconInfoInd"/>
								</xsl:call-template>
								<input type="checkbox" aria-label="IncorIncmplInconInfoIndYes" class="styCkbox">
									<xsl:call-template name="PopulateYesCheckbox">
										<xsl:with-param name="TargetNode" select="$FormData/IncorIncmplInconInfoInd"/>
										<xsl:with-param name="BackupName">IRS8867IncorIncmplInconInfoInd</xsl:with-param>
									</xsl:call-template>
								</input>
							</div>
							<div class="styIRS8867ChBx" style="height: 6mm;padding-top:1mm">
								<input type="checkbox" aria-label="IncorIncmplInconInfoIndNo" class="styCkbox">
									<xsl:call-template name="PopulateNoCheckbox">
										<xsl:with-param name="TargetNode" select="$FormData/IncorIncmplInconInfoInd"/>
										<xsl:with-param name="BackupName">IRS8867IncorIncmplInconInfoInd</xsl:with-param>
									</xsl:call-template>
								</input>
							</div>
							<div class="styIRS8867ChBx" style="height: 5.7mm;background-color:lightgrey"/>
						</div>
					</div>
					<!-- End Line 4 -->
					<!-- Begin Line 4a -->
					<div class="styGenericDiv" style="width:187mm;height:6mm;">
						<div class="styLNLeftNumBox" style="height:8mm;padding-left:5mm;">a</div>
						<div class="styIRS8867LNDesc" style="font-size: 8pt;width:148mm;height:6mm;padding-left:2mm;padding-top:0mm;">			    
						    Did you make reasonable inquiries to determine the correct, complete, and consistent information?
								</div>
						<div class="styIRS8867ChildBox" style="height:12mm; width:31mm;padding-top:0mm;">
							<div class="styIRS8867ChBx" style="height:6mm;padding-top:1mm">
								<xsl:call-template name="PopulateSpan">
									<xsl:with-param name="TargetNode" select="$FormData/MakeInquiryInd"/>
								</xsl:call-template>
								<input type="checkbox" aria-label="MakeInquiryIndYes" class="styCkbox">
									<xsl:call-template name="PopulateYesCheckbox">
										<xsl:with-param name="TargetNode" select="$FormData/MakeInquiryInd"/>
										<xsl:with-param name="BackupName">IRS8867MakeInquiryInd</xsl:with-param>
									</xsl:call-template>
								</input>
							</div>
							<div class="styIRS8867ChBx" style="height:6mm; padding-top:1mm">
								<input type="checkbox" aria-label="MakeInquiryIndNo" class="styCkbox">
									<xsl:call-template name="PopulateNoCheckbox">
										<xsl:with-param name="TargetNode" select="$FormData/MakeInquiryInd"/>
										<xsl:with-param name="BackupName">IRS8867MakeInquiryInd</xsl:with-param>
									</xsl:call-template>
								</input>
							</div>
							<div class="styIRS8867ChBx" style="height:6.7mm;background-color:lightgrey"/>
						</div>
					</div>
					<!-- End Line 4a -->
					<!-- Begin Line 4b -->
					<div class="styGenericDiv" style="width:187mm;height:14mm;">
						<div class="styLNLeftNumBoxBB" style="height:14mm;width:10mm;padding-left:5mm;padding-top:1.5mm;">b</div>
						<div class="styIRS8867LNDesc" style="font-size: 8pt;width:146mm;height:14mm;padding-left:0mm;padding-top:1.5mm;border-style: solid; border-color: black;border-width: 0px 0px 1px 0px">Did you contemporaneously document your inquiries? (Documentation should include the questions you asked, whom you asked, when you asked, the information that was provided, and the impact the information had on your preparation of the return.)<span class="styDotLn" style="float:none;clear:none;padding-left:1.5mm;">.................</span>
						</div>
						<div class="styIRS8867ChildBox" style="height:14mm; width:31mm;padding-top:0mm;">
							<div>
								<div class="styIRS8867ChBx" style="height: 6mm; background-color:lightgrey;"/>
								<div class="styIRS8867ChBx" style="height: 6mm; background-color:lightgrey;"/>
								<div class="styIRS8867ChBx" style="height: 6mm; background-color:lightgrey;"/>
							</div>
							<div class="styIRS8867ChBx" style="height:7.9mm;padding-top:2mm">
								<xsl:call-template name="PopulateSpan">
									<xsl:with-param name="TargetNode" select="$FormData/DocumentInquiryInd"/>
								</xsl:call-template>
								<input type="checkbox" aria-label="DocumentInquiryIndYes" class="styCkbox">
									<xsl:call-template name="PopulateYesCheckbox">
										<xsl:with-param name="TargetNode" select="$FormData/DocumentInquiryInd"/>
										<xsl:with-param name="BackupName">IRS8867DocumentInquiryInd</xsl:with-param>
									</xsl:call-template>
								</input>
							</div>
							<div class="styIRS8867ChBx" style="height:7.9mm;padding-top:2mm">
								<input type="checkbox" aria-label="DocumentInquiryIndNo" class="styCkbox">
									<xsl:call-template name="PopulateNoCheckbox">
										<xsl:with-param name="TargetNode" select="$FormData/DocumentInquiryInd"/>
										<xsl:with-param name="BackupName">IRS8867DocumentInquiryInd</xsl:with-param>
									</xsl:call-template>
								</input>
							</div>
							<div class="styIRS8867ChBx" style="height:7.7mm;background-color:lightgrey"/>
						</div>
					</div>
					<!-- End Line 4b -->
					<!-- Begin Line 5 -->
					<div class="styBB" style="height:51.4mm;">
						<div class="styLNLeftNumBox" style="padding-top:1mm;height:100%;">5</div>
						<div class="styIRS8867ChildDesc" style="font-size:8pt;width:148mm;padding-top:1mm;height:23mm;">
							   Did you satisfy the record retention requirement?  To meet the record retention requirement, you must keep a copy of your documentation referenced in question 4b, a copy of this Form 8867, a copy of any applicable worksheet(s), a record of how, when, and from whom the information used to prepare Form 8867 and any applicable worksheet(s) was obtained, and a copy of any document(s) provided by the taxpayer that you relied on to determine eligibility for the credit(s) and/or HOH filing status or to figure the amount(S) of the credit(s)
							    <span class="styDotLn" style="font-size: 8pt;float:none;clear:none;padding-left:1.5mm;">........................</span>
						</div>
						<div class="styIRS8867ChildBox" style="height:22.8mm; width:30.9mm;padding-top:0mm;">
							<div class="styIRS8867ChBx" style="height: 12mm; background-color:lightgrey;"/>
							<div class="styIRS8867ChBx" style="height: 12mm; background-color:lightgrey;"/>
							<div class="styIRS8867ChBx" style="height: 12mm; background-color:lightgrey;"/>
							<div class="styIRS8867ChBx" style="height:10.5mm;padding-top:5mm">
								<xsl:call-template name="PopulateSpan">
									<xsl:with-param name="TargetNode" select="$FormData/SatisfyRecordRetentionRqrInd"/>
								</xsl:call-template>
								<input type="checkbox" aria-label="SatisfyRecordRetentionRqrIndYes" class="styCkbox">
									<xsl:call-template name="PopulateYesCheckbox">
										<xsl:with-param name="TargetNode" select="$FormData/SatisfyRecordRetentionRqrInd"/>
										<xsl:with-param name="BackupName">IRS8867SatisfyRecordRetentionRqrInd</xsl:with-param>
									</xsl:call-template>
								</input>
							</div>
							<div class="styIRS8867ChBx" style="height:10.5mm;padding-top:5mm">
								<input type="checkbox" aria-label="SatisfyRecordRetentionRqrIndNo" class="styCkbox">
									<xsl:call-template name="PopulateNoCheckbox">
										<xsl:with-param name="TargetNode" select="$FormData/SatisfyRecordRetentionRqrInd"/>
										<xsl:with-param name="BackupName">IRS8867SatisfyRecordRetentionRqrInd</xsl:with-param>
									</xsl:call-template>
								</input>
							</div>
							<div class="styIRS8867ChBx" style="height:10.5mm;background-color:lightgrey"/>
						</div>
						<br/>
						<br/>
						<div class="styIRS8867ChildDesc" style="font-size:8pt;width:148mm;padding-top:1mm;height:32mm;">
							    List those documents provided by the taxpayer, if any, that you relied on:<br/>
							<xsl:choose>
								<xsl:when test="$FormData/WorkPaperDocumentNm">
									<div class="styFixedUnderline" style="width:148mm;height:6mm;background-color:lightgrey">
                    See Additional Data Table	
									</div>
                </xsl:when>
								<xsl:otherwise>
									<div class="styFixedUnderline" style="width:148mm;height:6mm;background-color:lightgrey"/>
								</xsl:otherwise>								
							</xsl:choose>
                <div class="styFixedUnderline" style="width:148mm;height:6mm;background-color:lightgrey"/>
                <div class="styFixedUnderline" style="width:148mm;height:6mm;background-color:lightgrey"/>
                <div class="styBB" style="width:148mm;padding-top:5mm;float:clear;background-color:lightgrey"/>								
						</div>
						<div class="styIRS8867ChildBox" style="height:28.5mm;padding-top:20mm;padding-right:0mm;background-color:lightgrey;width:10.2mm;"/>
						<div class="styIRS8867ChildBox" style="height:28.5mm;padding-top:20mm;padding-right:0mm;background-color:lightgrey;width:10.3mm"/>
						<div class="styIRS8867ChildBox" style="height:28.5mm;padding-top:20mm;padding-right:0mm;background-color:lightgrey;width:10.4mm;border-right-width: 1px;"/>
					</div>
					<!-- End Line 5 -->
					<!-- Begin Line 6 -->
					<div class="styBB" style="width:187mm;height:12mm;">
						<div class="styLNLeftNumBox" style="padding-top:1mm;height:100%;">6</div>
						<div class="styIRS8867ChildDesc" style="width:148mm;padding-top:1mm;">
							<span style="font-size: 8pt;float:left;clear:none;">Did you ask the taxpayer whether he/she could provide documentation to substantiate eligibility for the credit(s) and/or HOH filing status and the amount(s) of the credit(s) claimed on the return if his/her return is selected for audit?<span class="styDotLn" style="float:none;clear:none;padding-left:1.5mm;">.........................</span>
							</span>
						</div>
						<div class="styIRS8867ChildBox" style="height:12mm; width:31mm;padding-top: 0mm">
							<div>
								<div class="styIRS8867ChBx" style="height: 6mm; background-color:lightgrey;"/>
								<div class="styIRS8867ChBx" style="height: 6mm; background-color:lightgrey;"/>
								<div class="styIRS8867ChBx" style="height: 6mm; background-color:lightgrey;"/>
							</div>
							<div class="styIRS8867ChBx" style="height: 5.9mm;">
								<xsl:call-template name="PopulateSpan">
									<xsl:with-param name="TargetNode" select="$FormData/SubstantiateCrEligibilityInd"/>
								</xsl:call-template>
								<input type="checkbox" aria-label="SubstantiateCrEligibilityIndYes" class="styCkbox">
									<xsl:call-template name="PopulateYesCheckbox">
										<xsl:with-param name="TargetNode" select="$FormData/SubstantiateCrEligibilityInd"/>
										<xsl:with-param name="BackupName">IRS8867SubstantiateCrEligibilityInd</xsl:with-param>
									</xsl:call-template>
								</input>
							</div>
							<div class="styIRS8867ChBx" style="height: 5.9mm;">
								<input type="checkbox" aria-label="SubstantiateCrEligibilityIndNo" class="styCkbox">
									<xsl:call-template name="PopulateNoCheckbox">
										<xsl:with-param name="TargetNode" select="$FormData/SubstantiateCrEligibilityInd"/>
										<xsl:with-param name="BackupName">IRS8867SubstantiateCrEligibilityInd</xsl:with-param>
									</xsl:call-template>
								</input>
							</div>
							<div class="styIRS8867ChBx" style="background-color:lightgrey;height: 5.8mm;"/>
						</div>
					</div>
					<!-- End Line 6 -->
					<div class="styBB">
					<!-- Begin Line 7 -->
					<div class="styGenericDiv" style="width:187mm;height:10mm;padding-top:0mm;">
						<div class="styLNLeftNumBox" style="height:100%;padding-top:1mm;">7</div>
						<div class="styIRS8867LNDesc" style="font-size: 8pt;width:148mm;height:100%;padding-top:1mm;">
								Did you ask the taxpayer if any of these credits were disallowed or reduced in a previous year?<br/>
							<b>(If credits were disallowed or reduced, go to question 7a; if not, go to question 8.)</b>
						</div>
						<div class="styIRS8867ChildBox" style="height:100%;width:31mm;padding-top:0mm;">
							<div class="styIRS8867ChBx" style="height:6mm; padding-top:1mm">
								<xsl:call-template name="PopulateSpan">
									<xsl:with-param name="TargetNode" select="$FormData/PrevDisallowedOrReducedCrCd"/>
								</xsl:call-template>
								<input type="checkbox" aria-label="PrevDisallowedOrReducedCrCdYES" class="styCkbox">
									<xsl:call-template name="PopulateEnumeratedCheckbox">
										<xsl:with-param name="TargetNode" select="$FormData/PrevDisallowedOrReducedCrCd"/>
										<xsl:with-param name="DisplayedCheckboxValue" select="'YES'"/>
										<xsl:with-param name="BackupName">IRS8867PrevDisallowedOrReducedCrCdYES</xsl:with-param>
									</xsl:call-template>
								</input>
							</div>
							<div class="styIRS8867ChBx" style="height:6mm; padding-top: 1mm">
								<input type="checkbox" aria-label="PrevDisallowedOrReducedCrCdNO" class="styCkbox">
									<xsl:call-template name="PopulateEnumeratedCheckbox">
										<xsl:with-param name="TargetNode" select="$FormData/PrevDisallowedOrReducedCrCd"/>
										<xsl:with-param name="DisplayedCheckboxValue" select="'NO'"/>
										<xsl:with-param name="BackupName">IRS8867PrevDisallowedOrReducedCrCdNO</xsl:with-param>
									</xsl:call-template>
								</input>
							</div>
							<div class="styIRS8867ChBx" style="height:6mm; padding-top: 1mm;">
								<input type="checkbox" aria-label="PrevDisallowedOrReducedCrCdN/A" class="styCkbox">
									<xsl:call-template name="PopulateEnumeratedCheckbox">
										<xsl:with-param name="TargetNode" select="$FormData/PrevDisallowedOrReducedCrCd"/>
										<xsl:with-param name="DisplayedCheckboxValue" select="'N/A'"/>
										<xsl:with-param name="BackupName">IRS8867PrevDisallowedOrReducedCrCdNA</xsl:with-param>
									</xsl:call-template>
								</input>
							</div>
               <div class="styIRS8867ChBx" style="height: 3.9mm; background-color:lightgrey;"/>
							<div class="styIRS8867ChBx" style="height: 3.9mm; background-color:lightgrey;"/>
							<div class="styIRS8867ChBx" style="height: 3.9mm; background-color:lightgrey;"/>
						</div>
					</div>
					<!-- End Line 7 -->
					<!-- Begin Line 7a -->
					<div class="styGenericDiv" style="width:187mm;height:5mm;">
						<div class="styLNLeftNumBox" style="height:100%;padding-left:5mm;">a</div>
						<div class="styIRS8867ChildDesc" style="font-size:8pt;height:100%;width:148mm;">
						    Did you complete the required recertification Form 8862?<span class="styDotLn" style="float:none;clear:none;padding-left:1.5mm;">...............</span>
						</div>
						<div class="styIRS8867ChildBox" style="height:5.3mm;width:31mm;padding-top:0mm;">
							<div class="styIRS8867ChBx" style="height: 5mm">
								<xsl:call-template name="PopulateSpan">
									<xsl:with-param name="TargetNode" select="$FormData/CompleteRequiredRecertFormCd"/>
								</xsl:call-template>
								<input type="checkbox" aria-label="CompleteRequiredRecertFormCdYes" class="styCkbox">
									<xsl:call-template name="PopulateEnumeratedCheckbox">
										<xsl:with-param name="TargetNode" select="$FormData/CompleteRequiredRecertFormCd"/>
										<xsl:with-param name="DisplayedCheckboxValue" select="'YES'"/>
										<xsl:with-param name="BackupName">IRS8867CompleteRequiredRecertFormCdYES</xsl:with-param>
									</xsl:call-template>
								</input>
							</div>
							<div class="styIRS8867ChBx" style="height: 5mm">
								<input type="checkbox" aria-label="CompleteRequiredRecertFormCdNo" class="styCkbox">
									<xsl:call-template name="PopulateEnumeratedCheckbox">
										<xsl:with-param name="TargetNode" select="$FormData/CompleteRequiredRecertFormCd"/>
										<xsl:with-param name="DisplayedCheckboxValue" select="'NO'"/>
										<xsl:with-param name="BackupName">IRS8867CompleteRequiredRecertFormCdNO</xsl:with-param>
									</xsl:call-template>
								</input>
							</div>
							<div class="styIRS8867ChBx" style="height: 5mm">
								<input type="checkbox" aria-label="CompleteRequiredRecertFormCdN/A" class="styCkbox">
									<xsl:call-template name="PopulateEnumeratedCheckbox">
										<xsl:with-param name="TargetNode" select="$FormData/CompleteRequiredRecertFormCd"/>
										<xsl:with-param name="DisplayedCheckboxValue" select="'N/A'"/>
										<xsl:with-param name="BackupName">IRS8867CompleteRequiredRecertFormCdNA</xsl:with-param>
									</xsl:call-template>
								</input>
							</div>
						</div>
					</div>
					<!-- End Line 7a -->
					</div>
					<!-- Begin Line 8 -->
					<div class="styBB" style="width:187mm;height:9mm;padding-top:0mm;border-bottom-width: 2px;">
						<div class="styLNLeftNumBox" style="padding-top:.5mm;height:100%;">8</div>
						<div class="styIRS8867ChildDesc" style="font-size: 8pt;width:148mm;padding-top:0mm;">
							<span style="float:left;clear:none;">If the taxpayer is reporting self-employment income, did you ask 
								 questions to prepare a complete and correct Schedule C (Form 1040)?<span class="styDotLn" style="float:none;clear:none;padding-left:1.5mm;">.......................</span>
							</span>
						</div>
						<div class="styIRS8867ChildBox" style="height:100%;width:31mm;padding-top: 0mm">
							<div>
								<div class="styIRS8867ChBx" style="height: 3.9mm; background-color:lightgrey;"/>
								<div class="styIRS8867ChBx" style="height: 3.9mm; background-color:lightgrey;"/>
								<div class="styIRS8867ChBx" style="height: 3.9mm; background-color:lightgrey;"/>
							</div>
							<div class="styIRS8867ChBx" style="height:4mm;padding-top:0mm">
								<xsl:call-template name="PopulateSpan">
									<xsl:with-param name="TargetNode" select="$FormData/QstnToCompleteCorrectSchCCd"/>
								</xsl:call-template>
								<input type="checkbox" aria-label="QstnToCompleteCorrectSchCCdYES" class="styCkbox">
									<xsl:call-template name="PopulateEnumeratedCheckbox">
										<xsl:with-param name="TargetNode" select="$FormData/QstnToCompleteCorrectSchCCd"/>
										<xsl:with-param name="DisplayedCheckboxValue" select="'YES'"/>
										<xsl:with-param name="BackupName">IRS8867QstnToCompleteCorrectSchCCdYES</xsl:with-param>
									</xsl:call-template>
								</input>
							</div>
							<div class="styIRS8867ChBx" style="height:4mm;padding-top:0mm">
								<input type="checkbox" aria-label="QstnToCompleteCorrectSchCCdNO" class="styCkbox">
									<xsl:call-template name="PopulateEnumeratedCheckbox">
										<xsl:with-param name="TargetNode" select="$FormData/QstnToCompleteCorrectSchCCd"/>
										<xsl:with-param name="DisplayedCheckboxValue" select="'NO'"/>
										<xsl:with-param name="BackupName">IRS8867QstnToCompleteCorrectSchCCdNO</xsl:with-param>
									</xsl:call-template>
								</input>
							</div>
							<div class="styIRS8867ChBx" style="height:4mm;padding-top:0mm">
								<input type="checkbox" aria-label="QstnToCompleteCorrectSchCCdN/A" class="styCkbox">
									<xsl:call-template name="PopulateEnumeratedCheckbox">
										<xsl:with-param name="TargetNode" select="$FormData/QstnToCompleteCorrectSchCCd"/>
										<xsl:with-param name="DisplayedCheckboxValue" select="'N/A'"/>
										<xsl:with-param name="BackupName">IRS8867QstnToCompleteCorrectSchCCdNA</xsl:with-param>
									</xsl:call-template>
								</input>
							</div>
						</div>
					</div>
					<!-- End Line 8 -->
					<!-- Page boundary -->
					<div style="width:187mm;float:none;clear:both">
						<div style="float:left;">
							<span class="styBoldText">
					For Paperwork Reduction Act Notice, see separate instructions.
				  </span>
						</div>
						<div style="text-align:left;font-size:7pt;">
							<span style="width:90px"/>
				  Cat. No. 26142H     
				</div>
						<div style="float:right;">
							<span style="width:50px;"/>Form <span class="styBoldText" style="font-size:8pt;">8867</span>
					(Rev. 11-2024)
				</div>
					</div>
					<div class="pageEnd" style="width:187mm;float:none;clear:both;"/>
					<div style="width:187mm;float:none;clear:both;">
						<span style="float:left;">Form 8867 (Rev. 11-2024)</span>
						<span style="float:right;">Page <span style="font-weight:bold;font-size:9pt;">2</span>
						</span>
					</div>
					<div class="styGenericDiv" style="width:187mm;height:.5mm;"/>
					<!-- BEGIN Page 2 -->
					<div class="styBB" style="width:187mm;border-bottom-width:2px;"/>
					<div class="styPartName">Part II</div>
					<div class="styPartName" style="color:black;background-color:white;width:173mm;height:2mm;padding-left:1.3mm;text-align:left;font-size:7pt;padding-top:.5mm">Due Diligence Questions for Returns Claiming EIC <span style="font-weight:normal">(If the return does not claim EIC, go to Part III.)</span>
					</div>
					<div class="styBB" style="width:187mm;"/>
					<!-- Begin Line 9a -->
					<div class="styGenericDiv" style="width:187mm;height:13mm;">
						<div class="styLNLeftNumBox" style="padding-top:1mm;height:15.05mm;">9a</div>
						<div class="styIRS8867ChildDesc" style="font-size: 8pt;width:148mm;padding-top:1mm;height:13mm;">
							   Have you determined that the taxpayer is eligible to claim the EIC for the number of qualifying children claimed, or is eligible to claim the EIC without a qualifying child? <b>(If the taxpayer is claiming the EIC and does not have a qualifying child, go to question 10.)</b>
							<span class="styDotLn" style="float:none;clear:none;padding-left:1.5mm;">............</span>
						</div>
						<div class="styIRS8867ChildBox" style="width:31mm;height: 5.5mm;">
							<div>
								<div class="styIRS8867ChBx" style="border-bottom: black 1px solid">Yes</div>
								<div class="styIRS8867ChBx" style="border-bottom: black 1px solid">No</div>
								<div class="styIRS8867ChBx" style="border-bottom: black 1px solid">N/A</div>
							</div>
						</div>
						<div>
								<div class="styIRS8867ChBx" style="height:8mm;padding-top: 1mm;border-left: black 0.5px solid">
									<xsl:call-template name="PopulateSpan">
										<xsl:with-param name="TargetNode" select="$FormData/EICEligibleClaimQlfyChildInd"/>
									</xsl:call-template>
									<input type="checkbox" aria-label="EICEligibleClaimQlfyChildIndYes" class="styCkbox">
										<xsl:call-template name="PopulateYesCheckbox">
											<xsl:with-param name="TargetNode" select="$FormData/EICEligibleClaimQlfyChildInd"/>
											<xsl:with-param name="BackupName">IRS8867EICEligibleClaimQlfyChildInd</xsl:with-param>
										</xsl:call-template>
									</input>
								</div>
								<div class="styIRS8867ChBx" style="height:8mm;padding-top: 1mm">
									<input type="checkbox" aria-label="EICEligibleClaimQlfyChildIndNo" class="styCkbox">
										<xsl:call-template name="PopulateNoCheckbox">
											<xsl:with-param name="TargetNode" select="$FormData/EICEligibleClaimQlfyChildInd"/>
											<xsl:with-param name="BackupName">IRS8867EICEligibleClaimQlfyChildInd</xsl:with-param>
										</xsl:call-template>
									</input>
								</div>
								<div class="styIRS8867ChBx" style="height:8mm;background-color:lightgrey;"/>
							</div>
					</div>
					<!-- End Line 9a -->
					<!-- Begin Line 9b -->
					<div class="styGenericDiv" style="width:187mm;height:8mm;">
						<div class="styLNLeftNumBoxSD" style="padding-top:1mm;height:7mm;padding-left:3mm;">b</div>
						<div class="styIRS8867ChildDesc" style="font-size: 8pt;width:148mm;padding-top:1mm;height:7mm;">
							   Did you ask the taxpayer if the child lived with the taxpayer for over half of the year, even if the taxpayer has supported the child the entire year?<span class="styDotLn" style="float:none;clear:none;padding-left:1.5mm;">..................</span>
						</div>
						<div class="styIRS8867ChildBox" style="height:8.5mm;width: 31mm;">
							<div>
								<div class="styIRS8867ChBx" style="height: 3mm; background-color:lightgrey;"/>
								<div class="styIRS8867ChBx" style="height: 3mm; background-color:lightgrey;"/>
								<div class="styIRS8867ChBx" style="height: 3mm; background-color:lightgrey;"/>
							</div>
							<div class="styIRS8867ChBx" style="height:6mm; padding-top:0mm">
								<xsl:call-template name="PopulateSpan">
									<xsl:with-param name="TargetNode" select="$FormData/ExplainLiveWithChldRqrClaimInd"/>
								</xsl:call-template>
								<input type="checkbox" aria-label="ExplainLiveWithChldRqrClaimIndYes" class="styCkbox">
									<xsl:call-template name="PopulateYesCheckbox">
										<xsl:with-param name="TargetNode" select="$FormData/ExplainLiveWithChldRqrClaimInd"/>
										<xsl:with-param name="BackupName">IRS8867ExplainLiveWithChldRqrClaimInd</xsl:with-param>
									</xsl:call-template>
								</input>
							</div>
							<div class="styIRS8867ChBx" style="height:5mm; padding-top:0mm">
								<input type="checkbox" aria-label="ExplainLiveWithChldRqrClaimIndNo" class="styCkbox">
									<xsl:call-template name="PopulateNoCheckbox">
										<xsl:with-param name="TargetNode" select="$FormData/ExplainLiveWithChldRqrClaimInd"/>
										<xsl:with-param name="BackupName">IRS8867ExplainLiveWithChldRqrClaimInd</xsl:with-param>
									</xsl:call-template>
								</input>
							</div>
							<div class="styIRS8867ChBx" style="height:8.2mm;background-color:lightgrey;"/>
						</div>
						<!--<div class="styIRS8867ChildBox" style="height:11mm;padding-top:4.75mm;border-top-width:1px;background-color:lightgrey;"></div>
							<div class="styIRS8867ChildBox" style="height:11mm;padding-top:4.75mm;border-top-width:1px;background-color:lightgrey;"></div>
        					<div class="styIRS8867ChildBox" style="height:11mm;padding-top:4.75mm;border-top-width:1px;background-color:lightgrey;border-right-width: 1px;" ></div>-->
					</div>
					<!-- End Line 9b -->
					<!-- Begin Line 9c -->
					<div class="styGenericDiv" style="width:187mm;height:9mm;">
						<div class="styLNLeftNumBoxSD" style="padding-top:0mm;height:9mm;padding-left:3mm;">c</div>
						<div class="styIRS8867ChildDesc" style="font-size: 8pt;width:148mm;padding-top:.5mm;height:10mm;">
							   Did you explain to the taxpayer the rules about claiming the EIC when a child is the qualifying child of more than one person (tiebreaker rules)?
							<span class="styDotLn" style="float:none;clear:none;padding-left:1.5mm;">....................</span>
						</div>
						<div class="styIRS8867ChildBox" style="height:9mm;width: 31mm;">
							<div>
								<div class="styIRS8867ChBx" style="height: 3mm; background-color:lightgrey;"/>
								<div class="styIRS8867ChBx" style="height: 3mm; background-color:lightgrey;"/>
								<div class="styIRS8867ChBx" style="height: 3mm; background-color:lightgrey;"/>
							</div>
							<div class="styIRS8867ChBx" style="height:6mm">
								<xsl:call-template name="PopulateSpan">
									<xsl:with-param name="TargetNode" select="$FormData/ExplainTiebreakerRulesCd"/>
								</xsl:call-template>
								<input type="checkbox" aria-label="ExplainTiebreakerRulesCdYes" class="styCkbox">
									<xsl:call-template name="PopulateEnumeratedCheckbox">
										<xsl:with-param name="TargetNode" select="$FormData/ExplainTiebreakerRulesCd"/>
										<xsl:with-param name="DisplayedCheckboxValue" select="'YES'"/>
										<xsl:with-param name="BackupName">IRS8867ExplainTiebreakerRulesCdYES</xsl:with-param>
									</xsl:call-template>
								</input>
							</div>
							<div class="styIRS8867ChBx">
								<input type="checkbox" aria-label="ExplainTiebreakerRulesCdNo" class="styCkbox">
									<xsl:call-template name="PopulateEnumeratedCheckbox">
										<xsl:with-param name="TargetNode" select="$FormData/ExplainTiebreakerRulesCd"/>
										<xsl:with-param name="DisplayedCheckboxValue" select="'NO'"/>
										<xsl:with-param name="BackupName">IRS8867ExplainTiebreakerRulesCdNO</xsl:with-param>
									</xsl:call-template>
								</input>
							</div>
							<div class="styIRS8867ChBx">
								<input type="checkbox" aria-label="ExplainTiebreakerRulesCdN/A" class="styCkbox">
									<xsl:call-template name="PopulateEnumeratedCheckbox">
										<xsl:with-param name="TargetNode" select="$FormData/ExplainTiebreakerRulesCd"/>
										<xsl:with-param name="DisplayedCheckboxValue" select="'N/A'"/>
										<xsl:with-param name="BackupName">IRS8867ExplainTiebreakerRulesCdNA</xsl:with-param>
									</xsl:call-template>
								</input>
							</div>
						</div>
						<!--<div class="styIRS8867ChildBox" style="height:11mm;padding-top:4.75mm;background-color:lightgrey;border-bottom-width: 0px;"></div>
							<div class="styIRS8867ChildBox" style="height:11mm;padding-top:4.75mm;background-color:lightgrey;border-bottom-width: 0px;"></div>
        					<div class="styIRS8867ChildBox" style="height:11mm;padding-top:4.75mm;background-color:lightgrey;border-bottom-width: 0px;border-right-width: 1px;" ></div>-->
					</div>
					<!-- End Line 9c -->
					<!-- Begin Line 10 -->
					<div class="styBB" style="width:187mm;"/>
					<div class="styPartName">Part III</div>
					<div class="styPartName" style="color:black;background-color:white;width:173mm;height:3mm;padding-top:1mm;padding-left:1.3mm;text-align:left;font-size:7pt;font-weight:normal">
						<b>Due Diligence Questions for Returns Claiming CTC/ACTC/ODC</b> (If the return does not claim CTC, ACTC, or ODC go to Part IV.)
					</div>
					<div class="styBB" style="width:187mm"/>
					<!-- Begin Line 10 -->
					<div class="styGenericDiv" style="width:187mm;height:8mm;">
						<div class="styLNLeftNumBoxSD" style="padding-top:1mm;height:8mm;padding-left:0mm;">10</div>
						<div class="styIRS8867ChildDesc" style="font-size: 8pt;width:148mm;padding-top:1mm;">
							   Have you determined that each qualifying person for the CTC/ACTC/ODC is the taxpayer's dependent who is a citizen, national, or resident of the United States?
							   <span class="styDotLn" style="float:none;clear:none;padding-left:1.5mm;">..............</span>
						</div>
						<div class="styIRS8867ChildBox" style="height:30mm;width: 31mm;">
							<div>
								<div class="styIRS8867ChBx" style="height:3mm;border-bottom: black 1px solid;">YES</div>
								<div class="styIRS8867ChBx" style="height:3mm;border-bottom: black 1px solid">NO</div>
								<div class="styIRS8867ChBx" style="height:3mm;border-bottom: black 1px solid">N/A</div>
								<div>
									<!--<div class="styIRS8867ChBx" style="background-color:lightgrey;"></div>
							<div class="styIRS8867ChBx" style="background-color:lightgrey;"></div>-->
									<div class="styIRS8867ChBx" style="background-color:lightgrey;height:5.4mm;"/>
								</div>
								<div class="styIRS8867ChBx" style="height:5mm;padding-top:1.5mm">
									<xsl:call-template name="PopulateSpan">
										<xsl:with-param name="TargetNode" select="$FormData/USCitizenOrNationalInd"/>
									</xsl:call-template>
									<input type="checkbox" aria-label="USCitizenOrNationalIndYes" class="styCkbox">
										<xsl:call-template name="PopulateYesCheckbox">
											<xsl:with-param name="TargetNode" select="$FormData/USCitizenOrNationalInd"/>
											<xsl:with-param name="BackupName">IRS8867USCitizenOrNationalInd</xsl:with-param>
										</xsl:call-template>
									</input>
								</div>
								<div class="styIRS8867ChBx" style="height:5mm;padding-top:1.5mm">
									<input type="checkbox" aria-label="USCitizenOrNationalIndNo" class="styCkbox">
										<xsl:call-template name="PopulateNoCheckbox">
											<xsl:with-param name="TargetNode" select="$FormData/USCitizenOrNationalInd"/>
											<xsl:with-param name="BackupName">IRS8867USCitizenOrNationalInd</xsl:with-param>
										</xsl:call-template>
									</input>
								</div>
							</div>
						</div>
					</div>
					<!-- End Line 10 -->
					<!-- Begin Line 11 -->
					<div class="styGenericDiv" style="width:187mm;height:10mm;">
						<div class="styLNLeftNumBoxSD" style="padding-top:1mm;height:10mm;padding-left:0mm;">11</div>
						<div class="styIRS8867ChildDesc" style="font-size: 8pt;width:148mm;padding-top:0mm;height:10mm;">
							   Did you explain to the taxpayer that he/she may not claim the CTC/ACTC if the child has not lived with the taxpayer for over half of the year, even if the taxpayer has supported the child, unless the child's custodial parent has released a claim to exemption for the child?<span class="styDotLn" style="float:none;clear:none;padding-left:1.5mm;">.............</span>
						</div>
						<div class="styIRS8867ChildBox" style="height:1mm;width: 31mm;">
							<!--<div>-->
							<!--<div class="styIRS8867ChBx" style="height: 1mm; background-color:yellow;"></div>
							<div class="styIRS8867ChBx" style="height: 1mm; background-color:lightgrey;"></div>-->
							<!--<div class="styIRS8867ChBx" style="height: 1mm; background-color:lightgrey;"></div>-->
							<!--</div>-->
							<div class="styIRS8867ChBx" style="height: 10mm; padding-top:5mm;">
								<xsl:call-template name="PopulateSpan">
									<xsl:with-param name="TargetNode" select="$FormData/ExplainLiveWithChldRqrClaimCd"/>
								</xsl:call-template>
								<input type="checkbox" aria-label="ExplainLiveWithChldRqrClaimCdYes" class="styCkbox">
									<xsl:call-template name="PopulateEnumeratedCheckbox">
										<xsl:with-param name="TargetNode" select="$FormData/ExplainLiveWithChldRqrClaimCd"/>
										<xsl:with-param name="DisplayedCheckboxValue" select="'YES'"/>
										<xsl:with-param name="BackupName">IRS8867ExplainLiveWithChldRqrClaimCdYES</xsl:with-param>
									</xsl:call-template>
								</input>
							</div>
							<div class="styIRS8867ChBx" style="height: 10mm; padding-top:5mm">
								<input type="checkbox" aria-label="ExplainLiveWithChldRqrClaimCdNo" class="styCkbox">
									<xsl:call-template name="PopulateEnumeratedCheckbox">
										<xsl:with-param name="TargetNode" select="$FormData/ExplainLiveWithChldRqrClaimCd"/>
										<xsl:with-param name="DisplayedCheckboxValue" select="'NO'"/>
										<xsl:with-param name="BackupName">IRS8867ExplainLiveWithChldRqrClaimCdNO</xsl:with-param>
									</xsl:call-template>
								</input>
							</div>
							<div class="styIRS8867ChBx" style="height: 10mm; padding-top:5mm">
								<input type="checkbox" aria-label="ExplainLiveWithChldRqrClaimCdN/A" class="styCkbox">
									<xsl:call-template name="PopulateEnumeratedCheckbox">
										<xsl:with-param name="TargetNode" select="$FormData/ExplainLiveWithChldRqrClaimCd"/>
										<xsl:with-param name="DisplayedCheckboxValue" select="'N/A'"/>
										<xsl:with-param name="BackupName">IRS8867ExplainLiveWithChldRqrClaimCdNA</xsl:with-param>
									</xsl:call-template>
								</input>
							</div>
						</div>
					</div>
					<!-- End Line 11 -->
					<!-- Begin Line 12 -->
					<div class="styGenericDiv" style="width:187mm;height:11mm;">
						<div class="styLNLeftNumBoxSD" style="padding-top:1mm;height:11mm;padding-left:0mm;">12</div>
						<div class="styIRS8867ChildDesc" style="font-size: 8pt;width:148mm;">
							  Did you explain to the taxpayer the rules about claiming the CTC/ACTC/ODC for a child of divorced or separated parents
							 (or parents who live apart), including any requirement to attach a Form 8332 or similar statement to the return?
								<span class="styDotLn" style="float:none;clear:none;padding-left:1.5mm;">........................</span>
						</div>
						<div class="styIRS8867ChildBox" style="height:6mm;width: 31mm;padding-top: 0mm">
							<div>
								<div class="styIRS8867ChBx" style="height: 6mm; background-color:lightgrey;"/>
								<div class="styIRS8867ChBx" style="height: 6mm; background-color:lightgrey;"/>
								<div class="styIRS8867ChBx" style="height: 6mm; background-color:lightgrey;"/>
							</div>
							<div class="styIRS8867ChBx" style="height:7.5mm;padding-top:1mm">
								<xsl:call-template name="PopulateSpan">
									<xsl:with-param name="TargetNode" select="$FormData/ExplainRuleClmCrDivPrnts8332Cd"/>
								</xsl:call-template>
								<input type="checkbox" aria-label="ExplainRuleClmCrDivPrnts8332CdYes" class="styCkbox">
									<xsl:call-template name="PopulateEnumeratedCheckbox">
										<xsl:with-param name="TargetNode" select="$FormData/ExplainRuleClmCrDivPrnts8332Cd"/>
										<xsl:with-param name="DisplayedCheckboxValue" select="'YES'"/>
										<xsl:with-param name="BackupName">IRS8867ExplainRuleClmCrDivPrnts8332CdYES</xsl:with-param>
									</xsl:call-template>
								</input>
							</div>
							<div class="styIRS8867ChBx" style="height:7.5mm;padding-top:1mm;">
								<input type="checkbox" aria-label="ExplainRuleClmCrDivPrnts8332CdNo" class="styCkbox">
									<xsl:call-template name="PopulateEnumeratedCheckbox">
										<xsl:with-param name="TargetNode" select="$FormData/ExplainRuleClmCrDivPrnts8332Cd"/>
										<xsl:with-param name="DisplayedCheckboxValue" select="'NO'"/>
										<xsl:with-param name="BackupName">IRS8867ExplainRuleClmCrDivPrnts8332CdNO</xsl:with-param>
									</xsl:call-template>
								</input>
							</div>
							<div class="styIRS8867ChBx" style="height:7.5mm;padding-top:1mm">
								<input type="checkbox" aria-label="ExplainRuleClmCrDivPrnts8332CdN/A" class="styCkbox">
									<xsl:call-template name="PopulateEnumeratedCheckbox">
										<xsl:with-param name="TargetNode" select="$FormData/ExplainRuleClmCrDivPrnts8332Cd"/>
										<xsl:with-param name="DisplayedCheckboxValue" select="'N/A'"/>
										<xsl:with-param name="BackupName">IRS8867ExplainRuleClmCrDivPrnts8332CdNA</xsl:with-param>
									</xsl:call-template>
								</input>
							</div>
						</div>
					</div>
					<!-- End Line 12 -->
					<!-- End Line 10-12 -->
					<!-- Begin Line 13 -->
					<div class="styBB" style="width:187mm;padding-top:.5mm"/>
					<div class="styPartName">Part IV</div>
					<div class="styPartName" style="color:black;background-color:white;width:173mm;height:3mm;padding-left:1.3mm;text-align:left;font-size:7pt;font-weight:normal">
						<b>Due Diligence Questions for Returns Claiming AOTC</b> (If the return does not claim AOTC, go to Part V.)
					</div>
					<div class="styBB" style="width:187mm;border-bottom-width:1px;"/>
					<!-- Begin Line 13 -->
					<div class="styGenericDiv" style="width:187mm;height:10mm;">
						<div class="styLNLeftNumBox" style="padding-top:1mm;height:10mm;">13</div>
						<div class="styIRS8867ChildDesc" style="font-size:8pt;width:158.3mm;padding-top:1mm;">
							   Did the taxpayer provide substantiation for the credit, such as a Form 1098-T and/or receipts for the qualified tuition and related expenses for the claimed AOTC?<span class="styDotLn" style="float:none;clear:none;padding-left:1.5mm;">....................</span>
						</div>
						<div class="styIRS8867ChildBox" style="height:10.5mm;width: 20.7mm;padding-top:0mm">
							<div>
								<div class="styIRS8867ChBx" style="height: 3mm;border-bottom: black 1px solid">YES</div>
								<div class="styIRS8867ChBx" style="height: 3mm;border-bottom: black 1px solid">NO</div>
								<div class="styIRS8867ChBx" style="height:7.1mm">
									<xsl:call-template name="PopulateSpan">
										<xsl:with-param name="TargetNode" select="$FormData/SubstProvQlfyTuitionExpnssInd"/>
									</xsl:call-template>
									<input type="checkbox" aria-label="SubstProvQlfyTuitionExpnssIndYes" class="styCkbox">
										<xsl:call-template name="PopulateYesCheckbox">
											<xsl:with-param name="TargetNode" select="$FormData/SubstProvQlfyTuitionExpnssInd"/>
											<xsl:with-param name="BackupName">IRS8867SubstProvQlfyTuitionExpnssInd</xsl:with-param>
										</xsl:call-template>
									</input>
								</div>
								<div class="styIRS8867ChBx" style="height:7.1mm">
									<input type="checkbox" aria-label="SubstProvQlfyTuitionExpnssIndNo" class="styCkbox">
										<xsl:call-template name="PopulateNoCheckbox">
											<xsl:with-param name="TargetNode" select="$FormData/SubstProvQlfyTuitionExpnssInd"/>
											<xsl:with-param name="BackupName">IRS8867SubstProvQlfyTuitionExpnssInd</xsl:with-param>
										</xsl:call-template>
									</input>
								</div>
							</div>
						</div>
					</div>
					<!-- End Line 13 -->
					<div class="styBB" style="width:187mm;border-bottom-width:1px;padding-top:0.1mm"/>
					<div class="styPartName">Part V</div>
					<div class="styPartName" style="color:black;background-color:white;width:173mm;height:3mm;padding-left:1.3mm;text-align:left;font-size:7pt;font-weight:normal">
						<b>Due Diligence Questions for Claiming HOH</b> (If the return does not claim HOH filing status, go to Part VI.)
					</div>
					<div class="styBB" style="width:187mm;border-bottom-width:1px;"/>
					<!-- Begin Line 14 -->
					<div class="styGenericDiv" style="width:187mm;height:11mm;">
						<div class="styLNLeftNumBox" style="padding-top:1mm;height:11mm;">14</div>
						<div class="styIRS8867ChildDesc" style="font-size:8pt;width:158.3mm;padding-top:1mm;">
							   Have you determined that the taxpayer was unmarried or considered unmarried on the last day  of the tax year 
							   and provided more than half of the cost of keeping up a home for the year for a qualifying person?
							   <span class="styDotLn" style="float:none;clear:none;padding-left:1.5mm;">...</span>
						</div>
						<div class="styIRS8867ChildBox" style="height:11.5mm;width: 20.7mm;padding-top:0mm;">
							<div>
								<div class="styIRS8867ChBx" style="height: 3mm;border-bottom: black 1px solid">YES</div>
								<div class="styIRS8867ChBx" style="height: 3mm;border-bottom: black 1px solid">NO</div>
								<br/>
								<div class="styIRS8867ChBx" style="height:8.1mm;padding-top:0mm;">
									<xsl:call-template name="PopulateSpan">
										<xsl:with-param name="TargetNode" select="$FormData/EligibleClaimHOHInd"/>
									</xsl:call-template>
									<input type="checkbox" aria-label="EligibleClaimHOHIndYes" class="styCkbox">
										<xsl:call-template name="PopulateYesCheckbox">
											<xsl:with-param name="TargetNode" select="$FormData/EligibleClaimHOHInd"/>
											<xsl:with-param name="BackupName">IRS8867EligibleClaimHOHInd</xsl:with-param>
										</xsl:call-template>
									</input>
								</div>
								<div class="styIRS8867ChBx" style="height:8.1mm; padding-top:0mm">
									<input type="checkbox" aria-label="EligibleClaimHOHIndNo" class="styCkbox">
										<xsl:call-template name="PopulateNoCheckbox">
											<xsl:with-param name="TargetNode" select="$FormData/EligibleClaimHOHInd"/>
											<xsl:with-param name="BackupName">IRS8867EligibleClaimHOHInd</xsl:with-param>
										</xsl:call-template>
									</input>
								</div>
							</div>
						</div>
					</div>
					<!-- End Line 14 -->
					<div class="styBB" style="width:187mm;border-bottom-width:1px;padding-top:0mm"/>
					<div class="styPartName">Part VI</div>
					<div class="styPartName" style="color:black;background-color:white;width:173mm;height:3mm;padding-left:1.3mm;text-align:left;font-size:7pt;font-weight:normal">
						<b>Eligibility 			Certification</b>
					</div>
					<div class="styBB" style="width:187mm;border-bottom-width:1px;"/>
					<!-- BEGIN Words Between 14 and 15 -->
					<div class="styIRS8867LNDesc" style="width:5mm;height:6mm;padding-left:8.5mm;"/>
					<br/>
					<div class="styIRS8867LNDesc" style="font-size:8pt;width:158mm;height:6mm;padding-left:3mm;float:none;">
						<b>You will have complied with all due diligence requirements for claiming the applicable credit(s) and/or 
							   HOH filing status on the return of the taxpayer identified above if you:</b>
					</div>
					<br/>
					<div class="styIRS8867LNDesc" style="font-size:8pt;width:187mm;padding-top:1.5mm;height:10mm;padding-left:11.5mm;float:none;">
								A. Interview the taxpayer, ask adequate questions, contemporaneously document the taxpayer's responses on the return or in your notes, review  adequate information to 
								determine if the taxpayer is eligible to claim the credit(s) and/or HOH filing status and to figure the amount(s) of the credit(s); </div>
					<br/>
					<div class="styIRS8867LNDesc" style="font-size:8pt;width:187mm;padding-top:2mm;height:6mm;padding-left:11.5mm;float:none;">
								B. Complete this Form 8867 truthfully and accurately and complete the actions described in this 
								 checklist for any applicable credit(s) claimed and HOH filing status, if claimed;</div>
					<br/>
					<div class="styIRS8867LNDesc" style="font-size:8pt;width:187mm;padding-top:3mm;height:3.3mm;padding-left:11.5mm;float:none;">
								C. Submit Form 8867 in the manner required;  <b>and</b>
					</div>
					<br/>
					<br/>
					<div class="styIRS8867LNDesc" style="font-size:8pt;width:187mm;height:6mm;padding-top:0.3mm;padding-left:11.5mm;float:none;">
								D. Keep all five of the following records for 3 years from the latest of the dates specified in the Form 8867 instructions under <i>Document Retention.</i>
					</div>
					<br/>
					<div class="styIRS8867LNDesc" style="font-size:10pt;width:187mm;padding-top:4mm;height:7mm;padding-left:14.6mm;float:none;">
								1. A copy of this Form 8867.</div>
					<br/>
					<div class="styIRS8867LNDesc" style="font-size:10pt;width:187mm;padding-top:4mm;height:7mm;padding-left:14.6mm;float:none;">
								2. The applicable worksheet(s) or your own worksheet(s) for any credit(s) claimed.</div>
					<br/>
					<div class="styIRS8867LNDesc" style="font-size:10pt;width:187mm;padding-top:4mm;height:7mm;;padding-left:14.6mm;float:none;">
								3. Copies of any documents provided by the taxpayer on which you relied to determine the taxpayer's eligibility for the credit(s) and/or HOH filing status and to figure the amount(s) of the credit(s).</div>
					<br/>
					<div class="styIRS8867LNDesc" style="font-size:10pt;width:187mm;padding-top:12mm;height:7mm;padding-left:14.6mm;float:none;">
								4. A record of how, when, and from whom the information used to prepare this form and the applicable worksheet(s) was obtained.</div>
					<br/>
					<div class="styIRS8867LNDesc" style="font-size:10pt;width:187mm;padding-top:10mm;height:7mm;padding-left:14.6mm;float:none;">
								5. A record of any additional information you relied upon, including questions you asked and the taxpayer's responses, to determine the taxpayer's eligibility for the credit(s) and/or HOH filing status and to figure the amount(s) of the credit(s).</div>
					<br/>
					<div class="styIRS8867LNDesc" style="font-size:8pt;width:5mm;height:6mm;padding-left:8.5mm;padding-top:6mm;float:none;"/>
					<div class="styIRS8867LNDesc" style="font-size:8pt;width:160mm;height:10mm;padding-left:3mm;padding-top:16mm;float:none;">
						<b>If you have not complied with all due diligence requirements, you may have  to pay a penalty for each failure to comply related to a claim of an applicable credit or HOH filing status (see instructions for more information).</b>
					</div>
					<br/>
					<div class="styGenericDiv" style="width:187mm;height:.3mm;float:none;"/>
					<div class="styGenericDiv" style="width:187mm;height:2mm;float:none;"/>
					<!-- END Words Between 14 and 15 -->
					<!-- Begin Line 15 -->
					<div class="styBB" style="width:187mm;padding-top:8mm;padding-bottom:.5mm;"/>
					<div class="styGenericDiv" style="width:187mm;height:11mm;">
						<div class="styLNLeftNumBoxBB" style="padding-top:3mm;height:11.35mm;border-bottom-width: 2px;">15</div>
						<div class="styIRS8867ChildDesc" style="font-size:8pt;width:158.3mm;padding-top:1mm;">
							    Do you certify that all of the answers on this Form 8867 are, to the best of your knowledge, true, correct, and complete?
							   <span class="styDotLn" style="float:none;clear:none;padding-left:1.5mm;">..................................</span>
							<div class="styBB" style="width:179mm;padding-top:3mm;border-bottom-width: 2px;"/>
						</div>
						<div class="styIRS8867ChildBox" style="height:11mm;width: 20.7mm;padding-top:0mm;">
							<div>
								<div class="styIRS8867ChBx" style="height: 3mm;border-bottom: black 1px solid">YES</div>
								<div class="styIRS8867ChBx" style="height: 3mm;border-bottom: black 1px solid">NO</div>
								<br/>
								<div class="styIRS8867ChBx" style="height:8.1mm;padding-top:0mm;">
									<xsl:call-template name="PopulateSpan">
										<xsl:with-param name="TargetNode" select="$FormData/CrEligibilityCertificationInd"/>
									</xsl:call-template>
									<input type="checkbox" aria-label="CrEligibilityCertificationIndYes" class="styCkbox">
										<xsl:call-template name="PopulateYesCheckbox">
											<xsl:with-param name="TargetNode" select="$FormData/CrEligibilityCertificationInd"/>
											<xsl:with-param name="BackupName">IRS8867CrEligibilityCertificationInd</xsl:with-param>
										</xsl:call-template>
									</input>
								</div>
								<div class="styIRS8867ChBx" style="height:8.1mm; padding-top:0mm">
									<input type="checkbox" aria-label="CrEligibilityCertificationIndNo" class="styCkbox">
										<xsl:call-template name="PopulateNoCheckbox">
											<xsl:with-param name="TargetNode" select="$FormData/CrEligibilityCertificationInd"/>
											<xsl:with-param name="BackupName">IRS8867CrEligibilityCertificationInd</xsl:with-param>
										</xsl:call-template>
									</input>
								</div>
							</div>
						</div>
					</div>
					<!-- End Line 15 -->
					<div class="pageEnd" style="width:187mm;float:none">
						<div style="float:right;">
							<div style="text-align:middle;font-size:7pt;">
								<span style="width:90px"/> 
							  Cat. No. 26142H    
							  <span style="width:101px;"/>  
							  Form <span class="styBoldText" style="font-size:8pt;">8867</span> (Rev. 11-2024)
							</div>
						</div>
					</div>
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
					<xsl:choose>
						<xsl:when test="$FormData/WorkPaperDocumentNm">
							<table class="styDepTbl" cellspacing="0" style="font-size:7pt;width:142mm;">
								<thead class="styTableThead">
									<tr class="styDepTblHdr">
										<th class="styDepTblCell" scope="col" style="width:141mm;">Due Diligence Requirements LINE 5 Additional Notes and Document List</th>
									</tr>
								</thead>
								<tfoot/>
								<tbody>
									<tr style="border-color:black;height:6mm;">
										<td class="styTableCellText" style="width:141.5mm;">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="$FormData/WorkPaperDocumentNm"/>
											</xsl:call-template>
										</td>
									</tr>
								</tbody>
							</table>
							<br/>
						</xsl:when>
					</xsl:choose>
				</form>
			</body>
		</html>
	</xsl:template>
</xsl:stylesheet>