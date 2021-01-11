<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/commons/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
<title>资金分析</title>
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
<%--实现jbox 导入jqueryjs--%>
<script type="text/javascript"
		src="<c:url value="/static/commons/js/jquery.jBox-2.3.min.js"/>"></script>
<script type="text/javascript"
		src="<c:url value="/static/commons/js/jquery.jBox-zh-CN.js"/>"></script>
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
/*页面初始化*/
$(document).ready(function(){
	 getData();	 
});
function search() {
	getData();		 
}
/*初始化加载日期*/
function getData(){
    var jgdm=$("#jgdm").val();
    if(jgdm=="" ||jgdm==null){
     jgdm='${jgdm}'  
   } 
    getEchartData(jgdm);
    }
/*ajax初始化加载所有数据*/
function getEchartData(jgdm){
    var kssj=$("#kssj").val();
    var jssj=$("#jssj").val();
    if(jssj<kssj){
   	 alert("选择的结束时间请大于或等于开始时间") ;
   	 return;
     }
     /*初始执行重定向sql*/
    /*机构柱状图*/
    $.ajax({
        url: "${ctx}/iaed/iaed.json?p_kssj="+kssj
        +"&p_jssj="+jssj
        +"&p_yljgdm="+jgdm
		+"&objectCode="+'',
        datatype:"json",
        context: document.body,
        success: function(data){
            var nodes=eval(data);
            var nodesJson= JSON.stringify(nodes);
            var resultJson=JSON.parse(nodesJson);
            var Chart01Json=resultJson.chart01List;//收入支出总额(chart01方法返回)
            var unitName=new Array();
            var unitCode=new Array();
            var sr=new Array();//收入
            var zc=new Array();//支出
			var index = 0;//确保收入支出数据index一致 保证index 0 都是一家医院，因为sql按照code排序4在前，5在后，所以当编号为5满足时说明一个机构循环结束
            for (var i=0;i<Chart01Json.length;i++) {
                if(Chart01Json[i].objectCode == '4'){//编码为4则为收入
                    sr[index]=Chart01Json[i].fee;
                }else if(Chart01Json[i].objectCode == '5'){//编码为5则为支出
                    zc[index]=Chart01Json[i].fee;
                    unitName[index]=Chart01Json[i].unitName;
                    unitCode[index]=Chart01Json[i].unitCode;
                    index = index+1;
                }
            }
            chart01('chart01',unitName,unitCode,sr,zc,kssj,jssj,'zh');
        }
    });
    //默认加载收入的明细数据
    getCicleChart01(jgdm,kssj,jssj,'');
    getCicleChart01_1(jgdm,kssj,jssj,'','4');
    getAreaChart01(jgdm,kssj,jssj,'','4');
    getAreaChart01_1(jgdm,kssj,jssj,'','4');

}
</script>
<%--ajax圆环图（右标签）getCicleChart01带function--%>
	<script type="text/javascript">
function getCicleChart01(yljgdm,kssj,jssj,yljgmc){
	 $.ajax({
	        url: "${ctx}/iaed/getCicleChart01.json?p_kssj="+kssj
	              +"&p_jssj="+jssj
	              +"&p_yljgdm="+yljgdm
				  +"&objectCode="+""
		          +"&objectLen="+1,
	         datatype:"json",
	        context: document.body,
	        success: function(data){
			   var nodes=eval(data);
			   var nodesJson= JSON.stringify(nodes);
			   var resultJson=JSON.parse(nodesJson);
			   var CicleChart01Json=resultJson.cicleChart01List;//收入支出总额(chart01方法返回)
                cicleChart01('cicleChart01',CicleChart01Json,yljgdm,yljgmc,kssj,jssj);
            }
	          });
}
</script>
<%--ajax圆环图2（右标签）getCicleChart01_1--%>
	<script type="text/javascript">
        function getCicleChart01_1(yljgdm,kssj,jssj,yljgmc,objectCode){
            $.ajax({
                url: "${ctx}/iaed/getCicleChart01.json?p_kssj="+kssj
                +"&p_jssj="+jssj
                +"&p_yljgdm="+yljgdm
                +"&objectCode="+objectCode
                +"&objectLen="+4,
                datatype:"json",
                context: document.body,
                success: function(data){
                    var nodes=eval(data);
                    var nodesJson= JSON.stringify(nodes);
                    var resultJson=JSON.parse(nodesJson);
                    var CicleChart01Json=resultJson.cicleChart01List;//收入支出总额(chart01方法返回)
                    cicleChart01_1('cicleChart01_1',CicleChart01Json,yljgdm,yljgmc,kssj,jssj);
                }
            });
        }
	</script>
