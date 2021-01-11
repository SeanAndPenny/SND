<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/commons/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
<title>行政区划详细信息</title>
<script type="text/javascript" src="<c:url value="/static/commons/js/jquery.min.js"/>"></script>
<script type="text/javascript" src="<c:url value="/static/commons/js/jquery.form.js"/>"></script>
<script type="text/javascript" src="<c:url value="/static/layui/layui.js"/>"></script>

<!-- Csses -->
<link rel="stylesheet" type="text/css" href="<c:url value="/static/layui/css/layui.css"/>" />

</head>
    <body style="min-height: 100px;min-width: 480px;height: 280px" >
    <div style="margin-top: 50px">
  <form class="layui-form" >
  <c:choose>
	<c:when test="${delete==1}"> 
		<div class="layui-form-item">
		  	<div class="layui-inline">
			    <label class="layui-form-label">申请人</label>
			    <div class="layui-input-block">
			      <input  type="text" name="oldcode" value="${one.whocreatename}" disabled="disabled"  autocomplete="off"  class="layui-input">
			    </div>
	   		</div>
	  		<div class="layui-inline">
			    <label class="layui-form-label">申请状态</label>
			    <div class="layui-input-block">
			      <input  type="text"  value="${flag}" disabled="disabled"  autocomplete="off"  class="layui-input">
			    </div>
	  		</div>
	  </div>	
	  <div class="layui-form-item">
	 		<div class="layui-inline">
			    <label class="layui-form-label">操作数据名称</label>
			    <div class="layui-input-block">
			      <input  type="text" name="oldcode" value="${oldone.name}" disabled="disabled"  autocomplete="off"  class="layui-input">
			    </div>
	   		</div>
	   		<div class="layui-inline">
			    <label class="layui-form-label">操作数据编码</label>
			    <div class="layui-input-block">
			      <input  type="text" name="oldcode" value="${oldone.code}" disabled="disabled"  autocomplete="off"  class="layui-input">
			    </div>
	   		</div>	
		  	
	  </div>
	  <div class="layui-form-item">
	 	 <div class="layui-inline">
			    <label class="layui-form-label">申请内容</label>
			    <div class="layui-input-block">
			      <input  type="text" name="oldcode" value="删除此条数据" disabled="disabled"  autocomplete="off"  class="layui-input">
			    </div>
	   		</div>	  
	  </div>				   
	</c:when>
	<c:when test="${INSERT==1}">
	
		  <div class="layui-form-item">
		  	<div class="layui-inline">
			    <label class="layui-form-label">需要在下面增加的</label>
			    <div class="layui-input-block">
			    	<input type="text"  value="${pOne.name}" disabled="disabled"  autocomplete="off"  class="layui-input">	    
				</div>
	   		</div>
	  		<div class="layui-inline">
			    <label class="layui-form-label">新增名字</label>
			    <div class="layui-input-block">
			  	<input type="text"  value="${newname}" disabled="disabled"  autocomplete="off"  class="layui-input">
			    </div>
	  		</div>
	  </div>
	  <div class="layui-form-item">
		  	<div class="layui-inline">
			    <label class="layui-form-label">新增行政区划编码</label>
			    <div class="layui-input-block">
			  	<input type="text"  value="${newcode}" disabled="disabled"  autocomplete="off"  class="layui-input">
			      
			    </div>
	   		</div>
	  </div>

	</c:when>
   <c:otherwise> 
   	  <div class="layui-form-item">
		  	<div class="layui-inline">
			    <label class="layui-form-label">原名称</label>
			    <div class="layui-input-block">
			      <input type="text"  value="${oldname}" disabled="disabled"  autocomplete="off"  class="layui-input">
			     
			    </div>
	   		</div>
	  		<div class="layui-inline">
			    <label class="layui-form-label">修改后名字</label>
			    <div class="layui-input-block">
			      <input type="text" value="${newname}" disabled="disabled" autocomplete="off" class="layui-input" disabled="disabled">
			    </div>
	  		</div>
	  </div>
	  <div class="layui-form-item">
		  	<div class="layui-inline">
			    <label class="layui-form-label">原行政区划代码</label>
			    <div class="layui-input-block">
			      <input  type="text" name="oldcode" value="${oldcode}" disabled="disabled"  autocomplete="off"  class="layui-input">
			    </div>
	   		</div>
	  		<div class="layui-inline">
			    <label class="layui-form-label">修改后政区划代码</label>
			    <div class="layui-input-block">
			      <input  type="text"  value="${newcode}" disabled="disabled"  autocomplete="off"  class="layui-input">
			    </div>
	  		</div>
	  </div>
	  <div class="layui-form-item">
		  	<div class="layui-inline">
			    <label class="layui-form-label">申请人</label>
			    <div class="layui-input-block">
			      <input  type="text" name="oldcode" value="${one.whocreatename}" disabled="disabled"  autocomplete="off"  class="layui-input">
			    </div>
	   		</div>
	  		<div class="layui-inline">
			    <label class="layui-form-label">申请状态</label>
			    <div class="layui-input-block">
			      <input  type="text"  value="${flag}" disabled="disabled"  autocomplete="off"  class="layui-input">
			    </div>
	  		</div>
	  </div>
   </c:otherwise>
</c:choose>
  

  </form>
	<%@ include file="/commons/bootstrap-bottom.jsp" %>
	
	</div>
	<script>

	</script>
</body>
</html>