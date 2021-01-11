<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/commons/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
<title>区域医保分析</title>
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
    }
function getData(){
	var kssj=$("#kssj").val();
    var jssj=$("#jssj").val();
    if(jssj<kssj){
   	 alert("选择的结束时间请大于或等于开始时间") ;
   	 return;
     }
       var jgdm=$("#jgdm").val();
       if(jgdm=="" ||jgdm==null){
        jgdm='${jgdm}'  
      } 
       $("#lx12_1").val('');
       $("#lx11_1").val('');
       $("#lx10_1").val('');
       $("#lx09_1").val('');
       $("#lx08_1").val('');
       $("#lx07_1").val('');
       $("#lx12_1").val(jgdm);
       $("#lx11_1").val(jgdm);
       $("#lx10_1").val(jgdm);
       $("#lx09_1").val(jgdm);
       $("#lx08_1").val(jgdm);
       $("#lx07_1").val(jgdm);
      ybEchars(kssj,jssj,jgdm); 
      getechars03('','',kssj,jssj,jgdm);
      getechars04('','',kssj,jssj,jgdm);
      getechars05('','','','',kssj,jssj,jgdm);
      getechars06('','','','',kssj,jssj,jgdm);
      getecharsAll('','','','','','',kssj,jssj,jgdm);     
      }
function ybEchars(kssj,jssj,jgdm){
  
      
      $.ajax({
        url: "${ctx}/gxqybfytj/gxqybfytj.json?p_kssj="+kssj
              +"&p_jssj="+jssj
              +"&p_yljgdm="+jgdm,    
         datatype:"json",
        context: document.body, 
        success: function(data){
           var nodes=eval(data);
           var hh= JSON.stringify(nodes);
           var xx=JSON.parse(hh);
           
           var fianl=xx.getechar01List;
           var qylx=new Array();
           var qylxmc=new Array();
           var rs=new Array();
           
           var fian2=xx.getechar02List;
           var qylx2=new Array();
           var qylxmc2=new Array();
           var ylje2=new Array();
           
           for (var i=0;i<fianl.length;i++) { 
        	   rs[i]=fianl[i].rs; 
        	   qylx[i]=fianl[i].qylx; 
        	   qylxmc[i]=fianl[i].qylxmc;
              } 
           for (var i=0;i<fian2.length;i++) { 
        	   ylje2[i]=fian2[i].ylje;
        	   qylx2[i]=fian2[i].qylx; 
        	   qylxmc2[i]=fian2[i].qylxmc; 
        	   
              } 
           
             chart01('chart01',fianl,qylx,qylxmc,kssj,jssj,jgdm); 
             chart02('chart02',fian2,qylx2,qylxmc2,kssj,jssj,jgdm); 
             
          }
          });
     
  }

function chart01(id,fianl,qylx,qylxmc,kssj,jssj,jgdm){ 
	
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
            text: '区域类型人次分析',  
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
                 name: '消费人次分析:',
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
                         fontSize: '20',
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
	getechars03(qylx[params.dataIndex],qylxmc[params.dataIndex],kssj,jssj,jgdm); 
	getechars05('','',qylx[params.dataIndex],qylxmc[params.dataIndex],kssj,jssj,jgdm)
	getecharsAll('','','','',qylx[params.dataIndex],qylxmc[params.dataIndex],kssj,jssj,jgdm);            
	    });   
}

 
function chart02(id,fian2,qylx2,qylxmc2,kssj,jssj,jgdm){ 
	 
	  var datas = [];
	  var datass = [];
	  for (var i = 0; i < fian2.length; i++) {
	    datas.push({
	      name:fian2[i].qylxmc
	    })
	    datass.push({
	      name:fian2[i].qylxmc,
	      value:fian2[i].ylje
	    })
	  }
	 
	  var myChart=echarts.init(document.getElementById(id));
	    myChart.dispose();
	    myChart = echarts.init(document.getElementById(id));
	    option = { 
	    title: {
          text: '消费金额分析',  
      },
      tooltip: {
          trigger: 'item',
          formatter: '{a} <br/>{b}: {c}元 ({d}%)'
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
               name: '区域类型金额分析:',
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
                       fontSize: '20',
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
	    	getechars04(qylx2[params.dataIndex],qylxmc2[params.dataIndex],kssj,jssj,jgdm); 
	    	getechars06('','',qylx[params.dataIndex],qylxmc[params.dataIndex],kssj,jssj,jgdm)
	    	getecharsAll('','','','',qylx[params.dataIndex],qylxmc[params.dataIndex],kssj,jssj,jgdm);     
	    }); 
	} 
	
