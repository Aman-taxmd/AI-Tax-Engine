<?xml version="1.0" encoding="UTF-8"?>
<!-- Last Modified by Doyle Roach on 05/19/2025 R10.9 drop 2 UWR # 997444 -->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
<xsl:include href="CommonPathRef.xsl"/>
<xsl:include href="PopulateTemplate.xsl"/>
<xsl:include href="AddHeader.xsl"/>
<xsl:include href="AddOnTable.xsl"/>
<xsl:include href="IRS8908Style.xsl"/>

<xsl:output method="html" indent="yes"/>
<xsl:strip-space elements="*"/>

<xsl:param name="Form8908" select="$RtnDoc/IRS8908"/>
  
<xsl:template match="/">

<xsl:text disable-output-escaping="yes">&lt;!DOCTYPE html&gt;</xsl:text>
		<html>
  <head>
				<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
  <title><xsl:call-template name="FormTitle"><xsl:with-param name="RootElement" select="local-name($Form8908)"/></xsl:call-template></title>
  <!-- No Browser Caching -->
  <meta http-equiv="Pragma" content="no-cache"/>
  <meta http-equiv="Cache-Control" content="no-cache"/>
  <meta http-equiv="Expires" content="0"/>
  <!-- No Proxy Caching -->
  <meta http-equiv="Cache-Control" content="private"/>
  <!-- Define Character Set -->
  <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1"/>
  <meta name="Description" content="IRS Form 8908"/>
  
  <xsl:call-template name="InitJS"/>
  <script language="JavaScript" src="{$ScriptPath}/FormDisplay.js" type="text/javascript"/>
  
  <style type="text/css">
   <xsl:if test="not($Print) or $Print=''">
       <xsl:call-template name="IRS8908Style"/>  
      <xsl:call-template name="AddOnStyle"/>
    </xsl:if>
  </style>
  <xsl:call-template name="GlobalStylesForm"/>
</head>
  <body class="styBodyClass">
    <form name="Form8908">
      <xsl:call-template name="DocumentHeader"/>

    <!--Title of Form -->    
  <div class="styBB" style="height: 21.5mm;width:187mm;">
    <div class="styFNBox" style="height: 21.5mm;width:26mm;font-size: 7pt;">
      Form <span class="styFormNumber">8908</span>      
      <br/>
      <span>
        <xsl:call-template name="SetFormLinkInline">
          <xsl:with-param name="TargetNode" select="$Form8908"/>
        </xsl:call-template>  
      </span>  
       <br/>
      <span class="styAgency">(Rev. December 2025)</span>
      <span class="styAgency">Department of the Treasury</span><br/><span class="styAgency">Internal Revenue Service</span>
    </div>
    <div class="styFTBox" style="height: 21.5mm;width:130mm;padding-top:4mm;">
      <div class="styMainTitle" style="height: 8mm">Energy Efficient Home Credit</div>
      <div class="styFST" style="width:130mm;font-size:7pt;">
        
        Attach to your tax return. <br/><br/>
        <span style="text-align:left">
		
           Go to <a href="http://www.irs.gov/Form8908" title="Link to IRS.gov"><i>www.irs.gov/Form8908</i></a> for instructions and the latest information.
		 </span>
        <br/>
      </div>
    </div>
    <div class="styTYBox" style="width:31mm;height:21.5mm;border-left-width:1.5px;">
							<div class="styOMB" style="height:10mm;padding-top:3mm;padding-left:2mm;text-align:left;">
								OMB No. 1545-1979</div>
      <div style="height:10mm;width:30mm;padding-top:2mm;padding-left:2mm;font-size:7pt;text-align:left;">
Attachment<br/>Sequence No. <b>153</b></div>
    </div>
  </div>
  <!--  End title of Form  -->

    <div style="width:187mm;">
        <div class="styNameAddr" style="width:140mm;height:12mm;border-left-width:1px;padding-left:1px;border-left-width:0;font-size:7pt">
            Name(s) shown on return<br/>
        <div style="margin-left:2mm;padding-top:1mm;font-size:7pt;">
            <xsl:call-template name="PopulateReturnHeaderFiler">
                <xsl:with-param name="TargetNode">BusinessNameLine1Txt</xsl:with-param>
            </xsl:call-template><br/>
            <xsl:call-template name="PopulateReturnHeaderFiler">
                <xsl:with-param name="TargetNode">BusinessNameLine2Txt</xsl:with-param>
           </xsl:call-template>
        </div>
    </div>
    <div class="styNameAddr" style="font-size:7pt;width:46mm;height:12mm;border-left-width:1px;padding-left:1px;">
        <span style="width:8px"/>Identifying number
        <br/><span style="width:12px;padding-top:4.5mm;"/>
         <xsl:call-template name="PopulateReturnHeaderFiler">
          <xsl:with-param name="EINChanged">true</xsl:with-param>
          <xsl:with-param name="TargetNode">EIN</xsl:with-param>
         </xsl:call-template> 
         <xsl:call-template name="PopulateReturnHeaderFiler">
           <xsl:with-param name="TargetNode">PrimarySSN</xsl:with-param>
         </xsl:call-template> 
      </div>
    </div>



<div class="styGenericDiv" style="height:auto;width:187mm;padding-top:0.5mm;clear:all;border-bottom-width:1px;border-bottom-style:solid;">
					
   	<div class="styIRS8908LineItem" style="height:11.5mm;width:187mm;">
							<div class="styLNLeftNumBox" style="height:16.5mm;">A</div>
							<div class="styIRS8908LNDesc" style="width:145mm;">
								For each home which you are claiming the credit, are you an eligible contractor that participated in the Energy Star Residential New Construction Program, the Energy Star Manufactured New Homes Program, or the Energy Star Multifamly New Construction Program and built or producted a qualified new energy efficient home? See Instructions
<span class="styDotLn" style="clear:none;float:right;">................................</span>

</div>		
							

