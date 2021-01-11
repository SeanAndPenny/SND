<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/commons/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
<title>医保分析</title>
<script type="text/javascript"
	src="<c:url value="/static/layui/layui.js"/>"></script>
<link rel="stylesheet" type="text/css"
	href="<c:url value="/static/layui/css/layui.css"/>" />
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

$(document).ready(function(){
     getData();
     sjxz();
    
  });

function search() {
    getData(); 
    document.getElementById("char").style.display='none';
    document.getElementById("idname").style.display='none';
    document.getElementById("chartjbgx").style.display='none';
    
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
     	 alert("选择的结束时间请大于或等于开始时间") ;
     	 return;
       }
      $.ajax({
        url: "${ctx}/ybfytj/ybfytj.json?p_kssj="+kssj
              +"&p_jssj="+jssj
              +"&p_yljgdm="+jgdm,    
         datatype:"json",
        context: document.body, 
        success: function(data){
           var nodes=eval(data);
           var hh= JSON.stringify(nodes);
           var xx=JSON.parse(hh);
           var fianl=xx.ybfytjList;
           var qylx=new Array();
           var qylxmc=new Array();
            
           for (var i=0;i<fianl.length;i++) { 
        	   qylx[i]=fianl[i].qylx; 
        	   qylxmc[i]=fianl[i].qylxmc;
              } 
            
           
             chart01('chart01',qylx,fianl,kssj,jssj,jgdm,qylxmc); 
             
             
          }
          });
      getechars02('',kssj,jssj,jgdm);
  }

function chart01(id,qylx,fianl,kssj,jssj,jgdm,qylxmc){ 
	
	  var datas = [];
	  var datass = [];
	  for (var i = 0; i < fianl.length; i++) {
	    datas.push({
	      name:fianl[i].qylxmc
	    })
	    datass.push({
	      name:fianl[i].qylxmc,
	      value:fianl[i].rs
	    })
	  }
	 
	  var myChart=echarts.init(document.getElementById(id));
	    myChart.dispose();
	    myChart = echarts.init(document.getElementById(id));
	    option = { 
	    title: {
            text: '区域类型分析',  
        },
        tooltip: {
            trigger: 'item',
            formatter: '{a} <br/>{b}: {c}人 ({d}%)'
        },
    color : [ '#188df0', '#DD228F', '#7cb5ec', '#f6ae6e',
      '#adff2f', '#444446', '#799aec', '#61d4e2',
      '#6b8e23', '#87ceeb', '#b8860b', '#32cd32' ],
         legend: {
             orient: 'vertical',
             x:'left',      //可设定图例在左、右、居中
             y:'center', 
             itemHeight: 7,
             itemWidth: 7,
             
             width: '100%',
             height: 200,
             bottom: 20,
             data: datas
         },
         series: [
             {
                 name: '区域类型:',
                 type: 'pie',
                 radius: ['48%', '59%'],
                 avoidLabelOverlap: false,
                 label: {
                     show: false,
                     
                 },
                 center:['60%','50%'],
                 emphasis: {
                     label: {
                         show: true,
                         fontSize: '30',
                         fontWeight: 'bold'
                     }
                 },
                 labelLine: {
                     show: false
                 },
                 data: datass
             }
         ] 
	      };

	    myChart.setOption(option); 
	    myChart.on('click', function(params) { 
	    	  document.getElementById("chartjbgx").style.display='none';
	    	document.getElementById("char").style.display='none';
	        document.getElementById("idname").style.display='none';
	   getechars02(qylx[params.dataIndex],kssj,jssj,jgdm,qylxmc[params.dataIndex]);
	            });   
}

