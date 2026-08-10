<?xml version="1.0" encoding="UTF-8"?>
<!-- 08/27/2025 - PDF_REV - AJH -->
<!-- R10.9 D5 1010367 F8881 - PDF_REV_2025-05-22 - JHG -->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">

	<xsl:include href="PopulateTemplate.xsl"/>
	<xsl:include href="AddHeader.xsl"/>
	<xsl:include href="CommonPathRef.xsl"/>
	<xsl:include href="AddOnTable.xsl"/>
	<xsl:include href="IRS8881Style.xsl"/>
	<xsl:output method="html" indent="yes" />
	<xsl:strip-space elements="*" />

	<xsl:param name="Form8881" select="$RtnDoc/IRS8881" />

	<xsl:template match="/">
	<xsl:text disable-output-escaping="yes">&lt;!DOCTYPE html&gt;</xsl:text>
	<html lang="EN-US">
		<head>
			<meta http-equiv="X-UA-Compatible" content="IE=edge"/>    
		<title>
			<xsl:call-template name="FormTitle">
				<xsl:with-param name="RootElement" select="local-name($Form8881)"></xsl:with-param>
			</xsl:call-template>
		</title>
    <!-- No Browser Caching -->
    <meta http-equiv="Pragma" content="no-cache"/>
    <meta http-equiv="Cache-Control" content="no-cache"/>
    <meta http-equiv="Expires" content="0"/>
    <!-- No Proxy Caching -->
    <meta http-equiv="Cache-Control" content="private"/>
    <!-- Define Character Set -->
    <meta http-equip="Content-Type" content="text/html; charset=ISO-8859-1" />
    <meta name="Description" content="IRS Form 8881"/>
    
    <script language="JavaScript" src="{$ScriptPath}/FormDisplay.js" type="text/javascript"></script>
    <xsl:call-template name="InitJS"></xsl:call-template>
    
    <style type="text/css">    
      <xsl:if test="not($Print) or $Print=''">
        <xsl:call-template name="IRS8881Style"></xsl:call-template>    
        <xsl:call-template name="AddOnStyle"></xsl:call-template>  
      </xsl:if>
    </style>        
    <xsl:call-template name="GlobalStylesForm"/>
  </head>
  
  <body class="styBodyClass">      
    <form name="Form8881">
    <xsl:call-template name="DocumentHeader"></xsl:call-template>  
    
        <!-- Begin Form number and Name -->
        <div class="styBB" style="width:187mm;">

        <div class="styFNBox" style="width:29mm;height:21mm;">
            Form <span class="styFormNumber">8881</span>
            <br/><span style="font-size:6pt;">(Rev. December 2025)</span>
  
            <xsl:call-template name="SetFormLinkInline">
				<xsl:with-param name="TargetNode" select="$Form8881" />
			</xsl:call-template>                                                             
 

            <div style="padding-top:2mm;">
              <span class="styAgency" >Department of the Treasury</span><br/> 
              <span class="styAgency">Internal Revenue Service</span>
            </div>
          </div>
          <div class="styFTBox" style="width:126.85mm;">
            <div class="styMainTitle" style="height:8mm;font-size:11pt;">Credits for Small Employer Pension Plan Startup Costs, Contributions, Auto-Enrollment, and Military Spouse Participation
            </div>
             <div class="styFST" style="height:5mm;font-size:7pt;"><br/>
              Attach to your tax return.<br/>
              Go to
              <a href="http://www.irs.gov/form8881" title="Link to IRS.gov">
         <i>www.irs.gov/Form8881</i>
          </a>
          for instructions and the latest information.
            </div>    
          </div>
          <div class="styTYBox" style="width:29mm;height:21mm;">
            <div class="styOMB" style="height:10.25mm;padding-top:6mm;">OMB No. 1545-1810</div>
             <div class="stySequence" style="padding-top:3.5mm;">Attachment<br/>Sequence No.<b> 130</b></div>
           </div>
         </div>
         
         <!-- Names and Identifying number Lines  -->
        <div class="styBB" style="width:187mm;">
        <div class="styNameBox" style="width:156mm;height:auto;font-weight:normal;font-size:7pt;">
            Name(s) shown on return<br/>
            <!-- Added per UWR 31342 to allow 1040/ssn filer to use this form -->
             <!-- Choice between 1120, 1041, 1040 and 1040NR Return Header Filer info -->
                                                         <xsl:call-template name="PopulateFilerName">
                                                            <xsl:with-param name="TargetNode" select="$Form8881"/>
                                                         </xsl:call-template> 
          </div>
          <div class="styEINBox" style="width:31mm;height:auto;padding-left:2mm;font-size:7pt;">
           Identifying number<br/><br/>
              <span style="font-weight:normal;">  
            <!-- Choice between 1120, 1041, 1040 and 1040NR Return Header Filer info -->
                                                     <xsl:call-template name="PopulateFilerTIN">
                                                       <xsl:with-param name="TargetNode" select="$Form8881"/>
                                                     </xsl:call-template>     
              </span>          
          </div>
       </div>
