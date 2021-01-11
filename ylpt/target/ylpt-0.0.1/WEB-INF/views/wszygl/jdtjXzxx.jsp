<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/commons/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
<title>建档下钻</title>
<%@ include file="/commons/meta.jsp"%>
<script type="text/javascript" src="<c:url value="/static/commons/js/echarts/echarts.js"/>"></script>
 
</head>
<body style="background: #F9F9F9;overflow:scroll;" >
	 
	<div id="jcecharts" style="width: 100%; height: 80%;"></div> <script
            type="text/javascript">    
	var yljgmcList =<%=request.getAttribute("yljgmcList")%>;
	var lxmcList =<%=request.getAttribute("lxmcList")%>;
	var rsList =<%=request.getAttribute("rsList")%>;
	var blList =<%=request.getAttribute("blList")%>;
	 
    var myChart = echarts.init(document.getElementById('jcecharts'));
    option = {
    		title: {  
    	    	 text: lxmcList[0]+'统计',
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
    	        data:['人数','比率%']
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
    	            data: yljgmcList,
    	            axisPointer: {
    	                type: 'shadow'
    	            }
    	        }
    	    ],
    	    yAxis: [
    	        {
    	            type: 'value',
    	            name: '人数',
    	            min: 0,
    	            max: 99999,
    	            interval: 10000,
    	            axisLabel: {
    	                formatter: '{value} '
    	            }
    	        },
    	        {
    	            type: 'value',
    	            name: '比率%',
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
    	            name:'人数',
    	            type:'bar',
    	            data:rsList
    	        } ,
    	        {
    	            name:'比率%',
    	            type:'line',
    	            yAxisIndex: 1,
    	            data:blList
    	        }
    	    ]
};
    myChart.setOption(option);
   
 </script>
	 
</body>
 
</html>