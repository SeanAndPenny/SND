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

function chart01(id,sl1,sl2,sl3,sl4,sl5,sl6,mc,yljgmc,lj,ywzw,yljgdm){ 
	var ywbz='${ywbz}'; 
	  
	var colors = ['#00adf4','#86cb68','#9884f3','#6288d1',
        '#066fd8','#627da3', '#9684f2', '#ee7a8d',
        '#ffc231','#57c5a2', '#76caf4','#527df9'];
	var myChart=echarts.init(document.getElementById(id));
    myChart.dispose();
    myChart = echarts.init(document.getElementById(id));
	var option = { 

            color: colors,

            title: {
                text: ywzw+'分析'
            },
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
                    name: '机构名称' ,
                    data: yljgmc,
                    axisPointer: {
                        type: 'shadow'
                    }
                }
            ],
            yAxis: [
                {
                    type: 'value',
                    name: '数量' 
                    
                     
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
/*                 {
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
 */                
            ]
		};
	  myChart.setOption(option);
	  myChart.on('click', function(param) {  
		 
		
		   window.open("${ctx}/ywxxXz/ywxxXz?p_lx="+'sl'+(param.seriesIndex+1)
				   +'&p_ywbz='+ywbz	
				   +'&p_mcdm='+''	
				   +'&p_kssj='+$("#kssj").val() +'&p_jssj='+$("#jssj").val()  
	               +'&p_yljgdm='+yljgdm[param.dataIndex]
		   );
		   });
}

function chart02(id,sl1,mc,mcdm,ywzw,wdzw){
	
	var jgdm=$("#yljgdm").val();
	  if(jgdm=="" ||jgdm==null){
		  jgdm='${jgdm}'  
	  }
	  var ywbz='${ywbz}'
	 var wddm=$("#wdtj").val();
	var colors = ['#00adf4','#86cb68','#9884f3','#6288d1',
        '#066fd8','#627da3', '#9684f2', '#ee7a8d',
        '#ffc231','#57c5a2', '#76caf4','#527df9'];
	var myChart=echarts.init(document.getElementById(id));
    myChart.dispose();
    myChart = echarts.init(document.getElementById(id));
	var option = {
			title: {
                text:  ywzw[0]+'分析'
            },
     color: colors,
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

		    tooltip: {
		        trigger: 'axis',
		        axisPointer: {            // 坐标轴指示器，坐标轴触发有效
		            type: 'shadow'        // 默认为直线，可选为：'line' | 'shadow'
		        }
		    },
		    legend: {
		        data: wdzw
		    },
		    grid: {
		        left: '3%',
		        right: '4%',
		        bottom: '3%',
		        containLabel: true
		    },
		    xAxis: [
		        {
		            type: 'category',
		            data: mc
		        }
		    ],
		    yAxis: [
		        {
		            type: 'value'
		        }
		    ],
		    series: [
		        {
		            name: wdzw[0],
		            type: 'bar',
		            data: sl1,
		        },
		         
		    ]    
		};
	  myChart.setOption(option);
	  myChart.on('click', function(param) {  
			
		  alert(mcdm[param.dataIndex])
		     window.open("${ctx}/ywxxXz/ywxxXz?p_lx="+$("#wdtj").val()
		    	   +'&p_mcdm='+mcdm[param.dataIndex]	
				   +'&p_ywbz='+ywbz	
				   +'&p_wddm='+wddm	
				   +'&p_kssj='+$("#kssj").val() +'&p_jssj='+$("#jssj").val()  
	               +'&p_yljgdm='+jgdm
		   );  
		   });
}

