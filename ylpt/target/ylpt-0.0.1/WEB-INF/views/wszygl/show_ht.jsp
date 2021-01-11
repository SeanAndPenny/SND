<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/commons/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
<title>合同详细信息</title>
<%@ include file="/commons/meta.jsp"%>

<script type="text/javascript">

</script>
</head>
<body style="background: #F9F9F9;overflow:scroll;overflow-y:hidden" >
	<div id="queryform" class="layui-form" style="background: #FFFFFF;">
		<table style="width: 100%">			
			<tr>
				<td style="width: 33.3%" >
					<div class="layui-form-item" style="margin-top: 20px;">
						<label class="layui-form-label label3">姓名</label>
						<div class="layui-input-inline input3">
							<input  type="text" name="oldcode" value="${one.unitname}" disabled="disabled"  autocomplete="off"  class="layui-input">
						</div>
					</div>
					
				</td>
			
				<td style="width: 33.3%" >
					<div class="layui-form-item" style="margin-top: 20px;">
						<label class="layui-form-label label3">身份证</label>
						<div class="layui-input-inline input3">
							<input  type="text" name="oldcode" value="${one.idcard}" disabled="disabled"  autocomplete="off"  class="layui-input">
						</div>
					</div>
				</td>
				
			</tr>
			<tr>
				<td style="width: 33.3%" >
					<div class="layui-form-item" style="margin-top: 20px;">
						<label class="layui-form-label label3">合同签约时间</label>
						<div class="layui-input-inline input3">
							<input  type="text" name="oldcode" value="${one.starttime}" disabled="disabled"  autocomplete="off"  class="layui-input">
						</div>
					</div>
				</td>
				<td style="width: 33.3%" >
					<div class="layui-form-item" style="margin-top: 20px;">
						<label class="layui-form-label label3">合同到期时间</label>
						<div class="layui-input-inline input3">
							<input  type="text" name="oldcode" value="${one.endtime}" disabled="disabled"  autocomplete="off"  class="layui-input">
						</div>
					</div>
				</td>
			</tr>
			<tr>
			<td style="width: 33.3%" >
					<div class="layui-form-item" style="margin-top: 20px;">
						<label class="layui-form-label label3">合同单位</label>
						<div class="layui-input-inline input3">
							<input  type="text" name="oldcode" value="${one.yljgmc}" disabled="disabled"  autocomplete="off"  class="layui-input">
						</div>
					</div>
				</td>
			</tr>
		</table>
	</div>

</body>

</html>