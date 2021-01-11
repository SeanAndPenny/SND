<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/commons/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
<title>增加行政区划详细信息</title>
<script type="text/javascript" src="<c:url value="/static/commons/js/jquery.min.js"/>"></script>
<script type="text/javascript" src="<c:url value="/static/commons/js/jquery.form.js"/>"></script>
<script type="text/javascript" src="<c:url value="/static/layui/layui.js"/>"></script>

<!-- Csses -->
<link rel="stylesheet" type="text/css" href="<c:url value="/static/layui/css/layui.css"/>" />

</head>
    <body style=" min-height: 200px;min-width: 400px;height:250px " >
    <div style="margin-top: 50px">
  <form class="layui-form" action="${ctx}/area/saveNewOne">
	  <div class="layui-form-item">
		  	<div class="layui-inline">
			    <label class="layui-form-label">需要在下面增加的</label>
			    <div class="layui-input-block">
			      <input type="text"  value="${oldone.name}" disabled="disabled"  autocomplete="off"  class="layui-input">
			      <input  id='oldcode' name="oldcode" value="${oldone.code}" type="hidden">
			    </div>
	   		</div>
	  		<div class="layui-inline">
			    <label class="layui-form-label">新增名字</label>
			    <div class="layui-input-block">
			      <input type="text" id='name' name="name" lay-verify="required" autocomplete="off" class="layui-input">
			    </div>
	  		</div>
	  </div>
	  <div class="layui-form-item">
		  	<div class="layui-inline">
			    <label class="layui-form-label">新增行政区划编码</label>
			    <div class="layui-input-block">
			      <input  type="text" id='code' name="code"  lay-verify="required"  autocomplete="off"  class="layui-input">					
			    </div>
	   		</div>
	  </div>
	<div class="layui-form-item">
	    <div class="layui-input-block">
	      <button class="layui-btn" lay-submit lay-filter="formDemo" >立即提交</button>
		</div>
  	</div>
  </form>
	<%@ include file="/commons/bootstrap-bottom.jsp" %>
	
	</div>
	<script>
	function close(){
		var index = parent.layer.getFrameIndex(window.name); //先得到当前iframe层的索引
		parent.layer.close(index); //再执行关闭
	}
	function save(code,name,oldcode,oldname){   
		$.ajax({
	        type:"get",
	        url:"${ctx}/area/saveNewOne.json?code="+code+"&name="+name+"&oldcode="+oldcode,
	        dataType:'json',
	        success:function(data){
				if(data.code=='0'){
					layer.msg("保存成功");
					setTimeout("close()",1000);
				}else{
					layer.msg("保存失败："+data.msg);
				}
	        }
	    });
	}
		layui.use('form', function(){
		  var form = layui.form;
		//监听提交
			form.on('submit(formDemo)', function(data) {
// 				if(data.code=='0'){
// 					layer.msg("保存成功");
// 					setTimeout("close()",1000);
// 				}else{
// 					layer.msg("保存失败："+data.msg);
// 				}
				var oldcode=$("#oldcode").val()
				var name=$("#name").val()
				var code=$("#code").val()
				save(code,name,oldcode);
				 return false; //阻止表单跳转。如果需要表单跳转，去掉这段即可。
				 
			});

		});
	</script>
</body>
</html>