function getechars03(qylx,qylxmc,kssj,jssj,jgdm){ 
    $.ajax({
      url: "${ctx}/gxqybfytj/getechars03.json?p_kssj="+kssj
            +"&p_jssj="+jssj
            +"&p_jgdm="+jgdm
            +"&p_qylx="+qylx,    
       datatype:"json",
      context: document.body, 
      success: function(data){
         var nodes=eval(data);
         var hh= JSON.stringify(nodes);
         var xx=JSON.parse(hh);
         
         var fian3=xx.getechar03List; 
         var jglx3=new Array(); 
         var jglxmc3=new Array();
         var rs3=new Array();
         
         for (var i=0;i<fian3.length;i++) { 
        	 jglxmc3[i]=fian3[i].jglxmc;
        	 jglx3[i]=fian3[i].jglx; 
        	 rs3[i]=fian3[i].rs; 
             }
         chart03('chart03',jglx3,jglxmc3,rs3,fian3,qylx,qylxmc,kssj,jssj,jgdm)
           
        }
        });
}
function getechars04(qylx,qylxmc,kssj,jssj,jgdm){ 
    $.ajax({
      url: "${ctx}/gxqybfytj/getechars04.json?p_kssj="+kssj
            +"&p_jssj="+jssj
            +"&p_jgdm="+jgdm
            +"&p_qylx="+qylx,    
       datatype:"json",
      context: document.body, 
      success: function(data){
         var nodes=eval(data);
         var hh= JSON.stringify(nodes);
         var xx=JSON.parse(hh);
         
         var fian4=xx.getechar04List; 
         var jglx4=new Array(); 
         var jglxmc4=new Array();
         var ylje4=new Array();
         
         for (var i=0;i<fian4.length;i++) { 
        	 jglxmc4[i]=fian4[i].jglxmc;
        	 jglx4[i]=fian4[i].jglx; 
        	 ylje4[i]=fian4[i].ylje; 
             }
         chart04('chart04',jglx4,jglxmc4,ylje4,fian4,qylx,qylxmc,kssj,jssj,jgdm)
           
        }
        });
}
function chart03(id,jglx,jglxmc,rs,fian,qylx,qylxmc,kssj,jssj,jgdm){ 
	var url="image://<c:url value="/static/commons/images/xz3.png"/>"
	if(typeof qylxmc==='undefined'){
		qylxmc='';
	}
	  var datas = [];
	  var datass = [];
	  for (var i = 0; i < fian.length; i++) {
	    datas.push({
	      name:fian[i].jglxmc
	    })
	    datass.push({
	      name:fian[i].jglxmc,
	      value:fian[i].rs
	    })
	  }
	 
	  var myChart=echarts.init(document.getElementById(id));
	    myChart.dispose();
	    myChart = echarts.init(document.getElementById(id));
	    option = { 
	    title: {
        text: qylxmc+'机构类型人次分析',  
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
             name: '机构类型人次分析:',
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
                     fontSize: '20',
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
	  getechars05(jglx[params.dataIndex],jglxmc[params.dataIndex],qylx,qylxmc,kssj,jssj,jgdm);    
	  getecharsAll('','',jglx[params.dataIndex],jglxmc[params.dataIndex],qylx,qylxmc,kssj,jssj,jgdm);            
	    }); 
	} 
function chart04(id,jglx,jglxmc,rs,fian,qylx,qylxmc,kssj,jssj,jgdm){ 
	if(typeof qylxmc==='undefined'){
		qylxmc='';
	}
	  var datas = [];
	  var datass = [];
	  for (var i = 0; i < fian.length; i++) {
	    datas.push({
	      name:fian[i].jglxmc
	    })
	    datass.push({
	      name:fian[i].jglxmc,
	      value:fian[i].ylje
	    })
	  }
	 
	  var myChart=echarts.init(document.getElementById(id));
	    myChart.dispose();
	    myChart = echarts.init(document.getElementById(id));
	    option = { 
	    title: {
        text: qylxmc+'机构类型金额分析',  
    },
    tooltip: {
        trigger: 'item',
        formatter: '{a} <br/>{b}: {c}元 ({d}%)'
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
             name: '机构类型金额分析:',
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
                     fontSize: '20',
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
	    	  getechars06(jglx[params.dataIndex],jglxmc[params.dataIndex],qylx,qylxmc,kssj,jssj,jgdm);        
	    	  getecharsAll('','',jglx[params.dataIndex],jglxmc[params.dataIndex],qylx,qylxmc,kssj,jssj,jgdm);    
	    }); 
	} 
