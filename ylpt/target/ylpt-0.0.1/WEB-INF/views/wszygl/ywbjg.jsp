
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/commons/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
<title>业务表结构</title>
<%@ include file="/commons/meta.jsp"%>
<style type="text/css">
.attribute-changes {
	opacity: 0.6;
}
</style>
<script type="text/javascript">
	 
	function getData() {
		layui.use([ 'table', 'layer' ], function() {
			var table = layui.table;
			table
					.render({
						elem : '#querytable',
						 url : '${ctx}/ywbjg/ywbjg',
						toolbar : '#toolbarDemo',
						method : 'post',
						where : {
							 p_ywbm : '${ywbm}',
						},
						cols : [ [ 
				              { field : 'zdm', title : '字段名',align:'center', width : '300' }, 
				              { field : 'zdlx', title : '字段类型',align:'center', width : '300' }, 
				              { field : 'zdcd', title : '字段长度',align:'center', width : '300'},
				              { field : 'zdjs', title : '字段解释',align:'center', width : '400'},
				            ] ],
						height : '500',
						page : {
							layout : [ 'count', 'pre', 'page', 'next', 'skip',
									'limit' ],
							groups : 5,
							first : '首页',
							last : '尾页',
							limit : 10,
							limits : [ 5, 10, 20 ]
						},
						done : function(res, curr, count) {

						}
					});
			 
			//监听工具条
			table.on('tool(querytable)', function(obj) { //注：tool是工具条事件名，test是table原始容器的属性 lay-filter="对应的值"
				var data = obj.data //获得当前行数据
				, layEvent = obj.event; //获得 lay-event 对应的值

			});
		});
	}

	$(document).ready(function() {
		getData();
	}); 
</script>
</head>
<body style="background: #F9F9F9; overflow: scroll; overflow-y: hidden">
	<div id="queryform" class="layui-form" style="background: #FFFFFF;">
		 

	</div>
	<div style="width: 100%; background: #FFFFFF; margin: 25px auto;">
		<table id="querytable" class="layui-table" lay-filter="querytable"
			style="margin: -10px;"></table>
		<div id="laypage"></div>
	</div>

</body>
</html>