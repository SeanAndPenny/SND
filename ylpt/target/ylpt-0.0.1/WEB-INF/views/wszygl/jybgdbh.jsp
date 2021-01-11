<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/commons/taglib.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>检验报告单</title>
<link rel="icon" type="image/png" href="resources/images/favicon.png">
<!-- <link type="text/css" href="new/css/reset.css" rel="stylesheet" /> -->
<link href="<c:url value="/static/assets/css/reset.css"/>"
	rel="stylesheet" />
<!--<link type="text/css" href="new/css/style.css" rel="stylesheet" />-->
<!--<link type="text/css" href="new/css/tjbg.css" rel="stylesheet" />
			-->
<script src="<c:url value="/static/assets/js/jquery-1.11.0.min.js"/>"></script>
<script src="<c:url value="/static/assets/js/slide.js"/>"></script>
<script src="<c:url value="/static/assets/js/js.js"/>"></script>
<!-- <script type="text/javascript" src="new/js/jquery-1.11.0.min.js"></script>
			<script type="text/javascript" src="new/js/slide.js"></script>
			<script type="text/javascript" src="new/js/js.js"></script> -->
<style>
<!--
.xstyle_69_0 {
	WIDTH: 100%;
	DISPLAY: inline-block;
	HEIGHT: 56px;
	COLOR: black;
	FONT-SIZE: 9pt;
	VERTICAL-ALIGN: top
}

.xstyle_69_1 {
	TEXT-ALIGN: left;
	WIDTH: 99.7%;
	HEIGHT: 144px
}

.xstyle_69_2 {
	TEXT-ALIGN: center;
	LINE-HEIGHT: 29px;
	WIDTH: 829px;
	DISPLAY: inline-block;
	FONT-FAMILY: 宋体;
	HEIGHT: 39px;
	COLOR: black;
	FONT-SIZE: 21.75pt;
	VERTICAL-ALIGN: middle;
	FONT-WEIGHT: bold;
	TEXT-DECORATION: none
}

.xstyle_69_3 {
	TEXT-ALIGN: center;
	LINE-HEIGHT: 21px;
	WIDTH: 829px;
	DISPLAY: inline-block;
	FONT-FAMILY: 宋体;
	HEIGHT: 28px;
	COLOR: black;
	FONT-SIZE: 15.75pt;
	VERTICAL-ALIGN: middle;
	FONT-WEIGHT: bold;
	TEXT-DECORATION: none
}

.xstyle_69_4 {
	WIDTH: 833px;
	BORDER-COLLAPSE: collapse;
	TABLE-LAYOUT: fixed
}

.xstyle_69_5 {
	TEXT-ALIGN: center;
	PADDING-BOTTOM: 2.4pt;
	PADDING-LEFT: 3.6pt;
	PADDING-RIGHT: 3.6pt;
	VERTICAL-ALIGN: middle;
	PADDING-TOP: 2.4pt
}

.xstyle_69_6 {
	TEXT-ALIGN: center;
	LINE-HEIGHT: 1em;
	FONT-FAMILY: 宋体;
	COLOR: black;
	FONT-SIZE: 9pt;
	VERTICAL-ALIGN: middle;
	WORD-BREAK: keep-all;
	TEXT-DECORATION: none
}

.xstyle_69_7 {
	TEXT-ALIGN: left;
	PADDING-BOTTOM: 2.4pt;
	PADDING-LEFT: 3.6pt;
	PADDING-RIGHT: 3.6pt;
	VERTICAL-ALIGN: middle;
	OVERFLOW: hidden;
	PADDING-TOP: 2.4pt
}

.xstyle_69_8 {
	TEXT-ALIGN: left;
	LINE-HEIGHT: 1em;
	FONT-FAMILY: 宋体;
	WHITE-SPACE: nowrap;
	COLOR: black;
	FONT-SIZE: 9pt;
	VERTICAL-ALIGN: middle;
	OVERFLOW: hidden;
	TEXT-DECORATION: none
}

.xstyle_69_9 {
	TEXT-ALIGN: left;
	PADDING-BOTTOM: 2.4pt;
	PADDING-LEFT: 3.6pt;
	PADDING-RIGHT: 3.6pt;
	VERTICAL-ALIGN: middle;
	PADDING-TOP: 2.4pt
}

.xstyle_69_10 {
	TEXT-ALIGN: left;
	LINE-HEIGHT: 1em;
	FONT-FAMILY: 宋体;
	COLOR: black;
	FONT-SIZE: 9pt;
	VERTICAL-ALIGN: middle;
	WORD-BREAK: keep-all;
	TEXT-DECORATION: none
}

.xstyle_69_11 {
	TEXT-ALIGN: left;
	WIDTH: 99.7%
}

.xstyle_69_12 {
	WIDTH: 825px;
	BORDER-COLLAPSE: collapse;
	TABLE-LAYOUT: fixed
}

