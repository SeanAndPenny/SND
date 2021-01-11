
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/commons/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
<title>里层下钻机构列表展示</title>
<%@ include file="/commons/meta.jsp"%>
<style type="text/css">
.attribute-changes {
	opacity: 0.6;
}
</style>
<style>
html, body {
	background: #ededed;
	height: 100%;
	width: 100%;
}
</style>
<style type="text/css">
 
 
/* 表格头部背景色 */
th {
    background-color: #1572D5; /* MediumSeaGreen */
    color: #fff;
    font-weight: bold

</style>
<script type="text/javascript">
 
	function getData() {
		layui.use([ 'table', 'layer' ], function() {
			var table = layui.table;
			table
					.render({
						elem : '#querytable',
						url : '${ctx}/ypcrk/gettables5',
						toolbar : '#toolbarDemo',
						method : 'post',
						where : {
							p_jgdm : '${jgdm}',
							p_ypbm :'${ypbm}',
							p_kssj:'${kssj}',
							p_jssj:'${jssj}',
						},
						          
						cols : [ [  {
							field : 'rkl',
							title : '入库量',
							width : '20%'
						}, {
							field : 'ckl',
							title : '出库量',
							width : '26%'
						}, {
							field : 'ypbm',
							title : '药品编码',
							width : '26%'
						},  {
							field : 'ypmc',
							title : '药品名称',
							width : '26%'
							
						}  ] ],
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

	function search() {
		getData();
	}
	 
	 
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