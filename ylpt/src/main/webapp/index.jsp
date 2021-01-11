<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/commons/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
<title>Flat Admin V.2 - Free Bootstrap Admin Templates</title>
<%@ include file="/commons/meta.jsp"%>
</head>
<body class="flat-blue">
	<div class="app-container">
		<div class="row content-container">
			<nav class="navbar navbar-default navbar-fixed-top navbar-top">
				<div class="container-fluid">
					<div class="navbar-header">
						<button type="button" class="navbar-expand-toggle">
							<i class="fa fa-bars icon"></i>
						</button>
						<ol class="breadcrumb navbar-breadcrumb">
							<li class="active">Dashboard</li>
						</ol>
						<button type="button"
							class="navbar-right-expand-toggle pull-right visible-xs">
							<i class="fa fa-th icon"></i>
						</button>
					</div>
					<ul class="nav navbar-nav navbar-right">
						<button type="button"
							class="navbar-right-expand-toggle pull-right visible-xs">
							<i class="fa fa-times icon"></i>
						</button>
						<li class="dropdown"><a href="#" class="dropdown-toggle"
							data-toggle="dropdown" role="button" aria-expanded="false"><i
								class="fa fa-comments-o"></i></a>
							<ul class="dropdown-menu animated fadeInDown">
								<li class="title">Notification <span
									class="badge pull-right">0</span>
								</li>
								<li class="message">No new notification</li>
							</ul></li>
						<li class="dropdown danger"><a href="#"
							class="dropdown-toggle" data-toggle="dropdown" role="button"
							aria-expanded="false"><i class="fa fa-star-half-o"></i> 4</a>
							<ul class="dropdown-menu danger  animated fadeInDown">
								<li class="title">Notification <span
									class="badge pull-right">4</span>
								</li>
								<li>
									<ul class="list-group notifications">
										<a href="#">
											<li class="list-group-item"><span class="badge">1</span>
												<i class="fa fa-exclamation-circle icon"></i> new
												registration</li>
										</a>
										<a href="#">
											<li class="list-group-item"><span class="badge success">1</span>
												<i class="fa fa-check icon"></i> new orders</li>
										</a>
										<a href="#">
											<li class="list-group-item"><span class="badge danger">2</span>
												<i class="fa fa-comments icon"></i> customers messages</li>
										</a>
										<a href="#">
											<li class="list-group-item message">view all</li>
										</a>
									</ul>
								</li>
							</ul></li>
						<li class="dropdown profile"><a href="#"
							class="dropdown-toggle" data-toggle="dropdown" role="button"
							aria-expanded="false">Emily Hart <span class="caret"></span></a>
							<ul class="dropdown-menu animated fadeInDown">
								<li class="profile-img"><img
									src="${ctx}/static/commons/images/profile/picjumbo.com_HNCK4153_resize.jpg"
									class="profile-img"></li>
								<li>
									<div class="profile-info">
										<h4 class="username">Emily Hart</h4>
										<p>emily_hart@email.com</p>
										<div class="btn-group margin-bottom-2x" role="group">
											<button type="button" class="btn btn-default">
												<i class="fa fa-user"></i> Profile
											</button>
											<button type="button" class="btn btn-default">
												<i class="fa fa-sign-out"></i> Logout
											</button>
										</div>
									</div>
								</li>
							</ul></li>
					</ul>
				</div>
			</nav>
			<div class="side-menu sidebar-inverse">
				<nav class="navbar navbar-default" role="navigation">
					<div class="side-menu-container">
						<div class="navbar-header">
							<a class="navbar-brand" href="#">
								<div class="icon fa fa-paper-plane"></div>
								<div class="title">菜单</div>
							</a>
							<button type="button"
								class="navbar-expand-toggle pull-right visible-xs">
								<i class="fa fa-times icon"></i>
							</button>
						</div>
						<ul class="nav navbar-nav">
							<li><a target="iframeContent" href="main.jsp"> <span
									class="icon fa fa-tachometer"></span><span class="title">首页</span>
							</a></li>
							<li><a target="iframeContent" href="${ctx}/demo/page/query"> <span
									class="icon fa fa-desktop"></span><span class="title">demo</span>
							</a></li>
							<li><a target="iframeContent" href="123.jsp"> <span class="icon fa fa-desktop"></span><span
									class="title">123</span>
							</a></li>
							<li><a target="iframeContent" href="456.jsp"> <span class="icon fa fa-table"></span><span
									class="title">456</span>
							</a></li>
							<li><a target="iframeContent" href="789.jsp"> <span
									class="icon fa fa-file-text-o"></span><span class="title">789</span>
							</a></li>
						</ul>
					</div>
				</nav>
			</div>
			<!-- Main Content -->
			
			<%-- <%@ include file="main.jsp"%> --%>
			<div class="container-fluid">
                <div class="side-body padding-top">
					<iframe style="width:100%;height:100%;min-height:670px;" scrolling="no"  id="iframeContent" name="iframeContent" frameborder="0" src="main.jsp"></iframe>
				</div>
			</div>
		</div>
		
		<%@ include file="/commons/bootstrap-bottom.jsp"%>
</body>
</html>