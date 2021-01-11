<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/commons/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
<title>数据分析</title>

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
		html,body{
			background: #ededed;
			height: 100%;
			width: 100%;
		}
	</style>
	
	

<script type="text/javascript">

function chart01(id,sl1,sl2,sl3,sl4,sl5,sl6,mc,xmc,lj,ywzw){ 
	
	$("#jj").html(ywzw+'趋势分析')
	var myChart=echarts.init(document.getElementById(id));
    myChart.dispose();
    myChart = echarts.init(document.getElementById(id));
	var option = {
             color:'#3c99f1', 
             tooltip: {
                 trigger: 'axis',
                 padding: [5, 10],
                 //backgroundColor: '#529bfb',
                 axisPointer: {            // 坐标轴指示器，坐标轴触发有效
                     type: 'line',        // 默认为直线，可选为：'line' | 'shadow'lineStyle: {
                     lineStyle: {
                         color: "#fdccaa",
                         type: 'dashed'
                     }
                 }
             },
             grid: {
            	 left: 75,
                 right: 45,
                 top: 80,
                 bottom: 120,
             },
		      legend: {
		    	  top: 40,
		            right: 42,
		            itemWidth: 18,
		            itemHeight: 8,
		    	  data: mc ,
		    	  textStyle:{fontSize:14}
		      },
		      /* toolbox: {
		          show: true,
		          feature: {
		              magicType: {show: true, type: ['stack', 'tiled']},
		              saveAsImage: {show: true}
		          }
		      }, */
		      xAxis: {
		    	   name: "日期",
		    	  axisTick: {
		                show: false
		            },
		            boundaryGap: false,
		            axisLine: {
		                show: true,
		                lineStyle: {
		                    color: "#9fa6b2"
		                }
		            },
		            splitLine: {
		                show: false,
		            },
		            
		          data: xmc
		      },
		      yAxis: [
		            {
		                type: 'value',
		                name: "数量",
		                nameTextStyle: {
		                    fontSize: 14,
		                    color: '#666666',
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
		                    areaStyle: {
		                        color: ["#ffffff", "#f6f8fb"]
		                    }
		                },
		                axisLabel: {
		                    fontSize: 14,
		                    color: '#666666'
		                },
		                 
		            }
		        ],
		        dataZoom: {
		            type: 'slider',
		            filterMode: 'empty',
		            borderColor: "#cdede2",
		            dataBackground: {
		                lineStyle: {
		                    color: '#79d0b3',
		                    width: 1,
		                },
		                areaStyle: {
		                    color: "#d0ede3"
		                }
		            },
		            fillerColor: "rgba(208,236,226,.3)",
		            handleStyle: {
		                color: "#d0ede3",
		                borderColor: "#10ac77"
		            },
		            bottom: 0,
		            top: 370,
		            start: 0,
		            end: 100
		        },
		      series: [
		              {
		             <c:forEach  var="mcpzList" items="${mcpzList}" varStatus="varStatus">
	                   <c:if test="${varStatus.count ==1}">
	                          name:"${mcpzList.mc}",
	                   </c:if>
	                </c:forEach>
	               	 type:'line',
	               	 
	               	 itemStyle: {
	                     color: '#3c99f1',
	                     barBorderRadius: [2,2,0,0]
	                 },
	                 areaStyle: {
	                     color: {
	                         x: 0,
	                         y: 1,
	                         x2: 0,
	                         y2: 0,
	                         colorStops: [{
	                             offset: 1, color: '#c6ddfc' // 0% 处的颜色
	                         }, {
	                             offset: 0, color: 'white' // 100% 处的颜色
	                         }],
	                         global: false // 缺省为 false
	                     }
	                 },
	                    data:sl1
		               },
		                
		      ]
  };
	 myChart.setOption(option);
}
function chart02(id,sl1,sl2,sl3,sl4,sl5,sl6,xmc,mc,wdzw, wdzw2,wdzw3,wdzw4,wdzw5,wdzw6, ywzw){ 
	var wdzwlist=new Array();
	var wdzwlist2=new Array();
	var wdzwlist3=new Array();
	var wdzwlist4=new Array();
	var wdzwlist5=new Array();
	var wdzwlist6=new Array();
	var wdzwAllList=new Array();
	
	
	for(var i=0;i<wdzw.length;i++){
	 if( wdzw[i]!=null){
		 wdzwlist.push(wdzw[i])
	  } 
    }
	 for(var i=0;i<wdzw2.length;i++){
		 if( wdzw2[i]!=null){
			 wdzwlist2.push(wdzw2[i])
		  } 
	    }
	
	for(var i=0;i<wdzw3.length;i++){
		 if( wdzw3[i]!=null){
			 wdzwlist3.push(wdzw3[i])
		  } 
	    }
	
	for(var i=0;i<wdzw4.length;i++){
		 if( wdzw4[i]!=null){
			 wdzwlist4.push(wdzw4[i])
		  } 
	    }
	
	for(var i=0;i<wdzw5.length;i++){
		 if( wdzw5[i]!=null){
			 wdzwlist5.push(wdzw5[i])
		  } 
	    }
	
	for(var i=0;i<wdzw6.length;i++){
		 if( wdzw6[i]!=null){
			 wdzwlist6.push(wdzw6[i])
		  } 
	    }
	
	wdzwAllList.push(wdzwlist[0]);
	wdzwAllList.push(wdzwlist2[0]);
	wdzwAllList.push(wdzwlist3[0]);
	wdzwAllList.push(wdzwlist4[0]);
	wdzwAllList.push(wdzwlist5[0]);
	wdzwAllList.push(wdzwlist5[0]);

	var myChart=echarts.init(document.getElementById(id));
    myChart.dispose();
    myChart = echarts.init(document.getElementById(id));
    option = {
            color:'#3c99f1', 
            tooltip: {
                trigger: 'axis',
                padding: [5, 10],
                //backgroundColor: '#529bfb',
                axisPointer: {            // 坐标轴指示器，坐标轴触发有效
                    type: 'line',        // 默认为直线，可选为：'line' | 'shadow'lineStyle: {
                    lineStyle: {
                        color: "#fdccaa",
                        type: 'dashed'
                    }
                }
            },
            grid: {
                left: 35,
                right: 45,
                top: 80,
                bottom: 120,
            },
		      legend: {
		    	  top: 40,
		            right: 42,
		            itemWidth: 18,
		            itemHeight: 8,
		    	  data: wdzwAllList ,
		    	  textStyle:{fontSize:14}
		      },
		      /* toolbox: {
		          show: true,
		          feature: {
		              magicType: {show: true, type: ['stack', 'tiled']},
		              saveAsImage: {show: true}
		          }
		      }, */
		      xAxis: {
		    	  name: "日期", 
		    	  axisTick: {
		                show: false
		            },
		            boundaryGap: false,
		            axisLine: {
		                show: true,
		                lineStyle: {
		                    color: "#9fa6b2"
		                }
		            },
		            splitLine: {
		                show: false,
		            },
		          data: xmc
		      },
		      yAxis: [
		            {
		                type: 'value',
		                name: "数量",
		                nameTextStyle: {
		                    fontSize: 14,
		                    color: '#666666',
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
		                    areaStyle: {
		                        color: ["#ffffff", "#f6f8fb"]
		                    }
		                },
		                axisLabel: {
		                    fontSize: 14,
		                    color: '#666666'
		                },
		                 
		            }
		        ],
		        dataZoom: {
		            type: 'slider',
		            filterMode: 'empty',
		            borderColor: "#cdede2",
		            dataBackground: {
		                lineStyle: {
		                    color: '#79d0b3',
		                    width: 1,
		                },
		                areaStyle: {
		                    color: "#d0ede3"
		                }
		            },
		            fillerColor: "rgba(208,236,226,.3)",
		            handleStyle: {
		                color: "#d0ede3",
		                borderColor: "#10ac77"
		            },
		            bottom: 0,
		            top: 370,
		            start: 0,
		            end: 100
		        },
		      series: [
		    	  {
		    	  name:wdzwAllList[0],
	               	 type:'line',
	               	 itemStyle: {
	                     color: '#3c99f1',
	                     barBorderRadius: [2,2,0,0]
	                 },
	                 areaStyle: {
	                     color: {
	                         x: 0,
	                         y: 1,
	                         x2: 0,
	                         y2: 0,
	                         colorStops: [{
	                             offset: 1, color: '#c6ddfc' // 0% 处的颜色
	                         }, {
	                             offset: 0, color: 'white' // 100% 处的颜色
	                         }],
	                         global: false // 缺省为 false
	                     }
	                 },
	                    data:sl1
		               },
		                
		      ]
 };
	 myChart.setOption(option);

		       
}
function getechatsdata(kssj,jssj,jgdm,lj,wdtj){
	 
    $.ajax({
    	url: "${ctx}/xxxQsfx/xxxQsfx.json?p_ywbz="+'${ywbz}'+'&p_yxbz='+'${yxbz}'
    			  +'&p_kssj='+kssj
    			  +"&p_jssj="+jssj
    			  +"&p_jgdm="+jgdm
    			  +"&p_tjsjwd=0"
    			  +"&p_wdtj="+wdtj,
    			
    			
    			
    	 datatype:"json",
    	context: document.body, 
    	success: function(data){
    		   var nodes=eval(data);
    		var hh= JSON.stringify(nodes);
    		 var xx=JSON.parse(hh);
    		 var fianl=xx.xxxlist;
    		 var fian2=xx.mcpzList;
    		 var fian3=xx.mcpz;
    		 var xmc=new Array();//X轴名称
    		 var sl1=new Array();
    		 var sl2=new Array();
    		 var sl3=new Array();
    		 var sl4=new Array();
    		 var sl5=new Array();
         	 var sl6=new Array();
         	 var mc=new Array();
         	 var mc2=new Array();
         	var ywzw=new Array();
         	 var ii=0;
         	 var jj=0;
         	 
        	          
        	 for (var j=0;j<fian2.length;j++){
    			 mc2[j]=fian2[j].mc;
    			 ywzw=fian2[0].ywzw
        	 }  
    			 
        	          
    		 for (var j=0;j<fian3.length;j++){
    			 mc[j]=fian3[j].mc;
    		 }
    		  
    		 for (var i=0;i<fianl.length;i++) {
    			jj=i+1;
    			xmc[i]=fianl[i].rq;
		         	 sl1[i]=fianl[i].sl1;
		         	 sl2[i]=fianl[i].sl2; 
		         	 sl3[i]=fianl[i].sl3;
		         	 sl4[i]=fianl[i].sl4; 
		         	 sl5[i]=fianl[i].sl5;
		         	 sl6[i]=fianl[i].sl6; 
		         }  
    		 chart01('chart02',sl1,sl2,sl3,sl4,sl5,sl6,mc2,xmc,lj,ywzw); 
    		}
    }
      	);
    }



