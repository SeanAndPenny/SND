<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/commons/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
<title>公立医保分析</title>
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
	var kssj=$("#kssj").val();
    var jssj=$("#jssj").val();
    if(jssj<kssj){
   	 alert("选择的结束时间请大于或等于开始时间") ;
   	 return;
     }
       var jgdm=$("#jgdm").val();
       if(jgdm=="" ||jgdm==null){
        jgdm='${jgdm}'  
      } 
       ybEchars(kssj,jssj,jgdm); 
           
      }
function ybEchars(kssj,jssj,jgdm){
  
      
      $.ajax({
        url: "${ctx}/gxqGlybfytj/gxqGlybfytj.json?p_kssj="+kssj
              +"&p_jssj="+jssj
              +"&p_yljgdm="+jgdm,    
         datatype:"json",
        context: document.body, 
        success: function(data){
           var nodes=eval(data);
           var hh= JSON.stringify(nodes);
           var xx=JSON.parse(hh);
           
           var fianl=xx.getglechar01List;
           var yljgmc=new Array();
           var rs=new Array();
           var fian2=xx.getglechar02List;
           var yljgmc2=new Array();
           var rs2=new Array();
           var fian3=xx.getglechar03List;
           var yljgmc3=new Array();
           var rs3=new Array();
           
           var fian4=xx.getglechar04List;
           var yljgmc4=new Array();
           var rs4=new Array();
           var fian5=xx.getglechar05List;
           var yljgmc5=new Array();
           var rs5=new Array();
           var fian6=xx.getglechar06List;
           var yljgmc6=new Array();
           var rs6=new Array();
           
           
           var fian7=xx.getglechar07List;
           var rq7=new Array();
           var rs7=new Array();
           var mzrc7=new Array();
           var zyrc7=new Array();
           
           var fian8=xx.getglechar08List;
           var rq8=new Array();
           var zje8=new Array();
           var mzje8=new Array();
           var zyje8=new Array();
           
           
           for (var i=0;i<fianl.length;i++) { 
        	   rs[i]=fianl[i].rs;  
        	   yljgmc[i]=fianl[i].yljgmc;
              } 
           for (var i=0;i<fian2.length;i++) { 
        	   rs2[i]=fian2[i].rs;  
        	   yljgmc2[i]=fian2[i].yljgmc;
              } 
           for (var i=0;i<fian3.length;i++) { 
        	   rs3[i]=fian3[i].rs;  
        	   yljgmc3[i]=fian3[i].yljgmc;
              } 
           for (var i=0;i<fian4.length;i++) { 
        	   rs4[i]=fian4[i].rs;  
        	   yljgmc4[i]=fian4[i].yljgmc;
              } 
           for (var i=0;i<fian5.length;i++) { 
        	   rs5[i]=fian5[i].rs;  
        	   yljgmc5[i]=fian5[i].yljgmc;
              } 
           for (var i=0;i<fian6.length;i++) { 
        	   rs6[i]=fian6[i].rs;  
        	   yljgmc6[i]=fian6[i].yljgmc;
              } 
           for (var i=0;i<fian7.length;i++) { 
        	   rs7[i]=fian7[i].rs;  
        	   rq7[i]=fian7[i].rq;
        	   mzrc7[i]=fian7[i].mzrc;
        	   zyrc7[i]=fian7[i].zyrc;
              } 
           for (var i=0;i<fian8.length;i++) { 
        	   zje8[i]=fian8[i].zje;  
        	   rq8[i]=fian8[i].rq;
        	   mzje8[i]=fian8[i].mzje;
        	   zyje8[i]=fian8[i].zyje;
              } 
             chart01('chart01',rs,yljgmc); 
             chart02('chart02',rs2,yljgmc2); 
             chart03('chart03',rs3,yljgmc3); 
             chart04('chart04',rs4,yljgmc4); 
             chart05('chart05',rs5,yljgmc5); 
             chart06('chart06',rs6,yljgmc6); 
             chart07('chart07',rq7,rs7,mzrc7,zyrc7); 
             chart08('chart08',rq8,zje8,mzje8,zyje8); 
          }
          });
     
  }
 
