<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fo="http://www.w3.org/1999/XSL/Format">
	<xsl:template name="IRS945XStyle">

    .styIRS945XRightNumBox{ /* Right number box */
		width:6mm;height:6mm;
		padding-top:1mm;
		font-weight:bold;
		text-align:center;
		vertical-align:bottom;
		float:left; clear: none;
	}
	
	.styIRS945XInfoBox{ /* Info box */
		width:128mm;
		height:70mm;
		float:left;
		border:black solid 1px;
		padding-top:2mm;
		padding-left:2mm;
		padding-right:2mm;
		float: left; clear: left;
	}

</xsl:template>
</xsl:stylesheet>