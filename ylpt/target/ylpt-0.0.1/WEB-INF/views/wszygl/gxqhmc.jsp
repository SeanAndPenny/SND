<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/commons/taglib.jsp"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<%@ include file="/commons/meta.jsp"%>
<script type="text/javascript"
	src="<c:url value="/static/commons/js/calendar/WdatePicker.js"/>"></script>
<title>高新区公立医疗卫生机构人员名册月报表</title>
<script type="text/javascript">
	 //导出 到excel
	function toExcel() {

	      if($("#enddate").val()===''){
	     	 alert("请选择导出时间") ;
	     	 return;
	       }
    window.location.href  = "${ctx}/gxqhmc/toExcel2?exportToExcel=YES&p_yljgdm=" +$("#yljgdm").val()
	+ "&p_tbrq=" + $("#enddate").val();
   
	} 
	//查询
	function search() {
		 
	      if($("#enddate").val()===''){
	     	 alert("请选择查询时间") ;
	     	 return;
	       }
	      
		location.href = "${ctx}/gxqhmc/gxqhmc?p_yljgdm=" +$("#yljgdm").val()
				+ "&p_tbrq=" + $("#enddate").val();
	}
</script>
<style type="text/css">
.top-buttom {
	width: 100%;
	text-align: center;
}

.table th, .table td {
	text-align: center;
	vertical-align: middle !important;
}

.condition {
	width: 100%;
}

.details-content {
	width: 98%;
	margin: 0 auto;
}

.hzjbxx-table {
	width: 140%;
	 
	text-align: center;
	border: 1px solid #cccccc;
}

th {
	text-align: center; /** 设置水平方向居中 */
	vertical-align: middle /** 设置垂直方向居中 */
}

td {
	text-align: center; /** 设置水平方向居中 */
	vertical-align: middle /** 设置垂直方向居中 */
}
</style>
<script type="text/javascript">
	$(function() {
		var table = document.getElementById("testTable");//获取table对象
		var rows = table.rows;//获取行对象
		var cells = table.cells;//获取列对象
		var colums = table.rows[4].cells.length;//获取列数	
		$(".count").empty();//每次加载时清空最后一列，防止二次加载数据时出现多行合计
		$(".count").append("<td>合计</td>");

		for (var j = 1; j < colums; j++) {
			var sum = 0;

			for (var i = 4; i < rows.length - 1; i++) {//从i=1第二行开始去掉表头，rows.length-1结束，去掉合计行
				var a = parseInt(rows[i].cells[j].innerHTML.trim());//获取每一列的值

				sum = sum + a; //计算

			}
			$(".count").append("<td>" + sum + "</td>");//给最后一行添加计算结果列
		}
	});

	$(function() {
		var table = document.getElementById("testTable2");//获取table对象
		var rows = table.rows;//获取行对象
		var cells = table.cells;//获取列对象
		var colums = table.rows[4].cells.length;//获取列数	
		$(".count2").empty();//每次加载时清空最后一列，防止二次加载数据时出现多行合计
		$(".count2").append("<td>合计</td>");

		for (var j = 1; j < colums; j++) {
			var sum = 0;

			for (var i = 4; i < rows.length - 1; i++) {//从i=1第二行开始去掉表头，rows.length-1结束，去掉合计行
				var a = parseInt(rows[i].cells[j].innerHTML.trim());//获取每一列的值

				sum = sum + a; //计算

			}
			$(".count2").append("<td>" + sum + "</td>");//给最后一行添加计算结果列
		}
	});
	$(function() {
		var table = document.getElementById("testTable3");//获取table对象
		var rows = table.rows;//获取行对象
		var cells = table.cells;//获取列对象
		var colums = table.rows[3].cells.length;//获取列数	
		$(".count3").empty();//每次加载时清空最后一列，防止二次加载数据时出现多行合计
		$(".count3").append("<td>合计</td>");
		for (var j = 1; j < colums; j++) {
			var sum = 0;

			for (var i = 3; i < rows.length - 1; i++) {//从i=1第二行开始去掉表头，rows.length-1结束，去掉合计行
				var a = parseInt(rows[i].cells[j].innerHTML.trim());//获取每一列的值

				sum = sum + a; //计算

			}
			$(".count3").append("<td>" + sum + "</td>");//给最后一行添加计算结果列
		}
	});
