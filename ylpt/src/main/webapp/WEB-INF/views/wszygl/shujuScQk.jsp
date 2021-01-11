<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/commons/taglib.jsp"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
 
<link rel="stylesheet" type="text/css"
	href="<c:url value="/static/layui/css/layui.css"/>" />
<script type="text/javascript"
	src="<c:url value="/static/commons/js/echarts.min.js"/>"></script>
<script type="text/javascript"
	src="<c:url value="/static/commons/js/jquery-1.11.1.min.js"/>"></script>
<script type="text/javascript"
	src="<c:url value="/static/commons/js/laydate/laydate.js"/>"></script>
<script type="text/javascript"
	src="<c:url value="/static/commons/js/forweb-w.js"/>"></script>
<script type="text/javascript"
	src="<c:url value="/static/commons/js/perfect-scrollbar/js/perfect-scrollbar.jquery.min.js"/>"></script>
<title></title>
<%@ include file="/commons/meta2.jsp"%>
<script type="text/javascript"
	src="<c:url value="/static/commons/js/calendar/WdatePicker.js"/>"></script>
<script type="text/javascript"
	src="<c:url value="/static/commons/js/echarts/echarts-liquidfill.js"/>"></script>
<script type="text/javascript"
	src="<c:url value="/static/layui/layui.js"/>"></script>
</head>
<body>
<div style='margin-top: 37px;'>
	<table style="width: 100%">
		<tr>
			<td style="width: 25%"><label class="layui-form-label label3">结果分类</label>
				<select id="jgfl" name="jgfl" style="width: 127px; height: 34px">
					<option value="">请选择</option>
					<option value="1">合格</option>
					<option value="0">警报</option>

			    </select>
			</td>

			<td style="width: 33%;"><label class="layui-form-label label3">表名</label>
                <input type="text" name="bm" id='bm'
				style="width: 227px; height: 34px" />
			</td>
			<td style="width: 35%"><label class="layui-form-label label3">业务类型</label>
                <select id="ywlx" name="ywlx" style="width: 227px; height: 34px">
					<option value="">业务类型</option>
					<c:forEach items="${ywlist}" var="yw">
						<option value="${yw.ywlx}">${yw.ywlxmc}</option>
					</c:forEach>
			   </select>
			</td>
			<td style="width: 25%">
				<div class="layui-form-item">
					<div class="layui-input-block" style="margin-left: -40px;">
						<button class="layui-btn" onclick="search();">查询</button>
					</div>
				</div>
			</td> 
		</tr>
	</table>
</div>

	<table id="querytable1" class="layui-table">
	</table>
	<!--  <div style="margin-top: -42px; margin-left: 31px;" id="page"></div> -->
</body>
</html>
<script>
	function search() {
		getData();
		/*  getPageList(); */
	}
	$(function() {
		getData();
		/*   getPageList(); */
	})
	/* function getPageList(){
	    layui.use([ 'table', 'laypage' ], function() {
	   var table = layui.table;
	   var laypage = layui.laypage;
	   laypage.render({
	     elem : 'page',
	     count : '${cc }',//总记录数
	     limit : 50,////每页几个
	     curr : '${param.p_curr}',////当前页
	     jump : function(obj, first) {
	       //首次不执行
	       if (!first) {
	         getData(obj.curr)
	       }
	     }
	   })
	 });
	} */
</script>
<script type="text/javascript">
	function getData(crr) {
		$
				.ajax({
					url : "${ctx}/shujuScQk/shujuScQk.json?p_ywlx="
							+ $("#ywlx").val() + "&p_bm=" + $("#bm").val()
							+ "&p_curr=" + crr + "&p_jgfl=" + $("#jgfl").val(),
					type : 'post',
					datatype : "json",
					context : document.body,
					success : function(res) {
						var nodes = eval(res);
						var hh = JSON.stringify(nodes);
						var xx = JSON.parse(hh);
						var fianl = xx.list;
						var fian2 = xx.cc;
						var $tbl = $("#querytable1");
						$tbl.html('');
						$tbl
								.append('<thead>'
										+ '<tr style="background: #7d9dc9;color:#FFFFFF;">'
										+ '<th style="width: 210px;text-decoration: none;text-align:center">业务类型</th>'
										+ '<th style="width: 210px;text-decoration: none;text-align:center">中文表名</th>'
										+ '<th style="width: 210px;text-decoration: none;text-align:center">英文表名</th>'
										+ '<th style="width: 210px;text-decoration: none;text-align:center">最近业务时间</th>'
										+ '<th style="width: 210px;text-decoration: none;text-align:center">最近上传时间</th>'
										+ '<th style="width: 210px;text-decoration: none;text-align:center">结果</th>'
										+ '</tr>' + '</thead>' + '<tbody>');
						for (var i = 0; i < fianl.length; i++) {
							if (fianl[i].jg == '1') {
								$tbl
										.append('<tr>'
												+ '<td style="width: 80px;text-decoration: none;text-align:center">'
												+ fianl[i].ywlx
												+ '</td>'
												+ '<td style="width: 80px;text-decoration: none;text-align:center">'
												+ fianl[i].zwm
												+ '</td>'
												+ '<td style="width: 80px;text-decoration: none;text-align:center">'
												+ fianl[i].ywm
												+ '</td>'
												
												+ '<td style="width: 80px;text-decoration: none;text-align:center">'
												+ fianl[i].ywsj
												+ '</td>'
												
												+ '<td style="width: 80px;text-decoration: none;text-align:center">'
												+ fianl[i].jlgxsj
												+ '</td>'
												+ '<td style="width: 80px;text-decoration: none;text-align:center">'
												+ '<a class="layui-btn layui-btn-xs" lay-event="edit">合格</a>'
												+ '</td>' + '</tr>');
							} else {
								$tbl .append('<tr>'
												+ '<td style="width: 80px;text-decoration: none;text-align:center">'
												+ fianl[i].ywlx
												+ '</td>'
												+ '<td style="width: 80px;text-decoration: none;text-align:center">'
												+ fianl[i].zwm
												+ '</td>'
												+ '<td style="width: 80px;text-decoration: none;text-align:center">'
												+ fianl[i].ywm
												+ '</td>'
												
												+ '<td style="width: 80px;text-decoration: none;text-align:center">'
												+ fianl[i].ywsj
												+ '</td>'
												
												+ '<td style="width: 80px;text-decoration: none;text-align:center">'
												+ fianl[i].jlgxsj
												+ '</td>'
												+ '<td style="width: 80px;text-decoration: none;text-align:center">'
												+ '<a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">警报</a>'
												+ '</td>' + '</tr>');
							}
						}

					}

				});

	}
</script>