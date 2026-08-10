<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE xsl:stylesheet [
	<!ENTITY nbsp "&#160;">
]> 
<!--06/05/25 - PDF Review - AJH -->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:include href="PopulateTemplate.xsl"/>
	<xsl:include href="AddHeader.xsl"/>
	<xsl:include href="CommonPathRef.xsl"/>
	<xsl:include href="AddOnTable.xsl"/>
	<xsl:include href="IRS6765Style.xsl"/>
	<xsl:output method="html" indent="yes"/>
	<xsl:strip-space elements="*"/>
	<xsl:param name="Form6765Data" select="$RtnDoc/IRS6765"/>
	<xsl:template match="/">
		<xsl:text disable-output-escaping="yes">&lt;!DOCTYPE html&gt;</xsl:text>
		<html lang="EN-US">
			<head>
				<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
				<title>
					<xsl:call-template name="FormTitle">
						<xsl:with-param name="RootElement" select="local-name($Form6765Data)"/>
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
				<meta name="Description" content="IRS Form 6765"/>
				<script language="JavaScript" src="{$ScriptPath}/FormDisplay.js" type="text/javascript"/>
				<xsl:call-template name="InitJS"/>
				<style type="text/css">
					<xsl:if test="not($Print) or $Print=''">
						<!-- Form 6765 CSS Styles are located in the template called below -->
						<xsl:call-template name="IRS6765Style"/>
						<xsl:call-template name="AddOnStyle"/>
					</xsl:if>
				</style>
				<xsl:call-template name="GlobalStylesForm"/>
			</head>
		<body class="styBodyClass">
			<form name="Form6765">
				<xsl:call-template name="DocumentHeader"/>
<!-- Begin Form Number and Name -->
				<div class="styBB" style="width:187mm;">
					<div class="styFNBox" style="width:31mm;height:21mm;">
						Form <span class="styFormNumber">6765</span>
						<xsl:call-template name="SetFormLinkInline">
							<xsl:with-param name="TargetNode" select="$Form6765Data"/>
						</xsl:call-template>
						     <span class="styAgency">(Rev. December 2024)</span>
							 <span class="styAgency">Department of the Treasury</span>
							 <br/>
							 <span class="styAgency">Internal Revenue Service</span>
					</div>
					<div class="styFTBox" style="width:123mm;height:21mm;">
						<div class="styMainTitle" style="height:8mm;">
							Credit for Increasing Research Activities
						</div>
							<br/>
						<div class="styFST" style="height:5mm;font-size:7pt;">
							<!--<img src="{$ImagePath}/6765_Bullet.gif" alt="Bullet Image"/>-->
								  Attach to your tax return.<br></br>
							<div class="styFST" style="height:2mm;font-size:7pt;text-align:left;">
								<!--<img src="{$ImagePath}/6765_Bullet.gif" alt="Bullet Image"/>-->
								  Go to <a href="http://www.irs.gov/form6765" title="Link to IRS.gov"><i>www.irs.gov/Form6765</i></a>
								  for instructions and the latest information. 
							</div>
						</div>
					</div>
					<div class="styTYBox" style="width:32mm;height:21mm;">
						<div class="styOMB" style="height:auto;border-bottom-width:1px;padding-top:1mm;">
							  OMB No. 1545-0619
						</div>
						<div style="text-align:left;padding-left:6mm;padding-top:6mm;">Attachment<br/> Sequence No.<span class="styBoldText">
							<span style="width:4px;"/>676</span>
						</div>
					</div>
				</div>
				
		<!-- End Form Number and Name section -->
		<!-- ***BEGIN Names and Identifying number section*** -->
		<div class="styBB" style="width:187mm; height:auto;">
			<div class="styNameBox" style="width:147mm; height:9mm; font-weight:normal;font-size:7pt;">
				Name(s) shown on return<br/>
				<span style="font-weight:normal;">
		<!-- Choice between 1120, 1041, 1040 and 1040NR Return Header Filer info -->
					<xsl:call-template name="PopulateFilerName">
						<xsl:with-param name="TargetNode" select="$Form6765Data"/>
					</xsl:call-template>
				</span>
			</div>
			<div class="styEINBox" style="width:39mm;height:auto;padding-left:2mm;font-size:7pt;">
					Identifying number
					<br/><br/>
			<span style="font-weight:normal;">
		<!-- Choice between 1120, 1041, 1040 and 1040NR Return Header Filer info -->
				<xsl:call-template name="PopulateFilerTIN">
					<xsl:with-param name="TargetNode" select="$Form6765Data"/>
				</xsl:call-template>
			</span>		
			</div>
		</div>
		<!-- ///END Names and Identifying number section/// -->
		
<!-- ***BEGIN SECTION - Under Name - A/B - YES/NO; If "Yes,"*** -->
		<!-- ***BEGIN-A*** -->
		<div class="styStdDiv" style="width:187mm;height:6mm;padding-top:1.5mm;">
			<div class="styLNLeftLtrBox" style="width:4mm; padding-left:0mm;padding-top:0mm;">A</div>
			<div style="width:160.5mm;">Are you electing the reduced credit under section 280C? See instructions 
			<!-- Dotted Line -->
              <span style="letter-spacing:3mm; font-weight:bold; font-size:7pt; margin-left:2mm;">.................</span> 
			</div>
			<div style="width:22mm; float:right;">
		<!-- ***A-Yes*** -->	
			Yes
			<input type="Checkbox" class="styCkboxNM" alt="Reduced Section 280C Credit Election Indicator Yes">
			<xsl:call-template name="PopulateYesCheckbox">
				<xsl:with-param name="TargetNode" select="$Form6765Data/ReducedSection280CCrElectInd"/>
					<xsl:with-param name="BackupName">ReducedSection280CCrElectInd</xsl:with-param>
				</xsl:call-template>
			</input>
			<span style="width:3mm;"/>
		<!-- ***A-No*** -->
			No
			<input type="Checkbox" class="styCkboxNM" alt="Reduced Section 280C Credit Election Indicator No">
			<xsl:call-template name="PopulateNoCheckbox">
				<xsl:with-param name="TargetNode" select="$Form6765Data/ReducedSection280CCrElectInd"/>
				<xsl:with-param name="BackupName">ReducedSection280CCrElectInd</xsl:with-param>
			</xsl:call-template>
			</input>
		    </div>
		</div>
		<!--///END-A///-->
		
		<!-- ***BEGIN-B*** -->
		<div class="styStdDiv" style="width:187mm;height:4mm;">
		  <div class="styLNLeftLtrBox" style="width:4mm; padding-left:0mm;padding-top:0mm;">B</div>
			<div style="width:160.5mm;">Are you a member of a controlled group or business under common control?
			<span style="letter-spacing:3mm; font-weight:bold; font-size:7pt; margin-left:1mm;">................</span>
			</div>
			<div style="width:22mm; float:right;">
		<!-- ***B-Yes*** -->
			Yes
			<input type="Checkbox" class="styCkboxNM" alt="Member of Controlled Group Indicator Yes">
			<xsl:call-template name="PopulateYesCheckbox">
				<xsl:with-param name="TargetNode" select="$Form6765Data/MemberOfControlledGroupInd"/>
					<xsl:with-param name="BackupName">MemberOfControlledGroupInd</xsl:with-param>
				</xsl:call-template>
			</input>
			<span style="width:3mm;"/>
		<!-- ***B-No*** -->
			No
			<input type="Checkbox" class="styCkboxNM" alt="Member of Controlled Group Indicator No">
			<xsl:call-template name="PopulateNoCheckbox">
				<xsl:with-param name="TargetNode" select="$Form6765Data/MemberOfControlledGroupInd"/>
				<xsl:with-param name="BackupName">MemberOfControlledGroupInd</xsl:with-param>
			</xsl:call-template>
			</input>
			</div>
		</div>
		<!--///END-B///-->
		
		<!--***BEGIN-If "Yes," Statement***-->
		<div class="styStdDiv" style="width:187mm;height:5mm;">
		    <div style="width:160.5mm;">If “Yes,” complete and attach the required statement. See instructions for required attachment.</div>
		</div>
		<!--***END-If "Yes," Statement***-->