<%--ajax面积图 getAreaChart01--%>
	<script type="text/javascript">
        function getAreaChart01(yljgdm,kssj,jssj,yljgmc,objectCode){
            $.ajax({
                url: "${ctx}/iaed/getAreaChart01.json?p_kssj="+kssj
                +"&p_jssj="+jssj
                +"&p_yljgdm="+yljgdm
                +"&objectCode="+objectCode
                +"&objectLen="+1,
                datatype:"json",
                context: document.body,
                success: function(data){
                    var nodes=eval(data);
                    var nodesJson= JSON.stringify(nodes);
                    var resultJson=JSON.parse(nodesJson);
                    var AreaChart01Json=resultJson.areaChart01List;//收入支出总额(chart01方法返回)
                    areaChart01('areaChart01',AreaChart01Json,yljgmc);
                }
            });
        }
	</script>
<%--ajax面积图2 getAreaChart01_1--%>
	<script type="text/javascript">
        function getAreaChart01_1(yljgdm,kssj,jssj,yljgmc,objectCode){
            $.ajax({
                url: "${ctx}/iaed/getAreaChart01.json?p_kssj="+kssj
                +"&p_jssj="+jssj
                +"&p_yljgdm="+yljgdm
                +"&objectCode="+objectCode
                +"&objectLen="+4,
                datatype:"json",
                context: document.body,
                success: function(data){
                    var nodes=eval(data);
                    var nodesJson= JSON.stringify(nodes);
                    var resultJson=JSON.parse(nodesJson);
                    var AreaChart01Json=resultJson.areaChart01List;//收入支出总额(chart01方法返回)
                    areaChart01_1('areaChart01_1',AreaChart01Json,yljgmc);
                }
            });
        }
	</script>
