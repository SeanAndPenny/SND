<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/commons/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
<title>人员下钻科室</title>
<%@ include file="/commons/meta.jsp"%>
<script type="text/javascript" src="<c:url value="/static/commons/js/echarts/echarts.js"/>"></script>
<script type="text/javascript">
 
function chart01(id,cyks,month){
	 	var myChart=echarts.init(document.getElementById(id));
	var option = {
			
			tooltip : {
        		trigger: 'axis',
        		axisPointer : {            // 坐标轴指示器，坐标轴触发有效
            	type : 'shadow',        // 默认为直线，可选为：'line' | 'shadow'
            	formatter: '{b}<br/>{c}'
        		}
   			},
   			color:['#60C0DD'],
   			legend: {
   	            data: ["出院科室统计"]
   	        },
	   	    grid: {
        				left: '5%',
        				right: '5%',
        				bottom: '3%',
        				containLabel: true
    				},
		   	 axisLabel: {  
              interval: 0,  
              formatter:function(value)  
              { 
            	 
                  var ret = "";//拼接加\n返回的类目项  
                  var maxLength = 3;//每项显示文字个数  
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
		    xAxis: {
		        type: 'category',
		        data: cyks
		    },
		    yAxis: {
		    	type:'value',
		    	name:'人数(人)'
		    },
		    series: [{
		    	name: "出院科室统计",
		        type: 'bar',
		        barWidth:60,
		        data: month
		    }],
		    label: {
		        normal: {
		            show: true,
		            position: 'top',
		            textStyle: {
		              color: 'black'
		            }
		        }
		     }
		};
	  myChart.setOption(option);
	  
	  
	  myChart.on('click', function(param) { 
			  window.open("${ctx}/ryxz/ryxzry?p_jb="+jb+"&p_zc="+zc+"&p_jgdm="+jgdm[param.dataIndex]
			  +"&p_ksdm="+ksdm[param.dataIndex]
			   );  
				
					});
}

function getechatsdata(yljgdm,rq){
	
    $.ajax({
    	url: "${ctx}/ssywjcCyKs/ssywjcCyKsecharts.json?p_yljgdm="+yljgdm+"&p_rq="+rq,
    	 datatype:"json",
    	context: document.body, 
    	success: function(data){
    		 var nodes=eval(data);
    		var hh= JSON.stringify(nodes);
    		 var xx=JSON.parse(hh);
    		 var fianl=xx.ssywjcCyKsechartsList;
    		  
    		 var cyks=new Array();
    		 var month=new Array();
         	  
    		 for (var i=0;i<fianl.length;i++)
		         	{   
    			      cyks[i]=fianl[i].cyks;
		         		 
		         		month[i]=fianl[i].rs;
		         		 
		         	}
         	
         	chart01('map',cyks,month);
    		}
      	});
    
}



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
                url: '${ctx}/ssywjcCyKs/ssywjcCyKs',
                method:'post',
                where:{
                	p_yljgdm : '${yljgdm}',
                    p_rq : '${rq}' 
                },          
                cols: [[
                	{field: 'yljgmc', title: '机构名称', width: '300'},
                    {field: 'cyks', title: '出院科室', width: '300'},
                    {field: 'cysj', title: '出院时间', width: '300'},
                    {field: 'xm', title: '姓名', width: '300'},
                    {field: 'xb', title: '性别', width: '300'}
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
                	 var yljgdm='${yljgdm}';
                	 var rq='${rq}'
                     
                	getechatsdata(yljgdm,rq);
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
	 
	<div id="map" style="width: 100%; height:350px;background:#FFFFFF;margin-top:15px;">
	</div>
	<div style="width:100%;background: #FFFFFF;margin:35px auto;">
		 <table id="querytable" class="layui-table" lay-filter="querytab" style="margin:-10px;"></table>
			<div id="laypage"></div>
	</div>

</body>

</html>