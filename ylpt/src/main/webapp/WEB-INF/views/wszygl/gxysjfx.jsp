<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/commons/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
<title>高血压分析</title>
<%@ include file="/commons/meta.jsp"%>
<script type="text/javascript"
	src="<c:url value="/static/commons/js/echarts/echarts.js"/>"></script>
<script type="text/javascript"
	src="<c:url value="/static/commons/js/1.js"/>"></script>
<script type="text/javascript"
	src="<c:url value="/static/commons/js/2.js"/>"></script>

<script type="text/javascript">
$(document).ready(function() {
	 var startdate='${startdate }'
	 var enddate='${enddate }' 
	var yljgdm='${yljgdm }' 
   $("#enddate").val(enddate);
	$("#startdate").val(startdate);
	getData(startdate, enddate,yljgdm);
});

function getData(startdate, enddate,yljgdm) {
	layui.use([ 'table', 'layer', 'laydate' ], function() {
		var table = layui.table;
		var laydate = layui.laydate;
	});
	gxysjLyfxList(startdate, enddate,yljgdm); 
	}
function gxysjLyfxList(startdate, enddate,yljgdm) {
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
	            	url: '${ctx}/gxysjfx/gxysjfx',
	                method:'post',
	                where:{p_startdate:	startdate ,
	                	p_enddate: enddate,
	                	p_yljgdm:yljgdm}          
	               
	            });
	            
	            sjly01('map',startdate, enddate,yljgdm);
	            sjly02('map2',startdate, enddate,yljgdm);
	            sjly03('map3',startdate, enddate,yljgdm);
	            sjly04('map4',startdate, enddate,yljgdm);
	        }); 
}


function sjly01(id,startdate, enddate,yljgdm){
	var xxlybmList =<%=request.getAttribute("xxlybmList")%>; 
	var chart = Highcharts.chart(id, {
	chart: {
		type: 'pie',
		options3d: {
			enabled: true,
			alpha: 45,
			beta: 0
		}
	}, 
	title: {
		text: '高血压检测途径分析'
	},
	tooltip: {
		pointFormat: '{series.name}: <b>{point.percentage:.1f}%</b>'
	},
	plotOptions: {
		pie: {
			allowPointSelect: true,
			cursor: 'pointer',
			depth: 55,
			dataLabels: {
				enabled: true,
				format: '{point.name}'
			},
			  events: {
		            click: function(e) {	            	 
window.open("${ctx}/gxyJcXz/gxyJcXz?p_xxlybm="+xxlybmList[e.point.x]+
		 "&p_startdate="+startdate+"&p_enddate="+enddate+"&p_yljgdm="+yljgdm);   

		        }
		    },
		}
	},
	series: [{
		type: 'pie',
		name: '占比',
		data: [ 
			<c:forEach var="gxysjLyfx" items="${gxysjLyfxList}">
            
              [ "${gxysjLyfx.xxlymc}:${gxysjLyfx.lyrs} 人",
            	  ${gxysjLyfx.lyrs}]
            ,
            </c:forEach> 
		]
	}]
});  
	}
	

function sjly02(id,startdate, enddate,yljgdm){
 
	var sfxyList =<%=request.getAttribute("sfxyList")%>; 
	var chart = Highcharts.chart(id, {
	chart: {
		type: 'pie',
		options3d: {
			enabled: true,
			alpha: 45,
			beta: 0
		}
	}, 
	title: {
		text: '高血压吸烟分析'
	},
	tooltip: {
		pointFormat: '{series.name}: <b>{point.percentage:.1f}%</b>'
	},
	plotOptions: {
		pie: {
			allowPointSelect: true,
			cursor: 'pointer',
			depth: 55,
			dataLabels: {
				enabled: true,
				format: '{point.name}'
			},
			  events: {
		            click: function(e) {
		            	 
		            	 
window.open("${ctx}/gxyXyXz/gxyXyXz?p_sfxy="+sfxyList[e.point.x]+
		 "&p_startdate="+startdate+"&p_enddate="+enddate+"&p_yljgdm="+yljgdm);    

		        }
		    },
		}
	},
	series: [{
		type: 'pie',
		name: '占比',
		data: [ 
			<c:forEach var="gxyXyfx" items="${gxyXyfxList}">
            
              [ "${gxyXyfx.sfxymc}:${gxyXyfx.xyrs} 人",
            	  ${gxyXyfx.xyrs}]
            ,
            </c:forEach> 
		]
	}]
});  
	}
	