function getechars05(jglx,jglxmc,qylx,qylxmc,kssj,jssj,jgdm){ 
    $.ajax({
      url: "${ctx}/gxqybfytj/getechars05.json?p_kssj="+kssj
            +"&p_jssj="+jssj
            +"&p_jgdm="+jgdm
            +"&p_qylx="+qylx
            +"&p_jglx="+jglx,    
       datatype:"json",
      context: document.body, 
      success: function(data){
         var nodes=eval(data);
         var hh= JSON.stringify(nodes);
         var xx=JSON.parse(hh);
         
         var fian5=xx.getechar05List; 
         var jbdm5=new Array();
         var jbmc5=new Array();
         var rs5=new Array();
         
         for (var i=0;i<fian5.length;i++) { 
        	 jbmc5[i]=fian5[i].jbmc;
        	 jbdm5[i]=fian5[i].jbdm; 
        	 rs5[i]=fian5[i].rs; 
             }
         chart05('chart05',jbdm5,jbmc5,rs5,fian5,jglx,jglxmc,qylx,qylxmc,kssj,jssj,jgdm)
           
        }
        });
}
function getechars06(jglx,jglxmc,qylx,qylxmc,kssj,jssj,jgdm){ 

    $.ajax({
      url: "${ctx}/gxqybfytj/getechars06.json?p_kssj="+kssj
            +"&p_jssj="+jssj
            +"&p_jgdm="+jgdm
            +"&p_qylx="+qylx
            +"&p_jglx="+jglx,    
       datatype:"json",
      context: document.body, 
      success: function(data){
         var nodes=eval(data);
         var hh= JSON.stringify(nodes);
         var xx=JSON.parse(hh);
         
         var fian6=xx.getechar06List; 
         var jbmc6=new Array(); 
         var jbdm6=new Array();
         var ylje6=new Array();
         
         for (var i=0;i<fian6.length;i++) { 
        	 jbmc6[i]=fian6[i].jbmc;
        	 jbdm6[i]=fian6[i].jbdm; 
        	 ylje6[i]=fian6[i].ylje; 
             }
         chart06('chart06',jbdm6,jbmc6,ylje6,fian6,jglx,jglxmc,qylx,qylxmc,kssj,jssj,jgdm)
           
        }
        });
}
function chart05(id,jbdm,jbmc,rs,fian,jglx,jglxmc,qylx,qylxmc,kssj,jssj,jgdm){ 
 
	if(typeof jglxmc==='undefined'){
		jglxmc='';
	}
	if(typeof qylxmc==='undefined'){
		qylxmc='';
	}
	  var datas = [];
	  var datass = [];
	  for (var i = 0; i < fian.length; i++) {
	    datas.push({
	      name:fian[i].jbmc
	    })
	    datass.push({
	      name:fian[i].jbmc,
	      value:fian[i].rs
	    })
	  }
	 
	  var myChart=echarts.init(document.getElementById(id));
	    myChart.dispose();
	    myChart = echarts.init(document.getElementById(id));
	    option = { 
	    title: {
        text: qylxmc+jglxmc+'级别人次分析',  
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
             name: '级别人次分析:',
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
                     fontSize: '20',
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
	   getecharsAll(jbdm[params.dataIndex],jbmc[params.dataIndex],jglx,jglxmc,qylx,qylxmc,kssj,jssj,jgdm);    
	            }); 
	} 
	
function chart06(id,jbdm,jbmc,ylje,fian,jglx,jglxmc,qylx,qylxmc,kssj,jssj,jgdm){ 
	if(typeof jglxmc==='undefined'){
		jglxmc='';
	}
	if(typeof qylxmc==='undefined'){
		qylxmc='';
	}
	  var datas = [];
	  var datass = [];
	  for (var i = 0; i < fian.length; i++) {
	    datas.push({
	      name:fian[i].jbmc
	    })
	    datass.push({
	      name:fian[i].jbmc,
	      value:fian[i].ylje
	    })
	  }
	 
	  var myChart=echarts.init(document.getElementById(id));
	    myChart.dispose();
	    myChart = echarts.init(document.getElementById(id));
	    option = { 
	    title: {
        text: qylxmc+jglxmc+'级别金额分析',  
    },
    tooltip: {
        trigger: 'item',
        formatter: '{a} <br/>{b}: {c}元 ({d}%)'
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
             name: '级别金额分析:',
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
                     fontSize: '20',
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
	    	getecharsAll(jbdm[params.dataIndex],jbmc[params.dataIndex],jglx,jglxmc,qylx,qylxmc,kssj,jssj,jgdm);
	            }); 
	} 
