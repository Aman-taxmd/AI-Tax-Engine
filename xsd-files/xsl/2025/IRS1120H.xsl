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
	<xsl:include href="IRS1120HStyle.xsl"/>
	<xsl:output method="html" indent="yes"/>
	<xsl:strip-space elements="*"/>
	<xsl:param name="FormData" select="$RtnDoc/IRS1120H"/>
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
				<meta name="Description" content="IRS Form 1120-H"/>
				<!-- javascript include -->
				<script language="JavaScript" src="{$ScriptPath}/FormDisplay.js" type="text/javascript"/>
				<xsl:call-template name="InitJS"/>
				<style type="text/css">
					<xsl:if test="not($Print) or $Print=''">
						<xsl:call-template name="IRS1120HStyle"/>
						<xsl:call-template name="AddOnStyle"/>
					</xsl:if>
				</style>
				<xsl:call-template name="GlobalStylesForm"/>
			</head>
			<body class="styBodyClass" style="width:187mm;">
				<xsl:call-template name="DocumentHeader"/>
				<!-- BEGIN FORM HEADER -->
				<div class="styStdDiv">
					<div class="styFNBox" style="width:30mm;height:17mm;">
						Form <span class="styFormNumber" style="font-size:18pt;">1120-H</span><br />
						<xsl:call-template name="SetFormLinkInline">
							<xsl:with-param name="TargetNode" select="$FormData"/>
						</xsl:call-template><br />
						<span class="styAgency">Department of the Treasury</span>
						<span class="styAgency">Internal Revenue Service</span>
					</div>
					<div class="styFTBox" style="width:124mm;height:17mm;padding-top:0.5mm;">
						<span class="styMainTitle">U.S. Income Tax Return <br /> for Homeowners Associations</span>
						<div class="styFST" style="padding-top:2mm;">
							Go to <span style="font-style:italic;">www.irs.gov/Form1120H</span> for instructions and the latest information.
						</div>
					</div>
					<div class="styTYBox" style="width:32mm;height:17mm;">
						<div class="styOMB" style="width:32mm;">OMB No. 1545-0123</div>
						<div class="styTaxYear" style="text-align:center;padding-top:1mm;">
							20<span class="styTYColor">25</span>
						</div>
					</div>
				</div>
				<div class="styStdDiv styLNDesc" style="width:187mm;border-top:1px solid black;padding:1px;">
					For calendar year 2025 or tax year beginning 
					<span style="width:50mm;text-align:center;">
						<xsl:call-template name="PopulateReturnHeaderTaxPeriodBeginDate"/>
					</span>
					and ending 
					<span style="width:50mm;text-align:center;">
						<xsl:call-template name="PopulateReturnHeaderTaxPeriodEndDate"/>
					</span>
				</div>
				<div class="styStdDiv">
					<div class="styGenericDiv" style="width:145mm;height:auto;border-top:2px solid black;border-bottom:2px solid black;border-right:2px solid black;">
						<div class="styGenericDiv" style="width:40mm;height:auto;font-weight:bold;font-size:8pt;padding-left:2px;padding-top:1mm;">
							<!--TYPE OR PRINT-->
							<div class="styLNDesc" style="height:auto;width:40mm">
							Check if: <br/>
							<span style="width:1mm;"/> (1) 
							<input type="checkbox" class="styCkboxNM" style="margin-left:2px;" aria-label="Final Return">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$FormData/FinalReturnInd"/>
									<xsl:with-param name="BackupName">F1120HFinalReturnInd</xsl:with-param>
								</xsl:call-template>
							</input>
							Final return <br/>
							<span style="width:1mm;"/> (2) 
							<input type="checkbox" class="styCkboxNM" style="margin-left:2px;" aria-label="Name change">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$FormData/NameChangeInd"/>
									<xsl:with-param name="BackupName">F1120HNameChangeInd</xsl:with-param>
								</xsl:call-template>
							</input>
							Name change <br/>
							<span style="width:1mm;"/> (3) 
							<input type="checkbox" class="styCkboxNM" style="margin-left:2px;" aria-label="Address change">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$FormData/AddressChangeInd"/>
									<xsl:with-param name="BackupName">F1120HAddressChangeInd</xsl:with-param>
								</xsl:call-template>
							</input>
							Address change <br/>
							<span style="width:1mm;"/> (4) 
							<input type="checkbox" class="styCkboxNM" style="margin-left:2px;" aria-label="Amended Return">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$FormData/AmendedReturnInd"/>
									<xsl:with-param name="BackupName">F1120HAmendedReturnInd</xsl:with-param>
								</xsl:call-template>
							</input>
							Amended return
						</div>	
					</div>
						<div style="width:103mm;height:auto;border-left:2px solid black;">
							<div class="styGenericDiv" style="width:103mm;padding-left:3px;">
								Name <br />
								<xsl:call-template name="PopulateReturnHeaderFiler">
									<xsl:with-param name="TargetNode">BusinessNameLine1Txt</xsl:with-param>
								</xsl:call-template>
								<xsl:if test="$RtnHdrData/Filer//AddressLine2Txt">
									<br/>
									<xsl:call-template name="PopulateReturnHeaderFiler">
										<xsl:with-param name="TargetNode">BusinessNameLine2Txt</xsl:with-param>
									</xsl:call-template>
								</xsl:if>
							</div>
							<div style="width:103mm;">
								<div class="styGenericDiv" style="width:73mm;padding-left:3px;border-top:1px solid black;">
									Number and street. If a P.O. box, see instructions.<br />
									<xsl:call-template name="PopulateReturnHeaderFiler">
										<xsl:with-param name="TargetNode">AddressLine1Txt</xsl:with-param>
									</xsl:call-template>
									<xsl:if test="$RtnHdrData/Filer//AddressLine2Txt">
										<br />
										<xsl:call-template name="PopulateReturnHeaderFiler">
											<xsl:with-param name="TargetNode">AddressLine2Txt</xsl:with-param>
										</xsl:call-template>
									</xsl:if>
								</div>
								<div class="styGenericDiv" style="width:30mm;padding-left:3px;border-top:1px solid black;border-left:1px solid black;">
									Room or suite number<br />
									<xsl:call-template name="PopulateReturnHeaderFiler">
										<xsl:with-param name="TargetNode">AddressLine2Txt</xsl:with-param>
									</xsl:call-template>
								</div>

							</div>
							<div style="width:103mm;height:auto;">
								<div class="styGenericDiv" style="width:27mm;padding-left:3px;border-top:1px solid black;">
									City or town<br />
									<xsl:call-template name="PopulateReturnHeaderFiler">
										<xsl:with-param name="TargetNode">CityNm</xsl:with-param>
									</xsl:call-template>
								</div>
								<div class="styGenericDiv" style="width:25mm;padding-left:3px;border-top:1px solid black;border-left:1px solid black;">
									State or province<br />
									<xsl:call-template name="PopulateReturnHeaderFiler">
										<xsl:with-param name="TargetNode">StateAbbreviationCd</xsl:with-param>
									</xsl:call-template>
								</div>
								<div class="styGenericDiv" style="width:13mm;padding-left:3px;border-top:1px solid black;border-left:1px solid black;">
									Country<br />
									<xsl:call-template name="PopulateReturnHeaderFiler">
										<xsl:with-param name="TargetNode">CountryCd</xsl:with-param>
									</xsl:call-template>
								</div>
								<div class="styGenericDiv" style="width:38mm;padding-left:3px;border-top:1px solid black;border-left:1px solid black;">
									ZIP or foreign postal code <br />
									<xsl:call-template name="PopulateReturnHeaderFiler">
										<xsl:with-param name="TargetNode">ZIPCd</xsl:with-param>
									</xsl:call-template>
