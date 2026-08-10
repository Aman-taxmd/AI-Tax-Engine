<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output method="html" encoding="iso-8859-1"/>
<!--
*****************************************************************************************************
Populate Line Templates
*****************************************************************************************************
Created by: Sergey Smirnov <sergey.n.smirnov@irs.gov>.  October 2024   
*****************************************************************************************************
Description: Set of templates that format the line with the line number, description, 
			and value of the TargetNode
For example:   12a | Total paid amount | 12a | 23,345.00 |
*****************************************************************************************************
-->
<xsl:template name="CreateAmountBox">		
<xsl:param name="Number"/> <!-- Line number -->
		<xsl:param name="TargetNode"/> <!-- Reference to the data element in the XML data file -->
		<xsl:param name="NumberBoxWidth">7mm</xsl:param>		
		<xsl:param name="AmountBoxWidth">29mm</xsl:param>
		<xsl:param name="Height">4mm</xsl:param>
		<xsl:param name="Attachment"/> <!-- Reference to the data element which contains attachement attributes. Usually the same as TargetNode -->
		<xsl:param name="Prefix"/> <!-- Optional prefix to the data value -->
		<xsl:param name="Postfix"/> <!-- Optional postfix to the data value -->
		<xsl:param name="NumberBoxStyle"/> <!-- Optional style of the number cell -->		
		<xsl:param name="AmountBoxStyle"/> <!-- Optional style of the amount cell -->

		
		<!-- Number Box -->
		<div style="
			display:flex; justify-content: center; align-items: flex-end;
			width:{$NumberBoxWidth};
			height:{$Height};
			padding: 0 1mm 0.3mm 1mm;
			border-style: solid; border-color: black; border-width: 0 0 1px 1px;
			font-weight:bold; text-align:center;
			vertical-align:bottom;
			float:left; clear: none; 
			background: yellow; {$NumberBoxStyle}">
				
		<xsl:if test="$Number">
			<div style="">
				<xsl:value-of select="$Number"/>
			</div>
		</xsl:if>
		</div>
		
		<xsl:variable name="JustifyContent">
		<xsl:choose>
			<xsl:when test="$Attachment">justify-content:space-between</xsl:when>
			<xsl:otherwise>justify-content: flex-end</xsl:otherwise>
		</xsl:choose>
		</xsl:variable>
		
		<!-- Amount Box -->	
		<div style="
				display:flex; {$JustifyContent}; align-items: flex-end;
				width:{$AmountBoxWidth};
				height:{$Height};
				padding: 0 1mm 0.3mm 1mm;
				border-style: solid; border-color: black; border-width: 0 0 1px 1px;
				text-align:right; 
				float:left; clear: none; {$AmountBoxStyle}">
			
			<xsl:if test="$Attachment">
				<xsl:call-template name="SetFormLinkInline">
					<xsl:with-param name="TargetNode" select="$Attachment"/>
				</xsl:call-template>
			</xsl:if>
				
			<xsl:if test="$Prefix">
				<div style="display:block;">
					<xsl:copy-of select="$Prefix"/>
				</div>
			</xsl:if>
			<xsl:if test="$TargetNode">
				<div style="display:block;">
					<xsl:call-template name="PopulateAmount">
					<xsl:with-param name="TargetNode" select="$TargetNode"/>
					</xsl:call-template>
				</div>
			</xsl:if>
			<xsl:if test="$Postfix">
				<div style="display:block;">
					<xsl:copy-of select="$Postfix"/>
				</div>
			</xsl:if>
			
		</div>
	</xsl:template>	
	
<!--
	**********************************************************************************************************************
	Name:           PopulateRegularLine
	Description:    This template formats the regulare line with the line number, description, and value of the TargetNode
	Sample:         12a | Total paid amount | 12a | 23,345.00 |
	************************************************************************************************************************
