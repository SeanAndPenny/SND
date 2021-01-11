<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/commons/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
<title>登陆管理</title>
<%@ include file="/commons/meta.jsp"%>
<script type="text/javascript">
function getData(){
        layui.use('table', function(){
            var table = layui.table;
            table.render({
                elem:'#querytable',
                url: '${ctx}/platLogin/queryDetail',
                method:'post',
                where:{p_platloginname:$("#platloginname").val(),p_platname:$("#platname").val()},          
                cols: [[
                    {field: 'platloginname', title: '账户名',width: '50%'},
                    {field: 'logintime', title: '登陆时间', width: '50%'}
                     ]],
                height: 'auto',
//                 width:'auto',
                page: {
                    layout:['count','pre','page','next','skip','limit'],
                    groups:5,
                    first:'首页',
                    last:'尾页',
                    limit:5,
                    limits:[5,10,20]
                }
            });
        });
    }
    
	$(document).ready(function(){
		getData();
	});

</script>
</head>
<body style="background: #F9F9F9;overflow:hidden;" >
	<input type="hidden" id="platloginname" value="${platloginname}">
	<input type="hidden" id="platname" value="${platname}">
	<div style="width:100%;background: #FFFFFF;margin:25px auto;">
		 <table id="querytable" class="layui-table" lay-filter="querytab" style="margin:-10px;"></table>
			<div id="laypage"></div>
	</div>

</body>


</html>