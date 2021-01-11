
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/commons/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
<title>人事合同</title>
<%@ include file="/commons/meta.jsp"%>
<script type="text/javascript">
	function close() {
		var index = parent.layer.getFrameIndex(window.name); //先得到当前iframe层的索引
		parent.layer.close(index); //再执行关闭
	}

	layui.use([ 'layer' ], function() {
		layer = layui.layer;
		if ("${errorMsg}" != '') {
			layer.msg("${errorMsg}");
			setTimeout("close()", 100);
		}

	});
</script>
<style type="text/css">
.attribute-changes {
	opacity: 0.6;
}
</style>
<style type="text/css">
.layui-table-tool-self {
	position: absolute;
	right: 348px;
	top: 10px
}

.btn {
	margin-top: -35px;
	margin-bottom: 5px;
	border-radius: 1px;
	border-width: 1px;
	font-family: 'Roboto Condensed', sans-serif;
	margin-right: -70px;
}
#dc_excel{
margin-top: -35px;
	margin-bottom: 5px;
	border-radius: 1px;
	border-width: 1px;
	font-family: 'Roboto Condensed', sans-serif;
	margin-right: -271px;
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
			table.render({
						elem : '#querytable',
						url : '${ctx}/htgl/htgl',
						toolbar : '#toolbarDemo',
						method : 'post',
						where : {
							p_idcardtype : $("#idcardtype").val(),
							p_xm : $("#xm").val(),
							p_yljgdm : $("#yljgdm").val()
						},
						cols : [ [ {
							field : 'yljgmc',
							title : '单位名称',
							width : '300'
						}, {
							field : 'xm',
							title : '经办人姓名',
							width : '300'
						},
						/* {field: 'zjhm', title: '身份证号', width: '180'}, */
						{
							field : 'sjhm',
							title : '经办人手机号',
							width : '300'
						}, {
							field : 'dqrq',
							title : '合同到期时间',
							width : '300'
						}

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
		<table style="width: 100%">
			<tr>

				<td style="width: 33.3%">
					<div class="layui-form-item" style="margin-top: 20px;">
						<label class="layui-form-label label3">批次开始时间</label>
						<div class="layui-input-inline input3">
							<input type="text" id="startdate" name="startdate"
								autocomplete="off" class="layui-input .input2">
						</div>
					</div>
				</td>
				<td style="width: 33.3%">
					<div class="layui-form-item" style="margin-top: 20px;">
						<label class="layui-form-label label3">批次结束时间</label>
						<div class="layui-input-inline input3">
							<input type="text" id="enddate" name="enddate" autocomplete="off"
								class="layui-input .input2">
						</div>
					</div>
				</td>
				<td style="width: 33.3%">
					<div class="layui-form-item" style="margin-top: 20px;">
						<label class="layui-form-label label3">经办人姓名</label>
						<div class="layui-input-inline input3">
							<input type="text" id="xm" name="xm" autocomplete="off"
								class="layui-input .input2">
						</div>
					</div>
				</td>
				<!-- <td style="width: 33.3%">
					<div class="layui-form-item" style="margin-top: 20px;">
						<label class="layui-form-label label3">身份证号码</label>
						<div class="layui-input-inline input3">
							<input type="text" id="zjhm" name="zjhm" autocomplete="off"
								class="layui-input .input2">
						</div>
					</div>
				</td> -->
			</tr>

			<tr>
				<td style="width: 20%">
					<div class="layui-form-item" style="margin-top: 20px;">
						<label class="layui-form-label label3">机构名称</label>
						<div class="layui-input-inline input3">
							<select id="yljgdm" name="yljgdm" lay-search>
								<option value="">医疗机构</option>
								<c:forEach items="${jgList}" var="jg">
									<option value="${jg.jgdm}">${jg.jgmc}</option>
								</c:forEach>
							</select>
						</div>
					</div>

				</td>

				<td style="width: 20%">
					<div class="layui-form-item">
						<div class="layui-input-block">

							<button class="layui-btn" onclick="search();">查询</button>
						</div>

					</div>
				</td>
				<td style="width: 20%">

					<form id="QueryForm" action="${ctx}/htgl/importData" method="post"
						enctype="multipart/form-data" onsubmit="return check();">
						<div class="row">
							<div class="col-sm-6" style="width: 50%;">
								<div class="box box-primary">
									<div class="box-header with-border">
										<h4 class="box-title">请选择上传的文件:</h4>
										<div class="box-body">
											<input id="excel_file" class="form-control" type="file"
												name="filename" accept="xlsx" size="80" />
										</div>
										<div>
											<input class="btn btn-primary pull-right" id="excel_button"
												type="submit" value="导入" />
										</div>
									</div>
								</div>
					</form>

					<form id="QueryForm" action="${ctx}/htgl/export" method="post"
						enctype="multipart/form-data" onsubmit="return check();">
						<div style="width: 50%;">
							<input class="btn btn-primary pull-right" id="dc_excel"
								type="submit" value="模板下载" />
						</div>
					</form>
				<td>
			</tr>
		</table>

	</div>
	<div style="width: 100%; background: #FFFFFF; margin: 25px auto;">
		<table id="querytable" class="layui-table" lay-filter="querytable"
			style="margin: -10px;"></table>
		<div id="laypage"></div>
	</div>

</body>


</html>