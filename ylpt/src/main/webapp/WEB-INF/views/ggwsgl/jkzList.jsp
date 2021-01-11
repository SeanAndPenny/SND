<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/commons/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
<title>健康证</title>
<%@ include file="/commons/meta.jsp"%>
<script type="text/javascript" src="<c:url value="/static/commons/js/echarts/echarts.js"/>"></script>
<script type="text/javascript">

function chart01(id,moth,values){
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
   	            data: ['发证人数']
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
		        data: moth
		    },
		    yAxis: {
		    	type:'value',name:'人数(人)'
		    },
		    series: [{
		    	name:'发证人数',
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
function getechatsdata(yljgdm,startdate,enddate){
    $.ajax({
    	url: "${ctx}/jkz/jkzecharts.json?p_yljgdm="+yljgdm+"&p_startdate="+startdate+"&p_enddate="+enddate,
    	 datatype:"json",
    	context: document.body, 
    	success: function(data){
    		 var nodes=eval(data);
    		var hh= JSON.stringify(nodes);
    		 var xx=JSON.parse(hh);
    		 var fianl=xx.tbList;
    		 var month=new Array();
         	var zsum=new Array();
    		 for (var i=0;i<fianl.length;i++)
		         	{
		         		month[i]=fianl[i].jgmc;
		         		zsum[i]=fianl[i].rs;
		         	}
         	
         	chart01('map',month,zsum);
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
                url: '${ctx}/jkz/jkz',
                method:'post',
                where:{p_yljgdm:$("#yljgdm").val(),p_startdate:$("#startdate").val(),p_enddate:$("#enddate").val()},          
                cols: [[
                	{field: 'tjjg', title: '机构名称', width: '220'},
                    {field: 'xm', title: '姓名', width: '80'},
                    {field: 'xb', title: '性别', width: '80'},
                    {field: 'sfz', title: '身份证号', width: '200'},
                    {field: 'hy', title: '行业', width: '120'},                    
                    {field: 'tjrq', title: '体检日期', width: '150'},
                    {field: 'ysxm', title: '检查医生', width: '120'},
                    {field: 'jl', title: '检查结果', width: '150'},
                    {field: 'sffz', title: '是否发证', width: '100'},
                    
                     ]],
                height: '400',
                width:'auto',
                page: {
                    layout:['count','pre','page','next','skip','limit'],
                    groups:5,
                    first:'首页',
                    last:'尾页',
                    limit:10,
                    limits:[5,10,20]
                },done: function(res, curr, count){                	
                	var yljgdm=$("#yljgdm").val();
                	var startdate=$("#startdate").val();
                	var enddate=$("#enddate").val();
                	getechatsdata(yljgdm,startdate,enddate);
	
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
	<div id="queryform" class="layui-form" style="background: #FFFFFF">
		<table style="width: 100%">
			<tr>
			
				<td style="width: 33.3%" >
					<div class="layui-form-item" style="margin-top: 20px;">
						<label class="layui-form-label label3">开始时间</label>
						<div class="layui-input-inline input3">
							<input type="text" id="startdate" name="startdate"  autocomplete="off"
								class="layui-input .input2">
						</div>
					</div>
				</td>
				<td style="width: 33.3%" >
					<div class="layui-form-item" style="margin-top: 20px;">
						<label class="layui-form-label label3">结束时间</label>
						<div class="layui-input-inline input3"> 
						<input type="text" id="enddate" name="enddate" autocomplete="off"
								class="layui-input .input2">
						</div>
					</div>
				</td>
				
			</tr>
			
			<tr>
				<td style="width: 33.3%" >
					<div class="layui-form-item" style="margin-top: 20px;">
						<label class="layui-form-label label3">机构名称</label>
						<div class="layui-input-inline input3">
							<select id="yljgdm" name="yljgdm" lay-search>
								<option value="">医疗机构</option>
								<c:forEach items="${jgList}" var="jg">
									<option value="${jg.jgdm}">${jg.jgmc}</option>
								</c:forEach>
							</select>	
						</div>
					</div>
					
				</td>
<!-- 				<td style="width: 33.3%"> -->
<!-- 					<div class="layui-form-item"> -->
<!-- 						<label class="layui-form-label label3">单点系统</label> -->
<!-- 						<div class="layui-input-inline "> -->
<!-- 							<select id="platform" name="platform" lay-search> -->
<!-- 							<option value="">单点系统</option> -->
<%-- 							<c:forEach items="${xtList }" var="xt"> --%>
<%-- 								<option value="${xt.PKEY }">${xt.PNAME }</option> --%>
<%-- 							</c:forEach> --%>
<!-- 						</select> -->
<!-- 						</div> -->
<!-- 					</div> -->
<!-- 				</td> -->
			
				<td>
					<div class="layui-form-item">
						<div class="layui-input-block">
							<button class="layui-btn" onclick="search();">查询</button>
						</div>
					</div>
				</td>
				<td>
				</td>
				<td>
				</td>
			</tr>
		</table>
	</div>
	<div id="map" style="width: 100%; height:350px;background:#FFFFFF;margin-top:15px;">
	</div>
	<div style="width:100%;background: #FFFFFF;margin:35px auto;">
		 <table id="querytable" class="layui-table" lay-filter="querytab" style="margin:-10px;"></table>
			<div id="laypage"></div>
	</div>

</body>
<script type="text/html" id="toolbar">
  	<a class="layui-btn layui-btn-primary layui-btn-xs" lay-event="detail">明细</a>
	<a class="layui-btn layui-btn-primary layui-btn-xs" lay-event="del">删除</a>
</script>
</html>