<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/commons/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
<title>药品出入库分析</title>


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
	   
		var kssj=$("#kssj").val();
	    var jssj=$("#jssj").val();
	    var jgdm=$("#jgdm").val();
	       if(jgdm=="" ||jgdm==null){
	        jgdm='${jgdm}'   
	        	ybEchars('zh');  
	      } else{
	    	  $.ajax({
			      url: "${ctx}/ypcrk/ypcrjglxk.json?p_jgdm="+jgdm,    
			       datatype:"json",
			      context: document.body, 
			      success: function(data){
			         var nodes=eval(data);
			         var hh= JSON.stringify(nodes);
			         var xx=JSON.parse(hh); 
			         var fian=xx.jglx; 
			         if(fian=='AA'){
			        	 ybEchars('jc');   
			         }else{
			        	 ybEchars('zh');    
			         }
			        }
			        });
	      }
	    if(jssj<kssj){
	  	  alert('请选择的结束时间大于或大于开始时间')
	  	return   
	    }

    getchart03(jgdm,kssj,jssj,'');	
    }
function ybEchars(id){
	 
	if(id=='zh'){
		$("#top1").attr("class","ss");
		  $("#top0").attr("class","active");
		var kssj=$("#kssj").val();
	    var jssj=$("#jssj").val();
	    if(jssj<kssj){
	  	  alert('请选择的结束时间大于或大于开始时间')
	  	return   
	    }
	    var jgdm=$("#jgdm").val();
	       if(jgdm=="" ||jgdm==null){
	        jgdm='${jgdm}'  
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
	         for (var i=0;i<fianl.length;i++) { 
	      	   yljgmc[i]=fianl[i].yljgmc;
	      	   yljgdm[i]=fianl[i].yljgdm;
	      	   rkypje[i]=fianl[i].rkypje; 
	      	   ckypje[i]=fianl[i].ckypje; 
	      	   
	            }
	           chart01('chart01',yljgmc,yljgdm,rkypje,ckypje,kssj,jssj,id); 　 
	        }
	        });
	 	
	}else{
		 var jgdm=$("#jgdm").val();
	       if(jgdm=="" ||jgdm==null){
	        jgdm='${jgdm}'  
	      } 
		 $("#top0").attr("class","ss");
		  $("#top1").attr("class","active");
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
	         var fian2=xx.jcypjeList;//基层药品出入库金额
	         var yljgmc2=new Array();
	         var yljgdm2=new Array();
	         var rkypje2=new Array();
	         var ckypje2=new Array(); 
	         for (var i=0;i<fian2.length;i++) { 
	      	   yljgmc2[i]=fian2[i].yljgmc;
	      	   yljgdm2[i]=fian2[i].yljgdm;
	      	   rkypje2[i]=fian2[i].rkypje; 
	      	   ckypje2[i]=fian2[i].ckypje; 
	      	  
	            }  
	           chart01('chart01', yljgmc2,yljgdm2,rkypje2,ckypje2,kssj,jssj,id); 
	          
	        }
	        });
	   
	}
    
}
 