function getechars02(qylx,kssj,jssj,jgdm,qylxmc){ 
	 
    $.ajax({
      url: "${ctx}/ybfytj/getechars02.json?p_kssj="+kssj
            +"&p_jssj="+jssj
            +"&p_jgdm="+jgdm
            +"&p_qylx="+qylx,    
       datatype:"json",
      context: document.body, 
      success: function(data){
         var nodes=eval(data);
         var hh= JSON.stringify(nodes);
         var xx=JSON.parse(hh);
         var fian2=xx.getechars02List; 
         var jglx=new Array(); 
         var jglxmc=new Array();
         var ylje2=new Array();
         for (var i=0;i<fian2.length;i++) { 
        	 jglxmc[i]=fian2[i].jglxmc;
        	 jglx[i]=fian2[i].jglx; 
        	 ylje2[i]=fian2[i].ylje; 
             }
         chart02('chart02',jglx,fian2,kssj,jssj,jgdm,qylx,qylxmc,jglxmc,ylje2)
           
        }
        });
}
function chart02(id,jglx,fian2,kssj,jssj,jgdm,qylx,qylxmc,jglxmc,ylje){ 
   var cbje=0;
   for(var i=0;i<ylje.length;i++){
	   cbje+=Number(ylje[i]);
   } 
	if(typeof qylxmc==='undefined'){
		qylxmc='参保';
	}
	
	  var myChart=echarts.init(document.getElementById(id));
	    myChart.dispose();
	    myChart = echarts.init(document.getElementById(id)); 
		  var datas = [];
		  var datass = [];
		  for (var i = 0; i < fian2.length; i++) {
		    datas.push({
		      name:fian2[i].jglxmc
		    })
		    datass.push({
		      name:fian2[i].jglxmc,
		      value:fian2[i].rs
		    })
		  }
	  var option = { title: {
          text: qylxmc+'机构类型分析',  
      },
      tooltip: {
          trigger: 'item',
          formatter: function (params) {
                            
                         return params.data.name + ":" 
                           + "共" + params.data.value + "人"
                           + "(占比" + params.percent + "%)"
                           +"<br/>"
                           + "金额:" + ylje[params.dataIndex] + "元"
                            	 + "(占比:" + ((Number(ylje[params.dataIndex])/cbje)*100).toFixed(3) + "%)"
                         },
      },
  color : [ '#188df0', '#DD228F', '#7cb5ec', '#f6ae6e',
    '#adff2f', '#444446', '#799aec', '#61d4e2',
    '#6b8e23', '#87ceeb', '#b8860b', '#32cd32' ],
       legend: {
           orient: 'vertical',
           x:'left',      //可设定图例在左、右、居中
           y:'center', 
           itemHeight: 7,
           itemWidth: 7,
           
           width: '100%',
           height: 200,
           bottom: 20,
           data: datas
       },
       series: [
           {
               name: '参保机构类型:',
               type: 'pie',
               radius: ['48%', '59%'],
               avoidLabelOverlap: false,
               label: {
                   show: false,
                   
               },
               center:['60%','50%'],
               emphasis: {
                   label: {
                       show: true,
                       fontSize: '30',
                       fontWeight: 'bold'
                   }
               },
               labelLine: {
                   show: false
               },
               data: datass
           }
       ] 
	    };
	    myChart.setOption(option);  
	    myChart.on('click', function(params) { 
	    	document.getElementById("chartjbgx").style.display='';
	        document.getElementById("idname").style.display='none';
	       
	 	   getechars03(jglx[params.dataIndex],qylx,kssj,jssj,jgdm,qylxmc,jglxmc[params.dataIndex],'');
	 	   getecharsjbfx(jglx[params.dataIndex],qylx,kssj,jssj,jgdm,qylxmc,jglxmc[params.dataIndex]) ;
	 	    
	    }); 
	} 
	
