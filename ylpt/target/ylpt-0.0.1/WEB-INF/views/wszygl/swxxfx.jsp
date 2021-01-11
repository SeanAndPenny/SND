<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/commons/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
<title>死亡分析</title>
<link rel="stylesheet" type="text/css"
	href="<c:url value="/static/commons/css/rkzb_reset.css"/>" />
<link rel="stylesheet" type="text/css"
	href="<c:url value="/static/commons/css/rkzb_index.css"/>" />
<link rel="stylesheet" type="text/css"
	href="<c:url value="/static/commons/css/ypcrk_index.css"/>" />
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
	 
	  var myDate=new Date() 
	    var month=myDate.getMonth()+1;
	    var year=myDate.getFullYear(); 
	    if (month<10) { month = "0" + month; }
	    if(id=='year'){
	    $("#ksnf").val('${ksnf}'.substr(0,4));
	    $("#jsnf").val('${jsnf}'.substr(0,4));
	    document.getElementById("ksnf").onclick = function(){
	      WdatePicker({dateFmt:'yyyy'});
	      };
	    document.getElementById("jsnf").onclick = function(){
	      WdatePicker({dateFmt:'yyyy'});
	        };
	    } else if(id=='month'){
	    $("#ksnf").val('${ksnf}'.substr(0,7));
	    $("#jsnf").val('${jsnf}'.substr(0,7));
	    document.getElementById("ksnf").onclick = function(){
	      WdatePicker({dateFmt:'yyyy-MM'});
	      };
	    document.getElementById("jsnf").onclick = function(){
	      WdatePicker({dateFmt:'yyyy-MM'});
	        };
	    } else if(id=='day'){
	     $("#ksnf").val('${ksnf}');
	    $("#jsnf").val('${jsnf}');
	  document.getElementById("ksnf").onclick = function(){
	    WdatePicker({dateFmt:'yyyy-MM-dd'})
	    };
	  document.getElementById("jsnf").onclick = function(){
	    WdatePicker({dateFmt:'yyyy-MM-dd'})
	      };
	  }else{
	    $("#ksnf").val('${ksnf}');
	    $("#jsnf").val('${jsnf}');
	    document.getElementById("ksnf").onclick = function(){
	      WdatePicker({dateFmt:'yyyy-MM-dd'});
	      };
	    document.getElementById("jsnf").onclick = function(){
	      WdatePicker({dateFmt:'yyyy-MM-dd'});
	        };
	    
	  }
	}
</script>
<script type="text/javascript">
$(document).ready(function(){
     getData();
     sjxz();
  });

function search() {
    getData();   }
function getData(){
       
       var jgdm=$("#jgdm").val();
       if(jgdm=="" ||jgdm==null){
        jgdm='${jgdm}'  
      } 
        
      
      swxxfxEchars(jgdm); 
     
      }

function swxxfxEchars(jgdm){
  
      var ksnf=$("#ksnf").val();
      var jsnf=$("#jsnf").val();
      if(jsnf<ksnf){
    	 alert("选择的结束时间请大于或等于开始时间") ;
    	 return;
      }
      $.ajax({
        url: "${ctx}/swxxfx/swxxfx.json?p_ksnf="+ksnf
              +"&p_jsnf="+jsnf
              +"&p_yljgdm="+jgdm,    
         datatype:"json",
        context: document.body, 
        success: function(data){
           var nodes=eval(data);
           var hh= JSON.stringify(nodes);
           var xx=JSON.parse(hh);
           var fianl=xx.swxxfxList;
           var swrs=new Array();
           var swnf=new Array(); 
           var fian2=xx.swxxnldfxList;
           var ers=new Array();
           var yrs=new Array();
           var xlqqs=new Array();
             var xlqs=new Array();
             var qcs=new Array();
           var qns=new Array();
           var zns=new Array();
           var lns=new Array();
           var nldnfs=new Array(); 
           var fian3=xx.syfxnlList;
           
           var fian4=xx.syflfxList;
            
           for (var i=0;i<fianl.length;i++) { 
               swrs[i]=fianl[i].swrs;
               swnf[i]=fianl[i].swnf; 
              }
           for (var i=0;i<fian2.length;i++) { 
             ers[i] =fian2[i].ers;
             yrs[i]=fian2[i].yrs;
             xlqqs[i]=fian2[i].xlqqs;
             xlqs[i]=fian2[i].xlqs;
             qcs[i]=fian2[i].qcs;
             qns[i]=fian2[i].qns;
             zns[i]=fian2[i].zns;
             lns[i]=fian2[i].lns;
             nldnfs[i]=fian2[i].nldnf;
                } 
           
         
           chart02('chart02',fian3,ksnf,jsnf,jgdm);
           chart03('chart03',ers,yrs,xlqqs,xlqs,qcs,qns,zns,lns,nldnfs);
           chart04('chart04',fian4,ksnf,jsnf,jgdm); 
            
             
          }
          });
      nldfx();
  }
  