function chart01(id,rs,yljgmc,){
	 var myChart=echarts.init(document.getElementById(id));
     myChart.dispose();
     myChart = echarts.init(document.getElementById(id));
	option = {
			title: {
                text: '公立医院人员总人次发布图',  
            },
			 color : [ '#188df0', '#DD228F', '#7cb5ec', '#f6ae6e',
		          '#adff2f', '#444446', '#799aec', '#61d4e2',
		          '#6b8e23', '#87ceeb', '#b8860b', '#32cd32' ],
			axisLabel: {  
	              interval: 0,  
	              formatter:function(value)  
	              { 
	            	 
	                  var ret = "";//拼接加\n返回的类目项  
	                  var maxLength = 7;//每项显示文字个数  
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
	            	formatter: '{b}<br/>{c}'
	        		}
	   			},
		    xAxis: {
		    	name:'机构',
		        type: 'category',
		        data: yljgmc
		    },
		    yAxis: {
		    	minInterval: 1,
		    	name:'万人',
		        type: 'value'
		    },
		    series: [{
		    	 barWidth: 15,  
		        data: rs,
		        type: 'bar',
		        showBackground: true,
		        backgroundStyle: {
		            color: 'rgba(220, 220, 220, 0.8)'
		        }
		    }]
		};
	 myChart.setOption(option);  
	 
}
 
