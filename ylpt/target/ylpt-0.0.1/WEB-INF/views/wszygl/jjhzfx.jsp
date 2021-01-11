<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/commons/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
<title>急救数据分析</title>


<link rel="stylesheet" type="text/css"
	href="<c:url value="/static/commons/css/reset_jj.css"/>" />

<link rel="stylesheet" type="text/css"
	href="<c:url value="/static/commons/css/index_jj.css"/>" />
<link rel="stylesheet" type="text/css"
	href="<c:url value="/static/commons/css/rkzb_index.css"/>" />


<link rel="stylesheet" type="text/css"
	href="<c:url value="/static/commons/css/swiper.min.css"/>" />

<link rel="stylesheet" type="text/css"
	href="<c:url value="/static/commons/js/My97DatePicker/skin/WdatePicker.css"/>" />
<script type="text/javascript"
	src="<c:url value="/static/commons/js/My97DatePicker/WdatePicker.js"/>"></script>
<script type="text/javascript"
	src="<c:url value="/static/commons/js/jquery-index.min.js"/>"></script>
<script type="text/javascript"
	src="<c:url value="/static/commons/js/echarts.min.index.js"/>"></script>
<script type="text/javascript"
	src="<c:url value="/static/commons/js/swiper.js"/>"></script>
<style type="text/css">
.circular1 {
	width: 50px;
	height: 30px;
	border-radius: 16px;
	background-color: #ccc;
	transition: .3s;
	cursor: pointer;
}

.round-button1 {
	width: 30px;
	height: 30px;
	background: #fff;
	border-radius: 50%;
	box-shadow: 0 1px 5px rgba(0, 0, 0, .5);
	transition: .3s;
	position: relative;
	left: 0;
}

.round-button1:hover {
	transform: scale(1.2);
	box-shadow: 0 1px 8px rgba(0, 0, 0, .5);
}
</style>

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
$(document).ready(function(){
	 getData();	 
});
$(function () {
    $('.circular1').click(function () {
        var left = $('.round-button1').css('left');
        left = parseInt(left);
        if (left == 0) {
        	
            $('.round-button1').css({'left': '22px', 'background-color': '#2C87E9'});
            $(this).css({'background-color': '#e7e7e7', 'box-shadow': '0 0 5px #999 inset'})
        } else {
            $('.round-button1').css({'left': '0', 'background-color': '#fff'})

        }
    })
});
function search() {
	
   
	getData();		 
}
function getData(){
	var jgdm=$("#jgdm").val();
    if(jgdm=="" ||jgdm==null=="undefined"){
     jgdm='${jgdm}'  
   } 
	 var kssj=$("#kssj").val();
     var jssj=$("#jssj").val();
     if(jssj<kssj){
   	  alert('请选择的结束时间大于或大于开始时间')
   	   return   
    } 
     getchartAll(kssj,jssj,jgdm);
}	 
</script>
<script type="text/javascript">
  function getchartAll(kssj,jssj,jgdm){
	  $.ajax({
	      url: "${ctx}/jjhzfx/jjhzfx.json?p_kssj="+kssj
	            +"&p_jssj="+jssj+"&p_yljgdm="+jgdm,    
	       datatype:"json",
	      context: document.body, 
	      success: function(data){
	         var nodes=eval(data);
	         var hh= JSON.stringify(nodes);
	         var xx=JSON.parse(hh); 
	         var fian1=xx.getchart01List;  
	         var jjzs=xx.jjzs;  
	         chart01('chart01',fian1,jjzs);
	         
	         var fian2=xx.getchart02List;  
	         chart02('chart02',fian2);
	         var fian3=xx.getchart03List;  
	         chart03('chart03',fian3);
	         var fian4=xx.getchart04List; 
	         var ccl=xx.ccl; 
	         var yljgmc=new Array();
	         var dyccl=new Array();
	         var ccpjxjsj=new Array();
	         var fian5=xx.getchart05List; 
	         
	         for (var i=0;i<fian4.length;i++) { 
	        	  
	        	   yljgmc[i]=fian4[i].yljgmc;
	        	   dyccl[i]=fian4[i].dyccl; 
	        	   ccpjxjsj[i]==fian4[i].ccpjxjsj; 
	              }
	         
	         chart05('chart05',fian5);
	         chart04('chart04Slider01',fian4,ccl,yljgmc,dyccl,ccpjxjsj);
	         
	        }
	        })
	 
  } 
 </script>
