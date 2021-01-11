<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/commons/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
<title>床位机构统计</title>
<%@ include file="/commons/meta.jsp"%>
<script type="text/javascript" src="<c:url value="/static/commons/js/echarts/echarts.js"/>"></script>
<script type="text/javascript">
 
function chart01(id,yljgdm,yljgmc,ids,hdcws,kfcws,dqsycws,sycws){
	 
	var myChart=echarts.init(document.getElementById(id));
	var option = {
			color:['#86cb68', '#00adf4', '#066fd8', 
				  '#87ceeb', '#32cd32' ],
	    tooltip : {
	        trigger: 'axis',
	        axisPointer : {            // 坐标轴指示器，坐标轴触发有效
	            type : 'shadow'        // 默认为直线，可选为：'line' | 'shadow'
	        }
	    },
	    legend: {
	        data:['核定床位','开放床位','当前床位','剩余床位']
	    },
	    grid: {
	        left: '3%',
	        right: '4%',
	        bottom: '3%',
	        containLabel: true
	    },
	    xAxis : [
	        {
	            type : 'category',
	            data : yljgmc,
	            name :'机构名称',
	            
	        }
	    ],
	    yAxis : [
	        {
	            type : 'value',
	            name :'人数',
	            
	        }
	    ],
	    series : [
	        {
	            name:'核定床位',
	            type:'bar',
	            data:hdcws,
	            
	        },
	        {
	            name:'开放床位',
	            type:'bar',
	            data:kfcws
	        },
	        {
	            name:'当前床位',
	            type:'bar',
	            data:dqsycws
	        } ,
	        {
	            name:'剩余床位',
	            type:'bar',
	            data:sycws
	        } 
	    ]
		};
	  myChart.setOption(option);
	  myChart.on('click', function(param) { 
		  
	 window.open("${ctx}/cwtjXzBq/cwtjXzBq?p_ids="+ids[0]+"&p_yljgdm="+yljgdm[param.dataIndex]
	 +"&p_index="+param.seriesIndex ); 
	});
}

function getechatsdata(id){
    $.ajax({
    	url: "${ctx}/cwtj/cwtjXzJgecharts.json?p_id="+id,
    	 datatype:"json",
    	context: document.body, 
    	success: function(data){
    		 var nodes=eval(data);
    		 var hh= JSON.stringify(nodes);
    		 var xx=JSON.parse(hh);
    		 var fianl=xx.cwtjXzJgechartsechartsList;
    		  
    		 var yljgdm=new Array();
    		 var yljgmc=new Array();
    		 var ids=new Array();
    		 var hdcws=new Array();
    		 var kfcws=new Array();
    		 var dqsycws=new Array();
    		 var sycws=new Array(); 
         	  
    		 for (var i=0;i<fianl.length;i++)
		         	{   
    			     yljgdm[i]=fianl[i].yljgdm;
    			     yljgmc[i]=fianl[i].yljgmc;
    			     ids[i]=fianl[i].id;	
    			     hdcws[i]=fianl[i].hdcws;	
    			     kfcws[i]=fianl[i].kfcws;	
    			     dqsycws[i]=fianl[i].dqsycws;
    			     sycws[i]=fianl[i].sycws;
		         		 
		         	}
    		 
         	
         	chart01('map',yljgdm,yljgmc,ids,hdcws,kfcws,dqsycws,sycws);
    		}
      	});
    
}



function getData(){
        layui.use(['table','layer','laydate'] , function(){
            var table = layui.table;
            var laydate=layui.laydate;
             
            table.render({
                elem:'#querytable',
                url: '${ctx}/cwtj/cwtjXzJg',
                method:'post',
                where:{
                	p_id : '${id}' 
                	 
                    
                },          
                cols: [[
                	 /* {field: 'yljgmc', title: '机构名称', width: '240'},
                	 {field: 'hdcws', title: '核定床位', width: '240'},
                    {field: 'kfcws', title: '开放床位', width: '240'},
                    {field: 'dqsycws', title: '当前床位', width: '240'},
                    {field: 'sycws', title: '剩余床位', width: '240'}   */
                  ]],
                    /* height: '400',
                
                page: {
                    layout:['count','pre','page','next','skip','limit'],
                    groups:5,
                    first:'首页',
                    last:'尾页',
                    limit:10,
                    limits:[5,10,20]
                }, */ 
				done: function(res, curr, count){                	
                	 var id='${id}';
                	 
                	 
                     
                	getechatsdata(id);
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
	 
	<div id="map" style="width: 92%; height:400px;background:#FFFFFF;margin-top:15px;">
	</div>
	<div style="width:100%;background: #FFFFFF;margin:35px auto;">
		 <table id="querytable" class="layui-table" lay-filter="querytab" style="margin:-10px;"></table>
			<div id="laypage"></div>
	</div>

</body>

</html>