</script>
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
			
			$("#id1").html('');
			$("#id2").html('');
			$("#id3").html('');
			$("#id1").html('综合医院');
			$("#id2").html(zrkje1.toFixed(2));
			$("#id3").html(zckje1.toFixed(2));
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
		                    name: "入库药品金额",
		                },
		                {
		                    name: "出库药品金额",
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
		                name: '入库药品金额',
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
		                name: '出库药品金额',
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
		                    name: "入库药品金额",
		                },
		                {
		                    name: "出库药品金额",
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
		                name: '入库药品金额',
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
		                name: '出库药品金额',
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
<script type="text/javascript">
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
         
         
         
         
        //chart02('chart02',rkypmc,rkypje,yljgmc,ypbm,kssj,jssj,jgdm,fian3);  
        //chart04('chart04',ckypje,ckypmc,yljgmc,ypbm4,kssj,jssj,jgdm);
        chart02('chart02',zs,ypbm5,ypmc5,kssj,jssj,jgdm,fian5);
        chart03('chart03',rkypmc,rkypje,yljgmc,ypbm,kssj,jssj,jgdm,fian3);  
        chart03cf('chart03cf',ckypje,ckypmc,yljgmc,ypbm4,kssj,jssj,jgdm,fian4);
        }
        });
}
</script>
<script type="text/javascript">
function chart02(id,zs,ypbm,ypmc,kssj,jssj,jgdm,fian) {
	$('#legend01').html(""); 
	 var max = [];
	 if(zs!=null){
		 for(var i = 0; i < zs.length; i++){
		    	max.push(Math.abs(parseInt(zs[i])));
		    };	 
	 }
	 var data=[];
	 var itemStyle=[];
	 var label=[];
	 for (var i = 0; i < fian.length; i++) { 
$('#legend01').append('<li><span class="icon"></span> <span class="name">'+fian[i].ypmc.substring(0, 4) + '....'+'</span><span class="line"></span></li> ');
//$('#dw').append('<li><span class="icon"></span> <span class="name">'+fian[i].dw +'</span><span class="line"></span></li> ');
		 
		 if(fian[i].zs<0){
			 data.push({
			      name:fian[i].ypmc,
			      value:(Math.abs(fian[i].zs)), 
			      name1:fian[i].dw,
			      itemStyle:{
	                  color:'#F7B764'
	              },
	              label:{
	                  color:'#F7B764'
	              }  	  
			    })  
		 }else{
			 data.push({
			      name:fian[i].ypmc,
			      value:(Math.abs(fian[i].zs)),   
			      name1:fian[i].dw,
			    }) 
		 }
		
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
        grid: {
            containLabel: true,
            top: '8%',
            right: '9%',
            left: 5,
            bottom: '6%'
        },
        legend: {
            show:false,
            itemWidth: 12,
            itemHeight: 12,
            data: ['数量'],
            top: '0',
            right: '8%'
        },
        yAxis: [
            {
                type: "category",
                axisLabel: {
                    show:false,
                    color: '#333333',
                    interval: 0,
                    textStyle: {
                        fontSize: 12
                    }, 
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
                data: ypmc.reverse(),
                splitArea: {
                    show: false
                },
            }],
        xAxis: [{
            type: 'value',
            show : false,  
              }],
        series: [
            {
                name: '数量',
                type: 'bar',
                data: data .reverse(),
                barWidth: 13,
                itemStyle: {
                  color: '#88CA6D'
                },
                label: {
                    show: true,
                    position:'right',
                    color:'#88CA6D',
                    fontSize:14,
                    formatter:function(params){
                    	 
                        return params.value+params.data.name1
                        
                    }  
                      
                }
            },
            {
                name: '',
                type: 'bar',
                data: max,
                barWidth: 13,
                barGap: '-100%',
                itemStyle: {
                    color: 'rgba(153, 123, 230, 0.1)'
                },
                tooltip: {
                    show: false
                }
            },
        ]
    };
    myChart.setOption(option);
    myChart.on('click', function(params) { 
    	 
    	window.open(
    			 "${ctx}/ypcrk/gettables5?p_jgdm="+jgdm
	            +"&p_ypbm="+ypbm[params.dataIndex]
    			 +"&p_kssj="+kssj
    			 +"&p_jssj="+jssj ,
    			 "_blank",
    			 "top=300,left=300,width=800,height=500,menubar=no,toolbar=no,status=no,scrollbars=yes"
    			);
    	 
  
    });
    return myChart
};
</script>
<script type="text/javascript">
function chart03(id,rkypmc,rkypje,yljgmc,ypbm,kssj,jssj,jgdm,fian) {
	$('#legend02').html(""); 
    var myChart = echarts.init(document.getElementById(id));
    var data = [];
    for (var i = 0; i < fian.length; i++) {
    	  data.push({
    	      name:fian[i].rkypmc,
    	      value:fian[i].rkypje
    	    })	
    	    $('#legend02').append('<li><span class="icon">'+(i+1)+'</span><span class="name">'+fian[i].rkypmc.substring(0, 4) + '..'+'</span><span class="line"></span></li>'); 	   
    }
  
    var max=[];
   
    for(var i=0;i<data.length;i++){
        max.push({value:data[i].value,value1:data[i].value})
        
    };
     
      var option = {
        tooltip: {
            trigger: 'axis',
            axisPointer: {
                type: 'shadow'
            }
        },
        grid: {
            containLabel: true,
            top: '3%',
            right: '22%',
            left: 5,
            bottom: '8%'
        },
        legend: {
            show:false,
            itemWidth: 12,
            itemHeight: 12,
            data: ['金额'],
            top: '0',
            right: '8%'
        },
        yAxis: [
            {
                type: "category",
                axisLabel: {
                    show:false,
                    color: '#333333',
                    interval: 0,
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
                data: rkypmc,
                splitArea: {
                    show: false
                },
                inverse:true
            }
           ],
        xAxis: [{
            type: 'value',
            nameGap: 7,
            nameTextStyle: {
                color: '#646464',
                fontSize: 14
            },
            axisLine: {
                show: true,
                lineStyle:{
                    color:'#D6D6D6'
                }
            },
            axisTick: {
                show: false
            },
            axisLabel: {
                show:false,
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
                name: '金额',
                type: 'bar',
                data: data,
                barWidth: 13,
                itemStyle: {
                  color: '#30A9FF'
                },
                label: {
                    show: false,
                    position:'right',
                    color:'#88CA6D',
                    fontSize:14,
                    formatter:function(params){
                        return params.value
                    }
                }
            },
            {
                name: '',
                type: 'bar',
                data: max,
                barWidth: 13,
                barGap: '-100%',
                itemStyle: {
                    color: 'rgba(90, 184, 235, 0.1)'
                },
                label:{
                    show:true,
                    position:'right',
                    /* formatter:function(params){
                        return "{a| "+(params.data.value1/10000).toFixed(2)+"}"+"{b|万}"
                    }, */
                    rich:{
                        a:{
                            color:'#0BACFF',
                            fontSize:16
                        },
                        b:{
                            color:'#333',
                            fontSize:16
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
};
function chart03cf(id,ckypje,ckypmc,yljgmc,ypbm4,kssj,jssj,jgdm,fian) {
    var myChart = echarts.init(document.getElementById(id));
    $('#legend03').html(""); 
    var myChart = echarts.init(document.getElementById(id));
    var data = [];
    for (var i = 0; i < fian.length; i++) {
    	  data.push({
    	      name:fian[i].ckypmc,
    	      value:fian[i].ckypje
    	    })	
    	    $('#legend03').append('<li><span class="icon">'+(i+1)+'</span><span class="name">'+fian[i].ckypmc.substring(0, 4)+ '....'+'</span><span class="line"></span></li>'); 	   
    }
  
    var max=[];
    for(var i=0;i<data.length;i++){
        max.push({value:data[i].value,value1:data[i].value})
    };
    
    var option = {
        tooltip: {
            trigger: 'axis',
            axisPointer: {
                type: 'shadow'
            }
        },
        grid: {
            containLabel: true,
            top: '3%',
            right: '22%',
            left: 5,
            bottom: '8%'
        },
        legend: {
            show:false,
            itemWidth: 12,
            itemHeight: 12,
            data: ['金额'],
            top: '0',
            right: '8%'
        },
        yAxis: [
            {
                type: "category",
                axisLabel: {
                    show:false,
                    color: '#333333',
                    interval: 0,
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
                data: ckypmc,
                splitArea: {
                    show: false
                },
                inverse:true
            }],
        xAxis: [{
            type: 'value',
            nameGap: 7,
            nameTextStyle: {
                color: '#646464',
                fontSize: 14
            },
            axisLine: {
                show: true,
                lineStyle:{
                    color:'#D6D6D6'
                }
            },
            axisTick: {
                show: false
            },
            axisLabel: {
                show:false,
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
                name: '金额',
                type: 'bar',
                data: data,
                barWidth: 13,
                itemStyle: {
                  color: '#30A9FF'
                },
                label: {
                    show: false,
                    position:'right',
                    color:'#88CA6D',
                    fontSize:14,
                    formatter:function(params){
                        return params.value
                    }
                }
            },
            {
                name: '',
                type: 'bar',
                data: max,
                barWidth: 13,
                barGap: '-100%',
                itemStyle: {
                    color: 'rgba(90, 184, 235, 0.1)'
                },
                label:{
                    show:true,
                    position:'right',
                    /* formatter:function(params){
                        return "{a| "+(params.data.value1/10000).toFixed(2)+"}"+"{b|万}"
                    }, */
                    rich:{
                        a:{
                            color:'#0BACFF',
                            fontSize:16
                        },
                        b:{
                            color:'#333',
                            fontSize:16
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
				</span> <span class="det detLast" style="margin-left: 34px;"> <label
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
				<button style="cursor: pointer;" class="btn1" onclick="search();">查询</button>
			</div>
		</div>
		<body>

			<div class="main drugFx ypcrk">
				<div class="botCon">
					<ul class="detail clearfix">
						<li class="mode leftLi">
							<div class="mode mode01">
								<div class="modeBg">
									<div class="modeTop">
										<div class="title">
											<i></i> <label for="">药品费用统计</label>
											<div class="msg-box">
												<div class="left-name" id='id1'></div>
												<ul class="list">
													<li><span class="name">入库金额</span> <span
														class="num-box"> <span class="num num-sty1"
															id='id2'></span> <span class="unit">万元</span>
													</span></li>
													<li><span class="name">出库金额</span> <span
														class="num-box"> <span class="num num-sty2"
															id='id3'></span> <span class="unit">万元</span>
													</span></li>
												</ul>
											</div>
											<div class="tabTop">
												<span class="ss" id="top1" onclick='ybEchars("jc")'>基层医院</span>
											</div>
											<div class="tabTop">
												<span class="active" id="top0" onclick='ybEchars("zh")'>综合医院</span>

											</div>
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
							<div class="mode mode02">
								<div class="modeBg">
									<div class="modeTop">
										<div class="title">
											<i></i> <label for="">沉淀库存数量(不含期初数)</label>
											<div class="legend">
												<span class="name sp01"><i></i><label for="">库存数量净减</label></span>
												<span class="name sp02"><i></i><label for="">库存数量净增</label></span>
											</div>
											<!-- <div class="btn"><span class="text">查看详情</span><img src="images/more.png"></div> -->
										</div>
									</div>
									<div class="modeCon">
										<ul class="left-list" id="legend01"></ul>
										<div style='margin-left: -74px;' class="chartBox" id="chart02"></div>
										<!-- <ul id="dw">单位</ul> -->
										 
										
										
									</div>
								</div>
							</div>
						</li>
						<li class="mode mode03">
							<div class="modeBg">
								<div class="modeTop">
									<div class="title clearfix">
										<i></i> <label for="">库存TOP20药品金额列表(万元)</label>
										<div class="legend">
											<span class="name sp01"><i></i><label for="">金额</label></span>
										</div>
										<div class="tabTop">
											<span class="active">入库</span> <span>出库</span>
										</div>
									</div>
								</div>
								<div class="modeCon">
									<ul class="left-list" id='legend02'></ul>
									<div class="chartBox" id="chart03"></div>
								</div>
								<div class="modeCon" id='modeCon' style="display: none;">
									<ul class="left-list" id='legend03'></ul>
									<div class="chartBox" id="chart03cf"></div>
								</div>

							</div>
						</li>
					</ul>
				</div>
			</div>

		</body>
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
    
   
    var chartInit03 = chart03('chart03','','','','','','','','');  
    var chartInit03cf = chart03cf('chart03cf','','','','','','','',''); 
   
    $(".modeTop .title .tabTop span").click(function () {
        $(this).addClass("active").siblings("span").removeClass("active");
        $(this).parents(".mode").find(".modeCon").eq($(this).index()).show().siblings(".modeCon").hide();
        chartInit03.resize(); 
        chartInit03cf.resize(); 
    });
    $(window).resize(function () {
        chartInit03.resize();  
       chartInit03cf.resize();  
    });
});
</script>
 
</html>