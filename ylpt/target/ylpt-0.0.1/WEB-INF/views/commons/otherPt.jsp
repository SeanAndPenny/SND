<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/commons/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
<title>跳转登录</title>
<script type="text/javascript" src="<c:url value="/static/commons/js/jquery.min.js"/>"></script>
<script type="text/javascript" src="<c:url value="/static/commons/js/jquery.form.js"/>"></script>
<script type="text/javascript" src="<c:url value="/static/layui/layui.js"/>"></script>

<!-- Csses -->
<link rel="stylesheet" type="text/css" href="<c:url value="/static/layui/css/layui.css"/>" />

</head>
    <body style=" min-height: 200px;min-width: 400px;overflow-y: hidden" >
  

	<script>
	
	
	$(document).ready(function(){
		 layui.use(['layer'] , function(){
			var layer = layui.layer
			layer.open({
		        type: 2
		        ,title: false //不显示标题栏
		        ,closeBtn: true
		        ,skin: 'demo-class'
		        ,area: ['800px', '400px']
		        ,shade: 0.8
		        ,id: 'LAY_layuipro' //设定一个id，防止重复弹出
		        ,moveType: 1 //拖拽模式，0或者1
		        ,content:'${ctx}/login/otherLogin?userid=${userid}&otherplatkey=${otherplatkey}'
		        ,yes: function(index, layero){
				   
				}      
	  		});
		 });
	});
	</script>
</body>
</html>