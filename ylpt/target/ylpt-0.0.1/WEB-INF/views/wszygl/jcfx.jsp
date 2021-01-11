<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/commons/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
<title>检查分析</title>

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

$(document).ready(function(){
     getData();
     sjxz();
    
  });

function search() {
    getData();
    document.getElementById("chart03").style.display='none';
    }
function getData(){
       
       var jgdm=$("#jgdm").val();
       if(jgdm=="" ||jgdm==null){
        jgdm='${jgdm}'  
      } 
        
      
      jcfxEchars(jgdm); 
     
      }
function jcfxEchars(jgdm){
  
      var kssj=$("#kssj").val();
      var jssj=$("#jssj").val();
      if(jssj<kssj){
    	  alert('请选择的结束时间大于或大于开始时间')
    	return   
      }
      $.ajax({
        url: "${ctx}/jcfx/jcfx.json?p_kssj="+kssj
              +"&p_jssj="+jssj
              +"&p_jgdm="+jgdm,    
         datatype:"json",
        context: document.body, 
        success: function(data){
           var nodes=eval(data);
           var hh= JSON.stringify(nodes);
           var xx=JSON.parse(hh);
           
           var fianl=xx.jcfxList;
           var yljgmc=new Array();
           var yljgdm=new Array();
           var jcrs=new Array();
           var yylb=new Array();
           
           var fian2=xx.jcjcfxList;
           var yljgmc2=new Array();
           var yljgdm2=new Array();
           var jcrs2=new Array();
           var yylb2=new Array();
           
           for (var i=0;i<fianl.length;i++) { 
        	   yljgmc[i]=fianl[i].yljgmc;
        	   yljgdm[i]=fianl[i].yljgdm;
        	   jcrs[i]=fianl[i].jcrs; 
        	   yylb[i]=fianl[i].yylb; 
              }
           for (var i=0;i<fian2.length;i++) { 
        	   yljgmc2[i]=fian2[i].yljgmc;
        	   yljgdm2[i]=fian2[i].yljgdm;
        	   jcrs2[i]=fian2[i].jcrs; 
        	   yylb2[i]=fian2[i].yylb; 
              }
            
           chart01('chart01',yljgmc,yljgdm,jcrs,kssj,jssj,yylb); 
           chart02('chart02',yljgmc2,yljgdm2,jcrs2,kssj,jssj,yylb2);     
          }
          });
      
      getechars(jgdm,kssj,jssj,'');
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
		  
		$("#kssj").val('${kssj }');
		$("#jssj").val('${jssj }');
		 
		
	}
	 
}
</script>
<script type="text/javascript">
function formatNum(value) {
	if(!value&&value!==0) return 0;
    var ss=value.replace('.',',')
	  return ss
	}
