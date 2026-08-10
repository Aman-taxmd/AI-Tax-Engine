<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
<xsl:include href="PopulateTemplate.xsl"/>
<xsl:include href="CommonPathRef.xsl"/>
  <xsl:include href="AddHeader.xsl"/>
<xsl:include href="AddOnTable.xsl"/>
<xsl:include href="IRS4466Style.xsl"/>

<xsl:output method="html" indent="yes"/>
<xsl:strip-space elements="*"/>

<!-- Defines the stage of the data, e.g. original or latest -->
<xsl:param name="Form4466Data" select="$RtnDoc/IRS4466"/>


<xsl:template match="/">

<xsl:text disable-output-escaping="yes">&lt;!DOCTYPE html&gt;</xsl:text>
		<html>
  <head>
				<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <title><xsl:call-template name="FormTitle"><xsl:with-param name="RootElement" select="local-name($Form4466Data)"/></xsl:call-template></title>
    <!-- No Browser Caching -->
    <meta http-equiv="Pragma" content="no-cache"/>
    <meta http-equiv="Cache-Control" content="no-cache"/>
    <meta http-equiv="Expires" content="0"/>
    <!-- No Proxy Caching -->
    <meta http-equiv="Cache-Control" content="private"/>
    <!-- Define Character Set -->
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1"/>
    <meta name="Description" content="IRS Form 4466"/>
    
    
    
    <script language="JavaScript" src="{$ScriptPath}/FormDisplay.js" type="text/javascript"/>
    <xsl:call-template name="InitJS"/>
    <style type="text/css">
      <xsl:if test="not($Print) or $Print=''">
        <xsl:call-template name="IRS4466Style"/>        
        <xsl:call-template name="AddOnStyle"/>    
      </xsl:if>
</style>        
  <xsl:call-template name="GlobalStylesForm"/>
