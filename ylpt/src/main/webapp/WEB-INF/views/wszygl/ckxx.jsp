<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/commons/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
<title>提醒详细信息</title>
<%@ include file="/commons/meta.jsp"%>

<script type="text/javascript">	
</script>

<style>
td { 
text-align: center;

}
</style>
</head>

<body style="background: #Fff; overflow: scroll;">
	<div id="queryform" class="layui-form" style="background: #FFFFFF;">
		<table style="width: 75%;margin:15px auto;" border="2" >
			<c:forEach items="${ckxxSj}" var="ckxxSj">
				<tr>
					<td colspan="5" bgcolor="#FFD39B"><h4>个人基本信息</h4></td>
				</tr>
				<tr>
					<td width="20%" bgcolor="#FFEBCD">姓名:</td>
					<td width="17%">${ckxxSj.unitname}</td>
					<td width="32%" bgcolor="#FFEBCD">国籍:</td>
					<td width="13%">中国</td>
					<td width="15%" rowspan="5" >照片</td>
				</tr>
				<tr>
					<td bgcolor="#FFEBCD">性别</td>
					<td>${ckxxSj.gender}</td>
					<td bgcolor="#FFEBCD">民族</td>
					<td>${ckxxSj.folk}</td>

				</tr>
				<tr>
					<td bgcolor="#FFEBCD">证件号码</td>
					<td>${ckxxSj.idcard}</td>
					<td bgcolor="#FFEBCD">籍贯</td>
					<td>${ckxxSj.nativeplace}</td>

				</tr>
				<tr>
					<td bgcolor="#FFEBCD">出生日期</td>
					<td>${ckxxSj.birthdate}</td>
					<td bgcolor="#FFEBCD">手机号码</td>
					<td>${ckxxSj.phone}</td>
				</tr>
				<tr>
					<td bgcolor="#FFEBCD">政治面貌</td>
					<td>${ckxxSj.politicallandscape}</td>
					<td bgcolor="#FFEBCD">参加党派时间</td>
					<td colspan="1">${ckxxSj.joinpartydate}</td>

				</tr>
				<tr>
					<td colspan="5" bgcolor="#FFD39B">
						<h4 >工作信息</h4>
					</td>
				</tr>
				<tr>
					<td bgcolor="#FFEBCD">所在单位名称:</td>
					<td colspan="4">${ckxxSj.hospitalname}</td>
				</tr>
				<tr>
					<td bgcolor="#FFEBCD">所在科室名称</td>
					<td>${ckxxSj.sectionname}</td>
					<td bgcolor="#FFEBCD">所在科室代码</td>
					<td colspan="2">${ckxxSj.sectionid}</td>
				</tr>

				<tr>
					<td bgcolor="#FFEBCD">参加工作日期</td>
					<td>${ckxxSj.joinworkdate}</td>
					<td bgcolor="#FFEBCD">从事专业</td>
					<td colspan="2">${ckxxSj.praclevel}</td>
				</tr>
				<tr>
					 <td bgcolor="#FFEBCD">编制情况</td>
					<td >${ckxxSj.organizationcode}</td>
					 <td bgcolor="#FFEBCD">人员类型</td>
					<td colspan="2">${ckxxSj.medicaltype}</td>
				</tr>
				<tr>
					<td bgcolor="#FFEBCD">专业技术资格评</td>
					<td>${ckxxSj.telqualification}</td>
					<td bgcolor="#FFEBCD">专业技术资格评定时间</td>
					<td colspan="2">${ckxxSj.telqualificationtime}</td>
				</tr>

				<tr>
					<td bgcolor="#FFEBCD">医师执业类别</td>
					<td>${ckxxSj.applypratype}</td>
					<td bgcolor="#FFEBCD">其他科室补述</td>
					<td colspan="2">${ckxxSj.sub_section}</td>
				</tr>
				<tr>
					<td bgcolor="#FFEBCD">医师/卫生监督员执业证书编码</td>
					<td>${ckxxSj.corpcardcode}</td>
					<td bgcolor="#FFEBCD">年内人员流动情况</td>
					<td colspan="2">${ckxxSj.flowcode}</td>

				</tr>
				<tr>
					<td bgcolor="#FFEBCD">是否从事统计信息化业务工作</td>
					<td>${ckxxSj.tjxxh}</td>
					<td bgcolor="#FFEBCD">是否注册为全科医学专业</td>
					<td colspan="2">${ckxxSj.qkyx}</td>

				</tr>
				<tr>
					<td bgcolor="#FFEBCD">调入/调出时间</td>
					<td>${ckxxSj.flowtime}</td>
					<td bgcolor="#FFEBCD">专业技术职务聘</td>
					<td colspan="2">${ckxxSj.technicaltitle}</td>

				</tr>
				<tr>
					<td colspan="5" bgcolor="#FFD39B">
						<h4>教学经历</h4>
					</td>
				</tr>
				<tr>
					<td bgcolor="#FFEBCD">学历</td>
					<td>${ckxxSj.edu}</td>
					<td bgcolor="#FFEBCD">所学专业</td>
					<td colspan="2">${ckxxSj.major}</td>

				</tr>
				<tr>
					<td bgcolor="#FFEBCD">学位</td>
					<td>${ckxxSj.edudegree}</td>
					<td bgcolor="#FFEBCD">学校名称</td>
					<td colspan="2"></td>

				</tr>
				<tr>
					<td bgcolor="#FFEBCD">入学时间</td>
					<td></td>
					<td bgcolor="#FFEBCD">毕业时间</td>
					<td colspan="2"></td>

				</tr>
				<tr>
					<td colspan="5" bgcolor="#FFD39B">
						<h4 >培训经历</h4>
					</td>
				</tr>
				<tr>
					<td bgcolor="#FFEBCD">培训类型</td>
					<td></td>
					<td bgcolor="#FFEBCD">培训单位</td>
					<td colspan="2"></td>

				</tr>
				<tr>
					<td bgcolor="#FFEBCD">培训时间</td>
					<td></td>
					<td bgcolor="#FFEBCD">培训证书</td>
					<td colspan="2"></td>

				</tr>
				
				<tr>
					<td colspan="5" bgcolor="#FFD39B">
						<h4 >奖励信息</h4>
					</td>
				</tr>
				
				<tr>
					<td bgcolor="#FFEBCD">是否获过奖</td>
					<td></td>
					<td bgcolor="#FFEBCD">获奖项目</td>
					<td colspan="2"></td>
				</tr>
				<tr>
					<td bgcolor="#FFEBCD">发奖单位</td>
					<td></td>
					<td bgcolor="#FFEBCD">发奖日期</td>
					<td colspan="2"></td>
				</tr>
			</c:forEach>
		</table>
	</div>

</body>

</html>