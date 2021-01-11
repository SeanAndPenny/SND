<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/commons/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
<title>人员下钻详细</title>
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
                url: '${ctx}/ryxz/ryxzry',
                method:'post',
                where:{
                	p_jb : '${jb}',
                    p_zc : '${zc}',
                   p_jgdm : '${jgdm}',
                   p_ksdm : '${ksdm}'
                },          
                cols: [[
                	{field: 'org_name', title: '机构名称', width: '190'},
                    {field: 'name', title: '姓名', width: '190'},
                    {field: 'sex_name', title: '性别', width: '190'},
                    {field: 'dept_name', title: '科室', width: '190'}, 
                    {field : 'sfzh', title : '身份证', width : '190' } ,
                    { field : 'highstudy', title : '学历', width : '190'},
                    { field : 'title', title : '职称', width : '190' }
                   
                  
                                    
                   
                    
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
                	 var jb='${jb}';
                	 var zc='${zc}'
                    var jgdm='${jgdm}'
                	 
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