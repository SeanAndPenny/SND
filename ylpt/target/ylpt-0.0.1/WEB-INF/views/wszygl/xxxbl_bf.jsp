<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/commons/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
<title>数据分析</title>
<%@ include file="/commons/meta.jsp"%>
<script type="text/javascript" src="<c:url value="/static/commons/js/echarts/echarts.js"/>"></script>
<script type="text/javascript"
	src="<c:url value="/static/commons/js/calendar/WdatePicker.js"/>"></script>
<script type="text/javascript">

function chart01(id,sl1,mc,mcdm,bl,jddm){ 
	alert(sl1[0])
	alert(sl1[1])
var colors = ['#00adf4','#86cb68','#9884f3','#6288d1',
        '#066fd8','#627da3', '#9684f2', '#ee7a8d',
        '#ffc231','#57c5a2', '#76caf4','#527df9'];
	var myChart=echarts.init(document.getElementById(id));
    myChart.dispose();
    myChart = echarts.init(document.getElementById(id));
	var option = { 
			color: colors,
			series: {
                type: 'pie',
                data: [
                    {name: mc[0]+"  人数:"+sl1[0]+"; 占比:"+bl[0], value: sl1[0]},
                    {name: mc[1]+"  人数"+sl1[1]+"; 占比:"+bl[1], value: sl1[1]},
                    ]
            }
		};
	  myChart.setOption(option);
	  myChart.on('click',function(param) {	
		   
		     if(param.name.match("流")){
			  window.open("${ctx}/xxx/xxx?p_ywbz=LDRK&p_yxbz=1&p_tjsjwd=0&p_jgdm="+jddm
					  +'&p_kssj='+$("#kssj").val()
	    			  +'&p_jssj='+$("#jssj").val()
			  );
			 
		   }else if (param.name.match("常")){
			   window.open("${ctx}/xxx/xxx?p_ywbz=CZRK&p_yxbz=1&p_tjsjwd=0&p_jgdm="+jddm
					   +'&p_kssj='+$("#kssj").val()
		    		   +'&p_jssj='+$("#jssj").val()	   
			   ); 
		   }  
		 
	  }
	  )
}
 
function getechatsdata(kssj,jssj,jgdm,lj,wdtj){
	var jddm=$("#jddm").val();
	  if(jddm=="" ||jddm==null){
		  jddm='${jddm}'  
	  } 
    $.ajax({
    	url: "${ctx}/rkzb/rkzb.json?p_kssj="+kssj
    			  +"&p_jssj="+jssj
    			  +"&p_yljgdm="+jddm
    			  ,
    			
    			
    			
    	 datatype:"json",
    	context: document.body, 
    	success: function(data){
    		 var nodes=eval(data);
    		var hh= JSON.stringify(nodes);
    		 var xx=JSON.parse(hh);
    		 var fianl=xx.xxxBllist;
    		 
    		 
    		 var sl1=new Array();
    		 var mc=new Array();
    		 var mcdm=new Array();
    		 var bl=new Array();
    		 
         	 for (var i=0;i<fianl.length;i++) { 
         		 
	         	 sl1[i]=fianl[i].sl;
	         	 mc[i]=fianl[i].mc; 
	         	 mcdm[i]=fianl[i].mcdm;
	         	bl[i]=fianl[i].bl;
         	 }
         	 chart01('map',sl1,mc,mcdm,bl,jddm); 
    		}
    	
      	});
	
}
 

function getData(){
	layui.use(['table','layer','laydate'] , function(){
        var table = layui.table;
        var laydate=layui.laydate;
        laydate.render({ 
      	  elem: '#enddate',
      	type: 'year'
      });
    });
	   var kssj=$("#kssj").val();
	   var jssj=$("#jssj").val();
	  var jddm=$("#jddm").val();
	  if(jssj<kssj){
		  alert("选择的结束时间请大于或等于开始时间")
		  return;
	  }
	 getechatsdata(kssj,jssj,jddm); 
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
			
				<td style="width: 25%">
				  <div  style="margin-left: 132px;">
				<span class="canter" >开始时间：</span> <input type="text"
						id="kssj" readonly="readonly"
						onClick="WdatePicker({dateFmt:'yyyy-MM-dd'})" value="2019-01-01"
						class="Wdate" style="width: 100px" /> 
						</div>
					</td>

				 <td style="width: 25%">
				  <div  style="margin-left: 15px;">
				<span class="canter" >结束时间：</span> <input type="text"
						id="jssj" readonly="readonly"
						onClick="WdatePicker({dateFmt:'yyyy-MM-dd'})" value="${jssj }"
						class="Wdate" style="width: 100px" /> 
						</div>
					</td>
				
			 
				<td style="width: 25%" >
					<div class="layui-form-item" style="margin-top: 20px; margin-left: -176px;">
						<label class="layui-form-label label3">乡镇名称</label>
						<div class="layui-input-inline input3">
							<select id="jddm" name=""jddm"" lay-search>
								<option value="">全区</option>
								<c:forEach items="${jdList}" var="jg">
									<option value="${jg.jgdm}">${jg.jgmc}</option>
								</c:forEach>
							</select>	
						</div>
					</div>
					
				</td>
 
			 
				<td>
					<div class="layui-form-item">
						<div class="layui-input-block"    style=" margin-left: -176px;">
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
	<div id="map" style="width: 100%; height:380px;background:#FFFFFF;margin-top:15px;align:center;">
	</div>
	 
	<div class="layui-tab-content" style="margin-left: 50px;">
		<div class="layui-tab-item layui-show">
			<table id="querytable1" cellpadding="0" cellspacing="0"style="width: 80%";
				border="1">
			</table>
		</div>
	</div>

</body>
 
</html>