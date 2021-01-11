<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/commons/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
<title>健康档案管理分析</title>

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
    }else if(id=='day'){
    	$("#kssj").val('${kssj}'+'-01');
    	$("#jssj").val('${jssjs}');
      document.getElementById("kssj").onclick = function(){
        WdatePicker({dateFmt:'yyyy-MM-dd'})
        };
      document.getElementById("jssj").onclick = function(){
        WdatePicker({dateFmt:'yyyy-MM-dd'})
          };
    }else{
   	 $("#kssj").val('${kssj}'.substr(0,7));
     $("#jssj").val('${jssj}'.substr(0,7));
  document.getElementById("kssj").onclick = function(){
    WdatePicker({dateFmt:'yyyy-MM'})
    };
  document.getElementById("jssj").onclick = function(){
    WdatePicker({dateFmt:'yyyy-MM'})
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
   getData(); 
   }
function getData(){
	var kssj=$("#kssj").val();
    var jssj=$("#jssj").val();
	var jgdm=$("#jgdm").val();
    if(jgdm=="" ||jgdm==null){ jgdm='${jgdm}' } 
    if(jssj<kssj){
		  alert("选择的结束时间请大于或等于开始时间")
		  return;
	  }
    getJdechats(kssj,jssj,jgdm); 
    }  
function getJdechats(kssj,jssj,jgdm){
	 $.ajax({
	      url: "${ctx}/jkdaglfx/jkdaglfx.json?p_kssj="+kssj
	            +"&p_jssj="+jssj
	            +"&p_yljgdm="+jgdm,    
	       datatype:"json",
	      context: document.body, 
	      success: function(data){
	         var nodes=eval(data);
	         var hh= JSON.stringify(nodes);
	         var xx=JSON.parse(hh);
	         var fianl=xx.yjdfxList;
	         var yljgmc=new Array();
	         var yjdhjrk=new Array();
	         var yjdldrk=new Array();
	         var yjdqtrk=new Array();
	         var jdhjzb=new Array();
	         var jdldzb=new Array();
	         var fian2=xx.czrkzs;//户籍人口总数
	         var fian3=xx.ldrkzs;//流动人口总数
	         
	         var fian4=xx.djdfxList;//待建档分析
	         var djdczrk=new Array();//待建档户籍人口
	         var djdldrk=new Array();//待建档流动人口
	         var pcsmc=new Array();//派出所名称
	         var yljgdm=new Array();//
	         
	         var fian5=xx.jdqsfxList;//建档趋势分析
	         var jdrs=new Array();//建档人数
	         var jdrq=new Array();//建档日期
	         
	            for (var i=0;i<fianl.length;i++) { 
	            	yljgmc[i]=fianl[i].yljgmc;
	            	yjdhjrk[i]=fianl[i].yjdhjrk; 
	            	yjdldrk[i]=fianl[i].yjdldrk;
	            	yjdqtrk[i]=fianl[i].yjdqtrk;
	            	jdhjzb[i]=((fianl[i].yjdhjrk/fian2)*100).toFixed(3);//建档户籍占比
	            	jdldzb[i]=((fianl[i].yjdldrk/fian3)*100).toFixed(3);//建档流动占比
	            }
	            for (var i=0;i<fian4.length;i++) { 
	            	djdczrk[i]=fian4[i].djdczrk;
	            	djdldrk[i]=fian4[i].djdldrk;
	            	pcsmc[i]=fian4[i].pcsmc;
	            	yljgdm[i]=fian4[i].yljgdm;
	            }
	            for(var i=0;i<fian5.length;i++){
	            	jdrs[i]=fian5[i].jdrs;
	            	jdrq[i]=fian5[i].jdrq;
	            }
	           chart01('chart01',yljgmc,yjdhjrk,yjdldrk,yjdqtrk,jdhjzb,jdldzb,fian2,fian3); 
	           chart02('chart02',djdczrk,djdldrk,pcsmc,yljgdm);
	           chart03('chart03',jdrs,jdrq);  
	        }
	        });
}
</script>
<script type="text/javascript">
function chart01(id,yljgmc,yjdhjrk,yjdldrk,yjdqtrk,jdhjzb,jdldzb,fian2,fian3) {
	 var myChart=echarts.init(document.getElementById(id));
	    myChart.dispose();
	    myChart = echarts.init(document.getElementById(id));
	  var fontColor = '#333';  
	  var jdhjzs=null;
	    var jdldzs=null;
	    var jdqtzs=null;
	    for(var i=0;i<yjdhjrk.length;i++){
	    	jdhjzs+=Number(yjdhjrk[i])
	    }
	    for(var i=0;i<yjdldrk.length;i++){
	    	jdldzs+=Number(yjdldrk[i])
	    }
	    for(var i=0;i<yjdqtrk.length;i++){
	    	jdqtzs+=Number(yjdqtrk[i])
	    }
	     var zs=jdhjzs+jdldzs+jdqtzs; 
	     $('#id1').html(''); 
	     $('#id1').html('健康档案各乡镇发布（总数：'+zs+'人）'); 
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
	                  name: "流动建档数",
	              },
	              {
	                  name: "户籍建档数",
	              },
	              {
	                  name: "其他建档数",
	              },
	              {
	                  name: "户籍建档数占比",
	              },
	              {
	                  name: "流动建档数占比",
	              }
	          ]
	      },
	      grid: {
	          containLabel: true,
	          top: '20%',
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
	      },
	      {
	        name: '%',
	        position:'right',
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
	            show: false,
	            lineStyle: {
	                color: '#ededed'
	            }
	        }
	    }
	    ],
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
	          name: '流动建档数',
	          type: 'bar',
	          barWidth: 16,
	          data:yjdldrk,
	          stack: true,
	          itemStyle: {
	              color: '#0DAEF1'
	          }
	        },
	        {
	            name: '户籍建档数',
	            type: 'bar',
	            barWidth: 16,
	            data: yjdhjrk,
	            stack: true,
	            itemStyle: {
	                color: '#1572D5'
	            }
	        }, 
	        {
	            name: '其他建档数',
	            type: 'bar',
	            barWidth: 16,
	            data:yjdqtrk,
	            stack: true,
	            itemStyle: {
	                color: '#22AC38'
	            }
	        }, 
	        {
	            name: '户籍建档数占比',
	            type: 'line',
	            data:jdhjzb,
	            symbolSize:6,
	            yAxisIndex: 1 ,
	            itemStyle: {
	                color: '#F39800'
	            }
	        }, 
	        {
	            name: '流动建档数占比',
	            type: 'line',
	            data:jdldzb,
	            symbolSize:6,
	            yAxisIndex: 1 ,
	            itemStyle: {
	                color: '#80C269'
	            }
	        }, 
	      ]
	  };
	  myChart.setOption(option)
	  return myChart
	};