<script type="text/javascript">
 function chart01(id,fian1,jjzs) {
	 $('#legend01').html(""); 
	 var datas = [];
	 var datass = [];
	 for (var i = 0; i < fian1.length; i++) {
	      datas.push({
	        name:fian1[i].fzjbmc
	      })
	      datass.push({
	        name:fian1[i].fzjbmc,
	        value:fian1[i].sl
	      }) 
	      $('#legend01').append("<li class='li0"+(i+1)+ "'><i></i><label for=''>"+fian1[i].fzjbmc+":</label><span>"+(fian1[i].sl/jjzs*100).toFixed(2)+"%"+ "</span></li>");
	    }
	  var myChart = echarts.init(document.getElementById(id));
	  var option = {
	      tooltip: {
	          trigger: 'item',
	          axisPointer: {
	              type: 'shadow'
	          }
	      },
	      color : [ '#88CA6D', '#3AA873', '#0DAEF1','#3992F0' ],
	      series: [
	          {
	              name: '急救患者分诊级别图',
	              type: 'pie',
	              hoverOffset: 6,
	              center: ["30%", "47%"],
	              radius: ['41%', '64%'],
	              label: {
	                  show: false
	              },
	              emphasis:{
	                label:{
	                  show:true,
	                  formatter:function(params){
	                    return '{a|'+params.name+'}'+'\n'+'{b|'+params.value+'}'+'{c|人次}'
	                  },
	                  lineHeight:22,
	                  rich:{
	                    a:{
	                      color:'#333',
	                      fontSize:15
	                    },
	                    b:{
	                      fontSize:18
	                    },
	                    c:{
	                      fontSize:14
	                    }
	                  }
	                },
	                labelLine:{
	                  show:true,
	                  lineStyle:{
	                    color:'#333'
	                  }
	                }
	              },
	              data:datass  ,
	              labelLine: {
	                  show: false,
	                  length: 15,
	                  length2: 16
	              }
	          }
	      ]
	  };
	  myChart.setOption(option)
	  return myChart
	};
 </script>
<script type="text/javascript">
 function chart02(id,fian1) {
	 var datass=[];
	 for (var i = 0; i < fian1.length; i++) { 
	      datass.push({
	        name:fian1[i].fzsj,
	        value:fian1[i].sl
	      })  
	    }
	  var myChart = echarts.init(document.getElementById(id));
	  var fontColor = '#343434';
	  var chartData = datass;
	  var xData = [];
	  var sData = [];
	  $.each(chartData, function (index, item) {
	      xData.push(item.name);
	      sData.push(item.value)
	  });
	  var lineOption = {
	      lineStyle: {
	          color: 'rgba(219,225,229,.75)',
	          type: 'solid'
	      }
	  };
	  var option = {
	      tooltip: {
	          trigger: 'axis',
	          axisPointer: {
	              type: 'line',
	              label: {
	                  fontSize: 12
	              },
	              lineStyle:{
	                  color:"#3C3E7E",
	                  width:1
	              }
	          },
	          backgroundColor: 'rgba(46, 113, 146, .6)'
	      },
	      legend: {
	          itemHeight: 8,
	          itemWidth: 14,
	          right: '3%',
	          top: "4%",
	          itemGap: 20,
	          textStyle: {
	              color: "#343434",
	              fontSize: 12
	          },
	          data: [
	              {
	                name: "分诊人次",
	              }
	          ]
	      },
	      grid: {
	          containLabel: true,
	          top: '17%',
	          right: '6%',
	          left: '3%',
	          bottom: '6%'
	      },
	      yAxis: [{
	          name: '人',
	          nameGap: 10,
	          nameTextStyle: {
	              color: fontColor,
	              fontSize: 12
	          },
	          axisLabel: {
	              color: fontColor,
	              fontSize: 12
	          },
	          axisTick: {
	              show: false
	          },
	          axisLine: lineOption,
	          splitLine: {
	              show: true,
	              lineOption
	          }
	      }],
	      xAxis: [{
	          type: 'category',
	          data: xData,
	          axisLine: lineOption,
	          boundaryGap: false,
	          axisTick: {
	              show: false
	          },
	          axisLabel: {
	              margin: 10,
	              color: fontColor,
	              textStyle: {
	                  fontSize: 12
	              }
	          },
	          splitArea: {
	              show: true,
	              areaStyle: {
	                  color: ['rgba(255,255,255,.01)', 'rgba(237,240,246,.5)']
	              }
	          }
	      }],
	      series: [
	          {
	              name: '分诊人次',
	              type: 'line',
	              data: sData,
	              symbolSize: 8,
	              smooth: true,
	              zlevel: 2,
	              itemStyle: {
	                  color: 'rgba(12,190,104,1)'
	              },
	              areaStyle: {
	                  color: 'rgba(12,190,104,.2)'
	              }
	          }
	      ]
	  };
	  myChart.setOption(option)
	  return myChart
	};
 </script>