<div style="width:30mm;text-align:center;float:right;padding-top:7mm;">
								<!-- ++++++++++++++ Yes Checkbox +++++++++++++ -->
								<span>
									<xsl:call-template name="PopulateSpan">
										<xsl:with-param name="TargetNode" select="$Form8908/EligibleContractorInd"/>
									</xsl:call-template>
								</span>
								<span>	
									<input type="checkbox" class="styCkbox" alt="Eligible Contractor Indicator Yes">
										<xsl:call-template name="PopulateYesCheckbox">
											<xsl:with-param name="TargetNode" select="$Form8908/EligibleContractorInd"/>
											<!--<xsl:with-param name="BackupName">IRS8908YesEligibleContractorInd</xsl:with-param>-->
										</xsl:call-template>
									</input>
									<span style="width:2mm;"/>
									<label>
										<xsl:call-template name="PopulateLabelYes">
											<xsl:with-param name="TargetNode" select="$Form8908/EligibleContractorInd"/>
											<!--<xsl:with-param name="BackupName">IRS8908YesEligibleContractorInd</xsl:with-param>-->
										</xsl:call-template>
									</label><b>Yes</b><span style="width:1mm;"/>
								</span>
								<!-- ++++++++++++++ No Checkbox +++++++++++++ -->
								<span>
									<input type="checkbox" class="styCkbox" alt="Eligible Contractor Indicator No">
										<xsl:call-template name="PopulateNoCheckbox">
											<xsl:with-param name="TargetNode" select="$Form8908/EligibleContractorInd"/>
											<!--<xsl:with-param name="BackupName">IRS89089NoEligibleContractorInd</xsl:with-param>-->
										</xsl:call-template>
									</input>
									<span style="width:2mm;"/>
									<label>
										<xsl:call-template name="PopulateLabelNo">
											<xsl:with-param name="TargetNode" select="$Form8908/EligibleContractorInd"/>
											<!--<xsl:with-param name="BackupName">IRS8908NoEligibleContractorInd</xsl:with-param>-->
										</xsl:call-template>
										
									</label><span style="width:4mm;"><b>No</b></span>		
								</span>
							</div>
	</div>
	
						
    <br/><br/>
   	<div class="styIRS8908LineItem" style="height:9.5mm;width:187mm;">
							<div class="styLNLeftNumBox" style="height:16.5mm;">B</div>
							<div class="styIRS8908LNDesc" style="width:145mm;">
								For each home which you are claiming the credit, did you have a basis in a qualified new energy efficient home(s) during its construction/production and before it was acquired by a person for use as a residence during the tax year? See Instructions
<span class="styDotLn" style="clear:none;float:right;">.............................</span>

</div>		
							

<div style="width:30mm;text-align:center;float:right;padding-top:5mm;">
								<!-- ++++++++++++++ Yes Checkbox +++++++++++++ -->
								<span>
									<xsl:call-template name="PopulateSpan">
										<xsl:with-param name="TargetNode" select="$Form8908/BssQlfyNewEgyEfficientHmInd"/>
									</xsl:call-template>
								</span>
								<span>	
									<input type="checkbox" class="styCkbox" alt="Joint Return Indicator Yes">
										<xsl:call-template name="PopulateYesCheckbox">
											<xsl:with-param name="TargetNode" select="$Form8908/BssQlfyNewEgyEfficientHmInd"/>
											<!--<xsl:with-param name="BackupName">IRS8908YesEligibleContractorInd</xsl:with-param>-->
										</xsl:call-template>
									</input>
									<span style="width:2mm;"/>
									<label>
										<xsl:call-template name="PopulateLabelYes">
											<xsl:with-param name="TargetNode" select="$Form8908/BssQlfyNewEgyEfficientHmInd"/>
											<!--<xsl:with-param name="BackupName">IRS8908YesEligibleContractorInd</xsl:with-param>-->
										</xsl:call-template>
									</label><b>Yes</b><span style="width:1mm;"/>
								</span>
								<!-- ++++++++++++++ No Checkbox +++++++++++++ -->
								<span>
									<input type="checkbox" class="styCkbox" alt="Joint Return Indicator No">
										<xsl:call-template name="PopulateNoCheckbox">
											<xsl:with-param name="TargetNode" select="$Form8908/BssQlfyNewEgyEfficientHmInd"/>
											<!--<xsl:with-param name="BackupName">IRS89089NoEligibleContractorInd</xsl:with-param>-->
										</xsl:call-template>
									</input>
									<span style="width:2mm;"/>
									<label>
										<xsl:call-template name="PopulateLabelNo">
											<xsl:with-param name="TargetNode" select="$Form8908/BssQlfyNewEgyEfficientHmInd"/>
											<!--<xsl:with-param name="BackupName">IRS8908NoEligibleContractorInd</xsl:with-param>-->
										</xsl:call-template>
										
									</label><span style="width:4mm;"><b>No</b></span>		
								</span>
							</div>
	</div>
						   
    <br/><br/>
   	<div class="styIRS8908LineItem" style="height:8.5mm;width:187mm;">
							<div class="styLNLeftNumBox" style="height:14.5mm;">C</div>
							<div class="styIRS8908LNDesc" style="width:145mm;">
								For each home which you are claiming the credit, did a certifies issue a certification of energy efficiency savings before the home was acquired by a person for use as a residence during the tax year? See Instructions
<span class="styDotLn" style="clear:none;float:right;">....</span>

</div>		
							

