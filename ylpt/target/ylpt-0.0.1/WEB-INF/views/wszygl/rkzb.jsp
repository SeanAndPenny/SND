<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/commons/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
<title>人口占比</title>


<link rel="stylesheet" type="text/css"
	href="<c:url value="/static/commons/css/rkzb_reset.css"/>" />

<link rel="stylesheet" type="text/css"
	href="<c:url value="/static/commons/css/rkzb_index.css"/>" />

<link rel="stylesheet" type="text/css"
	href="<c:url value="/static/commons/js/My97DatePicker/skin/WdatePicker.css"/>" />
<script type="text/javascript"
	src="<c:url value="/static/commons/js/My97DatePicker/WdatePicker.js"/>"></script>
<script type="text/javascript"
	src="<c:url value="/static/commons/js/jquery-index.min.js"/>"></script>

<script type="text/javascript"
	src="<c:url value="/static/commons/js/echarts.min.index.js"/>"></script>

　
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
	
function search() {
	getData();		 
}
function getData(){
	   var kssj=$("#kssj").val();
	   var jssj=$("#jssj").val();
	  var jddm=$("#jddm").val();
	  
	  if(jddm=="" ||jddm==null){
		  jddm='${jgdm}'  
	  } 
	  if(jssj<kssj){
	  	  alert('请选择的结束时间大于或大于开始时间')
	  	return   
	    }
	  getechatsdata(kssj,jssj,jddm); 
	
	 
    }
	
function echarsnldld(nldbm,seriesIndex,kssj,jssj,jgdm,series,name){  
	 
	  $.ajax({
	  	url: "${ctx}/rkzb/echarsnldld.json?p_kssj="+kssj
	  			  +"&p_jssj="+jssj
	  			  +"&p_jgdm="+jgdm
	  			  +"&p_nldbm="+nldbm
	  			  +"&p_index="+seriesIndex,		
	  	 datatype:"json",
	  	context: document.body, 
	  	success: function(data){
	  		 var nodes=eval(data);
	  		 var hh= JSON.stringify(nodes);
	  		 var xx=JSON.parse(hh);
	  		 var fianl=xx.echarsnldldList;
	  		 var sl1=new Array();
	  		 var pcsmc=new Array();
	  		 var bl1=new Array();
	  		 
	  		 
	  		 
	  		 
	       	 for (var i=0;i<fianl.length;i++) { 
	       		sl1[i]=fianl[i].sl1;
	       		pcsmc[i]=fianl[i].pcsmc; 
	       		bl1[i]=fianl[i].bl1;
	       		 
		         	 
	       	 }  
	       	chart04('chart04',sl1,pcsmc,bl1,series,name); 
	  		}
	    	});
	
}
	 