.xstyle_69_13 {
	BORDER-BOTTOM: black 1px solid;
	TEXT-ALIGN: center;
	BORDER-LEFT: black 1px;
	PADDING-BOTTOM: 2.4pt;
	PADDING-LEFT: 3.6pt;
	PADDING-RIGHT: 3.6pt;
	VERTICAL-ALIGN: middle;
	BORDER-TOP: black 1px solid;
	BORDER-RIGHT: black 1px;
	PADDING-TOP: 2.4pt
}

.xstyle_69_14 {
	TEXT-ALIGN: left;
	WIDTH: 99.7%;
	HEIGHT: 64px
}

.xstyle_69_15 {
	BORDER-BOTTOM: black 1px;
	TEXT-ALIGN: left;
	BORDER-LEFT: black 1px;
	LINE-HEIGHT: 12px;
	WIDTH: 824px;
	DISPLAY: inline-block;
	FONT-FAMILY: 宋体;
	HEIGHT: 8px;
	COLOR: black;
	FONT-SIZE: 9pt;
	VERTICAL-ALIGN: middle;
	BORDER-TOP: black 1px solid;
	BORDER-RIGHT: black 1px;
	TEXT-DECORATION: none
}

.xstyle_69_16 {
	WIDTH: 816px;
	BORDER-COLLAPSE: collapse;
	TABLE-LAYOUT: fixed
}

