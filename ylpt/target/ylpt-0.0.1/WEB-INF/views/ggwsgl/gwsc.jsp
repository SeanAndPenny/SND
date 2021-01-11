<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/commons/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
<title>Flat Admin V.2 - Free Bootstrap Admin Templates</title>
<%@ include file="/commons/meta.jsp"%>
<script type="text/javascript">
function open_win() 
{
window.open("http://172.26.201.164/medWeb/Login_loginIn.action")
}
</script>
</head>
<body class="welcome">
	<table width="100%" border="0" cellspacing="0" cellpadding="0">
		<tbody>
			<tr>
				<td height="400">
					<div style="border: 1px solid #77D1D9; width: 660px; height: 80px; line-height: 80px; background-color: #77D1D9;">
						<span style="font-family: '黑体 Bold', '黑体'; font-weight: 700; font-size: 38px; color: #fff; padding-left: 5px; cursor:pointer;" >&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a onclick="open_win();">高危筛查系统</a></span>
					</div>
				</td>
				<td><img src="${ctx}/static/commons/images/welcome.png"></td>
			</tr>
		</tbody>
	</table>
	<%@ include file="/commons/bootstrap-bottom.jsp"%>
</body>
</html>