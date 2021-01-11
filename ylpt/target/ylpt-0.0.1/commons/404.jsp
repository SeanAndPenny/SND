<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/commons/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/commons/meta.jsp"%>
<title>404 - <spring:message code="message404" /></title>
</head>
<body>
	<h1>
		<spring:message code="message404" />
	</h1>
	<div id="formPageButton">
		<ul>
			<li><a href="javascript:window.history.go(-1)"
				title="<spring:message code="button.back" />"><spring:message code="button.back" /></a></li>
		</ul>
	</div>
	</div>
</body>
</html>