<div style="width:30mm;text-align:center;float:right;padding-top:2mm;">
								<!-- ++++++++++++++ Yes Checkbox +++++++++++++ -->
								<span>
									<xsl:call-template name="PopulateSpan">
										<xsl:with-param name="TargetNode" select="$Form8908/IssdEgyEfficiencySavCertInd"/>
									</xsl:call-template>
								</span>
								<span>	
									<input type="checkbox" class="styCkbox" alt="Issued Energy Efficiency Save Certification Indicator Yes">
										<xsl:call-template name="PopulateYesCheckbox">
											<xsl:with-param name="TargetNode" select="$Form8908/IssdEgyEfficiencySavCertInd"/>
											<!--<xsl:with-param name="BackupName">IRS8908YesEligibleContractorInd</xsl:with-param>-->
										</xsl:call-template>
									</input>
									<span style="width:2mm;"/>
									<label>
										<xsl:call-template name="PopulateLabelYes">
											<xsl:with-param name="TargetNode" select="$Form8908/IssdEgyEfficiencySavCertInd"/>
											<!--<xsl:with-param name="BackupName">IRS8908YesEligibleContractorInd</xsl:with-param>-->
										</xsl:call-template>
									</label><b>Yes</b><span style="width:1mm;"/>
								</span>
								<!-- ++++++++++++++ No Checkbox +++++++++++++ -->
								<span>
									<input type="checkbox" class="styCkbox" alt="Issued Energy Efficiency Save Certification Indicator No">
										<xsl:call-template name="PopulateNoCheckbox">
											<xsl:with-param name="TargetNode" select="$Form8908/IssdEgyEfficiencySavCertInd"/>
											<!--<xsl:with-param name="BackupName">IRS89089NoEligibleContractorInd</xsl:with-param>-->
										</xsl:call-template>
									</input>
									<span style="width:2mm;"/>
									<label>
										<xsl:call-template name="PopulateLabelNo">
											<xsl:with-param name="TargetNode" select="$Form8908/IssdEgyEfficiencySavCertInd"/>
											<!--<xsl:with-param name="BackupName">IRS8908NoEligibleContractorInd</xsl:with-param>-->
										</xsl:call-template>
										
									</label><span style="width:4mm;"><b>No</b></span>		
								</span>
							</div>
	</div>		
							
<div class="styIRS8908LineItem" style="height:auto;width:187mm;">
If you answered "No" to question A, B, or C, <b>STOP</b>, you cannot claim the credit. If you answered "Yes" to questions A, B, and C, continue to line D.
</div>
<br/>
<br/>


   	<div class="styIRS8908LineItem" style="height:10.5mm;width:187mm;">
							<div class="styLNLeftNumBox" style="height:16.5mm;">D</div>
							<div class="styIRS8908LNDesc" style="width:150mm;">
								Complete Part II and list the person or business (certifier) you used to secure a certification of energy efficiency savings for the home(s) for which you are claiming the credit, and enter the number of certifiers listed in part II here. See instructions for the definition of a certifier 
<span class="styDotLn" style="clear:none;float:right;">........................</span>

</div>

<span style="width:20mm;border-style:solid;border-color:black;border-width:0px 0px 1px 0px;text-align:center;float:right;padding-top:5.5mm;">
							<xsl:call-template name="PopulateAmount"><xsl:with-param name="TargetNode" select="$Form8908/TotCertifierCnt"/></xsl:call-template>
							</span>	
							</div>			
							
							
							
							  <br/>
   	<div class="styIRS8908LineItem" style="height:9.5mm;width:187mm;">
							<div class="styLNLeftNumBox" style="height:10.5mm;">E</div>
							<div class="styIRS8908LNDesc" style="width:150mm;">
								Enter the total number of home certifications reported in Part II, column (c). This entry must equal the sum of lines 1a, 2a, 3a, 4a, 5a, and 6a below
<span class="styDotLn" style="clear:none;float:right;">............................</span>

</div>

