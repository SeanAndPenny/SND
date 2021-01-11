<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/commons/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
<title>病案手术下钻详细</title>
<%@ include file="/commons/meta.jsp"%>
<script type="text/javascript" src="<c:url value="/static/commons/js/echarts/echarts.js"/>"></script>
<script type="text/javascript">

function getData(){
        layui.use(['table','layer','laydate'] , function(){
            var table = layui.table;
            var laydate=layui.laydate;
            laydate.render({ 
            	  elem: '#startdate' 
            });
            laydate.render({ 
          	  elem: '#enddate' 
          });
            table.render({
                elem:'#querytable',
                url: '${ctx}/zybass/zybass',
                method:'post',
                where:{
                	p_kssj : '${kssj}',
                	p_jssj : '${jssj}',
                   p_jgdm : '${jgdm}' 
                  
                },          
                cols: [[
                	{field: 'yljgmc', title: '机构名称', width: '300'},
                    {field: 'ssmc', title: '手术名称', width: '500'},
                    {field: 'rs', title: '手术数量', width: '300'}
                     
                   
                  
                                    
                   
                    
                     ]],
                height: '400',
               
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
	 
	 
	<div style="width:90%;background: #FFFFFF;margin:35px auto;">
		 <table id="querytable" class="layui-table" lay-filter="querytab" style="margin:-10px;"></table>
			<div id="laypage"></div>
	</div>

</body>

</html>