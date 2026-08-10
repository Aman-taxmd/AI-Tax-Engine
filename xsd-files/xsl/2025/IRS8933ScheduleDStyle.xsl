<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:template name="IRS8933ScheduleDStyle">

	.sty8933DDotLn {
		letter-spacing:3.1mm;
		font-weight:bold;
		float:right;
		padding-right:2px;
	}
	.sty8933DYr {
		width:55%;height:5mm;border-bottom:1px solid black;padding-top:1mm;
	}
	.sty8933DHeaderBox {
		width:55mm;height:11mm;
		padding-top:.5mm;
		padding-bottom:0mm;
		padding-right:.5mm;
		text-align:center;
		border-style: solid; border-color: black;
		border-top-width: 0px; border-bottom-width: 0px; border-left-width: 1px; border-right-width: 0px;
		float:left; clear: none;
	}
	.sty8933DBusP1Box {
		width:55mm;border-bottom:1px solid black;height:19mm;padding-left:1mm;
	}
	.sty8933DEINP1Box {
		width:55mm;border-bottom:1px solid black;height:10mm;padding-left:1mm;text-align:center;
	}
	.sty8933DAddP1Box {
		width:55mm;border-bottom:1px solid black;height:19mm;padding-left:1mm;
	}
	.sty8933DOpIntP1Box {
		width:55mm;height:8mm;text-align:right;padding-right:1mm;padding-top:4mm;
	}
	.sty8933DP1Box {
		width:55mm;height:57mm;
		padding-top:.5mm;
		padding-bottom:.5mm;
		padding-right:.5mm;
		text-align:left;
		border-style: solid; border-color: black;
		border-top-width: 0px; border-bottom-width: 0px; border-left-width: 1px; border-right-width: 0px;
		float:left; clear: none;
	}
	.sty8933DCheckBox {
		width:27mm;height:4.2mm;
		padding-top:.5mm;
		padding-bottom:.5mm;
		padding-right:.5mm;
		text-align:right;
		border-style: solid; border-color: black;
		border-top-width: 0px; border-bottom-width: 1px; border-left-width: 1px; border-right-width: 0px;
		float:left; clear: none;
	}
	.sty8933DDescLandscapes{ /* Line item description for forms in Landscape format*/
		width:216mm;
		padding-top:.5mm;
		padding-bottom:.5mm;
		float:left; clear: none;
	}
	.sty8933DAmt{ /* Line item description for forms in Landscape format*/
		width:80mm;
		text-align:center;
		float:left; clear: none;
	}
	</xsl:template>
</xsl:stylesheet>