<span style="width:20mm;border-style:solid;border-color:black;border-width:0px 0px 1px 0px;text-align:center;float:right;padding-top:3.0mm;">
							<xsl:call-template name="PopulateAmount"><xsl:with-param name="TargetNode" select="$Form8908/TotHomesCertifiedCnt"/></xsl:call-template>
							</span>	
							</div>		
						</div>																	
 					<!-- BEGIN Part I Title -->
					<div class="styBB" style="width:187mm;float:left;">
						<div class="styPartDesc">Part I. Information About Your Qualified Homes</div>
					</div>
					<!-- END Part I Title -->
    
    <div style="width:187mm;">
        <div class="styLNLeftNumBox" style="height:18.5mm;">1a</div>
        <div class="styLNDesc" style="width:92mm;height:18.5mm;">Enter the total number of qualified new energy efficient homes eligible to participate in the Energy Star Residential New Construction Program or the Energy Star Manufactured New Homes Program meeting the single home requirements but not certified as a zero energy ready home that were
        sold or leased to another person for use as a
																							   residence during the tax year. See instructions.
        <!--Dotted Line-->
		<span class="styDotLn" style="float:right;clear:none;padding-right:2mm;">..............</span>
        </div>
        <div class="styLNRightNumBox" style="height:19.5mm;padding-top:16.0mm;">1a</div>
        <div class="styLNAmountBox" style="height:19.5mm;padding-top:16.0mm;width:40mm;">
            <xsl:call-template name="PopulateAmount"><xsl:with-param name="TargetNode" select="$Form8908/TotalHomesMeetingStandardQty"/></xsl:call-template>
        </div>
        <div class="styLNRightNumBox" style="background-color:lightgrey;height:19.5mm;border-bottom-width:0px"/>
        <div class="styLNAmountBoxNBB" style="height:19.5mm;width:30mm;"/>
    </div>
    <div style="width:187mm;">
        <div class="styLNLeftNumBox" style="height:4.5mm;"><span style="width:6px"/>b</div>
        <div class="styLNDesc" style="width:140mm;height:4.5mm;">
			<span style="float:left;clear:none;">  
				  Multiply line 1a by $2,500
			</span>   
        <!--Dotted Line-->
        <span class="styDotLn" style="float:right;clear:none;padding-right:2mm;">..........................</span>
        </div>
        <div class="styLNRightNumBox" style="height:4.5mm;">1b</div>
        <div class="styLNAmountBox" style="width:30mm;height:4.5mm;">
           <xsl:call-template name="PopulateAmount"><xsl:with-param name="TargetNode" select="$Form8908/TotalHomesStandardAmt"/></xsl:call-template>
       </div>
    </div>

    <div style="width:187mm;">
        <div class="styLNLeftNumBox" style="height:16.5mm;">2a</div>
        <div class="styLNDesc" style="width:92mm;height:16.5mm;">Enter the total number of qualified new energy efficient homes
			eligible to participate in the Energy Star Residential New Construction Program or the Energy Star Manufactured New Homes Program and certified as a zero energy ready home that were sold or leased to another 
            person for use as a residence during the tax year. See instructions.
       
        <!--Dotted Line-->
			<span class="styDotLn" style="float:right;clear:none;padding-right:1mm;">.....</span>
        </div>
        <div class="styLNRightNumBox" style="height:16.5mm;padding-top:12.5mm;">2a</div>
        <div class="styLNAmountBox" style="height:16.5mm;padding-top:12.5mm;width:40mm;">
            <xsl:call-template name="PopulateAmount"><xsl:with-param name="TargetNode" select="$Form8908/TotalMfrHmMeetingStdQty"/></xsl:call-template>
        </div>
        <div class="styLNRightNumBox" style="background-color:lightgrey;height:16.5mm;border-bottom-width:0px"/>
        <div class="styLNAmountBoxNBB" style="height:16.5mm;width:30mm;"/>
    </div>
    
    <div style="width:187mm;">
        <div class="styLNLeftNumBox" style="height:4.5mm;"><span style="width:6px"/>b</div>
        <div class="styLNDesc" style="width:140mm;height:4.5mm;">
			<span style="float:left;clear:none;">Multiply line 2a by $5,000</span>   
        <!--Dotted Line-->
        <span class="styDotLn" style="float:right;clear:none;padding-right:2mm;">..........................</span>
        </div>
        <div class="styLNRightNumBox" style="height:4.5mm;">2b</div>
        <div class="styLNAmountBox" style="width:30mm;height:4.5mm;">
            <xsl:call-template name="PopulateAmount"><xsl:with-param name="TargetNode" select="$Form8908/TotalManufactureHomesAmt"/></xsl:call-template>
        </div>
    </div>

		<!-- Line 3a -->
       <div style="width:187mm;">
        <div class="styLNLeftNumBox" style="height:4.5mm;">3a</div>
        <div class="styLNDesc" style="width:92mm;height:4.5mm;">Enter the total number of qualified new energy efficient homes eligible to participate in the Energy Star Multifamily New Construction Program meeting the multifamily home requirements and the prevailing wage requirements but not certified as a zero energy ready home that were sold or leased to another person for use as a residence during the tax year. See instructions.
       
        <!--Dotted Line-->
			<span class="styDotLn" style="float:right;clear:none;padding-right:1mm;">...............</span>
        </div>
        <div class="styLNRightNumBox" style="height:19mm;padding-top:15.5mm;">3a</div>
        <div class="styLNAmountBox" style="height:19mm;padding-top:15.5mm;width:40mm;">
            <xsl:call-template name="PopulateAmount"><xsl:with-param name="TargetNode" select="$Form8908/TotQlfyEgyStarProgNotCertQty"/></xsl:call-template>
        </div>
        <div class="styLNRightNumBox" style="background-color:lightgrey;height:19mm;border-bottom-width:0px"/>
        <div class="styLNAmountBoxNBB" style="height:19mm;width:30mm;"/>
    </div>
    
    <!-- Line 3b -->
    <div style="width:187mm;">
        <div class="styLNLeftNumBox" style="height:4.5mm;"><span style="width:6px"/>b</div>
        <div class="styLNDesc" style="width:140mm;height:4.5mm;">
			<span style="float:left;clear:none;">Multiply line 3a by $2,500</span>   
        <!--Dotted Line-->
        <span class="styDotLn" style="float:right;clear:none;padding-right:2mm;">..........................</span>
        </div>
        <div class="styLNRightNumBox" style="height:4.5mm;">3b</div>
        <div class="styLNAmountBox" style="width:30mm;height:4.5mm;">
            <xsl:call-template name="PopulateAmount"><xsl:with-param name="TargetNode" select="$Form8908/TotQlfyEgyStarProgNotCertAmt"/></xsl:call-template>
        </div>
    </div>
    
      <!-- Line 4a -->
      <div style="width:187mm;">
        <div class="styLNLeftNumBox" style="height:4.5mm;">4a</div>
        <div class="styLNDesc" style="width:92mm;height:4.5mm;">Enter the total number of qualified new energy efficient homes eligible to participate in the Energy Star Multifamily New Construction Program meeting the prevailing wage requirements and certified as a zero energy ready home that were sold or leased to another person for use as a residence during the tax year. See instructions
       
        <!--Dotted Line-->
			<span class="styDotLn" style="float:right;clear:none;padding-right:1mm;">.......</span>
        </div>
        <div class="styLNRightNumBox" style="height:15.5mm;padding-top:12.5mm;">4a</div>
        <div class="styLNAmountBox" style="height:15.5mm;padding-top:12.5mm;width:40mm;">
            <xsl:call-template name="PopulateAmount"><xsl:with-param name="TargetNode" select="$Form8908/TotQlfyEgyStarProgCertQty"/></xsl:call-template>
        </div>
        <div class="styLNRightNumBox" style="background-color:lightgrey;height:15.5mm;border-bottom-width:0px"/>
        <div class="styLNAmountBoxNBB" style="height:15.5mm;width:30mm;"/>
    </div>
    
    <!-- Line 4b -->
    <div style="width:187mm;">
        <div class="styLNLeftNumBox" style="height:4.5mm;"><span style="width:6px"/>b</div>
        <div class="styLNDesc" style="width:140mm;height:4.5mm;">
			<span style="float:left;clear:none;">Multiply line 4a by $5,000</span>   
        <!--Dotted Line-->
        <span class="styDotLn" style="float:right;clear:none;padding-right:2mm;">..........................</span>
        </div>
        <div class="styLNRightNumBox" style="height:4.5mm;">4b</div>
        <div class="styLNAmountBox" style="width:30mm;height:4.5mm;">
            <xsl:call-template name="PopulateAmount"><xsl:with-param name="TargetNode" select="$Form8908/TotQlfyEgyStarProgCertAmt"/></xsl:call-template>
        </div>
    </div>    
    
         <!-- Line 5a -->
      <div style="width:187mm;">
        <div class="styLNLeftNumBox" style="height:4.5mm;">5a</div>
        <div class="styLNDesc" style="width:92mm;height:4.5mm;">Enter the total number of qualified new energy efficient homes eligible to participate in the Energy Star Multifamily New Construction Program meeting the multifamily home requirements but not meeting the prevailing wage requirements and not certified as a zero energy ready home that were sold or leased to another person for use as a residence during the tax year. See instructions
       
        <!--Dotted Line-->
			<span class="styDotLn" style="float:right;clear:none;padding-right:1mm;">...........</span>
        </div>
        <div class="styLNRightNumBox" style="height:19mm;padding-top:15.5mm;">5a</div>
        <div class="styLNAmountBox" style="height:19mm;padding-top:15.5mm;width:40mm;">
            <xsl:call-template name="PopulateAmount"><xsl:with-param name="TargetNode" select="$Form8908/TotQlfyEgyStarNotMetNotCertQty"/></xsl:call-template>
        </div>
        <div class="styLNRightNumBox" style="background-color:lightgrey;height:19mm;border-bottom-width:0px"/>
        <div class="styLNAmountBoxNBB" style="height:19mm;width:30mm;"/>
    </div>
    
    <!-- Line 5b -->
    <div style="width:187mm;">
        <div class="styLNLeftNumBox" style="height:4.5mm;"><span style="width:6px"/>b</div>
        <div class="styLNDesc" style="width:140mm;height:4.5mm;">
			<span style="float:left;clear:none;">Multiply line 5a by $500</span>   
        <!--Dotted Line-->
        <span class="styDotLn" style="float:right;clear:none;padding-right:2mm;">..........................</span>
        </div>
        <div class="styLNRightNumBox" style="height:4.5mm;border-bottom-width:0px">5b</div>
        <div class="styLNAmountBox" style="width:30mm;height:4.5mm;border-bottom-width:0px">
            <xsl:call-template name="PopulateAmount"><xsl:with-param name="TargetNode" select="$Form8908/TotQlfyEgyStarNotMetNotCertAmt"/></xsl:call-template>
        </div>
    </div>   
    
