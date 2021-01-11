<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/commons/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
<title>数据分析</title>
<%@ include file="/commons/meta.jsp"%>
 <link rel="stylesheet" type="text/css" 
   href="<c:url value="/static/commons/css/reset2.css"/>" />
   <link rel="stylesheet" type="text/css" 
   href="<c:url value="/static/commons/css/index2.css"/>" />
	<script type="text/javascript"
	src="<c:url value="/static/commons/js/jquery2-1.11.1.min.js"/>"></script>
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
function chart01(id){ 
	
	 
	 
    var myChart = echarts.init(document.getElementById(id));
    myChart.dispose();
    myChart = echarts.init(document.getElementById(id));
    var option = {  
            

            tooltip: {
                trigger: 'axis', 
                padding: [8, 10], 
                backgroundColor: "#ffe3cf",
                borderColor: "#ffc197",
                borderWidth: 1,
                textStyle: {
                    color: "#df5f12"
                },
                axisPointer: {            // 坐标轴指示器，坐标轴触发有效
                    type: 'line',       // 默认为直线，可选为：'line' | 'shadow'
                    lineStyle: {
                        color: "#fdccaa",
                        type: 'dashed'
                    }
                }
            },
            
             toolbox: {
                show: true,
                right:20,
                top:-8,
                feature: {
                    dataView: {
                        readOnly: false,
                        icon:"image://<c:url value="/static/commons/images/text.png"/>"
                    },
                    magicType: {
                        type: ['line', 'bar'],
                        icon:{
                            line :"image://<c:url value="/static/commons/images/text2.png"/>",
                            bar :"image://<c:url value="/static/commons/images/text3.png"/>"
                        }
                    },
                    restore: {
                    	 icon:"image://<c:url value="/static/commons/images/text4.png"/>"
                    },
                    saveAsImage: {
                    	 icon:"image://<c:url value="/static/commons/images/text5.png"/>"
                    }
                },
                itemSize:30,//工具栏 icon 的大小
                
            },
             grid: {
                left: 55,
                right: 70,
                top: 80,
                bottom: 40,
            },
            legend: {
            	 top: 40,
                 right: 0,
                 itemWidth: 14,
                 itemHeight: 14,
                 data: ['移动支付率']
            },
            xAxis:{
                name: "机构名称",
                nameLocation: "end",
                nameTextStyle: {
                    fontSize: 14,
                    color: '#999999',
                },
                axisTick: {
                    show: false
                },
                axisLine: {
                    show: true,
                    lineStyle: {
                        color: "#9fa6b2"
                    }
                },
                splitLine: {
                    show: false,
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
                data: ['胥口镇卫生院','光福镇卫生院','金庭镇中心卫生院','藏书卫生院','临湖镇卫生院','越溪街道社区卫生服务中心'],
            },
            yAxis: [
                {
                    type: 'value',
                    name: "移动支付率%",
                    max:100,
                    min:0,
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
            series: [
                 
                
                {
                	name: ['移动支付率'],
                   	 type:'bar',
                   	 barWidth: 26,
                     itemStyle: {
                         color: '#3c99f1',
                         barBorderRadius: [2,2,0,0]
                     },
                        data:['40','45','45','37','40','40']
                    }
            ]
            };
    myChart.setOption(option);
    }
 
 
    
	$(document).ready(function(){
		chart01('chart01')
	});
		
 
	 
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
	
</script>
</head>
<body>

<div class="headBox"></div>

<div class="main mainTwo">
	<div class="top clearfix">
       <div class="topLeft">
				 
	   <span class="det">
          <span class="sj sjKs">
            <i class="r "  onclick="sjxz('day')">当天 </i>  
            <i class="w" onclick="sjxz('week')" >本周</i>
            <i class="y" onclick="sjxz('month')">本月</i>  
            <i class="qb active" onclick="sjxz('all')">全部</i>    
          </span>
          <span class="det" >
          <label for="">开始时间</label>
          <input type="text" id="kssj"
              readonly="readonly" onClick="WdatePicker({dateFmt:'yyyy-MM-dd'})" value="" class="Wdate"
              style="width: 100px" />
          <div  style="position: absolute;margin-left:188px;margin-top: -28px;">
            <img src="<c:url value="/static/commons/images/topImg1.png"/>">
          </div>
          </span>
        </span> 
        <span class="det" style="margin-left: 5px;"> <label for="">结束时间</label>
          <input type="text" id="jssj" readonly="readonly" onClick="WdatePicker({dateFmt:'yyyy-MM-dd'})"
          value="" class="Wdate" style="width: 100px" />
          <div style="position: absolute; margin-left: 188px; margin-top: -28px;">
            <img src="<c:url value="/static/commons/images/topImg1.png"/>">
          </div>
        </span>
				 <c:if test="${ywbz != 'QYJG'&& ywbz != 'YJJJ'}">
				  <span class="det"     style="margin-left: 35px;">
					<label for="">机构名称</label>
					<select id="yljgdm" name="yljgdm" lay-search>
							<option value="">医疗机构</option>
							<c:forEach items="${jgList}" var="jg">
								<option value="${jg.jgdm}">${jg.jgmc}</option>
							</c:forEach>
					</select>
					</span>
				</c:if>
				 
			</div>
			<div class="topRight"  style="position: absolute;margin-left:1013px;">
				<button class="btn1" onclick="search();">查询</button>
				 
			</div>
		</div>	
	<div class="bot">
			 <div class="title clearfix">
				<div class="titLeft">
				<img src="<c:url value="/static/commons/images/botImg1.png"/>" >
					 <label id='jj'for=""></label>
					 <label id='zl'for=""></label>
				</div>
				   
			</div> 
			<div class="botCon">
				<div class="chartBox">
					<div style="width: 100%;"class="chart01" id="chart01">
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