</script>
<script type="text/javascript">
function getechatsdata(kssj,jssj,jgdm,lj,wdtj){
	var jddm=$("#jddm").val();
	  if(jddm=="" ||jddm==null){
		  jddm='${jgdm}'  
	  } 
	  
    $.ajax({
    	url: "${ctx}/rkzb/rkzb.json?p_kssj="+kssj
    			  +"&p_jssj="+jssj
    			  +"&p_yljgdm="+jddm,		
    	 datatype:"json",
    	context: document.body, 
    	success: function(data){
    		 var nodes=eval(data);
    		 var hh= JSON.stringify(nodes);
    		 var xx=JSON.parse(hh);
    		 var fianl=xx.xxxBllist;
    		 var sl1=new Array();
    		 var mc=new Array();
    		 var mcdm=new Array();
    		 var bl=new Array();
    		 
    		 var fian2=xx.rkbllist;
    		 var zrk=new Array();
    		 var hjrk=new Array();
    		 var hjdm=new Array();
    		 var ldrk=new Array();
    		 var lddm=new Array();
    		 var yljgmc=new Array();
    		 var yljgdm=new Array();
    		 
    		 var hjrkzsl=xx.hjrkzsl;
    		 var ldzsl=xx.ldzsl;
    		 var zrzsl=Number(xx.hjrkzsl)+Number(xx.ldzsl);
    		 var zrkzb=new Array();
    		 var hjrkzb=new Array();
    		 var ldrkzb=new Array(); 
    		 
    		 var fian4=xx.nllist;
    		 var znlsl=new Array();
    		 var hjnlsl=new Array();
    		 var ldnlsl=new Array();
    		 var nl=new Array();
    		 
    		 var fian5=xx.nldbllist;
    		 
         	 for (var i=0;i<fianl.length;i++) { 
         		 sl1[i]=fianl[i].sl;
	         	 mc[i]=fianl[i].mc; 
	         	 mcdm[i]=fianl[i].mcdm;
	         	 bl[i]=fianl[i].bl;
         	 }
         	 for(var i=0;i<fian2.length;i++){
         		zrk[i]=Number(fian2[i].hjrk)+Number(fian2[i].ldrk);
         		hjrk[i]=Number(fian2[i].hjrk);
         		hjdm[i]=Number(fian2[i].hjdm);
         		ldrk[i]=Number(fian2[i].ldrk);
         		lddm[i]=fian2[i].lddm;
         		yljgmc[i]=fian2[i].yljgmc;
         		yljgdm[i]=fian2[i].yljgdm;
         		zrkzb[i]=((zrk[i]/zrzsl*100)).toFixed(1);
         		hjrkzb[i]=((hjrk[i]/zrzsl*100)).toFixed(1);
         		ldrkzb[i]=((ldrk[i]/zrzsl*100)).toFixed(1);
         	 }
         	 
         	 
         	for(var i=0;i<fian4.length;i++){
         		  hjnlsl[i]=Number(fian4[i].hjnlsl); 
        		  ldnlsl[i]=Number(fian4[i].ldnlsl); 
        		  znlsl[i]=hjnlsl[i]+ ldnlsl[i];
        		  nl[i]=fian4[i].nl+'岁'; 
         	}
         	   
         	  
			chart01('chart01',sl1,mc,mcdm,bl,jddm); 
         	chart02('chart02',zrk,hjrk,hjdm,ldrk,lddm,yljgmc,zrkzb,hjrkzb,ldrkzb,yljgdm); 
         	
         	chart03('chart03',fian5,kssj,jssj,jddm,'');  
         	
         	 
         	chart05('chart05',hjnlsl,ldnlsl,znlsl,nl); 
         	
    		}    	
      	});
    echarsnldld('28~40','0',kssj,jssj,jddm,'总人口','青年期');
}
 function nldfx(id){
	 
	 if(id=='hjrk'){
		 
		 $("#top0").attr("class","sss");
		 $("#top1").attr("class","sss");
		 $("#top2").attr("class","active");
	 
	 }else if(id=='ldrk'){
		 $("#top0").attr("class","sss");
		 $("#top1").attr("class","active");
		 $("#top2").attr("class","sss");
	 
	 }else if(id=='zrk'){
		 $("#top0").attr("class","active");
		 $("#top1").attr("class","sss");
		 $("#top2").attr("class","sss");
	 
	 }
	var kssj=$("#kssj").val();
	var jssj=$("#jssj").val();
	var jddm=$("#jddm").val();
     
	  
	    $.ajax({
	    	url: "${ctx}/rkzbnldfx/rkzbnldfx.json?p_kssj="+kssj
	    			  +"&p_jssj="+jssj
	    			  +"&p_yljgdm="+jddm,		
	    	 datatype:"json",
	    	context: document.body, 
	    	success: function(data){
	    		 var nodes=eval(data);
	    		 var hh= JSON.stringify(nodes);
	    		 var xx=JSON.parse(hh);
	    		 var fian5=xx.rkzbnldfxList;
	    		 chart03('chart03',fian5,kssj,jssj,jddm,id);  
	    		}    	
	      	});  
} 
</script>
<script type="text/javascript">
function chart01(id,sl1,mc,mcdm,bl,jddm) {
	$("#id1").html('');
	$("#id2").html('');
	$("#id3").html('');
	$("#id4").html(''); 
	
    $("#id1").html(sl1[1]);
    $("#id2").html(bl[1]);
    $("#id3").html(sl1[0]);
    $("#id4").html(bl[0]); 
    var myChart = echarts.init(document.getElementById(id));
	  myChart.dispose();
	 myChart = echarts.init(document.getElementById(id));
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
            itemGap: 20,
            orient: 'vertical',
            data: ['户籍人口', '流动人口'],
            bottom: '20%',
            right: '8%',
            textStyle: {
                fontSize: 15
            }
        },
        series: [
            {
                name: '户籍人口/流动人口占比',
                type: 'pie',
                hoverOffset: 6,
                center: ["43%", "49%"],
                radius: ['35%', '60%'],
                label: {
                    show: false
                },
                labelLine: {
                    show: false,
                    length: 11,
                    length2: 12
                },
                data: [
                    {
                    	 value: parseInt(sl1[1]),
                        name: '户籍人口',
                        itemStyle: {
                            color: '#88CA6D'
                        },
                    },
                    {
                    	 value: parseInt(sl1[0]),
                        name: '流动人口',
                        itemStyle: {
                            color: '#0DAEF1'
                        },
                    }
                ],
                emphasis: {
                    label: {
                        show: true,
                        fontSize: 18,
                        formatter: function (params) {
                            return '{a|' + params.name + '}\n' + (params.percent).toFixed(1) + '%'
                        },
                        rich: {
                            a: {
                                fontSize: 15,
                                color: '#333333',
                                padding: [6, 0, 0, 0]
                            }
                        }
                    },
                    labelLine: {
                        show: true,
                        lineStyle: {
                            color: '#000'
                        }
                    }
                }
            }
        ]
    };
    myChart.setOption(option)
    /* myChart.on('click',function(param) {	
		   
		     if(param.name.match("流")){
			  window.open("${ctx}/xxx/xxx?p_ywbz=LDRK&p_yxbz=1&p_tjsjwd=0&p_jgdm="+jddm
					  +'&p_kssj='+$("#kssj").val()
	    			  +'&p_jssj='+$("#jssj").val()
			  );
			 
		   }else if (param.name.match("户籍")){
			   window.open("${ctx}/xxx/xxx?p_ywbz=CZRK&p_yxbz=1&p_tjsjwd=0&p_jgdm="+jddm
					   +'&p_kssj='+$("#kssj").val()
		    		   +'&p_jssj='+$("#jssj").val()	   
			   ); 
		   }  
		 
	  } 
	  )*/
    
};

