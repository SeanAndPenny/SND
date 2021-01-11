<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>孕妇分娩详细信息</title>
<script type="text/javascript" src="<c:url value="/static/commons/js/echarts/echarts.js"/>"></script>

	<style>
caption, th, td {
	text-align: left;
	font-weight: normal;
	float: none !important;
}
.records {
	width: 1019px;
	padding: 15px 30px 25px;
	margin: 20px auto 26px;
	background: #fff;
	border: 1px solid #EBEBEB;
	border-top: 0px;
	border-bottom: 1px solid #e2e2e2;
	-webkit-border-radius: 5px;
	-moz-border-radius: 5px;
	border-radius: 5px;
	-webkit-box-shadow: 1px 1px 3px #e2e2e2;
	-moz-box-shadow: 1px 1px 3px #e2e2e2;
	box-shadow: 1px 1px 3px #e2e2e2;
}
.title {
	height: 32px;
	width: 100%;
	background: #61a9f1;
	text-align: center;
	font: bold 16px/32px 'Microsoft Yahei';
	color: #fff;
}
.title1 {
	height: 2px;
	width: 100%;
	background: #61a9f1;
}
.supervise {
	padding: 20px 0 0;
}
.supervise .text_tab td {
	font: 12px/26px Microsoft yahei;
	color: #808080;
}
#message {
	font-size: 20px
}
</style>
</head>
<body onload="BMI()">
	<div class="wrap">
		<div class="main_con records">
			<div class="title">孕妇分娩详细信息</div>
			<div class="supervise k_b">
				<table width="100%" class="text_tab" border="0" cellspacing="0"
					border="1" cellspacing="0">
					<c:forEach items="${getFmxx}" var="item">
						<th id="message">基本信息</th>
						<tr width="15%">
							<td width="50%">姓名:${item.xm }</td>
							<td width="50%">出生日期：${item.csrq }</td>
						</tr>
						<tr>
							<td width="50%">名族:${item.mz }</td>
							<td width="50%">国籍：${item.gj }</td>
						</tr>
						<tr>
							<td width="50%">联系电话：${item.lxdh }</td>
							<td width="50%">居中地址：${item.dz }</td>
						</tr>

					</c:forEach>
				</table>
			</div>
			<div class="supervise">
				<table width="100%" class="tab11" border="0" cellspacing="0"
					cellpadding="0">
				</table>
			</div>
			<div class="supervise k_b">
				<table width="100%" class="text_tab" border="0" cellspacing="0"
					border="1" cellspacing="0">
					<c:forEach items="${getFmxx}" var="item">
						<div class="title1"></div>
						<th id="message">分娩信息</th>
						<tr width="15%">
							<td width="50%">分娩机构:${item.jg }</td>
							<td width="50%">分娩时间：${item.sj }</td>
						</tr>
						<tr>
							<td width="50%">分娩方式:${item.fs }</td>
							<td width="50%">入院体重：${item.rytz }</td>
						</tr>
						<tr>
							<td width="50%">入院血压一:${item.ryxy1 }</td>
							<td width="50%">入院血压二：${item.ryxy2 }</td>
						</tr>
						<tr>
							<td width="50%">分娩孕周:${item.fmyz }</td>
							<td width="50%">催产方式：${item.ccfs }</td>
						</tr>
						<tr>
							<td width="50%">产后两小时血压1:${item.chlxsxy1 }</td>
							<td width="50%">产后两小时血压2：${item.chlxsxy2 }</td>
						</tr>
						<tr>
							<td width="50%">失血原因:${item.sxyy }</td>
							<td width="50%">乙肝筛查：${item.ygsc }</td>
						</tr>
					</c:forEach>
				</table>
			</div>
			<div class="supervise">
				<table width="100%" class="tab11" border="0" cellspacing="0"
					cellpadding="0">
				</table>
			</div>

			<div class="supervise k_b">
				<table width="100%" class="text_tab" border="0" cellspacing="0"
					border="1" cellspacing="0">
					<c:forEach items="${getFmxx}" var="item">
						<div class="title1"></div>
						<th id="message">婴儿信息</th>
						<tr width="15%">
							<td width="50%">婴儿性别:${item.yexb }</td>
							<td width="50%">婴儿生长：${item.yesc }</td>
						</tr>
						<tr>
							<td width="50%">婴儿体重:${item.yetz }</td>
							<td width="50%">婴儿头围：${item.yetw }</td>
						</tr>
						<tr>
							<td width="50%">婴儿存活情况:${item.chqk }</td>
							<td width="50%">出生有无缺陷:${item.ywcsqx }</td>
						</tr>

					</c:forEach>
				</table>
			</div>
			<div class="supervise">
				<table width="100%" class="tab11" border="0" cellspacing="0"
					cellpadding="0">
				</table>
			</div>


		</div>
	</div>
</body>
</html>
