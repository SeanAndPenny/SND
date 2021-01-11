
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/commons/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
<title></title>
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
						url : '${ctx}/ywxxXz/ywxxXz',
						toolbar : '#toolbarDemo',
						method : 'post',
						where : {
							p_yljgdm : '${jgdm}',
							p_kssj :'${kssj}',
							p_jssj:'${jssj}',
							p_mcdm:'${mcdm}',
							p_ywbz:'TJFX'
						},
						          
						cols : [ [  {
							field : 'xm',
							title : '姓名',
							width : '10%'
						}, {
							field : 'xb',
							title : '性别',
							width : '10%'
						}, {
							field : 'csrq',
							title : '出生日期',
							width : '10%'
						}, {
							field : 'yljgmc',
							title : '体检机构',
							width : '16%'
						}, {
							field : 'tjlb',
							title : '体检列类别',
							width : '10%'
							
						},
						{
							field : 'zjhm',
							title : '证件号码',
							width : '16%'
							
						},{
							field : 'zjjg',
							title : '体检结果',
							width : '16%'
							
						},{
							field : 'zjys',
							title : '体检医生',
							width : '10%'
							
						},{
							field : 'jy',
							title : '建议',
							width : '16%'
							
						},{
							field : 'zjrq',
							title : '体检日期',
							width : '10%'
							
						},
						{
							field : 'tabid',
				              title : '操作',
				              width : '10%',
				              toolbar : '#toolbar'
						}] ],
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

				if (layEvent === 'tx') {
			          layer.open({
			            type : 2,
			            title : false //不显示标题栏
			            ,
			            closeBtn : true,
			            skin : 'demo-class',
			            area : [ '1000px', '530px' ],
			            shade : 0.8,
			            id : 'LAY_layuipro' //设定一个id，防止重复弹出
			            ,
			            moveType : 1 //拖拽模式，0或者1
			            ,
			            content : '${ctx}/ywxxXz/ywxxXz_tjxx?yljgdm=' + data.yljgdm
			                + '&tjbh=' + data.tjbh ,
			            yes : function(index, layero) {
			              location.reload();
			              
			            },
			            end:function(){
			              getData();
			                }
			          });
			        } 
				

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
 <script type="text/html" id="toolbar">
   <a class="layui-btn layui-btn-xs" lay-event="tx">体检详细</a>
</script>



 

</html>