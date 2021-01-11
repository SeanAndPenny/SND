<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/commons/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
<title>各乡镇死亡人口分布</title>
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
	chart03('chart03');
  });
function chart03(id){

 

  var myChart=echarts.init(document.getElementById(id));
    myChart.dispose();
    myChart = echarts.init(document.getElementById(id));
    option = { 
        color : [ '#188df0', '#DD228F', '#7cb5ec', '#f6ae6e',
          '#adff2f', '#444446', '#799aec', '#61d4e2',
          '#6b8e23', '#87ceeb', '#b8860b', '#32cd32' ],
          title: {
                  text: '死亡人口区域分布',  
              },
        
             legend: {
                 orient: 'vertical',
                 left: 'center',
                 itemHeight: 7,
                 itemWidth: 7,
                 itemGap: 25,
                 width: 200,
                 height: 30,
                 bottom: 20,
                 data: [
                     
                     <c:forEach var="swxxfxecharsList" items="${swxxfxecharsList}">
                   {
                     name  :"${swxxfxecharsList.dqfl}" 
                   },
                   </c:forEach>
                   ]
             },
             series: [
                 {
                     type: 'pie',
                     radius: ['48%', '59%'],
                     center: ['50%', '50%'],
                     avoidLabelOverlap: false,
                     hoverOffset: 8,//悬浮偏移距离
                     label: {
                         show: true,
                         fontSize: 13,
                         formatter: function (params) {
                             return "{a|" + params.data.name + ":" + "共" + params.data.value + "条}" + "{b|(" + params.percent + "%})"
                         },
                         lineHeight: 18,
                         rich: {
                             a: {
                                 color: "#333",
                                 fontSize: 12
                             },
                             b: {
                                 color: "#333333",
                                 fontSize: 13
                             }
                         }
                     },
                     labelLine: {
                         show: true,
                         length: 10,
                         length2: 15
                     },
                     data: [
                         
                         <c:forEach var="swxxfxecharsList" items="${swxxfxecharsList}">
                       {
                         name  :"${swxxfxecharsList.dqfl}" ,value:"${swxxfxecharsList.xzrs}"
                       },
                       </c:forEach>
                       ]
                 }
             ]
      };

    myChart.setOption(option); 
    //模块高亮
    myChart.dispatchAction({
        type: 'highlight',
        dataIndex: 0,
    });
    //离开其中一个模块高亮取消，默认第一块高亮
    myChart.on("mouseout", function (params) {
        console.log(params);
        myChart.dispatchAction({
            type: 'downplay',
            dataIndex: params.dataIndex,
        });
        myChart.dispatchAction({
            type: 'highlight',
            dataIndex: 0,
        });
    });
    //鼠标移入此模块高亮，之前的模块高亮取消
    myChart.on("mouseover", function (params) {
      myChart.dispatchAction({
            type: 'highlight',
            dataIndex: params.dataIndex,
        });
      myChart.dispatchAction({
            type: 'downplay',
            dataIndex: params.dataIndex == 0 ? 1 : 0,
        });
    });
}
 
</script>
</head>
<body>
	 
	<div id="chart03"
			style="width: 100%; height: 100%; background: #FFFFFF;"></div>

</body>

 
</html>