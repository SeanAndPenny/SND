<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/commons/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
<title>数据分析</title>
<%@ include file="/commons/meta.jsp"%>
 <link rel="stylesheet" type="text/css" 
   href="<c:url value="/static/commons/css/reset2.css"/>" />
   <link rel="stylesheet" type="text/css" 
   href="<c:url value="/static/commons/css/index2.css"/>" />
	<script type="text/javascript"
	src="<c:url value="/static/commons/js/jquery2-1.11.1.min.js"/>"></script>
	 <script type="text/javascript"
	src="<c:url value="/static/commons/js/echarts2.min.js"/>"></script>
	
	<script type="text/javascript"
	src="<c:url value="/static/commons/js/calendar/WdatePicker.js"/>"></script>
    <style>
		html,body{
			background: #ededed;
			height: 100%;
			width: 100%;
		}
	</style>

<script type="text/javascript">
function chart01(id,sl1,sl2,sl3,sl4,sl5,sl6,mc,yljgmc,lj,ywzw,yljgdm,fian4,zl){ 
	
	$("#bz").html('');
	$("#bz").html(fian4);
	var ywbz='${ywbz}'; 
	$("#jj").html('');
	$("#jj").html(ywzw+'分析'+'(总量:'+zl+')')
	 
    var myChart = echarts.init(document.getElementById(id));
    myChart.dispose();
    myChart = echarts.init(document.getElementById(id));
    var option = {  
            

            tooltip: {
                trigger: 'axis',
                /* top:20,
                right:10, */
                padding: [8, 10], 
                backgroundColor: "#ffe3cf",
                borderColor: "#ffc197",
                borderWidth: 1,
                textStyle: {
                    color: "#df5f12"
                },
                axisPointer: {            // 坐标轴指示器，坐标轴触发有效
                    type: 'line',       // 默认为直线，可选为：'line' | 'shadow'
                    lineStyle: {
                        color: "#fdccaa",
                        type: 'dashed'
                    }
                }
            },
            
             toolbox: {
                show: true,
                right:20,
                top:-8,
                feature: {
                    dataView: {
                        readOnly: false,
                        icon:"image://<c:url value="/static/commons/images/text.png"/>"
                    },
                    magicType: {
                        type: ['line', 'bar'],
                        icon:{
                            line :"image://<c:url value="/static/commons/images/text2.png"/>",
                            bar :"image://<c:url value="/static/commons/images/text3.png"/>"
                        }
                    },
                    restore: {
                    	 icon:"image://<c:url value="/static/commons/images/text4.png"/>"
                    },
                    saveAsImage: {
                    	 icon:"image://<c:url value="/static/commons/images/text5.png"/>"
                    }
                },
                itemSize:30,//工具栏 icon 的大小
                
            },
             grid: {
                left: 55,
                right: 70,
                top: 80,
                bottom: 40,
            },
            legend: {
            	 top: 40,
                 right: 0,
                 itemWidth: 14,
                 itemHeight: 14,
                 data: mc
            },
            xAxis:{
                name: "机构名称",
                nameLocation: "end",
                nameTextStyle: {
                    fontSize: 14,
                    color: '#999999',
                },
                axisTick: {
                    show: false
                },
                axisLine: {
                    show: true,
                    lineStyle: {
                        color: "#9fa6b2"
                    }
                },
                splitLine: {
                    show: false,
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
                data: yljgmc,
            },
            yAxis: [
                {
                    type: 'value',
                    name: "数量",
                    nameTextStyle: {
                        fontSize: 14,
                        color: '#666666',
                    },
                    axisTick: {
                        show: false,
                    },
                    axisLine: {
                        show: true,
                        lineStyle: {
                            color: "#9fa6b2"
                        }
                    },
                    splitLine: {
                        show: true,
                        lineStyle: {
                            color: "#d3dae6"
                        }
                    },
                    splitArea: {
                        show: true,
                        areaStyle: {
                            color: ["#ffffff", "#f6f8fb"]
                        }
                    },
                    axisLabel: {
                        fontSize: 14,
                        color: '#666666'
                    },
                     
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
                   	 barWidth: 26,
                     itemStyle: {
                         color: '#3c99f1',
                         barBorderRadius: [2,2,0,0]
                     },
                        data:sl1
                    }
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

function chart02(id,sl1,mc,mcdm,ywzw,wdzw,fian2,zl){

	$("#bz").html('');
	$("#bz").html(fian2);
	$("#jj").html('');
	$("#jj").html(ywzw[0]+'分析'+'(总量:'+zl+')') 
	var jgdm=$("#yljgdm").val();
	  if(jgdm=="" ||jgdm==null){
		  jgdm='${jgdm}'  
	  }
	  var ywbz='${ywbz}'
	 var wddm=$("#wdtj").val();
	 
	var myChart=echarts.init(document.getElementById(id));
    myChart.dispose();
    myChart = echarts.init(document.getElementById(id));
	var option = {  
            

            tooltip: {
                trigger: 'axis',
                /* top:20,
                right:10, */
                padding: [8, 10], 
                backgroundColor: "#ffe3cf",
                borderColor: "#ffc197",
                borderWidth: 1,
                textStyle: {
                    color: "#df5f12"
                },
                axisPointer: {            // 坐标轴指示器，坐标轴触发有效
                    type: 'line',       // 默认为直线，可选为：'line' | 'shadow'
                    lineStyle: {
                        color: "#fdccaa",
                        type: 'dashed'
                    }
                }
            },
            
             toolbox: {
                show: true,
                right:20,
                top:-8,
                feature: {
                    dataView: {
                        readOnly: false,
                        icon:"image://<c:url value="/static/commons/images/text.png"/>"
                    },
                    magicType: {
                        type: ['line', 'bar'],
                        icon:{
                            line :"image://<c:url value="/static/commons/images/text2.png"/>",
                            bar :"image://<c:url value="/static/commons/images/text3.png"/>"
                        }
                    },
                    restore: {
                    	 icon:"image://<c:url value="/static/commons/images/text4.png"/>"
                    },
                    saveAsImage: {
                    	 icon:"image://<c:url value="/static/commons/images/text5.png"/>"
                    }
                },
                itemSize:30,//工具栏 icon 的大小
                
            },
             grid: {
                left: 55,
                right: 70,
                top: 80,
                bottom: 40,
            },
            legend: {
            	 top: 40,
                 right: 0,
                 itemWidth: 14,
                 itemHeight: 14,
                 data: wdzw
            },
            xAxis:{
                name: "项目名称",
                nameLocation: "end",
                nameTextStyle: {
                    fontSize: 14,
                    color: '#999999',
                },
                axisTick: {
                    show: false
                },
                axisLine: {
                    show: true,
                    lineStyle: {
                        color: "#9fa6b2"
                    }
                },
                splitLine: {
                    show: false,
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
                data: mc,
            },
            yAxis: [
                {
                    type: 'value',
                    name: "数量",
                    nameTextStyle: {
                        fontSize: 14,
                        color: '#666666',
                    },
                    axisTick: {
                        show: false,
                    },
                    axisLine: {
                        show: true,
                        lineStyle: {
                            color: "#9fa6b2"
                        }
                    },
                    splitLine: {
                        show: true,
                        lineStyle: {
                            color: "#d3dae6"
                        }
                    },
                    splitArea: {
                        show: true,
                        areaStyle: {
                            color: ["#ffffff", "#f6f8fb"]
                        }
                    },
                    axisLabel: {
                        fontSize: 14,
                        color: '#666666'
                    },
                    
                }
            ],
            series: [ 
            	{
            		type:'bar',
                  	 barWidth: 26,
                    itemStyle: {
                        color: '#3c99f1',
                        barBorderRadius: [2,2,0,0]
                    },
            	name: wdzw[0],
	            type: 'bar',
	            data: sl1,
            	}
            ]
		};
	  myChart.setOption(option);
	  myChart.on('click', function(param) {  
		
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
    		 var fian4=xx.bz;
    		 var zl=xx.zl;
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
         	 chart01('chart01',sl1,sl2,sl3,sl4,sl5,sl6,mc2,yljgmc,lj,ywzw,yljgdm,fian4,zl); 
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
    		 var fian2=xx.bz;
    		var zl= xx.zl;
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
         	 
          chart02('chart01',sl1,mc,mcdm,ywzw,wdzw,fian2,zl); 
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
				+"&p_jssj="+$("#jssj").val()+"&p_orgid="+'${orgid }'
				
	}
	//日期控件
	Date.prototype.Format = function (fmt) { //author: meizz 
	    var o = {
	        "M+": this.getMonth() + 1, //月份 
	        "d+": this.getDate(), //日 
	        "h+": this.getHours(), //小时 
	        "m+": this.getMinutes(), //分 
	        "s+": this.getSeconds(), //秒 
	        "q+": Math.floor((this.getMonth() + 3) / 3), //季度 
	        "S": this.getMilliseconds() //毫秒 
	    };
	    if (/(y+)/.test(fmt)) fmt = fmt.replace(RegExp.$1, (this.getFullYear() + "").substr(4 - RegExp.$1.length));
	    for (var k in o)
	        if (new RegExp("(" + k + ")").test(fmt)) fmt = fmt.replace(RegExp.$1, (RegExp.$1.length == 1) ? (o[k]) : (("00" + o[k]).substr(("" + o[k]).length)));
	    return fmt;
	} 
	function sjxz(id){
		var myDate=new Date();
		var month=myDate.getMonth()+1;
		var year=myDate.getFullYear(); 
		if (month<10) { month = "0" + month; } 
		  
		var weekday=myDate.getDate()-myDate.getDay()+1;
		if (weekday<10) { weekday = "0" + weekday; } 
		 if(id=='week'){  
			$("#kssj").val(myDate.Format('yyyy-MM')+'-'+weekday);
			$("#jssj").val(myDate.Format('yyyy-MM-dd'));  
			} 
		else if(id=='month'){
			$("#kssj").val(myDate.Format('yyyy-MM')+'-01');
			$("#jssj").val(myDate.Format('yyyy-MM-dd'));  
			} 
		else if(id=='day'){ 
			 $("#kssj").val(myDate.Format('yyyy-MM-dd'));
			$("#jssj").val(myDate.Format('yyyy-MM-dd')); 
		}else{
			$("#kssj").val('');
			$("#jssj").val('');
			 
			
		}
		 
	}
	
</script>
</head>
<body>

<div class="headBox"></div>

<div class="main mainTwo">
	<div class="top clearfix">
       <div class="topLeft">
				 
	   <span class="det">
          <span class="sj sjKs">
            <i class="r "  onclick="sjxz('day')">当天 </i>  
            <i class="w" onclick="sjxz('week')" >本周</i>
            <i class="y" onclick="sjxz('month')">本月</i>  
            <i class="qb active" onclick="sjxz('all')">全部</i>    
          </span>
          <span class="det" >
          <label for="">开始时间</label>
          <input type="text" id="kssj"
              readonly="readonly" onClick="WdatePicker({dateFmt:'yyyy-MM-dd'})" value="" class="Wdate"
              style="width: 100px" />
          <div  style="position: absolute;margin-left:188px;margin-top: -28px;">
            <img src="<c:url value="/static/commons/images/topImg1.png"/>">
          </div>
          </span>
        </span> 
        <span class="det" style="margin-left: 5px;"> <label for="">结束时间</label>
          <input type="text" id="jssj" readonly="readonly" onClick="WdatePicker({dateFmt:'yyyy-MM-dd'})"
          value="" class="Wdate" style="width: 100px" />
          <div style="position: absolute; margin-left: 188px; margin-top: -28px;">
            <img src="<c:url value="/static/commons/images/topImg1.png"/>">
          </div>
        </span>
				 <c:if test="${ywbz != 'QYJG'&& ywbz != 'YJJJ'}">
				  <span class="det"     style="margin-left: 35px;">
					<label for="">机构名称</label>
					<select id="yljgdm" name="yljgdm" lay-search>
							<option value="">医疗机构</option>
							<c:forEach items="${jgList}" var="jg">
								<option value="${jg.jgdm}">${jg.jgmc}</option>
							</c:forEach>
					</select>
					</span>
				</c:if>
				<span class="det detLast">
					<label for="">维度统计</label>
					<select id="wdtj" name="wdtj" lay-search>
								<option value="">维度统计</option>
								<c:forEach items="${wdtjList}" var="wdtj">
									<option value="${wdtj.wdyw}">${wdtj.wdmc}</option>
								</c:forEach>
							</select>
				</span>
			</div>
			<div class="topRight"  style="position: absolute;margin-left:1013px;">
				<button class="btn1" onclick="search();">查询</button>
				<button class="btn2" onclick="qsfz();">横向趋势</button>
			</div>
		</div>	
	<div class="bot">
			 <div class="title clearfix">
				<div class="titLeft">
				<img src="<c:url value="/static/commons/images/botImg1.png"/>" >
					 <label id='jj'for=""></label>
					 <label id='zl'for=""></label>
				</div>
				   
			</div> 
			<div class="botCon">
				<div class="chartBox">
					<div style="width: 100%;"class="chart01" id="chart01">
                     </div>
				 </div>
				<div style="width: 100%;margin-left: 52px;margin-top: 10px" >
				<span  style="font-size:15px; color:#ff0000;font-weight: bold;" class="name">*</span> 
				<span  style="font-size:15px; font-weight: bold;" class="name">备注:</span>
                  <span id="bz" style="font-size:15px; font-weight: bold;" class="name"></span>
				</div>
			</div>
		</div>		

</div>
</body>
 <script>
  $(".sjKs").siblings("input").hide().siblings("input").eq(0).show();

	$(".sjKs i").click(function(){
		$(this).addClass("active").siblings("i").removeClass("active");
		$(".sjKs").siblings("input").hide().eq($(this).index()).show();
	});
	
	$(".sjJs").siblings("input").hide().siblings("input").eq(0).show();

	$(".sjJs i").click(function(){
		$(this).addClass("active").siblings("i").removeClass("active");
		$(".sjJs").siblings("input").hide().eq($(this).index()).show();
	});

</script>
</html>