<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/commons/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
<title>体检信息</title>
<%@ include file="/commons/meta.jsp"%>
</head>
<body>
	<table class="layui-table" lay-even lay-skin="nob" lay-size="sm" width="500px;">
		<thead>
			<tr>
				<td style="width:25%;text-align: center;white-space:nowrap;">科室名称</td>
				<td style="width:25%;text-align: center;white-space:nowrap;">检查项目名称</td>
				<td style="width:25%;text-align: center;white-space:nowrap;">检查项目结果</td>
				<td style="width:25%;text-align: center;white-space:nowrap;">检查结果是否正常</td>
			</tr>
		</thead>
		<tbody id="content">
			<c:forEach items="${tjxxDetail }" var="map" varStatus="s">
				<tr>
					<td style="width:25%;text-align: center;white-space:nowrap;">${map['ksmc'] }</td>
					<td style="width:25%;text-align: center;white-space:nowrap;">${map['xmmc'] }</td>
					<td style="width:25%;text-align: center;white-space:nowrap;">${map['xmjcjg'] }</td>
					<td style="width:25%;text-align: center;white-space:nowrap;">${map['sfyc'] }</td>
				</tr>
			</c:forEach>
		</tbody>
</body>
</html>