<!-- PAGE 1 END BEGIN-->

     <div style="width:187mm;border-top-width:1px;border-left-width: 0px; border-right-width: 0px; border-bottom-width:0px;border-style:solid;"> 
        <span class="styBoldText" style="width:100mm;">For Paperwork Reduction Act Notice, see separate instructions.</span>
          Cat. No. 37718T
        <span style="width:64.5mm;text-align:right;">Form 
			<span style="font-size:8pt"><b>8908</b></span> (Rev. 12-2025)
        </span>
    </div>
    
    <br class="pageEnd"/>
        <div style="page-break-after:always;display:block;"/>
<!--PAGE 1 END END -->
    
    					<div class="styStdDiv">
						Form 8908 (Rev. 12-2025)
						<span style="float:right;">Page <span style="font-weight:bold;font-size:8pt;">2</span></span>
					</div>
					
    					<!-- BEGIN Part I Title CONTINUED -->
					<div class="styBB" style="width:187mm;float:left;border-top-width:1px;border-left-width: 0px; border-right-width: 0px; border-bottom-width:1px;border-style:solid;">
						<div class="styPartDesc">Part I. Information About Your Qualified Homes <i>(continued)</i></div>
					</div>
					<!-- END Part I Title CONTINUED -->

	       <!-- Line 6a -->
      <div style="width:187mm;">
        <div class="styLNLeftNumBox" style="height:4.5mm;">6a</div>
        <div class="styLNDesc" style="width:92mm;height:4.5mm;">Enter the total number of qualified new energy efficient homes eligible to participate in the Energy Star Multifamily New Construction Program not meeting the prevailing wage requirements but certified as a zero energy ready home that were sold or leased to another person for use as a residence during the tax year. See instructions
       
        <!--Dotted Line-->
			<span class="styDotLn" style="float:right;clear:none;padding-right:1mm;">........</span>
        </div>
        <div class="styLNRightNumBox" style="height:16mm;padding-top:12.5mm;">6a</div>
        <div class="styLNAmountBox" style="height:16mm;padding-top:12.5mm;width:45mm;">
            <xsl:call-template name="PopulateAmount"><xsl:with-param name="TargetNode" select="$Form8908/TotQlfyEgyStarNotMetCertQty"/></xsl:call-template>
        </div>
        <div class="styLNRightNumBox" style="background-color:lightgrey;height:16mm;border-bottom-width:0px"/>
        <div class="styLNAmountBoxNBB" style="height:16mm;width:20mm;"/>
    </div>
    
    <!-- Line 6b -->
    <div style="width:187mm;">
        <div class="styLNLeftNumBox" style="height:4.5mm;"><span style="width:6px"/>b</div>
        <div class="styLNDesc" style="width:145mm;height:4.5mm;">
			<span style="float:left;clear:none;">Multiply line 6a by $1,000</span>   
        <!--Dotted Line-->
        <span class="styDotLn" style="float:right;clear:none;padding-right:2mm;">..........................</span>
        </div>
        <div class="styLNRightNumBox" style="height:4.5mm;">6b</div>
        <div class="styLNAmountBox" style="width:25mm;height:4.5mm;">
            <xsl:call-template name="PopulateAmount"><xsl:with-param name="TargetNode" select="$Form8908/TotQlfyEgyStarNotMetCertAmt"/></xsl:call-template>
        </div>
    </div>   
    
    

   <div style="width:187mm;">
        <div class="styLNLeftNumBox" style="height:4.5mm;">7</div>
        <div class="styLNDesc" style="width:145mm;height:4.5mm;">
		   <span style="float:left;clear:none;">Energy efficient home credit from partnerships and S corporations (see instructions)</span>
         <!--Dotted Line-->
        <span class="styDotLn" style="float:right;clear:none;padding-right:2mm;">........</span>
        </div>
        <div class="styLNRightNumBox" style="height:4.5mm;">7</div>
        <div class="styLNAmountBox" style="width:25mm;height:4.5mm;">
            <xsl:call-template name="PopulateAmount"><xsl:with-param name="TargetNode" select="$Form8908/EnergyEfficientHomeCreditAmt"/></xsl:call-template>
        </div>
    </div>
    
    <div class="styBB" style="width:187mm;">
        <div class="styLNLeftNumBox" style="height:7mm;">8</div>
        <div class="styLNDesc" style="width:145mm;height:7mm;">Add lines 1b, 2b, 3b, 4b, 5b, 6b, and 7. Partnerships and S corporations, report this amount on Schedule K. All others, report this amount on Form 3800, Part III, line 1p
        <!--Dotted Line-->
        <span class="styDotLn" style="float:right;clear:none;padding-right:2mm;">................</span>
        </div>
        <div class="styLNRightNumBox" style="height:7mm;padding-top:4mm;border-bottom-width:0px">8</div>
        <div class="styLNAmountBox" style="width:25mm;height:7mm;padding-top:4mm;border-bottom-width:0px">
            <xsl:call-template name="PopulateAmount"><xsl:with-param name="TargetNode" select="$Form8908/TotalCreditAmt"/></xsl:call-template>
        </div>
    </div>
    <!-- BEGIN PART 2 -->
					<!-- BEGIN Part II Title -->
					<div class="styBB" style="width:187mm;float:left;border-top-width:0px;border-left-width: 0px; border-right-width: 0px; border-bottom-width:1px;border-style:solid;">
						<div class="styPartDesc">Part II. Certifier Information</div>
					</div>
					<!-- END Part II Title -->
	<!-- BEGIN PART 2 Table -->
				<table class="styTable" cellspacing="0" style="width:100%;">
					<thead class="styTableThead">
						<xsl:call-template name="PartTwoCertifierInfoHeaders"/>
					</thead>
					<!--Here's the loop we'll use to poulate   -->
					<xsl:for-each select="$Form8908/CertifierInformationGrp">
								<xsl:call-template name="CertifierRows">
									<xsl:with-param name="count" select="count($Form8908/CertifierInformationGrp)"/>
								</xsl:call-template>
					</xsl:for-each>												
					<xsl:if test="count($Form8908/CertifierInformationGrp) &lt; 28">
					<xsl:call-template name="blank-rows">
					<xsl:with-param name="count" select="27 - count($Form8908/CertifierInformationGrp)"/>
								<xsl:with-param name="rowNum" select="count($Form8908/CertifierInformationGrp)+1"/>	
					</xsl:call-template>
					</xsl:if>
				</table>
	<!-- END PART 2 Table -->

    <!-- END PART 2 -->
    <div style="width:187mm"> 
        
        <span style="width:187mm;text-align:right;">Form 
			<span style="font-size:8pt"><b>8908</b></span> (Rev. 12-2025) 
        </span>
    </div>    
    
