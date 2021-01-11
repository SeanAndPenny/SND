<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/commons/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
<title>药占比分析</title>
<script type="text/javascript"
	src="<c:url value="/static/layui/layui.js"/>"></script>
<link rel="stylesheet" type="text/css"
	href="<c:url value="/static/layui/css/layui.css"/>" />
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
    
    }
function getData(){
       var jgdm=$("#jgdm").val();
       if(jgdm=="" ||jgdm==null){
        jgdm='${jgdm}'  
      } 
      swxxfxEchars(jgdm); 
      }
function swxxfxEchars(jgdm){
      var kssj=$("#kssj").val();
      var jssj=$("#jssj").val();
      if(jssj<kssj){
     	 alert("选择的结束时间请大于或等于开始时间") ;
     	 return;
       }
      $.ajax({
        url: "${ctx}/yzbfx/yzbfx.json?p_kssj="+kssj
              +"&p_jssj="+jssj
              +"&p_yljgdm="+jgdm,    
         datatype:"json",
        context: document.body, 
        success: function(data){
           var nodes=eval(data);
           var hh= JSON.stringify(nodes);
           var xx=JSON.parse(hh);
           var fianl=xx.mzYzbList;
           var mzypfy=new Array();
           var mzqtfy=new Array();
           
           var fian2=xx.zyYzbList;
           var zyypfy=new Array();
           var zyqtfy=new Array();
           
           var fian3=xx.yzbJgfxList;
           var yljgdm=new Array();
           var yljgmc=new Array();
           var mzypfy2=new Array();
           var zyypfy2=new Array();
           
           var fian4=xx.yzbJcfxList;
           var yljgdm4=new Array();
           var yljgmc4=new Array();
           var mzypfy4=new Array();
           var zyypfy4=new Array();
           
           for (var i=0;i<fianl.length;i++) { 
        	   mzypfy[i]=fianl[i].mzypfy; 
        	   mzqtfy[i]=fianl[i].mzqtfy;
              } 
           for (var i=0;i<fian2.length;i++) { 
        	   zyypfy[i]=fian2[i].zyypfy; 
        	   zyqtfy[i]=fian2[i].zyqtfy;
              }
           for (var i=0;i<fian3.length;i++) { 
        	   yljgdm[i]=fian3[i].yljgdm; 
        	   yljgmc[i]=fian3[i].yljgmc;
        	   mzypfy2[i]=fian3[i].mzypfy; 
        	   zyypfy2[i]=fian3[i].zyypfy;
              }
           for (var i=0;i<fian4.length;i++) { 
        	   yljgdm4[i]=fian4[i].yljgdm; 
        	   yljgmc4[i]=fian4[i].yljgmc;
        	   mzypfy4[i]=fian4[i].mzypfy; 
        	   zyypfy4[i]=fian4[i].zyypfy;
              }

             chart01('chart01',mzypfy,mzqtfy); 
             chart02('chart02',zyypfy,zyqtfy);  
             chart03('chart03',yljgdm,yljgmc,mzypfy2,zyypfy2,kssj,jssj); 
             chart04('chart04',yljgdm4,yljgmc4,mzypfy4,zyypfy4,kssj,jssj); 
          }
          });
      getechar05(jgdm,kssj,jssj,'','');
  }