<script type="text/javascript">
function chart03(id,fian1) {
	
	 var data1 =[];
	 var data2 =[];
	 var data3 =[];
	  var myChart = echarts.init(document.getElementById(id));
	  for (var i = 0; i < fian1.length; i++) { 
		  data1.push({ 
	        value:fian1[i].nsl
	      });
		  data2.push({ 
		        value:fian1[i].vsl
		      });
		  data3.push({ 
			  value:fian1[i].nllx
		      });
	    } 

	  var dataShadow1 = [];
	  var dataShadow2 = [];
	  
	 /* 循环取最大值    开始 */
	  var dataShadow = [];
	  var dataShadowss = [];
	  var xMax1=0;
	  var xMax2=0;
	  var xMax3=0;
	  var xMax4=0;
	  
	  for(var i = 0; i < data1.length; i++){
		 dataShadow.push((data1[i]).value);
		 xMax1+=parseFloat(data1[i].value);
	    }
	  xMax3 = Math.max.apply(null, dataShadow)
	   
	   
	   for(var i = 0; i < data2.length; i++){
		   dataShadowss.push((data2[i]).value);
		   xMax2+=parseFloat(data2[i].value);
		    }
		  xMax4 = Math.max.apply(null, dataShadowss)
	 /* 循环取最大值     结束 */	
	 
	 
		  
	  for (var i = 0; i < data1.length; i++) {
	      dataShadow1.push({
	          value: xMax1
	      });
	  };
	  
	  for (var i = 0; i < data2.length; i++) {
	      dataShadow2.push({
	          value: xMax2
	      });
	  };

	  var lineOption = {
	      lineStyle: {
	          color: '#e4e9ec',
	          type: 'solid'
	      }
	  }
	  var option = {
	      tooltip: {
	          trigger: 'axis',
	          axisPointer: {            // 坐标轴指示器，坐标轴触发有效
	              type: 'shadow'        // 默认为直线，可选为：'line' | 'shadow'
	          }
	      },
	      grid: [
	          {
	              left: '6%',
	              right: '54%',
	              bottom: '10%',
	              top: "6%",
	              containLabel: false
	          },
	          {
	              left: '58%',
	              right: '6%',
	              bottom: '10%',
	              top: "6%",
	              containLabel: false
	          }
	      ],
	      xAxis: [
	          {
	              type: 'value',
	              inverse: true,
	              max:xMax3,
	              axisTick: {
	                  show: false
	              },
	              axisLine: {
	                  show: false,
	                  lineStyle: {
	                      color: "#abdcff"
	                  }
	              },
	              splitLine: {
	                show: true,
	                lineStyle: {
	                    color: "#e6eaed",
	                }
	              },
	              axisLabel: {
	                  show: false,
	                  fontSize: 12,
	                  color: '#333',
	              },
	          },
	          {
	              type: 'value',
	              gridIndex: 1,
	              max:xMax4,
	              axisTick: {
	                  show: false
	              },
	              axisLine: {
	                  show: false,
	                  lineStyle: {
	                      color: "#abdcff"
	                  }
	              },
	              axisLabel: {
	                  show: false,
	                  fontSize: 12,
	                  color: '#333',
	              },
	              splitLine: {
	                  show: true,
	                  lineStyle: {
	                      color: "#e6eaed",
	                  }
	              },
	          }
	      ],
	      yAxis: [
	          {
	              type: 'category',
	              position: 'right',
	              axisTick: {
	                  show: false,
	              },
	              axisLine: {
	                  show: false,
	                  lineStyle: {
	                      color: "#abdcff"
	                  }
	              },
	              axisLabel: {
	                  show: false,
	                  interval: 0,
	                  fontSize: 12,
	                  color: '#333',
	              },
	              data: data3.reverse()
	          },
	          {
	              type: 'category',
	              // position: "left",
	              gridIndex: 1,
	              interval: 0,
	              axisTick: {
	                  show: false,
	              },
	              axisLine: {
	                  show: false,
	                  lineStyle: {
	                      color: "#abdcff"
	                  }
	              },
	              axisLabel: {
	                  show: false,
	                  fontSize: 12,
	                  color: '#333',
	              },
	              data: data3.reverse()
	          }
	      ],
	      series: [
	          {
	              type: 'bar',
	              barWidth: 10,
	              itemStyle: {
	                color: '#f6f7fa'
	              },
	              data: dataShadow1
	          },
	          {
	              name: '男',
	              type: 'bar',
	              barGap: '-100%',
	              barWidth: 10,
	              label: {
	                  show: false,
	                  color: "#fff",
	                  position: "insideLeft",
	                  fontSize: 12
	              },
	              itemStyle: {
	                  color: new echarts.graphic.LinearGradient(0, 0, 1, 0, [{
	                    offset: 0,
	                    color: '#8ad1e6'
	                  }, {
	                      offset: 1,
	                      color: '#28bbc1'
	                  }]),
	                  barBorderRadius: [2,0,0,2],
	              },
	              data: data1
	          },
	          {
	              type: 'bar',
	              barWidth: 10,
	              xAxisIndex: 1,
	              yAxisIndex: 1,
	              itemStyle: {
	                  color: "#f6f7fa",
	              },
	              data: dataShadow2
	          },
	          {
	              name: '女',
	              type: 'bar',
	              barGap: '-100%',
	              xAxisIndex: 1,
	              yAxisIndex: 1,
	              barWidth: 10,
	              label: {
	                  show: false,
	                  color: "#fff",
	                  position: "insideRight",
	                  fontSize: 12
	              },
	              itemStyle: {
	                  color: new echarts.graphic.LinearGradient(0, 0, 1, 0, [{
	                    offset: 0,
	                    color: '#fd767f'
	                  }, {
	                      offset: 1,
	                      color: '#f8a7c7'
	                  }]),
	                  barBorderRadius: [0,2,2,0],
	              },
	              data: data2
	          }
	      ]
	  };
	  myChart.setOption(option)
	  return myChart
	};