function getechatsdata2(kssj,jssj,jgdm,lj,wdtj){ 

	 
    $.ajax({
    	url: "${ctx}/xxxQsfx/xxxQsfx.json?p_ywbz="+'${ywbz}'+'&p_yxbz='+'${yxbz}'
    			  +'&p_kssj='+kssj
    			  +"&p_jssj="+jssj
    			  +"&p_jgdm="+jgdm
    			  +"&p_tjsjwd=0"
    			  +"&p_wdtj="+wdtj,
    			
    			
    			
    	 datatype:"json",
    	context: document.body, 
    	success: function(data){
    		 var nodes=eval(data);
    		 var hh= JSON.stringify(nodes);
    		 var xx=JSON.parse(hh);
    		 var fianl=xx.yyyList;
    		 var xmc=new Array();//X轴名称
    		 var mc=new Array();//X轴名称
    		 var sl1=new Array();
    		 var sl2=new Array();
    		 var sl3=new Array();
    		 var sl4=new Array();
    		 var sl5=new Array();
    		 var sl6=new Array();
    		 
    		 var wdzw=new Array();
    		 var wdzw2=new Array();
    		 var wdzw3=new Array();
    		 var wdzw4=new Array();
    		 var wdzw5=new Array();
    		 var wdzw6=new Array();
    		 
             var ywzw =new Array();
         	 
        	
    		  
    		 for (var i=0;i<fianl.length;i++) {
    			 mc[i]=fianl[i].mc;
    			 xmc[i]=fianl[i].rq;
		         sl1[i]=fianl[i].sl1;
		         sl2[i]=fianl[i].sl2;
		         sl3[i]=fianl[i].sl3;
		         sl4[i]=fianl[i].sl4;
		         sl5[i]=fianl[i].sl5;
		         sl6[i]=fianl[i].sl6;
		         
		         wdzw[i]=fianl[i].wdzw;
		         wdzw2[i]=fianl[i].wdzw2;
		         wdzw3[i]=fianl[i].wdzw3;
		         wdzw4[i]=fianl[i].wdzw4;
		         wdzw5[i]=fianl[i].wdzw5;
		         wdzw6[i]=fianl[i].wdzw6;
		         
		         ywzw[i]=fianl[i].ywzw;  
		         }  
    		 chart02('chart02',sl1,sl2,sl3,sl4,sl5,sl6,xmc,mc,wdzw, wdzw2,wdzw3,wdzw4,wdzw5,wdzw6, ywzw); 
    		}
    }
      	);
    }