</script>

<script type="text/javascript">

function nldfx(id){
	 if(id=='zxt'){
		 $("#top1").attr("class","active");
		 $("#top0").attr("class","sss");
		   document.getElementById("modeCon1").style.display='none';
		   document.getElementById("modeCon0").style.display='';
	 }else if(id=='qxt'){
		 $("#top1").attr("class","sss");
		 $("#top0").attr("class","active");
		   document.getElementById("modeCon1").style.display='';
		   document.getElementById("modeCon0").style.display='none';
	 }else {
		 $("#top1").attr("class","active");
		 $("#top0").attr("class","sss");
		 document.getElementById("modeCon1").style.display='none';
		   document.getElementById("modeCon0").style.display='';
	 }
	  var ksnf=$("#ksnf").val();
      var jsnf=$("#jsnf").val();
      var jgdm=$("#jgdm").val();
      if(jgdm=="" ||jgdm==null){
       jgdm='${jgdm}'  
     } 
      $.ajax({
          url: "${ctx}/swxxfx/swxxfx2.json?p_ksnf="+ksnf
                +"&p_jsnf="+jsnf
                +"&p_yljgdm="+jgdm,    
           datatype:"json",
          context: document.body, 
          success: function(data){
             var nodes=eval(data);
             var hh= JSON.stringify(nodes);
             var xx=JSON.parse(hh);
             var fianl=xx.swxxfxList;
             var swrs=new Array();
             var swnf=new Array(); 
             for (var i=0;i<fianl.length;i++) { 
                 swrs[i]=fianl[i].swrs;
                 swnf[i]=fianl[i].swnf; 
                }
             chart01('chart01',swrs,swnf,ksnf,jsnf,jgdm); 
             chartCf01('chartCf01',swrs,swnf,ksnf,jsnf,jgdm); 
             
              
               
            }
            });  
} 

