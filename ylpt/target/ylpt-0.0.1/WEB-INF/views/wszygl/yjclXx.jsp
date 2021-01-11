
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
<script type="text/javascript">
	function chart01(id, moth, values) {
		var myChart = echarts.init(document.getElementById(id));
		var option = {
			xAxis : {
				type : 'category',
				data : moth
			},
			yAxis : {
				type : 'value'
			},
			series : [ {
				data : values,
				type : 'line'
			} ]
		};
		myChart.setOption(option);
	}
	function getData() {
		layui.use([ 'table', 'layer' ], function() {
			var table = layui.table;
			table
					.render({
						elem : '#querytable',
						url : '${ctx}/yjclXx/yjclXx',
						toolbar : '#toolbarDemo',
						method : 'post',
						where : {
							p_yljgdm : '${yljgdm}'
							 
						},
						cols : [ [  {
							field : 'yljgmc',
							title : '机构名称',
							width : '20%'
						}, {
							field : 'rwlx',
							title : '任务类型',
							width : '16%'
						}, {
							field : 'ccsj',
							title : '出车时间',
							width : '15%'
						}, {
							field : 'cph',
							title : '车牌号',
							width : '16%'
						},  {
							field : 'jsyxm',
							title : '驾驶员姓名',
							width : '13%'
						},{
							field : 'szjgmc',
							title : '送达机构',
							width : '16%'
							 } ] ],
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