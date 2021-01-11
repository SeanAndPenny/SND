<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/commons/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
<title>人口占比</title>

	
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
	src="<c:url value="/static/commons/js/My97DatePicker/WdatePicker.js"/>"></script>
	


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
		html,body{
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
function chart03(id,sl1,mc,mcdm,bl,jddm){ 
	$("#id1").html('');
	$("#id2").html('');
	$("#id3").html('');
	$("#id4").html(''); 
	
$("#id1").html(sl1[1]);
$("#id2").html(bl[1]);
$("#id3").html(sl1[0]);
$("#id4").html(bl[0]); 
	var myChart=echarts.init(document.getElementById(id));
    myChart.dispose();
    myChart = echarts.init(document.getElementById(id));
	var option = {
	        tooltip: {
	            trigger: 'item',
	            formatter: "{a} <br/>{b}: {c} ({d}%)"
	        },
	        legend: {
	            orient: 'vertical',
	            right: '10%',
	            bottom: 40,
	            itemHeight: 8,
	            itemWidth: 8,
	            itemGap: 15,
	            textStyle: {
	                color: "#666666",
	                fontSiz: 14
	            },
	            data: [
	                {
	                    name: "户籍人口",
	                    icon: "circle"
	                },

	                {
	                    name: "流动人口",
	                    icon: "circle"
	                }
	            ]
	        },
	        series: [
	            {
	                name: '全员人口',
	                type: 'pie',
	                radius: ['32%', '47%'],
	                center: ['37%', '46%'],
	                avoidLabelOverlap: true,
	                hoverOffset: 5,
	                startAngle: 90,
	                itemStyle: {
	                    borderColor: '#fff',
	                    borderWidth: 2,
	                },
	                label: {
	                    show: false,
	                    fontSize: 14,
	                    formatter: function (params) {
	                        return "{a|" + params.data.name + "}" + "{b|" + params.data.value +  "}"+"{c|人" + "}" + "\n" + params.data.value
	                    },
	                    lineHeight: 18,
	                    rich: {
	                        a: {
	                            color: "#666666",
	                            fontSize: 14
	                        },
	                        b: {
	                            color: "#21a1fa",
	                            fontSize: 14
	                        },
	                        c:{
	                            color: "#666666",
	                            fontSize: 14
	                        }
	                    }
	                },
	                emphasis: {
	                    label: {
	                        show: true,
	                        fontSize: 14,
	                        formatter: function (params) {
	                            var sum = params.data.value2 + params.data.value1;
	                            var zb = params.data.value/sum*100;
	                            return "{b|● " + "}" + "{a|" + params.data.name + "}" + "{b|" + params.data.value + "}"+"{c|人" + "}" + "\n" + "{a|占比：" + "}" + "{b|" + zb.toFixed(3) + "}"+"{c|%" + "}"
	                        },
	                        lineHeight: 18,
	                        rich: {
	                            a: {
	                                color: "#666666",
	                                fontSize: 14
	                            },
	                            b: {
	                                color: "#21a1fa",
	                                fontSize: 14
	                            },
	                            c:{
	                                color: "#666666",
	                                fontSize: 14
	                            },
	                        }
	                    },
	                },
	                labelLine: {
	                    show: true,
	                    length: 18,
	                    length2: 20,
	                    lineStyle: {
	                        color: '#374f67',
	                    }
	                },
	                data: [
	                    {
	                        name: "户籍人口",
	                        value: parseInt(sl1[1]),
	                        value1: parseInt(sl1[0]),
	                        value2: parseInt(sl1[1]),
	                        itemStyle: {
	                            color: "#26c2ca"
	                        }
	                    },

	                    {
	                        name: "流动人口",
	                        value: parseInt(sl1[0]),
	                        value1: parseInt(sl1[0]),
	                        value2: parseInt(sl1[1]),
	                        itemStyle: {
	                            color: "#35a6ed"
	                        }
	                    }
	                ]
	            }]
		};
	  myChart.setOption(option);
	  myChart.dispatchAction({
          type: 'highlight',
          dataIndex: 0,
      });
      //离开其中一个模块高亮取消，默认第一块高亮
      myChart.on("mouseout", function (params) {
          console.log(params);
          myChart.dispatchAction({
              type: 'downplay',
              dataIndex: params.dataIndex,
          });
          myChart.dispatchAction({
              type: 'highlight',
              dataIndex: 0,
          });
      });
      //鼠标移入此模块高亮，之前的模块高亮取消
      myChart.on("mouseover", function (params) {
        myChart.dispatchAction({
              type: 'highlight',
              dataIndex: params.dataIndex,
          });
        myChart.dispatchAction({
              type: 'downplay',
              dataIndex: params.dataIndex == 0 ? 1 : 0,
          });
      });
	  myChart.on('click',function(param) {	
		   
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
	  )
}
function chart04(id,zrk,hjrk,hjdm,ldrk,lddm,yljgmc,zrkzb,hjrkzb,ldrkzb,yljgdm){ 
	 
	var myChart=echarts.init(document.getElementById(id));
    myChart.dispose();
    myChart = echarts.init(document.getElementById(id));
	var option = { 
			title: {
		        text: '人口占比分析', 
		    },
			tooltip : {
        		trigger: 'axis',
        		axisPointer : {            // 坐标轴指示器，坐标轴触发有效
            		type : 'shadow',        // 默认为直线，可选为：'line' | 'shadow'
            		
        		},
        		formatter: function(params){
        			
        			var str = "";
        			var zrkItem = null;
        			var hjrkItem = null;
        			var ldrkItem = null; 
        			var mcs = null;
        			
        			params.forEach(function(item,idx){
        				if (item.seriesName==='总人口') {
        					zrkItem = item;
        				}
        				if (item.seriesName==='户籍人口') {
        					hjrkItem = item;
        				}
        				if (item.seriesName==='流动人口') {
        					ldrkItem = item;
        				}
        				 console.log(item)
        				mcs=item;
        				 
        			});
        			str += mcs.name+":"+"<br>";
        			str += zrkItem.marker+zrkItem.seriesName+":"+zrkItem.data+"("+zrkzb[zrkItem.dataIndex]+"%)"+"<br>";
        			str += hjrkItem.marker+hjrkItem.seriesName+":"+hjrkItem.data+"("+hjrkzb[hjrkItem.dataIndex]+"%)"+"<br>";
        			str += ldrkItem.marker+ldrkItem.seriesName+":"+ldrkItem.data+"("+ldrkzb[ldrkItem.dataIndex]+"%)"+"<br>";
        			return str;
        			
        		}
   			},
   			color:['#26c2ca','#35a6ed','#99FF99','#FF7744','#FFFF00','#CC0000'],
   			legend: [
   				{
   	            data: ['总人口', '户籍人口','流动人口']
   	           },
   	             {  top: '20',
      	            data: ['总人口占比','户籍人口占比','流动人口占比']
      	           },
   			],
   	     	toolbox: {
	   	    	x:'85%',
	   	        show : true,
	   	        feature : { 
	   	            saveAsImage : {show: true}
	   	        }
	   	    },
		   	 axisLabel: {  
                 interval: 0,  
                 formatter:function(value)  
                 {  
                     var ret = "";//拼接加\n返回的类目项  
                     var maxLength = 3;//每项显示文字个数  
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
             yAxis : [  
            	    {type:'value',name:''},
            	    {type:'value',name:'数量'},
                      ],
             xAxis : [
					         {
					             type : 'category',name:'乡镇',
					             data : yljgmc
					         }
				     	 ],
		     	series :[
						 
		     		
						{
							name:'户籍人口',
							type:'bar',
							stack: 'two',
							yAxisIndex:1,
							 itemStyle: {
				                    borderColor: '#fff',
				                    borderWidth: 2,
				                },
							barWidth:20,
							data:hjrk
						},
						{
							name:'流动人口',
							type:'bar',
							stack: 'two',
							yAxisIndex:1,
							 itemStyle: {
				                    borderColor: '#fff',
				                    borderWidth: 2,
				                },
							barWidth:20,
							data:ldrk
						},
						{
							name:'总人口',
							type:'bar',
							yAxisIndex:1,
							stack: 'two',
							 itemStyle: {
				                    borderColor: '#fff',
				                    borderWidth: 2,
				                },
							barWidth:20,
							data:zrk
						},
						  
						], 	
		};
	  myChart.setOption(option);
	 
      
}

function chart05(id,erqList,yrqList,xlqqList,xlqList,qcqList,qnqList,znqList,lnqList,kssj,jssj,jgdm){ 
 
     
	var myChart=echarts.init(document.getElementById(id));
    myChart.dispose();
    myChart = echarts.init(document.getElementById(id)); 
	var option = { 
			 title: {
	              text: '年龄段分析', 
	              
	               
	          }, 
	          
	          color:['#0000FF', '#00adf4', '#57c5a2', '#86cb68',
	              '#f7a932', '#ee7a8d', '#9884f3', '#6288d1',
	              '#066fd8', '#87ceeb', '#32cd32' ],
		    legend: {
		    	x: '100px' 
		          },
		    tooltip: {},
		    dataset: {
		        source: [
		            ['product', '2012', '2013', '2014', '2015', '2016', '2017'],
		            erqList,yrqList,xlqqList,xlqList,qcqList,qnqList,znqList,lnqList
		            
		        ]
		    },
		    series: [{
		    	name:'总人口',
		        type: 'pie',
		        radius: 60,
		        center: ['25%', '45%'],
		        labelLine: {
                    normal: {
                        show: true,
                        length:5,
                        length2:5
                    }
                },
		        // No encode specified, by default, it is '2012'.
		    }, {
		    	name:'户籍人口',
		        type: 'pie',
		        radius: 60,
		        center: ['65%', '45%'],
		        encode: {
		            itemName: 'product',
		            value: '2013'
		        },
		        labelLine: {
                    normal: {
                        show: true,
                        length:5,
                        length2:5
                    }
                },
		        
		    }, {
		    	name:'流动人口',
		        type: 'pie',
		        radius: 60,
		        center: ['25%', '85%'],
		        encode: {
		            itemName: 'product',
		            value: '2014'
		        },
		        labelLine: {
                    normal: {
                        show: true,
                        length:5,
                        length2:5
                    }
                },
		    } ]
		};
	   

	  myChart.setOption(option);
	  myChart.on('click', function(params) {  
		   echarsnldld(params.data[4],params.seriesIndex,kssj,jssj,jgdm,params.seriesName,params.name);//ecahrs年龄段联动
	      });
	 
      
}
function chart06(id,hjnlsl,ldnlsl,znlsl,nl){ 
	var myChart=echarts.init(document.getElementById(id));
    myChart.dispose();
    myChart = echarts.init(document.getElementById(id));
	var option = {
			 title: {
	              text: '年龄分析', 
	          }, 
	           
			legend: {
	             data: ['总人口', '户籍人口','流动人口']
	          },
	          tooltip : {
	        		trigger: 'axis',
	        		axisPointer : {            // 坐标轴指示器，坐标轴触发有效
	            	type : 'shadow',        // 默认为直线，可选为：'line' | 'shadow'
	            
	        		},
	        		formatter: function(params){
	        			var str = "";
	        			var zrkItem = null;
	        			var hjrkItem = null;
	        			var ldrkItem = null;
	        			var mcs=null;
	        			console.log(params)
	        			params.forEach(function(item,idx){
	        				if (item.seriesName==='总人口') {
	        					zrkItem = item;
	        				}
	        				if (item.seriesName==='户籍人口') {
	        					hjrkItem = item;
	        				}
	        				if (item.seriesName==='流动人口') {
	        					ldrkItem = item;
	        				}
	        				mcs=item; 
	        			});
	        			str +=mcs.name+"<br>";
	        			str += zrkItem.marker+zrkItem.seriesName+":"+zrkItem.data+"<br>";
	        			str += hjrkItem.marker+hjrkItem.seriesName+":"+hjrkItem.data+"<br>";
	        			str += ldrkItem.marker+ldrkItem.seriesName+":"+ldrkItem.data+"<br>";
	        			
	        			
	        			
	        			
	        			return str;
	        			
	        		}
	   			},
	   			grid: {
	                left: '3%',
	                right: '4%',
	                bottom: '3%',
	                containLabel: true
	            },
	            toolbox: {
	                feature: {
	                    saveAsImage: {}
	                }
	            },
			 xAxis: {
				 type: 'category',
	              boundaryGap: false,
	              name:'年龄',
	              data: nl ,
	              axisLabel:{
	            	  rotate:60
	              }
			    },
			    yAxis: {
			        type: 'value'
			    },
			    series: [
		             
		              {
		            	  name: '户籍人口', 
		                  data: hjnlsl,
		                  type: 'line',
		                  showBackground: true,
		                  backgroundStyle: {
		                      color: 'rgba(220, 220, 220, 0.8)'
		                  },
		                  itemStyle: {
	                           color: '#26c2ca',
	                          
	                       }
		              },
		              {
		            	  name: '流动人口', 
		                  data: ldnlsl,
		                  type: 'line',
		                  showBackground: true,
		                  backgroundStyle: {
		                      color: 'rgba(220, 220, 220, 0.8)'
		                  },
		                  itemStyle: {
	                           color: '#33FF33',
	                           
	                       }
		              }, {
		            	  name: '总人口',
		                  data: znlsl,
		                  
		                  type: 'line',
		                  showBackground: true,
		                  backgroundStyle: {
		                      color: 'rgba(220, 220, 220, 0.8)'
		                  },
		                  itemStyle: {
	                           color: '#99FF99',
	                          
	                       }
		                   
		              },
		               
		          ] 
		};
	  myChart.setOption(option);
	 
      
}


function chart07(id,sl1,pcsmc,bl1,series,name){ 
	 
	var myChart=echarts.init(document.getElementById(id));
    myChart.dispose();
    myChart = echarts.init(document.getElementById(id));
	var option = {  
			tooltip : {
        		trigger: 'axis',
        		axisPointer : {            // 坐标轴指示器，坐标轴触发有效
            		type : 'shadow',        // 默认为直线，可选为：'line' | 'shadow'
        		},
formatter: function(params){
        			
        			var str = "";
        			var zrkItem = null;
        			var hjrkItem = null;
        			var ldrkItem = null; 
        			var mcs = null;
        			
        			params.forEach(function(item,idx){
        				
        				 console.log(item)
        				mcs=item;
        				 
        			});
        			str += mcs.name+"<br>";
        			str += mcs.seriesName+":"+mcs.value+"人;"+"占比:"+bl1[mcs.dataIndex]+"%"+"<br>";
        			return str;
        			
        		}
        		 
   			},
   			color:['#26c2ca','#35a6ed','#99FF99','#FF7744','#FFFF00','#CC0000'],
   			 
   	     	toolbox: {
	   	    	x:'85%',
	   	        show : true,
	   	        feature : { 
	   	            saveAsImage : {show: true}
	   	        }
	   	    },
		   	 axisLabel: {  
                 interval: 0,  
                 formatter:function(value)  
                 {  
                     var ret = "";//拼接加\n返回的类目项  
                     var maxLength = 3;//每项显示文字个数  
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
             yAxis : [  
            	    {type:'value',name:''},
            	    {type:'value',name:'数量'},
                      ],
             xAxis : [
					         {
					             type : 'category',name:'乡镇',
					             data : pcsmc
					         }
				     	 ],
		     	series :[
						 
		     		
						{
							name:name+';'+series,
							type:'bar',
							stack: 'two',
							yAxisIndex:1,
							 itemStyle: {
				                    borderColor: '#fff',
				                    borderWidth: 2,
				                },
							barWidth:20,
							data:sl1
						},
						 
						/* {
							name:name+';'+series+'占比',
							type:'line',
							yAxisIndex:0,
							
							data:bl1
						},  */
						  
						], 	
		};
	  myChart.setOption(option);
	 
      
}
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
         	
         	
         	  
         	  var erqList=xx.erqList;
         	  var yrqList=xx.yrqList;
         	  var xlqqList=xx.xlqqList;
         	  var xlqList=xx.xlqList;
         	  var qcqList=xx.qcqList;
         	  var qnqList=xx.qnqList;
         	  var znqList=xx.znqList;
         	  var lnqList=xx.lnqList;
         	  
         	 
         	chart03('chart03',sl1,mc,mcdm,bl,jddm); 
         	chart04('chart04',zrk,hjrk,hjdm,ldrk,lddm,yljgmc,zrkzb,hjrkzb,ldrkzb,yljgdm); 
         	chart05('chart05',erqList,yrqList,xlqqList,xlqList,qcqList,qnqList,znqList,lnqList,kssj,jssj,jddm); 
         	chart06('chart06',hjnlsl,ldnlsl,znlsl,nl); 
         	
    		}
    	
      	});
	
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
	       	chart07('chart07',sl1,pcsmc,bl1,series,name); 
	  		}
	    	});
	
}