-->
	
	<xsl:template name="PopulateRegularLine">
		<xsl:param name="Number"/> <!-- Line number -->
		<xsl:param name="Letter"/> <!-- Letter right to the line number --> 
		<xsl:param name="Description"/> <!-- Description of the data value -->
		<xsl:param name="Dots"/> <!-- Dots right to the description -->
		<xsl:param name="TargetNode"/> <!-- Reference to the data element in the XML data file -->
		<xsl:param name="Attachment"/> <!-- Reference to the data element which contains attachement attributes. Usually the same as TargetNode -->
		<xsl:param name="Prefix"/> <!-- Optional prefix to the data value -->
		<xsl:param name="Postfix"/> <!-- Optional postfix to the data value -->
		<xsl:param name="Rows">1</xsl:param> <!-- Number of rows this line takes -->
		<xsl:param name="Height" select="concat($Rows * 4,'mm')"/>
		<xsl:param name="LineWidth" select="$LineWidth"/> 
		<xsl:param name="LineNumberStyle" />
		<xsl:param name="LineLetterStyle" />		
		<xsl:param name="AmountBoxStyle" />

		<!-- <xsl:variable name="PaddingTop" select="concat(4 * ($Rows - 1) + 0.5,'mm')"/> Obsolete? -->
		<xsl:variable name="LineNumber">
		<xsl:choose>
			<xsl:when test="not($Letter) or $Letter = 'a'"><xsl:value-of select="$Number"/></xsl:when>
			<xsl:when test="$Letter != 'a'"></xsl:when>
		</xsl:choose>
		</xsl:variable>
		<xsl:variable name="DataNumber" select="concat($Number,$Letter)"/>
		<xsl:variable name="RlineDescriptionWidth" select="concat(substring-before($LineWidth,'mm') - substring-before($LineNumberWidth,'mm') - 4
		                                     - substring-before($AmountBoxWidth,'mm') - substring-before($NumberBoxWidth,'mm') - 0.5,
											'mm')" />
				
			<div style="padding: 0; border-width: 0; float: none; clear: none;
				width: {$LineWidth};
				height:{$Height};">
				
				<div style="width:{$LineNumberWidth}; 
					height:100%;
					padding:.75mm 0 0 0;
					text-align:right; 
					font-weight:bold;
                    float:left; clear:none;
                    {$LineNumberStyle};
                    ">
				<xsl:value-of select="$LineNumber"/>
				</div> 
				
				<div style="width:4mm; height:100%; padding:.75mm 6px 0 0; text-align:left; font-weight:bold; float:left; clear:none; {$LineLetterStyle};">
					<xsl:if test="$Letter != ''"><xsl:value-of select="$Letter"/></xsl:if>
				</div>
				<div style="	width:{$RlineDescriptionWidth}; 
					height:100%;
					padding:.5mm 0 .5mm 0;
					border-width:0 0 0 0; 
					float:left; clear: none;	">
					 <xsl:copy-of select="$Description"/>
					<!--Dotted Line-->
					<span class="styDotLn" style="float:none;clear:none;padding-left:1mm;"><xsl:copy-of select="$Dots"/></span>
				</div>
				
				<div style="float:right; height:{$Height};">
					<xsl:call-template name="CreateAmountBox">
						<xsl:with-param name="Number" select="$DataNumber"/>
						<xsl:with-param name="TargetNode" select="$TargetNode"/>
						<xsl:with-param name="Attachment" select="$Attachment"/>
						<xsl:with-param name="Prefix" select="$Prefix"/>
						<xsl:with-param name="Postfix" select="$Postfix"/>
						<xsl:with-param name="AmountBoxStyle" select="$AmountBoxStyle"/>
						<xsl:with-param name="AmountBoxWidth" select="$AmountBoxWidth"/>
						<xsl:with-param name="NumberBoxWidth" select="$NumberBoxWidth"/>
						<xsl:with-param name="Height" select="$Height"/>
					</xsl:call-template>
				</div>
			</div>
	</xsl:template>	 
	
	
	<!--
	*****************************************************************************************************************************
	Name:           PopulateLeftShiftedLine
	Description:    This template formats the line with the line number, description, shifted left value of the TargetNode, 
					and empty grayed cell to the right
	Sample:         12a | Total paid amount | 12a | 23,345.00 |<gray>|<blank>|	
	*****************************************************************************************************************************
	-->
    <xsl:template name="PopulateLeftShiftedLine">
		
		<xsl:param name="Number"/> <!-- Line number -->
		<xsl:param name="Letter"/> <!-- Letter right to the line number --> 
		<xsl:param name="Description"/> <!-- Description of the data value -->
		<xsl:param name="Dots"/> <!-- Dots right to the description -->
		<xsl:param name="TargetNode"/> <!-- Reference to the data element in the XML data file -->
		<xsl:param name="Attachment"/> <!-- Reference to the data element which contains attachement attributes. Usually the same as TargetNode -->
		<xsl:param name="Prefix"/> <!-- Optional prefix to the data value -->
		<xsl:param name="Postfix"/> <!-- Optional postfix to the data value -->
		<xsl:param name="Rows">1</xsl:param> <!-- Number of rows this line takes -->
		<xsl:param name="Height" select="concat($Rows * 4,'mm')"/> <!-- Optional height of the line in mm -->
		<xsl:param name="LineWidth" select="$LineWidth"/> 		
		<xsl:param name="LineNumberStyle" />
		<xsl:param name="LineLetterStyle" />
		<xsl:param name="AmountBoxStyle" />
		
		<!-- <xsl:variable name="PaddingTop" select="concat(4 * ($Rows - 1) + 0.5,'mm')"/> Obsolete? -->
		<xsl:variable name="LineNumber">
		<xsl:choose>
			<xsl:when test="not($Letter) or $Letter = 'a'"><xsl:value-of select="$Number"/></xsl:when>
			<xsl:when test="$Letter != 'a'"></xsl:when>
		</xsl:choose>
		</xsl:variable>
		<xsl:variable name="DataNumber" select="concat($Number,$Letter)"/>
		<xsl:variable name="LlineDescriptionWidth" select="concat(substring-before($LineWidth,'mm') - substring-before($LineNumberWidth,'mm') - 4
		                                     - 2*substring-before($AmountBoxWidth,'mm') - 2*substring-before($NumberBoxWidth,'mm') - 0.5,
											'mm')" />
				
		<div style="padding: 0; border-width: 0; float: none; clear: none;
				width: {$LineWidth};
				height:{$Height};">
				<div style="width:{$LineNumberWidth}; 
					height:100%;
					padding:.75mm 0 0 0;
					text-align:right; 
					font-weight:bold;
                    float:left; clear:none;
                    {$LineNumberStyle}; 
                    ">
				<xsl:value-of select="$LineNumber"/>
				</div> 
				<div style="width:4mm; height:100%; padding:.75mm 6px 0 0; text-align:left; font-weight:bold; float:left; clear:none; {$LineLetterStyle};">
					<xsl:if test="$Letter != ''"><xsl:value-of select="$Letter"/></xsl:if>
				</div>
				<div style="	width:{$LlineDescriptionWidth}; 
					height:100%;
					padding:.5mm 0 .5mm 0;
					border-width:0 0 0 0; 
					float:left; clear: none;	">
					 <xsl:copy-of select="$Description"/>
					<!--Dotted Line-->
					<span class="styDotLn" style="float:none;clear:none;padding-left:1mm;"><xsl:copy-of select="$Dots"/></span>
				</div>
				
				<div style="	float:right; height:{$Height};">					
						<xsl:call-template name="CreateAmountBox">
						<xsl:with-param name="AmountBoxStyle">border-width:0px 0px 0px 1px; padding:0 0 0 0;</xsl:with-param>
						<xsl:with-param name="NumberBoxStyle">border-width:0px 0px 0px 1px; padding:0 0 0 0;background-color:lightgrey;</xsl:with-param>
						<xsl:with-param name="Height" select="$Height"/>	
						<xsl:with-param name="AmountBoxWidth" select="$AmountBoxWidth"/>
						<xsl:with-param name="NumberBoxWidth" select="$NumberBoxWidth"/>
					</xsl:call-template>
				</div>
				<div style="	float:right; height:{$Height};">
					<xsl:call-template name="CreateAmountBox">
						<xsl:with-param name="Number" select="$DataNumber"/>
						<xsl:with-param name="TargetNode" select="$TargetNode"/>
						<xsl:with-param name="Attachment" select="$Attachment"/>
						<xsl:with-param name="Prefix" select="$Prefix"/>
						<xsl:with-param name="Postfix" select="$Postfix"/>
						<xsl:with-param name="AmountBoxStyle" select="$AmountBoxStyle"/>
						<xsl:with-param name="Height" select="$Height"/>
						<xsl:with-param name="AmountBoxWidth" select="$AmountBoxWidth"/>
						<xsl:with-param name="NumberBoxWidth" select="$NumberBoxWidth"/>
					</xsl:call-template>
				</div>
			
		</div>
    </xsl:template>
    
    <!--
	*****************************************************************************************************************************
	Name:           TestXPath
	Description:    This template creates the javascript that implements a widjet for testing XPath defects
	*****************************************************************************************************************************
	-->
    <xsl:template name="TestXPath">
    
    <script>
  // Function to change background color by the entered ID

  const xpathColor = '#FFAAAA';
  let   elements = document.querySelectorAll('#abracadabra');

  function convertIdFromSchema(schemaId) {
     return "/AppData/SubmissionHeaderAndDocument/SubmissionDocument/" + schemaId.replaceAll("/","[1]/") + "[1]";
  }

  function convertIdFromTransmissionXML(xmlId){
    const pos = xmlId.indexOf("SubmissionDocument") + 22;
    return "/AppData/SubmissionHeaderAndDocument/SubmissionDocument/" + xmlId.substring(pos);
  }

  function changeBackgroundColorById(id) {

    elements.forEach(element => {
      element.style.backgroundColor = 'white';  // Set background color to yellow
    })

    if(id.indexOf("AppData[1]") != -1 ){
		id = convertIdFromTransmissionXML(id);
    }
    else if(id.indexOf("AppData") == -1 ) {
      id = convertIdFromSchema(id)
    }
    
    const idSelector = "[id='" + id + "']";
    alert(idSelector);
    elements = document.querySelectorAll(idSelector);  // Get element by ID
    elements.forEach(element => {
      element.style.backgroundColor = xpathColor;  // Set background color to yellow
    })

  }

</script>

<div style="border:2px red solid; background-color:#FFBBBB; padding:20px; width:200mm">
  <!-- Input field to enter a specific ID -->
  <label for="idInput">Enter XPath:</label>
  <input type="text" id="idInput" style="width:150mm"/>
  <!-- Button to trigger the background color change -->
  <button id="colorChangeBtn">Test XPath</button>
</div>

<script>

  // Event listener for the button click to trigger the function
  document.getElementById('colorChangeBtn').addEventListener('click', function() {
    const userId = document.getElementById('idInput').value;  // Get the value from the input field

    if (userId) {
      changeBackgroundColorById(userId);   // Call the function with the entered ID
    } else {
      alert('Please enter an ID.');
    }
  });

</script>

    
    </xsl:template>


</xsl:stylesheet>