<p style="page-break-before: always"/>    
        <!-- BEGIN PART 3 -->
    <div style="width:187mm"> 
        <span style="width:187mm;text-align:left;">Form 
			<span style="font-size:8pt"><b>8908</b></span> (Rev. 12-2025) 
			<span style="float:right;">Page <span style="font-weight:bold;font-size:8pt;">3</span></span>
        </span>
    </div>
					<!-- BEGIN Part III Title -->
					<div class="styBB" style="height:auto;width:187mm;float:left;border-top-width:1px;border-left-width: 0px; border-right-width: 0px; border-bottom-width:1px;border-style:solid;">
						<div class="styPartDesc" style="width:auto;padding-right:2mm;">Part III. Qualified Homes' Addresses </div> <span style="padding-top:.1mm;">(see instructions)</span>
					</div>
    
    <!-- BEGIN PART 3 Table -->
    <!-- END PART 3 Table -->
    
    
    
	<!-- BEGIN PART 3 Table -->
				<table class="styTable" cellspacing="0" style="width:100%;">
					<thead class="styTableThead">
						<xsl:call-template name="PartThreeAddressHeaders"/>
					</thead>
					<!--Here's the loop we'll use to poulate   -->
					<xsl:for-each select="$Form8908/QualifiedHomesAddresses">
								<xsl:call-template name="AddressRows">
									<xsl:with-param name="count" select="count($Form8908/QualifiedHomesAddresses)"/>
								</xsl:call-template>
					</xsl:for-each>												
					<xsl:if test="count($Form8908/QualifiedHomesAddresses) &lt; 20">
					<xsl:call-template name="blank-address-rows">
					<xsl:with-param name="count" select="20 - count($Form8908/QualifiedHomesAddresses)"/>
								<xsl:with-param name="rowNum" select="count($Form8908/QualifiedHomesAddresses)+1"/>	
					</xsl:call-template>
					</xsl:if>
				</table>
	<!-- END PART 3 Table -->    
    
    
    
    
    <!-- END PART 3 -->
 <div style="width:187mm"> 
        
        <span style="width:187mm;text-align:right;">Form 
			<span style="font-size:8pt"><b>8908</b></span> (Rev. 12-2025) 
        </span>
    </div>    
    
    <p style="page-break-before: always"/>
    <div class="styLeftOverTitleLine" id="LeftoverData">
        <div class="styLeftOverTitle">Additional Data</div>
        <div class="styLeftOverButtonContainer">
          <input class="styLeftoverTableBtn" TabIndex="1" type="button" value="Return to Form" onclick="javascript:returnToWriteInImage();"/>
        </div>      
    </div>
      
    <table class="styLeftOverTbl">
        <xsl:call-template name="PopulateCommonLeftover">
          <xsl:with-param name="TargetNode" select="$Form8908"/>
          <xsl:with-param name="DescWidth" select="100"/>
        </xsl:call-template>
    </table>    
    </form>
  </body>
</html>

</xsl:template>
<!-- /////////////////////////////////////////// (Template: HeaderRow) -->
<xsl:template name="PartTwoCertifierInfoHeaders">
		<xsl:param name="lineNumber">1</xsl:param>
		<tr style="border-color:black;font-size:6pt;height:17mm;" valign="top">
			<!-- +++++++++++++++++++++++++++++++++++-->
			<th class="styTableCellHeader" style="text-align:left;width:10mm;vertical-align:middle;border-bottom-width:0px;" scope="col" rowspan="3">
					
			</th>
			<th class="styTableCellHeader" style="text-align:left;width:77mm;vertical-align:top;padding-top:2mm;" scope="col" rowspan="4">
				<!--<div style="width:3mm;float:left;text-align:right;font-weight:bold;font-size:7pt;padding-bottom:17mm;">
					<br/>
					<xsl:value-of select="$lineNumber"/>
				</div>-->
				<div style="width:70mm;text-align:center;float:left;pading-bottom:14mm;">(a)<br/>
					<span class="styNormalText">Name of issuing certifier
						<br/>(see instructions)
					</span>
				</div>
			</th>
			<!-- +++++++++++++++++++++++++++++++++++-->
			<th class="styTableCellHeader" style="text-align:center;width:15mm;vertical-align:top;padding-top:2mm;" scope="col" rowspan="1">
				<span class="styNormalText">
					<b>(b) </b>
					<br/>State
					<br/>where
					<br/>certifier is
					<br/>located
					</span>
			</th>
			<!-- +++++++++++++++++++++++++++++++++++-->
			<th class="styTableCellHeader" style="text-align:center;width:35mm;vertical-align:top;padding-top:2mm;" scope="col" rowspan="2">
				<span class="styNormalText">
					<b>(c) </b>
					<br/>Number of your homes
					<br/>certified by this certifier
				</span>
			</th>
			<!-- +++++++++++++++++++++++++++++++++++-->
			<th class="styTableCellHeader" style="text-align:center;width:31mm;vertical-align:top;padding-top:2mm;" scope="col" rowspan="2">
				<span class="styNormalText">
					<b>(d) </b>
					<br/>Number of certifications 
					<br/>that were modified from 
					<br/>the original certification <br/></span>
			</th>
			<!-- +++++++++++++++++++++++++++++++++++-->
			<th class="styTableCellHeader" style="text-align:center;width:20.8mm;vertical-align:top;padding-top:2mm;border-right-width:0px;" scope="col" rowspan="2">
				<span class="styNormalText">
					<b>(e) </b>
					<br/>Reserved for<br/>future use</span>
			</th>
		</tr>
	</xsl:template>