</script>


 <script type="text/javascript">
 function chart01(id,swrs,swnf,ksnf,jsnf,jgdm) {
	    var myChart = echarts.init(document.getElementById(id));
	    myChart.dispose();
	    myChart = echarts.init(document.getElementById(id));
	    var fontColor = '#333';
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
	            right: '4%',
	            top: "4%",
	            itemGap: 15,
	            textStyle: {
	                color: "#333333",
	                fontSize: 12
	            },
	            data: [
	                {
	                    name: "死亡人数",
	                }
	            ]
	        },
	        grid: {
	            containLabel: true,
	            top: '17%',
	            right: '4%',
	            left: '3%',
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
	                },
	                formatter: function (value) {
	                    return Math.ceil(value)
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
	            data: swnf,
	            axisLine: lineOption,
	            boundaryGap: true,
	            axisTick: {
	                show: false
	            },
	            axisLabel: {
	                margin: 10,
	                color: fontColor,
	                interval: 0,
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
	                name: '死亡人数',
	                type: 'bar',
	                barWidth: 24,
	                data: swrs,
	                itemStyle: {
	                    color: '#1572D5'
	                },
	                label: {
	                    show: false,
	                    position: 'top',
	                    formatter: function (params) {
	                        return '{a|' + params.name + '  死亡：' + params.value + '人}\n' + '{b|}'
	                    },
	                    rich: {
	                        a: {
	                            backgroundColor: 'rgba(21, 114, 213, .6)',
	                            padding: [3, 6, 6, 6],
	                            borderRadius: 2,
	                            color: '#FFFFFF',
	                            fontSize: 12
	                        },
	                        b: {
	                            width: 5,
	                            height: 5,
	                            align: 'center',
	                            backgroundColor: { image: 'images/small-bg01.png' }
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
	    myChart.on('click', function(params) { 
	    	window.open(
	    			"${ctx}/swxxfx/swxxfxechars?p_nf="+params.name
    	            +"&p_jgdm="+jgdm,
	    			 "_blank",
	    			 "top=300,left=300,width=800,height=500,menubar=no,toolbar=no,status=no,scrollbars=yes"
	    			);
	    	 
      
        });
	    return myChart
	};
	function chartCf01(id,swrs,swnf,ksnf,jsnf,jgdm) {
		 var myChart = echarts.init(document.getElementById(id));
		    myChart.dispose();
		    myChart = echarts.init(document.getElementById(id));
	    var fontColor = '#333';
	    

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
	            right: '4%',
	            top: "4%",
	            itemGap: 15,
	            textStyle: {
	                color: "#333333",
	                fontSize: 12
	            },
	            data: [
	                {
	                    name: "死亡人数",
	                }
	            ]
	        },
	        grid: {
	            containLabel: true,
	            top: '17%',
	            right: '4%',
	            left: '3%',
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
	                },
	                formatter: function (value) {
	                    return Math.ceil(value )
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
	            data: swnf,
	            axisLine: lineOption,
	            boundaryGap: true,
	            axisTick: {
	                show: false
	            },
	            axisLabel: {
	                margin: 10,
	                color: fontColor,
	                interval: 0,
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
	                name: '死亡人数',
	                type: 'line',
	                barWidth: 24,
	                data: swrs,
	                itemStyle: {
	                    color: '#1572D5'
	                },
	                label: {
	                    show: false,
	                    position: 'top',
	                    formatter: function (params) {
	                        return '{a|' + params.name + '  死亡：' + params.value + '人}\n' + '{b|}'
	                    },
	                    rich: {
	                        a: {
	                            backgroundColor: 'rgba(21, 114, 213, .6)',
	                            padding: [3, 6, 6, 6],
	                            borderRadius: 2,
	                            color: '#FFFFFF',
	                            fontSize: 12
	                        },
	                        b: {
	                            width: 5,
	                            height: 5,
	                            align: 'center',
	                            backgroundColor: { image: 'images/small-bg01.png' }
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
	    myChart.setOption(option);
	    myChart.on('click', function(params) { 
	    	window.open(
	    			"${ctx}/swxxfx/swxxfxechars?p_nf="+params.name
    	            +"&p_jgdm="+jgdm,
	    			 "_blank",
	    			 "top=300,left=300,width=800,height=500,menubar=no,toolbar=no,status=no,scrollbars=yes"
	    			);
	    	 
      
        });
	    return myChart
	};

 
 </script>
<script type="text/javascript">
function chart02(id,fian3,ksnf,jsnf,jgdm) {
	$('#clearfix').html("");
	var datas = [];
	  var datass = [];
	  var datasss = [];
	  for (var i = 0; i < fian3.length; i++) {
		  $('#clearfix').append("<li class='li0"+(i+1)+"'"+"><i></i> <label "+"id='"+ 'id'+(i+1)+"'"+" for=''></label> </li>");  
		  
		  $('#id' + (i+1)).html('');
			$('#id' + (i+1)).html(fian3[i].nldmc); 
		  
	    datas.push({
	      name:fian3[i].nldmc
	    })
	    datass.push({
	      name:fian3[i].nldmc,
	      value:fian3[i].nldrk
	    })
	    datasss.push(fian3[i].nld);
	  } 
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
        color : [ '#88CA6D', '#3AA873', '#2EEDE6', '#F9A92B',
            '#0DAEF1', '#1572D5', '#744EBC', '#5D6DBD'  ],
        series: [
            {
                name: '死亡年龄段分布',
                type: 'pie',
                hoverOffset: 4,
                center: ["26%", "54%"],
                radius: ['35%', '60%'],
                label: {
                    show: false
                },
                labelLine: {
                    show: false,
                    length: 8,
                    length2: 5
                },
                data:datass ,
                emphasis: {
                    label: {
                        show: true,
                        fontSize: 18,
                        formatter: function (params) {
                            return '{a|' + params.name + '}\n' + (params.percent).toFixed(2) + '%\n' +params.value+'人'
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
     myChart.on('click', function(params) { 
    	 
	    	window.open(
	    			"${ctx}/swxxfx/getechars06?p_ksnf="+ksnf
	                +"&p_jsnf="+jsnf
	                +"&p_yljgdm="+jgdm
	                +"&p_nldbm="+ datasss[params.dataIndex],
	    			
	    			);
	    	 
      
        });
    return myChart
};
</script>
<script type="text/javascript">
function chart03(id,ers,yrs,xlqqs,xlqs,qcs,qns,zns,lns,nldnfs) {
	 var myChart = echarts.init(document.getElementById(id));
	    myChart.dispose();
	    myChart = echarts.init(document.getElementById(id));
    var option = {
        tooltip: {
            trigger: 'axis',
            axisPointer: {
                type: 'shadow',
            },
            backgroundColor:'rgba(69, 69, 222, .6)'
        },
        grid: {
            containLabel: true,
            top: '13%',
            right: '5%',
            left: '4%',
            bottom: '6%'
        },
        yAxis: [{
            name: '人',
            nameGap: 10,
            nameTextStyle: {
                color: '#333333',
                fontSize: 12
            },
            axisLabel: {
                color: '#333333',
                fontSize: 12,
                formatter: function (value) {
                    return Math.ceil(value )
                }
            },
            axisTick: {
                show: false
            },
            axisLine: {
                lineStyle: {
                    color: 'rgba(219, 225, 229, .75)'
                }
            },
            splitLine: {
                show: true,
                lineStyle: {
                    color: 'rgba(219, 225, 229, .75)'
                }
            }
        }],
        xAxis: [{
            type: 'category',
            data: nldnfs,
            axisLine: {
                lineStyle: {
                    color: 'rgba(219, 225, 229, .75)'
                }
            },
            boundaryGap: false,
            axisTick: {
                show: false
            },
            axisLabel: {
                margin: 10,
                color: '#333333',
                textStyle: {
                    fontSize: 12
                }
            },
            splitArea: {
                show: true,
                areaStyle: {
                    color: ['rgba(255,255,255,.01)', 'rgba(213, 228, 255, .3)']
                }
            }
        }],
        series: [
            {
                name: '婴儿期',
                type: 'line',
                data: ers,
                symbol: 'circle',
                symbolSize: 6,
                smooth: true,
                itemStyle: {
                    color: 'white',
                    borderColor: '#0cbe68'
                },
                lineStyle: {
                    width: 1,
                    color:'#0cbe68'
                }
            }, {
                name: '幼儿期',
                type: 'line',
                data: yrs,
                symbol: 'circle',
                symbolSize: 6,
                smooth: true,
                itemStyle: {
                    color: 'white',
                    borderColor: '#0cbe68'
                },
                lineStyle: {
                    width: 1,
                    color: '#0cbe68'
                }
            }, {
                name: '学龄前期',
                type: 'line',
                data: xlqqs,
                symbol: 'circle',
                symbolSize: 6,
                smooth: true,
                itemStyle: {
                    color: 'white',
                    borderColor: '#2eede6'
                },
                lineStyle: {
                    width: 1,
                    color: '#2eede6'
                }
            }, {
                name: '学龄期',
                type: 'line',
                data: xlqs,
                symbol: 'circle',
                symbolSize: 6,
                smooth: true,
                itemStyle: {
                    color: 'white',
                    borderColor: '#f9a92b'
                },
                lineStyle: {
                    width: 1,
                    color: '#f9a92b'
                }
            }, {
                name: '青春期',
                type: 'line',
                data: qcs,
                symbol: 'circle',
                symbolSize: 6,
                smooth: true,
                itemStyle: {
                    color: 'white',
                    borderColor: '#0daef1'
                },
                lineStyle: {
                    width: 1,
                    color: '#0daef1'
                }
            }, {
                name: '青年期',
                type: 'line',
                data: qns,
                symbol: 'circle',
                symbolSize: 6,
                smooth: true,
                itemStyle: {
                    color: 'white',
                    borderColor: '#1572d5'
                },
                lineStyle: {
                    width: 1,
                    color: '#1572d5'
                }
            }, {
                name: '中年期',
                type: 'line',
                data: zns,
                symbol: 'circle',
                symbolSize: 6,
                smooth: true,
                itemStyle: {
                    color: 'white',
                    borderColor: '#744ebc'
                },
                lineStyle: {
                    width: 1,
                    color: '#744ebc'
                }
            }, {
                name: '老年期',
                type: 'line',
                data: lns,
                symbol: 'circle',
                symbolSize: 6,
                smooth: true,
                itemStyle: {
                    color: 'white',
                    borderColor: '#6877c1'
                },
                lineStyle: {
                    width: 1,
                    color: '#6877c1'
                }
            }
        ]
    };
    myChart.setOption(option)
    return myChart
};
</script>
<script type="text/javascript">
function chart04(id,fian4,ksnf,jsnf,jgdm) {

	$('#legend01').html("");
	$('#legend02').html("");
	$('#legend03').html("");
	var datas = [];
    var datass = [];
    var datasss = [];
    for (var i = 0; i < fian4.length; i++) {
    	if(i<=12){  	 
  	      if(i<9){
  	    	 
  		$('#legend01').append("<li class='li0"+(i+1)+"'"+"><i></i> <label "+"id='"+ 'id'+(i+21)+"'"+" for=''></label> </li>");
  	      }else{
  	    	 
  		$('#legend01').append("<li class='li"+(i+1)+"'"+"><i></i> <label "+"id='"+ 'id'+(i+21)+"'"+" for=''></label> </li>");	
  	    }
  	 }  
    	if(i>=13&&i<=14){ 
			$('#legend02').append("<li class='li"+(i+1)+"'"+"><i></i> <label "+"id='"+ 'id'+(i+21)+"'"+" for=''></label> </li>");	
		}
		if(i>=15&&i<=16){ 
			$('#legend03').append("<li class='li"+(i+1)+"'"+"><i></i> <label "+"id='"+ 'id'+(i+21)+"'"+" for=''></label> </li>");	
		} 
		 $('#id' + (i+21)).html('');
		 $('#id' + (i+21)).html(fian4[i].jbflmc); 
    	
    	
    	
      datas.push(
    		  {name:fian4[i].jbflmc}
    		  )
      datass.push({
        name:fian4[i].jbflmc,
        value:fian4[i].swrs
      })
      datasss.push(fian4[i].jbflbm);
    } 
	
    var myChart = echarts.init(document.getElementById(id));
    myChart.dispose();
    myChart = echarts.init(document.getElementById(id));
    var option = {
        tooltip: {
            trigger: 'item',
            axisPointer: {
                type: 'shadow'
            },
            formatter:function(params){
                return params.name+"："+params.percent+'%'
            }
        },
        color : [ '#7EB14A', '#1BACBF', '#178ACF', '#68B6F4',
            '#5792F3', '#5D6DBD', '#9477CA', '#744EBC',
            '#B96BC6', '#F59ADC', '#EC7FC4', '#A94CBA',
            '#BA4CAC','#9DDE5B','#CBF04C','#D9DB1B','#DC9023'],
         series: [
            {
                name: '病案疾病大类分析',
                type: 'pie',
                hoverOffset: 6,
                center: ["40%", "47%"],
                radius: ['45%', '76%'],
                label: {
                    show: false
                },
                data:datass ,
                labelLine: {
                    show: false,
                    length: 5,
                    length2: 10
                }
            }
        ]
    };
    myChart.setOption(option);
    myChart.on('click', function(params) { 
    
    	  window.open(
    			"${ctx}/swxxfx/getechars09?p_ksnf="+ksnf
                +"&p_jsnf="+jsnf
                +"&p_yljgdm="+jgdm
                +"&p_jbbm="+ datasss[params.dataIndex],
    			 "_blank",
    			 "top=300,left=300,width=800,height=500,menubar=no,toolbar=no,status=no,scrollbars=yes"
    			);
    	  
  
    });
    return myChart
};


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
							<i value="year" class="n " onclick="sjxz('year')">年</i>
							<i value="month" class="y" onclick="sjxz('month')">月</i>
							<i value="day" class="r active" onclick="sjxz('day')">日</i>
						</ul>
				</span> 
				
				<span class="det"> <label for="">开始时间</label> <input
						type="text" id="ksnf" readonly="readonly" onClick=""
						value="${ksnf }" class="Wdate" style="width: 100px" />
						<div
							style="position: absolute; margin-left: 188px; margin-top: -28px;">
							<img src="<c:url value="/static/commons/images/topImg1.png"/>">
						</div>
				</span>
				</span> 
				<span class="det" style="margin-left: 5px;"> <label for="">结束时间</label>
					<input type="text" id="jsnf" readonly="readonly" onClick=""
					value="${jsnf }" class="Wdate" style="width: 100px" />
					<div
						style="position: absolute; margin-left: 188px; margin-top: -28px;">
						<img src="<c:url value="/static/commons/images/topImg1.png"/>">
					</div>
				</span>
				 
				 
				 
				<span class="det detLast" style="margin-left: 150px;"> <label
					for="">乡镇名称</label> <select id="jgdm" name="jgdm" lay-search>
						<option value="">全区</option>
						<c:forEach items="${swjdList}" var="jg">
							<option value="${jg.jgdm}">${jg.jgmc}</option>
						</c:forEach>
				</select>
				</span>
			</div>
			<div class="topRight">
				<button style="cursor: pointer;" class="btn1" onclick="search();">查询</button>
			</div>
		</div>
		　<div class="main swrkxx">
        <div class="botCon">
            <ul class="detail clearfix">
                <li class="mode mode01">
                    <div class="modeBg">
                        <div class="modeTop">
                            <div class="title">
                                <i></i>
                                <label for="">死亡年度分析</label>
                                <div class="tabTop">
                                    <span class="ss" id="top0" onclick="nldfx('qxt')">曲线图</span>
                                </div>
                                <div class="tabTop">
                                    <span class="active" id="top1" onclick="nldfx('zxt')">柱状图</span>
                               </div>
                            </div>
                        </div>
                        <div class="modeCon" id='modeCon0'>
                            <div class="chartBox" id="chart01"></div>
                        </div>
                        <div class="modeCon" id='modeCon1' style="display: none;">
                            <div class="chartBox" id="chartCf01"></div>
                        </div>
                    </div>
                </li>
                <li class="mode mode02">
                    <div class="modeBg">
                        <div class="modeTop">
                            <div class="title">
                                <i></i>
                                <label for="">死亡年龄段分布（可点击查看详情）</label>
                            </div>
                        </div>
                        <div class="modeCon">
                            <div class="chartBox" id="chart02"></div>
                            <ul class="legend clearfix" id='clearfix'>
                                
                            </ul>
                        </div>
                    </div>
                </li>
                <li class="mode mode03">
                    <div class="modeBg">
                        <div class="modeTop">
                            <div class="title clearfix">
                                <i></i>
                                <label for="">死亡年龄段年度趋势分析</label>
                                <ul class="legend clearfix">
                                    <li class="li01">
                                        <i></i>
                                        <label for="">婴儿期</label>
                                    </li>
                                    <li class="li02">
                                        <i></i>
                                        <label for="">幼儿期</label>
                                    </li>
                                    <li class="li03">
                                        <i></i>
                                        <label for="">学龄前期</label>
                                    </li>
                                    <li class="li04">
                                        <i></i>
                                        <label for="">学龄期</label>
                                    </li>
                                    <li class="li05">
                                        <i></i>
                                        <label for="">青春期</label>
                                    </li>
                                    <li class="li06">
                                        <i></i>
                                        <label for="">青年期</label>
                                    </li>
                                    <li class="li07">
                                        <i></i>
                                        <label for="">中年期</label>
                                    </li>
                                    <li class="li08">
                                        <i></i>
                                        <label for="">老年期</label>
                                    </li>
                                </ul>
                            </div>
                        </div>
                        <div class="modeCon clearfix">
                            <div class="chartBox" id="chart03"></div>
                            <div class="info">
                                <div class="font">备注：</div>
                                <ul class="det">
                                    <li>
                                        <label for="">婴儿期:</label>
                                        <span>0-3岁</span>
                                    </li>
                                    <li>
                                        <label for="">幼儿期:</label>
                                        <span>3-5岁</span>
                                    </li>
                                    <li>
                                        <label for="">学龄前期:</label>
                                        <span>5-7岁</span>
                                    </li>
                                    <li>
                                        <label for="">学龄期:</label>
                                        <span>7-18岁</span>
                                    </li>
                                    <li>
                                        <label for="">青春期:</label>
                                        <span>18-28岁</span>
                                    </li>
                                    <li>
                                        <label for="">青年期:</label>
                                        <span>28-40岁</span>
                                    </li>
                                    <li>
                                        <label for="">中年期:</label>
                                        <span>40-65岁</span>
                                    </li>
                                    <li>
                                        <label for="">老年期:</label>
                                        <span>65-120岁</span>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </li>
                <li class="mode mode04">
                    <div class="modeBg">
                        <div class="modeTop">
                            <div class="title">
                                <i></i>
                                <label for="">死亡疾病分布（可点击查看详情）</label>
                            </div>
                        </div>
                        <div class="modeCon">
                            <ul class="legend legend01" id='legend01'> </ul>
                            <ul class="legend legend02" id="legend02"> </ul>
                            <ul class="legend legend03" id='legend03'> </ul>
                            <div class="chartBox" id="chart04"></div>
                        </div>
                    </div>
                </li>
            </ul>
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