</script>
<script type="text/javascript">
function chart04(id,fian1,ccl,yljgmc,dyccl,ccpjxjsj) {
	 
	 var dataShadow = [];
	 var max;
	  var xMax1; 
	  for(var i = 0; i < dyccl.length; i++){
		 dataShadow.push((dyccl[i]));
	    }
	  max = Math.max.apply(null, dataShadow)+174
	  
	 /* 循环取最大值     结束 */
	 
	 
	$('#clzs').html(""); 
	$('#clzs').html(ccl);
	$('#xxx').html(""); 
	var datas = [];
	 for (var i = 0; i < fian1.length; i++) { 
		  
		 if(fian1.length==1){
			 if(fian1[i].ccpjxjsj.substring(0,1)=='.'){
				 $('#xxx').append("<li style='margin-top: 131%;color:#48BAD5'>"+"0"+fian1[i].ccpjxjsj+"分钟"+"</li>");	 	 
			 }else{
				 $('#xxx').append("<li style='margin-top: 131%;color:#48BAD5'>"+fian1[i].ccpjxjsj+"分钟"+"</li>");	 
			 }
			 
		 }
		 else{
			 if(fian1[i].ccpjxjsj.substring(0,1)=='.'){
				 $('#xxx').append("<li style='margin-top: 41%;color:#48BAD5'>"+"0"+fian1[i].ccpjxjsj+"分钟"+"</li>"); 
			 }else{
				 $('#xxx').append("<li style='margin-top: 41%;color:#48BAD5'>"+fian1[i].ccpjxjsj+"分钟"+"</li>");
			 }
		  
		 }
		 
		 datas.push({
			 value:max,
             grade:fian1[i].ccpjxjsj,
             
		    }) 
	 }
	
	 var myChart = echarts.init(document.getElementById(id));
	    
	    var option = {
	        tooltip: {
	            trigger: 'axis',
	            axisPointer: {
	                type: 'shadow'
	            }
	        },
	        legend: {
	            itemWidth: 12,
	            itemHeight: 12,
	            data: ['接车量(人次)'],
	            top: '5',
	            left: '170'
	        },
	        grid: {
	            containLabel: true,
	            top: '40',
	            right: '120',
	            left: -100,
	            bottom: '8%'
	        },
	        yAxis: [
	            {
	                type: "category",
	                axisLabel: {
	                    color: '#333333',
	                    interval: 0,
	                    margin: 157,
	                    align: 'left',
	                    textStyle: {
	                        fontSize: 15
	                    }
	                },
	                axisTick: {
	                    show: false
	                },
	                axisLine: {
	                    show: true,
	                    lineStyle: {
	                        color: '#D6D6D6',
	                    }
	                },
	                data: yljgmc,
	                splitArea: {
	                    show: false
	                },
	            }],
	        xAxis: [{
	            type: 'value',
	            /*  name: "万",
	              nameGap: 7,
	              nameTextStyle: {
	                  color: '#646464',
	                  fontSize: 14
	              },*/
	            axisLine: {
	                show: true,
	                lineStyle: {
	                    color: '#D6D6D6',
	                }
	            },
	            axisTick: {
	                show: false
	            },
	            axisLabel: {
	                margin: 10,
	                color: '#000000',
	                textStyle: {
	                    fontSize: 13
	                },
	                // formatter: function (params) {
	                //     return (params / 1000).toFixed(0)
	                // }
	            },
	            splitLine: {
	                show: true,
	                lineStyle:{
	                    type:"dashed"
	                }
	            },
	        }],
	        series: [
	            {
	                name: '接车量(人次)',
	                type: 'bar',
	                data: dyccl,
	                barWidth: 14,
	                itemStyle: {
	                    color: new echarts.graphic.LinearGradient(0, 0, 0, 1, [{
	                        offset: 0,
	                        color: '#11B7DB'
	                    }, {
	                        offset: 1,
	                        color: '#3EDED7'
	                    }]),

	                },
	                label: {
	                    position:"right",
	                    show: true,
	                    color:'#0096b0',
	                    fontSize:14,
	                    formatter(params){
	                        return params.value
	                    }
	                }
	            },
	            {
	                name: '',
	                type: 'bar',
	                data:datas,
	                barWidth: 14,
	                barGap: '-100%',
	                itemStyle: {
	                    color: 'rgba(90, 184, 235, .1)'
	                },
	                label: {
	                    position:"right",
	                    
	                    color:'#0096b0',
	                    fontSize:14,
	                    formatter(params){
	                        return '{a|'+params.data.grade+'分}'
	                    },
	                    rich:{
	                        a:{
	                            width:90,
	                            align:"center",
	                            color:'#0096b0',
	                            fontSize:14,
	                        }
	                    }
	                },
	                tooltip: {
	                    show: false
	                }
	            },
	        ]
	    };
	    myChart.setOption(option)
	    return myChart
    myChart.setOption(option)
    return myChart
};
</script>
<script type="text/javascript">
function chart05(id,fian1) {
	var chartData=[];
	 for (var i = 0; i < fian1.length; i++) {
		 chartData.push({
			 name:fian1[i].zdblx,
			 value:fian1[i].sl,
		 })   
	 }
    var myChart = echarts.init(document.getElementById(id));
    var fontColor = '#333'; 
    var xData = [];
    var sData = [];

    $.each(chartData, function (index, item) {
        xData.push(item.name);
        sData.push(item.value)
    });

    var lineOption = {
        lineStyle: {
            color: 'rgba(51,51,51,.75)',
            type: 'solid'
        }
    };
    var option = {
        tooltip: {
            trigger: 'none',
            axisPointer: {
                type: 'shadow'
            }
        },
        legend: {
            itemHeight: 12,
            itemWidth: 12,
            right: '25',
            top: "10",
            itemGap: 15,
            textStyle: {
                color: "#333333",
                fontSize: 12
            },
            data: [
                {
                    name: "人次",
                }
            ]
        },
        grid: {
            containLabel: true,
            top: '40',
            right: '60',
            left: '15',
            bottom: '20'
        },
        yAxis: [{
            name: '人',
            nameGap: 13,
            nameTextStyle: {
                color: fontColor,
                fontSize: 12
            },
            axisLabel: {
                formatter: '{value}',
                color: fontColor,
                textStyle: {
                    fontSize: 12
                }
            },
            axisTick: {
                show: false
            },
            axisLine: lineOption,
            splitLine: {
                show: true,
                lineStyle: {
                    color: '#ededed'
                }
            }
        }],
        xAxis: [{
            name: '',
            nameGap: 13,
            nameTextStyle: {
                color: fontColor,
                fontSize: 12
            },
            type: 'category',
            data: xData,
            axisLine: lineOption,
            boundaryGap: true,
            axisTick: {
                show: false
            },
            axisLabel: {
                margin: 10,
                color: fontColor,
                interval:0,
                formatter: function (params) {
                    var data = params.split('');
                    if(data.length > 5){
                        var result = [];
                        for(var i=0;i<data.length;i+=5){
                            result.push(data.slice(i,i+5));
                        };
                        var chartName ='';
                        for(var j=0;j<result.length;j++){
                            chartName+=result[j].join('')
                            if(j != result.length-1){
                                chartName+='\n'
                            }
                        };
                        return  chartName;
                    }else{
                        return  params;
                    }
                },
                textStyle: {
                    fontSize: 12
                }
            },
            splitLine: {
                show: true,
                lineStyle: {
                    color: '#ededed'
                }
            },
            splitArea: {
                show: false
            }
        }],
        series: [
            {
                name: '人次',
                type: 'bar',
                barWidth: 24,
                data: sData,
                itemStyle: {
                    color: '#2C87E9'
                },
                label: {
                    show: false,
                    position: 'top',
                    formatter: function (params) {
                        return '{a|' + params.value + '人}\n' + '{b|}'
                    },
                    rich: {
                        a: {
                            backgroundColor: 'rgba(21, 114, 213, .6)',
                            padding: [3, 6, 6, 6],
                            borderRadius: 2,
                            color: '#FFFFFF',
                            fontSize:12
                        },
                        b: {
                            width: 5,
                            height: 5,
                            align: 'center',
                            backgroundColor: { image: 'images/bafx/small-bg01.png' }
                        }
                    }
                },
                emphasis: {
                    label: {
                        show: true,
                    }
                },
            }
        ]
    };
    myChart.setOption(option)
    return myChart
};

