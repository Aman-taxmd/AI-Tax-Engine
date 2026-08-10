<?xml version="1.0"?>
<!DOCTYPE xsl:stylesheet [
	<!ENTITY nbsp "&#160;"> 
	<!ENTITY mdash "&#8212;">
]>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:include href="PopulateTemplate.xsl"/>
	<xsl:include href="CommonPathRef.xsl"/>
	<xsl:include href="AddHeader.xsl"/>
	<xsl:include href="AddOnTable.xsl"/>
	<xsl:include href="IRS7204Style.xsl"/>
	<xsl:output method="html" indent="yes" encoding="iso-8859-1"/>
	<xsl:strip-space elements="*"/>
	<xsl:param name="FormData" select="$RtnDoc/IRS7204"/>
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
				<!-- No Browser Caching -->
				<meta http-equiv="Pragma" content="no-cache"/>
				<meta http-equiv="Cache-Control" content="no-cache"/>
				<meta http-equiv="Expires" content="0"/>
				<!-- No Proxy Caching -->
				<meta http-equiv="Cache-Control" content="private"/>
				<meta name="Description" content="IRS Form 7204"/>
				<meta name="Generator" content="IBM WebSphere Studio"/>
				<script language="JavaScript" src="{$ScriptPath}/FormDisplay.js" type="text/javascript"/>
				<xsl:call-template name="InitJS"/>
				<style type="text/css">
					<xsl:if test="not($Print) or $Print=''">
						<xsl:call-template name="IRS7204Style"/>
						<xsl:call-template name="AddOnStyle"/>
					</xsl:if>
				</style>
				<xsl:call-template name="GlobalStylesForm"/>
			</head>
			<body class="styBodyClass">
				<form id="Form7204" style="">
					<xsl:call-template name="DocumentHeader"/>
					<div class="styStdDiv" style="width:187mm;">
						<div class="styFNBox" style="width:31mm;height:22mm">
							Form <span class="styFormNumber">7204</span>
							<br/>
							(December 2022)
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$FormData"/>
							</xsl:call-template>
							<br/>
							<br/>
							<div class="styAgency"> Department of the Treasury<br/>
							Internal Revenue Service</div>
						</div>
						<div class="styFTBox" style="width:125mm;">
							<div class="styMainTitle" style="padding-top:0.5mm;padding-bottom:1mm;">
							 Consent To Extend the Time To Assess Tax <br />
							  Related to Contested Foreign Income Taxes &mdash; <br />
							  Provisional Foreign Tax Credit Agreement
							</div>
							<br/>
							<div class="styFST" style="width:125mm;float:left;clear:none;padding-top:.5mm;">
								Go to  			
								<span style="font-style:italic;">www.irs.gov/Form7204</span> 
								for instructions and the latest information.
							</div>
						</div>
						<div class="styTYBox" style="width:31mm;height:22mm;">
							<div class="styOMB" style="height:5.5mm;padding-top;1mm;">OMB No. 1545-2296</div>
							<div class="styOMB" style="border-bottom-width:0px;text-align:left;padding-left:5mm;padding-top:3mm;">
								<div style="padding-top:2mm;text-align:left;font-size:7pt;">
									Attachment<br/>Sequence No. <span class="styBoldText" style="font-size:9pt;">204</span>
								</div>
							</div>
						</div>
					</div>
					<!-- End form title and Form number Section -->
					<div class="styStdDiv" style="border-top:1px solid black;border-bottom:1px solid black;">
						<div class="styNameBox" style="width:127mm;height:17mm;">
							Name(s) of consenting taxpayer(s)<br/>
							<xsl:call-template name="PopulateReturnHeaderFiler">
								<xsl:with-param name="TargetNode">BusinessNameLine1Txt</xsl:with-param>
							</xsl:call-template>
							<br/>
							<xsl:call-template name="PopulateReturnHeaderFiler">
								<xsl:with-param name="TargetNode">BusinessNameLine2Txt</xsl:with-param>
							</xsl:call-template>
						</div>
						<div class="styEINBox" style="width:60mm;padding-left:0.5mm;font-weight:normal;height:7.5mm;border-bottom:1px solid black;">
							<strong>Identifying number</strong> (see instructions)<br/>
							<xsl:call-template name="PopulateReturnHeaderFilerTIN"/>
						</div>
						<div class="styEINBox" style="width:60mm;padding-left:0.5mm;font-weight:normal;">
							Social security number of spouse (only if a joint income tax return was filed)<br/>
							<xsl:call-template name="PopulateReturnHeaderFiler">
								<xsl:with-param name="TargetNode">SpouseSSN</xsl:with-param>
							</xsl:call-template>
						</div>
					</div>
					<div class="styStdDiv" style="border-bottom:1px solid black;">
						<div class="styNameBox" style="width:127mm;height:auto;min-height:7mm;">
							Number, street, and room or suite no. (If a P.O. box, see instructions.)<br/>
							<xsl:call-template name="PopulateReturnHeaderFiler">
								<xsl:with-param name="TargetNode">AddressLine1Txt</xsl:with-param>
							</xsl:call-template>
							<xsl:if test="$RtnHdrData/Filer//AddressLine2Txt">
								<br/>
								<xsl:call-template name="PopulateReturnHeaderFiler">
									<xsl:with-param name="TargetNode">AddressLine2Txt</xsl:with-param>
								</xsl:call-template>
							</xsl:if>
						</div>
						<div class="styEINBox" style="width:60mm;padding-left:0.5mm;font-weight:normal;height:auto;min-height:7mm;">
							City or town, state, and ZIP code<br/>
							<xsl:call-template name="PopulateReturnHeaderFiler">
								<xsl:with-param name="TargetNode">CityStateInfo</xsl:with-param>
							</xsl:call-template>
						</div>
					</div>
					<div class="styStdDiv">
						<div class="styLNDesc" style="width:100%;float:none;">
							<strong>Important. </strong> If you have more than one contest with respect to the tax year described in item 1, complete a separate Form 7204 for each contest.
						</div>
					</div>
					<div class="styStdDiv" style="font-family:Arial;font-size:8pt;">
						<div class="styLNDesc" style="width:100%;float:none;padding-bottom:0px;">
							Check the box below to indicate the reason for filing Form 7204:
						</div>
						<div class="styLNLeftNumBoxSD" style="height:auto;">
							<input type="checkbox" class="styCkboxNM" style="" alt="Claimed Foreign Tax Credit on Accrual Basis">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$FormData/ClmForeignTaxCrAccrualBasisInd"/>
									<xsl:with-param name="BackupName">F7204ClmForeignTaxCrAccrualBasisInd</xsl:with-param>
								</xsl:call-template>
							</input>
						</div>
						<div class="styLNDesc" style="width:178mm;height:auto;">
							For the tax year described in item 1, below, taxpayer claimed foreign tax credit on the accrual basis. Taxpayer is filing this Form 7204 to make 
							the election in Regulations section 1.905-1(d)(4) to claim a provisional foreign tax credit for the contested foreign income taxes described in 
							item 6.
						</div>
						<div class="styLNLeftNumBoxSD" style="height:auto;">
							<input type="checkbox" class="styCkboxNM" style="" alt="Claimed Foreign Tax Credit on Cash Basis">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$FormData/ClmForeignTaxCrCashBasisInd"/>
									<xsl:with-param name="BackupName">F7204ClmForeignTaxCrCashBasisInd</xsl:with-param>
								</xsl:call-template>
							</input>
						</div>
						<div class="styLNDesc" style="width:178mm;height:auto;">
							For the tax year described in item 1, below, taxpayer claims foreign tax credit on the cash basis. Taxpayer is filing this Form 7204 to make the 
							election in Regulations section 1.905-1(c)(3) to claim a provisional foreign tax credit for the contested foreign income taxes described in item 6.
						</div>
					</div>
					<div class="styStdDiv" style="font-family:Arial;margin-top:2mm;">
						<div class="styLNDesc" style="width:100%;float:none;padding-bottom:0px;">
							The taxpayer(s) listed above and the Commissioner of Internal Revenue, pursuant to Regulations sections 1.905-1(c)(3) and (d)(4), agree to the following:
						</div>
					</div>
					<!-- Line 1 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD">1</div>
						<div class="styLNDesc" style="width:178.5mm;height:auto;">
							The amount of any federal income tax due relating to the disallowance of a foreign tax credit claimed under section 901 or section 960 for the contested 
							foreign income tax liability described in item 6, below, on any income tax return made by or for the above taxpayer(s) for the tax year ended
							<span style="width:18mm;border-bottom:1px solid black;height:3.5mm;text-align:center;">
								<xsl:call-template name="PopulateMonthDayYear">
									<xsl:with-param name="TargetNode" select="$FormData/USTaxYearEndDt"/>
								</xsl:call-template>
							</span>
							and for any tax year affected by the contested foreign income tax liability (such as a carryforward year) may 
							be assessed at any time before the date that is three years from the later of the filing date or the due date (with extensions) of the return for the 
							taxable year in which the taxpayer notifies the Internal Revenue Service of the resolution of the contest pursuant to Regulations section 
							1.905-1(d)(4)(iv).
						</div>
					</div>
					<!-- Line 2 -->
					<div class="styStdDiv" style="margin-top:2mm;">
						<div class="styLNLeftNumBoxSD">2</div>
						<div class="styLNDesc" style="width:178.5mm;height:auto;">
							The taxpayer agrees to comply with the annual notice requirement described in Regulations section 1.905-1(d)(4)(iv).
						</div>
					</div>
					<!-- Line 3 -->
					<div class="styStdDiv" style="margin-top:2mm;">
						<div class="styLNLeftNumBoxSD">3</div>
						<div class="styLNDesc" style="width:178.5mm;height:auto;">
							This consent establishes an extended period for assessing tax. The expiration of the extended period may be suspended or otherwise affected 
							by the operation of law in the same manner as the original period. For example, if a notice of deficiency in tax covered by this consent is 
							issued, the period for assessing tax will not end prior to the end of the suspension period provided for by section 6503(a), plus any time that 
							remains in the assessment period, as extended, at the time the suspension takes effect. Under no circumstances will this consent reduce the 
							period of time otherwise provided by law for making an assessment.
						</div>
					</div>
					<!-- Line 4 -->
					<div class="styStdDiv" style="margin-top:2mm;">
						<div class="styLNLeftNumBoxSD">4</div>
						<div class="styLNDesc" style="width:178.5mm;height:auto;">
							The consenting taxpayer(s) may file a claim for credit or refund for the tax assessed by reason of this consent within the later of six months 
							after the period ends for assessing tax established by this consent or the period prescribed by section 6511(d)(3)(A).
						</div>
					</div>
					<!-- Line 5 -->
					<div class="styStdDiv" style="margin-top:2mm;">
						<div class="styLNLeftNumBoxSD">5</div>
						<div class="styLNDesc" style="width:178.5mm;height:auto;">
							The amount of any deficiency assessment covered by this consent will be limited to the amount of any federal income tax due relating to the 
							determination by the Commissioner of Internal Revenue that the contested foreign income tax liability described in item 6, below, was not a 
							compulsory payment and is not considered paid within the meaning of Regulations section 1.901-2(e)(5), including any penalties, additions to 
							tax, and interest attributable thereto, and consequential changes to other items based on that adjustment.
						</div>
					</div>
					<!-- Line 6 -->
					<div class="styStdDiv" style="margin-top:2mm;">
						<div class="styLNLeftNumBoxSD">6</div>
						<div class="styLNDesc" style="width:178.5mm;height:auto;">
							Complete the following information (see instructions):
						</div>
					</div>
					<!-- Line 6a -->
					<div class="styStdDiv">
						<div class="styLNLeftLtrBox" style="height:5mm;">a</div>
						<div class="styLNDesc" style="width:178.5mm;height:auto;font-family:Arial;font-size:8pt;">
							Description of the contest, the contested foreign income tax liability, and the income to which the contested foreign income tax liability relates:
						</div>
						<div class="styLNDesc" style="width:178.5mm;min-height:7mm;height:auto;border-bottom:1px dashed black;">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/ContestDesc"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 6b -->
					<div class="styStdDiv">
						<div class="styLNLeftLtrBox" style="height:5mm;">b</div>
						<div class="styLNDesc" style="width:25mm;">
							Name of payor: 
						</div>
						<div class="styLNDesc" style="width:153.5mm;min-height:4mm;height:auto;border-bottom:1px dashed black;">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/PayorName/BusinessNameLine1Txt"/>
							</xsl:call-template>
							<xsl:if test="$FormData/PayorName/BusinessNameLine2Txt">
								<br />
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$FormData/PayorName/BusinessNameLine2Txt"/>
								</xsl:call-template>
							</xsl:if>
						</div>
						<div class="styLNLeftLtrBox" style="height:5mm;">&nbsp;</div>
						<div class="styLNDesc" style="width:50mm;">
							Payor's EIN or reference ID number:
						</div>
						<div class="styLNDesc" style="width:128.5mm;min-height:4mm;height:auto;border-bottom:1px dashed black;text-align:center;">
							<xsl:choose>
								<xsl:when test="$FormData/ForeignEntityIdentificationGrp">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$FormData/ForeignEntityIdentificationGrp/ForeignEntityReferenceIdNum"/>
									</xsl:call-template>
								</xsl:when>
								<xsl:otherwise>
									<xsl:call-template name="PopulateEIN">
										<xsl:with-param name="TargetNode" select="$FormData/PayorEIN"/>
									</xsl:call-template>
								</xsl:otherwise>
							</xsl:choose>
						</div>
					</div>
					<!-- Line 6c -->
					<div class="styStdDiv" style="margin-top:1mm;">
						<div class="styLNLeftLtrBox" style="height:5mm;">c</div>
						<div class="styLNDesc" style="width:80mm;">
							Reference ID number for the contested foreign income tax:
						</div>
						<div class="styLNDesc" style="width:98.5mm;border-bottom:1px dashed black;text-align:center;">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/ContestedFrgnIncmTxRefIdNum"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 6d -->
					<div class="styStdDiv">
						<div class="styLNLeftLtrBox" style="height:5mm;">d</div>
						<div class="styLNDesc" style="width:105mm;">
							Country or U.S. territory to which tax was paid (enter code &mdash; see instructions):
						</div>
						<div class="styLNDesc" style="width:20.5mm;border-bottom:1px dashed black;text-align:center;">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/ForeignCountryOrUSPossessionCd"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 6e -->
					<div class="styStdDiv">
						<div class="styLNLeftLtrBox" style="">e</div>
						<div class="styLNDesc" style="width:147mm;">
							Amount of contested income tax liability remitted, in local currency, and date(s) of remittance(s) (mm/dd/yyyy):
						</div>
						<div class="styLNDesc" style="width:31.5mm;border-bottom:1px dashed black;">&nbsp;</div>
						<div class="styLNDesc" style="width:178.5mm;margin-left:8mm;border-bottom:1px dashed black;height:auto;min-height:4mm;padding-top:0px;">
							<xsl:for-each select="$FormData/ContestedFrgnIncmTaxLiabRmtGrp">
								<span style="margin-right:2mm;">
									[ <xsl:choose>
										<xsl:when test="ForeignRemittanceAmt">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="ForeignRemittanceAmt"/>
											</xsl:call-template>
										</xsl:when>
										<xsl:otherwise>
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="USRemittanceAmt"/>
											</xsl:call-template>
										</xsl:otherwise>
									</xsl:choose>, 
									<xsl:call-template name="PopulateMonthDayYear">
										<xsl:with-param name="TargetNode" select="RemittanceDt"/>
									</xsl:call-template> ]
								</span>
							</xsl:for-each>
						</div>
					</div>
					<!-- Signature section -->
					<div class="styStdDiv" style="border-top:1px solid black;margin-top:1.5mm;">
						<div class="styLNDesc" style="font-family:Arial;height:auto;width:100%;">
							Under penalties of perjury, I declare that I have examined this consent, including accompanying statements and schedules, and to the best of my knowledge and belief, it is 
							true, correct, and complete. A signed consent, properly completed in accordance with this form and its instructions, is deemed to have been executed by the Commissioner 
							of Internal Revenue.
						</div>
						<div class="styGenericDiv" style="width:120mm;height:8mm;margin-left:5mm;border-bottom:1px solid black;">&nbsp;</div>
						<div class="styGenericDiv" style="width:58mm;height:8mm;margin-left:1mm;border-bottom:1px solid black;">&nbsp;</div>
						<div class="styGenericDiv" style="width:120mm;margin-left:5mm;">
							Signature of consenting taxpayer (see instructions)
						</div>
						<div class="styGenericDiv" style="width:58mm;margin-left:1mm;">Date</div>
						<div class="styGenericDiv" style="width:120mm;height:8mm;margin-left:5mm;border-bottom:1px solid black;">&nbsp;</div>
						<div class="styGenericDiv" style="width:58mm;height:8mm;margin-left:1mm;border-bottom:1px solid black;">&nbsp;</div>
						<div class="styGenericDiv" style="width:120mm;margin-left:5mm;">
							Signature of spouse (complete only if a joint return is filed)
						</div>
						<div class="styGenericDiv" style="width:58mm;margin-left:1mm;">Date</div>
						<div class="styGenericDiv" style="width:120mm;height:8mm;margin-left:5mm;border-bottom:1px solid black;">
							<br />
							<xsl:call-template name="LinkToLeftoverCheckboxDataTableInline">
								<xsl:with-param name="TargetNode" select="$FormData/AttorneyOrAgentInd"/>
								<xsl:with-param name="Desc">Taxpayer's representative - Attorney or Agent</xsl:with-param>
							</xsl:call-template>
							<xsl:call-template name="LinkToLeftoverCheckboxDataTableInline">
								<xsl:with-param name="TargetNode" select="$FormData/TrusteeInd"/>
								<xsl:with-param name="Desc">Taxpayer's representative - Trustee</xsl:with-param>
							</xsl:call-template>
							<xsl:call-template name="LinkToLeftoverCheckboxDataTableInline">
								<xsl:with-param name="TargetNode" select="$FormData/ExecutorAdminOtherFiduciaryInd"/>
								<xsl:with-param name="Desc">Taxpayer's representative - Executor, Administrator, or other Fiduciary</xsl:with-param>
							</xsl:call-template>
						</div>
						<div class="styGenericDiv" style="width:58mm;height:8mm;margin-left:1mm;border-bottom:1px solid black;">&nbsp;</div>
						<div class="styGenericDiv" style="width:120mm;margin-left:5mm;">
							Taxpayer's representative sign here
						</div>
						<div class="styGenericDiv" style="width:58mm;margin-left:1mm;">Date</div>
						<div class="styGenericDiv" style="width:120mm;height:8mm;margin-left:5mm;border-bottom:1px solid black;">&nbsp;</div>
						<div class="styGenericDiv" style="width:58mm;height:8mm;margin-left:1mm;border-bottom:1px solid black;">&nbsp;</div>
						<div class="styGenericDiv" style="width:120mm;margin-left:5mm;">
							Corporate officer(s) sign here
						</div>
						<div class="styGenericDiv" style="width:58mm;margin-left:1mm;">Date</div>
					</div>
					
					<div class="styStdDiv pageEnd" style="border-top:1px solid black;">
						<span style="font-weight:bold;font-family:Arial;">For Paperwork Reduction Act Notice, see the instructions.</span>
						<span style="margin-left:20mm;">Cat. No. 56397G</span>
						<span style="float:right;">Form <strong>7204</strong> (12-2022)</span>
					</div>
					<!--end line 15-->
					<!-- Additonal Data Title Bar and Button -->
					<div class="styLeftOverTitleLine" id="LeftoverData">
						<div class="styLeftOverTitle">
						   Additional Data        
						</div>
						<div class="styLeftOverButtonContainer">
							<input class="styLeftoverTableBtn" type="button" TabIndex="-1" value="Return to Form" onclick="javascript:returnToWriteInImage();"/>
						</div>
					</div>
					<!-- Additional Data Table -->
					<table class="styLeftOverTbl">
						<xsl:call-template name="PopulateCommonLeftover">
							<xsl:with-param name="TargetNode" select="$FormData"/>
							<xsl:with-param name="DescWidth" select="100"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRowCheckbox">
							<xsl:with-param name="TargetNode" select="$FormData/AttorneyOrAgentInd"/>
							<xsl:with-param name="Desc">Taxpayer's representative - Attorney or Agent</xsl:with-param>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRowCheckbox">
							<xsl:with-param name="TargetNode" select="$FormData/TrusteeInd"/>
							<xsl:with-param name="Desc">Taxpayer's representative - Trustee</xsl:with-param>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRowCheckbox">
							<xsl:with-param name="TargetNode" select="$FormData/ExecutorAdminOtherFiduciaryInd"/>
							<xsl:with-param name="Desc">Taxpayer's representative - Executor, Administrator, or other Fiduciary</xsl:with-param>
						</xsl:call-template>
					</table>
					<br/>
					<!-- end Additional Data Page -->
				</form>
			</body>
		</html>
	</xsl:template>
</xsl:stylesheet>