<!-- /////////////////////////////////////////// (Template: Part III HeaderRow) -->
<xsl:template name="PartThreeAddressHeaders">
		<xsl:param name="lineNumber">1</xsl:param>
		<tr style="border-color:black;font-size:6pt;height:8mm;width:187mm;" valign="top">
			<!-- +++++++++++++++++++++++++++++++++++-->
			<th class="styTableCellHeader" style="text-align:left;width:40mm;vertical-align:middle;border-bottom-width:0px;" scope="col" rowspan="1">
					
			</th>
			<th class="styTableCellHeader" style="text-align:left;width:120mm;vertical-align:top;padding-top:2mm;" scope="col" rowspan="1">
				<!--<div style="width:3mm;float:left;text-align:right;font-weight:bold;font-size:7pt;padding-bottom:17mm;">
					<br/>
					<xsl:value-of select="$lineNumber"/>
				</div>-->
				<div style="width:70mm;text-align:center;float:left;pading-bottom:14mm;">(a)<br/>
					<span class="styNormalText">Address (number and street)
					</span>
				</div>
			</th>
			<!-- +++++++++++++++++++++++++++++++++++-->
			<th class="styTableCellHeader" style="text-align:center;width:105mm;vertical-align:top;padding-top:2mm;" scope="col" rowspan="1">
				<span class="styNormalText">
					<b>(b) </b>
					<br/>City
					</span>
			</th>
			<!-- +++++++++++++++++++++++++++++++++++-->
			<th class="styTableCellHeader" style="text-align:center;width:3mm;vertical-align:top;padding-top:2mm;" scope="col" rowspan="1">
				<span class="styNormalText">
					<b>(c) </b>
					<br/>State
				</span>
			</th>
			<!-- +++++++++++++++++++++++++++++++++++-->
			<th class="styTableCellHeader" style="text-align:center;width:61mm;vertical-align:top;padding-top:2mm;" scope="col" rowspan="1">
				<span class="styNormalText">
					<b>(d) </b>
					<br/>Zip Code 
				</span>
			</th>
		</tr>
	</xsl:template>


<!-- /////////////////////////////////////////// (Template: BlankRows) -->
	<xsl:template name="blank-rows">
		<xsl:param name="count"/>
		<xsl:param name="rowNum"/>
		<!-- blank row stuff here -->
		<tr style="border-color:black;font-size:7pt;">
			<!--+++++++++++++++++++empty+++++++++++++++++++-->
			<td class="styTableCell" style="width:20mm;border-bottom-width:0px;">
				<span style="width:4px"/>   
				<!--Insert the line number here--> <b><xsl:value-of select="$rowNum"></xsl:value-of></b>
			</td>
			<!--+++++++++++++++++++++A+++++++++++++++++-->
			<td class="styTableCell" style="width:20mm;">
				<span style="width:4px"/>  
			</td>
			<!--++++++++++++++++++++++B++++++++++++++++-->
			<td class="styTableCell" style="width:20mm;">
				<span style="width:4px"/>
			</td>
			<!--+++++++++++++++++++++++C+++++++++++++++-->
			<td class="styTableCell" style="width:31mm;">
				<span style="width:4px"/>
			</td>
			<!--+++++++++++++++++++++++D+++++++++++++++-->
			<td class="styTableCell" style="width:31mm;text-align:right;">
				<br/>
				<xsl:call-template name="PopulateAmount">
					<xsl:with-param name="TargetNode" select="/.."/>
				</xsl:call-template>
			</td>
			<!--+++++++++++++++++++++++E+++++++++++++++-->
			<td class="styTableCell" style="width:13mm;border-right-width:0px;background-color:lightgrey;">
				<span style="width:4px"/>
			</td>
		</tr>
		<xsl:if test="$count &gt; 1">
			<xsl:call-template name="blank-rows">
				<xsl:with-param name="count" select="$count - 1"/>
				<xsl:with-param name="rowNum" select="$rowNum + 1"/>
			</xsl:call-template>
		</xsl:if>
	</xsl:template>

<!-- /////////////////////////////////////////// (Template: Certifier Rows) -->
	<xsl:template name="CertifierRows">
		<xsl:param name="count"/>
		<xsl:param name="rowNum"/>
		<!-- blank row stuff here -->
		<tr style="border-color:black;font-size:7pt;">
			<!--+++++++++++++++++++empty+++++++++++++++++++-->
			<td class="styTableCell" style="width:20mm;border-bottom-width:0px;">
				<span style="width:4px"/>   
				<!--Insert the line number here--> <b><xsl:value-of select="position()"></xsl:value-of></b>
			</td>
			<!--+++++++++++++++++++++A+++++++++++++++++-->
			<td class="styTableCell" style="width:20mm;">
			<!--<xsl:attribute name="style">width:30mm;font-size:6pt;text-align:center;</xsl:attribute>-->
				<span style="width:4px"/>
				<xsl:choose>
					<xsl:when test="PersonNm">
					<xsl:call-template name="PopulateText"><xsl:with-param name="TargetNode" select="PersonNm"/></xsl:call-template>
					</xsl:when>
				<xsl:otherwise>
				<xsl:call-template name="PopulateText">