</script>
<script type="text/javascript">
function chart02(id,djdczrk,djdldrk,pcsmc,yljgdm){ 
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
	                  name: "待建档流动人口",
	              },
	              {
	                  name: "待建档户籍人口",
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
	          data: pcsmc,
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
	              name: '待建档户籍人口',
	              type: 'bar',
	              barWidth: 16,
	              data:djdczrk,
	              stack: true,
	              itemStyle: {
	                  color: '#1572D5'
	              }
	          }, {
	              name: '待建档流动人口',
	              type: 'bar',
	              barWidth: 16,
	              data:djdldrk,
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


</script>
<script type="text/javascript">
function chart03(id,jdrs,jdrq){
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
	                  name: "建档人数",
	              }
	          ]
	      },
	      grid: {
	          containLabel: true,
	          top: '17%',
	          right: '4%',
	          left: '2%',
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
	                  return params
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
	          data: jdrq,
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
	              name: '建档人数',
	              type: 'line',
	              data: jdrs,
	              symbolSize: 8,
	              smooth: true,
	              zlevel: 2,
	              itemStyle: {
	                  color: 'rgba(29, 179, 242, 0.5)'
	              },
	              areaStyle: {
	                  color: 'rgba(29, 179, 242, 0.1)'
	              }
	          }
	      ]
	  };
	  myChart.setOption(option)
	  return myChart
	};
</script>
</head>
<body>
	<div class="headBox"></div>
	<div class="main mainThree">
		<div class="top clearfix">
			<div class="topLeft">
				<span class="det"> <span class="sj sjKs">
						<ul id="sjxzid">
							<i class="n " onclick="sjxz('year')">年</i> 
				            <i class="y active" onclick="sjxz('month')">月</i> 
				            <i class="r " onclick="sjxz('day')">日</i>
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
				</span> 
				<span class="det detLast" style="margin-left: 150px;"> <label
					for="">乡镇名称</label> <select id="jgdm" name="jgdm" lay-search>
						<option value="">全区</option>
						<c:forEach items="${jdjgList}" var="jg">
							<option value="${jg.jgdm}">${jg.jgmc}</option>
						</c:forEach>
				</select>
				</span>
			</div>
			<div class="topRight">
				<button style="cursor: pointer;" class="btn1" onclick="search();">查询</button>
			</div>
		</div>
		<div class="main jdfx">
			<div class="botCon">
				<ul class="detail clearfix">
					<li class="mode leftLi">
						<div class="mode mode01">
							<div class="modeBg">
								<div class="modeTop">
									<div class="title">
										<i></i> <label for="" id='id1'></label>
									</div>
								</div>
								<div class="modeCon">
									<div class="chartBox" id="chart01"></div>
								</div>
								<div class="modeCon" style="display: none;">
									<div class="chartBox" id="reschart01"></div>
								</div>
							</div>
						</div>
					</li>
					<li class="mode mode02">
						<div class="modeBg">
							<div class="modeTop">
								<div class="title clearfix">
									<i></i> <label for="">待建档分析</label>
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
									<i></i> <label for="">建档趋势分析</label>
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