function chart01(id,mzypfy,mzqtfy){  
	  var myChart=echarts.init(document.getElementById(id));
	    myChart.dispose();
	    myChart = echarts.init(document.getElementById(id));
	    option = { 
	    title: {
            text: '门诊药品费用占比分析',  
        },
        tooltip: {
            trigger: 'item',
            formatter: '{a} <br/>{b}: {c}元 ({d}%)'
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
             data: ['门诊药品费用','其他费用']
         },
         series: [
             {
                 name: '门诊药品费用占比:',
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
                         fontSize: '16',
                         fontWeight: 'bold'
                     }
                 },
                 labelLine: {
                     show: false
                 },
                 data:[
                 {value: mzypfy, name: '门诊药品费用'},
                 {value: mzqtfy, name: '其他费用'},
                 ]
             }
         ] 
	      };

	    myChart.setOption(option);    
}
function chart02(id,zyypfy,zyqtfy){
	  
	  var myChart=echarts.init(document.getElementById(id));
	    myChart.dispose();
	    myChart = echarts.init(document.getElementById(id));
	    option = { 
	    title: {
          text: '住院药品费用占比分析',  
      },
      tooltip: {
          trigger: 'item',
          formatter: '{a} <br/>{b}: {c}元 ({d}%)'
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
           data: ['住院药品费用','其他费用']
       },
       series: [
           {
               name: '住院药品费用占比:',
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
                       fontSize: '16',
                       fontWeight: 'bold'
                   }
               },
               labelLine: {
                   show: false
               },
               data:[
               {value: zyypfy, name: '住院药品费用'},
               {value: zyqtfy, name: '其他费用'},
               ]
           }
       ] 
	      };

	    myChart.setOption(option);  
	} 
