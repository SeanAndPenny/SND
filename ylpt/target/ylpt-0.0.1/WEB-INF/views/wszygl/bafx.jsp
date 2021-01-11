<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/commons/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
<title>病案分析</title>


<link rel="stylesheet" type="text/css"
	href="<c:url value="/static/commons/css/rkzb_reset.css"/>" />

<link rel="stylesheet" type="text/css"
	href="<c:url value="/static/commons/css/bafx_index.css"/>" />
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
	src="<c:url value="/static/commons/js/swiper.min.js"/>"></script>

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
      url: "${ctx}/bafx/bafx.json?p_kssj="+kssj
            +"&p_jssj="+jssj
            +"&p_yljgdm="+jgdm,    
       datatype:"json",
      context: document.body, 
      success: function(data){
         var nodes=eval(data);
         var hh= JSON.stringify(nodes);
         var xx=JSON.parse(hh);
         
         var fianl=xx.bazhList;
         var yljgmc=new Array();
         var yljgdm=new Array();
         var  rs=new Array();
         
         
         var fian2=xx.bajcList;
         var yljgmc2=new Array();
         var yljgdm2=new Array();
         var  rs2=new Array();
         
         var fian3=xx.baJbdlList;
         
         
         for (var i=0;i<fianl.length;i++) { 
      	   yljgmc[i]=fianl[i].yljgmc;
      	   yljgdm[i]=fianl[i].yljgdm;
      	   rs[i]=fianl[i].rs; 
      	   
            }
         for (var i=0;i<fian2.length;i++) { 
      	   yljgmc2[i]=fian2[i].yljgmc;
      	   yljgdm2[i]=fian2[i].yljgdm;
      	   rs2[i]=fian2[i].rs; 
      	  
            } 
         
           chart01('chart01',yljgmc,rs,yljgdm,kssj,jssj); 
           chart02('chart02', yljgmc2,rs2,yljgdm2,kssj,jssj);
          chart03('chart03',fian3, jgdm,kssj,jssj);
        }
        });
    getechars04('',jgdm,kssj,jssj,'')  
}
		 
</script>
<script type="text/javascript">
function getechars03(yljgdm,kssj,jssj){ 
    $.ajax({
      url: "${ctx}/bafx/getechars03.json?p_jgdm="+yljgdm
            +"&p_kssj="+kssj
            +"&p_jssj="+jssj,    
       datatype:"json",
      context: document.body, 
      success: function(data){
         var nodes=eval(data);
         var hh= JSON.stringify(nodes);
         var xx=JSON.parse(hh);
         var fian3=xx.getechars03List; 
         
        chart03('chart03',fian3,yljgdm,kssj,jssj);  
        
        }
        });
}


</script>
<script type="text/javascript">
function getechars04(jbflbm,jgdm,kssj,jssj,name){ 
    $.ajax({
      url: "${ctx}/bafx/getechars04.json?p_jbflbm="+jbflbm
            +"&p_jgdm="+jgdm
            +"&p_kssj="+kssj
            +"&p_jssj="+jssj,    
       datatype:"json",
      context: document.body, 
      success: function(data){
         var nodes=eval(data);
         var hh= JSON.stringify(nodes);
         var xx=JSON.parse(hh);
         var fianl=xx.getechars04List;
         var jbrs=new Array();
         var jbbm=new Array();  
         var jbmc=new Array(); 
         
         for (var i=0;i<fianl.length;i++) { 
        	 jbrs[i]=fianl[i].rs;
        	 jbbm[i]=fianl[i].jbbm; 
        	 jbmc[i]=fianl[i].jbmc; 
            }
         
        chart04('chart04',jbrs,jbbm,jbmc,name);  
        
        }
        });
}


</script>
<script type="text/javascript">
 function chart01(id,yljgmc,rs,yljgdm,kssj,jssj) {
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
	                    name: "病案人数",
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
	                interval:0,
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
	                name: '病案人数',
	                type: 'bar',
	                barWidth: 24,
	                data: rs,
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
	     myChart.on('click', function(params) { 
	    	  var left = $('.round-button1').css('left');
	          left = parseInt(left);
	          if (left == 0) {
	        	  
	        	  getechars03(yljgdm[params.dataIndex],kssj,jssj);
			    getechars04('',yljgdm[params.dataIndex],kssj,jssj,'')
	          }else{
	        	  
	        	  window.open("${ctx}/bafx/bafxKsxz?p_kssj="+$("#kssj").val()
	        	            +"&p_jssj="+$("#jssj").val()+"&p_jgdm="+yljgdm[params.dataIndex]
	        	              );
	        	  }
		    	  
	           }); 
	    return myChart
	};
 
 </script>