<!-- Part I -->
				<div class="styStdDiv" style="border-top:0px solid black;border-bottom:1px solid black;">
					<span class="styPartName" style="width:16mm;">Part I</span>
					<span class="styPartDesc" style="width:170mm;height:auto;font-weight:normal;">
						<strong>Small Employer Pension Plan Startup Costs Credit and Contributions Credit</strong><br/>
					</span>
				</div>
		<div class="styBB" style="width:187mm;height:4mm;padding-top:0mm;border-top-width:0px;">
			<div class="styTitleDesc" style="height:auto;font-size:8pt;padding-left:4px;border-right-width:0px;border-top-width:0px;
				border-bottom-width:0px;">
Section 1 - Small Employer Pension Plan Startup Costs Credit
			</div>			
		</div>
    <!-- Line A -->      
      <div style="width:187mm;height:4mm;"> 
      <div style="float:left;height:4mm;">
        <div class="styLNLeftNumBoxSD" style="height:4mm;padding-left:4.5mm;padding-top:1mm;">A</div>
        <div class="styLNDesc" style="width:99mm;height:4mm;padding-top:1mm;">
          Enter the number of qualifying employees. See instructions
          <!--Dotted Line-->
			<span class="styUnderlineAmount" style="width:22mm;float:none;padding-right:10mm">
				<xsl:call-template name="PopulateAmount">
					<xsl:with-param name="TargetNode" select="$Form8881/QualifiedEmployeeCnt"/>
				</xsl:call-template></span>
        </div>
        </div>
         <!-- Line 1 Box-->
        <div style="float:right;"> 
        <div class="styLNRightNumBox" style="height:8mm;padding-top: 5mm;">1</div>
        <div class="styLNAmountBox" style="height:8mm;padding-top: 5mm;">
           <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="$Form8881/QualifiedStartupCostsIncurdAmt"/>
           </xsl:call-template>
        </div>
        <div class="styLNRightNumBox" style="background-color:lightgrey;height:11mm;border-bottom-width:0;"></div>
        <div class="styLNAmountBoxNBB" style="height:8mm;padding-top: 4mm"></div>
       </div>
      </div>
      
       <!-- Line 1 -->
      <div style="width:187mm;height:4mm;">
		<div style="float:left;height:4mm">
		 <div class="styLNLeftNumBoxSD" style="height:4mm;padding-left:4.5mm; padding-top:1mm;">1</div>
		  <div class="styLNDesc" style="width:99mm;height:4mm;padding-top:1mm;">
           Qualified startup costs incurred during the tax year.
           <span class="styDotLn" style="float:none;padding-left:1mm">........</span>
          </div>
		</div>
	  </div>
      <!-- line 2 -->
      <div style="width:187mm">
       <div style="float:left;">
        <div class="styLNLeftNumBoxSD" style="height:6mm;padding-left:4.5mm;padding-top: 2mm;">2</div>
        <div class="styLNDesc" style="width:139mm;height:6mm;padding-right:1mm;padding-top: 2mm;">
         Employers with 1-50 employees enter the amount from line 1.  Employers with 51-100 employees enter 50% (0.50) of line 1  
          <xsl:call-template name="SetFormLinkInline">
            <xsl:with-param name="TargetNode" select="$Form8881/QlfyStartupCostsIncurdPctAmt" />
            <xsl:with-param name="TabOrder" select="2"/>
          </xsl:call-template>
          <!--Dotted Line-->
			<span class="styDotLn" style="float:none;padding-left:2mm">............................</span>
        </div>
        </div>
	 <div style="float:right;"> 
        <div class="styLNRightNumBox" style="height:8mm;padding-top: 4mm;">2</div>
        <div class="styLNAmountBox" style="height:8mm;padding-top: 4mm;">
          <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="$Form8881/QlfyStartupCostsIncurdPctAmt"/>
          </xsl:call-template>
          </div>  
        </div>
        </div>
        
      <!-- line 3 -->
      <div style="width:187mm">
        <div style="float:left;">      
        <div class="styLNLeftNumBoxSD" style="height:2mm;padding-left:4.5mm;padding-top: 1.5mm;">3</div>
			<div class="styLNDesc" style="height:2mm;padding-right:1mm;padding-top: 1.5mm;">
			  Enter the number of employees eligible to participate in the pension plan. See instructions.
				<span style="float:right;padding-right:0mm;padding-bottom:1.5mm; font-size:6pt">
					<span style="width:2mm;border-botom-width:0px;float:left;"></span>
						<span class="styUnderlineAmount" style="width:14mm;padding-top:0mm;padding-bottom:0mm;padding-right:5mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form8881/PensionPlanEligibleEmplCnt"/>
							</xsl:call-template>
						</span>
						<span style="width:7mm;padding-top:0mm;">x 250</span>
				</span> 
			</div>
         </div>
		<div style="float:right;"> 
        <div class="styLNRightNumBox" style="height:5mm;padding-top: 1.5mm;">3</div>
        <div class="styLNAmountBox" style="height:5mm;padding-top: 1.5mm;">
          <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="$Form8881/PensionPlanEmplBaseCalcAmt"/>
          </xsl:call-template>
          </div>  
        </div>     
          </div> 
               
   <!-- line 4 -->
   <div style="width:187mm">
   <div style="float:left;">  
        <div class="styLNLeftNumBoxSD" style="height:2mm;padding-left:4.5mm;padding-top: 1.5mm;">4</div>
        <div class="styLNDesc" style="height:2mm;padding-right:1mm;padding-top: 1.5mm;">
         Enter the greater of $500 or the amount from line 3 (Do not enter more than $5,000)
          <!--Dotted Line-->
			<span class="styDotLn" style="float:none;padding-left:1mm">.......</span>
        </div>
        </div>
        <div style="float:right;"> 
        <div class="styLNRightNumBox" style="height:5mm;padding-top: 1.5mm;">4</div>
        <div class="styLNAmountBox" style="height:5mm;padding-top: 1.5mm;">
          <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="$Form8881/PensionPlanEmplLimitedCalcAmt"/>
          </xsl:call-template>
          </div>  
        </div>
        </div> 
             
      <!-- line 5 -->
       <div style="width:187mm">
        <div style="float:left;height:4mm;">  
        <div class="styLNLeftNumBoxSD" style="height:2mm;padding-left:4.5mm;padding-top:1.5mm;">5</div>
        <div class="styLNDesc" style="height:2mm;padding-top:1.5mm;border-bottom-width:1px;">
         Enter the smaller of line 2 or line 4
          <!--Dotted Line-->
			<span class="styDotLn" style="float:none;padding-left:1mm">.......................</span>
        </div>
         </div>
           <div style="float:right;"> 
        <div class="styLNRightNumBox" style="height:5mm;padding-top:1.5mm;border-bottom-width:1px;">5</div>
        <div class="styLNAmountBox" style="height:5mm;padding-top:1.5mm;border-bottom-width:1px;">
          <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="$Form8881/SmllrStartupCostEmplLtdCalcAmt"/>
          </xsl:call-template>
          </div>  
        </div>
        </div>
        
      <!-- line 5 grey box -->
       <div style="width:187mm">
        <div style="float:left;height:4mm;">  
        <div class="styLNLeftNumBoxSD" style="height:2mm;padding-left:4.5mm;padding-top:1mm;"></div>
        <div class="styLNDesc" style="height:2mm;padding-top:1mm;border-bottom-width:1px;">
