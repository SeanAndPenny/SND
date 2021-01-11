
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/commons/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
<title>人事合同</title>
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
						url : '${ctx}/mdeical/check',
						toolbar : '#toolbarDemo',
						method : 'post',
						where : {
							p_idcardtype : $("#idcardtype").val(),
							p_xm : $("#xm").val(),
							p_yljgdm : $("#yljgdm").val()
						},
						cols : [ [ {
							type : 'checkbox'
						}, {
							field : 'unitname',
							title : '姓名',
							width : '10%'
						}, {
							field : 'idcard',
							title : '证件号码',
							width : '16%'
						}, {
							field : 'sectionname',
							title : '科室名称',
							width : '16%'
						}, {
							field : 'yljgmc',
							title : '机构名称',
							width : '16%'
						}, {
							field : 'tabid',
							title : '续签状态',
							width : '16%',
							toolbar : '#zcd'
						}, {
							field : 'tabid',
							title : '操作',
							width : '22%',
							toolbar : '#toolbar'
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
			//工具栏事件
			table.on('toolbar(querytable)', function(obj) {
				var checkStatus = table.checkStatus(obj.config.id);//获取选中行状态
				switch (obj.event) {
				case 'getCheckData':
					var data = checkStatus.data;//获取选中行数据
					for (var i = 0; i < data.length; i++) {
						layer.open({
							type : 2,
							title : false, //不显示标题栏
							closeBtn : true,
							skin : 'demo-class',
							area : [ '1000px', '530px' ],
							shade : 0.8,
							id : 'LAY_layuipro' //设定一个id，防止重复弹出
							,
							moveType : 1 //拖拽模式，0或者1
							,
							content : '${ctx}/mdeical/getXq?s_id2='
									+ data[i].id + '&yljgmc=' + data[i].yljgmc,

							yes : function(index, layero) {
								layer.close(index);
							},
							end : function() {
								getData();
							}

						});
					}

					break;

				}
				;
			});

			//监听工具条
			table.on('tool(querytable)', function(obj) { //注：tool是工具条事件名，test是table原始容器的属性 lay-filter="对应的值"
				var data = obj.data //获得当前行数据
				, layEvent = obj.event; //获得 lay-event 对应的值

				if (data.num == 1) {
					if (layEvent === 'detail') {//查看合同                      
						layer.open({
							type : 2,
							title : false //不显示标题栏
							,
							closeBtn : true,
							skin : 'demo-class',
							area : [ '1000px', '270px' ],
							shade : 0.8,
							id : 'LAY_layuipro' //设定一个id，防止重复弹出
							,
							moveType : 1 //拖拽模式，0或者1
							,
							content : '${ctx}/mdeical/showHt?s_id=' + data.id,
							yes : function(index, layero) {
								layer.close(index);
							}
						});
					}
				}
				if (layEvent === 'edit') {//新增合同
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
						content : '${ctx}/mdeical/newHt?s_id=' + data.id,
						yes : function(index, layero) {
							layer.close(index);
						}
					});
				}
				/* if (layEvent === 'tx') {
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
				    content : '${ctx}/mdeical/showTx?s_id=' + data.id,
				    yes : function(index, layero) {
				      layer.close(index);
				    }
				  });
				} */

				if (layEvent === 'ckxx') {
					layer.open({
						type : 2,
						title : '详细信息' //不显示标题栏
						,
						//closeBtn : true,
						//skin : 'demo-class',
						area : [ '800px', '480px' ],
						shade : 0.8,
						id : 'LAY_layuipro' //设定一个id，防止重复弹出
						,
						moveType : 1 //拖拽模式，0或者1
						,
						scrollbar : true,
						content : '${ctx}/mdeical/ckxx?idcard=' + data.idcard,
						yes : function(index, layero) {

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
	//导出合同人员的基本信息到excel
	function toExcel() {

		location.href = "${ctx}/mdeical/toExcel?xm=" + $("#xm").val()
				+ "&idcardtype=" + $("#idcardtype").val() + "&yljgdm="
				+ $("#yljgdm").val();
	}
</script>
</head>
<body style="background: #F9F9F9; overflow: scroll; overflow-y: hidden">
	<div id="queryform" class="layui-form" style="background: #FFFFFF;">
		<table style="width: 100%">
			<tr>
				<td>
					<div class="layui-form-item" style="margin-top: 20px;">
						<div class="layui-inline">
							<label class="layui-form-label label5">姓名</label>
							<div class="layui-input-inline input3">
								<input type="text" id="xm" name="xm" autocomplete="off"
									class="layui-input .input2">
							</div>
						</div>
						<div class="layui-inline">
							<label class="layui-form-label label5">身份证号</label>
							<div class="layui-input-inline input3">
								<input type="text" id=idcardtype name="idcardtype"
									autocomplete="off" class="layui-input .input2">
							</div>
						</div>
						<div class="layui-inline">
							<label class="layui-form-label label5">机构名称</label>
							<div class="layui-input-inline input3">
								<select id="yljgdm" name="yljgdm" lay-search>
									<option value="">医疗机构</option>
									<c:forEach items="${jgList}" var="jg">
										<option value="${jg.jgdm}">${jg.jgmc}</option>
									</c:forEach>
								</select>
							</div>
						</div>
						<div class="layui-inline">
							<div class="layui-input-block">
								<button class="layui-btn" onclick="search();">查询</button>
							</div>
							 
						</div>
						<div class="layui-inline">
							 
							<div >
								<button class="layui-btn" onclick="toExcel();">导出人员信息</button>
							</div>
						</div>
						

					</div>
				</td>
				 
			</tr>
		</table>

	</div>
	<div style="width: 100%; background: #FFFFFF; margin: 25px auto;">
		<table id="querytable" class="layui-table" lay-filter="querytable"
			style="margin: -10px;"></table>
		<div id="laypage"></div>
	</div>

</body>
<script type="text/html" id="toolbar">
   {{#  if(d.num=='0'){ }}
    <a class="attribute-changes" lay-event="detail" id="zcd" >合同明细</a>
   <a class="layui-btn layui-btn-xs" lay-event="edit">新增合同</a>
  <!--<a class="attribute-changes" lay-event="detail" id="zcd" >查看提醒</a>-->
{{# }if(d.num=='1' ) { }}
    <a class="layui-btn layui-btn-primary layui-btn-xs" lay-event="detail" id="zcd" >合同明细</a>
   <a class="layui-btn layui-btn-xs" lay-event="edit">新增合同</a>
  <!--<a class="layui-btn layui-btn-primary layui-btn-xs" lay-event="tx">查看提醒</a>-->   
{{#  } }}
<a class="layui-btn layui-btn-primary layui-btn-xs" lay-event="ckxx">查看详细</a>
</script>

<script type="text/html" id="toolbarDemo">
  <div class="layui-btn-container">
    <button class="layui-btn layui-btn-sm" lay-event="getCheckData">续签操作</button>
 </div>
</script>

<script type="text/html" id="zcd">
 
  {{#  if(d.xqzt=='1'){ }}
   <a class="layui-btn layui-btn-danger layui-btn-xs"  >未续签</a>
   
{{# }if(d.xqzt=='3' ) { }}
    <a class="layui-btn layui-btn-xs"  >已续签</a>
  
    
{{#  } }}

</script>

</html>