<%--柱状图chart01 --%>
	<script type="text/javascript">
        function chart01(id,yljgmc,yljgdm,rkypje,ckypje,kssj,jssj,name) {

            if(name=='zh'){
                var zckje1=0;
                var zrkje1=0;
                if(rkypje!=null){
                    for(var i=0;i<rkypje.length;i++){
                        zrkje1+=Number(rkypje[i])
                    }
                }
                if(ckypje!=null){
                    for(var i=0;i<ckypje.length;i++){
                        zckje1+=Number(ckypje[i])
                    }
                }
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
                        top: "2%",
                        itemGap: 15,
                        textStyle: {
                            color: "#333333",
                            fontSize: 12
                        },
                        data: [
                            {
                                name: "收入",
                            },
                            {
                                name: "支出",
                            }
                        ]
                    },
                    grid: {
                        containLabel: true,
                        top: '12%',
                        right: '4%',
                        left: '3%',
                        bottom: '12%'
                    },
                    yAxis: [{
                        name: '万元',
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
                            name: '收入',
                            type: 'bar',
                            barWidth: 24,
                            data: rkypje,
                            itemStyle: {
                                color: '#3AA874'
                            },
                            label: {
                                show: false,
                                position: 'top',
                                formatter: function (params) {
                                    return '{a|' + params.value + '万元}\n' + '{b|}'
                                },
                                rich: {
                                    a: {
                                        backgroundColor: 'rgba(102, 166, 76, .6)',
                                        padding: [3, 6, 6, 6],
                                        borderRadius: 2,
                                        color: '#FFFFFF',
                                        fontSize: 12
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
                        },
                        {
                            name: '支出',
                            type: 'bar',
                            barWidth: 24,
                            data: ckypje,
                            itemStyle: {
                                color: '#5892F3'
                            },
                            label: {
                                show: false,
                                position: 'top',
                                formatter: function (params) {
                                    return '{a|' + params.value + '万元}\n' + '{b|}'
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
                myChart.setOption(option);
                myChart.on('click', function(params) {
                    //点击柱状图出发收入支出环状图
                    getCicleChart01(yljgdm[params.dataIndex],kssj,jssj,yljgmc[params.dataIndex])
                });
                return myChart
            }else{
                var zckje2=0;
                var zrkje2=0;
                if(rkypje!=null){
                    for(var i=0;i<ckypje.length;i++){
                        zrkje2+=Number(rkypje[i])
                    }
                }
                if(ckypje!=null){
                    for(var i=0;i<rkypje.length;i++){
                        zckje2+=Number(ckypje[i])
                    }
                }

                $("#id1").html('');
                $("#id2").html('');
                $("#id3").html('');
                $("#id1").html('基层医院');
                $("#id2").html(zrkje2.toFixed(2));
                $("#id3").html(zckje2.toFixed(2));


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
                        top: "2%",
                        itemGap: 15,
                        textStyle: {
                            color: "#333333",
                            fontSize: 12
                        },
                        data: [
                            {
                                name: "收入",
                            },
                            {
                                name: "支出",
                            }
                        ]
                    },
                    grid: {
                        containLabel: true,
                        top: '12%',
                        right: '4%',
                        left: '3%',
                        bottom: '12%'
                    },
                    yAxis: [{
                        name: '万元',
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
                            name: '收入',
                            type: 'bar',
                            barWidth: 24,
                            data: rkypje,
                            itemStyle: {
                                color: '#3AA874'
                            },
                            label: {
                                show: false,
                                position: 'top',
                                formatter: function (params) {
                                    return '{a|' + params.value + '万元}\n' + '{b|}'
                                },
                                rich: {
                                    a: {
                                        backgroundColor: 'rgba(102, 166, 76, .6)',
                                        padding: [3, 6, 6, 6],
                                        borderRadius: 2,
                                        color: '#FFFFFF',
                                        fontSize: 12
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
                        },
                        {
                            name: '支出',
                            type: 'bar',
                            barWidth: 24,
                            data: ckypje,
                            itemStyle: {
                                color: '#5892F3'
                            },
                            label: {
                                show: false,
                                position: 'top',
                                formatter: function (params) {
                                    return '{a|' + params.value + '万元}\n' + '{b|}'
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
                myChart.setOption(option);
                myChart.on('click', function(params) {

                    getchart03(yljgdm[params.dataIndex],kssj,jssj,yljgmc[params.dataIndex]);
                });
                return myChart
            }
        };
	</script>
<%--圆环图cicleChart01--%>
	<script type="text/javascript">
        function cicleChart01(id,fian3,yljgdm,yljgmc,kssj,jssj) {
            $('#legend').html("");
            var datas = [];
            var datass = [];
            var datasss = [];

            for (var i = 0; i < fian3.length; i++) {
                datas.push({
                    name:fian3[i].objectName
                })
                datass.push({
                    name:fian3[i].objectName,
                    value:fian3[i].fee,
                    yljgdm:yljgdm,
                    yljgmc:yljgmc,
                    objectCode:fian3[i].objectCode,
                    objectName:fian3[i].objectName
                })
                $('#legend').append("<li class='li0"+(i+1)+"'"+"><i></i> <label "+"id='"+ 'id'+(i+1)+"'"+" for=''></label> <span></span> </li>");
                $('#id' + (i+1)).html('');
                $('#id' + (i+1)).html(fian3[i].objectName);
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
                        name: '收入支出分析',
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
                                    return '{a|' + params.name + '}\n' + params.value + '{b|万元}'
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
            myChart.on('click', function(params) {
                //点击柱状图出发收入支出环状图
                getAreaChart01(params.data.yljgdm,kssj,jssj,params.data.yljgmc,params.data.objectCode);
                //点击柱状图出发收入支出环状图
                getCicleChart01_1(params.data.yljgdm,kssj,jssj,params.data.yljg,params.data.objectCode)
            });
            return myChart
        };
	</script>
<%--圆环图2cicleChart01_1--%>
	<script type="text/javascript">
        function cicleChart01_1(id,fian3,yljgdm,yljgmc,kssj,jssj) {
            $('#legend2').html("");
            var datas = [];
            var datass = [];
            var datasss = [];

            for (var i = 0; i < fian3.length; i++) {
                datas.push({
                    name:fian3[i].objectName
                })
                datass.push({
                    name:fian3[i].objectName,
                    value:fian3[i].fee,
                    yljgdm:yljgdm,
                    yljgmc:yljgmc,
                    objectCode:fian3[i].objectCode,
                    objectName:fian3[i].objectName
                })
                // 新增标签legend2
                //重复使用id+num 标签重复
                //class li01->li0n 代表不同颜色
                $('#legend2').append("<li class='li0"+(i+1)+"'"+"><i></i> <label "+"id='"+ 'idlegend2'+(i+1)+"'"+" for=''></label> <span></span> </li>");
                $('#idlegend2' + (i+1)).html('');
                $('#idlegend2' + (i+1)).html(fian3[i].objectName);
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
                        name: '收入支出分析',
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
                                    return '{a|' + params.name + '}\n' + params.value + '{b|万元}'
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
            myChart.on('click', function(params) {
                //点击柱状图出发收入支出环状图
                getAreaChart01_1(params.data.yljgdm,kssj,jssj,params.data.yljgmc,params.data.objectCode);
            });
            return myChart
        };
	</script>
<%--面积图areaChart01--%>
	<script type="text/javascript">
        function areaChart01(id,fian1) {
            var datass=[];
            for (var i = 0; i < fian1.length; i++) {
                datass.push({
                    name:fian1[i].searchDate,
                    value:fian1[i].fee
                })
            }
            var objectName = fian1[0].objectName;
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
                            name: objectName,
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
                        name: objectName,
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
            //页面弹窗 此js不触发
            myChart.on('click', function(params) {
                /*页面跳转*/
                <%--window.open("${ctx}/bass/bassKsxz?p_kssj="+$("#kssj").val()--%>
                <%--+"&p_jssj="+$("#jssj").val()+"&p_jgdm="+$("#jgdm").val()--%>
                <%--/*+yljgdm[params.dataIndex]*/--%>
                <%--);--%>
                /*页面重载*/
                <%--window.location.href="${ctx}/bass/bassKsxz?p_kssj="+$("#kssj").val()--%>
                <%--+"&p_jssj="+$("#jssj").val()+"&p_jgdm="+$("#jgdm").val();--%>
                /*跳转iFrame*/
                // $.jBox.open("iframe:" + url + "", "弹出款的标题",弹出框的长, 弹出框的高, { buttons: {'关闭': true}})
                <%--$.jBox.open("iframe:" + "${ctx}/bass/bassKsxz?p_kssj="+$("#kssj").val()+"&p_jssj="+$("#jssj").val()+"&p_jgdm="+$("#jgdm").val()+ "", "弹出款的标题",1500, 500,{ buttons: {'关闭': true}})--%>
            });
            return myChart
        };
	</script>
<%--面积图2areaChart01--%>
	<script type="text/javascript">
        function areaChart01_1(id,fian1) {
            var datass=[];
            for (var i = 0; i < fian1.length; i++) {
                datass.push({
                    name:fian1[i].searchDate,
                    value:fian1[i].fee
                })
            }
            var objectName = fian1[0].objectName;
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
                            name: objectName,
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
                        name: objectName,
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
            //页面弹窗
            myChart.on('click', function(params) {
                console.log(params);
                /*页面跳转*/
                <%--window.open("${ctx}/bass/bassKsxz?p_kssj="+$("#kssj").val()--%>
                <%--+"&p_jssj="+$("#jssj").val()+"&p_jgdm="+$("#jgdm").val()--%>
                <%--/*+yljgdm[params.dataIndex]*/--%>
                <%--);--%>
                /*页面重载*/
                <%--window.location.href="${ctx}/bass/bassKsxz?p_kssj="+$("#kssj").val()--%>
                <%--+"&p_jssj="+$("#jssj").val()+"&p_jgdm="+$("#jgdm").val();--%>
                /*跳转iFrame*/
                // $.jBox.open("iframe:" + url + "", "弹出款的标题",弹出框的长, 弹出框的高, { buttons: {'关闭': true}})
                $.jBox.open("iframe:" + "${ctx}/iaed/getDetail?p_kssj="+$("#kssj").val()+"&p_jssj="+$("#jssj").val()+"&p_jgdm="+$("#jgdm").val()+"&objectLen="+4+"&objectCode="+params.data.objectCode,"弹出款的标题",1500, 500,{ buttons: {'关闭': true}})
            });
            return myChart
        };
	</script>
</head>
<%--页面主体--%>
<body>
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
				<%--公立医院收入支出分析chart01 mode03一行一个 --%>
				<li class="mode mode03">
                    <div class="modeBg">
                        <div class="modeTop">
                            <div class="title">
                                <i></i> <label for="">公立医院收入支出分析</label>
                            </div>
                        </div>
                        <div class="modeCon">
                            <div class="chartBox" id="chart01"></div>
                        </div>
                        <div class="modeCon" style="display: none;">
                            <div class="chartBox" id="reschart01"></div>
                        </div>
                    </div>
                </li>
				<%--收入支出分析cicleChart01 mode02一行两个，带饼状图参数 legendClass --%>
				<li class="mode mode02">
						<div class="modeBg">
							<div class="modeTop">
								<div class="title">
									<i></i>
									<label for="">收入支出分析</label>
								</div>
							</div>
							<div class="modeCon">
								<div class="chartBox" id="cicleChart01"></div>
								<ul class="legend" id='legend'>
								</ul>
							</div>
						</div>
					</li>
				<%--收入支出趋势分析areaChart01 mode01一行两个 不带饼状图参数 --%>
				<li class="mode mode01">
                    <div class="modeBg">
                        <div class="modeTop">
                            <div class="title clearfix">
                                <i></i>
                                <label for="">收入支出趋势分析</label>
                            </div>
                        </div>
                        <div class="modeCon">
                            <div class="chartBox" id="areaChart01"></div>
                        </div>
                    </div>
                </li>
				<%--一级科目收入支出分析chart04 mode02一行两个 带饼状图参数 --%>
				<li class="mode mode02">
					<div class="modeBg">
						<div class="modeTop">
							<div class="title">
								<i></i>
								<label for="">一级科目收入支出分析</label>
							</div>
						</div>
						<div class="modeCon">
							<div class="chartBox" id="cicleChart01_1"></div>
							<ul class="legend" id='legend2'></ul>
						</div>
					</div>
				</li>
				<%--一级科目收入支出趋势分析chart05 mode01一行两个 不带饼状图参数 --%>
				<li class="mode mode01">
					<div class="modeBg">
						<div class="modeTop">
							<div class="title">
								<i></i> <label for="">一级科目收入支出趋势分析</label>
							</div>
						</div>
						<div class="modeCon">
							<div class="chartBox" id="areaChart01_1"></div>
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