function getecharsAll(jbdm,jbmc,jglx,jglxmc,qylx,qylxmc,kssj,jssj,jgdm){ 

    $.ajax({
      url: "${ctx}/gxqybfytj/getecharsAll.json?p_kssj="+kssj
            +"&p_jssj="+jssj
            +"&p_jgdm="+jgdm
            +"&p_qylx="+qylx
            +"&p_jglx="+jglx
            +"&p_jbdm="+jbdm,    
       datatype:"json",
      context: document.body, 
      success: function(data){
         var nodes=eval(data);
         var hh= JSON.stringify(nodes);
         var xx=JSON.parse(hh);
         
         var fian7=xx.getechar07List; 
         var rs=new Array(); 
         var yljgmc=new Array();
         
         var fian8=xx.getechar08List; 
         var rs8=new Array(); 
         var yljgmc8=new Array();
         
         var fian9=xx.getechar09List; 
         var rs9=new Array(); 
         var yljgmc9=new Array();
         
         var fian10=xx.getechar10List; 
         var rs10=new Array(); 
         var yljgmc10=new Array();
         
         var fian11=xx.getechar11List; 
         var rs11=new Array(); 
         var yljgmc11=new Array();
         
         var fian12=xx.getechar12List; 
         var rs12=new Array(); 
         var yljgmc12=new Array();
         
         var fian13=xx.getechar13List; 
         var rs13=new Array(); 
         var mzrc=new Array();
         var zyrc=new Array();
         var rq=new Array();
         
         var fian14=xx.getechar14List; 
         var zje=new Array(); 
         var mzje=new Array();
         var zyje=new Array();
         var rq14=new Array();
         
         
         for (var i=0;i<fian7.length;i++) { 
        	 rs[i]=fian7[i].rs;
        	 yljgmc[i]=fian7[i].yljgmc; 
             }
         for (var i=0;i<fian8.length;i++) { 
        	 rs8[i]=fian8[i].rs;
        	 yljgmc8[i]=fian8[i].yljgmc; 
             }
         for (var i=0;i<fian9.length;i++) { 
        	 rs9[i]=fian9[i].rs;
        	 yljgmc9[i]=fian9[i].yljgmc; 
             }
         for (var i=0;i<fian10.length;i++) { 
        	 rs10[i]=fian10[i].rs;
        	 yljgmc10[i]=fian10[i].yljgmc; 
             }
         for (var i=0;i<fian11.length;i++) { 
        	 rs11[i]=fian11[i].rs;
        	 yljgmc11[i]=fian11[i].yljgmc; 
             }
         for (var i=0;i<fian12.length;i++) { 
        	 rs12[i]=fian12[i].rs;
        	 yljgmc12[i]=fian12[i].yljgmc; 
             }
         for (var i=0;i<fian13.length;i++) { 
        	 rs13[i]=fian13[i].rs;
        	 mzrc[i]=fian13[i].mzrc; 
        	 zyrc[i]=fian13[i].zyrc; 
        	 rq[i]=fian13[i].rq; 
             }
         for (var i=0;i<fian14.length;i++) { 
        	 zje[i]=fian14[i].zje;
        	 mzje[i]=fian14[i].mzje; 
        	 zyje[i]=fian14[i].zyje; 
        	 rq14[i]=fian14[i].rq; 
             }
         
         chart07('chart07',rs,yljgmc,jbmc,jglxmc,qylxmc);
         chart08('chart08',rs8,yljgmc8,jbmc,jglxmc,qylxmc) ;
         chart09('chart09',rs9,yljgmc9,jbmc,jglxmc,qylxmc) ;
         chart10('chart10',rs10,yljgmc10,jbmc,jglxmc,qylxmc);
         chart11('chart11',rs11,yljgmc11,jbmc,jglxmc,qylxmc) ;
         chart12('chart12',rs12,yljgmc12,jbmc,jglxmc,qylxmc) ;
         chart13('chart13',rs13,mzrc,zyrc,rq,jbmc,jglxmc,qylxmc) ;
         chart14('chart14',zje,mzje,zyje,rq14,jbmc,jglxmc,qylxmc) ;
         
         $("#lx07_2").val('');
         $("#lx07_3").val('');
         $("#lx07_4").val('');
         $("#lx07_5").val(''); 
         
         $("#lx08_2").val('');
         $("#lx08_3").val('');
         $("#lx08_4").val('');
         $("#lx08_5").val('');
        
         $("#lx09_2").val('');
         $("#lx09_3").val('');
         $("#lx09_4").val('');
         $("#lx09_5").val('');
         
         $("#lx10_2").val('');
         $("#lx10_3").val('');
         $("#lx10_4").val('');
         $("#lx10_5").val('');
        
         $("#lx11_2").val('');
         $("#lx11_3").val('');
         $("#lx11_4").val('');
         $("#lx11_5").val('');
         
         $("#lx12_2").val('');
         $("#lx12_3").val('');
         $("#lx12_4").val('');
         $("#lx12_5").val('');
         
         $("#lx07_2").val(jbdm);
         $("#lx07_3").val(jglx);
         $("#lx07_4").val(qylx);
         $("#lx07_5").val('rs');
        
         $("#lx08_2").val(jbdm);
         $("#lx08_3").val(jglx);
         $("#lx08_4").val(qylx);
         $("#lx08_5").val('rs');
         
         $("#lx09_2").val(jbdm);
         $("#lx09_3").val(jglx);
         $("#lx09_4").val(qylx);
         $("#lx09_5").val('rs');
        
         $("#lx10_2").val(jbdm);
         $("#lx10_3").val(jglx);
         $("#lx10_4").val(qylx);
         $("#lx10_5").val('je');
         
         $("#lx11_2").val(jbdm);
         $("#lx11_3").val(jglx);
         $("#lx11_4").val(qylx);
         $("#lx11_5").val('je');
        
         $("#lx12_2").val(jbdm);
         $("#lx12_3").val(jglx);
         $("#lx12_4").val(qylx);
         $("#lx12_5").val('je');
         
         
        }
        });
}

