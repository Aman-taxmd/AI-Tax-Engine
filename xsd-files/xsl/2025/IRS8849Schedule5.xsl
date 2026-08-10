<?xml version="1.0"?>
<!DOCTYPE xsl:stylesheet [<!ENTITY nbsp "&#160;">]>
<!-- 06/01/2015 - Changes made for IE11 compatibility - Jeremy Nichols -->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">

<xsl:include href="PopulateTemplate.xsl"/>
<xsl:include href="CommonPathRef.xsl"/>
<xsl:include href="AddHeader.xsl"/>
<xsl:include href="IRS8849Schedule5Style.xsl"/>
<xsl:include href="AddOnTable.xsl"/>

<xsl:output method="html" indent="yes" encoding="iso-8859-1"/>

<xsl:strip-space elements="*"/>
<xsl:param name="FormData" select="$RtnDoc/IRS8849Schedule5"/>


<xsl:template match="/">
<xsl:text disable-output-escaping="yes">&lt;!DOCTYPE html&gt;</xsl:text>
		<html>
<head>
				<meta http-equiv="X-UA-Compatible" content="IE=edge"/>  
  <title><xsl:call-template name="FormTitle"><xsl:with-param name="RootElement" select="local-name($FormData)"/></xsl:call-template></title>
  <!-- No Browser Caching -->
  <meta http-equiv="Pragma" content="no-cache"/>
  <meta http-equiv="Cache-Control" content="no-cache"/>
  <meta http-equiv="Expires" content="0"/>
  <!-- No Proxy Caching -->
  <meta http-equiv="Cache-Control" content="private"/>  
  <meta name="Description" content="Form IRS 8849 Schedule 5"/>
  <meta name="GENERATOR" content="IBM WebSphere Studio"/>
  <link rel="stylesheet" type="text/css" href="{$CSSPath}/header.css"/>
  <link rel="stylesheet" type="text/css" href="{$CSSPath}/body.css"/>
  <link rel="stylesheet" type="text/css" href="{$CSSPath}/general.css"/>
  <script language="JavaScript" src="{$ScriptPath}/FormDisplay.js" type="text/javascript"/>
  <xsl:call-template name="InitJS"/>  
  <style type="text/css">    
    <xsl:if test="not($Print) or $Print=''">
      <xsl:call-template name="IRS8849Schedule5Style"/>
      <xsl:call-template name="AddOnStyle"/>  
    </xsl:if>
  </style>      
  
</head>