<!-- ///END SECTION - Under Name - A/B - YES/NO; If "Yes,"///-->
		
		<!--***BEGIN Section A - REGULAR CREDIT-->
		<div class="styBB" style="width:187mm;font-size:7pt;border-top-width:.25mm;">
			<div class="styLNDesc" style="height:auto;width:183mm;font-size:7pt;padding-left:0mm;"><b>Section A—Regular Credit.</b>
			 Skip this section and go to Section B if you are electing or previously elected (and are not  revoking) the alternative simplified credit.
		    </div>
		</div>

        <!--***BEGIN Line 1***-->
		<div style="width:187mm">
			<div class="styLNLeftNumBox" style="height:4.5mm;padding-left:2.5mm;">1</div>
			<div class="styLNDesc" style="width:138.75mm;height:auto;"> 
				Certain amounts paid or incurred to energy consortia (see instructions)  
			  <!-- Dotted Line -->
              <span style="letter-spacing:4mm; font-weight:bold; font-size:7pt; margin-left:2mm;">.........</span> 
			</div>
			<div class="styLNRightNumBox" style="width:8.25mm;height:4.5mm;border-right-width:1px;">1</div>
			<div class="styLNAmountBox" style="height:4.5mm;padding-right:1mm;border-right-width:0px;border-left-width:0px;">
				<xsl:call-template name="PopulateAmount">
					<xsl:with-param name="TargetNode" select="$Form6765Data/RegularEnergyConsortiaAmt"/>
				</xsl:call-template>
			</div>
		</div>
		<!--///END Line 1///-->
		
		<!--***BEGIN Line 2***-->
		<div style="width:187mm">
			<div class="styLNLeftNumBox" style="height:4.5mm;padding-left:2.5mm;">2</div>
			<div class="styLNDesc" style="width:98.75mm;height:4.5mm;">
				Basic research payments to qualified organizations (see instructions)
              <!-- Dotted Line -->
              <span style="letter-spacing:4mm; font-weight:bold; font-size:7pt; margin-left:2mm;">..</span> 
        </div>
		<div class="styLNRightNumBox" style="height:4.5mm;">2</div>
			<div class="styLNAmountBox" style="height:4.5mm;padding-right:1mm;">
				<xsl:call-template name="PopulateAmount">
					<xsl:with-param name="TargetNode" select="$Form6765Data/RegularBasicResearchPaymentAmt"/>
				</xsl:call-template>
			</div>
			<div class="styLNRightNumBoxNBB" style="width:8.25mm;height:4.5mm;border-right-width:1px;background-color:lightgrey"/>
			<div class="styLNAmountBoxNBB" style="height:4.5mm;border-right-width:0px;border-left-width:0px;"/>
		</div>
		<!--///END Line 2///-->
					
		<!--***BEGIN Line 3***-->
		<div style="width:187mm">
			<div class="styLNLeftNumBox" style="height:4.5mm;padding-left:2.5mm;">3</div>
			<div class="styLNDesc" style="width:98.75mm;height:4.5mm;">
				Qualified organization base period amount
			  <!-- Dotted Line -->
              <span style="letter-spacing:4mm; font-weight:bold; font-size:7pt; margin-left:2mm;">........</span> 
		</div>
		<div class="styLNRightNumBox" style="height:4.5mm;">3</div>
			<div class="styLNAmountBox" style="height:4.5mm;padding-right:1mm;">
				<xsl:call-template name="PopulateAmount">
					<xsl:with-param name="TargetNode" select="$Form6765Data/RegularBasePeriodAmt"/>
				</xsl:call-template>
			</div>
			<div class="styLNRightNumBoxNBB" style="width:8.25mm;height:4.5mm;border-right-width:1px;background-color:lightgrey"/>
			<div class="styLNAmountBoxNBB" style="height:4.5mm;border-right-width:0px;border-left-width:0px;"/>
		</div>
		<!--///END Line 3///-->
					
		<!--***BEGIN Line 4***-->
		<div style="width:187mm">
			<div class="styLNLeftNumBox" style="height:4.5mm;padding-left:2.5mm;">4</div>
				<div class="styLNDesc" style="width:138.75mm;height:4.5mm;">
					Subtract line 3 from line 2. If zero or less, enter -0-
                <!-- Dotted Line -->
				<span style="letter-spacing:4mm; font-weight:bold; font-size:7pt; margin-left:2mm;">..............</span> 
			</div>
			<div class="styLNRightNumBox" style="height:4.5mm;">4</div>
				<div class="styLNAmountBox" style="height:4.5mm;padding-right:1mm;">
					<xsl:call-template name="PopulateAmount">
						<xsl:with-param name="TargetNode" select="$Form6765Data/RegularPaymentMinusBaseAmt"/>
					</xsl:call-template>
				</div>
			</div>
		<!--///END Line 4///-->
			
		<!--***BEGIN Line 4 NOTE***-->
		<div style="width:187mm">
			<div class="styLNLeftNumBox" style="height:4.5mm;padding-left:2.5mm;"></div>
			<div class="styLNDesc" style="width:138.75mm;height:4.5mm;">
				<b>Note:</b> Complete Section F before going to line 5.
			</div>
			<div class="styLNRightNumBoxNBB" style="width:8.25mm;height:4.5mm;border-right-width:1px;background-color:lightgrey"></div>
			<div class="styLNAmountBoxNBB" style="height:4.5mm;border-right-width:0px;border-left-width:0px;"></div>
		</div>
		<!--///END Line 4 NOTE///-->		

		<!--***BEGIN Line 5***-->
		<div style="width:187mm">
			<div class="styLNLeftNumBox" style="height:4.5mm;padding-left:2.5mm;padding-top:2.5mm;">5</div>
			<div class="styLNDesc" style="width:98.75mm;height:4.5mm;padding-top:2.5mm;">
				Total qualified research expenses (QREs). Enter amount from line 48
			    <!-- Dotted Line -->
                <span style="letter-spacing:4mm; font-weight:bold; font-size:7pt; margin-left:2mm;">..</span> 
			</div>
			<div class="styLNRightNumBox" style="height:7.5mm;padding-top:3mm;">5</div>
			<div class="styLNAmountBox" style="height:7.5mm;padding-top:3mm;padding-right:1mm;">
				<xsl:call-template name="PopulateAmount">
					<xsl:with-param name="TargetNode" select="$Form6765Data/QlfyRsrchExpnssSummaryGrp/TotalQREAmt"/>
				</xsl:call-template>
			</div>
			<div class="styLNRightNumBoxNBB" style="width:8.25mm;height:7.5mm;border-right-width:1px;background-color:lightgrey"/>
			<div class="styLNAmountBoxNBB" style="height:7.5mm;border-right-width:0px;border-left-width:0px;"/>
		</div>
		
		<!--***BEGIN Line 6***-->
		<div style="width:187mm">
			<div class="styLNLeftNumBox" style="height:4.5mm;padding-left:2.5mm;">6</div>
			<div class="styLNDesc" style="width:98.75mm;height:4.5mm;">
				Enter fixed-base percentage, but not more than 16% (0.16). See instructions
			   <!-- Dotted Line -->
			   <span style="letter-spacing:4mm; font-weight:bold; font-size:7pt; margin-left:2mm;"></span> 
			</div>
			<div class="styLNRightNumBox" style="height:4.5mm;">6</div>
			<div class="styLNAmountBox" style="height:4.5mm;padding-right:1mm;">
				<xsl:call-template name="PopulatePercent">
					<xsl:with-param name="TargetNode" select="$Form6765Data/FixedBasedPct"/>
				</xsl:call-template>
			</div>
			<div class="styLNRightNumBoxNBB" style="width:8.25mm;height:4.5mm;border-right-width:1px;background-color:lightgrey"/>
			<div class="styLNAmountBoxNBB" style="height:4.5mm;border-right-width:0px;border-left-width:0px;"/>
		</div>
		
		<!--***BEGIN Line 7***-->
		<div style="width:187mm">
			<div class="styLNLeftNumBox" style="height:4.5mm;padding-left:2.5mm;">7</div>
			<div class="styLNDesc" style="width:98.75mm;height:4.5mm;">
			  Enter average annual gross receipts. See instructions
			   <!-- Dotted Line -->
               <span style="letter-spacing:4mm; font-weight:bold; font-size:7pt; margin-left:2mm;">......</span> 
			</div>
			<div class="styLNRightNumBox" style="height:4.5mm;">7</div>
			<div class="styLNAmountBox" style="height:4.5mm;padding-right:1mm;">
				<xsl:call-template name="PopulateAmount">
					<xsl:with-param name="TargetNode" select="$Form6765Data/RegularAverageGrossReceiptsAmt"/>
				</xsl:call-template>
			</div>
			<div class="styLNRightNumBoxNBB" style="width:8.25mm;height:4.5mm;border-right-width:1px;background-color:lightgrey"/>
			<div class="styLNAmountBoxNBB" style="height:4.5mm;border-right-width:0px;border-left-width:0px;"/>
		</div>
		
		<!--***BEGIN Line 8***-->
		<div style="width:187mm">
			<div class="styLNLeftNumBox" style="height:4.5mm;padding-left:2.5mm;">8</div>
			<div class="styLNDesc" style="width:98.75mm;height:4.5mm;">
				Multiply line 7 by the percentage on line 6 
			    <!-- Dotted Line -->
                <span style="letter-spacing:4mm; font-weight:bold; font-size:7pt; margin-left:1mm;">.........</span> 
			</div>
			<div class="styLNRightNumBox" style="height:4.5mm;">8</div>
			<div class="styLNAmountBox" style="height:4.5mm;padding-right:1mm;">
				<xsl:call-template name="PopulateAmount">
					<xsl:with-param name="TargetNode" select="$Form6765Data/FixedBasePctTimesGrossRcptsAmt"/>
				</xsl:call-template>
			</div>
			<div class="styLNRightNumBoxNBB" style="width:8.25mm;height:4.5mm;border-right-width:1px;background-color:lightgrey"/>
			<div class="styLNAmountBoxNBB" style="height:4.5mm;border-right-width:0px;border-left-width:0px;"/>
		</div>
		
		<!--***BEGIN Line 9***-->
		<div style="width:187mm">
			<div class="styLNLeftNumBox" style="height:4.5mm;padding-left:2.5mm;">9</div>
			<div class="styLNDesc" style="width:98.75mm;height:4.5mm;">
				Subtract line 8 from line 5. If zero or less, enter -0- 
				<!-- Dotted Line -->
				<span style="letter-spacing:4mm; font-weight:bold; font-size:7pt; margin-left:2mm;">......</span> 
			</div>
			<div class="styLNRightNumBox" style="height:4.5mm;">9</div>
			<div class="styLNAmountBox" style="height:4.5mm;padding-right:1mm;">
				<xsl:call-template name="PopulateAmount">
					<xsl:with-param name="TargetNode" select="$Form6765Data/AdjTotQualifedRsrchExpnssAmt"/>
				</xsl:call-template>
			</div>
			<div class="styLNRightNumBoxNBB" style="width:8.25mm;height:4.5mm;border-right-width:1px;background-color:lightgrey"/>
			<div class="styLNAmountBoxNBB" style="height:4.5mm;border-right-width:0px;border-left-width:0px;"/>
		</div>
		
		<!--***BEGIN Line 10***-->
		<div style="width:187mm">
			<div class="styLNLeftNumBox" style="height:4.5mm;">10</div>
			<div class="styLNDesc" style="width:98.75mm;height:4.5mm;">
			   Multiply line 5 by 50% (0.50) 
			   <!-- Dotted Line -->
               <span style="letter-spacing:4mm; font-weight:bold; font-size:7pt; margin-left:2mm;">............</span> 
			</div>
			<div class="styLNRightNumBox" style="height:4.5mm;">10</div>
			<div class="styLNAmountBox" style="height:4.5mm;padding-right:1mm;">
				<xsl:call-template name="PopulateAmount">
					<xsl:with-param name="TargetNode" select="$Form6765Data/HalfAdjTotQlfyRsrchExpnssAmt"/>
				</xsl:call-template>
			</div>
			<div class="styLNRightNumBoxNBB" style="width:8.25mm;height:4.5mm;border-right-width:1px;background-color:lightgrey"/>
			<div class="styLNAmountBoxNBB" style="height:4.5mm;border-right-width:0px;border-left-width:0px;"/>
		</div>
		
		<!--***BEGIN Line 11***-->
		<div style="width:187mm">
			<div class="styLNLeftNumBox" style="height:4.5mm;">11</div>
			<div class="styLNDesc" style="width:138.75mm;height:4.5mm;">
				Enter the <span>smaller</span> of line 9 or line 10  
			    <!-- Dotted Line -->
                <span style="letter-spacing:4mm; font-weight:bold; font-size:7pt; margin-left:2mm;">..................</span> 
			</div>
			<div class="styLNRightNumBox" style="height:4.5mm;">11</div>
			<div class="styLNAmountBox" style="height:4.5mm;padding-right:1mm;">
				<xsl:call-template name="PopulateAmount">
					<xsl:with-param name="TargetNode" select="$Form6765Data/SmallerQlfyResearchExpnssAmt"/>
				</xsl:call-template>
			</div>
		</div>
					
		<!--***BEGIN Line 12***-->
		<div style="width:187mm">
			<div class="styLNLeftNumBox" style="height:4.5mm;">12</div>
			<div class="styLNDesc" style="width:138.75mm;height:4.5mm;">
				Add lines 1, 4,  and 11 
				<!-- Dotted Line -->
				<span style="letter-spacing:4mm; font-weight:bold; font-size:7pt; margin-left:2mm;">......................</span> 
			</div>
			<div class="styLNRightNumBox" style="height:4.5mm;">12</div>
			<div class="styLNAmountBox" style="height:4.5mm;padding-right:1mm;">
				<xsl:call-template name="PopulateAmount">
					<xsl:with-param name="TargetNode" select="$Form6765Data/RsrchExpensesPlusRsrchPymtsAmt"/>
				</xsl:call-template>
			</div>
		</div>
		
		<!--***BEGIN Line 13***-->
		<div style="width:187mm">
			<div class="styLNLeftNumBox" style="height:7.5mm;">13</div>
			<div class="styLNDesc" style="width:138.75mm;height:7.5mm;">
				If you elect to reduce the credit under section 280C, then multiply line 12 by 15.8% (0.158). If not,<br/>
				multiply line 12 by 20% (0.20) and see instructions for the statement that must be attached
			<!-- Form to Form Link -->
				<xsl:call-template name="SetFormLinkInline">
					<xsl:with-param name="TargetNode" select="$Form6765Data/RegularCreditAmt"/>
				</xsl:call-template>
			<!-- Dotted Line -->
              <span style="letter-spacing:4mm; font-weight:bold; font-size:7pt; margin-left:2mm;">...</span> 
			</div>
						
			<div class="styLNRightNumBox" style="height:7.5mm;padding-top:4mm;border-bottom-width:0px;">13</div>
			<div class="styLNAmountBox" style="height:7.5mm;padding-right:1mm;padding-top:4mm;border-bottom-width:0px;">
				<xsl:call-template name="PopulateAmount">
					<xsl:with-param name="TargetNode" select="$Form6765Data/RegularCreditAmt"/>
				</xsl:call-template>
			</div>										
		</div>	
		<!--///END Section A - REGULAR CREDIT///-->
		<!--////////////////////////////////////-->
		
		<!--***BEGIN Section B - ALTERNATIVE SIMPLIFIED CREDIT***-->
		<div class="styBB" style="width:187mm;border-top-width:1px;height:8mm;padding-top:2mm;">
			<div class="styPartDesc" style="font-size:7pt;padding-left:0mm;">Section B—Alternative Simplified Credit.
				<span class="styNormalText">Skip this section if you are completing Section A. </span>
			</div>
		</div>
		
		<!--***BEGIN Line 14***-->
		<div style="width:187mm;">
			<div class="styLNLeftNumBox" style="height:4.5mm;">14</div>
			<div class="styLNDesc" style="width:138.75mm;height:4.5mm;">
				Certain amounts paid or incurred to energy consortia (see the line 1 instructions)
				<!-- Dotted Line -->
				<span style="letter-spacing:4mm; font-weight:bold; font-size:7pt; margin-left:2mm;">.......</span> 
			</div>
			<div class="styLNRightNumBox" style="width:8.25mm;height:4.5mm;border-right-width:1px;">14</div>
			<div class="styLNAmountBox" style="height:4.5mm;padding-right:1mm;border-right-width:0px;border-left-width:0px;">
				<xsl:call-template name="PopulateAmount">
					<xsl:with-param name="TargetNode" select="$Form6765Data/AltEnergyConsortiaAmt"/>
				</xsl:call-template>
			</div>
		</div>
		
		<!--***BEGIN Line 15***-->
		<div style="width:187mm">
			<div class="styLNLeftNumBox" style="height:4.5mm;padding-top:3mm;">15</div>
			<div class="styLNDesc" style="width:98.75mm;height:4.5mm;padding-top:3mm;">
				Basic research payments to qualified organizations (see the line 2 instructions)
			</div>
			<div class="styLNRightNumBox" style="height:7.5mm;padding-top:3mm;">15</div>
			<div class="styLNAmountBox" style="height:7.5mm;padding-top:3mm;padding-right:1mm;">
				<xsl:call-template name="PopulateAmount">
					<xsl:with-param name="TargetNode" select="$Form6765Data/AltBasicResearchPaymentAmt"/>
				</xsl:call-template>
			</div>
			<div class="styLNRightNumBoxNBB" style="width:8.25mm;height:7.5mm;border-right-width:1px;background-color:lightgrey"/>
			<div class="styLNAmountBoxNBB" style="height:7.5mm;border-right-width:0px;border-left-width:0px;"/>
		</div>
		
		<!--***BEGIN Line 16***-->
		<div style="width:187mm">
			<div class="styLNLeftNumBox" style="height:4.5mm;">16</div>
			<div class="styLNDesc" style="width:98.75mm;height:4.5mm;">
			  Qualified organization base period amount (see the line 3 instructions)
			   <!-- Dotted Line -->
               <span style="letter-spacing:3mm; font-weight:bold; font-size:7pt; margin-left:2mm;">..</span> 
            </div>
			<div class="styLNRightNumBox" style="height:4.5mm;">16</div>
			<div class="styLNAmountBox" style="height:4.5mm;padding-right:1mm;">
				<xsl:call-template name="PopulateAmount">
					<xsl:with-param name="TargetNode" select="$Form6765Data/AltBasePeriodAmt"/>
				</xsl:call-template>
			</div>
			<div class="styLNRightNumBoxNBB" style="width:8.25mm;height:4.5mm;border-right-width:1px;background-color:lightgrey"/>
			<div class="styLNAmountBoxNBB" style="height:4.5mm;border-right-width:0px;border-left-width:0px;"/>
		</div>
		
		<!--***BEGIN Line 17***-->
		<div style="width:187mm">
			<div class="styLNLeftNumBox" style="height:4.5mm;">17</div>
			<div class="styLNDesc" style="width:138.75mm;height:4.5mm;">
			  Subtract line 16 from line 15. If zero or less, enter -0- 
			   <!-- Dotted Line -->
               <span style="letter-spacing:4mm; font-weight:bold; font-size:7pt; margin-left:2mm;">.............</span> 
			</div>
			<div class="styLNRightNumBox" style="height:4.5mm;">17</div>
			<div class="styLNAmountBox" style="height:4.5mm;padding-right:1mm;">
				<xsl:call-template name="PopulateAmount">
					<xsl:with-param name="TargetNode" select="$Form6765Data/AltPaymentMinusBaseAmt"/>
				</xsl:call-template>
			</div>
		</div>
		
		<!--***BEGIN Line 18***-->
		<div style="width:187mm">
			<div class="styLNLeftNumBox" style="height:4.5mm;">18</div>
				<div class="styLNDesc" style="width:138.75mm;height:4.5mm;">
					Add lines 14 and 17
				     <!-- Dotted Line -->
				     <span style="letter-spacing:4mm; font-weight:bold; font-size:7pt; margin-left:2mm;">......................</span> 
				</div>
			<div class="styLNRightNumBox" style="height:4.5mm;">18</div>
			<div class="styLNAmountBox" style="height:4.5mm;padding-right:1mm;">
				<xsl:call-template name="PopulateAmount">
					<xsl:with-param name="TargetNode" select="$Form6765Data/TotalSumEnergyAndNetBaseAmt"/>
				</xsl:call-template>
			</div>
		</div>
		
		<!--***BEGIN Line 19***-->
		<div style="width:187mm">
			<div class="styLNLeftNumBox" style="height:4.5mm;">19</div>
			<div class="styLNDesc" style="width:138.75mm;height:4.5mm;">
				 Multiply line 18 by 20% (0.20)
				  <!-- Dotted Line -->
                  <span style="letter-spacing:4mm; font-weight:bold; font-size:7pt; margin-left:2mm;">...................</span> 
			</div>
			<div class="styLNRightNumBox" style="height:4.5mm;">19</div>
			<div class="styLNAmountBox" style="height:4.5mm;padding-right:1mm;">
				<xsl:call-template name="PopulateAmount">
					<xsl:with-param name="TargetNode" select="$Form6765Data/TotalSumTimesTwentyPctAmt"/>
				</xsl:call-template>
			</div>
		</div>
		
		<!--***BEGIN Line 19 NOTE***-->
		<div style="width:187mm">
			<div class="styLNLeftNumBox" style="height:4.5mm;padding-left:2.5mm;"></div>
			<div class="styLNDesc" style="width:138.75mm;height:4.5mm;">
				<b>Note:</b> Complete Section F before going to line 20.
			</div>
			<div class="styLNRightNumBoxNBB" style="width:8.25mm;height:4.5mm;border-right-width:1px;background-color:lightgrey"></div>
			<div class="styLNAmountBoxNBB" style="height:4.5mm;border-right-width:0px;border-left-width:0px;"></div>
		</div>
		<!--///END Line 19 NOTE///-->		
		
		<!--***BEGIN Line 20***-->
		<div style="width:187mm">
			<div class="styLNLeftNumBox" style="height:7.5mm;padding-top:3.5mm;">20</div>
			<div class="styLNDesc" style="width:98.75mm;height:7.5mm;padding-top:3.5mm;">
			  Total qualified research expenses (QREs). Enter amount from line 48
				<!-- Dotted Line -->
				<span style="letter-spacing:3mm; font-weight:bold; font-size:7pt; margin-left:.5mm;">..</span> 
			</div>
			<div class="styLNRightNumBox" style="height:7.5mm;padding-top:4mm;">20</div>
			<div class="styLNAmountBox" style="height:7.5mm;padding-top:4mm;padding-right:1mm;">
				<xsl:call-template name="PopulateAmount">
					<xsl:with-param name="TargetNode" select="$Form6765Data/QlfyRsrchExpnssSummaryGrp/TotalQREAmt"/>
				</xsl:call-template>
			</div>
			<div class="styLNRightNumBoxNBB" style="width:8.25mm;height:7.5mm;border-right-width:1px;background-color:lightgrey"/>
			<div class="styLNAmountBoxNBB" style="height:7.5mm;border-right-width:0px;border-left-width:0px;"/>
		</div>
		
		<!--***BEGIN Line 21***-->
		<div style="width:187mm">
			<div class="styLNLeftNumBox" style="height:7.5mm;padding-top:1mm;">21</div>
			<div class="styLNDesc" style="width:98.75mm;height:7.5mm; padding-top:1mm;">
				Enter your total QREs for the prior 3 tax years. If you had no QREs in any 1 of those years, skip lines 22 and 23
				 <!-- Dotted Line -->
                 <span style="letter-spacing:4mm; font-weight:bold; font-size:7pt; margin-left:2mm;">...........</span> 
			</div>
			<div class="styLNRightNumBox" style="height:7.5mm;padding-top:4mm;">21</div>
			<div class="styLNAmountBox" style="height:7.5mm;padding-right:1mm;padding-top:4mm;">
				<xsl:call-template name="PopulateAmount">
					<xsl:with-param name="TargetNode" select="$Form6765Data/TotQlfyResearchExpns3PYAmt"/>
				</xsl:call-template>
			</div>
			<div class="styLNRightNumBoxNBB" style="width:8.25mm;height:7.5mm;border-right-width:1px;background-color:lightgrey"/>
			<div class="styLNAmountBoxNBB" style="height:7.5mm;border-right-width:0px;border-left-width:0px;"/>
		</div>
		
		<!--***BEGIN Line 22***-->
		<div style="width:187mm">
			<div class="styLNLeftNumBox" style="height:4.5mm;">22</div>
			<div class="styLNDesc" style="width:98.75mm;height:4.5mm;">
			 Divide line 21 by 6.0
			  <!-- Dotted Line -->
              <span style="letter-spacing:4mm; font-weight:bold; font-size:7pt; margin-left:2mm;">..............</span> 
			</div>
			<div class="styLNRightNumBox" style="height:4.5mm;">22</div>
			<div class="styLNAmountBox" style="height:4.5mm;padding-right:1mm;">
				<xsl:call-template name="PopulateAmount">
					<xsl:with-param name="TargetNode" select="$Form6765Data/TotQlfyResearchExpns3PYPctAmt"/>
				</xsl:call-template>
			</div>
			<div class="styLNRightNumBoxNBB" style="width:8.25mm;height:4.5mm;border-right-width:1px;background-color:lightgrey"/>
			<div class="styLNAmountBoxNBB" style="height:4.5mm;border-right-width:0px;border-left-width:0px;"/>
		</div>
		
		<!--***BEGIN Line 23***-->
		<div style="width:187mm;height:4.5mm;">
			<div class="styLNLeftNumBox" style="height:4.5mm;">23</div>
			<div class="styLNDesc" style="width:98.75mm;height:4.5mm;">
				Subtract line 22 from line 20. If zero or less, enter -0-  
				  <!-- Dotted Line -->
				  <span style="letter-spacing:4mm; font-weight:bold; font-size:7pt; margin-left:2.5mm;">.....</span> 
			</div>
			<div class="styLNRightNumBox" style="height:4.5mm;">23</div>
			<div class="styLNAmountBox" style="height:4.5mm;padding-right:1mm;">
				<xsl:call-template name="PopulateAmount">
					<xsl:with-param name="TargetNode" select="$Form6765Data/NetQlfyResearchExpns3PYPctAmt"/>
				</xsl:call-template>
			</div>
			<div class="styLNRightNumBoxNBB" style="width:8.25mm;height:4.5mm;border-right-width:1px;background-color:lightgrey"/>
			<div class="styLNAmountBoxNBB" style="height:7.5mm;border-right-width:0px;border-left-width:0px;"/>
		</div>
		
		<!--***BEGIN Line 24***-->
		<div style="width:187mm;">
			<div class="styLNLeftNumBox" style="height:4.5mm;">24</div>
			<div class="styLNDesc" style="width:138.75mm;height:4.5mm;">
				Multiply line 23 by 14% (0.14). If you skipped lines 22 and 23, multiply line 20 by 6% (0.06)
				<!-- Dotted Line -->
				<span style="letter-spacing:4mm; font-weight:bold; font-size:7pt; margin-left:2mm;">....</span> 
			</div>
			<div class="styLNRightNumBox" style="width:8.25mm;height:4.5mm;border-right-width:1px;">24</div>
			<div class="styLNAmountBox" style="height:4.5mm;padding-right:1mm;border-right-width:0px;border-left-width:0px;">
				<xsl:call-template name="PopulateAmount">
					<xsl:with-param name="TargetNode" select="$Form6765Data/NetQlfyResearchExpnsPctAmt"/>
				</xsl:call-template>
			</div>
		</div>
		
		<!--***BEGIN Line 25***-->
		<div style="width:187mm;">
			<div class="styLNLeftNumBox" style="height:4.5mm;">25</div>
			<div class="styLNDesc" style="width:138.75mm;height:4.5mm;">
				Add lines 19 and 24
				<!-- Dotted Line -->
				<span style="letter-spacing:4mm; font-weight:bold; font-size:7pt; margin-left:.5mm;">.......................</span> 
			</div>
			<div class="styLNRightNumBox" style="width:8.25mm;height:4.5mm;border-right-width:1px;">25</div>
			<div class="styLNAmountBox" style="height:4.5mm;padding-right:1mm;border-right-width:0px;border-left-width:0px;">
				<xsl:call-template name="PopulateAmount">
					<xsl:with-param name="TargetNode" select="$Form6765Data/TotalAltPctAmt"/>
				</xsl:call-template>
			</div>
		</div>
		
		<!--***BEGIN Line 26***-->
		<div style="width:187mm;">
			<div class="styLNLeftNumBox" style="height:7.5mm;">26</div>
			<div class="styLNDesc" style="width:138.75mm;height:7.5mm;">
				If you elect to reduce the credit under section 280C, then multiple line 25 by 79% (0.79). If not, enter the<br/>
				amount from line 25 and see line 13 instructions for the statement that must be attached
				<!-- Form to Form Link -->
				<xsl:call-template name="SetFormLinkInline">
					<xsl:with-param name="TargetNode" select="$Form6765Data/AltCreditAmt"/>
				</xsl:call-template>
				<!-- Dotted Line -->
				<span style="letter-spacing:3mm; font-weight:bold; font-size:7pt; margin-left:0mm;">....</span> 
			</div>
			<div class="styLNRightNumBox" style="width:8.25mm;height:7.5mm;padding-top:3.5mm;border-right-width:1px;border-bottom-width:0px;">26</div>
			<div class="styLNAmountBox" style="height:7.5mm;padding-right:1mm;padding-top:3.5mm;border-right-width:0px;border-left-width:0px;border-bottom-width:0px;">
				<xsl:call-template name="PopulateAmount">
					<xsl:with-param name="TargetNode" select="$Form6765Data/AltCreditAmt"/>
				</xsl:call-template>
			</div>
		</div>
	
	    <div style="width:187mm; border-style: solid; border-color: black; border-left-width: 0px; border-right-width: 0px; border-top-width: 1px; border-bottom-width: 0px" class="pageEnd">
            <div class="styGenericDiv" style="width:117mm;font-weight:bold;">For  Paperwork Reduction Act Notice, see separate instructions.</div>
            <div class="styGenericDiv" style="width:23mm;">Cat. No. 13700H</div>
            <div class="styGenericDiv" style="float:right;">Form <span class="styBoldText">6765</span> (Rev. 12-2024)</div>
        </div>
			<p style="page-break-before: always"/> 
		<!--///////-PAGE 1 END-///////-->	
		<!--//////////////////////////-->
			
		<!--*********************************************************************************-->	
		<!--**********************************-PAGE 2 BEGIN-*********************************-->
		<!--*********************************************************************************-->
		
		<!--***** BEGIN PAGE 2 PAGE HEADER***** -->
	    <div class="styBB" style="width:187mm;padding-top:.5mm;border-top-width:0px;border-bottom-width:0px;">  
            <div style="float:left;">Form 6765 (Rev. 12-2024)<span style="width:140mm;"></span></div>  
			<div style="float:right;">Page <span style="font-weight:bold;font-size:8pt;">2</span></div>
        </div>  
  		<!--///// END PAGE 2 PAGE HEADER/////// -->				

		<!-- *****-Begin Section Header Wrapper C-*****-->
		<div class="section-header-wrapper">
			<p><span class="section-header">Section C—Current Year Credit</span></p> 
		</div>
		
		<!--***BEGIN line 27***-->
		<div style="width:187mm;">
			<div class="styLNLeftNumBox" style="height:7.5mm;">27</div>
			<div class="styLNDesc" style="width:138mm;height:7.5mm;">
			   Enter the portion of the credit from Form 8932, line 2, that is attributable to wages that were also used to figure the credit on line 13 or line 26 (whichever applies)
				 <!-- Dotted Line -->
                 <span style="letter-spacing:4mm; font-weight:bold; font-size:7pt; margin-left:2mm;">.............</span> 
            </div>
            <div class="styLNRightNumBox" style="height:7.5mm;padding-top:4mm">27</div>
            <div class="styLNAmountBox" style="height:7.5mm;padding-right:1mm;padding-top:4mm;">
				<xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form6765Data/EmployerDiffWagePymtCrAmt"/>
                </xsl:call-template>
            </div>
        </div>
            <br></br>
            
		<!--***BEGIN line 28***-->
		<div style="width:187mm;">
			<div class="styLNLeftNumBox" style="height:auto;">28</div>
			<div class="styLNDesc" style="width:138mm;height:auto;">
			   Subtract line 27 from line 13 or line 26 (whichever applies). If zero or less, enter -0- 
			   <!-- Dotted Line -->
               <span style="letter-spacing:4mm; font-weight:bold; font-size:7pt; margin-left:2mm;">......</span> 
            </div>
            <div class="styLNRightNumBox" style="height:4.5mm;">28</div>
            <div class="styLNAmountBox" style="height:4.5mm;padding-right:1mm;">
				<xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form6765Data/NetEmployerDiffWagePymtCrAmt"/>
                </xsl:call-template>
            </div>
        </div>
        
		<!--***BEGIN line 29***-->
		<div style="width:187mm;">
			<div class="styLNLeftNumBox" style="height:auto;">29</div>
			<div class="styLNDesc" style="width:138mm;height:auto;">
				Credit for increasing research activities from partnerships, S corporations, estates, and trusts
				 <!-- Dotted Line -->
				  <span style="letter-spacing:4mm; font-weight:bold; font-size:7pt; margin-left:.5mm;">....</span> 
              </div>
							<div class="styLNRightNumBox" style="height:auto;">29</div>
							<div class="styLNAmountBox" style="height:auto;padding-right:1mm;">
								<xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form6765Data/ResearchActivitiesIncrCrAmt"/>
                </xsl:call-template>
              </div>
            </div>
            
        <!--***BEGIN line 30***-->
        <div style="width:187mm;">
            <div class="styLNLeftNumBox" style="height:auto;">30</div>
            <div class="styLNDesc" style="width:138mm;height:auto;">
					 Add lines 28 and 29. 
				 <br></br>
				<span style="padding-left:0mm"/>
					<img src="{$ImagePath}/990_Bullet_Round.gif" alt="RoundBullet"/>
						 Estates and trusts, go to line 31.<br></br>
				 <span style="padding-left:0mm"/>
					<img src="{$ImagePath}/990_Bullet_Round.gif" alt="RoundBullet"/>
						 Partnerships and S corporations not electing the payroll tax credit, stop here and report this amount on Schedule K.
				<br></br>
				<span style="padding-left:0mm"/>
					<img src="{$ImagePath}/990_Bullet_Round.gif" alt="RoundBullet"/>
						 Partnerships and S corporations electing the payroll tax credit, complete Section D and report on Schedule K the amount on this line reduced by the amount on line 36.
				<br></br>
				<span style="padding-left:0mm"/>
					<img src="{$ImagePath}/990_Bullet_Round.gif" alt="RoundBullet"/>
						 Eligible small businesses, stop here and report the credit on Form 3800, Part III, line 4i. See instructions for the definition of eligible small business.
				<br></br>
				<span style="padding-left:0mm"/>
					<img src="{$ImagePath}/990_Bullet_Round.gif" alt="RoundBullet"/>
						 Filers other than eligible small businesses, stop here and report the credit on Form 3800, Part III, line 1c.
				<br></br>
				<b>Note.</b> Qualified small business filers, other than partnerships and S corporations, electing the payroll tax credit must complete Form 3800 before completing Section D.
			</div>
            <div class="styLNRightNumBox" style="height:4.5mm;padding-top:1mm;">30</div>
            <div class="styLNAmountBox" style="height:4.5mm;padding-right:1mm;padding-top:1mm;">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form6765Data/CYResearchCreditAmt"/>
                </xsl:call-template>
            </div>
            <div class="styLNRightNumBox" style="height:30mm;background-color:lightgrey;border-bottom-width:0px;"></div>
            <div class="styLNAmountBox" style="height:30mm;border-bottom-width:0px;"></div>
        </div>
            
        <!--***BEGIN line 31***-->
        <div style="width:187mm;">
            <div class="styLNLeftNumBox" style="height:auto;">31</div>
            <div class="styLNDesc" style="width:138mm;height:auto;">
				Amount allocated to beneficiaries of the estate or trust (see instructions)
				 <!-- Dotted Line -->
				 <span style="letter-spacing:4mm; font-weight:bold; font-size:7pt; margin-left:2mm;">.........</span> 
            </div>
            <div class="styLNRightNumBox" style="height:auto;">31</div>
            <div class="styLNAmountBox" style="height:auto;padding-right:1mm;">
                <xsl:call-template name="PopulateAmount">
					<xsl:with-param name="TargetNode" select="$Form6765Data/EstateOrTrustAllocatedBenefAmt"/>
				</xsl:call-template>
			</div>
		</div>
		
        <!--***BEGIN line 32***-->
		<div class="styBB" style="width:187mm;float:none; clear:none;border-bottom-width:0px;">
            <div class="styLNLeftNumBox" style="height:auto;">32</div>
            <div class="styLNDesc" style="width:138mm;height:auto;">
            Estates and trusts, subtract line 31 from line 30. For eligible small businesses, 
            report the credit on Form 3800, Part III, line 4i. See instructions. 
            For filers other than eligible small businesses, report the credit on Form 3800, Part III, line 1c.          
                <!-- Dotted Line -->
				<span style="letter-spacing:4mm; font-weight:bold; font-size:7pt; margin-left:1mm;">......................</span>      
			</div>
			<div class="styLNRightNumBoxNBB" style="height:10mm;padding-top:7mm;">32</div>
			<div class="styLNAmountBoxNBB" style="height:10mm;padding-right:1mm;padding-top:7mm;">
				<xsl:call-template name="PopulateAmount">
					<xsl:with-param name="TargetNode" select="$Form6765Data/NetEstateOrTrustAllocBenefAmt"/>
				</xsl:call-template>
			</div>
		</div>
								
				<!-- %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%-->				
								
								
		<!-- *****-Begin Section Header Wrapper D-*****-->
		<div class="section-header-wrapper">
			<p><span class="section-header">Section D—Qualified Small Business Payroll Tax Election and Payroll Tax Credit.</span> Skip this section if the payroll tax election does not apply. See instructions.</p> 
		</div>
		
		
		
		<!--***BEGIN line 33a***-->
		<div style="width:187mm;">
			<div class="styLNLeftNumBox" style="height:4.5mm;padding-top:1.5mm;">33a</div>
			<div class="styLNDesc" style="width:138mm;height:4.5mm;">
			   Check this box if you are a qualified small business electing the payroll tax credit. See instructions
         
               <input type="checkbox" alt="Qualified Small Business Payroll Tax Credit Election Indicated"  class="styCkbox">
                    <xsl:call-template name="PopulateCheckbox">
                      <xsl:with-param name="TargetNode" select="$Form6765Data/PayrollTaxCreditElectionInd"/>
                      <xsl:with-param name="BackupName">IRS6765PayrollTaxCreditElectionInd</xsl:with-param>
                    </xsl:call-template>
               </input>
               <label style="float: right; clear: none;">
								<xsl:call-template name="PopulateLabel">
									<xsl:with-param name="TargetNode" select="$Form6765Data/PayrollTaxCreditElectionInd"/>
									<xsl:with-param name="BackupName">IRS6765PayrollTaxCreditElectionInd</xsl:with-param>
								</xsl:call-template>
							</label>
              </div>
              <div class="styLNRightNumBox" style="height:4.5mm;padding-top:1mm;background-color:lightgrey;border-right-width:1px;border-bottom-width:0px;"></div>
        </div>
            <br></br>
            
        <!--***BEGIN line 33b***-->
		<div style="width:187mm;">
			<div class="styLNLeftNumBox" style="height:4.5mm;padding-top:1.5mm;padding-left:4.5mm">b</div>
			<div class="styLNDesc" style="width:138mm;height:4.5mm;">
			   Check the box if payroll tax is reported on a different EIN 
				 <!-- Dotted Line -->
			     <span style="letter-spacing:4mm; font-weight:bold; font-size:7pt; margin-left:2.1mm;">..........</span>  
               <input type="checkbox" alt="Qualified Small Business Payroll Tax Credit Election Indicated"  class="styCkbox">
                    <xsl:call-template name="PopulateCheckbox">
                      <xsl:with-param name="TargetNode" select="$Form6765Data/PayrollTaxRptDifferentEINInd"/>
                      <xsl:with-param name="BackupName">IRS6765PayrollTaxRptDifferentEINInd</xsl:with-param>
                    </xsl:call-template>
               </input>
               <label style="float: right; clear: none;">
								<xsl:call-template name="PopulateLabel">
									<xsl:with-param name="TargetNode" select="$Form6765Data/PayrollTaxCreditElectionInd"/>
									<xsl:with-param name="BackupName">IRS6765PayrollTaxCreditElectionInd</xsl:with-param>
								</xsl:call-template>
							</label>
              </div>
              <div class="styLNRightNumBox" style="height:4.5mm;padding-top:1mm;background-color:lightgrey;border-right-width:1px;border-bottom-width:0px;"></div>
        </div>
            
        <!--***BEGIN line 34***-->
			<div style="width:187mm;">
				<div class="styLNLeftNumBox" style="height:4.5mm;">34</div>
				<div class="styLNDesc" style="width:138mm;height:4.5mm;">
				   Enter the portion of line 28 elected as a payroll tax credit (do not enter more than $500,000). See instructions
				   <!-- Dotted Line -->
				   <span style="letter-spacing:4mm; font-weight:bold; font-size:7pt; margin-left:2mm;"></span> 
				</div>
                <div class="styLNRightNumBox" style="height:4.5mm;width:7.75mm;padding-top:1mm">34</div>
                <div class="styLNAmountBox" style="height:4.5mm;padding-right:1mm;padding-top:1mm;">
					<xsl:call-template name="PopulateAmount">
					    <xsl:with-param name="TargetNode" select="$Form6765Data/PayrollTaxLimitationAmt"/>
					</xsl:call-template>
				</div>
            </div>
            <br></br>
            
        <!--***BEGIN line 35***-->
			<div style="width:187mm;">
				<div class="styLNLeftNumBox" style="height:7.5mm;">35</div>
				<div class="styLNDesc" style="width:138mm;height:7.5mm;">
				  General business credit carryforward from the current year. See instructions. Partnerships and S Corporations skip this line and go to line 36
					 <!-- Dotted Line -->
					 <span style="letter-spacing:4mm; font-weight:bold; font-size:7pt; ">....................</span> 
				 </div>
				 <div class="styLNRightNumBox" style="height:7.5mm;width:7.75mm;padding-top:4mm">35</div>
                 <div class="styLNAmountBox" style="height:7.5mm;padding-right:1mm;padding-top:4mm;">
					<xsl:call-template name="PopulateAmount">
						<xsl:with-param name="TargetNode" select="$Form6765Data/CYGeneralBusCrCarryfowardAmt"/>
					</xsl:call-template>
                </div>
            </div>
            <br></br>
            
        <!--***BEGIN line 36***-->
			<div style="width:187mm;">
				<div class="styLNLeftNumBox" style="height:13mm;">36</div>
				<div class="styLNDesc" style="width:138mm;height:13mm;">
					  Partnerships and S Corporations, enter the smaller of line 28 or line 34. 
					  All others, enter the smallest of line 28, line 34, or line 35. Enter here
					  and on the applicable line of Form 8974, Part 1, column (e). Members of controlled
					  groups or businesses under common control, see instructions for the statement that must be attached.
				 <!-- Dotted Line -->
				 <span style="letter-spacing:4mm; font-weight:bold; font-size:7pt; float:right;">........................</span> 
					<xsl:call-template name="SetFormLinkInline">
					    <xsl:with-param name="TargetNode" select="$Form6765Data/PayrollTaxCreditAmt"/>
					</xsl:call-template>
				</div>
                <div class="styLNRightNumBox" style="height:13mm;width:7.75mm;padding-top:9mm;border-bottom-width:0px;">36</div>
                <div class="styLNAmountBox" style="height:13mm;padding-right:1mm;padding-top:9mm;border-bottom-width:0px;">
					<xsl:call-template name="PopulateAmount">
					    <xsl:with-param name="TargetNode" select="$Form6765Data/PayrollTaxCreditAmt"/>
					</xsl:call-template>
                </div>
            </div>
        <!-- //////-END Section Header Wrapper D-//////-->
            
        <!-- *****-Begin Section Header Wrapper E-*****-->
		<div class="section-header-wrapper">
			<p><span class="section-header">Section E—Other Information.</span> See instructions.</p> 
		</div>
		
		
		
		<!--***BEGIN line 37***-->
		<div style="width:187mm">
			<div class="styLNLeftNumBox" style="height:4.5mm;padding-left:2.5mm;">37</div>
			<div class="styLNDesc" style="width:138.75mm;height:auto;"> 
				Enter the number of business components generating the QREs on line 5 or line 20  
			  <!-- Dotted Line -->
              <span style="letter-spacing:4mm; font-weight:bold; font-size:7pt; margin-left:1mm;">......</span> 
			</div>
			<div class="styLNRightNumBox" style="width:8.25mm;height:4.5mm;border-right-width:1px;">37</div>
			<div class="styLNAmountBox" style="height:4.5mm;padding-right:1mm;border-right-width:0px;border-left-width:0px;">
				<xsl:call-template name="PopulateAmount">
					<xsl:with-param name="TargetNode" select="$Form6765Data/BusComponentGeneratingQRECnt"/>
				</xsl:call-template>
			</div>
		</div>
            <br></br>
            
        <!--***BEGIN line 38***-->
		<div style="width:187mm">
			<div class="styLNLeftNumBox" style="height:4.5mm;padding-left:2.5mm;">38</div>
			<div class="styLNDesc" style="width:138.75mm;height:auto;"> 
				Enter the amount of officers’ wages included on line 42  
			  <!-- Dotted Line -->
              <span style="letter-spacing:4mm; font-weight:bold; font-size:7pt; margin-left:0mm;">..............</span> 
			</div>
			<div class="styLNRightNumBox" style="width:8.25mm;height:4.5mm;border-right-width:1px;">38</div>
			<div class="styLNAmountBox" style="height:4.5mm;padding-right:1mm;border-right-width:0px;border-left-width:0px;">
				<xsl:call-template name="PopulateAmount">
					<xsl:with-param name="TargetNode" select="$Form6765Data/OfficersWgsQlfyBusComponentAmt"/>
				</xsl:call-template>
			</div>
		</div>
            
        <!--***BEGIN line 39***-->
		<div style="width:187mm">
			<div class="styLNLeftNumBox" style="height:4.5mm;padding-left:2.5mm;padding-top:.25mm;">39</div>
			<div style="width:114.5mm;padding-bottom:1.25mm;">Did you acquire or dispose of any major portion of a trade or business in the tax year? 
			<!-- Dotted Line -->
              <span style="letter-spacing:1mm; font-weight:bold; font-size:7pt; margin-left:2mm;">.</span> 
			</div>
			<div style="width:31.75mm;">
		<!-- ***A-Yes*** -->	
			Yes
			<input type="Checkbox" class="styCkboxNM" alt="Acquire or Dispose Trade Business Indicator Yes">
			<xsl:call-template name="PopulateYesCheckbox">
				<xsl:with-param name="TargetNode" select="$Form6765Data/AcqOrDisposeTradeBusinessInd"/>
					<xsl:with-param name="BackupName">AcqOrDisposeTradeBusinessInd</xsl:with-param>
				</xsl:call-template>
			</input>
			<span style="width:3mm;"/>
		<!-- ***A-No*** -->
			No
			<input type="Checkbox" class="styCkboxNM" alt="Acquire or Dispose Trade Business Indicator No">
			<xsl:call-template name="PopulateNoCheckbox">
				<xsl:with-param name="TargetNode" select="$Form6765Data/AcqOrDisposeTradeBusinessInd"/>
				<xsl:with-param name="BackupName">AcqOrDisposeTradeBusinessInd</xsl:with-param>
			</xsl:call-template>
			</input>
			<div class="styLNRightNumBox" style="height:4.5mm;width:8.25mm;padding-top:1mm;background-color:lightgrey;border-right-width:1px;border-bottom-width:0px;float:right;"></div>
		    </div>
		    
		</div>
		
		<!--///END-line 39///-->
            <br></br>
            
        <!--***BEGIN line 40***-->
		<div style="width:187mm">
			<div class="styLNLeftNumBox" style="height:4.5mm;padding-left:2.5mm;padding-top:.25mm;">40</div>
			<div style="width:114.5mm;padding-bottom:1.25mm;">Did you include any new categories of expenses as current year QREs? 
			<!-- Dotted Line -->
              <span style="letter-spacing:3mm; font-weight:bold; font-size:7pt; margin-left:2mm;">......</span> 
			</div>
			<div style="width:31.75mm;">
		<!-- ***A-Yes*** -->	
			Yes
			<input type="Checkbox" class="styCkboxNM" alt="New Categories Expend QRE Indicator Yes">
			<xsl:call-template name="PopulateYesCheckbox">
				<xsl:with-param name="TargetNode" select="$Form6765Data/NewCategoriesExpendQREInd"/>
					<xsl:with-param name="BackupName">NewCategoriesExpendQREInd</xsl:with-param>
				</xsl:call-template>
			</input>
			<span style="width:3mm;"/>
		<!-- ***A-No*** -->
			No
			<input type="Checkbox" class="styCkboxNM" alt="New Categories Expend QRE Indicator No">
			<xsl:call-template name="PopulateNoCheckbox">
				<xsl:with-param name="TargetNode" select="$Form6765Data/NewCategoriesExpendQREInd"/>
				<xsl:with-param name="BackupName">NewCategoriesExpendQREInd</xsl:with-param>
			</xsl:call-template>
			</input>
			<div class="styLNRightNumBox" style="height:4.5mm;width:8.25mm;padding-top:1mm;background-color:lightgrey;border-right-width:1px;border-bottom-width:0px;float:right;"></div>
		    </div>
		</div>
		<!--///END-line 40///-->
            <br></br>
            
          <!--***BEGIN line 41***-LINE1-->
         <div style="width:187mm;height:3.25mm;">
				<div class="styLNLeftNumBox" style="height:4.5mm;padding-left:2.5mm;padding-top:.25mm;">41</div>
				<div style="width:114.5mm;">Did you determine any of the QREs on line 5 or line 20</div>
				<div style="width:31.75mm;">
