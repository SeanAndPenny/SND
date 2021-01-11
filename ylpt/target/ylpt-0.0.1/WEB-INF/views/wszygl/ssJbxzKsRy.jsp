<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/commons/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
<title>手术级别人员统计</title>
<%@ include file="/commons/meta.jsp"%>
<script type="text/javascript" src="<c:url value="/static/commons/js/echarts/echarts.js"/>"></script>
<script type="text/javascript">

function getData(){
        layui.use(['table','layer','laydate'] , function(){
            var table = layui.table;
            var laydate=layui.laydate;
             
            table.render({
                elem:'#querytable',
                url: '${ctx}/ssJbxzKsRy/ssJbxzKsRy',
                method:'post',
                where:{
                	p_ssjb : '${ssjb}', 
                   p_yljgdm : '${yljgdm}',
                   p_ksbm : '${ksbm}'
                },          
                cols: [[
                	{field: 'yljgmc', title: '机构名称', width: '240'},
                    {field: 'sqks', title: '申请科室', width: '240'},
                     {field: 'rq', title: '手术开始日期', width: '240'},
                     {field: 'ssczmc', title: '手术操作名称', width: '240'},
                     {field: 'ssqzd', title: '术前诊断', width: '240'},
                     {field: 'sshzd', title: '术后诊断', width: '240'},
                     {field: 'ssysxm', title: '手术医生姓名', width: '240'},
                     {field: 'mzysxm', title: '麻醉医生姓名', width: '240'}
                   
                  
                                    
                   
                    
                     ]],
                height: '700',
                width:'auto',
                page: {
                    layout:['count','pre','page','next','skip','limit'],
                    groups:5,
                    first:'首页',
                    last:'尾页',
                    limit:10,
                    limits:[5,10,20]
                },done: function(res, curr, count){                	
                	  
                	 
                }
            });
        //监听工具条
            table.on('tool(querytab)', function(obj){ //注：tool是工具条事件名，test是table原始容器的属性 lay-filter="对应的值"
                var data = obj.data //获得当前行数据
                    ,layEvent = obj.event; //获得 lay-event 对应的值
				if (layEvent === 'detail') {
					
				}else if(layEvent === 'del'){
			
				}
			});
        });
    }
    
	$(document).ready(function(){
		getData();
	});
		
	function search() {
        getData();
    }
</script>
</head>
<body style="background: #F9F9F9;overflow:scroll;" >
	 
	 
	<div style="width:100%;background: #FFFFFF;margin:35px auto;">
		 <table id="querytable" class="layui-table" lay-filter="querytab" style="margin:-10px;"></table>
			<div id="laypage"></div>
	</div>

</body>

</html>