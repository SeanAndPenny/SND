<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/commons/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
<title>管理单点登录信息界面</title>
<script type="text/javascript" src="<c:url value="/static/commons/js/jquery.min.js"/>"></script>
<script type="text/javascript" src="<c:url value="/static/commons/js/jquery.form.js"/>"></script>
<script type="text/javascript" src="<c:url value="/static/layui/layui.js"/>"></script>

<!-- Csses -->
<link rel="stylesheet" type="text/css" href="<c:url value="/static/layui/css/layui.css"/>" />
</head>

  <body style=" min-height: 200px;min-width: 400px;overflow: hidden; height: auto;" >
   <div style="margin-top: 100px">
  	<form class="layui-form" action="${ctx}/login/savePlatLogin" id="form1">

		  		<div class="layui-form-item">
				  	<div class="layui-inline" >
						<label class="layui-form-label label3">跳转账号</label>
						<div class="layui-input-block input3">
							<input type="text" id="otherlogname" name="otherlogname"  placeholder="跳转系统账号" lay-verify="required" autocomplete="off"class="layui-input .input2">
							<input type="hidden" id="userid" name="userid" value="${userid}" >
						</div>
					</div>
					
			  		<div class="layui-inline">
					    <label class="layui-form-label label3">跳转密码</label>
					    <div class="layui-input-block input3">
					      <input type="password" id='"otherlogpsw"' name="otherlogpsw" lay-verify="required"  placeholder="跳转系统密码" autocomplete="off" class="layui-input .input2">
					    </div>
			  		</div>
		  		</div>
			  <div class="layui-form-item">
				  	<div class="layui-inline" >
						<label class="layui-form-label label3">跳转key</label>
						<div class="layui-input-block input3">
							<input type="text" id="otherplatkey" name="otherplatkey"  value="${otherplatkey}"  readonly="readonly"  ="required" placeholder="跳转系统key" autocomplete="off"class="layui-input .input2">
						</div>
					</div>
			  		<div class="layui-inline">
					    <label class="layui-form-label label3">跳转用户名</label>
					    <div class="layui-input-block input3" >
					      <input type="text" id='"otherlogxm"' name="otherlogxm" lay-verify="required"   placeholder="跳转系统用户名" autocomplete="off" class="layui-input .input2">
					    </div>
			  		</div>
			  </div>
		  <div class="layui-form-item">
		   		<div class="layui-inline">
				    <label class="layui-form-label label3">跳转名称</label>
				    <div class="layui-input-block input3">
				      <input type="text" id='"otherplatname"' name="otherplatname" lay-verify="required"   placeholder="跳转系统名称" autocomplete="off" class="layui-input .input2">
				    </div>
		  		</div>
			  	<div class="layui-inline" >
					<label class="layui-form-label label3">跳转连接</label>
					<div class="layui-input-block input3">
						<input type="text" id="url" name="url"  placeholder="跳转连接" lay-verify="required" autocomplete="off"class="layui-input .input2">
					</div>
				</div>
		  		
		  </div>
		  <div class="layui-form-item">
		  		<div class="layui-inline">
				    <label class="layui-form-label label3">跳转的参数名(用户名)</label>
				    <div class="layui-input-block input3">
				      <input type="text" id='"loginname"' name="loginname"  placeholder="跳转参数名如：loginname" lay-verify="required" autocomplete="off" class="layui-input .input2">
				    </div>
		  		</div>
			  	<div class="layui-inline" >
					<label class="layui-form-label label3">跳转参数名(密码)</label>
					<div class="layui-input-block input3">
						<input type="text" id="password" name="password"  placeholder="跳转参数名如：psw或者 password" autocomplete="off"class="layui-input .input2">
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
	function close(){
		var index = parent.layer.getFrameIndex(window.name); //先得到当前iframe层的索引
		parent.layer.close(index); //再执行关闭
	}
	function save(){   
		$.ajax({
	        type:"post",
	        url:"${ctx}/login/savePlatLogin.json",
	        dataType:'json',
	        data:$('#form1').serialize(),
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
				save();
				return false; //阻止表单跳转。如果需要表单跳转，去掉这段即可。	 
			});

		});
	</script>
</body>
</html>