<body class="styBodyClass">
  <form name="Form8849Schedule5">    
    <xsl:call-template name="DocumentHeader"/>  
    
  <!--Title of Form -->    
  <div class="styBB" style="width:187mm;height: 16.5mm;">
    <div class="styFNBox" style="width:31mm;font-size: 7pt;height: 16.5mm;font-weight:bold">
	    	Schedule 5<br/>
		(Form 8849)	
      <span style="display:inline;">
        <xsl:call-template name="SetFormLinkInline">
          <xsl:with-param name="TargetNode" select="$FormData"/>
        </xsl:call-template>  
      </span>  
      <br/><span style="font-weight:normal">(Rev. December 2025)</span>
      <br/>
      <span class="styAgency" style="height:2mm;padding-top:1mm;">Department of the Treasury</span><br/><span class="styAgency" style="height:2mm;">Internal Revenue Service</span>
    </div>
    
    <div class="styFTBox" style="height: 16.5mm;width:125mm;padding-top:4mm;">
      <div class="styMainTitle" style="height: 5mm">Section 4081(e) and 6435 Claims</div>
      
      <div class="styFST" style="font-size:7pt;margin-left:3mm;font-weight:normal">  
		Go to <span style="font-style:italic;">www.irs.gov/Form8849</span> for instructions and the latest information.
      </div>
    </div>
    
    <div class="styTYBox" style="width:30mm;height:16.5mm; border-left-width: 1px;padding-top:8mm">
      OMB No. 1545-1420
    </div>
  </div>
  <!--  End title of Form  -->

  
    <!--  Name and Employer identification number  -->
  <div style="width:187mm">
  <table class="styBB" cellspacing="0" style="width:187mm">
  <tr>
    <th scope="col" class="styNameBox" style="width:112mm;font-weight:normal;font-size:7pt;text-align:left">
      Name as shown on Form 8849<br/>
      <xsl:call-template name="PopulateReturnHeaderFiler"><xsl:with-param name="TargetNode">BusinessNameLine1Txt</xsl:with-param></xsl:call-template><br/>  
      <xsl:call-template name="PopulateReturnHeaderFiler"><xsl:with-param name="TargetNode">BusinessNameLine2Txt</xsl:with-param></xsl:call-template>      
    </th>
    <th scope="col" class="styEINBox" style="vertical-align:top; padding-left:2mm;border-right:1px solid black;font-size:7pt;width:31mm;font-weight:normal;text-align:left">
	   EIN
      <br/><br/>
      <span style="font-weight:normal;">  
		<xsl:choose>
			<xsl:when test="normalize-space($FormData/EmployerIdentificationNumber) != ''">
			<xsl:call-template name="PopulateEIN">
				<xsl:with-param name="TargetNode" select="$FormData/EmployerIdentificationNumber"/>
			</xsl:call-template>
			</xsl:when>
			<xsl:when test="normalize-space($FormData/MissingEINReason) != ''">
				<xsl:call-template name="PopulateText">
					<xsl:with-param name="TargetNode" select="$FormData/MissingEINReason"/>
				</xsl:call-template>
			</xsl:when>
			<xsl:otherwise>
			<xsl:if test="($RtnHdrData/Filer/EIN)">
				<xsl:call-template name="PopulateEIN">
					<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/EIN"/>
				</xsl:call-template>		
			</xsl:if>
			<xsl:if test="($RtnHdrData/Filer/SSN) and not ($RtnHdrData/Filer/EIN)">
				<xsl:call-template name="PopulateEIN">
					<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/SSN"/>
				</xsl:call-template>		
			</xsl:if>                 
			</xsl:otherwise>
		</xsl:choose>
      </span>    
    </th>
    <th scope="col" class="styEINBox" style="vertical-align:top;font-weight:normal;padding-left:2mm;font-size:7pt;width:44mm;text-align:right">
	    <span style="float:left">Total claim (see instructions)</span>
	    <br/><br/><span style="float:left">$</span>
      <span style="font-weight:normal;">  
	      <xsl:call-template name="PopulateAmount"><xsl:with-param name="TargetNode" select="$FormData/TotalRefundAmt"/></xsl:call-template>
      </span>    
    </th>
    </tr>
    </table>
  </div>  
  <!--  End Name and Employer indentification number  -->
  
  
  <div class="styBB" style="width:187mm;padding-top:4mm;">
	<span class="styBoldText">
		Claimant's registration number
	</span>	
	<span style="width:2mm"/>
	 
	<xsl:call-template name="PopulateText">
		<xsl:with-param name="TargetNode" select="$FormData/ClaimantRegistrationNum"/>
	</xsl:call-template>

  </div>
  <div class="styBB" style="height:9mm;width:187mm;">
	  <div class="styPartName" style="height:4mm;">
		  Part I
	  </div>
	  <span style="width:5mm;"/>
	  <div class="styLineDesc" style="display:inline;">
		  <span class="styBoldText" style="display:inline;">
			  Claim for Refund or Payment of Tax. Caution.
		  </span>
		  <span class="styItalicText" style="display:inline;">
			  Section 4081(e) claims are made on Schedule 5 by the person that has filed Form <span style="width:6mm;"/>720 reporting and paying the tax claimed. Section 6435 claims are made on Schedule 5 by the person that has removed previously <span style="width:19mm;"/> taxed dyed diesel fuel or dyed kerosene from an approved terminal.
		  </span>
	  </div>
  </div>
  <div class="styBB" style="width:187mm">
	  <table style="font-size:7pt" cellpadding="0" cellspacing="0">
		  <tr class="styBoldText">
			  <th scope="col" style="text-align:left;width:127mm;border-right:1px solid black;" colspan="2">
				  Type of fuel
			  </th>
			  <th scope="col" style="width:50mm;border-right:1px solid black;">
				  (a)<br/>
				  Amount of claim
			  </th>
			  <th scope="col" style="width:9mm">
				  (b)<br/>
				  CRN
			  </th>

		  </tr>
		  <tr>
			  <td class="styBoldText" style="width:6mm;border-top:1px solid black;text-align:center">
				  1
			  </td>
			  <td style="width:109mm;border-top:1px solid black; border-right:1px solid black;padding-left:2mm">
				  Gasoline
			  </td>
			  <td style="border-top:1px solid black;border-right:1px solid black;text-align:right">
				  <span style="float:left">
					   
				  </span>
				  <xsl:call-template name="PopulateAmount">
					  <xsl:with-param name="TargetNode" select="$FormData/RefClaimSecondTxGasoline/Amt"/>
				  </xsl:call-template>				  
			  </td>
			  <td style="border-top:1px solid black;text-align:center">
				  <xsl:call-template name="PopulateText">
					  <xsl:with-param name="TargetNode" select="$FormData/RefClaimSecondTxGasoline/CreditReferenceNum"/>
				  </xsl:call-template>				  
			  </td>
		  </tr>
		  <tr>
			  <td class="styBoldText" style="width:6mm;text-align:center;">
				  2
			  </td>
			  <td style="width:109mm;border-top:1px solid black; border-right:1px solid black;padding-left:2mm">
				  Aviation gasoline
			  </td>
			  <td style="border-top:1px solid black;border-right:1px solid black;text-align:right">
				  <span style="float:left">
					   
				  </span>
				  <xsl:call-template name="PopulateAmount">
					  <xsl:with-param name="TargetNode" select="$FormData/RefClaimSecondTxAvnGasoline/Amt"/>
				  </xsl:call-template>				  
			  </td>
			  <td style="border-top:1px solid black;text-align:center">
				  <xsl:call-template name="PopulateText">
					  <xsl:with-param name="TargetNode" select="$FormData/RefClaimSecondTxAvnGasoline/CreditReferenceNum"/>
				  </xsl:call-template>				  
			  </td>
		  </tr>
		  <tr>
			  <td class="styBoldText" style="width:6mm;text-align:center;">
				  3
			  </td>
			  <td style="width:109mm;border-top:1px solid black; border-right:1px solid black;padding-left:2mm">
				  Diesel fuel
			  </td>
			  <td style="border-top:1px solid black;border-right:1px solid black;text-align:right">
				  <span style="float:left">
					   
				  </span>
				  <xsl:call-template name="PopulateAmount">
					  <xsl:with-param name="TargetNode" select="$FormData/RefClaimSecondTxDieselFuel/Amt"/>
				  </xsl:call-template>				  
			  </td>
			  <td style="border-top:1px solid black;text-align:center">
				  <xsl:call-template name="PopulateText">
					  <xsl:with-param name="TargetNode" select="$FormData/RefClaimSecondTxDieselFuel/CreditReferenceNum"/>
				  </xsl:call-template>				  
			  </td>
		  </tr>
		  <tr>
			  <td class="styBoldText" style="width:6mm;text-align:center;">
				  4
			  </td>
			  <td style="width:109mm;border-top:1px solid black; border-right:1px solid black;padding-left:2mm">
				  Kerosene
			  </td>
			  <td style="border-top:1px solid black;border-right:1px solid black;text-align:right">
				  <span style="float:left">
					   
				  </span>
				  <xsl:call-template name="PopulateAmount">
					  <xsl:with-param name="TargetNode" select="$FormData/RefClaimSecondTxKerosene/Amt"/>
				  </xsl:call-template>				  
			  </td>
			  <td style="border-top:1px solid black;text-align:center">
				  <xsl:call-template name="PopulateText">
					  <xsl:with-param name="TargetNode" select="$FormData/RefClaimSecondTxKerosene/CreditReferenceNum"/>
				  </xsl:call-template>				  
			  </td>
		  </tr>
		  <tr>
			  <td class="styBoldText" style="width:6mm;text-align:center;">
				  5
			  </td>
			  <td style="width:109mm;border-top:1px solid black; border-right:1px solid black;padding-left:2mm">
				  Diesel-water fuel emulsion
			  </td>
			  <td style="border-top:1px solid black;border-right:1px solid black;text-align:right">
				  <span style="float:left">
					  
				  </span>
				  <xsl:call-template name="PopulateAmount">
					  <xsl:with-param name="TargetNode" select="$FormData/RefClaimSecondTxDieselWtrFuel/Amt"/>
				  </xsl:call-template>				  
			  </td>
			  <td style="border-top:1px solid black;text-align:center">
				  <xsl:call-template name="PopulateText">
					  <xsl:with-param name="TargetNode" select="$FormData/RefClaimSecondTxDieselWtrFuel/CreditReferenceNum"/>
				  </xsl:call-template>				  
			  </td>
		  </tr>
		  <tr>
			  <td class="styBoldText" style="width:6mm;text-align:center;">
				  6
			  </td>
			  <td style="width:109mm;border-top:1px solid black; border-right:1px solid black;padding-left:2mm">
				  Dyed diesel fuel, dyed kerosene, and other exempt removals (for section 4081(e) claims)
			  </td>
			  <td style="border-top:1px solid black;border-right:1px solid black;text-align:right">
				  <span style="float:left">
					   
				  </span>
				  <xsl:call-template name="PopulateAmount">
					  <xsl:with-param name="TargetNode" select="$FormData/RefClaimSecondTxExmptRemovals/Amt"/>
				  </xsl:call-template>				  
			  </td>
			  <td style="border-top:1px solid black;text-align:center">
				  <xsl:call-template name="PopulateText">
					  <xsl:with-param name="TargetNode" select="$FormData/RefClaimSecondTxExmptRemovals/CreditReferenceNum"/>
				  </xsl:call-template>				  
			  </td>
		  </tr>
		  <tr>
			  <td class="styBoldText" style="width:6mm;text-align:center;">
				  7
			  </td>
			  <td style="width:109mm;border-top:1px solid black; border-right:1px solid black;padding-left:2mm">
				  Kerosene for use in aviation
			  </td>
			  <td style="border-top:1px solid black;border-right:1px solid black;text-align:right">
				  <span style="float:left">
					   
				  </span>
				  <xsl:call-template name="PopulateAmount">
					  <xsl:with-param name="TargetNode" select="$FormData/RefClaimSecondTxAvnKrsn/Amt"/>
				  </xsl:call-template>				  
			  </td>
			  <td style="border-top:1px solid black;text-align:center">
				  <xsl:call-template name="PopulateText">
					  <xsl:with-param name="TargetNode" select="$FormData/RefClaimSecondTxAvnKrsn/CreditReferenceNum"/>
				  </xsl:call-template>				  
			  </td>
		  </tr>
		  <tr>
			  <td class="styBoldText" style="width:6mm;text-align:center;">
				  8
			  </td>
			  <td style="width:109mm;border-top:1px solid black; border-right:1px solid black;padding-left:2mm">
				  Kerosene for use in commercial aviation (other than foreign trade)
			  </td>
			  <td style="border-top:1px solid black;border-right:1px solid black;text-align:right">
				  <span style="float:left">
					  
				  </span>
				  <xsl:call-template name="PopulateAmount">
					  <xsl:with-param name="TargetNode" select="$FormData/RefClaimSecondTxCmrclAvnKrsn/Amt"/>
				  </xsl:call-template>				  
			  </td>
			  <td style="border-top:1px solid black;text-align:center">
				  <xsl:call-template name="PopulateText">
					  <xsl:with-param name="TargetNode" select="$FormData/RefClaimSecondTxCmrclAvnKrsn/CreditReferenceNum"/>
				  </xsl:call-template>				  
			  </td>
		  </tr>
 		   <tr>
			  <td class="styBoldText" style="width:6mm;text-align:center;;vertical-align:top;padding-top:">
				  9
			  </td>
			  <td style="width:109mm;border-top:1px solid black; border-right:1px solid black;padding-left:2mm">
				  <div>Dyed diesel fuel (for section 6435 claims)</div><br/>
				  
			  </td>
			  <td style="border-top:1px solid black;border-right:1px solid black;text-align:right">
				  <span style="float:left">
					  
				  </span>
				  <xsl:call-template name="PopulateAmount">
					  <xsl:with-param name="TargetNode" select="$FormData/Sect6435ClaimsDyedDslFuelGrp/Amt"/>
				  </xsl:call-template>				  
			  </td>
			  <td style="border-top:1px solid black;text-align:center">
				  <xsl:call-template name="PopulateText">
					  <xsl:with-param name="TargetNode" select="$FormData/Sect6435ClaimsDyedDslFuelGrp/CreditReferenceNum"/>
				  </xsl:call-template>				  
			  </td>
		    <tr>
			  <td class="styBoldText" style="width:6mm;text-align:center;;vertical-align:top;padding-top:">
				  10
			  </td>
			  <td style="width:109mm;border-top:1px solid black; border-right:1px solid black;padding-left:2mm">
				  <div>Dyed kerosene fuel (for section 6435 claims)</div><br/>
				  
			  </td>
			  <td style="border-top:1px solid black;border-right:1px solid black;text-align:right">
				  <span style="float:left">
					  
				  </span>
				  <xsl:call-template name="PopulateAmount">
					  <xsl:with-param name="TargetNode" select="$FormData/Sect6435ClaimsDyedKrsnGrp/Amt"/>
				  </xsl:call-template>				  
			  </td>
			  <td style="border-top:1px solid black;text-align:center">
				  <xsl:call-template name="PopulateText">
					  <xsl:with-param name="TargetNode" select="$FormData/Sect6435ClaimsDyedKrsnGrp/CreditReferenceNum"/>
				  </xsl:call-template>				  
			  </td>
		  </tr>
		  </tr>
		   <tr>
			  <td class="styBoldText" style="width:6mm;text-align:right;vertical-align:top;padding-top:">
				 
			  </td>
			<td colspan="2" style="width:109mm;border-top:1px solid black; border-right-width:0px;padding-left:2mm;padding-top:2mm;padding-bottom:2mm;">
							<div style="padding-bottom:4px;"><span style="font-weight: bold;">Type of Claim</span></div>
                            <div style="padding-bottom:4px;"><span style="font-weight: bold;">Caution.</span> Check only one per Schedule. See instructions for more information on making both section 4081(e) and 6435 claims.</div>	  
						<div style="padding-bottom:3px;">
							<input type="checkbox" class="styCkboxNM" alt="Initial Return">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$FormData/InitialReturnInd"/>
									<xsl:with-param name="BackupName">InitialReturnInd</xsl:with-param>
								</xsl:call-template>
							</input>
							<span style="width:55mm;padding-left:3px;">
								Section 4081(e) claims (complete Part II) 
								<xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode" select="$FormData/InitialReturnInd"/>
								</xsl:call-template>
							</span>
							<input type="checkbox" class="styCkboxNM" alt="Final Return" style="">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$FormData/FinalReturnInd"/>
									<xsl:with-param name="BackupName">FinalReturnInd</xsl:with-param>
								</xsl:call-template>
							</input>
							<span style="width:52mm;padding-left:4px;">
								Section 6435 claims (complete Part III)
							</span>
						</div>
			  </td>
			  <td style="border-top:1px solid black;">
			  </td>
			  <td style="border-top:1px solid black;border-right:0px solid black;text-align:right">
				  			  
			  </td>
		  </tr>
	  </table>
  </div> 
  <div class="styBB" style="height:13.5mm;width:187mm;">
	  <div class="styPartName" style="height:4mm;">
		  Part II
	  </div>
	  <div class="styLineDesc" style="display:inline;">
		  <span style="width:4.2mm"/>
		  <span class="styBoldText" >
			  Supporting Information Required for Section 4081(e) Claims.
		  </span>
		  
		  See instructions. If more space is needed, attach seperate sheets.
		 <br/><span style="width:4.25mm"/>Claimant certifies that the amount of the second tax has not been included in the price of the fuel, and has not been collected from 
		 <br/><span style="width:18.5mm"/>the purchaser. Claimant has attached a copy of the First Taxpayer's Report, and if applicable, a copy of the Statement of the 
		 <br/><span style="width:18.5mm"/>Subsequent Seller.
		  <xsl:call-template name="SetFormLinkInline">
			  <xsl:with-param name="TargetNode" select="$FormData/RefClaimSecondTxSupportingInfo"/>
		  </xsl:call-template>
	  </div>
		  <span style="float:right">	  
			<xsl:call-template name="SetDynamicTableToggleButton">
				   <xsl:with-param name="TargetNode" select="$FormData/RefClaimSecondTxSupportingInfo/RefClaimSecondTxFuelInfo"/>
					<xsl:with-param name="containerHeight" select="14"/>
						<xsl:with-param name="containerID" select=" 'PSOctn' "/>
				</xsl:call-template>
		</span>
	  
  </div>
 <div class="styTableContainer" style="height:auto;border-bottom-width:0px;" id="PSOctn">
