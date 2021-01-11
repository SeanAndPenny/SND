<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/commons/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
<title>健康档案更新详细信息</title>
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
			<tr>
				<td colspan="5" >团队名称</td>
                 <td width="20%" >动态档案数</td>
				<td width="17%">建档总数</td>
				<td width="32%" >档案更新率</td>
				 
			</tr>
			<c:forEach items="${jkdagxxxSj}" var="jkdagxxxSj">
				
				<tr>
					 
					<td colspan="5">${jkdagxxxSj.tdmc}</td>
					 <td width="20%">${jkdagxxxSj.dtdas}</td>
					<td width="17%">${jkdagxxxSj.jdzs}</td> 
					<td width="32%" >${jkdagxxxSj.bl}</td>

				</tr>
				  

				 
				  
			</c:forEach>
		</table>
	</div>

</body>

</html>