function chart02(id,zrk,hjrk,hjdm,ldrk,lddm,yljgmc,zrkzb,hjrkzb,ldrkzb,yljgdm){
    var myChart = echarts.init(document.getElementById(id));
    var fontColor = '#333';
    var lineOption = {
        lineStyle: {
            color: 'rgba(51,51,51,.75)',
            type: 'solid'
        }
    };
    var option = {
        tooltip: {
            trigger: 'axis',
            axisPointer: {
                type: 'shadow'
            }
        },
        legend: {
            itemHeight: 12,
            itemWidth: 12,
            right: '4%',
            top: "4%",
            itemGap: 15,
            textStyle: {
                color: "#333333",
                fontSize: 12
            },
            data: [
                {
                    name: "流动人口",
                },
                {
                    name: "户籍人口",
                }
            ]
        },
        grid: {
            containLabel: true,
            top: '17%',
            right: '4%',
            left: '4%',
            bottom: '6%'
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
            type: 'category',
            data: yljgmc,
            axisLine: lineOption,
            boundaryGap: true,
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
                name: '户籍人口',
                type: 'bar',
                barWidth: 16,
                data:hjrk,
                stack: true,
                itemStyle: {
                    color: '#1572D5'
                }
            }, {
                name: '流动人口',
                type: 'bar',
                barWidth: 16,
                data:ldrk,
                stack: true,
                itemStyle: {
                    color: '#0DAEF1'
                }
            },
        ]
    };
    myChart.setOption(option)
    return myChart
};
function chart03(id,fian5,kssj,jssj,jddm,id2){ 
	 var myChart = echarts.init(document.getElementById(id));
	  myChart.dispose();
	 myChart = echarts.init(document.getElementById(id));
	 
	  var datas = [];
	  var datass = [];
	  if(id2==='ldrk'){
		 
		  for (var i = 0; i < fian5.length; i++) {  
				datas.push(fian5[i].nldm);
			    datass.push({
			      name:fian5[i].nlmc,
			      value:parseInt(fian5[i].nlldrk)
			    })
			     
			  }
		 
		  echarsnldld('28~40','2',kssj,jssj,jddm,'流动人口','青年期');
	  }else if(id2==='hjrk'){
		  
		  datas = [];
		  datass = [];
		  for (var i = 0; i < fian5.length; i++) { 
			   
			  datas.push(fian5[i].nldm);
			    datass.push({
			      name:fian5[i].nlmc,
			      value:parseInt(fian5[i].nlhjrk)
			    })
			      
			  } 
		  echarsnldld('28~40','1',kssj,jssj,jddm,'户籍人口','青年期');
	  }else {
		 
		  datas = [];
		  datass = [];
		  for (var i = 0; i < fian5.length; i++) {  
			  datas.push(fian5[i].nldm);
			    datass.push({
			      name:fian5[i].nlmc,
			      value:parseInt(fian5[i].nlhjrk)==""?0:parseInt(fian5[i].nlhjrk)+parseInt(fian5[i].nlldrk)==""?0:parseInt(fian5[i].nlldrk)
			    })
			      
			  }
		  echarsnldld('28~40','0',kssj,jssj,jddm,'总人口','青年期');
	  }
    var option = {
        tooltip: {
            trigger: 'axis',
            axisPointer: {
                type: 'shadow'
            }
        },
        color:['#88CA6D','#3AA873','#2EEDE6','#2DC6F2','#0DAEF1','#1572D5'
        	, '#744EBC','#5D6DBD','#343434','#000'],
        series: [
            {
                name: '年龄段占比及分布分析',
                type: 'pie',
                hoverOffset: 6,
                center: ["47%", "40%"],
                radius: ['35%', '60%'],
                label: {
                    show: false
                },
               
                labelLine: {
                    show: false,
                    length: 6,
                    length2: 8,
                },
                data: datass ,
                emphasis: {
                    label: {
                        show: true,
                        fontSize: 18,
                        formatter: function (params) {
                            return '{a|' + params.name + '}\n' + (params.percent).toFixed(2) + '%'
                        },
                        rich: {
                            a: {
                                fontSize: 15,
                                color: '#343434',
                                padding: [6, 0, 0, 0]
                            }
                        }
                    },
                    labelLine: {
                        show: true,
                        lineStyle: {
                            color: '#000'
                        }
                    }
                }
            }
        ]
    };
    myChart.setOption(option)
     myChart.on('click',function(param) {	
    	 
    	 if(id2=='hjrk'){
    		 echarsnldld(datas[param.dataIndex],'1',kssj,
    		jssj,jddm,'户籍人口',param.name)	 
    	 }else if(id2=='ldrk'){
    		 echarsnldld(datas[param.dataIndex],'2',kssj,
    		    		jssj,jddm,'流动人口',param.name)	 
    	} else{
    		echarsnldld(datas[param.dataIndex],'0',kssj,
		    		jssj,jddm,'总人口',param.name)
    	}
	  }
	  )
	 
};

 






