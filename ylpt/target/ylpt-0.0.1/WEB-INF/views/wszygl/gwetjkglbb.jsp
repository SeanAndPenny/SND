<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/commons/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
<title>城乡居民健康档案管理统计报表</title>
<%@ include file="/commons/meta.jsp"%>
<script type="text/javascript" src="<c:url value="/static/commons/js/echarts/echarts.js"/>"></script>
<script type="text/javascript">

//导出 到excel
function toExcel() {
	 if ($("#yljgdm").val() == '' || $("#yljgdm").val() == null) { 
			location.href = "${ctx}/gwetjkglbb/toExcel?enddate="
					+ $("#enddate").val() + "&yljgdm=" + '${yljgdm}';
		} else {
			location.href = "${ctx}/gwetjkglbb/toExcel?enddate="
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
						url : '${ctx}/gwetjkglbb/gwetjkglbb',
						method : 'post',
						where : {
							p_yljgdm : yljgdm,
							p_enddate : enddate
						},

						cols : [ [ 
							{ field : 'yljgmc', title : '管辖机构', width : '300' }, 
							{ field : 'rs1', title : '辖区内活产数', width : '150' },
							{ field : 'rs2', title : '辖区内按照规范要求接受1次及以上访视的新生儿人数', width : '400' },
							{ field : 'bl1', title : '新生儿访视率', width : '200' },
							{ field : 'rs3', title : '辖区内0-6岁儿童数', width : '200' } 

						] ],
						height : '400',
						width : 'auto',
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
<body style="background: #F9F9F9;overflow:scroll;" >
	<div id="queryform" class="layui-form" style="background: #FFFFFF" >
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
					<div class="layui-form-item"  style="margin-left: -158px;  margin-top: 10px">

						<div class="layui-input-block">
							<button class="layui-btn" onclick="toExcel();">导出</button>
						</div>
					</div>
				</td>
				 

			</tr>
		</table>
	</div>
	 
	<div style="width:100%;background: #FFFFFF;margin:35px auto;">
		 <table id="querytable" class="layui-table" lay-filter="querytab" style="margin:-10px;"></table>
			<div id="laypage"></div>
	</div>
	
</body>
 

</html>