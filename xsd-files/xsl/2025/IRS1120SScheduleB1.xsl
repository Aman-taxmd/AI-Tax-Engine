<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE xsl:stylesheet [
  <!ENTITY nbsp "&#160;">
  <!ENTITY ndash "&#8212;">
  <!ENTITY rsquo "&#8217;">
]>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:include href="PopulateTemplate.xsl" />
	<xsl:include href="AddHeader.xsl" />
	<xsl:include href="CommonPathRef.xsl" />
	<xsl:include href="AddOnTable.xsl" />
	<xsl:output method="html" indent="yes" />
	<xsl:strip-space elements="*" />
	<xsl:param name="FormData" select="$RtnDoc/IRS1120SScheduleB1" />
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
				<meta http-equiv="Content-Type" content="text/html; charset=ISO-1120SScheduleB1-1" />
				<meta name="Description" content="IRS Form 1120SScheduleB1" />
				<script language="JavaScript" src="{$ScriptPath}/FormDisplay.js" type="text/javascript" />
				<xsl:call-template name="InitJS" />
				<style type="text/css">
					<xsl:if test="not($Print) or $Print=''">
						<xsl:call-template name="AddOnStyle" />
					</xsl:if>
				</style>
				<xsl:call-template name="GlobalStylesForm" />
			</head>
			<body class="styBodyClass">
				<form id="Form1120SScheduleB1">
					<xsl:call-template name="DocumentHeader" />
					<!-- Header -->
					<div class="styStdDiv">
						<div class="styFNBox" style="width:30mm;height:18mm;">
							<span class="styFN" style="font-size:9pt;">SCHEDULE B-1 (Form 1120-S)</span> 
							<br />
							<span class="styAgency">
								(Rev. December 2020)
							</span>
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$FormData" />
							</xsl:call-template>
							<br />
							<span class="styAgency">
								Department of the Treasury <br />
								Internal Revenue Service
							</span>
						</div>
						<div class="styFTBox" style="width:125mm;height:18mm;">
							<span class="styFMT" style="font-size:11pt;padding-top:1mm;padding-bottom:1mm;">
							Information on Certain Shareholders of an S Corporation</span>
							<br />
							<br />
							<span style="font-weight:bold;">
								Attach to Form 1120-S.
							</span>
							<br/>
							<span style="font-weight:bold;">
								Go to
								<span style="font-style:italic">www.irs.gov/Form1120S</span>
								for the latest information.
							</span>
						</div>
						<div class="styTYBox" style="width:25mm;height:18mm;">
						<div class="styOMB" style="padding-top:8mm;height:auto;font-size:6pt;border-bottom-width:0px;">OMB No. 1545-0123</div>
						</div>
					</div>
					<!-- Filer information section -->
					<div class="styStdDiv" style="border-top:1px solid black;border-bottom:1px solid black;">
						<div class="styNameBox" style="width:130mm;">
							Name of corporation<br />
							<xsl:call-template name="PopulateReturnHeaderFiler">
								<xsl:with-param name="TargetNode">BusinessNameLine1Txt</xsl:with-param>
							</xsl:call-template><br/>
							<xsl:call-template name="PopulateReturnHeaderFiler">
								<xsl:with-param name="TargetNode">BusinessNameLine2Txt</xsl:with-param>
							</xsl:call-template>
						</div>
						<div class="styEINBox" style="width:40mm;padding-left:0mm;font-weight:normal;">
							<strong>Employer identification number</strong><br />
							<xsl:call-template name="PopulateReturnHeaderFilerTIN"/>
						</div>
					</div>
					<div class="styStdDiv" style="border-bottom:1px solid black;">
						<div class="styPartDesc" style="width:180mm;height:auto;font-weight:normal;padding-left:0px;">
							<strong>Information on Any Shareholder That Was a Disregarded Entity, a Trust, an Estate, or a Nominee or Similar Person at Any Time During the Tax Year  		</strong>(Form 1120-S, Schedule B, Question 3)
						</div>
						<div style="float:right;width:4mm;height:3mm;">
							<xsl:call-template name="SetDynamicTableToggleButton">
								<xsl:with-param name="TargetNode" select="$FormData/ShrRecEntTrEstNomneSmlrPrsnGrp"/>
								<xsl:with-param name="containerID" select=" 'Table' "/>
								<xsl:with-param name="headerHeight" select="2"/>
								<xsl:with-param name="containerHeight" select="23"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Table cols (a)-(d) -->
					<xsl:variable name="shouldSeparateP1" select="($Print = $Separated) and (count($FormData/ShrRecEntTrEstNomneSmlrPrsnGrp) &gt; 23)"/>
					<div class="styStdDiv" id="Table">
						<xsl:call-template name="SetInitialState"/>
						<table style="display:table;border-collapse:collapse;">
							<thead class="styTableThead">
								<tr>
									<th class="styTableCellHeader" scope="col" rowspan="2" style="width:60mm;font-weight:normal;">
										<strong>(a)</strong> <br />
										 Name of Shareholder of Record&ndash;Disregarded Entity, Trust, Estate, Nominee or Similar Person
									</th>
									<th class="styTableCellHeader" scope="col" rowspan="2" style="width:37mm;font-weight:normal;">
										<strong>(b)</strong> <br />
										Social Security Number (SSN) or Employer Identification Number (EIN) (if any) of Shareholder of Record
									</th>
									<th class="styTableCellHeader" scope="col" rowspan="2" style="width:27mm;font-weight:normal;">
										<strong>(c)</strong> <br /> 
										Type of Shareholder of Record
									</th>
									<th class="styTableCellHeader" scope="col" rowspan="2" style="width:58mm;font-weight:normal;border-right-width:0px;">
										<strong>(d)</strong><br /> 
										Name and SSN or EIN (if any) of Individual or Entity Responsible for Reporting Shareholder&rsquo;s Income, Deductions, Credits, etc., From Schedule K-1
									</th>
								</tr>
							</thead>
							<tbody style="font-size:6pt;">
								<xsl:if test="not($shouldSeparateP1)">
									<xsl:for-each select="$FormData/ShrRecEntTrEstNomneSmlrPrsnGrp">
										<tr style="height:7.5mm;vertical-align:bottom;">
											<!-- Column (a) -->
											<td class="styTableCellTextInherit">
												<xsl:choose>
													<xsl:when test="ShareholderBusinessName">
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="ShareholderBusinessName/BusinessNameLine1Txt"/>
														</xsl:call-template>
														<xsl:if test="ShareholderBusinessName/BusinessNameLine2Txt">
															<br/>
															<xsl:call-template name="PopulateText">
																<xsl:with-param name="TargetNode" select="ShareholderBusinessName/BusinessNameLine2Txt"/>
															</xsl:call-template>
														</xsl:if>
													</xsl:when>
													<xsl:otherwise>
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="ShareholderPersonNm"/>
														</xsl:call-template>
													</xsl:otherwise>
												</xsl:choose>
											</td>
											<!-- Column (b) -->
											<td class="styTableCellCtrInherit">
												<xsl:choose>
													<xsl:when test="ShareholderEIN">
														<xsl:call-template name="PopulateEIN">
															<xsl:with-param name="TargetNode" select="ShareholderEIN"/>
														</xsl:call-template>
													</xsl:when>
													<xsl:when test="ShareholderSSN">
														<xsl:call-template name="PopulateSSN">
															<xsl:with-param name="TargetNode" select="ShareholderSSN"/>
														</xsl:call-template>
													</xsl:when>
													<xsl:otherwise>
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="MissingSSNEINReasonCd"/>
														</xsl:call-template>
													</xsl:otherwise>
												</xsl:choose>
											</td>
											<!-- Column (c) -->
											<td class="styTableCellTextInherit">
												<xsl:choose>
													<xsl:when test="ShareholderTypeCd">
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="ShareholderTypeCd"/>
														</xsl:call-template>
													</xsl:when>
													<xsl:otherwise>
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="ShareholderTypeTxt"/>
														</xsl:call-template>
													</xsl:otherwise>
												</xsl:choose>
											</td>
											<!-- Column (d) -->
											<td class="styTableCellTextInherit" style="border-right-width:0px;">																					
												<xsl:choose>
													<xsl:when test="ResponsibleBusinessName">
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="ResponsibleBusinessName/BusinessNameLine1Txt"/>
														</xsl:call-template>
														<xsl:if test="ResponsibleBusinessName/BusinessNameLine2Txt">
															<br/>
															<xsl:call-template name="PopulateText">
																<xsl:with-param name="TargetNode" select="ResponsibleBusinessName/BusinessNameLine2Txt"/>
															</xsl:call-template>
														</xsl:if>
													</xsl:when>
													<xsl:otherwise>
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="ResponsibleIndividualNm"/>
														</xsl:call-template>
													</xsl:otherwise>
												</xsl:choose>
												<br/>
												<xsl:choose>
													<xsl:when test="ResponsibleBusinessEIN">
														<xsl:call-template name="PopulateEIN">
															<xsl:with-param name="TargetNode" select="ResponsibleBusinessEIN"/>
														</xsl:call-template>
													</xsl:when>
													<xsl:when test="ResponsibleIndividualSSN">
														<xsl:call-template name="PopulateSSN">
															<xsl:with-param name="TargetNode" select="ResponsibleIndividualSSN"/>
														</xsl:call-template>
													</xsl:when>
													<xsl:otherwise>
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="ResponsibleMissingSSNEINRsnCd"/>
														</xsl:call-template>
													</xsl:otherwise>
												</xsl:choose>
											</td>
										</tr>
									</xsl:for-each>
								</xsl:if>
								<xsl:if test="$shouldSeparateP1 or count($FormData/ShrRecEntTrEstNomneSmlrPrsnGrp) &lt; 23">
									<xsl:call-template name="FillTable4Cols">
										<xsl:with-param name="LineNumber" select="1 + count($FormData/ShrRecEntTrEstNomneSmlrPrsnGrp)"/>
										<xsl:with-param name="SepMessage" select="$shouldSeparateP1"/>
									</xsl:call-template>
								</xsl:if>
							</tbody>
						</table>
					</div>
					<xsl:if test="not($shouldSeparateP1)">
						<xsl:call-template name="SetInitialDynamicTableHeight">
							<xsl:with-param name="TargetNode" select="$FormData/ShrRecEntTrEstNomneSmlrPrsnGrp"/>
							<xsl:with-param name="containerID" select=" 'Table' "/>
							<xsl:with-param name="headerHeight" select="2"/>
							<xsl:with-param name="containerHeight" select="23"/>
						</xsl:call-template>
					</xsl:if>
					<!-- Page footer-->
					<div class="styStdDiv pageEnd" style="border-top:1px solid black;">
						<span style="font-weight:bold;font-family:Arial;">For Paperwork Reduction Act Notice, see the Instructions for Form 1120-S.</span>
						<span style="margin-left:10mm;">Cat. No. 60837X</span>
						<span style="float:right;"><strong>Schedule B-1 (Form 1120-S) (Rev. 12-2020)</strong></span>
					</div>
					
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
					</table>
					<!-- separated table -->
					<xsl:if test="$shouldSeparateP1">
						<br/>
						<br/>
						<span class="styRepeatingDataTitle"> </span>
						<table class="styDepTbl" cellspacing="0" style="font-size:7pt;">
							<thead class="styTableThead">
								<tr class="styDepTblHdr">
									<th class="styTableCellHeader" scope="col" rowspan="2" style="width:50mm;font-weight:normal;">
										<strong>(a)</strong> <br />
										 Name of Shareholder of Record&ndash;Disregarded Entity, Trust, Estate, Nominee or Similar Person
									</th>
									<th class="styTableCellHeader" scope="col" rowspan="2" style="width:30mm;font-weight:normal;">
										<strong>(b)</strong> <br />
										Social Security Number (SSN) or Employer Identification Number (EIN) (if any) of Shareholder of Record
									</th>
									<th class="styTableCellHeader" scope="col" rowspan="2" style="width:30mm;font-weight:normal;">
										<strong>(c)</strong> <br /> 
										Type of Shareholder of Record
									</th>
									<th class="styTableCellHeader" scope="col" rowspan="2" style="width:45mm;font-weight:normal;border-right-width:0px;">
										<strong>(d)</strong><br /> 
										Name and SSN or EIN (if any) of Individual or Entity Responsible for Reporting Shareholder&rsquo;s Income, Deductions, Credits, etc., From Schedule K-1
									</th>
								</tr>
							</thead>
							<tbody>
								<xsl:for-each select="$FormData/ShrRecEntTrEstNomneSmlrPrsnGrp">
									<tr style="height:7.5mm;vertical-align:bottom;">
										<xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
										<!-- Column (a) -->
										<td class="styTableCellTextInherit">
											<xsl:choose>
												<xsl:when test="ShareholderBusinessName">
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="ShareholderBusinessName/BusinessNameLine1Txt"/>
													</xsl:call-template>
													<xsl:if test="ShareholderBusinessName/BusinessNameLine2Txt">
														<br/>
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="ShareholderBusinessName/BusinessNameLine2Txt"/>
														</xsl:call-template>
													</xsl:if>
												</xsl:when>
												<xsl:otherwise>
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="ShareholderPersonNm"/>
													</xsl:call-template>
												</xsl:otherwise>
											</xsl:choose>
										</td>
										<!-- Column (b) -->
										<td class="styTableCellCtrInherit">
											<xsl:choose>
												<xsl:when test="ShareholderEIN">
													<xsl:call-template name="PopulateEIN">
														<xsl:with-param name="TargetNode" select="ShareholderEIN"/>
													</xsl:call-template>
												</xsl:when>
												<xsl:when test="ShareholderSSN">
													<xsl:call-template name="PopulateSSN">
														<xsl:with-param name="TargetNode" select="ShareholderSSN"/>
													</xsl:call-template>
												</xsl:when>
												<xsl:otherwise>
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="MissingSSNEINReasonCd"/>
													</xsl:call-template>
												</xsl:otherwise>
											</xsl:choose>
										</td>
										<!-- Column (c) -->
										<td class="styTableCellTextInherit">
											<xsl:choose>
												<xsl:when test="ShareholderTypeCd">
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="ShareholderTypeCd"/>
													</xsl:call-template>
												</xsl:when>
												<xsl:otherwise>
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="ShareholderTypeTxt"/>
													</xsl:call-template>
												</xsl:otherwise>
											</xsl:choose>
										</td>
										<!-- Column (d) -->
										<td class="styTableCellTextInherit" style="border-right-width:0px;">																					
											<xsl:choose>
												<xsl:when test="ResponsibleBusinessName">
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="ResponsibleBusinessName/BusinessNameLine1Txt"/>
													</xsl:call-template>
													<xsl:if test="ResponsibleBusinessName/BusinessNameLine2Txt">
														<br/>
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="ResponsibleBusinessName/BusinessNameLine2Txt"/>
														</xsl:call-template>
													</xsl:if>
												</xsl:when>
												<xsl:otherwise>
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="ResponsibleIndividualNm"/>
													</xsl:call-template>
												</xsl:otherwise>
											</xsl:choose>
											<br/>
											<xsl:choose>
												<xsl:when test="ResponsibleBusinessEIN">
													<xsl:call-template name="PopulateEIN">
														<xsl:with-param name="TargetNode" select="ResponsibleBusinessEIN"/>
													</xsl:call-template>
												</xsl:when>
												<xsl:when test="ResponsibleIndividualSSN">
													<xsl:call-template name="PopulateSSN">
														<xsl:with-param name="TargetNode" select="ResponsibleIndividualSSN"/>
													</xsl:call-template>
												</xsl:when>
												<xsl:otherwise>
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="ResponsibleMissingSSNEINRsnCd"/>
													</xsl:call-template>
												</xsl:otherwise>
											</xsl:choose>
										</td>
									</tr>
								</xsl:for-each>
							</tbody>
						</table>
					</xsl:if>
					<br/>
				</form>
			</body>
		</html>
	</xsl:template>
	<xsl:template name="FillTable4Cols">
		<xsl:param name="LineNumber"/>
		<xsl:param name="SepMessage" select="false()"/>
		<xsl:param name="MaxLine" select="23"/>
		<tr style="height:7mm;vertical-align:bottom;">
			<td class="styTableCellCtrInherit">
				<xsl:choose>
				<xsl:when test="$SepMessage">
                    See Additional <br /> Data Table
				</xsl:when>
				<xsl:otherwise>&nbsp;</xsl:otherwise>
				</xsl:choose>
			</td>
			<td class="styTableCellCtrInherit">&nbsp;</td>
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
</xsl:stylesheet>