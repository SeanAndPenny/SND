<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/commons/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
<title>管理单点登录信息界面</title>
<script type="text/javascript" src="<c:url value="/static/commons/js/jquery.min.js"/>"></script>
<script type="text/javascript" src="<c:url value="/static/commons/js/jquery.form.js"/>"></script>
<script type="text/javascript" src="<c:url value="/static/layui/layui.js"/>"></script>
<link rel="stylesheet" type="text/css" href="<c:url value="/static/layui/css/layui.css"/>" />
</head>

    <body style=" min-height: 200px;min-width: 400px;height:250px" >
   
	<script>
	
		$(document).ready(function(){
			 layui.use(['layer'], function(){
				layer.open({
			        type: 2
			        ,title: false //不显示标题栏
			        ,closeBtn: true
			        ,skin: 'demo-class'
			        ,area: ['800px', '500px']
			        ,shade: 0.8
			        ,id: 'LAY_layuipro' //设定一个id，防止重复弹出
			        ,moveType: 1 //拖拽模式，0或者1
			        ,content:'${ctx}/login/zj?userid=${userid}&otherplatkey=${otherplatkey}'
				   ,yes: function(index, layero){
					   layer.close(index);
					}      
		  		});
			});
	 });
	
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