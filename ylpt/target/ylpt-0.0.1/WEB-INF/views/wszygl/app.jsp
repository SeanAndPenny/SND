<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/commons/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
<title>公众号</title>
<%@ include file="/commons/meta.jsp"%>
</head>
<body class="welcome">
	<table width="100%" border="0" cellspacing="0" cellpadding="0">
		<tbody>
			<tr>
				<td height="400">
					<div style="border: 1px solid #77D1D9; width: 660px; height: 80px; line-height: 80px; background-color: #77D1D9;">
						<span style="font-family: '黑体 Bold', '黑体'; font-weight: 700; font-size: 38px; color: #fff; padding-left: 5px;">欢迎使用健康档案APP</span>
					</div>
				</td>
				<td><img src="<c:url value="/static/commons/images/app.jpg"/>" style="width: 400px;height: auto"></td>
			</tr>
		</tbody>
	</table>
	<%@ include file="/commons/bootstrap-bottom.jsp"%>
</body>
</html>