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
</head>
<body style="background: #F9F9F9;overflow:scroll;overflow-y:hidden" >
  <div id="queryform" class="layui-form" style="background: #FFFFFF;">
    <table style="width: 100%">  
     <c:forEach items="${medicalPersonTxModel}" var="medicalPersonTxModel">    
      <tr>
        <td style="width: 33%" >
          <div class="layui-form-item" style="margin-top: 15px;">
            <label class="layui-form-label label3">提醒次数</label>
            <div class="layui-input-inline input3">
              <input  type="text" name="oldcode" value="${medicalPersonTxModel.txcs}" disabled="disabled"  autocomplete="off"  class="layui-input">
            </div>
          </div>
          
        </td>
      
        <td style="width: 35%" >
          <div class="layui-form-item" style="margin-top: 20px;">
            <label class="layui-form-label label3">提醒时间</label>
            <div class="layui-input-inline input3">
              <input  type="text" name="oldcode" value="${medicalPersonTxModel.txdate}" disabled="disabled"  autocomplete="off"  class="layui-input">
            </div>
          </div>
        </td>
        </td>
      
        <td   >
          <div class="layui-form-item" style="margin-top: 20px;">
            <label class="layui-form-label label3"> 提醒内容</label>
            <div class="layui-input-inline input3">
              <input  type="text" name="oldcode" value="${medicalPersonTxModel.txnr}" disabled="disabled"  autocomplete="off"  class="layui-input">
            </div>
          </div>
        </td>
      </tr>
      </c:forEach>
    </table>
  </div>

</body>

</html>