<xsl:call-template name="SetInitialState"/>
  <table cellspacing="0" cellpadding="0" style="height:auto;width:187mm;font-size:7pt">
	  <thead>
		  <tr>
  			<th scope="col" style="text-align: center; vertical-align: middle; width:51mm; font-weight:bold; border-bottom:1px solid black; width:31mm;border-bottom:1px solid black;border-right:1px solid black">
					  (c) Type of fuel<br/>
				 
				 <span style="font-weight:normal">
					 Enter line number from Part I.
				 </span>
			 </th>
			 <th scope="col" style="text-align: center; vertical-align: middle; width:51mm; font-weight:bold; border-bottom:1px solid black; width:51mm;border-bottom:1px solid black;border-right:1px solid black">
					 (d)<br/>
					 Date second tax liability incurred<br/>
				 <span class="styItalicText" style="font-weight:normal">
					 Use MMDDYYY format.
				 </span>
			  </th>
			  <th scope="col" style="text-align: center; vertical-align: middle; width:51mm; font-weight:bold; border-bottom:1px solid black; width:51mm;font-weight:bold;border-bottom:1px solid black;border-right:1px solid black">
				  (e)<br/>Gallons of fuel claimed
			  </th>
			  <th scope="col" style="text-align: center; vertical-align: middle; width:51mm; font-weight:bold; border-bottom:1px solid black; width:51mm;font-weight:bold;border-bottom:1px solid black;">
				  (f)<br/>Amount of second tax paid
			  </th>
		  </tr>
	  </thead>
	  <tbody>
		  <xsl:if test="($Print != $Separated) or count($FormData/RefClaimSecondTxSupportingInfo/RefClaimSecondTxFuelInfo) &lt; 15">
		  <xsl:for-each select="$FormData/RefClaimSecondTxSupportingInfo/RefClaimSecondTxFuelInfo">
		  	<tr>
				  <td style="text-align:right;border-bottom:1px solid black;border-right:1px solid black;">
					<xsl:call-template name="PopulateAmount">
						<xsl:with-param name="TargetNode" select="FuelTyp"/>
					</xsl:call-template>
				  </td>
				  <td style="text-align:center;border-bottom:1px solid black;border-right:1px solid black;">
					<xsl:call-template name="PopulateText">
						<xsl:with-param name="TargetNode" select="TaxIncurredDt"/>
					</xsl:call-template>
				  </td>
				  <td style="text-align:right;border-bottom:1px solid black;border-right:1px solid black;">
					<xsl:call-template name="PopulateAmount">
						<xsl:with-param name="TargetNode" select="GallonsQty"/>
					</xsl:call-template>
				  </td>
				  <td style="text-align:right;border-bottom:1px solid black;">
					  <xsl:if test="position()=1">
						  <span style="float:left">
							   
						  </span>
					  </xsl:if>
					<xsl:call-template name="PopulateAmount">
						<xsl:with-param name="TargetNode" select="Amt"/>
					</xsl:call-template>
				  </td>
			  </tr>
		  </xsl:for-each>
	  	</xsl:if>
		  <xsl:if test="count($FormData/RefClaimSecondTxSupportingInfo/RefClaimSecondTxFuelInfo) &lt; 1 or ((count($FormData/RefClaimSecondTxSupportingInfo/RefClaimSecondTxFuelInfo) &gt; 14) and ($Print = $Separated))">
			  <tr>
				  <td style="text-align:left;border-bottom:1px solid black;border-right:1px solid black;">
 					<xsl:call-template name="PopulateAdditionalDataTableMessage">
                  				  <xsl:with-param name="TargetNode" select="$FormData/RefClaimSecondTxSupportingInfo/RefClaimSecondTxFuelInfo"/>                      
                 			 </xsl:call-template>
					 <span style="width:1px"/>
				  </td>
				  <td style="text-align:center;border-bottom:1px solid black;border-right:1px solid black;">
					  <span style="width:1px"/>
				  </td>
				  <td style="text-align:right;border-bottom:1px solid black;border-right:1px solid black;">
					  <span style="width:1px"/>
				  </td>
				  <td style="text-align:left;border-bottom:1px solid black;">
					   
				  </td>
			  </tr>
		  </xsl:if>
		  <xsl:if test="count($FormData/RefClaimSecondTxSupportingInfo/RefClaimSecondTxFuelInfo) &lt; 2 or ((count($FormData/RefClaimSecondTxSupportingInfo/RefClaimSecondTxFuelInfo) &gt; 14) and ($Print = $Separated))">
			  <tr>
				  <td style="text-align:left;border-bottom:1px solid black;border-right:1px solid black;">
					  <span style="width:1px"/>
				  </td>
				  <td style="text-align:center;border-bottom:1px solid black;border-right:1px solid black;">
					  <span style="width:1px"/>
				  </td>
				  <td style="text-align:right;border-bottom:1px solid black;border-right:1px solid black;">
					  <span style="width:1px"/>
				  </td>
				  <td style="text-align:right;border-bottom:1px solid black;">
					  <span style="width:1px"/>
				  </td>
			  </tr>
		  </xsl:if>
		  <xsl:if test="count($FormData/RefClaimSecondTxSupportingInfo/RefClaimSecondTxFuelInfo) &lt; 3 or ((count($FormData/RefClaimSecondTxSupportingInfo/RefClaimSecondTxFuelInfo) &gt; 14) and ($Print = $Separated))">
			  <tr>
				  <td style="text-align:left;border-bottom:1px solid black;border-right:1px solid black;">
					  <span style="width:1px"/>
				  </td>
				  <td style="text-align:center;border-bottom:1px solid black;border-right:1px solid black;">
					  <span style="width:1px"/>
				  </td>
				  <td style="text-align:right;border-bottom:1px solid black;border-right:1px solid black;">
					  <span style="width:1px"/>
				  </td>
				  <td style="text-align:right;border-bottom:1px solid black;">
					  <span style="width:1px"/>
				  </td>
			  </tr>
		  </xsl:if>
		  <xsl:if test="count($FormData/RefClaimSecondTxSupportingInfo/RefClaimSecondTxFuelInfo) &lt; 4 or ((count($FormData/RefClaimSecondTxSupportingInfo/RefClaimSecondTxFuelInfo) &gt; 14) and ($Print = $Separated))">
			  <tr>
				  <td style="text-align:left;border-bottom:1px solid black;border-right:1px solid black;">
					  <span style="width:1px"/>
				  </td>
				  <td style="text-align:center;border-bottom:1px solid black;border-right:1px solid black;">
					  <span style="width:1px"/>
				  </td>
				  <td style="text-align:right;border-bottom:1px solid black;border-right:1px solid black;">
					  <span style="width:1px"/>
				  </td>
				  <td style="text-align:right;border-bottom:1px solid black;">
					  <span style="width:1px"/>
				  </td>
			  </tr>
		  </xsl:if>
		  <xsl:if test="count($FormData/RefClaimSecondTxSupportingInfo/RefClaimSecondTxFuelInfo) &lt; 5 or ((count($FormData/RefClaimSecondTxSupportingInfo/RefClaimSecondTxFuelInfo) &gt; 14) and ($Print = $Separated))">
			  <tr>
				  <td style="text-align:left;border-bottom:1px solid black;border-right:1px solid black;">
					  <span style="width:1px"/>
				  </td>
				  <td style="text-align:center;border-bottom:1px solid black;border-right:1px solid black;">
					  <span style="width:1px"/>
				  </td>
				  <td style="text-align:right;border-bottom:1px solid black;border-right:1px solid black;">
					  <span style="width:1px"/>
				  </td>
				  <td style="text-align:right;border-bottom:1px solid black;">
					  <span style="width:1px"/>
				  </td>
			  </tr>
		  </xsl:if>
		  <xsl:if test="count($FormData/RefClaimSecondTxSupportingInfo/RefClaimSecondTxFuelInfo) &lt; 6 or ((count($FormData/RefClaimSecondTxSupportingInfo/RefClaimSecondTxFuelInfo) &gt; 14) and ($Print = $Separated))">
			  <tr>
				  <td style="text-align:left;border-bottom:1px solid black;border-right:1px solid black;">
					  <span style="width:1px"/>
				  </td>
				  <td style="text-align:center;border-bottom:1px solid black;border-right:1px solid black;">
					  <span style="width:1px"/>
				  </td>
				  <td style="text-align:right;border-bottom:1px solid black;border-right:1px solid black;">
					  <span style="width:1px"/>
				  </td>
				  <td style="text-align:right;border-bottom:1px solid black;">
					  <span style="width:1px"/>
				  </td>
			  </tr>
		  </xsl:if>
		  <xsl:if test="count($FormData/RefClaimSecondTxSupportingInfo/RefClaimSecondTxFuelInfo) &lt; 7 or ((count($FormData/RefClaimSecondTxSupportingInfo/RefClaimSecondTxFuelInfo) &gt; 14) and ($Print = $Separated))">
			  <tr>
				  <td style="text-align:left;border-bottom:1px solid black;border-right:1px solid black;">
					  <span style="width:1px"/>
				  </td>
				  <td style="text-align:center;border-bottom:1px solid black;border-right:1px solid black;">
					  <span style="width:1px"/>
				  </td>
				  <td style="text-align:right;border-bottom:1px solid black;border-right:1px solid black;">
					  <span style="width:1px"/>
				  </td>
				  <td style="text-align:right;border-bottom:1px solid black;">
					  <span style="width:1px"/>
				  </td>
			  </tr>
		  </xsl:if>
		  <xsl:if test="count($FormData/RefClaimSecondTxSupportingInfo/RefClaimSecondTxFuelInfo) &lt; 8 or ((count($FormData/RefClaimSecondTxSupportingInfo/RefClaimSecondTxFuelInfo) &gt; 14) and ($Print = $Separated))">
			  <tr>
				  <td style="text-align:left;border-bottom:1px solid black;border-right:1px solid black;">
					  <span style="width:1px"/>
				  </td>
				  <td style="text-align:center;border-bottom:1px solid black;border-right:1px solid black;">
					  <span style="width:1px"/>
				  </td>
				  <td style="text-align:right;border-bottom:1px solid black;border-right:1px solid black;">
					  <span style="width:1px"/>
				  </td>
				  <td style="text-align:right;border-bottom:1px solid black;">
					  <span style="width:1px"/>
				  </td>
			  </tr>
		  </xsl:if>
		  <xsl:if test="count($FormData/RefClaimSecondTxSupportingInfo/RefClaimSecondTxFuelInfo) &lt; 9 or ((count($FormData/RefClaimSecondTxSupportingInfo/RefClaimSecondTxFuelInfo) &gt; 14) and ($Print = $Separated))">
			  <tr>
				  <td style="text-align:left;border-bottom:1px solid black;border-right:1px solid black;">
					  <span style="width:1px"/>
				  </td>
				  <td style="text-align:center;border-bottom:1px solid black;border-right:1px solid black;">
					  <span style="width:1px"/>
				  </td>
				  <td style="text-align:right;border-bottom:1px solid black;border-right:1px solid black;">
					  <span style="width:1px"/>
				  </td>
				  <td style="text-align:right;border-bottom:1px solid black;">
					  <span style="width:1px"/>
				  </td>
			  </tr>
		  </xsl:if>
		  <xsl:if test="count($FormData/RefClaimSecondTxSupportingInfo/RefClaimSecondTxFuelInfo) &lt; 10 or ((count($FormData/RefClaimSecondTxSupportingInfo/RefClaimSecondTxFuelInfo) &gt; 14) and ($Print = $Separated))">
			  <tr>
				  <td style="text-align:left;border-bottom:1px solid black;border-right:1px solid black;">
					  <span style="width:1px"/>
				  </td>
				  <td style="text-align:center;border-bottom:1px solid black;border-right:1px solid black;">
					  <span style="width:1px"/>
				  </td>
				  <td style="text-align:right;border-bottom:1px solid black;border-right:1px solid black;">
					  <span style="width:1px"/>
				  </td>
				  <td style="text-align:right;border-bottom:1px solid black;">
					  <span style="width:1px"/>
				  </td>
			  </tr>
		  </xsl:if>
		  <xsl:if test="count($FormData/RefClaimSecondTxSupportingInfo/RefClaimSecondTxFuelInfo) &lt; 11 or ((count($FormData/RefClaimSecondTxSupportingInfo/RefClaimSecondTxFuelInfo) &gt; 14) and ($Print = $Separated))">
			  <tr>
				  <td style="text-align:left;border-bottom:1px solid black;border-right:1px solid black;">
					  <span style="width:1px"/>
				  </td>
				  <td style="text-align:center;border-bottom:1px solid black;border-right:1px solid black;">
					  <span style="width:1px"/>
				  </td>
				  <td style="text-align:right;border-bottom:1px solid black;border-right:1px solid black;">
					  <span style="width:1px"/>
				  </td>
				  <td style="text-align:right;border-bottom:1px solid black;">
					  <span style="width:1px"/>
				  </td>
			  </tr>
		  </xsl:if>
		  <xsl:if test="count($FormData/RefClaimSecondTxSupportingInfo/RefClaimSecondTxFuelInfo) &lt; 12 or ((count($FormData/RefClaimSecondTxSupportingInfo/RefClaimSecondTxFuelInfo) &gt; 14) and ($Print = $Separated))">
			  <tr>
				  <td style="text-align:left;border-bottom:1px solid black;border-right:1px solid black;">
					  <span style="width:1px"/>
				  </td>
				  <td style="text-align:center;border-bottom:1px solid black;border-right:1px solid black;">
					  <span style="width:1px"/>
				  </td>
				  <td style="text-align:right;border-bottom:1px solid black;border-right:1px solid black;">
					  <span style="width:1px"/>
				  </td>
				  <td style="text-align:right;border-bottom:1px solid black;">
					  <span style="width:1px"/>
				  </td>
			  </tr>
		  </xsl:if>
		  <xsl:if test="count($FormData/RefClaimSecondTxSupportingInfo/RefClaimSecondTxFuelInfo) &lt; 13 or ((count($FormData/RefClaimSecondTxSupportingInfo/RefClaimSecondTxFuelInfo) &gt; 14) and ($Print = $Separated))">
			  <tr>
				  <td style="text-align:left;border-bottom:1px solid black;border-right:1px solid black;">
					  <span style="width:1px"/>
				  </td>
				  <td style="text-align:center;border-bottom:1px solid black;border-right:1px solid black;">
					  <span style="width:1px"/>
				  </td>
				  <td style="text-align:right;border-bottom:1px solid black;border-right:1px solid black;">
					  <span style="width:1px"/>
				  </td>
				  <td style="text-align:right;border-bottom:1px solid black;">
					  <span style="width:1px"/>
				  </td>
			  </tr>
		  </xsl:if>
		  <xsl:if test="count($FormData/RefClaimSecondTxSupportingInfo/RefClaimSecondTxFuelInfo) &lt; 14 or ((count($FormData/RefClaimSecondTxSupportingInfo/RefClaimSecondTxFuelInfo) &gt; 14) and ($Print = $Separated))">
			  <tr>
				  <td style="text-align:left;border-bottom:1px solid black;border-right:1px solid black;">
					  <span style="width:1px"/>
				  </td>
				  <td style="text-align:center;border-bottom:1px solid black;border-right:1px solid black;">
					  <span style="width:1px"/>
				  </td>
				  <td style="text-align:right;border-bottom:1px solid black;border-right:1px solid black;">
					  <span style="width:1px"/>
				  </td>
				  <td style="text-align:right;border-bottom:1px solid black;">
					  <span style="width:1px"/>
				  </td>
			  </tr>
		  </xsl:if>
		  

	  </tbody>
  </table>
  </div>
  
   <div class="styBB" style="height:7.5mm;width:187mm;">
	  <div class="styPartName" style="height:4mm;">
		  Part III
	  </div>
	  <div class="styLineDesc" style="display:inline;">
		  <span style="width:4.2mm"/>
		  <span class="styBoldText" >
			  Supporting Information Required for Section 6435 Claims.
		  </span>
		  
		  See instructions. If more space is needed, attach seperate sheets.
		 <br/><span style="width:3mm"/> Claimant has attached a copy of the First Taxpayer's Report, and if applicable, a copy of the Statement of the Subsequent Seller.
		  <xsl:call-template name="SetFormLinkInline">
			  <xsl:with-param name="TargetNode" select="$FormData/RefClaimSecondTxSupportingInfo"/>
		  </xsl:call-template>
	  </div>
		  <span style="float:right">	  
			<xsl:call-template name="SetDynamicTableToggleButton">
				   <xsl:with-param name="TargetNode" select="$FormData/RefClaimSecondTxSupportingInfo/RefClaimSecondTxFuelInfo"/>
					<xsl:with-param name="containerHeight" select="14"/>
						<xsl:with-param name="containerID" select=" 'PSOctn' "/>
				</xsl:call-template>
		</span>
	  
  </div>
 <div class="styTableContainer" style="height:auto;border-bottom-width:0px;" id="PSOctn">
