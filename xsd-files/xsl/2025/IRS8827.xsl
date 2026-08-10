<?xml version="1.0" encoding="UTF-8"?>
  <xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:include href="PopulateTemplate.xsl"/>
    <xsl:include href="AddHeader.xsl"/>
    <xsl:include href="CommonPathRef.xsl"/>
    <xsl:include href="AddOnTable.xsl"/>
    <xsl:include href="IRS8827Style.xsl"/>
    <xsl:output method="html" indent="yes"/>
    <xsl:strip-space elements="*"/>
    <xsl:param name="Form8827Data" select="$RtnDoc/IRS8827"/>
    <xsl:template match="/">
      <xsl:text disable-output-escaping="yes">&lt;!DOCTYPE html&gt;</xsl:text>
	  <html lang="EN-US">
        <head>
		  <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
          <title>
            <xsl:call-template name="FormTitle">
              <xsl:with-param name="RootElement" select="local-name($Form8827Data)"/>
            </xsl:call-template>
          </title>
          <!-- No Browser Caching  -->
          <meta http-equiv="Pragma" content="no-cache"/>
          <meta http-equiv="Cache-Control" content="no-cache"/>
          <meta http-equiv="Expires" content="0"/>
          <!-- No Proxy Caching -->
          <meta http-equiv="Cache-Control" content="private"/>
          <!-- Define Character Set -->
          <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1"/>
          <meta name="Description" content="IRS Form 8827"/>
          <script language="JavaScript" src="{$ScriptPath}/FormDisplay.js" type="text/javascript"/>
          <xsl:call-template name="InitJS"/>
          <style type="text/css">
            <xsl:if test="not($Print) or $Print=''">
              <!--HINTS:  Form 8827 CSS Styles are located in the template called below    
			                   Work sheet (Page 2 of PDF) Do not need to be display per customer-->
              <xsl:call-template name="IRS8827Style"/>
              <xsl:call-template name="AddOnStyle"/>
            </xsl:if>
          </style>
          <xsl:call-template name="GlobalStylesForm"/>
        </head>
        <body class="styBodyClass" style="width:187mm;">
          <form name="Form8827">
            <xsl:call-template name="DocumentHeader"/>
            <!-- Begin Form Number and Name -->
            <div class="styBB" style="width:187mm;">
              <div class="styFNBox" style="width:31mm; height:24mm;">
                Form <span class="styFormNumber">8827</span><br/>(Rev. December 2024)
                <!--General Dependency Push Pin --> 
                <xsl:call-template name="SetFormLinkInline">
                  <xsl:with-param name="TargetNode" select="$Form8827Data"/>
                </xsl:call-template>
                <br/>
                <br/>
                <span class="styAgency">Department of the Treasury</span>
                <br/>
                <span class="styAgency">Internal Revenue Service</span>
              </div>
              <div class="styFTBox" style="width:123mm; height:18mm;">
                <div class="styMainTitle" style="height:8mm; padding-top:1mm;">
                  Credit for Prior Year Minimum Tax-Corporations
                </div>
                <div class="styFST" style="height:5mm; font-size:7pt; padding-top:2mm;">
                  
                  Attach to the corporation's tax return.
                </div>
                <div class="styFST" style="height:5mm; font-size:7pt; padding-top:2mm; font-size:6.5pt;">
                  
                  Go to 
			      <a style="text-decoration:none; color:black;" href="http://www.irs.gov/form8827" title="Link to IRS.gov">
					<i>www.irs.gov/Form8827</i>
				  </a> for the latest information.             
                </div>
              </div>
              <div class="styTYBox" style="width:32mm; height:24mm;">
                <div  style="height:4mm; width:32mm;padding-top:9mm">
                  OMB No. 1545-0123
                </div>
                </div>
            </div>
            <!-- End Form Number and Name section -->
            <!-- Begin Names and Identifying number section -->
            <div class="styBB" style="width:187mm;">
              <div class="styNameBox" style="width:140.75mm; height:10mm; font-size:7pt;">
                Name<br/>
                <span style="font-size: 7pt; font-weight:normal;">
				  <xsl:call-template name="PopulateFilerName">
			        <xsl:with-param name="TargetNode" select="$Form8827Data"/>
				  </xsl:call-template> 				
			    </span>
              </div>
              <!--EIN-->
              <div class="styEINBox" style="width:46mm; height:4mm; font-size:7pt; float:left; padding-left:1mm;">
                Employer identification number
                <br/>
                <br/>
                <span style="font-weight:normal">
				  <xsl:call-template name="PopulateFilerTIN">
				    <xsl:with-param name="TargetNode" select="$Form8827Data"/>
				  </xsl:call-template>
			    </span>
              </div>
            </div>
            <!-- End Names and Identifying number section -->
            <!--Blank Line-->
            <div class="styBB" style="width:187mm;">
            <!--L1-->
                <div style="width:187mm;">
              <div class="styLNLeftNumBox">1</div>
              <div class="styLNDesc" style="width:138.75mm;">Alternative minimum tax (AMT) for prior year. Enter the amount from Part II, line 13, of the corporation’s prior year Form 4626
                <!--Dotted Line-->
                <div class="styDotLn" style="float:right;padding-right:1mm;">............................</div>
              </div>
                 <div class="styLNRightNumBox" style="height:7mm; padding-top:3mm; padding-right:0mm;" >1</div>
                  <div class="styLNAmountBox" style="height:7mm; padding-top:0mm;">
                <br/>
                <xsl:call-template name="PopulateAmount">
					<xsl:with-param name="TargetNode" select="$Form8827Data/PYCorpAlternativeMinimumTaxAmt"/>
                </xsl:call-template>
              </div>
            </div>
            <!--L2-->
            <div style="width:187mm">
              <div class="styLNLeftNumBox">2</div>
              <div class="styLNDesc" style="width:138.75mm;">
                Reserved for future use  
                <span style="width:1px;"/>     
                <!--Dotted Line-->
                <div class="styDotLn" style="float:right; padding-right:1mm;">..........................</div>
                <!--Dotted Line-->
              </div>
              <div class="styLNRightNumBox">2</div>
              <div class="styLNAmountBox styShadingCell">
              </div>
            </div>
            <!--L3-->
            <div style="width:187mm">
			 <div class="styLNLeftNumBox">3</div>
              <div class="styLNDesc" style="width:138.75mm;">
                Add lines 1 and 2. 
				  <!--Push Pin-->
                  <xsl:call-template name="SetFormLinkInline">
				    <xsl:with-param name="TargetNode" select="$Form8827Data/PYCorpAlternativeMinimumTaxAmt"/>
				  </xsl:call-template>    
                  <span style="width:1px;"/>     
                <!--Dotted Line-->
                <div class="styDotLn" style="float:right; padding-right:1mm;">...........................</div>
                <!--Dotted Line-->
              </div>
              <div class="styLNRightNumBox">3</div>
              <div class="styLNAmountBox">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form8827Data/PYCorpAlternativeMinimumTaxAmt"/>
                </xsl:call-template>
              </div>
            </div>
            <!--L4-->
            <div style="width:187mm;">
              <div class="styLNLeftNumBox">4</div>
              <div class="styLNDesc" style="width:138.75mm;">Regular income tax for current year. Enter the corporation's regular tax liability for the current tax year, as defined in section 26(b) (including any positive section 6226 adjustment from Form 8978)
              </div>
              <div class="styLNRightNumBox" style="height:7mm; padding-top:3mm;">4</div>
              <div class="styLNAmountBox" style="height:7mm; padding-top:3mm;">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form8827Data/RegularTaxLiabilityAmt"/>
                </xsl:call-template>
              </div>
            </div>
            <!--L5-->
            <div style="width:187mm;">
              <div class="styLNLeftNumBox">5</div>
              <div class="styLNDesc" style="width:138.75mm;">Base erosion minimum tax for current year. Enter the corporation's tax imposed under section 59A for the current tax year
                <!--Dotted Line-->
                <div class="styDotLn" style="float:right;padding-right:1mm;">............................</div>
              </div>
			  <div class="styLNRightNumBox" style="height:7mm; padding-top:3mm;">5</div>	
			  <div class="styLNAmountBox" style="height:7mm; padding-top:3mm;">		
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form8827Data/BaseErosionMinimumTaxAmt"/>
                </xsl:call-template>
              </div>
            </div>
            <!--L6-->
            <div style="width:187mm;">
              <div class="styLNLeftNumBox">6</div>
              <div class="styLNDesc" style="width:138.75mm;">Add lines 4 and 5
                <!--Dotted Line-->
                <div class="styDotLn" style="float:right;padding-right:1mm;">............................</div>
              </div>
              <div class="styLNRightNumBox">6</div>
			  <div class="styLNAmountBox">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form8827Data/CombinedTaxLiabilityAmt"/>
                </xsl:call-template>
              </div>
            </div>
            <!--L7-->
            <div style="width:187mm;">
              <div class="styLNLeftNumBox">7</div>
              <div class="styLNDesc" style="width:138.75mm;">Enter allowable credits for the current tax year. See instructions
                <!--Dotted Line-->
                <div class="styDotLn" style="float:right;padding-right:1mm;">.............</div>
              </div>
              <div class="styLNRightNumBox">7</div>
			  <div class="styLNAmountBox">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form8827Data/AllowedCreditsAmt"/>
                </xsl:call-template>
              </div>
            </div>
            <!--L8-->
            <div style="width:187mm;">
              <div class="styLNLeftNumBox">8</div>
              <div class="styLNDesc" style="width:138.75mm;">Section 53(c)(1) limitation. Subtract line 7 from line 6
                <!--Dotted Line-->
                <div class="styDotLn" style="float:right;padding-right:1mm;">................</div>
              </div>
              <div class="styLNRightNumBox">8</div>
			  <div class="styLNAmountBox">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form8827Data/Section53c1LimitationAmt"/>
                </xsl:call-template>
              </div>
            </div>
            <!--L9-->
            <div style="width:187mm;">
              <div class="styLNLeftNumBox">9</div>
              <div class="styLNDesc" style="width:138.75mm;">Enter the tentative minimum tax from Part II, line 9, of the current year Form 4626
                <!--Dotted Line-->
                <div class="styDotLn" style="float:right;padding-right:1mm;">......</div>
              </div>
              <div class="styLNRightNumBox">9</div>
			  <div class="styLNAmountBox">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form8827Data/TentativeMinimumTaxAmt"/>
                </xsl:call-template>
              </div>
            </div>
            <!--L10-->
            <div style="width:187mm;">
              <div class="styLNLeftNumBox">10</div>
              <div class="styLNDesc" style="width:138.75mm;">Subtract line 9 from line 8. If zero or less, enter -0-.
                <!--Dotted Line-->
                <div class="styDotLn" style="float:right;padding-right:1mm;">.................</div>
              </div>
              <div class="styLNRightNumBox">10</div>
			  <div class="styLNAmountBox">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form8827Data/LmtLessTentativeMinimumTaxAmt"/>
                </xsl:call-template>
              </div>
            </div>
            <!--L11-->
            <div style="width:187mm;">
              <div class="styLNLeftNumBox">11</div>
              <div class="styLNDesc" style="width:138.75mm;"><b>Current year minimum tax credit.</b> Enter the smaller of line 10 or line 3 here and on Form 1120, Schedule J, line 5d (or the applicable line of your return). Check if the corporation had a section 382 ownership change or has pre-acquisition excess credits, : (a)  
								    <span style="padding-left:1mm;">
										<input type="checkbox" alt="Section 383 Indicator" class="styCkbox">
											<xsl:call-template name="PopulateCheckbox">
												<xsl:with-param name="TargetNode" select="$Form8827Data/Section383Ind"/>
												<xsl:with-param name="BackupName">Section383Ind</xsl:with-param>
											</xsl:call-template>
										</input>
									</span> Section 383  (b) 
									<span style="padding-left:1mm;">
										<input type="checkbox" alt="Section 384 Indicator" class="styCkbox">
											<xsl:call-template name="PopulateCheckbox">
												<xsl:with-param name="TargetNode" select="$Form8827Data/Section384Ind"/>
												<xsl:with-param name="BackupName">Section384Ind</xsl:with-param>
											</xsl:call-template>
										</input>
									</span>									
									 Section 384. See instructions
              						<span style="width:3px;"/>
								<xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode" select="$Form8827Data/ComputationOfMinimumTaxCreditStmt"/>
									<xsl:with-param name="IDstring">Form8827Data</xsl:with-param>
									</xsl:call-template>
                <!--Dotted Line-->
                <div class="styDotLn" style="float:right;padding-right:1mm;">..</div>
              </div>
              <div class="styLNRightNumBox" style="height:10mm; padding-top:6mm;">11</div>
			  <div class="styLNAmountBox" style="height:10mm; padding-top:6mm;">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form8827Data/CurrentYearMinimumTaxCreditAmt"/>
                </xsl:call-template>
              </div>
            </div>
            <!--L12-->
            <div style="width:187mm;">
              <div class="styLNLeftNumBox">12</div>
              <div class="styLNDesc" style="width:138.75mm;"><b>Minimum tax credit carryforward to next year.</b> Subtract line 11 from line 3. Keep a record of this amount to carry forward and use in future years
                <!--Dotted Line-->
                <div class="styDotLn" style="float:right;padding-right:1mm;">.....................</div>
              </div>
              <div class="styLNRightNumBox" style="height:7mm; padding-top:3mm;">12</div>
			  <div class="styLNAmountBox" style="height:7mm; padding-top:3mm;">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form8827Data/MinimumTaxCreditCarryfowardAmt"/>
                </xsl:call-template>
              </div>
            </div>
          </div>
          <!--Page Footer -->
  		  <div style="width:110mm; font-weight:bold;" class="styGenericDiv">For Paperwork Reduction Act Notice, see instructions.</div>
          <div style="width:77mm; text-align:left;">                            
            Cat. No. 13008K        
            <span style="width:75px;"/>  
            Form <span class="styBoldText">8827</span>
           (Rev. 12-2024) 
          </div>
          <br/>
          <!--Page break -->
          <div class="pageEnd" style="width:187mm; padding-top:1mm;">
						<div style="float:right;">
							<span style="width:80px;"/>  
							<!--  Form <span class="styBoldText" style="font-size:8pt;">1120&#8211;S</span> (2020)-->
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
          	<!-- ****************************Additional Data Table **********************************-->
					<table class="styLeftOverTbl">
						<xsl:call-template name="PopulateCommonLeftover">
							<xsl:with-param name="TargetNode" select="  $RtnDoc/IRS8827"/>
							<xsl:with-param name="DescWidth" select="100"/>
						</xsl:call-template>
						<!-- Removed per UWR 863136
						<xsl:call-template name="PopulateLeftoverRow">
							<xsl:with-param name="Desc">Line 3 section 383 Or 384 Indicator Code </xsl:with-param>
							<xsl:with-param name="TargetNode" select="  $RtnDoc/IRS8827/CurrentYearMinimumTaxCreditAmt /@section383Or384IndicatorCd"/>
							<xsl:with-param name="DescWidth" select="100"/>
						</xsl:call-template>
-->
			</table>
					<!-- ****************************END Left Over Table *******************************-->
           </form>
      </body>
    </html>
  </xsl:template> 
</xsl:stylesheet>