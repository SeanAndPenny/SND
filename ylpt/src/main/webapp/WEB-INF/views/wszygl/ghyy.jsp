<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/commons/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
<title>Flat Admin V.2 - Free Bootstrap Admin Templates</title>
<%@ include file="/commons/meta.jsp"%>
<script type="text/javascript">
function open_win1() 
{
window.open("http://58.210.13.182:9090/OnLine/")
}
function open_win2() 
{
window.open("http://www.jssz12320.cn:8080/hrs/step01")
}
</script>
</head>
<body class="welcome">
	<table width="100%" border="0" cellspacing="0" cellpadding="0">
		<tbody>
			<tr>
				<td style="vertical-align:bottom; ">
					<div style="border: 1px solid #77D1D9; width: 660px; height: 80px; line-height: 80px; background-color: #77D1D9; ">
						<span style="font-family: '黑体 Bold', '黑体'; font-weight: 700; font-size: 38px; color: #fff; padding-left: 5px; cursor:pointer;" >&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a onclick="open_win1();">相城区第三人民医院挂号服务</a></span>
					</div>
				</td>
				<td rowspan="3"><img src="${ctx}/static/commons/images/welcome.png"></td>
			</tr>
			<tr height="50"></tr>
			<tr>
				<td style="vertical-align:top; ">
					<div style="border: 1px solid #77D1D9; width: 660px; height: 80px; line-height: 80px; background-color: #77D1D9;">
						<span style="font-family: '黑体 Bold', '黑体'; font-weight: 700; font-size: 38px; color: #fff; padding-left: 5px; cursor:pointer;" >&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a onclick="open_win2();">相城区第一人民医院挂号服务</a></span>
					</div>
				</td>
			</tr>
		</tbody>
	</table>
	<%@ include file="/commons/bootstrap-bottom.jsp"%>
</body>
</html>