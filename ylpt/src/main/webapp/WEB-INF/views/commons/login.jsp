<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/commons/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>

<title>医务服务平台</title>
<%@ include file="/commons/meta.jsp"%>
	<title>WondersSmartInfo标准管理</title>
	<link rel="stylesheet" type="text/css" href="<c:url value="/static/commons/css/bootstrap.min.css"/>" />
	<link rel="stylesheet" type="text/css" href="<c:url value="/static/commons/css/font-awesome.min.css"/>">
	<link rel="stylesheet" type="text/css" href="<c:url value="/static/commons/css/animate.css"/>">
	<link rel="stylesheet" type="text/css" href="<c:url value="/static/commons/css/login-style.css"/>">
	<script type="text/javascript" src="<c:url value="/static/commons/js/respond.min.js"/>"></script>


</head>
<body class="style-2" >

<div class="container">

	<div class="row">
		<div class="col-md-8">
			<div class="logo-font">
				<h1>WondersSmartInfo <span></span></h1>
			</div>
			<div class="logo-img">
				<img src="<c:url value="/static/commons/images/login_logo.png"/>">
			</div>
		</div>

		<div class="col-md-4"><!-- col-md-push-8-->

			<!-- Start Sign In Form -->
			<form  id='myform' class="fh5co-form animate-box" data-animate-effect="fadeInRight" action="${ctx}/login/check" method="POST">
				<h2>欢迎登录</h2>
				<div class="form-group">
					<i class="fa fa-user"></i>
					<label for="username" class="sr-only">Username</label>
					<input id='loginname' type="text" class="form-control" name="loginname" placeholder="Username" onfocus="$('#notice').html('&nbsp;');" onkeydown="KeyDown()">
				</div>
				<div class="form-group">
					<i class="fa fa-unlock-alt"></i>
					<label for="password" class="sr-only">Password</label>
					<input id='password' type="password" class="form-control" name="password" placeholder="Password" onfocus="$('#notice').html('&nbsp;');" onkeydown="KeyDown()">
				</div>
				<div class="form-group">
					<p id="notice" style="color: red;">&nbsp;</p>
				</div>
				<div class="form-group">
					<input type="button" value="登录" class="btn btn-primary" id="btn" onclick="login()">
				</div>
			</form>


		</div>
	</div>
	<div class="row" style="padding-top: 60px; clear: both;">
		<div class="col-md-12 text-center"><p><small>&copy; All Rights Reserved. <a href="http://www.wondersgroup.com/" target="_blank">万达信息股份有限公司</a></small></p></div>
	</div>
</div>

<!-- jQuery -->
<script type="text/javascript" src="<c:url value="/static/commons/js/jquery.2.0.3.js"/>" ></script>
<script type="text/javascript" src="<c:url value="/static/commons/js/bootstrap.min.js"/>" ></script>
<script type="text/javascript" src="<c:url value="/static/commons/js/jquery.placeholder.min.js"/>"></script>
<script type="text/javascript" src="<c:url value="/static/commons/js/jquery.waypoints.min.js"/>"></script>
<script type="text/javascript" src="<c:url value="/static/commons/js/login-style.js"/>"></script>
<script type="text/javascript">

	$(document).ready(function(){
		if("${errorMsg}"!=''){
			$("#notice").html("${errorMsg}");	
		}
	});
	function KeyDown()
	{
	  if (event.keyCode == 13)
	  {
		  login();
	  }
	}
	
	function login(){
		
		var loginname=$("#loginname").val();
		var password=$("#password").val();
		if(loginname ==''){
			$("#notice").html("请输入用户名");
			return;
		}
		
		if(password ==''){
			$("#notice").html("请输入密码");
			return;
		}
		$("#notice").html("正在登录...");
		 $("#myform").submit();  
// 		window.location.href="${ctx}/login/check?loginname="+loginname+"&password="+password;
	}
</script>
</body>
</html>