function getData(){
	   var kssj=$("#kssj").val();
	   var jssj=$("#jssj").val();
	  var jddm=$("#jddm").val();
	  
	  if(jddm=="" ||jddm==null){
		  jddm='${jgdm}'  
	  } 
	  if(jssj<kssj){
		  alert("选择的结束时间请大于或等于开始时间")
		  return;
	  }
	 getechatsdata(kssj,jssj,jddm); 
	 echarsnldld('28~40','0',kssj,jssj,jddm,'总人口','青年期');
    }
    
    
	$(document).ready(function(){
		 getData();	 
	});
		
	function search() {
		getData();		 
    }
	 
</script>
</head>
<body>
	<!-- 头部 start-->
	<div class="headBox"></div>
	<!-- 头部 end-->

	<div class="main mainThree">
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
              readonly="readonly" onClick="WdatePicker({dateFmt:'yyyy-MM-dd'})" 
              value="" class="Wdate"
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
					
				<span class="det detLast" style="margin-left: 150px;">
					<label for="">乡镇名称</label>
					<select id="jddm" name="jddm" lay-search>
						<option value="">全区</option>
						<c:forEach items="${jdList}" var="jg">
							<option value="${jg.jgdm}">${jg.jgmc}</option>
						</c:forEach>
				    </select>
				</span>
			</div>
			<div class="topRight">
				<button class="btn1" onclick="search();">查询</button>
			</div>
		</div>
		<div class="bot clearfix">
			<div class="botLeft">
				<div class="chartBox">
					<div class="chart03" id="chart03">

					</div>
				</div>
			</div>
			<div class="botRight">
				<div class="same">
					 
					<img src="<c:url value="/static/commons/images/twoImg1.png"/>">
					<span class="sameFont">
						<div class="title">
							<i></i>
							<label for="">户籍人口</label>
						</div>
						<div class="con">
							<p>数量：<span id='id1'></span>人</p>
							<p>占比：<span id='id2'></span>%</p>
						</div>
					</span>
				</div>
				<div class="same sameDiff">
					<img src="<c:url value="/static/commons/images/twoImg2.png"/>">
					<span class="sameFont">
						<div class="title">
							<i></i>
							<label for="">流动人口</label>
						</div>
						<div class="con">
							<p>数量：<span id='id3'></span>人</p>
							<p>占比：<span id='id4'></span>%</p>
						</div>
					</span>
				</div>
			</div>
		</div>
		<div id="chart04" style="width: 100%; height:400px;background:#FFFFFF;margin-top:15px;"></div> 
        <div style="width:100%;height:380px">
        	<div id="chart05" style="width: 45%; height:400px;background:#FFFFFF;float:left"></div>
        	<div id="chart07" style="width: 55%; height:400px;background:#FFFFFF;float:left"></div>
        </div>  
        <div id="chart06" style="width:50%; height:380px;background:#FFFFFF;margin-top:90px;"></div> 
        <div style="position: absolute;margin-top: -417px;margin-left: 110px;">
        <span  style="font-size:15px; color:#ff0000;font-weight: bold;" class="name">*</span> 
        <span>备注:婴儿期:0~3岁;幼儿期:3~5岁;学龄前期:5~7岁;学龄期:7~18岁;青春期:18~28岁;青年期:28~40岁;中年期:40~65岁;老年期:65~120岁</span></div>
        <div style="color:red ;position: absolute;margin-top:-777px;margin-left: 106px;"><span>点击饼图,可查看详细</span></div>
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