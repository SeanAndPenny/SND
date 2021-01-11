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

function chart01(id,sl1,sl2,sl3,sl4,sl5,sl6,mc,yljgmc,lj){

	var colors = ['#00adf4','#86cb68','#9884f3','#6288d1',
        '#066fd8','#627da3', '#9684f2', '#ee7a8d',
        '#ffc231','#57c5a2', '#76caf4','#527df9'];
	var myChart=echarts.init(document.getElementById(id));
    myChart.dispose();
    myChart = echarts.init(document.getElementById(id));
	var option = { 

            color: colors,


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
                data: mc 
            },
            axisLabel: {  
                interval: 0,  
                formatter:function(value)  
                { 
                 
                    var ret = "";//拼接加\n返回的类目项  
                    var maxLength = 4;//每项显示文字个数  
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
                    data: yljgmc,
                    axisPointer: {
                        type: 'shadow'
                    }
                }
            ],
            yAxis: [
                {
                    type: 'value',
                    name: '数量',
                    min: 0,
                    max: 10000,
                    interval: 1000,
                    axisLabel: {
                        formatter: '{value} '
                    }
                },
                {
                    type: 'value',
                    name: '比率',
                    min: 0,
                    max: 100,
                    interval: 20,
                    axisLabel: {
                        formatter: '{value}%'
                    }
                }
            ],
            series: [
                {
                <c:forEach  var="mcpzList" items="${mcpzList}" varStatus="varStatus">
                   <c:if test="${varStatus.count ==1}">
                          name:"${mcpzList.mc}",
                   </c:if>
                </c:forEach>
               	 type:'bar',
                    data:sl1
                },
                {
               	 <c:forEach  var="mcpzList" items="${mcpzList}" varStatus="varStatus">
                    <c:if test="${varStatus.count ==2}">
                           name:"${mcpzList.mc}",
                    </c:if>
                 </c:forEach>
                	 type:'bar',
                     data:sl2
                },
                {
               	 <c:forEach  var="mcpzList" items="${mcpzList}" varStatus="varStatus">
                    <c:if test="${varStatus.count ==3}">
                           name:"${mcpzList.mc}",
                    </c:if>
                 </c:forEach>
                	 type:'bar',
                     data: sl3
                },
                {
               	 <c:forEach  var="mcpzList" items="${mcpzList}" varStatus="varStatus">
                    <c:if test="${varStatus.count ==4}">
                           name:"${mcpzList.mc}",
                    </c:if>
                 </c:forEach>
                	 type:'bar',
                     data: sl4
                },
                {
               	 <c:forEach  var="mcpzList" items="${mcpzList}" varStatus="varStatus">
                    <c:if test="${varStatus.count ==5}">
                           name:"${mcpzList.mc}",
                    </c:if>
                 </c:forEach>
                	 type:'bar',
                     data:sl5
                },
                {
               	 <c:forEach  var="mcpzList" items="${mcpzList}" varStatus="varStatus">
                    <c:if test="${varStatus.count ==6}">
                           name:"${mcpzList.mc}",
                    </c:if>
        </c:forEach>
                	 type:'bar',
                     data:sl6
                },
                
            ]
		};
	  myChart.setOption(option);
	  myChart.on('click', function(param) {  
		  
		   }); 
}