function getecharsjbfx(jglx,qylx,kssj,jssj,jgdm,qylxmc,jglxmc){
	 
	  $.ajax({
    url: "${ctx}/ybfytj/getecharsjbfx.json?p_kssj="+kssj
          +"&p_jssj="+jssj
          +"&p_jgdm="+jgdm
          +"&p_jglx="+jglx
          +"&p_qylx="+qylx,    
     datatype:"json",
    context: document.body, 
    success: function(data){
       var nodes=eval(data);
       var hh= JSON.stringify(nodes);
       var xx=JSON.parse(hh);
       var fian3=xx.getecharsjbfxList; 
       
       var rs=new Array();
       var ylje=new Array();
       var yljgjb=new Array();
       var yljgjbdm=new Array();
       
       
       
      for (var i=0;i<fian3.length;i++) { 
      	 rs[i]=fian3[i].rs; 
      	ylje[i]=fian3[i].ylje;
      	yljgjb[i]=fian3[i].yljgjb; 
      	yljgjbdm[i]=fian3[i].yljgjbdm;
        }
       
      chartjbgx('chartjbgx',jglx,fian3,kssj,jssj,jgdm,qylx,qylxmc,jglxmc,ylje,yljgjb,yljgjbdm); 
         
      }
      });
	  
}

	
function chartjbgx(id,jglx,fian2,kssj,jssj,jgdm,qylx,qylxmc,jglxmc,ylje,yljgjb,yljgjbdm){ 
	 
	   var cbje=0;
	   for(var i=0;i<ylje.length;i++){
		   cbje+=Number(ylje[i]);
	   } 
		if(typeof qylxmc==='undefined'){
			qylxmc='参保';
		}
		
		  var myChart=echarts.init(document.getElementById(id));
		    myChart.dispose();
		    myChart = echarts.init(document.getElementById(id)); 
			  var datas = [];
			  var datass = [];
			  for (var i = 0; i < fian2.length; i++) {
			    datas.push({
			      name:fian2[i].yljgjb
			    })
			    datass.push({
			      name:fian2[i].yljgjb,
			      value:fian2[i].rs
			    })
			  }
		  var option = { title: {
	          text: qylxmc+jglxmc+'级别分析',  
	      },
	      tooltip: {
	          trigger: 'item',
	          formatter: function (params) {
	                           
	                         return params.data.name + ":" 
	                           + "共" + params.data.value + "人"
	                           + "(占比" + params.percent + "%)"
	                           +"<br/>"
	                           + "金额:" + ylje[params.dataIndex] + "元"
	                            	 + "(占比:" + ((Number(ylje[params.dataIndex])/cbje)*100).toFixed(3) + "%)"
	                         },
	      },
	  color : [ '#188df0', '#DD228F', '#7cb5ec', '#f6ae6e',
	    '#adff2f', '#444446', '#799aec', '#61d4e2',
	    '#6b8e23', '#87ceeb', '#b8860b', '#32cd32' ],
	       legend: {
	           orient: 'vertical',
	           x:'left',      //可设定图例在左、右、居中
	           y:'center', 
	           itemHeight: 7,
	           itemWidth: 7,
	           
	           width: '100%',
	           height: 200,
	           bottom: 20,
	           data: datas
	       },
	       series: [
	           {
	               name: '级别分析:',
	               type: 'pie',
	               radius: ['48%', '59%'],
	               avoidLabelOverlap: false,
	               label: {
	                   show: false,
	                   
	               },
	               center:['60%','50%'],
	               emphasis: {
	                   label: {
	                       show: true,
	                       fontSize: '30',
	                       fontWeight: 'bold'
	                   }
	               },
	               labelLine: {
	                   show: false
	               },
	               data: datass
	           }
	       ] 
		    };
		    myChart.setOption(option);  
		    myChart.on('click', function(params) { 
		     
	getechars03(jglx,qylx,kssj,jssj,jgdm,qylxmc,jglxmc,yljgjb[params.dataIndex],yljgjbdm[params.dataIndex]); 

		    });  
		} 	
function getechars03(jglx,qylx,kssj,jssj,jgdm,qylxmc,jglxmc,yljgjb,yljgjbdm){ 
	  $.ajax({
      url: "${ctx}/ybfytj/getechars03.json?p_kssj="+kssj
            +"&p_jssj="+jssj
            +"&p_jgdm="+jgdm
            +"&p_jglx="+jglx
            +"&p_qylx="+qylx
            +"&p_yljgjbdm="+yljgjbdm,    
       datatype:"json",
      context: document.body, 
      success: function(data){
         var nodes=eval(data);
         var hh= JSON.stringify(nodes);
         var xx=JSON.parse(hh);
         var fian3=xx.getechars03List; 
         var rs=new Array();
         var yljgdm=new Array();
         var yljgmc=new Array();
         
         var fian4=xx.getecharsList; 
         var ylje=new Array();
         var yljgdm2=new Array();
         var yljgmc2=new Array();
         
        for (var i=0;i<fian3.length;i++) { 
        	 rs[i]=fian3[i].rs; 
        	 yljgdm[i]=fian3[i].yljgdm; 
        	 yljgmc[i]=fian3[i].yljgmc;
          }
         for (var i=0;i<fian4.length;i++) { 
        	 ylje[i]=fian4[i].ylje; 
        	 yljgdm2[i]=fian4[i].yljgdm; 
        	 yljgmc2[i]=fian4[i].yljgmc;
         }
         chart03('chart03',rs,yljgdm,yljgmc,kssj,jssj,jglx,qylx,qylxmc,jglxmc,yljgjb);
         chart04('chart04',ylje,yljgdm2,yljgmc2,kssj,jssj,jglx,qylx,qylxmc,jglxmc,yljgjb);
           
        }
        });  
}