</head>
  <body class="styBodyClass">

  <form name="Form4466">
      <!-- BEGIN WARNING LINE -->
        <xsl:call-template name="DocumentHeader"/>  
      <!-- END WARNING LINE -->

    <div class="styBB" style="width:187mm;">
        <div class="styFNBox" style="width:33mm;height:22mm;">
          <div style="height:13mm;">
            Form<span class="styFormNumber"> 4466</span>
            <span>(Rev. December 2025)</span>
            <xsl:call-template name="SetFormLinkInline">
              <xsl:with-param name="TargetNode" select="$Form4466Data"/>
            </xsl:call-template>
          </div>
          <div style="height:4mm;font-size:7pt;font-family:arial;">
            <br/>
            <span>Department of the Treasury</span><br/>
            <span>Internal Revenue Service</span>
          </div>        
        </div>    
		<div class="styFTBox" style="width:123mm;height:22mm;">
			<div class="styMainTitle" style="height:12;">Corporation Application for Quick Refund of<br/>
			 Overpayment of Estimated Tax
			</div><br/>
			<div class="styFST" style="height:4mm;font-size:6.4pt;padding-top:1mm;">
			 Go to <a style="text-decoration:none;color:black;" href="http://www.irs.gov/F4466" title="Link to IRS.gov"><i>www.IRS.gov/F4466</i></a> for
			 the latest information.
			</div>
			<div>
				<span style="width:123mm;font-family:Arial;font-weight:bold;padding-top:2mm;padding-bottom:2mm;">
				 For calendar year 20
					<span class="styFixedUnderline" style="float:none;text-align:left;width:3mm">
						<xsl:value-of select="substring($RtnHdrData/TaxYr,3,2)"/>
					</span> or tax year beginning
					<span class="styFixedUnderline" style="float:none;text-align:left;width:8mm">
						<xsl:call-template name="PopulateMonth">
							<xsl:with-param name="TargetNode" select="$RtnHdrData/TaxPeriodBeginDt"/>
						</xsl:call-template> -
						<xsl:call-template name="PopulateDay">
							<xsl:with-param name="TargetNode" select="$RtnHdrData/TaxPeriodBeginDt"/>
						</xsl:call-template>
					</span> 20
					<span class="styFixedUnderline" style="float:none;text-align:left;width:3mm">
						<xsl:value-of select="substring($RtnHdrData/TaxPeriodBeginDt,3,2)"/>
					</span> and ending
					<!--</span>-->	
					<span class="styFixedUnderline" style="float:none;text-align:left;width:8mm">
						<xsl:call-template name="PopulateMonth">
							<xsl:with-param name="TargetNode" select="$RtnHdrData/TaxPeriodEndDt"/>
						</xsl:call-template> -
						<xsl:call-template name="PopulateDay">
							<xsl:with-param name="TargetNode" select="$RtnHdrData/TaxPeriodEndDt"/>
						</xsl:call-template>
					</span>, 20
					<span class="styFixedUnderline" style="float:none;text-align:top;width:4mm">
						<xsl:value-of select="substring($RtnHdrData/TaxPeriodEndDt,3,2)"/>
					</span>
					<br/>
				</span>
			</div>	
		</div>
      <div class="styTYBox" style="width:30mm;height:22mm;">
        <div style="text-align:center;padding-top:10mm;">OMB No. 1545-0123</div>
      </div>
    </div>
    <div class="styBB" style="width:187mm;float:none;clear:right;">
      <div class="styNameBox" style="width:135mm;height:9mm;font-size:7pt;">
        Name<br/>
        <xsl:call-template name="PopulateReturnHeaderFiler"><xsl:with-param name="TargetNode">BusinessNameLine1Txt</xsl:with-param></xsl:call-template>
        <br/>
        <xsl:call-template name="PopulateReturnHeaderFiler"><xsl:with-param name="TargetNode">BusinessNameLine2Txt</xsl:with-param></xsl:call-template>
      </div>
      <div class="styEINBox" style="width:52mm;height:4mm;padding-left:2mm;font-size:7pt;">
        Employer identification number
        <span style="text-align:center;width:51mm;font-weight:normal;padding-top:3mm;">            
          <xsl:call-template name="PopulateReturnHeaderFiler"><xsl:with-param name="TargetNode">EIN</xsl:with-param></xsl:call-template>          
        </span>
      </div>
    </div>
    <div class="styBB">
		<div style="width:135mm;float:left;clear:left;">
			<div class="styBB" style="width:135mm;">
				<!-- Number and Street Start -->
				<div class="styNameBox" style="height:9mm;width:90mm;font-size:7pt;border-style:solid;
				 border-top-width:0px;border-left-width:0px; border-bottom-width:0px;
				 border-right-width:1px;">Number and street.  If a P.O. box, see instructions.
					<br />
					<xsl:choose>
						<xsl:when test="$RtnHdrData/Filer/USAddress">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/USAddress/AddressLine1Txt">
								</xsl:with-param>
							</xsl:call-template>
						 <br />
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/USAddress/AddressLine2Txt">
								</xsl:with-param>
							</xsl:call-template>
						</xsl:when>
						<xsl:otherwise>
							<xsl:if test="$RtnHdrData/Filer/ForeignAddress">
							</xsl:if>
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/ForeignAddress/AddressLine1Txt">
									</xsl:with-param>
								</xsl:call-template>
							 <br />
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/ForeignAddress/AddressLine2Txt">
									</xsl:with-param>
								</xsl:call-template>
						</xsl:otherwise>
					</xsl:choose>
				</div>
				<div class="styNameBox" style="height:9mm;width:45mm;font-size:7pt;border-style:solid;border-top-width:0px;
				 border-left-width:0px;border-bottom-width:0px;border-right-width:1px;padding-left:1mm;">Room or suite no.
				</div>
				<!-- Number and Street End -->
			</div>
			<!-- Begining City/State/ZIP Row -->
			<!-- City or Town -->
			<div class="styNBB" style="width:135mm;">
				<div class="styNameBox" style="height:8.5mm;width:72mm;font-size:7pt;border-style:solid;
				 border-top-width:0px;border-left-width:0px; border-bottom-width:0px;
				 border-right-width:1px;padding-left:1mm;">City or town
					<br />
					<xsl:choose>
						<xsl:when test="$RtnHdrData/Filer/USAddress">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/USAddress/CityNm">
								</xsl:with-param>
							</xsl:call-template>
						</xsl:when>
						<xsl:otherwise>
							<xsl:if test="$RtnHdrData/Filer/ForeignAddress">
							</xsl:if>
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/ForeignAddress/CityNm">
									</xsl:with-param>
								</xsl:call-template>
						</xsl:otherwise>
					</xsl:choose>
				</div>
				<!-- State or Province -->
				<div class="styNameBox" style="width:28mm;height:8.5mm;font-size:7pt;border-style:solid;
				 border-top-width:0px;border-left-width:0px;border-bottom-width:0px;border-right-width:0px;
				 padding-left:1mm;">
				 State or province
					<br />
					<xsl:choose>
						<xsl:when test="$RtnHdrData/Filer/USAddress">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/USAddress/StateAbbreviationCd">
								</xsl:with-param>
							</xsl:call-template>
						</xsl:when>
						<xsl:otherwise>
							<xsl:if test="$RtnHdrData/Filer/ForeignAddress">
							</xsl:if>
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/ForeignAddress/ProvinceOrStateNm">
									</xsl:with-param>
								</xsl:call-template>
						</xsl:otherwise>
					</xsl:choose>
				</div>
				<!-- Country -->
			<!--	<div class="styNameBox" style="width:12mm;8.5mm;font-size:7pt;border-style:solid;
				 border-top-width:0px;border-left-width:0px; border-bottom-width:0px;
				 border-right-width:0px;padding-left:1mm;">Country
					<xsl:if test="$RtnHdrData/Filer/ForeignAddress">
					</xsl:if>
						<xsl:call-template name="PopulateText">
							<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/ForeignAddress/CountryCd">
							</xsl:with-param>
						</xsl:call-template>
				</div>-->
				<!-- ZIP/Foreign Postal Code -->
				<div class="styNameBox" style="width:35mm;height:8.5mm;font-size:7pt;border-style:solid;
				 border-top-width:0px;border-left-width:1px;border-bottom-width:0px;border-right-width:1px;
				 padding-left:1mm;">
				 ZIP or foreign postal code
					<br />
					<xsl:choose>
						<xsl:when test="$RtnHdrData/Filer/USAddress">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/USAddress/ZIPCd">
								</xsl:with-param>
							</xsl:call-template>
						</xsl:when>
						<xsl:otherwise>
							<xsl:if test="$RtnHdrData/Filer/ForeignAddress">
							</xsl:if>
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/ForeignAddress/ForeignPostalCd">
									</xsl:with-param>
								</xsl:call-template>
						</xsl:otherwise>
					</xsl:choose>
				</div>
			</div>
		</div>
			<div style="width:52mm;height:18mm;text-align:center;clear:none;">
			  <span style="font-size:7pt;margin-left:3mm;">
				Telephone number (optional)
			  </span>      
			  <span style="text-align:center;clear:none;padding-top:5mm;width:51mm;margin-left:3mm;">
				<xsl:call-template name="PopulatePhoneNumber">
				  <xsl:with-param name="TargetNode" select="$Form4466Data/PhoneNum"/>
				</xsl:call-template>
			  </span>
			</div>
			<!--<div class="styBB" style="width:135mm;">
				--><!-- City or Town row Start --><!--
				<div class="styNameBox" style="width:90mm;font-size:7pt;border-style:solid;
				 border-top-width:0px;border-left-width:0px; border-bottom-width:0px;
				 border-right-width:1px;">City or town
					<br/>
					<xsl:choose>
						<xsl:when test="$RtnHdrData/Filer/USAddress">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/USAddress/CityNm">
								</xsl:with-param>
							</xsl:call-template>
						</xsl:when>
						<xsl:otherwise>
							<xsl:if test="$RtnHdrData/Filer/ForeignAddress">
							</xsl:if>
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/ForeignAddress/CityNm">
									</xsl:with-param>
								</xsl:call-template>
						</xsl:otherwise>
					</xsl:choose>
				</div>
				<div class="styNameBox" style="width:45mm;font-size:7pt;border-style:solid;
				 border-top-width:0px;border-left-width:0px;border-bottom-width:0px;border-right-width:1px;
				 padding-left:1mm;">
				 State or province
					<br/>
					<xsl:choose>
						<xsl:when test="$RtnHdrData/Filer/USAddress">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/USAddress/StateAbbreviationCd">
								</xsl:with-param>
							</xsl:call-template>
						</xsl:when>
						<xsl:otherwise>
							<xsl:if test="$RtnHdrData/Filer/ForeignAddress">
							</xsl:if>
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/ForeignAddress/ProvinceOrStateNm">
									</xsl:with-param>
								</xsl:call-template>
						</xsl:otherwise>
					</xsl:choose>
				</div>
				--><!-- City or Town row End --><!--
			</div>
			<div style="height:6mm;width:135mm;">
				<div class="styNameBox" style="width:90mm;font-size:7pt;border-style:solid;
				 border-top-width:0px;border-left-width:0px; border-bottom-width:0px;
				 border-right-width:1px;">Country
					<br />
					<xsl:if test="$RtnHdrData/Filer/ForeignAddress">
					</xsl:if>
						<xsl:call-template name="PopulateText">
							<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/ForeignAddress/CountryCd">
							</xsl:with-param>
						</xsl:call-template>
				</div>
				<div class="styNameBox" style="width:45mm;font-size:7pt;border-style:solid;
				 border-top-width:0px;border-left-width:0px;border-bottom-width:0px;border-right-width:1px;
				 padding-left:1mm">
				 ZIP or foreign postal code
					<br />
					<xsl:choose>
						<xsl:when test="$RtnHdrData/Filer/USAddress">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/USAddress/ZIPCd">
								</xsl:with-param>
							</xsl:call-template>
						</xsl:when>
						<xsl:otherwise>
							<xsl:if test="$RtnHdrData/Filer/ForeignAddress">
							</xsl:if>
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/ForeignAddress/ForeignPostalCd">
									</xsl:with-param>
								</xsl:call-template>
						</xsl:otherwise>
					</xsl:choose>
				</div>
			</div>	
		</div>
		<div style="width:52mm;height:16.5mm;text-align:left;clear:none;">
		  <span style="font-size:7pt;margin-left:3mm;">
			Telephone number (optional)
		  </span>      
		  <span style="text-align:center;clear:none;padding-top:10mm;width:51mm;margin-left:3mm;">
			<xsl:call-template name="PopulatePhoneNumber">
			  <xsl:with-param name="TargetNode" select="$Form4466Data/PhoneNum"/>
			</xsl:call-template>
		  </span>
		</div>-->
    </div>
    <div class="styBB" style="width:187mm;">
      <span style="font-size:7pt;">
        Check type of return to be filed (see instructions):
      </span>
    <div style="width:187mm;text-align:left;clear:all;">    
     
      <input type="checkbox" class="styCkbox" alt="IRS4466Form1120">              
        <xsl:call-template name="PopulateCheckbox">
          <xsl:with-param name="TargetNode" select="$Form4466Data/CorporationReturnTypeGrp/Form1120Ind"/>
          <xsl:with-param name="BackupName">IRS4466Form1120</xsl:with-param>
        </xsl:call-template>
      </input>
      <label>
        <xsl:call-template name="PopulateLabel">
          <xsl:with-param name="TargetNode" select="$Form4466Data/CorporationReturnTypeGrp/Form1120Ind"/>
          <xsl:with-param name="BackupName">IRS4466Form1120</xsl:with-param>
        </xsl:call-template> 
         Form 1120
      </label>
      <span style="width:2mm;"/> 

	 <input type="checkbox" class="styCkbox" alt="IRS4466Form1120C">
        <xsl:call-template name="PopulateCheckbox">
          <xsl:with-param name="TargetNode" select="$Form4466Data/CorporationReturnTypeGrp/Form1120CInd"/>
          <xsl:with-param name="BackupName">IRS4466Form1120C</xsl:with-param>
        </xsl:call-template>
      </input>
      <label>
        <xsl:call-template name="PopulateLabel">
          <xsl:with-param name="TargetNode" select="$Form4466Data/CorporationReturnTypeGrp/Form1120CInd"/>
          <xsl:with-param name="BackupName">IRS4466Form1120C</xsl:with-param>
        </xsl:call-template> 
         Form 1120-C
      </label>  
      <span style="width:2mm;"/> 

	 <input type="checkbox" class="styCkbox" alt="IRS4466Form1120F">              
        <xsl:call-template name="PopulateCheckbox">
          <xsl:with-param name="TargetNode" select="$Form4466Data/CorporationReturnTypeGrp/Form1120FInd"/>
          <xsl:with-param name="BackupName">IRS4466Form1120F</xsl:with-param>
        </xsl:call-template>
      </input>
      <label>
        <xsl:call-template name="PopulateLabel">
          <xsl:with-param name="TargetNode" select="$Form4466Data/CorporationReturnTypeGrp/Form1120FInd"/>
          <xsl:with-param name="BackupName">IRS4466Form1120F</xsl:with-param>
        </xsl:call-template> 
         Form 1120-F
      </label>  
      <span style="width:2mm;"/> 

	 <input type="checkbox" class="styCkbox" alt="IRS4466Form1120L">              
        <xsl:call-template name="PopulateCheckbox">
          <xsl:with-param name="TargetNode" select="$Form4466Data/CorporationReturnTypeGrp/Form1120LInd"/>
          <xsl:with-param name="BackupName">IRS4466Form1120L</xsl:with-param>
        </xsl:call-template>
      </input>
      <label>
        <xsl:call-template name="PopulateLabel">
          <xsl:with-param name="TargetNode" select="$Form4466Data/CorporationReturnTypeGrp/Form1120LInd"/>
          <xsl:with-param name="BackupName">IRS4466Form1120L</xsl:with-param>
        </xsl:call-template> 
         Form 1120-L
      </label>  
      <span style="width:2mm;"/> 
       <input type="checkbox" class="styCkbox" alt="IRS4466Form1120PC">              
        <xsl:call-template name="PopulateCheckbox">
          <xsl:with-param name="TargetNode" select="$Form4466Data/CorporationReturnTypeGrp/Form1120PCInd"/>
          <xsl:with-param name="BackupName">IRS4466Form1120PC</xsl:with-param>
        </xsl:call-template>
      </input>
      <label>
        <xsl:call-template name="PopulateLabel">
          <xsl:with-param name="TargetNode" select="$Form4466Data/CorporationReturnTypeGrp/Form1120PCInd"/>
          <xsl:with-param name="BackupName">IRS4466Form1120PC</xsl:with-param>
        </xsl:call-template> 
         Form 1120-PC
      </label>  
      <span style="width:2mm;"/> 
         <input type="checkbox" class="styCkbox" alt="IRS4466OtherReturnType">              
          <xsl:call-template name="PopulateCheckbox">
            <xsl:with-param name="TargetNode" select="$Form4466Data/CorporationReturnTypeGrp/OtherInd"/>
            <xsl:with-param name="BackupName">IRS4466OtherReturnType</xsl:with-param>
          </xsl:call-template>
        </input>
        <label>
          <xsl:call-template name="PopulateLabel">
            <xsl:with-param name="TargetNode" select="$Form4466Data/CorporationReturnTypeGrp/OtherInd"/>
            <xsl:with-param name="BackupName">IRS4466OtherReturnType</xsl:with-param>
          </xsl:call-template> 
          Other
        </label>
        <!--<img src="{$ImagePath}/4466_Bullet_Sm.gif" alt="bullet image" style="width:2mm;"/>-->
        <span style="width:4px;"/>
        <span style="width:20mm;border-bottom:1 solid black;">
     
          <xsl:call-template name="PopulateText">
             <xsl:with-param name="TargetNode" select="$Form4466Data/CorporationReturnTypeGrp/OtherInd/@returnTypeCd"/>
         </xsl:call-template>
        </span>
      </div>
    <div style="width:187mm;"/>      
  </div>

    
  <div class="styBB" style="width:187mm;">
    <div style="width:187mm;">
        <div class="styLNLeftNumBox" style="height:4mm;">
          1
        </div>
        <div class="styLNDesc" style="width:136mm;height:4mm;">
          <span style="text-align:left;">Estimated income tax paid during the tax year</span>
          <!--Dotted Line-->
          <span class="styDotLn" style="float:right;padding-right:1mm;">..................</span>
        </div>
        <div class="styLNRightNumBox" style="height:4mm;">
        1
        </div>
        <div class="styLNAmountBox" style="width:34mm;">
          <xsl:call-template name="PopulateAmount">
            <xsl:with-param name="TargetNode" select="$Form4466Data/EstimatedIncomeTaxPaidDurTYAmt"/>
          </xsl:call-template>
        </div>
    </div>
    <div style="width:187mm;">
        <div class="styLNLeftNumBox" style="height:4mm;">
          2
        </div>
        <div class="styLNDesc" style="width:136mm;height:4mm;">
          <span style="float:left;">Overpayment of income tax from prior year credited to this year’s estimated tax</span>        
          <!--Dotted Line-->
          <span class="styDotLn" style="float:right;padding-right:1mm;">.......</span>
        </div>
        <div class="styLNRightNumBox" style="height:4mm;">
        2
        </div>
        <div class="styLNAmountBox" style="width:34mm;">
          <xsl:call-template name="PopulateAmount">
            <xsl:with-param name="TargetNode" select="$Form4466Data/OverpaymentIncomeTaxPYAmt"/>
          </xsl:call-template>
        </div>
    </div>
    <div style="width:187mm;">
        <div class="styLNLeftNumBox" style="height:4mm;">
          3
        </div>
        <div class="styLNDesc" style="width:136mm;height:4mm;">
          <span style="float:left;">Total. Add lines 1 and 2</span>
          <!--Dotted Line-->
          <span class="styDotLn" style="float:right;padding-right:1mm;">.........................</span>
        </div>
        <div class="styLNRightNumBox" style="height:4mm;">
        3
        </div>
        <div class="styLNAmountBox" style="width:34mm;">
          <xsl:call-template name="PopulateAmount">
            <xsl:with-param name="TargetNode" select="$Form4466Data/EstimatedPlusOvpmtIncmTxAmt"/>
          </xsl:call-template>
        </div>
    </div>
     <div style="width:187mm;">
        <div class="styLNLeftNumBox" style="height:7.5mm">4</div>
        <div class="styLNDesc" style="width:85mm;height:7.5mm;">
        <span style="text-align:left;">Enter total tax from the appropriate line of your tax return. </span>
        <span style="text-align:left;">See instructions.  </span>        
          <!-- dotted line -->
         <span class="styDotLn" style="float:right;padding-right:1mm;">..............</span>
        </div>
        <div class="styLNRightNumBox" style="height:7.5mm;vertical-align:bottom;padding-top: 3.5mm">4</div>
        <div class="styLNAmountBox" style="height:7.5mm;width:43mm;vertical-align:bottom;padding-top: 3.5mm">
          <xsl:call-template name="PopulateAmount">
            <xsl:with-param name="TargetNode" select="$Form4466Data/TotalTaxAmt"/>
          </xsl:call-template>
        </div>
      <div class="styLNRightNumBoxNBB" style="width:8.25mm;background-color:lightgrey;height:7.5mm;border-right-width:1px;">         			</div>   
    </div>
    <!--  Blank Line -->
    <div style="width:187mm;">
        <div class="styLNLeftNumBox" style="height:4.5mm"/>
        <div class="styLNDesc" style="width:85mm;height:4.5mm;">          
          
        </div>
        <div class="styLNRightNumBox" style="height:4.5mm;background-color:lightgrey;border-bottom-width:0px;"/>

        <div class="styLNAmountBox" style="height:4.5mm;width:43mm;background-color:lightgrey;border-bottom-width:0px">
          
        </div>
      <div class="styLNRightNumBoxNBB" style="width:8.25mm;background-color:lightgrey;height:4.5mm;border-right-width:1px;"/>        
    </div>

      <div style="width:187mm;">
      <div class="styLNLeftNumBox" style="height:7.5mm;">5a</div>
      <div class="styLNDesc" style="width:45mm;height:7.5mm;">
        <span style="text-align:left;">Personal holding company tax, </span>
        <span style="text-align:left;">if any, included on line 4</span>
        <!-- dotted line -->
        <span class="styDotLn" style="float:right;padding-right:1mm;">...</span>
      </div>
      <div class="styLNRightNumBox" style="height:7.5mm;padding-top: 3.5mm">5a</div>
      <div class="styLNAmountBox" style="padding-top: 3.5mm; height:7.5mm;">          
        <xsl:call-template name="PopulateAmount">
          <xsl:with-param name="TargetNode" select="$Form4466Data/PersonalHoldingCompanyTaxAmt"/>
        </xsl:call-template>
      </div>
         <div class="styLNRightNumBox" style="background-color:lightgrey;height:7.5mm;padding-top:3.5mm;border-bottom-width:1px;"/>
         <div class="styLNAmountBox" style="width:43mm;height:7.5mm;background-color:lightgrey;border-bottom-width:1px;"/>      
		 <div class="styLNRightNumBoxNBB" style="background-color:lightgrey;height:7.5mm;padding-top:3.5mm;border-left-width:1px;"/>  
		 <div class="styLNAmountBox" style="width:34mm;height:7.5mm;border-left-width:1px;border-bottom-width:0px;"/>           
    </div>
    <div style="width:187mm;">
      <div class="styLNLeftLtrBox" style="height:7.5mm;">b</div>
      <div class="styLNDesc" style="width:45mm;height:7.5mm;">
        <span style="float:left;">Estimated refundable tax credit</span>
        <span style="float:left;">for Federal tax on fuels</span>
        <!-- dotted line -->
        <span class="styDotLn" style="float:right;padding-right:1mm;">...</span>
      </div>
      <div class="styLNRightNumBox" style="height:7.5mm;padding-top: 3.5mm">5b</div>
      <div class="styLNAmountBox" style="height:7.5mm;padding-top: 3.5mm">
        <xsl:call-template name="PopulateAmount">
          <xsl:with-param name="TargetNode" select="$Form4466Data/EstimatedRfdblTxCrFedTxFuelAmt"/>
        </xsl:call-template>
      </div>
      <div class="styLNRightNumBox" style="background-color:lightgrey;height:7.5mm;padding-top:3.5mm;border-bottom-width:1px;"/>
         <div class="styLNAmountBox" style="width:43mm;height:7.5mm;background-color:lightgrey;border-bottom-width:1px;"/>      
		 <div class="styLNRightNumBoxNBB" style="background-color:lightgrey;height:7.5mm;padding-top:3.5mm;border-left-width:1px;"/>  
		 <div class="styLNAmountBox" style="width:34mm;height:7.5mm;border-left-width:1px;border-bottom-width:0px;"/>     
    </div>

    <div style="width:187mm;">
        <div class="styLNLeftNumBox" style="height:7.5mm;padding-top: 3.5mm;">
          6
        </div>
        <div class="styLNDesc" style="width:85mm;height:7.5mm;padding-top: 3.5mm;">
          <span style="text-align:left;">Total. Add lines 5a and 5b</span>
          <!--Dotted Line-->
          <span class="styDotLn" style="float:right;padding-right:1mm;">...........</span>
        </div>
        <div class="styLNRightNumBox" style="height:7.5mm;padding-top: 3.5mm;">
        6
        </div>
        <div class="styLNAmountBox" style="width:43mm;height:7.5mm;padding-top: 3.5mm">
          <xsl:call-template name="PopulateAmount">
            <xsl:with-param name="TargetNode" select="$Form4466Data/PersonalHoldTxPlusFuelTxCrAmt"/>
          </xsl:call-template>
        </div>
         <div class="styLNRightNumBoxNBB" style="background-color:lightgrey;height:7.5mm;"/>  
         <div class="styLNAmountBox" style="width:34mm;height:7.5mm;border-left-width:1px;border-bottom-width:0px;"/>  
    </div>
    <div style="width:187mm;">
        <div class="styLNLeftNumBox" style="height:4mm;padding-top:1mm;">
          7
        </div>
        <div class="styLNDesc" style="width:136mm;height:4mm;padding-top: 1mm;">
          <span style="text-align:left;">Expected income tax liability for the tax year. Subtract line 6 from line 4  </span>        
          <!--Dotted Line-->
          <span class="styDotLn" style="float:right;padding-right:1mm;">..........</span>
        </div>
        <div class="styLNRightNumBox" style="height:4.1mm;padding-top: 1mm;">
        7
        </div>
        <div class="styLNAmountBox" style="width:34mm;padding-bottom:3.5mm;">
          <xsl:call-template name="PopulateAmount">
            <xsl:with-param name="TargetNode" select="$Form4466Data/ExpectedIncomeTaxLiabilityAmt"/>
          </xsl:call-template>
        </div>
    </div>
  
    <div style="height:2mm;width:144mm;float:left;"/>
      <div class="styLNRightNumBoxNBB" style="width:8.25mm;background-color:lightgrey;border-right-width:1px;"/>
	<!-- Start Line 8a -->
    <div style="width:187mm;">
        <div class="styLNLeftNumBox" style="height:4mm;">8a
        </div>
        <div class="styLNDesc" style="width:136mm;">
          <span style="float:left;">
			  <span style="font-weight:bold;">Overpayment of estimated tax.</span> 
			  Subtract line 7 from line 3. If this amount is at least 10% of
			  line 7 <span style="font-weight:bold;">and</span> 
          </span>
          <span style="text-align:left;padding-right:10mm;">at least $500, the corporation is eligible for a quick refund. Otherwise, do not file this form.
		  </span>
          <span style="text-align:left;">See instructions.</span>
          <span class="styDotLn" style="float:right;padding-right:1mm;">..........................</span>
        </div>
      <div class="styLNRightNumBoxNBB" style="height:6.25mm;background-color:lightgrey;clear:none"/>
      <div class="styLNAmountBox" style="width:34mm;height:6.25mm;border-left-width:1px;border-bottom-width:0px;"/>
      <div style="height:2mm;width:144mm;float:left;"/>
        <div class="styLNRightNumBox">8a        
        </div>
        <div class="styLNAmountBox" style="width:34mm;">
          <xsl:call-template name="PopulateAmount">
            <xsl:with-param name="TargetNode" select="$Form4466Data/OverpaymentOfEstimatedTaxAmt"/>
          </xsl:call-template>
        </div>
    </div><!-- End Line 8a -->
	<!-- Start Line 8b -->
	<div class="styStdDiv" style="width:187mm;height:8mm;padding-top:1mm;vertical-align:top;">
		<div class="styLNLeftLtrBox" style="padding-left: 4mm;height:7mm;padding-top:2mm;">b
		</div>
		<div style="width:80mm;">
			Routing number
			<xsl:choose>
				<xsl:when test="substring($Form4466Data/DirectDepositGrp/RoutingTransitNum/text(),1,1) !=''">
					<div>
						<xsl:call-template name="PopulateIndividualSizableLetterBox">
							<xsl:with-param name="TargetNode" 
							 select="$Form4466Data/DirectDepositGrp/RoutingTransitNum"/>
							<xsl:with-param name="BoxNum" select="1"/>
							<xsl:with-param name="BoxWidth" select="'5mm'"/>
							<xsl:with-param name="BoxHeight" select="'5mm'"/>
							<xsl:with-param name="BoxTopPadding" select="'.5mm'"/>
						</xsl:call-template>
					</div>
					<!--<span style="width:3mm;"> </span>-->
					<div>
						<xsl:call-template name="PopulateIndividualSizableLetterBox">
							<xsl:with-param name="TargetNode" 
							 select="$Form4466Data/DirectDepositGrp/RoutingTransitNum"/>
							<xsl:with-param name="BoxNum" select="2"/>
							<xsl:with-param name="BoxWidth" select="'5mm'"/>
							<xsl:with-param name="BoxHeight" select="'5mm'"/>
							<xsl:with-param name="BoxTopPadding" select="'.5mm'"/>
						</xsl:call-template>
					</div>
					<div>
						<xsl:call-template name="PopulateIndividualSizableLetterBox">
							<xsl:with-param name="TargetNode" 
							 select="$Form4466Data/DirectDepositGrp/RoutingTransitNum"/>
							<xsl:with-param name="BoxNum" select="3"/>
							<xsl:with-param name="BoxWidth" select="'5mm'"/>
							<xsl:with-param name="BoxHeight" select="'5mm'"/>
							<xsl:with-param name="BoxTopPadding" select="'.5mm'"/>
						</xsl:call-template>
					</div>
					<div>
						<xsl:call-template name="PopulateIndividualSizableLetterBox">
							<xsl:with-param name="TargetNode" 
							 select="$Form4466Data/DirectDepositGrp/RoutingTransitNum"/>
							<xsl:with-param name="BoxNum" select="4"/>
							<xsl:with-param name="BoxWidth" select="'5mm'"/>
							<xsl:with-param name="BoxHeight" select="'5mm'"/>
							<xsl:with-param name="BoxTopPadding" select="'.5mm'"/>
						</xsl:call-template>
					</div>
					<div>
						<xsl:call-template name="PopulateIndividualSizableLetterBox">
							<xsl:with-param name="TargetNode" 
							 select="$Form4466Data/DirectDepositGrp/RoutingTransitNum"/>
							<xsl:with-param name="BoxNum" select="5"/>
							<xsl:with-param name="BoxWidth" select="'5mm'"/>
							<xsl:with-param name="BoxHeight" select="'5mm'"/>
							<xsl:with-param name="BoxTopPadding" select="'.5mm'"/>
						</xsl:call-template>
					</div>
					<div>
						<xsl:call-template name="PopulateIndividualSizableLetterBox">
							<xsl:with-param name="TargetNode" 
							 select="$Form4466Data/DirectDepositGrp/RoutingTransitNum"/>
							<xsl:with-param name="BoxNum" select="6"/>
							<xsl:with-param name="BoxWidth" select="'5mm'"/>
							<xsl:with-param name="BoxHeight" select="'5mm'"/>
							<xsl:with-param name="BoxTopPadding" select="'.5mm'"/>
						</xsl:call-template>
					</div>
					<div>
						<xsl:call-template name="PopulateIndividualSizableLetterBox">
							<xsl:with-param name="TargetNode" 
							 select="$Form4466Data/DirectDepositGrp/RoutingTransitNum"/>
							<xsl:with-param name="BoxNum" select="7"/>
							<xsl:with-param name="BoxWidth" select="'5mm'"/>
							<xsl:with-param name="BoxHeight" select="'5mm'"/>
							<xsl:with-param name="BoxTopPadding" select="'.5mm'"/>
						</xsl:call-template>
					</div>
					<div>
						<xsl:call-template name="PopulateIndividualSizableLetterBox">
							<xsl:with-param name="TargetNode" 
							 select="$Form4466Data/DirectDepositGrp/RoutingTransitNum"/>
							<xsl:with-param name="BoxNum" select="8"/>
							<xsl:with-param name="BoxWidth" select="'5mm'"/>
							<xsl:with-param name="BoxHeight" select="'5mm'"/>
							<xsl:with-param name="BoxTopPadding" select="'.5mm'"/>
						</xsl:call-template>
					</div>
					<div>
						<xsl:call-template name="PopulateIndividualSizableLetterBox">
							<xsl:with-param name="TargetNode" 
							 select="$Form4466Data/DirectDepositGrp/RoutingTransitNum"/>
							<xsl:with-param name="BoxNum" select="9"/>
							<xsl:with-param name="BoxWidth" select="'5mm'"/>
							<xsl:with-param name="BoxHeight" select="'5mm'"/>
							<xsl:with-param name="BoxTopPadding" select="'.5mm'"/>
						</xsl:call-template>
					</div>
				</xsl:when>
				<xsl:otherwise>
					<div class="emptyLonLatBox"/>
					<span style="width:3mm"> </span>
					<div>
						<xsl:call-template name="PopulateIndividualSizableLetterBox">
							<xsl:with-param name="TargetNode" 
							 select="$Form4466Data/DirectDepositGrp/RoutingTransitNum"/>
							<xsl:with-param name="BoxNum" select="1"/>
							<xsl:with-param name="BoxWidth" select="'5mm'"/>
							<xsl:with-param name="BoxHeight" select="'5mm'"/>
							<xsl:with-param name="BoxTopPadding" select="'.5mm'"/>
						</xsl:call-template>
					</div>
					<div>
						<xsl:call-template name="PopulateIndividualSizableLetterBox">
							<xsl:with-param name="TargetNode" 
							 select="$Form4466Data/DirectDepositGrp/RoutingTransitNum"/>
							<xsl:with-param name="BoxNum" select="2"/>
							<xsl:with-param name="BoxWidth" select="'5mm'"/>
							<xsl:with-param name="BoxHeight" select="'5mm'"/>
							<xsl:with-param name="BoxTopPadding" select="'.5mm'"/>
						</xsl:call-template>
					</div>
					<div>
						<xsl:call-template name="PopulateIndividualSizableLetterBox">
							<xsl:with-param name="TargetNode" 
							 select="$Form4466Data/DirectDepositGrp/RoutingTransitNum"/>
							<xsl:with-param name="BoxNum" select="3"/>
							<xsl:with-param name="BoxWidth" select="'5mm'"/>
							<xsl:with-param name="BoxHeight" select="'5mm'"/>
							<xsl:with-param name="BoxTopPadding" select="'.5mm'"/>
						</xsl:call-template>
					</div>
					<div>
						<xsl:call-template name="PopulateIndividualSizableLetterBox">
							<xsl:with-param name="TargetNode" 
							 select="$Form4466Data/DirectDepositGrp/RoutingTransitNum"/>
							<xsl:with-param name="BoxNum" select="4"/>
							<xsl:with-param name="BoxWidth" select="'5mm'"/>
							<xsl:with-param name="BoxHeight" select="'5mm'"/>
							<xsl:with-param name="BoxTopPadding" select="'.5mm'"/>
						</xsl:call-template>
					</div>
					<div>
						<xsl:call-template name="PopulateIndividualSizableLetterBox">
							<xsl:with-param name="TargetNode" 
							 select="$Form4466Data/DirectDepositGrp/RoutingTransitNum"/>
							<xsl:with-param name="BoxNum" select="5"/>
							<xsl:with-param name="BoxWidth" select="'5mm'"/>
							<xsl:with-param name="BoxHeight" select="'5mm'"/>
							<xsl:with-param name="BoxTopPadding" select="'.5mm'"/>
						</xsl:call-template>
					</div>
					<div>
						<xsl:call-template name="PopulateIndividualSizableLetterBox">
							<xsl:with-param name="TargetNode" 
							 select="$Form4466Data/DirectDepositGrp/RoutingTransitNum"/>
							<xsl:with-param name="BoxNum" select="6"/>
							<xsl:with-param name="BoxWidth" select="'5mm'"/>
							<xsl:with-param name="BoxHeight" select="'5mm'"/>
							<xsl:with-param name="BoxTopPadding" select="'.5mm'"/>
						</xsl:call-template>
					</div>
					<div>
						<xsl:call-template name="PopulateIndividualSizableLetterBox">
							<xsl:with-param name="TargetNode" 
							 select="$Form4466Data/DirectDepositGrp/RoutingTransitNum"/>
							<xsl:with-param name="BoxNum" select="7"/>
							<xsl:with-param name="BoxWidth" select="'5mm'"/>
							<xsl:with-param name="BoxHeight" select="'5mm'"/>
							<xsl:with-param name="BoxTopPadding" select="'.5mm'"/>
						</xsl:call-template>
					</div>
					<div>
						<xsl:call-template name="PopulateIndividualSizableLetterBox">
							<xsl:with-param name="TargetNode" 
							 select="$Form4466Data/DirectDepositGrp/RoutingTransitNum"/>
							<xsl:with-param name="BoxNum" select="8"/>
							<xsl:with-param name="BoxWidth" select="'5mm'"/>
							<xsl:with-param name="BoxHeight" select="'5mm'"/>
							<xsl:with-param name="BoxTopPadding" select="'.5mm'"/>
						</xsl:call-template>
					</div>
					<div>
						<xsl:call-template name="PopulateIndividualSizableLetterBox">
							<xsl:with-param name="TargetNode" 
							 select="$Form4466Data/DirectDepositGrp/RoutingTransitNum"/>
							<xsl:with-param name="BoxNum" select="9"/>
							<xsl:with-param name="BoxWidth" select="'5mm'"/>
							<xsl:with-param name="BoxHeight" select="'5mm'"/>
							<xsl:with-param name="BoxTopPadding" select="'.5mm'"/>
						</xsl:call-template>
					</div>
				</xsl:otherwise>
			</xsl:choose>
		</div>
		<div style="width:70mm;height:5mm;padding-top:1.5mm;">
			<div class="styLNLeftNumBox" style="height:5mm;width:16mm;">c
			<span style="width:2mm"/>
			<span style="width:4mm;font-weight:normal">Type</span>
			</div>
            <input type="checkbox" class="styCkbox" alt="IRS4466Form1120">              
				<xsl:call-template name="PopulateCheckbox">
				  <xsl:with-param name="TargetNode" select="$Form4466Data/DirectDepositGrp/CheckingAccountInd"/>
				  <xsl:with-param name="BackupName">IRS4466Form1120</xsl:with-param>
				</xsl:call-template>
			</input>
			<label>
				<xsl:call-template name="PopulateLabel">
				  <xsl:with-param name="TargetNode" select="$Form4466Data/DirectDepositGrp/CheckingAccountInd"/>
				  <xsl:with-param name="BackupName">IRS4466Form1120</xsl:with-param>
				</xsl:call-template>
				 Checking
			</label>  
			<span style="width:2mm;"/> 
            <input type="checkbox" class="styCkbox" alt="IRS4466Form1120">              
				<xsl:call-template name="PopulateCheckbox">
				  <xsl:with-param name="TargetNode" select="$Form4466Data/DirectDepositGrp/SavingsAccountInd"/>
				  <xsl:with-param name="BackupName">IRS4466Form1120</xsl:with-param>
				</xsl:call-template>
			</input>
			<label>
				<xsl:call-template name="PopulateLabel">
				  <xsl:with-param name="TargetNode" select="$Form4466Data/DirectDepositGrp/SavingsAccountInd"/>
				  <xsl:with-param name="BackupName">IRS4466Form1120</xsl:with-param>
				</xsl:call-template> 
				 Savings
			</label>  
			<span style="width:2mm;"/> 
		</div>
    </div>
	<div class="styStdDiv" style="width:187mm;height:13mm;padding-top:1mm;vertical-align:top;">
		<div class="styLNLeftLtrBox" style="padding-left: 4mm;height:7mm;padding-top:2mm;">d
		</div>
		<div style="width:125mm;">
			Account number
			<xsl:choose>
				<xsl:when test="substring($Form4466Data/DirectDepositGrp/DepositorAccountNum/text(),1,1) !=''">
					<div>
						<xsl:call-template name="PopulateIndividualSizableLetterBox">
							<xsl:with-param name="TargetNode" 
							 select="$Form4466Data/DirectDepositGrp/DepositorAccountNum"/>
							<xsl:with-param name="BoxNum" select="1"/>
							<xsl:with-param name="BoxWidth" select="'5mm'"/>
							<xsl:with-param name="BoxHeight" select="'5mm'"/>
							<xsl:with-param name="BoxTopPadding" select="'.5mm'"/>
						</xsl:call-template>
					</div>
					<!--<span style="width:3mm;"> </span>-->
					<div>
						<xsl:call-template name="PopulateIndividualSizableLetterBox">
							<xsl:with-param name="TargetNode" 
							 select="$Form4466Data/DirectDepositGrp/DepositorAccountNum"/>
							<xsl:with-param name="BoxNum" select="2"/>
							<xsl:with-param name="BoxWidth" select="'5mm'"/>
							<xsl:with-param name="BoxHeight" select="'5mm'"/>
							<xsl:with-param name="BoxTopPadding" select="'.5mm'"/>
						</xsl:call-template>
					</div>
					<div>
						<xsl:call-template name="PopulateIndividualSizableLetterBox">
							<xsl:with-param name="TargetNode" 
							 select="$Form4466Data/DirectDepositGrp/DepositorAccountNum"/>
							<xsl:with-param name="BoxNum" select="3"/>
							<xsl:with-param name="BoxWidth" select="'5mm'"/>
							<xsl:with-param name="BoxHeight" select="'5mm'"/>
							<xsl:with-param name="BoxTopPadding" select="'.5mm'"/>
						</xsl:call-template>
					</div>
					<div>
						<xsl:call-template name="PopulateIndividualSizableLetterBox">
							<xsl:with-param name="TargetNode" 
							 select="$Form4466Data/DirectDepositGrp/DepositorAccountNum"/>
							<xsl:with-param name="BoxNum" select="4"/>
							<xsl:with-param name="BoxWidth" select="'5mm'"/>
							<xsl:with-param name="BoxHeight" select="'5mm'"/>
							<xsl:with-param name="BoxTopPadding" select="'.5mm'"/>
						</xsl:call-template>
					</div>
					<div>
						<xsl:call-template name="PopulateIndividualSizableLetterBox">
							<xsl:with-param name="TargetNode" 
							 select="$Form4466Data/DirectDepositGrp/DepositorAccountNum"/>
							<xsl:with-param name="BoxNum" select="5"/>
							<xsl:with-param name="BoxWidth" select="'5mm'"/>
							<xsl:with-param name="BoxHeight" select="'5mm'"/>
							<xsl:with-param name="BoxTopPadding" select="'.5mm'"/>
						</xsl:call-template>
					</div>
					<div>
						<xsl:call-template name="PopulateIndividualSizableLetterBox">
							<xsl:with-param name="TargetNode" 
							 select="$Form4466Data/DirectDepositGrp/DepositorAccountNum"/>
							<xsl:with-param name="BoxNum" select="6"/>
							<xsl:with-param name="BoxWidth" select="'5mm'"/>
							<xsl:with-param name="BoxHeight" select="'5mm'"/>
							<xsl:with-param name="BoxTopPadding" select="'.5mm'"/>
						</xsl:call-template>
					</div>
					<div>
						<xsl:call-template name="PopulateIndividualSizableLetterBox">
							<xsl:with-param name="TargetNode" 
							 select="$Form4466Data/DirectDepositGrp/DepositorAccountNum"/>
							<xsl:with-param name="BoxNum" select="7"/>
							<xsl:with-param name="BoxWidth" select="'5mm'"/>
							<xsl:with-param name="BoxHeight" select="'5mm'"/>
							<xsl:with-param name="BoxTopPadding" select="'.5mm'"/>
						</xsl:call-template>
					</div>
					<div>
						<xsl:call-template name="PopulateIndividualSizableLetterBox">
							<xsl:with-param name="TargetNode" 
							 select="$Form4466Data/DirectDepositGrp/DepositorAccountNum"/>
							<xsl:with-param name="BoxNum" select="8"/>
							<xsl:with-param name="BoxWidth" select="'5mm'"/>
							<xsl:with-param name="BoxHeight" select="'5mm'"/>
							<xsl:with-param name="BoxTopPadding" select="'.5mm'"/>
						</xsl:call-template>
					</div>
					<div>
						<xsl:call-template name="PopulateIndividualSizableLetterBox">
							<xsl:with-param name="TargetNode" 
							 select="$Form4466Data/DirectDepositGrp/DepositorAccountNum"/>
							<xsl:with-param name="BoxNum" select="9"/>
							<xsl:with-param name="BoxWidth" select="'5mm'"/>
							<xsl:with-param name="BoxHeight" select="'5mm'"/>
							<xsl:with-param name="BoxTopPadding" select="'.5mm'"/>
						</xsl:call-template>
					</div>
					<div>
						<xsl:call-template name="PopulateIndividualSizableLetterBox">
							<xsl:with-param name="TargetNode" 
							 select="$Form4466Data/DirectDepositGrp/DepositorAccountNum"/>
							<xsl:with-param name="BoxNum" select="10"/>
							<xsl:with-param name="BoxWidth" select="'5mm'"/>
							<xsl:with-param name="BoxHeight" select="'5mm'"/>
							<xsl:with-param name="BoxTopPadding" select="'.5mm'"/>
						</xsl:call-template>
					</div>
					<div>
						<xsl:call-template name="PopulateIndividualSizableLetterBox">
							<xsl:with-param name="TargetNode" 
							 select="$Form4466Data/DirectDepositGrp/DepositorAccountNum"/>
							<xsl:with-param name="BoxNum" select="11"/>
							<xsl:with-param name="BoxWidth" select="'5mm'"/>
							<xsl:with-param name="BoxHeight" select="'5mm'"/>
							<xsl:with-param name="BoxTopPadding" select="'.5mm'"/>
						</xsl:call-template>
					</div>
					<div>
						<xsl:call-template name="PopulateIndividualSizableLetterBox">
							<xsl:with-param name="TargetNode" 
							 select="$Form4466Data/DirectDepositGrp/DepositorAccountNum"/>
							<xsl:with-param name="BoxNum" select="12"/>
							<xsl:with-param name="BoxWidth" select="'5mm'"/>
							<xsl:with-param name="BoxHeight" select="'5mm'"/>
							<xsl:with-param name="BoxTopPadding" select="'.5mm'"/>
						</xsl:call-template>
					</div>
					<div>
						<xsl:call-template name="PopulateIndividualSizableLetterBox">
							<xsl:with-param name="TargetNode" 
							 select="$Form4466Data/DirectDepositGrp/DepositorAccountNum"/>
							<xsl:with-param name="BoxNum" select="13"/>
							<xsl:with-param name="BoxWidth" select="'5mm'"/>
							<xsl:with-param name="BoxHeight" select="'5mm'"/>
							<xsl:with-param name="BoxTopPadding" select="'.5mm'"/>
						</xsl:call-template>
					</div>
					<div>
						<xsl:call-template name="PopulateIndividualSizableLetterBox">
							<xsl:with-param name="TargetNode" 
							 select="$Form4466Data/DirectDepositGrp/DepositorAccountNum"/>
							<xsl:with-param name="BoxNum" select="14"/>
							<xsl:with-param name="BoxWidth" select="'5mm'"/>
							<xsl:with-param name="BoxHeight" select="'5mm'"/>
							<xsl:with-param name="BoxTopPadding" select="'.5mm'"/>
						</xsl:call-template>
					</div>
					<div>
						<xsl:call-template name="PopulateIndividualSizableLetterBox">
							<xsl:with-param name="TargetNode" 
							 select="$Form4466Data/DirectDepositGrp/DepositorAccountNum"/>
							<xsl:with-param name="BoxNum" select="15"/>
							<xsl:with-param name="BoxWidth" select="'5mm'"/>
							<xsl:with-param name="BoxHeight" select="'5mm'"/>
							<xsl:with-param name="BoxTopPadding" select="'.5mm'"/>
						</xsl:call-template>
					</div>
					<div>
						<xsl:call-template name="PopulateIndividualSizableLetterBox">
							<xsl:with-param name="TargetNode" 
							 select="$Form4466Data/DirectDepositGrp/DepositorAccountNum"/>
							<xsl:with-param name="BoxNum" select="16"/>
							<xsl:with-param name="BoxWidth" select="'5mm'"/>
							<xsl:with-param name="BoxHeight" select="'5mm'"/>
							<xsl:with-param name="BoxTopPadding" select="'.5mm'"/>
						</xsl:call-template>
					</div>
					<div>
						<xsl:call-template name="PopulateIndividualSizableLetterBox">
							<xsl:with-param name="TargetNode"
							 select="$Form4466Data/DirectDepositGrp/DepositorAccountNum"/>
							<xsl:with-param name="BoxNum" select="17"/>
							<xsl:with-param name="BoxWidth" select="'5mm'"/>
							<xsl:with-param name="BoxHeight" select="'5mm'"/>
							<xsl:with-param name="BoxTopPadding" select="'.5mm'"/>
						</xsl:call-template>
					</div>
				</xsl:when>
				<xsl:otherwise>
					<div class="emptyLonLatBox"/>
					<span style="width:3mm"> </span>
					<div>
						<xsl:call-template name="PopulateIndividualSizableLetterBox">
							<xsl:with-param name="TargetNode"
							 select="$Form4466Data/DirectDepositGrp/DepositorAccountNum"/>
							<xsl:with-param name="BoxNum" select="1"/>
							<xsl:with-param name="BoxWidth" select="'5mm'"/>
							<xsl:with-param name="BoxHeight" select="'5mm'"/>
							<xsl:with-param name="BoxTopPadding" select="'.5mm'"/>
						</xsl:call-template>
					</div>
					<div>
						<xsl:call-template name="PopulateIndividualSizableLetterBox">
							<xsl:with-param name="TargetNode"
							 select="$Form4466Data/DirectDepositGrp/DepositorAccountNum"/>
							<xsl:with-param name="BoxNum" select="2"/>
							<xsl:with-param name="BoxWidth" select="'5mm'"/>
							<xsl:with-param name="BoxHeight" select="'5mm'"/>
							<xsl:with-param name="BoxTopPadding" select="'.5mm'"/>
						</xsl:call-template>
					</div>
					<div>
						<xsl:call-template name="PopulateIndividualSizableLetterBox">
							<xsl:with-param name="TargetNode"
							 select="$Form4466Data/DirectDepositGrp/DepositorAccountNum"/>
							<xsl:with-param name="BoxNum" select="3"/>
							<xsl:with-param name="BoxWidth" select="'5mm'"/>
							<xsl:with-param name="BoxHeight" select="'5mm'"/>
							<xsl:with-param name="BoxTopPadding" select="'.5mm'"/>
						</xsl:call-template>
					</div>
					<div>
						<xsl:call-template name="PopulateIndividualSizableLetterBox">
							<xsl:with-param name="TargetNode"
							 select="$Form4466Data/DirectDepositGrp/DepositorAccountNum"/>
							<xsl:with-param name="BoxNum" select="4"/>
							<xsl:with-param name="BoxWidth" select="'5mm'"/>
							<xsl:with-param name="BoxHeight" select="'5mm'"/>
							<xsl:with-param name="BoxTopPadding" select="'.5mm'"/>
						</xsl:call-template>
					</div>
					<div>
						<xsl:call-template name="PopulateIndividualSizableLetterBox">
							<xsl:with-param name="TargetNode"
							 select="$Form4466Data/DirectDepositGrp/DepositorAccountNum"/>
							<xsl:with-param name="BoxNum" select="5"/>
							<xsl:with-param name="BoxWidth" select="'5mm'"/>
							<xsl:with-param name="BoxHeight" select="'5mm'"/>
							<xsl:with-param name="BoxTopPadding" select="'.5mm'"/>
						</xsl:call-template>
					</div>
					<div>
						<xsl:call-template name="PopulateIndividualSizableLetterBox">
							<xsl:with-param name="TargetNode"
							 select="$Form4466Data/DirectDepositGrp/DepositorAccountNum"/>
							<xsl:with-param name="BoxNum" select="6"/>
							<xsl:with-param name="BoxWidth" select="'5mm'"/>
							<xsl:with-param name="BoxHeight" select="'5mm'"/>
							<xsl:with-param name="BoxTopPadding" select="'.5mm'"/>
						</xsl:call-template>
					</div>
					<div>
						<xsl:call-template name="PopulateIndividualSizableLetterBox">
							<xsl:with-param name="TargetNode"
							 select="$Form4466Data/DirectDepositGrp/DepositorAccountNum"/>
							<xsl:with-param name="BoxNum" select="7"/>
							<xsl:with-param name="BoxWidth" select="'5mm'"/>
							<xsl:with-param name="BoxHeight" select="'5mm'"/>
							<xsl:with-param name="BoxTopPadding" select="'.5mm'"/>
						</xsl:call-template>
					</div>
					<div>
						<xsl:call-template name="PopulateIndividualSizableLetterBox">
							<xsl:with-param name="TargetNode"
							 select="$Form4466Data/DirectDepositGrp/DepositorAccountNum"/>
							<xsl:with-param name="BoxNum" select="8"/>
							<xsl:with-param name="BoxWidth" select="'5mm'"/>
							<xsl:with-param name="BoxHeight" select="'5mm'"/>
							<xsl:with-param name="BoxTopPadding" select="'.5mm'"/>
						</xsl:call-template>
					</div>
					<div>
						<xsl:call-template name="PopulateIndividualSizableLetterBox">
							<xsl:with-param name="TargetNode"
							 select="$Form4466Data/DirectDepositGrp/DepositorAccountNum"/>
							<xsl:with-param name="BoxNum" select="9"/>
							<xsl:with-param name="BoxWidth" select="'5mm'"/>
							<xsl:with-param name="BoxHeight" select="'5mm'"/>
							<xsl:with-param name="BoxTopPadding" select="'.5mm'"/>
						</xsl:call-template>
					</div>
					<div>
						<xsl:call-template name="PopulateIndividualSizableLetterBox">
							<xsl:with-param name="TargetNode"
							 select="$Form4466Data/DirectDepositGrp/DepositorAccountNum"/>
							<xsl:with-param name="BoxNum" select="10"/>
							<xsl:with-param name="BoxWidth" select="'5mm'"/>
							<xsl:with-param name="BoxHeight" select="'5mm'"/>
							<xsl:with-param name="BoxTopPadding" select="'.5mm'"/>
						</xsl:call-template>
					</div>
					<div>
						<xsl:call-template name="PopulateIndividualSizableLetterBox">
							<xsl:with-param name="TargetNode"
							 select="$Form4466Data/DirectDepositGrp/DepositorAccountNum"/>
							<xsl:with-param name="BoxNum" select="11"/>
							<xsl:with-param name="BoxWidth" select="'5mm'"/>
							<xsl:with-param name="BoxHeight" select="'5mm'"/>
							<xsl:with-param name="BoxTopPadding" select="'.5mm'"/>
						</xsl:call-template>
					</div>
					<div>
						<xsl:call-template name="PopulateIndividualSizableLetterBox">
							<xsl:with-param name="TargetNode"
							 select="$Form4466Data/DirectDepositGrp/DepositorAccountNum"/>
							<xsl:with-param name="BoxNum" select="12"/>
							<xsl:with-param name="BoxWidth" select="'5mm'"/>
							<xsl:with-param name="BoxHeight" select="'5mm'"/>
							<xsl:with-param name="BoxTopPadding" select="'.5mm'"/>
						</xsl:call-template>
					</div>
					<div>
						<xsl:call-template name="PopulateIndividualSizableLetterBox">
							<xsl:with-param name="TargetNode"
							 select="$Form4466Data/DirectDepositGrp/DepositorAccountNum"/>
							<xsl:with-param name="BoxNum" select="13"/>
							<xsl:with-param name="BoxWidth" select="'5mm'"/>
							<xsl:with-param name="BoxHeight" select="'5mm'"/>
							<xsl:with-param name="BoxTopPadding" select="'.5mm'"/>
						</xsl:call-template>
					</div>
					<div>
						<xsl:call-template name="PopulateIndividualSizableLetterBox">
							<xsl:with-param name="TargetNode"
							 select="$Form4466Data/DirectDepositGrp/DepositorAccountNum"/>
							<xsl:with-param name="BoxNum" select="14"/>
							<xsl:with-param name="BoxWidth" select="'5mm'"/>
							<xsl:with-param name="BoxHeight" select="'5mm'"/>
							<xsl:with-param name="BoxTopPadding" select="'.5mm'"/>
						</xsl:call-template>
					</div>
					<div>
						<xsl:call-template name="PopulateIndividualSizableLetterBox">
							<xsl:with-param name="TargetNode"
							 select="$Form4466Data/DirectDepositGrp/DepositorAccountNum"/>
							<xsl:with-param name="BoxNum" select="15"/>
							<xsl:with-param name="BoxWidth" select="'5mm'"/>
							<xsl:with-param name="BoxHeight" select="'5mm'"/>
							<xsl:with-param name="BoxTopPadding" select="'.5mm'"/>
						</xsl:call-template>
					</div>
					<div>
						<xsl:call-template name="PopulateIndividualSizableLetterBox">
							<xsl:with-param name="TargetNode"
							 select="$Form4466Data/DirectDepositGrp/DepositorAccountNum"/>
							<xsl:with-param name="BoxNum" select="16"/>
							<xsl:with-param name="BoxWidth" select="'5mm'"/>
							<xsl:with-param name="BoxHeight" select="'5mm'"/>
							<xsl:with-param name="BoxTopPadding" select="'.5mm'"/>
						</xsl:call-template>
					</div>
					<div>
						<xsl:call-template name="PopulateIndividualSizableLetterBox">
							<xsl:with-param name="TargetNode"
							 select="$Form4466Data/DirectDepositGrp/DepositorAccountNum"/>
							<xsl:with-param name="BoxNum" select="17"/>
							<xsl:with-param name="BoxWidth" select="'5mm'"/>
							<xsl:with-param name="BoxHeight" select="'5mm'"/>
							<xsl:with-param name="BoxTopPadding" select="'.5mm'"/>
						</xsl:call-template>
					</div>
				</xsl:otherwise>
			</xsl:choose>
		</div>
	</div>	
  </div>
	
  <div class="styBB" style="width:187mm;clear:both;float:none;">
    <div class="styPartDesc" style="width:179mm;text-align:center;">
      Record of Estimated Tax Deposits
    </div>
    <div class="styGenericDiv" style="float:none;clear:none;width:7mm;text-align:right;">
       <xsl:call-template name="SetDynamicTableToggleButton">
          <xsl:with-param name="TargetNode" select="$Form4466Data/RecordOfEstimatedTxDepositsGrp"/>
          <xsl:with-param name="containerHeight" select="4"/>
          <xsl:with-param name="containerID" select=" 'RETDctn' "/>
          <xsl:with-param name="imageID" select=" 'RETDimg' "/>
          <xsl:with-param name="buttonID" select=" 'RETDbtn' "/>
       </xsl:call-template>
    </div>      
  </div>      

    <div class="styTableContainer" id="RETDctn" style="height:12.5mm;">
      <xsl:call-template name="SetInitialState"/>
      <table class="styTable" cellspacing="0" name="TYTable" id="TYTable">
        <thead class="styTableThead">
          <tr>
            <th class="styTableCellHeader" style="font-size: 7pt; width:46mm;font-weight:normal;" scope="col">Date of deposit</th>
            <th class="styTableCellHeader" style="font-size: 7pt; width:46mm;font-weight:normal;" scope="col">
              Amount
            </th>
            <th class="styTableCellHeader" style="font-size: 7pt; width:46mm;font-weight:normal;" scope="col">Date of deposit</th>
            <th class="styTableCellHeader" style="font-size: 7pt; width:46mm;font-weight:normal;" scope="col">
              Amount
            </th>
          </tr>
        </thead>
        <tfoot/>
        <tbody>
        <xsl:if test="($Print != $Separated) or (($Print=$Separated) and (count($Form4466Data/RecordOfEstimatedTxDepositsGrp) &lt;5))">
          <xsl:for-each select="$Form4466Data/RecordOfEstimatedTxDepositsGrp">
            <tr>
              <xsl:if test="position() mod 2 &gt;0">
                <xsl:variable name="posofdeposit"><xsl:value-of select="position()"/></xsl:variable>
                <td class="styTableCell" style="font-size: 7pt; text-align:center;width:46mm">
                  <xsl:call-template name="PopulateText">
                    <xsl:with-param name="TargetNode" select="DepositDt"/>
                  </xsl:call-template>
                  <span class="styTableCellPad">
                  </span>
                </td>
                <td class="styTableCell" style="font-size: 7pt; text-align:right;width:46mm;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="DepositAmt"/>
                  </xsl:call-template>
                  <span class="styTableCellPad"/>
                </td>
                <td class="styTableCell" style="font-size: 7pt; text-align:center;width:46mm;">
                  <xsl:call-template name="PopulateText">
                    <xsl:with-param name="TargetNode" select="$Form4466Data/RecordOfEstimatedTxDepositsGrp[$posofdeposit + 1]/DepositDt"/>
                  </xsl:call-template>
                  <span class="styTableCellPad"/>
                </td>
                <td class="styTableCell" style="font-size: 7pt; text-align:right;width:46mm;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form4466Data/RecordOfEstimatedTxDepositsGrp[$posofdeposit +1]/DepositAmt"/>
                  </xsl:call-template>
                  <span class="styTableCellPad"/>
                </td>
              </xsl:if>
            </tr>                        
          </xsl:for-each>
          </xsl:if>
          <xsl:if test="(count($Form4466Data/RecordOfEstimatedTxDepositsGrp) &lt;= 2) or (($Print=$Separated) and 
          (count($Form4466Data/RecordOfEstimatedTxDepositsGrp) &gt;4))">
            <tr>
              <td class="styTableCell"><span class="styTableCellPad"/>
              <xsl:if test="($Print=$Separated) and (count($Form4466Data/RecordOfEstimatedTxDepositsGrp) &gt;4)">
                  <xsl:call-template name="PopulateAdditionalDataTableMessage">
                  <xsl:with-param name="TargetNode" select="$Form4466Data/RecordOfEstimatedTxDepositsGrp/DepositDt"/>
              </xsl:call-template>
              </xsl:if></td>
              <td class="styTableCell"><span class="styTableCellPad"/></td>
              <td class="styTableCell"><span class="styTableCellPad"/></td>
              <td class="styTableCell"><span class="styTableCellPad"/></td>
            </tr>
          </xsl:if>
          <xsl:if test="(count($Form4466Data/RecordOfEstimatedTxDepositsGrp) &lt; 1) or (($Print=$Separated) and 
          (count($Form4466Data/RecordOfEstimatedTxDepositsGrp) &gt;4))">
            <tr>
              <td class="styTableCell"><span class="styTableCellPad"/></td>
              <td class="styTableCell"><span class="styTableCellPad"/></td>
              <td class="styTableCell"><span class="styTableCellPad"/></td>
              <td class="styTableCell"><span class="styTableCellPad"/></td>
            </tr>
          </xsl:if>
        </tbody>
      </table>
    </div>
    
  
					<!-- BEGIN Signature Section -->
					<!-- Implementing the signature section as a table -->
					<div class="styBB" style="width:187mm;font-size:6pt;">
					<div class="styMainTitle"  style="height:20mm;width:12mm;font-size:11pt;font-weight:bold;padding-top:7mm;
						padding-bottom:5mm;border-style:solid;border-color:black;border-width:0px 1px 0px 0px;float:left;clear:none;">Sign Here
					</div>
					<div class="styLNDesc" style="height;auto;width:175mm;">
						<div class="styLNDesc" style="height:9mm;width:175mm;padding-left:1mm;padding-bottom:1mm;">
						  Under penalties of perjury, I declare that I have examined this return, including 
						  accompanying schedules and statements, and to the best of my knowledge
						  and belief, it is true, correct, and complete. 
						</div><br/>
						<div style="width:90mm;padding-top:2mm;">
							<div style="height:auto;width:5mm;padding-left:1mm;padding-right:2mm;float:left;clear:none;">
								<span style="width:2mm"/>
							</div>
							<div style="width:82mm;">	
								<div class="styFixedUnderline" style="width:80mm;float:left;clear:none;">
									<xsl:call-template name="PopulateReturnHeaderOfficer">
										<xsl:with-param name="TargetNode">TaxpayerPIN</xsl:with-param>
									</xsl:call-template>
								</div><br/>
								<div class="styLNDesc" style="height:auto;border-bottom:1 solid black;vertical-align:top;">Signature 
								</div>
							</div>
						</div>
						<div style="width:25mm;">
							<div class="styFixedUnderline" style="width:25mm;float:left;clear:none;">
								<xsl:call-template name="PopulateReturnHeaderOfficer">
									<xsl:with-param name="TargetNode">DateSigned</xsl:with-param>
								</xsl:call-template>
							</div><br/>
							<div class="styLNDesc" style="height:auto;">Date</div>
						</div>
							<div style="width:5mm;padding-top:2mm;">
								<!--<div style="height:auto;with:5mm;padding-left:1mm;padding-right:2mm;float:left;clear;none;">
									<img src="{$ImagePath}/4466_Bullet_Lg.gif" alt="LargeRightArrow"/>
								</div>-->
							</div>
						<div style="width:35mm;">
							<div class="styFixedUnderline" style="width:40mm;float:left;clear:none;">
								<xsl:call-template name="PopulateReturnHeaderOfficer">
									<xsl:with-param name="TargetNode">Title</xsl:with-param>
								</xsl:call-template>
							</div><br/>
							<div class="styLNDesc" style="height:auto;">Title</div>
						</div>
					</div>
					</div>
					<!-- END Signature Section -->
      <!-- Footer -->
      <div style="width:187mm;float:none;clear:both;padding-top:1mm;">
        <div style="width:100mm;float:left;clear:none;">
        </div>
        <div style="width:98mm;float:left;text-align:right;clear:none;">Cat. No. 12836A</div>
        <div style="float:right;clear:none;">Form <span class="styBoldText" style="font-size:8pt;">4466</span> (Rev. 12-2025)</div>
      </div>
      <!-- End footer -->
  <!-- add page break -->
  <p class="pageend"/>
      
  <!-- Begininning of write-in data -->
    <div class="styLeftOverTitleLine" id="LeftoverData">
      <div class="styLeftOverTitle">
        Additional Data        
      </div>
      <div class="styLeftOverButtonContainer">
        <input class="styLeftoverTableBtn" tabindex="1" type="button" value="Return to Form" onclick="javascript:returnToWriteInImage();"/>
      </div>      
    </div>
    <table class="styLeftOverTbl">
      <xsl:call-template name="PopulateCommonLeftover">
        <xsl:with-param name="TargetNode" select="$Form4466Data"/>
        <xsl:with-param name="DescWidth" select="100"/>
      </xsl:call-template>
      <!-- Tanuja: Removing as there is place to show the data on the form.  No need to show it in the additional data -->
    </table>
  
  <xsl:if test="($Print = $Separated) and (count($Form4466Data/RecordOfEstimatedTxDepositsGrp) &gt;4)">