function chart03(id,yljgdm,yljgmc,mzypfy,zyypfy,kssj,jssj) { 
	  
	var myChart = echarts.init(document.getElementById(id));
	    myChart.dispose();
	    myChart = echarts.init(document.getElementById(id));
	    var option = {
	    		 title: {
	    			 textStyle: {  
	    				 fontStyle: 'normal', 
	    				 fontWeight: 'normal',
	    				 fontSize: 15 },
	                 text: '综合医院药品费用统计',  
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
	                  var ldItem = null;
	                   
	                  var mcs = null;
	                  params.forEach(function(item,idx){
	                    if (item.seriesName==='门诊药品费用') {
	                    	hjItem = item;
	                    }
	                    if (item.seriesName==='住院药品费用') {
	                    	ldItem = item;
	                    }
	                    
	                      
	                    mcs=item;
	                     
	                  });
	                  str += mcs.name+":"+"<br>";
	                  str += hjItem.marker+hjItem.seriesName+":"+(hjItem.data)+"<br>";
	                  str += ldItem.marker+ldItem.seriesName+":"+(ldItem.data)+"<br>";
	                   
	                  return str; 
	                }
	             
	        },
	        grid: {
	             y:70,
	        },
	         
	        legend: {
	            top: 10,
	            right: 35,
	            itemWidth: 15,
	            itemHeight: 9,
	            bottom: -5,
	            data: ['门诊药品费用','住院药品费用']
	        },
	        axisLabel: {  
                interval: 0,  
                formatter:function(value)  
                { 
                 
                    var ret = "";//拼接加\n返回的类目项  
                    var maxLength =6;//每项显示文字个数  
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
	            {
	                type: 'value', 
	                name: "万元",
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
	                name: '门诊药品费用',
	                type: 'bar',
	                barWidth: 19,
	                
	                data: mzypfy
	            },
	            {
	                name: '住院药品费用',
	                type: 'bar',
	                barWidth: 19,
	                
	                data: zyypfy
	            },
	             
	        ]
	    };
	    myChart.setOption(option); 
	    myChart.on('click', function(params) { 
	    	getechar05(yljgdm[params.dataIndex],kssj,jssj,'A1',yljgmc[params.dataIndex]);
	           }); 
}
function chart04(id,yljgdm,yljgmc,mzypfy,zyypfy,kssj,jssj) { 
	var myChart = echarts.init(document.getElementById(id));
	    myChart.dispose();
	    myChart = echarts.init(document.getElementById(id));
	    var option = {
	    		 title: {
	    			 textStyle: {  
	    				 fontStyle: 'normal', 
	    				 fontWeight: 'normal',
	    				 fontSize: 15 },
	                 text: '基础医院药品费用统计',  
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
	                  var ldItem = null;
	                   
	                  var mcs = null;
	                  params.forEach(function(item,idx){
	                    if (item.seriesName==='门诊药品费用') {
	                    	hjItem = item;
	                    }
	                    if (item.seriesName==='住院药品费用') {
	                    	ldItem = item;
	                    }
	                    
	                      
	                    mcs=item;
	                     
	                  });
	                  str += mcs.name+":"+"<br>";
	                  str += hjItem.marker+hjItem.seriesName+":"+(hjItem.data)+"<br>";
	                  str += ldItem.marker+ldItem.seriesName+":"+(ldItem.data)+"<br>";
	                   
	                  return str; 
	                }
	             
	        },
	        grid: {
	        	y:70,
	        },
	        legend: {
	            top: 10,
	            right: 35,
	            itemWidth: 15,
	            itemHeight: 9,
	            bottom: -5,
	            data: ['门诊药品费用','住院药品费用']
	        },
	        axisLabel: {  
                interval: 0,  
                formatter:function(value)  
                { 
                 
                    var ret = "";//拼接加\n返回的类目项  
                    var maxLength =6;//每项显示文字个数  
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
	            {
	                type: 'value', 
	                name: "万元",
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
	                name: '门诊药品费用',
	                type: 'bar',
	                barWidth: 19,
	                
	                data: mzypfy
	            },
	            {
	                name: '住院药品费用',
	                type: 'bar',
	                barWidth: 19,
	                
	                data: zyypfy
	            },
	             
	        ]
	    };
	    myChart.setOption(option); 
	    myChart.on('click', function(params) { 
	    	getechar05(yljgdm[params.dataIndex],kssj,jssj,'AA',yljgmc[params.dataIndex]);
	           }); 
}
function  getechar05(yljgdm,kssj,jssj,lx,yljgmc){ 
    $.ajax({
      url: "${ctx}/yzbfx/getechar05.json?p_kssj="+kssj
            +"&p_jssj="+jssj 
            +"&p_yljgdm="+yljgdm,    
       datatype:"json",
      context: document.body, 
      success: function(data){
         var nodes=eval(data);
         var hh= JSON.stringify(nodes);
         var xx=JSON.parse(hh);
         
         var fian5=xx.getechar05List;
         var rq=new Array();
         var mzypfy5=new Array();
         var zyypfy5=new Array(); 
         
          
         for (var i=0;i<fian5.length;i++) { 
      	   rq[i]=fian5[i].rq;
      	   mzypfy5[i]=fian5[i].mzypfy;
      	   zyypfy5[i]=fian5[i].zyypfy; 
            }
         
           chart05('chart05',rq,mzypfy5,zyypfy5,yljgmc); 
           
        }
        }); 
}
function chart05(id,rq,mzypfy5,zyypfy5,yljgmc){
	 if(typeof yljgmc==='undefined'){
		 yljgmc='';
		}
	  var myChart=echarts.init(document.getElementById(id));
	    

	  var options = {
	      title: {
	                text: yljgmc+'药品费用趋势分析',  
	            },
	      
	    color : [ '#188df0', '#DD228F', '#7cb5ec', '#f6ae6e',
	      '#adff2f', '#444446', '#799aec', '#61d4e2',
	      '#6b8e23', '#87ceeb', '#b8860b', '#32cd32' ],
	    tooltip : {
	      trigger : 'axis'
	    },
	    legend : {
	       
	    },
	    xAxis :  {
	      name:"日期",
	      type : 'category',
	      boundaryGap : false,
	      data : rq
	    },
	    dataZoom: [
           {
             type: "slider",
             realtime: true, //拖动滚动条时是否动态的更新图表数据
             height: 25, //滚动条高度
             start: 90, //滚动条开始位置（共100等份）
             end: 100 //结束位置（共100等份）
           }
         ],
	    yAxis : {
	      name:"金额",
	      type : 'value'
	    },
	     
	    series : [
	      {
	        name: '门诊药品费用', 
	                data: mzypfy5,
	                type: 'line',
	                showBackground: true,
	        },
	         
	        {
	            name: "住院药品费用",
	            type: "line",
	            symbolSize: 8,
	            smooth: true,
	             
	            data: zyypfy5
	        } 
	        ]
	  };
	  myChart.setOption(options);
	   
	}

