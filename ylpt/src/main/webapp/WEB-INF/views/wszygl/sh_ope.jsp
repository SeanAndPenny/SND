<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/commons/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
<title>行政区划详细信息</title>
<%-- <script type="text/javascript" src="<c:url value="/static/commons/js/jquery.min.js"/>"></script>
<script type="text/javascript" src="<c:url value="/static/commons/js/jquery.form.js"/>"></script>
<script type="text/javascript" src="<c:url value="/static/layui/layui.js"/>"></script>

<!-- Csses -->
<link rel="stylesheet" type="text/css" href="<c:url value="/static/layui/css/layui.css"/>" /> --%>

<%@ include file="/commons/meta.jsp"%>
<script type="text/javascript">
function close(){
	var index = parent.layer.getFrameIndex(window.name); //先得到当前iframe层的索引
	parent.layer.close(index); //再执行关闭
}
		function sumbit(yljgdm) {
			var reason =$("#reason").val();
			var sqr = $("#sqr").val();
			var yljgmc = $("#yljgmc").val();
			var url = "${ctx}/operation/saveRequest.json?detailid=${model.gradeid}&yljgdm="
					+yljgdm+"&reason="+reason+"&sqr="+sqr+"&yljgmc"+yljgmc;
			
				$.ajax({
					url : url,
					
					type : "post",
					dataType : "json",
					async : false,
					success : function(data) {
						if (data.code == 0) {
							layui.layer.msg("申请成功");
							setTimeout("close()",1000);
						} else {
							layui.layer.msg("申请失败" + data.msg);
						}
					},
					error : function(e) {
						e;
						layui.layer.msg('操作异常，稍后请重试或联系管理员!');
						flag = false;
					}
				});
			
			
		}
		
		layui.use('form', function(){
			  var form = layui.form;
			//监听提交
				form.on('submit(formDemo)', function(data) {

					var yljgdm=$("#yljgdm").val();


					sumbit(yljgdm);
					 return false; //阻止表单跳转。如果需要表单跳转，去掉这段即可。
					 
				});

			});
	</script>
</head>
<body
	style="min-width: 1000px; min-height: 300px; min-width: 480px; height: 300px">
	<div id="queryform" class="layui-form" style="background: #FFFFFF;">
		<table style="width: 100%">
			<tr>
				<td style="width: 33%">
					<div class="layui-form-item" style="margin-top: 20px;">
						<div class="layui-inline">
							<label class="layui-form-label">申请机构名称</label>
							<div class="layui-input-block">
								<select id="yljgdm" name="yljgdm" lay-search>
									<option value="">请选择医疗机构</option>
									<c:forEach items="${jgList}" var="jg">
										<option value="${jg.jgdm}" <c:if  test="${jg.jgdm  eq  yljgdm}"> selected="selected"</c:if>>${jg.jgmc}</option>
									</c:forEach>
							</select>
							</div>
						</div>
					</div>

				</td>
				<td style="width: 33%">
					<div class="layui-form-item" style="margin-top: 20px;">
						<div class="layui-inline">
							<label class="layui-form-label">申请手术名称</label>
							<div class="layui-input-block">
								<input type="text" name="oldcode"  value="${model.gopename}"
									disabled="disabled" autocomplete="off" class="layui-input">
							</div>
						</div>
					</div>
				</td>
				
			</tr>
			<tr>
				<td style="width: 33%">
					<div class="layui-form-item" style="margin-top: 20px;">
						<div class="layui-inline">
							<label class="layui-form-label">申请原因</label>
							<div class="layui-input-block">
								<input type="text" name="reason" id="reason" class="layui-input">
							</div>
						</div>
					</div>
				</td>
				<td style="width: 33%">
					<div class="layui-form-item" style="margin-top: 20px;">
						<div class="layui-inline">
							<label class="layui-form-label">申请人</label>
							<div class="layui-input-block">
								<input type="text" name="sqr" 
									 id="sqr" value="${name }" class="layui-input">
							</div>
						</div>
					</div>
				</td>
			</tr>
			<tr>
				<td style="width: 22%">
					<div class="layui-form-item">
						<div class="layui-input-block">
							<button button class="layui-btn" lay-submit lay-filter="formDemo">申请</button>
						</div>
					</div>
				</td>
			</tr>
		</table>
	</div>
	
</body>
</html>