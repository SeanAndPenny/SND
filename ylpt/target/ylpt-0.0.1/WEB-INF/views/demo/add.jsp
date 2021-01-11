<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/commons/taglib.jsp" %>
<!DOCTYPE html>
<html>
<head>
<title>新增页面</title>
<%@ include file="/commons/meta.jsp" %>

<script type="text/javascript">
//加载层
var loadcomponent;
$(document).ready(function(){
	//自定义格式yyyy年 M月 d日 H时 m分 s秒
	layui.use('laydate', function() {
		var laydate = layui.laydate;
		$(".dateinput").each(function(){
			laydate.render({
				elem : '#' + $(this).attr("id"),
				format : $(this).attr("placeholder")
			});
		});
	});

	//表单控件
	layui.use('form', function() {
		var form = layui.form;
		form.on('submit(formsubmit)', function(data) {
			var queryparam = data.field;
			//拦截表单提交，以layui.table的reload代替。
			$("#entityform").ajaxSubmit({
				success:function(data){
					if(data.code == 0){
						if($("#id").val() == ""){
							$("#id").val(data.pk);
						}
						layer.alert('保存成功', {icon: 1});
					} else {
						layer.msg('保存失败<br>' + data.msg, {icon: 2});
					}
				},
				error:function(e){
					layer.msg('保存出错<br>' + e.message, {icon: 7});
				}
			});
			return false;
		});
	});
});
</script>
</head>
<body>
	<form id="entityform" class="layui-form" method="post" action="${ctx}/demo/saveOrUpdate.json" style="padding:10px">
		<%@ include file="./load.jsp" %>
		<div class="layui-form-item">
			<div class="layui-input-block ">
				<button class="layui-btn" lay-submit lay-filter="formsubmit">保存</button>
				<button type="reset" class="layui-btn layui-btn-primary">重置</button>
				<button type="button" class="layui-btn layui-btn-primary" onclick="javascript:history.back()">返回</button>
			</div>
		</div>
	</form>
</body>
</html>