function sjxz(id){  
  var myDate=new Date() 
    var month=myDate.getMonth()+1;
    var year=myDate.getFullYear(); 
    if (month<10) { month = "0" + month; }
    if(id=='year'){
    $("#kssj").val('${kssj}'.substr(0,4));
    $("#jssj").val('${jssj}'.substr(0,4));
    document.getElementById("kssj").onclick = function(){
      WdatePicker({dateFmt:'yyyy'});
      };
    document.getElementById("jssj").onclick = function(){
      WdatePicker({dateFmt:'yyyy'});
        };
    } else if(id=='month'){
    $("#kssj").val('${kssj}');
    $("#jssj").val('${jssj}');
    document.getElementById("kssj").onclick = function(){
      WdatePicker({dateFmt:'yyyy-MM'});
      };
    document.getElementById("jssj").onclick = function(){
      WdatePicker({dateFmt:'yyyy-MM'});
        };
    }  else{
    	 $("#kssj").val('${kssj}');
    	 $("#jssj").val('${jssj}');
    document.getElementById("kssj").onclick = function(){
      WdatePicker({dateFmt:'yyyy-MM'});
      };
    document.getElementById("jssj").onclick = function(){
      WdatePicker({dateFmt:'yyyy-MM'});
        };
    
  }
}
</script>
<script type="text/javascript">
 

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
							<i value="year" onclick="sjxz('year')">年</i>
							<i value="month" class="n active" onclick="sjxz('month')">月</i>
						</ul>
				</span> <span class="det"> <label for="">开始时间</label> <input
						type="text" id="kssj" readonly="readonly" onClick=""
						value="${kssj }" class="Wdate" style="width: 100px" />
						<div
							style="position: absolute; margin-left: 188px; margin-top: -28px;">
							<img src="<c:url value="/static/commons/images/topImg1.png"/>">
						</div>
				</span>
				</span> <span class="det" style="margin-left: 5px;"> <label for="">结束时间</label>
					<input type="text" id="jssj" readonly="readonly" onClick=""
					value="${jssj }" class="Wdate" style="width: 100px" />
					<div
						style="position: absolute; margin-left: 188px; margin-top: -28px;">
						<img src="<c:url value="/static/commons/images/topImg1.png"/>">
					</div>
				</span> <span class="det detLast" style="margin-left: 150px;"> <label
					for="">机构名称</label> <select style="width: 210px" id="jgdm"
					name="jgdm" lay-search>
						<option value="">全区</option>
						<c:forEach items="${yzbJgList}" var="jg">
							<option value="${jg.jgdm}">${jg.jgmc}</option>
						</c:forEach>
				</select>
				</span>
			</div>
			<div class="topRight">
				<button class="btn1" onclick="search();">查询</button>
			</div>
		</div>
		<div style="width: 100%; height: 380px; margin-top: 48px">
			<div id="chart01"
				style="width: 50%; height: 400px; background: #FFFFFF; float: left"></div>
			<div id="chart02"
				style="width: 50%; height: 400px; background: #FFFFFF; float: left"></div>
		</div>
		
			<div id="chart03"
				style="width: 100%; height: 400px;margin-top: 38px; background: #FFFFFF;"></div>
			<div id="chart04"
				style="width: 100%; height: 400px;margin-top: 38px; background: #FFFFFF;"></div>
		
		<div id="chart05"
			style="width: 100%; height: 400px;margin-top: 38px; background: #FFFFFF;"></div>
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