If you are NOT calculating the credit for employer contributions, go to line 7. All others, go to line 6a.
          <!--Dotted Line-->
			<span class="styDotLn" style="float:none;padding-left:1mm">..</span>
        </div>
         </div>
           <div style="float:right;"> 
        <div class="styLNRightNumBox" style="height:5mm;padding-top:1mm;border-bottom-width:0px;background-color:lightgrey;"></div>
        <div class="styLNAmountBox" style="height:5mm;padding-top:1mm;border-bottom-width:0px;background-color:lightgrey;">
          </div>  
        </div>
        </div>        
        
        
      <!-- Section 2 -->
		<div class="styBB" style="width:187mm;border-top-width:1px">
			<div class="styTitleDesc" style="height:auto;font-size:7.96pt;padding-left:4px;border-right-width:0px;border-top-width:1px;
				border-bottom-width:0px;">
				Section 2 - Small Employer Contributions Credit
			</div>			
		</div> 
        
      <!-- line 6a -->
      <div style="width:187mm">
        <div style="float:left;">
        <div class="styLNLeftNumBoxSD" style="height:2mm;padding-top: 1.5mm;">6a</div>
        <div class="styLNDesc" style="height:2mm;padding-right:1mm;padding-top: 1.5mm;">
          Enter the number of employees from the preceding tax year. See instructions  
          <!--Dotted Line-->
			<span class="styDotLn" style="float:none;padding-left:2mm">.........</span>
        </div>
         </div>
		<div style="float:right;"> 
        <div class="styLNRightNumBox" style="height:5mm;padding-top: 1.5mm;">6a</div>
        <div class="styLNAmountBox" style="height:5mm;padding-top: 1.5mm;">
          <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="$Form8881/PrecedingTaxYrEmployeeCnt"/>
          </xsl:call-template>
          </div>  
        </div>     
          </div> 
       
        <!-- line 6b -->
      <div style="width:187mm">
        <div style="float:left;">
        <div class="styLNLeftNumBoxSD" style="height:6mm;padding-top: 1.5mm;padding-left: 4mm;">b</div>
        <div class="styLNDesc" style="height:6mm;padding-right:1mm;padding-top: 1.5mm;">
          Enter employer contributions made to the plan, but don’t include (i) elective deferrals, (ii) contributions made to employees whose wages paid to the employee were in excess of $105,000 and (iii) any amount of contributions to an employee to whom you made contributions of more than $1,000 
          <!--Dotted Line-->
			<span class="styDotLn" style="float:none;padding-left:0mm">.......</span>
        </div>
         </div>
		<div style="float:right;"> 
        <div class="styLNRightNumBox" style="height:11mm;padding-top: 7.5mm;">6b</div>
        <div class="styLNAmountBox" style="height:11mm;padding-top: 7.5mm;">
          <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="$Form8881/SmllEmplrContriToPnsnPlanAmt"/>
          </xsl:call-template>
          </div>  
        </div>     
          </div>   
          
   <!-- line 6c -->
      <div style="width:187mm">
        <div style="float:left;">
        <div class="styLNLeftNumBoxSD" style="height:10mm;padding-top: 1mm;padding-left: 4mm;">c</div>
        <div class="styLNDesc" style="height:10mm;padding-right:1mm;padding-top: 1mm;">
         For employees for whom you made matching and nonelective contributions of more than $1,000, (and who are not disqualified because they meet 6b(ii) above), see the instructions for information on how to determine the amount to enter on line 6c. If you do not make these types of contributions, enter -0-
          <!--Dotted Line-->
			<span class="styDotLn" style="float:none;padding-left:2mm">..</span>
        </div>
         </div>
		<div style="float:right;"> 
        <div class="styLNRightNumBox" style="height:10mm;padding-top: 6.5mm;">6c</div>
        <div class="styLNAmountBox" style="height:10mm;padding-top: 6.5mm;">
          <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="$Form8881/EligibleCreditEmplContriAmt"/>
          </xsl:call-template>
          </div>  
        </div>     
          </div>   
            
  <!-- line 6d -->
      <div style="width:187mm">
        <div style="float:left;">
        <div class="styLNLeftNumBoxSD" style="height:5mm;padding-top: 1.5mm;padding-left: 4mm;">d</div>
        <div class="styLNDesc" style="height:5mm;padding-right:1mm;padding-top: 1.5mm;">
          Add lines 6b and 6c 
          <!--Dotted Line-->
			<span class="styDotLn" style="float:none;padding-left:3mm">...........................</span>
        </div>
         </div>
		<div style="float:right;"> 
        <div class="styLNRightNumBox" style="height:5mm;padding-top: 1.5mm;">6d</div>
        <div class="styLNAmountBox" style="height:5mm;padding-top: 1.5mm;">
          <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="$Form8881/TotSmllEmplrCrEmplContriAmt"/>
          </xsl:call-template>
          </div>  
        </div>     
          </div>    
          
          
         
             
          
  <!-- line 6e1 (blank/gray space above) -->
   <div style="width:187mm">
   <div style="float:left;">  
        <div class="styLNLeftNumBoxSD" style="height:5mm;padding-top: 1.5mm;"> </div>
        <div class="styLNDesc" style="height:5mm;padding-right:1mm;padding-top: 0mm;">
        If the number of employees entered on line 6a is 50 or less, enter the amount from line 6d on line 6f. If the number of employees entered on line 6a is 51-100, continue to line 6e(1).
          <!--Dotted Line-->
			<span class="styDotLn" style="float:none;padding-left:2mm"></span>
        </div>
        </div>
        <div style="float:right;"> 
        <div class="styLNRightNumBox" style="background-color:lightgrey;height:5mm;border-bottom-width:0; padding-top: 5mm;"></div>
        <div class="styLNAmountBox" style="border-bottom-width:0; padding-top: 5mm;">
          </div>  
        </div>
        </div> 
             
             <!-- line 6e(1) -->
      <div style="width:187mm">
        <div style="float:left;">      
        <div class="styLNLeftNumBoxSD" style="height:5mm;padding-top: 2mm;padding-left: 4mm;"> e</div>
			<div class="styLNDesc" style="height:5mm;padding-right:1mm;padding-top: 2mm;"> 
			<span style="font-weight:bold;">(1)</span> Subtract 50 (50.0) from the number of employees entered on line 6a
			<!--Dotted Line-->
			<span class="styDotLn" style="float:none;padding-left:0mm">...........</span>
			</div>
         </div>
		<div style="float:right;"> 
        <div class="styLNRightNumBox" style="height:5mm;font-size:6pt;padding-top: 2mm;">6e(1)</div>
        <div class="styLNAmountBox" style="height:5mm;padding-top: 2mm;">
          <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="$Form8881/NetPrecedingTaxYrEmployeeCnt"/>
          </xsl:call-template>
          </div>  
        </div>     
          </div> 
          
          <!-- line 6e(2) -->
      <div style="width:187mm">
        <div style="float:left;">      
        <div class="styLNLeftNumBoxSD" style="height:5mm;padding-top: 2mm;padding-left: 4mm;"> </div>
			<div class="styLNDesc" style="height:5mm;padding-right:1mm;padding-top: 2mm;"> 
			<span style="font-weight:bold;">(2)</span> Multiply line 6e(1) by 2% (0.02)
			<!--Dotted Line-->
			<span class="styDotLn" style="float:none;padding-left:2mm">......................</span>
			</div>
         </div>
		<div style="float:right;"> 
        <div class="styLNRightNumBox" style="height:5mm;font-size:6pt;padding-top: 2mm;">6e(2)</div>
        <div class="styLNAmountBox" style="height:5mm;padding-top: 2mm;">
          <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="$Form8881/NetPrecTaxYrEmplCntByPct"/>
          </xsl:call-template>
          </div>  
        </div>     
          </div> 
          
          <!-- line 6e(3) -->
      <div style="width:187mm">
        <div style="float:left;">      
        <div class="styLNLeftNumBoxSD" style="height:5mm;padding-top: 2mm;padding-left: 4mm;"> </div>
			<div class="styLNDesc" style="height:5mm;padding-right:1mm;padding-top: 2mm;"> 
			<span style="font-weight:bold;">(3)</span> Multiply line 6e(2) by line 6d 
			<!--Dotted Line-->
			<span class="styDotLn" style="float:none;padding-left:2mm">.......................</span>
			</div>
         </div>
		<div style="float:right;"> 
        <div class="styLNRightNumBox" style="height:5mm;font-size:6pt;padding-top: 2mm;">6e(3)</div>
        <div class="styLNAmountBox" style="height:5mm;padding-top: 2mm;">
          <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="$Form8881/MultNetPrecTYEmplByCntPctAmt"/>
          </xsl:call-template>
          </div>  
        </div>     
          </div> 
          
          <!-- line 6e(4) -->
      <div style="width:187mm">
        <div style="float:left;">      
        <div class="styLNLeftNumBoxSD" style="height:5mm;padding-top: 2mm;padding-left: 4mm;"> </div>
			<div class="styLNDesc" style="height:5mm;padding-right:1mm;padding-top: 2mm;"> 
			<span style="font-weight:bold;">(4)</span> Subtract line 6e(3) from line 6d
			<!--Dotted Line-->
			<span class="styDotLn" style="float:none;padding-left:2mm">......................</span>
			</div>
         </div>
		<div style="float:right;"> 
        <div class="styLNRightNumBox" style="height:5mm;font-size:6pt;padding-top: 2mm;">6e(4)</div>
        <div class="styLNAmountBox" style="height:5mm;padding-top: 2mm;">
          <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="$Form8881/NetEligibleCreditEmplContriAmt"/>
          </xsl:call-template>
          </div>  
        </div>     
          </div> 
         
        <!-- line 6f -->
      <div style="width:187mm">
        <div style="float:left;">
        <div class="styLNLeftNumBoxSD" style="height:7.5mm;padding-top: 2mm;padding-left: 4mm;">f</div>
        <div class="styLNDesc" style="height:7.5mm;padding-right:1mm;padding-top: 2mm;">
         If you did NOT complete line 6e, enter the amount from line 6d. If you completed line 6e, enter the amount from line 6e(4)
          <!--Dotted Line-->
			<span class="styDotLn" style="float:none;padding-left:3mm">............................</span>
        </div>
         </div>
		<div style="float:right;"> 
        <div class="styLNRightNumBox" style="height:7.5mm;padding-top: 4mm;">6f</div>
        <div class="styLNAmountBox" style="height:7.5mm;padding-top: 4mm;">
          <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="$Form8881/PhaseoutEligCrEmplContriAmt"/>
          </xsl:call-template>
          </div>  
        </div>     
          </div>       
          
          <!-- line 6g -->
      <div style="width:187mm">
        <div style="float:left;">
        <div class="styLNLeftNumBoxSD" style="height:5.5mm;padding-top: 2.5mm;padding-left: 4mm;">g</div>
        <div class="styLNDesc" style="height:5.5mm;padding-right:1mm;padding-top: 2.5mm;">
          Applicable percentages. See instructions
          <!--Dotted Line-->
			<span class="styDotLn" style="float:none;padding-left:2mm">.....................</span>
        </div>
         </div>
		<div style="float:right;"> 
        <div class="styLNRightNumBox" style="height:5.5mm;padding-top: 2mm;">6g</div>
        <div class="styLNAmountBox" style="height:5.5mm;padding-top: 2mm;">
          <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="$Form8881/AddnlCrEmplrContriEligEmplrAmt"/>
          </xsl:call-template>
          </div>  
        </div>     
          </div>        
         
         <!-- line 6g (dot 1 - gray space) -->
   <div style="width:187mm">
   <div style="float:left;">  
        <div class="styLNLeftNumBoxSD" style="height:2mm;padding-top: 1mm;"> </div>
        <div class="styLNDesc" style="height:2mm;padding-right:1mm;padding-top: 1mm;">
           • If this is treated as the first or second year of the plan, enter the amount from line 6f.

          <!--Dotted Line-->
			<span class="styDotLn" style="float:none;padding-left:2mm"></span>
        </div>
        </div>
        <div style="float:right;"> 
        <div class="styLNRightNumBox" style="background-color:lightgrey;height:2mm;border-bottom-width:0; padding-top: 4mm;"></div>
        <div class="styLNAmountBox" style="border-bottom-width:0; padding-top: 4mm;">
          <!--<xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="$Form8881/SumCostsAndCrFromPPStartupAmt"/>
          </xsl:call-template>-->
          </div>  
        </div>
        </div> 
        
        <!-- line 6g (dot 2 - gray space) -->
   <div style="width:187mm">
   <div style="float:left;">  
        <div class="styLNLeftNumBoxSD" style="height:2mm;padding-top: 1mm;"> </div>
        <div class="styLNDesc" style="height:2mm;padding-right:1mm;padding-top: 1mm;">
           • If this is treated as the third year of the plan, multiply line 6f by 75% (0.75).

          <!--Dotted Line-->
			<span class="styDotLn" style="float:none;padding-left:2mm"></span>
        </div>
        </div>
        <div style="float:right;"> 
        <div class="styLNRightNumBox" style="background-color:lightgrey;height:2mm;border-bottom-width:0; padding-top: 4mm;"></div>
        <div class="styLNAmountBox" style="border-bottom-width:0; padding-top: 4mm;">
          <!--<xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="$Form8881/SumCostsAndCrFromPPStartupAmt"/>
          </xsl:call-template>-->
          </div>  
        </div>
        </div> 
        
        <!-- line 6g (dot 3 - gray space) -->
   <div style="width:187mm">
   <div style="float:left;">  
        <div class="styLNLeftNumBoxSD" style="height:2mm;padding-top: 1mm;"> </div>
        <div class="styLNDesc" style="height:2mm;padding-right:1mm;padding-top: 1mm;">
           • If this is treated as the fourth year of the plan, multiply line 6f by 50% (0.50).

          <!--Dotted Line-->
			<span class="styDotLn" style="float:none;padding-left:2mm"></span>
        </div>
        </div>
        <div style="float:right;"> 
        <div class="styLNRightNumBox" style="background-color:lightgrey;height:2mm;border-bottom-width:0; padding-top: 4mm;"></div>
        <div class="styLNAmountBox" style="border-bottom-width:0; padding-top: 4mm;">
          <!--<xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="$Form8881/SumCostsAndCrFromPPStartupAmt"/>
          </xsl:call-template>-->
          </div>  
        </div>
        </div> 
        
        <!-- line 6g (dot 4 - gray space) -->
   <div style="width:187mm">
   <div style="float:left;">  
        <div class="styLNLeftNumBoxSD" style="height:2mm;padding-top: 1mm;"> </div>
        <div class="styLNDesc" style="height:2mm;padding-right:1mm;padding-top: 1mm;">
           • If this is treated as the fifth year of the plan, multiply the amount on line 6f by 25% (0.25).
          <!--Dotted Line-->
			<span class="styDotLn" style="float:none;padding-left:2mm"></span>
        </div>
        </div>
        <div style="float:right;"> 
        <div class="styLNRightNumBox" style="background-color:lightgrey;height:2mm;border-bottom-width:0; padding-top: 4mm;"></div>
        <div class="styLNAmountBox" style="border-bottom-width:0; padding-top: 4mm;">
          <!--<xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="$Form8881/SumCostsAndCrFromPPStartupAmt"/>
          </xsl:call-template>-->
          </div>  
        </div>
        </div> 
        
        
      <!-- Section 3 -->
		<div class="styBB" style="width:187mm;border-top-width:1px">
			<div class="styTitleDesc" style="height:auto;font-size:7.96pt;padding-left:4px;border-right-width:0px;border-top-width:1px;
				border-bottom-width:0px;">
				Section 3 - Total Credits from Part I
			</div>			
		</div> 
        
        
         
        <!-- line 7 -->
      <div style="width:187mm">
        <div style="float:left;">      
        <div class="styLNLeftNumBoxSD" style="height:8.5mm;padding-left:4.5mm;padding-top: 2mm;">7</div>
			<div class="styLNDesc" style="height:8.5mm;padding-right:1mm;padding-top: 2mm;"> 
			Small employer pension plan startup costs credit and small employer contributions credit from partnerships and S corporations
			<!--Dotted Line-->
			<span class="styDotLn" style="float:none;padding-left:.5mm">............................</span>
			</div>
         </div>
		<div style="float:right;"> 
        <div class="styLNRightNumBox" style="height:8.5mm;padding-top: 5mm;">7</div>
        <div class="styLNAmountBox" style="height:8.5mm;padding-top: 5.5mm;">
          <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="$Form8881/StartupCostsPrtshpSCorpCrAmt"/>
          </xsl:call-template>
          </div>  
        </div>     
          </div> 
         
      <!-- line 8 -->
       <div style="width:187mm">
        <div style="float:left;">  
        <div class="styLNLeftNumBoxSD" style="height:8.5mm;padding-left:4.5mm;padding-top:2mm;">8</div>
        <div class="styLNDesc" style="height:8.5mm;padding-top:2mm;">
         Add lines 5, 6g, and 7. Partnerships and S corporations, report this amount on Schedule K. All others, report this amount on Form 3800, Part III, line 1j
          <!--Dotted Line-->
          <span style="letter-spacing:3.4mm;font-weight:bold;padding-right:1mm;skiplink:display:none;">...................</span>  
        </div>
         </div>
           <div style="float:right;"> 
        <div class="styLNRightNumBox" style="height:8.5mm;padding-top:5.5mm;border-bottom-width:0px;">8</div>
        <div class="styLNAmountBox" style="height:8.5mm;padding-top:5.5mm;border-bottom-width:0px;">
          <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="$Form8881/PensionPlanStartupCostsCrAmt"/>
          </xsl:call-template>
          </div>  
        </div>
        </div>
        
