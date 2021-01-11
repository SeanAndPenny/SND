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
    document.getElementById("chart02").style.display='none'; 
    }
function getData(){
       var xzdm=$("#xzdm").val();
       var kssj=$("#kssj").val();
       var jssj=$("#jssj").val();
       if(jssj<kssj){
     	  alert('请选择的结束时间大于或大于开始时间')
     	return   
       }  
       xzyltjEchars(xzdm,kssj,jssj); 
      }
function xzyltjEchars(xzdm,kssj,jssj){
      $.ajax({
        url: "${ctx}/xzyltj/xzyltj.json?p_kssj="+kssj
              +"&p_jssj="+jssj
              +"&p_xzdm="+xzdm,    
         datatype:"json",
        context: document.body, 
        success: function(data){
           var nodes=eval(data);
           var hh= JSON.stringify(nodes);
           var xx=JSON.parse(hh);
           var fianl=xx.xzyltjList;
           
           var xzdm=new Array();
           var xzmc=new Array();
           var mzrs=new Array();
           var zyrs=new Array(); 
           
           for (var i=0;i<fianl.length;i++) { 
        	   xzdm[i]=fianl[i].xzdm;
        	   xzmc[i]=fianl[i].xzmc;
        	   mzrs[i]=fianl[i].mzrs; 
        	   zyrs[i]=fianl[i].zyrs; 
              }
             chart01('chart01',xzdm,xzmc,mzrs,zyrs,kssj,jssj); 
          }
          });
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
		$("#kssj").val(myDate.Format('yyyy-MM')+'-01');
		$("#jssj").val(myDate.Format('yyyy-MM-dd'));  
		 
		
	}
	 
}
function formatNum(value) {
	if(!value&&value!==0) return 0;
    var ss=value.replace('.',',')
	  return ss
	}
