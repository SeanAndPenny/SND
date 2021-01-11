<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/commons/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
<title>${ptname}</title>
<%@ include file="/commons/meta.jsp"%>
<script type="text/javascript">
function changtittle(resname){
	$("#ptittle").html(resname);
	$("li").removeClass("active");
	$("#"+resname).addClass("active")
}
function tittle(){
	$("#ptittle").html("首页");
	$("li").removeClass("active");
	$("#ptittleli").addClass("active")
}
	$(document).ready(function(){
	
	});
</script>
</head>
<body class="flat-blue" style="overflow:scroll;overflow-y:hidden">
	<div class="app-container">
		<div class="row content-container">
		
			<nav class="navbar navbar-default navbar-fixed-top navbar-top">
				<div class="container-fluid">
				
					<div class="navbar-header">
						<button type="button" class="navbar-expand-toggle">
							<i class="fa fa-bars icon"></i>
						</button>
						<ol class="breadcrumb navbar-breadcrumb">
							<li class="active" id="ptittle">首页</li>
						</ol>
						<button type="button"
							class="navbar-right-expand-toggle pull-right visible-xs">
							<i class="fa fa-th icon"></i>
						</button>
					</div>
					<ul class="nav navbar-nav navbar-right">
						<button type="button" class="navbar-right-expand-toggle pull-right visible-xs">
							<i class="fa fa-times icon"></i>
						</button>
						<li class="dropdown profile"><a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button"
							aria-expanded="false">${sessionScope.loginUser.username }<span class="caret"></span></a>
							<ul class="dropdown-menu animated fadeInDown">
								<li>
									<div class="profile-info">
										<h4 class="username">${sessionScope.loginUser.username }</h4>
										<div class="btn-group margin-bottom-2x" role="group">
											<button type="button" class="btn btn-default">
												<i class="fa fa-sign-out">
													<a href="http://172.26.201.164/sso/logout" >退出</a>
												</i> 
											</button>
										</div>
									</div>
								</li>
							</ul>
						</li>
					</ul>
				</div>
			</nav>
			
			<div class="side-menu sidebar-inverse">
				<nav class="navbar navbar-default" role="navigation">
					<div class="side-menu-container">
						<div class="navbar-header">
							<a class="navbar-brand" href="#">
								<div class="icon fa fa-paper-plane"></div>
								<div class="title"></div>
							</a>
							<button type="button"
								class="navbar-expand-toggle pull-right visible-xs">
								<i class="fa fa-times icon"></i>
							</button>
						</div>
						<ul class="nav navbar-nav" >
				
	
							<c:forEach items="${authList}" var="rs" varStatus="v">
								<c:choose>
								   <c:when test="${rs.childs!=null and fn:length(rs.childs)>0}"> 
								   <li class="panel panel-default dropdown"> 
								        <a data-toggle="collapse" href="#${rs.resid}">
								         <span class="icon fa fa-desktop"></span><span class="title">${rs.resname}</span>
                               			</a> 
		                               	<div id="${rs.resid}" class="panel-collapse collapse">
		                                    <div class="panel-body">
		                                        <ul class="nav navbar-nav">
			                                      <c:forEach items="${rs.childs}" var="cls" varStatus="status">
					                                        <li id='${cls.resname}'><a target="iframeContent" href="${cls.url}" onclick="changtittle('${cls.resname}')">${cls.resname}</a>
					                                         </li>
					                               </c:forEach>

		                                        </ul>
		                                    </div>
		                                </div>
		                            </li>
								   </c:when>
								   <c:otherwise> 
								   <li id='${rs.resname}'><a target="iframeContent" href="${rs.url}" onclick="changtittle('${rs.resname}')"> <span
										class="icon fa fa-tachometer"></span><span class="title">${rs.resname}</span>
									</a></li>
								   </c:otherwise>
								</c:choose>
								
								
								
							</c:forEach>
						</ul>
					</div>
				</nav>
			</div>
			<!-- Main Content -->
			
			<div class="container-fluid">
                <div class="side-body padding-top">
					<iframe style="width:100%;height:100%;min-height:600px;" id="iframeContent" name="iframeContent" frameborder="0" src="${ctx}/login/main?ptname=${ptname}"></iframe>
				</div>
			</div>
		</div>
		
	</div>
		<%@ include file="/commons/bootstrap-bottom.jsp"%>
</body>
</html>