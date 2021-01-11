<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/commons/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
<title>分页查询页面</title>
<%@ include file="/commons/meta.jsp"%>

<script type="text/javascript">
	var tableIns;
	var lastparam;

	function reloadtable(queryparam) {
		if (queryparam != null) {
			lastparam = queryparam
		}
		tableIns.reload({
			where : lastparam,
			page : {
				curr : 1
			}
		});
	}
	function gotoaddpage(){
		window.location.href = '${ctx}/demo/load/add/';
	}
	
	$(document).ready(
			function() {
				//数据表格控件
				layui.use('table', function() {
					var table = layui.table;
					tableIns = table.render({
						elem : '#querytable',
						url : '${ctx}/demo/query.json',
						method : 'post',
						page : true,
						cols : [ [ {
							type : 'numbers',
							title : '序号',
							width :45
						}, {
							field : 'id',
							id : 'id',
							title : '主键',
							sort : true,
							width : 290
						}, {
							field : 'demoname',
							id : 'demoname',
							title : '名称',
							sort : true,
							width : 285
						}, {
							field : 'demoDateStr',
							id : 'xxg',
							title : '日期',
							sort : true,
							width : 285
						}, {
							field : 'hh',
							title : '操作',
							toolbar : '#toolbar',
							width : 285,
							fixed: 'right'
						} ] ],
						even : true,
						page : {
							layout : [ 'count', 'pre', 'page', 'next', 'skip',
									'limit' ],
							groups : 5,
							first : '首页',
							last : '尾页',
							limit : 5,
							limits : [ 5, 10, 20 ]
						}
					});

					table.on('tool(querytab)', function(obj) {
						var data = obj.data;
						if (obj.event === 'detail') {
							layer.msg('查看操作：<br>' + JSON.stringify(data))
							window.location.href = '${ctx}/demo/load/detail/'
									+ data.id;
						} else if (obj.event === 'del') {
							layer.msg('删除操作：<br>' + JSON.stringify(data))
							layer.confirm('真的删除行么', function(index) {
								var loadcomponent = layer.load();
								var deleteurl = '${ctx}/demo/delete/' + data.id
										+ ".json";
								$.ajax({
									url : deleteurl,
									method : "POST",
									success : function(data) {

										if (data.code == 0) {
											if ($("#id").val() == "") {
												$("#id").val(data.pk);
											}
											layer.alert('保存成功', {
												icon : 1
											});
											obj.del();
											reloadtable();
										} else {
											layer.msg('保存失败<br>' + data.msg, {
												icon : 2
											});
										}
										layer.close(loadcomponent);
									},
									error : function(e) {
										layer.msg('保存出错<br>' + e.message, {
											icon : 7
										});
										layer.close(loadcomponent);
									}
								});
								layer.close(index);
							});
						} else if (obj.event === 'edit') {
							layer.msg('编辑行：<br>' + JSON.stringify(data))
							window.location.href = '${ctx}/demo/load/edit/'
									+ data.id;
						}
					});
				});

				//自定义格式yyyy年 M月 d日 H时 m分 s秒
				layui.use('laydate', function() {
					var laydate = layui.laydate;
					laydate.render({
						elem : '#date',
						format : 'yyyy-MM-dd'
					});
				});

				//表单控件
				layui.use('form', function() {
					var form = layui.form;
					form.on('submit(formsubmit)', function(data) {
						var queryparam = data.field;
						//拦截表单提交，以layui.table的reload代替。
						reloadtable(queryparam);
						return false;
					});
				});
			});
</script>
</head>
<body>
	<form id="queryform" class="layui-form" action="#">
		<table style="width: 100%">
			<tr>
				<td style="width: 33.3%">
					<div class="layui-form-item">
						<label class="layui-form-label label2">输入框<br />(DEMONAME查询条件)
						</label>
						<div class="layui-input-block block">
							<input type="text" name="p_demoname" required
								lay-verify="required" placeholder="请输入标题" autocomplete="off"
								class="layui-input input2">
						</div>
					</div>
				</td>
				<td style="width: 33.3%">
					<div class="layui-form-item">
						<label class="layui-form-label label3">密码框</label>
						<div class="layui-input-inline input3">
							<input type="password" name="password" required
								lay-verify="required" placeholder="请输入密码" autocomplete="off"
								class="layui-input .input2">
						</div>
						<div class="layui-form-mid layui-word-aux">辅助文字</div>
					</div>
				</td>
				<td style="width: 33.3%">
					<div class="layui-form-item">
						<label class="layui-form-label label3">选择框</label>
						<div class="layui-input-block input4">
							<select name="city" lay-verify="required">
								<option value=""></option>
								<option value="0">北京</option>
								<option value="1">上海</option>
								<option value="2">广州</option>
								<option value="3">深圳</option>
								<option value="4">杭州</option>
							</select>
						</div>
					</div>
				</td>
			</tr>
			<tr>
				<td>
					<div class="layui-form-item">
						<label class="layui-form-label label2">复选框</label>
						<div class="layui-input-block">
							<input type="checkbox" name="like[write]" title="写作"> <input
								type="checkbox" name="like[read]" title="阅读" checked> <input
								type="checkbox" name="like[dai]" title="发呆">
						</div>
					</div>
				</td>
				<td>
					<div class="layui-form-item">
						<label class="layui-form-label label3">开关</label>
						<div class="layui-input-block">
							<input type="checkbox" name="close" lay-skin="switch"
								lay-text="ON|OFF">
						</div>
					</div>
				</td>
				<td>
					<div class="layui-form-item">
						<label class="layui-form-label label3">单选框</label>
						<div class="layui-input-block">
							<input type="radio" name="sex" value="男" title="男"> <input
								type="radio" name="sex" value="女" title="女" checked>
						</div>
					</div>
				</td>
			</tr>
			<tr>
				<td>
					<div class="layui-form-item layui-form-text">
						<label class="layui-form-label label2">文本域</label>
						<div class="layui-input-block">
							<textarea name="desc" placeholder="请输入内容"
								class="layui-textarea textarea2"></textarea>
						</div>
					</div>
				</td>
				<td>
					<div class="layui-form-item layui-inline">
						<label class="layui-form-label label3">日期</label>
						<div class="layui-input-inline">
							<input type="text" class="layui-input" id="date" readonly="readonly"
								placeholder="yyyy-MM-dd">
						</div>
					</div>
				</td>
				<td>
					<div class="layui-form-item">
						<div class="layui-input-block">
							<button class="layui-btn" lay-submit lay-filter="formsubmit">查询</button>
							<button type="button" class="layui-btn layui-btn-primary" onclick="gotoaddpage()">新增</button>
							<button type="reset" class="layui-btn layui-btn-primary">重置</button>
						</div>
					</div>
				</td>
			</tr>
		</table>
	</form>
	<div style="width:96%;margin:0 auto;">
		<table id="querytable" class="layui-table" lay-filter="querytab"></table>
	</div>
</body>
<script type="text/html" id="toolbar">
  <a class="layui-btn layui-btn-primary layui-btn-xs" lay-event="detail">查看</a>
  <a class="layui-btn layui-btn-xs" lay-event="edit">编辑</a>
  <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
</script>
</html>