<!--									<xsl:if test="$RtnHdrData/Filer//ForeignAddress">
										<span style="width:7px;"/>
										<xsl:call-template name="PopulateReturnHeaderFiler">
											<xsl:with-param name="TargetNode">CountryCd</xsl:with-param>
											<xsl:with-param name="MainForm" select="true()"/>
										</xsl:call-template>
									</xsl:if>-->
								</div>
						</div>
						</div>
					</div>
					<div class="styGenericDiv" style="width:41.5mm;height:auto;padding-left:3px;border-top:1px solid black;">
						<span style="font-weight:bold;font-size:6pt;">Employer identification number</span> <br />
						<xsl:call-template name="PopulateReturnHeaderFilerTIN">
							<xsl:with-param name="EINChanged" select="true()"/>
						</xsl:call-template>
					</div>
					<div class="styGenericDiv" style="width:41.5mm;height:auto;padding-left:3px;border-top:1px solid black;">
						Date association formed <br />
						<xsl:call-template name="PopulateMonthDayYear">
							<xsl:with-param name="TargetNode" select="$FormData/AssociationFormedDt"/>
						</xsl:call-template>
					</div>
				</div>
				<!-- Form body -->
<!--				<div class="styStdDiv" style="border-top:1px solid black;">
					<div class="styLNDesc" style="height:auto;width:100%;">
						Check if: <span style="width:4mm;"/> (1) 
						<input type="checkbox" class="styCkboxNM" style="margin-left:2px;" alt="Final Return">
							<xsl:call-template name="PopulateCheckbox">
								<xsl:with-param name="TargetNode" select="$FormData/FinalReturnInd"/>
								<xsl:with-param name="BackupName">F1120HFinalReturnInd</xsl:with-param>
							</xsl:call-template>
						</input>
						Final return </br>
						<span style="width:14mm;"/> (2) 
						<input type="checkbox" class="styCkboxNM" style="margin-left:2px;" alt="Name Change">
							<xsl:call-template name="PopulateCheckbox">
								<xsl:with-param name="TargetNode" select="$FormData/NameChangeInd"/>
								<xsl:with-param name="BackupName">F1120HNameChangeInd</xsl:with-param>
							</xsl:call-template>
						</input>
						Name Change </br>
						<span style="width:14mm;"/> (3) 
						<input type="checkbox" class="styCkboxNM" style="margin-left:2px;" alt="Address Change">
							<xsl:call-template name="PopulateCheckbox">
								<xsl:with-param name="TargetNode" select="$FormData/AddressChangeInd"/>
								<xsl:with-param name="BackupName">F1120HAddressChangeInd</xsl:with-param>
							</xsl:call-template>
						</input>
						Address Change </br>
						<span style="width:14mm;"/> (4) 
						<input type="checkbox" class="styCkboxNM" style="margin-left:2px;" alt="Amended Return">
							<xsl:call-template name="PopulateCheckbox">
								<xsl:with-param name="TargetNode" select="$FormData/AmendedReturnInd"/>
								<xsl:with-param name="BackupName">F1120HAmendedReturnInd</xsl:with-param>
							</xsl:call-template>
						</input>
						Amended return
					</div>
				</div>-->
				<!-- Line A -->
				<div class="styStdDiv" style="border-top:1px solid black;">
					<div class="styLNLeftNumBoxSD">A</div>
					<div class="styLNDesc" style="height:auto;width:175mm;font-family:Arial;">
						Check type of homeowners association: 
						<input type="checkbox" class="styCkboxNM" style="margin-left:8px;" aria-label="Condominium Management Association">
							<xsl:call-template name="PopulateCheckbox">
								<xsl:with-param name="TargetNode" select="$FormData/CondominiumMgmtAssociationInd"/>
								<xsl:with-param name="BackupName">F1120HCondominiumMgmtAssociationInd</xsl:with-param>
							</xsl:call-template>
						</input>
						Condominium management association
						<input type="checkbox" class="styCkboxNM" style="margin-left:8px;" aria-label="Residential Real Estate Association">
							<xsl:call-template name="PopulateCheckbox">
								<xsl:with-param name="TargetNode" select="$FormData/ResidentialREAssociationInd"/>
								<xsl:with-param name="BackupName">F1120HResidentialREAssociationInd</xsl:with-param>
							</xsl:call-template>
						</input>
						Residential real estate association
						<input type="checkbox" class="styCkboxNM" style="margin-left:8px;" aria-label="Timeshare Association Ind">
							<xsl:call-template name="PopulateCheckbox">
								<xsl:with-param name="TargetNode" select="$FormData/TimeshareAssociationInd"/>
								<xsl:with-param name="BackupName">F1120HTimeshareAssociationInd</xsl:with-param>
							</xsl:call-template>
						</input>
						Timeshare association
					</div>
				</div>
				<!-- Line B -->
				<div class="styStdDiv" style="border-top:1px solid black;">
					<div class="styLNLeftNumBoxSD">B</div>
					<div class="styLNDesc">
						Total exempt function income. Must meet 60% gross income test. See instructions
						<span class="sty1120HDotLn">........</span>
					</div>
					<div class="styLNRightNumBox">B</div>
					<div class="styLNAmountBox">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/TotalExemptFunctionIncomeAmt"/>
						</xsl:call-template>
					</div>
				</div>
				<!-- Line C -->
				<div class="styStdDiv">
					<div class="styLNLeftNumBoxSD">C</div>
					<div class="styLNDesc">
						Total expenditures made for purposes described in 90% expenditure test. See instructions
						<span class="sty1120HDotLn">.....</span>
					</div>
					<div class="styLNRightNumBox">C</div>
					<div class="styLNAmountBox">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/TotalExpendituresTestAmt"/>
						</xsl:call-template>
					</div>
				</div>
				<!-- Line D -->
				<div class="styStdDiv">
					<div class="styLNLeftNumBoxSD">D</div>
					<div class="styLNDesc">
						Association's total expenditures for the tax year. See instructions
						<span class="sty1120HDotLn">.............</span>
					</div>
					<div class="styLNRightNumBox">D</div>
					<div class="styLNAmountBox">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/TotalExpendituresAmt"/>
						</xsl:call-template>
					</div>
				</div>
				<!-- Line E -->
				<div class="styStdDiv">
					<div class="styLNLeftNumBoxSD">E</div>
					<div class="styLNDesc">
						Tax-exempt interest received or accrued during the tax year
						<span class="sty1120HDotLn">...............</span>
					</div>
					<div class="styLNRightNumBoxNBB">E</div>
					<div class="styLNAmountBoxNBB">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/TaxExemptInterestAmt"/>
						</xsl:call-template>
					</div>
				</div>

				<div class="styBB" style="width:187mm;border-top:1px solid black;">
					<div class="styIRS1120VTImageBox" style="height:120px;width:40px;padding-top:5px;border-right:1px solid black;padding-left: 1mm;">
						<img class="adjust-width" src="{$ImagePath}/1120H_GrossIncome.gif" alt="Gross Income (excluding exempt function income)"/>
					</div>
					<div style="width:000mm;float:right;clear:none;"/>
				<!-- line 1 -->
				<div style="width:175mm;float:right;clear:none;">
					<div class="styLNLeftNumBox" style="height:4mm;padding-left: 1.5mm;">1</div>
					<div class="styLNDesc" style="height:4mm;width:126mm;">
						Dividends
						<span class="sty1120HDotLn">..........................</span>
					</div>
					<div class="styLNRightNumBox" style="height:4mm;">1</div>
					<div class="styLNAmountBox" style="height:4mm;width:31.9mm">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/DividendsAmt"/>
						</xsl:call-template>
					</div>
				</div>
				<!-- Line 2 -->
				<div style="width:175mm;float:right;clear:none;">
					<div class="styLNLeftNumBox" style="height:4mm;;padding-left: 1.5mm">2</div>
					<div class="styLNDesc" style="height:4mm;width:126mm;">
						Taxable interest
						<span class="sty1120HDotLn">........................</span>
					</div>
					<div class="styLNRightNumBox" style="height:4mm;">2</div>
					<div class="styLNAmountBox" style="height:4mm;width:31.9mm">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/TaxableInterestAmt"/>
						</xsl:call-template>
					</div>
				</div>
				<!-- Line 3 -->
				<div style="width:175mm;float:right;clear:none;">
					<div class="styLNLeftNumBox" style="height:4mm;;padding-left: 1.5mm">3</div>
					<div class="styLNDesc" style="height:4mm;width:126mm;">
						Gross rents
						<span class="sty1120HDotLn">..........................</span>
					</div>
					<div class="styLNRightNumBox" style="height:4mm;">3</div>
					<div class="styLNAmountBox" style="height:4mm;width:31.9mm">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/GrossRentsAmt"/>
						</xsl:call-template>
					</div>
				</div>
				<!-- Line 4 -->
				<div style="width:175mm;float:right;clear:none;">
					<div class="styLNLeftNumBox" style="height:4mm;;padding-left: 1.5mm">4</div>
					<div class="styLNDesc" style="height:4mm;width:126mm;">
						Gross royalties
						<span class="sty1120HDotLn">.........................</span>
					</div>
					<div class="styLNRightNumBox" style="height:4mm;">4</div>
					<div class="styLNAmountBox" style="height:4mm;width:31.9mm">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/GrossRoyaltiesAmt"/>
						</xsl:call-template>
					</div>
				</div>
				<!-- Line 5 -->
				<div style="width:175mm;float:right;clear:none;">
					<div class="styLNLeftNumBoxSD" style="height:4mm;;padding-left: 1.5mm">5</div>
					<div class="styLNDesc" style="height:4mm;width:126mm;">
						Capital gain net income (attach Schedule D (Form 1120))
						<xsl:call-template name="SetFormLinkInline">
							<xsl:with-param name="TargetNode" select="$FormData/CapitalGainNetIncomeAmt"/>
						</xsl:call-template>
						<span class="sty1120HDotLn">...........</span>
					</div>
					<div class="styLNRightNumBox" style="height:4mm;">5</div>
					<div class="styLNAmountBox" style="height:4mm;width:31.9mm">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/CapitalGainNetIncomeAmt"/>
						</xsl:call-template>
					</div>
				</div>
				<!-- Line 6 -->
				<div style="width:175mm;float:right;clear:none;">
					<div class="styLNLeftNumBoxSD" style="height:4mm;;padding-left: 1.5mm">6</div>
					<div class="styLNDesc" style="height:4mm;width:126mm;">
						Net gain or (loss) from Form 4797, Part II, line 17 (attach Form 4797)
						<xsl:call-template name="LinkToLeftoverDataTableInline">
							<xsl:with-param name="Desc">Line 6 - Form 4684 Code</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$FormData/TotalOrdinaryGainLossAmt/@form4684Cd"/>
						</xsl:call-template>
						<xsl:call-template name="SetFormLinkInline">
							<xsl:with-param name="TargetNode" select="$FormData/TotalOrdinaryGainLossAmt"/>
						</xsl:call-template>
						<span class="sty1120HDotLn">......</span>
					</div>
					<div class="styLNRightNumBox" style="height:4mm;">6</div>
					<div class="styLNAmountBox" style="height:4mm;width:31.9mm">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/TotalOrdinaryGainLossAmt"/>
						</xsl:call-template>
					</div>
				</div>
				<!-- Line 7 -->
				<div style="width:175mm;float:right;clear:none;">
					<div class="styLNLeftNumBoxSD" style="height:4mm;;padding-left: 1.5mm">7</div>
					<div class="styLNDesc" style="height:4mm;width:126mm;">
						Other income (excluding exempt function income) (attach statement)
						<xsl:call-template name="LinkToLeftoverDataTableInline">
							<xsl:with-param name="Desc">Line 7 - Other Income Description</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$FormData/OtherIncomeAmt/@otherIncomeDesc"/>
						</xsl:call-template>
						<xsl:call-template name="SetFormLinkInline">
							<xsl:with-param name="TargetNode" select="$FormData/OtherIncomeAmt"/>
						</xsl:call-template>
						<span class="sty1120HDotLn">......</span>
					</div>
					<div class="styLNRightNumBox" style="height:4mm;">7</div>
					<div class="styLNAmountBox" style="height:4mm;width:31.9mm">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/OtherIncomeAmt"/>
						</xsl:call-template>
					</div>
				</div>
				<!-- Line 8 -->
				<div style="width:175mm;float:right;clear:none;">
					<div class="styLNLeftNumBox" style="height:4mm;;padding-left: 1.5mm">8</div>
					<div class="styLNDesc" style="height:4mm;width:126mm;">
						<strong>Gross income </strong> (excluding exempt function income). Add lines 1 through 7
						<span class="sty1120HDotLn">......</span>
					</div>
					<div class="styLNRightNumBox" style="height:4mm; border-bottom: none;">8</div>
					<div class="styLNAmountBox" style="height:4mm;width:31.9mm; border-bottom: none;">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/TotalIncomeAmt"/>
						</xsl:call-template>
					</div>
				</div>
			</div>
			<div class="styBB" style="width:187mm; height:40mm; border-top:1px solid black;">
