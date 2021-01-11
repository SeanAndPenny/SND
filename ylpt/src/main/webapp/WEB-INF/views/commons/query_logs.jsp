<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/commons/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
<title>系统日志查询</title>
<%@ include file="/commons/meta.jsp"%>
<script type="text/javascript" src="<c:url value="/static/commons/js/echarts/echarts.js"/>"></script>
<script type="text/javascript">
	function chart01(id,names,values){
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
						        data: names
						    },
						    yAxis: {
						    	type:'value',name:'次数(次)'
						    },
						    series: [{
						    	name:'登录次数',
						        type: 'bar',
						        barWidth:60,
						        data: values
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
	}


		function getData(){
		        layui.use(['table','layer','laydate'] , function(){
		               
		            var table = layui.table;
		            table.render({
		                elem:'#querytable',
		                url: '${ctx}/logs/check',
		                method:'post',
		                where:{p_starttime:$("#starttime").val(),p_endtime:$("#endtime").val()},          
		                cols: [[
		                    {field: 'name', title: '系统名', width: '50%'},
		                    {field: 'cs', title: '登录次数', width: '50%'}
		                   
		                     ]],
		                height: '500',
		                page: {
		                    layout:['count','pre','page','next','skip','limit'],
		                    groups:5,
		                    first:'首页',
		                    last:'尾页',
		                    limit:10,
		                    limits:[5,10,20]
		                },done: function(res, curr, count){
		                	 var nodes=eval(res.data);
		             		var hh= JSON.stringify(nodes);
		             		 var xx=JSON.parse(hh);
		           
		             		 var names=new Array();
		                  	var zsum=new Array();
		             		 for (var i=0;i<xx.length;i++)
		         		         	{
		             					names[i]=xx[i].name;
		         		         		zsum[i]=xx[i].cs;
		         		         	}
		                  	
		                  	chart01('map',names,zsum);
		                }
		            });
		        //监听工具条
		            table.on('tool(querytab)', function(obj){ //注：tool是工具条事件名，test是table原始容器的属性 lay-filter="对应的值"
		                var data = obj.data //获得当前行数据
		                    ,layEvent = obj.event; //获得 lay-event 对应的值
						if (layEvent === 'detail') {										
							
							
						}else if(layEvent === 'edit'){
							
						}else  if(layEvent === 'tx'){
							
						}
					});
		        });
		    }
    
	$(document).ready(function(){
		  layui.use(['table','layer','laydate'] , function(){
	            var laydate=layui.laydate;
	            laydate.render({ 
	            	  elem: '#starttime' ,
	            	  value: new Date()
	            	  
	            });
	            laydate.render({ 
	          	  elem: '#endtime' ,
	          		value: new Date()
	          	});
	          getData();
	      });
		
	});
		
	function search() {
        getData();      
    }
</script>
</head>
<body style="background: #F9F9F9;" >
	<div id="queryform" class="layui-form" style="background: #FFFFFF;" >
		<table style="width: 100%">
			<tr>		
				<td style="width: 33.3%" >
					<div class="layui-form-item" style="margin-top: 20px;">
						<label class="layui-form-label label3">开始时间</label>
						<div class="layui-input-inline input3">
							<input type="text" id="starttime" name="starttime"  autocomplete="off"
								class="layui-input .input2">
						</div>
					</div>
				</td>
				<td style="width: 33.3%" >
					<div class="layui-form-item" style="margin-top: 20px;">
						<label class="layui-form-label label3">结束时间</label>
						<div class="layui-input-inline input3"> 
						<input type="text" id=endtime name="endtime" autocomplete="off"
								class="layui-input .input2">
						</div>
					</div>
				</td>
				<td style="width: 33.3%">
					<div class="layui-form-item" style="margin-top: 20px;">
						<div class="layui-input-block">
							<button class="layui-btn" onclick="search();">查询</button>
						</div>
					</div>
				</td>
			</tr>
			
		</table>
		
	</div>
	<div id="map" style="width: 100%; height: 350px;background:#FFFFFF;margin-top:15px;">
	</div>
	<div style="width:100%;background: #FFFFFF;margin:25px auto;">
		 <table id="querytable" class="layui-table" lay-filter="querytab" style="margin:-10px;"></table>
			<div id="laypage"></div>
	</div>

</body>
<script type="text/html" id="toolbar">
  	<a class="layui-btn layui-btn-primary layui-btn-xs" lay-event="detail">合同明细</a>
	<a class="layui-btn layui-btn-xs" lay-event="edit">新增合同</a>
	<a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="tx">查看提醒</a>
</script>
</html>