<!-- Part II -->
				<div class="styStdDiv" style="border-top:1px solid black;border-bottom:1px solid black;">
					<span class="styPartName" style="width:16mm;">Part II</span>
					<span class="styPartDesc" style="width:170mm;height:auto;font-weight:normal;">
						<strong>Small Employer Auto-Enrollment Credit</strong><br/>
					</span>
				</div>
		
		
      <!-- line 9 -->
      <div style="width:187mm">
        <div style="float:left;">
        <div class="styLNLeftNumBoxSD" style="height:4mm;padding-left:4.5mm; padding-top: 1mm;">9</div>
        <div class="styLNDesc" style="height:4mm;padding-right:1mm;padding-top: 1mm;">
          Enter $500 if an auto-enrollment option is provided for retirement savings. See instructions.
          <!--Dotted Line-->
			<span class="styDotLn" style="float:none;padding-left:.75mm">.....</span>
        </div>
         </div>
		<div style="float:right;"> 
        <div class="styLNRightNumBox" style="height:4mm;padding-top: 1mm;">9</div>
        <div class="styLNAmountBox" style="height:4mm;padding-top: 1mm;">
          <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="$Form8881/AutoEnrlmtOptForRetireSavCrAmt"/>
          </xsl:call-template>
          </div>  
        </div>     
          </div> 
               
  <!-- line 10 -->
   <div style="width:187mm">
   <div style="float:left;">  
        <div class="styLNLeftNumBoxSD" style="height:4mm;padding-top: 1mm;">10</div>
        <div class="styLNDesc" style="height:4mm;padding-right:1mm;padding-top: 1mm;">
         Small employer auto-enrollment credit from partnerships and S corporations
          <!--Dotted Line-->
			<span class="styDotLn" style="float:none;padding-left:.75mm">..........</span>
        </div>
        </div>
        <div style="float:right;"> 
        <div class="styLNRightNumBox" style="height:4mm;padding-top: 1mm;">10</div>
        <div class="styLNAmountBox" style="height:4mm;padding-top: 1mm;">
          <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="$Form8881/AutoEnrlmtPrtshpSCorpCrAmt"/>
          </xsl:call-template>
          </div>  
        </div>
        </div> 
             
              <!-- Gray space after line 10 
      <div style="width:187mm">
        <div style="float:left;">      
        <div class="styLNLeftNumBoxSD" style="height:6mm;padding-top: 4mm;"> </div>
			<div class="styLNDesc" style="height:6mm;padding-right:1mm;padding-top: 4mm;"> 
			</div>
         </div>
		<div style="float:right;"> 
        <div class="styLNRightNumBox" style="background-color:lightgrey;height:6mm;padding-top: 4mm;"> </div>
        <div class="styLNAmountBox" style="height:6mm;padding-top: 4mm; border-bottom-width:0px;">
          <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="$Form8881/PensionPlanEmplBaseCalcAmt"/>
          </xsl:call-template>
          </div>  
        </div>     
          </div> -->
          
      <!-- line 11 -->
       <div style="width:187mm">
        <div style="float:left;">  
        <div class="styLNLeftNumBoxSD" style="height:7.5mm;padding-top:1mm;">11</div>
        <div class="styLNDesc" style="height:7.5mm;padding-top:1mm;border-bottom-width:1px;">
         Add lines 9 and 10.  Partnerships and S corporations, report this amount on Schedule K. All others, report this amount on 
         Form 3800, Part III, line 1dd
          <!--Dotted Line-->
			<span class="styDotLn" style="float:none;padding-left:2mm">.....................</span>
        </div>
         </div>
           <div style="float:right;"> 
        <div class="styLNRightNumBoxNBB" style="height:7.5mm;padding-top:4.5mm;">11</div>
        <div class="styLNAmountBoxNBB" style="height:7.5mm;padding-top:4.5mm;">
          <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="$Form8881/SmllEmplrAutoEnrlmtCrAmt"/>
          </xsl:call-template>
          </div>  
        </div>
        </div>
    
