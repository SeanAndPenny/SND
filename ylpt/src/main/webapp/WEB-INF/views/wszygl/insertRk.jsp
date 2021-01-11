<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/commons/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
<title>2型糖尿病患者填写</title>
<%@ include file="/commons/meta.jsp"%>
<script type="text/javascript" src="<c:url value="/static/commons/js/echarts/echarts.js"/>"></script>
<script type="text/javascript">
function getData(){
        layui.use(['table','layer','laydate'] , function(){
            var table = layui.table;
            var laydate=layui.laydate;
            
            laydate.render({ 
          	  elem: '#enddate' ,
          	type: 'year'
          });
            table.render({
                elem:'#querytable',
                url: '${ctx}/gwtnbglbb/insertTnbsl',
                method:'post'
              });
        });
    }
    
	$(document).ready(function(){
		getData();
	});
	//保存
	function toBc() {
		var reg=/^\+?[1-9][0-9]*$/;
		  if($("#yljgdm").val() == '' || $("#yljgdm").val() == null){
			  layer.msg("请选择机构");
		}else if(!reg.test($("#rksl").val())){
			layer.msg("数字格式错误或未填");
		      }else  if($("#enddate").val() == '' || $("#enddate").val() == null){
		    	  layer.msg("请选择填报时间");
		}else if($("#xm").val() == '' || $("#xm").val() == null){
				  layer.msg("请填写报告人姓名");	
		}else{
			  $.ajax({
	        type:"get",
	        url:"${ctx}/gwsjtb/saveHt.json?yljgdm="+$("#yljgdm").val()+"&rksl="+$("#rksl").val()+"&enddate="+$("#enddate").val()+"&p_pz="+'${pz}'+"&p_xm="+$("#xm").val(),
	        dataType:'json',
	        success:function(data){
				if(data.code=='0'){
					layer.msg("保存成功");
					 
				}else{
					layer.msg("保存失败："+data.msg);
				}
	        }
	    });  
		}   
		
	}

</script>
</head>
<body style="background: #F9F9F9;overflow:scroll;" >
	<div id="queryform" class="layui-form" style="background: #FFFFFF">
		<table style="width: 100%">
			<tr>
				<td style="width: 25%">
					<div class="layui-form-item" style="margin-top: 20px;">
						<label class="layui-form-label label3">机构名称</label>
						<div class="layui-input-inline input3">
							<select id="yljgdm" name="yljgdm" lay-search>
								<option value="">医疗机构</option>
								<c:forEach items="${jgList}" var="jg">
									<option value="${jg.jgdm}">${jg.jgmc}</option>
								</c:forEach>
							</select>
						</div>
					</div>
				</td>
				<td style="width: 25%">
					<div class="layui-form-item"
						style="margin-top: 20px; margin-left: -36px;">
						<label class="layui-form-label label3"><%=request.getAttribute("pz3")%></label>
						<div class="layui-input-inline input3">
							<input type="text" id="rksl" name="rksl" autocomplete="off"
								class="layui-input .input2">
						</div>
					</div>
				</td>
				<td style="width: 25%">
					<div class="layui-form-item" style="margin-top: 20px;margin-left: 200px;">
						<label class="layui-form-label label3"
							style="margin-left: -276px;">填写时间</label>
						<div class="layui-input-inline input3"
							style="margin-left: -140px;">
							<input type="text" id="enddate" name="enddate" autocomplete="off"
								class="layui-input .input2">
						</div>
					</div>
				</td>
				<td style="width: 25%">
					<div class="layui-form-item"
						style="margin-top: 20px; margin-left: -105px;">
						<label class="layui-form-label label3">填报人姓名</label>
						<div class="layui-input-inline input3">
							<input type="text" id="xm" name="xm" autocomplete="off"
								class="layui-input .input2">
						</div>
					</div>
				</td>
			</tr>
			<tr>
				<td>
					<div class="layui-input-block">
							<button class="layui-btn" onclick="toBc();">保存</button>
					</div>
				</td>
			</tr>
		</table>
	</div>
</body>

</html>