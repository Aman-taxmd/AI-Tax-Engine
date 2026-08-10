<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE xsl:stylesheet [
	<!ENTITY nbsp "&#160;"> 
	<!ENTITY mdash "&#8212;"> 
]>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:include href="PopulateTemplate.xsl"/>
	<xsl:include href="AddHeader.xsl"/>
	<xsl:include href="CommonPathRef.xsl"/>
	<xsl:include href="AddOnTable.xsl"/>
	<xsl:include href="IRS4626ScheduleAStyle.xsl"/>
	<xsl:output method="html" indent="yes"/>
	<xsl:strip-space elements="*"/>
	<xsl:param name="FormData" select="$RtnDoc/IRS4626ScheduleA"/>
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
				<meta name="Description" content="IRS Form 4626 Schedule A"/>
				<script language="JavaScript" src="{$ScriptPath}/FormDisplay.js" type="text/javascript"/>
				<xsl:call-template name="InitJS"/>
				<style type="text/css">
					<xsl:if test="not($Print) or $Print=''">
						<xsl:call-template name="IRS4626ScheduleAStyle"/>
						<xsl:call-template name="AddOnStyle"/>
					</xsl:if>
				</style>
				<xsl:call-template name="GlobalStylesForm"/>
			</head>
			<body class="styBodyClass">
				<form id="Form4626ScheduleA">
					<xsl:call-template name="DocumentHeaderLandscape"/>
					<!-- Page 1 -->
					<!-- Header -->
					<div class="styStdDivLS" style="height:19mm;">
						<div class="styFNBox" style="width:50mm;height:19mm;padding-top:1mm;">
							<strong>SCHEDULE A <br/> (Form 4626) </strong>
							<br/>
							<span class="styAgency" style="padding-top:1.5mm;">
								December 2024
							</span>
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$FormData"/>
							</xsl:call-template>
							<br/>
							<span class="styAgency" style="padding-top:1.5mm;">
								Department of the Treasury <br/>
								Internal Revenue Service
							</span>
						</div>
						<div class="styFTBox" style="width:160mm;">
							<span class="styFMT" style="font-size:9pt;padding-top:1mm;padding-bottom:1mm;">
							Pro-Rata Share of Adjusted Net Income or Loss of CFCs<br/> Described in Section 56A(c)(3)
							</span>
							<br/>
							<span style="font-weight:bold;">
								Attach to Form 4626.
							</span>
							<br/>
							<span style="font-weight:bold;padding-top:1mm;">
								Go to
								<span style="font-style:italic">www.irs.gov/Form4626</span>
								for instructions and the latest information.
							</span>
						</div>
						<div class="styTYBox" style="width:46mm;height:auto;">
							<div class="styOMB" style="padding-top:2.5mm;height:9mm;">OMB No. 1545-0123</div>
							<div class="styOMB" style="padding-top:0.5mm;height:10mm;border-bottom-width: 0px;">For tax year ended<br/>
								<span style="width:30mm;border-bottom:1px solid black;">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$FormData/TaxYearEndDt"/>
									</xsl:call-template>
								</span>
							</div>
						</div>
					</div>
					<!-- Filer information section -->
					<div class="styStdDivLS" style="border-top:1px solid black;">
						<div class="styNameBox" style="width:176mm;font-size:7pt;">
							Name of corporation<br/>
							<xsl:call-template name="PopulateReturnHeaderFiler">
								<xsl:with-param name="TargetNode">BusinessNameLine1Txt</xsl:with-param>
							</xsl:call-template>
							<br/>
							<xsl:call-template name="PopulateReturnHeaderFiler">
								<xsl:with-param name="TargetNode">BusinessNameLine2Txt</xsl:with-param>
							</xsl:call-template>
						</div>
						<div class="styEINBox" style="width:80mm;padding-left:0.5mm;font-weight:normal;border-left-width:0px;font-size:7pt;">
							<strong>Employer identification number (EIN)</strong>
							<br/>
							<span style="font-weight:normal;padding-top:3mm;">
								<xsl:call-template name="PopulateReturnHeaderFilerTIN"/>
							</span>
						</div>
					</div>
					<!-- Part 1 -->
					<!-- Table 1, cols (a)-(i) -->
					<xsl:variable name="shouldSeparateP1" select="($Print = $Separated) and (count($FormData/ProRataShrAdjNetIncmLossCFCGrp) &gt; 30)"/>
					<div class="styTableContainerLandscapeNBB" style="" id="Part1Table">
						<xsl:call-template name="SetInitialState"/>
						<table class="styTable" style="font-size:7pt;border-collapse:collapse;">
							<thead class="styTableThead">
								<tr style="border-top:1px solid black;vertical-align:top;">
									<th class="styTableCellHeader" scope="col" style="width:5mm;font-weight:normal;border-bottom-width:0px;border-left-width:0px;">&nbsp;</th>
									<th class="styTableCellHeader" scope="col" style="width:75mm;font-weight:normal;">
										<strong>(a)</strong>
										<br/> Name of controlled foreign corporation<br/>(CFC)
									</th>
									<th class="styTableCellHeader" scope="col" style="width:19mm;font-weight:normal;">
										<strong>(b)</strong>
										<br/> EIN or reference ID number of the CFC
									</th>
									<th class="styTableCellHeader" scope="col" style="width:19mm;font-weight:normal;">
										<strong>(c)</strong>
										<br/> Country of incorporation (enter country code)
									</th>
									<th class="styTableCellHeader" scope="col" style="width:25mm;font-weight:normal;">
										<strong>(d)</strong>
										<br/> CFC current year net income or (loss) (in U.S. dollars)
									</th>
									<th class="styTableCellHeader" scope="col" style="width:25mm;font-weight:normal;">
										<strong>(e)</strong>
										<br/> Section 56A(c)(3) adjustments (in U.S. dollars)
									</th>
									<th class="styTableCellHeader" scope="col" style="width:25mm;font-weight:normal;">
										<strong>(f)</strong>
										<br/> Combine column (d) and column (e)
									</th>
									<th class="styTableCellHeader" scope="col" style="width:14mm;font-weight:normal;">
										<strong>(g)</strong>
										<br/> Reserved for future use 
									</th>
									<th class="styTableCellHeader" scope="col" style="width:14mm;font-weight:normal;">
										<strong>(h)</strong>
										<br/> Reserved for future use 
									</th>
									<th class="styTableCellHeader" scope="col" style="width:35mm;font-weight:normal;border-right-width:0px;">
										<strong>(i)</strong>
										<br/> Pro-rata share of adjusted net income or (loss) of the CFC, described in section 56A(c)(3) (in U.S. dollars)
									</th>
								</tr>
							</thead>
							<tbody>
								<xsl:if test="not($shouldSeparateP1)">
									<xsl:for-each select="$FormData/ProRataShrAdjNetIncmLossCFCGrp">
										<tr style="vertical-align:bottom;">
											<td class="styTableCellCtrInherit" style="font-weight:bold;border-bottom-width:0px;">
												<xsl:number value="position()" format="1"/>
											</td>
											<td class="styTableCellTextInherit">
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
															<xsl:with-param name="Desc">Column (b), Row <xsl:value-of select="position()"/> - Foreign Entity Identification Groups</xsl:with-param>
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
											<td class="styTableCellCtrInherit">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="CountryCd"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellAmtInherit">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="CFCNetIncomeOrLossAmt"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellAmtInherit">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="Section56Ac3AdjustmentsAmt"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellAmtInherit">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="CFCNetIncomeOrLossAdjAmt"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellAmtInherit" style="background-color:lightgrey;">
												&nbsp;
											</td>
											<td class="styTableCellAmtInherit" style="background-color:lightgrey;">
												&nbsp;
											</td>
											<td class="styTableCellAmtInherit" style="border-right-width:0px;">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="ProRataShrIncmCFCUSShrAmt"/>
												</xsl:call-template>
											</td>
										</tr>
									</xsl:for-each>
								</xsl:if>
								<xsl:if test="$shouldSeparateP1 or count($FormData/ProRataShrAdjNetIncmLossCFCGrp) &lt; 30">
									<xsl:call-template name="FillTable10Cols">
										<xsl:with-param name="LineNumber" select="1 + count($FormData/ProRataShrAdjNetIncmLossCFCGrp)"/>
										<xsl:with-param name="End" select="30"/>
										<xsl:with-param name="SepMessage" select="$shouldSeparateP1"/>
									</xsl:call-template>
								</xsl:if>
							</tbody>
						</table>
					</div>
					<!--<xsl:if test="not($shouldSeparateP1)">
						<xsl:call-template name="SetInitialDynamicTableHeight">
							<xsl:with-param name="TargetNode" select="$FormData/ProRataShrAdjNetIncmLossCFCGrp"/>
							<xsl:with-param name="containerID" select=" 'Part1Table' "/>
							<xsl:with-param name="headerHeight" select="2"/>
							<xsl:with-param name="containerHeight" select="30"/>
						</xsl:call-template>
					</xsl:if>-->
					<!-- Table 1 Total -->
					<div class="styStdDivLS">
						<div class="styLNLeftNumBoxSD" style="width:5mm;padding-left:0mm;text-align:center;">31</div>
						<div class="styLNDesc" style="width:75mm;">
							Total
						<span class="sty4626ADotLn">................</span>
						</div>
						<div class="styLNAmountBoxNBB" style="width:19mm;background-color:lightgrey;">&nbsp;</div>
						<div class="styLNAmountBoxNBB" style="width:19mm;background-color:lightgrey;">&nbsp;</div>
						<div class="styLNAmountBoxNBB" style="width:25mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TotCFCNetIncomeOrLossAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNAmountBoxNBB" style="width:25mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TotSection56Ac3AdjustmentsAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNAmountBoxNBB" style="width:25mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TotCFCNetIncomeOrLossAdjAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNAmountBoxNBB" style="width:14mm;background-color:lightgrey;">&nbsp;</div>
						<div class="styLNAmountBoxNBB" style="width:14mm;background-color:lightgrey;">&nbsp;</div>
						<div class="styLNAmountBoxNBB" style="width:35mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TotProRataShrIncmCFCUSShrAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Form footer-->
					<div class="styStdDivLS pageEnd" style="border-top:1px solid black;">
						<span style="font-weight:bold;font-family:Arial;">For Privacy Act and Paperwork Reduction Act Notice, see the Instructions for Form 4626.</span>
						<span style="margin-left:35mm;">Cat. No. 94588N</span>
						<span style="float:right;">
							<strong>Schedule A (Form 4626)</strong> (12-2024)</span>
					</div>
					<!-- Page end -->
					<!-- Additonal Data Title Bar and Button -->
					<div class="styLeftOverTitleLineLandscape" id="">
						<div class="styLeftOverTitle">
						   Additional Data        
						</div>
						<div class="styLeftOverButtonContainerLandscape">
							<input class="styLeftoverTableBtn" type="button" TabIndex="-1" value="Return to Form" onclick="javascript:returnToWriteInImage();"/>
						</div>
					</div>
					<!-- Additional Data Table -->
					<table class="styLeftOverTblLandscape">
						<xsl:call-template name="PopulateCommonLeftover">
							<xsl:with-param name="TargetNode" select="$FormData"/>
							<xsl:with-param name="DescWidth" select="100"/>
						</xsl:call-template>
					</table>
					<!-- Part 1 separated table -->
					<xsl:if test="$shouldSeparateP1">
						<br/>
						<br/>
						<span class="styRepeatingDataTitle"/>
						<table class="styDepTblLandscape" style="font-size:7pt;">
							<thead class="styTableThead">
								<tr class="styDepTblHdr">
									<th class="styDepTblCell" scope="col" style="width:5mm;font-weight:normal;border-bottom-width:0px;border-left-width:0px;">&nbsp;</th>
									<th class="styDepTblCell" scope="col" style="width:75mm;font-weight:normal;">
										<strong>(a)</strong>
										<br/> Name of controlled foreign corporation<br/>(CFC)
									</th>
									<th class="styDepTblCell" scope="col" style="width:19mm;font-weight:normal;">
										<strong>(b)</strong>
										<br/> EIN or reference ID number of the CFC
									</th>
									<th class="styDepTblCell" scope="col" style="width:19mm;font-weight:normal;">
										<strong>(c)</strong>
										<br/> Country of incorporation (enter country code)
									</th>
									<th class="styDepTblCell" scope="col" style="width:25mm;font-weight:normal;">
										<strong>(d)</strong>
										<br/> CFC current year net income or (loss) (in U.S. dollars)
									</th>
									<th class="styDepTblCell" scope="col" style="width:25mm;font-weight:normal;">
										<strong>(e)</strong>
										<br/> Section 56A(c)(3) adjustments (in U.S. dollars)
									</th>
									<th class="styDepTblCell" scope="col" style="width:25mm;font-weight:normal;">
										<strong>(f)</strong>
										<br/> Combine column (d) and column (e)
									</th>
									<th class="styDepTblCell" scope="col" style="width:14mm;font-weight:normal;">
										<strong>(g)</strong>
										<br/> Reserved for future use 
									</th>
									<th class="styDepTblCell" scope="col" style="width:14mm;font-weight:normal;">
										<strong>(h)</strong>
										<br/> Reserved for future use 
									</th>
									<th class="styDepTblCell" scope="col" style="width:35mm;font-weight:normal;border-right-width:0px;">
										<strong>(i)</strong>
										<br/> Pro-rata share of adjusted net income or (loss) of the CFC, described in section 56A(c)(3) (in U.S. dollars)
									</th>
								</tr>
							</thead>
							<tbody>
								<xsl:for-each select="$FormData/ProRataShrAdjNetIncmLossCFCGrp">
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
										<td class="styTableCellTextInherit">
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
										<td class="styTableCellCtrInherit">
											<xsl:choose>
												<xsl:when test="count(ForeignEntityIdentificationGrp) &gt; 1">
													<xsl:call-template name="LinkToLeftoverDataTableInline">
														<xsl:with-param name="TargetNode" select="ForeignEntityIdentificationGrp"/>
														<xsl:with-param name="Desc">Column (b), Row <xsl:value-of select="position()"/> - Foreign Entity Identification Groups</xsl:with-param>
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
										<td class="styTableCellCtrInherit">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="CountryCd"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellAmtInherit">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="CFCNetIncomeOrLossAmt"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellAmtInherit">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="Section56Ac3AdjustmentsAmt"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellAmtInherit">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="CFCNetIncomeOrLossAdjAmt"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellAmtInherit" style="background-color:lightgrey;">
												&nbsp;
											</td>
										<td class="styTableCellAmtInherit" style="background-color:lightgrey;">
												&nbsp;
											</td>
										<td class="styTableCellAmtInherit" style="border-right-width:0px;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="ProRataShrIncmCFCUSShrAmt"/>
											</xsl:call-template>
										</td>
									</tr>
								</xsl:for-each>
							</tbody>
						</table>
					</xsl:if>
					<!-- Reference ID Number -->
					<xsl:for-each select="$FormData/ProRataShrAdjNetIncmLossCFCGrp">
						<xsl:if test="(count(ForeignEntityIdentificationGrp) &gt; 1)">
							<br/>
							<br/>
							<span class="styRepeatingDataTitle">Column (b), Row <xsl:value-of select="position()"/>
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
				</form>
			</body>
		</html>
	</xsl:template>
	<xsl:template name="FillTable10Cols">
		<xsl:param name="LineNumber"/>
		<xsl:param name="SepMessage" select="false()"/>
		<xsl:param name="MaxLine" select="30"/>
		<tr>
			<td class="styTableCellCtrInherit" style="font-weight:bold;border-bottom-width:0mm;">
				<xsl:choose>
					<xsl:when test="$SepMessage">1</xsl:when>
					<xsl:otherwise>
						<xsl:value-of select="$LineNumber"/>
					</xsl:otherwise>
				</xsl:choose>
			</td>
			<td class="styTableCellCtrInherit">
				<xsl:choose>
					<xsl:when test="$SepMessage">
                    See Additional <br/> Data Table
				</xsl:when>
					<xsl:otherwise>&nbsp;</xsl:otherwise>
				</xsl:choose>
			</td>
			<td class="styTableCellCtrInherit">&nbsp;</td>
			<td class="styTableCellAmtInherit">&nbsp;</td>
			<td class="styTableCellAmtInherit">&nbsp;</td>
			<td class="styTableCellAmtInherit">&nbsp;</td>
			<td class="styTableCellAmtInherit">&nbsp;</td>
			<td class="styTableCellAmtInherit" style="background-color:lightgrey;">&nbsp;</td>
			<td class="styTableCellAmtInherit" style="background-color:lightgrey;">&nbsp;</td>
			<td class="styTableCellAmtInherit" style="border-right-width:0px;">&nbsp;</td>
		</tr>
		<xsl:choose>
			<xsl:when test="$SepMessage">
				<xsl:call-template name="FillTable10Cols">
					<xsl:with-param name="LineNumber" select="2"/>
					<xsl:with-param name="SepMessage" select="false()"/>
				</xsl:call-template>
			</xsl:when>
			<xsl:when test="$LineNumber &lt; $MaxLine">
				<xsl:call-template name="FillTable10Cols">
					<xsl:with-param name="LineNumber" select="$LineNumber + 1"/>
					<xsl:with-param name="MaxLine" select="$MaxLine"/>
				</xsl:call-template>
			</xsl:when>
			<xsl:otherwise/>
		</xsl:choose>
	</xsl:template>
</xsl:stylesheet>