function chart04(id ,sl1,pcsmc,bl1,series,names){
	
	var namess= [];
	namess.push(names);
    var myChart = echarts.init(document.getElementById(id));
    myChart.dispose();
    myChart = echarts.init(document.getElementById(id));
    
    var data =  sl1;
    var dataShadow = [];
    for(var i = 0; i < data.length; i++){
    	 dataShadow.push(parseInt(data[i])+300);
    }
    var option = {
        tooltip: {
            trigger: 'axis',
            axisPointer: {
                type: 'shadow'
            }
        },
        grid: {
            containLabel: true,
            top: '12%',
            right: '9%',
            left: -46,
            bottom: '4%'
        },
        legend: {
            itemWidth: 12,
            itemHeight: 12,
            data: namess,
            top: '4%',
            right: '8%'
        },
        yAxis: [
            {
                type: "category",
                axisLabel: {
                    color: '#333333',
                    interval: 0,
                    margin: 57,
                    align: 'left',
                    textStyle: {
                        fontSize: 12
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
                data: pcsmc.reverse(),
                splitArea: {
                    show: false
                },
            }],
        xAxis: [{
            type: 'value',
            name: "万",
            nameGap: 7,
            nameTextStyle: {
                color: '#646464',
                fontSize: 14
            },
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
                formatter: function (params) {
                    return (params )
                }
            },
            splitLine: {
                show: false
            },
        }],
        series: [
            {
                name: names,
                type: 'bar',
                data: sl1.reverse(),
                barWidth: 13,
                itemStyle: {
                    color: '#2DC6F2'
                },
                label: {
                    show: false,
                }
            },
            {
                name: '',
                type: 'bar',
                data: dataShadow,
                barWidth: 14,
                barGap: '-100%',
                itemStyle: {
                    color: 'rgba(153,123,230,.1)'
                },
                tooltip: {
                    show: false
                }
            },
        ]
    };
    myChart.setOption(option)
    return myChart
};

function chart05(id,hjnlsl,ldnlsl,znlsl,nl){ 
    var myChart = echarts.init(document.getElementById(id));
    var fontColor = '#333'; 
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
                }
            },
            formatter: function (params) {
                return '人口年龄：' + params[0].axisValue + '<br/>' + params[0].seriesName + '：' + params[0].data + '人<br/>' + params[1].seriesName + '：' + params[1].data + '人'
            },
            backgroundColor: 'rgba(46, 113, 146, .6)'
        },
        legend: {
            itemHeight: 8,
            itemWidth: 14,
            right: '4%',
            top: "4%",
            itemGap: 20,
            textStyle: {
                color: "#343434",
                fontSize: 13
            },
            data: [
                {
                    name: "流动人口",
                },
                {
                    name: "户籍人口",
                }
            ]
        },
        grid: {
            containLabel: true,
            top: '17%',
            right: '4%',
            left: '4%',
            bottom: '5%'
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
                fontSize: 12,
                formatter: function (params) {
                    return (params / 1000).toFixed(0)
                }
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
            data: nl ,
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
                name: '流动人口',
                type: 'line',
                data: ldnlsl,
                symbolSize: 8,
                smooth: true,
                zlevel: 2,
                itemStyle: {
                    color: 'rgba(6,189,101,1)'
                },
                areaStyle: {
                    color: 'rgba(6,189,101,.3)'
                }
            }, {
                name: '户籍人口',
                type: 'line',
                data: hjnlsl,
                symbolSize: 8,
                smooth: true,
                zlevel: 2,
                itemStyle: {
                    color: 'rgba(97,168,255,1)'
                },
                areaStyle: {
                    color: 'rgba(97,168,255,.3)'
                }
            },
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
				</span> <span class="det detLast" style="margin-left: 150px;"> <label
					for="">乡镇名称</label> <select id="jddm" name="jddm" lay-search>
						<option value="">全区</option>
						<c:forEach items="${jdList}" var="jg">
							<option value="${jg.jgdm}">${jg.jgmc}</option>
						</c:forEach>
				</select>
				</span>
			</div>
			<div class="topRight">
				<button style="cursor: pointer;" class="btn1" onclick="search();">查询</button>
			</div>
		</div>












		<div class="botCon">
			<ul class="detail clearfix">
				<li class="mode mode01">
					<div class="modeBg">
						<div class="modeTop">
							<div class="title">
								<i></i> <label for="">户籍人口/流动人口占比</label>
							</div>
						</div>
						<div class="modeCon clearfix">
							<div class="same same01">
								<div class="chartBox" id="chart01"></div>
							</div>
							<div class="same same02">
								<div class="line"></div>
								<div class="item item01">
									<div class="icon"></div>
									<div class="text">
										<div class="font">户籍人口</div>
										<div class="sty sty01">
											<label for="">数量：</label> <span id='id1'></span>人
										</div>
										<div class="sty sty02">
											<label for="">占比：</label> <span id='id2'></span>%
										</div>
									</div>
								</div>
								<div class="item item02">
									<div class="icon"></div>
									<div class="text">
										<div class="font">流动人口</div>
										<div class="sty sty01">
											<label for="">数量：</label> <span id='id3'></span>人
										</div>
										<div class="sty sty02">
											<label for="">占比：</label> <span id='id4'></span>%
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</li>
				<li class="mode mode02">
					<div class="modeBg">
						<div class="modeTop">
							<div class="title">
								<i></i> <label for="">户籍人口/流动人口占比</label>
							</div>
						</div>
						<div class="modeCon">
							<div class="chartBox" id="chart02"></div>
						</div>
					</div>
				</li>
				<li class="mode mode03">
					<div class="modeBg">
						<div class="modeTop">
							<div class="title clearfix">
								<i></i> <label for="">年龄段占比及分布分析</label>

								<div class="tabTop">
									<span id="top0" class="active" onclick="nldfx('zrk')">总人口</span>
								</div>
								<div class="tabTop">
									<span id="top1" class="ss" onclick="nldfx('ldrk')">流动人口</span>
								</div>
								<div class="tabTop">
									<span id="top2" class="ss" onclick="nldfx('hjrk')">户籍人口</span>
								</div>
							</div>

						</div>
						<div class="modeCon">
							<div class="det det01">
								<div class="same same01">
									<div class="chartBox" id="chart03"></div>
									<div class="legend">
										<ul class="clearfix">
											<li class="li01"><i></i><label for="">婴儿期</label></li>
											<li class="li02"><i></i><label for="">幼儿期</label></li>
											<li class="li03"><i></i><label for="">学龄前期</label></li>
											<li class="li04"><i></i><label for="">学龄期</label></li>
											<li class="li05"><i></i><label for="">青春期</label></li>
											<li class="li06"><i></i><label for="">青年期</label></li>
											<li class="li07"><i></i><label for="">中年期</label></li>
											<li class="li08"><i></i><label for="">老年期</label></li>

										</ul>
									</div>
								</div>
								<div class="same same02">
									<div class="chartBox" id="chart04"></div>
								</div>
							</div>
							<div class="det det02"></div>
							<div class="det det03"></div>
						</div>

					</div>
				</li>
				<li class="mode mode04">
					<div class="modeBg">
						<div class="modeTop">
							<div class="title">
								<i></i> <label for="">年龄分析</label>
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
</html>