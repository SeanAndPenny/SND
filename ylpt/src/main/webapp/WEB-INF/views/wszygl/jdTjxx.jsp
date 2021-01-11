<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/commons/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
<title>建档统计</title>
<%@ include file="/commons/meta.jsp"%>
<script type="text/javascript" src="<c:url value="/static/commons/js/echarts/echarts.js"/>"></script>
<script type="text/javascript">
 
function chart01(id,yljgmc,sl,bl){	
  var myChart=echarts.init(document.getElementById(id));
  var option = {
  		title: {  
	    	 text: '建档统计',
	    	 left: ''
	    		    },
		color:['#188df0','red',],
	    tooltip: {
	        trigger: 'axis',
	        axisPointer: {
	            type: 'cross',
	            crossStyle: {
	                color: '#999'
	            }
	        }
	    },
	    toolbox: {
	        feature: {
	            dataView: {show: true, readOnly: false},
	            magicType: {show: true, type: ['line', 'bar']},
	            restore: {show: true},
	            saveAsImage: {show: true}
	        }
	    },
	    
	    legend: {
	        data:['建档人数','比率%']
	    },
	    axisLabel: {  
             interval: 0,  
             formatter:function(value)  
             { 
           	 
                 var ret = "";//拼接加\n返回的类目项  
                 var maxLength = 2;//每项显示文字个数  
                 var valLength = value.length;//X轴类目项的文字个数  
                 var rowN = Math.ceil(valLength / maxLength); //类目项需要换行的行数  
                 if (rowN > 1)//如果类目项的文字大于3,  
                 {  
                     for (var i = 0; i < rowN; i++) {  
                         var temp = "";//每次截取的字符串  
                         var start = i * maxLength;//开始截取的位置  
                         var end = start + maxLength;//结束截取的位置  
                         //这里也可以加一个是否是最后一行的判断，但是不加也没有影响，那就不加吧  
                         temp = value.substring(start, end) + "\n";  
                         ret += temp; //凭借最终的字符串  
                     }  
                     return ret;  
                 }  
                 else {  
                     return value;  
                 }  
             }  
         },
	    xAxis: [
	        {
	            type: 'category',
	            data: yljgmc,
	            axisPointer: {
	                type: 'shadow'
	            }
	        }
	    ],
	    yAxis: [
	        {
	            type: 'value',
	            name: '建档人数',
	            min: 0,
	            max: 199999,
	            interval: 50000,
	            axisLabel: {
	                formatter: '{value} '
	            }
	        },
	        {
	            type: 'value',
	            name: '比率',
	            min: 0,
	            max: 100,
	            interval: 20,
	            axisLabel: {
	                formatter: '{value} %'
	            }
	        }
	    ],
	    series: [
	        {
	            name:'建档人数',
	            type:'bar',
	            data:sl
	        } ,
	        {
	            name:'比率%',
	            type:'line',
	            yAxisIndex: 1,
	            data:bl
	        }
	    ]
    };
    myChart.setOption(option);
   
}

function getechatsdata(){
 
    $.ajax({
      url: "${ctx}/jdTjxx/jdTjxxecharts.json",
       datatype:"json",
      context: document.body, 
      success: function(data){
         var nodes=eval(data);
         var hh= JSON.stringify(nodes);
         var xx=JSON.parse(hh);
         var fianl=xx.jdTjxxechartslist;
         var yljgmc=new Array();
         var sl=new Array();
         var bl=new Array();
            
             
         for (var i=0;i<fianl.length;i++)
               {   
        	 yljgmc[i]=fianl[i].yljgmc; 
        	 sl[i]=fianl[i].sl; 
        	 bl[i]=fianl[i].bl;  
                  
               }
           
           chart01('map',yljgmc,sl,bl);
        }
        });
    
}



function getData(){
        layui.use(['table','layer','laydate'] , function(){
            var table = layui.table;
            var laydate=layui.laydate;
             
            table.render({
                elem:'#querytable',
                url : '${ctx}/jdTjxx/jdTjxx',
                method:'post',       
                cols: [[
                	{ field : 'dz', title : '机构名称', width : '25%' },
                    { field : 'zrs', title : '建档总人数', width : '20%' },
                    { field : 'jdhjrs', title : '户籍建档人数', width : '20%' },
                    { field : 'fjdhjrs', title : '非户籍建档人数', width : '20%' },
                    { field : 'qtrs', title : '其他建档人数', width : '20%' }
                  ]],
                    height: '400',
                   page: {
                    layout:['count','pre','page','next','skip','limit'],
                    groups:5,
                    first:'首页',
                    last:'尾页',
                    limit:10,
                    limits:[5,10,20]
                },    
        done: function(res, curr, count){                  
                  getechatsdata();
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
   
  <div id="map" style="width: 100%; height:500px;background:#FFFFFF;margin-top:15px;">
  </div>
  <div style="width:90%;background: #FFFFFF;margin:35px auto;">
     <table id="querytable" class="layui-table" lay-filter="querytab" style="margin:-10px;"></table>
      <div id="laypage"></div>
  </div>
 
</body>

</html>