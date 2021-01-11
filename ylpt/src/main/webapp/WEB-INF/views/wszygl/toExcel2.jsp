<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/commons/taglib.jsp"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>高新区公立医疗卫生机构人员名册月报表</title>
</head>
<body>
 
	<%
		String monthmc = request.getParameter("p_tbrq");
		String exportToExcel = request.getParameter("exportToExcel");
		if (exportToExcel != null && exportToExcel.toString().equalsIgnoreCase("YES")) {
			response.setContentType("application/vnd.ms-excel;charset=UTF-8");
			response.setHeader("Content-Disposition", "inline; filename="
					+ new String(("高新区公立医疗卫生机构人员名册月报表(" + monthmc+")").getBytes("gb2312"), "ISO8859-1") + ".xls");
		}
	%>
	<table style="border-color: #000000" class="hzjbxx-table"
		cellpadding="" cellspacing="" border="">
		<c:forEach var="hmc" items="${gxqhmcList}" end='0'>
			<li><h4>高新区公立医疗卫生机构人员名册月报表(${hmc.monthmc}底)</h4></li>
		</c:forEach>
	</table>

	<table style="border-color: #000000" class="hzjbxx-table"
		cellpadding="1" cellspacing="1" border="1">
		<tbody>
			<li><h4>基本表格一、</h4></li>
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

	</table>
	<table style="border-color: #000000" class="hzjbxx-table"
		cellpadding="1" cellspacing="1" border="1">

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

		<c:forEach var="gw" items="${zsgxqhmcList}">
			<tr>
				<td>${gw.zs_yljgmc}</td>
				<td>${gw.zs_ryzs_hj}</td>
				<td>${gw.zs_ryzs_bn}</td>
				<td>${gw.zs_ryzs_bwhtyg}</td>
				<td>${gw.zs_ryzs_lsg}</td>
				<td>${gw.zs_bnbwlsg_hj}</td>
				<td>${gw.zs_wszy_yi}</td>
				<td>${gw.zs_wszy_yao}</td>
				<td>${gw.zs_wszy_hu}</td>
				<td>${gw.zs_wszy_ji}</td>
				<td>${gw.zs_wszy_wsgl}</td>
				<td>${gw.zs_wszy_qt}</td>
				<td>${gw.zs_fwszy_kjzy}</td>
				<td>${gw.zs_fwszy_xxzy}</td>
				<td>${gw.zs_fwszy_glzy}</td>
				<td>${gw.zs_fwszy_qt}</td>
				<td>${gw.zs_bnry_xj}</td>
				<td>${gw.zs_bnry_wszy_yi}</td>
				<td>${gw.zs_bnry_wszy_yao}</td>
				<td>${gw.zs_bnry_wszy_hu}</td>
				<td>${gw.zs_bnry_wszy_ji}</td>
				<td>${gw.zs_bnry_wszy_wsgl}</td>
				<td>${gw.zs_bnry_wszy_qt}</td>
				<td>${gw.zs_bnry_fwszy_kjzy}</td>
				<td>${gw.zs_bnry_fwszy_xxzy}</td>
				<td>${gw.zs_bnry_fwszy_glzy}</td>
				<td>${gw.zs_bnry_fwszy_qt}</td>
				<td>${gw.zs_bwry_xj}</td>
				<td>${gw.zs_bwry_wszy_yi}</td>
				<td>${gw.zs_bwry_wszy_yao}</td>
				<td>${gw.zs_bwry_wszy_hu}</td>
				<td>${gw.zs_bwry_wszy_ji}</td>
				<td>${gw.zs_bwry_wszy_glzy}</td>
				<td>${gw.zs_bwry_wszy_qt}</td>
				<td>${gw.zs_bwry_fwszy_kjzy}</td>
				<td>${gw.zs_bwry_fwszy_xxzy}</td>
				<td>${gw.zs_bwry_fwszy_gkzy}</td>
				<td>${gw.zs_bwry_fwszy_qt}</td>
				<td>${gw.zs_lsg_xj}</td>
				<td>${gw.zs_lsg_wszy_yi}</td>
				<td>${gw.zs_lsg_wszy_yao}</td>
				<td>${gw.zs_lsg_wszy_hu}</td>
				<td>${gw.zs_lsg_wszy_ji}</td>
				<td>${gw.zs_lsg_wszy_wsgl}</td>
				<td>${gw.zs_lsg_wszy_qt}</td>
				<td>${gw.zs_lsg_fwszy_hjzy}</td>
				<td>${gw.zs_lsg_fwszy_xxzy}</td>
				<td>${gw.zs_lsg_fwszy_glzy}</td>
				<td>${gw.zs_lsg_fwszy_qt}</td>
				<td>${gw.zs_bwhtz_hj}</td>
				<td>${gw.zs_bwhtz_dwht}</td>
				<td>${gw.zs_bwhtz_nwpq}</td>
				<td>${gw.zs_bwhtz_rsdl}</td>
				<td>${gw.zs_bwhtz_qt}</td>
				<td>${gw.zs_qkys_hjtj_hj}</td>
				<td>${gw.zs_qkys_hjtj_53}</td>
				<td>${gw.zs_qkys_hjtj_32}</td>
				<td>${gw.zs_qkys_hjtj_zgpx}</td>
				<td>${gw.zs_qkys_bn_xj}</td>
				<td>${gw.zs_qkys_bn_53}</td>
				<td>${gw.zs_qkys_bn_32}</td>
				<td>${gw.zs_qkys_bn_zgpx}</td>
				<td>${gw.zs_qkys_bw_xj}</td>
				<td>${gw.zs_qkys_bw_53}</td>
				<td>${gw.zs_qkys_bw_32}</td>
				<td>${gw.zs_qkys_bw_zgpx}</td>
				<td>${gw.zs_qkys_lsg_xj}</td>
				<td>${gw.zs_qkys_lsg_53}</td>
				<td>${gw.zs_qkys_lsg_32}</td>
				<td>${gw.zs_qkys_lsg_zgpx}</td>
			</tr>
		</c:forEach>

	</table>



	<table style="border-color: #000000" class="hzjbxx-table"
		cellpadding="1" cellspacing="1" border="1">
		<tbody>
			<li><h4>基本表格二、</h4></li>
			<tr>
				<th rowspan="5">单位</th>
				<th bgcolor="#FFBB66" colspan="44">职称统计</th>
				<th bgcolor="#FFBB66" rowspan="2" colspan="28">学历统计</th>
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
	</table>
	<table style="border-color: #000000" class="hzjbxx-table"
		cellpadding="1" cellspacing="1" border="1">
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
		<c:forEach var="gw" items="${zsgxqhmcList}">
			<tr>
				<td>${gw.zs_yljgmc}</td>
				<td>${gw.zs_wszy_hjtj_hj}</td>
				<td>${gw.zs_wszy_hjtj_zg}</td>
				<td>${gw.zs_wszy_hjtj_fj}</td>
				<td>${gw.zs_wszy_hjtj_zj}</td>
				<td>${gw.zs_wszy_hjtj_cj}</td>
				<td>${gw.zs_wszy_hjtj_wzc}</td>
				<td>${gw.zs_wszy_bn_xj}</td>
				<td>${gw.zs_wszy_bn_zg}</td>
				<td>${gw.zs_wszy_bn_fg}</td>
				<td>${gw.zs_wszy_bn_zj}</td>
				<td>${gw.zs_wszy_bn_cj}</td>
				<td>${gw.zs_wszy_bn_wzc}</td>
				<td>${gw.zs_wszy_bw_xj}</td>
				<td>${gw.zs_wszy_bw_zg}</td>
				<td>${gw.zs_wszy_bw_fg}</td>
				<td>${gw.zs_wszy_bw_zj}</td>
				<td>${gw.zs_wszy_bw_cj}</td>
				<td>${gw.zs_wszy_bw_wzc}</td>
				<td>${gw.zs_wszy_lsg_xj}</td>
				<td>${gw.zs_wszy_lsg_zg}</td>
				<td>${gw.zs_wszy_lsg_fg}</td>
				<td>${gw.zs_wszy_lsg_zj}</td>
				<td>${gw.zs_wszy_lsg_cj}</td>
				<td>${gw.zs_wszy_lsg_wzc}</td>
				<td>${gw.zs_fwszy_hjtj_hj}</td>
				<td>${gw.zs_fwszy_hjtj_gj}</td>
				<td>${gw.zs_fwszy_hjtj_zj}</td>
				<td>${gw.zs_fwszy_hjtj_cj}</td>
				<td>${gw.zs_fwszy_hjtj_wzc}</td>
				<td>${gw.zs_fwszy_bn_xj}</td>
				<td>${gw.zs_fwszy_bn_gj}</td>
				<td>${gw.zs_fwszy_bn_zj}</td>
				<td>${gw.zs_fwszy_bn_cj}</td>
				<td>${gw.zs_fwszy_bn_wzc}</td>
				<td>${gw.zs_fwszy_bw_xj}</td>
				<td>${gw.zs_fwszy_bw_gj}</td>
				<td>${gw.zs_fwszy_bw_zj}</td>
				<td>${gw.zs_fwszy_bw_cj}</td>
				<td>${gw.zs_fwszy_bw_wzc}</td>
				<td>${gw.zs_fwszy_lsg_xj}</td>
				<td>${gw.zs_fwszy_lsg_gj}</td>
				<td>${gw.zs_fwszy_lsg_zj}</td>
				<td>${gw.zs_fwszy_lsg_cj}</td>
				<td>${gw.zs_fwszy_lsg_wzc}</td>
				<td>${gw.zs_xltj_hjtj_hj}</td>
				<td>${gw.zs_xltj_hjtj_bsh}</td>
				<td>${gw.zs_xltj_hjtj_bs}</td>
				<td>${gw.zs_xltj_hjtj_ss}</td>
				<td>${gw.zs_xltj_hjtj_bk}</td>
				<td>${gw.zs_xltj_hjtj_dz}</td>
				<td>${gw.zs_xltj_hjtj_dzyx}</td>
				<td>${gw.zs_xltj_bn_xj}</td>
				<td>${gw.zs_xltj_bn_bsh}</td>
				<td>${gw.zs_xltj_bn_bs}</td>
				<td>${gw.zs_xltj_bn_ss}</td>
				<td>${gw.zs_xltj_bn_bk}</td>
				<td>${gw.zs_xltj_bn_dz}</td>
				<td>${gw.zs_xltj_bn_dzyx}</td>
				<td>${gw.zs_xltj_bw_xj}</td>
				<td>${gw.zs_xltj_bw_bsh}</td>
				<td>${gw.zs_xltj_bw_bs}</td>
				<td>${gw.zs_xltj_bw_ss}</td>
				<td>${gw.zs_xltj_bw_bk}</td>
				<td>${gw.zs_xltj_bw_dz}</td>
				<td>${gw.zs_xltj_bw_dzyx}</td>
				<td>${gw.zs_xltj_lsg_xj}</td>
				<td>${gw.zs_xltj_lsg_bsh}</td>
				<td>${gw.zs_xltj_lsg_bs}</td>
				<td>${gw.zs_xltj_lsg_ss}</td>
				<td>${gw.zs_xltj_lsg_bk}</td>
				<td>${gw.zs_xltj_lsg_dz}</td>
				<td>${gw.zs_xltj_lsg_dzyx}</td>
			</tr>
		</c:forEach>
	</table>
	<table style="border-color: #000000" class="hzjbxx-table"
		cellpadding="1" cellspacing="1" border="1">

		<tbody>
			<li><h4>基本表格三、</h4></li>


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
	</table>
	<table style="border-color: #000000" class="hzjbxx-table"
		cellpadding="1" cellspacing="1" border="1">
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
		<c:forEach var="gw" items="${zsgxqhmcList}">
			<tr>

				<td>${gw.zs_yljgmc}</td>
				<td>${gw.zs_ljjsry_hj}</td>
				<td>${gw.zs_ljjsry_bn_lz}</td>
				<td>${gw.zs_ljjsry_bn_tx}</td>
				<td>${gw.zs_ljjsry_bw_lz}</td>
				<td>${gw.zs_ljjsry_bw_tx}</td>
				<td>${gw.zs_ljjsry_lsg_lz}</td>
				<td>${gw.zs_ljjsry_lsg_qt}</td>
				<td>${gw.zs_dyjsry_xj}</td>
				<td>${gw.zs_dyjsry_bn_lz}</td>
				<td>${gw.zs_dyjsry_bn_tx}</td>
				<td>${gw.zs_dyjsry_bw_lz}</td>
				<td>${gw.zs_dyjsry_bw_tx}</td>
				<td>${gw.zs_dyjsry_lsg_lz}</td>
				<td>${gw.zs_dyjsry_lsg_qt}</td>
				<td>${gw.zs_ljxzry_hj}</td>
				<td>${gw.zs_ljxzry_wszy_bn}</td>
				<td>${gw.zs_ljxzry_wszy_bw}</td>
				<td>${gw.zs_ljxzry_wszy_lsg}</td>
				<td>${gw.zs_ljxzry_fwszy_bn}</td>
				<td>${gw.zs_ljxzry_fwszy_bw}</td>
				<td>${gw.zs_ljxzry_fwszy_lsg}</td>
				<td>${gw.zs_dyxzry_xj}</td>
				<td>${gw.zs_dyxzry_wszy_bn}</td>
				<td>${gw.zs_dyxzry_wszy_bw}</td>
				<td>${gw.zs_dyxzry_wszy_lsg}</td>
				<td>${gw.zs_dyxzry_fwszy_bn}</td>
				<td>${gw.zs_dyxzry_fwszy_bw}</td>
				<td>${gw.zs_dyxzry_fwszy_lsg}</td>

			</tr>
		</c:forEach>
	</table>
</body>

</html>