function chart02(id,rs,yljgmc){
	 var myChart=echarts.init(document.getElementById(id));
    myChart.dispose();
    myChart = echarts.init(document.getElementById(id));
	option = {
			title: {
               text: '公立医院门诊人员总人次发布图',  
           },
			 color : [ '#188df0', '#DD228F', '#7cb5ec', '#f6ae6e',
		          '#adff2f', '#444446', '#799aec', '#61d4e2',
		          '#6b8e23', '#87ceeb', '#b8860b', '#32cd32' ],
			axisLabel: {  
	              interval: 0,  
	              formatter:function(value)  
	              { 
	            	 
	                  var ret = "";//拼接加\n返回的类目项  
	                  var maxLength = 7;//每项显示文字个数  
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
	            	formatter: '{b}<br/>{c}'
	        		}
	   			},
		    xAxis: {
		    	name:'机构',
		        type: 'category',
		        data: yljgmc
		    },
		    yAxis: {
		    	minInterval: 1,
		    	name:'万人',
		        type: 'value'
		    },
		    series: [{
		    	 barWidth: 15,  
		        data: rs,
		        type: 'bar',
		        showBackground: true,
		        backgroundStyle: {
		            color: 'rgba(220, 220, 220, 0.8)'
		        }
		    }]
		};
	 myChart.setOption(option);  
	 
}
function chart03(id,rs,yljgmc){
	 var myChart=echarts.init(document.getElementById(id));
    myChart.dispose();
    myChart = echarts.init(document.getElementById(id));
	option = {
			title: {
               text: '公立医院住院人员总人次发布图',  
           },
			 color : [ '#188df0', '#DD228F', '#7cb5ec', '#f6ae6e',
		          '#adff2f', '#444446', '#799aec', '#61d4e2',
		          '#6b8e23', '#87ceeb', '#b8860b', '#32cd32' ],
			axisLabel: {  
	              interval: 0,  
	              formatter:function(value)  
	              { 
	            	 
	                  var ret = "";//拼接加\n返回的类目项  
	                  var maxLength = 7;//每项显示文字个数  
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
	            	formatter: '{b}<br/>{c}'
	        		}
	   			},
		    xAxis: {
		    	name:'机构',
		        type: 'category',
		        data: yljgmc
		    },
		    yAxis: {
		    	minInterval: 1,
		    	name:'万人',
		        type: 'value'
		    },
		    series: [{
		    	 barWidth: 15,  
		        data: rs,
		        type: 'bar',
		        showBackground: true,
		        backgroundStyle: {
		            color: 'rgba(220, 220, 220, 0.8)'
		        }
		    }]
		};
	 myChart.setOption(option);  
	 
}
function chart04(id,rs,yljgmc){
	 var myChart=echarts.init(document.getElementById(id));
   myChart.dispose();
   myChart = echarts.init(document.getElementById(id));
	option = {
			title: {
              text: '公立医院住院人员总金额发布图',  
          },
			 color : [ '#188df0', '#DD228F', '#7cb5ec', '#f6ae6e',
		          '#adff2f', '#444446', '#799aec', '#61d4e2',
		          '#6b8e23', '#87ceeb', '#b8860b', '#32cd32' ],
			axisLabel: {  
	              interval: 0,  
	              formatter:function(value)  
	              { 
	            	 
	                  var ret = "";//拼接加\n返回的类目项  
	                  var maxLength = 7;//每项显示文字个数  
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
	            	formatter: '{b}<br/>{c}'
	        		}
	   			},
		    xAxis: {
		    	name:'机构',
		        type: 'category',
		        data: yljgmc
		    },
		    yAxis: {
		    	minInterval: 1,
		    	name:'元',
		        type: 'value'
		    },
		    series: [{
		    	 barWidth: 15,  
		        data: rs,
		        type: 'bar',
		        showBackground: true,
		        backgroundStyle: {
		            color: 'rgba(220, 220, 220, 0.8)'
		        }
		    }]
		};
	 myChart.setOption(option);  	 
}
function chart05(id,rs,yljgmc){
	 var myChart=echarts.init(document.getElementById(id));
   myChart.dispose();
   myChart = echarts.init(document.getElementById(id));
	option = {
			title: {
              text: '公立医院住院人员门诊总金额发布图',  
          },
			 color : [ '#188df0', '#DD228F', '#7cb5ec', '#f6ae6e',
		          '#adff2f', '#444446', '#799aec', '#61d4e2',
		          '#6b8e23', '#87ceeb', '#b8860b', '#32cd32' ],
			axisLabel: {  
	              interval: 0,  
	              formatter:function(value)  
	              { 
	            	 
	                  var ret = "";//拼接加\n返回的类目项  
	                  var maxLength = 7;//每项显示文字个数  
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
	            	formatter: '{b}<br/>{c}'
	        		}
	   			},
		    xAxis: {
		    	name:'机构',
		        type: 'category',
		        data: yljgmc
		    },
		    yAxis: {
		    	minInterval: 1,
		    	name:'元',
		        type: 'value'
		    },
		    series: [{
		    	 barWidth: 15,  
		        data: rs,
		        type: 'bar',
		        showBackground: true,
		        backgroundStyle: {
		            color: 'rgba(220, 220, 220, 0.8)'
		        }
		    }]
		};
	 myChart.setOption(option);  
	 
}
function chart06(id,rs,yljgmc){
	 var myChart=echarts.init(document.getElementById(id));
  myChart.dispose();
  myChart = echarts.init(document.getElementById(id));
	option = {
			title: {
             text: '公立医院住院人员住院总金额发布图',  
         },
			 color : [ '#188df0', '#DD228F', '#7cb5ec', '#f6ae6e',
		          '#adff2f', '#444446', '#799aec', '#61d4e2',
		          '#6b8e23', '#87ceeb', '#b8860b', '#32cd32' ],
			axisLabel: {  
	              interval: 0,  
	              formatter:function(value)  
	              { 
	            	 
	                  var ret = "";//拼接加\n返回的类目项  
	                  var maxLength = 7;//每项显示文字个数  
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
	            	formatter: '{b}<br/>{c}'
	        		}
	   			},
		    xAxis: {
		    	name:'机构',
		        type: 'category',
		        data: yljgmc
		    },
		    yAxis: {
		    	minInterval: 1,
		    	name:'元',
		        type: 'value'
		    },
		    series: [{
		    	 barWidth: 15,  
		        data: rs,
		        type: 'bar',
		        showBackground: true,
		        backgroundStyle: {
		            color: 'rgba(220, 220, 220, 0.8)'
		        }
		    }]
		};
	 myChart.setOption(option);  
	 
}


