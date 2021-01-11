<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@ include file="/commons/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
<title>合同详细信息</title>
<%@ include file="/commons/meta.jsp"%>

<script type="text/javascript">
function close(){
  var index = parent.layer.getFrameIndex(window.name); //先得到当前iframe层的索引
  parent.layer.close(index); //再执行关闭
}

layui.use(['layer'] , function(){
  layer=layui.layer;
  layer.msg("${successrMsg}");
  setTimeout("close()",1000);
  
});
  
</script>
</head>
<body style="background: #F9F9F9;overflow:scroll;overflow-y:hidden" >
  
</body>

</html>