function chart01(id,yljgmc,yljgdm,jcrs,kssj,jssj,yylb) { 
	 
	var myChart = echarts.init(document.getElementById(id));
	    myChart.dispose();
	    myChart = echarts.init(document.getElementById(id));
	    var option = {
	    		 title: {
	    			 textStyle: {  
	    				 fontStyle: 'normal', 
	    				 fontWeight: 'normal',
	    				 fontSize: 15 },
	                 text: '综合医院检查人数',  
	             }, 
	        color:['#86cb68', '#00adf4', '#066fd8', 
	          '#87ceeb', '#32cd32' ],
	        tooltip: {
	            trigger: 'axis',
	            padding: [5, 10], 
	            axisPointer: {            // 坐标轴指示器，坐标轴触发有效
	                type: 'shadow'        // 默认为直线，可选为：'line' | 'shadow'
	            },
	            formatter: function(params){
	            	   
	                  var str = "";
	                  var hjItem = null;
	                  
	                   
	                  var mcs = null;
	                  params.forEach(function(item,idx){
	                    if (item.seriesName==='检查人数') {
	                    	hjItem = item;
	                    }
	                    mcs=item;
	                  });
	                  str += mcs.name+":"+"<br>";
	                  str += hjItem.seriesName+":"+formatNum(hjItem.data)+"<br>";
	                  return str; 
	                }
	             
	        },
	        grid: {
	            left: 46,
	            right: 37,
	            top: 50,
	            bottom: 45,
	        },
	        legend: {
	            top: 10,
	            right: 35,
	            itemWidth: 15,
	            itemHeight: 9,
	            bottom: -5,
	            data: ['检查人数']
	        },
	        axisLabel: {  
                interval: 0,  
                formatter:function(value)  
                { 
                 
                    var ret = "";//拼接加\n返回的类目项  
                    var maxLength =4;//每项显示文字个数  
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
	        xAxis:
	        {    name:'名称',
	             data: yljgmc,
	        },
	        yAxis: [
	            { minInterval: 1,
	                type: 'value', 
	                name: "万人",
	                nameTextStyle: {
	                    fontSize: 12,
	                    color: '#333',
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
	                  
	                axisLabel: {
	                    fontSize: 12,
	                    color: '#333'
	                },
	            }
	        ],
	        series: [
	            {
	                name: '检查人数',
	                type: 'bar',
	                barWidth: 19,
	                data: jcrs
	            },
	             
	             
	        ]
	    };
	    myChart.setOption(option); 
	    myChart.on('click', function(params) { 
	    	 getechars(yljgdm[params.dataIndex],kssj,jssj,yylb[params.dataIndex],yljgmc[params.dataIndex]);
	           }); 
}  
function chart02(id,yljgmc,yljgdm,jcrs,kssj,jssj,yylb) { 
	  
	var myChart = echarts.init(document.getElementById(id));
	    myChart.dispose();
	    myChart = echarts.init(document.getElementById(id));
	    var option = {
	    		 title: {
	    			 textStyle: {  
	    				 fontStyle: 'normal', 
	    				 fontWeight: 'normal',
	    				 fontSize: 15 },
	                 text: '基层医院检查人数',  
	             }, 
	        color:['#86cb68', '#00adf4', '#066fd8', 
	          '#87ceeb', '#32cd32' ],
	        tooltip: {
	            trigger: 'axis',
	            padding: [5, 10], 
	            axisPointer: {            // 坐标轴指示器，坐标轴触发有效
	                type: 'shadow'        // 默认为直线，可选为：'line' | 'shadow'
	            },
	            formatter: function(params){
	            	   
	                  var str = "";
	                  var hjItem = null;
	                  
	                   
	                  var mcs = null;
	                  params.forEach(function(item,idx){
	                    if (item.seriesName==='检查人数') {
	                    	hjItem = item;
	                    }
	                    mcs=item;
	                  });
	                  str += mcs.name+":"+"<br>";
	                  str += hjItem.seriesName+":"+formatNum(hjItem.data)+"<br>";
	                  return str; 
	                }
	             
	        },
	        grid: {
	            left: 46,
	            right: 37,
	            top: 50,
	            bottom: 45,
	        },
	        legend: {
	            top: 10,
	            right: 35,
	            itemWidth: 15,
	            itemHeight: 9,
	            bottom: -5,
	            data: ['检查人数']
	        },
	        axisLabel: {  
                interval: 0,  
                formatter:function(value)  
                { 
                 
                    var ret = "";//拼接加\n返回的类目项  
                    var maxLength =4;//每项显示文字个数  
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
	        xAxis:
	        {    name:'名称',
	             data: yljgmc,
	        },
	        yAxis: [
	            {minInterval: 1,
	                type: 'value', 
	                name: "万人",
	                nameTextStyle: {
	                    fontSize: 12,
	                    color: '#333',
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
	                    color: ["#f6f8fb", "#fff"]
	                },
	                axisLabel: {
	                    fontSize: 12,
	                    color: '#333'
	                },
	            }
	        ],
	        series: [
	            {
	                name: '检查人数',
	                type: 'bar',
	                barWidth: 19,
	                data: jcrs
	            },
	             
	             
	        ]
	    };
	    myChart.setOption(option); 
	    myChart.on('click', function(params) { 
	    	 getechars(yljgdm[params.dataIndex],kssj,jssj,yylb[params.dataIndex],yljgmc[params.dataIndex]);
	           }); 
}  
function getechars(yljgdm,kssj,jssj,yylb,yljgmc){
	 $.ajax({
	      url: "${ctx}/jcfx/getechars.json?p_kssj="+kssj
	            +"&p_jssj="+jssj
	            +"&p_jgdm="+yljgdm
	            +"&p_yylb="+yylb,    
	       datatype:"json",
	      context: document.body, 
	      success: function(data){
	         var nodes=eval(data);
	         var hh= JSON.stringify(nodes);
	         var xx=JSON.parse(hh);
	         var fian3=xx.getecharsList; 
	         var jclx=new Array(); 
	         var jcrs=new Array();
	          
	         for (var i=0;i<fian3.length;i++) { 
	        	 jclx[i]=fian3[i].jclx;
	        	 jcrs[i]=fian3[i].jcrs;  
	             }
	         chart03('chart03',fian3,yljgmc)
	           
	        }
	        });
}
function chart03(id,fian3,yljgmc){
	document.getElementById("chart03").style.display="";//显示
    var datas = [];
    var datass = [];
    if(typeof yljgmc==='undefined'){
    	yljgmc='';
	}
    for (var i = 0; i < fian3.length; i++) {
    	
      datas.push(
    		  {name:fian3[i].jclx}
    		  )
      datass.push({
        name:fian3[i].jclx,
        value:fian3[i].jcrs
      })
     
    } 
    
    var myChart=echarts.init(document.getElementById(id));
      myChart.dispose();
      myChart = echarts.init(document.getElementById(id));
      option = { 
          title: {
                  text: yljgmc+'检查类型分析',  
              },
              tooltip: {
                  trigger: 'item',
                  formatter: '{a} <br/>{b}: {c} ({d}%)'
              },
          color : [ '#188df0', '#DD228F', '#7cb5ec', '#f6ae6e',
            '#adff2f', '#444446', '#799aec', '#61d4e2',
            '#6b8e23', '#87ceeb', '#b8860b', '#32cd32' ],
               legend: {
                   orient: 'vertical',
                   x:'left',      //可设定图例在左、右、居中
                   y:'center', 
                   itemHeight: 7,
                   itemWidth: 7,
                   
                   width: '100%',
                   height: 200,
                   bottom: 20,
                   data: datas
               },
               series: [
                   {
                       name: '检查类型:',
                       type: 'pie',
                       radius: ['48%', '59%'],
                       avoidLabelOverlap: false,
                       label: {
                           show: false,
                           
                       },
                       center:['60%','50%'],
                       emphasis: {
                           label: {
                               show: true,
                               fontSize: '30',
                               fontWeight: 'bold'
                           }
                       },
                       labelLine: {
                           show: false
                       },
                       data: datass
                   }
               ] 
               
        };

      myChart.setOption(option); 
         
}
</script>
</head>
<body>
	<!-- 头部 start-->
	<div class="headBox"></div>
	<!-- 头部 end-->

	<div class="main mainThree">
		<div class="top clearfix">
			<div class="topLeft">
				<span class="det"> <span class="sj sjKs">
						<ul id="sjxzid">
							<i class="r "  onclick="sjxz('day')">当天 </i>  
                            <i class="w" onclick="sjxz('week')" >本周</i>
                             <i class="y" onclick="sjxz('month')">本月</i>  
                             <i class="qb active" onclick="sjxz('all')">全部</i>  
						</ul>
				</span> <span class="det"> <label for="">开始时间</label> <input
						type="text" id="kssj" readonly="readonly" onClick="WdatePicker({dateFmt:'yyyy-MM-dd'})"
						value="${kssj }" class="Wdate" style="width: 100px" />
						<div
							style="position: absolute; margin-left: 188px; margin-top: -28px;">
							<img src="<c:url value="/static/commons/images/topImg1.png"/>">
						</div>
				</span>
				</span> <span class="det" style="margin-left: 5px;"> <label for="">结束时间</label>
					<input type="text" id="jssj" readonly="readonly" onClick="WdatePicker({dateFmt:'yyyy-MM-dd'})"
					value="${jssj }" class="Wdate" style="width: 100px" />
					<div
						style="position: absolute; margin-left: 188px; margin-top: -28px;">
						<img src="<c:url value="/static/commons/images/topImg1.png"/>">
					</div>
				</span> <span class="det detLast" style="margin-left: 150px;"> <label
					for="">机构名称</label> <select  style="width: 165px;" id="jgdm" name="jgdm" lay-search>
						<option value="">全区</option>
						<c:forEach items="${jcjgList}" var="jg">
							<option value="${jg.jgdm}">${jg.jgmc}</option>
						</c:forEach>
				</select>
				</span>
			</div>
			<div class="topRight">
				<button class="btn1" onclick="search();">查询</button>
			</div>
		</div>
		<div style="width: 100%; height: 400px; margin-top: 48px">
			<div id="chart01"
				style="width: 50%; height: 400px; background: #FFFFFF; float: left"></div>
			<div id="chart02"
				style="width: 50%; height: 400px; background: #FFFFFF; float: left"></div>
		</div>
		<div style='position: absolute;margin-top: -397px;    margin-left:143px'>
			<img src="<c:url value="/static/commons/images/xz3.png"/>">
		 </div>
		 <div style='position: absolute;margin-top: -397px;    margin-left:710px'>
			<img src="<c:url value="/static/commons/images/xz3.png"/>">
		 </div>
        <div id="chart03"
                style="margin-top: 57px;width: 100%; height: 400px; background: #FFFFFF; display: none"></div>

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