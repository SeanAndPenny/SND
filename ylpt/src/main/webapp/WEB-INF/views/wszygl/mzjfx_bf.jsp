<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/commons/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
<title>门急诊分析</title>

<link rel="stylesheet" type="text/css"
	href="<c:url value="/static/commons/css/reset2.css"/>" />
<script type="text/javascript"
	src="<c:url value="/static/layui/layui.js"/>"></script>
<link rel="stylesheet" type="text/css"
	href="<c:url value="/static/layui/css/layui.css"/>" />
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
    document.getElementById("idname").style.display='none'; 
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
    	  alert('请选择的结束时间大于或大于开始时间')
    	return   
      }
      $.ajax({
        url: "${ctx}/mzjfx/mzjfx.json?p_kssj="+kssj
              +"&p_jssj="+jssj
              +"&p_jgdm="+jgdm,    
         datatype:"json",
        context: document.body, 
        success: function(data){
           var nodes=eval(data);
           var hh= JSON.stringify(nodes);
           var xx=JSON.parse(hh);
           var fianl=xx.mzjfxList;
           var yljgmc=new Array();
           var yljgdm=new Array();
           var mzrs=new Array();
           var jzrs=new Array(); 
           
           var fian2=xx.mzjJcfxList;
           var yljgmc2=new Array();
           var yljgdm2=new Array();
           var mzrs2=new Array();
           
           var fian3=xx.mzJbflList
           var rs=new Array();
           var jbflbm=new Array();
           var jbflmc=new Array();
           
           for (var i=0;i<fianl.length;i++) { 
        	   yljgmc[i]=fianl[i].yljgmc;
        	   yljgdm[i]=fianl[i].yljgdm;
        	   mzrs[i]=fianl[i].mzrs; 
        	   jzrs[i]=fianl[i].jzrs; 
              }
           for (var i=0;i<fian2.length;i++) { 
        	   yljgmc2[i]=fian2[i].yljgmc;
        	   yljgdm2[i]=fian2[i].yljgdm;
        	   mzrs2[i]=fian2[i].mzrs; 
        	  
              } 
           for(var i=0;i<fian3.length;i++){
        	   rs[i]=fian3[i].rs;
        	   jbflbm[i]=fian3[i].jbflbm;
        	   jbflmc[i]=fian3[i].jbflmc; 
           }
             chart01('chart01',yljgmc,mzrs,jzrs,yljgdm,kssj,jssj); 
            chart02('chart02',yljgmc2,mzrs2,yljgdm2,kssj,jssj);
            chart04('chart04',rs,jbflbm,jbflmc,kssj,jssj,jgdm);
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
function chart01(id,yljgmc,mzrs,jzrs,yljgdm,kssj,jssj) { 
	  
	var myChart = echarts.init(document.getElementById(id));
	    myChart.dispose();
	    myChart = echarts.init(document.getElementById(id));
	    var option = {
	    		 title: {
	    			 textStyle: {  
	    				 fontStyle: 'normal', 
	    				 fontWeight: 'normal',
	    				 fontSize: 15 },
	                 text: '综合医院门急诊人数',  
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
	                    if (item.seriesName==='门诊人数') {
	                    	hjItem = item;
	                    }
	                    if (item.seriesName==='急诊人数') {
	                    	ldItem = item;
	                    }
	                    
	                      
	                    mcs=item;
	                     
	                  });
	                  str += mcs.name+":"+"<br>";
	                  str += hjItem.marker+hjItem.seriesName+":"+formatNum(hjItem.data)+"<br>";
	                  str += ldItem.marker+ldItem.seriesName+":"+formatNum(ldItem.data)+"<br>";
	                   
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
	            data: ['门诊人数','急诊人数']
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
	            {
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
	                name: '门诊人数',
	                type: 'bar',
	                barWidth: 19,
	                
	                data: mzrs
	            },
	            {
	                name: '急诊人数',
	                type: 'bar',
	                barWidth: 19,
	                
	                data: jzrs
	            },
	             
	        ]
	    };
	    myChart.setOption(option); 
	    myChart.on('click', function(params) { 
	      
	           }); 
}
function chart02(id,yljgmc,mzrs,yljgdm2,kssj,jssj){  
	 
	 
	var myChart = echarts.init(document.getElementById(id));
	    myChart.dispose();
	    myChart = echarts.init(document.getElementById(id));
	    var option = {
	    		 title: {
	    			 textStyle: {  
	    				 fontStyle: 'normal', 
	    				 fontWeight: 'normal',
	    				 fontSize: 15 },
	                 text: '基层医院门急诊人数',  
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
	                  var ldItem = null; 
	                  var mcs = null;
	                  params.forEach(function(item,idx){  
	                    if (item.seriesName==='就诊人数') {
	                    	ldItem = item;
	                    }  mcs=item;  
	                  });
	                  str += mcs.name+":"+"<br>"; 
	                  str += ldItem.marker+ldItem.seriesName+":"+formatNum(ldItem.data)+"<br>";
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
	            data: ['就诊人数']
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
	        xAxis:
	        { name:'名称',
	             data: yljgmc,
	        },
	        yAxis: [
	            {
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
	                name: '就诊人数',
	                type: 'bar',
	                barWidth: 19,
	                 
	                data: mzrs
	            },
	            
	             
	        ]
	    };
	    myChart.setOption(option);   
	    myChart.on('click', function(params) { 
	    	 document.getElementById("idname").style.display='none'; 
		      getchart03(yljgdm2[params.dataIndex],kssj,jssj,yljgmc[params.dataIndex]);
		           }); 
}
function getchart03(yljgdm,kssj,jssj,yljgmcs){
	  $.ajax({
	      url: "${ctx}/mzjfx/getchart03.json?p_yljgdm="+yljgdm 
	            +"&p_kssj="+kssj +"&p_jssj="+jssj,    
	       datatype:"json",
	      context: document.body, 
	      success: function(data){
	         var nodes=eval(data);
	         var hh= JSON.stringify(nodes);
	         var xx=JSON.parse(hh);
	         var fianl=xx.getMjzywechartsList;
	         var yljgmc=new Array();
	         var yljgdm=new Array();
	         var mzrs=new Array();
	         var jzrs=new Array();
	         for(var i=0;i<fianl.length;i++){
	        	 yljgmc[i]=fianl[i].yljgmc;
	        	 mzrs[i]=fianl[i].mzrs;
	        	  
	         }
	         chart03('chart03',yljgmc,mzrs,yljgmcs); 
	        }
	        });
}

function chart03(id,yljgmc,mzrs,yljgmcs){ 
	 
	 document.getElementById("chart03").style.display="";//显示
	var myChart = echarts.init(document.getElementById(id));
	    myChart.dispose();
	    myChart = echarts.init(document.getElementById(id));
	    var option = {
	    		 title: {
	    			 textStyle: {  
	    				 fontStyle: 'normal', 
	    				 fontWeight: 'normal',
	    				 fontSize: 15 },
	                 text: yljgmcs+'所属服务站门急诊人数',  
	             }, 
	        color:['#86cb68', '#00adf4', '#066fd8', 
	          '#87ceeb', '#32cd32' ],
	        tooltip: {
	            trigger: 'axis',
	            padding: [5, 10], 
	            axisPointer: {            // 坐标轴指示器，坐标轴触发有效
	                type: 'shadow'        // 默认为直线，可选为：'line' | 'shadow'
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
	            data: ['就诊人数']
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
	        xAxis:
	        { name:'社区名称',
	             data: yljgmc,
	        },
	        yAxis: [
	            {
	                type: 'value', 
	                name: "人次",
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
	                name: '就诊人数',
	                type: 'bar',
	                barWidth: 19,
	                 
	                data: mzrs
	            },
	            
	             
	        ]
	    };
	    myChart.setOption(option);   
	    myChart.on('click', function(params) { 
		      getchart03(yljgdm[params.dataIndex],kssj,jssj);
		           }); 
}

function chart04(id,rs,jbflbm,jbflmc,kssj,jssj,jgdm){ 
	 
  
	var myChart = echarts.init(document.getElementById(id));
	    myChart.dispose();
	    myChart = echarts.init(document.getElementById(id));
	    var option = {
	    		 title: {
	    			 textStyle: {  
	    				 fontStyle: 'normal', 
	    				 fontWeight: 'normal',
	    				 fontSize: 15 },
	                 text:'疾病分类分析',  
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
	                  var ldItem = null; 
	                  var mcs = null;
	                  params.forEach(function(item,idx){  
	                    if (item.seriesName==='就诊人数') {
	                    	ldItem = item;
	                    }  mcs=item;  
	                  });
	                  str += mcs.name+":"+"<br>"; 
	                  str += ldItem.marker+ldItem.seriesName+":"+formatNum(ldItem.data)+"<br>";
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
	            data: jbflmc
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
	        xAxis:
	        { name:'疾病大类名称',
	             data: jbflmc,
	        },
	        yAxis: [
	            {
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
	                name: '就诊人数',
	                type: 'bar',
	                barWidth: 19,
	                 
	                data: rs
	            },
	            
	             
	        ]
	    };
	    myChart.setOption(option);   
	     myChart.on('click', function(params) { 
	    	 gettables(jbflbm[params.dataIndex],kssj,jssj,jgdm);
		           }); 
}
function gettables(jbflbm,kssj,jssj,jgdm ){

	 document.getElementById("idname").style.display="";//显示 
	layui.use([ 'table', 'layer' ], function() {
		var table = layui.table;
		table.render({
					elem : '#querytable',
					url : '${ctx}/mzjfx/gettables',
					method : 'post',
					where : { 
						p_jbflbm : jbflbm,
						p_kssj : kssj,
						p_jssj : jssj,
						p_jgdm : jgdm,
						 
					},
					cols : [[ 
						{ field : 'hzxm', title : '患者姓名', width : '100' }, 
	                    { field : 'yljgmc', title : '就诊机构', width : '200' },
	                    { field : 'jzksmc', title : '就诊科室', width : '200' }, 
	                    { field : 'jzksrq', title : '就诊日期', width : '120' } ,
	                    { field : 'zzysxm', title : '主治医生', width : '120' } ,
	                    { field : 'jzzdsm', title : '诊断名称', width : '303' } ,
	                    { field : 'jbflmc', title : '诊断分类', width : '100' }
	                     
	                     

					]],
					height : '500',
					page : {
						layout : [ 'count', 'pre', 'page', 'next', 'skip',
								'limit' ],
						groups : 5,
						first : '首页',
						last : '尾页',
						limit : 10,
						limits : [ 5, 10, 20 ]
					},
					done : function(res, curr, count) {
						 	 
					}
				});
});
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
							<i class="r " onclick="sjxz('day')">当天 </i>
							<i class="w" onclick="sjxz('week')">本周</i>
							<i class="y" onclick="sjxz('month')">本月</i>
							<i class="qb active" onclick="sjxz('all')">全部</i>
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
					for="">机构名称</label> <select style="width: 165px;" id="jgdm"
					name="jgdm" lay-search>
						<option value="">全区</option>
						<c:forEach items="${mjzjgList}" var="jg">
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
		<div id="chart03"
			style="margin-top: 57px; width: 100%; height: 400px; background: #FFFFFF; display: none"></div>
		<div id="chart04"
			style="margin-top: 57px; width: 100%; height: 400px; background: #FFFFFF;"></div>
		<div id="idname"
			style="width: 100%; background: #FFFFFF; margin: 35px auto; margin-top: 105px; display: none">
			<table id="querytable" class="layui-table" lay-filter="querytab"
				style="margin: -10px;"></table>

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