<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/commons/taglib.jsp"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
 



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
<title>资源目录</title>
<%@ include file="/commons/meta2.jsp"%>
<script type="text/javascript"
	src="<c:url value="/static/commons/js/calendar/WdatePicker.js"/>"></script>
<script type="text/javascript"
	src="<c:url value="/static/commons/js/echarts/echarts-liquidfill.js"/>"></script>
<script type="text/javascript"
	src="<c:url value="/static/layui/layui.js"/>"></script>
</head>
<body>
	<table >
		<thead>
			<tr>
				<th>资源目录名称</th>
			</tr>
		</thead>
		<tbody>
		<tr>
				<td>--------------------区域人口--------------------------------</td>
		</tr>
			
			<tr>
				<td style="color: red"><a
					href="${ctx}/xxx/xxx?p_ywbz=CZRK&p_yxbz=1&p_tjsjwd=0&p_jgdm="
				style="color: #227700"	target="_blank">常驻人口 </a></td>
			</tr>
			<tr>
				<td><a
					href="${ctx}/xxx/xxx?p_ywbz=LDRK&p_yxbz=1&p_tjsjwd=0&p_jgdm="
				style="color: #227700"	target="_blank">流动人口 </a></td>
			</tr>
			 <tr>
				<td><a
					href="${ctx}/xxx/xxx?p_ywbz=SWXX&p_yxbz=1&p_tjsjwd=0&p_jgdm="
				style="color: #227700"	target="_blank">死亡信息 </a></td>
			</tr>
			<tr>
				<td><a
					href="${ctx}/xxx/xxx?p_ywbz=CSZM&p_yxbz=1&p_tjsjwd=0&p_jgdm="
				style="color: #227700"	target="_blank">人口出生(出生证明)</a></td>
			</tr>
			<tr>
				<td><a
					href="${ctx}/xxx/xxx?p_ywbz=YFFM&p_yxbz=1&p_tjsjwd=0&p_jgdm="
				style="color: #227700"	target="_blank">人口出生(孕妇分娩)</a></td>
			</tr>
			
			<tr>
				<td>--------------------区域资源--------------------------------</td>
		    </tr>
		    <tr>
				<td><a
					href="${ctx}/xxx/xxx?p_ywbz=QYRY&p_yxbz=1&p_tjsjwd=0&p_jgdm="
				style="color: #227700"	target="_blank">区域人员</a></td>
			</tr>
			<tr>
				<td><a
					href="${ctx}/xxx/xxx?p_ywbz=QYJG&p_yxbz=1&p_tjsjwd=0"
				style="color: #227700"	target="_blank">区域机构</a></td>
			</tr>
			<tr>
				<td><a
					href="${ctx}/xxx/xxx?p_ywbz=YJJJ&p_yxbz=1&p_tjsjwd=0"
					target="_blank">应急急救</a></td>
			</tr>
			
			<tr>
				<td><a
					href="${ctx}/xxx/xxx?p_ywbz=CWTJ&p_yxbz=1&p_tjsjwd=0"
					target="_blank">床位统计</a></td>
			</tr>
			
			<tr>
				<td>--------------------门诊业务--------------------------------</td>
		</tr>
			<tr>
				<td><a
					href="${ctx}/xxx/xxx?p_ywbz=MZYW_GHTJ&p_yxbz=1&p_tjsjwd=0&p_jgdm="
				style="color: #227700"	target="_blank">门诊挂号 </a></td>
			</tr>
			
			<tr>
				<td><a
					href="${ctx}/xxx/xxx?p_ywbz=MZYW&p_yxbz=1&p_tjsjwd=0&p_jgdm="
				style="color: #227700"	target="_blank">门/急诊就诊 </a></td>
			</tr>
			<tr>
				<td><a
					href="${ctx}/xxx/xxx?p_ywbz=MZFY&p_yxbz=1&p_tjsjwd=0&p_jgdm="
				style="color: #227700"	target="_blank">门诊费用</a></td>
			</tr>
			<tr>
				<td><a
					href="${ctx}/xxx/xxx?p_ywbz=MZCF&p_yxbz=1&p_tjsjwd=0&p_jgdm="
				style="color: #227700"	target="_blank">门诊处方</a></td>
			</tr>
			
			<tr>
				<td><a
					href="${ctx}/xxx/xxx?p_ywbz=RYDJ&p_yxbz=1&p_tjsjwd=0&p_jgdm="
				style="color: #227700"	target="_blank">在院统计 </a></td>
			</tr>
			 
			<tr>
				<td><a
					href="${ctx}/xxx/xxx?p_ywbz=YLHC&p_yxbz=1&p_tjsjwd=0&p_jgdm="
				style="color: #227700"	target="_blank">医疗耗材</a></td>
			</tr>
			
			<tr>
				<td><a
					href="${ctx}/xxx/xxx?p_ywbz=YXSQ&p_yxbz=1&p_tjsjwd=0&p_jgdm="
				style="color: #227700"	target="_blank">用血申请</a></td>
			</tr>
			<tr>
				<td><a
					href="${ctx}/xxx/xxx?p_ywbz=JYXX&p_yxbz=1&p_tjsjwd=0&p_jgdm="
				style="color: #227700"	target="_blank">检验信息</a></td>
			</tr>
			<tr>
				<td><a
					href="${ctx}/xxx/xxx?p_ywbz=JCXX&p_yxbz=1&p_tjsjwd=0&p_jgdm="
				style="color: #227700"	target="_blank">检查信息</a></td>
			</tr>
			
			<tr>
				<td><a
					href="${ctx}/xxx/xxx?p_ywbz=YBSS&p_yxbz=1&p_tjsjwd=0&p_jgdm="
				style="color: #227700"	target="_blank">一般手术</a></td>
			</tr>
			
			<tr>
				<td><a
					href="${ctx}/xxx/xxx?p_ywbz=BASS&p_yxbz=1&p_tjsjwd=0&p_jgdm="
				style="color: #227700"	target="_blank">病案手术</a></td>
			</tr>
			<tr>
				<td><a
					href="${ctx}/xxx/xxx?p_ywbz=TJFX&p_yxbz=1&p_tjsjwd=0&p_jgdm="
					target="_blank">体检分析</a></td>
			</tr>
			<tr>
				<td><a
					href="${ctx}/xxx/xxx?p_ywbz=ZYYZ&p_yxbz=1&p_tjsjwd=0&p_jgdm="
				style="color: #227700"	target="_blank">住院医嘱</a></td>
			</tr>
			
			
			<tr>
				<td>--------------------公卫数据--------------------------------</td>
		   </tr>
			<tr>
				<td><a
					href="${ctx}/xxx/xxx?p_ywbz=TNBGL&p_yxbz=1&p_tjsjwd=0&p_jgdm="
					target="_blank">糖尿病管理</a></td>
			</tr>
			<tr>
				<td><a
					href="${ctx}/xxx/xxx?p_ywbz=GXYGL&p_yxbz=1&p_tjsjwd=0&p_jgdm="
					target="_blank">高血压管理</a></td>
			</tr>
			<tr>
				<td><a
					href="${ctx}/xxx/xxx?p_ywbz=GXBGL&p_yxbz=1&p_tjsjwd=0&p_jgdm="
					target="_blank">冠心病管理</a></td>
			</tr>
			<tr>
				<td><a
					href="${ctx}/xxx/xxx?p_ywbz=ZLGL&p_yxbz=1&p_tjsjwd=0&p_jgdm="
					target="_blank">肿瘤管理</a></td>
			</tr>
			<tr>
				<td><a
					href="${ctx}/xxx/xxx?p_ywbz=NCZGL&p_yxbz=1&p_tjsjwd=0&p_jgdm="
					target="_blank">脑卒中管理</a></td>
			</tr>
			
			<tr>
				<td><a
					href="${ctx}/xxx/xxx?p_ywbz=XSRFS&p_yxbz=1&p_tjsjwd=0&p_jgdm="
					target="_blank">新生儿访视</a></td>
			</tr>
			<tr>
				<td><a
					href="${ctx}/xxx/xxx?p_ywbz=XSRQX&p_yxbz=1&p_tjsjwd=0&p_jgdm="
					target="_blank">新生儿出生缺陷</a></td>
			</tr>
			<tr>
				<td><a
					href="${ctx}/xxx/xxx?p_ywbz=XSRJBSC&p_yxbz=1&p_tjsjwd=0&p_jgdm="
					target="_blank">新生儿疾病筛查</a></td>
			</tr>
			<tr>
				<td><a
					href="${ctx}/xxx/xxx?p_ywbz=XSRTLSC&p_yxbz=1&p_tjsjwd=0&p_jgdm="
					target="_blank">新生儿听力筛查</a></td>
			</tr>
			
			<tr>
				<td><a
					href="${ctx}/xxx/xxx?p_ywbz=XSRTRTJ&p_yxbz=1&p_tjsjwd=0&p_jgdm="
					target="_blank">新生儿体弱统计</a></td>
			</tr>
			<tr>
				<td><a
					href="${ctx}/xxx/xxx?p_ywbz=ETSW&p_yxbz=1&p_tjsjwd=0&p_jgdm="
					target="_blank">儿童死亡统计</a></td>
			</tr>
			
			<tr>
				<td><a
					href="${ctx}/xxx/xxx?p_ywbz=LNRJKGL&p_yxbz=1&p_tjsjwd=0&p_jgdm="
					target="_blank">老年人健康管理</a></td>
			</tr>
			<tr>
				<td><a
					href="${ctx}/xxx/xxx?p_ywbz=LNRSF&p_yxbz=1&p_tjsjwd=0&p_jgdm="
					target="_blank">老年人随访</a></td>
			</tr>
			<tr>
				<td><a
					href="${ctx}/xxx/xxx?p_ywbz=LNRJKGTPG&p_yxbz=1&p_tjsjwd=0&p_jgdm="
					target="_blank">老年人健康状态评估</a></td>
			</tr>
			
			
			
			
			<tr>
				<td><a
					href="${ctx}/xxx/xxx?p_ywbz=HQJC&p_yxbz=1&p_tjsjwd=0&p_jgdm="
					target="_blank">婚前检查统计</a></td>
			</tr>
			<tr>
				<td><a
					href="${ctx}/xxx/xxx?p_ywbz=CQSF&p_yxbz=1&p_tjsjwd=0&p_jgdm="
					target="_blank">产前随访</a></td>
			</tr>
			<tr>
				<td><a
					href="${ctx}/xxx/xxx?p_ywbz=CHFS&p_yxbz=1&p_tjsjwd=0&p_jgdm="
					target="_blank">产后访视</a></td>
			</tr>
			
			
			<tr>
				<td><a
					href="${ctx}/xxx/xxx?p_ywbz=CH42&p_yxbz=1&p_tjsjwd=0&p_jgdm="
					target="_blank">产后42天健康检查</a></td>
			</tr>
			
			
			<tr>
				<td><a
					href="${ctx}/xxx/xxx?p_ywbz=CQSCYZD&p_yxbz=1&p_tjsjwd=0&p_jgdm="
					target="_blank">产前筛查与诊断记录</a></td>
			</tr>
			
			<tr>
				<td><a
					href="${ctx}/xxx/xxx?p_ywbz=YCFSWBG&p_yxbz=1&p_tjsjwd=0&p_jgdm="
					target="_blank">孕产妇死亡报告</a></td>
			</tr>
			
			<tr>
				<td>--------------------家庭医生签约--------------------------------</td>
		   </tr>
		   <tr>
				<td><a
					href="${ctx}/xxx/xxx?p_ywbz=JTYS&p_yxbz=1&p_tjsjwd=0&p_jgdm="
					target="_blank">家庭医生签约</a></td>
			</tr>
			
			<tr>
				<td>--------------------数据时时上传情况--------------------------------</td>
		   </tr>
		   <tr>
				<td><a
					href="${ctx}/shujuScQk/shujuScQk"
					target="_blank">数据时时上传情况</a></td>
			</tr>
			
			 <tr>
				<td><a
					href="${ctx}/swxxfx/swxxfx"
					target="_blank">死亡信息分析</a></td>
			</tr>
			
			 <tr>
				<td><a
					href="${ctx}/jkdaglfx/jkdaglfx"
					target="_blank">健康档案管理分析</a></td>
			</tr>
			 <tr>
				<td><a
					href="${ctx}/mzjfx/mzjfx"
					target="_blank">门诊业务分析</a></td>
			</tr>
			<tr>
				<td><a
					href="${ctx}/zyfx/zyfx"
					target="_blank">住院分析</a></td>
			</tr>
			<tr>
				<td><a
					href="${ctx}/gxqybfytj/gxqybfytj"
					target="_blank">区域医保分析</a></td>
			</tr>
			<tr>
				<td><a
					href="${ctx}/gxqGlybfytj/gxqGlybfytj"
					target="_blank">公立医保分析</a></td>
			</tr>
			<tr>
				<td><a
					href="${ctx}/jcfx/jcfx"
					target="_blank">检查分析</a></td>
			</tr>
			<tr>
				<td><a
					href="${ctx}/jyfx/jyfx"
					target="_blank">检验分析</a></td>
			</tr>
			<tr>
				<td><a
					href="${ctx}/bafx/bafx"
					target="_blank">病案分析</a></td>
			</tr>
			<tr>
				<td><a
					href="${ctx}/bass/bass"
					target="_blank">病案手术</a></td>
			</tr>
			<tr>
				<td><a
					href="${ctx}/yzbfx/yzbfx"
					target="_blank">药占比分析</a></td>
			</tr>
			<tr>
				<td><a
					href="${ctx}/ypcrk/ypcrk"
					target="_blank">药品出/入库分析</a></td>
			</tr>
			<tr>
				<td><a
					href="${ctx}/xzyltj/xzyltj"
					target="_blank">乡镇医疗数据分析</a></td>
			</tr>
			<tr>
				<td><a
					href="${ctx}/ywbpz/ywbpz"
					target="_blank">新区业务表查看</a></td>
			</tr>
		</tbody>
	</table>



</body>
</html>
