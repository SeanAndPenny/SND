<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/commons/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
<title>城乡居民健康档案管理统计报表</title>
<%@ include file="/commons/meta.jsp"%>
<script type="text/javascript"
	src="<c:url value="/static/commons/js/echarts/echarts.js"/>"></script>
<script type="text/javascript"
	src="<c:url value="/static/commons/js/jquery-migrate-1.2.1.min.js"/>"></script>
	
<script type="text/javascript"
	src="<c:url value="/static/commons/js/jquery.jqprint-0.3.js"/>"></script>
<style type="text/css">
	#zcd1{
	font-family:黑体;
	font-size: 25px;
	}
	.zcd2{
	font-family:黑体;
	font-size: 15px;
	}
</style>
<script type="text/javascript">
	//插入常驻居民数
	function insertCzrk() {
		if ($("#yljgdm").val() == '' || $("#yljgdm").val() == null) {
			window.open("${ctx}/gwdazb/insertCzrk?p_yljgdm=" + '${yljgdm}');

		} else {
			window.open("${ctx}/gwdazb/insertCzrk?p_yljgdm="
					+ $("#yljgdm").val());

		}
	}
	//打印
	function dy() {
		 $("#querytable1").jqprint({
			 debug: false,
	          importCSS: true,
	          printContainer: true,
	          operaSupport: false
		 });
		
	}
	//导出 到excel
	function toExcel() {
		if ($("#yljgdm").val() == '' || $("#yljgdm").val() == null) {
			location.href = "${ctx}/gwdazb/toExcel?enddate="
					+ $("#enddate").val() + "&yljgdm=" + '${yljgdm}';
		} else {
			location.href = "${ctx}/gwdazb/toExcel?enddate="
					+ $("#enddate").val() + "&yljgdm=" + $("#yljgdm").val();
		}

	}

	function getData(yljgdm, enddate) {

		layui.use([ 'table', 'layer', 'laydate' ], function() {
			var table = layui.table;
			var laydate = layui.laydate;

			laydate.render({
				elem : '#enddate'
			});
			table
					.render({
						elem : '#querytable',
						url : '${ctx}/gwdazb/gwdazb',
						toolbar: '#toolbarDemo' ,
						method : 'post',
						where : {
							p_yljgdm : yljgdm,
							p_enddate : enddate
						},

						cols : [ [ {
							align : 'center',
							title : '<span id="zcd1">高新区社会事业局健康档案报表</span>',
							colspan : 8,
							align:'center',	
						}
						], [ {
							field : 'yljgmc',
							title : '<span class="zcd2">建档机构</span>',
							align:'center',
							width : '200'
						}, {
							field : 'czrks',
							title : '<span class="zcd2">辖区内常住居民数</span>',
							align:'center',
							width : '180'
						}, {
							field : 'jdrs',
							title : '<span class="zcd2">建档人数</span>',
							width : '150'
						}, {
							field : 'jkdajdl',
							title : '<span class="zcd2">健康档案建档率</span>',
							align:'center',
							width : '150'
						}, {
							field : 'dzjds',
							title : '<span class="zcd2">建立电子健康档案人数</span>',
							align:'center',
							width : '170'
						}, {
							field : 'dzjdl',
							title : '<span class="zcd2">电子健康档案建档率</span>',
							align:'center',
							width : '170'
						}, {
							field : 'dtjds',
							title : '<span class="zcd2">动态记录档案份数</span>',
							align:'center',
							width : '170'
						}, {
							field : 'jkdasyl',
							title : '<span class="zcd2">健康档案使用率</span>',
							align:'center',
							width : '150'
						}

						] ],
						height : '500',
						width : 'auto',
						page : {
							layout : [ 'count', 'pre', 'page', 'next', 'skip',
									'limit' ],
							groups : 5,
							first : '首页',
							last : '尾页',
							limit : 10,
							limits : [ 10 ]
						},
						done : function(res, curr, count) {
							$('.layui-table-col-special').each(function(){
			                    $(this).removeClass("layui-table-col-special")
			                });	 
						}
					});

		});
	}

	$(document).ready(function() {

		var myDate = new Date()
		var month = myDate.getMonth() + 1;
		var year = myDate.getFullYear();
		if (month < 10) {
			month = "0" + month;
		}

		var enddate = myDate.Format('yyyy-MM-dd');

		$("#enddate").val(enddate);

		if ($("#yljgdm").val() == '' || $("#yljgdm").val() == null) {

			getData('${yljgdm}', $("#enddate").val());
		} else {
			getData($("#yljgdm").val(), $("#enddate").val());
		}

	});

	function search() {
		if ($("#yljgdm").val() == '' || $("#yljgdm").val() == null) {
			getData('${yljgdm}', $("#enddate").val());
		} else {
			getData($("#yljgdm").val(), $("#enddate").val());
		}
	}
	Date.prototype.Format = function(fmt) { //author: meizz 

		var o = {
			"M+" : this.getMonth() + 1, //月份 
			"d+" : this.getDate(), //日 
			"h+" : this.getHours(), //小时 
			"m+" : this.getMinutes(), //分 
			"s+" : this.getSeconds(), //秒 
			"q+" : Math.floor((this.getMonth() + 3) / 3),
			"S" : this.getMilliseconds()
		//毫秒 
		};
		if (/(y+)/.test(fmt))
			fmt = fmt.replace(RegExp.$1, (this.getFullYear() + "")
					.substr(4 - RegExp.$1.length));
		for ( var k in o)
			if (new RegExp("(" + k + ")").test(fmt))
				fmt = fmt.replace(RegExp.$1, (RegExp.$1.length == 1) ? (o[k])
						: (("00" + o[k]).substr(("" + o[k]).length)));
		return fmt;

	}
</script>
</head>
<body style="background: #F9F9F9; overflow: scroll;">
	<div id="queryform" class="layui-form" style="background: #FFFFFF">
		<table style="width: 100%">
			<tr>
				<td style="width: 25%">
					<div class="layui-form-item" style="margin-top: 20px;">
						<label class="layui-form-label label3">查询时间</label>
						<div class="layui-input-inline input3">
							<input type="text" id="enddate" name="enddate" autocomplete="off"
								class="layui-input .input2">
						</div>
					</div>
				</td>
				<td style="width: 25%">
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
				<td style="width: 25%">
					<div class="layui-form-item" style="margin-top: 10px">
						<div class="layui-input-block">
							<button class="layui-btn" onclick="search();">查询</button>
						</div>
					</div>
				</td>
				<td style="width: 25%">
					<div class="layui-form-item"
						style="margin-left: -158px; margin-top: 10px">

						<div class="layui-input-block">
							<button class="layui-btn" onclick="toExcel();">导出</button>
						</div>
					</div>
				</td>
				<td style="width: 25%">
					<div class="layui-form-item"
						style="margin-left: -312px; margin-top: 10px">

						<div class="layui-input-block">
							<!-- <button class="layui-btn" onclick="insertCzrk();">插入常住居民数</button> -->
							<!-- <button class="layui-btn" onclick="dy();">打印</button> -->
						</div>
					</div>
				</td>

			</tr>
		</table>
	</div>

	<div id='querytable1'
		style="width: 100%; background: #FFFFFF; margin: 35px auto;">
		<table id="querytable" class="layui-table" lay-filter="querytab"
			style="margin: -10px;"></table>

	</div>

</body>


</html>