function getechatsdata(kssj,jssj,jgdm,lj,wdtj){
	 
    $.ajax({
    	url: "${ctx}/xxx/xxx.json?p_ywbz="+'${ywbz}'+'&p_yxbz='+'${yxbz}'
    			  +'&p_kssj='+kssj
    			  +"&p_jssj="+jssj
    			  +"&p_jgdm="+jgdm
    			  +"&p_tjsjwd=0"
    			  +"&p_wdtj="+wdtj,
    			
    			
    			
    	 datatype:"json",
    	context: document.body, 
    	success: function(data){
    		 var nodes=eval(data);
    		var hh= JSON.stringify(nodes);
    		 var xx=JSON.parse(hh);
    		 var fianl=xx.xxxlist;
    		 var fian2=xx.mcpzList;
    		 var fian3=xx.mcpz;
    		 var yljgmc=new Array();
    		 var yljgdm=new Array();
    		 var sl1=new Array();
    		 var sl2=new Array();
    		 var sl3=new Array();
    		 var sl4=new Array();
    		 var sl5=new Array();
         	 var sl6=new Array();
         	 var mc=new Array();
         	var mc2=new Array();
         	var ywzw=new Array();
         	var ywbz=new Array();
         	var lj=new Array();
         	 var ii=0;
         	 var jj=0;
         	 
         	 
         	 for (var j=0;j<fian2.length;j++){
    			 mc2[j]=fian2[j].mc;
    			 ywzw=fian2[0].ywzw;
    			 ywbz=fian2[0].ywbz;
    			 lj[j]=fian2[j].lj;
        	 }  
         	 for (var i=0;i<fianl.length;i++) { 
         		yljgdm[i]=fianl[i].yljgdm;
			     yljgmc[i]=fianl[i].yljgmc;
	         	 sl1[i]=fianl[i].sl1;
	         	 sl2[i]=fianl[i].sl2; 
	         	 sl3[i]=fianl[i].sl3;
	         	 sl4[i]=fianl[i].sl4; 
	         	 sl5[i]=fianl[i].sl5;
	         	 sl6[i]=fianl[i].sl6; 
         	 }
         	 
         	 /* var tab = document.getElementById("querytable1") ;
         
         	 var $tbl = $("#querytable1");
             $tbl.html('');
             
    		 $tbl.append('<thead><tr>')
    		 $tbl.append('<th  nowrap="nowrap" style="width: 190px;font-weight:bolder;">'
        	          +'机构名称'+'</th>')
        	          
        	 for (var j=0;j<fian2.length;j++){
    			 mc2[j]=fian2[j].mc;
    			 ywzw=fian2[0].ywzw;
    			 ywbz=fian2[0].ywbz;
        	 }  
    			 
        	          
    		 for (var j=0;j<fian3.length;j++){
    			 mc[j]=fian3[j].mc;
    			 ii=j+2
    			  
	         	$tbl.append(  
	         			'<th  nowrap="nowrap" style="width: 190px;font-weight:bolder;">'
                         +fian3[j].mc+'</th>' );
	         	 }
    		 $tbl.append('</tr></thead>')
    		 
    		 
    		 $tbl.append('<tfoot>  ')
    		 for (var i=0;i<fianl.length;i++) {
    			     jj=i+1; 
    			     yljgmc[i]=fianl[i].yljgmc;
		         	 sl1[i]=fianl[i].sl1;
		         	 sl2[i]=fianl[i].sl2; 
		         	 sl3[i]=fianl[i].sl3;
		         	 sl4[i]=fianl[i].sl4; 
		         	 sl5[i]=fianl[i].sl5;
		         	 sl6[i]=fianl[i].sl6; 
		         	 
		  $tbl.append('<tr>'
		         +'<td  nowrap="nowrap" style="width: 190px;font-weight:bolder;">'
	             +fianl[i].yljgmc 
	             +'</td>' 
	            
	            	 
	             
	             +'<td  nowrap="nowrap" style="width: 190px;font-weight:bolder;">'
	              
	             +' <a href="${ctx}/ywxxXz/ywxxXz?p_lx='+'sl1'+'&p_ywbz='+ywbz
	             +'&p_kssj='+$("#kssj").val() +'&p_jssj='+$("#jssj").val()	
	             +'&p_yljgdm='+fianl[i].yljgdm+	
	             ' "'
                 +' target="_blank">'
	             +fianl[i].sl1 
	             +'</a>'
	             +'</td>'
	             
	             
	             +'<td  nowrap="nowrap" style="width: 190px;font-weight:bolder;">'
	             
	             +' <a href="${ctx}/ywxxXz/ywxxXz?p_lx='+'sl2'+'&p_ywbz='+ywbz
	             +'&p_kssj='+$("#kssj").val() +'&p_jssj='+$("#jssj").val()	
	             +'&p_yljgdm='+fianl[i].yljgdm+	
	             ' "'
                 +' target="_blank">'
	             +fianl[i].sl2
	             +'</td>'
	             +'<td  nowrap="nowrap" style="width: 190px;font-weight:bolder;">'
	             
	             +' <a href="${ctx}/ywxxXz/ywxxXz?p_lx='+'sl3'+'&p_ywbz='+ywbz
	             +'&p_kssj='+$("#kssj").val() +'&p_jssj='+$("#jssj").val()	
	             +'&p_yljgdm='+fianl[i].yljgdm+	
	             ' "'
                 +' target="_blank">'
	             +fianl[i].sl3 
	             +'</td>'
	             +'<td  nowrap="nowrap" style="width: 190px;font-weight:bolder;">'
	             
	             +' <a href="${ctx}/ywxxXz/ywxxXz?p_lx='+'sl4'+'&p_ywbz='+ywbz
	             +'&p_kssj='+$("#kssj").val() +'&p_jssj='+$("#jssj").val()	
	             +'&p_yljgdm='+fianl[i].yljgdm+	
	             ' "'
                 +' target="_blank">'
	             +fianl[i].sl4
	             +'</td>'
	             +'<td  nowrap="nowrap" style="width: 190px;font-weight:bolder;">'
	             
	             +' <a href="${ctx}/ywxxXz/ywxxXz?p_lx='+'sl5'+'&p_ywbz='+ywbz
	             +'&p_kssj='+$("#kssj").val() +'&p_jssj='+$("#jssj").val()	
	             +'&p_yljgdm='+fianl[i].yljgdm+	
	             ' "'
                 +' target="_blank">'
	             +fianl[i].sl5
	             +'</td>'
	             +'<td  nowrap="nowrap" style="width: 190px;font-weight:bolder;">'
	             
	             +' <a href="${ctx}/ywxxXz/ywxxXz?p_lx='+'sl6'+'&p_ywbz='+ywbz
	             +'&p_kssj='+$("#kssj").val() +'&p_jssj='+$("#jssj").val()	
	             +'&p_yljgdm='+fianl[i].yljgdm+	
	             ' "'
                 +' target="_blank">'
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
               	 }    */
  	
                
         	 chart01('map',sl1,sl2,sl3,sl4,sl5,sl6,mc2,yljgmc,lj,ywzw,yljgdm); 
    		}
    	
      	});
	
}

