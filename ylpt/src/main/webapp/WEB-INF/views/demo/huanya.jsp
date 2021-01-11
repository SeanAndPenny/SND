<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/commons/taglib.jsp" %>
<!DOCTYPE html>
<html>
<head>
<title>环亚接口测试页面</title>
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
		form.render();
	});
});
</script>
</head>
<body>
	<div class="bt">环亚接口测试页面</div>
	<form id="entityform" class="layui-form" method="post" action="${ctx}/jbxx/getHuanyaDocumentInfo.json" style="padding:10px;">
		<div class="layui-form-item layui-inline">
			<label class="layui-form-label label4">开始日期</label>
			<div class="layui-input-inline input3">
				<input type="text" class="layui-input dateinput" required lay-verify="required"
					id="startTime" name="startTime" value="20190101" placeholder="yyyyMMdd"/>
			</div>
		</div>
		<div class="layui-form-item layui-inline">
			<label class="layui-form-label label4">结束日期</label>
			<div class="layui-input-inline input3">
				<input type="text" class="layui-input dateinput" required lay-verify="required"
					id="endTime" name="endTime" value="20190401" placeholder="yyyyMMdd"/>
			</div>
		</div>
		<div class="layui-form-item label4" >
			<div class="layui-input-block input3">
				<button class="layui-btn" lay-submit lay-filter="formsubmit">保存</button>
				<button type="button" class="layui-btn layui-btn-primary" onclick="javascript:history.back()">返回</button>
			</div>
		</div>
	</form>
</body>
</html>