function getechatsdata(kssj,jssj,jgdm,lj){
	 
    $.ajax({
    	url: "${ctx}/xxx/xxx.json?p_ywbz="+'${ywbz}'+'&p_yxbz='+'${yxbz}'
    			  +'&p_kssj='+kssj
    			  +"&p_jssj="+jssj
    			  +"&p_jgdm="+jgdm
    			  +"&p_tjsjwd=1",
    			
    			
    			
    	 datatype:"json",
    	context: document.body, 
    	success: function(data){
    		 var nodes=eval(data);
    		var hh= JSON.stringify(nodes);
    		 var xx=JSON.parse(hh);
    		 var fianl=xx.xxxlist;
    		 var fian2=xx.mcpzList;
    		 var yljgmc=new Array();
    		 var sl1=new Array();
    		 var sl2=new Array();
    		 var sl3=new Array();
    		 var sl4=new Array();
    		 var sl5=new Array();
         	 var sl6=new Array(); 
         	 var mc=new Array();
         	 var ii=0;
        	 var jj=0;
        	 var tab = document.getElementById("querytable1") ;
         	 var $tbl = $("#querytable1");
             $tbl.html('');
            
   		 $tbl.append('<thead><tr>')
   		 $tbl.append('<th  nowrap="nowrap" style="width: 120px;font-weight:bolder;">'
       	          +'机构名称'+'</th>')
         	 for (var j=0;j<fian2.length;j++){
         		 mc[j]=fian2[j].mc;
         		 ii=j+2
         		  
 	         	$tbl.append(  
 	         			'<th  nowrap="nowrap" style="width: 120px;font-weight:bolder;">'
                          +fian2[j].mc+'</th>' );
	         	 }
   		$tbl.append('</tr></thead>')
		 
		 
		 $tbl.append('<tfoot>  ')
    		 for (var i=0;i<fianl.length;i++) {
    			 yljgmc[i]=fianl[i].yljgmc;
		         	 sl1[i]=fianl[i].sl1;
		         	 sl2[i]=fianl[i].sl2; 
		         	 sl3[i]=fianl[i].sl3;
		         	 sl4[i]=fianl[i].sl4; 
		         	 sl5[i]=fianl[i].sl5;
		         	 sl6[i]=fianl[i].sl6; 
		         	  
		         	
   		$tbl.append('<tr>'
		         +'<td  nowrap="nowrap" style="width: 120px;font-weight:bolder;">'
	             +fianl[i].yljgmc 
	             +'</td>' 
	            
	            	 
	             
	             +'<td  nowrap="nowrap" style="width: 120px;font-weight:bolder;">'
	             +fianl[i].sl1 
	             +'</td>'
	             +'<td  nowrap="nowrap" style="width: 120px;font-weight:bolder;">'
	             +fianl[i].sl2
	             +'</td>'
	             +'<td  nowrap="nowrap" style="width: 120px;font-weight:bolder;">'
	             +fianl[i].sl3 
	             +'</td>'
	             +'<td  nowrap="nowrap" style="width: 120px;font-weight:bolder;">'
	             +fianl[i].sl4
	             +'</td>'
	             +'<td  nowrap="nowrap" style="width: 120px;font-weight:bolder;">'
	             +fianl[i].sl5
	             +'</td>'
	             +'<td  nowrap="nowrap" style="width: 120px;font-weight:bolder;">'
	             +fianl[i].sl6
	             +'</td>'
	             
	              );
		  
		   $tbl.append('</tr>');
		         }

            $tbl.append('</tfoot>  ');
            var rows = tab.rows.length ;
            var q=0
             if(fianl.length>0){
           	    q  = tab.rows.item(1).cells.length  ; 
           	    
             }
               for(var i=1;i<=q-ii;i++){
              		 for(var j=1;j<=jj;j++){
              		tab.rows[j].deleteCell(ii);  	 
              		 }
              	 }   
              	 
              	 
         	
         	 chart01('map',sl1,sl2,sl3,sl4,sl5,sl6,mc,yljgmc,lj); 
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
	   var kssj=$("#kssj").val()+$("#jdpz").val().replace('0','/');
	   var jssj=$("#kssj").val()+$("#jdpz").val().replace('0','/');
	   
	  var jgdm=$("#yljgdm").val();
	  if(jgdm=="" ||jgdm==null){
		  jgdm='${jgdm}'  
	  }
	  var lj='${lj}' 
	 getechatsdata(kssj,jssj,jgdm,lj); 
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
				<span class="canter" >查询时间：</span> <input type="text"
						id="kssj" readonly="readonly"
						onClick="WdatePicker({dateFmt:'yyyy'})" value="${gwsj }"
						class="Wdate" style="width: 100px" /> 
						</div>
					</td>

				<td style="width: 35%">
				 <label class="layui-form-label label3">季度选择</label>
				<div class="layui-input-inline input3">
               		 <select id="jdpz" name="jdpz">
                  		<option value = "01" ${gwjd=="/1"?'selected':''}>第1季度</option>
				  		<option value = "02" ${gwjd=="/2"?'selected':''}>第2季度</option>
				  		<option value = "03" ${gwjd=="/3"?'selected':''}>第3季度</option>
				  		<option value = "04" ${gwjd=="/4"?'selected':''}>第4季度</option>
					</select>
				</div>
				  </td>
				
			 
				<td style="width: 25%" >
					<div class="layui-form-item" style="margin-top: 20px; margin-left: -176px;">
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
	<div id="map" style="width: 80%; height:380px;background:#FFFFFF;margin-top:15px;margin-left: 110px;">
	</div>
	 <div class="layui-tab-content" style="margin-left: 200px;">
		<div class="layui-tab-item layui-show">
			<table id="querytable1" cellpadding="0" cellspacing="0"
				border="1">
			</table>
		</div>
	</div>

</body>
 
</html>