</script>
</head>
<body>

	<!-- ------------------------------------------------------------------------------------ -->

	<div class="main">
		<div class="top clearfix">
			<div class="topLeft">
				<span class="det"> <span class="sj sjKs"> <i
						class="r " onclick="sjxz('day')">当天 </i> <i class="w"
						onclick="sjxz('week')">本周</i> <i class="y" onclick="sjxz('month')">本月</i>
						<i class="qb active" onclick="sjxz('all')">全部</i>
				</span> <span class="det"> <label for="">开始时间</label> <input
						type="text" id="kssj" readonly="readonly"
						onClick="WdatePicker({dateFmt:'yyyy-MM-dd'})" value=""
						class="Wdate" style="width: 100px" />
						<div
							style="position: absolute; margin-left: 188px; margin-top: -28px;">
							<img src="<c:url value="/static/commons/images/topImg1.png"/>">
						</div>
				</span>
				</span> <span class="det" style="margin-left: 5px;"> <label for="">结束时间</label>
					<input type="text" id="jssj" readonly="readonly"
					onClick="WdatePicker({dateFmt:'yyyy-MM-dd'})" value=""
					class="Wdate" style="width: 100px" />
					<div
						style="position: absolute; margin-left: 188px; margin-top: -28px;">
						<img src="<c:url value="/static/commons/images/topImg1.png"/>">
					</div>
				</span> <span class="det detLast" style="margin-left: 32px;"> <label
					for="">机构名称</label> <select id="jgdm" name="jgdm" lay-search>
						<option value="">全区</option>
						<c:forEach items="${fzjgList}" var="jg">
							<option value="${jg.jgdm}">${jg.jgmc}</option>
						</c:forEach>
				</select>
				</span>
			</div>
			<div class="topRight">
				<button style="cursor: pointer;" class="btn1" onclick="search();">查询</button>
			</div>
		</div>
		<div class="main jjsjfx">
			<div class="botCon">
				<ul class="detail clearfix">

					<li class="mode mode04 mode1-2">
						<div class="modeBg">
							<div class="modeTop">
								<div class="title">
									<i></i> <label for="">应急车辆使用情况</label>
									<div class="right-sum">
										全区应急车辆<strong id='clzs'></strong>次
									</div>
								</div>
							</div>
							<div class="modeCon">
								<!-- Swiper -->
								<div id="carSwiperSlider" class="swiper-container">
									<div class="swiper-wrapper">
										<div class="swiper-slide item">
											<div class="modeCon-header">
												<span class="name">医院名称</span> <span class="time">平均响应时间</span>
											</div>
											<div class="chartBox" id="chart04Slider01"></div>
											<ul id="xxx" class="y-label" style='margin-left: 40%'>
											</ul>
										</div>

									</div>
									<!-- Add Pagination -->
									<div class="swiper-pagination"></div>
								</div>


							</div>
						</div>
					</li>
					<li class="mode mode03 mode1-2">
						<div class="modeBg">
							<div class="modeTop">
								<div class="title clearfix">
									<i></i> <label for="">分诊患者年龄分布</label>
								</div>
							</div>
							<div class="modeCon">
								<div class="chart-box">
									<div class="chart-top">
										<div class="left">
											<img src="<c:url value="/static/commons/images/man.png"/>"
												alt="" class='man' /> <span>男</span>
										</div>
										<div class="right">
											<span>女</span> <img
												src="<c:url value="/static/commons/images/woman.png"/>"
												alt="" class='woman' />
										</div>
									</div>
									<ul class="y-label">
										<li>年龄</li>
										<li>0-10</li>
										<li>10-20</li>
										<li>20-30</li>
										<li>30-40</li>
										<li>40-50</li>
										<li>50-60</li>
										<li>60-70</li>
										<li>70-80</li>
										<li>80-90</li>
										<li>90-100</li>
									</ul>
									<div class="chartBox chart03" id="chart03"></div>
								</div>
							</div>
						</div>
					</li>
					<li class="mode mode02 mode1-2">
						<div class="modeBg">
							<div class="modeTop">
								<div class="title">
									<i></i> <label for="">分诊趋势分析</label>
								</div>
							</div>
							<div class="modeCon">
								<div class="chartBox" id="chart02"></div>
							</div>
						</div>
					</li>
					<li class="mode mode01 mode1-2">
						<div class="modeBg">
							<div class="modeTop">
								<div class="title">
									<i></i> <label for="">分诊患者分诊级别图</label>
								</div>
							</div>
							<div class="modeCon">
								<div class="chartBox" id="chart01"></div>
								<ul class="legend" id=legend01></ul>
							</div>
						</div>
					</li>


					<li class="mode mode05 mode-1-1">
						<div class="modeBg">
							<div class="modeTop">
								<div class="title">
									<i></i> <label for="">分诊患者病种分类统计图</label>
								</div>
							</div>
							<div class="modeCon">
								<div class="chartBox" id="chart05"></div>
							</div>
						</div>
					</li>
				</ul>
			</div>
		</div>
	</div>

	<!-- ------------------------------------------------------------------------------------ -->
	</div>
</body>
<script>
    $(".mode03 .modeCon .det").hide();
    $(".mode03 .modeCon .det").eq(0).show();
    $(".mode03 .modeTop .title .tabTop span").click(function(){
    $(this).addClass("active").siblings("span").removeClass("active");
    $(".mode03 .modeCon .det").eq($(this).index()).show().siblings(".det").hide();
    });
</script>
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
<script type="text/javascript">

$(function () {
   
  var chart04Slider01=chart04('chart04Slider01','','');
  var chart04Slider02=chart04('chart04Slider02','','');
  var chartInit05=chart05('chart05','');

    new Swiper('#carSwiperSlider', {
        pagination: {
            el: '#carSwiperSlider .swiper-pagination',
        },
        on: {
            resize: function(){
                chart04Slider01.resize();
                chart04Slider02.resize();
            },
        },
    });
  $(window).resize(function () {
      
      chart04Slider01.resize();
      chart04Slider02.resize();
    chartInit05.resize();
  });

});
</script>
</html>