<script type="text/javascript">
 function chart02(id,yljgmc,rs,yljgdm,kssj,jssj){
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
	                    name: "病案人数",
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
	                name: '病案人数',
	                type: 'bar',
	                barWidth: 24,
	                data: rs,
	                itemStyle: {
	                    color: '#88CA6D'
	                },
	                label: {
	                    show: false,
	                    position: 'top',
	                    formatter: function (params) {
	                        return '{a|' + params.value + '人}\n' + '{b|}'
	                    },
	                    rich: {
	                        a: {
	                            backgroundColor: 'rgba(102, 166, 76, .6)',
	                            padding: [3, 6, 6, 6],
	                            borderRadius: 2,
	                            color: '#FFFFFF',
	                            fontSize:12
	                        },
	                        b: {
	                            width: 5,
	                            height: 5,
	                            align: 'center',
	                            backgroundColor: { image: 'images/bafx/small-bg02.png' }
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
	    	 var left = $('.round-button1').css('left');
	          left = parseInt(left);
	          if (left == 0) {
	        	  
	        	  getechars03(yljgdm[params.dataIndex],kssj,jssj);
			    getechars04('',yljgdm[params.dataIndex],kssj,jssj,'')
	          }else{
	        	  
	        	  window.open("${ctx}/bafx/bafxKsxz?p_kssj="+$("#kssj").val()
	        	            +"&p_jssj="+$("#jssj").val()+"&p_jgdm="+yljgdm[params.dataIndex]
	        	              );
	        	  }
	           }); 
	    return myChart
	};

 </script>
<script type="text/javascript">
function chart03(id,fian3, jgdm,kssj,jssj) {
 
	$('#legend01').html("");
	$('#legend02').html("");
	$('#legend03').html("");
	  var datas = [];
	  var datass = [];
	  var datasss = [];
	  var str="";
	  for (var i = 0; i < fian3.length; i++) {
		if(i<=12){  	 
	      if(i<9){
		$('#legend01').append("<li class='li0"+(i+1)+"'"+"><i></i> <label "+"id='"+ 'id'+(i+1)+"'"+" for=''></label> </li>");
	      }else{
		$('#legend01').append("<li class='li"+(i+1)+"'"+"><i></i> <label "+"id='"+ 'id'+(i+1)+"'"+" for=''></label> </li>");	
	    }
	 }  
		if(i>=13&&i<16){ 
			$('#legend02').append("<li class='li"+(i+1)+"'"+"><i></i> <label "+"id='"+ 'id'+(i+1)+"'"+" for=''></label> </li>");	
		}
		if(i>=16&&i<=17){ 
			$('#legend03').append("<li class='li"+(i+1)+"'"+"><i></i> <label "+"id='"+ 'id'+(i+1)+"'"+" for=''></label> </li>");	
		}
		 $('#id' + (i+1)).html('');
		 $('#id' + (i+1)).html(fian3[i].jbflmc); 
	    datas.push({
	      name:fian3[i].jbflmc
	    })
	    datass.push({
	      name:fian3[i].jbflmc,
	      value:fian3[i].rs
	    })
	    datasss.push(fian3[i].jbflbm);
	    
	    
	       
	    
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
        color:['#7EB24A','#1CACC0','#188AD0','#68B6F4','#5892F3','#3650D0'
        	, '#4062FF','#8C6CF3','#5056A4','#6872E0'
        	, '#34CAEF','#2EACA2','#44CA94','#32B03E','#9EDE5C','#CCF04D'
        	, '#D9DB1B','#DC9023'],
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
    myChart.setOption(option)
    myChart.on('click', function (params) { 
        $(".mode04 .modeTop .title label").html(params.name);
        getechars04(datasss[params.dataIndex],jgdm,kssj,jssj,params.name) 
    });
    return myChart
};

</script>
<script type="text/javascript">
 function chart04(id,jbrs,jbbm,jbmc,name) { 
	 if( name==''){
		 $('#mc').html("病案疾病小类分析"); 
	 } 
	 var myChart = echarts.init(document.getElementById(id));
	    myChart.dispose();
	    myChart = echarts.init(document.getElementById(id));
	    var max = []
	    
	    for(var i = 0; i < jbrs.length; i++){
	    	max.push(parseInt(jbrs[i]));
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
	            left: -30,
	            bottom: '13%'
	        },
	        legend: {
	            itemWidth: 12,
	            itemHeight: 12,
	            data: ['人数'],
	            top: '0',
	            right: '8%'
	        },
	        yAxis: [
	            {
	                type: "category",
	                axisLabel: {
	                    color: '#333333',
	                    interval: 0,
	                    margin: 68,
	                    formatter: function(value) {
	                        var res = value;
	                        if(res.length > 5) {
	                            res = res.substring(0, 4) + "..";
	                        }
	                       return res;
	                     },
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
	                        color: 'rgba(51,51,51,.75)',
	                    }
	                },
	                data: jbmc,
	                splitArea: {
	                    show: false
	                },
	            }],
	        xAxis: [{
	            type: 'value',
	            name: "人",
	            nameGap: 7,
	            nameTextStyle: {
	                color: '#646464',
	                fontSize: 14
	            },
	            axisLine: {
	                show: false
	            },
	            axisTick: {
	                show: false
	            },
	            axisLabel: {
	                margin: 10,
	                color: '#000000',
	                textStyle: {
	                    fontSize: 12
	                }
	            },
	            splitLine: {
	                show: true,
	                lineStyle:{
	                  type:"dashed",
	                  color:"#D6D6D6"
	                }          
	            },
	        }],
	        series: [
	            {
	                name: '人数',
	                type: 'bar',
	                data: jbrs,
	                barWidth: 14,
	                itemStyle: {
	                  color: '#30AAFF'
	                },
	                label: {
	                    show: true,
	                    position:'right',
	                    color:'#333',
	                    formatter:function(params){
	                        return params.value+'人'
	                    }
	                }
	            },
	            {
	                name: '',
	                type: 'bar',
	                data: max,
	                barWidth: 14,
	                barGap: '-100%',
	                itemStyle: {
	                    color: 'rgba(90, 184, 235, .1)'
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
						<c:forEach items="${bajgList}" var="jg">
							<option value="${jg.jgdm}">${jg.jgmc}</option>
						</c:forEach>
				</select>
				</span>
			</div>
			<div class="topRight">
				<button class="btn1" onclick="search();">查询</button>
			</div>
		</div>
		<div class="main bafx">

			<div class="botCon">
				<ul class="detail clearfix">
					<li class="mode mode01">
						<div class="modeBg">
							<div class="modeTop">
								<div class="title">
									<i></i> <label for="">综合医院病案人数</label>
								</div>
								<div
									style='position: absolute; margin-left: 424px; margin-top: -20px'>
									是否科室下钻</div>
								<div class="circular1"
									style='position: absolute; margin-left: 524px; margin-top: -20px'>
									<div class="round-button1"></div>
								</div>
							</div>
							<div class="modeCon">
								<div class="chartBox" id="chart01"></div>
							</div>

						</div>
					</li>
					<li class="mode mode02">
						<div class="modeBg">
							<div class="modeTop">
								<div class="title">
									<i></i> <label for="">基层医院病案人数</label>
								</div>
							</div>
							<div class="modeCon">
								<div class="chartBox" id="chart02"></div>
							</div>
						</div>
					</li>
					<li class="mode liIncloud">
						<div class="liIncloudBg">
							<div class="mode mode03">
								<div class="modeBg">
									<div class="modeTop">
										<div class="title clearfix">
											<i></i> <label for="">病案疾病大类分析</label>
										</div>
									</div>
									<div class="modeCon">
										<ul class="legend legend01" id="legend01">
										</ul>
										<ul class="legend legend02" id="legend02">
										</ul>
										<ul class="legend legend03" id="legend03">
										</ul>
										<div class="chartBox" id="chart03"></div>
									</div>
								</div>
							</div>
							<div class="mode mode04">
								<div class="modeBg">
									<div class="modeTop">
										<div class="title">
											<i></i> <label for="" id='mc'></label> <span class="icon"></span>
										</div>
									</div>
									<div class="modeCon">
										<div class="swiper-container">
											<div class="swiper-wrapper">
												<div class="swiper-slide">
													<div class="chartBox" id="chart04"></div>
												</div>
												<div class="swiper-slide">
													<div class="chartBox" id="chart05"></div>
												</div>
												<div class="swiper-slide">
													<div class="chartBox" id="chart06"></div>
												</div>
												<div class="swiper-slide">
													<div class="chartBox" id="chart07"></div>
												</div>
												<div class="swiper-slide">
													<div class="chartBox" id="chart08"></div>
												</div>
											</div>
											<!-- Add Pagination -->
											<div class="swiper-pagination"></div>
										</div>
									</div>
								</div>
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
</html>