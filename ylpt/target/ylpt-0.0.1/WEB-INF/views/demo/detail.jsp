<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/commons/taglib.jsp" %>
<!DOCTYPE html>
<html>
<head>
<title>查看详细页面</title>
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
		form.on('submit(*)', function(data) {
			return false;
		});
	});
});
</script>
</head>
<body>
	<div class="bt">Layui Demo</div>
	<form id="entityform" class="layui-form" method="post" action="${ctx}/demo/saveOrUpdate.json" style="padding:10px;">
		<%@ include file="./load.jsp" %>
		<div class="layui-form-item label4" >
			<div class="layui-input-block input3">
				<button type="button" class="layui-btn layui-btn-primary" onclick="javascript:history.back()">返回</button>
			</div>
		</div>
	</form>
</body>
</html>