<!-- Part III -->
				<div class="styStdDiv" style="border-top:1px solid black;border-bottom:1px solid black;">
					<span class="styPartName" style="width:16mm;">Part III</span>
					<span class="styPartDesc" style="width:170mm;height:auto;font-weight:normal;">
						<strong>Small Employer Military Spouse Participation Credit</strong><br/>
					</span>
				</div>

		<!-- Caution Line (blank/gray space) -->
   <div style="width:187mm">
   <div style="float:left;">  
        <div class="styLNDesc" style="height:2mm;padding-left:4.5mm;padding-top: 1mm;">
          <span style="font-weight:bold;"> Caution:</span> You can’t claim the credit if you had more than 100 employees in the preceding tax year.
          <!--Dotted Line-->
			<span class="styDotLn" style="float:none;padding-left:2mm"></span>
        </div>
        </div>
        <div style="float:right;"> 
        <div class="styLNRightNumBox" style="background-color:lightgrey;height:2mm;border-bottom-width:0; padding-top: 4mm;"></div>
        <div class="styLNAmountBox" style="border-bottom-width:0; padding-top: 4mm;">
          <!--<xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="$Form8881/SumCostsAndCrFromPPStartupAmt"/>
          </xsl:call-template>-->
          </div>  
        </div>
        </div> 
        
      <!-- line 12 -->
      <div style="width:187mm">
        <div style="float:left;">
        <div class="styLNLeftNumBoxSD" style="height:8mm;padding-top: 1mm;">12</div>
        <div class="styLNDesc" style="height:8mm;padding-right:1mm;padding-top: 1mm;">
         Enter the number of military spouse employees participating in an eligible plan. See instructions.
         <span style="float:left;padding-right:0mm;padding-bottom:1.5mm; font-size:6pt">
					<span style="width:2mm;border-botom-width:0px;float:left;"></span>
						<span class="styUnderlineAmount" style="width:14mm;padding-top:0mm;padding-bottom:0mm;padding-right:5mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form8881/MilSpsEmplPrtcptEligPlanCnt"/>
							</xsl:call-template>
						</span>
						<span style="width:7mm;padding-top:0mm;">x 200</span>
				</span> 
          <!--Dotted Line-->
			<span class="styDotLn" style="float:left;padding-left:2mm">............................</span>
        </div>
         </div>
		<div style="float:right;"> 
        <div class="styLNRightNumBox" style="height:8mm;padding-top: 5mm;">12</div>
        <div class="styLNAmountBox" style="height:8mm;padding-top: 5mm;">
          <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="$Form8881/MilSpsEmplPrtcptEligPlanAmt"/>
          </xsl:call-template>
          </div>  
        </div>     
          </div> 
               
  <!-- line 13 -->
   <div style="width:187mm">
   <div style="float:left;">  
        <div class="styLNLeftNumBoxSD" style="height:7.5mm;padding-top: 1.5mm;">13</div>
        <div class="styLNDesc" style="height:7.5mm;padding-right:1mm;padding-top: 1.5mm;">
        Amount of contributions paid by employer for each eligible military spouse employee. Do not enter more than $300 per employee. See instructions
          <!--Dotted Line-->
			<span class="styDotLn" style="float:none;padding-left:2mm">......................</span>
        </div>
        </div>
        <div style="float:right;"> 
        <div class="styLNRightNumBox" style="height:7.5mm;padding-top: 4.5mm;">13</div>
        <div class="styLNAmountBox" style="height:7.5mm;padding-top: 4.5mm;">
          <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="$Form8881/EmplrContriPaidMilSpsAmt"/>
          </xsl:call-template>
          </div>  
        </div>
        </div> 
             
              <!-- line 14 -->
   <div style="width:187mm">
   <div style="float:left;">  
        <div class="styLNLeftNumBoxSD" style="height:4mm;padding-top: 1mm;">14</div>
        <div class="styLNDesc" style="height:4mm;padding-right:1mm;padding-top: 1mm;">
         Small employer military spouse participation credit from partnerships and S corporations 
          <!--Dotted Line-->
			<span class="styDotLn" style="float:none;padding-left:1mm">......</span>
        </div>
        </div>
        <div style="float:right;"> 
        <div class="styLNRightNumBox" style="height:4mm;padding-top: 1mm;">14</div>
        <div class="styLNAmountBox" style="height:4mm;padding-top: 1mm;">
          <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="$Form8881/MilSpsRetirePrtshpSCorpCrAmt"/>
          </xsl:call-template>
          </div>  
        </div>
        </div> 
          
      <!-- line 15 -->
       <div style="width:187mm">
        <div style="float:left;">  
        <div class="styLNLeftNumBoxSD" style="height:7.5mm;padding-top:1mm;">15</div>
        <div class="styLNDesc" style="height:7.5mm;padding-top:1mm;border-bottom-width:1px;">
         Add lines 12, 13, and 14. Partnerships and S corporations, report this amount on Schedule K. All others, report this amount on Form 3800, Part III, line 1ee
          <!--Dotted Line-->
			<span class="styDotLn" style="float:none;padding-left:0mm">..................</span>
        </div>
         </div>
           <div style="float:right;"> 
        <div class="styLNRightNumBoxNBB" style="height:7.5mm;padding-top:4.5mm;">15</div>
        <div class="styLNAmountBoxNBB" style="height:7.5mm;padding-top:4.5mm;">
          <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="$Form8881/MilSpsParticipationCrAmt"/>
          </xsl:call-template>
          </div>  
        </div>
        </div>   
       
  <!-- Page End -->
      <div style="width:187mm; border-top:1px solid Black; font-size:8pt">    
        <div style="font-weight:bold; float:left; padding-top:0.5mm">
         For Paperwork Reduction Act Notice, see separate instructions.
        </div>    
        <div style="float:right">
          <span style="margin-right:16mm; font-size:7pt">Cat. No. 33435N</span>          
          Form <b>8881</b> (Rev. 12-2025) 
        </div>      
      </div> 
      <br/><br/> 
      
      <!--<p style="page-break-before:always" /> -->  

      <div class="styLeftOverTitleLine" id="LeftoverData" style="font-family:verdana, arial, sans-serif">
        <div class="styLeftOverTitle">
          Additional Data        
        </div>
        <div class="styLeftOverButtonContainer">
          <input class="styLeftoverTableBtn" type="button" value="Return to Form" onclick="javascript:returnToWriteInImage()" tabindex="1"/>
        </div>      
      </div>
   

      <table class="styLeftOverTbl">
        <xsl:call-template name="PopulateCommonLeftover">
          <xsl:with-param name="TargetNode" select="$Form8881" />        
        </xsl:call-template>
      </table>      
    </form>
  </body>
</html>
</xsl:template>
</xsl:stylesheet>
