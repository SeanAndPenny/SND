<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/commons/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
<title>区域医保分析</title>
 

 
<script type="text/javascript"
  src="<c:url value="/static/commons/js/jquery-index.min.js"/>"></script>
<script type="text/javascript"
  src="<c:url value="/static/commons/js/echarts.min.index.js"/>"></script>	
<script type="text/javascript"
  src="<c:url value="/static/commons/js/swiper.js"/>"></script>
<link rel="stylesheet" type="text/css"
  href="<c:url value="/static/commons/css/rkzb_index.css"/>" />
<link rel="stylesheet" type="text/css"
  href="<c:url value="/static/commons/css/rkzb_reset.css"/>" />
<link rel="stylesheet" type="text/css"
  href="<c:url value="/static/commons/css/medical-insurance.css"/>" />
 <link rel="stylesheet" type="text/css"
	href="<c:url value="/static/commons/js/My97DatePicker/skin/WdatePicker.css"/>" />
<script type="text/javascript"
	src="<c:url value="/static/commons/js/My97DatePicker/WdatePicker.js"/>"></script>
 
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
$(document).ready(function(){
    getData();
    sjxz();
   
 });

function search() {
   getData(); 
   }
function getData(){
	      ybEchars("rc"); 
	      getechars03('',''); 
	      //getechars04('',''); 
	      getechars05('','','',''); 
	     // getechars06('','','',''); 
	      getecharsAll('','','','','','');
	      }
function ybEchars(id){ 
	 if(id=='rc'){ 
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
		       $("#top1").attr("class","ss");
			  $("#top0").attr("class","active");
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
	         
	          
	           
	         for (var i=0;i<fianl.length;i++) { 
	           rs[i]=fianl[i].rs; 
	           qylx[i]=fianl[i].qylx; 
	           qylxmc[i]=fianl[i].qylxmc;
	            }  
	          
	           chart01('chart01',fianl,qylx,qylxmc,kssj,jssj,id); 
	            
	        }
	        });  
	 }else{
		 $("#top0").attr("class","ss");
		  $("#top1").attr("class","active");
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
	         var fian2=xx.getechar02List;
	         var qylx2=new Array();
	         var qylxmc2=new Array();
	         var ylje2=new Array();
	           
	         
	         for (var i=0;i<fian2.length;i++) { 
	        	   ylje2[i]=fian2[i].ylje;
	        	   qylx2[i]=fian2[i].qylx; 
	        	   qylxmc2[i]=fian2[i].qylxmc; 
	        	   
	              } 
	           
	         chart01('chart01',fian2,qylx2,qylxmc2,kssj,jssj,id); 
	        }
	        });
	 } 
}
 
	function getechars03(qylx,qylxmc){ 
		 $("#top3").attr("class","active");
		  $("#top4").attr("class","ss");
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
	         chart02('chart02',jglx3,jglxmc3,rs3,fian3,qylx,qylxmc,kssj,jssj,'rc')
	           
	        }
	        });
	}
	function getechars04(qylx,qylxmc){ 
		 $("#top3").attr("class","ss");
		  $("#top4").attr("class","active");
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
	         chart02('chart02',jglx4,jglxmc4,ylje4,fian4,qylx,qylxmc,kssj,jssj,'je')
	           
	        }
	        });
	}
	function getechars05(jglx,jglxmc,qylx,qylxmc){ 
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
	         chart03('chart03',jbdm5,jbmc5,rs5,fian5,jglx,jglxmc,qylx,qylxmc,kssj,jssj,'rc')
	           
	        }
	        });
	}
	function getechars06(jglx,jglxmc,qylx,qylxmc){ 
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
	         chart03('chart03',jbdm6,jbmc6,ylje6,fian6,jglx,jglxmc,qylx,qylxmc,kssj,jssj,'je')
	           
	        }
	        });
	}
	function getecharsAll(jbdm,jbmc,jglx,jglxmc,qylx,qylxmc){ 
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
	         
	         chart04('chart04',rs,yljgmc,jbmc,jglxmc,qylxmc);
	         chart04bf('chart04bf',rs8,yljgmc8,jbmc,jglxmc,qylxmc) ;
	         chart04bf2('chart04bf2',rs9,yljgmc9,jbmc,jglxmc,qylxmc) ;
	         chart05('chart05',rs10,yljgmc10,jbmc,jglxmc,qylxmc) ;
	         chart08("chart08",rs11,yljgmc11,jbmc,jglxmc,qylxmc) ;
	         chart09("chart09",rs12,yljgmc12,jbmc,jglxmc,qylxmc) ;
	         chart06('chart06',rs13,mzrc,zyrc,rq,jbmc,jglxmc,qylxmc) ;
		     chart07('chart07',zje,mzje,zyje,rq14,jbmc,jglxmc,qylxmc) ;
	      
	         
	        }
	        });
	}