<!--				<div class="styStdDiv" style="text-align:center;padding-top:1px;padding-bottom:1px;font-size:8pt;border-top:1px solid black;border-bottom:1px solid black;">
					<strong>Deductions </strong> (directly connected to the production of gross income, excluding exempt function income)
				</div>-->
				<div class="styIRS1120VTImageBox" style="height:40mm;width:40px;">
					<img class="adjust-width" src="{$ImagePath}/1120H_Deductions.gif" alt="Deductions (directly connected to the production of gross income , excluding exempt function income)"/>
				</div>
				<div style="width:000mm;float:right;clear:none;"/>
				<!-- Line 9 -->
				<div style="width:175mm;float:right;clear:none;">
					<div class="styLNLeftNumBox" style="height:4mm;;padding-left: 1.5mm">9</div>
					<div class="styLNDesc" style="height:4mm;width:126mm;">
						Salaries and wages
						<span class="sty1120HDotLn">........................</span>
					</div>
					<div class="styLNRightNumBox" style="height:4mm;">9</div>
					<div class="styLNAmountBox" style="height:4mm;width:31.9mm">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/SalariesAndWagesAmt"/>
						</xsl:call-template>
					</div>
				</div>
				<!-- Line 10 -->
				<div style="width:175mm;float:right;clear:none;">
					<div class="styLNLeftNumBox" style="height:4mm;;padding-left: 1.5mm">10</div>
					<div class="styLNDesc" style="height:4mm;width:126mm;">
						Repairs and maintenance
						<span class="sty1120HDotLn">......................</span>
					</div>
					<div class="styLNRightNumBox" style="height:4mm;">10</div>
					<div class="styLNAmountBox" style="height:4mm;width:31.9mm">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/RepairsAndMaintenanceAmt"/>
						</xsl:call-template>
					</div>
				</div>
				<!-- Line 11 -->
				<div style="width:175mm;float:right;clear:none;">
					<div class="styLNLeftNumBox" style="height:4mm;;padding-left: 1.5mm">11</div>
					<div class="styLNDesc" style="height:4mm;width:126mm;">
						Rents
						<span class="sty1120HDotLn">............................</span>
					</div>
					<div class="styLNRightNumBox" style="height:4mm;">11</div>
					<div class="styLNAmountBox" style="height:4mm;width:31.9mm">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/RentsPaidAmt"/>
						</xsl:call-template>
					</div>
				</div>
				<!-- Line 12 -->
				<div style="width:175mm;float:right;clear:none;">
					<div class="styLNLeftNumBox" style="height:4mm;;padding-left: 1.5mm">12</div>
					<div class="styLNDesc" style="height:4mm;width:126mm;">
						Taxes and licenses
						<span class="sty1120HDotLn">........................</span>
					</div>
					<div class="styLNRightNumBox" style="height:4mm;">12</div>
					<div class="styLNAmountBox" style="height:4mm;width:31.9mm">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/TaxesAndLicensesAmt"/>
						</xsl:call-template>
					</div>
				</div>
				<!-- Line 13 -->
				<div style="width:175mm;float:right;clear:none;">
					<div class="styLNLeftNumBox" style="height:4mm;;padding-left: 1.5mm">13</div>
					<div class="styLNDesc" style="height:4mm;width:126mm;">
						Interest
						<span class="sty1120HDotLn">...........................</span>
					</div>
					<div class="styLNRightNumBox" style="height:4mm;">13</div>
					<div class="styLNAmountBox" style="height:4mm;width:31.9mm">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/InterestDeductionAmt"/>
						</xsl:call-template>
					</div>
				</div>
				<!-- Line 14 -->
				<div class="styStdDiv" style="width:175mm;float:right;clear:none;">
					<div class="styLNLeftNumBox"  style="height:4mm;;padding-left: 1.5mm">14</div>
					<div class="styLNDesc" style="height:4mm;width:126mm;">
						Depreciation (attach Form 4562)
						<xsl:call-template name="SetFormLinkInline">
							<xsl:with-param name="TargetNode" select="$FormData/DepreciationAmt"/>
						</xsl:call-template>
						<span class="sty1120HDotLn">.................</span>
					</div>
					<div class="styLNRightNumBox"  style="height:4mm;">14</div>
					<div class="styLNAmountBox"  style="height:4mm;width:31.9mm">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/DepreciationAmt"/>
						</xsl:call-template>
					</div>
				</div>
				<!-- Line 15 -->
				<div class="styStdDiv" style="width:175mm;float:right;clear:none;">
					<div class="styLNLeftNumBox" style="height:4mm;;padding-left: 1.5mm">15</div>
					<div class="styLNDesc" style="height:4mm;width:126mm;">
						Other deductions (attach statement)
						<xsl:call-template name="SetFormLinkInline">
							<xsl:with-param name="TargetNode" select="$FormData/OtherDeductionsAmt"/>
						</xsl:call-template>
						<span class="sty1120HDotLn">.................</span>
					</div>
					<div class="styLNRightNumBox" style="height:4mm;">15</div>
					<div class="styLNAmountBox"  style="height:4mm;width:31.9mm">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/OtherDeductionsAmt"/>
						</xsl:call-template>
					</div>
				</div>
				<!-- Line 16 -->
				<div style="width:175mm;float:right;clear:none;">
					<div class="styLNLeftNumBox" style="height:4mm;;padding-left: 1.5mm">16</div>
					<div class="styLNDesc" style="height:4mm;width:126mm;">
						<strong>Total deductions. </strong> Add lines 9 through 15
						<span class="sty1120HDotLn">................</span>
					</div>
					<div class="styLNRightNumBox" style="height:4mm;">16</div>
					<div class="styLNAmountBox" style="height:4mm;width:31.9mm">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/TotalDeductionAmt"/>
						</xsl:call-template>
					</div>
				</div>
				<!-- Line 17 -->
				<div style="width:175mm;float:right;clear:none;">
					<div class="styLNLeftNumBox" style="height:4mm;;padding-left: 1.5mm">17</div>
					<div class="styLNDesc" style="height:4mm;width:126mm;">
						Taxable income before specific deduction of $100. Subtract line 16 from line 8
						<span class="sty1120HDotLn">.....</span>
					</div>
					<div class="styLNRightNumBox" style="height:4mm;">17</div>
					<div class="styLNAmountBox" style="height:4mm;width:31.9mm">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/TaxableIncmBfrSpcfdDolDedAmt"/>
						</xsl:call-template>
					</div>
				</div>
				<!-- Line 18 -->
				<div class="styStdDiv" style="width:175mm;float:right;clear:none;">
					<div class="styLNLeftNumBox" style="height:4mm;;padding-left: 1.5mm">18</div>
					<div class="styLNDesc" style="height:4mm;width:126mm;">
						Specific deduction of $100
						<span class="sty1120HDotLn">.....................</span>
					</div>
					<div class="styLNRightNumBox">18</div>
					<div class="styLNAmountBox">$100</div>
				</div>
