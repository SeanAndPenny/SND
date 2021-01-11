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
    <body style=" min-height: 200px;min-width: 400px;height:250px " >
    <div style="margin-top: 50px">
  <form class="layui-form" action="${ctx}/mdeical/saveHt">
	  <div class="layui-form-item">
		  	<div class="layui-inline">
			    <label class="layui-form-label">名字</label>
			    <div class="layui-input-block">
			      <input type="text"  value="${medicalPersonModel.unitname}" disabled="disabled"  autocomplete="off"  class="layui-input">
			      <input  id='oldname' name="oldname" value="${medicalPersonModel.unitname}" type="hidden" lay-verify="required">
			    </div>
	   		</div>
	  		<div class="layui-inline">
			    <label class="layui-form-label">身份证号</label>
			    <div class="layui-input-block">
			     	<input type="text"  value="${medicalPersonModel.idcard}" disabled="disabled"  autocomplete="off"  class="layui-input">
			      	<input  id='oldname' name="oldname" value="${medicalPersonModel.idcard}" type="hidden" lay-verify="required">
			    </div>
	  		</div>
	  </div>
	  <div class="layui-form-item">
		  	<div class="layui-inline">
			    <label class="layui-form-label">合同开始时间</label>
			    <div class="layui-input-block">
			      <input type="text" id='starttime' name="starttime" lay-verify="required" autocomplete="off" class="layui-input">
			    </div>
	  		</div>
	  		<div class="layui-inline">
			    <label class="layui-form-label">合同结束时间</label>
			    <div class="layui-input-block">
			      <input type="text" id='endtime' name="endtime" lay-verify="required" autocomplete="off" class="layui-input">
			    </div>
	  		</div>
	  </div>
	  <div class="layui-form-item">
		  	<div class="layui-inline">
			    <label class="layui-form-label">签约合同机构</label>
			    <div class="layui-input-block">
			      	<select id="yljgdm" name="yljgdm"  lay-verify="required">
								<option value="">医疗机构</option>
								<c:forEach items="${jgList}" var="jg">
									<option value="${jg.jgdm}">${jg.jgmc}</option>
								</c:forEach>
					</select>	
			    </div>
	  		</div>
	  		
	  </div>

	<div class="layui-form-item">
	    <div class="layui-input-block">
	      <button class="layui-btn" lay-submit lay-filter="formDemo" >立即提交</button>
	      <button type="reset" class="layui-btn layui-btn-primary">重置</button>
		</div>
  	</div>
  </form>
	<%@ include file="/commons/bootstrap-bottom.jsp" %>
	
	</div>
	<script>
	
	 layui.use(['layer','laydate'] , function(){
         var laydate=layui.laydate;
         laydate.render({ 
         	  elem: '#starttime' 
         });
         laydate.render({ 
       	  elem: '#endtime' 
       });
	 });
	function close(){
		var index = parent.layer.getFrameIndex(window.name); //先得到当前iframe层的索引
		parent.layer.close(index); //再执行关闭
	}
	function save(starttime,endtime,yljgdm){  
		var id="${id}";
		$.ajax({
	        type:"get",
	        url:"${ctx}/mdeical/saveHt.json?starttime="+starttime+"&endtime="+endtime+"&yljgdm="+yljgdm+"&id="+id,
	        dataType:'json',
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
				var starttime=$("#starttime").val()
				var endtime=$("#endtime").val()
				var yljgdm=$("#yljgdm").val()
				save(starttime,endtime,yljgdm);
				 return false; //阻止表单跳转。如果需要表单跳转，去掉这段即可。
				 
			});

		});
	</script>
</body>
</html>