function sjly03(id,startdate, enddate,yljgdm){
	var wxfcList =<%=request.getAttribute("wxfcList")%>; 
	 
	var chart = Highcharts.chart(id, {
	chart: {
		type: 'pie',
		options3d: {
			enabled: true,
			alpha: 45,
			beta: 0
		}
	}, 
	title: {
		text: '高血压危险分层分析'
	},
	tooltip: {
		pointFormat: '{series.name}: <b>{point.percentage:.1f}%</b>'
	},
	plotOptions: {
		pie: {
			allowPointSelect: true,
			cursor: 'pointer',
			depth: 55,
			dataLabels: {
				enabled: true,
				format: '{point.name}'
			},
			  events: {
		            click: function(e) {	            	 
window.open("${ctx}/gxyWxfcXz/gxyWxfcXz?p_wxfc="+wxfcList[e.point.x]+
		 "&p_startdate="+startdate+"&p_enddate="+enddate+"&p_yljgdm="+yljgdm);    

		        }
		    },
		}
	},
	series: [{
		type: 'pie',
		name: '占比',
		data: [ 
			<c:forEach var="gxyWx" items="${gxyWxFcList}">
            
              [ "${gxyWx.wxfcmc}:${gxyWx.wxfcrs} 人",
            	  ${gxyWx.wxfcrs}]
            ,
            </c:forEach> 
		]
	}]
});  
	}
function sjly04(id,startdate, enddate,yljgdm){
	var nllxList =<%=request.getAttribute("nllxList")%>; 
	var chart = Highcharts.chart(id, {
	chart: {
		type: 'pie',
		options3d: {
			enabled: true,
			alpha: 45,
			beta: 0
		}
	}, 
	title: {
		text: '高血压年龄分析'
	},
	tooltip: {
		pointFormat: '{series.name}: <b>{point.percentage:.1f}%</b>'
	},
	plotOptions: {
		pie: {
			allowPointSelect: true,
			cursor: 'pointer',
			depth: 55,
			dataLabels: {
				enabled: true,
				format: '{point.name}'
			},
			  events: {
		            click: function(e) {         	 
window.open("${ctx}/gxyNlXz/gxyNlXz?p_nllx="+nllxList[e.point.x]+
		 "&p_startdate="+startdate+"&p_enddate="+enddate+"&p_yljgdm="+yljgdm);    

		        }
		    },
		}
	},
	series: [{
		type: 'pie',
		name: '占比',
		data: [ 
			<c:forEach var="gxyNl" items="${gxyNlFxList}">
            
              [ "${gxyNl.nllx}岁 :${gxyNl.nlrs} 人",
            	  ${gxyNl.nlrs}]
            ,
            </c:forEach> 
		]
	}]
});  
	}
	function search() {
		 window.location.href="${ctx}/gxysjfx/gxysjfx?p_startdate="+$("#startdate").val()
			+"&p_enddate="+$("#enddate").val()+"&p_yljgdm="+'${yljgdm}';
	}
</script>
</head>
<body style="background: #009FCC;overflow: scroll;">
	<div id="queryform" class="layui-form" style="margin-left: 93px;"
		style="background: #FFFFFF">
		<table style="width: 100%">
			<tr>
				<td style="width: 33.3%">
					<div class="layui-form-item" style="margin-top: 20px;">
						<label class="layui-form-label label3">开始时间</label>
						<div class="layui-input-inline input3">
							<input type="text" id="startdate" name="startdate"
								autocomplete="off" class="layui-input .input2">
						</div>
					</div>
				</td>
				<td style="width: 33.3%">
					<div class="layui-form-item" style="margin-top: 20px;">
						<label class="layui-form-label label3">结束时间</label>
						<div class="layui-input-inline input3">
							<input type="text" id="enddate" name="enddate" autocomplete="off"
								class="layui-input .input2">
						</div>
					</div>
				</td>
				<td>
					<div class="layui-form-item">
						<div class="layui-input-block">
							<button class="layui-btn" onclick="search();">查询</button>
						</div>
					</div>
				</td>

			</tr>
		</table>
	</div>
	<div style="margin-left: 100px;background:#009FCC;">

		<div id="map" style="width: 40%; height: 20%;"></div>
		<div id="map2"
			style="width: 40%; height: 20%; margin-left: 700px; margin-top: -400px;"></div>
		<div id="map3" style="width: 40%; height: 20%;"></div>
		<div id="map4"
			style="width: 40%; height: 20%; margin-left: 700px; margin-top: -400px;"></div>


	</div>
</body>

</html>