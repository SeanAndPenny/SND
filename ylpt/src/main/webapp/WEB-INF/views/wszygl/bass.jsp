<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/commons/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
<title>病案手术分析</title>


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
    bassfxEchars(jgdm); 
    }
function bassfxEchars(jgdm){
	  
    var kssj=$("#kssj").val();
    var jssj=$("#jssj").val();
    if(jssj<kssj){
   	 alert("选择的结束时间请大于或等于开始时间") ;
   	 return;
     }
    $.ajax({
      url: "${ctx}/bass/bass.json?p_kssj="+kssj
            +"&p_jssj="+jssj
            +"&p_yljgdm="+jgdm,    
       datatype:"json",
      context: document.body, 
      success: function(data){
         var nodes=eval(data);
         var hh= JSON.stringify(nodes);
         var xx=JSON.parse(hh);
         var fianl=xx.bajgFxList;
         
         var yljgdm=new Array();
         var yljgmc=new Array();
         var rs=new Array();
         for (var i=0;i<fianl.length;i++) { 
      	   
      	   yljgdm[i]=fianl[i].yljgdm; 
      	   yljgmc[i]=fianl[i].yljgmc;
      	   rs[i]=fianl[i].rs;
            } 
           chart01('chart01',yljgdm,yljgmc,rs,jssj,kssj);   
        }
        });
    getechrs02(jgdm,kssj,jssj,'')
    getechrs03(jgdm,kssj,jssj);
}	 
</script>
<script type="text/javascript">
function getechrs02(yljgdm,kssj,jssj,yljgmc){
	 $.ajax({
	        url: "${ctx}/bass/getechrs02.json?p_kssj="+kssj
	              +"&p_jssj="+jssj
	              +"&p_yljgdm="+yljgdm,    
	         datatype:"json",
	        context: document.body, 
	        success: function(data){
	           var nodes=eval(data);
	           var hh= JSON.stringify(nodes);
	           var xx=JSON.parse(hh);
	           var fian2=xx.getechrs02List; 
              chart02('chart02',fian2,yljgmc);    
	          }
	          });
}
</script>
<script type="text/javascript">
function getechrs03(yljgdm,kssj,jssj){
	
	 $.ajax({
	        url: "${ctx}/bass/getechrs03.json?p_kssj="+kssj
	              +"&p_jssj="+jssj
	              +"&p_yljgdm="+yljgdm,    
	         datatype:"json",
	        context: document.body, 
	        success: function(data){
	           var nodes=eval(data);
	           var hh= JSON.stringify(nodes);
	           var xx=JSON.parse(hh);
	           
	           var fian2=xx.getechrs03List;
	             var yjrs=new Array();
	             var ejrs =new Array();
	            var sjrs =new Array();
	            var sijrs =new Array();
	            var ljrs =new Array();
	            var rq=new Array();
	            for (var i=0;i<fian2.length;i++) { 
	            	yjrs[i]=fian2[i].yjrs; 
	            	ejrs[i]=fian2[i].ejrs;
	            	sjrs[i]=fian2[i].sjrs;
	            	
	            	sijrs[i]=fian2[i].sijrs;
	            	ljrs[i]=fian2[i].ljrs;
	            	rq[i]=fian2[i].rq;
	               } 
	             chart03('chart03',yjrs,ejrs,sjrs,sijrs,ljrs,rq)    
	          }
	          });
}
</script>
 <script type="text/javascript">
 function chart01(id,yljgdm,yljgmc,rs,jssj,kssj)  {
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
	                    name: "病案手术人次数",
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
	            name: '',
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
	                name: '病案手术人次数',
	                type: 'bar',
	                barWidth: 24,
	                data: rs,
	                itemStyle: {
	                    color: '#1672D6'
	                },
	                label: {
	                    show: false,
	                    position: 'top',
	                    formatter: function (params) {
	                        return '{a|' + params.value + '人次数}\n' + '{b|}'
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
	        	  
	        	  getechrs02(yljgdm[params.dataIndex],kssj,jssj,yljgmc[params.dataIndex]);
	    	 	  getechrs03(yljgdm[params.dataIndex],kssj,jssj);
	          }else{
	        	  
	        	  window.open("${ctx}/bass/bassKsxz?p_kssj="+$("#kssj").val()
	        	            +"&p_jssj="+$("#jssj").val()+"&p_jgdm="+yljgdm[params.dataIndex]
	        	              );  
	          }
	    	 
	 	   
	 	            });  
	    return myChart
	};

 </script>
 <script type="text/javascript">
 function chart02(id,fian3,yljgmc) {
	 $('#legend').html("");
	 var datas = [];
	  var datass = [];
	  var datasss = [];
	  for (var i = 0; i < fian3.length; i++) {
	    datas.push({
	      name:fian3[i].jbmc
	    })
	    datass.push({
	      name:fian3[i].jbmc,
	      value:fian3[i].rs
	    })
	    datasss.push(fian3[i].nnis);
	    $('#legend').append("<li class='li0"+(i+1)+"'"+"><i></i> <label "+"id='"+ 'id'+(i+1)+"'"+" for=''></label> <span></span> </li>"); 
	    $('#id' + (i+1)).html('');
		$('#id' + (i+1)).html(fian3[i].jbmc);  
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
	        color : [ '#88CA6E', '#3AA874', '#008C72', '#2EC6F2',
	  	      '#0EAEF1','#ff0000'],
	        series: [
	            {
	                name: '病案手术级别分析',
	                type: 'pie',
	                hoverOffset: 4,
	                center: ["30%", "48%"],
	                radius: ['40%', '68%'],
	                label: {
	                    show: false
	                },
	                labelLine: {
	                    show: false,
	                    length: 11,
	                    length2: 12
	                },
	                data: datass,
	                emphasis: {
	                    label: {
	                        show: true,
	                        fontSize: 18,
	                        formatter: function (params) {
	                            return '{a|' + params.name + '}\n' + params.value + '{b|人次数}'
	                        },
	                        rich: {
	                            a: {
	                                fontSize: 16,
	                                color: '#343434',
	                                padding: [6, 0, 0, 0]
	                            },
	                            b:{
	                                fontSize:13
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
	    return myChart
	};
 </script>
<script type="text/javascript">
function chart03(id,yjrs,ejrs,sjrs,sijrs,ljrs,rq) {
	 
	 var myChart = echarts.init(document.getElementById(id));
	    myChart.dispose();
	    myChart = echarts.init(document.getElementById(id));
    var fontColor = '#343434';
     
  
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
        color : [ '#88CA6E', '#3AA874', '#008C72', '#2EC6F2',
	  	      '#0EAEF1','#ff0000'],
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
                    name: "零级手术",
                },
                {
                    name: "一级手术",
                },
                {
                    name: "二级手术",
                },
                {
                    name: "三级手术",
                },
                {
                    name: "四级手术",
                }
            ]
        },
        grid: {
            containLabel: true,
            top: '17%',
            right: '3%',
            left: '3%',
            bottom: '5%'
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
        yAxis: [{
            name: '人次数',
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
            data: rq,
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
                name: '零级手术',
                type: 'line',
                data: ljrs,
                symbolSize: 8,
                smooth: true,
                zlevel: 2,
                itemStyle: {
                    color: 'rgba(12,190,104,1)'
                },
                areaStyle: {
                    color: 'rgba(12,190,104,.1)'
                }
            }, {
                name: '一级手术',
                type: 'line',
                data: yjrs,
                symbolSize: 8,
                smooth: true,
                zlevel: 2,
                itemStyle: {
                    color: 'rgba(58,168,115,1)'
                },
                areaStyle: {
                    color: 'rgba(58,168,115,.1)'
                }
            }, {
                name: '二级手术',
                type: 'line',
                data: ejrs,
                symbolSize: 8,
                smooth: true,
                zlevel: 2,
                itemStyle: {
                    color: 'rgba(15,146,123,1)'
                },
                areaStyle: {
                    color: 'rgba(15,146,123,.1)'
                }
            },{
                name: '三级手术',
                type: 'line',
                data: sjrs,
                symbolSize: 8,
                smooth: true,
                zlevel: 2,
                itemStyle: {
                    color: 'rgba(57,201,243,1)'
                },
                areaStyle: {
                    color: 'rgba(57,201,243,.1)'
                }
            },{
                name: '四级手术',
                type: 'line',
                data: sijrs,
                symbolSize: 8,
                smooth: true,
                zlevel: 2,
                itemStyle: {
                    color: 'rgba(27,179,242,1)'
                },
                areaStyle: {
                    color: 'rgba(27,179,242,.1)'
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
				<button style="cursor: pointer;" class="btn1" onclick="search();">查询</button>
			</div>
		</div>
		 <div class="main ssfx">
        <div class="botCon">
            <ul class="detail clearfix">
                <li class="mode mode01">
                    <div class="modeBg">
                        <div class="modeTop">
                            <div class="title">
                                <i></i>
                                <label for="">病案手术机构统计</label>
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
                                <i></i>
                                <label for="">病案手术级别分析</label>
                            </div>
                        </div>
                        <div class="modeCon">
                            <div class="chartBox" id="chart02"></div>
                            <ul class="legend" id='legend'>
                               
                            </ul>
                        </div>
                    </div>
                </li>
                <li class="mode mode03">
                    <div class="modeBg">
                        <div class="modeTop">
                            <div class="title clearfix">
                                <i></i>
                                <label for="">住院手术占有量分析</label>
                            </div>
                        </div>
                        <div class="modeCon">
                            <div class="chartBox" id="chart03"></div>
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