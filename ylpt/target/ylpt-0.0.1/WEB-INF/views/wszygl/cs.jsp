<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@ include file="/commons/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
<title> 查询</title>
<%@ include file="/commons/meta.jsp"%>
<script type="text/javascript" src="<c:url value="/static/commons/js/echarts/echarts.js"/>"></script>
 
 

</head>

<body>
	
	<div id="right">
		 
		

			<table  width="100%" border="0" cellspacing="0"
				cellpadding="0">
				  
				 
				  <c:forEach items="${sqlList}" var="list" >
				   <tr>
				   <c:forEach items="${list}" var="map" >
				    <td>${map.key }</td>
				    <td>${map.value }</td>
				   </c:forEach>
				   
				   </tr>
				  </c:forEach>
				  
				  
						 
					 
					 
				 
				  
			</table>
		 			<table style="display: none;" id="show" width="100%" border="0" cellspacing="0" cellpadding="0">
		      <tr>
		        <td align="center">
		          <div id="main"  style="height:300px"></div>
		        </td>
		      </tr>
		    </table>
			</div>
			<br />
	<jsp:include page="/WEB-INF/web/selectMedicalOrganizationWindow.jsp"/>
</body>
<!-- 分页的组成部分 关闭引用的标签 -->
<page:javascript />
</html>