function chart07(id,rs,yljgmc,jbmc,jglxmc,qylxmc){
	 
	if(typeof jbmc==='undefined'){
		jbmc=''
	  }
	if(typeof jglxmc==='undefined'){
		jglxmc=''
	  }
	if(typeof qylxmc==='undefined'){
		qylxmc=''
	  }
	 var myChart=echarts.init(document.getElementById(id));
     myChart.dispose();
     myChart = echarts.init(document.getElementById(id));
	option = {
			title: {
                text: qylxmc+jglxmc+jbmc+jglxmc+qylxmc+'人员总人次分布图',  
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
	 
}
function chart08(id,rs,yljgmc,jbmc,jglxmc,qylxmc){
	 
	if(typeof jbmc==='undefined'){
		jbmc=''
	  }
	if(typeof jglxmc==='undefined'){
		jglxmc=''
	  }
	if(typeof qylxmc==='undefined'){
		qylxmc=''
	  }
	 var myChart=echarts.init(document.getElementById(id));
     myChart.dispose();
     myChart = echarts.init(document.getElementById(id));
	option = {
			title: {
                text: qylxmc+jglxmc+jbmc+jglxmc+qylxmc+'门诊人员总人次分布图',  
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
	 
}
function chart09(id,rs,yljgmc,jbmc,jglxmc,qylxmc){
	 
	if(typeof jbmc==='undefined'){
		jbmc=''
	  }
	if(typeof jglxmc==='undefined'){
		jglxmc=''
	  }
	if(typeof qylxmc==='undefined'){
		qylxmc=''
	  }
	 var myChart=echarts.init(document.getElementById(id));
     myChart.dispose();
     myChart = echarts.init(document.getElementById(id));
	option = {
			title: {
                text: qylxmc+jglxmc+jbmc+jglxmc+qylxmc+'住院人员总人次分布图',  
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
	 
}
function chart10(id,rs,yljgmc,jbmc,jglxmc,qylxmc){
	   
	  if(typeof jbmc==='undefined'){
	    jbmc=''
	    }
	  if(typeof jglxmc==='undefined'){
	    jglxmc=''
	    }
	  if(typeof qylxmc==='undefined'){
	    qylxmc=''
	    }
	   var myChart=echarts.init(document.getElementById(id));
	     myChart.dispose();
	     myChart = echarts.init(document.getElementById(id));
	  option = {
	      title: {
	                text: qylxmc+jglxmc+jbmc+jglxmc+qylxmc+'人员总金额分布图',  
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
	          name:'万元',
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
	   
	}
	function chart11(id,rs,yljgmc,jbmc,jglxmc,qylxmc){
	   
	  if(typeof jbmc==='undefined'){
	    jbmc=''
	    }
	  if(typeof jglxmc==='undefined'){
	    jglxmc=''
	    }
	  if(typeof qylxmc==='undefined'){
	    qylxmc=''
	    }
	   var myChart=echarts.init(document.getElementById(id));
	     myChart.dispose();
	     myChart = echarts.init(document.getElementById(id));
	  option = {
	      title: {
	                text: qylxmc+jglxmc+jbmc+jglxmc+qylxmc+'门诊人员总金额分布图',  
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
	          name:'万元',
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
	   
	}
	function chart12(id,rs,yljgmc,jbmc,jglxmc,qylxmc){
	   
	  if(typeof jbmc==='undefined'){
	    jbmc=''
	    }
	  if(typeof jglxmc==='undefined'){
	    jglxmc=''
	    }
	  if(typeof qylxmc==='undefined'){
	    qylxmc=''
	    }
	   var myChart=echarts.init(document.getElementById(id));
	     myChart.dispose();
	     myChart = echarts.init(document.getElementById(id));
	  option = {
	      title: {
	                text: qylxmc+jglxmc+jbmc+jglxmc+qylxmc+'住院人员总金额分布图',  
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
	          name:'万元',
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
	   
	}

	function chart13(id,rs,mzrc,zyrc,rq,jbmc,jglxmc,qylxmc){
		 
		  if(typeof jbmc==='undefined'){
		    jbmc=''
		    }
		  if(typeof jglxmc==='undefined'){
		    jglxmc=''
		    }
		  if(typeof qylxmc==='undefined'){
		    qylxmc=''
		    }
		  var myChart=echarts.init(document.getElementById(id));
		    

		  var options = {
		      title: {
		    	  text: qylxmc+jglxmc+jbmc+jglxmc+qylxmc+'参保人员诊疗人次趋势',  
		            },
		      
		    color : [ '#188df0', '#DD228F',  '#f6ae6e',
		      '#adff2f', '#444446', '#799aec', '#61d4e2',
		      '#6b8e23', '#87ceeb', '#b8860b', '#32cd32' ],
		    tooltip : {
		      trigger : 'axis'
		    },
		    legend : {
		       
		    },
		    xAxis :  {
		      name:"日期",
		      type : 'category',
		      boundaryGap : false,
		      data : rq
		    },
		    dataZoom: [
	         {
	           type: "slider",
	           realtime: true, //拖动滚动条时是否动态的更新图表数据
	           height: 25, //滚动条高度
	           start: 30, //滚动条开始位置（共100等份）
	           end: 100 //结束位置（共100等份）
	         }
	       ],
		    yAxis : {
		      name:"万人",
		      type : 'value'
		    },
		     
		    series : [
		      {
		               name: '总人数', 
		               type: "line",
			           symbolSize: 8,
			           smooth: true,
		               data: rs, 
		        },
		         
		        {
		            name: "门诊人次",
		            type: "line",
		            symbolSize: 8,
		            smooth: true,
		            data: mzrc
		        } ,
		         
		        {
		            name: "住院人次",
		            type: "line",
		            symbolSize: 8,
		            smooth: true,
		            data: zyrc
		        }  
		        ]
		  };
		  myChart.setOption(options);
		   
		}
	
	function chart14(id,zje,mzje,zyje,rq,jbmc,jglxmc,qylxmc) {
		 
		  if(typeof jbmc==='undefined'){
		    jbmc=''
		    }
		  if(typeof jglxmc==='undefined'){
		    jglxmc=''
		    }
		  if(typeof qylxmc==='undefined'){
		    qylxmc=''
		    }
		  var myChart=echarts.init(document.getElementById(id));
		    

		  var options = {
		      title: {
		    	  text: qylxmc+jglxmc+jbmc+jglxmc+qylxmc+'参保人员诊疗金额趋势',  
		            },
		      
		    color : [ '#188df0', '#DD228F', '#f6ae6e',
		      '#adff2f', '#444446', '#799aec', '#61d4e2',
		      '#6b8e23', '#87ceeb', '#b8860b', '#32cd32' ],
		    tooltip : {
		      trigger : 'axis'
		    },
		    legend : {
		       
		    },
		    xAxis :  {
		      name:"日期",
		      type : 'category',
		      boundaryGap : false,
		      data : rq
		    },
		    dataZoom: [
	         {
	           type: "slider",
	           realtime: true, //拖动滚动条时是否动态的更新图表数据
	           height: 25, //滚动条高度
	           start: 30, //滚动条开始位置（共100等份）
	           end: 100 //结束位置（共100等份）
	         }
	       ],
		    yAxis : {
		      name:"元",
		      type : 'value'
		    },
		     
		    series : [
		      {
		               name: '总金额', 
		               type: "line",
			           symbolSize: 8,
			           smooth: true,
		               data: zje, 
		        },
		         
		        {
		            name: "门诊金额",
		            type: "line",
		            symbolSize: 8,
		            smooth: true,
		            data: mzje
		        } ,
		         
		        {
		            name: "住院金额",
		            type: "line",
		            symbolSize: 8,
		            smooth: true,
		            data: zyje
		        }  
		        ]
		  };
		  myChart.setOption(options);
		   
		}
	function searchcx7(){
		
		window.open("${ctx}/ybtable/ybtable?p_yljgdm="+$("#lx07_1").val()
				+"&p_jbdm="+$("#lx07_2").val()+"&p_jglx="+$("#lx07_3").val()+"&p_qylx="
				+$("#lx07_4").val()+"&p_lx="+$("#lx07_5").val()
				+"&p_kssj="+$("#kssj").val()
		        +"&p_jssj="+$("#jssj").val()+"&p_ywlx=rszh");
	}
	function searchcx8(){
		window.open("${ctx}/ybtable/ybtable?p_yljgdm="+$("#lx08_1").val()
				+"&p_jbdm="+$("#lx08_2").val()+"&p_jglx="+$("#lx08_3").val()+"&p_qylx="
				+$("#lx08_4").val()+"&p_lx="+$("#lx08_5").val()
				+"&p_kssj="+$("#kssj").val()
		        +"&p_jssj="+$("#jssj").val()+"&p_ywlx=mzrs");
	}
	function searchcx9(){
		window.open("${ctx}/ybtable/ybtable?p_yljgdm="+$("#lx09_1").val()
				+"&p_jbdm="+$("#lx09_2").val()+"&p_jglx="+$("#lx09_3").val()+"&p_qylx="
				+$("#lx09_4").val()+"&p_lx="+$("#lx09_5").val()
				+"&p_kssj="+$("#kssj").val()
		        +"&p_jssj="+$("#jssj").val()+"&p_ywlx=zyrs");
	}
	function searchcx10(){
		window.open("${ctx}/ybtable/ybtable?p_yljgdm="+$("#lx10_1").val()
				+"&p_jbdm="+$("#lx10_2").val()+"&p_jglx="+$("#lx10_3").val()+"&p_qylx="
				+$("#lx10_4").val()+"&p_lx="+$("#lx10_5").val()
				+"&p_kssj="+$("#kssj").val()
		        +"&p_jssj="+$("#jssj").val()+"&p_ywlx=jezs");
	}
	function searchcx11(){
		window.open("${ctx}/ybtable/ybtable?p_yljgdm="+$("#lx11_1").val()
				+"&p_jbdm="+$("#lx11_2").val()+"&p_jglx="+$("#lx11_3").val()+"&p_qylx="
				+$("#lx11_4").val()+"&p_lx="+$("#lx11_5").val()
				+"&p_kssj="+$("#kssj").val()
		        +"&p_jssj="+$("#jssj").val()+"&p_ywlx=mzje");
	}
	function searchcx12(){
		window.open("${ctx}/ybtable/ybtable?p_yljgdm="+$("#lx12_1").val()
				+"&p_jbdm="+$("#lx12_2").val()+"&p_jglx="+$("#lx12_3").val()+"&p_qylx="
				+$("#lx12_4").val()+"&p_lx="+$("#lx12_5").val()
				+"&p_kssj="+$("#kssj").val()
		        +"&p_jssj="+$("#jssj").val()+"&p_ywlx=zyje");
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
						<c:forEach items="${gxqybjgList}" var="jg">
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
				style="width: 50%; height: 380px; background: #FFFFFF; float: left"></div>
			<div style="position: absolute; margin-left: 220px">
				<img src="<c:url value="/static/commons/images/xz3.png"/>">
			</div>
			<div id="chart02"
				style="width: 50%; height: 380px; background: #FFFFFF; float: left"></div>
			<div style="position: absolute; margin-left: 800px">
				<img src="<c:url value="/static/commons/images/xz3.png"/>">
			</div>
		</div>

		<div style="width: 100%; height: 380px; margin-top: 48px">
			<div id="chart03"
				style="width: 50%; height: 380px; background: #FFFFFF; float: left"></div>
			<div style="position: absolute; margin-left: 220px">
				<img src="<c:url value="/static/commons/images/xz3.png"/>">
			</div>
			<div id="chart04"
				style="width: 50%; height: 380px; background: #FFFFFF; float: left"></div>
			<div style="position: absolute; margin-left: 800px">
				<img src="<c:url value="/static/commons/images/xz3.png"/>">
			</div>
		</div>

       <div style="width: 100%; height: 380px; margin-top: 48px">
			<div id="chart05"
				style="width: 50%; height: 380px; background: #FFFFFF; float: left"></div>
			<div style="position: absolute; margin-left: 220px">
				<img src="<c:url value="/static/commons/images/xz3.png"/>">
			</div>
			<div id="chart06"
				style="width: 50%; height: 380px; background: #FFFFFF; float: left"></div>
			<div style="position: absolute; margin-left: 800px">
				<img src="<c:url value="/static/commons/images/xz3.png"/>">
			</div>
		</div>
		<div id="chart07" style="width: 100%; height:400px;background:#FFFFFF;"></div>
       <div  style="cursor: pointer;position: absolute;margin-top: -398px;margin-left: 992px;">
       <a onclick="searchcx7()" >more</a>
       </div>
       <div id="chart08" style="width: 100%; height:400px;background:#FFFFFF;"></div>
       <div  style="cursor: pointer;position: absolute;margin-top: -390px;margin-left: 992px;">
       <a onclick="searchcx8()" >more</a>
       </div>
       <div id="chart09" style="width: 100%; height:400px;background:#FFFFFF;"></div>
       <div  style="cursor: pointer;position: absolute;margin-top: -390px;margin-left: 992px;">
       <a onclick="searchcx9()" >more</a>
       </div>
       <div id="chart10" style="width: 100%; height:400px;background:#FFFFFF;"></div>
       <div  style="cursor: pointer;position: absolute;margin-top: -390px;margin-left: 992px;">
       <a onclick="searchcx10()" >more</a>
       </div>
       <div id="chart11" style="width: 100%; height:400px;background:#FFFFFF;"></div>
       <div  style="cursor: pointer;position: absolute;margin-top: -390px;margin-left: 992px;">
       <a onclick="searchcx11()" >more</a>
       </div>
       <div id="chart12" style="width: 100%; height:400px;background:#FFFFFF;"></div>
       <div  style="cursor: pointer;position: absolute;margin-top: -390px;margin-left: 992px;">
       <a onclick="searchcx12()" >more</a>
       </div>
       <span ><input id='lx07_1' style='width: 100px;display: none' type="text" name="fname" /> 
       <span ><input id='lx07_2' style='width: 100px;display: none' type="text" name="fname" /> 
       <span ><input id='lx07_3' style='width: 100px;display: none' type="text" name="fname" /> 
       <span ><input id='lx07_4' style='width: 100px;display: none' type="text" name="fname" /> 
       <span ><input id='lx07_5' style='width: 100px;display: none' type="text" name="fname" /> 
       <span ><input id='lx08_1' style='width: 100px;display: none' type="text" name="fname" /> 
       <span ><input id='lx08_2' style='width: 100px;display: none' type="text" name="fname" /> 
       <span ><input id='lx08_3' style='width: 100px;display: none' type="text" name="fname" /> 
       <span ><input id='lx08_4' style='width: 100px;display: none' type="text" name="fname" /> 
       <span ><input id='lx08_5' style='width: 100px;display: none' type="text" name="fname" /> 
       <span ><input id='lx09_1' style='width: 100px;display: none' type="text" name="fname" /> 
       <span ><input id='lx09_2' style='width: 100px;display: none' type="text" name="fname" /> 
       <span ><input id='lx09_3' style='width: 100px;display: none' type="text" name="fname" /> 
       <span ><input id='lx09_4' style='width: 100px;display: none' type="text" name="fname" /> 
       <span ><input id='lx09_5' style='width: 100px;display: none' type="text" name="fname" /> 
       <span ><input id='lx10_1' style='width: 100px;display: none' type="text" name="fname" /> 
       <span ><input id='lx10_2' style='width: 100px;display: none' type="text" name="fname" /> 
       <span ><input id='lx10_3' style='width: 100px;display: none' type="text" name="fname" /> 
       <span ><input id='lx10_4' style='width: 100px;display: none' type="text" name="fname" /> 
       <span ><input id='lx10_5' style='width: 100px;display: none' type="text" name="fname" /> 
       <span ><input id='lx11_1' style='width: 100px;display: none' type="text" name="fname" /> 
       <span ><input id='lx11_2' style='width: 100px;display: none' type="text" name="fname" /> 
       <span ><input id='lx11_3' style='width: 100px;display: none' type="text" name="fname" /> 
       <span ><input id='lx11_4' style='width: 100px;display: none' type="text" name="fname" /> 
       <span ><input id='lx11_5' style='width: 100px;display: none' type="text" name="fname" /> 
       <span ><input id='lx12_1' style='width: 100px;display: none' type="text" name="fname" /> 
       <span ><input id='lx12_2' style='width: 100px;display: none' type="text" name="fname" /> 
       <span ><input id='lx12_3' style='width: 100px;display: none' type="text" name="fname" /> 
       <span ><input id='lx12_4' style='width: 100px;display: none' type="text" name="fname" /> 
       <span ><input id='lx12_5' style='width: 100px;display: none' type="text" name="fname" /> 
       
       
       <div id="chart13" style="width: 100%; margin-top: 39px;height:400px;background:#FFFFFF;"></div>
	   <div id="chart14" style="width: 100%; margin-top: 39px;height:400px;background:#FFFFFF;"></div>
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