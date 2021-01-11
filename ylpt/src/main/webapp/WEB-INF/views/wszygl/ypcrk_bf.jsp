<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/commons/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
<title>药品出入库分析</title>

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
    document.getElementById("idname").style.display="none";
    $("#tablename").html("");
    }
function getData(){
       
       var jgdm=$("#jgdm").val();
       if(jgdm=="" ||jgdm==null){
        jgdm='${jgdm}'  
      } 
        
      
      ypcrkEchars(jgdm); 
     
      }
function ypcrkEchars(jgdm){
  
      var kssj=$("#kssj").val();
      var jssj=$("#jssj").val();
      if(jssj<kssj){
    	  alert('请选择的结束时间大于或大于开始时间')
    	return   
      }
      $.ajax({
        url: "${ctx}/ypcrk/ypcrk.json?p_kssj="+kssj
              +"&p_jssj="+jssj
              +"&p_yljgdm="+jgdm,    
         datatype:"json",
        context: document.body, 
        success: function(data){
           var nodes=eval(data);
           var hh= JSON.stringify(nodes);
           var xx=JSON.parse(hh);
           
           var fianl=xx.zhypjeList;//综合药品出入库金额
           var yljgmc=new Array();
           var yljgdm=new Array();
           var rkypje=new Array();
           var ckypje=new Array();
           
           var fian2=xx.jcypjeList;//基层药品出入库金额
           var yljgmc2=new Array();
           var yljgdm2=new Array();
           var rkypje2=new Array();
           var ckypje2=new Array(); 
           
           for (var i=0;i<fianl.length;i++) { 
        	   yljgmc[i]=fianl[i].yljgmc;
        	   yljgdm[i]=fianl[i].yljgdm;
        	   rkypje[i]=fianl[i].rkypje; 
        	   ckypje[i]=fianl[i].ckypje; 
        	   
              }
           for (var i=0;i<fian2.length;i++) { 
        	   yljgmc2[i]=fian2[i].yljgmc;
        	   yljgdm2[i]=fian2[i].yljgdm;
        	   rkypje2[i]=fian2[i].rkypje; 
        	   ckypje2[i]=fian2[i].ckypje; 
        	  
              } 
           
             chart01('chart01',yljgmc,yljgdm,rkypje,ckypje,kssj,jssj); 
            chart02('chart02', yljgmc2,yljgdm2,rkypje2,ckypje2,kssj,jssj); 
            
          }
          });
      getchart03(jgdm,kssj,jssj,'');  
     
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
 
function chart01(id,yljgmc,yljgdm,rkypje,ckypje,kssj,jssj) { 
	var zckje1=0;
	var zrkje1=0;
	for(var i=0;i<rkypje.length;i++){
		zrkje1+=Number(rkypje[i])
	}
	for(var i=0;i<ckypje.length;i++){
		zckje1+=Number(ckypje[i])
	}
	$("#ckje").val('');
	$("#ckje").val(zckje1);
	$("#rkje").val('');
	$("#rkje").val(zrkje1);
	
	var myChart = echarts.init(document.getElementById(id));
	    myChart.dispose();
	    myChart = echarts.init(document.getElementById(id));
	    var option = {
	    		 title: {
	    			 textStyle: {  
	    				 fontStyle: 'normal', 
	    				 fontWeight: 'normal',
	    				 fontSize: 15 },
	                 text: '综合医院',  
	                 subtext:'出库金额:'+Number(zckje1).toFixed(2)+'万元;'+'入库金额'+Number(zrkje1).toFixed(2)+'万元',
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
	                    if (item.seriesName==='入库药品金额') {
	                    	hjItem = item;
	                    }
	                    if (item.seriesName==='出库药品金额') {
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
	            left: 46,
	            right: 37,
	            top: 80,
	            bottom: 45,
	        },
	        legend: {
	            top: 10,
	            right: 35,
	            itemWidth: 15,
	            itemHeight: 9,
	            bottom: -5,
	            data: ['入库药品金额','出库药品金额']
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
	                name: '入库药品金额',
	                type: 'bar',
	                barWidth: 19,
	                
	                data: rkypje
	            },
	            {
	                name: '出库药品金额',
	                type: 'bar',
	                barWidth: 19,
	                
	                data: ckypje
	            },
	             
	        ]
	    };
	    myChart.setOption(option); 
	    myChart.on('click', function(params) { 
	    	$("#tablename").html("");
	    	 document.getElementById("idname").style.display="none";
	    	 getchart03(yljgdm[params.dataIndex],kssj,jssj,yljgmc[params.dataIndex]);  
	           }); 
}
function chart02(id,yljgmc,yljgdm,rkypje,ckypje,kssj,jssj){  
	
	var zckje2=0;
	var zrkje2=0;
	for(var i=0;i<rkypje.length;i++){
		zckje2+=Number(ckypje[i])
	}
	for(var i=0;i<ckypje.length;i++){
		zrkje2+=Number(rkypje[i])
	}
	
	$("#ckje2").val('');
	$("#ckje2").val(zckje2);
	$("#rkje2").val('');
	$("#rkje2").val(zrkje2);
	var ck=(Number($("#ckje2").val())+Number($("#ckje").val()))
	var rk=(Number($("#rkje2").val())+Number($("#rkje").val()))
	$("#jtysqy").html("全区药品入库金额:"+Number(rk).toFixed(2)+'万元;'+"出库金额:"+Number(ck).toFixed(2)+'万元');
	var myChart = echarts.init(document.getElementById(id));
    myChart.dispose();
    myChart = echarts.init(document.getElementById(id));
    var option = {
    		 title: {
    			 textStyle: {  
    				 fontStyle: 'normal', 
    				 fontWeight: 'normal',
    				 fontSize: 15 },
                 text: '基础医院', 
                 subtext:'出库金额:'+Number(zckje2).toFixed(2)+'万元;'+'入库金额'+Number(zrkje2).toFixed(2)+'万元',
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
                    if (item.seriesName==='入库药品金额') {
                    	hjItem = item;
                    }
                    if (item.seriesName==='出库药品金额') {
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
            left: 46,
            right: 37,
            top: 80,
            bottom: 45,
        },
        legend: {
            top: 10,
            right: 35,
            itemWidth: 15,
            itemHeight: 9,
            bottom: -5,
            data: ['入库药品金额','出库药品金额']
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
                name: '入库药品金额',
                type: 'bar',
                barWidth: 19,
                
                data: rkypje
            },
            {
                name: '出库药品金额',
                type: 'bar',
                barWidth: 19,
                
                data: ckypje
            },
             
        ]
    };
    myChart.setOption(option); 
    myChart.on('click', function(params) { 
    	$("#tablename").html("");
    	 document.getElementById("idname").style.display="none";
    	 getchart03(yljgdm[params.dataIndex],kssj,jssj,yljgmc[params.dataIndex]);
           }); 
}


 

function getchart03(jgdm,kssj,jssj,yljgmc){  
    $.ajax({
      url: "${ctx}/ypcrk/getechars03.json?p_jgdm="+jgdm 
            +"&p_kssj="+kssj
            +"&p_jssj="+jssj,    
       datatype:"json",
      context: document.body, 
      success: function(data){
         var nodes=eval(data);
         var hh= JSON.stringify(nodes);
         var xx=JSON.parse(hh);
         
         var fian3=xx.getechars03List;
         var rkypje=new Array();
         var rkypmc=new Array();  
        var  ypbm=new Array();
        
         var fian4=xx.getechars04List;
         var ckypje=new Array();
         var ckypmc=new Array(); 
         var ypbm4=new Array();
         
         var fian5=xx.getechars05List;
         var zs=new Array();
         var ypbm5=new Array();
         var ypmc5=new Array();
         
         for (var i=0;i<fian3.length;i++) { 
        	 rkypje[i]=fian3[i].rkypje;
        	 rkypmc[i]=fian3[i].rkypmc; 
        	 ypbm[i]=fian3[i].ypbm; 
        	 
            }
         for (var i=0;i<fian4.length;i++) { 
        	 ckypje[i]=fian4[i].ckypje;
        	 ckypmc[i]=fian4[i].ckypmc; 
        	 ypbm4[i]=fian4[i].ypbm; 
        	 
            }
         for (var i=0;i<fian5.length;i++) { 
        	 zs[i]=fian5[i].zs;
             ypbm5[i]=fian5[i].ypbm; 
             ypmc5[i]=fian5[i].ypmc; 
            }
         
         
         
         
        chart03('chart03',rkypmc,rkypje,yljgmc,ypbm,kssj,jssj,jgdm);  
        chart04('chart04',ckypje,ckypmc,yljgmc,ypbm4,kssj,jssj,jgdm);
        chart05('chart05',zs,ypbm5,ypmc5,kssj,jssj,jgdm);
        }
        });
}


function chart03(id,rkypmc,rkypje,yljgmc,ypbm,kssj,jssj,jgdm) {
	
	   var xMax =null;
	   for(var i=0;i<rkypje.length;i++){
	     xMax+=Number(rkypje[i])
	   } 
	   if(xMax!=null){
	  		 xMax=xMax.toFixed(3) 
	  	   }
	    var myChart = echarts.init(document.getElementById(id));
	      myChart.dispose();
	      myChart = echarts.init(document.getElementById(id));
	      var data =  rkypje;
	      var dataShadow = [];
	     
	      for (var i = 0; i < data.length; i++) {
	          dataShadow.push({
	              value: xMax,
	              value2: data[i]
	          });
	      }
	      ;
	      option = {
	          tooltip: {
	              trigger: "axis",
	              axisPointer: {
	                  type: "shadow"
	              }
	          },
	          title: {
	                text: '入库TOP20药品金额列表(万元)',  
	            }, 
	          grid: {
	              // left: "22%",
	              containLabel: true,
	              left: 0,
	              right: "12%",
	              bottom: "0%",
	              top: "12%",
	             
	          },
	          xAxis: {
	              type: "value",
	               
	              boundaryGap: true,
	              axisTick: {
	                  show: false
	              },
	              axisLabel: {
	                  show: false,
	              },
	              splitLine: {
	                  show: false,
	              },
	              axisLine: {
	                  show: false,
	              },
	          },
	          yAxis: {
	              type: "category",
	              axisTick: {
	                  show: false
	              },
	              axisLine: {
	                  show: false
	              },
	              axisLabel: {
	                  interval: 0,
	                  color: "#333",
	                  fontSize: 14,
	              },
	              data:  rkypmc
	          },
	          color: "#43bcf4",
	          series: [
	              {   
	                  type: "bar",
	                  itemStyle: {
	                      normal: {
	                          color: "#ffecc8",
	                          barBorderRadius: [3, 3, 3, 3]
	                      }
	                  },
	                  label: {
	                      show: true,
	                      position: "right",
	                      fontSize: 14,
	                      color: "#333",
	                      padding: [0, 0, 0, 10],
	                      formatter: function (params) {
	                          
	                          return params.data.value2
	                      }

	                  },
	                  barWidth: 10,
	                  barGap: "-100%",
	                  barCategoryGap: "40%",
	                  data: dataShadow,
	                  animation: false
	              },
	              {
	                  type: "bar",
	                  barWidth: 10,
	                  itemStyle: {
	                      color: "#ffb820",
	                      barBorderRadius: [3, 3, 3, 3],
	                  },
	                  data: data,
	              }
	          ]
	      };
	      myChart.setOption(option);
	      myChart.on('click', function(params) { 
	    	  $("#tablename").html("");
	    		$("#tablename").html("药品入库列表展示");
	    	  sess3(jgdm,ypbm[params.dataIndex],kssj,jssj,'3')  
	             }); 
	  };

 

	  function chart04(id,ckypje,ckypmc,yljgmc,ypbm,kssj,jssj,jgdm) {
		 
	  	    var xMax =null;
	  	   for(var i=0;i<ckypje.length;i++){
	  	     xMax+=Number(ckypje[i])
	  	   } 
	  	   if(xMax!=null){
	  		 xMax=xMax.toFixed(3) 
	  	   }
	  	   
	  	    var myChart = echarts.init(document.getElementById(id));
	  	      myChart.dispose();
	  	      myChart = echarts.init(document.getElementById(id));
	  	      var data =  ckypje;
	  	      var dataShadow = [];
	  	     
	  	      for (var i = 0; i < data.length; i++) {
	  	          dataShadow.push({
	  	              value: xMax,
	  	              value2: data[i]
	  	          });
	  	      }
	  	      ;
	  	      option = {
	  	          tooltip: {
	  	              trigger: "axis",
	  	              axisPointer: {
	  	                  type: "shadow"
	  	              }
	  	          },
	  	          title: {
	  	                text: '出库TOP20药品金额列表(万元)',  
	  	            }, 
	  	          grid: {
	  	              // left: "22%",
	  	              containLabel: true,
	  	              left: 0,
	  	              right: "12%",
	  	              bottom: "0%",
	  	              top: "12%",
	  	             
	  	          },
	  	          xAxis: {
	  	              type: "value",
	  	              
	  	              boundaryGap: true,
	  	              axisTick: {
	  	                  show: false
	  	              },
	  	              axisLabel: {
	  	                  show: false,
	  	              },
	  	              splitLine: {
	  	                  show: false,
	  	              },
	  	              axisLine: {
	  	                  show: false,
	  	              },
	  	          },
	  	          yAxis: {
	  	              type: "category",
	  	              axisTick: {
	  	                  show: false
	  	              },
	  	              axisLine: {
	  	                  show: false
	  	              },
	  	              axisLabel: {
	  	                  interval: 0,
	  	                  color: "#333",
	  	                  fontSize: 14,
	  	              },
	  	              data:  ckypmc
	  	          },
	  	          color: "#43bcf4",
	  	          series: [
	  	              {   
	  	                  type: "bar",
	  	                  itemStyle: {
	  	                      normal: {
	  	                          color: "#ffecc8",
	  	                          barBorderRadius: [3, 3, 3, 3]
	  	                      }
	  	                  },
	  	                  label: {
	  	                      show: true,
	  	                      position: "right",
	  	                      fontSize: 14,
	  	                      color: "#333",
	  	                      padding: [0, 0, 0, 10],
	  	                      formatter: function (params) {
	  	                          
	  	                          return params.data.value2
	  	                      }

	  	                  },
	  	                  barWidth: 10,
	  	                  barGap: "-100%",
	  	                  barCategoryGap: "40%",
	  	                  data: dataShadow,
	  	                  animation: false
	  	              },
	  	              {
	  	                  type: "bar",
	  	                  barWidth: 10,
	  	                  itemStyle: {
	  	                      color: "#ffb820",
	  	                      barBorderRadius: [3, 3, 3, 3],
	  	                  },
	  	                  data: data,
	  	              }
	  	          ]
	  	      };
	  	      myChart.setOption(option);
	  	      myChart.on('click', function(params) {  
	  	    	 $("#tablename").html("");
	 			$("#tablename").html("药品出库列表展示");
		    	  sess4(jgdm,ypbm[params.dataIndex],kssj,jssj,'4')  
	  	             }); 
	  	  };

	    function chart05(id,zs,ypbm5,ypmc5,kssj,jssj,jgdm){ 
	    
	  	  var myChart=echarts.init(document.getElementById(id));
	  	  var option = {


	  	      color:['#ffb820', '#9deb8d', '#7cb5ec', '#f6ae6e', 
	  	          '#adff2f', '#444446', '#799aec', '#61d4e2',
	  	          '#6b8e23', '#87ceeb', '#b8860b', '#32cd32' ], 
	  	      title: {
	  	            text: '沉淀库存数量(不含期初数)',
	  	            textStyle: {
	  	              fontSize: 16
	  	              }
	  	        },
	  	        tooltip : {
	  	            trigger: 'axis',
	  	            formatter:function(v){
	  	              var res = v[0].name;
	  	              for(var i = 0; i<v.length; i++) {
	  	                 res += '<br/>'+'<span style="display:inline-block;margin-right:5px;border-radius:10px;width:9px;height:9px;background-color:' + 
	 	  	                v[i].color.colorStops[0].color + '"></span>' + v[i].seriesName + ' : ' + (v[i].value+"");	
	  	              }
	  	              return res;
	  	              
	  	            },
	  	            axisPointer : {            // 坐标轴指示器，坐标轴触发有效
	  	                type : 'shadow'        // 默认为直线，可选为：'line' | 'shadow'
	  	            }
	  	        },
	  	        toolbox: {
	  	            show: true,
	  	            feature: {
	  	                magicType: {show: true, type: ['line', 'bar']},
	  	                saveAsImage: {show: true}
	  	            }
	  	        },
	  	        legend: {
	  	            
	  	        data:['药品库存'],
	  	            right:'12%',
	  	            orient: 'vertical'
	  	           
	  	        },
	  	        grid: {
	  	            left: '3%',
	  	            right: '4%',
	  	            bottom: '3%',
	  	            containLabel: true
	  	        },
	  	        xAxis : [
	  	            {
	  	              axisLabel:{
	  	                  formatter:function(v){return Math.abs(v)},
	  	              },
	  	                type : 'value',
	  	                name:'数量'
	  	            }
	  	        ],
	  	        yAxis : [
	  	            {
	  	                type : 'category',
	  	                axisTick : {show: true},
	  	                data :  ypmc5 
	  	                 
	  	            }
	  	        ],
	  	        series : [
	  	         
	  	            {
	  	                name:'药品库存',
	  	                type:'bar',
	  	                stack: '总量',
	  	                label: {
	  	                    normal: {
	  	                        show: false
	  	                    }
	  	                },
	  	              
	  	                itemStyle: {
	  	                    normal: {
	  	                        color: new echarts.graphic.LinearGradient(
	  	                            0, 0, 0, 1,
	  	                            [
	  	                                {offset: 0, color: "#ffb820",},
	  	                                {offset: 0.5, color: '#ffb820'},
	  	                                {offset: 1, color: '#ffb820'}
	  	                            ]
	  	                        )
	  	                    },
	  	                    emphasis: {
	  	                        color: new echarts.graphic.LinearGradient(
	  	                            0, 0, 0, 1,
	  	                            [
	  	                                {offset: 0, color: '#ffb820'},
	  	                                {offset: 0.7, color: '#ffb820'},
	  	                                {offset: 1, color: '#ffb820'}
	  	                            ]
	  	                        )
	  	                    }
	  	                },
	  	                data:zs
	  	            },
	  	             
	  	        ]
	  	    };
	  	    myChart.setOption(option);
	  	     myChart.on('click', function(params) {  
	  	    	  
	  	    	$("#tablename").html("");
		    	$("#tablename").html("药品库存列表展示");
	  	    	sess5(jgdm,ypbm5[params.dataIndex],kssj,jssj,'5')     
	  	    	  
		    	  
	  	        
	  	        
	  	  }); 
	  	}  
 function sess3(jgdm,ypbm,kssj,jssj,lx){
 

	 document.getElementById("idname").style.display="";//显示 
		layui.use([ 'table', 'layer' ], function() {
			var table = layui.table;
			table.render({
						elem : '#querytable',
						url : '${ctx}/ypcrk/gettables',
						method : 'post',
						where : { 
							p_jgdm : jgdm,
							p_ypbm : ypbm,
							p_kssj : kssj,
							p_jssj : jssj,
							 
						},
						cols : [[ 
							 
		                    { field : 'yljgmc', title : '入库结构', width : '210' }, 
		                    { field : 'ypmc', title : '药品名称', width : '210' } ,
		                    { field : 'ypgg', title : '药品规格', width : '150' } ,
		                    { field : 'yplx', title : '药品类型', width : '100' } ,
		                    { field : 'cj', title : '厂家', width : '180' },
		                    { field : 'rkl', title : '入库量', width : '100' },
		                    { field : 'rkypje', title : '入库金额', width : '100' } ,
		                    { field : 'rksj', title : '入库时间', width : '100' }  
		                     

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
 function sess4(jgdm,ypbm,kssj,jssj,lx){
	 document.getElementById("idname").style.display="";//显示 
		layui.use([ 'table', 'layer' ], function() {
			var table = layui.table;
			table.render({
						elem : '#querytable',
						url : '${ctx}/ypcrk/gettables4',
						method : 'post',
						where : { 
							p_jgdm : jgdm,
							p_ypbm : ypbm,
							p_kssj : kssj,
							p_jssj : jssj,
							 
						},
						cols : [[ 
							 
		                    { field : 'yljgmc', title : '出库结构', width : '210' }, 
		                    { field : 'ypmc', title : '药品名称', width : '210' } ,
		                    { field : 'ypgg', title : '药品规格', width : '180' } ,
		                    { field : 'yplx', title : '药品类型', width : '100' } ,
		                    { field : 'cj', title : '药品厂家', width : '150' },
		                    { field : 'ckl', title : '出库量', width : '100' },
		                    { field : 'rkypje', title : '出库金额', width : '100' } ,
		                    { field : 'cksj', title : '出库时间', width : '100' }  
		                     

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
 function sess5(jgdm,ypbm,kssj,jssj,lx){
	 document.getElementById("idname").style.display="";//显示 
		layui.use([ 'table', 'layer' ], function() {
			var table = layui.table;
			table.render({
						elem : '#querytable',
						url : '${ctx}/ypcrk/gettables5',
						method : 'post',
						where : { 
							p_jgdm : jgdm,
							p_ypbm : ypbm,
							p_kssj : kssj,
							p_jssj : jssj,
							 
						},
						cols : [[ 
		                    { field : 'ypmc', title : '药品名称', width : '33.3%' } ,
		                    { field : 'ckl', title : '出库量', width : '33.3%'  },
		                    { field : 'rkl', title : '入库量', width : '34%'  } ,
		                   
		                     

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
						<c:forEach items="${ypcrkjgList}" var="jg">
							<option value="${jg.jgdm}">${jg.jgmc}</option>
						</c:forEach>
				</select>
				</span>
			</div>
			<div class="topRight">
				<button class="btn1" onclick="search();">查询</button>
			</div>
		</div>
       <div style="position: absolute;margin-top: 30px;"> 
             <span style="font-size:22px" id="jtysqy" class="name"></span> 
       </div>
		<div style="width: 100%; height: 400px; margin-top: 100px">
		
			<div id="chart01"
				style="width: 50%; height: 400px; background: #FFFFFF; float: left"></div>
			<div id="chart02"
				style="width: 50%; height: 400px; background: #FFFFFF; float: left"></div>
		</div>
		<div
			style="position: absolute; margin-left: 82px; margin-top: -396px;">
			<img src="<c:url value="/static/commons/images/xz3.png"/>">
		</div>
		<div
			style="position: absolute; margin-left: 661px; margin-top: -396px;">
			<img src="<c:url value="/static/commons/images/xz3.png"/>">
		</div>
		<div style="width: 100%; height: 450px; margin-top: 96px">
			<div id="chart03"
				style="width: 50%; height: 450px; background: #FFFFFF; float: left"></div>
			<div id="chart04"
				style="width: 50%; height: 450px; background: #FFFFFF; float: left"></div>
		</div>
		<div
			style="position: absolute; margin-left: 854px; margin-top: -446px;">
			<img src="<c:url value="/static/commons/images/xz3.png"/>">
		</div>
		<div
			style="position: absolute; margin-left:274px; margin-top: -446px;">
			<img src="<c:url value="/static/commons/images/xz3.png"/>">
		</div>
		
		<div id="chart05"
				style="width: 100%; height: 450px; margin-top: 96px;background: #FFFFFF;"></div>
		
		<div style="position: absolute;margin-top: 10px; id="tabname"> 
             <span style="font-size:22px" id="tablename" class="tablename"></span> 
       </div>
       
		<div
			style="position: absolute; margin-left: 210px; margin-top: -450px;">
			<img src="<c:url value="/static/commons/images/xz3.png"/>">
		</div>
		
		
		
		
		
		
		<div>
			<input id='ckje' style='display: none' type="text" name="ckje" /> <input id='rkje' style='display: none' type="text"
				name="rkje" />
				<input id='ckje2' style='display: none' type="text"
				name="ckje2" />
				<input id='rkje2' style='display: none' type="text"
				name="rkje2" />
		</div>
        <div id="idname"
			style="width: 100%; background: #FFFFFF; margin: 35px auto;margin-top: 105px; display: none">
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