function getData(){
	
	   var kssj=$("#kssj").val();
	   var jssj=$("#jssj").val();
	   
	  var jgdm=$("#yljgdm").val();
	  if(jgdm=="" ||jgdm==null){
		  jgdm='${jgdm}'  
	  }
	  var lj='${lj}' 
	  if(jssj<kssj){
		  alert("选择的结束时间请大于或等于开始时间")
		  return;
	  }
	  
	  var wdtj=$("#wdtj").val();
	 getechatsdata(kssj,jssj,jgdm,lj,wdtj); 
    }
    
    
function getData2(){
	
	   var kssj=$("#kssj").val();
	   var jssj=$("#jssj").val();
	   
	  var jgdm=$("#yljgdm").val();
	  if(jgdm=="" ||jgdm==null){
		  jgdm='${jgdm}'  
	  }
	  var lj='${lj}' 
	  if(jssj<kssj){
		  alert("选择的结束时间请大于或等于开始时间")
		  return;
	  }
	  
	  var wdtj=$("#wdtj").val();
	 
	 getechatsdata2(kssj,jssj,jgdm,lj,wdtj); 
    }
     $(document).ready(function(){
		
		 if($("#wdtj").val()==''||$("#wdtj").val()==null||$("#wdtj").val()=='yljgdm'){ 
		        getData()
		        }else {
		        	getData2()
		        }
		sjxz();
	});
		
	function search() {
		
		 if($("#wdtj").val()==''||$("#wdtj").val()==null||$("#wdtj").val()=='yljgdm'){ 
          getData()
        }else {
        	getData2()
        }
        
    }
	
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
			$("#kssj").val('${kssj}'.substr(0,7));
			$("#jssj").val('${jssj}'.substr(0,7));
			document.getElementById("kssj").onclick = function(){
				WdatePicker({dateFmt:'yyyy-MM'});
				};
			document.getElementById("jssj").onclick = function(){
				WdatePicker({dateFmt:'yyyy-MM'});
					};
			} else if(id=='day'){
			 $("#kssj").val('${kssj}');
			$("#jssj").val('${jssj}');
		document.getElementById("kssj").onclick = function(){
			WdatePicker({dateFmt:'yyyy-MM-dd'})
			};
		document.getElementById("jssj").onclick = function(){
			WdatePicker({dateFmt:'yyyy-MM-dd'})
				};
		}else{
			$("#kssj").val('${kssj}');
			$("#jssj").val('${jssj}');
			document.getElementById("kssj").onclick = function(){
				WdatePicker({dateFmt:'yyyy-MM-dd'})
				};
			document.getElementById("jssj").onclick = function(){
				WdatePicker({dateFmt:'yyyy-MM-dd'})
					};
			
		}
		 
	}
	
	function zxfz(){
		var jgdm=$("#yljgdm").val();
		  if(jgdm=="" ||jgdm==null){
			  jgdm='${jgdm}'  
		  }
		window.location.href="${ctx}/xxx/xxx?p_ywbz="+'${ywbz }' 
				+"&p_yxbz=1&p_tjsjwd=0&p_jgdm="
	}