<div class="styLNRightNumBox" style="height:3.25mm;width:8.25mm;padding-top:1mm;background-color:lightgrey;border-right-width:1px;border-bottom-width:0px;float:right;"></div></div>
			</div>
			   
        <!--***BEGIN line 41***-LINE2-->
		<div style="width:187mm">
			<div class="styLNLeftNumBox" style="height:4.5mm;padding-left:2.5mm;padding-top:.25mm;"></div>
			<div style="width:114.5mm;padding-bottom:1.25mm;">following the ASC 730 Directive? 
			<!-- Dotted Line -->
              <span style="letter-spacing:3mm; font-weight:bold; font-size:7pt; margin-left:2mm;">..................</span> 
			</div>
			<div style="width:31.75mm;">
		<!-- ***A-Yes*** -->	
			Yes
			<input type="Checkbox" class="styCkboxNM" alt="QRE ASC730 Directive Indicator Yes">
			<xsl:call-template name="PopulateYesCheckbox">
				<xsl:with-param name="TargetNode" select="$Form6765Data/QREASC730DirectiveInd"/>
					<xsl:with-param name="BackupName">QREASC730DirectiveInd</xsl:with-param>
				</xsl:call-template>
			</input>
			<span style="width:3mm;"/>
		<!-- ***A-No*** -->
			No
			<input type="Checkbox" class="styCkboxNM" alt="QRE ASC730 Directive Indicator No">
			<xsl:call-template name="PopulateNoCheckbox">
				<xsl:with-param name="TargetNode" select="$Form6765Data/QREASC730DirectiveInd"/>
				<xsl:with-param name="BackupName">QREASC730DirectiveInd</xsl:with-param>
			</xsl:call-template>
			</input>
			<div class="styLNRightNumBox" style="height:4.5mm;width:8.25mm;padding-top:1mm;background-color:lightgrey;border-right-width:1px;border-bottom-width:0px;float:right;"></div>
		    </div>
		</div>
		
		<!-- ***BEGIN Line 41 IF YES, Statement*** -->
		<div style="width:187mm">
			<div class="styLNLeftNumBox" style="height:12.5mm;padding-left:2.5mm;"></div>
			<div class="styLNDesc" style="width:138.75mm;height:auto;"> 
				If “Yes,” enter the amount from Appendix C Line 19 (you may attach your Appendices A, B, C, and D here)
				This ASC 730 Directive only applies to taxpayers with assets equal to or greater than $10,000,000
				who follow U.S. GAAP to prepare their Certified Audited Financial Statements showing the amount of
				currently expensed Financial Statement R&#38;D. See instructions.   
			</div>
			<div class="styLNRightNumBox" style="width:8.25mm;height:4.5mm;border-right-width:1px;">41</div>
			<div class="styLNAmountBox" style="height:4.5mm;padding-right:1mm;border-right-width:0px;border-left-width:0px;">
				<xsl:call-template name="PopulateAmount">
					<xsl:with-param name="TargetNode" select="$Form6765Data/QREAmt"/>
				</xsl:call-template>
			</div>
			<div class="styLNRightNumBox" style="height:8.5mm;width:8.25mm;padding-top:1mm;background-color:lightgrey;border-right-width:1px;border-bottom-width:0px;"></div>
		</div>	
        <!-- //////-END Section E-//////-->    
        
         <!-- *****-Begin Section Header Wrapper F-*****-->
		<div class="section-header-wrapper">
			<p><span class="section-header">Section F—Qualified Research Expenses Summary.</span> See instructions.</p> 
		</div>    
            
        <!-- ***BEGIN-SECTION-F-LINE-A-YES/NO*** -->
		<div class="styStdDiv" style="width:187mm;height:8mm;border-bottom:solid 1px;">
		  <div class="styLNLeftLtrBox" style="width:8mm; padding-left:0mm;padding-top:1mm;">A</div>
			<div style="width:152.5mm;padding-top:1mm;">
				Are you required to complete Section G? See instructions to determine if you are required to complete Section G, and how to 
				complete Section F if you are not required to complete Section G 
			<span style="letter-spacing:2.75mm; font-weight:bold; font-size:7pt; margin-left:0mm;">................</span>
			</div>
			<div style="width:22mm; float:none;padding-top:3.75mm;">
		<!-- ***B-Yes*** -->
			Yes
			<input type="Checkbox" class="styCkboxNM" alt="Section G Required Indicator Yes">
			<xsl:call-template name="PopulateYesCheckbox">
				<xsl:with-param name="TargetNode" select="$Form6765Data/QlfyRsrchExpnssSummaryGrp/SectionGRequiredInd"/>
					<xsl:with-param name="BackupName">SectionGRequiredInd</xsl:with-param>
				</xsl:call-template>
			</input>
			<span style="width:3mm;"/>
		<!-- ***B-No*** -->
			No
			<input type="Checkbox" class="styCkboxNM" alt="Section G Required Indicator No">
			<xsl:call-template name="PopulateNoCheckbox">
				<xsl:with-param name="TargetNode" select="$Form6765Data/QlfyRsrchExpnssSummaryGrp/SectionGRequiredInd"/>
				<xsl:with-param name="BackupName">SectionGRequiredInd</xsl:with-param>
			</xsl:call-template>
			</input>
			</div>
		</div>
		<!--///END-B///-->
		<!-- ***END-SECTION-F-LINE-A-YES/NO*** -->
		
		
		<!--***BEGIN Line 42***-->
		<div style="width:187mm">
			<div class="styLNLeftNumBox" style="height:7.5mm;">42</div>
			<div class="styLNDesc" style="width:138.75mm;height:4.5mm;">
			  Total wages for qualified services for all business components (do not include any wages used in figuring the work opportunity credit) 
			   <!-- Dotted Line -->
               <span style="letter-spacing:4mm; font-weight:bold; font-size:7pt; margin-left:2mm;">.....................</span> 
			</div>
			<div class="styLNRightNumBox" style="height:7.5mm;padding-top:4mm;">42</div>
			<div class="styLNAmountBox" style="height:7.5mm;padding-top:4mm;padding-right:1mm;">
				<xsl:call-template name="PopulateAmount">
					<xsl:with-param name="TargetNode" select="$Form6765Data/QlfyRsrchExpnssSummaryGrp/TotDrtQlfyServicesWagesAmt"/>
				</xsl:call-template>
			</div>
		</div>
		
		<!--***BEGIN Line 43***-->
		<div style="width:187mm">
			<div class="styLNLeftNumBox" style="height:4.5mm;">43</div>
				<div class="styLNDesc" style="width:138.75mm;height:4.5mm;">
					Total costs of supplies for all business components
				     <!-- Dotted Line -->
				     <span style="letter-spacing:4mm; font-weight:bold; font-size:7pt; margin-left:2mm;">..............</span> 
				</div>
			<div class="styLNRightNumBox" style="height:4.5mm;">43</div>
			<div class="styLNAmountBox" style="height:4.5mm;padding-right:1mm;">
				<xsl:call-template name="PopulateAmount">
					<xsl:with-param name="TargetNode" select="$Form6765Data/QlfyRsrchExpnssSummaryGrp/TotSuppliesCostAmt"/>
				</xsl:call-template>
			</div>
		</div>
		
		<!--***BEGIN Line 44***-->
		<div style="width:187mm">
			<div class="styLNLeftNumBox" style="height:4.5mm;">44</div>
			<div class="styLNDesc" style="width:138.75mm;height:4.5mm;">
				 Total rental or lease cost of computers for all business components
				  <!-- Dotted Line -->
                  <span style="letter-spacing:4mm; font-weight:bold; font-size:7pt; margin-left:3mm;">..........</span> 
			</div>
			<div class="styLNRightNumBox" style="height:4.5mm;">44</div>
			<div class="styLNAmountBox" style="height:4.5mm;padding-right:1mm;">
				<xsl:call-template name="PopulateAmount">
					<xsl:with-param name="TargetNode" select="$Form6765Data/QlfyRsrchExpnssSummaryGrp/TotRentalOrLeaseCmptrCostAmt"/>
				</xsl:call-template>
			</div>
		</div>
		
				
		
		<!--***BEGIN Line 45***-->
		<div style="width:187mm">
			<div class="styLNLeftNumBox" style="height:7.5mm;padding-top:1mm;">45</div>
			<div class="styLNDesc" style="width:98.75mm;height:7.5mm;padding-top:1mm;">
			Total applicable amount of contract research for all business components (do not include basic research payments).
				<!-- Dotted Line -->
				<span style="letter-spacing:3mm; font-weight:bold; font-size:7pt; margin-left:.5mm;">............</span> 
			</div>
			<div class="styLNRightNumBox" style="height:7.5mm;padding-top:4mm;">45</div>
			<div class="styLNAmountBox" style="height:7.5mm;padding-top:4mm;padding-right:1mm;">
				<xsl:call-template name="PopulateAmount">
					<xsl:with-param name="TargetNode" select="$Form6765Data/QlfyRsrchExpnssSummaryGrp/TotContractRsrchExpnssPctAmt"/>
				</xsl:call-template>
			</div>
			<div class="styLNRightNumBoxNBB" style="width:8.25mm;height:7.5mm;border-right-width:1px;background-color:lightgrey"/>
			<div class="styLNAmountBoxNBB" style="height:7.5mm;border-right-width:0px;border-left-width:0px;"/>
		</div>
		
		<!--***BEGIN Line 46***-->
		<div style="width:187mm;height:4.5mm;">
			<div class="styLNLeftNumBox" style="height:4.5mm;padding-top:1mm;">46</div>
			<div class="styLNDesc" style="width:98.75mm;height:5mm; padding-top:1mm;">
				Enter the applicable amount of all basic research payments. See instructions.
				 <!-- Dotted Line -->
                 <span style="letter-spacing:4mm; font-weight:bold; font-size:7pt; margin-left:2mm;"></span> 
			</div>
			<div class="styLNRightNumBox" style="height:4.5mm;padding-top:1mm;">46</div>
			<div class="styLNAmountBox" style="height:4.5mm;padding-right:1mm;padding-top:1mm;">
				<xsl:call-template name="PopulateAmount">
					<xsl:with-param name="TargetNode" select="$Form6765Data/QlfyRsrchExpnssSummaryGrp/ApplicableBasicRsrchPymtAmt"/>
				</xsl:call-template>
			</div>
			<div class="styLNRightNumBoxNBB" style="width:8.25mm;height:4.5mm;border-right-width:1px;background-color:lightgrey"/>
			<div class="styLNAmountBoxNBB" style="height:4.5mm;border-right-width:0px;border-left-width:0px;"/>
		</div>
		
		<!--***BEGIN Line 47***-->
		<div style="width:187mm;">
			<div class="styLNLeftNumBox" style="height:4.5mm;padding-top:1mm;">47</div>
			<div class="styLNDesc" style="width:138.75mm;height:4.5mm;padding-top:1mm;">
				Add line 45 and line 46
				<!-- Dotted Line -->
				<span style="letter-spacing:4mm; font-weight:bold; font-size:7pt; margin-left:1mm;">......................</span> 
			</div>
			<div class="styLNRightNumBox" style="width:8.25mm;height:4.5mm;border-right-width:1px;">47</div>
			<div class="styLNAmountBox" style="height:4.5mm;border-right-width:0px;border-left-width:0px;">
				<xsl:call-template name="PopulateAmount">
					<xsl:with-param name="TargetNode" select="$Form6765Data/QlfyRsrchExpnssSummaryGrp/TotCntrctBasicRsrchPymtAmt"/>
				</xsl:call-template>
			</div>
		</div>
		
		<!--***BEGIN Line 48***-->
		<div style="width:187mm;">
			<div class="styLNLeftNumBox" style="height:4.5mm;padding-top:1.25mm;">48</div>
			<div class="styLNDesc" style="width:138.75mm;height:4.5mm;padding-top:1.25mm;">
				Add lines 42, 43, 44, and 47, then enter line 48 on either line 5 or line 20, whichever is appropriate
			<!-- Dotted Line -->
				<span style="letter-spacing:3.5mm; font-weight:bold; font-size:7pt; margin-left:0mm;">...</span> 
			</div>
			<div class="styLNRightNumBox" style="width:8.25mm;height:4.5mm;border-right-width:1px;border-bottom-width:0px;padding-top:1.5mm;">48</div>
			<div class="styLNAmountBox" style="height:4.5mm;border-right-width:0px;border-left-width:0px;border-bottom-width:0px;padding-top:1.5mm;">
				<xsl:call-template name="PopulateAmount">
					<xsl:with-param name="TargetNode" select="$Form6765Data/QlfyRsrchExpnssSummaryGrp/TotalQREAmt"/>
				</xsl:call-template>
			</div>
		</div>
        <br></br>
		<!--///////////// END SECTION F \\\\\\\\\\\\\\  -->
		<!--Footer-->
		<div style="width:187mm; border-style: solid; border-color: black; border-left-width: 0px;  text-align:right; border-right-width: 0px; border-top-width: 1px; border-bottom-width: 0px" class="pageEnd">  
		<!--<div style="float:left;">
				<span class="styBoldText">For Paperwork Reduction Act Notice, see instructions </span>    
			</div> -->  
			Form <span class="styBoldText">6765</span>    (Rev. 12-2024)
		</div>
		<!-- ########## END OF PAGE 2 PAGE BREAK ############  -->	
		<p style="page-break-before: always"/> 	
		
		<!-- ########## START OF PAGE HEADER - PAGE 3 ########## -->
    <div class="header">
        <div>Form <span class="bold-6765">6765</span> (Rev. 12-2024)</div>
        <div>Page <span style="font-weight: bold;">3</span></div>
    </div>

    <!-- Section Header and Instruction Text on One Line, Wrapping at 187mm -->
    <div class="section-header-wrapper">
        <p><span class="section-header">Section G—Business Component Information.</span> Complete lines 49(a) through 49(f) for each business component you are required to report. See instructions. Attach additional sheets if necessary to capture all business components.</p>
    </div>

    <!-- Table 1 -->
    <table class="table1">
        <thead>
            <tr>
                <th class="border1pxnoleftborder"><span class="bold-number">BC</span></th>
                <th class="border4sides">
                    <span class="bold-number">49(a)</span> 
                    <span class="normal-weight">EIN of the controlled group member conducting the research activities on this business component</span>
                </th>
                <th class="border4sides">
                    <span class="bold-number">49(b)</span>
                    <span class="normal-weight">Controlled group member’s principal business activity code</span>
                </th>
                <th class="border4sides">
                    <span class="bold-number">49(c)</span>
                    <span class="normal-weight">Business component’s name or unique alphanumeric identifier (see instructions)</span>
                </th>
                <th class="border1pxnorightborder">
                    <span class="bold-number">49(d)</span>
                    <span class="normal-weight">Business component type (select one from available options)</span>
                </th>
            </tr>
        </thead>
        <tbody>
		<xsl:for-each select="$Form6765Data/BusinessComponentInfoGrp">
            <tr>
                <td class="border1pxnoleftborder">
					<xsl:number value="position()" format="1"/>
				</td>
				<!--******* Column 49(a) - EIN of the controlled group member conducting the research activities on this business component  ******* -->
                <td class="border4sides">
					<xsl:if test="$Form6765Data/BusinessComponentInfoGrp">
						<xsl:call-template name="PopulateEIN">
							<xsl:with-param name="TargetNode" select="ControlledGroupMemberEIN"/>
						</xsl:call-template>
					</xsl:if>
				</td>
				<!--******* Column 49(b) - Controlled group member’s principal business activity code  ******* -->	
                <td class="border4sides">
                <xsl:if test="$Form6765Data/BusinessComponentInfoGrp">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="PrincipalBusinessActivityCd"/>
						</xsl:call-template>
					</xsl:if>
                </td>
				<!--******* Column 49(c) - Business component’s name or unique alphanumeric identifier (see instructions)  ******* -->	
                <td class="border4sides">
                <xsl:if test="$Form6765Data/BusinessComponentInfoGrp">
						<xsl:call-template name="PopulateText">
							<xsl:with-param name="TargetNode" select="BusComponentNameOrUniqueIdTxt"/>
						</xsl:call-template>
					</xsl:if>
                </td>
				<!--******* Column 49(d) - Business component type (select one from available options)  ******* -->	
                <td class="border1pxnorightborder">
					<xsl:if test="$Form6765Data/BusinessComponentInfoGrp">
						<xsl:call-template name="PopulateText">
							<xsl:with-param name="TargetNode" select="BusinessComponentTypeCd"/>
						</xsl:call-template>
					</xsl:if>
                </td>
            </tr>
            
          </xsl:for-each>
        </tbody>
        <thead>
            <tr>
                <th class="border1pxnoleftborder"><span class="bold-number">BC</span></th>
                <th colspan="2" class="border4sides">
                    <span class="bold-number">49(e)</span>
                    <span class="normal-weight">Software (if applicable, select from the available options)</span>
                </th>
                <th colspan="2" class="border1pxnorightborder">
                    <span class="bold-number">49(f)</span>
                    <span class="normal-weight">Describe the information sought to be discovered. Use the space provided.</span>
                </th>
            </tr>
        </thead>
        <tbody>
        <xsl:for-each select="$Form6765Data/BusinessComponentInfoGrp">
            <tr>
                <td class="border1pxnoleftborder"><xsl:number value="position()" format="1"/></td>
                <!--******* Column 49(e) - Software (if applicable, select from the available options)  ******* -->
                <td colspan="2" class="border4sides">
                <xsl:if test="$Form6765Data/BusinessComponentInfoGrp">
						<xsl:call-template name="PopulateText">
							<xsl:with-param name="TargetNode" select="SoftwareCd"/>
						</xsl:call-template>
					</xsl:if>
                </td>
                <!--******* Column 49(f) - Describe the information sought to be discovered. Use the space provided.  ******* -->
                <td colspan="2" class="border1pxnorightborder">
                <xsl:if test="$Form6765Data/BusinessComponentInfoGrp">
						<xsl:call-template name="PopulateText">
							<xsl:with-param name="TargetNode" select="OtherInformationTxt"/>
						</xsl:call-template>
					</xsl:if>
                </td>
            </tr>
            </xsl:for-each>
            <tr class="bottom-row">
            </tr>
        </tbody>
    </table>

    <!-- Footer for Table 1 -->
    <div class="footer">
        Form <span class="bold-6765">6765</span> (Rev. 12-2024)
    </div>

    <!-- Page Break for Table 2 (Page 4) -->
    <p style="page-break-before: always"/> 	

    <!-- Page Header for Page 4 -->
    <div class="header">
        <div>Form <span class="bold-6765">6765</span> (Rev. 12-2024)</div>
        <div>Page <span style="font-weight: bold;">4</span></div>
    </div>

    <!-- Section Header for Table 2 with continued text -->
    <div class="section-header-wrapper">
        <p><span class="section-header">Section G—Business Component Information&nbsp;</span> <span class="italic">(continued).</span> Complete lines 50 through 56 for each business component. If you have more than fifteen business components, see instructions.</p>
    </div>

    <!-- Table 2 -->
    <table class="table2">
        <thead>
            <!-- First Row of Table 2 -->
            <tr>
                <th class="border1pxnoleftborder"><span class="bold-number">BC</span></th>
                <th class="border4sides"><span class="bold-number">50</span> <span class="normal-weight">Direct research wages for qualified services</span></th>
                <th class="border4sides"><span class="bold-number">51</span> <span class="normal-weight">Direct supervision wages for qualified services</span></th>
                <th class="border4sides"><span class="bold-number">52</span> <span class="normal-weight">Direct support wages for qualified services</span></th>
                <th class="border1pxnorightborder"><span class="bold-number">53</span> <span class="normal-weight">Total qualified wages (add line 50, line 51, and line 52)</span></th>
            </tr>
        </thead>
        <tbody>
			<xsl:for-each select="$Form6765Data/BusinessComponentInfoGrp">
            <tr>
				<td class="border1pxnoleftborder"><xsl:number value="position()" format="1"/></td>
				<!--******* Column 50 - Direct research wages for qualified services  ******* -->
                <td class="border4sides">
					<xsl:if test="$Form6765Data/BusinessComponentInfoGrp">
					<xsl:call-template name="PopulateAmount">
						<xsl:with-param name="TargetNode" select="DrtResearchWgsQlfySrvcAmt"/>
					</xsl:call-template>
					</xsl:if>
                </td>
                <!--******* Column 51 - Direct supervision wages for qualified services  ******* -->
                <td class="border4sides">
                    <xsl:if test="$Form6765Data/BusinessComponentInfoGrp">
					<xsl:call-template name="PopulateAmount">
						<xsl:with-param name="TargetNode" select="DrtResearchWgsQlfySrvcAmt"/>
					</xsl:call-template>
					
					</xsl:if>
                </td>
                <!--******* Column 52 - Direct support wages for qualified services  ******* -->
                <td class="border4sides">
					<xsl:if test="$Form6765Data/BusinessComponentInfoGrp">
					<xsl:call-template name="PopulateAmount">
						<xsl:with-param name="TargetNode" select="DrtQlfyServicesWagesAmt"/>
					</xsl:call-template>
					
					</xsl:if>
                </td>
                <!--******* Column 53 - Total qualified wages (add line 50, line 51, and line 52)  ******* -->
                <td class="border1pxnorightborder">
					<xsl:if test="$Form6765Data/BusinessComponentInfoGrp">
					<xsl:call-template name="PopulateAmount">
						<xsl:with-param name="TargetNode" select="SuppliesCostAmt"/>
					</xsl:call-template>
					
					</xsl:if>
                </td>
            <!-- Total from Attachments Row (aligned with First Row 2) -->
            </tr>
            </xsl:for-each>
            <!-- ///////////////////-Column BC - Total from attachments-\\\\\\\\\\\\\\\\\\\\\ -->
            <tr>
                <td class="border1pxnoleftborder">Total from attachments</td>
				<!--******* Column 50 - Total from attachments ******* -->
                <td class="border4sides">
					<xsl:call-template name="PopulateAmount">
						<xsl:with-param name="TargetNode" select="$Form6765Data/TotAggrgtQREDrtResearchWgsAmt"/>
					</xsl:call-template>
					
                </td>
				<!--******* Column 51 - Total from attachments ******* -->   
                <td class="border4sides">
					<xsl:call-template name="PopulateAmount">
						<xsl:with-param name="TargetNode" select="$Form6765Data/TotAggrgtQREDrtSprvsnWgsAmt"/>
					</xsl:call-template>
					
                </td>
                <!--******* Column 52 - Total from attachments ******* -->
                <td class="border4sides">
                    <xsl:call-template name="PopulateAmount">
						<xsl:with-param name="TargetNode" select="$Form6765Data/TotAggrgtQREDrtSupportWgsAmt"/>
					</xsl:call-template>
					
                </td>
                <!--******* Column 53 - Total from attachments ******* -->
                <td class="border1pxnorightborder">
                    <xsl:call-template name="PopulateAmount">
						<xsl:with-param name="TargetNode" select="$Form6765Data/TotAggrgtQREDrtQlfySrvcWgsAmt"/>
					</xsl:call-template>
					
                </td>
            </tr>
            <!-- ///////////////////-Column BC - Total Row-\\\\\\\\\\\\\\\\\\\\\-->
            <tr class="bottom-row">
                <td class="border1pxnoleftborder">Total</td>
                <!--******* Column 50 - Total Row *******-->
                <td class="border4sides">
					<xsl:call-template name="PopulateAmount">
						<xsl:with-param name="TargetNode" select="$Form6765Data/TotDrtResearchWgsQlfySrvcAmt"/>
					</xsl:call-template>
					
                </td>
                <!--******* Column 51 - Total Row *******-->
                <td class="border4sides">
					<xsl:call-template name="PopulateAmount">
						<xsl:with-param name="TargetNode" select="$Form6765Data/TotDrtSprvsnWgsQlfySrvcAmt"/>
					</xsl:call-template>
					
                </td>
                <!--******* Column 52 - Total Row *******-->
                <td class="border4sides">
                    <xsl:call-template name="PopulateAmount">
						<xsl:with-param name="TargetNode" select="$Form6765Data/TotDrtSupportWgsQlfySrvcAmt"/>
					</xsl:call-template>
					
                </td>
                <!--******* Column 53 - Total Row *******-->
                <td class="border1pxnorightborder">
                    <xsl:call-template name="PopulateAmount">
						<xsl:with-param name="TargetNode" select="$Form6765Data/TotDrtQlfyServicesWagesAmt"/>
					</xsl:call-template>
					
                </td>
            </tr>
        </tbody>
        <thead>
            <!-- Second Row of Table 2 with colspan=2 for 56 -->
            <tr>
                <th class="border1pxnoleftborder"><span class="bold-number">BC</span></th>
                <th class="border4sides"><span class="bold-number">54</span><span class="normal-weight">Cost of supplies</span><br/></th>
                <th class="border4sides"><span class="bold-number">55</span><span class="normal-weight">Rental or lease cost of computers</span></th>
                <th colspan="2" class="border1pxnorightborder"><span class="bold-number">56</span> <span class="normal-weight">Applicable amount of contract research expenses (see instructions for reporting basic research payments)</span></th>
            </tr>
        </thead>
        <tbody>
			<xsl:for-each select="$Form6765Data/BusinessComponentInfoGrp">
            <tr>
                <td class="border1pxnoleftborder">
                <xsl:number value="position()" format="1"/>
                </td>
                
                <!--******* Column 54 - Cost of supplies  ******* -->
                <td class="border4sides">
					<xsl:if test="$Form6765Data/BusinessComponentInfoGrp">
					<xsl:call-template name="PopulateAmount">
						<xsl:with-param name="TargetNode" select="SuppliesCostAmt"/>
					</xsl:call-template>
					
					</xsl:if>
                </td>
                
                <!--******* Column 55 - Rental or lease cost of computers  ******* -->
                <td class="border4sides">
					<xsl:if test="$Form6765Data/BusinessComponentInfoGrp">
					<xsl:call-template name="PopulateAmount">
						<xsl:with-param name="TargetNode" select="RentalOrLeaseCmptrCostAmt"/>
					</xsl:call-template>
					
					</xsl:if>
                </td>
                
                <!--******* Column 56 - Applicable amount of contract research expenses (see instructions for reporting basic research payments)  ******* -->
                <td colspan="2" class="border1pxnorightborder">
					<xsl:if test="$Form6765Data/BusinessComponentInfoGrp">
					<xsl:call-template name="PopulateAmount">
						<xsl:with-param name="TargetNode" select="ContractRsrchExpnssPctAmt"/>
					</xsl:call-template>
					
					</xsl:if>
                </td>
            </tr>
            </xsl:for-each>
            <!-- Total from Attachments Row (aligned with Second Row 2) -->
            <tr>
                <td class="border1pxnoleftborder">Total from attachments</td>
                <!--******* Column 54 - Total from attachments - Cost of supplies  ******* -->
                <td class="border4sides">
					<xsl:call-template name="PopulateAmount">
						<xsl:with-param name="TargetNode" select="$Form6765Data/TotAggrgtQRESuppliesCostAmt"/>
					</xsl:call-template>
					
                </td>
                <!--******* Column 55 - Total from attachments - Rental or lease cost of computers  ******* -->
                <td class="border4sides">
					<xsl:call-template name="PopulateAmount">
						<xsl:with-param name="TargetNode" select="$Form6765Data/TotAggrgtQRERntlLsCmptrCostAmt"/>
					</xsl:call-template>
					
                </td>
                <!--******* Column 56 - Total from attachments - Applicable amount of contract research expenses (see instructions for reporting basic research payments)  ******* -->
                <td colspan="2" class="border1pxnorightborder">
                    <xsl:call-template name="PopulateAmount">
						<xsl:with-param name="TargetNode" select="$Form6765Data/TotAggrgtQRECntrctRsrchAmt"/>
					</xsl:call-template>
					
                </td>
            </tr>
            <!-- Total Row (aligned with Second Row 2) -->
            <tr class="bottom-row">
                <td class="border1pxnoleftborder">Total</td>
                 <!--******* Column 54 - Total - Cost of supplies  ******* -->
                <td class="border4sides">
					<xsl:call-template name="PopulateAmount">
						<xsl:with-param name="TargetNode" select="$Form6765Data/TotSuppliesCostAmt"/>
					</xsl:call-template>
					
                </td>
                <!--******* Column 55 - Total - Rental or lease cost of computers  ******* -->
                <td class="border4sides">
					<xsl:call-template name="PopulateAmount">
						<xsl:with-param name="TargetNode" select="$Form6765Data/TotRentalOrLeaseCmptrCostAmt"/>
					</xsl:call-template>
					
                </td>
                <!--******* Column 56 - Total - Applicable amount of contract research expenses (see instructions for reporting basic research payments)  ******* -->
                <td colspan="2" class="border1pxnorightborder">
                    <xsl:call-template name="PopulateAmount">
						<xsl:with-param name="TargetNode" select="$Form6765Data/TotContractRsrchExpnssPctAmt"/>
					</xsl:call-template>
					
                </td>
            </tr>
        </tbody>
    </table>

    <!-- Footer for Table 2 -->
    <div class="footer">
        Form <span class="bold-6765">6765</span> (Rev. 12-2024)
    </div>
			
					
					<!-- BEGIN Left Over Table -->
					<!-- Additonal Data Title Bar and Button -->
					 <p style="page-break-before: always"/> 
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
							<xsl:with-param name="TargetNode" select="$Form6765Data"/>
							<xsl:with-param name="DescWidth" select="100"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRow">
							<xsl:with-param name="Desc">Line 16 - Reduced Credit Indicator</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$Form6765Data/RegularCredit/@reducedCreditIndicator"/>
							<xsl:with-param name="DescWidth" select="100"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRow">
							<xsl:with-param name="Desc">Line 39 - Reduced Credit Indicator</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$Form6765Data/AlternateIncrementalCredit/@reducedCreditIndicator"/>
							<xsl:with-param name="DescWidth" select="100"/>
						</xsl:call-template>
					</table>
					<!-- END Left Over Table -->
				</form>
			</body>
		</html>
	</xsl:template>
</xsl:stylesheet>
