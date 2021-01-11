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
    <body style="min-width: 1000px; min-height: 300px;min-width: 480px;height: 300px" >
    <div style="margin-top: 50px">
		  <form class="layui-form" >
		    <c:choose>
				<c:when test="${delete==1}"> 
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
						    <label class="layui-form-label">申请人</label>
						    <div class="layui-input-block">
						   	 	<input  id='myid' name="myid" value="${one.id}" type="hidden">	
						      	<input  type="text" name="oldcode" value="${one.whocreatename}" disabled="disabled"  autocomplete="off"  class="layui-input">
						    </div>
				   		</div>
				  		<div class="layui-inline">
						    <label class="layui-form-label">申请内容</label>
						    <div class="layui-input-block">
						      <input  type="text" name="oldcode" value="删除此条数据" disabled="disabled"  autocomplete="off"  class="layui-input">
						    </div>
				  		</div>
				  </div>
				  <div class="layui-form-item">
				   	<div class="layui-inline">
					    <label class="layui-form-label">审核状态</label>
					    <div class="layui-input-block">
					      <select name="flag" id="flag"  lay-verify="required">
					      	<option value="3" >通过</option>	
					        <option value="2">不通过</option>					 					    
					      </select>
				  		</div>
			  		</div>
			
				  </div>
				  <div class="layui-form-item">
				    <div class="layui-input-block">
				      <button class="layui-btn" lay-submit lay-filter="formDemo" >立即提交</button>
					</div>
  				</div>				   
				</c:when>
				<c:when test="${INSERT==1}"> 
				 <div class="layui-form-item">
			 		<div class="layui-inline">
					    <label class="layui-form-label">需要在下面增加的</label>
					    <div class="layui-input-block">
					      <input  type="text" name="oldcode" value="${pOne.name}" disabled="disabled"  autocomplete="off"  class="layui-input">
					    </div>
			   		</div>
			   		<div class="layui-inline">
					    <label class="layui-form-label">新增名字</label>
					    <div class="layui-input-block">
					      <input  type="text" name="newname" value="${newname}" disabled="disabled"  autocomplete="off"  class="layui-input">
					    </div>
			   		</div>
	  			</div>
				<div class="layui-form-item">
					  	<div class="layui-inline">
						    <label class="layui-form-label">新增行政区划编码</label>
						    <div class="layui-input-block">
						    <input  type="text" name="newcode" value="${newcode}" disabled="disabled"  autocomplete="off"  class="layui-input">					    
						    <input  id='myid' name="myid" value="${one.id}" type="hidden">	
						    </div>
				   		</div>
				  </div>
				  <div class="layui-form-item">
				   	<div class="layui-inline">
					    <label class="layui-form-label">审核状态</label>
					    <div class="layui-input-block">
					      <select name="flag" id="flag"  lay-verify="required">
					       	<option value="3" >通过</option>	
					        <option value="2">不通过</option>				    
					      </select>
				  		</div>
			  		</div>
			
				  </div>
				  <div class="layui-form-item">
				    <div class="layui-input-block">
				      <button class="layui-btn" lay-submit lay-filter="formDemo" >立即提交</button>
					</div>
  				</div>				   
				</c:when>
			<c:otherwise> 
			  <div class="layui-form-item">
				  	<div class="layui-inline">
					    <label class="layui-form-label">原名称</label>
					    <div class="layui-input-block">
					      	<input type="text"  value="${oldname}" disabled="disabled"  autocomplete="off"  class="layui-input">
					    	<input  id='myid' name="myid" value="${one.id}" type="hidden">				     
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
					    <label class="layui-form-label">审核状态</label>
					    <div class="layui-input-block">
					      <select name="flag" id="flag"  lay-verify="required">
					      	<option value="3" >通过</option>
					        <option value="2">不通过</option>						    
					      </select>
				  		</div>
			  		</div>
			  </div>
		<div class="layui-form-item">
		    <div class="layui-input-block">
		      <button class="layui-btn" lay-submit lay-filter="formDemo" >立即提交</button>
			</div>
  		</div>
  	</c:otherwise>
	</c:choose>
		  </form>

	
	</div>
	<script>
	function close(){
		var index = parent.layer.getFrameIndex(window.name); //先得到当前iframe层的索引
		parent.layer.close(index); //再执行关闭
	}
	function save(flag,id){   
		$.ajax({
	        type:"get",
	        url:"${ctx}/area/shSqjlOne.json?flag="+flag+"&id="+id
	        ,dataType:'json',
	        success:function(data){
				if(data.code=='0'){
					layer.msg("保存成功");
					setTimeout("close()",1000);
				}else{
					layer.msg("保存失败："+data.msg);
				}
	        }
	    });
	}
		layui.use('form', function(){
		  var form = layui.form;
		//监听提交
			form.on('submit(formDemo)', function(data) {
// 				if(data.code=='0'){
// 					layer.msg("保存成功");
// 					setTimeout("close()",1000);
// 				}else{
// 					layer.msg("保存失败："+data.msg);
// 				}
				var flag=$("#flag").val();
				var myid=$("#myid").val()
				
				save(flag,myid);
				 return false; //阻止表单跳转。如果需要表单跳转，去掉这段即可。
				 
			});

		});
	</script>
</body>
</html>