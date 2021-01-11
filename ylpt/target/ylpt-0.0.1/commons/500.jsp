<%@ page contentType="text/html;charset=UTF-8" isErrorPage="true"%>
<%@ include file="/commons/taglib.jsp"%>
<%@ page import="org.slf4j.Logger,org.slf4j.LoggerFactory"%>

<%
	Throwable ex = null;
	if (exception != null)
		ex = exception;
	if (request.getAttribute("javax.servlet.error.exception") != null)
		ex = (Throwable) request.getAttribute("javax.servlet.error.exception");
	//记录日志
	Logger logger = LoggerFactory.getLogger("500.jsp");
	logger.error(ex.getMessage(), ex);
%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/commons/meta.jsp"%>
<title>500 - <spring:message code="message500" /></title>
<script>
	function showDetail(num) {
		var tempButton = "#button" + num;
		$(tempButton).css("display", "");
		if (num == 1) {
			$("#button1").css("display", "");
			$("#button2").css("display", "none");
			$("#detailerror").css("display", "none");
		} else {
			$("#button1").css("display", "none");
			$("#button2").css("display", "");
			$("#detailerror").css("display", "");
		}

	}
	$(document).ready(function() {
		if (window.opener == null || typeof (window.opener) == "undefined") {
			$("#closebtn").css("display", "none");
			$("#backbtn").css("display", "block");
		}
	});
</script>
</head>
<body>
	<h1>
		<spring:message code="message500" />
	</h1>
	<table>
		<tr>
			<td align="center">
				<a href="#" onclick="showDetail(2);" id="button1"><font size="big" color="red"><spring:message code="button.showerrordetail" /></font></a>
				<a href="#" onclick="showDetail(1);" id="button2" style="display: none;"><font size="big" color="red"><spring:message code="button.hideerrordetail" /></font></a>
			</td>
		</tr>
		<tr style="display: none;" id="detailerror">
			<td align="center"><%=ex.getMessage()%></td>
		</tr>
	</table>
	<div>
		<ul>
			<li id="closebtn"><a href="javascript:window.close();"><spring:message code="button.close" /></a></li>
			<li id="backbtn" style="display: none;"><a href="javascript:window.history.back();"><spring:message code="button.back" /></a></li>
		</ul>
	</div>
</body>
</html>