function chart01(id,xzdm,xzmc,mzrs,zyrs,kssj,jssj,jgdm) {  
	var myChart = echarts.init(document.getElementById(id));
	    myChart.dispose();
	    myChart = echarts.init(document.getElementById(id));
	    var option = {
	    		 title: {
	    			 textStyle: {  
	    				 fontStyle: 'normal', 
	    				 fontWeight: 'normal',
	    				 fontSize: 15 },
	                 text: '乡镇医疗业务人数',  
	             }, 
	        color:['#86cb68', '#00adf4', '#066fd8', 
	          '#87ceeb', '#32cd32' ],
	        tooltip: {
	            trigger: 'axis',
	            padding: [5, 10], 
	            axisPointer: {            // 坐标轴指示器，坐标轴触发有效
	                type: 'shadow'        // 默认为直线，可选为：'line' | 'shadow'
	            },   
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
	            data: ['门诊人数','住院人数']
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
	        {    name:'乡镇',
	             data: xzmc,
	        },
	        yAxis: [
	            {
	                type: 'value', 
	                name: "人",
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
	                name: '门诊人数',
	                type: 'bar',
	                barWidth: 19,
	                
	                data: mzrs
	            },
	            {
	                name: '住院人数',
	                type: 'bar',
	                barWidth: 19,
	                
	                data: zyrs
	            },
	             
	        ]
	    };
	    myChart.setOption(option); 
	    myChart.on('click', function(params) { 
        getchart02(xzdm[params.dataIndex],xzmc[params.dataIndex],kssj,jssj,params.seriesIndex);   
	           }); 
} 
function getchart02(xzdm,xzmc,kssj,jssj,lx){
	  $.ajax({
	      url: "${ctx}/xzyltj/getchart02.json?p_xzdm="+xzdm 
	            +"&p_kssj="+kssj +"&p_jssj="+jssj
	            +"&p_lx="+lx,    
	       datatype:"json",
	      context: document.body, 
	      success: function(data){
	         var nodes=eval(data);
	         var hh= JSON.stringify(nodes);
	         var xx=JSON.parse(hh);
	         
	         var fianl=xx.getchartList;
	         var yljgmc=new Array();
	         var yljgdm=new Array();
	         var rs=new Array();
	         var ywlx=new Array();
	         for(var i=0;i<fianl.length;i++){
	        	 yljgdm[i]=fianl[i].yljgdm;
	        	 yljgmc[i]=fianl[i].yljgmc;
	        	 rs[i]=fianl[i].rs;
	        	 ywlx[i]=fianl[i].ywlx;
	         }
	         chart02('chart02',yljgmc,rs,yljgdm,xzmc,ywlx); 
	        }
	        });
}
function chart02(id,yljgmc,rs,yljgdm,xzmc,ywlx){
	   document.getElementById("chart02").style.display='';
	var myChart = echarts.init(document.getElementById(id));
	    myChart.dispose();
	    myChart = echarts.init(document.getElementById(id));
	    var option = {
	    		 title: {
	    			 textStyle: {  
	    				 fontStyle: 'normal', 
	    				 fontWeight: 'normal',
	    				 fontSize: 15 },
	                 text: xzmc+ywlx[0]+'病人所在医院数量统计',  
	             }, 
	        color:['#86cb68', '#00adf4', '#066fd8', 
	          '#87ceeb', '#32cd32' ],
	        tooltip: {
	            trigger: 'axis',
	            padding: [5, 10], 
	            axisPointer: {            // 坐标轴指示器，坐标轴触发有效
	                type: 'shadow'        // 默认为直线，可选为：'line' | 'shadow'
	            },
	             
	             
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
	            data: ['医院人数']
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
            xAxis:{
                name: "机构",
                nameLocation: "end",
                nameTextStyle: {
                    fontSize: 12,
                    color: '#999999',
                },
                 
                
                axisLabel: {  
                    interval: 0,  
                    formatter:function(value)  
                    { 
                     
                        var ret = "";//拼接加\n返回的类目项  
                        var maxLength = 6;//每项显示文字个数  
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
	                name: "人",
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
	                name: '医院人数',
	                type: 'bar',
	                barWidth: 19,
	                
	                data: rs
	            } 
	             
	        ]
	    };
	    myChart.setOption(option); 
	    myChart.on('click', function(params) { 
	      
	           });
}

</script>
</head>
<body>
	<div class="headBox"></div>
	<div class="main mainTwo">
		<div class="top clearfix">
			<div class="topLeft">
				<span class="det"> <span class="sj sjKs">
						<ul id="sjxzid">
							<i class="r " onclick="sjxz('day')">当天 </i>
							<i class="w" onclick="sjxz('week')">本周</i>
							<i class="y active"" onclick="sjxz('month')">本月</i>
							 
						</ul>
				</span> <span class="det"> <label for="">开始时间</label> <input
						type="text" id="kssj" readonly="readonly"
						onClick="WdatePicker({dateFmt:'yyyy-MM-dd'})" value="${kssj }"
						class="Wdate" style="width: 100px" />
						<div
							style="position: absolute; margin-left: 188px; margin-top: -28px;">
							<img src="<c:url value="/static/commons/images/topImg1.png"/>">
						</div>
				</span>
				</span> <span class="det" style="margin-left: 5px;"> <label for="">结束时间</label>
					<input type="text" id="jssj" readonly="readonly"
					onClick="WdatePicker({dateFmt:'yyyy-MM-dd'})" value="${jssj }"
					class="Wdate" style="width: 100px" />
					<div
						style="position: absolute; margin-left: 188px; margin-top: -28px;">
						<img src="<c:url value="/static/commons/images/topImg1.png"/>">
					</div>
				</span> <span class="det detLast" style="margin-left: 150px;"> <label
					for="">乡镇名称</label> <select style="width: 165px;" id="xzdm"
					name="xzdm" lay-search>
						<option value="">全区</option>
						<c:forEach items="${xzjgList}" var="xz">
							<option value="${xz.jgdm}">${xz.jgmc}</option>
						</c:forEach>
				</select>
				</span>
			</div>
			<div class="topRight">
				<button class="btn1" onclick="search();">查询</button>
			</div>
		</div>
		<div
			style="margin-top: 48px; width: 100%; height: 400px; background: #FFFFFF;"
			class="chart01" id="chart01"></div>

		<div id="chart02"
			style="margin-top: 57px; width: 100%; height: 500px; background: #FFFFFF; display: none"></div>
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