</script>
</head>

<body style="background: #F9F9F9; overflow: scroll;">
  
	<div class="details-content" style='margin-top: 30px;'>
		<table style="width: 100%">
			<tr>

				<td style="width: 33.3%">
					<div
						style="position: absolute; margin-top: -24px; margin-left: 110px;">
						<span class="canter">统计时间：</span> <input type="text" id="enddate"
							readonly="readonly" onClick="WdatePicker({dateFmt:'yyyy-MM'})"
							value="${tbrq }" class="Wdate"
							style="width: 150px; height: 32px;" />
					</div>
				</td>
				<%-- <td style="width: 25%">
					<div style="margin-left: 352px;">
						<label>机构名称</label>
						<div>
							<select id="yljgdm" name="yljgdm" lay-search
								style="height: 32px;">
								<option value="">医疗机构</option>
								<c:forEach items="${gxqhmcjgList}" var="jg">
									<option value="${jg.jgdm}">${jg.jgmc}</option>
								</c:forEach>
							</select>
						</div>
					</div>

				</td> --%>
				<td style="width:33.3%">
					<div class="layui-form-item"
						style="position: absolute; margin-top: -24px; margin-left: -60px;">
						<div class="layui-input-block">
							<button class="layui-btn" onclick="search();">查询</button>
						</div>
					</div>
				</td>
				<td style="width: 33.3%">
					<div class="layui-form-item"
						style="position: absolute; margin-left: 77px; margin-top: -24px">

						<div class="layui-input-block">
							  <button class="layui-btn" onclick="toExcel();">导出</button>  
						 
        
						</div>
					</div>
				</td>

			</tr>
		</table>
		<div style="width: 140%;">
		
				<c:forEach var="hmc" items="${gxqhmcList}" end='0'>
					<li class="layui-this"><h4>高新区公立医疗卫生机构人员名册月报表(${hmc.monthmc}底)</h4></li>
				</c:forEach>
			
		</div>
		 
			<div class="layui-tab-content">
				<div class="layui-tab-item layui-show">
					<table id='testTable' style="border-color: #000000"
						class="hzjbxx-table" cellpadding="1" cellspacing="1" border="1">
						<tbody>
							<li>基本表格一、</li>
							<tr>
								<th rowspan="5">单位</th>
								<th colspan="4" bgcolor="#FFFF00" rowspan="3">人员总数统计</th>
								<th colspan="44" bgcolor="#FFBB66">专业统计</th>
								<th rowspan="3" bgcolor="#FFBB66" colspan="5">编外合同制人员用工类型统计</th>
								<th rowspan="2" bgcolor="#FFBB66" colspan="16">全科医生统计</th>
							</tr>
							<tr>
								<th bgcolor="#CCEEFF" colspan="11">编内、编外、临时用工、退休返聘合计统计</th>
								<th bgcolor="#CCEEFF" colspan="11">编内人员人数统计</th>
								<th bgcolor="#CCEEFF" colspan="11">编外人员人数统计</th>
								<th bgcolor="#CCEEFF" colspan="11">临时用工、退休返聘人员</th>
							</tr>
							<tr>
								<th bgcolor="#B94FFF" rowspan="3">合计</th>
								<th bgcolor="#DDDDDD" colspan="6">卫生专业技术人员</th>
								<th colspan="4">非卫生专业技术人员</th>
								<th bgcolor="#33FFDD" rowspan="3">小计</th>
								<th bgcolor="#DDDDDD" colspan="6">卫生专业技术人员</th>
								<th colspan="4">非卫生专业技术人员</th>
								<th bgcolor="#33FFDD" rowspan="3">小计</th>
								<th bgcolor="#DDDDDD" colspan="6">卫生专业技术人员</th>
								<th colspan="4">非卫生专业技术人员</th>
								<th bgcolor="#33FFDD" rowspan="3">小计</th>
								<th bgcolor="#DDDDDD" colspan="6">卫生专业技术人员</th>
								<th colspan="4">非卫生专业技术人员</th>
								<th bgcolor="#CCEEFF" colspan="4">合计统计</th>
								<th bgcolor="#CCEEFF" colspan="4">编内</th>
								<th bgcolor="#CCEEFF" colspan="4">编外</th>
								<th bgcolor="#CCEEFF" colspan="4">临时工退休返聘</th>
							</tr>
							<tr>
								<th bgcolor="#B94FFF" rowspan="2">合计</th>
								<th rowspan="2">编内</th>
								<th rowspan="2">编外合同用工</th>
								<th rowspan="2">临时工、退休返聘</th>
								<th rowspan="2">医</th>
								<th rowspan="2">药</th>
								<th rowspan="2">护</th>
								<th rowspan="2">技</th>
								<th rowspan="2">卫生管理</th>
								<th rowspan="2">其他</th>
								<th rowspan="2">会计专业</th>
								<th rowspan="2">信息专业</th>
								<th rowspan="2">管理专业</th>
								<th rowspan="2">其他</th>
								<th rowspan="2">医</th>
								<th rowspan="2">药</th>
								<th rowspan="2">护</th>
								<th rowspan="2">技</th>
								<th rowspan="2">卫生管理</th>
								<th rowspan="2">其他</th>
								<th rowspan="2">会计专业</th>
								<th rowspan="2">信息专业</th>
								<th rowspan="2">管理专业</th>
								<th rowspan="2">其他</th>
								<th rowspan="2">医</th>
								<th rowspan="2">药</th>
								<th rowspan="2">护</th>
								<th rowspan="2">技</th>
								<th rowspan="2">卫生管理</th>
								<th rowspan="2">其他</th>
								<th rowspan="2">会计专业</th>
								<th rowspan="2">信息专业</th>
								<th rowspan="2">管理专业</th>
								<th rowspan="2">其他</th>
								<th rowspan="2">医</th>
								<th rowspan="2">药</th>
								<th rowspan="2">护</th>
								<th rowspan="2">技</th>
								<th rowspan="2">卫生管理</th>
								<th rowspan="2">其他</th>
								<th rowspan="2">会计专业</th>
								<th rowspan="2">信息专业</th>
								<th rowspan="2">管理专业</th>
								<th rowspan="2">其他</th>
								<th bgcolor="#B94FFF" rowspan="2">合计</th>
								<th rowspan="2">单位合同</th>
								<th rowspan="2">劳务派遣</th>
								<th rowspan="2">人事代理</th>
								<th rowspan="2">其他</th>
								<th bgcolor="#B94FFF" rowspan="2">合计</th>
								<th rowspan="2">5+3</th>
								<th rowspan="2">3+2</th>
								<th rowspan="2">转岗培训</th>
								<th bgcolor="#33FFDD" rowspan="2">小计</th>
								<th rowspan="2">5+3</th>
								<th rowspan="2">3+2</th>
								<th rowspan="2">转岗培训</th>
								<th bgcolor="#33FFDD" rowspan="2">小计</th>
								<th rowspan="2">5+3</th>
								<th rowspan="2">3+2</th>
								<th rowspan="2">转岗培训</th>
								<th bgcolor="#33FFDD" rowspan="2">小计</th>
								<th rowspan="2">5+3</th>
								<th rowspan="2">3+2</th>
								<th rowspan="2">转岗培训</th>
							</tr>
						</tbody>
						<tbody>
							<c:forEach var="gw" items="${gxqhmcList}">
								<tr>
									<td>${gw.yljgmc}</td>
									<td>${gw.ryzs_hj}</td>
									<td>${gw.ryzs_bn}</td>
									<td>${gw.ryzs_bwhtyg}</td>
									<td>${gw.ryzs_lsg}</td>
									<td>${gw.bnbwlsg_hj}</td>
									<td>${gw.wszy_yi}</td>
									<td>${gw.wszy_yao}</td>
									<td>${gw.wszy_hu}</td>
									<td>${gw.wszy_ji}</td>
									<td>${gw.wszy_wsgl}</td>
									<td>${gw.wszy_qt}</td>
									<td>${gw.fwszy_kjzy}</td>
									<td>${gw.fwszy_xxzy}</td>
									<td>${gw.fwszy_glzy}</td>
									<td>${gw.fwszy_qt}</td>
									<td>${gw.bnry_xj}</td>
									<td>${gw.bnry_wszy_yi}</td>
									<td>${gw.bnry_wszy_yao}</td>
									<td>${gw.bnry_wszy_hu}</td>
									<td>${gw.bnry_wszy_ji}</td>
									<td>${gw.bnry_wszy_wsgl}</td>
									<td>${gw.bnry_wszy_qt}</td>
									<td>${gw.bnry_fwszy_kjzy}</td>
									<td>${gw.bnry_fwszy_xxzy}</td>
									<td>${gw.bnry_fwszy_glzy}</td>
									<td>${gw.bnry_fwszy_qt}</td>
									<td>${gw.bwry_xj}</td>
									<td>${gw.bwry_wszy_yi}</td>
									<td>${gw.bwry_wszy_yao}</td>
									<td>${gw.bwry_wszy_hu}</td>
									<td>${gw.bwry_wszy_ji}</td>
									<td>${gw.bwry_wszy_glzy}</td>
									<td>${gw.bwry_wszy_qt}</td>
									<td>${gw.bwry_fwszy_kjzy}</td>
									<td>${gw.bwry_fwszy_xxzy}</td>
									<td>${gw.bwry_fwszy_gkzy}</td>
									<td>${gw.bwry_fwszy_qt}</td>
									<td>${gw.lsg_xj}</td>
									<td>${gw.lsg_wszy_yi}</td>
									<td>${gw.lsg_wszy_yao}</td>
									<td>${gw.lsg_wszy_hu}</td>
									<td>${gw.lsg_wszy_ji}</td>
									<td>${gw.lsg_wszy_wsgl}</td>
									<td>${gw.lsg_wszy_qt}</td>
									<td>${gw.lsg_fwszy_hjzy}</td>
									<td>${gw.lsg_fwszy_xxzy}</td>
									<td>${gw.lsg_fwszy_glzy}</td>
									<td>${gw.lsg_fwszy_qt}</td>
									<td>${gw.bwhtz_hj}</td>
									<td>${gw.bwhtz_dwht}</td>
									<td>${gw.bwhtz_nwpq}</td>
									<td>${gw.bwhtz_rsdl}</td>
									<td>${gw.bwhtz_qt}</td>
									<td>${gw.qkys_hjtj_hj}</td>
									<td>${gw.qkys_hjtj_53}</td>
									<td>${gw.qkys_hjtj_32}</td>
									<td>${gw.qkys_hjtj_zgpx}</td>
									<td>${gw.qkys_bn_xj}</td>
									<td>${gw.qkys_bn_53}</td>
									<td>${gw.qkys_bn_32}</td>
									<td>${gw.qkys_bn_zgpx}</td>
									<td>${gw.qkys_bw_xj}</td>
									<td>${gw.qkys_bw_53}</td>
									<td>${gw.qkys_bw_32}</td>
									<td>${gw.qkys_bw_zgpx}</td>
									<td>${gw.qkys_lsg_xj}</td>
									<td>${gw.qkys_lsg_53}</td>
									<td>${gw.qkys_lsg_32}</td>
									<td>${gw.qkys_lsg_zgpx}</td>
								</tr>
							</c:forEach>
						</tbody>
						<tfoot>
							<tr class="count">
							</tr>
						</tfoot>
					</table>
					<table id='testTable2' style="border-color: #000000"
						class="hzjbxx-table" cellpadding="1" cellspacing="1" border="1">
						<tbody>
							<li>基本表格二、</li>
							<tr>
								<th rowspan="5">单位</th>
								<th bgcolor="#FFBB66" colspan="44">职称统计</th>
								<th bgcolor="#FFBB66" rowspan="2" colspan="29">学历统计</th>
							</tr>
							<tr>
								<th bgcolor="#DDDDDD" colspan="24">卫生专业技术人员职称统计</th>
								<th colspan="20">非卫生专业技术人员职称统计</th>
							</tr>
							<tr>
								<th bgcolor="#CCEEFF" colspan="6">合计统计</th>
								<th bgcolor="#CCEEFF" colspan="6">编内</th>
								<th bgcolor="#CCEEFF" colspan="6">编外</th>
								<th bgcolor="#CCEEFF" colspan="6">临时工、退休返聘</th>
								<th bgcolor="#CCEEFF" colspan="5">合计统计</th>
								<th bgcolor="#CCEEFF" colspan="5">编内</th>
								<th bgcolor="#CCEEFF" colspan="5">编外</th>
								<th bgcolor="#CCEEFF" colspan="5">临时工、退休返聘</th>
								<th bgcolor="#CCEEFF" colspan="7">合计统计</th>
								<th bgcolor="#CCEEFF" colspan="7">编内</th>
								<th bgcolor="#CCEEFF" colspan="7">编外</th>
								<th bgcolor="#CCEEFF" colspan="7">临时用工退休返聘</th>
							</tr>
							<tr>
								<th bgcolor="#B94FFF" rowspan="2">合计</th>
								<th rowspan="2">正高</th>
								<th rowspan="2">副高</th>
								<th rowspan="2">中级</th>
								<th rowspan="2">初级</th>
								<th rowspan="2">无职称</th>
								<th bgcolor="#33FFDD" rowspan="2">小计</th>
								<th rowspan="2">正高</th>
								<th rowspan="2">副高</th>
								<th rowspan="2">中级</th>
								<th rowspan="2">初级</th>
								<th rowspan="2">无职称</th>
								<th bgcolor="#33FFDD" rowspan="2">小计</th>
								<th rowspan="2">正高</th>
								<th rowspan="2">副高</th>
								<th rowspan="2">中级</th>
								<th rowspan="2">初级</th>
								<th rowspan="2">无职称</th>
								<th bgcolor="#33FFDD" rowspan="2">小计</th>
								<th rowspan="2">正高</th>
								<th rowspan="2">副高</th>
								<th rowspan="2">中级</th>
								<th rowspan="2">初级</th>
								<th rowspan="2">无职称</th>
								<th bgcolor="#B94FFF" rowspan="2">合计</th>
								<th rowspan="2">高级</th>
								<th rowspan="2">中级</th>
								<th rowspan="2">初级</th>
								<th rowspan="2">无职称</th>
								<th bgcolor="#33FFDD" rowspan="2">小计</th>
								<th rowspan="2">高级</th>
								<th rowspan="2">中级</th>
								<th rowspan="2">初级</th>
								<th rowspan="2">无职称</th>
								<th bgcolor="#33FFDD" rowspan="2">小计</th>
								<th rowspan="2">高级</th>
								<th rowspan="2">中级</th>
								<th rowspan="2">初级</th>
								<th rowspan="2">无职称</th>
								<th bgcolor="#33FFDD" rowspan="2">小计</th>
								<th rowspan="2">高级</th>
								<th rowspan="2">中级</th>
								<th rowspan="2">初级</th>
								<th rowspan="2">无职称</th>
								<th bgcolor="#B94FFF" rowspan="2">合计</th>
								<th rowspan="2">博士后</th>
								<th rowspan="2">博士</th>
								<th rowspan="2">硕士</th>
								<th rowspan="2">本科</th>
								<th rowspan="2">大专</th>
								<th rowspan="2">大专以下</th>
								<th bgcolor="#33FFDD" rowspan="2">小计</th>
								<th rowspan="2">博士后</th>
								<th rowspan="2">博士</th>
								<th rowspan="2">硕士</th>
								<th rowspan="2">本科</th>
								<th rowspan="2">大专</th>
								<th rowspan="2">大专以下</th>
								<th bgcolor="#33FFDD" rowspan="2">小计</th>
								<th rowspan="2">博士后</th>
								<th rowspan="2">博士</th>
								<th rowspan="2">硕士</th>
								<th rowspan="2">本科</th>
								<th rowspan="2">大专</th>
								<th rowspan="2">大专以下</th>
								<th bgcolor="#33FFDD" rowspan="2">小计</th>
								<th rowspan="2">博士后</th>
								<th rowspan="2">博士</th>
								<th rowspan="2">硕士</th>
								<th rowspan="2">本科</th>
								<th rowspan="2">大专</th>
								<th rowspan="2">大专以下</th>
							</tr>
						</tbody>
						<tbody>
							<c:forEach var="gw" items="${gxqhmcList}">
								<tr>
									<td>${gw.yljgmc}</td>
									<td>${gw.wszy_hjtj_hj}</td>
									<td>${gw.wszy_hjtj_zg}</td>
									<td>${gw.wszy_hjtj_fj}</td>
									<td>${gw.wszy_hjtj_zj}</td>
									<td>${gw.wszy_hjtj_cj}</td>
									<td>${gw.wszy_hjtj_wzc}</td>
									<td>${gw.wszy_bn_xj}</td>
									<td>${gw.wszy_bn_zg}</td>
									<td>${gw.wszy_bn_fg}</td>
									<td>${gw.wszy_bn_zj}</td>
									<td>${gw.wszy_bn_cj}</td>
									<td>${gw.wszy_bn_wzc}</td>
									<td>${gw.wszy_bw_xj}</td>
									<td>${gw.wszy_bw_zg}</td>
									<td>${gw.wszy_bw_fg}</td>
									<td>${gw.wszy_bw_zj}</td>
									<td>${gw.wszy_bw_cj}</td>
									<td>${gw.wszy_bw_wzc}</td>
									<td>${gw.wszy_lsg_xj}</td>
									<td>${gw.wszy_lsg_zg}</td>
									<td>${gw.wszy_lsg_fg}</td>
									<td>${gw.wszy_lsg_zj}</td>
									<td>${gw.wszy_lsg_cj}</td>
									<td>${gw.wszy_lsg_wzc}</td>
									<td>${gw.fwszy_hjtj_hj}</td>
									<td>${gw.fwszy_hjtj_gj}</td>
									<td>${gw.fwszy_hjtj_zj}</td>
									<td>${gw.fwszy_hjtj_cj}</td>
									<td>${gw.fwszy_hjtj_wzc}</td>
									<td>${gw.fwszy_bn_xj}</td>
									<td>${gw.fwszy_bn_gj}</td>
									<td>${gw.fwszy_bn_zj}</td>
									<td>${gw.fwszy_bn_cj}</td>
									<td>${gw.fwszy_bn_wzc}</td>
									<td>${gw.fwszy_bw_xj}</td>
									<td>${gw.fwszy_bw_gj}</td>
									<td>${gw.fwszy_bw_zj}</td>
									<td>${gw.fwszy_bw_cj}</td>
									<td>${gw.fwszy_bw_wzc}</td>
									<td>${gw.fwszy_lsg_xj}</td>
									<td>${gw.fwszy_lsg_gj}</td>
									<td>${gw.fwszy_lsg_zj}</td>
									<td>${gw.fwszy_lsg_cj}</td>
									<td>${gw.fwszy_lsg_wzc}</td>
									<td>${gw.xltj_hjtj_hj}</td>
									<td>${gw.xltj_hjtj_bsh}</td>
									<td>${gw.xltj_hjtj_bs}</td>
									<td>${gw.xltj_hjtj_ss}</td>
									<td>${gw.xltj_hjtj_bk}</td>
									<td>${gw.xltj_hjtj_dz}</td>
									<td>${gw.xltj_hjtj_dzyx}</td>
									<td>${gw.xltj_bn_xj}</td>
									<td>${gw.xltj_bn_bsh}</td>
									<td>${gw.xltj_bn_bs}</td>
									<td>${gw.xltj_bn_ss}</td>
									<td>${gw.xltj_bn_bk}</td>
									<td>${gw.xltj_bn_dz}</td>
									<td>${gw.xltj_bn_dzyx}</td>
									<td>${gw.xltj_bw_xj}</td>
									<td>${gw.xltj_bw_bsh}</td>
									<td>${gw.xltj_bw_bs}</td>
									<td>${gw.xltj_bw_ss}</td>
									<td>${gw.xltj_bw_bk}</td>
									<td>${gw.xltj_bw_dz}</td>
									<td>${gw.xltj_bw_dzyx}</td>
									<td>${gw.xltj_lsg_xj}</td>
									<td>${gw.xltj_lsg_bsh}</td>
									<td>${gw.xltj_lsg_bs}</td>
									<td>${gw.xltj_lsg_ss}</td>
									<td>${gw.xltj_lsg_bk}</td>
									<td>${gw.xltj_lsg_dz}</td>
									<td>${gw.xltj_lsg_dzyx}</td>
								</tr>
							</c:forEach>
						</tbody>
						<tfoot>
							<tr class="count2">
							</tr>
						</tfoot>
					</table>
					<table id='testTable3' style="border-color: #000000"
						class="hzjbxx-table" cellpadding="1" cellspacing="1" border="1">
					
						<tbody>
							<li>基本表格三、</li>
							
						
							<tr>
								<th rowspan="5">单位</th>
								<th bgcolor="#FFBB66" colspan="7">累计减少人员</th>
								<th bgcolor="#CCEEFF" colspan="7">当月减少人员</th>
								<th bgcolor="#FFBB66" colspan="7">累计新增人员</th>
								<th bgcolor="#CCEEFF" colspan="7">当月新增人员</th>
							</tr>
							<tr>
								<th bgcolor="#B94FFF" rowspan="4">合计</th>
								<th colspan="2">编内</th>
								<th colspan="2">编外</th>
								<th colspan="2">临时返聘</th>
								<th bgcolor="#33FFDD" rowspan="4">小计</th>
								<th colspan="2">编内</th>
								<th colspan="2">编外</th>
								<th colspan="2">临时返聘</th>
								<th bgcolor="#B94FFF" rowspan="4">合计</th>
								<th colspan="3">卫生专业</th>
								<th colspan="3">非卫生专业</th>
								<th bgcolor="#33FFDD" rowspan="4">小计</th>
								<th colspan="3">卫生专业</th>
								<th colspan="3">非卫生专业</th>
							</tr>
							<tr>
								<th rowspan="3">离职</th>
								<th rowspan="3">退休</th>
								<th rowspan="3">离职</th>
								<th rowspan="3">退休</th>
								<th rowspan="3">离职</th>
								<th rowspan="3">其他</th>
								<th rowspan="3">离职</th>
								<th rowspan="3">退休</th>
								<th rowspan="3">离职</th>
								<th rowspan="3">退休</th>
								<th rowspan="3">离职</th>
								<th rowspan="3">其他</th>
								<th rowspan="3">编内</th>
								<th rowspan="3">编外</th>
								<th rowspan="3">临时返聘</th>
								<th rowspan="3">编内</th>
								<th rowspan="3">编外</th>
								<th rowspan="3">临时返聘</th>
								<th rowspan="3">编内</th>
								<th rowspan="3">编外</th>
								<th rowspan="3">临时返聘</th>
								<th rowspan="3">编内</th>
								<th rowspan="3">编外</th>
								<th rowspan="3">临时返聘</th>
							</tr>
						</tbody>
						<tbody>
							<c:forEach var="gw" items="${gxqhmcList}">
								<tr>
									<td>${gw.yljgmc}</td>
									<td>${gw.ljjsry_hj}</td>
									<td>${gw.ljjsry_bn_lz}</td>
									<td>${gw.ljjsry_bn_tx}</td>
									<td>${gw.ljjsry_bw_lz}</td>
									<td>${gw.ljjsry_bw_tx}</td>
									<td>${gw.ljjsry_lsg_lz}</td>
									<td>${gw.ljjsry_lsg_qt}</td>
									<td>${gw.dyjsry_xj}</td>
									<td>${gw.dyjsry_bn_lz}</td>
									<td>${gw.dyjsry_bn_tx}</td>
									<td>${gw.dyjsry_bw_lz}</td>
									<td>${gw.dyjsry_bw_tx}</td>
									<td>${gw.dyjsry_lsg_lz}</td>
									<td>${gw.dyjsry_lsg_qt}</td>
									<td>${gw.ljxzry_hj}</td>
									<td>${gw.ljxzry_wszy_bn}</td>
									<td>${gw.ljxzry_wszy_bw}</td>
									<td>${gw.ljxzry_wszy_lsg}</td>
									<td>${gw.ljxzry_fwszy_bn}</td>
									<td>${gw.ljxzry_fwszy_bw}</td>
									<td>${gw.ljxzry_fwszy_lsg}</td>
									<td>${gw.dyxzry_xj}</td>
									<td>${gw.dyxzry_wszy_bn}</td>
									<td>${gw.dyxzry_wszy_bw}</td>
									<td>${gw.dyxzry_wszy_lsg}</td>
									<td>${gw.dyxzry_fwszy_bn}</td>
									<td>${gw.dyxzry_fwszy_bw}</td>
									<td>${gw.dyxzry_fwszy_lsg}</td>
								</tr>
							</c:forEach>
						</tbody>
						<tfoot>
							<tr class="count3">
							</tr>
						</tfoot>
					</table>
				</div>
				<div class="layui-tab-item"></div>
			</div>
	
	</div>


</body>
</html>