</script>
<script type="text/javascript">
function chart01(id,fianl,qylx,qylxmc,kssj,jssj,bz) { 
	if(bz=='rc'){
		 $('#legend01').html(""); 
		   
		    
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
		      $('#legend01').append("<li class='li0"+(i+1)+ "'><span class='icon icon0"+(i+1)+"'"+"></span> <span class='name'>"+fianl[i].qylxmc+"</span> <span id='id"+(i+1)+"' class='num'></span> </li>");
		    
		      $('#id' + (i+1)).html('');
			 $('#id' + (i+1)).html(fianl[i].rs+'人');
		     
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
		        color : [ '#88CA6D', '#0DAEF1', '#1572D5' ],
		        series: [
		            {
		                name: '医保类型人次及消费金额分析',
		                type: 'pie',
		                hoverOffset: 4,
		                center: ["35%", "48%"],
		                radius: ['35%', '56%'],
		                label: {
		                    show: false
		                },
		                labelLine: {
		                    show: false,
		                    length: 11,
		                    length2: 12
		                },
		                data:  datass,
		                emphasis: {
		                    label: {
		                        show: true,
		                        fontSize: 18,
		                        formatter: function (params) {
		                            return '{a|' + params.name + '}\n' + (params.percent).toFixed(2) + '%'
		                        },
		                        rich: {
		                            a: {
		                                fontSize: 15,
		                                color: '#333333',
		                                padding: [6, 0, 0, 0]
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
			getecharsAll('','','','',qylx[params.dataIndex],qylxmc[params.dataIndex],kssj,jssj);            
			    });   
		    return myChart	
	}else{

		  
		  $('#legend01').html("");
		  
		   var datas = [];
		    var datass = [];
		    for (var i = 0; i < fianl.length; i++) { 
		      datas.push({
		        name:fianl[i].qylxmc
		      })
		      datass.push({
		        name:fianl[i].qylxmc,
		        value:fianl[i].ylje
		      })
		     $('#legend01').append("<li class='li0"+(i+1)+ "'><span class='icon icon0"+(i+1)+"'"+"></span> <span class='name'>"+fianl[i].qylxmc+"</span> <span id='id2"+(i+1)+"' class='num'></span> </li>");
	    
	      $('#id2' + (i+1)).html(''); 
		 $('#id2' + (i+1)).html(fianl[i].ylje+'万元');
		  
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
		        color : [ '#88CA6D', '#0DAEF1', '#1572D5' ],
		        series: [
		            {
		                name: '医保类型人次及消费金额分析',
		                type: 'pie',
		                hoverOffset: 4,
		                center: ["35%", "48%"],
		                radius: ['35%', '56%'],
		                label: {
		                    show: false
		                },
		                labelLine: {
		                    show: false,
		                    length: 11,
		                    length2: 12
		                },
		                data:  datass,
		                emphasis: {
		                    label: {
		                        show: true,
		                        fontSize: 18,
		                        formatter: function (params) {
		                            return '{a|' + params.name + '}\n' + (params.percent).toFixed(2) + '%'
		                        },
		                        rich: {
		                            a: {
		                                fontSize: 15,
		                                color: '#333333',
		                                padding: [6, 0, 0, 0]
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
		getecharsAll('','','','',qylx[params.dataIndex],qylxmc[params.dataIndex],kssj,jssj);            
		    });  
		    return myChart	
	}
   
  };
  

</script>
<script type="text/javascript">
function chart02(id,jglx3,jglxmc3,rs3,fian,qylx,qylxmc,kssj,jssj,bz) {
	
	 $('#legend02').html(""); 
	if(bz=='rc'){
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
		    
		    $('#legend02').append("<li class='li0"+(i+1)+ "'><span class='icon icon0"+(i+1)+"'"+"></span> <span class='name'>"+fian[i].jglxmc+"</span> <span id='idjglx"+(i+1)+"' class='num'></span> </li>");
			    
			      $('#idjglx' + (i+1)).html('');
				 $('#idjglx' + (i+1)).html(fian[i].rs+'人');
		    
		    
		 
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
		      color : [ '#768BF1', '#4D9EF9', '#744EBC' ],
		      series: [
		          {
		              name: '机构类型人次及消费金额分析',
		              type: 'pie',
		              hoverOffset: 4,
		              center: ["35%", "48%"],
		              radius: ['35%', '56%'],
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
		                          return '{a|' + params.name + '}\n' + (params.percent).toFixed(2) + '%'
		                      },
		                      rich: {
		                          a: {
		                              fontSize: 15,
		                              color: '#333333',
		                              padding: [6, 0, 0, 0]
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
		  getecharsAll('','',jglx3[params.dataIndex],jglxmc3[params.dataIndex],qylx,qylxmc,kssj,jssj);            
		    }); 
		  return myChart
	}else{
		 $('#legend02').html(""); 
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
		    $('#legend02').append("<li class='li0"+(i+1)+ "'><span class='icon icon0"+(i+1)+"'"+"></span> <span class='name'>"+fian[i].jglxmc+"</span> <span id='idjglx2"+(i+1)+"' class='num'></span> </li>");
			    
			      $('#idjglx2' + (i+1)).html('');
				 $('#idjglx2' + (i+1)).html(fian[i].ylje+'万元');
		    
		    
		  }
		 
		  var myChart = echarts.init(document.getElementById(id));
		  var option = {
		      tooltip: {
		          trigger: 'axis',
		          axisPointer: {
		              type: 'shadow'
		          }
		      },
		      color : [ '#768BF1', '#4D9EF9', '#744EBC' ],
		      series: [
		          {
		              name: '机构类型人次及消费金额分析',
		              type: 'pie',
		              hoverOffset: 4,
		              center: ["35%", "48%"],
		              radius: ['35%', '56%'],
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
		                          return '{a|' + params.name + '}\n' + (params.percent).toFixed(2) + '%'
		                      },
		                      rich: {
		                          a: {
		                              fontSize: 15,
		                              color: '#333333',
		                              padding: [6, 0, 0, 0]
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
	  getecharsAll('','',jglx3[params.dataIndex],jglxmc3[params.dataIndex],qylx,qylxmc,kssj,jssj);            
	    }); 
		  return myChart	
	}
 
   
	 
	};

 
</script>
<script type="text/javascript">
function chart03(id,jbdm5,jbmc5,rs5,fian,jglx,jglxmc,qylx,qylxmc,kssj,jssj,bz) {
	 $('#legend03').html("");
	 if(bz=="rc"){
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
		    
		     $('#legend03').append("<li class='li0"+(i+1)+ "'><span class='icon icon0"+(i+1)+"'"+"></span> <span class='name'>"+fian[i].jbmc+"</span> <span id='idjb"+(i+1)+"' class='num'></span> </li>");
	    
	      $('#idjb' + (i+1)).html(''); 
		 $('#idjb' + (i+1)).html(fian[i].rs+'人');
		   
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
		      color : [ '#88CA6D', '#3AA873', '#008B72' ,'#2DC6F2','#0DAEF1','#1572D5','#3140B1',''],
		      series: [
		          {
		              name: '级别人次及消费金额分析',
		              type: 'pie',
		              hoverOffset: 4,
		              center: ["35%", "48%"],
		              radius: ['35%', '56%'],
		              label: {
		                  show: false
		              },
		              labelLine: {
		                  show: false,
		                  length: 11,
		                  length2: 12
		              },
		              data: datass ,
		              emphasis: {
		                  label: {
		                      show: true,
		                      fontSize: 18,
		                      formatter: function (params) {
		                          return '{a|' + params.name + '}\n' + (params.percent).toFixed(2) + '%'
		                      },
		                      rich: {
		                          a: {
		                              fontSize: 15,
		                              color: '#333333',
		                              padding: [6, 0, 0, 0]
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
		   getecharsAll(jbdm5[params.dataIndex],jbmc5[params.dataIndex],jglx,jglxmc,qylx,qylxmc,kssj,jssj);    
		            }); 
		  return myChart	 
	 }else{ 
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
		    $('#legend03').append("<li class='li0"+(i+1)+ "'><span class='icon icon0"+(i+1)+"'"+"></span> <span class='name'>"+fian[i].jbmc+"</span> <span id='idjb"+(i+1)+"' class='num'></span> </li>");
		    
		      $('#idjb' + (i+1)).html(''); 
			 $('#idjb' + (i+1)).html(fian[i].ylje+'万元');  
		  }
		  
		  var myChart = echarts.init(document.getElementById(id));
		  var option = {
		      tooltip: {
		          trigger: 'axis',
		          axisPointer: {
		              type: 'shadow'
		          }
		      },
		      color : [ '#88CA6D', '#3AA873', '#008B72' ,'#2DC6F2','#0DAEF1','#1572D5','#3140B1',''],
		      series: [
		          {
		              name: '级别人次及消费金额分析',
		              type: 'pie',
		              hoverOffset: 4,
		              center: ["35%", "48%"],
		              radius: ['35%', '56%'],
		              label: {
		                  show: false
		              },
		              labelLine: {
		                  show: false,
		                  length: 11,
		                  length2: 12
		              },
		              data: datass ,
		              emphasis: {
		                  label: {
		                      show: true,
		                      fontSize: 18,
		                      formatter: function (params) {
		                          return '{a|' + params.name + '}\n' + (params.percent).toFixed(2) + '%'
		                      },
		                      rich: {
		                          a: {
		                              fontSize: 15,
		                              color: '#333333',
		                              padding: [6, 0, 0, 0]
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
		  		 getecharsAll(jbdm5[params.dataIndex],jbmc5[params.dataIndex],jglx,jglxmc,qylx,qylxmc,kssj,jssj);    
	            }); 
		  return myChart 
	 }
	 
	};
	 
</script>
<script type="text/javascript">
function chart04(id,rs,yljgmc,jbmc,jglxmc,qylxmc) {
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
	      },
	      grid: {
	          containLabel: true,
	          top: '17%',
	          right: '4%',
	          left: '4%',
	          bottom: '6%'
	      },
	      yAxis: [{
	          name: '万人',
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
	              interval:0,
	              color: fontColor,
	              textStyle: {
	                  fontSize: 12
	              },
	              formatter:function(params){
	                
	                var str1 = params.split('');
	                str1.splice(4,0,"\n");
	                return str1.join('');
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
	              name: '人次分布图',
	              type: 'bar',
	              barWidth: 24,
	              data: rs,
	              stack: true,
	              itemStyle: {
	                  color: '#4D9EF9'
	              }
	          }
	      ]
	  };
	  myChart.setOption(option)
	  return myChart
	};
function chart04bf(id,rs,yljgmc,jbmc,jglxmc,qylxmc){
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
	      },
	      grid: {
	          containLabel: true,
	          top: '17%',
	          right: '4%',
	          left: '4%',
	          bottom: '6%'
	      },
	      yAxis: [{
	          name: '万人',
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
	              interval:0,
	              color: fontColor,
	              textStyle: {
	                  fontSize: 12
	              },
	              formatter:function(params){
	                
	                var str1 = params.split('');
	                str1.splice(4,0,"\n");
	                return str1.join('');
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
	              name: '人次分布图',
	              type: 'bar',
	              barWidth: 24,
	              data: rs,
	              stack: true,
	              itemStyle: {
	                  color: '#4D9EF9'
	              }
	          }
	      ]
	  };
	  myChart.setOption(option)
	  return myChart
}
function chart04bf2(id,rs,yljgmc,jbmc,jglxmc,qylxmc){
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
	      },
	      grid: {
	          containLabel: true,
	          top: '17%',
	          right: '4%',
	          left: '4%',
	          bottom: '6%'
	      },
	      yAxis: [{
	          name: '万人',
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
	              interval:0,
	              color: fontColor,
	              textStyle: {
	                  fontSize: 12
	              },
	              formatter:function(params){
	                
	                var str1 = params.split('');
	                str1.splice(4,0,"\n");
	                return str1.join('');
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
	              name: '人次分布图',
	              type: 'bar',
	              barWidth: 24,
	              data: rs,
	              stack: true,
	              itemStyle: {
	                  color: '#4D9EF9'
	              }
	          }
	      ]
	  };
	  myChart.setOption(option)
	  return myChart
}

</script>
<script type="text/javascript">
function chart05(id,rs,yljgmc,jbmc,jglxmc,qylxmc) {
	  var myChart = echarts.init(document.getElementById(id));
	  var data =  rs;
	    var dataShadow = [];
	    for(var i = 0; i < data.length; i++){
	    	 dataShadow.push(parseInt(data[i])+300);
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
	          left: -100,
	          bottom: '8%'
	      },
	      legend: {
	          itemWidth: 12,
	          itemHeight: 12,
	          data: ['金额分布图'],
	          top: '4%',
	          right: '8%'
	      },
	      yAxis: [
	    	  
	          {
	              type: "category",
	              axisLabel: {
	                  color: '#333333',
	                  interval: 0,
	                  margin: 117,
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
	                      color: '#D6D6D6',
	                  }
	              },
	              data: yljgmc,
	              splitArea: {
	                  show: false
	              },
	              inverse: true
	          }],
	      xAxis: [{
	          type: 'value',
	          name: "万",
	          nameGap: 7,
	          nameTextStyle: {
	              color: '#646464',
	              fontSize: 14
	          },
	          axisLine: {
	              show: true,
	              lineStyle: {
	                  color: '#D6D6D6',
	              }
	          },
	          axisTick: {
	              show: false
	          },
	          axisLabel: {
	              margin: 10,
	              color: '#000000',
	              textStyle: {
	                  fontSize: 13
	              },
	              formatter: function (params) {
	                  return (params)
	              }
	          },
	          splitLine: {
	              show: true,
	              lineStyle:{
	                type:"dashed"
	              }          
	          },
	      }],
	      series: [
	          {
	              name: '金额分布图',
	              type: 'bar',
	              data: rs,
	              barWidth: 14,
	              itemStyle: {
	                color: new echarts.graphic.LinearGradient(0, 0, 0, 1, [{
	                  offset: 0,
	                  color: '#11B7DB'
	              }, {
	                  offset: 1,
	                  color: '#3EDED7'
	              }]),

	              },
	              label: {
	                  show: false,
	              }
	          },
	          {
	              name: '',
	              type: 'bar',
	              data: dataShadow,
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
 function chart08(id,rs,yljgmc,jbmc,jglxmc,qylxmc){
	 var myChart = echarts.init(document.getElementById(id));
	  var data =  rs;
	    var dataShadow = [];
	    for(var i = 0; i < data.length; i++){
	    	 dataShadow.push(parseInt(data[i])+300);
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
	          left: -100,
	          bottom: '8%'
	      },
	      legend: {
	          itemWidth: 12,
	          itemHeight: 12,
	          data: ['金额分布图'],
	          top: '4%',
	          right: '8%'
	      },
	      yAxis: [
	          {
	              type: "category",
	              axisLabel: {
	                  color: '#333333',
	                  interval: 0,
	                  margin: 117,
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
	                      color: '#D6D6D6',
	                  }
	              },
	              data: yljgmc,
	              splitArea: {
	                  show: false
	              },
	              inverse: true
	          }],
	      xAxis: [{
	          type: 'value',
	          name: "万",
	          nameGap: 7,
	          nameTextStyle: {
	              color: '#646464',
	              fontSize: 14
	          },
	          axisLine: {
	              show: true,
	              lineStyle: {
	                  color: '#D6D6D6',
	              }
	          },
	          axisTick: {
	              show: false
	          },
	          axisLabel: {
	              margin: 10,
	              color: '#000000',
	              textStyle: {
	                  fontSize: 13
	              },
	              formatter: function (params) {
	                  return (params)
	              }
	          },
	          splitLine: {
	              show: true,
	              lineStyle:{
	                type:"dashed"
	              }          
	          },
	      }],
	      series: [
	          {
	              name: '金额分布图',
	              type: 'bar',
	              data: rs,
	              barWidth: 14,
	              itemStyle: {
	                color: new echarts.graphic.LinearGradient(0, 0, 0, 1, [{
	                  offset: 0,
	                  color: '#11B7DB'
	              }, {
	                  offset: 1,
	                  color: '#3EDED7'
	              }]),

	              },
	              label: {
	                  show: false,
	              }
	          },
	          {
	              name: '',
	              type: 'bar',
	              data: dataShadow,
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
}
 function chart09(id,rs,yljgmc,jbmc,jglxmc,qylxmc){

	 var myChart = echarts.init(document.getElementById(id));
	  var data =  rs;
	    var dataShadow = [];
	    for(var i = 0; i < data.length; i++){
	    	 dataShadow.push(parseInt(data[i])+300);
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
	          left: -100,
	          bottom: '8%'
	      },
	      legend: {
	          itemWidth: 12,
	          itemHeight: 12,
	          data: ['金额分布图'],
	          top: '4%',
	          right: '8%'
	      },
	      yAxis: [
	          {
	              type: "category",
	              axisLabel: {
	                  color: '#333333',
	                  interval: 0,
	                  margin: 117,
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
	                      color: '#D6D6D6',
	                  }
	              },
	              data: yljgmc,
	              splitArea: {
	                  show: false
	              },
	              inverse: true
	          }],
	      xAxis: [{
	          type: 'value',
	          name: "万",
	          nameGap: 7,
	          nameTextStyle: {
	              color: '#646464',
	              fontSize: 14
	          },
	          axisLine: {
	              show: true,
	              lineStyle: {
	                  color: '#D6D6D6',
	              }
	          },
	          axisTick: {
	              show: false
	          },
	          axisLabel: {
	              margin: 10,
	              color: '#000000',
	              textStyle: {
	                  fontSize: 13
	              },
	              formatter: function (params) {
	                  return (params)
	              }
	          },
	          splitLine: {
	              show: true,
	              lineStyle:{
	                type:"dashed"
	              }          
	          },
	      }],
	      series: [
	          {
	              name: '金额分布图',
	              type: 'bar',
	              data: rs,
	              barWidth: 14,
	              itemStyle: {
	                color: new echarts.graphic.LinearGradient(0, 0, 0, 1, [{
	                  offset: 0,
	                  color: '#11B7DB'
	              }, {
	                  offset: 1,
	                  color: '#3EDED7'
	              }]),

	              },
	              label: {
	                  show: false,
	              }
	          },
	          {
	              name: '',
	              type: 'bar',
	              data: dataShadow,
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
 }
</script>
<script type="text/javascript">
function chart06(id,rs,mzrc,zyrc,rq,jbmc,jglxmc,qylxmc) {
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
	          // formatter: function (params) {
	          //     return '人口年龄：' + params[0].axisValue + '<br/>' + params[0].seriesName + '：' + params[0].data + '人<br/>' + params[1].seriesName + '：' + params[1].data + '人'
	          // },
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
	                  name: "总人次",
	              },
	              {
	                  name: "门诊人次",
	              },
	              {
	                  name: "住院人次",
	              }
	          ]
	      },
	      grid: {
	          containLabel: true,
	          top: '17%',
	          right: '6%',
	          left: '4%',
	          bottom: '5%'
	      },
	      yAxis: [{
	          name: '万人',
	          nameGap: 10,
	          nameTextStyle: {
	              color: fontColor,
	              fontSize: 12
	          },
	          axisLabel: {
	              color: fontColor,
	              fontSize: 12,
	              formatter: function (params) {
	                  return (params)
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
	              name: '总人次',
	              type: 'line',
	              data: rs,
	              symbolSize: 8,
	              smooth: true,
	              zlevel: 2,
	              itemStyle: {
	                  color: '#768BF1'
	              },
	              areaStyle: {
	                  color: 'rgba(118, 139, 241,.3)'
	              }
	          }, {
	              name: '门诊人次',
	              type: 'line',
	              data: mzrc,
	              symbolSize: 8,
	              smooth: true,
	              zlevel: 2,
	              itemStyle: {
	                  color: '#00BB61'
	              },
	              areaStyle: {
	                  color: 'rgba(97,168,255,.3)'
	              }
	          }, {
	              name: '住院人次',
	              type: 'line',
	              data: zyrc,
	              symbolSize: 8,
	              smooth: true,
	              zlevel: 2,
	              itemStyle: {
	                  color: '#3083FF'
	              },
	              areaStyle: {
	                  color: 'rgba(97,168,255,.3)'
	              }
	          },
	      ]
	  };
	  myChart.setOption(option)
	  return myChart
	};

	function chart07(id,zje,mzje,zyje,rq,jbmc,jglxmc,qylxmc) {
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
	          // formatter: function (params) {
	          //     return '人口年龄：' + params[0].axisValue + '<br/>' + params[0].seriesName + '：' + params[0].data + '人<br/>' + params[1].seriesName + '：' + params[1].data + '人'
	          // },
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
	                  name: "总金额",
	              },
	              {
	                  name: "门诊金额",
	              },
	              {
	                  name: "住院金额",
	              }
	          ]
	      },
	      grid: {
	          containLabel: true,
	          top: '17%',
	          right: '6%',
	          left: '4%',
	          bottom: '5%'
	      },
	      yAxis: [{
	          name: '万元',
	          nameGap: 10,
	          nameTextStyle: {
	              color: fontColor,
	              fontSize: 12
	          },
	          axisLabel: {
	              color: fontColor,
	              fontSize: 12,
	              formatter: function (params) {
	                  return (params )
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
	              name: '总金额',
	              type: 'line',
	              data: zje,
	              symbolSize: 8,
	              smooth: true,
	              zlevel: 2,
	              itemStyle: {
	                  color: 'rgba(13, 174, 241, 1)'
	              },
	              areaStyle: {
	                  color: 'rgba(13, 174, 241,.3)'
	              }
	          }, {
	              name: '门诊金额',
	              type: 'line',
	              data:mzje,
	              symbolSize: 8,
	              smooth: true,
	              zlevel: 2,
	              itemStyle: {
	                  color: 'rgba(38, 130, 0, 1)'
	              },
	              areaStyle: {
	                  color: 'rgba(38, 130, 0, .3)'
	              }
	          }, {
	              name: '住院金额',
	              type: 'line',
	              data: zyje,
	              symbolSize: 8,
	              smooth: true,
	              zlevel: 2,
	              itemStyle: {
	                  color: 'rgba(21, 114, 213, 1)'
	              },
	              areaStyle: {
	                  color: 'rgba(21, 114, 213, .3)'
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
	<!-- 头部 start-->
	<div class="headBox"></div>
	<!-- 头部 end-->

	<div class="main mainThree">
		<div class="top clearfix">
			<div class="topLeft">
				<span class="det"> <span class="sj sjKs">
						<ul id="sjxzid">
							<i value="year" class="n " onclick="sjxz('year')">年</i>
							<i value="month" class="y" onclick="sjxz('month')">月</i>
							<i value="all" class="all active"  onclick="sjxz('all')">全部</i>
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
		<div class="botCon">
            <ul class="detail clearfix">
                <li class="mode mode01">
                    <div class="modeBg">
                        <div class="modeTop">
                            <div class="title clearfix">
                              <i></i>
                              <label for="">医保类型人次及消费金额分析</label>
                              <div class="tabTop">
                                  
                                  <span class='ss' id="top1"onclick='ybEchars("je")'>金额</span>
                              </div>
                              <div class="tabTop"> 
                                  <span class="active" id="top0" onclick='ybEchars("rc")'>人次</span>
                              </div>
                              
                            </div>
                        </div>
                        <div class="modeCon clearfix">
                          <div class="part-content part-content1">
                            <div class="chart chart01" id="chart01"></div>
                            <ul class="legend-list" id='legend01'></ul>
                          </div>

                        </div>
                    </div>
                </li>
                <li class="mode mode02">
                    <div class="modeBg">
                        <div class="modeTop">
                            <div class="title clearfix">
                              <i></i>
                              <label for="">机构类型人次及消费金额分析</label>
                              <div class="tabTop">
                                  
                                  <span class='ss' id="top4"onclick='getechars04("","")'>金额</span>
                              </div>
                              <div class="tabTop"> 
                                  <span class="active" id="top3" onclick='getechars03("","")'>人次</span>
                              </div>
                            </div>
                        </div>
                        <div class="modeCon clearfix">
                          <div class="part-content part-content1">
                            <div class="chart chart02" id="chart02"></div>
                            <ul class="legend-list" id='legend02'></ul>
                          </div> 
                        </div>
                    </div>
                </li>
                <li class="mode mode03">
                    <div class="modeBg">
                        <div class="modeTop">
                            <div class="title clearfix">
                              <i></i>
                              <label for="">级别人次及消费金额分析</label>
                              <div class="tabTop">
                                  
                                  <span class='ss' id="top6"onclick='getechars06("","","","")'>金额</span>
                              </div>
                              <div class="tabTop"> 
                                  <span class="active" id="top5" onclick='getechars05("","","","")'>人次</span>
                              </div>
                            </div>
                        </div>
                        <div class="modeCon clearfix">
                          <div class="part-content part-content1">
                            <div class="chart chart03" id="chart03"></div>
                            <ul class="legend-list legend-list3" id='legend03'> </ul>
                          </div>
                           
                        </div>
                    </div>
                </li>
                <li class="mode mode04">
                    <div class="modeBg">
                        <div class="modeTop">
                            <div class="title clearfix">
                              <i></i>
                              <label for="">人次分布图</label>
                              <div class="tabTop">
                                  <span class="active">总人次</span>
                                  <span >门诊人次</span>
                                  <span>住院人次</span>
                              </div>
                            </div>
                        </div>
                        <div class="modeCon clearfix">
                          <div class="part-content part-content1">
                            <div class="chart chart04" id="chart04"></div>
                          </div>
                          <div class="part-content">
                            <div class="chart chart04bf" id="chart04bf"></div>
                          </div>
                          <div class="part-content">
                            <div class="chart chart04bf2" id="chart04bf2"></div>
                          </div>
                        </div>
                    </div>
                </li>
                <li class="mode mode05">
                    <div class="modeBg">
                        <div class="modeTop">
                            <div class="title clearfix">
                              <i></i>
                              <label for="">金额分布图</label>
                              <div class="tabTop">
                                  <span class="active">总金额</span>
                                  <span>门诊金额</span>
                                  <span>住院金额</span>
                              </div>
                            </div>
                        </div>
                        <div class="modeCon clearfix">
                          <div class="part-content part-content1">
                            <div class="chart chart05" id="chart05"></div>
                          </div>
                          <div class="part-content">
                            <div class="chart chart08" id="chart08"></div>
                          </div>
                          <div class="part-content">
                            <div class="chart chart09" id="chart09"></div>
                          </div>
                        </div>
                    </div>
                </li>
                <li class="mode mode06">
                    <div class="modeBg">
                        <div class="modeTop">
                            <div class="title clearfix">
                              <i></i>
                              <label for="">参保人员诊疗人次趋势</label>
                            </div>
                        </div>
                        <div class="modeCon clearfix">
                          <div class="chart chart06" id="chart06"></div>
                        </div>
                    </div>
                </li>
                <li class="mode mode07">
                    <div class="modeBg">
                        <div class="modeTop">
                            <div class="title clearfix">
                              <i></i>
                              <label for="">参保人员诊疗金额趋势</label>
                            </div>
                        </div>
                        <div class="modeCon clearfix">
                          <div class="chart chart07" id="chart07"></div>
                        </div>
                    </div>
                </li>
            </ul>
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
<script type="text/javascript">
$(function () {
	  
	  
	 
	  var chartInit04 = chart04('chart04','','','','','');
	  var chartInit04bf = chart04bf('chart04bf','','','','','');
	  var chartInit04bf2 = chart04bf2('chart04bf2','','','','','');
	  var chartInit05 = chart05('chart05','','','','','');
	   var chartInit08 = chart08('chart08','','','','',''); 
	   var chartInit09 = chart09('chart09','','','','',''); 
	  $(".mode .tabTop span").click(function(){
	    $(this).parent().find('span').removeClass("active");
	    $(this).addClass('active');
	    var index = $(this).index();
	    
	    $(this).parent().parent().parent().parent().find(".part-content").hide();
	    $(this).parent().parent().parent().parent().find(".part-content").eq(index).show();
	    
	    
	     
	    chartInit04.resize();
	    chartInit04bf.resize();
	    chartInit04bf2.resize();
	    chartInit05.resize();
	    chartInit08.resize();
	    chartInit09.resize();
	  })

	  var swiper = new Swiper('.mode05 .swiper-container', {
	    pagination: {
	      el: '.mode05 .swiper-pagination',
	    },
	    on: {
	    resize: function(){
	      chartInit05.resize();
	      chartInit08.resize();
     }, 
	  },
	  });

	  function gl(el){
	    //默认其中一个高亮
	    el.dispatchAction({
	    type: 'highlight',
	    dataIndex: 0,
	  });

	  //离开其中一个模块高亮取消，默认第一块高亮
	  el.on("mouseout", function (params) {
	    
	    el.dispatchAction({
	      type: 'downplay',
	      dataIndex: params.dataIndex,
	    });
	    el.dispatchAction({
	      type: 'highlight',
	      dataIndex: 0,
	    });
	  });
	  //鼠标移入此模块高亮，之前的模块高亮取消
	  el.on("mouseover", function (params) {
	    el.dispatchAction({
	      type: 'highlight',
	      dataIndex: params.dataIndex,
	    });
	    el.dispatchAction({
	      type: 'downplay',
	      dataIndex: params.dataIndex == 0 ? 1 : 0,
	    });
	  });
	  };

	  
	   

	  $(window).resize(function () {
	      chartInit01.resize();
	      chartInit01bf.resize();
	     
	  });

	});
</script>
 
</html>