function chart07(id,rq,rs,mzrc,zyrc){
	 
	   
	  var myChart=echarts.init(document.getElementById(id));
	    

	  var options = {
	      title: {
	    	  text: '公立医院参保人员诊疗人次趋势',  
	            },
	      
	    color : [ '#188df0', '#DD228F',  '#f6ae6e',
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
         start: 30, //滚动条开始位置（共100等份）
         end: 100 //结束位置（共100等份）
       }
     ],
	    yAxis : {
	      name:"万人",
	      type : 'value'
	    },
	     
	    series : [
	      {
	               name: '总人数', 
	               type: "line",
		           symbolSize: 8,
		           smooth: true,
	               data: rs, 
	        },
	         
	        {
	            name: "门诊人次",
	            type: "line",
	            symbolSize: 8,
	            smooth: true,
	            data: mzrc
	        } ,
	         
	        {
	            name: "住院人次",
	            type: "line",
	            symbolSize: 8,
	            smooth: true,
	            data: zyrc
	        }  
	        ]
	  };
	  myChart.setOption(options);
	   
	}

function chart08(id,rq,zje,mzje,zyje) { 
	  var myChart=echarts.init(document.getElementById(id));
	    

	  var options = {
	      title: {
	    	  text:'公立医院参保人员诊疗金额趋势',  
	            },
	      
	    color : [ '#188df0', '#DD228F', '#f6ae6e',
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
         start: 30, //滚动条开始位置（共100等份）
         end: 100 //结束位置（共100等份）
       }
     ],
	    yAxis : {
	      name:"元",
	      type : 'value'
	    },
	     
	    series : [
	      {
	               name: '总金额', 
	               type: "line",
		           symbolSize: 8,
		           smooth: true,
	               data: zje, 
	        },
	         
	        {
	            name: "门诊金额",
	            type: "line",
	            symbolSize: 8,
	            smooth: true,
	            data: mzje
	        } ,
	         
	        {
	            name: "住院金额",
	            type: "line",
	            symbolSize: 8,
	            smooth: true,
	            data: zyje
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
    $("#kssj").val('${kssj}'.substr(0,4)+'-01');
    $("#jssj").val('${jssj}'.substr(0,4)+'-12');
    document.getElementById("kssj").onclick = function(){
      WdatePicker({dateFmt:'yyyy-MM'});
      };
    document.getElementById("jssj").onclick = function(){
      WdatePicker({dateFmt:'yyyy-MM'});
        };
    }  else{
    	 $("#kssj").val('${kssj}'.substr(0,4));
    	 $("#jssj").val('${jssj}'.substr(0,4));
    document.getElementById("kssj").onclick = function(){
      WdatePicker({dateFmt:'yyyy'});
      };
    document.getElementById("jssj").onclick = function(){
      WdatePicker({dateFmt:'yyyy'});
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
							<i value="year" class="n active" onclick="sjxz('year')">年</i>
							<i value="month" class="y" onclick="sjxz('month')">月</i>
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
						<c:forEach items="${gxqglybjgList}" var="jg">
							<option value="${jg.jgdm}">${jg.jgmc}</option>
						</c:forEach>
				</select>
				</span>
			</div>
			<div class="topRight">
				<button class="btn1" onclick="search();">查询</button>
			</div>
		</div>
		 
		<div id="chart01" style="width: 100%; height:400px;background:#FFFFFF;"></div>
        <div id="chart02" style="width: 100%; height:400px;background:#FFFFFF;"></div>
        <div id="chart03" style="width: 100%; height:400px;background:#FFFFFF;"></div>
        <div id="chart04" style="width: 100%; height:400px;background:#FFFFFF;"></div>
        <div id="chart05" style="width: 100%; height:400px;background:#FFFFFF;"></div>
        <div id="chart06" style="width: 100%; height:400px;background:#FFFFFF;"></div>
        <div id="chart07" style="width: 100%; margin-top: 39px;height:400px;"></div>
	    <div id="chart08" style="width: 100%; margin-top: 39px;height:400px;"></div>
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