<br/>	
<table class="styDepTbl" style="font-size: 7pt; width: 92mm;page-break-before:always">
	<thead class="styTableThead">
		<tr class="styDepTblhdr">
			<th class="styDepTblCell" style="width:92mm;font-weight:bold" colspan="2" scope="col">Record of Estimated Tax Deposits</th>
		</tr>
		<tr class="styDepTblHdr">
            <th class="styDepTblCell" style="width:46mm;font-weight:normal;" scope="col">Date of deposit</th>
            <th class="styDepTblCell" style="width:46mm;font-weight:normal;" scope="col">Amount </th>
          </tr>
        </thead>
        <tfoot/>
        <tbody>
          <xsl:for-each select="$Form4466Data/RecordOfEstimatedTxDepositsGrp">
            <tr>
             <xsl:attribute name="class">
		         <xsl:choose>
                        <xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when>
                        <xsl:otherwise>styDepTblRow2</xsl:otherwise>
                      </xsl:choose>
                    </xsl:attribute>
                <td class="styDepTblCell" style="text-align:center;width:46mm">
                  <xsl:call-template name="PopulateText">
                    <xsl:with-param name="TargetNode" select="DepositDt"/>
                  </xsl:call-template>
                  <span class="styTableCellPad">
                  </span>
                </td>
                <td class="styDepTblCell" style="text-align:right;width:46mm;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="DepositAmt"/>
                  </xsl:call-template>
                  <span class="styTableCellPad"/>
                </td>
            </tr>                        
          </xsl:for-each>
        </tbody>
      </table> 
      </xsl:if>
 </form>
</body>  </html>
</xsl:template>
</xsl:stylesheet>