<xsl:with-param name="TargetNode" select="BusinessName/BusinessNameLine1Txt"/>
</xsl:call-template>
<br/>
<xsl:call-template name="PopulateText">
<xsl:with-param name="TargetNode" select="BusinessName/BusinessNameLine2Txt"/>
</xsl:call-template>
					
				</xsl:otherwise>
				</xsl:choose>
			</td>
			<!--++++++++++++++++++++++B++++++++++++++++-->
			<td class="styTableCell" style="width:20mm;">
				<span style="width:4px"/>
				<xsl:call-template name="PopulateText"><xsl:with-param name="TargetNode" select="StateAbbreviationCd"/></xsl:call-template>
			</td>
			<!--+++++++++++++++++++++++C+++++++++++++++-->
			<td class="styTableCell" style="width:31mm;">
				<span style="width:4px"/>
				<xsl:call-template name="PopulateAmount"><xsl:with-param name="TargetNode" select="HomesCertifiedCnt"/></xsl:call-template>
			</td>
			<!--+++++++++++++++++++++++D+++++++++++++++-->
			<td class="styTableCell" style="width:31mm;text-align:right;">
				<br/>
			<xsl:call-template name="PopulateAmount"><xsl:with-param name="TargetNode" select="OriginalModifiedCertCnt"/></xsl:call-template>
			</td>
			<!--+++++++++++++++++++++++E+++++++++++++++-->
			<td class="styTableCell" style="width:13mm;border-right-width:0px;background-color:lightgrey;">
				<span style="width:4px"/>
			</td>
		</tr>
	</xsl:template>


<!-- /////////////////////////////////////////// (Template: AddressRows) -->
	<xsl:template name="AddressRows">
		<xsl:param name="count"/>		
		<xsl:variable name="addressLine2" select="$Form8908/QualifiedHomesAddresses/AddressLine2Txt"/>
		
		<!-- blank row stuff here -->
		<tr style="border-color:black;font-size:7pt;">
			<!--+++++++++++++++++++empty+++++++++++++++++++-->
			<td class="styTableCell" style="width:20mm;border-bottom-width:0px;vertical-align:bottom;">
				<span style="width:4px"/>   
				<!--Insert the line number here--> <b><xsl:value-of select="position()"></xsl:value-of></b>
			</td>
			<!--+++++++++++++++++++++A+++++++++++++++++-->
			<td class="styTableCell" style="width:20mm;">
			<!--<xsl:attribute name="style">width:30mm;font-size:6pt;text-align:center;</xsl:attribute>-->
				<span style="width:4px"/>

					<xsl:call-template name="PopulateText"><xsl:with-param name="TargetNode" select="AddressLine1Txt"/></xsl:call-template>
					<xsl:if test="$addressLine2 != ''">
					<br/>
					<xsl:call-template name="PopulateText"><xsl:with-param name="TargetNode" select="AddressLine2Txt"/></xsl:call-template>
					</xsl:if>
			</td>
			<!--++++++++++++++++++++++B++++++++++++++++-->
			<td class="styTableCell" style="width:20mm;vertical-align:bottom;text-align:center;">
				<span style="width:4px"/>
				<xsl:call-template name="PopulateText"><xsl:with-param name="TargetNode" select="CityNm"/></xsl:call-template>
			</td>
			<!--+++++++++++++++++++++++C+++++++++++++++-->
			<td class="styTableCell" style="width:31mm;vertical-align:bottom;text-align:center;">
				<span style="width:4px"/>
				<xsl:call-template name="PopulateAmount"><xsl:with-param name="TargetNode" select="StateAbbreviationCd"/></xsl:call-template>
			</td>
			<!--+++++++++++++++++++++++D+++++++++++++++-->
			<td class="styTableCell" style="width:31mm;text-align:right;vertical-align:bottom;">
				<br/>
			<xsl:call-template name="PopulateText"><xsl:with-param name="TargetNode" select="ZIPCd"/></xsl:call-template>
			</td>
<!--			--><!--+++++++++++++++++++++++E+++++++++++++++--><!--
			<td class="styTableCell" style="width:13mm;border-right-width:0px;background-color:lightgrey;">
				<span style="width:4px"/>
			</td>-->
		</tr>
	</xsl:template>

<!-- /////////////////////////////////////////// (Template: Part III BlankRows) -->
	<xsl:template name="blank-address-rows">
		<xsl:param name="count"/>
		<xsl:param name="rowNum"/>
		<!-- blank row stuff here -->
		<tr style="border-color:black;font-size:7pt;height:9mm;">
			<!--+++++++++++++++++++empty+++++++++++++++++++-->
			<td class="styTableCell" style="width:20mm;border-bottom-width:0px;vertical-align:bottom;">
				<span style="width:4px"/>   
				<!--Insert the line number here--> <b><xsl:value-of select="$rowNum"></xsl:value-of></b>
			</td>
			<!--+++++++++++++++++++++A+++++++++++++++++-->
			<td class="styTableCell" style="width:20mm;">
				<span style="width:4px"/>  
			</td>
			<!--++++++++++++++++++++++B++++++++++++++++-->
			<td class="styTableCell" style="width:20mm;">
				<span style="width:4px"/>
			</td>
			<!--+++++++++++++++++++++++C+++++++++++++++-->
			<td class="styTableCell" style="width:31mm;">
				<span style="width:4px"/>
			</td>
			<!--+++++++++++++++++++++++D+++++++++++++++-->
			<td class="styTableCell" style="width:31mm;text-align:right;">
				<br/>
		<!--		<xsl:call-template name="PopulateAmount">
					<xsl:with-param name="TargetNode" select="/.."/>
				</xsl:call-template>-->
			</td>
		
		</tr>
		<xsl:if test="$count &gt; 1">
			<xsl:call-template name="blank-address-rows">
				<xsl:with-param name="count" select="$count - 1"/>
				<xsl:with-param name="rowNum" select="$rowNum + 1"/>
			</xsl:call-template>
		</xsl:if>
	</xsl:template>
	
</xsl:stylesheet>