<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fo="http://www.w3.org/1999/XSL/Format">
	<xsl:template name="IRS1045Style">
	.sty1045DashedLine{
		float:right; clear:none;
		border-bottom:.5px dashed black;
		width:52mm;
	}
	.sty1045DotLn {
		letter-spacing:3.1mm;
		font-weight:bold;
		float:right;
		padding-right:2px;
	}
	.sty1045Desc {
		width:65mm;height:4mm;
		padding-top:.5mm;
		padding-bottom:.5mm;
		float:left; clear: none;
	}
	.sty1045ColHeader {
		width:57mm;height:11mm;
		text-align:center;
		padding:1mm;
		border-style: solid; border-color: black;
		border-top-width: 0px; border-bottom-width: 1px; border-left-width: 1px; border-right-width: 0px;
		float:left;clear:none;
	}
	.sty1045ColHeaderEmpty {
		width:38mm;height:11mm;
		text-align:center;
		padding:1mm;
		border-style: solid; border-color: black;
		border-top-width: 0px; border-bottom-width: 1px; border-left-width: 1px; border-right-width: 0px;
		float:left;clear:none;
	}
	.sty1045ColHeaderBelow {
		height:10mm;width:28.5mm;
		text-align:center;
		padding:1mm;
		border-style: solid; border-color: black;
		border-top-width: 0px; border-bottom-width: 1px; border-left-width: 1px; border-right-width: 0px;
		float:left;clear:none;
	}
	.sty1045ColHeaderBelowEmpty {
		height:10mm;width:19mm;
		text-align:center;
		padding:1mm;
		border-style: solid; border-color: black;
		border-top-width: 0px; border-bottom-width: 1px; border-left-width: 1px; border-right-width: 0px;
		float:left;clear:none;
	}
	.sty1045AmtBox {
		width:28.5mm;height:auto;
		padding-top:.5mm;
		padding-bottom:.5mm;
		padding-right:.5mm;
		text-align:right;
		border-style: solid; border-color: black;
		border-top-width: 0px; border-bottom-width: 1px; border-left-width: 1px; border-right-width: 0px;
		float:left; clear: none;
	}
	.sty1045AmtBoxEmpty {
		width:19mm;height:auto;
		padding-top:.5mm;
		padding-bottom:.5mm;
		padding-right:.5mm;
		text-align:right;
		border-style: solid; border-color: black;
		border-top-width: 0px; border-bottom-width: 1px; border-left-width: 1px; border-right-width: 0px;
		float:left; clear: none;
	}
	.sty1045OrdinalNum {
		width:25%;height:3.5mm;border-bottom:1px solid black;margin-top:1mm;
	}
	.sty1045PrecYrEnd {
		width:55%;height:3.5mm;border-bottom:1px solid black;margin-top:1mm;
	}
	.leftBox {
		float:left;
		width:8mm;height:34mm;
		padding-top:12mm;
		border-right:1px solid black;
		font-weight:bold;
	}
	.sty1045LongDesc {
		width:33mm;height:auto;
		float:left; clear: none;
	}
	</xsl:template>
</xsl:stylesheet>
