<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/commons/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
<title>死亡年龄段分析下钻</title>
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
<style type="text/css">
 
 
/* 表格头部背景色 */
th {
    background-color: #1572D5; /* MediumSeaGreen */
    color: #fff;
    font-weight: bold

</style>


<script type="text/javascript">
$(document).ready(function(){
	$(document).ready(function(){
		chart06('chart06');
		chart07('chart07');
		 var nldbm ='<%=request.getParameter("p_nldbm")%>';
		 var jgdm ='<%=request.getParameter("p_yljgdm")%>';
		 var ksnf ='<%=request.getParameter("p_ksnf")%>';
		 var jsnf ='<%=request.getParameter("p_jsnf")%>';
		 var jbflbm=[];
		 <c:forEach var="getechars07List" items="${getechars07List}">
	     {
	    	 jbflbm.push({
	    		 value:"${getechars07List.jbflbm}"
	   	    })
	       
	     }
	     </c:forEach>
		getquery('',nldbm,jgdm,ksnf,jsnf);	
	  });
  });

</script>

<script type="text/javascript">
function chart06(id){
	 
	  var myChart=echarts.init(document.getElementById(id));
	    myChart.dispose();
	    myChart = echarts.init(document.getElementById(id)); 
	  var option = { 
	       title: {
	                text: '各区死亡人数',  
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
	            tooltip : {
	              trigger: 'axis',
	              axisPointer : {            // 坐标轴指示器，坐标轴触发有效
	                type : 'shadow',        // 默认为直线，可选为：'line' | 'shadow'
	              },
	              
	           },
	            color:'#1572D5',
	                xAxis: {
	                  type: 'category',
	                  name:'乡镇',
	                    data:  [<c:forEach var="getechars06List" items="${getechars06List}">
	                       {
	                           value:"${getechars06List.dqfl}"
	                         },
	                         </c:forEach>]
	                    	
	                    	/* dqfl */
	                },
	                yAxis: {
	                  name:'死亡人数',
	                    type: 'value'
	                },
	                series: [{
	                	 barWidth:40,
	                    data:  [<c:forEach var="getechars06List" items="${getechars06List}">
	                       {
	                           value:"${getechars06List.swrs}"
	                         },
	                         </c:forEach>],
	                    type: 'bar',
	                    showBackground: true,  
	                }]
	    };
	    myChart.setOption(option);
	}
	function chart07(id) {
	 var nldbm ='<%=request.getParameter("p_nldbm")%>';
	 var jgdm ='<%=request.getParameter("p_yljgdm")%>';
	 var ksnf ='<%=request.getParameter("p_ksnf")%>';
	 var jsnf ='<%=request.getParameter("p_jsnf")%>';
	 var jbflbm=[];
	 <c:forEach var="getechars07List" items="${getechars07List}">
     {
    	 jbflbm.push({
    		 value:"${getechars07List.jbflbm}"
   	    })
       
     }
     </c:forEach>
	 
	    var myChart = echarts.init(document.getElementById(id));
	      myChart.dispose();
	      myChart = echarts.init(document.getElementById(id));
	      
	      option = {
	          tooltip: {
	              trigger: "axis",
	              axisPointer: {
	                  type: "shadow"
	              }
	          },
	          title: {
	                text: '各死因分类人数',  
	            }, 
	          grid: {
	              // left: "22%",
	              containLabel: true,
	              left: 0,
	              right: "12%",
	              bottom: "0%",
	              top: "4%"
	          },
	          xAxis: {
	              type: "value",
	              
	              boundaryGap: true,
	              axisTick: {
	                  show: false
	              },
	              axisLabel: {
	                  show: false,
	              },
	              splitLine: {
	                  show: false,
	              },
	              axisLine: {
	                  show: false,
	              },
	          },
	          yAxis: {
	              type: "category",
	              axisTick: {
	                  show: false
	              },
	              axisLine: {
	                  show: false
	              },
	              axisLabel: {
	                  interval: 0,
	                  color: "#333",
	                  fontSize: 14,
	              },
	              data: [
                      
                      <c:forEach var="getechars07List" items="${getechars07List}">
                    {
                      value:"${getechars07List.jbflmc}"
                    },
                    </c:forEach>
                    ] 
	          },
	          color: "#43bcf4",
	          series: [
	              {   
	                  type: "bar",
	                  itemStyle: {
	                      normal: {
	                          color: "#ffecc8",
	                          barBorderRadius: [3, 3, 3, 3]
	                      }
	                  },
	                  label: {
	                      show: true,
	                      position: "right",
	                      fontSize: 14,
	                      color: "#333",
	                      padding: [0, 0, 0, 10],
	                      formatter: function (params) {
	                         
	                          return params.data.value2
	                      }

	                  },
	                  barWidth: 10,
	                  barGap: "-100%",
	                  barCategoryGap: "40%", 
	                  animation: false
	              },
	              {
	                  type: "bar",
	                  barWidth: 10,
	                  itemStyle: {
	                      color: "#ffb820",
	                      barBorderRadius: [3, 3, 3, 3],
	                  },
	                  data: [
	                      
	                      <c:forEach var="getechars07List" items="${getechars07List}">
	                    {
	                      value:"${getechars07List.swrs}"
	                    },
	                    </c:forEach>
	                    ] ,
	              }
	          ]
	      };
	      myChart.setOption(option);
	      myChart.on('click', function(params) { 
	    	  
	    	  getquery(jbflbm[params.dataIndex].value,nldbm,jgdm,ksnf,jsnf)
	             }); 
	  };
</script>
<script type="text/javascript">
function  getquery(jbflbm,nldbm,jgdm,ksnf,jsnf){
 	 document.getElementById("idname").style.display="";//显示
 	 
 	layui.use([ 'table', 'layer' ], function() {
 		var table = layui.table;
 		table.render({
 					elem : '#querytable',
 					url : '${ctx}/swxxfx/getquery',
 					method : 'post',
 					where : { 
 						p_jbflbm : jbflbm,
						p_nldbm : nldbm,
						p_jgdm : jgdm,
						p_ksnf : ksnf,
						p_jsnf : jsnf,
 					},
 					cols : [[ 
 						{ field : 'name', title : '姓名', width : '150' }, 
	                    { field : 'xb', title : '性别', width : '150' },
	                    { field : 'csrq', title : '出生日期', width : '150' }, 
	                    { field : 'age', title : '死亡年龄', width : '150' } ,
	                    { field : 'swrq', title : '死亡日期', width : '150' } ,
	                    { field : 'swyy', title : '死亡原因', width : '250' } ,
	                    { field : 'jbflmc', title : '疾病分类名称', width : '200' },
	                    { field : 'dqfl', title : '所属地区', width : '150' }
 	                     

 					]],
 					height : '500',
 					page : {
 						layout : [ 'count', 'pre', 'page', 'next', 'skip',
 								'limit' ],
 						groups : 5,
 						first : '首页',
 						last : '尾页',
 						limit : 10,
 						limits : [ 5, 10, 20 ]
 					},
 					done : function(res, curr, count) {
 						 	 
 					}
 				});
 });
 	 
 }

</script>
</head>
<body>
 
	 
		 
		 
		 <div style="width: 100%;">
		<div id="chart06"
			style="width: 50%; height: 400px; background: #FFFFFF; margin-top: 2px"></div>
		<div id="chart07"
			style="width: 50%; height:400px; background: #FFFFFF; margin-left: 674px;margin-top: -400px;"></div>
	 </div>
	 <div id="idname"
			style="width: 100%; background: #FFFFFF; margin: 35px auto; margin-top: 15px; display: none">
			<table id="querytable" class="layui-table" lay-filter="querytab"
				style="margin: -10px;"></table>

		</div>
</body>

 
</html>