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
    <body style=" min-height: 200px;min-width: 400px;height:250px " hidden="hidden">
    <div style="margin-top: 50px">
  <form class="layui-form" action="${url}" id="form1" method="POST">
	  <div class="layui-form-item">
		  	<div class="layui-form-item" style="margin-top: 20px;">
				<label class="layui-form-label label3">用户名密码</label>
				<div class="layui-input-inline input3">
					<input type="text" id="${loginname}" name="${loginname}"  value="${otherlogname}" autocomplete="off"class="layui-input .input2">
				</div>
			</div>
	  		<div class="layui-inline">
			    <label class="layui-form-label">密码</label>
			    <div class="layui-input-block">
			      <input type="password" id="${password}" name="${password}"  value="${otherlogpsw}"  autocomplete="off" class="layui-input">
			    </div>
	  		</div>
	  </div>
	   
	<div class="layui-form-item">
	    <div class="layui-input-block">
	      <button class="layui-btn" lay-submit lay-filter="formDemo" >立即提交</button>	      
		</div>
  	</div>
  </form>

	</div>
	<script>
	layui.use('layer', function(){
		var layer = layui.layer;
		layer.load(0);
	}); 
	
	function save(){
		
		$("#form1").submit();
	}
		layui.use('form', function(){
		  var form = layui.form;
		//监听提交
			form.on('submit(formDemo)', function(data) {
				save();
				return false; //阻止表单跳转。如果需要表单跳转，去掉这段即可。	 
			});

		});
	$(document).ready(function(){
		save();
	});
	</script>
</body>
</html>