function getechatsdata2(kssj,jssj,jgdm,lj,wdtj){
	
    $.ajax({
    	url: "${ctx}/xxx/xxx.json?p_ywbz="+'${ywbz}'+'&p_yxbz='+'${yxbz}'
    			  +'&p_kssj='+kssj
    			  +"&p_jssj="+jssj
    			  +"&p_jgdm="+jgdm
    			  +"&p_tjsjwd=0"
    			  +"&p_wdtj="+wdtj,
         datatype:"json",
    	context: document.body, 
    	success: function(data){
    		 var nodes=eval(data);
    		var hh= JSON.stringify(nodes);
    		 var xx=JSON.parse(hh);
    		 var fianl=xx.kkkList;
    		
    		 var mc=new Array(); 
    		 var mcdm=new Array(); 
    		 var sl1=new Array();
    		 var ywzw=new Array(); 
    		 var wdzw=new Array();
    		 
         	 for (var i=0;i<fianl.length;i++) { 
         		  mc[i]=fianl[i].mc;
         		  mcdm[i]=fianl[i].mcdm;
	         	  sl1[i]=fianl[i].sl1;
	         	 ywzw[i]=fianl[i].ywzw;
	         	wdzw[i]=fianl[i].wdzw;
	         	  
         	 }    
          chart02('map',sl1,mc,mcdm,ywzw,wdzw); 
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
	   
	  var jgdm=$("#yljgdm").val();
	  if(jgdm=="" ||jgdm==null){
		  jgdm='${jgdm}'  
	  }
	  var lj='${lj}' 
	  if(jssj<kssj){
		  alert("选择的结束时间请大于或等于开始时间")
		  return;
	  }
	  
	  var wdtj=$("#wdtj").val();
	 getechatsdata(kssj,jssj,jgdm,lj,wdtj); 
    }
    
    

function getData2(){
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
	   
	  var jgdm=$("#yljgdm").val();
	  if(jgdm=="" ||jgdm==null){
		  jgdm='${jgdm}'  
	  }
	  var lj='${lj}' 
	  if(jssj<kssj){
		  alert("选择的结束时间请大于或等于开始时间")
		  return;
	  }
	  
	  var wdtj=$("#wdtj").val();
	 getechatsdata2(kssj,jssj,jgdm,lj,wdtj); 
    }
    
    
	$(document).ready(function(){
		 
		 if($("#wdtj").val()==''||$("#wdtj").val()==null||$("#wdtj").val()=='yljgdm'){
			getData();
			}else{
				getData2();	
			}
		 
	});
		
	function search() {
		 if($("#wdtj").val()==''||$("#wdtj").val()==null||$("#wdtj").val()=='yljgdm'){
				getData();
				}else{
					getData2();	
				}
    }
	function qsfz(){
		 var jgdm=$("#yljgdm").val();
		  if(jgdm=="" ||jgdm==null){
			  jgdm='${jgdm}'  
		  }
		window.location.href="${ctx}/xxxQsfx/xxxQsfx?p_ywbz="+'${ywbz }' 
				+"&p_yxbz=1&p_tjsjwd=0&p_jgdm="+jgdm+"&p_kssj="+$("#kssj").val()
				+"&p_jssj="+$("#jssj").val()
				
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
						onClick="WdatePicker({dateFmt:'yyyy-MM-dd'})" value="2017-01-01"
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
		<c:if test="${ywbz != 'QYJG'&& ywbz != 'YJJJ'}">	
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
          </c:if>
            
             <td style="width: 25%" >
					<div class="layui-form-item" style="margin-top: 20px; margin-left: -176px;">
						<label class="layui-form-label label3">维度统计</label>
						<div class="layui-input-inline input3">
							<select id="wdtj" name="wdtj" lay-search>
								<option value="">维度统计</option>
								<c:forEach items="${wdtjList}" var="wdtj">
									<option value="${wdtj.wdyw}">${wdtj.wdmc}</option>
								</c:forEach>
							</select>	
						</div>
					</div>
					
				</td>
				<td>
					<div class="layui-form-item">
						<div class="layui-input-block"    style=" margin-left: -176px;">
							<button class="layui-btn" onclick="search();">查询</button>
							<button class="layui-btn" onclick="qsfz();">横向趋势</button>
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