<xsl:call-template name="SetInitialState"/>
  <table cellspacing="0" cellpadding="0" style="height:auto;width:187mm;font-size:7pt">
	  <thead>
		  <tr>
  			<th scope="col" style="text-align: center; vertical-align: middle; width:51mm; font-weight:bold; border-bottom:1px solid black; width:31mm;border-bottom:1px solid black;border-right:1px solid black;">
					  (g) Type of fuel<br/>
				 
				 <span style="font-weight:normal">
					 Enter line number from Part I.
				 </span>
			 </th>
			 <th scope="col" style="text-align: center; vertical-align: middle; width:51mm; border-bottom:1px solid black; border-right:1px solid black;">
					 (h)<br/>
					 Date of removal of dyed fuel<br/>
				 <span class="styItalicText" style="font-weight:normal;">
					 Use MMDDYYY format.
				 </span>
			  </th>
			  <th scope="col" style="text-align: center; vertical-align: middle; width:51mm; font-weight:bold; border-bottom:1px solid black; border-right:1px solid black;">
				  (i)<br/>Gallons of fuel claimed
			  </th>
			  <th scope="col" style="text-align: center; vertical-align: middle; width:51mm; font-weight:bold; border-bottom:1px solid black;">
				  (j)<br/>Amount of prior tax paid
			  </th>
		  </tr>
	  </thead>
	  <tbody>
		  <xsl:if test="($Print != $Separated) or count($FormData/RefClaimSecondTxSupportingInfo/RefClaimSecondTxFuelInfo) &lt; 15">
		  <xsl:for-each select="$FormData/RefClaimSecondTxSupportingInfo/RefClaimSecondTxFuelInfo">
		  	<tr>
				  <td style="text-align:right;border-bottom:1px solid black;border-right:1px solid black;">
					<xsl:call-template name="PopulateAmount">
						<xsl:with-param name="TargetNode" select="FuelTyp"/>
					</xsl:call-template>
				  </td>
				  <td style="text-align:center;border-bottom:1px solid black;border-right:1px solid black;">
					<xsl:call-template name="PopulateText">
						<xsl:with-param name="TargetNode" select="TaxIncurredDt"/>
					</xsl:call-template>
				  </td>
				  <td style="text-align:right;border-bottom:1px solid black;border-right:1px solid black;">
					<xsl:call-template name="PopulateAmount">
						<xsl:with-param name="TargetNode" select="GallonsQty"/>
					</xsl:call-template>
				  </td>
				  <td style="text-align:right;border-bottom:1px solid black;">
					  <xsl:if test="position()=1">
						  <span style="float:left">
							   
						  </span>
					  </xsl:if>
					<xsl:call-template name="PopulateAmount">
						<xsl:with-param name="TargetNode" select="Amt"/>
					</xsl:call-template>
				  </td>
			  </tr>
		  </xsl:for-each>
	  	</xsl:if>
		  <xsl:if test="count($FormData/RefClaimSecondTxSupportingInfo/RefClaimSecondTxFuelInfo) &lt; 1 or ((count($FormData/RefClaimSecondTxSupportingInfo/RefClaimSecondTxFuelInfo) &gt; 14) and ($Print = $Separated))">
			  <tr>
				  <td style="text-align:left;border-bottom:1px solid black;border-right:1px solid black;">
 					<xsl:call-template name="PopulateAdditionalDataTableMessage">
                  				  <xsl:with-param name="TargetNode" select="$FormData/RefClaimSecondTxSupportingInfo/RefClaimSecondTxFuelInfo"/>                      
                 			 </xsl:call-template>
					 <span style="width:1px"/>
				  </td>
				  <td style="text-align:center;border-bottom:1px solid black;border-right:1px solid black;">
					  <span style="width:1px"/>
				  </td>
				  <td style="text-align:right;border-bottom:1px solid black;border-right:1px solid black;">
					  <span style="width:1px"/>
				  </td>
				  <td style="text-align:left;border-bottom:1px solid black;">
					   
				  </td>
			  </tr>
		  </xsl:if>
		  <xsl:if test="count($FormData/RefClaimSecondTxSupportingInfo/RefClaimSecondTxFuelInfo) &lt; 2 or ((count($FormData/RefClaimSecondTxSupportingInfo/RefClaimSecondTxFuelInfo) &gt; 14) and ($Print = $Separated))">
			  <tr>
				  <td style="text-align:left;border-bottom:1px solid black;border-right:1px solid black;">
					  <span style="width:1px"/>
				  </td>
				  <td style="text-align:center;border-bottom:1px solid black;border-right:1px solid black;">
					  <span style="width:1px"/>
				  </td>
				  <td style="text-align:right;border-bottom:1px solid black;border-right:1px solid black;">
					  <span style="width:1px"/>
				  </td>
				  <td style="text-align:right;border-bottom:1px solid black;">
					  <span style="width:1px"/>
				  </td>
			  </tr>
		  </xsl:if>
		  <xsl:if test="count($FormData/RefClaimSecondTxSupportingInfo/RefClaimSecondTxFuelInfo) &lt; 3 or ((count($FormData/RefClaimSecondTxSupportingInfo/RefClaimSecondTxFuelInfo) &gt; 14) and ($Print = $Separated))">
			  <tr>
				  <td style="text-align:left;border-bottom:1px solid black;border-right:1px solid black;">
					  <span style="width:1px"/>
				  </td>
				  <td style="text-align:center;border-bottom:1px solid black;border-right:1px solid black;">
					  <span style="width:1px"/>
				  </td>
				  <td style="text-align:right;border-bottom:1px solid black;border-right:1px solid black;">
					  <span style="width:1px"/>
				  </td>
				  <td style="text-align:right;border-bottom:1px solid black;">
					  <span style="width:1px"/>
				  </td>
			  </tr>
		  </xsl:if>
		  <xsl:if test="count($FormData/RefClaimSecondTxSupportingInfo/RefClaimSecondTxFuelInfo) &lt; 4 or ((count($FormData/RefClaimSecondTxSupportingInfo/RefClaimSecondTxFuelInfo) &gt; 14) and ($Print = $Separated))">
			  <tr>
				  <td style="text-align:left;border-bottom:1px solid black;border-right:1px solid black;">
					  <span style="width:1px"/>
				  </td>
				  <td style="text-align:center;border-bottom:1px solid black;border-right:1px solid black;">
					  <span style="width:1px"/>
				  </td>
				  <td style="text-align:right;border-bottom:1px solid black;border-right:1px solid black;">
					  <span style="width:1px"/>
				  </td>
				  <td style="text-align:right;border-bottom:1px solid black;">
					  <span style="width:1px"/>
				  </td>
			  </tr>
		  </xsl:if>
		  <xsl:if test="count($FormData/RefClaimSecondTxSupportingInfo/RefClaimSecondTxFuelInfo) &lt; 5 or ((count($FormData/RefClaimSecondTxSupportingInfo/RefClaimSecondTxFuelInfo) &gt; 14) and ($Print = $Separated))">
			  <tr>
				  <td style="text-align:left;border-bottom:1px solid black;border-right:1px solid black;">
					  <span style="width:1px"/>
				  </td>
				  <td style="text-align:center;border-bottom:1px solid black;border-right:1px solid black;">
					  <span style="width:1px"/>
				  </td>
				  <td style="text-align:right;border-bottom:1px solid black;border-right:1px solid black;">
					  <span style="width:1px"/>
				  </td>
				  <td style="text-align:right;border-bottom:1px solid black;">
					  <span style="width:1px"/>
				  </td>
			  </tr>
		  </xsl:if>
		  <xsl:if test="count($FormData/RefClaimSecondTxSupportingInfo/RefClaimSecondTxFuelInfo) &lt; 6 or ((count($FormData/RefClaimSecondTxSupportingInfo/RefClaimSecondTxFuelInfo) &gt; 14) and ($Print = $Separated))">
			  <tr>
				  <td style="text-align:left;border-bottom:1px solid black;border-right:1px solid black;">
					  <span style="width:1px"/>
				  </td>
				  <td style="text-align:center;border-bottom:1px solid black;border-right:1px solid black;">
					  <span style="width:1px"/>
				  </td>
				  <td style="text-align:right;border-bottom:1px solid black;border-right:1px solid black;">
					  <span style="width:1px"/>
				  </td>
				  <td style="text-align:right;border-bottom:1px solid black;">
					  <span style="width:1px"/>
				  </td>
			  </tr>
		  </xsl:if>
		  <xsl:if test="count($FormData/RefClaimSecondTxSupportingInfo/RefClaimSecondTxFuelInfo) &lt; 7 or ((count($FormData/RefClaimSecondTxSupportingInfo/RefClaimSecondTxFuelInfo) &gt; 14) and ($Print = $Separated))">
			  <tr>
				  <td style="text-align:left;border-bottom:1px solid black;border-right:1px solid black;">
					  <span style="width:1px"/>
				  </td>
				  <td style="text-align:center;border-bottom:1px solid black;border-right:1px solid black;">
					  <span style="width:1px"/>
				  </td>
				  <td style="text-align:right;border-bottom:1px solid black;border-right:1px solid black;">
					  <span style="width:1px"/>
				  </td>
				  <td style="text-align:right;border-bottom:1px solid black;">
					  <span style="width:1px"/>
				  </td>
			  </tr>
		  </xsl:if>
		  <xsl:if test="count($FormData/RefClaimSecondTxSupportingInfo/RefClaimSecondTxFuelInfo) &lt; 8 or ((count($FormData/RefClaimSecondTxSupportingInfo/RefClaimSecondTxFuelInfo) &gt; 14) and ($Print = $Separated))">
			  <tr>
				  <td style="text-align:left;border-bottom:1px solid black;border-right:1px solid black;">
					  <span style="width:1px"/>
				  </td>
				  <td style="text-align:center;border-bottom:1px solid black;border-right:1px solid black;">
					  <span style="width:1px"/>
				  </td>
				  <td style="text-align:right;border-bottom:1px solid black;border-right:1px solid black;">
					  <span style="width:1px"/>
				  </td>
				  <td style="text-align:right;border-bottom:1px solid black;">
					  <span style="width:1px"/>
				  </td>
			  </tr>
		  </xsl:if>
		  <xsl:if test="count($FormData/RefClaimSecondTxSupportingInfo/RefClaimSecondTxFuelInfo) &lt; 9 or ((count($FormData/RefClaimSecondTxSupportingInfo/RefClaimSecondTxFuelInfo) &gt; 14) and ($Print = $Separated))">
			  <tr>
				  <td style="text-align:left;border-bottom:1px solid black;border-right:1px solid black;">
					  <span style="width:1px"/>
				  </td>
				  <td style="text-align:center;border-bottom:1px solid black;border-right:1px solid black;">
					  <span style="width:1px"/>
				  </td>
				  <td style="text-align:right;border-bottom:1px solid black;border-right:1px solid black;">
					  <span style="width:1px"/>
				  </td>
				  <td style="text-align:right;border-bottom:1px solid black;">
					  <span style="width:1px"/>
				  </td>
			  </tr>
		  </xsl:if>
		  <xsl:if test="count($FormData/RefClaimSecondTxSupportingInfo/RefClaimSecondTxFuelInfo) &lt; 10 or ((count($FormData/RefClaimSecondTxSupportingInfo/RefClaimSecondTxFuelInfo) &gt; 14) and ($Print = $Separated))">
			  <tr>
				  <td style="text-align:left;border-bottom:1px solid black;border-right:1px solid black;">
					  <span style="width:1px"/>
				  </td>
				  <td style="text-align:center;border-bottom:1px solid black;border-right:1px solid black;">
					  <span style="width:1px"/>
				  </td>
				  <td style="text-align:right;border-bottom:1px solid black;border-right:1px solid black;">
					  <span style="width:1px"/>
				  </td>
				  <td style="text-align:right;border-bottom:1px solid black;">
					  <span style="width:1px"/>
				  </td>
			  </tr>
		  </xsl:if>
		  <xsl:if test="count($FormData/RefClaimSecondTxSupportingInfo/RefClaimSecondTxFuelInfo) &lt; 11 or ((count($FormData/RefClaimSecondTxSupportingInfo/RefClaimSecondTxFuelInfo) &gt; 14) and ($Print = $Separated))">
			  <tr>
				  <td style="text-align:left;border-bottom:1px solid black;border-right:1px solid black;">
					  <span style="width:1px"/>
				  </td>
				  <td style="text-align:center;border-bottom:1px solid black;border-right:1px solid black;">
					  <span style="width:1px"/>
				  </td>
				  <td style="text-align:right;border-bottom:1px solid black;border-right:1px solid black;">
					  <span style="width:1px"/>
				  </td>
				  <td style="text-align:right;border-bottom:1px solid black;">
					  <span style="width:1px"/>
				  </td>
			  </tr>
		  </xsl:if>
		  <xsl:if test="count($FormData/RefClaimSecondTxSupportingInfo/RefClaimSecondTxFuelInfo) &lt; 12 or ((count($FormData/RefClaimSecondTxSupportingInfo/RefClaimSecondTxFuelInfo) &gt; 14) and ($Print = $Separated))">
			  <tr>
				  <td style="text-align:left;border-bottom:1px solid black;border-right:1px solid black;">
					  <span style="width:1px"/>
				  </td>
				  <td style="text-align:center;border-bottom:1px solid black;border-right:1px solid black;">
					  <span style="width:1px"/>
				  </td>
				  <td style="text-align:right;border-bottom:1px solid black;border-right:1px solid black;">
					  <span style="width:1px"/>
				  </td>
				  <td style="text-align:right;border-bottom:1px solid black;">
					  <span style="width:1px"/>
				  </td>
			  </tr>
		  </xsl:if>
		  <xsl:if test="count($FormData/RefClaimSecondTxSupportingInfo/RefClaimSecondTxFuelInfo) &lt; 13 or ((count($FormData/RefClaimSecondTxSupportingInfo/RefClaimSecondTxFuelInfo) &gt; 14) and ($Print = $Separated))">
			  <tr>
				  <td style="text-align:left;border-bottom:1px solid black;border-right:1px solid black;">
					  <span style="width:1px"/>
				  </td>
				  <td style="text-align:center;border-bottom:1px solid black;border-right:1px solid black;">
					  <span style="width:1px"/>
				  </td>
				  <td style="text-align:right;border-bottom:1px solid black;border-right:1px solid black;">
					  <span style="width:1px"/>
				  </td>
				  <td style="text-align:right;border-bottom:1px solid black;">
					  <span style="width:1px"/>
				  </td>
			  </tr>
		  </xsl:if>
		  <xsl:if test="count($FormData/RefClaimSecondTxSupportingInfo/RefClaimSecondTxFuelInfo) &lt; 14 or ((count($FormData/RefClaimSecondTxSupportingInfo/RefClaimSecondTxFuelInfo) &gt; 14) and ($Print = $Separated))">
			  <tr>
				  <td style="text-align:left;border-bottom:1px solid black;border-right:1px solid black;">
					  <span style="width:1px"/>
				  </td>
				  <td style="text-align:center;border-bottom:1px solid black;border-right:1px solid black;">
					  <span style="width:1px"/>
				  </td>
				  <td style="text-align:right;border-bottom:1px solid black;border-right:1px solid black;">
					  <span style="width:1px"/>
				  </td>
				  <td style="text-align:right;border-bottom:1px solid black;">
					  <span style="width:1px"/>
				  </td>
			  </tr>
		  </xsl:if>
		  

	  </tbody>
  </table>
  </div>
 <!-- Set Initial Height of Above Table -->
      <xsl:call-template name="SetInitialDynamicTableHeight">
        <xsl:with-param name="TargetNode" select="$FormData/RefClaimSecondTxSupportingInfo/RefClaimSecondTxFuelInfo"/>
        <xsl:with-param name="containerHeight" select="14"/>
        <xsl:with-param name="containerID" select=" 'PSOctn' "/>
      </xsl:call-template>
      <!-- End Set Initial Height of Above Table -->



  <!--  FOOTER-->
        <div style="width:189mm;border-top:0px solid black;">
          <span class="styBoldText">For Privacy Act and Paperwork Reduction Act Notice, see Form 8849 instructions. </span> 
          <span style="width:4px;"/>                      
          <span style="width:19mm;font-size:6pt">Cat. No. 27453B </span> 
	  <span class="styBoldText">
	  Schedule 5 (Form 8849)</span> (Rev. 12-2025)
        </div> 
        <br class="pageEnd"/>
        
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
	<!-- END Left Over Table -->      
		  <xsl:if test="($Print = $Separated) and count($FormData/RefClaimSecondTxSupportingInfo/RefClaimSecondTxFuelInfo) &gt; 14">

			 <table cellspacing="0" style="font-size:7pt">
				  <thead>
		  			<tr>
			  			<th scope="col" style="width:31mm;border-bottom:1px solid black;border-right:1px solid black">
							  (c) Type of fuel<br/>
					 
							 <span style="font-weight:normal">
								 Enter line number from Part I.
							 </span>
						 </th>
						 <th scope="col" style="width:51mm;border-bottom:1px solid black;border-right:1px solid black">
							 (d)<br/>
							 Date second tax liability incurred<br/>
							 <span class="styItalicText" style="font-weight:normal">
								 Use MMDDYYY format
							 </span>
						  </th>
						  <th scope="col" style="width:51mm;font-weight:bold;border-bottom:1px solid black;border-right:1px solid black">
							  (e)<br/>Gallons of fuel claimed
						  </th>
						  <th scope="col" style="width:51mm;font-weight:bold;border-bottom:1px solid black;">
							  (f)<br/>Amount of second tax paid
						  </th>
					  </tr>
	  			</thead>
	  			<tbody>
		  			<xsl:for-each select="$FormData/RefClaimSecondTxSupportingInfo/RefClaimSecondTxFuelInfo">
		 			 	<tr>
						  <td style="text-align:right;border-bottom:1px solid black;border-right:1px solid black;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="FuelTyp"/>
							</xsl:call-template>
						  </td>
						  <td style="text-align:center;border-bottom:1px solid black;border-right:1px solid black;">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="TaxIncurredDt"/>
							</xsl:call-template>
						  </td>
						  <td style="text-align:right;border-bottom:1px solid black;border-right:1px solid black;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="GallonsQty"/>
							</xsl:call-template>
						  </td>
						  <td style="text-align:right;border-bottom:1px solid black;">
							  <xsl:if test="position()=1">
								  <span style="float:left">
								  $
								  </span>
							  </xsl:if>
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="Amt"/>
							</xsl:call-template>
						  </td>
					  </tr>

		  			</xsl:for-each>
				</tbody>
			</table>
		</xsl:if>
  </form>  
</body>
</html>
</xsl:template>    

</xsl:stylesheet>