.xstyle_69_17 {
	TEXT-ALIGN: left;
	LINE-HEIGHT: 12px;
	WIDTH: 330px;
	DISPLAY: inline-block;
	FONT-FAMILY: 宋体;
	HEIGHT: 20px;
	COLOR: black;
	FONT-SIZE: 9pt;
	VERTICAL-ALIGN: middle;
	TEXT-DECORATION: none
}
-->
</style>
</head>
<body>
	<DIV id=Default_HtmlContent PageCount="1" MinPageIndex="0"
		version="1.0.2011.11127" style="margin-top: 60px">
		<DIV style="HEIGHT: 20px"></DIV>
		<DIV
			style="BORDER-BOTTOM: black 2px solid; TEXT-ALIGN: left; BORDER-LEFT: black 2px solid; PADDING-BOTTOM: 57px; BACKGROUND-COLOR: white; PADDING-LEFT: 57px; WIDTH: 829px; PADDING-RIGHT: 57px; HEIGHT: auto; BORDER-TOP: black 2px solid; BORDER-RIGHT: black 2px solid; margin: 0px auto"
			id=Default_xreportpage1>
			<DIV
				style="BORDER-BOTTOM: black 0px; BORDER-LEFT: black 0px; PADDING-LEFT: 0px; WIDTH: 828px; OVERFLOW: hidden; BORDER-TOP: black 0px; BORDER-RIGHT: black 0px; PADDING-TOP: 0px">
				<SPAN id=Panel1 class=xstyle_69_1> <!-- <DIV id=Label1 class=xstyle_69_2>南京市第二医院</DIV> -->
					<DIV id=Label2 class=xstyle_69_3>&nbsp;&nbsp;检验报告单</DIV>
					<div class="T_title T_bg">
						<p align="right" class="pT10">
							检测编号：
							 <span class="blueColor">${cszm.XM } </span>
							 
						</p>
					</div>
					<TABLE id=Table2 class=xstyle_69_4 cellSpacing=0 cellPadding=0>
						<TBODY>
						 
							<TR style="HEIGHT: 25px">
								<TD class=xstyle_69_5 style="width: 5px;"><SPAN
									class=xstyle_69_6>科室：</SPAN></TD>
								<TD class=xstyle_69_7 style="width: 15px;"><SPAN
									class=xstyle_69_8> ${jyrxx.sqksmc }  </SPAN></TD>
								<TD class=xstyle_69_9 style="width: 10px;"><SPAN
									class=xstyle_69_10>姓名：</SPAN></TD>
								<TD class=xstyle_69_7 style="width: 10px;"><SPAN
									class=xstyle_69_8>${jyrxx.brxm } </SPAN></TD>
								<TD class=xstyle_69_9 style="width: 10px;"><SPAN
									class=xstyle_69_10>性别：</SPAN></TD>
								<TD class=xstyle_69_7 style="width: 10px;"><SPAN
									class=xstyle_69_8> ${jyrxx.brxb } </SPAN></TD>
								<TD class=xstyle_69_9 style="width: 10px;"><SPAN
									class=xstyle_69_10>年龄：</SPAN></TD>
								<TD class=xstyle_69_7 style="width: 10px;"><SPAN
									class=xstyle_69_8>${jyrxx.brnl } </SPAN></TD>
								<TD class=xstyle_69_5 style="width: 10px;"><SPAN
									class=xstyle_69_6>审核医生：</SPAN></TD>
								<TD class=xstyle_69_7 style="width: 10px;"><SPAN
									class=xstyle_69_8>${jyrxx.shrxm } </SPAN></TD>
							</TR>
							<TR style="HEIGHT: 25px" style="width:10px;">
								<TD class=xstyle_69_5><SPAN class=xstyle_69_6>病区：</SPAN></TD>
								<TD class=xstyle_69_7 style="width: 10px;"><SPAN
									class=xstyle_69_8>${jyrxx.bq } </SPAN></TD>
								<TD class=xstyle_69_9 style="width: 10px;"><SPAN
									class=xstyle_69_10>床号：</SPAN></TD>
								<TD class=xstyle_69_7 style="width: 10px;"><SPAN
									class=xstyle_69_8>${jyrxx.ch } </SPAN></TD>
								<TD class=xstyle_69_9 style="width: 10px;"><SPAN
									class=xstyle_69_10>标本名称：</SPAN></TD>
								<TD class=xstyle_69_7 style="width: 10px;"><SPAN
									class=xstyle_69_8>${jyrxx.bbmc } </SPAN></TD>
								<TD class=xstyle_69_9 style="width: 10px;"><SPAN
									class=xstyle_69_10>送检日期：</SPAN></TD>
								<TD class=xstyle_69_7 style="width: 10px;"><SPAN
									class=xstyle_69_8>${jyrxx.jyrq } </SPAN></TD>
								<TD class=xstyle_69_5 style="width: 10px;"><SPAN
									class=xstyle_69_6>采样时间：</SPAN></TD>
								<TD class=xstyle_69_7 style="width: 10px;"><SPAN
									class=xstyle_69_8>${jyrxx.bbcyrqsj } </SPAN></TD>
								</TR>
								 
						</TBODY>
					</TABLE>
				</SPAN><SPAN id=Panel2 class=xstyle_69_11>
					<TABLE id=Table1 class=xstyle_69_12 cellSpacing=0 cellPadding=0>
						<COLGROUP>
							<COL style="WIDTH: 164px">
							<COL style="WIDTH: 164px">
							<COL style="WIDTH: 164px">
							<COL style="WIDTH: 164px">
							<!--
												<COL style="WIDTH: 164px">
													-->
							<thead>
								<TR style="HEIGHT: 24px">
									<TD class=xstyle_69_13><SPAN class=xstyle_69_6>编号</SPAN></TD>
									<TD class=xstyle_69_13><SPAN class=xstyle_69_6>项目</SPAN></TD>
									<TD class=xstyle_69_13><SPAN class=xstyle_69_6>结果</SPAN></TD>
									<TD class=xstyle_69_13><SPAN class=xstyle_69_6>参考值</SPAN>
									</TD>
								</TR>
							</thead>
							<tbody>
								 <c:forEach items="${jyrxxList }" var="jyrxxList">
									<TR style="HEIGHT: 26px">
										<TD class=xstyle_69_5><SPAN class=xstyle_69_6>${jyrxxList.jyzblsh }
										</SPAN></TD>
										<TD class=xstyle_69_5><SPAN class=xstyle_69_6>${jyrxxList.jyffmc }
										</SPAN></TD>
										<TD class=xstyle_69_5><SPAN class=xstyle_69_6>${jyrxxList.jyjg }
										</SPAN></TD>
										<TD class=xstyle_69_5><SPAN class=xstyle_69_6>${jyrxxList.ckz }
										</SPAN></TD>
									</TR>
								 </c:forEach>
							</tbody>
					</TABLE>
				</SPAN><SPAN id=Panel3 class=xstyle_69_14></SPAN>
				<DIV style="HEIGHT: 74px; OVERFLOW: hidden"></DIV>
				<SPAN id=Panel3 class=xstyle_69_14>
					<DIV id=Label3 class=xstyle_69_15></DIV>
					<TABLE id=Table3 class=xstyle_69_16 cellSpacing=0 cellPadding=0>
						<COLGROUP>
							<COL style="WIDTH: 102px">
							<COL style="WIDTH: 102px">
							<COL style="WIDTH: 102px">
							<COL style="WIDTH: 102px">
							<COL style="WIDTH: 102px">
							<COL style="WIDTH: 102px">
							<COL style="WIDTH: 102px">
							<COL style="WIDTH: 102px">
							<TBODY>
							 
								<TR style="HEIGHT: 23px">
									<TD class=xstyle_69_5><SPAN class=xstyle_69_6>申请医生：</SPAN>
									</TD>
									<TD class=xstyle_69_9><SPAN class=xstyle_69_10>${jyrxx.sqrxm }
									</SPAN></TD>
									<TD class=xstyle_69_5><SPAN class=xstyle_69_6>申请日期：</SPAN>
									</TD>
									<TD class=xstyle_69_9><SPAN class=xstyle_69_10>${jyrxx.sqrq }
									</SPAN></TD>
									<TD class=xstyle_69_5><SPAN class=xstyle_69_6>打印日期：</SPAN>
									</TD>
									<TD class=xstyle_69_9><SPAN class=xstyle_69_10>${jyrxx.dyrq }
									</SPAN></TD>
									<TD class=xstyle_69_5><SPAN class=xstyle_69_6>报告医生：</SPAN>
									</TD>
									<TD class=xstyle_69_9><SPAN class=xstyle_69_10>${jyrxx.bgrxm }
									</SPAN></TD>

								</TR>
								 
							</TBODY>
					</TABLE>
					<DIV style="HEIGHT: 20px"></DIV>
			</DIV>
</body>
</html>