<!--				<div class="styStdDiv" style="text-align:center;padding-top:1px;padding-bottom:1px;font-size:8pt;border-top:1px solid black;border-bottom:1px solid black;">
					<strong>Tax and Payments</strong>
				</div>-->
			</div>
			<div class="styBB" style="width:187mm;border-top:1px solid black;height:71.6mm;">
				<div class="styIRS1120VTImageBox" style="height:71.6mm;width:40px;padding-top:15mm;padding-left: 4mm;">
					<img id="tax-payment" src="{$ImagePath}/1120H_TaxAndPayments.gif" alt="Tax and Payments"/>
				</div>
				<div style="width:000mm;float:right;clear:none;"/>
				<!-- Line 19 -->
				<div style="width:175mm;float:right;clear:none;">
					<div class="styLNLeftNumBox" style="height:4mm;">19</div>
					<div class="styLNDesc" style="height:4mm;width:126mm;">
						<strong>Taxable income. </strong> Subtract line 18 from line 17
						<span class="sty1120HDotLn">...............</span>
					</div>
					<div class="styLNRightNumBox" style="height:4mm;">19</div>
					<div class="styLNAmountBox" style="height:4mm;width:31.9mm">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/TaxableIncomeAmt"/>
						</xsl:call-template>
					</div>
				</div>
				<!-- Line 20 -->
				<div style="width:175mm;float:right;clear:none;">
					<div class="styLNLeftNumBox">20</div>
					<div class="styLNDesc" style="height:4mm;width:126mm;">
						Enter 30% (0.30) of line 19. (Timeshare associations, enter 32% (0.32) of line 19.)
						<span class="sty1120HDotLn">...</span>
					</div>
					<div class="styLNRightNumBox">20</div>
					<div class="styLNAmountBox">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/TaxableIncomeApplcblPctAmt"/>
						</xsl:call-template>
					</div>
				</div>
				<!-- Line 21 -->
				<div style="width:175mm;float:right;clear:none;">
					<div class="styLNLeftNumBox">21</div>
					<div class="styLNDesc" style="height:4mm;width:126mm;">
						Tax credits (see instructions)
						<span class="sty1120HDotLn">.....................</span>
					</div>
					<div class="styLNRightNumBox">21</div>
					<div class="styLNAmountBox">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/TaxCreditsAmt"/>
						</xsl:call-template>
					</div>
				</div>
				<!-- Line 22 -->
				<div style="width:175mm;float:right;clear:none;">
					<div class="styLNLeftNumBox">22</div>
					<div class="styLNDesc" style="height:4mm;width:126mm;">
						<strong>Total tax. </strong> Subtract line 21 from line 20. See instructions for recapture of certain credits
						<xsl:call-template name="LinkToLeftoverDataTableInline">
							<xsl:with-param name="Desc">Line 22 - Recapture Tax Code</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$FormData/TotalTaxAmt/@recaptureTaxCd"/>
						</xsl:call-template>
						<xsl:call-template name="LinkToLeftoverDataTableInline">
							<xsl:with-param name="Desc">Line 22 - Recapture Tax Amount</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$FormData/TotalTaxAmt/@recaptureTaxAmt"/>
						</xsl:call-template>
						<xsl:call-template name="SetFormLinkInline">
							<xsl:with-param name="TargetNode" select="$FormData/TotalTaxAmt"/>
						</xsl:call-template>
						<!--<span class="sty1120HDotLn">..</span>-->
					</div>
					<div class="styLNRightNumBox">22</div>
					<div class="styLNAmountBox">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/TotalTaxAmt"/>
						</xsl:call-template>
					</div>
				</div>
				<!-- Line 23a -->
				<div style="width:175mm;float:right;clear:none;">
					<div class="styLNLeftNumBox">23a</div>
					<div class="styLNDesc" style="width:86mm;">
						Preceding year's overpayment credited to the current year
						<span class="sty1120HDotLn">..</span>
					</div>
					<div class="styLNRightNumBox">23a</div>
					<div class="styLNAmountBox" style="padding-right:0.5mm;">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/PriorYearOverpaymentCreditAmt"/>
						</xsl:call-template>
					</div>
					<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;">&nbsp;</div>
					<div class="styLNAmountBoxNBB" style="">&nbsp;</div>
				</div>
				<!-- Line 23b -->
				<div style="width:175mm;float:right;clear:none;">
					<div class="styLNLeftNumBox" style="padding-left:4.2mm;">b</div>
					<div class="styLNDesc" style="width:86mm;">
						Current year's estimated tax payments
						<span class="sty1120HDotLn">........</span>
					</div>
					<div class="styLNRightNumBox">23b</div>
					<div class="styLNAmountBox" style="padding-right:0.5mm;">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/EstimatedTaxPaymentsAmt"/>
						</xsl:call-template>
					</div>
					<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;">&nbsp;</div>
					<div class="styLNAmountBoxNBB" style="">&nbsp;</div>
				</div>
				<!-- Line 23c -->
				<div style="width:175mm;float:right;clear:none;">
					<div class="styLNLeftNumBox" style="padding-left:4.2mm;">c</div>
					<div class="styLNDesc" style="width:86mm;">
						Tax deposited with Form 7004
						<span class="sty1120HDotLn">..........</span>
					</div>
					<div class="styLNRightNumBox">23c</div>
					<div class="styLNAmountBox" style="padding-right:0.5mm;">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/TaxPaidForm7004Amt"/>
						</xsl:call-template>
					</div>
					<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;">&nbsp;</div>
					<div class="styLNAmountBoxNBB" style="">&nbsp;</div>
				</div>
				<!-- Line 23d -->
				<div style="width:175mm;float:right;clear:none;">
					<div class="styLNLeftNumBox" style="padding-left:4.2mm;">d</div>
					<div class="styLNDesc" style="width:86mm;height:7mm;">
						Credit for tax paid on undistributed capital gains <br/>(attach Form 2439)
						<xsl:call-template name="SetFormLinkInline">
							<xsl:with-param name="TargetNode" select="$FormData/TaxPaidOnUndistrCapGainsAmt"/>
						</xsl:call-template>
						<span class="sty1120HDotLn">............</span>
					</div>
					<div class="styLNRightNumBox" style="height:7mm;padding-top:3mm">23d</div>
					<div class="styLNAmountBox" style="padding-right:0.5mm;height:7mm;padding-top:3mm">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/TaxPaidOnUndistrCapGainsAmt"/>
						</xsl:call-template>
					</div>
					<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;height:7mm;">&nbsp;</div>
					<div class="styLNAmountBoxNBB" style="height:7mm;">&nbsp;</div>
				</div>
				<!-- Line 23e -->
				<div style="width:175mm;float:right;clear:none;">
					<div class="styLNLeftNumBox" style="padding-left:4.2mm;">e</div>
					<div class="styLNDesc" style="width:86mm;">
						Credit for federal tax paid on fuels (attach Form 4136)
						<xsl:call-template name="SetFormLinkInline">
							<xsl:with-param name="TargetNode" select="$FormData/FuelTaxCreditAmt"/>
						</xsl:call-template>
						<span class="sty1120HDotLn">..</span>
					</div>
					<div class="styLNRightNumBox">23e</div>
					<div class="styLNAmountBox" style="padding-right:0.5mm;">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/FuelTaxCreditAmt"/>
						</xsl:call-template>
					</div>
					<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;">&nbsp;</div>
					<div class="styLNAmountBoxNBB" style="">&nbsp;</div>
				</div>
				<!-- Line 23f -->
				<div style="width:175mm;float:right;clear:none;">
					<div class="styLNLeftNumBox" style="padding-left:4.2mm;">f</div>
					<div class="styLNDesc" style="width:86mm;">
						Elective payment election amount from Form 3800
						<xsl:call-template name="SetFormLinkInline">
							<xsl:with-param name="TargetNode" select="$FormData/ElectivePaymentAmt"/>
						</xsl:call-template>
						<span class="sty1120HDotLn">...</span>
					</div>
					<div class="styLNRightNumBox">23f</div>
					<div class="styLNAmountBox" style="padding-right:0.5mm;">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/ElectivePaymentAmt"/>
						</xsl:call-template>
					</div>
					<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;">&nbsp;</div>
					<div class="styLNAmountBoxNBB" style="">&nbsp;</div>
				</div>
				<!-- Line 23g -->
				<div style="width:175mm;float:right;clear:none;">
					<div class="styLNLeftNumBox" style="padding-left:4.2mm;">g</div>
					<div class="styLNDesc" style="width:126mm;">
						<strong>Total payments and credits. </strong> Combine lines 23a through 23f
						<span class="sty1120HDotLn">..........</span>
					</div>
					<div class="styLNRightNumBox">23g</div>
					<div class="styLNAmountBox">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/TotalPaymentsAndCreditsAmt"/>
						</xsl:call-template>
					</div>
				</div>
				<!-- Line 24 -->
				<div style="width:175mm;float:right;clear:none;">
					<div class="styLNLeftNumBox">24</div>
					<div class="styLNDesc" style="height:4mm;width:126mm;">
						<strong>Amount Owed. </strong> Subtract line 23g from line 22. See instructions
						<span class="sty1120HDotLn">.........</span>
					</div>
					<div class="styLNRightNumBox">24</div>
					<div class="styLNAmountBox">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/BalanceDueAmt"/>
						</xsl:call-template>
					</div>
				</div>
				<!-- Line 25 -->
				<div style="width:175mm;float:right;clear:none;">
					<div class="styLNLeftNumBox">25</div>
					<div class="styLNDesc" style="height:4mm;width:126mm;">
						<strong>Overpayment. </strong> Subtract line 22 from line 23g
						<span class="sty1120HDotLn">...............</span>
					</div>
					<div class="styLNRightNumBox">25</div>
					<div class="styLNAmountBox">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/OverpaymentSection/OverpaymentAmt"/>
						</xsl:call-template>
					</div>
				</div>
				<!-- Line 26 -->
				<div style="width:175mm;float:right;clear:none;">
					<div class="styLNLeftNumBox">26</div>
					<div class="styLNDesc" style="height:7mm;width:126mm;">
						Enter portion of line 25 you want: 
						<br/>
						<span><strong>a Credited to 2026 estimated tax </strong>
												<span class="sty1120HDotLn">......</span> </span>
						<span style="width:32mm;text-align:right;padding-right:1mm;border-bottom:1px solid black;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/OverpaymentSection/AppliedToEsTaxAmt"/>
							</xsl:call-template>
						</span>
						<span style="font-weight:bold;float:right;padding-right:0.5mm;">b Refunded</span>
					</div>
					<div class="styLNRightNumBox" style="height:7mm;padding-top:3mm">26b</div>
					<div class="styLNAmountBox" style="height:7mm;padding-top:3mm;">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/OverpaymentSection/RefundAmt"/>
						</xsl:call-template>
					</div>
					<!-- Beginning of c -->
					<div style="width:175mm;float:right;">
									<!--<span style="float:left;"><br/>-->
							<span style="float:left;">								
							<div class="styLNLeftNumBox" style="padding-left:8mm;">c</div>
							<div class="styLNDesc" style="width:126mm">
								<div class="styLNDesc" style="width:27mm;padding-left:4mm;">Routing number</div>										
								<!-- call routing number -->
								<span class="styLNCtrNumBox" style="width:34mm;border-top-width:1px;padding-top:0mm;padding-bottom:0mm;font-weight:normal;">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$FormData/DirectDepositGrp/RoutingTransitNum"/>												
									</xsl:call-template>
								</span>
								<span style="width:4mm;float:left;clear:none;"/>