function chart03(id,rs,yljgdm,yljgmc,kssj,jssj,jglx,qylx,qylxmc,jglxmc,yljgjb){
	 
	if(typeof yljgjb==='undefined'){
	    yljgjb=''
	  }
	  
	document.getElementById("char").style.display="";//显示
	 var myChart=echarts.init(document.getElementById(id));
     myChart.dispose();
     myChart = echarts.init(document.getElementById(id));
	option = {
			title: {
                text: yljgjb+jglxmc+qylxmc+'人数分析',  
            },
			 color : [ '#188df0', '#DD228F', '#7cb5ec', '#f6ae6e',
		          '#adff2f', '#444446', '#799aec', '#61d4e2',
		          '#6b8e23', '#87ceeb', '#b8860b', '#32cd32' ],
			axisLabel: {  
	              interval: 0,  
	              formatter:function(value)  
	              { 
	            	 
	                  var ret = "";//拼接加\n返回的类目项  
	                  var maxLength = 7;//每项显示文字个数  
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
	          tooltip : {
	        		trigger: 'axis',
	        		axisPointer : {            // 坐标轴指示器，坐标轴触发有效
	            	type : 'shadow',        // 默认为直线，可选为：'line' | 'shadow'
	            	formatter: '{b}<br/>{c}'
	        		}
	   			},
		    xAxis: {
		    	name:'机构',
		        type: 'category',
		        data: yljgmc
		    },
		    yAxis: {
		    	minInterval: 1,
		    	name:'万人',
		        type: 'value'
		    },
		    series: [{
		    	 barWidth: 15,  
		        data: rs,
		        type: 'bar',
		        showBackground: true,
		        backgroundStyle: {
		            color: 'rgba(220, 220, 220, 0.8)'
		        }
		    }]
		};
	 myChart.setOption(option);  
	 myChart.on('click', function(params) { 
	 	   gettables(yljgdm[params.dataIndex],kssj,jssj,jglx,qylx);
	 	            }); 
}

function chart04(id,ylje,yljgdm,yljgmc,kssj,jssj,jglx,qylx,qylxmc,jglxmc,yljgjb){
	if(typeof yljgjb==='undefined'){
	    yljgjb=''
	  }
	document.getElementById("char").style.display="";//显示
	 var myChart=echarts.init(document.getElementById(id));
     myChart.dispose();
     myChart = echarts.init(document.getElementById(id));
	option = {
			title: {
                text: yljgjb+qylxmc+jglxmc+'金额分析',  
            },
			 color : [ '#188df0', '#DD228F', '#7cb5ec', '#f6ae6e',
		          '#adff2f', '#444446', '#799aec', '#61d4e2',
		          '#6b8e23', '#87ceeb', '#b8860b', '#32cd32' ],
			axisLabel: {  
	              interval: 0,  
	              formatter:function(value)  
	              { 
	            	 
	                  var ret = "";//拼接加\n返回的类目项  
	                  var maxLength = 7;//每项显示文字个数  
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
	          tooltip : {
	        		trigger: 'axis',
	        		axisPointer : {            // 坐标轴指示器，坐标轴触发有效
	            	type : 'shadow',        // 默认为直线，可选为：'line' | 'shadow'
	            	formatter: '{b}<br/>{c}'
	        		}
	   			},
		    xAxis: {
		    	name:'机构',
		        type: 'category',
		        data: yljgmc
		    },
		    yAxis: {
		    	 
		    	name:'万元',
		        type: 'value'
		    },
		    series: [{
		    	 barWidth: 15,  
		        data: ylje,
		        type: 'bar',
		        showBackground: true,
		        backgroundStyle: {
		            color: 'rgba(220, 220, 220, 0.8)'
		        }
		    }]
		};
	 myChart.setOption(option);  
	 myChart.on('click', function(params) { 
	 	   gettables(yljgdm[params.dataIndex],kssj,jssj,jglx,qylx);
	 	            }); 
}

function gettables(yljgdm,kssj,jssj,jglx,qylx){

	 document.getElementById("idname").style.display="";//显示 
	layui.use([ 'table', 'layer' ], function() {
		var table = layui.table;
		table.render({
					elem : '#querytable',
					url : '${ctx}/ybfytj/gettables',
					method : 'post',
					where : { 
						p_yljgdm : yljgdm,
						p_kssj : kssj,
						p_jssj : jssj,
						p_jglx : jglx,
						p_qylx : qylx,
					},
					cols : [[ 
						{ field : 'cbsj', title : '参保时间', width : '100' }, 
	                    { field : 'cblx', title : '参保类型', width : '100' },
	                    { field : 'yljgmc', title : '参保机构', width : '300' }, 
	                    { field : 'yljgjb', title : '机构级别', width : '120' } ,
	                    { field : 'jglxmc', title : '机构类型', width : '100' } ,
	                    { field : 'ylfyhj', title : '医疗费用', width : '100' } ,
	                    { field : 'mzylfy', title : '门诊费用', width : '100' },
	                    { field : 'zyylfy', title : '住院费用', width : '100' },
	                    { field : 'rchj', title : '人次', width : '100' } ,
	                    { field : 'zyrc', title : '住院人次', width : '100' }  
	                     

					]],
					height : '500',
					page : {
						layout : [ 'count', 'pre', 'page', 'next', 'skip',
								'limit' ],
						groups : 5,
						first : '首页',
						last : '尾页',
						limit : 10,
						limits : [ 5, 10, 20 ]
					},
					done : function(res, curr, count) {
						 	 
					}
				});
});
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
    }  else{
    	 $("#kssj").val('${kssj}'.substr(0,4));
    	 $("#jssj").val('${jssj}'.substr(0,4));
    document.getElementById("kssj").onclick = function(){
      WdatePicker({dateFmt:'yyyy'});
      };
    document.getElementById("jssj").onclick = function(){
      WdatePicker({dateFmt:'yyyy'});
        };
    
  }
}
</script>
<script type="text/javascript">
 

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
							<i value="year" class="n active" onclick="sjxz('year')">年</i>
							<i value="month" class="y" onclick="sjxz('month')">月</i>
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
				</span> <span class="det detLast" style="margin-left: 150px;"> <label
					for="">机构名称</label> <select style="width: 210px" id="jgdm"
					name="jgdm" lay-search>
						<option value="">全区</option>
						<c:forEach items="${ybjgList}" var="jg">
							<option value="${jg.jgdm}">${jg.jgmc}</option>
						</c:forEach>
				</select>
				</span>
			</div>
			<div class="topRight">
				<button class="btn1" onclick="search();">查询</button>
			</div>
		</div>
		<div style="width: 100%; height: 380px; margin-top: 48px">
			<div id="chart01"
				style="width: 50%; height: 400px; background: #FFFFFF; float: left"></div>
			<div style="position: absolute; margin-left: 120px">
				<img src="<c:url value="/static/commons/images/xz3.png"/>">
			</div>
			<div id="chart02"
				style="width: 50%; height: 400px; background: #FFFFFF; float: left"></div>
			<div style="position: absolute; margin-left:780px">
				<img src="<c:url value="/static/commons/images/xz3.png"/>">
			</div>
		</div>
		 
		 <div id="chartjbgx" 
		      style="width: 50%; height: 400px; background: #FFFFFF;display: none;"></div>
        
		 
		 
		
        <div id='char' style="display: none;">
		 
		 
        	<div id="chart03" style="width: 100%; height:400px;background:#FFFFFF;"></div>
        	<div id="chart04" style="width: 100%; height:400px;background:#FFFFFF;margin-top: 120px"></div>
          
		 <div style='position: absolute;margin-top: -1046px;    margin-left:210px'>
			<img src="<c:url value="/static/commons/images/xz3.png"/>">
		 </div>
		 <div style='position: absolute;margin-top: -444px;    margin-left:210px'>
			<img src="<c:url value="/static/commons/images/xz3.png"/>">
		 </div>
		 </div>
		<div id="idname"
			style="width: 100%; background: #FFFFFF; margin: 35px auto;margin-top: 105px; display: none">
			<table id="querytable" class="layui-table" lay-filter="querytab"
				style="margin: -10px;"></table>
				
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