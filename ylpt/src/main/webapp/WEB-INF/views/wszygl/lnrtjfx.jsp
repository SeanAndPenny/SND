<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/commons/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
<title>531分析</title>
<%@ include file="/commons/meta.jsp"%>
<script type="text/javascript"
	src="<c:url value="/static/commons/js/echarts/echarts.js"/>"></script>
<script type="text/javascript"
	src="<c:url value="/static/commons/js/3.js"/>"></script>
<script type="text/javascript"
	src="<c:url value="/static/commons/js/4.js"/>"></script>
<script type="text/javascript"
	src="<c:url value="/static/commons/js/5.js"/>"></script>
<script type="text/javascript"
	src="<c:url value="/static/commons/js/6.js"/>"></script>

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
	            
	        }); 
}
function sjly01(id,startdate, enddate,yljgdm){ 
	var nameList =<%=request.getAttribute("nameList")%>;
	 
	Highcharts.chart(id, {
		 
		series: [{
			type: 'venn',
			name: '531心血管及脑卒中筛查',
			events: {
			            click: function(e) {
			            	 
			            	if(e.point.x==0){
			            		//心血管
			            		window.open("${ctx}/LnrXnXz/LnrXnXz?p_startdate="+startdate+"&p_enddate="+enddate+"&p_yljgdm="+yljgdm); 	
			            	}
			            	if(e.point.x==1){
			            		//脑卒中
			            		window.open("${ctx}/LnrNczXz/LnrNczXz?p_startdate="+startdate+"&p_enddate="+enddate+"&p_yljgdm="+yljgdm); 	
			            	}
			            	if(e.point.x==2){
			            		//同时患有脑卒中和心血管
			            		window.open("${ctx}/LnrNczXxgXz/LnrNczXxgXz?p_startdate="+startdate+"&p_enddate="+enddate+"&p_yljgdm="+yljgdm); 	
			            	}
			            	
			            	
			        }
			    },
			 
			data: [{

				<c:forEach var="Xg" items="${lnrtjXgfxList}">
	            
				sets:['${Xg.xxjblxmc}'],value :${Xg.xxjbrs},
				name: '心血管'+'${Xg.xxzb}' 
	            </c:forEach>
			}, {
                 <c:forEach var="Cz" items="${lnrtjCzfxList}">
	            
				sets:['${Cz.nczlxmc}'],value :${Cz.nczrs},
				name: '脑卒中'+'${Cz.nczzb}' 
	            </c:forEach> 
			}, {

           <c:forEach var="CzXg" items="${lnrtjCzXgfxList}">

				sets:nameList ,value :${CzXg.gtrs}, 
				name: '同时拥有'+'${CzXg.gtzb}'
	           
	            </c:forEach>

			}]
		}],
		title: {
			text: '531心血管及脑卒中筛查'
		}
	});
	}
function sjly02(id,startdate, enddate,yljgdm){ 
	var gxytnbNameList =<%=request.getAttribute("gxytnbNameList")%>;
	 
	Highcharts.chart(id, {
		 
		series: [{
			type: 'venn',
			name: '531高血压及糖尿病筛查',
			events: {
			            click: function(e) {
			            	  
			            	if(e.point.x==0){
			            		//高血压
			            		window.open("${ctx}/LnrGxyXz/LnrGxyXz?p_startdate="+startdate+"&p_enddate="+enddate+"&p_yljgdm="+yljgdm); 	
			            	}
			            	 if(e.point.x==1){
			            		//糖尿病
			            		window.open("${ctx}/LnrTnbXz/LnrTnbXz?p_startdate="+startdate+"&p_enddate="+enddate+"&p_yljgdm="+yljgdm); 	
			            	}
			            	if(e.point.x==2){
			            		//同时患有高血压和糖尿病
			            		window.open("${ctx}/LnrGxyTnbXz/LnrGxyTnbXz?p_startdate="+startdate+"&p_enddate="+enddate+"&p_yljgdm="+yljgdm); 	
			            	} 
			            	
			            	
			        }
			    },
			 
			data: [{

				<c:forEach var="Gxy" items="${lnrGxyfxList}">
	            
				sets:['${Gxy.gxylxmc}'],value :${Gxy.gxyrs},
				name: '高血压'+'${Gxy.gxyzb}' 
	            </c:forEach>
			}, {
                 <c:forEach var="Tnb" items="${lnrTnbfxList}">
	            
				sets:['${Tnb.tnblxmc}'],value :${Tnb.tnbrs},
				name: '糖尿病'+'${Tnb.tnbzb}' 
	            </c:forEach> 
			}, {

           <c:forEach var="GxyTnb" items="${lnrGxyTnbfxList}">

				sets:gxytnbNameList ,value :${GxyTnb.gxytnbrs}, 
				name: '同时拥有'+'${GxyTnb.gxytnbzb}'
	           
	            </c:forEach>

			}]
		}],
		title: {
			text: '531高血压及糖尿病筛查'
		}
	});
	}
	
	
 
	function search() {
		 window.location.href="${ctx}/lnrtjfx/lnrtjfx?p_startdate="+$("#startdate").val()
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


	</div>
</body>

</html>