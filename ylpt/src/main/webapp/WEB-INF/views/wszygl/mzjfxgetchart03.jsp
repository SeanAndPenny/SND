<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/commons/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
<title>基层门诊分析</title>
<link rel="stylesheet" type="text/css"
	href="<c:url value="/static/layui/css/layui.css"/>" />
<script type="text/javascript"
	src="<c:url value="/static/layui/layui.js"/>"></script>
<link rel="stylesheet" type="text/css"
	href="<c:url value="/static/commons/css/reset2.css"/>" />

<link rel="stylesheet" type="text/css"
	href="<c:url value="/static/commons/css/index2.css"/>" />

<link rel="stylesheet" type="text/css"
	href="<c:url value="/static/commons/js/My97DatePicker/skin/WdatePicker.css"/>" />


<script type="text/javascript"
	src="<c:url value="/static/commons/js/jquery3-1.11.1.min.js"/>"></script>

<script type="text/javascript"
	src="<c:url value="/static/commons/js/echarts2.min.js"/>"></script>

<script type="text/javascript"
	src="<c:url value="/static/commons/js/calendar/WdatePicker.js"/>"></script>

<style>
html, body {
	background: #ededed;
	height: 100%;
	width: 100%;
}
</style>



<script type="text/javascript">
 
$(document).ready(function(){
	chart09('chart09') ;
  });

</script> 
<script type="text/javascript">
 
  function chart09(id){ 
    var myChart=echarts.init(document.getElementById(id));
      myChart.dispose();
      myChart = echarts.init(document.getElementById(id)); 
    var option = { 
         title: {
                  text: '门诊人数',  
              }, 
              tooltip : {
                trigger: 'axis',
                axisPointer : {            // 坐标轴指示器，坐标轴触发有效
                  type : 'shadow',        // 默认为直线，可选为：'line' | 'shadow'
                },
                
             },
              color:'#00adf4',
                  xAxis: {
                    type: 'category',
                    name:'机构名称',
                      data:[<c:forEach var="getMjzywechartsList" items="${getMjzywechartsList}">
                      {
                          value:"${getMjzywechartsList.yljgmc}"
                        },
                        </c:forEach>]
                      
                      
                  },
                  yAxis: {
                    name:'门诊人数',
                      type: 'value'
                  },
                  series: [{
                	  barWidth: 40,
                      data: [<c:forEach var="getMjzywechartsList" items="${getMjzywechartsList}">
                      {
                          value:"${getMjzywechartsList.mzrs}"
                        },
                        </c:forEach>],
                      type: 'bar',
                      showBackground: true,  
                  }]
      };
      myChart.setOption(option);
          
  }
</script>
</head>
<body>
	 
		
		<div id="chart09"
			style="width: 100%; height: 400px; background: #FFFFFF; margin-top: 45px"></div>
 
	 
</body>

 
</html>