</script>
</head>
<body>
	<!-- 头部 start-->
	<div class="headBox"></div>
	<!-- 头部 end-->

	<div class="main mainTwo">
		<div class="top clearfix">
			<div class="topLeft">
				 
				 <span class="det">
          <span class="sj sjKs">
            <i class="n" onclick="sjxz('year')" >年</i>
            <i class="y" onclick="sjxz('month')">月</i>
            <i class="r active"  onclick="sjxz('day')">日</i>      
          </span>
          <span class="det" >
          <label for="">开始时间</label>
          <input type="text" id="kssj"
              readonly="readonly" onClick="" value="${kssj }" class="Wdate"
              style="width: 100px" />
          <div  style="position: absolute;margin-left:188px;margin-top: -28px;">
            <img src="<c:url value="/static/commons/images/topImg1.png"/>">
          </div>
          </span>
        </span> 
        <span class="det" style="margin-left: 5px;"> <label for="">结束时间</label>
          <input type="text" id="jssj" readonly="readonly" onClick=""
          value="${jssj }" class="Wdate" style="width: 100px" />
          <div style="position: absolute; margin-left: 188px; margin-top: -28px;">
            <img src="<c:url value="/static/commons/images/topImg1.png"/>">
          </div>
        </span>
				<c:if test="${ywbz != 'QYJG' && ywbz != 'YJJJ'}">
				<span class="det" style="margin-left: 30px;">
					<label for="">机构名称</label>
					<select id="yljgdm" name="yljgdm" lay-search>
							<option value="">医疗机构</option>
							<c:forEach items="${jgList}" var="jg">
								<option value="${jg.jgdm}">${jg.jgmc}</option>
							</c:forEach>
					</select>
					</span>
				</c:if>
				<span class="det detLast" >
					<label for="">维度统计</label>
					<select id="wdtj" name="wdtj" lay-search>
						<option value="">维度统计</option>
						<c:forEach items="${wdtjList}" var="wdtj">
							<option value="${wdtj.wdyw}">${wdtj.wdmc}</option>
						</c:forEach>
				</select>
				</span>
			</div>
			<div class="topRight">
				<button class="btn1" style="cursor: pointer;" onclick="search();">查询</button>
				<button class="btn2" style="cursor: pointer;" onclick="zxfz();">纵向比较</button>
			</div>
		</div>
		<div class="bot">
			<div class="title clearfix">
				<div class="titLeft">
					<img src="<c:url value="/static/commons/images/botImg1.png"/>" >
					<label id='jj' for=""></label>
				</div>
				 
			</div>
			<div class="botCon">
				<div class="chartBox">
					<div class="chart02" id="chart02">

					</div>
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