<!--								<span style="width:4mm;"/>-->
								<span class="styLNLeftNumBox" style="width:16mm;padding-left:3mm;">d Type:</span>
								<span style="width:0.5mm;"/>
								<span>
									<xsl:call-template name="PopulateSpan">
										<xsl:with-param name="TargetNode" select="$FormData/DirectDepositGrp/CheckingAccountInd"/>
									</xsl:call-template>
								<input type="checkbox" class="styCkbox" style="" aria-label="28c Checking">
									<xsl:call-template name="PopulateCheckbox">
										<xsl:with-param name="TargetNode" select="$FormData/DirectDepositGrp/CheckingAccountInd"/>
									</xsl:call-template>
								</input>
								<span style="width:1mm;"/>
								<label>
									<xsl:call-template name="PopulateSpan">
										<xsl:with-param name="TargetNode" select="$FormData/DirectDepositGrp/CheckingAccountInd"/>
									</xsl:call-template>
									<xsl:call-template name="PopulateLabel">
										<xsl:with-param name="TargetNode" select="$FormData/DirectDepositGrp/CheckingAccountInd"/>
									</xsl:call-template>
									<span style="">Checking</span>
								</label>
								</span>
								<span style="width:2mm;"/>
								<span>
									<xsl:call-template name="PopulateSpan">
										<xsl:with-param name="TargetNode" select="$FormData/DirectDepositGrp/SavingsAccountInd"/>
									</xsl:call-template>
								<input type="checkbox" class="styCkbox" style="" aria-label="1c Savings">
									<xsl:call-template name="PopulateCheckbox">
										<xsl:with-param name="TargetNode" select="$FormData/DirectDepositGrp/SavingsAccountInd"/>
									</xsl:call-template>
								</input>
								<span style="width:1mm;"/>
								<label>
									<xsl:call-template name="PopulateSpan">
										<xsl:with-param name="TargetNode" select="$FormData/DirectDepositGrp/SavingsAccountInd"/>
									</xsl:call-template>
									<xsl:call-template name="PopulateLabel">
										<xsl:with-param name="TargetNode" select="$FormData/DirectDepositGrp/SavingsAccountInd"/>
									</xsl:call-template>
									<span style="">Savings</span>
								</label>
								</span>
							</div>
							</span>
					<div style="clear:none;height:4.6mm;">							
						<div class="styLNRightNumBox" style="height:4.6mm;background-color:lightgrey;border-bottom-width:0px;"/>
						<div class="styLNAmountBox" style="height:4.6mm;background-color:lightgrey;border-bottom-width:0px;"/>
					</div>																					
				</div>
				<!-- End of c -->
				<!-- Beginning of e -->
						<div class="styStdDiv" style="width:175mm;float:right;">
							<span style="float:left;">
							<div class="styLNLeftNumBox" style="padding-left:8mm;">e</div>
							<div class="styLNDesc" style="width:126mm;">
								<div class="styLNDesc" style="width:27mm;padding-left:4mm;">Account number</div>										
								<!-- call routing number -->
								<span class="styLNCtrNumBox" style="width:80mm;border-top-width:1px;padding-top:0mm;padding-bottom:0mm;font-weight:normal;">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$FormData/DirectDepositGrp/DepositorAccountNum"/>												
									</xsl:call-template>
								</span>
							</div>
							</span>
					<div style="clear:none;height:4.6mm;">							
						<div class="styLNRightNumBox" style="height:4.6mm;background-color:lightgrey;border-bottom-width:0px;"/>
						<div class="styLNAmountBox" style="height:4.6mm;background-color:lightgrey;border-bottom-width:0px;"/>
					</div>	
				</div>							
				<!-- End of e -->	
				</div>
			</div>	
				<!-- BEGIN Signature Section -->
				<div class="styStdDiv" style="border-bottom:1px solid black;border-top:1px solid black;">
					<div class="styGenericDiv" style="width:40px;height:17mm;font-size:11pt;font-weight:bold;padding-top:3mm;border-right:1px solid black;">
						Sign Here
					</div>
					<div class="styGenericDiv" style="width:175mm;font-size:6pt;padding:0.5mm;">
						Under penalties of perjury, I declare that I have examined this return, including accompanying schedules and statements, 
						and to the best of my knowledge and belief, it is true, correct, and complete. Declaration of preparer (other than taxpayer) 
						is based on all information of which preparer has any knowledge.<br />
					</div>
					<div class="styGenericDiv" style="width:175mm;">
						<div class="styGenericDiv" style="width:56mm;">
							<span style="width:100%;height:6mm;border-bottom:1px solid black;border-right:1px solid black;vertical-align:bottom;padding-left:0.5mm;padding-top:2mm;">
								<xsl:call-template name="PopulateReturnHeaderOfficer">
									<xsl:with-param name="TargetNode">PersonNm</xsl:with-param>
								</xsl:call-template>
							</span>
							<span style=";">Signature of officer</span>
						</div>
						<div class="styGenericDiv" style="width:16mm;">
							<span style="width:100%;height:6mm;border-bottom:1px solid black;padding-left:0.5mm;padding-top:2mm;">
								<xsl:call-template name="PopulateReturnHeaderOfficer">
									<xsl:with-param name="TargetNode">SignatureDt</xsl:with-param>
								</xsl:call-template>
							</span>
							<span>Date</span>
						</div>
						<div class="styGenericDiv" style="width:56mm;margin-left:2mm;">
							<span style="width:100%;height:6mm;border-bottom:1px solid black;padding-top:2mm;">
								<xsl:call-template name="PopulateReturnHeaderOfficer">
									<xsl:with-param name="TargetNode">PersonTitleTxt</xsl:with-param>
								</xsl:call-template>
							</span>
							<span>Title</span>
						</div>
						<div class="styGenericDiv" style="width:42mm;height:11mm;border:3px solid black;margin-left:3px;font-family:Arial;;">
							<xsl:call-template name="PopulateSpan">
								<xsl:with-param name="TargetNode" select="$RtnHdrData/BusinessOfficerGrp/DiscussWithPaidPreparerInd"/>
							</xsl:call-template>
							May the IRS discuss this return<br/>with the preparer shown below?<br/> See instructions.
							<input type="checkbox" class="styCkboxNM" style="margin-right:2px;" aria-label="Discuss with paid preparer Yes">
								<xsl:call-template name="PopulateReturnHeaderOfficer">
									<xsl:with-param name="TargetNode">AuthorizeThirdPartyYesCheckbox</xsl:with-param>
									<xsl:with-param name="BackupName">IRS1120HAuthorizeThirdPartyYesCheckbox</xsl:with-param>
								</xsl:call-template>
							</input>
							<span>Yes</span>
							<input type="checkbox" class="styCkboxNM" style="margin-left:6px;margin-right:2px;" aria-label="Discuss with paid preparer No">
								<xsl:call-template name="PopulateReturnHeaderOfficer">
									<xsl:with-param name="TargetNode">AuthorizeThirdPartyNoCheckbox</xsl:with-param>
									<xsl:with-param name="BackupName">IRS1120HAuthorizeThirdPartyNoCheckbox</xsl:with-param>
								</xsl:call-template>
							</input>
							<span>No</span>
						</div>
					</div>
				</div>
				<!-- paid preparer -->
				<div class="styStdDiv"  style="width:187mm;font-size:6pt;">
					<div class="styGenericDiv" style="width:23mm;height:auto;padding-top:4mm;">
						<span class="styMainTitle" style="font-size:11pt;">
							Paid
							Preparer
							Use Only
						</span>
					</div>
					<div class="styGenericDiv" style="width:164mm;">
						<div class="styGenericDiv" style="width:164mm;border-style:solid;border-color:black;border-width:0px 0px 1px 0px;">
							<div class="styLNDesc" style="height:8mm;width:46.5mm;padding-top:0mm;border-right:1px solid black;border-left:1px solid black;;">Preparer's name<br/>
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$RtnHdrData/PreparerPersonGrp/PreparerPersonNm"/>
								</xsl:call-template>
							</div>
						<div class="styLNDesc" style="height:8mm;width:46.5mm;padding-top:0mm;border-right:1px solid black;;">
							Preparer's signature
						</div>
							<div class="styLNDesc" 
							style="height:8mm;width:15mm;border-right:1px solid black;padding-top:0mm;;">Date <br/>
								<br/>
								<xsl:call-template name="PopulateReturnHeaderPreparer">
									<xsl:with-param name="TargetNode">DatePrepared</xsl:with-param>
								</xsl:call-template>
							</div>
							<div class="styLNDesc"
							 style="height:8mm;width:18mm;border-right:1px solid  black;padding-top:0mm;vertical-align:top;padding-bottom:0mm;;">
								<label>
									<xsl:call-template name="PopulateLabel">
										<xsl:with-param name="TargetNode" select="$RtnHdrData/PreparerPersonGrp/SelfEmployedInd"/>
										<xsl:with-param name="BackupName">$RtnHdrDataPreparerPersonGrpSelfEmployed</xsl:with-param>
									</xsl:call-template>
									Check 
									<input class="styCkbox" aria-label="Preparer Person Self Employed" type="checkbox" style="width:4mm;">
										<xsl:call-template name="PopulateCheckbox">
											<xsl:with-param name="TargetNode" select="$RtnHdrData/PreparerPersonGrp/SelfEmployedInd"/>
											<xsl:with-param name="BackupName">$RtnHdrDataPreparerPersonGrpSelfEmployed</xsl:with-param>
										</xsl:call-template>
									</input>
									<span style="width:4.5px;"/>if<br/>self-employed
								</label>
							</div>
							<div class="styLNDesc" style="height:6mm;width:26mm;padding-top:0mm;;">PTIN
							<br/>
								<br/>
								<span style="width:6mm;"/>
								<xsl:if test="$RtnHdrData/PreparerPersonGrp/SSN">
									<xsl:call-template name="PopulateReturnHeaderPreparer">
										<xsl:with-param name="TargetNode">SSN</xsl:with-param>
									</xsl:call-template>
								</xsl:if>
								<xsl:if test="$RtnHdrData/PreparerPersonGrp/PTIN">
									<xsl:call-template name="PopulateReturnHeaderPreparer">
										<xsl:with-param name="TargetNode">PTIN</xsl:with-param>
									</xsl:call-template>
								</xsl:if>
							</div>
						</div>
						<div style="width:164mm;float:left;clear:none;border-style:solid;border-color:black;border-width:0px 0px 1px 0px;">
						<div class="styLNDesc" style="height:6mm;width:126mm;border-right:1px solid black;border-left:1px solid black;;">
								<span class="styGenericDiv" style="">Firm's name 
								<span style="width:2.2mm;"/>
									<span style="width:4px;"/>
								</span>
								<div class="styGenericDiv" style="padding-right:.5mm;">
									<xsl:call-template name="PopulateReturnHeaderPreparerFirm">
										<xsl:with-param name="TargetNode">BusinessNameLine1Txt</xsl:with-param>
									</xsl:call-template>
									<br/>
									<xsl:call-template name="PopulateReturnHeaderPreparerFirm">
										<xsl:with-param name="TargetNode">BusinessNameLine2Txt</xsl:with-param>
									</xsl:call-template>
								</div>
							</div>
							<div class="styLNDesc" style="height:6mm;width:32mm;;">Firm's EIN
								<span style="width:4px;"/>
								<xsl:choose>
									<xsl:when test="$RtnHdrData/PreparerFirmGrp/PreparerFirmEIN">
										<xsl:call-template name="PopulateReturnHeaderPreparerFirm">
											<xsl:with-param name="TargetNode">EIN</xsl:with-param>
										</xsl:call-template>
									</xsl:when>
									<xsl:otherwise>
										<xsl:call-template name="PopulateReturnHeaderPreparerFirm">
											<xsl:with-param name="TargetNode">MissingEINReason</xsl:with-param>
										</xsl:call-template>
									</xsl:otherwise>
								</xsl:choose>
							</div>
						</div>
						<div style="width:164mm;float:left;clear:none;">
							<div class="styLNDesc" style="width:126mm;border-right:1px solid black;border-left:1px solid black;;min-height:8mm;height:auto;">
								<div class="styGenericDiv" style="padding-right:.5mm;">Firm's address 
								</div>
								<div class="styGenericDiv" style="padding-right:.5mm;">
									<xsl:call-template name="PopulateReturnHeaderPreparerFirm">
										<xsl:with-param name="TargetNode">AddressLine1Txt</xsl:with-param>
									</xsl:call-template>
									<br/>
									<xsl:call-template name="PopulateReturnHeaderPreparerFirm">
										<xsl:with-param name="TargetNode">AddressLine2Txt</xsl:with-param>
									</xsl:call-template>
									<br/>
									<xsl:if test="$RtnHdrData/PreparerFirmGrp/PreparerUSAddress">
										<xsl:call-template name="PopulateReturnHeaderPreparerFirm">
											<xsl:with-param name="TargetNode">CityNm</xsl:with-param>
										</xsl:call-template>,
										<span style="width:2px;"/>
										<xsl:call-template name="PopulateReturnHeaderPreparerFirm">
											<xsl:with-param name="TargetNode">StateAbbreviationCd</xsl:with-param>
										</xsl:call-template>,
										<span style="width:2px;"/>
										<xsl:call-template name="PopulateReturnHeaderPreparerFirm">
											<xsl:with-param name="TargetNode">ZIPCd</xsl:with-param>
										</xsl:call-template>
									</xsl:if>
									<xsl:if test="$RtnHdrData/PreparerFirmGrp/PreparerForeignAddress">
										<xsl:call-template name="PopulateReturnHeaderPreparerFirm">
											<xsl:with-param name="TargetNode">CityNm</xsl:with-param>
										</xsl:call-template>,
										<span style="width:2px;"/>
										<xsl:call-template name="PopulateReturnHeaderPreparerFirm">
											<xsl:with-param name="TargetNode">ProvinceOrStateNm</xsl:with-param>
										</xsl:call-template>,
										<span style="width:2px;"/>
										<xsl:call-template name="PopulateReturnHeaderPreparerFirm">
											<xsl:with-param name="TargetNode">ForeignPostalCd</xsl:with-param>
										</xsl:call-template>,
										<span style="width:2px;"/>
										<xsl:call-template name="PopulateReturnHeaderPreparerFirm">
											<xsl:with-param name="TargetNode">CountryCd</xsl:with-param>
										</xsl:call-template>
									</xsl:if>
								</div>
							</div>
							<div class="styLNDesc" style="width:37mm;;height:auto;word-break:break-all;"> 
								Phone no. 
								<xsl:call-template name="PopulateReturnHeaderPreparer">
									<xsl:with-param name="TargetNode">Phone</xsl:with-param>
								</xsl:call-template>
								<xsl:call-template name="PopulateReturnHeaderPreparer">
									<xsl:with-param name="TargetNode">ForeignPhone</xsl:with-param>
								</xsl:call-template>
							</div>
						</div>
					</div>
				</div>
				<div class="pageEnd" style="width:187mm;border-top:1px solid black;">
					<strong>For Paperwork Reduction Act Notice, see separate instructions. </strong>
					<span style="margin-left:20mm;">
						Cat. No. 11477H
					</span>
					<span style="float:right;">
						Form <span class="styBoldText" style="font-size:8pt;">1120-H</span> (2025)
					</span>
				</div>
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
					<xsl:call-template name="PopulateLeftoverRow">
						<xsl:with-param name="Desc">Line 6 - Form 4684 Code</xsl:with-param>
						<xsl:with-param name="TargetNode" select="$FormData/TotalOrdinaryGainLossAmt/@form4684Cd"/>
					</xsl:call-template>
					<xsl:call-template name="PopulateLeftoverRow">
						<xsl:with-param name="Desc">Line 7 - Other Income Description</xsl:with-param>
						<xsl:with-param name="TargetNode" select="$FormData/OtherIncomeAmt/@otherIncomeDesc"/>
					</xsl:call-template>
					<xsl:call-template name="PopulateLeftoverRow">
						<xsl:with-param name="Desc">Line 22 - Recapture Tax Code</xsl:with-param>
						<xsl:with-param name="TargetNode" select="$FormData/TotalTaxAmt/@recaptureTaxCd"/>
					</xsl:call-template>
					<xsl:call-template name="PopulateLeftoverRowAmount">
						<xsl:with-param name="Desc">Line 22 - Recapture Tax Amount</xsl:with-param>
						<xsl:with-param name="TargetNode" select="$FormData/TotalTaxAmt/@recaptureTaxAmt"/>
					</xsl:call-template>
				</table>
				<br/>
			</body>
		</html>
	</xsl:template>
</xsl:stylesheet>